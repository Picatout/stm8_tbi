ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 1.
Hexadecimal [24-Bits]



                                      1 ;;
                                      2 ; Copyright Jacques Deschênes 2019 
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
                                     34     .list 
                                     35 
      000001                         36 _dbg 
                           000001     1     DEBUG=1
                                     37 
                                     38 ;--------------------------------------
                                     39     .area DATA 
                                     40 ;--------------------------------------	
                                     41 
                           000050    42 	TIB_SIZE=80
                           000028    43     PAD_SIZE=40
                           000040    44 	DSTACK_SIZE=64 
                           000080    45 	STACK_SIZE=128
                           0017FF    46 	STACK_EMPTY=RAM_SIZE-1  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                           000000    47 	FRUN=0 ; flags run code in variable flags
                           000001    48 	FTRAP=1 ; inside trap handler 
                           000002    49 	FFOR=2 ; FOR loop in preparation 
                           000003    50 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    51 	FBREAK=4 ; break point flag 
                           000005    52 	FCOMP=5  ; compiling flags 
                                     53 
      000002                         54 in.w:  .blkb 1 ; parser position in text line
      000003                         55 in:    .blkb 1 ; low byte of in.w
      000004                         56 count: .blkb 1 ; length of string in text line  
      000006                         57 basicptr:  .blkb 2  ; point to text buffer 
      000008                         58 lineno: .blkb 2  ; BASIC line number 
      000009                         59 base:  .blkb 1 ; nemeric base used to print integer 
      00000A                         60 acc24: .blkb 1 ; 24 accumulator
      00000B                         61 acc16: .blkb 1
      00000C                         62 acc8:  .blkb 1
      00000E                         63 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000010                         64 seedx: .blkw 1  ; xorshift 16 seed x 
      000012                         65 seedy: .blkw 1  ; xorshift 16 seed y 
      000014                         66 in.w.saved: .blkw 1 ; set by get_token before parsing next token, used by unget_token
      000015                         67 farptr: .blkb 1 ; far pointer used by file system
      000016                         68 ptr16:  .blkb 1 ; middle byte of farptr
      000017                         69 ptr8:   .blkb 1 ; least byte of farptr 
      00001A                         70 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001C                         71 dstkptr: .blkw 1  ; data stack pointer 
      00001E                         72 txtbgn: .ds 2 ; BASIC text beginning address 
      000020                         73 txtend: .ds 2 ; BASIC text end address 
      000021                         74 loop_depth: .ds 1 ; FOR loop depth, level of nested loop.  
      000023                         75 array_addr: .ds 2 ; address of @ array 
      000025                         76 array_size: .ds 2 ; array size 
      000026                         77 flags: .ds 1 ; boolean flags
      000027                         78 tab_width: .ds 1 ; print colon width (4)
      00005B                         79 vars: .ds 2*26 ; BASIC variables A-Z, keep it as but last .
                                     80 ; keep as last variable 
      0016C8                         81 free_ram: ; from here RAM free for BASIC text 
                                     82 
                                     83 ;-----------------------------------
                                     84     .area SSEG (ABS)
                                     85 ;-----------------------------------	
      0016C8                         86     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE-DSTACK_SIZE 
      001718                         87 tib: .ds TIB_SIZE             ; transaction input buffer
      001740                         88 pad: .ds PAD_SIZE             ; working buffer
      001780                         89 dstack: .ds DSTACK_SIZE 	  ; data stack used by FOR...NEXT 
      001780                         90 dstack_unf: ; dstack underflow ; data stack bottom 
      001800                         91 stack_full: .ds STACK_SIZE   ; control stack 
      001800                         92 stack_unf: ; stack underflow ; control_stack bottom 
                                     93 
                                     94 
                                     95 ;--------------------------------------
                                     96     .area HOME 
                                     97 ;--------------------------------------
      008000 82 00 85 D7             98     int cold_start
                           000001    99 .if DEBUG
      008004 82 00 80 8A            100 	int TrapHandler 		;TRAP  software interrupt
                           000000   101 .else
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                    102 	int NonHandledInterrupt ;TRAP  software interrupt
                                    103 .endif
      008008 82 00 80 89            104 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 89            105 	int NonHandledInterrupt ;int1 AWU   auto wake up from halt
      008010 82 00 80 89            106 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 89            107 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 89            108 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 89            109 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 89            110 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 A5            111 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 89            112 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 89            113 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 89            114 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 89            115 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 89            116 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 89            117 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 89            118 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 89            119 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 89            120 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 89            121 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 89            122 	int NonHandledInterrupt ;int18 UART1 RX full
      008054 82 00 80 89            123 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 89            124 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 89            125 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 89            126 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 99            127 	int Timer4UpdateHandler	;int23 TIM4 update/overflow used as msec ticks counter
      008068 82 00 80 89            128 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 89            129 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 89            130 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 89            131 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 89            132 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 89            133 	int NonHandledInterrupt ;int29  not used
                                    134 
                                    135 ;---------------------------------------
                                    136     .area CODE
                                    137 ;---------------------------------------
                           000001   138 .if DEBUG
      008080 53 54 4D 38 5F 54 42   139 .asciz "STM8_TBI" ; I like to put module name here.
             49 00
                                    140 .endif 
                                    141 
      008089                        142 NonHandledInterrupt:
      008089 71                     143     .byte 0x71  ; reinitialize MCU
                                    144 
                                    145 
                                    146 ;------------------------------------
                                    147 ; software interrupt handler  
                                    148 ;------------------------------------
                           000001   149 .if DEBUG 
      00808A                        150 TrapHandler:
      00808A 72 12 00 25      [ 1]  151 	bset flags,#FTRAP 
      00808E CD 89 26         [ 4]  152 	call print_registers
      008091 CD 8B 95         [ 4]  153 	call cmd_itf
      008094 72 13 00 25      [ 1]  154 	bres flags,#FTRAP 	
      008098 80               [11]  155 	iret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    156 .endif 
                                    157 
      008099                        158 Timer4UpdateHandler:
      008099 72 5F 53 42      [ 1]  159 	clr TIM4_SR 
      00809D CE 00 0C         [ 2]  160 	ldw x,ticks
      0080A0 5C               [ 1]  161 	incw x
      0080A1 CF 00 0C         [ 2]  162 	ldw ticks,x 
      0080A4 80               [11]  163 	iret 
                                    164 
                                    165 
                                    166 ;------------------------------------
                                    167 ; Triggered by pressing USER UserButton 
                                    168 ; on NUCLEO card.
                                    169 ;------------------------------------
      0080A5                        170 UserButtonHandler:
                                    171 ; wait button release
      0080A5 5F               [ 1]  172 	clrw x
      0080A6 5A               [ 2]  173 1$: decw x 
      0080A7 26 FD            [ 1]  174 	jrne 1$
      0080A9 72 09 50 15 F8   [ 2]  175 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    176 ; if MCU suspended by SLEEP resume program
      0080AE 72 07 00 25 05   [ 2]  177     btjf flags,#FSLEEP,2$
      0080B3 72 17 00 25      [ 1]  178 	bres flags,#FSLEEP 
      0080B7 80               [11]  179 	iret
      0080B8 72 00 00 25 03   [ 2]  180 2$:	btjt flags,#FRUN,4$
      0080BD CC 80 F6         [ 2]  181 	jp 9$ 
      0080C0                        182 4$:	; program interrupted by user 
      0080C0 72 11 00 25      [ 1]  183 	bres flags,#FRUN 
      0080C4 AE 80 FE         [ 2]  184 	ldw x,#USER_ABORT
      0080C7 CD 82 30         [ 4]  185 	call puts 
      0080CA CE 00 04         [ 2]  186 	ldw x,basicptr
      0080CD FE               [ 2]  187 	ldw x,(x)
                                    188 ; print line number 
      0080CE 35 0A 00 08      [ 1]  189 	mov base,#10 
      0080D2 35 06 00 26      [ 1]  190 	mov tab_width,#6
      0080D6 CD 8A 19         [ 4]  191 	call print_int  	
      0080D9 CE 00 04         [ 2]  192 	ldw x,basicptr 
      0080DC 1C 00 03         [ 2]  193 	addw x,#3  
      0080DF CD 82 30         [ 4]  194 	call puts 
      0080E2 A6 0D            [ 1]  195 	ld a,#CR 
      0080E4 CD 82 1E         [ 4]  196 	call putc
      0080E7 5F               [ 1]  197 	clrw x  
      0080E8 C6 00 02         [ 1]  198 	ld a,in 
      0080EB AB 03            [ 1]  199 	add a,#3 ; adjustment for line number display 
      0080ED 97               [ 1]  200 	ld xl,a 
      0080EE CD 82 58         [ 4]  201 	call spaces 
      0080F1 A6 5E            [ 1]  202 	ld a,#'^
      0080F3 CD 82 1E         [ 4]  203 	call putc 
      0080F6                        204 9$:
      0080F6 AE 17 FF         [ 2]  205     ldw x,#STACK_EMPTY 
      0080F9 94               [ 1]  206     ldw sp,x
      0080FA 9A               [ 1]  207 	rim 
      0080FB CC 87 E6         [ 2]  208 	jp warm_start
                                    209 
      0080FE 0A 50 72 6F 67 72 61   210 USER_ABORT: .asciz "\nProgram aborted by user.\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal  6D-Bits]



             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    211 
                                    212 
                                    213 ;----------------------------------------
                                    214 ; inialize MCU clock 
                                    215 ; input:
                                    216 ;   A 		source  HSI | 1 HSE 
                                    217 ;   XL      CLK_CKDIVR , clock divisor 
                                    218 ; output:
                                    219 ;   none 
                                    220 ;----------------------------------------
      000099                        221 clock_init:	
      008106 20 61 62         [ 1]  222 	cp a,CLK_CMSR 
      008109 6F 72            [ 1]  223 	jreq 2$ ; no switching required 
                                    224 ; select clock source 
      00810B 74 65 64 20      [ 1]  225 	bset CLK_SWCR,#CLK_SWCR_SWEN
      00810F 62 79 20         [ 1]  226 	ld CLK_SWR,a
      008112 75 73 65         [ 1]  227 1$:	cp a,CLK_CMSR
      008115 72 2E            [ 1]  228 	jrne 1$
      0000AA                        229 2$: 	
                                    230 ; HSI and cpu clock divisor 
      008117 0A               [ 1]  231 	ld a,xl 
      008118 00 50 C6         [ 1]  232 	ld CLK_CKDIVR,a  
      008119 81               [ 4]  233 	ret
                                    234 
                                    235 ;---------------------------------
                                    236 ; TIM4 is configured to generate an 
                                    237 ; interrupt every millisecond 
                                    238 ;----------------------------------
      0000AF                        239 timer4_init:
      008119 C1 50 C3 27      [ 1]  240 	mov TIM4_PSCR,#7 ; prescale 128  
      00811D 0C 72 12 50      [ 1]  241 	mov TIM4_ARR,#125 ; set for 1msec.
      008121 C5 C7 50 C4      [ 1]  242 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008125 C1 50 C3 26      [ 1]  243 	bset TIM4_IER,#TIM4_IER_UIE 
      008129 FB               [ 4]  244 	ret
                                    245 
                                    246 ;----------------------------------
                                    247 ; unlock EEPROM for writing/erasing
                                    248 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    249 ; input:
                                    250 ;  none
                                    251 ; output:
                                    252 ;  none 
                                    253 ;----------------------------------
      00812A                        254 unlock_eeprom:
      00812A 9F C7 50 C6      [ 1]  255 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      00812E 81 56 50 64      [ 1]  256     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00812F 72 07 50 5F FB   [ 2]  257 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00812F 35               [ 4]  258 	ret
                                    259 
                                    260 ;----------------------------------
                                    261 ; unlock FLASH for writing/erasing
                                    262 ; wait endlessly for FLASH_IAPSR_PUL bit.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    263 ; input:
                                    264 ;  none
                                    265 ; output:
                                    266 ;  none
                                    267 ;----------------------------------
      0000CE                        268 unlock_flash:
      008130 07 53 45 35      [ 1]  269 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008134 7D 53 46 35      [ 1]  270 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008138 05 53 40 72 10   [ 2]  271 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00813D 53               [ 4]  272 	ret
                                    273 
                           000000   274 	BLOCK_ERASE=0
                                    275 ;----------------------------
                                    276 ; erase block code must be 
                                    277 ;executed from RAM
                                    278 ;-----------------------------
                           000000   279 .if BLOCK_ERASE 
                                    280 ; this code is copied to RAM 
                                    281 erase_start:
                                    282 	clr a 
                                    283     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    284     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    285 	ldf [farptr],a
                                    286     inc farptr+2 
                                    287     ldf [farptr],a
                                    288     inc farptr+2 
                                    289     ldf [farptr],a
                                    290     inc farptr+2 
                                    291     ldf [farptr],a
                                    292 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    293 	ret
                                    294 erase_end:
                                    295 
                                    296 ; copy erase_start in RAM 
                                    297 move_code_in_ram:
                                    298 	ldw x,#erase_end 
                                    299 	subw x,#erase_start
                                    300 	ldw acc16,x 
                                    301 	ldw x,#pad 
                                    302 	ldw y,#erase_start 
                                    303 	call move 
                                    304 	ret 
                                    305 
                                    306 ;-----------------------------------
                                    307 ; erase flash or EEPROM block 
                                    308 ; a block is 128 bytes 
                                    309 ; input:
                                    310 ;   farptr  address block begin
                                    311 ; output:
                                    312 ;   none
                                    313 ;--------------------------------------
                                    314 erase_block:
                                    315 	ldw x,farptr+1 
                                    316 	pushw x 
                                    317 	call move_code_in_ram 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    318 	popw x 
                                    319 	ldw farptr+1,x 
                                    320 	tnz farptr
                                    321 	jrne erase_flash 
                                    322 	ldw x,#FLASH_BASE 
                                    323 	cpw x,farptr+1 
                                    324 	jrpl erase_flash 
                                    325 ; erase eeprom block
                                    326 	call unlock_eeprom 
                                    327 	sim 
                                    328 	call pad   
                                    329 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    330 	rim 
                                    331 	ret 
                                    332 ; erase flash block:
                                    333 erase_flash:
                                    334 	call unlock_flash 
                                    335 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    336 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    337 	clr a 
                                    338 	sim 
                                    339 	call pad 
                                    340     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    341 	rim 
                                    342 	ret 
                                    343 .endif ; BLOCK_ERASE 
                                    344 
                                    345 
                                    346 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    347 ; write a byte to FLASH or EEPROM 
                                    348 ; input:
                                    349 ;    a  		byte to write
                                    350 ;    farptr  	address
                                    351 ;    x          farptr[x]
                                    352 ; output:
                                    353 ;    none
                                    354 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    355 	; variables locales
                           000001   356 	BTW = 1   ; byte to write offset on stack
                           000002   357 	OPT = 2   ; OPTION flag offset on stack
                           000002   358 	VSIZE = 2
      0000DC                        359 write_byte:
      00813E 41 81            [ 2]  360 	pushw y
      008140                        361 	_vars VSIZE
      008140 35 AE            [ 2]    1     sub sp,#VSIZE 
      008142 50 64            [ 1]  362 	ld (BTW,sp),a ; byte to write 
      008144 35 56            [ 1]  363 	clr (OPT,sp)  ; OPTION flag
                                    364 ; put addr[15:0] in Y, for bounds check.
      008146 50 64 72 07      [ 2]  365 	ldw y,farptr+1   ; Y=addr15:0
                                    366 ; check addr[23:16], if <> 0 then it is extened flash memory
      00814A 50 5F FB 81      [ 1]  367 	tnz farptr 
      00814E 26 14            [ 1]  368 	jrne write_flash
      00814E 35 56 50 62      [ 2]  369     cpw y,#user_space
      008152 35 AE            [ 1]  370     jruge write_flash
      008154 50 62 72 03      [ 2]  371 	cpw y,#EEPROM_BASE  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008158 50 5F            [ 1]  372     jrult write_exit
      00815A FB 81 48 00      [ 2]  373 	cpw y,#OPTION_BASE
      00815C 25 18            [ 1]  374 	jrult write_eeprom
      00815C 90 89            [ 2]  375     jra write_exit
                                    376 ; write program memory
      000102                        377 write_flash:
      00815E 52 02 6B         [ 4]  378 	call unlock_flash 
      008161 01               [ 1]  379 1$:	sim 
      008162 0F 02            [ 1]  380 	ld a,(BTW,sp)
      008164 90 CE 00 15      [ 4]  381 	ldf ([farptr],x),a ; farptr[x]=A
      008168 72 5D 00 14 26   [ 2]  382 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00816D 14               [ 1]  383     rim 
      00816E 90 A3 A2 00      [ 1]  384     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008172 24 0E            [ 2]  385     jra write_exit
                                    386 ; write eeprom and option
      000118                        387 write_eeprom:
      008174 90 A3 40         [ 4]  388 	call unlock_eeprom
                                    389 	; check for data eeprom or option eeprom
      008177 00 25 52 90      [ 2]  390 	cpw y,#OPTION_BASE
      00817B A3 48            [ 1]  391 	jrmi 1$
      00817D 00 25 18 20      [ 2]  392 	cpw y,#OPTION_END+1
      008181 4A 02            [ 1]  393 	jrpl 1$
      008182 03 02            [ 1]  394 	cpl (OPT,sp)
      000129                        395 1$: 
      008182 CD 81            [ 1]  396     tnz (OPT,sp)
      008184 4E 9B            [ 1]  397     jreq 2$
                                    398 	; pour modifier une option il faut modifier ces 2 bits
      008186 7B 01 92 A7      [ 1]  399     bset FLASH_CR2,#FLASH_CR2_OPT
      00818A 00 14 72 05      [ 1]  400     bres FLASH_NCR2,#FLASH_CR2_OPT 
      000135                        401 2$: 
      00818E 50 5F            [ 1]  402     ld a,(BTW,sp)
      008190 FB 9A 72 13      [ 4]  403     ldf ([farptr],x),a
      008194 50 5F            [ 1]  404     tnz (OPT,sp)
      008196 20 34            [ 1]  405     jreq 3$
      008198 5C               [ 1]  406     incw x
      008198 CD 81            [ 1]  407     ld a,(BTW,sp)
      00819A 40               [ 1]  408     cpl a
      00819B 90 A3 48 00      [ 4]  409     ldf ([farptr],x),a
      00819F 2B 08 90 A3 48   [ 2]  410 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00014C                        411 write_exit:
      00014C                        412 	_drop VSIZE 
      0081A4 80 2A            [ 2]    1     addw sp,#VSIZE 
      0081A6 02 03            [ 2]  413 	popw y
      0081A8 02               [ 4]  414     ret
                                    415 
                                    416 ;--------------------------------------------
                                    417 ; write a data block to eeprom or flash 
                                    418 ; input:
                                    419 ;   Y        source address   
                                    420 ;   X        array index  destination  farptr[x]
                                    421 ;   BSIZE    block size bytes 
                                    422 ;   farptr   write address , byte* 
                                    423 ; output:
                                    424 ;	X 		after last byte written 
                                    425 ;   Y 		after last byte read 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    426 ;  farptr   point after block
                                    427 ;---------------------------------------------
      0081A9                        428 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000151                        429 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    430 	; local var 
                           000001   431 	XSAVE=1 
                           000002   432 	VSIZE=2 
      000151                        433 write_block:
      000151                        434 	_vars VSIZE
      0081A9 0D 02            [ 2]    1     sub sp,#VSIZE 
      0081AB 27 08            [ 2]  435 	ldw (XSAVE,sp),x 
      0081AD 72 1E            [ 2]  436 	ldw x,(BSIZE,sp) 
      0081AF 50 5B            [ 1]  437 	jreq 9$
      0081B1 72 1F            [ 2]  438 1$:	ldw x,(XSAVE,sp)
      0081B3 50 5C            [ 1]  439 	ld a,(y)
      0081B5 CD 00 DC         [ 4]  440 	call write_byte 
      0081B5 7B               [ 1]  441 	incw x 
      0081B6 01 92            [ 1]  442 	incw y 
      0081B8 A7 00            [ 2]  443 	ldw (XSAVE,sp),x
      0081BA 14 0D            [ 2]  444 	ldw x,(BSIZE,sp)
      0081BC 02               [ 2]  445 	decw x
      0081BD 27 08            [ 2]  446 	ldw (BSIZE,sp),x 
      0081BF 5C 7B            [ 1]  447 	jrne 1$
      00016C                        448 9$:
      0081C1 01 43            [ 2]  449 	ldw x,(XSAVE,sp)
      0081C3 92 A7 00         [ 4]  450 	call incr_farptr
      000171                        451 	_drop VSIZE
      0081C6 14 72            [ 2]    1     addw sp,#VSIZE 
      0081C8 05               [ 4]  452 	ret 
                                    453 
                                    454 
                                    455 ;---------------------------------------------
                                    456 ;   UART3 subroutines
                                    457 ;---------------------------------------------
                                    458 
                                    459 ;---------------------------------------------
                                    460 ; initialize UART3, 115200 8N1
                                    461 ; input:
                                    462 ;	none
                                    463 ; output:
                                    464 ;   none
                                    465 ;---------------------------------------------
      000174                        466 uart3_init:
                                    467 	; configure tx pin
      0081C9 50 5F FB 11      [ 1]  468 	bset PD_DDR,#BIT5 ; tx pin
      0081CC 72 1A 50 12      [ 1]  469 	bset PD_CR1,#BIT5 ; push-pull output
      0081CC 5B 02 90 85      [ 1]  470 	bset PD_CR2,#BIT5 ; fast output
      000180                        471 uart3_set_baud: 
                                    472 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    473 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      0081D0 81 E1            [ 1]  474 	ld a,#CLK_SWR_HSI
      0081D1 C1 50 C3         [ 1]  475 	cp a,CLK_CMSR 
      0081D1 52 02            [ 1]  476 	jreq hsi_clock 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      000187                        477 hse_clock: ; 8 Mhz 	
      0081D3 1F 01 1E 05      [ 1]  478 	mov UART3_BRR2,#0x05 ; must be loaded first
      0081D7 27 13 1E 01      [ 1]  479 	mov UART3_BRR1,#0x4
      0081DB 90 F6            [ 2]  480 	jra uart_enable
      000191                        481 hsi_clock: ; 16 Mhz 	
      0081DD CD 81 5C 5C      [ 1]  482 	mov UART3_BRR2,#0x0b ; must be loaded first
      0081E1 90 5C 1F 01      [ 1]  483 	mov UART3_BRR1,#0x08
      000199                        484 uart_enable:	
      0081E5 1E 05 5A 1F      [ 1]  485 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
      0081E9 05               [ 4]  486 	ret
                                    487 	
                                    488 ;---------------------------------
                                    489 ; send character to UART3 
                                    490 ; input:
                                    491 ;   A 
                                    492 ; output:
                                    493 ;   none 
                                    494 ;--------------------------------	
      00019E                        495 putc:
      0081EA 26 ED 52 40 FB   [ 2]  496 	btjf UART3_SR,#UART_SR_TXE,.
      0081EC C7 52 41         [ 1]  497 	ld UART3_DR,a 
      0081EC 1E               [ 4]  498 	ret 
                                    499 
                                    500 ;---------------------------------
                                    501 ; wait character from UART3 
                                    502 ; input:
                                    503 ;   none
                                    504 ; output:
                                    505 ;   A 			char  
                                    506 ;--------------------------------	
      0001A7                        507 getc:
      0081ED 01 CD 9A EB 5B   [ 2]  508 	btjf UART3_SR,#UART_SR_RXNE,.
      0081F2 02 81 41         [ 1]  509 	ld a,UART3_DR 
      0081F4 81               [ 4]  510 	ret 
                                    511 
                                    512 ;-----------------------------
                                    513 ; send an ASCIZ string to UART3 
                                    514 ; input: 
                                    515 ;   x 		char * 
                                    516 ; output:
                                    517 ;   none 
                                    518 ;-------------------------------
      0001B0                        519 puts:
      0081F4 72               [ 1]  520     ld a,(x)
      0081F5 1A 50            [ 1]  521 	jreq 1$
      0081F7 11 72 1A         [ 4]  522 	call putc 
      0081FA 50               [ 1]  523 	incw x 
      0081FB 12 72            [ 2]  524 	jra puts 
      0081FD 1A               [ 4]  525 1$:	ret 
                                    526 
                                    527 
                                    528 ;---------------------------
                                    529 ; delete character at left 
                                    530 ; of cursor on terminal 
                                    531 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    532 ;   none 
                                    533 ; output:
                                    534 ;	none 
                                    535 ;---------------------------
      0001BA                        536 bksp:
      0081FE 50 13            [ 1]  537 	ld a,#BSP 
      008200 CD 01 9E         [ 4]  538 	call putc 
      008200 A6 E1            [ 1]  539 	ld a,#SPACE 
      008202 C1 50 C3         [ 4]  540 	call putc 
      008205 27 0A            [ 1]  541 	ld a,#BSP 
      008207 CD 01 9E         [ 4]  542 	call putc 
      008207 35               [ 4]  543 	ret 
                                    544 ;---------------------------
                                    545 ; delete n character left of cursor 
                                    546 ; at terminal.
                                    547 ; input: 
                                    548 ;   A   	number of characters to delete.
                                    549 ; output:
                                    550 ;    none 
                                    551 ;--------------------------	
      0001CA                        552 delete:
      008208 05               [ 1]  553 	push a 
      008209 52 43            [ 1]  554 0$:	tnz (1,sp)
      00820B 35 04            [ 1]  555 	jreq 1$
      00820D 52 42 20         [ 4]  556 	call bksp 
      008210 08 01            [ 1]  557 	dec (1,sp)
      008211 20 F5            [ 2]  558 	jra 0$
      008211 35               [ 1]  559 1$:	pop a 
      008212 0B               [ 4]  560 	ret
                                    561 
                                    562 ;--------------------------
                                    563 ; print n spaces on terminal
                                    564 ; input:
                                    565 ;  X 		number of spaces 
                                    566 ; output:
                                    567 ;	none 
                                    568 ;---------------------------
      0001D8                        569 spaces:
      008213 52 43            [ 1]  570 	ld a,#SPACE 
      008215 35               [ 2]  571 1$:	tnzw x
      008216 08 52            [ 1]  572 	jreq 9$
      008218 42 01 9E         [ 4]  573 	call putc 
      008219 5A               [ 2]  574 	decw x
      008219 35 0C            [ 2]  575 	jra 1$
      0001E3                        576 9$: 
      00821B 52               [ 4]  577 	ret 
                                    578 
                           000001   579 .if DEBUG 
                                    580 ;---------------------------------
                                    581 ;; print actual registers states 
                                    582 ;; as pushed on stack 
                                    583 ;; {Y,X,CC,A}
                                    584 ;---------------------------------
      0001E4                        585 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0001E4                        586 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0001E4                        587 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0001E4                        588 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0001E4                        589 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0001E4                        590 prt_regs:
      00821C 45 81 27         [ 2]  591 	ldw x,#regs_state 
      00821E CD 01 B0         [ 4]  592 	call puts
                                    593 ; register PC
      00821E 72 0F            [ 2]  594 	ldw y,(1,sp)
      008220 52 40 FB         [ 2]  595 	ldw x,#REG_EPC 
      008223 C7 52 41         [ 4]  596 	call prt_reg16 
                                    597 ; register CC 
      008226 81 08            [ 1]  598 	ld a,(R_CC,sp)
      008227 AE 09 47         [ 2]  599 	ldw x,#REG_CC 
      008227 72 0B 52         [ 4]  600 	call prt_reg8 
                                    601 ; register A 
      00822A 40 FB            [ 1]  602 	ld a,(R_A,sp)
      00822C C6 52 41         [ 2]  603 	ldw x,#REG_A 
      00822F 81 08 62         [ 4]  604 	call prt_reg8 
                                    605 ; register X 
      008230 16 05            [ 2]  606 	ldw y,(R_X,sp)
      008230 F6 27 06         [ 2]  607 	ldw x,#REG_X 
      008233 CD 82 1E         [ 4]  608 	call prt_reg16 
                                    609 ; register Y 
      008236 5C 20            [ 2]  610 	ldw y,(R_Y,sp)
      008238 F7 81 3B         [ 2]  611 	ldw x,#REG_Y 
      00823A CD 08 87         [ 4]  612 	call prt_reg16 
                                    613 ; register SP 
      00823A A6 08            [ 1]  614 	ldw y,sp
      00823C CD 82 1E A6      [ 2]  615 	addw y,#6+ARG_OFS  
      008240 20 CD 82         [ 2]  616 	ldw x,#REG_SP
      008243 1E A6 08         [ 4]  617 	call prt_reg16
      008246 CD 82            [ 1]  618 	ld a,#CR 
      008248 1E 81 9E         [ 4]  619 	call putc
      00824A CD 01 9E         [ 4]  620 	call putc   
      00824A 88               [ 4]  621 	ret 
                                    622 
      00824B 0D 01 27 07 CD 82 3A   623 regs_state: .asciz "\nregisters state\n--------------------\n"
             0A 01 20 F5 84 81 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    624 
                                    625 
                                    626 ;--------------------
                                    627 ; print content at address in hex.
                                    628 ; input:
                                    629 ;   X 	address to peek 
                                    630 ; output:
                                    631 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    632 ;--------------------	
      008258                        633 prt_peek:
      008258 A6               [ 2]  634 	pushw x 
      008259 20 5D 27         [ 2]  635 	ldw acc16,x 
      00825C 06 CD 82 1E      [ 1]  636 	clr acc24 
      008260 5A               [ 1]  637 	clrw x 
      008261 20 F7            [ 1]  638 	ld a,#16 
      008263 CD 09 51         [ 4]  639 	call prti24 
      008263 81 3A            [ 1]  640 	ld a,#': 
      008264 CD 01 9E         [ 4]  641 	call putc 
      008264 AE 82            [ 1]  642 	ld a,#SPACE 
      008266 A7 CD 82         [ 4]  643 	call putc 
      008269 30               [ 2]  644 	popw x 
      00826A 16               [ 1]  645 	ld a,(x)
      00826B 01 AE 89         [ 1]  646 	ld acc8,a 
      00826E B6               [ 1]  647 	clrw x 
      00826F CD 89            [ 1]  648 	ld a,#16 
      008271 07 7B 08         [ 4]  649 	call prti24
      008274 AE               [ 4]  650 	ret 
                                    651 .endif ; DEBUG  
                                    652 
                                    653 ;-------------------------------------
                                    654 ; retrun string length
                                    655 ; input:
                                    656 ;   X         .asciz  
                                    657 ; output:
                                    658 ;   X         length 
                                    659 ;-------------------------------------
      000272                        660 strlen:
      008275 89 C7            [ 1]  661 	ldw y,x 
      008277 CD               [ 1]  662 	clrw x 
      008278 88 E2            [ 1]  663 1$:	tnz (y) 
      00827A 7B 07            [ 1]  664 	jreq 9$ 
      00827C AE               [ 1]  665 	incw x
      00827D 89 C3            [ 1]  666 	incw y 
      00827F CD 88            [ 2]  667 	jra 1$ 
      008281 E2               [ 4]  668 9$: ret 
                                    669 
                                    670 ;------------------------------------
                                    671 ; compare 2 strings
                                    672 ; input:
                                    673 ;   X 		char* first string 
                                    674 ;   Y       char* second string 
                                    675 ; output:
                                    676 ;   A 		0|1 
                                    677 ;-------------------------------------
      00027F                        678 strcmp:
      008282 16               [ 1]  679 	ld a,(x)
      008283 05 AE            [ 1]  680 	jreq 5$ 
      008285 89 BF            [ 1]  681 	cp a,(y) 
      008287 CD 89            [ 1]  682 	jrne 4$ 
      008289 07               [ 1]  683 	incw x 
      00828A 16 03            [ 1]  684 	incw y 
      00828C AE 89            [ 2]  685 	jra strcmp 
      00028B                        686 4$: ; not same  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00828E BB               [ 1]  687 	clr a 
      00828F CD               [ 4]  688 	ret 
      00028D                        689 5$: ; same 
      008290 89 07            [ 1]  690 	ld a,#1 
      008292 90               [ 4]  691 	ret 
                                    692 
                                    693 
                                    694 ;---------------------------------------
                                    695 ;  copy src to dest 
                                    696 ; input:
                                    697 ;   X 		dest 
                                    698 ;   Y 		src 
                                    699 ; output: 
                                    700 ;   X 		dest 
                                    701 ;----------------------------------
      000290                        702 strcpy:
      008293 96               [ 2]  703 	pushw x 
      008294 72 A9            [ 1]  704 1$: ld a,(y)
      008296 00 08            [ 1]  705 	jreq 9$ 
      008298 AE               [ 1]  706 	ld (x),a 
      008299 89               [ 1]  707 	incw x 
      00829A CC CD            [ 1]  708 	incw y 
      00829C 89 07            [ 2]  709 	jra 1$ 
      00829E A6               [ 1]  710 9$:	clr (x)
      00829F 0D               [ 2]  711 	popw x 
      0082A0 CD               [ 4]  712 	ret 
                                    713 
                                    714 ;---------------------------------------
                                    715 ; move memory block 
                                    716 ; input:
                                    717 ;   X 		destination 
                                    718 ;   Y 	    source 
                                    719 ;   acc16	size 
                                    720 ; output:
                                    721 ;   none 
                                    722 ;--------------------------------------
                           000001   723 	INCR=1 ; increament high byte 
                           000002   724 	LB=2 ; increament low byte 
                           000002   725 	VSIZE=2
      00029E                        726 move:
      00029E                        727 	_vars VSIZE 
      0082A1 82 1E            [ 2]    1     sub sp,#VSIZE 
      0082A3 CD 82            [ 1]  728 	clr (INCR,sp)
      0082A5 1E 81            [ 1]  729 	clr (LB,sp)
      0082A7 0A 72            [ 2]  730 	pushw y 
      0082A9 65 67            [ 2]  731 	cpw x,(1,sp) ; compare DEST to SRC 
      0082AB 69 73            [ 2]  732 	popw y 
      0082AD 74 65            [ 1]  733 	jreq move_exit ; x==y 
      0082AF 72 73            [ 1]  734 	jrmi move_down
      0002AE                        735 move_up: ; start from top address with incr=-1
      0082B1 20 73 74 61      [ 2]  736 	addw x,acc16
      0082B5 74 65 0A 2D      [ 2]  737 	addw y,acc16
      0082B9 2D 2D            [ 1]  738 	cpl (INCR,sp)
      0082BB 2D 2D            [ 1]  739 	cpl (LB,sp)   ; increment = -1 
      0082BD 2D 2D            [ 2]  740 	jra move_loop  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0002BC                        741 move_down: ; start from bottom address with incr=1 
      0082BF 2D               [ 2]  742     decw x 
      0082C0 2D 2D            [ 2]  743 	decw y
      0082C2 2D 2D            [ 1]  744 	inc (LB,sp) ; incr=1 
      0002C1                        745 move_loop:	
      0082C4 2D 2D 2D         [ 1]  746     ld a, acc16 
      0082C7 2D 2D 2D         [ 1]  747 	or a, acc8
      0082CA 2D 2D            [ 1]  748 	jreq move_exit 
      0082CC 0A 00 01         [ 2]  749 	addw x,(INCR,sp)
      0082CE 72 F9 01         [ 2]  750 	addw y,(INCR,sp) 
      0082CE 89 CF            [ 1]  751 	ld a,(y)
      0082D0 00               [ 1]  752 	ld (x),a 
      0082D1 0A               [ 2]  753 	pushw x 
      0082D2 72 5F 00         [ 2]  754 	ldw x,acc16 
      0082D5 09               [ 2]  755 	decw x 
      0082D6 5F A6 10         [ 2]  756 	ldw acc16,x 
      0082D9 CD               [ 2]  757 	popw x 
      0082DA 89 D1            [ 2]  758 	jra move_loop
      0002DD                        759 move_exit:
      0002DD                        760 	_drop VSIZE
      0082DC A6 3A            [ 2]    1     addw sp,#VSIZE 
      0082DE CD               [ 4]  761 	ret 	
                                    762 
                                    763 ;-------------------------------------
                                    764 ; search text area for a line with 
                                    765 ; same number as lineno  
                                    766 ; input:
                                    767 ;	X 			lineno 
                                    768 ; output:
                                    769 ;   X 			addr of line | 0 
                                    770 ;   Y           lineno|insert address if not found  
                                    771 ;-------------------------------------
                           000001   772 	LL=1 ; line length 
                           000002   773 	LB=2 ; line length low byte 
                           000002   774 	VSIZE=2 
      0002E0                        775 search_lineno:
      0002E0                        776 	_vars VSIZE
      0082DF 82 1E            [ 2]    1     sub sp,#VSIZE 
      0082E1 A6 20 CD         [ 2]  777 	ldw acc16,x 
      0082E4 82 1E            [ 1]  778 	clr (LL,sp)
      0082E6 85 F6 C7 00      [ 2]  779 	ldw y,txtbgn
      0002EB                        780 search_ln_loop:
      0082EA 0B 5F A6 10      [ 2]  781 	cpw y,txtend 
      0082EE CD 89            [ 1]  782 	jrpl 8$
      0082F0 D1               [ 1]  783 	ldw x,y 
      0082F1 81               [ 2]  784 	ldw x,(x) ; x=line number 
      0082F2 C3 00 09         [ 2]  785 	cpw x,acc16 
      0082F2 90 93            [ 1]  786 	jreq 9$ 
      0082F4 5F 90            [ 1]  787 	jrpl 8$ ; from here all lines are > lineno 
      0082F6 7D 27 05         [ 1]  788 	ld a,(2,y)
      0082F9 5C 90            [ 1]  789 	ld (LB,sp),a 
      0082FB 5C 20 F7         [ 2]  790 	addw y,(LL,sp)
      0082FE 81 E7            [ 2]  791 	jra search_ln_loop 
      0082FF 51               [ 1]  792 8$: exgw x,y 
      0082FF F6 27            [ 1]  793 	clrw y 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      000307                        794 9$: _drop VSIZE
      008301 0B 90            [ 2]    1     addw sp,#VSIZE 
      008303 F1               [ 1]  795 	exgw x,y   
      008304 26               [ 4]  796 	ret 
                                    797 
                                    798 ;-------------------------------------
                                    799 ; delete line at addr
                                    800 ; move new line to insert with end of text 
                                    801 ; otherwise it would be overwritten.
                                    802 ; input:
                                    803 ;   X 		addr of line i.e DEST for move 
                                    804 ;-------------------------------------
                           000001   805 	LLEN=1
                           000003   806 	SRC=3
                           000004   807 	VSIZE=4
      00030B                        808 del_line: 
      00030B                        809 	_vars VSIZE 
      008305 05 5C            [ 2]    1     sub sp,#VSIZE 
      008307 90 5C            [ 1]  810 	ld a,(2,x) ; line length
      008309 20 F4            [ 1]  811 	ld (LLEN+1,sp),a 
      00830B 0F 01            [ 1]  812 	clr (LLEN,sp)
      00830B 4F 81            [ 1]  813 	ldw y,x  
      00830D 72 F9 01         [ 2]  814 	addw y,(LLEN,sp) ;SRC  
      00830D A6 01            [ 2]  815 	ldw (SRC,sp),y  ;save source 
      00830F 81 CE 00 1D      [ 2]  816 	ldw y,txtend 
      008310 90 E6 02         [ 1]  817 	ld a,(2,y)
      008310 89 90            [ 1]  818 	clrw y 
      008312 F6 27            [ 1]  819 	ld yl,a  
      008314 06 F7 5C 90      [ 2]  820 	addw y,txtend
      008318 5C 20 F6         [ 2]  821 	subw y,(SRC,sp) ; y=count 
      00831B 7F 85 81 09      [ 2]  822 	ldw acc16,y 
      00831E 16 03            [ 2]  823 	ldw y,(SRC,sp)    ; source
      00831E 52 02 0F         [ 4]  824 	call move
      008321 01 0F 02 90      [ 2]  825 	ldw y,txtend 
      008325 89 13 01         [ 2]  826 	subw y,(LLEN,sp)
      008328 90 85 27 31      [ 2]  827 	ldw txtend,y  
      000340                        828 	_drop VSIZE     
      00832C 2B 0E            [ 2]    1     addw sp,#VSIZE 
      00832E 81               [ 4]  829 	ret 
                                    830 
                                    831 ;---------------------------------------------
                                    832 ; create a gap in text area 
                                    833 ; move new line to insert in gap with end of text
                                    834 ; otherwise it would be overwritten.
                                    835 ; input:
                                    836 ;    X 			addr gap start 
                                    837 ;    Y 			gap length 
                                    838 ; output:
                                    839 ;    X 			addr gap start 
                                    840 ;--------------------------------------------
                           000001   841 	DEST=1
                           000003   842 	SRC=3
                           000005   843 	LEN=5
                           000006   844 	VSIZE=6 
      000343                        845 create_gap:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      000343                        846 	_vars VSIZE
      00832E 72 BB            [ 2]    1     sub sp,#VSIZE 
      008330 00 0A            [ 2]  847 	ldw (SRC,sp),x 
      008332 72 B9            [ 2]  848 	ldw (LEN,sp),y 
      008334 00 0A 03 01      [ 2]  849 	ldw acc16,y 
      008338 03 02            [ 1]  850 	ldw y,x ; SRC
      00833A 20 05 00 09      [ 2]  851 	addw x,acc16  
      00833C 1F 01            [ 2]  852 	ldw (DEST,sp),x 
                                    853 ;compute size to move 	
      00833C 5A 90 5A         [ 2]  854 	ldw x,txtend 
      00833F 0C 02            [ 1]  855 	ld a,(2,x) ; pending line length 
      008341 C7 00 0A         [ 1]  856 	ld acc8,a 
      008341 C6 00 0A CA      [ 1]  857 	clr acc16 
      008345 00 0B 27 14      [ 2]  858 	addw x,acc16 
      008349 72 FB 01         [ 2]  859 	subw x,(SRC,sp)
      00834C 72 F9 01         [ 2]  860 	ldw acc16,x ; size to move
      00834F 90 F6            [ 2]  861 	ldw x,(DEST,sp) 
      008351 F7 89 CE         [ 4]  862 	call move
      008354 00 0A 5A         [ 2]  863 	ldw x,txtend
      008357 CF 00 0A         [ 2]  864 	addw x,(LEN,sp)
      00835A 85 20 E4         [ 2]  865 	ldw txtend,x
      00835D                        866 9$:	_drop VSIZE 
      00835D 5B 02            [ 2]    1     addw sp,#VSIZE 
      00835F 81               [ 4]  867 	ret 
                                    868 
                                    869 
                                    870 ;--------------------------------------------
                                    871 ; insert line in tib into text area 
                                    872 ; first search for already existing 
                                    873 ; replace existing 
                                    874 ; if strlen(tib)==0 delete existing 
                                    875 ; input:
                                    876 ;   ptr16 				pointer to tokenized line  
                                    877 ; output:
                                    878 ;   none
                                    879 ;---------------------------------------------
                           000001   880 	DEST=1  ; text area insertion address 
                           000003   881 	SRC=3   ; str to insert address 
                           000005   882 	LINENO=5 ; line number 
                           000007   883 	LLEN=7 ; line length 
                           000008   884 	VSIZE=8  
      008360                        885 insert_line:
      00037C                        886 	_vars VSIZE 
      008360 52 02            [ 2]    1     sub sp,#VSIZE 
      008362 CF 00 0A         [ 2]  887 	ldw x,ptr16  
      008365 0F 01 90         [ 2]  888 	cpw x,txtbgn 
      008368 CE 00            [ 1]  889 	jrne 0$
                                    890 ;first text line 
      00836A 1C 00 02         [ 2]  891 	ldw x,#2 
      00836B 72 D6 00 14      [ 4]  892 	ld a,([ptr16],x)
      00836B 90               [ 1]  893 	clrw x 
      00836C C3               [ 1]  894 	ld xl,a
      00836D 00 1E            [ 2]  895 	ldw (LLEN,sp),x  
      00836F 2A 13            [ 2]  896 	jra 5$
      008371 93 FE C3 00      [ 5]  897 0$:	ldw x,[ptr16]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    898 ; new line number
      008375 0A 27            [ 2]  899 	ldw (LINENO,sp),x 
      008377 0F 2A 0A         [ 2]  900 	ldw x,#2 
      00837A 90 E6 02 6B      [ 4]  901 	ld a,([ptr16],x)
      00837E 02               [ 1]  902 	ld xl,a
                                    903 ; new line length
      00837F 72 F9            [ 2]  904 	ldw (LLEN,sp),x
                                    905 ; check if that line number already exit 	
      008381 01 20            [ 2]  906 	ldw x,(LINENO,sp)
      008383 E7 51 90         [ 4]  907 	call search_lineno 
      008386 5F               [ 2]  908 	tnzw x 
      008387 5B 02            [ 1]  909 	jrne 2$
                                    910 ; line doesn't exit
                                    911 ; it will be inserted at this point.  	
      008389 51 81            [ 2]  912 	ldw (DEST,sp),y 
      00838B 20 05            [ 2]  913 	jra 3$
                                    914 ; line exit delete it.
                                    915 ; it will be replaced by new one 	
      00838B 52 04            [ 2]  916 2$: ldw (DEST,sp),x 
      00838D E6 02 6B         [ 4]  917 	call del_line
      0003B4                        918 3$: 
                                    919 ; insert new line or leave if LLEN==3
                                    920 ; LLEN==3 means empty line 
      008390 02 0F            [ 1]  921 	ld a,#3
      008392 01 90            [ 1]  922 	cp a,(LLEN+1,sp)
      008394 93 72            [ 1]  923 	jreq insert_ln_exit ; empty line exit.
                                    924 ; if insertion point at txtend 
                                    925 ; no move required 
      008396 F9 01            [ 2]  926 	ldw x,(DEST,sp)
      008398 17 03 90         [ 2]  927 	cpw x,txtend 
      00839B CE 00            [ 1]  928 	jrpl 5$ 
                                    929 ; must create a gap
                                    930 ; at insertion point  
      00839D 1E 90            [ 2]  931 	ldw x,(DEST,sp)
      00839F E6 02            [ 2]  932 	ldw y,(LLEN,sp)
      0083A1 90 5F 90         [ 4]  933 	call create_gap 
                                    934 ; move new line in gap 
      0083A4 97 72            [ 2]  935 	ldw x,(LLEN,sp)
      0083A6 B9 00 1E         [ 2]  936 	ldw acc16,x 
      0083A9 72 F2 03 90      [ 2]  937 	ldw y,txtend ;SRC 
      0083AD CF 00            [ 2]  938 	ldw x,(DEST,sp) ; dest address 
      0083AF 0A 16 03         [ 4]  939 	call move 
      0083B2 CD 83            [ 2]  940 	jra insert_ln_exit  
      0003D8                        941 5$: ; no move required 
      0083B4 1E 90            [ 2]  942 	ldw x,(LLEN,sp) 
      0083B6 CE 00 1E 72      [ 2]  943 	addw x,txtend 
      0083BA F2 01 90         [ 2]  944 	ldw txtend,x 
      0003E1                        945 insert_ln_exit:	
      0003E1                        946 	_drop VSIZE
      0083BD CF 00            [ 2]    1     addw sp,#VSIZE 
      0083BF 1E               [ 4]  947 	ret
                                    948 
                                    949 
                                    950 ;-----------------------------
                                    951 ; check if text buffer full
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    952 ; input:
                                    953 ;   ptr16     addr start tokenize line 
                                    954 ;   X         buffer index 
                                    955 ; output:
                                    956 ;   none 
                                    957 ;-----------------------------------
      0003E4                        958 check_full:
      0083C0 5B 04 81 14      [ 2]  959 	addw x,ptr16 
      0083C3 A3 16 C8         [ 2]  960 	cpw x,#tib 
      0083C3 52 06            [ 1]  961 	jrult 1$
      0083C5 1F 03            [ 1]  962 	ld a,#ERR_MEM_FULL
      0083C7 17 05 90         [ 2]  963 	jp tb_error 
      0083CA CF               [ 4]  964 1$: ret 
                                    965 
                                    966 
                                    967 ;-----------------------------------
                                    968 ; create token list form text line 
                                    969 ; save this list in text area
                                    970 ; input:
                                    971 ;   none
                                    972 ; output:
                                    973 ;   basicptr     token list buffer
                                    974 ;   lineno 		 BASIC line number 
                                    975 ;   in.w  		 cleared 
                                    976 ;-----------------------------------
                                    977 	.macro _incr_ptr16 n 
                                    978 	ldw x,#n 
                                    979 	addw x,ptr16 
                                    980 	ldw ptr16,x 
                                    981 	.endm 
                                    982 
                           000001   983 	XSAVE=1
                           000003   984 	BUFIDX=3
                           000004   985 	VSIZE=4
      0003F3                        986 compile:
      0003F3                        987 	_vars VSIZE 
      0083CB 00 0A            [ 2]    1     sub sp,#VSIZE 
      0083CD 90 93 72 BB      [ 1]  988 	bset flags,#FCOMP 
      0083D1 00 0A 1F         [ 2]  989 	ldw x,txtend
      0083D4 01 CE 00         [ 2]  990 	ldw ptr16,x 
      0083D7 1E               [ 1]  991 	clrw x 
      0083D8 E6 02 C7         [ 2]  992 	ldw x,#3
      0083DB 00 0B            [ 2]  993 	ldw (BUFIDX,sp),X  
      0083DD 72 5F 00         [ 4]  994 	call check_full
      0083E0 0A               [ 1]  995 	clrw x 
      0083E1 72 BB 00 0A      [ 5]  996 	ldw [ptr16],x 
      0083E5 72 F0 03         [ 4]  997 	call get_token
      0083E8 CF 00            [ 2]  998 	ldw (XSAVE,sp),x 
      0083EA 0A 1E            [ 1]  999 	cp a,#TK_INTGR 
      0083EC 01 CD            [ 1] 1000 	jrne 3$
      0083EE 83 1E CE         [ 2] 1001 	cpw x,#0  
      0083F1 00 1E            [ 1] 1002 	jrugt 1$
      0083F3 72 FB 05         [ 2] 1003 	jp syntax_error 
      0083F6 CF 00 1E 5B      [ 5] 1004 1$:	ldw [ptr16],x; line number
      0083FA 06 81 04         [ 4] 1005 2$:	call get_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0083FC 1F 01            [ 2] 1006 	ldw (XSAVE,sp),x 
      0083FC 52 08            [ 1] 1007 3$:	cp a,#TK_NONE 
      0083FE CE 00            [ 1] 1008 	jrne 30$
      008400 15 C3 00         [ 2] 1009 	jp 9$
      00042E                       1010 30$: 	 
      008403 1C 26            [ 2] 1011 	ldw x,(BUFIDX,sp)
      008405 0D AE 00         [ 4] 1012 	call check_full 
      008408 02 72            [ 2] 1013 	ldw y,(BUFIDX,sp) 
      00840A D6 00 15         [ 4] 1014 	ld ([ptr16],y),a ; token attribute 
      00840D 5F 97            [ 1] 1015 	incw y
      00840F 1F 07            [ 2] 1016 	ldw (BUFIDX,sp),y
      008411 20 45            [ 1] 1017 	cp a,#TK_COLON 
      008413 72 CE            [ 1] 1018 	jrne 31$
      008415 00 15            [ 2] 1019 	jra 2$ 
      000442                       1020 31$:
      008417 1F 05            [ 1] 1021 	cp a,#TK_CHAR
      008419 AE 00            [ 1] 1022 	jrne 32$ 
      00841B 02 72            [ 2] 1023 	ldw x,(XSAVE,sp)
      00841D D6               [ 1] 1024 	ld a,xl 
      00841E 00 15 97         [ 4] 1025 	ld ([ptr16],y),a
      008421 1F 07            [ 1] 1026 	incw y 
      008423 1E 05            [ 2] 1027 	ldw (BUFIDX,sp),y 
      008425 CD 83            [ 2] 1028 	jra 2$ 
      000452                       1029 32$:
      008427 60 5D            [ 1] 1030 	cp a,#TK_QSTR 
      008429 26 04            [ 1] 1031 	jrne 4$
      00842B 17 01 20         [ 2] 1032 	ldw x,#pad 
      00842E 05 1F 01         [ 4] 1033 	call strlen
      008431 CD               [ 1] 1034 	incw x  
      008432 83 8B E4         [ 4] 1035 	call check_full 
      008434 90 AE 17 18      [ 2] 1036 	ldw y,#pad 
      008434 A6 03 11         [ 2] 1037 	ldw x,ptr16
      008437 08 27 27         [ 2] 1038 	addw x,(BUFIDX,sp)	
      00843A 1E 01 C3         [ 4] 1039 	call strcpy 
      00843D 00 1E 2A         [ 2] 1040 	ldw x,#pad 
      008440 17 1E 01         [ 4] 1041 	call strlen 
      008443 16               [ 1] 1042 	incw x
      008444 07 CD 83         [ 2] 1043 	addw x,(BUFIDX,sp) 
      008447 C3 1E            [ 2] 1044 	ldw (BUFIDX,sp),x
      008449 07 CF            [ 2] 1045 	jra 2$  
      00844B 00 0A            [ 1] 1046 4$: cp a,#TK_INTGR
      00844D 90 CE            [ 1] 1047 	jrult 2$
      00844F 00 1E            [ 1] 1048 	cp a,#TK_SFUNC 
      008451 1E 01            [ 1] 1049 	Jrugt 2$
      008453 CD 83            [ 2] 1050 	ldw x,(XSAVE,sp) 
      008455 1E 20            [ 2] 1051 	ldw y,(BUFIDX,sp)
      008457 09 DF 14         [ 5] 1052 	ldw ([ptr16],y),x
      008458 A3 17 04         [ 2] 1053 	cpw x,#rem 
      008458 1E 07            [ 1] 1054 	jrne 5$
      00845A 72 BB 00 1E      [ 2] 1055 	addw y,#2 
      00845E CF 00            [ 2] 1056 	pushw y 
      008460 1E 00 14         [ 2] 1057 	ldw x,ptr16 
      008461 72 FB 01         [ 2] 1058 	addw x,(1,sp)
      00049B                       1059 	_drop 2  
      008461 5B 08            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008463 81 CE 00 00      [ 2] 1060 	ldw y,in.w 
      008464 72 A9 16 C8      [ 2] 1061 	addw y,#tib 
      008464 72 BB 00         [ 4] 1062 	call strcpy 	
      008467 15 A3 16         [ 4] 1063 	call strlen 
      00846A C8 25 05         [ 2] 1064 	addw x,#3 ; rem exec address+string 0. 
      00846D A6 01 CC         [ 2] 1065 	addw x,(BUFIDX,sp)
      008470 87 96            [ 2] 1066 	ldw (BUFIDX,sp),x 
      008472 81 09            [ 2] 1067 	jra 9$
      008473 72 A9 00 02      [ 2] 1068 5$:	addw y,#2 
      008473 52 04            [ 2] 1069 	ldw (BUFIDX,sp),y 
      008475 72 1A 00         [ 2] 1070 	jp 2$
      0004BE                       1071 9$: 
      008478 25 CE 00         [ 2] 1072 	ldw x,#2
      00847B 1E CF            [ 2] 1073 	ldw y,(BUFIDX,sp)
      00847D 00 15            [ 1] 1074 	ld a,yl 
      00847F 5F AE 00 03      [ 4] 1075 	ld ([ptr16],x),a  	
      008483 1F 03 CD 84      [ 5] 1076 	ldw x,[ptr16]
      008487 64 5F            [ 1] 1077 	jreq 10$
      008489 72 CF 00         [ 4] 1078 	call insert_line
      00848C 15 CD 8D 84      [ 1] 1079 	clr  count 
      008490 1F 01            [ 2] 1080 	jra  11$ 
      0004D8                       1081 10$: 
      008492 A1 03 26         [ 2] 1082 	ldw x,ptr16 
      008495 11 A3 00         [ 2] 1083 	ldw basicptr,x 
      008498 00 22            [ 1] 1084 	ld a,(2,x)
      00849A 03 CC 87         [ 1] 1085 	ld count,a 
      00849D 94               [ 2] 1086 	ldw x,(x)
      00849E 72 CF 00         [ 2] 1087 	ldw lineno,x 
      0084A1 15 CD 8D 84      [ 1] 1088 	mov in,#3 
      0004EB                       1089 11$:
      0004EB                       1090 	_drop VSIZE 
      0084A5 1F 01            [ 2]    1     addw sp,#VSIZE 
      0084A7 A1 00 26 03      [ 1] 1091 	bres flags,#FCOMP 
      0084AB CC               [ 4] 1092 	ret 
                                   1093 
                                   1094 
                                   1095 ;------------------------------------
                                   1096 ;  set all variables to zero 
                                   1097 ; input:
                                   1098 ;   none 
                                   1099 ; output:
                                   1100 ;	none
                                   1101 ;------------------------------------
      0004F2                       1102 clear_vars:
      0084AC 85 3E 26         [ 2] 1103 	ldw x,#vars 
      0084AE 90 AE 00 34      [ 2] 1104 	ldw y,#2*26 
      0084AE 1E               [ 1] 1105 1$:	clr (x)
      0084AF 03               [ 1] 1106 	incw x 
      0084B0 CD 84            [ 2] 1107 	decw y 
      0084B2 64 16            [ 1] 1108 	jrne 1$
      0084B4 03               [ 4] 1109 	ret 
                                   1110 
                                   1111 ;-------------------------------------
                                   1112 ; check if A is a letter
                                   1113 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1114 ;   A 			character to test 
                                   1115 ; output:
                                   1116 ;   C flag      1 true, 0 false 
                                   1117 ;-------------------------------------
      000500                       1118 is_alpha:
      0084B5 91 D7            [ 1] 1119 	cp a,#'A 
      0084B7 15               [ 1] 1120 	ccf
      0084B8 90 5C            [ 1] 1121 	jrnc 9$ 
      0084BA 17 03            [ 1] 1122 	cp a,#'Z+1 
      0084BC A1 01            [ 1] 1123 	jrc 9$ 
      0084BE 26 02            [ 1] 1124 	cp a,#'a 
      0084C0 20               [ 1] 1125 	ccf 
      0084C1 E0 02            [ 1] 1126 	jrnc 9$
      0084C2 A1 7B            [ 1] 1127 	cp a,#'z+1   
      0084C2 A1               [ 4] 1128 9$: ret 	
                                   1129 
                                   1130 ;-------------------------------------
                                   1131 ;  program initialization entry point 
                                   1132 ;-------------------------------------
                           000001  1133 	MAJOR=1
                           000000  1134 	MINOR=0
      0084C3 02 26 0C 1E 01 9F 91  1135 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             D7 15 90 5C 17 03 20
             D0 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0084D2                       1136 cold_start:
                                   1137 ;set stack 
      0084D2 A1 0A 26         [ 2] 1138 	ldw x,#STACK_EMPTY
      0084D5 25               [ 1] 1139 	ldw sp,x   
                                   1140 ; clear all ram 
      0084D6 AE               [ 1] 1141 0$: clr (x)
      0084D7 17               [ 2] 1142 	decw x 
      0084D8 18 CD            [ 1] 1143 	jrne 0$
                                   1144 ; activate pull up on all inputs 
      0084DA 82 F2            [ 1] 1145 	ld a,#255 
      0084DC 5C CD 84         [ 1] 1146 	ld PA_CR1,a 
      0084DF 64 90 AE         [ 1] 1147 	ld PB_CR1,a 
      0084E2 17 18 CE         [ 1] 1148 	ld PC_CR1,a 
      0084E5 00 15 72         [ 1] 1149 	ld PD_CR1,a 
      0084E8 FB 03 CD         [ 1] 1150 	ld PE_CR1,a 
      0084EB 83 10 AE         [ 1] 1151 	ld PF_CR1,a 
      0084EE 17 18 CD         [ 1] 1152 	ld PG_CR1,a 
      0084F1 82 F2 5C         [ 1] 1153 	ld PI_CR1,a 
                                   1154 ; select internal clock no divisor: 16 Mhz 	
      0084F4 72 FB            [ 1] 1155 	ld a,#CLK_SWR_HSI 
      0084F6 03               [ 1] 1156 	clrw x  
      0084F7 1F 03 20         [ 4] 1157     call clock_init 
      0084FA A7 A1 03         [ 4] 1158 	call timer4_init
                                   1159 ; UART3 at 115200 BAUD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0084FD 25 A3 A1         [ 4] 1160 	call uart3_init
                                   1161 ; activate PE_4 (user button interrupt)
      008500 09 22 9F 1E      [ 1] 1162     bset PE_CR2,#USR_BTN_BIT 
                                   1163 ; display system information
      008504 01 16 03         [ 2] 1164 	ldw x,#software 
      008507 91 DF 15         [ 4] 1165 	call puts 
      00850A A3 97            [ 1] 1166 	ld a,#MAJOR 
      00850C 84 26 26         [ 1] 1167 	ld acc8,a 
      00850F 72               [ 1] 1168 	clrw x 
      008510 A9 00 02         [ 2] 1169 	ldw acc24,x 
      008513 90 89            [ 1] 1170 	ld a,#10 
      008515 CE 00 15         [ 4] 1171 	call prti24 
      008518 72 FB            [ 1] 1172 	ld a,#'.
      00851A 01 5B 02         [ 4] 1173 	call putc 
      00851D 90 CE            [ 1] 1174 	ld a,#MINOR 
      00851F 00 01 72         [ 1] 1175 	ld acc8,a 
      008522 A9               [ 1] 1176 	clrw x 
      008523 16 C8 CD         [ 2] 1177 	ldw acc24,x 
      008526 83 10            [ 1] 1178 	ld a,#10 
      008528 CD 82 F2         [ 4] 1179 	call prti24 
      00852B 1C 00            [ 1] 1180 	ld a,#CR 
      00852D 03 72 FB         [ 4] 1181 	call putc 
      008530 03 1F 03         [ 4] 1182 	call seek_fdrive 
                                   1183 ; configure LED2 pin 
      008533 20 09 72 A9      [ 1] 1184     bset PC_CR1,#LED2_BIT
      008537 00 02 17 03      [ 1] 1185     bset PC_CR2,#LED2_BIT
      00853B CC 84 A2 0C      [ 1] 1186     bset PC_DDR,#LED2_BIT
      00853E 9A               [ 1] 1187 	rim 
      00853E AE 00 02         [ 2] 1188 	ldw x,#tib
      008541 16 03 90         [ 2] 1189 	ldw array_addr,x 
      008544 9F 72 D7 00      [ 1] 1190 	inc seedy+1 
      008548 15 72 CE 00      [ 1] 1191 	inc seedx+1 
      00854C 15 27 09         [ 4] 1192 	call clear_basic
      00854F CD 83 FC         [ 4] 1193 	call ubound 
      008552 72 5F 00         [ 4] 1194 	call dpop 
      008555 03 20 13         [ 2] 1195 	ldw array_size,x 
      008558 CC 07 66         [ 2] 1196     jp warm_start 
                                   1197 
                                   1198 ;---------------------------
                                   1199 ; reset BASIC text variables 
                                   1200 ; and clear variables 
                                   1201 ;---------------------------
      0005E2                       1202 clear_basic:
      008558 CE               [ 1] 1203 	clrw x 
      008559 00 15 CF         [ 2] 1204 	ldw lineno,x
      00855C 00 04 E6 02      [ 1] 1205 	clr count 
      008560 C7 00 03         [ 2] 1206 	ldw x,#free_ram 
      008563 FE CF 00         [ 2] 1207 	ldw txtbgn,x 
      008566 06 35 03         [ 2] 1208 	ldw txtend,x 
      008569 00 02 F2         [ 4] 1209 	call clear_vars 
      00856B 81               [ 4] 1210 	ret 
                                   1211 
                                   1212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1213 ;;   Tiny BASIC error messages     ;;
                                   1214 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0005F7                       1215 err_msg:
      00856B 5B 04 72 1B 00 25 81  1216 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             2C 06 46 06 56
      008572 06 6D 06 84 06 9F 06  1217 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             B1 06 C3
      008572 AE 00                 1218 	.word err_no_access 
                                   1219 
      008574 27 90 AE 00 34 7F 5C  1220 err_mem_full: .asciz "\nMemory full\n" 
             90 5A 26 FA 81 0A 00
      008580 0A 73 79 6E 74 61 78  1221 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      008580 A1 41 8C 24 0B A1 5B  1222 err_math_ovf: .asciz "\nmath operation overflow\n"
             25 07 A1 61 8C 24 02
             A1 7B 81 0A 0A 54 69
             6E 79 20 42 41
      00859A 53 49 43 20 66 6F 72  1223 err_div0: .asciz "\ndivision by 0\n" 
             20 53 54 4D 38 0A 43
             6F 70
      0085AA 79 72 69 67 68 74 2C  1224 err_no_line: .asciz "\ninvalid line number.\n"
             20 4A 61 63 71 75 65
             73 20 44 65 73 63 68
             65 6E
      0085C1 65 73 20 32 30 31 39  1225 err_run_only: .asciz "\nrun time only usage.\n" 
             2C 32 30 32 30 0A 76
             65 72 73 69 6F 6E 20
             00 00
      0085D7 0A 63 6F 6D 6D 61 6E  1226 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      0085D7 AE 17 FF 94 7F 5A 26  1227 err_duplicate: .asciz "\nduplicate name.\n"
             FC A6 FF C7 50 03 C7
             50 08 C7 50
      0085E9 0D C7 50 12 C7 50 17  1228 err_not_file: .asciz "\nFile not found.\n"
             C7 50 1C C7 50 21 C7
             50 2B A6 E1
      0085FB 5F CD 81 19 CD 81 2F  1229 err_bad_value: .asciz "\nbad value.\n"
             CD 81 F4 72 18 50
      008608 18 AE 85 91 CD 82 30  1230 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             A6 01 C7 00 0B 5F CF
             00 09 A6 0A CD 89 D1
             A6 2E CD 82 1E A6 00
             C7 00 0B 5F CF 00 09
             A6 0A CD 89 D1 A6 0D
             CD 82 1E CD 9A F9 72
             1A 50 0D
                                   1231 
      00863C 72 1A 50 0E 72 1A 50  1232 rt_msg: .asciz "last token id: "
             0C 9A AE 16 C8 CF 00
             21 72
                                   1233 
      000714                       1234 syntax_error:
      00864C 5C 00            [ 1] 1235 	ld a,#ERR_SYNTAX 
                                   1236 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      000716                       1237 tb_error:
      00864E 11 72 5C         [ 2] 1238 	ldw x, #err_msg 
      008651 00 0F CD 86      [ 1] 1239 	clr acc16 
      008655 62               [ 1] 1240 	sll a
      008656 CD 93 FB CD      [ 1] 1241 	rlc acc16  
      00865A 90 22 CF         [ 1] 1242 	ld acc8, a 
      00865D 00 23 CC 87      [ 2] 1243 	addw x,acc16 
      008661 E6               [ 2] 1244 	ldw x,(x)
      008662 CD 01 B0         [ 4] 1245 	call puts
      008662 5F CF 00 06 72   [ 2] 1246 	btjf flags,#FCOMP, 1$
      008667 5F 00 03         [ 2] 1247 	ldw x,#tib
      00866A AE 00 5B         [ 4] 1248 	call puts 
      00866D CF 00            [ 1] 1249 	ld a,#CR 
      00866F 1C CF 00         [ 4] 1250 	call putc
      008672 1E CD 85         [ 2] 1251 	ldw x,#in.w.saved
      008675 72 81 D8         [ 4] 1252 	call spaces
      008677 A6 5E            [ 1] 1253 	ld a,#'^
      008677 00 00 86         [ 4] 1254 	call putc 
      00867A 8F 86            [ 2] 1255 	jra 6$
      00867C 9D 86 AC         [ 2] 1256 1$:	ldw x,basicptr
      00867F 86 C6 86         [ 4] 1257 	call prt_basic_line
      008682 D6 86 ED         [ 2] 1258 	ldw x,#rt_msg 
      008685 87 04 87         [ 4] 1259 	call puts 
      008688 1F 87 31         [ 2] 1260 	ldw x,in.w.saved 
      00868B 87 43 87 50      [ 4] 1261 	ld a,([basicptr],x)
      00868F 0A               [ 1] 1262 	clrw x 
      008690 4D               [ 1] 1263 	ld xl,a 
      008691 65 6D 6F         [ 4] 1264 	call print_int 
      008694 72 79 20         [ 2] 1265 6$: ldw x,#STACK_EMPTY 
      008697 66               [ 1] 1266     ldw sp,x
      000766                       1267 warm_start:
      008698 75 6C 6C 0A      [ 1] 1268 	clr flags 
      00869C 00 0A 73 79      [ 1] 1269 	clr loop_depth 
      0086A0 6E 74 61         [ 2] 1270 	ldw x,#dstack_unf 
      0086A3 78 20 65         [ 2] 1271 	ldw dstkptr,x 
      0086A6 72 72 6F 72      [ 1] 1272 	mov tab_width,#TAB_WIDTH 
      0086AA 0A 00 0A 6D      [ 1] 1273 	mov base,#10 
      0086AE 61               [ 1] 1274 	clrw x 
      0086AF 74 68 20         [ 2] 1275 	ldw lineno,x 
      0086B2 6F 70 65         [ 2] 1276 	ldw x,#tib 
      0086B5 72 61 74         [ 2] 1277 	ldw basicptr,x 
                                   1278 ;----------------------------
                                   1279 ;   BASIC interpreter
                                   1280 ;----------------------------
      000786                       1281 interp:
      0086B8 69 6F 6E 20      [ 1] 1282 	clr in.w
      0086BC 6F 76 65 72 66   [ 2] 1283 	btjf flags,#FRUN,4$ 
                                   1284 ; running program
                                   1285 ; goto next basic line 
      0086C1 6C 6F 77         [ 2] 1286 	ldw x,basicptr
      0086C4 0A 00            [ 1] 1287 	ld a,(2,x) ; line length 
      0086C6 0A 64 69         [ 1] 1288 	ld acc8,a 
      0086C9 76 69 73 69      [ 1] 1289 	clr acc16 
      0086CD 6F 6E 20 62      [ 2] 1290 	addw x,acc16
      0086D1 79 20 30         [ 2] 1291 	cpw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086D4 0A 00            [ 1] 1292 	jrpl warm_start
      0086D6 0A 69 6E         [ 2] 1293 	ldw basicptr,x ; start of next line  
      0086D9 76 61            [ 1] 1294 	ld a,(2,x)
      0086DB 6C 69 64         [ 1] 1295 	ld count,a 
      0086DE 20               [ 2] 1296 	ldw x,(x) ; line no 
      0086DF 6C 69 6E         [ 2] 1297 	ldw lineno,x 
      0086E2 65 20 6E 75      [ 1] 1298 	mov in,#3 ; skip first 3 bytes of line 
      0086E6 6D 62            [ 2] 1299 	jra interp_loop 
      0007B6                       1300 4$: ; commande line mode 	
      0086E8 65 72 2E 0A      [ 1] 1301 	clr in
      0086EC 00 0A            [ 1] 1302 	ld a,#CR 
      0086EE 72 75 6E         [ 4] 1303 	call putc 
      0086F1 20 74            [ 1] 1304 	ld a,#'> 
      0086F3 69 6D 65         [ 4] 1305 	call putc 
      0086F6 20 6F 6E         [ 4] 1306 	call readln
      0086F9 6C 79 20         [ 4] 1307 	call compile
      0007CA                       1308 interp_loop:  
      0086FC 75 73 61         [ 1] 1309 	ld a,in 
      0086FF 67 65 2E         [ 1] 1310 	cp a,count  
      008702 0A 00            [ 1] 1311 	jrpl interp
      008704 0A 63 6F         [ 4] 1312 	call next_token
      008707 6D 6D            [ 1] 1313 	cp a,#TK_COLON 
      008709 61 6E            [ 1] 1314 	jreq interp_loop 
      00870B 64 20            [ 1] 1315 	cp a,#TK_NONE 
                                   1316 ;	jreq interp 
      0007DB                       1317 1$:
      00870D 6C 69            [ 1] 1318 	cp a,#TK_VAR
      00870F 6E 65            [ 1] 1319 	jrne 2$
      008711 20 6F 6E         [ 4] 1320 	call let02  
      008714 6C 79            [ 2] 1321 	jra interp_loop 
      0007E4                       1322 2$:	
      008716 20 75            [ 1] 1323 	cp a,#TK_ARRAY 
      008718 73 61            [ 1] 1324 	jrne 3$
      00871A 67 65 2E         [ 4] 1325 	call get_array_element
      00871D 0A 00 0A         [ 4] 1326 	call let02 
      008720 64 75            [ 2] 1327 	jra interp_loop 
      0007F0                       1328 3$:
      008722 70 6C            [ 1] 1329 	cp a,#TK_CMD
      008724 69 63            [ 1] 1330 	jrne 4$
      008726 61               [ 4] 1331 	call (x) 
      008727 74 65            [ 2] 1332 	jra interp_loop 
      0007F7                       1333 4$:	
      008729 20 6E 61         [ 2] 1334 	jp syntax_error 
                                   1335 
                                   1336 ;--------------------------
                                   1337 ; extract next token from
                                   1338 ; token list 
                                   1339 ; basicptr -> base address 
                                   1340 ; in  -> offset in list array 
                                   1341 ; output:
                                   1342 ;   A 		token attribute
                                   1343 ;   X 		token value if there is one
                                   1344 ;----------------------------------------
      0007FA                       1345 next_token:
      00872C 6D 65            [ 1] 1346 	push #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      00872E 2E 0A 00         [ 1] 1347 	ld a,in 
      008731 0A 46 69         [ 1] 1348 	cp a,count 
      008734 6C               [ 1] 1349 	pop a 
      008735 65 20            [ 1] 1350 	jrpl 9$ 
      008737 6E 6F 74         [ 2] 1351 	ldw x,in.w 
      00873A 20 66 6F         [ 2] 1352 	ldw in.w.saved,x 
      00873D 75 6E 64         [ 2] 1353 	ldw x,basicptr 
      008740 2E 0A 00 0A      [ 4] 1354 	ld a,([in.w],x)
      008744 62 61 64 20      [ 1] 1355 	inc in 
      008748 76 61            [ 1] 1356 	cp a,#CMD_END 
      00874A 6C 75            [ 1] 1357 	jrult 9$
      00874C 65 2E            [ 1] 1358 	cp a,#TK_CHAR
      00874E 0A 00            [ 1] 1359 	jrne 1$
      008750 0A 46 69 6C      [ 4] 1360 	ld a,([in.w],x)
      008754 65 20 69 6E      [ 1] 1361 	inc in
      008758 20               [ 1] 1362 	clrw x 
      008759 65               [ 1] 1363 	ld xl,a 
      00875A 78 74            [ 1] 1364 	ld a,#TK_CHAR
      00875C 65               [ 4] 1365 	ret 
      00875D 6E 64            [ 1] 1366 1$:	cp a,#TK_QSTR 
      00875F 65 64            [ 1] 1367 	jrugt 9$
      008761 20 6D            [ 1] 1368 	jrult 2$
      008763 65 6D 6F 72      [ 2] 1369 	addw x,in.w 
      008767 79 2C            [ 2] 1370 	jra 9$
      008769 20 63 61 6E      [ 5] 1371 2$: ldw x,([in.w],x)
      00876D 27 74 20 62      [ 1] 1372 	inc in 
      008771 65 20 72 75      [ 1] 1373 	inc in
      008775 6E               [ 4] 1374 9$: ret	
                                   1375 
                                   1376 
                                   1377 ;----------------------------------------
                                   1378 ;   DEBUG support functions
                                   1379 ;----------------------------------------
                           000001  1380 .if DEBUG 
                                   1381 ; turn LED on 
      000844                       1382 ledon:
      008776 20 66 72 6F      [ 1] 1383     bset PC_ODR,#LED2_BIT
      00877A 6D               [ 4] 1384     ret 
                                   1385 
                                   1386 ; turn LED off 
      000849                       1387 ledoff:
      00877B 20 74 68 65      [ 1] 1388     bres PC_ODR,#LED2_BIT 
      00877F 72               [ 4] 1389     ret 
                                   1390 
                                   1391 ; invert LED status 
      00084E                       1392 ledtoggle:
      008780 65 2E            [ 1] 1393     ld a,#LED2_MASK
      008782 0A 00 6C         [ 1] 1394     xor a,PC_ODR
      008785 61 73 74         [ 1] 1395     ld PC_ODR,a
      008788 20               [ 4] 1396     ret 
                                   1397 
      000857                       1398 left_paren:
      008789 74 6F            [ 1] 1399 	ld a,#SPACE 
      00878B 6B 65 6E         [ 4] 1400 	call putc
      00878E 20 69            [ 1] 1401 	ld a,#'( 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008790 64 3A 20         [ 4] 1402 	call putc 	
      008793 00               [ 4] 1403 	ret 
                                   1404 
                                   1405 ;------------------------------
                                   1406 ; print 8 bit register 
                                   1407 ; input:
                                   1408 ;   X  point to register name 
                                   1409 ;   A  register value to print 
                                   1410 ; output:
                                   1411 ;   none
                                   1412 ;------------------------------- 
      008794                       1413 prt_reg8:
      008794 A6               [ 1] 1414 	push a 
      008795 02 01 B0         [ 4] 1415 	call puts 
      008796 7B 01            [ 1] 1416 	ld a,(1,sp) 
      008796 AE 86 77         [ 1] 1417 	ld acc8,a 
      008799 72               [ 1] 1418 	clrw x 
      00879A 5F               [ 1] 1419 	ld xl,a 
      00879B 00 0A 48 72      [ 1] 1420 	mov base,#16
      00879F 59 00 0A         [ 4] 1421 	call print_int 
      0087A2 C7 00 0B         [ 4] 1422 	call left_paren 
      0087A5 72               [ 1] 1423 	pop a 
      0087A6 BB               [ 1] 1424 	clrw x 
      0087A7 00               [ 1] 1425 	ld xl,a 
      0087A8 0A FE CD 82      [ 1] 1426 	mov base,#10 
      0087AC 30 72 0B         [ 4] 1427 	call print_int  
      0087AF 00 25            [ 1] 1428 	ld a,#') 
      0087B1 18 AE 16         [ 4] 1429 	call putc
      0087B4 C8               [ 4] 1430 	ret
                                   1431 
                                   1432 ;--------------------------------
                                   1433 ; print 16 bits register 
                                   1434 ; input:
                                   1435 ;   X   point register name 
                                   1436 ;   Y   register value to print 
                                   1437 ; output:
                                   1438 ;  none
                                   1439 ;--------------------------------
      000887                       1440 prt_reg16: 
      0087B5 CD 82            [ 2] 1441 	pushw y 
      0087B7 30 A6 0D         [ 4] 1442 	call puts 
      0087BA CD 82            [ 2] 1443 	ldw x,(1,sp) 
      0087BC 1E AE 00 12      [ 1] 1444 	mov base,#16 
      0087C0 CD 82 58         [ 4] 1445 	call print_int  
      0087C3 A6 5E CD         [ 4] 1446 	call left_paren 
      0087C6 82               [ 2] 1447 	popw x 
      0087C7 1E 20 18 CE      [ 1] 1448 	mov base,#10 
      0087CB 00 04 CD         [ 4] 1449 	call print_int  
      0087CE 95 04            [ 1] 1450 	ld a,#') 
      0087D0 AE 87 84         [ 4] 1451 	call putc
      0087D3 CD               [ 4] 1452 	ret 
                                   1453 
                                   1454 ;------------------------------------
                                   1455 ; print registers contents saved on
                                   1456 ; stack by trap interrupt.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1457 ;------------------------------------
      0008A6                       1458 print_registers:
      0087D4 82 30 CE         [ 2] 1459 	ldw x,#STATES
      0087D7 00 12 72         [ 4] 1460 	call puts
                                   1461 ; print EPC 
      0087DA D6 00 04         [ 2] 1462 	ldw x, #REG_EPC
      0087DD 5F 97 CD         [ 4] 1463 	call puts 
      0087E0 8A 19            [ 1] 1464 	ld a, (11,sp)
      0087E2 AE 17 FF         [ 1] 1465 	ld acc8,a 
      0087E5 94 0A            [ 1] 1466 	ld a, (10,sp) 
      0087E6 C7 00 09         [ 1] 1467 	ld acc16,a 
      0087E6 72 5F            [ 1] 1468 	ld a,(9,sp) 
      0087E8 00 25 72         [ 1] 1469 	ld acc24,a
      0087EB 5F               [ 1] 1470 	clrw x  
      0087EC 00 20            [ 1] 1471 	ld a,#16
      0087EE AE 17 80         [ 4] 1472 	call prti24  
                                   1473 ; print X
      0087F1 CF 00 1A         [ 2] 1474 	ldw x,#REG_X
      0087F4 35 04            [ 2] 1475 	ldw y,(5,sp)
      0087F6 00 26 35         [ 4] 1476 	call prt_reg16  
                                   1477 ; print Y 
      0087F9 0A 00 08         [ 2] 1478 	ldw x,#REG_Y
      0087FC 5F CF            [ 2] 1479 	ldw y, (7,sp)
      0087FE 00 06 AE         [ 4] 1480 	call prt_reg16  
                                   1481 ; print A 
      008801 16 C8 CF         [ 2] 1482 	ldw x,#REG_A
      008804 00 04            [ 1] 1483 	ld a, (4,sp) 
      008806 CD 08 62         [ 4] 1484 	call prt_reg8
                                   1485 ; print CC 
      008806 72 5F 00         [ 2] 1486 	ldw x,#REG_CC 
      008809 01 72            [ 1] 1487 	ld a, (3,sp) 
      00880B 01 00 25         [ 4] 1488 	call prt_reg8 
                                   1489 ; print SP 
      00880E 27 CE 00         [ 2] 1490 	ldw x,#REG_SP
      008811 04 E6            [ 1] 1491 	ldw y,sp 
      008813 02 C7 00 0B      [ 2] 1492 	addw y,#12
      008817 72 5F 00         [ 4] 1493 	call prt_reg16  
      00881A 0A 72            [ 1] 1494 	ld a,#'\n' 
      00881C BB 00 0A         [ 4] 1495 	call putc
      00881F C3               [ 4] 1496 	ret
                                   1497 
      008820 00 1E 2A C2 CF 00 04  1498 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             E6 02 C7 00 03 FE CF
             00 06 35 03 00 02 20
             14 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      008836 45 50 43 3A 00        1499 REG_EPC: .asciz "EPC:"
      008836 72 5F 00 02           1500 REG_Y:   .asciz "\nY:" 
      00883A A6 0D CD 82           1501 REG_X:   .asciz "\nX:"
      00883E 1E A6 3E CD           1502 REG_A:   .asciz "\nA:" 
      008842 82 1E CD 8B 07        1503 REG_CC:  .asciz "\nCC:"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008847 CD 84 73 3A 00        1504 REG_SP:  .asciz "\nSP:"
                                   1505 .endif ; DEBUG 
                                   1506 
                                   1507 ;------------------------------------
                                   1508 ; print integer in acc24 
                                   1509 ; input:
                                   1510 ;	acc24 		integer to print 
                                   1511 ;	A 			numerical base for conversion 
                                   1512 ;               if bit 7 is set add a space at print end.
                                   1513 ;   XL 			field width, 0 -> no fill.
                                   1514 ;  output:
                                   1515 ;    none 
                                   1516 ;------------------------------------
                           000001  1517 	WIDTH = 1
                           000002  1518 	BASE = 2
                           000003  1519 	ADD_SPACE=3 ; add a space after number 
                           000003  1520 	VSIZE = 3
      00884A                       1521 prti24:
      000951                       1522 	_vars VSIZE 
      00884A C6 00            [ 2]    1     sub sp,#VSIZE 
      00884C 02 C1            [ 1] 1523 	clr (ADD_SPACE,sp)
      00884E 00 03            [ 1] 1524 	bcp a,#0x80 
      008850 2A B4            [ 1] 1525 	jreq 0$ 
      008852 CD 88            [ 1] 1526 	cpl (ADD_SPACE,sp)
      008854 7A A1            [ 1] 1527 0$:	and a,#31 
      008856 01 27            [ 1] 1528 	ld (BASE,sp),a
      008858 F1               [ 1] 1529 	ld a,xl
      008859 A1 00            [ 1] 1530 	ld (WIDTH,sp),a 
      00885B 7B 02            [ 1] 1531 	ld a, (BASE,sp)  
      00885B A1 04 26         [ 4] 1532     call itoa  ; conversion entier en  .asciz
      00885E 05 CD            [ 1] 1533 1$: ld a,(WIDTH,sp)
      008860 94 13            [ 1] 1534 	jreq 4$
      008862 20 E6 0A         [ 1] 1535 	ld acc8,a 
      008864 89               [ 2] 1536 	pushw x 
      008864 A1 05 26         [ 4] 1537 	call strlen 
      008867 08               [ 1] 1538 	ld a,xl 
      008868 CD               [ 2] 1539 	popw x 
      008869 92 66 CD         [ 3] 1540 	exg a,acc8 
      00886C 94 13 20         [ 1] 1541 	sub a,acc8 
      00886F DA 0E            [ 1] 1542 	jrmi 4$
      008870 6B 01            [ 1] 1543 	ld (WIDTH,sp),a 
      008870 A1 06            [ 1] 1544 	ld  a,#SPACE
      008872 26 03            [ 1] 1545 3$: tnz (WIDTH,sp)
      008874 FD 20            [ 1] 1546 	jreq 4$
      008876 D3               [ 2] 1547 	decw x 
      008877 F7               [ 1] 1548 	ld (x),a 
      008877 CC 87            [ 1] 1549 	dec (WIDTH,sp) 
      008879 94 F6            [ 2] 1550 	jra 3$
      00887A                       1551 4$: 
      00887A 4B 00 C6         [ 4] 1552 	call puts 
      00887D 00 02            [ 1] 1553 	tnz (ADD_SPACE,sp)
      00887F C1 00            [ 1] 1554 	jreq 5$
      008881 03 84            [ 1] 1555     ld a,#SPACE 
      008883 2A 3E CE         [ 4] 1556 	call putc 
      000996                       1557 5$: _drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008886 00 01            [ 2]    1     addw sp,#VSIZE 
      008888 CF               [ 4] 1558     ret	
                                   1559 
                                   1560 ;-----------------------------------
                                   1561 ; print a 16 bit integer 
                                   1562 ; using variable 'base' as conversion
                                   1563 ; format.
                                   1564 ; input:
                                   1565 ;   X       integer to print 
                                   1566 ;   base    conversion base 
                                   1567 ; output:
                                   1568 ;   none 
                                   1569 ;-----------------------------------
                           000001  1570 	SIGN=1
                           000001  1571 	VSIZE=1
      000999                       1572 print_int: 
      000999                       1573 	_vars VSIZE 
      008889 00 12            [ 2]    1     sub sp,#VSIZE 
      00888B CE 00            [ 1] 1574 	clr (SIGN,sp)
      00888D 04 72 D6 00      [ 2] 1575 	ldw y,#pad+PAD_SIZE-1 
      008891 01 72            [ 1] 1576 	clr (y)
      008893 5C 00 02         [ 1] 1577 	ld a,base  
      008896 A1 02            [ 1] 1578 	cp a,#10 
      008898 25 29            [ 1] 1579 	jrne 1$ 
      00889A A1               [ 2] 1580 	tnzw x 
      00889B 02 26            [ 1] 1581 	jrpl 1$ 
      00889D 0D 72            [ 1] 1582 	cpl (SIGN,sp)
      00889F D6               [ 2] 1583 	negw x 	 
      0009B0                       1584 1$:	
      0088A0 00 01 72         [ 1] 1585 	ld a,base 
      0088A3 5C               [ 2] 1586 	div x,a 
      0088A4 00 02            [ 1] 1587 	add a,#'0 
      0088A6 5F 97            [ 1] 1588 	cp a,#'9+1 
      0088A8 A6 02            [ 1] 1589 	jrmi 2$ 
      0088AA 81 A1            [ 1] 1590 	add a,#7 
      0088AC 0A 22            [ 2] 1591 2$: decw y 
      0088AE 14 25            [ 1] 1592 	ld (y),a 
      0088B0 06               [ 2] 1593 	tnzw x 
      0088B1 72 BB            [ 1] 1594 	jrne 1$ 
      0088B3 00 01            [ 1] 1595 	ld a,#16 
      0088B5 20 0C 72         [ 1] 1596 	cp a,base 
      0088B8 DE 00            [ 1] 1597 	jrne 3$
      0088BA 01 72            [ 1] 1598 	ld a,#'$
      0088BC 5C 00            [ 2] 1599 	decw y  
      0088BE 02 72            [ 1] 1600 	ld (y),a
      0088C0 5C 00            [ 2] 1601 	jra 9$ 
      0088C2 02 81            [ 1] 1602 3$: tnz (SIGN,sp)
      0088C4 27 06            [ 1] 1603 	jreq 9$ 
      0088C4 72 1A            [ 1] 1604 	ld a,#'-
      0088C6 50 0A            [ 2] 1605 	decw y  
      0088C8 81 F7            [ 1] 1606 	ld (y),a
      0088C9                       1607 9$:	
      0088C9 72               [ 1] 1608 	ldw x,y 
      0088CA 1B 50 0A         [ 2] 1609 	subw x,#pad+PAD_SIZE-1 
      0088CD 81               [ 2] 1610 	negw x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0088CE                       1611 10$:
      0088CE A6 20            [ 2] 1612 	decw y 
      0088D0 C8 50            [ 1] 1613 	ld a,#SPACE 
      0088D2 0A C7            [ 1] 1614 	ld (y),a
      0088D4 50               [ 1] 1615 	incw x 
      0088D5 0A               [ 1] 1616 	ld a,xl 
      0088D6 81 00 25         [ 1] 1617 	cp a,tab_width
      0088D7 2B F3            [ 1] 1618 	jrmi 10$ 
      0009EE                       1619 12$:
      0088D7 A6               [ 1] 1620     ldw x,y 
      0088D8 20 CD 82         [ 4] 1621 	call puts  
      0009F2                       1622 	_drop VSIZE 
      0088DB 1E A6            [ 2]    1     addw sp,#VSIZE 
      0088DD 28               [ 4] 1623 	ret 
                                   1624 
                                   1625 ;------------------------------------
                                   1626 ; convert integer in acc24 to string
                                   1627 ; input:
                                   1628 ;   A	  	base
                                   1629 ;	acc24	integer to convert
                                   1630 ; output:
                                   1631 ;   X  		pointer to string
                                   1632 ;------------------------------------
                           000001  1633 	SIGN=1  ; integer sign 
                           000002  1634 	BASE=2  ; numeric base 
                           000002  1635 	VSIZE=2  ;locals size
      0009F5                       1636 itoa:
      0088DE CD 82            [ 2] 1637 	sub sp,#VSIZE
      0088E0 1E 81            [ 1] 1638 	ld (BASE,sp), a  ; base
      0088E2 0F 01            [ 1] 1639 	clr (SIGN,sp)    ; sign
      0088E2 88 CD            [ 1] 1640 	cp a,#10
      0088E4 82 30            [ 1] 1641 	jrne 1$
                                   1642 	; base 10 string display with negative sign if bit 23==1
      0088E6 7B 01 C7 00 0B   [ 2] 1643 	btjf acc24,#7,1$
      0088EB 5F 97            [ 1] 1644 	cpl (SIGN,sp)
      0088ED 35 10 00         [ 4] 1645 	call neg_acc24
      000A09                       1646 1$:
                                   1647 ; initialize string pointer 
      0088F0 08 CD 8A         [ 2] 1648 	ldw x,#pad+PAD_SIZE-1
      0088F3 19               [ 1] 1649 	clr (x)
      000A0D                       1650 itoa_loop:
      0088F4 CD 88            [ 1] 1651     ld a,(BASE,sp)
      0088F6 D7 84 5F         [ 4] 1652     call divu24_8 ; acc24/A 
      0088F9 97 35            [ 1] 1653     add a,#'0  ; remainder of division
      0088FB 0A 00            [ 1] 1654     cp a,#'9+1
      0088FD 08 CD            [ 1] 1655     jrmi 2$
      0088FF 8A 19            [ 1] 1656     add a,#7 
      008901 A6               [ 2] 1657 2$: decw x
      008902 29               [ 1] 1658     ld (x),a
                                   1659 	; if acc24==0 conversion done
      008903 CD 82 1E         [ 1] 1660 	ld a,acc24
      008906 81 00 09         [ 1] 1661 	or a,acc16
      008907 CA 00 0A         [ 1] 1662 	or a,acc8
      008907 90 89            [ 1] 1663     jrne itoa_loop
                                   1664 	;conversion done, next add '$' or '-' as required
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008909 CD 82            [ 1] 1665 	ld a,(BASE,sp)
      00890B 30 1E            [ 1] 1666 	cp a,#16
      00890D 01 35            [ 1] 1667 	jreq 8$
      00890F 10 00            [ 1] 1668 	ld a,(SIGN,sp)
      008911 08 CD            [ 1] 1669     jreq 10$
      008913 8A 19            [ 1] 1670     ld a,#'-
      008915 CD 88            [ 2] 1671 	jra 9$ 
      008917 D7 85            [ 1] 1672 8$: ld a,#'$ 
      008919 35               [ 2] 1673 9$: decw x
      00891A 0A               [ 1] 1674     ld (x),a
      000A39                       1675 10$:
      00891B 00 08            [ 2] 1676 	addw sp,#VSIZE
      00891D CD               [ 4] 1677 	ret
                                   1678 
                                   1679 ;-------------------------------------
                                   1680 ; divide uint24_t by uint8_t
                                   1681 ; used to convert uint24_t to string
                                   1682 ; input:
                                   1683 ;	acc24	dividend
                                   1684 ;   A 		divisor
                                   1685 ; output:
                                   1686 ;   acc24	quotient
                                   1687 ;   A		remainder
                                   1688 ;------------------------------------- 
                                   1689 ; offset  on sp of arguments and locals
                           000001  1690 	U8   = 1   ; divisor on stack
                           000001  1691 	VSIZE =1
      000A3C                       1692 divu24_8:
      00891E 8A               [ 2] 1693 	pushw x ; save x
      00891F 19               [ 1] 1694 	push a 
                                   1695 	; ld dividend UU:MM bytes in X
      008920 A6 29 CD         [ 1] 1696 	ld a, acc24
      008923 82               [ 1] 1697 	ld xh,a
      008924 1E 81 09         [ 1] 1698 	ld a,acc24+1
      008926 97               [ 1] 1699 	ld xl,a
      008926 AE 89            [ 1] 1700 	ld a,(U8,SP) ; divisor
      008928 79               [ 2] 1701 	div x,a ; UU:MM/U8
      008929 CD               [ 1] 1702 	push a  ;save remainder
      00892A 82               [ 1] 1703 	ld a,xh
      00892B 30 AE 89         [ 1] 1704 	ld acc24,a
      00892E B6               [ 1] 1705 	ld a,xl
      00892F CD 82 30         [ 1] 1706 	ld acc24+1,a
      008932 7B               [ 1] 1707 	pop a
      008933 0B               [ 1] 1708 	ld xh,a
      008934 C7 00 0B         [ 1] 1709 	ld a,acc24+2
      008937 7B               [ 1] 1710 	ld xl,a
      008938 0A C7            [ 1] 1711 	ld a,(U8,sp) ; divisor
      00893A 00               [ 2] 1712 	div x,a  ; R:LL/U8
      00893B 0A 7B            [ 1] 1713 	ld (U8,sp),a ; save remainder
      00893D 09               [ 1] 1714 	ld a,xl
      00893E C7 00 09         [ 1] 1715 	ld acc24+2,a
      008941 5F               [ 1] 1716 	pop a
      008942 A6               [ 2] 1717 	popw x
      008943 10               [ 4] 1718 	ret
                                   1719 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1720 ;------------------------------------
                                   1721 ;  two's complement acc24
                                   1722 ;  input:
                                   1723 ;		acc24 variable
                                   1724 ;  output:
                                   1725 ;		acc24 variable
                                   1726 ;-------------------------------------
      000A64                       1727 neg_acc24:
      008944 CD 89 D1 AE      [ 1] 1728 	cpl acc24+2
      008948 89 BF 16 05      [ 1] 1729 	cpl acc24+1
      00894C CD 89 07 AE      [ 1] 1730 	cpl acc24
      008950 89 BB            [ 1] 1731 	ld a,#1
      008952 16 07 CD         [ 1] 1732 	add a,acc24+2
      008955 89 07 AE         [ 1] 1733 	ld acc24+2,a
      008958 89               [ 1] 1734 	clr a
      008959 C3 7B 04         [ 1] 1735 	adc a,acc24+1
      00895C CD 88 E2         [ 1] 1736 	ld acc24+1,a 
      00895F AE               [ 1] 1737 	clr a 
      008960 89 C7 7B         [ 1] 1738 	adc a,acc24 
      008963 03 CD 88         [ 1] 1739 	ld acc24,a 
      008966 E2               [ 4] 1740 	ret
                                   1741 
                                   1742 
                                   1743 ;------------------------------------
                                   1744 ; read a line of text from terminal
                                   1745 ; input:
                                   1746 ;	none
                                   1747 ; local variable on stack:
                                   1748 ;	LL  line length
                                   1749 ;   RXCHAR last received chaaracte 
                                   1750 ; output:
                                   1751 ;   text in tib  buffer
                                   1752 ;------------------------------------
                                   1753 	; local variables
                           000001  1754 	LL_HB=1
                           000001  1755 	RXCHAR = 1 ; last char received
                           000002  1756 	LL = 2  ; accepted line length
                           000002  1757 	VSIZE=2 
      000A87                       1758 readln:
      008967 AE               [ 1] 1759 	clrw x 
      008968 89               [ 2] 1760 	pushw x 
      008969 CC 90 96 72      [ 2] 1761  	ldw y,#tib ; input buffer
      000A8D                       1762 readln_loop:
      00896D A9 00 0C         [ 4] 1763 	call getc
      008970 CD 89            [ 1] 1764 	ld (RXCHAR,sp),a
      008972 07 A6            [ 1] 1765 	cp a,#CR
      008974 0A CD            [ 1] 1766 	jrne 1$
      008976 82 1E 81         [ 2] 1767 	jp readln_quit
      008979 0A 52            [ 1] 1768 1$:	cp a,#NL
      00897B 65 67            [ 1] 1769 	jreq readln_quit
      00897D 69 73            [ 1] 1770 	cp a,#BSP
      00897F 74 65            [ 1] 1771 	jreq del_back
      008981 72 73            [ 1] 1772 	cp a,#CTRL_D
      008983 20 73            [ 1] 1773 	jreq del_ln
      008985 74 61            [ 1] 1774 	cp a,#CTRL_R 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008987 74 65            [ 1] 1775 	jreq reprint 
                                   1776 ;	cp a,#'[
                                   1777 ;	jreq ansi_seq
      000AA9                       1778 final_test:
      008989 20 61            [ 1] 1779 	cp a,#SPACE
      00898B 74 20            [ 1] 1780 	jrpl accept_char
      00898D 61 62            [ 2] 1781 	jra readln_loop
      000AAF                       1782 ansi_seq:
                                   1783 ;	call getc
                                   1784 ;	cp a,#'C 
                                   1785 ;	jreq rigth_arrow
                                   1786 ;	cp a,#'D 
                                   1787 ;	jreq left_arrow 
                                   1788 ;	jra final_test
      000AAF                       1789 right_arrow:
                                   1790 ;	ld a,#BSP 
                                   1791 ;	call putc 
                                   1792 ;	jra realn_loop 
      000AAF                       1793 left_arrow:
                                   1794 
                                   1795 ;	jra readln_loop
      000AAF                       1796 reprint: 
      00898F 6F 72 74 20      [ 1] 1797 	tnz count 
      008993 70 6F            [ 1] 1798 	jreq readln_loop
      008995 69 6E            [ 1] 1799 	tnz (LL,sp)
      008997 74 2E            [ 1] 1800 	jrne readln_loop
      008999 0A 2D 2D         [ 2] 1801 	ldw x,#tib 
      00899C 2D 2D 2D         [ 4] 1802 	call puts
      00899F 2D 2D 2D 2D      [ 2] 1803 	ldw y,#tib 
      0089A3 2D 2D 2D         [ 1] 1804 	ld a,count 
      0089A6 2D 2D            [ 1] 1805 	ld (LL,sp),a
      0089A8 2D 2D 2D 2D      [ 1] 1806 	clr count 
      0089AC 2D 2D            [ 1] 1807 	clr (LL_HB,sp)
      0089AE 2D 2D 2D         [ 2] 1808 	addw y,(LL_HB,sp)
      0089B1 2D 2D            [ 2] 1809 	jra readln_loop 
      000AD3                       1810 del_ln:
      0089B3 2D 0A            [ 1] 1811 	ld a,(LL,sp)
      0089B5 00 45 50         [ 4] 1812 	call delete
      0089B8 43 3A 00 0A      [ 2] 1813 	ldw y,#tib
      0089BC 59 3A            [ 1] 1814 	clr (y)
      0089BE 00 0A            [ 1] 1815 	clr (LL,sp)
      0089C0 58 3A            [ 2] 1816 	jra readln_loop
      000AE2                       1817 del_back:
      0089C2 00 0A            [ 1] 1818     tnz (LL,sp)
      0089C4 41 3A            [ 1] 1819     jreq readln_loop
      0089C6 00 0A            [ 1] 1820     dec (LL,sp)
      0089C8 43 43            [ 2] 1821     decw y
      0089CA 3A 00            [ 1] 1822     clr  (y)
      0089CC 0A 53 50         [ 4] 1823     call bksp 
      0089CF 3A 00            [ 2] 1824     jra readln_loop	
      0089D1                       1825 accept_char:
      0089D1 52 03            [ 1] 1826 	ld a,#TIB_SIZE-1
      0089D3 0F 03            [ 1] 1827 	cp a, (LL,sp)
      0089D5 A5 80            [ 1] 1828 	jreq readln_loop
      0089D7 27 02            [ 1] 1829 	ld a,(RXCHAR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089D9 03 03            [ 1] 1830 	ld (y),a
      0089DB A4 1F            [ 1] 1831 	inc (LL,sp)
      0089DD 6B 02            [ 1] 1832 	incw y
      0089DF 9F 6B            [ 1] 1833 	clr (y)
      0089E1 01 7B 02         [ 4] 1834 	call putc 
      0089E4 CD 8A            [ 2] 1835 	jra readln_loop
      000B06                       1836 readln_quit:
      0089E6 75 7B            [ 1] 1837 	clr (y)
      0089E8 01 27            [ 1] 1838 	ld a,(LL,sp)
      0089EA 1F C7 00         [ 1] 1839 	ld count,a 
      000B0D                       1840 	_drop VSIZE 
      0089ED 0B 89            [ 2]    1     addw sp,#VSIZE 
      0089EF CD 82            [ 1] 1841 	ld a,#CR
      0089F1 F2 9F 85         [ 4] 1842 	call putc
      0089F4 31               [ 4] 1843 	ret
                                   1844 
                           000001  1845 .if DEBUG 	
                                   1846 ;----------------------------
                                   1847 ; command interface
                                   1848 ; only 3 commands:
                                   1849 ;  'q' to resume application
                                   1850 ;  'p [addr]' to print memory values 
                                   1851 ;  's addr' to print string 
                                   1852 ;----------------------------
                                   1853 ;local variable 
                           000001  1854 	PSIZE=1
                           000001  1855 	VSIZE=1 
      000B15                       1856 cmd_itf:
      0089F5 00 0B            [ 2] 1857 	sub sp,#VSIZE 
      0089F7 C0 00 0B 2B      [ 1] 1858 	clr farptr 
      0089FB 0E 6B 01 A6      [ 1] 1859 	clr farptr+1 
      0089FF 20 0D 01 27      [ 1] 1860 	clr farptr+2  
      000B23                       1861 repl:
      008A03 06 5A            [ 1] 1862 	ld a,#CR 
      008A05 F7 0A 01         [ 4] 1863 	call putc 
      008A08 20 F6            [ 1] 1864 	ld a,#'? 
      008A0A CD 01 9E         [ 4] 1865 	call putc
      008A0A CD 82 30 0D      [ 1] 1866 	clr in.w 
      008A0E 03 27 05 A6      [ 1] 1867 	clr in 
      008A12 20 CD 82         [ 4] 1868 	call readln
      008A15 1E 5B 03 81      [ 2] 1869 	ldw y,#tib  
      008A19 90 F6            [ 1] 1870 	ld a,(y)
      008A19 52 01            [ 1] 1871 	jreq repl  
      008A1B 0F 01 90 AE      [ 1] 1872 	inc in 
      008A1F 17 3F 90         [ 4] 1873 	call to_upper 
      008A22 7F C6            [ 1] 1874 	cp a,#'Q 
      008A24 00 08            [ 1] 1875 	jrne test_p
      000B4B                       1876 repl_exit:
      008A26 A1 0A 26 06      [ 1] 1877 	clr tib 
      008A2A 5D 2A 03 03      [ 1] 1878 	clr count 
      008A2E 01 50 00 01      [ 1] 1879 	clr in 
      008A30                       1880 	_drop #VSIZE 	
      008A30 C6 00            [ 2]    1     addw sp,##VSIZE 
      008A32 08               [ 4] 1881 	ret  
      000B5A                       1882 invalid:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A33 62 AB 30         [ 2] 1883 	ldw x,#invalid_cmd 
      008A36 A1 3A 2B         [ 4] 1884 	call puts 
      008A39 02 AB            [ 2] 1885 	jra repl 
      000B62                       1886 test_p:	
      008A3B 07 90            [ 1] 1887     cp a,#'P 
      008A3D 5A 90            [ 1] 1888 	jreq mem_peek
      008A3F F7 5D            [ 1] 1889     cp a,#'S 
      008A41 26 ED            [ 1] 1890 	jrne invalid 
      000B6A                       1891 print_string:	
      008A43 A6 10 C1         [ 4] 1892 	call get_token
      008A46 00 08            [ 1] 1893 	cp a,#TK_INTGR 
      008A48 26 08            [ 1] 1894 	jrne invalid 
      008A4A A6 24 90         [ 4] 1895 	call puts
      008A4D 5A 90 F7         [ 2] 1896 	jp repl 	
      000B77                       1897 mem_peek:
      008A50 20 0A            [ 1] 1898 	ld a,#SPACE 
      008A52 0D 01 27         [ 4] 1899 	call skip  	 
      008A55 06 A6 2D 90      [ 2] 1900 	addw y,in.w 
      008A59 5A 90 F7         [ 2] 1901 	ldw x,#pad 
      008A5C CD 02 90         [ 4] 1902 	call strcpy
      008A5C 93 1D 17         [ 4] 1903 	call atoi24 	
      008A5F 3F 50 08         [ 1] 1904 	ld a, acc24 
      008A61 CA 00 09         [ 1] 1905 	or a,acc16 
      008A61 90 5A A6         [ 1] 1906 	or a,acc8 
      008A64 20 90            [ 1] 1907 	jrne 1$ 
      008A66 F7 5C            [ 2] 1908 	jra peek_byte  
      008A68 9F C1 00         [ 2] 1909 1$:	ldw x,acc24 
      008A6B 26 2B F3         [ 2] 1910 	ldw farptr,x 
      008A6E C6 00 0A         [ 1] 1911 	ld a,acc8 
      008A6E 93 CD 82         [ 1] 1912 	ld farptr+2,a 
      000BA2                       1913 peek_byte:
      008A71 30 5B 01         [ 4] 1914 	call print_farptr 
      008A74 81 08            [ 1] 1915 	ld a,#8 
      008A75 6B 01            [ 1] 1916 	ld (PSIZE,sp),a 
      008A75 52               [ 1] 1917 	clrw x 
      008A76 02 6B 02         [ 4] 1918 1$:	call fetchc  
      008A79 0F               [ 2] 1919 	pushw x 
      008A7A 01 A1 0A         [ 1] 1920 	ld acc8,a 
      008A7D 26               [ 1] 1921 	clrw x 
      008A7E 0A 72 0F         [ 2] 1922 	ldw acc24,x 
      008A81 00 09            [ 1] 1923 	ld a,#16+128
      008A83 05 03 01         [ 4] 1924 	call prti24
      008A86 CD               [ 2] 1925 	popw x 
      008A87 8A E4            [ 1] 1926 	dec (PSIZE,sp)
      008A89 26 EB            [ 1] 1927 	jrne 1$ 
      008A89 AE 17            [ 1] 1928 	ld a,#8 
      008A8B 3F 7F 15         [ 1] 1929 	add a,farptr+2 
      008A8D C7 00 15         [ 1] 1930 	ld farptr+2,a
      008A8D 7B               [ 1] 1931 	clr a 
      008A8E 02 CD 8A         [ 1] 1932 	adc a,farptr+1 
      008A91 BC AB 30         [ 1] 1933 	ld farptr+1,a 
      008A94 A1               [ 1] 1934 	clr a 
      008A95 3A 2B 02         [ 1] 1935 	adc a,farptr 
      008A98 AB 07 5A         [ 1] 1936 	ld farptr,a 
      008A9B F7 C6 00         [ 2] 1937 	jp repl  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1938 
      008A9E 09 CA 00 0A CA 00 0B  1939 invalid_cmd: .asciz "not a command\n" 
             26 E6 7B 02 A1 10 27
             08
                                   1940 
                                   1941 ;----------------------------
                                   1942 ; display farptr address
                                   1943 ;----------------------------
      000BE7                       1944 print_farptr:
      008AAD 7B 01 27         [ 1] 1945 	ld a ,farptr+2 
      008AB0 08 A6 2D         [ 1] 1946 	ld acc8,a 
      008AB3 20 02 A6         [ 2] 1947 	ldw x,farptr 
      008AB6 24 5A F7         [ 2] 1948 	ldw acc24,x 
      008AB9 5F               [ 1] 1949 	clrw x 
      008AB9 5B 02            [ 1] 1950 	ld a,#16 
      008ABB 81 09 51         [ 4] 1951 	call prti24
      008ABC A6 20            [ 1] 1952 	ld a,#SPACE 
      008ABC 89 88 C6         [ 4] 1953 	call putc 
      008ABF 00 09 95         [ 4] 1954 	call putc 
      008AC2 C6               [ 4] 1955 	ret
                                   1956 
                                   1957 ;------------------------------------
                                   1958 ; get byte at address farptr[X]
                                   1959 ; input:
                                   1960 ;	 farptr   address to peek
                                   1961 ;    X		  farptr index 	
                                   1962 ; output:
                                   1963 ;	 A 		  byte from memory  
                                   1964 ;    x		  incremented by 1
                                   1965 ;------------------------------------
      000C02                       1966 fetchc: ; @C
      008AC3 00 0A 97 7B      [ 5] 1967 	ldf a,([farptr],x)
      008AC7 01               [ 1] 1968 	incw x
      008AC8 62               [ 4] 1969 	ret
                                   1970 
                                   1971 
                                   1972 ;------------------------------------
                                   1973 ; expect a number from command line 
                                   1974 ; next argument
                                   1975 ;  input:
                                   1976 ;	  none
                                   1977 ;  output:
                                   1978 ;    acc24   int24_t 
                                   1979 ;------------------------------------
      000C08                       1980 number::
      008AC9 88 9E C7         [ 4] 1981 	call get_token
      008ACC 00 09 9F         [ 4] 1982 	call atoi24
      008ACF C7               [ 4] 1983 	ret
                                   1984 .endif ; DEBUG 
                                   1985 
                                   1986 ;------------------------------------
                                   1987 ; parse quoted string 
                                   1988 ; input:
                                   1989 ;   Y 	pointer to tib 
                                   1990 ;   X   pointer to pad
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   1991 ; output:
                                   1992 ;	pad   parsed string
                                   1993 ;   TOS  char* to pad  
                                   1994 ;------------------------------------
                           000001  1995 	PREV = 1
                           000002  1996 	CURR =2 
                           000002  1997 	VSIZE=2 
      000C0F                       1998 parse_quote: ; { -- addr }
      000C0F                       1999 	_vars VSIZE 
      008AD0 00 0A            [ 2]    1     sub sp,#VSIZE 
      008AD2 84               [ 1] 2000 	clr a
      008AD3 95 C6            [ 1] 2001 1$:	ld (PREV,sp),a 
      008AD5 00 0B 97 7B      [ 1] 2002 2$:	inc in
      008AD9 01 62 6B         [ 4] 2003 	ld a,([in.w],y)
      008ADC 01 9F            [ 1] 2004 	jreq 6$
      008ADE C7 00            [ 1] 2005 	ld (CURR,sp),a 
      008AE0 0B 84            [ 1] 2006 	ld a,#'\
      008AE2 85 81            [ 1] 2007 	cp a, (PREV,sp)
      008AE4 26 0A            [ 1] 2008 	jrne 3$
      008AE4 72 53            [ 1] 2009 	clr (PREV,sp)
      008AE6 00 0B            [ 1] 2010 	ld a,(CURR,sp)
      008AE8 72 53            [ 4] 2011 	callr convert_escape
      008AEA 00               [ 1] 2012 	ld (x),a 
      008AEB 0A               [ 1] 2013 	incw x 
      008AEC 72 53            [ 2] 2014 	jra 2$
      000C2F                       2015 3$:
      008AEE 00 09            [ 1] 2016 	ld a,(CURR,sp)
      008AF0 A6 01            [ 1] 2017 	cp a,#'\'
      008AF2 CB 00            [ 1] 2018 	jreq 1$
      008AF4 0B C7            [ 1] 2019 	cp a,#'"
      008AF6 00 0B            [ 1] 2020 	jreq 5$ 
      008AF8 4F               [ 1] 2021 	ld (x),a 
      008AF9 C9               [ 1] 2022 	incw x 
      008AFA 00 0A            [ 2] 2023 	jra 2$
      008AFC C7 00 0A 4F      [ 1] 2024 5$:	inc in 
      008B00 C9               [ 1] 2025 6$: clr (x)
      008B01 00 09 C7         [ 2] 2026 	ldw x,#pad 
      000C45                       2027 	_drop VSIZE
      008B04 00 09            [ 2]    1     addw sp,#VSIZE 
      008B06 81 0A            [ 1] 2028 	ld a,#TK_QSTR  
      008B07 81               [ 4] 2029 	ret 
                                   2030 
                                   2031 ;---------------------------------------
                                   2032 ; called by parse_quote
                                   2033 ; subtitute escaped character 
                                   2034 ; by their ASCII value .
                                   2035 ; input:
                                   2036 ;   A  character following '\'
                                   2037 ; output:
                                   2038 ;   A  substitued char or same if not valid.
                                   2039 ;---------------------------------------
      000C4A                       2040 convert_escape:
      008B07 5F               [ 2] 2041 	pushw x 
      008B08 89 90 AE         [ 2] 2042 	ldw x,#escaped 
      008B0B 16               [ 1] 2043 1$:	cp a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008B0C C8 06            [ 1] 2044 	jreq 2$
      008B0D 7D               [ 1] 2045 	tnz (x)
      008B0D CD 82            [ 1] 2046 	jreq 3$
      008B0F 27               [ 1] 2047 	incw x 
      008B10 6B 01            [ 2] 2048 	jra 1$
      008B12 A1 0D 26         [ 2] 2049 2$: subw x,#escaped 
      008B15 03               [ 1] 2050 	ld a,xl 
      008B16 CC 8B            [ 1] 2051 	add a,#7
      008B18 86               [ 2] 2052 3$:	popw x 
      008B19 A1               [ 4] 2053 	ret 
                                   2054 
      008B1A 0A 27 69 A1 08 27 41  2055 escaped: .asciz "abtnvfr"
             A1
                                   2056 
                                   2057 ;-------------------------
                                   2058 ; integer parser 
                                   2059 ; input:
                                   2060 ;   X 		point to pad 
                                   2061 ;   Y 		point to tib 
                                   2062 ;   A 	    first digit|'$' 
                                   2063 ; output:  
                                   2064 ;   pad     number string 
                                   2065 ;   X 		integer 
                                   2066 ;   A 		TK_INTGR
                                   2067 ;-------------------------
                           000001  2068 	BASE=1
                           000002  2069 	TCHAR=2 
                           000002  2070 	VSIZE=2 
      000C67                       2071 parse_integer: ; { -- n }
      008B22 04 27            [ 1] 2072 	push #0 ; TCHAR 
      008B24 2E A1            [ 1] 2073 	cp a,#'$
      008B26 12 27            [ 1] 2074 	jreq 1$ 
      008B28 06 0A            [ 1] 2075 	push #10 ; BASE=10 
      008B29 20 02            [ 2] 2076 	jra 2$ 
      008B29 A1 20            [ 1] 2077 1$: push #16  ; BASE=16
      008B2B 2A               [ 1] 2078 2$:	ld (x),a 
      008B2C 44               [ 1] 2079 	incw x 
      008B2D 20 DE 00 01      [ 1] 2080 	inc in 
      008B2F 91 D6 00         [ 4] 2081 	ld a,([in.w],y)
      008B2F CD 0E C3         [ 4] 2082 	call to_upper 
      008B2F 6B 02            [ 1] 2083 	ld (TCHAR,sp),a 
      008B2F CD 0E BA         [ 4] 2084 	call is_digit 
      008B2F 72 5D            [ 1] 2085 	jrc 2$
      008B31 00 03            [ 1] 2086 	ld a,#16 
      008B33 27 D8            [ 1] 2087 	cp a,(BASE,sp)
      008B35 0D 02            [ 1] 2088 	jrne 3$ 
      008B37 26 D4            [ 1] 2089 	ld a,(TCHAR,sp)
      008B39 AE 16            [ 1] 2090 	cp a,#'A 
      008B3B C8 CD            [ 1] 2091 	jrmi 3$ 
      008B3D 82 30            [ 1] 2092 	cp a,#'G 
      008B3F 90 AE            [ 1] 2093 	jrmi 2$ 
      008B41 16               [ 1] 2094 3$:	clr (x)
      008B42 C8 C6 00         [ 4] 2095 	call atoi24
      008B45 03 6B 02         [ 2] 2096 	ldw x,acc16 
      008B48 72 5F            [ 1] 2097 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      000C9F                       2098 	_drop VSIZE  
      008B4A 00 03            [ 2]    1     addw sp,#VSIZE 
      008B4C 0F               [ 4] 2099 	ret 	
                                   2100 
                                   2101 ;-------------------------
                                   2102 ; binary integer parser 
                                   2103 ; input:
                                   2104 ;   X 		point to pad 
                                   2105 ;   Y 		point to tib 
                                   2106 ;   A 	    '%' 
                                   2107 ; output:  
                                   2108 ;   pad     number string 
                                   2109 ;   X 		integer 
                                   2110 ;   A 		TK_INTGR
                                   2111 ;   TOS     integer 
                                   2112 ;-------------------------
                           000001  2113 	BINARY=1
                           000002  2114 	VSIZE=2
      000CA2                       2115 parse_binary: ; { -- n }
      008B4D 01 72            [ 1] 2116 	push #0
      008B4F F9 01            [ 1] 2117 	push #0
      008B51 20               [ 1] 2118 1$: ld (x),a 
      008B52 BA               [ 1] 2119 	incw x 
      008B53 72 5C 00 01      [ 1] 2120 	inc in 
      008B53 7B 02 CD         [ 4] 2121 	ld a,([in.w],y)
      008B56 82 4A            [ 1] 2122 	cp a,#'0 
      008B58 90 AE            [ 1] 2123 	jreq 2$
      008B5A 16 C8            [ 1] 2124 	cp a,#'1 
      008B5C 90 7F            [ 1] 2125 	jreq 2$ 
      008B5E 0F 02            [ 2] 2126 	jra bin_exit 
      008B60 20 AB            [ 1] 2127 2$: sub a,#'0	
      008B62 46               [ 1] 2128 	rrc a 
      008B62 0D 02            [ 1] 2129 	rlc (BINARY+1,sp)
      008B64 27 A7            [ 1] 2130 	rlc (BINARY,sp)
      008B66 0A 02            [ 2] 2131 	jra 1$  
      000CC2                       2132 bin_exit:
      008B68 90               [ 1] 2133 	clr (x)
      008B69 5A 90            [ 2] 2134 	ldw x,(BINARY,sp)
      008B6B 7F CD            [ 1] 2135 	ld a,#TK_INTGR 	
      000CC7                       2136 	_drop VSIZE 
      008B6D 82 3A            [ 2]    1     addw sp,#VSIZE 
      008B6F 20               [ 4] 2137 	ret
                                   2138 
                                   2139 ;---------------------------
                                   2140 ;  token begin with a letter,
                                   2141 ;  is keyword or variable. 	
                                   2142 ; input:
                                   2143 ;   X 		point to pad 
                                   2144 ;   Y 		point to text
                                   2145 ;   A 	    first letter  
                                   2146 ; output:
                                   2147 ;   X		exec_addr|var_addr 
                                   2148 ;   A 		TK_CMD 
                                   2149 ;   pad 	keyword|var_name  
                                   2150 ;   TOS     exec_addr|var_addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2151 ;--------------------------  
      000CCA                       2152 parse_keyword: ; { -- exec_addr|var_addr}
      008B70 9C 0E C3         [ 4] 2153 	call to_upper 
      008B71 F7               [ 1] 2154 	ld (x),a 
      008B71 A6               [ 1] 2155 	incw x 
      008B72 4F 11 02 27      [ 1] 2156 	inc in 
      008B76 96 7B 01         [ 4] 2157 	ld a,([in.w],y)
      008B79 90 F7 0C         [ 4] 2158 	call is_alpha 
      008B7C 02 90            [ 1] 2159 	jrc parse_keyword 
      008B7E 5C               [ 1] 2160 1$: clr (x)
      008B7F 90 7F CD 82      [ 1] 2161 	tnz pad+1 
      008B83 1E 20            [ 1] 2162 	jrne 2$
                                   2163 ; one letter variable name 
      008B85 87 17 18         [ 1] 2164 	ld a,pad 
      008B86 A0 41            [ 1] 2165 	sub a,#'A 
      008B86 90               [ 1] 2166 	sll a 
      008B87 7F               [ 1] 2167 	push a 
      008B88 7B 02            [ 1] 2168 	push #0
      008B8A C7 00 03         [ 2] 2169 	ldw x,#vars 
      008B8D 5B 02 A6         [ 2] 2170 	addw x,(1,sp) ; X=var address 
      000CF1                       2171 	_drop 2 
      008B90 0D CD            [ 2]    1     addw sp,#2 
      008B92 82 1E            [ 1] 2172 	ld a,#TK_VAR 
      008B94 81 0C            [ 2] 2173 	jra 4$ 
      008B95                       2174 2$: ; check for keyword, otherwise syntax error.
      000CF7                       2175 	_ldx_dict kword_dict
      008B95 52 01 72         [ 2]    1     ldw x,#kword_dict+2
      008B98 5F 00 14         [ 4] 2176 	call search_dict
      008B9B 72               [ 1] 2177 	tnz a
      008B9C 5F 00            [ 1] 2178 	jrne 4$ 
      008B9E 15 72 5F         [ 2] 2179 	jp syntax_error
      008BA1 00               [ 4] 2180 4$:	ret  	
                                   2181 
                                   2182 
                                   2183 ;------------------------------------
                                   2184 ; Command line tokenizer
                                   2185 ; scan text for next token
                                   2186 ; move token in 'pad'
                                   2187 ; input: 
      000D04                       2188 	none: 
                                   2189 ; use:
                                   2190 ;	Y   pointer to text
                                   2191 ;   X	pointer to pad 
                                   2192 ;   in.w   index in text buffer
                                   2193 ; output:
                                   2194 ;   A       token attribute 
                                   2195 ;   pad 	token as .asciz
                                   2196 ;   X 		token value   
                                   2197 ;------------------------------------
                                   2198 	; use to check special character 
                                   2199 	.macro _case c t  
                                   2200 	ld a,#c 
                                   2201 	cp a,(TCHAR,sp) 
                                   2202 	jrne t
                                   2203 	.endm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2204 
                           000001  2205 	TCHAR=1
                           000002  2206 	ATTRIB=2 
                           000002  2207 	VSIZE=2
      000D04                       2208 get_token: 
      008BA2 16 AE 16 C8      [ 2] 2209 	ldw y,#tib    	
      008BA3 C6 00 01         [ 1] 2210 	ld a,in 
      008BA3 A6 0D CD         [ 1] 2211 	cp a,count 
      008BA6 82 1E            [ 1] 2212 	jrmi 1$
      008BA8 A6 3F            [ 1] 2213 	ld a,#TK_NONE 
      008BAA CD               [ 4] 2214 	ret 
      000D13                       2215 1$:	
      000D13                       2216 	_vars VSIZE
      008BAB 82 1E            [ 2]    1     sub sp,#VSIZE 
      008BAD 72 5F 00         [ 2] 2217 	ldw x, #pad
      008BB0 01 72            [ 1] 2218 	ld a,#SPACE
      008BB2 5F 00 02         [ 4] 2219 	call skip
      008BB5 CD 8B 07         [ 2] 2220 	ldw in.w.saved,x 
      008BB8 90 AE 16         [ 4] 2221 	ld a,([in.w],y)
      008BBB C8 90            [ 1] 2222 	jrne str_tst
      008BBD F6 27 E3 72      [ 1] 2223 	clr pad 
      008BC1 5C 00 02         [ 2] 2224 	jp token_exit ; end of line 
                                   2225 
      000D2C                       2226 str_tst: ; check for quoted string  	
      008BC4 CD 8F 43         [ 4] 2227 	call to_upper 
      008BC7 A1 51            [ 1] 2228 	ld (TCHAR,sp),a 
      000D31                       2229 	_case '"' nbr_tst
      008BC9 26 17            [ 1]    1 	ld a,#'"' 
      008BCB 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BCB 72 5F            [ 1]    3 	jrne nbr_tst
      008BCD 16 C8 72         [ 4] 2230 	call parse_quote
      008BD0 5F 00 03         [ 2] 2231 	jp token_exit
      000D3D                       2232 nbr_tst: ; check for number 
      008BD3 72 5F            [ 1] 2233 	ld a,#'$'
      008BD5 00 02            [ 1] 2234 	cp a,(TCHAR,sp) 
      008BD7 5B 01            [ 1] 2235 	jreq 1$
      008BD9 81 26            [ 1] 2236 	ld a,#'&
      008BDA 11 01            [ 1] 2237 	cp a,(TCHAR,sp)
      008BDA AE 8C            [ 1] 2238 	jrne 0$
      008BDC 58 CD 82         [ 4] 2239 	call parse_binary ; expect binary integer 
      008BDF 30 20 C1         [ 2] 2240 	jp token_exit 
      008BE2 7B 01            [ 1] 2241 0$:	ld a,(TCHAR,sp)
      008BE2 A1 50 27         [ 4] 2242 	call is_digit
      008BE5 11 A1            [ 1] 2243 	jrnc 3$
      008BE7 53 26 F0         [ 4] 2244 1$:	call parse_integer 
      008BEA CC 0E B7         [ 2] 2245 	jp token_exit 
      000D5C                       2246 3$: 
      000D5C                       2247 	_case '(' bkslsh_tst 
      008BEA CD 8D            [ 1]    1 	ld a,#'(' 
      008BEC 84 A1            [ 1]    2 	cp a,(TCHAR,sp) 
      008BEE 03 26            [ 1]    3 	jrne bkslsh_tst
      008BF0 E9 CD            [ 1] 2248 	ld a,#TK_LPAREN
      008BF2 82 30 CC         [ 2] 2249 	jp token_char   	
      000D67                       2250 bkslsh_tst:
      000D67                       2251 	_case '\',rparnt_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008BF5 8B A3            [ 1]    1 	ld a,#'\' 
      008BF7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BF7 A6 20            [ 1]    3 	jrne rparnt_tst
      008BF9 CD 8F            [ 1] 2252 	ld a,(TCHAR,sp)
      008BFB FB               [ 1] 2253 	ld (x),a 
      008BFC 72               [ 1] 2254 	incw x 
      008BFD B9 00 01 AE      [ 1] 2255 	inc in 
      008C01 17 18 CD         [ 4] 2256 	ld a,([in.w],y)
      008C04 83               [ 1] 2257 	ld (x),a 
      008C05 10               [ 1] 2258 	incw x 
      008C06 CD 8F 4F C6      [ 1] 2259 	inc in  
      008C0A 00               [ 1] 2260 	clr (x) 
      008C0B 09               [ 1] 2261 	ld xl,a 
      008C0C CA 00            [ 1] 2262 	ld a,#TK_CHAR 
      008C0E 0A CA 00         [ 2] 2263 	jp token_exit 
      000D85                       2264 rparnt_tst:		
      000D85                       2265 	_case ')' colon_tst 
      008C11 0B 26            [ 1]    1 	ld a,#')' 
      008C13 02 20            [ 1]    2 	cp a,(TCHAR,sp) 
      008C15 0C CE            [ 1]    3 	jrne colon_tst
      008C17 00 09            [ 1] 2266 	ld a,#TK_RPAREN 
      008C19 CF 00 14         [ 2] 2267 	jp token_char 
      000D90                       2268 colon_tst:
      000D90                       2269 	_case ':' comma_tst 
      008C1C C6 00            [ 1]    1 	ld a,#':' 
      008C1E 0B C7            [ 1]    2 	cp a,(TCHAR,sp) 
      008C20 00 16            [ 1]    3 	jrne comma_tst
      008C22 A6 01            [ 1] 2270 	ld a,#TK_COLON 
      008C22 CD 8C 67         [ 2] 2271 	jp token_char 
      000D9B                       2272 comma_tst:
      000D9B                       2273 	_case COMMA sharp_tst 
      008C25 A6 08            [ 1]    1 	ld a,#COMMA 
      008C27 6B 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C29 5F CD            [ 1]    3 	jrne sharp_tst
      008C2B 8C 82            [ 1] 2274 	ld a,#TK_COMMA
      008C2D 89 C7 00         [ 2] 2275 	jp token_char
      000DA6                       2276 sharp_tst:
      000DA6                       2277 	_case SHARP dash_tst 
      008C30 0B 5F            [ 1]    1 	ld a,#SHARP 
      008C32 CF 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008C34 09 A6            [ 1]    3 	jrne dash_tst
      008C36 90 CD            [ 1] 2278 	ld a,#TK_SHARP
      008C38 89 D1 85         [ 2] 2279 	jp token_char  	 	 
      000DB1                       2280 dash_tst: 	
      000DB1                       2281 	_case '-' at_tst 
      008C3B 0A 01            [ 1]    1 	ld a,#'-' 
      008C3D 26 EB            [ 1]    2 	cp a,(TCHAR,sp) 
      008C3F A6 08            [ 1]    3 	jrne at_tst
      008C41 CB 00            [ 1] 2282 	ld a,#TK_MINUS  
      008C43 16 C7 00         [ 2] 2283 	jp token_char 
      000DBC                       2284 at_tst:
      000DBC                       2285 	_case '@' qmark_tst 
      008C46 16 4F            [ 1]    1 	ld a,#'@' 
      008C48 C9 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008C4A 15 C7            [ 1]    3 	jrne qmark_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008C4C 00 15            [ 1] 2286 	ld a,#TK_ARRAY 
      008C4E 4F C9 00         [ 2] 2287 	jp token_char
      000DC7                       2288 qmark_tst:
      000DC7                       2289 	_case '?' tick_tst 
      008C51 14 C7            [ 1]    1 	ld a,#'?' 
      008C53 00 14            [ 1]    2 	cp a,(TCHAR,sp) 
      008C55 CC 8B            [ 1]    3 	jrne tick_tst
      008C57 A3 6E            [ 1] 2290 	ld a,(TCHAR,sp)
      008C59 6F               [ 1] 2291 	ld (x),a 
      008C5A 74               [ 1] 2292 	incw x 
      008C5B 20               [ 1] 2293 	clr (x)
      008C5C 61 20 63 6F      [ 1] 2294 	inc in 
      008C60 6D 6D            [ 1] 2295 	ld a,#TK_CMD 
      008C62 61 6E 64         [ 2] 2296 	ldw x,#print 
      008C65 0A 00 B7         [ 2] 2297 	jp token_exit
      008C67                       2298 tick_tst: ; ignore comment 
      000DDE                       2299 	_case TICK plus_tst 
      008C67 C6 00            [ 1]    1 	ld a,#TICK 
      008C69 16 C7            [ 1]    2 	cp a,(TCHAR,sp) 
      008C6B 00 0B            [ 1]    3 	jrne plus_tst
      008C6D CE 00 14 CF      [ 1] 2300 	inc in 
      008C71 00 09            [ 1] 2301 	ld a,#TK_CMD 
      008C73 5F A6 10         [ 2] 2302 	ldw x,#rem 
      008C76 CD 89 D1         [ 2] 2303 	jp token_exit 
      000DF0                       2304 plus_tst:
      000DF0                       2305 	_case '+' star_tst 
      008C79 A6 20            [ 1]    1 	ld a,#'+' 
      008C7B CD 82            [ 1]    2 	cp a,(TCHAR,sp) 
      008C7D 1E CD            [ 1]    3 	jrne star_tst
      008C7F 82 1E            [ 1] 2306 	ld a,#TK_PLUS  
      008C81 81 0E A7         [ 2] 2307 	jp token_char 
      008C82                       2308 star_tst:
      000DFB                       2309 	_case '*' slash_tst 
      008C82 92 AF            [ 1]    1 	ld a,#'*' 
      008C84 00 14            [ 1]    2 	cp a,(TCHAR,sp) 
      008C86 5C 81            [ 1]    3 	jrne slash_tst
      008C88 A6 20            [ 1] 2310 	ld a,#TK_MULT 
      008C88 CD 8D 84         [ 2] 2311 	jp token_char 
      000E06                       2312 slash_tst: 
      000E06                       2313 	_case '/' prcnt_tst 
      008C8B CD 8F            [ 1]    1 	ld a,#'/' 
      008C8D 4F 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008C8F 26 05            [ 1]    3 	jrne prcnt_tst
      008C8F 52 02            [ 1] 2314 	ld a,#TK_DIV 
      008C91 4F 6B 01         [ 2] 2315 	jp token_char 
      000E11                       2316 prcnt_tst:
      000E11                       2317 	_case '%' eql_tst 
      008C94 72 5C            [ 1]    1 	ld a,#'%' 
      008C96 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008C98 91 D6            [ 1]    3 	jrne eql_tst
      008C9A 01 27            [ 1] 2318 	ld a,#TK_MOD
      008C9C 24 6B 02         [ 2] 2319 	jp token_char  
                                   2320 ; 1 or 2 character tokens 	
      000E1C                       2321 eql_tst:
      000E1C                       2322 	_case '=' gt_tst 		
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008C9F A6 5C            [ 1]    1 	ld a,#'=' 
      008CA1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA3 26 0A            [ 1]    3 	jrne gt_tst
      008CA5 0F 01            [ 1] 2323 	ld a,#TK_EQUAL
      008CA7 7B 02 AD         [ 2] 2324 	jp token_char 
      000E27                       2325 gt_tst:
      000E27                       2326 	_case '>' lt_tst 
      008CAA 1F F7            [ 1]    1 	ld a,#'>' 
      008CAC 5C 20            [ 1]    2 	cp a,(TCHAR,sp) 
      008CAE E5 33            [ 1]    3 	jrne lt_tst
      008CAF A6 31            [ 1] 2327 	ld a,#TK_GT 
      008CAF 7B 02            [ 1] 2328 	ld (ATTRIB,sp),a 
      008CB1 A1 5C 27 DD      [ 1] 2329 	inc in 
      008CB5 A1 22 27         [ 4] 2330 	ld a,([in.w],y)
      008CB8 04 F7            [ 1] 2331 	cp a,#'=
      008CBA 5C 20            [ 1] 2332 	jrne 1$
      008CBC D7 72            [ 1] 2333 	ld a,(TCHAR,sp)
      008CBE 5C               [ 1] 2334 	ld (x),a
      008CBF 00               [ 1] 2335 	incw x 
      008CC0 02 7F            [ 1] 2336 	ld a,#'=
      008CC2 AE 17            [ 1] 2337 	ld (TCHAR,sp),a 
      008CC4 18 5B            [ 1] 2338 	ld a,#TK_GE 
      008CC6 02 A6            [ 2] 2339 	jra token_char  
      008CC8 0A 81            [ 1] 2340 1$: cp a,#'<
      008CCA 26 0C            [ 1] 2341 	jrne 2$
      008CCA 89 AE            [ 1] 2342 	ld a,(TCHAR,sp)
      008CCC 8C               [ 1] 2343 	ld (x),a
      008CCD DF               [ 1] 2344 	incw x 
      008CCE F1 27            [ 1] 2345 	ld a,#'<	
      008CD0 06 7D            [ 1] 2346 	ld (TCHAR,sp),a 
      008CD2 27 09            [ 1] 2347 	ld a,#TK_NE 
      008CD4 5C 20            [ 2] 2348 	jra token_char 
      008CD6 F7 1D 8C DF      [ 1] 2349 2$: dec in
      008CDA 9F AB            [ 1] 2350 	ld a,(ATTRIB,sp)
      008CDC 07 85            [ 2] 2351 	jra token_char 
      000E60                       2352 lt_tst:
      000E60                       2353 	_case '<' other
      008CDE 81 61            [ 1]    1 	ld a,#'<' 
      008CE0 62 74            [ 1]    2 	cp a,(TCHAR,sp) 
      008CE2 6E 76            [ 1]    3 	jrne other
      008CE4 66 72            [ 1] 2354 	ld a,#TK_LT 
      008CE6 00 02            [ 1] 2355 	ld (ATTRIB,sp),a 
      008CE7 72 5C 00 01      [ 1] 2356 	inc in 
      008CE7 4B 00 A1         [ 4] 2357 	ld a,([in.w],y)
      008CEA 24 27            [ 1] 2358 	cp a,#'=
      008CEC 04 4B            [ 1] 2359 	jrne 1$
      008CEE 0A 20            [ 1] 2360 	ld a,(TCHAR,sp)
      008CF0 02               [ 1] 2361 	ld (x),a 
      008CF1 4B 10            [ 1] 2362 	ld a,#'=
      008CF3 F7 5C            [ 1] 2363 	ld (TCHAR,sp),a 
      008CF5 72 5C            [ 1] 2364 	ld a,#TK_LE 
      008CF7 00 02            [ 2] 2365 	jra token_char 
      008CF9 91 D6            [ 1] 2366 1$: cp a,#'>
      008CFB 01 CD            [ 1] 2367 	jrne 2$
      008CFD 8F 43            [ 1] 2368 	ld a,(TCHAR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008CFF 6B               [ 1] 2369 	ld (x),a 
      008D00 02               [ 1] 2370 	incw x 
      008D01 CD 8F            [ 1] 2371 	ld a,#'>
      008D03 3A 25            [ 1] 2372 	ld (TCHAR,sp),a 
      008D05 ED A6            [ 1] 2373 	ld a,#TK_NE 
      008D07 10 11            [ 2] 2374 	jra token_char 
      008D09 01 26 0A 7B      [ 1] 2375 2$: dec in 
      008D0D 02 A1            [ 1] 2376 	ld a,(ATTRIB,sp)
      008D0F 41 2B            [ 2] 2377 	jra token_char 	
      000E98                       2378 other: ; not a special character 	 
      008D11 04 A1            [ 1] 2379 	ld a,(TCHAR,sp)
      008D13 47 2B DD         [ 4] 2380 	call is_alpha 
      008D16 7F CD            [ 1] 2381 	jrc 30$ 
      008D18 8F 4F CE         [ 2] 2382 	jp syntax_error 
      000EA2                       2383 30$: 
      008D1B 00 0A A6         [ 4] 2384 	call parse_keyword
      008D1E 03 5B            [ 2] 2385 	jra token_exit 
      000EA7                       2386 token_char:
      008D20 02 81            [ 1] 2387 	ld (ATTRIB,sp),a 
      008D22 7B 01            [ 1] 2388 	ld a,(TCHAR,sp)
      008D22 4B               [ 1] 2389 	ld (x),a 
      008D23 00               [ 1] 2390 	incw x 
      008D24 4B               [ 1] 2391 	clr(x)
      008D25 00 F7 5C 72      [ 1] 2392 	inc in 
      008D29 5C 00            [ 1] 2393 	ld a,(ATTRIB,sp)
      008D2B 02 91 D6         [ 2] 2394 	ldw x,#pad 
      000EB7                       2395 token_exit:
      000EB7                       2396 	_drop VSIZE 
      008D2E 01 A1            [ 2]    1     addw sp,#VSIZE 
      008D30 30               [ 4] 2397 	ret
                                   2398 
                                   2399 
                                   2400 
                                   2401 ;------------------------------------
                                   2402 ; check if character in {'0'..'9'}
                                   2403 ; input:
                                   2404 ;    A  character to test
                                   2405 ; output:
                                   2406 ;    Carry  0 not digit | 1 digit
                                   2407 ;------------------------------------
      000EBA                       2408 is_digit:
      008D31 27 06            [ 1] 2409 	cp a,#'0
      008D33 A1 31            [ 1] 2410 	jrc 1$
      008D35 27 02            [ 1] 2411     cp a,#'9+1
      008D37 20               [ 1] 2412 	ccf 
      008D38 09               [ 1] 2413 1$:	ccf 
      008D39 A0               [ 4] 2414     ret
                                   2415 
                                   2416 ;------------------------------------
                                   2417 ; convert alpha to uppercase
                                   2418 ; input:
                                   2419 ;    a  character to convert
                                   2420 ; output:
                                   2421 ;    a  uppercase character
                                   2422 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      000EC3                       2423 to_upper::
      008D3A 30 46            [ 1] 2424 	cp a,#'a
      008D3C 09 02            [ 1] 2425 	jrpl 1$
      008D3E 09               [ 4] 2426 0$:	ret
      008D3F 01 20            [ 1] 2427 1$: cp a,#'z	
      008D41 E4 FB            [ 1] 2428 	jrugt 0$
      008D42 A0 20            [ 1] 2429 	sub a,#32
      008D42 7F               [ 4] 2430 	ret
                                   2431 	
                                   2432 ;------------------------------------
                                   2433 ; convert pad content in integer
                                   2434 ; input:
                                   2435 ;    pad		.asciz to convert
                                   2436 ; output:
                                   2437 ;    acc24      int24_t
                                   2438 ;------------------------------------
                                   2439 	; local variables
                           000001  2440 	SIGN=1 ; 1 byte, 
                           000002  2441 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2442 	TEMP=3 ; 1 byte, temporary storage
                           000003  2443 	VSIZE=3 ; 3 bytes reserved for local storage
      000ECF                       2444 atoi24:
      008D43 1E               [ 2] 2445 	pushw x ;save x
      008D44 01 A6            [ 2] 2446 	sub sp,#VSIZE
                                   2447 	; acc24=0 
      008D46 03 5B 02 81      [ 1] 2448 	clr acc24    
      008D4A 72 5F 00 09      [ 1] 2449 	clr acc16
      008D4A CD 8F 43 F7      [ 1] 2450 	clr acc8 
      008D4E 5C 72 5C         [ 1] 2451 	ld a, pad 
      008D51 00 02            [ 1] 2452 	jreq atoi_exit
      008D53 91 D6            [ 1] 2453 	clr (SIGN,sp)
      008D55 01 CD            [ 1] 2454 	ld a,#10
      008D57 85 80            [ 1] 2455 	ld (BASE,sp),a ; default base decimal
      008D59 25 EF 7F         [ 2] 2456 	ldw x,#pad ; pointer to string to convert
      008D5C 72               [ 1] 2457 	ld a,(x)
      008D5D 5D 17            [ 1] 2458 	jreq 9$  ; completed if 0
      008D5F 19 26            [ 1] 2459 	cp a,#'-
      008D61 15 C6            [ 1] 2460 	jrne 1$
      008D63 17 18            [ 1] 2461 	cpl (SIGN,sp)
      008D65 A0 41            [ 2] 2462 	jra 2$
      008D67 48 88            [ 1] 2463 1$: cp a,#'$
      008D69 4B 00            [ 1] 2464 	jrne 3$
      008D6B AE 00            [ 1] 2465 	ld a,#16
      008D6D 27 72            [ 1] 2466 	ld (BASE,sp),a
      008D6F FB               [ 1] 2467 2$:	incw x
      008D70 01               [ 1] 2468 	ld a,(x)
      000F01                       2469 3$:	
      008D71 5B 02            [ 1] 2470 	cp a,#'a
      008D73 A6 04            [ 1] 2471 	jrmi 4$
      008D75 20 0C            [ 1] 2472 	sub a,#32
      008D77 A1 30            [ 1] 2473 4$:	cp a,#'0
      008D77 AE A1            [ 1] 2474 	jrmi 9$
      008D79 B8 CD            [ 1] 2475 	sub a,#'0
      008D7B 91 E0            [ 1] 2476 	cp a,#10
      008D7D 4D 26            [ 1] 2477 	jrmi 5$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008D7F 03 CC            [ 1] 2478 	sub a,#7
      008D81 87 94            [ 1] 2479 	cp a,(BASE,sp)
      008D83 81 1F            [ 1] 2480 	jrpl 9$
      008D84 6B 03            [ 1] 2481 5$:	ld (TEMP,sp),a
      008D84 7B 02            [ 1] 2482 	ld a,(BASE,sp)
      008D84 90 AE 16         [ 4] 2483 	call mulu24_8
      008D87 C8 C6            [ 1] 2484 	ld a,(TEMP,sp)
      008D89 00 02 C1         [ 1] 2485 	add a,acc24+2
      008D8C 00 03 2B         [ 1] 2486 	ld acc24+2,a
      008D8F 03               [ 1] 2487 	clr a
      008D90 A6 00 81         [ 1] 2488 	adc a,acc24+1
      008D93 C7 00 09         [ 1] 2489 	ld acc24+1,a
      008D93 52               [ 1] 2490 	clr a
      008D94 02 AE 17         [ 1] 2491 	adc a,acc24
      008D97 18 A6 20         [ 1] 2492 	ld acc24,a
      008D9A CD 8F            [ 2] 2493 	jra 2$
      008D9C FB CF            [ 1] 2494 9$:	tnz (SIGN,sp)
      008D9E 00 12            [ 1] 2495     jreq atoi_exit
      008DA0 91 D6 01         [ 4] 2496     call neg_acc24
      000F3D                       2497 atoi_exit: 
      008DA3 26 07            [ 2] 2498 	addw sp,#VSIZE
      008DA5 72               [ 2] 2499 	popw x ; restore x
      008DA6 5F               [ 4] 2500 	ret
                                   2501 
                                   2502 ;--------------------------------------
                                   2503 ; unsigned multiply uint24_t by uint8_t
                                   2504 ; use to convert numerical string to uint24_t
                                   2505 ; input:
                                   2506 ;	acc24	uint24_t 
                                   2507 ;   A		uint8_t
                                   2508 ; output:
                                   2509 ;   acc24   A*acc24
                                   2510 ;-------------------------------------
                                   2511 ; local variables offset  on sp
                           000003  2512 	U8   = 3   ; A pushed on stack
                           000002  2513 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2514 	OVFH = 1  ; multiplication overflow high byte
                           000003  2515 	VSIZE = 3
      000F41                       2516 mulu24_8:
      008DA7 17               [ 2] 2517 	pushw x    ; save X
                                   2518 	; local variables
      008DA8 18               [ 1] 2519 	push a     ; U8
      008DA9 CC               [ 1] 2520 	clrw x     ; initialize overflow to 0
      008DAA 8F               [ 2] 2521 	pushw x    ; multiplication overflow
                                   2522 ; multiply low byte.
      008DAB 37 00 0A         [ 1] 2523 	ld a,acc24+2
      008DAC 97               [ 1] 2524 	ld xl,a
      008DAC CD 8F            [ 1] 2525 	ld a,(U8,sp)
      008DAE 43               [ 4] 2526 	mul x,a
      008DAF 6B               [ 1] 2527 	ld a,xl
      008DB0 01 A6 22         [ 1] 2528 	ld acc24+2,a
      008DB3 11               [ 1] 2529 	ld a, xh
      008DB4 01 26            [ 1] 2530 	ld (OVFL,sp),a
                                   2531 ; multipy middle byte
      008DB6 06 CD 8C         [ 1] 2532 	ld a,acc24+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008DB9 8F               [ 1] 2533 	ld xl,a
      008DBA CC 8F            [ 1] 2534 	ld a, (U8,sp)
      008DBC 37               [ 4] 2535 	mul x,a
                                   2536 ; add overflow to this partial product
      008DBD 72 FB 01         [ 2] 2537 	addw x,(OVFH,sp)
      008DBD A6               [ 1] 2538 	ld a,xl
      008DBE 24 11 01         [ 1] 2539 	ld acc24+1,a
      008DC1 27               [ 1] 2540 	clr a
      008DC2 13 A6            [ 1] 2541 	adc a,#0
      008DC4 26 11            [ 1] 2542 	ld (OVFH,sp),a
      008DC6 01               [ 1] 2543 	ld a,xh
      008DC7 26 06            [ 1] 2544 	ld (OVFL,sp),a
                                   2545 ; multiply most signficant byte	
      008DC9 CD 8D 22         [ 1] 2546 	ld a, acc24
      008DCC CC               [ 1] 2547 	ld xl, a
      008DCD 8F 37            [ 1] 2548 	ld a, (U8,sp)
      008DCF 7B               [ 4] 2549 	mul x,a
      008DD0 01 CD 8F         [ 2] 2550 	addw x, (OVFH,sp)
      008DD3 3A               [ 1] 2551 	ld a, xl
      008DD4 24 06 CD         [ 1] 2552 	ld acc24,a
      008DD7 8C E7            [ 2] 2553     addw sp,#VSIZE
      008DD9 CC               [ 2] 2554 	popw x
      008DDA 8F               [ 4] 2555 	ret
                                   2556 
                                   2557 ;------------------------------------
                                   2558 ; skip character c in text starting from 'in'
                                   2559 ; input:
                                   2560 ;	 y 		point to text buffer
                                   2561 ;    a 		character to skip
                                   2562 ; output:  
                                   2563 ;	'in' ajusted to new position
                                   2564 ;------------------------------------
                           000001  2565 	C = 1 ; local var
      000F7B                       2566 skip:
      008DDB 37               [ 1] 2567 	push a
      008DDC 91 D6 00         [ 4] 2568 1$:	ld a,([in.w],y)
      008DDC A6 28            [ 1] 2569 	jreq 2$
      008DDE 11 01            [ 1] 2570 	cp a,(C,sp)
      008DE0 26 05            [ 1] 2571 	jrne 2$
      008DE2 A6 0B CC 8F      [ 1] 2572 	inc in
      008DE6 27 F1            [ 2] 2573 	jra 1$
      008DE7                       2574 2$: _drop 1 
      008DE7 A6 5C            [ 2]    1     addw sp,#1 
      008DE9 11               [ 4] 2575 	ret
                                   2576 	
                                   2577 ;------------------------------
                                   2578 ; restore 'in.w' variable to 
                                   2579 ; its value before last call
                                   2580 ; to get_token.
                                   2581 ;------------------------------
      000F8E                       2582 unget_token:
      008DEA 01 26 18         [ 2] 2583 	ldw x,in.w.saved
      008DED 7B 01 F7         [ 2] 2584 	ldw in.w,x 
      008DF0 5C               [ 4] 2585 	ret 
                                   2586 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2587 
                                   2588 ;******************************
                                   2589 ;  data stack manipulation
                                   2590 ;*****************************
                                   2591 ;----------------------	
                                   2592 ; push X on data stack 
                                   2593 ; input:
                                   2594 ;	X 
                                   2595 ; output:
                                   2596 ;	none 
                                   2597 ;----------------------	
      000F95                       2598 dpush:
      000F95                       2599     _dp_down
      008DF1 72 5C 00 02      [ 1]    1     dec dstkptr+1 
      008DF5 91 D6 01 F7      [ 1]    2     dec dstkptr+1
      008DF9 5C 72 5C 00      [ 5] 2600     ldw [dstkptr],x  
      008DFD 02               [ 4] 2601 	ret 
                                   2602 
                                   2603 
                                   2604 ;----------------------	
                                   2605 ; pop data stack in X 
                                   2606 ; input:
                                   2607 ;	none
                                   2608 ; output:
                                   2609 ;	X   
                                   2610 ;----------------------	
      000FA2                       2611 dpop: 
      008DFE 7F 97 A6 02      [ 5] 2612     ldw x, [dstkptr]
      000FA6                       2613 	_dp_up
      008E02 CC 8F 37 1A      [ 1]    1     inc dstkptr+1
      008E05 72 5C 00 1A      [ 1]    2     inc dstkptr+1
      008E05 A6               [ 4] 2614 	ret 
                                   2615 
                                   2616 ;-----------------------------
                                   2617 ; swap top 2 elements of dstack
                                   2618 ;  {n1 n2 -- n2 n1 }
                                   2619 ;-----------------------------
      000FAF                       2620 dswap:
      008E06 29 11 01 26      [ 5] 2621 	ldw x,[dstkptr]
      008E0A 05               [ 2] 2622 	pushw x 
      008E0B A6 0C CC         [ 2] 2623 	ldw x,#2 
      008E0E 8F 27 00 19      [ 5] 2624 	ldw x,([dstkptr],x) 
      008E10 72 CF 00 19      [ 5] 2625 	ldw [dstkptr],x 
      008E10 A6 3A 11         [ 2] 2626 	ldw x,#2
      008E13 01 26            [ 2] 2627 	popw y 
      008E15 05 A6 01 CC      [ 5] 2628 	ldw ([dstkptr],x),y 
      008E19 8F               [ 4] 2629 	ret
                                   2630 
                                   2631 ;-----------------------------
                                   2632 ; drop TOS 
                                   2633 ;-----------------------------
      000FC9                       2634 ddrop: ; { n -- }
      000FC9                       2635 	_dp_up 
      008E1A 27 5C 00 1A      [ 1]    1     inc dstkptr+1
      008E1B 72 5C 00 1A      [ 1]    2     inc dstkptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008E1B A6               [ 4] 2636 	ret
                                   2637 	
                                   2638 ;-----------------------------
                                   2639 ; duplicate TOS 
                                   2640 ;  dstack: { ix...n -- ix...n n }
                                   2641 ;-----------------------------
      000FD2                       2642 ddup:
      008E1C 2C 11 01 26      [ 5] 2643 	ldw x,[dstkptr]
      000FD6                       2644 	_dp_down
      008E20 05 A6 0D CC      [ 1]    1     dec dstkptr+1 
      008E24 8F 27 00 1A      [ 1]    2     dec dstkptr+1
      008E26 72 CF 00 19      [ 5] 2645     ldw [dstkptr],x  
      008E26 A6               [ 4] 2646 	ret 
                                   2647 
                                   2648 
                                   2649 ;----------------------------------
                                   2650 ; pick value n from dstack 
                                   2651 ; put it on TOS
                                   2652 ; dstack: {ix,..,p -- ix,...,np }
                                   2653 ;-----------------------------------
      000FE3                       2654 dpick:
      008E27 23 11 01 26      [ 5] 2655 	ldw x,[dstkptr]
      008E2B 05               [ 2] 2656 	sllw x 
      008E2C A6 0E CC 8F      [ 2] 2657 	addw x,dstkptr 
      008E30 27               [ 2] 2658 	ldw x,(x)
      008E31 72 CF 00 19      [ 5] 2659 	ldw [dstkptr],x 
      008E31 A6               [ 4] 2660 	ret
                                   2661 
                                   2662 ;---------------------------
                                   2663 ;  fetch variable in X 
                                   2664 ;  dstack:{ addr -- value }
                                   2665 ;---------------------------
      000FF2                       2666 fetch:
      008E32 2D 11 01 26      [ 5] 2667 	ldw x,[dstkptr]
      008E36 05               [ 2] 2668 	ldw x,(x)
      008E37 A6 11 CC 8F      [ 5] 2669 	ldw [dstkptr],x
      008E3B 27               [ 4] 2670 	ret 
                                   2671 
                                   2672 ;----------------------------
                                   2673 ; store variable 
                                   2674 ; dstack: {addr value -- }
                                   2675 ;----------------------------
      008E3C                       2676 store:
      008E3C A6 40 11         [ 4] 2677 	call dpop 
      008E3F 01 26            [ 1] 2678 	ldw y,x   ; y=value 
      008E41 05 A6 05         [ 4] 2679 	call dpop 
      008E44 CC               [ 2] 2680 	ldw (x),y 
      008E45 8F               [ 4] 2681 	ret 
                                   2682 
                                   2683 ;---------------------------------
                                   2684 ; drop n elements from data stack 
                                   2685 ; input: 
                                   2686 ;   X 		n 
                                   2687 ; output:
                                   2688 ;   none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2689 ;-------------------------------------
      001006                       2690 ddrop_n:
      008E46 27 89            [ 2] 2691 	pushw y 
      008E47 90 CE 00 19      [ 2] 2692 	ldw y,dstkptr 
      008E47 A6               [ 2] 2693 	sllw x 
      008E48 3F               [ 2] 2694 	pushw x 
      008E49 11 01 26         [ 2] 2695 	addw y,(1,sp)
      008E4C 11 7B 01 F7      [ 2] 2696 	ldw dstkptr,y 
      008E50 5C               [ 2] 2697 	popw x 
      008E51 7F 72            [ 2] 2698 	popw y
      008E53 5C               [ 4] 2699 	ret 
                                   2700 
      008E54 00 02 A6 06 AE 96 75  2701 dstk_prompt: .asciz "\ndstack: " 
             CC 8F 37
                                   2702 ;----------------------------
                                   2703 ; print dstack content 
                                   2704 ;---------------------------
                           000001  2705 	XSAVE=1
                           000002  2706 	VSIZE=2
      008E5E                       2707 dots:
      001023                       2708 	_vars VSIZE 
      008E5E A6 27            [ 2]    1     sub sp,#VSIZE 
      008E60 11 01 26         [ 2] 2709 	ldw x,#dstk_prompt 
      008E63 0C 72 5C         [ 4] 2710 	call puts
      008E66 00 02 A6         [ 2] 2711 	ldw x,#dstack_unf-CELL_SIZE
      008E69 06 AE 97 84      [ 1] 2712 	mov base,#10 
      008E6D CC 8F 37         [ 2] 2713 1$:	cpw x,dstkptr 
      008E70 25 0D            [ 1] 2714 	jrult 4$ 
      008E70 A6 2B            [ 2] 2715 	ldw (XSAVE,sp),x
      008E72 11               [ 2] 2716 	ldw  x,(x)
      008E73 01 26 05         [ 4] 2717 	call print_int 
      008E76 A6 10            [ 2] 2718 	ldw x,(XSAVE,sp)
      008E78 CC 8F 27         [ 2] 2719 	subw x,#CELL_SIZE 
      008E7B 20 EE            [ 2] 2720 	jra 1$ 
      008E7B A6 2A            [ 1] 2721 4$: ld a,#CR 
      008E7D 11 01 26         [ 4] 2722 	call putc 
      001049                       2723 	_drop VSIZE
      008E80 05 A6            [ 2]    1     addw sp,#VSIZE 
      008E82 20               [ 1] 2724 	clr a 
      008E83 CC               [ 4] 2725 	ret
                                   2726 
      008E84 8F 27 74 61 63 6B 3A  2727 cstk_prompt: .asciz "\nctack: "
             20 00
                                   2728 ;--------------------------------
                                   2729 ; print cstack content
                                   2730 ;--------------------------------
                           000001  2731 	XSAVE=1
                           000002  2732 	VSIZE=2 
      008E86                       2733 dotr:
      001056                       2734 	_vars VSIZE 
      008E86 A6 2F            [ 2]    1     sub sp,#VSIZE 
      008E88 11 01 26         [ 2] 2735 	ldw x,#cstk_prompt
      008E8B 05 A6 21         [ 4] 2736 	call puts 
      008E8E CC               [ 1] 2737 	ldw x,sp 
      008E8F 8F 27 07         [ 2] 2738 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008E91 1F 01            [ 2] 2739 	ldw (XSAVE,sp),x  
      008E91 A6 25 11         [ 2] 2740 	ldw x,#RAM_SIZE-2
      008E94 01 26 05 A6      [ 1] 2741 	mov base,#16
      00106B                       2742 dotr_loop:
      008E98 22 CC            [ 2] 2743 	cpw x,(XSAVE,sp)
      008E9A 8F 27            [ 1] 2744 	jrmi 9$
      008E9C 89               [ 2] 2745 	pushw x  
      008E9C A6               [ 2] 2746 	ldw x,(x)
      008E9D 3D 11 01         [ 4] 2747 	call print_int 
      008EA0 26               [ 2] 2748 	popw x  
      008EA1 05 A6 32         [ 2] 2749 	subw x,#CELL_SIZE
      008EA4 CC 8F            [ 2] 2750 	jra dotr_loop 
      008EA6 27 0D            [ 1] 2751 9$:	ld a,#CR 
      008EA7 CD 01 9E         [ 4] 2752 	call putc 
      00107F                       2753 	_drop VSIZE 
      008EA7 A6 3E            [ 2]    1     addw sp,#VSIZE 
      008EA9 11               [ 1] 2754 	clr a 
      008EAA 01               [ 4] 2755 	ret
                                   2756 
                                   2757 
                                   2758 ;--------------------------------
                                   2759 ;  add 2 integers
                                   2760 ;  input:
                                   2761 ;    N1     on cstack 
                                   2762 ;    N2     on cstack 
                                   2763 ;  output:
                                   2764 ;    X 		n2+n1 
                                   2765 ;--------------------------------
                                   2766 	;arugments on cstack 
      001083                       2767 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001083                       2768 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001083                       2769 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001083                       2770 add:
      008EAB 26 33            [ 2] 2771 	ldw x ,(N2,sp)
      008EAD A6 31 6B         [ 2] 2772 	addw x,(N1,sp)
      008EB0 02 72            [ 2] 2773 	ldw (N1,sp),x 
      008EB2 5C               [ 4] 2774 	ret 
                                   2775 
                                   2776 ;--------------------------------
                                   2777 ;  substract 2 ntegers
                                   2778 ;  input:
                                   2779 ;    N1     on cstack 
                                   2780 ;    N2     on cstack 
                                   2781 ;  output:
                                   2782 ;    X 		n2+n1 
                                   2783 ;--------------------------------
      00108B                       2784 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00108B                       2785 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      00108B                       2786 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      00108B                       2787 substract:
      008EB3 00 02            [ 2] 2788 	ldw x,(N2,sp)
      008EB5 91 D6 01         [ 2] 2789 	subw x,(N1,sp)
      008EB8 A1               [ 4] 2790 	ret 
                                   2791 
                                   2792 ;-------------------------------------
                                   2793 ; multiply 2 integers
                                   2794 ; product overflow is ignored unless
                                   2795 ; MATH_OVF assembler flag is set to 1
                                   2796 ; input:
                                   2797 ;  	N1      on cstack
                                   2798 ;   N2 		on cstack 
                                   2799 ; output:
                                   2800 ;	X        N1*N2 
                                   2801 ;-------------------------------------
                                   2802 	;arguments 
      001091                       2803 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      001091                       2804 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      001091                       2805 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      001091                       2806 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      001091                       2807 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2808    ; local variables 
                           000001  2809 	SIGN=1
                           000002  2810 	PROD=2
                           000003  2811 	VSIZE=3
      001091                       2812 multiply:
      001091                       2813 	_vars VSIZE 
      008EB9 3D 26            [ 2]    1     sub sp,#VSIZE 
      008EBB 0C 7B            [ 1] 2814 	clr (SIGN,sp)
      008EBD 01 F7            [ 2] 2815 	ldw x,(N1_HB,sp)
      008EBF 5C               [ 1] 2816 	ld a,xh  
      008EC0 A6 3D            [ 1] 2817 	bcp a,#0x80 
      008EC2 6B 01            [ 1] 2818 	jreq 2$
      008EC4 A6 33            [ 1] 2819 	cpl (SIGN,sp)
      008EC6 20               [ 2] 2820 	negw x 
      008EC7 5F A1            [ 2] 2821 	ldw (N1_HB,sp),x 
      008EC9 3C 26            [ 2] 2822 2$: ldw x,(N2_HB,sp)
      008ECB 0C               [ 1] 2823 	ld a,xh  
      008ECC 7B 01            [ 1] 2824 	bcp a,#0x80 
      008ECE F7 5C            [ 1] 2825 	jreq 3$
      008ED0 A6 3C            [ 1] 2826 	cpl (SIGN,sp)
      008ED2 6B               [ 2] 2827 	negw x 
      008ED3 01 A6            [ 2] 2828 	ldw (N2_HB,sp),x 
                                   2829 ; N1_LB * N2_LB 	
      008ED5 35 20            [ 1] 2830 3$:	ld a,(N1_LB,sp)
      008ED7 4F               [ 1] 2831 	ld xl,a 
      008ED8 72 5A            [ 1] 2832 	ld a,(N2_LB,sp) 
      008EDA 00               [ 4] 2833 	mul x,a 
                           000000  2834 .if MATH_OVF 	
                                   2835 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2836 	bcp a,#0x80 
                                   2837 	jreq 4$ 
                                   2838 	ld a,#ERR_MATH_OVF 
                                   2839 	jp tb_error
                                   2840 .endif 	 
      008EDB 02 7B            [ 2] 2841 4$:	ldw (PROD,sp),x
                                   2842 ; N1_LB * N2_HB	 
      008EDD 02 20            [ 1] 2843 	ld a,(N1_LB,sp) 
      008EDF 47               [ 1] 2844 	ld xl,a 
      008EE0 7B 08            [ 1] 2845 	ld a,(N2_HB,sp)
      008EE0 A6               [ 4] 2846 	mul x,a
      008EE1 3C               [ 1] 2847 	ld a,xl 
      008EE2 11 01            [ 1] 2848 	add a,(PROD,sp)
                           000000  2849 .if MATH_OVF 	
                                   2850 	bcp a,#0x80 
                                   2851 	jreq 5$ 
                                   2852 	ld a,#ERR_MATH_OVF 
                                   2853 	jp tb_error
                                   2854 .endif 	 
      008EE4 26 32            [ 1] 2855 5$:	ld (PROD,sp),a 
                                   2856 ; N1_HB * N2_LB 
      008EE6 A6 34            [ 1] 2857 	ld a,(N1_HB,sp)
      008EE8 6B               [ 1] 2858 	ld xl,a 
      008EE9 02 72            [ 1] 2859 	ld a,(N2_LB,sp)
      008EEB 5C               [ 4] 2860 	mul x,a 
      008EEC 00               [ 1] 2861 	ld a,xl 
      008EED 02 91            [ 1] 2862 	add a,(PROD,sp)
                           000000  2863 .if MATH_OVF 	
                                   2864 	bcp a,#0x80 
                                   2865 	jreq 6$ 
                                   2866 	ld a,#ERR_MATH_OVF 
                                   2867 	jp tb_error
                                   2868 .endif 	 
      008EEF D6 01            [ 1] 2869 6$:	ld (PROD,sp),a 
                                   2870 ; N1_HB * N2_HB 	
                                   2871 ; it is pointless to multiply N1_HB*N2_HB 
                                   2872 ; as this product is over 65535 or 0 
                                   2873 ;
                                   2874 ; sign adjust product
      008EF1 A1 3D            [ 1] 2875 	tnz (SIGN,sp)
      008EF3 26 0B            [ 1] 2876 	jreq 7$
      008EF5 7B 01            [ 2] 2877 	ldw x, (PROD,sp)
      008EF7 F7               [ 2] 2878 	negw x
      008EF8 A6 3D            [ 2] 2879 	ldw (PROD,sp),x  
      0010D4                       2880 7$: 
      008EFA 6B 01            [ 2] 2881 	ldw x,(PROD,sp) 
      0010D6                       2882 	_drop VSIZE 
      008EFC A6 36            [ 2]    1     addw sp,#VSIZE 
      008EFE 20               [ 4] 2883 	ret
                                   2884 
                                   2885 ;----------------------------------
                                   2886 ;  euclidian divide n2/n1 
                                   2887 ; input:
                                   2888 ;    N2 	on cstack
                                   2889 ;    N1 	on cstack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2890 ; output:
                                   2891 ;    X      n2/n1 
                                   2892 ;    Y      remainder 
                                   2893 ;----------------------------------
      0010D9                       2894 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      0010D9                       2895 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      0010D9                       2896 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2897 	; local variables
                           000001  2898 	SQUOT=1 ; sign quotient
                           000002  2899 	SDIVD=2 ; sign dividend  
                           000002  2900 	VSIZE=2
      0010D9                       2901 divide:
      0010D9                       2902 	_vars VSIZE 
      008EFF 27 A1            [ 2]    1     sub sp,#VSIZE 
      008F01 3E 26            [ 1] 2903 	clr (SQUOT,sp)
      008F03 0C 7B            [ 1] 2904 	clr (SDIVD,sp)
                                   2905 ; check for 0 divisor
      008F05 01 F7            [ 2] 2906 	ldw x,(DIVISR,sp)
      008F07 5C               [ 2] 2907 	tnzw x 
      008F08 A6 3E            [ 1] 2908     jrne 0$
      008F0A 6B 01            [ 1] 2909 	ld a,#ERR_DIV0 
      008F0C A6 35 20         [ 2] 2910 	jp tb_error 
                                   2911 ; check divisor sign 	
      008F0F 17               [ 1] 2912 0$:	ld a,xh 
      008F10 72 5A            [ 1] 2913 	bcp a,#0x80 
      008F12 00 02            [ 1] 2914 	jreq 1$
      008F14 7B 02            [ 1] 2915 	cpl (SQUOT,sp)
      008F16 20               [ 2] 2916 	negw x 
      008F17 0F 05            [ 2] 2917 1$:	ldw (DIVISR,sp),x
                                   2918 ; check dividend sign 	 
      008F18 1E 07            [ 2] 2919     ldw x,(DIVIDND,sp)
      008F18 7B               [ 1] 2920 	ld a,xh 
      008F19 01 CD            [ 1] 2921 	bcp a,#0x80 
      008F1B 85 80            [ 1] 2922 	jreq 2$ 
      008F1D 25 03            [ 1] 2923 	cpl (SQUOT,sp)
      008F1F CC 87            [ 1] 2924 	cpl (SDIVD,sp)
      008F21 94               [ 2] 2925 	negw x 
      008F22 16 05            [ 2] 2926 2$:	ldw y,(DIVISR,sp)
      008F22 CD               [ 2] 2927 	divw x,y
      008F23 8D 4A 20 10      [ 2] 2928 	ldw acc16,y 
                                   2929 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      008F27 0D 02            [ 1] 2930 	tnz (SDIVD,sp)
      008F27 6B 02            [ 1] 2931 	jreq 7$
      008F29 7B 01            [ 2] 2932 	tnzw y 
      008F2B F7 5C            [ 1] 2933 	jreq 7$
      008F2D 7F               [ 1] 2934 	incw x
      008F2E 72 5C            [ 2] 2935 	ldw y,(DIVISR,sp)
      008F30 00 02 7B 02      [ 2] 2936 	subw y,acc16
      008F34 AE 17            [ 1] 2937 7$: tnz (SQUOT,sp)
      008F36 18 01            [ 1] 2938 	jreq 9$ 	 
      008F37 50               [ 2] 2939 8$:	negw x 
      00111A                       2940 9$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00111A                       2941 	_drop VSIZE 
      008F37 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F39 81               [ 4] 2942 	ret 
                                   2943 
                                   2944 
                                   2945 ;----------------------------------
                                   2946 ;  remainder resulting from euclidian 
                                   2947 ;  division of n2/n1 
                                   2948 ; input:
                                   2949 ;   N1 		cstack 
                                   2950 ;   N2      cstack
                                   2951 ; output:
                                   2952 ;   X       N2%N1 
                                   2953 ;----------------------------------
                           000003  2954 	N1=3
                           000005  2955 	N2=5
                           000004  2956 	VSIZE=4
      008F3A                       2957 modulo:
      008F3A A1 30            [ 2] 2958 	Ldw x,(N1,sp)
      008F3C 25 03            [ 2] 2959 	ldw y,(N2,sp)
      001121                       2960 	_vars VSIZE 
      008F3E A1 3A            [ 2]    1     sub sp,#VSIZE 
      008F40 8C 8C            [ 2] 2961 	ldw (1,sp),x 
      008F42 81 03            [ 2] 2962 	ldw (3,sp),y 
      008F43 CD 10 D9         [ 4] 2963 	call divide 
      008F43 A1               [ 1] 2964 	ldw x,y
      00112B                       2965 	_drop VSIZE 
      008F44 61 2A            [ 2]    1     addw sp,#VSIZE 
      008F46 01               [ 4] 2966 	ret 
                                   2967 
                                   2968 
                                   2969 ;----------------------------------
                                   2970 ; search in kword_dict command name
                                   2971 ;  from its execution address 
                                   2972 ; input:
                                   2973 ;   X       	execution address 
                                   2974 ; output:
                                   2975 ;   X 			cstr*  | 0 
                                   2976 ;--------------------------------
                           000001  2977 	XADR=1 
                           000003  2978 	LINK=3 
                           000004  2979 	VSIZE=4
      00112E                       2980 cmd_name:
      00112E                       2981 	_vars VSIZE 
      008F47 81 A1            [ 2]    1     sub sp,#VSIZE 
      008F49 7A 22 FB A0      [ 1] 2982 	clr acc16 
      008F4D 20 81            [ 2] 2983 	ldw (XADR,sp),x  
      008F4F AE 21 36         [ 2] 2984 	ldw x,#kword_dict	
      008F4F 89 52            [ 2] 2985 1$:	ldw (LINK,sp),x
      008F51 03 72            [ 1] 2986 	ld a,(2,x)
      008F53 5F 00            [ 1] 2987 	and a,#15 
      008F55 09 72 5F         [ 1] 2988 	ld acc8,a 
      008F58 00 0A 72         [ 2] 2989 	addw x,#3
      008F5B 5F 00 0B C6      [ 2] 2990 	addw x,acc16
      008F5F 17               [ 2] 2991 	ldw x,(x) ; execution address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008F60 18 27            [ 2] 2992 	cpw x,(XADR,sp)
      008F62 5A 0F            [ 1] 2993 	jreq 2$
      008F64 01 A6            [ 2] 2994 	ldw x,(LINK,sp)
      008F66 0A               [ 2] 2995 	ldw x,(x) 
      008F67 6B 02 AE         [ 2] 2996 	subw x,#2  
      008F6A 17 18            [ 1] 2997 	jrne 1$
      008F6C F6 27            [ 2] 2998 	jra 9$
      008F6E 47 A1            [ 2] 2999 2$: ldw x,(LINK,sp)
      008F70 2D 26 04         [ 2] 3000 	addw x,#2 	
      00115D                       3001 9$:	_drop VSIZE
      008F73 03 01            [ 2]    1     addw sp,#VSIZE 
      008F75 20               [ 4] 3002 	ret
                                   3003 
                                   3004 
                                   3005 ;---------------------------------
                                   3006 ; input:
                                   3007 ;	X 		dictionary entry point 
                                   3008 ;  pad		.asciz name to search 
                                   3009 ; output:
                                   3010 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3011 ;  X		execution address | 0 
                                   3012 ;---------------------------------
                           000001  3013 	NLEN=1 ; cmd length 
                           000002  3014 	YSAVE=2
                           000003  3015 	VSIZE=3 
      001160                       3016 search_dict:
      001160                       3017 	_vars VSIZE 
      008F76 08 A1            [ 2]    1     sub sp,#VSIZE 
      008F78 24 26            [ 1] 3018 	ldw y,x 
      001164                       3019 search_next:	
      008F7A 06 A6            [ 1] 3020 	ld a,(y)
      008F7C 10 6B            [ 1] 3021 	and a,#0xf 
      008F7E 02 5C            [ 1] 3022 	ld (NLEN,sp),a  
      008F80 F6 17 18         [ 2] 3023 	ldw x,#pad 
      008F81 17 02            [ 2] 3024 	ldw (YSAVE,sp),y
      008F81 A1 61            [ 1] 3025 	incw y  
      001171                       3026 cp_loop:
      008F83 2B               [ 1] 3027 	ld a,(x)
      008F84 02 A0            [ 1] 3028 	jreq str_match 
      008F86 20 A1            [ 1] 3029 	tnz (NLEN,sp)
      008F88 30 2B            [ 1] 3030 	jreq no_match  
      008F8A 2B A0            [ 1] 3031 	cp a,(y)
      008F8C 30 A1            [ 1] 3032 	jrne no_match 
      008F8E 0A 2B            [ 1] 3033 	incw y 
      008F90 06               [ 1] 3034 	incw x
      008F91 A0 07            [ 1] 3035 	dec (NLEN,sp)
      008F93 11 02            [ 2] 3036 	jra cp_loop 
      001183                       3037 no_match:
      008F95 2A 1F            [ 2] 3038 	ldw y,(YSAVE,sp) 
      008F97 6B 03 7B 02      [ 2] 3039 	subw y,#2 ; move Y to link field
      008F9B CD 8F            [ 1] 3040 	push #TK_NONE 
      008F9D C1 7B            [ 2] 3041 	ldw y,(y) ; next word link 
      008F9F 03               [ 1] 3042 	pop a ; TK_NONE 
      008FA0 CB 00            [ 1] 3043 	jreq search_exit  ; not found  
                                   3044 ;try next 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008FA2 0B C7            [ 2] 3045 	jra search_next
      001192                       3046 str_match:
      008FA4 00 0B            [ 2] 3047 	ldw y,(YSAVE,sp)
      008FA6 4F C9            [ 1] 3048 	ld a,(y)
      008FA8 00 0A            [ 1] 3049 	ld (NLEN,sp),a ; needed to test keyword type  
      008FAA C7 00            [ 1] 3050 	and a,#0xf 
                                   3051 ; move y to procedure address field 	
      008FAC 0A               [ 1] 3052 	inc a 
      008FAD 4F C9 00         [ 1] 3053 	ld acc8,a 
      008FB0 09 C7 00 09      [ 1] 3054 	clr acc16 
      008FB4 20 C9 0D 01      [ 2] 3055 	addw y,acc16 
      008FB8 27 03            [ 2] 3056 	ldw y,(y) ; routine entry point 
                                   3057 ;determine keyword type bits 7:6 
      008FBA CD 8A            [ 1] 3058 	ld a,(NLEN,sp)
      008FBC E4               [ 1] 3059 	swap a 
      008FBD A4 0C            [ 1] 3060 	and a,#0xc
      008FBD 5B               [ 1] 3061 	srl a
      008FBE 03               [ 1] 3062 	srl a 
      008FBF 85 81            [ 1] 3063 	add a,#6
      008FC1                       3064 search_exit: 
      008FC1 89               [ 1] 3065 	ldw x,y ; x=routine address 
      0011B2                       3066 	_drop VSIZE 	 
      008FC2 88 5F            [ 2]    1     addw sp,#VSIZE 
      008FC4 89               [ 4] 3067 	ret 
                                   3068 
                                   3069 ;---------------------
                                   3070 ; check if next token
                                   3071 ;  is of expected type 
                                   3072 ; input:
                                   3073 ;   A 		 expected token attribute
                                   3074 ;  ouput:
                                   3075 ;   none     if fail call tb_error 
                                   3076 ;--------------------
      0011B5                       3077 expect:
      008FC5 C6               [ 1] 3078 	push a 
      008FC6 00 0B 97         [ 4] 3079 	call next_token 
      008FC9 7B 03            [ 1] 3080 	cp a,(1,sp)
      008FCB 42 9F            [ 1] 3081 	jreq 1$
      008FCD C7 00 0B         [ 2] 3082 	jp syntax_error
      008FD0 9E               [ 1] 3083 1$: pop a 
      008FD1 6B               [ 4] 3084 	ret 
                                   3085 
                                   3086 
                                   3087 ;-------------------------------
                                   3088 ; parse embedded BASIC routines 
                                   3089 ; arguments list.
                                   3090 ; arg_list::=  rel[','rel]*
                                   3091 ; all arguments are of integer type
                                   3092 ; input:
                                   3093 ;   none
                                   3094 ; output:
                                   3095 ;   A 			number of arguments pushed on dstack  
                                   3096 ;--------------------------------
                           000001  3097 	ARG_CNT=1 
      0011C2                       3098 arg_list:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      008FD2 02 C6            [ 1] 3099 	push #0  
      008FD4 00 0A 97         [ 4] 3100 1$: call relation
      008FD7 7B 03            [ 1] 3101 	cp a,#TK_NONE 
      008FD9 42 72            [ 1] 3102 	jreq 5$
      008FDB FB 01            [ 1] 3103 	cp a,#TK_INTGR
      008FDD 9F C7            [ 1] 3104 	jrne 4$
      008FDF 00 0A 4F         [ 4] 3105 3$: call dpush 
      008FE2 A9 00            [ 1] 3106     inc (ARG_CNT,sp)
      008FE4 6B 01 9E         [ 4] 3107 	call next_token 
      008FE7 6B 02            [ 1] 3108 	cp a,#TK_NONE 
      008FE9 C6 00            [ 1] 3109 	jreq 5$ 
      008FEB 09 97            [ 1] 3110 	cp a,#TK_COMMA 
      008FED 7B 03            [ 1] 3111 	jrne 4$
      008FEF 42 72            [ 2] 3112 	jra 1$ 
      008FF1 FB 01 9F         [ 4] 3113 4$:	call unget_token 
      008FF4 C7               [ 1] 3114 5$:	pop a 
      008FF5 00               [ 4] 3115 	ret 
                                   3116 
                                   3117 
                                   3118 
                                   3119 ;--------------------------------
                                   3120 ;   BASIC commnands 
                                   3121 ;--------------------------------
                                   3122 
                                   3123 ;--------------------------------
                                   3124 ;  arithmetic and relational 
                                   3125 ;  routines
                                   3126 ;  operators precedence
                                   3127 ;  highest to lowest
                                   3128 ;  operators on same row have 
                                   3129 ;  same precedence and are executed
                                   3130 ;  from left to right.
                                   3131 ;	'*','/','%'
                                   3132 ;   '-','+'
                                   3133 ;   '=','>','<','>=','<=','<>','><'
                                   3134 ;   '<>' and '><' are equivalent for not equal.
                                   3135 ;--------------------------------
                                   3136 
                                   3137 ;---------------------
                                   3138 ; return array element
                                   3139 ; address from @(expr)
                                   3140 ; input:
                                   3141 ;   A 		TK_ARRAY
                                   3142 ; output:
                                   3143 ;   A 		TK_INTGR
                                   3144 ;	X 		element address 
                                   3145 ;----------------------
      0011E6                       3146 get_array_element:
      008FF6 09 5B 03         [ 4] 3147 	call ddrop 
      008FF9 85 81            [ 1] 3148 	ld a,#TK_LPAREN 
      008FFB CD 11 B5         [ 4] 3149 	call expect
      008FFB 88 91 D6         [ 4] 3150 	call relation 
      008FFE 01 27            [ 1] 3151 	cp a,#TK_INTGR 
      009000 0A 11            [ 1] 3152 	jreq 1$
      009002 01 26 06         [ 2] 3153 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009005 72               [ 2] 3154 1$: pushw x 
      009006 5C 00            [ 1] 3155 	ld a,#TK_RPAREN 
      009008 02 20 F1         [ 4] 3156 	call expect
                                   3157 	; check for bounds 
      00900B 5B               [ 2] 3158 	popw x   
      00900C 01 81 22         [ 2] 3159 	cpw x,array_size 
      00900E 23 05            [ 2] 3160 	jrule 3$
                                   3161 ; bounds {1..array_size}	
      00900E CE 00            [ 1] 3162 2$: ld a,#ERR_BAD_VALUE 
      009010 12 CF 00         [ 2] 3163 	jp tb_error 
      009013 01               [ 2] 3164 3$: tnzw  x
      009014 81 F8            [ 1] 3165 	jreq 2$ 
      009015 58               [ 2] 3166 	sllw x 
      009015 72               [ 2] 3167 	pushw x 
      009016 5A 00 1B         [ 2] 3168 	ldw x,array_addr  
      009019 72 5A 00         [ 2] 3169 	subw x,(1,sp)
      001214                       3170 	_drop 2   
      00901C 1B 72            [ 2]    1     addw sp,#2 
      00901E CF 00            [ 1] 3171 	ld a,#TK_INTGR
      009020 1A               [ 4] 3172 	ret 
                                   3173 
                                   3174 ;***********************************
                                   3175 ;   expression parse,execute 
                                   3176 ;***********************************
                                   3177 ;-----------------------------------
                                   3178 ; factor ::= ['+'|'-'|e] var | @ |
                                   3179 ;			 integer | function |
                                   3180 ;			 '('relation')' 
                                   3181 ; output:
                                   3182 ;   A    token attribute 
                                   3183 ;   X 	 integer
                                   3184 ; ---------------------------------
                           000001  3185 	NEG=1
                           000001  3186 	VSIZE=1
      001219                       3187 factor:
      001219                       3188 	_vars VSIZE 
      009021 81 01            [ 2]    1     sub sp,#VSIZE 
      009022 CD 07 FA         [ 4] 3189 	call next_token
      009022 72 CE            [ 1] 3190 	cp a,#CMD_END 
      009024 00 1A            [ 1] 3191 	jrmi 20$
      009026 72 5C            [ 1] 3192 1$:	ld (NEG,sp),a 
      009028 00 1B            [ 1] 3193 	and a,#TK_GRP_MASK
      00902A 72 5C            [ 1] 3194 	cp a,#TK_GRP_ADD 
      00902C 00 1B            [ 1] 3195 	jreq 2$
      00902E 81 01            [ 1] 3196 	ld a,(NEG,sp)
      00902F 20 03            [ 2] 3197 	jra 4$  
      00122E                       3198 2$:	
      00902F 72 CE 00         [ 4] 3199 	call next_token 
      001231                       3200 4$:	
      009032 1A 89            [ 1] 3201 	cp a,#TK_IFUNC 
      009034 AE 00            [ 1] 3202 	jrne 5$ 
      009036 02               [ 4] 3203 	call (x) 
      009037 72 DE            [ 2] 3204 	jra 18$ 
      001238                       3205 5$:
      009039 00 1A            [ 1] 3206 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00903B 72 CF            [ 1] 3207 	jrne 6$
      00903D 00 1A            [ 2] 3208 	jra 18$
      00123E                       3209 6$:
      00903F AE 00            [ 1] 3210 	cp a,#TK_ARRAY
      009041 02 90            [ 1] 3211 	jrne 10$
      009043 85 72 DF         [ 4] 3212 	call get_array_element
      009046 00               [ 2] 3213 	ldw x,(x)
      009047 1A 81            [ 2] 3214 	jra 18$ 
      009049                       3215 10$:
      009049 72 5C            [ 1] 3216 	cp a,#TK_VAR 
      00904B 00 1B            [ 1] 3217 	jrne 12$
      00904D 72               [ 2] 3218 	ldw x,(x)
      00904E 5C 00            [ 2] 3219 	jra 18$
      00124F                       3220 12$:			
      009050 1B 81            [ 1] 3221 	cp a,#TK_LPAREN
      009052 26 0A            [ 1] 3222 	jrne 16$
      009052 72 CE 00         [ 4] 3223 	call relation
      009055 1A 72            [ 1] 3224 	ld a,#TK_RPAREN 
      009057 5A 00 1B         [ 4] 3225 	call expect
      00905A 72 5A            [ 2] 3226 	jra 18$	
      00125D                       3227 16$:
      00905C 00 1B 72         [ 4] 3228 	call unget_token
      00905F CF               [ 1] 3229 	clr a 
      009060 00 1A            [ 2] 3230 	jra 20$ 
      001263                       3231 18$: 
      009062 81 11            [ 1] 3232 	ld a,#TK_MINUS 
      009063 11 01            [ 1] 3233 	cp a,(NEG,sp)
      009063 72 CE            [ 1] 3234 	jrne 19$
      009065 00               [ 2] 3235 	negw x
      00126A                       3236 19$:
      009066 1A 58            [ 1] 3237 	ld a,#TK_INTGR
      00126C                       3238 20$:
      00126C                       3239 	_drop VSIZE
      009068 72 BB            [ 2]    1     addw sp,#VSIZE 
      00906A 00               [ 4] 3240 	ret
                                   3241 
                                   3242 ;-----------------------------------
                                   3243 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3244 ; output:
                                   3245 ;   A    	token attribute 
                                   3246 ;	X		integer
                                   3247 ;-----------------------------------
                           000001  3248 	N1=1
                           000003  3249 	N2=3
                           000005  3250 	MULOP=5
                           000005  3251 	VSIZE=5
      00126F                       3252 term:
      00126F                       3253 	_vars VSIZE
      00906B 1A FE            [ 2]    1     sub sp,#VSIZE 
      00906D 72 CF 00         [ 4] 3254 	call factor
      009070 1A 81            [ 1] 3255 	cp a,#CMD_END
      009072 2B 41            [ 1] 3256 	jrmi term_exit
      001278                       3257 term01:	 ; check for  operator 
      009072 72 CE            [ 2] 3258 	ldw (N2,sp),x  ; save first factor 
      009074 00 1A FE         [ 4] 3259 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009077 72 CF            [ 1] 3260 	cp a,#2
      009079 00 1A            [ 1] 3261 	jrmi 9$
      00907B 81 05            [ 1] 3262 0$:	ld (MULOP,sp),a
      00907C A4 30            [ 1] 3263 	and a,#TK_GRP_MASK
      00907C CD 90            [ 1] 3264 	cp a,#TK_GRP_MULT
      00907E 22 90            [ 1] 3265 	jreq 1$
      009080 93 CD            [ 1] 3266 	ld a,(MULOP,sp) 
      009082 90 22 FF         [ 4] 3267 	call unget_token 
      009085 81 25            [ 2] 3268 	jra 9$
      009086                       3269 1$:	; got *|/|%
      009086 90 89 90         [ 4] 3270 	call factor
      009089 CE 00            [ 1] 3271 	cp a,#TK_INTGR
      00908B 1A 58            [ 1] 3272 	jreq 2$ 
      00908D 89 72 F9         [ 2] 3273 	jp syntax_error
      009090 01 90            [ 2] 3274 2$:	ldw (N1,sp),x  
      009092 CF 00            [ 1] 3275 	ld a,(MULOP,sp) 
      009094 1A 85            [ 1] 3276 	cp a,#TK_MULT 
      009096 90 85            [ 1] 3277 	jrne 3$
      009098 81 0A 64         [ 4] 3278 	call multiply 
      00909B 73 74            [ 2] 3279 	jra term01
      00909D 61 63            [ 1] 3280 3$: cp a,#TK_DIV 
      00909F 6B 3A            [ 1] 3281 	jrne 4$ 
      0090A1 20 00 D9         [ 4] 3282 	call divide 
      0090A3 20 C8            [ 2] 3283 	jra term01 
      0090A3 52 02 AE         [ 4] 3284 4$: call modulo
      0090A6 90 99            [ 2] 3285 	jra term01 
      0090A8 CD 82            [ 2] 3286 9$: ldw x,(N2,sp)  
      0090AA 30 AE            [ 1] 3287 	ld a,#TK_INTGR 	
      0012B9                       3288 term_exit:
      0012B9                       3289 	_drop VSIZE 
      0090AC 17 7E            [ 2]    1     addw sp,#VSIZE 
      0090AE 35               [ 4] 3290 	ret 
                                   3291 
                                   3292 ;-------------------------------
                                   3293 ;  expr ::= term [['+'|'-'] term]*
                                   3294 ;  result range {-32768..32767}
                                   3295 ;  output:
                                   3296 ;   A    token attribute 
                                   3297 ;   X	 integer   
                                   3298 ;-------------------------------
                           000001  3299 	N1=1 
                           000003  3300 	N2=3
                           000005  3301 	OP=5 
                           000005  3302 	VSIZE=5 
      0012BC                       3303 expression:
      0012BC                       3304 	_vars VSIZE 
      0090AF 0A 00            [ 2]    1     sub sp,#VSIZE 
      0090B1 08 C3 00         [ 4] 3305 	call term
      0090B4 1A 25            [ 1] 3306 	cp a,#CMD_END 
      0090B6 0D 1F            [ 1] 3307 	jrmi expr_exit 
      0090B8 01 FE            [ 2] 3308 0$:	ldw (N2,sp),x 
      0090BA CD 8A 19         [ 4] 3309 	call next_token
      0090BD 1E 01            [ 1] 3310 	cp a,#2
      0090BF 1D 00            [ 1] 3311 	jrmi 9$ 
      0090C1 02 20            [ 1] 3312 1$:	ld (OP,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0090C3 EE A6            [ 1] 3313 	and a,#TK_GRP_MASK
      0090C5 0D CD            [ 1] 3314 	cp a,#TK_GRP_ADD 
      0090C7 82 1E            [ 1] 3315 	jreq 2$ 
      0090C9 5B 02            [ 1] 3316 	ld a,(OP,sp)
      0090CB 4F 81 0A         [ 4] 3317 	call unget_token
      0090CE 63 74            [ 2] 3318 	jra 9$
      0012DD                       3319 2$: 
      0090D0 61 63 6B         [ 4] 3320 	call term
      0090D3 3A 20            [ 1] 3321 	cp a,#TK_INTGR 
      0090D5 00 03            [ 1] 3322 	jreq 3$
      0090D6 CC 07 14         [ 2] 3323 	jp syntax_error
      0090D6 52 02            [ 2] 3324 3$:	ldw (N1,sp),x 
      0090D8 AE 90            [ 1] 3325 	ld a,(OP,sp)
      0090DA CD CD            [ 1] 3326 	cp a,#TK_PLUS 
      0090DC 82 30            [ 1] 3327 	jrne 4$
      0090DE 96 1C 00         [ 4] 3328 	call add 
      0090E1 07 1F            [ 2] 3329 	jra 0$ 
      0090E3 01 AE 17         [ 4] 3330 4$:	call substract
      0090E6 FE 35            [ 2] 3331 	jra 0$
      0090E8 10 00            [ 2] 3332 9$: ldw x,(N2,sp)
      0090EA 08 03            [ 1] 3333 	ld a,#TK_INTGR	
      0090EB                       3334 expr_exit:
      0012FD                       3335 	_drop VSIZE 
      0090EB 13 01            [ 2]    1     addw sp,#VSIZE 
      0090ED 2B               [ 4] 3336 	ret 
                                   3337 
                                   3338 ;---------------------------------------------
                                   3339 ; rel ::= expr rel_op expr
                                   3340 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3341 ;  relation return 1 | 0  for true | false 
                                   3342 ;  output:
                                   3343 ;    A 		token attribute  
                                   3344 ;	 X		1|0
                                   3345 ;---------------------------------------------
                           000001  3346 	N1=1
                           000003  3347 	N2=3
                           000005  3348 	RELOP=5
                           000005  3349 	VSIZE=5 
      001300                       3350 relation: 
      001300                       3351 	_vars VSIZE
      0090EE 0B 89            [ 2]    1     sub sp,#VSIZE 
      0090F0 FE CD 8A         [ 4] 3352 	call expression
      0090F3 19 85            [ 1] 3353 	cp a,#CMD_END  
      0090F5 1D 00            [ 1] 3354 	jrmi rel_exit 
                                   3355 	; expect rel_op or leave 
      0090F7 02 20            [ 2] 3356 	ldw (N2,sp),x 
      0090F9 F1 A6 0D         [ 4] 3357 	call next_token 
      0090FC CD 82            [ 1] 3358 	cp a,#2
      0090FE 1E 5B            [ 1] 3359 	jrmi 9$
      001312                       3360 1$:	
      009100 02 4F            [ 1] 3361 	ld (RELOP,sp),a 
      009102 81 30            [ 1] 3362 	and a,#TK_GRP_MASK
      009103 A1 30            [ 1] 3363 	cp a,#TK_GRP_RELOP 
      009103 1E 05            [ 1] 3364 	jreq 2$
      009105 72 FB            [ 1] 3365 	ld a,(RELOP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009107 03 1F 03         [ 4] 3366 	call unget_token  
      00910A 81 2F            [ 2] 3367 	jra 9$
      00910B                       3368 2$:	; expect another expression or error 
      00910B 1E 05 72         [ 4] 3369 	call expression
      00910E F0 03            [ 1] 3370 	cp a,#TK_INTGR 
      009110 81 03            [ 1] 3371 	jreq 3$
      009111 CC 07 14         [ 2] 3372 	jp syntax_error 
      009111 52 03            [ 2] 3373 3$:	ldw (N1,sp),x 
      009113 0F 01 1E         [ 4] 3374 	call substract
      009116 06 9E            [ 1] 3375 	jrne 4$
      009118 A5 80 27 05      [ 1] 3376 	mov acc8,#2 ; n1==n2
      00911C 03 01            [ 2] 3377 	jra 6$ 
      001338                       3378 4$: 
      00911E 50 1F            [ 1] 3379 	jrsgt 5$  
      009120 06 1E 08 9E      [ 1] 3380 	mov acc8,#4 ; n1<2 
      009124 A5 80            [ 2] 3381 	jra 6$
      001340                       3382 5$:
      009126 27 05 03 01      [ 1] 3383 	mov acc8,#1 ; n1>n2 
      001344                       3384 6$:
      00912A 50               [ 1] 3385 	clrw x 
      00912B 1F 08 7B         [ 1] 3386 	ld a, acc8  
      00912E 07 97            [ 1] 3387 	and a,(RELOP,sp)
      009130 7B               [ 1] 3388 	tnz a 
      009131 09 42            [ 1] 3389 	jreq 10$
      009133 1F               [ 1] 3390 	incw x 
      00134E                       3391 7$:	 
      009134 02 7B            [ 2] 3392 	jra 10$  	
      009136 07 97            [ 2] 3393 9$: ldw x,(N2,sp)
      001352                       3394 10$:
      009138 7B 08            [ 1] 3395 	ld a,#TK_INTGR
      001354                       3396 rel_exit: 	 
      001354                       3397 	_drop VSIZE
      00913A 42 9F            [ 2]    1     addw sp,#VSIZE 
      00913C 1B               [ 4] 3398 	ret 
                                   3399 
                                   3400 ;--------------------------------
                                   3401 ; BASIC: SHOW 
                                   3402 ;  show content of dstack,cstack
                                   3403 ;--------------------------------
      001357                       3404 show:
      00913D 02 6B 02         [ 1] 3405 	ld a,base 
      009140 7B               [ 1] 3406 	push a 
      009141 06 97 7B         [ 4] 3407 	call dots
      009144 09 42 9F         [ 4] 3408 	call dotr 
      009147 1B               [ 1] 3409 	pop a 
      009148 02 6B 02         [ 1] 3410 	ld base,a 
      00914B 0D               [ 1] 3411 	clr a 
      00914C 01               [ 4] 3412 	ret
                                   3413 
                                   3414 ;--------------------------------------------
                                   3415 ; BASIC: HEX 
                                   3416 ; select hexadecimal base for integer print
                                   3417 ;---------------------------------------------
      001367                       3418 hex_base:
      00914D 27 05 1E 02      [ 1] 3419 	mov base,#16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009151 50               [ 4] 3420 	ret 
                                   3421 
                                   3422 ;--------------------------------------------
                                   3423 ; BASIC: DEC 
                                   3424 ; select decimal base for integer print
                                   3425 ;---------------------------------------------
      00136C                       3426 dec_base:
      009152 1F 02 00 07      [ 1] 3427 	mov base,#10
      009154 81               [ 4] 3428 	ret 
                                   3429 
                                   3430 ;------------------------
                                   3431 ; BASIC: SIZE 
                                   3432 ; return free size in text area
                                   3433 ; output:
                                   3434 ;   A 		TK_INTGR
                                   3435 ;   X 	    size integer
                                   3436 ;--------------------------
      001371                       3437 size:
      009154 1E 02 5B         [ 2] 3438 	ldw x,#tib 
      009157 03 81 00 1D      [ 2] 3439 	subw x,txtend 
      009159 A6 03            [ 1] 3440 	ld a,#TK_INTGR
      009159 52               [ 4] 3441 	ret 
                                   3442 
                                   3443 
                                   3444 ;------------------------
                                   3445 ; BASIC: UBOUND  
                                   3446 ; return array variable size 
                                   3447 ; output:
                                   3448 ;   A 		TK_INTGR
                                   3449 ;   X 	    array size 
                                   3450 ;--------------------------
      00137B                       3451 ubound:
      00915A 02 0F 01         [ 2] 3452 	ldw x,#tib
      00915D 0F 02 1E 05      [ 2] 3453 	subw x,txtend 
      009161 5D               [ 2] 3454 	srlw x 
      009162 26 05 A6         [ 2] 3455 	ldw array_size,x
      009165 04 CC            [ 1] 3456 	ld a,#TK_INTGR
      009167 87               [ 4] 3457 	ret 
                                   3458 
                                   3459 ;-----------------------------
                                   3460 ; BASIC: LET var=expr 
                                   3461 ; variable assignement 
                                   3462 ; output:
                                   3463 ;   A 		TK_NONE 
                                   3464 ;-----------------------------
      001389                       3465 let:
      009168 96 9E A5         [ 4] 3466 	call next_token 
      00916B 80 27            [ 1] 3467 	cp a,#TK_VAR 
      00916D 03 03            [ 1] 3468 	jreq let02
      00916F 01 50 1F         [ 2] 3469 	jp syntax_error
      001393                       3470 let02:
      009172 05 1E 07         [ 4] 3471 	call dpush 
      009175 9E A5 80         [ 4] 3472 	call next_token 
      009178 27 05            [ 1] 3473 	cp a,#TK_EQUAL
      00917A 03 01            [ 1] 3474 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      00917C 03 02 50         [ 2] 3475 	jp syntax_error
      0013A0                       3476 1$:	
      00917F 16 05 65         [ 4] 3477 	call relation   
      009182 90 CF            [ 1] 3478 	cp a,#TK_INTGR 
      009184 00 0A            [ 1] 3479 	jreq 2$
      009186 0D 02 27         [ 2] 3480 	jp syntax_error
      0013AA                       3481 2$:	
      009189 0B 90            [ 1] 3482 	ldw y,x 
      00918B 5D 27 07         [ 4] 3483 	call dpop  
      00918E 5C               [ 2] 3484 	ldw (x),y   
      00918F 16               [ 4] 3485 	ret 
                                   3486 
                                   3487 ;----------------------------
                                   3488 ; BASIC: LIST [[start][,end]]
                                   3489 ; list program lines 
                                   3490 ; form start to end 
                                   3491 ; if empty argument list then 
                                   3492 ; list all.
                                   3493 ;----------------------------
                           000001  3494 	FIRST=1
                           000003  3495 	LAST=3 
                           000005  3496 	LN_PTR=5
                           000006  3497 	VSIZE=6 
      0013B1                       3498 list:
      0013B1                       3499 	_vars VSIZE
      009190 05 72            [ 2]    1     sub sp,#VSIZE 
      009192 B2 00 0A         [ 2] 3500 	ldw x,txtbgn 
      009195 0D 01 27         [ 2] 3501 	cpw x,txtend 
      009198 01 50            [ 1] 3502 	jrmi 1$
      00919A CC 14 31         [ 2] 3503 	jp list_exit ; nothing to list 
      00919A 5B 02            [ 2] 3504 1$:	ldw (LN_PTR,sp),x 
      00919C 81               [ 2] 3505 	ldw x,(x) 
      00919D 1F 01            [ 2] 3506 	ldw (FIRST,sp),x ; list from first line 
      00919D 1E 03 16         [ 2] 3507 	ldw x,#0x7fff ; biggest line number 
      0091A0 05 52            [ 2] 3508 	ldw (LAST,sp),x 
      0091A2 04 1F 01         [ 4] 3509 	call arg_list
      0091A5 17               [ 1] 3510 	tnz a
      0091A6 03 CD            [ 1] 3511 	jreq list_start 
      0091A8 91 59            [ 1] 3512 	cp a,#2 
      0091AA 93 5B            [ 1] 3513 	jreq 4$
      0091AC 04 81            [ 1] 3514 	cp a,#1 
      0091AE 27 06            [ 1] 3515 	jreq first_line 
      0091AE 52 04 72         [ 2] 3516 	jp syntax_error 
      0091B1 5F 00 0A         [ 4] 3517 4$:	call dswap
      0013DC                       3518 first_line:
      0091B4 1F 01 AE         [ 4] 3519 	call dpop 
      0091B7 A1 B6            [ 2] 3520 	ldw (FIRST,sp),x 
      0091B9 1F 03            [ 1] 3521 	cp a,#1 
      0091BB E6 02            [ 1] 3522 	jreq lines_skip 	
      0013E5                       3523 last_line:
      0091BD A4 0F C7         [ 4] 3524 	call dpop 
      0091C0 00 0B            [ 2] 3525 	ldw (LAST,sp),x 
      0013EA                       3526 lines_skip:
      0091C2 1C 00 03         [ 2] 3527 	ldw x,txtbgn
      0091C5 72 BB            [ 2] 3528 2$:	ldw (LN_PTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0091C7 00 0A FE         [ 2] 3529 	cpw x,txtend 
      0091CA 13 01            [ 1] 3530 	jrpl list_exit 
      0091CC 27               [ 2] 3531 	ldw x,(x) ;lineno 
      0091CD 0A 1E            [ 2] 3532 	cpw x,(FIRST,sp)
      0091CF 03 FE            [ 1] 3533 	jrpl list_start 
      0091D1 1D 00            [ 2] 3534 	ldw x,(LN_PTR,sp) 
      0091D3 02 26 E3         [ 2] 3535 	addw x,#2 
      0091D6 20               [ 1] 3536 	ld a,(x)
      0091D7 05               [ 1] 3537 	incw x 
      0091D8 1E 03 1C         [ 1] 3538 	ld acc8,a 
      0091DB 00 02 5B 04      [ 1] 3539 	clr acc16 
      0091DF 81 BB 00 09      [ 2] 3540 	addw x,acc16
      0091E0 20 E0            [ 2] 3541 	jra 2$ 
                                   3542 ; print loop
      00140D                       3543 list_start:
      0091E0 52 03            [ 2] 3544 	ldw x,(LN_PTR,sp)
      00140F                       3545 3$:	
      0091E2 90 93 84         [ 4] 3546 	call prt_basic_line
      0091E4 1E 05            [ 2] 3547 	ldw x,(LN_PTR,sp)
      0091E4 90 F6            [ 1] 3548 	ld a,(2,x)
      0091E6 A4 0F 6B         [ 1] 3549 	ld acc8,a 
      0091E9 01 AE 17 18      [ 1] 3550 	clr acc16 
      0091ED 17 02 90 5C      [ 2] 3551 	addw x,acc16
      0091F1 C3 00 1D         [ 2] 3552 	cpw x,txtend 
      0091F1 F6 27            [ 1] 3553 	jrpl list_exit
      0091F3 1E 0D            [ 2] 3554 	ldw (LN_PTR,sp),x
      0091F5 01               [ 2] 3555 	ldw x,(x)
      0091F6 27 0B            [ 2] 3556 	cpw x,(LAST,sp)  
      0091F8 90 F1            [ 1] 3557 	jrsgt list_exit 
      0091FA 26 07            [ 2] 3558 	ldw x,(LN_PTR,sp)
      0091FC 90 5C            [ 2] 3559 	jra 3$
      001431                       3560 list_exit:
      001431                       3561 	_drop VSIZE 
      0091FE 5C 0A            [ 2]    1     addw sp,#VSIZE 
      009200 01               [ 4] 3562 	ret
                                   3563 
                                   3564 ;-------------------------
                                   3565 ; print counted string 
                                   3566 ; input:
                                   3567 ;   X 		address of string
                                   3568 ;--------------------------
      001434                       3569 prt_cmd_name:
      009201 20               [ 1] 3570 	ld a,(x)
      009202 EE               [ 1] 3571 	incw x
      009203 A4 0F            [ 1] 3572 	and a,#15  
      009203 16               [ 1] 3573 	push a 
      009204 02 72            [ 1] 3574 1$: tnz (1,sp) 
      009206 A2 00            [ 1] 3575 	jreq 9$
      009208 02               [ 1] 3576 	ld a,(x)
      009209 4B 00 90         [ 4] 3577 	call putc 
      00920C FE               [ 1] 3578 	incw x
      00920D 84 27            [ 1] 3579 	dec (1,sp)	 
      00920F 21 20            [ 2] 3580 	jra 1$
      009211 D2               [ 1] 3581 9$: pop a 
      009212 81               [ 4] 3582 	ret	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3583 
                                   3584 ;--------------------------
                                   3585 ; print TK_QSTR
                                   3586 ; converting control character
                                   3587 ; to backslash sequence
                                   3588 ; input:
                                   3589 ;   X        char *
                                   3590 ;-----------------------------
      001448                       3591 prt_quote:
      009212 16 02            [ 1] 3592 	ld a,#'"
      009214 90 F6 6B         [ 4] 3593 	call putc 
      009217 01               [ 1] 3594 1$:	ld a,(x)
      009218 A4 0F            [ 1] 3595 	jreq 9$
      00921A 4C               [ 1] 3596 	incw x 
      00921B C7 00            [ 1] 3597 	cp a,#SPACE 
      00921D 0B 72            [ 1] 3598 	jrult 3$
      00921F 5F 00 0A         [ 4] 3599 	call putc
      009222 72 B9            [ 1] 3600 	cp a,#'\ 
      009224 00 0A            [ 1] 3601 	jrne 1$ 
      00145C                       3602 2$:
      009226 90 FE 7B         [ 4] 3603 	call putc 
      009229 01 4E            [ 2] 3604 	jra 1$
      00922B A4               [ 1] 3605 3$: push a 
      00922C 0C 44            [ 1] 3606 	ld a,#'\
      00922E 44 AB 06         [ 4] 3607 	call putc 
      009231 84               [ 1] 3608 	pop a 
      009231 93 5B            [ 1] 3609 	sub a,#7
      009233 03 81 0A         [ 1] 3610 	ld acc8,a 
      009235 72 5F 00 09      [ 1] 3611 	clr acc16
      009235 88 CD 88 7A      [ 2] 3612 	ldw y,#escaped 
      009239 11 01 27 03      [ 2] 3613 	addw y,acc16 
      00923D CC 87            [ 1] 3614 	ld a,(y)
      00923F 94 84            [ 2] 3615 	jra 2$
      009241 81 22            [ 1] 3616 9$: ld a,#'"
      009242 CD 01 9E         [ 4] 3617 	call putc 
      009242 4B               [ 1] 3618 	incw x 
      009243 00               [ 4] 3619 	ret
                                   3620 
                                   3621 
                                   3622 ;--------------------------
                                   3623 ; decompile line from token list 
                                   3624 ; input:
                                   3625 ;   X 		pointer at line
                                   3626 ; output:
                                   3627 ;   none 
                                   3628 ;--------------------------	
                           000001  3629 	BASE_SAV=1
                           000002  3630 	WIDTH_SAV=2
                           000003  3631 	XSAVE=3
                           000005  3632 	LLEN=5
                           000005  3633 	VSIZE=5 
      001484                       3634 prt_basic_line:
      001484                       3635 	_vars VSIZE 
      009244 CD 93            [ 2]    1     sub sp,#VSIZE 
      009246 80 A1 00         [ 1] 3636 	ld a,base
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009249 27 19            [ 1] 3637 	ld (BASE_SAV,sp),a  
      00924B A1 03 26         [ 1] 3638 	ld a,tab_width 
      00924E 12 CD            [ 1] 3639 	ld (WIDTH_SAV,sp),a 
      009250 90 15 0C         [ 2] 3640 	ldw ptr16,x
      009253 01               [ 2] 3641 	ldw x,(x)
      009254 CD 88 7A A1      [ 1] 3642 	mov base,#10
      009258 00 27 09 A1      [ 1] 3643 	mov tab_width,#5
      00925C 0D 26 02         [ 4] 3644 	call print_int ; print line number 
      00925F 20 E3            [ 1] 3645 	ld a,#SPACE 
      009261 CD 90 0E         [ 4] 3646 	call putc 
      009264 84 81 00 25      [ 1] 3647 	clr tab_width
      009266 AE 00 02         [ 2] 3648 	ldw x,#2
      009266 CD 90 49 A6      [ 4] 3649 	ld a,([ptr16],x)
      00926A 0B CD            [ 1] 3650 	ld (LLEN,sp),a 
      00926C 92               [ 1] 3651 	incw x
      00926D 35               [ 1] 3652 1$:	ld a,xl 
      00926E CD 93            [ 1] 3653 	cp a,(LLEN,sp)
      009270 80 A1            [ 1] 3654 	jrmi 20$
      009272 03 27 03         [ 2] 3655 	jp 90$
      0014BA                       3656 20$:	 
      009275 CC 87 94 89      [ 4] 3657 	ld a,([ptr16],x)
      009279 A6               [ 1] 3658 	incw x 
      00927A 0C CD            [ 2] 3659 	ldw (XSAVE,sp),x 
      00927C 92 35            [ 1] 3660 	cp a,#TK_CMD 
      00927E 85 C3            [ 1] 3661 	jrult 5$
      009280 00 23            [ 1] 3662 	cp a,#TK_SFUNC 
      009282 23 05            [ 1] 3663 	jrugt 4$
      0014C9                       3664 2$:	
      009284 A6 0A CC 87      [ 5] 3665 	ldw x,([ptr16],x)
      009288 96 5D 27         [ 2] 3666 	cpw x,#rem 
      00928B F8 58            [ 1] 3667 	jrne 3$
      00928D 89 CE            [ 1] 3668 	ld a,#''
      00928F 00 21 72         [ 4] 3669 	call putc 
      009292 F0 01            [ 2] 3670 	ldw x,(XSAVE,sp)
      009294 5B 02 A6         [ 2] 3671 	addw x,#2
      009297 03 81 00 14      [ 2] 3672 	addw x,ptr16  
      009299 CD 01 B0         [ 4] 3673 	call puts 
      009299 52 01 CD         [ 2] 3674 	jp 90$ 
      00929C 88 7A A1         [ 4] 3675 3$:	call cmd_name
      00929F 02 2B 4A         [ 4] 3676 	call prt_cmd_name
      0092A2 6B 01            [ 1] 3677 	ld a,#SPACE 
      0092A4 A4 30 A1         [ 4] 3678 	call putc 
      0092A7 10 27            [ 2] 3679 	ldw x,(XSAVE,sp)
      0092A9 04 7B 01         [ 2] 3680 	addw x,#2
      0092AC 20 03            [ 2] 3681 	jra 1$
      0092AE A1 0A            [ 1] 3682 4$: cp a,#TK_QSTR 
      0092AE CD 88            [ 1] 3683 	jrne 5$
      0092B0 7A BB 00 14      [ 2] 3684 	addw x,ptr16
      0092B1 CD 14 48         [ 4] 3685 	call prt_quote 
      0092B1 A1 07 26 03      [ 2] 3686 	subw x,ptr16  
      0092B5 FD 20            [ 2] 3687 	jra 1$
      0092B7 2B 04            [ 1] 3688 5$:	cp a,#TK_VAR
      0092B8 26 1A            [ 1] 3689 	jrne 6$ 
      0092B8 A1 03 26 02      [ 5] 3690 	ldw x,([ptr16],x)
      0092BC 20 25 26         [ 2] 3691 	subw x,#vars 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0092BE 9F               [ 1] 3692 	ld a,xl
      0092BE A1               [ 1] 3693 	srl a 
      0092BF 05 26            [ 1] 3694 	add a,#'A 
      0092C1 06 CD 92         [ 4] 3695 	call putc 
      0092C4 66 FE            [ 1] 3696 	ld a,#SPACE 
      0092C6 20 1B 9E         [ 4] 3697 	call putc 
      0092C8 1E 03            [ 2] 3698 	ldw x,(XSAVE,sp)
      0092C8 A1 04 26         [ 2] 3699 	addw x,#2 
      0092CB 03 FE            [ 2] 3700 	jra 1$ 
      0092CD 20 14            [ 1] 3701 6$: cp a,#TK_ARRAY 
      0092CF 26 0A            [ 1] 3702 	jrne 7$
      0092CF A1 0B            [ 1] 3703 	ld a,#'@ 
      0092D1 26 0A CD         [ 4] 3704 	call putc 
      0092D4 93 80            [ 2] 3705 	ldw x,(XSAVE,sp)
      0092D6 A6 0C CD         [ 2] 3706 	jp 1$ 
      0092D9 92 35            [ 1] 3707 7$: cp a,#TK_INTGR 
      0092DB 20 06            [ 1] 3708 	jrne 8$
      0092DD 72 DE 00 14      [ 5] 3709 	ldw x,([ptr16],x)
      0092DD CD 90 0E         [ 4] 3710 	call print_int
      0092E0 4F 20            [ 1] 3711 	ld a,#SPACE 
      0092E2 09 01 9E         [ 4] 3712 	call putc 
      0092E3 1E 03            [ 2] 3713 	ldw x,(XSAVE,sp)
      0092E3 A6 11 11         [ 2] 3714 	addw x,#2 
      0092E6 01 26 01         [ 2] 3715 	jp 1$
      0092E9 50 31            [ 1] 3716 8$: cp a,#TK_GT 
      0092EA 2B 1A            [ 1] 3717 	jrmi 9$
      0092EA A6 03            [ 1] 3718 	cp a,#TK_NE 
      0092EC 22 16            [ 1] 3719 	jrugt 9$
      0092EC 5B 01            [ 1] 3720 	sub a,#TK_GT  
      0092EE 81               [ 1] 3721 	sll a 
      0092EF 90 5F            [ 1] 3722 	clrw y 
      0092EF 52 05            [ 1] 3723 	ld yl,a 
      0092F1 CD 92 99 A1      [ 2] 3724 	addw y,#relop_str 
      0092F5 02 2B            [ 2] 3725 	ldw y,(y)
      0092F7 41               [ 1] 3726 	ldw x,y 
      0092F8 CD 01 B0         [ 4] 3727 	call puts 
      0092F8 1F 03            [ 2] 3728 	ldw x,(XSAVE,sp)
      0092FA CD 88 7A         [ 2] 3729 	jp 1$
      0092FD A1 02            [ 1] 3730 9$: cp a,#TK_PLUS 
      0092FF 2B 34            [ 1] 3731 	jrne 10$
      009301 6B 05            [ 1] 3732 	ld a,#'+
      009303 A4 30            [ 2] 3733 	jra 80$ 
      009305 A1 20            [ 1] 3734 10$: cp a,#TK_MINUS
      009307 27 07            [ 1] 3735 	jrne 11$
      009309 7B 05            [ 1] 3736 	ld a,#'-
      00930B CD 90            [ 2] 3737 	jra 80$
      00930D 0E 20            [ 1] 3738 11$: cp a,#TK_MULT 
      00930F 25 0E            [ 1] 3739 	jrmi 12$
      009310 A1 22            [ 1] 3740 	cp a,#TK_MOD 
      009310 CD 92            [ 1] 3741 	jrugt 12$
      009312 99 A1            [ 1] 3742 	sub a,#0x20
      009314 03               [ 1] 3743 	clrw x 
      009315 27               [ 1] 3744 	ld xl,a 
      009316 03 CC 87         [ 2] 3745 	addw x,#mul_char 
      009319 94               [ 1] 3746 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00931A 1F 01            [ 2] 3747 	jra 80$ 
      00931C 7B 05            [ 1] 3748 12$: cp a,#TK_LPAREN 
      00931E A1 20            [ 1] 3749 	jrmi 13$
      009320 26 05            [ 1] 3750 	cp a,#TK_SHARP 
      009322 CD 91            [ 1] 3751 	jrugt 13$
      009324 11 20            [ 1] 3752 	sub a,#TK_LPAREN
      009326 D1               [ 1] 3753 	clrw x 
      009327 A1               [ 1] 3754 	ld xl,a 
      009328 21 26 05         [ 2] 3755 	addw x,#single_char 
      00932B CD               [ 1] 3756 	ld a,(x)
      00932C 91 59            [ 2] 3757 	jra 80$
      00932E 20 C8            [ 1] 3758 13$: cp a,#TK_CHAR 
      009330 CD 91            [ 1] 3759 	jrne 14$
      009332 9D 20            [ 1] 3760 	ld a,#'\
      009334 C3 1E 03         [ 4] 3761 	call putc 
      009337 A6 03            [ 2] 3762 	ldw x,(XSAVE,sp)
      009339 72 D6 00 14      [ 4] 3763 	ld a,([ptr16],x)
      009339 5B               [ 1] 3764 	incw x 
      00933A 05 81            [ 2] 3765 	ldw (XSAVE,sp),x 
      00933C CD 01 9E         [ 4] 3766 	call putc 
      00933C 52 05 CD         [ 2] 3767 	jp 1$ 
      00933F 92 EF            [ 1] 3768 14$: ld a,#':
      009341 A1 02 2B         [ 4] 3769 80$: call putc 
      009344 38 1F            [ 2] 3770 	ldw x,(XSAVE,sp)
      009346 03 CD 88         [ 2] 3771 	jp 1$ 
      0015C1                       3772 90$: 
      009349 7A A1            [ 1] 3773 	ld a,#CR 
      00934B 02 2B 2B         [ 4] 3774 	call putc
      00934E 6B 05            [ 1] 3775 	ld a,(WIDTH_SAV,sp) 
      009350 A4 30 A1         [ 1] 3776 	ld tab_width,a 
      009353 10 27            [ 1] 3777 	ld a,(BASE_SAV,sp) 
      009355 07 7B 05         [ 1] 3778 	ld base,a
      0015D0                       3779 	_drop VSIZE 
      009358 CD 90            [ 2]    1     addw sp,#VSIZE 
      00935A 0E               [ 4] 3780 	ret 	
      00935B 20 1C 2C 23           3781 single_char: .byte '(',')',',','#'
      00935D 2A 2F 25              3782 mul_char: .byte '*','/','%'
      00935D CD 92 EF A1 03 27 03  3783 relop_str: .word gt,equal,ge,lt,le,ne 
             CC 87 94 1F 01
      009369 7B 05                 3784 gt: .asciz ">"
      00936B A1 10                 3785 equal: .asciz "="
      00936D 26 05 CD              3786 ge: .asciz ">="
      009370 91 03                 3787 lt: .asciz "<"
      009372 20 D1 CD              3788 le: .asciz "<="
      009375 91 0B 20              3789 ne:  .asciz "<>"
                                   3790 
                                   3791 
                                   3792 ;---------------------------------
                                   3793 ; BASIC: PRINT|? arg_list 
                                   3794 ; print values from argument list
                                   3795 ;----------------------------------
                           000001  3796 	COMMA=1
                           000001  3797 	VSIZE=1
      0015F5                       3798 print:
      009378 CC 1E            [ 1] 3799 push #0 ; local variable COMMA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0015F7                       3800 reset_comma:
      00937A 03 A6            [ 1] 3801 	clr (COMMA,sp)
      0015F9                       3802 prt_loop:
      00937C 03 13 00         [ 4] 3803 	call relation 
      00937D A1 01            [ 1] 3804 	cp a,#TK_COLON 
      00937D 5B 05            [ 1] 3805 	jreq print_exit   
      00937F 81 03            [ 1] 3806 	cp a,#TK_INTGR 
      009380 26 05            [ 1] 3807 	jrne 0$ 
      009380 52 05 CD         [ 4] 3808 	call print_int 
      009383 93 3C            [ 2] 3809 	jra reset_comma
      001609                       3810 0$: 	
      009385 A1 02 2B         [ 4] 3811 	call next_token
      009388 4B 1F            [ 1] 3812 	cp a,#TK_NONE 
      00938A 03 CD            [ 1] 3813 	jreq print_exit 
      00938C 88 7A            [ 1] 3814 1$:	cp a,#TK_QSTR
      00938E A1 02            [ 1] 3815 	jrne 2$   
      009390 2B 3E B0         [ 4] 3816 	call puts
      009392 5C               [ 1] 3817 	incw x 
      009392 6B 05 A4 30      [ 2] 3818 	subw x,basicptr 
      009396 A1               [ 1] 3819 	ld a,xl 
      009397 30 27 07         [ 1] 3820 	ld in,a  
      00939A 7B 05            [ 2] 3821 	jra reset_comma
      00939C CD 90            [ 1] 3822 2$: cp a,#TK_CHAR 
      00939E 0E 20            [ 1] 3823 	jrne 3$
      0093A0 2F               [ 1] 3824 	ld a,xl 
      0093A1 CD 01 9E         [ 4] 3825 	call putc 
      0093A1 CD 93            [ 2] 3826 	jra reset_comma 
      00162C                       3827 3$: 	
      0093A3 3C A1            [ 1] 3828 	cp a,#TK_CFUNC 
      0093A5 03 27            [ 1] 3829 	jrne 4$ 
      0093A7 03               [ 4] 3830 	call (x)
      0093A8 CC               [ 1] 3831 	ld a,xl 
      0093A9 87 94 1F         [ 4] 3832 	call putc
      0093AC 01 CD            [ 2] 3833 	jra reset_comma 
      001637                       3834 4$: 
      0093AE 91 0B            [ 1] 3835 	cp a,#TK_COMMA 
      0093B0 26 06            [ 1] 3836 	jrne 5$
      0093B2 35 02            [ 1] 3837 	cpl (COMMA,sp) 
      0093B4 00 0B 20         [ 2] 3838 	jp prt_loop   
      001640                       3839 5$: 
      0093B7 0C 0E            [ 1] 3840 	cp a,#TK_SHARP
      0093B8 26 13            [ 1] 3841 	jrne 7$
      0093B8 2C 06 35         [ 4] 3842 	call next_token
      0093BB 04 00            [ 1] 3843 	cp a,#TK_INTGR 
      0093BD 0B 20            [ 1] 3844 	jreq 6$
      0093BF 04 07 14         [ 2] 3845 	jp syntax_error 
      0093C0                       3846 6$:
      0093C0 35               [ 1] 3847 	ld a,xl 
      0093C1 01 00            [ 1] 3848 	and a,#15 
      0093C3 0B 00 25         [ 1] 3849 	ld tab_width,a 
      0093C4 CC 15 F7         [ 2] 3850 	jp reset_comma 
      001657                       3851 7$:	
      0093C4 5F C6 00         [ 4] 3852 	call unget_token
      00165A                       3853 print_exit:
      0093C7 0B 14            [ 1] 3854 	tnz (COMMA,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0093C9 05 4D            [ 1] 3855 	jrne 9$
      0093CB 27 05            [ 1] 3856 	ld a,#CR 
      0093CD 5C 01 9E         [ 4] 3857     call putc 
      0093CE                       3858 9$:	_drop VSIZE 
      0093CE 20 02            [ 2]    1     addw sp,#VSIZE 
      0093D0 1E               [ 4] 3859 	ret 
                                   3860 
                                   3861 ;----------------------
                                   3862 ; 'save_context' and
                                   3863 ; 'rest_context' must be 
                                   3864 ; called at the same 
                                   3865 ; call stack depth 
                                   3866 ; i.e. SP must have the 
                                   3867 ; save value at  
                                   3868 ; entry point of both 
                                   3869 ; routine. 
                                   3870 ;---------------------
                           000006  3871 	CTXT_SIZE=6 ; size of saved data 
                                   3872 ;--------------------
                                   3873 ; save current BASIC
                                   3874 ; interpreter context 
                                   3875 ; on cstack 
                                   3876 ;--------------------
      001666                       3877 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001666                       3878 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001666                       3879 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001666                       3880 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001666                       3881 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      001666                       3882 save_context:
      0093D1 03 00 03         [ 2] 3883 	ldw x,basicptr 
      0093D2 1F 03            [ 2] 3884 	ldw (BPTR,sp),x
      0093D2 A6 03 05         [ 2] 3885 	ldw x,lineno 
      0093D4 1F 05            [ 2] 3886 	ldw (LNO,sp),x 
      0093D4 5B 05 81         [ 1] 3887 	ld a,in 
      0093D7 6B 07            [ 1] 3888 	ld (IN,sp),a
      0093D7 C6 00 08         [ 1] 3889 	ld a,count 
      0093DA 88 CD            [ 1] 3890 	ld (CNT,sp),a  
      0093DC 90               [ 4] 3891 	ret
                                   3892 
                                   3893 ;-----------------------
                                   3894 ; restore previously saved 
                                   3895 ; BASIC interpreter context 
                                   3896 ; from cstack 
                                   3897 ;-------------------------
      00167B                       3898 rest_context:
      0093DD A3 CD            [ 2] 3899 	ldw x,(BPTR,sp)
      0093DF 90 D6 84         [ 2] 3900 	ldw basicptr,x 
      0093E2 C7 00            [ 2] 3901 	ldw x,(LNO,sp)
      0093E4 08 4F 81         [ 2] 3902 	ldw lineno,x 
      0093E7 7B 07            [ 1] 3903 	ld a,(IN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0093E7 35 10 00         [ 1] 3904 	ld in,a
      0093EA 08 81            [ 1] 3905 	ld a,(CNT,sp)
      0093EC C7 00 02         [ 1] 3906 	ld count,a  
      0093EC 35               [ 4] 3907 	ret
                                   3908 
                                   3909 ;------------------------------------------
                                   3910 ; BASIC: INPUT [string],var[,[string],var]
                                   3911 ; input value in variables 
                                   3912 ; [string] optionally can be used as prompt 
                                   3913 ;-----------------------------------------
                           000001  3914 	CX_BPTR=1
                           000003  3915 	CX_LNO=3
                           000004  3916 	CX_IN=4
                           000005  3917 	CX_CNT=5
                           000006  3918 	SKIP=6
                           000007  3919 	VSIZE=7
      001690                       3920 input_var:
      0093ED 0A 00 08 81 05   [ 2] 3921 	btjt flags,#FRUN,1$ 
      0093F1 A6 06            [ 1] 3922 	ld a,#ERR_RUN_ONLY 
      0093F1 AE 16 C8         [ 2] 3923 	jp tb_error 
      00169A                       3924 1$:	_vars VSIZE 
      0093F4 72 B0            [ 2]    1     sub sp,#VSIZE 
      00169C                       3925 input_loop:
      0093F6 00 1E            [ 1] 3926 	clr (SKIP,sp)
      0093F8 A6 03 81         [ 4] 3927 	call next_token 
      0093FB A1 00            [ 1] 3928 	cp a,#TK_NONE 
      0093FB AE 16            [ 1] 3929 	jreq input_exit 
      0093FD C8 72            [ 1] 3930 	cp a,#TK_QSTR 
      0093FF B0 00            [ 1] 3931 	jrne 1$ 
      009401 1E 54 CF         [ 4] 3932 	call puts 
      009404 00 23            [ 1] 3933 	cpl (SKIP,sp)
      009406 A6 03 81         [ 4] 3934 	call next_token 
      009409 A1 04            [ 1] 3935 1$: cp a,#TK_VAR  
      009409 CD 88            [ 1] 3936 	jreq 2$ 
      00940B 7A A1 04         [ 2] 3937 	jp syntax_error
      00940E 27 03 CC         [ 4] 3938 2$:	call dpush 
      009411 87 94            [ 1] 3939 	tnz (SKIP,sp)
      009413 26 0F            [ 1] 3940 	jrne 21$ 
      009413 CD 90            [ 1] 3941 	ld a,#':
      009415 15 CD 88         [ 1] 3942 	ld pad+1,a 
      009418 7A A1 32 27      [ 1] 3943 	clr pad+2
      00941C 03 CC 87         [ 2] 3944 	ldw x,#pad 
      00941F 94 01 B0         [ 4] 3945 	call puts   
      009420                       3946 21$:
      009420 CD 93 80         [ 4] 3947 	call save_context 
      009423 A1 03 27         [ 2] 3948 	ldw x,#tib 
      009426 03 CC 87         [ 2] 3949 	ldw basicptr,x  
      009429 94 5F 00 02      [ 1] 3950 	clr count  
      00942A CD 0A 87         [ 4] 3951 	call readln 
      00942A 90 93 CD 90      [ 1] 3952 	clr in 
      00942E 22 FF 81         [ 4] 3953 	call relation 
      009431 A1 03            [ 1] 3954 	cp a,#TK_INTGR
      009431 52 06            [ 1] 3955 	jreq 3$ 
      009433 CE 00 1C         [ 2] 3956 	jp syntax_error
      009436 C3 00 1E         [ 4] 3957 3$: call dpush 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009439 2B 03 CC         [ 4] 3958 	call store 
      00943C 94 B1 1F         [ 4] 3959 	call rest_context
      00943F 05 FE 1F         [ 4] 3960 	call next_token 
      009442 01 AE            [ 1] 3961 	cp a,#TK_COMMA 
      009444 7F FF            [ 1] 3962 	jrne 4$
      009446 1F 03            [ 2] 3963 	jra input_loop 
      009448 CD 92 42         [ 4] 3964 4$:	call unget_token 
      001701                       3965 input_exit:
      001701                       3966 	_drop VSIZE 
      00944B 4D 27            [ 2]    1     addw sp,#VSIZE 
      00944D 3F               [ 4] 3967 	ret 
                                   3968 
                                   3969 
                                   3970 ;---------------------
                                   3971 ; BASIC: REMARK | ' 
                                   3972 ; skip comment to end of line 
                                   3973 ;---------------------- 
      001704                       3974 rem:
      00944E A1 02 27 07 A1   [ 1] 3975  	mov count,in 
      009453 01               [ 4] 3976 	ret 
                                   3977 
                                   3978 ;---------------------
                                   3979 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3980 ; read in loop 'addr'  
                                   3981 ; apply & 'mask' to value 
                                   3982 ; loop while result==0.  
                                   3983 ; if 'xor_mask' given 
                                   3984 ; apply ^ in second  
                                   3985 ; loop while result==0 
                                   3986 ;---------------------
                           000001  3987 	XMASK=1 
                           000002  3988 	MASK=2
                           000003  3989 	ADDR=3
                           000004  3990 	VSIZE=4
      00170A                       3991 wait: 
      00170A                       3992 	_vars VSIZE
      009454 27 06            [ 2]    1     sub sp,#VSIZE 
      009456 CC 87            [ 1] 3993 	clr (XMASK,sp) 
      009458 94 CD 90         [ 4] 3994 	call arg_list 
      00945B 2F 02            [ 1] 3995 	cp a,#2
      00945C 24 03            [ 1] 3996 	jruge 0$
      00945C CD 90 22         [ 2] 3997 	jp syntax_error 
      00945F 1F 01            [ 1] 3998 0$:	cp a,#3
      009461 A1 01            [ 1] 3999 	jrult 1$
      009463 27 05 A2         [ 4] 4000 	call dpop 
      009465 9F               [ 1] 4001 	ld a,xl
      009465 CD 90            [ 1] 4002 	ld (XMASK,sp),a 
      009467 22 1F 03         [ 4] 4003 1$: call dpop ; mask 
      00946A 9F               [ 1] 4004 	ld a,xl 
      00946A CE 00            [ 1] 4005 	ld (MASK,sp),a 
      00946C 1C 1F 05         [ 4] 4006 	call dpop ; address 
      00946F C3               [ 1] 4007 2$:	ld a,(x)
      009470 00 1E            [ 1] 4008 	and a,(MASK,sp)
      009472 2A 3D            [ 1] 4009 	xor a,(XMASK,sp)
      009474 FE 13            [ 1] 4010 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      001732                       4011 	_drop VSIZE 
      009476 01 2A            [ 2]    1     addw sp,#VSIZE 
      009478 14               [ 4] 4012 	ret 
                                   4013 
                                   4014 ;---------------------
                                   4015 ; BASIC: BSET addr,mask
                                   4016 ; set bits at 'addr' corresponding 
                                   4017 ; to those of 'mask' that are at 1.
                                   4018 ; arguments:
                                   4019 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4020 ;   mask        mask|addr
                                   4021 ; output:
                                   4022 ;	none 
                                   4023 ;--------------------------
      001735                       4024 bit_set:
      009479 1E 05 1C         [ 4] 4025 	call arg_list 
      00947C 00 02            [ 1] 4026 	cp a,#2	 
      00947E F6 5C            [ 1] 4027 	jreq 1$ 
      009480 C7 00 0B         [ 2] 4028 	jp syntax_error
      00173F                       4029 1$: 
      009483 72 5F 00         [ 4] 4030 	call dpop ; mask 
      009486 0A               [ 1] 4031 	ld a,xl 
      009487 72 BB 00         [ 4] 4032 	call dpop ; addr  
      00948A 0A               [ 1] 4033 	or a,(x)
      00948B 20               [ 1] 4034 	ld (x),a
      00948C E0               [ 4] 4035 	ret 
                                   4036 
                                   4037 ;---------------------
                                   4038 ; BASIC: BRES addr,mask
                                   4039 ; reset bits at 'addr' corresponding 
                                   4040 ; to those of 'mask' that are at 1.
                                   4041 ; arguments:
                                   4042 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4043 ;   mask	    ~mask&*addr  
                                   4044 ; output:
                                   4045 ;	none 
                                   4046 ;--------------------------
      00948D                       4047 bit_reset:
      00948D 1E 05 C2         [ 4] 4048 	call arg_list 
      00948F A1 02            [ 1] 4049 	cp a,#2  
      00948F CD 95            [ 1] 4050 	jreq 1$ 
      009491 04 1E 05         [ 2] 4051 	jp syntax_error
      001753                       4052 1$: 
      009494 E6 02 C7         [ 4] 4053 	call dpop ; mask 
      009497 00               [ 1] 4054 	ld a,xl 
      009498 0B               [ 1] 4055 	cpl a 
      009499 72 5F 00         [ 4] 4056 	call dpop ; addr  
      00949C 0A               [ 1] 4057 	and a,(x)
      00949D 72               [ 1] 4058 	ld (x),a 
      00949E BB               [ 4] 4059 	ret 
                                   4060 
                                   4061 ;---------------------
                                   4062 ; BASIC: BRES addr,mask
                                   4063 ; toggle bits at 'addr' corresponding 
                                   4064 ; to those of 'mask' that are at 1.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4065 ; arguments:
                                   4066 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4067 ;   mask	    mask^*addr  
                                   4068 ; output:
                                   4069 ;	none 
                                   4070 ;--------------------------
      00175E                       4071 bit_toggle:
      00949F 00 0A C3         [ 4] 4072 	call arg_list 
      0094A2 00 1E            [ 1] 4073 	cp a,#2 
      0094A4 2A 0B            [ 1] 4074 	jreq 1$ 
      0094A6 1F 05 FE         [ 2] 4075 	jp syntax_error
      0094A9 13 03 2C         [ 4] 4076 1$: call dpop ; mask 
      0094AC 04               [ 1] 4077 	ld a,xl 
      0094AD 1E 05 20         [ 4] 4078 	call dpop ; addr  
      0094B0 DE               [ 1] 4079 	xor a,(x)
      0094B1 F7               [ 1] 4080 	ld (x),a 
      0094B1 5B               [ 4] 4081 	ret 
                                   4082 
                                   4083 
                                   4084 ;--------------------
                                   4085 ; BASIC: POKE addr,byte
                                   4086 ; put a byte at addr 
                                   4087 ;--------------------
      001772                       4088 poke:
      0094B2 06 81 C2         [ 4] 4089 	call arg_list 
      0094B4 A1 02            [ 1] 4090 	cp a,#2
      0094B4 F6 5C            [ 1] 4091 	jreq 1$
      0094B6 A4 0F 88         [ 2] 4092 	jp syntax_error
      00177C                       4093 1$:	
      0094B9 0D 01 27         [ 4] 4094 	call dpop 
      0094BC 09               [ 1] 4095     ld a,xl 
      0094BD F6 CD 82         [ 4] 4096 	call dpop 
      0094C0 1E               [ 1] 4097 	ld (x),a 
      0094C1 5C               [ 4] 4098 	ret 
                                   4099 
                                   4100 ;-----------------------
                                   4101 ; BASIC: PEEK(addr)
                                   4102 ; get the byte at addr 
                                   4103 ; input:
                                   4104 ;	none 
                                   4105 ; output:
                                   4106 ;	X 		value 
                                   4107 ;-----------------------
      001785                       4108 peek:
      0094C2 0A 01            [ 1] 4109 	ld a,#TK_LPAREN 
      0094C4 20 F3 84         [ 4] 4110 	call expect 
      0094C7 81 11 C2         [ 4] 4111 	call arg_list
      0094C8 A1 01            [ 1] 4112 	cp a,#1 
      0094C8 A6 22            [ 1] 4113 	jreq 1$
      0094CA CD 82 1E         [ 2] 4114 	jp syntax_error
      0094CD F6 27            [ 1] 4115 1$:	ld a,#TK_RPAREN 
      0094CF 2D 5C A1         [ 4] 4116 	call expect 
      0094D2 20 25 0C         [ 4] 4117 	call dpop 
      0094D5 CD               [ 1] 4118 	ld a,(x)
      0094D6 82               [ 1] 4119 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0094D7 1E               [ 1] 4120 	ld xl,a 
      0094D8 A1 5C            [ 1] 4121 	ld a,#TK_INTGR
      0094DA 26               [ 4] 4122 	ret 
                                   4123 
      0017A2                       4124 if: 
      0094DB F1 13 00         [ 4] 4125 	call relation 
      0094DC A1 03            [ 1] 4126 	cp a,#TK_INTGR
      0094DC CD 82            [ 1] 4127 	jreq 1$ 
      0094DE 1E 20 EC         [ 2] 4128 	jp syntax_error
      0094E1 88               [ 1] 4129 1$:	clr a 
      0094E2 A6               [ 2] 4130 	tnzw x 
      0094E3 5C CD            [ 1] 4131 	jrne 9$  
                                   4132 ;skip to next line
      0094E5 82 1E 84 A0 07   [ 1] 4133 	mov in,count
      0094EA C7               [ 4] 4134 9$:	ret 
                                   4135 
                                   4136 ;------------------------
                                   4137 ; BASIC: FOR var=expr 
                                   4138 ; set variable to expression 
                                   4139 ; leave variable address 
                                   4140 ; on dstack and set
                                   4141 ; FFOR bit in 'flags'
                                   4142 ;-----------------
                           000001  4143 	RETL1=1
                           000003  4144 	INW=3
                           000005  4145 	BPTR=5
      0017B6                       4146 for: ; { -- var_addr }
      0094EB 00 0B            [ 1] 4147 	ld a,#TK_VAR 
      0094ED 72 5F 00         [ 4] 4148 	call expect
      0094F0 0A 90 AE         [ 4] 4149 	call dpush 
      0094F3 8C DF 72         [ 4] 4150 	call let02 
      0094F6 B9 00 0A 90      [ 1] 4151 	bset flags,#FFOR 
                                   4152 ; open space on cstack for BPTR and INW 
      0094FA F6               [ 2] 4153 	popw x ; call return address 
      0017C6                       4154 	_vars 4
      0094FB 20 DF            [ 2]    1     sub sp,#4 
      0094FD A6               [ 2] 4155 	pushw x  ; RETL1 
      0094FE 22               [ 1] 4156 	clrw x 
      0094FF CD 82            [ 2] 4157 	ldw (BPTR,sp),x 
      009501 1E 5C            [ 2] 4158 	ldw (INW,sp),x 
      009503 81 07 FA         [ 4] 4159 	call next_token 
      009504 A1 06            [ 1] 4160 	cp a,#TK_CMD 
      009504 52 05            [ 1] 4161 	jreq 1$
      009506 C6 00 08         [ 2] 4162 	jp syntax_error
      0017D8                       4163 1$:  
      009509 6B 01 C6         [ 2] 4164 	cpw x,#to 
      00950C 00 26            [ 1] 4165 	jreq to
      00950E 6B 02 CF         [ 2] 4166 	jp syntax_error 
                                   4167 
                                   4168 ;-----------------------------------
                                   4169 ; BASIC: TO expr 
                                   4170 ; second part of FOR loop initilization
                                   4171 ; leave limit on dstack and set 
                                   4172 ; FTO bit in 'flags'
                                   4173 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0017E0                       4174 to: ; { var_addr -- var_addr limit step }
      009511 00 15 FE 35 0A   [ 2] 4175 	btjt flags,#FFOR,1$
      009516 00 08 35         [ 2] 4176 	jp syntax_error
      009519 05 00 26         [ 4] 4177 1$: call relation  
      00951C CD 8A            [ 1] 4178 	cp a,#TK_INTGR 
      00951E 19 A6            [ 1] 4179 	jreq 2$ 
      009520 20 CD 82         [ 2] 4180 	jp syntax_error
      0017F2                       4181 2$: 
      009523 1E 72 5F         [ 4] 4182     call dpush ; limit
      009526 00 26 AE         [ 2] 4183 	ldw x,in.w 
      009529 00 02 72         [ 4] 4184 	call next_token
      00952C D6 00            [ 1] 4185 	cp a,#TK_NONE  
      00952E 15 6B            [ 1] 4186 	jreq 4$ 
      009530 05 5C            [ 1] 4187 	cp a,#TK_CMD
      009532 9F 11            [ 1] 4188 	jrne 3$
      009534 05 2B 03         [ 2] 4189 	cpw x,#step 
      009537 CC 96            [ 1] 4190 	jreq step
      001808                       4191 3$:	
      009539 41 0F 8E         [ 4] 4192 	call unget_token   	 
      00953A                       4193 4$:	
      00953A 72 D6 00         [ 2] 4194 	ldw x,#1   ; default step  
      00953D 15 5C            [ 2] 4195 	jra store_loop_addr 
                                   4196 
                                   4197 
                                   4198 ;----------------------------------
                                   4199 ; BASIC: STEP expr 
                                   4200 ; optional third par of FOR loop
                                   4201 ; initialization. 	
                                   4202 ;------------------------------------
      001810                       4203 step: ; {var limit -- var limit step}
      00953F 1F 03 A1 06 25   [ 2] 4204 	btjt flags,#FFOR,1$
      009544 44 A1 09         [ 2] 4205 	jp syntax_error
      009547 22 2F 00         [ 4] 4206 1$: call relation
      009549 A1 03            [ 1] 4207 	cp a,#TK_INTGR
      009549 72 DE            [ 1] 4208 	jreq store_loop_addr  
      00954B 00 15 A3         [ 2] 4209 	jp syntax_error
                                   4210 ; leave loop back entry point on cstack 
                                   4211 ; cstack is 2 call deep from interp_loop
      001822                       4212 store_loop_addr:
      00954E 97 84 26         [ 4] 4213 	call dpush 
      009551 14 A6 27         [ 2] 4214 	ldw x,basicptr  
      009554 CD 82            [ 2] 4215 	ldw (BPTR,sp),x 
      009556 1E 1E 03         [ 2] 4216 	ldw x,in.w 
      009559 1C 00            [ 2] 4217 	ldw (INW,sp),x   
      00955B 02 72 BB 00      [ 1] 4218 	bres flags,#FFOR 
      00955F 15 CD 82 30      [ 1] 4219 	inc loop_depth  
      009563 CC               [ 4] 4220 	ret 
                                   4221 
                                   4222 ;--------------------------------
                                   4223 ; BASIC: NEXT var 
                                   4224 ; FOR loop control 
                                   4225 ; increment variable with step 
                                   4226 ; and compare with limit 
                                   4227 ; loop if threshold not crossed.
                                   4228 ; else clean both stacks. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4229 ; and decrement 'loop_depth' 
                                   4230 ;--------------------------------
      001838                       4231 next: ; {var limit step -- [var limit step ] }
      009564 96 41 CD 91      [ 1] 4232 	tnz loop_depth 
      009568 AE CD            [ 1] 4233 	jrne 1$ 
      00956A 94 B4 A6         [ 2] 4234 	jp syntax_error 
      001841                       4235 1$: 
      00956D 20 CD            [ 1] 4236 	ld a,#TK_VAR 
      00956F 82 1E 1E         [ 4] 4237 	call expect
                                   4238 ; check for good variable after NEXT 	 
      009572 03 1C            [ 1] 4239 	ldw y,x 
      009574 00 02 20         [ 2] 4240 	ldw x,#4  
      009577 BA A1 0A 26      [ 4] 4241 	cpw y,([dstkptr],x) ; compare variables address 
      00957B 0D 72            [ 1] 4242 	jreq 2$  
      00957D BB 00 15         [ 2] 4243 	jp syntax_error ; not the good one 
      001854                       4244 2$: ; increment variable 
      009580 CD               [ 1] 4245 	ldw x,y
      009581 94               [ 2] 4246 	ldw x,(x)  ; get var value 
      009582 C8 72 B0         [ 2] 4247 	ldw acc16,x 
      009585 00 15 20 A9      [ 5] 4248 	ldw x,[dstkptr] ; step
      009589 A1 04 26 1A      [ 2] 4249 	addw x,acc16 ; var+step 
      00958D 72 DE            [ 2] 4250 	ldw (y),x ; save var new value 
                                   4251 ; compare with limit 
      00958F 00 15            [ 1] 4252 	ldw y,x 
      009591 1D 00 27 9F      [ 5] 4253 	ldw x,[dstkptr] ; step in x 
      009595 44               [ 2] 4254 	tnzw x  
      009596 AB 41            [ 1] 4255 	jrpl 4$ ; positive step 
                                   4256 ;negative step 
      009598 CD 82 1E         [ 2] 4257 	ldw x,#2
      00959B A6 20 CD 82      [ 4] 4258 	cpw y,([dstkptr],x)
      00959F 1E 1E            [ 1] 4259 	jrslt loop_done
      0095A1 03 1C            [ 2] 4260 	jra loop_back 
      001877                       4261 4$: ; positive step
      0095A3 00 02 20         [ 2] 4262 	ldw x,#2 
      0095A6 8B A1 05 26      [ 4] 4263 	cpw y,([dstkptr],x)
      0095AA 0A A6            [ 1] 4264 	jrsgt loop_done
      001880                       4265 loop_back:
      0095AC 40 CD            [ 2] 4266 	ldw x,(BPTR,sp)
      0095AE 82 1E 1E         [ 2] 4267 	ldw basicptr,x 
      0095B1 03 CC 95 32 A1   [ 2] 4268 	btjf flags,#FRUN,1$ 
      0095B6 03 26            [ 1] 4269 	ld a,(2,x)
      0095B8 14 72 DE         [ 1] 4270 	ld count,a
      0095BB 00               [ 2] 4271 	ldw x,(x)
      0095BC 15 CD 8A         [ 2] 4272 	ldw lineno,x
      0095BF 19 A6            [ 2] 4273 1$:	ldw x,(INW,sp)
      0095C1 20 CD 82         [ 2] 4274 	ldw in.w,x 
      0095C4 1E               [ 4] 4275 	ret 
      001899                       4276 loop_done:
                                   4277 	; remove var limit step on dstack 
      0095C5 1E 03 1C         [ 2] 4278 	ldw x,dstkptr 
      0095C8 00 02 CC         [ 2] 4279 	addw x,#3*CELL_SIZE
      0095CB 95 32 A1         [ 2] 4280 	ldw dstkptr,x 
                                   4281 	; remove 2 return address on cstack 
      0095CE 31               [ 2] 4282 	popw x
      0018A3                       4283 	_drop 4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095CF 2B 1A            [ 2]    1     addw sp,#4 
      0095D1 A1               [ 2] 4284 	pushw x 
      0095D2 35 22 16 A0      [ 1] 4285 	dec loop_depth 
      0095D6 31               [ 4] 4286 	ret 
                                   4287 
                                   4288 
                                   4289 ;------------------------
                                   4290 ; BASIC: GOTO lineno 
                                   4291 ; jump to lineno 
                                   4292 ; here cstack is 2 call deep from interp_loop 
                                   4293 ;------------------------
      0018AB                       4294 goto:
      0095D7 48 90 5F 90 97   [ 2] 4295 	btjt flags,#FRUN,0$ 
      0095DC 72 A9            [ 1] 4296 	ld a,#ERR_RUN_ONLY
      0095DE 96 5A 90         [ 2] 4297 	jp tb_error 
      0095E1 FE               [ 4] 4298 	ret 
      0095E2 93 CD            [ 2] 4299 0$:	jra go_common
                                   4300 
                                   4301 ;--------------------
                                   4302 ; BASIC: GOSUB lineno
                                   4303 ; basic subroutine call
                                   4304 ; actual lineno and basicptr 
                                   4305 ; are saved on cstack
                                   4306 ; here cstack is 2 call deep from interp_loop 
                                   4307 ;--------------------
                           000003  4308 	GOS_RET=3
      0018B8                       4309 gosub:
      0095E4 82 30 1E 03 CC   [ 2] 4310 	btjt flags,#FRUN,0$ 
      0095E9 95 32            [ 1] 4311 	ld a,#ERR_RUN_ONLY
      0095EB A1 10 26         [ 2] 4312 	jp tb_error 
      0095EE 04               [ 4] 4313 	ret 
      0095EF A6               [ 2] 4314 0$:	popw x 
      0095F0 2B 20            [ 2] 4315 	sub sp,#2 
      0095F2 46               [ 2] 4316 	pushw x 
      0095F3 A1 11 26         [ 2] 4317 	ldw x,basicptr
      0095F6 04 A6            [ 1] 4318 	ld a,(2,x)
      0095F8 2D 20            [ 1] 4319 	add a,#3 
      0095FA 3E A1 20         [ 1] 4320 	ld acc8,a 
      0095FD 2B 0E A1 22      [ 1] 4321 	clr acc16 
      009601 22 0A A0 20      [ 2] 4322 	addw x,acc16
      009605 5F 97            [ 2] 4323 	ldw (GOS_RET,sp),x 
      0018DB                       4324 go_common: 
      009607 1C 96 57         [ 4] 4325 	call relation 
      00960A F6 20            [ 1] 4326 	cp a,#TK_INTGR
      00960C 2C A1            [ 1] 4327 	jreq 1$ 
      00960E 0B 2B 0E         [ 2] 4328 	jp syntax_error
      0018E5                       4329 1$: 
      009611 A1 0E 22         [ 4] 4330 	call search_lineno  
      009614 0A               [ 2] 4331 	tnzw x 
      009615 A0 0B            [ 1] 4332 	jrne 2$ 
      009617 5F 97            [ 1] 4333 	ld a,#ERR_NO_LINE 
      009619 1C 96 53         [ 2] 4334 	jp tb_error 
      0018F0                       4335 2$: 
      00961C F6 20 1A         [ 2] 4336 	ldw basicptr,x 
      00961F A1 02            [ 1] 4337 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009621 26 14 A6         [ 1] 4338 	ld count,a 
      009624 5C               [ 2] 4339 	ldw x,(x)
      009625 CD 82 1E         [ 2] 4340 	ldw lineno,x 
      009628 1E 03 72 D6      [ 1] 4341 	mov in,#3 
      00962C 00               [ 4] 4342 	ret 
                                   4343 
                                   4344 ;------------------------
                                   4345 ; BASIC: RETURN 
                                   4346 ; exit from a subroutine 
                                   4347 ; cstack is 2 level deep from interp_loop 
                                   4348 ;------------------------
      001901                       4349 return:
      00962D 15 5C 1F 03 CD   [ 2] 4350 	btjt flags,#FRUN,0$ 
      009632 82 1E            [ 1] 4351 	ld a,#ERR_RUN_ONLY
      009634 CC 95 32         [ 2] 4352 	jp tb_error 
      00190B                       4353 0$:	
      009637 A6 3A            [ 2] 4354 	ldw x,(GOS_RET,sp) 
      009639 CD 82 1E         [ 2] 4355 	ldw basicptr,x 
      00963C 1E 03            [ 1] 4356 	ld a,(2,x)
      00963E CC 95            [ 1] 4357 	add a,#3 
      009640 32 00 02         [ 1] 4358 	ld count,a 
      009641 35 03 00 01      [ 1] 4359 	mov in,#3
      009641 A6               [ 2] 4360 	ldw x,(x)
      009642 0D CD 82         [ 2] 4361 	ldw lineno,x 
      009645 1E               [ 1] 4362 	clr a 
      009646 7B               [ 2] 4363 	popw x 
      001921                       4364 	_drop 2
      009647 02 C7            [ 2]    1     addw sp,#2 
      009649 00               [ 2] 4365 	pushw x
      00964A 26               [ 4] 4366 	ret  
                                   4367 
                                   4368 
                                   4369 ;----------------------------------
                                   4370 ; BASIC: RUN
                                   4371 ; run BASIC program in RAM
                                   4372 ;----------------------------------- 
      001925                       4373 run: 
      00964B 7B 01 C7 00 08   [ 2] 4374 	btjf flags,#FRUN,0$  
      009650 5B               [ 1] 4375 	clr a 
      009651 05               [ 4] 4376 	ret
      00192C                       4377 0$: 
      009652 81 28 29 2C 23   [ 2] 4378 	btjf flags,#FBREAK,1$
      001931                       4379 	_drop 2 
      009657 2A 2F            [ 2]    1     addw sp,#2 
      009659 25 96 66         [ 4] 4380 	call rest_context
      001936                       4381 	_drop CTXT_SIZE 
      00965C 96 68            [ 2]    1     addw sp,#CTXT_SIZE 
      00965E 96 6A 96 6D      [ 1] 4382 	bres flags,#FBREAK 
      009662 96 6F 96 72      [ 1] 4383 	bset flags,#FRUN 
      009666 3E 00 3D         [ 2] 4384 	jp interp_loop 
      009669 00 3E 3D         [ 2] 4385 1$:	ldw x,txtbgn
      00966C 00 3C 00         [ 2] 4386 	cpw x,txtend 
      00966F 3C 3D            [ 1] 4387 	jrmi 2$ 
      009671 00               [ 1] 4388 	clr a 
      009672 3C               [ 4] 4389 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      009673 3E 00 7B         [ 4] 4390 2$: call ubound 
      009675                       4391 	_drop 2 
      009675 4B 00            [ 2]    1     addw sp,#2 
      009677 CE 00 1B         [ 2] 4392 	ldw x,txtbgn 
      009677 0F 01 03         [ 2] 4393 	ldw basicptr,x 
      009679 E6 02            [ 1] 4394 	ld a,(2,x)
      009679 CD 93 80         [ 1] 4395 	ld count,a
      00967C A1               [ 2] 4396 	ldw x,(x)
      00967D 01 27 5A         [ 2] 4397 	ldw lineno,x
      009680 A1 03 26 05      [ 1] 4398 	mov in,#3	
      009684 CD 8A 19 20      [ 1] 4399 	bset flags,#FRUN 
      009688 EE 07 CA         [ 2] 4400 	jp interp_loop 
                                   4401 
                                   4402 
                                   4403 ;----------------------
                                   4404 ; BASIC: STOP 
                                   4405 ; stop running program
                                   4406 ;---------------------- 
      009689                       4407 stop: 
                                   4408 ; clean dstack and cstack 
      009689 CD 88 7A         [ 2] 4409 	ldw x,#STACK_EMPTY 
      00968C A1               [ 1] 4410 	ldw sp,x 
      00968D 00 27 4A A1      [ 1] 4411 	bres flags,#FRUN 
      009691 0A 26 0E CD      [ 1] 4412 	bres flags,#FBREAK
      009695 82 30 5C         [ 2] 4413 	jp warm_start
                                   4414 
                                   4415 ;-----------------------
                                   4416 ; BASIC BEEP expr1,expr2
                                   4417 ; used MCU internal beeper 
                                   4418 ; to produce a sound
                                   4419 ; arguments:
                                   4420 ;    expr1   frequency, {1,2,4} mapping to 1K,2K,4K
                                   4421 ;    expr2   duration msec.
                                   4422 ;---------------------------
      00197B                       4423 beep:
      009698 72 B0 00         [ 4] 4424 	call arg_list 
      00969B 04 9F            [ 1] 4425 	cp a,#2 
      00969D C7 00            [ 1] 4426 	jreq 2$
      00969F 02 20 D5         [ 2] 4427 	jp syntax_error 
      0096A2 A1 02 26         [ 2] 4428 2$: ldw x,dstkptr 
      0096A5 06 9F            [ 2] 4429 	ldw x,(2,x);frequency 
      0096A7 CD               [ 1] 4430 	ld a,xl
      0096A8 82               [ 1] 4431 	dec a 
      0096A9 1E               [ 1] 4432 	swap a 
      0096AA 20               [ 1] 4433 	sll a 
      0096AB CB               [ 1] 4434 	sll a 
      0096AC AB 3E            [ 1] 4435 	add a,#0x3e 
      0096AC A1 08 26         [ 1] 4436 	ld BEEP_CSR,a 
      0096AF 07 FD 9F         [ 4] 4437 	call dpop 
      0096B2 CD 82 1E         [ 4] 4438 	call pause02 
      0096B5 20 C0 C9         [ 4] 4439 	call ddrop 
      0096B7 A6 1F            [ 1] 4440 	ld a,#0x1f
      0096B7 A1 0D 26         [ 1] 4441 	ld BEEP_CSR,a 
      0096BA 05               [ 4] 4442 	ret 
                                   4443 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4444 ;-------------------------------
                                   4445 ; BASIC: PWRADC 0|1,divisor  
                                   4446 ; disable/enanble ADC 
                                   4447 ;-------------------------------
      0019A3                       4448 power_adc:
      0096BB 03 01 CC         [ 4] 4449 	call arg_list 
      0096BE 96 79            [ 1] 4450 	cp a,#2	
      0096C0 27 03            [ 1] 4451 	jreq 1$
      0096C0 A1 0E 26         [ 2] 4452 	jp syntax_error 
      0096C3 13 CD 88         [ 2] 4453 1$: ldw x,#2
      0096C6 7A A1 03 27      [ 5] 4454 	ldw x,([dstkptr],x) ; on|off
      0096CA 03               [ 2] 4455 	tnzw x 
      0096CB CC 87            [ 1] 4456 	jreq 2$ 
      0096CD 94 CE 00 19      [ 5] 4457 	ldw x,[dstkptr] ; channel
      0096CE 9F               [ 1] 4458 	ld a,xl
      0096CE 9F A4            [ 1] 4459 	and a,#7
      0096D0 0F               [ 1] 4460 	swap a 
      0096D1 C7 00 26         [ 1] 4461 	ld ADC_CR1,a
      0096D4 CC 96 77 02      [ 1] 4462 	bset ADC_CR2,#ADC_CR2_ALIGN ; right 
      0096D7 72 10 54 01      [ 1] 4463 	bset ADC_CR1,#ADC_CR1_ADON 
      0019CA                       4464 	_usec_dly 7 
      0096D7 CD 90 0E         [ 2]    1     ldw x,#(16*7-2)/4
      0096DA 5A               [ 2]    2     decw x
      0096DA 0D               [ 1]    3     nop 
      0096DB 01 26            [ 1]    4     jrne .-4
      0096DD 05 A6            [ 2] 4465 	jra 3$
      0096DF 0D CD 82 1E      [ 1] 4466 2$: bres ADC_CR1,#ADC_CR1_ADON 
      0096E3 5B 01 81         [ 2] 4467 3$:	ldw x,#2
      0096E6 CD 10 06         [ 4] 4468 	call ddrop_n 
      0096E6 CE               [ 4] 4469 	ret
                                   4470 
                                   4471 ;-----------------------------
                                   4472 ; BASIC: RDADC(channel)
                                   4473 ; read adc channel 
                                   4474 ; output:
                                   4475 ;   A 		TK_INTGR 
                                   4476 ;   X 		value 
                                   4477 ;-----------------------------
      0019DE                       4478 read_adc:
      0096E7 00 04            [ 1] 4479 	ld a,#TK_LPAREN 
      0096E9 1F 03 CE         [ 4] 4480 	call expect 
      0096EC 00 06 1F         [ 4] 4481 	call next_token 
      0096EF 05 C6            [ 1] 4482 	cp a,#TK_INTGR 
      0096F1 00 02            [ 1] 4483 	jreq 1$
      0096F3 6B 07 C6         [ 2] 4484 	jp syntax_error
      0096F6 00               [ 2] 4485 1$: pushw x 
      0096F7 03 6B            [ 1] 4486 	ld a,#TK_RPAREN 
      0096F9 08 81 B5         [ 4] 4487 	call expect 
      0096FB 85               [ 2] 4488 	popw x 
      0096FB 1E 03 CF         [ 2] 4489 	cpw x,#16 
      0096FE 00 04            [ 1] 4490 	jrult 2$
      009700 1E 05            [ 1] 4491 	ld a,#ERR_BAD_VALUE
      009702 CF 00 06         [ 2] 4492 	jp tb_error 
      009705 7B               [ 1] 4493 2$: ld a,xl
      009706 07 C7 00         [ 1] 4494 	ld ADC_CSR,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009709 02 7B 08 C7      [ 1] 4495 	bset ADC_CR1,#ADC_CR1_ADON
      00970D 00 03 81 00 FB   [ 2] 4496 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009710 CE 54 04         [ 2] 4497 	ldw x,ADC_DRH 
      009710 72 00            [ 1] 4498 	ld a,#TK_INTGR
      009712 00               [ 4] 4499 	ret 
                                   4500 
                                   4501 
                                   4502 ;-----------------------
                                   4503 ; BASIC: BREAK 
                                   4504 ; insert a breakpoint 
                                   4505 ; in pogram. 
                                   4506 ; the program is resumed
                                   4507 ; with RUN 
                                   4508 ;-------------------------
      001A11                       4509 break:
      009713 25 05 A6 06 CC   [ 2] 4510 	btjt flags,#FRUN,2$
      009718 87               [ 1] 4511 	clr a
      009719 96               [ 4] 4512 	ret 
      001A18                       4513 2$:	 
                                   4514 ; create space on cstack to save context 
      00971A 52 07 42         [ 2] 4515 	ldw x,#break_point 
      00971C CD 01 B0         [ 4] 4516 	call puts 
      001A1E                       4517 	_drop 2 ;drop return address 
      00971C 0F 06            [ 2]    1     addw sp,#2 
      001A20                       4518 	_vars CTXT_SIZE ; context size 
      00971E CD 88            [ 2]    1     sub sp,#CTXT_SIZE 
      009720 7A A1 00         [ 4] 4519 	call save_context 
      009723 27 5C A1         [ 2] 4520 	ldw x,#tib 
      009726 0A 26 08         [ 2] 4521 	ldw basicptr,x
      009729 CD               [ 1] 4522 	clr (x)
      00972A 82 30 03 06      [ 1] 4523 	clr count  
      00972E CD               [ 1] 4524 	clrw x 
      00972F 88 7A A1         [ 2] 4525 	ldw lineno,x 
      009732 04 27 03         [ 2] 4526 	ldw in.w,x
      009735 CC 87 94 CD      [ 1] 4527 	bres flags,#FRUN 
      009739 90 15 0D 06      [ 1] 4528 	bset flags,#FBREAK
      00973D 26 0F A6         [ 2] 4529 	jp interp_loop 
      009740 3A C7 17 19 72 5F 17  4530 break_point: .asciz "\nbreak point, RUN to resume.\n"
             1A AE 17 18 CD 82 30
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
      00974E                       4538 new: 
      00974E CD 96 E6 AE 16   [ 2] 4539 	btjf flags,#FRUN,0$ 
      009753 C8               [ 1] 4540 	clr a 
      009754 CF               [ 4] 4541 	ret 
      001A67                       4542 0$:	
      009755 00 04 72         [ 4] 4543 	call clear_basic 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009758 5F               [ 4] 4544 	ret 
                                   4545 	 
                                   4546 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4547 ;   file system routines
                                   4548 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4549 
                                   4550 ;--------------------
                                   4551 ; input:
                                   4552 ;   X     increment 
                                   4553 ; output:
                                   4554 ;   farptr  incremented 
                                   4555 ;---------------------
      001A6B                       4556 incr_farptr:
      009759 00 03 CD 8B      [ 2] 4557 	addw x,farptr+1 
      00975D 07 72            [ 1] 4558 	jrnc 1$
      00975F 5F 00 02 CD      [ 1] 4559 	inc farptr 
      009763 93 80 A1         [ 2] 4560 1$:	ldw farptr+1,x  
      009766 03               [ 4] 4561 	ret 
                                   4562 
                                   4563 ;------------------------------
                                   4564 ; extended flash memory used as FLASH_DRIVE 
                                   4565 ; seek end of used flash drive   
                                   4566 ; starting at 0x10000 address.
                                   4567 ; 4 consecutives 0 bytes signal free space. 
                                   4568 ; input:
                                   4569 ;	none
                                   4570 ; output:
                                   4571 ;   ffree     free_addr| 0 if memory full.
                                   4572 ;------------------------------
      001A79                       4573 seek_fdrive:
                                   4574 ; start scan at 0x10000 address 
      009767 27 03            [ 1] 4575 	ld a,#1
      009769 CC 87 94         [ 1] 4576 	ld farptr,a 
      00976C CD               [ 1] 4577 	clrw x 
      00976D 90 15 CD         [ 2] 4578 	ldw farptr+1,x 
      001A82                       4579 1$:
      009770 90 7C CD         [ 2] 4580 	ldw x,#3  
      009773 96 FB CD 88      [ 5] 4581 2$:	ldf a,([farptr],x) 
      009777 7A A1            [ 1] 4582 	jrne 3$
      009779 0D               [ 2] 4583 	decw x
      00977A 26 02            [ 1] 4584 	jrpl 2$
      00977C 20 9E            [ 2] 4585 	jra 4$ 
      00977E CD               [ 1] 4586 3$:	incw x 
      00977F 90 0E 6B         [ 4] 4587 	call incr_farptr
      009781 AE 02 7F         [ 2] 4588 	ldw x,#0x27f 
      009781 5B 07 81         [ 2] 4589 	cpw x,farptr
      009784 2A E6            [ 1] 4590 	jrpl 1$
                                   4591 ; drive full 
      009784 55 00 02 00      [ 1] 4592 	clr ffree 
      009788 03 81 00 17      [ 1] 4593 	clr ffree+1 
      00978A 72 5F 00 18      [ 1] 4594 	clr ffree+2 
      00978A 52               [ 4] 4595 	ret
      001AA9                       4596 4$: ; copy farptr to ffree	 
      00978B 04 0F 01         [ 2] 4597 	ldw x,farptr 
      00978E CD 92 42         [ 1] 4598 	ld a,farptr+2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009791 A1 02 24         [ 2] 4599 	ldw ffree,x 
      009794 03 CC 87         [ 1] 4600 	ld ffree+2,a  
      009797 94               [ 4] 4601 	ret 
                                   4602 
                                   4603 ;-----------------------
                                   4604 ; compare file name 
                                   4605 ; with name pointed by Y  
                                   4606 ; input:
                                   4607 ;   farptr   file name 
                                   4608 ;   Y        target name 
                                   4609 ; output:
                                   4610 ;   farptr 	 at file_name
                                   4611 ;   X 		 farptr[x] point at size field  
                                   4612 ;   Carry    0|1 no match|match  
                                   4613 ;----------------------
      001AB6                       4614 cmp_name:
      009798 A1               [ 1] 4615 	clrw x
      009799 03 25 06 CD      [ 5] 4616 1$:	ldf a,([farptr],x)
      00979D 90 22            [ 1] 4617 	cp a,(y)
      00979F 9F 6B            [ 1] 4618 	jrne 4$
      0097A1 01               [ 1] 4619 	tnz a 
      0097A2 CD 90            [ 1] 4620 	jreq 9$ 
      0097A4 22               [ 1] 4621     incw x 
      0097A5 9F 6B            [ 1] 4622 	incw y 
      0097A7 02 CD            [ 2] 4623 	jra 1$
      001AC7                       4624 4$: ;no match 
      0097A9 90               [ 1] 4625 	tnz a 
      0097AA 22 F6            [ 1] 4626 	jreq 5$
      0097AC 14               [ 1] 4627 	incw x 
      0097AD 02 18 01 27      [ 5] 4628 	ldf a,([farptr],x)
      0097B1 F9 5B            [ 2] 4629 	jra 4$  
      0097B3 04               [ 1] 4630 5$:	incw x ; farptr[x] point at 'size' field 
      0097B4 81               [ 1] 4631 	rcf 
      0097B5 81               [ 4] 4632 	ret
      001AD4                       4633 9$: ; match  
      0097B5 CD               [ 1] 4634 	incw x  ; farptr[x] at 'size' field 
      0097B6 92               [ 1] 4635 	scf 
      0097B7 42               [ 4] 4636 	ret 
                                   4637 
                                   4638 ;-----------------------
                                   4639 ; search file in 
                                   4640 ; flash memory 
                                   4641 ; input:
                                   4642 ;   Y       file name  
                                   4643 ; output:
                                   4644 ;   farptr  addr at name|0
                                   4645 ;-----------------------
                           000001  4646 	FSIZE=1
                           000003  4647 	YSAVE=3
                           000004  4648 	VSIZE=4 
      001AD7                       4649 search_file: 
      001AD7                       4650 	_vars VSIZE
      0097B8 A1 02            [ 2]    1     sub sp,#VSIZE 
      0097BA 27 03            [ 2] 4651 	ldw (YSAVE,sp),y  
      0097BC CC               [ 1] 4652 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0097BD 87 94 14         [ 2] 4653 	ldw farptr+1,x 
      0097BF 35 01 00 13      [ 1] 4654 	mov farptr,#1
      001AE3                       4655 1$:	
                                   4656 ; check if farptr is after any file 
                                   4657 ; if  0 then so.
      0097BF CD 90 22 9F      [ 5] 4658 	ldf a,[farptr]
      0097C3 CD 90            [ 1] 4659 	jreq 6$
      0097C5 22               [ 1] 4660 2$: clrw x 	
      0097C6 FA F7            [ 2] 4661 	ldw y,(YSAVE,sp) 
      0097C8 81 1A B6         [ 4] 4662 	call cmp_name
      0097C9 25 2D            [ 1] 4663 	jrc 9$
      0097C9 CD 92 42 A1      [ 5] 4664 	ldf a,([farptr],x)
      0097CD 02 27            [ 1] 4665 	ld (FSIZE,sp),a 
      0097CF 03               [ 1] 4666 	incw x 
      0097D0 CC 87 94 13      [ 5] 4667 	ldf a,([farptr],x)
      0097D3 6B 02            [ 1] 4668 	ld (FSIZE+1,sp),a 
      0097D3 CD               [ 1] 4669 	incw x 
      0097D4 90 22 9F         [ 2] 4670 	addw x,(FSIZE,sp) ; count to skip 
      0097D7 43               [ 1] 4671 	incw x ; skip over EOF marker 
      0097D8 CD 90 22         [ 4] 4672 	call incr_farptr ; now at next file 'name_field'
      0097DB F4 F7 81         [ 2] 4673 	ldw x,#0x280
      0097DE C3 00 13         [ 2] 4674 	cpw x,farptr 
      0097DE CD 92            [ 1] 4675 	jrpl 1$
      001B0E                       4676 6$: ; file not found 
      0097E0 42 A1 02 27      [ 1] 4677 	clr farptr
      0097E4 03 CC 87 94      [ 1] 4678 	clr farptr+1 
      0097E8 CD 90 22 9F      [ 1] 4679 	clr farptr+2 
      001B1A                       4680 	_drop VSIZE 
      0097EC CD 90            [ 2]    1     addw sp,#VSIZE 
      0097EE 22               [ 1] 4681 	rcf
      0097EF F8               [ 4] 4682 	ret
      001B1E                       4683 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001B1E                       4684 	_drop VSIZE 
      0097F0 F7 81            [ 2]    1     addw sp,#VSIZE 
      0097F2 99               [ 1] 4685 	scf 	
      0097F2 CD               [ 4] 4686 	ret
                                   4687 
                                   4688 ;--------------------------------
                                   4689 ; BASIC: SAVE "name" 
                                   4690 ; save text program in 
                                   4691 ; flash memory used as 
                                   4692 ;--------------------------------
                           000001  4693 	BSIZE=1
                           000003  4694 	NAMEPTR=3
                           000004  4695 	VSIZE=4
      001B22                       4696 save:
      0097F3 92 42 A1 02 27   [ 2] 4697 	btjf flags,#FRUN,0$ 
      0097F8 03 CC            [ 1] 4698 	ld a,#ERR_CMD_ONLY 
      0097FA 87 94 16         [ 2] 4699 	jp tb_error
      0097FC                       4700 0$:	 
      0097FC CD 90 22         [ 2] 4701 	ldw x,txtend 
      0097FF 9F CD 90 22      [ 2] 4702 	subw x,txtbgn
      009803 F7 81            [ 1] 4703 	jrne 1$
                                   4704 ; nothing to save 
      009805 81               [ 4] 4705 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      001B36                       4706 1$:	
      001B36                       4707 	_vars VSIZE 
      009805 A6 0B            [ 2]    1     sub sp,#VSIZE 
      009807 CD 92            [ 2] 4708 	ldw (BSIZE,sp),x 
      009809 35 CD 92         [ 4] 4709 	call next_token	
      00980C 42 A1            [ 1] 4710 	cp a,#TK_QSTR
      00980E 01 27            [ 1] 4711 	jreq 2$
      009810 03 CC 87         [ 2] 4712 	jp syntax_error
      001B44                       4713 2$: 
      009813 94 A6 0C CD      [ 2] 4714 	ldw y,basicptr 
      009817 92 35 CD 90      [ 2] 4715 	addw y,in.w
      00981B 22 F6            [ 2] 4716 	ldw (NAMEPTR,sp),y  
      00981D 5F 97 A6 03 81   [ 1] 4717 	mov in,count 
                                   4718 ; check if enough free space 
      009822 93               [ 1] 4719 	ldw x,y 
      009822 CD 93 80         [ 4] 4720 	call strlen 
      009825 A1 03 27         [ 2] 4721 	addw x,#3 
      009828 03 CC 87         [ 2] 4722 	addw x,(BSIZE,sp)
      00982B 94 4F 5D 26      [ 1] 4723 	tnz ffree 
      00982F 05 55            [ 1] 4724 	jrne 21$
      009831 00 03 00 02      [ 2] 4725 	subw x,ffree+1 
      009835 81 05            [ 2] 4726 	jrule 21$
      009836 A6 01            [ 1] 4727 	ld a,#ERR_MEM_FULL 
      009836 A6 04 CD         [ 2] 4728 	jp tb_error
      001B6E                       4729 21$: 
                                   4730 ; check for existing file of that name 
      009839 92 35            [ 2] 4731 	ldw y,(NAMEPTR,sp)	
      00983B CD 90 15         [ 4] 4732 	call search_file 
      00983E CD 94            [ 1] 4733 	jrnc 3$ 
      009840 13 72            [ 1] 4734 	ld a,#ERR_DUPLICATE 
      009842 14 00 25         [ 2] 4735 	jp tb_error 
      001B7A                       4736 3$:	;** write file name to flash **
      009845 85 52 04         [ 2] 4737 	ldw x,ffree 
      009848 89 5F 1F         [ 1] 4738 	ld a,ffree+2 
      00984B 05 1F 03         [ 2] 4739 	ldw farptr,x 
      00984E CD 88 7A         [ 1] 4740 	ld farptr+2,a 
      009851 A1 06            [ 2] 4741 	ldw x,(NAMEPTR,sp)  
      009853 27 03 CC         [ 4] 4742 	call strlen 
      009856 87               [ 1] 4743 	incw  x
      009857 94 01            [ 2] 4744 	ldw (BSIZE,sp),x  
      009858 5F               [ 1] 4745 	clrw x   
      009858 A3 98            [ 2] 4746 	ldw y,(NAMEPTR,sp)
      00985A 60 27 03         [ 4] 4747 	call write_block  
                                   4748 ;** write file length after name **
      00985D CC 87 94         [ 2] 4749 	ldw x,txtend 
      009860 72 B0 00 1B      [ 2] 4750 	subw x,txtbgn
      009860 72 04            [ 2] 4751 	ldw (BSIZE,sp),x 
      009862 00               [ 1] 4752 	clrw x 
      009863 25 03            [ 1] 4753 	ld a,(1,sp)
      009865 CC 87 94         [ 4] 4754 	call write_byte 
      009868 CD               [ 1] 4755 	incw x 
      009869 93 80            [ 1] 4756 	ld a,(2,sp)
      00986B A1 03 27         [ 4] 4757 	call write_byte
      00986E 03               [ 1] 4758 	incw x  
      00986F CC 87 94         [ 4] 4759 	call incr_farptr ; move farptr after SIZE field 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4760 ;** write BASIC text **
                                   4761 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009872 1E 01            [ 2] 4762 	ldw x,(BSIZE,sp)
      009872 CD               [ 2] 4763 	pushw x ; write_block argument 
      009873 90               [ 1] 4764 	clrw x 
      009874 15 CE 00 01      [ 2] 4765 	ldw y,txtbgn  ; BASIC text to save 
      009878 CD 88 7A         [ 4] 4766 	call write_block 
      001BB8                       4767 	_drop 2 ;  drop write_block argument  
      00987B A1 00            [ 2]    1     addw sp,#2 
                                   4768 ; write en end of file marker 
      00987D 27 0C A1         [ 2] 4769 	ldw x,#1
      009880 06 26            [ 1] 4770 	ld a,#EOF  
      009882 05 A3 98         [ 4] 4771 	call write_byte 
      009885 90 27 08         [ 4] 4772 	call incr_farptr
                                   4773 ; save farptr in ffree
      009888 CE 00 13         [ 2] 4774 	ldw x,farptr 
      009888 CD 90 0E         [ 1] 4775 	ld a,farptr+2 
      00988B CF 00 16         [ 2] 4776 	ldw ffree,x 
      00988B AE 00 01         [ 1] 4777 	ld ffree+2,a
                                   4778 ;write 4 zero bytes as an end of all files marker 
      00988E 20               [ 1] 4779     clrw x 
      00988F 12 04            [ 1] 4780 	push #4 
      009890                       4781 4$:
      009890 72               [ 1] 4782 	clr a 
      009891 04 00 25         [ 4] 4783 	call write_byte 
      009894 03               [ 1] 4784 	incw x 
      009895 CC 87            [ 1] 4785 	dec (1,sp)
      009897 94 CD            [ 1] 4786 	jrne 4$
      009899 93               [ 1] 4787 5$: pop a 
                                   4788 ; display saved size  
      00989A 80 A1            [ 2] 4789 	ldw x,(BSIZE,sp) 
      00989C 03 27 03         [ 4] 4790 	call print_int 
      001BE3                       4791 	_drop VSIZE 
      00989F CC 87            [ 2]    1     addw sp,#VSIZE 
      0098A1 94               [ 4] 4792 	ret 
                                   4793 
                                   4794 
                                   4795 ;------------------------
                                   4796 ; BASIC: LOAD "file" 
                                   4797 ; load file to RAM 
                                   4798 ; for execution 
                                   4799 ;------------------------
      0098A2                       4800 load:
      0098A2 CD 90 15 CE 00   [ 2] 4801 	btjf flags,#FRUN,0$ 
      0098A7 04 1F            [ 1] 4802 	jreq 0$ 
      0098A9 05 CE            [ 1] 4803 	ld a,#ERR_CMD_ONLY 
      0098AB 00 01 1F         [ 2] 4804 	jp tb_error 
      001BF2                       4805 0$:	
      0098AE 03 72 15         [ 4] 4806 	call next_token 
      0098B1 00 25            [ 1] 4807 	cp a,#TK_QSTR
      0098B3 72 5C            [ 1] 4808 	jreq 1$
      0098B5 00 20 81         [ 2] 4809 	jp syntax_error 
      0098B8                       4810 1$:	
      0098B8 72 5D 00 20      [ 2] 4811 	ldw y,basicptr
      0098BC 26 03 CC 87      [ 2] 4812 	addw y,in.w 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098C0 94 00 02 00 01   [ 1] 4813 	mov in,count 
      0098C1 CD 1A D7         [ 4] 4814 	call search_file 
      0098C1 A6 04            [ 1] 4815 	jrc 2$ 
      0098C3 CD 92            [ 1] 4816 	ld a,#ERR_NOT_FILE
      0098C5 35 90 93         [ 2] 4817 	jp tb_error  
      001C13                       4818 2$:	
      0098C8 AE 00 04         [ 4] 4819 	call incr_farptr  
      0098CB 72 D3 00         [ 4] 4820 	call clear_basic  
      0098CE 1A               [ 1] 4821 	clrw x
      0098CF 27 03 CC 87      [ 5] 4822 	ldf a,([farptr],x)
      0098D3 94 95            [ 1] 4823 	ld yh,a 
      0098D4 5C               [ 1] 4824 	incw x  
      0098D4 93 FE CF 00      [ 5] 4825 	ldf a,([farptr],x)
      0098D8 0A               [ 1] 4826 	incw x 
      0098D9 72 CE            [ 1] 4827 	ld yl,a 
      0098DB 00 1A 72 BB      [ 2] 4828 	addw y,txtbgn
      0098DF 00 0A 90 FF      [ 2] 4829 	ldw txtend,y
      0098E3 90 93 72 CE      [ 2] 4830 	ldw y,txtbgn
      001C34                       4831 3$:	; load BASIC text 	
      0098E7 00 1A 5D 2A      [ 5] 4832 	ldf a,([farptr],x)
      0098EB 0B AE            [ 1] 4833 	ld (y),a 
      0098ED 00               [ 1] 4834 	incw x 
      0098EE 02 72            [ 1] 4835 	incw y 
      0098F0 D3 00 1A 2F      [ 2] 4836 	cpw y,txtend 
      0098F4 24 20            [ 1] 4837 	jrmi 3$
                                   4838 ; print loaded size 	 
      0098F6 09 00 1D         [ 2] 4839 	ldw x,txtend 
      0098F7 72 B0 00 1B      [ 2] 4840 	subw x,txtbgn
      0098F7 AE 00 02         [ 4] 4841 	call print_int 
      0098FA 72               [ 4] 4842 	ret 
                                   4843 
                                   4844 ;-----------------------------------
                                   4845 ; BASIC: FORGET ["file_name"] 
                                   4846 ; erase file_name and all others 
                                   4847 ; after it. 
                                   4848 ; without argument erase all files 
                                   4849 ;-----------------------------------
      001C4E                       4850 forget:
      0098FB D3 00 1A         [ 4] 4851 	call next_token 
      0098FE 2C 19            [ 1] 4852 	cp a,#TK_NONE 
      009900 27 26            [ 1] 4853 	jreq 3$ 
      009900 1E 05            [ 1] 4854 	cp a,#TK_QSTR
      009902 CF 00            [ 1] 4855 	jreq 1$
      009904 04 72 01         [ 2] 4856 	jp syntax_error
      009907 00 25 09 E6      [ 2] 4857 1$: ldw y,basicptr
      00990B 02 C7 00 03      [ 2] 4858 	addw y,in.w
      00990F FE CF 00 06 1E   [ 1] 4859 	mov in,count 
      009914 03 CF 00         [ 4] 4860 	call search_file
      009917 01 81            [ 1] 4861 	jrc 2$
      009919 A6 09            [ 1] 4862 	ld a,#ERR_NOT_FILE 
      009919 CE 00 1A         [ 2] 4863 	jp tb_error 
      001C73                       4864 2$: 
      00991C 1C 00 06         [ 2] 4865 	ldw x,farptr
      00991F CF 00 1A         [ 1] 4866 	ld a,farptr+2
      009922 85 5B            [ 2] 4867 	jra 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      001C7B                       4868 3$: ; forget all files 
      009924 04 89 72         [ 2] 4869 	ldw x,#100
      009927 5A               [ 1] 4870 	clr a 
      009928 00 20 81         [ 2] 4871 	ldw farptr,x 
      00992B C7 00 15         [ 1] 4872 	ld farptr+2,a 
      001C85                       4873 4$:
      00992B 72 00 00         [ 2] 4874 	ldw ffree,x 
      00992E 25 06 A6         [ 1] 4875 	ld ffree+2,a 
      009931 06 CC            [ 1] 4876 	push #4
      009933 87               [ 1] 4877 	clrw x 
      001C8E                       4878 5$: 
      009934 96               [ 1] 4879 	clr a  
      009935 81 20 23         [ 4] 4880 	call write_byte 
      009938 5C               [ 1] 4881 	incw x 
      009938 72 00            [ 1] 4882 	dec (1,sp)
      00993A 00 25            [ 1] 4883 	jrne 5$	
      00993C 06               [ 1] 4884 6$: pop a 
      00993D A6               [ 4] 4885 	ret 
                                   4886 
                                   4887 ;----------------------
                                   4888 ; BASIC: DIR 
                                   4889 ; list saved files 
                                   4890 ;----------------------
                           000001  4891 	COUNT=1 ; files counter 
                           000002  4892 	VSIZE=2 
      001C99                       4893 directory:
      001C99                       4894 	_vars VSIZE 
      00993E 06 CC            [ 2]    1     sub sp,#VSIZE 
      009940 87               [ 1] 4895 	clrw x 
      009941 96 81            [ 2] 4896 	ldw (COUNT,sp),x 
      009943 85 52 02         [ 2] 4897 	ldw farptr+1,x 
      009946 89 CE 00 04      [ 1] 4898 	mov farptr,#1 
      001CA5                       4899 dir_loop:
      00994A E6               [ 1] 4900 	clrw x 
      00994B 02 AB 03 C7      [ 5] 4901 	ldf a,([farptr],x)
      00994F 00 0B            [ 1] 4902 	jreq 8$ 
      001CAC                       4903 1$: ;name loop 	
      009951 72 5F 00 0A      [ 5] 4904 	ldf a,([farptr],x)
      009955 72 BB            [ 1] 4905 	jreq 2$ 
      009957 00 0A 1F         [ 4] 4906 	call putc 
      00995A 03               [ 1] 4907 	incw x 
      00995B 20 F4            [ 2] 4908 	jra 1$
      00995B CD               [ 1] 4909 2$: incw x ; skip ending 0. 
      00995C 93 80            [ 1] 4910 	ld a,#SPACE 
      00995E A1 03 27         [ 4] 4911 	call putc 
                                   4912 ; get file size 	
      009961 03 CC 87 94      [ 5] 4913 	ldf a,([farptr],x)
      009965 90 95            [ 1] 4914 	ld yh,a 
      009965 CD               [ 1] 4915 	incw x 
      009966 83 60 5D 26      [ 5] 4916 	ldf a,([farptr],x)
      00996A 05               [ 1] 4917 	incw x 
      00996B A6 05            [ 1] 4918 	ld yl,a 
      00996D CC 87            [ 2] 4919 	pushw y 
      00996F 96 FB 01         [ 2] 4920 	addw x,(1,sp)
      009970 5C               [ 1] 4921 	incw x ; skip EOF marker 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4922 ; skip to next file 
      009970 CF 00 04         [ 4] 4923 	call incr_farptr 
                                   4924 ; print file size 
      009973 E6               [ 2] 4925 	popw x ; file size 
      009974 02 C7 00         [ 4] 4926 	call print_int 
      009977 03 FE            [ 1] 4927 	ld a,#CR 
      009979 CF 00 06         [ 4] 4928 	call putc
      00997C 35 03            [ 2] 4929 	ldw x,(COUNT,sp)
      00997E 00               [ 1] 4930 	incw x
      00997F 02 81            [ 2] 4931 	ldw (COUNT,sp),x  
      009981 20 C0            [ 2] 4932 	jra dir_loop 
      001CE5                       4933 8$: ; print number of files 
      009981 72 00            [ 2] 4934 	ldw x,(COUNT,sp)
      009983 00 25 05         [ 4] 4935 	call print_int 
      009986 A6 06 CC         [ 2] 4936 	ldw x,#file_count 
      009989 87 96 B0         [ 4] 4937 	call puts  
                                   4938 ; print drive free space 	
      00998B A6 FF            [ 1] 4939 	ld a,#0xff 
      00998B 1E 03 CF         [ 1] 4940 	sub a,ffree+2 
      00998E 00 04 E6         [ 1] 4941 	ld acc8,a 
      009991 02 AB            [ 1] 4942 	ld a,#0x7f 
      009993 03 C7 00         [ 1] 4943 	sbc a,ffree+1 
      009996 03 35 03         [ 1] 4944 	ld acc16,a 
      009999 00 02            [ 1] 4945 	ld a,#2 
      00999B FE CF 00         [ 1] 4946 	sbc a,ffree 
      00999E 06 4F 85         [ 1] 4947 	ld acc24,a 
      0099A1 5B               [ 1] 4948 	clrw x  
      0099A2 02 89            [ 1] 4949 	ld a,#6 
      0099A4 81               [ 1] 4950 	ld xl,a 
      0099A5 A6 0A            [ 1] 4951 	ld a,#10 
      0099A5 72 01 00         [ 4] 4952 	call prti24 
      0099A8 25 02 4F         [ 2] 4953 	ldw x,#drive_free
      0099AB 81 01 B0         [ 4] 4954 	call puts 
      0099AC                       4955 	_drop VSIZE 
      0099AC 72 09            [ 2]    1     addw sp,#VSIZE 
      0099AE 00               [ 4] 4956 	ret
      0099AF 25 12 5B 02 CD 96 FB  4957 file_count: .asciz " files\n"
             5B
      0099B7 06 72 19 00 25 72 10  4958 drive_free: .asciz " bytes free\n" 
             00 25 CC 88 4A CE
                                   4959 
                                   4960 ;---------------------
                                   4961 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   4962 ; write 1 or more byte to FLASH or EEPROM
                                   4963 ; starting at address  
                                   4964 ; input:
                                   4965 ;   expr1  	is address 
                                   4966 ;   expr2   is byte to write
                                   4967 ; output:
                                   4968 ;   none 
                                   4969 ;---------------------
                           000001  4970 	ADDR=1
                           000002  4971 	VSIZ=2 
      001D2F                       4972 write:
      001D2F                       4973 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0099C4 00 1C            [ 2]    1     sub sp,#VSIZE 
      0099C6 C3 00 1E 2B      [ 1] 4974 	clr farptr ; expect 16 bits address 
      0099CA 02 4F 81         [ 4] 4975 	call expression
      0099CD CD 93            [ 1] 4976 	cp a,#TK_INTGR 
      0099CF FB 5B            [ 1] 4977 	jreq 0$
      0099D1 02 CE 00         [ 2] 4978 	jp syntax_error
      0099D4 1C CF            [ 2] 4979 0$: ldw (ADDR,sp),x 
      0099D6 00 04 E6         [ 4] 4980 	call next_token 
      0099D9 02 C7            [ 1] 4981 	cp a,#TK_COMMA 
      0099DB 00 03            [ 1] 4982 	jreq 1$ 
      0099DD FE CF            [ 2] 4983 	jra 9$ 
      0099DF 00 06 35         [ 4] 4984 1$:	call expression
      0099E2 03 00            [ 1] 4985 	cp a,#TK_INTGR
      0099E4 02 72            [ 1] 4986 	jreq 2$
      0099E6 10 00 25         [ 2] 4987 	jp syntax_error
      0099E9 CC               [ 1] 4988 2$:	ld a,xl 
      0099EA 88 4A            [ 2] 4989 	ldw x,(ADDR,sp) 
      0099EC CF 00 14         [ 2] 4990 	ldw farptr+1,x 
      0099EC AE               [ 1] 4991 	clrw x 
      0099ED 17 FF 94         [ 4] 4992 	call write_byte
      0099F0 72 11            [ 2] 4993 	ldw x,(ADDR,sp)
      0099F2 00               [ 1] 4994 	incw x 
      0099F3 25 72            [ 2] 4995 	jra 0$ 
      001D63                       4996 9$:
      001D63                       4997 	_drop VSIZE
      0099F5 19 00            [ 2]    1     addw sp,#VSIZE 
      0099F7 25               [ 4] 4998 	ret 
                                   4999 
                                   5000 
                                   5001 ;---------------------
                                   5002 ;BASIC: CHAR(expr)
                                   5003 ; évaluate expression 
                                   5004 ; and take the 7 least 
                                   5005 ; bits as ASCII character
                                   5006 ;---------------------
      001D66                       5007 char:
      0099F8 CC 87            [ 1] 5008 	ld a,#TK_LPAREN 
      0099FA E6 11 B5         [ 4] 5009 	call expect 
      0099FB CD 13 00         [ 4] 5010 	call relation 
      0099FB CD 92            [ 1] 5011 	cp a,#TK_INTGR 
      0099FD 42 A1            [ 1] 5012 	jreq 1$
      0099FF 02 27 03         [ 2] 5013 	jp syntax_error
      009A02 CC               [ 2] 5014 1$:	pushw x 
      009A03 87 94            [ 1] 5015 	ld a,#TK_RPAREN 
      009A05 CE 00 1A         [ 4] 5016 	call expect
      009A08 EE               [ 2] 5017 	popw x  
      009A09 02               [ 1] 5018 	ld a,xl 
      009A0A 9F 4A            [ 1] 5019 	and a,#0x7f 
      009A0C 4E               [ 1] 5020 	ld xl,a
      009A0D 48 48            [ 1] 5021 	ld a,#TK_CHAR
      009A0F AB               [ 4] 5022 	ret
                                   5023 
                                   5024 ;---------------------
                                   5025 ; BASIC: ASC(string|char)
                                   5026 ; extract first character 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   5027 ; of string argument 
                                   5028 ; return it as TK_INTGR 
                                   5029 ;---------------------
      001D83                       5030 ascii:
      009A10 3E C7            [ 1] 5031 	ld a,#TK_LPAREN
      009A12 50 F3 CD         [ 4] 5032 	call expect 
      009A15 90 22 CD         [ 4] 5033 	call next_token 
      009A18 9E E6            [ 1] 5034 	cp a,#TK_QSTR 
      009A1A CD 90            [ 1] 5035 	jreq 1$
      009A1C 49 A6            [ 1] 5036 	cp a,#TK_CHAR 
      009A1E 1F C7            [ 1] 5037 	jreq 2$ 
      009A20 50 F3 81         [ 2] 5038 	jp syntax_error
      009A23                       5039 1$: 
      009A23 CD               [ 1] 5040 	ld a,(x)
      009A24 92 42            [ 2] 5041 	jra 3$
      001D99                       5042 2$: 
      009A26 A1               [ 1] 5043 	ld a,xl 
      009A27 02               [ 1] 5044 3$:	ld xl,a 
      009A28 27               [ 1] 5045 	clr a  
      009A29 03               [ 1] 5046 	ld xh,a 
      009A2A CC               [ 2] 5047 	pushw x  
      009A2B 87 94            [ 1] 5048 	ld a,#TK_RPAREN 
      009A2D AE 00 02         [ 4] 5049 	call expect 
      009A30 72               [ 2] 5050 	popw x 
      009A31 DE 00            [ 1] 5051 	ld a,#TK_INTGR 
      009A33 1A               [ 4] 5052 	ret 
                                   5053 
                                   5054 ;---------------------
                                   5055 ;BASIC: KEY
                                   5056 ; wait for a character 
                                   5057 ; received from STDIN 
                                   5058 ; input:
                                   5059 ;	none 
                                   5060 ; output:
                                   5061 ;	X 		ASCII character 
                                   5062 ;---------------------
      001DA7                       5063 key:
      009A34 5D 27 1C         [ 4] 5064 	call getc 
      009A37 72               [ 1] 5065 	clrw x 
      009A38 CE               [ 1] 5066 	ld xl,a 
      009A39 00 1A            [ 1] 5067 	ld a,#TK_INTGR
      009A3B 9F               [ 4] 5068 	ret
                                   5069 
                                   5070 ;----------------------
                                   5071 ; BASIC: QKEY
                                   5072 ; Return true if there 
                                   5073 ; is a character in 
                                   5074 ; waiting in STDIN 
                                   5075 ; input:
                                   5076 ;  none 
                                   5077 ; output:
                                   5078 ;   X 		0|1 
                                   5079 ;-----------------------
      001DAF                       5080 qkey: 
      009A3C A4               [ 1] 5081 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A3D 07 4E C7 54 01   [ 2] 5082 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      009A42 72               [ 1] 5083 	incw x 
      009A43 16 54            [ 1] 5084 9$: ld a,#TK_INTGR
      009A45 02               [ 4] 5085 	ret 
                                   5086 
                                   5087 ;---------------------
                                   5088 ; BASIC: GPIO(expr,reg)
                                   5089 ; return gpio address 
                                   5090 ; expr {0..8}
                                   5091 ; input:
                                   5092 ;   none 
                                   5093 ; output:
                                   5094 ;   X 		gpio register address
                                   5095 ;----------------------------
      001DB9                       5096 gpio:
      009A46 72 10            [ 1] 5097 	ld a,#TK_LPAREN 
      009A48 54 01 AE         [ 4] 5098 	call expect 
      009A4B 00 1B 5A         [ 4] 5099 	call arg_list
      009A4E 9D 26            [ 1] 5100 	cp a,#2
      009A50 FA 20            [ 1] 5101 	jreq 1$
      009A52 04 72 11         [ 2] 5102 	jp syntax_error  
      001DC8                       5103 1$:	
      009A55 54 01            [ 1] 5104 	ld a,#TK_RPAREN 
      009A57 AE 00 02         [ 4] 5105 	call expect 
      009A5A CD 90 86         [ 2] 5106 	ldw x,#2
      009A5D 81 DE 00 19      [ 5] 5107 	ldw x,([dstkptr],x) ; port 
      009A5E 2B 1B            [ 1] 5108 	jrmi bad_port
      009A5E A6 0B CD         [ 2] 5109 	cpw x,#9
      009A61 92 35            [ 1] 5110 	jrpl bad_port
      009A63 CD 88            [ 1] 5111 	ld a,#5
      009A65 7A               [ 4] 5112 	mul x,a
      009A66 A1 03 27         [ 2] 5113 	addw x,#GPIO_BASE 
      009A69 03               [ 2] 5114 	pushw x 
      009A6A CC 87 94         [ 4] 5115 	call dpop 
      009A6D 89 A6 0C         [ 2] 5116 	addw x,(1,sp)
      009A70 CD 92            [ 2] 5117 	ldw (1,sp),x  
      009A72 35 85 A3         [ 4] 5118 	call ddrop  
      009A75 00               [ 2] 5119 	popw x 
      009A76 10 25            [ 1] 5120 	ld a,#TK_INTGR
      009A78 05               [ 4] 5121 	ret
      001DF1                       5122 bad_port:
      009A79 A6 0A            [ 1] 5123 	ld a,#ERR_BAD_VALUE
      009A7B CC 87 96         [ 2] 5124 	jp tb_error
                                   5125 
                                   5126 ;----------------------
                                   5127 ; BASIC: ODR 
                                   5128 ; return offset of gpio
                                   5129 ; ODR register: 0
                                   5130 ; ---------------------
      001DF6                       5131 port_odr:
      009A7E 9F C7 54         [ 2] 5132 	ldw x,#GPIO_ODR
      009A81 00 72            [ 1] 5133 	ld a,#TK_INTGR
      009A83 10               [ 4] 5134 	ret
                                   5135 
                                   5136 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5137 ; BASIC: IDR 
                                   5138 ; return offset of gpio
                                   5139 ; IDR register: 1
                                   5140 ; ---------------------
      001DFC                       5141 port_idr:
      009A84 54 01 72         [ 2] 5142 	ldw x,#GPIO_IDR
      009A87 0F 54            [ 1] 5143 	ld a,#TK_INTGR
      009A89 00               [ 4] 5144 	ret
                                   5145 
                                   5146 ;----------------------
                                   5147 ; BASIC: DDR 
                                   5148 ; return offset of gpio
                                   5149 ; DDR register: 2
                                   5150 ; ---------------------
      001E02                       5151 port_ddr:
      009A8A FB CE 54         [ 2] 5152 	ldw x,#GPIO_DDR
      009A8D 04 A6            [ 1] 5153 	ld a,#TK_INTGR
      009A8F 03               [ 4] 5154 	ret
                                   5155 
                                   5156 ;----------------------
                                   5157 ; BASIC: CRL  
                                   5158 ; return offset of gpio
                                   5159 ; CR1 register: 3
                                   5160 ; ---------------------
      001E08                       5161 port_cr1:
      009A90 81 00 03         [ 2] 5162 	ldw x,#GPIO_CR1
      009A91 A6 03            [ 1] 5163 	ld a,#TK_INTGR
      009A91 72               [ 4] 5164 	ret
                                   5165 
                                   5166 ;----------------------
                                   5167 ; BASIC: CRH  
                                   5168 ; return offset of gpio
                                   5169 ; CR2 register: 4
                                   5170 ; ---------------------
      001E0E                       5171 port_cr2:
      009A92 00 00 25         [ 2] 5172 	ldw x,#GPIO_CR2
      009A95 02 4F            [ 1] 5173 	ld a,#TK_INTGR
      009A97 81               [ 4] 5174 	ret
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
      009A98                       5185 uflash:
      009A98 AE 9A C2         [ 2] 5186 	ldw x,#user_space 
      009A9B CD 82            [ 1] 5187 	ld a,#TK_INTGR 
      009A9D 30               [ 4] 5188 	ret 
                                   5189 
                                   5190 ;-------------------------
                                   5191 ; BASIC: EEPROM 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5192 ; return eeprom address
                                   5193 ; input:
                                   5194 ;  none 
                                   5195 ; output:
                                   5196 ;	A		TK_INTGR
                                   5197 ;   X 		eeprom address 
                                   5198 ;---------------------------
      001E1A                       5199 eeprom:
      009A9E 5B 02 52         [ 2] 5200 	ldw x,#EEPROM_BASE 
      009AA1 06 CD            [ 1] 5201 	ld a,#TK_INTGR 
      009AA3 96               [ 4] 5202 	ret 
                                   5203 
                                   5204 ;---------------------
                                   5205 ; BASIC: USR(addr[,arg])
                                   5206 ; execute a function written 
                                   5207 ; in binary code.
                                   5208 ; binary fonction should 
                                   5209 ; return token attribute in A 
                                   5210 ; and value in X. 
                                   5211 ; input:
                                   5212 ;   addr	routine address 
                                   5213 ;   arg 	is an optional argument 
                                   5214 ; output:
                                   5215 ;   A 		token attribute 
                                   5216 ;   X       returned value 
                                   5217 ;---------------------
      001E20                       5218 usr:
      009AA4 E6 AE            [ 2] 5219 	pushw y 	
      009AA6 16 C8            [ 1] 5220 	ld a,#TK_LPAREN 
      009AA8 CF 00 04         [ 4] 5221 	call expect 
      009AAB 7F 72 5F         [ 4] 5222 	call arg_list 
      009AAE 00 03            [ 1] 5223 	cp a,#1 
      009AB0 5F CF            [ 1] 5224 	jrpl 2$ 
      009AB2 00 06 CF         [ 2] 5225 	jp syntax_error 
      009AB5 00 01            [ 1] 5226 2$: ld a,#TK_RPAREN
      009AB7 72 11 00         [ 4] 5227 	call expect 
      009ABA 25 72 18         [ 4] 5228 	call dpop 
      009ABD 00 25            [ 1] 5229 	cp a,#2 
      009ABF CC 88            [ 1] 5230 	jrmi 4$
      009AC1 4A 0A            [ 1] 5231 	ldw y,x ; y=arg 
      009AC3 62 72 65         [ 4] 5232 	call dpop ;x=addr 
      009AC6 61               [ 1] 5233 4$:	exgw y,x ; y=addr,x=arg 
      009AC7 6B 20            [ 4] 5234 	call (y)
      009AC9 70 6F            [ 2] 5235 	popw y 
      009ACB 69               [ 4] 5236 	ret 
                                   5237 
                                   5238 ;------------------------------
                                   5239 ; BASIC: BYE 
                                   5240 ; halt mcu in its lowest power mode 
                                   5241 ; wait for reset or external interrupt
                                   5242 ; do a cold start on wakeup.
                                   5243 ;------------------------------
      001E48                       5244 bye:
      009ACC 6E 74 2C 20 52   [ 2] 5245 	btjf UART3_SR,#UART_SR_TC,.
      009AD1 55               [10] 5246 	halt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009AD2 4E 20 74         [ 2] 5247 	jp cold_start  
                                   5248 
                                   5249 ;----------------------------------
                                   5250 ; BASIC: SLEEP 
                                   5251 ; halt mcu until reset or external
                                   5252 ; interrupt.
                                   5253 ; Resume progam after SLEEP command
                                   5254 ;----------------------------------
      001E51                       5255 sleep:
      009AD5 6F 20 72 65 73   [ 2] 5256 	btjf UART3_SR,#UART_SR_TC,.
      009ADA 75 6D 65 2E      [ 1] 5257 	bset flags,#FSLEEP
      009ADE 0A               [10] 5258 	halt 
      009ADF 00               [ 4] 5259 	ret 
                                   5260 
                                   5261 ;-------------------------------
                                   5262 ; BASIC: PAUSE expr 
                                   5263 ; suspend execution for n msec.
                                   5264 ; input:
                                   5265 ;	none
                                   5266 ; output:
                                   5267 ;	none 
                                   5268 ;------------------------------
      009AE0                       5269 pause:
      009AE0 72 01 00         [ 4] 5270 	call expression
      009AE3 25 02            [ 1] 5271 	cp a,#TK_INTGR
      009AE5 4F 81            [ 1] 5272 	jreq pause02 
      009AE7 CC 07 14         [ 2] 5273 	jp syntax_error
      001E66                       5274 pause02: 
      009AE7 CD               [ 2] 5275 1$: tnzw x 
      009AE8 86 62            [ 1] 5276 	jreq 2$
      009AEA 81               [10] 5277 	wfi 
      009AEB 5A               [ 2] 5278 	decw x 
      009AEB 72 BB            [ 1] 5279 	jrne 1$
      009AED 00               [ 1] 5280 2$:	clr a 
      009AEE 15               [ 4] 5281 	ret 
                                   5282 
                                   5283 ;------------------------------
                                   5284 ; BASIC: TICKS
                                   5285 ; return msec ticks counter value 
                                   5286 ; input:
                                   5287 ; 	none 
                                   5288 ; output:
                                   5289 ;	X 		TK_INTGR
                                   5290 ;-------------------------------
      001E6F                       5291 get_ticks:
      009AEF 24 04 72         [ 2] 5292 	ldw x,ticks 
      009AF2 5C 00            [ 1] 5293 	ld a,#TK_INTGR
      009AF4 14               [ 4] 5294 	ret 
                                   5295 
                                   5296 
                                   5297 
                                   5298 ;------------------------------
                                   5299 ; BASIC: ABS(expr)
                                   5300 ; return absolute value of expr.
                                   5301 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   5302 ;   none
                                   5303 ; output:
                                   5304 ;   X     	positive integer
                                   5305 ;-------------------------------
      001E75                       5306 abs:
      009AF5 CF 00            [ 1] 5307 	ld a,#TK_LPAREN
      009AF7 15 81 B5         [ 4] 5308 	call expect 
      009AF9 CD 11 C2         [ 4] 5309 	call arg_list
      009AF9 A6 01            [ 1] 5310 	cp a,#1 
      009AFB C7 00            [ 1] 5311 	jreq 0$ 
      009AFD 14 5F CF         [ 2] 5312 	jp syntax_error
      001E84                       5313 0$:  
      009B00 00 15            [ 1] 5314 	ld a,#TK_RPAREN 
      009B02 CD 11 B5         [ 4] 5315 	call expect 
      009B02 AE 00 03         [ 4] 5316     call dpop   
      009B05 92               [ 1] 5317 	ld a,xh 
      009B06 AF 00            [ 1] 5318 	bcp a,#0x80 
      009B08 14 26            [ 1] 5319 	jreq 2$ 
      009B0A 05               [ 2] 5320 	negw x 
      009B0B 5A 2A            [ 1] 5321 2$: ld a,#TK_INTGR 
      009B0D F7               [ 4] 5322 	ret 
                                   5323 
                                   5324 ;------------------------------
                                   5325 ; BASIC: RND(expr)
                                   5326 ; return random number 
                                   5327 ; between 1 and expr inclusive
                                   5328 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5329 ; input:
                                   5330 ; 	none 
                                   5331 ; output:
                                   5332 ;	X 		random positive integer 
                                   5333 ;------------------------------
      001E95                       5334 random:
      009B0E 20 19            [ 1] 5335 	ld a,#TK_LPAREN 
      009B10 5C CD 9A         [ 4] 5336 	call expect 
      009B13 EB AE 02         [ 4] 5337 	call arg_list 
      009B16 7F C3            [ 1] 5338 	cp a,#1
      009B18 00 14            [ 1] 5339 	jreq 1$
      009B1A 2A E6 72         [ 2] 5340 	jp syntax_error
      009B1D 5F 00            [ 1] 5341 1$: ld a,#TK_RPAREN
      009B1F 17 72 5F         [ 4] 5342 	call expect 
      009B22 00 18 72         [ 4] 5343 	call dpop 
      009B25 5F               [ 2] 5344 	pushw x 
      009B26 00               [ 1] 5345 	ld a,xh 
      009B27 19 81            [ 1] 5346 	bcp a,#0x80 
      009B29 27 05            [ 1] 5347 	jreq 2$
      009B29 CE 00            [ 1] 5348 	ld a,#ERR_BAD_VALUE
      009B2B 14 C6 00         [ 2] 5349 	jp tb_error
      001EB7                       5350 2$: 
                                   5351 ; acc16=(x<<5)^x 
      009B2E 16 CF 00         [ 2] 5352 	ldw x,seedx 
      009B31 17               [ 2] 5353 	sllw x 
      009B32 C7               [ 2] 5354 	sllw x 
      009B33 00               [ 2] 5355 	sllw x 
      009B34 19               [ 2] 5356 	sllw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009B35 81               [ 2] 5357 	sllw x 
      009B36 9E               [ 1] 5358 	ld a,xh 
      009B36 5F 92 AF         [ 1] 5359 	xor a,seedx 
      009B39 00 14 90         [ 1] 5360 	ld acc16,a 
      009B3C F1               [ 1] 5361 	ld a,xl 
      009B3D 26 08 4D         [ 1] 5362 	xor a,seedx+1 
      009B40 27 12 5C         [ 1] 5363 	ld acc8,a 
                                   5364 ; seedx=seedy 
      009B43 90 5C 20         [ 2] 5365 	ldw x,seedy 
      009B46 F0 00 0D         [ 2] 5366 	ldw seedx,x  
                                   5367 ; seedy=seedy^(seedy>>1)
      009B47 90 54            [ 2] 5368 	srlw y 
      009B47 4D 27            [ 1] 5369 	ld a,yh 
      009B49 07 5C 92         [ 1] 5370 	xor a,seedy 
      009B4C AF 00 14         [ 1] 5371 	ld seedy,a  
      009B4F 20 F6            [ 1] 5372 	ld a,yl 
      009B51 5C 98 81         [ 1] 5373 	xor a,seedy+1 
      009B54 C7 00 10         [ 1] 5374 	ld seedy+1,a 
                                   5375 ; acc16>>3 
      009B54 5C 99 81         [ 2] 5376 	ldw x,acc16 
      009B57 54               [ 2] 5377 	srlw x 
      009B57 52               [ 2] 5378 	srlw x 
      009B58 04               [ 2] 5379 	srlw x 
                                   5380 ; x=acc16^x 
      009B59 17               [ 1] 5381 	ld a,xh 
      009B5A 03 5F CF         [ 1] 5382 	xor a,acc16 
      009B5D 00               [ 1] 5383 	ld xh,a 
      009B5E 15               [ 1] 5384 	ld a,xl 
      009B5F 35 01 00         [ 1] 5385 	xor a,acc8 
      009B62 14               [ 1] 5386 	ld xl,a 
                                   5387 ; seedy=x^seedy 
      009B63 C8 00 10         [ 1] 5388 	xor a,seedy+1
      009B63 92               [ 1] 5389 	ld xl,a 
      009B64 BC               [ 1] 5390 	ld a,xh 
      009B65 00 14 27         [ 1] 5391 	xor a,seedy
      009B68 25               [ 1] 5392 	ld xh,a 
      009B69 5F 16 03         [ 2] 5393 	ldw seedy,x 
                                   5394 ; return seedy modulo expr + 1 
      009B6C CD 9B            [ 2] 5395 	popw y 
      009B6E 36               [ 2] 5396 	divw x,y 
      009B6F 25               [ 1] 5397 	ldw x,y 
      009B70 2D               [ 1] 5398 	incw x 
      009B71 92 AF            [ 1] 5399 	ld a,#TK_INTGR
      009B73 00               [ 4] 5400 	ret 
                                   5401 
                                   5402 ;---------------------------------
                                   5403 ; BASIC: WORDS 
                                   5404 ; affiche la listes des mots du
                                   5405 ; dictionnaire.
                                   5406 ;---------------------------------
                           000001  5407 	WLEN=1
                           000002  5408 	LLEN=2  
                           000002  5409 	VSIZE=2 
      001F09                       5410 words:
      001F09                       5411 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009B74 14 6B            [ 2]    1     sub sp,#VSIZE 
      009B76 01 5C            [ 1] 5412 	clr (LLEN,sp)
      009B78 92 AF 00 14      [ 2] 5413 	ldw y,#kword_dict+2
      009B7C 6B               [ 1] 5414 0$:	ldw x,y
      009B7D 02               [ 1] 5415 	ld a,(x)
      009B7E 5C 72            [ 1] 5416 	and a,#15 
      009B80 FB 01            [ 1] 5417 	ld (WLEN,sp),a 
      009B82 5C               [ 1] 5418 1$:	incw x 
      009B83 CD               [ 1] 5419 	ld a,(x)
      009B84 9A EB AE         [ 4] 5420 	call putc 
      009B87 02 80            [ 1] 5421 	inc (LLEN,sp)
      009B89 C3 00            [ 1] 5422 	dec (WLEN,sp)
      009B8B 14 2A            [ 1] 5423 	jrne 1$
      009B8D D5 46            [ 1] 5424 	ld a,#70
      009B8E 11 02            [ 1] 5425 	cp a,(LLEN,sp)
      009B8E 72 5F            [ 1] 5426 	jrmi 2$   
      009B90 00 14            [ 1] 5427 	ld a,#SPACE 
      009B92 72 5F 00         [ 4] 5428 	call putc 
      009B95 15 72            [ 1] 5429 	inc (LLEN,sp) 
      009B97 5F 00            [ 2] 5430 	jra 3$
      009B99 16 5B            [ 1] 5431 2$: ld a,#CR 
      009B9B 04 98 81         [ 4] 5432 	call putc 
      009B9E 0F 02            [ 1] 5433 	clr (LLEN,sp)
      009B9E 5B 04 99 81      [ 2] 5434 3$:	subw y,#2 
      009BA2 90 FE            [ 2] 5435 	ldw y,(y)
      009BA2 72 01            [ 1] 5436 	jrne 0$  
      001F40                       5437 	_drop VSIZE 
      009BA4 00 25            [ 2]    1     addw sp,#VSIZE 
      009BA6 05               [ 4] 5438 	ret 
                                   5439 
                                   5440 
                                   5441 ;*********************************
                                   5442 
                                   5443 ;------------------------------
                                   5444 ;      dictionary 
                                   5445 ; format:
                                   5446 ;   link:   2 bytes 
                                   5447 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5448 ;   cmd_name: 16 byte max 
                                   5449 ;   code_address: 2 bytes 
                                   5450 ;------------------------------
                                   5451 	.macro _dict_entry len,name,cmd 
                                   5452 	.word LINK 
                                   5453 	LINK=.
                                   5454 name:
                                   5455 	.byte len 	
                                   5456 	.ascii "name"
                                   5457 	.word cmd 
                                   5458 	.endm 
                                   5459 
                           000000  5460 	LINK=0
      001F43                       5461 kword_end:
      001F43                       5462 	_dict_entry,3,BYE,bye 
      009BA7 A6 07                    1 	.word LINK 
                           001F45     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      001F45                          3 BYE:
      009BA9 CC                       4 	.byte 3 	
      009BAA 87 96 45                 5 	.ascii "BYE"
      009BAC 1E 48                    6 	.word bye 
      001F4B                       5463 	_dict_entry,5,WORDS,words 
      009BAC CE 00                    1 	.word LINK 
                           001F4D     2 	LINK=.
      001F4D                          3 WORDS:
      009BAE 1E                       4 	.byte 5 	
      009BAF 72 B0 00 1C 26           5 	.ascii "WORDS"
      009BB4 01 81                    6 	.word words 
      009BB6                       5464 	_dict_entry,5,SLEEP,sleep 
      009BB6 52 04                    1 	.word LINK 
                           001F57     2 	LINK=.
      001F57                          3 SLEEP:
      009BB8 1F                       4 	.byte 5 	
      009BB9 01 CD 88 7A A1           5 	.ascii "SLEEP"
      009BBE 0A 27                    6 	.word sleep 
      001F5F                       5465 	_dict_entry,6,FORGET,forget 
      009BC0 03 CC                    1 	.word LINK 
                           001F61     2 	LINK=.
      001F61                          3 FORGET:
      009BC2 87                       4 	.byte 6 	
      009BC3 94 4F 52 47 45 54        5 	.ascii "FORGET"
      009BC4 1C 4E                    6 	.word forget 
      001F6A                       5466 	_dict_entry,3,DIR,directory 
      009BC4 90 CE                    1 	.word LINK 
                           001F6C     2 	LINK=.
      001F6C                          3 DIR:
      009BC6 00                       4 	.byte 3 	
      009BC7 04 72 B9                 5 	.ascii "DIR"
      009BCA 00 01                    6 	.word directory 
      001F72                       5467 	_dict_entry,4,LOAD,load 
      009BCC 17 03                    1 	.word LINK 
                           001F74     2 	LINK=.
      001F74                          3 LOAD:
      009BCE 55                       4 	.byte 4 	
      009BCF 00 03 00 02              5 	.ascii "LOAD"
      009BD3 93 CD                    6 	.word load 
      001F7B                       5468 	_dict_entry,4,SAVE,save
      009BD5 82 F2                    1 	.word LINK 
                           001F7D     2 	LINK=.
      001F7D                          3 SAVE:
      009BD7 1C                       4 	.byte 4 	
      009BD8 00 03 72 FB              5 	.ascii "SAVE"
      009BDC 01 72                    6 	.word save 
      001F84                       5469 	_dict_entry,5,WRITE,write  
      009BDE 5D 00                    1 	.word LINK 
                           001F86     2 	LINK=.
      001F86                          3 WRITE:
      009BE0 17                       4 	.byte 5 	
      009BE1 26 0B 72 B0 00           5 	.ascii "WRITE"
      009BE6 18 23                    6 	.word write 
      001F8E                       5470 	_dict_entry,3,NEW,new
      009BE8 05 A6                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                           001F90     2 	LINK=.
      001F90                          3 NEW:
      009BEA 01                       4 	.byte 3 	
      009BEB CC 87 96                 5 	.ascii "NEW"
      009BEE 1A 60                    6 	.word new 
      001F96                       5471 	_dict_entry,5,BREAK,break 
      009BEE 16 03                    1 	.word LINK 
                           001F98     2 	LINK=.
      001F98                          3 BREAK:
      009BF0 CD                       4 	.byte 5 	
      009BF1 9B 57 24 05 A6           5 	.ascii "BREAK"
      009BF6 08 CC                    6 	.word break 
      001FA0                       5472 	_dict_entry,4,BEEP,beep 
      009BF8 87 96                    1 	.word LINK 
                           001FA2     2 	LINK=.
      009BFA                          3 BEEP:
      009BFA CE                       4 	.byte 4 	
      009BFB 00 17 C6 00              5 	.ascii "BEEP"
      009BFF 19 CF                    6 	.word beep 
      001FA9                       5473 	_dict_entry,4,STOP,stop 
      009C01 00 14                    1 	.word LINK 
                           001FAB     2 	LINK=.
      001FAB                          3 STOP:
      009C03 C7                       4 	.byte 4 	
      009C04 00 16 1E 03              5 	.ascii "STOP"
      009C08 CD 82                    6 	.word stop 
      001FB2                       5474     _dict_entry,4,SHOW,show 
      009C0A F2 5C                    1 	.word LINK 
                           001FB4     2 	LINK=.
      001FB4                          3 SHOW:
      009C0C 1F                       4 	.byte 4 	
      009C0D 01 5F 16 03              5 	.ascii "SHOW"
      009C11 CD 81                    6 	.word show 
      001FBB                       5475 	_dict_entry 3,RUN,run
      009C13 D1 CE                    1 	.word LINK 
                           001FBD     2 	LINK=.
      001FBD                          3 RUN:
      009C15 00                       4 	.byte 3 	
      009C16 1E 72 B0                 5 	.ascii "RUN"
      009C19 00 1C                    6 	.word run 
      001FC3                       5476 	_dict_entry 4,LIST,list
      009C1B 1F 01                    1 	.word LINK 
                           001FC5     2 	LINK=.
      001FC5                          3 LIST:
      009C1D 5F                       4 	.byte 4 	
      009C1E 7B 01 CD 81              5 	.ascii "LIST"
      009C22 5C 5C                    6 	.word list 
      001FCC                       5477 	_dict_entry,3+F_IFUNC,USR,usr
      009C24 7B 02                    1 	.word LINK 
                           001FCE     2 	LINK=.
      001FCE                          3 USR:
      009C26 CD                       4 	.byte 3+F_IFUNC 	
      009C27 81 5C 5C                 5 	.ascii "USR"
      009C2A CD 9A                    6 	.word usr 
      001FD4                       5478 	_dict_entry,6+F_IFUNC,EEPROM,eeprom 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009C2C EB 1E                    1 	.word LINK 
                           001FD6     2 	LINK=.
      001FD6                          3 EEPROM:
      009C2E 01                       4 	.byte 6+F_IFUNC 	
      009C2F 89 5F 90 CE 00 1C        5 	.ascii "EEPROM"
      009C35 CD 81                    6 	.word eeprom 
      001FDF                       5479 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009C37 D1 5B                    1 	.word LINK 
                           001FE1     2 	LINK=.
      001FE1                          3 UFLASH:
      009C39 02                       4 	.byte 6+F_IFUNC 	
      009C3A AE 00 01 A6 FF CD        5 	.ascii "UFLASH"
      009C40 81 5C                    6 	.word uflash 
      001FEA                       5480 	_dict_entry,3+F_IFUNC,ODR,port_odr
      009C42 CD 9A                    1 	.word LINK 
                           001FEC     2 	LINK=.
      001FEC                          3 ODR:
      009C44 EB                       4 	.byte 3+F_IFUNC 	
      009C45 CE 00 14                 5 	.ascii "ODR"
      009C48 C6 00                    6 	.word port_odr 
      001FF2                       5481 	_dict_entry,3+F_IFUNC,IDR,port_idr
      009C4A 16 CF                    1 	.word LINK 
                           001FF4     2 	LINK=.
      001FF4                          3 IDR:
      009C4C 00                       4 	.byte 3+F_IFUNC 	
      009C4D 17 C7 00                 5 	.ascii "IDR"
      009C50 19 5F                    6 	.word port_idr 
      001FFA                       5482 	_dict_entry,3+F_IFUNC,DDR,port_ddr 
      009C52 4B 04                    1 	.word LINK 
                           001FFC     2 	LINK=.
      009C54                          3 DDR:
      009C54 4F                       4 	.byte 3+F_IFUNC 	
      009C55 CD 81 5C                 5 	.ascii "DDR"
      009C58 5C 0A                    6 	.word port_ddr 
      002002                       5483 	_dict_entry,3+F_IFUNC,CRL,port_cr1 
      009C5A 01 26                    1 	.word LINK 
                           002004     2 	LINK=.
      002004                          3 CRL:
      009C5C F7                       4 	.byte 3+F_IFUNC 	
      009C5D 84 1E 01                 5 	.ascii "CRL"
      009C60 CD 8A                    6 	.word port_cr1 
      00200A                       5484 	_dict_entry,3+F_IFUNC,CRH,port_cr2
      009C62 19 5B                    1 	.word LINK 
                           00200C     2 	LINK=.
      00200C                          3 CRH:
      009C64 04                       4 	.byte 3+F_IFUNC 	
      009C65 81 52 48                 5 	.ascii "CRH"
      009C66 1E 0E                    6 	.word port_cr2 
      002012                       5485 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      009C66 72 01                    1 	.word LINK 
                           002014     2 	LINK=.
      002014                          3 GPIO:
      009C68 00                       4 	.byte 4+F_IFUNC 	
      009C69 25 07 27 05              5 	.ascii "GPIO"
      009C6D A6 07                    6 	.word gpio 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      00201B                       5486 	_dict_entry,6,PWRADC,power_adc 
      009C6F CC 87                    1 	.word LINK 
                           00201D     2 	LINK=.
      00201D                          3 PWRADC:
      009C71 96                       4 	.byte 6 	
      009C72 50 57 52 41 44 43        5 	.ascii "PWRADC"
      009C72 CD 88                    6 	.word power_adc 
      002026                       5487 	_dict_entry,5+F_IFUNC,RDADC,read_adc
      009C74 7A A1                    1 	.word LINK 
                           002028     2 	LINK=.
      002028                          3 RDADC:
      009C76 0A                       4 	.byte 5+F_IFUNC 	
      009C77 27 03 CC 87 94           5 	.ascii "RDADC"
      009C7C 19 DE                    6 	.word read_adc 
      002030                       5488 	_dict_entry,3+F_IFUNC,ASC,ascii  
      009C7C 90 CE                    1 	.word LINK 
                           002032     2 	LINK=.
      002032                          3 ASC:
      009C7E 00                       4 	.byte 3+F_IFUNC 	
      009C7F 04 72 B9                 5 	.ascii "ASC"
      009C82 00 01                    6 	.word ascii 
      002038                       5489 	_dict_entry,4+F_CFUNC,CHAR,char
      009C84 55 00                    1 	.word LINK 
                           00203A     2 	LINK=.
      00203A                          3 CHAR:
      009C86 03                       4 	.byte 4+F_CFUNC 	
      009C87 00 02 CD 9B              5 	.ascii "CHAR"
      009C8B 57 25                    6 	.word char 
      002041                       5490 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      009C8D 05 A6                    1 	.word LINK 
                           002043     2 	LINK=.
      002043                          3 QKEY:
      009C8F 09                       4 	.byte 4+F_IFUNC 	
      009C90 CC 87 96 59              5 	.ascii "QKEY"
      009C93 1D AF                    6 	.word qkey 
      00204A                       5491 	_dict_entry,3+F_IFUNC,KEY,key 
      009C93 CD 9A                    1 	.word LINK 
                           00204C     2 	LINK=.
      00204C                          3 KEY:
      009C95 EB                       4 	.byte 3+F_IFUNC 	
      009C96 CD 86 62                 5 	.ascii "KEY"
      009C99 5F 92                    6 	.word key 
      002052                       5492 	_dict_entry,4+F_IFUNC,SIZE,size
      009C9B AF 00                    1 	.word LINK 
                           002054     2 	LINK=.
      002054                          3 SIZE:
      009C9D 14                       4 	.byte 4+F_IFUNC 	
      009C9E 90 95 5C 92              5 	.ascii "SIZE"
      009CA2 AF 00                    6 	.word size 
      00205B                       5493 	_dict_entry,3,HEX,hex_base
      009CA4 14 5C                    1 	.word LINK 
                           00205D     2 	LINK=.
      00205D                          3 HEX:
      009CA6 90                       4 	.byte 3 	
      009CA7 97 72 B9                 5 	.ascii "HEX"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009CAA 00 1C                    6 	.word hex_base 
      002063                       5494 	_dict_entry,3,DEC,dec_base
      009CAC 90 CF                    1 	.word LINK 
                           002065     2 	LINK=.
      002065                          3 DEC:
      009CAE 00                       4 	.byte 3 	
      009CAF 1E 90 CE                 5 	.ascii "DEC"
      009CB2 00 1C                    6 	.word dec_base 
      009CB4                       5495 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      009CB4 92 AF                    1 	.word LINK 
                           00206D     2 	LINK=.
      00206D                          3 TICKS:
      009CB6 00                       4 	.byte 5+F_IFUNC 	
      009CB7 14 90 F7 5C 90           5 	.ascii "TICKS"
      009CBC 5C 90                    6 	.word get_ticks 
      002075                       5496 	_dict_entry,3+F_IFUNC,ABS,abs
      009CBE C3 00                    1 	.word LINK 
                           002077     2 	LINK=.
      002077                          3 ABS:
      009CC0 1E                       4 	.byte 3+F_IFUNC 	
      009CC1 2B F1 CE                 5 	.ascii "ABS"
      009CC4 00 1E                    6 	.word abs 
      00207D                       5497 	_dict_entry,3+F_IFUNC,RND,random 
      009CC6 72 B0                    1 	.word LINK 
                           00207F     2 	LINK=.
      00207F                          3 RND:
      009CC8 00                       4 	.byte 3+F_IFUNC 	
      009CC9 1C CD 8A                 5 	.ascii "RND"
      009CCC 19 81                    6 	.word random 
      009CCE                       5498 	_dict_entry,5,PAUSE,pause 
      009CCE CD 88                    1 	.word LINK 
                           002087     2 	LINK=.
      002087                          3 PAUSE:
      009CD0 7A                       4 	.byte 5 	
      009CD1 A1 00 27 26 A1           5 	.ascii "PAUSE"
      009CD6 0A 27                    6 	.word pause 
      00208F                       5499 	_dict_entry,4,BSET,bit_set 
      009CD8 03 CC                    1 	.word LINK 
                           002091     2 	LINK=.
      002091                          3 BSET:
      009CDA 87                       4 	.byte 4 	
      009CDB 94 90 CE 00              5 	.ascii "BSET"
      009CDF 04 72                    6 	.word bit_set 
      002098                       5500 	_dict_entry,4,BRES,bit_reset
      009CE1 B9 00                    1 	.word LINK 
                           00209A     2 	LINK=.
      00209A                          3 BRES:
      009CE3 01                       4 	.byte 4 	
      009CE4 55 00 03 00              5 	.ascii "BRES"
      009CE8 02 CD                    6 	.word bit_reset 
      0020A1                       5501 	_dict_entry,5,BTOGL,bit_toggle
      009CEA 9B 57                    1 	.word LINK 
                           0020A3     2 	LINK=.
      0020A3                          3 BTOGL:
      009CEC 25                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009CED 05 A6 09 CC 87           5 	.ascii "BTOGL"
      009CF2 96 5E                    6 	.word bit_toggle 
      009CF3                       5502 	_dict_entry 4,WAIT,wait 
      009CF3 CE 00                    1 	.word LINK 
                           0020AD     2 	LINK=.
      0020AD                          3 WAIT:
      009CF5 14                       4 	.byte 4 	
      009CF6 C6 00 16 20              5 	.ascii "WAIT"
      009CFA 0A 0A                    6 	.word wait 
      009CFB                       5503 	_dict_entry 6,REMARK,rem 
      009CFB AE 00                    1 	.word LINK 
                           0020B6     2 	LINK=.
      0020B6                          3 REMARK:
      009CFD 64                       4 	.byte 6 	
      009CFE 4F CF 00 14 C7 00        5 	.ascii "REMARK"
      009D04 16 04                    6 	.word rem 
      009D05                       5504 	_dict_entry 5,PRINT,print 
      009D05 CF 00                    1 	.word LINK 
                           0020C1     2 	LINK=.
      0020C1                          3 PRINT:
      009D07 17                       4 	.byte 5 	
      009D08 C7 00 19 4B 04           5 	.ascii "PRINT"
      009D0D 5F F5                    6 	.word print 
      009D0E                       5505 	_dict_entry,2,IF,if 
      009D0E 4F CD                    1 	.word LINK 
                           0020CB     2 	LINK=.
      0020CB                          3 IF:
      009D10 81                       4 	.byte 2 	
      009D11 5C 5C                    5 	.ascii "IF"
      009D13 0A 01                    6 	.word if 
      0020D0                       5506 	_dict_entry,5,GOSUB,gosub 
      009D15 26 F7                    1 	.word LINK 
                           0020D2     2 	LINK=.
      0020D2                          3 GOSUB:
      009D17 84                       4 	.byte 5 	
      009D18 81 4F 53 55 42           5 	.ascii "GOSUB"
      009D19 18 B8                    6 	.word gosub 
      0020DA                       5507 	_dict_entry,4,GOTO,goto 
      009D19 52 02                    1 	.word LINK 
                           0020DC     2 	LINK=.
      0020DC                          3 GOTO:
      009D1B 5F                       4 	.byte 4 	
      009D1C 1F 01 CF 00              5 	.ascii "GOTO"
      009D20 15 35                    6 	.word goto 
      0020E3                       5508 	_dict_entry,3,FOR,for 
      009D22 01 00                    1 	.word LINK 
                           0020E5     2 	LINK=.
      0020E5                          3 FOR:
      009D24 14                       4 	.byte 3 	
      009D25 46 4F 52                 5 	.ascii "FOR"
      009D25 5F 92                    6 	.word for 
      0020EB                       5509 	_dict_entry,2,TO,to
      009D27 AF 00                    1 	.word LINK 
                           0020ED     2 	LINK=.
      0020ED                          3 TO:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009D29 14                       4 	.byte 2 	
      009D2A 27 39                    5 	.ascii "TO"
      009D2C 17 E0                    6 	.word to 
      0020F2                       5510 	_dict_entry,4,STEP,step 
      009D2C 92 AF                    1 	.word LINK 
                           0020F4     2 	LINK=.
      0020F4                          3 STEP:
      009D2E 00                       4 	.byte 4 	
      009D2F 14 27 06 CD              5 	.ascii "STEP"
      009D33 82 1E                    6 	.word step 
      0020FB                       5511 	_dict_entry,4,NEXT,next 
      009D35 5C 20                    1 	.word LINK 
                           0020FD     2 	LINK=.
      0020FD                          3 NEXT:
      009D37 F4                       4 	.byte 4 	
      009D38 5C A6 20 CD              5 	.ascii "NEXT"
      009D3C 82 1E                    6 	.word next 
      002104                       5512 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009D3E 92 AF                    1 	.word LINK 
                           002106     2 	LINK=.
      002106                          3 UBOUND:
      009D40 00                       4 	.byte 6+F_IFUNC 	
      009D41 14 90 95 5C 92 AF        5 	.ascii "UBOUND"
      009D47 00 14                    6 	.word ubound 
      00210F                       5513 	_dict_entry,6,RETURN,return 
      009D49 5C 90                    1 	.word LINK 
                           002111     2 	LINK=.
      002111                          3 RETURN:
      009D4B 97                       4 	.byte 6 	
      009D4C 90 89 72 FB 01 5C        5 	.ascii "RETURN"
      009D52 CD 9A                    6 	.word return 
      00211A                       5514 	_dict_entry,4+F_IFUNC,PEEK,peek 
      009D54 EB 85                    1 	.word LINK 
                           00211C     2 	LINK=.
      00211C                          3 PEEK:
      009D56 CD                       4 	.byte 4+F_IFUNC 	
      009D57 8A 19 A6 0D              5 	.ascii "PEEK"
      009D5B CD 82                    6 	.word peek 
      002123                       5515 	_dict_entry,4,POKE,poke 
      009D5D 1E 1E                    1 	.word LINK 
                           002125     2 	LINK=.
      002125                          3 POKE:
      009D5F 01                       4 	.byte 4 	
      009D60 5C 1F 01 20              5 	.ascii "POKE"
      009D64 C0 72                    6 	.word poke 
      009D65                       5516 	_dict_entry,5,INPUT,input_var  
      009D65 1E 01                    1 	.word LINK 
                           00212E     2 	LINK=.
      00212E                          3 INPUT:
      009D67 CD                       4 	.byte 5 	
      009D68 8A 19 AE 9D 9A           5 	.ascii "INPUT"
      009D6D CD 82                    6 	.word input_var 
      002136                       5517 kword_dict:
      002136                       5518 	_dict_entry 3,LET,let 
      009D6F 30 A6                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                           002138     2 	LINK=.
      002138                          3 LET:
      009D71 FF                       4 	.byte 3 	
      009D72 C0 00 19                 5 	.ascii "LET"
      009D75 C7 00                    6 	.word let 
                                   5519 	
                                   5520 
      002180                       5521 	.bndry 128 ; align on FLASH block.
                                   5522 ; free space for user application  
      002180                       5523 user_space:
                                   5524 ; USR() function test
      009D77 0B               [ 2] 5525 	pushw x 
      009D78 A6 7F C2 00      [ 1] 5526 	bset PC_ODR,#5 
      009D7C 18               [ 2] 5527 	popw x 
      009D7D C7 00 0A         [ 4] 5528 	call pause02 
      009D80 A6 02 C2 00      [ 1] 5529 	bres PC_ODR,#5 
      009D84 17               [ 4] 5530 	ret
                                   5531 
                                   5532 	.area FLASH_DRIVE (ABS)
      010000                       5533 	.org 0x10000
      010000                       5534 fdrive:
                                   5535 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002077 R   |     ADC_CR1 =  005401 
    ADC_CR1_=  000000     |     ADC_CR1_=  000001     |     ADC_CR1_=  000004 
    ADC_CR1_=  000005     |     ADC_CR1_=  000006     |     ADC_CR2 =  005402 
    ADC_CR2_=  000003     |     ADC_CR2_=  000004     |     ADC_CR2_=  000005 
    ADC_CR2_=  000006     |     ADC_CR2_=  000001     |     ADC_CR3 =  005403 
    ADC_CR3_=  000007     |     ADC_CR3_=  000006     |     ADC_CSR =  005400 
    ADC_CSR_=  000006     |     ADC_CSR_=  000004     |     ADC_CSR_=  000000 
    ADC_CSR_=  000001     |     ADC_CSR_=  000002     |     ADC_CSR_=  000003 
    ADC_CSR_=  000007     |     ADC_CSR_=  000005     |     ADC_DRH =  005404 
    ADC_DRL =  005405     |     ADC_TDRH=  005406     |     ADC_TDRL=  005407 
    ADDR    =  000001     |     ADD_SPAC=  000003     |     AFR     =  004803 
    AFR0_ADC=  000000     |     AFR1_TIM=  000001     |     AFR2_CCO=  000002 
    AFR3_TIM=  000003     |     AFR4_TIM=  000004     |     AFR5_TIM=  000005 
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |     ARG_CNT =  000001 
    ARG_OFS =  000002     |   5 ASC        002032 R   |     ATTRIB  =  000002 
    AWU_APR =  0050F1     |     AWU_CSR1=  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BASE_SAV=  000001     |   5 BEEP       001FA2 R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |     BINARY  =  000001 
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BLOCK_ER=  000000 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  000005     |   5 BREAK      001F98 R   |   5 BRES       00209A R
  5 BSET       002091 R   |     BSIZE   =  000001     |     BSP     =  000008 
  5 BTOGL      0020A3 R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        001F45 R   |     C       =  000001     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000000     |   5 CHAR       00203A R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
    CLK_ECKR=  000001     |     CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0 
    CLK_ICKR=  000002     |     CLK_ICKR=  000000     |     CLK_ICKR=  000001 
    CLK_ICKR=  000003     |     CLK_ICKR=  000004     |     CLK_ICKR=  000005 
    CLK_PCKE=  0050C7     |     CLK_PCKE=  000000     |     CLK_PCKE=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Symbol Table

    CLK_PCKE=  000007     |     CLK_PCKE=  000005     |     CLK_PCKE=  000006 
    CLK_PCKE=  000004     |     CLK_PCKE=  000002     |     CLK_PCKE=  000003 
    CLK_PCKE=  0050CA     |     CLK_PCKE=  000003     |     CLK_PCKE=  000002 
    CLK_PCKE=  000007     |     CLK_SWCR=  0050C5     |     CLK_SWCR=  000000 
    CLK_SWCR=  000001     |     CLK_SWCR=  000002     |     CLK_SWCR=  000003 
    CLK_SWIM=  0050CD     |     CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4 
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |     CMD_END =  000002 
    CNT     =  000008     |     COMMA   =  000001     |     COUNT   =  000001 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  5 CRH        00200C R   |   5 CRL        002004 R   |     CTRL_A  =  000001 
    CTRL_B  =  000002     |     CTRL_C  =  000003     |     CTRL_D  =  000004 
    CTRL_E  =  000005     |     CTRL_F  =  000006     |     CTRL_G  =  000007 
    CTRL_H  =  000008     |     CTRL_I  =  000009     |     CTRL_J  =  00000A 
    CTRL_K  =  00000B     |     CTRL_L  =  00000C     |     CTRL_M  =  00000D 
    CTRL_N  =  00000E     |     CTRL_O  =  00000F     |     CTRL_P  =  000010 
    CTRL_Q  =  000011     |     CTRL_R  =  000012     |     CTRL_S  =  000013 
    CTRL_T  =  000014     |     CTRL_U  =  000015     |     CTRL_V  =  000016 
    CTRL_W  =  000017     |     CTRL_X  =  000018     |     CTRL_Y  =  000019 
    CTRL_Z  =  00001A     |     CTXT_SIZ=  000006     |     CURR    =  000002 
    CX_BPTR =  000001     |     CX_CNT  =  000005     |     CX_IN   =  000004 
    CX_LNO  =  000003     |     DBG_A   =  000005     |     DBG_CC  =  000006 
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        001FFC R
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        002065 R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        001F6C R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
    DSTACK_S=  000040     |   5 EEPROM     001FD6 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |     EOF     =  0000FF 
    ERR_BAD_=  00000A     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_L=  000005     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |     FF      =  00000C 
    FFOR    =  000002     |     FHSE    =  7A1200     |     FHSI    =  F42400 
    FIRST   =  000001     |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
    FLASH_CR=  000002     |     FLASH_CR=  000000     |     FLASH_CR=  000003 
    FLASH_CR=  000001     |     FLASH_CR=  00505B     |     FLASH_CR=  000005 
    FLASH_CR=  000004     |     FLASH_CR=  000007     |     FLASH_CR=  000000 
    FLASH_CR=  000006     |     FLASH_DU=  005064     |     FLASH_DU=  0000AE 
    FLASH_DU=  000056     |     FLASH_EN=  027FFF     |     FLASH_FP=  00505D 
    FLASH_FP=  000000     |     FLASH_FP=  000001     |     FLASH_FP=  000002 
    FLASH_FP=  000003     |     FLASH_FP=  000004     |     FLASH_FP=  000005 
    FLASH_IA=  00505F     |     FLASH_IA=  000003     |     FLASH_IA=  000002 
    FLASH_IA=  000006     |     FLASH_IA=  000001     |     FLASH_IA=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   5 FOR        0020E5 R
  5 FORGET     001F61 R   |     FRUN    =  000000     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FTRAP   =  000001     |     F_CFUNC =  000080 
    F_CMD   =  000000     |     F_IFUNC =  000040     |     F_SFUNC =  0000C0 
  5 GOSUB      0020D2 R   |     GOS_RET =  000003     |   5 GOTO       0020DC R
  5 GPIO       002014 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   5 HEX        00205D R
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
    I2C_SR1_=  000002     |     I2C_SR1_=  000006     |     I2C_SR1_=  000000 
    I2C_SR1_=  000004     |     I2C_SR1_=  000007     |     I2C_SR2 =  005218 
    I2C_SR2_=  000002     |     I2C_SR2_=  000001     |     I2C_SR2_=  000000 
    I2C_SR2_=  000003     |     I2C_SR2_=  000005     |     I2C_SR3 =  005219 
    I2C_SR3_=  000001     |     I2C_SR3_=  000007     |     I2C_SR3_=  000004 
    I2C_SR3_=  000000     |     I2C_SR3_=  000002     |     I2C_TRIS=  00521D 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000005 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_TRIS=  000011 
    I2C_WRIT=  000000     |   5 IDR        001FF4 R   |   5 IF         0020CB R
    IN      =  000007     |     INCR    =  000001     |   5 INPUT      00212E R
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
    INT_VECT=  00801C     |     INT_VECT=  008020     |     INT_VECT=  008024 
    INT_VECT=  008068     |     INT_VECT=  008054     |     INT_VECT=  008000 
    INT_VECT=  008030     |     INT_VECT=  008038     |     INT_VECT=  008034 
    INT_VECT=  008040     |     INT_VECT=  00803C     |     INT_VECT=  008048 
    INT_VECT=  008044     |     INT_VECT=  008064     |     INT_VECT=  008008 
    INT_VECT=  008004     |     INT_VECT=  008050     |     INT_VECT=  00804C 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  00805C     |     INT_VECT=  008058     |     INW     =  000003 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        00204C R
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  5 LET        002138 R   |     LINENO  =  000005     |   5 LINK    =  002138 R
  5 LIST       001FC5 R   |     LL      =  000002     |     LLEN    =  000002 
    LL_HB   =  000001     |     LNO     =  000005     |     LN_PTR  =  000005 
  5 LOAD       001F74 R   |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MINOR   =  000000     |     MULOP   =  000005 
    N1      =  000001     |     N1_HB   =  000006     |     N1_LB   =  000007 
    N2      =  000003     |     N2_HB   =  000008     |     N2_LB   =  000009 
    NAFR    =  004804     |     NAMEPTR =  000003     |     NCLKOPT =  004808 
    NEG     =  000001     |   5 NEW        001F90 R   |   5 NEXT       0020FD R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NL      =  00000A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000009 R   |   5 ODR        001FEC R   |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |     PAD_SIZE=  000028 
  5 PAUSE      002087 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   5 PEEK       00211C R
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   5 POKE       002125 R   |     PREV    =  000001 
  5 PRINT      0020C1 R   |     PROD    =  000002     |     PSIZE   =  000001 
  5 PWRADC     00201D R   |   5 QKEY       002043 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 RDADC      002028 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Symbol Table

  5 REG_A      000943 R   |   5 REG_CC     000947 R   |   5 REG_EPC    000936 R
  5 REG_SP     00094C R   |   5 REG_X      00093F R   |   5 REG_Y      00093B R
    RELOP   =  000005     |   5 REMARK     0020B6 R   |     RETL1   =  000001 
  5 RETURN     002111 R   |   5 RND        00207F R   |     ROP     =  004800 
    RST_SR  =  0050B3     |   5 RUN        001FBD R   |     RXCHAR  =  000001 
    R_A     =  000007     |     R_CC    =  000008     |     R_X     =  000005 
    R_Y     =  000003     |   5 SAVE       001F7D R   |     SDIVD   =  000002 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       001FB4 R   |     SIGN    =  000001     |   5 SIZE       002054 R
    SKIP    =  000006     |   5 SLEEP      001F57 R   |     SPACE   =  000020 
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SQUOT   =  000001 
    SRC     =  000003     |     STACK_EM=  0017FF     |     STACK_SI=  000080 
  5 STATES     0008F9 R   |   5 STEP       0020F4 R   |   5 STOP       001FAB R
    SWIM_CSR=  007F80     |     TAB     =  000009     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      00206D R   |     TIM1_ARR=  005262 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_PSC=  005261     |     TIM1_RCR=  005264     |     TIM1_SMC=  005252 
    TIM1_SMC=  000007     |     TIM1_SMC=  000000     |     TIM1_SMC=  000001 
    TIM1_SMC=  000002     |     TIM1_SMC=  000004     |     TIM1_SMC=  000005 
    TIM1_SMC=  000006     |     TIM1_SR1=  005255     |     TIM1_SR1=  000007 
    TIM1_SR1=  000001     |     TIM1_SR1=  000002     |     TIM1_SR1=  000003 
    TIM1_SR1=  000004     |     TIM1_SR1=  000005     |     TIM1_SR1=  000006 
    TIM1_SR1=  000000     |     TIM1_SR2=  005256     |     TIM1_SR2=  000001 
    TIM1_SR2=  000002     |     TIM1_SR2=  000003     |     TIM1_SR2=  000004 
    TIM2_ARR=  00530D     |     TIM2_ARR=  00530E     |     TIM2_CCE=  005308 
    TIM2_CCE=  005309     |     TIM2_CCM=  005305     |     TIM2_CCM=  005306 
    TIM2_CCM=  005307     |     TIM2_CCR=  00530F     |     TIM2_CCR=  005310 
    TIM2_CCR=  005311     |     TIM2_CCR=  005312     |     TIM2_CCR=  005313 
    TIM2_CCR=  005314     |     TIM2_CNT=  00530A     |     TIM2_CNT=  00530B 
    TIM2_CR1=  005300     |     TIM2_EGR=  005304     |     TIM2_IER=  005301 
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
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_ARRAY=  000005 
    TK_CFUNC=  000008     |     TK_CHAR =  000002     |     TK_CMD  =  000006 
    TK_COLON=  000001     |     TK_COMMA=  00000D     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000007 
    TK_INTGR=  000003     |     TK_LE   =  000036     |     TK_LPARE=  00000B 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  00000A     |     TK_RPARE=  00000C 
    TK_SFUNC=  000009     |     TK_SHARP=  00000E     |     TK_VAR  =  000004 
  5 TO         0020ED R   |   5 Timer4Up   000019 R   |   5 TrapHand   00000A R
    U8      =  000003     |     UART1   =  000000     |     UART1_BA=  005230 
    UART1_BR=  005232     |     UART1_BR=  005233     |     UART1_CR=  005234 
    UART1_CR=  005235     |     UART1_CR=  005236     |     UART1_CR=  005237 
    UART1_CR=  005238     |     UART1_DR=  005231     |     UART1_GT=  005239 
    UART1_PO=  000000     |     UART1_PS=  00523A     |     UART1_RX=  000004 
    UART1_SR=  005230     |     UART1_TX=  000005     |     UART3   =  000001 
    UART3_BA=  005240     |     UART3_BR=  005242     |     UART3_BR=  005243 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

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
  5 UBOUND     002106 R   |   5 UFLASH     001FE1 R   |   5 USER_ABO   00007E R
  5 USR        001FCE R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |   5 UserButt   000025 R   |     VSIZ    =  000002 
    VSIZE   =  000002     |     VT      =  00000B     |   5 WAIT       0020AD R
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH   =  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   5 WORDS      001F4D R
  5 WRITE      001F86 R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XADR    =  000001     |     XMASK   =  000001     |     XSAVE   =  000003 
    YSAVE   =  000003     |   5 abs        001E75 R   |   1 acc16      000009 R
  1 acc24      000008 R   |   1 acc8       00000A R   |   5 accept_c   000AF1 R
  5 add        001083 R   |   5 ansi_seq   000AAF R   |   5 arg_list   0011C2 R
  1 array_ad   000020 R   |   1 array_si   000022 R   |   5 ascii      001D83 R
  5 at_tst     000DBC R   |   5 atoi24     000ECF R   |   5 atoi_exi   000F3D R
  5 bad_port   001DF1 R   |   1 base       000007 R   |   1 basicptr   000003 R
  5 beep       00197B R   |   5 bin_exit   000CC2 R   |   5 bit_rese   001749 R
  5 bit_set    001735 R   |   5 bit_togg   00175E R   |   5 bkslsh_t   000D67 R
  5 bksp       0001BA R   |   5 break      001A11 R   |   5 break_po   001A42 R
  5 bye        001E48 R   |   5 char       001D66 R   |   5 check_fu   0003E4 R
  5 clear_ba   0005E2 R   |   5 clear_va   0004F2 R   |   5 clock_in   000099 R
  5 cmd_itf    000B15 R   |   5 cmd_name   00112E R   |   5 cmp_name   001AB6 R
  5 cold_sta   000557 R   |   5 colon_ts   000D90 R   |   5 comma_ts   000D9B R
  5 compile    0003F3 R   |   5 convert_   000C4A R   |   1 count      000002 R
  5 cp_loop    001171 R   |   5 create_g   000343 R   |   5 cstk_pro   00104D R
  5 dash_tst   000DB1 R   |   5 ddrop      000FC9 R   |   5 ddrop_n    001006 R
  5 ddup       000FD2 R   |   5 dec_base   00136C R   |   5 del_back   000AE2 R
  5 del_line   00030B R   |   5 del_ln     000AD3 R   |   5 delete     0001CA R
  5 dir_loop   001CA5 R   |   5 director   001C99 R   |   5 divide     0010D9 R
  5 divu24_8   000A3C R   |   5 dotr       001056 R   |   5 dotr_loo   00106B R
  5 dots       001023 R   |   5 dpick      000FE3 R   |   5 dpop       000FA2 R
  5 dpush      000F95 R   |   5 drive_fr   001D22 R   |   3 dstack     001740 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

  3 dstack_u   001780 R   |   5 dstk_pro   001019 R   |   1 dstkptr    000019 R
  5 dswap      000FAF R   |   5 eeprom     001E1A R   |   5 eql_tst    000E1C R
  5 equal      0015E8 R   |   5 err_bad_   0006C3 R   |   5 err_cmd_   000684 R
  5 err_div0   000646 R   |   5 err_dupl   00069F R   |   5 err_math   00062C R
  5 err_mem_   00060F R   |   5 err_msg    0005F7 R   |   5 err_no_a   0006D0 R
  5 err_no_l   000656 R   |   5 err_not_   0006B1 R   |   5 err_run_   00066D R
  5 err_synt   00061D R   |   5 escaped    000C5F R   |   5 expect     0011B5 R
  5 expr_exi   0012FD R   |   5 expressi   0012BC R   |   5 factor     001219 R
  1 farptr     000013 R   |   7 fdrive     010000 R   |   5 fetch      000FF2 R
  5 fetchc     000C02 R   |   1 ffree      000016 R   |   5 file_cou   001D1A R
  5 final_te   000AA9 R   |   5 first_li   0013DC R   |   1 flags      000024 R
  5 for        0017B6 R   |   5 forget     001C4E R   |   1 free_ram   00005A R
  5 ge         0015EA R   |   5 get_arra   0011E6 R   |   5 get_tick   001E6F R
  5 get_toke   000D04 R   |   5 getc       0001A7 R   |   5 go_commo   0018DB R
  5 gosub      0018B8 R   |   5 goto       0018AB R   |   5 gpio       001DB9 R
  5 gt         0015E6 R   |   5 gt_tst     000E27 R   |   5 hex_base   001367 R
  5 hse_cloc   000187 R   |   5 hsi_cloc   000191 R   |   5 if         0017A2 R
  1 in         000001 R   |   1 in.w       000000 R   |   1 in.w.sav   000011 R
  5 incr_far   001A6B R   |   5 input_ex   001701 R   |   5 input_lo   00169C R
  5 input_va   001690 R   |   5 insert_l   00037C R   |   5 insert_l   0003E1 R
  5 interp     000786 R   |   5 interp_l   0007CA R   |   5 invalid    000B5A R
  5 invalid_   000BD8 R   |   5 is_alpha   000500 R   |   5 is_digit   000EBA R
  5 itoa       0009F5 R   |   5 itoa_loo   000A0D R   |   5 key        001DA7 R
  5 kword_di   002136 R   |   5 kword_en   001F43 R   |   5 last_lin   0013E5 R
  5 le         0015EF R   |   5 ledoff     000849 R   |   5 ledon      000844 R
  5 ledtoggl   00084E R   |   5 left_arr   000AAF R   |   5 left_par   000857 R
  5 let        001389 R   |   5 let02      001393 R   |   1 lineno     000005 R
  5 lines_sk   0013EA R   |   5 list       0013B1 R   |   5 list_exi   001431 R
  5 list_sta   00140D R   |   5 load       001BE6 R   |   5 loop_bac   001880 R
  1 loop_dep   00001F R   |   5 loop_don   001899 R   |   5 lt         0015ED R
  5 lt_tst     000E60 R   |   5 mem_peek   000B77 R   |   5 modulo     00111D R
  5 move       00029E R   |   5 move_dow   0002BC R   |   5 move_exi   0002DD R
  5 move_loo   0002C1 R   |   5 move_up    0002AE R   |   5 mul_char   0015D7 R
  5 multiply   001091 R   |   5 mulu24_8   000F41 R   |   5 nbr_tst    000D3D R
  5 ne         0015F2 R   |   5 neg_acc2   000A64 R   |   5 new        001A60 R
  5 next       001838 R   |   5 next_tok   0007FA R   |   5 no_match   001183 R
  5 none       000D04 R   |   5 number     000C08 GR  |   5 other      000E98 R
  3 pad        001718 R   |   5 parse_bi   000CA2 R   |   5 parse_in   000C67 R
  5 parse_ke   000CCA R   |   5 parse_qu   000C0F R   |   5 pause      001E5C R
  5 pause02    001E66 R   |   5 peek       001785 R   |   5 peek_byt   000BA2 R
  5 plus_tst   000DF0 R   |   5 poke       001772 R   |   5 port_cr1   001E08 R
  5 port_cr2   001E0E R   |   5 port_ddr   001E02 R   |   5 port_idr   001DFC R
  5 port_odr   001DF6 R   |   5 power_ad   0019A3 R   |   5 prcnt_ts   000E11 R
  5 print      0015F5 R   |   5 print_ex   00165A R   |   5 print_fa   000BE7 R
  5 print_in   000999 R   |   5 print_re   0008A6 R   |   5 print_st   000B6A R
  5 prt_basi   001484 R   |   5 prt_cmd_   001434 R   |   5 prt_loop   0015F9 R
  5 prt_peek   00024E R   |   5 prt_quot   001448 R   |   5 prt_reg1   000887 R
  5 prt_reg8   000862 R   |   5 prt_regs   0001E4 R   |   5 prti24     000951 R
  1 ptr16      000014 R   |   1 ptr8       000015 R   |   5 putc       00019E R
  5 puts       0001B0 R   |   5 qkey       001DAF R   |   5 qmark_ts   000DC7 R
  5 random     001E95 R   |   5 read_adc   0019DE R   |   5 readln     000A87 R
  5 readln_l   000A8D R   |   5 readln_q   000B06 R   |   5 regs_sta   000227 R
  5 rel_exit   001354 R   |   5 relation   001300 R   |   5 relop_st   0015DA R
  5 rem        001704 R   |   5 repl       000B23 R   |   5 repl_exi   000B4B R
  5 reprint    000AAF R   |   5 reset_co   0015F7 R   |   5 rest_con   00167B R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]

Symbol Table

  5 return     001901 R   |   5 right_ar   000AAF R   |   5 rparnt_t   000D85 R
  5 rt_msg     000704 R   |   5 run        001925 R   |   5 save       001B22 R
  5 save_con   001666 R   |   5 search_d   001160 R   |   5 search_e   0011B1 R
  5 search_f   001AD7 R   |   5 search_l   0002E0 R   |   5 search_l   0002EB R
  5 search_n   001164 R   |   1 seedx      00000D R   |   1 seedy      00000F R
  5 seek_fdr   001A79 R   |   5 sharp_ts   000DA6 R   |   5 show       001357 R
  5 single_c   0015D3 R   |   5 size       001371 R   |   5 skip       000F7B R
  5 slash_ts   000E06 R   |   5 sleep      001E51 R   |   5 software   000511 R
  5 spaces     0001D8 R   |   3 stack_fu   001780 R   |   3 stack_un   001800 R
  5 star_tst   000DFB R   |   5 step       001810 R   |   5 stop       00196C R
  5 store      000FFC R   |   5 store_lo   001822 R   |   5 str_matc   001192 R
  5 str_tst    000D2C R   |   5 strcmp     00027F R   |   5 strcpy     000290 R
  5 strlen     000272 R   |   5 substrac   00108B R   |   5 syntax_e   000714 R
  1 tab_widt   000025 R   |   5 tb_error   000716 R   |   5 term       00126F R
  5 term01     001278 R   |   5 term_exi   0012B9 R   |   5 test_p     000B62 R
  3 tib        0016C8 R   |   5 tick_tst   000DDE R   |   1 ticks      00000B R
  5 timer4_i   0000AF R   |   5 to         0017E0 R   |   5 to_upper   000EC3 GR
  5 token_ch   000EA7 R   |   5 token_ex   000EB7 R   |   1 txtbgn     00001B R
  1 txtend     00001D R   |   5 uart3_in   000174 R   |   5 uart3_se   000180 R
  5 uart_ena   000199 R   |   5 ubound     00137B R   |   5 uflash     001E14 R
  5 unget_to   000F8E R   |   5 unlock_e   0000C0 R   |   5 unlock_f   0000CE R
  5 user_spa   002180 R   |   5 usr        001E20 R   |   1 vars       000026 R
  5 wait       00170A R   |   5 warm_sta   000766 R   |   5 words      001F09 R
  5 write      001D2F R   |   5 write_bl   000151 R   |   5 write_by   0000DC R
  5 write_ee   000118 R   |   5 write_ex   00014C R   |   5 write_fl   000102 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5A   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   218E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

