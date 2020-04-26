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
                                            
                                        ;---------------------------------------
                                        ;  data stack macros 
                                        ;---------------------------------------
                                 
                                        
                                            ; move dp up 1 element 
                                            .macro _dp_up 
                                        
                                            ;move dp down 1 element
                                            .macro _dp_down 
                                        
                                            ; load X register with 
                                            ; entry point of dictionary
                                            ; before calling 'search_dict'
                                            .macro _ldx_dict dict_name
                                        
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                                     40     .area DATA 
                                     41 ;--------------------------------------	
                                     42 
                           000050    43 	TIB_SIZE=80
                           000028    44     PAD_SIZE=40
                           000020    45 	DSTACK_SIZE=32 
                           000080    46 	STACK_SIZE=128
                           0017FF    47 	STACK_EMPTY=RAM_SIZE-1  
                           000000    48 	FRUN=0 ; flags run code in variable flags
                           000001    49 	FTRAP=1 ; inside trap handler 
                           000002    50 	FLOOP=2 ; FOR loop in preparation 
                           000003    51 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    52 	FBREAK=4 ; break point flag 
                           000005    53 	FCOMP=5  ; compiling flags 
                                     54 
                           004000    55 	AUTORUN_NAME=0x4000 ; address in EEPROM where auto run file name is saved 
                                     56 
                           000006    57     FIRST_DATA_ITEM=6 ; first DATA item offset on line.
                                     58 
      000001                         59 in.w:  .blkb 1 ; parser position in text line
      000002                         60 in:    .blkb 1 ; low byte of in.w
      000003                         61 in.saved: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000004                         62 count: .blkb 1 ; current BASIC line length and tib text length  
      000005                         63 basicptr:  .blkb 2  ; point to current BASIC line address.
      000007                         64 data_ptr:  .blkw 1  ; point to DATA address
      000009                         65 data_ofs:  .blkb 1  ; index to next data item 
      00000A                         66 data_len:  .blkb 1  ; length of data line 
      00000B                         67 base:  .blkb 1 ; nemeric base used to print integer 
      00000C                         68 acc24: .blkb 1 ; 24 bit accumulator
      00000D                         69 acc16: .blkb 1 ; 16 bit accumulator, middle byte of acc24
      00000E                         70 acc8:  .blkb 1 ;  8 bit accumulator, least byte of acc24 
      00000F                         71 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000011                         72 timer: .blkw 1 ;  milliseconds count down timer 
      000013                         73 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000015                         74 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000017                         75 farptr: .blkb 1 ; 24 bits pointer used by file system
      000018                         76 ptr16:  .blkb 1 ; 16 bits pointer ,  middle byte of farptr
      000019                         77 ptr8:   .blkb 1 ; 8 bits pointer, least byte of farptr 
      00001A                         78 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001D                         79 dstkptr: .blkw 1  ; data stack pointer 
      00001F                         80 txtbgn: .blkw 1 ; tokenized BASIC text beginning address 
      000021                         81 txtend: .blkw 1 ; tokenized BASIC text end address 
      000023                         82 loop_depth: .blkb 1 ; level of nested loop. Conformity check   
      000024                         83 array_size: .blkw 1 ; array size, free RAM left after BASIC code.  
      000026                         84 flags: .blkb 1 ; various boolean flags
      000027                         85 tab_width: .blkb 1 ; print colon width (4)
      000028                         86 rx_char: .blkb 1 ; last received character 
      000029                         87 vars: .blkw 26 ; BASIC variables A-Z, keep it as but last .
                                     88 ; keep as last variable 
      00005D                         89 free_ram: ; from here RAM free for BASIC text 
                                     90 
                                     91 ;-----------------------------------
                                     92     .area SSEG (ABS)
                                     93 ;-----------------------------------
                                     94 ;;;; working buffers and stacks at end of RAM. 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      0016E8                         95     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE-DSTACK_SIZE 
      0016E8                         96 tib: .ds TIB_SIZE             ; transaction input buffer
      001738                         97 pad: .ds PAD_SIZE             ; working buffer
      001760                         98 dstack: .ds DSTACK_SIZE 	  ; data stack used by FOR...NEXT, and func/proc arguments  
      001780                         99 dstack_empty: ; dstack underflow ; data stack bottom 
      001780                        100 stack_full: .ds STACK_SIZE   ; control stack 
      001800                        101 stack_unf: ; stack underflow ; control_stack bottom 
                                    102 
                                    103 ;--------------------------------------
                                    104     .area HOME 
                                    105 ;--------------------------------------
      008000 82 00 85 54            106     int cold_start			; RESET vector 
                           000000   107 .if DEBUG
                                    108 	int TrapHandler 		;TRAP  software interrupt
                           000001   109 .else
      008004 82 00 80 80            110 	int NonHandledInterrupt ;TRAP  software interrupt
                                    111 .endif
      008008 82 00 80 80            112 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 81            113 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 80            114 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 80            115 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 80            116 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 80            117 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 80            118 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 BC            119 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 80            120 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 80            121 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 80            122 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 80            123 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 80            124 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 80            125 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 80            126 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 80            127 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 80            128 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 80            129 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 8F            130 	int Uart1RxHandler		;int18 UART1 RX full ; user communication channel.
      008054 82 00 80 80            131 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 80            132 	int NonHandledInterrupt ;int20 UART1 TX completed
      00805C 82 00 80 80            133 	int NonHandledInterrupt ;int21 UART1 RX full
      008060 82 00 80 80            134 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 A6            135 	int Timer4UpdateHandler	;int23 TIM4 update/overflow ; used as msec ticks counter
      008068 82 00 80 80            136 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 80            137 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 80            138 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 80            139 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 80            140 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 80            141 	int NonHandledInterrupt ;int29  not used
                                    142 
                                    143 ;---------------------------------------
                                    144     .area CODE
                                    145 ;---------------------------------------
                           000000   146 .if DEBUG
                                    147 .asciz "STM8_TBI" ; I like to put module name here.
                                    148 .endif 
                                    149 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    150 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    151 ; non handled interrupt 
                                    152 ; reset MCU
                                    153 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008080                        154 NonHandledInterrupt:
      008080 71                     155     .byte 0x71  ; invalid opcode reinitialize MCU
                                    156 
                                    157 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    158 ; auto wakeup from halt
                                    159 ; at iret, program continue 
                                    160 ; after hatl instruction
                                    161 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008081                        162 AWUHandler:
      008081 72 19 50 F0      [ 1]  163 	bres AWU_CSR,#AWU_CSR_AWUEN
      008085 55 00 3F 50 F1   [ 1]  164 	mov AWU_APR,0x3F
      00808A 72 5F 50 F2      [ 1]  165 	clr AWU_TBR 
      00808E 80               [11]  166 	iret
                                    167 
                                    168 ;--------------------------
                                    169 ; UART1 receive character
                                    170 ; CTRL-C (ASCII 3)
                                    171 ; cancel program execution
                                    172 ; and fall back to command line
                                    173 ;--------------------------
      00808F                        174 Uart1RxHandler:
      00808F 72 0B 52 30 FB   [ 2]  175 	btjf UART1_SR,#UART_SR_RXNE,.
      008094 C6 52 31         [ 1]  176 	ld a,UART1_DR 
      008097 A1 03            [ 1]  177 	cp a,#CTRL_C 
      008099 26 07            [ 1]  178 	jrne 1$
      00809B 72 5F 00 28      [ 1]  179 	clr rx_char 
      00809F CC 80 CF         [ 2]  180 	jp user_interrupted
      0080A2                        181 1$:
      0080A2 C7 00 28         [ 1]  182 	ld rx_char,a 	
      0080A5 80               [11]  183 	iret 
                                    184 
                                    185 ;------------------------------------
                                    186 ; software interrupt handler  
                                    187 ;------------------------------------
                           000000   188 .if DEBUG 
                                    189 TrapHandler:
                                    190 	bset flags,#FTRAP 
                                    191 	call print_registers
                                    192 	call cmd_itf
                                    193 	bres flags,#FTRAP 	
                                    194 	iret
                                    195 .endif 
                                    196 
                                    197 ;------------------------------
                                    198 ; TIMER 4 is used to maintain 
                                    199 ; a milliseconds 'ticks' counter
                                    200 ; and decrement 'timer' varaiable
                                    201 ;--------------------------------
      0080A6                        202 Timer4UpdateHandler:
      0080A6 72 5F 53 42      [ 1]  203 	clr TIM4_SR 
      0080AA CE 00 0F         [ 2]  204 	ldw x,ticks
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080AD 5C               [ 2]  205 	incw x
      0080AE CF 00 0F         [ 2]  206 	ldw ticks,x 
      0080B1 CE 00 11         [ 2]  207 	ldw x,timer
      0080B4 5D               [ 2]  208 	tnzw x 
      0080B5 27 04            [ 1]  209 	jreq 1$
      0080B7 5A               [ 2]  210 	decw x 
      0080B8 CF 00 11         [ 2]  211 	ldw timer,x 
      0080BB                        212 1$:	
      0080BB 80               [11]  213 	iret 
                                    214 
                                    215 
                                    216 ;------------------------------------
                                    217 ; Triggered by pressing USER UserButton 
                                    218 ; on NUCLEO card.
                                    219 ; This is used to abort a progam lock 
                                    220 ; in infinite loop. 
                                    221 ;------------------------------------
      0080BC                        222 UserButtonHandler:
                                    223 ; wait button release
      0080BC 5F               [ 1]  224 	clrw x
      0080BD 5A               [ 2]  225 1$: decw x 
      0080BE 26 FD            [ 1]  226 	jrne 1$
      0080C0 72 09 50 15 F8   [ 2]  227 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    228 ; if MCU suspended by SLEEP resume program
      0080C5 72 07 00 26 05   [ 2]  229     btjf flags,#FSLEEP,2$
      0080CA 72 17 00 26      [ 1]  230 	bres flags,#FSLEEP 
      0080CE 80               [11]  231 	iret
      0080CF                        232 2$:	
      0080CF                        233 user_interrupted:
      0080CF 72 00 00 26 02   [ 2]  234     btjt flags,#FRUN,4$
      0080D4 20 13            [ 2]  235 	jra UBTN_Handler_exit 
      0080D6                        236 4$:	; program interrupted by user 
      0080D6 72 11 00 26      [ 1]  237 	bres flags,#FRUN 
      0080DA AE 80 F1         [ 2]  238 	ldw x,#USER_ABORT
      0080DD CD 82 46         [ 4]  239 	call puts 
      0080E0 CE 00 05         [ 2]  240 	ldw x,basicptr 
      0080E3 C6 00 02         [ 1]  241 	ld a,in 
      0080E6 CD 92 C6         [ 4]  242 	call prt_basic_line
      0080E9                        243 UBTN_Handler_exit:
      0080E9 AE 17 FF         [ 2]  244     ldw x,#STACK_EMPTY 
      0080EC 94               [ 1]  245     ldw sp,x
      0080ED 9A               [ 1]  246 	rim 
      0080EE CC 87 D5         [ 2]  247 	jp warm_start
                                    248 
      0080F1 0A 50 72 6F 67 72 61   249 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    250 
                                    251 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    252 ;    peripherals initialization
                                    253 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    254 
                                    255 ;----------------------------------------
                                    256 ; inialize MCU clock 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    257 ; input:
                                    258 ;   A 		source  HSI | 1 HSE 
                                    259 ;   XL      CLK_CKDIVR , clock divisor 
                                    260 ; output:
                                    261 ;   none 
                                    262 ;----------------------------------------
      00810C                        263 clock_init:	
      00810C C1 50 C3         [ 1]  264 	cp a,CLK_CMSR 
      00810F 27 0C            [ 1]  265 	jreq 2$ ; no switching required 
                                    266 ; select clock source 
      008111 72 12 50 C5      [ 1]  267 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008115 C7 50 C4         [ 1]  268 	ld CLK_SWR,a
      008118 C1 50 C3         [ 1]  269 1$:	cp a,CLK_CMSR
      00811B 26 FB            [ 1]  270 	jrne 1$
      00811D                        271 2$: 	
                                    272 ; HSI and cpu clock divisor 
      00811D 9F               [ 1]  273 	ld a,xl 
      00811E C7 50 C6         [ 1]  274 	ld CLK_CKDIVR,a  
      008121 81               [ 4]  275 	ret
                                    276 
                                    277 ;----------------------------------
                                    278 ; TIMER2 used as audio tone output 
                                    279 ; on port D:5.
                                    280 ; channel 1 configured as PWM mode 1 
                                    281 ;-----------------------------------  
                           00F424   282 TIM2_CLK_FREQ=62500
      008122                        283 timer2_init:
      008122 72 1A 50 C7      [ 1]  284 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM2 ; enable TIMER2 clock 
      008126 35 60 53 05      [ 1]  285  	mov TIM2_CCMR1,#(6<<TIM2_CCMR_OCM) ; PWM mode 1 
      00812A 35 08 53 0C      [ 1]  286 	mov TIM2_PSCR,#8 ; 16Mhz/256=62500
      00812E 81               [ 4]  287 	ret 
                                    288 
                                    289 ;---------------------------------
                                    290 ; TIM4 is configured to generate an 
                                    291 ; interrupt every millisecond 
                                    292 ;----------------------------------
      00812F                        293 timer4_init:
      00812F 72 18 50 C7      [ 1]  294 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008133 35 07 53 45      [ 1]  295 	mov TIM4_PSCR,#7 ; prescale 128  
      008137 35 7D 53 46      [ 1]  296 	mov TIM4_ARR,#125 ; set for 1msec.
      00813B 35 05 53 40      [ 1]  297 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00813F 72 10 53 41      [ 1]  298 	bset TIM4_IER,#TIM4_IER_UIE
      008143 81               [ 4]  299 	ret
                                    300 
                                    301 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    302 ;  routines to write to FLASH, EEPROM 
                                    303 ;  and OPTION 
                                    304 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    305 
                                    306 ;----------------------------------
                                    307 ; unlock EEPROM/OPT for writing/erasing
                                    308 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    309 ; input:
                                    310 ;  none
                                    311 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    312 ;  none 
                                    313 ;----------------------------------
      008144                        314 unlock_eeprom:
      008144 35 AE 50 64      [ 1]  315 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008148 35 56 50 64      [ 1]  316     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00814C 72 07 50 5F FB   [ 2]  317 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008151 81               [ 4]  318 	ret
                                    319 
                                    320 ;----------------------------------
                                    321 ; unlock FLASH for writing/erasing
                                    322 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    323 ; input:
                                    324 ;  none
                                    325 ; output:
                                    326 ;  none
                                    327 ;----------------------------------
      008152                        328 unlock_flash:
      008152 35 56 50 62      [ 1]  329 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008156 35 AE 50 62      [ 1]  330 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00815A 72 03 50 5F FB   [ 2]  331 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00815F 81               [ 4]  332 	ret
                                    333 
                           000000   334 USE_BLOCK_ERASE=0 
                           000000   335 .if USE_BLOCK_ERASE 
                                    336 ; this code is copied to RAM 
                                    337 
                                    338 ;----------------------------
                                    339 ; erase block code must be 
                                    340 ; executed from RAM
                                    341 ;-----------------------------
                                    342 erase_start:
                                    343 	clr a 
                                    344     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    345     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    346 	ldf [farptr],a
                                    347     inc farptr+2 
                                    348     ldf [farptr],a
                                    349     inc farptr+2 
                                    350     ldf [farptr],a
                                    351     inc farptr+2 
                                    352     ldf [farptr],a
                                    353 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    354 	ret
                                    355 erase_end:
                                    356 
                                    357 ; copy erase_start in RAM 
                                    358 move_code_in_ram:
                                    359 	ldw x,#erase_end 
                                    360 	subw x,#erase_start
                                    361 	ldw acc16,x 
                                    362 	ldw x,#pad 
                                    363 	ldw y,#erase_start 
                                    364 	call move 
                                    365 	ret 
                                    366 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    367 ;-----------------------------------
                                    368 ; erase flash or EEPROM block 
                                    369 ; a block is 128 bytes 
                                    370 ; input:
                                    371 ;   farptr  address block begin
                                    372 ; output:
                                    373 ;   none
                                    374 ;--------------------------------------
                                    375 erase_block:
                                    376 	ldw x,farptr+1 
                                    377 	pushw x 
                                    378 	call move_code_in_ram 
                                    379 	popw x 
                                    380 	ldw farptr+1,x 
                                    381 	tnz farptr
                                    382 	jrne erase_flash 
                                    383 	ldw x,#FLASH_BASE 
                                    384 	cpw x,farptr+1 
                                    385 	jrpl erase_flash 
                                    386 ; erase eeprom block
                                    387 	call unlock_eeprom 
                                    388 	sim 
                                    389 	call pad   
                                    390 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    391 	rim 
                                    392 	ret 
                                    393 ; erase flash block:
                                    394 erase_flash:
                                    395 	call unlock_flash 
                                    396 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    397 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    398 	clr a 
                                    399 	sim 
                                    400 	call pad 
                                    401     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    402 	rim 
                                    403 	ret 
                                    404 .endif ;;;; USE_BLOCK_ERASE ;;;;
                                    405 
                                    406 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    407 ; write a byte to FLASH or EEPROM/OPTION  
                                    408 ; input:
                                    409 ;    a  		byte to write
                                    410 ;    farptr  	address
                                    411 ;    x          farptr[x]
                                    412 ; output:
                                    413 ;    none
                                    414 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    415 	; variables locales
                           000001   416 	BTW = 1   ; byte to write offset on stack
                           000002   417 	OPT = 2   ; OPTION flag offset on stack
                           000002   418 	VSIZE = 2
      008160                        419 write_byte:
      008160 90 89            [ 2]  420 	pushw y
      0000E2                        421 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      008162 52 02            [ 2]    1     sub sp,#VSIZE 
      008164 6B 01            [ 1]  422 	ld (BTW,sp),a ; byte to write 
      008166 0F 02            [ 1]  423 	clr (OPT,sp)  ; OPTION flag
                                    424 ; put addr[15:0] in Y, for bounds check.
      008168 90 CE 00 18      [ 2]  425 	ldw y,farptr+1   ; Y=addr15:0
                                    426 ; check addr[23:16], if <> 0 then it is extened flash memory
      00816C 72 5D 00 17      [ 1]  427 	tnz farptr 
      008170 26 14            [ 1]  428 	jrne write_flash
      008172 90 A3 A6 00      [ 2]  429     cpw y,#user_space
      008176 24 0E            [ 1]  430     jruge write_flash
      008178 90 A3 40 00      [ 2]  431 	cpw y,#EEPROM_BASE  
      00817C 25 52            [ 1]  432     jrult write_exit
      00817E 90 A3 48 7F      [ 2]  433 	cpw y,#OPTION_END 
      008182 22 4C            [ 1]  434 	jrugt write_exit
      008184 20 16            [ 2]  435 	jra write_eeprom 
                                    436 ; write program memory
      008186                        437 write_flash:
      008186 CD 81 52         [ 4]  438 	call unlock_flash 
      008189 9B               [ 1]  439 1$:	sim 
      00818A 7B 01            [ 1]  440 	ld a,(BTW,sp)
      00818C 92 A7 00 17      [ 4]  441 	ldf ([farptr],x),a ; farptr[x]=A
      008190 72 05 50 5F FB   [ 2]  442 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008195 9A               [ 1]  443     rim 
      008196 72 13 50 5F      [ 1]  444     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00819A 20 34            [ 2]  445     jra write_exit
                                    446 ; write eeprom and option
      00819C                        447 write_eeprom:
      00819C CD 81 44         [ 4]  448 	call unlock_eeprom
                                    449 	; check for data eeprom or option eeprom
      00819F 90 A3 48 00      [ 2]  450 	cpw y,#OPTION_BASE
      0081A3 2B 08            [ 1]  451 	jrmi 1$
      0081A5 90 A3 48 80      [ 2]  452 	cpw y,#OPTION_END+1
      0081A9 2A 02            [ 1]  453 	jrpl 1$
      0081AB 03 02            [ 1]  454 	cpl (OPT,sp)
      0081AD                        455 1$: 
      0081AD 0D 02            [ 1]  456     tnz (OPT,sp)
      0081AF 27 08            [ 1]  457     jreq 2$
                                    458 	; pour modifier une option il faut modifier ces 2 bits
      0081B1 72 1E 50 5B      [ 1]  459     bset FLASH_CR2,#FLASH_CR2_OPT
      0081B5 72 1F 50 5C      [ 1]  460     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081B9                        461 2$: 
      0081B9 7B 01            [ 1]  462     ld a,(BTW,sp)
      0081BB 92 A7 00 17      [ 4]  463     ldf ([farptr],x),a
      0081BF 0D 02            [ 1]  464     tnz (OPT,sp)
      0081C1 27 08            [ 1]  465     jreq 3$
      0081C3 5C               [ 2]  466     incw x
      0081C4 7B 01            [ 1]  467     ld a,(BTW,sp)
      0081C6 43               [ 1]  468     cpl a
      0081C7 92 A7 00 17      [ 4]  469     ldf ([farptr],x),a
      0081CB 72 05 50 5F FB   [ 2]  470 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081D0                        471 write_exit:
      000150                        472 	_drop VSIZE 
      0081D0 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081D2 90 85            [ 2]  473 	popw y
      0081D4 81               [ 4]  474     ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    475 
                                    476 ;--------------------------------------------
                                    477 ; write a data block to eeprom or flash 
                                    478 ; input:
                                    479 ;   Y        source address   
                                    480 ;   X        array index  destination  farptr[x]
                                    481 ;   BSIZE    block size bytes 
                                    482 ;   farptr   write address , byte* 
                                    483 ; output:
                                    484 ;	X 		after last byte written 
                                    485 ;   Y 		after last byte read 
                                    486 ;  farptr   point after block
                                    487 ;---------------------------------------------
      0081D5                        488 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000155                        489 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    490 	; local var 
                           000001   491 	XSAVE=1 
                           000002   492 	VSIZE=2 
      000155                        493 write_block:
      000155                        494 	_vars VSIZE
      0081D5 52 02            [ 2]    1     sub sp,#VSIZE 
      0081D7 1F 01            [ 2]  495 	ldw (XSAVE,sp),x 
      0081D9 1E 05            [ 2]  496 	ldw x,(BSIZE,sp) 
      0081DB 27 13            [ 1]  497 	jreq 9$
      0081DD 1E 01            [ 2]  498 1$:	ldw x,(XSAVE,sp)
      0081DF 90 F6            [ 1]  499 	ld a,(y)
      0081E1 CD 81 60         [ 4]  500 	call write_byte 
      0081E4 5C               [ 2]  501 	incw x 
      0081E5 90 5C            [ 2]  502 	incw y 
      0081E7 1F 01            [ 2]  503 	ldw (XSAVE,sp),x
      0081E9 1E 05            [ 2]  504 	ldw x,(BSIZE,sp)
      0081EB 5A               [ 2]  505 	decw x
      0081EC 1F 05            [ 2]  506 	ldw (BSIZE,sp),x 
      0081EE 26 ED            [ 1]  507 	jrne 1$
      0081F0                        508 9$:
      0081F0 1E 01            [ 2]  509 	ldw x,(XSAVE,sp)
      0081F2 CD 99 69         [ 4]  510 	call incr_farptr
      000175                        511 	_drop VSIZE
      0081F5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081F7 81               [ 4]  512 	ret 
                                    513 
                                    514 
                                    515 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    516 ;;   UART1 subroutines
                                    517 ;;   used for user interface 
                                    518 ;;   communication channel.
                                    519 ;;   settings: 
                                    520 ;;		115200 8N1 no flow control
                                    521 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    522 
                                    523 ;---------------------------------------------
                                    524 ; initialize UART1, 115200 8N1
                                    525 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    526 ;	none
                                    527 ; output:
                                    528 ;   none
                                    529 ;---------------------------------------------
      0081F8                        530 uart1_init:
      0081F8 72 1A 50 02      [ 1]  531     bset PA_DDR,#UART1_TX_PIN
      0081FC 72 1A 50 03      [ 1]  532     bset PA_CR1,#UART1_TX_PIN 
      008200 72 1A 50 04      [ 1]  533     bset PA_CR2,#UART1_TX_PIN 
                                    534 ; enable UART1 clock
      008204 72 14 50 C7      [ 1]  535 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008208                        536 uart1_set_baud: 
                                    537 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    538 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008208 A6 E1            [ 1]  539 	ld a,#CLK_SWR_HSI
      00820A C1 50 C3         [ 1]  540 	cp a,CLK_CMSR 
      00820D 27 0A            [ 1]  541 	jreq 2$ 
      00820F                        542 1$: ; 8 Mhz 	
      00820F 35 05 52 33      [ 1]  543 	mov UART1_BRR2,#0x05 ; must be loaded first
      008213 35 04 52 32      [ 1]  544 	mov UART1_BRR1,#0x4
      008217 20 08            [ 2]  545 	jra 3$
      008219                        546 2$: ; 16 Mhz 	
      008219 35 0B 52 33      [ 1]  547 	mov UART1_BRR2,#0x0b ; must be loaded first
      00821D 35 08 52 32      [ 1]  548 	mov UART1_BRR1,#0x08
      008221                        549 3$:
      008221 72 5F 52 31      [ 1]  550     clr UART1_DR
      008225 35 2C 52 35      [ 1]  551 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN)|(1<<UART_CR2_RIEN));
      008229 72 10 52 35      [ 1]  552 	bset UART1_CR2,#UART_CR2_SBK
      00822D 72 0D 52 30 FB   [ 2]  553     btjf UART1_SR,#UART_SR_TC,.
      008232 81               [ 4]  554     ret
                                    555 
                                    556 ;---------------------------------
                                    557 ; send character to UART1 
                                    558 ; input:
                                    559 ;   A 
                                    560 ; output:
                                    561 ;   none 
                                    562 ;--------------------------------	
      008233                        563 putc:
      008233 72 0F 52 30 FB   [ 2]  564 	btjf UART1_SR,#UART_SR_TXE,.
      008238 C7 52 31         [ 1]  565 	ld UART1_DR,a 
      00823B 81               [ 4]  566 	ret 
                                    567 
                                    568 ;---------------------------------
                                    569 ; wait character from UART1 
                                    570 ; input:
                                    571 ;   none
                                    572 ; output:
                                    573 ;   A 			char  
                                    574 ;--------------------------------	
      00823C                        575 getc:
      00823C C6 00 28         [ 1]  576 	ld a,rx_char 
      00823F 27 FB            [ 1]  577 	jreq getc 
      008241 72 5F 00 28      [ 1]  578 	clr rx_char 
      008245 81               [ 4]  579 	ret 
                                    580 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    581 ;-----------------------------
                                    582 ; send an ASCIZ string to UART1 
                                    583 ; input: 
                                    584 ;   x 		char * 
                                    585 ; output:
                                    586 ;   none 
                                    587 ;-------------------------------
      008246                        588 puts:
      008246 F6               [ 1]  589     ld a,(x)
      008247 27 06            [ 1]  590 	jreq 1$
      008249 CD 82 33         [ 4]  591 	call putc 
      00824C 5C               [ 2]  592 	incw x 
      00824D 20 F7            [ 2]  593 	jra puts 
      00824F 81               [ 4]  594 1$:	ret 
                                    595 
                                    596 
                                    597 ;---------------------------
                                    598 ; delete character at left 
                                    599 ; of cursor on terminal 
                                    600 ; input:
                                    601 ;   none 
                                    602 ; output:
                                    603 ;	none 
                                    604 ;---------------------------
      008250                        605 bksp:
      008250 A6 08            [ 1]  606 	ld a,#BSP 
      008252 CD 82 33         [ 4]  607 	call putc 
      008255 A6 20            [ 1]  608 	ld a,#SPACE 
      008257 CD 82 33         [ 4]  609 	call putc 
      00825A A6 08            [ 1]  610 	ld a,#BSP 
      00825C CD 82 33         [ 4]  611 	call putc 
      00825F 81               [ 4]  612 	ret 
                                    613 ;---------------------------
                                    614 ; delete n character left of cursor 
                                    615 ; at terminal.
                                    616 ; input: 
                                    617 ;   A   number of characters to delete.
                                    618 ; output:
                                    619 ;    none 
                                    620 ;--------------------------	
      008260                        621 delete:
      008260 88               [ 1]  622 	push a 
      008261 0D 01            [ 1]  623 0$:	tnz (1,sp)
      008263 27 07            [ 1]  624 	jreq 1$
      008265 CD 82 50         [ 4]  625 	call bksp 
      008268 0A 01            [ 1]  626 	dec (1,sp)
      00826A 20 F5            [ 2]  627 	jra 0$
      00826C 84               [ 1]  628 1$:	pop a 
      00826D 81               [ 4]  629 	ret
                                    630 
                                    631 ;--------------------------
                                    632 ; print n spaces on terminal
                                    633 ; input:
                                    634 ;  X 		number of spaces 
                                    635 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    636 ;	none 
                                    637 ;---------------------------
      00826E                        638 spaces:
      00826E A6 20            [ 1]  639 	ld a,#SPACE 
      008270 5D               [ 2]  640 1$:	tnzw x
      008271 27 06            [ 1]  641 	jreq 9$
      008273 CD 82 33         [ 4]  642 	call putc 
      008276 5A               [ 2]  643 	decw x
      008277 20 F7            [ 2]  644 	jra 1$
      008279                        645 9$: 
      008279 81               [ 4]  646 	ret 
                                    647 
                           000000   648 .if DEBUG 
                                    649 ;---------------------------------
                                    650 ;; print actual registers states 
                                    651 ;; as pushed on stack 
                                    652 ;; {Y,X,CC,A}
                                    653 ;---------------------------------
                                    654 	_argofs 0  
                                    655 	_arg R_Y 1 
                                    656 	_arg R_X 3
                                    657 	_arg R_A 5
                                    658 	_arg R_CC 6
                                    659 prt_regs:
                                    660 	ldw x,#regs_state 
                                    661 	call puts
                                    662 ; register PC
                                    663 	ldw y,(1,sp)
                                    664 	ldw x,#REG_EPC 
                                    665 	call prt_reg16 
                                    666 ; register CC 
                                    667 	ld a,(R_CC,sp)
                                    668 	ldw x,#REG_CC 
                                    669 	call prt_reg8 
                                    670 ; register A 
                                    671 	ld a,(R_A,sp)
                                    672 	ldw x,#REG_A 
                                    673 	call prt_reg8 
                                    674 ; register X 
                                    675 	ldw y,(R_X,sp)
                                    676 	ldw x,#REG_X 
                                    677 	call prt_reg16 
                                    678 ; register Y 
                                    679 	ldw y,(R_Y,sp)
                                    680 	ldw x,#REG_Y 
                                    681 	call prt_reg16 
                                    682 ; register SP 
                                    683 	ldw y,sp
                                    684 	addw y,#6+ARG_OFS  
                                    685 	ldw x,#REG_SP
                                    686 	call prt_reg16
                                    687 	ld a,#CR 
                                    688 	call putc
                                    689 	call putc   
                                    690 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    691 
                                    692 regs_state: .asciz "\nregisters state\n--------------------\n"
                                    693 
                                    694 
                                    695 ;--------------------
                                    696 ; print content at address in hex.
                                    697 ; input:
                                    698 ;   X 	address to peek 
                                    699 ; output:
                                    700 ;	none 
                                    701 ;--------------------	
                                    702 prt_peek:
                                    703 	pushw x 
                                    704 	ldw acc16,x 
                                    705 	clr acc24 
                                    706 	clrw x 
                                    707 	ld a,#16 
                                    708 	call prti24 
                                    709 	ld a,#': 
                                    710 	call putc 
                                    711 	ld a,#SPACE 
                                    712 	call putc 
                                    713 	popw x 
                                    714 	ld a,(x)
                                    715 	ld acc8,a 
                                    716 	clrw x 
                                    717 	ld a,#16 
                                    718 	call prti24
                                    719 	ret 
                                    720 .endif ; DEBUG  
                                    721 
                                    722 ;-------------------------------------
                                    723 ; retrun string length
                                    724 ; input:
                                    725 ;   X         .asciz  pointer 
                                    726 ; output:
                                    727 ;   X         length 
                                    728 ;-------------------------------------
      00827A                        729 strlen:
      00827A 90 93            [ 1]  730 	ldw y,x 
      00827C 5F               [ 1]  731 	clrw x 
      00827D 90 7D            [ 1]  732 1$:	tnz (y) 
      00827F 27 05            [ 1]  733 	jreq 9$ 
      008281 5C               [ 2]  734 	incw x
      008282 90 5C            [ 2]  735 	incw y 
      008284 20 F7            [ 2]  736 	jra 1$ 
      008286 81               [ 4]  737 9$: ret 
                                    738 
                                    739 ;------------------------------------
                                    740 ; compare 2 strings
                                    741 ; input:
                                    742 ;   X 		char* first string 
                                    743 ;   Y       char* second string 
                                    744 ; output:
                                    745 ;   A 		0|1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                                    746 ;-------------------------------------
      008287                        747 strcmp:
      008287 F6               [ 1]  748 	ld a,(x)
      008288 27 0B            [ 1]  749 	jreq 5$ 
      00828A 90 F1            [ 1]  750 	cp a,(y) 
      00828C 26 05            [ 1]  751 	jrne 4$ 
      00828E 5C               [ 2]  752 	incw x 
      00828F 90 5C            [ 2]  753 	incw y 
      008291 20 F4            [ 2]  754 	jra strcmp 
      008293                        755 4$: ; not same  
      008293 4F               [ 1]  756 	clr a 
      008294 81               [ 4]  757 	ret 
      008295                        758 5$: ; same 
      008295 A6 01            [ 1]  759 	ld a,#1 
      008297 81               [ 4]  760 	ret 
                                    761 
                                    762 
                                    763 ;---------------------------------------
                                    764 ;  copy src to dest 
                                    765 ; input:
                                    766 ;   X 		dest 
                                    767 ;   Y 		src 
                                    768 ; output: 
                                    769 ;   X 		dest 
                                    770 ;----------------------------------
      008298                        771 strcpy:
      008298 89               [ 2]  772 	pushw x 
      008299 90 F6            [ 1]  773 1$: ld a,(y)
      00829B 27 06            [ 1]  774 	jreq 9$ 
      00829D F7               [ 1]  775 	ld (x),a 
      00829E 5C               [ 2]  776 	incw x 
      00829F 90 5C            [ 2]  777 	incw y 
      0082A1 20 F6            [ 2]  778 	jra 1$ 
      0082A3 7F               [ 1]  779 9$:	clr (x)
      0082A4 85               [ 2]  780 	popw x 
      0082A5 81               [ 4]  781 	ret 
                                    782 
                                    783 ;---------------------------------------
                                    784 ; move memory block 
                                    785 ; input:
                                    786 ;   X 		destination 
                                    787 ;   Y 	    source 
                                    788 ;   acc16	bytes count 
                                    789 ; output:
                                    790 ;   none 
                                    791 ;--------------------------------------
                           000001   792 	INCR=1 ; increament high byte 
                           000002   793 	LB=2 ; increament low byte 
                           000002   794 	VSIZE=2
      0082A6                        795 move:
      000226                        796 	_vars VSIZE 
      0082A6 52 02            [ 2]    1     sub sp,#VSIZE 
      0082A8 0F 01            [ 1]  797 	clr (INCR,sp)
      0082AA 0F 02            [ 1]  798 	clr (LB,sp)
      0082AC 90 89            [ 2]  799 	pushw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      0082AE 13 01            [ 2]  800 	cpw x,(1,sp) ; compare DEST to SRC 
      0082B0 90 85            [ 2]  801 	popw y 
      0082B2 27 31            [ 1]  802 	jreq move_exit ; x==y 
      0082B4 2B 0E            [ 1]  803 	jrmi move_down
      0082B6                        804 move_up: ; start from top address with incr=-1
      0082B6 72 BB 00 0D      [ 2]  805 	addw x,acc16
      0082BA 72 B9 00 0D      [ 2]  806 	addw y,acc16
      0082BE 03 01            [ 1]  807 	cpl (INCR,sp)
      0082C0 03 02            [ 1]  808 	cpl (LB,sp)   ; increment = -1 
      0082C2 20 05            [ 2]  809 	jra move_loop  
      0082C4                        810 move_down: ; start from bottom address with incr=1 
      0082C4 5A               [ 2]  811     decw x 
      0082C5 90 5A            [ 2]  812 	decw y
      0082C7 0C 02            [ 1]  813 	inc (LB,sp) ; incr=1 
      0082C9                        814 move_loop:	
      0082C9 C6 00 0D         [ 1]  815     ld a, acc16 
      0082CC CA 00 0E         [ 1]  816 	or a, acc8
      0082CF 27 14            [ 1]  817 	jreq move_exit 
      0082D1 72 FB 01         [ 2]  818 	addw x,(INCR,sp)
      0082D4 72 F9 01         [ 2]  819 	addw y,(INCR,sp) 
      0082D7 90 F6            [ 1]  820 	ld a,(y)
      0082D9 F7               [ 1]  821 	ld (x),a 
      0082DA 89               [ 2]  822 	pushw x 
      0082DB CE 00 0D         [ 2]  823 	ldw x,acc16 
      0082DE 5A               [ 2]  824 	decw x 
      0082DF CF 00 0D         [ 2]  825 	ldw acc16,x 
      0082E2 85               [ 2]  826 	popw x 
      0082E3 20 E4            [ 2]  827 	jra move_loop
      0082E5                        828 move_exit:
      000265                        829 	_drop VSIZE
      0082E5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0082E7 81               [ 4]  830 	ret 	
                                    831 
                                    832 ;-------------------------------------
                                    833 ; search text area for a line with 
                                    834 ; same number as line#  
                                    835 ; input:
                                    836 ;	X 			line# 
                                    837 ; output:
                                    838 ;   X 			addr of line | 0 
                                    839 ;   Y           line#|insert address if not found  
                                    840 ;-------------------------------------
                           000001   841 	LL=1 ; line length 
                           000002   842 	LB=2 ; line length low byte 
                           000002   843 	VSIZE=2 
      0082E8                        844 search_lineno:
      000268                        845 	_vars VSIZE
      0082E8 52 02            [ 2]    1     sub sp,#VSIZE 
      0082EA 0F 01            [ 1]  846 	clr (LL,sp)
      0082EC 90 CE 00 1F      [ 2]  847 	ldw y,txtbgn
      0082F0                        848 search_ln_loop:
      0082F0 90 C3 00 21      [ 2]  849 	cpw y,txtend 
      0082F4 2A 10            [ 1]  850 	jrpl 8$
      0082F6 90 F3            [ 1]  851 	cpw x,(y)
      0082F8 27 0E            [ 1]  852 	jreq 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0082FA 2B 0A            [ 1]  853 	jrmi 8$ 
      0082FC 90 E6 02         [ 1]  854 	ld a,(2,y)
      0082FF 6B 02            [ 1]  855 	ld (LB,sp),a 
      008301 72 F9 01         [ 2]  856 	addw y,(LL,sp)
      008304 20 EA            [ 2]  857 	jra search_ln_loop 
      008306                        858 8$: 
      008306 5F               [ 1]  859 	clrw x 	
      008307 51               [ 1]  860 	exgw x,y 
      000288                        861 9$: _drop VSIZE
      008308 5B 02            [ 2]    1     addw sp,#VSIZE 
      00830A 51               [ 1]  862 	exgw x,y   
      00830B 81               [ 4]  863 	ret 
                                    864 
                                    865 ;-------------------------------------
                                    866 ; delete line at addr
                                    867 ; move new line to insert with end of text 
                                    868 ; otherwise it would be overwritten.
                                    869 ; input:
                                    870 ;   X 		addr of line i.e DEST for move 
                                    871 ;-------------------------------------
                           000001   872 	LLEN=1
                           000003   873 	SRC=3
                           000004   874 	VSIZE=4
      00830C                        875 del_line: 
      00028C                        876 	_vars VSIZE 
      00830C 52 04            [ 2]    1     sub sp,#VSIZE 
      00830E E6 02            [ 1]  877 	ld a,(2,x) ; line length
      008310 6B 02            [ 1]  878 	ld (LLEN+1,sp),a 
      008312 0F 01            [ 1]  879 	clr (LLEN,sp)
      008314 90 93            [ 1]  880 	ldw y,x  
      008316 72 F9 01         [ 2]  881 	addw y,(LLEN,sp) ;SRC  
      008319 17 03            [ 2]  882 	ldw (SRC,sp),y  ;save source 
      00831B 90 CE 00 21      [ 2]  883 	ldw y,txtend 
      00831F 90 E6 02         [ 1]  884 	ld a,(2,y)
      008322 90 5F            [ 1]  885 	clrw y 
      008324 90 97            [ 1]  886 	ld yl,a  
      008326 72 B9 00 21      [ 2]  887 	addw y,txtend
      00832A 72 F2 03         [ 2]  888 	subw y,(SRC,sp) ; y=count 
      00832D 90 CF 00 0D      [ 2]  889 	ldw acc16,y 
      008331 16 03            [ 2]  890 	ldw y,(SRC,sp)    ; source
      008333 CD 82 A6         [ 4]  891 	call move
      008336 90 CE 00 21      [ 2]  892 	ldw y,txtend 
      00833A 72 F2 01         [ 2]  893 	subw y,(LLEN,sp)
      00833D 90 CF 00 21      [ 2]  894 	ldw txtend,y  
      0002C1                        895 	_drop VSIZE     
      008341 5B 04            [ 2]    1     addw sp,#VSIZE 
      008343 81               [ 4]  896 	ret 
                                    897 
                                    898 ;---------------------------------------------
                                    899 ; create a gap in text area 
                                    900 ; move new line to insert in gap with end of text
                                    901 ; otherwise it would be overwritten.
                                    902 ; input:
                                    903 ;    X 			addr gap start 
                                    904 ;    Y 			gap length 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    905 ; output:
                                    906 ;    X 			addr gap start 
                                    907 ;--------------------------------------------
                           000001   908 	DEST=1
                           000003   909 	SRC=3
                           000005   910 	LEN=5
                           000006   911 	VSIZE=6 
      008344                        912 create_gap:
      0002C4                        913 	_vars VSIZE
      008344 52 06            [ 2]    1     sub sp,#VSIZE 
      008346 1F 03            [ 2]  914 	ldw (SRC,sp),x 
      008348 17 05            [ 2]  915 	ldw (LEN,sp),y 
      00834A 90 CF 00 0D      [ 2]  916 	ldw acc16,y 
      00834E 90 93            [ 1]  917 	ldw y,x ; SRC
      008350 72 BB 00 0D      [ 2]  918 	addw x,acc16  
      008354 1F 01            [ 2]  919 	ldw (DEST,sp),x 
                                    920 ;compute size to move 	
      008356 CE 00 21         [ 2]  921 	ldw x,txtend 
      008359 E6 02            [ 1]  922 	ld a,(2,x) ; pending line length 
      00835B C7 00 0E         [ 1]  923 	ld acc8,a 
      00835E 72 5F 00 0D      [ 1]  924 	clr acc16 
      008362 72 BB 00 0D      [ 2]  925 	addw x,acc16 
      008366 72 F0 03         [ 2]  926 	subw x,(SRC,sp)
      008369 CF 00 0D         [ 2]  927 	ldw acc16,x ; size to move
      00836C 1E 01            [ 2]  928 	ldw x,(DEST,sp) 
      00836E CD 82 A6         [ 4]  929 	call move
      008371 CE 00 21         [ 2]  930 	ldw x,txtend
      008374 72 FB 05         [ 2]  931 	addw x,(LEN,sp)
      008377 CF 00 21         [ 2]  932 	ldw txtend,x
      0002FA                        933 9$:	_drop VSIZE 
      00837A 5B 06            [ 2]    1     addw sp,#VSIZE 
      00837C 81               [ 4]  934 	ret 
                                    935 
                                    936 
                                    937 ;--------------------------------------------
                                    938 ; insert line in tib into text area 
                                    939 ; first search for already existing 
                                    940 ; replace existing 
                                    941 ; if strlen(tib)==0 delete existing line
                                    942 ; input:
                                    943 ;   ptr16 				pointer to tokenized line  
                                    944 ; output:
                                    945 ;   none
                                    946 ;---------------------------------------------
                           000001   947 	DEST=1  ; text area insertion address 
                           000003   948 	SRC=3   ; str to insert address 
                           000005   949 	LINENO=5 ; line number 
                           000007   950 	LLEN=7 ; line length 
                           000008   951 	VSIZE=8  
      00837D                        952 insert_line:
      0002FD                        953 	_vars VSIZE 
      00837D 52 08            [ 2]    1     sub sp,#VSIZE 
      00837F CE 00 18         [ 2]  954 	ldw x,ptr16  
      008382 C3 00 1F         [ 2]  955 	cpw x,txtbgn 
      008385 26 0D            [ 1]  956 	jrne 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    957 ;first text line 
      008387 AE 00 02         [ 2]  958 	ldw x,#2 
      00838A 72 D6 00 18      [ 4]  959 	ld a,([ptr16],x)
      00838E 5F               [ 1]  960 	clrw x 
      00838F 97               [ 1]  961 	ld xl,a
      008390 1F 07            [ 2]  962 	ldw (LLEN,sp),x  
      008392 20 45            [ 2]  963 	jra 5$
      008394 72 CE 00 18      [ 5]  964 0$:	ldw x,[ptr16]
                                    965 ; new line number
      008398 1F 05            [ 2]  966 	ldw (LINENO,sp),x 
      00839A AE 00 02         [ 2]  967 	ldw x,#2 
      00839D 72 D6 00 18      [ 4]  968 	ld a,([ptr16],x)
      0083A1 97               [ 1]  969 	ld xl,a
                                    970 ; new line length
      0083A2 1F 07            [ 2]  971 	ldw (LLEN,sp),x
                                    972 ; check if that line number already exit 	
      0083A4 1E 05            [ 2]  973 	ldw x,(LINENO,sp)
      0083A6 CD 82 E8         [ 4]  974 	call search_lineno 
      0083A9 5D               [ 2]  975 	tnzw x 
      0083AA 26 04            [ 1]  976 	jrne 2$
                                    977 ; line doesn't exit
                                    978 ; it will be inserted at this point.  	
      0083AC 17 01            [ 2]  979 	ldw (DEST,sp),y 
      0083AE 20 05            [ 2]  980 	jra 3$
                                    981 ; line exit delete it.
                                    982 ; it will be replaced by new one 	
      0083B0 1F 01            [ 2]  983 2$: ldw (DEST,sp),x 
      0083B2 CD 83 0C         [ 4]  984 	call del_line
      0083B5                        985 3$: 
                                    986 ; insert new line or leave if LLEN==3
                                    987 ; LLEN==3 means empty line 
      0083B5 A6 03            [ 1]  988 	ld a,#3
      0083B7 11 08            [ 1]  989 	cp a,(LLEN+1,sp)
      0083B9 27 27            [ 1]  990 	jreq insert_ln_exit ; empty line exit.
                                    991 ; if insertion point at txtend 
                                    992 ; no move required 
      0083BB 1E 01            [ 2]  993 	ldw x,(DEST,sp)
      0083BD C3 00 21         [ 2]  994 	cpw x,txtend 
      0083C0 2A 17            [ 1]  995 	jrpl 5$ 
                                    996 ; must create a gap
                                    997 ; at insertion point  
      0083C2 1E 01            [ 2]  998 	ldw x,(DEST,sp)
      0083C4 16 07            [ 2]  999 	ldw y,(LLEN,sp)
      0083C6 CD 83 44         [ 4] 1000 	call create_gap 
                                   1001 ; move new line in gap 
      0083C9 1E 07            [ 2] 1002 	ldw x,(LLEN,sp)
      0083CB CF 00 0D         [ 2] 1003 	ldw acc16,x 
      0083CE 90 CE 00 21      [ 2] 1004 	ldw y,txtend ;SRC 
      0083D2 1E 01            [ 2] 1005 	ldw x,(DEST,sp) ; dest address 
      0083D4 CD 82 A6         [ 4] 1006 	call move 
      0083D7 20 09            [ 2] 1007 	jra insert_ln_exit  
      0083D9                       1008 5$: ; no move required 
      0083D9 1E 07            [ 2] 1009 	ldw x,(LLEN,sp) 
      0083DB 72 BB 00 21      [ 2] 1010 	addw x,txtend 
      0083DF CF 00 21         [ 2] 1011 	ldw txtend,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0083E2                       1012 insert_ln_exit:	
      000362                       1013 	_drop VSIZE
      0083E2 5B 08            [ 2]    1     addw sp,#VSIZE 
      0083E4 81               [ 4] 1014 	ret
                                   1015 
                                   1016 
                                   1017 ;-----------------------------
                                   1018 ; check if text buffer full
                                   1019 ; input:
                                   1020 ;   ptr16     addr start tokenize line 
                                   1021 ;   X         buffer index 
                                   1022 ; output:
                                   1023 ;   none 
                                   1024 ;-----------------------------------
      0083E5                       1025 check_full:
      0083E5 72 BB 00 18      [ 2] 1026 	addw x,ptr16 
      0083E9 A3 16 E8         [ 2] 1027 	cpw x,#tib 
      0083EC 25 05            [ 1] 1028 	jrult 1$
      0083EE A6 01            [ 1] 1029 	ld a,#ERR_MEM_FULL
      0083F0 CC 87 94         [ 2] 1030 	jp tb_error 
      0083F3 81               [ 4] 1031 1$: ret 
                                   1032 
                                   1033 
                                   1034 ;-----------------------------------
                                   1035 ; create token list form text line 
                                   1036 ; save this list in text area
                                   1037 ;  compiled line format: 
                                   1038 ;    line_no  2 bytes {0...32767}
                                   1039 ;    count    1 byte 
                                   1040 ;    tokens   variable 
                                   1041 ;   
                                   1042 ; input:
                                   1043 ;   none
                                   1044 ; output:
                                   1045 ;   basicptr     token list buffer address 
                                   1046 ;   in.w  		 cleared, index in buffer 
                                   1047 ;-----------------------------------
                           000001  1048 	XSAVE=1
                           000003  1049 	BUFIDX=3
                           000004  1050 	VSIZE=4
      0083F4                       1051 compile:
      000374                       1052 	_vars VSIZE 
      0083F4 52 04            [ 2]    1     sub sp,#VSIZE 
      0083F6 72 1A 00 26      [ 1] 1053 	bset flags,#FCOMP 
      0083FA CE 00 21         [ 2] 1054 	ldw x,txtend
      0083FD CF 00 18         [ 2] 1055 	ldw ptr16,x ; code buffer start address 
      008400 5F               [ 1] 1056 	clrw x 
      008401 AE 00 03         [ 2] 1057 	ldw x,#3
      008404 1F 03            [ 2] 1058 	ldw (BUFIDX,sp),X  
      008406 CD 83 E5         [ 4] 1059 	call check_full
      008409 5F               [ 1] 1060 	clrw x 
      00840A 72 CF 00 18      [ 5] 1061 	ldw [ptr16],x ; initialize line# to zero 
      00840E CD 8B 52         [ 4] 1062 	call get_token
      008411 1F 01            [ 2] 1063 	ldw (XSAVE,sp),x 
      008413 A1 04            [ 1] 1064 	cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008415 26 13            [ 1] 1065 	jrne 3$
      008417 A3 00 00         [ 2] 1066 	cpw x,#0 
      00841A 2C 05            [ 1] 1067 	jrsgt 1$
      00841C A6 0A            [ 1] 1068 	ld a,#ERR_BAD_VALUE 
      00841E CC 87 94         [ 2] 1069 	jp tb_error ; line number must be in range {1..32767}
      008421 72 CF 00 18      [ 5] 1070 1$:	ldw [ptr16],x; line number
      008425 CD 8B 52         [ 4] 1071 2$:	call get_token
      008428 1F 01            [ 2] 1072 	ldw (XSAVE,sp),x 
      00842A A1 00            [ 1] 1073 3$:	cp a,#TK_NONE 
      00842C 26 03            [ 1] 1074 	jrne 30$
      00842E CC 84 BF         [ 2] 1075 	jp 9$ ; end of line. 
      008431                       1076 30$: 	 
      008431 1E 03            [ 2] 1077 	ldw x,(BUFIDX,sp)
      008433 CD 83 E5         [ 4] 1078 	call check_full 
      008436 16 03            [ 2] 1079 	ldw y,(BUFIDX,sp) 
      008438 91 D7 18         [ 4] 1080 	ld ([ptr16],y),a ; token attribute 
      00843B 90 5C            [ 2] 1081 	incw y
      00843D 17 03            [ 2] 1082 	ldw (BUFIDX,sp),y
      00843F A1 01            [ 1] 1083 	cp a,#TK_COLON 
      008441 26 02            [ 1] 1084 	jrne 31$
      008443 20 E0            [ 2] 1085 	jra 2$ ; loop for next token 
      008445                       1086 31$: ; check for token type 
                                   1087 ; character token have 1 byte attribute, i.e. ASCII character 
      008445 A1 03            [ 1] 1088 	cp a,#TK_CHAR
      008447 26 0C            [ 1] 1089 	jrne 32$ 
      008449 1E 01            [ 2] 1090 	ldw x,(XSAVE,sp)
      00844B 9F               [ 1] 1091 	ld a,xl 
      00844C 91 D7 18         [ 4] 1092 	ld ([ptr16],y),a
      00844F 90 5C            [ 2] 1093 	incw y 
      008451 17 03            [ 2] 1094 	ldw (BUFIDX,sp),y 
      008453 20 D0            [ 2] 1095 	jra 2$ 
      008455                       1096 32$:
      008455 A1 02            [ 1] 1097 	cp a,#TK_ARRAY 
                                   1098 ; this token have not attribute. 
      008457 27 CC            [ 1] 1099 	jreq 2$ 
      008459 A1 0A            [ 1] 1100 	cp a,#TK_QSTR 
      00845B 26 25            [ 1] 1101 	jrne 4$
                                   1102 ; copy string as C string.	
      00845D AE 17 38         [ 2] 1103 	ldw x,#pad 
      008460 CD 82 7A         [ 4] 1104 	call strlen
      008463 5C               [ 2] 1105 	incw x  
      008464 CD 83 E5         [ 4] 1106 	call check_full 
      008467 90 AE 17 38      [ 2] 1107 	ldw y,#pad 
      00846B CE 00 18         [ 2] 1108 	ldw x,ptr16
      00846E 72 FB 03         [ 2] 1109 	addw x,(BUFIDX,sp)	
      008471 CD 82 98         [ 4] 1110 	call strcpy 
      008474 AE 17 38         [ 2] 1111 	ldw x,#pad 
      008477 CD 82 7A         [ 4] 1112 	call strlen 
      00847A 5C               [ 2] 1113 	incw x
      00847B 72 FB 03         [ 2] 1114 	addw x,(BUFIDX,sp) 
      00847E 1F 03            [ 2] 1115 	ldw (BUFIDX,sp),x
      008480 20 A3            [ 2] 1116 	jra 2$  
      008482 A1 04            [ 1] 1117 4$: cp a,#TK_INTGR
      008484 25 9F            [ 1] 1118 	jrult 2$ ; 
      008486 A1 08            [ 1] 1119 	cp a,#TK_CFUNC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      008488 22 9B            [ 1] 1120 	Jrugt 2$ ; those tokens have no attributes 
      00848A 1E 01            [ 2] 1121 	ldw x,(XSAVE,sp) 
      00848C 16 03            [ 2] 1122 	ldw y,(BUFIDX,sp)
      00848E 91 DF 18         [ 5] 1123 	ldw ([ptr16],y),x ; the attribute is an address or integer. 
      008491 A3 95 1C         [ 2] 1124 	cpw x,#rem ; is this a comment? 
      008494 27 09            [ 1] 1125 	jreq 5$	
      008496 72 A9 00 02      [ 2] 1126 	addw y,#2 
      00849A 17 03            [ 2] 1127 	ldw (BUFIDX,sp),y 
      00849C CC 84 25         [ 2] 1128 	jp 2$
      00849F                       1129 5$:
                                   1130 ; copy commment in code buffer and
                                   1131 ; skip to end of line.  
      00849F 72 A9 00 02      [ 2] 1132 	addw y,#2 ; skip exec address 
      0084A3 17 03            [ 2] 1133 	ldw (BUFIDX,sp),y 
      0084A5 CE 00 18         [ 2] 1134 	ldw x,ptr16 
      0084A8 72 FB 03         [ 2] 1135 	addw x,(BUFIDX,sp)
      0084AB 90 CE 00 01      [ 2] 1136 	ldw y,in.w 
      0084AF 72 A9 16 E8      [ 2] 1137 	addw y,#tib 
      0084B3 CD 82 98         [ 4] 1138 	call strcpy 	
      0084B6 CD 82 7A         [ 4] 1139 	call strlen 
      0084B9 5C               [ 2] 1140 	incw x ; skip string 0. 
      0084BA 72 FB 03         [ 2] 1141 	addw x,(BUFIDX,sp)
      0084BD 1F 03            [ 2] 1142 	ldw (BUFIDX,sp),x 
      0084BF                       1143 9$: 
      0084BF AE 00 02         [ 2] 1144 	ldw x,#2
      0084C2 16 03            [ 2] 1145 	ldw y,(BUFIDX,sp)
      0084C4 90 9F            [ 1] 1146 	ld a,yl 
      0084C6 72 D7 00 18      [ 4] 1147 	ld ([ptr16],x),a ; code byte count   	
      0084CA 72 CE 00 18      [ 5] 1148 	ldw x,[ptr16]
      0084CE 27 09            [ 1] 1149 	jreq 10$
      0084D0 CD 83 7D         [ 4] 1150 	call insert_line
      0084D3 72 5F 00 04      [ 1] 1151 	clr  count 
      0084D7 20 0F            [ 2] 1152 	jra  11$ 
      0084D9                       1153 10$: ; line# is zero 
      0084D9 CE 00 18         [ 2] 1154 	ldw x,ptr16 
      0084DC CF 00 05         [ 2] 1155 	ldw basicptr,x 
      0084DF E6 02            [ 1] 1156 	ld a,(2,x)
      0084E1 C7 00 04         [ 1] 1157 	ld count,a 
      0084E4 35 03 00 02      [ 1] 1158 	mov in,#3 
      0084E8                       1159 11$:
      000468                       1160 	_drop VSIZE 
      0084E8 5B 04            [ 2]    1     addw sp,#VSIZE 
      0084EA 72 1B 00 26      [ 1] 1161 	bres flags,#FCOMP 
      0084EE 81               [ 4] 1162 	ret 
                                   1163 
                                   1164 
                                   1165 ;------------------------------------
                                   1166 ;  set all variables to zero 
                                   1167 ; input:
                                   1168 ;   none 
                                   1169 ; output:
                                   1170 ;	none
                                   1171 ;------------------------------------
      0084EF                       1172 clear_vars:
      0084EF AE 00 29         [ 2] 1173 	ldw x,#vars 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0084F2 90 AE 00 34      [ 2] 1174 	ldw y,#2*26 
      0084F6 7F               [ 1] 1175 1$:	clr (x)
      0084F7 5C               [ 2] 1176 	incw x 
      0084F8 90 5A            [ 2] 1177 	decw y 
      0084FA 26 FA            [ 1] 1178 	jrne 1$
      0084FC 81               [ 4] 1179 	ret 
                                   1180 
                                   1181 ;-------------------------------------
                                   1182 ; check if A is a letter 
                                   1183 ; input:
                                   1184 ;   A 			character to test 
                                   1185 ; output:
                                   1186 ;   C flag      1 true, 0 false 
                                   1187 ;-------------------------------------
      0084FD                       1188 is_alpha:
      0084FD A1 41            [ 1] 1189 	cp a,#'A 
      0084FF 8C               [ 1] 1190 	ccf
      008500 24 0B            [ 1] 1191 	jrnc 9$ 
      008502 A1 5B            [ 1] 1192 	cp a,#'Z+1 
      008504 25 07            [ 1] 1193 	jrc 9$ 
      008506 A1 61            [ 1] 1194 	cp a,#'a 
      008508 8C               [ 1] 1195 	ccf 
      008509 24 02            [ 1] 1196 	jrnc 9$
      00850B A1 7B            [ 1] 1197 	cp a,#'z+1   
      00850D 81               [ 4] 1198 9$: ret 	
                                   1199 
                                   1200 ;-------------------------------------
                                   1201 ;  program initialization entry point 
                                   1202 ;-------------------------------------
                           000001  1203 	MAJOR=1
                           000000  1204 	MINOR=0
      00850E 0A 0A 54 69 6E 79 20  1205 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      008554                       1206 cold_start:
                                   1207 ;set stack 
      008554 AE 17 FF         [ 2] 1208 	ldw x,#STACK_EMPTY
      008557 94               [ 1] 1209 	ldw sp,x   
                                   1210 ; clear all ram 
      008558 7F               [ 1] 1211 0$: clr (x)
      008559 5A               [ 2] 1212 	decw x 
      00855A 26 FC            [ 1] 1213 	jrne 0$
                                   1214 ; activate pull up on all inputs 
      00855C A6 FF            [ 1] 1215 	ld a,#255 
      00855E C7 50 03         [ 1] 1216 	ld PA_CR1,a 
      008561 C7 50 08         [ 1] 1217 	ld PB_CR1,a 
      008564 C7 50 0D         [ 1] 1218 	ld PC_CR1,a 
      008567 C7 50 12         [ 1] 1219 	ld PD_CR1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00856A C7 50 17         [ 1] 1220 	ld PE_CR1,a 
      00856D C7 50 1C         [ 1] 1221 	ld PF_CR1,a 
      008570 C7 50 21         [ 1] 1222 	ld PG_CR1,a 
      008573 C7 50 2B         [ 1] 1223 	ld PI_CR1,a
                                   1224 ; set LD2 pin as output and turn it on
      008576 72 1A 50 0D      [ 1] 1225     bset PC_CR1,#LED2_BIT
      00857A 72 1A 50 0E      [ 1] 1226     bset PC_CR2,#LED2_BIT
      00857E 72 1A 50 0C      [ 1] 1227     bset PC_DDR,#LED2_BIT
      008582 72 1A 50 0A      [ 1] 1228 	bset PC_ODR,#LED2_BIT 
                                   1229 ; disable schmitt triggers on Arduino CN4 analog inputs
      008586 55 00 3F 54 07   [ 1] 1230 	mov ADC_TDRL,0x3f
                                   1231 ; disable peripherals clocks
                                   1232 ;	clr CLK_PCKENR1 
                                   1233 ;	clr CLK_PCKENR2
      00858B 72 5F 50 F2      [ 1] 1234 	clr AWU_TBR 
      00858F 72 14 50 CA      [ 1] 1235 	bset CLK_PCKENR2,#CLK_PCKENR2_AWU ; enable LSI for beeper
                                   1236 ; select internal clock no divisor: 16 Mhz 	
      008593 A6 E1            [ 1] 1237 	ld a,#CLK_SWR_HSI 
      008595 5F               [ 1] 1238 	clrw x  
      008596 CD 81 0C         [ 4] 1239     call clock_init 
      008599 CD 81 2F         [ 4] 1240 	call timer4_init
      00859C CD 81 22         [ 4] 1241 	call timer2_init
                                   1242 ; UART1 at 115200 BAUD
      00859F CD 81 F8         [ 4] 1243 	call uart1_init
                                   1244 ; activate PE_4 (user button interrupt)
      0085A2 72 18 50 18      [ 1] 1245     bset PE_CR2,#USR_BTN_BIT 
                                   1246 ; display system information
      0085A6 AE 85 0E         [ 2] 1247 	ldw x,#software 
      0085A9 CD 82 46         [ 4] 1248 	call puts 
      0085AC A6 01            [ 1] 1249 	ld a,#MAJOR 
      0085AE C7 00 0E         [ 1] 1250 	ld acc8,a 
      0085B1 5F               [ 1] 1251 	clrw x 
      0085B2 CF 00 0C         [ 2] 1252 	ldw acc24,x 
      0085B5 A6 0A            [ 1] 1253 	ld a,#10 
      0085B7 CD 88 9B         [ 4] 1254 	call prti24 
      0085BA A6 2E            [ 1] 1255 	ld a,#'.
      0085BC CD 82 33         [ 4] 1256 	call putc 
      0085BF A6 00            [ 1] 1257 	ld a,#MINOR 
      0085C1 C7 00 0E         [ 1] 1258 	ld acc8,a 
      0085C4 5F               [ 1] 1259 	clrw x 
      0085C5 CF 00 0C         [ 2] 1260 	ldw acc24,x 
      0085C8 A6 0A            [ 1] 1261 	ld a,#10 
      0085CA CD 88 9B         [ 4] 1262 	call prti24 
      0085CD A6 0D            [ 1] 1263 	ld a,#CR 
      0085CF CD 82 33         [ 4] 1264 	call putc 
      0085D2 CD 99 77         [ 4] 1265 	call seek_fdrive 
      0085D5 9A               [ 1] 1266 	rim 
      0085D6 72 5C 00 16      [ 1] 1267 	inc seedy+1 
      0085DA 72 5C 00 14      [ 1] 1268 	inc seedx+1 
      0085DE CD 86 5C         [ 4] 1269 	call clear_basic
      0085E1 CD 91 A7         [ 4] 1270 	call ubound 
      0085E4 CD 8D F1         [ 4] 1271 	call dpop 
      0085E7 CF 00 24         [ 2] 1272 	ldw array_size,x
                                   1273 ; 200 msec beep 
      0085EA AE 03 DC         [ 2] 1274 	ldw x,#988 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0085ED CD 8D E4         [ 4] 1275 	call dpush 
      0085F0 AE 00 96         [ 2] 1276 	ldw x,#150 
      0085F3 CD 8D E4         [ 4] 1277 	call dpush 
      0085F6 CD 97 DA         [ 4] 1278 	call beep 
      0085F9 72 1B 50 0A      [ 1] 1279 	bres PC_ODR,#LED2_BIT	
      0085FD CD 86 06         [ 4] 1280 	call warm_init
      008600 CD 86 23         [ 4] 1281 	call load_autorun
      008603 CC 87 D8         [ 2] 1282     jp interp 
                                   1283 
      008606                       1284 warm_init:
      008606 72 5F 00 26      [ 1] 1285 	clr flags 
      00860A 72 5F 00 23      [ 1] 1286 	clr loop_depth 
      00860E AE 17 80         [ 2] 1287 	ldw x,#dstack_empty 
      008611 CF 00 1D         [ 2] 1288 	ldw dstkptr,x 
      008614 35 04 00 27      [ 1] 1289 	mov tab_width,#TAB_WIDTH 
      008618 35 0A 00 0B      [ 1] 1290 	mov base,#10 
      00861C AE 16 E8         [ 2] 1291 	ldw x,#tib 
      00861F CF 00 05         [ 2] 1292 	ldw basicptr,x 
      008622 81               [ 4] 1293 	ret 
                                   1294 
                                   1295 ;--------------------------
                                   1296 ; if autorun file defined 
                                   1297 ; in eeprom address AUTORUN_NAME 
                                   1298 ; load and run it.
                                   1299 ;-------------------------
      008623                       1300 load_autorun:
      008623 AE 40 00         [ 2] 1301 	ldw x,#AUTORUN_NAME
      008626 F6               [ 1] 1302 	ld a,(x)
      008627 27 1D            [ 1] 1303 	jreq 9$
      008629 90 AE 40 00      [ 2] 1304 	ldw y,#AUTORUN_NAME
      00862D CD 99 D5         [ 4] 1305 	call search_file
      008630 25 02            [ 1] 1306 	jrc 2$ 
      008632 20 12            [ 2] 1307 	jra 9$ 
      008634 CD 9A E4         [ 4] 1308 2$:	call load_file
      008637 AE 40 00         [ 2] 1309 	ldw x,#AUTORUN_NAME 
      00863A CD 82 46         [ 4] 1310 	call puts
      00863D AE 86 47         [ 2] 1311 	ldw x,#autorun_msg 
      008640 CD 82 46         [ 4] 1312 	call puts 
      008643 CC 97 9A         [ 2] 1313 	jp run_it    
      008646 81               [ 4] 1314 9$: ret 	
                                   1315 
      008647 20 6C 6F 61 64 65 64  1316 autorun_msg: .asciz " loaded and running\n"
             20 61 6E 64 20 72 75
             6E 6E 69 6E 67 0A 00
                                   1317 ;---------------------------
                                   1318 ; reset BASIC text variables 
                                   1319 ; and clear variables 
                                   1320 ;---------------------------
      00865C                       1321 clear_basic:
      00865C 72 5F 00 04      [ 1] 1322 	clr count 
      008660 AE 00 5D         [ 2] 1323 	ldw x,#free_ram 
      008663 CF 00 1F         [ 2] 1324 	ldw txtbgn,x 
      008666 CF 00 21         [ 2] 1325 	ldw txtend,x 
      008669 CD 84 EF         [ 4] 1326 	call clear_vars 
      00866C 81               [ 4] 1327 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1328 
                                   1329 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1330 ;;   Tiny BASIC error messages     ;;
                                   1331 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00866D                       1332 err_msg:
      00866D 00 00 86 87 86 95 86  1333 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             A4 86 BE 86 CE
      008679 86 E5 86 FC 87 17 87  1334 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             29 87 3B
      008683 87 48 87 7C           1335 	.word err_no_access,err_no_data  
                                   1336 
      008687 0A 4D 65 6D 6F 72 79  1337 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      008695 0A 73 79 6E 74 61 78  1338 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      0086A4 0A 6D 61 74 68 20 6F  1339 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0086BE 0A 64 69 76 69 73 69  1340 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      0086CE 0A 69 6E 76 61 6C 69  1341 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      0086E5 0A 72 75 6E 20 74 69  1342 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      0086FC 0A 63 6F 6D 6D 61 6E  1343 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      008717 0A 64 75 70 6C 69 63  1344 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      008729 0A 46 69 6C 65 20 6E  1345 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      00873B 0A 62 61 64 20 76 61  1346 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      008748 0A 46 69 6C 65 20 69  1347 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
      00877C 0A 4E 6F 20 64 61 74  1348 err_no_data: .asciz "\nNo data line found.\n"
             61 20 6C 69 6E 65 20
             66 6F 75 6E 64 2E 0A
             00
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1349 
                                   1350 ;rt_msg: .asciz "last token id: "
                                   1351 
      008792                       1352 syntax_error:
      008792 A6 02            [ 1] 1353 	ld a,#ERR_SYNTAX 
                                   1354 
      008794                       1355 tb_error:
      008794 AE 86 6D         [ 2] 1356 	ldw x, #err_msg 
      008797 72 5F 00 0D      [ 1] 1357 	clr acc16 
      00879B 48               [ 1] 1358 	sll a
      00879C 72 59 00 0D      [ 1] 1359 	rlc acc16  
      0087A0 C7 00 0E         [ 1] 1360 	ld acc8, a 
      0087A3 72 BB 00 0D      [ 2] 1361 	addw x,acc16 
      0087A7 FE               [ 2] 1362 	ldw x,(x)
      0087A8 CD 82 46         [ 4] 1363 	call puts
      0087AB 72 0B 00 26 18   [ 2] 1364 	btjf flags,#FCOMP, 1$
      0087B0 AE 16 E8         [ 2] 1365 	ldw x,#tib
      0087B3 CD 82 46         [ 4] 1366 	call puts 
      0087B6 A6 0D            [ 1] 1367 	ld a,#CR 
      0087B8 CD 82 33         [ 4] 1368 	call putc
      0087BB CE 00 01         [ 2] 1369 	ldw x,in.w
      0087BE CD 82 6E         [ 4] 1370 	call spaces
      0087C1 A6 5E            [ 1] 1371 	ld a,#'^
      0087C3 CD 82 33         [ 4] 1372 	call putc 
      0087C6 20 09            [ 2] 1373 	jra 6$
      0087C8 CE 00 05         [ 2] 1374 1$:	ldw x,basicptr
      0087CB C6 00 02         [ 1] 1375 	ld a,in 
      0087CE CD 92 C6         [ 4] 1376 	call prt_basic_line
                                   1377 ;	ldw x,#rt_msg 
                                   1378 ;	call puts 
                                   1379 ;	clrw x 
                                   1380 ;	ld a,in.saved 
                                   1381 ;	ld xl,a 
                                   1382 ;	ld a,([basicptr],x)
                                   1383 ;	clrw x 
                                   1384 ;	ld xl,a 
                                   1385 ;	call print_int 
      0087D1 AE 17 FF         [ 2] 1386 6$: ldw x,#STACK_EMPTY 
      0087D4 94               [ 1] 1387     ldw sp,x
      0087D5                       1388 warm_start:
      0087D5 CD 86 06         [ 4] 1389 	call warm_init
                                   1390 ;----------------------------
                                   1391 ;   BASIC interpreter
                                   1392 ;----------------------------
      0087D8                       1393 interp:
      0087D8 72 5F 00 01      [ 1] 1394 	clr in.w
      0087DC 72 01 00 26 23   [ 2] 1395 	btjf flags,#FRUN,cmd_line
                                   1396 ; flag FRUN is set 
                                   1397 ; running program
                                   1398 ; goto next basic line 
      0087E1 CE 00 05         [ 2] 1399 	ldw x,basicptr
      0087E4 E6 02            [ 1] 1400 	ld a,(2,x) ; line length 
      0087E6 C7 00 0E         [ 1] 1401 	ld acc8,a 
      0087E9 72 5F 00 0D      [ 1] 1402 	clr acc16 
      0087ED 72 BB 00 0D      [ 2] 1403 	addw x,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0087F1 C3 00 21         [ 2] 1404 	cpw x,txtend 
      0087F4 2A DF            [ 1] 1405 	jrpl warm_start
      0087F6 CF 00 05         [ 2] 1406 	ldw basicptr,x ; start of next line  
      0087F9 E6 02            [ 1] 1407 	ld a,(2,x)
      0087FB C7 00 04         [ 1] 1408 	ld count,a 
      0087FE 35 03 00 02      [ 1] 1409 	mov in,#3 ; skip first 3 bytes of line 
      008802 20 14            [ 2] 1410 	jra interp_loop 
      008804                       1411 cmd_line: ; commande line interface  	
      008804 72 5F 00 02      [ 1] 1412 	clr in
      008808 A6 0D            [ 1] 1413 	ld a,#CR 
      00880A CD 82 33         [ 4] 1414 	call putc 
      00880D A6 3E            [ 1] 1415 	ld a,#'> 
      00880F CD 82 33         [ 4] 1416 	call putc 
      008812 CD 89 D3         [ 4] 1417 	call readln
      008815 CD 83 F4         [ 4] 1418 	call compile
                                   1419 ; if text begin with a line number
                                   1420 ; the compile set count=0   
                                   1421 ; so code is not interpreted
                                   1422 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1423 ;; This is the interpreter loop
                                   1424 ;; for each BASIC code line. 
                                   1425 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
      008818                       1426 interp_loop:  
      008818 C6 00 02         [ 1] 1427 	ld a,in 
      00881B C1 00 04         [ 1] 1428 	cp a,count  
      00881E 2A B8            [ 1] 1429 	jrpl interp
      008820 CD 88 46         [ 4] 1430 	call next_token
      008823 A1 01            [ 1] 1431 	cp a,#TK_COLON 
      008825 27 F1            [ 1] 1432 	jreq interp_loop 
      008827                       1433 1$:
      008827 A1 05            [ 1] 1434 	cp a,#TK_VAR
      008829 26 05            [ 1] 1435 	jrne 2$
      00882B CD 91 D3         [ 4] 1436 	call let02  
      00882E 20 E8            [ 2] 1437 	jra interp_loop 
      008830                       1438 2$:	
      008830 A1 02            [ 1] 1439 	cp a,#TK_ARRAY 
      008832 26 08            [ 1] 1440 	jrne 3$
      008834 CD 90 1C         [ 4] 1441 	call get_array_element
      008837 CD 91 D3         [ 4] 1442 	call let02 
      00883A 20 DC            [ 2] 1443 	jra interp_loop 
      00883C                       1444 3$:
      00883C A1 06            [ 1] 1445 	cp a,#TK_CMD
      00883E 26 03            [ 1] 1446 	jrne 4$
      008840 FD               [ 4] 1447 	call (x) 
      008841 20 D5            [ 2] 1448 	jra interp_loop 
      008843                       1449 4$:	
      008843 CC 87 92         [ 2] 1450 	jp syntax_error 
                                   1451 
                                   1452 ;--------------------------
                                   1453 ; extract next token from
                                   1454 ; token list 
                                   1455 ; basicptr -> base address 
                                   1456 ; in  -> offset in list array 
                                   1457 ; output:
                                   1458 ;   A 		token attribute
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1459 ;   X 		token value if there is one
                                   1460 ;----------------------------------------
      008846                       1461 next_token:
      008846 C6 00 02         [ 1] 1462 	ld a,in 
      008849 C0 00 04         [ 1] 1463 	sub a,count ; don't replace sub by cp.  
      00884C 27 4C            [ 1] 1464 	jreq 9$
      00884E 55 00 02 00 03   [ 1] 1465 	mov in.saved,in 
      008853 CE 00 05         [ 2] 1466 	ldw x,basicptr 
      008856 72 D6 00 01      [ 4] 1467 	ld a,([in.w],x)
      00885A 72 5C 00 02      [ 1] 1468 	inc in 
      00885E A1 02            [ 1] 1469 	cp a,#TK_ARRAY  
      008860 23 38            [ 2] 1470 	jrule 9$
      008862 A1 03            [ 1] 1471 	cp a,#TK_CHAR
      008864 26 0D            [ 1] 1472 	jrne 1$
      008866 72 D6 00 01      [ 4] 1473 	ld a,([in.w],x)
      00886A 72 5C 00 02      [ 1] 1474 	inc in
      00886E 5F               [ 1] 1475 	clrw x 
      00886F 97               [ 1] 1476 	ld xl,a 
      008870 A6 03            [ 1] 1477 	ld a,#TK_CHAR
      008872 81               [ 4] 1478 	ret 
      008873 A1 0A            [ 1] 1479 1$:	cp a,#TK_QSTR 
      008875 25 17            [ 1] 1480 	jrult 4$
      008877 26 21            [ 1] 1481 	jrne 9$
      008879 72 BB 00 01      [ 2] 1482 	addw x,in.w 
      00887D 89               [ 2] 1483 	pushw x 
      00887E 7D               [ 1] 1484 2$:	tnz (x)
      00887F 27 03            [ 1] 1485 	jreq 3$
      008881 5C               [ 2] 1486 	incw x 
      008882 20 FA            [ 2] 1487 	jra 2$ 
      008884 5C               [ 2] 1488 3$:	incw x 
      008885 72 B0 00 05      [ 2] 1489     subw x,basicptr 
      008889 CF 00 01         [ 2] 1490 	ldw in.w,x 
      00888C 85               [ 2] 1491 	popw x 
      00888D 81               [ 4] 1492 	ret 
      00888E 72 DE 00 01      [ 5] 1493 4$: ldw x,([in.w],x)
      008892 72 5C 00 02      [ 1] 1494 	inc in 
      008896 72 5C 00 02      [ 1] 1495 	inc in
      00889A                       1496 9$: 
      00889A 81               [ 4] 1497 	ret	
                                   1498 
                                   1499 
                                   1500 ;----------------------------------------
                                   1501 ;   DEBUG support functions
                                   1502 ;----------------------------------------
                           000000  1503 .if DEBUG 
                                   1504 
                                   1505 ; turn LED on 
                                   1506 ledon:
                                   1507     bset PC_ODR,#LED2_BIT
                                   1508     ret 
                                   1509 
                                   1510 ; turn LED off 
                                   1511 ledoff:
                                   1512     bres PC_ODR,#LED2_BIT 
                                   1513     ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1514 
                                   1515 ; invert LED status 
                                   1516 ledtoggle:
                                   1517     ld a,#LED2_MASK
                                   1518     xor a,PC_ODR
                                   1519     ld PC_ODR,a
                                   1520     ret 
                                   1521 
                                   1522 left_paren:
                                   1523 	ld a,#SPACE 
                                   1524 	call putc
                                   1525 	ld a,#'( 
                                   1526 	call putc 	
                                   1527 	ret 
                                   1528 
                                   1529 ;------------------------------
                                   1530 ; print 8 bit register 
                                   1531 ; input:
                                   1532 ;   X  point to register name 
                                   1533 ;   A  register value to print 
                                   1534 ; output:
                                   1535 ;   none
                                   1536 ;------------------------------- 
                                   1537 prt_reg8:
                                   1538 	push a 
                                   1539 	call puts 
                                   1540 	ld a,(1,sp) 
                                   1541 	ld acc8,a 
                                   1542 	clrw x 
                                   1543 	ld xl,a 
                                   1544 	mov base,#16
                                   1545 	call print_int 
                                   1546 	call left_paren 
                                   1547 	pop a 
                                   1548 	clrw x 
                                   1549 	ld xl,a 
                                   1550 	mov base,#10 
                                   1551 	call print_int  
                                   1552 	ld a,#') 
                                   1553 	call putc
                                   1554 	ret
                                   1555 
                                   1556 ;--------------------------------
                                   1557 ; print 16 bits register 
                                   1558 ; input:
                                   1559 ;   X   point register name 
                                   1560 ;   Y   register value to print 
                                   1561 ; output:
                                   1562 ;  none
                                   1563 ;--------------------------------
                                   1564 prt_reg16: 
                                   1565 	pushw y 
                                   1566 	call puts 
                                   1567 	ldw x,(1,sp) 
                                   1568 	mov base,#16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1569 	call print_int  
                                   1570 	call left_paren 
                                   1571 	popw x 
                                   1572 	mov base,#10 
                                   1573 	call print_int  
                                   1574 	ld a,#') 
                                   1575 	call putc
                                   1576 	ret 
                                   1577 
                                   1578 ;------------------------------------
                                   1579 ; print registers contents saved on
                                   1580 ; stack by trap interrupt.
                                   1581 ;------------------------------------
                                   1582 print_registers:
                                   1583 	ldw x,#STATES
                                   1584 	call puts
                                   1585 ; print EPC 
                                   1586 	ldw x, #REG_EPC
                                   1587 	call puts 
                                   1588 	ld a, (11,sp)
                                   1589 	ld acc8,a 
                                   1590 	ld a, (10,sp) 
                                   1591 	ld acc16,a 
                                   1592 	ld a,(9,sp) 
                                   1593 	ld acc24,a
                                   1594 	clrw x  
                                   1595 	ld a,#16
                                   1596 	call prti24  
                                   1597 ; print X
                                   1598 	ldw x,#REG_X
                                   1599 	ldw y,(5,sp)
                                   1600 	call prt_reg16  
                                   1601 ; print Y 
                                   1602 	ldw x,#REG_Y
                                   1603 	ldw y, (7,sp)
                                   1604 	call prt_reg16  
                                   1605 ; print A 
                                   1606 	ldw x,#REG_A
                                   1607 	ld a, (4,sp) 
                                   1608 	call prt_reg8
                                   1609 ; print CC 
                                   1610 	ldw x,#REG_CC 
                                   1611 	ld a, (3,sp) 
                                   1612 	call prt_reg8 
                                   1613 ; print SP 
                                   1614 	ldw x,#REG_SP
                                   1615 	ldw y,sp 
                                   1616 	addw y,#12
                                   1617 	call prt_reg16  
                                   1618 	ld a,#'\n' 
                                   1619 	call putc
                                   1620 	ret
                                   1621 
                                   1622 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
                                   1623 REG_EPC: .asciz "EPC:"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1624 REG_Y:   .asciz "\nY:" 
                                   1625 REG_X:   .asciz "\nX:"
                                   1626 REG_A:   .asciz "\nA:" 
                                   1627 REG_CC:  .asciz "\nCC:"
                                   1628 REG_SP:  .asciz "\nSP:"
                                   1629 
                                   1630 .endif ; DEBUG 
                                   1631 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1632 
                                   1633 
                                   1634 ;------------------------------------
                                   1635 ; print integer in acc24 
                                   1636 ; input:
                                   1637 ;	acc24 		integer to print 
                                   1638 ;	A 			numerical base for conversion 
                                   1639 ;               if bit 7 is set add a space at print end.
                                   1640 ;   XL 			field width, 0 -> no fill.
                                   1641 ;  output:
                                   1642 ;    none 
                                   1643 ;------------------------------------
                           000001  1644 	WIDTH = 1
                           000002  1645 	BASE = 2
                           000003  1646 	ADD_SPACE=3 ; add a space after number 
                           000003  1647 	VSIZE = 3
      00889B                       1648 prti24:
      00081B                       1649 	_vars VSIZE 
      00889B 52 03            [ 2]    1     sub sp,#VSIZE 
      00889D 0F 03            [ 1] 1650 	clr (ADD_SPACE,sp)
      00889F A5 80            [ 1] 1651 	bcp a,#0x80 
      0088A1 27 02            [ 1] 1652 	jreq 0$ 
      0088A3 03 03            [ 1] 1653 	cpl (ADD_SPACE,sp)
      0088A5 A4 1F            [ 1] 1654 0$:	and a,#31 
      0088A7 6B 02            [ 1] 1655 	ld (BASE,sp),a
      0088A9 9F               [ 1] 1656 	ld a,xl
      0088AA 6B 01            [ 1] 1657 	ld (WIDTH,sp),a 
      0088AC 7B 02            [ 1] 1658 	ld a, (BASE,sp)  
      0088AE CD 89 41         [ 4] 1659     call itoa  ; conversion entier en  .asciz
      0088B1 7B 01            [ 1] 1660 1$: ld a,(WIDTH,sp)
      0088B3 27 1F            [ 1] 1661 	jreq 4$
      0088B5 C7 00 0E         [ 1] 1662 	ld acc8,a 
      0088B8 89               [ 2] 1663 	pushw x 
      0088B9 CD 82 7A         [ 4] 1664 	call strlen 
      0088BC 9F               [ 1] 1665 	ld a,xl 
      0088BD 85               [ 2] 1666 	popw x 
      0088BE 31 00 0E         [ 3] 1667 	exg a,acc8 
      0088C1 C0 00 0E         [ 1] 1668 	sub a,acc8 
      0088C4 2B 0E            [ 1] 1669 	jrmi 4$
      0088C6 6B 01            [ 1] 1670 	ld (WIDTH,sp),a 
      0088C8 A6 20            [ 1] 1671 	ld  a,#SPACE
      0088CA 0D 01            [ 1] 1672 3$: tnz (WIDTH,sp)
      0088CC 27 06            [ 1] 1673 	jreq 4$
      0088CE 5A               [ 2] 1674 	decw x 
      0088CF F7               [ 1] 1675 	ld (x),a 
      0088D0 0A 01            [ 1] 1676 	dec (WIDTH,sp) 
      0088D2 20 F6            [ 2] 1677 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0088D4                       1678 4$: 
      0088D4 CD 82 46         [ 4] 1679 	call puts 
      0088D7 0D 03            [ 1] 1680 	tnz (ADD_SPACE,sp)
      0088D9 27 05            [ 1] 1681 	jreq 5$
      0088DB A6 20            [ 1] 1682     ld a,#SPACE 
      0088DD CD 82 33         [ 4] 1683 	call putc 
      000860                       1684 5$: _drop VSIZE 
      0088E0 5B 03            [ 2]    1     addw sp,#VSIZE 
      0088E2 81               [ 4] 1685     ret	
                                   1686 
                                   1687 ;-----------------------------------
                                   1688 ; print a 16 bit integer 
                                   1689 ; using variable 'base' as conversion
                                   1690 ; format.
                                   1691 ; input:
                                   1692 ;   X       integer to print 
                                   1693 ;   base    conversion base 
                                   1694 ; output:
                                   1695 ;   none 
                                   1696 ;-----------------------------------
                           000001  1697 	SIGN=1
                           000001  1698 	VSIZE=1
      0088E3                       1699 print_int: 
      000863                       1700 	_vars VSIZE 
      0088E3 52 01            [ 2]    1     sub sp,#VSIZE 
      0088E5 0F 01            [ 1] 1701 	clr (SIGN,sp)
      0088E7 90 AE 17 5F      [ 2] 1702 	ldw y,#pad+PAD_SIZE-1 
      0088EB 90 7F            [ 1] 1703 	clr (y)
      0088ED C6 00 0B         [ 1] 1704 	ld a,base  
      0088F0 A1 0A            [ 1] 1705 	cp a,#10 
      0088F2 26 06            [ 1] 1706 	jrne 1$ 
      0088F4 5D               [ 2] 1707 	tnzw x 
      0088F5 2A 03            [ 1] 1708 	jrpl 1$ 
      0088F7 03 01            [ 1] 1709 	cpl (SIGN,sp)
      0088F9 50               [ 2] 1710 	negw x 	 
      0088FA                       1711 1$:	
      0088FA C6 00 0B         [ 1] 1712 	ld a,base 
      0088FD 62               [ 2] 1713 	div x,a 
      0088FE AB 30            [ 1] 1714 	add a,#'0 
      008900 A1 3A            [ 1] 1715 	cp a,#'9+1 
      008902 2B 02            [ 1] 1716 	jrmi 2$ 
      008904 AB 07            [ 1] 1717 	add a,#7 
      008906 90 5A            [ 2] 1718 2$: decw y 
      008908 90 F7            [ 1] 1719 	ld (y),a 
      00890A 5D               [ 2] 1720 	tnzw x 
      00890B 26 ED            [ 1] 1721 	jrne 1$ 
      00890D A6 10            [ 1] 1722 	ld a,#16 
      00890F C1 00 0B         [ 1] 1723 	cp a,base 
      008912 26 08            [ 1] 1724 	jrne 3$
      008914 A6 24            [ 1] 1725 	ld a,#'$
      008916 90 5A            [ 2] 1726 	decw y  
      008918 90 F7            [ 1] 1727 	ld (y),a
      00891A 20 0A            [ 2] 1728 	jra 9$ 
      00891C 0D 01            [ 1] 1729 3$: tnz (SIGN,sp)
      00891E 27 06            [ 1] 1730 	jreq 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008920 A6 2D            [ 1] 1731 	ld a,#'-
      008922 90 5A            [ 2] 1732 	decw y  
      008924 90 F7            [ 1] 1733 	ld (y),a
      008926                       1734 9$:	
      008926 93               [ 1] 1735 	ldw x,y 
      008927 1D 17 5F         [ 2] 1736 	subw x,#pad+PAD_SIZE-1 
      00892A 50               [ 2] 1737 	negw x  
      00892B                       1738 10$:
      00892B 9F               [ 1] 1739 	ld a,xl 
      00892C C1 00 27         [ 1] 1740 	cp a,tab_width
      00892F 24 09            [ 1] 1741 	jruge 12$
      008931 90 5A            [ 2] 1742 	decw y 
      008933 A6 20            [ 1] 1743 	ld a,#SPACE 
      008935 90 F7            [ 1] 1744 	ld (y),a
      008937 5C               [ 2] 1745 	incw x 
      008938 20 F1            [ 2] 1746 	jra 10$ 
      00893A                       1747 12$:
      00893A 93               [ 1] 1748     ldw x,y 
      00893B CD 82 46         [ 4] 1749 	call puts  
      0008BE                       1750 	_drop VSIZE 
      00893E 5B 01            [ 2]    1     addw sp,#VSIZE 
      008940 81               [ 4] 1751 	ret 
                                   1752 
                                   1753 ;------------------------------------
                                   1754 ; convert integer in acc24 to string
                                   1755 ; input:
                                   1756 ;   A	  	base
                                   1757 ;	acc24	integer to convert
                                   1758 ; output:
                                   1759 ;   X  		pointer to string
                                   1760 ;------------------------------------
                           000001  1761 	SIGN=1  ; integer sign 
                           000002  1762 	BASE=2  ; numeric base 
                           000002  1763 	VSIZE=2  ;locals size
      008941                       1764 itoa:
      008941 52 02            [ 2] 1765 	sub sp,#VSIZE
      008943 6B 02            [ 1] 1766 	ld (BASE,sp), a  ; base
      008945 0F 01            [ 1] 1767 	clr (SIGN,sp)    ; sign
      008947 A1 0A            [ 1] 1768 	cp a,#10
      008949 26 0A            [ 1] 1769 	jrne 1$
                                   1770 	; base 10 string display with negative sign if bit 23==1
      00894B 72 0F 00 0C 05   [ 2] 1771 	btjf acc24,#7,1$
      008950 03 01            [ 1] 1772 	cpl (SIGN,sp)
      008952 CD 89 B0         [ 4] 1773 	call neg_acc24
      008955                       1774 1$:
                                   1775 ; initialize string pointer 
      008955 AE 17 5F         [ 2] 1776 	ldw x,#pad+PAD_SIZE-1
      008958 7F               [ 1] 1777 	clr (x)
      008959                       1778 itoa_loop:
      008959 7B 02            [ 1] 1779     ld a,(BASE,sp)
      00895B CD 89 88         [ 4] 1780     call divu24_8 ; acc24/A 
      00895E AB 30            [ 1] 1781     add a,#'0  ; remainder of division
      008960 A1 3A            [ 1] 1782     cp a,#'9+1
      008962 2B 02            [ 1] 1783     jrmi 2$
      008964 AB 07            [ 1] 1784     add a,#7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008966 5A               [ 2] 1785 2$: decw x
      008967 F7               [ 1] 1786     ld (x),a
                                   1787 	; if acc24==0 conversion done
      008968 C6 00 0C         [ 1] 1788 	ld a,acc24
      00896B CA 00 0D         [ 1] 1789 	or a,acc16
      00896E CA 00 0E         [ 1] 1790 	or a,acc8
      008971 26 E6            [ 1] 1791     jrne itoa_loop
                                   1792 	;conversion done, next add '$' or '-' as required
      008973 7B 02            [ 1] 1793 	ld a,(BASE,sp)
      008975 A1 10            [ 1] 1794 	cp a,#16
      008977 27 08            [ 1] 1795 	jreq 8$
      008979 7B 01            [ 1] 1796 	ld a,(SIGN,sp)
      00897B 27 08            [ 1] 1797     jreq 10$
      00897D A6 2D            [ 1] 1798     ld a,#'-
      00897F 20 02            [ 2] 1799 	jra 9$ 
      008981 A6 24            [ 1] 1800 8$: ld a,#'$ 
      008983 5A               [ 2] 1801 9$: decw x
      008984 F7               [ 1] 1802     ld (x),a
      008985                       1803 10$:
      008985 5B 02            [ 2] 1804 	addw sp,#VSIZE
      008987 81               [ 4] 1805 	ret
                                   1806 
                                   1807 ;-------------------------------------
                                   1808 ; divide uint24_t by uint8_t
                                   1809 ; used to convert uint24_t to string
                                   1810 ; input:
                                   1811 ;	acc24	dividend
                                   1812 ;   A 		divisor
                                   1813 ; output:
                                   1814 ;   acc24	quotient
                                   1815 ;   A		remainder
                                   1816 ;------------------------------------- 
                                   1817 ; offset  on sp of arguments and locals
                           000001  1818 	U8   = 1   ; divisor on stack
                           000001  1819 	VSIZE =1
      008988                       1820 divu24_8:
      008988 89               [ 2] 1821 	pushw x ; save x
      008989 88               [ 1] 1822 	push a 
                                   1823 	; ld dividend UU:MM bytes in X
      00898A C6 00 0C         [ 1] 1824 	ld a, acc24
      00898D 95               [ 1] 1825 	ld xh,a
      00898E C6 00 0D         [ 1] 1826 	ld a,acc24+1
      008991 97               [ 1] 1827 	ld xl,a
      008992 7B 01            [ 1] 1828 	ld a,(U8,SP) ; divisor
      008994 62               [ 2] 1829 	div x,a ; UU:MM/U8
      008995 88               [ 1] 1830 	push a  ;save remainder
      008996 9E               [ 1] 1831 	ld a,xh
      008997 C7 00 0C         [ 1] 1832 	ld acc24,a
      00899A 9F               [ 1] 1833 	ld a,xl
      00899B C7 00 0D         [ 1] 1834 	ld acc24+1,a
      00899E 84               [ 1] 1835 	pop a
      00899F 95               [ 1] 1836 	ld xh,a
      0089A0 C6 00 0E         [ 1] 1837 	ld a,acc24+2
      0089A3 97               [ 1] 1838 	ld xl,a
      0089A4 7B 01            [ 1] 1839 	ld a,(U8,sp) ; divisor
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089A6 62               [ 2] 1840 	div x,a  ; R:LL/U8
      0089A7 6B 01            [ 1] 1841 	ld (U8,sp),a ; save remainder
      0089A9 9F               [ 1] 1842 	ld a,xl
      0089AA C7 00 0E         [ 1] 1843 	ld acc24+2,a
      0089AD 84               [ 1] 1844 	pop a
      0089AE 85               [ 2] 1845 	popw x
      0089AF 81               [ 4] 1846 	ret
                                   1847 
                                   1848 ;------------------------------------
                                   1849 ;  two's complement acc24
                                   1850 ;  input:
                                   1851 ;		acc24 variable
                                   1852 ;  output:
                                   1853 ;		acc24 variable
                                   1854 ;-------------------------------------
      0089B0                       1855 neg_acc24:
      0089B0 72 53 00 0E      [ 1] 1856 	cpl acc24+2
      0089B4 72 53 00 0D      [ 1] 1857 	cpl acc24+1
      0089B8 72 53 00 0C      [ 1] 1858 	cpl acc24
      0089BC A6 01            [ 1] 1859 	ld a,#1
      0089BE CB 00 0E         [ 1] 1860 	add a,acc24+2
      0089C1 C7 00 0E         [ 1] 1861 	ld acc24+2,a
      0089C4 4F               [ 1] 1862 	clr a
      0089C5 C9 00 0D         [ 1] 1863 	adc a,acc24+1
      0089C8 C7 00 0D         [ 1] 1864 	ld acc24+1,a 
      0089CB 4F               [ 1] 1865 	clr a 
      0089CC C9 00 0C         [ 1] 1866 	adc a,acc24 
      0089CF C7 00 0C         [ 1] 1867 	ld acc24,a 
      0089D2 81               [ 4] 1868 	ret
                                   1869 
                                   1870 
                                   1871 ;------------------------------------
                                   1872 ; read a line of text from terminal
                                   1873 ; input:
                                   1874 ;	none
                                   1875 ; local variable on stack:
                                   1876 ;	LL  line length
                                   1877 ;   RXCHAR last received chaaracte 
                                   1878 ; output:
                                   1879 ;   text in tib  buffer
                                   1880 ;------------------------------------
                                   1881 	; local variables
                           000001  1882 	LL_HB=1
                           000001  1883 	RXCHAR = 1 ; last char received
                           000002  1884 	LL = 2  ; accepted line length
                           000002  1885 	VSIZE=2 
      0089D3                       1886 readln:
      0089D3 5F               [ 1] 1887 	clrw x 
      0089D4 89               [ 2] 1888 	pushw x 
      0089D5 90 AE 16 E8      [ 2] 1889  	ldw y,#tib ; input buffer
      0089D9                       1890 readln_loop:
      0089D9 CD 82 3C         [ 4] 1891 	call getc
      0089DC 6B 01            [ 1] 1892 	ld (RXCHAR,sp),a
      0089DE A1 0D            [ 1] 1893 	cp a,#CR
      0089E0 26 03            [ 1] 1894 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      0089E2 CC 8A 4E         [ 2] 1895 	jp readln_quit
      0089E5 A1 0A            [ 1] 1896 1$:	cp a,#NL
      0089E7 27 65            [ 1] 1897 	jreq readln_quit
      0089E9 A1 08            [ 1] 1898 	cp a,#BSP
      0089EB 27 3D            [ 1] 1899 	jreq del_back
      0089ED A1 04            [ 1] 1900 	cp a,#CTRL_D
      0089EF 27 2A            [ 1] 1901 	jreq del_ln
      0089F1 A1 12            [ 1] 1902 	cp a,#CTRL_R 
      0089F3 27 06            [ 1] 1903 	jreq reprint 
                                   1904 ;	cp a,#'[
                                   1905 ;	jreq ansi_seq
      0089F5                       1906 final_test:
      0089F5 A1 20            [ 1] 1907 	cp a,#SPACE
      0089F7 2A 40            [ 1] 1908 	jrpl accept_char
      0089F9 20 DE            [ 2] 1909 	jra readln_loop
      0089FB                       1910 ansi_seq:
                                   1911 ;	call getc
                                   1912 ;	cp a,#'C 
                                   1913 ;	jreq rigth_arrow
                                   1914 ;	cp a,#'D 
                                   1915 ;	jreq left_arrow 
                                   1916 ;	jra final_test
      0089FB                       1917 right_arrow:
                                   1918 ;	ld a,#BSP 
                                   1919 ;	call putc 
                                   1920 ;	jra realn_loop 
      0089FB                       1921 left_arrow:
                                   1922 
                                   1923 ;	jra readln_loop
      0089FB                       1924 reprint: 
      0089FB 0D 02            [ 1] 1925 	tnz (LL,sp)
      0089FD 26 DA            [ 1] 1926 	jrne readln_loop
      0089FF AE 16 E8         [ 2] 1927 	ldw x,#tib 
      008A02 CD 82 7A         [ 4] 1928 	call strlen 
      008A05 90 AE 16 E8      [ 2] 1929 	ldw y,#tib 
      008A09 9F               [ 1] 1930 	ld a,xl
      008A0A 27 CD            [ 1] 1931 	jreq readln_loop
      008A0C 6B 02            [ 1] 1932 	ld (LL,sp),a 
      008A0E AE 16 E8         [ 2] 1933 	ldw x,#tib 
      008A11 CD 82 46         [ 4] 1934 	call puts
      008A14 0F 01            [ 1] 1935 	clr (LL_HB,sp)
      008A16 72 F9 01         [ 2] 1936 	addw y,(LL_HB,sp)
      008A19 20 BE            [ 2] 1937 	jra readln_loop 
      008A1B                       1938 del_ln:
      008A1B 7B 02            [ 1] 1939 	ld a,(LL,sp)
      008A1D CD 82 60         [ 4] 1940 	call delete
      008A20 90 AE 16 E8      [ 2] 1941 	ldw y,#tib
      008A24 90 7F            [ 1] 1942 	clr (y)
      008A26 0F 02            [ 1] 1943 	clr (LL,sp)
      008A28 20 AF            [ 2] 1944 	jra readln_loop
      008A2A                       1945 del_back:
      008A2A 0D 02            [ 1] 1946     tnz (LL,sp)
      008A2C 27 AB            [ 1] 1947     jreq readln_loop
      008A2E 0A 02            [ 1] 1948     dec (LL,sp)
      008A30 90 5A            [ 2] 1949     decw y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A32 90 7F            [ 1] 1950     clr  (y)
      008A34 CD 82 50         [ 4] 1951     call bksp 
      008A37 20 A0            [ 2] 1952     jra readln_loop	
      008A39                       1953 accept_char:
      008A39 A6 4F            [ 1] 1954 	ld a,#TIB_SIZE-1
      008A3B 11 02            [ 1] 1955 	cp a, (LL,sp)
      008A3D 27 9A            [ 1] 1956 	jreq readln_loop
      008A3F 7B 01            [ 1] 1957 	ld a,(RXCHAR,sp)
      008A41 90 F7            [ 1] 1958 	ld (y),a
      008A43 0C 02            [ 1] 1959 	inc (LL,sp)
      008A45 90 5C            [ 2] 1960 	incw y
      008A47 90 7F            [ 1] 1961 	clr (y)
      008A49 CD 82 33         [ 4] 1962 	call putc 
      008A4C 20 8B            [ 2] 1963 	jra readln_loop
      008A4E                       1964 readln_quit:
      008A4E 90 7F            [ 1] 1965 	clr (y)
      008A50 7B 02            [ 1] 1966 	ld a,(LL,sp)
      008A52 C7 00 04         [ 1] 1967 	ld count,a 
      0009D5                       1968 	_drop VSIZE 
      008A55 5B 02            [ 2]    1     addw sp,#VSIZE 
      008A57 A6 0D            [ 1] 1969 	ld a,#CR
      008A59 CD 82 33         [ 4] 1970 	call putc
      008A5C 81               [ 4] 1971 	ret
                                   1972 
                           000000  1973 .if DEBUG 	
                                   1974 ;----------------------------
                                   1975 ; command interface
                                   1976 ; only 3 commands:
                                   1977 ;  'q' to resume application
                                   1978 ;  'p [addr]' to print memory values 
                                   1979 ;  's addr' to print string 
                                   1980 ;----------------------------
                                   1981 ;local variable 
                                   1982 	PSIZE=1
                                   1983 	VSIZE=1 
                                   1984 cmd_itf:
                                   1985 	sub sp,#VSIZE 
                                   1986 	clr farptr 
                                   1987 	clr farptr+1 
                                   1988 	clr farptr+2  
                                   1989 repl:
                                   1990 	ld a,#CR 
                                   1991 	call putc 
                                   1992 	ld a,#'? 
                                   1993 	call putc
                                   1994 	clr in.w 
                                   1995 	clr in 
                                   1996 	call readln
                                   1997 	ldw y,#tib  
                                   1998 	ld a,(y)
                                   1999 	jreq repl  
                                   2000 	inc in 
                                   2001 	call to_upper 
                                   2002 	cp a,#'Q 
                                   2003 	jrne test_p
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2004 repl_exit:
                                   2005 	clr tib 
                                   2006 	clr count 
                                   2007 	clr in 
                                   2008 	_drop #VSIZE 	
                                   2009 	ret  
                                   2010 invalid:
                                   2011 	ldw x,#invalid_cmd 
                                   2012 	call puts 
                                   2013 	jra repl 
                                   2014 test_p:	
                                   2015     cp a,#'P 
                                   2016 	jreq mem_peek
                                   2017     cp a,#'S 
                                   2018 	jrne invalid 
                                   2019 print_string:	
                                   2020 	call get_token
                                   2021 	cp a,#TK_INTGR 
                                   2022 	jrne invalid 
                                   2023 	call puts
                                   2024 	jp repl 	
                                   2025 mem_peek:
                                   2026 	ld a,#SPACE 
                                   2027 	call skip  	 
                                   2028 	addw y,in.w 
                                   2029 	ldw x,#pad 
                                   2030 	call strcpy
                                   2031 	call atoi24 	
                                   2032 	ld a, acc24 
                                   2033 	or a,acc16 
                                   2034 	or a,acc8 
                                   2035 	jrne 1$ 
                                   2036 	jra peek_byte  
                                   2037 1$:	ldw x,acc24 
                                   2038 	ldw farptr,x 
                                   2039 	ld a,acc8 
                                   2040 	ld farptr+2,a 
                                   2041 peek_byte:
                                   2042 	call print_farptr 
                                   2043 	ld a,#8 
                                   2044 	ld (PSIZE,sp),a 
                                   2045 	clrw x 
                                   2046 1$:	call fetchc  
                                   2047 	pushw x 
                                   2048 	ld acc8,a 
                                   2049 	clrw x 
                                   2050 	ldw acc24,x 
                                   2051 	ld a,#16+128
                                   2052 	call prti24
                                   2053 	popw x 
                                   2054 	dec (PSIZE,sp)
                                   2055 	jrne 1$ 
                                   2056 	ld a,#8 
                                   2057 	add a,farptr+2 
                                   2058 	ld farptr+2,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2059 	clr a 
                                   2060 	adc a,farptr+1 
                                   2061 	ld farptr+1,a 
                                   2062 	clr a 
                                   2063 	adc a,farptr 
                                   2064 	ld farptr,a 
                                   2065 	jp repl  
                                   2066 
                                   2067 invalid_cmd: .asciz "not a command\n" 
                                   2068 
                                   2069 ;----------------------------
                                   2070 ; display farptr address
                                   2071 ;----------------------------
                                   2072 print_farptr:
                                   2073 	ld a ,farptr+2 
                                   2074 	ld acc8,a 
                                   2075 	ldw x,farptr 
                                   2076 	ldw acc24,x 
                                   2077 	clrw x 
                                   2078 	ld a,#16 
                                   2079 	call prti24
                                   2080 	ld a,#SPACE 
                                   2081 	call putc 
                                   2082 	call putc 
                                   2083 	ret
                                   2084 
                                   2085 ;------------------------------------
                                   2086 ; get byte at address farptr[X]
                                   2087 ; input:
                                   2088 ;	 farptr   address to peek
                                   2089 ;    X		  farptr index 	
                                   2090 ; output:
                                   2091 ;	 A 		  byte from memory  
                                   2092 ;    x		  incremented by 1
                                   2093 ;------------------------------------
                                   2094 fetchc: ; @C
                                   2095 	ldf a,([farptr],x)
                                   2096 	incw x
                                   2097 	ret
                                   2098 
                                   2099 
                                   2100 ;------------------------------------
                                   2101 ; expect a number from command line 
                                   2102 ; next argument
                                   2103 ;  input:
                                   2104 ;	  none
                                   2105 ;  output:
                                   2106 ;    acc24   int24_t 
                                   2107 ;------------------------------------
                                   2108 number::
                                   2109 	call get_token
                                   2110 	call atoi24
                                   2111 	ret
                                   2112 .endif ; DEBUG 
                                   2113 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2114 
                                   2115 
                                   2116 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2117 ;; compiler routines        ;;
                                   2118 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2119 ;------------------------------------
                                   2120 ; parse quoted string 
                                   2121 ; input:
                                   2122 ;   Y 	pointer to tib 
                                   2123 ;   X   pointer to pad
                                   2124 ; output:
                                   2125 ;	pad   parsed string
                                   2126 ;   TOS  char* to pad  
                                   2127 ;------------------------------------
                           000001  2128 	PREV = 1
                           000002  2129 	CURR =2 
                           000002  2130 	VSIZE=2 
      008A5D                       2131 parse_quote: ; { -- addr }
      0009DD                       2132 	_vars VSIZE 
      008A5D 52 02            [ 2]    1     sub sp,#VSIZE 
      008A5F 4F               [ 1] 2133 	clr a
      008A60 6B 01            [ 1] 2134 1$:	ld (PREV,sp),a 
      008A62 72 5C 00 02      [ 1] 2135 2$:	inc in
      008A66 91 D6 01         [ 4] 2136 	ld a,([in.w],y)
      008A69 27 24            [ 1] 2137 	jreq 6$
      008A6B 6B 02            [ 1] 2138 	ld (CURR,sp),a 
      008A6D A6 5C            [ 1] 2139 	ld a,#'\
      008A6F 11 01            [ 1] 2140 	cp a, (PREV,sp)
      008A71 26 0A            [ 1] 2141 	jrne 3$
      008A73 0F 01            [ 1] 2142 	clr (PREV,sp)
      008A75 7B 02            [ 1] 2143 	ld a,(CURR,sp)
      008A77 AD 1F            [ 4] 2144 	callr convert_escape
      008A79 F7               [ 1] 2145 	ld (x),a 
      008A7A 5C               [ 2] 2146 	incw x 
      008A7B 20 E5            [ 2] 2147 	jra 2$
      008A7D                       2148 3$:
      008A7D 7B 02            [ 1] 2149 	ld a,(CURR,sp)
      008A7F A1 5C            [ 1] 2150 	cp a,#'\'
      008A81 27 DD            [ 1] 2151 	jreq 1$
      008A83 A1 22            [ 1] 2152 	cp a,#'"
      008A85 27 04            [ 1] 2153 	jreq 5$ 
      008A87 F7               [ 1] 2154 	ld (x),a 
      008A88 5C               [ 2] 2155 	incw x 
      008A89 20 D7            [ 2] 2156 	jra 2$
      008A8B 72 5C 00 02      [ 1] 2157 5$:	inc in 
      008A8F 7F               [ 1] 2158 6$: clr (x)
      008A90 AE 17 38         [ 2] 2159 	ldw x,#pad 
      000A13                       2160 	_drop VSIZE
      008A93 5B 02            [ 2]    1     addw sp,#VSIZE 
      008A95 A6 0A            [ 1] 2161 	ld a,#TK_QSTR  
      008A97 81               [ 4] 2162 	ret 
                                   2163 
                                   2164 ;---------------------------------------
                                   2165 ; called by parse_quote
                                   2166 ; subtitute escaped character 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2167 ; by their ASCII value .
                                   2168 ; input:
                                   2169 ;   A  character following '\'
                                   2170 ; output:
                                   2171 ;   A  substitued char or same if not valid.
                                   2172 ;---------------------------------------
      008A98                       2173 convert_escape:
      008A98 89               [ 2] 2174 	pushw x 
      008A99 AE 8A AD         [ 2] 2175 	ldw x,#escaped 
      008A9C F1               [ 1] 2176 1$:	cp a,(x)
      008A9D 27 06            [ 1] 2177 	jreq 2$
      008A9F 7D               [ 1] 2178 	tnz (x)
      008AA0 27 09            [ 1] 2179 	jreq 3$
      008AA2 5C               [ 2] 2180 	incw x 
      008AA3 20 F7            [ 2] 2181 	jra 1$
      008AA5 1D 8A AD         [ 2] 2182 2$: subw x,#escaped 
      008AA8 9F               [ 1] 2183 	ld a,xl 
      008AA9 AB 07            [ 1] 2184 	add a,#7
      008AAB 85               [ 2] 2185 3$:	popw x 
      008AAC 81               [ 4] 2186 	ret 
                                   2187 
      008AAD 61 62 74 6E 76 66 72  2188 escaped: .asciz "abtnvfr"
             00
                                   2189 
                                   2190 ;-------------------------
                                   2191 ; integer parser 
                                   2192 ; input:
                                   2193 ;   X 		point to pad 
                                   2194 ;   Y 		point to tib 
                                   2195 ;   A 	    first digit|'$' 
                                   2196 ; output:  
                                   2197 ;   pad     number string 
                                   2198 ;   X 		integer 
                                   2199 ;   A 		TK_INTGR
                                   2200 ;-------------------------
                           000001  2201 	BASE=1
                           000002  2202 	TCHAR=2 
                           000002  2203 	VSIZE=2 
      008AB5                       2204 parse_integer: ; { -- n }
      008AB5 4B 00            [ 1] 2205 	push #0 ; TCHAR 
      008AB7 A1 24            [ 1] 2206 	cp a,#'$
      008AB9 27 04            [ 1] 2207 	jreq 1$ 
      008ABB 4B 0A            [ 1] 2208 	push #10 ; BASE=10 
      008ABD 20 02            [ 2] 2209 	jra 2$ 
      008ABF 4B 10            [ 1] 2210 1$: push #16  ; BASE=16
      008AC1 F7               [ 1] 2211 2$:	ld (x),a 
      008AC2 5C               [ 2] 2212 	incw x 
      008AC3 72 5C 00 02      [ 1] 2213 	inc in 
      008AC7 91 D6 01         [ 4] 2214 	ld a,([in.w],y)
      008ACA CD 8D 13         [ 4] 2215 	call to_upper 
      008ACD 6B 02            [ 1] 2216 	ld (TCHAR,sp),a 
      008ACF CD 8D 0A         [ 4] 2217 	call is_digit 
      008AD2 25 ED            [ 1] 2218 	jrc 2$
      008AD4 A6 10            [ 1] 2219 	ld a,#16 
      008AD6 11 01            [ 1] 2220 	cp a,(BASE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008AD8 26 0A            [ 1] 2221 	jrne 3$ 
      008ADA 7B 02            [ 1] 2222 	ld a,(TCHAR,sp)
      008ADC A1 41            [ 1] 2223 	cp a,#'A 
      008ADE 2B 04            [ 1] 2224 	jrmi 3$ 
      008AE0 A1 47            [ 1] 2225 	cp a,#'G 
      008AE2 2B DD            [ 1] 2226 	jrmi 2$ 
      008AE4 7F               [ 1] 2227 3$:	clr (x)
      008AE5 CD 8D 1F         [ 4] 2228 	call atoi24
      008AE8 CE 00 0D         [ 2] 2229 	ldw x,acc16 
      008AEB A6 04            [ 1] 2230 	ld a,#TK_INTGR
      000A6D                       2231 	_drop VSIZE  
      008AED 5B 02            [ 2]    1     addw sp,#VSIZE 
      008AEF 81               [ 4] 2232 	ret 	
                                   2233 
                                   2234 ;-------------------------
                                   2235 ; binary integer parser 
                                   2236 ; input:
                                   2237 ;   X 		point to pad 
                                   2238 ;   Y 		point to tib 
                                   2239 ;   A 	    '%' 
                                   2240 ; output:  
                                   2241 ;   pad     number string 
                                   2242 ;   X 		integer 
                                   2243 ;   A 		TK_INTGR
                                   2244 ;   TOS     integer 
                                   2245 ;-------------------------
                           000001  2246 	BINARY=1
                           000002  2247 	VSIZE=2
      008AF0                       2248 parse_binary: ; { -- n }
      008AF0 4B 00            [ 1] 2249 	push #0
      008AF2 4B 00            [ 1] 2250 	push #0
      008AF4 F7               [ 1] 2251 1$: ld (x),a 
      008AF5 5C               [ 2] 2252 	incw x 
      008AF6 72 5C 00 02      [ 1] 2253 	inc in 
      008AFA 91 D6 01         [ 4] 2254 	ld a,([in.w],y)
      008AFD A1 30            [ 1] 2255 	cp a,#'0 
      008AFF 27 06            [ 1] 2256 	jreq 2$
      008B01 A1 31            [ 1] 2257 	cp a,#'1 
      008B03 27 02            [ 1] 2258 	jreq 2$ 
      008B05 20 09            [ 2] 2259 	jra bin_exit 
      008B07 A0 30            [ 1] 2260 2$: sub a,#'0	
      008B09 46               [ 1] 2261 	rrc a 
      008B0A 09 02            [ 1] 2262 	rlc (BINARY+1,sp)
      008B0C 09 01            [ 1] 2263 	rlc (BINARY,sp)
      008B0E 20 E4            [ 2] 2264 	jra 1$  
      008B10                       2265 bin_exit:
      008B10 7F               [ 1] 2266 	clr (x)
      008B11 1E 01            [ 2] 2267 	ldw x,(BINARY,sp)
      008B13 A6 04            [ 1] 2268 	ld a,#TK_INTGR 	
      000A95                       2269 	_drop VSIZE 
      008B15 5B 02            [ 2]    1     addw sp,#VSIZE 
      008B17 81               [ 4] 2270 	ret
                                   2271 
                                   2272 ;---------------------------
                                   2273 ;  token begin with a letter,
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



                                   2274 ;  is keyword or variable. 	
                                   2275 ; input:
                                   2276 ;   X 		point to pad 
                                   2277 ;   Y 		point to text
                                   2278 ;   A 	    first letter  
                                   2279 ; output:
                                   2280 ;   X		exec_addr|var_addr 
                                   2281 ;   A 		TK_CMD 
                                   2282 ;   pad 	keyword|var_name  
                                   2283 ;   TOS     exec_addr|var_addr 
                                   2284 ;--------------------------  
      008B18                       2285 parse_keyword: ; { -- exec_addr|var_addr}
      008B18 CD 8D 13         [ 4] 2286 	call to_upper 
      008B1B F7               [ 1] 2287 	ld (x),a 
      008B1C 5C               [ 2] 2288 	incw x 
      008B1D 72 5C 00 02      [ 1] 2289 	inc in 
      008B21 91 D6 01         [ 4] 2290 	ld a,([in.w],y)
      008B24 CD 84 FD         [ 4] 2291 	call is_alpha 
      008B27 25 EF            [ 1] 2292 	jrc parse_keyword 
      008B29 7F               [ 1] 2293 1$: clr (x)
      008B2A 72 5D 17 39      [ 1] 2294 	tnz pad+1 
      008B2E 26 15            [ 1] 2295 	jrne 2$
                                   2296 ; one letter variable name 
      008B30 C6 17 38         [ 1] 2297 	ld a,pad 
      008B33 A0 41            [ 1] 2298 	sub a,#'A 
      008B35 48               [ 1] 2299 	sll a 
      008B36 88               [ 1] 2300 	push a 
      008B37 4B 00            [ 1] 2301 	push #0
      008B39 AE 00 29         [ 2] 2302 	ldw x,#vars 
      008B3C 72 FB 01         [ 2] 2303 	addw x,(1,sp) ; X=var address 
      000ABF                       2304 	_drop 2 
      008B3F 5B 02            [ 2]    1     addw sp,#2 
      008B41 A6 05            [ 1] 2305 	ld a,#TK_VAR 
      008B43 20 0C            [ 2] 2306 	jra 4$ 
      008B45                       2307 2$: ; check for keyword, otherwise syntax error.
      000AC5                       2308 	_ldx_dict kword_dict
      008B45 AE A5 E4         [ 2]    1     ldw x,#kword_dict+2
      008B48 CD 8F 86         [ 4] 2309 	call search_dict
      008B4B 4D               [ 1] 2310 	tnz a
      008B4C 26 03            [ 1] 2311 	jrne 4$ 
      008B4E CC 87 92         [ 2] 2312 	jp syntax_error
      008B51 81               [ 4] 2313 4$:	ret  	
                                   2314 
                                   2315 
                                   2316 ;------------------------------------
                                   2317 ; scan text for next token
                                   2318 ; move token in 'pad'
                                   2319 ; input: 
      008B52                       2320 	none: 
                                   2321 ; use:
                                   2322 ;	Y   pointer to text
                                   2323 ;   X	pointer to pad 
                                   2324 ;   in.w   index in text buffer
                                   2325 ; output:
                                   2326 ;   A       token attribute 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2327 ;   pad 	token as .asciz
                                   2328 ;   X 		token value   
                                   2329 ;------------------------------------
                                   2330 	; use to check special character 
                                   2331 	.macro _case c t  
                                   2332 	ld a,#c 
                                   2333 	cp a,(TCHAR,sp) 
                                   2334 	jrne t
                                   2335 	.endm 
                                   2336 
                           000001  2337 	TCHAR=1
                           000002  2338 	ATTRIB=2 
                           000002  2339 	VSIZE=2
      008B52                       2340 get_token: 
      008B52 90 AE 16 E8      [ 2] 2341 	ldw y,#tib    	
      008B56 C6 00 02         [ 1] 2342 	ld a,in 
      008B59 C1 00 04         [ 1] 2343 	cp a,count 
      008B5C 2B 03            [ 1] 2344 	jrmi 1$
      008B5E A6 00            [ 1] 2345 	ld a,#TK_NONE 
      008B60 81               [ 4] 2346 	ret 
      008B61                       2347 1$:	
      000AE1                       2348 	_vars VSIZE
      008B61 52 02            [ 2]    1     sub sp,#VSIZE 
      008B63 AE 17 38         [ 2] 2349 	ldw x, #pad
      008B66 A6 20            [ 1] 2350 	ld a,#SPACE
      008B68 CD 8D CB         [ 4] 2351 	call skip
      008B6B 55 00 02 00 03   [ 1] 2352 	mov in.saved,in 
      008B70 91 D6 01         [ 4] 2353 	ld a,([in.w],y)
      008B73 26 07            [ 1] 2354 	jrne str_tst
      008B75 72 5F 17 38      [ 1] 2355 	clr pad 
      008B79 CC 8D 07         [ 2] 2356 	jp token_exit ; end of line 
                                   2357 
      008B7C                       2358 str_tst: ; check for quoted string  	
      008B7C CD 8D 13         [ 4] 2359 	call to_upper 
      008B7F 6B 01            [ 1] 2360 	ld (TCHAR,sp),a 
      000B01                       2361 	_case '"' nbr_tst
      008B81 A6 22            [ 1]    1 	ld a,#'"' 
      008B83 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008B85 26 06            [ 1]    3 	jrne nbr_tst
      008B87 CD 8A 5D         [ 4] 2362 	call parse_quote
      008B8A CC 8D 07         [ 2] 2363 	jp token_exit
      008B8D                       2364 nbr_tst: ; check for number 
      008B8D A6 24            [ 1] 2365 	ld a,#'$'
      008B8F 11 01            [ 1] 2366 	cp a,(TCHAR,sp) 
      008B91 27 13            [ 1] 2367 	jreq 1$
      008B93 A6 26            [ 1] 2368 	ld a,#'&
      008B95 11 01            [ 1] 2369 	cp a,(TCHAR,sp)
      008B97 26 06            [ 1] 2370 	jrne 0$
      008B99 CD 8A F0         [ 4] 2371 	call parse_binary ; expect binary integer 
      008B9C CC 8D 07         [ 2] 2372 	jp token_exit 
      008B9F 7B 01            [ 1] 2373 0$:	ld a,(TCHAR,sp)
      008BA1 CD 8D 0A         [ 4] 2374 	call is_digit
      008BA4 24 06            [ 1] 2375 	jrnc 3$
      008BA6 CD 8A B5         [ 4] 2376 1$:	call parse_integer 
      008BA9 CC 8D 07         [ 2] 2377 	jp token_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008BAC                       2378 3$: 
      000B2C                       2379 	_case '(' bkslsh_tst 
      008BAC A6 28            [ 1]    1 	ld a,#'(' 
      008BAE 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BB0 26 05            [ 1]    3 	jrne bkslsh_tst
      008BB2 A6 0B            [ 1] 2380 	ld a,#TK_LPAREN
      008BB4 CC 8C F7         [ 2] 2381 	jp token_char   	
      008BB7                       2382 bkslsh_tst: ; character token 
      000B37                       2383 	_case '\',rparnt_tst
      008BB7 A6 5C            [ 1]    1 	ld a,#'\' 
      008BB9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BBB 26 18            [ 1]    3 	jrne rparnt_tst
      008BBD 7B 01            [ 1] 2384 	ld a,(TCHAR,sp)
      008BBF F7               [ 1] 2385 	ld (x),a 
      008BC0 5C               [ 2] 2386 	incw x 
      008BC1 72 5C 00 02      [ 1] 2387 	inc in 
      008BC5 91 D6 01         [ 4] 2388 	ld a,([in.w],y)
      008BC8 F7               [ 1] 2389 	ld (x),a 
      008BC9 5C               [ 2] 2390 	incw x 
      008BCA 72 5C 00 02      [ 1] 2391 	inc in  
      008BCE 7F               [ 1] 2392 	clr (x) 
      008BCF 97               [ 1] 2393 	ld xl,a 
      008BD0 A6 03            [ 1] 2394 	ld a,#TK_CHAR 
      008BD2 CC 8D 07         [ 2] 2395 	jp token_exit 
      008BD5                       2396 rparnt_tst:		
      000B55                       2397 	_case ')' colon_tst 
      008BD5 A6 29            [ 1]    1 	ld a,#')' 
      008BD7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BD9 26 05            [ 1]    3 	jrne colon_tst
      008BDB A6 0C            [ 1] 2398 	ld a,#TK_RPAREN 
      008BDD CC 8C F7         [ 2] 2399 	jp token_char 
      008BE0                       2400 colon_tst:
      000B60                       2401 	_case ':' comma_tst 
      008BE0 A6 3A            [ 1]    1 	ld a,#':' 
      008BE2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BE4 26 05            [ 1]    3 	jrne comma_tst
      008BE6 A6 01            [ 1] 2402 	ld a,#TK_COLON 
      008BE8 CC 8C F7         [ 2] 2403 	jp token_char 
      008BEB                       2404 comma_tst:
      000B6B                       2405 	_case COMMA sharp_tst 
      008BEB A6 2C            [ 1]    1 	ld a,#COMMA 
      008BED 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BEF 26 05            [ 1]    3 	jrne sharp_tst
      008BF1 A6 0D            [ 1] 2406 	ld a,#TK_COMMA
      008BF3 CC 8C F7         [ 2] 2407 	jp token_char
      008BF6                       2408 sharp_tst:
      000B76                       2409 	_case SHARP dash_tst 
      008BF6 A6 23            [ 1]    1 	ld a,#SHARP 
      008BF8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BFA 26 05            [ 1]    3 	jrne dash_tst
      008BFC A6 0E            [ 1] 2410 	ld a,#TK_SHARP
      008BFE CC 8C F7         [ 2] 2411 	jp token_char  	 	 
      008C01                       2412 dash_tst: 	
      000B81                       2413 	_case '-' at_tst 
      008C01 A6 2D            [ 1]    1 	ld a,#'-' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008C03 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C05 26 05            [ 1]    3 	jrne at_tst
      008C07 A6 11            [ 1] 2414 	ld a,#TK_MINUS  
      008C09 CC 8C F7         [ 2] 2415 	jp token_char 
      008C0C                       2416 at_tst:
      000B8C                       2417 	_case '@' qmark_tst 
      008C0C A6 40            [ 1]    1 	ld a,#'@' 
      008C0E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C10 26 05            [ 1]    3 	jrne qmark_tst
      008C12 A6 02            [ 1] 2418 	ld a,#TK_ARRAY 
      008C14 CC 8C F7         [ 2] 2419 	jp token_char
      008C17                       2420 qmark_tst:
      000B97                       2421 	_case '?' tick_tst 
      008C17 A6 3F            [ 1]    1 	ld a,#'?' 
      008C19 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C1B 26 11            [ 1]    3 	jrne tick_tst
      008C1D 7B 01            [ 1] 2422 	ld a,(TCHAR,sp)
      008C1F F7               [ 1] 2423 	ld (x),a 
      008C20 5C               [ 2] 2424 	incw x 
      008C21 7F               [ 1] 2425 	clr (x)
      008C22 72 5C 00 02      [ 1] 2426 	inc in 
      008C26 A6 06            [ 1] 2427 	ld a,#TK_CMD 
      008C28 AE 94 2D         [ 2] 2428 	ldw x,#print 
      008C2B CC 8D 07         [ 2] 2429 	jp token_exit
      008C2E                       2430 tick_tst: ; ignore comment 
      000BAE                       2431 	_case TICK plus_tst 
      008C2E A6 27            [ 1]    1 	ld a,#TICK 
      008C30 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C32 26 0C            [ 1]    3 	jrne plus_tst
      008C34 72 5C 00 02      [ 1] 2432 	inc in 
      008C38 A6 06            [ 1] 2433 	ld a,#TK_CMD 
      008C3A AE 95 1C         [ 2] 2434 	ldw x,#rem 
      008C3D CC 8D 07         [ 2] 2435 	jp token_exit 
      008C40                       2436 plus_tst:
      000BC0                       2437 	_case '+' star_tst 
      008C40 A6 2B            [ 1]    1 	ld a,#'+' 
      008C42 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C44 26 05            [ 1]    3 	jrne star_tst
      008C46 A6 10            [ 1] 2438 	ld a,#TK_PLUS  
      008C48 CC 8C F7         [ 2] 2439 	jp token_char 
      008C4B                       2440 star_tst:
      000BCB                       2441 	_case '*' slash_tst 
      008C4B A6 2A            [ 1]    1 	ld a,#'*' 
      008C4D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C4F 26 05            [ 1]    3 	jrne slash_tst
      008C51 A6 20            [ 1] 2442 	ld a,#TK_MULT 
      008C53 CC 8C F7         [ 2] 2443 	jp token_char 
      008C56                       2444 slash_tst: 
      000BD6                       2445 	_case '/' prcnt_tst 
      008C56 A6 2F            [ 1]    1 	ld a,#'/' 
      008C58 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C5A 26 05            [ 1]    3 	jrne prcnt_tst
      008C5C A6 21            [ 1] 2446 	ld a,#TK_DIV 
      008C5E CC 8C F7         [ 2] 2447 	jp token_char 
      008C61                       2448 prcnt_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      000BE1                       2449 	_case '%' eql_tst 
      008C61 A6 25            [ 1]    1 	ld a,#'%' 
      008C63 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C65 26 05            [ 1]    3 	jrne eql_tst
      008C67 A6 22            [ 1] 2450 	ld a,#TK_MOD
      008C69 CC 8C F7         [ 2] 2451 	jp token_char  
                                   2452 ; 1 or 2 character tokens 	
      008C6C                       2453 eql_tst:
      000BEC                       2454 	_case '=' gt_tst 		
      008C6C A6 3D            [ 1]    1 	ld a,#'=' 
      008C6E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C70 26 05            [ 1]    3 	jrne gt_tst
      008C72 A6 32            [ 1] 2455 	ld a,#TK_EQUAL
      008C74 CC 8C F7         [ 2] 2456 	jp token_char 
      008C77                       2457 gt_tst:
      000BF7                       2458 	_case '>' lt_tst 
      008C77 A6 3E            [ 1]    1 	ld a,#'>' 
      008C79 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C7B 26 33            [ 1]    3 	jrne lt_tst
      008C7D A6 31            [ 1] 2459 	ld a,#TK_GT 
      008C7F 6B 02            [ 1] 2460 	ld (ATTRIB,sp),a 
      008C81 72 5C 00 02      [ 1] 2461 	inc in 
      008C85 91 D6 01         [ 4] 2462 	ld a,([in.w],y)
      008C88 A1 3D            [ 1] 2463 	cp a,#'=
      008C8A 26 0C            [ 1] 2464 	jrne 1$
      008C8C 7B 01            [ 1] 2465 	ld a,(TCHAR,sp)
      008C8E F7               [ 1] 2466 	ld (x),a
      008C8F 5C               [ 2] 2467 	incw x 
      008C90 A6 3D            [ 1] 2468 	ld a,#'=
      008C92 6B 01            [ 1] 2469 	ld (TCHAR,sp),a 
      008C94 A6 33            [ 1] 2470 	ld a,#TK_GE 
      008C96 20 5F            [ 2] 2471 	jra token_char  
      008C98 A1 3C            [ 1] 2472 1$: cp a,#'<
      008C9A 26 0C            [ 1] 2473 	jrne 2$
      008C9C 7B 01            [ 1] 2474 	ld a,(TCHAR,sp)
      008C9E F7               [ 1] 2475 	ld (x),a
      008C9F 5C               [ 2] 2476 	incw x 
      008CA0 A6 3C            [ 1] 2477 	ld a,#'<	
      008CA2 6B 01            [ 1] 2478 	ld (TCHAR,sp),a 
      008CA4 A6 35            [ 1] 2479 	ld a,#TK_NE 
      008CA6 20 4F            [ 2] 2480 	jra token_char 
      008CA8 72 5A 00 02      [ 1] 2481 2$: dec in
      008CAC 7B 02            [ 1] 2482 	ld a,(ATTRIB,sp)
      008CAE 20 47            [ 2] 2483 	jra token_char 
      008CB0                       2484 lt_tst:
      000C30                       2485 	_case '<' other
      008CB0 A6 3C            [ 1]    1 	ld a,#'<' 
      008CB2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CB4 26 32            [ 1]    3 	jrne other
      008CB6 A6 34            [ 1] 2486 	ld a,#TK_LT 
      008CB8 6B 02            [ 1] 2487 	ld (ATTRIB,sp),a 
      008CBA 72 5C 00 02      [ 1] 2488 	inc in 
      008CBE 91 D6 01         [ 4] 2489 	ld a,([in.w],y)
      008CC1 A1 3D            [ 1] 2490 	cp a,#'=
      008CC3 26 0B            [ 1] 2491 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008CC5 7B 01            [ 1] 2492 	ld a,(TCHAR,sp)
      008CC7 F7               [ 1] 2493 	ld (x),a 
      008CC8 A6 3D            [ 1] 2494 	ld a,#'=
      008CCA 6B 01            [ 1] 2495 	ld (TCHAR,sp),a 
      008CCC A6 36            [ 1] 2496 	ld a,#TK_LE 
      008CCE 20 27            [ 2] 2497 	jra token_char 
      008CD0 A1 3E            [ 1] 2498 1$: cp a,#'>
      008CD2 26 0C            [ 1] 2499 	jrne 2$
      008CD4 7B 01            [ 1] 2500 	ld a,(TCHAR,sp)
      008CD6 F7               [ 1] 2501 	ld (x),a 
      008CD7 5C               [ 2] 2502 	incw x 
      008CD8 A6 3E            [ 1] 2503 	ld a,#'>
      008CDA 6B 01            [ 1] 2504 	ld (TCHAR,sp),a 
      008CDC A6 35            [ 1] 2505 	ld a,#TK_NE 
      008CDE 20 17            [ 2] 2506 	jra token_char 
      008CE0 72 5A 00 02      [ 1] 2507 2$: dec in 
      008CE4 7B 02            [ 1] 2508 	ld a,(ATTRIB,sp)
      008CE6 20 0F            [ 2] 2509 	jra token_char 	
      008CE8                       2510 other: ; not a special character 	 
      008CE8 7B 01            [ 1] 2511 	ld a,(TCHAR,sp)
      008CEA CD 84 FD         [ 4] 2512 	call is_alpha 
      008CED 25 03            [ 1] 2513 	jrc 30$ 
      008CEF CC 87 92         [ 2] 2514 	jp syntax_error 
      008CF2                       2515 30$: 
      008CF2 CD 8B 18         [ 4] 2516 	call parse_keyword
      008CF5 20 10            [ 2] 2517 	jra token_exit 
      008CF7                       2518 token_char:
      008CF7 6B 02            [ 1] 2519 	ld (ATTRIB,sp),a 
      008CF9 7B 01            [ 1] 2520 	ld a,(TCHAR,sp)
      008CFB F7               [ 1] 2521 	ld (x),a 
      008CFC 5C               [ 2] 2522 	incw x 
      008CFD 7F               [ 1] 2523 	clr(x)
      008CFE 72 5C 00 02      [ 1] 2524 	inc in 
      008D02 7B 02            [ 1] 2525 	ld a,(ATTRIB,sp)
      008D04 AE 17 38         [ 2] 2526 	ldw x,#pad 
      008D07                       2527 token_exit:
      000C87                       2528 	_drop VSIZE 
      008D07 5B 02            [ 2]    1     addw sp,#VSIZE 
      008D09 81               [ 4] 2529 	ret
                                   2530 
                                   2531 ;------------------------------------
                                   2532 ; check if character in {'0'..'9'}
                                   2533 ; input:
                                   2534 ;    A  character to test
                                   2535 ; output:
                                   2536 ;    Carry  0 not digit | 1 digit
                                   2537 ;------------------------------------
      008D0A                       2538 is_digit:
      008D0A A1 30            [ 1] 2539 	cp a,#'0
      008D0C 25 03            [ 1] 2540 	jrc 1$
      008D0E A1 3A            [ 1] 2541     cp a,#'9+1
      008D10 8C               [ 1] 2542 	ccf 
      008D11 8C               [ 1] 2543 1$:	ccf 
      008D12 81               [ 4] 2544     ret
                                   2545 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2546 ;------------------------------------
                                   2547 ; convert alpha to uppercase
                                   2548 ; input:
                                   2549 ;    a  character to convert
                                   2550 ; output:
                                   2551 ;    a  uppercase character
                                   2552 ;------------------------------------
      008D13                       2553 to_upper::
      008D13 A1 61            [ 1] 2554 	cp a,#'a
      008D15 2A 01            [ 1] 2555 	jrpl 1$
      008D17 81               [ 4] 2556 0$:	ret
      008D18 A1 7A            [ 1] 2557 1$: cp a,#'z	
      008D1A 22 FB            [ 1] 2558 	jrugt 0$
      008D1C A0 20            [ 1] 2559 	sub a,#32
      008D1E 81               [ 4] 2560 	ret
                                   2561 	
                                   2562 ;------------------------------------
                                   2563 ; convert pad content in integer
                                   2564 ; input:
                                   2565 ;    pad		.asciz to convert
                                   2566 ; output:
                                   2567 ;    acc24      int24_t
                                   2568 ;------------------------------------
                                   2569 	; local variables
                           000001  2570 	SIGN=1 ; 1 byte, 
                           000002  2571 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2572 	TEMP=3 ; 1 byte, temporary storage
                           000003  2573 	VSIZE=3 ; 3 bytes reserved for local storage
      008D1F                       2574 atoi24:
      008D1F 89               [ 2] 2575 	pushw x ;save x
      008D20 52 03            [ 2] 2576 	sub sp,#VSIZE
                                   2577 	; acc24=0 
      008D22 72 5F 00 0C      [ 1] 2578 	clr acc24    
      008D26 72 5F 00 0D      [ 1] 2579 	clr acc16
      008D2A 72 5F 00 0E      [ 1] 2580 	clr acc8 
      008D2E C6 17 38         [ 1] 2581 	ld a, pad 
      008D31 27 5A            [ 1] 2582 	jreq atoi_exit
      008D33 0F 01            [ 1] 2583 	clr (SIGN,sp)
      008D35 A6 0A            [ 1] 2584 	ld a,#10
      008D37 6B 02            [ 1] 2585 	ld (BASE,sp),a ; default base decimal
      008D39 AE 17 38         [ 2] 2586 	ldw x,#pad ; pointer to string to convert
      008D3C F6               [ 1] 2587 	ld a,(x)
      008D3D 27 47            [ 1] 2588 	jreq 9$  ; completed if 0
      008D3F A1 2D            [ 1] 2589 	cp a,#'-
      008D41 26 04            [ 1] 2590 	jrne 1$
      008D43 03 01            [ 1] 2591 	cpl (SIGN,sp)
      008D45 20 08            [ 2] 2592 	jra 2$
      008D47 A1 24            [ 1] 2593 1$: cp a,#'$
      008D49 26 06            [ 1] 2594 	jrne 3$
      008D4B A6 10            [ 1] 2595 	ld a,#16
      008D4D 6B 02            [ 1] 2596 	ld (BASE,sp),a
      008D4F 5C               [ 2] 2597 2$:	incw x
      008D50 F6               [ 1] 2598 	ld a,(x)
      008D51                       2599 3$:	
      008D51 A1 61            [ 1] 2600 	cp a,#'a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008D53 2B 02            [ 1] 2601 	jrmi 4$
      008D55 A0 20            [ 1] 2602 	sub a,#32
      008D57 A1 30            [ 1] 2603 4$:	cp a,#'0
      008D59 2B 2B            [ 1] 2604 	jrmi 9$
      008D5B A0 30            [ 1] 2605 	sub a,#'0
      008D5D A1 0A            [ 1] 2606 	cp a,#10
      008D5F 2B 06            [ 1] 2607 	jrmi 5$
      008D61 A0 07            [ 1] 2608 	sub a,#7
      008D63 11 02            [ 1] 2609 	cp a,(BASE,sp)
      008D65 2A 1F            [ 1] 2610 	jrpl 9$
      008D67 6B 03            [ 1] 2611 5$:	ld (TEMP,sp),a
      008D69 7B 02            [ 1] 2612 	ld a,(BASE,sp)
      008D6B CD 8D 91         [ 4] 2613 	call mulu24_8
      008D6E 7B 03            [ 1] 2614 	ld a,(TEMP,sp)
      008D70 CB 00 0E         [ 1] 2615 	add a,acc24+2
      008D73 C7 00 0E         [ 1] 2616 	ld acc24+2,a
      008D76 4F               [ 1] 2617 	clr a
      008D77 C9 00 0D         [ 1] 2618 	adc a,acc24+1
      008D7A C7 00 0D         [ 1] 2619 	ld acc24+1,a
      008D7D 4F               [ 1] 2620 	clr a
      008D7E C9 00 0C         [ 1] 2621 	adc a,acc24
      008D81 C7 00 0C         [ 1] 2622 	ld acc24,a
      008D84 20 C9            [ 2] 2623 	jra 2$
      008D86 0D 01            [ 1] 2624 9$:	tnz (SIGN,sp)
      008D88 27 03            [ 1] 2625     jreq atoi_exit
      008D8A CD 89 B0         [ 4] 2626     call neg_acc24
      008D8D                       2627 atoi_exit: 
      008D8D 5B 03            [ 2] 2628 	addw sp,#VSIZE
      008D8F 85               [ 2] 2629 	popw x ; restore x
      008D90 81               [ 4] 2630 	ret
                                   2631 
                                   2632 ;--------------------------------------
                                   2633 ; unsigned multiply uint24_t by uint8_t
                                   2634 ; use to convert numerical string to uint24_t
                                   2635 ; input:
                                   2636 ;	acc24	uint24_t 
                                   2637 ;   A		uint8_t
                                   2638 ; output:
                                   2639 ;   acc24   A*acc24
                                   2640 ;-------------------------------------
                                   2641 ; local variables offset  on sp
                           000003  2642 	U8   = 3   ; A pushed on stack
                           000002  2643 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2644 	OVFH = 1  ; multiplication overflow high byte
                           000003  2645 	VSIZE = 3
      008D91                       2646 mulu24_8:
      008D91 89               [ 2] 2647 	pushw x    ; save X
                                   2648 	; local variables
      008D92 88               [ 1] 2649 	push a     ; U8
      008D93 5F               [ 1] 2650 	clrw x     ; initialize overflow to 0
      008D94 89               [ 2] 2651 	pushw x    ; multiplication overflow
                                   2652 ; multiply low byte.
      008D95 C6 00 0E         [ 1] 2653 	ld a,acc24+2
      008D98 97               [ 1] 2654 	ld xl,a
      008D99 7B 03            [ 1] 2655 	ld a,(U8,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008D9B 42               [ 4] 2656 	mul x,a
      008D9C 9F               [ 1] 2657 	ld a,xl
      008D9D C7 00 0E         [ 1] 2658 	ld acc24+2,a
      008DA0 9E               [ 1] 2659 	ld a, xh
      008DA1 6B 02            [ 1] 2660 	ld (OVFL,sp),a
                                   2661 ; multipy middle byte
      008DA3 C6 00 0D         [ 1] 2662 	ld a,acc24+1
      008DA6 97               [ 1] 2663 	ld xl,a
      008DA7 7B 03            [ 1] 2664 	ld a, (U8,sp)
      008DA9 42               [ 4] 2665 	mul x,a
                                   2666 ; add overflow to this partial product
      008DAA 72 FB 01         [ 2] 2667 	addw x,(OVFH,sp)
      008DAD 9F               [ 1] 2668 	ld a,xl
      008DAE C7 00 0D         [ 1] 2669 	ld acc24+1,a
      008DB1 4F               [ 1] 2670 	clr a
      008DB2 A9 00            [ 1] 2671 	adc a,#0
      008DB4 6B 01            [ 1] 2672 	ld (OVFH,sp),a
      008DB6 9E               [ 1] 2673 	ld a,xh
      008DB7 6B 02            [ 1] 2674 	ld (OVFL,sp),a
                                   2675 ; multiply most signficant byte	
      008DB9 C6 00 0C         [ 1] 2676 	ld a, acc24
      008DBC 97               [ 1] 2677 	ld xl, a
      008DBD 7B 03            [ 1] 2678 	ld a, (U8,sp)
      008DBF 42               [ 4] 2679 	mul x,a
      008DC0 72 FB 01         [ 2] 2680 	addw x, (OVFH,sp)
      008DC3 9F               [ 1] 2681 	ld a, xl
      008DC4 C7 00 0C         [ 1] 2682 	ld acc24,a
      008DC7 5B 03            [ 2] 2683     addw sp,#VSIZE
      008DC9 85               [ 2] 2684 	popw x
      008DCA 81               [ 4] 2685 	ret
                                   2686 
                                   2687 ;------------------------------------
                                   2688 ; skip character c in text starting from 'in'
                                   2689 ; input:
                                   2690 ;	 y 		point to text buffer
                                   2691 ;    a 		character to skip
                                   2692 ; output:  
                                   2693 ;	'in' ajusted to new position
                                   2694 ;------------------------------------
                           000001  2695 	C = 1 ; local var
      008DCB                       2696 skip:
      008DCB 88               [ 1] 2697 	push a
      008DCC 91 D6 01         [ 4] 2698 1$:	ld a,([in.w],y)
      008DCF 27 0A            [ 1] 2699 	jreq 2$
      008DD1 11 01            [ 1] 2700 	cp a,(C,sp)
      008DD3 26 06            [ 1] 2701 	jrne 2$
      008DD5 72 5C 00 02      [ 1] 2702 	inc in
      008DD9 20 F1            [ 2] 2703 	jra 1$
      000D5B                       2704 2$: _drop 1 
      008DDB 5B 01            [ 2]    1     addw sp,#1 
      008DDD 81               [ 4] 2705 	ret
                                   2706 	
                                   2707 ;------------------------------
                                   2708 ; restore 'in.w' variable to 
                                   2709 ; its value before last call
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2710 ; to get_token.
                                   2711 ;------------------------------
      008DDE                       2712 unget_token:
      008DDE 55 00 03 00 02   [ 1] 2713 	mov in,in.saved
      008DE3 81               [ 4] 2714 	ret 
                                   2715 
                                   2716 
                                   2717 ;******************************
                                   2718 ;  data stack manipulation
                                   2719 ;*****************************
                                   2720 ;----------------------	
                                   2721 ; push X on data stack 
                                   2722 ; input:
                                   2723 ;	X 
                                   2724 ; output:
                                   2725 ;	none 
                                   2726 ;----------------------	
      008DE4                       2727 dpush:
      000D64                       2728     _dp_down
      008DE4 72 5A 00 1E      [ 1]    1     dec dstkptr+1 
      008DE8 72 5A 00 1E      [ 1]    2     dec dstkptr+1
      008DEC 72 CF 00 1D      [ 5] 2729     ldw [dstkptr],x  
      008DF0 81               [ 4] 2730 	ret 
                                   2731 
                                   2732 
                                   2733 ;----------------------	
                                   2734 ; pop data stack in X 
                                   2735 ; input:
                                   2736 ;	none
                                   2737 ; output:
                                   2738 ;	X   
                                   2739 ;----------------------	
      008DF1                       2740 dpop: 
      008DF1 72 CE 00 1D      [ 5] 2741     ldw x, [dstkptr]
      000D75                       2742 	_dp_up
      008DF5 72 5C 00 1E      [ 1]    1     inc dstkptr+1
      008DF9 72 5C 00 1E      [ 1]    2     inc dstkptr+1
      008DFD 81               [ 4] 2743 	ret 
                                   2744 
                                   2745 ;-----------------------------
                                   2746 ; swap top 2 elements of dstack
                                   2747 ;  {n1 n2 -- n2 n1 }
                                   2748 ;-----------------------------
      008DFE                       2749 dswap:
      008DFE 72 CE 00 1D      [ 5] 2750 	ldw x,[dstkptr]
      008E02 89               [ 2] 2751 	pushw x 
      008E03 AE 00 02         [ 2] 2752 	ldw x,#2 
      008E06 72 DE 00 1D      [ 5] 2753 	ldw x,([dstkptr],x) 
      008E0A 72 CF 00 1D      [ 5] 2754 	ldw [dstkptr],x 
      008E0E AE 00 02         [ 2] 2755 	ldw x,#2
      008E11 90 85            [ 2] 2756 	popw y 
      008E13 72 DF 00 1D      [ 5] 2757 	ldw ([dstkptr],x),y 
      008E17 81               [ 4] 2758 	ret
                                   2759 
                                   2760 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2761 ; drop TOS 
                                   2762 ;-----------------------------
      008E18                       2763 ddrop: ; { n -- }
      000D98                       2764 	_dp_up 
      008E18 72 5C 00 1E      [ 1]    1     inc dstkptr+1
      008E1C 72 5C 00 1E      [ 1]    2     inc dstkptr+1
      008E20 81               [ 4] 2765 	ret
                                   2766 	
                                   2767 ;-----------------------------
                                   2768 ; duplicate TOS 
                                   2769 ;  dstack: { ix...n -- ix...n n }
                                   2770 ;-----------------------------
      008E21                       2771 ddup:
                                   2772 ;	ldw x,[dstkptr]
                                   2773 ;	_dp_down
                                   2774 ;   ldw [dstkptr],x  
                                   2775 ;	ret 
                                   2776 
                                   2777 
                                   2778 ;----------------------------------
                                   2779 ; pick value n from dstack 
                                   2780 ; put it on TOS
                                   2781 ; dstack: {ix,..,p -- ix,...,np }
                                   2782 ;-----------------------------------
      008E21                       2783 dpick:
                                   2784 ;	ldw x,[dstkptr]
                                   2785 ;	sllw x 
                                   2786 ;	addw x,dstkptr 
                                   2787 ;	ldw x,(x)
                                   2788 ;	ldw [dstkptr],x 
                                   2789 ;	ret
                                   2790 
                                   2791 ;---------------------------
                                   2792 ;  fetch variable in X 
                                   2793 ;  dstack:{ addr -- value }
                                   2794 ;---------------------------
      008E21                       2795 fetch:
      008E21 72 CE 00 1D      [ 5] 2796 	ldw x,[dstkptr]
      008E25 FE               [ 2] 2797 	ldw x,(x)
      008E26 72 CF 00 1D      [ 5] 2798 	ldw [dstkptr],x
      008E2A 81               [ 4] 2799 	ret 
                                   2800 
                                   2801 ;----------------------------
                                   2802 ; store variable 
                                   2803 ; dstack: {addr value -- }
                                   2804 ;----------------------------
      008E2B                       2805 store:
      008E2B CD 8D F1         [ 4] 2806 	call dpop 
      008E2E 90 93            [ 1] 2807 	ldw y,x   ; y=value 
      008E30 CD 8D F1         [ 4] 2808 	call dpop 
      008E33 FF               [ 2] 2809 	ldw (x),y 
      008E34 81               [ 4] 2810 	ret 
                                   2811 
                                   2812 ;---------------------------------
                                   2813 ; drop n elements from data stack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2814 ; input: 
                                   2815 ;   X 		n 
                                   2816 ; output:
                                   2817 ;   none 
                                   2818 ;-------------------------------------
      008E35                       2819 ddrop_n:
      008E35 58               [ 2] 2820 	sllw x
      008E36 72 BB 00 1D      [ 2] 2821 	addw x,dstkptr 
      008E3A CF 00 1D         [ 2] 2822 	ldw dstkptr,x  
      008E3D 81               [ 4] 2823 	ret 
                                   2824 
      008E3E 0A 64 73 74 61 63 6B  2825 dstk_prompt: .asciz "\ndstack: " 
             3A 20 00
                                   2826 ;----------------------------
                                   2827 ; print dstack content 
                                   2828 ;---------------------------
                           000001  2829 	XSAVE=1
                           000002  2830 	VSIZE=2
      008E48                       2831 dots:
      000DC8                       2832 	_vars VSIZE 
      008E48 52 02            [ 2]    1     sub sp,#VSIZE 
      008E4A AE 8E 3E         [ 2] 2833 	ldw x,#dstk_prompt 
      008E4D CD 82 46         [ 4] 2834 	call puts
      008E50 AE 17 7E         [ 2] 2835 	ldw x,#dstack_empty-CELL_SIZE
      008E53 35 0A 00 0B      [ 1] 2836 	mov base,#10 
      008E57 C3 00 1D         [ 2] 2837 1$:	cpw x,dstkptr 
      008E5A 25 0D            [ 1] 2838 	jrult 4$ 
      008E5C 1F 01            [ 2] 2839 	ldw (XSAVE,sp),x
      008E5E FE               [ 2] 2840 	ldw  x,(x)
      008E5F CD 88 E3         [ 4] 2841 	call print_int 
      008E62 1E 01            [ 2] 2842 	ldw x,(XSAVE,sp)
      008E64 1D 00 02         [ 2] 2843 	subw x,#CELL_SIZE 
      008E67 20 EE            [ 2] 2844 	jra 1$ 
      008E69 A6 0D            [ 1] 2845 4$: ld a,#CR 
      008E6B CD 82 33         [ 4] 2846 	call putc 
      000DEE                       2847 	_drop VSIZE
      008E6E 5B 02            [ 2]    1     addw sp,#VSIZE 
      008E70 4F               [ 1] 2848 	clr a 
      008E71 81               [ 4] 2849 	ret
                                   2850 
      008E72 0A 63 73 74 61 63 6B  2851 cstk_prompt: .asciz "\ncstack: "
             3A 20 00
                                   2852 ;--------------------------------
                                   2853 ; print cstack content
                                   2854 ;--------------------------------
                           000001  2855 	XSAVE=1
                           000002  2856 	VSIZE=2 
      008E7C                       2857 dotr:
      000DFC                       2858 	_vars VSIZE 
      008E7C 52 02            [ 2]    1     sub sp,#VSIZE 
      008E7E AE 8E 72         [ 2] 2859 	ldw x,#cstk_prompt
      008E81 CD 82 46         [ 4] 2860 	call puts 
      008E84 96               [ 1] 2861 	ldw x,sp 
      008E85 1C 00 07         [ 2] 2862 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008E88 1F 01            [ 2] 2863 	ldw (XSAVE,sp),x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008E8A AE 17 FE         [ 2] 2864 	ldw x,#RAM_SIZE-2
      008E8D 35 10 00 0B      [ 1] 2865 	mov base,#16
      008E91                       2866 dotr_loop:
      008E91 13 01            [ 2] 2867 	cpw x,(XSAVE,sp)
      008E93 2B 0B            [ 1] 2868 	jrmi 9$
      008E95 89               [ 2] 2869 	pushw x  
      008E96 FE               [ 2] 2870 	ldw x,(x)
      008E97 CD 88 E3         [ 4] 2871 	call print_int 
      008E9A 85               [ 2] 2872 	popw x  
      008E9B 1D 00 02         [ 2] 2873 	subw x,#CELL_SIZE
      008E9E 20 F1            [ 2] 2874 	jra dotr_loop 
      008EA0 A6 0D            [ 1] 2875 9$:	ld a,#CR 
      008EA2 CD 82 33         [ 4] 2876 	call putc 
      000E25                       2877 	_drop VSIZE 
      008EA5 5B 02            [ 2]    1     addw sp,#VSIZE 
      008EA7 4F               [ 1] 2878 	clr a 
      008EA8 81               [ 4] 2879 	ret
                                   2880 
                                   2881 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2882 ;;   TINY BASIC  operators,
                                   2883 ;;   commands and functions 
                                   2884 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2885 
                                   2886 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2887 ;;  Arithmetic operators
                                   2888 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   2889 
                                   2890 ;--------------------------------
                                   2891 ;  add 2 integers
                                   2892 ;  input:
                                   2893 ;    N1     on cstack 
                                   2894 ;    N2     on cstack 
                                   2895 ;  output:
                                   2896 ;    X 		n2+n1 
                                   2897 ;--------------------------------
                                   2898 	;arugments on cstack 
      008EA9                       2899 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000E29                       2900 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000E29                       2901 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000E29                       2902 add:
      008EA9 1E 05            [ 2] 2903 	ldw x ,(N2,sp)
      008EAB 72 FB 03         [ 2] 2904 	addw x,(N1,sp)
      008EAE 1F 03            [ 2] 2905 	ldw (N1,sp),x 
      008EB0 81               [ 4] 2906 	ret 
                                   2907 
                                   2908 ;--------------------------------
                                   2909 ;  substract 2 ntegers
                                   2910 ;  input:
                                   2911 ;    N1     on cstack 
                                   2912 ;    N2     on cstack 
                                   2913 ;  output:
                                   2914 ;    X 		n2+n1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2915 ;--------------------------------
      008EB1                       2916 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000E31                       2917 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000E31                       2918 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000E31                       2919 substract:
      008EB1 1E 05            [ 2] 2920 	ldw x,(N2,sp)
      008EB3 72 F0 03         [ 2] 2921 	subw x,(N1,sp)
      008EB6 81               [ 4] 2922 	ret 
                                   2923 
                                   2924 ;-------------------------------------
                                   2925 ; multiply 2 integers
                                   2926 ; product overflow is ignored unless
                                   2927 ; MATH_OVF assembler flag is set to 1
                                   2928 ; input:
                                   2929 ;  	N1      on cstack
                                   2930 ;   N2 		on cstack 
                                   2931 ; output:
                                   2932 ;	X        N1*N2 
                                   2933 ;-------------------------------------
                                   2934 	;arguments 
      008EB7                       2935 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      000E37                       2936 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      000E37                       2937 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      000E37                       2938 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      000E37                       2939 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2940    ; local variables 
                           000001  2941 	SIGN=1
                           000002  2942 	PROD=2
                           000003  2943 	VSIZE=3
      000E37                       2944 multiply:
      000E37                       2945 	_vars VSIZE 
      008EB7 52 03            [ 2]    1     sub sp,#VSIZE 
      008EB9 0F 01            [ 1] 2946 	clr (SIGN,sp)
      008EBB 1E 06            [ 2] 2947 	ldw x,(N1_HB,sp)
      008EBD 9E               [ 1] 2948 	ld a,xh  
      008EBE A5 80            [ 1] 2949 	bcp a,#0x80 
      008EC0 27 05            [ 1] 2950 	jreq 2$
      008EC2 03 01            [ 1] 2951 	cpl (SIGN,sp)
      008EC4 50               [ 2] 2952 	negw x 
      008EC5 1F 06            [ 2] 2953 	ldw (N1_HB,sp),x 
      008EC7 1E 08            [ 2] 2954 2$: ldw x,(N2_HB,sp)
      008EC9 9E               [ 1] 2955 	ld a,xh  
      008ECA A5 80            [ 1] 2956 	bcp a,#0x80 
      008ECC 27 05            [ 1] 2957 	jreq 3$
      008ECE 03 01            [ 1] 2958 	cpl (SIGN,sp)
      008ED0 50               [ 2] 2959 	negw x 
      008ED1 1F 08            [ 2] 2960 	ldw (N2_HB,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2961 ; N1_LB * N2_LB 	
      008ED3 7B 07            [ 1] 2962 3$:	ld a,(N1_LB,sp)
      008ED5 97               [ 1] 2963 	ld xl,a 
      008ED6 7B 09            [ 1] 2964 	ld a,(N2_LB,sp) 
      008ED8 42               [ 4] 2965 	mul x,a 
                           000000  2966 .if MATH_OVF 	
                                   2967 	ld a,xh 
                                   2968 	bcp a,#0x80 
                                   2969 	jreq 4$ 
                                   2970 	ld a,#ERR_MATH_OVF 
                                   2971 	jp tb_error
                                   2972 .endif 	 
      008ED9 1F 02            [ 2] 2973 4$:	ldw (PROD,sp),x
                                   2974 ; N1_LB * N2_HB	 
      008EDB 7B 07            [ 1] 2975 	ld a,(N1_LB,sp) 
      008EDD 97               [ 1] 2976 	ld xl,a 
      008EDE 7B 08            [ 1] 2977 	ld a,(N2_HB,sp)
      008EE0 42               [ 4] 2978 	mul x,a
      008EE1 9F               [ 1] 2979 	ld a,xl 
      008EE2 1B 02            [ 1] 2980 	add a,(PROD,sp)
                           000000  2981 .if MATH_OVF 	
                                   2982 	bcp a,#0x80 
                                   2983 	jreq 5$ 
                                   2984 	ld a,#ERR_MATH_OVF 
                                   2985 	jp tb_error
                                   2986 .endif 	 
      008EE4 6B 02            [ 1] 2987 5$:	ld (PROD,sp),a 
                                   2988 ; N1_HB * N2_LB 
      008EE6 7B 06            [ 1] 2989 	ld a,(N1_HB,sp)
      008EE8 97               [ 1] 2990 	ld xl,a 
      008EE9 7B 09            [ 1] 2991 	ld a,(N2_LB,sp)
      008EEB 42               [ 4] 2992 	mul x,a 
      008EEC 9F               [ 1] 2993 	ld a,xl 
      008EED 1B 02            [ 1] 2994 	add a,(PROD,sp)
                           000000  2995 .if MATH_OVF 	
                                   2996 	bcp a,#0x80 
                                   2997 	jreq 6$ 
                                   2998 	ld a,#ERR_MATH_OVF 
                                   2999 	jp tb_error
                                   3000 .endif 	 
      008EEF 6B 02            [ 1] 3001 6$:	ld (PROD,sp),a 
                                   3002 ; N1_HB * N2_HB 	
                                   3003 ; it is pointless to multiply N1_HB*N2_HB 
                                   3004 ; as this product is over 65535 or 0 
                                   3005 ;
                                   3006 ; sign adjust product
      008EF1 0D 01            [ 1] 3007 	tnz (SIGN,sp)
      008EF3 27 05            [ 1] 3008 	jreq 7$
      008EF5 1E 02            [ 2] 3009 	ldw x, (PROD,sp)
      008EF7 50               [ 2] 3010 	negw x
      008EF8 1F 02            [ 2] 3011 	ldw (PROD,sp),x  
      008EFA                       3012 7$: 
      008EFA 1E 02            [ 2] 3013 	ldw x,(PROD,sp) 
      000E7C                       3014 	_drop VSIZE 
      008EFC 5B 03            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008EFE 81               [ 4] 3015 	ret
                                   3016 
                                   3017 ;----------------------------------
                                   3018 ;  euclidian divide n2/n1 
                                   3019 ; input:
                                   3020 ;    N2 	on cstack
                                   3021 ;    N1 	on cstack
                                   3022 ; output:
                                   3023 ;    X      n2/n1 
                                   3024 ;    Y      remainder 
                                   3025 ;----------------------------------
      008EFF                       3026 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      000E7F                       3027 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      000E7F                       3028 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   3029 	; local variables
                           000001  3030 	SQUOT=1 ; sign quotient
                           000002  3031 	SDIVD=2 ; sign dividend  
                           000002  3032 	VSIZE=2
      000E7F                       3033 divide:
      000E7F                       3034 	_vars VSIZE 
      008EFF 52 02            [ 2]    1     sub sp,#VSIZE 
      008F01 0F 01            [ 1] 3035 	clr (SQUOT,sp)
      008F03 0F 02            [ 1] 3036 	clr (SDIVD,sp)
                                   3037 ; check for 0 divisor
      008F05 1E 05            [ 2] 3038 	ldw x,(DIVISR,sp)
      008F07 5D               [ 2] 3039 	tnzw x 
      008F08 26 05            [ 1] 3040     jrne 0$
      008F0A A6 04            [ 1] 3041 	ld a,#ERR_DIV0 
      008F0C CC 87 94         [ 2] 3042 	jp tb_error 
                                   3043 ; check divisor sign 	
      008F0F 9E               [ 1] 3044 0$:	ld a,xh 
      008F10 A5 80            [ 1] 3045 	bcp a,#0x80 
      008F12 27 03            [ 1] 3046 	jreq 1$
      008F14 03 01            [ 1] 3047 	cpl (SQUOT,sp)
      008F16 50               [ 2] 3048 	negw x 
      008F17 1F 05            [ 2] 3049 1$:	ldw (DIVISR,sp),x
                                   3050 ; check dividend sign 	 
      008F19 1E 07            [ 2] 3051     ldw x,(DIVIDND,sp)
      008F1B 9E               [ 1] 3052 	ld a,xh 
      008F1C A5 80            [ 1] 3053 	bcp a,#0x80 
      008F1E 27 05            [ 1] 3054 	jreq 2$ 
      008F20 03 01            [ 1] 3055 	cpl (SQUOT,sp)
      008F22 03 02            [ 1] 3056 	cpl (SDIVD,sp)
      008F24 50               [ 2] 3057 	negw x 
      008F25 16 05            [ 2] 3058 2$:	ldw y,(DIVISR,sp)
      008F27 65               [ 2] 3059 	divw x,y
      008F28 90 CF 00 0D      [ 2] 3060 	ldw acc16,y 
                                   3061 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      008F2C 0D 02            [ 1] 3062 	tnz (SDIVD,sp)
      008F2E 27 0B            [ 1] 3063 	jreq 7$
      008F30 90 5D            [ 2] 3064 	tnzw y 
      008F32 27 07            [ 1] 3065 	jreq 7$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008F34 5C               [ 2] 3066 	incw x
      008F35 16 05            [ 2] 3067 	ldw y,(DIVISR,sp)
      008F37 72 B2 00 0D      [ 2] 3068 	subw y,acc16
      008F3B 0D 01            [ 1] 3069 7$: tnz (SQUOT,sp)
      008F3D 27 01            [ 1] 3070 	jreq 9$ 	 
      008F3F 50               [ 2] 3071 8$:	negw x 
      008F40                       3072 9$: 
      000EC0                       3073 	_drop VSIZE 
      008F40 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F42 81               [ 4] 3074 	ret 
                                   3075 
                                   3076 
                                   3077 ;----------------------------------
                                   3078 ;  remainder resulting from euclidian 
                                   3079 ;  division of n2/n1 
                                   3080 ; input:
                                   3081 ;   N1 		cstack 
                                   3082 ;   N2      cstack
                                   3083 ; output:
                                   3084 ;   X       N2%N1 
                                   3085 ;----------------------------------
                           000003  3086 	N1=3
                           000005  3087 	N2=5
                           000004  3088 	VSIZE=4
      008F43                       3089 modulo:
      008F43 1E 03            [ 2] 3090 	Ldw x,(N1,sp)
      008F45 16 05            [ 2] 3091 	ldw y,(N2,sp)
      000EC7                       3092 	_vars VSIZE 
      008F47 52 04            [ 2]    1     sub sp,#VSIZE 
      008F49 1F 01            [ 2] 3093 	ldw (1,sp),x 
      008F4B 17 03            [ 2] 3094 	ldw (3,sp),y 
      008F4D CD 8E FF         [ 4] 3095 	call divide 
      008F50 93               [ 1] 3096 	ldw x,y
      000ED1                       3097 	_drop VSIZE 
      008F51 5B 04            [ 2]    1     addw sp,#VSIZE 
      008F53 81               [ 4] 3098 	ret 
                                   3099 
                                   3100 
                                   3101 ;----------------------------------
                                   3102 ; search in kword_dict name
                                   3103 ; from its execution address 
                                   3104 ; input:
                                   3105 ;   X       	execution address 
                                   3106 ; output:
                                   3107 ;   X 			cstr*  | 0 
                                   3108 ;--------------------------------
                           000001  3109 	XADR=1 
                           000003  3110 	LINK=3 
                           000004  3111 	VSIZE=4
      008F54                       3112 cmd_name:
      000ED4                       3113 	_vars VSIZE 
      008F54 52 04            [ 2]    1     sub sp,#VSIZE 
      008F56 72 5F 00 0D      [ 1] 3114 	clr acc16 
      008F5A 1F 01            [ 2] 3115 	ldw (XADR,sp),x  
      008F5C AE A5 E2         [ 2] 3116 	ldw x,#kword_dict	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008F5F 1F 03            [ 2] 3117 1$:	ldw (LINK,sp),x
      008F61 E6 02            [ 1] 3118 	ld a,(2,x)
      008F63 A4 0F            [ 1] 3119 	and a,#15 
      008F65 C7 00 0E         [ 1] 3120 	ld acc8,a 
      008F68 1C 00 03         [ 2] 3121 	addw x,#3
      008F6B 72 BB 00 0D      [ 2] 3122 	addw x,acc16
      008F6F FE               [ 2] 3123 	ldw x,(x) ; execution address 
      008F70 13 01            [ 2] 3124 	cpw x,(XADR,sp)
      008F72 27 0A            [ 1] 3125 	jreq 2$
      008F74 1E 03            [ 2] 3126 	ldw x,(LINK,sp)
      008F76 FE               [ 2] 3127 	ldw x,(x) 
      008F77 1D 00 02         [ 2] 3128 	subw x,#2  
      008F7A 26 E3            [ 1] 3129 	jrne 1$
      008F7C 20 05            [ 2] 3130 	jra 9$
      008F7E 1E 03            [ 2] 3131 2$: ldw x,(LINK,sp)
      008F80 1C 00 02         [ 2] 3132 	addw x,#2 	
      000F03                       3133 9$:	_drop VSIZE
      008F83 5B 04            [ 2]    1     addw sp,#VSIZE 
      008F85 81               [ 4] 3134 	ret
                                   3135 
                                   3136 
                                   3137 ;---------------------------------
                                   3138 ; dictionary search 
                                   3139 ; input:
                                   3140 ;	X 		dictionary entry point 
                                   3141 ;  pad		.asciz name to search 
                                   3142 ; output:
                                   3143 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3144 ;  X		execution address | 0 
                                   3145 ;---------------------------------
                           000001  3146 	NLEN=1 ; cmd length 
                           000002  3147 	YSAVE=2
                           000003  3148 	VSIZE=3 
      008F86                       3149 search_dict:
      000F06                       3150 	_vars VSIZE 
      008F86 52 03            [ 2]    1     sub sp,#VSIZE 
      008F88 90 93            [ 1] 3151 	ldw y,x 
      008F8A                       3152 search_next:	
      008F8A 90 F6            [ 1] 3153 	ld a,(y)
      008F8C A4 0F            [ 1] 3154 	and a,#0xf 
      008F8E 6B 01            [ 1] 3155 	ld (NLEN,sp),a  
      008F90 AE 17 38         [ 2] 3156 	ldw x,#pad 
      008F93 17 02            [ 2] 3157 	ldw (YSAVE,sp),y
      008F95 90 5C            [ 2] 3158 	incw y  
      008F97                       3159 cp_loop:
      008F97 F6               [ 1] 3160 	ld a,(x)
      008F98 27 1E            [ 1] 3161 	jreq str_match 
      008F9A 0D 01            [ 1] 3162 	tnz (NLEN,sp)
      008F9C 27 0B            [ 1] 3163 	jreq no_match  
      008F9E 90 F1            [ 1] 3164 	cp a,(y)
      008FA0 26 07            [ 1] 3165 	jrne no_match 
      008FA2 90 5C            [ 2] 3166 	incw y 
      008FA4 5C               [ 2] 3167 	incw x
      008FA5 0A 01            [ 1] 3168 	dec (NLEN,sp)
      008FA7 20 EE            [ 2] 3169 	jra cp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      008FA9                       3170 no_match:
      008FA9 16 02            [ 2] 3171 	ldw y,(YSAVE,sp) 
      008FAB 72 A2 00 02      [ 2] 3172 	subw y,#2 ; move Y to link field
      008FAF 4B 00            [ 1] 3173 	push #TK_NONE 
      008FB1 90 FE            [ 2] 3174 	ldw y,(y) ; next word link 
      008FB3 84               [ 1] 3175 	pop a ; TK_NONE 
      008FB4 27 21            [ 1] 3176 	jreq search_exit  ; not found  
                                   3177 ;try next 
      008FB6 20 D2            [ 2] 3178 	jra search_next
      008FB8                       3179 str_match:
      008FB8 16 02            [ 2] 3180 	ldw y,(YSAVE,sp)
      008FBA 90 F6            [ 1] 3181 	ld a,(y)
      008FBC 6B 01            [ 1] 3182 	ld (NLEN,sp),a ; needed to test keyword type  
      008FBE A4 0F            [ 1] 3183 	and a,#0xf 
                                   3184 ; move y to procedure address field 	
      008FC0 4C               [ 1] 3185 	inc a 
      008FC1 C7 00 0E         [ 1] 3186 	ld acc8,a 
      008FC4 72 5F 00 0D      [ 1] 3187 	clr acc16 
      008FC8 72 B9 00 0D      [ 2] 3188 	addw y,acc16 
      008FCC 90 FE            [ 2] 3189 	ldw y,(y) ; routine entry point 
                                   3190 ;determine keyword type bits 7:6 
      008FCE 7B 01            [ 1] 3191 	ld a,(NLEN,sp)
      008FD0 4E               [ 1] 3192 	swap a 
      008FD1 A4 0C            [ 1] 3193 	and a,#0xc
      008FD3 44               [ 1] 3194 	srl a
      008FD4 44               [ 1] 3195 	srl a 
      008FD5 AB 06            [ 1] 3196 	add a,#6
      008FD7                       3197 search_exit: 
      008FD7 93               [ 1] 3198 	ldw x,y ; x=routine address 
      000F58                       3199 	_drop VSIZE 	 
      008FD8 5B 03            [ 2]    1     addw sp,#VSIZE 
      008FDA 81               [ 4] 3200 	ret 
                                   3201 
                                   3202 ;---------------------
                                   3203 ; check if next token
                                   3204 ;  is of expected type 
                                   3205 ; input:
                                   3206 ;   A 		 expected token attribute
                                   3207 ;  ouput:
                                   3208 ;   none     if fail call syntax_error 
                                   3209 ;--------------------
      008FDB                       3210 expect:
      008FDB 88               [ 1] 3211 	push a 
      008FDC CD 88 46         [ 4] 3212 	call next_token 
      008FDF 11 01            [ 1] 3213 	cp a,(1,sp)
      008FE1 27 03            [ 1] 3214 	jreq 1$
      008FE3 CC 87 92         [ 2] 3215 	jp syntax_error
      008FE6 84               [ 1] 3216 1$: pop a 
      008FE7 81               [ 4] 3217 	ret 
                                   3218 
                                   3219 
                                   3220 ;-------------------------------
                                   3221 ; parse embedded BASIC routines 
                                   3222 ; arguments list.
                                   3223 ; arg_list::=  rel[','rel]*
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3224 ; all arguments are of integer type
                                   3225 ; and pushed on dstack 
                                   3226 ; input:
                                   3227 ;   none
                                   3228 ; output:
                                   3229 ;   A 	number of arguments pushed on dstack  
                                   3230 ;--------------------------------
                           000001  3231 	ARG_CNT=1 
      008FE8                       3232 arg_list:
      008FE8 4B 00            [ 1] 3233 	push #0  
      008FEA CD 91 2C         [ 4] 3234 1$: call relation
      008FED A1 00            [ 1] 3235 	cp a,#TK_NONE 
      008FEF 27 19            [ 1] 3236 	jreq 5$
      008FF1 A1 04            [ 1] 3237 	cp a,#TK_INTGR
      008FF3 26 12            [ 1] 3238 	jrne 4$
      008FF5 CD 8D E4         [ 4] 3239 3$: call dpush 
      008FF8 0C 01            [ 1] 3240     inc (ARG_CNT,sp)
      008FFA CD 88 46         [ 4] 3241 	call next_token 
      008FFD A1 00            [ 1] 3242 	cp a,#TK_NONE 
      008FFF 27 09            [ 1] 3243 	jreq 5$ 
      009001 A1 0D            [ 1] 3244 	cp a,#TK_COMMA 
      009003 26 02            [ 1] 3245 	jrne 4$
      009005 20 E3            [ 2] 3246 	jra 1$ 
      009007 CD 8D DE         [ 4] 3247 4$:	call unget_token 
      00900A 84               [ 1] 3248 5$:	pop a 
      00900B 81               [ 4] 3249 	ret 
                                   3250 
                                   3251 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   3252 ; parse arguments list 
                                   3253 ; between ()
                                   3254 ;;;;;;;;;;;;;;;;;;;;;;;;;;
      00900C                       3255 func_args:
      00900C A6 0B            [ 1] 3256 	ld a,#TK_LPAREN 
      00900E CD 8F DB         [ 4] 3257 	call expect 
      009011 CD 8F E8         [ 4] 3258 	call arg_list 
      009014 88               [ 1] 3259 	push a 
      009015 A6 0C            [ 1] 3260 	ld a,#TK_RPAREN 
      009017 CD 8F DB         [ 4] 3261 	call expect 
      00901A 84               [ 1] 3262 	pop a 
      00901B 81               [ 4] 3263 	ret 
                                   3264 
                                   3265 
                                   3266 ;--------------------------------
                                   3267 ;   BASIC commnands 
                                   3268 ;--------------------------------
                                   3269 
                                   3270 ;--------------------------------
                                   3271 ;  arithmetic and relational 
                                   3272 ;  routines
                                   3273 ;  operators precedence
                                   3274 ;  highest to lowest
                                   3275 ;  operators on same row have 
                                   3276 ;  same precedence and are executed
                                   3277 ;  from left to right.
                                   3278 ;	'*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3279 ;   '-','+'
                                   3280 ;   '=','>','<','>=','<=','<>','><'
                                   3281 ;   '<>' and '><' are equivalent for not equal.
                                   3282 ;--------------------------------
                                   3283 
                                   3284 ;---------------------
                                   3285 ; return array element
                                   3286 ; address from @(expr)
                                   3287 ; input:
                                   3288 ;   A 		TK_ARRAY
                                   3289 ; output:
                                   3290 ;   A 		TK_INTGR
                                   3291 ;	X 		element address 
                                   3292 ;----------------------
      00901C                       3293 get_array_element:
      00901C CD 90 0C         [ 4] 3294 	call func_args 
      00901F A1 01            [ 1] 3295 	cp a,#1
      009021 27 03            [ 1] 3296 	jreq 1$
      009023 CC 87 92         [ 2] 3297 	jp syntax_error
      009026 CD 8D F1         [ 4] 3298 1$: call dpop  
                                   3299 	; check for bounds 
      009029 C3 00 24         [ 2] 3300 	cpw x,array_size 
      00902C 23 05            [ 2] 3301 	jrule 3$
                                   3302 ; bounds {1..array_size}	
      00902E A6 0A            [ 1] 3303 2$: ld a,#ERR_BAD_VALUE 
      009030 CC 87 94         [ 2] 3304 	jp tb_error 
      009033 5D               [ 2] 3305 3$: tnzw  x
      009034 27 F8            [ 1] 3306 	jreq 2$ 
      009036 58               [ 2] 3307 	sllw x 
      009037 89               [ 2] 3308 	pushw x 
      009038 AE 16 E8         [ 2] 3309 	ldw x,#tib
      00903B 72 F0 01         [ 2] 3310 	subw x,(1,sp)
      000FBE                       3311 	_drop 2   
      00903E 5B 02            [ 2]    1     addw sp,#2 
      009040 A6 04            [ 1] 3312 	ld a,#TK_INTGR
      009042 81               [ 4] 3313 	ret 
                                   3314 
                                   3315 ;***********************************
                                   3316 ;   expression parse,execute 
                                   3317 ;***********************************
                                   3318 ;-----------------------------------
                                   3319 ; factor ::= ['+'|'-'|e] var | @ |
                                   3320 ;			 integer | function |
                                   3321 ;			 '('relation')' 
                                   3322 ; output:
                                   3323 ;   A    token attribute 
                                   3324 ;   X 	 integer
                                   3325 ; ---------------------------------
                           000001  3326 	NEG=1
                           000001  3327 	VSIZE=1
      009043                       3328 factor:
      000FC3                       3329 	_vars VSIZE 
      009043 52 01            [ 2]    1     sub sp,#VSIZE 
      009045 CD 88 46         [ 4] 3330 	call next_token
      009048 A1 02            [ 1] 3331 	cp a,#CMD_END 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00904A 2B 4C            [ 1] 3332 	jrmi 20$
      00904C 6B 01            [ 1] 3333 1$:	ld (NEG,sp),a 
      00904E A4 30            [ 1] 3334 	and a,#TK_GRP_MASK
      009050 A1 10            [ 1] 3335 	cp a,#TK_GRP_ADD 
      009052 27 04            [ 1] 3336 	jreq 2$
      009054 7B 01            [ 1] 3337 	ld a,(NEG,sp)
      009056 20 03            [ 2] 3338 	jra 4$  
      009058                       3339 2$:	
      009058 CD 88 46         [ 4] 3340 	call next_token 
      00905B                       3341 4$:	
      00905B A1 07            [ 1] 3342 	cp a,#TK_IFUNC 
      00905D 26 03            [ 1] 3343 	jrne 5$ 
      00905F FD               [ 4] 3344 	call (x) 
      009060 20 2D            [ 2] 3345 	jra 18$ 
      009062                       3346 5$:
      009062 A1 04            [ 1] 3347 	cp a,#TK_INTGR
      009064 26 02            [ 1] 3348 	jrne 6$
      009066 20 27            [ 2] 3349 	jra 18$
      009068                       3350 6$:
      009068 A1 02            [ 1] 3351 	cp a,#TK_ARRAY
      00906A 26 06            [ 1] 3352 	jrne 10$
      00906C CD 90 1C         [ 4] 3353 	call get_array_element
      00906F FE               [ 2] 3354 	ldw x,(x)
      009070 20 1D            [ 2] 3355 	jra 18$ 
      009072                       3356 10$:
      009072 A1 05            [ 1] 3357 	cp a,#TK_VAR 
      009074 26 03            [ 1] 3358 	jrne 12$
      009076 FE               [ 2] 3359 	ldw x,(x)
      009077 20 16            [ 2] 3360 	jra 18$
      009079                       3361 12$:			
      009079 A1 0B            [ 1] 3362 	cp a,#TK_LPAREN
      00907B 26 0C            [ 1] 3363 	jrne 16$
      00907D CD 91 2C         [ 4] 3364 	call relation
      009080 89               [ 2] 3365 	pushw x 
      009081 A6 0C            [ 1] 3366 	ld a,#TK_RPAREN 
      009083 CD 8F DB         [ 4] 3367 	call expect
      009086 85               [ 2] 3368 	popw x 
      009087 20 06            [ 2] 3369 	jra 18$	
      009089                       3370 16$:
      009089 CD 8D DE         [ 4] 3371 	call unget_token
      00908C 4F               [ 1] 3372 	clr a 
      00908D 20 09            [ 2] 3373 	jra 20$ 
      00908F                       3374 18$: 
      00908F A6 11            [ 1] 3375 	ld a,#TK_MINUS 
      009091 11 01            [ 1] 3376 	cp a,(NEG,sp)
      009093 26 01            [ 1] 3377 	jrne 19$
      009095 50               [ 2] 3378 	negw x
      009096                       3379 19$:
      009096 A6 04            [ 1] 3380 	ld a,#TK_INTGR
      009098                       3381 20$:
      001018                       3382 	_drop VSIZE
      009098 5B 01            [ 2]    1     addw sp,#VSIZE 
      00909A 81               [ 4] 3383 	ret
                                   3384 
                                   3385 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3386 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3387 ; output:
                                   3388 ;   A    	token attribute 
                                   3389 ;	X		integer
                                   3390 ;-----------------------------------
                           000001  3391 	N1=1
                           000003  3392 	N2=3
                           000005  3393 	MULOP=5
                           000005  3394 	VSIZE=5
      00909B                       3395 term:
      00101B                       3396 	_vars VSIZE
      00909B 52 05            [ 2]    1     sub sp,#VSIZE 
      00909D CD 90 43         [ 4] 3397 	call factor
      0090A0 A1 02            [ 1] 3398 	cp a,#CMD_END
      0090A2 2B 41            [ 1] 3399 	jrmi term_exit
      0090A4                       3400 term01:	 ; check for  operator 
      0090A4 1F 03            [ 2] 3401 	ldw (N2,sp),x  ; save first factor 
      0090A6 CD 88 46         [ 4] 3402 	call next_token
      0090A9 A1 02            [ 1] 3403 	cp a,#2
      0090AB 2B 34            [ 1] 3404 	jrmi 9$
      0090AD 6B 05            [ 1] 3405 0$:	ld (MULOP,sp),a
      0090AF A4 30            [ 1] 3406 	and a,#TK_GRP_MASK
      0090B1 A1 20            [ 1] 3407 	cp a,#TK_GRP_MULT
      0090B3 27 07            [ 1] 3408 	jreq 1$
      0090B5 7B 05            [ 1] 3409 	ld a,(MULOP,sp) 
      0090B7 CD 8D DE         [ 4] 3410 	call unget_token 
      0090BA 20 25            [ 2] 3411 	jra 9$
      0090BC                       3412 1$:	; got *|/|%
      0090BC CD 90 43         [ 4] 3413 	call factor
      0090BF A1 04            [ 1] 3414 	cp a,#TK_INTGR
      0090C1 27 03            [ 1] 3415 	jreq 2$ 
      0090C3 CC 87 92         [ 2] 3416 	jp syntax_error
      0090C6 1F 01            [ 2] 3417 2$:	ldw (N1,sp),x  
      0090C8 7B 05            [ 1] 3418 	ld a,(MULOP,sp) 
      0090CA A1 20            [ 1] 3419 	cp a,#TK_MULT 
      0090CC 26 05            [ 1] 3420 	jrne 3$
      0090CE CD 8E B7         [ 4] 3421 	call multiply 
      0090D1 20 D1            [ 2] 3422 	jra term01
      0090D3 A1 21            [ 1] 3423 3$: cp a,#TK_DIV 
      0090D5 26 05            [ 1] 3424 	jrne 4$ 
      0090D7 CD 8E FF         [ 4] 3425 	call divide 
      0090DA 20 C8            [ 2] 3426 	jra term01 
      0090DC CD 8F 43         [ 4] 3427 4$: call modulo
      0090DF 20 C3            [ 2] 3428 	jra term01 
      0090E1 1E 03            [ 2] 3429 9$: ldw x,(N2,sp)  
      0090E3 A6 04            [ 1] 3430 	ld a,#TK_INTGR 	
      0090E5                       3431 term_exit:
      001065                       3432 	_drop VSIZE 
      0090E5 5B 05            [ 2]    1     addw sp,#VSIZE 
      0090E7 81               [ 4] 3433 	ret 
                                   3434 
                                   3435 ;-------------------------------
                                   3436 ;  expr ::= term [['+'|'-'] term]*
                                   3437 ;  result range {-32768..32767}
                                   3438 ;  output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3439 ;   A    token attribute 
                                   3440 ;   X	 integer   
                                   3441 ;-------------------------------
                           000001  3442 	N1=1 
                           000003  3443 	N2=3
                           000005  3444 	OP=5 
                           000005  3445 	VSIZE=5 
      0090E8                       3446 expression:
      001068                       3447 	_vars VSIZE 
      0090E8 52 05            [ 2]    1     sub sp,#VSIZE 
      0090EA CD 90 9B         [ 4] 3448 	call term
      0090ED A1 02            [ 1] 3449 	cp a,#CMD_END 
      0090EF 2B 38            [ 1] 3450 	jrmi expr_exit 
      0090F1 1F 03            [ 2] 3451 0$:	ldw (N2,sp),x 
      0090F3 CD 88 46         [ 4] 3452 	call next_token
      0090F6 A1 02            [ 1] 3453 	cp a,#2
      0090F8 2B 2B            [ 1] 3454 	jrmi 9$ 
      0090FA 6B 05            [ 1] 3455 1$:	ld (OP,sp),a  
      0090FC A4 30            [ 1] 3456 	and a,#TK_GRP_MASK
      0090FE A1 10            [ 1] 3457 	cp a,#TK_GRP_ADD 
      009100 27 07            [ 1] 3458 	jreq 2$ 
      009102 7B 05            [ 1] 3459 	ld a,(OP,sp)
      009104 CD 8D DE         [ 4] 3460 	call unget_token
      009107 20 1C            [ 2] 3461 	jra 9$
      009109                       3462 2$: 
      009109 CD 90 9B         [ 4] 3463 	call term
      00910C A1 04            [ 1] 3464 	cp a,#TK_INTGR 
      00910E 27 03            [ 1] 3465 	jreq 3$
      009110 CC 87 92         [ 2] 3466 	jp syntax_error
      009113 1F 01            [ 2] 3467 3$:	ldw (N1,sp),x 
      009115 7B 05            [ 1] 3468 	ld a,(OP,sp)
      009117 A1 10            [ 1] 3469 	cp a,#TK_PLUS 
      009119 26 05            [ 1] 3470 	jrne 4$
      00911B CD 8E A9         [ 4] 3471 	call add 
      00911E 20 D1            [ 2] 3472 	jra 0$ 
      009120 CD 8E B1         [ 4] 3473 4$:	call substract
      009123 20 CC            [ 2] 3474 	jra 0$
      009125 1E 03            [ 2] 3475 9$: ldw x,(N2,sp)
      009127 A6 04            [ 1] 3476 	ld a,#TK_INTGR	
      009129                       3477 expr_exit:
      0010A9                       3478 	_drop VSIZE 
      009129 5B 05            [ 2]    1     addw sp,#VSIZE 
      00912B 81               [ 4] 3479 	ret 
                                   3480 
                                   3481 ;---------------------------------------------
                                   3482 ; rel ::= expr rel_op expr
                                   3483 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3484 ;  relation return 1 | 0  for true | false 
                                   3485 ;  output:
                                   3486 ;    A 		token attribute  
                                   3487 ;	 X		1|0
                                   3488 ;---------------------------------------------
                           000001  3489 	N1=1
                           000003  3490 	N2=3
                           000005  3491 	RELOP=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                           000005  3492 	VSIZE=5 
      00912C                       3493 relation: 
      0010AC                       3494 	_vars VSIZE
      00912C 52 05            [ 2]    1     sub sp,#VSIZE 
      00912E CD 90 E8         [ 4] 3495 	call expression
      009131 A1 02            [ 1] 3496 	cp a,#CMD_END  
      009133 2B 4B            [ 1] 3497 	jrmi rel_exit 
                                   3498 	; expect rel_op or leave 
      009135 1F 03            [ 2] 3499 	ldw (N2,sp),x 
      009137 CD 88 46         [ 4] 3500 	call next_token 
      00913A A1 02            [ 1] 3501 	cp a,#2
      00913C 2B 3E            [ 1] 3502 	jrmi 9$
      00913E                       3503 1$:	
      00913E 6B 05            [ 1] 3504 	ld (RELOP,sp),a 
      009140 A4 30            [ 1] 3505 	and a,#TK_GRP_MASK
      009142 A1 30            [ 1] 3506 	cp a,#TK_GRP_RELOP 
      009144 27 07            [ 1] 3507 	jreq 2$
      009146 7B 05            [ 1] 3508 	ld a,(RELOP,sp)
      009148 CD 8D DE         [ 4] 3509 	call unget_token  
      00914B 20 2F            [ 2] 3510 	jra 9$
      00914D                       3511 2$:	; expect another expression or error 
      00914D CD 90 E8         [ 4] 3512 	call expression
      009150 A1 04            [ 1] 3513 	cp a,#TK_INTGR 
      009152 27 03            [ 1] 3514 	jreq 3$
      009154 CC 87 92         [ 2] 3515 	jp syntax_error 
      009157 1F 01            [ 2] 3516 3$:	ldw (N1,sp),x 
      009159 CD 8E B1         [ 4] 3517 	call substract
      00915C 26 06            [ 1] 3518 	jrne 4$
      00915E 35 02 00 0E      [ 1] 3519 	mov acc8,#2 ; n1==n2
      009162 20 0C            [ 2] 3520 	jra 6$ 
      009164                       3521 4$: 
      009164 2C 06            [ 1] 3522 	jrsgt 5$  
      009166 35 04 00 0E      [ 1] 3523 	mov acc8,#4 ; n1<2 
      00916A 20 04            [ 2] 3524 	jra 6$
      00916C                       3525 5$:
      00916C 35 01 00 0E      [ 1] 3526 	mov acc8,#1 ; n1>n2 
      009170                       3527 6$:
      009170 5F               [ 1] 3528 	clrw x 
      009171 C6 00 0E         [ 1] 3529 	ld a, acc8  
      009174 14 05            [ 1] 3530 	and a,(RELOP,sp)
      009176 4D               [ 1] 3531 	tnz a 
      009177 27 05            [ 1] 3532 	jreq 10$
      009179 5C               [ 2] 3533 	incw x 
      00917A                       3534 7$:	 
      00917A 20 02            [ 2] 3535 	jra 10$  	
      00917C 1E 03            [ 2] 3536 9$: ldw x,(N2,sp)
      00917E                       3537 10$:
      00917E A6 04            [ 1] 3538 	ld a,#TK_INTGR
      009180                       3539 rel_exit: 	 
      001100                       3540 	_drop VSIZE
      009180 5B 05            [ 2]    1     addw sp,#VSIZE 
      009182 81               [ 4] 3541 	ret 
                                   3542 
                                   3543 ;--------------------------------
                                   3544 ; BASIC: SHOW 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



                                   3545 ;  show content of dstack,cstack
                                   3546 ;--------------------------------
      009183                       3547 show:
      009183 C6 00 0B         [ 1] 3548 	ld a,base 
      009186 88               [ 1] 3549 	push a 
      009187 CD 8E 48         [ 4] 3550 	call dots
      00918A CD 8E 7C         [ 4] 3551 	call dotr 
      00918D 84               [ 1] 3552 	pop a 
      00918E C7 00 0B         [ 1] 3553 	ld base,a 
      009191 4F               [ 1] 3554 	clr a 
      009192 81               [ 4] 3555 	ret
                                   3556 
                                   3557 ;--------------------------------------------
                                   3558 ; BASIC: HEX 
                                   3559 ; select hexadecimal base for integer print
                                   3560 ;---------------------------------------------
      009193                       3561 hex_base:
      009193 35 10 00 0B      [ 1] 3562 	mov base,#16 
      009197 81               [ 4] 3563 	ret 
                                   3564 
                                   3565 ;--------------------------------------------
                                   3566 ; BASIC: DEC 
                                   3567 ; select decimal base for integer print
                                   3568 ;---------------------------------------------
      009198                       3569 dec_base:
      009198 35 0A 00 0B      [ 1] 3570 	mov base,#10
      00919C 81               [ 4] 3571 	ret 
                                   3572 
                                   3573 ;------------------------
                                   3574 ; BASIC: SIZE 
                                   3575 ; return free size in text area
                                   3576 ; output:
                                   3577 ;   A 		TK_INTGR
                                   3578 ;   X 	    size integer
                                   3579 ;--------------------------
      00919D                       3580 size:
      00919D AE 16 E8         [ 2] 3581 	ldw x,#tib 
      0091A0 72 B0 00 21      [ 2] 3582 	subw x,txtend 
      0091A4 A6 04            [ 1] 3583 	ld a,#TK_INTGR
      0091A6 81               [ 4] 3584 	ret 
                                   3585 
                                   3586 
                                   3587 ;------------------------
                                   3588 ; BASIC: UBOUND  
                                   3589 ; return array variable size 
                                   3590 ; output:
                                   3591 ;   A 		TK_INTGR
                                   3592 ;   X 	    array size 
                                   3593 ;--------------------------
      0091A7                       3594 ubound:
      0091A7 AE 16 E8         [ 2] 3595 	ldw x,#tib
      0091AA 72 B0 00 21      [ 2] 3596 	subw x,txtend 
      0091AE 90 CE 00 05      [ 2] 3597 	ldw y,basicptr 
      0091B2 90 C3 00 21      [ 2] 3598 	cpw y,txtend 
      0091B6 25 0A            [ 1] 3599 	jrult 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0091B8 3B 00 04         [ 1] 3600 	push count 
      0091BB 4B 00            [ 1] 3601 	push #0 
      0091BD 72 F0 01         [ 2] 3602 	subw x,(1,sp)
      001140                       3603 	_drop 2 
      0091C0 5B 02            [ 2]    1     addw sp,#2 
      0091C2 54               [ 2] 3604 1$:	srlw x 
      0091C3 CF 00 24         [ 2] 3605 	ldw array_size,x
      0091C6 A6 04            [ 1] 3606 	ld a,#TK_INTGR
      0091C8 81               [ 4] 3607 	ret 
                                   3608 
                                   3609 ;-----------------------------
                                   3610 ; BASIC: LET var=expr 
                                   3611 ; variable assignement 
                                   3612 ; output:
                                   3613 ;   A 		TK_NONE 
                                   3614 ;-----------------------------
      0091C9                       3615 let:
      0091C9 CD 88 46         [ 4] 3616 	call next_token 
      0091CC A1 05            [ 1] 3617 	cp a,#TK_VAR 
      0091CE 27 03            [ 1] 3618 	jreq let02
      0091D0 CC 87 92         [ 2] 3619 	jp syntax_error
      0091D3                       3620 let02:
      0091D3 CD 8D E4         [ 4] 3621 	call dpush 
      0091D6 CD 88 46         [ 4] 3622 	call next_token 
      0091D9 A1 32            [ 1] 3623 	cp a,#TK_EQUAL
      0091DB 27 03            [ 1] 3624 	jreq 1$
      0091DD CC 87 92         [ 2] 3625 	jp syntax_error
      0091E0                       3626 1$:	
      0091E0 CD 91 2C         [ 4] 3627 	call relation   
      0091E3 A1 04            [ 1] 3628 	cp a,#TK_INTGR 
      0091E5 27 03            [ 1] 3629 	jreq 2$
      0091E7 CC 87 92         [ 2] 3630 	jp syntax_error
      0091EA                       3631 2$:	
      0091EA 90 93            [ 1] 3632 	ldw y,x 
      0091EC CD 8D F1         [ 4] 3633 	call dpop  
      0091EF FF               [ 2] 3634 	ldw (x),y   
      0091F0 81               [ 4] 3635 	ret 
                                   3636 
                                   3637 ;----------------------------
                                   3638 ; BASIC: LIST [[start][,end]]
                                   3639 ; list program lines 
                                   3640 ; form start to end 
                                   3641 ; if empty argument list then 
                                   3642 ; list all.
                                   3643 ;----------------------------
                           000001  3644 	FIRST=1
                           000003  3645 	LAST=3 
                           000005  3646 	LN_PTR=5
                           000006  3647 	VSIZE=6 
      0091F1                       3648 list:
      001171                       3649 	_vars VSIZE
      0091F1 52 06            [ 2]    1     sub sp,#VSIZE 
      0091F3 CE 00 1F         [ 2] 3650 	ldw x,txtbgn 
      0091F6 C3 00 21         [ 2] 3651 	cpw x,txtend 
      0091F9 2B 03            [ 1] 3652 	jrmi 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0091FB CC 92 73         [ 2] 3653 	jp list_exit ; nothing to list 
      0091FE 1F 05            [ 2] 3654 1$:	ldw (LN_PTR,sp),x 
      009200 FE               [ 2] 3655 	ldw x,(x) 
      009201 1F 01            [ 2] 3656 	ldw (FIRST,sp),x ; list from first line 
      009203 AE 7F FF         [ 2] 3657 	ldw x,#0x7fff ; biggest line number 
      009206 1F 03            [ 2] 3658 	ldw (LAST,sp),x 
      009208 CD 8F E8         [ 4] 3659 	call arg_list
      00920B 4D               [ 1] 3660 	tnz a
      00920C 27 3F            [ 1] 3661 	jreq list_start 
      00920E A1 02            [ 1] 3662 	cp a,#2 
      009210 27 07            [ 1] 3663 	jreq 4$
      009212 A1 01            [ 1] 3664 	cp a,#1 
      009214 27 06            [ 1] 3665 	jreq first_line 
      009216 CC 87 92         [ 2] 3666 	jp syntax_error 
      009219 CD 8D FE         [ 4] 3667 4$:	call dswap
      00921C                       3668 first_line:
      00921C CD 8D F1         [ 4] 3669 	call dpop 
      00921F 1F 01            [ 2] 3670 	ldw (FIRST,sp),x 
      009221 A1 01            [ 1] 3671 	cp a,#1 
      009223 27 05            [ 1] 3672 	jreq lines_skip 	
      009225                       3673 last_line:
      009225 CD 8D F1         [ 4] 3674 	call dpop 
      009228 1F 03            [ 2] 3675 	ldw (LAST,sp),x 
      00922A                       3676 lines_skip:
      00922A CE 00 1F         [ 2] 3677 	ldw x,txtbgn
      00922D 1F 05            [ 2] 3678 2$:	ldw (LN_PTR,sp),x 
      00922F C3 00 21         [ 2] 3679 	cpw x,txtend 
      009232 2A 3F            [ 1] 3680 	jrpl list_exit 
      009234 FE               [ 2] 3681 	ldw x,(x) ;line# 
      009235 13 01            [ 2] 3682 	cpw x,(FIRST,sp)
      009237 2A 14            [ 1] 3683 	jrpl list_start 
      009239 1E 05            [ 2] 3684 	ldw x,(LN_PTR,sp) 
      00923B 1C 00 02         [ 2] 3685 	addw x,#2 
      00923E F6               [ 1] 3686 	ld a,(x)
      00923F 5C               [ 2] 3687 	incw x 
      009240 C7 00 0E         [ 1] 3688 	ld acc8,a 
      009243 72 5F 00 0D      [ 1] 3689 	clr acc16 
      009247 72 BB 00 0D      [ 2] 3690 	addw x,acc16
      00924B 20 E0            [ 2] 3691 	jra 2$ 
                                   3692 ; print loop
      00924D                       3693 list_start:
      00924D 1E 05            [ 2] 3694 	ldw x,(LN_PTR,sp)
      00924F E6 02            [ 1] 3695 3$:	ld a,(2,x) 
      009251 CD 92 C6         [ 4] 3696 	call prt_basic_line
      009254 1E 05            [ 2] 3697 	ldw x,(LN_PTR,sp)
      009256 E6 02            [ 1] 3698 	ld a,(2,x)
      009258 C7 00 0E         [ 1] 3699 	ld acc8,a 
      00925B 72 5F 00 0D      [ 1] 3700 	clr acc16 
      00925F 72 BB 00 0D      [ 2] 3701 	addw x,acc16
      009263 C3 00 21         [ 2] 3702 	cpw x,txtend 
      009266 2A 0B            [ 1] 3703 	jrpl list_exit
      009268 1F 05            [ 2] 3704 	ldw (LN_PTR,sp),x
      00926A FE               [ 2] 3705 	ldw x,(x)
      00926B 13 03            [ 2] 3706 	cpw x,(LAST,sp)  
      00926D 2C 04            [ 1] 3707 	jrsgt list_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      00926F 1E 05            [ 2] 3708 	ldw x,(LN_PTR,sp)
      009271 20 DC            [ 2] 3709 	jra 3$
      009273                       3710 list_exit:
      0011F3                       3711 	_drop VSIZE 
      009273 5B 06            [ 2]    1     addw sp,#VSIZE 
      009275 81               [ 4] 3712 	ret
                                   3713 
                                   3714 ;-------------------------
                                   3715 ; print counted string 
                                   3716 ; input:
                                   3717 ;   X 	address of string
                                   3718 ;--------------------------
      009276                       3719 prt_cmd_name:
      009276 F6               [ 1] 3720 	ld a,(x)
      009277 5C               [ 2] 3721 	incw x
      009278 A4 0F            [ 1] 3722 	and a,#15  
      00927A 88               [ 1] 3723 	push a 
      00927B 0D 01            [ 1] 3724 1$: tnz (1,sp) 
      00927D 27 09            [ 1] 3725 	jreq 9$
      00927F F6               [ 1] 3726 	ld a,(x)
      009280 CD 82 33         [ 4] 3727 	call putc 
      009283 5C               [ 2] 3728 	incw x
      009284 0A 01            [ 1] 3729 	dec (1,sp)	 
      009286 20 F3            [ 2] 3730 	jra 1$
      009288 84               [ 1] 3731 9$: pop a 
      009289 81               [ 4] 3732 	ret	
                                   3733 
                                   3734 ;--------------------------
                                   3735 ; print TK_QSTR
                                   3736 ; converting control character
                                   3737 ; to backslash sequence
                                   3738 ; input:
                                   3739 ;   X        char *
                                   3740 ;-----------------------------
      00928A                       3741 prt_quote:
      00928A A6 22            [ 1] 3742 	ld a,#'"
      00928C CD 82 33         [ 4] 3743 	call putc 
      00928F F6               [ 1] 3744 1$:	ld a,(x)
      009290 27 2D            [ 1] 3745 	jreq 9$
      009292 5C               [ 2] 3746 	incw x 
      009293 A1 20            [ 1] 3747 	cp a,#SPACE 
      009295 25 0C            [ 1] 3748 	jrult 3$
      009297 CD 82 33         [ 4] 3749 	call putc
      00929A A1 5C            [ 1] 3750 	cp a,#'\ 
      00929C 26 F1            [ 1] 3751 	jrne 1$ 
      00929E                       3752 2$:
      00929E CD 82 33         [ 4] 3753 	call putc 
      0092A1 20 EC            [ 2] 3754 	jra 1$
      0092A3 88               [ 1] 3755 3$: push a 
      0092A4 A6 5C            [ 1] 3756 	ld a,#'\
      0092A6 CD 82 33         [ 4] 3757 	call putc 
      0092A9 84               [ 1] 3758 	pop a 
      0092AA A0 07            [ 1] 3759 	sub a,#7
      0092AC C7 00 0E         [ 1] 3760 	ld acc8,a 
      0092AF 72 5F 00 0D      [ 1] 3761 	clr acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0092B3 90 AE 8A AD      [ 2] 3762 	ldw y,#escaped 
      0092B7 72 B9 00 0D      [ 2] 3763 	addw y,acc16 
      0092BB 90 F6            [ 1] 3764 	ld a,(y)
      0092BD 20 DF            [ 2] 3765 	jra 2$
      0092BF A6 22            [ 1] 3766 9$: ld a,#'"
      0092C1 CD 82 33         [ 4] 3767 	call putc 
      0092C4 5C               [ 2] 3768 	incw x 
      0092C5 81               [ 4] 3769 	ret
                                   3770 
                                   3771 
                                   3772 ;--------------------------
                                   3773 ; decompile line from token list 
                                   3774 ; input:
                                   3775 ;   A       stop at this position 
                                   3776 ;   X 		pointer at line
                                   3777 ; output:
                                   3778 ;   none 
                                   3779 ;--------------------------	
                           000001  3780 	BASE_SAV=1
                           000002  3781 	WIDTH_SAV=2
                           000003  3782 	XSAVE=3
                           000005  3783 	LLEN=5
                           000005  3784 	VSIZE=5 
      0092C6                       3785 prt_basic_line:
      001246                       3786 	_vars VSIZE
      0092C6 52 05            [ 2]    1     sub sp,#VSIZE 
      0092C8 6B 05            [ 1] 3787 	ld (LLEN,sp),a  
      0092CA C6 00 0B         [ 1] 3788 	ld a,base
      0092CD 6B 01            [ 1] 3789 	ld (BASE_SAV,sp),a  
      0092CF C6 00 27         [ 1] 3790 	ld a,tab_width 
      0092D2 6B 02            [ 1] 3791 	ld (WIDTH_SAV,sp),a 
      0092D4 CF 00 18         [ 2] 3792 	ldw ptr16,x
      0092D7 FE               [ 2] 3793 	ldw x,(x)
      0092D8 35 0A 00 0B      [ 1] 3794 	mov base,#10
      0092DC 35 05 00 27      [ 1] 3795 	mov tab_width,#5
      0092E0 CD 88 E3         [ 4] 3796 	call print_int ; print line number 
      0092E3 A6 20            [ 1] 3797 	ld a,#SPACE 
      0092E5 CD 82 33         [ 4] 3798 	call putc 
      0092E8 72 5F 00 27      [ 1] 3799 	clr tab_width
      0092EC AE 00 03         [ 2] 3800 	ldw x,#3
      0092EF 9F               [ 1] 3801 1$:	ld a,xl 
      0092F0 11 05            [ 1] 3802 	cp a,(LLEN,sp)
      0092F2 2B 03            [ 1] 3803 	jrmi 20$
      0092F4 CC 93 F9         [ 2] 3804 	jp 90$
      0092F7                       3805 20$:	 
      0092F7 72 D6 00 18      [ 4] 3806 	ld a,([ptr16],x)
      0092FB 5C               [ 2] 3807 	incw x 
      0092FC 1F 03            [ 2] 3808 	ldw (XSAVE,sp),x 
      0092FE A1 06            [ 1] 3809 	cp a,#TK_CMD 
      009300 25 44            [ 1] 3810 	jrult 5$
      009302 A1 08            [ 1] 3811 	cp a,#TK_CFUNC 
      009304 22 2F            [ 1] 3812 	jrugt 4$
      009306                       3813 2$:	
      009306 72 DE 00 18      [ 5] 3814 	ldw x,([ptr16],x)
      00930A A3 95 1C         [ 2] 3815 	cpw x,#rem 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00930D 26 14            [ 1] 3816 	jrne 3$
      00930F A6 27            [ 1] 3817 	ld a,#''
      009311 CD 82 33         [ 4] 3818 	call putc 
      009314 1E 03            [ 2] 3819 	ldw x,(XSAVE,sp)
      009316 1C 00 02         [ 2] 3820 	addw x,#2
      009319 72 BB 00 18      [ 2] 3821 	addw x,ptr16  
      00931D CD 82 46         [ 4] 3822 	call puts 
      009320 CC 93 F9         [ 2] 3823 	jp 90$ 
      009323 CD 8F 54         [ 4] 3824 3$:	call cmd_name
      009326 CD 92 76         [ 4] 3825 	call prt_cmd_name
      009329 A6 20            [ 1] 3826 	ld a,#SPACE 
      00932B CD 82 33         [ 4] 3827 	call putc 
      00932E 1E 03            [ 2] 3828 	ldw x,(XSAVE,sp)
      009330 1C 00 02         [ 2] 3829 	addw x,#2
      009333 20 BA            [ 2] 3830 	jra 1$
      009335 A1 0A            [ 1] 3831 4$: cp a,#TK_QSTR 
      009337 26 0D            [ 1] 3832 	jrne 5$
      009339 72 BB 00 18      [ 2] 3833 	addw x,ptr16
      00933D CD 92 8A         [ 4] 3834 	call prt_quote 
      009340 72 B0 00 18      [ 2] 3835 	subw x,ptr16  
      009344 20 A9            [ 2] 3836 	jra 1$
      009346 A1 05            [ 1] 3837 5$:	cp a,#TK_VAR
      009348 26 1A            [ 1] 3838 	jrne 6$ 
      00934A 72 DE 00 18      [ 5] 3839 	ldw x,([ptr16],x)
      00934E 1D 00 29         [ 2] 3840 	subw x,#vars 
      009351 9F               [ 1] 3841 	ld a,xl
      009352 44               [ 1] 3842 	srl a 
      009353 AB 41            [ 1] 3843 	add a,#'A 
      009355 CD 82 33         [ 4] 3844 	call putc 
      009358 A6 20            [ 1] 3845 	ld a,#SPACE 
      00935A CD 82 33         [ 4] 3846 	call putc 
      00935D 1E 03            [ 2] 3847 	ldw x,(XSAVE,sp)
      00935F 1C 00 02         [ 2] 3848 	addw x,#2 
      009362 20 8B            [ 2] 3849 	jra 1$ 
      009364 A1 02            [ 1] 3850 6$: cp a,#TK_ARRAY 
      009366 26 0A            [ 1] 3851 	jrne 7$
      009368 A6 40            [ 1] 3852 	ld a,#'@ 
      00936A CD 82 33         [ 4] 3853 	call putc 
      00936D 1E 03            [ 2] 3854 	ldw x,(XSAVE,sp)
      00936F CC 92 EF         [ 2] 3855 	jp 1$ 
      009372 A1 04            [ 1] 3856 7$: cp a,#TK_INTGR 
      009374 26 0F            [ 1] 3857 	jrne 8$
      009376 72 DE 00 18      [ 5] 3858 	ldw x,([ptr16],x)
      00937A CD 88 E3         [ 4] 3859 	call print_int
                                   3860 ;	ld a,#SPACE 
                                   3861 ;	call putc 
      00937D 1E 03            [ 2] 3862 	ldw x,(XSAVE,sp)
      00937F 1C 00 02         [ 2] 3863 	addw x,#2 
      009382 CC 92 EF         [ 2] 3864 	jp 1$
      009385 A1 31            [ 1] 3865 8$: cp a,#TK_GT 
      009387 2B 1A            [ 1] 3866 	jrmi 9$
      009389 A1 35            [ 1] 3867 	cp a,#TK_NE 
      00938B 22 16            [ 1] 3868 	jrugt 9$
      00938D A0 31            [ 1] 3869 	sub a,#TK_GT  
      00938F 48               [ 1] 3870 	sll a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009390 90 5F            [ 1] 3871 	clrw y 
      009392 90 97            [ 1] 3872 	ld yl,a 
      009394 72 A9 94 12      [ 2] 3873 	addw y,#relop_str 
      009398 90 FE            [ 2] 3874 	ldw y,(y)
      00939A 93               [ 1] 3875 	ldw x,y 
      00939B CD 82 46         [ 4] 3876 	call puts 
      00939E 1E 03            [ 2] 3877 	ldw x,(XSAVE,sp)
      0093A0 CC 92 EF         [ 2] 3878 	jp 1$
      0093A3 A1 10            [ 1] 3879 9$: cp a,#TK_PLUS 
      0093A5 26 04            [ 1] 3880 	jrne 10$
      0093A7 A6 2B            [ 1] 3881 	ld a,#'+
      0093A9 20 46            [ 2] 3882 	jra 80$ 
      0093AB A1 11            [ 1] 3883 10$: cp a,#TK_MINUS
      0093AD 26 04            [ 1] 3884 	jrne 11$
      0093AF A6 2D            [ 1] 3885 	ld a,#'-
      0093B1 20 3E            [ 2] 3886 	jra 80$
      0093B3 A1 20            [ 1] 3887 11$: cp a,#TK_MULT 
      0093B5 2B 0E            [ 1] 3888 	jrmi 12$
      0093B7 A1 22            [ 1] 3889 	cp a,#TK_MOD 
      0093B9 22 0A            [ 1] 3890 	jrugt 12$
      0093BB A0 20            [ 1] 3891 	sub a,#0x20
      0093BD 5F               [ 1] 3892 	clrw x 
      0093BE 97               [ 1] 3893 	ld xl,a 
      0093BF 1C 94 0F         [ 2] 3894 	addw x,#mul_char 
      0093C2 F6               [ 1] 3895 	ld a,(x)
      0093C3 20 2C            [ 2] 3896 	jra 80$ 
      0093C5 A1 0B            [ 1] 3897 12$: cp a,#TK_LPAREN 
      0093C7 2B 0E            [ 1] 3898 	jrmi 13$
      0093C9 A1 0E            [ 1] 3899 	cp a,#TK_SHARP 
      0093CB 22 0A            [ 1] 3900 	jrugt 13$
      0093CD A0 0B            [ 1] 3901 	sub a,#TK_LPAREN
      0093CF 5F               [ 1] 3902 	clrw x 
      0093D0 97               [ 1] 3903 	ld xl,a 
      0093D1 1C 94 0B         [ 2] 3904 	addw x,#single_char 
      0093D4 F6               [ 1] 3905 	ld a,(x)
      0093D5 20 1A            [ 2] 3906 	jra 80$
      0093D7 A1 03            [ 1] 3907 13$: cp a,#TK_CHAR 
      0093D9 26 14            [ 1] 3908 	jrne 14$
      0093DB A6 5C            [ 1] 3909 	ld a,#'\
      0093DD CD 82 33         [ 4] 3910 	call putc 
      0093E0 1E 03            [ 2] 3911 	ldw x,(XSAVE,sp)
      0093E2 72 D6 00 18      [ 4] 3912 	ld a,([ptr16],x)
      0093E6 5C               [ 2] 3913 	incw x 
      0093E7 1F 03            [ 2] 3914 	ldw (XSAVE,sp),x 
      0093E9 CD 82 33         [ 4] 3915 	call putc 
      0093EC CC 92 EF         [ 2] 3916 	jp 1$ 
      0093EF A6 3A            [ 1] 3917 14$: ld a,#':
      0093F1 CD 82 33         [ 4] 3918 80$: call putc 
      0093F4 1E 03            [ 2] 3919 	ldw x,(XSAVE,sp)
      0093F6 CC 92 EF         [ 2] 3920 	jp 1$ 
      0093F9                       3921 90$: 
      0093F9 A6 0D            [ 1] 3922 	ld a,#CR 
      0093FB CD 82 33         [ 4] 3923 	call putc
      0093FE 7B 02            [ 1] 3924 	ld a,(WIDTH_SAV,sp) 
      009400 C7 00 27         [ 1] 3925 	ld tab_width,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009403 7B 01            [ 1] 3926 	ld a,(BASE_SAV,sp) 
      009405 C7 00 0B         [ 1] 3927 	ld base,a
      001388                       3928 	_drop VSIZE 
      009408 5B 05            [ 2]    1     addw sp,#VSIZE 
      00940A 81               [ 4] 3929 	ret 	
      00940B 28 29 2C 23           3930 single_char: .byte '(',')',',','#'
      00940F 2A 2F 25              3931 mul_char: .byte '*','/','%'
      009412 94 1E 94 20 94 22 94  3932 relop_str: .word gt,equal,ge,lt,le,ne 
             25 94 27 94 2A
      00941E 3E 00                 3933 gt: .asciz ">"
      009420 3D 00                 3934 equal: .asciz "="
      009422 3E 3D 00              3935 ge: .asciz ">="
      009425 3C 00                 3936 lt: .asciz "<"
      009427 3C 3D 00              3937 le: .asciz "<="
      00942A 3C 3E 00              3938 ne:  .asciz "<>"
                                   3939 
                                   3940 
                                   3941 ;---------------------------------
                                   3942 ; BASIC: PRINT|? arg_list 
                                   3943 ; print values from argument list
                                   3944 ;----------------------------------
                           000001  3945 	COMMA=1
                           000001  3946 	VSIZE=1
      00942D                       3947 print:
      00942D 4B 00            [ 1] 3948 push #0 ; local variable COMMA 
      00942F                       3949 reset_comma:
      00942F 0F 01            [ 1] 3950 	clr (COMMA,sp)
      009431                       3951 prt_loop:
      009431 CD 91 2C         [ 4] 3952 	call relation 
      009434 A1 01            [ 1] 3953 	cp a,#TK_COLON 
      009436 27 51            [ 1] 3954 	jreq print_exit   
      009438 A1 04            [ 1] 3955 	cp a,#TK_INTGR 
      00943A 26 05            [ 1] 3956 	jrne 0$ 
      00943C CD 88 E3         [ 4] 3957 	call print_int 
      00943F 20 EE            [ 2] 3958 	jra reset_comma
      009441                       3959 0$: 	
      009441 CD 88 46         [ 4] 3960 	call next_token
      009444 A1 00            [ 1] 3961 	cp a,#TK_NONE 
      009446 27 41            [ 1] 3962 	jreq print_exit 
      009448 A1 0A            [ 1] 3963 1$:	cp a,#TK_QSTR
      00944A 26 05            [ 1] 3964 	jrne 2$   
      00944C CD 82 46         [ 4] 3965 	call puts
      00944F 20 DE            [ 2] 3966 	jra reset_comma
      009451 A1 03            [ 1] 3967 2$: cp a,#TK_CHAR 
      009453 26 06            [ 1] 3968 	jrne 3$
      009455 9F               [ 1] 3969 	ld a,xl 
      009456 CD 82 33         [ 4] 3970 	call putc 
      009459 20 D4            [ 2] 3971 	jra reset_comma 
      00945B                       3972 3$: 	
      00945B A1 08            [ 1] 3973 	cp a,#TK_CFUNC 
      00945D 26 07            [ 1] 3974 	jrne 4$ 
      00945F FD               [ 4] 3975 	call (x)
      009460 9F               [ 1] 3976 	ld a,xl 
      009461 CD 82 33         [ 4] 3977 	call putc
      009464 20 C9            [ 2] 3978 	jra reset_comma 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009466                       3979 4$: 
      009466 A1 0D            [ 1] 3980 	cp a,#TK_COMMA 
      009468 26 05            [ 1] 3981 	jrne 5$
      00946A 03 01            [ 1] 3982 	cpl (COMMA,sp) 
      00946C CC 94 31         [ 2] 3983 	jp prt_loop   
      00946F                       3984 5$: 
      00946F A1 0E            [ 1] 3985 	cp a,#TK_SHARP
      009471 26 13            [ 1] 3986 	jrne 7$
      009473 CD 88 46         [ 4] 3987 	call next_token
      009476 A1 04            [ 1] 3988 	cp a,#TK_INTGR 
      009478 27 03            [ 1] 3989 	jreq 6$
      00947A CC 87 92         [ 2] 3990 	jp syntax_error 
      00947D                       3991 6$:
      00947D 9F               [ 1] 3992 	ld a,xl 
      00947E A4 0F            [ 1] 3993 	and a,#15 
      009480 C7 00 27         [ 1] 3994 	ld tab_width,a 
      009483 CC 94 2F         [ 2] 3995 	jp reset_comma 
      009486                       3996 7$:	
      009486 CD 8D DE         [ 4] 3997 	call unget_token
      009489                       3998 print_exit:
      009489 0D 01            [ 1] 3999 	tnz (COMMA,sp)
      00948B 26 05            [ 1] 4000 	jrne 9$
      00948D A6 0D            [ 1] 4001 	ld a,#CR 
      00948F CD 82 33         [ 4] 4002     call putc 
      001412                       4003 9$:	_drop VSIZE 
      009492 5B 01            [ 2]    1     addw sp,#VSIZE 
      009494 81               [ 4] 4004 	ret 
                                   4005 
                                   4006 ;----------------------
                                   4007 ; 'save_context' and
                                   4008 ; 'rest_context' must be 
                                   4009 ; called at the same 
                                   4010 ; call stack depth 
                                   4011 ; i.e. SP must have the 
                                   4012 ; save value at  
                                   4013 ; entry point of both 
                                   4014 ; routine. 
                                   4015 ;---------------------
                           000004  4016 	CTXT_SIZE=4 ; size of saved data 
                                   4017 ;--------------------
                                   4018 ; save current BASIC
                                   4019 ; interpreter context 
                                   4020 ; on cstack 
                                   4021 ;--------------------
      009495                       4022 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001415                       4023 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001415                       4024 	_arg IN 3
                           000005     1     IN=ARG_OFS+3 
      001415                       4025 	_arg CNT 4
                           000006     1     CNT=ARG_OFS+4 
      001415                       4026 save_context:
      009495 CE 00 05         [ 2] 4027 	ldw x,basicptr 
      009498 1F 03            [ 2] 4028 	ldw (BPTR,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      00949A C6 00 02         [ 1] 4029 	ld a,in 
      00949D 6B 05            [ 1] 4030 	ld (IN,sp),a
      00949F C6 00 04         [ 1] 4031 	ld a,count 
      0094A2 6B 06            [ 1] 4032 	ld (CNT,sp),a  
      0094A4 81               [ 4] 4033 	ret
                                   4034 
                                   4035 ;-----------------------
                                   4036 ; restore previously saved 
                                   4037 ; BASIC interpreter context 
                                   4038 ; from cstack 
                                   4039 ;-------------------------
      0094A5                       4040 rest_context:
      0094A5 1E 03            [ 2] 4041 	ldw x,(BPTR,sp)
      0094A7 CF 00 05         [ 2] 4042 	ldw basicptr,x 
      0094AA 7B 05            [ 1] 4043 	ld a,(IN,sp)
      0094AC C7 00 02         [ 1] 4044 	ld in,a
      0094AF 7B 06            [ 1] 4045 	ld a,(CNT,sp)
      0094B1 C7 00 04         [ 1] 4046 	ld count,a  
      0094B4 81               [ 4] 4047 	ret
                                   4048 
                                   4049 ;------------------------------------------
                                   4050 ; BASIC: INPUT [string],var[,[string],var]
                                   4051 ; input value in variables 
                                   4052 ; [string] optionally can be used as prompt 
                                   4053 ;-----------------------------------------
                           000001  4054 	CX_BPTR=1
                           000003  4055 	CX_IN=3
                           000004  4056 	CX_CNT=4
                           000005  4057 	SKIP=5
                           000005  4058 	VSIZE=5
      0094B5                       4059 input_var:
      001435                       4060 	_vars VSIZE 
      0094B5 52 05            [ 2]    1     sub sp,#VSIZE 
      0094B7                       4061 input_loop:
      0094B7 0F 05            [ 1] 4062 	clr (SKIP,sp)
      0094B9 CD 88 46         [ 4] 4063 	call next_token 
      0094BC A1 0A            [ 1] 4064 	cp a,#TK_QSTR 
      0094BE 26 08            [ 1] 4065 	jrne 1$ 
      0094C0 CD 82 46         [ 4] 4066 	call puts 
      0094C3 03 05            [ 1] 4067 	cpl (SKIP,sp)
      0094C5 CD 88 46         [ 4] 4068 	call next_token 
      0094C8 A1 05            [ 1] 4069 1$: cp a,#TK_VAR  
      0094CA 27 03            [ 1] 4070 	jreq 2$ 
      0094CC CC 87 92         [ 2] 4071 	jp syntax_error
      0094CF CD 8D E4         [ 4] 4072 2$:	call dpush 
      0094D2 0D 05            [ 1] 4073 	tnz (SKIP,sp)
      0094D4 26 06            [ 1] 4074 	jrne 21$ 
                                   4075 ;	clr pad+2
      0094D6 AE 17 38         [ 2] 4076 	ldw x,#pad 
      0094D9 CD 82 46         [ 4] 4077 	call puts   
      0094DC                       4078 21$:
      0094DC A6 3A            [ 1] 4079 	ld a,#':
      0094DE CD 82 33         [ 4] 4080 	call putc 
      0094E1 CD 94 95         [ 4] 4081 	call save_context 
      0094E4 72 5F 00 04      [ 1] 4082 	clr count  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0094E8 CD 89 D3         [ 4] 4083 	call readln 
      0094EB AE 16 E8         [ 2] 4084 	ldw x,#tib 
      0094EE CF 00 05         [ 2] 4085 	ldw basicptr,x  
      0094F1 72 5F 00 02      [ 1] 4086 	clr in 
      0094F5 CD 8B 52         [ 4] 4087 	call get_token
      0094F8 A1 04            [ 1] 4088 	cp a,#TK_INTGR
      0094FA 27 06            [ 1] 4089 	jreq 3$ 
      0094FC CD 94 A5         [ 4] 4090 	call rest_context 
      0094FF CC 87 92         [ 2] 4091 	jp syntax_error
      009502 CD 8D E4         [ 4] 4092 3$: call dpush 
      009505 CD 8E 2B         [ 4] 4093 	call store 
      009508 CD 94 A5         [ 4] 4094 	call rest_context
      00950B CD 88 46         [ 4] 4095 	call next_token 
      00950E A1 0D            [ 1] 4096 	cp a,#TK_COMMA 
      009510 27 A5            [ 1] 4097 	jreq input_loop 
      009512 A1 01            [ 1] 4098 	cp a,#TK_COLON 
      009514 23 03            [ 2] 4099     jrule input_exit 
      009516 CC 87 92         [ 2] 4100 	jp syntax_error 
      009519                       4101 input_exit:
      001499                       4102 	_drop VSIZE 
      009519 5B 05            [ 2]    1     addw sp,#VSIZE 
      00951B 81               [ 4] 4103 	ret 
                                   4104 
                                   4105 
                                   4106 ;---------------------
                                   4107 ; BASIC: REMARK | ' 
                                   4108 ; skip comment to end of line 
                                   4109 ;---------------------- 
      00951C                       4110 rem:
      00951C 55 00 02 00 04   [ 1] 4111  	mov count,in 
      009521 81               [ 4] 4112 	ret 
                                   4113 
                                   4114 ;---------------------
                                   4115 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   4116 ; read in loop 'addr'  
                                   4117 ; apply & 'mask' to value 
                                   4118 ; loop while result==0.  
                                   4119 ; if 'xor_mask' given 
                                   4120 ; apply ^ in second  
                                   4121 ; loop while result==0 
                                   4122 ;---------------------
                           000001  4123 	XMASK=1 
                           000002  4124 	MASK=2
                           000003  4125 	ADDR=3
                           000004  4126 	VSIZE=4
      009522                       4127 wait: 
      0014A2                       4128 	_vars VSIZE
      009522 52 04            [ 2]    1     sub sp,#VSIZE 
      009524 0F 01            [ 1] 4129 	clr (XMASK,sp) 
      009526 CD 8F E8         [ 4] 4130 	call arg_list 
      009529 A1 02            [ 1] 4131 	cp a,#2
      00952B 24 03            [ 1] 4132 	jruge 0$
      00952D CC 87 92         [ 2] 4133 	jp syntax_error 
      009530 A1 03            [ 1] 4134 0$:	cp a,#3
      009532 25 06            [ 1] 4135 	jrult 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009534 CD 8D F1         [ 4] 4136 	call dpop 
      009537 9F               [ 1] 4137 	ld a,xl
      009538 6B 01            [ 1] 4138 	ld (XMASK,sp),a 
      00953A CD 8D F1         [ 4] 4139 1$: call dpop ; mask 
      00953D 9F               [ 1] 4140 	ld a,xl 
      00953E 6B 02            [ 1] 4141 	ld (MASK,sp),a 
      009540 CD 8D F1         [ 4] 4142 	call dpop ; address 
      009543 F6               [ 1] 4143 2$:	ld a,(x)
      009544 14 02            [ 1] 4144 	and a,(MASK,sp)
      009546 18 01            [ 1] 4145 	xor a,(XMASK,sp)
      009548 27 F9            [ 1] 4146 	jreq 2$ 
      0014CA                       4147 	_drop VSIZE 
      00954A 5B 04            [ 2]    1     addw sp,#VSIZE 
      00954C 81               [ 4] 4148 	ret 
                                   4149 
                                   4150 ;---------------------
                                   4151 ; BASIC: BSET addr,mask
                                   4152 ; set bits at 'addr' corresponding 
                                   4153 ; to those of 'mask' that are at 1.
                                   4154 ; arguments:
                                   4155 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4156 ;   mask        mask|addr
                                   4157 ; output:
                                   4158 ;	none 
                                   4159 ;--------------------------
      00954D                       4160 bit_set:
      00954D CD 8F E8         [ 4] 4161 	call arg_list 
      009550 A1 02            [ 1] 4162 	cp a,#2	 
      009552 27 03            [ 1] 4163 	jreq 1$ 
      009554 CC 87 92         [ 2] 4164 	jp syntax_error
      009557                       4165 1$: 
      009557 CD 8D F1         [ 4] 4166 	call dpop ; mask 
      00955A 9F               [ 1] 4167 	ld a,xl 
      00955B CD 8D F1         [ 4] 4168 	call dpop ; addr  
      00955E FA               [ 1] 4169 	or a,(x)
      00955F F7               [ 1] 4170 	ld (x),a
      009560 81               [ 4] 4171 	ret 
                                   4172 
                                   4173 ;---------------------
                                   4174 ; BASIC: BRES addr,mask
                                   4175 ; reset bits at 'addr' corresponding 
                                   4176 ; to those of 'mask' that are at 1.
                                   4177 ; arguments:
                                   4178 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4179 ;   mask	    ~mask&*addr  
                                   4180 ; output:
                                   4181 ;	none 
                                   4182 ;--------------------------
      009561                       4183 bit_reset:
      009561 CD 8F E8         [ 4] 4184 	call arg_list 
      009564 A1 02            [ 1] 4185 	cp a,#2  
      009566 27 03            [ 1] 4186 	jreq 1$ 
      009568 CC 87 92         [ 2] 4187 	jp syntax_error
      00956B                       4188 1$: 
      00956B CD 8D F1         [ 4] 4189 	call dpop ; mask 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00956E 9F               [ 1] 4190 	ld a,xl 
      00956F 43               [ 1] 4191 	cpl a 
      009570 CD 8D F1         [ 4] 4192 	call dpop ; addr  
      009573 F4               [ 1] 4193 	and a,(x)
      009574 F7               [ 1] 4194 	ld (x),a 
      009575 81               [ 4] 4195 	ret 
                                   4196 
                                   4197 ;---------------------
                                   4198 ; BASIC: BTOGL addr,mask
                                   4199 ; toggle bits at 'addr' corresponding 
                                   4200 ; to those of 'mask' that are at 1.
                                   4201 ; arguments:
                                   4202 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4203 ;   mask	    mask^*addr  
                                   4204 ; output:
                                   4205 ;	none 
                                   4206 ;--------------------------
      009576                       4207 bit_toggle:
      009576 CD 8F E8         [ 4] 4208 	call arg_list 
      009579 A1 02            [ 1] 4209 	cp a,#2 
      00957B 27 03            [ 1] 4210 	jreq 1$ 
      00957D CC 87 92         [ 2] 4211 	jp syntax_error
      009580 CD 8D F1         [ 4] 4212 1$: call dpop ; mask 
      009583 9F               [ 1] 4213 	ld a,xl 
      009584 CD 8D F1         [ 4] 4214 	call dpop ; addr  
      009587 F8               [ 1] 4215 	xor a,(x)
      009588 F7               [ 1] 4216 	ld (x),a 
      009589 81               [ 4] 4217 	ret 
                                   4218 
                                   4219 
                                   4220 ;---------------------
                                   4221 ; BASIC: BTEST(addr,bit)
                                   4222 ; return bit value at 'addr' 
                                   4223 ; bit is in range {0..7}.
                                   4224 ; arguments:
                                   4225 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4226 ;   bit 	    bit position {0..7}  
                                   4227 ; output:
                                   4228 ;	none 
                                   4229 ;--------------------------
      00958A                       4230 bit_test:
      00958A CD 90 0C         [ 4] 4231 	call func_args 
      00958D A1 02            [ 1] 4232 	cp a,#2
      00958F 27 03            [ 1] 4233 	jreq 0$
      009591 CC 87 92         [ 2] 4234 	jp syntax_error
      009594                       4235 0$:	
      009594 CD 8D F1         [ 4] 4236 	call dpop 
      009597 9F               [ 1] 4237 	ld a,xl 
      009598 A4 07            [ 1] 4238 	and a,#7
      00959A 88               [ 1] 4239 	push a 
      00959B A6 01            [ 1] 4240 	ld a,#1 
      00959D 0D 01            [ 1] 4241 1$: tnz (1,sp)
      00959F 27 05            [ 1] 4242 	jreq 2$
      0095A1 48               [ 1] 4243 	sll a 
      0095A2 0A 01            [ 1] 4244 	dec (1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0095A4 20 F7            [ 2] 4245 	jra 1$
      0095A6 CD 8D F1         [ 4] 4246 2$: call dpop 
      0095A9 F4               [ 1] 4247 	and a,(x)
      0095AA 27 02            [ 1] 4248 	jreq 3$
      0095AC A6 01            [ 1] 4249 	ld a,#1 
      0095AE 5F               [ 1] 4250 3$:	clrw x 
      0095AF 97               [ 1] 4251 	ld xl,a 
      0095B0 A6 04            [ 1] 4252 	ld a,#TK_INTGR
      001532                       4253 	_drop 1 
      0095B2 5B 01            [ 2]    1     addw sp,#1 
      0095B4 81               [ 4] 4254 	ret
                                   4255 
                                   4256 
                                   4257 ;--------------------
                                   4258 ; BASIC: POKE addr,byte
                                   4259 ; put a byte at addr 
                                   4260 ;--------------------
      0095B5                       4261 poke:
      0095B5 CD 8F E8         [ 4] 4262 	call arg_list 
      0095B8 A1 02            [ 1] 4263 	cp a,#2
      0095BA 27 03            [ 1] 4264 	jreq 1$
      0095BC CC 87 92         [ 2] 4265 	jp syntax_error
      0095BF                       4266 1$:	
      0095BF CD 8D F1         [ 4] 4267 	call dpop 
      0095C2 9F               [ 1] 4268     ld a,xl 
      0095C3 CD 8D F1         [ 4] 4269 	call dpop 
      0095C6 F7               [ 1] 4270 	ld (x),a 
      0095C7 81               [ 4] 4271 	ret 
                                   4272 
                                   4273 ;-----------------------
                                   4274 ; BASIC: PEEK(addr)
                                   4275 ; get the byte at addr 
                                   4276 ; input:
                                   4277 ;	none 
                                   4278 ; output:
                                   4279 ;	X 		value 
                                   4280 ;-----------------------
      0095C8                       4281 peek:
      0095C8 CD 90 0C         [ 4] 4282 	call func_args
      0095CB A1 01            [ 1] 4283 	cp a,#1
      0095CD 27 03            [ 1] 4284 	jreq 1$
      0095CF CC 87 92         [ 2] 4285 	jp syntax_error
      0095D2 CD 8D F1         [ 4] 4286 1$:	call dpop 
      0095D5 F6               [ 1] 4287 	ld a,(x)
      0095D6 5F               [ 1] 4288 	clrw x 
      0095D7 97               [ 1] 4289 	ld xl,a 
      0095D8 A6 04            [ 1] 4290 	ld a,#TK_INTGR
      0095DA 81               [ 4] 4291 	ret 
                                   4292 
                                   4293 ;----------------------------
                                   4294 ; BASIC: XPEEK(page,addr)
                                   4295 ; read extended memory byte
                                   4296 ; page in range {0,1,2}
                                   4297 ;----------------------------
      0095DB                       4298 xpeek:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095DB CD 90 0C         [ 4] 4299 	call func_args 
      0095DE A1 02            [ 1] 4300 	cp a,#2 
      0095E0 27 03            [ 1] 4301 	jreq 1$
      0095E2 CC 87 92         [ 2] 4302 	jp syntax_error
      0095E5                       4303 1$: 
      0095E5 CD 8D F1         [ 4] 4304 	call dpop 
      0095E8 CF 00 18         [ 2] 4305 	ldw farptr+1,x 
      0095EB CD 8D F1         [ 4] 4306 	call dpop 
      0095EE 9F               [ 1] 4307 	ld a,xl 
      0095EF C7 00 17         [ 1] 4308 	ld farptr,a 
      0095F2 5F               [ 1] 4309 	clrw x
      0095F3 92 BC 00 17      [ 5] 4310 	ldf a,[farptr]
      0095F7 97               [ 1] 4311 	ld xl,a 
      0095F8 A6 04            [ 1] 4312 	ld a,#TK_INTGR 
      0095FA 81               [ 4] 4313 	ret 
                                   4314 
                                   4315 ;---------------------------
                                   4316 ; BASIC IF expr : instructions
                                   4317 ; evaluate expr and if true 
                                   4318 ; execute instructions on same line. 
                                   4319 ;----------------------------
      0095FB                       4320 if: 
      0095FB CD 91 2C         [ 4] 4321 	call relation 
      0095FE A1 04            [ 1] 4322 	cp a,#TK_INTGR
      009600 27 03            [ 1] 4323 	jreq 1$ 
      009602 CC 87 92         [ 2] 4324 	jp syntax_error
      009605 4F               [ 1] 4325 1$:	clr a 
      009606 5D               [ 2] 4326 	tnzw x 
      009607 26 05            [ 1] 4327 	jrne 9$  
                                   4328 ;skip to next line
      009609 55 00 04 00 02   [ 1] 4329 	mov in,count
      00960E 81               [ 4] 4330 9$:	ret 
                                   4331 
                                   4332 ;------------------------
                                   4333 ; BASIC: FOR var=expr 
                                   4334 ; set variable to expression 
                                   4335 ; leave variable address 
                                   4336 ; on dstack and set
                                   4337 ; FLOOP bit in 'flags'
                                   4338 ;-----------------
                           000001  4339 	RETL1=1
                           000003  4340 	INW=3
                           000005  4341 	BPTR=5
      00960F                       4342 for: ; { -- var_addr }
      00960F A6 05            [ 1] 4343 	ld a,#TK_VAR 
      009611 CD 8F DB         [ 4] 4344 	call expect
      009614 CD 8D E4         [ 4] 4345 	call dpush 
      009617 CD 91 D3         [ 4] 4346 	call let02 
      00961A 72 14 00 26      [ 1] 4347 	bset flags,#FLOOP 
                                   4348 ; open space on cstack for BPTR and INW 
      00961E 85               [ 2] 4349 	popw x ; call return address 
      00159F                       4350 	_vars 4
      00961F 52 04            [ 2]    1     sub sp,#4 
      009621 89               [ 2] 4351 	pushw x  ; RETL1 
      009622 5F               [ 1] 4352 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009623 1F 05            [ 2] 4353 	ldw (BPTR,sp),x 
      009625 1F 03            [ 2] 4354 	ldw (INW,sp),x 
      009627 CD 88 46         [ 4] 4355 	call next_token 
      00962A A1 06            [ 1] 4356 	cp a,#TK_CMD 
      00962C 27 03            [ 1] 4357 	jreq 1$
      00962E CC 87 92         [ 2] 4358 	jp syntax_error
      009631                       4359 1$:  
      009631 A3 96 39         [ 2] 4360 	cpw x,#to 
      009634 27 03            [ 1] 4361 	jreq to
      009636 CC 87 92         [ 2] 4362 	jp syntax_error 
                                   4363 
                                   4364 ;-----------------------------------
                                   4365 ; BASIC: TO expr 
                                   4366 ; second part of FOR loop initilization
                                   4367 ; leave limit on dstack and set 
                                   4368 ; FTO bit in 'flags'
                                   4369 ;-----------------------------------
      009639                       4370 to: ; { var_addr -- var_addr limit step }
      009639 72 04 00 26 03   [ 2] 4371 	btjt flags,#FLOOP,1$
      00963E CC 87 92         [ 2] 4372 	jp syntax_error
      009641 CD 91 2C         [ 4] 4373 1$: call relation  
      009644 A1 04            [ 1] 4374 	cp a,#TK_INTGR 
      009646 27 03            [ 1] 4375 	jreq 2$ 
      009648 CC 87 92         [ 2] 4376 	jp syntax_error
      00964B                       4377 2$: 
      00964B CD 8D E4         [ 4] 4378     call dpush ; limit
      00964E CE 00 01         [ 2] 4379 	ldw x,in.w 
      009651 CD 88 46         [ 4] 4380 	call next_token
      009654 A1 00            [ 1] 4381 	cp a,#TK_NONE  
      009656 27 0C            [ 1] 4382 	jreq 4$ 
      009658 A1 06            [ 1] 4383 	cp a,#TK_CMD
      00965A 26 05            [ 1] 4384 	jrne 3$
      00965C A3 96 6C         [ 2] 4385 	cpw x,#step 
      00965F 27 0B            [ 1] 4386 	jreq step
      009661                       4387 3$:	
      009661 CD 8D DE         [ 4] 4388 	call unget_token   	 
      009664                       4389 4$:	
      009664 AE 00 01         [ 2] 4390 	ldw x,#1   ; default step  
      009667 CD 8D E4         [ 4] 4391 	call dpush
      00966A 20 15            [ 2] 4392 	jra store_loop_addr 
                                   4393 
                                   4394 
                                   4395 ;----------------------------------
                                   4396 ; BASIC: STEP expr 
                                   4397 ; optional third par of FOR loop
                                   4398 ; initialization. 	
                                   4399 ;------------------------------------
      00966C                       4400 step: ; {var limit -- var limit step}
      00966C 72 04 00 26 03   [ 2] 4401 	btjt flags,#FLOOP,1$
      009671 CC 87 92         [ 2] 4402 	jp syntax_error
      009674 CD 91 2C         [ 4] 4403 1$: call relation
      009677 A1 04            [ 1] 4404 	cp a,#TK_INTGR
      009679 27 03            [ 1] 4405 	jreq 2$
      00967B CC 87 92         [ 2] 4406 	jp syntax_error
      00967E CD 8D E4         [ 4] 4407 2$:	call dpush
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4408 ; leave loop back entry point on cstack 
                                   4409 ; cstack is 2 call deep from interp_loop
      009681                       4410 store_loop_addr:
      009681 CE 00 05         [ 2] 4411 	ldw x,basicptr  
      009684 1F 05            [ 2] 4412 	ldw (BPTR,sp),x 
      009686 CE 00 01         [ 2] 4413 	ldw x,in.w 
      009689 1F 03            [ 2] 4414 	ldw (INW,sp),x   
      00968B 72 15 00 26      [ 1] 4415 	bres flags,#FLOOP 
      00968F 72 5C 00 23      [ 1] 4416 	inc loop_depth  
      009693 81               [ 4] 4417 	ret 
                                   4418 
                                   4419 ;--------------------------------
                                   4420 ; BASIC: NEXT var 
                                   4421 ; FOR loop control 
                                   4422 ; increment variable with step 
                                   4423 ; and compare with limit 
                                   4424 ; loop if threshold not crossed.
                                   4425 ; else clean both stacks. 
                                   4426 ; and decrement 'loop_depth' 
                                   4427 ;--------------------------------
      009694                       4428 next: ; {var limit step -- [var limit step ] }
      009694 72 5D 00 23      [ 1] 4429 	tnz loop_depth 
      009698 26 03            [ 1] 4430 	jrne 1$ 
      00969A CC 87 92         [ 2] 4431 	jp syntax_error 
      00969D                       4432 1$: 
      00969D A6 05            [ 1] 4433 	ld a,#TK_VAR 
      00969F CD 8F DB         [ 4] 4434 	call expect
                                   4435 ; check for good variable after NEXT 	 
      0096A2 90 93            [ 1] 4436 	ldw y,x 
      0096A4 AE 00 04         [ 2] 4437 	ldw x,#4  
      0096A7 72 D3 00 1D      [ 4] 4438 	cpw y,([dstkptr],x) ; compare variables address 
      0096AB 27 03            [ 1] 4439 	jreq 2$  
      0096AD CC 87 92         [ 2] 4440 	jp syntax_error ; not the good one 
      0096B0                       4441 2$: ; increment variable 
      0096B0 93               [ 1] 4442 	ldw x,y
      0096B1 FE               [ 2] 4443 	ldw x,(x)  ; get var value 
      0096B2 CF 00 0D         [ 2] 4444 	ldw acc16,x 
      0096B5 72 CE 00 1D      [ 5] 4445 	ldw x,[dstkptr] ; step
      0096B9 72 BB 00 0D      [ 2] 4446 	addw x,acc16 ; var+step 
      0096BD 90 FF            [ 2] 4447 	ldw (y),x ; save var new value 
                                   4448 ; compare with limit 
      0096BF 90 93            [ 1] 4449 	ldw y,x 
      0096C1 72 CE 00 1D      [ 5] 4450 	ldw x,[dstkptr] ; step in x 
      0096C5 5D               [ 2] 4451 	tnzw x  
      0096C6 2A 0B            [ 1] 4452 	jrpl 4$ ; positive step 
                                   4453 ;negative step 
      0096C8 AE 00 02         [ 2] 4454 	ldw x,#2
      0096CB 72 D3 00 1D      [ 4] 4455 	cpw y,([dstkptr],x)
      0096CF 2F 20            [ 1] 4456 	jrslt loop_done
      0096D1 20 09            [ 2] 4457 	jra loop_back 
      0096D3                       4458 4$: ; positive step
      0096D3 AE 00 02         [ 2] 4459 	ldw x,#2 
      0096D6 72 D3 00 1D      [ 4] 4460 	cpw y,([dstkptr],x)
      0096DA 2C 15            [ 1] 4461 	jrsgt loop_done
      0096DC                       4462 loop_back:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0096DC 1E 05            [ 2] 4463 	ldw x,(BPTR,sp)
      0096DE CF 00 05         [ 2] 4464 	ldw basicptr,x 
      0096E1 72 01 00 26 05   [ 2] 4465 	btjf flags,#FRUN,1$ 
      0096E6 E6 02            [ 1] 4466 	ld a,(2,x)
      0096E8 C7 00 04         [ 1] 4467 	ld count,a
      0096EB 1E 03            [ 2] 4468 1$:	ldw x,(INW,sp)
      0096ED CF 00 01         [ 2] 4469 	ldw in.w,x 
      0096F0 81               [ 4] 4470 	ret 
      0096F1                       4471 loop_done:
                                   4472 	; remove var limit step on dstack 
      0096F1 CE 00 1D         [ 2] 4473 	ldw x,dstkptr 
      0096F4 1C 00 06         [ 2] 4474 	addw x,#3*CELL_SIZE
      0096F7 CF 00 1D         [ 2] 4475 	ldw dstkptr,x 
                                   4476 	; remove 2 return address on cstack 
      0096FA 85               [ 2] 4477 	popw x
      00167B                       4478 	_drop 4
      0096FB 5B 04            [ 2]    1     addw sp,#4 
      0096FD 89               [ 2] 4479 	pushw x 
      0096FE 72 5A 00 23      [ 1] 4480 	dec loop_depth 
      009702 81               [ 4] 4481 	ret 
                                   4482 
                                   4483 ;----------------------------
                                   4484 ; called by goto/gosub
                                   4485 ; to get target line number 
                                   4486 ;---------------------------
      009703                       4487 get_target_line:
      009703 CD 91 2C         [ 4] 4488 	call relation 
      009706 A1 04            [ 1] 4489 	cp a,#TK_INTGR
      009708 27 03            [ 1] 4490 	jreq 1$
      00970A CC 87 92         [ 2] 4491 	jp syntax_error
      00970D CD 82 E8         [ 4] 4492 1$:	call search_lineno  
      009710 5D               [ 2] 4493 	tnzw x 
      009711 26 05            [ 1] 4494 	jrne 2$ 
      009713 A6 05            [ 1] 4495 	ld a,#ERR_NO_LINE 
      009715 CC 87 94         [ 2] 4496 	jp tb_error 
      009718 81               [ 4] 4497 2$:	ret 
                                   4498 
                                   4499 ;------------------------
                                   4500 ; BASIC: GOTO line# 
                                   4501 ; jump to line# 
                                   4502 ; here cstack is 2 call deep from interp_loop 
                                   4503 ;------------------------
      009719                       4504 goto:
      009719 72 00 00 26 06   [ 2] 4505 	btjt flags,#FRUN,0$ 
      00971E A6 06            [ 1] 4506 	ld a,#ERR_RUN_ONLY
      009720 CC 87 94         [ 2] 4507 	jp tb_error 
      009723 81               [ 4] 4508 	ret 
      009724 CD 97 03         [ 4] 4509 0$:	call get_target_line
      009727                       4510 jp_to_target:
      009727 CF 00 05         [ 2] 4511 	ldw basicptr,x 
      00972A E6 02            [ 1] 4512 	ld a,(2,x)
      00972C C7 00 04         [ 1] 4513 	ld count,a 
      00972F 35 03 00 02      [ 1] 4514 	mov in,#3 
      009733 81               [ 4] 4515 	ret 
                                   4516 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4517 
                                   4518 ;--------------------
                                   4519 ; BASIC: GOSUB line#
                                   4520 ; basic subroutine call
                                   4521 ; actual line# and basicptr 
                                   4522 ; are saved on cstack
                                   4523 ; here cstack is 2 call deep from interp_loop 
                                   4524 ;--------------------
                           000003  4525 	RET_ADDR=3
                           000005  4526 	RET_INW=5
                           000004  4527 	VSIZE=4  
      009734                       4528 gosub:
      009734 72 00 00 26 06   [ 2] 4529 	btjt flags,#FRUN,0$ 
      009739 A6 06            [ 1] 4530 	ld a,#ERR_RUN_ONLY
      00973B CC 87 94         [ 2] 4531 	jp tb_error 
      00973E 81               [ 4] 4532 	ret 
      00973F 85               [ 2] 4533 0$:	popw x 
      0016C0                       4534 	_vars VSIZE  
      009740 52 04            [ 2]    1     sub sp,#VSIZE 
      009742 89               [ 2] 4535 	pushw x 
      009743 CE 00 05         [ 2] 4536 	ldw x,basicptr
      009746 1F 03            [ 2] 4537 	ldw (RET_ADDR,sp),x 
      009748 CD 97 03         [ 4] 4538 	call get_target_line  
      00974B 89               [ 2] 4539 	pushw x 
      00974C CE 00 01         [ 2] 4540 	ldw x,in.w 
      00974F 1F 07            [ 2] 4541 	ldw (RET_INW+2,sp),x
      009751 85               [ 2] 4542 	popw x 
      009752 20 D3            [ 2] 4543 	jra jp_to_target
                                   4544 
                                   4545 ;------------------------
                                   4546 ; BASIC: RETURN 
                                   4547 ; exit from a subroutine 
                                   4548 ; 
                                   4549 ;------------------------
      009754                       4550 return:
      009754 72 00 00 26 05   [ 2] 4551 	btjt flags,#FRUN,0$ 
      009759 A6 06            [ 1] 4552 	ld a,#ERR_RUN_ONLY
      00975B CC 87 94         [ 2] 4553 	jp tb_error 
      00975E                       4554 0$:	
      00975E 1E 03            [ 2] 4555 	ldw x,(RET_ADDR,sp) 
      009760 CF 00 05         [ 2] 4556 	ldw basicptr,x
      009763 E6 02            [ 1] 4557 	ld a,(2,x)
      009765 C7 00 04         [ 1] 4558 	ld count,a  
      009768 1E 05            [ 2] 4559 	ldw x,(RET_INW,sp)
      00976A CF 00 01         [ 2] 4560 	ldw in.w,x 
      00976D 85               [ 2] 4561 	popw x 
      0016EE                       4562 	_drop VSIZE 
      00976E 5B 04            [ 2]    1     addw sp,#VSIZE 
      009770 89               [ 2] 4563 	pushw x
      009771 81               [ 4] 4564 	ret  
                                   4565 
                                   4566 
                                   4567 ;----------------------------------
                                   4568 ; BASIC: RUN
                                   4569 ; run BASIC program in RAM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4570 ;----------------------------------- 
      009772                       4571 run: 
      009772 72 01 00 26 02   [ 2] 4572 	btjf flags,#FRUN,0$  
      009777 4F               [ 1] 4573 	clr a 
      009778 81               [ 4] 4574 	ret
      009779                       4575 0$: 
      009779 72 09 00 26 12   [ 2] 4576 	btjf flags,#FBREAK,1$
      0016FE                       4577 	_drop 2 
      00977E 5B 02            [ 2]    1     addw sp,#2 
      009780 CD 94 A5         [ 4] 4578 	call rest_context
      001703                       4579 	_drop CTXT_SIZE 
      009783 5B 04            [ 2]    1     addw sp,#CTXT_SIZE 
      009785 72 19 00 26      [ 1] 4580 	bres flags,#FBREAK 
      009789 72 10 00 26      [ 1] 4581 	bset flags,#FRUN 
      00978D CC 88 18         [ 2] 4582 	jp interp_loop 
      009790 CE 00 1F         [ 2] 4583 1$:	ldw x,txtbgn
      009793 C3 00 21         [ 2] 4584 	cpw x,txtend 
      009796 2B 02            [ 1] 4585 	jrmi run_it 
      009798 4F               [ 1] 4586 	clr a 
      009799 81               [ 4] 4587 	ret
                                   4588 
      00979A                       4589 run_it:	 
      00979A CD 91 A7         [ 4] 4590     call ubound 
      00171D                       4591 	_drop 2 ; drop return address 
      00979D 5B 02            [ 2]    1     addw sp,#2 
                                   4592 ; clear data pointer 
      00979F 5F               [ 1] 4593 	clrw x 
      0097A0 CF 00 07         [ 2] 4594 	ldw data_ptr,x 
      0097A3 72 5F 00 09      [ 1] 4595 	clr data_ofs 
      0097A7 72 5F 00 0A      [ 1] 4596 	clr data_len 
                                   4597 ; initialize BASIC pointer 
      0097AB CE 00 1F         [ 2] 4598 	ldw x,txtbgn 
      0097AE CF 00 05         [ 2] 4599 	ldw basicptr,x 
      0097B1 E6 02            [ 1] 4600 	ld a,(2,x)
      0097B3 C7 00 04         [ 1] 4601 	ld count,a
      0097B6 35 03 00 02      [ 1] 4602 	mov in,#3	
      0097BA 72 10 00 26      [ 1] 4603 	bset flags,#FRUN 
      0097BE CC 88 18         [ 2] 4604 	jp interp_loop 
                                   4605 
                                   4606 
                                   4607 ;----------------------
                                   4608 ; BASIC: STOP 
                                   4609 ; stop running program
                                   4610 ;---------------------- 
      0097C1                       4611 stop: 
                                   4612 ; clean dstack and cstack 
      0097C1 AE 17 FF         [ 2] 4613 	ldw x,#STACK_EMPTY 
      0097C4 94               [ 1] 4614 	ldw sp,x 
      0097C5 72 11 00 26      [ 1] 4615 	bres flags,#FRUN 
      0097C9 72 19 00 26      [ 1] 4616 	bres flags,#FBREAK
      0097CD CC 87 D5         [ 2] 4617 	jp warm_start
                                   4618 
                                   4619 
                                   4620 ;-----------------------
                                   4621 ; BASIC: TONE expr1,expr2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4622 ; used TIMER2 channel 1
                                   4623 ; to produce a tone 
                                   4624 ; arguments:
                                   4625 ;    expr1   frequency 
                                   4626 ;    expr2   duration msec.
                                   4627 ;---------------------------
      0097D0                       4628 tone:
      0097D0 CD 8F E8         [ 4] 4629 	call arg_list 
      0097D3 A1 02            [ 1] 4630 	cp a,#2 
      0097D5 27 03            [ 1] 4631 	jreq 1$
      0097D7 CC 87 92         [ 2] 4632 	jp syntax_error 
      0097DA                       4633 1$: 
      0097DA                       4634 beep:
      0097DA CD 8D F1         [ 4] 4635 	call dpop ; duration
      0097DD 89               [ 2] 4636 	pushw x 
      0097DE CD 8D F1         [ 4] 4637 	call dpop ; frequency
      0097E1 90 93            [ 1] 4638 	ldw y,x 
      0097E3 AE F4 24         [ 2] 4639 	ldw x,#TIM2_CLK_FREQ
      0097E6 65               [ 2] 4640 	divw x,y 
                                   4641 ; round to nearest integer 
      0097E7 90 A3 7A 12      [ 2] 4642 	cpw y,#TIM2_CLK_FREQ/2
      0097EB 2B 01            [ 1] 4643 	jrmi 2$
      0097ED 5C               [ 2] 4644 	incw x 
      0097EE                       4645 2$:	 
      0097EE 9E               [ 1] 4646 	ld a,xh 
      0097EF C7 53 0D         [ 1] 4647 	ld TIM2_ARRH,a 
      0097F2 9F               [ 1] 4648 	ld a,xl 
      0097F3 C7 53 0E         [ 1] 4649 	ld TIM2_ARRL,a 
                                   4650 ; 50% duty cycle 
      0097F6 8C               [ 1] 4651 	ccf 
      0097F7 56               [ 2] 4652 	rrcw x 
      0097F8 9E               [ 1] 4653 	ld a,xh 
      0097F9 C7 53 0F         [ 1] 4654 	ld TIM2_CCR1H,a 
      0097FC 9F               [ 1] 4655 	ld a,xl
      0097FD C7 53 10         [ 1] 4656 	ld TIM2_CCR1L,a
      009800 72 10 53 08      [ 1] 4657 	bset TIM2_CCER1,#TIM2_CCER1_CC1E
      009804 72 10 53 00      [ 1] 4658 	bset TIM2_CR1,#TIM2_CR1_CEN
      009808 72 10 53 04      [ 1] 4659 	bset TIM2_EGR,#TIM2_EGR_UG
      00980C 85               [ 2] 4660 	popw x 
      00980D CF 00 11         [ 2] 4661 	ldw timer,x 
      009810 CE 00 11         [ 2] 4662 3$: ldw x,timer 	
      009813 26 FB            [ 1] 4663 	jrne 3$ 
      009815 72 11 53 08      [ 1] 4664 	bres TIM2_CCER1,#TIM2_CCER1_CC1E
      009819 72 11 53 00      [ 1] 4665 	bres TIM2_CR1,#TIM2_CR1_CEN 
      00981D 81               [ 4] 4666 	ret 
                                   4667 
                                   4668 ;-------------------------------
                                   4669 ; BASIC: ADCON 0|1 [,divisor]  
                                   4670 ; disable/enanble ADC 
                                   4671 ;-------------------------------
      00981E                       4672 power_adc:
      00981E CD 8F E8         [ 4] 4673 	call arg_list 
      009821 A1 02            [ 1] 4674 	cp a,#2	
      009823 27 0D            [ 1] 4675 	jreq 1$
      009825 A1 01            [ 1] 4676 	cp a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009827 27 03            [ 1] 4677 	jreq 0$ 
      009829 CC 87 92         [ 2] 4678 	jp syntax_error 
      00982C AE 00 00         [ 2] 4679 0$: ldw x,#0
      00982F CD 8D E4         [ 4] 4680 	call dpush 
      009832 AE 00 02         [ 2] 4681 1$: ldw x,#2
      009835 72 DE 00 1D      [ 5] 4682 	ldw x,([dstkptr],x) ; on|off
      009839 5D               [ 2] 4683 	tnzw x 
      00983A 27 1C            [ 1] 4684 	jreq 2$ 
      00983C 72 CE 00 1D      [ 5] 4685 	ldw x,[dstkptr] ; divisor 
      009840 9F               [ 1] 4686 	ld a,xl
      009841 A4 07            [ 1] 4687 	and a,#7
      009843 4E               [ 1] 4688 	swap a 
      009844 C7 54 01         [ 1] 4689 	ld ADC_CR1,a
      009847 72 16 50 CA      [ 1] 4690 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00984B 72 10 54 01      [ 1] 4691 	bset ADC_CR1,#ADC_CR1_ADON 
      0017CF                       4692 	_usec_dly 7 
      00984F AE 00 1B         [ 2]    1     ldw x,#(16*7-2)/4
      009852 5A               [ 2]    2     decw x
      009853 9D               [ 1]    3     nop 
      009854 26 FA            [ 1]    4     jrne .-4
      009856 20 08            [ 2] 4693 	jra 3$
      009858 72 11 54 01      [ 1] 4694 2$: bres ADC_CR1,#ADC_CR1_ADON
      00985C 72 17 50 CA      [ 1] 4695 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      009860 AE 00 04         [ 2] 4696 3$:	ldw x,#4 ; drop 2 elements on dstack 
      009863 72 BB 00 1D      [ 2] 4697 	addw x,dstkptr
      009867 CF 00 1D         [ 2] 4698 	ldw dstkptr,x 
      00986A 81               [ 4] 4699 	ret
                                   4700 
                                   4701 ;-----------------------------
                                   4702 ; BASIC: ADCREAD (channel)
                                   4703 ; read adc channel {0..5}
                                   4704 ; output:
                                   4705 ;   A 		TK_INTGR 
                                   4706 ;   X 		value 
                                   4707 ;-----------------------------
      00986B                       4708 analog_read:
      00986B CD 90 0C         [ 4] 4709 	call func_args 
      00986E A1 01            [ 1] 4710 	cp a,#1 
      009870 27 03            [ 1] 4711 	jreq 1$
      009872 CC 87 92         [ 2] 4712 	jp syntax_error
      009875 CD 8D F1         [ 4] 4713 1$: call dpop 
      009878 A3 00 05         [ 2] 4714 	cpw x,#5 
      00987B 23 05            [ 2] 4715 	jrule 2$
      00987D A6 0A            [ 1] 4716 	ld a,#ERR_BAD_VALUE
      00987F CC 87 94         [ 2] 4717 	jp tb_error 
      009882 9F               [ 1] 4718 2$: ld a,xl
      009883 C7 00 0E         [ 1] 4719 	ld acc8,a 
      009886 A6 05            [ 1] 4720 	ld a,#5
      009888 C0 00 0E         [ 1] 4721 	sub a,acc8 
      00988B C7 54 00         [ 1] 4722 	ld ADC_CSR,a
      00988E 72 16 54 02      [ 1] 4723 	bset ADC_CR2,#ADC_CR2_ALIGN
      009892 72 10 54 01      [ 1] 4724 	bset ADC_CR1,#ADC_CR1_ADON
      009896 72 0F 54 00 FB   [ 2] 4725 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00989B CE 54 04         [ 2] 4726 	ldw x,ADC_DRH
      00989E A6 04            [ 1] 4727 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0098A0 81               [ 4] 4728 	ret 
                                   4729 
                                   4730 ;-----------------------
                                   4731 ; BASIC: DREAD(pin)
                                   4732 ; Arduino pins 
                                   4733 ; read state of a digital pin 
                                   4734 ; pin# {0..15}
                                   4735 ; output:
                                   4736 ;    A 		TK_INTGR
                                   4737 ;    X      0|1 
                                   4738 ;-------------------------
                           000001  4739 	PINNO=1
                           000001  4740 	VSIZE=1
      0098A1                       4741 digital_read:
      001821                       4742 	_vars VSIZE 
      0098A1 52 01            [ 2]    1     sub sp,#VSIZE 
      0098A3 CD 90 0C         [ 4] 4743 	call func_args
      0098A6 A1 01            [ 1] 4744 	cp a,#1
      0098A8 27 03            [ 1] 4745 	jreq 1$
      0098AA CC 87 92         [ 2] 4746 	jp syntax_error
      0098AD CD 8D F1         [ 4] 4747 1$: call dpop 
      0098B0 A3 00 0F         [ 2] 4748 	cpw x,#15 
      0098B3 23 05            [ 2] 4749 	jrule 2$
      0098B5 A6 0A            [ 1] 4750 	ld a,#ERR_BAD_VALUE
      0098B7 CC 87 94         [ 2] 4751 	jp tb_error 
      0098BA CD 9E B8         [ 4] 4752 2$:	call select_pin 
      0098BD 6B 01            [ 1] 4753 	ld (PINNO,sp),a
      0098BF E6 01            [ 1] 4754 	ld a,(GPIO_IDR,x)
      0098C1 0D 01            [ 1] 4755 	tnz (PINNO,sp)
      0098C3 27 05            [ 1] 4756 	jreq 8$
      0098C5 44               [ 1] 4757 3$: srl a 
      0098C6 0A 01            [ 1] 4758 	dec (PINNO,sp)
      0098C8 26 FB            [ 1] 4759 	jrne 3$ 
      0098CA A4 01            [ 1] 4760 8$: and a,#1 
      0098CC 5F               [ 1] 4761 	clrw x 
      0098CD 97               [ 1] 4762 	ld xl,a 
      0098CE A6 04            [ 1] 4763 	ld a,#TK_INTGR
      001850                       4764 	_drop VSIZE
      0098D0 5B 01            [ 2]    1     addw sp,#VSIZE 
      0098D2 81               [ 4] 4765 	ret
                                   4766 
                                   4767 ;-----------------------
                                   4768 ; BASIC: DWRITE pin,0|1
                                   4769 ; Arduino pins 
                                   4770 ; write to a digital pin 
                                   4771 ; pin# {0..15}
                                   4772 ; output:
                                   4773 ;    A 		TK_INTGR
                                   4774 ;    X      0|1 
                                   4775 ;-------------------------
                           000001  4776 	PINNO=1
                           000002  4777 	PINVAL=2
                           000002  4778 	VSIZE=2
      0098D3                       4779 digital_write:
      001853                       4780 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0098D3 52 02            [ 2]    1     sub sp,#VSIZE 
      0098D5 CD 8F E8         [ 4] 4781 	call arg_list  
      0098D8 A1 02            [ 1] 4782 	cp a,#2 
      0098DA 27 03            [ 1] 4783 	jreq 1$
      0098DC CC 87 92         [ 2] 4784 	jp syntax_error
      0098DF CD 8D F1         [ 4] 4785 1$: call dpop 
      0098E2 9F               [ 1] 4786 	ld a,xl 
      0098E3 6B 02            [ 1] 4787 	ld (PINVAL,sp),a
      0098E5 CD 8D F1         [ 4] 4788 	call dpop
      0098E8 A3 00 0F         [ 2] 4789 	cpw x,#15 
      0098EB 23 05            [ 2] 4790 	jrule 2$
      0098ED A6 0A            [ 1] 4791 	ld a,#ERR_BAD_VALUE
      0098EF CC 87 94         [ 2] 4792 	jp tb_error 
      0098F2 CD 9E B8         [ 4] 4793 2$:	call select_pin 
      0098F5 6B 01            [ 1] 4794 	ld (PINNO,sp),a 
      0098F7 A6 01            [ 1] 4795 	ld a,#1
      0098F9 0D 01            [ 1] 4796 	tnz (PINNO,sp)
      0098FB 27 05            [ 1] 4797 	jreq 4$
      0098FD 48               [ 1] 4798 3$: sll a
      0098FE 0A 01            [ 1] 4799 	dec (PINNO,sp)
      009900 26 FB            [ 1] 4800 	jrne 3$
      009902 0D 02            [ 1] 4801 4$: tnz (PINVAL,sp)
      009904 26 05            [ 1] 4802 	jrne 5$
      009906 43               [ 1] 4803 	cpl a 
      009907 E4 00            [ 1] 4804 	and a,(GPIO_ODR,x)
      009909 20 02            [ 2] 4805 	jra 8$
      00990B EA 00            [ 1] 4806 5$: or a,(GPIO_ODR,x)
      00990D E7 00            [ 1] 4807 8$: ld (GPIO_ODR,x),a 
      00188F                       4808 	_drop VSIZE 
      00990F 5B 02            [ 2]    1     addw sp,#VSIZE 
      009911 81               [ 4] 4809 	ret
                                   4810 
                                   4811 
                                   4812 ;-----------------------
                                   4813 ; BASIC: BREAK 
                                   4814 ; insert a breakpoint 
                                   4815 ; in pogram. 
                                   4816 ; the program is resumed
                                   4817 ; with RUN 
                                   4818 ;-------------------------
      009912                       4819 break:
      009912 72 00 00 26 02   [ 2] 4820 	btjt flags,#FRUN,2$
      009917 4F               [ 1] 4821 	clr a
      009918 81               [ 4] 4822 	ret 
      009919                       4823 2$:	 
                                   4824 ; create space on cstack to save context 
      009919 AE 99 40         [ 2] 4825 	ldw x,#break_point 
      00991C CD 82 46         [ 4] 4826 	call puts 
      00189F                       4827 	_drop 2 ;drop return address 
      00991F 5B 02            [ 2]    1     addw sp,#2 
      0018A1                       4828 	_vars CTXT_SIZE ; context size 
      009921 52 04            [ 2]    1     sub sp,#CTXT_SIZE 
      009923 CD 94 95         [ 4] 4829 	call save_context 
      009926 AE 16 E8         [ 2] 4830 	ldw x,#tib 
      009929 CF 00 05         [ 2] 4831 	ldw basicptr,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      00992C 7F               [ 1] 4832 	clr (x)
      00992D 72 5F 00 04      [ 1] 4833 	clr count  
      009931 5F               [ 1] 4834 	clrw x 
      009932 CF 00 01         [ 2] 4835 	ldw in.w,x
      009935 72 11 00 26      [ 1] 4836 	bres flags,#FRUN 
      009939 72 18 00 26      [ 1] 4837 	bset flags,#FBREAK
      00993D CC 88 18         [ 2] 4838 	jp interp_loop 
      009940 0A 62 72 65 61 6B 20  4839 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4840 
                                   4841 ;-----------------------
                                   4842 ; BASIC: NEW
                                   4843 ; from command line only 
                                   4844 ; free program memory
                                   4845 ; and clear variables 
                                   4846 ;------------------------
      00995E                       4847 new: 
      00995E 72 01 00 26 02   [ 2] 4848 	btjf flags,#FRUN,0$ 
      009963 4F               [ 1] 4849 	clr a 
      009964 81               [ 4] 4850 	ret 
      009965                       4851 0$:	
      009965 CD 86 5C         [ 4] 4852 	call clear_basic 
      009968 81               [ 4] 4853 	ret 
                                   4854 	 
                                   4855 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4856 ;  file system routines
                                   4857 ;  MCU flash memory from
                                   4858 ;  0x10000-0x27fff is 
                                   4859 ;  used to store BASIC 
                                   4860 ;  program files. 
                                   4861 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4862 
                                   4863 ;--------------------
                                   4864 ; input:
                                   4865 ;   X     increment 
                                   4866 ; output:
                                   4867 ;   farptr  incremented 
                                   4868 ;---------------------
      009969                       4869 incr_farptr:
      009969 72 BB 00 18      [ 2] 4870 	addw x,farptr+1 
      00996D 24 04            [ 1] 4871 	jrnc 1$
      00996F 72 5C 00 17      [ 1] 4872 	inc farptr 
      009973 CF 00 18         [ 2] 4873 1$:	ldw farptr+1,x  
      009976 81               [ 4] 4874 	ret 
                                   4875 
                                   4876 ;------------------------------
                                   4877 ; extended flash memory used as FLASH_DRIVE 
                                   4878 ; seek end of used flash drive   
                                   4879 ; starting at 0x10000 address.
                                   4880 ; 4 consecutives 0 bytes signal free space. 
                                   4881 ; input:
                                   4882 ;	none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                   4883 ; output:
                                   4884 ;   ffree     free_addr| 0 if memory full.
                                   4885 ;------------------------------
      009977                       4886 seek_fdrive:
                                   4887 ; start scan at 0x10000 address 
      009977 A6 01            [ 1] 4888 	ld a,#1
      009979 C7 00 17         [ 1] 4889 	ld farptr,a 
      00997C 5F               [ 1] 4890 	clrw x 
      00997D CF 00 18         [ 2] 4891 	ldw farptr+1,x 
      009980                       4892 1$:
      009980 AE 00 03         [ 2] 4893 	ldw x,#3  
      009983 92 AF 00 17      [ 5] 4894 2$:	ldf a,([farptr],x) 
      009987 26 05            [ 1] 4895 	jrne 3$
      009989 5A               [ 2] 4896 	decw x
      00998A 2A F7            [ 1] 4897 	jrpl 2$
      00998C 20 19            [ 2] 4898 	jra 4$ 
      00998E 5C               [ 2] 4899 3$:	incw x 
      00998F CD 99 69         [ 4] 4900 	call incr_farptr
      009992 AE 02 7F         [ 2] 4901 	ldw x,#0x27f 
      009995 C3 00 17         [ 2] 4902 	cpw x,farptr
      009998 2A E6            [ 1] 4903 	jrpl 1$
                                   4904 ; drive full 
      00999A 72 5F 00 1A      [ 1] 4905 	clr ffree 
      00999E 72 5F 00 1B      [ 1] 4906 	clr ffree+1 
      0099A2 72 5F 00 1C      [ 1] 4907 	clr ffree+2 
      0099A6 81               [ 4] 4908 	ret
      0099A7                       4909 4$: ; copy farptr to ffree	 
      0099A7 CE 00 17         [ 2] 4910 	ldw x,farptr 
      0099AA C6 00 19         [ 1] 4911 	ld a,farptr+2 
      0099AD CF 00 1A         [ 2] 4912 	ldw ffree,x 
      0099B0 C7 00 1C         [ 1] 4913 	ld ffree+2,a  
      0099B3 81               [ 4] 4914 	ret 
                                   4915 
                                   4916 ;-----------------------
                                   4917 ; compare file name 
                                   4918 ; with name pointed by Y  
                                   4919 ; input:
                                   4920 ;   farptr   file name 
                                   4921 ;   Y        target name 
                                   4922 ; output:
                                   4923 ;   farptr 	 at file_name
                                   4924 ;   X 		 farptr[x] point at size field  
                                   4925 ;   Carry    0|1 no match|match  
                                   4926 ;----------------------
      0099B4                       4927 cmp_name:
      0099B4 5F               [ 1] 4928 	clrw x
      0099B5 92 AF 00 17      [ 5] 4929 1$:	ldf a,([farptr],x)
      0099B9 90 F1            [ 1] 4930 	cp a,(y)
      0099BB 26 08            [ 1] 4931 	jrne 4$
      0099BD 4D               [ 1] 4932 	tnz a 
      0099BE 27 12            [ 1] 4933 	jreq 9$ 
      0099C0 5C               [ 2] 4934     incw x 
      0099C1 90 5C            [ 2] 4935 	incw y 
      0099C3 20 F0            [ 2] 4936 	jra 1$
      0099C5                       4937 4$: ;no match 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      0099C5 4D               [ 1] 4938 	tnz a 
      0099C6 27 07            [ 1] 4939 	jreq 5$
      0099C8 5C               [ 2] 4940 	incw x 
      0099C9 92 AF 00 17      [ 5] 4941 	ldf a,([farptr],x)
      0099CD 20 F6            [ 2] 4942 	jra 4$  
      0099CF 5C               [ 2] 4943 5$:	incw x ; farptr[x] point at 'size' field 
      0099D0 98               [ 1] 4944 	rcf 
      0099D1 81               [ 4] 4945 	ret
      0099D2                       4946 9$: ; match  
      0099D2 5C               [ 2] 4947 	incw x  ; farptr[x] at 'size' field 
      0099D3 99               [ 1] 4948 	scf 
      0099D4 81               [ 4] 4949 	ret 
                                   4950 
                                   4951 ;-----------------------
                                   4952 ; search file in 
                                   4953 ; flash memory 
                                   4954 ; input:
                                   4955 ;   Y       file name  
                                   4956 ; output:
                                   4957 ;   farptr  addr at name|0
                                   4958 ;-----------------------
                           000001  4959 	FSIZE=1
                           000003  4960 	YSAVE=3
                           000004  4961 	VSIZE=4 
      0099D5                       4962 search_file: 
      001955                       4963 	_vars VSIZE
      0099D5 52 04            [ 2]    1     sub sp,#VSIZE 
      0099D7 17 03            [ 2] 4964 	ldw (YSAVE,sp),y  
      0099D9 5F               [ 1] 4965 	clrw x 
      0099DA CF 00 18         [ 2] 4966 	ldw farptr+1,x 
      0099DD 35 01 00 17      [ 1] 4967 	mov farptr,#1
      0099E1                       4968 1$:	
                                   4969 ; check if farptr is after any file 
                                   4970 ; if  0 then so.
      0099E1 92 BC 00 17      [ 5] 4971 	ldf a,[farptr]
      0099E5 27 25            [ 1] 4972 	jreq 6$
      0099E7 5F               [ 1] 4973 2$: clrw x 	
      0099E8 16 03            [ 2] 4974 	ldw y,(YSAVE,sp) 
      0099EA CD 99 B4         [ 4] 4975 	call cmp_name
      0099ED 25 2D            [ 1] 4976 	jrc 9$
      0099EF 92 AF 00 17      [ 5] 4977 	ldf a,([farptr],x)
      0099F3 6B 01            [ 1] 4978 	ld (FSIZE,sp),a 
      0099F5 5C               [ 2] 4979 	incw x 
      0099F6 92 AF 00 17      [ 5] 4980 	ldf a,([farptr],x)
      0099FA 6B 02            [ 1] 4981 	ld (FSIZE+1,sp),a 
      0099FC 5C               [ 2] 4982 	incw x 
      0099FD 72 FB 01         [ 2] 4983 	addw x,(FSIZE,sp) ; count to skip 
      009A00 5C               [ 2] 4984 	incw x ; skip over EOF marker 
      009A01 CD 99 69         [ 4] 4985 	call incr_farptr ; now at next file 'name_field'
      009A04 AE 02 80         [ 2] 4986 	ldw x,#0x280
      009A07 C3 00 17         [ 2] 4987 	cpw x,farptr 
      009A0A 2A D5            [ 1] 4988 	jrpl 1$
      009A0C                       4989 6$: ; file not found 
      009A0C 72 5F 00 17      [ 1] 4990 	clr farptr
      009A10 72 5F 00 18      [ 1] 4991 	clr farptr+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009A14 72 5F 00 19      [ 1] 4992 	clr farptr+2 
      001998                       4993 	_drop VSIZE 
      009A18 5B 04            [ 2]    1     addw sp,#VSIZE 
      009A1A 98               [ 1] 4994 	rcf
      009A1B 81               [ 4] 4995 	ret
      009A1C                       4996 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      00199C                       4997 	_drop VSIZE 
      009A1C 5B 04            [ 2]    1     addw sp,#VSIZE 
      009A1E 99               [ 1] 4998 	scf 	
      009A1F 81               [ 4] 4999 	ret
                                   5000 
                                   5001 ;--------------------------------
                                   5002 ; BASIC: SAVE "name" 
                                   5003 ; save text program in 
                                   5004 ; flash memory used as 
                                   5005 ;--------------------------------
                           000001  5006 	BSIZE=1
                           000003  5007 	NAMEPTR=3
                           000004  5008 	VSIZE=4
      009A20                       5009 save:
      009A20 72 01 00 26 05   [ 2] 5010 	btjf flags,#FRUN,0$ 
      009A25 A6 07            [ 1] 5011 	ld a,#ERR_CMD_ONLY 
      009A27 CC 87 94         [ 2] 5012 	jp tb_error
      009A2A                       5013 0$:	 
      009A2A CE 00 21         [ 2] 5014 	ldw x,txtend 
      009A2D 72 B0 00 1F      [ 2] 5015 	subw x,txtbgn
      009A31 26 01            [ 1] 5016 	jrne 1$
                                   5017 ; nothing to save 
      009A33 81               [ 4] 5018 	ret 
      009A34                       5019 1$:	
      0019B4                       5020 	_vars VSIZE 
      009A34 52 04            [ 2]    1     sub sp,#VSIZE 
      009A36 1F 01            [ 2] 5021 	ldw (BSIZE,sp),x 
      009A38 CD 88 46         [ 4] 5022 	call next_token	
      009A3B A1 0A            [ 1] 5023 	cp a,#TK_QSTR
      009A3D 27 03            [ 1] 5024 	jreq 2$
      009A3F CC 87 92         [ 2] 5025 	jp syntax_error
      009A42                       5026 2$: 
      009A42 90 CE 00 05      [ 2] 5027 	ldw y,basicptr 
      009A46 72 B9 00 01      [ 2] 5028 	addw y,in.w
      009A4A 17 03            [ 2] 5029 	ldw (NAMEPTR,sp),y  
      009A4C 55 00 04 00 02   [ 1] 5030 	mov in,count 
                                   5031 ; check if enough free space 
      009A51 93               [ 1] 5032 	ldw x,y 
      009A52 CD 82 7A         [ 4] 5033 	call strlen 
      009A55 1C 00 03         [ 2] 5034 	addw x,#3 
      009A58 72 FB 01         [ 2] 5035 	addw x,(BSIZE,sp)
      009A5B 72 5D 00 1A      [ 1] 5036 	tnz ffree 
      009A5F 26 0B            [ 1] 5037 	jrne 21$
      009A61 72 B0 00 1B      [ 2] 5038 	subw x,ffree+1 
      009A65 23 05            [ 2] 5039 	jrule 21$
      009A67 A6 01            [ 1] 5040 	ld a,#ERR_MEM_FULL 
      009A69 CC 87 94         [ 2] 5041 	jp tb_error
      009A6C                       5042 21$: 
                                   5043 ; check for existing file of that name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A6C 16 03            [ 2] 5044 	ldw y,(NAMEPTR,sp)	
      009A6E CD 99 D5         [ 4] 5045 	call search_file 
      009A71 24 05            [ 1] 5046 	jrnc 3$ 
      009A73 A6 08            [ 1] 5047 	ld a,#ERR_DUPLICATE 
      009A75 CC 87 94         [ 2] 5048 	jp tb_error 
      009A78                       5049 3$:	;** write file name to flash **
      009A78 CE 00 1A         [ 2] 5050 	ldw x,ffree 
      009A7B C6 00 1C         [ 1] 5051 	ld a,ffree+2 
      009A7E CF 00 17         [ 2] 5052 	ldw farptr,x 
      009A81 C7 00 19         [ 1] 5053 	ld farptr+2,a 
      009A84 1E 03            [ 2] 5054 	ldw x,(NAMEPTR,sp)  
      009A86 CD 82 7A         [ 4] 5055 	call strlen 
      009A89 5C               [ 2] 5056 	incw  x
      009A8A 1F 01            [ 2] 5057 	ldw (BSIZE,sp),x  
      009A8C 5F               [ 1] 5058 	clrw x   
      009A8D 16 03            [ 2] 5059 	ldw y,(NAMEPTR,sp)
      009A8F CD 81 D5         [ 4] 5060 	call write_block  
                                   5061 ;** write file length after name **
      009A92 CE 00 21         [ 2] 5062 	ldw x,txtend 
      009A95 72 B0 00 1F      [ 2] 5063 	subw x,txtbgn
      009A99 1F 01            [ 2] 5064 	ldw (BSIZE,sp),x 
      009A9B 5F               [ 1] 5065 	clrw x 
      009A9C 7B 01            [ 1] 5066 	ld a,(1,sp)
      009A9E CD 81 60         [ 4] 5067 	call write_byte 
      009AA1 5C               [ 2] 5068 	incw x 
      009AA2 7B 02            [ 1] 5069 	ld a,(2,sp)
      009AA4 CD 81 60         [ 4] 5070 	call write_byte
      009AA7 5C               [ 2] 5071 	incw x  
      009AA8 CD 99 69         [ 4] 5072 	call incr_farptr ; move farptr after SIZE field 
                                   5073 ;** write BASIC text **
                                   5074 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009AAB 1E 01            [ 2] 5075 	ldw x,(BSIZE,sp)
      009AAD 89               [ 2] 5076 	pushw x ; write_block argument 
      009AAE 5F               [ 1] 5077 	clrw x 
      009AAF 90 CE 00 1F      [ 2] 5078 	ldw y,txtbgn  ; BASIC text to save 
      009AB3 CD 81 D5         [ 4] 5079 	call write_block 
      001A36                       5080 	_drop 2 ;  drop write_block argument  
      009AB6 5B 02            [ 2]    1     addw sp,#2 
                                   5081 ; write en end of file marker 
      009AB8 AE 00 01         [ 2] 5082 	ldw x,#1
      009ABB A6 FF            [ 1] 5083 	ld a,#EOF  
      009ABD CD 81 60         [ 4] 5084 	call write_byte 
      009AC0 CD 99 69         [ 4] 5085 	call incr_farptr
                                   5086 ; save farptr in ffree
      009AC3 CE 00 17         [ 2] 5087 	ldw x,farptr 
      009AC6 C6 00 19         [ 1] 5088 	ld a,farptr+2 
      009AC9 CF 00 1A         [ 2] 5089 	ldw ffree,x 
      009ACC C7 00 1C         [ 1] 5090 	ld ffree+2,a
                                   5091 ;write 4 zero bytes as an end of all files marker 
      009ACF 5F               [ 1] 5092     clrw x 
      009AD0 4B 04            [ 1] 5093 	push #4 
      009AD2                       5094 4$:
      009AD2 4F               [ 1] 5095 	clr a 
      009AD3 CD 81 60         [ 4] 5096 	call write_byte 
      009AD6 5C               [ 2] 5097 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009AD7 0A 01            [ 1] 5098 	dec (1,sp)
      009AD9 26 F7            [ 1] 5099 	jrne 4$
      009ADB 84               [ 1] 5100 5$: pop a 
                                   5101 ; display saved size  
      009ADC 1E 01            [ 2] 5102 	ldw x,(BSIZE,sp) 
      009ADE CD 88 E3         [ 4] 5103 	call print_int 
      001A61                       5104 	_drop VSIZE 
      009AE1 5B 04            [ 2]    1     addw sp,#VSIZE 
      009AE3 81               [ 4] 5105 	ret 
                                   5106 
                                   5107 ;----------------------
                                   5108 ; load file in RAM memory
                                   5109 ; input:
                                   5110 ;    farptr point at file size 
                                   5111 ; output:
                                   5112 ;   y point after BASIC program in RAM.
                                   5113 ;------------------------
      009AE4                       5114 load_file:
      009AE4 CD 99 69         [ 4] 5115 	call incr_farptr  
      009AE7 CD 86 5C         [ 4] 5116 	call clear_basic  
      009AEA 5F               [ 1] 5117 	clrw x
      009AEB 92 AF 00 17      [ 5] 5118 	ldf a,([farptr],x)
      009AEF 90 95            [ 1] 5119 	ld yh,a 
      009AF1 5C               [ 2] 5120 	incw x  
      009AF2 92 AF 00 17      [ 5] 5121 	ldf a,([farptr],x)
      009AF6 5C               [ 2] 5122 	incw x 
      009AF7 90 97            [ 1] 5123 	ld yl,a 
      009AF9 72 B9 00 1F      [ 2] 5124 	addw y,txtbgn
      009AFD 90 CF 00 21      [ 2] 5125 	ldw txtend,y
      009B01 90 CE 00 1F      [ 2] 5126 	ldw y,txtbgn
      009B05                       5127 3$:	; load BASIC text 	
      009B05 92 AF 00 17      [ 5] 5128 	ldf a,([farptr],x)
      009B09 90 F7            [ 1] 5129 	ld (y),a 
      009B0B 5C               [ 2] 5130 	incw x 
      009B0C 90 5C            [ 2] 5131 	incw y 
      009B0E 90 C3 00 21      [ 2] 5132 	cpw y,txtend 
      009B12 2B F1            [ 1] 5133 	jrmi 3$
      009B14 81               [ 4] 5134 	ret 
                                   5135 
                                   5136 ;------------------------
                                   5137 ; BASIC: LOAD "file" 
                                   5138 ; load file to RAM 
                                   5139 ; for execution 
                                   5140 ;------------------------
      009B15                       5141 load:
      009B15 72 01 00 26 07   [ 2] 5142 	btjf flags,#FRUN,0$ 
      009B1A 27 05            [ 1] 5143 	jreq 0$ 
      009B1C A6 07            [ 1] 5144 	ld a,#ERR_CMD_ONLY 
      009B1E CC 87 94         [ 2] 5145 	jp tb_error 
      009B21                       5146 0$:	
      009B21 CD 88 46         [ 4] 5147 	call next_token 
      009B24 A1 0A            [ 1] 5148 	cp a,#TK_QSTR
      009B26 27 03            [ 1] 5149 	jreq 1$
      009B28 CC 87 92         [ 2] 5150 	jp syntax_error 
      009B2B                       5151 1$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009B2B 90 CE 00 05      [ 2] 5152 	ldw y,basicptr
      009B2F 72 B9 00 01      [ 2] 5153 	addw y,in.w 
      009B33 55 00 04 00 02   [ 1] 5154 	mov in,count 
      009B38 CD 99 D5         [ 4] 5155 	call search_file 
      009B3B 25 05            [ 1] 5156 	jrc 2$ 
      009B3D A6 09            [ 1] 5157 	ld a,#ERR_NOT_FILE
      009B3F CC 87 94         [ 2] 5158 	jp tb_error  
      009B42                       5159 2$:
      009B42 CD 9A E4         [ 4] 5160 	call load_file
                                   5161 ; print loaded size 	 
      009B45 CE 00 21         [ 2] 5162 	ldw x,txtend 
      009B48 72 B0 00 1F      [ 2] 5163 	subw x,txtbgn
      009B4C CD 88 E3         [ 4] 5164 	call print_int 
      009B4F 81               [ 4] 5165 	ret 
                                   5166 
                                   5167 ;-----------------------------------
                                   5168 ; BASIC: FORGET ["file_name"] 
                                   5169 ; erase file_name and all others 
                                   5170 ; after it. 
                                   5171 ; without argument erase all files 
                                   5172 ;-----------------------------------
      009B50                       5173 forget:
      009B50 CD 88 46         [ 4] 5174 	call next_token 
      009B53 A1 00            [ 1] 5175 	cp a,#TK_NONE 
      009B55 27 26            [ 1] 5176 	jreq 3$ 
      009B57 A1 0A            [ 1] 5177 	cp a,#TK_QSTR
      009B59 27 03            [ 1] 5178 	jreq 1$
      009B5B CC 87 92         [ 2] 5179 	jp syntax_error
      009B5E 90 CE 00 05      [ 2] 5180 1$: ldw y,basicptr
      009B62 72 B9 00 01      [ 2] 5181 	addw y,in.w
      009B66 55 00 04 00 02   [ 1] 5182 	mov in,count 
      009B6B CD 99 D5         [ 4] 5183 	call search_file
      009B6E 25 05            [ 1] 5184 	jrc 2$
      009B70 A6 09            [ 1] 5185 	ld a,#ERR_NOT_FILE 
      009B72 CC 87 94         [ 2] 5186 	jp tb_error 
      009B75                       5187 2$: 
      009B75 CE 00 17         [ 2] 5188 	ldw x,farptr
      009B78 C6 00 19         [ 1] 5189 	ld a,farptr+2
      009B7B 20 0A            [ 2] 5190 	jra 4$ 
      009B7D                       5191 3$: ; forget all files 
      009B7D AE 01 00         [ 2] 5192 	ldw x,#0x100
      009B80 4F               [ 1] 5193 	clr a 
      009B81 CF 00 17         [ 2] 5194 	ldw farptr,x 
      009B84 C7 00 19         [ 1] 5195 	ld farptr+2,a 
      009B87                       5196 4$:
      009B87 CF 00 1A         [ 2] 5197 	ldw ffree,x 
      009B8A C7 00 1C         [ 1] 5198 	ld ffree+2,a 
      009B8D 4B 04            [ 1] 5199 	push #4
      009B8F 5F               [ 1] 5200 	clrw x 
      009B90                       5201 5$: 
      009B90 4F               [ 1] 5202 	clr a  
      009B91 CD 81 60         [ 4] 5203 	call write_byte 
      009B94 5C               [ 2] 5204 	incw x 
      009B95 0A 01            [ 1] 5205 	dec (1,sp)
      009B97 26 F7            [ 1] 5206 	jrne 5$	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009B99 84               [ 1] 5207 6$: pop a 
      009B9A 81               [ 4] 5208 	ret 
                                   5209 
                                   5210 ;----------------------
                                   5211 ; BASIC: DIR 
                                   5212 ; list saved files 
                                   5213 ;----------------------
                           000001  5214 	COUNT=1 ; files counter 
                           000002  5215 	VSIZE=2 
      009B9B                       5216 directory:
      001B1B                       5217 	_vars VSIZE 
      009B9B 52 02            [ 2]    1     sub sp,#VSIZE 
      009B9D 5F               [ 1] 5218 	clrw x 
      009B9E 1F 01            [ 2] 5219 	ldw (COUNT,sp),x 
      009BA0 CF 00 18         [ 2] 5220 	ldw farptr+1,x 
      009BA3 35 01 00 17      [ 1] 5221 	mov farptr,#1 
      009BA7                       5222 dir_loop:
      009BA7 5F               [ 1] 5223 	clrw x 
      009BA8 92 AF 00 17      [ 5] 5224 	ldf a,([farptr],x)
      009BAC 27 39            [ 1] 5225 	jreq 8$ 
      009BAE                       5226 1$: ;name loop 	
      009BAE 92 AF 00 17      [ 5] 5227 	ldf a,([farptr],x)
      009BB2 27 06            [ 1] 5228 	jreq 2$ 
      009BB4 CD 82 33         [ 4] 5229 	call putc 
      009BB7 5C               [ 2] 5230 	incw x 
      009BB8 20 F4            [ 2] 5231 	jra 1$
      009BBA 5C               [ 2] 5232 2$: incw x ; skip ending 0. 
      009BBB A6 20            [ 1] 5233 	ld a,#SPACE 
      009BBD CD 82 33         [ 4] 5234 	call putc 
                                   5235 ; get file size 	
      009BC0 92 AF 00 17      [ 5] 5236 	ldf a,([farptr],x)
      009BC4 90 95            [ 1] 5237 	ld yh,a 
      009BC6 5C               [ 2] 5238 	incw x 
      009BC7 92 AF 00 17      [ 5] 5239 	ldf a,([farptr],x)
      009BCB 5C               [ 2] 5240 	incw x 
      009BCC 90 97            [ 1] 5241 	ld yl,a 
      009BCE 90 89            [ 2] 5242 	pushw y 
      009BD0 72 FB 01         [ 2] 5243 	addw x,(1,sp)
      009BD3 5C               [ 2] 5244 	incw x ; skip EOF marker 
                                   5245 ; skip to next file 
      009BD4 CD 99 69         [ 4] 5246 	call incr_farptr 
                                   5247 ; print file size 
      009BD7 85               [ 2] 5248 	popw x ; file size 
      009BD8 CD 88 E3         [ 4] 5249 	call print_int 
      009BDB A6 0D            [ 1] 5250 	ld a,#CR 
      009BDD CD 82 33         [ 4] 5251 	call putc
      009BE0 1E 01            [ 2] 5252 	ldw x,(COUNT,sp)
      009BE2 5C               [ 2] 5253 	incw x
      009BE3 1F 01            [ 2] 5254 	ldw (COUNT,sp),x  
      009BE5 20 C0            [ 2] 5255 	jra dir_loop 
      009BE7                       5256 8$: ; print number of files 
      009BE7 1E 01            [ 2] 5257 	ldw x,(COUNT,sp)
      009BE9 CD 88 E3         [ 4] 5258 	call print_int 
      009BEC AE 9C 1C         [ 2] 5259 	ldw x,#file_count 
      009BEF CD 82 46         [ 4] 5260 	call puts  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5261 ; print drive free space 	
      009BF2 A6 FF            [ 1] 5262 	ld a,#0xff 
      009BF4 C0 00 1C         [ 1] 5263 	sub a,ffree+2 
      009BF7 C7 00 0E         [ 1] 5264 	ld acc8,a 
      009BFA A6 7F            [ 1] 5265 	ld a,#0x7f 
      009BFC C2 00 1B         [ 1] 5266 	sbc a,ffree+1 
      009BFF C7 00 0D         [ 1] 5267 	ld acc16,a 
      009C02 A6 02            [ 1] 5268 	ld a,#2 
      009C04 C2 00 1A         [ 1] 5269 	sbc a,ffree 
      009C07 C7 00 0C         [ 1] 5270 	ld acc24,a 
      009C0A 5F               [ 1] 5271 	clrw x  
      009C0B A6 06            [ 1] 5272 	ld a,#6 
      009C0D 97               [ 1] 5273 	ld xl,a 
      009C0E A6 0A            [ 1] 5274 	ld a,#10 
      009C10 CD 88 9B         [ 4] 5275 	call prti24 
      009C13 AE 9C 24         [ 2] 5276 	ldw x,#drive_free
      009C16 CD 82 46         [ 4] 5277 	call puts 
      001B99                       5278 	_drop VSIZE 
      009C19 5B 02            [ 2]    1     addw sp,#VSIZE 
      009C1B 81               [ 4] 5279 	ret
      009C1C 20 66 69 6C 65 73 0A  5280 file_count: .asciz " files\n"
             00
      009C24 20 62 79 74 65 73 20  5281 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5282 
                                   5283 ;---------------------
                                   5284 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5285 ; write 1 or more byte to FLASH or EEPROM
                                   5286 ; starting at address  
                                   5287 ; input:
                                   5288 ;   expr1  	is address 
                                   5289 ;   expr2,...,exprn   are bytes to write
                                   5290 ; output:
                                   5291 ;   none 
                                   5292 ;---------------------
                           000001  5293 	ADDR=1
                           000002  5294 	VSIZ=2 
      009C31                       5295 write:
      001BB1                       5296 	_vars VSIZE 
      009C31 52 02            [ 2]    1     sub sp,#VSIZE 
      009C33 72 5F 00 17      [ 1] 5297 	clr farptr ; expect 16 bits address 
      009C37 CD 90 E8         [ 4] 5298 	call expression
      009C3A A1 04            [ 1] 5299 	cp a,#TK_INTGR 
      009C3C 27 03            [ 1] 5300 	jreq 0$
      009C3E CC 87 92         [ 2] 5301 	jp syntax_error
      009C41 1F 01            [ 2] 5302 0$: ldw (ADDR,sp),x 
      009C43 CD 88 46         [ 4] 5303 	call next_token 
      009C46 A1 0D            [ 1] 5304 	cp a,#TK_COMMA 
      009C48 27 02            [ 1] 5305 	jreq 1$ 
      009C4A 20 19            [ 2] 5306 	jra 9$ 
      009C4C CD 90 E8         [ 4] 5307 1$:	call expression
      009C4F A1 04            [ 1] 5308 	cp a,#TK_INTGR
      009C51 27 03            [ 1] 5309 	jreq 2$
      009C53 CC 87 92         [ 2] 5310 	jp syntax_error
      009C56 9F               [ 1] 5311 2$:	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009C57 1E 01            [ 2] 5312 	ldw x,(ADDR,sp) 
      009C59 CF 00 18         [ 2] 5313 	ldw farptr+1,x 
      009C5C 5F               [ 1] 5314 	clrw x 
      009C5D CD 81 60         [ 4] 5315 	call write_byte
      009C60 1E 01            [ 2] 5316 	ldw x,(ADDR,sp)
      009C62 5C               [ 2] 5317 	incw x 
      009C63 20 DC            [ 2] 5318 	jra 0$ 
      009C65                       5319 9$:
      001BE5                       5320 	_drop VSIZE
      009C65 5B 02            [ 2]    1     addw sp,#VSIZE 
      009C67 81               [ 4] 5321 	ret 
                                   5322 
                                   5323 
                                   5324 ;---------------------
                                   5325 ;BASIC: CHAR(expr)
                                   5326 ; évaluate expression 
                                   5327 ; and take the 7 least 
                                   5328 ; bits as ASCII character
                                   5329 ;---------------------
      009C68                       5330 char:
      009C68 CD 90 0C         [ 4] 5331 	call func_args 
      009C6B A1 01            [ 1] 5332 	cp a,#1
      009C6D 27 03            [ 1] 5333 	jreq 1$
      009C6F CC 87 92         [ 2] 5334 	jp syntax_error
      009C72 CD 8D F1         [ 4] 5335 1$:	call dpop 
      009C75 9F               [ 1] 5336 	ld a,xl 
      009C76 A4 7F            [ 1] 5337 	and a,#0x7f 
      009C78 97               [ 1] 5338 	ld xl,a
      009C79 A6 03            [ 1] 5339 	ld a,#TK_CHAR
      009C7B 81               [ 4] 5340 	ret
                                   5341 
                                   5342 ;---------------------
                                   5343 ; BASIC: ASC(string|char)
                                   5344 ; extract first character 
                                   5345 ; of string argument 
                                   5346 ; return it as TK_INTGR 
                                   5347 ;---------------------
      009C7C                       5348 ascii:
      009C7C A6 0B            [ 1] 5349 	ld a,#TK_LPAREN
      009C7E CD 8F DB         [ 4] 5350 	call expect 
      009C81 CD 88 46         [ 4] 5351 	call next_token 
      009C84 A1 0A            [ 1] 5352 	cp a,#TK_QSTR 
      009C86 27 07            [ 1] 5353 	jreq 1$
      009C88 A1 03            [ 1] 5354 	cp a,#TK_CHAR 
      009C8A 27 06            [ 1] 5355 	jreq 2$ 
      009C8C CC 87 92         [ 2] 5356 	jp syntax_error
      009C8F                       5357 1$: 
      009C8F F6               [ 1] 5358 	ld a,(x) 
      009C90 5F               [ 1] 5359 	clrw x
      009C91 97               [ 1] 5360 	ld xl,a 
      009C92                       5361 2$: 
      009C92 89               [ 2] 5362 	pushw x 
      009C93 A6 0C            [ 1] 5363 	ld a,#TK_RPAREN 
      009C95 CD 8F DB         [ 4] 5364 	call expect
      009C98 85               [ 2] 5365 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009C99 A6 04            [ 1] 5366 	ld a,#TK_INTGR 
      009C9B 81               [ 4] 5367 	ret 
                                   5368 
                                   5369 ;---------------------
                                   5370 ;BASIC: KEY
                                   5371 ; wait for a character 
                                   5372 ; received from STDIN 
                                   5373 ; input:
                                   5374 ;	none 
                                   5375 ; output:
                                   5376 ;	X 		ASCII character 
                                   5377 ;---------------------
      009C9C                       5378 key:
      009C9C CD 82 3C         [ 4] 5379 	call getc 
      009C9F 5F               [ 1] 5380 	clrw x 
      009CA0 97               [ 1] 5381 	ld xl,a 
      009CA1 A6 04            [ 1] 5382 	ld a,#TK_INTGR
      009CA3 81               [ 4] 5383 	ret
                                   5384 
                                   5385 ;----------------------
                                   5386 ; BASIC: QKEY
                                   5387 ; Return true if there 
                                   5388 ; is a character in 
                                   5389 ; waiting in STDIN 
                                   5390 ; input:
                                   5391 ;  none 
                                   5392 ; output:
                                   5393 ;   X 		0|-1 
                                   5394 ;-----------------------
      009CA4                       5395 qkey: 
      009CA4 5F               [ 1] 5396 	clrw x 
      009CA5 72 5D 00 28      [ 1] 5397 	tnz rx_char
      009CA9 27 01            [ 1] 5398 	jreq 9$ 
      009CAB 53               [ 2] 5399 	cplw x 
      009CAC A6 04            [ 1] 5400 9$: ld a,#TK_INTGR
      009CAE 81               [ 4] 5401 	ret 
                                   5402 
                                   5403 ;---------------------
                                   5404 ; BASIC: GPIO(expr,reg)
                                   5405 ; return gpio address 
                                   5406 ; expr {0..8}
                                   5407 ; input:
                                   5408 ;   none 
                                   5409 ; output:
                                   5410 ;   X 		gpio register address
                                   5411 ;----------------------------
      009CAF                       5412 gpio:
      009CAF CD 90 0C         [ 4] 5413 	call func_args 
      009CB2 A1 02            [ 1] 5414 	cp a,#2
      009CB4 27 03            [ 1] 5415 	jreq 1$
      009CB6 CC 87 92         [ 2] 5416 	jp syntax_error  
      009CB9                       5417 1$:	
      009CB9 AE 00 02         [ 2] 5418 	ldw x,#2
      009CBC 72 DE 00 1D      [ 5] 5419 	ldw x,([dstkptr],x) ; port 
      009CC0 2B 1B            [ 1] 5420 	jrmi bad_port
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009CC2 A3 00 09         [ 2] 5421 	cpw x,#9
      009CC5 2A 16            [ 1] 5422 	jrpl bad_port
      009CC7 A6 05            [ 1] 5423 	ld a,#5
      009CC9 42               [ 4] 5424 	mul x,a
      009CCA 1C 50 00         [ 2] 5425 	addw x,#GPIO_BASE 
      009CCD 89               [ 2] 5426 	pushw x 
      009CCE CD 8D F1         [ 4] 5427 	call dpop 
      009CD1 72 FB 01         [ 2] 5428 	addw x,(1,sp)
      009CD4 1F 01            [ 2] 5429 	ldw (1,sp),x  
      009CD6 CD 8E 18         [ 4] 5430 	call ddrop  
      009CD9 85               [ 2] 5431 	popw x 
      009CDA A6 04            [ 1] 5432 	ld a,#TK_INTGR
      009CDC 81               [ 4] 5433 	ret
      009CDD                       5434 bad_port:
      009CDD A6 0A            [ 1] 5435 	ld a,#ERR_BAD_VALUE
      009CDF CC 87 94         [ 2] 5436 	jp tb_error
                                   5437 
                                   5438 
                                   5439 ;-------------------------
                                   5440 ; BASIC: UFLASH 
                                   5441 ; return user flash address
                                   5442 ; input:
                                   5443 ;  none 
                                   5444 ; output:
                                   5445 ;	A		TK_INTGR
                                   5446 ;   X 		user address 
                                   5447 ;---------------------------
      009CE2                       5448 uflash:
      009CE2 AE A6 00         [ 2] 5449 	ldw x,#user_space 
      009CE5 A6 04            [ 1] 5450 	ld a,#TK_INTGR 
      009CE7 81               [ 4] 5451 	ret 
                                   5452 
                                   5453 
                                   5454 ;---------------------
                                   5455 ; BASIC: USR(addr[,arg])
                                   5456 ; execute a function written 
                                   5457 ; in binary code.
                                   5458 ; binary fonction should 
                                   5459 ; return token attribute in A 
                                   5460 ; and value in X. 
                                   5461 ; input:
                                   5462 ;   addr	routine address 
                                   5463 ;   arg 	is an optional argument 
                                   5464 ; output:
                                   5465 ;   A 		token attribute 
                                   5466 ;   X       returned value 
                                   5467 ;---------------------
      009CE8                       5468 usr:
      009CE8 90 89            [ 2] 5469 	pushw y 	
      009CEA CD 90 0C         [ 4] 5470 	call func_args 
      009CED A1 01            [ 1] 5471 	cp a,#1 
      009CEF 2A 03            [ 1] 5472 	jrpl 2$ 
      009CF1 CC 87 92         [ 2] 5473 	jp syntax_error 
      009CF4                       5474 2$: 
      009CF4 CD 8D F1         [ 4] 5475 	call dpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009CF7 A1 02            [ 1] 5476 	cp a,#2 
      009CF9 2B 05            [ 1] 5477 	jrmi 4$
      009CFB 90 93            [ 1] 5478 	ldw y,x ; y=arg 
      009CFD CD 8D F1         [ 4] 5479 	call dpop ;x=addr 
      009D00 51               [ 1] 5480 4$:	exgw y,x ; y=addr,x=arg 
      009D01 90 FD            [ 4] 5481 	call (y)
      009D03 90 85            [ 2] 5482 	popw y 
      009D05 81               [ 4] 5483 	ret 
                                   5484 
                                   5485 ;------------------------------
                                   5486 ; BASIC: BYE 
                                   5487 ; halt mcu in its lowest power mode 
                                   5488 ; wait for reset or external interrupt
                                   5489 ; do a cold start on wakeup.
                                   5490 ;------------------------------
      009D06                       5491 bye:
      009D06 72 0D 52 30 FB   [ 2] 5492 	btjf UART1_SR,#UART_SR_TC,.
      009D0B 8E               [10] 5493 	halt
      009D0C CC 85 54         [ 2] 5494 	jp cold_start  
                                   5495 
                                   5496 ;----------------------------------
                                   5497 ; BASIC: AUTORUN "file_name" 
                                   5498 ; record in eeprom at adrress AUTORUN_NAME
                                   5499 ; the name of file to load and execute
                                   5500 ; at startup 
                                   5501 ; input:
                                   5502 ;   file_name   file to execute 
                                   5503 ; output:
                                   5504 ;   none
                                   5505 ;-----------------------------------
      009D0F                       5506 autorun: 
      009D0F 72 01 00 26 07   [ 2] 5507 	btjf flags,#FRUN,0$ 
      009D14 27 05            [ 1] 5508 	jreq 0$ 
      009D16 A6 07            [ 1] 5509 	ld a,#ERR_CMD_ONLY 
      009D18 CC 87 94         [ 2] 5510 	jp tb_error 
      009D1B                       5511 0$:	
      009D1B CD 88 46         [ 4] 5512 	call next_token 
      009D1E A1 0A            [ 1] 5513 	cp a,#TK_QSTR
      009D20 27 03            [ 1] 5514 	jreq 1$
      009D22 CC 87 92         [ 2] 5515 	jp syntax_error 
      009D25                       5516 1$:	
      009D25 89               [ 2] 5517 	pushw x ; file name char*
      009D26 90 93            [ 1] 5518 	ldw y,x  
      009D28 CD 99 D5         [ 4] 5519 	call search_file 
      009D2B 25 05            [ 1] 5520 	jrc 2$ 
      009D2D A6 09            [ 1] 5521 	ld a,#ERR_NOT_FILE
      009D2F CC 87 94         [ 2] 5522 	jp tb_error  
      009D32                       5523 2$: 
      009D32 55 00 04 00 02   [ 1] 5524 	mov in,count 
      009D37 72 5F 00 17      [ 1] 5525 	clr farptr 
      009D3B AE 40 00         [ 2] 5526 	ldw x,#AUTORUN_NAME
      009D3E CF 00 18         [ 2] 5527 	ldw farptr+1,x 
      009D41 1E 01            [ 2] 5528 	ldw x,(1,sp)  
      009D43 CD 82 7A         [ 4] 5529 	call strlen  ; return length in X 
      009D46 90 85            [ 2] 5530 	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009D48 89               [ 2] 5531 	pushw x 
      009D49 5F               [ 1] 5532 	clrw x 
      009D4A CD 81 D5         [ 4] 5533 	call write_block 
      001CCD                       5534 	_drop 2 
      009D4D 5B 02            [ 2]    1     addw sp,#2 
      009D4F 81               [ 4] 5535 	ret 
                                   5536 
                                   5537 ;----------------------------------
                                   5538 ; BASIC: SLEEP 
                                   5539 ; halt mcu until reset or external
                                   5540 ; interrupt.
                                   5541 ; Resume progam after SLEEP command
                                   5542 ;----------------------------------
      009D50                       5543 sleep:
      009D50 72 0D 52 30 FB   [ 2] 5544 	btjf UART1_SR,#UART_SR_TC,.
      009D55 72 16 00 26      [ 1] 5545 	bset flags,#FSLEEP
      009D59 8E               [10] 5546 	halt 
      009D5A 81               [ 4] 5547 	ret 
                                   5548 
                                   5549 ;-------------------------------
                                   5550 ; BASIC: PAUSE expr 
                                   5551 ; suspend execution for n msec.
                                   5552 ; input:
                                   5553 ;	none
                                   5554 ; output:
                                   5555 ;	none 
                                   5556 ;------------------------------
      009D5B                       5557 pause:
      009D5B CD 90 E8         [ 4] 5558 	call expression
      009D5E A1 04            [ 1] 5559 	cp a,#TK_INTGR
      009D60 27 03            [ 1] 5560 	jreq pause02 
      009D62 CC 87 92         [ 2] 5561 	jp syntax_error
      009D65                       5562 pause02: 
      009D65 5D               [ 2] 5563 1$: tnzw x 
      009D66 27 04            [ 1] 5564 	jreq 2$
      009D68 8F               [10] 5565 	wfi 
      009D69 5A               [ 2] 5566 	decw x 
      009D6A 26 F9            [ 1] 5567 	jrne 1$
      009D6C 4F               [ 1] 5568 2$:	clr a 
      009D6D 81               [ 4] 5569 	ret 
                                   5570 
                                   5571 ;------------------------------
                                   5572 ; BASIC: AWU expr
                                   5573 ; halt mcu for 'expr' milliseconds
                                   5574 ; use Auto wakeup peripheral
                                   5575 ; all oscillators stopped except LSI
                                   5576 ; range: 1ms - 511ms
                                   5577 ; input:
                                   5578 ;  none
                                   5579 ; output:
                                   5580 ;  none:
                                   5581 ;------------------------------
      009D6E                       5582 awu:
      009D6E CD 90 E8         [ 4] 5583   call expression
      009D71 A1 04            [ 1] 5584   cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009D73 27 03            [ 1] 5585   jreq awu02
      009D75 CC 87 92         [ 2] 5586   jp syntax_error
      009D78                       5587 awu02:
      009D78 A3 14 00         [ 2] 5588   cpw x,#5120
      009D7B 2B 0C            [ 1] 5589   jrmi 1$ 
      009D7D 35 0F 50 F2      [ 1] 5590   mov AWU_TBR,#15 
      009D81 A6 1E            [ 1] 5591   ld a,#30
      009D83 62               [ 2] 5592   div x,a
      009D84 A6 10            [ 1] 5593   ld a,#16
      009D86 62               [ 2] 5594   div x,a 
      009D87 20 1E            [ 2] 5595   jra 4$
      009D89                       5596 1$: 
      009D89 A3 08 00         [ 2] 5597   cpw x,#2048
      009D8C 2B 09            [ 1] 5598   jrmi 2$ 
      009D8E 35 0E 50 F2      [ 1] 5599   mov AWU_TBR,#14
      009D92 A6 50            [ 1] 5600   ld a,#80
      009D94 62               [ 2] 5601   div x,a 
      009D95 20 10            [ 2] 5602   jra 4$   
      009D97                       5603 2$:
      009D97 35 07 50 F2      [ 1] 5604   mov AWU_TBR,#7
      009D9B                       5605 3$:  
                                   5606 ; while X > 64  divide by 2 and increment AWU_TBR 
      009D9B A3 00 40         [ 2] 5607   cpw x,#64 
      009D9E 23 07            [ 2] 5608   jrule 4$ 
      009DA0 72 5C 50 F2      [ 1] 5609   inc AWU_TBR 
      009DA4 54               [ 2] 5610   srlw x 
      009DA5 20 F4            [ 2] 5611   jra 3$ 
      009DA7                       5612 4$:
      009DA7 9F               [ 1] 5613   ld a, xl
      009DA8 4A               [ 1] 5614   dec a 
      009DA9 27 01            [ 1] 5615   jreq 5$
      009DAB 4A               [ 1] 5616   dec a 	
      009DAC                       5617 5$: 
      009DAC A4 3E            [ 1] 5618   and a,#0x3e 
      009DAE C7 50 F1         [ 1] 5619   ld AWU_APR,a 
      009DB1 72 18 50 F0      [ 1] 5620   bset AWU_CSR,#AWU_CSR_AWUEN
      009DB5 8E               [10] 5621   halt 
                                   5622 
      009DB6 81               [ 4] 5623   ret 
                                   5624 
                                   5625 ;------------------------------
                                   5626 ; BASIC: TICKS
                                   5627 ; return msec ticks counter value 
                                   5628 ; input:
                                   5629 ; 	none 
                                   5630 ; output:
                                   5631 ;	X 		TK_INTGR
                                   5632 ;-------------------------------
      009DB7                       5633 get_ticks:
      009DB7 CE 00 0F         [ 2] 5634 	ldw x,ticks 
      009DBA A6 04            [ 1] 5635 	ld a,#TK_INTGR
      009DBC 81               [ 4] 5636 	ret 
                                   5637 
                                   5638 
                                   5639 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   5640 ;------------------------------
                                   5641 ; BASIC: ABS(expr)
                                   5642 ; return absolute value of expr.
                                   5643 ; input:
                                   5644 ;   none
                                   5645 ; output:
                                   5646 ;   X     	positive integer
                                   5647 ;-------------------------------
      009DBD                       5648 abs:
      009DBD CD 90 0C         [ 4] 5649 	call func_args 
      009DC0 A1 01            [ 1] 5650 	cp a,#1 
      009DC2 27 03            [ 1] 5651 	jreq 0$ 
      009DC4 CC 87 92         [ 2] 5652 	jp syntax_error
      009DC7                       5653 0$:  
      009DC7 CD 8D F1         [ 4] 5654     call dpop   
      009DCA 9E               [ 1] 5655 	ld a,xh 
      009DCB A5 80            [ 1] 5656 	bcp a,#0x80 
      009DCD 27 01            [ 1] 5657 	jreq 2$ 
      009DCF 50               [ 2] 5658 	negw x 
      009DD0 A6 04            [ 1] 5659 2$: ld a,#TK_INTGR 
      009DD2 81               [ 4] 5660 	ret 
                                   5661 
                                   5662 ;------------------------------
                                   5663 ; BASIC: AND(expr1,expr2)
                                   5664 ; Apply bit AND relation between
                                   5665 ; the 2 arguments, i.e expr1 & expr2 
                                   5666 ; output:
                                   5667 ; 	A 		TK_INTGR
                                   5668 ;   X 		result 
                                   5669 ;------------------------------
      009DD3                       5670 bit_and:
      009DD3 CD 90 0C         [ 4] 5671 	call func_args 
      009DD6 A1 02            [ 1] 5672 	cp a,#2
      009DD8 27 03            [ 1] 5673 	jreq 1$
      009DDA CC 87 92         [ 2] 5674 	jp syntax_error 
      009DDD CD 8D F1         [ 4] 5675 1$:	call dpop 
      009DE0 89               [ 2] 5676 	pushw x 
      009DE1 CD 8D F1         [ 4] 5677 	call dpop 
      009DE4 9E               [ 1] 5678 	ld a,xh 
      009DE5 14 01            [ 1] 5679 	and a,(1,sp)
      009DE7 95               [ 1] 5680 	ld xh,a 
      009DE8 9F               [ 1] 5681 	ld a,xl
      009DE9 14 02            [ 1] 5682 	and a,(2,sp)
      009DEB 97               [ 1] 5683 	ld xl,a 
      001D6C                       5684 	_drop 2 
      009DEC 5B 02            [ 2]    1     addw sp,#2 
      009DEE A6 04            [ 1] 5685 	ld a,#TK_INTGR
      009DF0 81               [ 4] 5686 	ret
                                   5687 
                                   5688 ;------------------------------
                                   5689 ; BASIC: OR(expr1,expr2)
                                   5690 ; Apply bit OR relation between
                                   5691 ; the 2 arguments, i.e expr1 | expr2 
                                   5692 ; output:
                                   5693 ; 	A 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                                   5694 ;   X 		result 
                                   5695 ;------------------------------
      009DF1                       5696 bit_or:
      009DF1 CD 90 0C         [ 4] 5697 	call func_args 
      009DF4 A1 02            [ 1] 5698 	cp a,#2
      009DF6 27 03            [ 1] 5699 	jreq 1$
      009DF8 CC 87 92         [ 2] 5700 	jp syntax_error 
      009DFB                       5701 1$: 
      009DFB CD 8D F1         [ 4] 5702 	call dpop 
      009DFE 89               [ 2] 5703 	pushw x 
      009DFF CD 8D F1         [ 4] 5704 	call dpop 
      009E02 9E               [ 1] 5705 	ld a,xh 
      009E03 1A 01            [ 1] 5706 	or a,(1,sp)
      009E05 95               [ 1] 5707 	ld xh,a 
      009E06 9F               [ 1] 5708 	ld a,xl 
      009E07 1A 02            [ 1] 5709 	or a,(2,sp)
      009E09 97               [ 1] 5710 	ld xl,a 
      001D8A                       5711 	_drop 2 
      009E0A 5B 02            [ 2]    1     addw sp,#2 
      009E0C A6 04            [ 1] 5712 	ld a,#TK_INTGR 
      009E0E 81               [ 4] 5713 	ret
                                   5714 
                                   5715 ;------------------------------
                                   5716 ; BASIC: XOR(expr1,expr2)
                                   5717 ; Apply bit XOR relation between
                                   5718 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5719 ; output:
                                   5720 ; 	A 		TK_INTGR
                                   5721 ;   X 		result 
                                   5722 ;------------------------------
      009E0F                       5723 bit_xor:
      009E0F CD 90 0C         [ 4] 5724 	call func_args 
      009E12 A1 02            [ 1] 5725 	cp a,#2
      009E14 27 03            [ 1] 5726 	jreq 1$
      009E16 CC 87 92         [ 2] 5727 	jp syntax_error 
      009E19                       5728 1$: 
      009E19 CD 8D F1         [ 4] 5729 	call dpop 
      009E1C 89               [ 2] 5730 	pushw x 
      009E1D CD 8D F1         [ 4] 5731 	call dpop 
      009E20 9E               [ 1] 5732 	ld a,xh 
      009E21 18 01            [ 1] 5733 	xor a,(1,sp)
      009E23 95               [ 1] 5734 	ld xh,a 
      009E24 9F               [ 1] 5735 	ld a,xl 
      009E25 18 02            [ 1] 5736 	xor a,(2,sp)
      009E27 97               [ 1] 5737 	ld xl,a 
      001DA8                       5738 	_drop 2 
      009E28 5B 02            [ 2]    1     addw sp,#2 
      009E2A A6 04            [ 1] 5739 	ld a,#TK_INTGR 
      009E2C 81               [ 4] 5740 	ret 
                                   5741 
                                   5742 ;------------------------------
                                   5743 ; BASIC: LSHIFT(expr1,expr2)
                                   5744 ; logical shift left expr1 by 
                                   5745 ; expr2 bits 
                                   5746 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                   5747 ; 	A 		TK_INTGR
                                   5748 ;   X 		result 
                                   5749 ;------------------------------
      009E2D                       5750 lshift:
      009E2D CD 90 0C         [ 4] 5751 	call func_args
      009E30 A1 02            [ 1] 5752 	cp a,#2 
      009E32 27 03            [ 1] 5753 	jreq 1$
      009E34 CC 87 92         [ 2] 5754 	jp syntax_error
      009E37 CD 8D F1         [ 4] 5755 1$: call dpop  
      009E3A 51               [ 1] 5756 	exgw x,y 
      009E3B CD 8D F1         [ 4] 5757 	call dpop
      009E3E 90 5D            [ 2] 5758 	tnzw y 
      009E40 27 05            [ 1] 5759 	jreq 4$
      009E42 58               [ 2] 5760 2$:	sllw x 
      009E43 90 5A            [ 2] 5761 	decw y 
      009E45 26 FB            [ 1] 5762 	jrne 2$
      009E47                       5763 4$:  
      009E47 A6 04            [ 1] 5764 	ld a,#TK_INTGR
      009E49 81               [ 4] 5765 	ret
                                   5766 
                                   5767 ;------------------------------
                                   5768 ; BASIC: RSHIFT(expr1,expr2)
                                   5769 ; logical shift right expr1 by 
                                   5770 ; expr2 bits.
                                   5771 ; output:
                                   5772 ; 	A 		TK_INTGR
                                   5773 ;   X 		result 
                                   5774 ;------------------------------
      009E4A                       5775 rshift:
      009E4A CD 90 0C         [ 4] 5776 	call func_args
      009E4D A1 02            [ 1] 5777 	cp a,#2 
      009E4F 27 03            [ 1] 5778 	jreq 1$
      009E51 CC 87 92         [ 2] 5779 	jp syntax_error
      009E54 CD 8D F1         [ 4] 5780 1$: call dpop  
      009E57 51               [ 1] 5781 	exgw x,y 
      009E58 CD 8D F1         [ 4] 5782 	call dpop
      009E5B 90 5D            [ 2] 5783 	tnzw y 
      009E5D 27 05            [ 1] 5784 	jreq 4$
      009E5F 54               [ 2] 5785 2$:	srlw x 
      009E60 90 5A            [ 2] 5786 	decw y 
      009E62 26 FB            [ 1] 5787 	jrne 2$
      009E64                       5788 4$:  
      009E64 A6 04            [ 1] 5789 	ld a,#TK_INTGR
      009E66 81               [ 4] 5790 	ret
                                   5791 
                                   5792 ;--------------------------
                                   5793 ; BASIC: FCPU integer
                                   5794 ; set CPU frequency 
                                   5795 ;-------------------------- 
                                   5796 
      009E67                       5797 fcpu:
      009E67 A6 04            [ 1] 5798 	ld a,#TK_INTGR
      009E69 CD 8F DB         [ 4] 5799 	call expect 
      009E6C 9F               [ 1] 5800 	ld a,xl 
      009E6D A4 07            [ 1] 5801 	and a,#7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009E6F C7 50 C6         [ 1] 5802 	ld CLK_CKDIVR,a 
      009E72 81               [ 4] 5803 	ret 
                                   5804 
                                   5805 ;------------------------------
                                   5806 ; BASIC: PMODE pin#, mode 
                                   5807 ; Arduino pin. 
                                   5808 ; define pin as input or output
                                   5809 ; pin#: {0..15}
                                   5810 ; mode: INPUT|OUTPUT  
                                   5811 ;------------------------------
                           000001  5812 	PINNO=1
                           000001  5813 	VSIZE=1
      009E73                       5814 pin_mode:
      001DF3                       5815 	_vars VSIZE 
      009E73 52 01            [ 2]    1     sub sp,#VSIZE 
      009E75 CD 8F E8         [ 4] 5816 	call arg_list 
      009E78 A1 02            [ 1] 5817 	cp a,#2 
      009E7A 27 03            [ 1] 5818 	jreq 1$
      009E7C CC 87 92         [ 2] 5819 	jp syntax_error 
      009E7F CD 8D F1         [ 4] 5820 1$: call dpop ; mode 
      009E82 51               [ 1] 5821 	exgw x,y 
      009E83 CD 8D F1         [ 4] 5822 	call dpop ; Dx pin 
      009E86 CD 9E B8         [ 4] 5823 	call select_pin 
      009E89 6B 01            [ 1] 5824 	ld (PINNO,sp),a  
      009E8B A6 01            [ 1] 5825 	ld a,#1 
      009E8D 0D 01            [ 1] 5826 	tnz (PINNO,sp)
      009E8F 27 0B            [ 1] 5827 	jreq 4$
      009E91 48               [ 1] 5828 2$:	sll a 
      009E92 0A 01            [ 1] 5829 	dec (PINNO,sp)
      009E94 26 FB            [ 1] 5830 	jrne 2$ 
      009E96 6B 01            [ 1] 5831 	ld (PINNO,sp),a
      009E98 EA 03            [ 1] 5832 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009E9A E7 03            [ 1] 5833 	ld (GPIO_CR1,x),a 
      009E9C 90 A3 00 01      [ 2] 5834 4$:	cpw y,#OUTP 
      009EA0 27 07            [ 1] 5835 	jreq 6$
                                   5836 ; input mode
      009EA2 7B 01            [ 1] 5837 	ld a,(PINNO,sp)
      009EA4 43               [ 1] 5838 	cpl a 
      009EA5 E4 02            [ 1] 5839 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009EA7 20 0A            [ 2] 5840 	jra 9$
      009EA9                       5841 6$: ;output mode  
      009EA9 7B 01            [ 1] 5842 	ld a,(PINNO,sp)
      009EAB EA 04            [ 1] 5843 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009EAD E7 04            [ 1] 5844 	ld (GPIO_CR2,x),a 
      009EAF 7B 01            [ 1] 5845 	ld a,(PINNO,sp)
      009EB1 EA 02            [ 1] 5846 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009EB3 E7 02            [ 1] 5847 9$:	ld (GPIO_DDR,x),a 
      001E35                       5848 	_drop VSIZE 
      009EB5 5B 01            [ 2]    1     addw sp,#VSIZE 
      009EB7 81               [ 4] 5849 	ret
                                   5850 
                                   5851 ;------------------------
                                   5852 ; select Arduino pin 
                                   5853 ; input:
                                   5854 ;   X 	 {0..15} Arduino Dx 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                                   5855 ; output:
                                   5856 ;   A     stm8s208 pin 
                                   5857 ;   X     base address s208 GPIO port 
                                   5858 ;---------------------------
      009EB8                       5859 select_pin:
      009EB8 58               [ 2] 5860 	sllw x 
      009EB9 1C 9E C8         [ 2] 5861 	addw x,#arduino_to_8s208 
      009EBC FE               [ 2] 5862 	ldw x,(x)
      009EBD 9F               [ 1] 5863 	ld a,xl 
      009EBE 88               [ 1] 5864 	push a 
      009EBF 5E               [ 1] 5865 	swapw x 
      009EC0 A6 05            [ 1] 5866 	ld a,#5 
      009EC2 42               [ 4] 5867 	mul x,a 
      009EC3 1C 50 00         [ 2] 5868 	addw x,#GPIO_BASE 
      009EC6 84               [ 1] 5869 	pop a 
      009EC7 81               [ 4] 5870 	ret 
                                   5871 ; translation from Arduino D0..D15 to stm8s208rb 
      009EC8                       5872 arduino_to_8s208:
      009EC8 03 06                 5873 .byte 3,6 ; D0 
      009ECA 03 05                 5874 .byte 3,5 ; D1 
      009ECC 04 00                 5875 .byte 4,0 ; D2 
      009ECE 02 01                 5876 .byte 2,1 ; D3
      009ED0 06 00                 5877 .byte 6,0 ; D4
      009ED2 02 02                 5878 .byte 2,2 ; D5
      009ED4 02 03                 5879 .byte 2,3 ; D6
      009ED6 03 01                 5880 .byte 3,1 ; D7
      009ED8 03 03                 5881 .byte 3,3 ; D8
      009EDA 02 04                 5882 .byte 2,4 ; D9
      009EDC 04 05                 5883 .byte 4,5 ; D10
      009EDE 02 06                 5884 .byte 2,6 ; D11
      009EE0 02 07                 5885 .byte 2,7 ; D12
      009EE2 02 05                 5886 .byte 2,5 ; D13
      009EE4 04 02                 5887 .byte 4,2 ; D14
      009EE6 04 01                 5888 .byte 4,1 ; D15
                                   5889 
                                   5890 
                                   5891 ;------------------------------
                                   5892 ; BASIC: RND(expr)
                                   5893 ; return random number 
                                   5894 ; between 1 and expr inclusive
                                   5895 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5896 ; input:
                                   5897 ; 	none 
                                   5898 ; output:
                                   5899 ;	X 		random positive integer 
                                   5900 ;------------------------------
      009EE8                       5901 random:
      009EE8 CD 90 0C         [ 4] 5902 	call func_args 
      009EEB A1 01            [ 1] 5903 	cp a,#1
      009EED 27 03            [ 1] 5904 	jreq 1$
      009EEF CC 87 92         [ 2] 5905 	jp syntax_error
      009EF2                       5906 1$: 
      009EF2 CD 8D F1         [ 4] 5907 	call dpop 
      009EF5 89               [ 2] 5908 	pushw x 
      009EF6 9E               [ 1] 5909 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009EF7 A5 80            [ 1] 5910 	bcp a,#0x80 
      009EF9 27 05            [ 1] 5911 	jreq 2$
      009EFB A6 0A            [ 1] 5912 	ld a,#ERR_BAD_VALUE
      009EFD CC 87 94         [ 2] 5913 	jp tb_error
      009F00                       5914 2$: 
                                   5915 ; acc16=(x<<5)^x 
      009F00 CE 00 13         [ 2] 5916 	ldw x,seedx 
      009F03 58               [ 2] 5917 	sllw x 
      009F04 58               [ 2] 5918 	sllw x 
      009F05 58               [ 2] 5919 	sllw x 
      009F06 58               [ 2] 5920 	sllw x 
      009F07 58               [ 2] 5921 	sllw x 
      009F08 9E               [ 1] 5922 	ld a,xh 
      009F09 C8 00 13         [ 1] 5923 	xor a,seedx 
      009F0C C7 00 0D         [ 1] 5924 	ld acc16,a 
      009F0F 9F               [ 1] 5925 	ld a,xl 
      009F10 C8 00 14         [ 1] 5926 	xor a,seedx+1 
      009F13 C7 00 0E         [ 1] 5927 	ld acc8,a 
                                   5928 ; seedx=seedy 
      009F16 CE 00 15         [ 2] 5929 	ldw x,seedy 
      009F19 CF 00 13         [ 2] 5930 	ldw seedx,x  
                                   5931 ; seedy=seedy^(seedy>>1)
      009F1C 90 54            [ 2] 5932 	srlw y 
      009F1E 90 9E            [ 1] 5933 	ld a,yh 
      009F20 C8 00 15         [ 1] 5934 	xor a,seedy 
      009F23 C7 00 15         [ 1] 5935 	ld seedy,a  
      009F26 90 9F            [ 1] 5936 	ld a,yl 
      009F28 C8 00 16         [ 1] 5937 	xor a,seedy+1 
      009F2B C7 00 16         [ 1] 5938 	ld seedy+1,a 
                                   5939 ; acc16>>3 
      009F2E CE 00 0D         [ 2] 5940 	ldw x,acc16 
      009F31 54               [ 2] 5941 	srlw x 
      009F32 54               [ 2] 5942 	srlw x 
      009F33 54               [ 2] 5943 	srlw x 
                                   5944 ; x=acc16^x 
      009F34 9E               [ 1] 5945 	ld a,xh 
      009F35 C8 00 0D         [ 1] 5946 	xor a,acc16 
      009F38 95               [ 1] 5947 	ld xh,a 
      009F39 9F               [ 1] 5948 	ld a,xl 
      009F3A C8 00 0E         [ 1] 5949 	xor a,acc8 
      009F3D 97               [ 1] 5950 	ld xl,a 
                                   5951 ; seedy=x^seedy 
      009F3E C8 00 16         [ 1] 5952 	xor a,seedy+1
      009F41 97               [ 1] 5953 	ld xl,a 
      009F42 9E               [ 1] 5954 	ld a,xh 
      009F43 C8 00 15         [ 1] 5955 	xor a,seedy
      009F46 95               [ 1] 5956 	ld xh,a 
      009F47 CF 00 15         [ 2] 5957 	ldw seedy,x 
                                   5958 ; return seedy modulo expr + 1 
      009F4A 90 85            [ 2] 5959 	popw y 
      009F4C 65               [ 2] 5960 	divw x,y 
      009F4D 93               [ 1] 5961 	ldw x,y 
      009F4E 5C               [ 2] 5962 	incw x 
      009F4F A6 04            [ 1] 5963 	ld a,#TK_INTGR
      009F51 81               [ 4] 5964 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                                   5965 
                                   5966 ;---------------------------------
                                   5967 ; BASIC: WORDS 
                                   5968 ; affiche la listes des mots du
                                   5969 ; dictionnaire.
                                   5970 ;---------------------------------
                           000001  5971 	WLEN=1
                           000002  5972 	LLEN=2  
                           000002  5973 	VSIZE=2 
      009F52                       5974 words:
      001ED2                       5975 	_vars VSIZE
      009F52 52 02            [ 2]    1     sub sp,#VSIZE 
      009F54 0F 02            [ 1] 5976 	clr (LLEN,sp)
      009F56 90 AE A5 E4      [ 2] 5977 	ldw y,#kword_dict+2
      009F5A 93               [ 1] 5978 0$:	ldw x,y
      009F5B F6               [ 1] 5979 	ld a,(x)
      009F5C A4 0F            [ 1] 5980 	and a,#15 
      009F5E 6B 01            [ 1] 5981 	ld (WLEN,sp),a 
      009F60 5C               [ 2] 5982 1$:	incw x 
      009F61 F6               [ 1] 5983 	ld a,(x)
      009F62 CD 82 33         [ 4] 5984 	call putc 
      009F65 0C 02            [ 1] 5985 	inc (LLEN,sp)
      009F67 0A 01            [ 1] 5986 	dec (WLEN,sp)
      009F69 26 F5            [ 1] 5987 	jrne 1$
      009F6B A6 46            [ 1] 5988 	ld a,#70
      009F6D 11 02            [ 1] 5989 	cp a,(LLEN,sp)
      009F6F 2B 09            [ 1] 5990 	jrmi 2$   
      009F71 A6 20            [ 1] 5991 	ld a,#SPACE 
      009F73 CD 82 33         [ 4] 5992 	call putc 
      009F76 0C 02            [ 1] 5993 	inc (LLEN,sp) 
      009F78 20 07            [ 2] 5994 	jra 3$
      009F7A A6 0D            [ 1] 5995 2$: ld a,#CR 
      009F7C CD 82 33         [ 4] 5996 	call putc 
      009F7F 0F 02            [ 1] 5997 	clr (LLEN,sp)
      009F81 72 A2 00 02      [ 2] 5998 3$:	subw y,#2 
      009F85 90 FE            [ 2] 5999 	ldw y,(y)
      009F87 26 D1            [ 1] 6000 	jrne 0$  
      001F09                       6001 	_drop VSIZE 
      009F89 5B 02            [ 2]    1     addw sp,#VSIZE 
      009F8B 81               [ 4] 6002 	ret 
                                   6003 
                                   6004 
                                   6005 ;-----------------------------
                                   6006 ; BASIC: TIMER expr 
                                   6007 ; initialize count down timer 
                                   6008 ;-----------------------------
      009F8C                       6009 set_timer:
      009F8C CD 8F E8         [ 4] 6010 	call arg_list
      009F8F A1 01            [ 1] 6011 	cp a,#1 
      009F91 27 03            [ 1] 6012 	jreq 1$
      009F93 CC 87 92         [ 2] 6013 	jp syntax_error
      009F96                       6014 1$: 
      009F96 CD 8D F1         [ 4] 6015 	call dpop 
      009F99 CF 00 11         [ 2] 6016 	ldw timer,x 
      009F9C 81               [ 4] 6017 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                   6018 
                                   6019 ;------------------------------
                                   6020 ; BASIC: TIMEOUT 
                                   6021 ; return state of timer 
                                   6022 ;------------------------------
      009F9D                       6023 timeout:
      009F9D CE 00 11         [ 2] 6024 	ldw x,timer 
      009FA0                       6025 logical_complement:
      009FA0 53               [ 2] 6026 	cplw x 
      009FA1 A3 FF FF         [ 2] 6027 	cpw x,#-1
      009FA4 27 01            [ 1] 6028 	jreq 2$
      009FA6 5F               [ 1] 6029 	clrw x 
      009FA7 A6 04            [ 1] 6030 2$:	ld a,#TK_INTGR
      009FA9 81               [ 4] 6031 	ret 
                                   6032 
                                   6033 ;--------------------------------
                                   6034 ; BASIC NOT(expr) 
                                   6035 ; return logical complement of expr
                                   6036 ;--------------------------------
      009FAA                       6037 func_not:
      009FAA CD 90 0C         [ 4] 6038 	call func_args  
      009FAD A1 01            [ 1] 6039 	cp a,#1
      009FAF 27 03            [ 1] 6040 	jreq 1$
      009FB1 CC 87 92         [ 2] 6041 	jp syntax_error
      009FB4 CD 8D F1         [ 4] 6042 1$:	call dpop 
      009FB7 20 E7            [ 2] 6043 	jra logical_complement
                                   6044 
                                   6045 
                                   6046 
                                   6047 ;-----------------------------------
                                   6048 ; BASIC: IWDGEN expr1 
                                   6049 ; enable independant watchdog timer
                                   6050 ; expr1 is delay in multiple of 62.5µsec
                                   6051 ; expr1 -> {1..16383}
                                   6052 ;-----------------------------------
      009FB9                       6053 enable_iwdg:
      009FB9 CD 8F E8         [ 4] 6054 	call arg_list
      009FBC A1 01            [ 1] 6055 	cp a,#1 
      009FBE 27 03            [ 1] 6056 	jreq 1$
      009FC0 CC 87 92         [ 2] 6057 	jp syntax_error 
      009FC3 4B 00            [ 1] 6058 1$: push #0
      009FC5 35 CC 50 E0      [ 1] 6059 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009FC9 CD 8D F1         [ 4] 6060 	call dpop
      009FCC 9E               [ 1] 6061 	ld a,xh 
      009FCD A4 3F            [ 1] 6062 	and a,#0x3f
      009FCF 95               [ 1] 6063 	ld xh,a  
      009FD0 A3 00 FF         [ 2] 6064 2$:	cpw x,#255
      009FD3 23 06            [ 2] 6065 	jrule 3$
      009FD5 0C 01            [ 1] 6066 	inc (1,sp)
      009FD7 98               [ 1] 6067 	rcf 
      009FD8 56               [ 2] 6068 	rrcw x 
      009FD9 20 F5            [ 2] 6069 	jra 2$
      009FDB 35 55 50 E0      [ 1] 6070 3$:	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009FDF 84               [ 1] 6071 	pop a  
      009FE0 C7 50 E1         [ 1] 6072 	ld IWDG_PR,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009FE3 9F               [ 1] 6073 	ld a,xl
      009FE4 4A               [ 1] 6074 	dec a 
      009FE5 35 55 50 E0      [ 1] 6075 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009FE9 C7 50 E2         [ 1] 6076 	ld IWDG_RLR,a 
      009FEC 35 AA 50 E0      [ 1] 6077 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009FF0 81               [ 4] 6078 	ret 
                                   6079 
                                   6080 
                                   6081 ;-----------------------------------
                                   6082 ; BASIC: IWDGREF  
                                   6083 ; refresh independant watchdog count down 
                                   6084 ; timer before it reset MCU. 
                                   6085 ;-----------------------------------
      009FF1                       6086 refresh_iwdg:
      009FF1 35 AA 50 E0      [ 1] 6087 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009FF5 81               [ 4] 6088 	ret 
                                   6089 
                                   6090 
                                   6091 ;-------------------------------------
                                   6092 ; BASIC: LOG(expr)
                                   6093 ; return logarithm base 2 of expr 
                                   6094 ; this is the position of most significant
                                   6095 ; bit set. 
                                   6096 ; input: 
                                   6097 ; output:
                                   6098 ;   X     log2 
                                   6099 ;   A     TK_INTGR 
                                   6100 ;*********************************
      009FF6                       6101 log2:
      009FF6 CD 90 0C         [ 4] 6102 	call func_args 
      009FF9 A1 01            [ 1] 6103 	cp a,#1 
      009FFB 27 03            [ 1] 6104 	jreq 1$
      009FFD CC 87 92         [ 2] 6105 	jp syntax_error 
      00A000 CD 8D F1         [ 4] 6106 1$: call dpop
      00A003                       6107 leading_one:
      00A003 5D               [ 2] 6108 	tnzw x 
      00A004 27 0A            [ 1] 6109 	jreq 4$
      00A006 A6 0F            [ 1] 6110 	ld a,#15 
      00A008 59               [ 2] 6111 2$: rlcw x 
      00A009 25 03            [ 1] 6112     jrc 3$
      00A00B 4A               [ 1] 6113 	dec a 
      00A00C 20 FA            [ 2] 6114 	jra 2$
      00A00E 5F               [ 1] 6115 3$: clrw x 
      00A00F 97               [ 1] 6116     ld xl,a
      00A010 A6 04            [ 1] 6117 4$:	ld a,#TK_INTGR
      00A012 81               [ 4] 6118 	ret 
                                   6119 
                                   6120 ;-----------------------------------
                                   6121 ; BASIC: BIT(expr) 
                                   6122 ; expr ->{0..15}
                                   6123 ; return 2^expr 
                                   6124 ; output:
                                   6125 ;    x    2^expr 
                                   6126 ;-----------------------------------
      00A013                       6127 bitmask:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      00A013 CD 90 0C         [ 4] 6128     call func_args 
      00A016 A1 01            [ 1] 6129 	cp a,#1
      00A018 27 03            [ 1] 6130 	jreq 1$
      00A01A CC 87 92         [ 2] 6131 	jp syntax_error 
      00A01D CD 8D F1         [ 4] 6132 1$: call dpop 
      00A020 9F               [ 1] 6133 	ld a,xl 
      00A021 A4 0F            [ 1] 6134 	and a,#15
      00A023 5F               [ 1] 6135 	clrw x 
      00A024 5C               [ 2] 6136 	incw x 
      00A025 4D               [ 1] 6137 2$: tnz a 
      00A026 27 04            [ 1] 6138 	jreq 3$
      00A028 58               [ 2] 6139 	slaw x 
      00A029 4A               [ 1] 6140 	dec a 
      00A02A 20 F9            [ 2] 6141 	jra 2$ 
      00A02C A6 04            [ 1] 6142 3$: ld a,#TK_INTGR
      00A02E 81               [ 4] 6143 	ret 
                                   6144 
                                   6145 ;------------------------------
                                   6146 ; BASIC: INVERT(expr)
                                   6147 ; 1's complement 
                                   6148 ;--------------------------------
      00A02F                       6149 invert:
      00A02F CD 90 0C         [ 4] 6150 	call func_args
      00A032 A1 01            [ 1] 6151 	cp a,#1 
      00A034 27 03            [ 1] 6152 	jreq 1$
      00A036 CC 87 92         [ 2] 6153 	jp syntax_error
      00A039 CD 8D F1         [ 4] 6154 1$: call dpop 
      00A03C 53               [ 2] 6155 	cplw x 
      00A03D A6 04            [ 1] 6156 	ld a,#TK_INTGR 
      00A03F 81               [ 4] 6157 	ret 
                                   6158 
                                   6159 ;------------------------------
                                   6160 ; BASIC: DO 
                                   6161 ; initiate a DO ... UNTIL loop 
                                   6162 ;------------------------------
      00A040                       6163 do_loop:
      00A040 85               [ 2] 6164 	popw x 
      001FC1                       6165 	_vars 4 
      00A041 52 04            [ 2]    1     sub sp,#4 
      00A043 89               [ 2] 6166 	pushw x 
      00A044 CC 96 81         [ 2] 6167 	jp store_loop_addr
                                   6168 
                                   6169 ;--------------------------------
                                   6170 ; BASIC: UNTIL expr 
                                   6171 ; loop if exprssion is false 
                                   6172 ; else terminate loop
                                   6173 ;--------------------------------
      00A047                       6174 until: 
      00A047 72 5D 00 23      [ 1] 6175 	tnz loop_depth 
      00A04B 26 03            [ 1] 6176 	jrne 1$ 
      00A04D CC 87 92         [ 2] 6177 	jp syntax_error 
      00A050                       6178 1$: 
      00A050 CD 91 2C         [ 4] 6179 	call relation 
      00A053 A1 04            [ 1] 6180 	cp a,#TK_INTGR
      00A055 27 03            [ 1] 6181 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      00A057 CC 87 92         [ 2] 6182 	jp syntax_error
      00A05A                       6183 2$: 
      00A05A 5D               [ 2] 6184 	tnzw x 
      00A05B 26 03            [ 1] 6185 	jrne 9$
      00A05D CC 96 DC         [ 2] 6186 	jp loop_back 
      00A060                       6187 9$:	; remove loop info cstack  
      00A060 85               [ 2] 6188 	popw x
      001FE1                       6189 	_drop 4
      00A061 5B 04            [ 2]    1     addw sp,#4 
      00A063 89               [ 2] 6190 	pushw x 
      00A064 72 5A 00 23      [ 1] 6191 	dec loop_depth 
      00A068 81               [ 4] 6192 	ret 
                                   6193 
                                   6194 ;--------------------------
                                   6195 ; BASIC: PRTA...PRTI  
                                   6196 ;  return constant value 
                                   6197 ;  PORT  offset in GPIO
                                   6198 ;  array
                                   6199 ;---------------------------
      00A069                       6200 const_porta:
      00A069 AE 00 00         [ 2] 6201 	ldw x,#0
      00A06C A6 04            [ 1] 6202 	ld a,#TK_INTGR 
      00A06E 81               [ 4] 6203 	ret 
      00A06F                       6204 const_portb:
      00A06F AE 00 01         [ 2] 6205 	ldw x,#1
      00A072 A6 04            [ 1] 6206 	ld a,#TK_INTGR 
      00A074 81               [ 4] 6207 	ret 
      00A075                       6208 const_portc:
      00A075 AE 00 02         [ 2] 6209 	ldw x,#2
      00A078 A6 04            [ 1] 6210 	ld a,#TK_INTGR 
      00A07A 81               [ 4] 6211 	ret 
      00A07B                       6212 const_portd:
      00A07B AE 00 03         [ 2] 6213 	ldw x,#3
      00A07E A6 04            [ 1] 6214 	ld a,#TK_INTGR 
      00A080 81               [ 4] 6215 	ret 
      00A081                       6216 const_porte:
      00A081 AE 00 04         [ 2] 6217 	ldw x,#4
      00A084 A6 04            [ 1] 6218 	ld a,#TK_INTGR 
      00A086 81               [ 4] 6219 	ret 
      00A087                       6220 const_portf:
      00A087 AE 00 05         [ 2] 6221 	ldw x,#5
      00A08A A6 04            [ 1] 6222 	ld a,#TK_INTGR 
      00A08C 81               [ 4] 6223 	ret 
      00A08D                       6224 const_portg:
      00A08D AE 00 06         [ 2] 6225 	ldw x,#6
      00A090 A6 04            [ 1] 6226 	ld a,#TK_INTGR 
      00A092 81               [ 4] 6227 	ret 
      00A093                       6228 const_porth:
      00A093 AE 00 07         [ 2] 6229 	ldw x,#7
      00A096 A6 04            [ 1] 6230 	ld a,#TK_INTGR 
      00A098 81               [ 4] 6231 	ret 
      00A099                       6232 const_porti:
      00A099 AE 00 08         [ 2] 6233 	ldw x,#8
      00A09C A6 04            [ 1] 6234 	ld a,#TK_INTGR 
      00A09E 81               [ 4] 6235 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                   6236 
                                   6237 ;-------------------------------
                                   6238 ; following return constant 
                                   6239 ; related to GPIO register offset 
                                   6240 ;---------------------------------
      00A09F                       6241 const_odr:
      00A09F A6 04            [ 1] 6242 	ld a,#TK_INTGR 
      00A0A1 AE 00 00         [ 2] 6243 	ldw x,#GPIO_ODR
      00A0A4 81               [ 4] 6244 	ret 
      00A0A5                       6245 const_idr:
      00A0A5 A6 04            [ 1] 6246 	ld a,#TK_INTGR 
      00A0A7 AE 00 01         [ 2] 6247 	ldw x,#GPIO_IDR
      00A0AA 81               [ 4] 6248 	ret 
      00A0AB                       6249 const_ddr:
      00A0AB A6 04            [ 1] 6250 	ld a,#TK_INTGR 
      00A0AD AE 00 02         [ 2] 6251 	ldw x,#GPIO_DDR
      00A0B0 81               [ 4] 6252 	ret 
      00A0B1                       6253 const_cr1:
      00A0B1 A6 04            [ 1] 6254 	ld a,#TK_INTGR 
      00A0B3 AE 00 03         [ 2] 6255 	ldw x,#GPIO_CR1
      00A0B6 81               [ 4] 6256 	ret 
      00A0B7                       6257 const_cr2:
      00A0B7 A6 04            [ 1] 6258 	ld a,#TK_INTGR 
      00A0B9 AE 00 04         [ 2] 6259 	ldw x,#GPIO_CR2
      00A0BC 81               [ 4] 6260 	ret 
                                   6261 ;-------------------------
                                   6262 ;  constant for port mode
                                   6263 ;  used by PMODE 
                                   6264 ;  input or output
                                   6265 ;------------------------
      00A0BD                       6266 const_output:
      00A0BD A6 04            [ 1] 6267 	ld a,#TK_INTGR 
      00A0BF AE 00 01         [ 2] 6268 	ldw x,#OUTP
      00A0C2 81               [ 4] 6269 	ret 
      00A0C3                       6270 const_input:
      00A0C3 A6 04            [ 1] 6271 	ld a,#TK_INTGR 
      00A0C5 AE 00 00         [ 2] 6272 	ldw x,#INP 
      00A0C8 81               [ 4] 6273 	ret 
                                   6274 ;-----------------------
                                   6275 ; memory area constants
                                   6276 ;-----------------------
      00A0C9                       6277 const_eeprom_base:
      00A0C9 A6 04            [ 1] 6278 	ld a,#TK_INTGR 
      00A0CB AE 40 00         [ 2] 6279 	ldw x,#EEPROM_BASE 
      00A0CE 81               [ 4] 6280 	ret 
                                   6281 
                                   6282 ;---------------------------
                                   6283 ; BASIC: DATA 
                                   6284 ; when the interpreter find 
                                   6285 ; a DATA line it skip it.
                                   6286 ;---------------------------
      00A0CF                       6287 data:
      00A0CF 55 00 04 00 02   [ 1] 6288 	mov in,count
      00A0D4 81               [ 4] 6289 	ret 
                                   6290 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   6291 ;---------------------------
                                   6292 ; BASIC: DATLN  *expr*
                                   6293 ; set DATA pointer at line# 
                                   6294 ; specified by *expr* 
                                   6295 ;---------------------------
      00A0D5                       6296 data_line:
      00A0D5 CD 90 E8         [ 4] 6297 	call expression
      00A0D8 A1 04            [ 1] 6298 	cp a,#TK_INTGR
      00A0DA 27 03            [ 1] 6299 	jreq 1$
      00A0DC CC 87 92         [ 2] 6300 	jp syntax_error 
      00A0DF CD 82 E8         [ 4] 6301 1$: call search_lineno
      00A0E2 5D               [ 2] 6302 	tnzw x 
      00A0E3 26 05            [ 1] 6303 	jrne 3$
      00A0E5 A6 05            [ 1] 6304 2$:	ld a,#ERR_NO_LINE 
      00A0E7 CC 87 94         [ 2] 6305 	jp tb_error
      00A0EA                       6306 3$: ; check if valid data line 
      00A0EA 90 93            [ 1] 6307     ldw y,x 
      00A0EC EE 04            [ 2] 6308 	ldw x,(4,x)
      00A0EE A3 A0 CF         [ 2] 6309 	cpw x,#data 
      00A0F1 26 F2            [ 1] 6310 	jrne 2$ 
      00A0F3 90 CF 00 07      [ 2] 6311 	ldw data_ptr,y
      00A0F7 90 E6 02         [ 1] 6312 	ld a,(2,y)
      00A0FA C7 00 0A         [ 1] 6313 	ld data_len,a 
      00A0FD 35 06 00 09      [ 1] 6314 	mov data_ofs,#FIRST_DATA_ITEM 
      00A101 81               [ 4] 6315 	ret
                                   6316 
                                   6317 ;---------------------------------
                                   6318 ; BASIC: RESTORE 
                                   6319 ; set data_ptr to first data line
                                   6320 ; if not DATA found pointer set to
                                   6321 ; zero 
                                   6322 ;---------------------------------
      00A102                       6323 restore:
      00A102 72 5F 00 07      [ 1] 6324 	clr data_ptr 
      00A106 72 5F 00 08      [ 1] 6325 	clr data_ptr+1
      00A10A 72 5F 00 09      [ 1] 6326 	clr data_ofs 
      00A10E 72 5F 00 0A      [ 1] 6327 	clr data_len
      00A112 CE 00 1F         [ 2] 6328 	ldw x,txtbgn
      00A115                       6329 data_search_loop: 	
      00A115 C3 00 21         [ 2] 6330 	cpw x,txtend
      00A118 24 17            [ 1] 6331 	jruge 9$
      00A11A 90 93            [ 1] 6332 	ldw y,x 
      00A11C EE 04            [ 2] 6333 	ldw x,(4,x)
      00A11E A3 A0 CF         [ 2] 6334 	cpw x,#data 
      00A121 26 1A            [ 1] 6335 	jrne try_next_line 
      00A123 90 CF 00 07      [ 2] 6336 	ldw data_ptr,y 
      00A127 90 E6 02         [ 1] 6337 	ld a,(2,y)
      00A12A C7 00 0A         [ 1] 6338 	ld data_len,a 
      00A12D 35 06 00 09      [ 1] 6339 	mov data_ofs,#FIRST_DATA_ITEM
      00A131 72 5D 00 0A      [ 1] 6340 9$:	tnz data_len 
      00A135 26 05            [ 1] 6341     jrne 10$
      00A137 A6 0C            [ 1] 6342 	ld a,#ERR_NO_DATA 
      00A139 CC 87 94         [ 2] 6343 	jp tb_error 
      00A13C 81               [ 4] 6344 10$:ret
      00A13D                       6345 try_next_line:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A13D 93               [ 1] 6346 	ldw x,y 
      00A13E E6 02            [ 1] 6347 	ld a,(2,x)
      00A140 C7 00 0E         [ 1] 6348 	ld acc8,a 
      00A143 72 5F 00 0D      [ 1] 6349 	clr acc16 
      00A147 72 BB 00 0D      [ 2] 6350 	addw x,acc16 
      00A14B 20 C8            [ 2] 6351 	jra data_search_loop
                                   6352 
                                   6353 
                                   6354 ;---------------------------------
                                   6355 ; BASIC: READ 
                                   6356 ; return next data item | 0 
                                   6357 ;---------------------------------
                           000001  6358 	CTX_BPTR=1 
                           000003  6359 	CTX_IN=3 
                           000004  6360 	CTX_COUNT=4 
                           000005  6361 	XSAVE=5
                           000006  6362 	VSIZE=6
      00A14D                       6363 read:
      0020CD                       6364 	_vars  VSIZE 
      00A14D 52 06            [ 2]    1     sub sp,#VSIZE 
      00A14F                       6365 read01:	
      00A14F C6 00 09         [ 1] 6366 	ld a,data_ofs
      00A152 C1 00 0A         [ 1] 6367 	cp a,data_len 
      00A155 27 37            [ 1] 6368 	jreq 2$ ; end of line  
      00A157 CD 94 95         [ 4] 6369 	call save_context
      00A15A CE 00 07         [ 2] 6370 	ldw x,data_ptr 
      00A15D CF 00 05         [ 2] 6371 	ldw basicptr,x 
      00A160 55 00 09 00 02   [ 1] 6372 	mov in,data_ofs 
      00A165 55 00 0A 00 04   [ 1] 6373 	mov count,data_len  
      00A16A CD 90 E8         [ 4] 6374 	call expression 
      00A16D A1 04            [ 1] 6375 	cp a,#TK_INTGR 
      00A16F 27 03            [ 1] 6376 	jreq 1$ 
      00A171 CC 87 92         [ 2] 6377 	jp syntax_error 
      00A174                       6378 1$:
      00A174 1F 05            [ 2] 6379 	ldw (XSAVE,SP),x
      00A176 CD 88 46         [ 4] 6380 	call next_token ; skip comma
      00A179 CE 00 05         [ 2] 6381 	ldw x,basicptr 
      00A17C CF 00 07         [ 2] 6382 	ldw data_ptr,x 
      00A17F 55 00 02 00 09   [ 1] 6383 	mov data_ofs,in 
      00A184 CD 94 A5         [ 4] 6384 	call rest_context
      00A187 1E 05            [ 2] 6385 	ldw x,(XSAVE,sp)
      00A189 A6 04            [ 1] 6386 	ld a,#TK_INTGR
      00210B                       6387 	_drop VSIZE 
      00A18B 5B 06            [ 2]    1     addw sp,#VSIZE 
      00A18D 81               [ 4] 6388 	ret 
      00A18E                       6389 2$: ; end of line reached 
      00A18E 90 CE 00 07      [ 2] 6390 	ldw y, data_ptr 
      00A192 72 5F 00 07      [ 1] 6391 	clr data_ptr
      00A196 72 5F 00 08      [ 1] 6392 	clr data_ptr+1   
      00A19A 72 5F 00 09      [ 1] 6393 	clr data_ofs 
      00A19E 72 5F 00 0A      [ 1] 6394 	clr data_len 
      00A1A2 CD A1 3D         [ 4] 6395 	call try_next_line 
      00A1A5 20 A8            [ 2] 6396 	jra read01
                                   6397 
                                   6398 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



                                   6399 ;---------------------------------
                                   6400 ; BASIC: SPIEN clkdiv, mode 
                                   6401 ; clkdiv -> {0..7} Fspi=Fclk/2^(n+1)
                                   6402 ; if clkdiv==-1 disable SPI
                                   6403 ; mode -> # master  | 0 slave 
                                   6404 ;--------------------------------- 
      00A1A7                       6405 spi_enable:
      00A1A7 CD 8F E8         [ 4] 6406 	call arg_list 
      00A1AA A1 02            [ 1] 6407 	cp a,#2
      00A1AC 27 03            [ 1] 6408 	jreq 1$
      00A1AE CC 87 92         [ 2] 6409 	jp syntax_error 
      00A1B1                       6410 1$: 
      00A1B1 72 12 50 C7      [ 1] 6411 	bset CLK_PCKENR1,#CLK_PCKENR1_SPI ; enable clock signal 
      00A1B5 CD 8D FE         [ 4] 6412 	call dswap
      00A1B8 CD 8D F1         [ 4] 6413 	call dpop 
      00A1BB A3 FF FF         [ 2] 6414 	cpw x,#-1
      00A1BE 27 1D            [ 1] 6415 	jreq spi_disable
      00A1C0 A6 08            [ 1] 6416 	ld a,#(1<<SPI_CR1_BR)
      00A1C2 42               [ 4] 6417 	mul x,a 
      00A1C3 9F               [ 1] 6418 	ld a,xl 
      00A1C4 C7 52 00         [ 1] 6419 	ld SPI_CR1,a 
      00A1C7 CD 8D F1         [ 4] 6420 	call dpop 
      00A1CA 27 04            [ 1] 6421 	jreq 2$
      00A1CC 72 14 52 00      [ 1] 6422 	bset SPI_CR1,#SPI_CR1_MSTR
      00A1D0 72 12 52 01      [ 1] 6423 2$: bset SPI_CR2,#SPI_CR2_SSM 
      00A1D4 72 10 52 01      [ 1] 6424     bset SPI_CR2,#SPI_CR2_SSI 
      00A1D8 72 1C 52 00      [ 1] 6425 	bset SPI_CR1,#SPI_CR1_SPE 	
      00A1DC 81               [ 4] 6426 	ret 
      00A1DD                       6427 spi_disable:
                                   6428 ; wait spi idle 
      00A1DD A6 82            [ 1] 6429 1$:	ld a,#0x82 
      00A1DF C4 52 03         [ 1] 6430 	and a,SPI_SR
      00A1E2 A1 02            [ 1] 6431 	cp a,#2 
      00A1E4 26 F7            [ 1] 6432 	jrne 1$
      00A1E6 72 1D 52 00      [ 1] 6433 	bres SPI_CR1,#SPI_CR1_SPE
      00A1EA 72 13 50 C7      [ 1] 6434 	bres CLK_PCKENR1,#CLK_PCKENR1_SPI 
      00A1EE 81               [ 4] 6435 	ret 
                                   6436 
      00A1EF                       6437 spi_clear_error:
      00A1EF A6 78            [ 1] 6438 	ld a,#0x78 
      00A1F1 C5 52 03         [ 1] 6439 	bcp a,SPI_SR 
      00A1F4 27 04            [ 1] 6440 	jreq 1$
      00A1F6 72 5F 52 03      [ 1] 6441 	clr SPI_SR 
      00A1FA 81               [ 4] 6442 1$: ret 
                                   6443 
      00A1FB                       6444 spi_send_byte:
      00A1FB 88               [ 1] 6445 	push a 
      00A1FC CD A1 EF         [ 4] 6446 	call spi_clear_error
      00A1FF 84               [ 1] 6447 	pop a 
      00A200 72 03 52 03 FB   [ 2] 6448 	btjf SPI_SR,#SPI_SR_TXE,.
      00A205 C7 52 04         [ 1] 6449 	ld SPI_DR,a
      00A208 72 01 52 03 FB   [ 2] 6450 	btjf SPI_SR,#SPI_SR_RXNE,.  
      00A20D C6 52 04         [ 1] 6451 	ld a,SPI_DR 
      00A210 81               [ 4] 6452 	ret 
                                   6453 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A211                       6454 spi_rcv_byte:
      00A211 A6 FF            [ 1] 6455 	ld a,#255
      00A213 72 01 52 03 E3   [ 2] 6456 	btjf SPI_SR,#SPI_SR_RXNE,spi_send_byte 
      00A218 C6 52 04         [ 1] 6457 	ld a,SPI_DR 
      00A21B 81               [ 4] 6458 	ret
                                   6459 
                                   6460 ;------------------------------
                                   6461 ; BASIC: SPIWR byte [,byte]
                                   6462 ; write 1 or more byte
                                   6463 ;------------------------------
      00A21C                       6464 spi_write:
      00A21C CD 90 E8         [ 4] 6465 	call expression
      00A21F A1 04            [ 1] 6466 	cp a,#TK_INTGR 
      00A221 27 03            [ 1] 6467 	jreq 1$
      00A223 CC 87 92         [ 2] 6468 	jp syntax_error 
      00A226                       6469 1$:	
      00A226 9F               [ 1] 6470 	ld a,xl 
      00A227 CD A1 FB         [ 4] 6471 	call spi_send_byte 
      00A22A CD 88 46         [ 4] 6472 	call next_token 
      00A22D A1 0D            [ 1] 6473 	cp a,#TK_COMMA 
      00A22F 26 02            [ 1] 6474 	jrne 2$ 
      00A231 20 E9            [ 2] 6475 	jra spi_write 
      00A233 4D               [ 1] 6476 2$:	tnz a 
      00A234 27 05            [ 1] 6477 	jreq 3$
      00A236 55 00 03 00 02   [ 1] 6478 	mov in,in.saved 
      00A23B 81               [ 4] 6479 3$:	ret 
                                   6480 
                                   6481 
                                   6482 ;-------------------------------
                                   6483 ; BASIC: SPIRD 	
                                   6484 ; read one byte from SPI 
                                   6485 ;-------------------------------
      00A23C                       6486 spi_read:
      00A23C CD A2 11         [ 4] 6487 	call spi_rcv_byte 
      00A23F 5F               [ 1] 6488 	clrw x 
      00A240 97               [ 1] 6489 	ld xl,a 
      00A241 A6 04            [ 1] 6490 	ld a,#TK_INTGR 
      00A243 81               [ 4] 6491 	ret 
                                   6492 
                                   6493 ;------------------------------
                                   6494 ; BASIC: SPISTA 
                                   6495 ; return SPI_SR value
                                   6496 ;------------------------------
      00A244                       6497 spi_status:
      00A244 C6 52 03         [ 1] 6498 	ld a,SPI_SR 
      00A247 72 5F 52 03      [ 1] 6499 	clr SPI_SR 
      00A24B 5F               [ 1] 6500 	clrw x 
      00A24C 97               [ 1] 6501 	ld xl,a 
      00A24D A6 04            [ 1] 6502 	ld a,#TK_INTGR 
      00A24F 81               [ 4] 6503 	ret 
                                   6504 
                                   6505 
                                   6506 ;------------------------------
                                   6507 ;      dictionary 
                                   6508 ; format:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



                                   6509 ;   link:   2 bytes 
                                   6510 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6511 ;   cmd_name: 16 byte max 
                                   6512 ;   code_address: 2 bytes 
                                   6513 ;------------------------------
                                   6514 	.macro _dict_entry len,name,cmd 
                                   6515 	.word LINK 
                                   6516 	LINK=.
                                   6517 name:
                                   6518 	.byte len 	
                                   6519 	.ascii "name"
                                   6520 	.word cmd 
                                   6521 	.endm 
                                   6522 
                           000000  6523 	LINK=0
                                   6524 ; respect alphabetic order for BASIC names from Z-A
                                   6525 ; this sort order is for a cleaner WORDS cmd output. 	
      00A250                       6526 kword_end:
      0021D0                       6527 	_dict_entry,5+F_IFUNC,XPEEK,xpeek 
      00A250 00 00                    1 	.word LINK 
                           0021D2     2 	LINK=.
      00A252                          3 XPEEK:
      00A252 45                       4 	.byte 5+F_IFUNC 	
      00A253 58 50 45 45 4B           5 	.ascii "XPEEK"
      00A258 95 DB                    6 	.word xpeek 
      0021DA                       6528 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      00A25A A2 52                    1 	.word LINK 
                           0021DC     2 	LINK=.
      00A25C                          3 XOR:
      00A25C 43                       4 	.byte 3+F_IFUNC 	
      00A25D 58 4F 52                 5 	.ascii "XOR"
      00A260 9E 0F                    6 	.word bit_xor 
      0021E2                       6529 	_dict_entry,5,WRITE,write  
      00A262 A2 5C                    1 	.word LINK 
                           0021E4     2 	LINK=.
      00A264                          3 WRITE:
      00A264 05                       4 	.byte 5 	
      00A265 57 52 49 54 45           5 	.ascii "WRITE"
      00A26A 9C 31                    6 	.word write 
      0021EC                       6530 	_dict_entry,5,WORDS,words 
      00A26C A2 64                    1 	.word LINK 
                           0021EE     2 	LINK=.
      00A26E                          3 WORDS:
      00A26E 05                       4 	.byte 5 	
      00A26F 57 4F 52 44 53           5 	.ascii "WORDS"
      00A274 9F 52                    6 	.word words 
      0021F6                       6531 	_dict_entry 4,WAIT,wait 
      00A276 A2 6E                    1 	.word LINK 
                           0021F8     2 	LINK=.
      00A278                          3 WAIT:
      00A278 04                       4 	.byte 4 	
      00A279 57 41 49 54              5 	.ascii "WAIT"
      00A27D 95 22                    6 	.word wait 
      0021FF                       6532 	_dict_entry,3+F_IFUNC,USR,usr
      00A27F A2 78                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]



                           002201     2 	LINK=.
      00A281                          3 USR:
      00A281 43                       4 	.byte 3+F_IFUNC 	
      00A282 55 53 52                 5 	.ascii "USR"
      00A285 9C E8                    6 	.word usr 
      002207                       6533 	_dict_entry,5,UNTIL,until 
      00A287 A2 81                    1 	.word LINK 
                           002209     2 	LINK=.
      00A289                          3 UNTIL:
      00A289 05                       4 	.byte 5 	
      00A28A 55 4E 54 49 4C           5 	.ascii "UNTIL"
      00A28F A0 47                    6 	.word until 
      002211                       6534 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00A291 A2 89                    1 	.word LINK 
                           002213     2 	LINK=.
      00A293                          3 UFLASH:
      00A293 46                       4 	.byte 6+F_IFUNC 	
      00A294 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      00A29A 9C E2                    6 	.word uflash 
      00221C                       6535 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      00A29C A2 93                    1 	.word LINK 
                           00221E     2 	LINK=.
      00A29E                          3 UBOUND:
      00A29E 46                       4 	.byte 6+F_IFUNC 	
      00A29F 55 42 4F 55 4E 44        5 	.ascii "UBOUND"
      00A2A5 91 A7                    6 	.word ubound 
      002227                       6536 	_dict_entry,4,TONE,tone  
      00A2A7 A2 9E                    1 	.word LINK 
                           002229     2 	LINK=.
      00A2A9                          3 TONE:
      00A2A9 04                       4 	.byte 4 	
      00A2AA 54 4F 4E 45              5 	.ascii "TONE"
      00A2AE 97 D0                    6 	.word tone 
      002230                       6537 	_dict_entry,2,TO,to
      00A2B0 A2 A9                    1 	.word LINK 
                           002232     2 	LINK=.
      00A2B2                          3 TO:
      00A2B2 02                       4 	.byte 2 	
      00A2B3 54 4F                    5 	.ascii "TO"
      00A2B5 96 39                    6 	.word to 
      002237                       6538 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      00A2B7 A2 B2                    1 	.word LINK 
                           002239     2 	LINK=.
      00A2B9                          3 TIMEOUT:
      00A2B9 47                       4 	.byte 7+F_IFUNC 	
      00A2BA 54 49 4D 45 4F 55 54     5 	.ascii "TIMEOUT"
      00A2C1 9F 9D                    6 	.word timeout 
      002243                       6539 	_dict_entry,5,TIMER,set_timer
      00A2C3 A2 B9                    1 	.word LINK 
                           002245     2 	LINK=.
      00A2C5                          3 TIMER:
      00A2C5 05                       4 	.byte 5 	
      00A2C6 54 49 4D 45 52           5 	.ascii "TIMER"
      00A2CB 9F 8C                    6 	.word set_timer 
      00224D                       6540 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]



      00A2CD A2 C5                    1 	.word LINK 
                           00224F     2 	LINK=.
      00A2CF                          3 TICKS:
      00A2CF 45                       4 	.byte 5+F_IFUNC 	
      00A2D0 54 49 43 4B 53           5 	.ascii "TICKS"
      00A2D5 9D B7                    6 	.word get_ticks 
      002257                       6541 	_dict_entry,4,STOP,stop 
      00A2D7 A2 CF                    1 	.word LINK 
                           002259     2 	LINK=.
      00A2D9                          3 STOP:
      00A2D9 04                       4 	.byte 4 	
      00A2DA 53 54 4F 50              5 	.ascii "STOP"
      00A2DE 97 C1                    6 	.word stop 
      002260                       6542 	_dict_entry,4,STEP,step 
      00A2E0 A2 D9                    1 	.word LINK 
                           002262     2 	LINK=.
      00A2E2                          3 STEP:
      00A2E2 04                       4 	.byte 4 	
      00A2E3 53 54 45 50              5 	.ascii "STEP"
      00A2E7 96 6C                    6 	.word step 
      002269                       6543 	_dict_entry,5,SPIWR,spi_write
      00A2E9 A2 E2                    1 	.word LINK 
                           00226B     2 	LINK=.
      00A2EB                          3 SPIWR:
      00A2EB 05                       4 	.byte 5 	
      00A2EC 53 50 49 57 52           5 	.ascii "SPIWR"
      00A2F1 A2 1C                    6 	.word spi_write 
      002273                       6544 	_dict_entry,6+F_IFUNC,SPISTA,spi_status
      00A2F3 A2 EB                    1 	.word LINK 
                           002275     2 	LINK=.
      00A2F5                          3 SPISTA:
      00A2F5 46                       4 	.byte 6+F_IFUNC 	
      00A2F6 53 50 49 53 54 41        5 	.ascii "SPISTA"
      00A2FC A2 44                    6 	.word spi_status 
      00227E                       6545 	_dict_entry,5,SPIEN,spi_enable 
      00A2FE A2 F5                    1 	.word LINK 
                           002280     2 	LINK=.
      00A300                          3 SPIEN:
      00A300 05                       4 	.byte 5 	
      00A301 53 50 49 45 4E           5 	.ascii "SPIEN"
      00A306 A1 A7                    6 	.word spi_enable 
      002288                       6546 	_dict_entry,5+F_IFUNC,SPIRD, spi_read 
      00A308 A3 00                    1 	.word LINK 
                           00228A     2 	LINK=.
      00A30A                          3 SPIRD:
      00A30A 45                       4 	.byte 5+F_IFUNC 	
      00A30B 53 50 49 52 44           5 	.ascii "SPIRD"
      00A310 A2 3C                    6 	.word spi_read 
      002292                       6547 	_dict_entry,5,SLEEP,sleep 
      00A312 A3 0A                    1 	.word LINK 
                           002294     2 	LINK=.
      00A314                          3 SLEEP:
      00A314 05                       4 	.byte 5 	
      00A315 53 4C 45 45 50           5 	.ascii "SLEEP"
      00A31A 9D 50                    6 	.word sleep 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]



      00229C                       6548 	_dict_entry,4+F_IFUNC,SIZE,size
      00A31C A3 14                    1 	.word LINK 
                           00229E     2 	LINK=.
      00A31E                          3 SIZE:
      00A31E 44                       4 	.byte 4+F_IFUNC 	
      00A31F 53 49 5A 45              5 	.ascii "SIZE"
      00A323 91 9D                    6 	.word size 
      0022A5                       6549     _dict_entry,4,SHOW,show 
      00A325 A3 1E                    1 	.word LINK 
                           0022A7     2 	LINK=.
      00A327                          3 SHOW:
      00A327 04                       4 	.byte 4 	
      00A328 53 48 4F 57              5 	.ascii "SHOW"
      00A32C 91 83                    6 	.word show 
      0022AE                       6550 	_dict_entry,4,SAVE,save
      00A32E A3 27                    1 	.word LINK 
                           0022B0     2 	LINK=.
      00A330                          3 SAVE:
      00A330 04                       4 	.byte 4 	
      00A331 53 41 56 45              5 	.ascii "SAVE"
      00A335 9A 20                    6 	.word save 
      0022B7                       6551 	_dict_entry 3,RUN,run
      00A337 A3 30                    1 	.word LINK 
                           0022B9     2 	LINK=.
      00A339                          3 RUN:
      00A339 03                       4 	.byte 3 	
      00A33A 52 55 4E                 5 	.ascii "RUN"
      00A33D 97 72                    6 	.word run 
      0022BF                       6552 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A33F A3 39                    1 	.word LINK 
                           0022C1     2 	LINK=.
      00A341                          3 RSHIFT:
      00A341 46                       4 	.byte 6+F_IFUNC 	
      00A342 52 53 48 49 46 54        5 	.ascii "RSHIFT"
      00A348 9E 4A                    6 	.word rshift 
      0022CA                       6553 	_dict_entry,3+F_IFUNC,RND,random 
      00A34A A3 41                    1 	.word LINK 
                           0022CC     2 	LINK=.
      00A34C                          3 RND:
      00A34C 43                       4 	.byte 3+F_IFUNC 	
      00A34D 52 4E 44                 5 	.ascii "RND"
      00A350 9E E8                    6 	.word random 
      0022D2                       6554 	_dict_entry,6,RETURN,return 
      00A352 A3 4C                    1 	.word LINK 
                           0022D4     2 	LINK=.
      00A354                          3 RETURN:
      00A354 06                       4 	.byte 6 	
      00A355 52 45 54 55 52 4E        5 	.ascii "RETURN"
      00A35B 97 54                    6 	.word return 
      0022DD                       6555 	_dict_entry,7,RESTORE,restore 
      00A35D A3 54                    1 	.word LINK 
                           0022DF     2 	LINK=.
      00A35F                          3 RESTORE:
      00A35F 07                       4 	.byte 7 	
      00A360 52 45 53 54 4F 52 45     5 	.ascii "RESTORE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal  A1-Bits]



      00A368 02 A3                    6 	.word restore 
      0022E9                       6556 	_dict_entry 6,REMARK,rem 
      00A36A 5F DF                    1 	.word LINK 
                           0022EB     2 	LINK=.
      00A36B                          3 REMARK:
      00A36B 06                       4 	.byte 6 	
      00A36C 52 45 4D 41 52 4B        5 	.ascii "REMARK"
      00A372 95 1C                    6 	.word rem 
      0022F4                       6557 	_dict_entry,6,REBOOT,cold_start
      00A374 A3 6B                    1 	.word LINK 
                           0022F6     2 	LINK=.
      00A376                          3 REBOOT:
      00A376 06                       4 	.byte 6 	
      00A377 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      00A37D 85 54                    6 	.word cold_start 
      0022FF                       6558 	_dict_entry,4+F_IFUNC,READ,read  
      00A37F A3 76                    1 	.word LINK 
                           002301     2 	LINK=.
      00A381                          3 READ:
      00A381 44                       4 	.byte 4+F_IFUNC 	
      00A382 52 45 41 44              5 	.ascii "READ"
      00A386 A1 4D                    6 	.word read 
      002308                       6559 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A388 A3 81                    1 	.word LINK 
                           00230A     2 	LINK=.
      00A38A                          3 QKEY:
      00A38A 44                       4 	.byte 4+F_IFUNC 	
      00A38B 51 4B 45 59              5 	.ascii "QKEY"
      00A38F 9C A4                    6 	.word qkey 
      002311                       6560 	_dict_entry,4+F_IFUNC,PRTI,const_porti 
      00A391 A3 8A                    1 	.word LINK 
                           002313     2 	LINK=.
      00A393                          3 PRTI:
      00A393 44                       4 	.byte 4+F_IFUNC 	
      00A394 50 52 54 49              5 	.ascii "PRTI"
      00A398 A0 99                    6 	.word const_porti 
      00231A                       6561 	_dict_entry,4+F_IFUNC,PRTH,const_porth 
      00A39A A3 93                    1 	.word LINK 
                           00231C     2 	LINK=.
      00A39C                          3 PRTH:
      00A39C 44                       4 	.byte 4+F_IFUNC 	
      00A39D 50 52 54 48              5 	.ascii "PRTH"
      00A3A1 A0 93                    6 	.word const_porth 
      002323                       6562 	_dict_entry,4+F_IFUNC,PRTG,const_portg 
      00A3A3 A3 9C                    1 	.word LINK 
                           002325     2 	LINK=.
      00A3A5                          3 PRTG:
      00A3A5 44                       4 	.byte 4+F_IFUNC 	
      00A3A6 50 52 54 47              5 	.ascii "PRTG"
      00A3AA A0 8D                    6 	.word const_portg 
      00232C                       6563 	_dict_entry,4+F_IFUNC,PRTF,const_portf
      00A3AC A3 A5                    1 	.word LINK 
                           00232E     2 	LINK=.
      00A3AE                          3 PRTF:
      00A3AE 44                       4 	.byte 4+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]



      00A3AF 50 52 54 46              5 	.ascii "PRTF"
      00A3B3 A0 87                    6 	.word const_portf 
      002335                       6564 	_dict_entry,4+F_IFUNC,PRTE,const_porte
      00A3B5 A3 AE                    1 	.word LINK 
                           002337     2 	LINK=.
      00A3B7                          3 PRTE:
      00A3B7 44                       4 	.byte 4+F_IFUNC 	
      00A3B8 50 52 54 45              5 	.ascii "PRTE"
      00A3BC A0 81                    6 	.word const_porte 
      00233E                       6565 	_dict_entry,4+F_IFUNC,PRTD,const_portd
      00A3BE A3 B7                    1 	.word LINK 
                           002340     2 	LINK=.
      00A3C0                          3 PRTD:
      00A3C0 44                       4 	.byte 4+F_IFUNC 	
      00A3C1 50 52 54 44              5 	.ascii "PRTD"
      00A3C5 A0 7B                    6 	.word const_portd 
      002347                       6566 	_dict_entry,4+F_IFUNC,PRTC,const_portc
      00A3C7 A3 C0                    1 	.word LINK 
                           002349     2 	LINK=.
      00A3C9                          3 PRTC:
      00A3C9 44                       4 	.byte 4+F_IFUNC 	
      00A3CA 50 52 54 43              5 	.ascii "PRTC"
      00A3CE A0 75                    6 	.word const_portc 
      002350                       6567 	_dict_entry,4+F_IFUNC,PRTB,const_portb
      00A3D0 A3 C9                    1 	.word LINK 
                           002352     2 	LINK=.
      00A3D2                          3 PRTB:
      00A3D2 44                       4 	.byte 4+F_IFUNC 	
      00A3D3 50 52 54 42              5 	.ascii "PRTB"
      00A3D7 A0 6F                    6 	.word const_portb 
      002359                       6568 	_dict_entry,4+F_IFUNC,PRTA,const_porta 
      00A3D9 A3 D2                    1 	.word LINK 
                           00235B     2 	LINK=.
      00A3DB                          3 PRTA:
      00A3DB 44                       4 	.byte 4+F_IFUNC 	
      00A3DC 50 52 54 41              5 	.ascii "PRTA"
      00A3E0 A0 69                    6 	.word const_porta 
      002362                       6569 	_dict_entry 5,PRINT,print 
      00A3E2 A3 DB                    1 	.word LINK 
                           002364     2 	LINK=.
      00A3E4                          3 PRINT:
      00A3E4 05                       4 	.byte 5 	
      00A3E5 50 52 49 4E 54           5 	.ascii "PRINT"
      00A3EA 94 2D                    6 	.word print 
      00236C                       6570 	_dict_entry,4+F_IFUNC,POUT,const_output
      00A3EC A3 E4                    1 	.word LINK 
                           00236E     2 	LINK=.
      00A3EE                          3 POUT:
      00A3EE 44                       4 	.byte 4+F_IFUNC 	
      00A3EF 50 4F 55 54              5 	.ascii "POUT"
      00A3F3 A0 BD                    6 	.word const_output 
      002375                       6571 	_dict_entry,4,POKE,poke 
      00A3F5 A3 EE                    1 	.word LINK 
                           002377     2 	LINK=.
      00A3F7                          3 POKE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]



      00A3F7 04                       4 	.byte 4 	
      00A3F8 50 4F 4B 45              5 	.ascii "POKE"
      00A3FC 95 B5                    6 	.word poke 
      00237E                       6572 	_dict_entry,4+F_IFUNC,PINP,const_input
      00A3FE A3 F7                    1 	.word LINK 
                           002380     2 	LINK=.
      00A400                          3 PINP:
      00A400 44                       4 	.byte 4+F_IFUNC 	
      00A401 50 49 4E 50              5 	.ascii "PINP"
      00A405 A0 C3                    6 	.word const_input 
      002387                       6573 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A407 A4 00                    1 	.word LINK 
                           002389     2 	LINK=.
      00A409                          3 PEEK:
      00A409 44                       4 	.byte 4+F_IFUNC 	
      00A40A 50 45 45 4B              5 	.ascii "PEEK"
      00A40E 95 C8                    6 	.word peek 
      002390                       6574 	_dict_entry,5,PMODE,pin_mode 
      00A410 A4 09                    1 	.word LINK 
                           002392     2 	LINK=.
      00A412                          3 PMODE:
      00A412 05                       4 	.byte 5 	
      00A413 50 4D 4F 44 45           5 	.ascii "PMODE"
      00A418 9E 73                    6 	.word pin_mode 
      00239A                       6575 	_dict_entry,5,PAUSE,pause 
      00A41A A4 12                    1 	.word LINK 
                           00239C     2 	LINK=.
      00A41C                          3 PAUSE:
      00A41C 05                       4 	.byte 5 	
      00A41D 50 41 55 53 45           5 	.ascii "PAUSE"
      00A422 9D 5B                    6 	.word pause 
      0023A4                       6576 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A424 A4 1C                    1 	.word LINK 
                           0023A6     2 	LINK=.
      00A426                          3 OR:
      00A426 42                       4 	.byte 2+F_IFUNC 	
      00A427 4F 52                    5 	.ascii "OR"
      00A429 9D F1                    6 	.word bit_or 
      0023AB                       6577 	_dict_entry,3+F_IFUNC,ODR,const_odr 
      00A42B A4 26                    1 	.word LINK 
                           0023AD     2 	LINK=.
      00A42D                          3 ODR:
      00A42D 43                       4 	.byte 3+F_IFUNC 	
      00A42E 4F 44 52                 5 	.ascii "ODR"
      00A431 A0 9F                    6 	.word const_odr 
      0023B3                       6578 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A433 A4 2D                    1 	.word LINK 
                           0023B5     2 	LINK=.
      00A435                          3 NOT:
      00A435 43                       4 	.byte 3+F_IFUNC 	
      00A436 4E 4F 54                 5 	.ascii "NOT"
      00A439 9F AA                    6 	.word func_not 
      0023BB                       6579 	_dict_entry,3,NEW,new
      00A43B A4 35                    1 	.word LINK 
                           0023BD     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]



      00A43D                          3 NEW:
      00A43D 03                       4 	.byte 3 	
      00A43E 4E 45 57                 5 	.ascii "NEW"
      00A441 99 5E                    6 	.word new 
      0023C3                       6580 	_dict_entry,4,NEXT,next 
      00A443 A4 3D                    1 	.word LINK 
                           0023C5     2 	LINK=.
      00A445                          3 NEXT:
      00A445 04                       4 	.byte 4 	
      00A446 4E 45 58 54              5 	.ascii "NEXT"
      00A44A 96 94                    6 	.word next 
      0023CC                       6581 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A44C A4 45                    1 	.word LINK 
                           0023CE     2 	LINK=.
      00A44E                          3 LSHIFT:
      00A44E 46                       4 	.byte 6+F_IFUNC 	
      00A44F 4C 53 48 49 46 54        5 	.ascii "LSHIFT"
      00A455 9E 2D                    6 	.word lshift 
      0023D7                       6582 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A457 A4 4E                    1 	.word LINK 
                           0023D9     2 	LINK=.
      00A459                          3 LOG:
      00A459 43                       4 	.byte 3+F_IFUNC 	
      00A45A 4C 4F 47                 5 	.ascii "LOG"
      00A45D 9F F6                    6 	.word log2 
      0023DF                       6583 	_dict_entry,4,LOAD,load 
      00A45F A4 59                    1 	.word LINK 
                           0023E1     2 	LINK=.
      00A461                          3 LOAD:
      00A461 04                       4 	.byte 4 	
      00A462 4C 4F 41 44              5 	.ascii "LOAD"
      00A466 9B 15                    6 	.word load 
      0023E8                       6584 	_dict_entry 4,LIST,list
      00A468 A4 61                    1 	.word LINK 
                           0023EA     2 	LINK=.
      00A46A                          3 LIST:
      00A46A 04                       4 	.byte 4 	
      00A46B 4C 49 53 54              5 	.ascii "LIST"
      00A46F 91 F1                    6 	.word list 
      0023F1                       6585 	_dict_entry 3,LET,let 
      00A471 A4 6A                    1 	.word LINK 
                           0023F3     2 	LINK=.
      00A473                          3 LET:
      00A473 03                       4 	.byte 3 	
      00A474 4C 45 54                 5 	.ascii "LET"
      00A477 91 C9                    6 	.word let 
      0023F9                       6586 	_dict_entry,3+F_IFUNC,KEY,key 
      00A479 A4 73                    1 	.word LINK 
                           0023FB     2 	LINK=.
      00A47B                          3 KEY:
      00A47B 43                       4 	.byte 3+F_IFUNC 	
      00A47C 4B 45 59                 5 	.ascii "KEY"
      00A47F 9C 9C                    6 	.word key 
      002401                       6587 	_dict_entry,7,IWDGREF,refresh_iwdg
      00A481 A4 7B                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]



                           002403     2 	LINK=.
      00A483                          3 IWDGREF:
      00A483 07                       4 	.byte 7 	
      00A484 49 57 44 47 52 45 46     5 	.ascii "IWDGREF"
      00A48B 9F F1                    6 	.word refresh_iwdg 
      00240D                       6588 	_dict_entry,6,IWDGEN,enable_iwdg
      00A48D A4 83                    1 	.word LINK 
                           00240F     2 	LINK=.
      00A48F                          3 IWDGEN:
      00A48F 06                       4 	.byte 6 	
      00A490 49 57 44 47 45 4E        5 	.ascii "IWDGEN"
      00A496 9F B9                    6 	.word enable_iwdg 
      002418                       6589 	_dict_entry,6+F_IFUNC,INVERT,invert 
      00A498 A4 8F                    1 	.word LINK 
                           00241A     2 	LINK=.
      00A49A                          3 INVERT:
      00A49A 46                       4 	.byte 6+F_IFUNC 	
      00A49B 49 4E 56 45 52 54        5 	.ascii "INVERT"
      00A4A1 A0 2F                    6 	.word invert 
      002423                       6590 	_dict_entry,5,INPUT,input_var  
      00A4A3 A4 9A                    1 	.word LINK 
                           002425     2 	LINK=.
      00A4A5                          3 INPUT:
      00A4A5 05                       4 	.byte 5 	
      00A4A6 49 4E 50 55 54           5 	.ascii "INPUT"
      00A4AB 94 B5                    6 	.word input_var 
      00242D                       6591 	_dict_entry,2,IF,if 
      00A4AD A4 A5                    1 	.word LINK 
                           00242F     2 	LINK=.
      00A4AF                          3 IF:
      00A4AF 02                       4 	.byte 2 	
      00A4B0 49 46                    5 	.ascii "IF"
      00A4B2 95 FB                    6 	.word if 
      002434                       6592 	_dict_entry,3+F_IFUNC,IDR,const_idr 
      00A4B4 A4 AF                    1 	.word LINK 
                           002436     2 	LINK=.
      00A4B6                          3 IDR:
      00A4B6 43                       4 	.byte 3+F_IFUNC 	
      00A4B7 49 44 52                 5 	.ascii "IDR"
      00A4BA A0 A5                    6 	.word const_idr 
      00243C                       6593 	_dict_entry,3,HEX,hex_base
      00A4BC A4 B6                    1 	.word LINK 
                           00243E     2 	LINK=.
      00A4BE                          3 HEX:
      00A4BE 03                       4 	.byte 3 	
      00A4BF 48 45 58                 5 	.ascii "HEX"
      00A4C2 91 93                    6 	.word hex_base 
      002444                       6594 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A4C4 A4 BE                    1 	.word LINK 
                           002446     2 	LINK=.
      00A4C6                          3 GPIO:
      00A4C6 44                       4 	.byte 4+F_IFUNC 	
      00A4C7 47 50 49 4F              5 	.ascii "GPIO"
      00A4CB 9C AF                    6 	.word gpio 
      00244D                       6595 	_dict_entry,4,GOTO,goto 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]



      00A4CD A4 C6                    1 	.word LINK 
                           00244F     2 	LINK=.
      00A4CF                          3 GOTO:
      00A4CF 04                       4 	.byte 4 	
      00A4D0 47 4F 54 4F              5 	.ascii "GOTO"
      00A4D4 97 19                    6 	.word goto 
      002456                       6596 	_dict_entry,5,GOSUB,gosub 
      00A4D6 A4 CF                    1 	.word LINK 
                           002458     2 	LINK=.
      00A4D8                          3 GOSUB:
      00A4D8 05                       4 	.byte 5 	
      00A4D9 47 4F 53 55 42           5 	.ascii "GOSUB"
      00A4DE 97 34                    6 	.word gosub 
      002460                       6597 	_dict_entry,6,FORGET,forget 
      00A4E0 A4 D8                    1 	.word LINK 
                           002462     2 	LINK=.
      00A4E2                          3 FORGET:
      00A4E2 06                       4 	.byte 6 	
      00A4E3 46 4F 52 47 45 54        5 	.ascii "FORGET"
      00A4E9 9B 50                    6 	.word forget 
      00246B                       6598 	_dict_entry,3,FOR,for 
      00A4EB A4 E2                    1 	.word LINK 
                           00246D     2 	LINK=.
      00A4ED                          3 FOR:
      00A4ED 03                       4 	.byte 3 	
      00A4EE 46 4F 52                 5 	.ascii "FOR"
      00A4F1 96 0F                    6 	.word for 
      002473                       6599 	_dict_entry,4,FCPU,fcpu 
      00A4F3 A4 ED                    1 	.word LINK 
                           002475     2 	LINK=.
      00A4F5                          3 FCPU:
      00A4F5 04                       4 	.byte 4 	
      00A4F6 46 43 50 55              5 	.ascii "FCPU"
      00A4FA 9E 67                    6 	.word fcpu 
      00247C                       6600 	_dict_entry,6+F_IFUNC,EEPROM,const_eeprom_base   
      00A4FC A4 F5                    1 	.word LINK 
                           00247E     2 	LINK=.
      00A4FE                          3 EEPROM:
      00A4FE 46                       4 	.byte 6+F_IFUNC 	
      00A4FF 45 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00A505 A0 C9                    6 	.word const_eeprom_base 
      002487                       6601 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A507 A4 FE                    1 	.word LINK 
                           002489     2 	LINK=.
      00A509                          3 DWRITE:
      00A509 06                       4 	.byte 6+F_CMD 	
      00A50A 44 57 52 49 54 45        5 	.ascii "DWRITE"
      00A510 98 D3                    6 	.word digital_write 
      002492                       6602 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A512 A5 09                    1 	.word LINK 
                           002494     2 	LINK=.
      00A514                          3 DREAD:
      00A514 45                       4 	.byte 5+F_IFUNC 	
      00A515 44 52 45 41 44           5 	.ascii "DREAD"
      00A51A 98 A1                    6 	.word digital_read 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]



      00249C                       6603 	_dict_entry,2,DO,do_loop
      00A51C A5 14                    1 	.word LINK 
                           00249E     2 	LINK=.
      00A51E                          3 DO:
      00A51E 02                       4 	.byte 2 	
      00A51F 44 4F                    5 	.ascii "DO"
      00A521 A0 40                    6 	.word do_loop 
      0024A3                       6604 	_dict_entry,3,DIR,directory 
      00A523 A5 1E                    1 	.word LINK 
                           0024A5     2 	LINK=.
      00A525                          3 DIR:
      00A525 03                       4 	.byte 3 	
      00A526 44 49 52                 5 	.ascii "DIR"
      00A529 9B 9B                    6 	.word directory 
      0024AB                       6605 	_dict_entry,3,DEC,dec_base
      00A52B A5 25                    1 	.word LINK 
                           0024AD     2 	LINK=.
      00A52D                          3 DEC:
      00A52D 03                       4 	.byte 3 	
      00A52E 44 45 43                 5 	.ascii "DEC"
      00A531 91 98                    6 	.word dec_base 
      0024B3                       6606 	_dict_entry,3+F_IFUNC,DDR,const_ddr 
      00A533 A5 2D                    1 	.word LINK 
                           0024B5     2 	LINK=.
      00A535                          3 DDR:
      00A535 43                       4 	.byte 3+F_IFUNC 	
      00A536 44 44 52                 5 	.ascii "DDR"
      00A539 A0 AB                    6 	.word const_ddr 
      0024BB                       6607 	_dict_entry,6,DATALN,data_line  
      00A53B A5 35                    1 	.word LINK 
                           0024BD     2 	LINK=.
      00A53D                          3 DATALN:
      00A53D 06                       4 	.byte 6 	
      00A53E 44 41 54 41 4C 4E        5 	.ascii "DATALN"
      00A544 A0 D5                    6 	.word data_line 
      0024C6                       6608 	_dict_entry,4,DATA,data  
      00A546 A5 3D                    1 	.word LINK 
                           0024C8     2 	LINK=.
      00A548                          3 DATA:
      00A548 04                       4 	.byte 4 	
      00A549 44 41 54 41              5 	.ascii "DATA"
      00A54D A0 CF                    6 	.word data 
      0024CF                       6609 	_dict_entry,3+F_IFUNC,CRL,const_cr1 
      00A54F A5 48                    1 	.word LINK 
                           0024D1     2 	LINK=.
      00A551                          3 CRL:
      00A551 43                       4 	.byte 3+F_IFUNC 	
      00A552 43 52 4C                 5 	.ascii "CRL"
      00A555 A0 B1                    6 	.word const_cr1 
      0024D7                       6610 	_dict_entry,3+F_IFUNC,CRH,const_cr2 
      00A557 A5 51                    1 	.word LINK 
                           0024D9     2 	LINK=.
      00A559                          3 CRH:
      00A559 43                       4 	.byte 3+F_IFUNC 	
      00A55A 43 52 48                 5 	.ascii "CRH"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 135.
Hexadecimal [24-Bits]



      00A55D A0 B7                    6 	.word const_cr2 
      0024DF                       6611 	_dict_entry,4+F_CFUNC,CHAR,char
      00A55F A5 59                    1 	.word LINK 
                           0024E1     2 	LINK=.
      00A561                          3 CHAR:
      00A561 84                       4 	.byte 4+F_CFUNC 	
      00A562 43 48 41 52              5 	.ascii "CHAR"
      00A566 9C 68                    6 	.word char 
      0024E8                       6612 	_dict_entry,3,BYE,bye 
      00A568 A5 61                    1 	.word LINK 
                           0024EA     2 	LINK=.
      00A56A                          3 BYE:
      00A56A 03                       4 	.byte 3 	
      00A56B 42 59 45                 5 	.ascii "BYE"
      00A56E 9D 06                    6 	.word bye 
      0024F0                       6613 	_dict_entry,5,BTOGL,bit_toggle
      00A570 A5 6A                    1 	.word LINK 
                           0024F2     2 	LINK=.
      00A572                          3 BTOGL:
      00A572 05                       4 	.byte 5 	
      00A573 42 54 4F 47 4C           5 	.ascii "BTOGL"
      00A578 95 76                    6 	.word bit_toggle 
      0024FA                       6614 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A57A A5 72                    1 	.word LINK 
                           0024FC     2 	LINK=.
      00A57C                          3 BTEST:
      00A57C 45                       4 	.byte 5+F_IFUNC 	
      00A57D 42 54 45 53 54           5 	.ascii "BTEST"
      00A582 95 8A                    6 	.word bit_test 
      002504                       6615 	_dict_entry,4,BSET,bit_set 
      00A584 A5 7C                    1 	.word LINK 
                           002506     2 	LINK=.
      00A586                          3 BSET:
      00A586 04                       4 	.byte 4 	
      00A587 42 53 45 54              5 	.ascii "BSET"
      00A58B 95 4D                    6 	.word bit_set 
      00250D                       6616 	_dict_entry,4,BRES,bit_reset
      00A58D A5 86                    1 	.word LINK 
                           00250F     2 	LINK=.
      00A58F                          3 BRES:
      00A58F 04                       4 	.byte 4 	
      00A590 42 52 45 53              5 	.ascii "BRES"
      00A594 95 61                    6 	.word bit_reset 
      002516                       6617 	_dict_entry,5,BREAK,break 
      00A596 A5 8F                    1 	.word LINK 
                           002518     2 	LINK=.
      00A598                          3 BREAK:
      00A598 05                       4 	.byte 5 	
      00A599 42 52 45 41 4B           5 	.ascii "BREAK"
      00A59E 99 12                    6 	.word break 
      002520                       6618 	_dict_entry,3+F_IFUNC,BIT,bitmask
      00A5A0 A5 98                    1 	.word LINK 
                           002522     2 	LINK=.
      00A5A2                          3 BIT:
      00A5A2 43                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 136.
Hexadecimal [24-Bits]



      00A5A3 42 49 54                 5 	.ascii "BIT"
      00A5A6 A0 13                    6 	.word bitmask 
      002528                       6619 	_dict_entry,3,AWU,awu 
      00A5A8 A5 A2                    1 	.word LINK 
                           00252A     2 	LINK=.
      00A5AA                          3 AWU:
      00A5AA 03                       4 	.byte 3 	
      00A5AB 41 57 55                 5 	.ascii "AWU"
      00A5AE 9D 6E                    6 	.word awu 
      002530                       6620 	_dict_entry,7,AUTORUN,autorun
      00A5B0 A5 AA                    1 	.word LINK 
                           002532     2 	LINK=.
      00A5B2                          3 AUTORUN:
      00A5B2 07                       4 	.byte 7 	
      00A5B3 41 55 54 4F 52 55 4E     5 	.ascii "AUTORUN"
      00A5BA 9D 0F                    6 	.word autorun 
      00253C                       6621 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A5BC A5 B2                    1 	.word LINK 
                           00253E     2 	LINK=.
      00A5BE                          3 ASC:
      00A5BE 43                       4 	.byte 3+F_IFUNC 	
      00A5BF 41 53 43                 5 	.ascii "ASC"
      00A5C2 9C 7C                    6 	.word ascii 
      002544                       6622 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A5C4 A5 BE                    1 	.word LINK 
                           002546     2 	LINK=.
      00A5C6                          3 AND:
      00A5C6 43                       4 	.byte 3+F_IFUNC 	
      00A5C7 41 4E 44                 5 	.ascii "AND"
      00A5CA 9D D3                    6 	.word bit_and 
      00254C                       6623 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A5CC A5 C6                    1 	.word LINK 
                           00254E     2 	LINK=.
      00A5CE                          3 ADCREAD:
      00A5CE 47                       4 	.byte 7+F_IFUNC 	
      00A5CF 41 44 43 52 45 41 44     5 	.ascii "ADCREAD"
      00A5D6 98 6B                    6 	.word analog_read 
      002558                       6624 	_dict_entry,5,ADCON,power_adc 
      00A5D8 A5 CE                    1 	.word LINK 
                           00255A     2 	LINK=.
      00A5DA                          3 ADCON:
      00A5DA 05                       4 	.byte 5 	
      00A5DB 41 44 43 4F 4E           5 	.ascii "ADCON"
      00A5E0 98 1E                    6 	.word power_adc 
      00A5E2                       6625 kword_dict:
      002562                       6626 	_dict_entry,3+F_IFUNC,ABS,abs
      00A5E2 A5 DA                    1 	.word LINK 
                           002564     2 	LINK=.
      00A5E4                          3 ABS:
      00A5E4 43                       4 	.byte 3+F_IFUNC 	
      00A5E5 41 42 53                 5 	.ascii "ABS"
      00A5E8 9D BD                    6 	.word abs 
                                   6627 	
                                   6628 
      00A600                       6629 	.bndry 128 ; align on FLASH block.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 137.
Hexadecimal [24-Bits]



                                   6630 ; free space for user application  
      00A600                       6631 user_space:
                                   6632 ; USR() function test
      00A600 89               [ 2] 6633 	pushw x 
      00A601 72 1A 50 0A      [ 1] 6634 	bset PC_ODR,#5 
      00A605 85               [ 2] 6635 	popw x 
      00A606 CD 9D 65         [ 4] 6636 	call pause02 
      00A609 72 1B 50 0A      [ 1] 6637 	bres PC_ODR,#5 
      00A60D 81               [ 4] 6638 	ret
                                   6639 
                                   6640 	.area FLASH_DRIVE (ABS)
      010000                       6641 	.org 0x10000
      010000                       6642 fdrive:
                                   6643 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 138.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002564 R   |   5 ADCON      00255A R
  5 ADCREAD    00254E R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
    ADC_CR1_=  000001     |     ADC_CR1_=  000004     |     ADC_CR1_=  000005 
    ADC_CR1_=  000006     |     ADC_CR2 =  005402     |     ADC_CR2_=  000003 
    ADC_CR2_=  000004     |     ADC_CR2_=  000005     |     ADC_CR2_=  000006 
    ADC_CR2_=  000001     |     ADC_CR3 =  005403     |     ADC_CR3_=  000007 
    ADC_CR3_=  000006     |     ADC_CSR =  005400     |     ADC_CSR_=  000006 
    ADC_CSR_=  000004     |     ADC_CSR_=  000000     |     ADC_CSR_=  000001 
    ADC_CSR_=  000002     |     ADC_CSR_=  000003     |     ADC_CSR_=  000007 
    ADC_CSR_=  000005     |     ADC_DRH =  005404     |     ADC_DRL =  005405 
    ADC_TDRH=  005406     |     ADC_TDRL=  005407     |     ADDR    =  000001 
    ADD_SPAC=  000003     |     AFR     =  004803     |     AFR0_ADC=  000000 
    AFR1_TIM=  000001     |     AFR2_CCO=  000002     |     AFR3_TIM=  000003 
    AFR4_TIM=  000004     |     AFR5_TIM=  000005     |     AFR6_I2C=  000006 
    AFR7_BEE=  000007     |   5 AND        002546 R   |     ARG_CNT =  000001 
    ARG_OFS =  000002     |   5 ASC        00253E R   |     ATTRIB  =  000002 
  5 AUTORUN    002532 R   |     AUTORUN_=  004000     |   5 AWU        00252A R
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
    BINARY  =  000001     |   5 BIT        002522 R   |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  000005     |   5 BREAK      002518 R
  5 BRES       00250F R   |   5 BSET       002506 R   |     BSIZE   =  000001 
    BSP     =  000008     |   5 BTEST      0024FC R   |   5 BTOGL      0024F2 R
    BTW     =  000001     |     BUFIDX  =  000003     |   5 BYE        0024EA R
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
  5 CHAR       0024E1 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
    CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0     |     CLK_ICKR=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 139.
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
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        0024D9 R
  5 CRL        0024D1 R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
    CTRL_C  =  000003     |     CTRL_D  =  000004     |     CTRL_E  =  000005 
    CTRL_F  =  000006     |     CTRL_G  =  000007     |     CTRL_H  =  000008 
    CTRL_I  =  000009     |     CTRL_J  =  00000A     |     CTRL_K  =  00000B 
    CTRL_L  =  00000C     |     CTRL_M  =  00000D     |     CTRL_N  =  00000E 
    CTRL_O  =  00000F     |     CTRL_P  =  000010     |     CTRL_Q  =  000011 
    CTRL_R  =  000012     |     CTRL_S  =  000013     |     CTRL_T  =  000014 
    CTRL_U  =  000015     |     CTRL_V  =  000016     |     CTRL_W  =  000017 
    CTRL_X  =  000018     |     CTRL_Y  =  000019     |     CTRL_Z  =  00001A 
    CTXT_SIZ=  000004     |     CTX_BPTR=  000001     |     CTX_COUN=  000004 
    CTX_IN  =  000003     |     CURR    =  000002     |     CX_BPTR =  000001 
    CX_CNT  =  000004     |     CX_IN   =  000003     |   5 DATA       0024C8 R
  5 DATALN     0024BD R   |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        0024B5 R
    DEBUG   =  000000     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        0024AD R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        0024A5 R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DO         00249E R   |   5 DREAD      002494 R   |     DSTACK_S=  000020 
  5 DWRITE     002489 R   |   5 EEPROM     00247E R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |     EOF     =  0000FF 
    ERR_BAD_=  00000A     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_D=  00000C     |     ERR_NO_L=  000005     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
  5 FCPU       002475 R   |     FF      =  00000C     |     FHSE    =  7A1200 
    FHSI    =  F42400     |     FIRST   =  000001     |     FIRST_DA=  000006 
    FLASH_BA=  008000     |     FLASH_CR=  00505A     |     FLASH_CR=  000002 
    FLASH_CR=  000000     |     FLASH_CR=  000003     |     FLASH_CR=  000001 
    FLASH_CR=  00505B     |     FLASH_CR=  000005     |     FLASH_CR=  000004 
    FLASH_CR=  000007     |     FLASH_CR=  000000     |     FLASH_CR=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 140.
Hexadecimal [24-Bits]

Symbol Table

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
    FLOOP   =  000002     |     FLSI    =  01F400     |   5 FOR        00246D R
  5 FORGET     002462 R   |     FRUN    =  000000     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FTRAP   =  000001     |     F_CFUNC =  000080 
    F_CMD   =  000000     |     F_CONST =  0000C0     |     F_IFUNC =  000040 
  5 GOSUB      002458 R   |   5 GOTO       00244F R   |   5 GPIO       002446 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   5 HEX        00243E R   |     HSECNT  =  004809 
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
  5 IDR        002436 R   |   5 IF         00242F R   |     IN      =  000005 
    INCR    =  000001     |     INP     =  000000     |   5 INPUT      002425 R
    INPUT_DI=  000000     |     INPUT_EI=  000001     |     INPUT_FL=  000000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 141.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  00801C     |     INT_VECT=  008020     |     INT_VECT=  008024 
    INT_VECT=  008068     |     INT_VECT=  008054     |     INT_VECT=  008000 
    INT_VECT=  008030     |     INT_VECT=  008038     |     INT_VECT=  008034 
    INT_VECT=  008040     |     INT_VECT=  00803C     |     INT_VECT=  008048 
    INT_VECT=  008044     |     INT_VECT=  008064     |     INT_VECT=  008008 
    INT_VECT=  008004     |     INT_VECT=  008050     |     INT_VECT=  00804C 
    INT_VECT=  00805C     |     INT_VECT=  008058     |   5 INVERT     00241A R
    INW     =  000003     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
  5 IWDGEN     00240F R   |   5 IWDGREF    002403 R   |     IWDG_KEY=  000055 
    IWDG_KEY=  0000CC     |     IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        0023FB R
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  5 LET        0023F3 R   |     LINENO  =  000005     |   5 LINK    =  002564 R
  5 LIST       0023EA R   |     LL      =  000002     |     LLEN    =  000002 
    LL_HB   =  000001     |     LN_PTR  =  000005     |   5 LOAD       0023E1 R
  5 LOG        0023D9 R   |   5 LSHIFT     0023CE R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        0023BD R
  5 NEXT       0023C5 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NL      =  00000A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   5 NOT        0023B5 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000000 R
  5 ODR        0023AD R   |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         0023A6 R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
    PAD_SIZE=  000028     |   5 PAUSE      00239C R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       002389 R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 142.
Hexadecimal [24-Bits]

Symbol Table

    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       002380 R   |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      002392 R
  5 POKE       002377 R   |   5 POUT       00236E R   |     PREV    =  000001 
  5 PRINT      002364 R   |     PROD    =  000002     |   5 PRTA       00235B R
  5 PRTB       002352 R   |   5 PRTC       002349 R   |   5 PRTD       002340 R
  5 PRTE       002337 R   |   5 PRTF       00232E R   |   5 PRTG       002325 R
  5 PRTH       00231C R   |   5 PRTI       002313 R   |   5 QKEY       00230A R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  5 READ       002301 R   |   5 REBOOT     0022F6 R   |     RELOP   =  000005 
  5 REMARK     0022EB R   |   5 RESTORE    0022DF R   |     RETL1   =  000001 
  5 RETURN     0022D4 R   |     RET_ADDR=  000003     |     RET_INW =  000005 
  5 RND        0022CC R   |     ROP     =  004800     |   5 RSHIFT     0022C1 R
    RST_SR  =  0050B3     |   5 RUN        0022B9 R   |     RXCHAR  =  000001 
  5 SAVE       0022B0 R   |     SDIVD   =  000002     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       0022A7 R
    SIGN    =  000001     |   5 SIZE       00229E R   |     SKIP    =  000005 
  5 SLEEP      002294 R   |     SPACE   =  000020     |   5 SPIEN      002280 R
  5 SPIRD      00228A R   |   5 SPISTA     002275 R   |   5 SPIWR      00226B R
    SPI_CR1 =  005200     |     SPI_CR1_=  000003     |     SPI_CR1_=  000000 
    SPI_CR1_=  000001     |     SPI_CR1_=  000007     |     SPI_CR1_=  000002 
    SPI_CR1_=  000006     |     SPI_CR2 =  005201     |     SPI_CR2_=  000007 
    SPI_CR2_=  000006     |     SPI_CR2_=  000005     |     SPI_CR2_=  000004 
    SPI_CR2_=  000002     |     SPI_CR2_=  000000     |     SPI_CR2_=  000001 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_SR_B=  000007 
    SPI_SR_C=  000004     |     SPI_SR_M=  000005     |     SPI_SR_O=  000006 
    SPI_SR_R=  000000     |     SPI_SR_T=  000001     |     SPI_SR_W=  000003 
    SPI_TXCR=  005207     |     SQUOT   =  000001     |     SRC     =  000003 
    STACK_EM=  0017FF     |     STACK_SI=  000080     |   5 STEP       002262 R
  5 STOP       002259 R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      00224F R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 143.
Hexadecimal [24-Bits]

Symbol Table

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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 144.
Hexadecimal [24-Bits]

Symbol Table

    TIM4_PSC=  000000     |     TIM4_PSC=  000007     |     TIM4_PSC=  000004 
    TIM4_PSC=  000001     |     TIM4_PSC=  000005     |     TIM4_PSC=  000002 
    TIM4_PSC=  000006     |     TIM4_PSC=  000003     |     TIM4_PSC=  000000 
    TIM4_PSC=  000001     |     TIM4_PSC=  000002     |     TIM4_SR =  005342 
    TIM4_SR_=  000000     |   5 TIMEOUT    002239 R   |   5 TIMER      002245 R
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_ARRAY=  000002 
    TK_CFUNC=  000008     |     TK_CHAR =  000003     |     TK_CMD  =  000006 
    TK_COLON=  000001     |     TK_COMMA=  00000D     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000007 
    TK_INTGR=  000004     |     TK_LE   =  000036     |     TK_LPARE=  00000B 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  00000A     |     TK_RPARE=  00000C 
    TK_SHARP=  00000E     |     TK_VAR  =  000005     |   5 TO         002232 R
  5 TONE       002229 R   |   5 Timer4Up   000026 R   |     U8      =  000003 
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
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     00221E R
  5 UBTN_Han   000069 R   |   5 UFLASH     002213 R   |   5 UNTIL      002209 R
  5 USER_ABO   000071 R   |     USE_BLOC=  000000     |   5 USR        002201 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 Uart1RxH   00000F R   |   5 UserButt   00003C R   |     VSIZ    =  000002 
    VSIZE   =  000006     |     VT      =  00000B     |   5 WAIT       0021F8 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 145.
Hexadecimal [24-Bits]

Symbol Table

    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH   =  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   5 WORDS      0021EE R
  5 WRITE      0021E4 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XADR    =  000001     |     XMASK   =  000001     |   5 XOR        0021DC R
  5 XPEEK      0021D2 R   |     XSAVE   =  000005     |     YSAVE   =  000003 
  5 abs        001D3D R   |   1 acc16      00000C R   |   1 acc24      00000B R
  1 acc8       00000D R   |   5 accept_c   0009B9 R   |   5 add        000E29 R
  5 analog_r   0017EB R   |   5 ansi_seq   00097B R   |   5 arduino_   001E48 R
  5 arg_list   000F68 R   |   1 array_si   000023 R   |   5 ascii      001BFC R
  5 at_tst     000B8C R   |   5 atoi24     000C9F R   |   5 atoi_exi   000D0D R
  5 autorun    001C8F R   |   5 autorun_   0005C7 R   |   5 awu        001CEE R
  5 awu02      001CF8 R   |   5 bad_port   001C5D R   |   1 base       00000A R
  1 basicptr   000004 R   |   5 beep       00175A R   |   5 bin_exit   000A90 R
  5 bit_and    001D53 R   |   5 bit_or     001D71 R   |   5 bit_rese   0014E1 R
  5 bit_set    0014CD R   |   5 bit_test   00150A R   |   5 bit_togg   0014F6 R
  5 bit_xor    001D8F R   |   5 bitmask    001F93 R   |   5 bkslsh_t   000B37 R
  5 bksp       0001D0 R   |   5 break      001892 R   |   5 break_po   0018C0 R
  5 bye        001C86 R   |   5 char       001BE8 R   |   5 check_fu   000365 R
  5 clear_ba   0005DC R   |   5 clear_va   00046F R   |   5 clock_in   00008C R
  5 cmd_line   000784 R   |   5 cmd_name   000ED4 R   |   5 cmp_name   001934 R
  5 cold_sta   0004D4 R   |   5 colon_ts   000B60 R   |   5 comma_ts   000B6B R
  5 compile    000374 R   |   5 const_cr   002031 R   |   5 const_cr   002037 R
  5 const_dd   00202B R   |   5 const_ee   002049 R   |   5 const_id   002025 R
  5 const_in   002043 R   |   5 const_od   00201F R   |   5 const_ou   00203D R
  5 const_po   001FE9 R   |   5 const_po   001FEF R   |   5 const_po   001FF5 R
  5 const_po   001FFB R   |   5 const_po   002001 R   |   5 const_po   002007 R
  5 const_po   00200D R   |   5 const_po   002013 R   |   5 const_po   002019 R
  5 convert_   000A18 R   |   1 count      000003 R   |   5 cp_loop    000F17 R
  5 create_g   0002C4 R   |   5 cstk_pro   000DF2 R   |   5 dash_tst   000B81 R
  5 data       00204F R   |   1 data_len   000009 R   |   5 data_lin   002055 R
  1 data_ofs   000008 R   |   1 data_ptr   000006 R   |   5 data_sea   002095 R
  5 ddrop      000D98 R   |   5 ddrop_n    000DB5 R   |   5 ddup       000DA1 R
  5 dec_base   001118 R   |   5 del_back   0009AA R   |   5 del_line   00028C R
  5 del_ln     00099B R   |   5 delete     0001E0 R   |   5 digital_   001821 R
  5 digital_   001853 R   |   5 dir_loop   001B27 R   |   5 director   001B1B R
  5 divide     000E7F R   |   5 divu24_8   000908 R   |   5 do_loop    001FC0 R
  5 dotr       000DFC R   |   5 dotr_loo   000E11 R   |   5 dots       000DC8 R
  5 dpick      000DA1 R   |   5 dpop       000D71 R   |   5 dpush      000D64 R
  5 drive_fr   001BA4 R   |   3 dstack     001760 R   |   3 dstack_e   001780 R
  5 dstk_pro   000DBE R   |   1 dstkptr    00001C R   |   5 dswap      000D7E R
  5 enable_i   001F39 R   |   5 eql_tst    000BEC R   |   5 equal      0013A0 R
  5 err_bad_   0006BB R   |   5 err_cmd_   00067C R   |   5 err_div0   00063E R
  5 err_dupl   000697 R   |   5 err_math   000624 R   |   5 err_mem_   000607 R
  5 err_msg    0005ED R   |   5 err_no_a   0006C8 R   |   5 err_no_d   0006FC R
  5 err_no_l   00064E R   |   5 err_not_   0006A9 R   |   5 err_run_   000665 R
  5 err_synt   000615 R   |   5 escaped    000A2D R   |   5 expect     000F5B R
  5 expr_exi   0010A9 R   |   5 expressi   001068 R   |   5 factor     000FC3 R
  1 farptr     000016 R   |   5 fcpu       001DE7 R   |   7 fdrive     010000 R
  5 fetch      000DA1 R   |   1 ffree      000019 R   |   5 file_cou   001B9C R
  5 final_te   000975 R   |   5 first_li   00119C R   |   1 flags      000025 R
  5 for        00158F R   |   5 forget     001AD0 R   |   1 free_ram   00005C R
  5 func_arg   000F8C R   |   5 func_not   001F2A R   |   5 ge         0013A2 R
  5 get_arra   000F9C R   |   5 get_targ   001683 R   |   5 get_tick   001D37 R
  5 get_toke   000AD2 R   |   5 getc       0001BC R   |   5 gosub      0016B4 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 146.
Hexadecimal [24-Bits]

Symbol Table

  5 goto       001699 R   |   5 gpio       001C2F R   |   5 gt         00139E R
  5 gt_tst     000BF7 R   |   5 hex_base   001113 R   |   5 if         00157B R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
  5 incr_far   0018E9 R   |   5 input_ex   001499 R   |   5 input_lo   001437 R
  5 input_va   001435 R   |   5 insert_l   0002FD R   |   5 insert_l   000362 R
  5 interp     000758 R   |   5 interp_l   000798 R   |   5 invert     001FAF R
  5 is_alpha   00047D R   |   5 is_digit   000C8A R   |   5 itoa       0008C1 R
  5 itoa_loo   0008D9 R   |   5 jp_to_ta   0016A7 R   |   5 key        001C1C R
  5 kword_di   002562 R   |   5 kword_en   0021D0 R   |   5 last_lin   0011A5 R
  5 le         0013A7 R   |   5 leading_   001F83 R   |   5 left_arr   00097B R
  5 let        001149 R   |   5 let02      001153 R   |   5 lines_sk   0011AA R
  5 list       001171 R   |   5 list_exi   0011F3 R   |   5 list_sta   0011CD R
  5 load       001A95 R   |   5 load_aut   0005A3 R   |   5 load_fil   001A64 R
  5 log2       001F76 R   |   5 logical_   001F20 R   |   5 loop_bac   00165C R
  1 loop_dep   000022 R   |   5 loop_don   001671 R   |   5 lshift     001DAD R
  5 lt         0013A5 R   |   5 lt_tst     000C30 R   |   5 modulo     000EC3 R
  5 move       000226 R   |   5 move_dow   000244 R   |   5 move_exi   000265 R
  5 move_loo   000249 R   |   5 move_up    000236 R   |   5 mul_char   00138F R
  5 multiply   000E37 R   |   5 mulu24_8   000D11 R   |   5 nbr_tst    000B0D R
  5 ne         0013AA R   |   5 neg_acc2   000930 R   |   5 new        0018DE R
  5 next       001614 R   |   5 next_tok   0007C6 R   |   5 no_match   000F29 R
  5 none       000AD2 R   |   5 other      000C68 R   |   3 pad        001738 R
  5 parse_bi   000A70 R   |   5 parse_in   000A35 R   |   5 parse_ke   000A98 R
  5 parse_qu   0009DD R   |   5 pause      001CDB R   |   5 pause02    001CE5 R
  5 peek       001548 R   |   5 pin_mode   001DF3 R   |   5 plus_tst   000BC0 R
  5 poke       001535 R   |   5 power_ad   00179E R   |   5 prcnt_ts   000BE1 R
  5 print      0013AD R   |   5 print_ex   001409 R   |   5 print_in   000863 R
  5 prt_basi   001246 R   |   5 prt_cmd_   0011F6 R   |   5 prt_loop   0013B1 R
  5 prt_quot   00120A R   |   5 prti24     00081B R   |   1 ptr16      000017 R
  1 ptr8       000018 R   |   5 putc       0001B3 R   |   5 puts       0001C6 R
  5 qkey       001C24 R   |   5 qmark_ts   000B97 R   |   5 random     001E68 R
  5 read       0020CD R   |   5 read01     0020CF R   |   5 readln     000953 R
  5 readln_l   000959 R   |   5 readln_q   0009CE R   |   5 refresh_   001F71 R
  5 rel_exit   001100 R   |   5 relation   0010AC R   |   5 relop_st   001392 R
  5 rem        00149C R   |   5 reprint    00097B R   |   5 reset_co   0013AF R
  5 rest_con   001425 R   |   5 restore    002082 R   |   5 return     0016D4 R
  5 right_ar   00097B R   |   5 rparnt_t   000B55 R   |   5 rshift     001DCA R
  5 run        0016F2 R   |   5 run_it     00171A R   |   1 rx_char    000027 R
  5 save       0019A0 R   |   5 save_con   001415 R   |   5 search_d   000F06 R
  5 search_e   000F57 R   |   5 search_f   001955 R   |   5 search_l   000268 R
  5 search_l   000270 R   |   5 search_n   000F0A R   |   1 seedx      000012 R
  1 seedy      000014 R   |   5 seek_fdr   0018F7 R   |   5 select_p   001E38 R
  5 set_time   001F0C R   |   5 sharp_ts   000B76 R   |   5 show       001103 R
  5 single_c   00138B R   |   5 size       00111D R   |   5 skip       000D4B R
  5 slash_ts   000BD6 R   |   5 sleep      001CD0 R   |   5 software   00048E R
  5 spaces     0001EE R   |   5 spi_clea   00216F R   |   5 spi_disa   00215D R
  5 spi_enab   002127 R   |   5 spi_rcv_   002191 R   |   5 spi_read   0021BC R
  5 spi_send   00217B R   |   5 spi_stat   0021C4 R   |   5 spi_writ   00219C R
  3 stack_fu   001780 R   |   3 stack_un   001800 R   |   5 star_tst   000BCB R
  5 step       0015EC R   |   5 stop       001741 R   |   5 store      000DAB R
  5 store_lo   001601 R   |   5 str_matc   000F38 R   |   5 str_tst    000AFC R
  5 strcmp     000207 R   |   5 strcpy     000218 R   |   5 strlen     0001FA R
  5 substrac   000E31 R   |   5 syntax_e   000712 R   |   1 tab_widt   000026 R
  5 tb_error   000714 R   |   5 term       00101B R   |   5 term01     001024 R
  5 term_exi   001065 R   |   3 tib        0016E8 R   |   5 tick_tst   000BAE R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 147.
Hexadecimal [24-Bits]

Symbol Table

  1 ticks      00000E R   |   5 timeout    001F1D R   |   1 timer      000010 R
  5 timer2_i   0000A2 R   |   5 timer4_i   0000AF R   |   5 to         0015B9 R
  5 to_upper   000C93 GR  |   5 token_ch   000C77 R   |   5 token_ex   000C87 R
  5 tone       001750 R   |   5 try_next   0020BD R   |   1 txtbgn     00001E R
  1 txtend     000020 R   |   5 uart1_in   000178 R   |   5 uart1_se   000188 R
  5 ubound     001127 R   |   5 uflash     001C62 R   |   5 unget_to   000D5E R
  5 unlock_e   0000C4 R   |   5 unlock_f   0000D2 R   |   5 until      001FC7 R
  5 user_int   00004F R   |   5 user_spa   002580 R   |   5 usr        001C68 R
  1 vars       000028 R   |   5 wait       0014A2 R   |   5 warm_ini   000586 R
  5 warm_sta   000755 R   |   5 words      001ED2 R   |   5 write      001BB1 R
  5 write_bl   000155 R   |   5 write_by   0000E0 R   |   5 write_ee   00011C R
  5 write_ex   000150 R   |   5 write_fl   000106 R   |   5 xpeek      00155B R

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

