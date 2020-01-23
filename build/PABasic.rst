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
                                     26 
                                     27 
                                     28 
                                     29     .module TBI_STM8
                                     30 
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
                                        
                                     37     .list 
                                     38 
      000001                         39 _dbg 
                           000001     1     DEBUG=1
                                     40 
                                     41 ;--------------------------------------
                                     42     .area DATA 
                                     43 ;--------------------------------------	
                                     44 
                           000050    45 	TIB_SIZE=80
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                           000028    46     PAD_SIZE=40
                           000040    47 	DSTACK_SIZE=64 
                           000080    48 	STACK_SIZE=128
                           0017FF    49 	STACK_EMPTY=RAM_SIZE-1  
                           000000    50 	FRUN=0 ; flags run code in variable flags
                           000001    51 	FTRAP=1 ; inside trap handler 
                           000002    52 	FFOR=2 ; FOR loop in preparation 
                           000003    53 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    54 	FBREAK=4 ; break point flag 
                           000005    55 	FCOMP=5  ; compiling flags 
                                     56 
      000002                         57 in.w:  .blkb 1 ; parser position in text line
      000003                         58 in:    .blkb 1 ; low byte of in.w
      000004                         59 in.saved: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000005                         60 count: .blkb 1 ; current BASIC line length and tib text length  
      000007                         61 basicptr:  .blkb 2  ; point to current BASIC line 
      000008                         62 base:  .blkb 1 ; nemeric base used to print integer 
      000009                         63 acc24: .blkb 1 ; 24 bit accumulator
      00000A                         64 acc16: .blkb 1 ; 16 bit accumulator, middle byte of acc24
      00000B                         65 acc8:  .blkb 1 ;  8 bit accumulator, least byte of acc24 
      00000D                         66 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      00000F                         67 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000011                         68 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000012                         69 farptr: .blkb 1 ; 24 bits pointer used by file system
      000013                         70 ptr16:  .blkb 1 ; 16 bits pointer ,  middle byte of farptr
      000014                         71 ptr8:   .blkb 1 ; 8 bits pointer, least byte of farptr 
      000017                         72 ffree: .blkb 3 ; flash free address ; file system free space pointer
      000019                         73 dstkptr: .blkw 1  ; data stack pointer 
      00001B                         74 txtbgn: .ds 2 ; tokenized BASIC text beginning address 
      00001D                         75 txtend: .ds 2 ; tokenized BASIC text end address 
      00001E                         76 loop_depth: .ds 1 ; FOR loop depth, level of nested loop. Conformity check   
      000020                         77 array_size: .ds 2 ; array size 
      000021                         78 flags: .ds 1 ; various boolean flags
      000022                         79 tab_width: .ds 1 ; print colon width (4)
      000056                         80 vars: .ds 2*26 ; BASIC variables A-Z, keep it as but last .
                                     81 ; keep as last variable 
      0016C8                         82 free_ram: ; from here RAM free for BASIC text 
                                     83 
                                     84 ;-----------------------------------
                                     85     .area SSEG (ABS)
                                     86 ;-----------------------------------	
      0016C8                         87     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE-DSTACK_SIZE 
      001718                         88 tib: .ds TIB_SIZE             ; transaction input buffer
      001740                         89 pad: .ds PAD_SIZE             ; working buffer
      001780                         90 dstack: .ds DSTACK_SIZE 	  ; data stack used by FOR...NEXT 
      001780                         91 dstack_unf: ; dstack underflow ; data stack bottom 
      001800                         92 stack_full: .ds STACK_SIZE   ; control stack 
      001800                         93 stack_unf: ; stack underflow ; control_stack bottom 
                                     94 
                                     95 
                                     96 ;--------------------------------------
                                     97     .area HOME 
                                     98 ;--------------------------------------
      008000 82 00 85 CC             99     int cold_start
                           000001   100 .if DEBUG
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008004 82 00 80 8A            101 	int TrapHandler 		;TRAP  software interrupt
                           000000   102 .else
                                    103 	int NonHandledInterrupt ;TRAP  software interrupt
                                    104 .endif
      008008 82 00 80 89            105 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 89            106 	int NonHandledInterrupt ;int1 AWU   auto wake up from halt
      008010 82 00 80 89            107 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 89            108 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 89            109 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 89            110 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 89            111 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 A5            112 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 89            113 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 89            114 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 89            115 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 89            116 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 89            117 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 89            118 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 89            119 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 89            120 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 89            121 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 89            122 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 89            123 	int NonHandledInterrupt ;int18 UART1 RX full
      008054 82 00 80 89            124 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 89            125 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 89            126 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 89            127 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 99            128 	int Timer4UpdateHandler	;int23 TIM4 update/overflow used as msec ticks counter
      008068 82 00 80 89            129 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 89            130 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 89            131 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 89            132 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 89            133 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 89            134 	int NonHandledInterrupt ;int29  not used
                                    135 
                                    136 ;---------------------------------------
                                    137     .area CODE
                                    138 ;---------------------------------------
                           000001   139 .if DEBUG
      008080 53 54 4D 38 5F 54 42   140 .asciz "STM8_TBI" ; I like to put module name here.
             49 00
                                    141 .endif 
                                    142 
      008089                        143 NonHandledInterrupt:
      008089 71                     144     .byte 0x71  ; reinitialize MCU
                                    145 
                                    146 
                                    147 ;------------------------------------
                                    148 ; software interrupt handler  
                                    149 ;------------------------------------
                           000001   150 .if DEBUG 
      00808A                        151 TrapHandler:
      00808A 72 12 00 20      [ 1]  152 	bset flags,#FTRAP 
      00808E CD 89 05         [ 4]  153 	call print_registers
      008091 CD 8B 70         [ 4]  154 	call cmd_itf
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      008094 72 13 00 20      [ 1]  155 	bres flags,#FTRAP 	
      008098 80               [11]  156 	iret
                                    157 .endif 
                                    158 
      008099                        159 Timer4UpdateHandler:
      008099 72 5F 53 42      [ 1]  160 	clr TIM4_SR 
      00809D CE 00 0B         [ 2]  161 	ldw x,ticks
      0080A0 5C               [ 1]  162 	incw x
      0080A1 CF 00 0B         [ 2]  163 	ldw ticks,x 
      0080A4 80               [11]  164 	iret 
                                    165 
                                    166 
                                    167 ;------------------------------------
                                    168 ; Triggered by pressing USER UserButton 
                                    169 ; on NUCLEO card.
                                    170 ;------------------------------------
      0080A5                        171 UserButtonHandler:
                                    172 ; wait button release
      0080A5 5F               [ 1]  173 	clrw x
      0080A6 5A               [ 2]  174 1$: decw x 
      0080A7 26 FD            [ 1]  175 	jrne 1$
      0080A9 72 09 50 15 F8   [ 2]  176 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    177 ; if MCU suspended by SLEEP resume program
      0080AE 72 07 00 20 05   [ 2]  178     btjf flags,#FSLEEP,2$
      0080B3 72 17 00 20      [ 1]  179 	bres flags,#FSLEEP 
      0080B7 80               [11]  180 	iret
      0080B8 72 00 00 20 03   [ 2]  181 2$:	btjt flags,#FRUN,4$
      0080BD CC 80 F6         [ 2]  182 	jp 9$ 
      0080C0                        183 4$:	; program interrupted by user 
      0080C0 72 11 00 20      [ 1]  184 	bres flags,#FRUN 
      0080C4 AE 80 FE         [ 2]  185 	ldw x,#USER_ABORT
      0080C7 CD 82 30         [ 4]  186 	call puts 
      0080CA CE 00 05         [ 2]  187 	ldw x,basicptr
      0080CD FE               [ 2]  188 	ldw x,(x)
                                    189 ; print line number 
      0080CE 35 0A 00 07      [ 1]  190 	mov base,#10 
      0080D2 35 06 00 21      [ 1]  191 	mov tab_width,#6
      0080D6 CD 89 F8         [ 4]  192 	call print_int  	
      0080D9 CE 00 05         [ 2]  193 	ldw x,basicptr 
      0080DC 1C 00 03         [ 2]  194 	addw x,#3  
      0080DF CD 82 30         [ 4]  195 	call puts 
      0080E2 A6 0D            [ 1]  196 	ld a,#CR 
      0080E4 CD 82 1E         [ 4]  197 	call putc
      0080E7 5F               [ 1]  198 	clrw x  
      0080E8 C6 00 02         [ 1]  199 	ld a,in 
      0080EB AB 03            [ 1]  200 	add a,#3 ; adjustment for line number display 
      0080ED 97               [ 1]  201 	ld xl,a 
      0080EE CD 82 58         [ 4]  202 	call spaces 
      0080F1 A6 5E            [ 1]  203 	ld a,#'^
      0080F3 CD 82 1E         [ 4]  204 	call putc 
      0080F6                        205 9$:
      0080F6 AE 17 FF         [ 2]  206     ldw x,#STACK_EMPTY 
      0080F9 94               [ 1]  207     ldw sp,x
      0080FA 9A               [ 1]  208 	rim 
      0080FB CC 87 D3         [ 2]  209 	jp warm_start
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    210 
      0080FE 0A 50 72 6F 67 72 61   211 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    212 
                                    213 
                                    214 ;----------------------------------------
                                    215 ; inialize MCU clock 
                                    216 ; input:
                                    217 ;   A 		source  HSI | 1 HSE 
                                    218 ;   XL      CLK_CKDIVR , clock divisor 
                                    219 ; output:
                                    220 ;   none 
                                    221 ;----------------------------------------
      008119                        222 clock_init:	
      008119 C1 50 C3         [ 1]  223 	cp a,CLK_CMSR 
      00811C 27 0C            [ 1]  224 	jreq 2$ ; no switching required 
                                    225 ; select clock source 
      00811E 72 12 50 C5      [ 1]  226 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008122 C7 50 C4         [ 1]  227 	ld CLK_SWR,a
      008125 C1 50 C3         [ 1]  228 1$:	cp a,CLK_CMSR
      008128 26 FB            [ 1]  229 	jrne 1$
      00812A                        230 2$: 	
                                    231 ; HSI and cpu clock divisor 
      00812A 9F               [ 1]  232 	ld a,xl 
      00812B C7 50 C6         [ 1]  233 	ld CLK_CKDIVR,a  
      00812E 81               [ 4]  234 	ret
                                    235 
                                    236 ;---------------------------------
                                    237 ; TIM4 is configured to generate an 
                                    238 ; interrupt every millisecond 
                                    239 ;----------------------------------
      00812F                        240 timer4_init:
      00812F 35 07 53 45      [ 1]  241 	mov TIM4_PSCR,#7 ; prescale 128  
      008133 35 7D 53 46      [ 1]  242 	mov TIM4_ARR,#125 ; set for 1msec.
      008137 35 05 53 40      [ 1]  243 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00813B 72 10 53 41      [ 1]  244 	bset TIM4_IER,#TIM4_IER_UIE 
      00813F 81               [ 4]  245 	ret
                                    246 
                                    247 ;----------------------------------
                                    248 ; unlock EEPROM for writing/erasing
                                    249 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    250 ; input:
                                    251 ;  none
                                    252 ; output:
                                    253 ;  none 
                                    254 ;----------------------------------
      008140                        255 unlock_eeprom:
      008140 35 AE 50 64      [ 1]  256 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008144 35 56 50 64      [ 1]  257     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008148 72 07 50 5F FB   [ 2]  258 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00814D 81               [ 4]  259 	ret
                                    260 
                                    261 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    262 ; unlock FLASH for writing/erasing
                                    263 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    264 ; input:
                                    265 ;  none
                                    266 ; output:
                                    267 ;  none
                                    268 ;----------------------------------
      00814E                        269 unlock_flash:
      00814E 35 56 50 62      [ 1]  270 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008152 35 AE 50 62      [ 1]  271 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008156 72 03 50 5F FB   [ 2]  272 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00815B 81               [ 4]  273 	ret
                                    274 
                           000000   275 	BLOCK_ERASE=0
                                    276 ;----------------------------
                                    277 ; erase block code must be 
                                    278 ;executed from RAM
                                    279 ;-----------------------------
                           000000   280 .if BLOCK_ERASE 
                                    281 ; this code is copied to RAM 
                                    282 erase_start:
                                    283 	clr a 
                                    284     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    285     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    286 	ldf [farptr],a
                                    287     inc farptr+2 
                                    288     ldf [farptr],a
                                    289     inc farptr+2 
                                    290     ldf [farptr],a
                                    291     inc farptr+2 
                                    292     ldf [farptr],a
                                    293 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    294 	ret
                                    295 erase_end:
                                    296 
                                    297 ; copy erase_start in RAM 
                                    298 move_code_in_ram:
                                    299 	ldw x,#erase_end 
                                    300 	subw x,#erase_start
                                    301 	ldw acc16,x 
                                    302 	ldw x,#pad 
                                    303 	ldw y,#erase_start 
                                    304 	call move 
                                    305 	ret 
                                    306 
                                    307 ;-----------------------------------
                                    308 ; erase flash or EEPROM block 
                                    309 ; a block is 128 bytes 
                                    310 ; input:
                                    311 ;   farptr  address block begin
                                    312 ; output:
                                    313 ;   none
                                    314 ;--------------------------------------
                                    315 erase_block:
                                    316 	ldw x,farptr+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    317 	pushw x 
                                    318 	call move_code_in_ram 
                                    319 	popw x 
                                    320 	ldw farptr+1,x 
                                    321 	tnz farptr
                                    322 	jrne erase_flash 
                                    323 	ldw x,#FLASH_BASE 
                                    324 	cpw x,farptr+1 
                                    325 	jrpl erase_flash 
                                    326 ; erase eeprom block
                                    327 	call unlock_eeprom 
                                    328 	sim 
                                    329 	call pad   
                                    330 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    331 	rim 
                                    332 	ret 
                                    333 ; erase flash block:
                                    334 erase_flash:
                                    335 	call unlock_flash 
                                    336 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    337 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    338 	clr a 
                                    339 	sim 
                                    340 	call pad 
                                    341     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    342 	rim 
                                    343 	ret 
                                    344 .endif ; BLOCK_ERASE 
                                    345 
                                    346 
                                    347 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    348 ; write a byte to FLASH or EEPROM 
                                    349 ; input:
                                    350 ;    a  		byte to write
                                    351 ;    farptr  	address
                                    352 ;    x          farptr[x]
                                    353 ; output:
                                    354 ;    none
                                    355 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    356 	; variables locales
                           000001   357 	BTW = 1   ; byte to write offset on stack
                           000002   358 	OPT = 2   ; OPTION flag offset on stack
                           000002   359 	VSIZE = 2
      00815C                        360 write_byte:
      00815C 90 89            [ 2]  361 	pushw y
      0000DE                        362 	_vars VSIZE
      00815E 52 02            [ 2]    1     sub sp,#VSIZE 
      008160 6B 01            [ 1]  363 	ld (BTW,sp),a ; byte to write 
      008162 0F 02            [ 1]  364 	clr (OPT,sp)  ; OPTION flag
                                    365 ; put addr[15:0] in Y, for bounds check.
      008164 90 CE 00 12      [ 2]  366 	ldw y,farptr+1   ; Y=addr15:0
                                    367 ; check addr[23:16], if <> 0 then it is extened flash memory
      008168 72 5D 00 11      [ 1]  368 	tnz farptr 
      00816C 26 14            [ 1]  369 	jrne write_flash
      00816E 90 A3 A2 00      [ 2]  370     cpw y,#user_space
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008172 24 0E            [ 1]  371     jruge write_flash
      008174 90 A3 40 00      [ 2]  372 	cpw y,#EEPROM_BASE  
      008178 25 52            [ 1]  373     jrult write_exit
      00817A 90 A3 48 00      [ 2]  374 	cpw y,#OPTION_BASE
      00817E 25 18            [ 1]  375 	jrult write_eeprom
      008180 20 4A            [ 2]  376     jra write_exit
                                    377 ; write program memory
      008182                        378 write_flash:
      008182 CD 81 4E         [ 4]  379 	call unlock_flash 
      008185 9B               [ 1]  380 1$:	sim 
      008186 7B 01            [ 1]  381 	ld a,(BTW,sp)
      008188 92 A7 00 11      [ 4]  382 	ldf ([farptr],x),a ; farptr[x]=A
      00818C 72 05 50 5F FB   [ 2]  383 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008191 9A               [ 1]  384     rim 
      008192 72 13 50 5F      [ 1]  385     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008196 20 34            [ 2]  386     jra write_exit
                                    387 ; write eeprom and option
      008198                        388 write_eeprom:
      008198 CD 81 40         [ 4]  389 	call unlock_eeprom
                                    390 	; check for data eeprom or option eeprom
      00819B 90 A3 48 00      [ 2]  391 	cpw y,#OPTION_BASE
      00819F 2B 08            [ 1]  392 	jrmi 1$
      0081A1 90 A3 48 80      [ 2]  393 	cpw y,#OPTION_END+1
      0081A5 2A 02            [ 1]  394 	jrpl 1$
      0081A7 03 02            [ 1]  395 	cpl (OPT,sp)
      0081A9                        396 1$: 
      0081A9 0D 02            [ 1]  397     tnz (OPT,sp)
      0081AB 27 08            [ 1]  398     jreq 2$
                                    399 	; pour modifier une option il faut modifier ces 2 bits
      0081AD 72 1E 50 5B      [ 1]  400     bset FLASH_CR2,#FLASH_CR2_OPT
      0081B1 72 1F 50 5C      [ 1]  401     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081B5                        402 2$: 
      0081B5 7B 01            [ 1]  403     ld a,(BTW,sp)
      0081B7 92 A7 00 11      [ 4]  404     ldf ([farptr],x),a
      0081BB 0D 02            [ 1]  405     tnz (OPT,sp)
      0081BD 27 08            [ 1]  406     jreq 3$
      0081BF 5C               [ 1]  407     incw x
      0081C0 7B 01            [ 1]  408     ld a,(BTW,sp)
      0081C2 43               [ 1]  409     cpl a
      0081C3 92 A7 00 11      [ 4]  410     ldf ([farptr],x),a
      0081C7 72 05 50 5F FB   [ 2]  411 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081CC                        412 write_exit:
      00014C                        413 	_drop VSIZE 
      0081CC 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081CE 90 85            [ 2]  414 	popw y
      0081D0 81               [ 4]  415     ret
                                    416 
                                    417 ;--------------------------------------------
                                    418 ; write a data block to eeprom or flash 
                                    419 ; input:
                                    420 ;   Y        source address   
                                    421 ;   X        array index  destination  farptr[x]
                                    422 ;   BSIZE    block size bytes 
                                    423 ;   farptr   write address , byte* 
                                    424 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    425 ;	X 		after last byte written 
                                    426 ;   Y 		after last byte read 
                                    427 ;  farptr   point after block
                                    428 ;---------------------------------------------
      0081D1                        429 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000151                        430 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    431 	; local var 
                           000001   432 	XSAVE=1 
                           000002   433 	VSIZE=2 
      000151                        434 write_block:
      000151                        435 	_vars VSIZE
      0081D1 52 02            [ 2]    1     sub sp,#VSIZE 
      0081D3 1F 01            [ 2]  436 	ldw (XSAVE,sp),x 
      0081D5 1E 05            [ 2]  437 	ldw x,(BSIZE,sp) 
      0081D7 27 13            [ 1]  438 	jreq 9$
      0081D9 1E 01            [ 2]  439 1$:	ldw x,(XSAVE,sp)
      0081DB 90 F6            [ 1]  440 	ld a,(y)
      0081DD CD 81 5C         [ 4]  441 	call write_byte 
      0081E0 5C               [ 1]  442 	incw x 
      0081E1 90 5C            [ 1]  443 	incw y 
      0081E3 1F 01            [ 2]  444 	ldw (XSAVE,sp),x
      0081E5 1E 05            [ 2]  445 	ldw x,(BSIZE,sp)
      0081E7 5A               [ 2]  446 	decw x
      0081E8 1F 05            [ 2]  447 	ldw (BSIZE,sp),x 
      0081EA 26 ED            [ 1]  448 	jrne 1$
      0081EC                        449 9$:
      0081EC 1E 01            [ 2]  450 	ldw x,(XSAVE,sp)
      0081EE CD 9A FE         [ 4]  451 	call incr_farptr
      000171                        452 	_drop VSIZE
      0081F1 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081F3 81               [ 4]  453 	ret 
                                    454 
                                    455 
                                    456 ;---------------------------------------------
                                    457 ;   UART3 subroutines
                                    458 ;---------------------------------------------
                                    459 
                                    460 ;---------------------------------------------
                                    461 ; initialize UART3, 115200 8N1
                                    462 ; input:
                                    463 ;	none
                                    464 ; output:
                                    465 ;   none
                                    466 ;---------------------------------------------
      0081F4                        467 uart3_init:
                                    468 	; configure tx pin
      0081F4 72 1A 50 11      [ 1]  469 	bset PD_DDR,#BIT5 ; tx pin
      0081F8 72 1A 50 12      [ 1]  470 	bset PD_CR1,#BIT5 ; push-pull output
      0081FC 72 1A 50 13      [ 1]  471 	bset PD_CR2,#BIT5 ; fast output
      008200                        472 uart3_set_baud: 
                                    473 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    474 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008200 A6 E1            [ 1]  475 	ld a,#CLK_SWR_HSI
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      008202 C1 50 C3         [ 1]  476 	cp a,CLK_CMSR 
      008205 27 0A            [ 1]  477 	jreq hsi_clock 
      008207                        478 hse_clock: ; 8 Mhz 	
      008207 35 05 52 43      [ 1]  479 	mov UART3_BRR2,#0x05 ; must be loaded first
      00820B 35 04 52 42      [ 1]  480 	mov UART3_BRR1,#0x4
      00820F 20 08            [ 2]  481 	jra uart_enable
      008211                        482 hsi_clock: ; 16 Mhz 	
      008211 35 0B 52 43      [ 1]  483 	mov UART3_BRR2,#0x0b ; must be loaded first
      008215 35 08 52 42      [ 1]  484 	mov UART3_BRR1,#0x08
      008219                        485 uart_enable:	
      008219 35 0C 52 45      [ 1]  486 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
      00821D 81               [ 4]  487 	ret
                                    488 	
                                    489 ;---------------------------------
                                    490 ; send character to UART3 
                                    491 ; input:
                                    492 ;   A 
                                    493 ; output:
                                    494 ;   none 
                                    495 ;--------------------------------	
      00821E                        496 putc:
      00821E 72 0F 52 40 FB   [ 2]  497 	btjf UART3_SR,#UART_SR_TXE,.
      008223 C7 52 41         [ 1]  498 	ld UART3_DR,a 
      008226 81               [ 4]  499 	ret 
                                    500 
                                    501 ;---------------------------------
                                    502 ; wait character from UART3 
                                    503 ; input:
                                    504 ;   none
                                    505 ; output:
                                    506 ;   A 			char  
                                    507 ;--------------------------------	
      008227                        508 getc:
      008227 72 0B 52 40 FB   [ 2]  509 	btjf UART3_SR,#UART_SR_RXNE,.
      00822C C6 52 41         [ 1]  510 	ld a,UART3_DR 
      00822F 81               [ 4]  511 	ret 
                                    512 
                                    513 ;-----------------------------
                                    514 ; send an ASCIZ string to UART3 
                                    515 ; input: 
                                    516 ;   x 		char * 
                                    517 ; output:
                                    518 ;   none 
                                    519 ;-------------------------------
      008230                        520 puts:
      008230 F6               [ 1]  521     ld a,(x)
      008231 27 06            [ 1]  522 	jreq 1$
      008233 CD 82 1E         [ 4]  523 	call putc 
      008236 5C               [ 1]  524 	incw x 
      008237 20 F7            [ 2]  525 	jra puts 
      008239 81               [ 4]  526 1$:	ret 
                                    527 
                                    528 
                                    529 ;---------------------------
                                    530 ; delete character at left 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    531 ; of cursor on terminal 
                                    532 ; input:
                                    533 ;   none 
                                    534 ; output:
                                    535 ;	none 
                                    536 ;---------------------------
      00823A                        537 bksp:
      00823A A6 08            [ 1]  538 	ld a,#BSP 
      00823C CD 82 1E         [ 4]  539 	call putc 
      00823F A6 20            [ 1]  540 	ld a,#SPACE 
      008241 CD 82 1E         [ 4]  541 	call putc 
      008244 A6 08            [ 1]  542 	ld a,#BSP 
      008246 CD 82 1E         [ 4]  543 	call putc 
      008249 81               [ 4]  544 	ret 
                                    545 ;---------------------------
                                    546 ; delete n character left of cursor 
                                    547 ; at terminal.
                                    548 ; input: 
                                    549 ;   A   	number of characters to delete.
                                    550 ; output:
                                    551 ;    none 
                                    552 ;--------------------------	
      00824A                        553 delete:
      00824A 88               [ 1]  554 	push a 
      00824B 0D 01            [ 1]  555 0$:	tnz (1,sp)
      00824D 27 07            [ 1]  556 	jreq 1$
      00824F CD 82 3A         [ 4]  557 	call bksp 
      008252 0A 01            [ 1]  558 	dec (1,sp)
      008254 20 F5            [ 2]  559 	jra 0$
      008256 84               [ 1]  560 1$:	pop a 
      008257 81               [ 4]  561 	ret
                                    562 
                                    563 ;--------------------------
                                    564 ; print n spaces on terminal
                                    565 ; input:
                                    566 ;  X 		number of spaces 
                                    567 ; output:
                                    568 ;	none 
                                    569 ;---------------------------
      008258                        570 spaces:
      008258 A6 20            [ 1]  571 	ld a,#SPACE 
      00825A 5D               [ 2]  572 1$:	tnzw x
      00825B 27 06            [ 1]  573 	jreq 9$
      00825D CD 82 1E         [ 4]  574 	call putc 
      008260 5A               [ 2]  575 	decw x
      008261 20 F7            [ 2]  576 	jra 1$
      008263                        577 9$: 
      008263 81               [ 4]  578 	ret 
                                    579 
                           000001   580 .if DEBUG 
                                    581 ;---------------------------------
                                    582 ;; print actual registers states 
                                    583 ;; as pushed on stack 
                                    584 ;; {Y,X,CC,A}
                                    585 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008264                        586 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0001E4                        587 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0001E4                        588 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0001E4                        589 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0001E4                        590 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0001E4                        591 prt_regs:
      008264 AE 82 A7         [ 2]  592 	ldw x,#regs_state 
      008267 CD 82 30         [ 4]  593 	call puts
                                    594 ; register PC
      00826A 16 01            [ 2]  595 	ldw y,(1,sp)
      00826C AE 89 95         [ 2]  596 	ldw x,#REG_EPC 
      00826F CD 88 E6         [ 4]  597 	call prt_reg16 
                                    598 ; register CC 
      008272 7B 08            [ 1]  599 	ld a,(R_CC,sp)
      008274 AE 89 A6         [ 2]  600 	ldw x,#REG_CC 
      008277 CD 88 C1         [ 4]  601 	call prt_reg8 
                                    602 ; register A 
      00827A 7B 07            [ 1]  603 	ld a,(R_A,sp)
      00827C AE 89 A2         [ 2]  604 	ldw x,#REG_A 
      00827F CD 88 C1         [ 4]  605 	call prt_reg8 
                                    606 ; register X 
      008282 16 05            [ 2]  607 	ldw y,(R_X,sp)
      008284 AE 89 9E         [ 2]  608 	ldw x,#REG_X 
      008287 CD 88 E6         [ 4]  609 	call prt_reg16 
                                    610 ; register Y 
      00828A 16 03            [ 2]  611 	ldw y,(R_Y,sp)
      00828C AE 89 9A         [ 2]  612 	ldw x,#REG_Y 
      00828F CD 88 E6         [ 4]  613 	call prt_reg16 
                                    614 ; register SP 
      008292 90 96            [ 1]  615 	ldw y,sp
      008294 72 A9 00 08      [ 2]  616 	addw y,#6+ARG_OFS  
      008298 AE 89 AB         [ 2]  617 	ldw x,#REG_SP
      00829B CD 88 E6         [ 4]  618 	call prt_reg16
      00829E A6 0D            [ 1]  619 	ld a,#CR 
      0082A0 CD 82 1E         [ 4]  620 	call putc
      0082A3 CD 82 1E         [ 4]  621 	call putc   
      0082A6 81               [ 4]  622 	ret 
                                    623 
      0082A7 0A 72 65 67 69 73 74   624 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    625 
                                    626 
                                    627 ;--------------------
                                    628 ; print content at address in hex.
                                    629 ; input:
                                    630 ;   X 	address to peek 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    631 ; output:
                                    632 ;	none 
                                    633 ;--------------------	
      0082CE                        634 prt_peek:
      0082CE 89               [ 2]  635 	pushw x 
      0082CF CF 00 09         [ 2]  636 	ldw acc16,x 
      0082D2 72 5F 00 08      [ 1]  637 	clr acc24 
      0082D6 5F               [ 1]  638 	clrw x 
      0082D7 A6 10            [ 1]  639 	ld a,#16 
      0082D9 CD 89 B0         [ 4]  640 	call prti24 
      0082DC A6 3A            [ 1]  641 	ld a,#': 
      0082DE CD 82 1E         [ 4]  642 	call putc 
      0082E1 A6 20            [ 1]  643 	ld a,#SPACE 
      0082E3 CD 82 1E         [ 4]  644 	call putc 
      0082E6 85               [ 2]  645 	popw x 
      0082E7 F6               [ 1]  646 	ld a,(x)
      0082E8 C7 00 0A         [ 1]  647 	ld acc8,a 
      0082EB 5F               [ 1]  648 	clrw x 
      0082EC A6 10            [ 1]  649 	ld a,#16 
      0082EE CD 89 B0         [ 4]  650 	call prti24
      0082F1 81               [ 4]  651 	ret 
                                    652 .endif ; DEBUG  
                                    653 
                                    654 ;-------------------------------------
                                    655 ; retrun string length
                                    656 ; input:
                                    657 ;   X         .asciz  
                                    658 ; output:
                                    659 ;   X         length 
                                    660 ;-------------------------------------
      0082F2                        661 strlen:
      0082F2 90 93            [ 1]  662 	ldw y,x 
      0082F4 5F               [ 1]  663 	clrw x 
      0082F5 90 7D            [ 1]  664 1$:	tnz (y) 
      0082F7 27 05            [ 1]  665 	jreq 9$ 
      0082F9 5C               [ 1]  666 	incw x
      0082FA 90 5C            [ 1]  667 	incw y 
      0082FC 20 F7            [ 2]  668 	jra 1$ 
      0082FE 81               [ 4]  669 9$: ret 
                                    670 
                                    671 ;------------------------------------
                                    672 ; compare 2 strings
                                    673 ; input:
                                    674 ;   X 		char* first string 
                                    675 ;   Y       char* second string 
                                    676 ; output:
                                    677 ;   A 		0|1 
                                    678 ;-------------------------------------
      0082FF                        679 strcmp:
      0082FF F6               [ 1]  680 	ld a,(x)
      008300 27 0B            [ 1]  681 	jreq 5$ 
      008302 90 F1            [ 1]  682 	cp a,(y) 
      008304 26 05            [ 1]  683 	jrne 4$ 
      008306 5C               [ 1]  684 	incw x 
      008307 90 5C            [ 1]  685 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008309 20 F4            [ 2]  686 	jra strcmp 
      00830B                        687 4$: ; not same  
      00830B 4F               [ 1]  688 	clr a 
      00830C 81               [ 4]  689 	ret 
      00830D                        690 5$: ; same 
      00830D A6 01            [ 1]  691 	ld a,#1 
      00830F 81               [ 4]  692 	ret 
                                    693 
                                    694 
                                    695 ;---------------------------------------
                                    696 ;  copy src to dest 
                                    697 ; input:
                                    698 ;   X 		dest 
                                    699 ;   Y 		src 
                                    700 ; output: 
                                    701 ;   X 		dest 
                                    702 ;----------------------------------
      008310                        703 strcpy:
      008310 89               [ 2]  704 	pushw x 
      008311 90 F6            [ 1]  705 1$: ld a,(y)
      008313 27 06            [ 1]  706 	jreq 9$ 
      008315 F7               [ 1]  707 	ld (x),a 
      008316 5C               [ 1]  708 	incw x 
      008317 90 5C            [ 1]  709 	incw y 
      008319 20 F6            [ 2]  710 	jra 1$ 
      00831B 7F               [ 1]  711 9$:	clr (x)
      00831C 85               [ 2]  712 	popw x 
      00831D 81               [ 4]  713 	ret 
                                    714 
                                    715 ;---------------------------------------
                                    716 ; move memory block 
                                    717 ; input:
                                    718 ;   X 		destination 
                                    719 ;   Y 	    source 
                                    720 ;   acc16	size 
                                    721 ; output:
                                    722 ;   none 
                                    723 ;--------------------------------------
                           000001   724 	INCR=1 ; increament high byte 
                           000002   725 	LB=2 ; increament low byte 
                           000002   726 	VSIZE=2
      00831E                        727 move:
      00029E                        728 	_vars VSIZE 
      00831E 52 02            [ 2]    1     sub sp,#VSIZE 
      008320 0F 01            [ 1]  729 	clr (INCR,sp)
      008322 0F 02            [ 1]  730 	clr (LB,sp)
      008324 90 89            [ 2]  731 	pushw y 
      008326 13 01            [ 2]  732 	cpw x,(1,sp) ; compare DEST to SRC 
      008328 90 85            [ 2]  733 	popw y 
      00832A 27 31            [ 1]  734 	jreq move_exit ; x==y 
      00832C 2B 0E            [ 1]  735 	jrmi move_down
      00832E                        736 move_up: ; start from top address with incr=-1
      00832E 72 BB 00 09      [ 2]  737 	addw x,acc16
      008332 72 B9 00 09      [ 2]  738 	addw y,acc16
      008336 03 01            [ 1]  739 	cpl (INCR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008338 03 02            [ 1]  740 	cpl (LB,sp)   ; increment = -1 
      00833A 20 05            [ 2]  741 	jra move_loop  
      00833C                        742 move_down: ; start from bottom address with incr=1 
      00833C 5A               [ 2]  743     decw x 
      00833D 90 5A            [ 2]  744 	decw y
      00833F 0C 02            [ 1]  745 	inc (LB,sp) ; incr=1 
      008341                        746 move_loop:	
      008341 C6 00 09         [ 1]  747     ld a, acc16 
      008344 CA 00 0A         [ 1]  748 	or a, acc8
      008347 27 14            [ 1]  749 	jreq move_exit 
      008349 72 FB 01         [ 2]  750 	addw x,(INCR,sp)
      00834C 72 F9 01         [ 2]  751 	addw y,(INCR,sp) 
      00834F 90 F6            [ 1]  752 	ld a,(y)
      008351 F7               [ 1]  753 	ld (x),a 
      008352 89               [ 2]  754 	pushw x 
      008353 CE 00 09         [ 2]  755 	ldw x,acc16 
      008356 5A               [ 2]  756 	decw x 
      008357 CF 00 09         [ 2]  757 	ldw acc16,x 
      00835A 85               [ 2]  758 	popw x 
      00835B 20 E4            [ 2]  759 	jra move_loop
      00835D                        760 move_exit:
      0002DD                        761 	_drop VSIZE
      00835D 5B 02            [ 2]    1     addw sp,#VSIZE 
      00835F 81               [ 4]  762 	ret 	
                                    763 
                                    764 ;-------------------------------------
                                    765 ; search text area for a line with 
                                    766 ; same number as line#  
                                    767 ; input:
                                    768 ;	X 			line# 
                                    769 ; output:
                                    770 ;   X 			addr of line | 0 
                                    771 ;   Y           line#|insert address if not found  
                                    772 ;-------------------------------------
                           000001   773 	LL=1 ; line length 
                           000002   774 	LB=2 ; line length low byte 
                           000002   775 	VSIZE=2 
      008360                        776 search_lineno:
      0002E0                        777 	_vars VSIZE
      008360 52 02            [ 2]    1     sub sp,#VSIZE 
      008362 0F 01            [ 1]  778 	clr (LL,sp)
      008364 90 CE 00 19      [ 2]  779 	ldw y,txtbgn
      008368                        780 search_ln_loop:
      008368 90 C3 00 1B      [ 2]  781 	cpw y,txtend 
      00836C 2A 10            [ 1]  782 	jrpl 8$
      00836E 90 F3            [ 1]  783 	cpw x,(y)
      008370 27 0E            [ 1]  784 	jreq 9$
      008372 2B 0A            [ 1]  785 	jrmi 8$ 
      008374 90 E6 02         [ 1]  786 	ld a,(2,y)
      008377 6B 02            [ 1]  787 	ld (LB,sp),a 
      008379 72 F9 01         [ 2]  788 	addw y,(LL,sp)
      00837C 20 EA            [ 2]  789 	jra search_ln_loop 
      00837E                        790 8$: 
      00837E 5F               [ 1]  791 	clrw x 	
      00837F 51               [ 1]  792 	exgw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      000300                        793 9$: _drop VSIZE
      008380 5B 02            [ 2]    1     addw sp,#VSIZE 
      008382 51               [ 1]  794 	exgw x,y   
      008383 81               [ 4]  795 	ret 
                                    796 
                                    797 ;-------------------------------------
                                    798 ; delete line at addr
                                    799 ; move new line to insert with end of text 
                                    800 ; otherwise it would be overwritten.
                                    801 ; input:
                                    802 ;   X 		addr of line i.e DEST for move 
                                    803 ;-------------------------------------
                           000001   804 	LLEN=1
                           000003   805 	SRC=3
                           000004   806 	VSIZE=4
      008384                        807 del_line: 
      000304                        808 	_vars VSIZE 
      008384 52 04            [ 2]    1     sub sp,#VSIZE 
      008386 E6 02            [ 1]  809 	ld a,(2,x) ; line length
      008388 6B 02            [ 1]  810 	ld (LLEN+1,sp),a 
      00838A 0F 01            [ 1]  811 	clr (LLEN,sp)
      00838C 90 93            [ 1]  812 	ldw y,x  
      00838E 72 F9 01         [ 2]  813 	addw y,(LLEN,sp) ;SRC  
      008391 17 03            [ 2]  814 	ldw (SRC,sp),y  ;save source 
      008393 90 CE 00 1B      [ 2]  815 	ldw y,txtend 
      008397 90 E6 02         [ 1]  816 	ld a,(2,y)
      00839A 90 5F            [ 1]  817 	clrw y 
      00839C 90 97            [ 1]  818 	ld yl,a  
      00839E 72 B9 00 1B      [ 2]  819 	addw y,txtend
      0083A2 72 F2 03         [ 2]  820 	subw y,(SRC,sp) ; y=count 
      0083A5 90 CF 00 09      [ 2]  821 	ldw acc16,y 
      0083A9 16 03            [ 2]  822 	ldw y,(SRC,sp)    ; source
      0083AB CD 83 1E         [ 4]  823 	call move
      0083AE 90 CE 00 1B      [ 2]  824 	ldw y,txtend 
      0083B2 72 F2 01         [ 2]  825 	subw y,(LLEN,sp)
      0083B5 90 CF 00 1B      [ 2]  826 	ldw txtend,y  
      000339                        827 	_drop VSIZE     
      0083B9 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083BB 81               [ 4]  828 	ret 
                                    829 
                                    830 ;---------------------------------------------
                                    831 ; create a gap in text area 
                                    832 ; move new line to insert in gap with end of text
                                    833 ; otherwise it would be overwritten.
                                    834 ; input:
                                    835 ;    X 			addr gap start 
                                    836 ;    Y 			gap length 
                                    837 ; output:
                                    838 ;    X 			addr gap start 
                                    839 ;--------------------------------------------
                           000001   840 	DEST=1
                           000003   841 	SRC=3
                           000005   842 	LEN=5
                           000006   843 	VSIZE=6 
      0083BC                        844 create_gap:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      00033C                        845 	_vars VSIZE
      0083BC 52 06            [ 2]    1     sub sp,#VSIZE 
      0083BE 1F 03            [ 2]  846 	ldw (SRC,sp),x 
      0083C0 17 05            [ 2]  847 	ldw (LEN,sp),y 
      0083C2 90 CF 00 09      [ 2]  848 	ldw acc16,y 
      0083C6 90 93            [ 1]  849 	ldw y,x ; SRC
      0083C8 72 BB 00 09      [ 2]  850 	addw x,acc16  
      0083CC 1F 01            [ 2]  851 	ldw (DEST,sp),x 
                                    852 ;compute size to move 	
      0083CE CE 00 1B         [ 2]  853 	ldw x,txtend 
      0083D1 E6 02            [ 1]  854 	ld a,(2,x) ; pending line length 
      0083D3 C7 00 0A         [ 1]  855 	ld acc8,a 
      0083D6 72 5F 00 09      [ 1]  856 	clr acc16 
      0083DA 72 BB 00 09      [ 2]  857 	addw x,acc16 
      0083DE 72 F0 03         [ 2]  858 	subw x,(SRC,sp)
      0083E1 CF 00 09         [ 2]  859 	ldw acc16,x ; size to move
      0083E4 1E 01            [ 2]  860 	ldw x,(DEST,sp) 
      0083E6 CD 83 1E         [ 4]  861 	call move
      0083E9 CE 00 1B         [ 2]  862 	ldw x,txtend
      0083EC 72 FB 05         [ 2]  863 	addw x,(LEN,sp)
      0083EF CF 00 1B         [ 2]  864 	ldw txtend,x
      000372                        865 9$:	_drop VSIZE 
      0083F2 5B 06            [ 2]    1     addw sp,#VSIZE 
      0083F4 81               [ 4]  866 	ret 
                                    867 
                                    868 
                                    869 ;--------------------------------------------
                                    870 ; insert line in tib into text area 
                                    871 ; first search for already existing 
                                    872 ; replace existing 
                                    873 ; if strlen(tib)==0 delete existing 
                                    874 ; input:
                                    875 ;   ptr16 				pointer to tokenized line  
                                    876 ; output:
                                    877 ;   none
                                    878 ;---------------------------------------------
                           000001   879 	DEST=1  ; text area insertion address 
                           000003   880 	SRC=3   ; str to insert address 
                           000005   881 	LINENO=5 ; line number 
                           000007   882 	LLEN=7 ; line length 
                           000008   883 	VSIZE=8  
      0083F5                        884 insert_line:
      000375                        885 	_vars VSIZE 
      0083F5 52 08            [ 2]    1     sub sp,#VSIZE 
      0083F7 CE 00 12         [ 2]  886 	ldw x,ptr16  
      0083FA C3 00 19         [ 2]  887 	cpw x,txtbgn 
      0083FD 26 0D            [ 1]  888 	jrne 0$
                                    889 ;first text line 
      0083FF AE 00 02         [ 2]  890 	ldw x,#2 
      008402 72 D6 00 12      [ 4]  891 	ld a,([ptr16],x)
      008406 5F               [ 1]  892 	clrw x 
      008407 97               [ 1]  893 	ld xl,a
      008408 1F 07            [ 2]  894 	ldw (LLEN,sp),x  
      00840A 20 45            [ 2]  895 	jra 5$
      00840C 72 CE 00 12      [ 5]  896 0$:	ldw x,[ptr16]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    897 ; new line number
      008410 1F 05            [ 2]  898 	ldw (LINENO,sp),x 
      008412 AE 00 02         [ 2]  899 	ldw x,#2 
      008415 72 D6 00 12      [ 4]  900 	ld a,([ptr16],x)
      008419 97               [ 1]  901 	ld xl,a
                                    902 ; new line length
      00841A 1F 07            [ 2]  903 	ldw (LLEN,sp),x
                                    904 ; check if that line number already exit 	
      00841C 1E 05            [ 2]  905 	ldw x,(LINENO,sp)
      00841E CD 83 60         [ 4]  906 	call search_lineno 
      008421 5D               [ 2]  907 	tnzw x 
      008422 26 04            [ 1]  908 	jrne 2$
                                    909 ; line doesn't exit
                                    910 ; it will be inserted at this point.  	
      008424 17 01            [ 2]  911 	ldw (DEST,sp),y 
      008426 20 05            [ 2]  912 	jra 3$
                                    913 ; line exit delete it.
                                    914 ; it will be replaced by new one 	
      008428 1F 01            [ 2]  915 2$: ldw (DEST,sp),x 
      00842A CD 83 84         [ 4]  916 	call del_line
      00842D                        917 3$: 
                                    918 ; insert new line or leave if LLEN==3
                                    919 ; LLEN==3 means empty line 
      00842D A6 03            [ 1]  920 	ld a,#3
      00842F 11 08            [ 1]  921 	cp a,(LLEN+1,sp)
      008431 27 27            [ 1]  922 	jreq insert_ln_exit ; empty line exit.
                                    923 ; if insertion point at txtend 
                                    924 ; no move required 
      008433 1E 01            [ 2]  925 	ldw x,(DEST,sp)
      008435 C3 00 1B         [ 2]  926 	cpw x,txtend 
      008438 2A 17            [ 1]  927 	jrpl 5$ 
                                    928 ; must create a gap
                                    929 ; at insertion point  
      00843A 1E 01            [ 2]  930 	ldw x,(DEST,sp)
      00843C 16 07            [ 2]  931 	ldw y,(LLEN,sp)
      00843E CD 83 BC         [ 4]  932 	call create_gap 
                                    933 ; move new line in gap 
      008441 1E 07            [ 2]  934 	ldw x,(LLEN,sp)
      008443 CF 00 09         [ 2]  935 	ldw acc16,x 
      008446 90 CE 00 1B      [ 2]  936 	ldw y,txtend ;SRC 
      00844A 1E 01            [ 2]  937 	ldw x,(DEST,sp) ; dest address 
      00844C CD 83 1E         [ 4]  938 	call move 
      00844F 20 09            [ 2]  939 	jra insert_ln_exit  
      008451                        940 5$: ; no move required 
      008451 1E 07            [ 2]  941 	ldw x,(LLEN,sp) 
      008453 72 BB 00 1B      [ 2]  942 	addw x,txtend 
      008457 CF 00 1B         [ 2]  943 	ldw txtend,x 
      00845A                        944 insert_ln_exit:	
      0003DA                        945 	_drop VSIZE
      00845A 5B 08            [ 2]    1     addw sp,#VSIZE 
      00845C 81               [ 4]  946 	ret
                                    947 
                                    948 
                                    949 ;-----------------------------
                                    950 ; check if text buffer full
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    951 ; input:
                                    952 ;   ptr16     addr start tokenize line 
                                    953 ;   X         buffer index 
                                    954 ; output:
                                    955 ;   none 
                                    956 ;-----------------------------------
      00845D                        957 check_full:
      00845D 72 BB 00 12      [ 2]  958 	addw x,ptr16 
      008461 A3 16 C8         [ 2]  959 	cpw x,#tib 
      008464 25 05            [ 1]  960 	jrult 1$
      008466 A6 01            [ 1]  961 	ld a,#ERR_MEM_FULL
      008468 CC 87 81         [ 2]  962 	jp tb_error 
      00846B 81               [ 4]  963 1$: ret 
                                    964 
                                    965 
                                    966 ;-----------------------------------
                                    967 ; create token list form text line 
                                    968 ; save this list in text area
                                    969 ; input:
                                    970 ;   none
                                    971 ; output:
                                    972 ;   basicptr     token list buffer
                                    973 ;   line# 		 BASIC line number 
                                    974 ;   in.w  		 cleared 
                                    975 ;-----------------------------------
                                    976 	.macro _incr_ptr16 n 
                                    977 	ldw x,#n 
                                    978 	addw x,ptr16 
                                    979 	ldw ptr16,x 
                                    980 	.endm 
                                    981 
                           000001   982 	XSAVE=1
                           000003   983 	BUFIDX=3
                           000004   984 	VSIZE=4
      00846C                        985 compile:
      0003EC                        986 	_vars VSIZE 
      00846C 52 04            [ 2]    1     sub sp,#VSIZE 
      00846E 72 1A 00 20      [ 1]  987 	bset flags,#FCOMP 
      008472 CE 00 1B         [ 2]  988 	ldw x,txtend
      008475 CF 00 12         [ 2]  989 	ldw ptr16,x 
      008478 5F               [ 1]  990 	clrw x 
      008479 AE 00 03         [ 2]  991 	ldw x,#3
      00847C 1F 03            [ 2]  992 	ldw (BUFIDX,sp),X  
      00847E CD 84 5D         [ 4]  993 	call check_full
      008481 5F               [ 1]  994 	clrw x 
      008482 72 CF 00 12      [ 5]  995 	ldw [ptr16],x 
      008486 CD 8D 5F         [ 4]  996 	call get_token
      008489 1F 01            [ 2]  997 	ldw (XSAVE,sp),x 
      00848B A1 04            [ 1]  998 	cp a,#TK_INTGR 
      00848D 26 11            [ 1]  999 	jrne 3$
      00848F A3 00 00         [ 2] 1000 	cpw x,#0  
      008492 22 03            [ 1] 1001 	jrugt 1$
      008494 CC 87 7F         [ 2] 1002 	jp syntax_error 
      008497 72 CF 00 12      [ 5] 1003 1$:	ldw [ptr16],x; line number
      00849B CD 8D 5F         [ 4] 1004 2$:	call get_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      00849E 1F 01            [ 2] 1005 	ldw (XSAVE,sp),x 
      0084A0 A1 00            [ 1] 1006 3$:	cp a,#TK_NONE 
      0084A2 26 03            [ 1] 1007 	jrne 30$
      0084A4 CC 85 37         [ 2] 1008 	jp 9$
      0084A7                       1009 30$: 	 
      0084A7 1E 03            [ 2] 1010 	ldw x,(BUFIDX,sp)
      0084A9 CD 84 5D         [ 4] 1011 	call check_full 
      0084AC 16 03            [ 2] 1012 	ldw y,(BUFIDX,sp) 
      0084AE 91 D7 12         [ 4] 1013 	ld ([ptr16],y),a ; token attribute 
      0084B1 90 5C            [ 1] 1014 	incw y
      0084B3 17 03            [ 2] 1015 	ldw (BUFIDX,sp),y
      0084B5 A1 01            [ 1] 1016 	cp a,#TK_COLON 
      0084B7 26 02            [ 1] 1017 	jrne 31$
      0084B9 20 E0            [ 2] 1018 	jra 2$ 
      0084BB                       1019 31$:
      0084BB A1 03            [ 1] 1020 	cp a,#TK_CHAR
      0084BD 26 0C            [ 1] 1021 	jrne 32$ 
      0084BF 1E 01            [ 2] 1022 	ldw x,(XSAVE,sp)
      0084C1 9F               [ 1] 1023 	ld a,xl 
      0084C2 91 D7 12         [ 4] 1024 	ld ([ptr16],y),a
      0084C5 90 5C            [ 1] 1025 	incw y 
      0084C7 17 03            [ 2] 1026 	ldw (BUFIDX,sp),y 
      0084C9 20 D0            [ 2] 1027 	jra 2$ 
      0084CB                       1028 32$:
      0084CB A1 02            [ 1] 1029 	cp a,#TK_ARRAY 
      0084CD 27 CC            [ 1] 1030 	jreq 2$ 
      0084CF A1 0A            [ 1] 1031 	cp a,#TK_QSTR 
      0084D1 26 25            [ 1] 1032 	jrne 4$
      0084D3 AE 17 18         [ 2] 1033 	ldw x,#pad 
      0084D6 CD 82 F2         [ 4] 1034 	call strlen
      0084D9 5C               [ 1] 1035 	incw x  
      0084DA CD 84 5D         [ 4] 1036 	call check_full 
      0084DD 90 AE 17 18      [ 2] 1037 	ldw y,#pad 
      0084E1 CE 00 12         [ 2] 1038 	ldw x,ptr16
      0084E4 72 FB 03         [ 2] 1039 	addw x,(BUFIDX,sp)	
      0084E7 CD 83 10         [ 4] 1040 	call strcpy 
      0084EA AE 17 18         [ 2] 1041 	ldw x,#pad 
      0084ED CD 82 F2         [ 4] 1042 	call strlen 
      0084F0 5C               [ 1] 1043 	incw x
      0084F1 72 FB 03         [ 2] 1044 	addw x,(BUFIDX,sp) 
      0084F4 1F 03            [ 2] 1045 	ldw (BUFIDX,sp),x
      0084F6 20 A3            [ 2] 1046 	jra 2$  
      0084F8 A1 04            [ 1] 1047 4$: cp a,#TK_INTGR
      0084FA 25 9F            [ 1] 1048 	jrult 2$
      0084FC A1 09            [ 1] 1049 	cp a,#TK_CONST 
      0084FE 22 9B            [ 1] 1050 	Jrugt 2$
      008500 1E 01            [ 2] 1051 	ldw x,(XSAVE,sp) 
      008502 16 03            [ 2] 1052 	ldw y,(BUFIDX,sp)
      008504 91 DF 12         [ 5] 1053 	ldw ([ptr16],y),x
      008507 A3 97 6B         [ 2] 1054 	cpw x,#rem 
      00850A 26 22            [ 1] 1055 	jrne 5$	
                                   1056 ; comment advance in.w to eol 
      00850C 72 A9 00 02      [ 2] 1057 	addw y,#2 ; skip exec address 
      008510 17 03            [ 2] 1058 	ldw (BUFIDX,sp),y 
      008512 CE 00 12         [ 2] 1059 	ldw x,ptr16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008515 72 FB 03         [ 2] 1060 	addw x,(BUFIDX,sp)
      008518 90 CE 00 01      [ 2] 1061 	ldw y,in.w 
      00851C 72 A9 16 C8      [ 2] 1062 	addw y,#tib 
      008520 CD 83 10         [ 4] 1063 	call strcpy 	
      008523 CD 82 F2         [ 4] 1064 	call strlen 
      008526 5C               [ 1] 1065 	incw x ; skip string 0. 
      008527 72 FB 03         [ 2] 1066 	addw x,(BUFIDX,sp)
      00852A 1F 03            [ 2] 1067 	ldw (BUFIDX,sp),x 
      00852C 20 09            [ 2] 1068 	jra 9$
      00852E 72 A9 00 02      [ 2] 1069 5$:	addw y,#2 
      008532 17 03            [ 2] 1070 	ldw (BUFIDX,sp),y 
      008534 CC 84 9B         [ 2] 1071 	jp 2$
      008537                       1072 9$: 
      008537 AE 00 02         [ 2] 1073 	ldw x,#2
      00853A 16 03            [ 2] 1074 	ldw y,(BUFIDX,sp)
      00853C 90 9F            [ 1] 1075 	ld a,yl 
      00853E 72 D7 00 12      [ 4] 1076 	ld ([ptr16],x),a  	
      008542 72 CE 00 12      [ 5] 1077 	ldw x,[ptr16]
      008546 27 09            [ 1] 1078 	jreq 10$
      008548 CD 83 F5         [ 4] 1079 	call insert_line
      00854B 72 5F 00 04      [ 1] 1080 	clr  count 
      00854F 20 0F            [ 2] 1081 	jra  11$ 
      008551                       1082 10$: 
      008551 CE 00 12         [ 2] 1083 	ldw x,ptr16 
      008554 CF 00 05         [ 2] 1084 	ldw basicptr,x 
      008557 E6 02            [ 1] 1085 	ld a,(2,x)
      008559 C7 00 04         [ 1] 1086 	ld count,a 
      00855C 35 03 00 02      [ 1] 1087 	mov in,#3 
      008560                       1088 11$:
      0004E0                       1089 	_drop VSIZE 
      008560 5B 04            [ 2]    1     addw sp,#VSIZE 
      008562 72 1B 00 20      [ 1] 1090 	bres flags,#FCOMP 
      008566 81               [ 4] 1091 	ret 
                                   1092 
                                   1093 
                                   1094 ;------------------------------------
                                   1095 ;  set all variables to zero 
                                   1096 ; input:
                                   1097 ;   none 
                                   1098 ; output:
                                   1099 ;	none
                                   1100 ;------------------------------------
      008567                       1101 clear_vars:
      008567 AE 00 22         [ 2] 1102 	ldw x,#vars 
      00856A 90 AE 00 34      [ 2] 1103 	ldw y,#2*26 
      00856E 7F               [ 1] 1104 1$:	clr (x)
      00856F 5C               [ 1] 1105 	incw x 
      008570 90 5A            [ 2] 1106 	decw y 
      008572 26 FA            [ 1] 1107 	jrne 1$
      008574 81               [ 4] 1108 	ret 
                                   1109 
                                   1110 ;-------------------------------------
                                   1111 ; check if A is a letter
                                   1112 ; input:
                                   1113 ;   A 			character to test 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1114 ; output:
                                   1115 ;   C flag      1 true, 0 false 
                                   1116 ;-------------------------------------
      008575                       1117 is_alpha:
      008575 A1 41            [ 1] 1118 	cp a,#'A 
      008577 8C               [ 1] 1119 	ccf
      008578 24 0B            [ 1] 1120 	jrnc 9$ 
      00857A A1 5B            [ 1] 1121 	cp a,#'Z+1 
      00857C 25 07            [ 1] 1122 	jrc 9$ 
      00857E A1 61            [ 1] 1123 	cp a,#'a 
      008580 8C               [ 1] 1124 	ccf 
      008581 24 02            [ 1] 1125 	jrnc 9$
      008583 A1 7B            [ 1] 1126 	cp a,#'z+1   
      008585 81               [ 4] 1127 9$: ret 	
                                   1128 
                                   1129 ;-------------------------------------
                                   1130 ;  program initialization entry point 
                                   1131 ;-------------------------------------
                           000001  1132 	MAJOR=1
                           000000  1133 	MINOR=0
      008586 0A 0A 54 69 6E 79 20  1134 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0085CC                       1135 cold_start:
                                   1136 ;set stack 
      0085CC AE 17 FF         [ 2] 1137 	ldw x,#STACK_EMPTY
      0085CF 94               [ 1] 1138 	ldw sp,x   
                                   1139 ; clear all ram 
      0085D0 7F               [ 1] 1140 0$: clr (x)
      0085D1 5A               [ 2] 1141 	decw x 
      0085D2 26 FC            [ 1] 1142 	jrne 0$
                                   1143 ; activate pull up on all inputs 
      0085D4 A6 FF            [ 1] 1144 	ld a,#255 
      0085D6 C7 50 03         [ 1] 1145 	ld PA_CR1,a 
      0085D9 C7 50 08         [ 1] 1146 	ld PB_CR1,a 
      0085DC C7 50 0D         [ 1] 1147 	ld PC_CR1,a 
      0085DF C7 50 12         [ 1] 1148 	ld PD_CR1,a 
      0085E2 C7 50 17         [ 1] 1149 	ld PE_CR1,a 
      0085E5 C7 50 1C         [ 1] 1150 	ld PF_CR1,a 
      0085E8 C7 50 21         [ 1] 1151 	ld PG_CR1,a 
      0085EB C7 50 2B         [ 1] 1152 	ld PI_CR1,a 
                                   1153 ; select internal clock no divisor: 16 Mhz 	
      0085EE A6 E1            [ 1] 1154 	ld a,#CLK_SWR_HSI 
      0085F0 5F               [ 1] 1155 	clrw x  
      0085F1 CD 81 19         [ 4] 1156     call clock_init 
      0085F4 CD 81 2F         [ 4] 1157 	call timer4_init
                                   1158 ; UART3 at 115200 BAUD
      0085F7 CD 81 F4         [ 4] 1159 	call uart3_init
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1160 ; activate PE_4 (user button interrupt)
      0085FA 72 18 50 18      [ 1] 1161     bset PE_CR2,#USR_BTN_BIT 
                                   1162 ; display system information
      0085FE AE 85 86         [ 2] 1163 	ldw x,#software 
      008601 CD 82 30         [ 4] 1164 	call puts 
      008604 A6 01            [ 1] 1165 	ld a,#MAJOR 
      008606 C7 00 0A         [ 1] 1166 	ld acc8,a 
      008609 5F               [ 1] 1167 	clrw x 
      00860A CF 00 08         [ 2] 1168 	ldw acc24,x 
      00860D A6 0A            [ 1] 1169 	ld a,#10 
      00860F CD 89 B0         [ 4] 1170 	call prti24 
      008612 A6 2E            [ 1] 1171 	ld a,#'.
      008614 CD 82 1E         [ 4] 1172 	call putc 
      008617 A6 00            [ 1] 1173 	ld a,#MINOR 
      008619 C7 00 0A         [ 1] 1174 	ld acc8,a 
      00861C 5F               [ 1] 1175 	clrw x 
      00861D CF 00 08         [ 2] 1176 	ldw acc24,x 
      008620 A6 0A            [ 1] 1177 	ld a,#10 
      008622 CD 89 B0         [ 4] 1178 	call prti24 
      008625 A6 0D            [ 1] 1179 	ld a,#CR 
      008627 CD 82 1E         [ 4] 1180 	call putc 
      00862A CD 9B 0C         [ 4] 1181 	call seek_fdrive 
                                   1182 ; configure LD2 pin 
      00862D 72 1A 50 0D      [ 1] 1183     bset PC_CR1,#LED2_BIT
      008631 72 1A 50 0E      [ 1] 1184     bset PC_CR2,#LED2_BIT
      008635 72 1A 50 0C      [ 1] 1185     bset PC_DDR,#LED2_BIT
      008639 9A               [ 1] 1186 	rim 
      00863A 72 5C 00 10      [ 1] 1187 	inc seedy+1 
      00863E 72 5C 00 0E      [ 1] 1188 	inc seedx+1 
      008642 CD 86 51         [ 4] 1189 	call clear_basic
      008645 CD 93 D8         [ 4] 1190 	call ubound 
      008648 CD 8F FE         [ 4] 1191 	call dpop 
      00864B CF 00 1E         [ 2] 1192 	ldw array_size,x 
      00864E CC 87 D3         [ 2] 1193     jp warm_start 
                                   1194 
                                   1195 ;---------------------------
                                   1196 ; reset BASIC text variables 
                                   1197 ; and clear variables 
                                   1198 ;---------------------------
      008651                       1199 clear_basic:
      008651 72 5F 00 04      [ 1] 1200 	clr count 
      008655 AE 00 56         [ 2] 1201 	ldw x,#free_ram 
      008658 CF 00 19         [ 2] 1202 	ldw txtbgn,x 
      00865B CF 00 1B         [ 2] 1203 	ldw txtend,x 
      00865E CD 85 67         [ 4] 1204 	call clear_vars 
      008661 81               [ 4] 1205 	ret 
                                   1206 
                                   1207 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1208 ;;   Tiny BASIC error messages     ;;
                                   1209 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008662                       1210 err_msg:
      008662 00 00 86 7A 86 88 86  1211 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             97 86 B1 86 C1
      00866E 86 D8 86 EF 87 0A 87  1212 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             1C 87 2E
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008678 87 3B                 1213 	.word err_no_access 
                                   1214 
      00867A 0A 4D 65 6D 6F 72 79  1215 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      008688 0A 73 79 6E 74 61 78  1216 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      008697 0A 6D 61 74 68 20 6F  1217 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0086B1 0A 64 69 76 69 73 69  1218 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      0086C1 0A 69 6E 76 61 6C 69  1219 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      0086D8 0A 72 75 6E 20 74 69  1220 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      0086EF 0A 63 6F 6D 6D 61 6E  1221 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      00870A 0A 64 75 70 6C 69 63  1222 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      00871C 0A 46 69 6C 65 20 6E  1223 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      00872E 0A 62 61 64 20 76 61  1224 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      00873B 0A 46 69 6C 65 20 69  1225 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
                                   1226 
      00876F 6C 61 73 74 20 74 6F  1227 rt_msg: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                   1228 
      00877F                       1229 syntax_error:
      00877F A6 02            [ 1] 1230 	ld a,#ERR_SYNTAX 
                                   1231 
      008781                       1232 tb_error:
      008781 AE 86 62         [ 2] 1233 	ldw x, #err_msg 
      008784 72 5F 00 09      [ 1] 1234 	clr acc16 
      008788 48               [ 1] 1235 	sll a
      008789 72 59 00 09      [ 1] 1236 	rlc acc16  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      00878D C7 00 0A         [ 1] 1237 	ld acc8, a 
      008790 72 BB 00 09      [ 2] 1238 	addw x,acc16 
      008794 FE               [ 2] 1239 	ldw x,(x)
      008795 CD 82 30         [ 4] 1240 	call puts
      008798 72 0B 00 20 18   [ 2] 1241 	btjf flags,#FCOMP, 1$
      00879D AE 16 C8         [ 2] 1242 	ldw x,#tib
      0087A0 CD 82 30         [ 4] 1243 	call puts 
      0087A3 A6 0D            [ 1] 1244 	ld a,#CR 
      0087A5 CD 82 1E         [ 4] 1245 	call putc
      0087A8 CE 00 01         [ 2] 1246 	ldw x,in.w
      0087AB CD 82 58         [ 4] 1247 	call spaces
      0087AE A6 5E            [ 1] 1248 	ld a,#'^
      0087B0 CD 82 1E         [ 4] 1249 	call putc 
      0087B3 20 1A            [ 2] 1250 	jra 6$
      0087B5 CE 00 05         [ 2] 1251 1$:	ldw x,basicptr
      0087B8 CD 94 F5         [ 4] 1252 	call prt_basic_line
      0087BB AE 87 6F         [ 2] 1253 	ldw x,#rt_msg 
      0087BE CD 82 30         [ 4] 1254 	call puts 
      0087C1 5F               [ 1] 1255 	clrw x 
      0087C2 C6 00 03         [ 1] 1256 	ld a,in.saved 
      0087C5 97               [ 1] 1257 	ld xl,a 
      0087C6 72 D6 00 05      [ 4] 1258 	ld a,([basicptr],x)
      0087CA 5F               [ 1] 1259 	clrw x 
      0087CB 97               [ 1] 1260 	ld xl,a 
      0087CC CD 89 F8         [ 4] 1261 	call print_int 
      0087CF AE 17 FF         [ 2] 1262 6$: ldw x,#STACK_EMPTY 
      0087D2 94               [ 1] 1263     ldw sp,x
      0087D3                       1264 warm_start:
      0087D3 72 5F 00 20      [ 1] 1265 	clr flags 
      0087D7 72 5F 00 1D      [ 1] 1266 	clr loop_depth 
      0087DB AE 17 80         [ 2] 1267 	ldw x,#dstack_unf 
      0087DE CF 00 17         [ 2] 1268 	ldw dstkptr,x 
      0087E1 35 04 00 21      [ 1] 1269 	mov tab_width,#TAB_WIDTH 
      0087E5 35 0A 00 07      [ 1] 1270 	mov base,#10 
      0087E9 AE 16 C8         [ 2] 1271 	ldw x,#tib 
      0087EC CF 00 05         [ 2] 1272 	ldw basicptr,x 
                                   1273 ;----------------------------
                                   1274 ;   BASIC interpreter
                                   1275 ;----------------------------
      0087EF                       1276 interp:
      0087EF 72 5F 00 01      [ 1] 1277 	clr in.w
      0087F3 72 01 00 20 23   [ 2] 1278 	btjf flags,#FRUN,4$ 
                                   1279 ; running program
                                   1280 ; goto next basic line 
      0087F8 CE 00 05         [ 2] 1281 	ldw x,basicptr
      0087FB E6 02            [ 1] 1282 	ld a,(2,x) ; line length 
      0087FD C7 00 0A         [ 1] 1283 	ld acc8,a 
      008800 72 5F 00 09      [ 1] 1284 	clr acc16 
      008804 72 BB 00 09      [ 2] 1285 	addw x,acc16
      008808 C3 00 1B         [ 2] 1286 	cpw x,txtend 
      00880B 2A C6            [ 1] 1287 	jrpl warm_start
      00880D CF 00 05         [ 2] 1288 	ldw basicptr,x ; start of next line  
      008810 E6 02            [ 1] 1289 	ld a,(2,x)
      008812 C7 00 04         [ 1] 1290 	ld count,a 
      008815 35 03 00 02      [ 1] 1291 	mov in,#3 ; skip first 3 bytes of line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008819 20 14            [ 2] 1292 	jra interp_loop 
      00881B                       1293 4$: ; commande line mode 	
      00881B 72 5F 00 02      [ 1] 1294 	clr in
      00881F A6 0D            [ 1] 1295 	ld a,#CR 
      008821 CD 82 1E         [ 4] 1296 	call putc 
      008824 A6 3E            [ 1] 1297 	ld a,#'> 
      008826 CD 82 1E         [ 4] 1298 	call putc 
      008829 CD 8A E6         [ 4] 1299 	call readln
      00882C CD 84 6C         [ 4] 1300 	call compile
      00882F                       1301 interp_loop:  
      00882F C6 00 02         [ 1] 1302 	ld a,in 
      008832 C1 00 04         [ 1] 1303 	cp a,count  
      008835 2A B8            [ 1] 1304 	jrpl interp
      008837 CD 88 5F         [ 4] 1305 	call next_token
      00883A A1 01            [ 1] 1306 	cp a,#TK_COLON 
      00883C 27 F1            [ 1] 1307 	jreq interp_loop 
      00883E A1 00            [ 1] 1308 	cp a,#TK_NONE 
                                   1309 ;	jreq interp 
      008840                       1310 1$:
      008840 A1 05            [ 1] 1311 	cp a,#TK_VAR
      008842 26 05            [ 1] 1312 	jrne 2$
      008844 CD 94 04         [ 4] 1313 	call let02  
      008847 20 E6            [ 2] 1314 	jra interp_loop 
      008849                       1315 2$:	
      008849 A1 02            [ 1] 1316 	cp a,#TK_ARRAY 
      00884B 26 08            [ 1] 1317 	jrne 3$
      00884D CD 92 42         [ 4] 1318 	call get_array_element
      008850 CD 94 04         [ 4] 1319 	call let02 
      008853 20 DA            [ 2] 1320 	jra interp_loop 
      008855                       1321 3$:
      008855 A1 06            [ 1] 1322 	cp a,#TK_CMD
      008857 26 03            [ 1] 1323 	jrne 4$
      008859 FD               [ 4] 1324 	call (x) 
      00885A 20 D3            [ 2] 1325 	jra interp_loop 
      00885C                       1326 4$:	
      00885C CC 87 7F         [ 2] 1327 	jp syntax_error 
                                   1328 
                                   1329 ;--------------------------
                                   1330 ; extract next token from
                                   1331 ; token list 
                                   1332 ; basicptr -> base address 
                                   1333 ; in  -> offset in list array 
                                   1334 ; output:
                                   1335 ;   A 		token attribute
                                   1336 ;   X 		token value if there is one
                                   1337 ;----------------------------------------
      00885F                       1338 next_token:
      00885F C6 00 02         [ 1] 1339 	ld a,in 
      008862 C0 00 04         [ 1] 1340 	sub a,count 
      008865 27 3B            [ 1] 1341 	jreq 9$
      008867 55 00 02 00 03   [ 1] 1342 	mov in.saved,in
      00886C CE 00 05         [ 2] 1343 	ldw x,basicptr 
      00886F 72 D6 00 01      [ 4] 1344 	ld a,([in.w],x)
      008873 72 5C 00 02      [ 1] 1345 	inc in 
      008877 A1 02            [ 1] 1346 	cp a,#TK_ARRAY  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008879 23 27            [ 2] 1347 	jrule 9$
      00887B A1 03            [ 1] 1348 	cp a,#TK_CHAR
      00887D 26 0D            [ 1] 1349 	jrne 1$
      00887F 72 D6 00 01      [ 4] 1350 	ld a,([in.w],x)
      008883 72 5C 00 02      [ 1] 1351 	inc in
      008887 5F               [ 1] 1352 	clrw x 
      008888 97               [ 1] 1353 	ld xl,a 
      008889 A6 03            [ 1] 1354 	ld a,#TK_CHAR
      00888B 81               [ 4] 1355 	ret 
      00888C A1 0A            [ 1] 1356 1$:	cp a,#TK_QSTR 
      00888E 25 06            [ 1] 1357 	jrult 2$
      008890 72 BB 00 01      [ 2] 1358 	addw x,in.w 
      008894 20 0C            [ 2] 1359 	jra 9$
      008896 72 DE 00 01      [ 5] 1360 2$: ldw x,([in.w],x)
      00889A 72 5C 00 02      [ 1] 1361 	inc in 
      00889E 72 5C 00 02      [ 1] 1362 	inc in
      0088A2 81               [ 4] 1363 9$: ret	
                                   1364 
                                   1365 
                                   1366 ;----------------------------------------
                                   1367 ;   DEBUG support functions
                                   1368 ;----------------------------------------
                           000001  1369 .if DEBUG 
                                   1370 ; turn LED on 
      0088A3                       1371 ledon:
      0088A3 72 1A 50 0A      [ 1] 1372     bset PC_ODR,#LED2_BIT
      0088A7 81               [ 4] 1373     ret 
                                   1374 
                                   1375 ; turn LED off 
      0088A8                       1376 ledoff:
      0088A8 72 1B 50 0A      [ 1] 1377     bres PC_ODR,#LED2_BIT 
      0088AC 81               [ 4] 1378     ret 
                                   1379 
                                   1380 ; invert LED status 
      0088AD                       1381 ledtoggle:
      0088AD A6 20            [ 1] 1382     ld a,#LED2_MASK
      0088AF C8 50 0A         [ 1] 1383     xor a,PC_ODR
      0088B2 C7 50 0A         [ 1] 1384     ld PC_ODR,a
      0088B5 81               [ 4] 1385     ret 
                                   1386 
      0088B6                       1387 left_paren:
      0088B6 A6 20            [ 1] 1388 	ld a,#SPACE 
      0088B8 CD 82 1E         [ 4] 1389 	call putc
      0088BB A6 28            [ 1] 1390 	ld a,#'( 
      0088BD CD 82 1E         [ 4] 1391 	call putc 	
      0088C0 81               [ 4] 1392 	ret 
                                   1393 
                                   1394 ;------------------------------
                                   1395 ; print 8 bit register 
                                   1396 ; input:
                                   1397 ;   X  point to register name 
                                   1398 ;   A  register value to print 
                                   1399 ; output:
                                   1400 ;   none
                                   1401 ;------------------------------- 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0088C1                       1402 prt_reg8:
      0088C1 88               [ 1] 1403 	push a 
      0088C2 CD 82 30         [ 4] 1404 	call puts 
      0088C5 7B 01            [ 1] 1405 	ld a,(1,sp) 
      0088C7 C7 00 0A         [ 1] 1406 	ld acc8,a 
      0088CA 5F               [ 1] 1407 	clrw x 
      0088CB 97               [ 1] 1408 	ld xl,a 
      0088CC 35 10 00 07      [ 1] 1409 	mov base,#16
      0088D0 CD 89 F8         [ 4] 1410 	call print_int 
      0088D3 CD 88 B6         [ 4] 1411 	call left_paren 
      0088D6 84               [ 1] 1412 	pop a 
      0088D7 5F               [ 1] 1413 	clrw x 
      0088D8 97               [ 1] 1414 	ld xl,a 
      0088D9 35 0A 00 07      [ 1] 1415 	mov base,#10 
      0088DD CD 89 F8         [ 4] 1416 	call print_int  
      0088E0 A6 29            [ 1] 1417 	ld a,#') 
      0088E2 CD 82 1E         [ 4] 1418 	call putc
      0088E5 81               [ 4] 1419 	ret
                                   1420 
                                   1421 ;--------------------------------
                                   1422 ; print 16 bits register 
                                   1423 ; input:
                                   1424 ;   X   point register name 
                                   1425 ;   Y   register value to print 
                                   1426 ; output:
                                   1427 ;  none
                                   1428 ;--------------------------------
      0088E6                       1429 prt_reg16: 
      0088E6 90 89            [ 2] 1430 	pushw y 
      0088E8 CD 82 30         [ 4] 1431 	call puts 
      0088EB 1E 01            [ 2] 1432 	ldw x,(1,sp) 
      0088ED 35 10 00 07      [ 1] 1433 	mov base,#16 
      0088F1 CD 89 F8         [ 4] 1434 	call print_int  
      0088F4 CD 88 B6         [ 4] 1435 	call left_paren 
      0088F7 85               [ 2] 1436 	popw x 
      0088F8 35 0A 00 07      [ 1] 1437 	mov base,#10 
      0088FC CD 89 F8         [ 4] 1438 	call print_int  
      0088FF A6 29            [ 1] 1439 	ld a,#') 
      008901 CD 82 1E         [ 4] 1440 	call putc
      008904 81               [ 4] 1441 	ret 
                                   1442 
                                   1443 ;------------------------------------
                                   1444 ; print registers contents saved on
                                   1445 ; stack by trap interrupt.
                                   1446 ;------------------------------------
      008905                       1447 print_registers:
      008905 AE 89 58         [ 2] 1448 	ldw x,#STATES
      008908 CD 82 30         [ 4] 1449 	call puts
                                   1450 ; print EPC 
      00890B AE 89 95         [ 2] 1451 	ldw x, #REG_EPC
      00890E CD 82 30         [ 4] 1452 	call puts 
      008911 7B 0B            [ 1] 1453 	ld a, (11,sp)
      008913 C7 00 0A         [ 1] 1454 	ld acc8,a 
      008916 7B 0A            [ 1] 1455 	ld a, (10,sp) 
      008918 C7 00 09         [ 1] 1456 	ld acc16,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      00891B 7B 09            [ 1] 1457 	ld a,(9,sp) 
      00891D C7 00 08         [ 1] 1458 	ld acc24,a
      008920 5F               [ 1] 1459 	clrw x  
      008921 A6 10            [ 1] 1460 	ld a,#16
      008923 CD 89 B0         [ 4] 1461 	call prti24  
                                   1462 ; print X
      008926 AE 89 9E         [ 2] 1463 	ldw x,#REG_X
      008929 16 05            [ 2] 1464 	ldw y,(5,sp)
      00892B CD 88 E6         [ 4] 1465 	call prt_reg16  
                                   1466 ; print Y 
      00892E AE 89 9A         [ 2] 1467 	ldw x,#REG_Y
      008931 16 07            [ 2] 1468 	ldw y, (7,sp)
      008933 CD 88 E6         [ 4] 1469 	call prt_reg16  
                                   1470 ; print A 
      008936 AE 89 A2         [ 2] 1471 	ldw x,#REG_A
      008939 7B 04            [ 1] 1472 	ld a, (4,sp) 
      00893B CD 88 C1         [ 4] 1473 	call prt_reg8
                                   1474 ; print CC 
      00893E AE 89 A6         [ 2] 1475 	ldw x,#REG_CC 
      008941 7B 03            [ 1] 1476 	ld a, (3,sp) 
      008943 CD 88 C1         [ 4] 1477 	call prt_reg8 
                                   1478 ; print SP 
      008946 AE 89 AB         [ 2] 1479 	ldw x,#REG_SP
      008949 90 96            [ 1] 1480 	ldw y,sp 
      00894B 72 A9 00 0C      [ 2] 1481 	addw y,#12
      00894F CD 88 E6         [ 4] 1482 	call prt_reg16  
      008952 A6 0A            [ 1] 1483 	ld a,#'\n' 
      008954 CD 82 1E         [ 4] 1484 	call putc
      008957 81               [ 4] 1485 	ret
                                   1486 
      008958 0A 52 65 67 69 73 74  1487 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      008995 45 50 43 3A 00        1488 REG_EPC: .asciz "EPC:"
      00899A 0A 59 3A 00           1489 REG_Y:   .asciz "\nY:" 
      00899E 0A 58 3A 00           1490 REG_X:   .asciz "\nX:"
      0089A2 0A 41 3A 00           1491 REG_A:   .asciz "\nA:" 
      0089A6 0A 43 43 3A 00        1492 REG_CC:  .asciz "\nCC:"
      0089AB 0A 53 50 3A 00        1493 REG_SP:  .asciz "\nSP:"
                                   1494 .endif ; DEBUG 
                                   1495 
                                   1496 ;------------------------------------
                                   1497 ; print integer in acc24 
                                   1498 ; input:
                                   1499 ;	acc24 		integer to print 
                                   1500 ;	A 			numerical base for conversion 
                                   1501 ;               if bit 7 is set add a space at print end.
                                   1502 ;   XL 			field width, 0 -> no fill.
                                   1503 ;  output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1504 ;    none 
                                   1505 ;------------------------------------
                           000001  1506 	WIDTH = 1
                           000002  1507 	BASE = 2
                           000003  1508 	ADD_SPACE=3 ; add a space after number 
                           000003  1509 	VSIZE = 3
      0089B0                       1510 prti24:
      000930                       1511 	_vars VSIZE 
      0089B0 52 03            [ 2]    1     sub sp,#VSIZE 
      0089B2 0F 03            [ 1] 1512 	clr (ADD_SPACE,sp)
      0089B4 A5 80            [ 1] 1513 	bcp a,#0x80 
      0089B6 27 02            [ 1] 1514 	jreq 0$ 
      0089B8 03 03            [ 1] 1515 	cpl (ADD_SPACE,sp)
      0089BA A4 1F            [ 1] 1516 0$:	and a,#31 
      0089BC 6B 02            [ 1] 1517 	ld (BASE,sp),a
      0089BE 9F               [ 1] 1518 	ld a,xl
      0089BF 6B 01            [ 1] 1519 	ld (WIDTH,sp),a 
      0089C1 7B 02            [ 1] 1520 	ld a, (BASE,sp)  
      0089C3 CD 8A 54         [ 4] 1521     call itoa  ; conversion entier en  .asciz
      0089C6 7B 01            [ 1] 1522 1$: ld a,(WIDTH,sp)
      0089C8 27 1F            [ 1] 1523 	jreq 4$
      0089CA C7 00 0A         [ 1] 1524 	ld acc8,a 
      0089CD 89               [ 2] 1525 	pushw x 
      0089CE CD 82 F2         [ 4] 1526 	call strlen 
      0089D1 9F               [ 1] 1527 	ld a,xl 
      0089D2 85               [ 2] 1528 	popw x 
      0089D3 31 00 0A         [ 3] 1529 	exg a,acc8 
      0089D6 C0 00 0A         [ 1] 1530 	sub a,acc8 
      0089D9 2B 0E            [ 1] 1531 	jrmi 4$
      0089DB 6B 01            [ 1] 1532 	ld (WIDTH,sp),a 
      0089DD A6 20            [ 1] 1533 	ld  a,#SPACE
      0089DF 0D 01            [ 1] 1534 3$: tnz (WIDTH,sp)
      0089E1 27 06            [ 1] 1535 	jreq 4$
      0089E3 5A               [ 2] 1536 	decw x 
      0089E4 F7               [ 1] 1537 	ld (x),a 
      0089E5 0A 01            [ 1] 1538 	dec (WIDTH,sp) 
      0089E7 20 F6            [ 2] 1539 	jra 3$
      0089E9                       1540 4$: 
      0089E9 CD 82 30         [ 4] 1541 	call puts 
      0089EC 0D 03            [ 1] 1542 	tnz (ADD_SPACE,sp)
      0089EE 27 05            [ 1] 1543 	jreq 5$
      0089F0 A6 20            [ 1] 1544     ld a,#SPACE 
      0089F2 CD 82 1E         [ 4] 1545 	call putc 
      000975                       1546 5$: _drop VSIZE 
      0089F5 5B 03            [ 2]    1     addw sp,#VSIZE 
      0089F7 81               [ 4] 1547     ret	
                                   1548 
                                   1549 ;-----------------------------------
                                   1550 ; print a 16 bit integer 
                                   1551 ; using variable 'base' as conversion
                                   1552 ; format.
                                   1553 ; input:
                                   1554 ;   X       integer to print 
                                   1555 ;   base    conversion base 
                                   1556 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1557 ;   none 
                                   1558 ;-----------------------------------
                           000001  1559 	SIGN=1
                           000001  1560 	VSIZE=1
      0089F8                       1561 print_int: 
      000978                       1562 	_vars VSIZE 
      0089F8 52 01            [ 2]    1     sub sp,#VSIZE 
      0089FA 0F 01            [ 1] 1563 	clr (SIGN,sp)
      0089FC 90 AE 17 3F      [ 2] 1564 	ldw y,#pad+PAD_SIZE-1 
      008A00 90 7F            [ 1] 1565 	clr (y)
      008A02 C6 00 07         [ 1] 1566 	ld a,base  
      008A05 A1 0A            [ 1] 1567 	cp a,#10 
      008A07 26 06            [ 1] 1568 	jrne 1$ 
      008A09 5D               [ 2] 1569 	tnzw x 
      008A0A 2A 03            [ 1] 1570 	jrpl 1$ 
      008A0C 03 01            [ 1] 1571 	cpl (SIGN,sp)
      008A0E 50               [ 2] 1572 	negw x 	 
      008A0F                       1573 1$:	
      008A0F C6 00 07         [ 1] 1574 	ld a,base 
      008A12 62               [ 2] 1575 	div x,a 
      008A13 AB 30            [ 1] 1576 	add a,#'0 
      008A15 A1 3A            [ 1] 1577 	cp a,#'9+1 
      008A17 2B 02            [ 1] 1578 	jrmi 2$ 
      008A19 AB 07            [ 1] 1579 	add a,#7 
      008A1B 90 5A            [ 2] 1580 2$: decw y 
      008A1D 90 F7            [ 1] 1581 	ld (y),a 
      008A1F 5D               [ 2] 1582 	tnzw x 
      008A20 26 ED            [ 1] 1583 	jrne 1$ 
      008A22 A6 10            [ 1] 1584 	ld a,#16 
      008A24 C1 00 07         [ 1] 1585 	cp a,base 
      008A27 26 08            [ 1] 1586 	jrne 3$
      008A29 A6 24            [ 1] 1587 	ld a,#'$
      008A2B 90 5A            [ 2] 1588 	decw y  
      008A2D 90 F7            [ 1] 1589 	ld (y),a
      008A2F 20 0A            [ 2] 1590 	jra 9$ 
      008A31 0D 01            [ 1] 1591 3$: tnz (SIGN,sp)
      008A33 27 06            [ 1] 1592 	jreq 9$ 
      008A35 A6 2D            [ 1] 1593 	ld a,#'-
      008A37 90 5A            [ 2] 1594 	decw y  
      008A39 90 F7            [ 1] 1595 	ld (y),a
      008A3B                       1596 9$:	
      008A3B 93               [ 1] 1597 	ldw x,y 
      008A3C 1D 17 3F         [ 2] 1598 	subw x,#pad+PAD_SIZE-1 
      008A3F 50               [ 2] 1599 	negw x  
      008A40                       1600 10$:
      008A40 90 5A            [ 2] 1601 	decw y 
      008A42 A6 20            [ 1] 1602 	ld a,#SPACE 
      008A44 90 F7            [ 1] 1603 	ld (y),a
      008A46 5C               [ 1] 1604 	incw x 
      008A47 9F               [ 1] 1605 	ld a,xl 
      008A48 C1 00 21         [ 1] 1606 	cp a,tab_width
      008A4B 2B F3            [ 1] 1607 	jrmi 10$ 
      008A4D                       1608 12$:
      008A4D 93               [ 1] 1609     ldw x,y 
      008A4E CD 82 30         [ 4] 1610 	call puts  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0009D1                       1611 	_drop VSIZE 
      008A51 5B 01            [ 2]    1     addw sp,#VSIZE 
      008A53 81               [ 4] 1612 	ret 
                                   1613 
                                   1614 ;------------------------------------
                                   1615 ; convert integer in acc24 to string
                                   1616 ; input:
                                   1617 ;   A	  	base
                                   1618 ;	acc24	integer to convert
                                   1619 ; output:
                                   1620 ;   X  		pointer to string
                                   1621 ;------------------------------------
                           000001  1622 	SIGN=1  ; integer sign 
                           000002  1623 	BASE=2  ; numeric base 
                           000002  1624 	VSIZE=2  ;locals size
      008A54                       1625 itoa:
      008A54 52 02            [ 2] 1626 	sub sp,#VSIZE
      008A56 6B 02            [ 1] 1627 	ld (BASE,sp), a  ; base
      008A58 0F 01            [ 1] 1628 	clr (SIGN,sp)    ; sign
      008A5A A1 0A            [ 1] 1629 	cp a,#10
      008A5C 26 0A            [ 1] 1630 	jrne 1$
                                   1631 	; base 10 string display with negative sign if bit 23==1
      008A5E 72 0F 00 08 05   [ 2] 1632 	btjf acc24,#7,1$
      008A63 03 01            [ 1] 1633 	cpl (SIGN,sp)
      008A65 CD 8A C3         [ 4] 1634 	call neg_acc24
      008A68                       1635 1$:
                                   1636 ; initialize string pointer 
      008A68 AE 17 3F         [ 2] 1637 	ldw x,#pad+PAD_SIZE-1
      008A6B 7F               [ 1] 1638 	clr (x)
      008A6C                       1639 itoa_loop:
      008A6C 7B 02            [ 1] 1640     ld a,(BASE,sp)
      008A6E CD 8A 9B         [ 4] 1641     call divu24_8 ; acc24/A 
      008A71 AB 30            [ 1] 1642     add a,#'0  ; remainder of division
      008A73 A1 3A            [ 1] 1643     cp a,#'9+1
      008A75 2B 02            [ 1] 1644     jrmi 2$
      008A77 AB 07            [ 1] 1645     add a,#7 
      008A79 5A               [ 2] 1646 2$: decw x
      008A7A F7               [ 1] 1647     ld (x),a
                                   1648 	; if acc24==0 conversion done
      008A7B C6 00 08         [ 1] 1649 	ld a,acc24
      008A7E CA 00 09         [ 1] 1650 	or a,acc16
      008A81 CA 00 0A         [ 1] 1651 	or a,acc8
      008A84 26 E6            [ 1] 1652     jrne itoa_loop
                                   1653 	;conversion done, next add '$' or '-' as required
      008A86 7B 02            [ 1] 1654 	ld a,(BASE,sp)
      008A88 A1 10            [ 1] 1655 	cp a,#16
      008A8A 27 08            [ 1] 1656 	jreq 8$
      008A8C 7B 01            [ 1] 1657 	ld a,(SIGN,sp)
      008A8E 27 08            [ 1] 1658     jreq 10$
      008A90 A6 2D            [ 1] 1659     ld a,#'-
      008A92 20 02            [ 2] 1660 	jra 9$ 
      008A94 A6 24            [ 1] 1661 8$: ld a,#'$ 
      008A96 5A               [ 2] 1662 9$: decw x
      008A97 F7               [ 1] 1663     ld (x),a
      008A98                       1664 10$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A98 5B 02            [ 2] 1665 	addw sp,#VSIZE
      008A9A 81               [ 4] 1666 	ret
                                   1667 
                                   1668 ;-------------------------------------
                                   1669 ; divide uint24_t by uint8_t
                                   1670 ; used to convert uint24_t to string
                                   1671 ; input:
                                   1672 ;	acc24	dividend
                                   1673 ;   A 		divisor
                                   1674 ; output:
                                   1675 ;   acc24	quotient
                                   1676 ;   A		remainder
                                   1677 ;------------------------------------- 
                                   1678 ; offset  on sp of arguments and locals
                           000001  1679 	U8   = 1   ; divisor on stack
                           000001  1680 	VSIZE =1
      008A9B                       1681 divu24_8:
      008A9B 89               [ 2] 1682 	pushw x ; save x
      008A9C 88               [ 1] 1683 	push a 
                                   1684 	; ld dividend UU:MM bytes in X
      008A9D C6 00 08         [ 1] 1685 	ld a, acc24
      008AA0 95               [ 1] 1686 	ld xh,a
      008AA1 C6 00 09         [ 1] 1687 	ld a,acc24+1
      008AA4 97               [ 1] 1688 	ld xl,a
      008AA5 7B 01            [ 1] 1689 	ld a,(U8,SP) ; divisor
      008AA7 62               [ 2] 1690 	div x,a ; UU:MM/U8
      008AA8 88               [ 1] 1691 	push a  ;save remainder
      008AA9 9E               [ 1] 1692 	ld a,xh
      008AAA C7 00 08         [ 1] 1693 	ld acc24,a
      008AAD 9F               [ 1] 1694 	ld a,xl
      008AAE C7 00 09         [ 1] 1695 	ld acc24+1,a
      008AB1 84               [ 1] 1696 	pop a
      008AB2 95               [ 1] 1697 	ld xh,a
      008AB3 C6 00 0A         [ 1] 1698 	ld a,acc24+2
      008AB6 97               [ 1] 1699 	ld xl,a
      008AB7 7B 01            [ 1] 1700 	ld a,(U8,sp) ; divisor
      008AB9 62               [ 2] 1701 	div x,a  ; R:LL/U8
      008ABA 6B 01            [ 1] 1702 	ld (U8,sp),a ; save remainder
      008ABC 9F               [ 1] 1703 	ld a,xl
      008ABD C7 00 0A         [ 1] 1704 	ld acc24+2,a
      008AC0 84               [ 1] 1705 	pop a
      008AC1 85               [ 2] 1706 	popw x
      008AC2 81               [ 4] 1707 	ret
                                   1708 
                                   1709 ;------------------------------------
                                   1710 ;  two's complement acc24
                                   1711 ;  input:
                                   1712 ;		acc24 variable
                                   1713 ;  output:
                                   1714 ;		acc24 variable
                                   1715 ;-------------------------------------
      008AC3                       1716 neg_acc24:
      008AC3 72 53 00 0A      [ 1] 1717 	cpl acc24+2
      008AC7 72 53 00 09      [ 1] 1718 	cpl acc24+1
      008ACB 72 53 00 08      [ 1] 1719 	cpl acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008ACF A6 01            [ 1] 1720 	ld a,#1
      008AD1 CB 00 0A         [ 1] 1721 	add a,acc24+2
      008AD4 C7 00 0A         [ 1] 1722 	ld acc24+2,a
      008AD7 4F               [ 1] 1723 	clr a
      008AD8 C9 00 09         [ 1] 1724 	adc a,acc24+1
      008ADB C7 00 09         [ 1] 1725 	ld acc24+1,a 
      008ADE 4F               [ 1] 1726 	clr a 
      008ADF C9 00 08         [ 1] 1727 	adc a,acc24 
      008AE2 C7 00 08         [ 1] 1728 	ld acc24,a 
      008AE5 81               [ 4] 1729 	ret
                                   1730 
                                   1731 
                                   1732 ;------------------------------------
                                   1733 ; read a line of text from terminal
                                   1734 ; input:
                                   1735 ;	none
                                   1736 ; local variable on stack:
                                   1737 ;	LL  line length
                                   1738 ;   RXCHAR last received chaaracte 
                                   1739 ; output:
                                   1740 ;   text in tib  buffer
                                   1741 ;------------------------------------
                                   1742 	; local variables
                           000001  1743 	LL_HB=1
                           000001  1744 	RXCHAR = 1 ; last char received
                           000002  1745 	LL = 2  ; accepted line length
                           000002  1746 	VSIZE=2 
      008AE6                       1747 readln:
      008AE6 5F               [ 1] 1748 	clrw x 
      008AE7 89               [ 2] 1749 	pushw x 
      008AE8 90 AE 16 C8      [ 2] 1750  	ldw y,#tib ; input buffer
      008AEC                       1751 readln_loop:
      008AEC CD 82 27         [ 4] 1752 	call getc
      008AEF 6B 01            [ 1] 1753 	ld (RXCHAR,sp),a
      008AF1 A1 0D            [ 1] 1754 	cp a,#CR
      008AF3 26 03            [ 1] 1755 	jrne 1$
      008AF5 CC 8B 61         [ 2] 1756 	jp readln_quit
      008AF8 A1 0A            [ 1] 1757 1$:	cp a,#NL
      008AFA 27 65            [ 1] 1758 	jreq readln_quit
      008AFC A1 08            [ 1] 1759 	cp a,#BSP
      008AFE 27 3D            [ 1] 1760 	jreq del_back
      008B00 A1 04            [ 1] 1761 	cp a,#CTRL_D
      008B02 27 2A            [ 1] 1762 	jreq del_ln
      008B04 A1 12            [ 1] 1763 	cp a,#CTRL_R 
      008B06 27 06            [ 1] 1764 	jreq reprint 
                                   1765 ;	cp a,#'[
                                   1766 ;	jreq ansi_seq
      008B08                       1767 final_test:
      008B08 A1 20            [ 1] 1768 	cp a,#SPACE
      008B0A 2A 40            [ 1] 1769 	jrpl accept_char
      008B0C 20 DE            [ 2] 1770 	jra readln_loop
      008B0E                       1771 ansi_seq:
                                   1772 ;	call getc
                                   1773 ;	cp a,#'C 
                                   1774 ;	jreq rigth_arrow
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1775 ;	cp a,#'D 
                                   1776 ;	jreq left_arrow 
                                   1777 ;	jra final_test
      008B0E                       1778 right_arrow:
                                   1779 ;	ld a,#BSP 
                                   1780 ;	call putc 
                                   1781 ;	jra realn_loop 
      008B0E                       1782 left_arrow:
                                   1783 
                                   1784 ;	jra readln_loop
      008B0E                       1785 reprint: 
      008B0E 0D 02            [ 1] 1786 	tnz (LL,sp)
      008B10 26 DA            [ 1] 1787 	jrne readln_loop
      008B12 AE 16 C8         [ 2] 1788 	ldw x,#tib 
      008B15 CD 82 F2         [ 4] 1789 	call strlen 
      008B18 90 AE 16 C8      [ 2] 1790 	ldw y,#tib 
      008B1C 9F               [ 1] 1791 	ld a,xl
      008B1D 27 CD            [ 1] 1792 	jreq readln_loop
      008B1F 6B 02            [ 1] 1793 	ld (LL,sp),a 
      008B21 AE 16 C8         [ 2] 1794 	ldw x,#tib 
      008B24 CD 82 30         [ 4] 1795 	call puts
      008B27 0F 01            [ 1] 1796 	clr (LL_HB,sp)
      008B29 72 F9 01         [ 2] 1797 	addw y,(LL_HB,sp)
      008B2C 20 BE            [ 2] 1798 	jra readln_loop 
      008B2E                       1799 del_ln:
      008B2E 7B 02            [ 1] 1800 	ld a,(LL,sp)
      008B30 CD 82 4A         [ 4] 1801 	call delete
      008B33 90 AE 16 C8      [ 2] 1802 	ldw y,#tib
      008B37 90 7F            [ 1] 1803 	clr (y)
      008B39 0F 02            [ 1] 1804 	clr (LL,sp)
      008B3B 20 AF            [ 2] 1805 	jra readln_loop
      008B3D                       1806 del_back:
      008B3D 0D 02            [ 1] 1807     tnz (LL,sp)
      008B3F 27 AB            [ 1] 1808     jreq readln_loop
      008B41 0A 02            [ 1] 1809     dec (LL,sp)
      008B43 90 5A            [ 2] 1810     decw y
      008B45 90 7F            [ 1] 1811     clr  (y)
      008B47 CD 82 3A         [ 4] 1812     call bksp 
      008B4A 20 A0            [ 2] 1813     jra readln_loop	
      008B4C                       1814 accept_char:
      008B4C A6 4F            [ 1] 1815 	ld a,#TIB_SIZE-1
      008B4E 11 02            [ 1] 1816 	cp a, (LL,sp)
      008B50 27 9A            [ 1] 1817 	jreq readln_loop
      008B52 7B 01            [ 1] 1818 	ld a,(RXCHAR,sp)
      008B54 90 F7            [ 1] 1819 	ld (y),a
      008B56 0C 02            [ 1] 1820 	inc (LL,sp)
      008B58 90 5C            [ 1] 1821 	incw y
      008B5A 90 7F            [ 1] 1822 	clr (y)
      008B5C CD 82 1E         [ 4] 1823 	call putc 
      008B5F 20 8B            [ 2] 1824 	jra readln_loop
      008B61                       1825 readln_quit:
      008B61 90 7F            [ 1] 1826 	clr (y)
      008B63 7B 02            [ 1] 1827 	ld a,(LL,sp)
      008B65 C7 00 04         [ 1] 1828 	ld count,a 
      000AE8                       1829 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B68 5B 02            [ 2]    1     addw sp,#VSIZE 
      008B6A A6 0D            [ 1] 1830 	ld a,#CR
      008B6C CD 82 1E         [ 4] 1831 	call putc
      008B6F 81               [ 4] 1832 	ret
                                   1833 
                           000001  1834 .if DEBUG 	
                                   1835 ;----------------------------
                                   1836 ; command interface
                                   1837 ; only 3 commands:
                                   1838 ;  'q' to resume application
                                   1839 ;  'p [addr]' to print memory values 
                                   1840 ;  's addr' to print string 
                                   1841 ;----------------------------
                                   1842 ;local variable 
                           000001  1843 	PSIZE=1
                           000001  1844 	VSIZE=1 
      008B70                       1845 cmd_itf:
      008B70 52 01            [ 2] 1846 	sub sp,#VSIZE 
      008B72 72 5F 00 11      [ 1] 1847 	clr farptr 
      008B76 72 5F 00 12      [ 1] 1848 	clr farptr+1 
      008B7A 72 5F 00 13      [ 1] 1849 	clr farptr+2  
      008B7E                       1850 repl:
      008B7E A6 0D            [ 1] 1851 	ld a,#CR 
      008B80 CD 82 1E         [ 4] 1852 	call putc 
      008B83 A6 3F            [ 1] 1853 	ld a,#'? 
      008B85 CD 82 1E         [ 4] 1854 	call putc
      008B88 72 5F 00 01      [ 1] 1855 	clr in.w 
      008B8C 72 5F 00 02      [ 1] 1856 	clr in 
      008B90 CD 8A E6         [ 4] 1857 	call readln
      008B93 90 AE 16 C8      [ 2] 1858 	ldw y,#tib  
      008B97 90 F6            [ 1] 1859 	ld a,(y)
      008B99 27 E3            [ 1] 1860 	jreq repl  
      008B9B 72 5C 00 02      [ 1] 1861 	inc in 
      008B9F CD 8F 20         [ 4] 1862 	call to_upper 
      008BA2 A1 51            [ 1] 1863 	cp a,#'Q 
      008BA4 26 17            [ 1] 1864 	jrne test_p
      008BA6                       1865 repl_exit:
      008BA6 72 5F 16 C8      [ 1] 1866 	clr tib 
      008BAA 72 5F 00 04      [ 1] 1867 	clr count 
      008BAE 72 5F 00 02      [ 1] 1868 	clr in 
      000B32                       1869 	_drop #VSIZE 	
      008BB2 5B 01            [ 2]    1     addw sp,##VSIZE 
      008BB4 81               [ 4] 1870 	ret  
      008BB5                       1871 invalid:
      008BB5 AE 8C 33         [ 2] 1872 	ldw x,#invalid_cmd 
      008BB8 CD 82 30         [ 4] 1873 	call puts 
      008BBB 20 C1            [ 2] 1874 	jra repl 
      008BBD                       1875 test_p:	
      008BBD A1 50            [ 1] 1876     cp a,#'P 
      008BBF 27 11            [ 1] 1877 	jreq mem_peek
      008BC1 A1 53            [ 1] 1878     cp a,#'S 
      008BC3 26 F0            [ 1] 1879 	jrne invalid 
      008BC5                       1880 print_string:	
      008BC5 CD 8D 5F         [ 4] 1881 	call get_token
      008BC8 A1 04            [ 1] 1882 	cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008BCA 26 E9            [ 1] 1883 	jrne invalid 
      008BCC CD 82 30         [ 4] 1884 	call puts
      008BCF CC 8B 7E         [ 2] 1885 	jp repl 	
      008BD2                       1886 mem_peek:
      008BD2 A6 20            [ 1] 1887 	ld a,#SPACE 
      008BD4 CD 8F D8         [ 4] 1888 	call skip  	 
      008BD7 72 B9 00 01      [ 2] 1889 	addw y,in.w 
      008BDB AE 17 18         [ 2] 1890 	ldw x,#pad 
      008BDE CD 83 10         [ 4] 1891 	call strcpy
      008BE1 CD 8F 2C         [ 4] 1892 	call atoi24 	
      008BE4 C6 00 08         [ 1] 1893 	ld a, acc24 
      008BE7 CA 00 09         [ 1] 1894 	or a,acc16 
      008BEA CA 00 0A         [ 1] 1895 	or a,acc8 
      008BED 26 02            [ 1] 1896 	jrne 1$ 
      008BEF 20 0C            [ 2] 1897 	jra peek_byte  
      008BF1 CE 00 08         [ 2] 1898 1$:	ldw x,acc24 
      008BF4 CF 00 11         [ 2] 1899 	ldw farptr,x 
      008BF7 C6 00 0A         [ 1] 1900 	ld a,acc8 
      008BFA C7 00 13         [ 1] 1901 	ld farptr+2,a 
      008BFD                       1902 peek_byte:
      008BFD CD 8C 42         [ 4] 1903 	call print_farptr 
      008C00 A6 08            [ 1] 1904 	ld a,#8 
      008C02 6B 01            [ 1] 1905 	ld (PSIZE,sp),a 
      008C04 5F               [ 1] 1906 	clrw x 
      008C05 CD 8C 5D         [ 4] 1907 1$:	call fetchc  
      008C08 89               [ 2] 1908 	pushw x 
      008C09 C7 00 0A         [ 1] 1909 	ld acc8,a 
      008C0C 5F               [ 1] 1910 	clrw x 
      008C0D CF 00 08         [ 2] 1911 	ldw acc24,x 
      008C10 A6 90            [ 1] 1912 	ld a,#16+128
      008C12 CD 89 B0         [ 4] 1913 	call prti24
      008C15 85               [ 2] 1914 	popw x 
      008C16 0A 01            [ 1] 1915 	dec (PSIZE,sp)
      008C18 26 EB            [ 1] 1916 	jrne 1$ 
      008C1A A6 08            [ 1] 1917 	ld a,#8 
      008C1C CB 00 13         [ 1] 1918 	add a,farptr+2 
      008C1F C7 00 13         [ 1] 1919 	ld farptr+2,a
      008C22 4F               [ 1] 1920 	clr a 
      008C23 C9 00 12         [ 1] 1921 	adc a,farptr+1 
      008C26 C7 00 12         [ 1] 1922 	ld farptr+1,a 
      008C29 4F               [ 1] 1923 	clr a 
      008C2A C9 00 11         [ 1] 1924 	adc a,farptr 
      008C2D C7 00 11         [ 1] 1925 	ld farptr,a 
      008C30 CC 8B 7E         [ 2] 1926 	jp repl  
                                   1927 
      008C33 6E 6F 74 20 61 20 63  1928 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1929 
                                   1930 ;----------------------------
                                   1931 ; display farptr address
                                   1932 ;----------------------------
      008C42                       1933 print_farptr:
      008C42 C6 00 13         [ 1] 1934 	ld a ,farptr+2 
      008C45 C7 00 0A         [ 1] 1935 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008C48 CE 00 11         [ 2] 1936 	ldw x,farptr 
      008C4B CF 00 08         [ 2] 1937 	ldw acc24,x 
      008C4E 5F               [ 1] 1938 	clrw x 
      008C4F A6 10            [ 1] 1939 	ld a,#16 
      008C51 CD 89 B0         [ 4] 1940 	call prti24
      008C54 A6 20            [ 1] 1941 	ld a,#SPACE 
      008C56 CD 82 1E         [ 4] 1942 	call putc 
      008C59 CD 82 1E         [ 4] 1943 	call putc 
      008C5C 81               [ 4] 1944 	ret
                                   1945 
                                   1946 ;------------------------------------
                                   1947 ; get byte at address farptr[X]
                                   1948 ; input:
                                   1949 ;	 farptr   address to peek
                                   1950 ;    X		  farptr index 	
                                   1951 ; output:
                                   1952 ;	 A 		  byte from memory  
                                   1953 ;    x		  incremented by 1
                                   1954 ;------------------------------------
      008C5D                       1955 fetchc: ; @C
      008C5D 92 AF 00 11      [ 5] 1956 	ldf a,([farptr],x)
      008C61 5C               [ 1] 1957 	incw x
      008C62 81               [ 4] 1958 	ret
                                   1959 
                                   1960 
                                   1961 ;------------------------------------
                                   1962 ; expect a number from command line 
                                   1963 ; next argument
                                   1964 ;  input:
                                   1965 ;	  none
                                   1966 ;  output:
                                   1967 ;    acc24   int24_t 
                                   1968 ;------------------------------------
      008C63                       1969 number::
      008C63 CD 8D 5F         [ 4] 1970 	call get_token
      008C66 CD 8F 2C         [ 4] 1971 	call atoi24
      008C69 81               [ 4] 1972 	ret
                                   1973 .endif ; DEBUG 
                                   1974 
                                   1975 ;------------------------------------
                                   1976 ; parse quoted string 
                                   1977 ; input:
                                   1978 ;   Y 	pointer to tib 
                                   1979 ;   X   pointer to pad
                                   1980 ; output:
                                   1981 ;	pad   parsed string
                                   1982 ;   TOS  char* to pad  
                                   1983 ;------------------------------------
                           000001  1984 	PREV = 1
                           000002  1985 	CURR =2 
                           000002  1986 	VSIZE=2 
      008C6A                       1987 parse_quote: ; { -- addr }
      000BEA                       1988 	_vars VSIZE 
      008C6A 52 02            [ 2]    1     sub sp,#VSIZE 
      008C6C 4F               [ 1] 1989 	clr a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008C6D 6B 01            [ 1] 1990 1$:	ld (PREV,sp),a 
      008C6F 72 5C 00 02      [ 1] 1991 2$:	inc in
      008C73 91 D6 01         [ 4] 1992 	ld a,([in.w],y)
      008C76 27 24            [ 1] 1993 	jreq 6$
      008C78 6B 02            [ 1] 1994 	ld (CURR,sp),a 
      008C7A A6 5C            [ 1] 1995 	ld a,#'\
      008C7C 11 01            [ 1] 1996 	cp a, (PREV,sp)
      008C7E 26 0A            [ 1] 1997 	jrne 3$
      008C80 0F 01            [ 1] 1998 	clr (PREV,sp)
      008C82 7B 02            [ 1] 1999 	ld a,(CURR,sp)
      008C84 AD 1F            [ 4] 2000 	callr convert_escape
      008C86 F7               [ 1] 2001 	ld (x),a 
      008C87 5C               [ 1] 2002 	incw x 
      008C88 20 E5            [ 2] 2003 	jra 2$
      008C8A                       2004 3$:
      008C8A 7B 02            [ 1] 2005 	ld a,(CURR,sp)
      008C8C A1 5C            [ 1] 2006 	cp a,#'\'
      008C8E 27 DD            [ 1] 2007 	jreq 1$
      008C90 A1 22            [ 1] 2008 	cp a,#'"
      008C92 27 04            [ 1] 2009 	jreq 5$ 
      008C94 F7               [ 1] 2010 	ld (x),a 
      008C95 5C               [ 1] 2011 	incw x 
      008C96 20 D7            [ 2] 2012 	jra 2$
      008C98 72 5C 00 02      [ 1] 2013 5$:	inc in 
      008C9C 7F               [ 1] 2014 6$: clr (x)
      008C9D AE 17 18         [ 2] 2015 	ldw x,#pad 
      000C20                       2016 	_drop VSIZE
      008CA0 5B 02            [ 2]    1     addw sp,#VSIZE 
      008CA2 A6 0A            [ 1] 2017 	ld a,#TK_QSTR  
      008CA4 81               [ 4] 2018 	ret 
                                   2019 
                                   2020 ;---------------------------------------
                                   2021 ; called by parse_quote
                                   2022 ; subtitute escaped character 
                                   2023 ; by their ASCII value .
                                   2024 ; input:
                                   2025 ;   A  character following '\'
                                   2026 ; output:
                                   2027 ;   A  substitued char or same if not valid.
                                   2028 ;---------------------------------------
      008CA5                       2029 convert_escape:
      008CA5 89               [ 2] 2030 	pushw x 
      008CA6 AE 8C BA         [ 2] 2031 	ldw x,#escaped 
      008CA9 F1               [ 1] 2032 1$:	cp a,(x)
      008CAA 27 06            [ 1] 2033 	jreq 2$
      008CAC 7D               [ 1] 2034 	tnz (x)
      008CAD 27 09            [ 1] 2035 	jreq 3$
      008CAF 5C               [ 1] 2036 	incw x 
      008CB0 20 F7            [ 2] 2037 	jra 1$
      008CB2 1D 8C BA         [ 2] 2038 2$: subw x,#escaped 
      008CB5 9F               [ 1] 2039 	ld a,xl 
      008CB6 AB 07            [ 1] 2040 	add a,#7
      008CB8 85               [ 2] 2041 3$:	popw x 
      008CB9 81               [ 4] 2042 	ret 
                                   2043 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008CBA 61 62 74 6E 76 66 72  2044 escaped: .asciz "abtnvfr"
             00
                                   2045 
                                   2046 ;-------------------------
                                   2047 ; integer parser 
                                   2048 ; input:
                                   2049 ;   X 		point to pad 
                                   2050 ;   Y 		point to tib 
                                   2051 ;   A 	    first digit|'$' 
                                   2052 ; output:  
                                   2053 ;   pad     number string 
                                   2054 ;   X 		integer 
                                   2055 ;   A 		TK_INTGR
                                   2056 ;-------------------------
                           000001  2057 	BASE=1
                           000002  2058 	TCHAR=2 
                           000002  2059 	VSIZE=2 
      008CC2                       2060 parse_integer: ; { -- n }
      008CC2 4B 00            [ 1] 2061 	push #0 ; TCHAR 
      008CC4 A1 24            [ 1] 2062 	cp a,#'$
      008CC6 27 04            [ 1] 2063 	jreq 1$ 
      008CC8 4B 0A            [ 1] 2064 	push #10 ; BASE=10 
      008CCA 20 02            [ 2] 2065 	jra 2$ 
      008CCC 4B 10            [ 1] 2066 1$: push #16  ; BASE=16
      008CCE F7               [ 1] 2067 2$:	ld (x),a 
      008CCF 5C               [ 1] 2068 	incw x 
      008CD0 72 5C 00 02      [ 1] 2069 	inc in 
      008CD4 91 D6 01         [ 4] 2070 	ld a,([in.w],y)
      008CD7 CD 8F 20         [ 4] 2071 	call to_upper 
      008CDA 6B 02            [ 1] 2072 	ld (TCHAR,sp),a 
      008CDC CD 8F 17         [ 4] 2073 	call is_digit 
      008CDF 25 ED            [ 1] 2074 	jrc 2$
      008CE1 A6 10            [ 1] 2075 	ld a,#16 
      008CE3 11 01            [ 1] 2076 	cp a,(BASE,sp)
      008CE5 26 0A            [ 1] 2077 	jrne 3$ 
      008CE7 7B 02            [ 1] 2078 	ld a,(TCHAR,sp)
      008CE9 A1 41            [ 1] 2079 	cp a,#'A 
      008CEB 2B 04            [ 1] 2080 	jrmi 3$ 
      008CED A1 47            [ 1] 2081 	cp a,#'G 
      008CEF 2B DD            [ 1] 2082 	jrmi 2$ 
      008CF1 7F               [ 1] 2083 3$:	clr (x)
      008CF2 CD 8F 2C         [ 4] 2084 	call atoi24
      008CF5 CE 00 09         [ 2] 2085 	ldw x,acc16 
      008CF8 A6 04            [ 1] 2086 	ld a,#TK_INTGR
      000C7A                       2087 	_drop VSIZE  
      008CFA 5B 02            [ 2]    1     addw sp,#VSIZE 
      008CFC 81               [ 4] 2088 	ret 	
                                   2089 
                                   2090 ;-------------------------
                                   2091 ; binary integer parser 
                                   2092 ; input:
                                   2093 ;   X 		point to pad 
                                   2094 ;   Y 		point to tib 
                                   2095 ;   A 	    '%' 
                                   2096 ; output:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2097 ;   pad     number string 
                                   2098 ;   X 		integer 
                                   2099 ;   A 		TK_INTGR
                                   2100 ;   TOS     integer 
                                   2101 ;-------------------------
                           000001  2102 	BINARY=1
                           000002  2103 	VSIZE=2
      008CFD                       2104 parse_binary: ; { -- n }
      008CFD 4B 00            [ 1] 2105 	push #0
      008CFF 4B 00            [ 1] 2106 	push #0
      008D01 F7               [ 1] 2107 1$: ld (x),a 
      008D02 5C               [ 1] 2108 	incw x 
      008D03 72 5C 00 02      [ 1] 2109 	inc in 
      008D07 91 D6 01         [ 4] 2110 	ld a,([in.w],y)
      008D0A A1 30            [ 1] 2111 	cp a,#'0 
      008D0C 27 06            [ 1] 2112 	jreq 2$
      008D0E A1 31            [ 1] 2113 	cp a,#'1 
      008D10 27 02            [ 1] 2114 	jreq 2$ 
      008D12 20 09            [ 2] 2115 	jra bin_exit 
      008D14 A0 30            [ 1] 2116 2$: sub a,#'0	
      008D16 46               [ 1] 2117 	rrc a 
      008D17 09 02            [ 1] 2118 	rlc (BINARY+1,sp)
      008D19 09 01            [ 1] 2119 	rlc (BINARY,sp)
      008D1B 20 E4            [ 2] 2120 	jra 1$  
      008D1D                       2121 bin_exit:
      008D1D 7F               [ 1] 2122 	clr (x)
      008D1E 1E 01            [ 2] 2123 	ldw x,(BINARY,sp)
      008D20 A6 04            [ 1] 2124 	ld a,#TK_INTGR 	
      000CA2                       2125 	_drop VSIZE 
      008D22 5B 02            [ 2]    1     addw sp,#VSIZE 
      008D24 81               [ 4] 2126 	ret
                                   2127 
                                   2128 ;---------------------------
                                   2129 ;  token begin with a letter,
                                   2130 ;  is keyword or variable. 	
                                   2131 ; input:
                                   2132 ;   X 		point to pad 
                                   2133 ;   Y 		point to text
                                   2134 ;   A 	    first letter  
                                   2135 ; output:
                                   2136 ;   X		exec_addr|var_addr 
                                   2137 ;   A 		TK_CMD 
                                   2138 ;   pad 	keyword|var_name  
                                   2139 ;   TOS     exec_addr|var_addr 
                                   2140 ;--------------------------  
      008D25                       2141 parse_keyword: ; { -- exec_addr|var_addr}
      008D25 CD 8F 20         [ 4] 2142 	call to_upper 
      008D28 F7               [ 1] 2143 	ld (x),a 
      008D29 5C               [ 1] 2144 	incw x 
      008D2A 72 5C 00 02      [ 1] 2145 	inc in 
      008D2E 91 D6 01         [ 4] 2146 	ld a,([in.w],y)
      008D31 CD 85 75         [ 4] 2147 	call is_alpha 
      008D34 25 EF            [ 1] 2148 	jrc parse_keyword 
      008D36 7F               [ 1] 2149 1$: clr (x)
      008D37 72 5D 17 19      [ 1] 2150 	tnz pad+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008D3B 26 15            [ 1] 2151 	jrne 2$
                                   2152 ; one letter variable name 
      008D3D C6 17 18         [ 1] 2153 	ld a,pad 
      008D40 A0 41            [ 1] 2154 	sub a,#'A 
      008D42 48               [ 1] 2155 	sll a 
      008D43 88               [ 1] 2156 	push a 
      008D44 4B 00            [ 1] 2157 	push #0
      008D46 AE 00 22         [ 2] 2158 	ldw x,#vars 
      008D49 72 FB 01         [ 2] 2159 	addw x,(1,sp) ; X=var address 
      000CCC                       2160 	_drop 2 
      008D4C 5B 02            [ 2]    1     addw sp,#2 
      008D4E A6 05            [ 1] 2161 	ld a,#TK_VAR 
      008D50 20 0C            [ 2] 2162 	jra 4$ 
      008D52                       2163 2$: ; check for keyword, otherwise syntax error.
      000CD2                       2164 	_ldx_dict kword_dict
      008D52 AE A1 BC         [ 2]    1     ldw x,#kword_dict+2
      008D55 CD 91 BC         [ 4] 2165 	call search_dict
      008D58 4D               [ 1] 2166 	tnz a
      008D59 26 03            [ 1] 2167 	jrne 4$ 
      008D5B CC 87 7F         [ 2] 2168 	jp syntax_error
      008D5E 81               [ 4] 2169 4$:	ret  	
                                   2170 
                                   2171 
                                   2172 ;------------------------------------
                                   2173 ; Command line tokenizer
                                   2174 ; scan text for next token
                                   2175 ; move token in 'pad'
                                   2176 ; input: 
      008D5F                       2177 	none: 
                                   2178 ; use:
                                   2179 ;	Y   pointer to text
                                   2180 ;   X	pointer to pad 
                                   2181 ;   in.w   index in text buffer
                                   2182 ; output:
                                   2183 ;   A       token attribute 
                                   2184 ;   pad 	token as .asciz
                                   2185 ;   X 		token value   
                                   2186 ;------------------------------------
                                   2187 	; use to check special character 
                                   2188 	.macro _case c t  
                                   2189 	ld a,#c 
                                   2190 	cp a,(TCHAR,sp) 
                                   2191 	jrne t
                                   2192 	.endm 
                                   2193 
                           000001  2194 	TCHAR=1
                           000002  2195 	ATTRIB=2 
                           000002  2196 	VSIZE=2
      008D5F                       2197 get_token: 
      008D5F 90 AE 16 C8      [ 2] 2198 	ldw y,#tib    	
      008D63 C6 00 02         [ 1] 2199 	ld a,in 
      008D66 C1 00 04         [ 1] 2200 	cp a,count 
      008D69 2B 03            [ 1] 2201 	jrmi 1$
      008D6B A6 00            [ 1] 2202 	ld a,#TK_NONE 
      008D6D 81               [ 4] 2203 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008D6E                       2204 1$:	
      000CEE                       2205 	_vars VSIZE
      008D6E 52 02            [ 2]    1     sub sp,#VSIZE 
      008D70 AE 17 18         [ 2] 2206 	ldw x, #pad
      008D73 A6 20            [ 1] 2207 	ld a,#SPACE
      008D75 CD 8F D8         [ 4] 2208 	call skip
      008D78 55 00 02 00 03   [ 1] 2209 	mov in.saved,in 
      008D7D 91 D6 01         [ 4] 2210 	ld a,([in.w],y)
      008D80 26 07            [ 1] 2211 	jrne str_tst
      008D82 72 5F 17 18      [ 1] 2212 	clr pad 
      008D86 CC 8F 14         [ 2] 2213 	jp token_exit ; end of line 
                                   2214 
      008D89                       2215 str_tst: ; check for quoted string  	
      008D89 CD 8F 20         [ 4] 2216 	call to_upper 
      008D8C 6B 01            [ 1] 2217 	ld (TCHAR,sp),a 
      000D0E                       2218 	_case '"' nbr_tst
      008D8E A6 22            [ 1]    1 	ld a,#'"' 
      008D90 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D92 26 06            [ 1]    3 	jrne nbr_tst
      008D94 CD 8C 6A         [ 4] 2219 	call parse_quote
      008D97 CC 8F 14         [ 2] 2220 	jp token_exit
      008D9A                       2221 nbr_tst: ; check for number 
      008D9A A6 24            [ 1] 2222 	ld a,#'$'
      008D9C 11 01            [ 1] 2223 	cp a,(TCHAR,sp) 
      008D9E 27 13            [ 1] 2224 	jreq 1$
      008DA0 A6 26            [ 1] 2225 	ld a,#'&
      008DA2 11 01            [ 1] 2226 	cp a,(TCHAR,sp)
      008DA4 26 06            [ 1] 2227 	jrne 0$
      008DA6 CD 8C FD         [ 4] 2228 	call parse_binary ; expect binary integer 
      008DA9 CC 8F 14         [ 2] 2229 	jp token_exit 
      008DAC 7B 01            [ 1] 2230 0$:	ld a,(TCHAR,sp)
      008DAE CD 8F 17         [ 4] 2231 	call is_digit
      008DB1 24 06            [ 1] 2232 	jrnc 3$
      008DB3 CD 8C C2         [ 4] 2233 1$:	call parse_integer 
      008DB6 CC 8F 14         [ 2] 2234 	jp token_exit 
      008DB9                       2235 3$: 
      000D39                       2236 	_case '(' bkslsh_tst 
      008DB9 A6 28            [ 1]    1 	ld a,#'(' 
      008DBB 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DBD 26 05            [ 1]    3 	jrne bkslsh_tst
      008DBF A6 0B            [ 1] 2237 	ld a,#TK_LPAREN
      008DC1 CC 8F 04         [ 2] 2238 	jp token_char   	
      008DC4                       2239 bkslsh_tst:
      000D44                       2240 	_case '\',rparnt_tst
      008DC4 A6 5C            [ 1]    1 	ld a,#'\' 
      008DC6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC8 26 18            [ 1]    3 	jrne rparnt_tst
      008DCA 7B 01            [ 1] 2241 	ld a,(TCHAR,sp)
      008DCC F7               [ 1] 2242 	ld (x),a 
      008DCD 5C               [ 1] 2243 	incw x 
      008DCE 72 5C 00 02      [ 1] 2244 	inc in 
      008DD2 91 D6 01         [ 4] 2245 	ld a,([in.w],y)
      008DD5 F7               [ 1] 2246 	ld (x),a 
      008DD6 5C               [ 1] 2247 	incw x 
      008DD7 72 5C 00 02      [ 1] 2248 	inc in  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008DDB 7F               [ 1] 2249 	clr (x) 
      008DDC 97               [ 1] 2250 	ld xl,a 
      008DDD A6 03            [ 1] 2251 	ld a,#TK_CHAR 
      008DDF CC 8F 14         [ 2] 2252 	jp token_exit 
      008DE2                       2253 rparnt_tst:		
      000D62                       2254 	_case ')' colon_tst 
      008DE2 A6 29            [ 1]    1 	ld a,#')' 
      008DE4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE6 26 05            [ 1]    3 	jrne colon_tst
      008DE8 A6 0C            [ 1] 2255 	ld a,#TK_RPAREN 
      008DEA CC 8F 04         [ 2] 2256 	jp token_char 
      008DED                       2257 colon_tst:
      000D6D                       2258 	_case ':' comma_tst 
      008DED A6 3A            [ 1]    1 	ld a,#':' 
      008DEF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF1 26 05            [ 1]    3 	jrne comma_tst
      008DF3 A6 01            [ 1] 2259 	ld a,#TK_COLON 
      008DF5 CC 8F 04         [ 2] 2260 	jp token_char 
      008DF8                       2261 comma_tst:
      000D78                       2262 	_case COMMA sharp_tst 
      008DF8 A6 2C            [ 1]    1 	ld a,#COMMA 
      008DFA 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DFC 26 05            [ 1]    3 	jrne sharp_tst
      008DFE A6 0D            [ 1] 2263 	ld a,#TK_COMMA
      008E00 CC 8F 04         [ 2] 2264 	jp token_char
      008E03                       2265 sharp_tst:
      000D83                       2266 	_case SHARP dash_tst 
      008E03 A6 23            [ 1]    1 	ld a,#SHARP 
      008E05 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E07 26 05            [ 1]    3 	jrne dash_tst
      008E09 A6 0E            [ 1] 2267 	ld a,#TK_SHARP
      008E0B CC 8F 04         [ 2] 2268 	jp token_char  	 	 
      008E0E                       2269 dash_tst: 	
      000D8E                       2270 	_case '-' at_tst 
      008E0E A6 2D            [ 1]    1 	ld a,#'-' 
      008E10 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E12 26 05            [ 1]    3 	jrne at_tst
      008E14 A6 11            [ 1] 2271 	ld a,#TK_MINUS  
      008E16 CC 8F 04         [ 2] 2272 	jp token_char 
      008E19                       2273 at_tst:
      000D99                       2274 	_case '@' qmark_tst 
      008E19 A6 40            [ 1]    1 	ld a,#'@' 
      008E1B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E1D 26 05            [ 1]    3 	jrne qmark_tst
      008E1F A6 02            [ 1] 2275 	ld a,#TK_ARRAY 
      008E21 CC 8F 04         [ 2] 2276 	jp token_char
      008E24                       2277 qmark_tst:
      000DA4                       2278 	_case '?' tick_tst 
      008E24 A6 3F            [ 1]    1 	ld a,#'?' 
      008E26 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E28 26 11            [ 1]    3 	jrne tick_tst
      008E2A 7B 01            [ 1] 2279 	ld a,(TCHAR,sp)
      008E2C F7               [ 1] 2280 	ld (x),a 
      008E2D 5C               [ 1] 2281 	incw x 
      008E2E 7F               [ 1] 2282 	clr (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008E2F 72 5C 00 02      [ 1] 2283 	inc in 
      008E33 A6 06            [ 1] 2284 	ld a,#TK_CMD 
      008E35 AE 96 66         [ 2] 2285 	ldw x,#print 
      008E38 CC 8F 14         [ 2] 2286 	jp token_exit
      008E3B                       2287 tick_tst: ; ignore comment 
      000DBB                       2288 	_case TICK plus_tst 
      008E3B A6 27            [ 1]    1 	ld a,#TICK 
      008E3D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E3F 26 0C            [ 1]    3 	jrne plus_tst
      008E41 72 5C 00 02      [ 1] 2289 	inc in 
      008E45 A6 06            [ 1] 2290 	ld a,#TK_CMD 
      008E47 AE 97 6B         [ 2] 2291 	ldw x,#rem 
      008E4A CC 8F 14         [ 2] 2292 	jp token_exit 
      008E4D                       2293 plus_tst:
      000DCD                       2294 	_case '+' star_tst 
      008E4D A6 2B            [ 1]    1 	ld a,#'+' 
      008E4F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E51 26 05            [ 1]    3 	jrne star_tst
      008E53 A6 10            [ 1] 2295 	ld a,#TK_PLUS  
      008E55 CC 8F 04         [ 2] 2296 	jp token_char 
      008E58                       2297 star_tst:
      000DD8                       2298 	_case '*' slash_tst 
      008E58 A6 2A            [ 1]    1 	ld a,#'*' 
      008E5A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E5C 26 05            [ 1]    3 	jrne slash_tst
      008E5E A6 20            [ 1] 2299 	ld a,#TK_MULT 
      008E60 CC 8F 04         [ 2] 2300 	jp token_char 
      008E63                       2301 slash_tst: 
      000DE3                       2302 	_case '/' prcnt_tst 
      008E63 A6 2F            [ 1]    1 	ld a,#'/' 
      008E65 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E67 26 05            [ 1]    3 	jrne prcnt_tst
      008E69 A6 21            [ 1] 2303 	ld a,#TK_DIV 
      008E6B CC 8F 04         [ 2] 2304 	jp token_char 
      008E6E                       2305 prcnt_tst:
      000DEE                       2306 	_case '%' eql_tst 
      008E6E A6 25            [ 1]    1 	ld a,#'%' 
      008E70 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E72 26 05            [ 1]    3 	jrne eql_tst
      008E74 A6 22            [ 1] 2307 	ld a,#TK_MOD
      008E76 CC 8F 04         [ 2] 2308 	jp token_char  
                                   2309 ; 1 or 2 character tokens 	
      008E79                       2310 eql_tst:
      000DF9                       2311 	_case '=' gt_tst 		
      008E79 A6 3D            [ 1]    1 	ld a,#'=' 
      008E7B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E7D 26 05            [ 1]    3 	jrne gt_tst
      008E7F A6 32            [ 1] 2312 	ld a,#TK_EQUAL
      008E81 CC 8F 04         [ 2] 2313 	jp token_char 
      008E84                       2314 gt_tst:
      000E04                       2315 	_case '>' lt_tst 
      008E84 A6 3E            [ 1]    1 	ld a,#'>' 
      008E86 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E88 26 33            [ 1]    3 	jrne lt_tst
      008E8A A6 31            [ 1] 2316 	ld a,#TK_GT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008E8C 6B 02            [ 1] 2317 	ld (ATTRIB,sp),a 
      008E8E 72 5C 00 02      [ 1] 2318 	inc in 
      008E92 91 D6 01         [ 4] 2319 	ld a,([in.w],y)
      008E95 A1 3D            [ 1] 2320 	cp a,#'=
      008E97 26 0C            [ 1] 2321 	jrne 1$
      008E99 7B 01            [ 1] 2322 	ld a,(TCHAR,sp)
      008E9B F7               [ 1] 2323 	ld (x),a
      008E9C 5C               [ 1] 2324 	incw x 
      008E9D A6 3D            [ 1] 2325 	ld a,#'=
      008E9F 6B 01            [ 1] 2326 	ld (TCHAR,sp),a 
      008EA1 A6 33            [ 1] 2327 	ld a,#TK_GE 
      008EA3 20 5F            [ 2] 2328 	jra token_char  
      008EA5 A1 3C            [ 1] 2329 1$: cp a,#'<
      008EA7 26 0C            [ 1] 2330 	jrne 2$
      008EA9 7B 01            [ 1] 2331 	ld a,(TCHAR,sp)
      008EAB F7               [ 1] 2332 	ld (x),a
      008EAC 5C               [ 1] 2333 	incw x 
      008EAD A6 3C            [ 1] 2334 	ld a,#'<	
      008EAF 6B 01            [ 1] 2335 	ld (TCHAR,sp),a 
      008EB1 A6 35            [ 1] 2336 	ld a,#TK_NE 
      008EB3 20 4F            [ 2] 2337 	jra token_char 
      008EB5 72 5A 00 02      [ 1] 2338 2$: dec in
      008EB9 7B 02            [ 1] 2339 	ld a,(ATTRIB,sp)
      008EBB 20 47            [ 2] 2340 	jra token_char 
      008EBD                       2341 lt_tst:
      000E3D                       2342 	_case '<' other
      008EBD A6 3C            [ 1]    1 	ld a,#'<' 
      008EBF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008EC1 26 32            [ 1]    3 	jrne other
      008EC3 A6 34            [ 1] 2343 	ld a,#TK_LT 
      008EC5 6B 02            [ 1] 2344 	ld (ATTRIB,sp),a 
      008EC7 72 5C 00 02      [ 1] 2345 	inc in 
      008ECB 91 D6 01         [ 4] 2346 	ld a,([in.w],y)
      008ECE A1 3D            [ 1] 2347 	cp a,#'=
      008ED0 26 0B            [ 1] 2348 	jrne 1$
      008ED2 7B 01            [ 1] 2349 	ld a,(TCHAR,sp)
      008ED4 F7               [ 1] 2350 	ld (x),a 
      008ED5 A6 3D            [ 1] 2351 	ld a,#'=
      008ED7 6B 01            [ 1] 2352 	ld (TCHAR,sp),a 
      008ED9 A6 36            [ 1] 2353 	ld a,#TK_LE 
      008EDB 20 27            [ 2] 2354 	jra token_char 
      008EDD A1 3E            [ 1] 2355 1$: cp a,#'>
      008EDF 26 0C            [ 1] 2356 	jrne 2$
      008EE1 7B 01            [ 1] 2357 	ld a,(TCHAR,sp)
      008EE3 F7               [ 1] 2358 	ld (x),a 
      008EE4 5C               [ 1] 2359 	incw x 
      008EE5 A6 3E            [ 1] 2360 	ld a,#'>
      008EE7 6B 01            [ 1] 2361 	ld (TCHAR,sp),a 
      008EE9 A6 35            [ 1] 2362 	ld a,#TK_NE 
      008EEB 20 17            [ 2] 2363 	jra token_char 
      008EED 72 5A 00 02      [ 1] 2364 2$: dec in 
      008EF1 7B 02            [ 1] 2365 	ld a,(ATTRIB,sp)
      008EF3 20 0F            [ 2] 2366 	jra token_char 	
      008EF5                       2367 other: ; not a special character 	 
      008EF5 7B 01            [ 1] 2368 	ld a,(TCHAR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008EF7 CD 85 75         [ 4] 2369 	call is_alpha 
      008EFA 25 03            [ 1] 2370 	jrc 30$ 
      008EFC CC 87 7F         [ 2] 2371 	jp syntax_error 
      008EFF                       2372 30$: 
      008EFF CD 8D 25         [ 4] 2373 	call parse_keyword
      008F02 20 10            [ 2] 2374 	jra token_exit 
      008F04                       2375 token_char:
      008F04 6B 02            [ 1] 2376 	ld (ATTRIB,sp),a 
      008F06 7B 01            [ 1] 2377 	ld a,(TCHAR,sp)
      008F08 F7               [ 1] 2378 	ld (x),a 
      008F09 5C               [ 1] 2379 	incw x 
      008F0A 7F               [ 1] 2380 	clr(x)
      008F0B 72 5C 00 02      [ 1] 2381 	inc in 
      008F0F 7B 02            [ 1] 2382 	ld a,(ATTRIB,sp)
      008F11 AE 17 18         [ 2] 2383 	ldw x,#pad 
      008F14                       2384 token_exit:
      000E94                       2385 	_drop VSIZE 
      008F14 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F16 81               [ 4] 2386 	ret
                                   2387 
                                   2388 
                                   2389 
                                   2390 ;------------------------------------
                                   2391 ; check if character in {'0'..'9'}
                                   2392 ; input:
                                   2393 ;    A  character to test
                                   2394 ; output:
                                   2395 ;    Carry  0 not digit | 1 digit
                                   2396 ;------------------------------------
      008F17                       2397 is_digit:
      008F17 A1 30            [ 1] 2398 	cp a,#'0
      008F19 25 03            [ 1] 2399 	jrc 1$
      008F1B A1 3A            [ 1] 2400     cp a,#'9+1
      008F1D 8C               [ 1] 2401 	ccf 
      008F1E 8C               [ 1] 2402 1$:	ccf 
      008F1F 81               [ 4] 2403     ret
                                   2404 
                                   2405 ;------------------------------------
                                   2406 ; convert alpha to uppercase
                                   2407 ; input:
                                   2408 ;    a  character to convert
                                   2409 ; output:
                                   2410 ;    a  uppercase character
                                   2411 ;------------------------------------
      008F20                       2412 to_upper::
      008F20 A1 61            [ 1] 2413 	cp a,#'a
      008F22 2A 01            [ 1] 2414 	jrpl 1$
      008F24 81               [ 4] 2415 0$:	ret
      008F25 A1 7A            [ 1] 2416 1$: cp a,#'z	
      008F27 22 FB            [ 1] 2417 	jrugt 0$
      008F29 A0 20            [ 1] 2418 	sub a,#32
      008F2B 81               [ 4] 2419 	ret
                                   2420 	
                                   2421 ;------------------------------------
                                   2422 ; convert pad content in integer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2423 ; input:
                                   2424 ;    pad		.asciz to convert
                                   2425 ; output:
                                   2426 ;    acc24      int24_t
                                   2427 ;------------------------------------
                                   2428 	; local variables
                           000001  2429 	SIGN=1 ; 1 byte, 
                           000002  2430 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2431 	TEMP=3 ; 1 byte, temporary storage
                           000003  2432 	VSIZE=3 ; 3 bytes reserved for local storage
      008F2C                       2433 atoi24:
      008F2C 89               [ 2] 2434 	pushw x ;save x
      008F2D 52 03            [ 2] 2435 	sub sp,#VSIZE
                                   2436 	; acc24=0 
      008F2F 72 5F 00 08      [ 1] 2437 	clr acc24    
      008F33 72 5F 00 09      [ 1] 2438 	clr acc16
      008F37 72 5F 00 0A      [ 1] 2439 	clr acc8 
      008F3B C6 17 18         [ 1] 2440 	ld a, pad 
      008F3E 27 5A            [ 1] 2441 	jreq atoi_exit
      008F40 0F 01            [ 1] 2442 	clr (SIGN,sp)
      008F42 A6 0A            [ 1] 2443 	ld a,#10
      008F44 6B 02            [ 1] 2444 	ld (BASE,sp),a ; default base decimal
      008F46 AE 17 18         [ 2] 2445 	ldw x,#pad ; pointer to string to convert
      008F49 F6               [ 1] 2446 	ld a,(x)
      008F4A 27 47            [ 1] 2447 	jreq 9$  ; completed if 0
      008F4C A1 2D            [ 1] 2448 	cp a,#'-
      008F4E 26 04            [ 1] 2449 	jrne 1$
      008F50 03 01            [ 1] 2450 	cpl (SIGN,sp)
      008F52 20 08            [ 2] 2451 	jra 2$
      008F54 A1 24            [ 1] 2452 1$: cp a,#'$
      008F56 26 06            [ 1] 2453 	jrne 3$
      008F58 A6 10            [ 1] 2454 	ld a,#16
      008F5A 6B 02            [ 1] 2455 	ld (BASE,sp),a
      008F5C 5C               [ 1] 2456 2$:	incw x
      008F5D F6               [ 1] 2457 	ld a,(x)
      008F5E                       2458 3$:	
      008F5E A1 61            [ 1] 2459 	cp a,#'a
      008F60 2B 02            [ 1] 2460 	jrmi 4$
      008F62 A0 20            [ 1] 2461 	sub a,#32
      008F64 A1 30            [ 1] 2462 4$:	cp a,#'0
      008F66 2B 2B            [ 1] 2463 	jrmi 9$
      008F68 A0 30            [ 1] 2464 	sub a,#'0
      008F6A A1 0A            [ 1] 2465 	cp a,#10
      008F6C 2B 06            [ 1] 2466 	jrmi 5$
      008F6E A0 07            [ 1] 2467 	sub a,#7
      008F70 11 02            [ 1] 2468 	cp a,(BASE,sp)
      008F72 2A 1F            [ 1] 2469 	jrpl 9$
      008F74 6B 03            [ 1] 2470 5$:	ld (TEMP,sp),a
      008F76 7B 02            [ 1] 2471 	ld a,(BASE,sp)
      008F78 CD 8F 9E         [ 4] 2472 	call mulu24_8
      008F7B 7B 03            [ 1] 2473 	ld a,(TEMP,sp)
      008F7D CB 00 0A         [ 1] 2474 	add a,acc24+2
      008F80 C7 00 0A         [ 1] 2475 	ld acc24+2,a
      008F83 4F               [ 1] 2476 	clr a
      008F84 C9 00 09         [ 1] 2477 	adc a,acc24+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008F87 C7 00 09         [ 1] 2478 	ld acc24+1,a
      008F8A 4F               [ 1] 2479 	clr a
      008F8B C9 00 08         [ 1] 2480 	adc a,acc24
      008F8E C7 00 08         [ 1] 2481 	ld acc24,a
      008F91 20 C9            [ 2] 2482 	jra 2$
      008F93 0D 01            [ 1] 2483 9$:	tnz (SIGN,sp)
      008F95 27 03            [ 1] 2484     jreq atoi_exit
      008F97 CD 8A C3         [ 4] 2485     call neg_acc24
      008F9A                       2486 atoi_exit: 
      008F9A 5B 03            [ 2] 2487 	addw sp,#VSIZE
      008F9C 85               [ 2] 2488 	popw x ; restore x
      008F9D 81               [ 4] 2489 	ret
                                   2490 
                                   2491 ;--------------------------------------
                                   2492 ; unsigned multiply uint24_t by uint8_t
                                   2493 ; use to convert numerical string to uint24_t
                                   2494 ; input:
                                   2495 ;	acc24	uint24_t 
                                   2496 ;   A		uint8_t
                                   2497 ; output:
                                   2498 ;   acc24   A*acc24
                                   2499 ;-------------------------------------
                                   2500 ; local variables offset  on sp
                           000003  2501 	U8   = 3   ; A pushed on stack
                           000002  2502 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2503 	OVFH = 1  ; multiplication overflow high byte
                           000003  2504 	VSIZE = 3
      008F9E                       2505 mulu24_8:
      008F9E 89               [ 2] 2506 	pushw x    ; save X
                                   2507 	; local variables
      008F9F 88               [ 1] 2508 	push a     ; U8
      008FA0 5F               [ 1] 2509 	clrw x     ; initialize overflow to 0
      008FA1 89               [ 2] 2510 	pushw x    ; multiplication overflow
                                   2511 ; multiply low byte.
      008FA2 C6 00 0A         [ 1] 2512 	ld a,acc24+2
      008FA5 97               [ 1] 2513 	ld xl,a
      008FA6 7B 03            [ 1] 2514 	ld a,(U8,sp)
      008FA8 42               [ 4] 2515 	mul x,a
      008FA9 9F               [ 1] 2516 	ld a,xl
      008FAA C7 00 0A         [ 1] 2517 	ld acc24+2,a
      008FAD 9E               [ 1] 2518 	ld a, xh
      008FAE 6B 02            [ 1] 2519 	ld (OVFL,sp),a
                                   2520 ; multipy middle byte
      008FB0 C6 00 09         [ 1] 2521 	ld a,acc24+1
      008FB3 97               [ 1] 2522 	ld xl,a
      008FB4 7B 03            [ 1] 2523 	ld a, (U8,sp)
      008FB6 42               [ 4] 2524 	mul x,a
                                   2525 ; add overflow to this partial product
      008FB7 72 FB 01         [ 2] 2526 	addw x,(OVFH,sp)
      008FBA 9F               [ 1] 2527 	ld a,xl
      008FBB C7 00 09         [ 1] 2528 	ld acc24+1,a
      008FBE 4F               [ 1] 2529 	clr a
      008FBF A9 00            [ 1] 2530 	adc a,#0
      008FC1 6B 01            [ 1] 2531 	ld (OVFH,sp),a
      008FC3 9E               [ 1] 2532 	ld a,xh
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008FC4 6B 02            [ 1] 2533 	ld (OVFL,sp),a
                                   2534 ; multiply most signficant byte	
      008FC6 C6 00 08         [ 1] 2535 	ld a, acc24
      008FC9 97               [ 1] 2536 	ld xl, a
      008FCA 7B 03            [ 1] 2537 	ld a, (U8,sp)
      008FCC 42               [ 4] 2538 	mul x,a
      008FCD 72 FB 01         [ 2] 2539 	addw x, (OVFH,sp)
      008FD0 9F               [ 1] 2540 	ld a, xl
      008FD1 C7 00 08         [ 1] 2541 	ld acc24,a
      008FD4 5B 03            [ 2] 2542     addw sp,#VSIZE
      008FD6 85               [ 2] 2543 	popw x
      008FD7 81               [ 4] 2544 	ret
                                   2545 
                                   2546 ;------------------------------------
                                   2547 ; skip character c in text starting from 'in'
                                   2548 ; input:
                                   2549 ;	 y 		point to text buffer
                                   2550 ;    a 		character to skip
                                   2551 ; output:  
                                   2552 ;	'in' ajusted to new position
                                   2553 ;------------------------------------
                           000001  2554 	C = 1 ; local var
      008FD8                       2555 skip:
      008FD8 88               [ 1] 2556 	push a
      008FD9 91 D6 01         [ 4] 2557 1$:	ld a,([in.w],y)
      008FDC 27 0A            [ 1] 2558 	jreq 2$
      008FDE 11 01            [ 1] 2559 	cp a,(C,sp)
      008FE0 26 06            [ 1] 2560 	jrne 2$
      008FE2 72 5C 00 02      [ 1] 2561 	inc in
      008FE6 20 F1            [ 2] 2562 	jra 1$
      000F68                       2563 2$: _drop 1 
      008FE8 5B 01            [ 2]    1     addw sp,#1 
      008FEA 81               [ 4] 2564 	ret
                                   2565 	
                                   2566 ;------------------------------
                                   2567 ; restore 'in.w' variable to 
                                   2568 ; its value before last call
                                   2569 ; to get_token.
                                   2570 ;------------------------------
      008FEB                       2571 unget_token:
      008FEB 55 00 03 00 02   [ 1] 2572 	mov in,in.saved
      008FF0 81               [ 4] 2573 	ret 
                                   2574 
                                   2575 
                                   2576 ;******************************
                                   2577 ;  data stack manipulation
                                   2578 ;*****************************
                                   2579 ;----------------------	
                                   2580 ; push X on data stack 
                                   2581 ; input:
                                   2582 ;	X 
                                   2583 ; output:
                                   2584 ;	none 
                                   2585 ;----------------------	
      008FF1                       2586 dpush:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      000F71                       2587     _dp_down
      008FF1 72 5A 00 18      [ 1]    1     dec dstkptr+1 
      008FF5 72 5A 00 18      [ 1]    2     dec dstkptr+1
      008FF9 72 CF 00 17      [ 5] 2588     ldw [dstkptr],x  
      008FFD 81               [ 4] 2589 	ret 
                                   2590 
                                   2591 
                                   2592 ;----------------------	
                                   2593 ; pop data stack in X 
                                   2594 ; input:
                                   2595 ;	none
                                   2596 ; output:
                                   2597 ;	X   
                                   2598 ;----------------------	
      008FFE                       2599 dpop: 
      008FFE 72 CE 00 17      [ 5] 2600     ldw x, [dstkptr]
      000F82                       2601 	_dp_up
      009002 72 5C 00 18      [ 1]    1     inc dstkptr+1
      009006 72 5C 00 18      [ 1]    2     inc dstkptr+1
      00900A 81               [ 4] 2602 	ret 
                                   2603 
                                   2604 ;-----------------------------
                                   2605 ; swap top 2 elements of dstack
                                   2606 ;  {n1 n2 -- n2 n1 }
                                   2607 ;-----------------------------
      00900B                       2608 dswap:
      00900B 72 CE 00 17      [ 5] 2609 	ldw x,[dstkptr]
      00900F 89               [ 2] 2610 	pushw x 
      009010 AE 00 02         [ 2] 2611 	ldw x,#2 
      009013 72 DE 00 17      [ 5] 2612 	ldw x,([dstkptr],x) 
      009017 72 CF 00 17      [ 5] 2613 	ldw [dstkptr],x 
      00901B AE 00 02         [ 2] 2614 	ldw x,#2
      00901E 90 85            [ 2] 2615 	popw y 
      009020 72 DF 00 17      [ 5] 2616 	ldw ([dstkptr],x),y 
      009024 81               [ 4] 2617 	ret
                                   2618 
                                   2619 ;-----------------------------
                                   2620 ; drop TOS 
                                   2621 ;-----------------------------
      009025                       2622 ddrop: ; { n -- }
      000FA5                       2623 	_dp_up 
      009025 72 5C 00 18      [ 1]    1     inc dstkptr+1
      009029 72 5C 00 18      [ 1]    2     inc dstkptr+1
      00902D 81               [ 4] 2624 	ret
                                   2625 	
                                   2626 ;-----------------------------
                                   2627 ; duplicate TOS 
                                   2628 ;  dstack: { ix...n -- ix...n n }
                                   2629 ;-----------------------------
      00902E                       2630 ddup:
      00902E 72 CE 00 17      [ 5] 2631 	ldw x,[dstkptr]
      000FB2                       2632 	_dp_down
      009032 72 5A 00 18      [ 1]    1     dec dstkptr+1 
      009036 72 5A 00 18      [ 1]    2     dec dstkptr+1
      00903A 72 CF 00 17      [ 5] 2633     ldw [dstkptr],x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      00903E 81               [ 4] 2634 	ret 
                                   2635 
                                   2636 
                                   2637 ;----------------------------------
                                   2638 ; pick value n from dstack 
                                   2639 ; put it on TOS
                                   2640 ; dstack: {ix,..,p -- ix,...,np }
                                   2641 ;-----------------------------------
      00903F                       2642 dpick:
      00903F 72 CE 00 17      [ 5] 2643 	ldw x,[dstkptr]
      009043 58               [ 2] 2644 	sllw x 
      009044 72 BB 00 17      [ 2] 2645 	addw x,dstkptr 
      009048 FE               [ 2] 2646 	ldw x,(x)
      009049 72 CF 00 17      [ 5] 2647 	ldw [dstkptr],x 
      00904D 81               [ 4] 2648 	ret
                                   2649 
                                   2650 ;---------------------------
                                   2651 ;  fetch variable in X 
                                   2652 ;  dstack:{ addr -- value }
                                   2653 ;---------------------------
      00904E                       2654 fetch:
      00904E 72 CE 00 17      [ 5] 2655 	ldw x,[dstkptr]
      009052 FE               [ 2] 2656 	ldw x,(x)
      009053 72 CF 00 17      [ 5] 2657 	ldw [dstkptr],x
      009057 81               [ 4] 2658 	ret 
                                   2659 
                                   2660 ;----------------------------
                                   2661 ; store variable 
                                   2662 ; dstack: {addr value -- }
                                   2663 ;----------------------------
      009058                       2664 store:
      009058 CD 8F FE         [ 4] 2665 	call dpop 
      00905B 90 93            [ 1] 2666 	ldw y,x   ; y=value 
      00905D CD 8F FE         [ 4] 2667 	call dpop 
      009060 FF               [ 2] 2668 	ldw (x),y 
      009061 81               [ 4] 2669 	ret 
                                   2670 
                                   2671 ;---------------------------------
                                   2672 ; drop n elements from data stack 
                                   2673 ; input: 
                                   2674 ;   X 		n 
                                   2675 ; output:
                                   2676 ;   none 
                                   2677 ;-------------------------------------
      009062                       2678 ddrop_n:
      009062 90 89            [ 2] 2679 	pushw y 
      009064 90 CE 00 17      [ 2] 2680 	ldw y,dstkptr 
      009068 58               [ 2] 2681 	sllw x 
      009069 89               [ 2] 2682 	pushw x 
      00906A 72 F9 01         [ 2] 2683 	addw y,(1,sp)
      00906D 90 CF 00 17      [ 2] 2684 	ldw dstkptr,y 
      009071 85               [ 2] 2685 	popw x 
      009072 90 85            [ 2] 2686 	popw y
      009074 81               [ 4] 2687 	ret 
                                   2688 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      009075 0A 64 73 74 61 63 6B  2689 dstk_prompt: .asciz "\ndstack: " 
             3A 20 00
                                   2690 ;----------------------------
                                   2691 ; print dstack content 
                                   2692 ;---------------------------
                           000001  2693 	XSAVE=1
                           000002  2694 	VSIZE=2
      00907F                       2695 dots:
      000FFF                       2696 	_vars VSIZE 
      00907F 52 02            [ 2]    1     sub sp,#VSIZE 
      009081 AE 90 75         [ 2] 2697 	ldw x,#dstk_prompt 
      009084 CD 82 30         [ 4] 2698 	call puts
      009087 AE 17 7E         [ 2] 2699 	ldw x,#dstack_unf-CELL_SIZE
      00908A 35 0A 00 07      [ 1] 2700 	mov base,#10 
      00908E C3 00 17         [ 2] 2701 1$:	cpw x,dstkptr 
      009091 25 0D            [ 1] 2702 	jrult 4$ 
      009093 1F 01            [ 2] 2703 	ldw (XSAVE,sp),x
      009095 FE               [ 2] 2704 	ldw  x,(x)
      009096 CD 89 F8         [ 4] 2705 	call print_int 
      009099 1E 01            [ 2] 2706 	ldw x,(XSAVE,sp)
      00909B 1D 00 02         [ 2] 2707 	subw x,#CELL_SIZE 
      00909E 20 EE            [ 2] 2708 	jra 1$ 
      0090A0 A6 0D            [ 1] 2709 4$: ld a,#CR 
      0090A2 CD 82 1E         [ 4] 2710 	call putc 
      001025                       2711 	_drop VSIZE
      0090A5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0090A7 4F               [ 1] 2712 	clr a 
      0090A8 81               [ 4] 2713 	ret
                                   2714 
      0090A9 0A 63 74 61 63 6B 3A  2715 cstk_prompt: .asciz "\nctack: "
             20 00
                                   2716 ;--------------------------------
                                   2717 ; print cstack content
                                   2718 ;--------------------------------
                           000001  2719 	XSAVE=1
                           000002  2720 	VSIZE=2 
      0090B2                       2721 dotr:
      001032                       2722 	_vars VSIZE 
      0090B2 52 02            [ 2]    1     sub sp,#VSIZE 
      0090B4 AE 90 A9         [ 2] 2723 	ldw x,#cstk_prompt
      0090B7 CD 82 30         [ 4] 2724 	call puts 
      0090BA 96               [ 1] 2725 	ldw x,sp 
      0090BB 1C 00 07         [ 2] 2726 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      0090BE 1F 01            [ 2] 2727 	ldw (XSAVE,sp),x  
      0090C0 AE 17 FE         [ 2] 2728 	ldw x,#RAM_SIZE-2
      0090C3 35 10 00 07      [ 1] 2729 	mov base,#16
      0090C7                       2730 dotr_loop:
      0090C7 13 01            [ 2] 2731 	cpw x,(XSAVE,sp)
      0090C9 2B 0B            [ 1] 2732 	jrmi 9$
      0090CB 89               [ 2] 2733 	pushw x  
      0090CC FE               [ 2] 2734 	ldw x,(x)
      0090CD CD 89 F8         [ 4] 2735 	call print_int 
      0090D0 85               [ 2] 2736 	popw x  
      0090D1 1D 00 02         [ 2] 2737 	subw x,#CELL_SIZE
      0090D4 20 F1            [ 2] 2738 	jra dotr_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      0090D6 A6 0D            [ 1] 2739 9$:	ld a,#CR 
      0090D8 CD 82 1E         [ 4] 2740 	call putc 
      00105B                       2741 	_drop VSIZE 
      0090DB 5B 02            [ 2]    1     addw sp,#VSIZE 
      0090DD 4F               [ 1] 2742 	clr a 
      0090DE 81               [ 4] 2743 	ret
                                   2744 
                                   2745 
                                   2746 ;--------------------------------
                                   2747 ;  add 2 integers
                                   2748 ;  input:
                                   2749 ;    N1     on cstack 
                                   2750 ;    N2     on cstack 
                                   2751 ;  output:
                                   2752 ;    X 		n2+n1 
                                   2753 ;--------------------------------
                                   2754 	;arugments on cstack 
      0090DF                       2755 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00105F                       2756 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      00105F                       2757 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      00105F                       2758 add:
      0090DF 1E 05            [ 2] 2759 	ldw x ,(N2,sp)
      0090E1 72 FB 03         [ 2] 2760 	addw x,(N1,sp)
      0090E4 1F 03            [ 2] 2761 	ldw (N1,sp),x 
      0090E6 81               [ 4] 2762 	ret 
                                   2763 
                                   2764 ;--------------------------------
                                   2765 ;  substract 2 ntegers
                                   2766 ;  input:
                                   2767 ;    N1     on cstack 
                                   2768 ;    N2     on cstack 
                                   2769 ;  output:
                                   2770 ;    X 		n2+n1 
                                   2771 ;--------------------------------
      0090E7                       2772 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001067                       2773 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001067                       2774 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001067                       2775 substract:
      0090E7 1E 05            [ 2] 2776 	ldw x,(N2,sp)
      0090E9 72 F0 03         [ 2] 2777 	subw x,(N1,sp)
      0090EC 81               [ 4] 2778 	ret 
                                   2779 
                                   2780 ;-------------------------------------
                                   2781 ; multiply 2 integers
                                   2782 ; product overflow is ignored unless
                                   2783 ; MATH_OVF assembler flag is set to 1
                                   2784 ; input:
                                   2785 ;  	N1      on cstack
                                   2786 ;   N2 		on cstack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2787 ; output:
                                   2788 ;	X        N1*N2 
                                   2789 ;-------------------------------------
                                   2790 	;arguments 
      0090ED                       2791 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      00106D                       2792 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      00106D                       2793 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      00106D                       2794 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      00106D                       2795 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2796    ; local variables 
                           000001  2797 	SIGN=1
                           000002  2798 	PROD=2
                           000003  2799 	VSIZE=3
      00106D                       2800 multiply:
      00106D                       2801 	_vars VSIZE 
      0090ED 52 03            [ 2]    1     sub sp,#VSIZE 
      0090EF 0F 01            [ 1] 2802 	clr (SIGN,sp)
      0090F1 1E 06            [ 2] 2803 	ldw x,(N1_HB,sp)
      0090F3 9E               [ 1] 2804 	ld a,xh  
      0090F4 A5 80            [ 1] 2805 	bcp a,#0x80 
      0090F6 27 05            [ 1] 2806 	jreq 2$
      0090F8 03 01            [ 1] 2807 	cpl (SIGN,sp)
      0090FA 50               [ 2] 2808 	negw x 
      0090FB 1F 06            [ 2] 2809 	ldw (N1_HB,sp),x 
      0090FD 1E 08            [ 2] 2810 2$: ldw x,(N2_HB,sp)
      0090FF 9E               [ 1] 2811 	ld a,xh  
      009100 A5 80            [ 1] 2812 	bcp a,#0x80 
      009102 27 05            [ 1] 2813 	jreq 3$
      009104 03 01            [ 1] 2814 	cpl (SIGN,sp)
      009106 50               [ 2] 2815 	negw x 
      009107 1F 08            [ 2] 2816 	ldw (N2_HB,sp),x 
                                   2817 ; N1_LB * N2_LB 	
      009109 7B 07            [ 1] 2818 3$:	ld a,(N1_LB,sp)
      00910B 97               [ 1] 2819 	ld xl,a 
      00910C 7B 09            [ 1] 2820 	ld a,(N2_LB,sp) 
      00910E 42               [ 4] 2821 	mul x,a 
                           000000  2822 .if MATH_OVF 	
                                   2823 	ld a,xh 
                                   2824 	bcp a,#0x80 
                                   2825 	jreq 4$ 
                                   2826 	ld a,#ERR_MATH_OVF 
                                   2827 	jp tb_error
                                   2828 .endif 	 
      00910F 1F 02            [ 2] 2829 4$:	ldw (PROD,sp),x
                                   2830 ; N1_LB * N2_HB	 
      009111 7B 07            [ 1] 2831 	ld a,(N1_LB,sp) 
      009113 97               [ 1] 2832 	ld xl,a 
      009114 7B 08            [ 1] 2833 	ld a,(N2_HB,sp)
      009116 42               [ 4] 2834 	mul x,a
      009117 9F               [ 1] 2835 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009118 1B 02            [ 1] 2836 	add a,(PROD,sp)
                           000000  2837 .if MATH_OVF 	
                                   2838 	bcp a,#0x80 
                                   2839 	jreq 5$ 
                                   2840 	ld a,#ERR_MATH_OVF 
                                   2841 	jp tb_error
                                   2842 .endif 	 
      00911A 6B 02            [ 1] 2843 5$:	ld (PROD,sp),a 
                                   2844 ; N1_HB * N2_LB 
      00911C 7B 06            [ 1] 2845 	ld a,(N1_HB,sp)
      00911E 97               [ 1] 2846 	ld xl,a 
      00911F 7B 09            [ 1] 2847 	ld a,(N2_LB,sp)
      009121 42               [ 4] 2848 	mul x,a 
      009122 9F               [ 1] 2849 	ld a,xl 
      009123 1B 02            [ 1] 2850 	add a,(PROD,sp)
                           000000  2851 .if MATH_OVF 	
                                   2852 	bcp a,#0x80 
                                   2853 	jreq 6$ 
                                   2854 	ld a,#ERR_MATH_OVF 
                                   2855 	jp tb_error
                                   2856 .endif 	 
      009125 6B 02            [ 1] 2857 6$:	ld (PROD,sp),a 
                                   2858 ; N1_HB * N2_HB 	
                                   2859 ; it is pointless to multiply N1_HB*N2_HB 
                                   2860 ; as this product is over 65535 or 0 
                                   2861 ;
                                   2862 ; sign adjust product
      009127 0D 01            [ 1] 2863 	tnz (SIGN,sp)
      009129 27 05            [ 1] 2864 	jreq 7$
      00912B 1E 02            [ 2] 2865 	ldw x, (PROD,sp)
      00912D 50               [ 2] 2866 	negw x
      00912E 1F 02            [ 2] 2867 	ldw (PROD,sp),x  
      009130                       2868 7$: 
      009130 1E 02            [ 2] 2869 	ldw x,(PROD,sp) 
      0010B2                       2870 	_drop VSIZE 
      009132 5B 03            [ 2]    1     addw sp,#VSIZE 
      009134 81               [ 4] 2871 	ret
                                   2872 
                                   2873 ;----------------------------------
                                   2874 ;  euclidian divide n2/n1 
                                   2875 ; input:
                                   2876 ;    N2 	on cstack
                                   2877 ;    N1 	on cstack
                                   2878 ; output:
                                   2879 ;    X      n2/n1 
                                   2880 ;    Y      remainder 
                                   2881 ;----------------------------------
      009135                       2882 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      0010B5                       2883 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      0010B5                       2884 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2885 	; local variables
                           000001  2886 	SQUOT=1 ; sign quotient
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                           000002  2887 	SDIVD=2 ; sign dividend  
                           000002  2888 	VSIZE=2
      0010B5                       2889 divide:
      0010B5                       2890 	_vars VSIZE 
      009135 52 02            [ 2]    1     sub sp,#VSIZE 
      009137 0F 01            [ 1] 2891 	clr (SQUOT,sp)
      009139 0F 02            [ 1] 2892 	clr (SDIVD,sp)
                                   2893 ; check for 0 divisor
      00913B 1E 05            [ 2] 2894 	ldw x,(DIVISR,sp)
      00913D 5D               [ 2] 2895 	tnzw x 
      00913E 26 05            [ 1] 2896     jrne 0$
      009140 A6 04            [ 1] 2897 	ld a,#ERR_DIV0 
      009142 CC 87 81         [ 2] 2898 	jp tb_error 
                                   2899 ; check divisor sign 	
      009145 9E               [ 1] 2900 0$:	ld a,xh 
      009146 A5 80            [ 1] 2901 	bcp a,#0x80 
      009148 27 03            [ 1] 2902 	jreq 1$
      00914A 03 01            [ 1] 2903 	cpl (SQUOT,sp)
      00914C 50               [ 2] 2904 	negw x 
      00914D 1F 05            [ 2] 2905 1$:	ldw (DIVISR,sp),x
                                   2906 ; check dividend sign 	 
      00914F 1E 07            [ 2] 2907     ldw x,(DIVIDND,sp)
      009151 9E               [ 1] 2908 	ld a,xh 
      009152 A5 80            [ 1] 2909 	bcp a,#0x80 
      009154 27 05            [ 1] 2910 	jreq 2$ 
      009156 03 01            [ 1] 2911 	cpl (SQUOT,sp)
      009158 03 02            [ 1] 2912 	cpl (SDIVD,sp)
      00915A 50               [ 2] 2913 	negw x 
      00915B 16 05            [ 2] 2914 2$:	ldw y,(DIVISR,sp)
      00915D 65               [ 2] 2915 	divw x,y
      00915E 90 CF 00 09      [ 2] 2916 	ldw acc16,y 
                                   2917 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      009162 0D 02            [ 1] 2918 	tnz (SDIVD,sp)
      009164 27 0B            [ 1] 2919 	jreq 7$
      009166 90 5D            [ 2] 2920 	tnzw y 
      009168 27 07            [ 1] 2921 	jreq 7$
      00916A 5C               [ 1] 2922 	incw x
      00916B 16 05            [ 2] 2923 	ldw y,(DIVISR,sp)
      00916D 72 B2 00 09      [ 2] 2924 	subw y,acc16
      009171 0D 01            [ 1] 2925 7$: tnz (SQUOT,sp)
      009173 27 01            [ 1] 2926 	jreq 9$ 	 
      009175 50               [ 2] 2927 8$:	negw x 
      009176                       2928 9$: 
      0010F6                       2929 	_drop VSIZE 
      009176 5B 02            [ 2]    1     addw sp,#VSIZE 
      009178 81               [ 4] 2930 	ret 
                                   2931 
                                   2932 
                                   2933 ;----------------------------------
                                   2934 ;  remainder resulting from euclidian 
                                   2935 ;  division of n2/n1 
                                   2936 ; input:
                                   2937 ;   N1 		cstack 
                                   2938 ;   N2      cstack
                                   2939 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2940 ;   X       N2%N1 
                                   2941 ;----------------------------------
                           000003  2942 	N1=3
                           000005  2943 	N2=5
                           000004  2944 	VSIZE=4
      009179                       2945 modulo:
      009179 1E 03            [ 2] 2946 	Ldw x,(N1,sp)
      00917B 16 05            [ 2] 2947 	ldw y,(N2,sp)
      0010FD                       2948 	_vars VSIZE 
      00917D 52 04            [ 2]    1     sub sp,#VSIZE 
      00917F 1F 01            [ 2] 2949 	ldw (1,sp),x 
      009181 17 03            [ 2] 2950 	ldw (3,sp),y 
      009183 CD 91 35         [ 4] 2951 	call divide 
      009186 93               [ 1] 2952 	ldw x,y
      001107                       2953 	_drop VSIZE 
      009187 5B 04            [ 2]    1     addw sp,#VSIZE 
      009189 81               [ 4] 2954 	ret 
                                   2955 
                                   2956 
                                   2957 ;----------------------------------
                                   2958 ; search in kword_dict command name
                                   2959 ;  from its execution address 
                                   2960 ; input:
                                   2961 ;   X       	execution address 
                                   2962 ; output:
                                   2963 ;   X 			cstr*  | 0 
                                   2964 ;--------------------------------
                           000001  2965 	XADR=1 
                           000003  2966 	LINK=3 
                           000004  2967 	VSIZE=4
      00918A                       2968 cmd_name:
      00110A                       2969 	_vars VSIZE 
      00918A 52 04            [ 2]    1     sub sp,#VSIZE 
      00918C 72 5F 00 09      [ 1] 2970 	clr acc16 
      009190 1F 01            [ 2] 2971 	ldw (XADR,sp),x  
      009192 AE A1 BA         [ 2] 2972 	ldw x,#kword_dict	
      009195 1F 03            [ 2] 2973 1$:	ldw (LINK,sp),x
      009197 E6 02            [ 1] 2974 	ld a,(2,x)
      009199 A4 0F            [ 1] 2975 	and a,#15 
      00919B C7 00 0A         [ 1] 2976 	ld acc8,a 
      00919E 1C 00 03         [ 2] 2977 	addw x,#3
      0091A1 72 BB 00 09      [ 2] 2978 	addw x,acc16
      0091A5 FE               [ 2] 2979 	ldw x,(x) ; execution address 
      0091A6 13 01            [ 2] 2980 	cpw x,(XADR,sp)
      0091A8 27 0A            [ 1] 2981 	jreq 2$
      0091AA 1E 03            [ 2] 2982 	ldw x,(LINK,sp)
      0091AC FE               [ 2] 2983 	ldw x,(x) 
      0091AD 1D 00 02         [ 2] 2984 	subw x,#2  
      0091B0 26 E3            [ 1] 2985 	jrne 1$
      0091B2 20 05            [ 2] 2986 	jra 9$
      0091B4 1E 03            [ 2] 2987 2$: ldw x,(LINK,sp)
      0091B6 1C 00 02         [ 2] 2988 	addw x,#2 	
      001139                       2989 9$:	_drop VSIZE
      0091B9 5B 04            [ 2]    1     addw sp,#VSIZE 
      0091BB 81               [ 4] 2990 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   2991 
                                   2992 
                                   2993 ;---------------------------------
                                   2994 ; input:
                                   2995 ;	X 		dictionary entry point 
                                   2996 ;  pad		.asciz name to search 
                                   2997 ; output:
                                   2998 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   2999 ;  X		execution address | 0 
                                   3000 ;---------------------------------
                           000001  3001 	NLEN=1 ; cmd length 
                           000002  3002 	YSAVE=2
                           000003  3003 	VSIZE=3 
      0091BC                       3004 search_dict:
      00113C                       3005 	_vars VSIZE 
      0091BC 52 03            [ 2]    1     sub sp,#VSIZE 
      0091BE 90 93            [ 1] 3006 	ldw y,x 
      0091C0                       3007 search_next:	
      0091C0 90 F6            [ 1] 3008 	ld a,(y)
      0091C2 A4 0F            [ 1] 3009 	and a,#0xf 
      0091C4 6B 01            [ 1] 3010 	ld (NLEN,sp),a  
      0091C6 AE 17 18         [ 2] 3011 	ldw x,#pad 
      0091C9 17 02            [ 2] 3012 	ldw (YSAVE,sp),y
      0091CB 90 5C            [ 1] 3013 	incw y  
      0091CD                       3014 cp_loop:
      0091CD F6               [ 1] 3015 	ld a,(x)
      0091CE 27 1E            [ 1] 3016 	jreq str_match 
      0091D0 0D 01            [ 1] 3017 	tnz (NLEN,sp)
      0091D2 27 0B            [ 1] 3018 	jreq no_match  
      0091D4 90 F1            [ 1] 3019 	cp a,(y)
      0091D6 26 07            [ 1] 3020 	jrne no_match 
      0091D8 90 5C            [ 1] 3021 	incw y 
      0091DA 5C               [ 1] 3022 	incw x
      0091DB 0A 01            [ 1] 3023 	dec (NLEN,sp)
      0091DD 20 EE            [ 2] 3024 	jra cp_loop 
      0091DF                       3025 no_match:
      0091DF 16 02            [ 2] 3026 	ldw y,(YSAVE,sp) 
      0091E1 72 A2 00 02      [ 2] 3027 	subw y,#2 ; move Y to link field
      0091E5 4B 00            [ 1] 3028 	push #TK_NONE 
      0091E7 90 FE            [ 2] 3029 	ldw y,(y) ; next word link 
      0091E9 84               [ 1] 3030 	pop a ; TK_NONE 
      0091EA 27 21            [ 1] 3031 	jreq search_exit  ; not found  
                                   3032 ;try next 
      0091EC 20 D2            [ 2] 3033 	jra search_next
      0091EE                       3034 str_match:
      0091EE 16 02            [ 2] 3035 	ldw y,(YSAVE,sp)
      0091F0 90 F6            [ 1] 3036 	ld a,(y)
      0091F2 6B 01            [ 1] 3037 	ld (NLEN,sp),a ; needed to test keyword type  
      0091F4 A4 0F            [ 1] 3038 	and a,#0xf 
                                   3039 ; move y to procedure address field 	
      0091F6 4C               [ 1] 3040 	inc a 
      0091F7 C7 00 0A         [ 1] 3041 	ld acc8,a 
      0091FA 72 5F 00 09      [ 1] 3042 	clr acc16 
      0091FE 72 B9 00 09      [ 2] 3043 	addw y,acc16 
      009202 90 FE            [ 2] 3044 	ldw y,(y) ; routine entry point 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3045 ;determine keyword type bits 7:6 
      009204 7B 01            [ 1] 3046 	ld a,(NLEN,sp)
      009206 4E               [ 1] 3047 	swap a 
      009207 A4 0C            [ 1] 3048 	and a,#0xc
      009209 44               [ 1] 3049 	srl a
      00920A 44               [ 1] 3050 	srl a 
      00920B AB 06            [ 1] 3051 	add a,#6
      00920D                       3052 search_exit: 
      00920D 93               [ 1] 3053 	ldw x,y ; x=routine address 
      00118E                       3054 	_drop VSIZE 	 
      00920E 5B 03            [ 2]    1     addw sp,#VSIZE 
      009210 81               [ 4] 3055 	ret 
                                   3056 
                                   3057 ;---------------------
                                   3058 ; check if next token
                                   3059 ;  is of expected type 
                                   3060 ; input:
                                   3061 ;   A 		 expected token attribute
                                   3062 ;  ouput:
                                   3063 ;   none     if fail call tb_error 
                                   3064 ;--------------------
      009211                       3065 expect:
      009211 88               [ 1] 3066 	push a 
      009212 CD 88 5F         [ 4] 3067 	call next_token 
      009215 11 01            [ 1] 3068 	cp a,(1,sp)
      009217 27 03            [ 1] 3069 	jreq 1$
      009219 CC 87 7F         [ 2] 3070 	jp syntax_error
      00921C 84               [ 1] 3071 1$: pop a 
      00921D 81               [ 4] 3072 	ret 
                                   3073 
                                   3074 
                                   3075 ;-------------------------------
                                   3076 ; parse embedded BASIC routines 
                                   3077 ; arguments list.
                                   3078 ; arg_list::=  rel[','rel]*
                                   3079 ; all arguments are of integer type
                                   3080 ; input:
                                   3081 ;   none
                                   3082 ; output:
                                   3083 ;   A 			number of arguments pushed on dstack  
                                   3084 ;--------------------------------
                           000001  3085 	ARG_CNT=1 
      00921E                       3086 arg_list:
      00921E 4B 00            [ 1] 3087 	push #0  
      009220 CD 93 5D         [ 4] 3088 1$: call relation
      009223 A1 00            [ 1] 3089 	cp a,#TK_NONE 
      009225 27 19            [ 1] 3090 	jreq 5$
      009227 A1 04            [ 1] 3091 	cp a,#TK_INTGR
      009229 26 12            [ 1] 3092 	jrne 4$
      00922B CD 8F F1         [ 4] 3093 3$: call dpush 
      00922E 0C 01            [ 1] 3094     inc (ARG_CNT,sp)
      009230 CD 88 5F         [ 4] 3095 	call next_token 
      009233 A1 00            [ 1] 3096 	cp a,#TK_NONE 
      009235 27 09            [ 1] 3097 	jreq 5$ 
      009237 A1 0D            [ 1] 3098 	cp a,#TK_COMMA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009239 26 02            [ 1] 3099 	jrne 4$
      00923B 20 E3            [ 2] 3100 	jra 1$ 
      00923D CD 8F EB         [ 4] 3101 4$:	call unget_token 
      009240 84               [ 1] 3102 5$:	pop a 
      009241 81               [ 4] 3103 	ret 
                                   3104 
                                   3105 
                                   3106 
                                   3107 ;--------------------------------
                                   3108 ;   BASIC commnands 
                                   3109 ;--------------------------------
                                   3110 
                                   3111 ;--------------------------------
                                   3112 ;  arithmetic and relational 
                                   3113 ;  routines
                                   3114 ;  operators precedence
                                   3115 ;  highest to lowest
                                   3116 ;  operators on same row have 
                                   3117 ;  same precedence and are executed
                                   3118 ;  from left to right.
                                   3119 ;	'*','/','%'
                                   3120 ;   '-','+'
                                   3121 ;   '=','>','<','>=','<=','<>','><'
                                   3122 ;   '<>' and '><' are equivalent for not equal.
                                   3123 ;--------------------------------
                                   3124 
                                   3125 ;---------------------
                                   3126 ; return array element
                                   3127 ; address from @(expr)
                                   3128 ; input:
                                   3129 ;   A 		TK_ARRAY
                                   3130 ; output:
                                   3131 ;   A 		TK_INTGR
                                   3132 ;	X 		element address 
                                   3133 ;----------------------
      009242                       3134 get_array_element:
                                   3135 ;	call ddrop 
      009242 A6 0B            [ 1] 3136 	ld a,#TK_LPAREN 
      009244 CD 92 11         [ 4] 3137 	call expect
      009247 CD 93 5D         [ 4] 3138 	call relation 
      00924A A1 04            [ 1] 3139 	cp a,#TK_INTGR 
      00924C 27 03            [ 1] 3140 	jreq 1$
      00924E CC 87 7F         [ 2] 3141 	jp syntax_error
      009251 89               [ 2] 3142 1$: pushw x 
      009252 A6 0C            [ 1] 3143 	ld a,#TK_RPAREN 
      009254 CD 92 11         [ 4] 3144 	call expect
                                   3145 	; check for bounds 
      009257 85               [ 2] 3146 	popw x   
      009258 C3 00 1E         [ 2] 3147 	cpw x,array_size 
      00925B 23 05            [ 2] 3148 	jrule 3$
                                   3149 ; bounds {1..array_size}	
      00925D A6 0A            [ 1] 3150 2$: ld a,#ERR_BAD_VALUE 
      00925F CC 87 81         [ 2] 3151 	jp tb_error 
      009262 5D               [ 2] 3152 3$: tnzw  x
      009263 27 F8            [ 1] 3153 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009265 58               [ 2] 3154 	sllw x 
      009266 89               [ 2] 3155 	pushw x 
      009267 AE 16 C8         [ 2] 3156 	ldw x,#tib
      00926A 72 F0 01         [ 2] 3157 	subw x,(1,sp)
      0011ED                       3158 	_drop 2   
      00926D 5B 02            [ 2]    1     addw sp,#2 
      00926F A6 04            [ 1] 3159 	ld a,#TK_INTGR
      009271 81               [ 4] 3160 	ret 
                                   3161 
                                   3162 ;***********************************
                                   3163 ;   expression parse,execute 
                                   3164 ;***********************************
                                   3165 ;-----------------------------------
                                   3166 ; factor ::= ['+'|'-'|e] var | @ |
                                   3167 ;			 integer | function |
                                   3168 ;			 '('relation')' 
                                   3169 ; output:
                                   3170 ;   A    token attribute 
                                   3171 ;   X 	 integer
                                   3172 ; ---------------------------------
                           000001  3173 	NEG=1
                           000001  3174 	VSIZE=1
      009272                       3175 factor:
      0011F2                       3176 	_vars VSIZE 
      009272 52 01            [ 2]    1     sub sp,#VSIZE 
      009274 CD 88 5F         [ 4] 3177 	call next_token
      009277 A1 02            [ 1] 3178 	cp a,#CMD_END 
      009279 2B 4E            [ 1] 3179 	jrmi 20$
      00927B 6B 01            [ 1] 3180 1$:	ld (NEG,sp),a 
      00927D A4 30            [ 1] 3181 	and a,#TK_GRP_MASK
      00927F A1 10            [ 1] 3182 	cp a,#TK_GRP_ADD 
      009281 27 04            [ 1] 3183 	jreq 2$
      009283 7B 01            [ 1] 3184 	ld a,(NEG,sp)
      009285 20 03            [ 2] 3185 	jra 4$  
      009287                       3186 2$:	
      009287 CD 88 5F         [ 4] 3187 	call next_token 
      00928A                       3188 4$:	
      00928A A1 07            [ 1] 3189 	cp a,#TK_IFUNC 
      00928C 26 03            [ 1] 3190 	jrne 5$ 
      00928E FD               [ 4] 3191 	call (x) 
      00928F 20 2F            [ 2] 3192 	jra 18$ 
      009291                       3193 5$:
      009291 A1 04            [ 1] 3194 	cp a,#TK_INTGR
      009293 26 02            [ 1] 3195 	jrne 6$
      009295 20 29            [ 2] 3196 	jra 18$
      009297                       3197 6$:
      009297 A1 02            [ 1] 3198 	cp a,#TK_ARRAY
      009299 26 06            [ 1] 3199 	jrne 10$
      00929B CD 92 42         [ 4] 3200 	call get_array_element
      00929E FE               [ 2] 3201 	ldw x,(x)
      00929F 20 1F            [ 2] 3202 	jra 18$ 
      0092A1                       3203 10$:
      0092A1 A1 05            [ 1] 3204 	cp a,#TK_VAR 
      0092A3 26 03            [ 1] 3205 	jrne 11$
      0092A5 FE               [ 2] 3206 	ldw x,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0092A6 20 18            [ 2] 3207 	jra 18$
      0092A8                       3208 11$: 
      0092A8 A1 09            [ 1] 3209 	cp a,#TK_CONST 
      0092AA 27 14            [ 1] 3210 	jreq 18$
      0092AC                       3211 12$:			
      0092AC A1 0B            [ 1] 3212 	cp a,#TK_LPAREN
      0092AE 26 0A            [ 1] 3213 	jrne 16$
      0092B0 CD 93 5D         [ 4] 3214 	call relation
      0092B3 A6 0C            [ 1] 3215 	ld a,#TK_RPAREN 
      0092B5 CD 92 11         [ 4] 3216 	call expect
      0092B8 20 06            [ 2] 3217 	jra 18$	
      0092BA                       3218 16$:
      0092BA CD 8F EB         [ 4] 3219 	call unget_token
      0092BD 4F               [ 1] 3220 	clr a 
      0092BE 20 09            [ 2] 3221 	jra 20$ 
      0092C0                       3222 18$: 
      0092C0 A6 11            [ 1] 3223 	ld a,#TK_MINUS 
      0092C2 11 01            [ 1] 3224 	cp a,(NEG,sp)
      0092C4 26 01            [ 1] 3225 	jrne 19$
      0092C6 50               [ 2] 3226 	negw x
      0092C7                       3227 19$:
      0092C7 A6 04            [ 1] 3228 	ld a,#TK_INTGR
      0092C9                       3229 20$:
      001249                       3230 	_drop VSIZE
      0092C9 5B 01            [ 2]    1     addw sp,#VSIZE 
      0092CB 81               [ 4] 3231 	ret
                                   3232 
                                   3233 ;-----------------------------------
                                   3234 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3235 ; output:
                                   3236 ;   A    	token attribute 
                                   3237 ;	X		integer
                                   3238 ;-----------------------------------
                           000001  3239 	N1=1
                           000003  3240 	N2=3
                           000005  3241 	MULOP=5
                           000005  3242 	VSIZE=5
      0092CC                       3243 term:
      00124C                       3244 	_vars VSIZE
      0092CC 52 05            [ 2]    1     sub sp,#VSIZE 
      0092CE CD 92 72         [ 4] 3245 	call factor
      0092D1 A1 02            [ 1] 3246 	cp a,#CMD_END
      0092D3 2B 41            [ 1] 3247 	jrmi term_exit
      0092D5                       3248 term01:	 ; check for  operator 
      0092D5 1F 03            [ 2] 3249 	ldw (N2,sp),x  ; save first factor 
      0092D7 CD 88 5F         [ 4] 3250 	call next_token
      0092DA A1 02            [ 1] 3251 	cp a,#2
      0092DC 2B 34            [ 1] 3252 	jrmi 9$
      0092DE 6B 05            [ 1] 3253 0$:	ld (MULOP,sp),a
      0092E0 A4 30            [ 1] 3254 	and a,#TK_GRP_MASK
      0092E2 A1 20            [ 1] 3255 	cp a,#TK_GRP_MULT
      0092E4 27 07            [ 1] 3256 	jreq 1$
      0092E6 7B 05            [ 1] 3257 	ld a,(MULOP,sp) 
      0092E8 CD 8F EB         [ 4] 3258 	call unget_token 
      0092EB 20 25            [ 2] 3259 	jra 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0092ED                       3260 1$:	; got *|/|%
      0092ED CD 92 72         [ 4] 3261 	call factor
      0092F0 A1 04            [ 1] 3262 	cp a,#TK_INTGR
      0092F2 27 03            [ 1] 3263 	jreq 2$ 
      0092F4 CC 87 7F         [ 2] 3264 	jp syntax_error
      0092F7 1F 01            [ 2] 3265 2$:	ldw (N1,sp),x  
      0092F9 7B 05            [ 1] 3266 	ld a,(MULOP,sp) 
      0092FB A1 20            [ 1] 3267 	cp a,#TK_MULT 
      0092FD 26 05            [ 1] 3268 	jrne 3$
      0092FF CD 90 ED         [ 4] 3269 	call multiply 
      009302 20 D1            [ 2] 3270 	jra term01
      009304 A1 21            [ 1] 3271 3$: cp a,#TK_DIV 
      009306 26 05            [ 1] 3272 	jrne 4$ 
      009308 CD 91 35         [ 4] 3273 	call divide 
      00930B 20 C8            [ 2] 3274 	jra term01 
      00930D CD 91 79         [ 4] 3275 4$: call modulo
      009310 20 C3            [ 2] 3276 	jra term01 
      009312 1E 03            [ 2] 3277 9$: ldw x,(N2,sp)  
      009314 A6 04            [ 1] 3278 	ld a,#TK_INTGR 	
      009316                       3279 term_exit:
      001296                       3280 	_drop VSIZE 
      009316 5B 05            [ 2]    1     addw sp,#VSIZE 
      009318 81               [ 4] 3281 	ret 
                                   3282 
                                   3283 ;-------------------------------
                                   3284 ;  expr ::= term [['+'|'-'] term]*
                                   3285 ;  result range {-32768..32767}
                                   3286 ;  output:
                                   3287 ;   A    token attribute 
                                   3288 ;   X	 integer   
                                   3289 ;-------------------------------
                           000001  3290 	N1=1 
                           000003  3291 	N2=3
                           000005  3292 	OP=5 
                           000005  3293 	VSIZE=5 
      009319                       3294 expression:
      001299                       3295 	_vars VSIZE 
      009319 52 05            [ 2]    1     sub sp,#VSIZE 
      00931B CD 92 CC         [ 4] 3296 	call term
      00931E A1 02            [ 1] 3297 	cp a,#CMD_END 
      009320 2B 38            [ 1] 3298 	jrmi expr_exit 
      009322 1F 03            [ 2] 3299 0$:	ldw (N2,sp),x 
      009324 CD 88 5F         [ 4] 3300 	call next_token
      009327 A1 02            [ 1] 3301 	cp a,#2
      009329 2B 2B            [ 1] 3302 	jrmi 9$ 
      00932B 6B 05            [ 1] 3303 1$:	ld (OP,sp),a  
      00932D A4 30            [ 1] 3304 	and a,#TK_GRP_MASK
      00932F A1 10            [ 1] 3305 	cp a,#TK_GRP_ADD 
      009331 27 07            [ 1] 3306 	jreq 2$ 
      009333 7B 05            [ 1] 3307 	ld a,(OP,sp)
      009335 CD 8F EB         [ 4] 3308 	call unget_token
      009338 20 1C            [ 2] 3309 	jra 9$
      00933A                       3310 2$: 
      00933A CD 92 CC         [ 4] 3311 	call term
      00933D A1 04            [ 1] 3312 	cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00933F 27 03            [ 1] 3313 	jreq 3$
      009341 CC 87 7F         [ 2] 3314 	jp syntax_error
      009344 1F 01            [ 2] 3315 3$:	ldw (N1,sp),x 
      009346 7B 05            [ 1] 3316 	ld a,(OP,sp)
      009348 A1 10            [ 1] 3317 	cp a,#TK_PLUS 
      00934A 26 05            [ 1] 3318 	jrne 4$
      00934C CD 90 DF         [ 4] 3319 	call add 
      00934F 20 D1            [ 2] 3320 	jra 0$ 
      009351 CD 90 E7         [ 4] 3321 4$:	call substract
      009354 20 CC            [ 2] 3322 	jra 0$
      009356 1E 03            [ 2] 3323 9$: ldw x,(N2,sp)
      009358 A6 04            [ 1] 3324 	ld a,#TK_INTGR	
      00935A                       3325 expr_exit:
      0012DA                       3326 	_drop VSIZE 
      00935A 5B 05            [ 2]    1     addw sp,#VSIZE 
      00935C 81               [ 4] 3327 	ret 
                                   3328 
                                   3329 ;---------------------------------------------
                                   3330 ; rel ::= expr rel_op expr
                                   3331 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3332 ;  relation return 1 | 0  for true | false 
                                   3333 ;  output:
                                   3334 ;    A 		token attribute  
                                   3335 ;	 X		1|0
                                   3336 ;---------------------------------------------
                           000001  3337 	N1=1
                           000003  3338 	N2=3
                           000005  3339 	RELOP=5
                           000005  3340 	VSIZE=5 
      00935D                       3341 relation: 
      0012DD                       3342 	_vars VSIZE
      00935D 52 05            [ 2]    1     sub sp,#VSIZE 
      00935F CD 93 19         [ 4] 3343 	call expression
      009362 A1 02            [ 1] 3344 	cp a,#CMD_END  
      009364 2B 4B            [ 1] 3345 	jrmi rel_exit 
                                   3346 	; expect rel_op or leave 
      009366 1F 03            [ 2] 3347 	ldw (N2,sp),x 
      009368 CD 88 5F         [ 4] 3348 	call next_token 
      00936B A1 02            [ 1] 3349 	cp a,#2
      00936D 2B 3E            [ 1] 3350 	jrmi 9$
      00936F                       3351 1$:	
      00936F 6B 05            [ 1] 3352 	ld (RELOP,sp),a 
      009371 A4 30            [ 1] 3353 	and a,#TK_GRP_MASK
      009373 A1 30            [ 1] 3354 	cp a,#TK_GRP_RELOP 
      009375 27 07            [ 1] 3355 	jreq 2$
      009377 7B 05            [ 1] 3356 	ld a,(RELOP,sp)
      009379 CD 8F EB         [ 4] 3357 	call unget_token  
      00937C 20 2F            [ 2] 3358 	jra 9$
      00937E                       3359 2$:	; expect another expression or error 
      00937E CD 93 19         [ 4] 3360 	call expression
      009381 A1 04            [ 1] 3361 	cp a,#TK_INTGR 
      009383 27 03            [ 1] 3362 	jreq 3$
      009385 CC 87 7F         [ 2] 3363 	jp syntax_error 
      009388 1F 01            [ 2] 3364 3$:	ldw (N1,sp),x 
      00938A CD 90 E7         [ 4] 3365 	call substract
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00938D 26 06            [ 1] 3366 	jrne 4$
      00938F 35 02 00 0A      [ 1] 3367 	mov acc8,#2 ; n1==n2
      009393 20 0C            [ 2] 3368 	jra 6$ 
      009395                       3369 4$: 
      009395 2C 06            [ 1] 3370 	jrsgt 5$  
      009397 35 04 00 0A      [ 1] 3371 	mov acc8,#4 ; n1<2 
      00939B 20 04            [ 2] 3372 	jra 6$
      00939D                       3373 5$:
      00939D 35 01 00 0A      [ 1] 3374 	mov acc8,#1 ; n1>n2 
      0093A1                       3375 6$:
      0093A1 5F               [ 1] 3376 	clrw x 
      0093A2 C6 00 0A         [ 1] 3377 	ld a, acc8  
      0093A5 14 05            [ 1] 3378 	and a,(RELOP,sp)
      0093A7 4D               [ 1] 3379 	tnz a 
      0093A8 27 05            [ 1] 3380 	jreq 10$
      0093AA 5C               [ 1] 3381 	incw x 
      0093AB                       3382 7$:	 
      0093AB 20 02            [ 2] 3383 	jra 10$  	
      0093AD 1E 03            [ 2] 3384 9$: ldw x,(N2,sp)
      0093AF                       3385 10$:
      0093AF A6 04            [ 1] 3386 	ld a,#TK_INTGR
      0093B1                       3387 rel_exit: 	 
      001331                       3388 	_drop VSIZE
      0093B1 5B 05            [ 2]    1     addw sp,#VSIZE 
      0093B3 81               [ 4] 3389 	ret 
                                   3390 
                                   3391 ;--------------------------------
                                   3392 ; BASIC: SHOW 
                                   3393 ;  show content of dstack,cstack
                                   3394 ;--------------------------------
      0093B4                       3395 show:
      0093B4 C6 00 07         [ 1] 3396 	ld a,base 
      0093B7 88               [ 1] 3397 	push a 
      0093B8 CD 90 7F         [ 4] 3398 	call dots
      0093BB CD 90 B2         [ 4] 3399 	call dotr 
      0093BE 84               [ 1] 3400 	pop a 
      0093BF C7 00 07         [ 1] 3401 	ld base,a 
      0093C2 4F               [ 1] 3402 	clr a 
      0093C3 81               [ 4] 3403 	ret
                                   3404 
                                   3405 ;--------------------------------------------
                                   3406 ; BASIC: HEX 
                                   3407 ; select hexadecimal base for integer print
                                   3408 ;---------------------------------------------
      0093C4                       3409 hex_base:
      0093C4 35 10 00 07      [ 1] 3410 	mov base,#16 
      0093C8 81               [ 4] 3411 	ret 
                                   3412 
                                   3413 ;--------------------------------------------
                                   3414 ; BASIC: DEC 
                                   3415 ; select decimal base for integer print
                                   3416 ;---------------------------------------------
      0093C9                       3417 dec_base:
      0093C9 35 0A 00 07      [ 1] 3418 	mov base,#10
      0093CD 81               [ 4] 3419 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3420 
                                   3421 ;------------------------
                                   3422 ; BASIC: SIZE 
                                   3423 ; return free size in text area
                                   3424 ; output:
                                   3425 ;   A 		TK_INTGR
                                   3426 ;   X 	    size integer
                                   3427 ;--------------------------
      0093CE                       3428 size:
      0093CE AE 16 C8         [ 2] 3429 	ldw x,#tib 
      0093D1 72 B0 00 1B      [ 2] 3430 	subw x,txtend 
      0093D5 A6 04            [ 1] 3431 	ld a,#TK_INTGR
      0093D7 81               [ 4] 3432 	ret 
                                   3433 
                                   3434 
                                   3435 ;------------------------
                                   3436 ; BASIC: UBOUND  
                                   3437 ; return array variable size 
                                   3438 ; output:
                                   3439 ;   A 		TK_INTGR
                                   3440 ;   X 	    array size 
                                   3441 ;--------------------------
      0093D8                       3442 ubound:
      0093D8 AE 16 C8         [ 2] 3443 	ldw x,#tib
      0093DB 72 B0 00 1B      [ 2] 3444 	subw x,txtend 
      0093DF 90 CE 00 05      [ 2] 3445 	ldw y,basicptr 
      0093E3 90 C3 00 1B      [ 2] 3446 	cpw y,txtend 
      0093E7 25 0A            [ 1] 3447 	jrult 1$
      0093E9 3B 00 04         [ 1] 3448 	push count 
      0093EC 4B 00            [ 1] 3449 	push #0 
      0093EE 72 F0 01         [ 2] 3450 	subw x,(1,sp)
      001371                       3451 	_drop 2 
      0093F1 5B 02            [ 2]    1     addw sp,#2 
      0093F3 54               [ 2] 3452 1$:	srlw x 
      0093F4 CF 00 1E         [ 2] 3453 	ldw array_size,x
      0093F7 A6 04            [ 1] 3454 	ld a,#TK_INTGR
      0093F9 81               [ 4] 3455 	ret 
                                   3456 
                                   3457 ;-----------------------------
                                   3458 ; BASIC: LET var=expr 
                                   3459 ; variable assignement 
                                   3460 ; output:
                                   3461 ;   A 		TK_NONE 
                                   3462 ;-----------------------------
      0093FA                       3463 let:
      0093FA CD 88 5F         [ 4] 3464 	call next_token 
      0093FD A1 05            [ 1] 3465 	cp a,#TK_VAR 
      0093FF 27 03            [ 1] 3466 	jreq let02
      009401 CC 87 7F         [ 2] 3467 	jp syntax_error
      009404                       3468 let02:
      009404 CD 8F F1         [ 4] 3469 	call dpush 
      009407 CD 88 5F         [ 4] 3470 	call next_token 
      00940A A1 32            [ 1] 3471 	cp a,#TK_EQUAL
      00940C 27 03            [ 1] 3472 	jreq 1$
      00940E CC 87 7F         [ 2] 3473 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009411                       3474 1$:	
      009411 CD 93 5D         [ 4] 3475 	call relation   
      009414 A1 04            [ 1] 3476 	cp a,#TK_INTGR 
      009416 27 03            [ 1] 3477 	jreq 2$
      009418 CC 87 7F         [ 2] 3478 	jp syntax_error
      00941B                       3479 2$:	
      00941B 90 93            [ 1] 3480 	ldw y,x 
      00941D CD 8F FE         [ 4] 3481 	call dpop  
      009420 FF               [ 2] 3482 	ldw (x),y   
      009421 81               [ 4] 3483 	ret 
                                   3484 
                                   3485 ;----------------------------
                                   3486 ; BASIC: LIST [[start][,end]]
                                   3487 ; list program lines 
                                   3488 ; form start to end 
                                   3489 ; if empty argument list then 
                                   3490 ; list all.
                                   3491 ;----------------------------
                           000001  3492 	FIRST=1
                           000003  3493 	LAST=3 
                           000005  3494 	LN_PTR=5
                           000006  3495 	VSIZE=6 
      009422                       3496 list:
      0013A2                       3497 	_vars VSIZE
      009422 52 06            [ 2]    1     sub sp,#VSIZE 
      009424 CE 00 19         [ 2] 3498 	ldw x,txtbgn 
      009427 C3 00 1B         [ 2] 3499 	cpw x,txtend 
      00942A 2B 03            [ 1] 3500 	jrmi 1$
      00942C CC 94 A2         [ 2] 3501 	jp list_exit ; nothing to list 
      00942F 1F 05            [ 2] 3502 1$:	ldw (LN_PTR,sp),x 
      009431 FE               [ 2] 3503 	ldw x,(x) 
      009432 1F 01            [ 2] 3504 	ldw (FIRST,sp),x ; list from first line 
      009434 AE 7F FF         [ 2] 3505 	ldw x,#0x7fff ; biggest line number 
      009437 1F 03            [ 2] 3506 	ldw (LAST,sp),x 
      009439 CD 92 1E         [ 4] 3507 	call arg_list
      00943C 4D               [ 1] 3508 	tnz a
      00943D 27 3F            [ 1] 3509 	jreq list_start 
      00943F A1 02            [ 1] 3510 	cp a,#2 
      009441 27 07            [ 1] 3511 	jreq 4$
      009443 A1 01            [ 1] 3512 	cp a,#1 
      009445 27 06            [ 1] 3513 	jreq first_line 
      009447 CC 87 7F         [ 2] 3514 	jp syntax_error 
      00944A CD 90 0B         [ 4] 3515 4$:	call dswap
      00944D                       3516 first_line:
      00944D CD 8F FE         [ 4] 3517 	call dpop 
      009450 1F 01            [ 2] 3518 	ldw (FIRST,sp),x 
      009452 A1 01            [ 1] 3519 	cp a,#1 
      009454 27 05            [ 1] 3520 	jreq lines_skip 	
      009456                       3521 last_line:
      009456 CD 8F FE         [ 4] 3522 	call dpop 
      009459 1F 03            [ 2] 3523 	ldw (LAST,sp),x 
      00945B                       3524 lines_skip:
      00945B CE 00 19         [ 2] 3525 	ldw x,txtbgn
      00945E 1F 05            [ 2] 3526 2$:	ldw (LN_PTR,sp),x 
      009460 C3 00 1B         [ 2] 3527 	cpw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009463 2A 3D            [ 1] 3528 	jrpl list_exit 
      009465 FE               [ 2] 3529 	ldw x,(x) ;line# 
      009466 13 01            [ 2] 3530 	cpw x,(FIRST,sp)
      009468 2A 14            [ 1] 3531 	jrpl list_start 
      00946A 1E 05            [ 2] 3532 	ldw x,(LN_PTR,sp) 
      00946C 1C 00 02         [ 2] 3533 	addw x,#2 
      00946F F6               [ 1] 3534 	ld a,(x)
      009470 5C               [ 1] 3535 	incw x 
      009471 C7 00 0A         [ 1] 3536 	ld acc8,a 
      009474 72 5F 00 09      [ 1] 3537 	clr acc16 
      009478 72 BB 00 09      [ 2] 3538 	addw x,acc16
      00947C 20 E0            [ 2] 3539 	jra 2$ 
                                   3540 ; print loop
      00947E                       3541 list_start:
      00947E 1E 05            [ 2] 3542 	ldw x,(LN_PTR,sp)
      009480                       3543 3$:	
      009480 CD 94 F5         [ 4] 3544 	call prt_basic_line
      009483 1E 05            [ 2] 3545 	ldw x,(LN_PTR,sp)
      009485 E6 02            [ 1] 3546 	ld a,(2,x)
      009487 C7 00 0A         [ 1] 3547 	ld acc8,a 
      00948A 72 5F 00 09      [ 1] 3548 	clr acc16 
      00948E 72 BB 00 09      [ 2] 3549 	addw x,acc16
      009492 C3 00 1B         [ 2] 3550 	cpw x,txtend 
      009495 2A 0B            [ 1] 3551 	jrpl list_exit
      009497 1F 05            [ 2] 3552 	ldw (LN_PTR,sp),x
      009499 FE               [ 2] 3553 	ldw x,(x)
      00949A 13 03            [ 2] 3554 	cpw x,(LAST,sp)  
      00949C 2C 04            [ 1] 3555 	jrsgt list_exit 
      00949E 1E 05            [ 2] 3556 	ldw x,(LN_PTR,sp)
      0094A0 20 DE            [ 2] 3557 	jra 3$
      0094A2                       3558 list_exit:
      001422                       3559 	_drop VSIZE 
      0094A2 5B 06            [ 2]    1     addw sp,#VSIZE 
      0094A4 81               [ 4] 3560 	ret
                                   3561 
                                   3562 ;-------------------------
                                   3563 ; print counted string 
                                   3564 ; input:
                                   3565 ;   X 		address of string
                                   3566 ;--------------------------
      0094A5                       3567 prt_cmd_name:
      0094A5 F6               [ 1] 3568 	ld a,(x)
      0094A6 5C               [ 1] 3569 	incw x
      0094A7 A4 0F            [ 1] 3570 	and a,#15  
      0094A9 88               [ 1] 3571 	push a 
      0094AA 0D 01            [ 1] 3572 1$: tnz (1,sp) 
      0094AC 27 09            [ 1] 3573 	jreq 9$
      0094AE F6               [ 1] 3574 	ld a,(x)
      0094AF CD 82 1E         [ 4] 3575 	call putc 
      0094B2 5C               [ 1] 3576 	incw x
      0094B3 0A 01            [ 1] 3577 	dec (1,sp)	 
      0094B5 20 F3            [ 2] 3578 	jra 1$
      0094B7 84               [ 1] 3579 9$: pop a 
      0094B8 81               [ 4] 3580 	ret	
                                   3581 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3582 ;--------------------------
                                   3583 ; print TK_QSTR
                                   3584 ; converting control character
                                   3585 ; to backslash sequence
                                   3586 ; input:
                                   3587 ;   X        char *
                                   3588 ;-----------------------------
      0094B9                       3589 prt_quote:
      0094B9 A6 22            [ 1] 3590 	ld a,#'"
      0094BB CD 82 1E         [ 4] 3591 	call putc 
      0094BE F6               [ 1] 3592 1$:	ld a,(x)
      0094BF 27 2D            [ 1] 3593 	jreq 9$
      0094C1 5C               [ 1] 3594 	incw x 
      0094C2 A1 20            [ 1] 3595 	cp a,#SPACE 
      0094C4 25 0C            [ 1] 3596 	jrult 3$
      0094C6 CD 82 1E         [ 4] 3597 	call putc
      0094C9 A1 5C            [ 1] 3598 	cp a,#'\ 
      0094CB 26 F1            [ 1] 3599 	jrne 1$ 
      0094CD                       3600 2$:
      0094CD CD 82 1E         [ 4] 3601 	call putc 
      0094D0 20 EC            [ 2] 3602 	jra 1$
      0094D2 88               [ 1] 3603 3$: push a 
      0094D3 A6 5C            [ 1] 3604 	ld a,#'\
      0094D5 CD 82 1E         [ 4] 3605 	call putc 
      0094D8 84               [ 1] 3606 	pop a 
      0094D9 A0 07            [ 1] 3607 	sub a,#7
      0094DB C7 00 0A         [ 1] 3608 	ld acc8,a 
      0094DE 72 5F 00 09      [ 1] 3609 	clr acc16
      0094E2 90 AE 8C BA      [ 2] 3610 	ldw y,#escaped 
      0094E6 72 B9 00 09      [ 2] 3611 	addw y,acc16 
      0094EA 90 F6            [ 1] 3612 	ld a,(y)
      0094EC 20 DF            [ 2] 3613 	jra 2$
      0094EE A6 22            [ 1] 3614 9$: ld a,#'"
      0094F0 CD 82 1E         [ 4] 3615 	call putc 
      0094F3 5C               [ 1] 3616 	incw x 
      0094F4 81               [ 4] 3617 	ret
                                   3618 
                                   3619 
                                   3620 ;--------------------------
                                   3621 ; decompile line from token list 
                                   3622 ; input:
                                   3623 ;   X 		pointer at line
                                   3624 ; output:
                                   3625 ;   none 
                                   3626 ;--------------------------	
                           000001  3627 	BASE_SAV=1
                           000002  3628 	WIDTH_SAV=2
                           000003  3629 	XSAVE=3
                           000005  3630 	LLEN=5
                           000005  3631 	VSIZE=5 
      0094F5                       3632 prt_basic_line:
      001475                       3633 	_vars VSIZE 
      0094F5 52 05            [ 2]    1     sub sp,#VSIZE 
      0094F7 C6 00 07         [ 1] 3634 	ld a,base
      0094FA 6B 01            [ 1] 3635 	ld (BASE_SAV,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0094FC C6 00 21         [ 1] 3636 	ld a,tab_width 
      0094FF 6B 02            [ 1] 3637 	ld (WIDTH_SAV,sp),a 
      009501 CF 00 12         [ 2] 3638 	ldw ptr16,x
      009504 FE               [ 2] 3639 	ldw x,(x)
      009505 35 0A 00 07      [ 1] 3640 	mov base,#10
      009509 35 05 00 21      [ 1] 3641 	mov tab_width,#5
      00950D CD 89 F8         [ 4] 3642 	call print_int ; print line number 
      009510 A6 20            [ 1] 3643 	ld a,#SPACE 
      009512 CD 82 1E         [ 4] 3644 	call putc 
      009515 72 5F 00 21      [ 1] 3645 	clr tab_width
      009519 AE 00 02         [ 2] 3646 	ldw x,#2
      00951C 72 D6 00 12      [ 4] 3647 	ld a,([ptr16],x)
      009520 6B 05            [ 1] 3648 	ld (LLEN,sp),a 
      009522 5C               [ 1] 3649 	incw x
      009523 9F               [ 1] 3650 1$:	ld a,xl 
      009524 11 05            [ 1] 3651 	cp a,(LLEN,sp)
      009526 2B 03            [ 1] 3652 	jrmi 20$
      009528 CC 96 32         [ 2] 3653 	jp 90$
      00952B                       3654 20$:	 
      00952B 72 D6 00 12      [ 4] 3655 	ld a,([ptr16],x)
      00952F 5C               [ 1] 3656 	incw x 
      009530 1F 03            [ 2] 3657 	ldw (XSAVE,sp),x 
      009532 A1 06            [ 1] 3658 	cp a,#TK_CMD 
      009534 25 44            [ 1] 3659 	jrult 5$
      009536 A1 09            [ 1] 3660 	cp a,#TK_CONST 
      009538 22 2F            [ 1] 3661 	jrugt 4$
      00953A                       3662 2$:	
      00953A 72 DE 00 12      [ 5] 3663 	ldw x,([ptr16],x)
      00953E A3 97 6B         [ 2] 3664 	cpw x,#rem 
      009541 26 14            [ 1] 3665 	jrne 3$
      009543 A6 27            [ 1] 3666 	ld a,#''
      009545 CD 82 1E         [ 4] 3667 	call putc 
      009548 1E 03            [ 2] 3668 	ldw x,(XSAVE,sp)
      00954A 1C 00 02         [ 2] 3669 	addw x,#2
      00954D 72 BB 00 12      [ 2] 3670 	addw x,ptr16  
      009551 CD 82 30         [ 4] 3671 	call puts 
      009554 CC 96 32         [ 2] 3672 	jp 90$ 
      009557 CD 91 8A         [ 4] 3673 3$:	call cmd_name
      00955A CD 94 A5         [ 4] 3674 	call prt_cmd_name
      00955D A6 20            [ 1] 3675 	ld a,#SPACE 
      00955F CD 82 1E         [ 4] 3676 	call putc 
      009562 1E 03            [ 2] 3677 	ldw x,(XSAVE,sp)
      009564 1C 00 02         [ 2] 3678 	addw x,#2
      009567 20 BA            [ 2] 3679 	jra 1$
      009569 A1 0A            [ 1] 3680 4$: cp a,#TK_QSTR 
      00956B 26 0D            [ 1] 3681 	jrne 5$
      00956D 72 BB 00 12      [ 2] 3682 	addw x,ptr16
      009571 CD 94 B9         [ 4] 3683 	call prt_quote 
      009574 72 B0 00 12      [ 2] 3684 	subw x,ptr16  
      009578 20 A9            [ 2] 3685 	jra 1$
      00957A A1 05            [ 1] 3686 5$:	cp a,#TK_VAR
      00957C 26 1A            [ 1] 3687 	jrne 6$ 
      00957E 72 DE 00 12      [ 5] 3688 	ldw x,([ptr16],x)
      009582 1D 00 22         [ 2] 3689 	subw x,#vars 
      009585 9F               [ 1] 3690 	ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009586 44               [ 1] 3691 	srl a 
      009587 AB 41            [ 1] 3692 	add a,#'A 
      009589 CD 82 1E         [ 4] 3693 	call putc 
      00958C A6 20            [ 1] 3694 	ld a,#SPACE 
      00958E CD 82 1E         [ 4] 3695 	call putc 
      009591 1E 03            [ 2] 3696 	ldw x,(XSAVE,sp)
      009593 1C 00 02         [ 2] 3697 	addw x,#2 
      009596 20 8B            [ 2] 3698 	jra 1$ 
      009598 A1 02            [ 1] 3699 6$: cp a,#TK_ARRAY 
      00959A 26 0A            [ 1] 3700 	jrne 7$
      00959C A6 40            [ 1] 3701 	ld a,#'@ 
      00959E CD 82 1E         [ 4] 3702 	call putc 
      0095A1 1E 03            [ 2] 3703 	ldw x,(XSAVE,sp)
      0095A3 CC 95 23         [ 2] 3704 	jp 1$ 
      0095A6 A1 04            [ 1] 3705 7$: cp a,#TK_INTGR 
      0095A8 26 14            [ 1] 3706 	jrne 8$
      0095AA 72 DE 00 12      [ 5] 3707 	ldw x,([ptr16],x)
      0095AE CD 89 F8         [ 4] 3708 	call print_int
      0095B1 A6 20            [ 1] 3709 	ld a,#SPACE 
      0095B3 CD 82 1E         [ 4] 3710 	call putc 
      0095B6 1E 03            [ 2] 3711 	ldw x,(XSAVE,sp)
      0095B8 1C 00 02         [ 2] 3712 	addw x,#2 
      0095BB CC 95 23         [ 2] 3713 	jp 1$
      0095BE A1 31            [ 1] 3714 8$: cp a,#TK_GT 
      0095C0 2B 1A            [ 1] 3715 	jrmi 9$
      0095C2 A1 35            [ 1] 3716 	cp a,#TK_NE 
      0095C4 22 16            [ 1] 3717 	jrugt 9$
      0095C6 A0 31            [ 1] 3718 	sub a,#TK_GT  
      0095C8 48               [ 1] 3719 	sll a 
      0095C9 90 5F            [ 1] 3720 	clrw y 
      0095CB 90 97            [ 1] 3721 	ld yl,a 
      0095CD 72 A9 96 4B      [ 2] 3722 	addw y,#relop_str 
      0095D1 90 FE            [ 2] 3723 	ldw y,(y)
      0095D3 93               [ 1] 3724 	ldw x,y 
      0095D4 CD 82 30         [ 4] 3725 	call puts 
      0095D7 1E 03            [ 2] 3726 	ldw x,(XSAVE,sp)
      0095D9 CC 95 23         [ 2] 3727 	jp 1$
      0095DC A1 10            [ 1] 3728 9$: cp a,#TK_PLUS 
      0095DE 26 04            [ 1] 3729 	jrne 10$
      0095E0 A6 2B            [ 1] 3730 	ld a,#'+
      0095E2 20 46            [ 2] 3731 	jra 80$ 
      0095E4 A1 11            [ 1] 3732 10$: cp a,#TK_MINUS
      0095E6 26 04            [ 1] 3733 	jrne 11$
      0095E8 A6 2D            [ 1] 3734 	ld a,#'-
      0095EA 20 3E            [ 2] 3735 	jra 80$
      0095EC A1 20            [ 1] 3736 11$: cp a,#TK_MULT 
      0095EE 2B 0E            [ 1] 3737 	jrmi 12$
      0095F0 A1 22            [ 1] 3738 	cp a,#TK_MOD 
      0095F2 22 0A            [ 1] 3739 	jrugt 12$
      0095F4 A0 20            [ 1] 3740 	sub a,#0x20
      0095F6 5F               [ 1] 3741 	clrw x 
      0095F7 97               [ 1] 3742 	ld xl,a 
      0095F8 1C 96 48         [ 2] 3743 	addw x,#mul_char 
      0095FB F6               [ 1] 3744 	ld a,(x)
      0095FC 20 2C            [ 2] 3745 	jra 80$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0095FE A1 0B            [ 1] 3746 12$: cp a,#TK_LPAREN 
      009600 2B 0E            [ 1] 3747 	jrmi 13$
      009602 A1 0E            [ 1] 3748 	cp a,#TK_SHARP 
      009604 22 0A            [ 1] 3749 	jrugt 13$
      009606 A0 0B            [ 1] 3750 	sub a,#TK_LPAREN
      009608 5F               [ 1] 3751 	clrw x 
      009609 97               [ 1] 3752 	ld xl,a 
      00960A 1C 96 44         [ 2] 3753 	addw x,#single_char 
      00960D F6               [ 1] 3754 	ld a,(x)
      00960E 20 1A            [ 2] 3755 	jra 80$
      009610 A1 03            [ 1] 3756 13$: cp a,#TK_CHAR 
      009612 26 14            [ 1] 3757 	jrne 14$
      009614 A6 5C            [ 1] 3758 	ld a,#'\
      009616 CD 82 1E         [ 4] 3759 	call putc 
      009619 1E 03            [ 2] 3760 	ldw x,(XSAVE,sp)
      00961B 72 D6 00 12      [ 4] 3761 	ld a,([ptr16],x)
      00961F 5C               [ 1] 3762 	incw x 
      009620 1F 03            [ 2] 3763 	ldw (XSAVE,sp),x 
      009622 CD 82 1E         [ 4] 3764 	call putc 
      009625 CC 95 23         [ 2] 3765 	jp 1$ 
      009628 A6 3A            [ 1] 3766 14$: ld a,#':
      00962A CD 82 1E         [ 4] 3767 80$: call putc 
      00962D 1E 03            [ 2] 3768 	ldw x,(XSAVE,sp)
      00962F CC 95 23         [ 2] 3769 	jp 1$ 
      009632                       3770 90$: 
      009632 A6 0D            [ 1] 3771 	ld a,#CR 
      009634 CD 82 1E         [ 4] 3772 	call putc
      009637 7B 02            [ 1] 3773 	ld a,(WIDTH_SAV,sp) 
      009639 C7 00 21         [ 1] 3774 	ld tab_width,a 
      00963C 7B 01            [ 1] 3775 	ld a,(BASE_SAV,sp) 
      00963E C7 00 07         [ 1] 3776 	ld base,a
      0015C1                       3777 	_drop VSIZE 
      009641 5B 05            [ 2]    1     addw sp,#VSIZE 
      009643 81               [ 4] 3778 	ret 	
      009644 28 29 2C 23           3779 single_char: .byte '(',')',',','#'
      009648 2A 2F 25              3780 mul_char: .byte '*','/','%'
      00964B 96 57 96 59 96 5B 96  3781 relop_str: .word gt,equal,ge,lt,le,ne 
             5E 96 60 96 63
      009657 3E 00                 3782 gt: .asciz ">"
      009659 3D 00                 3783 equal: .asciz "="
      00965B 3E 3D 00              3784 ge: .asciz ">="
      00965E 3C 00                 3785 lt: .asciz "<"
      009660 3C 3D 00              3786 le: .asciz "<="
      009663 3C 3E 00              3787 ne:  .asciz "<>"
                                   3788 
                                   3789 
                                   3790 ;---------------------------------
                                   3791 ; BASIC: PRINT|? arg_list 
                                   3792 ; print values from argument list
                                   3793 ;----------------------------------
                           000001  3794 	COMMA=1
                           000001  3795 	VSIZE=1
      009666                       3796 print:
      009666 4B 00            [ 1] 3797 push #0 ; local variable COMMA 
      009668                       3798 reset_comma:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009668 0F 01            [ 1] 3799 	clr (COMMA,sp)
      00966A                       3800 prt_loop:
      00966A CD 93 5D         [ 4] 3801 	call relation 
      00966D A1 01            [ 1] 3802 	cp a,#TK_COLON 
      00966F 27 5A            [ 1] 3803 	jreq print_exit   
      009671 A1 04            [ 1] 3804 	cp a,#TK_INTGR 
      009673 26 05            [ 1] 3805 	jrne 0$ 
      009675 CD 89 F8         [ 4] 3806 	call print_int 
      009678 20 EE            [ 2] 3807 	jra reset_comma
      00967A                       3808 0$: 	
      00967A CD 88 5F         [ 4] 3809 	call next_token
      00967D A1 00            [ 1] 3810 	cp a,#TK_NONE 
      00967F 27 4A            [ 1] 3811 	jreq print_exit 
      009681 A1 0A            [ 1] 3812 1$:	cp a,#TK_QSTR
      009683 26 0E            [ 1] 3813 	jrne 2$   
      009685 CD 82 30         [ 4] 3814 	call puts
      009688 5C               [ 1] 3815 	incw x 
      009689 72 B0 00 05      [ 2] 3816 	subw x,basicptr 
      00968D 9F               [ 1] 3817 	ld a,xl 
      00968E C7 00 02         [ 1] 3818 	ld in,a  
      009691 20 D5            [ 2] 3819 	jra reset_comma
      009693 A1 03            [ 1] 3820 2$: cp a,#TK_CHAR 
      009695 26 06            [ 1] 3821 	jrne 3$
      009697 9F               [ 1] 3822 	ld a,xl 
      009698 CD 82 1E         [ 4] 3823 	call putc 
      00969B 20 CB            [ 2] 3824 	jra reset_comma 
      00969D                       3825 3$: 	
      00969D A1 08            [ 1] 3826 	cp a,#TK_CFUNC 
      00969F 26 07            [ 1] 3827 	jrne 4$ 
      0096A1 FD               [ 4] 3828 	call (x)
      0096A2 9F               [ 1] 3829 	ld a,xl 
      0096A3 CD 82 1E         [ 4] 3830 	call putc
      0096A6 20 C0            [ 2] 3831 	jra reset_comma 
      0096A8                       3832 4$: 
      0096A8 A1 0D            [ 1] 3833 	cp a,#TK_COMMA 
      0096AA 26 05            [ 1] 3834 	jrne 5$
      0096AC 03 01            [ 1] 3835 	cpl (COMMA,sp) 
      0096AE CC 96 6A         [ 2] 3836 	jp prt_loop   
      0096B1                       3837 5$: 
      0096B1 A1 0E            [ 1] 3838 	cp a,#TK_SHARP
      0096B3 26 13            [ 1] 3839 	jrne 7$
      0096B5 CD 88 5F         [ 4] 3840 	call next_token
      0096B8 A1 04            [ 1] 3841 	cp a,#TK_INTGR 
      0096BA 27 03            [ 1] 3842 	jreq 6$
      0096BC CC 87 7F         [ 2] 3843 	jp syntax_error 
      0096BF                       3844 6$:
      0096BF 9F               [ 1] 3845 	ld a,xl 
      0096C0 A4 0F            [ 1] 3846 	and a,#15 
      0096C2 C7 00 21         [ 1] 3847 	ld tab_width,a 
      0096C5 CC 96 68         [ 2] 3848 	jp reset_comma 
      0096C8                       3849 7$:	
      0096C8 CD 8F EB         [ 4] 3850 	call unget_token
      0096CB                       3851 print_exit:
      0096CB 0D 01            [ 1] 3852 	tnz (COMMA,sp)
      0096CD 26 05            [ 1] 3853 	jrne 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0096CF A6 0D            [ 1] 3854 	ld a,#CR 
      0096D1 CD 82 1E         [ 4] 3855     call putc 
      001654                       3856 9$:	_drop VSIZE 
      0096D4 5B 01            [ 2]    1     addw sp,#VSIZE 
      0096D6 81               [ 4] 3857 	ret 
                                   3858 
                                   3859 ;----------------------
                                   3860 ; 'save_context' and
                                   3861 ; 'rest_context' must be 
                                   3862 ; called at the same 
                                   3863 ; call stack depth 
                                   3864 ; i.e. SP must have the 
                                   3865 ; save value at  
                                   3866 ; entry point of both 
                                   3867 ; routine. 
                                   3868 ;---------------------
                           000006  3869 	CTXT_SIZE=6 ; size of saved data 
                                   3870 ;--------------------
                                   3871 ; save current BASIC
                                   3872 ; interpreter context 
                                   3873 ; on cstack 
                                   3874 ;--------------------
      0096D7                       3875 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001657                       3876 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001657                       3877 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001657                       3878 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001657                       3879 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      001657                       3880 save_context:
      0096D7 CE 00 05         [ 2] 3881 	ldw x,basicptr 
      0096DA 1F 03            [ 2] 3882 	ldw (BPTR,sp),x
      0096DC C6 00 02         [ 1] 3883 	ld a,in 
      0096DF 6B 07            [ 1] 3884 	ld (IN,sp),a
      0096E1 C6 00 04         [ 1] 3885 	ld a,count 
      0096E4 6B 08            [ 1] 3886 	ld (CNT,sp),a  
      0096E6 81               [ 4] 3887 	ret
                                   3888 
                                   3889 ;-----------------------
                                   3890 ; restore previously saved 
                                   3891 ; BASIC interpreter context 
                                   3892 ; from cstack 
                                   3893 ;-------------------------
      0096E7                       3894 rest_context:
      0096E7 1E 03            [ 2] 3895 	ldw x,(BPTR,sp)
      0096E9 CF 00 05         [ 2] 3896 	ldw basicptr,x 
      0096EC 7B 07            [ 1] 3897 	ld a,(IN,sp)
      0096EE C7 00 02         [ 1] 3898 	ld in,a
      0096F1 7B 08            [ 1] 3899 	ld a,(CNT,sp)
      0096F3 C7 00 04         [ 1] 3900 	ld count,a  
      0096F6 81               [ 4] 3901 	ret
                                   3902 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3903 ;------------------------------------------
                                   3904 ; BASIC: INPUT [string],var[,[string],var]
                                   3905 ; input value in variables 
                                   3906 ; [string] optionally can be used as prompt 
                                   3907 ;-----------------------------------------
                           000001  3908 	CX_BPTR=1
                           000003  3909 	CX_LNO=3
                           000004  3910 	CX_IN=4
                           000005  3911 	CX_CNT=5
                           000006  3912 	SKIP=6
                           000007  3913 	VSIZE=7
      0096F7                       3914 input_var:
      0096F7 72 00 00 20 05   [ 2] 3915 	btjt flags,#FRUN,1$ 
      0096FC A6 06            [ 1] 3916 	ld a,#ERR_RUN_ONLY 
      0096FE CC 87 81         [ 2] 3917 	jp tb_error 
      001681                       3918 1$:	_vars VSIZE 
      009701 52 07            [ 2]    1     sub sp,#VSIZE 
      009703                       3919 input_loop:
      009703 0F 06            [ 1] 3920 	clr (SKIP,sp)
      009705 CD 88 5F         [ 4] 3921 	call next_token 
      009708 A1 00            [ 1] 3922 	cp a,#TK_NONE 
      00970A 27 5C            [ 1] 3923 	jreq input_exit 
      00970C A1 0A            [ 1] 3924 	cp a,#TK_QSTR 
      00970E 26 08            [ 1] 3925 	jrne 1$ 
      009710 CD 82 30         [ 4] 3926 	call puts 
      009713 03 06            [ 1] 3927 	cpl (SKIP,sp)
      009715 CD 88 5F         [ 4] 3928 	call next_token 
      009718 A1 05            [ 1] 3929 1$: cp a,#TK_VAR  
      00971A 27 03            [ 1] 3930 	jreq 2$ 
      00971C CC 87 7F         [ 2] 3931 	jp syntax_error
      00971F CD 8F F1         [ 4] 3932 2$:	call dpush 
      009722 0D 06            [ 1] 3933 	tnz (SKIP,sp)
      009724 26 0F            [ 1] 3934 	jrne 21$ 
      009726 A6 3A            [ 1] 3935 	ld a,#':
      009728 C7 17 19         [ 1] 3936 	ld pad+1,a 
      00972B 72 5F 17 1A      [ 1] 3937 	clr pad+2
      00972F AE 17 18         [ 2] 3938 	ldw x,#pad 
      009732 CD 82 30         [ 4] 3939 	call puts   
      009735                       3940 21$:
      009735 CD 96 D7         [ 4] 3941 	call save_context 
      009738 AE 16 C8         [ 2] 3942 	ldw x,#tib 
      00973B CF 00 05         [ 2] 3943 	ldw basicptr,x  
      00973E 72 5F 00 04      [ 1] 3944 	clr count  
      009742 CD 8A E6         [ 4] 3945 	call readln 
      009745 72 5F 00 02      [ 1] 3946 	clr in 
      009749 CD 93 5D         [ 4] 3947 	call relation 
      00974C A1 04            [ 1] 3948 	cp a,#TK_INTGR
      00974E 27 03            [ 1] 3949 	jreq 3$ 
      009750 CC 87 7F         [ 2] 3950 	jp syntax_error
      009753 CD 8F F1         [ 4] 3951 3$: call dpush 
      009756 CD 90 58         [ 4] 3952 	call store 
      009759 CD 96 E7         [ 4] 3953 	call rest_context
      00975C CD 88 5F         [ 4] 3954 	call next_token 
      00975F A1 0D            [ 1] 3955 	cp a,#TK_COMMA 
      009761 26 02            [ 1] 3956 	jrne 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009763 20 9E            [ 2] 3957 	jra input_loop 
      009765 CD 8F EB         [ 4] 3958 4$:	call unget_token 
      009768                       3959 input_exit:
      0016E8                       3960 	_drop VSIZE 
      009768 5B 07            [ 2]    1     addw sp,#VSIZE 
      00976A 81               [ 4] 3961 	ret 
                                   3962 
                                   3963 
                                   3964 ;---------------------
                                   3965 ; BASIC: REMARK | ' 
                                   3966 ; skip comment to end of line 
                                   3967 ;---------------------- 
      00976B                       3968 rem:
      00976B 55 00 02 00 04   [ 1] 3969  	mov count,in 
      009770 81               [ 4] 3970 	ret 
                                   3971 
                                   3972 ;---------------------
                                   3973 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3974 ; read in loop 'addr'  
                                   3975 ; apply & 'mask' to value 
                                   3976 ; loop while result==0.  
                                   3977 ; if 'xor_mask' given 
                                   3978 ; apply ^ in second  
                                   3979 ; loop while result==0 
                                   3980 ;---------------------
                           000001  3981 	XMASK=1 
                           000002  3982 	MASK=2
                           000003  3983 	ADDR=3
                           000004  3984 	VSIZE=4
      009771                       3985 wait: 
      0016F1                       3986 	_vars VSIZE
      009771 52 04            [ 2]    1     sub sp,#VSIZE 
      009773 0F 01            [ 1] 3987 	clr (XMASK,sp) 
      009775 CD 92 1E         [ 4] 3988 	call arg_list 
      009778 A1 02            [ 1] 3989 	cp a,#2
      00977A 24 03            [ 1] 3990 	jruge 0$
      00977C CC 87 7F         [ 2] 3991 	jp syntax_error 
      00977F A1 03            [ 1] 3992 0$:	cp a,#3
      009781 25 06            [ 1] 3993 	jrult 1$
      009783 CD 8F FE         [ 4] 3994 	call dpop 
      009786 9F               [ 1] 3995 	ld a,xl
      009787 6B 01            [ 1] 3996 	ld (XMASK,sp),a 
      009789 CD 8F FE         [ 4] 3997 1$: call dpop ; mask 
      00978C 9F               [ 1] 3998 	ld a,xl 
      00978D 6B 02            [ 1] 3999 	ld (MASK,sp),a 
      00978F CD 8F FE         [ 4] 4000 	call dpop ; address 
      009792 F6               [ 1] 4001 2$:	ld a,(x)
      009793 14 02            [ 1] 4002 	and a,(MASK,sp)
      009795 18 01            [ 1] 4003 	xor a,(XMASK,sp)
      009797 27 F9            [ 1] 4004 	jreq 2$ 
      001719                       4005 	_drop VSIZE 
      009799 5B 04            [ 2]    1     addw sp,#VSIZE 
      00979B 81               [ 4] 4006 	ret 
                                   4007 
                                   4008 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4009 ; BASIC: BSET addr,mask
                                   4010 ; set bits at 'addr' corresponding 
                                   4011 ; to those of 'mask' that are at 1.
                                   4012 ; arguments:
                                   4013 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4014 ;   mask        mask|addr
                                   4015 ; output:
                                   4016 ;	none 
                                   4017 ;--------------------------
      00979C                       4018 bit_set:
      00979C CD 92 1E         [ 4] 4019 	call arg_list 
      00979F A1 02            [ 1] 4020 	cp a,#2	 
      0097A1 27 03            [ 1] 4021 	jreq 1$ 
      0097A3 CC 87 7F         [ 2] 4022 	jp syntax_error
      0097A6                       4023 1$: 
      0097A6 CD 8F FE         [ 4] 4024 	call dpop ; mask 
      0097A9 9F               [ 1] 4025 	ld a,xl 
      0097AA CD 8F FE         [ 4] 4026 	call dpop ; addr  
      0097AD FA               [ 1] 4027 	or a,(x)
      0097AE F7               [ 1] 4028 	ld (x),a
      0097AF 81               [ 4] 4029 	ret 
                                   4030 
                                   4031 ;---------------------
                                   4032 ; BASIC: BRES addr,mask
                                   4033 ; reset bits at 'addr' corresponding 
                                   4034 ; to those of 'mask' that are at 1.
                                   4035 ; arguments:
                                   4036 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4037 ;   mask	    ~mask&*addr  
                                   4038 ; output:
                                   4039 ;	none 
                                   4040 ;--------------------------
      0097B0                       4041 bit_reset:
      0097B0 CD 92 1E         [ 4] 4042 	call arg_list 
      0097B3 A1 02            [ 1] 4043 	cp a,#2  
      0097B5 27 03            [ 1] 4044 	jreq 1$ 
      0097B7 CC 87 7F         [ 2] 4045 	jp syntax_error
      0097BA                       4046 1$: 
      0097BA CD 8F FE         [ 4] 4047 	call dpop ; mask 
      0097BD 9F               [ 1] 4048 	ld a,xl 
      0097BE 43               [ 1] 4049 	cpl a 
      0097BF CD 8F FE         [ 4] 4050 	call dpop ; addr  
      0097C2 F4               [ 1] 4051 	and a,(x)
      0097C3 F7               [ 1] 4052 	ld (x),a 
      0097C4 81               [ 4] 4053 	ret 
                                   4054 
                                   4055 ;---------------------
                                   4056 ; BASIC: BRES addr,mask
                                   4057 ; toggle bits at 'addr' corresponding 
                                   4058 ; to those of 'mask' that are at 1.
                                   4059 ; arguments:
                                   4060 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4061 ;   mask	    mask^*addr  
                                   4062 ; output:
                                   4063 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4064 ;--------------------------
      0097C5                       4065 bit_toggle:
      0097C5 CD 92 1E         [ 4] 4066 	call arg_list 
      0097C8 A1 02            [ 1] 4067 	cp a,#2 
      0097CA 27 03            [ 1] 4068 	jreq 1$ 
      0097CC CC 87 7F         [ 2] 4069 	jp syntax_error
      0097CF CD 8F FE         [ 4] 4070 1$: call dpop ; mask 
      0097D2 9F               [ 1] 4071 	ld a,xl 
      0097D3 CD 8F FE         [ 4] 4072 	call dpop ; addr  
      0097D6 F8               [ 1] 4073 	xor a,(x)
      0097D7 F7               [ 1] 4074 	ld (x),a 
      0097D8 81               [ 4] 4075 	ret 
                                   4076 
                                   4077 
                                   4078 ;---------------------
                                   4079 ; BASIC: BTEST(addr,bit)
                                   4080 ; return bit value at 'addr' 
                                   4081 ; bit is in range {0..7}.
                                   4082 ; arguments:
                                   4083 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4084 ;   bit 	    bit position {0..7}  
                                   4085 ; output:
                                   4086 ;	none 
                                   4087 ;--------------------------
      0097D9                       4088 bit_test:
      0097D9 A6 0B            [ 1] 4089 	ld a,#TK_LPAREN 
      0097DB CD 92 11         [ 4] 4090 	call expect 
      0097DE CD 92 1E         [ 4] 4091 	call arg_list 
      0097E1 A1 02            [ 1] 4092 	cp a,#2
      0097E3 27 03            [ 1] 4093 	jreq 0$
      0097E5 CC 87 7F         [ 2] 4094 	jp syntax_error
      0097E8 A6 0C            [ 1] 4095 0$:	ld a,#TK_RPAREN
      0097EA CD 92 11         [ 4] 4096 	call expect 
      0097ED CD 8F FE         [ 4] 4097 	call dpop 
      0097F0 9F               [ 1] 4098 	ld a,xl 
      0097F1 A4 07            [ 1] 4099 	and a,#7
      0097F3 88               [ 1] 4100 	push a 
      0097F4 A6 01            [ 1] 4101 	ld a,#1 
      0097F6 0D 01            [ 1] 4102 1$: tnz (1,sp)
      0097F8 27 05            [ 1] 4103 	jreq 2$
      0097FA 48               [ 1] 4104 	sll a 
      0097FB 0A 01            [ 1] 4105 	dec (1,sp)
      0097FD 20 F7            [ 2] 4106 	jra 1$
      0097FF CD 8F FE         [ 4] 4107 2$: call dpop 
      009802 F4               [ 1] 4108 	and a,(x)
      009803 27 02            [ 1] 4109 	jreq 3$
      009805 A6 01            [ 1] 4110 	ld a,#1 
      009807 5F               [ 1] 4111 3$:	clrw x 
      009808 97               [ 1] 4112 	ld xl,a 
      009809 A6 04            [ 1] 4113 	ld a,#TK_INTGR
      00178B                       4114 	_drop 1 
      00980B 5B 01            [ 2]    1     addw sp,#1 
      00980D 81               [ 4] 4115 	ret
                                   4116 
                                   4117 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4118 ;--------------------
                                   4119 ; BASIC: POKE addr,byte
                                   4120 ; put a byte at addr 
                                   4121 ;--------------------
      00980E                       4122 poke:
      00980E CD 92 1E         [ 4] 4123 	call arg_list 
      009811 A1 02            [ 1] 4124 	cp a,#2
      009813 27 03            [ 1] 4125 	jreq 1$
      009815 CC 87 7F         [ 2] 4126 	jp syntax_error
      009818                       4127 1$:	
      009818 CD 8F FE         [ 4] 4128 	call dpop 
      00981B 9F               [ 1] 4129     ld a,xl 
      00981C CD 8F FE         [ 4] 4130 	call dpop 
      00981F F7               [ 1] 4131 	ld (x),a 
      009820 81               [ 4] 4132 	ret 
                                   4133 
                                   4134 ;-----------------------
                                   4135 ; BASIC: PEEK(addr)
                                   4136 ; get the byte at addr 
                                   4137 ; input:
                                   4138 ;	none 
                                   4139 ; output:
                                   4140 ;	X 		value 
                                   4141 ;-----------------------
      009821                       4142 peek:
      009821 A6 0B            [ 1] 4143 	ld a,#TK_LPAREN 
      009823 CD 92 11         [ 4] 4144 	call expect 
      009826 CD 92 1E         [ 4] 4145 	call arg_list
      009829 A1 01            [ 1] 4146 	cp a,#1 
      00982B 27 03            [ 1] 4147 	jreq 1$
      00982D CC 87 7F         [ 2] 4148 	jp syntax_error
      009830 A6 0C            [ 1] 4149 1$:	ld a,#TK_RPAREN 
      009832 CD 92 11         [ 4] 4150 	call expect 
      009835 CD 8F FE         [ 4] 4151 	call dpop 
      009838 F6               [ 1] 4152 	ld a,(x)
      009839 5F               [ 1] 4153 	clrw x 
      00983A 97               [ 1] 4154 	ld xl,a 
      00983B A6 04            [ 1] 4155 	ld a,#TK_INTGR
      00983D 81               [ 4] 4156 	ret 
                                   4157 
      00983E                       4158 if: 
      00983E CD 93 5D         [ 4] 4159 	call relation 
      009841 A1 04            [ 1] 4160 	cp a,#TK_INTGR
      009843 27 03            [ 1] 4161 	jreq 1$ 
      009845 CC 87 7F         [ 2] 4162 	jp syntax_error
      009848 4F               [ 1] 4163 1$:	clr a 
      009849 5D               [ 2] 4164 	tnzw x 
      00984A 26 05            [ 1] 4165 	jrne 9$  
                                   4166 ;skip to next line
      00984C 55 00 04 00 02   [ 1] 4167 	mov in,count
      009851 81               [ 4] 4168 9$:	ret 
                                   4169 
                                   4170 ;------------------------
                                   4171 ; BASIC: FOR var=expr 
                                   4172 ; set variable to expression 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4173 ; leave variable address 
                                   4174 ; on dstack and set
                                   4175 ; FFOR bit in 'flags'
                                   4176 ;-----------------
                           000001  4177 	RETL1=1
                           000003  4178 	INW=3
                           000005  4179 	BPTR=5
      009852                       4180 for: ; { -- var_addr }
      009852 A6 05            [ 1] 4181 	ld a,#TK_VAR 
      009854 CD 92 11         [ 4] 4182 	call expect
      009857 CD 8F F1         [ 4] 4183 	call dpush 
      00985A CD 94 04         [ 4] 4184 	call let02 
      00985D 72 14 00 20      [ 1] 4185 	bset flags,#FFOR 
                                   4186 ; open space on cstack for BPTR and INW 
      009861 85               [ 2] 4187 	popw x ; call return address 
      0017E2                       4188 	_vars 4
      009862 52 04            [ 2]    1     sub sp,#4 
      009864 89               [ 2] 4189 	pushw x  ; RETL1 
      009865 5F               [ 1] 4190 	clrw x 
      009866 1F 05            [ 2] 4191 	ldw (BPTR,sp),x 
      009868 1F 03            [ 2] 4192 	ldw (INW,sp),x 
      00986A CD 88 5F         [ 4] 4193 	call next_token 
      00986D A1 06            [ 1] 4194 	cp a,#TK_CMD 
      00986F 27 03            [ 1] 4195 	jreq 1$
      009871 CC 87 7F         [ 2] 4196 	jp syntax_error
      009874                       4197 1$:  
      009874 A3 98 7C         [ 2] 4198 	cpw x,#to 
      009877 27 03            [ 1] 4199 	jreq to
      009879 CC 87 7F         [ 2] 4200 	jp syntax_error 
                                   4201 
                                   4202 ;-----------------------------------
                                   4203 ; BASIC: TO expr 
                                   4204 ; second part of FOR loop initilization
                                   4205 ; leave limit on dstack and set 
                                   4206 ; FTO bit in 'flags'
                                   4207 ;-----------------------------------
      00987C                       4208 to: ; { var_addr -- var_addr limit step }
      00987C 72 04 00 20 03   [ 2] 4209 	btjt flags,#FFOR,1$
      009881 CC 87 7F         [ 2] 4210 	jp syntax_error
      009884 CD 93 5D         [ 4] 4211 1$: call relation  
      009887 A1 04            [ 1] 4212 	cp a,#TK_INTGR 
      009889 27 03            [ 1] 4213 	jreq 2$ 
      00988B CC 87 7F         [ 2] 4214 	jp syntax_error
      00988E                       4215 2$: 
      00988E CD 8F F1         [ 4] 4216     call dpush ; limit
      009891 CE 00 01         [ 2] 4217 	ldw x,in.w 
      009894 CD 88 5F         [ 4] 4218 	call next_token
      009897 A1 00            [ 1] 4219 	cp a,#TK_NONE  
      009899 27 0C            [ 1] 4220 	jreq 4$ 
      00989B A1 06            [ 1] 4221 	cp a,#TK_CMD
      00989D 26 05            [ 1] 4222 	jrne 3$
      00989F A3 98 AC         [ 2] 4223 	cpw x,#step 
      0098A2 27 08            [ 1] 4224 	jreq step
      0098A4                       4225 3$:	
      0098A4 CD 8F EB         [ 4] 4226 	call unget_token   	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0098A7                       4227 4$:	
      0098A7 AE 00 01         [ 2] 4228 	ldw x,#1   ; default step  
      0098AA 20 12            [ 2] 4229 	jra store_loop_addr 
                                   4230 
                                   4231 
                                   4232 ;----------------------------------
                                   4233 ; BASIC: STEP expr 
                                   4234 ; optional third par of FOR loop
                                   4235 ; initialization. 	
                                   4236 ;------------------------------------
      0098AC                       4237 step: ; {var limit -- var limit step}
      0098AC 72 04 00 20 03   [ 2] 4238 	btjt flags,#FFOR,1$
      0098B1 CC 87 7F         [ 2] 4239 	jp syntax_error
      0098B4 CD 93 5D         [ 4] 4240 1$: call relation
      0098B7 A1 04            [ 1] 4241 	cp a,#TK_INTGR
      0098B9 27 03            [ 1] 4242 	jreq store_loop_addr  
      0098BB CC 87 7F         [ 2] 4243 	jp syntax_error
                                   4244 ; leave loop back entry point on cstack 
                                   4245 ; cstack is 2 call deep from interp_loop
      0098BE                       4246 store_loop_addr:
      0098BE CD 8F F1         [ 4] 4247 	call dpush 
      0098C1 CE 00 05         [ 2] 4248 	ldw x,basicptr  
      0098C4 1F 05            [ 2] 4249 	ldw (BPTR,sp),x 
      0098C6 CE 00 01         [ 2] 4250 	ldw x,in.w 
      0098C9 1F 03            [ 2] 4251 	ldw (INW,sp),x   
      0098CB 72 15 00 20      [ 1] 4252 	bres flags,#FFOR 
      0098CF 72 5C 00 1D      [ 1] 4253 	inc loop_depth  
      0098D3 81               [ 4] 4254 	ret 
                                   4255 
                                   4256 ;--------------------------------
                                   4257 ; BASIC: NEXT var 
                                   4258 ; FOR loop control 
                                   4259 ; increment variable with step 
                                   4260 ; and compare with limit 
                                   4261 ; loop if threshold not crossed.
                                   4262 ; else clean both stacks. 
                                   4263 ; and decrement 'loop_depth' 
                                   4264 ;--------------------------------
      0098D4                       4265 next: ; {var limit step -- [var limit step ] }
      0098D4 72 5D 00 1D      [ 1] 4266 	tnz loop_depth 
      0098D8 26 03            [ 1] 4267 	jrne 1$ 
      0098DA CC 87 7F         [ 2] 4268 	jp syntax_error 
      0098DD                       4269 1$: 
      0098DD A6 05            [ 1] 4270 	ld a,#TK_VAR 
      0098DF CD 92 11         [ 4] 4271 	call expect
                                   4272 ; check for good variable after NEXT 	 
      0098E2 90 93            [ 1] 4273 	ldw y,x 
      0098E4 AE 00 04         [ 2] 4274 	ldw x,#4  
      0098E7 72 D3 00 17      [ 4] 4275 	cpw y,([dstkptr],x) ; compare variables address 
      0098EB 27 03            [ 1] 4276 	jreq 2$  
      0098ED CC 87 7F         [ 2] 4277 	jp syntax_error ; not the good one 
      0098F0                       4278 2$: ; increment variable 
      0098F0 93               [ 1] 4279 	ldw x,y
      0098F1 FE               [ 2] 4280 	ldw x,(x)  ; get var value 
      0098F2 CF 00 09         [ 2] 4281 	ldw acc16,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0098F5 72 CE 00 17      [ 5] 4282 	ldw x,[dstkptr] ; step
      0098F9 72 BB 00 09      [ 2] 4283 	addw x,acc16 ; var+step 
      0098FD 90 FF            [ 2] 4284 	ldw (y),x ; save var new value 
                                   4285 ; compare with limit 
      0098FF 90 93            [ 1] 4286 	ldw y,x 
      009901 72 CE 00 17      [ 5] 4287 	ldw x,[dstkptr] ; step in x 
      009905 5D               [ 2] 4288 	tnzw x  
      009906 2A 0B            [ 1] 4289 	jrpl 4$ ; positive step 
                                   4290 ;negative step 
      009908 AE 00 02         [ 2] 4291 	ldw x,#2
      00990B 72 D3 00 17      [ 4] 4292 	cpw y,([dstkptr],x)
      00990F 2F 20            [ 1] 4293 	jrslt loop_done
      009911 20 09            [ 2] 4294 	jra loop_back 
      009913                       4295 4$: ; positive step
      009913 AE 00 02         [ 2] 4296 	ldw x,#2 
      009916 72 D3 00 17      [ 4] 4297 	cpw y,([dstkptr],x)
      00991A 2C 15            [ 1] 4298 	jrsgt loop_done
      00991C                       4299 loop_back:
      00991C 1E 05            [ 2] 4300 	ldw x,(BPTR,sp)
      00991E CF 00 05         [ 2] 4301 	ldw basicptr,x 
      009921 72 01 00 20 05   [ 2] 4302 	btjf flags,#FRUN,1$ 
      009926 E6 02            [ 1] 4303 	ld a,(2,x)
      009928 C7 00 04         [ 1] 4304 	ld count,a
      00992B 1E 03            [ 2] 4305 1$:	ldw x,(INW,sp)
      00992D CF 00 01         [ 2] 4306 	ldw in.w,x 
      009930 81               [ 4] 4307 	ret 
      009931                       4308 loop_done:
                                   4309 	; remove var limit step on dstack 
      009931 CE 00 17         [ 2] 4310 	ldw x,dstkptr 
      009934 1C 00 06         [ 2] 4311 	addw x,#3*CELL_SIZE
      009937 CF 00 17         [ 2] 4312 	ldw dstkptr,x 
                                   4313 	; remove 2 return address on cstack 
      00993A 85               [ 2] 4314 	popw x
      0018BB                       4315 	_drop 4
      00993B 5B 04            [ 2]    1     addw sp,#4 
      00993D 89               [ 2] 4316 	pushw x 
      00993E 72 5A 00 1D      [ 1] 4317 	dec loop_depth 
      009942 81               [ 4] 4318 	ret 
                                   4319 
                                   4320 
                                   4321 ;------------------------
                                   4322 ; BASIC: GOTO line# 
                                   4323 ; jump to line# 
                                   4324 ; here cstack is 2 call deep from interp_loop 
                                   4325 ;------------------------
      009943                       4326 goto:
      009943 72 00 00 20 06   [ 2] 4327 	btjt flags,#FRUN,0$ 
      009948 A6 06            [ 1] 4328 	ld a,#ERR_RUN_ONLY
      00994A CC 87 81         [ 2] 4329 	jp tb_error 
      00994D 81               [ 4] 4330 	ret 
      00994E 20 23            [ 2] 4331 0$:	jra go_common
                                   4332 
                                   4333 ;--------------------
                                   4334 ; BASIC: GOSUB line#
                                   4335 ; basic subroutine call
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4336 ; actual line# and basicptr 
                                   4337 ; are saved on cstack
                                   4338 ; here cstack is 2 call deep from interp_loop 
                                   4339 ;--------------------
                           000003  4340 	GOS_RET=3
      009950                       4341 gosub:
      009950 72 00 00 20 06   [ 2] 4342 	btjt flags,#FRUN,0$ 
      009955 A6 06            [ 1] 4343 	ld a,#ERR_RUN_ONLY
      009957 CC 87 81         [ 2] 4344 	jp tb_error 
      00995A 81               [ 4] 4345 	ret 
      00995B 85               [ 2] 4346 0$:	popw x 
      00995C 52 02            [ 2] 4347 	sub sp,#2 
      00995E 89               [ 2] 4348 	pushw x 
      00995F CE 00 05         [ 2] 4349 	ldw x,basicptr
      009962 E6 02            [ 1] 4350 	ld a,(2,x)
      009964 AB 03            [ 1] 4351 	add a,#3 
      009966 C7 00 0A         [ 1] 4352 	ld acc8,a 
      009969 72 5F 00 09      [ 1] 4353 	clr acc16 
      00996D 72 BB 00 09      [ 2] 4354 	addw x,acc16
      009971 1F 03            [ 2] 4355 	ldw (GOS_RET,sp),x 
      009973                       4356 go_common: 
      009973 CD 93 5D         [ 4] 4357 	call relation 
      009976 A1 04            [ 1] 4358 	cp a,#TK_INTGR
      009978 27 03            [ 1] 4359 	jreq 1$ 
      00997A CC 87 7F         [ 2] 4360 	jp syntax_error
      00997D                       4361 1$: 
      00997D CD 83 60         [ 4] 4362 	call search_lineno  
      009980 5D               [ 2] 4363 	tnzw x 
      009981 26 05            [ 1] 4364 	jrne 2$ 
      009983 A6 05            [ 1] 4365 	ld a,#ERR_NO_LINE 
      009985 CC 87 81         [ 2] 4366 	jp tb_error 
      009988                       4367 2$: 
      009988 CF 00 05         [ 2] 4368 	ldw basicptr,x 
      00998B E6 02            [ 1] 4369 	ld a,(2,x)
      00998D C7 00 04         [ 1] 4370 	ld count,a 
      009990 35 03 00 02      [ 1] 4371 	mov in,#3 
      009994 81               [ 4] 4372 	ret 
                                   4373 
                                   4374 ;------------------------
                                   4375 ; BASIC: RETURN 
                                   4376 ; exit from a subroutine 
                                   4377 ; cstack is 2 level deep from interp_loop 
                                   4378 ;------------------------
      009995                       4379 return:
      009995 72 00 00 20 05   [ 2] 4380 	btjt flags,#FRUN,0$ 
      00999A A6 06            [ 1] 4381 	ld a,#ERR_RUN_ONLY
      00999C CC 87 81         [ 2] 4382 	jp tb_error 
      00999F                       4383 0$:	
      00999F 1E 03            [ 2] 4384 	ldw x,(GOS_RET,sp) 
      0099A1 CF 00 05         [ 2] 4385 	ldw basicptr,x 
      0099A4 E6 02            [ 1] 4386 	ld a,(2,x)
      0099A6 AB 03            [ 1] 4387 	add a,#3 
      0099A8 C7 00 04         [ 1] 4388 	ld count,a 
      0099AB 35 03 00 02      [ 1] 4389 	mov in,#3
      0099AF 4F               [ 1] 4390 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0099B0 85               [ 2] 4391 	popw x 
      001931                       4392 	_drop 2
      0099B1 5B 02            [ 2]    1     addw sp,#2 
      0099B3 89               [ 2] 4393 	pushw x
      0099B4 81               [ 4] 4394 	ret  
                                   4395 
                                   4396 
                                   4397 ;----------------------------------
                                   4398 ; BASIC: RUN
                                   4399 ; run BASIC program in RAM
                                   4400 ;----------------------------------- 
      0099B5                       4401 run: 
      0099B5 72 01 00 20 02   [ 2] 4402 	btjf flags,#FRUN,0$  
      0099BA 4F               [ 1] 4403 	clr a 
      0099BB 81               [ 4] 4404 	ret
      0099BC                       4405 0$: 
      0099BC 72 09 00 20 12   [ 2] 4406 	btjf flags,#FBREAK,1$
      001941                       4407 	_drop 2 
      0099C1 5B 02            [ 2]    1     addw sp,#2 
      0099C3 CD 96 E7         [ 4] 4408 	call rest_context
      001946                       4409 	_drop CTXT_SIZE 
      0099C6 5B 06            [ 2]    1     addw sp,#CTXT_SIZE 
      0099C8 72 19 00 20      [ 1] 4410 	bres flags,#FBREAK 
      0099CC 72 10 00 20      [ 1] 4411 	bset flags,#FRUN 
      0099D0 CC 88 2F         [ 2] 4412 	jp interp_loop 
      0099D3 CE 00 19         [ 2] 4413 1$:	ldw x,txtbgn
      0099D6 C3 00 1B         [ 2] 4414 	cpw x,txtend 
      0099D9 2B 02            [ 1] 4415 	jrmi 2$ 
      0099DB 4F               [ 1] 4416 	clr a 
      0099DC 81               [ 4] 4417 	ret 
      0099DD CD 93 D8         [ 4] 4418 2$: call ubound 
      001960                       4419 	_drop 2 
      0099E0 5B 02            [ 2]    1     addw sp,#2 
      0099E2 CE 00 19         [ 2] 4420 	ldw x,txtbgn 
      0099E5 CF 00 05         [ 2] 4421 	ldw basicptr,x 
      0099E8 E6 02            [ 1] 4422 	ld a,(2,x)
      0099EA C7 00 04         [ 1] 4423 	ld count,a
      0099ED 35 03 00 02      [ 1] 4424 	mov in,#3	
      0099F1 72 10 00 20      [ 1] 4425 	bset flags,#FRUN 
      0099F5 CC 88 2F         [ 2] 4426 	jp interp_loop 
                                   4427 
                                   4428 
                                   4429 ;----------------------
                                   4430 ; BASIC: STOP 
                                   4431 ; stop running program
                                   4432 ;---------------------- 
      0099F8                       4433 stop: 
                                   4434 ; clean dstack and cstack 
      0099F8 AE 17 FF         [ 2] 4435 	ldw x,#STACK_EMPTY 
      0099FB 94               [ 1] 4436 	ldw sp,x 
      0099FC 72 11 00 20      [ 1] 4437 	bres flags,#FRUN 
      009A00 72 19 00 20      [ 1] 4438 	bres flags,#FBREAK
      009A04 CC 87 D3         [ 2] 4439 	jp warm_start
                                   4440 
                                   4441 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4442 ; BASIC BEEP expr1,expr2
                                   4443 ; used MCU internal beeper 
                                   4444 ; to produce a sound
                                   4445 ; arguments:
                                   4446 ;    expr1   frequency  (expr1%32)
                                   4447 ;    expr2   duration msec.
                                   4448 ;---------------------------
      009A07                       4449 beep:
      009A07 CD 92 1E         [ 4] 4450 	call arg_list 
      009A0A A1 02            [ 1] 4451 	cp a,#2 
      009A0C 27 03            [ 1] 4452 	jreq 1$
      009A0E CC 87 7F         [ 2] 4453 	jp syntax_error 
      009A11                       4454 1$: 
      009A11 CE 00 17         [ 2] 4455 	ldw x,dstkptr 
      009A14 EE 02            [ 2] 4456 	ldw x,(2,x);frequency 
      009A16 A6 1F            [ 1] 4457 	ld a,#31
      009A18 62               [ 2] 4458 	div x,a 
      009A19 C7 50 F3         [ 1] 4459 	ld BEEP_CSR,a	
      009A1C 72 1A 50 F3      [ 1] 4460 	bset BEEP_CSR,#5 
      009A20 CD 8F FE         [ 4] 4461 	call dpop 
      009A23 CD 9E D5         [ 4] 4462 	call pause02 
      009A26 CD 90 25         [ 4] 4463 	call ddrop 
      009A29 A6 1F            [ 1] 4464 	ld a,#0x1f
      009A2B C7 50 F3         [ 1] 4465 	ld BEEP_CSR,a 
      009A2E 81               [ 4] 4466 	ret 
                                   4467 
                                   4468 ;-------------------------------
                                   4469 ; BASIC: PWRADC 0|1 [,divisor]  
                                   4470 ; disable/enanble ADC 
                                   4471 ;-------------------------------
      009A2F                       4472 power_adc:
      009A2F CD 92 1E         [ 4] 4473 	call arg_list 
      009A32 A1 02            [ 1] 4474 	cp a,#2	
      009A34 27 0D            [ 1] 4475 	jreq 1$
      009A36 A1 01            [ 1] 4476 	cp a,#1 
      009A38 27 03            [ 1] 4477 	jreq 0$ 
      009A3A CC 87 7F         [ 2] 4478 	jp syntax_error 
      009A3D AE 00 00         [ 2] 4479 0$: ldw x,#0
      009A40 CD 8F F1         [ 4] 4480 	call dpush 
      009A43 AE 00 02         [ 2] 4481 1$: ldw x,#2
      009A46 72 DE 00 17      [ 5] 4482 	ldw x,([dstkptr],x) ; on|off
      009A4A 5D               [ 2] 4483 	tnzw x 
      009A4B 27 1C            [ 1] 4484 	jreq 2$ 
      009A4D 72 CE 00 17      [ 5] 4485 	ldw x,[dstkptr] ; divisor 
      009A51 9F               [ 1] 4486 	ld a,xl
      009A52 A4 07            [ 1] 4487 	and a,#7
      009A54 4E               [ 1] 4488 	swap a 
      009A55 C7 54 01         [ 1] 4489 	ld ADC_CR1,a
      009A58 72 16 54 02      [ 1] 4490 	bset ADC_CR2,#ADC_CR2_ALIGN ; right 
      009A5C 72 10 54 01      [ 1] 4491 	bset ADC_CR1,#ADC_CR1_ADON 
      0019E0                       4492 	_usec_dly 7 
      009A60 AE 00 1B         [ 2]    1     ldw x,#(16*7-2)/4
      009A63 5A               [ 2]    2     decw x
      009A64 9D               [ 1]    3     nop 
      009A65 26 FA            [ 1]    4     jrne .-4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009A67 20 04            [ 2] 4493 	jra 3$
      009A69 72 11 54 01      [ 1] 4494 2$: bres ADC_CR1,#ADC_CR1_ADON 
      009A6D AE 00 02         [ 2] 4495 3$:	ldw x,#2
      009A70 CD 90 62         [ 4] 4496 	call ddrop_n 
      009A73 81               [ 4] 4497 	ret
                                   4498 
                                   4499 ;-----------------------------
                                   4500 ; BASIC: RDADC(channel)
                                   4501 ; read adc channel 
                                   4502 ; output:
                                   4503 ;   A 		TK_INTGR 
                                   4504 ;   X 		value 
                                   4505 ;-----------------------------
      009A74                       4506 read_adc:
      009A74 A6 0B            [ 1] 4507 	ld a,#TK_LPAREN 
      009A76 CD 92 11         [ 4] 4508 	call expect 
      009A79 CD 88 5F         [ 4] 4509 	call next_token 
      009A7C A1 04            [ 1] 4510 	cp a,#TK_INTGR 
      009A7E 27 03            [ 1] 4511 	jreq 1$
      009A80 CC 87 7F         [ 2] 4512 	jp syntax_error
      009A83 89               [ 2] 4513 1$: pushw x 
      009A84 A6 0C            [ 1] 4514 	ld a,#TK_RPAREN 
      009A86 CD 92 11         [ 4] 4515 	call expect 
      009A89 85               [ 2] 4516 	popw x 
      009A8A A3 00 10         [ 2] 4517 	cpw x,#16 
      009A8D 25 05            [ 1] 4518 	jrult 2$
      009A8F A6 0A            [ 1] 4519 	ld a,#ERR_BAD_VALUE
      009A91 CC 87 81         [ 2] 4520 	jp tb_error 
      009A94 9F               [ 1] 4521 2$: ld a,xl
      009A95 C7 54 00         [ 1] 4522 	ld ADC_CSR,a 
      009A98 72 10 54 01      [ 1] 4523 	bset ADC_CR1,#ADC_CR1_ADON
      009A9C 72 0F 54 00 FB   [ 2] 4524 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009AA1 CE 54 04         [ 2] 4525 	ldw x,ADC_DRH 
      009AA4 A6 04            [ 1] 4526 	ld a,#TK_INTGR
      009AA6 81               [ 4] 4527 	ret 
                                   4528 
                                   4529 
                                   4530 ;-----------------------
                                   4531 ; BASIC: BREAK 
                                   4532 ; insert a breakpoint 
                                   4533 ; in pogram. 
                                   4534 ; the program is resumed
                                   4535 ; with RUN 
                                   4536 ;-------------------------
      009AA7                       4537 break:
      009AA7 72 00 00 20 02   [ 2] 4538 	btjt flags,#FRUN,2$
      009AAC 4F               [ 1] 4539 	clr a
      009AAD 81               [ 4] 4540 	ret 
      009AAE                       4541 2$:	 
                                   4542 ; create space on cstack to save context 
      009AAE AE 9A D5         [ 2] 4543 	ldw x,#break_point 
      009AB1 CD 82 30         [ 4] 4544 	call puts 
      001A34                       4545 	_drop 2 ;drop return address 
      009AB4 5B 02            [ 2]    1     addw sp,#2 
      001A36                       4546 	_vars CTXT_SIZE ; context size 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009AB6 52 06            [ 2]    1     sub sp,#CTXT_SIZE 
      009AB8 CD 96 D7         [ 4] 4547 	call save_context 
      009ABB AE 16 C8         [ 2] 4548 	ldw x,#tib 
      009ABE CF 00 05         [ 2] 4549 	ldw basicptr,x
      009AC1 7F               [ 1] 4550 	clr (x)
      009AC2 72 5F 00 04      [ 1] 4551 	clr count  
      009AC6 5F               [ 1] 4552 	clrw x 
      009AC7 CF 00 01         [ 2] 4553 	ldw in.w,x
      009ACA 72 11 00 20      [ 1] 4554 	bres flags,#FRUN 
      009ACE 72 18 00 20      [ 1] 4555 	bset flags,#FBREAK
      009AD2 CC 88 2F         [ 2] 4556 	jp interp_loop 
      009AD5 0A 62 72 65 61 6B 20  4557 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4558 
                                   4559 ;-----------------------
                                   4560 ; BASIC: NEW
                                   4561 ; from command line only 
                                   4562 ; free program memory
                                   4563 ; and clear variables 
                                   4564 ;------------------------
      009AF3                       4565 new: 
      009AF3 72 01 00 20 02   [ 2] 4566 	btjf flags,#FRUN,0$ 
      009AF8 4F               [ 1] 4567 	clr a 
      009AF9 81               [ 4] 4568 	ret 
      009AFA                       4569 0$:	
      009AFA CD 86 51         [ 4] 4570 	call clear_basic 
      009AFD 81               [ 4] 4571 	ret 
                                   4572 	 
                                   4573 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4574 ;   file system routines
                                   4575 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4576 
                                   4577 ;--------------------
                                   4578 ; input:
                                   4579 ;   X     increment 
                                   4580 ; output:
                                   4581 ;   farptr  incremented 
                                   4582 ;---------------------
      009AFE                       4583 incr_farptr:
      009AFE 72 BB 00 12      [ 2] 4584 	addw x,farptr+1 
      009B02 24 04            [ 1] 4585 	jrnc 1$
      009B04 72 5C 00 11      [ 1] 4586 	inc farptr 
      009B08 CF 00 12         [ 2] 4587 1$:	ldw farptr+1,x  
      009B0B 81               [ 4] 4588 	ret 
                                   4589 
                                   4590 ;------------------------------
                                   4591 ; extended flash memory used as FLASH_DRIVE 
                                   4592 ; seek end of used flash drive   
                                   4593 ; starting at 0x10000 address.
                                   4594 ; 4 consecutives 0 bytes signal free space. 
                                   4595 ; input:
                                   4596 ;	none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4597 ; output:
                                   4598 ;   ffree     free_addr| 0 if memory full.
                                   4599 ;------------------------------
      009B0C                       4600 seek_fdrive:
                                   4601 ; start scan at 0x10000 address 
      009B0C A6 01            [ 1] 4602 	ld a,#1
      009B0E C7 00 11         [ 1] 4603 	ld farptr,a 
      009B11 5F               [ 1] 4604 	clrw x 
      009B12 CF 00 12         [ 2] 4605 	ldw farptr+1,x 
      009B15                       4606 1$:
      009B15 AE 00 03         [ 2] 4607 	ldw x,#3  
      009B18 92 AF 00 11      [ 5] 4608 2$:	ldf a,([farptr],x) 
      009B1C 26 05            [ 1] 4609 	jrne 3$
      009B1E 5A               [ 2] 4610 	decw x
      009B1F 2A F7            [ 1] 4611 	jrpl 2$
      009B21 20 19            [ 2] 4612 	jra 4$ 
      009B23 5C               [ 1] 4613 3$:	incw x 
      009B24 CD 9A FE         [ 4] 4614 	call incr_farptr
      009B27 AE 02 7F         [ 2] 4615 	ldw x,#0x27f 
      009B2A C3 00 11         [ 2] 4616 	cpw x,farptr
      009B2D 2A E6            [ 1] 4617 	jrpl 1$
                                   4618 ; drive full 
      009B2F 72 5F 00 14      [ 1] 4619 	clr ffree 
      009B33 72 5F 00 15      [ 1] 4620 	clr ffree+1 
      009B37 72 5F 00 16      [ 1] 4621 	clr ffree+2 
      009B3B 81               [ 4] 4622 	ret
      009B3C                       4623 4$: ; copy farptr to ffree	 
      009B3C CE 00 11         [ 2] 4624 	ldw x,farptr 
      009B3F C6 00 13         [ 1] 4625 	ld a,farptr+2 
      009B42 CF 00 14         [ 2] 4626 	ldw ffree,x 
      009B45 C7 00 16         [ 1] 4627 	ld ffree+2,a  
      009B48 81               [ 4] 4628 	ret 
                                   4629 
                                   4630 ;-----------------------
                                   4631 ; compare file name 
                                   4632 ; with name pointed by Y  
                                   4633 ; input:
                                   4634 ;   farptr   file name 
                                   4635 ;   Y        target name 
                                   4636 ; output:
                                   4637 ;   farptr 	 at file_name
                                   4638 ;   X 		 farptr[x] point at size field  
                                   4639 ;   Carry    0|1 no match|match  
                                   4640 ;----------------------
      009B49                       4641 cmp_name:
      009B49 5F               [ 1] 4642 	clrw x
      009B4A 92 AF 00 11      [ 5] 4643 1$:	ldf a,([farptr],x)
      009B4E 90 F1            [ 1] 4644 	cp a,(y)
      009B50 26 08            [ 1] 4645 	jrne 4$
      009B52 4D               [ 1] 4646 	tnz a 
      009B53 27 12            [ 1] 4647 	jreq 9$ 
      009B55 5C               [ 1] 4648     incw x 
      009B56 90 5C            [ 1] 4649 	incw y 
      009B58 20 F0            [ 2] 4650 	jra 1$
      009B5A                       4651 4$: ;no match 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009B5A 4D               [ 1] 4652 	tnz a 
      009B5B 27 07            [ 1] 4653 	jreq 5$
      009B5D 5C               [ 1] 4654 	incw x 
      009B5E 92 AF 00 11      [ 5] 4655 	ldf a,([farptr],x)
      009B62 20 F6            [ 2] 4656 	jra 4$  
      009B64 5C               [ 1] 4657 5$:	incw x ; farptr[x] point at 'size' field 
      009B65 98               [ 1] 4658 	rcf 
      009B66 81               [ 4] 4659 	ret
      009B67                       4660 9$: ; match  
      009B67 5C               [ 1] 4661 	incw x  ; farptr[x] at 'size' field 
      009B68 99               [ 1] 4662 	scf 
      009B69 81               [ 4] 4663 	ret 
                                   4664 
                                   4665 ;-----------------------
                                   4666 ; search file in 
                                   4667 ; flash memory 
                                   4668 ; input:
                                   4669 ;   Y       file name  
                                   4670 ; output:
                                   4671 ;   farptr  addr at name|0
                                   4672 ;-----------------------
                           000001  4673 	FSIZE=1
                           000003  4674 	YSAVE=3
                           000004  4675 	VSIZE=4 
      009B6A                       4676 search_file: 
      001AEA                       4677 	_vars VSIZE
      009B6A 52 04            [ 2]    1     sub sp,#VSIZE 
      009B6C 17 03            [ 2] 4678 	ldw (YSAVE,sp),y  
      009B6E 5F               [ 1] 4679 	clrw x 
      009B6F CF 00 12         [ 2] 4680 	ldw farptr+1,x 
      009B72 35 01 00 11      [ 1] 4681 	mov farptr,#1
      009B76                       4682 1$:	
                                   4683 ; check if farptr is after any file 
                                   4684 ; if  0 then so.
      009B76 92 BC 00 11      [ 5] 4685 	ldf a,[farptr]
      009B7A 27 25            [ 1] 4686 	jreq 6$
      009B7C 5F               [ 1] 4687 2$: clrw x 	
      009B7D 16 03            [ 2] 4688 	ldw y,(YSAVE,sp) 
      009B7F CD 9B 49         [ 4] 4689 	call cmp_name
      009B82 25 2D            [ 1] 4690 	jrc 9$
      009B84 92 AF 00 11      [ 5] 4691 	ldf a,([farptr],x)
      009B88 6B 01            [ 1] 4692 	ld (FSIZE,sp),a 
      009B8A 5C               [ 1] 4693 	incw x 
      009B8B 92 AF 00 11      [ 5] 4694 	ldf a,([farptr],x)
      009B8F 6B 02            [ 1] 4695 	ld (FSIZE+1,sp),a 
      009B91 5C               [ 1] 4696 	incw x 
      009B92 72 FB 01         [ 2] 4697 	addw x,(FSIZE,sp) ; count to skip 
      009B95 5C               [ 1] 4698 	incw x ; skip over EOF marker 
      009B96 CD 9A FE         [ 4] 4699 	call incr_farptr ; now at next file 'name_field'
      009B99 AE 02 80         [ 2] 4700 	ldw x,#0x280
      009B9C C3 00 11         [ 2] 4701 	cpw x,farptr 
      009B9F 2A D5            [ 1] 4702 	jrpl 1$
      009BA1                       4703 6$: ; file not found 
      009BA1 72 5F 00 11      [ 1] 4704 	clr farptr
      009BA5 72 5F 00 12      [ 1] 4705 	clr farptr+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009BA9 72 5F 00 13      [ 1] 4706 	clr farptr+2 
      001B2D                       4707 	_drop VSIZE 
      009BAD 5B 04            [ 2]    1     addw sp,#VSIZE 
      009BAF 98               [ 1] 4708 	rcf
      009BB0 81               [ 4] 4709 	ret
      009BB1                       4710 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001B31                       4711 	_drop VSIZE 
      009BB1 5B 04            [ 2]    1     addw sp,#VSIZE 
      009BB3 99               [ 1] 4712 	scf 	
      009BB4 81               [ 4] 4713 	ret
                                   4714 
                                   4715 ;--------------------------------
                                   4716 ; BASIC: SAVE "name" 
                                   4717 ; save text program in 
                                   4718 ; flash memory used as 
                                   4719 ;--------------------------------
                           000001  4720 	BSIZE=1
                           000003  4721 	NAMEPTR=3
                           000004  4722 	VSIZE=4
      009BB5                       4723 save:
      009BB5 72 01 00 20 05   [ 2] 4724 	btjf flags,#FRUN,0$ 
      009BBA A6 07            [ 1] 4725 	ld a,#ERR_CMD_ONLY 
      009BBC CC 87 81         [ 2] 4726 	jp tb_error
      009BBF                       4727 0$:	 
      009BBF CE 00 1B         [ 2] 4728 	ldw x,txtend 
      009BC2 72 B0 00 19      [ 2] 4729 	subw x,txtbgn
      009BC6 26 01            [ 1] 4730 	jrne 1$
                                   4731 ; nothing to save 
      009BC8 81               [ 4] 4732 	ret 
      009BC9                       4733 1$:	
      001B49                       4734 	_vars VSIZE 
      009BC9 52 04            [ 2]    1     sub sp,#VSIZE 
      009BCB 1F 01            [ 2] 4735 	ldw (BSIZE,sp),x 
      009BCD CD 88 5F         [ 4] 4736 	call next_token	
      009BD0 A1 0A            [ 1] 4737 	cp a,#TK_QSTR
      009BD2 27 03            [ 1] 4738 	jreq 2$
      009BD4 CC 87 7F         [ 2] 4739 	jp syntax_error
      009BD7                       4740 2$: 
      009BD7 90 CE 00 05      [ 2] 4741 	ldw y,basicptr 
      009BDB 72 B9 00 01      [ 2] 4742 	addw y,in.w
      009BDF 17 03            [ 2] 4743 	ldw (NAMEPTR,sp),y  
      009BE1 55 00 04 00 02   [ 1] 4744 	mov in,count 
                                   4745 ; check if enough free space 
      009BE6 93               [ 1] 4746 	ldw x,y 
      009BE7 CD 82 F2         [ 4] 4747 	call strlen 
      009BEA 1C 00 03         [ 2] 4748 	addw x,#3 
      009BED 72 FB 01         [ 2] 4749 	addw x,(BSIZE,sp)
      009BF0 72 5D 00 14      [ 1] 4750 	tnz ffree 
      009BF4 26 0B            [ 1] 4751 	jrne 21$
      009BF6 72 B0 00 15      [ 2] 4752 	subw x,ffree+1 
      009BFA 23 05            [ 2] 4753 	jrule 21$
      009BFC A6 01            [ 1] 4754 	ld a,#ERR_MEM_FULL 
      009BFE CC 87 81         [ 2] 4755 	jp tb_error
      009C01                       4756 21$: 
                                   4757 ; check for existing file of that name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009C01 16 03            [ 2] 4758 	ldw y,(NAMEPTR,sp)	
      009C03 CD 9B 6A         [ 4] 4759 	call search_file 
      009C06 24 05            [ 1] 4760 	jrnc 3$ 
      009C08 A6 08            [ 1] 4761 	ld a,#ERR_DUPLICATE 
      009C0A CC 87 81         [ 2] 4762 	jp tb_error 
      009C0D                       4763 3$:	;** write file name to flash **
      009C0D CE 00 14         [ 2] 4764 	ldw x,ffree 
      009C10 C6 00 16         [ 1] 4765 	ld a,ffree+2 
      009C13 CF 00 11         [ 2] 4766 	ldw farptr,x 
      009C16 C7 00 13         [ 1] 4767 	ld farptr+2,a 
      009C19 1E 03            [ 2] 4768 	ldw x,(NAMEPTR,sp)  
      009C1B CD 82 F2         [ 4] 4769 	call strlen 
      009C1E 5C               [ 1] 4770 	incw  x
      009C1F 1F 01            [ 2] 4771 	ldw (BSIZE,sp),x  
      009C21 5F               [ 1] 4772 	clrw x   
      009C22 16 03            [ 2] 4773 	ldw y,(NAMEPTR,sp)
      009C24 CD 81 D1         [ 4] 4774 	call write_block  
                                   4775 ;** write file length after name **
      009C27 CE 00 1B         [ 2] 4776 	ldw x,txtend 
      009C2A 72 B0 00 19      [ 2] 4777 	subw x,txtbgn
      009C2E 1F 01            [ 2] 4778 	ldw (BSIZE,sp),x 
      009C30 5F               [ 1] 4779 	clrw x 
      009C31 7B 01            [ 1] 4780 	ld a,(1,sp)
      009C33 CD 81 5C         [ 4] 4781 	call write_byte 
      009C36 5C               [ 1] 4782 	incw x 
      009C37 7B 02            [ 1] 4783 	ld a,(2,sp)
      009C39 CD 81 5C         [ 4] 4784 	call write_byte
      009C3C 5C               [ 1] 4785 	incw x  
      009C3D CD 9A FE         [ 4] 4786 	call incr_farptr ; move farptr after SIZE field 
                                   4787 ;** write BASIC text **
                                   4788 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009C40 1E 01            [ 2] 4789 	ldw x,(BSIZE,sp)
      009C42 89               [ 2] 4790 	pushw x ; write_block argument 
      009C43 5F               [ 1] 4791 	clrw x 
      009C44 90 CE 00 19      [ 2] 4792 	ldw y,txtbgn  ; BASIC text to save 
      009C48 CD 81 D1         [ 4] 4793 	call write_block 
      001BCB                       4794 	_drop 2 ;  drop write_block argument  
      009C4B 5B 02            [ 2]    1     addw sp,#2 
                                   4795 ; write en end of file marker 
      009C4D AE 00 01         [ 2] 4796 	ldw x,#1
      009C50 A6 FF            [ 1] 4797 	ld a,#EOF  
      009C52 CD 81 5C         [ 4] 4798 	call write_byte 
      009C55 CD 9A FE         [ 4] 4799 	call incr_farptr
                                   4800 ; save farptr in ffree
      009C58 CE 00 11         [ 2] 4801 	ldw x,farptr 
      009C5B C6 00 13         [ 1] 4802 	ld a,farptr+2 
      009C5E CF 00 14         [ 2] 4803 	ldw ffree,x 
      009C61 C7 00 16         [ 1] 4804 	ld ffree+2,a
                                   4805 ;write 4 zero bytes as an end of all files marker 
      009C64 5F               [ 1] 4806     clrw x 
      009C65 4B 04            [ 1] 4807 	push #4 
      009C67                       4808 4$:
      009C67 4F               [ 1] 4809 	clr a 
      009C68 CD 81 5C         [ 4] 4810 	call write_byte 
      009C6B 5C               [ 1] 4811 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009C6C 0A 01            [ 1] 4812 	dec (1,sp)
      009C6E 26 F7            [ 1] 4813 	jrne 4$
      009C70 84               [ 1] 4814 5$: pop a 
                                   4815 ; display saved size  
      009C71 1E 01            [ 2] 4816 	ldw x,(BSIZE,sp) 
      009C73 CD 89 F8         [ 4] 4817 	call print_int 
      001BF6                       4818 	_drop VSIZE 
      009C76 5B 04            [ 2]    1     addw sp,#VSIZE 
      009C78 81               [ 4] 4819 	ret 
                                   4820 
                                   4821 
                                   4822 ;------------------------
                                   4823 ; BASIC: LOAD "file" 
                                   4824 ; load file to RAM 
                                   4825 ; for execution 
                                   4826 ;------------------------
      009C79                       4827 load:
      009C79 72 01 00 20 07   [ 2] 4828 	btjf flags,#FRUN,0$ 
      009C7E 27 05            [ 1] 4829 	jreq 0$ 
      009C80 A6 07            [ 1] 4830 	ld a,#ERR_CMD_ONLY 
      009C82 CC 87 81         [ 2] 4831 	jp tb_error 
      009C85                       4832 0$:	
      009C85 CD 88 5F         [ 4] 4833 	call next_token 
      009C88 A1 0A            [ 1] 4834 	cp a,#TK_QSTR
      009C8A 27 03            [ 1] 4835 	jreq 1$
      009C8C CC 87 7F         [ 2] 4836 	jp syntax_error 
      009C8F                       4837 1$:	
      009C8F 90 CE 00 05      [ 2] 4838 	ldw y,basicptr
      009C93 72 B9 00 01      [ 2] 4839 	addw y,in.w 
      009C97 55 00 04 00 02   [ 1] 4840 	mov in,count 
      009C9C CD 9B 6A         [ 4] 4841 	call search_file 
      009C9F 25 05            [ 1] 4842 	jrc 2$ 
      009CA1 A6 09            [ 1] 4843 	ld a,#ERR_NOT_FILE
      009CA3 CC 87 81         [ 2] 4844 	jp tb_error  
      009CA6                       4845 2$:	
      009CA6 CD 9A FE         [ 4] 4846 	call incr_farptr  
      009CA9 CD 86 51         [ 4] 4847 	call clear_basic  
      009CAC 5F               [ 1] 4848 	clrw x
      009CAD 92 AF 00 11      [ 5] 4849 	ldf a,([farptr],x)
      009CB1 90 95            [ 1] 4850 	ld yh,a 
      009CB3 5C               [ 1] 4851 	incw x  
      009CB4 92 AF 00 11      [ 5] 4852 	ldf a,([farptr],x)
      009CB8 5C               [ 1] 4853 	incw x 
      009CB9 90 97            [ 1] 4854 	ld yl,a 
      009CBB 72 B9 00 19      [ 2] 4855 	addw y,txtbgn
      009CBF 90 CF 00 1B      [ 2] 4856 	ldw txtend,y
      009CC3 90 CE 00 19      [ 2] 4857 	ldw y,txtbgn
      009CC7                       4858 3$:	; load BASIC text 	
      009CC7 92 AF 00 11      [ 5] 4859 	ldf a,([farptr],x)
      009CCB 90 F7            [ 1] 4860 	ld (y),a 
      009CCD 5C               [ 1] 4861 	incw x 
      009CCE 90 5C            [ 1] 4862 	incw y 
      009CD0 90 C3 00 1B      [ 2] 4863 	cpw y,txtend 
      009CD4 2B F1            [ 1] 4864 	jrmi 3$
                                   4865 ; print loaded size 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009CD6 CE 00 1B         [ 2] 4866 	ldw x,txtend 
      009CD9 72 B0 00 19      [ 2] 4867 	subw x,txtbgn
      009CDD CD 89 F8         [ 4] 4868 	call print_int 
      009CE0 81               [ 4] 4869 	ret 
                                   4870 
                                   4871 ;-----------------------------------
                                   4872 ; BASIC: FORGET ["file_name"] 
                                   4873 ; erase file_name and all others 
                                   4874 ; after it. 
                                   4875 ; without argument erase all files 
                                   4876 ;-----------------------------------
      009CE1                       4877 forget:
      009CE1 CD 88 5F         [ 4] 4878 	call next_token 
      009CE4 A1 00            [ 1] 4879 	cp a,#TK_NONE 
      009CE6 27 26            [ 1] 4880 	jreq 3$ 
      009CE8 A1 0A            [ 1] 4881 	cp a,#TK_QSTR
      009CEA 27 03            [ 1] 4882 	jreq 1$
      009CEC CC 87 7F         [ 2] 4883 	jp syntax_error
      009CEF 90 CE 00 05      [ 2] 4884 1$: ldw y,basicptr
      009CF3 72 B9 00 01      [ 2] 4885 	addw y,in.w
      009CF7 55 00 04 00 02   [ 1] 4886 	mov in,count 
      009CFC CD 9B 6A         [ 4] 4887 	call search_file
      009CFF 25 05            [ 1] 4888 	jrc 2$
      009D01 A6 09            [ 1] 4889 	ld a,#ERR_NOT_FILE 
      009D03 CC 87 81         [ 2] 4890 	jp tb_error 
      009D06                       4891 2$: 
      009D06 CE 00 11         [ 2] 4892 	ldw x,farptr
      009D09 C6 00 13         [ 1] 4893 	ld a,farptr+2
      009D0C 20 0A            [ 2] 4894 	jra 4$ 
      009D0E                       4895 3$: ; forget all files 
      009D0E AE 01 00         [ 2] 4896 	ldw x,#0x100
      009D11 4F               [ 1] 4897 	clr a 
      009D12 CF 00 11         [ 2] 4898 	ldw farptr,x 
      009D15 C7 00 13         [ 1] 4899 	ld farptr+2,a 
      009D18                       4900 4$:
      009D18 CF 00 14         [ 2] 4901 	ldw ffree,x 
      009D1B C7 00 16         [ 1] 4902 	ld ffree+2,a 
      009D1E 4B 04            [ 1] 4903 	push #4
      009D20 5F               [ 1] 4904 	clrw x 
      009D21                       4905 5$: 
      009D21 4F               [ 1] 4906 	clr a  
      009D22 CD 81 5C         [ 4] 4907 	call write_byte 
      009D25 5C               [ 1] 4908 	incw x 
      009D26 0A 01            [ 1] 4909 	dec (1,sp)
      009D28 26 F7            [ 1] 4910 	jrne 5$	
      009D2A 84               [ 1] 4911 6$: pop a 
      009D2B 81               [ 4] 4912 	ret 
                                   4913 
                                   4914 ;----------------------
                                   4915 ; BASIC: DIR 
                                   4916 ; list saved files 
                                   4917 ;----------------------
                           000001  4918 	COUNT=1 ; files counter 
                           000002  4919 	VSIZE=2 
      009D2C                       4920 directory:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      001CAC                       4921 	_vars VSIZE 
      009D2C 52 02            [ 2]    1     sub sp,#VSIZE 
      009D2E 5F               [ 1] 4922 	clrw x 
      009D2F 1F 01            [ 2] 4923 	ldw (COUNT,sp),x 
      009D31 CF 00 12         [ 2] 4924 	ldw farptr+1,x 
      009D34 35 01 00 11      [ 1] 4925 	mov farptr,#1 
      009D38                       4926 dir_loop:
      009D38 5F               [ 1] 4927 	clrw x 
      009D39 92 AF 00 11      [ 5] 4928 	ldf a,([farptr],x)
      009D3D 27 39            [ 1] 4929 	jreq 8$ 
      009D3F                       4930 1$: ;name loop 	
      009D3F 92 AF 00 11      [ 5] 4931 	ldf a,([farptr],x)
      009D43 27 06            [ 1] 4932 	jreq 2$ 
      009D45 CD 82 1E         [ 4] 4933 	call putc 
      009D48 5C               [ 1] 4934 	incw x 
      009D49 20 F4            [ 2] 4935 	jra 1$
      009D4B 5C               [ 1] 4936 2$: incw x ; skip ending 0. 
      009D4C A6 20            [ 1] 4937 	ld a,#SPACE 
      009D4E CD 82 1E         [ 4] 4938 	call putc 
                                   4939 ; get file size 	
      009D51 92 AF 00 11      [ 5] 4940 	ldf a,([farptr],x)
      009D55 90 95            [ 1] 4941 	ld yh,a 
      009D57 5C               [ 1] 4942 	incw x 
      009D58 92 AF 00 11      [ 5] 4943 	ldf a,([farptr],x)
      009D5C 5C               [ 1] 4944 	incw x 
      009D5D 90 97            [ 1] 4945 	ld yl,a 
      009D5F 90 89            [ 2] 4946 	pushw y 
      009D61 72 FB 01         [ 2] 4947 	addw x,(1,sp)
      009D64 5C               [ 1] 4948 	incw x ; skip EOF marker 
                                   4949 ; skip to next file 
      009D65 CD 9A FE         [ 4] 4950 	call incr_farptr 
                                   4951 ; print file size 
      009D68 85               [ 2] 4952 	popw x ; file size 
      009D69 CD 89 F8         [ 4] 4953 	call print_int 
      009D6C A6 0D            [ 1] 4954 	ld a,#CR 
      009D6E CD 82 1E         [ 4] 4955 	call putc
      009D71 1E 01            [ 2] 4956 	ldw x,(COUNT,sp)
      009D73 5C               [ 1] 4957 	incw x
      009D74 1F 01            [ 2] 4958 	ldw (COUNT,sp),x  
      009D76 20 C0            [ 2] 4959 	jra dir_loop 
      009D78                       4960 8$: ; print number of files 
      009D78 1E 01            [ 2] 4961 	ldw x,(COUNT,sp)
      009D7A CD 89 F8         [ 4] 4962 	call print_int 
      009D7D AE 9D AD         [ 2] 4963 	ldw x,#file_count 
      009D80 CD 82 30         [ 4] 4964 	call puts  
                                   4965 ; print drive free space 	
      009D83 A6 FF            [ 1] 4966 	ld a,#0xff 
      009D85 C0 00 16         [ 1] 4967 	sub a,ffree+2 
      009D88 C7 00 0A         [ 1] 4968 	ld acc8,a 
      009D8B A6 7F            [ 1] 4969 	ld a,#0x7f 
      009D8D C2 00 15         [ 1] 4970 	sbc a,ffree+1 
      009D90 C7 00 09         [ 1] 4971 	ld acc16,a 
      009D93 A6 02            [ 1] 4972 	ld a,#2 
      009D95 C2 00 14         [ 1] 4973 	sbc a,ffree 
      009D98 C7 00 08         [ 1] 4974 	ld acc24,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009D9B 5F               [ 1] 4975 	clrw x  
      009D9C A6 06            [ 1] 4976 	ld a,#6 
      009D9E 97               [ 1] 4977 	ld xl,a 
      009D9F A6 0A            [ 1] 4978 	ld a,#10 
      009DA1 CD 89 B0         [ 4] 4979 	call prti24 
      009DA4 AE 9D B5         [ 2] 4980 	ldw x,#drive_free
      009DA7 CD 82 30         [ 4] 4981 	call puts 
      001D2A                       4982 	_drop VSIZE 
      009DAA 5B 02            [ 2]    1     addw sp,#VSIZE 
      009DAC 81               [ 4] 4983 	ret
      009DAD 20 66 69 6C 65 73 0A  4984 file_count: .asciz " files\n"
             00
      009DB5 20 62 79 74 65 73 20  4985 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   4986 
                                   4987 ;---------------------
                                   4988 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   4989 ; write 1 or more byte to FLASH or EEPROM
                                   4990 ; starting at address  
                                   4991 ; input:
                                   4992 ;   expr1  	is address 
                                   4993 ;   expr2   is byte to write
                                   4994 ; output:
                                   4995 ;   none 
                                   4996 ;---------------------
                           000001  4997 	ADDR=1
                           000002  4998 	VSIZ=2 
      009DC2                       4999 write:
      001D42                       5000 	_vars VSIZE 
      009DC2 52 02            [ 2]    1     sub sp,#VSIZE 
      009DC4 72 5F 00 11      [ 1] 5001 	clr farptr ; expect 16 bits address 
      009DC8 CD 93 19         [ 4] 5002 	call expression
      009DCB A1 04            [ 1] 5003 	cp a,#TK_INTGR 
      009DCD 27 03            [ 1] 5004 	jreq 0$
      009DCF CC 87 7F         [ 2] 5005 	jp syntax_error
      009DD2 1F 01            [ 2] 5006 0$: ldw (ADDR,sp),x 
      009DD4 CD 88 5F         [ 4] 5007 	call next_token 
      009DD7 A1 0D            [ 1] 5008 	cp a,#TK_COMMA 
      009DD9 27 02            [ 1] 5009 	jreq 1$ 
      009DDB 20 19            [ 2] 5010 	jra 9$ 
      009DDD CD 93 19         [ 4] 5011 1$:	call expression
      009DE0 A1 04            [ 1] 5012 	cp a,#TK_INTGR
      009DE2 27 03            [ 1] 5013 	jreq 2$
      009DE4 CC 87 7F         [ 2] 5014 	jp syntax_error
      009DE7 9F               [ 1] 5015 2$:	ld a,xl 
      009DE8 1E 01            [ 2] 5016 	ldw x,(ADDR,sp) 
      009DEA CF 00 12         [ 2] 5017 	ldw farptr+1,x 
      009DED 5F               [ 1] 5018 	clrw x 
      009DEE CD 81 5C         [ 4] 5019 	call write_byte
      009DF1 1E 01            [ 2] 5020 	ldw x,(ADDR,sp)
      009DF3 5C               [ 1] 5021 	incw x 
      009DF4 20 DC            [ 2] 5022 	jra 0$ 
      009DF6                       5023 9$:
      001D76                       5024 	_drop VSIZE
      009DF6 5B 02            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009DF8 81               [ 4] 5025 	ret 
                                   5026 
                                   5027 
                                   5028 ;---------------------
                                   5029 ;BASIC: CHAR(expr)
                                   5030 ; évaluate expression 
                                   5031 ; and take the 7 least 
                                   5032 ; bits as ASCII character
                                   5033 ;---------------------
      009DF9                       5034 char:
      009DF9 A6 0B            [ 1] 5035 	ld a,#TK_LPAREN 
      009DFB CD 92 11         [ 4] 5036 	call expect 
      009DFE CD 93 5D         [ 4] 5037 	call relation 
      009E01 A1 04            [ 1] 5038 	cp a,#TK_INTGR 
      009E03 27 03            [ 1] 5039 	jreq 1$
      009E05 CC 87 7F         [ 2] 5040 	jp syntax_error
      009E08 89               [ 2] 5041 1$:	pushw x 
      009E09 A6 0C            [ 1] 5042 	ld a,#TK_RPAREN 
      009E0B CD 92 11         [ 4] 5043 	call expect
      009E0E 85               [ 2] 5044 	popw x  
      009E0F 9F               [ 1] 5045 	ld a,xl 
      009E10 A4 7F            [ 1] 5046 	and a,#0x7f 
      009E12 97               [ 1] 5047 	ld xl,a
      009E13 A6 03            [ 1] 5048 	ld a,#TK_CHAR
      009E15 81               [ 4] 5049 	ret
                                   5050 
                                   5051 ;---------------------
                                   5052 ; BASIC: ASC(string|char)
                                   5053 ; extract first character 
                                   5054 ; of string argument 
                                   5055 ; return it as TK_INTGR 
                                   5056 ;---------------------
      009E16                       5057 ascii:
      009E16 A6 0B            [ 1] 5058 	ld a,#TK_LPAREN
      009E18 CD 92 11         [ 4] 5059 	call expect 
      009E1B CD 88 5F         [ 4] 5060 	call next_token 
      009E1E A1 0A            [ 1] 5061 	cp a,#TK_QSTR 
      009E20 27 07            [ 1] 5062 	jreq 1$
      009E22 A1 03            [ 1] 5063 	cp a,#TK_CHAR 
      009E24 27 06            [ 1] 5064 	jreq 2$ 
      009E26 CC 87 7F         [ 2] 5065 	jp syntax_error
      009E29                       5066 1$: 
      009E29 F6               [ 1] 5067 	ld a,(x)
      009E2A 20 01            [ 2] 5068 	jra 3$
      009E2C                       5069 2$: 
      009E2C 9F               [ 1] 5070 	ld a,xl 
      009E2D 97               [ 1] 5071 3$:	ld xl,a 
      009E2E 4F               [ 1] 5072 	clr a  
      009E2F 95               [ 1] 5073 	ld xh,a 
      009E30 89               [ 2] 5074 	pushw x  
      009E31 A6 0C            [ 1] 5075 	ld a,#TK_RPAREN 
      009E33 CD 92 11         [ 4] 5076 	call expect 
      009E36 85               [ 2] 5077 	popw x 
      009E37 A6 04            [ 1] 5078 	ld a,#TK_INTGR 
      009E39 81               [ 4] 5079 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   5080 
                                   5081 ;---------------------
                                   5082 ;BASIC: KEY
                                   5083 ; wait for a character 
                                   5084 ; received from STDIN 
                                   5085 ; input:
                                   5086 ;	none 
                                   5087 ; output:
                                   5088 ;	X 		ASCII character 
                                   5089 ;---------------------
      009E3A                       5090 key:
      009E3A CD 82 27         [ 4] 5091 	call getc 
      009E3D 5F               [ 1] 5092 	clrw x 
      009E3E 97               [ 1] 5093 	ld xl,a 
      009E3F A6 04            [ 1] 5094 	ld a,#TK_INTGR
      009E41 81               [ 4] 5095 	ret
                                   5096 
                                   5097 ;----------------------
                                   5098 ; BASIC: QKEY
                                   5099 ; Return true if there 
                                   5100 ; is a character in 
                                   5101 ; waiting in STDIN 
                                   5102 ; input:
                                   5103 ;  none 
                                   5104 ; output:
                                   5105 ;   X 		0|1 
                                   5106 ;-----------------------
      009E42                       5107 qkey: 
      009E42 5F               [ 1] 5108 	clrw x 
      009E43 72 0B 52 40 01   [ 2] 5109 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      009E48 5C               [ 1] 5110 	incw x 
      009E49 A6 04            [ 1] 5111 9$: ld a,#TK_INTGR
      009E4B 81               [ 4] 5112 	ret 
                                   5113 
                                   5114 ;---------------------
                                   5115 ; BASIC: GPIO(expr,reg)
                                   5116 ; return gpio address 
                                   5117 ; expr {0..8}
                                   5118 ; input:
                                   5119 ;   none 
                                   5120 ; output:
                                   5121 ;   X 		gpio register address
                                   5122 ;----------------------------
      009E4C                       5123 gpio:
      009E4C A6 0B            [ 1] 5124 	ld a,#TK_LPAREN 
      009E4E CD 92 11         [ 4] 5125 	call expect 
      009E51 CD 92 1E         [ 4] 5126 	call arg_list
      009E54 A1 02            [ 1] 5127 	cp a,#2
      009E56 27 03            [ 1] 5128 	jreq 1$
      009E58 CC 87 7F         [ 2] 5129 	jp syntax_error  
      009E5B                       5130 1$:	
      009E5B A6 0C            [ 1] 5131 	ld a,#TK_RPAREN 
      009E5D CD 92 11         [ 4] 5132 	call expect 
      009E60 AE 00 02         [ 2] 5133 	ldw x,#2
      009E63 72 DE 00 17      [ 5] 5134 	ldw x,([dstkptr],x) ; port 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009E67 2B 1B            [ 1] 5135 	jrmi bad_port
      009E69 A3 00 09         [ 2] 5136 	cpw x,#9
      009E6C 2A 16            [ 1] 5137 	jrpl bad_port
      009E6E A6 05            [ 1] 5138 	ld a,#5
      009E70 42               [ 4] 5139 	mul x,a
      009E71 1C 50 00         [ 2] 5140 	addw x,#GPIO_BASE 
      009E74 89               [ 2] 5141 	pushw x 
      009E75 CD 8F FE         [ 4] 5142 	call dpop 
      009E78 72 FB 01         [ 2] 5143 	addw x,(1,sp)
      009E7B 1F 01            [ 2] 5144 	ldw (1,sp),x  
      009E7D CD 90 25         [ 4] 5145 	call ddrop  
      009E80 85               [ 2] 5146 	popw x 
      009E81 A6 04            [ 1] 5147 	ld a,#TK_INTGR
      009E83 81               [ 4] 5148 	ret
      009E84                       5149 bad_port:
      009E84 A6 0A            [ 1] 5150 	ld a,#ERR_BAD_VALUE
      009E86 CC 87 81         [ 2] 5151 	jp tb_error
                                   5152 
                                   5153 
                                   5154 ;-------------------------
                                   5155 ; BASIC: UFLASH 
                                   5156 ; return user flash address
                                   5157 ; input:
                                   5158 ;  none 
                                   5159 ; output:
                                   5160 ;	A		TK_INTGR
                                   5161 ;   X 		user address 
                                   5162 ;---------------------------
      009E89                       5163 uflash:
      009E89 AE A2 00         [ 2] 5164 	ldw x,#user_space 
      009E8C A6 04            [ 1] 5165 	ld a,#TK_INTGR 
      009E8E 81               [ 4] 5166 	ret 
                                   5167 
                                   5168 
                                   5169 ;---------------------
                                   5170 ; BASIC: USR(addr[,arg])
                                   5171 ; execute a function written 
                                   5172 ; in binary code.
                                   5173 ; binary fonction should 
                                   5174 ; return token attribute in A 
                                   5175 ; and value in X. 
                                   5176 ; input:
                                   5177 ;   addr	routine address 
                                   5178 ;   arg 	is an optional argument 
                                   5179 ; output:
                                   5180 ;   A 		token attribute 
                                   5181 ;   X       returned value 
                                   5182 ;---------------------
      009E8F                       5183 usr:
      009E8F 90 89            [ 2] 5184 	pushw y 	
      009E91 A6 0B            [ 1] 5185 	ld a,#TK_LPAREN 
      009E93 CD 92 11         [ 4] 5186 	call expect 
      009E96 CD 92 1E         [ 4] 5187 	call arg_list 
      009E99 A1 01            [ 1] 5188 	cp a,#1 
      009E9B 2A 03            [ 1] 5189 	jrpl 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009E9D CC 87 7F         [ 2] 5190 	jp syntax_error 
      009EA0 A6 0C            [ 1] 5191 2$: ld a,#TK_RPAREN
      009EA2 CD 92 11         [ 4] 5192 	call expect 
      009EA5 CD 8F FE         [ 4] 5193 	call dpop 
      009EA8 A1 02            [ 1] 5194 	cp a,#2 
      009EAA 2B 05            [ 1] 5195 	jrmi 4$
      009EAC 90 93            [ 1] 5196 	ldw y,x ; y=arg 
      009EAE CD 8F FE         [ 4] 5197 	call dpop ;x=addr 
      009EB1 51               [ 1] 5198 4$:	exgw y,x ; y=addr,x=arg 
      009EB2 90 FD            [ 4] 5199 	call (y)
      009EB4 90 85            [ 2] 5200 	popw y 
      009EB6 81               [ 4] 5201 	ret 
                                   5202 
                                   5203 ;------------------------------
                                   5204 ; BASIC: BYE 
                                   5205 ; halt mcu in its lowest power mode 
                                   5206 ; wait for reset or external interrupt
                                   5207 ; do a cold start on wakeup.
                                   5208 ;------------------------------
      009EB7                       5209 bye:
      009EB7 72 0D 52 40 FB   [ 2] 5210 	btjf UART3_SR,#UART_SR_TC,.
      009EBC 8E               [10] 5211 	halt
      009EBD CC 85 CC         [ 2] 5212 	jp cold_start  
                                   5213 
                                   5214 ;----------------------------------
                                   5215 ; BASIC: SLEEP 
                                   5216 ; halt mcu until reset or external
                                   5217 ; interrupt.
                                   5218 ; Resume progam after SLEEP command
                                   5219 ;----------------------------------
      009EC0                       5220 sleep:
      009EC0 72 0D 52 40 FB   [ 2] 5221 	btjf UART3_SR,#UART_SR_TC,.
      009EC5 72 16 00 20      [ 1] 5222 	bset flags,#FSLEEP
      009EC9 8E               [10] 5223 	halt 
      009ECA 81               [ 4] 5224 	ret 
                                   5225 
                                   5226 ;-------------------------------
                                   5227 ; BASIC: PAUSE expr 
                                   5228 ; suspend execution for n msec.
                                   5229 ; input:
                                   5230 ;	none
                                   5231 ; output:
                                   5232 ;	none 
                                   5233 ;------------------------------
      009ECB                       5234 pause:
      009ECB CD 93 19         [ 4] 5235 	call expression
      009ECE A1 04            [ 1] 5236 	cp a,#TK_INTGR
      009ED0 27 03            [ 1] 5237 	jreq pause02 
      009ED2 CC 87 7F         [ 2] 5238 	jp syntax_error
      009ED5                       5239 pause02: 
      009ED5 5D               [ 2] 5240 1$: tnzw x 
      009ED6 27 04            [ 1] 5241 	jreq 2$
      009ED8 8F               [10] 5242 	wfi 
      009ED9 5A               [ 2] 5243 	decw x 
      009EDA 26 F9            [ 1] 5244 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009EDC 4F               [ 1] 5245 2$:	clr a 
      009EDD 81               [ 4] 5246 	ret 
                                   5247 
                                   5248 ;------------------------------
                                   5249 ; BASIC: TICKS
                                   5250 ; return msec ticks counter value 
                                   5251 ; input:
                                   5252 ; 	none 
                                   5253 ; output:
                                   5254 ;	X 		TK_INTGR
                                   5255 ;-------------------------------
      009EDE                       5256 get_ticks:
      009EDE CE 00 0B         [ 2] 5257 	ldw x,ticks 
      009EE1 A6 04            [ 1] 5258 	ld a,#TK_INTGR
      009EE3 81               [ 4] 5259 	ret 
                                   5260 
                                   5261 
                                   5262 
                                   5263 ;------------------------------
                                   5264 ; BASIC: ABS(expr)
                                   5265 ; return absolute value of expr.
                                   5266 ; input:
                                   5267 ;   none
                                   5268 ; output:
                                   5269 ;   X     	positive integer
                                   5270 ;-------------------------------
      009EE4                       5271 abs:
      009EE4 A6 0B            [ 1] 5272 	ld a,#TK_LPAREN
      009EE6 CD 92 11         [ 4] 5273 	call expect 
      009EE9 CD 92 1E         [ 4] 5274 	call arg_list
      009EEC A1 01            [ 1] 5275 	cp a,#1 
      009EEE 27 03            [ 1] 5276 	jreq 0$ 
      009EF0 CC 87 7F         [ 2] 5277 	jp syntax_error
      009EF3                       5278 0$:  
      009EF3 A6 0C            [ 1] 5279 	ld a,#TK_RPAREN 
      009EF5 CD 92 11         [ 4] 5280 	call expect 
      009EF8 CD 8F FE         [ 4] 5281     call dpop   
      009EFB 9E               [ 1] 5282 	ld a,xh 
      009EFC A5 80            [ 1] 5283 	bcp a,#0x80 
      009EFE 27 01            [ 1] 5284 	jreq 2$ 
      009F00 50               [ 2] 5285 	negw x 
      009F01 A6 04            [ 1] 5286 2$: ld a,#TK_INTGR 
      009F03 81               [ 4] 5287 	ret 
                                   5288 
                                   5289 ;------------------------------
                                   5290 ; BASIC: RND(expr)
                                   5291 ; return random number 
                                   5292 ; between 1 and expr inclusive
                                   5293 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5294 ; input:
                                   5295 ; 	none 
                                   5296 ; output:
                                   5297 ;	X 		random positive integer 
                                   5298 ;------------------------------
      009F04                       5299 random:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009F04 A6 0B            [ 1] 5300 	ld a,#TK_LPAREN 
      009F06 CD 92 11         [ 4] 5301 	call expect 
      009F09 CD 92 1E         [ 4] 5302 	call arg_list 
      009F0C A1 01            [ 1] 5303 	cp a,#1
      009F0E 27 03            [ 1] 5304 	jreq 1$
      009F10 CC 87 7F         [ 2] 5305 	jp syntax_error
      009F13 A6 0C            [ 1] 5306 1$: ld a,#TK_RPAREN
      009F15 CD 92 11         [ 4] 5307 	call expect 
      009F18 CD 8F FE         [ 4] 5308 	call dpop 
      009F1B 89               [ 2] 5309 	pushw x 
      009F1C 9E               [ 1] 5310 	ld a,xh 
      009F1D A5 80            [ 1] 5311 	bcp a,#0x80 
      009F1F 27 05            [ 1] 5312 	jreq 2$
      009F21 A6 0A            [ 1] 5313 	ld a,#ERR_BAD_VALUE
      009F23 CC 87 81         [ 2] 5314 	jp tb_error
      009F26                       5315 2$: 
                                   5316 ; acc16=(x<<5)^x 
      009F26 CE 00 0D         [ 2] 5317 	ldw x,seedx 
      009F29 58               [ 2] 5318 	sllw x 
      009F2A 58               [ 2] 5319 	sllw x 
      009F2B 58               [ 2] 5320 	sllw x 
      009F2C 58               [ 2] 5321 	sllw x 
      009F2D 58               [ 2] 5322 	sllw x 
      009F2E 9E               [ 1] 5323 	ld a,xh 
      009F2F C8 00 0D         [ 1] 5324 	xor a,seedx 
      009F32 C7 00 09         [ 1] 5325 	ld acc16,a 
      009F35 9F               [ 1] 5326 	ld a,xl 
      009F36 C8 00 0E         [ 1] 5327 	xor a,seedx+1 
      009F39 C7 00 0A         [ 1] 5328 	ld acc8,a 
                                   5329 ; seedx=seedy 
      009F3C CE 00 0F         [ 2] 5330 	ldw x,seedy 
      009F3F CF 00 0D         [ 2] 5331 	ldw seedx,x  
                                   5332 ; seedy=seedy^(seedy>>1)
      009F42 90 54            [ 2] 5333 	srlw y 
      009F44 90 9E            [ 1] 5334 	ld a,yh 
      009F46 C8 00 0F         [ 1] 5335 	xor a,seedy 
      009F49 C7 00 0F         [ 1] 5336 	ld seedy,a  
      009F4C 90 9F            [ 1] 5337 	ld a,yl 
      009F4E C8 00 10         [ 1] 5338 	xor a,seedy+1 
      009F51 C7 00 10         [ 1] 5339 	ld seedy+1,a 
                                   5340 ; acc16>>3 
      009F54 CE 00 09         [ 2] 5341 	ldw x,acc16 
      009F57 54               [ 2] 5342 	srlw x 
      009F58 54               [ 2] 5343 	srlw x 
      009F59 54               [ 2] 5344 	srlw x 
                                   5345 ; x=acc16^x 
      009F5A 9E               [ 1] 5346 	ld a,xh 
      009F5B C8 00 09         [ 1] 5347 	xor a,acc16 
      009F5E 95               [ 1] 5348 	ld xh,a 
      009F5F 9F               [ 1] 5349 	ld a,xl 
      009F60 C8 00 0A         [ 1] 5350 	xor a,acc8 
      009F63 97               [ 1] 5351 	ld xl,a 
                                   5352 ; seedy=x^seedy 
      009F64 C8 00 10         [ 1] 5353 	xor a,seedy+1
      009F67 97               [ 1] 5354 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009F68 9E               [ 1] 5355 	ld a,xh 
      009F69 C8 00 0F         [ 1] 5356 	xor a,seedy
      009F6C 95               [ 1] 5357 	ld xh,a 
      009F6D CF 00 0F         [ 2] 5358 	ldw seedy,x 
                                   5359 ; return seedy modulo expr + 1 
      009F70 90 85            [ 2] 5360 	popw y 
      009F72 65               [ 2] 5361 	divw x,y 
      009F73 93               [ 1] 5362 	ldw x,y 
      009F74 5C               [ 1] 5363 	incw x 
      009F75 A6 04            [ 1] 5364 	ld a,#TK_INTGR
      009F77 81               [ 4] 5365 	ret 
                                   5366 
                                   5367 ;---------------------------------
                                   5368 ; BASIC: WORDS 
                                   5369 ; affiche la listes des mots du
                                   5370 ; dictionnaire.
                                   5371 ;---------------------------------
                           000001  5372 	WLEN=1
                           000002  5373 	LLEN=2  
                           000002  5374 	VSIZE=2 
      009F78                       5375 words:
      001EF8                       5376 	_vars VSIZE
      009F78 52 02            [ 2]    1     sub sp,#VSIZE 
      009F7A 0F 02            [ 1] 5377 	clr (LLEN,sp)
      009F7C 90 AE A1 BC      [ 2] 5378 	ldw y,#kword_dict+2
      009F80 93               [ 1] 5379 0$:	ldw x,y
      009F81 F6               [ 1] 5380 	ld a,(x)
      009F82 A4 0F            [ 1] 5381 	and a,#15 
      009F84 6B 01            [ 1] 5382 	ld (WLEN,sp),a 
      009F86 5C               [ 1] 5383 1$:	incw x 
      009F87 F6               [ 1] 5384 	ld a,(x)
      009F88 CD 82 1E         [ 4] 5385 	call putc 
      009F8B 0C 02            [ 1] 5386 	inc (LLEN,sp)
      009F8D 0A 01            [ 1] 5387 	dec (WLEN,sp)
      009F8F 26 F5            [ 1] 5388 	jrne 1$
      009F91 A6 46            [ 1] 5389 	ld a,#70
      009F93 11 02            [ 1] 5390 	cp a,(LLEN,sp)
      009F95 2B 09            [ 1] 5391 	jrmi 2$   
      009F97 A6 20            [ 1] 5392 	ld a,#SPACE 
      009F99 CD 82 1E         [ 4] 5393 	call putc 
      009F9C 0C 02            [ 1] 5394 	inc (LLEN,sp) 
      009F9E 20 07            [ 2] 5395 	jra 3$
      009FA0 A6 0D            [ 1] 5396 2$: ld a,#CR 
      009FA2 CD 82 1E         [ 4] 5397 	call putc 
      009FA5 0F 02            [ 1] 5398 	clr (LLEN,sp)
      009FA7 72 A2 00 02      [ 2] 5399 3$:	subw y,#2 
      009FAB 90 FE            [ 2] 5400 	ldw y,(y)
      009FAD 26 D1            [ 1] 5401 	jrne 0$  
      001F2F                       5402 	_drop VSIZE 
      009FAF 5B 02            [ 2]    1     addw sp,#VSIZE 
      009FB1 81               [ 4] 5403 	ret 
                                   5404 
                                   5405 
                                   5406 ;*********************************
                                   5407 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   5408 ;------------------------------
                                   5409 ;      dictionary 
                                   5410 ; format:
                                   5411 ;   link:   2 bytes 
                                   5412 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5413 ;   cmd_name: 16 byte max 
                                   5414 ;   code_address: 2 bytes 
                                   5415 ;------------------------------
                                   5416 	.macro _dict_entry len,name,cmd 
                                   5417 	.word LINK 
                                   5418 	LINK=.
                                   5419 name:
                                   5420 	.byte len 	
                                   5421 	.ascii "name"
                                   5422 	.word cmd 
                                   5423 	.endm 
                                   5424 
                           000000  5425 	LINK=0
      009FB2                       5426 kword_end:
      001F32                       5427 	_dict_entry,5,WRITE,write  
      009FB2 00 00                    1 	.word LINK 
                           001F34     2 	LINK=.
      009FB4                          3 WRITE:
      009FB4 05                       4 	.byte 5 	
      009FB5 57 52 49 54 45           5 	.ascii "WRITE"
      009FBA 9D C2                    6 	.word write 
      001F3C                       5428 	_dict_entry,5,WORDS,words 
      009FBC 9F B4                    1 	.word LINK 
                           001F3E     2 	LINK=.
      009FBE                          3 WORDS:
      009FBE 05                       4 	.byte 5 	
      009FBF 57 4F 52 44 53           5 	.ascii "WORDS"
      009FC4 9F 78                    6 	.word words 
      001F46                       5429 	_dict_entry 4,WAIT,wait 
      009FC6 9F BE                    1 	.word LINK 
                           001F48     2 	LINK=.
      009FC8                          3 WAIT:
      009FC8 04                       4 	.byte 4 	
      009FC9 57 41 49 54              5 	.ascii "WAIT"
      009FCD 97 71                    6 	.word wait 
      001F4F                       5430 	_dict_entry,3+F_IFUNC,USR,usr
      009FCF 9F C8                    1 	.word LINK 
                           001F51     2 	LINK=.
      009FD1                          3 USR:
      009FD1 43                       4 	.byte 3+F_IFUNC 	
      009FD2 55 53 52                 5 	.ascii "USR"
      009FD5 9E 8F                    6 	.word usr 
      001F57                       5431 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009FD7 9F D1                    1 	.word LINK 
                           001F59     2 	LINK=.
      009FD9                          3 UFLASH:
      009FD9 46                       4 	.byte 6+F_IFUNC 	
      009FDA 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      009FE0 9E 89                    6 	.word uflash 
      001F62                       5432 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009FE2 9F D9                    1 	.word LINK 
                           001F64     2 	LINK=.
      009FE4                          3 UBOUND:
      009FE4 46                       4 	.byte 6+F_IFUNC 	
      009FE5 55 42 4F 55 4E 44        5 	.ascii "UBOUND"
      009FEB 93 D8                    6 	.word ubound 
      001F6D                       5433 	_dict_entry,2,TO,to
      009FED 9F E4                    1 	.word LINK 
                           001F6F     2 	LINK=.
      009FEF                          3 TO:
      009FEF 02                       4 	.byte 2 	
      009FF0 54 4F                    5 	.ascii "TO"
      009FF2 98 7C                    6 	.word to 
      001F74                       5434 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      009FF4 9F EF                    1 	.word LINK 
                           001F76     2 	LINK=.
      009FF6                          3 TICKS:
      009FF6 45                       4 	.byte 5+F_IFUNC 	
      009FF7 54 49 43 4B 53           5 	.ascii "TICKS"
      009FFC 9E DE                    6 	.word get_ticks 
      001F7E                       5435 	_dict_entry,4,STOP,stop 
      009FFE 9F F6                    1 	.word LINK 
                           001F80     2 	LINK=.
      00A000                          3 STOP:
      00A000 04                       4 	.byte 4 	
      00A001 53 54 4F 50              5 	.ascii "STOP"
      00A005 99 F8                    6 	.word stop 
      001F87                       5436 	_dict_entry,4,STEP,step 
      00A007 A0 00                    1 	.word LINK 
                           001F89     2 	LINK=.
      00A009                          3 STEP:
      00A009 04                       4 	.byte 4 	
      00A00A 53 54 45 50              5 	.ascii "STEP"
      00A00E 98 AC                    6 	.word step 
      001F90                       5437 	_dict_entry,5,SLEEP,sleep 
      00A010 A0 09                    1 	.word LINK 
                           001F92     2 	LINK=.
      00A012                          3 SLEEP:
      00A012 05                       4 	.byte 5 	
      00A013 53 4C 45 45 50           5 	.ascii "SLEEP"
      00A018 9E C0                    6 	.word sleep 
      001F9A                       5438 	_dict_entry,4+F_IFUNC,SIZE,size
      00A01A A0 12                    1 	.word LINK 
                           001F9C     2 	LINK=.
      00A01C                          3 SIZE:
      00A01C 44                       4 	.byte 4+F_IFUNC 	
      00A01D 53 49 5A 45              5 	.ascii "SIZE"
      00A021 93 CE                    6 	.word size 
      001FA3                       5439     _dict_entry,4,SHOW,show 
      00A023 A0 1C                    1 	.word LINK 
                           001FA5     2 	LINK=.
      00A025                          3 SHOW:
      00A025 04                       4 	.byte 4 	
      00A026 53 48 4F 57              5 	.ascii "SHOW"
      00A02A 93 B4                    6 	.word show 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      001FAC                       5440 	_dict_entry,4,SAVE,save
      00A02C A0 25                    1 	.word LINK 
                           001FAE     2 	LINK=.
      00A02E                          3 SAVE:
      00A02E 04                       4 	.byte 4 	
      00A02F 53 41 56 45              5 	.ascii "SAVE"
      00A033 9B B5                    6 	.word save 
      001FB5                       5441 	_dict_entry 3,RUN,run
      00A035 A0 2E                    1 	.word LINK 
                           001FB7     2 	LINK=.
      00A037                          3 RUN:
      00A037 03                       4 	.byte 3 	
      00A038 52 55 4E                 5 	.ascii "RUN"
      00A03B 99 B5                    6 	.word run 
      001FBD                       5442 	_dict_entry,3+F_IFUNC,RND,random 
      00A03D A0 37                    1 	.word LINK 
                           001FBF     2 	LINK=.
      00A03F                          3 RND:
      00A03F 43                       4 	.byte 3+F_IFUNC 	
      00A040 52 4E 44                 5 	.ascii "RND"
      00A043 9F 04                    6 	.word random 
      001FC5                       5443 	_dict_entry,6,RETURN,return 
      00A045 A0 3F                    1 	.word LINK 
                           001FC7     2 	LINK=.
      00A047                          3 RETURN:
      00A047 06                       4 	.byte 6 	
      00A048 52 45 54 55 52 4E        5 	.ascii "RETURN"
      00A04E 99 95                    6 	.word return 
      001FD0                       5444 	_dict_entry 6,REMARK,rem 
      00A050 A0 47                    1 	.word LINK 
                           001FD2     2 	LINK=.
      00A052                          3 REMARK:
      00A052 06                       4 	.byte 6 	
      00A053 52 45 4D 41 52 4B        5 	.ascii "REMARK"
      00A059 97 6B                    6 	.word rem 
      001FDB                       5445 	_dict_entry,6,REBOOT,cold_start 
      00A05B A0 52                    1 	.word LINK 
                           001FDD     2 	LINK=.
      00A05D                          3 REBOOT:
      00A05D 06                       4 	.byte 6 	
      00A05E 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      00A064 85 CC                    6 	.word cold_start 
      001FE6                       5446 	_dict_entry,5+F_IFUNC,RDADC,read_adc
      00A066 A0 5D                    1 	.word LINK 
                           001FE8     2 	LINK=.
      00A068                          3 RDADC:
      00A068 45                       4 	.byte 5+F_IFUNC 	
      00A069 52 44 41 44 43           5 	.ascii "RDADC"
      00A06E 9A 74                    6 	.word read_adc 
      001FF0                       5447 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A070 A0 68                    1 	.word LINK 
                           001FF2     2 	LINK=.
      00A072                          3 QKEY:
      00A072 44                       4 	.byte 4+F_IFUNC 	
      00A073 51 4B 45 59              5 	.ascii "QKEY"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      00A077 9E 42                    6 	.word qkey 
      001FF9                       5448 	_dict_entry,6,PWRADC,power_adc 
      00A079 A0 72                    1 	.word LINK 
                           001FFB     2 	LINK=.
      00A07B                          3 PWRADC:
      00A07B 06                       4 	.byte 6 	
      00A07C 50 57 52 41 44 43        5 	.ascii "PWRADC"
      00A082 9A 2F                    6 	.word power_adc 
      002004                       5449 	_dict_entry 5,PRINT,print 
      00A084 A0 7B                    1 	.word LINK 
                           002006     2 	LINK=.
      00A086                          3 PRINT:
      00A086 05                       4 	.byte 5 	
      00A087 50 52 49 4E 54           5 	.ascii "PRINT"
      00A08C 96 66                    6 	.word print 
      00200E                       5450 	_dict_entry,4,POKE,poke 
      00A08E A0 86                    1 	.word LINK 
                           002010     2 	LINK=.
      00A090                          3 POKE:
      00A090 04                       4 	.byte 4 	
      00A091 50 4F 4B 45              5 	.ascii "POKE"
      00A095 98 0E                    6 	.word poke 
      002017                       5451 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A097 A0 90                    1 	.word LINK 
                           002019     2 	LINK=.
      00A099                          3 PEEK:
      00A099 44                       4 	.byte 4+F_IFUNC 	
      00A09A 50 45 45 4B              5 	.ascii "PEEK"
      00A09E 98 21                    6 	.word peek 
      002020                       5452 	_dict_entry,5,PAUSE,pause 
      00A0A0 A0 99                    1 	.word LINK 
                           002022     2 	LINK=.
      00A0A2                          3 PAUSE:
      00A0A2 05                       4 	.byte 5 	
      00A0A3 50 41 55 53 45           5 	.ascii "PAUSE"
      00A0A8 9E CB                    6 	.word pause 
      00202A                       5453 	_dict_entry,3+F_CONST,ODR,GPIO_ODR
      00A0AA A0 A2                    1 	.word LINK 
                           00202C     2 	LINK=.
      00A0AC                          3 ODR:
      00A0AC C3                       4 	.byte 3+F_CONST 	
      00A0AD 4F 44 52                 5 	.ascii "ODR"
      00A0B0 00 00                    6 	.word GPIO_ODR 
      002032                       5454 	_dict_entry,3,NEW,new
      00A0B2 A0 AC                    1 	.word LINK 
                           002034     2 	LINK=.
      00A0B4                          3 NEW:
      00A0B4 03                       4 	.byte 3 	
      00A0B5 4E 45 57                 5 	.ascii "NEW"
      00A0B8 9A F3                    6 	.word new 
      00203A                       5455 	_dict_entry,4,NEXT,next 
      00A0BA A0 B4                    1 	.word LINK 
                           00203C     2 	LINK=.
      00A0BC                          3 NEXT:
      00A0BC 04                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      00A0BD 4E 45 58 54              5 	.ascii "NEXT"
      00A0C1 98 D4                    6 	.word next 
      002043                       5456 	_dict_entry,4,LOAD,load 
      00A0C3 A0 BC                    1 	.word LINK 
                           002045     2 	LINK=.
      00A0C5                          3 LOAD:
      00A0C5 04                       4 	.byte 4 	
      00A0C6 4C 4F 41 44              5 	.ascii "LOAD"
      00A0CA 9C 79                    6 	.word load 
      00204C                       5457 	_dict_entry 4,LIST,list
      00A0CC A0 C5                    1 	.word LINK 
                           00204E     2 	LINK=.
      00A0CE                          3 LIST:
      00A0CE 04                       4 	.byte 4 	
      00A0CF 4C 49 53 54              5 	.ascii "LIST"
      00A0D3 94 22                    6 	.word list 
      002055                       5458 	_dict_entry 3,LET,let 
      00A0D5 A0 CE                    1 	.word LINK 
                           002057     2 	LINK=.
      00A0D7                          3 LET:
      00A0D7 03                       4 	.byte 3 	
      00A0D8 4C 45 54                 5 	.ascii "LET"
      00A0DB 93 FA                    6 	.word let 
      00205D                       5459 	_dict_entry,3+F_IFUNC,KEY,key 
      00A0DD A0 D7                    1 	.word LINK 
                           00205F     2 	LINK=.
      00A0DF                          3 KEY:
      00A0DF 43                       4 	.byte 3+F_IFUNC 	
      00A0E0 4B 45 59                 5 	.ascii "KEY"
      00A0E3 9E 3A                    6 	.word key 
      002065                       5460 	_dict_entry,5,INPUT,input_var  
      00A0E5 A0 DF                    1 	.word LINK 
                           002067     2 	LINK=.
      00A0E7                          3 INPUT:
      00A0E7 05                       4 	.byte 5 	
      00A0E8 49 4E 50 55 54           5 	.ascii "INPUT"
      00A0ED 96 F7                    6 	.word input_var 
      00206F                       5461 	_dict_entry,2,IF,if 
      00A0EF A0 E7                    1 	.word LINK 
                           002071     2 	LINK=.
      00A0F1                          3 IF:
      00A0F1 02                       4 	.byte 2 	
      00A0F2 49 46                    5 	.ascii "IF"
      00A0F4 98 3E                    6 	.word if 
      002076                       5462 	_dict_entry,3+F_CONST,IDR,GPIO_IDR
      00A0F6 A0 F1                    1 	.word LINK 
                           002078     2 	LINK=.
      00A0F8                          3 IDR:
      00A0F8 C3                       4 	.byte 3+F_CONST 	
      00A0F9 49 44 52                 5 	.ascii "IDR"
      00A0FC 00 01                    6 	.word GPIO_IDR 
      00207E                       5463 	_dict_entry,3,HEX,hex_base
      00A0FE A0 F8                    1 	.word LINK 
                           002080     2 	LINK=.
      00A100                          3 HEX:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      00A100 03                       4 	.byte 3 	
      00A101 48 45 58                 5 	.ascii "HEX"
      00A104 93 C4                    6 	.word hex_base 
      002086                       5464 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A106 A1 00                    1 	.word LINK 
                           002088     2 	LINK=.
      00A108                          3 GPIO:
      00A108 44                       4 	.byte 4+F_IFUNC 	
      00A109 47 50 49 4F              5 	.ascii "GPIO"
      00A10D 9E 4C                    6 	.word gpio 
      00208F                       5465 	_dict_entry,4,GOTO,goto 
      00A10F A1 08                    1 	.word LINK 
                           002091     2 	LINK=.
      00A111                          3 GOTO:
      00A111 04                       4 	.byte 4 	
      00A112 47 4F 54 4F              5 	.ascii "GOTO"
      00A116 99 43                    6 	.word goto 
      002098                       5466 	_dict_entry,5,GOSUB,gosub 
      00A118 A1 11                    1 	.word LINK 
                           00209A     2 	LINK=.
      00A11A                          3 GOSUB:
      00A11A 05                       4 	.byte 5 	
      00A11B 47 4F 53 55 42           5 	.ascii "GOSUB"
      00A120 99 50                    6 	.word gosub 
      0020A2                       5467 	_dict_entry,6,FORGET,forget 
      00A122 A1 1A                    1 	.word LINK 
                           0020A4     2 	LINK=.
      00A124                          3 FORGET:
      00A124 06                       4 	.byte 6 	
      00A125 46 4F 52 47 45 54        5 	.ascii "FORGET"
      00A12B 9C E1                    6 	.word forget 
      0020AD                       5468 	_dict_entry,3,FOR,for 
      00A12D A1 24                    1 	.word LINK 
                           0020AF     2 	LINK=.
      00A12F                          3 FOR:
      00A12F 03                       4 	.byte 3 	
      00A130 46 4F 52                 5 	.ascii "FOR"
      00A133 98 52                    6 	.word for 
      0020B5                       5469 	_dict_entry,6+F_CONST,EEPROM,EEPROM_BASE  
      00A135 A1 2F                    1 	.word LINK 
                           0020B7     2 	LINK=.
      00A137                          3 EEPROM:
      00A137 C6                       4 	.byte 6+F_CONST 	
      00A138 45 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00A13E 40 00                    6 	.word EEPROM_BASE 
      0020C0                       5470 	_dict_entry,3,DIR,directory 
      00A140 A1 37                    1 	.word LINK 
                           0020C2     2 	LINK=.
      00A142                          3 DIR:
      00A142 03                       4 	.byte 3 	
      00A143 44 49 52                 5 	.ascii "DIR"
      00A146 9D 2C                    6 	.word directory 
      0020C8                       5471 	_dict_entry,3,DEC,dec_base
      00A148 A1 42                    1 	.word LINK 
                           0020CA     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      00A14A                          3 DEC:
      00A14A 03                       4 	.byte 3 	
      00A14B 44 45 43                 5 	.ascii "DEC"
      00A14E 93 C9                    6 	.word dec_base 
      0020D0                       5472 	_dict_entry,3+F_CONST,DDR,GPIO_DDR
      00A150 A1 4A                    1 	.word LINK 
                           0020D2     2 	LINK=.
      00A152                          3 DDR:
      00A152 C3                       4 	.byte 3+F_CONST 	
      00A153 44 44 52                 5 	.ascii "DDR"
      00A156 00 02                    6 	.word GPIO_DDR 
      0020D8                       5473 	_dict_entry,3+F_CONST,CRL,GPIO_CR1
      00A158 A1 52                    1 	.word LINK 
                           0020DA     2 	LINK=.
      00A15A                          3 CRL:
      00A15A C3                       4 	.byte 3+F_CONST 	
      00A15B 43 52 4C                 5 	.ascii "CRL"
      00A15E 00 03                    6 	.word GPIO_CR1 
      0020E0                       5474 	_dict_entry,3+F_CONST,CRH,GPIO_CR2
      00A160 A1 5A                    1 	.word LINK 
                           0020E2     2 	LINK=.
      00A162                          3 CRH:
      00A162 C3                       4 	.byte 3+F_CONST 	
      00A163 43 52 48                 5 	.ascii "CRH"
      00A166 00 04                    6 	.word GPIO_CR2 
      0020E8                       5475 	_dict_entry,4+F_CFUNC,CHAR,char
      00A168 A1 62                    1 	.word LINK 
                           0020EA     2 	LINK=.
      00A16A                          3 CHAR:
      00A16A 84                       4 	.byte 4+F_CFUNC 	
      00A16B 43 48 41 52              5 	.ascii "CHAR"
      00A16F 9D F9                    6 	.word char 
      0020F1                       5476 	_dict_entry,3,BYE,bye 
      00A171 A1 6A                    1 	.word LINK 
                           0020F3     2 	LINK=.
      00A173                          3 BYE:
      00A173 03                       4 	.byte 3 	
      00A174 42 59 45                 5 	.ascii "BYE"
      00A177 9E B7                    6 	.word bye 
      0020F9                       5477 	_dict_entry,5,BTOGL,bit_toggle
      00A179 A1 73                    1 	.word LINK 
                           0020FB     2 	LINK=.
      00A17B                          3 BTOGL:
      00A17B 05                       4 	.byte 5 	
      00A17C 42 54 4F 47 4C           5 	.ascii "BTOGL"
      00A181 97 C5                    6 	.word bit_toggle 
      002103                       5478 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A183 A1 7B                    1 	.word LINK 
                           002105     2 	LINK=.
      00A185                          3 BTEST:
      00A185 45                       4 	.byte 5+F_IFUNC 	
      00A186 42 54 45 53 54           5 	.ascii "BTEST"
      00A18B 97 D9                    6 	.word bit_test 
      00210D                       5479 	_dict_entry,4,BSET,bit_set 
      00A18D A1 85                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                           00210F     2 	LINK=.
      00A18F                          3 BSET:
      00A18F 04                       4 	.byte 4 	
      00A190 42 53 45 54              5 	.ascii "BSET"
      00A194 97 9C                    6 	.word bit_set 
      002116                       5480 	_dict_entry,4,BRES,bit_reset
      00A196 A1 8F                    1 	.word LINK 
                           002118     2 	LINK=.
      00A198                          3 BRES:
      00A198 04                       4 	.byte 4 	
      00A199 42 52 45 53              5 	.ascii "BRES"
      00A19D 97 B0                    6 	.word bit_reset 
      00211F                       5481 	_dict_entry,5,BREAK,break 
      00A19F A1 98                    1 	.word LINK 
                           002121     2 	LINK=.
      00A1A1                          3 BREAK:
      00A1A1 05                       4 	.byte 5 	
      00A1A2 42 52 45 41 4B           5 	.ascii "BREAK"
      00A1A7 9A A7                    6 	.word break 
      002129                       5482 	_dict_entry,4,BEEP,beep 
      00A1A9 A1 A1                    1 	.word LINK 
                           00212B     2 	LINK=.
      00A1AB                          3 BEEP:
      00A1AB 04                       4 	.byte 4 	
      00A1AC 42 45 45 50              5 	.ascii "BEEP"
      00A1B0 9A 07                    6 	.word beep 
      002132                       5483 	_dict_entry,3+F_IFUNC,ASC,ascii  
      00A1B2 A1 AB                    1 	.word LINK 
                           002134     2 	LINK=.
      00A1B4                          3 ASC:
      00A1B4 43                       4 	.byte 3+F_IFUNC 	
      00A1B5 41 53 43                 5 	.ascii "ASC"
      00A1B8 9E 16                    6 	.word ascii 
      00A1BA                       5484 kword_dict:
      00213A                       5485 	_dict_entry,3+F_IFUNC,ABS,abs
      00A1BA A1 B4                    1 	.word LINK 
                           00213C     2 	LINK=.
      00A1BC                          3 ABS:
      00A1BC 43                       4 	.byte 3+F_IFUNC 	
      00A1BD 41 42 53                 5 	.ascii "ABS"
      00A1C0 9E E4                    6 	.word abs 
                                   5486 	
                                   5487 
      00A200                       5488 	.bndry 128 ; align on FLASH block.
                                   5489 ; free space for user application  
      00A200                       5490 user_space:
                                   5491 ; USR() function test
      00A200 89               [ 2] 5492 	pushw x 
      00A201 72 1A 50 0A      [ 1] 5493 	bset PC_ODR,#5 
      00A205 85               [ 2] 5494 	popw x 
      00A206 CD 9E D5         [ 4] 5495 	call pause02 
      00A209 72 1B 50 0A      [ 1] 5496 	bres PC_ODR,#5 
      00A20D 81               [ 4] 5497 	ret
                                   5498 
                                   5499 	.area FLASH_DRIVE (ABS)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      010000                       5500 	.org 0x10000
      010000                       5501 fdrive:
                                   5502 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        00213C R   |     ADC_CR1 =  005401 
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
    ARG_OFS =  000002     |   5 ASC        002134 R   |     ATTRIB  =  000002 
    AWU_APR =  0050F1     |     AWU_CSR =  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BASE_SAV=  000001     |   5 BEEP       00212B R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |     BINARY  =  000001 
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BLOCK_ER=  000000 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  000005     |   5 BREAK      002121 R   |   5 BRES       002118 R
  5 BSET       00210F R   |     BSIZE   =  000001     |     BSP     =  000008 
  5 BTEST      002105 R   |   5 BTOGL      0020FB R   |     BTW     =  000001 
    BUFIDX  =  000003     |   5 BYE        0020F3 R   |     C       =  000001 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       0020EA R
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
    CLK_CKDI=  0050C6     |     CLK_CKDI=  000000     |     CLK_CKDI=  000001 
    CLK_CKDI=  000002     |     CLK_CKDI=  000003     |     CLK_CKDI=  000004 
    CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1 
    CLK_ECKR=  000000     |     CLK_ECKR=  000001     |     CLK_HSIT=  0050CC 
    CLK_ICKR=  0050C0     |     CLK_ICKR=  000002     |     CLK_ICKR=  000000 
    CLK_ICKR=  000001     |     CLK_ICKR=  000003     |     CLK_ICKR=  000004 
    CLK_ICKR=  000005     |     CLK_PCKE=  0050C7     |     CLK_PCKE=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
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
    CR      =  00000D     |   5 CRH        0020E2 R   |   5 CRL        0020DA R
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
  5 DDR        0020D2 R   |     DEBUG   =  000001     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   5 DEC        0020CA R   |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   5 DIR        0020C2 R
    DIVIDND =  000007     |     DIVISR  =  000005     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |     DSTACK_S=  000040     |   5 EEPROM     0020B7 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLSI    =  01F400 
  5 FOR        0020AF R   |   5 FORGET     0020A4 R   |     FRUN    =  000000 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      00209A R   |     GOS_RET =  000003 
  5 GOTO       002091 R   |   5 GPIO       002088 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  5 HEX        002080 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        002078 R
  5 IF         002071 R   |     IN      =  000007     |     INCR    =  000001 
  5 INPUT      002067 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  00804C     |     INT_VECT=  00805C     |     INT_VECT=  008058 
    INW     =  000003     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        00205F R   |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000005     |   5 LET        002057 R   |     LINENO  =  000005 
  5 LINK    =  00213C R   |   5 LIST       00204E R   |     LL      =  000002 
    LLEN    =  000002     |     LL_HB   =  000001     |     LNO     =  000005 
    LN_PTR  =  000005     |   5 LOAD       002045 R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        002034 R
  5 NEXT       00203C R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NL      =  00000A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R   |   5 ODR        00202C R
    OP      =  000005     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
    PAD_SIZE=  000028     |   5 PAUSE      002022 R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       002019 R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
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
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 POKE       002010 R
    PREV    =  000001     |   5 PRINT      002006 R   |     PROD    =  000002 
    PSIZE   =  000001     |   5 PWRADC     001FFB R   |   5 QKEY       001FF2 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Symbol Table

  5 RDADC      001FE8 R   |   5 REBOOT     001FDD R   |   5 REG_A      000922 R
  5 REG_CC     000926 R   |   5 REG_EPC    000915 R   |   5 REG_SP     00092B R
  5 REG_X      00091E R   |   5 REG_Y      00091A R   |     RELOP   =  000005 
  5 REMARK     001FD2 R   |     RETL1   =  000001     |   5 RETURN     001FC7 R
  5 RND        001FBF R   |     ROP     =  004800     |     RST_SR  =  0050B3 
  5 RUN        001FB7 R   |     RXCHAR  =  000001     |     R_A     =  000007 
    R_CC    =  000008     |     R_X     =  000005     |     R_Y     =  000003 
  5 SAVE       001FAE R   |     SDIVD   =  000002     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       001FA5 R
    SIGN    =  000001     |   5 SIZE       001F9C R   |     SKIP    =  000006 
  5 SLEEP      001F92 R   |     SPACE   =  000020     |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SQUOT   =  000001     |     SRC     =  000003 
    STACK_EM=  0017FF     |     STACK_SI=  000080     |   5 STATES     0008D8 R
  5 STEP       001F89 R   |   5 STOP       001F80 R   |     SWIM_CSR=  007F80 
    TAB     =  000009     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      001F76 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_OIS=  00526F     |     TIM1_PSC=  005260     |     TIM1_PSC=  005261 
    TIM1_RCR=  005264     |     TIM1_SMC=  005252     |     TIM1_SMC=  000007 
    TIM1_SMC=  000000     |     TIM1_SMC=  000001     |     TIM1_SMC=  000002 
    TIM1_SMC=  000004     |     TIM1_SMC=  000005     |     TIM1_SMC=  000006 
    TIM1_SR1=  005255     |     TIM1_SR1=  000007     |     TIM1_SR1=  000001 
    TIM1_SR1=  000002     |     TIM1_SR1=  000003     |     TIM1_SR1=  000004 
    TIM1_SR1=  000005     |     TIM1_SR1=  000006     |     TIM1_SR1=  000000 
    TIM1_SR2=  005256     |     TIM1_SR2=  000001     |     TIM1_SR2=  000002 
    TIM1_SR2=  000003     |     TIM1_SR2=  000004     |     TIM2_ARR=  00530D 
    TIM2_ARR=  00530E     |     TIM2_CCE=  005308     |     TIM2_CCE=  005309 
    TIM2_CCM=  005305     |     TIM2_CCM=  005306     |     TIM2_CCM=  005307 
    TIM2_CCR=  00530F     |     TIM2_CCR=  005310     |     TIM2_CCR=  005311 
    TIM2_CCR=  005312     |     TIM2_CCR=  005313     |     TIM2_CCR=  005314 
    TIM2_CNT=  00530A     |     TIM2_CNT=  00530B     |     TIM2_CR1=  005300 
    TIM2_EGR=  005304     |     TIM2_IER=  005301     |     TIM2_PSC=  00530C 
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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |     TIM_CR1_=  000007 
    TIM_CR1_=  000000     |     TIM_CR1_=  000006     |     TIM_CR1_=  000005 
    TIM_CR1_=  000004     |     TIM_CR1_=  000003     |     TIM_CR1_=  000001 
    TIM_CR1_=  000002     |     TK_ARRAY=  000002     |     TK_CFUNC=  000008 
    TK_CHAR =  000003     |     TK_CMD  =  000006     |     TK_COLON=  000001 
    TK_COMMA=  00000D     |     TK_CONST=  000009     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_IFUNC=  000007 
    TK_INTGR=  000004     |     TK_LE   =  000036     |     TK_LPARE=  00000B 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  00000A     |     TK_RPARE=  00000C 
    TK_SHARP=  00000E     |     TK_VAR  =  000005     |   5 TO         001F6F R
  5 Timer4Up   000019 R   |   5 TrapHand   00000A R   |     U8      =  000003 
    UART1   =  000000     |     UART1_BA=  005230     |     UART1_BR=  005232 
    UART1_BR=  005233     |     UART1_CR=  005234     |     UART1_CR=  005235 
    UART1_CR=  005236     |     UART1_CR=  005237     |     UART1_CR=  005238 
    UART1_DR=  005231     |     UART1_GT=  005239     |     UART1_PO=  000000 
    UART1_PS=  00523A     |     UART1_RX=  000004     |     UART1_SR=  005230 
    UART1_TX=  000005     |     UART3   =  000001     |     UART3_BA=  005240 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

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
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     001F64 R
  5 UFLASH     001F59 R   |   5 USER_ABO   00007E R   |   5 USR        001F51 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 UserButt   000025 R   |     VSIZ    =  000002     |     VSIZE   =  000002 
    VT      =  00000B     |   5 WAIT       001F48 R   |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH   =  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |   5 WORDS      001F3E R   |   5 WRITE      001F34 R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XADR    =  000001 
    XMASK   =  000001     |     XSAVE   =  000003     |     YSAVE   =  000003 
  5 abs        001E64 R   |   1 acc16      000008 R   |   1 acc24      000007 R
  1 acc8       000009 R   |   5 accept_c   000ACC R   |   5 add        00105F R
  5 ansi_seq   000A8E R   |   5 arg_list   00119E R   |   1 array_si   00001D R
  5 ascii      001D96 R   |   5 at_tst     000D99 R   |   5 atoi24     000EAC R
  5 atoi_exi   000F1A R   |   5 bad_port   001E04 R   |   1 base       000006 R
  1 basicptr   000004 R   |   5 beep       001987 R   |   5 bin_exit   000C9D R
  5 bit_rese   001730 R   |   5 bit_set    00171C R   |   5 bit_test   001759 R
  5 bit_togg   001745 R   |   5 bkslsh_t   000D44 R   |   5 bksp       0001BA R
  5 break      001A27 R   |   5 break_po   001A55 R   |   5 bye        001E37 R
  5 char       001D79 R   |   5 check_fu   0003DD R   |   5 clear_ba   0005D1 R
  5 clear_va   0004E7 R   |   5 clock_in   000099 R   |   5 cmd_itf    000AF0 R
  5 cmd_name   00110A R   |   5 cmp_name   001AC9 R   |   5 cold_sta   00054C R
  5 colon_ts   000D6D R   |   5 comma_ts   000D78 R   |   5 compile    0003EC R
  5 convert_   000C25 R   |   1 count      000003 R   |   5 cp_loop    00114D R
  5 create_g   00033C R   |   5 cstk_pro   001029 R   |   5 dash_tst   000D8E R
  5 ddrop      000FA5 R   |   5 ddrop_n    000FE2 R   |   5 ddup       000FAE R
  5 dec_base   001349 R   |   5 del_back   000ABD R   |   5 del_line   000304 R
  5 del_ln     000AAE R   |   5 delete     0001CA R   |   5 dir_loop   001CB8 R
  5 director   001CAC R   |   5 divide     0010B5 R   |   5 divu24_8   000A1B R
  5 dotr       001032 R   |   5 dotr_loo   001047 R   |   5 dots       000FFF R
  5 dpick      000FBF R   |   5 dpop       000F7E R   |   5 dpush      000F71 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

  5 drive_fr   001D35 R   |   3 dstack     001740 R   |   3 dstack_u   001780 R
  5 dstk_pro   000FF5 R   |   1 dstkptr    000016 R   |   5 dswap      000F8B R
  5 eql_tst    000DF9 R   |   5 equal      0015D9 R   |   5 err_bad_   0006AE R
  5 err_cmd_   00066F R   |   5 err_div0   000631 R   |   5 err_dupl   00068A R
  5 err_math   000617 R   |   5 err_mem_   0005FA R   |   5 err_msg    0005E2 R
  5 err_no_a   0006BB R   |   5 err_no_l   000641 R   |   5 err_not_   00069C R
  5 err_run_   000658 R   |   5 err_synt   000608 R   |   5 escaped    000C3A R
  5 expect     001191 R   |   5 expr_exi   0012DA R   |   5 expressi   001299 R
  5 factor     0011F2 R   |   1 farptr     000010 R   |   7 fdrive     010000 R
  5 fetch      000FCE R   |   5 fetchc     000BDD R   |   1 ffree      000013 R
  5 file_cou   001D2D R   |   5 final_te   000A88 R   |   5 first_li   0013CD R
  1 flags      00001F R   |   5 for        0017D2 R   |   5 forget     001C61 R
  1 free_ram   000055 R   |   5 ge         0015DB R   |   5 get_arra   0011C2 R
  5 get_tick   001E5E R   |   5 get_toke   000CDF R   |   5 getc       0001A7 R
  5 go_commo   0018F3 R   |   5 gosub      0018D0 R   |   5 goto       0018C3 R
  5 gpio       001DCC R   |   5 gt         0015D7 R   |   5 gt_tst     000E04 R
  5 hex_base   001344 R   |   5 hse_cloc   000187 R   |   5 hsi_cloc   000191 R
  5 if         0017BE R   |   1 in         000001 R   |   1 in.saved   000002 R
  1 in.w       000000 R   |   5 incr_far   001A7E R   |   5 input_ex   0016E8 R
  5 input_lo   001683 R   |   5 input_va   001677 R   |   5 insert_l   000375 R
  5 insert_l   0003DA R   |   5 interp     00076F R   |   5 interp_l   0007AF R
  5 invalid    000B35 R   |   5 invalid_   000BB3 R   |   5 is_alpha   0004F5 R
  5 is_digit   000E97 R   |   5 itoa       0009D4 R   |   5 itoa_loo   0009EC R
  5 key        001DBA R   |   5 kword_di   00213A R   |   5 kword_en   001F32 R
  5 last_lin   0013D6 R   |   5 le         0015E0 R   |   5 ledoff     000828 R
  5 ledon      000823 R   |   5 ledtoggl   00082D R   |   5 left_arr   000A8E R
  5 left_par   000836 R   |   5 let        00137A R   |   5 let02      001384 R
  5 lines_sk   0013DB R   |   5 list       0013A2 R   |   5 list_exi   001422 R
  5 list_sta   0013FE R   |   5 load       001BF9 R   |   5 loop_bac   00189C R
  1 loop_dep   00001C R   |   5 loop_don   0018B1 R   |   5 lt         0015DE R
  5 lt_tst     000E3D R   |   5 mem_peek   000B52 R   |   5 modulo     0010F9 R
  5 move       00029E R   |   5 move_dow   0002BC R   |   5 move_exi   0002DD R
  5 move_loo   0002C1 R   |   5 move_up    0002AE R   |   5 mul_char   0015C8 R
  5 multiply   00106D R   |   5 mulu24_8   000F1E R   |   5 nbr_tst    000D1A R
  5 ne         0015E3 R   |   5 neg_acc2   000A43 R   |   5 new        001A73 R
  5 next       001854 R   |   5 next_tok   0007DF R   |   5 no_match   00115F R
  5 none       000CDF R   |   5 number     000BE3 GR  |   5 other      000E75 R
  3 pad        001718 R   |   5 parse_bi   000C7D R   |   5 parse_in   000C42 R
  5 parse_ke   000CA5 R   |   5 parse_qu   000BEA R   |   5 pause      001E4B R
  5 pause02    001E55 R   |   5 peek       0017A1 R   |   5 peek_byt   000B7D R
  5 plus_tst   000DCD R   |   5 poke       00178E R   |   5 power_ad   0019AF R
  5 prcnt_ts   000DEE R   |   5 print      0015E6 R   |   5 print_ex   00164B R
  5 print_fa   000BC2 R   |   5 print_in   000978 R   |   5 print_re   000885 R
  5 print_st   000B45 R   |   5 prt_basi   001475 R   |   5 prt_cmd_   001425 R
  5 prt_loop   0015EA R   |   5 prt_peek   00024E R   |   5 prt_quot   001439 R
  5 prt_reg1   000866 R   |   5 prt_reg8   000841 R   |   5 prt_regs   0001E4 R
  5 prti24     000930 R   |   1 ptr16      000011 R   |   1 ptr8       000012 R
  5 putc       00019E R   |   5 puts       0001B0 R   |   5 qkey       001DC2 R
  5 qmark_ts   000DA4 R   |   5 random     001E84 R   |   5 read_adc   0019F4 R
  5 readln     000A66 R   |   5 readln_l   000A6C R   |   5 readln_q   000AE1 R
  5 regs_sta   000227 R   |   5 rel_exit   001331 R   |   5 relation   0012DD R
  5 relop_st   0015CB R   |   5 rem        0016EB R   |   5 repl       000AFE R
  5 repl_exi   000B26 R   |   5 reprint    000A8E R   |   5 reset_co   0015E8 R
  5 rest_con   001667 R   |   5 return     001915 R   |   5 right_ar   000A8E R
  5 rparnt_t   000D62 R   |   5 rt_msg     0006EF R   |   5 run        001935 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]

Symbol Table

  5 save       001B35 R   |   5 save_con   001657 R   |   5 search_d   00113C R
  5 search_e   00118D R   |   5 search_f   001AEA R   |   5 search_l   0002E0 R
  5 search_l   0002E8 R   |   5 search_n   001140 R   |   1 seedx      00000C R
  1 seedy      00000E R   |   5 seek_fdr   001A8C R   |   5 sharp_ts   000D83 R
  5 show       001334 R   |   5 single_c   0015C4 R   |   5 size       00134E R
  5 skip       000F58 R   |   5 slash_ts   000DE3 R   |   5 sleep      001E40 R
  5 software   000506 R   |   5 spaces     0001D8 R   |   3 stack_fu   001780 R
  3 stack_un   001800 R   |   5 star_tst   000DD8 R   |   5 step       00182C R
  5 stop       001978 R   |   5 store      000FD8 R   |   5 store_lo   00183E R
  5 str_matc   00116E R   |   5 str_tst    000D09 R   |   5 strcmp     00027F R
  5 strcpy     000290 R   |   5 strlen     000272 R   |   5 substrac   001067 R
  5 syntax_e   0006FF R   |   1 tab_widt   000020 R   |   5 tb_error   000701 R
  5 term       00124C R   |   5 term01     001255 R   |   5 term_exi   001296 R
  5 test_p     000B3D R   |   3 tib        0016C8 R   |   5 tick_tst   000DBB R
  1 ticks      00000A R   |   5 timer4_i   0000AF R   |   5 to         0017FC R
  5 to_upper   000EA0 GR  |   5 token_ch   000E84 R   |   5 token_ex   000E94 R
  1 txtbgn     000018 R   |   1 txtend     00001A R   |   5 uart3_in   000174 R
  5 uart3_se   000180 R   |   5 uart_ena   000199 R   |   5 ubound     001358 R
  5 uflash     001E09 R   |   5 unget_to   000F6B R   |   5 unlock_e   0000C0 R
  5 unlock_f   0000CE R   |   5 user_spa   002180 R   |   5 usr        001E0F R
  1 vars       000021 R   |   5 wait       0016F1 R   |   5 warm_sta   000753 R
  5 words      001EF8 R   |   5 write      001D42 R   |   5 write_bl   000151 R
  5 write_by   0000DC R   |   5 write_ee   000118 R   |   5 write_ex   00014C R
  5 write_fl   000102 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     55   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   218E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

