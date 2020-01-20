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
      008000 82 00 85 DB             98     int cold_start
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
      00808E CD 89 2A         [ 4]  152 	call print_registers
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
      0080D6 CD 8A 1D         [ 4]  191 	call print_int  	
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
      0080FB CC 87 EA         [ 2]  208 	jp warm_start
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
      0081ED 01 CD 9B 1D 5B   [ 2]  508 	btjf UART3_SR,#UART_SR_RXNE,.
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
      008227 AE 09 4B         [ 2]  599 	ldw x,#REG_CC 
      008227 72 0B 52         [ 4]  600 	call prt_reg8 
                                    601 ; register A 
      00822A 40 FB            [ 1]  602 	ld a,(R_A,sp)
      00822C C6 52 41         [ 2]  603 	ldw x,#REG_A 
      00822F 81 08 66         [ 4]  604 	call prt_reg8 
                                    605 ; register X 
      008230 16 05            [ 2]  606 	ldw y,(R_X,sp)
      008230 F6 27 06         [ 2]  607 	ldw x,#REG_X 
      008233 CD 82 1E         [ 4]  608 	call prt_reg16 
                                    609 ; register Y 
      008236 5C 20            [ 2]  610 	ldw y,(R_Y,sp)
      008238 F7 81 3F         [ 2]  611 	ldw x,#REG_Y 
      00823A CD 08 8B         [ 4]  612 	call prt_reg16 
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
      008263 CD 09 55         [ 4]  639 	call prti24 
      008263 81 3A            [ 1]  640 	ld a,#': 
      008264 CD 01 9E         [ 4]  641 	call putc 
      008264 AE 82            [ 1]  642 	ld a,#SPACE 
      008266 A7 CD 82         [ 4]  643 	call putc 
      008269 30               [ 2]  644 	popw x 
      00826A 16               [ 1]  645 	ld a,(x)
      00826B 01 AE 89         [ 1]  646 	ld acc8,a 
      00826E BA               [ 1]  647 	clrw x 
      00826F CD 89            [ 1]  648 	ld a,#16 
      008271 0B 7B 08         [ 4]  649 	call prti24
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
      008275 89 CB            [ 1]  661 	ldw y,x 
      008277 CD               [ 1]  662 	clrw x 
      008278 88 E6            [ 1]  663 1$:	tnz (y) 
      00827A 7B 07            [ 1]  664 	jreq 9$ 
      00827C AE               [ 1]  665 	incw x
      00827D 89 C7            [ 1]  666 	incw y 
      00827F CD 88            [ 2]  667 	jra 1$ 
      008281 E6               [ 4]  668 9$: ret 
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
      008285 89 C3            [ 1]  681 	cp a,(y) 
      008287 CD 89            [ 1]  682 	jrne 4$ 
      008289 0B               [ 1]  683 	incw x 
      00828A 16 03            [ 1]  684 	incw y 
      00828C AE 89            [ 2]  685 	jra strcmp 
      00028B                        686 4$: ; not same  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00828E BF               [ 1]  687 	clr a 
      00828F CD               [ 4]  688 	ret 
      00028D                        689 5$: ; same 
      008290 89 0B            [ 1]  690 	ld a,#1 
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
      00829A D0 CD            [ 1]  708 	incw y 
      00829C 89 0B            [ 2]  709 	jra 1$ 
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
      0082DA 89 D5            [ 2]  758 	jra move_loop
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
      0082F0 D5               [ 1]  783 	ldw x,y 
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
      008427 60 5D            [ 1] 1030 	cp a,#TK_ARRAY 
      008429 26 04            [ 1] 1031 	jreq 2$ 
      00842B 17 01            [ 1] 1032 	cp a,#TK_QSTR 
      00842D 20 05            [ 1] 1033 	jrne 4$
      00842F 1F 01 CD         [ 2] 1034 	ldw x,#pad 
      008432 83 8B 72         [ 4] 1035 	call strlen
      008434 5C               [ 1] 1036 	incw x  
      008434 A6 03 11         [ 4] 1037 	call check_full 
      008437 08 27 27 1E      [ 2] 1038 	ldw y,#pad 
      00843B 01 C3 00         [ 2] 1039 	ldw x,ptr16
      00843E 1E 2A 17         [ 2] 1040 	addw x,(BUFIDX,sp)	
      008441 1E 01 16         [ 4] 1041 	call strcpy 
      008444 07 CD 83         [ 2] 1042 	ldw x,#pad 
      008447 C3 1E 07         [ 4] 1043 	call strlen 
      00844A CF               [ 1] 1044 	incw x
      00844B 00 0A 90         [ 2] 1045 	addw x,(BUFIDX,sp) 
      00844E CE 00            [ 2] 1046 	ldw (BUFIDX,sp),x
      008450 1E 1E            [ 2] 1047 	jra 2$  
      008452 01 CD            [ 1] 1048 4$: cp a,#TK_INTGR
      008454 83 1E            [ 1] 1049 	jrult 2$
      008456 20 09            [ 1] 1050 	cp a,#TK_SFUNC 
      008458 22 9B            [ 1] 1051 	Jrugt 2$
      008458 1E 07            [ 2] 1052 	ldw x,(XSAVE,sp) 
      00845A 72 BB            [ 2] 1053 	ldw y,(BUFIDX,sp)
      00845C 00 1E CF         [ 5] 1054 	ldw ([ptr16],y),x
      00845F 00 1E 01         [ 2] 1055 	cpw x,#rem 
      008461 26 26            [ 1] 1056 	jrne 5$
      008461 5B 08 81 02      [ 2] 1057 	addw y,#2 
      008464 90 89            [ 2] 1058 	pushw y 
      008464 72 BB 00         [ 2] 1059 	ldw x,ptr16 
      008467 15 A3 16         [ 2] 1060 	addw x,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00049F                       1061 	_drop 2  
      00846A C8 25            [ 2]    1     addw sp,#2 
      00846C 05 A6 01 CC      [ 2] 1062 	ldw y,in.w 
      008470 87 9A 81 C8      [ 2] 1063 	addw y,#tib 
      008473 CD 02 90         [ 4] 1064 	call strcpy 	
      008473 52 04 72         [ 4] 1065 	call strlen 
      008476 1A 00 25         [ 2] 1066 	addw x,#3 ; rem exec address+string 0. 
      008479 CE 00 1E         [ 2] 1067 	addw x,(BUFIDX,sp)
      00847C CF 00            [ 2] 1068 	ldw (BUFIDX,sp),x 
      00847E 15 5F            [ 2] 1069 	jra 9$
      008480 AE 00 03 1F      [ 2] 1070 5$:	addw y,#2 
      008484 03 CD            [ 2] 1071 	ldw (BUFIDX,sp),y 
      008486 84 64 5F         [ 2] 1072 	jp 2$
      0004C2                       1073 9$: 
      008489 72 CF 00         [ 2] 1074 	ldw x,#2
      00848C 15 CD            [ 2] 1075 	ldw y,(BUFIDX,sp)
      00848E 8D 84            [ 1] 1076 	ld a,yl 
      008490 1F 01 A1 04      [ 4] 1077 	ld ([ptr16],x),a  	
      008494 26 11 A3 00      [ 5] 1078 	ldw x,[ptr16]
      008498 00 22            [ 1] 1079 	jreq 10$
      00849A 03 CC 87         [ 4] 1080 	call insert_line
      00849D 98 72 CF 00      [ 1] 1081 	clr  count 
      0084A1 15 CD            [ 2] 1082 	jra  11$ 
      0004DC                       1083 10$: 
      0084A3 8D 84 1F         [ 2] 1084 	ldw x,ptr16 
      0084A6 01 A1 00         [ 2] 1085 	ldw basicptr,x 
      0084A9 26 03            [ 1] 1086 	ld a,(2,x)
      0084AB CC 85 42         [ 1] 1087 	ld count,a 
      0084AE FE               [ 2] 1088 	ldw x,(x)
      0084AE 1E 03 CD         [ 2] 1089 	ldw lineno,x 
      0084B1 84 64 16 03      [ 1] 1090 	mov in,#3 
      0004EF                       1091 11$:
      0004EF                       1092 	_drop VSIZE 
      0084B5 91 D7            [ 2]    1     addw sp,#VSIZE 
      0084B7 15 90 5C 17      [ 1] 1093 	bres flags,#FCOMP 
      0084BB 03               [ 4] 1094 	ret 
                                   1095 
                                   1096 
                                   1097 ;------------------------------------
                                   1098 ;  set all variables to zero 
                                   1099 ; input:
                                   1100 ;   none 
                                   1101 ; output:
                                   1102 ;	none
                                   1103 ;------------------------------------
      0004F6                       1104 clear_vars:
      0084BC A1 01 26         [ 2] 1105 	ldw x,#vars 
      0084BF 02 20 E0 34      [ 2] 1106 	ldw y,#2*26 
      0084C2 7F               [ 1] 1107 1$:	clr (x)
      0084C2 A1               [ 1] 1108 	incw x 
      0084C3 03 26            [ 2] 1109 	decw y 
      0084C5 0C 1E            [ 1] 1110 	jrne 1$
      0084C7 01               [ 4] 1111 	ret 
                                   1112 
                                   1113 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1114 ; check if A is a letter
                                   1115 ; input:
                                   1116 ;   A 			character to test 
                                   1117 ; output:
                                   1118 ;   C flag      1 true, 0 false 
                                   1119 ;-------------------------------------
      000504                       1120 is_alpha:
      0084C8 9F 91            [ 1] 1121 	cp a,#'A 
      0084CA D7               [ 1] 1122 	ccf
      0084CB 15 90            [ 1] 1123 	jrnc 9$ 
      0084CD 5C 17            [ 1] 1124 	cp a,#'Z+1 
      0084CF 03 20            [ 1] 1125 	jrc 9$ 
      0084D1 D0 61            [ 1] 1126 	cp a,#'a 
      0084D2 8C               [ 1] 1127 	ccf 
      0084D2 A1 02            [ 1] 1128 	jrnc 9$
      0084D4 27 CC            [ 1] 1129 	cp a,#'z+1   
      0084D6 A1               [ 4] 1130 9$: ret 	
                                   1131 
                                   1132 ;-------------------------------------
                                   1133 ;  program initialization entry point 
                                   1134 ;-------------------------------------
                           000001  1135 	MAJOR=1
                           000000  1136 	MINOR=0
      0084D7 0A 26 25 AE 17 18 CD  1137 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             82 F2 5C CD 84 64 90
             AE 17 18 CE 00 15 72
             FB 03 CD 83 10 AE 17
             18 CD 82 F2 5C 72 FB
             03 1F 03 20 A3 A1 04
             25 9F A1 09 22 9B 1E
             01 16 03 91 DF 15 A3
             97 81 26 26 72 A9 00
             02 90 89 CE 00 15 72
      00055B                       1138 cold_start:
                                   1139 ;set stack 
      00851D FB 01 5B         [ 2] 1140 	ldw x,#STACK_EMPTY
      008520 02               [ 1] 1141 	ldw sp,x   
                                   1142 ; clear all ram 
      008521 90               [ 1] 1143 0$: clr (x)
      008522 CE               [ 2] 1144 	decw x 
      008523 00 01            [ 1] 1145 	jrne 0$
                                   1146 ; activate pull up on all inputs 
      008525 72 A9            [ 1] 1147 	ld a,#255 
      008527 16 C8 CD         [ 1] 1148 	ld PA_CR1,a 
      00852A 83 10 CD         [ 1] 1149 	ld PB_CR1,a 
      00852D 82 F2 1C         [ 1] 1150 	ld PC_CR1,a 
      008530 00 03 72         [ 1] 1151 	ld PD_CR1,a 
      008533 FB 03 1F         [ 1] 1152 	ld PE_CR1,a 
      008536 03 20 09         [ 1] 1153 	ld PF_CR1,a 
      008539 72 A9 00         [ 1] 1154 	ld PG_CR1,a 
      00853C 02 17 03         [ 1] 1155 	ld PI_CR1,a 
                                   1156 ; select internal clock no divisor: 16 Mhz 	
      00853F CC 84            [ 1] 1157 	ld a,#CLK_SWR_HSI 
      008541 A2               [ 1] 1158 	clrw x  
      008542 CD 00 99         [ 4] 1159     call clock_init 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008542 AE 00 02         [ 4] 1160 	call timer4_init
                                   1161 ; UART3 at 115200 BAUD
      008545 16 03 90         [ 4] 1162 	call uart3_init
                                   1163 ; activate PE_4 (user button interrupt)
      008548 9F 72 D7 00      [ 1] 1164     bset PE_CR2,#USR_BTN_BIT 
                                   1165 ; display system information
      00854C 15 72 CE         [ 2] 1166 	ldw x,#software 
      00854F 00 15 27         [ 4] 1167 	call puts 
      008552 09 CD            [ 1] 1168 	ld a,#MAJOR 
      008554 83 FC 72         [ 1] 1169 	ld acc8,a 
      008557 5F               [ 1] 1170 	clrw x 
      008558 00 03 20         [ 2] 1171 	ldw acc24,x 
      00855B 13 0A            [ 1] 1172 	ld a,#10 
      00855C CD 09 55         [ 4] 1173 	call prti24 
      00855C CE 00            [ 1] 1174 	ld a,#'.
      00855E 15 CF 00         [ 4] 1175 	call putc 
      008561 04 E6            [ 1] 1176 	ld a,#MINOR 
      008563 02 C7 00         [ 1] 1177 	ld acc8,a 
      008566 03               [ 1] 1178 	clrw x 
      008567 FE CF 00         [ 2] 1179 	ldw acc24,x 
      00856A 06 35            [ 1] 1180 	ld a,#10 
      00856C 03 00 02         [ 4] 1181 	call prti24 
      00856F A6 0D            [ 1] 1182 	ld a,#CR 
      00856F 5B 04 72         [ 4] 1183 	call putc 
      008572 1B 00 25         [ 4] 1184 	call seek_fdrive 
                                   1185 ; configure LED2 pin 
      008575 81 1A 50 0D      [ 1] 1186     bset PC_CR1,#LED2_BIT
      008576 72 1A 50 0E      [ 1] 1187     bset PC_CR2,#LED2_BIT
      008576 AE 00 27 90      [ 1] 1188     bset PC_DDR,#LED2_BIT
      00857A AE               [ 1] 1189 	rim 
      00857B 00 34 7F         [ 2] 1190 	ldw x,#tib
      00857E 5C 90 5A         [ 2] 1191 	ldw array_addr,x 
      008581 26 FA 81 10      [ 1] 1192 	inc seedy+1 
      008584 72 5C 00 0E      [ 1] 1193 	inc seedx+1 
      008584 A1 41 8C         [ 4] 1194 	call clear_basic
      008587 24 0B A1         [ 4] 1195 	call ubound 
      00858A 5B 25 07         [ 4] 1196 	call dpop 
      00858D A1 61 8C         [ 2] 1197 	ldw array_size,x 
      008590 24 02 A1         [ 2] 1198     jp warm_start 
                                   1199 
                                   1200 ;---------------------------
                                   1201 ; reset BASIC text variables 
                                   1202 ; and clear variables 
                                   1203 ;---------------------------
      0005E6                       1204 clear_basic:
      008593 7B               [ 1] 1205 	clrw x 
      008594 81 0A 0A         [ 2] 1206 	ldw lineno,x
      008597 54 69 6E 79      [ 1] 1207 	clr count 
      00859B 20 42 41         [ 2] 1208 	ldw x,#free_ram 
      00859E 53 49 43         [ 2] 1209 	ldw txtbgn,x 
      0085A1 20 66 6F         [ 2] 1210 	ldw txtend,x 
      0085A4 72 20 53         [ 4] 1211 	call clear_vars 
      0085A7 54               [ 4] 1212 	ret 
                                   1213 
                                   1214 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1215 ;;   Tiny BASIC error messages     ;;
                                   1216 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005FB                       1217 err_msg:
      0085A8 4D 38 0A 43 6F 70 79  1218 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             72 69 67 68 74
      0085B4 2C 20 4A 61 63 71 75  1219 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             65 73 20
      0085BE 44 65                 1220 	.word err_no_access 
                                   1221 
      0085C0 73 63 68 65 6E 65 73  1222 err_mem_full: .asciz "\nMemory full\n" 
             20 32 30 31 39 2C 32
      0085CE 30 32 30 0A 76 65 72  1223 err_syntax: .asciz "\nsyntax error\n" 
             73 69 6F 6E 20 00 0A
             00
      0085DB 0A 6D 61 74 68 20 6F  1224 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0085DB AE 17 FF 94 7F 5A 26  1225 err_div0: .asciz "\ndivision by 0\n" 
             FC A6 FF C7 50 03 C7
             50 08
      0085EB C7 50 0D C7 50 12 C7  1226 err_no_line: .asciz "\ninvalid line number.\n"
             50 17 C7 50 1C C7 50
             21 C7 50 2B A6 E1 5F
             CD 81
      008602 19 CD 81 2F CD 81 F4  1227 err_run_only: .asciz "\nrun time only usage.\n" 
             72 18 50 18 AE 85 95
             CD 82 30 A6 01 C7 00
             0B 5F
      008619 CF 00 09 A6 0A CD 89  1228 err_cmd_only: .asciz "\ncommand line only usage.\n"
             D5 A6 2E CD 82 1E A6
             00 C7 00 0B 5F CF 00
             09 A6 0A CD 89 D5
      008634 A6 0D CD 82 1E CD 9B  1229 err_duplicate: .asciz "\nduplicate name.\n"
             2B 72 1A 50 0D 72 1A
             50 0E 72 1A
      008646 50 0C 9A AE 16 C8 CF  1230 err_not_file: .asciz "\nFile not found.\n"
             00 21 72 5C 00 11 72
             5C 00 0F CD
      008658 86 66 CD 93 F8 CD 90  1231 err_bad_value: .asciz "\nbad value.\n"
             22 CF 00 23 CC 87
      008665 EA 46 69 6C 65 20 69  1232 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
                                   1233 
      008666 6C 61 73 74 20 74 6F  1234 rt_msg: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                   1235 
      000718                       1236 syntax_error:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008666 5F CF            [ 1] 1237 	ld a,#ERR_SYNTAX 
                                   1238 
      00071A                       1239 tb_error:
      008668 00 06 72         [ 2] 1240 	ldw x, #err_msg 
      00866B 5F 00 03 AE      [ 1] 1241 	clr acc16 
      00866F 00               [ 1] 1242 	sll a
      008670 5B CF 00 1C      [ 1] 1243 	rlc acc16  
      008674 CF 00 1E         [ 1] 1244 	ld acc8, a 
      008677 CD 85 76 81      [ 2] 1245 	addw x,acc16 
      00867B FE               [ 2] 1246 	ldw x,(x)
      00867B 00 00 86         [ 4] 1247 	call puts
      00867E 93 86 A1 86 B0   [ 2] 1248 	btjf flags,#FCOMP, 1$
      008683 86 CA 86         [ 2] 1249 	ldw x,#tib
      008686 DA 86 F1         [ 4] 1250 	call puts 
      008689 87 08            [ 1] 1251 	ld a,#CR 
      00868B 87 23 87         [ 4] 1252 	call putc
      00868E 35 87 47         [ 2] 1253 	ldw x,in.w
      008691 87 54 0A         [ 4] 1254 	call spaces
      008694 4D 65            [ 1] 1255 	ld a,#'^
      008696 6D 6F 72         [ 4] 1256 	call putc 
      008699 79 20            [ 2] 1257 	jra 6$
      00869B 66 75 6C         [ 2] 1258 1$:	ldw x,basicptr
      00869E 6C 0A 00         [ 4] 1259 	call prt_basic_line
      0086A1 0A 73 79         [ 2] 1260 	ldw x,#rt_msg 
      0086A4 6E 74 61         [ 4] 1261 	call puts 
      0086A7 78 20 65         [ 2] 1262 	ldw x,in.w.saved 
      0086AA 72 72 6F 72      [ 4] 1263 	ld a,([basicptr],x)
      0086AE 0A               [ 1] 1264 	clrw x 
      0086AF 00               [ 1] 1265 	ld xl,a 
      0086B0 0A 6D 61         [ 4] 1266 	call print_int 
      0086B3 74 68 20         [ 2] 1267 6$: ldw x,#STACK_EMPTY 
      0086B6 6F               [ 1] 1268     ldw sp,x
      00076A                       1269 warm_start:
      0086B7 70 65 72 61      [ 1] 1270 	clr flags 
      0086BB 74 69 6F 6E      [ 1] 1271 	clr loop_depth 
      0086BF 20 6F 76         [ 2] 1272 	ldw x,#dstack_unf 
      0086C2 65 72 66         [ 2] 1273 	ldw dstkptr,x 
      0086C5 6C 6F 77 0A      [ 1] 1274 	mov tab_width,#TAB_WIDTH 
      0086C9 00 0A 64 69      [ 1] 1275 	mov base,#10 
      0086CD 76               [ 1] 1276 	clrw x 
      0086CE 69 73 69         [ 2] 1277 	ldw lineno,x 
      0086D1 6F 6E 20         [ 2] 1278 	ldw x,#tib 
      0086D4 62 79 20         [ 2] 1279 	ldw basicptr,x 
                                   1280 ;----------------------------
                                   1281 ;   BASIC interpreter
                                   1282 ;----------------------------
      00078A                       1283 interp:
      0086D7 30 0A 00 0A      [ 1] 1284 	clr in.w
      0086DB 69 6E 76 61 6C   [ 2] 1285 	btjf flags,#FRUN,4$ 
                                   1286 ; running program
                                   1287 ; goto next basic line 
      0086E0 69 64 20         [ 2] 1288 	ldw x,basicptr
      0086E3 6C 69            [ 1] 1289 	ld a,(2,x) ; line length 
      0086E5 6E 65 20         [ 1] 1290 	ld acc8,a 
      0086E8 6E 75 6D 62      [ 1] 1291 	clr acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0086EC 65 72 2E 0A      [ 2] 1292 	addw x,acc16
      0086F0 00 0A 72         [ 2] 1293 	cpw x,txtend 
      0086F3 75 6E            [ 1] 1294 	jrpl warm_start
      0086F5 20 74 69         [ 2] 1295 	ldw basicptr,x ; start of next line  
      0086F8 6D 65            [ 1] 1296 	ld a,(2,x)
      0086FA 20 6F 6E         [ 1] 1297 	ld count,a 
      0086FD 6C               [ 2] 1298 	ldw x,(x) ; line no 
      0086FE 79 20 75         [ 2] 1299 	ldw lineno,x 
      008701 73 61 67 65      [ 1] 1300 	mov in,#3 ; skip first 3 bytes of line 
      008705 2E 0A            [ 2] 1301 	jra interp_loop 
      0007BA                       1302 4$: ; commande line mode 	
      008707 00 0A 63 6F      [ 1] 1303 	clr in
      00870B 6D 6D            [ 1] 1304 	ld a,#CR 
      00870D 61 6E 64         [ 4] 1305 	call putc 
      008710 20 6C            [ 1] 1306 	ld a,#'> 
      008712 69 6E 65         [ 4] 1307 	call putc 
      008715 20 6F 6E         [ 4] 1308 	call readln
      008718 6C 79 20         [ 4] 1309 	call compile
      0007CE                       1310 interp_loop:  
      00871B 75 73 61         [ 1] 1311 	ld a,in 
      00871E 67 65 2E         [ 1] 1312 	cp a,count  
      008721 0A 00            [ 1] 1313 	jrpl interp
      008723 0A 64 75         [ 4] 1314 	call next_token
      008726 70 6C            [ 1] 1315 	cp a,#TK_COLON 
      008728 69 63            [ 1] 1316 	jreq interp_loop 
      00872A 61 74            [ 1] 1317 	cp a,#TK_NONE 
                                   1318 ;	jreq interp 
      0007DF                       1319 1$:
      00872C 65 20            [ 1] 1320 	cp a,#TK_VAR
      00872E 6E 61            [ 1] 1321 	jrne 2$
      008730 6D 65 2E         [ 4] 1322 	call let02  
      008733 0A 00            [ 2] 1323 	jra interp_loop 
      0007E8                       1324 2$:	
      008735 0A 46            [ 1] 1325 	cp a,#TK_ARRAY 
      008737 69 6C            [ 1] 1326 	jrne 3$
      008739 65 20 6E         [ 4] 1327 	call get_array_element
      00873C 6F 74 20         [ 4] 1328 	call let02 
      00873F 66 6F            [ 2] 1329 	jra interp_loop 
      0007F4                       1330 3$:
      008741 75 6E            [ 1] 1331 	cp a,#TK_CMD
      008743 64 2E            [ 1] 1332 	jrne 4$
      008745 0A               [ 4] 1333 	call (x) 
      008746 00 0A            [ 2] 1334 	jra interp_loop 
      0007FB                       1335 4$:	
      008748 62 61 64         [ 2] 1336 	jp syntax_error 
                                   1337 
                                   1338 ;--------------------------
                                   1339 ; extract next token from
                                   1340 ; token list 
                                   1341 ; basicptr -> base address 
                                   1342 ; in  -> offset in list array 
                                   1343 ; output:
                                   1344 ;   A 		token attribute
                                   1345 ;   X 		token value if there is one
                                   1346 ;----------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0007FE                       1347 next_token:
      00874B 20 76            [ 1] 1348 	push #0
      00874D 61 6C 75         [ 1] 1349 	ld a,in 
      008750 65 2E 0A         [ 1] 1350 	cp a,count 
      008753 00               [ 1] 1351 	pop a 
      008754 0A 46            [ 1] 1352 	jrpl 9$ 
      008756 69 6C 65         [ 2] 1353 	ldw x,in.w 
      008759 20 69 6E         [ 2] 1354 	ldw in.w.saved,x 
      00875C 20 65 78         [ 2] 1355 	ldw x,basicptr 
      00875F 74 65 6E 64      [ 4] 1356 	ld a,([in.w],x)
      008763 65 64 20 6D      [ 1] 1357 	inc in 
      008767 65 6D            [ 1] 1358 	cp a,#TK_ARRAY  
      008769 6F 72            [ 2] 1359 	jrule 9$
      00876B 79 2C            [ 1] 1360 	cp a,#TK_CHAR
      00876D 20 63            [ 1] 1361 	jrne 1$
      00876F 61 6E 27 74      [ 4] 1362 	ld a,([in.w],x)
      008773 20 62 65 20      [ 1] 1363 	inc in
      008777 72               [ 1] 1364 	clrw x 
      008778 75               [ 1] 1365 	ld xl,a 
      008779 6E 20            [ 1] 1366 	ld a,#TK_CHAR
      00877B 66               [ 4] 1367 	ret 
      00877C 72 6F            [ 1] 1368 1$:	cp a,#TK_QSTR 
      00877E 6D 20            [ 1] 1369 	jrugt 9$
      008780 74 68            [ 1] 1370 	jrult 2$
      008782 65 72 65 2E      [ 2] 1371 	addw x,in.w 
      008786 0A 00            [ 2] 1372 	jra 9$
      008788 6C 61 73 74      [ 5] 1373 2$: ldw x,([in.w],x)
      00878C 20 74 6F 6B      [ 1] 1374 	inc in 
      008790 65 6E 20 69      [ 1] 1375 	inc in
      008794 64               [ 4] 1376 9$: ret	
                                   1377 
                                   1378 
                                   1379 ;----------------------------------------
                                   1380 ;   DEBUG support functions
                                   1381 ;----------------------------------------
                           000001  1382 .if DEBUG 
                                   1383 ; turn LED on 
      000848                       1384 ledon:
      008795 3A 20 00 0A      [ 1] 1385     bset PC_ODR,#LED2_BIT
      008798 81               [ 4] 1386     ret 
                                   1387 
                                   1388 ; turn LED off 
      00084D                       1389 ledoff:
      008798 A6 02 50 0A      [ 1] 1390     bres PC_ODR,#LED2_BIT 
      00879A 81               [ 4] 1391     ret 
                                   1392 
                                   1393 ; invert LED status 
      000852                       1394 ledtoggle:
      00879A AE 86            [ 1] 1395     ld a,#LED2_MASK
      00879C 7B 72 5F         [ 1] 1396     xor a,PC_ODR
      00879F 00 0A 48         [ 1] 1397     ld PC_ODR,a
      0087A2 72               [ 4] 1398     ret 
                                   1399 
      00085B                       1400 left_paren:
      0087A3 59 00            [ 1] 1401 	ld a,#SPACE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0087A5 0A C7 00         [ 4] 1402 	call putc
      0087A8 0B 72            [ 1] 1403 	ld a,#'( 
      0087AA BB 00 0A         [ 4] 1404 	call putc 	
      0087AD FE               [ 4] 1405 	ret 
                                   1406 
                                   1407 ;------------------------------
                                   1408 ; print 8 bit register 
                                   1409 ; input:
                                   1410 ;   X  point to register name 
                                   1411 ;   A  register value to print 
                                   1412 ; output:
                                   1413 ;   none
                                   1414 ;------------------------------- 
      000866                       1415 prt_reg8:
      0087AE CD               [ 1] 1416 	push a 
      0087AF 82 30 72         [ 4] 1417 	call puts 
      0087B2 0B 00            [ 1] 1418 	ld a,(1,sp) 
      0087B4 25 18 AE         [ 1] 1419 	ld acc8,a 
      0087B7 16               [ 1] 1420 	clrw x 
      0087B8 C8               [ 1] 1421 	ld xl,a 
      0087B9 CD 82 30 A6      [ 1] 1422 	mov base,#16
      0087BD 0D CD 82         [ 4] 1423 	call print_int 
      0087C0 1E CE 00         [ 4] 1424 	call left_paren 
      0087C3 01               [ 1] 1425 	pop a 
      0087C4 CD               [ 1] 1426 	clrw x 
      0087C5 82               [ 1] 1427 	ld xl,a 
      0087C6 58 A6 5E CD      [ 1] 1428 	mov base,#10 
      0087CA 82 1E 20         [ 4] 1429 	call print_int  
      0087CD 18 CE            [ 1] 1430 	ld a,#') 
      0087CF 00 04 CD         [ 4] 1431 	call putc
      0087D2 95               [ 4] 1432 	ret
                                   1433 
                                   1434 ;--------------------------------
                                   1435 ; print 16 bits register 
                                   1436 ; input:
                                   1437 ;   X   point register name 
                                   1438 ;   Y   register value to print 
                                   1439 ; output:
                                   1440 ;  none
                                   1441 ;--------------------------------
      00088B                       1442 prt_reg16: 
      0087D3 01 AE            [ 2] 1443 	pushw y 
      0087D5 87 88 CD         [ 4] 1444 	call puts 
      0087D8 82 30            [ 2] 1445 	ldw x,(1,sp) 
      0087DA CE 00 12 72      [ 1] 1446 	mov base,#16 
      0087DE D6 00 04         [ 4] 1447 	call print_int  
      0087E1 5F 97 CD         [ 4] 1448 	call left_paren 
      0087E4 8A               [ 2] 1449 	popw x 
      0087E5 1D AE 17 FF      [ 1] 1450 	mov base,#10 
      0087E9 94 09 9D         [ 4] 1451 	call print_int  
      0087EA A6 29            [ 1] 1452 	ld a,#') 
      0087EA 72 5F 00         [ 4] 1453 	call putc
      0087ED 25               [ 4] 1454 	ret 
                                   1455 
                                   1456 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1457 ; print registers contents saved on
                                   1458 ; stack by trap interrupt.
                                   1459 ;------------------------------------
      0008AA                       1460 print_registers:
      0087EE 72 5F 00         [ 2] 1461 	ldw x,#STATES
      0087F1 20 AE 17         [ 4] 1462 	call puts
                                   1463 ; print EPC 
      0087F4 80 CF 00         [ 2] 1464 	ldw x, #REG_EPC
      0087F7 1A 35 04         [ 4] 1465 	call puts 
      0087FA 00 26            [ 1] 1466 	ld a, (11,sp)
      0087FC 35 0A 00         [ 1] 1467 	ld acc8,a 
      0087FF 08 5F            [ 1] 1468 	ld a, (10,sp) 
      008801 CF 00 06         [ 1] 1469 	ld acc16,a 
      008804 AE 16            [ 1] 1470 	ld a,(9,sp) 
      008806 C8 CF 00         [ 1] 1471 	ld acc24,a
      008809 04               [ 1] 1472 	clrw x  
      00880A A6 10            [ 1] 1473 	ld a,#16
      00880A 72 5F 00         [ 4] 1474 	call prti24  
                                   1475 ; print X
      00880D 01 72 01         [ 2] 1476 	ldw x,#REG_X
      008810 00 25            [ 2] 1477 	ldw y,(5,sp)
      008812 27 CE 00         [ 4] 1478 	call prt_reg16  
                                   1479 ; print Y 
      008815 04 E6 02         [ 2] 1480 	ldw x,#REG_Y
      008818 C7 00            [ 2] 1481 	ldw y, (7,sp)
      00881A 0B 72 5F         [ 4] 1482 	call prt_reg16  
                                   1483 ; print A 
      00881D 00 0A 72         [ 2] 1484 	ldw x,#REG_A
      008820 BB 00            [ 1] 1485 	ld a, (4,sp) 
      008822 0A C3 00         [ 4] 1486 	call prt_reg8
                                   1487 ; print CC 
      008825 1E 2A C2         [ 2] 1488 	ldw x,#REG_CC 
      008828 CF 00            [ 1] 1489 	ld a, (3,sp) 
      00882A 04 E6 02         [ 4] 1490 	call prt_reg8 
                                   1491 ; print SP 
      00882D C7 00 03         [ 2] 1492 	ldw x,#REG_SP
      008830 FE CF            [ 1] 1493 	ldw y,sp 
      008832 00 06 35 03      [ 2] 1494 	addw y,#12
      008836 00 02 20         [ 4] 1495 	call prt_reg16  
      008839 14 0A            [ 1] 1496 	ld a,#'\n' 
      00883A CD 01 9E         [ 4] 1497 	call putc
      00883A 72               [ 4] 1498 	ret
                                   1499 
      00883B 5F 00 02 A6 0D CD 82  1500 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             1E A6 3E CD 82 1E CD
             8B 0B CD 84 73 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      00884E 45 50 43 3A 00        1501 REG_EPC: .asciz "EPC:"
      00884E C6 00 02 C1           1502 REG_Y:   .asciz "\nY:" 
      008852 00 03 2A B4           1503 REG_X:   .asciz "\nX:"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008856 CD 88 7E A1           1504 REG_A:   .asciz "\nA:" 
      00885A 01 27 F1 A1 00        1505 REG_CC:  .asciz "\nCC:"
      00885F 0A 53 50 3A 00        1506 REG_SP:  .asciz "\nSP:"
                                   1507 .endif ; DEBUG 
                                   1508 
                                   1509 ;------------------------------------
                                   1510 ; print integer in acc24 
                                   1511 ; input:
                                   1512 ;	acc24 		integer to print 
                                   1513 ;	A 			numerical base for conversion 
                                   1514 ;               if bit 7 is set add a space at print end.
                                   1515 ;   XL 			field width, 0 -> no fill.
                                   1516 ;  output:
                                   1517 ;    none 
                                   1518 ;------------------------------------
                           000001  1519 	WIDTH = 1
                           000002  1520 	BASE = 2
                           000003  1521 	ADD_SPACE=3 ; add a space after number 
                           000003  1522 	VSIZE = 3
      000955                       1523 prti24:
      000955                       1524 	_vars VSIZE 
      00885F A1 05            [ 2]    1     sub sp,#VSIZE 
      008861 26 05            [ 1] 1525 	clr (ADD_SPACE,sp)
      008863 CD 94            [ 1] 1526 	bcp a,#0x80 
      008865 10 20            [ 1] 1527 	jreq 0$ 
      008867 E6 03            [ 1] 1528 	cpl (ADD_SPACE,sp)
      008868 A4 1F            [ 1] 1529 0$:	and a,#31 
      008868 A1 02            [ 1] 1530 	ld (BASE,sp),a
      00886A 26               [ 1] 1531 	ld a,xl
      00886B 08 CD            [ 1] 1532 	ld (WIDTH,sp),a 
      00886D 92 66            [ 1] 1533 	ld a, (BASE,sp)  
      00886F CD 94 10         [ 4] 1534     call itoa  ; conversion entier en  .asciz
      008872 20 DA            [ 1] 1535 1$: ld a,(WIDTH,sp)
      008874 27 1F            [ 1] 1536 	jreq 4$
      008874 A1 06 26         [ 1] 1537 	ld acc8,a 
      008877 03               [ 2] 1538 	pushw x 
      008878 FD 20 D3         [ 4] 1539 	call strlen 
      00887B 9F               [ 1] 1540 	ld a,xl 
      00887B CC               [ 2] 1541 	popw x 
      00887C 87 98 0A         [ 3] 1542 	exg a,acc8 
      00887E C0 00 0A         [ 1] 1543 	sub a,acc8 
      00887E 4B 00            [ 1] 1544 	jrmi 4$
      008880 C6 00            [ 1] 1545 	ld (WIDTH,sp),a 
      008882 02 C1            [ 1] 1546 	ld  a,#SPACE
      008884 00 03            [ 1] 1547 3$: tnz (WIDTH,sp)
      008886 84 2A            [ 1] 1548 	jreq 4$
      008888 3E               [ 2] 1549 	decw x 
      008889 CE               [ 1] 1550 	ld (x),a 
      00888A 00 01            [ 1] 1551 	dec (WIDTH,sp) 
      00888C CF 00            [ 2] 1552 	jra 3$
      00098E                       1553 4$: 
      00888E 12 CE 00         [ 4] 1554 	call puts 
      008891 04 72            [ 1] 1555 	tnz (ADD_SPACE,sp)
      008893 D6 00            [ 1] 1556 	jreq 5$
      008895 01 72            [ 1] 1557     ld a,#SPACE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008897 5C 00 02         [ 4] 1558 	call putc 
      00099A                       1559 5$: _drop VSIZE 
      00889A A1 02            [ 2]    1     addw sp,#VSIZE 
      00889C 23               [ 4] 1560     ret	
                                   1561 
                                   1562 ;-----------------------------------
                                   1563 ; print a 16 bit integer 
                                   1564 ; using variable 'base' as conversion
                                   1565 ; format.
                                   1566 ; input:
                                   1567 ;   X       integer to print 
                                   1568 ;   base    conversion base 
                                   1569 ; output:
                                   1570 ;   none 
                                   1571 ;-----------------------------------
                           000001  1572 	SIGN=1
                           000001  1573 	VSIZE=1
      00099D                       1574 print_int: 
      00099D                       1575 	_vars VSIZE 
      00889D 29 A1            [ 2]    1     sub sp,#VSIZE 
      00889F 03 26            [ 1] 1576 	clr (SIGN,sp)
      0088A1 0D 72 D6 00      [ 2] 1577 	ldw y,#pad+PAD_SIZE-1 
      0088A5 01 72            [ 1] 1578 	clr (y)
      0088A7 5C 00 02         [ 1] 1579 	ld a,base  
      0088AA 5F 97            [ 1] 1580 	cp a,#10 
      0088AC A6 03            [ 1] 1581 	jrne 1$ 
      0088AE 81               [ 2] 1582 	tnzw x 
      0088AF A1 0A            [ 1] 1583 	jrpl 1$ 
      0088B1 22 14            [ 1] 1584 	cpl (SIGN,sp)
      0088B3 25               [ 2] 1585 	negw x 	 
      0009B4                       1586 1$:	
      0088B4 06 72 BB         [ 1] 1587 	ld a,base 
      0088B7 00               [ 2] 1588 	div x,a 
      0088B8 01 20            [ 1] 1589 	add a,#'0 
      0088BA 0C 72            [ 1] 1590 	cp a,#'9+1 
      0088BC DE 00            [ 1] 1591 	jrmi 2$ 
      0088BE 01 72            [ 1] 1592 	add a,#7 
      0088C0 5C 00            [ 2] 1593 2$: decw y 
      0088C2 02 72            [ 1] 1594 	ld (y),a 
      0088C4 5C               [ 2] 1595 	tnzw x 
      0088C5 00 02            [ 1] 1596 	jrne 1$ 
      0088C7 81 10            [ 1] 1597 	ld a,#16 
      0088C8 C1 00 07         [ 1] 1598 	cp a,base 
      0088C8 72 1A            [ 1] 1599 	jrne 3$
      0088CA 50 0A            [ 1] 1600 	ld a,#'$
      0088CC 81 5A            [ 2] 1601 	decw y  
      0088CD 90 F7            [ 1] 1602 	ld (y),a
      0088CD 72 1B            [ 2] 1603 	jra 9$ 
      0088CF 50 0A            [ 1] 1604 3$: tnz (SIGN,sp)
      0088D1 81 06            [ 1] 1605 	jreq 9$ 
      0088D2 A6 2D            [ 1] 1606 	ld a,#'-
      0088D2 A6 20            [ 2] 1607 	decw y  
      0088D4 C8 50            [ 1] 1608 	ld (y),a
      0009E0                       1609 9$:	
      0088D6 0A               [ 1] 1610 	ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0088D7 C7 50 0A         [ 2] 1611 	subw x,#pad+PAD_SIZE-1 
      0088DA 81               [ 2] 1612 	negw x  
      0088DB                       1613 10$:
      0088DB A6 20            [ 2] 1614 	decw y 
      0088DD CD 82            [ 1] 1615 	ld a,#SPACE 
      0088DF 1E A6            [ 1] 1616 	ld (y),a
      0088E1 28               [ 1] 1617 	incw x 
      0088E2 CD               [ 1] 1618 	ld a,xl 
      0088E3 82 1E 81         [ 1] 1619 	cp a,tab_width
      0088E6 2B F3            [ 1] 1620 	jrmi 10$ 
      0009F2                       1621 12$:
      0088E6 88               [ 1] 1622     ldw x,y 
      0088E7 CD 82 30         [ 4] 1623 	call puts  
      0009F6                       1624 	_drop VSIZE 
      0088EA 7B 01            [ 2]    1     addw sp,#VSIZE 
      0088EC C7               [ 4] 1625 	ret 
                                   1626 
                                   1627 ;------------------------------------
                                   1628 ; convert integer in acc24 to string
                                   1629 ; input:
                                   1630 ;   A	  	base
                                   1631 ;	acc24	integer to convert
                                   1632 ; output:
                                   1633 ;   X  		pointer to string
                                   1634 ;------------------------------------
                           000001  1635 	SIGN=1  ; integer sign 
                           000002  1636 	BASE=2  ; numeric base 
                           000002  1637 	VSIZE=2  ;locals size
      0009F9                       1638 itoa:
      0088ED 00 0B            [ 2] 1639 	sub sp,#VSIZE
      0088EF 5F 97            [ 1] 1640 	ld (BASE,sp), a  ; base
      0088F1 35 10            [ 1] 1641 	clr (SIGN,sp)    ; sign
      0088F3 00 08            [ 1] 1642 	cp a,#10
      0088F5 CD 8A            [ 1] 1643 	jrne 1$
                                   1644 	; base 10 string display with negative sign if bit 23==1
      0088F7 1D CD 88 DB 84   [ 2] 1645 	btjf acc24,#7,1$
      0088FC 5F 97            [ 1] 1646 	cpl (SIGN,sp)
      0088FE 35 0A 00         [ 4] 1647 	call neg_acc24
      000A0D                       1648 1$:
                                   1649 ; initialize string pointer 
      008901 08 CD 8A         [ 2] 1650 	ldw x,#pad+PAD_SIZE-1
      008904 1D               [ 1] 1651 	clr (x)
      000A11                       1652 itoa_loop:
      008905 A6 29            [ 1] 1653     ld a,(BASE,sp)
      008907 CD 82 1E         [ 4] 1654     call divu24_8 ; acc24/A 
      00890A 81 30            [ 1] 1655     add a,#'0  ; remainder of division
      00890B A1 3A            [ 1] 1656     cp a,#'9+1
      00890B 90 89            [ 1] 1657     jrmi 2$
      00890D CD 82            [ 1] 1658     add a,#7 
      00890F 30               [ 2] 1659 2$: decw x
      008910 1E               [ 1] 1660     ld (x),a
                                   1661 	; if acc24==0 conversion done
      008911 01 35 10         [ 1] 1662 	ld a,acc24
      008914 00 08 CD         [ 1] 1663 	or a,acc16
      008917 8A 1D CD         [ 1] 1664 	or a,acc8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      00891A 88 DB            [ 1] 1665     jrne itoa_loop
                                   1666 	;conversion done, next add '$' or '-' as required
      00891C 85 35            [ 1] 1667 	ld a,(BASE,sp)
      00891E 0A 00            [ 1] 1668 	cp a,#16
      008920 08 CD            [ 1] 1669 	jreq 8$
      008922 8A 1D            [ 1] 1670 	ld a,(SIGN,sp)
      008924 A6 29            [ 1] 1671     jreq 10$
      008926 CD 82            [ 1] 1672     ld a,#'-
      008928 1E 81            [ 2] 1673 	jra 9$ 
      00892A A6 24            [ 1] 1674 8$: ld a,#'$ 
      00892A AE               [ 2] 1675 9$: decw x
      00892B 89               [ 1] 1676     ld (x),a
      000A3D                       1677 10$:
      00892C 7D CD            [ 2] 1678 	addw sp,#VSIZE
      00892E 82               [ 4] 1679 	ret
                                   1680 
                                   1681 ;-------------------------------------
                                   1682 ; divide uint24_t by uint8_t
                                   1683 ; used to convert uint24_t to string
                                   1684 ; input:
                                   1685 ;	acc24	dividend
                                   1686 ;   A 		divisor
                                   1687 ; output:
                                   1688 ;   acc24	quotient
                                   1689 ;   A		remainder
                                   1690 ;------------------------------------- 
                                   1691 ; offset  on sp of arguments and locals
                           000001  1692 	U8   = 1   ; divisor on stack
                           000001  1693 	VSIZE =1
      000A40                       1694 divu24_8:
      00892F 30               [ 2] 1695 	pushw x ; save x
      008930 AE               [ 1] 1696 	push a 
                                   1697 	; ld dividend UU:MM bytes in X
      008931 89 BA CD         [ 1] 1698 	ld a, acc24
      008934 82               [ 1] 1699 	ld xh,a
      008935 30 7B 0B         [ 1] 1700 	ld a,acc24+1
      008938 C7               [ 1] 1701 	ld xl,a
      008939 00 0B            [ 1] 1702 	ld a,(U8,SP) ; divisor
      00893B 7B               [ 2] 1703 	div x,a ; UU:MM/U8
      00893C 0A               [ 1] 1704 	push a  ;save remainder
      00893D C7               [ 1] 1705 	ld a,xh
      00893E 00 0A 7B         [ 1] 1706 	ld acc24,a
      008941 09               [ 1] 1707 	ld a,xl
      008942 C7 00 09         [ 1] 1708 	ld acc24+1,a
      008945 5F               [ 1] 1709 	pop a
      008946 A6               [ 1] 1710 	ld xh,a
      008947 10 CD 89         [ 1] 1711 	ld a,acc24+2
      00894A D5               [ 1] 1712 	ld xl,a
      00894B AE 89            [ 1] 1713 	ld a,(U8,sp) ; divisor
      00894D C3               [ 2] 1714 	div x,a  ; R:LL/U8
      00894E 16 05            [ 1] 1715 	ld (U8,sp),a ; save remainder
      008950 CD               [ 1] 1716 	ld a,xl
      008951 89 0B AE         [ 1] 1717 	ld acc24+2,a
      008954 89               [ 1] 1718 	pop a
      008955 BF               [ 2] 1719 	popw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008956 16               [ 4] 1720 	ret
                                   1721 
                                   1722 ;------------------------------------
                                   1723 ;  two's complement acc24
                                   1724 ;  input:
                                   1725 ;		acc24 variable
                                   1726 ;  output:
                                   1727 ;		acc24 variable
                                   1728 ;-------------------------------------
      000A68                       1729 neg_acc24:
      008957 07 CD 89 0B      [ 1] 1730 	cpl acc24+2
      00895B AE 89 C7 7B      [ 1] 1731 	cpl acc24+1
      00895F 04 CD 88 E6      [ 1] 1732 	cpl acc24
      008963 AE 89            [ 1] 1733 	ld a,#1
      008965 CB 7B 03         [ 1] 1734 	add a,acc24+2
      008968 CD 88 E6         [ 1] 1735 	ld acc24+2,a
      00896B AE               [ 1] 1736 	clr a
      00896C 89 D0 90         [ 1] 1737 	adc a,acc24+1
      00896F 96 72 A9         [ 1] 1738 	ld acc24+1,a 
      008972 00               [ 1] 1739 	clr a 
      008973 0C CD 89         [ 1] 1740 	adc a,acc24 
      008976 0B A6 0A         [ 1] 1741 	ld acc24,a 
      008979 CD               [ 4] 1742 	ret
                                   1743 
                                   1744 
                                   1745 ;------------------------------------
                                   1746 ; read a line of text from terminal
                                   1747 ; input:
                                   1748 ;	none
                                   1749 ; local variable on stack:
                                   1750 ;	LL  line length
                                   1751 ;   RXCHAR last received chaaracte 
                                   1752 ; output:
                                   1753 ;   text in tib  buffer
                                   1754 ;------------------------------------
                                   1755 	; local variables
                           000001  1756 	LL_HB=1
                           000001  1757 	RXCHAR = 1 ; last char received
                           000002  1758 	LL = 2  ; accepted line length
                           000002  1759 	VSIZE=2 
      000A8B                       1760 readln:
      00897A 82               [ 1] 1761 	clrw x 
      00897B 1E               [ 2] 1762 	pushw x 
      00897C 81 0A 52 65      [ 2] 1763  	ldw y,#tib ; input buffer
      000A91                       1764 readln_loop:
      008980 67 69 73         [ 4] 1765 	call getc
      008983 74 65            [ 1] 1766 	ld (RXCHAR,sp),a
      008985 72 73            [ 1] 1767 	cp a,#CR
      008987 20 73            [ 1] 1768 	jrne 1$
      008989 74 61 74         [ 2] 1769 	jp readln_quit
      00898C 65 20            [ 1] 1770 1$:	cp a,#NL
      00898E 61 74            [ 1] 1771 	jreq readln_quit
      008990 20 61            [ 1] 1772 	cp a,#BSP
      008992 62 6F            [ 1] 1773 	jreq del_back
      008994 72 74            [ 1] 1774 	cp a,#CTRL_D
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008996 20 70            [ 1] 1775 	jreq del_ln
      008998 6F 69            [ 1] 1776 	cp a,#CTRL_R 
      00899A 6E 74            [ 1] 1777 	jreq reprint 
                                   1778 ;	cp a,#'[
                                   1779 ;	jreq ansi_seq
      000AAD                       1780 final_test:
      00899C 2E 0A            [ 1] 1781 	cp a,#SPACE
      00899E 2D 2D            [ 1] 1782 	jrpl accept_char
      0089A0 2D 2D            [ 2] 1783 	jra readln_loop
      000AB3                       1784 ansi_seq:
                                   1785 ;	call getc
                                   1786 ;	cp a,#'C 
                                   1787 ;	jreq rigth_arrow
                                   1788 ;	cp a,#'D 
                                   1789 ;	jreq left_arrow 
                                   1790 ;	jra final_test
      000AB3                       1791 right_arrow:
                                   1792 ;	ld a,#BSP 
                                   1793 ;	call putc 
                                   1794 ;	jra realn_loop 
      000AB3                       1795 left_arrow:
                                   1796 
                                   1797 ;	jra readln_loop
      000AB3                       1798 reprint: 
      0089A2 2D 2D            [ 1] 1799 	tnz (LL,sp)
      0089A4 2D 2D            [ 1] 1800 	jrne readln_loop
      0089A6 2D 2D 2D         [ 2] 1801 	ldw x,#tib 
      0089A9 2D 2D 2D         [ 4] 1802 	call strlen 
      0089AC 2D 2D 2D 2D      [ 2] 1803 	ldw y,#tib 
      0089B0 2D               [ 1] 1804 	ld a,xl
      0089B1 2D 2D            [ 1] 1805 	jreq readln_loop
      0089B3 2D 2D            [ 1] 1806 	ld (LL,sp),a 
      0089B5 2D 2D 2D         [ 2] 1807 	ldw x,#tib 
      0089B8 0A 00 45         [ 4] 1808 	call puts
      0089BB 50 43            [ 1] 1809 	clr (LL_HB,sp)
      0089BD 3A 00 0A         [ 2] 1810 	addw y,(LL_HB,sp)
      0089C0 59 3A            [ 2] 1811 	jra readln_loop 
      000AD3                       1812 del_ln:
      0089C2 00 0A            [ 1] 1813 	ld a,(LL,sp)
      0089C4 58 3A 00         [ 4] 1814 	call delete
      0089C7 0A 41 3A 00      [ 2] 1815 	ldw y,#tib
      0089CB 0A 43            [ 1] 1816 	clr (y)
      0089CD 43 3A            [ 1] 1817 	clr (LL,sp)
      0089CF 00 0A            [ 2] 1818 	jra readln_loop
      000AE2                       1819 del_back:
      0089D1 53 50            [ 1] 1820     tnz (LL,sp)
      0089D3 3A 00            [ 1] 1821     jreq readln_loop
      0089D5 0A 02            [ 1] 1822     dec (LL,sp)
      0089D5 52 03            [ 2] 1823     decw y
      0089D7 0F 03            [ 1] 1824     clr  (y)
      0089D9 A5 80 27         [ 4] 1825     call bksp 
      0089DC 02 03            [ 2] 1826     jra readln_loop	
      000AF1                       1827 accept_char:
      0089DE 03 A4            [ 1] 1828 	ld a,#TIB_SIZE-1
      0089E0 1F 6B            [ 1] 1829 	cp a, (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      0089E2 02 9F            [ 1] 1830 	jreq readln_loop
      0089E4 6B 01            [ 1] 1831 	ld a,(RXCHAR,sp)
      0089E6 7B 02            [ 1] 1832 	ld (y),a
      0089E8 CD 8A            [ 1] 1833 	inc (LL,sp)
      0089EA 79 7B            [ 1] 1834 	incw y
      0089EC 01 27            [ 1] 1835 	clr (y)
      0089EE 1F C7 00         [ 4] 1836 	call putc 
      0089F1 0B 89            [ 2] 1837 	jra readln_loop
      000B06                       1838 readln_quit:
      0089F3 CD 82            [ 1] 1839 	clr (y)
      0089F5 F2 9F            [ 1] 1840 	ld a,(LL,sp)
      0089F7 85 31 00         [ 1] 1841 	ld count,a 
      000B0D                       1842 	_drop VSIZE 
      0089FA 0B C0            [ 2]    1     addw sp,#VSIZE 
      0089FC 00 0B            [ 1] 1843 	ld a,#CR
      0089FE 2B 0E 6B         [ 4] 1844 	call putc
      008A01 01               [ 4] 1845 	ret
                                   1846 
                           000001  1847 .if DEBUG 	
                                   1848 ;----------------------------
                                   1849 ; command interface
                                   1850 ; only 3 commands:
                                   1851 ;  'q' to resume application
                                   1852 ;  'p [addr]' to print memory values 
                                   1853 ;  's addr' to print string 
                                   1854 ;----------------------------
                                   1855 ;local variable 
                           000001  1856 	PSIZE=1
                           000001  1857 	VSIZE=1 
      000B15                       1858 cmd_itf:
      008A02 A6 20            [ 2] 1859 	sub sp,#VSIZE 
      008A04 0D 01 27 06      [ 1] 1860 	clr farptr 
      008A08 5A F7 0A 01      [ 1] 1861 	clr farptr+1 
      008A0C 20 F6 00 15      [ 1] 1862 	clr farptr+2  
      008A0E                       1863 repl:
      008A0E CD 82            [ 1] 1864 	ld a,#CR 
      008A10 30 0D 03         [ 4] 1865 	call putc 
      008A13 27 05            [ 1] 1866 	ld a,#'? 
      008A15 A6 20 CD         [ 4] 1867 	call putc
      008A18 82 1E 5B 03      [ 1] 1868 	clr in.w 
      008A1C 81 5F 00 01      [ 1] 1869 	clr in 
      008A1D CD 0A 8B         [ 4] 1870 	call readln
      008A1D 52 01 0F 01      [ 2] 1871 	ldw y,#tib  
      008A21 90 AE            [ 1] 1872 	ld a,(y)
      008A23 17 3F            [ 1] 1873 	jreq repl  
      008A25 90 7F C6 00      [ 1] 1874 	inc in 
      008A29 08 A1 0A         [ 4] 1875 	call to_upper 
      008A2C 26 06            [ 1] 1876 	cp a,#'Q 
      008A2E 5D 2A            [ 1] 1877 	jrne test_p
      000B4B                       1878 repl_exit:
      008A30 03 03 01 50      [ 1] 1879 	clr tib 
      008A34 72 5F 00 02      [ 1] 1880 	clr count 
      008A34 C6 00 08 62      [ 1] 1881 	clr in 
      000B57                       1882 	_drop #VSIZE 	
      008A38 AB 30            [ 2]    1     addw sp,##VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A3A A1               [ 4] 1883 	ret  
      000B5A                       1884 invalid:
      008A3B 3A 2B 02         [ 2] 1885 	ldw x,#invalid_cmd 
      008A3E AB 07 90         [ 4] 1886 	call puts 
      008A41 5A 90            [ 2] 1887 	jra repl 
      000B62                       1888 test_p:	
      008A43 F7 5D            [ 1] 1889     cp a,#'P 
      008A45 26 ED            [ 1] 1890 	jreq mem_peek
      008A47 A6 10            [ 1] 1891     cp a,#'S 
      008A49 C1 00            [ 1] 1892 	jrne invalid 
      000B6A                       1893 print_string:	
      008A4B 08 26 08         [ 4] 1894 	call get_token
      008A4E A6 24            [ 1] 1895 	cp a,#TK_INTGR 
      008A50 90 5A            [ 1] 1896 	jrne invalid 
      008A52 90 F7 20         [ 4] 1897 	call puts
      008A55 0A 0D 01         [ 2] 1898 	jp repl 	
      000B77                       1899 mem_peek:
      008A58 27 06            [ 1] 1900 	ld a,#SPACE 
      008A5A A6 2D 90         [ 4] 1901 	call skip  	 
      008A5D 5A 90 F7 00      [ 2] 1902 	addw y,in.w 
      008A60 AE 17 18         [ 2] 1903 	ldw x,#pad 
      008A60 93 1D 17         [ 4] 1904 	call strcpy
      008A63 3F 50 CF         [ 4] 1905 	call atoi24 	
      008A65 C6 00 08         [ 1] 1906 	ld a, acc24 
      008A65 90 5A A6         [ 1] 1907 	or a,acc16 
      008A68 20 90 F7         [ 1] 1908 	or a,acc8 
      008A6B 5C 9F            [ 1] 1909 	jrne 1$ 
      008A6D C1 00            [ 2] 1910 	jra peek_byte  
      008A6F 26 2B F3         [ 2] 1911 1$:	ldw x,acc24 
      008A72 CF 00 13         [ 2] 1912 	ldw farptr,x 
      008A72 93 CD 82         [ 1] 1913 	ld a,acc8 
      008A75 30 5B 01         [ 1] 1914 	ld farptr+2,a 
      000BA2                       1915 peek_byte:
      008A78 81 0B E7         [ 4] 1916 	call print_farptr 
      008A79 A6 08            [ 1] 1917 	ld a,#8 
      008A79 52 02            [ 1] 1918 	ld (PSIZE,sp),a 
      008A7B 6B               [ 1] 1919 	clrw x 
      008A7C 02 0F 01         [ 4] 1920 1$:	call fetchc  
      008A7F A1               [ 2] 1921 	pushw x 
      008A80 0A 26 0A         [ 1] 1922 	ld acc8,a 
      008A83 72               [ 1] 1923 	clrw x 
      008A84 0F 00 09         [ 2] 1924 	ldw acc24,x 
      008A87 05 03            [ 1] 1925 	ld a,#16+128
      008A89 01 CD 8A         [ 4] 1926 	call prti24
      008A8C E8               [ 2] 1927 	popw x 
      008A8D 0A 01            [ 1] 1928 	dec (PSIZE,sp)
      008A8D AE 17            [ 1] 1929 	jrne 1$ 
      008A8F 3F 7F            [ 1] 1930 	ld a,#8 
      008A91 CB 00 15         [ 1] 1931 	add a,farptr+2 
      008A91 7B 02 CD         [ 1] 1932 	ld farptr+2,a
      008A94 8A               [ 1] 1933 	clr a 
      008A95 C0 AB 30         [ 1] 1934 	adc a,farptr+1 
      008A98 A1 3A 2B         [ 1] 1935 	ld farptr+1,a 
      008A9B 02               [ 1] 1936 	clr a 
      008A9C AB 07 5A         [ 1] 1937 	adc a,farptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008A9F F7 C6 00         [ 1] 1938 	ld farptr,a 
      008AA2 09 CA 00         [ 2] 1939 	jp repl  
                                   1940 
      008AA5 0A CA 00 0B 26 E6 7B  1941 invalid_cmd: .asciz "not a command\n" 
             02 A1 10 27 08 7B 01
             27
                                   1942 
                                   1943 ;----------------------------
                                   1944 ; display farptr address
                                   1945 ;----------------------------
      000BE7                       1946 print_farptr:
      008AB4 08 A6 2D         [ 1] 1947 	ld a ,farptr+2 
      008AB7 20 02 A6         [ 1] 1948 	ld acc8,a 
      008ABA 24 5A F7         [ 2] 1949 	ldw x,farptr 
      008ABD CF 00 08         [ 2] 1950 	ldw acc24,x 
      008ABD 5B               [ 1] 1951 	clrw x 
      008ABE 02 81            [ 1] 1952 	ld a,#16 
      008AC0 CD 09 55         [ 4] 1953 	call prti24
      008AC0 89 88            [ 1] 1954 	ld a,#SPACE 
      008AC2 C6 00 09         [ 4] 1955 	call putc 
      008AC5 95 C6 00         [ 4] 1956 	call putc 
      008AC8 0A               [ 4] 1957 	ret
                                   1958 
                                   1959 ;------------------------------------
                                   1960 ; get byte at address farptr[X]
                                   1961 ; input:
                                   1962 ;	 farptr   address to peek
                                   1963 ;    X		  farptr index 	
                                   1964 ; output:
                                   1965 ;	 A 		  byte from memory  
                                   1966 ;    x		  incremented by 1
                                   1967 ;------------------------------------
      000C02                       1968 fetchc: ; @C
      008AC9 97 7B 01 62      [ 5] 1969 	ldf a,([farptr],x)
      008ACD 88               [ 1] 1970 	incw x
      008ACE 9E               [ 4] 1971 	ret
                                   1972 
                                   1973 
                                   1974 ;------------------------------------
                                   1975 ; expect a number from command line 
                                   1976 ; next argument
                                   1977 ;  input:
                                   1978 ;	  none
                                   1979 ;  output:
                                   1980 ;    acc24   int24_t 
                                   1981 ;------------------------------------
      000C08                       1982 number::
      008ACF C7 00 09         [ 4] 1983 	call get_token
      008AD2 9F C7 00         [ 4] 1984 	call atoi24
      008AD5 0A               [ 4] 1985 	ret
                                   1986 .endif ; DEBUG 
                                   1987 
                                   1988 ;------------------------------------
                                   1989 ; parse quoted string 
                                   1990 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   1991 ;   Y 	pointer to tib 
                                   1992 ;   X   pointer to pad
                                   1993 ; output:
                                   1994 ;	pad   parsed string
                                   1995 ;   TOS  char* to pad  
                                   1996 ;------------------------------------
                           000001  1997 	PREV = 1
                           000002  1998 	CURR =2 
                           000002  1999 	VSIZE=2 
      000C0F                       2000 parse_quote: ; { -- addr }
      000C0F                       2001 	_vars VSIZE 
      008AD6 84 95            [ 2]    1     sub sp,#VSIZE 
      008AD8 C6               [ 1] 2002 	clr a
      008AD9 00 0B            [ 1] 2003 1$:	ld (PREV,sp),a 
      008ADB 97 7B 01 62      [ 1] 2004 2$:	inc in
      008ADF 6B 01 9F         [ 4] 2005 	ld a,([in.w],y)
      008AE2 C7 00            [ 1] 2006 	jreq 6$
      008AE4 0B 84            [ 1] 2007 	ld (CURR,sp),a 
      008AE6 85 81            [ 1] 2008 	ld a,#'\
      008AE8 11 01            [ 1] 2009 	cp a, (PREV,sp)
      008AE8 72 53            [ 1] 2010 	jrne 3$
      008AEA 00 0B            [ 1] 2011 	clr (PREV,sp)
      008AEC 72 53            [ 1] 2012 	ld a,(CURR,sp)
      008AEE 00 0A            [ 4] 2013 	callr convert_escape
      008AF0 72               [ 1] 2014 	ld (x),a 
      008AF1 53               [ 1] 2015 	incw x 
      008AF2 00 09            [ 2] 2016 	jra 2$
      000C2F                       2017 3$:
      008AF4 A6 01            [ 1] 2018 	ld a,(CURR,sp)
      008AF6 CB 00            [ 1] 2019 	cp a,#'\'
      008AF8 0B C7            [ 1] 2020 	jreq 1$
      008AFA 00 0B            [ 1] 2021 	cp a,#'"
      008AFC 4F C9            [ 1] 2022 	jreq 5$ 
      008AFE 00               [ 1] 2023 	ld (x),a 
      008AFF 0A               [ 1] 2024 	incw x 
      008B00 C7 00            [ 2] 2025 	jra 2$
      008B02 0A 4F C9 00      [ 1] 2026 5$:	inc in 
      008B06 09               [ 1] 2027 6$: clr (x)
      008B07 C7 00 09         [ 2] 2028 	ldw x,#pad 
      000C45                       2029 	_drop VSIZE
      008B0A 81 02            [ 2]    1     addw sp,#VSIZE 
      008B0B A6 0A            [ 1] 2030 	ld a,#TK_QSTR  
      008B0B 5F               [ 4] 2031 	ret 
                                   2032 
                                   2033 ;---------------------------------------
                                   2034 ; called by parse_quote
                                   2035 ; subtitute escaped character 
                                   2036 ; by their ASCII value .
                                   2037 ; input:
                                   2038 ;   A  character following '\'
                                   2039 ; output:
                                   2040 ;   A  substitued char or same if not valid.
                                   2041 ;---------------------------------------
      000C4A                       2042 convert_escape:
      008B0C 89               [ 2] 2043 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008B0D 90 AE 16         [ 2] 2044 	ldw x,#escaped 
      008B10 C8               [ 1] 2045 1$:	cp a,(x)
      008B11 27 06            [ 1] 2046 	jreq 2$
      008B11 CD               [ 1] 2047 	tnz (x)
      008B12 82 27            [ 1] 2048 	jreq 3$
      008B14 6B               [ 1] 2049 	incw x 
      008B15 01 A1            [ 2] 2050 	jra 1$
      008B17 0D 26 03         [ 2] 2051 2$: subw x,#escaped 
      008B1A CC               [ 1] 2052 	ld a,xl 
      008B1B 8B 86            [ 1] 2053 	add a,#7
      008B1D A1               [ 2] 2054 3$:	popw x 
      008B1E 0A               [ 4] 2055 	ret 
                                   2056 
      008B1F 27 65 A1 08 27 3D A1  2057 escaped: .asciz "abtnvfr"
             04
                                   2058 
                                   2059 ;-------------------------
                                   2060 ; integer parser 
                                   2061 ; input:
                                   2062 ;   X 		point to pad 
                                   2063 ;   Y 		point to tib 
                                   2064 ;   A 	    first digit|'$' 
                                   2065 ; output:  
                                   2066 ;   pad     number string 
                                   2067 ;   X 		integer 
                                   2068 ;   A 		TK_INTGR
                                   2069 ;-------------------------
                           000001  2070 	BASE=1
                           000002  2071 	TCHAR=2 
                           000002  2072 	VSIZE=2 
      000C67                       2073 parse_integer: ; { -- n }
      008B27 27 2A            [ 1] 2074 	push #0 ; TCHAR 
      008B29 A1 12            [ 1] 2075 	cp a,#'$
      008B2B 27 06            [ 1] 2076 	jreq 1$ 
      008B2D 4B 0A            [ 1] 2077 	push #10 ; BASE=10 
      008B2D A1 20            [ 2] 2078 	jra 2$ 
      008B2F 2A 40            [ 1] 2079 1$: push #16  ; BASE=16
      008B31 20               [ 1] 2080 2$:	ld (x),a 
      008B32 DE               [ 1] 2081 	incw x 
      008B33 72 5C 00 01      [ 1] 2082 	inc in 
      008B33 91 D6 00         [ 4] 2083 	ld a,([in.w],y)
      008B33 CD 0E C3         [ 4] 2084 	call to_upper 
      008B33 6B 02            [ 1] 2085 	ld (TCHAR,sp),a 
      008B33 0D 02 26         [ 4] 2086 	call is_digit 
      008B36 DA AE            [ 1] 2087 	jrc 2$
      008B38 16 C8            [ 1] 2088 	ld a,#16 
      008B3A CD 82            [ 1] 2089 	cp a,(BASE,sp)
      008B3C F2 90            [ 1] 2090 	jrne 3$ 
      008B3E AE 16            [ 1] 2091 	ld a,(TCHAR,sp)
      008B40 C8 9F            [ 1] 2092 	cp a,#'A 
      008B42 27 CD            [ 1] 2093 	jrmi 3$ 
      008B44 6B 02            [ 1] 2094 	cp a,#'G 
      008B46 AE 16            [ 1] 2095 	jrmi 2$ 
      008B48 C8               [ 1] 2096 3$:	clr (x)
      008B49 CD 82 30         [ 4] 2097 	call atoi24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B4C 0F 01 72         [ 2] 2098 	ldw x,acc16 
      008B4F F9 01            [ 1] 2099 	ld a,#TK_INTGR
      000C9F                       2100 	_drop VSIZE  
      008B51 20 BE            [ 2]    1     addw sp,#VSIZE 
      008B53 81               [ 4] 2101 	ret 	
                                   2102 
                                   2103 ;-------------------------
                                   2104 ; binary integer parser 
                                   2105 ; input:
                                   2106 ;   X 		point to pad 
                                   2107 ;   Y 		point to tib 
                                   2108 ;   A 	    '%' 
                                   2109 ; output:  
                                   2110 ;   pad     number string 
                                   2111 ;   X 		integer 
                                   2112 ;   A 		TK_INTGR
                                   2113 ;   TOS     integer 
                                   2114 ;-------------------------
                           000001  2115 	BINARY=1
                           000002  2116 	VSIZE=2
      000CA2                       2117 parse_binary: ; { -- n }
      008B53 7B 02            [ 1] 2118 	push #0
      008B55 CD 82            [ 1] 2119 	push #0
      008B57 4A               [ 1] 2120 1$: ld (x),a 
      008B58 90               [ 1] 2121 	incw x 
      008B59 AE 16 C8 90      [ 1] 2122 	inc in 
      008B5D 7F 0F 02         [ 4] 2123 	ld a,([in.w],y)
      008B60 20 AF            [ 1] 2124 	cp a,#'0 
      008B62 27 06            [ 1] 2125 	jreq 2$
      008B62 0D 02            [ 1] 2126 	cp a,#'1 
      008B64 27 AB            [ 1] 2127 	jreq 2$ 
      008B66 0A 02            [ 2] 2128 	jra bin_exit 
      008B68 90 5A            [ 1] 2129 2$: sub a,#'0	
      008B6A 90               [ 1] 2130 	rrc a 
      008B6B 7F CD            [ 1] 2131 	rlc (BINARY+1,sp)
      008B6D 82 3A            [ 1] 2132 	rlc (BINARY,sp)
      008B6F 20 A0            [ 2] 2133 	jra 1$  
      008B71                       2134 bin_exit:
      008B71 A6               [ 1] 2135 	clr (x)
      008B72 4F 11            [ 2] 2136 	ldw x,(BINARY,sp)
      008B74 02 27            [ 1] 2137 	ld a,#TK_INTGR 	
      000CC7                       2138 	_drop VSIZE 
      008B76 9A 7B            [ 2]    1     addw sp,#VSIZE 
      008B78 01               [ 4] 2139 	ret
                                   2140 
                                   2141 ;---------------------------
                                   2142 ;  token begin with a letter,
                                   2143 ;  is keyword or variable. 	
                                   2144 ; input:
                                   2145 ;   X 		point to pad 
                                   2146 ;   Y 		point to text
                                   2147 ;   A 	    first letter  
                                   2148 ; output:
                                   2149 ;   X		exec_addr|var_addr 
                                   2150 ;   A 		TK_CMD 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2151 ;   pad 	keyword|var_name  
                                   2152 ;   TOS     exec_addr|var_addr 
                                   2153 ;--------------------------  
      000CCA                       2154 parse_keyword: ; { -- exec_addr|var_addr}
      008B79 90 F7 0C         [ 4] 2155 	call to_upper 
      008B7C 02               [ 1] 2156 	ld (x),a 
      008B7D 90               [ 1] 2157 	incw x 
      008B7E 5C 90 7F CD      [ 1] 2158 	inc in 
      008B82 82 1E 20         [ 4] 2159 	ld a,([in.w],y)
      008B85 8B 05 04         [ 4] 2160 	call is_alpha 
      008B86 25 EF            [ 1] 2161 	jrc parse_keyword 
      008B86 90               [ 1] 2162 1$: clr (x)
      008B87 7F 7B 02 C7      [ 1] 2163 	tnz pad+1 
      008B8B 00 03            [ 1] 2164 	jrne 2$
                                   2165 ; one letter variable name 
      008B8D 5B 02 A6         [ 1] 2166 	ld a,pad 
      008B90 0D CD            [ 1] 2167 	sub a,#'A 
      008B92 82               [ 1] 2168 	sll a 
      008B93 1E               [ 1] 2169 	push a 
      008B94 81 00            [ 1] 2170 	push #0
      008B95 AE 00 26         [ 2] 2171 	ldw x,#vars 
      008B95 52 01 72         [ 2] 2172 	addw x,(1,sp) ; X=var address 
      000CF1                       2173 	_drop 2 
      008B98 5F 00            [ 2]    1     addw sp,#2 
      008B9A 14 72            [ 1] 2174 	ld a,#TK_VAR 
      008B9C 5F 00            [ 2] 2175 	jra 4$ 
      000CF7                       2176 2$: ; check for keyword, otherwise syntax error.
      000CF7                       2177 	_ldx_dict kword_dict
      008B9E 15 72 5F         [ 2]    1     ldw x,#kword_dict+2
      008BA1 00 16 60         [ 4] 2178 	call search_dict
      008BA3 4D               [ 1] 2179 	tnz a
      008BA3 A6 0D            [ 1] 2180 	jrne 4$ 
      008BA5 CD 82 1E         [ 2] 2181 	jp syntax_error
      008BA8 A6               [ 4] 2182 4$:	ret  	
                                   2183 
                                   2184 
                                   2185 ;------------------------------------
                                   2186 ; Command line tokenizer
                                   2187 ; scan text for next token
                                   2188 ; move token in 'pad'
                                   2189 ; input: 
      000D04                       2190 	none: 
                                   2191 ; use:
                                   2192 ;	Y   pointer to text
                                   2193 ;   X	pointer to pad 
                                   2194 ;   in.w   index in text buffer
                                   2195 ; output:
                                   2196 ;   A       token attribute 
                                   2197 ;   pad 	token as .asciz
                                   2198 ;   X 		token value   
                                   2199 ;------------------------------------
                                   2200 	; use to check special character 
                                   2201 	.macro _case c t  
                                   2202 	ld a,#c 
                                   2203 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2204 	jrne t
                                   2205 	.endm 
                                   2206 
                           000001  2207 	TCHAR=1
                           000002  2208 	ATTRIB=2 
                           000002  2209 	VSIZE=2
      000D04                       2210 get_token: 
      008BA9 3F CD 82 1E      [ 2] 2211 	ldw y,#tib    	
      008BAD 72 5F 00         [ 1] 2212 	ld a,in 
      008BB0 01 72 5F         [ 1] 2213 	cp a,count 
      008BB3 00 02            [ 1] 2214 	jrmi 1$
      008BB5 CD 8B            [ 1] 2215 	ld a,#TK_NONE 
      008BB7 0B               [ 4] 2216 	ret 
      000D13                       2217 1$:	
      000D13                       2218 	_vars VSIZE
      008BB8 90 AE            [ 2]    1     sub sp,#VSIZE 
      008BBA 16 C8 90         [ 2] 2219 	ldw x, #pad
      008BBD F6 27            [ 1] 2220 	ld a,#SPACE
      008BBF E3 72 5C         [ 4] 2221 	call skip
      008BC2 00 02 CD         [ 2] 2222 	ldw in.w.saved,x 
      008BC5 8F 43 A1         [ 4] 2223 	ld a,([in.w],y)
      008BC8 51 26            [ 1] 2224 	jrne str_tst
      008BCA 17 5F 17 18      [ 1] 2225 	clr pad 
      008BCB CC 0E B7         [ 2] 2226 	jp token_exit ; end of line 
                                   2227 
      000D2C                       2228 str_tst: ; check for quoted string  	
      008BCB 72 5F 16         [ 4] 2229 	call to_upper 
      008BCE C8 72            [ 1] 2230 	ld (TCHAR,sp),a 
      000D31                       2231 	_case '"' nbr_tst
      008BD0 5F 00            [ 1]    1 	ld a,#'"' 
      008BD2 03 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008BD4 5F 00            [ 1]    3 	jrne nbr_tst
      008BD6 02 5B 01         [ 4] 2232 	call parse_quote
      008BD9 81 0E B7         [ 2] 2233 	jp token_exit
      008BDA                       2234 nbr_tst: ; check for number 
      008BDA AE 8C            [ 1] 2235 	ld a,#'$'
      008BDC 58 CD            [ 1] 2236 	cp a,(TCHAR,sp) 
      008BDE 82 30            [ 1] 2237 	jreq 1$
      008BE0 20 C1            [ 1] 2238 	ld a,#'&
      008BE2 11 01            [ 1] 2239 	cp a,(TCHAR,sp)
      008BE2 A1 50            [ 1] 2240 	jrne 0$
      008BE4 27 11 A1         [ 4] 2241 	call parse_binary ; expect binary integer 
      008BE7 53 26 F0         [ 2] 2242 	jp token_exit 
      008BEA 7B 01            [ 1] 2243 0$:	ld a,(TCHAR,sp)
      008BEA CD 8D 84         [ 4] 2244 	call is_digit
      008BED A1 04            [ 1] 2245 	jrnc 3$
      008BEF 26 E9 CD         [ 4] 2246 1$:	call parse_integer 
      008BF2 82 30 CC         [ 2] 2247 	jp token_exit 
      000D5C                       2248 3$: 
      000D5C                       2249 	_case '(' bkslsh_tst 
      008BF5 8B A3            [ 1]    1 	ld a,#'(' 
      008BF7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008BF7 A6 20            [ 1]    3 	jrne bkslsh_tst
      008BF9 CD 8F            [ 1] 2250 	ld a,#TK_LPAREN
      008BFB FB 72 B9         [ 2] 2251 	jp token_char   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      000D67                       2252 bkslsh_tst:
      000D67                       2253 	_case '\',rparnt_tst
      008BFE 00 01            [ 1]    1 	ld a,#'\' 
      008C00 AE 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008C02 18 CD            [ 1]    3 	jrne rparnt_tst
      008C04 83 10            [ 1] 2254 	ld a,(TCHAR,sp)
      008C06 CD               [ 1] 2255 	ld (x),a 
      008C07 8F               [ 1] 2256 	incw x 
      008C08 4F C6 00 09      [ 1] 2257 	inc in 
      008C0C CA 00 0A         [ 4] 2258 	ld a,([in.w],y)
      008C0F CA               [ 1] 2259 	ld (x),a 
      008C10 00               [ 1] 2260 	incw x 
      008C11 0B 26 02 20      [ 1] 2261 	inc in  
      008C15 0C               [ 1] 2262 	clr (x) 
      008C16 CE               [ 1] 2263 	ld xl,a 
      008C17 00 09            [ 1] 2264 	ld a,#TK_CHAR 
      008C19 CF 00 14         [ 2] 2265 	jp token_exit 
      000D85                       2266 rparnt_tst:		
      000D85                       2267 	_case ')' colon_tst 
      008C1C C6 00            [ 1]    1 	ld a,#')' 
      008C1E 0B C7            [ 1]    2 	cp a,(TCHAR,sp) 
      008C20 00 16            [ 1]    3 	jrne colon_tst
      008C22 A6 0C            [ 1] 2268 	ld a,#TK_RPAREN 
      008C22 CD 8C 67         [ 2] 2269 	jp token_char 
      000D90                       2270 colon_tst:
      000D90                       2271 	_case ':' comma_tst 
      008C25 A6 08            [ 1]    1 	ld a,#':' 
      008C27 6B 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C29 5F CD            [ 1]    3 	jrne comma_tst
      008C2B 8C 82            [ 1] 2272 	ld a,#TK_COLON 
      008C2D 89 C7 00         [ 2] 2273 	jp token_char 
      000D9B                       2274 comma_tst:
      000D9B                       2275 	_case COMMA sharp_tst 
      008C30 0B 5F            [ 1]    1 	ld a,#COMMA 
      008C32 CF 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008C34 09 A6            [ 1]    3 	jrne sharp_tst
      008C36 90 CD            [ 1] 2276 	ld a,#TK_COMMA
      008C38 89 D5 85         [ 2] 2277 	jp token_char
      000DA6                       2278 sharp_tst:
      000DA6                       2279 	_case SHARP dash_tst 
      008C3B 0A 01            [ 1]    1 	ld a,#SHARP 
      008C3D 26 EB            [ 1]    2 	cp a,(TCHAR,sp) 
      008C3F A6 08            [ 1]    3 	jrne dash_tst
      008C41 CB 00            [ 1] 2280 	ld a,#TK_SHARP
      008C43 16 C7 00         [ 2] 2281 	jp token_char  	 	 
      000DB1                       2282 dash_tst: 	
      000DB1                       2283 	_case '-' at_tst 
      008C46 16 4F            [ 1]    1 	ld a,#'-' 
      008C48 C9 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008C4A 15 C7            [ 1]    3 	jrne at_tst
      008C4C 00 15            [ 1] 2284 	ld a,#TK_MINUS  
      008C4E 4F C9 00         [ 2] 2285 	jp token_char 
      000DBC                       2286 at_tst:
      000DBC                       2287 	_case '@' qmark_tst 
      008C51 14 C7            [ 1]    1 	ld a,#'@' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008C53 00 14            [ 1]    2 	cp a,(TCHAR,sp) 
      008C55 CC 8B            [ 1]    3 	jrne qmark_tst
      008C57 A3 6E            [ 1] 2288 	ld a,#TK_ARRAY 
      008C59 6F 74 20         [ 2] 2289 	jp token_char
      000DC7                       2290 qmark_tst:
      000DC7                       2291 	_case '?' tick_tst 
      008C5C 61 20            [ 1]    1 	ld a,#'?' 
      008C5E 63 6F            [ 1]    2 	cp a,(TCHAR,sp) 
      008C60 6D 6D            [ 1]    3 	jrne tick_tst
      008C62 61 6E            [ 1] 2292 	ld a,(TCHAR,sp)
      008C64 64               [ 1] 2293 	ld (x),a 
      008C65 0A               [ 1] 2294 	incw x 
      008C66 00               [ 1] 2295 	clr (x)
      008C67 72 5C 00 01      [ 1] 2296 	inc in 
      008C67 C6 00            [ 1] 2297 	ld a,#TK_CMD 
      008C69 16 C7 00         [ 2] 2298 	ldw x,#print 
      008C6C 0B CE 00         [ 2] 2299 	jp token_exit
      000DDE                       2300 tick_tst: ; ignore comment 
      000DDE                       2301 	_case TICK plus_tst 
      008C6F 14 CF            [ 1]    1 	ld a,#TICK 
      008C71 00 09            [ 1]    2 	cp a,(TCHAR,sp) 
      008C73 5F A6            [ 1]    3 	jrne plus_tst
      008C75 10 CD 89 D5      [ 1] 2302 	inc in 
      008C79 A6 20            [ 1] 2303 	ld a,#TK_CMD 
      008C7B CD 82 1E         [ 2] 2304 	ldw x,#rem 
      008C7E CD 82 1E         [ 2] 2305 	jp token_exit 
      000DF0                       2306 plus_tst:
      000DF0                       2307 	_case '+' star_tst 
      008C81 81 2B            [ 1]    1 	ld a,#'+' 
      008C82 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C82 92 AF            [ 1]    3 	jrne star_tst
      008C84 00 14            [ 1] 2308 	ld a,#TK_PLUS  
      008C86 5C 81 A7         [ 2] 2309 	jp token_char 
      008C88                       2310 star_tst:
      000DFB                       2311 	_case '*' slash_tst 
      008C88 CD 8D            [ 1]    1 	ld a,#'*' 
      008C8A 84 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008C8C 8F 4F            [ 1]    3 	jrne slash_tst
      008C8E 81 20            [ 1] 2312 	ld a,#TK_MULT 
      008C8F CC 0E A7         [ 2] 2313 	jp token_char 
      000E06                       2314 slash_tst: 
      000E06                       2315 	_case '/' prcnt_tst 
      008C8F 52 02            [ 1]    1 	ld a,#'/' 
      008C91 4F 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008C93 01 72            [ 1]    3 	jrne prcnt_tst
      008C95 5C 00            [ 1] 2316 	ld a,#TK_DIV 
      008C97 02 91 D6         [ 2] 2317 	jp token_char 
      000E11                       2318 prcnt_tst:
      000E11                       2319 	_case '%' eql_tst 
      008C9A 01 27            [ 1]    1 	ld a,#'%' 
      008C9C 24 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008C9E 02 A6            [ 1]    3 	jrne eql_tst
      008CA0 5C 11            [ 1] 2320 	ld a,#TK_MOD
      008CA2 01 26 0A         [ 2] 2321 	jp token_char  
                                   2322 ; 1 or 2 character tokens 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      000E1C                       2323 eql_tst:
      000E1C                       2324 	_case '=' gt_tst 		
      008CA5 0F 01            [ 1]    1 	ld a,#'=' 
      008CA7 7B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA9 AD 1F            [ 1]    3 	jrne gt_tst
      008CAB F7 5C            [ 1] 2325 	ld a,#TK_EQUAL
      008CAD 20 E5 A7         [ 2] 2326 	jp token_char 
      008CAF                       2327 gt_tst:
      000E27                       2328 	_case '>' lt_tst 
      008CAF 7B 02            [ 1]    1 	ld a,#'>' 
      008CB1 A1 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008CB3 27 DD            [ 1]    3 	jrne lt_tst
      008CB5 A1 22            [ 1] 2329 	ld a,#TK_GT 
      008CB7 27 04            [ 1] 2330 	ld (ATTRIB,sp),a 
      008CB9 F7 5C 20 D7      [ 1] 2331 	inc in 
      008CBD 72 5C 00         [ 4] 2332 	ld a,([in.w],y)
      008CC0 02 7F            [ 1] 2333 	cp a,#'=
      008CC2 AE 17            [ 1] 2334 	jrne 1$
      008CC4 18 5B            [ 1] 2335 	ld a,(TCHAR,sp)
      008CC6 02               [ 1] 2336 	ld (x),a
      008CC7 A6               [ 1] 2337 	incw x 
      008CC8 0A 81            [ 1] 2338 	ld a,#'=
      008CCA 6B 01            [ 1] 2339 	ld (TCHAR,sp),a 
      008CCA 89 AE            [ 1] 2340 	ld a,#TK_GE 
      008CCC 8C DF            [ 2] 2341 	jra token_char  
      008CCE F1 27            [ 1] 2342 1$: cp a,#'<
      008CD0 06 7D            [ 1] 2343 	jrne 2$
      008CD2 27 09            [ 1] 2344 	ld a,(TCHAR,sp)
      008CD4 5C               [ 1] 2345 	ld (x),a
      008CD5 20               [ 1] 2346 	incw x 
      008CD6 F7 1D            [ 1] 2347 	ld a,#'<	
      008CD8 8C DF            [ 1] 2348 	ld (TCHAR,sp),a 
      008CDA 9F AB            [ 1] 2349 	ld a,#TK_NE 
      008CDC 07 85            [ 2] 2350 	jra token_char 
      008CDE 81 61 62 74      [ 1] 2351 2$: dec in
      008CE2 6E 76            [ 1] 2352 	ld a,(ATTRIB,sp)
      008CE4 66 72            [ 2] 2353 	jra token_char 
      000E60                       2354 lt_tst:
      000E60                       2355 	_case '<' other
      008CE6 00 3C            [ 1]    1 	ld a,#'<' 
      008CE7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CE7 4B 00            [ 1]    3 	jrne other
      008CE9 A1 24            [ 1] 2356 	ld a,#TK_LT 
      008CEB 27 04            [ 1] 2357 	ld (ATTRIB,sp),a 
      008CED 4B 0A 20 02      [ 1] 2358 	inc in 
      008CF1 4B 10 F7         [ 4] 2359 	ld a,([in.w],y)
      008CF4 5C 72            [ 1] 2360 	cp a,#'=
      008CF6 5C 00            [ 1] 2361 	jrne 1$
      008CF8 02 91            [ 1] 2362 	ld a,(TCHAR,sp)
      008CFA D6               [ 1] 2363 	ld (x),a 
      008CFB 01 CD            [ 1] 2364 	ld a,#'=
      008CFD 8F 43            [ 1] 2365 	ld (TCHAR,sp),a 
      008CFF 6B 02            [ 1] 2366 	ld a,#TK_LE 
      008D01 CD 8F            [ 2] 2367 	jra token_char 
      008D03 3A 25            [ 1] 2368 1$: cp a,#'>
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D05 ED A6            [ 1] 2369 	jrne 2$
      008D07 10 11            [ 1] 2370 	ld a,(TCHAR,sp)
      008D09 01               [ 1] 2371 	ld (x),a 
      008D0A 26               [ 1] 2372 	incw x 
      008D0B 0A 7B            [ 1] 2373 	ld a,#'>
      008D0D 02 A1            [ 1] 2374 	ld (TCHAR,sp),a 
      008D0F 41 2B            [ 1] 2375 	ld a,#TK_NE 
      008D11 04 A1            [ 2] 2376 	jra token_char 
      008D13 47 2B DD 7F      [ 1] 2377 2$: dec in 
      008D17 CD 8F            [ 1] 2378 	ld a,(ATTRIB,sp)
      008D19 4F CE            [ 2] 2379 	jra token_char 	
      000E98                       2380 other: ; not a special character 	 
      008D1B 00 0A            [ 1] 2381 	ld a,(TCHAR,sp)
      008D1D A6 04 5B         [ 4] 2382 	call is_alpha 
      008D20 02 81            [ 1] 2383 	jrc 30$ 
      008D22 CC 07 18         [ 2] 2384 	jp syntax_error 
      000EA2                       2385 30$: 
      008D22 4B 00 4B         [ 4] 2386 	call parse_keyword
      008D25 00 F7            [ 2] 2387 	jra token_exit 
      000EA7                       2388 token_char:
      008D27 5C 72            [ 1] 2389 	ld (ATTRIB,sp),a 
      008D29 5C 00            [ 1] 2390 	ld a,(TCHAR,sp)
      008D2B 02               [ 1] 2391 	ld (x),a 
      008D2C 91               [ 1] 2392 	incw x 
      008D2D D6               [ 1] 2393 	clr(x)
      008D2E 01 A1 30 27      [ 1] 2394 	inc in 
      008D32 06 A1            [ 1] 2395 	ld a,(ATTRIB,sp)
      008D34 31 27 02         [ 2] 2396 	ldw x,#pad 
      000EB7                       2397 token_exit:
      000EB7                       2398 	_drop VSIZE 
      008D37 20 09            [ 2]    1     addw sp,#VSIZE 
      008D39 A0               [ 4] 2399 	ret
                                   2400 
                                   2401 
                                   2402 
                                   2403 ;------------------------------------
                                   2404 ; check if character in {'0'..'9'}
                                   2405 ; input:
                                   2406 ;    A  character to test
                                   2407 ; output:
                                   2408 ;    Carry  0 not digit | 1 digit
                                   2409 ;------------------------------------
      000EBA                       2410 is_digit:
      008D3A 30 46            [ 1] 2411 	cp a,#'0
      008D3C 09 02            [ 1] 2412 	jrc 1$
      008D3E 09 01            [ 1] 2413     cp a,#'9+1
      008D40 20               [ 1] 2414 	ccf 
      008D41 E4               [ 1] 2415 1$:	ccf 
      008D42 81               [ 4] 2416     ret
                                   2417 
                                   2418 ;------------------------------------
                                   2419 ; convert alpha to uppercase
                                   2420 ; input:
                                   2421 ;    a  character to convert
                                   2422 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2423 ;    a  uppercase character
                                   2424 ;------------------------------------
      000EC3                       2425 to_upper::
      008D42 7F 1E            [ 1] 2426 	cp a,#'a
      008D44 01 A6            [ 1] 2427 	jrpl 1$
      008D46 04               [ 4] 2428 0$:	ret
      008D47 5B 02            [ 1] 2429 1$: cp a,#'z	
      008D49 81 FB            [ 1] 2430 	jrugt 0$
      008D4A A0 20            [ 1] 2431 	sub a,#32
      008D4A CD               [ 4] 2432 	ret
                                   2433 	
                                   2434 ;------------------------------------
                                   2435 ; convert pad content in integer
                                   2436 ; input:
                                   2437 ;    pad		.asciz to convert
                                   2438 ; output:
                                   2439 ;    acc24      int24_t
                                   2440 ;------------------------------------
                                   2441 	; local variables
                           000001  2442 	SIGN=1 ; 1 byte, 
                           000002  2443 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2444 	TEMP=3 ; 1 byte, temporary storage
                           000003  2445 	VSIZE=3 ; 3 bytes reserved for local storage
      000ECF                       2446 atoi24:
      008D4B 8F               [ 2] 2447 	pushw x ;save x
      008D4C 43 F7            [ 2] 2448 	sub sp,#VSIZE
                                   2449 	; acc24=0 
      008D4E 5C 72 5C 00      [ 1] 2450 	clr acc24    
      008D52 02 91 D6 01      [ 1] 2451 	clr acc16
      008D56 CD 85 84 25      [ 1] 2452 	clr acc8 
      008D5A EF 7F 72         [ 1] 2453 	ld a, pad 
      008D5D 5D 17            [ 1] 2454 	jreq atoi_exit
      008D5F 19 26            [ 1] 2455 	clr (SIGN,sp)
      008D61 15 C6            [ 1] 2456 	ld a,#10
      008D63 17 18            [ 1] 2457 	ld (BASE,sp),a ; default base decimal
      008D65 A0 41 48         [ 2] 2458 	ldw x,#pad ; pointer to string to convert
      008D68 88               [ 1] 2459 	ld a,(x)
      008D69 4B 00            [ 1] 2460 	jreq 9$  ; completed if 0
      008D6B AE 00            [ 1] 2461 	cp a,#'-
      008D6D 27 72            [ 1] 2462 	jrne 1$
      008D6F FB 01            [ 1] 2463 	cpl (SIGN,sp)
      008D71 5B 02            [ 2] 2464 	jra 2$
      008D73 A6 05            [ 1] 2465 1$: cp a,#'$
      008D75 20 0C            [ 1] 2466 	jrne 3$
      008D77 A6 10            [ 1] 2467 	ld a,#16
      008D77 AE A1            [ 1] 2468 	ld (BASE,sp),a
      008D79 F4               [ 1] 2469 2$:	incw x
      008D7A CD               [ 1] 2470 	ld a,(x)
      000F01                       2471 3$:	
      008D7B 91 E0            [ 1] 2472 	cp a,#'a
      008D7D 4D 26            [ 1] 2473 	jrmi 4$
      008D7F 03 CC            [ 1] 2474 	sub a,#32
      008D81 87 98            [ 1] 2475 4$:	cp a,#'0
      008D83 81 2B            [ 1] 2476 	jrmi 9$
      008D84 A0 30            [ 1] 2477 	sub a,#'0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008D84 A1 0A            [ 1] 2478 	cp a,#10
      008D84 90 AE            [ 1] 2479 	jrmi 5$
      008D86 16 C8            [ 1] 2480 	sub a,#7
      008D88 C6 00            [ 1] 2481 	cp a,(BASE,sp)
      008D8A 02 C1            [ 1] 2482 	jrpl 9$
      008D8C 00 03            [ 1] 2483 5$:	ld (TEMP,sp),a
      008D8E 2B 03            [ 1] 2484 	ld a,(BASE,sp)
      008D90 A6 00 81         [ 4] 2485 	call mulu24_8
      008D93 7B 03            [ 1] 2486 	ld a,(TEMP,sp)
      008D93 52 02 AE         [ 1] 2487 	add a,acc24+2
      008D96 17 18 A6         [ 1] 2488 	ld acc24+2,a
      008D99 20               [ 1] 2489 	clr a
      008D9A CD 8F FB         [ 1] 2490 	adc a,acc24+1
      008D9D CF 00 12         [ 1] 2491 	ld acc24+1,a
      008DA0 91               [ 1] 2492 	clr a
      008DA1 D6 01 26         [ 1] 2493 	adc a,acc24
      008DA4 07 72 5F         [ 1] 2494 	ld acc24,a
      008DA7 17 18            [ 2] 2495 	jra 2$
      008DA9 CC 8F            [ 1] 2496 9$:	tnz (SIGN,sp)
      008DAB 37 03            [ 1] 2497     jreq atoi_exit
      008DAC CD 0A 68         [ 4] 2498     call neg_acc24
      000F3D                       2499 atoi_exit: 
      008DAC CD 8F            [ 2] 2500 	addw sp,#VSIZE
      008DAE 43               [ 2] 2501 	popw x ; restore x
      008DAF 6B               [ 4] 2502 	ret
                                   2503 
                                   2504 ;--------------------------------------
                                   2505 ; unsigned multiply uint24_t by uint8_t
                                   2506 ; use to convert numerical string to uint24_t
                                   2507 ; input:
                                   2508 ;	acc24	uint24_t 
                                   2509 ;   A		uint8_t
                                   2510 ; output:
                                   2511 ;   acc24   A*acc24
                                   2512 ;-------------------------------------
                                   2513 ; local variables offset  on sp
                           000003  2514 	U8   = 3   ; A pushed on stack
                           000002  2515 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2516 	OVFH = 1  ; multiplication overflow high byte
                           000003  2517 	VSIZE = 3
      000F41                       2518 mulu24_8:
      008DB0 01               [ 2] 2519 	pushw x    ; save X
                                   2520 	; local variables
      008DB1 A6               [ 1] 2521 	push a     ; U8
      008DB2 22               [ 1] 2522 	clrw x     ; initialize overflow to 0
      008DB3 11               [ 2] 2523 	pushw x    ; multiplication overflow
                                   2524 ; multiply low byte.
      008DB4 01 26 06         [ 1] 2525 	ld a,acc24+2
      008DB7 CD               [ 1] 2526 	ld xl,a
      008DB8 8C 8F            [ 1] 2527 	ld a,(U8,sp)
      008DBA CC               [ 4] 2528 	mul x,a
      008DBB 8F               [ 1] 2529 	ld a,xl
      008DBC 37 00 0A         [ 1] 2530 	ld acc24+2,a
      008DBD 9E               [ 1] 2531 	ld a, xh
      008DBD A6 24            [ 1] 2532 	ld (OVFL,sp),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2533 ; multipy middle byte
      008DBF 11 01 27         [ 1] 2534 	ld a,acc24+1
      008DC2 13               [ 1] 2535 	ld xl,a
      008DC3 A6 26            [ 1] 2536 	ld a, (U8,sp)
      008DC5 11               [ 4] 2537 	mul x,a
                                   2538 ; add overflow to this partial product
      008DC6 01 26 06         [ 2] 2539 	addw x,(OVFH,sp)
      008DC9 CD               [ 1] 2540 	ld a,xl
      008DCA 8D 22 CC         [ 1] 2541 	ld acc24+1,a
      008DCD 8F               [ 1] 2542 	clr a
      008DCE 37 7B            [ 1] 2543 	adc a,#0
      008DD0 01 CD            [ 1] 2544 	ld (OVFH,sp),a
      008DD2 8F               [ 1] 2545 	ld a,xh
      008DD3 3A 24            [ 1] 2546 	ld (OVFL,sp),a
                                   2547 ; multiply most signficant byte	
      008DD5 06 CD 8C         [ 1] 2548 	ld a, acc24
      008DD8 E7               [ 1] 2549 	ld xl, a
      008DD9 CC 8F            [ 1] 2550 	ld a, (U8,sp)
      008DDB 37               [ 4] 2551 	mul x,a
      008DDC 72 FB 01         [ 2] 2552 	addw x, (OVFH,sp)
      008DDC A6               [ 1] 2553 	ld a, xl
      008DDD 28 11 01         [ 1] 2554 	ld acc24,a
      008DE0 26 05            [ 2] 2555     addw sp,#VSIZE
      008DE2 A6               [ 2] 2556 	popw x
      008DE3 0B               [ 4] 2557 	ret
                                   2558 
                                   2559 ;------------------------------------
                                   2560 ; skip character c in text starting from 'in'
                                   2561 ; input:
                                   2562 ;	 y 		point to text buffer
                                   2563 ;    a 		character to skip
                                   2564 ; output:  
                                   2565 ;	'in' ajusted to new position
                                   2566 ;------------------------------------
                           000001  2567 	C = 1 ; local var
      000F7B                       2568 skip:
      008DE4 CC               [ 1] 2569 	push a
      008DE5 8F 27 00         [ 4] 2570 1$:	ld a,([in.w],y)
      008DE7 27 0A            [ 1] 2571 	jreq 2$
      008DE7 A6 5C            [ 1] 2572 	cp a,(C,sp)
      008DE9 11 01            [ 1] 2573 	jrne 2$
      008DEB 26 18 7B 01      [ 1] 2574 	inc in
      008DEF F7 5C            [ 2] 2575 	jra 1$
      000F8B                       2576 2$: _drop 1 
      008DF1 72 5C            [ 2]    1     addw sp,#1 
      008DF3 00               [ 4] 2577 	ret
                                   2578 	
                                   2579 ;------------------------------
                                   2580 ; restore 'in.w' variable to 
                                   2581 ; its value before last call
                                   2582 ; to get_token.
                                   2583 ;------------------------------
      000F8E                       2584 unget_token:
      008DF4 02 91 D6         [ 2] 2585 	ldw x,in.w.saved
      008DF7 01 F7 5C         [ 2] 2586 	ldw in.w,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008DFA 72               [ 4] 2587 	ret 
                                   2588 
                                   2589 
                                   2590 ;******************************
                                   2591 ;  data stack manipulation
                                   2592 ;*****************************
                                   2593 ;----------------------	
                                   2594 ; push X on data stack 
                                   2595 ; input:
                                   2596 ;	X 
                                   2597 ; output:
                                   2598 ;	none 
                                   2599 ;----------------------	
      000F95                       2600 dpush:
      000F95                       2601     _dp_down
      008DFB 5C 00 02 7F      [ 1]    1     dec dstkptr+1 
      008DFF 97 A6 03 CC      [ 1]    2     dec dstkptr+1
      008E03 8F 37 00 19      [ 5] 2602     ldw [dstkptr],x  
      008E05 81               [ 4] 2603 	ret 
                                   2604 
                                   2605 
                                   2606 ;----------------------	
                                   2607 ; pop data stack in X 
                                   2608 ; input:
                                   2609 ;	none
                                   2610 ; output:
                                   2611 ;	X   
                                   2612 ;----------------------	
      000FA2                       2613 dpop: 
      008E05 A6 29 11 01      [ 5] 2614     ldw x, [dstkptr]
      000FA6                       2615 	_dp_up
      008E09 26 05 A6 0C      [ 1]    1     inc dstkptr+1
      008E0D CC 8F 27 1A      [ 1]    2     inc dstkptr+1
      008E10 81               [ 4] 2616 	ret 
                                   2617 
                                   2618 ;-----------------------------
                                   2619 ; swap top 2 elements of dstack
                                   2620 ;  {n1 n2 -- n2 n1 }
                                   2621 ;-----------------------------
      000FAF                       2622 dswap:
      008E10 A6 3A 11 01      [ 5] 2623 	ldw x,[dstkptr]
      008E14 26               [ 2] 2624 	pushw x 
      008E15 05 A6 01         [ 2] 2625 	ldw x,#2 
      008E18 CC 8F 27 19      [ 5] 2626 	ldw x,([dstkptr],x) 
      008E1B 72 CF 00 19      [ 5] 2627 	ldw [dstkptr],x 
      008E1B A6 2C 11         [ 2] 2628 	ldw x,#2
      008E1E 01 26            [ 2] 2629 	popw y 
      008E20 05 A6 0D CC      [ 5] 2630 	ldw ([dstkptr],x),y 
      008E24 8F               [ 4] 2631 	ret
                                   2632 
                                   2633 ;-----------------------------
                                   2634 ; drop TOS 
                                   2635 ;-----------------------------
      000FC9                       2636 ddrop: ; { n -- }
      000FC9                       2637 	_dp_up 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008E25 27 5C 00 1A      [ 1]    1     inc dstkptr+1
      008E26 72 5C 00 1A      [ 1]    2     inc dstkptr+1
      008E26 A6               [ 4] 2638 	ret
                                   2639 	
                                   2640 ;-----------------------------
                                   2641 ; duplicate TOS 
                                   2642 ;  dstack: { ix...n -- ix...n n }
                                   2643 ;-----------------------------
      000FD2                       2644 ddup:
      008E27 23 11 01 26      [ 5] 2645 	ldw x,[dstkptr]
      000FD6                       2646 	_dp_down
      008E2B 05 A6 0E CC      [ 1]    1     dec dstkptr+1 
      008E2F 8F 27 00 1A      [ 1]    2     dec dstkptr+1
      008E31 72 CF 00 19      [ 5] 2647     ldw [dstkptr],x  
      008E31 A6               [ 4] 2648 	ret 
                                   2649 
                                   2650 
                                   2651 ;----------------------------------
                                   2652 ; pick value n from dstack 
                                   2653 ; put it on TOS
                                   2654 ; dstack: {ix,..,p -- ix,...,np }
                                   2655 ;-----------------------------------
      000FE3                       2656 dpick:
      008E32 2D 11 01 26      [ 5] 2657 	ldw x,[dstkptr]
      008E36 05               [ 2] 2658 	sllw x 
      008E37 A6 11 CC 8F      [ 2] 2659 	addw x,dstkptr 
      008E3B 27               [ 2] 2660 	ldw x,(x)
      008E3C 72 CF 00 19      [ 5] 2661 	ldw [dstkptr],x 
      008E3C A6               [ 4] 2662 	ret
                                   2663 
                                   2664 ;---------------------------
                                   2665 ;  fetch variable in X 
                                   2666 ;  dstack:{ addr -- value }
                                   2667 ;---------------------------
      000FF2                       2668 fetch:
      008E3D 40 11 01 26      [ 5] 2669 	ldw x,[dstkptr]
      008E41 05               [ 2] 2670 	ldw x,(x)
      008E42 A6 02 CC 8F      [ 5] 2671 	ldw [dstkptr],x
      008E46 27               [ 4] 2672 	ret 
                                   2673 
                                   2674 ;----------------------------
                                   2675 ; store variable 
                                   2676 ; dstack: {addr value -- }
                                   2677 ;----------------------------
      008E47                       2678 store:
      008E47 A6 3F 11         [ 4] 2679 	call dpop 
      008E4A 01 26            [ 1] 2680 	ldw y,x   ; y=value 
      008E4C 11 7B 01         [ 4] 2681 	call dpop 
      008E4F F7               [ 2] 2682 	ldw (x),y 
      008E50 5C               [ 4] 2683 	ret 
                                   2684 
                                   2685 ;---------------------------------
                                   2686 ; drop n elements from data stack 
                                   2687 ; input: 
                                   2688 ;   X 		n 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2689 ; output:
                                   2690 ;   none 
                                   2691 ;-------------------------------------
      001006                       2692 ddrop_n:
      008E51 7F 72            [ 2] 2693 	pushw y 
      008E53 5C 00 02 A6      [ 2] 2694 	ldw y,dstkptr 
      008E57 06               [ 2] 2695 	sllw x 
      008E58 AE               [ 2] 2696 	pushw x 
      008E59 96 72 CC         [ 2] 2697 	addw y,(1,sp)
      008E5C 8F 37 00 19      [ 2] 2698 	ldw dstkptr,y 
      008E5E 85               [ 2] 2699 	popw x 
      008E5E A6 27            [ 2] 2700 	popw y
      008E60 11               [ 4] 2701 	ret 
                                   2702 
      008E61 01 26 0C 72 5C 00 02  2703 dstk_prompt: .asciz "\ndstack: " 
             A6 06 AE
                                   2704 ;----------------------------
                                   2705 ; print dstack content 
                                   2706 ;---------------------------
                           000001  2707 	XSAVE=1
                           000002  2708 	VSIZE=2
      001023                       2709 dots:
      001023                       2710 	_vars VSIZE 
      008E6B 97 81            [ 2]    1     sub sp,#VSIZE 
      008E6D CC 8F 37         [ 2] 2711 	ldw x,#dstk_prompt 
      008E70 CD 01 B0         [ 4] 2712 	call puts
      008E70 A6 2B 11         [ 2] 2713 	ldw x,#dstack_unf-CELL_SIZE
      008E73 01 26 05 A6      [ 1] 2714 	mov base,#10 
      008E77 10 CC 8F         [ 2] 2715 1$:	cpw x,dstkptr 
      008E7A 27 0D            [ 1] 2716 	jrult 4$ 
      008E7B 1F 01            [ 2] 2717 	ldw (XSAVE,sp),x
      008E7B A6               [ 2] 2718 	ldw  x,(x)
      008E7C 2A 11 01         [ 4] 2719 	call print_int 
      008E7F 26 05            [ 2] 2720 	ldw x,(XSAVE,sp)
      008E81 A6 20 CC         [ 2] 2721 	subw x,#CELL_SIZE 
      008E84 8F 27            [ 2] 2722 	jra 1$ 
      008E86 A6 0D            [ 1] 2723 4$: ld a,#CR 
      008E86 A6 2F 11         [ 4] 2724 	call putc 
      001049                       2725 	_drop VSIZE
      008E89 01 26            [ 2]    1     addw sp,#VSIZE 
      008E8B 05               [ 1] 2726 	clr a 
      008E8C A6               [ 4] 2727 	ret
                                   2728 
      008E8D 21 CC 8F 27 63 6B 3A  2729 cstk_prompt: .asciz "\nctack: "
             20 00
                                   2730 ;--------------------------------
                                   2731 ; print cstack content
                                   2732 ;--------------------------------
                           000001  2733 	XSAVE=1
                           000002  2734 	VSIZE=2 
      008E91                       2735 dotr:
      001056                       2736 	_vars VSIZE 
      008E91 A6 25            [ 2]    1     sub sp,#VSIZE 
      008E93 11 01 26         [ 2] 2737 	ldw x,#cstk_prompt
      008E96 05 A6 22         [ 4] 2738 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008E99 CC               [ 1] 2739 	ldw x,sp 
      008E9A 8F 27 07         [ 2] 2740 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008E9C 1F 01            [ 2] 2741 	ldw (XSAVE,sp),x  
      008E9C A6 3D 11         [ 2] 2742 	ldw x,#RAM_SIZE-2
      008E9F 01 26 05 A6      [ 1] 2743 	mov base,#16
      00106B                       2744 dotr_loop:
      008EA3 32 CC            [ 2] 2745 	cpw x,(XSAVE,sp)
      008EA5 8F 27            [ 1] 2746 	jrmi 9$
      008EA7 89               [ 2] 2747 	pushw x  
      008EA7 A6               [ 2] 2748 	ldw x,(x)
      008EA8 3E 11 01         [ 4] 2749 	call print_int 
      008EAB 26               [ 2] 2750 	popw x  
      008EAC 33 A6 31         [ 2] 2751 	subw x,#CELL_SIZE
      008EAF 6B 02            [ 2] 2752 	jra dotr_loop 
      008EB1 72 5C            [ 1] 2753 9$:	ld a,#CR 
      008EB3 00 02 91         [ 4] 2754 	call putc 
      00107F                       2755 	_drop VSIZE 
      008EB6 D6 01            [ 2]    1     addw sp,#VSIZE 
      008EB8 A1               [ 1] 2756 	clr a 
      008EB9 3D               [ 4] 2757 	ret
                                   2758 
                                   2759 
                                   2760 ;--------------------------------
                                   2761 ;  add 2 integers
                                   2762 ;  input:
                                   2763 ;    N1     on cstack 
                                   2764 ;    N2     on cstack 
                                   2765 ;  output:
                                   2766 ;    X 		n2+n1 
                                   2767 ;--------------------------------
                                   2768 	;arugments on cstack 
      001083                       2769 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001083                       2770 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001083                       2771 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001083                       2772 add:
      008EBA 26 0C            [ 2] 2773 	ldw x ,(N2,sp)
      008EBC 7B 01 F7         [ 2] 2774 	addw x,(N1,sp)
      008EBF 5C A6            [ 2] 2775 	ldw (N1,sp),x 
      008EC1 3D               [ 4] 2776 	ret 
                                   2777 
                                   2778 ;--------------------------------
                                   2779 ;  substract 2 ntegers
                                   2780 ;  input:
                                   2781 ;    N1     on cstack 
                                   2782 ;    N2     on cstack 
                                   2783 ;  output:
                                   2784 ;    X 		n2+n1 
                                   2785 ;--------------------------------
      00108B                       2786 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00108B                       2787 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      00108B                       2788 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      00108B                       2789 substract:
      008EC2 6B 01            [ 2] 2790 	ldw x,(N2,sp)
      008EC4 A6 33 20         [ 2] 2791 	subw x,(N1,sp)
      008EC7 5F               [ 4] 2792 	ret 
                                   2793 
                                   2794 ;-------------------------------------
                                   2795 ; multiply 2 integers
                                   2796 ; product overflow is ignored unless
                                   2797 ; MATH_OVF assembler flag is set to 1
                                   2798 ; input:
                                   2799 ;  	N1      on cstack
                                   2800 ;   N2 		on cstack 
                                   2801 ; output:
                                   2802 ;	X        N1*N2 
                                   2803 ;-------------------------------------
                                   2804 	;arguments 
      001091                       2805 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      001091                       2806 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      001091                       2807 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      001091                       2808 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      001091                       2809 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2810    ; local variables 
                           000001  2811 	SIGN=1
                           000002  2812 	PROD=2
                           000003  2813 	VSIZE=3
      001091                       2814 multiply:
      001091                       2815 	_vars VSIZE 
      008EC8 A1 3C            [ 2]    1     sub sp,#VSIZE 
      008ECA 26 0C            [ 1] 2816 	clr (SIGN,sp)
      008ECC 7B 01            [ 2] 2817 	ldw x,(N1_HB,sp)
      008ECE F7               [ 1] 2818 	ld a,xh  
      008ECF 5C A6            [ 1] 2819 	bcp a,#0x80 
      008ED1 3C 6B            [ 1] 2820 	jreq 2$
      008ED3 01 A6            [ 1] 2821 	cpl (SIGN,sp)
      008ED5 35               [ 2] 2822 	negw x 
      008ED6 20 4F            [ 2] 2823 	ldw (N1_HB,sp),x 
      008ED8 72 5A            [ 2] 2824 2$: ldw x,(N2_HB,sp)
      008EDA 00               [ 1] 2825 	ld a,xh  
      008EDB 02 7B            [ 1] 2826 	bcp a,#0x80 
      008EDD 02 20            [ 1] 2827 	jreq 3$
      008EDF 47 01            [ 1] 2828 	cpl (SIGN,sp)
      008EE0 50               [ 2] 2829 	negw x 
      008EE0 A6 3C            [ 2] 2830 	ldw (N2_HB,sp),x 
                                   2831 ; N1_LB * N2_LB 	
      008EE2 11 01            [ 1] 2832 3$:	ld a,(N1_LB,sp)
      008EE4 26               [ 1] 2833 	ld xl,a 
      008EE5 32 A6            [ 1] 2834 	ld a,(N2_LB,sp) 
      008EE7 34               [ 4] 2835 	mul x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                           000000  2836 .if MATH_OVF 	
                                   2837 	ld a,xh 
                                   2838 	bcp a,#0x80 
                                   2839 	jreq 4$ 
                                   2840 	ld a,#ERR_MATH_OVF 
                                   2841 	jp tb_error
                                   2842 .endif 	 
      008EE8 6B 02            [ 2] 2843 4$:	ldw (PROD,sp),x
                                   2844 ; N1_LB * N2_HB	 
      008EEA 72 5C            [ 1] 2845 	ld a,(N1_LB,sp) 
      008EEC 00               [ 1] 2846 	ld xl,a 
      008EED 02 91            [ 1] 2847 	ld a,(N2_HB,sp)
      008EEF D6               [ 4] 2848 	mul x,a
      008EF0 01               [ 1] 2849 	ld a,xl 
      008EF1 A1 3D            [ 1] 2850 	add a,(PROD,sp)
                           000000  2851 .if MATH_OVF 	
                                   2852 	bcp a,#0x80 
                                   2853 	jreq 5$ 
                                   2854 	ld a,#ERR_MATH_OVF 
                                   2855 	jp tb_error
                                   2856 .endif 	 
      008EF3 26 0B            [ 1] 2857 5$:	ld (PROD,sp),a 
                                   2858 ; N1_HB * N2_LB 
      008EF5 7B 01            [ 1] 2859 	ld a,(N1_HB,sp)
      008EF7 F7               [ 1] 2860 	ld xl,a 
      008EF8 A6 3D            [ 1] 2861 	ld a,(N2_LB,sp)
      008EFA 6B               [ 4] 2862 	mul x,a 
      008EFB 01               [ 1] 2863 	ld a,xl 
      008EFC A6 36            [ 1] 2864 	add a,(PROD,sp)
                           000000  2865 .if MATH_OVF 	
                                   2866 	bcp a,#0x80 
                                   2867 	jreq 6$ 
                                   2868 	ld a,#ERR_MATH_OVF 
                                   2869 	jp tb_error
                                   2870 .endif 	 
      008EFE 20 27            [ 1] 2871 6$:	ld (PROD,sp),a 
                                   2872 ; N1_HB * N2_HB 	
                                   2873 ; it is pointless to multiply N1_HB*N2_HB 
                                   2874 ; as this product is over 65535 or 0 
                                   2875 ;
                                   2876 ; sign adjust product
      008F00 A1 3E            [ 1] 2877 	tnz (SIGN,sp)
      008F02 26 0C            [ 1] 2878 	jreq 7$
      008F04 7B 01            [ 2] 2879 	ldw x, (PROD,sp)
      008F06 F7               [ 2] 2880 	negw x
      008F07 5C A6            [ 2] 2881 	ldw (PROD,sp),x  
      0010D4                       2882 7$: 
      008F09 3E 6B            [ 2] 2883 	ldw x,(PROD,sp) 
      0010D6                       2884 	_drop VSIZE 
      008F0B 01 A6            [ 2]    1     addw sp,#VSIZE 
      008F0D 35               [ 4] 2885 	ret
                                   2886 
                                   2887 ;----------------------------------
                                   2888 ;  euclidian divide n2/n1 
                                   2889 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2890 ;    N2 	on cstack
                                   2891 ;    N1 	on cstack
                                   2892 ; output:
                                   2893 ;    X      n2/n1 
                                   2894 ;    Y      remainder 
                                   2895 ;----------------------------------
      0010D9                       2896 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      0010D9                       2897 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      0010D9                       2898 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2899 	; local variables
                           000001  2900 	SQUOT=1 ; sign quotient
                           000002  2901 	SDIVD=2 ; sign dividend  
                           000002  2902 	VSIZE=2
      0010D9                       2903 divide:
      0010D9                       2904 	_vars VSIZE 
      008F0E 20 17            [ 2]    1     sub sp,#VSIZE 
      008F10 72 5A            [ 1] 2905 	clr (SQUOT,sp)
      008F12 00 02            [ 1] 2906 	clr (SDIVD,sp)
                                   2907 ; check for 0 divisor
      008F14 7B 02            [ 2] 2908 	ldw x,(DIVISR,sp)
      008F16 20               [ 2] 2909 	tnzw x 
      008F17 0F 05            [ 1] 2910     jrne 0$
      008F18 A6 04            [ 1] 2911 	ld a,#ERR_DIV0 
      008F18 7B 01 CD         [ 2] 2912 	jp tb_error 
                                   2913 ; check divisor sign 	
      008F1B 85               [ 1] 2914 0$:	ld a,xh 
      008F1C 84 25            [ 1] 2915 	bcp a,#0x80 
      008F1E 03 CC            [ 1] 2916 	jreq 1$
      008F20 87 98            [ 1] 2917 	cpl (SQUOT,sp)
      008F22 50               [ 2] 2918 	negw x 
      008F22 CD 8D            [ 2] 2919 1$:	ldw (DIVISR,sp),x
                                   2920 ; check dividend sign 	 
      008F24 4A 20            [ 2] 2921     ldw x,(DIVIDND,sp)
      008F26 10               [ 1] 2922 	ld a,xh 
      008F27 A5 80            [ 1] 2923 	bcp a,#0x80 
      008F27 6B 02            [ 1] 2924 	jreq 2$ 
      008F29 7B 01            [ 1] 2925 	cpl (SQUOT,sp)
      008F2B F7 5C            [ 1] 2926 	cpl (SDIVD,sp)
      008F2D 7F               [ 2] 2927 	negw x 
      008F2E 72 5C            [ 2] 2928 2$:	ldw y,(DIVISR,sp)
      008F30 00               [ 2] 2929 	divw x,y
      008F31 02 7B 02 AE      [ 2] 2930 	ldw acc16,y 
                                   2931 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      008F35 17 18            [ 1] 2932 	tnz (SDIVD,sp)
      008F37 27 0B            [ 1] 2933 	jreq 7$
      008F37 5B 02            [ 2] 2934 	tnzw y 
      008F39 81 07            [ 1] 2935 	jreq 7$
      008F3A 5C               [ 1] 2936 	incw x
      008F3A A1 30            [ 2] 2937 	ldw y,(DIVISR,sp)
      008F3C 25 03 A1 3A      [ 2] 2938 	subw y,acc16
      008F40 8C 8C            [ 1] 2939 7$: tnz (SQUOT,sp)
      008F42 81 01            [ 1] 2940 	jreq 9$ 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008F43 50               [ 2] 2941 8$:	negw x 
      00111A                       2942 9$: 
      00111A                       2943 	_drop VSIZE 
      008F43 A1 61            [ 2]    1     addw sp,#VSIZE 
      008F45 2A               [ 4] 2944 	ret 
                                   2945 
                                   2946 
                                   2947 ;----------------------------------
                                   2948 ;  remainder resulting from euclidian 
                                   2949 ;  division of n2/n1 
                                   2950 ; input:
                                   2951 ;   N1 		cstack 
                                   2952 ;   N2      cstack
                                   2953 ; output:
                                   2954 ;   X       N2%N1 
                                   2955 ;----------------------------------
                           000003  2956 	N1=3
                           000005  2957 	N2=5
                           000004  2958 	VSIZE=4
      00111D                       2959 modulo:
      008F46 01 81            [ 2] 2960 	Ldw x,(N1,sp)
      008F48 A1 7A            [ 2] 2961 	ldw y,(N2,sp)
      001121                       2962 	_vars VSIZE 
      008F4A 22 FB            [ 2]    1     sub sp,#VSIZE 
      008F4C A0 20            [ 2] 2963 	ldw (1,sp),x 
      008F4E 81 03            [ 2] 2964 	ldw (3,sp),y 
      008F4F CD 10 D9         [ 4] 2965 	call divide 
      008F4F 89               [ 1] 2966 	ldw x,y
      00112B                       2967 	_drop VSIZE 
      008F50 52 03            [ 2]    1     addw sp,#VSIZE 
      008F52 72               [ 4] 2968 	ret 
                                   2969 
                                   2970 
                                   2971 ;----------------------------------
                                   2972 ; search in kword_dict command name
                                   2973 ;  from its execution address 
                                   2974 ; input:
                                   2975 ;   X       	execution address 
                                   2976 ; output:
                                   2977 ;   X 			cstr*  | 0 
                                   2978 ;--------------------------------
                           000001  2979 	XADR=1 
                           000003  2980 	LINK=3 
                           000004  2981 	VSIZE=4
      00112E                       2982 cmd_name:
      00112E                       2983 	_vars VSIZE 
      008F53 5F 00            [ 2]    1     sub sp,#VSIZE 
      008F55 09 72 5F 00      [ 1] 2984 	clr acc16 
      008F59 0A 72            [ 2] 2985 	ldw (XADR,sp),x  
      008F5B 5F 00 0B         [ 2] 2986 	ldw x,#kword_dict	
      008F5E C6 17            [ 2] 2987 1$:	ldw (LINK,sp),x
      008F60 18 27            [ 1] 2988 	ld a,(2,x)
      008F62 5A 0F            [ 1] 2989 	and a,#15 
      008F64 01 A6 0A         [ 1] 2990 	ld acc8,a 
      008F67 6B 02 AE         [ 2] 2991 	addw x,#3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008F6A 17 18 F6 27      [ 2] 2992 	addw x,acc16
      008F6E 47               [ 2] 2993 	ldw x,(x) ; execution address 
      008F6F A1 2D            [ 2] 2994 	cpw x,(XADR,sp)
      008F71 26 04            [ 1] 2995 	jreq 2$
      008F73 03 01            [ 2] 2996 	ldw x,(LINK,sp)
      008F75 20               [ 2] 2997 	ldw x,(x) 
      008F76 08 A1 24         [ 2] 2998 	subw x,#2  
      008F79 26 06            [ 1] 2999 	jrne 1$
      008F7B A6 10            [ 2] 3000 	jra 9$
      008F7D 6B 02            [ 2] 3001 2$: ldw x,(LINK,sp)
      008F7F 5C F6 02         [ 2] 3002 	addw x,#2 	
      008F81                       3003 9$:	_drop VSIZE
      008F81 A1 61            [ 2]    1     addw sp,#VSIZE 
      008F83 2B               [ 4] 3004 	ret
                                   3005 
                                   3006 
                                   3007 ;---------------------------------
                                   3008 ; input:
                                   3009 ;	X 		dictionary entry point 
                                   3010 ;  pad		.asciz name to search 
                                   3011 ; output:
                                   3012 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3013 ;  X		execution address | 0 
                                   3014 ;---------------------------------
                           000001  3015 	NLEN=1 ; cmd length 
                           000002  3016 	YSAVE=2
                           000003  3017 	VSIZE=3 
      001160                       3018 search_dict:
      001160                       3019 	_vars VSIZE 
      008F84 02 A0            [ 2]    1     sub sp,#VSIZE 
      008F86 20 A1            [ 1] 3020 	ldw y,x 
      001164                       3021 search_next:	
      008F88 30 2B            [ 1] 3022 	ld a,(y)
      008F8A 2B A0            [ 1] 3023 	and a,#0xf 
      008F8C 30 A1            [ 1] 3024 	ld (NLEN,sp),a  
      008F8E 0A 2B 06         [ 2] 3025 	ldw x,#pad 
      008F91 A0 07            [ 2] 3026 	ldw (YSAVE,sp),y
      008F93 11 02            [ 1] 3027 	incw y  
      001171                       3028 cp_loop:
      008F95 2A               [ 1] 3029 	ld a,(x)
      008F96 1F 6B            [ 1] 3030 	jreq str_match 
      008F98 03 7B            [ 1] 3031 	tnz (NLEN,sp)
      008F9A 02 CD            [ 1] 3032 	jreq no_match  
      008F9C 8F C1            [ 1] 3033 	cp a,(y)
      008F9E 7B 03            [ 1] 3034 	jrne no_match 
      008FA0 CB 00            [ 1] 3035 	incw y 
      008FA2 0B               [ 1] 3036 	incw x
      008FA3 C7 00            [ 1] 3037 	dec (NLEN,sp)
      008FA5 0B 4F            [ 2] 3038 	jra cp_loop 
      001183                       3039 no_match:
      008FA7 C9 00            [ 2] 3040 	ldw y,(YSAVE,sp) 
      008FA9 0A C7 00 0A      [ 2] 3041 	subw y,#2 ; move Y to link field
      008FAD 4F C9            [ 1] 3042 	push #TK_NONE 
      008FAF 00 09            [ 2] 3043 	ldw y,(y) ; next word link 
      008FB1 C7               [ 1] 3044 	pop a ; TK_NONE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008FB2 00 09            [ 1] 3045 	jreq search_exit  ; not found  
                                   3046 ;try next 
      008FB4 20 C9            [ 2] 3047 	jra search_next
      001192                       3048 str_match:
      008FB6 0D 01            [ 2] 3049 	ldw y,(YSAVE,sp)
      008FB8 27 03            [ 1] 3050 	ld a,(y)
      008FBA CD 8A            [ 1] 3051 	ld (NLEN,sp),a ; needed to test keyword type  
      008FBC E8 0F            [ 1] 3052 	and a,#0xf 
                                   3053 ; move y to procedure address field 	
      008FBD 4C               [ 1] 3054 	inc a 
      008FBD 5B 03 85         [ 1] 3055 	ld acc8,a 
      008FC0 81 5F 00 09      [ 1] 3056 	clr acc16 
      008FC1 72 B9 00 09      [ 2] 3057 	addw y,acc16 
      008FC1 89 88            [ 2] 3058 	ldw y,(y) ; routine entry point 
                                   3059 ;determine keyword type bits 7:6 
      008FC3 5F 89            [ 1] 3060 	ld a,(NLEN,sp)
      008FC5 C6               [ 1] 3061 	swap a 
      008FC6 00 0B            [ 1] 3062 	and a,#0xc
      008FC8 97               [ 1] 3063 	srl a
      008FC9 7B               [ 1] 3064 	srl a 
      008FCA 03 42            [ 1] 3065 	add a,#6
      0011B1                       3066 search_exit: 
      008FCC 9F               [ 1] 3067 	ldw x,y ; x=routine address 
      0011B2                       3068 	_drop VSIZE 	 
      008FCD C7 00            [ 2]    1     addw sp,#VSIZE 
      008FCF 0B               [ 4] 3069 	ret 
                                   3070 
                                   3071 ;---------------------
                                   3072 ; check if next token
                                   3073 ;  is of expected type 
                                   3074 ; input:
                                   3075 ;   A 		 expected token attribute
                                   3076 ;  ouput:
                                   3077 ;   none     if fail call tb_error 
                                   3078 ;--------------------
      0011B5                       3079 expect:
      008FD0 9E               [ 1] 3080 	push a 
      008FD1 6B 02 C6         [ 4] 3081 	call next_token 
      008FD4 00 0A            [ 1] 3082 	cp a,(1,sp)
      008FD6 97 7B            [ 1] 3083 	jreq 1$
      008FD8 03 42 72         [ 2] 3084 	jp syntax_error
      008FDB FB               [ 1] 3085 1$: pop a 
      008FDC 01               [ 4] 3086 	ret 
                                   3087 
                                   3088 
                                   3089 ;-------------------------------
                                   3090 ; parse embedded BASIC routines 
                                   3091 ; arguments list.
                                   3092 ; arg_list::=  rel[','rel]*
                                   3093 ; all arguments are of integer type
                                   3094 ; input:
                                   3095 ;   none
                                   3096 ; output:
                                   3097 ;   A 			number of arguments pushed on dstack  
                                   3098 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                           000001  3099 	ARG_CNT=1 
      0011C2                       3100 arg_list:
      008FDD 9F C7            [ 1] 3101 	push #0  
      008FDF 00 0A 4F         [ 4] 3102 1$: call relation
      008FE2 A9 00            [ 1] 3103 	cp a,#TK_NONE 
      008FE4 6B 01            [ 1] 3104 	jreq 5$
      008FE6 9E 6B            [ 1] 3105 	cp a,#TK_INTGR
      008FE8 02 C6            [ 1] 3106 	jrne 4$
      008FEA 00 09 97         [ 4] 3107 3$: call dpush 
      008FED 7B 03            [ 1] 3108     inc (ARG_CNT,sp)
      008FEF 42 72 FB         [ 4] 3109 	call next_token 
      008FF2 01 9F            [ 1] 3110 	cp a,#TK_NONE 
      008FF4 C7 00            [ 1] 3111 	jreq 5$ 
      008FF6 09 5B            [ 1] 3112 	cp a,#TK_COMMA 
      008FF8 03 85            [ 1] 3113 	jrne 4$
      008FFA 81 E3            [ 2] 3114 	jra 1$ 
      008FFB CD 0F 8E         [ 4] 3115 4$:	call unget_token 
      008FFB 88               [ 1] 3116 5$:	pop a 
      008FFC 91               [ 4] 3117 	ret 
                                   3118 
                                   3119 
                                   3120 
                                   3121 ;--------------------------------
                                   3122 ;   BASIC commnands 
                                   3123 ;--------------------------------
                                   3124 
                                   3125 ;--------------------------------
                                   3126 ;  arithmetic and relational 
                                   3127 ;  routines
                                   3128 ;  operators precedence
                                   3129 ;  highest to lowest
                                   3130 ;  operators on same row have 
                                   3131 ;  same precedence and are executed
                                   3132 ;  from left to right.
                                   3133 ;	'*','/','%'
                                   3134 ;   '-','+'
                                   3135 ;   '=','>','<','>=','<=','<>','><'
                                   3136 ;   '<>' and '><' are equivalent for not equal.
                                   3137 ;--------------------------------
                                   3138 
                                   3139 ;---------------------
                                   3140 ; return array element
                                   3141 ; address from @(expr)
                                   3142 ; input:
                                   3143 ;   A 		TK_ARRAY
                                   3144 ; output:
                                   3145 ;   A 		TK_INTGR
                                   3146 ;	X 		element address 
                                   3147 ;----------------------
      0011E6                       3148 get_array_element:
                                   3149 ;	call ddrop 
      008FFD D6 01            [ 1] 3150 	ld a,#TK_LPAREN 
      008FFF 27 0A 11         [ 4] 3151 	call expect
      009002 01 26 06         [ 4] 3152 	call relation 
      009005 72 5C            [ 1] 3153 	cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009007 00 02            [ 1] 3154 	jreq 1$
      009009 20 F1 5B         [ 2] 3155 	jp syntax_error
      00900C 01               [ 2] 3156 1$: pushw x 
      00900D 81 0C            [ 1] 3157 	ld a,#TK_RPAREN 
      00900E CD 11 B5         [ 4] 3158 	call expect
                                   3159 	; check for bounds 
      00900E CE               [ 2] 3160 	popw x   
      00900F 00 12 CF         [ 2] 3161 	cpw x,array_size 
      009012 00 01            [ 2] 3162 	jrule 3$
                                   3163 ; bounds {1..array_size}	
      009014 81 0A            [ 1] 3164 2$: ld a,#ERR_BAD_VALUE 
      009015 CC 07 1A         [ 2] 3165 	jp tb_error 
      009015 72               [ 2] 3166 3$: tnzw  x
      009016 5A 00            [ 1] 3167 	jreq 2$ 
      009018 1B               [ 2] 3168 	sllw x 
      009019 72               [ 2] 3169 	pushw x 
      00901A 5A 00 1B         [ 2] 3170 	ldw x,array_addr  
      00901D 72 CF 00         [ 2] 3171 	subw x,(1,sp)
      001211                       3172 	_drop 2   
      009020 1A 81            [ 2]    1     addw sp,#2 
      009022 A6 04            [ 1] 3173 	ld a,#TK_INTGR
      009022 72               [ 4] 3174 	ret 
                                   3175 
                                   3176 ;***********************************
                                   3177 ;   expression parse,execute 
                                   3178 ;***********************************
                                   3179 ;-----------------------------------
                                   3180 ; factor ::= ['+'|'-'|e] var | @ |
                                   3181 ;			 integer | function |
                                   3182 ;			 '('relation')' 
                                   3183 ; output:
                                   3184 ;   A    token attribute 
                                   3185 ;   X 	 integer
                                   3186 ; ---------------------------------
                           000001  3187 	NEG=1
                           000001  3188 	VSIZE=1
      001216                       3189 factor:
      001216                       3190 	_vars VSIZE 
      009023 CE 00            [ 2]    1     sub sp,#VSIZE 
      009025 1A 72 5C         [ 4] 3191 	call next_token
      009028 00 1B            [ 1] 3192 	cp a,#CMD_END 
      00902A 72 5C            [ 1] 3193 	jrmi 20$
      00902C 00 1B            [ 1] 3194 1$:	ld (NEG,sp),a 
      00902E 81 30            [ 1] 3195 	and a,#TK_GRP_MASK
      00902F A1 10            [ 1] 3196 	cp a,#TK_GRP_ADD 
      00902F 72 CE            [ 1] 3197 	jreq 2$
      009031 00 1A            [ 1] 3198 	ld a,(NEG,sp)
      009033 89 AE            [ 2] 3199 	jra 4$  
      00122B                       3200 2$:	
      009035 00 02 72         [ 4] 3201 	call next_token 
      00122E                       3202 4$:	
      009038 DE 00            [ 1] 3203 	cp a,#TK_IFUNC 
      00903A 1A 72            [ 1] 3204 	jrne 5$ 
      00903C CF               [ 4] 3205 	call (x) 
      00903D 00 1A            [ 2] 3206 	jra 18$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      001235                       3207 5$:
      00903F AE 00            [ 1] 3208 	cp a,#TK_INTGR
      009041 02 90            [ 1] 3209 	jrne 6$
      009043 85 72            [ 2] 3210 	jra 18$
      00123B                       3211 6$:
      009045 DF 00            [ 1] 3212 	cp a,#TK_ARRAY
      009047 1A 81            [ 1] 3213 	jrne 10$
      009049 CD 11 E6         [ 4] 3214 	call get_array_element
      009049 72               [ 2] 3215 	ldw x,(x)
      00904A 5C 00            [ 2] 3216 	jra 18$ 
      001245                       3217 10$:
      00904C 1B 72            [ 1] 3218 	cp a,#TK_VAR 
      00904E 5C 00            [ 1] 3219 	jrne 12$
      009050 1B               [ 2] 3220 	ldw x,(x)
      009051 81 14            [ 2] 3221 	jra 18$
      009052                       3222 12$:			
      009052 72 CE            [ 1] 3223 	cp a,#TK_LPAREN
      009054 00 1A            [ 1] 3224 	jrne 16$
      009056 72 5A 00         [ 4] 3225 	call relation
      009059 1B 72            [ 1] 3226 	ld a,#TK_RPAREN 
      00905B 5A 00 1B         [ 4] 3227 	call expect
      00905E 72 CF            [ 2] 3228 	jra 18$	
      00125A                       3229 16$:
      009060 00 1A 81         [ 4] 3230 	call unget_token
      009063 4F               [ 1] 3231 	clr a 
      009063 72 CE            [ 2] 3232 	jra 20$ 
      001260                       3233 18$: 
      009065 00 1A            [ 1] 3234 	ld a,#TK_MINUS 
      009067 58 72            [ 1] 3235 	cp a,(NEG,sp)
      009069 BB 00            [ 1] 3236 	jrne 19$
      00906B 1A               [ 2] 3237 	negw x
      001267                       3238 19$:
      00906C FE 72            [ 1] 3239 	ld a,#TK_INTGR
      001269                       3240 20$:
      001269                       3241 	_drop VSIZE
      00906E CF 00            [ 2]    1     addw sp,#VSIZE 
      009070 1A               [ 4] 3242 	ret
                                   3243 
                                   3244 ;-----------------------------------
                                   3245 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3246 ; output:
                                   3247 ;   A    	token attribute 
                                   3248 ;	X		integer
                                   3249 ;-----------------------------------
                           000001  3250 	N1=1
                           000003  3251 	N2=3
                           000005  3252 	MULOP=5
                           000005  3253 	VSIZE=5
      00126C                       3254 term:
      00126C                       3255 	_vars VSIZE
      009071 81 05            [ 2]    1     sub sp,#VSIZE 
      009072 CD 12 16         [ 4] 3256 	call factor
      009072 72 CE            [ 1] 3257 	cp a,#CMD_END
      009074 00 1A            [ 1] 3258 	jrmi term_exit
      001275                       3259 term01:	 ; check for  operator 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009076 FE 72            [ 2] 3260 	ldw (N2,sp),x  ; save first factor 
      009078 CF 00 1A         [ 4] 3261 	call next_token
      00907B 81 02            [ 1] 3262 	cp a,#2
      00907C 2B 34            [ 1] 3263 	jrmi 9$
      00907C CD 90            [ 1] 3264 0$:	ld (MULOP,sp),a
      00907E 22 90            [ 1] 3265 	and a,#TK_GRP_MASK
      009080 93 CD            [ 1] 3266 	cp a,#TK_GRP_MULT
      009082 90 22            [ 1] 3267 	jreq 1$
      009084 FF 81            [ 1] 3268 	ld a,(MULOP,sp) 
      009086 CD 0F 8E         [ 4] 3269 	call unget_token 
      009086 90 89            [ 2] 3270 	jra 9$
      00128D                       3271 1$:	; got *|/|%
      009088 90 CE 00         [ 4] 3272 	call factor
      00908B 1A 58            [ 1] 3273 	cp a,#TK_INTGR
      00908D 89 72            [ 1] 3274 	jreq 2$ 
      00908F F9 01 90         [ 2] 3275 	jp syntax_error
      009092 CF 00            [ 2] 3276 2$:	ldw (N1,sp),x  
      009094 1A 85            [ 1] 3277 	ld a,(MULOP,sp) 
      009096 90 85            [ 1] 3278 	cp a,#TK_MULT 
      009098 81 0A            [ 1] 3279 	jrne 3$
      00909A 64 73 74         [ 4] 3280 	call multiply 
      00909D 61 63            [ 2] 3281 	jra term01
      00909F 6B 3A            [ 1] 3282 3$: cp a,#TK_DIV 
      0090A1 20 00            [ 1] 3283 	jrne 4$ 
      0090A3 CD 10 D9         [ 4] 3284 	call divide 
      0090A3 52 02            [ 2] 3285 	jra term01 
      0090A5 AE 90 99         [ 4] 3286 4$: call modulo
      0090A8 CD 82            [ 2] 3287 	jra term01 
      0090AA 30 AE            [ 2] 3288 9$: ldw x,(N2,sp)  
      0090AC 17 7E            [ 1] 3289 	ld a,#TK_INTGR 	
      0012B6                       3290 term_exit:
      0012B6                       3291 	_drop VSIZE 
      0090AE 35 0A            [ 2]    1     addw sp,#VSIZE 
      0090B0 00               [ 4] 3292 	ret 
                                   3293 
                                   3294 ;-------------------------------
                                   3295 ;  expr ::= term [['+'|'-'] term]*
                                   3296 ;  result range {-32768..32767}
                                   3297 ;  output:
                                   3298 ;   A    token attribute 
                                   3299 ;   X	 integer   
                                   3300 ;-------------------------------
                           000001  3301 	N1=1 
                           000003  3302 	N2=3
                           000005  3303 	OP=5 
                           000005  3304 	VSIZE=5 
      0012B9                       3305 expression:
      0012B9                       3306 	_vars VSIZE 
      0090B1 08 C3            [ 2]    1     sub sp,#VSIZE 
      0090B3 00 1A 25         [ 4] 3307 	call term
      0090B6 0D 1F            [ 1] 3308 	cp a,#CMD_END 
      0090B8 01 FE            [ 1] 3309 	jrmi expr_exit 
      0090BA CD 8A            [ 2] 3310 0$:	ldw (N2,sp),x 
      0090BC 1D 1E 01         [ 4] 3311 	call next_token
      0090BF 1D 00            [ 1] 3312 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0090C1 02 20            [ 1] 3313 	jrmi 9$ 
      0090C3 EE A6            [ 1] 3314 1$:	ld (OP,sp),a  
      0090C5 0D CD            [ 1] 3315 	and a,#TK_GRP_MASK
      0090C7 82 1E            [ 1] 3316 	cp a,#TK_GRP_ADD 
      0090C9 5B 02            [ 1] 3317 	jreq 2$ 
      0090CB 4F 81            [ 1] 3318 	ld a,(OP,sp)
      0090CD 0A 63 74         [ 4] 3319 	call unget_token
      0090D0 61 63            [ 2] 3320 	jra 9$
      0012DA                       3321 2$: 
      0090D2 6B 3A 20         [ 4] 3322 	call term
      0090D5 00 04            [ 1] 3323 	cp a,#TK_INTGR 
      0090D6 27 03            [ 1] 3324 	jreq 3$
      0090D6 52 02 AE         [ 2] 3325 	jp syntax_error
      0090D9 90 CD            [ 2] 3326 3$:	ldw (N1,sp),x 
      0090DB CD 82            [ 1] 3327 	ld a,(OP,sp)
      0090DD 30 96            [ 1] 3328 	cp a,#TK_PLUS 
      0090DF 1C 00            [ 1] 3329 	jrne 4$
      0090E1 07 1F 01         [ 4] 3330 	call add 
      0090E4 AE 17            [ 2] 3331 	jra 0$ 
      0090E6 FE 35 10         [ 4] 3332 4$:	call substract
      0090E9 00 08            [ 2] 3333 	jra 0$
      0090EB 1E 03            [ 2] 3334 9$: ldw x,(N2,sp)
      0090EB 13 01            [ 1] 3335 	ld a,#TK_INTGR	
      0012FA                       3336 expr_exit:
      0012FA                       3337 	_drop VSIZE 
      0090ED 2B 0B            [ 2]    1     addw sp,#VSIZE 
      0090EF 89               [ 4] 3338 	ret 
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
      0012FD                       3352 relation: 
      0012FD                       3353 	_vars VSIZE
      0090F0 FE CD            [ 2]    1     sub sp,#VSIZE 
      0090F2 8A 1D 85         [ 4] 3354 	call expression
      0090F5 1D 00            [ 1] 3355 	cp a,#CMD_END  
      0090F7 02 20            [ 1] 3356 	jrmi rel_exit 
                                   3357 	; expect rel_op or leave 
      0090F9 F1 A6            [ 2] 3358 	ldw (N2,sp),x 
      0090FB 0D CD 82         [ 4] 3359 	call next_token 
      0090FE 1E 5B            [ 1] 3360 	cp a,#2
      009100 02 4F            [ 1] 3361 	jrmi 9$
      00130F                       3362 1$:	
      009102 81 05            [ 1] 3363 	ld (RELOP,sp),a 
      009103 A4 30            [ 1] 3364 	and a,#TK_GRP_MASK
      009103 1E 05            [ 1] 3365 	cp a,#TK_GRP_RELOP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009105 72 FB            [ 1] 3366 	jreq 2$
      009107 03 1F            [ 1] 3367 	ld a,(RELOP,sp)
      009109 03 81 8E         [ 4] 3368 	call unget_token  
      00910B 20 2F            [ 2] 3369 	jra 9$
      00131E                       3370 2$:	; expect another expression or error 
      00910B 1E 05 72         [ 4] 3371 	call expression
      00910E F0 03            [ 1] 3372 	cp a,#TK_INTGR 
      009110 81 03            [ 1] 3373 	jreq 3$
      009111 CC 07 18         [ 2] 3374 	jp syntax_error 
      009111 52 03            [ 2] 3375 3$:	ldw (N1,sp),x 
      009113 0F 01 1E         [ 4] 3376 	call substract
      009116 06 9E            [ 1] 3377 	jrne 4$
      009118 A5 80 27 05      [ 1] 3378 	mov acc8,#2 ; n1==n2
      00911C 03 01            [ 2] 3379 	jra 6$ 
      001335                       3380 4$: 
      00911E 50 1F            [ 1] 3381 	jrsgt 5$  
      009120 06 1E 08 9E      [ 1] 3382 	mov acc8,#4 ; n1<2 
      009124 A5 80            [ 2] 3383 	jra 6$
      00133D                       3384 5$:
      009126 27 05 03 01      [ 1] 3385 	mov acc8,#1 ; n1>n2 
      001341                       3386 6$:
      00912A 50               [ 1] 3387 	clrw x 
      00912B 1F 08 7B         [ 1] 3388 	ld a, acc8  
      00912E 07 97            [ 1] 3389 	and a,(RELOP,sp)
      009130 7B               [ 1] 3390 	tnz a 
      009131 09 42            [ 1] 3391 	jreq 10$
      009133 1F               [ 1] 3392 	incw x 
      00134B                       3393 7$:	 
      009134 02 7B            [ 2] 3394 	jra 10$  	
      009136 07 97            [ 2] 3395 9$: ldw x,(N2,sp)
      00134F                       3396 10$:
      009138 7B 08            [ 1] 3397 	ld a,#TK_INTGR
      001351                       3398 rel_exit: 	 
      001351                       3399 	_drop VSIZE
      00913A 42 9F            [ 2]    1     addw sp,#VSIZE 
      00913C 1B               [ 4] 3400 	ret 
                                   3401 
                                   3402 ;--------------------------------
                                   3403 ; BASIC: SHOW 
                                   3404 ;  show content of dstack,cstack
                                   3405 ;--------------------------------
      001354                       3406 show:
      00913D 02 6B 02         [ 1] 3407 	ld a,base 
      009140 7B               [ 1] 3408 	push a 
      009141 06 97 7B         [ 4] 3409 	call dots
      009144 09 42 9F         [ 4] 3410 	call dotr 
      009147 1B               [ 1] 3411 	pop a 
      009148 02 6B 02         [ 1] 3412 	ld base,a 
      00914B 0D               [ 1] 3413 	clr a 
      00914C 01               [ 4] 3414 	ret
                                   3415 
                                   3416 ;--------------------------------------------
                                   3417 ; BASIC: HEX 
                                   3418 ; select hexadecimal base for integer print
                                   3419 ;---------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      001364                       3420 hex_base:
      00914D 27 05 1E 02      [ 1] 3421 	mov base,#16 
      009151 50               [ 4] 3422 	ret 
                                   3423 
                                   3424 ;--------------------------------------------
                                   3425 ; BASIC: DEC 
                                   3426 ; select decimal base for integer print
                                   3427 ;---------------------------------------------
      001369                       3428 dec_base:
      009152 1F 02 00 07      [ 1] 3429 	mov base,#10
      009154 81               [ 4] 3430 	ret 
                                   3431 
                                   3432 ;------------------------
                                   3433 ; BASIC: SIZE 
                                   3434 ; return free size in text area
                                   3435 ; output:
                                   3436 ;   A 		TK_INTGR
                                   3437 ;   X 	    size integer
                                   3438 ;--------------------------
      00136E                       3439 size:
      009154 1E 02 5B         [ 2] 3440 	ldw x,#tib 
      009157 03 81 00 1D      [ 2] 3441 	subw x,txtend 
      009159 A6 04            [ 1] 3442 	ld a,#TK_INTGR
      009159 52               [ 4] 3443 	ret 
                                   3444 
                                   3445 
                                   3446 ;------------------------
                                   3447 ; BASIC: UBOUND  
                                   3448 ; return array variable size 
                                   3449 ; output:
                                   3450 ;   A 		TK_INTGR
                                   3451 ;   X 	    array size 
                                   3452 ;--------------------------
      001378                       3453 ubound:
      00915A 02 0F 01         [ 2] 3454 	ldw x,#tib
      00915D 0F 02 1E 05      [ 2] 3455 	subw x,txtend 
      009161 5D               [ 2] 3456 	srlw x 
      009162 26 05 A6         [ 2] 3457 	ldw array_size,x
      009165 04 CC            [ 1] 3458 	ld a,#TK_INTGR
      009167 87               [ 4] 3459 	ret 
                                   3460 
                                   3461 ;-----------------------------
                                   3462 ; BASIC: LET var=expr 
                                   3463 ; variable assignement 
                                   3464 ; output:
                                   3465 ;   A 		TK_NONE 
                                   3466 ;-----------------------------
      001386                       3467 let:
      009168 9A 9E A5         [ 4] 3468 	call next_token 
      00916B 80 27            [ 1] 3469 	cp a,#TK_VAR 
      00916D 03 03            [ 1] 3470 	jreq let02
      00916F 01 50 1F         [ 2] 3471 	jp syntax_error
      001390                       3472 let02:
      009172 05 1E 07         [ 4] 3473 	call dpush 
      009175 9E A5 80         [ 4] 3474 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009178 27 05            [ 1] 3475 	cp a,#TK_EQUAL
      00917A 03 01            [ 1] 3476 	jreq 1$
      00917C 03 02 50         [ 2] 3477 	jp syntax_error
      00139D                       3478 1$:	
      00917F 16 05 65         [ 4] 3479 	call relation   
      009182 90 CF            [ 1] 3480 	cp a,#TK_INTGR 
      009184 00 0A            [ 1] 3481 	jreq 2$
      009186 0D 02 27         [ 2] 3482 	jp syntax_error
      0013A7                       3483 2$:	
      009189 0B 90            [ 1] 3484 	ldw y,x 
      00918B 5D 27 07         [ 4] 3485 	call dpop  
      00918E 5C               [ 2] 3486 	ldw (x),y   
      00918F 16               [ 4] 3487 	ret 
                                   3488 
                                   3489 ;----------------------------
                                   3490 ; BASIC: LIST [[start][,end]]
                                   3491 ; list program lines 
                                   3492 ; form start to end 
                                   3493 ; if empty argument list then 
                                   3494 ; list all.
                                   3495 ;----------------------------
                           000001  3496 	FIRST=1
                           000003  3497 	LAST=3 
                           000005  3498 	LN_PTR=5
                           000006  3499 	VSIZE=6 
      0013AE                       3500 list:
      0013AE                       3501 	_vars VSIZE
      009190 05 72            [ 2]    1     sub sp,#VSIZE 
      009192 B2 00 0A         [ 2] 3502 	ldw x,txtbgn 
      009195 0D 01 27         [ 2] 3503 	cpw x,txtend 
      009198 01 50            [ 1] 3504 	jrmi 1$
      00919A CC 14 2E         [ 2] 3505 	jp list_exit ; nothing to list 
      00919A 5B 02            [ 2] 3506 1$:	ldw (LN_PTR,sp),x 
      00919C 81               [ 2] 3507 	ldw x,(x) 
      00919D 1F 01            [ 2] 3508 	ldw (FIRST,sp),x ; list from first line 
      00919D 1E 03 16         [ 2] 3509 	ldw x,#0x7fff ; biggest line number 
      0091A0 05 52            [ 2] 3510 	ldw (LAST,sp),x 
      0091A2 04 1F 01         [ 4] 3511 	call arg_list
      0091A5 17               [ 1] 3512 	tnz a
      0091A6 03 CD            [ 1] 3513 	jreq list_start 
      0091A8 91 59            [ 1] 3514 	cp a,#2 
      0091AA 93 5B            [ 1] 3515 	jreq 4$
      0091AC 04 81            [ 1] 3516 	cp a,#1 
      0091AE 27 06            [ 1] 3517 	jreq first_line 
      0091AE 52 04 72         [ 2] 3518 	jp syntax_error 
      0091B1 5F 00 0A         [ 4] 3519 4$:	call dswap
      0013D9                       3520 first_line:
      0091B4 1F 01 AE         [ 4] 3521 	call dpop 
      0091B7 A1 F2            [ 2] 3522 	ldw (FIRST,sp),x 
      0091B9 1F 03            [ 1] 3523 	cp a,#1 
      0091BB E6 02            [ 1] 3524 	jreq lines_skip 	
      0013E2                       3525 last_line:
      0091BD A4 0F C7         [ 4] 3526 	call dpop 
      0091C0 00 0B            [ 2] 3527 	ldw (LAST,sp),x 
      0013E7                       3528 lines_skip:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0091C2 1C 00 03         [ 2] 3529 	ldw x,txtbgn
      0091C5 72 BB            [ 2] 3530 2$:	ldw (LN_PTR,sp),x 
      0091C7 00 0A FE         [ 2] 3531 	cpw x,txtend 
      0091CA 13 01            [ 1] 3532 	jrpl list_exit 
      0091CC 27               [ 2] 3533 	ldw x,(x) ;lineno 
      0091CD 0A 1E            [ 2] 3534 	cpw x,(FIRST,sp)
      0091CF 03 FE            [ 1] 3535 	jrpl list_start 
      0091D1 1D 00            [ 2] 3536 	ldw x,(LN_PTR,sp) 
      0091D3 02 26 E3         [ 2] 3537 	addw x,#2 
      0091D6 20               [ 1] 3538 	ld a,(x)
      0091D7 05               [ 1] 3539 	incw x 
      0091D8 1E 03 1C         [ 1] 3540 	ld acc8,a 
      0091DB 00 02 5B 04      [ 1] 3541 	clr acc16 
      0091DF 81 BB 00 09      [ 2] 3542 	addw x,acc16
      0091E0 20 E0            [ 2] 3543 	jra 2$ 
                                   3544 ; print loop
      00140A                       3545 list_start:
      0091E0 52 03            [ 2] 3546 	ldw x,(LN_PTR,sp)
      00140C                       3547 3$:	
      0091E2 90 93 81         [ 4] 3548 	call prt_basic_line
      0091E4 1E 05            [ 2] 3549 	ldw x,(LN_PTR,sp)
      0091E4 90 F6            [ 1] 3550 	ld a,(2,x)
      0091E6 A4 0F 6B         [ 1] 3551 	ld acc8,a 
      0091E9 01 AE 17 18      [ 1] 3552 	clr acc16 
      0091ED 17 02 90 5C      [ 2] 3553 	addw x,acc16
      0091F1 C3 00 1D         [ 2] 3554 	cpw x,txtend 
      0091F1 F6 27            [ 1] 3555 	jrpl list_exit
      0091F3 1E 0D            [ 2] 3556 	ldw (LN_PTR,sp),x
      0091F5 01               [ 2] 3557 	ldw x,(x)
      0091F6 27 0B            [ 2] 3558 	cpw x,(LAST,sp)  
      0091F8 90 F1            [ 1] 3559 	jrsgt list_exit 
      0091FA 26 07            [ 2] 3560 	ldw x,(LN_PTR,sp)
      0091FC 90 5C            [ 2] 3561 	jra 3$
      00142E                       3562 list_exit:
      00142E                       3563 	_drop VSIZE 
      0091FE 5C 0A            [ 2]    1     addw sp,#VSIZE 
      009200 01               [ 4] 3564 	ret
                                   3565 
                                   3566 ;-------------------------
                                   3567 ; print counted string 
                                   3568 ; input:
                                   3569 ;   X 		address of string
                                   3570 ;--------------------------
      001431                       3571 prt_cmd_name:
      009201 20               [ 1] 3572 	ld a,(x)
      009202 EE               [ 1] 3573 	incw x
      009203 A4 0F            [ 1] 3574 	and a,#15  
      009203 16               [ 1] 3575 	push a 
      009204 02 72            [ 1] 3576 1$: tnz (1,sp) 
      009206 A2 00            [ 1] 3577 	jreq 9$
      009208 02               [ 1] 3578 	ld a,(x)
      009209 4B 00 90         [ 4] 3579 	call putc 
      00920C FE               [ 1] 3580 	incw x
      00920D 84 27            [ 1] 3581 	dec (1,sp)	 
      00920F 21 20            [ 2] 3582 	jra 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009211 D2               [ 1] 3583 9$: pop a 
      009212 81               [ 4] 3584 	ret	
                                   3585 
                                   3586 ;--------------------------
                                   3587 ; print TK_QSTR
                                   3588 ; converting control character
                                   3589 ; to backslash sequence
                                   3590 ; input:
                                   3591 ;   X        char *
                                   3592 ;-----------------------------
      001445                       3593 prt_quote:
      009212 16 02            [ 1] 3594 	ld a,#'"
      009214 90 F6 6B         [ 4] 3595 	call putc 
      009217 01               [ 1] 3596 1$:	ld a,(x)
      009218 A4 0F            [ 1] 3597 	jreq 9$
      00921A 4C               [ 1] 3598 	incw x 
      00921B C7 00            [ 1] 3599 	cp a,#SPACE 
      00921D 0B 72            [ 1] 3600 	jrult 3$
      00921F 5F 00 0A         [ 4] 3601 	call putc
      009222 72 B9            [ 1] 3602 	cp a,#'\ 
      009224 00 0A            [ 1] 3603 	jrne 1$ 
      001459                       3604 2$:
      009226 90 FE 7B         [ 4] 3605 	call putc 
      009229 01 4E            [ 2] 3606 	jra 1$
      00922B A4               [ 1] 3607 3$: push a 
      00922C 0C 44            [ 1] 3608 	ld a,#'\
      00922E 44 AB 06         [ 4] 3609 	call putc 
      009231 84               [ 1] 3610 	pop a 
      009231 93 5B            [ 1] 3611 	sub a,#7
      009233 03 81 0A         [ 1] 3612 	ld acc8,a 
      009235 72 5F 00 09      [ 1] 3613 	clr acc16
      009235 88 CD 88 7E      [ 2] 3614 	ldw y,#escaped 
      009239 11 01 27 03      [ 2] 3615 	addw y,acc16 
      00923D CC 87            [ 1] 3616 	ld a,(y)
      00923F 98 84            [ 2] 3617 	jra 2$
      009241 81 22            [ 1] 3618 9$: ld a,#'"
      009242 CD 01 9E         [ 4] 3619 	call putc 
      009242 4B               [ 1] 3620 	incw x 
      009243 00               [ 4] 3621 	ret
                                   3622 
                                   3623 
                                   3624 ;--------------------------
                                   3625 ; decompile line from token list 
                                   3626 ; input:
                                   3627 ;   X 		pointer at line
                                   3628 ; output:
                                   3629 ;   none 
                                   3630 ;--------------------------	
                           000001  3631 	BASE_SAV=1
                           000002  3632 	WIDTH_SAV=2
                           000003  3633 	XSAVE=3
                           000005  3634 	LLEN=5
                           000005  3635 	VSIZE=5 
      001481                       3636 prt_basic_line:
      001481                       3637 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009244 CD 93            [ 2]    1     sub sp,#VSIZE 
      009246 7D A1 00         [ 1] 3638 	ld a,base
      009249 27 19            [ 1] 3639 	ld (BASE_SAV,sp),a  
      00924B A1 04 26         [ 1] 3640 	ld a,tab_width 
      00924E 12 CD            [ 1] 3641 	ld (WIDTH_SAV,sp),a 
      009250 90 15 0C         [ 2] 3642 	ldw ptr16,x
      009253 01               [ 2] 3643 	ldw x,(x)
      009254 CD 88 7E A1      [ 1] 3644 	mov base,#10
      009258 00 27 09 A1      [ 1] 3645 	mov tab_width,#5
      00925C 0D 26 02         [ 4] 3646 	call print_int ; print line number 
      00925F 20 E3            [ 1] 3647 	ld a,#SPACE 
      009261 CD 90 0E         [ 4] 3648 	call putc 
      009264 84 81 00 25      [ 1] 3649 	clr tab_width
      009266 AE 00 02         [ 2] 3650 	ldw x,#2
      009266 A6 0B CD 92      [ 4] 3651 	ld a,([ptr16],x)
      00926A 35 CD            [ 1] 3652 	ld (LLEN,sp),a 
      00926C 93               [ 1] 3653 	incw x
      00926D 7D               [ 1] 3654 1$:	ld a,xl 
      00926E A1 04            [ 1] 3655 	cp a,(LLEN,sp)
      009270 27 03            [ 1] 3656 	jrmi 20$
      009272 CC 87 98         [ 2] 3657 	jp 90$
      0014B7                       3658 20$:	 
      009275 89 A6 0C CD      [ 4] 3659 	ld a,([ptr16],x)
      009279 92               [ 1] 3660 	incw x 
      00927A 35 85            [ 2] 3661 	ldw (XSAVE,sp),x 
      00927C C3 00            [ 1] 3662 	cp a,#TK_CMD 
      00927E 23 23            [ 1] 3663 	jrult 5$
      009280 05 A6            [ 1] 3664 	cp a,#TK_SFUNC 
      009282 0A CC            [ 1] 3665 	jrugt 4$
      0014C6                       3666 2$:	
      009284 87 9A 5D 27      [ 5] 3667 	ldw x,([ptr16],x)
      009288 F8 58 89         [ 2] 3668 	cpw x,#rem 
      00928B CE 00            [ 1] 3669 	jrne 3$
      00928D 21 72            [ 1] 3670 	ld a,#''
      00928F F0 01 5B         [ 4] 3671 	call putc 
      009292 02 A6            [ 2] 3672 	ldw x,(XSAVE,sp)
      009294 04 81 02         [ 2] 3673 	addw x,#2
      009296 72 BB 00 14      [ 2] 3674 	addw x,ptr16  
      009296 52 01 CD         [ 4] 3675 	call puts 
      009299 88 7E A1         [ 2] 3676 	jp 90$ 
      00929C 02 2B 4A         [ 4] 3677 3$:	call cmd_name
      00929F 6B 01 A4         [ 4] 3678 	call prt_cmd_name
      0092A2 30 A1            [ 1] 3679 	ld a,#SPACE 
      0092A4 10 27 04         [ 4] 3680 	call putc 
      0092A7 7B 01            [ 2] 3681 	ldw x,(XSAVE,sp)
      0092A9 20 03 02         [ 2] 3682 	addw x,#2
      0092AB 20 BA            [ 2] 3683 	jra 1$
      0092AB CD 88            [ 1] 3684 4$: cp a,#TK_QSTR 
      0092AD 7E 0D            [ 1] 3685 	jrne 5$
      0092AE 72 BB 00 14      [ 2] 3686 	addw x,ptr16
      0092AE A1 07 26         [ 4] 3687 	call prt_quote 
      0092B1 03 FD 20 2B      [ 2] 3688 	subw x,ptr16  
      0092B5 20 A9            [ 2] 3689 	jra 1$
      0092B5 A1 04            [ 1] 3690 5$:	cp a,#TK_VAR
      0092B7 26 02            [ 1] 3691 	jrne 6$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0092B9 20 25 00 14      [ 5] 3692 	ldw x,([ptr16],x)
      0092BB 1D 00 26         [ 2] 3693 	subw x,#vars 
      0092BB A1               [ 1] 3694 	ld a,xl
      0092BC 02               [ 1] 3695 	srl a 
      0092BD 26 06            [ 1] 3696 	add a,#'A 
      0092BF CD 92 66         [ 4] 3697 	call putc 
      0092C2 FE 20            [ 1] 3698 	ld a,#SPACE 
      0092C4 1B 01 9E         [ 4] 3699 	call putc 
      0092C5 1E 03            [ 2] 3700 	ldw x,(XSAVE,sp)
      0092C5 A1 05 26         [ 2] 3701 	addw x,#2 
      0092C8 03 FE            [ 2] 3702 	jra 1$ 
      0092CA 20 14            [ 1] 3703 6$: cp a,#TK_ARRAY 
      0092CC 26 0A            [ 1] 3704 	jrne 7$
      0092CC A1 0B            [ 1] 3705 	ld a,#'@ 
      0092CE 26 0A CD         [ 4] 3706 	call putc 
      0092D1 93 7D            [ 2] 3707 	ldw x,(XSAVE,sp)
      0092D3 A6 0C CD         [ 2] 3708 	jp 1$ 
      0092D6 92 35            [ 1] 3709 7$: cp a,#TK_INTGR 
      0092D8 20 06            [ 1] 3710 	jrne 8$
      0092DA 72 DE 00 14      [ 5] 3711 	ldw x,([ptr16],x)
      0092DA CD 90 0E         [ 4] 3712 	call print_int
      0092DD 4F 20            [ 1] 3713 	ld a,#SPACE 
      0092DF 09 01 9E         [ 4] 3714 	call putc 
      0092E0 1E 03            [ 2] 3715 	ldw x,(XSAVE,sp)
      0092E0 A6 11 11         [ 2] 3716 	addw x,#2 
      0092E3 01 26 01         [ 2] 3717 	jp 1$
      0092E6 50 31            [ 1] 3718 8$: cp a,#TK_GT 
      0092E7 2B 1A            [ 1] 3719 	jrmi 9$
      0092E7 A6 04            [ 1] 3720 	cp a,#TK_NE 
      0092E9 22 16            [ 1] 3721 	jrugt 9$
      0092E9 5B 01            [ 1] 3722 	sub a,#TK_GT  
      0092EB 81               [ 1] 3723 	sll a 
      0092EC 90 5F            [ 1] 3724 	clrw y 
      0092EC 52 05            [ 1] 3725 	ld yl,a 
      0092EE CD 92 96 A1      [ 2] 3726 	addw y,#relop_str 
      0092F2 02 2B            [ 2] 3727 	ldw y,(y)
      0092F4 41               [ 1] 3728 	ldw x,y 
      0092F5 CD 01 B0         [ 4] 3729 	call puts 
      0092F5 1F 03            [ 2] 3730 	ldw x,(XSAVE,sp)
      0092F7 CD 88 7E         [ 2] 3731 	jp 1$
      0092FA A1 02            [ 1] 3732 9$: cp a,#TK_PLUS 
      0092FC 2B 34            [ 1] 3733 	jrne 10$
      0092FE 6B 05            [ 1] 3734 	ld a,#'+
      009300 A4 30            [ 2] 3735 	jra 80$ 
      009302 A1 20            [ 1] 3736 10$: cp a,#TK_MINUS
      009304 27 07            [ 1] 3737 	jrne 11$
      009306 7B 05            [ 1] 3738 	ld a,#'-
      009308 CD 90            [ 2] 3739 	jra 80$
      00930A 0E 20            [ 1] 3740 11$: cp a,#TK_MULT 
      00930C 25 0E            [ 1] 3741 	jrmi 12$
      00930D A1 22            [ 1] 3742 	cp a,#TK_MOD 
      00930D CD 92            [ 1] 3743 	jrugt 12$
      00930F 96 A1            [ 1] 3744 	sub a,#0x20
      009311 04               [ 1] 3745 	clrw x 
      009312 27               [ 1] 3746 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009313 03 CC 87         [ 2] 3747 	addw x,#mul_char 
      009316 98               [ 1] 3748 	ld a,(x)
      009317 1F 01            [ 2] 3749 	jra 80$ 
      009319 7B 05            [ 1] 3750 12$: cp a,#TK_LPAREN 
      00931B A1 20            [ 1] 3751 	jrmi 13$
      00931D 26 05            [ 1] 3752 	cp a,#TK_SHARP 
      00931F CD 91            [ 1] 3753 	jrugt 13$
      009321 11 20            [ 1] 3754 	sub a,#TK_LPAREN
      009323 D1               [ 1] 3755 	clrw x 
      009324 A1               [ 1] 3756 	ld xl,a 
      009325 21 26 05         [ 2] 3757 	addw x,#single_char 
      009328 CD               [ 1] 3758 	ld a,(x)
      009329 91 59            [ 2] 3759 	jra 80$
      00932B 20 C8            [ 1] 3760 13$: cp a,#TK_CHAR 
      00932D CD 91            [ 1] 3761 	jrne 14$
      00932F 9D 20            [ 1] 3762 	ld a,#'\
      009331 C3 1E 03         [ 4] 3763 	call putc 
      009334 A6 04            [ 2] 3764 	ldw x,(XSAVE,sp)
      009336 72 D6 00 14      [ 4] 3765 	ld a,([ptr16],x)
      009336 5B               [ 1] 3766 	incw x 
      009337 05 81            [ 2] 3767 	ldw (XSAVE,sp),x 
      009339 CD 01 9E         [ 4] 3768 	call putc 
      009339 52 05 CD         [ 2] 3769 	jp 1$ 
      00933C 92 EC            [ 1] 3770 14$: ld a,#':
      00933E A1 02 2B         [ 4] 3771 80$: call putc 
      009341 38 1F            [ 2] 3772 	ldw x,(XSAVE,sp)
      009343 03 CD 88         [ 2] 3773 	jp 1$ 
      0015BE                       3774 90$: 
      009346 7E A1            [ 1] 3775 	ld a,#CR 
      009348 02 2B 2B         [ 4] 3776 	call putc
      00934B 6B 05            [ 1] 3777 	ld a,(WIDTH_SAV,sp) 
      00934D A4 30 A1         [ 1] 3778 	ld tab_width,a 
      009350 10 27            [ 1] 3779 	ld a,(BASE_SAV,sp) 
      009352 07 7B 05         [ 1] 3780 	ld base,a
      0015CD                       3781 	_drop VSIZE 
      009355 CD 90            [ 2]    1     addw sp,#VSIZE 
      009357 0E               [ 4] 3782 	ret 	
      009358 20 1C 2C 23           3783 single_char: .byte '(',')',',','#'
      00935A 2A 2F 25              3784 mul_char: .byte '*','/','%'
      00935A CD 92 EC A1 04 27 03  3785 relop_str: .word gt,equal,ge,lt,le,ne 
             CC 87 98 1F 01
      009366 7B 05                 3786 gt: .asciz ">"
      009368 A1 10                 3787 equal: .asciz "="
      00936A 26 05 CD              3788 ge: .asciz ">="
      00936D 91 03                 3789 lt: .asciz "<"
      00936F 20 D1 CD              3790 le: .asciz "<="
      009372 91 0B 20              3791 ne:  .asciz "<>"
                                   3792 
                                   3793 
                                   3794 ;---------------------------------
                                   3795 ; BASIC: PRINT|? arg_list 
                                   3796 ; print values from argument list
                                   3797 ;----------------------------------
                           000001  3798 	COMMA=1
                           000001  3799 	VSIZE=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0015F2                       3800 print:
      009375 CC 1E            [ 1] 3801 push #0 ; local variable COMMA 
      0015F4                       3802 reset_comma:
      009377 03 A6            [ 1] 3803 	clr (COMMA,sp)
      0015F6                       3804 prt_loop:
      009379 04 12 FD         [ 4] 3805 	call relation 
      00937A A1 01            [ 1] 3806 	cp a,#TK_COLON 
      00937A 5B 05            [ 1] 3807 	jreq print_exit   
      00937C 81 04            [ 1] 3808 	cp a,#TK_INTGR 
      00937D 26 05            [ 1] 3809 	jrne 0$ 
      00937D 52 05 CD         [ 4] 3810 	call print_int 
      009380 93 39            [ 2] 3811 	jra reset_comma
      001606                       3812 0$: 	
      009382 A1 02 2B         [ 4] 3813 	call next_token
      009385 4B 1F            [ 1] 3814 	cp a,#TK_NONE 
      009387 03 CD            [ 1] 3815 	jreq print_exit 
      009389 88 7E            [ 1] 3816 1$:	cp a,#TK_QSTR
      00938B A1 02            [ 1] 3817 	jrne 2$   
      00938D 2B 3E B0         [ 4] 3818 	call puts
      00938F 5C               [ 1] 3819 	incw x 
      00938F 6B 05 A4 30      [ 2] 3820 	subw x,basicptr 
      009393 A1               [ 1] 3821 	ld a,xl 
      009394 30 27 07         [ 1] 3822 	ld in,a  
      009397 7B 05            [ 2] 3823 	jra reset_comma
      009399 CD 90            [ 1] 3824 2$: cp a,#TK_CHAR 
      00939B 0E 20            [ 1] 3825 	jrne 3$
      00939D 2F               [ 1] 3826 	ld a,xl 
      00939E CD 01 9E         [ 4] 3827 	call putc 
      00939E CD 93            [ 2] 3828 	jra reset_comma 
      001629                       3829 3$: 	
      0093A0 39 A1            [ 1] 3830 	cp a,#TK_CFUNC 
      0093A2 04 27            [ 1] 3831 	jrne 4$ 
      0093A4 03               [ 4] 3832 	call (x)
      0093A5 CC               [ 1] 3833 	ld a,xl 
      0093A6 87 98 1F         [ 4] 3834 	call putc
      0093A9 01 CD            [ 2] 3835 	jra reset_comma 
      001634                       3836 4$: 
      0093AB 91 0B            [ 1] 3837 	cp a,#TK_COMMA 
      0093AD 26 06            [ 1] 3838 	jrne 5$
      0093AF 35 02            [ 1] 3839 	cpl (COMMA,sp) 
      0093B1 00 0B 20         [ 2] 3840 	jp prt_loop   
      00163D                       3841 5$: 
      0093B4 0C 0E            [ 1] 3842 	cp a,#TK_SHARP
      0093B5 26 13            [ 1] 3843 	jrne 7$
      0093B5 2C 06 35         [ 4] 3844 	call next_token
      0093B8 04 00            [ 1] 3845 	cp a,#TK_INTGR 
      0093BA 0B 20            [ 1] 3846 	jreq 6$
      0093BC 04 07 18         [ 2] 3847 	jp syntax_error 
      0093BD                       3848 6$:
      0093BD 35               [ 1] 3849 	ld a,xl 
      0093BE 01 00            [ 1] 3850 	and a,#15 
      0093C0 0B 00 25         [ 1] 3851 	ld tab_width,a 
      0093C1 CC 15 F4         [ 2] 3852 	jp reset_comma 
      001654                       3853 7$:	
      0093C1 5F C6 00         [ 4] 3854 	call unget_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      001657                       3855 print_exit:
      0093C4 0B 14            [ 1] 3856 	tnz (COMMA,sp)
      0093C6 05 4D            [ 1] 3857 	jrne 9$
      0093C8 27 05            [ 1] 3858 	ld a,#CR 
      0093CA 5C 01 9E         [ 4] 3859     call putc 
      0093CB                       3860 9$:	_drop VSIZE 
      0093CB 20 02            [ 2]    1     addw sp,#VSIZE 
      0093CD 1E               [ 4] 3861 	ret 
                                   3862 
                                   3863 ;----------------------
                                   3864 ; 'save_context' and
                                   3865 ; 'rest_context' must be 
                                   3866 ; called at the same 
                                   3867 ; call stack depth 
                                   3868 ; i.e. SP must have the 
                                   3869 ; save value at  
                                   3870 ; entry point of both 
                                   3871 ; routine. 
                                   3872 ;---------------------
                           000006  3873 	CTXT_SIZE=6 ; size of saved data 
                                   3874 ;--------------------
                                   3875 ; save current BASIC
                                   3876 ; interpreter context 
                                   3877 ; on cstack 
                                   3878 ;--------------------
      001663                       3879 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001663                       3880 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001663                       3881 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001663                       3882 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001663                       3883 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      001663                       3884 save_context:
      0093CE 03 00 03         [ 2] 3885 	ldw x,basicptr 
      0093CF 1F 03            [ 2] 3886 	ldw (BPTR,sp),x
      0093CF A6 04 05         [ 2] 3887 	ldw x,lineno 
      0093D1 1F 05            [ 2] 3888 	ldw (LNO,sp),x 
      0093D1 5B 05 81         [ 1] 3889 	ld a,in 
      0093D4 6B 07            [ 1] 3890 	ld (IN,sp),a
      0093D4 C6 00 08         [ 1] 3891 	ld a,count 
      0093D7 88 CD            [ 1] 3892 	ld (CNT,sp),a  
      0093D9 90               [ 4] 3893 	ret
                                   3894 
                                   3895 ;-----------------------
                                   3896 ; restore previously saved 
                                   3897 ; BASIC interpreter context 
                                   3898 ; from cstack 
                                   3899 ;-------------------------
      001678                       3900 rest_context:
      0093DA A3 CD            [ 2] 3901 	ldw x,(BPTR,sp)
      0093DC 90 D6 84         [ 2] 3902 	ldw basicptr,x 
      0093DF C7 00            [ 2] 3903 	ldw x,(LNO,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0093E1 08 4F 81         [ 2] 3904 	ldw lineno,x 
      0093E4 7B 07            [ 1] 3905 	ld a,(IN,sp)
      0093E4 35 10 00         [ 1] 3906 	ld in,a
      0093E7 08 81            [ 1] 3907 	ld a,(CNT,sp)
      0093E9 C7 00 02         [ 1] 3908 	ld count,a  
      0093E9 35               [ 4] 3909 	ret
                                   3910 
                                   3911 ;------------------------------------------
                                   3912 ; BASIC: INPUT [string],var[,[string],var]
                                   3913 ; input value in variables 
                                   3914 ; [string] optionally can be used as prompt 
                                   3915 ;-----------------------------------------
                           000001  3916 	CX_BPTR=1
                           000003  3917 	CX_LNO=3
                           000004  3918 	CX_IN=4
                           000005  3919 	CX_CNT=5
                           000006  3920 	SKIP=6
                           000007  3921 	VSIZE=7
      00168D                       3922 input_var:
      0093EA 0A 00 08 81 05   [ 2] 3923 	btjt flags,#FRUN,1$ 
      0093EE A6 06            [ 1] 3924 	ld a,#ERR_RUN_ONLY 
      0093EE AE 16 C8         [ 2] 3925 	jp tb_error 
      001697                       3926 1$:	_vars VSIZE 
      0093F1 72 B0            [ 2]    1     sub sp,#VSIZE 
      001699                       3927 input_loop:
      0093F3 00 1E            [ 1] 3928 	clr (SKIP,sp)
      0093F5 A6 04 81         [ 4] 3929 	call next_token 
      0093F8 A1 00            [ 1] 3930 	cp a,#TK_NONE 
      0093F8 AE 16            [ 1] 3931 	jreq input_exit 
      0093FA C8 72            [ 1] 3932 	cp a,#TK_QSTR 
      0093FC B0 00            [ 1] 3933 	jrne 1$ 
      0093FE 1E 54 CF         [ 4] 3934 	call puts 
      009401 00 23            [ 1] 3935 	cpl (SKIP,sp)
      009403 A6 04 81         [ 4] 3936 	call next_token 
      009406 A1 05            [ 1] 3937 1$: cp a,#TK_VAR  
      009406 CD 88            [ 1] 3938 	jreq 2$ 
      009408 7E A1 05         [ 2] 3939 	jp syntax_error
      00940B 27 03 CC         [ 4] 3940 2$:	call dpush 
      00940E 87 98            [ 1] 3941 	tnz (SKIP,sp)
      009410 26 0F            [ 1] 3942 	jrne 21$ 
      009410 CD 90            [ 1] 3943 	ld a,#':
      009412 15 CD 88         [ 1] 3944 	ld pad+1,a 
      009415 7E A1 32 27      [ 1] 3945 	clr pad+2
      009419 03 CC 87         [ 2] 3946 	ldw x,#pad 
      00941C 98 01 B0         [ 4] 3947 	call puts   
      00941D                       3948 21$:
      00941D CD 93 7D         [ 4] 3949 	call save_context 
      009420 A1 04 27         [ 2] 3950 	ldw x,#tib 
      009423 03 CC 87         [ 2] 3951 	ldw basicptr,x  
      009426 98 5F 00 02      [ 1] 3952 	clr count  
      009427 CD 0A 8B         [ 4] 3953 	call readln 
      009427 90 93 CD 90      [ 1] 3954 	clr in 
      00942B 22 FF 81         [ 4] 3955 	call relation 
      00942E A1 04            [ 1] 3956 	cp a,#TK_INTGR
      00942E 52 06            [ 1] 3957 	jreq 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009430 CE 00 1C         [ 2] 3958 	jp syntax_error
      009433 C3 00 1E         [ 4] 3959 3$: call dpush 
      009436 2B 03 CC         [ 4] 3960 	call store 
      009439 94 AE 1F         [ 4] 3961 	call rest_context
      00943C 05 FE 1F         [ 4] 3962 	call next_token 
      00943F 01 AE            [ 1] 3963 	cp a,#TK_COMMA 
      009441 7F FF            [ 1] 3964 	jrne 4$
      009443 1F 03            [ 2] 3965 	jra input_loop 
      009445 CD 92 42         [ 4] 3966 4$:	call unget_token 
      0016FE                       3967 input_exit:
      0016FE                       3968 	_drop VSIZE 
      009448 4D 27            [ 2]    1     addw sp,#VSIZE 
      00944A 3F               [ 4] 3969 	ret 
                                   3970 
                                   3971 
                                   3972 ;---------------------
                                   3973 ; BASIC: REMARK | ' 
                                   3974 ; skip comment to end of line 
                                   3975 ;---------------------- 
      001701                       3976 rem:
      00944B A1 02 27 07 A1   [ 1] 3977  	mov count,in 
      009450 01               [ 4] 3978 	ret 
                                   3979 
                                   3980 ;---------------------
                                   3981 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3982 ; read in loop 'addr'  
                                   3983 ; apply & 'mask' to value 
                                   3984 ; loop while result==0.  
                                   3985 ; if 'xor_mask' given 
                                   3986 ; apply ^ in second  
                                   3987 ; loop while result==0 
                                   3988 ;---------------------
                           000001  3989 	XMASK=1 
                           000002  3990 	MASK=2
                           000003  3991 	ADDR=3
                           000004  3992 	VSIZE=4
      001707                       3993 wait: 
      001707                       3994 	_vars VSIZE
      009451 27 06            [ 2]    1     sub sp,#VSIZE 
      009453 CC 87            [ 1] 3995 	clr (XMASK,sp) 
      009455 98 CD 90         [ 4] 3996 	call arg_list 
      009458 2F 02            [ 1] 3997 	cp a,#2
      009459 24 03            [ 1] 3998 	jruge 0$
      009459 CD 90 22         [ 2] 3999 	jp syntax_error 
      00945C 1F 01            [ 1] 4000 0$:	cp a,#3
      00945E A1 01            [ 1] 4001 	jrult 1$
      009460 27 05 A2         [ 4] 4002 	call dpop 
      009462 9F               [ 1] 4003 	ld a,xl
      009462 CD 90            [ 1] 4004 	ld (XMASK,sp),a 
      009464 22 1F 03         [ 4] 4005 1$: call dpop ; mask 
      009467 9F               [ 1] 4006 	ld a,xl 
      009467 CE 00            [ 1] 4007 	ld (MASK,sp),a 
      009469 1C 1F 05         [ 4] 4008 	call dpop ; address 
      00946C C3               [ 1] 4009 2$:	ld a,(x)
      00946D 00 1E            [ 1] 4010 	and a,(MASK,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      00946F 2A 3D            [ 1] 4011 	xor a,(XMASK,sp)
      009471 FE 13            [ 1] 4012 	jreq 2$ 
      00172F                       4013 	_drop VSIZE 
      009473 01 2A            [ 2]    1     addw sp,#VSIZE 
      009475 14               [ 4] 4014 	ret 
                                   4015 
                                   4016 ;---------------------
                                   4017 ; BASIC: BSET addr,mask
                                   4018 ; set bits at 'addr' corresponding 
                                   4019 ; to those of 'mask' that are at 1.
                                   4020 ; arguments:
                                   4021 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4022 ;   mask        mask|addr
                                   4023 ; output:
                                   4024 ;	none 
                                   4025 ;--------------------------
      001732                       4026 bit_set:
      009476 1E 05 1C         [ 4] 4027 	call arg_list 
      009479 00 02            [ 1] 4028 	cp a,#2	 
      00947B F6 5C            [ 1] 4029 	jreq 1$ 
      00947D C7 00 0B         [ 2] 4030 	jp syntax_error
      00173C                       4031 1$: 
      009480 72 5F 00         [ 4] 4032 	call dpop ; mask 
      009483 0A               [ 1] 4033 	ld a,xl 
      009484 72 BB 00         [ 4] 4034 	call dpop ; addr  
      009487 0A               [ 1] 4035 	or a,(x)
      009488 20               [ 1] 4036 	ld (x),a
      009489 E0               [ 4] 4037 	ret 
                                   4038 
                                   4039 ;---------------------
                                   4040 ; BASIC: BRES addr,mask
                                   4041 ; reset bits at 'addr' corresponding 
                                   4042 ; to those of 'mask' that are at 1.
                                   4043 ; arguments:
                                   4044 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4045 ;   mask	    ~mask&*addr  
                                   4046 ; output:
                                   4047 ;	none 
                                   4048 ;--------------------------
      00948A                       4049 bit_reset:
      00948A 1E 05 C2         [ 4] 4050 	call arg_list 
      00948C A1 02            [ 1] 4051 	cp a,#2  
      00948C CD 95            [ 1] 4052 	jreq 1$ 
      00948E 01 1E 05         [ 2] 4053 	jp syntax_error
      001750                       4054 1$: 
      009491 E6 02 C7         [ 4] 4055 	call dpop ; mask 
      009494 00               [ 1] 4056 	ld a,xl 
      009495 0B               [ 1] 4057 	cpl a 
      009496 72 5F 00         [ 4] 4058 	call dpop ; addr  
      009499 0A               [ 1] 4059 	and a,(x)
      00949A 72               [ 1] 4060 	ld (x),a 
      00949B BB               [ 4] 4061 	ret 
                                   4062 
                                   4063 ;---------------------
                                   4064 ; BASIC: BRES addr,mask
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4065 ; toggle bits at 'addr' corresponding 
                                   4066 ; to those of 'mask' that are at 1.
                                   4067 ; arguments:
                                   4068 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4069 ;   mask	    mask^*addr  
                                   4070 ; output:
                                   4071 ;	none 
                                   4072 ;--------------------------
      00175B                       4073 bit_toggle:
      00949C 00 0A C3         [ 4] 4074 	call arg_list 
      00949F 00 1E            [ 1] 4075 	cp a,#2 
      0094A1 2A 0B            [ 1] 4076 	jreq 1$ 
      0094A3 1F 05 FE         [ 2] 4077 	jp syntax_error
      0094A6 13 03 2C         [ 4] 4078 1$: call dpop ; mask 
      0094A9 04               [ 1] 4079 	ld a,xl 
      0094AA 1E 05 20         [ 4] 4080 	call dpop ; addr  
      0094AD DE               [ 1] 4081 	xor a,(x)
      0094AE F7               [ 1] 4082 	ld (x),a 
      0094AE 5B               [ 4] 4083 	ret 
                                   4084 
                                   4085 
                                   4086 ;---------------------
                                   4087 ; BASIC: BTEST(addr,bit)
                                   4088 ; return bit value at 'addr' 
                                   4089 ; bit is in range {0..7}.
                                   4090 ; arguments:
                                   4091 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4092 ;   bit 	    bit position {0..7}  
                                   4093 ; output:
                                   4094 ;	none 
                                   4095 ;--------------------------
      00176F                       4096 bit_test:
      0094AF 06 81            [ 1] 4097 	ld a,#TK_LPAREN 
      0094B1 CD 11 B5         [ 4] 4098 	call expect 
      0094B1 F6 5C A4         [ 4] 4099 	call arg_list 
      0094B4 0F 88            [ 1] 4100 	cp a,#2
      0094B6 0D 01            [ 1] 4101 	jreq 0$
      0094B8 27 09 F6         [ 2] 4102 	jp syntax_error
      0094BB CD 82            [ 1] 4103 0$:	ld a,#TK_RPAREN
      0094BD 1E 5C 0A         [ 4] 4104 	call expect 
      0094C0 01 20 F3         [ 4] 4105 	call dpop 
      0094C3 84               [ 1] 4106 	ld a,xl 
      0094C4 81 07            [ 1] 4107 	and a,#7
      0094C5 88               [ 1] 4108 	push a 
      0094C5 A6 22            [ 1] 4109 	ld a,#1 
      0094C7 CD 82            [ 1] 4110 1$: tnz (1,sp)
      0094C9 1E F6            [ 1] 4111 	jreq 2$
      0094CB 27               [ 1] 4112 	sll a 
      0094CC 2D 5C            [ 1] 4113 	dec (1,sp)
      0094CE A1 20            [ 2] 4114 	jra 1$
      0094D0 25 0C CD         [ 4] 4115 2$: call dpop 
      0094D3 82               [ 1] 4116 	and a,(x)
      0094D4 1E A1            [ 1] 4117 	jreq 3$
      0094D6 5C 26            [ 1] 4118 	ld a,#1 
      0094D8 F1               [ 1] 4119 3$:	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0094D9 97               [ 1] 4120 	ld xl,a 
      0094D9 CD 82            [ 1] 4121 	ld a,#TK_INTGR
      0017A1                       4122 	_drop 1 
      0094DB 1E 20            [ 2]    1     addw sp,#1 
      0094DD EC               [ 4] 4123 	ret
                                   4124 
                                   4125 
                                   4126 ;--------------------
                                   4127 ; BASIC: POKE addr,byte
                                   4128 ; put a byte at addr 
                                   4129 ;--------------------
      0017A4                       4130 poke:
      0094DE 88 A6 5C         [ 4] 4131 	call arg_list 
      0094E1 CD 82            [ 1] 4132 	cp a,#2
      0094E3 1E 84            [ 1] 4133 	jreq 1$
      0094E5 A0 07 C7         [ 2] 4134 	jp syntax_error
      0017AE                       4135 1$:	
      0094E8 00 0B 72         [ 4] 4136 	call dpop 
      0094EB 5F               [ 1] 4137     ld a,xl 
      0094EC 00 0A 90         [ 4] 4138 	call dpop 
      0094EF AE               [ 1] 4139 	ld (x),a 
      0094F0 8C               [ 4] 4140 	ret 
                                   4141 
                                   4142 ;-----------------------
                                   4143 ; BASIC: PEEK(addr)
                                   4144 ; get the byte at addr 
                                   4145 ; input:
                                   4146 ;	none 
                                   4147 ; output:
                                   4148 ;	X 		value 
                                   4149 ;-----------------------
      0017B7                       4150 peek:
      0094F1 DF 72            [ 1] 4151 	ld a,#TK_LPAREN 
      0094F3 B9 00 0A         [ 4] 4152 	call expect 
      0094F6 90 F6 20         [ 4] 4153 	call arg_list
      0094F9 DF A6            [ 1] 4154 	cp a,#1 
      0094FB 22 CD            [ 1] 4155 	jreq 1$
      0094FD 82 1E 5C         [ 2] 4156 	jp syntax_error
      009500 81 0C            [ 1] 4157 1$:	ld a,#TK_RPAREN 
      009501 CD 11 B5         [ 4] 4158 	call expect 
      009501 52 05 C6         [ 4] 4159 	call dpop 
      009504 00               [ 1] 4160 	ld a,(x)
      009505 08               [ 1] 4161 	clrw x 
      009506 6B               [ 1] 4162 	ld xl,a 
      009507 01 C6            [ 1] 4163 	ld a,#TK_INTGR
      009509 00               [ 4] 4164 	ret 
                                   4165 
      0017D4                       4166 if: 
      00950A 26 6B 02         [ 4] 4167 	call relation 
      00950D CF 00            [ 1] 4168 	cp a,#TK_INTGR
      00950F 15 FE            [ 1] 4169 	jreq 1$ 
      009511 35 0A 00         [ 2] 4170 	jp syntax_error
      009514 08               [ 1] 4171 1$:	clr a 
      009515 35               [ 2] 4172 	tnzw x 
      009516 05 00            [ 1] 4173 	jrne 9$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4174 ;skip to next line
      009518 26 CD 8A 1D A6   [ 1] 4175 	mov in,count
      00951D 20               [ 4] 4176 9$:	ret 
                                   4177 
                                   4178 ;------------------------
                                   4179 ; BASIC: FOR var=expr 
                                   4180 ; set variable to expression 
                                   4181 ; leave variable address 
                                   4182 ; on dstack and set
                                   4183 ; FFOR bit in 'flags'
                                   4184 ;-----------------
                           000001  4185 	RETL1=1
                           000003  4186 	INW=3
                           000005  4187 	BPTR=5
      0017E8                       4188 for: ; { -- var_addr }
      00951E CD 82            [ 1] 4189 	ld a,#TK_VAR 
      009520 1E 72 5F         [ 4] 4190 	call expect
      009523 00 26 AE         [ 4] 4191 	call dpush 
      009526 00 02 72         [ 4] 4192 	call let02 
      009529 D6 00 15 6B      [ 1] 4193 	bset flags,#FFOR 
                                   4194 ; open space on cstack for BPTR and INW 
      00952D 05               [ 2] 4195 	popw x ; call return address 
      0017F8                       4196 	_vars 4
      00952E 5C 9F            [ 2]    1     sub sp,#4 
      009530 11               [ 2] 4197 	pushw x  ; RETL1 
      009531 05               [ 1] 4198 	clrw x 
      009532 2B 03            [ 2] 4199 	ldw (BPTR,sp),x 
      009534 CC 96            [ 2] 4200 	ldw (INW,sp),x 
      009536 3E 07 FE         [ 4] 4201 	call next_token 
      009537 A1 06            [ 1] 4202 	cp a,#TK_CMD 
      009537 72 D6            [ 1] 4203 	jreq 1$
      009539 00 15 5C         [ 2] 4204 	jp syntax_error
      00180A                       4205 1$:  
      00953C 1F 03 A1         [ 2] 4206 	cpw x,#to 
      00953F 06 25            [ 1] 4207 	jreq to
      009541 44 A1 09         [ 2] 4208 	jp syntax_error 
                                   4209 
                                   4210 ;-----------------------------------
                                   4211 ; BASIC: TO expr 
                                   4212 ; second part of FOR loop initilization
                                   4213 ; leave limit on dstack and set 
                                   4214 ; FTO bit in 'flags'
                                   4215 ;-----------------------------------
      001812                       4216 to: ; { var_addr -- var_addr limit step }
      009544 22 2F 00 24 03   [ 2] 4217 	btjt flags,#FFOR,1$
      009546 CC 07 18         [ 2] 4218 	jp syntax_error
      009546 72 DE 00         [ 4] 4219 1$: call relation  
      009549 15 A3            [ 1] 4220 	cp a,#TK_INTGR 
      00954B 97 81            [ 1] 4221 	jreq 2$ 
      00954D 26 14 A6         [ 2] 4222 	jp syntax_error
      001824                       4223 2$: 
      009550 27 CD 82         [ 4] 4224     call dpush ; limit
      009553 1E 1E 03         [ 2] 4225 	ldw x,in.w 
      009556 1C 00 02         [ 4] 4226 	call next_token
      009559 72 BB            [ 1] 4227 	cp a,#TK_NONE  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      00955B 00 15            [ 1] 4228 	jreq 4$ 
      00955D CD 82            [ 1] 4229 	cp a,#TK_CMD
      00955F 30 CC            [ 1] 4230 	jrne 3$
      009561 96 3E CD         [ 2] 4231 	cpw x,#step 
      009564 91 AE            [ 1] 4232 	jreq step
      00183A                       4233 3$:	
      009566 CD 94 B1         [ 4] 4234 	call unget_token   	 
      00183D                       4235 4$:	
      009569 A6 20 CD         [ 2] 4236 	ldw x,#1   ; default step  
      00956C 82 1E            [ 2] 4237 	jra store_loop_addr 
                                   4238 
                                   4239 
                                   4240 ;----------------------------------
                                   4241 ; BASIC: STEP expr 
                                   4242 ; optional third par of FOR loop
                                   4243 ; initialization. 	
                                   4244 ;------------------------------------
      001842                       4245 step: ; {var limit -- var limit step}
      00956E 1E 03 1C 00 02   [ 2] 4246 	btjt flags,#FFOR,1$
      009573 20 BA A1         [ 2] 4247 	jp syntax_error
      009576 0A 26 0D         [ 4] 4248 1$: call relation
      009579 72 BB            [ 1] 4249 	cp a,#TK_INTGR
      00957B 00 15            [ 1] 4250 	jreq store_loop_addr  
      00957D CD 94 C5         [ 2] 4251 	jp syntax_error
                                   4252 ; leave loop back entry point on cstack 
                                   4253 ; cstack is 2 call deep from interp_loop
      001854                       4254 store_loop_addr:
      009580 72 B0 00         [ 4] 4255 	call dpush 
      009583 15 20 A9         [ 2] 4256 	ldw x,basicptr  
      009586 A1 05            [ 2] 4257 	ldw (BPTR,sp),x 
      009588 26 1A 72         [ 2] 4258 	ldw x,in.w 
      00958B DE 00            [ 2] 4259 	ldw (INW,sp),x   
      00958D 15 1D 00 27      [ 1] 4260 	bres flags,#FFOR 
      009591 9F 44 AB 41      [ 1] 4261 	inc loop_depth  
      009595 CD               [ 4] 4262 	ret 
                                   4263 
                                   4264 ;--------------------------------
                                   4265 ; BASIC: NEXT var 
                                   4266 ; FOR loop control 
                                   4267 ; increment variable with step 
                                   4268 ; and compare with limit 
                                   4269 ; loop if threshold not crossed.
                                   4270 ; else clean both stacks. 
                                   4271 ; and decrement 'loop_depth' 
                                   4272 ;--------------------------------
      00186A                       4273 next: ; {var limit step -- [var limit step ] }
      009596 82 1E A6 20      [ 1] 4274 	tnz loop_depth 
      00959A CD 82            [ 1] 4275 	jrne 1$ 
      00959C 1E 1E 03         [ 2] 4276 	jp syntax_error 
      001873                       4277 1$: 
      00959F 1C 00            [ 1] 4278 	ld a,#TK_VAR 
      0095A1 02 20 8B         [ 4] 4279 	call expect
                                   4280 ; check for good variable after NEXT 	 
      0095A4 A1 02            [ 1] 4281 	ldw y,x 
      0095A6 26 0A A6         [ 2] 4282 	ldw x,#4  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095A9 40 CD 82 1E      [ 4] 4283 	cpw y,([dstkptr],x) ; compare variables address 
      0095AD 1E 03            [ 1] 4284 	jreq 2$  
      0095AF CC 95 2F         [ 2] 4285 	jp syntax_error ; not the good one 
      001886                       4286 2$: ; increment variable 
      0095B2 A1               [ 1] 4287 	ldw x,y
      0095B3 04               [ 2] 4288 	ldw x,(x)  ; get var value 
      0095B4 26 14 72         [ 2] 4289 	ldw acc16,x 
      0095B7 DE 00 15 CD      [ 5] 4290 	ldw x,[dstkptr] ; step
      0095BB 8A 1D A6 20      [ 2] 4291 	addw x,acc16 ; var+step 
      0095BF CD 82            [ 2] 4292 	ldw (y),x ; save var new value 
                                   4293 ; compare with limit 
      0095C1 1E 1E            [ 1] 4294 	ldw y,x 
      0095C3 03 1C 00 02      [ 5] 4295 	ldw x,[dstkptr] ; step in x 
      0095C7 CC               [ 2] 4296 	tnzw x  
      0095C8 95 2F            [ 1] 4297 	jrpl 4$ ; positive step 
                                   4298 ;negative step 
      0095CA A1 31 2B         [ 2] 4299 	ldw x,#2
      0095CD 1A A1 35 22      [ 4] 4300 	cpw y,([dstkptr],x)
      0095D1 16 A0            [ 1] 4301 	jrslt loop_done
      0095D3 31 48            [ 2] 4302 	jra loop_back 
      0018A9                       4303 4$: ; positive step
      0095D5 90 5F 90         [ 2] 4304 	ldw x,#2 
      0095D8 97 72 A9 96      [ 4] 4305 	cpw y,([dstkptr],x)
      0095DC 57 90            [ 1] 4306 	jrsgt loop_done
      0018B2                       4307 loop_back:
      0095DE FE 93            [ 2] 4308 	ldw x,(BPTR,sp)
      0095E0 CD 82 30         [ 2] 4309 	ldw basicptr,x 
      0095E3 1E 03 CC 95 2F   [ 2] 4310 	btjf flags,#FRUN,1$ 
      0095E8 A1 10            [ 1] 4311 	ld a,(2,x)
      0095EA 26 04 A6         [ 1] 4312 	ld count,a
      0095ED 2B               [ 2] 4313 	ldw x,(x)
      0095EE 20 46 A1         [ 2] 4314 	ldw lineno,x
      0095F1 11 26            [ 2] 4315 1$:	ldw x,(INW,sp)
      0095F3 04 A6 2D         [ 2] 4316 	ldw in.w,x 
      0095F6 20               [ 4] 4317 	ret 
      0018CB                       4318 loop_done:
                                   4319 	; remove var limit step on dstack 
      0095F7 3E A1 20         [ 2] 4320 	ldw x,dstkptr 
      0095FA 2B 0E A1         [ 2] 4321 	addw x,#3*CELL_SIZE
      0095FD 22 22 0A         [ 2] 4322 	ldw dstkptr,x 
                                   4323 	; remove 2 return address on cstack 
      009600 A0               [ 2] 4324 	popw x
      0018D5                       4325 	_drop 4
      009601 20 5F            [ 2]    1     addw sp,#4 
      009603 97               [ 2] 4326 	pushw x 
      009604 1C 96 54 F6      [ 1] 4327 	dec loop_depth 
      009608 20               [ 4] 4328 	ret 
                                   4329 
                                   4330 
                                   4331 ;------------------------
                                   4332 ; BASIC: GOTO lineno 
                                   4333 ; jump to lineno 
                                   4334 ; here cstack is 2 call deep from interp_loop 
                                   4335 ;------------------------
      0018DD                       4336 goto:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009609 2C A1 0B 2B 0E   [ 2] 4337 	btjt flags,#FRUN,0$ 
      00960E A1 0E            [ 1] 4338 	ld a,#ERR_RUN_ONLY
      009610 22 0A A0         [ 2] 4339 	jp tb_error 
      009613 0B               [ 4] 4340 	ret 
      009614 5F 97            [ 2] 4341 0$:	jra go_common
                                   4342 
                                   4343 ;--------------------
                                   4344 ; BASIC: GOSUB lineno
                                   4345 ; basic subroutine call
                                   4346 ; actual lineno and basicptr 
                                   4347 ; are saved on cstack
                                   4348 ; here cstack is 2 call deep from interp_loop 
                                   4349 ;--------------------
                           000003  4350 	GOS_RET=3
      0018EA                       4351 gosub:
      009616 1C 96 50 F6 20   [ 2] 4352 	btjt flags,#FRUN,0$ 
      00961B 1A A1            [ 1] 4353 	ld a,#ERR_RUN_ONLY
      00961D 03 26 14         [ 2] 4354 	jp tb_error 
      009620 A6               [ 4] 4355 	ret 
      009621 5C               [ 2] 4356 0$:	popw x 
      009622 CD 82            [ 2] 4357 	sub sp,#2 
      009624 1E               [ 2] 4358 	pushw x 
      009625 1E 03 72         [ 2] 4359 	ldw x,basicptr
      009628 D6 00            [ 1] 4360 	ld a,(2,x)
      00962A 15 5C            [ 1] 4361 	add a,#3 
      00962C 1F 03 CD         [ 1] 4362 	ld acc8,a 
      00962F 82 1E CC 95      [ 1] 4363 	clr acc16 
      009633 2F A6 3A CD      [ 2] 4364 	addw x,acc16
      009637 82 1E            [ 2] 4365 	ldw (GOS_RET,sp),x 
      00190D                       4366 go_common: 
      009639 1E 03 CC         [ 4] 4367 	call relation 
      00963C 95 2F            [ 1] 4368 	cp a,#TK_INTGR
      00963E 27 03            [ 1] 4369 	jreq 1$ 
      00963E A6 0D CD         [ 2] 4370 	jp syntax_error
      001917                       4371 1$: 
      009641 82 1E 7B         [ 4] 4372 	call search_lineno  
      009644 02               [ 2] 4373 	tnzw x 
      009645 C7 00            [ 1] 4374 	jrne 2$ 
      009647 26 7B            [ 1] 4375 	ld a,#ERR_NO_LINE 
      009649 01 C7 00         [ 2] 4376 	jp tb_error 
      001922                       4377 2$: 
      00964C 08 5B 05         [ 2] 4378 	ldw basicptr,x 
      00964F 81 28            [ 1] 4379 	ld a,(2,x)
      009651 29 2C 23         [ 1] 4380 	ld count,a 
      009654 2A               [ 2] 4381 	ldw x,(x)
      009655 2F 25 96         [ 2] 4382 	ldw lineno,x 
      009658 63 96 65 96      [ 1] 4383 	mov in,#3 
      00965C 67               [ 4] 4384 	ret 
                                   4385 
                                   4386 ;------------------------
                                   4387 ; BASIC: RETURN 
                                   4388 ; exit from a subroutine 
                                   4389 ; cstack is 2 level deep from interp_loop 
                                   4390 ;------------------------
      001933                       4391 return:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00965D 96 6A 96 6C 96   [ 2] 4392 	btjt flags,#FRUN,0$ 
      009662 6F 3E            [ 1] 4393 	ld a,#ERR_RUN_ONLY
      009664 00 3D 00         [ 2] 4394 	jp tb_error 
      00193D                       4395 0$:	
      009667 3E 3D            [ 2] 4396 	ldw x,(GOS_RET,sp) 
      009669 00 3C 00         [ 2] 4397 	ldw basicptr,x 
      00966C 3C 3D            [ 1] 4398 	ld a,(2,x)
      00966E 00 3C            [ 1] 4399 	add a,#3 
      009670 3E 00 02         [ 1] 4400 	ld count,a 
      009672 35 03 00 01      [ 1] 4401 	mov in,#3
      009672 4B               [ 2] 4402 	ldw x,(x)
      009673 00 00 05         [ 2] 4403 	ldw lineno,x 
      009674 4F               [ 1] 4404 	clr a 
      009674 0F               [ 2] 4405 	popw x 
      001953                       4406 	_drop 2
      009675 01 02            [ 2]    1     addw sp,#2 
      009676 89               [ 2] 4407 	pushw x
      009676 CD               [ 4] 4408 	ret  
                                   4409 
                                   4410 
                                   4411 ;----------------------------------
                                   4412 ; BASIC: RUN
                                   4413 ; run BASIC program in RAM
                                   4414 ;----------------------------------- 
      001957                       4415 run: 
      009677 93 7D A1 01 27   [ 2] 4416 	btjf flags,#FRUN,0$  
      00967C 5A               [ 1] 4417 	clr a 
      00967D A1               [ 4] 4418 	ret
      00195E                       4419 0$: 
      00967E 04 26 05 CD 8A   [ 2] 4420 	btjf flags,#FBREAK,1$
      001963                       4421 	_drop 2 
      009683 1D 20            [ 2]    1     addw sp,#2 
      009685 EE 16 78         [ 4] 4422 	call rest_context
      009686                       4423 	_drop CTXT_SIZE 
      009686 CD 88            [ 2]    1     addw sp,#CTXT_SIZE 
      009688 7E A1 00 27      [ 1] 4424 	bres flags,#FBREAK 
      00968C 4A A1 0A 26      [ 1] 4425 	bset flags,#FRUN 
      009690 0E CD 82         [ 2] 4426 	jp interp_loop 
      009693 30 5C 72         [ 2] 4427 1$:	ldw x,txtbgn
      009696 B0 00 04         [ 2] 4428 	cpw x,txtend 
      009699 9F C7            [ 1] 4429 	jrmi 2$ 
      00969B 00               [ 1] 4430 	clr a 
      00969C 02               [ 4] 4431 	ret 
      00969D 20 D5 A1         [ 4] 4432 2$: call ubound 
      001982                       4433 	_drop 2 
      0096A0 03 26            [ 2]    1     addw sp,#2 
      0096A2 06 9F CD         [ 2] 4434 	ldw x,txtbgn 
      0096A5 82 1E 20         [ 2] 4435 	ldw basicptr,x 
      0096A8 CB 02            [ 1] 4436 	ld a,(2,x)
      0096A9 C7 00 02         [ 1] 4437 	ld count,a
      0096A9 A1               [ 2] 4438 	ldw x,(x)
      0096AA 08 26 07         [ 2] 4439 	ldw lineno,x
      0096AD FD 9F CD 82      [ 1] 4440 	mov in,#3	
      0096B1 1E 20 C0 24      [ 1] 4441 	bset flags,#FRUN 
      0096B4 CC 07 CE         [ 2] 4442 	jp interp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4443 
                                   4444 
                                   4445 ;----------------------
                                   4446 ; BASIC: STOP 
                                   4447 ; stop running program
                                   4448 ;---------------------- 
      00199E                       4449 stop: 
                                   4450 ; clean dstack and cstack 
      0096B4 A1 0D 26         [ 2] 4451 	ldw x,#STACK_EMPTY 
      0096B7 05               [ 1] 4452 	ldw sp,x 
      0096B8 03 01 CC 96      [ 1] 4453 	bres flags,#FRUN 
      0096BC 76 19 00 24      [ 1] 4454 	bres flags,#FBREAK
      0096BD CC 07 6A         [ 2] 4455 	jp warm_start
                                   4456 
                                   4457 ;-----------------------
                                   4458 ; BASIC BEEP expr1,expr2
                                   4459 ; used MCU internal beeper 
                                   4460 ; to produce a sound
                                   4461 ; arguments:
                                   4462 ;    expr1   frequency, {1,2,4} mapping to 1K,2K,4K
                                   4463 ;    expr2   duration msec.
                                   4464 ;---------------------------
      0019AD                       4465 beep:
      0096BD A1 0E 26         [ 4] 4466 	call arg_list 
      0096C0 13 CD            [ 1] 4467 	cp a,#2 
      0096C2 88 7E            [ 1] 4468 	jreq 2$
      0096C4 A1 04 27         [ 2] 4469 	jp syntax_error 
      0096C7 03 CC 87         [ 2] 4470 2$: ldw x,dstkptr 
      0096CA 98 02            [ 2] 4471 	ldw x,(2,x);frequency 
      0096CB 9F               [ 1] 4472 	ld a,xl
      0096CB 9F               [ 1] 4473 	dec a 
      0096CC A4               [ 1] 4474 	swap a 
      0096CD 0F               [ 1] 4475 	sll a 
      0096CE C7               [ 1] 4476 	sll a 
      0096CF 00 26            [ 1] 4477 	add a,#0x3e 
      0096D1 CC 96 74         [ 1] 4478 	ld BEEP_CSR,a 
      0096D4 CD 0F A2         [ 4] 4479 	call dpop 
      0096D4 CD 90 0E         [ 4] 4480 	call pause02 
      0096D7 CD 0F C9         [ 4] 4481 	call ddrop 
      0096D7 0D 01            [ 1] 4482 	ld a,#0x1f
      0096D9 26 05 A6         [ 1] 4483 	ld BEEP_CSR,a 
      0096DC 0D               [ 4] 4484 	ret 
                                   4485 
                                   4486 ;-------------------------------
                                   4487 ; BASIC: PWRADC 0|1,divisor  
                                   4488 ; disable/enanble ADC 
                                   4489 ;-------------------------------
      0019D5                       4490 power_adc:
      0096DD CD 82 1E         [ 4] 4491 	call arg_list 
      0096E0 5B 01            [ 1] 4492 	cp a,#2	
      0096E2 81 03            [ 1] 4493 	jreq 1$
      0096E3 CC 07 18         [ 2] 4494 	jp syntax_error 
      0096E3 CE 00 04         [ 2] 4495 1$: ldw x,#2
      0096E6 1F 03 CE 00      [ 5] 4496 	ldw x,([dstkptr],x) ; on|off
      0096EA 06               [ 2] 4497 	tnzw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0096EB 1F 05            [ 1] 4498 	jreq 2$ 
      0096ED C6 00 02 6B      [ 5] 4499 	ldw x,[dstkptr] ; channel
      0096F1 07               [ 1] 4500 	ld a,xl
      0096F2 C6 00            [ 1] 4501 	and a,#7
      0096F4 03               [ 1] 4502 	swap a 
      0096F5 6B 08 81         [ 1] 4503 	ld ADC_CR1,a
      0096F8 72 16 54 02      [ 1] 4504 	bset ADC_CR2,#ADC_CR2_ALIGN ; right 
      0096F8 1E 03 CF 00      [ 1] 4505 	bset ADC_CR1,#ADC_CR1_ADON 
      0019FC                       4506 	_usec_dly 7 
      0096FC 04 1E 05         [ 2]    1     ldw x,#(16*7-2)/4
      0096FF CF               [ 2]    2     decw x
      009700 00               [ 1]    3     nop 
      009701 06 7B            [ 1]    4     jrne .-4
      009703 07 C7            [ 2] 4507 	jra 3$
      009705 00 02 7B 08      [ 1] 4508 2$: bres ADC_CR1,#ADC_CR1_ADON 
      009709 C7 00 03         [ 2] 4509 3$:	ldw x,#2
      00970C 81 10 06         [ 4] 4510 	call ddrop_n 
      00970D 81               [ 4] 4511 	ret
                                   4512 
                                   4513 ;-----------------------------
                                   4514 ; BASIC: RDADC(channel)
                                   4515 ; read adc channel 
                                   4516 ; output:
                                   4517 ;   A 		TK_INTGR 
                                   4518 ;   X 		value 
                                   4519 ;-----------------------------
      001A10                       4520 read_adc:
      00970D 72 00            [ 1] 4521 	ld a,#TK_LPAREN 
      00970F 00 25 05         [ 4] 4522 	call expect 
      009712 A6 06 CC         [ 4] 4523 	call next_token 
      009715 87 9A            [ 1] 4524 	cp a,#TK_INTGR 
      009717 52 07            [ 1] 4525 	jreq 1$
      009719 CC 07 18         [ 2] 4526 	jp syntax_error
      009719 0F               [ 2] 4527 1$: pushw x 
      00971A 06 CD            [ 1] 4528 	ld a,#TK_RPAREN 
      00971C 88 7E A1         [ 4] 4529 	call expect 
      00971F 00               [ 2] 4530 	popw x 
      009720 27 5C A1         [ 2] 4531 	cpw x,#16 
      009723 0A 26            [ 1] 4532 	jrult 2$
      009725 08 CD            [ 1] 4533 	ld a,#ERR_BAD_VALUE
      009727 82 30 03         [ 2] 4534 	jp tb_error 
      00972A 06               [ 1] 4535 2$: ld a,xl
      00972B CD 88 7E         [ 1] 4536 	ld ADC_CSR,a 
      00972E A1 05 27 03      [ 1] 4537 	bset ADC_CR1,#ADC_CR1_ADON
      009732 CC 87 98 CD 90   [ 2] 4538 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009737 15 0D 06         [ 2] 4539 	ldw x,ADC_DRH 
      00973A 26 0F            [ 1] 4540 	ld a,#TK_INTGR
      00973C A6               [ 4] 4541 	ret 
                                   4542 
                                   4543 
                                   4544 ;-----------------------
                                   4545 ; BASIC: BREAK 
                                   4546 ; insert a breakpoint 
                                   4547 ; in pogram. 
                                   4548 ; the program is resumed
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4549 ; with RUN 
                                   4550 ;-------------------------
      001A43                       4551 break:
      00973D 3A C7 17 19 72   [ 2] 4552 	btjt flags,#FRUN,2$
      009742 5F               [ 1] 4553 	clr a
      009743 17               [ 4] 4554 	ret 
      001A4A                       4555 2$:	 
                                   4556 ; create space on cstack to save context 
      009744 1A AE 17         [ 2] 4557 	ldw x,#break_point 
      009747 18 CD 82         [ 4] 4558 	call puts 
      001A50                       4559 	_drop 2 ;drop return address 
      00974A 30 02            [ 2]    1     addw sp,#2 
      00974B                       4560 	_vars CTXT_SIZE ; context size 
      00974B CD 96            [ 2]    1     sub sp,#CTXT_SIZE 
      00974D E3 AE 16         [ 4] 4561 	call save_context 
      009750 C8 CF 00         [ 2] 4562 	ldw x,#tib 
      009753 04 72 5F         [ 2] 4563 	ldw basicptr,x
      009756 00               [ 1] 4564 	clr (x)
      009757 03 CD 8B 0B      [ 1] 4565 	clr count  
      00975B 72               [ 1] 4566 	clrw x 
      00975C 5F 00 02         [ 2] 4567 	ldw lineno,x 
      00975F CD 93 7D         [ 2] 4568 	ldw in.w,x
      009762 A1 04 27 03      [ 1] 4569 	bres flags,#FRUN 
      009766 CC 87 98 CD      [ 1] 4570 	bset flags,#FBREAK
      00976A 90 15 CD         [ 2] 4571 	jp interp_loop 
      00976D 90 7C CD 96 F8 CD 88  4572 break_point: .asciz "\nbreak point, RUN to resume.\n"
             7E A1 0D 26 02 20 9E
             CD 90 0E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4573 
                                   4574 ;-----------------------
                                   4575 ; BASIC: NEW
                                   4576 ; from command line only 
                                   4577 ; free program memory
                                   4578 ; and clear variables 
                                   4579 ;------------------------
      00977E                       4580 new: 
      00977E 5B 07 81 24 02   [ 2] 4581 	btjf flags,#FRUN,0$ 
      009781 4F               [ 1] 4582 	clr a 
      009781 55               [ 4] 4583 	ret 
      001A99                       4584 0$:	
      009782 00 02 00         [ 4] 4585 	call clear_basic 
      009785 03               [ 4] 4586 	ret 
                                   4587 	 
                                   4588 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4589 ;   file system routines
                                   4590 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4591 
                                   4592 ;--------------------
                                   4593 ; input:
                                   4594 ;   X     increment 
                                   4595 ; output:
                                   4596 ;   farptr  incremented 
                                   4597 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      001A9D                       4598 incr_farptr:
      009786 81 BB 00 14      [ 2] 4599 	addw x,farptr+1 
      009787 24 04            [ 1] 4600 	jrnc 1$
      009787 52 04 0F 01      [ 1] 4601 	inc farptr 
      00978B CD 92 42         [ 2] 4602 1$:	ldw farptr+1,x  
      00978E A1               [ 4] 4603 	ret 
                                   4604 
                                   4605 ;------------------------------
                                   4606 ; extended flash memory used as FLASH_DRIVE 
                                   4607 ; seek end of used flash drive   
                                   4608 ; starting at 0x10000 address.
                                   4609 ; 4 consecutives 0 bytes signal free space. 
                                   4610 ; input:
                                   4611 ;	none
                                   4612 ; output:
                                   4613 ;   ffree     free_addr| 0 if memory full.
                                   4614 ;------------------------------
      001AAB                       4615 seek_fdrive:
                                   4616 ; start scan at 0x10000 address 
      00978F 02 24            [ 1] 4617 	ld a,#1
      009791 03 CC 87         [ 1] 4618 	ld farptr,a 
      009794 98               [ 1] 4619 	clrw x 
      009795 A1 03 25         [ 2] 4620 	ldw farptr+1,x 
      001AB4                       4621 1$:
      009798 06 CD 90         [ 2] 4622 	ldw x,#3  
      00979B 22 9F 6B 01      [ 5] 4623 2$:	ldf a,([farptr],x) 
      00979F CD 90            [ 1] 4624 	jrne 3$
      0097A1 22               [ 2] 4625 	decw x
      0097A2 9F 6B            [ 1] 4626 	jrpl 2$
      0097A4 02 CD            [ 2] 4627 	jra 4$ 
      0097A6 90               [ 1] 4628 3$:	incw x 
      0097A7 22 F6 14         [ 4] 4629 	call incr_farptr
      0097AA 02 18 01         [ 2] 4630 	ldw x,#0x27f 
      0097AD 27 F9 5B         [ 2] 4631 	cpw x,farptr
      0097B0 04 81            [ 1] 4632 	jrpl 1$
                                   4633 ; drive full 
      0097B2 72 5F 00 16      [ 1] 4634 	clr ffree 
      0097B2 CD 92 42 A1      [ 1] 4635 	clr ffree+1 
      0097B6 02 27 03 CC      [ 1] 4636 	clr ffree+2 
      0097BA 87               [ 4] 4637 	ret
      001ADB                       4638 4$: ; copy farptr to ffree	 
      0097BB 98 00 13         [ 2] 4639 	ldw x,farptr 
      0097BC C6 00 15         [ 1] 4640 	ld a,farptr+2 
      0097BC CD 90 22         [ 2] 4641 	ldw ffree,x 
      0097BF 9F CD 90         [ 1] 4642 	ld ffree+2,a  
      0097C2 22               [ 4] 4643 	ret 
                                   4644 
                                   4645 ;-----------------------
                                   4646 ; compare file name 
                                   4647 ; with name pointed by Y  
                                   4648 ; input:
                                   4649 ;   farptr   file name 
                                   4650 ;   Y        target name 
                                   4651 ; output:
                                   4652 ;   farptr 	 at file_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4653 ;   X 		 farptr[x] point at size field  
                                   4654 ;   Carry    0|1 no match|match  
                                   4655 ;----------------------
      001AE8                       4656 cmp_name:
      0097C3 FA               [ 1] 4657 	clrw x
      0097C4 F7 81 00 13      [ 5] 4658 1$:	ldf a,([farptr],x)
      0097C6 90 F1            [ 1] 4659 	cp a,(y)
      0097C6 CD 92            [ 1] 4660 	jrne 4$
      0097C8 42               [ 1] 4661 	tnz a 
      0097C9 A1 02            [ 1] 4662 	jreq 9$ 
      0097CB 27               [ 1] 4663     incw x 
      0097CC 03 CC            [ 1] 4664 	incw y 
      0097CE 87 98            [ 2] 4665 	jra 1$
      0097D0                       4666 4$: ;no match 
      0097D0 CD               [ 1] 4667 	tnz a 
      0097D1 90 22            [ 1] 4668 	jreq 5$
      0097D3 9F               [ 1] 4669 	incw x 
      0097D4 43 CD 90 22      [ 5] 4670 	ldf a,([farptr],x)
      0097D8 F4 F7            [ 2] 4671 	jra 4$  
      0097DA 81               [ 1] 4672 5$:	incw x ; farptr[x] point at 'size' field 
      0097DB 98               [ 1] 4673 	rcf 
      0097DB CD               [ 4] 4674 	ret
      001B06                       4675 9$: ; match  
      0097DC 92               [ 1] 4676 	incw x  ; farptr[x] at 'size' field 
      0097DD 42               [ 1] 4677 	scf 
      0097DE A1               [ 4] 4678 	ret 
                                   4679 
                                   4680 ;-----------------------
                                   4681 ; search file in 
                                   4682 ; flash memory 
                                   4683 ; input:
                                   4684 ;   Y       file name  
                                   4685 ; output:
                                   4686 ;   farptr  addr at name|0
                                   4687 ;-----------------------
                           000001  4688 	FSIZE=1
                           000003  4689 	YSAVE=3
                           000004  4690 	VSIZE=4 
      001B09                       4691 search_file: 
      001B09                       4692 	_vars VSIZE
      0097DF 02 27            [ 2]    1     sub sp,#VSIZE 
      0097E1 03 CC            [ 2] 4693 	ldw (YSAVE,sp),y  
      0097E3 87               [ 1] 4694 	clrw x 
      0097E4 98 CD 90         [ 2] 4695 	ldw farptr+1,x 
      0097E7 22 9F CD 90      [ 1] 4696 	mov farptr,#1
      001B15                       4697 1$:	
                                   4698 ; check if farptr is after any file 
                                   4699 ; if  0 then so.
      0097EB 22 F8 F7 81      [ 5] 4700 	ldf a,[farptr]
      0097EF 27 25            [ 1] 4701 	jreq 6$
      0097EF A6               [ 1] 4702 2$: clrw x 	
      0097F0 0B CD            [ 2] 4703 	ldw y,(YSAVE,sp) 
      0097F2 92 35 CD         [ 4] 4704 	call cmp_name
      0097F5 92 42            [ 1] 4705 	jrc 9$
      0097F7 A1 02 27 03      [ 5] 4706 	ldf a,([farptr],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0097FB CC 87            [ 1] 4707 	ld (FSIZE,sp),a 
      0097FD 98               [ 1] 4708 	incw x 
      0097FE A6 0C CD 92      [ 5] 4709 	ldf a,([farptr],x)
      009802 35 CD            [ 1] 4710 	ld (FSIZE+1,sp),a 
      009804 90               [ 1] 4711 	incw x 
      009805 22 9F A4         [ 2] 4712 	addw x,(FSIZE,sp) ; count to skip 
      009808 07               [ 1] 4713 	incw x ; skip over EOF marker 
      009809 88 A6 01         [ 4] 4714 	call incr_farptr ; now at next file 'name_field'
      00980C 0D 01 27         [ 2] 4715 	ldw x,#0x280
      00980F 05 48 0A         [ 2] 4716 	cpw x,farptr 
      009812 01 20            [ 1] 4717 	jrpl 1$
      001B40                       4718 6$: ; file not found 
      009814 F7 CD 90 22      [ 1] 4719 	clr farptr
      009818 F4 27 02 A6      [ 1] 4720 	clr farptr+1 
      00981C 01 5F 97 A6      [ 1] 4721 	clr farptr+2 
      001B4C                       4722 	_drop VSIZE 
      009820 04 5B            [ 2]    1     addw sp,#VSIZE 
      009822 01               [ 1] 4723 	rcf
      009823 81               [ 4] 4724 	ret
      009824                       4725 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001B50                       4726 	_drop VSIZE 
      009824 CD 92            [ 2]    1     addw sp,#VSIZE 
      009826 42               [ 1] 4727 	scf 	
      009827 A1               [ 4] 4728 	ret
                                   4729 
                                   4730 ;--------------------------------
                                   4731 ; BASIC: SAVE "name" 
                                   4732 ; save text program in 
                                   4733 ; flash memory used as 
                                   4734 ;--------------------------------
                           000001  4735 	BSIZE=1
                           000003  4736 	NAMEPTR=3
                           000004  4737 	VSIZE=4
      001B54                       4738 save:
      009828 02 27 03 CC 87   [ 2] 4739 	btjf flags,#FRUN,0$ 
      00982D 98 07            [ 1] 4740 	ld a,#ERR_CMD_ONLY 
      00982E CC 07 1A         [ 2] 4741 	jp tb_error
      001B5E                       4742 0$:	 
      00982E CD 90 22         [ 2] 4743 	ldw x,txtend 
      009831 9F CD 90 22      [ 2] 4744 	subw x,txtbgn
      009835 F7 81            [ 1] 4745 	jrne 1$
                                   4746 ; nothing to save 
      009837 81               [ 4] 4747 	ret 
      001B68                       4748 1$:	
      001B68                       4749 	_vars VSIZE 
      009837 A6 0B            [ 2]    1     sub sp,#VSIZE 
      009839 CD 92            [ 2] 4750 	ldw (BSIZE,sp),x 
      00983B 35 CD 92         [ 4] 4751 	call next_token	
      00983E 42 A1            [ 1] 4752 	cp a,#TK_QSTR
      009840 01 27            [ 1] 4753 	jreq 2$
      009842 03 CC 87         [ 2] 4754 	jp syntax_error
      001B76                       4755 2$: 
      009845 98 A6 0C CD      [ 2] 4756 	ldw y,basicptr 
      009849 92 35 CD 90      [ 2] 4757 	addw y,in.w
      00984D 22 F6            [ 2] 4758 	ldw (NAMEPTR,sp),y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      00984F 5F 97 A6 04 81   [ 1] 4759 	mov in,count 
                                   4760 ; check if enough free space 
      009854 93               [ 1] 4761 	ldw x,y 
      009854 CD 93 7D         [ 4] 4762 	call strlen 
      009857 A1 04 27         [ 2] 4763 	addw x,#3 
      00985A 03 CC 87         [ 2] 4764 	addw x,(BSIZE,sp)
      00985D 98 4F 5D 26      [ 1] 4765 	tnz ffree 
      009861 05 55            [ 1] 4766 	jrne 21$
      009863 00 03 00 02      [ 2] 4767 	subw x,ffree+1 
      009867 81 05            [ 2] 4768 	jrule 21$
      009868 A6 01            [ 1] 4769 	ld a,#ERR_MEM_FULL 
      009868 A6 05 CD         [ 2] 4770 	jp tb_error
      001BA0                       4771 21$: 
                                   4772 ; check for existing file of that name 
      00986B 92 35            [ 2] 4773 	ldw y,(NAMEPTR,sp)	
      00986D CD 90 15         [ 4] 4774 	call search_file 
      009870 CD 94            [ 1] 4775 	jrnc 3$ 
      009872 10 72            [ 1] 4776 	ld a,#ERR_DUPLICATE 
      009874 14 00 25         [ 2] 4777 	jp tb_error 
      001BAC                       4778 3$:	;** write file name to flash **
      009877 85 52 04         [ 2] 4779 	ldw x,ffree 
      00987A 89 5F 1F         [ 1] 4780 	ld a,ffree+2 
      00987D 05 1F 03         [ 2] 4781 	ldw farptr,x 
      009880 CD 88 7E         [ 1] 4782 	ld farptr+2,a 
      009883 A1 06            [ 2] 4783 	ldw x,(NAMEPTR,sp)  
      009885 27 03 CC         [ 4] 4784 	call strlen 
      009888 87               [ 1] 4785 	incw  x
      009889 98 01            [ 2] 4786 	ldw (BSIZE,sp),x  
      00988A 5F               [ 1] 4787 	clrw x   
      00988A A3 98            [ 2] 4788 	ldw y,(NAMEPTR,sp)
      00988C 92 27 03         [ 4] 4789 	call write_block  
                                   4790 ;** write file length after name **
      00988F CC 87 98         [ 2] 4791 	ldw x,txtend 
      009892 72 B0 00 1B      [ 2] 4792 	subw x,txtbgn
      009892 72 04            [ 2] 4793 	ldw (BSIZE,sp),x 
      009894 00               [ 1] 4794 	clrw x 
      009895 25 03            [ 1] 4795 	ld a,(1,sp)
      009897 CC 87 98         [ 4] 4796 	call write_byte 
      00989A CD               [ 1] 4797 	incw x 
      00989B 93 7D            [ 1] 4798 	ld a,(2,sp)
      00989D A1 04 27         [ 4] 4799 	call write_byte
      0098A0 03               [ 1] 4800 	incw x  
      0098A1 CC 87 98         [ 4] 4801 	call incr_farptr ; move farptr after SIZE field 
                                   4802 ;** write BASIC text **
                                   4803 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      0098A4 1E 01            [ 2] 4804 	ldw x,(BSIZE,sp)
      0098A4 CD               [ 2] 4805 	pushw x ; write_block argument 
      0098A5 90               [ 1] 4806 	clrw x 
      0098A6 15 CE 00 01      [ 2] 4807 	ldw y,txtbgn  ; BASIC text to save 
      0098AA CD 88 7E         [ 4] 4808 	call write_block 
      001BEA                       4809 	_drop 2 ;  drop write_block argument  
      0098AD A1 00            [ 2]    1     addw sp,#2 
                                   4810 ; write en end of file marker 
      0098AF 27 0C A1         [ 2] 4811 	ldw x,#1
      0098B2 06 26            [ 1] 4812 	ld a,#EOF  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0098B4 05 A3 98         [ 4] 4813 	call write_byte 
      0098B7 C2 27 08         [ 4] 4814 	call incr_farptr
                                   4815 ; save farptr in ffree
      0098BA CE 00 13         [ 2] 4816 	ldw x,farptr 
      0098BA CD 90 0E         [ 1] 4817 	ld a,farptr+2 
      0098BD CF 00 16         [ 2] 4818 	ldw ffree,x 
      0098BD AE 00 01         [ 1] 4819 	ld ffree+2,a
                                   4820 ;write 4 zero bytes as an end of all files marker 
      0098C0 20               [ 1] 4821     clrw x 
      0098C1 12 04            [ 1] 4822 	push #4 
      0098C2                       4823 4$:
      0098C2 72               [ 1] 4824 	clr a 
      0098C3 04 00 25         [ 4] 4825 	call write_byte 
      0098C6 03               [ 1] 4826 	incw x 
      0098C7 CC 87            [ 1] 4827 	dec (1,sp)
      0098C9 98 CD            [ 1] 4828 	jrne 4$
      0098CB 93               [ 1] 4829 5$: pop a 
                                   4830 ; display saved size  
      0098CC 7D A1            [ 2] 4831 	ldw x,(BSIZE,sp) 
      0098CE 04 27 03         [ 4] 4832 	call print_int 
      001C15                       4833 	_drop VSIZE 
      0098D1 CC 87            [ 2]    1     addw sp,#VSIZE 
      0098D3 98               [ 4] 4834 	ret 
                                   4835 
                                   4836 
                                   4837 ;------------------------
                                   4838 ; BASIC: LOAD "file" 
                                   4839 ; load file to RAM 
                                   4840 ; for execution 
                                   4841 ;------------------------
      0098D4                       4842 load:
      0098D4 CD 90 15 CE 00   [ 2] 4843 	btjf flags,#FRUN,0$ 
      0098D9 04 1F            [ 1] 4844 	jreq 0$ 
      0098DB 05 CE            [ 1] 4845 	ld a,#ERR_CMD_ONLY 
      0098DD 00 01 1F         [ 2] 4846 	jp tb_error 
      001C24                       4847 0$:	
      0098E0 03 72 15         [ 4] 4848 	call next_token 
      0098E3 00 25            [ 1] 4849 	cp a,#TK_QSTR
      0098E5 72 5C            [ 1] 4850 	jreq 1$
      0098E7 00 20 81         [ 2] 4851 	jp syntax_error 
      0098EA                       4852 1$:	
      0098EA 72 5D 00 20      [ 2] 4853 	ldw y,basicptr
      0098EE 26 03 CC 87      [ 2] 4854 	addw y,in.w 
      0098F2 98 00 02 00 01   [ 1] 4855 	mov in,count 
      0098F3 CD 1B 09         [ 4] 4856 	call search_file 
      0098F3 A6 05            [ 1] 4857 	jrc 2$ 
      0098F5 CD 92            [ 1] 4858 	ld a,#ERR_NOT_FILE
      0098F7 35 90 93         [ 2] 4859 	jp tb_error  
      001C45                       4860 2$:	
      0098FA AE 00 04         [ 4] 4861 	call incr_farptr  
      0098FD 72 D3 00         [ 4] 4862 	call clear_basic  
      009900 1A               [ 1] 4863 	clrw x
      009901 27 03 CC 87      [ 5] 4864 	ldf a,([farptr],x)
      009905 98 95            [ 1] 4865 	ld yh,a 
      009906 5C               [ 1] 4866 	incw x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009906 93 FE CF 00      [ 5] 4867 	ldf a,([farptr],x)
      00990A 0A               [ 1] 4868 	incw x 
      00990B 72 CE            [ 1] 4869 	ld yl,a 
      00990D 00 1A 72 BB      [ 2] 4870 	addw y,txtbgn
      009911 00 0A 90 FF      [ 2] 4871 	ldw txtend,y
      009915 90 93 72 CE      [ 2] 4872 	ldw y,txtbgn
      001C66                       4873 3$:	; load BASIC text 	
      009919 00 1A 5D 2A      [ 5] 4874 	ldf a,([farptr],x)
      00991D 0B AE            [ 1] 4875 	ld (y),a 
      00991F 00               [ 1] 4876 	incw x 
      009920 02 72            [ 1] 4877 	incw y 
      009922 D3 00 1A 2F      [ 2] 4878 	cpw y,txtend 
      009926 24 20            [ 1] 4879 	jrmi 3$
                                   4880 ; print loaded size 	 
      009928 09 00 1D         [ 2] 4881 	ldw x,txtend 
      009929 72 B0 00 1B      [ 2] 4882 	subw x,txtbgn
      009929 AE 00 02         [ 4] 4883 	call print_int 
      00992C 72               [ 4] 4884 	ret 
                                   4885 
                                   4886 ;-----------------------------------
                                   4887 ; BASIC: FORGET ["file_name"] 
                                   4888 ; erase file_name and all others 
                                   4889 ; after it. 
                                   4890 ; without argument erase all files 
                                   4891 ;-----------------------------------
      001C80                       4892 forget:
      00992D D3 00 1A         [ 4] 4893 	call next_token 
      009930 2C 19            [ 1] 4894 	cp a,#TK_NONE 
      009932 27 26            [ 1] 4895 	jreq 3$ 
      009932 1E 05            [ 1] 4896 	cp a,#TK_QSTR
      009934 CF 00            [ 1] 4897 	jreq 1$
      009936 04 72 01         [ 2] 4898 	jp syntax_error
      009939 00 25 09 E6      [ 2] 4899 1$: ldw y,basicptr
      00993D 02 C7 00 03      [ 2] 4900 	addw y,in.w
      009941 FE CF 00 06 1E   [ 1] 4901 	mov in,count 
      009946 03 CF 00         [ 4] 4902 	call search_file
      009949 01 81            [ 1] 4903 	jrc 2$
      00994B A6 09            [ 1] 4904 	ld a,#ERR_NOT_FILE 
      00994B CE 00 1A         [ 2] 4905 	jp tb_error 
      001CA5                       4906 2$: 
      00994E 1C 00 06         [ 2] 4907 	ldw x,farptr
      009951 CF 00 1A         [ 1] 4908 	ld a,farptr+2
      009954 85 5B            [ 2] 4909 	jra 4$ 
      001CAD                       4910 3$: ; forget all files 
      009956 04 89 72         [ 2] 4911 	ldw x,#100
      009959 5A               [ 1] 4912 	clr a 
      00995A 00 20 81         [ 2] 4913 	ldw farptr,x 
      00995D C7 00 15         [ 1] 4914 	ld farptr+2,a 
      001CB7                       4915 4$:
      00995D 72 00 00         [ 2] 4916 	ldw ffree,x 
      009960 25 06 A6         [ 1] 4917 	ld ffree+2,a 
      009963 06 CC            [ 1] 4918 	push #4
      009965 87               [ 1] 4919 	clrw x 
      001CC0                       4920 5$: 
      009966 9A               [ 1] 4921 	clr a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009967 81 20 23         [ 4] 4922 	call write_byte 
      00996A 5C               [ 1] 4923 	incw x 
      00996A 72 00            [ 1] 4924 	dec (1,sp)
      00996C 00 25            [ 1] 4925 	jrne 5$	
      00996E 06               [ 1] 4926 6$: pop a 
      00996F A6               [ 4] 4927 	ret 
                                   4928 
                                   4929 ;----------------------
                                   4930 ; BASIC: DIR 
                                   4931 ; list saved files 
                                   4932 ;----------------------
                           000001  4933 	COUNT=1 ; files counter 
                           000002  4934 	VSIZE=2 
      001CCB                       4935 directory:
      001CCB                       4936 	_vars VSIZE 
      009970 06 CC            [ 2]    1     sub sp,#VSIZE 
      009972 87               [ 1] 4937 	clrw x 
      009973 9A 81            [ 2] 4938 	ldw (COUNT,sp),x 
      009975 85 52 02         [ 2] 4939 	ldw farptr+1,x 
      009978 89 CE 00 04      [ 1] 4940 	mov farptr,#1 
      001CD7                       4941 dir_loop:
      00997C E6               [ 1] 4942 	clrw x 
      00997D 02 AB 03 C7      [ 5] 4943 	ldf a,([farptr],x)
      009981 00 0B            [ 1] 4944 	jreq 8$ 
      001CDE                       4945 1$: ;name loop 	
      009983 72 5F 00 0A      [ 5] 4946 	ldf a,([farptr],x)
      009987 72 BB            [ 1] 4947 	jreq 2$ 
      009989 00 0A 1F         [ 4] 4948 	call putc 
      00998C 03               [ 1] 4949 	incw x 
      00998D 20 F4            [ 2] 4950 	jra 1$
      00998D CD               [ 1] 4951 2$: incw x ; skip ending 0. 
      00998E 93 7D            [ 1] 4952 	ld a,#SPACE 
      009990 A1 04 27         [ 4] 4953 	call putc 
                                   4954 ; get file size 	
      009993 03 CC 87 98      [ 5] 4955 	ldf a,([farptr],x)
      009997 90 95            [ 1] 4956 	ld yh,a 
      009997 CD               [ 1] 4957 	incw x 
      009998 83 60 5D 26      [ 5] 4958 	ldf a,([farptr],x)
      00999C 05               [ 1] 4959 	incw x 
      00999D A6 05            [ 1] 4960 	ld yl,a 
      00999F CC 87            [ 2] 4961 	pushw y 
      0099A1 9A FB 01         [ 2] 4962 	addw x,(1,sp)
      0099A2 5C               [ 1] 4963 	incw x ; skip EOF marker 
                                   4964 ; skip to next file 
      0099A2 CF 00 04         [ 4] 4965 	call incr_farptr 
                                   4966 ; print file size 
      0099A5 E6               [ 2] 4967 	popw x ; file size 
      0099A6 02 C7 00         [ 4] 4968 	call print_int 
      0099A9 03 FE            [ 1] 4969 	ld a,#CR 
      0099AB CF 00 06         [ 4] 4970 	call putc
      0099AE 35 03            [ 2] 4971 	ldw x,(COUNT,sp)
      0099B0 00               [ 1] 4972 	incw x
      0099B1 02 81            [ 2] 4973 	ldw (COUNT,sp),x  
      0099B3 20 C0            [ 2] 4974 	jra dir_loop 
      001D17                       4975 8$: ; print number of files 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0099B3 72 00            [ 2] 4976 	ldw x,(COUNT,sp)
      0099B5 00 25 05         [ 4] 4977 	call print_int 
      0099B8 A6 06 CC         [ 2] 4978 	ldw x,#file_count 
      0099BB 87 9A B0         [ 4] 4979 	call puts  
                                   4980 ; print drive free space 	
      0099BD A6 FF            [ 1] 4981 	ld a,#0xff 
      0099BD 1E 03 CF         [ 1] 4982 	sub a,ffree+2 
      0099C0 00 04 E6         [ 1] 4983 	ld acc8,a 
      0099C3 02 AB            [ 1] 4984 	ld a,#0x7f 
      0099C5 03 C7 00         [ 1] 4985 	sbc a,ffree+1 
      0099C8 03 35 03         [ 1] 4986 	ld acc16,a 
      0099CB 00 02            [ 1] 4987 	ld a,#2 
      0099CD FE CF 00         [ 1] 4988 	sbc a,ffree 
      0099D0 06 4F 85         [ 1] 4989 	ld acc24,a 
      0099D3 5B               [ 1] 4990 	clrw x  
      0099D4 02 89            [ 1] 4991 	ld a,#6 
      0099D6 81               [ 1] 4992 	ld xl,a 
      0099D7 A6 0A            [ 1] 4993 	ld a,#10 
      0099D7 72 01 00         [ 4] 4994 	call prti24 
      0099DA 25 02 4F         [ 2] 4995 	ldw x,#drive_free
      0099DD 81 01 B0         [ 4] 4996 	call puts 
      0099DE                       4997 	_drop VSIZE 
      0099DE 72 09            [ 2]    1     addw sp,#VSIZE 
      0099E0 00               [ 4] 4998 	ret
      0099E1 25 12 5B 02 CD 96 F8  4999 file_count: .asciz " files\n"
             5B
      0099E9 06 72 19 00 25 72 10  5000 drive_free: .asciz " bytes free\n" 
             00 25 CC 88 4E CE
                                   5001 
                                   5002 ;---------------------
                                   5003 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5004 ; write 1 or more byte to FLASH or EEPROM
                                   5005 ; starting at address  
                                   5006 ; input:
                                   5007 ;   expr1  	is address 
                                   5008 ;   expr2   is byte to write
                                   5009 ; output:
                                   5010 ;   none 
                                   5011 ;---------------------
                           000001  5012 	ADDR=1
                           000002  5013 	VSIZ=2 
      001D61                       5014 write:
      001D61                       5015 	_vars VSIZE 
      0099F6 00 1C            [ 2]    1     sub sp,#VSIZE 
      0099F8 C3 00 1E 2B      [ 1] 5016 	clr farptr ; expect 16 bits address 
      0099FC 02 4F 81         [ 4] 5017 	call expression
      0099FF CD 93            [ 1] 5018 	cp a,#TK_INTGR 
      009A01 F8 5B            [ 1] 5019 	jreq 0$
      009A03 02 CE 00         [ 2] 5020 	jp syntax_error
      009A06 1C CF            [ 2] 5021 0$: ldw (ADDR,sp),x 
      009A08 00 04 E6         [ 4] 5022 	call next_token 
      009A0B 02 C7            [ 1] 5023 	cp a,#TK_COMMA 
      009A0D 00 03            [ 1] 5024 	jreq 1$ 
      009A0F FE CF            [ 2] 5025 	jra 9$ 
      009A11 00 06 35         [ 4] 5026 1$:	call expression
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A14 03 00            [ 1] 5027 	cp a,#TK_INTGR
      009A16 02 72            [ 1] 5028 	jreq 2$
      009A18 10 00 25         [ 2] 5029 	jp syntax_error
      009A1B CC               [ 1] 5030 2$:	ld a,xl 
      009A1C 88 4E            [ 2] 5031 	ldw x,(ADDR,sp) 
      009A1E CF 00 14         [ 2] 5032 	ldw farptr+1,x 
      009A1E AE               [ 1] 5033 	clrw x 
      009A1F 17 FF 94         [ 4] 5034 	call write_byte
      009A22 72 11            [ 2] 5035 	ldw x,(ADDR,sp)
      009A24 00               [ 1] 5036 	incw x 
      009A25 25 72            [ 2] 5037 	jra 0$ 
      001D95                       5038 9$:
      001D95                       5039 	_drop VSIZE
      009A27 19 00            [ 2]    1     addw sp,#VSIZE 
      009A29 25               [ 4] 5040 	ret 
                                   5041 
                                   5042 
                                   5043 ;---------------------
                                   5044 ;BASIC: CHAR(expr)
                                   5045 ; évaluate expression 
                                   5046 ; and take the 7 least 
                                   5047 ; bits as ASCII character
                                   5048 ;---------------------
      001D98                       5049 char:
      009A2A CC 87            [ 1] 5050 	ld a,#TK_LPAREN 
      009A2C EA 11 B5         [ 4] 5051 	call expect 
      009A2D CD 12 FD         [ 4] 5052 	call relation 
      009A2D CD 92            [ 1] 5053 	cp a,#TK_INTGR 
      009A2F 42 A1            [ 1] 5054 	jreq 1$
      009A31 02 27 03         [ 2] 5055 	jp syntax_error
      009A34 CC               [ 2] 5056 1$:	pushw x 
      009A35 87 98            [ 1] 5057 	ld a,#TK_RPAREN 
      009A37 CE 00 1A         [ 4] 5058 	call expect
      009A3A EE               [ 2] 5059 	popw x  
      009A3B 02               [ 1] 5060 	ld a,xl 
      009A3C 9F 4A            [ 1] 5061 	and a,#0x7f 
      009A3E 4E               [ 1] 5062 	ld xl,a
      009A3F 48 48            [ 1] 5063 	ld a,#TK_CHAR
      009A41 AB               [ 4] 5064 	ret
                                   5065 
                                   5066 ;---------------------
                                   5067 ; BASIC: ASC(string|char)
                                   5068 ; extract first character 
                                   5069 ; of string argument 
                                   5070 ; return it as TK_INTGR 
                                   5071 ;---------------------
      001DB5                       5072 ascii:
      009A42 3E C7            [ 1] 5073 	ld a,#TK_LPAREN
      009A44 50 F3 CD         [ 4] 5074 	call expect 
      009A47 90 22 CD         [ 4] 5075 	call next_token 
      009A4A 9F 18            [ 1] 5076 	cp a,#TK_QSTR 
      009A4C CD 90            [ 1] 5077 	jreq 1$
      009A4E 49 A6            [ 1] 5078 	cp a,#TK_CHAR 
      009A50 1F C7            [ 1] 5079 	jreq 2$ 
      009A52 50 F3 81         [ 2] 5080 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A55                       5081 1$: 
      009A55 CD               [ 1] 5082 	ld a,(x)
      009A56 92 42            [ 2] 5083 	jra 3$
      001DCB                       5084 2$: 
      009A58 A1               [ 1] 5085 	ld a,xl 
      009A59 02               [ 1] 5086 3$:	ld xl,a 
      009A5A 27               [ 1] 5087 	clr a  
      009A5B 03               [ 1] 5088 	ld xh,a 
      009A5C CC               [ 2] 5089 	pushw x  
      009A5D 87 98            [ 1] 5090 	ld a,#TK_RPAREN 
      009A5F AE 00 02         [ 4] 5091 	call expect 
      009A62 72               [ 2] 5092 	popw x 
      009A63 DE 00            [ 1] 5093 	ld a,#TK_INTGR 
      009A65 1A               [ 4] 5094 	ret 
                                   5095 
                                   5096 ;---------------------
                                   5097 ;BASIC: KEY
                                   5098 ; wait for a character 
                                   5099 ; received from STDIN 
                                   5100 ; input:
                                   5101 ;	none 
                                   5102 ; output:
                                   5103 ;	X 		ASCII character 
                                   5104 ;---------------------
      001DD9                       5105 key:
      009A66 5D 27 1C         [ 4] 5106 	call getc 
      009A69 72               [ 1] 5107 	clrw x 
      009A6A CE               [ 1] 5108 	ld xl,a 
      009A6B 00 1A            [ 1] 5109 	ld a,#TK_INTGR
      009A6D 9F               [ 4] 5110 	ret
                                   5111 
                                   5112 ;----------------------
                                   5113 ; BASIC: QKEY
                                   5114 ; Return true if there 
                                   5115 ; is a character in 
                                   5116 ; waiting in STDIN 
                                   5117 ; input:
                                   5118 ;  none 
                                   5119 ; output:
                                   5120 ;   X 		0|1 
                                   5121 ;-----------------------
      001DE1                       5122 qkey: 
      009A6E A4               [ 1] 5123 	clrw x 
      009A6F 07 4E C7 54 01   [ 2] 5124 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      009A74 72               [ 1] 5125 	incw x 
      009A75 16 54            [ 1] 5126 9$: ld a,#TK_INTGR
      009A77 02               [ 4] 5127 	ret 
                                   5128 
                                   5129 ;---------------------
                                   5130 ; BASIC: GPIO(expr,reg)
                                   5131 ; return gpio address 
                                   5132 ; expr {0..8}
                                   5133 ; input:
                                   5134 ;   none 
                                   5135 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5136 ;   X 		gpio register address
                                   5137 ;----------------------------
      001DEB                       5138 gpio:
      009A78 72 10            [ 1] 5139 	ld a,#TK_LPAREN 
      009A7A 54 01 AE         [ 4] 5140 	call expect 
      009A7D 00 1B 5A         [ 4] 5141 	call arg_list
      009A80 9D 26            [ 1] 5142 	cp a,#2
      009A82 FA 20            [ 1] 5143 	jreq 1$
      009A84 04 72 11         [ 2] 5144 	jp syntax_error  
      001DFA                       5145 1$:	
      009A87 54 01            [ 1] 5146 	ld a,#TK_RPAREN 
      009A89 AE 00 02         [ 4] 5147 	call expect 
      009A8C CD 90 86         [ 2] 5148 	ldw x,#2
      009A8F 81 DE 00 19      [ 5] 5149 	ldw x,([dstkptr],x) ; port 
      009A90 2B 1B            [ 1] 5150 	jrmi bad_port
      009A90 A6 0B CD         [ 2] 5151 	cpw x,#9
      009A93 92 35            [ 1] 5152 	jrpl bad_port
      009A95 CD 88            [ 1] 5153 	ld a,#5
      009A97 7E               [ 4] 5154 	mul x,a
      009A98 A1 04 27         [ 2] 5155 	addw x,#GPIO_BASE 
      009A9B 03               [ 2] 5156 	pushw x 
      009A9C CC 87 98         [ 4] 5157 	call dpop 
      009A9F 89 A6 0C         [ 2] 5158 	addw x,(1,sp)
      009AA2 CD 92            [ 2] 5159 	ldw (1,sp),x  
      009AA4 35 85 A3         [ 4] 5160 	call ddrop  
      009AA7 00               [ 2] 5161 	popw x 
      009AA8 10 25            [ 1] 5162 	ld a,#TK_INTGR
      009AAA 05               [ 4] 5163 	ret
      001E23                       5164 bad_port:
      009AAB A6 0A            [ 1] 5165 	ld a,#ERR_BAD_VALUE
      009AAD CC 87 9A         [ 2] 5166 	jp tb_error
                                   5167 
                                   5168 ;----------------------
                                   5169 ; BASIC: ODR 
                                   5170 ; return offset of gpio
                                   5171 ; ODR register: 0
                                   5172 ; ---------------------
      001E28                       5173 port_odr:
      009AB0 9F C7 54         [ 2] 5174 	ldw x,#GPIO_ODR
      009AB3 00 72            [ 1] 5175 	ld a,#TK_INTGR
      009AB5 10               [ 4] 5176 	ret
                                   5177 
                                   5178 ;----------------------
                                   5179 ; BASIC: IDR 
                                   5180 ; return offset of gpio
                                   5181 ; IDR register: 1
                                   5182 ; ---------------------
      001E2E                       5183 port_idr:
      009AB6 54 01 72         [ 2] 5184 	ldw x,#GPIO_IDR
      009AB9 0F 54            [ 1] 5185 	ld a,#TK_INTGR
      009ABB 00               [ 4] 5186 	ret
                                   5187 
                                   5188 ;----------------------
                                   5189 ; BASIC: DDR 
                                   5190 ; return offset of gpio
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5191 ; DDR register: 2
                                   5192 ; ---------------------
      001E34                       5193 port_ddr:
      009ABC FB CE 54         [ 2] 5194 	ldw x,#GPIO_DDR
      009ABF 04 A6            [ 1] 5195 	ld a,#TK_INTGR
      009AC1 04               [ 4] 5196 	ret
                                   5197 
                                   5198 ;----------------------
                                   5199 ; BASIC: CRL  
                                   5200 ; return offset of gpio
                                   5201 ; CR1 register: 3
                                   5202 ; ---------------------
      001E3A                       5203 port_cr1:
      009AC2 81 00 03         [ 2] 5204 	ldw x,#GPIO_CR1
      009AC3 A6 04            [ 1] 5205 	ld a,#TK_INTGR
      009AC3 72               [ 4] 5206 	ret
                                   5207 
                                   5208 ;----------------------
                                   5209 ; BASIC: CRH  
                                   5210 ; return offset of gpio
                                   5211 ; CR2 register: 4
                                   5212 ; ---------------------
      001E40                       5213 port_cr2:
      009AC4 00 00 25         [ 2] 5214 	ldw x,#GPIO_CR2
      009AC7 02 4F            [ 1] 5215 	ld a,#TK_INTGR
      009AC9 81               [ 4] 5216 	ret
                                   5217 
                                   5218 ;-------------------------
                                   5219 ; BASIC: UFLASH 
                                   5220 ; return user flash address
                                   5221 ; input:
                                   5222 ;  none 
                                   5223 ; output:
                                   5224 ;	A		TK_INTGR
                                   5225 ;   X 		user address 
                                   5226 ;---------------------------
      009ACA                       5227 uflash:
      009ACA AE 9A F4         [ 2] 5228 	ldw x,#user_space 
      009ACD CD 82            [ 1] 5229 	ld a,#TK_INTGR 
      009ACF 30               [ 4] 5230 	ret 
                                   5231 
                                   5232 ;-------------------------
                                   5233 ; BASIC: EEPROM 
                                   5234 ; return eeprom address
                                   5235 ; input:
                                   5236 ;  none 
                                   5237 ; output:
                                   5238 ;	A		TK_INTGR
                                   5239 ;   X 		eeprom address 
                                   5240 ;---------------------------
      001E4C                       5241 eeprom:
      009AD0 5B 02 52         [ 2] 5242 	ldw x,#EEPROM_BASE 
      009AD3 06 CD            [ 1] 5243 	ld a,#TK_INTGR 
      009AD5 96               [ 4] 5244 	ret 
                                   5245 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5246 ;---------------------
                                   5247 ; BASIC: USR(addr[,arg])
                                   5248 ; execute a function written 
                                   5249 ; in binary code.
                                   5250 ; binary fonction should 
                                   5251 ; return token attribute in A 
                                   5252 ; and value in X. 
                                   5253 ; input:
                                   5254 ;   addr	routine address 
                                   5255 ;   arg 	is an optional argument 
                                   5256 ; output:
                                   5257 ;   A 		token attribute 
                                   5258 ;   X       returned value 
                                   5259 ;---------------------
      001E52                       5260 usr:
      009AD6 E3 AE            [ 2] 5261 	pushw y 	
      009AD8 16 C8            [ 1] 5262 	ld a,#TK_LPAREN 
      009ADA CF 00 04         [ 4] 5263 	call expect 
      009ADD 7F 72 5F         [ 4] 5264 	call arg_list 
      009AE0 00 03            [ 1] 5265 	cp a,#1 
      009AE2 5F CF            [ 1] 5266 	jrpl 2$ 
      009AE4 00 06 CF         [ 2] 5267 	jp syntax_error 
      009AE7 00 01            [ 1] 5268 2$: ld a,#TK_RPAREN
      009AE9 72 11 00         [ 4] 5269 	call expect 
      009AEC 25 72 18         [ 4] 5270 	call dpop 
      009AEF 00 25            [ 1] 5271 	cp a,#2 
      009AF1 CC 88            [ 1] 5272 	jrmi 4$
      009AF3 4E 0A            [ 1] 5273 	ldw y,x ; y=arg 
      009AF5 62 72 65         [ 4] 5274 	call dpop ;x=addr 
      009AF8 61               [ 1] 5275 4$:	exgw y,x ; y=addr,x=arg 
      009AF9 6B 20            [ 4] 5276 	call (y)
      009AFB 70 6F            [ 2] 5277 	popw y 
      009AFD 69               [ 4] 5278 	ret 
                                   5279 
                                   5280 ;------------------------------
                                   5281 ; BASIC: BYE 
                                   5282 ; halt mcu in its lowest power mode 
                                   5283 ; wait for reset or external interrupt
                                   5284 ; do a cold start on wakeup.
                                   5285 ;------------------------------
      001E7A                       5286 bye:
      009AFE 6E 74 2C 20 52   [ 2] 5287 	btjf UART3_SR,#UART_SR_TC,.
      009B03 55               [10] 5288 	halt
      009B04 4E 20 74         [ 2] 5289 	jp cold_start  
                                   5290 
                                   5291 ;----------------------------------
                                   5292 ; BASIC: SLEEP 
                                   5293 ; halt mcu until reset or external
                                   5294 ; interrupt.
                                   5295 ; Resume progam after SLEEP command
                                   5296 ;----------------------------------
      001E83                       5297 sleep:
      009B07 6F 20 72 65 73   [ 2] 5298 	btjf UART3_SR,#UART_SR_TC,.
      009B0C 75 6D 65 2E      [ 1] 5299 	bset flags,#FSLEEP
      009B10 0A               [10] 5300 	halt 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B11 00               [ 4] 5301 	ret 
                                   5302 
                                   5303 ;-------------------------------
                                   5304 ; BASIC: PAUSE expr 
                                   5305 ; suspend execution for n msec.
                                   5306 ; input:
                                   5307 ;	none
                                   5308 ; output:
                                   5309 ;	none 
                                   5310 ;------------------------------
      009B12                       5311 pause:
      009B12 72 01 00         [ 4] 5312 	call expression
      009B15 25 02            [ 1] 5313 	cp a,#TK_INTGR
      009B17 4F 81            [ 1] 5314 	jreq pause02 
      009B19 CC 07 18         [ 2] 5315 	jp syntax_error
      001E98                       5316 pause02: 
      009B19 CD               [ 2] 5317 1$: tnzw x 
      009B1A 86 66            [ 1] 5318 	jreq 2$
      009B1C 81               [10] 5319 	wfi 
      009B1D 5A               [ 2] 5320 	decw x 
      009B1D 72 BB            [ 1] 5321 	jrne 1$
      009B1F 00               [ 1] 5322 2$:	clr a 
      009B20 15               [ 4] 5323 	ret 
                                   5324 
                                   5325 ;------------------------------
                                   5326 ; BASIC: TICKS
                                   5327 ; return msec ticks counter value 
                                   5328 ; input:
                                   5329 ; 	none 
                                   5330 ; output:
                                   5331 ;	X 		TK_INTGR
                                   5332 ;-------------------------------
      001EA1                       5333 get_ticks:
      009B21 24 04 72         [ 2] 5334 	ldw x,ticks 
      009B24 5C 00            [ 1] 5335 	ld a,#TK_INTGR
      009B26 14               [ 4] 5336 	ret 
                                   5337 
                                   5338 
                                   5339 
                                   5340 ;------------------------------
                                   5341 ; BASIC: ABS(expr)
                                   5342 ; return absolute value of expr.
                                   5343 ; input:
                                   5344 ;   none
                                   5345 ; output:
                                   5346 ;   X     	positive integer
                                   5347 ;-------------------------------
      001EA7                       5348 abs:
      009B27 CF 00            [ 1] 5349 	ld a,#TK_LPAREN
      009B29 15 81 B5         [ 4] 5350 	call expect 
      009B2B CD 11 C2         [ 4] 5351 	call arg_list
      009B2B A6 01            [ 1] 5352 	cp a,#1 
      009B2D C7 00            [ 1] 5353 	jreq 0$ 
      009B2F 14 5F CF         [ 2] 5354 	jp syntax_error
      001EB6                       5355 0$:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009B32 00 15            [ 1] 5356 	ld a,#TK_RPAREN 
      009B34 CD 11 B5         [ 4] 5357 	call expect 
      009B34 AE 00 03         [ 4] 5358     call dpop   
      009B37 92               [ 1] 5359 	ld a,xh 
      009B38 AF 00            [ 1] 5360 	bcp a,#0x80 
      009B3A 14 26            [ 1] 5361 	jreq 2$ 
      009B3C 05               [ 2] 5362 	negw x 
      009B3D 5A 2A            [ 1] 5363 2$: ld a,#TK_INTGR 
      009B3F F7               [ 4] 5364 	ret 
                                   5365 
                                   5366 ;------------------------------
                                   5367 ; BASIC: RND(expr)
                                   5368 ; return random number 
                                   5369 ; between 1 and expr inclusive
                                   5370 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5371 ; input:
                                   5372 ; 	none 
                                   5373 ; output:
                                   5374 ;	X 		random positive integer 
                                   5375 ;------------------------------
      001EC7                       5376 random:
      009B40 20 19            [ 1] 5377 	ld a,#TK_LPAREN 
      009B42 5C CD 9B         [ 4] 5378 	call expect 
      009B45 1D AE 02         [ 4] 5379 	call arg_list 
      009B48 7F C3            [ 1] 5380 	cp a,#1
      009B4A 00 14            [ 1] 5381 	jreq 1$
      009B4C 2A E6 72         [ 2] 5382 	jp syntax_error
      009B4F 5F 00            [ 1] 5383 1$: ld a,#TK_RPAREN
      009B51 17 72 5F         [ 4] 5384 	call expect 
      009B54 00 18 72         [ 4] 5385 	call dpop 
      009B57 5F               [ 2] 5386 	pushw x 
      009B58 00               [ 1] 5387 	ld a,xh 
      009B59 19 81            [ 1] 5388 	bcp a,#0x80 
      009B5B 27 05            [ 1] 5389 	jreq 2$
      009B5B CE 00            [ 1] 5390 	ld a,#ERR_BAD_VALUE
      009B5D 14 C6 00         [ 2] 5391 	jp tb_error
      001EE9                       5392 2$: 
                                   5393 ; acc16=(x<<5)^x 
      009B60 16 CF 00         [ 2] 5394 	ldw x,seedx 
      009B63 17               [ 2] 5395 	sllw x 
      009B64 C7               [ 2] 5396 	sllw x 
      009B65 00               [ 2] 5397 	sllw x 
      009B66 19               [ 2] 5398 	sllw x 
      009B67 81               [ 2] 5399 	sllw x 
      009B68 9E               [ 1] 5400 	ld a,xh 
      009B68 5F 92 AF         [ 1] 5401 	xor a,seedx 
      009B6B 00 14 90         [ 1] 5402 	ld acc16,a 
      009B6E F1               [ 1] 5403 	ld a,xl 
      009B6F 26 08 4D         [ 1] 5404 	xor a,seedx+1 
      009B72 27 12 5C         [ 1] 5405 	ld acc8,a 
                                   5406 ; seedx=seedy 
      009B75 90 5C 20         [ 2] 5407 	ldw x,seedy 
      009B78 F0 00 0D         [ 2] 5408 	ldw seedx,x  
                                   5409 ; seedy=seedy^(seedy>>1)
      009B79 90 54            [ 2] 5410 	srlw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009B79 4D 27            [ 1] 5411 	ld a,yh 
      009B7B 07 5C 92         [ 1] 5412 	xor a,seedy 
      009B7E AF 00 14         [ 1] 5413 	ld seedy,a  
      009B81 20 F6            [ 1] 5414 	ld a,yl 
      009B83 5C 98 81         [ 1] 5415 	xor a,seedy+1 
      009B86 C7 00 10         [ 1] 5416 	ld seedy+1,a 
                                   5417 ; acc16>>3 
      009B86 5C 99 81         [ 2] 5418 	ldw x,acc16 
      009B89 54               [ 2] 5419 	srlw x 
      009B89 52               [ 2] 5420 	srlw x 
      009B8A 04               [ 2] 5421 	srlw x 
                                   5422 ; x=acc16^x 
      009B8B 17               [ 1] 5423 	ld a,xh 
      009B8C 03 5F CF         [ 1] 5424 	xor a,acc16 
      009B8F 00               [ 1] 5425 	ld xh,a 
      009B90 15               [ 1] 5426 	ld a,xl 
      009B91 35 01 00         [ 1] 5427 	xor a,acc8 
      009B94 14               [ 1] 5428 	ld xl,a 
                                   5429 ; seedy=x^seedy 
      009B95 C8 00 10         [ 1] 5430 	xor a,seedy+1
      009B95 92               [ 1] 5431 	ld xl,a 
      009B96 BC               [ 1] 5432 	ld a,xh 
      009B97 00 14 27         [ 1] 5433 	xor a,seedy
      009B9A 25               [ 1] 5434 	ld xh,a 
      009B9B 5F 16 03         [ 2] 5435 	ldw seedy,x 
                                   5436 ; return seedy modulo expr + 1 
      009B9E CD 9B            [ 2] 5437 	popw y 
      009BA0 68               [ 2] 5438 	divw x,y 
      009BA1 25               [ 1] 5439 	ldw x,y 
      009BA2 2D               [ 1] 5440 	incw x 
      009BA3 92 AF            [ 1] 5441 	ld a,#TK_INTGR
      009BA5 00               [ 4] 5442 	ret 
                                   5443 
                                   5444 ;---------------------------------
                                   5445 ; BASIC: WORDS 
                                   5446 ; affiche la listes des mots du
                                   5447 ; dictionnaire.
                                   5448 ;---------------------------------
                           000001  5449 	WLEN=1
                           000002  5450 	LLEN=2  
                           000002  5451 	VSIZE=2 
      001F3B                       5452 words:
      001F3B                       5453 	_vars VSIZE
      009BA6 14 6B            [ 2]    1     sub sp,#VSIZE 
      009BA8 01 5C            [ 1] 5454 	clr (LLEN,sp)
      009BAA 92 AF 00 14      [ 2] 5455 	ldw y,#kword_dict+2
      009BAE 6B               [ 1] 5456 0$:	ldw x,y
      009BAF 02               [ 1] 5457 	ld a,(x)
      009BB0 5C 72            [ 1] 5458 	and a,#15 
      009BB2 FB 01            [ 1] 5459 	ld (WLEN,sp),a 
      009BB4 5C               [ 1] 5460 1$:	incw x 
      009BB5 CD               [ 1] 5461 	ld a,(x)
      009BB6 9B 1D AE         [ 4] 5462 	call putc 
      009BB9 02 80            [ 1] 5463 	inc (LLEN,sp)
      009BBB C3 00            [ 1] 5464 	dec (WLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009BBD 14 2A            [ 1] 5465 	jrne 1$
      009BBF D5 46            [ 1] 5466 	ld a,#70
      009BC0 11 02            [ 1] 5467 	cp a,(LLEN,sp)
      009BC0 72 5F            [ 1] 5468 	jrmi 2$   
      009BC2 00 14            [ 1] 5469 	ld a,#SPACE 
      009BC4 72 5F 00         [ 4] 5470 	call putc 
      009BC7 15 72            [ 1] 5471 	inc (LLEN,sp) 
      009BC9 5F 00            [ 2] 5472 	jra 3$
      009BCB 16 5B            [ 1] 5473 2$: ld a,#CR 
      009BCD 04 98 81         [ 4] 5474 	call putc 
      009BD0 0F 02            [ 1] 5475 	clr (LLEN,sp)
      009BD0 5B 04 99 81      [ 2] 5476 3$:	subw y,#2 
      009BD4 90 FE            [ 2] 5477 	ldw y,(y)
      009BD4 72 01            [ 1] 5478 	jrne 0$  
      001F72                       5479 	_drop VSIZE 
      009BD6 00 25            [ 2]    1     addw sp,#VSIZE 
      009BD8 05               [ 4] 5480 	ret 
                                   5481 
                                   5482 
                                   5483 ;*********************************
                                   5484 
                                   5485 ;------------------------------
                                   5486 ;      dictionary 
                                   5487 ; format:
                                   5488 ;   link:   2 bytes 
                                   5489 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5490 ;   cmd_name: 16 byte max 
                                   5491 ;   code_address: 2 bytes 
                                   5492 ;------------------------------
                                   5493 	.macro _dict_entry len,name,cmd 
                                   5494 	.word LINK 
                                   5495 	LINK=.
                                   5496 name:
                                   5497 	.byte len 	
                                   5498 	.ascii "name"
                                   5499 	.word cmd 
                                   5500 	.endm 
                                   5501 
                           000000  5502 	LINK=0
      001F75                       5503 kword_end:
      001F75                       5504 	_dict_entry,5,WRITE,write  
      009BD9 A6 07                    1 	.word LINK 
                           001F77     2 	LINK=.
      001F77                          3 WRITE:
      009BDB CC                       4 	.byte 5 	
      009BDC 87 9A 49 54 45           5 	.ascii "WRITE"
      009BDE 1D 61                    6 	.word write 
      001F7F                       5505 	_dict_entry,5,WORDS,words 
      009BDE CE 00                    1 	.word LINK 
                           001F81     2 	LINK=.
      001F81                          3 WORDS:
      009BE0 1E                       4 	.byte 5 	
      009BE1 72 B0 00 1C 26           5 	.ascii "WORDS"
      009BE6 01 81                    6 	.word words 
      009BE8                       5506 	_dict_entry 4,WAIT,wait 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009BE8 52 04                    1 	.word LINK 
                           001F8B     2 	LINK=.
      001F8B                          3 WAIT:
      009BEA 1F                       4 	.byte 4 	
      009BEB 01 CD 88 7E              5 	.ascii "WAIT"
      009BEF A1 0A                    6 	.word wait 
      001F92                       5507 	_dict_entry,3+F_IFUNC,USR,usr
      009BF1 27 03                    1 	.word LINK 
                           001F94     2 	LINK=.
      001F94                          3 USR:
      009BF3 CC                       4 	.byte 3+F_IFUNC 	
      009BF4 87 98 52                 5 	.ascii "USR"
      009BF6 1E 52                    6 	.word usr 
      001F9A                       5508 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009BF6 90 CE                    1 	.word LINK 
                           001F9C     2 	LINK=.
      001F9C                          3 UFLASH:
      009BF8 00                       4 	.byte 6+F_IFUNC 	
      009BF9 04 72 B9 00 01 17        5 	.ascii "UFLASH"
      009BFF 03 55                    6 	.word uflash 
      001FA5                       5509 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009C01 00 03                    1 	.word LINK 
                           001FA7     2 	LINK=.
      001FA7                          3 UBOUND:
      009C03 00                       4 	.byte 6+F_IFUNC 	
      009C04 02 93 CD 82 F2 1C        5 	.ascii "UBOUND"
      009C0A 00 03                    6 	.word ubound 
      001FB0                       5510 	_dict_entry,2,TO,to
      009C0C 72 FB                    1 	.word LINK 
                           001FB2     2 	LINK=.
      001FB2                          3 TO:
      009C0E 01                       4 	.byte 2 	
      009C0F 72 5D                    5 	.ascii "TO"
      009C11 00 17                    6 	.word to 
      001FB7                       5511 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      009C13 26 0B                    1 	.word LINK 
                           001FB9     2 	LINK=.
      001FB9                          3 TICKS:
      009C15 72                       4 	.byte 5+F_IFUNC 	
      009C16 B0 00 18 23 05           5 	.ascii "TICKS"
      009C1B A6 01                    6 	.word get_ticks 
      001FC1                       5512 	_dict_entry,4,STOP,stop 
      009C1D CC 87                    1 	.word LINK 
                           001FC3     2 	LINK=.
      001FC3                          3 STOP:
      009C1F 9A                       4 	.byte 4 	
      009C20 53 54 4F 50              5 	.ascii "STOP"
      009C20 16 03                    6 	.word stop 
      001FCA                       5513 	_dict_entry,4,STEP,step 
      009C22 CD 9B                    1 	.word LINK 
                           001FCC     2 	LINK=.
      001FCC                          3 STEP:
      009C24 89                       4 	.byte 4 	
      009C25 24 05 A6 08              5 	.ascii "STEP"
      009C29 CC 87                    6 	.word step 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      001FD3                       5514 	_dict_entry,5,SLEEP,sleep 
      009C2B 9A CC                    1 	.word LINK 
                           001FD5     2 	LINK=.
      009C2C                          3 SLEEP:
      009C2C CE                       4 	.byte 5 	
      009C2D 00 17 C6 00 19           5 	.ascii "SLEEP"
      009C32 CF 00                    6 	.word sleep 
      001FDD                       5515 	_dict_entry,4+F_IFUNC,SIZE,size
      009C34 14 C7                    1 	.word LINK 
                           001FDF     2 	LINK=.
      001FDF                          3 SIZE:
      009C36 00                       4 	.byte 4+F_IFUNC 	
      009C37 16 1E 03 CD              5 	.ascii "SIZE"
      009C3B 82 F2                    6 	.word size 
      001FE6                       5516     _dict_entry,4,SHOW,show 
      009C3D 5C 1F                    1 	.word LINK 
                           001FE8     2 	LINK=.
      001FE8                          3 SHOW:
      009C3F 01                       4 	.byte 4 	
      009C40 5F 16 03 CD              5 	.ascii "SHOW"
      009C44 81 D1                    6 	.word show 
      001FEF                       5517 	_dict_entry,4,SAVE,save
      009C46 CE 00                    1 	.word LINK 
                           001FF1     2 	LINK=.
      001FF1                          3 SAVE:
      009C48 1E                       4 	.byte 4 	
      009C49 72 B0 00 1C              5 	.ascii "SAVE"
      009C4D 1F 01                    6 	.word save 
      001FF8                       5518 	_dict_entry 3,RUN,run
      009C4F 5F 7B                    1 	.word LINK 
                           001FFA     2 	LINK=.
      001FFA                          3 RUN:
      009C51 01                       4 	.byte 3 	
      009C52 CD 81 5C                 5 	.ascii "RUN"
      009C55 5C 7B                    6 	.word run 
      002000                       5519 	_dict_entry,3+F_IFUNC,RND,random 
      009C57 02 CD                    1 	.word LINK 
                           002002     2 	LINK=.
      002002                          3 RND:
      009C59 81                       4 	.byte 3+F_IFUNC 	
      009C5A 5C 5C CD                 5 	.ascii "RND"
      009C5D 9B 1D                    6 	.word random 
      002008                       5520 	_dict_entry,6,RETURN,return 
      009C5F 1E 01                    1 	.word LINK 
                           00200A     2 	LINK=.
      00200A                          3 RETURN:
      009C61 89                       4 	.byte 6 	
      009C62 5F 90 CE 00 1C CD        5 	.ascii "RETURN"
      009C68 81 D1                    6 	.word return 
      002013                       5521 	_dict_entry 6,REMARK,rem 
      009C6A 5B 02                    1 	.word LINK 
                           002015     2 	LINK=.
      002015                          3 REMARK:
      009C6C AE                       4 	.byte 6 	
      009C6D 00 01 A6 FF CD 81        5 	.ascii "REMARK"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009C73 5C CD                    6 	.word rem 
      00201E                       5522 	_dict_entry,5+F_IFUNC,RDADC,read_adc
      009C75 9B 1D                    1 	.word LINK 
                           002020     2 	LINK=.
      002020                          3 RDADC:
      009C77 CE                       4 	.byte 5+F_IFUNC 	
      009C78 00 14 C6 00 16           5 	.ascii "RDADC"
      009C7D CF 00                    6 	.word read_adc 
      002028                       5523 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      009C7F 17 C7                    1 	.word LINK 
                           00202A     2 	LINK=.
      00202A                          3 QKEY:
      009C81 00                       4 	.byte 4+F_IFUNC 	
      009C82 19 5F 4B 04              5 	.ascii "QKEY"
      009C86 1D E1                    6 	.word qkey 
      002031                       5524 	_dict_entry,6,PWRADC,power_adc 
      009C86 4F CD                    1 	.word LINK 
                           002033     2 	LINK=.
      002033                          3 PWRADC:
      009C88 81                       4 	.byte 6 	
      009C89 5C 5C 0A 01 26 F7        5 	.ascii "PWRADC"
      009C8F 84 1E                    6 	.word power_adc 
      00203C                       5525 	_dict_entry 5,PRINT,print 
      009C91 01 CD                    1 	.word LINK 
                           00203E     2 	LINK=.
      00203E                          3 PRINT:
      009C93 8A                       4 	.byte 5 	
      009C94 1D 5B 04 81 54           5 	.ascii "PRINT"
      009C98 15 F2                    6 	.word print 
      002046                       5526 	_dict_entry,4,POKE,poke 
      009C98 72 01                    1 	.word LINK 
                           002048     2 	LINK=.
      002048                          3 POKE:
      009C9A 00                       4 	.byte 4 	
      009C9B 25 07 27 05              5 	.ascii "POKE"
      009C9F A6 07                    6 	.word poke 
      00204F                       5527 	_dict_entry,4+F_IFUNC,PEEK,peek 
      009CA1 CC 87                    1 	.word LINK 
                           002051     2 	LINK=.
      002051                          3 PEEK:
      009CA3 9A                       4 	.byte 4+F_IFUNC 	
      009CA4 50 45 45 4B              5 	.ascii "PEEK"
      009CA4 CD 88                    6 	.word peek 
      002058                       5528 	_dict_entry,5,PAUSE,pause 
      009CA6 7E A1                    1 	.word LINK 
                           00205A     2 	LINK=.
      00205A                          3 PAUSE:
      009CA8 0A                       4 	.byte 5 	
      009CA9 27 03 CC 87 98           5 	.ascii "PAUSE"
      009CAE 1E 8E                    6 	.word pause 
      002062                       5529 	_dict_entry,3+F_IFUNC,ODR,port_odr
      009CAE 90 CE                    1 	.word LINK 
                           002064     2 	LINK=.
      002064                          3 ODR:
      009CB0 00                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009CB1 04 72 B9                 5 	.ascii "ODR"
      009CB4 00 01                    6 	.word port_odr 
      00206A                       5530 	_dict_entry,3,NEW,new
      009CB6 55 00                    1 	.word LINK 
                           00206C     2 	LINK=.
      00206C                          3 NEW:
      009CB8 03                       4 	.byte 3 	
      009CB9 00 02 CD                 5 	.ascii "NEW"
      009CBC 9B 89                    6 	.word new 
      002072                       5531 	_dict_entry,4,NEXT,next 
      009CBE 25 05                    1 	.word LINK 
                           002074     2 	LINK=.
      002074                          3 NEXT:
      009CC0 A6                       4 	.byte 4 	
      009CC1 09 CC 87 9A              5 	.ascii "NEXT"
      009CC5 18 6A                    6 	.word next 
      00207B                       5532 	_dict_entry,4,LOAD,load 
      009CC5 CD 9B                    1 	.word LINK 
                           00207D     2 	LINK=.
      00207D                          3 LOAD:
      009CC7 1D                       4 	.byte 4 	
      009CC8 CD 86 66 5F              5 	.ascii "LOAD"
      009CCC 92 AF                    6 	.word load 
      002084                       5533 	_dict_entry 4,LIST,list
      009CCE 00 14                    1 	.word LINK 
                           002086     2 	LINK=.
      002086                          3 LIST:
      009CD0 90                       4 	.byte 4 	
      009CD1 95 5C 92 AF              5 	.ascii "LIST"
      009CD5 00 14                    6 	.word list 
      00208D                       5534 	_dict_entry 3,LET,let 
      009CD7 5C 90                    1 	.word LINK 
                           00208F     2 	LINK=.
      00208F                          3 LET:
      009CD9 97                       4 	.byte 3 	
      009CDA 72 B9 00                 5 	.ascii "LET"
      009CDD 1C 90                    6 	.word let 
      002095                       5535 	_dict_entry,3+F_IFUNC,KEY,key 
      009CDF CF 00                    1 	.word LINK 
                           002097     2 	LINK=.
      002097                          3 KEY:
      009CE1 1E                       4 	.byte 3+F_IFUNC 	
      009CE2 90 CE 00                 5 	.ascii "KEY"
      009CE5 1C D9                    6 	.word key 
      009CE6                       5536 	_dict_entry,5,INPUT,input_var  
      009CE6 92 AF                    1 	.word LINK 
                           00209F     2 	LINK=.
      00209F                          3 INPUT:
      009CE8 00                       4 	.byte 5 	
      009CE9 14 90 F7 5C 90           5 	.ascii "INPUT"
      009CEE 5C 90                    6 	.word input_var 
      0020A7                       5537 	_dict_entry,2,IF,if 
      009CF0 C3 00                    1 	.word LINK 
                           0020A9     2 	LINK=.
      0020A9                          3 IF:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009CF2 1E                       4 	.byte 2 	
      009CF3 2B F1                    5 	.ascii "IF"
      009CF5 CE 00                    6 	.word if 
      0020AE                       5538 	_dict_entry,3+F_IFUNC,IDR,port_idr
      009CF7 1E 72                    1 	.word LINK 
                           0020B0     2 	LINK=.
      0020B0                          3 IDR:
      009CF9 B0                       4 	.byte 3+F_IFUNC 	
      009CFA 00 1C CD                 5 	.ascii "IDR"
      009CFD 8A 1D                    6 	.word port_idr 
      0020B6                       5539 	_dict_entry,3,HEX,hex_base
      009CFF 81 B0                    1 	.word LINK 
                           0020B8     2 	LINK=.
      009D00                          3 HEX:
      009D00 CD                       4 	.byte 3 	
      009D01 88 7E A1                 5 	.ascii "HEX"
      009D04 00 27                    6 	.word hex_base 
      0020BE                       5540 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      009D06 26 A1                    1 	.word LINK 
                           0020C0     2 	LINK=.
      0020C0                          3 GPIO:
      009D08 0A                       4 	.byte 4+F_IFUNC 	
      009D09 27 03 CC 87              5 	.ascii "GPIO"
      009D0D 98 90                    6 	.word gpio 
      0020C7                       5541 	_dict_entry,4,GOTO,goto 
      009D0F CE 00                    1 	.word LINK 
                           0020C9     2 	LINK=.
      0020C9                          3 GOTO:
      009D11 04                       4 	.byte 4 	
      009D12 72 B9 00 01              5 	.ascii "GOTO"
      009D16 55 00                    6 	.word goto 
      0020D0                       5542 	_dict_entry,5,GOSUB,gosub 
      009D18 03 00                    1 	.word LINK 
                           0020D2     2 	LINK=.
      0020D2                          3 GOSUB:
      009D1A 02                       4 	.byte 5 	
      009D1B CD 9B 89 25 05           5 	.ascii "GOSUB"
      009D20 A6 09                    6 	.word gosub 
      0020DA                       5543 	_dict_entry,6,FORGET,forget 
      009D22 CC 87                    1 	.word LINK 
                           0020DC     2 	LINK=.
      0020DC                          3 FORGET:
      009D24 9A                       4 	.byte 6 	
      009D25 46 4F 52 47 45 54        5 	.ascii "FORGET"
      009D25 CE 00                    6 	.word forget 
      0020E5                       5544 	_dict_entry,3,FOR,for 
      009D27 14 C6                    1 	.word LINK 
                           0020E7     2 	LINK=.
      0020E7                          3 FOR:
      009D29 00                       4 	.byte 3 	
      009D2A 16 20 0A                 5 	.ascii "FOR"
      009D2D 17 E8                    6 	.word for 
      0020ED                       5545 	_dict_entry,6+F_IFUNC,EEPROM,eeprom 
      009D2D AE 00                    1 	.word LINK 
                           0020EF     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      0020EF                          3 EEPROM:
      009D2F 64                       4 	.byte 6+F_IFUNC 	
      009D30 4F CF 00 14 C7 00        5 	.ascii "EEPROM"
      009D36 16 4C                    6 	.word eeprom 
      009D37                       5546 	_dict_entry,3,DIR,directory 
      009D37 CF 00                    1 	.word LINK 
                           0020FA     2 	LINK=.
      0020FA                          3 DIR:
      009D39 17                       4 	.byte 3 	
      009D3A C7 00 19                 5 	.ascii "DIR"
      009D3D 4B 04                    6 	.word directory 
      002100                       5547 	_dict_entry,3,DEC,dec_base
      009D3F 5F FA                    1 	.word LINK 
                           002102     2 	LINK=.
      009D40                          3 DEC:
      009D40 4F                       4 	.byte 3 	
      009D41 CD 81 5C                 5 	.ascii "DEC"
      009D44 5C 0A                    6 	.word dec_base 
      002108                       5548 	_dict_entry,3+F_IFUNC,DDR,port_ddr 
      009D46 01 26                    1 	.word LINK 
                           00210A     2 	LINK=.
      00210A                          3 DDR:
      009D48 F7                       4 	.byte 3+F_IFUNC 	
      009D49 84 81 52                 5 	.ascii "DDR"
      009D4B 1E 34                    6 	.word port_ddr 
      002110                       5549 	_dict_entry,3+F_IFUNC,CRL,port_cr1 
      009D4B 52 02                    1 	.word LINK 
                           002112     2 	LINK=.
      002112                          3 CRL:
      009D4D 5F                       4 	.byte 3+F_IFUNC 	
      009D4E 1F 01 CF                 5 	.ascii "CRL"
      009D51 00 15                    6 	.word port_cr1 
      002118                       5550 	_dict_entry,3+F_IFUNC,CRH,port_cr2
      009D53 35 01                    1 	.word LINK 
                           00211A     2 	LINK=.
      00211A                          3 CRH:
      009D55 00                       4 	.byte 3+F_IFUNC 	
      009D56 14 52 48                 5 	.ascii "CRH"
      009D57 1E 40                    6 	.word port_cr2 
      002120                       5551 	_dict_entry,4+F_CFUNC,CHAR,char
      009D57 5F 92                    1 	.word LINK 
                           002122     2 	LINK=.
      002122                          3 CHAR:
      009D59 AF                       4 	.byte 4+F_CFUNC 	
      009D5A 00 14 27 39              5 	.ascii "CHAR"
      009D5E 1D 98                    6 	.word char 
      002129                       5552 	_dict_entry,3,BYE,bye 
      009D5E 92 AF                    1 	.word LINK 
                           00212B     2 	LINK=.
      00212B                          3 BYE:
      009D60 00                       4 	.byte 3 	
      009D61 14 27 06                 5 	.ascii "BYE"
      009D64 CD 82                    6 	.word bye 
      002131                       5553 	_dict_entry,5,BTOGL,bit_toggle
      009D66 1E 5C                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                           002133     2 	LINK=.
      002133                          3 BTOGL:
      009D68 20                       4 	.byte 5 	
      009D69 F4 5C A6 20 CD           5 	.ascii "BTOGL"
      009D6E 82 1E                    6 	.word bit_toggle 
      00213B                       5554 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      009D70 92 AF                    1 	.word LINK 
                           00213D     2 	LINK=.
      00213D                          3 BTEST:
      009D72 00                       4 	.byte 5+F_IFUNC 	
      009D73 14 90 95 5C 92           5 	.ascii "BTEST"
      009D78 AF 00                    6 	.word bit_test 
      002145                       5555 	_dict_entry,4,BSET,bit_set 
      009D7A 14 5C                    1 	.word LINK 
                           002147     2 	LINK=.
      002147                          3 BSET:
      009D7C 90                       4 	.byte 4 	
      009D7D 97 90 89 72              5 	.ascii "BSET"
      009D81 FB 01                    6 	.word bit_set 
      00214E                       5556 	_dict_entry,4,BRES,bit_reset
      009D83 5C CD                    1 	.word LINK 
                           002150     2 	LINK=.
      002150                          3 BRES:
      009D85 9B                       4 	.byte 4 	
      009D86 1D 85 CD 8A              5 	.ascii "BRES"
      009D8A 1D A6                    6 	.word bit_reset 
      002157                       5557 	_dict_entry,5,BREAK,break 
      009D8C 0D CD                    1 	.word LINK 
                           002159     2 	LINK=.
      002159                          3 BREAK:
      009D8E 82                       4 	.byte 5 	
      009D8F 1E 1E 01 5C 1F           5 	.ascii "BREAK"
      009D94 01 20                    6 	.word break 
      002161                       5558 	_dict_entry,4,BEEP,beep 
      009D96 C0 59                    1 	.word LINK 
                           002163     2 	LINK=.
      009D97                          3 BEEP:
      009D97 1E                       4 	.byte 4 	
      009D98 01 CD 8A 1D              5 	.ascii "BEEP"
      009D9C AE 9D                    6 	.word beep 
      00216A                       5559 	_dict_entry,3+F_IFUNC,ASC,ascii  
      009D9E CC CD                    1 	.word LINK 
                           00216C     2 	LINK=.
      00216C                          3 ASC:
      009DA0 82                       4 	.byte 3+F_IFUNC 	
      009DA1 30 A6 FF                 5 	.ascii "ASC"
      009DA4 C0 00                    6 	.word ascii 
      002172                       5560 kword_dict:
      002172                       5561 	_dict_entry,3+F_IFUNC,ABS,abs
      009DA6 19 C7                    1 	.word LINK 
                           002174     2 	LINK=.
      002174                          3 ABS:
      009DA8 00                       4 	.byte 3+F_IFUNC 	
      009DA9 0B A6 7F                 5 	.ascii "ABS"
      009DAC C2 00                    6 	.word abs 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                                   5562 	
                                   5563 
      002180                       5564 	.bndry 128 ; align on FLASH block.
                                   5565 ; free space for user application  
      002180                       5566 user_space:
                                   5567 ; USR() function test
      009DAE 18               [ 2] 5568 	pushw x 
      009DAF C7 00 0A A6      [ 1] 5569 	bset PC_ODR,#5 
      009DB3 02               [ 2] 5570 	popw x 
      009DB4 C2 00 17         [ 4] 5571 	call pause02 
      009DB7 C7 00 09 5F      [ 1] 5572 	bres PC_ODR,#5 
      009DBB A6               [ 4] 5573 	ret
                                   5574 
                                   5575 	.area FLASH_DRIVE (ABS)
      010000                       5576 	.org 0x10000
      010000                       5577 fdrive:
                                   5578 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002174 R   |     ADC_CR1 =  005401 
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
    ARG_OFS =  000002     |   5 ASC        00216C R   |     ATTRIB  =  000002 
    AWU_APR =  0050F1     |     AWU_CSR1=  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BASE_SAV=  000001     |   5 BEEP       002163 R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |     BINARY  =  000001 
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BLOCK_ER=  000000 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  000005     |   5 BREAK      002159 R   |   5 BRES       002150 R
  5 BSET       002147 R   |     BSIZE   =  000001     |     BSP     =  000008 
  5 BTEST      00213D R   |   5 BTOGL      002133 R   |     BTW     =  000001 
    BUFIDX  =  000003     |   5 BYE        00212B R   |     C       =  000001 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       002122 R
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
    CLK_CKDI=  0050C6     |     CLK_CKDI=  000000     |     CLK_CKDI=  000001 
    CLK_CKDI=  000002     |     CLK_CKDI=  000003     |     CLK_CKDI=  000004 
    CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1 
    CLK_ECKR=  000000     |     CLK_ECKR=  000001     |     CLK_HSIT=  0050CC 
    CLK_ICKR=  0050C0     |     CLK_ICKR=  000002     |     CLK_ICKR=  000000 
    CLK_ICKR=  000001     |     CLK_ICKR=  000003     |     CLK_ICKR=  000004 
    CLK_ICKR=  000005     |     CLK_PCKE=  0050C7     |     CLK_PCKE=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Symbol Table

    CLK_PCKE=  000001     |     CLK_PCKE=  000007     |     CLK_PCKE=  000005 
    CLK_PCKE=  000006     |     CLK_PCKE=  000004     |     CLK_PCKE=  000002 
    CLK_PCKE=  000003     |     CLK_PCKE=  0050CA     |     CLK_PCKE=  000003 
    CLK_PCKE=  000002     |     CLK_PCKE=  000007     |     CLK_SWCR=  0050C5 
    CLK_SWCR=  000000     |     CLK_SWCR=  000001     |     CLK_SWCR=  000002 
    CLK_SWCR=  000003     |     CLK_SWIM=  0050CD     |     CLK_SWR =  0050C4 
    CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2 
    CMD_END =  000002     |     CNT     =  000008     |     COMMA   =  000001 
    COUNT   =  000001     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   5 CRH        00211A R   |   5 CRL        002112 R
    CTRL_A  =  000001     |     CTRL_B  =  000002     |     CTRL_C  =  000003 
    CTRL_D  =  000004     |     CTRL_E  =  000005     |     CTRL_F  =  000006 
    CTRL_G  =  000007     |     CTRL_H  =  000008     |     CTRL_I  =  000009 
    CTRL_J  =  00000A     |     CTRL_K  =  00000B     |     CTRL_L  =  00000C 
    CTRL_M  =  00000D     |     CTRL_N  =  00000E     |     CTRL_O  =  00000F 
    CTRL_P  =  000010     |     CTRL_Q  =  000011     |     CTRL_R  =  000012 
    CTRL_S  =  000013     |     CTRL_T  =  000014     |     CTRL_U  =  000015 
    CTRL_V  =  000016     |     CTRL_W  =  000017     |     CTRL_X  =  000018 
    CTRL_Y  =  000019     |     CTRL_Z  =  00001A     |     CTXT_SIZ=  000006 
    CURR    =  000002     |     CX_BPTR =  000001     |     CX_CNT  =  000005 
    CX_IN   =  000004     |     CX_LNO  =  000003     |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
  5 DDR        00210A R   |     DEBUG   =  000001     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   5 DEC        002102 R   |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   5 DIR        0020FA R
    DIVIDND =  000007     |     DIVISR  =  000005     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |     DSTACK_S=  000040     |   5 EEPROM     0020EF R
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
    EOF     =  0000FF     |     ERR_BAD_=  00000A     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_L=  000005     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FCOMP   =  000005 
    FF      =  00000C     |     FFOR    =  000002     |     FHSE    =  7A1200 
    FHSI    =  F42400     |     FIRST   =  000001     |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLSI    =  01F400 
  5 FOR        0020E7 R   |   5 FORGET     0020DC R   |     FRUN    =  000000 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_IFUNC =  000040 
    F_SFUNC =  0000C0     |   5 GOSUB      0020D2 R   |     GOS_RET =  000003 
  5 GOTO       0020C9 R   |   5 GPIO       0020C0 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  5 HEX        0020B8 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        0020B0 R
  5 IF         0020A9 R   |     IN      =  000007     |     INCR    =  000001 
  5 INPUT      00209F R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
    INPUT_FL=  000000     |     INPUT_PU=  000001     |     INT_ADC2=  000016 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  00804C     |     INT_VECT=  00805C     |     INT_VECT=  008058 
    INW     =  000003     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        002097 R   |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000005     |   5 LET        00208F R   |     LINENO  =  000005 
  5 LINK    =  002174 R   |   5 LIST       002086 R   |     LL      =  000002 
    LLEN    =  000002     |     LL_HB   =  000001     |     LNO     =  000005 
    LN_PTR  =  000005     |   5 LOAD       00207D R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        00206C R
  5 NEXT       002074 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NL      =  00000A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R   |   5 ODR        002064 R
    OP      =  000005     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
    PAD_SIZE=  000028     |   5 PAUSE      00205A R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       002051 R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 POKE       002048 R
    PREV    =  000001     |   5 PRINT      00203E R   |     PROD    =  000002 
    PSIZE   =  000001     |   5 PWRADC     002033 R   |   5 QKEY       00202A R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

  5 RDADC      002020 R   |   5 REG_A      000947 R   |   5 REG_CC     00094B R
  5 REG_EPC    00093A R   |   5 REG_SP     000950 R   |   5 REG_X      000943 R
  5 REG_Y      00093F R   |     RELOP   =  000005     |   5 REMARK     002015 R
    RETL1   =  000001     |   5 RETURN     00200A R   |   5 RND        002002 R
    ROP     =  004800     |     RST_SR  =  0050B3     |   5 RUN        001FFA R
    RXCHAR  =  000001     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   5 SAVE       001FF1 R
    SDIVD   =  000002     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       001FE8 R   |     SIGN    =  000001 
  5 SIZE       001FDF R   |     SKIP    =  000006     |   5 SLEEP      001FD5 R
    SPACE   =  000020     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  000080     |   5 STATES     0008FD R   |   5 STEP       001FCC R
  5 STOP       001FC3 R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      001FB9 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_PSC=  005260     |     TIM1_PSC=  005261     |     TIM1_RCR=  005264 
    TIM1_SMC=  005252     |     TIM1_SMC=  000007     |     TIM1_SMC=  000000 
    TIM1_SMC=  000001     |     TIM1_SMC=  000002     |     TIM1_SMC=  000004 
    TIM1_SMC=  000005     |     TIM1_SMC=  000006     |     TIM1_SR1=  005255 
    TIM1_SR1=  000007     |     TIM1_SR1=  000001     |     TIM1_SR1=  000002 
    TIM1_SR1=  000003     |     TIM1_SR1=  000004     |     TIM1_SR1=  000005 
    TIM1_SR1=  000006     |     TIM1_SR1=  000000     |     TIM1_SR2=  005256 
    TIM1_SR2=  000001     |     TIM1_SR2=  000002     |     TIM1_SR2=  000003 
    TIM1_SR2=  000004     |     TIM2_ARR=  00530D     |     TIM2_ARR=  00530E 
    TIM2_CCE=  005308     |     TIM2_CCE=  005309     |     TIM2_CCM=  005305 
    TIM2_CCM=  005306     |     TIM2_CCM=  005307     |     TIM2_CCR=  00530F 
    TIM2_CCR=  005310     |     TIM2_CCR=  005311     |     TIM2_CCR=  005312 
    TIM2_CCR=  005313     |     TIM2_CCR=  005314     |     TIM2_CNT=  00530A 
    TIM2_CNT=  00530B     |     TIM2_CR1=  005300     |     TIM2_EGR=  005304 
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
    TIM4_SR_=  000000     |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
    TIM_CR1_=  000006     |     TIM_CR1_=  000005     |     TIM_CR1_=  000004 
    TIM_CR1_=  000003     |     TIM_CR1_=  000001     |     TIM_CR1_=  000002 
    TK_ARRAY=  000002     |     TK_CFUNC=  000008     |     TK_CHAR =  000003 
    TK_CMD  =  000006     |     TK_COLON=  000001     |     TK_COMMA=  00000D 
    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_IFUNC=  000007     |     TK_INTGR=  000004     |     TK_LE   =  000036 
    TK_LPARE=  00000B     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_PLUS =  000010     |     TK_QSTR =  00000A 
    TK_RPARE=  00000C     |     TK_SFUNC=  000009     |     TK_SHARP=  00000E 
    TK_VAR  =  000005     |   5 TO         001FB2 R   |   5 Timer4Up   000019 R
  5 TrapHand   00000A R   |     U8      =  000003     |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
    UART1_RX=  000004     |     UART1_SR=  005230     |     UART1_TX=  000005 
    UART3   =  000001     |     UART3_BA=  005240     |     UART3_BR=  005242 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

    UART3_BR=  005243     |     UART3_CR=  005244     |     UART3_CR=  005245 
    UART3_CR=  005246     |     UART3_CR=  005247     |     UART3_CR=  004249 
    UART3_DR=  005241     |     UART3_PO=  00000F     |     UART3_RX=  000006 
    UART3_SR=  005240     |     UART3_TX=  000005     |     UART_BRR=  000002 
    UART_BRR=  000003     |     UART_CR1=  000004     |     UART_CR1=  000004 
    UART_CR1=  000002     |     UART_CR1=  000000     |     UART_CR1=  000001 
    UART_CR1=  000007     |     UART_CR1=  000006     |     UART_CR1=  000005 
    UART_CR1=  000003     |     UART_CR2=  000005     |     UART_CR2=  000004 
    UART_CR2=  000002     |     UART_CR2=  000005     |     UART_CR2=  000001 
    UART_CR2=  000000     |     UART_CR2=  000006     |     UART_CR2=  000003 
    UART_CR2=  000007     |     UART_CR3=  000006     |     UART_CR3=  000003 
    UART_CR3=  000001     |     UART_CR3=  000002     |     UART_CR3=  000000 
    UART_CR3=  000006     |     UART_CR3=  000004     |     UART_CR3=  000005 
    UART_CR4=  000007     |     UART_CR4=  000000     |     UART_CR4=  000001 
    UART_CR4=  000002     |     UART_CR4=  000003     |     UART_CR4=  000004 
    UART_CR4=  000006     |     UART_CR4=  000005     |     UART_CR5=  000008 
    UART_CR5=  000003     |     UART_CR5=  000001     |     UART_CR5=  000002 
    UART_CR5=  000004     |     UART_CR5=  000005     |     UART_CR6=  000009 
    UART_CR6=  000004     |     UART_CR6=  000007     |     UART_CR6=  000001 
    UART_CR6=  000002     |     UART_CR6=  000000     |     UART_CR6=  000005 
    UART_DR =  000001     |     UART_GTR=  000009     |     UART_PSC=  00000A 
    UART_SR =  000000     |     UART_SR_=  000001     |     UART_SR_=  000004 
    UART_SR_=  000002     |     UART_SR_=  000003     |     UART_SR_=  000000 
    UART_SR_=  000005     |     UART_SR_=  000006     |     UART_SR_=  000007 
    UBC     =  004801     |   5 UBOUND     001FA7 R   |   5 UFLASH     001F9C R
  5 USER_ABO   00007E R   |   5 USR        001F94 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 UserButt   000025 R
    VSIZ    =  000002     |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       001F8B R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      001F81 R   |   5 WRITE      001F77 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XADR    =  000001     |     XMASK   =  000001 
    XSAVE   =  000003     |     YSAVE   =  000003     |   5 abs        001EA7 R
  1 acc16      000009 R   |   1 acc24      000008 R   |   1 acc8       00000A R
  5 accept_c   000AF1 R   |   5 add        001083 R   |   5 ansi_seq   000AB3 R
  5 arg_list   0011C2 R   |   1 array_ad   000020 R   |   1 array_si   000022 R
  5 ascii      001DB5 R   |   5 at_tst     000DBC R   |   5 atoi24     000ECF R
  5 atoi_exi   000F3D R   |   5 bad_port   001E23 R   |   1 base       000007 R
  1 basicptr   000003 R   |   5 beep       0019AD R   |   5 bin_exit   000CC2 R
  5 bit_rese   001746 R   |   5 bit_set    001732 R   |   5 bit_test   00176F R
  5 bit_togg   00175B R   |   5 bkslsh_t   000D67 R   |   5 bksp       0001BA R
  5 break      001A43 R   |   5 break_po   001A74 R   |   5 bye        001E7A R
  5 char       001D98 R   |   5 check_fu   0003E4 R   |   5 clear_ba   0005E6 R
  5 clear_va   0004F6 R   |   5 clock_in   000099 R   |   5 cmd_itf    000B15 R
  5 cmd_name   00112E R   |   5 cmp_name   001AE8 R   |   5 cold_sta   00055B R
  5 colon_ts   000D90 R   |   5 comma_ts   000D9B R   |   5 compile    0003F3 R
  5 convert_   000C4A R   |   1 count      000002 R   |   5 cp_loop    001171 R
  5 create_g   000343 R   |   5 cstk_pro   00104D R   |   5 dash_tst   000DB1 R
  5 ddrop      000FC9 R   |   5 ddrop_n    001006 R   |   5 ddup       000FD2 R
  5 dec_base   001369 R   |   5 del_back   000AE2 R   |   5 del_line   00030B R
  5 del_ln     000AD3 R   |   5 delete     0001CA R   |   5 dir_loop   001CD7 R
  5 director   001CCB R   |   5 divide     0010D9 R   |   5 divu24_8   000A40 R
  5 dotr       001056 R   |   5 dotr_loo   00106B R   |   5 dots       001023 R
  5 dpick      000FE3 R   |   5 dpop       000FA2 R   |   5 dpush      000F95 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]

Symbol Table

  5 drive_fr   001D54 R   |   3 dstack     001740 R   |   3 dstack_u   001780 R
  5 dstk_pro   001019 R   |   1 dstkptr    000019 R   |   5 dswap      000FAF R
  5 eeprom     001E4C R   |   5 eql_tst    000E1C R   |   5 equal      0015E5 R
  5 err_bad_   0006C7 R   |   5 err_cmd_   000688 R   |   5 err_div0   00064A R
  5 err_dupl   0006A3 R   |   5 err_math   000630 R   |   5 err_mem_   000613 R
  5 err_msg    0005FB R   |   5 err_no_a   0006D4 R   |   5 err_no_l   00065A R
  5 err_not_   0006B5 R   |   5 err_run_   000671 R   |   5 err_synt   000621 R
  5 escaped    000C5F R   |   5 expect     0011B5 R   |   5 expr_exi   0012FA R
  5 expressi   0012B9 R   |   5 factor     001216 R   |   1 farptr     000013 R
  7 fdrive     010000 R   |   5 fetch      000FF2 R   |   5 fetchc     000C02 R
  1 ffree      000016 R   |   5 file_cou   001D4C R   |   5 final_te   000AAD R
  5 first_li   0013D9 R   |   1 flags      000024 R   |   5 for        0017E8 R
  5 forget     001C80 R   |   1 free_ram   00005A R   |   5 ge         0015E7 R
  5 get_arra   0011E6 R   |   5 get_tick   001EA1 R   |   5 get_toke   000D04 R
  5 getc       0001A7 R   |   5 go_commo   00190D R   |   5 gosub      0018EA R
  5 goto       0018DD R   |   5 gpio       001DEB R   |   5 gt         0015E3 R
  5 gt_tst     000E27 R   |   5 hex_base   001364 R   |   5 hse_cloc   000187 R
  5 hsi_cloc   000191 R   |   5 if         0017D4 R   |   1 in         000001 R
  1 in.w       000000 R   |   1 in.w.sav   000011 R   |   5 incr_far   001A9D R
  5 input_ex   0016FE R   |   5 input_lo   001699 R   |   5 input_va   00168D R
  5 insert_l   00037C R   |   5 insert_l   0003E1 R   |   5 interp     00078A R
  5 interp_l   0007CE R   |   5 invalid    000B5A R   |   5 invalid_   000BD8 R
  5 is_alpha   000504 R   |   5 is_digit   000EBA R   |   5 itoa       0009F9 R
  5 itoa_loo   000A11 R   |   5 key        001DD9 R   |   5 kword_di   002172 R
  5 kword_en   001F75 R   |   5 last_lin   0013E2 R   |   5 le         0015EC R
  5 ledoff     00084D R   |   5 ledon      000848 R   |   5 ledtoggl   000852 R
  5 left_arr   000AB3 R   |   5 left_par   00085B R   |   5 let        001386 R
  5 let02      001390 R   |   1 lineno     000005 R   |   5 lines_sk   0013E7 R
  5 list       0013AE R   |   5 list_exi   00142E R   |   5 list_sta   00140A R
  5 load       001C18 R   |   5 loop_bac   0018B2 R   |   1 loop_dep   00001F R
  5 loop_don   0018CB R   |   5 lt         0015EA R   |   5 lt_tst     000E60 R
  5 mem_peek   000B77 R   |   5 modulo     00111D R   |   5 move       00029E R
  5 move_dow   0002BC R   |   5 move_exi   0002DD R   |   5 move_loo   0002C1 R
  5 move_up    0002AE R   |   5 mul_char   0015D4 R   |   5 multiply   001091 R
  5 mulu24_8   000F41 R   |   5 nbr_tst    000D3D R   |   5 ne         0015EF R
  5 neg_acc2   000A68 R   |   5 new        001A92 R   |   5 next       00186A R
  5 next_tok   0007FE R   |   5 no_match   001183 R   |   5 none       000D04 R
  5 number     000C08 GR  |   5 other      000E98 R   |   3 pad        001718 R
  5 parse_bi   000CA2 R   |   5 parse_in   000C67 R   |   5 parse_ke   000CCA R
  5 parse_qu   000C0F R   |   5 pause      001E8E R   |   5 pause02    001E98 R
  5 peek       0017B7 R   |   5 peek_byt   000BA2 R   |   5 plus_tst   000DF0 R
  5 poke       0017A4 R   |   5 port_cr1   001E3A R   |   5 port_cr2   001E40 R
  5 port_ddr   001E34 R   |   5 port_idr   001E2E R   |   5 port_odr   001E28 R
  5 power_ad   0019D5 R   |   5 prcnt_ts   000E11 R   |   5 print      0015F2 R
  5 print_ex   001657 R   |   5 print_fa   000BE7 R   |   5 print_in   00099D R
  5 print_re   0008AA R   |   5 print_st   000B6A R   |   5 prt_basi   001481 R
  5 prt_cmd_   001431 R   |   5 prt_loop   0015F6 R   |   5 prt_peek   00024E R
  5 prt_quot   001445 R   |   5 prt_reg1   00088B R   |   5 prt_reg8   000866 R
  5 prt_regs   0001E4 R   |   5 prti24     000955 R   |   1 ptr16      000014 R
  1 ptr8       000015 R   |   5 putc       00019E R   |   5 puts       0001B0 R
  5 qkey       001DE1 R   |   5 qmark_ts   000DC7 R   |   5 random     001EC7 R
  5 read_adc   001A10 R   |   5 readln     000A8B R   |   5 readln_l   000A91 R
  5 readln_q   000B06 R   |   5 regs_sta   000227 R   |   5 rel_exit   001351 R
  5 relation   0012FD R   |   5 relop_st   0015D7 R   |   5 rem        001701 R
  5 repl       000B23 R   |   5 repl_exi   000B4B R   |   5 reprint    000AB3 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]

Symbol Table

  5 reset_co   0015F4 R   |   5 rest_con   001678 R   |   5 return     001933 R
  5 right_ar   000AB3 R   |   5 rparnt_t   000D85 R   |   5 rt_msg     000708 R
  5 run        001957 R   |   5 save       001B54 R   |   5 save_con   001663 R
  5 search_d   001160 R   |   5 search_e   0011B1 R   |   5 search_f   001B09 R
  5 search_l   0002E0 R   |   5 search_l   0002EB R   |   5 search_n   001164 R
  1 seedx      00000D R   |   1 seedy      00000F R   |   5 seek_fdr   001AAB R
  5 sharp_ts   000DA6 R   |   5 show       001354 R   |   5 single_c   0015D0 R
  5 size       00136E R   |   5 skip       000F7B R   |   5 slash_ts   000E06 R
  5 sleep      001E83 R   |   5 software   000515 R   |   5 spaces     0001D8 R
  3 stack_fu   001780 R   |   3 stack_un   001800 R   |   5 star_tst   000DFB R
  5 step       001842 R   |   5 stop       00199E R   |   5 store      000FFC R
  5 store_lo   001854 R   |   5 str_matc   001192 R   |   5 str_tst    000D2C R
  5 strcmp     00027F R   |   5 strcpy     000290 R   |   5 strlen     000272 R
  5 substrac   00108B R   |   5 syntax_e   000718 R   |   1 tab_widt   000025 R
  5 tb_error   00071A R   |   5 term       00126C R   |   5 term01     001275 R
  5 term_exi   0012B6 R   |   5 test_p     000B62 R   |   3 tib        0016C8 R
  5 tick_tst   000DDE R   |   1 ticks      00000B R   |   5 timer4_i   0000AF R
  5 to         001812 R   |   5 to_upper   000EC3 GR  |   5 token_ch   000EA7 R
  5 token_ex   000EB7 R   |   1 txtbgn     00001B R   |   1 txtend     00001D R
  5 uart3_in   000174 R   |   5 uart3_se   000180 R   |   5 uart_ena   000199 R
  5 ubound     001378 R   |   5 uflash     001E46 R   |   5 unget_to   000F8E R
  5 unlock_e   0000C0 R   |   5 unlock_f   0000CE R   |   5 user_spa   002180 R
  5 usr        001E52 R   |   1 vars       000026 R   |   5 wait       001707 R
  5 warm_sta   00076A R   |   5 words      001F3B R   |   5 write      001D61 R
  5 write_bl   000151 R   |   5 write_by   0000DC R   |   5 write_ee   000118 R
  5 write_ex   00014C R   |   5 write_fl   000102 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
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

