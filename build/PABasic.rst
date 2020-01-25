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
      008000 82 00 85 D4             99     int cold_start
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
      00808E CD 89 15         [ 4]  153 	call print_registers
      008091 CD 8B 80         [ 4]  154 	call cmd_itf
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
      0080C7 CD 82 38         [ 4]  186 	call puts 
      0080CA CE 00 05         [ 2]  187 	ldw x,basicptr
      0080CD FE               [ 2]  188 	ldw x,(x)
                                    189 ; print line number 
      0080CE 35 0A 00 07      [ 1]  190 	mov base,#10 
      0080D2 35 06 00 21      [ 1]  191 	mov tab_width,#6
      0080D6 CD 8A 08         [ 4]  192 	call print_int  	
      0080D9 CE 00 05         [ 2]  193 	ldw x,basicptr 
      0080DC 1C 00 03         [ 2]  194 	addw x,#3  
      0080DF CD 82 38         [ 4]  195 	call puts 
      0080E2 A6 0D            [ 1]  196 	ld a,#CR 
      0080E4 CD 82 26         [ 4]  197 	call putc
      0080E7 5F               [ 1]  198 	clrw x  
      0080E8 C6 00 02         [ 1]  199 	ld a,in 
      0080EB AB 03            [ 1]  200 	add a,#3 ; adjustment for line number display 
      0080ED 97               [ 1]  201 	ld xl,a 
      0080EE CD 82 60         [ 4]  202 	call spaces 
      0080F1 A6 5E            [ 1]  203 	ld a,#'^
      0080F3 CD 82 26         [ 4]  204 	call putc 
      0080F6                        205 9$:
      0080F6 AE 17 FF         [ 2]  206     ldw x,#STACK_EMPTY 
      0080F9 94               [ 1]  207     ldw sp,x
      0080FA 9A               [ 1]  208 	rim 
      0080FB CC 87 E3         [ 2]  209 	jp warm_start
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    210 
      0080FE 0A 50 72 6F 67 72 61   211 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    212 
                                    213 ;----------------------------------------
                                    214 ; inialize MCU clock 
                                    215 ; input:
                                    216 ;   A 		source  HSI | 1 HSE 
                                    217 ;   XL      CLK_CKDIVR , clock divisor 
                                    218 ; output:
                                    219 ;   none 
                                    220 ;----------------------------------------
      008119                        221 clock_init:	
      008119 C1 50 C3         [ 1]  222 	cp a,CLK_CMSR 
      00811C 27 0C            [ 1]  223 	jreq 2$ ; no switching required 
                                    224 ; select clock source 
      00811E 72 12 50 C5      [ 1]  225 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008122 C7 50 C4         [ 1]  226 	ld CLK_SWR,a
      008125 C1 50 C3         [ 1]  227 1$:	cp a,CLK_CMSR
      008128 26 FB            [ 1]  228 	jrne 1$
      00812A                        229 2$: 	
                                    230 ; HSI and cpu clock divisor 
      00812A 9F               [ 1]  231 	ld a,xl 
      00812B C7 50 C6         [ 1]  232 	ld CLK_CKDIVR,a  
      00812E 81               [ 4]  233 	ret
                                    234 
                                    235 ;---------------------------------
                                    236 ; TIM4 is configured to generate an 
                                    237 ; interrupt every millisecond 
                                    238 ;----------------------------------
      00812F                        239 timer4_init:
      00812F 72 18 50 C7      [ 1]  240 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008133 35 07 53 45      [ 1]  241 	mov TIM4_PSCR,#7 ; prescale 128  
      008137 35 7D 53 46      [ 1]  242 	mov TIM4_ARR,#125 ; set for 1msec.
      00813B 35 05 53 40      [ 1]  243 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00813F 72 10 53 41      [ 1]  244 	bset TIM4_IER,#TIM4_IER_UIE 
      008143 81               [ 4]  245 	ret
                                    246 
                                    247 
                                    248 ;----------------------------------
                                    249 ; unlock EEPROM for writing/erasing
                                    250 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    251 ; input:
                                    252 ;  none
                                    253 ; output:
                                    254 ;  none 
                                    255 ;----------------------------------
      008144                        256 unlock_eeprom:
      008144 35 AE 50 64      [ 1]  257 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008148 35 56 50 64      [ 1]  258     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00814C 72 07 50 5F FB   [ 2]  259 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008151 81               [ 4]  260 	ret
                                    261 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    262 ;----------------------------------
                                    263 ; unlock FLASH for writing/erasing
                                    264 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    265 ; input:
                                    266 ;  none
                                    267 ; output:
                                    268 ;  none
                                    269 ;----------------------------------
      008152                        270 unlock_flash:
      008152 35 56 50 62      [ 1]  271 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008156 35 AE 50 62      [ 1]  272 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00815A 72 03 50 5F FB   [ 2]  273 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00815F 81               [ 4]  274 	ret
                                    275 
                           000000   276 	BLOCK_ERASE=0
                                    277 ;----------------------------
                                    278 ; erase block code must be 
                                    279 ;executed from RAM
                                    280 ;-----------------------------
                           000000   281 .if BLOCK_ERASE 
                                    282 ; this code is copied to RAM 
                                    283 erase_start:
                                    284 	clr a 
                                    285     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    286     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    287 	ldf [farptr],a
                                    288     inc farptr+2 
                                    289     ldf [farptr],a
                                    290     inc farptr+2 
                                    291     ldf [farptr],a
                                    292     inc farptr+2 
                                    293     ldf [farptr],a
                                    294 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    295 	ret
                                    296 erase_end:
                                    297 
                                    298 ; copy erase_start in RAM 
                                    299 move_code_in_ram:
                                    300 	ldw x,#erase_end 
                                    301 	subw x,#erase_start
                                    302 	ldw acc16,x 
                                    303 	ldw x,#pad 
                                    304 	ldw y,#erase_start 
                                    305 	call move 
                                    306 	ret 
                                    307 
                                    308 ;-----------------------------------
                                    309 ; erase flash or EEPROM block 
                                    310 ; a block is 128 bytes 
                                    311 ; input:
                                    312 ;   farptr  address block begin
                                    313 ; output:
                                    314 ;   none
                                    315 ;--------------------------------------
                                    316 erase_block:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    317 	ldw x,farptr+1 
                                    318 	pushw x 
                                    319 	call move_code_in_ram 
                                    320 	popw x 
                                    321 	ldw farptr+1,x 
                                    322 	tnz farptr
                                    323 	jrne erase_flash 
                                    324 	ldw x,#FLASH_BASE 
                                    325 	cpw x,farptr+1 
                                    326 	jrpl erase_flash 
                                    327 ; erase eeprom block
                                    328 	call unlock_eeprom 
                                    329 	sim 
                                    330 	call pad   
                                    331 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    332 	rim 
                                    333 	ret 
                                    334 ; erase flash block:
                                    335 erase_flash:
                                    336 	call unlock_flash 
                                    337 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    338 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    339 	clr a 
                                    340 	sim 
                                    341 	call pad 
                                    342     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    343 	rim 
                                    344 	ret 
                                    345 .endif ; BLOCK_ERASE 
                                    346 
                                    347 
                                    348 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    349 ; write a byte to FLASH or EEPROM 
                                    350 ; input:
                                    351 ;    a  		byte to write
                                    352 ;    farptr  	address
                                    353 ;    x          farptr[x]
                                    354 ; output:
                                    355 ;    none
                                    356 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    357 	; variables locales
                           000001   358 	BTW = 1   ; byte to write offset on stack
                           000002   359 	OPT = 2   ; OPTION flag offset on stack
                           000002   360 	VSIZE = 2
      008160                        361 write_byte:
      008160 90 89            [ 2]  362 	pushw y
      0000E2                        363 	_vars VSIZE
      008162 52 02            [ 2]    1     sub sp,#VSIZE 
      008164 6B 01            [ 1]  364 	ld (BTW,sp),a ; byte to write 
      008166 0F 02            [ 1]  365 	clr (OPT,sp)  ; OPTION flag
                                    366 ; put addr[15:0] in Y, for bounds check.
      008168 90 CE 00 12      [ 2]  367 	ldw y,farptr+1   ; Y=addr15:0
                                    368 ; check addr[23:16], if <> 0 then it is extened flash memory
      00816C 72 5D 00 11      [ 1]  369 	tnz farptr 
      008170 26 14            [ 1]  370 	jrne write_flash
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008172 90 A3 A2 80      [ 2]  371     cpw y,#user_space
      008176 24 0E            [ 1]  372     jruge write_flash
      008178 90 A3 40 00      [ 2]  373 	cpw y,#EEPROM_BASE  
      00817C 25 52            [ 1]  374     jrult write_exit
      00817E 90 A3 48 00      [ 2]  375 	cpw y,#OPTION_BASE
      008182 25 18            [ 1]  376 	jrult write_eeprom
      008184 20 4A            [ 2]  377     jra write_exit
                                    378 ; write program memory
      008186                        379 write_flash:
      008186 CD 81 52         [ 4]  380 	call unlock_flash 
      008189 9B               [ 1]  381 1$:	sim 
      00818A 7B 01            [ 1]  382 	ld a,(BTW,sp)
      00818C 92 A7 00 11      [ 4]  383 	ldf ([farptr],x),a ; farptr[x]=A
      008190 72 05 50 5F FB   [ 2]  384 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008195 9A               [ 1]  385     rim 
      008196 72 13 50 5F      [ 1]  386     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      00819A 20 34            [ 2]  387     jra write_exit
                                    388 ; write eeprom and option
      00819C                        389 write_eeprom:
      00819C CD 81 44         [ 4]  390 	call unlock_eeprom
                                    391 	; check for data eeprom or option eeprom
      00819F 90 A3 48 00      [ 2]  392 	cpw y,#OPTION_BASE
      0081A3 2B 08            [ 1]  393 	jrmi 1$
      0081A5 90 A3 48 80      [ 2]  394 	cpw y,#OPTION_END+1
      0081A9 2A 02            [ 1]  395 	jrpl 1$
      0081AB 03 02            [ 1]  396 	cpl (OPT,sp)
      0081AD                        397 1$: 
      0081AD 0D 02            [ 1]  398     tnz (OPT,sp)
      0081AF 27 08            [ 1]  399     jreq 2$
                                    400 	; pour modifier une option il faut modifier ces 2 bits
      0081B1 72 1E 50 5B      [ 1]  401     bset FLASH_CR2,#FLASH_CR2_OPT
      0081B5 72 1F 50 5C      [ 1]  402     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081B9                        403 2$: 
      0081B9 7B 01            [ 1]  404     ld a,(BTW,sp)
      0081BB 92 A7 00 11      [ 4]  405     ldf ([farptr],x),a
      0081BF 0D 02            [ 1]  406     tnz (OPT,sp)
      0081C1 27 08            [ 1]  407     jreq 3$
      0081C3 5C               [ 1]  408     incw x
      0081C4 7B 01            [ 1]  409     ld a,(BTW,sp)
      0081C6 43               [ 1]  410     cpl a
      0081C7 92 A7 00 11      [ 4]  411     ldf ([farptr],x),a
      0081CB 72 05 50 5F FB   [ 2]  412 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081D0                        413 write_exit:
      000150                        414 	_drop VSIZE 
      0081D0 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081D2 90 85            [ 2]  415 	popw y
      0081D4 81               [ 4]  416     ret
                                    417 
                                    418 ;--------------------------------------------
                                    419 ; write a data block to eeprom or flash 
                                    420 ; input:
                                    421 ;   Y        source address   
                                    422 ;   X        array index  destination  farptr[x]
                                    423 ;   BSIZE    block size bytes 
                                    424 ;   farptr   write address , byte* 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    425 ; output:
                                    426 ;	X 		after last byte written 
                                    427 ;   Y 		after last byte read 
                                    428 ;  farptr   point after block
                                    429 ;---------------------------------------------
      0081D5                        430 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000155                        431 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    432 	; local var 
                           000001   433 	XSAVE=1 
                           000002   434 	VSIZE=2 
      000155                        435 write_block:
      000155                        436 	_vars VSIZE
      0081D5 52 02            [ 2]    1     sub sp,#VSIZE 
      0081D7 1F 01            [ 2]  437 	ldw (XSAVE,sp),x 
      0081D9 1E 05            [ 2]  438 	ldw x,(BSIZE,sp) 
      0081DB 27 13            [ 1]  439 	jreq 9$
      0081DD 1E 01            [ 2]  440 1$:	ldw x,(XSAVE,sp)
      0081DF 90 F6            [ 1]  441 	ld a,(y)
      0081E1 CD 81 60         [ 4]  442 	call write_byte 
      0081E4 5C               [ 1]  443 	incw x 
      0081E5 90 5C            [ 1]  444 	incw y 
      0081E7 1F 01            [ 2]  445 	ldw (XSAVE,sp),x
      0081E9 1E 05            [ 2]  446 	ldw x,(BSIZE,sp)
      0081EB 5A               [ 2]  447 	decw x
      0081EC 1F 05            [ 2]  448 	ldw (BSIZE,sp),x 
      0081EE 26 ED            [ 1]  449 	jrne 1$
      0081F0                        450 9$:
      0081F0 1E 01            [ 2]  451 	ldw x,(XSAVE,sp)
      0081F2 CD 9B 00         [ 4]  452 	call incr_farptr
      000175                        453 	_drop VSIZE
      0081F5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081F7 81               [ 4]  454 	ret 
                                    455 
                                    456 
                                    457 ;---------------------------------------------
                                    458 ;   UART3 subroutines
                                    459 ;---------------------------------------------
                                    460 
                                    461 ;---------------------------------------------
                                    462 ; initialize UART3, 115200 8N1
                                    463 ; input:
                                    464 ;	none
                                    465 ; output:
                                    466 ;   none
                                    467 ;---------------------------------------------
      0081F8                        468 uart3_init:
      0081F8 72 16 50 C7      [ 1]  469 	bset CLK_PCKENR1,#CLK_PCKENR1_UART3 
                                    470 	; configure tx pin
      0081FC 72 1A 50 11      [ 1]  471 	bset PD_DDR,#BIT5 ; tx pin
      008200 72 1A 50 12      [ 1]  472 	bset PD_CR1,#BIT5 ; push-pull output
      008204 72 1A 50 13      [ 1]  473 	bset PD_CR2,#BIT5 ; fast output
      008208                        474 uart3_set_baud: 
                                    475 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    476 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008208 A6 E1            [ 1]  477 	ld a,#CLK_SWR_HSI
      00820A C1 50 C3         [ 1]  478 	cp a,CLK_CMSR 
      00820D 27 0A            [ 1]  479 	jreq hsi_clock 
      00820F                        480 hse_clock: ; 8 Mhz 	
      00820F 35 05 52 43      [ 1]  481 	mov UART3_BRR2,#0x05 ; must be loaded first
      008213 35 04 52 42      [ 1]  482 	mov UART3_BRR1,#0x4
      008217 20 08            [ 2]  483 	jra uart_enable
      008219                        484 hsi_clock: ; 16 Mhz 	
      008219 35 0B 52 43      [ 1]  485 	mov UART3_BRR2,#0x0b ; must be loaded first
      00821D 35 08 52 42      [ 1]  486 	mov UART3_BRR1,#0x08
      008221                        487 uart_enable:	
      008221 35 0C 52 45      [ 1]  488 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
      008225 81               [ 4]  489 	ret
                                    490 	
                                    491 ;---------------------------------
                                    492 ; send character to UART3 
                                    493 ; input:
                                    494 ;   A 
                                    495 ; output:
                                    496 ;   none 
                                    497 ;--------------------------------	
      008226                        498 putc:
      008226 72 0F 52 40 FB   [ 2]  499 	btjf UART3_SR,#UART_SR_TXE,.
      00822B C7 52 41         [ 1]  500 	ld UART3_DR,a 
      00822E 81               [ 4]  501 	ret 
                                    502 
                                    503 ;---------------------------------
                                    504 ; wait character from UART3 
                                    505 ; input:
                                    506 ;   none
                                    507 ; output:
                                    508 ;   A 			char  
                                    509 ;--------------------------------	
      00822F                        510 getc:
      00822F 72 0B 52 40 FB   [ 2]  511 	btjf UART3_SR,#UART_SR_RXNE,.
      008234 C6 52 41         [ 1]  512 	ld a,UART3_DR 
      008237 81               [ 4]  513 	ret 
                                    514 
                                    515 ;-----------------------------
                                    516 ; send an ASCIZ string to UART3 
                                    517 ; input: 
                                    518 ;   x 		char * 
                                    519 ; output:
                                    520 ;   none 
                                    521 ;-------------------------------
      008238                        522 puts:
      008238 F6               [ 1]  523     ld a,(x)
      008239 27 06            [ 1]  524 	jreq 1$
      00823B CD 82 26         [ 4]  525 	call putc 
      00823E 5C               [ 1]  526 	incw x 
      00823F 20 F7            [ 2]  527 	jra puts 
      008241 81               [ 4]  528 1$:	ret 
                                    529 
                                    530 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    531 ;---------------------------
                                    532 ; delete character at left 
                                    533 ; of cursor on terminal 
                                    534 ; input:
                                    535 ;   none 
                                    536 ; output:
                                    537 ;	none 
                                    538 ;---------------------------
      008242                        539 bksp:
      008242 A6 08            [ 1]  540 	ld a,#BSP 
      008244 CD 82 26         [ 4]  541 	call putc 
      008247 A6 20            [ 1]  542 	ld a,#SPACE 
      008249 CD 82 26         [ 4]  543 	call putc 
      00824C A6 08            [ 1]  544 	ld a,#BSP 
      00824E CD 82 26         [ 4]  545 	call putc 
      008251 81               [ 4]  546 	ret 
                                    547 ;---------------------------
                                    548 ; delete n character left of cursor 
                                    549 ; at terminal.
                                    550 ; input: 
                                    551 ;   A   	number of characters to delete.
                                    552 ; output:
                                    553 ;    none 
                                    554 ;--------------------------	
      008252                        555 delete:
      008252 88               [ 1]  556 	push a 
      008253 0D 01            [ 1]  557 0$:	tnz (1,sp)
      008255 27 07            [ 1]  558 	jreq 1$
      008257 CD 82 42         [ 4]  559 	call bksp 
      00825A 0A 01            [ 1]  560 	dec (1,sp)
      00825C 20 F5            [ 2]  561 	jra 0$
      00825E 84               [ 1]  562 1$:	pop a 
      00825F 81               [ 4]  563 	ret
                                    564 
                                    565 ;--------------------------
                                    566 ; print n spaces on terminal
                                    567 ; input:
                                    568 ;  X 		number of spaces 
                                    569 ; output:
                                    570 ;	none 
                                    571 ;---------------------------
      008260                        572 spaces:
      008260 A6 20            [ 1]  573 	ld a,#SPACE 
      008262 5D               [ 2]  574 1$:	tnzw x
      008263 27 06            [ 1]  575 	jreq 9$
      008265 CD 82 26         [ 4]  576 	call putc 
      008268 5A               [ 2]  577 	decw x
      008269 20 F7            [ 2]  578 	jra 1$
      00826B                        579 9$: 
      00826B 81               [ 4]  580 	ret 
                                    581 
                           000001   582 .if DEBUG 
                                    583 ;---------------------------------
                                    584 ;; print actual registers states 
                                    585 ;; as pushed on stack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    586 ;; {Y,X,CC,A}
                                    587 ;---------------------------------
      00826C                        588 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0001EC                        589 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0001EC                        590 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0001EC                        591 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0001EC                        592 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0001EC                        593 prt_regs:
      00826C AE 82 AF         [ 2]  594 	ldw x,#regs_state 
      00826F CD 82 38         [ 4]  595 	call puts
                                    596 ; register PC
      008272 16 01            [ 2]  597 	ldw y,(1,sp)
      008274 AE 89 A5         [ 2]  598 	ldw x,#REG_EPC 
      008277 CD 88 F6         [ 4]  599 	call prt_reg16 
                                    600 ; register CC 
      00827A 7B 08            [ 1]  601 	ld a,(R_CC,sp)
      00827C AE 89 B6         [ 2]  602 	ldw x,#REG_CC 
      00827F CD 88 D1         [ 4]  603 	call prt_reg8 
                                    604 ; register A 
      008282 7B 07            [ 1]  605 	ld a,(R_A,sp)
      008284 AE 89 B2         [ 2]  606 	ldw x,#REG_A 
      008287 CD 88 D1         [ 4]  607 	call prt_reg8 
                                    608 ; register X 
      00828A 16 05            [ 2]  609 	ldw y,(R_X,sp)
      00828C AE 89 AE         [ 2]  610 	ldw x,#REG_X 
      00828F CD 88 F6         [ 4]  611 	call prt_reg16 
                                    612 ; register Y 
      008292 16 03            [ 2]  613 	ldw y,(R_Y,sp)
      008294 AE 89 AA         [ 2]  614 	ldw x,#REG_Y 
      008297 CD 88 F6         [ 4]  615 	call prt_reg16 
                                    616 ; register SP 
      00829A 90 96            [ 1]  617 	ldw y,sp
      00829C 72 A9 00 08      [ 2]  618 	addw y,#6+ARG_OFS  
      0082A0 AE 89 BB         [ 2]  619 	ldw x,#REG_SP
      0082A3 CD 88 F6         [ 4]  620 	call prt_reg16
      0082A6 A6 0D            [ 1]  621 	ld a,#CR 
      0082A8 CD 82 26         [ 4]  622 	call putc
      0082AB CD 82 26         [ 4]  623 	call putc   
      0082AE 81               [ 4]  624 	ret 
                                    625 
      0082AF 0A 72 65 67 69 73 74   626 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    627 
                                    628 
                                    629 ;--------------------
                                    630 ; print content at address in hex.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    631 ; input:
                                    632 ;   X 	address to peek 
                                    633 ; output:
                                    634 ;	none 
                                    635 ;--------------------	
      0082D6                        636 prt_peek:
      0082D6 89               [ 2]  637 	pushw x 
      0082D7 CF 00 09         [ 2]  638 	ldw acc16,x 
      0082DA 72 5F 00 08      [ 1]  639 	clr acc24 
      0082DE 5F               [ 1]  640 	clrw x 
      0082DF A6 10            [ 1]  641 	ld a,#16 
      0082E1 CD 89 C0         [ 4]  642 	call prti24 
      0082E4 A6 3A            [ 1]  643 	ld a,#': 
      0082E6 CD 82 26         [ 4]  644 	call putc 
      0082E9 A6 20            [ 1]  645 	ld a,#SPACE 
      0082EB CD 82 26         [ 4]  646 	call putc 
      0082EE 85               [ 2]  647 	popw x 
      0082EF F6               [ 1]  648 	ld a,(x)
      0082F0 C7 00 0A         [ 1]  649 	ld acc8,a 
      0082F3 5F               [ 1]  650 	clrw x 
      0082F4 A6 10            [ 1]  651 	ld a,#16 
      0082F6 CD 89 C0         [ 4]  652 	call prti24
      0082F9 81               [ 4]  653 	ret 
                                    654 .endif ; DEBUG  
                                    655 
                                    656 ;-------------------------------------
                                    657 ; retrun string length
                                    658 ; input:
                                    659 ;   X         .asciz  
                                    660 ; output:
                                    661 ;   X         length 
                                    662 ;-------------------------------------
      0082FA                        663 strlen:
      0082FA 90 93            [ 1]  664 	ldw y,x 
      0082FC 5F               [ 1]  665 	clrw x 
      0082FD 90 7D            [ 1]  666 1$:	tnz (y) 
      0082FF 27 05            [ 1]  667 	jreq 9$ 
      008301 5C               [ 1]  668 	incw x
      008302 90 5C            [ 1]  669 	incw y 
      008304 20 F7            [ 2]  670 	jra 1$ 
      008306 81               [ 4]  671 9$: ret 
                                    672 
                                    673 ;------------------------------------
                                    674 ; compare 2 strings
                                    675 ; input:
                                    676 ;   X 		char* first string 
                                    677 ;   Y       char* second string 
                                    678 ; output:
                                    679 ;   A 		0|1 
                                    680 ;-------------------------------------
      008307                        681 strcmp:
      008307 F6               [ 1]  682 	ld a,(x)
      008308 27 0B            [ 1]  683 	jreq 5$ 
      00830A 90 F1            [ 1]  684 	cp a,(y) 
      00830C 26 05            [ 1]  685 	jrne 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00830E 5C               [ 1]  686 	incw x 
      00830F 90 5C            [ 1]  687 	incw y 
      008311 20 F4            [ 2]  688 	jra strcmp 
      008313                        689 4$: ; not same  
      008313 4F               [ 1]  690 	clr a 
      008314 81               [ 4]  691 	ret 
      008315                        692 5$: ; same 
      008315 A6 01            [ 1]  693 	ld a,#1 
      008317 81               [ 4]  694 	ret 
                                    695 
                                    696 
                                    697 ;---------------------------------------
                                    698 ;  copy src to dest 
                                    699 ; input:
                                    700 ;   X 		dest 
                                    701 ;   Y 		src 
                                    702 ; output: 
                                    703 ;   X 		dest 
                                    704 ;----------------------------------
      008318                        705 strcpy:
      008318 89               [ 2]  706 	pushw x 
      008319 90 F6            [ 1]  707 1$: ld a,(y)
      00831B 27 06            [ 1]  708 	jreq 9$ 
      00831D F7               [ 1]  709 	ld (x),a 
      00831E 5C               [ 1]  710 	incw x 
      00831F 90 5C            [ 1]  711 	incw y 
      008321 20 F6            [ 2]  712 	jra 1$ 
      008323 7F               [ 1]  713 9$:	clr (x)
      008324 85               [ 2]  714 	popw x 
      008325 81               [ 4]  715 	ret 
                                    716 
                                    717 ;---------------------------------------
                                    718 ; move memory block 
                                    719 ; input:
                                    720 ;   X 		destination 
                                    721 ;   Y 	    source 
                                    722 ;   acc16	size 
                                    723 ; output:
                                    724 ;   none 
                                    725 ;--------------------------------------
                           000001   726 	INCR=1 ; increament high byte 
                           000002   727 	LB=2 ; increament low byte 
                           000002   728 	VSIZE=2
      008326                        729 move:
      0002A6                        730 	_vars VSIZE 
      008326 52 02            [ 2]    1     sub sp,#VSIZE 
      008328 0F 01            [ 1]  731 	clr (INCR,sp)
      00832A 0F 02            [ 1]  732 	clr (LB,sp)
      00832C 90 89            [ 2]  733 	pushw y 
      00832E 13 01            [ 2]  734 	cpw x,(1,sp) ; compare DEST to SRC 
      008330 90 85            [ 2]  735 	popw y 
      008332 27 31            [ 1]  736 	jreq move_exit ; x==y 
      008334 2B 0E            [ 1]  737 	jrmi move_down
      008336                        738 move_up: ; start from top address with incr=-1
      008336 72 BB 00 09      [ 2]  739 	addw x,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      00833A 72 B9 00 09      [ 2]  740 	addw y,acc16
      00833E 03 01            [ 1]  741 	cpl (INCR,sp)
      008340 03 02            [ 1]  742 	cpl (LB,sp)   ; increment = -1 
      008342 20 05            [ 2]  743 	jra move_loop  
      008344                        744 move_down: ; start from bottom address with incr=1 
      008344 5A               [ 2]  745     decw x 
      008345 90 5A            [ 2]  746 	decw y
      008347 0C 02            [ 1]  747 	inc (LB,sp) ; incr=1 
      008349                        748 move_loop:	
      008349 C6 00 09         [ 1]  749     ld a, acc16 
      00834C CA 00 0A         [ 1]  750 	or a, acc8
      00834F 27 14            [ 1]  751 	jreq move_exit 
      008351 72 FB 01         [ 2]  752 	addw x,(INCR,sp)
      008354 72 F9 01         [ 2]  753 	addw y,(INCR,sp) 
      008357 90 F6            [ 1]  754 	ld a,(y)
      008359 F7               [ 1]  755 	ld (x),a 
      00835A 89               [ 2]  756 	pushw x 
      00835B CE 00 09         [ 2]  757 	ldw x,acc16 
      00835E 5A               [ 2]  758 	decw x 
      00835F CF 00 09         [ 2]  759 	ldw acc16,x 
      008362 85               [ 2]  760 	popw x 
      008363 20 E4            [ 2]  761 	jra move_loop
      008365                        762 move_exit:
      0002E5                        763 	_drop VSIZE
      008365 5B 02            [ 2]    1     addw sp,#VSIZE 
      008367 81               [ 4]  764 	ret 	
                                    765 
                                    766 ;-------------------------------------
                                    767 ; search text area for a line with 
                                    768 ; same number as line#  
                                    769 ; input:
                                    770 ;	X 			line# 
                                    771 ; output:
                                    772 ;   X 			addr of line | 0 
                                    773 ;   Y           line#|insert address if not found  
                                    774 ;-------------------------------------
                           000001   775 	LL=1 ; line length 
                           000002   776 	LB=2 ; line length low byte 
                           000002   777 	VSIZE=2 
      008368                        778 search_lineno:
      0002E8                        779 	_vars VSIZE
      008368 52 02            [ 2]    1     sub sp,#VSIZE 
      00836A 0F 01            [ 1]  780 	clr (LL,sp)
      00836C 90 CE 00 19      [ 2]  781 	ldw y,txtbgn
      008370                        782 search_ln_loop:
      008370 90 C3 00 1B      [ 2]  783 	cpw y,txtend 
      008374 2A 10            [ 1]  784 	jrpl 8$
      008376 90 F3            [ 1]  785 	cpw x,(y)
      008378 27 0E            [ 1]  786 	jreq 9$
      00837A 2B 0A            [ 1]  787 	jrmi 8$ 
      00837C 90 E6 02         [ 1]  788 	ld a,(2,y)
      00837F 6B 02            [ 1]  789 	ld (LB,sp),a 
      008381 72 F9 01         [ 2]  790 	addw y,(LL,sp)
      008384 20 EA            [ 2]  791 	jra search_ln_loop 
      008386                        792 8$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      008386 5F               [ 1]  793 	clrw x 	
      008387 51               [ 1]  794 	exgw x,y 
      000308                        795 9$: _drop VSIZE
      008388 5B 02            [ 2]    1     addw sp,#VSIZE 
      00838A 51               [ 1]  796 	exgw x,y   
      00838B 81               [ 4]  797 	ret 
                                    798 
                                    799 ;-------------------------------------
                                    800 ; delete line at addr
                                    801 ; move new line to insert with end of text 
                                    802 ; otherwise it would be overwritten.
                                    803 ; input:
                                    804 ;   X 		addr of line i.e DEST for move 
                                    805 ;-------------------------------------
                           000001   806 	LLEN=1
                           000003   807 	SRC=3
                           000004   808 	VSIZE=4
      00838C                        809 del_line: 
      00030C                        810 	_vars VSIZE 
      00838C 52 04            [ 2]    1     sub sp,#VSIZE 
      00838E E6 02            [ 1]  811 	ld a,(2,x) ; line length
      008390 6B 02            [ 1]  812 	ld (LLEN+1,sp),a 
      008392 0F 01            [ 1]  813 	clr (LLEN,sp)
      008394 90 93            [ 1]  814 	ldw y,x  
      008396 72 F9 01         [ 2]  815 	addw y,(LLEN,sp) ;SRC  
      008399 17 03            [ 2]  816 	ldw (SRC,sp),y  ;save source 
      00839B 90 CE 00 1B      [ 2]  817 	ldw y,txtend 
      00839F 90 E6 02         [ 1]  818 	ld a,(2,y)
      0083A2 90 5F            [ 1]  819 	clrw y 
      0083A4 90 97            [ 1]  820 	ld yl,a  
      0083A6 72 B9 00 1B      [ 2]  821 	addw y,txtend
      0083AA 72 F2 03         [ 2]  822 	subw y,(SRC,sp) ; y=count 
      0083AD 90 CF 00 09      [ 2]  823 	ldw acc16,y 
      0083B1 16 03            [ 2]  824 	ldw y,(SRC,sp)    ; source
      0083B3 CD 83 26         [ 4]  825 	call move
      0083B6 90 CE 00 1B      [ 2]  826 	ldw y,txtend 
      0083BA 72 F2 01         [ 2]  827 	subw y,(LLEN,sp)
      0083BD 90 CF 00 1B      [ 2]  828 	ldw txtend,y  
      000341                        829 	_drop VSIZE     
      0083C1 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083C3 81               [ 4]  830 	ret 
                                    831 
                                    832 ;---------------------------------------------
                                    833 ; create a gap in text area 
                                    834 ; move new line to insert in gap with end of text
                                    835 ; otherwise it would be overwritten.
                                    836 ; input:
                                    837 ;    X 			addr gap start 
                                    838 ;    Y 			gap length 
                                    839 ; output:
                                    840 ;    X 			addr gap start 
                                    841 ;--------------------------------------------
                           000001   842 	DEST=1
                           000003   843 	SRC=3
                           000005   844 	LEN=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                           000006   845 	VSIZE=6 
      0083C4                        846 create_gap:
      000344                        847 	_vars VSIZE
      0083C4 52 06            [ 2]    1     sub sp,#VSIZE 
      0083C6 1F 03            [ 2]  848 	ldw (SRC,sp),x 
      0083C8 17 05            [ 2]  849 	ldw (LEN,sp),y 
      0083CA 90 CF 00 09      [ 2]  850 	ldw acc16,y 
      0083CE 90 93            [ 1]  851 	ldw y,x ; SRC
      0083D0 72 BB 00 09      [ 2]  852 	addw x,acc16  
      0083D4 1F 01            [ 2]  853 	ldw (DEST,sp),x 
                                    854 ;compute size to move 	
      0083D6 CE 00 1B         [ 2]  855 	ldw x,txtend 
      0083D9 E6 02            [ 1]  856 	ld a,(2,x) ; pending line length 
      0083DB C7 00 0A         [ 1]  857 	ld acc8,a 
      0083DE 72 5F 00 09      [ 1]  858 	clr acc16 
      0083E2 72 BB 00 09      [ 2]  859 	addw x,acc16 
      0083E6 72 F0 03         [ 2]  860 	subw x,(SRC,sp)
      0083E9 CF 00 09         [ 2]  861 	ldw acc16,x ; size to move
      0083EC 1E 01            [ 2]  862 	ldw x,(DEST,sp) 
      0083EE CD 83 26         [ 4]  863 	call move
      0083F1 CE 00 1B         [ 2]  864 	ldw x,txtend
      0083F4 72 FB 05         [ 2]  865 	addw x,(LEN,sp)
      0083F7 CF 00 1B         [ 2]  866 	ldw txtend,x
      00037A                        867 9$:	_drop VSIZE 
      0083FA 5B 06            [ 2]    1     addw sp,#VSIZE 
      0083FC 81               [ 4]  868 	ret 
                                    869 
                                    870 
                                    871 ;--------------------------------------------
                                    872 ; insert line in tib into text area 
                                    873 ; first search for already existing 
                                    874 ; replace existing 
                                    875 ; if strlen(tib)==0 delete existing 
                                    876 ; input:
                                    877 ;   ptr16 				pointer to tokenized line  
                                    878 ; output:
                                    879 ;   none
                                    880 ;---------------------------------------------
                           000001   881 	DEST=1  ; text area insertion address 
                           000003   882 	SRC=3   ; str to insert address 
                           000005   883 	LINENO=5 ; line number 
                           000007   884 	LLEN=7 ; line length 
                           000008   885 	VSIZE=8  
      0083FD                        886 insert_line:
      00037D                        887 	_vars VSIZE 
      0083FD 52 08            [ 2]    1     sub sp,#VSIZE 
      0083FF CE 00 12         [ 2]  888 	ldw x,ptr16  
      008402 C3 00 19         [ 2]  889 	cpw x,txtbgn 
      008405 26 0D            [ 1]  890 	jrne 0$
                                    891 ;first text line 
      008407 AE 00 02         [ 2]  892 	ldw x,#2 
      00840A 72 D6 00 12      [ 4]  893 	ld a,([ptr16],x)
      00840E 5F               [ 1]  894 	clrw x 
      00840F 97               [ 1]  895 	ld xl,a
      008410 1F 07            [ 2]  896 	ldw (LLEN,sp),x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008412 20 45            [ 2]  897 	jra 5$
      008414 72 CE 00 12      [ 5]  898 0$:	ldw x,[ptr16]
                                    899 ; new line number
      008418 1F 05            [ 2]  900 	ldw (LINENO,sp),x 
      00841A AE 00 02         [ 2]  901 	ldw x,#2 
      00841D 72 D6 00 12      [ 4]  902 	ld a,([ptr16],x)
      008421 97               [ 1]  903 	ld xl,a
                                    904 ; new line length
      008422 1F 07            [ 2]  905 	ldw (LLEN,sp),x
                                    906 ; check if that line number already exit 	
      008424 1E 05            [ 2]  907 	ldw x,(LINENO,sp)
      008426 CD 83 68         [ 4]  908 	call search_lineno 
      008429 5D               [ 2]  909 	tnzw x 
      00842A 26 04            [ 1]  910 	jrne 2$
                                    911 ; line doesn't exit
                                    912 ; it will be inserted at this point.  	
      00842C 17 01            [ 2]  913 	ldw (DEST,sp),y 
      00842E 20 05            [ 2]  914 	jra 3$
                                    915 ; line exit delete it.
                                    916 ; it will be replaced by new one 	
      008430 1F 01            [ 2]  917 2$: ldw (DEST,sp),x 
      008432 CD 83 8C         [ 4]  918 	call del_line
      008435                        919 3$: 
                                    920 ; insert new line or leave if LLEN==3
                                    921 ; LLEN==3 means empty line 
      008435 A6 03            [ 1]  922 	ld a,#3
      008437 11 08            [ 1]  923 	cp a,(LLEN+1,sp)
      008439 27 27            [ 1]  924 	jreq insert_ln_exit ; empty line exit.
                                    925 ; if insertion point at txtend 
                                    926 ; no move required 
      00843B 1E 01            [ 2]  927 	ldw x,(DEST,sp)
      00843D C3 00 1B         [ 2]  928 	cpw x,txtend 
      008440 2A 17            [ 1]  929 	jrpl 5$ 
                                    930 ; must create a gap
                                    931 ; at insertion point  
      008442 1E 01            [ 2]  932 	ldw x,(DEST,sp)
      008444 16 07            [ 2]  933 	ldw y,(LLEN,sp)
      008446 CD 83 C4         [ 4]  934 	call create_gap 
                                    935 ; move new line in gap 
      008449 1E 07            [ 2]  936 	ldw x,(LLEN,sp)
      00844B CF 00 09         [ 2]  937 	ldw acc16,x 
      00844E 90 CE 00 1B      [ 2]  938 	ldw y,txtend ;SRC 
      008452 1E 01            [ 2]  939 	ldw x,(DEST,sp) ; dest address 
      008454 CD 83 26         [ 4]  940 	call move 
      008457 20 09            [ 2]  941 	jra insert_ln_exit  
      008459                        942 5$: ; no move required 
      008459 1E 07            [ 2]  943 	ldw x,(LLEN,sp) 
      00845B 72 BB 00 1B      [ 2]  944 	addw x,txtend 
      00845F CF 00 1B         [ 2]  945 	ldw txtend,x 
      008462                        946 insert_ln_exit:	
      0003E2                        947 	_drop VSIZE
      008462 5B 08            [ 2]    1     addw sp,#VSIZE 
      008464 81               [ 4]  948 	ret
                                    949 
                                    950 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    951 ;-----------------------------
                                    952 ; check if text buffer full
                                    953 ; input:
                                    954 ;   ptr16     addr start tokenize line 
                                    955 ;   X         buffer index 
                                    956 ; output:
                                    957 ;   none 
                                    958 ;-----------------------------------
      008465                        959 check_full:
      008465 72 BB 00 12      [ 2]  960 	addw x,ptr16 
      008469 A3 16 C8         [ 2]  961 	cpw x,#tib 
      00846C 25 05            [ 1]  962 	jrult 1$
      00846E A6 01            [ 1]  963 	ld a,#ERR_MEM_FULL
      008470 CC 87 91         [ 2]  964 	jp tb_error 
      008473 81               [ 4]  965 1$: ret 
                                    966 
                                    967 
                                    968 ;-----------------------------------
                                    969 ; create token list form text line 
                                    970 ; save this list in text area
                                    971 ; input:
                                    972 ;   none
                                    973 ; output:
                                    974 ;   basicptr     token list buffer
                                    975 ;   line# 		 BASIC line number 
                                    976 ;   in.w  		 cleared 
                                    977 ;-----------------------------------
                                    978 	.macro _incr_ptr16 n 
                                    979 	ldw x,#n 
                                    980 	addw x,ptr16 
                                    981 	ldw ptr16,x 
                                    982 	.endm 
                                    983 
                           000001   984 	XSAVE=1
                           000003   985 	BUFIDX=3
                           000004   986 	VSIZE=4
      008474                        987 compile:
      0003F4                        988 	_vars VSIZE 
      008474 52 04            [ 2]    1     sub sp,#VSIZE 
      008476 72 1A 00 20      [ 1]  989 	bset flags,#FCOMP 
      00847A CE 00 1B         [ 2]  990 	ldw x,txtend
      00847D CF 00 12         [ 2]  991 	ldw ptr16,x 
      008480 5F               [ 1]  992 	clrw x 
      008481 AE 00 03         [ 2]  993 	ldw x,#3
      008484 1F 03            [ 2]  994 	ldw (BUFIDX,sp),X  
      008486 CD 84 65         [ 4]  995 	call check_full
      008489 5F               [ 1]  996 	clrw x 
      00848A 72 CF 00 12      [ 5]  997 	ldw [ptr16],x 
      00848E CD 8D 6F         [ 4]  998 	call get_token
      008491 1F 01            [ 2]  999 	ldw (XSAVE,sp),x 
      008493 A1 04            [ 1] 1000 	cp a,#TK_INTGR 
      008495 26 11            [ 1] 1001 	jrne 3$
      008497 A3 00 00         [ 2] 1002 	cpw x,#0  
      00849A 22 03            [ 1] 1003 	jrugt 1$
      00849C CC 87 8F         [ 2] 1004 	jp syntax_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      00849F 72 CF 00 12      [ 5] 1005 1$:	ldw [ptr16],x; line number
      0084A3 CD 8D 6F         [ 4] 1006 2$:	call get_token
      0084A6 1F 01            [ 2] 1007 	ldw (XSAVE,sp),x 
      0084A8 A1 00            [ 1] 1008 3$:	cp a,#TK_NONE 
      0084AA 26 03            [ 1] 1009 	jrne 30$
      0084AC CC 85 3F         [ 2] 1010 	jp 9$
      0084AF                       1011 30$: 	 
      0084AF 1E 03            [ 2] 1012 	ldw x,(BUFIDX,sp)
      0084B1 CD 84 65         [ 4] 1013 	call check_full 
      0084B4 16 03            [ 2] 1014 	ldw y,(BUFIDX,sp) 
      0084B6 91 D7 12         [ 4] 1015 	ld ([ptr16],y),a ; token attribute 
      0084B9 90 5C            [ 1] 1016 	incw y
      0084BB 17 03            [ 2] 1017 	ldw (BUFIDX,sp),y
      0084BD A1 01            [ 1] 1018 	cp a,#TK_COLON 
      0084BF 26 02            [ 1] 1019 	jrne 31$
      0084C1 20 E0            [ 2] 1020 	jra 2$ 
      0084C3                       1021 31$:
      0084C3 A1 03            [ 1] 1022 	cp a,#TK_CHAR
      0084C5 26 0C            [ 1] 1023 	jrne 32$ 
      0084C7 1E 01            [ 2] 1024 	ldw x,(XSAVE,sp)
      0084C9 9F               [ 1] 1025 	ld a,xl 
      0084CA 91 D7 12         [ 4] 1026 	ld ([ptr16],y),a
      0084CD 90 5C            [ 1] 1027 	incw y 
      0084CF 17 03            [ 2] 1028 	ldw (BUFIDX,sp),y 
      0084D1 20 D0            [ 2] 1029 	jra 2$ 
      0084D3                       1030 32$:
      0084D3 A1 02            [ 1] 1031 	cp a,#TK_ARRAY 
      0084D5 27 CC            [ 1] 1032 	jreq 2$ 
      0084D7 A1 0A            [ 1] 1033 	cp a,#TK_QSTR 
      0084D9 26 25            [ 1] 1034 	jrne 4$
      0084DB AE 17 18         [ 2] 1035 	ldw x,#pad 
      0084DE CD 82 FA         [ 4] 1036 	call strlen
      0084E1 5C               [ 1] 1037 	incw x  
      0084E2 CD 84 65         [ 4] 1038 	call check_full 
      0084E5 90 AE 17 18      [ 2] 1039 	ldw y,#pad 
      0084E9 CE 00 12         [ 2] 1040 	ldw x,ptr16
      0084EC 72 FB 03         [ 2] 1041 	addw x,(BUFIDX,sp)	
      0084EF CD 83 18         [ 4] 1042 	call strcpy 
      0084F2 AE 17 18         [ 2] 1043 	ldw x,#pad 
      0084F5 CD 82 FA         [ 4] 1044 	call strlen 
      0084F8 5C               [ 1] 1045 	incw x
      0084F9 72 FB 03         [ 2] 1046 	addw x,(BUFIDX,sp) 
      0084FC 1F 03            [ 2] 1047 	ldw (BUFIDX,sp),x
      0084FE 20 A3            [ 2] 1048 	jra 2$  
      008500 A1 04            [ 1] 1049 4$: cp a,#TK_INTGR
      008502 25 9F            [ 1] 1050 	jrult 2$
      008504 A1 09            [ 1] 1051 	cp a,#TK_CONST 
      008506 22 9B            [ 1] 1052 	Jrugt 2$
      008508 1E 01            [ 2] 1053 	ldw x,(XSAVE,sp) 
      00850A 16 03            [ 2] 1054 	ldw y,(BUFIDX,sp)
      00850C 91 DF 12         [ 5] 1055 	ldw ([ptr16],y),x
      00850F A3 97 82         [ 2] 1056 	cpw x,#rem 
      008512 26 22            [ 1] 1057 	jrne 5$	
                                   1058 ; comment advance in.w to eol 
      008514 72 A9 00 02      [ 2] 1059 	addw y,#2 ; skip exec address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008518 17 03            [ 2] 1060 	ldw (BUFIDX,sp),y 
      00851A CE 00 12         [ 2] 1061 	ldw x,ptr16 
      00851D 72 FB 03         [ 2] 1062 	addw x,(BUFIDX,sp)
      008520 90 CE 00 01      [ 2] 1063 	ldw y,in.w 
      008524 72 A9 16 C8      [ 2] 1064 	addw y,#tib 
      008528 CD 83 18         [ 4] 1065 	call strcpy 	
      00852B CD 82 FA         [ 4] 1066 	call strlen 
      00852E 5C               [ 1] 1067 	incw x ; skip string 0. 
      00852F 72 FB 03         [ 2] 1068 	addw x,(BUFIDX,sp)
      008532 1F 03            [ 2] 1069 	ldw (BUFIDX,sp),x 
      008534 20 09            [ 2] 1070 	jra 9$
      008536 72 A9 00 02      [ 2] 1071 5$:	addw y,#2 
      00853A 17 03            [ 2] 1072 	ldw (BUFIDX,sp),y 
      00853C CC 84 A3         [ 2] 1073 	jp 2$
      00853F                       1074 9$: 
      00853F AE 00 02         [ 2] 1075 	ldw x,#2
      008542 16 03            [ 2] 1076 	ldw y,(BUFIDX,sp)
      008544 90 9F            [ 1] 1077 	ld a,yl 
      008546 72 D7 00 12      [ 4] 1078 	ld ([ptr16],x),a  	
      00854A 72 CE 00 12      [ 5] 1079 	ldw x,[ptr16]
      00854E 27 09            [ 1] 1080 	jreq 10$
      008550 CD 83 FD         [ 4] 1081 	call insert_line
      008553 72 5F 00 04      [ 1] 1082 	clr  count 
      008557 20 0F            [ 2] 1083 	jra  11$ 
      008559                       1084 10$: 
      008559 CE 00 12         [ 2] 1085 	ldw x,ptr16 
      00855C CF 00 05         [ 2] 1086 	ldw basicptr,x 
      00855F E6 02            [ 1] 1087 	ld a,(2,x)
      008561 C7 00 04         [ 1] 1088 	ld count,a 
      008564 35 03 00 02      [ 1] 1089 	mov in,#3 
      008568                       1090 11$:
      0004E8                       1091 	_drop VSIZE 
      008568 5B 04            [ 2]    1     addw sp,#VSIZE 
      00856A 72 1B 00 20      [ 1] 1092 	bres flags,#FCOMP 
      00856E 81               [ 4] 1093 	ret 
                                   1094 
                                   1095 
                                   1096 ;------------------------------------
                                   1097 ;  set all variables to zero 
                                   1098 ; input:
                                   1099 ;   none 
                                   1100 ; output:
                                   1101 ;	none
                                   1102 ;------------------------------------
      00856F                       1103 clear_vars:
      00856F AE 00 22         [ 2] 1104 	ldw x,#vars 
      008572 90 AE 00 34      [ 2] 1105 	ldw y,#2*26 
      008576 7F               [ 1] 1106 1$:	clr (x)
      008577 5C               [ 1] 1107 	incw x 
      008578 90 5A            [ 2] 1108 	decw y 
      00857A 26 FA            [ 1] 1109 	jrne 1$
      00857C 81               [ 4] 1110 	ret 
                                   1111 
                                   1112 ;-------------------------------------
                                   1113 ; check if A is a letter
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1114 ; input:
                                   1115 ;   A 			character to test 
                                   1116 ; output:
                                   1117 ;   C flag      1 true, 0 false 
                                   1118 ;-------------------------------------
      00857D                       1119 is_alpha:
      00857D A1 41            [ 1] 1120 	cp a,#'A 
      00857F 8C               [ 1] 1121 	ccf
      008580 24 0B            [ 1] 1122 	jrnc 9$ 
      008582 A1 5B            [ 1] 1123 	cp a,#'Z+1 
      008584 25 07            [ 1] 1124 	jrc 9$ 
      008586 A1 61            [ 1] 1125 	cp a,#'a 
      008588 8C               [ 1] 1126 	ccf 
      008589 24 02            [ 1] 1127 	jrnc 9$
      00858B A1 7B            [ 1] 1128 	cp a,#'z+1   
      00858D 81               [ 4] 1129 9$: ret 	
                                   1130 
                                   1131 ;-------------------------------------
                                   1132 ;  program initialization entry point 
                                   1133 ;-------------------------------------
                           000001  1134 	MAJOR=1
                           000000  1135 	MINOR=0
      00858E 0A 0A 54 69 6E 79 20  1136 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0085D4                       1137 cold_start:
                                   1138 ;set stack 
      0085D4 AE 17 FF         [ 2] 1139 	ldw x,#STACK_EMPTY
      0085D7 94               [ 1] 1140 	ldw sp,x   
                                   1141 ; clear all ram 
      0085D8 7F               [ 1] 1142 0$: clr (x)
      0085D9 5A               [ 2] 1143 	decw x 
      0085DA 26 FC            [ 1] 1144 	jrne 0$
                                   1145 ; activate pull up on all inputs 
      0085DC A6 FF            [ 1] 1146 	ld a,#255 
      0085DE C7 50 03         [ 1] 1147 	ld PA_CR1,a 
      0085E1 C7 50 08         [ 1] 1148 	ld PB_CR1,a 
      0085E4 C7 50 0D         [ 1] 1149 	ld PC_CR1,a 
      0085E7 C7 50 12         [ 1] 1150 	ld PD_CR1,a 
      0085EA C7 50 17         [ 1] 1151 	ld PE_CR1,a 
      0085ED C7 50 1C         [ 1] 1152 	ld PF_CR1,a 
      0085F0 C7 50 21         [ 1] 1153 	ld PG_CR1,a 
      0085F3 C7 50 2B         [ 1] 1154 	ld PI_CR1,a 
                                   1155 ; disable peripherals clocks
      0085F6 72 5F 50 C7      [ 1] 1156 	clr CLK_PCKENR1 
      0085FA 72 5F 50 CA      [ 1] 1157 	clr CLK_PCKENR2 	
                                   1158 ; select internal clock no divisor: 16 Mhz 	
      0085FE A6 E1            [ 1] 1159 	ld a,#CLK_SWR_HSI 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008600 5F               [ 1] 1160 	clrw x  
      008601 CD 81 19         [ 4] 1161     call clock_init 
      008604 CD 81 2F         [ 4] 1162 	call timer4_init
                                   1163 ; UART3 at 115200 BAUD
      008607 CD 81 F8         [ 4] 1164 	call uart3_init
                                   1165 ; activate PE_4 (user button interrupt)
      00860A 72 18 50 18      [ 1] 1166     bset PE_CR2,#USR_BTN_BIT 
                                   1167 ; display system information
      00860E AE 85 8E         [ 2] 1168 	ldw x,#software 
      008611 CD 82 38         [ 4] 1169 	call puts 
      008614 A6 01            [ 1] 1170 	ld a,#MAJOR 
      008616 C7 00 0A         [ 1] 1171 	ld acc8,a 
      008619 5F               [ 1] 1172 	clrw x 
      00861A CF 00 08         [ 2] 1173 	ldw acc24,x 
      00861D A6 0A            [ 1] 1174 	ld a,#10 
      00861F CD 89 C0         [ 4] 1175 	call prti24 
      008622 A6 2E            [ 1] 1176 	ld a,#'.
      008624 CD 82 26         [ 4] 1177 	call putc 
      008627 A6 00            [ 1] 1178 	ld a,#MINOR 
      008629 C7 00 0A         [ 1] 1179 	ld acc8,a 
      00862C 5F               [ 1] 1180 	clrw x 
      00862D CF 00 08         [ 2] 1181 	ldw acc24,x 
      008630 A6 0A            [ 1] 1182 	ld a,#10 
      008632 CD 89 C0         [ 4] 1183 	call prti24 
      008635 A6 0D            [ 1] 1184 	ld a,#CR 
      008637 CD 82 26         [ 4] 1185 	call putc 
      00863A CD 9B 0E         [ 4] 1186 	call seek_fdrive 
                                   1187 ; configure LD2 pin 
      00863D 72 1A 50 0D      [ 1] 1188     bset PC_CR1,#LED2_BIT
      008641 72 1A 50 0E      [ 1] 1189     bset PC_CR2,#LED2_BIT
      008645 72 1A 50 0C      [ 1] 1190     bset PC_DDR,#LED2_BIT
      008649 9A               [ 1] 1191 	rim 
      00864A 72 5C 00 10      [ 1] 1192 	inc seedy+1 
      00864E 72 5C 00 0E      [ 1] 1193 	inc seedx+1 
      008652 CD 86 61         [ 4] 1194 	call clear_basic
      008655 CD 93 EF         [ 4] 1195 	call ubound 
      008658 CD 90 0E         [ 4] 1196 	call dpop 
      00865B CF 00 1E         [ 2] 1197 	ldw array_size,x 
      00865E CC 87 E3         [ 2] 1198     jp warm_start 
                                   1199 
                                   1200 ;---------------------------
                                   1201 ; reset BASIC text variables 
                                   1202 ; and clear variables 
                                   1203 ;---------------------------
      008661                       1204 clear_basic:
      008661 72 5F 00 04      [ 1] 1205 	clr count 
      008665 AE 00 56         [ 2] 1206 	ldw x,#free_ram 
      008668 CF 00 19         [ 2] 1207 	ldw txtbgn,x 
      00866B CF 00 1B         [ 2] 1208 	ldw txtend,x 
      00866E CD 85 6F         [ 4] 1209 	call clear_vars 
      008671 81               [ 4] 1210 	ret 
                                   1211 
                                   1212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1213 ;;   Tiny BASIC error messages     ;;
                                   1214 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008672                       1215 err_msg:
      008672 00 00 86 8A 86 98 86  1216 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             A7 86 C1 86 D1
      00867E 86 E8 86 FF 87 1A 87  1217 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             2C 87 3E
      008688 87 4B                 1218 	.word err_no_access 
                                   1219 
      00868A 0A 4D 65 6D 6F 72 79  1220 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      008698 0A 73 79 6E 74 61 78  1221 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      0086A7 0A 6D 61 74 68 20 6F  1222 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0086C1 0A 64 69 76 69 73 69  1223 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      0086D1 0A 69 6E 76 61 6C 69  1224 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      0086E8 0A 72 75 6E 20 74 69  1225 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      0086FF 0A 63 6F 6D 6D 61 6E  1226 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      00871A 0A 64 75 70 6C 69 63  1227 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      00872C 0A 46 69 6C 65 20 6E  1228 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      00873E 0A 62 61 64 20 76 61  1229 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      00874B 0A 46 69 6C 65 20 69  1230 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
                                   1231 
      00877F 6C 61 73 74 20 74 6F  1232 rt_msg: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
             20 00
                                   1233 
      00878F                       1234 syntax_error:
      00878F A6 02            [ 1] 1235 	ld a,#ERR_SYNTAX 
                                   1236 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008791                       1237 tb_error:
      008791 AE 86 72         [ 2] 1238 	ldw x, #err_msg 
      008794 72 5F 00 09      [ 1] 1239 	clr acc16 
      008798 48               [ 1] 1240 	sll a
      008799 72 59 00 09      [ 1] 1241 	rlc acc16  
      00879D C7 00 0A         [ 1] 1242 	ld acc8, a 
      0087A0 72 BB 00 09      [ 2] 1243 	addw x,acc16 
      0087A4 FE               [ 2] 1244 	ldw x,(x)
      0087A5 CD 82 38         [ 4] 1245 	call puts
      0087A8 72 0B 00 20 18   [ 2] 1246 	btjf flags,#FCOMP, 1$
      0087AD AE 16 C8         [ 2] 1247 	ldw x,#tib
      0087B0 CD 82 38         [ 4] 1248 	call puts 
      0087B3 A6 0D            [ 1] 1249 	ld a,#CR 
      0087B5 CD 82 26         [ 4] 1250 	call putc
      0087B8 CE 00 01         [ 2] 1251 	ldw x,in.w
      0087BB CD 82 60         [ 4] 1252 	call spaces
      0087BE A6 5E            [ 1] 1253 	ld a,#'^
      0087C0 CD 82 26         [ 4] 1254 	call putc 
      0087C3 20 1A            [ 2] 1255 	jra 6$
      0087C5 CE 00 05         [ 2] 1256 1$:	ldw x,basicptr
      0087C8 CD 95 0C         [ 4] 1257 	call prt_basic_line
      0087CB AE 87 7F         [ 2] 1258 	ldw x,#rt_msg 
      0087CE CD 82 38         [ 4] 1259 	call puts 
      0087D1 5F               [ 1] 1260 	clrw x 
      0087D2 C6 00 03         [ 1] 1261 	ld a,in.saved 
      0087D5 97               [ 1] 1262 	ld xl,a 
      0087D6 72 D6 00 05      [ 4] 1263 	ld a,([basicptr],x)
      0087DA 5F               [ 1] 1264 	clrw x 
      0087DB 97               [ 1] 1265 	ld xl,a 
      0087DC CD 8A 08         [ 4] 1266 	call print_int 
      0087DF AE 17 FF         [ 2] 1267 6$: ldw x,#STACK_EMPTY 
      0087E2 94               [ 1] 1268     ldw sp,x
      0087E3                       1269 warm_start:
      0087E3 72 5F 00 20      [ 1] 1270 	clr flags 
      0087E7 72 5F 00 1D      [ 1] 1271 	clr loop_depth 
      0087EB AE 17 80         [ 2] 1272 	ldw x,#dstack_unf 
      0087EE CF 00 17         [ 2] 1273 	ldw dstkptr,x 
      0087F1 35 04 00 21      [ 1] 1274 	mov tab_width,#TAB_WIDTH 
      0087F5 35 0A 00 07      [ 1] 1275 	mov base,#10 
      0087F9 AE 16 C8         [ 2] 1276 	ldw x,#tib 
      0087FC CF 00 05         [ 2] 1277 	ldw basicptr,x 
                                   1278 ;----------------------------
                                   1279 ;   BASIC interpreter
                                   1280 ;----------------------------
      0087FF                       1281 interp:
      0087FF 72 5F 00 01      [ 1] 1282 	clr in.w
      008803 72 01 00 20 23   [ 2] 1283 	btjf flags,#FRUN,4$ 
                                   1284 ; running program
                                   1285 ; goto next basic line 
      008808 CE 00 05         [ 2] 1286 	ldw x,basicptr
      00880B E6 02            [ 1] 1287 	ld a,(2,x) ; line length 
      00880D C7 00 0A         [ 1] 1288 	ld acc8,a 
      008810 72 5F 00 09      [ 1] 1289 	clr acc16 
      008814 72 BB 00 09      [ 2] 1290 	addw x,acc16
      008818 C3 00 1B         [ 2] 1291 	cpw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      00881B 2A C6            [ 1] 1292 	jrpl warm_start
      00881D CF 00 05         [ 2] 1293 	ldw basicptr,x ; start of next line  
      008820 E6 02            [ 1] 1294 	ld a,(2,x)
      008822 C7 00 04         [ 1] 1295 	ld count,a 
      008825 35 03 00 02      [ 1] 1296 	mov in,#3 ; skip first 3 bytes of line 
      008829 20 14            [ 2] 1297 	jra interp_loop 
      00882B                       1298 4$: ; commande line mode 	
      00882B 72 5F 00 02      [ 1] 1299 	clr in
      00882F A6 0D            [ 1] 1300 	ld a,#CR 
      008831 CD 82 26         [ 4] 1301 	call putc 
      008834 A6 3E            [ 1] 1302 	ld a,#'> 
      008836 CD 82 26         [ 4] 1303 	call putc 
      008839 CD 8A F6         [ 4] 1304 	call readln
      00883C CD 84 74         [ 4] 1305 	call compile
      00883F                       1306 interp_loop:  
      00883F C6 00 02         [ 1] 1307 	ld a,in 
      008842 C1 00 04         [ 1] 1308 	cp a,count  
      008845 2A B8            [ 1] 1309 	jrpl interp
      008847 CD 88 6F         [ 4] 1310 	call next_token
      00884A A1 01            [ 1] 1311 	cp a,#TK_COLON 
      00884C 27 F1            [ 1] 1312 	jreq interp_loop 
      00884E A1 00            [ 1] 1313 	cp a,#TK_NONE 
                                   1314 ;	jreq interp 
      008850                       1315 1$:
      008850 A1 05            [ 1] 1316 	cp a,#TK_VAR
      008852 26 05            [ 1] 1317 	jrne 2$
      008854 CD 94 1B         [ 4] 1318 	call let02  
      008857 20 E6            [ 2] 1319 	jra interp_loop 
      008859                       1320 2$:	
      008859 A1 02            [ 1] 1321 	cp a,#TK_ARRAY 
      00885B 26 08            [ 1] 1322 	jrne 3$
      00885D CD 92 62         [ 4] 1323 	call get_array_element
      008860 CD 94 1B         [ 4] 1324 	call let02 
      008863 20 DA            [ 2] 1325 	jra interp_loop 
      008865                       1326 3$:
      008865 A1 06            [ 1] 1327 	cp a,#TK_CMD
      008867 26 03            [ 1] 1328 	jrne 4$
      008869 FD               [ 4] 1329 	call (x) 
      00886A 20 D3            [ 2] 1330 	jra interp_loop 
      00886C                       1331 4$:	
      00886C CC 87 8F         [ 2] 1332 	jp syntax_error 
                                   1333 
                                   1334 ;--------------------------
                                   1335 ; extract next token from
                                   1336 ; token list 
                                   1337 ; basicptr -> base address 
                                   1338 ; in  -> offset in list array 
                                   1339 ; output:
                                   1340 ;   A 		token attribute
                                   1341 ;   X 		token value if there is one
                                   1342 ;----------------------------------------
      00886F                       1343 next_token:
      00886F C6 00 02         [ 1] 1344 	ld a,in 
      008872 C0 00 04         [ 1] 1345 	sub a,count 
      008875 27 3B            [ 1] 1346 	jreq 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008877 55 00 02 00 03   [ 1] 1347 	mov in.saved,in
      00887C CE 00 05         [ 2] 1348 	ldw x,basicptr 
      00887F 72 D6 00 01      [ 4] 1349 	ld a,([in.w],x)
      008883 72 5C 00 02      [ 1] 1350 	inc in 
      008887 A1 02            [ 1] 1351 	cp a,#TK_ARRAY  
      008889 23 27            [ 2] 1352 	jrule 9$
      00888B A1 03            [ 1] 1353 	cp a,#TK_CHAR
      00888D 26 0D            [ 1] 1354 	jrne 1$
      00888F 72 D6 00 01      [ 4] 1355 	ld a,([in.w],x)
      008893 72 5C 00 02      [ 1] 1356 	inc in
      008897 5F               [ 1] 1357 	clrw x 
      008898 97               [ 1] 1358 	ld xl,a 
      008899 A6 03            [ 1] 1359 	ld a,#TK_CHAR
      00889B 81               [ 4] 1360 	ret 
      00889C A1 0A            [ 1] 1361 1$:	cp a,#TK_QSTR 
      00889E 25 06            [ 1] 1362 	jrult 2$
      0088A0 72 BB 00 01      [ 2] 1363 	addw x,in.w 
      0088A4 20 0C            [ 2] 1364 	jra 9$
      0088A6 72 DE 00 01      [ 5] 1365 2$: ldw x,([in.w],x)
      0088AA 72 5C 00 02      [ 1] 1366 	inc in 
      0088AE 72 5C 00 02      [ 1] 1367 	inc in
      0088B2 81               [ 4] 1368 9$: ret	
                                   1369 
                                   1370 
                                   1371 ;----------------------------------------
                                   1372 ;   DEBUG support functions
                                   1373 ;----------------------------------------
                           000001  1374 .if DEBUG 
                                   1375 ; turn LED on 
      0088B3                       1376 ledon:
      0088B3 72 1A 50 0A      [ 1] 1377     bset PC_ODR,#LED2_BIT
      0088B7 81               [ 4] 1378     ret 
                                   1379 
                                   1380 ; turn LED off 
      0088B8                       1381 ledoff:
      0088B8 72 1B 50 0A      [ 1] 1382     bres PC_ODR,#LED2_BIT 
      0088BC 81               [ 4] 1383     ret 
                                   1384 
                                   1385 ; invert LED status 
      0088BD                       1386 ledtoggle:
      0088BD A6 20            [ 1] 1387     ld a,#LED2_MASK
      0088BF C8 50 0A         [ 1] 1388     xor a,PC_ODR
      0088C2 C7 50 0A         [ 1] 1389     ld PC_ODR,a
      0088C5 81               [ 4] 1390     ret 
                                   1391 
      0088C6                       1392 left_paren:
      0088C6 A6 20            [ 1] 1393 	ld a,#SPACE 
      0088C8 CD 82 26         [ 4] 1394 	call putc
      0088CB A6 28            [ 1] 1395 	ld a,#'( 
      0088CD CD 82 26         [ 4] 1396 	call putc 	
      0088D0 81               [ 4] 1397 	ret 
                                   1398 
                                   1399 ;------------------------------
                                   1400 ; print 8 bit register 
                                   1401 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1402 ;   X  point to register name 
                                   1403 ;   A  register value to print 
                                   1404 ; output:
                                   1405 ;   none
                                   1406 ;------------------------------- 
      0088D1                       1407 prt_reg8:
      0088D1 88               [ 1] 1408 	push a 
      0088D2 CD 82 38         [ 4] 1409 	call puts 
      0088D5 7B 01            [ 1] 1410 	ld a,(1,sp) 
      0088D7 C7 00 0A         [ 1] 1411 	ld acc8,a 
      0088DA 5F               [ 1] 1412 	clrw x 
      0088DB 97               [ 1] 1413 	ld xl,a 
      0088DC 35 10 00 07      [ 1] 1414 	mov base,#16
      0088E0 CD 8A 08         [ 4] 1415 	call print_int 
      0088E3 CD 88 C6         [ 4] 1416 	call left_paren 
      0088E6 84               [ 1] 1417 	pop a 
      0088E7 5F               [ 1] 1418 	clrw x 
      0088E8 97               [ 1] 1419 	ld xl,a 
      0088E9 35 0A 00 07      [ 1] 1420 	mov base,#10 
      0088ED CD 8A 08         [ 4] 1421 	call print_int  
      0088F0 A6 29            [ 1] 1422 	ld a,#') 
      0088F2 CD 82 26         [ 4] 1423 	call putc
      0088F5 81               [ 4] 1424 	ret
                                   1425 
                                   1426 ;--------------------------------
                                   1427 ; print 16 bits register 
                                   1428 ; input:
                                   1429 ;   X   point register name 
                                   1430 ;   Y   register value to print 
                                   1431 ; output:
                                   1432 ;  none
                                   1433 ;--------------------------------
      0088F6                       1434 prt_reg16: 
      0088F6 90 89            [ 2] 1435 	pushw y 
      0088F8 CD 82 38         [ 4] 1436 	call puts 
      0088FB 1E 01            [ 2] 1437 	ldw x,(1,sp) 
      0088FD 35 10 00 07      [ 1] 1438 	mov base,#16 
      008901 CD 8A 08         [ 4] 1439 	call print_int  
      008904 CD 88 C6         [ 4] 1440 	call left_paren 
      008907 85               [ 2] 1441 	popw x 
      008908 35 0A 00 07      [ 1] 1442 	mov base,#10 
      00890C CD 8A 08         [ 4] 1443 	call print_int  
      00890F A6 29            [ 1] 1444 	ld a,#') 
      008911 CD 82 26         [ 4] 1445 	call putc
      008914 81               [ 4] 1446 	ret 
                                   1447 
                                   1448 ;------------------------------------
                                   1449 ; print registers contents saved on
                                   1450 ; stack by trap interrupt.
                                   1451 ;------------------------------------
      008915                       1452 print_registers:
      008915 AE 89 68         [ 2] 1453 	ldw x,#STATES
      008918 CD 82 38         [ 4] 1454 	call puts
                                   1455 ; print EPC 
      00891B AE 89 A5         [ 2] 1456 	ldw x, #REG_EPC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      00891E CD 82 38         [ 4] 1457 	call puts 
      008921 7B 0B            [ 1] 1458 	ld a, (11,sp)
      008923 C7 00 0A         [ 1] 1459 	ld acc8,a 
      008926 7B 0A            [ 1] 1460 	ld a, (10,sp) 
      008928 C7 00 09         [ 1] 1461 	ld acc16,a 
      00892B 7B 09            [ 1] 1462 	ld a,(9,sp) 
      00892D C7 00 08         [ 1] 1463 	ld acc24,a
      008930 5F               [ 1] 1464 	clrw x  
      008931 A6 10            [ 1] 1465 	ld a,#16
      008933 CD 89 C0         [ 4] 1466 	call prti24  
                                   1467 ; print X
      008936 AE 89 AE         [ 2] 1468 	ldw x,#REG_X
      008939 16 05            [ 2] 1469 	ldw y,(5,sp)
      00893B CD 88 F6         [ 4] 1470 	call prt_reg16  
                                   1471 ; print Y 
      00893E AE 89 AA         [ 2] 1472 	ldw x,#REG_Y
      008941 16 07            [ 2] 1473 	ldw y, (7,sp)
      008943 CD 88 F6         [ 4] 1474 	call prt_reg16  
                                   1475 ; print A 
      008946 AE 89 B2         [ 2] 1476 	ldw x,#REG_A
      008949 7B 04            [ 1] 1477 	ld a, (4,sp) 
      00894B CD 88 D1         [ 4] 1478 	call prt_reg8
                                   1479 ; print CC 
      00894E AE 89 B6         [ 2] 1480 	ldw x,#REG_CC 
      008951 7B 03            [ 1] 1481 	ld a, (3,sp) 
      008953 CD 88 D1         [ 4] 1482 	call prt_reg8 
                                   1483 ; print SP 
      008956 AE 89 BB         [ 2] 1484 	ldw x,#REG_SP
      008959 90 96            [ 1] 1485 	ldw y,sp 
      00895B 72 A9 00 0C      [ 2] 1486 	addw y,#12
      00895F CD 88 F6         [ 4] 1487 	call prt_reg16  
      008962 A6 0A            [ 1] 1488 	ld a,#'\n' 
      008964 CD 82 26         [ 4] 1489 	call putc
      008967 81               [ 4] 1490 	ret
                                   1491 
      008968 0A 52 65 67 69 73 74  1492 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      0089A5 45 50 43 3A 00        1493 REG_EPC: .asciz "EPC:"
      0089AA 0A 59 3A 00           1494 REG_Y:   .asciz "\nY:" 
      0089AE 0A 58 3A 00           1495 REG_X:   .asciz "\nX:"
      0089B2 0A 41 3A 00           1496 REG_A:   .asciz "\nA:" 
      0089B6 0A 43 43 3A 00        1497 REG_CC:  .asciz "\nCC:"
      0089BB 0A 53 50 3A 00        1498 REG_SP:  .asciz "\nSP:"
                                   1499 .endif ; DEBUG 
                                   1500 
                                   1501 ;------------------------------------
                                   1502 ; print integer in acc24 
                                   1503 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1504 ;	acc24 		integer to print 
                                   1505 ;	A 			numerical base for conversion 
                                   1506 ;               if bit 7 is set add a space at print end.
                                   1507 ;   XL 			field width, 0 -> no fill.
                                   1508 ;  output:
                                   1509 ;    none 
                                   1510 ;------------------------------------
                           000001  1511 	WIDTH = 1
                           000002  1512 	BASE = 2
                           000003  1513 	ADD_SPACE=3 ; add a space after number 
                           000003  1514 	VSIZE = 3
      0089C0                       1515 prti24:
      000940                       1516 	_vars VSIZE 
      0089C0 52 03            [ 2]    1     sub sp,#VSIZE 
      0089C2 0F 03            [ 1] 1517 	clr (ADD_SPACE,sp)
      0089C4 A5 80            [ 1] 1518 	bcp a,#0x80 
      0089C6 27 02            [ 1] 1519 	jreq 0$ 
      0089C8 03 03            [ 1] 1520 	cpl (ADD_SPACE,sp)
      0089CA A4 1F            [ 1] 1521 0$:	and a,#31 
      0089CC 6B 02            [ 1] 1522 	ld (BASE,sp),a
      0089CE 9F               [ 1] 1523 	ld a,xl
      0089CF 6B 01            [ 1] 1524 	ld (WIDTH,sp),a 
      0089D1 7B 02            [ 1] 1525 	ld a, (BASE,sp)  
      0089D3 CD 8A 64         [ 4] 1526     call itoa  ; conversion entier en  .asciz
      0089D6 7B 01            [ 1] 1527 1$: ld a,(WIDTH,sp)
      0089D8 27 1F            [ 1] 1528 	jreq 4$
      0089DA C7 00 0A         [ 1] 1529 	ld acc8,a 
      0089DD 89               [ 2] 1530 	pushw x 
      0089DE CD 82 FA         [ 4] 1531 	call strlen 
      0089E1 9F               [ 1] 1532 	ld a,xl 
      0089E2 85               [ 2] 1533 	popw x 
      0089E3 31 00 0A         [ 3] 1534 	exg a,acc8 
      0089E6 C0 00 0A         [ 1] 1535 	sub a,acc8 
      0089E9 2B 0E            [ 1] 1536 	jrmi 4$
      0089EB 6B 01            [ 1] 1537 	ld (WIDTH,sp),a 
      0089ED A6 20            [ 1] 1538 	ld  a,#SPACE
      0089EF 0D 01            [ 1] 1539 3$: tnz (WIDTH,sp)
      0089F1 27 06            [ 1] 1540 	jreq 4$
      0089F3 5A               [ 2] 1541 	decw x 
      0089F4 F7               [ 1] 1542 	ld (x),a 
      0089F5 0A 01            [ 1] 1543 	dec (WIDTH,sp) 
      0089F7 20 F6            [ 2] 1544 	jra 3$
      0089F9                       1545 4$: 
      0089F9 CD 82 38         [ 4] 1546 	call puts 
      0089FC 0D 03            [ 1] 1547 	tnz (ADD_SPACE,sp)
      0089FE 27 05            [ 1] 1548 	jreq 5$
      008A00 A6 20            [ 1] 1549     ld a,#SPACE 
      008A02 CD 82 26         [ 4] 1550 	call putc 
      000985                       1551 5$: _drop VSIZE 
      008A05 5B 03            [ 2]    1     addw sp,#VSIZE 
      008A07 81               [ 4] 1552     ret	
                                   1553 
                                   1554 ;-----------------------------------
                                   1555 ; print a 16 bit integer 
                                   1556 ; using variable 'base' as conversion
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1557 ; format.
                                   1558 ; input:
                                   1559 ;   X       integer to print 
                                   1560 ;   base    conversion base 
                                   1561 ; output:
                                   1562 ;   none 
                                   1563 ;-----------------------------------
                           000001  1564 	SIGN=1
                           000001  1565 	VSIZE=1
      008A08                       1566 print_int: 
      000988                       1567 	_vars VSIZE 
      008A08 52 01            [ 2]    1     sub sp,#VSIZE 
      008A0A 0F 01            [ 1] 1568 	clr (SIGN,sp)
      008A0C 90 AE 17 3F      [ 2] 1569 	ldw y,#pad+PAD_SIZE-1 
      008A10 90 7F            [ 1] 1570 	clr (y)
      008A12 C6 00 07         [ 1] 1571 	ld a,base  
      008A15 A1 0A            [ 1] 1572 	cp a,#10 
      008A17 26 06            [ 1] 1573 	jrne 1$ 
      008A19 5D               [ 2] 1574 	tnzw x 
      008A1A 2A 03            [ 1] 1575 	jrpl 1$ 
      008A1C 03 01            [ 1] 1576 	cpl (SIGN,sp)
      008A1E 50               [ 2] 1577 	negw x 	 
      008A1F                       1578 1$:	
      008A1F C6 00 07         [ 1] 1579 	ld a,base 
      008A22 62               [ 2] 1580 	div x,a 
      008A23 AB 30            [ 1] 1581 	add a,#'0 
      008A25 A1 3A            [ 1] 1582 	cp a,#'9+1 
      008A27 2B 02            [ 1] 1583 	jrmi 2$ 
      008A29 AB 07            [ 1] 1584 	add a,#7 
      008A2B 90 5A            [ 2] 1585 2$: decw y 
      008A2D 90 F7            [ 1] 1586 	ld (y),a 
      008A2F 5D               [ 2] 1587 	tnzw x 
      008A30 26 ED            [ 1] 1588 	jrne 1$ 
      008A32 A6 10            [ 1] 1589 	ld a,#16 
      008A34 C1 00 07         [ 1] 1590 	cp a,base 
      008A37 26 08            [ 1] 1591 	jrne 3$
      008A39 A6 24            [ 1] 1592 	ld a,#'$
      008A3B 90 5A            [ 2] 1593 	decw y  
      008A3D 90 F7            [ 1] 1594 	ld (y),a
      008A3F 20 0A            [ 2] 1595 	jra 9$ 
      008A41 0D 01            [ 1] 1596 3$: tnz (SIGN,sp)
      008A43 27 06            [ 1] 1597 	jreq 9$ 
      008A45 A6 2D            [ 1] 1598 	ld a,#'-
      008A47 90 5A            [ 2] 1599 	decw y  
      008A49 90 F7            [ 1] 1600 	ld (y),a
      008A4B                       1601 9$:	
      008A4B 93               [ 1] 1602 	ldw x,y 
      008A4C 1D 17 3F         [ 2] 1603 	subw x,#pad+PAD_SIZE-1 
      008A4F 50               [ 2] 1604 	negw x  
      008A50                       1605 10$:
      008A50 90 5A            [ 2] 1606 	decw y 
      008A52 A6 20            [ 1] 1607 	ld a,#SPACE 
      008A54 90 F7            [ 1] 1608 	ld (y),a
      008A56 5C               [ 1] 1609 	incw x 
      008A57 9F               [ 1] 1610 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A58 C1 00 21         [ 1] 1611 	cp a,tab_width
      008A5B 2B F3            [ 1] 1612 	jrmi 10$ 
      008A5D                       1613 12$:
      008A5D 93               [ 1] 1614     ldw x,y 
      008A5E CD 82 38         [ 4] 1615 	call puts  
      0009E1                       1616 	_drop VSIZE 
      008A61 5B 01            [ 2]    1     addw sp,#VSIZE 
      008A63 81               [ 4] 1617 	ret 
                                   1618 
                                   1619 ;------------------------------------
                                   1620 ; convert integer in acc24 to string
                                   1621 ; input:
                                   1622 ;   A	  	base
                                   1623 ;	acc24	integer to convert
                                   1624 ; output:
                                   1625 ;   X  		pointer to string
                                   1626 ;------------------------------------
                           000001  1627 	SIGN=1  ; integer sign 
                           000002  1628 	BASE=2  ; numeric base 
                           000002  1629 	VSIZE=2  ;locals size
      008A64                       1630 itoa:
      008A64 52 02            [ 2] 1631 	sub sp,#VSIZE
      008A66 6B 02            [ 1] 1632 	ld (BASE,sp), a  ; base
      008A68 0F 01            [ 1] 1633 	clr (SIGN,sp)    ; sign
      008A6A A1 0A            [ 1] 1634 	cp a,#10
      008A6C 26 0A            [ 1] 1635 	jrne 1$
                                   1636 	; base 10 string display with negative sign if bit 23==1
      008A6E 72 0F 00 08 05   [ 2] 1637 	btjf acc24,#7,1$
      008A73 03 01            [ 1] 1638 	cpl (SIGN,sp)
      008A75 CD 8A D3         [ 4] 1639 	call neg_acc24
      008A78                       1640 1$:
                                   1641 ; initialize string pointer 
      008A78 AE 17 3F         [ 2] 1642 	ldw x,#pad+PAD_SIZE-1
      008A7B 7F               [ 1] 1643 	clr (x)
      008A7C                       1644 itoa_loop:
      008A7C 7B 02            [ 1] 1645     ld a,(BASE,sp)
      008A7E CD 8A AB         [ 4] 1646     call divu24_8 ; acc24/A 
      008A81 AB 30            [ 1] 1647     add a,#'0  ; remainder of division
      008A83 A1 3A            [ 1] 1648     cp a,#'9+1
      008A85 2B 02            [ 1] 1649     jrmi 2$
      008A87 AB 07            [ 1] 1650     add a,#7 
      008A89 5A               [ 2] 1651 2$: decw x
      008A8A F7               [ 1] 1652     ld (x),a
                                   1653 	; if acc24==0 conversion done
      008A8B C6 00 08         [ 1] 1654 	ld a,acc24
      008A8E CA 00 09         [ 1] 1655 	or a,acc16
      008A91 CA 00 0A         [ 1] 1656 	or a,acc8
      008A94 26 E6            [ 1] 1657     jrne itoa_loop
                                   1658 	;conversion done, next add '$' or '-' as required
      008A96 7B 02            [ 1] 1659 	ld a,(BASE,sp)
      008A98 A1 10            [ 1] 1660 	cp a,#16
      008A9A 27 08            [ 1] 1661 	jreq 8$
      008A9C 7B 01            [ 1] 1662 	ld a,(SIGN,sp)
      008A9E 27 08            [ 1] 1663     jreq 10$
      008AA0 A6 2D            [ 1] 1664     ld a,#'-
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008AA2 20 02            [ 2] 1665 	jra 9$ 
      008AA4 A6 24            [ 1] 1666 8$: ld a,#'$ 
      008AA6 5A               [ 2] 1667 9$: decw x
      008AA7 F7               [ 1] 1668     ld (x),a
      008AA8                       1669 10$:
      008AA8 5B 02            [ 2] 1670 	addw sp,#VSIZE
      008AAA 81               [ 4] 1671 	ret
                                   1672 
                                   1673 ;-------------------------------------
                                   1674 ; divide uint24_t by uint8_t
                                   1675 ; used to convert uint24_t to string
                                   1676 ; input:
                                   1677 ;	acc24	dividend
                                   1678 ;   A 		divisor
                                   1679 ; output:
                                   1680 ;   acc24	quotient
                                   1681 ;   A		remainder
                                   1682 ;------------------------------------- 
                                   1683 ; offset  on sp of arguments and locals
                           000001  1684 	U8   = 1   ; divisor on stack
                           000001  1685 	VSIZE =1
      008AAB                       1686 divu24_8:
      008AAB 89               [ 2] 1687 	pushw x ; save x
      008AAC 88               [ 1] 1688 	push a 
                                   1689 	; ld dividend UU:MM bytes in X
      008AAD C6 00 08         [ 1] 1690 	ld a, acc24
      008AB0 95               [ 1] 1691 	ld xh,a
      008AB1 C6 00 09         [ 1] 1692 	ld a,acc24+1
      008AB4 97               [ 1] 1693 	ld xl,a
      008AB5 7B 01            [ 1] 1694 	ld a,(U8,SP) ; divisor
      008AB7 62               [ 2] 1695 	div x,a ; UU:MM/U8
      008AB8 88               [ 1] 1696 	push a  ;save remainder
      008AB9 9E               [ 1] 1697 	ld a,xh
      008ABA C7 00 08         [ 1] 1698 	ld acc24,a
      008ABD 9F               [ 1] 1699 	ld a,xl
      008ABE C7 00 09         [ 1] 1700 	ld acc24+1,a
      008AC1 84               [ 1] 1701 	pop a
      008AC2 95               [ 1] 1702 	ld xh,a
      008AC3 C6 00 0A         [ 1] 1703 	ld a,acc24+2
      008AC6 97               [ 1] 1704 	ld xl,a
      008AC7 7B 01            [ 1] 1705 	ld a,(U8,sp) ; divisor
      008AC9 62               [ 2] 1706 	div x,a  ; R:LL/U8
      008ACA 6B 01            [ 1] 1707 	ld (U8,sp),a ; save remainder
      008ACC 9F               [ 1] 1708 	ld a,xl
      008ACD C7 00 0A         [ 1] 1709 	ld acc24+2,a
      008AD0 84               [ 1] 1710 	pop a
      008AD1 85               [ 2] 1711 	popw x
      008AD2 81               [ 4] 1712 	ret
                                   1713 
                                   1714 ;------------------------------------
                                   1715 ;  two's complement acc24
                                   1716 ;  input:
                                   1717 ;		acc24 variable
                                   1718 ;  output:
                                   1719 ;		acc24 variable
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1720 ;-------------------------------------
      008AD3                       1721 neg_acc24:
      008AD3 72 53 00 0A      [ 1] 1722 	cpl acc24+2
      008AD7 72 53 00 09      [ 1] 1723 	cpl acc24+1
      008ADB 72 53 00 08      [ 1] 1724 	cpl acc24
      008ADF A6 01            [ 1] 1725 	ld a,#1
      008AE1 CB 00 0A         [ 1] 1726 	add a,acc24+2
      008AE4 C7 00 0A         [ 1] 1727 	ld acc24+2,a
      008AE7 4F               [ 1] 1728 	clr a
      008AE8 C9 00 09         [ 1] 1729 	adc a,acc24+1
      008AEB C7 00 09         [ 1] 1730 	ld acc24+1,a 
      008AEE 4F               [ 1] 1731 	clr a 
      008AEF C9 00 08         [ 1] 1732 	adc a,acc24 
      008AF2 C7 00 08         [ 1] 1733 	ld acc24,a 
      008AF5 81               [ 4] 1734 	ret
                                   1735 
                                   1736 
                                   1737 ;------------------------------------
                                   1738 ; read a line of text from terminal
                                   1739 ; input:
                                   1740 ;	none
                                   1741 ; local variable on stack:
                                   1742 ;	LL  line length
                                   1743 ;   RXCHAR last received chaaracte 
                                   1744 ; output:
                                   1745 ;   text in tib  buffer
                                   1746 ;------------------------------------
                                   1747 	; local variables
                           000001  1748 	LL_HB=1
                           000001  1749 	RXCHAR = 1 ; last char received
                           000002  1750 	LL = 2  ; accepted line length
                           000002  1751 	VSIZE=2 
      008AF6                       1752 readln:
      008AF6 5F               [ 1] 1753 	clrw x 
      008AF7 89               [ 2] 1754 	pushw x 
      008AF8 90 AE 16 C8      [ 2] 1755  	ldw y,#tib ; input buffer
      008AFC                       1756 readln_loop:
      008AFC CD 82 2F         [ 4] 1757 	call getc
      008AFF 6B 01            [ 1] 1758 	ld (RXCHAR,sp),a
      008B01 A1 0D            [ 1] 1759 	cp a,#CR
      008B03 26 03            [ 1] 1760 	jrne 1$
      008B05 CC 8B 71         [ 2] 1761 	jp readln_quit
      008B08 A1 0A            [ 1] 1762 1$:	cp a,#NL
      008B0A 27 65            [ 1] 1763 	jreq readln_quit
      008B0C A1 08            [ 1] 1764 	cp a,#BSP
      008B0E 27 3D            [ 1] 1765 	jreq del_back
      008B10 A1 04            [ 1] 1766 	cp a,#CTRL_D
      008B12 27 2A            [ 1] 1767 	jreq del_ln
      008B14 A1 12            [ 1] 1768 	cp a,#CTRL_R 
      008B16 27 06            [ 1] 1769 	jreq reprint 
                                   1770 ;	cp a,#'[
                                   1771 ;	jreq ansi_seq
      008B18                       1772 final_test:
      008B18 A1 20            [ 1] 1773 	cp a,#SPACE
      008B1A 2A 40            [ 1] 1774 	jrpl accept_char
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008B1C 20 DE            [ 2] 1775 	jra readln_loop
      008B1E                       1776 ansi_seq:
                                   1777 ;	call getc
                                   1778 ;	cp a,#'C 
                                   1779 ;	jreq rigth_arrow
                                   1780 ;	cp a,#'D 
                                   1781 ;	jreq left_arrow 
                                   1782 ;	jra final_test
      008B1E                       1783 right_arrow:
                                   1784 ;	ld a,#BSP 
                                   1785 ;	call putc 
                                   1786 ;	jra realn_loop 
      008B1E                       1787 left_arrow:
                                   1788 
                                   1789 ;	jra readln_loop
      008B1E                       1790 reprint: 
      008B1E 0D 02            [ 1] 1791 	tnz (LL,sp)
      008B20 26 DA            [ 1] 1792 	jrne readln_loop
      008B22 AE 16 C8         [ 2] 1793 	ldw x,#tib 
      008B25 CD 82 FA         [ 4] 1794 	call strlen 
      008B28 90 AE 16 C8      [ 2] 1795 	ldw y,#tib 
      008B2C 9F               [ 1] 1796 	ld a,xl
      008B2D 27 CD            [ 1] 1797 	jreq readln_loop
      008B2F 6B 02            [ 1] 1798 	ld (LL,sp),a 
      008B31 AE 16 C8         [ 2] 1799 	ldw x,#tib 
      008B34 CD 82 38         [ 4] 1800 	call puts
      008B37 0F 01            [ 1] 1801 	clr (LL_HB,sp)
      008B39 72 F9 01         [ 2] 1802 	addw y,(LL_HB,sp)
      008B3C 20 BE            [ 2] 1803 	jra readln_loop 
      008B3E                       1804 del_ln:
      008B3E 7B 02            [ 1] 1805 	ld a,(LL,sp)
      008B40 CD 82 52         [ 4] 1806 	call delete
      008B43 90 AE 16 C8      [ 2] 1807 	ldw y,#tib
      008B47 90 7F            [ 1] 1808 	clr (y)
      008B49 0F 02            [ 1] 1809 	clr (LL,sp)
      008B4B 20 AF            [ 2] 1810 	jra readln_loop
      008B4D                       1811 del_back:
      008B4D 0D 02            [ 1] 1812     tnz (LL,sp)
      008B4F 27 AB            [ 1] 1813     jreq readln_loop
      008B51 0A 02            [ 1] 1814     dec (LL,sp)
      008B53 90 5A            [ 2] 1815     decw y
      008B55 90 7F            [ 1] 1816     clr  (y)
      008B57 CD 82 42         [ 4] 1817     call bksp 
      008B5A 20 A0            [ 2] 1818     jra readln_loop	
      008B5C                       1819 accept_char:
      008B5C A6 4F            [ 1] 1820 	ld a,#TIB_SIZE-1
      008B5E 11 02            [ 1] 1821 	cp a, (LL,sp)
      008B60 27 9A            [ 1] 1822 	jreq readln_loop
      008B62 7B 01            [ 1] 1823 	ld a,(RXCHAR,sp)
      008B64 90 F7            [ 1] 1824 	ld (y),a
      008B66 0C 02            [ 1] 1825 	inc (LL,sp)
      008B68 90 5C            [ 1] 1826 	incw y
      008B6A 90 7F            [ 1] 1827 	clr (y)
      008B6C CD 82 26         [ 4] 1828 	call putc 
      008B6F 20 8B            [ 2] 1829 	jra readln_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B71                       1830 readln_quit:
      008B71 90 7F            [ 1] 1831 	clr (y)
      008B73 7B 02            [ 1] 1832 	ld a,(LL,sp)
      008B75 C7 00 04         [ 1] 1833 	ld count,a 
      000AF8                       1834 	_drop VSIZE 
      008B78 5B 02            [ 2]    1     addw sp,#VSIZE 
      008B7A A6 0D            [ 1] 1835 	ld a,#CR
      008B7C CD 82 26         [ 4] 1836 	call putc
      008B7F 81               [ 4] 1837 	ret
                                   1838 
                           000001  1839 .if DEBUG 	
                                   1840 ;----------------------------
                                   1841 ; command interface
                                   1842 ; only 3 commands:
                                   1843 ;  'q' to resume application
                                   1844 ;  'p [addr]' to print memory values 
                                   1845 ;  's addr' to print string 
                                   1846 ;----------------------------
                                   1847 ;local variable 
                           000001  1848 	PSIZE=1
                           000001  1849 	VSIZE=1 
      008B80                       1850 cmd_itf:
      008B80 52 01            [ 2] 1851 	sub sp,#VSIZE 
      008B82 72 5F 00 11      [ 1] 1852 	clr farptr 
      008B86 72 5F 00 12      [ 1] 1853 	clr farptr+1 
      008B8A 72 5F 00 13      [ 1] 1854 	clr farptr+2  
      008B8E                       1855 repl:
      008B8E A6 0D            [ 1] 1856 	ld a,#CR 
      008B90 CD 82 26         [ 4] 1857 	call putc 
      008B93 A6 3F            [ 1] 1858 	ld a,#'? 
      008B95 CD 82 26         [ 4] 1859 	call putc
      008B98 72 5F 00 01      [ 1] 1860 	clr in.w 
      008B9C 72 5F 00 02      [ 1] 1861 	clr in 
      008BA0 CD 8A F6         [ 4] 1862 	call readln
      008BA3 90 AE 16 C8      [ 2] 1863 	ldw y,#tib  
      008BA7 90 F6            [ 1] 1864 	ld a,(y)
      008BA9 27 E3            [ 1] 1865 	jreq repl  
      008BAB 72 5C 00 02      [ 1] 1866 	inc in 
      008BAF CD 8F 30         [ 4] 1867 	call to_upper 
      008BB2 A1 51            [ 1] 1868 	cp a,#'Q 
      008BB4 26 17            [ 1] 1869 	jrne test_p
      008BB6                       1870 repl_exit:
      008BB6 72 5F 16 C8      [ 1] 1871 	clr tib 
      008BBA 72 5F 00 04      [ 1] 1872 	clr count 
      008BBE 72 5F 00 02      [ 1] 1873 	clr in 
      000B42                       1874 	_drop #VSIZE 	
      008BC2 5B 01            [ 2]    1     addw sp,##VSIZE 
      008BC4 81               [ 4] 1875 	ret  
      008BC5                       1876 invalid:
      008BC5 AE 8C 43         [ 2] 1877 	ldw x,#invalid_cmd 
      008BC8 CD 82 38         [ 4] 1878 	call puts 
      008BCB 20 C1            [ 2] 1879 	jra repl 
      008BCD                       1880 test_p:	
      008BCD A1 50            [ 1] 1881     cp a,#'P 
      008BCF 27 11            [ 1] 1882 	jreq mem_peek
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008BD1 A1 53            [ 1] 1883     cp a,#'S 
      008BD3 26 F0            [ 1] 1884 	jrne invalid 
      008BD5                       1885 print_string:	
      008BD5 CD 8D 6F         [ 4] 1886 	call get_token
      008BD8 A1 04            [ 1] 1887 	cp a,#TK_INTGR 
      008BDA 26 E9            [ 1] 1888 	jrne invalid 
      008BDC CD 82 38         [ 4] 1889 	call puts
      008BDF CC 8B 8E         [ 2] 1890 	jp repl 	
      008BE2                       1891 mem_peek:
      008BE2 A6 20            [ 1] 1892 	ld a,#SPACE 
      008BE4 CD 8F E8         [ 4] 1893 	call skip  	 
      008BE7 72 B9 00 01      [ 2] 1894 	addw y,in.w 
      008BEB AE 17 18         [ 2] 1895 	ldw x,#pad 
      008BEE CD 83 18         [ 4] 1896 	call strcpy
      008BF1 CD 8F 3C         [ 4] 1897 	call atoi24 	
      008BF4 C6 00 08         [ 1] 1898 	ld a, acc24 
      008BF7 CA 00 09         [ 1] 1899 	or a,acc16 
      008BFA CA 00 0A         [ 1] 1900 	or a,acc8 
      008BFD 26 02            [ 1] 1901 	jrne 1$ 
      008BFF 20 0C            [ 2] 1902 	jra peek_byte  
      008C01 CE 00 08         [ 2] 1903 1$:	ldw x,acc24 
      008C04 CF 00 11         [ 2] 1904 	ldw farptr,x 
      008C07 C6 00 0A         [ 1] 1905 	ld a,acc8 
      008C0A C7 00 13         [ 1] 1906 	ld farptr+2,a 
      008C0D                       1907 peek_byte:
      008C0D CD 8C 52         [ 4] 1908 	call print_farptr 
      008C10 A6 08            [ 1] 1909 	ld a,#8 
      008C12 6B 01            [ 1] 1910 	ld (PSIZE,sp),a 
      008C14 5F               [ 1] 1911 	clrw x 
      008C15 CD 8C 6D         [ 4] 1912 1$:	call fetchc  
      008C18 89               [ 2] 1913 	pushw x 
      008C19 C7 00 0A         [ 1] 1914 	ld acc8,a 
      008C1C 5F               [ 1] 1915 	clrw x 
      008C1D CF 00 08         [ 2] 1916 	ldw acc24,x 
      008C20 A6 90            [ 1] 1917 	ld a,#16+128
      008C22 CD 89 C0         [ 4] 1918 	call prti24
      008C25 85               [ 2] 1919 	popw x 
      008C26 0A 01            [ 1] 1920 	dec (PSIZE,sp)
      008C28 26 EB            [ 1] 1921 	jrne 1$ 
      008C2A A6 08            [ 1] 1922 	ld a,#8 
      008C2C CB 00 13         [ 1] 1923 	add a,farptr+2 
      008C2F C7 00 13         [ 1] 1924 	ld farptr+2,a
      008C32 4F               [ 1] 1925 	clr a 
      008C33 C9 00 12         [ 1] 1926 	adc a,farptr+1 
      008C36 C7 00 12         [ 1] 1927 	ld farptr+1,a 
      008C39 4F               [ 1] 1928 	clr a 
      008C3A C9 00 11         [ 1] 1929 	adc a,farptr 
      008C3D C7 00 11         [ 1] 1930 	ld farptr,a 
      008C40 CC 8B 8E         [ 2] 1931 	jp repl  
                                   1932 
      008C43 6E 6F 74 20 61 20 63  1933 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1934 
                                   1935 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1936 ; display farptr address
                                   1937 ;----------------------------
      008C52                       1938 print_farptr:
      008C52 C6 00 13         [ 1] 1939 	ld a ,farptr+2 
      008C55 C7 00 0A         [ 1] 1940 	ld acc8,a 
      008C58 CE 00 11         [ 2] 1941 	ldw x,farptr 
      008C5B CF 00 08         [ 2] 1942 	ldw acc24,x 
      008C5E 5F               [ 1] 1943 	clrw x 
      008C5F A6 10            [ 1] 1944 	ld a,#16 
      008C61 CD 89 C0         [ 4] 1945 	call prti24
      008C64 A6 20            [ 1] 1946 	ld a,#SPACE 
      008C66 CD 82 26         [ 4] 1947 	call putc 
      008C69 CD 82 26         [ 4] 1948 	call putc 
      008C6C 81               [ 4] 1949 	ret
                                   1950 
                                   1951 ;------------------------------------
                                   1952 ; get byte at address farptr[X]
                                   1953 ; input:
                                   1954 ;	 farptr   address to peek
                                   1955 ;    X		  farptr index 	
                                   1956 ; output:
                                   1957 ;	 A 		  byte from memory  
                                   1958 ;    x		  incremented by 1
                                   1959 ;------------------------------------
      008C6D                       1960 fetchc: ; @C
      008C6D 92 AF 00 11      [ 5] 1961 	ldf a,([farptr],x)
      008C71 5C               [ 1] 1962 	incw x
      008C72 81               [ 4] 1963 	ret
                                   1964 
                                   1965 
                                   1966 ;------------------------------------
                                   1967 ; expect a number from command line 
                                   1968 ; next argument
                                   1969 ;  input:
                                   1970 ;	  none
                                   1971 ;  output:
                                   1972 ;    acc24   int24_t 
                                   1973 ;------------------------------------
      008C73                       1974 number::
      008C73 CD 8D 6F         [ 4] 1975 	call get_token
      008C76 CD 8F 3C         [ 4] 1976 	call atoi24
      008C79 81               [ 4] 1977 	ret
                                   1978 .endif ; DEBUG 
                                   1979 
                                   1980 ;------------------------------------
                                   1981 ; parse quoted string 
                                   1982 ; input:
                                   1983 ;   Y 	pointer to tib 
                                   1984 ;   X   pointer to pad
                                   1985 ; output:
                                   1986 ;	pad   parsed string
                                   1987 ;   TOS  char* to pad  
                                   1988 ;------------------------------------
                           000001  1989 	PREV = 1
                           000002  1990 	CURR =2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                           000002  1991 	VSIZE=2 
      008C7A                       1992 parse_quote: ; { -- addr }
      000BFA                       1993 	_vars VSIZE 
      008C7A 52 02            [ 2]    1     sub sp,#VSIZE 
      008C7C 4F               [ 1] 1994 	clr a
      008C7D 6B 01            [ 1] 1995 1$:	ld (PREV,sp),a 
      008C7F 72 5C 00 02      [ 1] 1996 2$:	inc in
      008C83 91 D6 01         [ 4] 1997 	ld a,([in.w],y)
      008C86 27 24            [ 1] 1998 	jreq 6$
      008C88 6B 02            [ 1] 1999 	ld (CURR,sp),a 
      008C8A A6 5C            [ 1] 2000 	ld a,#'\
      008C8C 11 01            [ 1] 2001 	cp a, (PREV,sp)
      008C8E 26 0A            [ 1] 2002 	jrne 3$
      008C90 0F 01            [ 1] 2003 	clr (PREV,sp)
      008C92 7B 02            [ 1] 2004 	ld a,(CURR,sp)
      008C94 AD 1F            [ 4] 2005 	callr convert_escape
      008C96 F7               [ 1] 2006 	ld (x),a 
      008C97 5C               [ 1] 2007 	incw x 
      008C98 20 E5            [ 2] 2008 	jra 2$
      008C9A                       2009 3$:
      008C9A 7B 02            [ 1] 2010 	ld a,(CURR,sp)
      008C9C A1 5C            [ 1] 2011 	cp a,#'\'
      008C9E 27 DD            [ 1] 2012 	jreq 1$
      008CA0 A1 22            [ 1] 2013 	cp a,#'"
      008CA2 27 04            [ 1] 2014 	jreq 5$ 
      008CA4 F7               [ 1] 2015 	ld (x),a 
      008CA5 5C               [ 1] 2016 	incw x 
      008CA6 20 D7            [ 2] 2017 	jra 2$
      008CA8 72 5C 00 02      [ 1] 2018 5$:	inc in 
      008CAC 7F               [ 1] 2019 6$: clr (x)
      008CAD AE 17 18         [ 2] 2020 	ldw x,#pad 
      000C30                       2021 	_drop VSIZE
      008CB0 5B 02            [ 2]    1     addw sp,#VSIZE 
      008CB2 A6 0A            [ 1] 2022 	ld a,#TK_QSTR  
      008CB4 81               [ 4] 2023 	ret 
                                   2024 
                                   2025 ;---------------------------------------
                                   2026 ; called by parse_quote
                                   2027 ; subtitute escaped character 
                                   2028 ; by their ASCII value .
                                   2029 ; input:
                                   2030 ;   A  character following '\'
                                   2031 ; output:
                                   2032 ;   A  substitued char or same if not valid.
                                   2033 ;---------------------------------------
      008CB5                       2034 convert_escape:
      008CB5 89               [ 2] 2035 	pushw x 
      008CB6 AE 8C CA         [ 2] 2036 	ldw x,#escaped 
      008CB9 F1               [ 1] 2037 1$:	cp a,(x)
      008CBA 27 06            [ 1] 2038 	jreq 2$
      008CBC 7D               [ 1] 2039 	tnz (x)
      008CBD 27 09            [ 1] 2040 	jreq 3$
      008CBF 5C               [ 1] 2041 	incw x 
      008CC0 20 F7            [ 2] 2042 	jra 1$
      008CC2 1D 8C CA         [ 2] 2043 2$: subw x,#escaped 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008CC5 9F               [ 1] 2044 	ld a,xl 
      008CC6 AB 07            [ 1] 2045 	add a,#7
      008CC8 85               [ 2] 2046 3$:	popw x 
      008CC9 81               [ 4] 2047 	ret 
                                   2048 
      008CCA 61 62 74 6E 76 66 72  2049 escaped: .asciz "abtnvfr"
             00
                                   2050 
                                   2051 ;-------------------------
                                   2052 ; integer parser 
                                   2053 ; input:
                                   2054 ;   X 		point to pad 
                                   2055 ;   Y 		point to tib 
                                   2056 ;   A 	    first digit|'$' 
                                   2057 ; output:  
                                   2058 ;   pad     number string 
                                   2059 ;   X 		integer 
                                   2060 ;   A 		TK_INTGR
                                   2061 ;-------------------------
                           000001  2062 	BASE=1
                           000002  2063 	TCHAR=2 
                           000002  2064 	VSIZE=2 
      008CD2                       2065 parse_integer: ; { -- n }
      008CD2 4B 00            [ 1] 2066 	push #0 ; TCHAR 
      008CD4 A1 24            [ 1] 2067 	cp a,#'$
      008CD6 27 04            [ 1] 2068 	jreq 1$ 
      008CD8 4B 0A            [ 1] 2069 	push #10 ; BASE=10 
      008CDA 20 02            [ 2] 2070 	jra 2$ 
      008CDC 4B 10            [ 1] 2071 1$: push #16  ; BASE=16
      008CDE F7               [ 1] 2072 2$:	ld (x),a 
      008CDF 5C               [ 1] 2073 	incw x 
      008CE0 72 5C 00 02      [ 1] 2074 	inc in 
      008CE4 91 D6 01         [ 4] 2075 	ld a,([in.w],y)
      008CE7 CD 8F 30         [ 4] 2076 	call to_upper 
      008CEA 6B 02            [ 1] 2077 	ld (TCHAR,sp),a 
      008CEC CD 8F 27         [ 4] 2078 	call is_digit 
      008CEF 25 ED            [ 1] 2079 	jrc 2$
      008CF1 A6 10            [ 1] 2080 	ld a,#16 
      008CF3 11 01            [ 1] 2081 	cp a,(BASE,sp)
      008CF5 26 0A            [ 1] 2082 	jrne 3$ 
      008CF7 7B 02            [ 1] 2083 	ld a,(TCHAR,sp)
      008CF9 A1 41            [ 1] 2084 	cp a,#'A 
      008CFB 2B 04            [ 1] 2085 	jrmi 3$ 
      008CFD A1 47            [ 1] 2086 	cp a,#'G 
      008CFF 2B DD            [ 1] 2087 	jrmi 2$ 
      008D01 7F               [ 1] 2088 3$:	clr (x)
      008D02 CD 8F 3C         [ 4] 2089 	call atoi24
      008D05 CE 00 09         [ 2] 2090 	ldw x,acc16 
      008D08 A6 04            [ 1] 2091 	ld a,#TK_INTGR
      000C8A                       2092 	_drop VSIZE  
      008D0A 5B 02            [ 2]    1     addw sp,#VSIZE 
      008D0C 81               [ 4] 2093 	ret 	
                                   2094 
                                   2095 ;-------------------------
                                   2096 ; binary integer parser 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2097 ; input:
                                   2098 ;   X 		point to pad 
                                   2099 ;   Y 		point to tib 
                                   2100 ;   A 	    '%' 
                                   2101 ; output:  
                                   2102 ;   pad     number string 
                                   2103 ;   X 		integer 
                                   2104 ;   A 		TK_INTGR
                                   2105 ;   TOS     integer 
                                   2106 ;-------------------------
                           000001  2107 	BINARY=1
                           000002  2108 	VSIZE=2
      008D0D                       2109 parse_binary: ; { -- n }
      008D0D 4B 00            [ 1] 2110 	push #0
      008D0F 4B 00            [ 1] 2111 	push #0
      008D11 F7               [ 1] 2112 1$: ld (x),a 
      008D12 5C               [ 1] 2113 	incw x 
      008D13 72 5C 00 02      [ 1] 2114 	inc in 
      008D17 91 D6 01         [ 4] 2115 	ld a,([in.w],y)
      008D1A A1 30            [ 1] 2116 	cp a,#'0 
      008D1C 27 06            [ 1] 2117 	jreq 2$
      008D1E A1 31            [ 1] 2118 	cp a,#'1 
      008D20 27 02            [ 1] 2119 	jreq 2$ 
      008D22 20 09            [ 2] 2120 	jra bin_exit 
      008D24 A0 30            [ 1] 2121 2$: sub a,#'0	
      008D26 46               [ 1] 2122 	rrc a 
      008D27 09 02            [ 1] 2123 	rlc (BINARY+1,sp)
      008D29 09 01            [ 1] 2124 	rlc (BINARY,sp)
      008D2B 20 E4            [ 2] 2125 	jra 1$  
      008D2D                       2126 bin_exit:
      008D2D 7F               [ 1] 2127 	clr (x)
      008D2E 1E 01            [ 2] 2128 	ldw x,(BINARY,sp)
      008D30 A6 04            [ 1] 2129 	ld a,#TK_INTGR 	
      000CB2                       2130 	_drop VSIZE 
      008D32 5B 02            [ 2]    1     addw sp,#VSIZE 
      008D34 81               [ 4] 2131 	ret
                                   2132 
                                   2133 ;---------------------------
                                   2134 ;  token begin with a letter,
                                   2135 ;  is keyword or variable. 	
                                   2136 ; input:
                                   2137 ;   X 		point to pad 
                                   2138 ;   Y 		point to text
                                   2139 ;   A 	    first letter  
                                   2140 ; output:
                                   2141 ;   X		exec_addr|var_addr 
                                   2142 ;   A 		TK_CMD 
                                   2143 ;   pad 	keyword|var_name  
                                   2144 ;   TOS     exec_addr|var_addr 
                                   2145 ;--------------------------  
      008D35                       2146 parse_keyword: ; { -- exec_addr|var_addr}
      008D35 CD 8F 30         [ 4] 2147 	call to_upper 
      008D38 F7               [ 1] 2148 	ld (x),a 
      008D39 5C               [ 1] 2149 	incw x 
      008D3A 72 5C 00 02      [ 1] 2150 	inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008D3E 91 D6 01         [ 4] 2151 	ld a,([in.w],y)
      008D41 CD 85 7D         [ 4] 2152 	call is_alpha 
      008D44 25 EF            [ 1] 2153 	jrc parse_keyword 
      008D46 7F               [ 1] 2154 1$: clr (x)
      008D47 72 5D 17 19      [ 1] 2155 	tnz pad+1 
      008D4B 26 15            [ 1] 2156 	jrne 2$
                                   2157 ; one letter variable name 
      008D4D C6 17 18         [ 1] 2158 	ld a,pad 
      008D50 A0 41            [ 1] 2159 	sub a,#'A 
      008D52 48               [ 1] 2160 	sll a 
      008D53 88               [ 1] 2161 	push a 
      008D54 4B 00            [ 1] 2162 	push #0
      008D56 AE 00 22         [ 2] 2163 	ldw x,#vars 
      008D59 72 FB 01         [ 2] 2164 	addw x,(1,sp) ; X=var address 
      000CDC                       2165 	_drop 2 
      008D5C 5B 02            [ 2]    1     addw sp,#2 
      008D5E A6 05            [ 1] 2166 	ld a,#TK_VAR 
      008D60 20 0C            [ 2] 2167 	jra 4$ 
      008D62                       2168 2$: ; check for keyword, otherwise syntax error.
      000CE2                       2169 	_ldx_dict kword_dict
      008D62 AE A2 5A         [ 2]    1     ldw x,#kword_dict+2
      008D65 CD 91 CC         [ 4] 2170 	call search_dict
      008D68 4D               [ 1] 2171 	tnz a
      008D69 26 03            [ 1] 2172 	jrne 4$ 
      008D6B CC 87 8F         [ 2] 2173 	jp syntax_error
      008D6E 81               [ 4] 2174 4$:	ret  	
                                   2175 
                                   2176 
                                   2177 ;------------------------------------
                                   2178 ; Command line tokenizer
                                   2179 ; scan text for next token
                                   2180 ; move token in 'pad'
                                   2181 ; input: 
      008D6F                       2182 	none: 
                                   2183 ; use:
                                   2184 ;	Y   pointer to text
                                   2185 ;   X	pointer to pad 
                                   2186 ;   in.w   index in text buffer
                                   2187 ; output:
                                   2188 ;   A       token attribute 
                                   2189 ;   pad 	token as .asciz
                                   2190 ;   X 		token value   
                                   2191 ;------------------------------------
                                   2192 	; use to check special character 
                                   2193 	.macro _case c t  
                                   2194 	ld a,#c 
                                   2195 	cp a,(TCHAR,sp) 
                                   2196 	jrne t
                                   2197 	.endm 
                                   2198 
                           000001  2199 	TCHAR=1
                           000002  2200 	ATTRIB=2 
                           000002  2201 	VSIZE=2
      008D6F                       2202 get_token: 
      008D6F 90 AE 16 C8      [ 2] 2203 	ldw y,#tib    	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008D73 C6 00 02         [ 1] 2204 	ld a,in 
      008D76 C1 00 04         [ 1] 2205 	cp a,count 
      008D79 2B 03            [ 1] 2206 	jrmi 1$
      008D7B A6 00            [ 1] 2207 	ld a,#TK_NONE 
      008D7D 81               [ 4] 2208 	ret 
      008D7E                       2209 1$:	
      000CFE                       2210 	_vars VSIZE
      008D7E 52 02            [ 2]    1     sub sp,#VSIZE 
      008D80 AE 17 18         [ 2] 2211 	ldw x, #pad
      008D83 A6 20            [ 1] 2212 	ld a,#SPACE
      008D85 CD 8F E8         [ 4] 2213 	call skip
      008D88 55 00 02 00 03   [ 1] 2214 	mov in.saved,in 
      008D8D 91 D6 01         [ 4] 2215 	ld a,([in.w],y)
      008D90 26 07            [ 1] 2216 	jrne str_tst
      008D92 72 5F 17 18      [ 1] 2217 	clr pad 
      008D96 CC 8F 24         [ 2] 2218 	jp token_exit ; end of line 
                                   2219 
      008D99                       2220 str_tst: ; check for quoted string  	
      008D99 CD 8F 30         [ 4] 2221 	call to_upper 
      008D9C 6B 01            [ 1] 2222 	ld (TCHAR,sp),a 
      000D1E                       2223 	_case '"' nbr_tst
      008D9E A6 22            [ 1]    1 	ld a,#'"' 
      008DA0 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA2 26 06            [ 1]    3 	jrne nbr_tst
      008DA4 CD 8C 7A         [ 4] 2224 	call parse_quote
      008DA7 CC 8F 24         [ 2] 2225 	jp token_exit
      008DAA                       2226 nbr_tst: ; check for number 
      008DAA A6 24            [ 1] 2227 	ld a,#'$'
      008DAC 11 01            [ 1] 2228 	cp a,(TCHAR,sp) 
      008DAE 27 13            [ 1] 2229 	jreq 1$
      008DB0 A6 26            [ 1] 2230 	ld a,#'&
      008DB2 11 01            [ 1] 2231 	cp a,(TCHAR,sp)
      008DB4 26 06            [ 1] 2232 	jrne 0$
      008DB6 CD 8D 0D         [ 4] 2233 	call parse_binary ; expect binary integer 
      008DB9 CC 8F 24         [ 2] 2234 	jp token_exit 
      008DBC 7B 01            [ 1] 2235 0$:	ld a,(TCHAR,sp)
      008DBE CD 8F 27         [ 4] 2236 	call is_digit
      008DC1 24 06            [ 1] 2237 	jrnc 3$
      008DC3 CD 8C D2         [ 4] 2238 1$:	call parse_integer 
      008DC6 CC 8F 24         [ 2] 2239 	jp token_exit 
      008DC9                       2240 3$: 
      000D49                       2241 	_case '(' bkslsh_tst 
      008DC9 A6 28            [ 1]    1 	ld a,#'(' 
      008DCB 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DCD 26 05            [ 1]    3 	jrne bkslsh_tst
      008DCF A6 0B            [ 1] 2242 	ld a,#TK_LPAREN
      008DD1 CC 8F 14         [ 2] 2243 	jp token_char   	
      008DD4                       2244 bkslsh_tst:
      000D54                       2245 	_case '\',rparnt_tst
      008DD4 A6 5C            [ 1]    1 	ld a,#'\' 
      008DD6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD8 26 18            [ 1]    3 	jrne rparnt_tst
      008DDA 7B 01            [ 1] 2246 	ld a,(TCHAR,sp)
      008DDC F7               [ 1] 2247 	ld (x),a 
      008DDD 5C               [ 1] 2248 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008DDE 72 5C 00 02      [ 1] 2249 	inc in 
      008DE2 91 D6 01         [ 4] 2250 	ld a,([in.w],y)
      008DE5 F7               [ 1] 2251 	ld (x),a 
      008DE6 5C               [ 1] 2252 	incw x 
      008DE7 72 5C 00 02      [ 1] 2253 	inc in  
      008DEB 7F               [ 1] 2254 	clr (x) 
      008DEC 97               [ 1] 2255 	ld xl,a 
      008DED A6 03            [ 1] 2256 	ld a,#TK_CHAR 
      008DEF CC 8F 24         [ 2] 2257 	jp token_exit 
      008DF2                       2258 rparnt_tst:		
      000D72                       2259 	_case ')' colon_tst 
      008DF2 A6 29            [ 1]    1 	ld a,#')' 
      008DF4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF6 26 05            [ 1]    3 	jrne colon_tst
      008DF8 A6 0C            [ 1] 2260 	ld a,#TK_RPAREN 
      008DFA CC 8F 14         [ 2] 2261 	jp token_char 
      008DFD                       2262 colon_tst:
      000D7D                       2263 	_case ':' comma_tst 
      008DFD A6 3A            [ 1]    1 	ld a,#':' 
      008DFF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E01 26 05            [ 1]    3 	jrne comma_tst
      008E03 A6 01            [ 1] 2264 	ld a,#TK_COLON 
      008E05 CC 8F 14         [ 2] 2265 	jp token_char 
      008E08                       2266 comma_tst:
      000D88                       2267 	_case COMMA sharp_tst 
      008E08 A6 2C            [ 1]    1 	ld a,#COMMA 
      008E0A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E0C 26 05            [ 1]    3 	jrne sharp_tst
      008E0E A6 0D            [ 1] 2268 	ld a,#TK_COMMA
      008E10 CC 8F 14         [ 2] 2269 	jp token_char
      008E13                       2270 sharp_tst:
      000D93                       2271 	_case SHARP dash_tst 
      008E13 A6 23            [ 1]    1 	ld a,#SHARP 
      008E15 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E17 26 05            [ 1]    3 	jrne dash_tst
      008E19 A6 0E            [ 1] 2272 	ld a,#TK_SHARP
      008E1B CC 8F 14         [ 2] 2273 	jp token_char  	 	 
      008E1E                       2274 dash_tst: 	
      000D9E                       2275 	_case '-' at_tst 
      008E1E A6 2D            [ 1]    1 	ld a,#'-' 
      008E20 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E22 26 05            [ 1]    3 	jrne at_tst
      008E24 A6 11            [ 1] 2276 	ld a,#TK_MINUS  
      008E26 CC 8F 14         [ 2] 2277 	jp token_char 
      008E29                       2278 at_tst:
      000DA9                       2279 	_case '@' qmark_tst 
      008E29 A6 40            [ 1]    1 	ld a,#'@' 
      008E2B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E2D 26 05            [ 1]    3 	jrne qmark_tst
      008E2F A6 02            [ 1] 2280 	ld a,#TK_ARRAY 
      008E31 CC 8F 14         [ 2] 2281 	jp token_char
      008E34                       2282 qmark_tst:
      000DB4                       2283 	_case '?' tick_tst 
      008E34 A6 3F            [ 1]    1 	ld a,#'?' 
      008E36 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008E38 26 11            [ 1]    3 	jrne tick_tst
      008E3A 7B 01            [ 1] 2284 	ld a,(TCHAR,sp)
      008E3C F7               [ 1] 2285 	ld (x),a 
      008E3D 5C               [ 1] 2286 	incw x 
      008E3E 7F               [ 1] 2287 	clr (x)
      008E3F 72 5C 00 02      [ 1] 2288 	inc in 
      008E43 A6 06            [ 1] 2289 	ld a,#TK_CMD 
      008E45 AE 96 7D         [ 2] 2290 	ldw x,#print 
      008E48 CC 8F 24         [ 2] 2291 	jp token_exit
      008E4B                       2292 tick_tst: ; ignore comment 
      000DCB                       2293 	_case TICK plus_tst 
      008E4B A6 27            [ 1]    1 	ld a,#TICK 
      008E4D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E4F 26 0C            [ 1]    3 	jrne plus_tst
      008E51 72 5C 00 02      [ 1] 2294 	inc in 
      008E55 A6 06            [ 1] 2295 	ld a,#TK_CMD 
      008E57 AE 97 82         [ 2] 2296 	ldw x,#rem 
      008E5A CC 8F 24         [ 2] 2297 	jp token_exit 
      008E5D                       2298 plus_tst:
      000DDD                       2299 	_case '+' star_tst 
      008E5D A6 2B            [ 1]    1 	ld a,#'+' 
      008E5F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E61 26 05            [ 1]    3 	jrne star_tst
      008E63 A6 10            [ 1] 2300 	ld a,#TK_PLUS  
      008E65 CC 8F 14         [ 2] 2301 	jp token_char 
      008E68                       2302 star_tst:
      000DE8                       2303 	_case '*' slash_tst 
      008E68 A6 2A            [ 1]    1 	ld a,#'*' 
      008E6A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E6C 26 05            [ 1]    3 	jrne slash_tst
      008E6E A6 20            [ 1] 2304 	ld a,#TK_MULT 
      008E70 CC 8F 14         [ 2] 2305 	jp token_char 
      008E73                       2306 slash_tst: 
      000DF3                       2307 	_case '/' prcnt_tst 
      008E73 A6 2F            [ 1]    1 	ld a,#'/' 
      008E75 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E77 26 05            [ 1]    3 	jrne prcnt_tst
      008E79 A6 21            [ 1] 2308 	ld a,#TK_DIV 
      008E7B CC 8F 14         [ 2] 2309 	jp token_char 
      008E7E                       2310 prcnt_tst:
      000DFE                       2311 	_case '%' eql_tst 
      008E7E A6 25            [ 1]    1 	ld a,#'%' 
      008E80 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E82 26 05            [ 1]    3 	jrne eql_tst
      008E84 A6 22            [ 1] 2312 	ld a,#TK_MOD
      008E86 CC 8F 14         [ 2] 2313 	jp token_char  
                                   2314 ; 1 or 2 character tokens 	
      008E89                       2315 eql_tst:
      000E09                       2316 	_case '=' gt_tst 		
      008E89 A6 3D            [ 1]    1 	ld a,#'=' 
      008E8B 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E8D 26 05            [ 1]    3 	jrne gt_tst
      008E8F A6 32            [ 1] 2317 	ld a,#TK_EQUAL
      008E91 CC 8F 14         [ 2] 2318 	jp token_char 
      008E94                       2319 gt_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      000E14                       2320 	_case '>' lt_tst 
      008E94 A6 3E            [ 1]    1 	ld a,#'>' 
      008E96 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E98 26 33            [ 1]    3 	jrne lt_tst
      008E9A A6 31            [ 1] 2321 	ld a,#TK_GT 
      008E9C 6B 02            [ 1] 2322 	ld (ATTRIB,sp),a 
      008E9E 72 5C 00 02      [ 1] 2323 	inc in 
      008EA2 91 D6 01         [ 4] 2324 	ld a,([in.w],y)
      008EA5 A1 3D            [ 1] 2325 	cp a,#'=
      008EA7 26 0C            [ 1] 2326 	jrne 1$
      008EA9 7B 01            [ 1] 2327 	ld a,(TCHAR,sp)
      008EAB F7               [ 1] 2328 	ld (x),a
      008EAC 5C               [ 1] 2329 	incw x 
      008EAD A6 3D            [ 1] 2330 	ld a,#'=
      008EAF 6B 01            [ 1] 2331 	ld (TCHAR,sp),a 
      008EB1 A6 33            [ 1] 2332 	ld a,#TK_GE 
      008EB3 20 5F            [ 2] 2333 	jra token_char  
      008EB5 A1 3C            [ 1] 2334 1$: cp a,#'<
      008EB7 26 0C            [ 1] 2335 	jrne 2$
      008EB9 7B 01            [ 1] 2336 	ld a,(TCHAR,sp)
      008EBB F7               [ 1] 2337 	ld (x),a
      008EBC 5C               [ 1] 2338 	incw x 
      008EBD A6 3C            [ 1] 2339 	ld a,#'<	
      008EBF 6B 01            [ 1] 2340 	ld (TCHAR,sp),a 
      008EC1 A6 35            [ 1] 2341 	ld a,#TK_NE 
      008EC3 20 4F            [ 2] 2342 	jra token_char 
      008EC5 72 5A 00 02      [ 1] 2343 2$: dec in
      008EC9 7B 02            [ 1] 2344 	ld a,(ATTRIB,sp)
      008ECB 20 47            [ 2] 2345 	jra token_char 
      008ECD                       2346 lt_tst:
      000E4D                       2347 	_case '<' other
      008ECD A6 3C            [ 1]    1 	ld a,#'<' 
      008ECF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008ED1 26 32            [ 1]    3 	jrne other
      008ED3 A6 34            [ 1] 2348 	ld a,#TK_LT 
      008ED5 6B 02            [ 1] 2349 	ld (ATTRIB,sp),a 
      008ED7 72 5C 00 02      [ 1] 2350 	inc in 
      008EDB 91 D6 01         [ 4] 2351 	ld a,([in.w],y)
      008EDE A1 3D            [ 1] 2352 	cp a,#'=
      008EE0 26 0B            [ 1] 2353 	jrne 1$
      008EE2 7B 01            [ 1] 2354 	ld a,(TCHAR,sp)
      008EE4 F7               [ 1] 2355 	ld (x),a 
      008EE5 A6 3D            [ 1] 2356 	ld a,#'=
      008EE7 6B 01            [ 1] 2357 	ld (TCHAR,sp),a 
      008EE9 A6 36            [ 1] 2358 	ld a,#TK_LE 
      008EEB 20 27            [ 2] 2359 	jra token_char 
      008EED A1 3E            [ 1] 2360 1$: cp a,#'>
      008EEF 26 0C            [ 1] 2361 	jrne 2$
      008EF1 7B 01            [ 1] 2362 	ld a,(TCHAR,sp)
      008EF3 F7               [ 1] 2363 	ld (x),a 
      008EF4 5C               [ 1] 2364 	incw x 
      008EF5 A6 3E            [ 1] 2365 	ld a,#'>
      008EF7 6B 01            [ 1] 2366 	ld (TCHAR,sp),a 
      008EF9 A6 35            [ 1] 2367 	ld a,#TK_NE 
      008EFB 20 17            [ 2] 2368 	jra token_char 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008EFD 72 5A 00 02      [ 1] 2369 2$: dec in 
      008F01 7B 02            [ 1] 2370 	ld a,(ATTRIB,sp)
      008F03 20 0F            [ 2] 2371 	jra token_char 	
      008F05                       2372 other: ; not a special character 	 
      008F05 7B 01            [ 1] 2373 	ld a,(TCHAR,sp)
      008F07 CD 85 7D         [ 4] 2374 	call is_alpha 
      008F0A 25 03            [ 1] 2375 	jrc 30$ 
      008F0C CC 87 8F         [ 2] 2376 	jp syntax_error 
      008F0F                       2377 30$: 
      008F0F CD 8D 35         [ 4] 2378 	call parse_keyword
      008F12 20 10            [ 2] 2379 	jra token_exit 
      008F14                       2380 token_char:
      008F14 6B 02            [ 1] 2381 	ld (ATTRIB,sp),a 
      008F16 7B 01            [ 1] 2382 	ld a,(TCHAR,sp)
      008F18 F7               [ 1] 2383 	ld (x),a 
      008F19 5C               [ 1] 2384 	incw x 
      008F1A 7F               [ 1] 2385 	clr(x)
      008F1B 72 5C 00 02      [ 1] 2386 	inc in 
      008F1F 7B 02            [ 1] 2387 	ld a,(ATTRIB,sp)
      008F21 AE 17 18         [ 2] 2388 	ldw x,#pad 
      008F24                       2389 token_exit:
      000EA4                       2390 	_drop VSIZE 
      008F24 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F26 81               [ 4] 2391 	ret
                                   2392 
                                   2393 
                                   2394 
                                   2395 ;------------------------------------
                                   2396 ; check if character in {'0'..'9'}
                                   2397 ; input:
                                   2398 ;    A  character to test
                                   2399 ; output:
                                   2400 ;    Carry  0 not digit | 1 digit
                                   2401 ;------------------------------------
      008F27                       2402 is_digit:
      008F27 A1 30            [ 1] 2403 	cp a,#'0
      008F29 25 03            [ 1] 2404 	jrc 1$
      008F2B A1 3A            [ 1] 2405     cp a,#'9+1
      008F2D 8C               [ 1] 2406 	ccf 
      008F2E 8C               [ 1] 2407 1$:	ccf 
      008F2F 81               [ 4] 2408     ret
                                   2409 
                                   2410 ;------------------------------------
                                   2411 ; convert alpha to uppercase
                                   2412 ; input:
                                   2413 ;    a  character to convert
                                   2414 ; output:
                                   2415 ;    a  uppercase character
                                   2416 ;------------------------------------
      008F30                       2417 to_upper::
      008F30 A1 61            [ 1] 2418 	cp a,#'a
      008F32 2A 01            [ 1] 2419 	jrpl 1$
      008F34 81               [ 4] 2420 0$:	ret
      008F35 A1 7A            [ 1] 2421 1$: cp a,#'z	
      008F37 22 FB            [ 1] 2422 	jrugt 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008F39 A0 20            [ 1] 2423 	sub a,#32
      008F3B 81               [ 4] 2424 	ret
                                   2425 	
                                   2426 ;------------------------------------
                                   2427 ; convert pad content in integer
                                   2428 ; input:
                                   2429 ;    pad		.asciz to convert
                                   2430 ; output:
                                   2431 ;    acc24      int24_t
                                   2432 ;------------------------------------
                                   2433 	; local variables
                           000001  2434 	SIGN=1 ; 1 byte, 
                           000002  2435 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2436 	TEMP=3 ; 1 byte, temporary storage
                           000003  2437 	VSIZE=3 ; 3 bytes reserved for local storage
      008F3C                       2438 atoi24:
      008F3C 89               [ 2] 2439 	pushw x ;save x
      008F3D 52 03            [ 2] 2440 	sub sp,#VSIZE
                                   2441 	; acc24=0 
      008F3F 72 5F 00 08      [ 1] 2442 	clr acc24    
      008F43 72 5F 00 09      [ 1] 2443 	clr acc16
      008F47 72 5F 00 0A      [ 1] 2444 	clr acc8 
      008F4B C6 17 18         [ 1] 2445 	ld a, pad 
      008F4E 27 5A            [ 1] 2446 	jreq atoi_exit
      008F50 0F 01            [ 1] 2447 	clr (SIGN,sp)
      008F52 A6 0A            [ 1] 2448 	ld a,#10
      008F54 6B 02            [ 1] 2449 	ld (BASE,sp),a ; default base decimal
      008F56 AE 17 18         [ 2] 2450 	ldw x,#pad ; pointer to string to convert
      008F59 F6               [ 1] 2451 	ld a,(x)
      008F5A 27 47            [ 1] 2452 	jreq 9$  ; completed if 0
      008F5C A1 2D            [ 1] 2453 	cp a,#'-
      008F5E 26 04            [ 1] 2454 	jrne 1$
      008F60 03 01            [ 1] 2455 	cpl (SIGN,sp)
      008F62 20 08            [ 2] 2456 	jra 2$
      008F64 A1 24            [ 1] 2457 1$: cp a,#'$
      008F66 26 06            [ 1] 2458 	jrne 3$
      008F68 A6 10            [ 1] 2459 	ld a,#16
      008F6A 6B 02            [ 1] 2460 	ld (BASE,sp),a
      008F6C 5C               [ 1] 2461 2$:	incw x
      008F6D F6               [ 1] 2462 	ld a,(x)
      008F6E                       2463 3$:	
      008F6E A1 61            [ 1] 2464 	cp a,#'a
      008F70 2B 02            [ 1] 2465 	jrmi 4$
      008F72 A0 20            [ 1] 2466 	sub a,#32
      008F74 A1 30            [ 1] 2467 4$:	cp a,#'0
      008F76 2B 2B            [ 1] 2468 	jrmi 9$
      008F78 A0 30            [ 1] 2469 	sub a,#'0
      008F7A A1 0A            [ 1] 2470 	cp a,#10
      008F7C 2B 06            [ 1] 2471 	jrmi 5$
      008F7E A0 07            [ 1] 2472 	sub a,#7
      008F80 11 02            [ 1] 2473 	cp a,(BASE,sp)
      008F82 2A 1F            [ 1] 2474 	jrpl 9$
      008F84 6B 03            [ 1] 2475 5$:	ld (TEMP,sp),a
      008F86 7B 02            [ 1] 2476 	ld a,(BASE,sp)
      008F88 CD 8F AE         [ 4] 2477 	call mulu24_8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008F8B 7B 03            [ 1] 2478 	ld a,(TEMP,sp)
      008F8D CB 00 0A         [ 1] 2479 	add a,acc24+2
      008F90 C7 00 0A         [ 1] 2480 	ld acc24+2,a
      008F93 4F               [ 1] 2481 	clr a
      008F94 C9 00 09         [ 1] 2482 	adc a,acc24+1
      008F97 C7 00 09         [ 1] 2483 	ld acc24+1,a
      008F9A 4F               [ 1] 2484 	clr a
      008F9B C9 00 08         [ 1] 2485 	adc a,acc24
      008F9E C7 00 08         [ 1] 2486 	ld acc24,a
      008FA1 20 C9            [ 2] 2487 	jra 2$
      008FA3 0D 01            [ 1] 2488 9$:	tnz (SIGN,sp)
      008FA5 27 03            [ 1] 2489     jreq atoi_exit
      008FA7 CD 8A D3         [ 4] 2490     call neg_acc24
      008FAA                       2491 atoi_exit: 
      008FAA 5B 03            [ 2] 2492 	addw sp,#VSIZE
      008FAC 85               [ 2] 2493 	popw x ; restore x
      008FAD 81               [ 4] 2494 	ret
                                   2495 
                                   2496 ;--------------------------------------
                                   2497 ; unsigned multiply uint24_t by uint8_t
                                   2498 ; use to convert numerical string to uint24_t
                                   2499 ; input:
                                   2500 ;	acc24	uint24_t 
                                   2501 ;   A		uint8_t
                                   2502 ; output:
                                   2503 ;   acc24   A*acc24
                                   2504 ;-------------------------------------
                                   2505 ; local variables offset  on sp
                           000003  2506 	U8   = 3   ; A pushed on stack
                           000002  2507 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2508 	OVFH = 1  ; multiplication overflow high byte
                           000003  2509 	VSIZE = 3
      008FAE                       2510 mulu24_8:
      008FAE 89               [ 2] 2511 	pushw x    ; save X
                                   2512 	; local variables
      008FAF 88               [ 1] 2513 	push a     ; U8
      008FB0 5F               [ 1] 2514 	clrw x     ; initialize overflow to 0
      008FB1 89               [ 2] 2515 	pushw x    ; multiplication overflow
                                   2516 ; multiply low byte.
      008FB2 C6 00 0A         [ 1] 2517 	ld a,acc24+2
      008FB5 97               [ 1] 2518 	ld xl,a
      008FB6 7B 03            [ 1] 2519 	ld a,(U8,sp)
      008FB8 42               [ 4] 2520 	mul x,a
      008FB9 9F               [ 1] 2521 	ld a,xl
      008FBA C7 00 0A         [ 1] 2522 	ld acc24+2,a
      008FBD 9E               [ 1] 2523 	ld a, xh
      008FBE 6B 02            [ 1] 2524 	ld (OVFL,sp),a
                                   2525 ; multipy middle byte
      008FC0 C6 00 09         [ 1] 2526 	ld a,acc24+1
      008FC3 97               [ 1] 2527 	ld xl,a
      008FC4 7B 03            [ 1] 2528 	ld a, (U8,sp)
      008FC6 42               [ 4] 2529 	mul x,a
                                   2530 ; add overflow to this partial product
      008FC7 72 FB 01         [ 2] 2531 	addw x,(OVFH,sp)
      008FCA 9F               [ 1] 2532 	ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008FCB C7 00 09         [ 1] 2533 	ld acc24+1,a
      008FCE 4F               [ 1] 2534 	clr a
      008FCF A9 00            [ 1] 2535 	adc a,#0
      008FD1 6B 01            [ 1] 2536 	ld (OVFH,sp),a
      008FD3 9E               [ 1] 2537 	ld a,xh
      008FD4 6B 02            [ 1] 2538 	ld (OVFL,sp),a
                                   2539 ; multiply most signficant byte	
      008FD6 C6 00 08         [ 1] 2540 	ld a, acc24
      008FD9 97               [ 1] 2541 	ld xl, a
      008FDA 7B 03            [ 1] 2542 	ld a, (U8,sp)
      008FDC 42               [ 4] 2543 	mul x,a
      008FDD 72 FB 01         [ 2] 2544 	addw x, (OVFH,sp)
      008FE0 9F               [ 1] 2545 	ld a, xl
      008FE1 C7 00 08         [ 1] 2546 	ld acc24,a
      008FE4 5B 03            [ 2] 2547     addw sp,#VSIZE
      008FE6 85               [ 2] 2548 	popw x
      008FE7 81               [ 4] 2549 	ret
                                   2550 
                                   2551 ;------------------------------------
                                   2552 ; skip character c in text starting from 'in'
                                   2553 ; input:
                                   2554 ;	 y 		point to text buffer
                                   2555 ;    a 		character to skip
                                   2556 ; output:  
                                   2557 ;	'in' ajusted to new position
                                   2558 ;------------------------------------
                           000001  2559 	C = 1 ; local var
      008FE8                       2560 skip:
      008FE8 88               [ 1] 2561 	push a
      008FE9 91 D6 01         [ 4] 2562 1$:	ld a,([in.w],y)
      008FEC 27 0A            [ 1] 2563 	jreq 2$
      008FEE 11 01            [ 1] 2564 	cp a,(C,sp)
      008FF0 26 06            [ 1] 2565 	jrne 2$
      008FF2 72 5C 00 02      [ 1] 2566 	inc in
      008FF6 20 F1            [ 2] 2567 	jra 1$
      000F78                       2568 2$: _drop 1 
      008FF8 5B 01            [ 2]    1     addw sp,#1 
      008FFA 81               [ 4] 2569 	ret
                                   2570 	
                                   2571 ;------------------------------
                                   2572 ; restore 'in.w' variable to 
                                   2573 ; its value before last call
                                   2574 ; to get_token.
                                   2575 ;------------------------------
      008FFB                       2576 unget_token:
      008FFB 55 00 03 00 02   [ 1] 2577 	mov in,in.saved
      009000 81               [ 4] 2578 	ret 
                                   2579 
                                   2580 
                                   2581 ;******************************
                                   2582 ;  data stack manipulation
                                   2583 ;*****************************
                                   2584 ;----------------------	
                                   2585 ; push X on data stack 
                                   2586 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2587 ;	X 
                                   2588 ; output:
                                   2589 ;	none 
                                   2590 ;----------------------	
      009001                       2591 dpush:
      000F81                       2592     _dp_down
      009001 72 5A 00 18      [ 1]    1     dec dstkptr+1 
      009005 72 5A 00 18      [ 1]    2     dec dstkptr+1
      009009 72 CF 00 17      [ 5] 2593     ldw [dstkptr],x  
      00900D 81               [ 4] 2594 	ret 
                                   2595 
                                   2596 
                                   2597 ;----------------------	
                                   2598 ; pop data stack in X 
                                   2599 ; input:
                                   2600 ;	none
                                   2601 ; output:
                                   2602 ;	X   
                                   2603 ;----------------------	
      00900E                       2604 dpop: 
      00900E 72 CE 00 17      [ 5] 2605     ldw x, [dstkptr]
      000F92                       2606 	_dp_up
      009012 72 5C 00 18      [ 1]    1     inc dstkptr+1
      009016 72 5C 00 18      [ 1]    2     inc dstkptr+1
      00901A 81               [ 4] 2607 	ret 
                                   2608 
                                   2609 ;-----------------------------
                                   2610 ; swap top 2 elements of dstack
                                   2611 ;  {n1 n2 -- n2 n1 }
                                   2612 ;-----------------------------
      00901B                       2613 dswap:
      00901B 72 CE 00 17      [ 5] 2614 	ldw x,[dstkptr]
      00901F 89               [ 2] 2615 	pushw x 
      009020 AE 00 02         [ 2] 2616 	ldw x,#2 
      009023 72 DE 00 17      [ 5] 2617 	ldw x,([dstkptr],x) 
      009027 72 CF 00 17      [ 5] 2618 	ldw [dstkptr],x 
      00902B AE 00 02         [ 2] 2619 	ldw x,#2
      00902E 90 85            [ 2] 2620 	popw y 
      009030 72 DF 00 17      [ 5] 2621 	ldw ([dstkptr],x),y 
      009034 81               [ 4] 2622 	ret
                                   2623 
                                   2624 ;-----------------------------
                                   2625 ; drop TOS 
                                   2626 ;-----------------------------
      009035                       2627 ddrop: ; { n -- }
      000FB5                       2628 	_dp_up 
      009035 72 5C 00 18      [ 1]    1     inc dstkptr+1
      009039 72 5C 00 18      [ 1]    2     inc dstkptr+1
      00903D 81               [ 4] 2629 	ret
                                   2630 	
                                   2631 ;-----------------------------
                                   2632 ; duplicate TOS 
                                   2633 ;  dstack: { ix...n -- ix...n n }
                                   2634 ;-----------------------------
      00903E                       2635 ddup:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      00903E 72 CE 00 17      [ 5] 2636 	ldw x,[dstkptr]
      000FC2                       2637 	_dp_down
      009042 72 5A 00 18      [ 1]    1     dec dstkptr+1 
      009046 72 5A 00 18      [ 1]    2     dec dstkptr+1
      00904A 72 CF 00 17      [ 5] 2638     ldw [dstkptr],x  
      00904E 81               [ 4] 2639 	ret 
                                   2640 
                                   2641 
                                   2642 ;----------------------------------
                                   2643 ; pick value n from dstack 
                                   2644 ; put it on TOS
                                   2645 ; dstack: {ix,..,p -- ix,...,np }
                                   2646 ;-----------------------------------
      00904F                       2647 dpick:
      00904F 72 CE 00 17      [ 5] 2648 	ldw x,[dstkptr]
      009053 58               [ 2] 2649 	sllw x 
      009054 72 BB 00 17      [ 2] 2650 	addw x,dstkptr 
      009058 FE               [ 2] 2651 	ldw x,(x)
      009059 72 CF 00 17      [ 5] 2652 	ldw [dstkptr],x 
      00905D 81               [ 4] 2653 	ret
                                   2654 
                                   2655 ;---------------------------
                                   2656 ;  fetch variable in X 
                                   2657 ;  dstack:{ addr -- value }
                                   2658 ;---------------------------
      00905E                       2659 fetch:
      00905E 72 CE 00 17      [ 5] 2660 	ldw x,[dstkptr]
      009062 FE               [ 2] 2661 	ldw x,(x)
      009063 72 CF 00 17      [ 5] 2662 	ldw [dstkptr],x
      009067 81               [ 4] 2663 	ret 
                                   2664 
                                   2665 ;----------------------------
                                   2666 ; store variable 
                                   2667 ; dstack: {addr value -- }
                                   2668 ;----------------------------
      009068                       2669 store:
      009068 CD 90 0E         [ 4] 2670 	call dpop 
      00906B 90 93            [ 1] 2671 	ldw y,x   ; y=value 
      00906D CD 90 0E         [ 4] 2672 	call dpop 
      009070 FF               [ 2] 2673 	ldw (x),y 
      009071 81               [ 4] 2674 	ret 
                                   2675 
                                   2676 ;---------------------------------
                                   2677 ; drop n elements from data stack 
                                   2678 ; input: 
                                   2679 ;   X 		n 
                                   2680 ; output:
                                   2681 ;   none 
                                   2682 ;-------------------------------------
      009072                       2683 ddrop_n:
      009072 90 89            [ 2] 2684 	pushw y 
      009074 90 CE 00 17      [ 2] 2685 	ldw y,dstkptr 
      009078 58               [ 2] 2686 	sllw x 
      009079 89               [ 2] 2687 	pushw x 
      00907A 72 F9 01         [ 2] 2688 	addw y,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      00907D 90 CF 00 17      [ 2] 2689 	ldw dstkptr,y 
      009081 85               [ 2] 2690 	popw x 
      009082 90 85            [ 2] 2691 	popw y
      009084 81               [ 4] 2692 	ret 
                                   2693 
      009085 0A 64 73 74 61 63 6B  2694 dstk_prompt: .asciz "\ndstack: " 
             3A 20 00
                                   2695 ;----------------------------
                                   2696 ; print dstack content 
                                   2697 ;---------------------------
                           000001  2698 	XSAVE=1
                           000002  2699 	VSIZE=2
      00908F                       2700 dots:
      00100F                       2701 	_vars VSIZE 
      00908F 52 02            [ 2]    1     sub sp,#VSIZE 
      009091 AE 90 85         [ 2] 2702 	ldw x,#dstk_prompt 
      009094 CD 82 38         [ 4] 2703 	call puts
      009097 AE 17 7E         [ 2] 2704 	ldw x,#dstack_unf-CELL_SIZE
      00909A 35 0A 00 07      [ 1] 2705 	mov base,#10 
      00909E C3 00 17         [ 2] 2706 1$:	cpw x,dstkptr 
      0090A1 25 0D            [ 1] 2707 	jrult 4$ 
      0090A3 1F 01            [ 2] 2708 	ldw (XSAVE,sp),x
      0090A5 FE               [ 2] 2709 	ldw  x,(x)
      0090A6 CD 8A 08         [ 4] 2710 	call print_int 
      0090A9 1E 01            [ 2] 2711 	ldw x,(XSAVE,sp)
      0090AB 1D 00 02         [ 2] 2712 	subw x,#CELL_SIZE 
      0090AE 20 EE            [ 2] 2713 	jra 1$ 
      0090B0 A6 0D            [ 1] 2714 4$: ld a,#CR 
      0090B2 CD 82 26         [ 4] 2715 	call putc 
      001035                       2716 	_drop VSIZE
      0090B5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0090B7 4F               [ 1] 2717 	clr a 
      0090B8 81               [ 4] 2718 	ret
                                   2719 
      0090B9 0A 63 74 61 63 6B 3A  2720 cstk_prompt: .asciz "\nctack: "
             20 00
                                   2721 ;--------------------------------
                                   2722 ; print cstack content
                                   2723 ;--------------------------------
                           000001  2724 	XSAVE=1
                           000002  2725 	VSIZE=2 
      0090C2                       2726 dotr:
      001042                       2727 	_vars VSIZE 
      0090C2 52 02            [ 2]    1     sub sp,#VSIZE 
      0090C4 AE 90 B9         [ 2] 2728 	ldw x,#cstk_prompt
      0090C7 CD 82 38         [ 4] 2729 	call puts 
      0090CA 96               [ 1] 2730 	ldw x,sp 
      0090CB 1C 00 07         [ 2] 2731 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      0090CE 1F 01            [ 2] 2732 	ldw (XSAVE,sp),x  
      0090D0 AE 17 FE         [ 2] 2733 	ldw x,#RAM_SIZE-2
      0090D3 35 10 00 07      [ 1] 2734 	mov base,#16
      0090D7                       2735 dotr_loop:
      0090D7 13 01            [ 2] 2736 	cpw x,(XSAVE,sp)
      0090D9 2B 0B            [ 1] 2737 	jrmi 9$
      0090DB 89               [ 2] 2738 	pushw x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      0090DC FE               [ 2] 2739 	ldw x,(x)
      0090DD CD 8A 08         [ 4] 2740 	call print_int 
      0090E0 85               [ 2] 2741 	popw x  
      0090E1 1D 00 02         [ 2] 2742 	subw x,#CELL_SIZE
      0090E4 20 F1            [ 2] 2743 	jra dotr_loop 
      0090E6 A6 0D            [ 1] 2744 9$:	ld a,#CR 
      0090E8 CD 82 26         [ 4] 2745 	call putc 
      00106B                       2746 	_drop VSIZE 
      0090EB 5B 02            [ 2]    1     addw sp,#VSIZE 
      0090ED 4F               [ 1] 2747 	clr a 
      0090EE 81               [ 4] 2748 	ret
                                   2749 
                                   2750 
                                   2751 ;--------------------------------
                                   2752 ;  add 2 integers
                                   2753 ;  input:
                                   2754 ;    N1     on cstack 
                                   2755 ;    N2     on cstack 
                                   2756 ;  output:
                                   2757 ;    X 		n2+n1 
                                   2758 ;--------------------------------
                                   2759 	;arugments on cstack 
      0090EF                       2760 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00106F                       2761 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      00106F                       2762 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      00106F                       2763 add:
      0090EF 1E 05            [ 2] 2764 	ldw x ,(N2,sp)
      0090F1 72 FB 03         [ 2] 2765 	addw x,(N1,sp)
      0090F4 1F 03            [ 2] 2766 	ldw (N1,sp),x 
      0090F6 81               [ 4] 2767 	ret 
                                   2768 
                                   2769 ;--------------------------------
                                   2770 ;  substract 2 ntegers
                                   2771 ;  input:
                                   2772 ;    N1     on cstack 
                                   2773 ;    N2     on cstack 
                                   2774 ;  output:
                                   2775 ;    X 		n2+n1 
                                   2776 ;--------------------------------
      0090F7                       2777 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001077                       2778 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001077                       2779 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001077                       2780 substract:
      0090F7 1E 05            [ 2] 2781 	ldw x,(N2,sp)
      0090F9 72 F0 03         [ 2] 2782 	subw x,(N1,sp)
      0090FC 81               [ 4] 2783 	ret 
                                   2784 
                                   2785 ;-------------------------------------
                                   2786 ; multiply 2 integers
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2787 ; product overflow is ignored unless
                                   2788 ; MATH_OVF assembler flag is set to 1
                                   2789 ; input:
                                   2790 ;  	N1      on cstack
                                   2791 ;   N2 		on cstack 
                                   2792 ; output:
                                   2793 ;	X        N1*N2 
                                   2794 ;-------------------------------------
                                   2795 	;arguments 
      0090FD                       2796 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      00107D                       2797 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      00107D                       2798 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      00107D                       2799 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      00107D                       2800 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2801    ; local variables 
                           000001  2802 	SIGN=1
                           000002  2803 	PROD=2
                           000003  2804 	VSIZE=3
      00107D                       2805 multiply:
      00107D                       2806 	_vars VSIZE 
      0090FD 52 03            [ 2]    1     sub sp,#VSIZE 
      0090FF 0F 01            [ 1] 2807 	clr (SIGN,sp)
      009101 1E 06            [ 2] 2808 	ldw x,(N1_HB,sp)
      009103 9E               [ 1] 2809 	ld a,xh  
      009104 A5 80            [ 1] 2810 	bcp a,#0x80 
      009106 27 05            [ 1] 2811 	jreq 2$
      009108 03 01            [ 1] 2812 	cpl (SIGN,sp)
      00910A 50               [ 2] 2813 	negw x 
      00910B 1F 06            [ 2] 2814 	ldw (N1_HB,sp),x 
      00910D 1E 08            [ 2] 2815 2$: ldw x,(N2_HB,sp)
      00910F 9E               [ 1] 2816 	ld a,xh  
      009110 A5 80            [ 1] 2817 	bcp a,#0x80 
      009112 27 05            [ 1] 2818 	jreq 3$
      009114 03 01            [ 1] 2819 	cpl (SIGN,sp)
      009116 50               [ 2] 2820 	negw x 
      009117 1F 08            [ 2] 2821 	ldw (N2_HB,sp),x 
                                   2822 ; N1_LB * N2_LB 	
      009119 7B 07            [ 1] 2823 3$:	ld a,(N1_LB,sp)
      00911B 97               [ 1] 2824 	ld xl,a 
      00911C 7B 09            [ 1] 2825 	ld a,(N2_LB,sp) 
      00911E 42               [ 4] 2826 	mul x,a 
                           000000  2827 .if MATH_OVF 	
                                   2828 	ld a,xh 
                                   2829 	bcp a,#0x80 
                                   2830 	jreq 4$ 
                                   2831 	ld a,#ERR_MATH_OVF 
                                   2832 	jp tb_error
                                   2833 .endif 	 
      00911F 1F 02            [ 2] 2834 4$:	ldw (PROD,sp),x
                                   2835 ; N1_LB * N2_HB	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009121 7B 07            [ 1] 2836 	ld a,(N1_LB,sp) 
      009123 97               [ 1] 2837 	ld xl,a 
      009124 7B 08            [ 1] 2838 	ld a,(N2_HB,sp)
      009126 42               [ 4] 2839 	mul x,a
      009127 9F               [ 1] 2840 	ld a,xl 
      009128 1B 02            [ 1] 2841 	add a,(PROD,sp)
                           000000  2842 .if MATH_OVF 	
                                   2843 	bcp a,#0x80 
                                   2844 	jreq 5$ 
                                   2845 	ld a,#ERR_MATH_OVF 
                                   2846 	jp tb_error
                                   2847 .endif 	 
      00912A 6B 02            [ 1] 2848 5$:	ld (PROD,sp),a 
                                   2849 ; N1_HB * N2_LB 
      00912C 7B 06            [ 1] 2850 	ld a,(N1_HB,sp)
      00912E 97               [ 1] 2851 	ld xl,a 
      00912F 7B 09            [ 1] 2852 	ld a,(N2_LB,sp)
      009131 42               [ 4] 2853 	mul x,a 
      009132 9F               [ 1] 2854 	ld a,xl 
      009133 1B 02            [ 1] 2855 	add a,(PROD,sp)
                           000000  2856 .if MATH_OVF 	
                                   2857 	bcp a,#0x80 
                                   2858 	jreq 6$ 
                                   2859 	ld a,#ERR_MATH_OVF 
                                   2860 	jp tb_error
                                   2861 .endif 	 
      009135 6B 02            [ 1] 2862 6$:	ld (PROD,sp),a 
                                   2863 ; N1_HB * N2_HB 	
                                   2864 ; it is pointless to multiply N1_HB*N2_HB 
                                   2865 ; as this product is over 65535 or 0 
                                   2866 ;
                                   2867 ; sign adjust product
      009137 0D 01            [ 1] 2868 	tnz (SIGN,sp)
      009139 27 05            [ 1] 2869 	jreq 7$
      00913B 1E 02            [ 2] 2870 	ldw x, (PROD,sp)
      00913D 50               [ 2] 2871 	negw x
      00913E 1F 02            [ 2] 2872 	ldw (PROD,sp),x  
      009140                       2873 7$: 
      009140 1E 02            [ 2] 2874 	ldw x,(PROD,sp) 
      0010C2                       2875 	_drop VSIZE 
      009142 5B 03            [ 2]    1     addw sp,#VSIZE 
      009144 81               [ 4] 2876 	ret
                                   2877 
                                   2878 ;----------------------------------
                                   2879 ;  euclidian divide n2/n1 
                                   2880 ; input:
                                   2881 ;    N2 	on cstack
                                   2882 ;    N1 	on cstack
                                   2883 ; output:
                                   2884 ;    X      n2/n1 
                                   2885 ;    Y      remainder 
                                   2886 ;----------------------------------
      009145                       2887 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      0010C5                       2888 	_arg DIVISR 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                           000005     1     DIVISR=ARG_OFS+1 
      0010C5                       2889 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2890 	; local variables
                           000001  2891 	SQUOT=1 ; sign quotient
                           000002  2892 	SDIVD=2 ; sign dividend  
                           000002  2893 	VSIZE=2
      0010C5                       2894 divide:
      0010C5                       2895 	_vars VSIZE 
      009145 52 02            [ 2]    1     sub sp,#VSIZE 
      009147 0F 01            [ 1] 2896 	clr (SQUOT,sp)
      009149 0F 02            [ 1] 2897 	clr (SDIVD,sp)
                                   2898 ; check for 0 divisor
      00914B 1E 05            [ 2] 2899 	ldw x,(DIVISR,sp)
      00914D 5D               [ 2] 2900 	tnzw x 
      00914E 26 05            [ 1] 2901     jrne 0$
      009150 A6 04            [ 1] 2902 	ld a,#ERR_DIV0 
      009152 CC 87 91         [ 2] 2903 	jp tb_error 
                                   2904 ; check divisor sign 	
      009155 9E               [ 1] 2905 0$:	ld a,xh 
      009156 A5 80            [ 1] 2906 	bcp a,#0x80 
      009158 27 03            [ 1] 2907 	jreq 1$
      00915A 03 01            [ 1] 2908 	cpl (SQUOT,sp)
      00915C 50               [ 2] 2909 	negw x 
      00915D 1F 05            [ 2] 2910 1$:	ldw (DIVISR,sp),x
                                   2911 ; check dividend sign 	 
      00915F 1E 07            [ 2] 2912     ldw x,(DIVIDND,sp)
      009161 9E               [ 1] 2913 	ld a,xh 
      009162 A5 80            [ 1] 2914 	bcp a,#0x80 
      009164 27 05            [ 1] 2915 	jreq 2$ 
      009166 03 01            [ 1] 2916 	cpl (SQUOT,sp)
      009168 03 02            [ 1] 2917 	cpl (SDIVD,sp)
      00916A 50               [ 2] 2918 	negw x 
      00916B 16 05            [ 2] 2919 2$:	ldw y,(DIVISR,sp)
      00916D 65               [ 2] 2920 	divw x,y
      00916E 90 CF 00 09      [ 2] 2921 	ldw acc16,y 
                                   2922 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      009172 0D 02            [ 1] 2923 	tnz (SDIVD,sp)
      009174 27 0B            [ 1] 2924 	jreq 7$
      009176 90 5D            [ 2] 2925 	tnzw y 
      009178 27 07            [ 1] 2926 	jreq 7$
      00917A 5C               [ 1] 2927 	incw x
      00917B 16 05            [ 2] 2928 	ldw y,(DIVISR,sp)
      00917D 72 B2 00 09      [ 2] 2929 	subw y,acc16
      009181 0D 01            [ 1] 2930 7$: tnz (SQUOT,sp)
      009183 27 01            [ 1] 2931 	jreq 9$ 	 
      009185 50               [ 2] 2932 8$:	negw x 
      009186                       2933 9$: 
      001106                       2934 	_drop VSIZE 
      009186 5B 02            [ 2]    1     addw sp,#VSIZE 
      009188 81               [ 4] 2935 	ret 
                                   2936 
                                   2937 
                                   2938 ;----------------------------------
                                   2939 ;  remainder resulting from euclidian 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2940 ;  division of n2/n1 
                                   2941 ; input:
                                   2942 ;   N1 		cstack 
                                   2943 ;   N2      cstack
                                   2944 ; output:
                                   2945 ;   X       N2%N1 
                                   2946 ;----------------------------------
                           000003  2947 	N1=3
                           000005  2948 	N2=5
                           000004  2949 	VSIZE=4
      009189                       2950 modulo:
      009189 1E 03            [ 2] 2951 	Ldw x,(N1,sp)
      00918B 16 05            [ 2] 2952 	ldw y,(N2,sp)
      00110D                       2953 	_vars VSIZE 
      00918D 52 04            [ 2]    1     sub sp,#VSIZE 
      00918F 1F 01            [ 2] 2954 	ldw (1,sp),x 
      009191 17 03            [ 2] 2955 	ldw (3,sp),y 
      009193 CD 91 45         [ 4] 2956 	call divide 
      009196 93               [ 1] 2957 	ldw x,y
      001117                       2958 	_drop VSIZE 
      009197 5B 04            [ 2]    1     addw sp,#VSIZE 
      009199 81               [ 4] 2959 	ret 
                                   2960 
                                   2961 
                                   2962 ;----------------------------------
                                   2963 ; search in kword_dict command name
                                   2964 ;  from its execution address 
                                   2965 ; input:
                                   2966 ;   X       	execution address 
                                   2967 ; output:
                                   2968 ;   X 			cstr*  | 0 
                                   2969 ;--------------------------------
                           000001  2970 	XADR=1 
                           000003  2971 	LINK=3 
                           000004  2972 	VSIZE=4
      00919A                       2973 cmd_name:
      00111A                       2974 	_vars VSIZE 
      00919A 52 04            [ 2]    1     sub sp,#VSIZE 
      00919C 72 5F 00 09      [ 1] 2975 	clr acc16 
      0091A0 1F 01            [ 2] 2976 	ldw (XADR,sp),x  
      0091A2 AE A2 58         [ 2] 2977 	ldw x,#kword_dict	
      0091A5 1F 03            [ 2] 2978 1$:	ldw (LINK,sp),x
      0091A7 E6 02            [ 1] 2979 	ld a,(2,x)
      0091A9 A4 0F            [ 1] 2980 	and a,#15 
      0091AB C7 00 0A         [ 1] 2981 	ld acc8,a 
      0091AE 1C 00 03         [ 2] 2982 	addw x,#3
      0091B1 72 BB 00 09      [ 2] 2983 	addw x,acc16
      0091B5 FE               [ 2] 2984 	ldw x,(x) ; execution address 
      0091B6 13 01            [ 2] 2985 	cpw x,(XADR,sp)
      0091B8 27 0A            [ 1] 2986 	jreq 2$
      0091BA 1E 03            [ 2] 2987 	ldw x,(LINK,sp)
      0091BC FE               [ 2] 2988 	ldw x,(x) 
      0091BD 1D 00 02         [ 2] 2989 	subw x,#2  
      0091C0 26 E3            [ 1] 2990 	jrne 1$
      0091C2 20 05            [ 2] 2991 	jra 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0091C4 1E 03            [ 2] 2992 2$: ldw x,(LINK,sp)
      0091C6 1C 00 02         [ 2] 2993 	addw x,#2 	
      001149                       2994 9$:	_drop VSIZE
      0091C9 5B 04            [ 2]    1     addw sp,#VSIZE 
      0091CB 81               [ 4] 2995 	ret
                                   2996 
                                   2997 
                                   2998 ;---------------------------------
                                   2999 ; input:
                                   3000 ;	X 		dictionary entry point 
                                   3001 ;  pad		.asciz name to search 
                                   3002 ; output:
                                   3003 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3004 ;  X		execution address | 0 
                                   3005 ;---------------------------------
                           000001  3006 	NLEN=1 ; cmd length 
                           000002  3007 	YSAVE=2
                           000003  3008 	VSIZE=3 
      0091CC                       3009 search_dict:
      00114C                       3010 	_vars VSIZE 
      0091CC 52 03            [ 2]    1     sub sp,#VSIZE 
      0091CE 90 93            [ 1] 3011 	ldw y,x 
      0091D0                       3012 search_next:	
      0091D0 90 F6            [ 1] 3013 	ld a,(y)
      0091D2 A4 0F            [ 1] 3014 	and a,#0xf 
      0091D4 6B 01            [ 1] 3015 	ld (NLEN,sp),a  
      0091D6 AE 17 18         [ 2] 3016 	ldw x,#pad 
      0091D9 17 02            [ 2] 3017 	ldw (YSAVE,sp),y
      0091DB 90 5C            [ 1] 3018 	incw y  
      0091DD                       3019 cp_loop:
      0091DD F6               [ 1] 3020 	ld a,(x)
      0091DE 27 1E            [ 1] 3021 	jreq str_match 
      0091E0 0D 01            [ 1] 3022 	tnz (NLEN,sp)
      0091E2 27 0B            [ 1] 3023 	jreq no_match  
      0091E4 90 F1            [ 1] 3024 	cp a,(y)
      0091E6 26 07            [ 1] 3025 	jrne no_match 
      0091E8 90 5C            [ 1] 3026 	incw y 
      0091EA 5C               [ 1] 3027 	incw x
      0091EB 0A 01            [ 1] 3028 	dec (NLEN,sp)
      0091ED 20 EE            [ 2] 3029 	jra cp_loop 
      0091EF                       3030 no_match:
      0091EF 16 02            [ 2] 3031 	ldw y,(YSAVE,sp) 
      0091F1 72 A2 00 02      [ 2] 3032 	subw y,#2 ; move Y to link field
      0091F5 4B 00            [ 1] 3033 	push #TK_NONE 
      0091F7 90 FE            [ 2] 3034 	ldw y,(y) ; next word link 
      0091F9 84               [ 1] 3035 	pop a ; TK_NONE 
      0091FA 27 21            [ 1] 3036 	jreq search_exit  ; not found  
                                   3037 ;try next 
      0091FC 20 D2            [ 2] 3038 	jra search_next
      0091FE                       3039 str_match:
      0091FE 16 02            [ 2] 3040 	ldw y,(YSAVE,sp)
      009200 90 F6            [ 1] 3041 	ld a,(y)
      009202 6B 01            [ 1] 3042 	ld (NLEN,sp),a ; needed to test keyword type  
      009204 A4 0F            [ 1] 3043 	and a,#0xf 
                                   3044 ; move y to procedure address field 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009206 4C               [ 1] 3045 	inc a 
      009207 C7 00 0A         [ 1] 3046 	ld acc8,a 
      00920A 72 5F 00 09      [ 1] 3047 	clr acc16 
      00920E 72 B9 00 09      [ 2] 3048 	addw y,acc16 
      009212 90 FE            [ 2] 3049 	ldw y,(y) ; routine entry point 
                                   3050 ;determine keyword type bits 7:6 
      009214 7B 01            [ 1] 3051 	ld a,(NLEN,sp)
      009216 4E               [ 1] 3052 	swap a 
      009217 A4 0C            [ 1] 3053 	and a,#0xc
      009219 44               [ 1] 3054 	srl a
      00921A 44               [ 1] 3055 	srl a 
      00921B AB 06            [ 1] 3056 	add a,#6
      00921D                       3057 search_exit: 
      00921D 93               [ 1] 3058 	ldw x,y ; x=routine address 
      00119E                       3059 	_drop VSIZE 	 
      00921E 5B 03            [ 2]    1     addw sp,#VSIZE 
      009220 81               [ 4] 3060 	ret 
                                   3061 
                                   3062 ;---------------------
                                   3063 ; check if next token
                                   3064 ;  is of expected type 
                                   3065 ; input:
                                   3066 ;   A 		 expected token attribute
                                   3067 ;  ouput:
                                   3068 ;   none     if fail call tb_error 
                                   3069 ;--------------------
      009221                       3070 expect:
      009221 88               [ 1] 3071 	push a 
      009222 CD 88 6F         [ 4] 3072 	call next_token 
      009225 11 01            [ 1] 3073 	cp a,(1,sp)
      009227 27 03            [ 1] 3074 	jreq 1$
      009229 CC 87 8F         [ 2] 3075 	jp syntax_error
      00922C 84               [ 1] 3076 1$: pop a 
      00922D 81               [ 4] 3077 	ret 
                                   3078 
                                   3079 
                                   3080 ;-------------------------------
                                   3081 ; parse embedded BASIC routines 
                                   3082 ; arguments list.
                                   3083 ; arg_list::=  rel[','rel]*
                                   3084 ; all arguments are of integer type
                                   3085 ; input:
                                   3086 ;   none
                                   3087 ; output:
                                   3088 ;   A 			number of arguments pushed on dstack  
                                   3089 ;--------------------------------
                           000001  3090 	ARG_CNT=1 
      00922E                       3091 arg_list:
      00922E 4B 00            [ 1] 3092 	push #0  
      009230 CD 93 74         [ 4] 3093 1$: call relation
      009233 A1 00            [ 1] 3094 	cp a,#TK_NONE 
      009235 27 19            [ 1] 3095 	jreq 5$
      009237 A1 04            [ 1] 3096 	cp a,#TK_INTGR
      009239 26 12            [ 1] 3097 	jrne 4$
      00923B CD 90 01         [ 4] 3098 3$: call dpush 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00923E 0C 01            [ 1] 3099     inc (ARG_CNT,sp)
      009240 CD 88 6F         [ 4] 3100 	call next_token 
      009243 A1 00            [ 1] 3101 	cp a,#TK_NONE 
      009245 27 09            [ 1] 3102 	jreq 5$ 
      009247 A1 0D            [ 1] 3103 	cp a,#TK_COMMA 
      009249 26 02            [ 1] 3104 	jrne 4$
      00924B 20 E3            [ 2] 3105 	jra 1$ 
      00924D CD 8F FB         [ 4] 3106 4$:	call unget_token 
      009250 84               [ 1] 3107 5$:	pop a 
      009251 81               [ 4] 3108 	ret 
                                   3109 
                                   3110 
      009252                       3111 func_args:
      009252 A6 0B            [ 1] 3112 	ld a,#TK_LPAREN 
      009254 CD 92 21         [ 4] 3113 	call expect 
      009257 CD 92 2E         [ 4] 3114 	call arg_list 
      00925A 88               [ 1] 3115 	push a 
      00925B A6 0C            [ 1] 3116 	ld a,#TK_RPAREN 
      00925D CD 92 21         [ 4] 3117 	call expect 
      009260 84               [ 1] 3118 	pop a 
      009261 81               [ 4] 3119 	ret 
                                   3120 
                                   3121 
                                   3122 ;--------------------------------
                                   3123 ;   BASIC commnands 
                                   3124 ;--------------------------------
                                   3125 
                                   3126 ;--------------------------------
                                   3127 ;  arithmetic and relational 
                                   3128 ;  routines
                                   3129 ;  operators precedence
                                   3130 ;  highest to lowest
                                   3131 ;  operators on same row have 
                                   3132 ;  same precedence and are executed
                                   3133 ;  from left to right.
                                   3134 ;	'*','/','%'
                                   3135 ;   '-','+'
                                   3136 ;   '=','>','<','>=','<=','<>','><'
                                   3137 ;   '<>' and '><' are equivalent for not equal.
                                   3138 ;--------------------------------
                                   3139 
                                   3140 ;---------------------
                                   3141 ; return array element
                                   3142 ; address from @(expr)
                                   3143 ; input:
                                   3144 ;   A 		TK_ARRAY
                                   3145 ; output:
                                   3146 ;   A 		TK_INTGR
                                   3147 ;	X 		element address 
                                   3148 ;----------------------
      009262                       3149 get_array_element:
      009262 CD 92 52         [ 4] 3150 	call func_args 
      009265 A1 01            [ 1] 3151 	cp a,#1
      009267 27 03            [ 1] 3152 	jreq 1$
      009269 CC 87 8F         [ 2] 3153 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      00926C CD 90 0E         [ 4] 3154 1$: call dpop  
                                   3155 	; check for bounds 
      00926F C3 00 1E         [ 2] 3156 	cpw x,array_size 
      009272 23 05            [ 2] 3157 	jrule 3$
                                   3158 ; bounds {1..array_size}	
      009274 A6 0A            [ 1] 3159 2$: ld a,#ERR_BAD_VALUE 
      009276 CC 87 91         [ 2] 3160 	jp tb_error 
      009279 5D               [ 2] 3161 3$: tnzw  x
      00927A 27 F8            [ 1] 3162 	jreq 2$ 
      00927C 58               [ 2] 3163 	sllw x 
      00927D 89               [ 2] 3164 	pushw x 
      00927E AE 16 C8         [ 2] 3165 	ldw x,#tib
      009281 72 F0 01         [ 2] 3166 	subw x,(1,sp)
      001204                       3167 	_drop 2   
      009284 5B 02            [ 2]    1     addw sp,#2 
      009286 A6 04            [ 1] 3168 	ld a,#TK_INTGR
      009288 81               [ 4] 3169 	ret 
                                   3170 
                                   3171 ;***********************************
                                   3172 ;   expression parse,execute 
                                   3173 ;***********************************
                                   3174 ;-----------------------------------
                                   3175 ; factor ::= ['+'|'-'|e] var | @ |
                                   3176 ;			 integer | function |
                                   3177 ;			 '('relation')' 
                                   3178 ; output:
                                   3179 ;   A    token attribute 
                                   3180 ;   X 	 integer
                                   3181 ; ---------------------------------
                           000001  3182 	NEG=1
                           000001  3183 	VSIZE=1
      009289                       3184 factor:
      001209                       3185 	_vars VSIZE 
      009289 52 01            [ 2]    1     sub sp,#VSIZE 
      00928B CD 88 6F         [ 4] 3186 	call next_token
      00928E A1 02            [ 1] 3187 	cp a,#CMD_END 
      009290 2B 4E            [ 1] 3188 	jrmi 20$
      009292 6B 01            [ 1] 3189 1$:	ld (NEG,sp),a 
      009294 A4 30            [ 1] 3190 	and a,#TK_GRP_MASK
      009296 A1 10            [ 1] 3191 	cp a,#TK_GRP_ADD 
      009298 27 04            [ 1] 3192 	jreq 2$
      00929A 7B 01            [ 1] 3193 	ld a,(NEG,sp)
      00929C 20 03            [ 2] 3194 	jra 4$  
      00929E                       3195 2$:	
      00929E CD 88 6F         [ 4] 3196 	call next_token 
      0092A1                       3197 4$:	
      0092A1 A1 07            [ 1] 3198 	cp a,#TK_IFUNC 
      0092A3 26 03            [ 1] 3199 	jrne 5$ 
      0092A5 FD               [ 4] 3200 	call (x) 
      0092A6 20 2F            [ 2] 3201 	jra 18$ 
      0092A8                       3202 5$:
      0092A8 A1 04            [ 1] 3203 	cp a,#TK_INTGR
      0092AA 26 02            [ 1] 3204 	jrne 6$
      0092AC 20 29            [ 2] 3205 	jra 18$
      0092AE                       3206 6$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0092AE A1 02            [ 1] 3207 	cp a,#TK_ARRAY
      0092B0 26 06            [ 1] 3208 	jrne 10$
      0092B2 CD 92 62         [ 4] 3209 	call get_array_element
      0092B5 FE               [ 2] 3210 	ldw x,(x)
      0092B6 20 1F            [ 2] 3211 	jra 18$ 
      0092B8                       3212 10$:
      0092B8 A1 05            [ 1] 3213 	cp a,#TK_VAR 
      0092BA 26 03            [ 1] 3214 	jrne 11$
      0092BC FE               [ 2] 3215 	ldw x,(x)
      0092BD 20 18            [ 2] 3216 	jra 18$
      0092BF                       3217 11$: 
      0092BF A1 09            [ 1] 3218 	cp a,#TK_CONST 
      0092C1 27 14            [ 1] 3219 	jreq 18$
      0092C3                       3220 12$:			
      0092C3 A1 0B            [ 1] 3221 	cp a,#TK_LPAREN
      0092C5 26 0A            [ 1] 3222 	jrne 16$
      0092C7 CD 93 74         [ 4] 3223 	call relation
      0092CA A6 0C            [ 1] 3224 	ld a,#TK_RPAREN 
      0092CC CD 92 21         [ 4] 3225 	call expect
      0092CF 20 06            [ 2] 3226 	jra 18$	
      0092D1                       3227 16$:
      0092D1 CD 8F FB         [ 4] 3228 	call unget_token
      0092D4 4F               [ 1] 3229 	clr a 
      0092D5 20 09            [ 2] 3230 	jra 20$ 
      0092D7                       3231 18$: 
      0092D7 A6 11            [ 1] 3232 	ld a,#TK_MINUS 
      0092D9 11 01            [ 1] 3233 	cp a,(NEG,sp)
      0092DB 26 01            [ 1] 3234 	jrne 19$
      0092DD 50               [ 2] 3235 	negw x
      0092DE                       3236 19$:
      0092DE A6 04            [ 1] 3237 	ld a,#TK_INTGR
      0092E0                       3238 20$:
      001260                       3239 	_drop VSIZE
      0092E0 5B 01            [ 2]    1     addw sp,#VSIZE 
      0092E2 81               [ 4] 3240 	ret
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
      0092E3                       3252 term:
      001263                       3253 	_vars VSIZE
      0092E3 52 05            [ 2]    1     sub sp,#VSIZE 
      0092E5 CD 92 89         [ 4] 3254 	call factor
      0092E8 A1 02            [ 1] 3255 	cp a,#CMD_END
      0092EA 2B 41            [ 1] 3256 	jrmi term_exit
      0092EC                       3257 term01:	 ; check for  operator 
      0092EC 1F 03            [ 2] 3258 	ldw (N2,sp),x  ; save first factor 
      0092EE CD 88 6F         [ 4] 3259 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0092F1 A1 02            [ 1] 3260 	cp a,#2
      0092F3 2B 34            [ 1] 3261 	jrmi 9$
      0092F5 6B 05            [ 1] 3262 0$:	ld (MULOP,sp),a
      0092F7 A4 30            [ 1] 3263 	and a,#TK_GRP_MASK
      0092F9 A1 20            [ 1] 3264 	cp a,#TK_GRP_MULT
      0092FB 27 07            [ 1] 3265 	jreq 1$
      0092FD 7B 05            [ 1] 3266 	ld a,(MULOP,sp) 
      0092FF CD 8F FB         [ 4] 3267 	call unget_token 
      009302 20 25            [ 2] 3268 	jra 9$
      009304                       3269 1$:	; got *|/|%
      009304 CD 92 89         [ 4] 3270 	call factor
      009307 A1 04            [ 1] 3271 	cp a,#TK_INTGR
      009309 27 03            [ 1] 3272 	jreq 2$ 
      00930B CC 87 8F         [ 2] 3273 	jp syntax_error
      00930E 1F 01            [ 2] 3274 2$:	ldw (N1,sp),x  
      009310 7B 05            [ 1] 3275 	ld a,(MULOP,sp) 
      009312 A1 20            [ 1] 3276 	cp a,#TK_MULT 
      009314 26 05            [ 1] 3277 	jrne 3$
      009316 CD 90 FD         [ 4] 3278 	call multiply 
      009319 20 D1            [ 2] 3279 	jra term01
      00931B A1 21            [ 1] 3280 3$: cp a,#TK_DIV 
      00931D 26 05            [ 1] 3281 	jrne 4$ 
      00931F CD 91 45         [ 4] 3282 	call divide 
      009322 20 C8            [ 2] 3283 	jra term01 
      009324 CD 91 89         [ 4] 3284 4$: call modulo
      009327 20 C3            [ 2] 3285 	jra term01 
      009329 1E 03            [ 2] 3286 9$: ldw x,(N2,sp)  
      00932B A6 04            [ 1] 3287 	ld a,#TK_INTGR 	
      00932D                       3288 term_exit:
      0012AD                       3289 	_drop VSIZE 
      00932D 5B 05            [ 2]    1     addw sp,#VSIZE 
      00932F 81               [ 4] 3290 	ret 
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
      009330                       3303 expression:
      0012B0                       3304 	_vars VSIZE 
      009330 52 05            [ 2]    1     sub sp,#VSIZE 
      009332 CD 92 E3         [ 4] 3305 	call term
      009335 A1 02            [ 1] 3306 	cp a,#CMD_END 
      009337 2B 38            [ 1] 3307 	jrmi expr_exit 
      009339 1F 03            [ 2] 3308 0$:	ldw (N2,sp),x 
      00933B CD 88 6F         [ 4] 3309 	call next_token
      00933E A1 02            [ 1] 3310 	cp a,#2
      009340 2B 2B            [ 1] 3311 	jrmi 9$ 
      009342 6B 05            [ 1] 3312 1$:	ld (OP,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      009344 A4 30            [ 1] 3313 	and a,#TK_GRP_MASK
      009346 A1 10            [ 1] 3314 	cp a,#TK_GRP_ADD 
      009348 27 07            [ 1] 3315 	jreq 2$ 
      00934A 7B 05            [ 1] 3316 	ld a,(OP,sp)
      00934C CD 8F FB         [ 4] 3317 	call unget_token
      00934F 20 1C            [ 2] 3318 	jra 9$
      009351                       3319 2$: 
      009351 CD 92 E3         [ 4] 3320 	call term
      009354 A1 04            [ 1] 3321 	cp a,#TK_INTGR 
      009356 27 03            [ 1] 3322 	jreq 3$
      009358 CC 87 8F         [ 2] 3323 	jp syntax_error
      00935B 1F 01            [ 2] 3324 3$:	ldw (N1,sp),x 
      00935D 7B 05            [ 1] 3325 	ld a,(OP,sp)
      00935F A1 10            [ 1] 3326 	cp a,#TK_PLUS 
      009361 26 05            [ 1] 3327 	jrne 4$
      009363 CD 90 EF         [ 4] 3328 	call add 
      009366 20 D1            [ 2] 3329 	jra 0$ 
      009368 CD 90 F7         [ 4] 3330 4$:	call substract
      00936B 20 CC            [ 2] 3331 	jra 0$
      00936D 1E 03            [ 2] 3332 9$: ldw x,(N2,sp)
      00936F A6 04            [ 1] 3333 	ld a,#TK_INTGR	
      009371                       3334 expr_exit:
      0012F1                       3335 	_drop VSIZE 
      009371 5B 05            [ 2]    1     addw sp,#VSIZE 
      009373 81               [ 4] 3336 	ret 
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
      009374                       3350 relation: 
      0012F4                       3351 	_vars VSIZE
      009374 52 05            [ 2]    1     sub sp,#VSIZE 
      009376 CD 93 30         [ 4] 3352 	call expression
      009379 A1 02            [ 1] 3353 	cp a,#CMD_END  
      00937B 2B 4B            [ 1] 3354 	jrmi rel_exit 
                                   3355 	; expect rel_op or leave 
      00937D 1F 03            [ 2] 3356 	ldw (N2,sp),x 
      00937F CD 88 6F         [ 4] 3357 	call next_token 
      009382 A1 02            [ 1] 3358 	cp a,#2
      009384 2B 3E            [ 1] 3359 	jrmi 9$
      009386                       3360 1$:	
      009386 6B 05            [ 1] 3361 	ld (RELOP,sp),a 
      009388 A4 30            [ 1] 3362 	and a,#TK_GRP_MASK
      00938A A1 30            [ 1] 3363 	cp a,#TK_GRP_RELOP 
      00938C 27 07            [ 1] 3364 	jreq 2$
      00938E 7B 05            [ 1] 3365 	ld a,(RELOP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009390 CD 8F FB         [ 4] 3366 	call unget_token  
      009393 20 2F            [ 2] 3367 	jra 9$
      009395                       3368 2$:	; expect another expression or error 
      009395 CD 93 30         [ 4] 3369 	call expression
      009398 A1 04            [ 1] 3370 	cp a,#TK_INTGR 
      00939A 27 03            [ 1] 3371 	jreq 3$
      00939C CC 87 8F         [ 2] 3372 	jp syntax_error 
      00939F 1F 01            [ 2] 3373 3$:	ldw (N1,sp),x 
      0093A1 CD 90 F7         [ 4] 3374 	call substract
      0093A4 26 06            [ 1] 3375 	jrne 4$
      0093A6 35 02 00 0A      [ 1] 3376 	mov acc8,#2 ; n1==n2
      0093AA 20 0C            [ 2] 3377 	jra 6$ 
      0093AC                       3378 4$: 
      0093AC 2C 06            [ 1] 3379 	jrsgt 5$  
      0093AE 35 04 00 0A      [ 1] 3380 	mov acc8,#4 ; n1<2 
      0093B2 20 04            [ 2] 3381 	jra 6$
      0093B4                       3382 5$:
      0093B4 35 01 00 0A      [ 1] 3383 	mov acc8,#1 ; n1>n2 
      0093B8                       3384 6$:
      0093B8 5F               [ 1] 3385 	clrw x 
      0093B9 C6 00 0A         [ 1] 3386 	ld a, acc8  
      0093BC 14 05            [ 1] 3387 	and a,(RELOP,sp)
      0093BE 4D               [ 1] 3388 	tnz a 
      0093BF 27 05            [ 1] 3389 	jreq 10$
      0093C1 5C               [ 1] 3390 	incw x 
      0093C2                       3391 7$:	 
      0093C2 20 02            [ 2] 3392 	jra 10$  	
      0093C4 1E 03            [ 2] 3393 9$: ldw x,(N2,sp)
      0093C6                       3394 10$:
      0093C6 A6 04            [ 1] 3395 	ld a,#TK_INTGR
      0093C8                       3396 rel_exit: 	 
      001348                       3397 	_drop VSIZE
      0093C8 5B 05            [ 2]    1     addw sp,#VSIZE 
      0093CA 81               [ 4] 3398 	ret 
                                   3399 
                                   3400 ;--------------------------------
                                   3401 ; BASIC: SHOW 
                                   3402 ;  show content of dstack,cstack
                                   3403 ;--------------------------------
      0093CB                       3404 show:
      0093CB C6 00 07         [ 1] 3405 	ld a,base 
      0093CE 88               [ 1] 3406 	push a 
      0093CF CD 90 8F         [ 4] 3407 	call dots
      0093D2 CD 90 C2         [ 4] 3408 	call dotr 
      0093D5 84               [ 1] 3409 	pop a 
      0093D6 C7 00 07         [ 1] 3410 	ld base,a 
      0093D9 4F               [ 1] 3411 	clr a 
      0093DA 81               [ 4] 3412 	ret
                                   3413 
                                   3414 ;--------------------------------------------
                                   3415 ; BASIC: HEX 
                                   3416 ; select hexadecimal base for integer print
                                   3417 ;---------------------------------------------
      0093DB                       3418 hex_base:
      0093DB 35 10 00 07      [ 1] 3419 	mov base,#16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0093DF 81               [ 4] 3420 	ret 
                                   3421 
                                   3422 ;--------------------------------------------
                                   3423 ; BASIC: DEC 
                                   3424 ; select decimal base for integer print
                                   3425 ;---------------------------------------------
      0093E0                       3426 dec_base:
      0093E0 35 0A 00 07      [ 1] 3427 	mov base,#10
      0093E4 81               [ 4] 3428 	ret 
                                   3429 
                                   3430 ;------------------------
                                   3431 ; BASIC: SIZE 
                                   3432 ; return free size in text area
                                   3433 ; output:
                                   3434 ;   A 		TK_INTGR
                                   3435 ;   X 	    size integer
                                   3436 ;--------------------------
      0093E5                       3437 size:
      0093E5 AE 16 C8         [ 2] 3438 	ldw x,#tib 
      0093E8 72 B0 00 1B      [ 2] 3439 	subw x,txtend 
      0093EC A6 04            [ 1] 3440 	ld a,#TK_INTGR
      0093EE 81               [ 4] 3441 	ret 
                                   3442 
                                   3443 
                                   3444 ;------------------------
                                   3445 ; BASIC: UBOUND  
                                   3446 ; return array variable size 
                                   3447 ; output:
                                   3448 ;   A 		TK_INTGR
                                   3449 ;   X 	    array size 
                                   3450 ;--------------------------
      0093EF                       3451 ubound:
      0093EF AE 16 C8         [ 2] 3452 	ldw x,#tib
      0093F2 72 B0 00 1B      [ 2] 3453 	subw x,txtend 
      0093F6 90 CE 00 05      [ 2] 3454 	ldw y,basicptr 
      0093FA 90 C3 00 1B      [ 2] 3455 	cpw y,txtend 
      0093FE 25 0A            [ 1] 3456 	jrult 1$
      009400 3B 00 04         [ 1] 3457 	push count 
      009403 4B 00            [ 1] 3458 	push #0 
      009405 72 F0 01         [ 2] 3459 	subw x,(1,sp)
      001388                       3460 	_drop 2 
      009408 5B 02            [ 2]    1     addw sp,#2 
      00940A 54               [ 2] 3461 1$:	srlw x 
      00940B CF 00 1E         [ 2] 3462 	ldw array_size,x
      00940E A6 04            [ 1] 3463 	ld a,#TK_INTGR
      009410 81               [ 4] 3464 	ret 
                                   3465 
                                   3466 ;-----------------------------
                                   3467 ; BASIC: LET var=expr 
                                   3468 ; variable assignement 
                                   3469 ; output:
                                   3470 ;   A 		TK_NONE 
                                   3471 ;-----------------------------
      009411                       3472 let:
      009411 CD 88 6F         [ 4] 3473 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009414 A1 05            [ 1] 3474 	cp a,#TK_VAR 
      009416 27 03            [ 1] 3475 	jreq let02
      009418 CC 87 8F         [ 2] 3476 	jp syntax_error
      00941B                       3477 let02:
      00941B CD 90 01         [ 4] 3478 	call dpush 
      00941E CD 88 6F         [ 4] 3479 	call next_token 
      009421 A1 32            [ 1] 3480 	cp a,#TK_EQUAL
      009423 27 03            [ 1] 3481 	jreq 1$
      009425 CC 87 8F         [ 2] 3482 	jp syntax_error
      009428                       3483 1$:	
      009428 CD 93 74         [ 4] 3484 	call relation   
      00942B A1 04            [ 1] 3485 	cp a,#TK_INTGR 
      00942D 27 03            [ 1] 3486 	jreq 2$
      00942F CC 87 8F         [ 2] 3487 	jp syntax_error
      009432                       3488 2$:	
      009432 90 93            [ 1] 3489 	ldw y,x 
      009434 CD 90 0E         [ 4] 3490 	call dpop  
      009437 FF               [ 2] 3491 	ldw (x),y   
      009438 81               [ 4] 3492 	ret 
                                   3493 
                                   3494 ;----------------------------
                                   3495 ; BASIC: LIST [[start][,end]]
                                   3496 ; list program lines 
                                   3497 ; form start to end 
                                   3498 ; if empty argument list then 
                                   3499 ; list all.
                                   3500 ;----------------------------
                           000001  3501 	FIRST=1
                           000003  3502 	LAST=3 
                           000005  3503 	LN_PTR=5
                           000006  3504 	VSIZE=6 
      009439                       3505 list:
      0013B9                       3506 	_vars VSIZE
      009439 52 06            [ 2]    1     sub sp,#VSIZE 
      00943B CE 00 19         [ 2] 3507 	ldw x,txtbgn 
      00943E C3 00 1B         [ 2] 3508 	cpw x,txtend 
      009441 2B 03            [ 1] 3509 	jrmi 1$
      009443 CC 94 B9         [ 2] 3510 	jp list_exit ; nothing to list 
      009446 1F 05            [ 2] 3511 1$:	ldw (LN_PTR,sp),x 
      009448 FE               [ 2] 3512 	ldw x,(x) 
      009449 1F 01            [ 2] 3513 	ldw (FIRST,sp),x ; list from first line 
      00944B AE 7F FF         [ 2] 3514 	ldw x,#0x7fff ; biggest line number 
      00944E 1F 03            [ 2] 3515 	ldw (LAST,sp),x 
      009450 CD 92 2E         [ 4] 3516 	call arg_list
      009453 4D               [ 1] 3517 	tnz a
      009454 27 3F            [ 1] 3518 	jreq list_start 
      009456 A1 02            [ 1] 3519 	cp a,#2 
      009458 27 07            [ 1] 3520 	jreq 4$
      00945A A1 01            [ 1] 3521 	cp a,#1 
      00945C 27 06            [ 1] 3522 	jreq first_line 
      00945E CC 87 8F         [ 2] 3523 	jp syntax_error 
      009461 CD 90 1B         [ 4] 3524 4$:	call dswap
      009464                       3525 first_line:
      009464 CD 90 0E         [ 4] 3526 	call dpop 
      009467 1F 01            [ 2] 3527 	ldw (FIRST,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009469 A1 01            [ 1] 3528 	cp a,#1 
      00946B 27 05            [ 1] 3529 	jreq lines_skip 	
      00946D                       3530 last_line:
      00946D CD 90 0E         [ 4] 3531 	call dpop 
      009470 1F 03            [ 2] 3532 	ldw (LAST,sp),x 
      009472                       3533 lines_skip:
      009472 CE 00 19         [ 2] 3534 	ldw x,txtbgn
      009475 1F 05            [ 2] 3535 2$:	ldw (LN_PTR,sp),x 
      009477 C3 00 1B         [ 2] 3536 	cpw x,txtend 
      00947A 2A 3D            [ 1] 3537 	jrpl list_exit 
      00947C FE               [ 2] 3538 	ldw x,(x) ;line# 
      00947D 13 01            [ 2] 3539 	cpw x,(FIRST,sp)
      00947F 2A 14            [ 1] 3540 	jrpl list_start 
      009481 1E 05            [ 2] 3541 	ldw x,(LN_PTR,sp) 
      009483 1C 00 02         [ 2] 3542 	addw x,#2 
      009486 F6               [ 1] 3543 	ld a,(x)
      009487 5C               [ 1] 3544 	incw x 
      009488 C7 00 0A         [ 1] 3545 	ld acc8,a 
      00948B 72 5F 00 09      [ 1] 3546 	clr acc16 
      00948F 72 BB 00 09      [ 2] 3547 	addw x,acc16
      009493 20 E0            [ 2] 3548 	jra 2$ 
                                   3549 ; print loop
      009495                       3550 list_start:
      009495 1E 05            [ 2] 3551 	ldw x,(LN_PTR,sp)
      009497                       3552 3$:	
      009497 CD 95 0C         [ 4] 3553 	call prt_basic_line
      00949A 1E 05            [ 2] 3554 	ldw x,(LN_PTR,sp)
      00949C E6 02            [ 1] 3555 	ld a,(2,x)
      00949E C7 00 0A         [ 1] 3556 	ld acc8,a 
      0094A1 72 5F 00 09      [ 1] 3557 	clr acc16 
      0094A5 72 BB 00 09      [ 2] 3558 	addw x,acc16
      0094A9 C3 00 1B         [ 2] 3559 	cpw x,txtend 
      0094AC 2A 0B            [ 1] 3560 	jrpl list_exit
      0094AE 1F 05            [ 2] 3561 	ldw (LN_PTR,sp),x
      0094B0 FE               [ 2] 3562 	ldw x,(x)
      0094B1 13 03            [ 2] 3563 	cpw x,(LAST,sp)  
      0094B3 2C 04            [ 1] 3564 	jrsgt list_exit 
      0094B5 1E 05            [ 2] 3565 	ldw x,(LN_PTR,sp)
      0094B7 20 DE            [ 2] 3566 	jra 3$
      0094B9                       3567 list_exit:
      001439                       3568 	_drop VSIZE 
      0094B9 5B 06            [ 2]    1     addw sp,#VSIZE 
      0094BB 81               [ 4] 3569 	ret
                                   3570 
                                   3571 ;-------------------------
                                   3572 ; print counted string 
                                   3573 ; input:
                                   3574 ;   X 		address of string
                                   3575 ;--------------------------
      0094BC                       3576 prt_cmd_name:
      0094BC F6               [ 1] 3577 	ld a,(x)
      0094BD 5C               [ 1] 3578 	incw x
      0094BE A4 0F            [ 1] 3579 	and a,#15  
      0094C0 88               [ 1] 3580 	push a 
      0094C1 0D 01            [ 1] 3581 1$: tnz (1,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0094C3 27 09            [ 1] 3582 	jreq 9$
      0094C5 F6               [ 1] 3583 	ld a,(x)
      0094C6 CD 82 26         [ 4] 3584 	call putc 
      0094C9 5C               [ 1] 3585 	incw x
      0094CA 0A 01            [ 1] 3586 	dec (1,sp)	 
      0094CC 20 F3            [ 2] 3587 	jra 1$
      0094CE 84               [ 1] 3588 9$: pop a 
      0094CF 81               [ 4] 3589 	ret	
                                   3590 
                                   3591 ;--------------------------
                                   3592 ; print TK_QSTR
                                   3593 ; converting control character
                                   3594 ; to backslash sequence
                                   3595 ; input:
                                   3596 ;   X        char *
                                   3597 ;-----------------------------
      0094D0                       3598 prt_quote:
      0094D0 A6 22            [ 1] 3599 	ld a,#'"
      0094D2 CD 82 26         [ 4] 3600 	call putc 
      0094D5 F6               [ 1] 3601 1$:	ld a,(x)
      0094D6 27 2D            [ 1] 3602 	jreq 9$
      0094D8 5C               [ 1] 3603 	incw x 
      0094D9 A1 20            [ 1] 3604 	cp a,#SPACE 
      0094DB 25 0C            [ 1] 3605 	jrult 3$
      0094DD CD 82 26         [ 4] 3606 	call putc
      0094E0 A1 5C            [ 1] 3607 	cp a,#'\ 
      0094E2 26 F1            [ 1] 3608 	jrne 1$ 
      0094E4                       3609 2$:
      0094E4 CD 82 26         [ 4] 3610 	call putc 
      0094E7 20 EC            [ 2] 3611 	jra 1$
      0094E9 88               [ 1] 3612 3$: push a 
      0094EA A6 5C            [ 1] 3613 	ld a,#'\
      0094EC CD 82 26         [ 4] 3614 	call putc 
      0094EF 84               [ 1] 3615 	pop a 
      0094F0 A0 07            [ 1] 3616 	sub a,#7
      0094F2 C7 00 0A         [ 1] 3617 	ld acc8,a 
      0094F5 72 5F 00 09      [ 1] 3618 	clr acc16
      0094F9 90 AE 8C CA      [ 2] 3619 	ldw y,#escaped 
      0094FD 72 B9 00 09      [ 2] 3620 	addw y,acc16 
      009501 90 F6            [ 1] 3621 	ld a,(y)
      009503 20 DF            [ 2] 3622 	jra 2$
      009505 A6 22            [ 1] 3623 9$: ld a,#'"
      009507 CD 82 26         [ 4] 3624 	call putc 
      00950A 5C               [ 1] 3625 	incw x 
      00950B 81               [ 4] 3626 	ret
                                   3627 
                                   3628 
                                   3629 ;--------------------------
                                   3630 ; decompile line from token list 
                                   3631 ; input:
                                   3632 ;   X 		pointer at line
                                   3633 ; output:
                                   3634 ;   none 
                                   3635 ;--------------------------	
                           000001  3636 	BASE_SAV=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                           000002  3637 	WIDTH_SAV=2
                           000003  3638 	XSAVE=3
                           000005  3639 	LLEN=5
                           000005  3640 	VSIZE=5 
      00950C                       3641 prt_basic_line:
      00148C                       3642 	_vars VSIZE 
      00950C 52 05            [ 2]    1     sub sp,#VSIZE 
      00950E C6 00 07         [ 1] 3643 	ld a,base
      009511 6B 01            [ 1] 3644 	ld (BASE_SAV,sp),a  
      009513 C6 00 21         [ 1] 3645 	ld a,tab_width 
      009516 6B 02            [ 1] 3646 	ld (WIDTH_SAV,sp),a 
      009518 CF 00 12         [ 2] 3647 	ldw ptr16,x
      00951B FE               [ 2] 3648 	ldw x,(x)
      00951C 35 0A 00 07      [ 1] 3649 	mov base,#10
      009520 35 05 00 21      [ 1] 3650 	mov tab_width,#5
      009524 CD 8A 08         [ 4] 3651 	call print_int ; print line number 
      009527 A6 20            [ 1] 3652 	ld a,#SPACE 
      009529 CD 82 26         [ 4] 3653 	call putc 
      00952C 72 5F 00 21      [ 1] 3654 	clr tab_width
      009530 AE 00 02         [ 2] 3655 	ldw x,#2
      009533 72 D6 00 12      [ 4] 3656 	ld a,([ptr16],x)
      009537 6B 05            [ 1] 3657 	ld (LLEN,sp),a 
      009539 5C               [ 1] 3658 	incw x
      00953A 9F               [ 1] 3659 1$:	ld a,xl 
      00953B 11 05            [ 1] 3660 	cp a,(LLEN,sp)
      00953D 2B 03            [ 1] 3661 	jrmi 20$
      00953F CC 96 49         [ 2] 3662 	jp 90$
      009542                       3663 20$:	 
      009542 72 D6 00 12      [ 4] 3664 	ld a,([ptr16],x)
      009546 5C               [ 1] 3665 	incw x 
      009547 1F 03            [ 2] 3666 	ldw (XSAVE,sp),x 
      009549 A1 06            [ 1] 3667 	cp a,#TK_CMD 
      00954B 25 44            [ 1] 3668 	jrult 5$
      00954D A1 09            [ 1] 3669 	cp a,#TK_CONST 
      00954F 22 2F            [ 1] 3670 	jrugt 4$
      009551                       3671 2$:	
      009551 72 DE 00 12      [ 5] 3672 	ldw x,([ptr16],x)
      009555 A3 97 82         [ 2] 3673 	cpw x,#rem 
      009558 26 14            [ 1] 3674 	jrne 3$
      00955A A6 27            [ 1] 3675 	ld a,#''
      00955C CD 82 26         [ 4] 3676 	call putc 
      00955F 1E 03            [ 2] 3677 	ldw x,(XSAVE,sp)
      009561 1C 00 02         [ 2] 3678 	addw x,#2
      009564 72 BB 00 12      [ 2] 3679 	addw x,ptr16  
      009568 CD 82 38         [ 4] 3680 	call puts 
      00956B CC 96 49         [ 2] 3681 	jp 90$ 
      00956E CD 91 9A         [ 4] 3682 3$:	call cmd_name
      009571 CD 94 BC         [ 4] 3683 	call prt_cmd_name
      009574 A6 20            [ 1] 3684 	ld a,#SPACE 
      009576 CD 82 26         [ 4] 3685 	call putc 
      009579 1E 03            [ 2] 3686 	ldw x,(XSAVE,sp)
      00957B 1C 00 02         [ 2] 3687 	addw x,#2
      00957E 20 BA            [ 2] 3688 	jra 1$
      009580 A1 0A            [ 1] 3689 4$: cp a,#TK_QSTR 
      009582 26 0D            [ 1] 3690 	jrne 5$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009584 72 BB 00 12      [ 2] 3691 	addw x,ptr16
      009588 CD 94 D0         [ 4] 3692 	call prt_quote 
      00958B 72 B0 00 12      [ 2] 3693 	subw x,ptr16  
      00958F 20 A9            [ 2] 3694 	jra 1$
      009591 A1 05            [ 1] 3695 5$:	cp a,#TK_VAR
      009593 26 1A            [ 1] 3696 	jrne 6$ 
      009595 72 DE 00 12      [ 5] 3697 	ldw x,([ptr16],x)
      009599 1D 00 22         [ 2] 3698 	subw x,#vars 
      00959C 9F               [ 1] 3699 	ld a,xl
      00959D 44               [ 1] 3700 	srl a 
      00959E AB 41            [ 1] 3701 	add a,#'A 
      0095A0 CD 82 26         [ 4] 3702 	call putc 
      0095A3 A6 20            [ 1] 3703 	ld a,#SPACE 
      0095A5 CD 82 26         [ 4] 3704 	call putc 
      0095A8 1E 03            [ 2] 3705 	ldw x,(XSAVE,sp)
      0095AA 1C 00 02         [ 2] 3706 	addw x,#2 
      0095AD 20 8B            [ 2] 3707 	jra 1$ 
      0095AF A1 02            [ 1] 3708 6$: cp a,#TK_ARRAY 
      0095B1 26 0A            [ 1] 3709 	jrne 7$
      0095B3 A6 40            [ 1] 3710 	ld a,#'@ 
      0095B5 CD 82 26         [ 4] 3711 	call putc 
      0095B8 1E 03            [ 2] 3712 	ldw x,(XSAVE,sp)
      0095BA CC 95 3A         [ 2] 3713 	jp 1$ 
      0095BD A1 04            [ 1] 3714 7$: cp a,#TK_INTGR 
      0095BF 26 14            [ 1] 3715 	jrne 8$
      0095C1 72 DE 00 12      [ 5] 3716 	ldw x,([ptr16],x)
      0095C5 CD 8A 08         [ 4] 3717 	call print_int
      0095C8 A6 20            [ 1] 3718 	ld a,#SPACE 
      0095CA CD 82 26         [ 4] 3719 	call putc 
      0095CD 1E 03            [ 2] 3720 	ldw x,(XSAVE,sp)
      0095CF 1C 00 02         [ 2] 3721 	addw x,#2 
      0095D2 CC 95 3A         [ 2] 3722 	jp 1$
      0095D5 A1 31            [ 1] 3723 8$: cp a,#TK_GT 
      0095D7 2B 1A            [ 1] 3724 	jrmi 9$
      0095D9 A1 35            [ 1] 3725 	cp a,#TK_NE 
      0095DB 22 16            [ 1] 3726 	jrugt 9$
      0095DD A0 31            [ 1] 3727 	sub a,#TK_GT  
      0095DF 48               [ 1] 3728 	sll a 
      0095E0 90 5F            [ 1] 3729 	clrw y 
      0095E2 90 97            [ 1] 3730 	ld yl,a 
      0095E4 72 A9 96 62      [ 2] 3731 	addw y,#relop_str 
      0095E8 90 FE            [ 2] 3732 	ldw y,(y)
      0095EA 93               [ 1] 3733 	ldw x,y 
      0095EB CD 82 38         [ 4] 3734 	call puts 
      0095EE 1E 03            [ 2] 3735 	ldw x,(XSAVE,sp)
      0095F0 CC 95 3A         [ 2] 3736 	jp 1$
      0095F3 A1 10            [ 1] 3737 9$: cp a,#TK_PLUS 
      0095F5 26 04            [ 1] 3738 	jrne 10$
      0095F7 A6 2B            [ 1] 3739 	ld a,#'+
      0095F9 20 46            [ 2] 3740 	jra 80$ 
      0095FB A1 11            [ 1] 3741 10$: cp a,#TK_MINUS
      0095FD 26 04            [ 1] 3742 	jrne 11$
      0095FF A6 2D            [ 1] 3743 	ld a,#'-
      009601 20 3E            [ 2] 3744 	jra 80$
      009603 A1 20            [ 1] 3745 11$: cp a,#TK_MULT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009605 2B 0E            [ 1] 3746 	jrmi 12$
      009607 A1 22            [ 1] 3747 	cp a,#TK_MOD 
      009609 22 0A            [ 1] 3748 	jrugt 12$
      00960B A0 20            [ 1] 3749 	sub a,#0x20
      00960D 5F               [ 1] 3750 	clrw x 
      00960E 97               [ 1] 3751 	ld xl,a 
      00960F 1C 96 5F         [ 2] 3752 	addw x,#mul_char 
      009612 F6               [ 1] 3753 	ld a,(x)
      009613 20 2C            [ 2] 3754 	jra 80$ 
      009615 A1 0B            [ 1] 3755 12$: cp a,#TK_LPAREN 
      009617 2B 0E            [ 1] 3756 	jrmi 13$
      009619 A1 0E            [ 1] 3757 	cp a,#TK_SHARP 
      00961B 22 0A            [ 1] 3758 	jrugt 13$
      00961D A0 0B            [ 1] 3759 	sub a,#TK_LPAREN
      00961F 5F               [ 1] 3760 	clrw x 
      009620 97               [ 1] 3761 	ld xl,a 
      009621 1C 96 5B         [ 2] 3762 	addw x,#single_char 
      009624 F6               [ 1] 3763 	ld a,(x)
      009625 20 1A            [ 2] 3764 	jra 80$
      009627 A1 03            [ 1] 3765 13$: cp a,#TK_CHAR 
      009629 26 14            [ 1] 3766 	jrne 14$
      00962B A6 5C            [ 1] 3767 	ld a,#'\
      00962D CD 82 26         [ 4] 3768 	call putc 
      009630 1E 03            [ 2] 3769 	ldw x,(XSAVE,sp)
      009632 72 D6 00 12      [ 4] 3770 	ld a,([ptr16],x)
      009636 5C               [ 1] 3771 	incw x 
      009637 1F 03            [ 2] 3772 	ldw (XSAVE,sp),x 
      009639 CD 82 26         [ 4] 3773 	call putc 
      00963C CC 95 3A         [ 2] 3774 	jp 1$ 
      00963F A6 3A            [ 1] 3775 14$: ld a,#':
      009641 CD 82 26         [ 4] 3776 80$: call putc 
      009644 1E 03            [ 2] 3777 	ldw x,(XSAVE,sp)
      009646 CC 95 3A         [ 2] 3778 	jp 1$ 
      009649                       3779 90$: 
      009649 A6 0D            [ 1] 3780 	ld a,#CR 
      00964B CD 82 26         [ 4] 3781 	call putc
      00964E 7B 02            [ 1] 3782 	ld a,(WIDTH_SAV,sp) 
      009650 C7 00 21         [ 1] 3783 	ld tab_width,a 
      009653 7B 01            [ 1] 3784 	ld a,(BASE_SAV,sp) 
      009655 C7 00 07         [ 1] 3785 	ld base,a
      0015D8                       3786 	_drop VSIZE 
      009658 5B 05            [ 2]    1     addw sp,#VSIZE 
      00965A 81               [ 4] 3787 	ret 	
      00965B 28 29 2C 23           3788 single_char: .byte '(',')',',','#'
      00965F 2A 2F 25              3789 mul_char: .byte '*','/','%'
      009662 96 6E 96 70 96 72 96  3790 relop_str: .word gt,equal,ge,lt,le,ne 
             75 96 77 96 7A
      00966E 3E 00                 3791 gt: .asciz ">"
      009670 3D 00                 3792 equal: .asciz "="
      009672 3E 3D 00              3793 ge: .asciz ">="
      009675 3C 00                 3794 lt: .asciz "<"
      009677 3C 3D 00              3795 le: .asciz "<="
      00967A 3C 3E 00              3796 ne:  .asciz "<>"
                                   3797 
                                   3798 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3799 ;---------------------------------
                                   3800 ; BASIC: PRINT|? arg_list 
                                   3801 ; print values from argument list
                                   3802 ;----------------------------------
                           000001  3803 	COMMA=1
                           000001  3804 	VSIZE=1
      00967D                       3805 print:
      00967D 4B 00            [ 1] 3806 push #0 ; local variable COMMA 
      00967F                       3807 reset_comma:
      00967F 0F 01            [ 1] 3808 	clr (COMMA,sp)
      009681                       3809 prt_loop:
      009681 CD 93 74         [ 4] 3810 	call relation 
      009684 A1 01            [ 1] 3811 	cp a,#TK_COLON 
      009686 27 5A            [ 1] 3812 	jreq print_exit   
      009688 A1 04            [ 1] 3813 	cp a,#TK_INTGR 
      00968A 26 05            [ 1] 3814 	jrne 0$ 
      00968C CD 8A 08         [ 4] 3815 	call print_int 
      00968F 20 EE            [ 2] 3816 	jra reset_comma
      009691                       3817 0$: 	
      009691 CD 88 6F         [ 4] 3818 	call next_token
      009694 A1 00            [ 1] 3819 	cp a,#TK_NONE 
      009696 27 4A            [ 1] 3820 	jreq print_exit 
      009698 A1 0A            [ 1] 3821 1$:	cp a,#TK_QSTR
      00969A 26 0E            [ 1] 3822 	jrne 2$   
      00969C CD 82 38         [ 4] 3823 	call puts
      00969F 5C               [ 1] 3824 	incw x 
      0096A0 72 B0 00 05      [ 2] 3825 	subw x,basicptr 
      0096A4 9F               [ 1] 3826 	ld a,xl 
      0096A5 C7 00 02         [ 1] 3827 	ld in,a  
      0096A8 20 D5            [ 2] 3828 	jra reset_comma
      0096AA A1 03            [ 1] 3829 2$: cp a,#TK_CHAR 
      0096AC 26 06            [ 1] 3830 	jrne 3$
      0096AE 9F               [ 1] 3831 	ld a,xl 
      0096AF CD 82 26         [ 4] 3832 	call putc 
      0096B2 20 CB            [ 2] 3833 	jra reset_comma 
      0096B4                       3834 3$: 	
      0096B4 A1 08            [ 1] 3835 	cp a,#TK_CFUNC 
      0096B6 26 07            [ 1] 3836 	jrne 4$ 
      0096B8 FD               [ 4] 3837 	call (x)
      0096B9 9F               [ 1] 3838 	ld a,xl 
      0096BA CD 82 26         [ 4] 3839 	call putc
      0096BD 20 C0            [ 2] 3840 	jra reset_comma 
      0096BF                       3841 4$: 
      0096BF A1 0D            [ 1] 3842 	cp a,#TK_COMMA 
      0096C1 26 05            [ 1] 3843 	jrne 5$
      0096C3 03 01            [ 1] 3844 	cpl (COMMA,sp) 
      0096C5 CC 96 81         [ 2] 3845 	jp prt_loop   
      0096C8                       3846 5$: 
      0096C8 A1 0E            [ 1] 3847 	cp a,#TK_SHARP
      0096CA 26 13            [ 1] 3848 	jrne 7$
      0096CC CD 88 6F         [ 4] 3849 	call next_token
      0096CF A1 04            [ 1] 3850 	cp a,#TK_INTGR 
      0096D1 27 03            [ 1] 3851 	jreq 6$
      0096D3 CC 87 8F         [ 2] 3852 	jp syntax_error 
      0096D6                       3853 6$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0096D6 9F               [ 1] 3854 	ld a,xl 
      0096D7 A4 0F            [ 1] 3855 	and a,#15 
      0096D9 C7 00 21         [ 1] 3856 	ld tab_width,a 
      0096DC CC 96 7F         [ 2] 3857 	jp reset_comma 
      0096DF                       3858 7$:	
      0096DF CD 8F FB         [ 4] 3859 	call unget_token
      0096E2                       3860 print_exit:
      0096E2 0D 01            [ 1] 3861 	tnz (COMMA,sp)
      0096E4 26 05            [ 1] 3862 	jrne 9$
      0096E6 A6 0D            [ 1] 3863 	ld a,#CR 
      0096E8 CD 82 26         [ 4] 3864     call putc 
      00166B                       3865 9$:	_drop VSIZE 
      0096EB 5B 01            [ 2]    1     addw sp,#VSIZE 
      0096ED 81               [ 4] 3866 	ret 
                                   3867 
                                   3868 ;----------------------
                                   3869 ; 'save_context' and
                                   3870 ; 'rest_context' must be 
                                   3871 ; called at the same 
                                   3872 ; call stack depth 
                                   3873 ; i.e. SP must have the 
                                   3874 ; save value at  
                                   3875 ; entry point of both 
                                   3876 ; routine. 
                                   3877 ;---------------------
                           000006  3878 	CTXT_SIZE=6 ; size of saved data 
                                   3879 ;--------------------
                                   3880 ; save current BASIC
                                   3881 ; interpreter context 
                                   3882 ; on cstack 
                                   3883 ;--------------------
      0096EE                       3884 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00166E                       3885 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00166E                       3886 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      00166E                       3887 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      00166E                       3888 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      00166E                       3889 save_context:
      0096EE CE 00 05         [ 2] 3890 	ldw x,basicptr 
      0096F1 1F 03            [ 2] 3891 	ldw (BPTR,sp),x
      0096F3 C6 00 02         [ 1] 3892 	ld a,in 
      0096F6 6B 07            [ 1] 3893 	ld (IN,sp),a
      0096F8 C6 00 04         [ 1] 3894 	ld a,count 
      0096FB 6B 08            [ 1] 3895 	ld (CNT,sp),a  
      0096FD 81               [ 4] 3896 	ret
                                   3897 
                                   3898 ;-----------------------
                                   3899 ; restore previously saved 
                                   3900 ; BASIC interpreter context 
                                   3901 ; from cstack 
                                   3902 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0096FE                       3903 rest_context:
      0096FE 1E 03            [ 2] 3904 	ldw x,(BPTR,sp)
      009700 CF 00 05         [ 2] 3905 	ldw basicptr,x 
      009703 7B 07            [ 1] 3906 	ld a,(IN,sp)
      009705 C7 00 02         [ 1] 3907 	ld in,a
      009708 7B 08            [ 1] 3908 	ld a,(CNT,sp)
      00970A C7 00 04         [ 1] 3909 	ld count,a  
      00970D 81               [ 4] 3910 	ret
                                   3911 
                                   3912 ;------------------------------------------
                                   3913 ; BASIC: INPUT [string],var[,[string],var]
                                   3914 ; input value in variables 
                                   3915 ; [string] optionally can be used as prompt 
                                   3916 ;-----------------------------------------
                           000001  3917 	CX_BPTR=1
                           000003  3918 	CX_LNO=3
                           000004  3919 	CX_IN=4
                           000005  3920 	CX_CNT=5
                           000006  3921 	SKIP=6
                           000007  3922 	VSIZE=7
      00970E                       3923 input_var:
      00970E 72 00 00 20 05   [ 2] 3924 	btjt flags,#FRUN,1$ 
      009713 A6 06            [ 1] 3925 	ld a,#ERR_RUN_ONLY 
      009715 CC 87 91         [ 2] 3926 	jp tb_error 
      001698                       3927 1$:	_vars VSIZE 
      009718 52 07            [ 2]    1     sub sp,#VSIZE 
      00971A                       3928 input_loop:
      00971A 0F 06            [ 1] 3929 	clr (SKIP,sp)
      00971C CD 88 6F         [ 4] 3930 	call next_token 
      00971F A1 00            [ 1] 3931 	cp a,#TK_NONE 
      009721 27 5C            [ 1] 3932 	jreq input_exit 
      009723 A1 0A            [ 1] 3933 	cp a,#TK_QSTR 
      009725 26 08            [ 1] 3934 	jrne 1$ 
      009727 CD 82 38         [ 4] 3935 	call puts 
      00972A 03 06            [ 1] 3936 	cpl (SKIP,sp)
      00972C CD 88 6F         [ 4] 3937 	call next_token 
      00972F A1 05            [ 1] 3938 1$: cp a,#TK_VAR  
      009731 27 03            [ 1] 3939 	jreq 2$ 
      009733 CC 87 8F         [ 2] 3940 	jp syntax_error
      009736 CD 90 01         [ 4] 3941 2$:	call dpush 
      009739 0D 06            [ 1] 3942 	tnz (SKIP,sp)
      00973B 26 0F            [ 1] 3943 	jrne 21$ 
      00973D A6 3A            [ 1] 3944 	ld a,#':
      00973F C7 17 19         [ 1] 3945 	ld pad+1,a 
      009742 72 5F 17 1A      [ 1] 3946 	clr pad+2
      009746 AE 17 18         [ 2] 3947 	ldw x,#pad 
      009749 CD 82 38         [ 4] 3948 	call puts   
      00974C                       3949 21$:
      00974C CD 96 EE         [ 4] 3950 	call save_context 
      00974F AE 16 C8         [ 2] 3951 	ldw x,#tib 
      009752 CF 00 05         [ 2] 3952 	ldw basicptr,x  
      009755 72 5F 00 04      [ 1] 3953 	clr count  
      009759 CD 8A F6         [ 4] 3954 	call readln 
      00975C 72 5F 00 02      [ 1] 3955 	clr in 
      009760 CD 93 74         [ 4] 3956 	call relation 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009763 A1 04            [ 1] 3957 	cp a,#TK_INTGR
      009765 27 03            [ 1] 3958 	jreq 3$ 
      009767 CC 87 8F         [ 2] 3959 	jp syntax_error
      00976A CD 90 01         [ 4] 3960 3$: call dpush 
      00976D CD 90 68         [ 4] 3961 	call store 
      009770 CD 96 FE         [ 4] 3962 	call rest_context
      009773 CD 88 6F         [ 4] 3963 	call next_token 
      009776 A1 0D            [ 1] 3964 	cp a,#TK_COMMA 
      009778 26 02            [ 1] 3965 	jrne 4$
      00977A 20 9E            [ 2] 3966 	jra input_loop 
      00977C CD 8F FB         [ 4] 3967 4$:	call unget_token 
      00977F                       3968 input_exit:
      0016FF                       3969 	_drop VSIZE 
      00977F 5B 07            [ 2]    1     addw sp,#VSIZE 
      009781 81               [ 4] 3970 	ret 
                                   3971 
                                   3972 
                                   3973 ;---------------------
                                   3974 ; BASIC: REMARK | ' 
                                   3975 ; skip comment to end of line 
                                   3976 ;---------------------- 
      009782                       3977 rem:
      009782 55 00 02 00 04   [ 1] 3978  	mov count,in 
      009787 81               [ 4] 3979 	ret 
                                   3980 
                                   3981 ;---------------------
                                   3982 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3983 ; read in loop 'addr'  
                                   3984 ; apply & 'mask' to value 
                                   3985 ; loop while result==0.  
                                   3986 ; if 'xor_mask' given 
                                   3987 ; apply ^ in second  
                                   3988 ; loop while result==0 
                                   3989 ;---------------------
                           000001  3990 	XMASK=1 
                           000002  3991 	MASK=2
                           000003  3992 	ADDR=3
                           000004  3993 	VSIZE=4
      009788                       3994 wait: 
      001708                       3995 	_vars VSIZE
      009788 52 04            [ 2]    1     sub sp,#VSIZE 
      00978A 0F 01            [ 1] 3996 	clr (XMASK,sp) 
      00978C CD 92 2E         [ 4] 3997 	call arg_list 
      00978F A1 02            [ 1] 3998 	cp a,#2
      009791 24 03            [ 1] 3999 	jruge 0$
      009793 CC 87 8F         [ 2] 4000 	jp syntax_error 
      009796 A1 03            [ 1] 4001 0$:	cp a,#3
      009798 25 06            [ 1] 4002 	jrult 1$
      00979A CD 90 0E         [ 4] 4003 	call dpop 
      00979D 9F               [ 1] 4004 	ld a,xl
      00979E 6B 01            [ 1] 4005 	ld (XMASK,sp),a 
      0097A0 CD 90 0E         [ 4] 4006 1$: call dpop ; mask 
      0097A3 9F               [ 1] 4007 	ld a,xl 
      0097A4 6B 02            [ 1] 4008 	ld (MASK,sp),a 
      0097A6 CD 90 0E         [ 4] 4009 	call dpop ; address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0097A9 F6               [ 1] 4010 2$:	ld a,(x)
      0097AA 14 02            [ 1] 4011 	and a,(MASK,sp)
      0097AC 18 01            [ 1] 4012 	xor a,(XMASK,sp)
      0097AE 27 F9            [ 1] 4013 	jreq 2$ 
      001730                       4014 	_drop VSIZE 
      0097B0 5B 04            [ 2]    1     addw sp,#VSIZE 
      0097B2 81               [ 4] 4015 	ret 
                                   4016 
                                   4017 ;---------------------
                                   4018 ; BASIC: BSET addr,mask
                                   4019 ; set bits at 'addr' corresponding 
                                   4020 ; to those of 'mask' that are at 1.
                                   4021 ; arguments:
                                   4022 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4023 ;   mask        mask|addr
                                   4024 ; output:
                                   4025 ;	none 
                                   4026 ;--------------------------
      0097B3                       4027 bit_set:
      0097B3 CD 92 2E         [ 4] 4028 	call arg_list 
      0097B6 A1 02            [ 1] 4029 	cp a,#2	 
      0097B8 27 03            [ 1] 4030 	jreq 1$ 
      0097BA CC 87 8F         [ 2] 4031 	jp syntax_error
      0097BD                       4032 1$: 
      0097BD CD 90 0E         [ 4] 4033 	call dpop ; mask 
      0097C0 9F               [ 1] 4034 	ld a,xl 
      0097C1 CD 90 0E         [ 4] 4035 	call dpop ; addr  
      0097C4 FA               [ 1] 4036 	or a,(x)
      0097C5 F7               [ 1] 4037 	ld (x),a
      0097C6 81               [ 4] 4038 	ret 
                                   4039 
                                   4040 ;---------------------
                                   4041 ; BASIC: BRES addr,mask
                                   4042 ; reset bits at 'addr' corresponding 
                                   4043 ; to those of 'mask' that are at 1.
                                   4044 ; arguments:
                                   4045 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4046 ;   mask	    ~mask&*addr  
                                   4047 ; output:
                                   4048 ;	none 
                                   4049 ;--------------------------
      0097C7                       4050 bit_reset:
      0097C7 CD 92 2E         [ 4] 4051 	call arg_list 
      0097CA A1 02            [ 1] 4052 	cp a,#2  
      0097CC 27 03            [ 1] 4053 	jreq 1$ 
      0097CE CC 87 8F         [ 2] 4054 	jp syntax_error
      0097D1                       4055 1$: 
      0097D1 CD 90 0E         [ 4] 4056 	call dpop ; mask 
      0097D4 9F               [ 1] 4057 	ld a,xl 
      0097D5 43               [ 1] 4058 	cpl a 
      0097D6 CD 90 0E         [ 4] 4059 	call dpop ; addr  
      0097D9 F4               [ 1] 4060 	and a,(x)
      0097DA F7               [ 1] 4061 	ld (x),a 
      0097DB 81               [ 4] 4062 	ret 
                                   4063 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4064 ;---------------------
                                   4065 ; BASIC: BRES addr,mask
                                   4066 ; toggle bits at 'addr' corresponding 
                                   4067 ; to those of 'mask' that are at 1.
                                   4068 ; arguments:
                                   4069 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4070 ;   mask	    mask^*addr  
                                   4071 ; output:
                                   4072 ;	none 
                                   4073 ;--------------------------
      0097DC                       4074 bit_toggle:
      0097DC CD 92 2E         [ 4] 4075 	call arg_list 
      0097DF A1 02            [ 1] 4076 	cp a,#2 
      0097E1 27 03            [ 1] 4077 	jreq 1$ 
      0097E3 CC 87 8F         [ 2] 4078 	jp syntax_error
      0097E6 CD 90 0E         [ 4] 4079 1$: call dpop ; mask 
      0097E9 9F               [ 1] 4080 	ld a,xl 
      0097EA CD 90 0E         [ 4] 4081 	call dpop ; addr  
      0097ED F8               [ 1] 4082 	xor a,(x)
      0097EE F7               [ 1] 4083 	ld (x),a 
      0097EF 81               [ 4] 4084 	ret 
                                   4085 
                                   4086 
                                   4087 ;---------------------
                                   4088 ; BASIC: BTEST(addr,bit)
                                   4089 ; return bit value at 'addr' 
                                   4090 ; bit is in range {0..7}.
                                   4091 ; arguments:
                                   4092 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4093 ;   bit 	    bit position {0..7}  
                                   4094 ; output:
                                   4095 ;	none 
                                   4096 ;--------------------------
      0097F0                       4097 bit_test:
      0097F0 CD 92 52         [ 4] 4098 	call func_args 
      0097F3 A1 02            [ 1] 4099 	cp a,#2
      0097F5 27 03            [ 1] 4100 	jreq 0$
      0097F7 CC 87 8F         [ 2] 4101 	jp syntax_error
      0097FA                       4102 0$:	
      0097FA CD 90 0E         [ 4] 4103 	call dpop 
      0097FD 9F               [ 1] 4104 	ld a,xl 
      0097FE A4 07            [ 1] 4105 	and a,#7
      009800 88               [ 1] 4106 	push a 
      009801 A6 01            [ 1] 4107 	ld a,#1 
      009803 0D 01            [ 1] 4108 1$: tnz (1,sp)
      009805 27 05            [ 1] 4109 	jreq 2$
      009807 48               [ 1] 4110 	sll a 
      009808 0A 01            [ 1] 4111 	dec (1,sp)
      00980A 20 F7            [ 2] 4112 	jra 1$
      00980C CD 90 0E         [ 4] 4113 2$: call dpop 
      00980F F4               [ 1] 4114 	and a,(x)
      009810 27 02            [ 1] 4115 	jreq 3$
      009812 A6 01            [ 1] 4116 	ld a,#1 
      009814 5F               [ 1] 4117 3$:	clrw x 
      009815 97               [ 1] 4118 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009816 A6 04            [ 1] 4119 	ld a,#TK_INTGR
      001798                       4120 	_drop 1 
      009818 5B 01            [ 2]    1     addw sp,#1 
      00981A 81               [ 4] 4121 	ret
                                   4122 
                                   4123 
                                   4124 ;--------------------
                                   4125 ; BASIC: POKE addr,byte
                                   4126 ; put a byte at addr 
                                   4127 ;--------------------
      00981B                       4128 poke:
      00981B CD 92 2E         [ 4] 4129 	call arg_list 
      00981E A1 02            [ 1] 4130 	cp a,#2
      009820 27 03            [ 1] 4131 	jreq 1$
      009822 CC 87 8F         [ 2] 4132 	jp syntax_error
      009825                       4133 1$:	
      009825 CD 90 0E         [ 4] 4134 	call dpop 
      009828 9F               [ 1] 4135     ld a,xl 
      009829 CD 90 0E         [ 4] 4136 	call dpop 
      00982C F7               [ 1] 4137 	ld (x),a 
      00982D 81               [ 4] 4138 	ret 
                                   4139 
                                   4140 ;-----------------------
                                   4141 ; BASIC: PEEK(addr)
                                   4142 ; get the byte at addr 
                                   4143 ; input:
                                   4144 ;	none 
                                   4145 ; output:
                                   4146 ;	X 		value 
                                   4147 ;-----------------------
      00982E                       4148 peek:
      00982E CD 92 52         [ 4] 4149 	call func_args
      009831 A1 01            [ 1] 4150 	cp a,#1
      009833 27 03            [ 1] 4151 	jreq 1$
      009835 CC 87 8F         [ 2] 4152 	jp syntax_error
      009838 CD 90 0E         [ 4] 4153 1$:	call dpop 
      00983B F6               [ 1] 4154 	ld a,(x)
      00983C 5F               [ 1] 4155 	clrw x 
      00983D 97               [ 1] 4156 	ld xl,a 
      00983E A6 04            [ 1] 4157 	ld a,#TK_INTGR
      009840 81               [ 4] 4158 	ret 
                                   4159 
      009841                       4160 if: 
      009841 CD 93 74         [ 4] 4161 	call relation 
      009844 A1 04            [ 1] 4162 	cp a,#TK_INTGR
      009846 27 03            [ 1] 4163 	jreq 1$ 
      009848 CC 87 8F         [ 2] 4164 	jp syntax_error
      00984B 4F               [ 1] 4165 1$:	clr a 
      00984C 5D               [ 2] 4166 	tnzw x 
      00984D 26 05            [ 1] 4167 	jrne 9$  
                                   4168 ;skip to next line
      00984F 55 00 04 00 02   [ 1] 4169 	mov in,count
      009854 81               [ 4] 4170 9$:	ret 
                                   4171 
                                   4172 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4173 ; BASIC: FOR var=expr 
                                   4174 ; set variable to expression 
                                   4175 ; leave variable address 
                                   4176 ; on dstack and set
                                   4177 ; FFOR bit in 'flags'
                                   4178 ;-----------------
                           000001  4179 	RETL1=1
                           000003  4180 	INW=3
                           000005  4181 	BPTR=5
      009855                       4182 for: ; { -- var_addr }
      009855 A6 05            [ 1] 4183 	ld a,#TK_VAR 
      009857 CD 92 21         [ 4] 4184 	call expect
      00985A CD 90 01         [ 4] 4185 	call dpush 
      00985D CD 94 1B         [ 4] 4186 	call let02 
      009860 72 14 00 20      [ 1] 4187 	bset flags,#FFOR 
                                   4188 ; open space on cstack for BPTR and INW 
      009864 85               [ 2] 4189 	popw x ; call return address 
      0017E5                       4190 	_vars 4
      009865 52 04            [ 2]    1     sub sp,#4 
      009867 89               [ 2] 4191 	pushw x  ; RETL1 
      009868 5F               [ 1] 4192 	clrw x 
      009869 1F 05            [ 2] 4193 	ldw (BPTR,sp),x 
      00986B 1F 03            [ 2] 4194 	ldw (INW,sp),x 
      00986D CD 88 6F         [ 4] 4195 	call next_token 
      009870 A1 06            [ 1] 4196 	cp a,#TK_CMD 
      009872 27 03            [ 1] 4197 	jreq 1$
      009874 CC 87 8F         [ 2] 4198 	jp syntax_error
      009877                       4199 1$:  
      009877 A3 98 7F         [ 2] 4200 	cpw x,#to 
      00987A 27 03            [ 1] 4201 	jreq to
      00987C CC 87 8F         [ 2] 4202 	jp syntax_error 
                                   4203 
                                   4204 ;-----------------------------------
                                   4205 ; BASIC: TO expr 
                                   4206 ; second part of FOR loop initilization
                                   4207 ; leave limit on dstack and set 
                                   4208 ; FTO bit in 'flags'
                                   4209 ;-----------------------------------
      00987F                       4210 to: ; { var_addr -- var_addr limit step }
      00987F 72 04 00 20 03   [ 2] 4211 	btjt flags,#FFOR,1$
      009884 CC 87 8F         [ 2] 4212 	jp syntax_error
      009887 CD 93 74         [ 4] 4213 1$: call relation  
      00988A A1 04            [ 1] 4214 	cp a,#TK_INTGR 
      00988C 27 03            [ 1] 4215 	jreq 2$ 
      00988E CC 87 8F         [ 2] 4216 	jp syntax_error
      009891                       4217 2$: 
      009891 CD 90 01         [ 4] 4218     call dpush ; limit
      009894 CE 00 01         [ 2] 4219 	ldw x,in.w 
      009897 CD 88 6F         [ 4] 4220 	call next_token
      00989A A1 00            [ 1] 4221 	cp a,#TK_NONE  
      00989C 27 0C            [ 1] 4222 	jreq 4$ 
      00989E A1 06            [ 1] 4223 	cp a,#TK_CMD
      0098A0 26 05            [ 1] 4224 	jrne 3$
      0098A2 A3 98 AF         [ 2] 4225 	cpw x,#step 
      0098A5 27 08            [ 1] 4226 	jreq step
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0098A7                       4227 3$:	
      0098A7 CD 8F FB         [ 4] 4228 	call unget_token   	 
      0098AA                       4229 4$:	
      0098AA AE 00 01         [ 2] 4230 	ldw x,#1   ; default step  
      0098AD 20 12            [ 2] 4231 	jra store_loop_addr 
                                   4232 
                                   4233 
                                   4234 ;----------------------------------
                                   4235 ; BASIC: STEP expr 
                                   4236 ; optional third par of FOR loop
                                   4237 ; initialization. 	
                                   4238 ;------------------------------------
      0098AF                       4239 step: ; {var limit -- var limit step}
      0098AF 72 04 00 20 03   [ 2] 4240 	btjt flags,#FFOR,1$
      0098B4 CC 87 8F         [ 2] 4241 	jp syntax_error
      0098B7 CD 93 74         [ 4] 4242 1$: call relation
      0098BA A1 04            [ 1] 4243 	cp a,#TK_INTGR
      0098BC 27 03            [ 1] 4244 	jreq store_loop_addr  
      0098BE CC 87 8F         [ 2] 4245 	jp syntax_error
                                   4246 ; leave loop back entry point on cstack 
                                   4247 ; cstack is 2 call deep from interp_loop
      0098C1                       4248 store_loop_addr:
      0098C1 CD 90 01         [ 4] 4249 	call dpush 
      0098C4 CE 00 05         [ 2] 4250 	ldw x,basicptr  
      0098C7 1F 05            [ 2] 4251 	ldw (BPTR,sp),x 
      0098C9 CE 00 01         [ 2] 4252 	ldw x,in.w 
      0098CC 1F 03            [ 2] 4253 	ldw (INW,sp),x   
      0098CE 72 15 00 20      [ 1] 4254 	bres flags,#FFOR 
      0098D2 72 5C 00 1D      [ 1] 4255 	inc loop_depth  
      0098D6 81               [ 4] 4256 	ret 
                                   4257 
                                   4258 ;--------------------------------
                                   4259 ; BASIC: NEXT var 
                                   4260 ; FOR loop control 
                                   4261 ; increment variable with step 
                                   4262 ; and compare with limit 
                                   4263 ; loop if threshold not crossed.
                                   4264 ; else clean both stacks. 
                                   4265 ; and decrement 'loop_depth' 
                                   4266 ;--------------------------------
      0098D7                       4267 next: ; {var limit step -- [var limit step ] }
      0098D7 72 5D 00 1D      [ 1] 4268 	tnz loop_depth 
      0098DB 26 03            [ 1] 4269 	jrne 1$ 
      0098DD CC 87 8F         [ 2] 4270 	jp syntax_error 
      0098E0                       4271 1$: 
      0098E0 A6 05            [ 1] 4272 	ld a,#TK_VAR 
      0098E2 CD 92 21         [ 4] 4273 	call expect
                                   4274 ; check for good variable after NEXT 	 
      0098E5 90 93            [ 1] 4275 	ldw y,x 
      0098E7 AE 00 04         [ 2] 4276 	ldw x,#4  
      0098EA 72 D3 00 17      [ 4] 4277 	cpw y,([dstkptr],x) ; compare variables address 
      0098EE 27 03            [ 1] 4278 	jreq 2$  
      0098F0 CC 87 8F         [ 2] 4279 	jp syntax_error ; not the good one 
      0098F3                       4280 2$: ; increment variable 
      0098F3 93               [ 1] 4281 	ldw x,y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0098F4 FE               [ 2] 4282 	ldw x,(x)  ; get var value 
      0098F5 CF 00 09         [ 2] 4283 	ldw acc16,x 
      0098F8 72 CE 00 17      [ 5] 4284 	ldw x,[dstkptr] ; step
      0098FC 72 BB 00 09      [ 2] 4285 	addw x,acc16 ; var+step 
      009900 90 FF            [ 2] 4286 	ldw (y),x ; save var new value 
                                   4287 ; compare with limit 
      009902 90 93            [ 1] 4288 	ldw y,x 
      009904 72 CE 00 17      [ 5] 4289 	ldw x,[dstkptr] ; step in x 
      009908 5D               [ 2] 4290 	tnzw x  
      009909 2A 0B            [ 1] 4291 	jrpl 4$ ; positive step 
                                   4292 ;negative step 
      00990B AE 00 02         [ 2] 4293 	ldw x,#2
      00990E 72 D3 00 17      [ 4] 4294 	cpw y,([dstkptr],x)
      009912 2F 20            [ 1] 4295 	jrslt loop_done
      009914 20 09            [ 2] 4296 	jra loop_back 
      009916                       4297 4$: ; positive step
      009916 AE 00 02         [ 2] 4298 	ldw x,#2 
      009919 72 D3 00 17      [ 4] 4299 	cpw y,([dstkptr],x)
      00991D 2C 15            [ 1] 4300 	jrsgt loop_done
      00991F                       4301 loop_back:
      00991F 1E 05            [ 2] 4302 	ldw x,(BPTR,sp)
      009921 CF 00 05         [ 2] 4303 	ldw basicptr,x 
      009924 72 01 00 20 05   [ 2] 4304 	btjf flags,#FRUN,1$ 
      009929 E6 02            [ 1] 4305 	ld a,(2,x)
      00992B C7 00 04         [ 1] 4306 	ld count,a
      00992E 1E 03            [ 2] 4307 1$:	ldw x,(INW,sp)
      009930 CF 00 01         [ 2] 4308 	ldw in.w,x 
      009933 81               [ 4] 4309 	ret 
      009934                       4310 loop_done:
                                   4311 	; remove var limit step on dstack 
      009934 CE 00 17         [ 2] 4312 	ldw x,dstkptr 
      009937 1C 00 06         [ 2] 4313 	addw x,#3*CELL_SIZE
      00993A CF 00 17         [ 2] 4314 	ldw dstkptr,x 
                                   4315 	; remove 2 return address on cstack 
      00993D 85               [ 2] 4316 	popw x
      0018BE                       4317 	_drop 4
      00993E 5B 04            [ 2]    1     addw sp,#4 
      009940 89               [ 2] 4318 	pushw x 
      009941 72 5A 00 1D      [ 1] 4319 	dec loop_depth 
      009945 81               [ 4] 4320 	ret 
                                   4321 
                                   4322 
                                   4323 ;------------------------
                                   4324 ; BASIC: GOTO line# 
                                   4325 ; jump to line# 
                                   4326 ; here cstack is 2 call deep from interp_loop 
                                   4327 ;------------------------
      009946                       4328 goto:
      009946 72 00 00 20 06   [ 2] 4329 	btjt flags,#FRUN,0$ 
      00994B A6 06            [ 1] 4330 	ld a,#ERR_RUN_ONLY
      00994D CC 87 91         [ 2] 4331 	jp tb_error 
      009950 81               [ 4] 4332 	ret 
      009951 20 23            [ 2] 4333 0$:	jra go_common
                                   4334 
                                   4335 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4336 ; BASIC: GOSUB line#
                                   4337 ; basic subroutine call
                                   4338 ; actual line# and basicptr 
                                   4339 ; are saved on cstack
                                   4340 ; here cstack is 2 call deep from interp_loop 
                                   4341 ;--------------------
                           000003  4342 	GOS_RET=3
      009953                       4343 gosub:
      009953 72 00 00 20 06   [ 2] 4344 	btjt flags,#FRUN,0$ 
      009958 A6 06            [ 1] 4345 	ld a,#ERR_RUN_ONLY
      00995A CC 87 91         [ 2] 4346 	jp tb_error 
      00995D 81               [ 4] 4347 	ret 
      00995E 85               [ 2] 4348 0$:	popw x 
      00995F 52 02            [ 2] 4349 	sub sp,#2 
      009961 89               [ 2] 4350 	pushw x 
      009962 CE 00 05         [ 2] 4351 	ldw x,basicptr
      009965 E6 02            [ 1] 4352 	ld a,(2,x)
      009967 AB 03            [ 1] 4353 	add a,#3 
      009969 C7 00 0A         [ 1] 4354 	ld acc8,a 
      00996C 72 5F 00 09      [ 1] 4355 	clr acc16 
      009970 72 BB 00 09      [ 2] 4356 	addw x,acc16
      009974 1F 03            [ 2] 4357 	ldw (GOS_RET,sp),x 
      009976                       4358 go_common: 
      009976 CD 93 74         [ 4] 4359 	call relation 
      009979 A1 04            [ 1] 4360 	cp a,#TK_INTGR
      00997B 27 03            [ 1] 4361 	jreq 1$ 
      00997D CC 87 8F         [ 2] 4362 	jp syntax_error
      009980                       4363 1$: 
      009980 CD 83 68         [ 4] 4364 	call search_lineno  
      009983 5D               [ 2] 4365 	tnzw x 
      009984 26 05            [ 1] 4366 	jrne 2$ 
      009986 A6 05            [ 1] 4367 	ld a,#ERR_NO_LINE 
      009988 CC 87 91         [ 2] 4368 	jp tb_error 
      00998B                       4369 2$: 
      00998B CF 00 05         [ 2] 4370 	ldw basicptr,x 
      00998E E6 02            [ 1] 4371 	ld a,(2,x)
      009990 C7 00 04         [ 1] 4372 	ld count,a 
      009993 35 03 00 02      [ 1] 4373 	mov in,#3 
      009997 81               [ 4] 4374 	ret 
                                   4375 
                                   4376 ;------------------------
                                   4377 ; BASIC: RETURN 
                                   4378 ; exit from a subroutine 
                                   4379 ; cstack is 2 level deep from interp_loop 
                                   4380 ;------------------------
      009998                       4381 return:
      009998 72 00 00 20 05   [ 2] 4382 	btjt flags,#FRUN,0$ 
      00999D A6 06            [ 1] 4383 	ld a,#ERR_RUN_ONLY
      00999F CC 87 91         [ 2] 4384 	jp tb_error 
      0099A2                       4385 0$:	
      0099A2 1E 03            [ 2] 4386 	ldw x,(GOS_RET,sp) 
      0099A4 CF 00 05         [ 2] 4387 	ldw basicptr,x 
      0099A7 E6 02            [ 1] 4388 	ld a,(2,x)
      0099A9 AB 03            [ 1] 4389 	add a,#3 
      0099AB C7 00 04         [ 1] 4390 	ld count,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0099AE 35 03 00 02      [ 1] 4391 	mov in,#3
      0099B2 4F               [ 1] 4392 	clr a 
      0099B3 85               [ 2] 4393 	popw x 
      001934                       4394 	_drop 2
      0099B4 5B 02            [ 2]    1     addw sp,#2 
      0099B6 89               [ 2] 4395 	pushw x
      0099B7 81               [ 4] 4396 	ret  
                                   4397 
                                   4398 
                                   4399 ;----------------------------------
                                   4400 ; BASIC: RUN
                                   4401 ; run BASIC program in RAM
                                   4402 ;----------------------------------- 
      0099B8                       4403 run: 
      0099B8 72 01 00 20 02   [ 2] 4404 	btjf flags,#FRUN,0$  
      0099BD 4F               [ 1] 4405 	clr a 
      0099BE 81               [ 4] 4406 	ret
      0099BF                       4407 0$: 
      0099BF 72 09 00 20 12   [ 2] 4408 	btjf flags,#FBREAK,1$
      001944                       4409 	_drop 2 
      0099C4 5B 02            [ 2]    1     addw sp,#2 
      0099C6 CD 96 FE         [ 4] 4410 	call rest_context
      001949                       4411 	_drop CTXT_SIZE 
      0099C9 5B 06            [ 2]    1     addw sp,#CTXT_SIZE 
      0099CB 72 19 00 20      [ 1] 4412 	bres flags,#FBREAK 
      0099CF 72 10 00 20      [ 1] 4413 	bset flags,#FRUN 
      0099D3 CC 88 3F         [ 2] 4414 	jp interp_loop 
      0099D6 CE 00 19         [ 2] 4415 1$:	ldw x,txtbgn
      0099D9 C3 00 1B         [ 2] 4416 	cpw x,txtend 
      0099DC 2B 02            [ 1] 4417 	jrmi 2$ 
      0099DE 4F               [ 1] 4418 	clr a 
      0099DF 81               [ 4] 4419 	ret 
      0099E0 CD 93 EF         [ 4] 4420 2$: call ubound 
      001963                       4421 	_drop 2 
      0099E3 5B 02            [ 2]    1     addw sp,#2 
      0099E5 CE 00 19         [ 2] 4422 	ldw x,txtbgn 
      0099E8 CF 00 05         [ 2] 4423 	ldw basicptr,x 
      0099EB E6 02            [ 1] 4424 	ld a,(2,x)
      0099ED C7 00 04         [ 1] 4425 	ld count,a
      0099F0 35 03 00 02      [ 1] 4426 	mov in,#3	
      0099F4 72 10 00 20      [ 1] 4427 	bset flags,#FRUN 
      0099F8 CC 88 3F         [ 2] 4428 	jp interp_loop 
                                   4429 
                                   4430 
                                   4431 ;----------------------
                                   4432 ; BASIC: STOP 
                                   4433 ; stop running program
                                   4434 ;---------------------- 
      0099FB                       4435 stop: 
                                   4436 ; clean dstack and cstack 
      0099FB AE 17 FF         [ 2] 4437 	ldw x,#STACK_EMPTY 
      0099FE 94               [ 1] 4438 	ldw sp,x 
      0099FF 72 11 00 20      [ 1] 4439 	bres flags,#FRUN 
      009A03 72 19 00 20      [ 1] 4440 	bres flags,#FBREAK
      009A07 CC 87 E3         [ 2] 4441 	jp warm_start
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4442 
                                   4443 ;-----------------------
                                   4444 ; BASIC BEEP expr1,expr2
                                   4445 ; used MCU internal beeper 
                                   4446 ; to produce a sound
                                   4447 ; arguments:
                                   4448 ;    expr1   frequency  (expr1%32)
                                   4449 ;    expr2   duration msec.
                                   4450 ;---------------------------
      009A0A                       4451 beep:
      009A0A CD 92 2E         [ 4] 4452 	call arg_list 
      009A0D A1 02            [ 1] 4453 	cp a,#2 
      009A0F 27 03            [ 1] 4454 	jreq 1$
      009A11 CC 87 8F         [ 2] 4455 	jp syntax_error 
      009A14                       4456 1$: 
      009A14 CE 00 17         [ 2] 4457 	ldw x,dstkptr 
      009A17 EE 02            [ 2] 4458 	ldw x,(2,x);frequency 
      009A19 A6 1F            [ 1] 4459 	ld a,#31
      009A1B 62               [ 2] 4460 	div x,a 
      009A1C C7 50 F3         [ 1] 4461 	ld BEEP_CSR,a	
      009A1F 72 1A 50 F3      [ 1] 4462 	bset BEEP_CSR,#5 
      009A23 CD 90 0E         [ 4] 4463 	call dpop 
      009A26 CD 9E B1         [ 4] 4464 	call pause02 
      009A29 CD 90 35         [ 4] 4465 	call ddrop 
      009A2C A6 1F            [ 1] 4466 	ld a,#0x1f
      009A2E C7 50 F3         [ 1] 4467 	ld BEEP_CSR,a 
      009A31 81               [ 4] 4468 	ret 
                                   4469 
                                   4470 ;-------------------------------
                                   4471 ; BASIC: PWRADC 0|1 [,divisor]  
                                   4472 ; disable/enanble ADC 
                                   4473 ;-------------------------------
      009A32                       4474 power_adc:
      009A32 CD 92 2E         [ 4] 4475 	call arg_list 
      009A35 A1 02            [ 1] 4476 	cp a,#2	
      009A37 27 0D            [ 1] 4477 	jreq 1$
      009A39 A1 01            [ 1] 4478 	cp a,#1 
      009A3B 27 03            [ 1] 4479 	jreq 0$ 
      009A3D CC 87 8F         [ 2] 4480 	jp syntax_error 
      009A40 AE 00 00         [ 2] 4481 0$: ldw x,#0
      009A43 CD 90 01         [ 4] 4482 	call dpush 
      009A46 AE 00 02         [ 2] 4483 1$: ldw x,#2
      009A49 72 DE 00 17      [ 5] 4484 	ldw x,([dstkptr],x) ; on|off
      009A4D 5D               [ 2] 4485 	tnzw x 
      009A4E 27 20            [ 1] 4486 	jreq 2$ 
      009A50 72 CE 00 17      [ 5] 4487 	ldw x,[dstkptr] ; divisor 
      009A54 9F               [ 1] 4488 	ld a,xl
      009A55 A4 07            [ 1] 4489 	and a,#7
      009A57 4E               [ 1] 4490 	swap a 
      009A58 C7 54 01         [ 1] 4491 	ld ADC_CR1,a
      009A5B 72 16 54 02      [ 1] 4492 	bset ADC_CR2,#ADC_CR2_ALIGN ; right 
      009A5F 72 16 50 CA      [ 1] 4493 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009A63 72 10 54 01      [ 1] 4494 	bset ADC_CR1,#ADC_CR1_ADON 
      0019E7                       4495 	_usec_dly 7 
      009A67 AE 00 1B         [ 2]    1     ldw x,#(16*7-2)/4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009A6A 5A               [ 2]    2     decw x
      009A6B 9D               [ 1]    3     nop 
      009A6C 26 FA            [ 1]    4     jrne .-4
      009A6E 20 08            [ 2] 4496 	jra 3$
      009A70 72 11 54 01      [ 1] 4497 2$: bres ADC_CR1,#ADC_CR1_ADON
      009A74 72 17 50 CA      [ 1] 4498 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      009A78 AE 00 02         [ 2] 4499 3$:	ldw x,#2
      009A7B CD 90 72         [ 4] 4500 	call ddrop_n 
      009A7E 81               [ 4] 4501 	ret
                                   4502 
                                   4503 ;-----------------------------
                                   4504 ; BASIC: RDADC(channel)
                                   4505 ; read adc channel 
                                   4506 ; output:
                                   4507 ;   A 		TK_INTGR 
                                   4508 ;   X 		value 
                                   4509 ;-----------------------------
      009A7F                       4510 read_adc:
      009A7F CD 92 52         [ 4] 4511 	call func_args 
      009A82 A1 01            [ 1] 4512 	cp a,#1 
      009A84 27 03            [ 1] 4513 	jreq 1$
      009A86 CC 87 8F         [ 2] 4514 	jp syntax_error
      009A89 CD 90 0E         [ 4] 4515 1$: call dpop 
      009A8C A3 00 10         [ 2] 4516 	cpw x,#16 
      009A8F 25 05            [ 1] 4517 	jrult 2$
      009A91 A6 0A            [ 1] 4518 	ld a,#ERR_BAD_VALUE
      009A93 CC 87 91         [ 2] 4519 	jp tb_error 
      009A96 9F               [ 1] 4520 2$: ld a,xl
      009A97 C7 54 00         [ 1] 4521 	ld ADC_CSR,a 
      009A9A 72 10 54 01      [ 1] 4522 	bset ADC_CR1,#ADC_CR1_ADON
      009A9E 72 0F 54 00 FB   [ 2] 4523 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009AA3 CE 54 04         [ 2] 4524 	ldw x,ADC_DRH 
      009AA6 A6 04            [ 1] 4525 	ld a,#TK_INTGR
      009AA8 81               [ 4] 4526 	ret 
                                   4527 
                                   4528 
                                   4529 ;-----------------------
                                   4530 ; BASIC: BREAK 
                                   4531 ; insert a breakpoint 
                                   4532 ; in pogram. 
                                   4533 ; the program is resumed
                                   4534 ; with RUN 
                                   4535 ;-------------------------
      009AA9                       4536 break:
      009AA9 72 00 00 20 02   [ 2] 4537 	btjt flags,#FRUN,2$
      009AAE 4F               [ 1] 4538 	clr a
      009AAF 81               [ 4] 4539 	ret 
      009AB0                       4540 2$:	 
                                   4541 ; create space on cstack to save context 
      009AB0 AE 9A D7         [ 2] 4542 	ldw x,#break_point 
      009AB3 CD 82 38         [ 4] 4543 	call puts 
      001A36                       4544 	_drop 2 ;drop return address 
      009AB6 5B 02            [ 2]    1     addw sp,#2 
      001A38                       4545 	_vars CTXT_SIZE ; context size 
      009AB8 52 06            [ 2]    1     sub sp,#CTXT_SIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009ABA CD 96 EE         [ 4] 4546 	call save_context 
      009ABD AE 16 C8         [ 2] 4547 	ldw x,#tib 
      009AC0 CF 00 05         [ 2] 4548 	ldw basicptr,x
      009AC3 7F               [ 1] 4549 	clr (x)
      009AC4 72 5F 00 04      [ 1] 4550 	clr count  
      009AC8 5F               [ 1] 4551 	clrw x 
      009AC9 CF 00 01         [ 2] 4552 	ldw in.w,x
      009ACC 72 11 00 20      [ 1] 4553 	bres flags,#FRUN 
      009AD0 72 18 00 20      [ 1] 4554 	bset flags,#FBREAK
      009AD4 CC 88 3F         [ 2] 4555 	jp interp_loop 
      009AD7 0A 62 72 65 61 6B 20  4556 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4557 
                                   4558 ;-----------------------
                                   4559 ; BASIC: NEW
                                   4560 ; from command line only 
                                   4561 ; free program memory
                                   4562 ; and clear variables 
                                   4563 ;------------------------
      009AF5                       4564 new: 
      009AF5 72 01 00 20 02   [ 2] 4565 	btjf flags,#FRUN,0$ 
      009AFA 4F               [ 1] 4566 	clr a 
      009AFB 81               [ 4] 4567 	ret 
      009AFC                       4568 0$:	
      009AFC CD 86 61         [ 4] 4569 	call clear_basic 
      009AFF 81               [ 4] 4570 	ret 
                                   4571 	 
                                   4572 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4573 ;   file system routines
                                   4574 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4575 
                                   4576 ;--------------------
                                   4577 ; input:
                                   4578 ;   X     increment 
                                   4579 ; output:
                                   4580 ;   farptr  incremented 
                                   4581 ;---------------------
      009B00                       4582 incr_farptr:
      009B00 72 BB 00 12      [ 2] 4583 	addw x,farptr+1 
      009B04 24 04            [ 1] 4584 	jrnc 1$
      009B06 72 5C 00 11      [ 1] 4585 	inc farptr 
      009B0A CF 00 12         [ 2] 4586 1$:	ldw farptr+1,x  
      009B0D 81               [ 4] 4587 	ret 
                                   4588 
                                   4589 ;------------------------------
                                   4590 ; extended flash memory used as FLASH_DRIVE 
                                   4591 ; seek end of used flash drive   
                                   4592 ; starting at 0x10000 address.
                                   4593 ; 4 consecutives 0 bytes signal free space. 
                                   4594 ; input:
                                   4595 ;	none
                                   4596 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4597 ;   ffree     free_addr| 0 if memory full.
                                   4598 ;------------------------------
      009B0E                       4599 seek_fdrive:
                                   4600 ; start scan at 0x10000 address 
      009B0E A6 01            [ 1] 4601 	ld a,#1
      009B10 C7 00 11         [ 1] 4602 	ld farptr,a 
      009B13 5F               [ 1] 4603 	clrw x 
      009B14 CF 00 12         [ 2] 4604 	ldw farptr+1,x 
      009B17                       4605 1$:
      009B17 AE 00 03         [ 2] 4606 	ldw x,#3  
      009B1A 92 AF 00 11      [ 5] 4607 2$:	ldf a,([farptr],x) 
      009B1E 26 05            [ 1] 4608 	jrne 3$
      009B20 5A               [ 2] 4609 	decw x
      009B21 2A F7            [ 1] 4610 	jrpl 2$
      009B23 20 19            [ 2] 4611 	jra 4$ 
      009B25 5C               [ 1] 4612 3$:	incw x 
      009B26 CD 9B 00         [ 4] 4613 	call incr_farptr
      009B29 AE 02 7F         [ 2] 4614 	ldw x,#0x27f 
      009B2C C3 00 11         [ 2] 4615 	cpw x,farptr
      009B2F 2A E6            [ 1] 4616 	jrpl 1$
                                   4617 ; drive full 
      009B31 72 5F 00 14      [ 1] 4618 	clr ffree 
      009B35 72 5F 00 15      [ 1] 4619 	clr ffree+1 
      009B39 72 5F 00 16      [ 1] 4620 	clr ffree+2 
      009B3D 81               [ 4] 4621 	ret
      009B3E                       4622 4$: ; copy farptr to ffree	 
      009B3E CE 00 11         [ 2] 4623 	ldw x,farptr 
      009B41 C6 00 13         [ 1] 4624 	ld a,farptr+2 
      009B44 CF 00 14         [ 2] 4625 	ldw ffree,x 
      009B47 C7 00 16         [ 1] 4626 	ld ffree+2,a  
      009B4A 81               [ 4] 4627 	ret 
                                   4628 
                                   4629 ;-----------------------
                                   4630 ; compare file name 
                                   4631 ; with name pointed by Y  
                                   4632 ; input:
                                   4633 ;   farptr   file name 
                                   4634 ;   Y        target name 
                                   4635 ; output:
                                   4636 ;   farptr 	 at file_name
                                   4637 ;   X 		 farptr[x] point at size field  
                                   4638 ;   Carry    0|1 no match|match  
                                   4639 ;----------------------
      009B4B                       4640 cmp_name:
      009B4B 5F               [ 1] 4641 	clrw x
      009B4C 92 AF 00 11      [ 5] 4642 1$:	ldf a,([farptr],x)
      009B50 90 F1            [ 1] 4643 	cp a,(y)
      009B52 26 08            [ 1] 4644 	jrne 4$
      009B54 4D               [ 1] 4645 	tnz a 
      009B55 27 12            [ 1] 4646 	jreq 9$ 
      009B57 5C               [ 1] 4647     incw x 
      009B58 90 5C            [ 1] 4648 	incw y 
      009B5A 20 F0            [ 2] 4649 	jra 1$
      009B5C                       4650 4$: ;no match 
      009B5C 4D               [ 1] 4651 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009B5D 27 07            [ 1] 4652 	jreq 5$
      009B5F 5C               [ 1] 4653 	incw x 
      009B60 92 AF 00 11      [ 5] 4654 	ldf a,([farptr],x)
      009B64 20 F6            [ 2] 4655 	jra 4$  
      009B66 5C               [ 1] 4656 5$:	incw x ; farptr[x] point at 'size' field 
      009B67 98               [ 1] 4657 	rcf 
      009B68 81               [ 4] 4658 	ret
      009B69                       4659 9$: ; match  
      009B69 5C               [ 1] 4660 	incw x  ; farptr[x] at 'size' field 
      009B6A 99               [ 1] 4661 	scf 
      009B6B 81               [ 4] 4662 	ret 
                                   4663 
                                   4664 ;-----------------------
                                   4665 ; search file in 
                                   4666 ; flash memory 
                                   4667 ; input:
                                   4668 ;   Y       file name  
                                   4669 ; output:
                                   4670 ;   farptr  addr at name|0
                                   4671 ;-----------------------
                           000001  4672 	FSIZE=1
                           000003  4673 	YSAVE=3
                           000004  4674 	VSIZE=4 
      009B6C                       4675 search_file: 
      001AEC                       4676 	_vars VSIZE
      009B6C 52 04            [ 2]    1     sub sp,#VSIZE 
      009B6E 17 03            [ 2] 4677 	ldw (YSAVE,sp),y  
      009B70 5F               [ 1] 4678 	clrw x 
      009B71 CF 00 12         [ 2] 4679 	ldw farptr+1,x 
      009B74 35 01 00 11      [ 1] 4680 	mov farptr,#1
      009B78                       4681 1$:	
                                   4682 ; check if farptr is after any file 
                                   4683 ; if  0 then so.
      009B78 92 BC 00 11      [ 5] 4684 	ldf a,[farptr]
      009B7C 27 25            [ 1] 4685 	jreq 6$
      009B7E 5F               [ 1] 4686 2$: clrw x 	
      009B7F 16 03            [ 2] 4687 	ldw y,(YSAVE,sp) 
      009B81 CD 9B 4B         [ 4] 4688 	call cmp_name
      009B84 25 2D            [ 1] 4689 	jrc 9$
      009B86 92 AF 00 11      [ 5] 4690 	ldf a,([farptr],x)
      009B8A 6B 01            [ 1] 4691 	ld (FSIZE,sp),a 
      009B8C 5C               [ 1] 4692 	incw x 
      009B8D 92 AF 00 11      [ 5] 4693 	ldf a,([farptr],x)
      009B91 6B 02            [ 1] 4694 	ld (FSIZE+1,sp),a 
      009B93 5C               [ 1] 4695 	incw x 
      009B94 72 FB 01         [ 2] 4696 	addw x,(FSIZE,sp) ; count to skip 
      009B97 5C               [ 1] 4697 	incw x ; skip over EOF marker 
      009B98 CD 9B 00         [ 4] 4698 	call incr_farptr ; now at next file 'name_field'
      009B9B AE 02 80         [ 2] 4699 	ldw x,#0x280
      009B9E C3 00 11         [ 2] 4700 	cpw x,farptr 
      009BA1 2A D5            [ 1] 4701 	jrpl 1$
      009BA3                       4702 6$: ; file not found 
      009BA3 72 5F 00 11      [ 1] 4703 	clr farptr
      009BA7 72 5F 00 12      [ 1] 4704 	clr farptr+1 
      009BAB 72 5F 00 13      [ 1] 4705 	clr farptr+2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      001B2F                       4706 	_drop VSIZE 
      009BAF 5B 04            [ 2]    1     addw sp,#VSIZE 
      009BB1 98               [ 1] 4707 	rcf
      009BB2 81               [ 4] 4708 	ret
      009BB3                       4709 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001B33                       4710 	_drop VSIZE 
      009BB3 5B 04            [ 2]    1     addw sp,#VSIZE 
      009BB5 99               [ 1] 4711 	scf 	
      009BB6 81               [ 4] 4712 	ret
                                   4713 
                                   4714 ;--------------------------------
                                   4715 ; BASIC: SAVE "name" 
                                   4716 ; save text program in 
                                   4717 ; flash memory used as 
                                   4718 ;--------------------------------
                           000001  4719 	BSIZE=1
                           000003  4720 	NAMEPTR=3
                           000004  4721 	VSIZE=4
      009BB7                       4722 save:
      009BB7 72 01 00 20 05   [ 2] 4723 	btjf flags,#FRUN,0$ 
      009BBC A6 07            [ 1] 4724 	ld a,#ERR_CMD_ONLY 
      009BBE CC 87 91         [ 2] 4725 	jp tb_error
      009BC1                       4726 0$:	 
      009BC1 CE 00 1B         [ 2] 4727 	ldw x,txtend 
      009BC4 72 B0 00 19      [ 2] 4728 	subw x,txtbgn
      009BC8 26 01            [ 1] 4729 	jrne 1$
                                   4730 ; nothing to save 
      009BCA 81               [ 4] 4731 	ret 
      009BCB                       4732 1$:	
      001B4B                       4733 	_vars VSIZE 
      009BCB 52 04            [ 2]    1     sub sp,#VSIZE 
      009BCD 1F 01            [ 2] 4734 	ldw (BSIZE,sp),x 
      009BCF CD 88 6F         [ 4] 4735 	call next_token	
      009BD2 A1 0A            [ 1] 4736 	cp a,#TK_QSTR
      009BD4 27 03            [ 1] 4737 	jreq 2$
      009BD6 CC 87 8F         [ 2] 4738 	jp syntax_error
      009BD9                       4739 2$: 
      009BD9 90 CE 00 05      [ 2] 4740 	ldw y,basicptr 
      009BDD 72 B9 00 01      [ 2] 4741 	addw y,in.w
      009BE1 17 03            [ 2] 4742 	ldw (NAMEPTR,sp),y  
      009BE3 55 00 04 00 02   [ 1] 4743 	mov in,count 
                                   4744 ; check if enough free space 
      009BE8 93               [ 1] 4745 	ldw x,y 
      009BE9 CD 82 FA         [ 4] 4746 	call strlen 
      009BEC 1C 00 03         [ 2] 4747 	addw x,#3 
      009BEF 72 FB 01         [ 2] 4748 	addw x,(BSIZE,sp)
      009BF2 72 5D 00 14      [ 1] 4749 	tnz ffree 
      009BF6 26 0B            [ 1] 4750 	jrne 21$
      009BF8 72 B0 00 15      [ 2] 4751 	subw x,ffree+1 
      009BFC 23 05            [ 2] 4752 	jrule 21$
      009BFE A6 01            [ 1] 4753 	ld a,#ERR_MEM_FULL 
      009C00 CC 87 91         [ 2] 4754 	jp tb_error
      009C03                       4755 21$: 
                                   4756 ; check for existing file of that name 
      009C03 16 03            [ 2] 4757 	ldw y,(NAMEPTR,sp)	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009C05 CD 9B 6C         [ 4] 4758 	call search_file 
      009C08 24 05            [ 1] 4759 	jrnc 3$ 
      009C0A A6 08            [ 1] 4760 	ld a,#ERR_DUPLICATE 
      009C0C CC 87 91         [ 2] 4761 	jp tb_error 
      009C0F                       4762 3$:	;** write file name to flash **
      009C0F CE 00 14         [ 2] 4763 	ldw x,ffree 
      009C12 C6 00 16         [ 1] 4764 	ld a,ffree+2 
      009C15 CF 00 11         [ 2] 4765 	ldw farptr,x 
      009C18 C7 00 13         [ 1] 4766 	ld farptr+2,a 
      009C1B 1E 03            [ 2] 4767 	ldw x,(NAMEPTR,sp)  
      009C1D CD 82 FA         [ 4] 4768 	call strlen 
      009C20 5C               [ 1] 4769 	incw  x
      009C21 1F 01            [ 2] 4770 	ldw (BSIZE,sp),x  
      009C23 5F               [ 1] 4771 	clrw x   
      009C24 16 03            [ 2] 4772 	ldw y,(NAMEPTR,sp)
      009C26 CD 81 D5         [ 4] 4773 	call write_block  
                                   4774 ;** write file length after name **
      009C29 CE 00 1B         [ 2] 4775 	ldw x,txtend 
      009C2C 72 B0 00 19      [ 2] 4776 	subw x,txtbgn
      009C30 1F 01            [ 2] 4777 	ldw (BSIZE,sp),x 
      009C32 5F               [ 1] 4778 	clrw x 
      009C33 7B 01            [ 1] 4779 	ld a,(1,sp)
      009C35 CD 81 60         [ 4] 4780 	call write_byte 
      009C38 5C               [ 1] 4781 	incw x 
      009C39 7B 02            [ 1] 4782 	ld a,(2,sp)
      009C3B CD 81 60         [ 4] 4783 	call write_byte
      009C3E 5C               [ 1] 4784 	incw x  
      009C3F CD 9B 00         [ 4] 4785 	call incr_farptr ; move farptr after SIZE field 
                                   4786 ;** write BASIC text **
                                   4787 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009C42 1E 01            [ 2] 4788 	ldw x,(BSIZE,sp)
      009C44 89               [ 2] 4789 	pushw x ; write_block argument 
      009C45 5F               [ 1] 4790 	clrw x 
      009C46 90 CE 00 19      [ 2] 4791 	ldw y,txtbgn  ; BASIC text to save 
      009C4A CD 81 D5         [ 4] 4792 	call write_block 
      001BCD                       4793 	_drop 2 ;  drop write_block argument  
      009C4D 5B 02            [ 2]    1     addw sp,#2 
                                   4794 ; write en end of file marker 
      009C4F AE 00 01         [ 2] 4795 	ldw x,#1
      009C52 A6 FF            [ 1] 4796 	ld a,#EOF  
      009C54 CD 81 60         [ 4] 4797 	call write_byte 
      009C57 CD 9B 00         [ 4] 4798 	call incr_farptr
                                   4799 ; save farptr in ffree
      009C5A CE 00 11         [ 2] 4800 	ldw x,farptr 
      009C5D C6 00 13         [ 1] 4801 	ld a,farptr+2 
      009C60 CF 00 14         [ 2] 4802 	ldw ffree,x 
      009C63 C7 00 16         [ 1] 4803 	ld ffree+2,a
                                   4804 ;write 4 zero bytes as an end of all files marker 
      009C66 5F               [ 1] 4805     clrw x 
      009C67 4B 04            [ 1] 4806 	push #4 
      009C69                       4807 4$:
      009C69 4F               [ 1] 4808 	clr a 
      009C6A CD 81 60         [ 4] 4809 	call write_byte 
      009C6D 5C               [ 1] 4810 	incw x 
      009C6E 0A 01            [ 1] 4811 	dec (1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009C70 26 F7            [ 1] 4812 	jrne 4$
      009C72 84               [ 1] 4813 5$: pop a 
                                   4814 ; display saved size  
      009C73 1E 01            [ 2] 4815 	ldw x,(BSIZE,sp) 
      009C75 CD 8A 08         [ 4] 4816 	call print_int 
      001BF8                       4817 	_drop VSIZE 
      009C78 5B 04            [ 2]    1     addw sp,#VSIZE 
      009C7A 81               [ 4] 4818 	ret 
                                   4819 
                                   4820 
                                   4821 ;------------------------
                                   4822 ; BASIC: LOAD "file" 
                                   4823 ; load file to RAM 
                                   4824 ; for execution 
                                   4825 ;------------------------
      009C7B                       4826 load:
      009C7B 72 01 00 20 07   [ 2] 4827 	btjf flags,#FRUN,0$ 
      009C80 27 05            [ 1] 4828 	jreq 0$ 
      009C82 A6 07            [ 1] 4829 	ld a,#ERR_CMD_ONLY 
      009C84 CC 87 91         [ 2] 4830 	jp tb_error 
      009C87                       4831 0$:	
      009C87 CD 88 6F         [ 4] 4832 	call next_token 
      009C8A A1 0A            [ 1] 4833 	cp a,#TK_QSTR
      009C8C 27 03            [ 1] 4834 	jreq 1$
      009C8E CC 87 8F         [ 2] 4835 	jp syntax_error 
      009C91                       4836 1$:	
      009C91 90 CE 00 05      [ 2] 4837 	ldw y,basicptr
      009C95 72 B9 00 01      [ 2] 4838 	addw y,in.w 
      009C99 55 00 04 00 02   [ 1] 4839 	mov in,count 
      009C9E CD 9B 6C         [ 4] 4840 	call search_file 
      009CA1 25 05            [ 1] 4841 	jrc 2$ 
      009CA3 A6 09            [ 1] 4842 	ld a,#ERR_NOT_FILE
      009CA5 CC 87 91         [ 2] 4843 	jp tb_error  
      009CA8                       4844 2$:	
      009CA8 CD 9B 00         [ 4] 4845 	call incr_farptr  
      009CAB CD 86 61         [ 4] 4846 	call clear_basic  
      009CAE 5F               [ 1] 4847 	clrw x
      009CAF 92 AF 00 11      [ 5] 4848 	ldf a,([farptr],x)
      009CB3 90 95            [ 1] 4849 	ld yh,a 
      009CB5 5C               [ 1] 4850 	incw x  
      009CB6 92 AF 00 11      [ 5] 4851 	ldf a,([farptr],x)
      009CBA 5C               [ 1] 4852 	incw x 
      009CBB 90 97            [ 1] 4853 	ld yl,a 
      009CBD 72 B9 00 19      [ 2] 4854 	addw y,txtbgn
      009CC1 90 CF 00 1B      [ 2] 4855 	ldw txtend,y
      009CC5 90 CE 00 19      [ 2] 4856 	ldw y,txtbgn
      009CC9                       4857 3$:	; load BASIC text 	
      009CC9 92 AF 00 11      [ 5] 4858 	ldf a,([farptr],x)
      009CCD 90 F7            [ 1] 4859 	ld (y),a 
      009CCF 5C               [ 1] 4860 	incw x 
      009CD0 90 5C            [ 1] 4861 	incw y 
      009CD2 90 C3 00 1B      [ 2] 4862 	cpw y,txtend 
      009CD6 2B F1            [ 1] 4863 	jrmi 3$
                                   4864 ; print loaded size 	 
      009CD8 CE 00 1B         [ 2] 4865 	ldw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009CDB 72 B0 00 19      [ 2] 4866 	subw x,txtbgn
      009CDF CD 8A 08         [ 4] 4867 	call print_int 
      009CE2 81               [ 4] 4868 	ret 
                                   4869 
                                   4870 ;-----------------------------------
                                   4871 ; BASIC: FORGET ["file_name"] 
                                   4872 ; erase file_name and all others 
                                   4873 ; after it. 
                                   4874 ; without argument erase all files 
                                   4875 ;-----------------------------------
      009CE3                       4876 forget:
      009CE3 CD 88 6F         [ 4] 4877 	call next_token 
      009CE6 A1 00            [ 1] 4878 	cp a,#TK_NONE 
      009CE8 27 26            [ 1] 4879 	jreq 3$ 
      009CEA A1 0A            [ 1] 4880 	cp a,#TK_QSTR
      009CEC 27 03            [ 1] 4881 	jreq 1$
      009CEE CC 87 8F         [ 2] 4882 	jp syntax_error
      009CF1 90 CE 00 05      [ 2] 4883 1$: ldw y,basicptr
      009CF5 72 B9 00 01      [ 2] 4884 	addw y,in.w
      009CF9 55 00 04 00 02   [ 1] 4885 	mov in,count 
      009CFE CD 9B 6C         [ 4] 4886 	call search_file
      009D01 25 05            [ 1] 4887 	jrc 2$
      009D03 A6 09            [ 1] 4888 	ld a,#ERR_NOT_FILE 
      009D05 CC 87 91         [ 2] 4889 	jp tb_error 
      009D08                       4890 2$: 
      009D08 CE 00 11         [ 2] 4891 	ldw x,farptr
      009D0B C6 00 13         [ 1] 4892 	ld a,farptr+2
      009D0E 20 0A            [ 2] 4893 	jra 4$ 
      009D10                       4894 3$: ; forget all files 
      009D10 AE 01 00         [ 2] 4895 	ldw x,#0x100
      009D13 4F               [ 1] 4896 	clr a 
      009D14 CF 00 11         [ 2] 4897 	ldw farptr,x 
      009D17 C7 00 13         [ 1] 4898 	ld farptr+2,a 
      009D1A                       4899 4$:
      009D1A CF 00 14         [ 2] 4900 	ldw ffree,x 
      009D1D C7 00 16         [ 1] 4901 	ld ffree+2,a 
      009D20 4B 04            [ 1] 4902 	push #4
      009D22 5F               [ 1] 4903 	clrw x 
      009D23                       4904 5$: 
      009D23 4F               [ 1] 4905 	clr a  
      009D24 CD 81 60         [ 4] 4906 	call write_byte 
      009D27 5C               [ 1] 4907 	incw x 
      009D28 0A 01            [ 1] 4908 	dec (1,sp)
      009D2A 26 F7            [ 1] 4909 	jrne 5$	
      009D2C 84               [ 1] 4910 6$: pop a 
      009D2D 81               [ 4] 4911 	ret 
                                   4912 
                                   4913 ;----------------------
                                   4914 ; BASIC: DIR 
                                   4915 ; list saved files 
                                   4916 ;----------------------
                           000001  4917 	COUNT=1 ; files counter 
                           000002  4918 	VSIZE=2 
      009D2E                       4919 directory:
      001CAE                       4920 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009D2E 52 02            [ 2]    1     sub sp,#VSIZE 
      009D30 5F               [ 1] 4921 	clrw x 
      009D31 1F 01            [ 2] 4922 	ldw (COUNT,sp),x 
      009D33 CF 00 12         [ 2] 4923 	ldw farptr+1,x 
      009D36 35 01 00 11      [ 1] 4924 	mov farptr,#1 
      009D3A                       4925 dir_loop:
      009D3A 5F               [ 1] 4926 	clrw x 
      009D3B 92 AF 00 11      [ 5] 4927 	ldf a,([farptr],x)
      009D3F 27 39            [ 1] 4928 	jreq 8$ 
      009D41                       4929 1$: ;name loop 	
      009D41 92 AF 00 11      [ 5] 4930 	ldf a,([farptr],x)
      009D45 27 06            [ 1] 4931 	jreq 2$ 
      009D47 CD 82 26         [ 4] 4932 	call putc 
      009D4A 5C               [ 1] 4933 	incw x 
      009D4B 20 F4            [ 2] 4934 	jra 1$
      009D4D 5C               [ 1] 4935 2$: incw x ; skip ending 0. 
      009D4E A6 20            [ 1] 4936 	ld a,#SPACE 
      009D50 CD 82 26         [ 4] 4937 	call putc 
                                   4938 ; get file size 	
      009D53 92 AF 00 11      [ 5] 4939 	ldf a,([farptr],x)
      009D57 90 95            [ 1] 4940 	ld yh,a 
      009D59 5C               [ 1] 4941 	incw x 
      009D5A 92 AF 00 11      [ 5] 4942 	ldf a,([farptr],x)
      009D5E 5C               [ 1] 4943 	incw x 
      009D5F 90 97            [ 1] 4944 	ld yl,a 
      009D61 90 89            [ 2] 4945 	pushw y 
      009D63 72 FB 01         [ 2] 4946 	addw x,(1,sp)
      009D66 5C               [ 1] 4947 	incw x ; skip EOF marker 
                                   4948 ; skip to next file 
      009D67 CD 9B 00         [ 4] 4949 	call incr_farptr 
                                   4950 ; print file size 
      009D6A 85               [ 2] 4951 	popw x ; file size 
      009D6B CD 8A 08         [ 4] 4952 	call print_int 
      009D6E A6 0D            [ 1] 4953 	ld a,#CR 
      009D70 CD 82 26         [ 4] 4954 	call putc
      009D73 1E 01            [ 2] 4955 	ldw x,(COUNT,sp)
      009D75 5C               [ 1] 4956 	incw x
      009D76 1F 01            [ 2] 4957 	ldw (COUNT,sp),x  
      009D78 20 C0            [ 2] 4958 	jra dir_loop 
      009D7A                       4959 8$: ; print number of files 
      009D7A 1E 01            [ 2] 4960 	ldw x,(COUNT,sp)
      009D7C CD 8A 08         [ 4] 4961 	call print_int 
      009D7F AE 9D AF         [ 2] 4962 	ldw x,#file_count 
      009D82 CD 82 38         [ 4] 4963 	call puts  
                                   4964 ; print drive free space 	
      009D85 A6 FF            [ 1] 4965 	ld a,#0xff 
      009D87 C0 00 16         [ 1] 4966 	sub a,ffree+2 
      009D8A C7 00 0A         [ 1] 4967 	ld acc8,a 
      009D8D A6 7F            [ 1] 4968 	ld a,#0x7f 
      009D8F C2 00 15         [ 1] 4969 	sbc a,ffree+1 
      009D92 C7 00 09         [ 1] 4970 	ld acc16,a 
      009D95 A6 02            [ 1] 4971 	ld a,#2 
      009D97 C2 00 14         [ 1] 4972 	sbc a,ffree 
      009D9A C7 00 08         [ 1] 4973 	ld acc24,a 
      009D9D 5F               [ 1] 4974 	clrw x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009D9E A6 06            [ 1] 4975 	ld a,#6 
      009DA0 97               [ 1] 4976 	ld xl,a 
      009DA1 A6 0A            [ 1] 4977 	ld a,#10 
      009DA3 CD 89 C0         [ 4] 4978 	call prti24 
      009DA6 AE 9D B7         [ 2] 4979 	ldw x,#drive_free
      009DA9 CD 82 38         [ 4] 4980 	call puts 
      001D2C                       4981 	_drop VSIZE 
      009DAC 5B 02            [ 2]    1     addw sp,#VSIZE 
      009DAE 81               [ 4] 4982 	ret
      009DAF 20 66 69 6C 65 73 0A  4983 file_count: .asciz " files\n"
             00
      009DB7 20 62 79 74 65 73 20  4984 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   4985 
                                   4986 ;---------------------
                                   4987 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   4988 ; write 1 or more byte to FLASH or EEPROM
                                   4989 ; starting at address  
                                   4990 ; input:
                                   4991 ;   expr1  	is address 
                                   4992 ;   expr2   is byte to write
                                   4993 ; output:
                                   4994 ;   none 
                                   4995 ;---------------------
                           000001  4996 	ADDR=1
                           000002  4997 	VSIZ=2 
      009DC4                       4998 write:
      001D44                       4999 	_vars VSIZE 
      009DC4 52 02            [ 2]    1     sub sp,#VSIZE 
      009DC6 72 5F 00 11      [ 1] 5000 	clr farptr ; expect 16 bits address 
      009DCA CD 93 30         [ 4] 5001 	call expression
      009DCD A1 04            [ 1] 5002 	cp a,#TK_INTGR 
      009DCF 27 03            [ 1] 5003 	jreq 0$
      009DD1 CC 87 8F         [ 2] 5004 	jp syntax_error
      009DD4 1F 01            [ 2] 5005 0$: ldw (ADDR,sp),x 
      009DD6 CD 88 6F         [ 4] 5006 	call next_token 
      009DD9 A1 0D            [ 1] 5007 	cp a,#TK_COMMA 
      009DDB 27 02            [ 1] 5008 	jreq 1$ 
      009DDD 20 19            [ 2] 5009 	jra 9$ 
      009DDF CD 93 30         [ 4] 5010 1$:	call expression
      009DE2 A1 04            [ 1] 5011 	cp a,#TK_INTGR
      009DE4 27 03            [ 1] 5012 	jreq 2$
      009DE6 CC 87 8F         [ 2] 5013 	jp syntax_error
      009DE9 9F               [ 1] 5014 2$:	ld a,xl 
      009DEA 1E 01            [ 2] 5015 	ldw x,(ADDR,sp) 
      009DEC CF 00 12         [ 2] 5016 	ldw farptr+1,x 
      009DEF 5F               [ 1] 5017 	clrw x 
      009DF0 CD 81 60         [ 4] 5018 	call write_byte
      009DF3 1E 01            [ 2] 5019 	ldw x,(ADDR,sp)
      009DF5 5C               [ 1] 5020 	incw x 
      009DF6 20 DC            [ 2] 5021 	jra 0$ 
      009DF8                       5022 9$:
      001D78                       5023 	_drop VSIZE
      009DF8 5B 02            [ 2]    1     addw sp,#VSIZE 
      009DFA 81               [ 4] 5024 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   5025 
                                   5026 
                                   5027 ;---------------------
                                   5028 ;BASIC: CHAR(expr)
                                   5029 ; évaluate expression 
                                   5030 ; and take the 7 least 
                                   5031 ; bits as ASCII character
                                   5032 ;---------------------
      009DFB                       5033 char:
      009DFB CD 92 52         [ 4] 5034 	call func_args 
      009DFE A1 01            [ 1] 5035 	cp a,#1
      009E00 27 03            [ 1] 5036 	jreq 1$
      009E02 CC 87 8F         [ 2] 5037 	jp syntax_error
      009E05 CD 90 0E         [ 4] 5038 1$:	call dpop 
      009E08 9F               [ 1] 5039 	ld a,xl 
      009E09 A4 7F            [ 1] 5040 	and a,#0x7f 
      009E0B 97               [ 1] 5041 	ld xl,a
      009E0C A6 03            [ 1] 5042 	ld a,#TK_CHAR
      009E0E 81               [ 4] 5043 	ret
                                   5044 
                                   5045 ;---------------------
                                   5046 ; BASIC: ASC(string|char)
                                   5047 ; extract first character 
                                   5048 ; of string argument 
                                   5049 ; return it as TK_INTGR 
                                   5050 ;---------------------
      009E0F                       5051 ascii:
      009E0F CD 92 52         [ 4] 5052 	call func_args 
      009E12 CD 88 6F         [ 4] 5053 	call next_token 
      009E15 A1 0A            [ 1] 5054 	cp a,#TK_QSTR 
      009E17 27 07            [ 1] 5055 	jreq 1$
      009E19 A1 03            [ 1] 5056 	cp a,#TK_CHAR 
      009E1B 27 06            [ 1] 5057 	jreq 2$ 
      009E1D CC 87 8F         [ 2] 5058 	jp syntax_error
      009E20                       5059 1$: 
      009E20 F6               [ 1] 5060 	ld a,(x)
      009E21 20 01            [ 2] 5061 	jra 3$
      009E23                       5062 2$: 
      009E23 9F               [ 1] 5063 	ld a,xl 
      009E24 97               [ 1] 5064 3$:	ld xl,a 
      009E25 4F               [ 1] 5065 	clr a  
      009E26 95               [ 1] 5066 	ld xh,a 
      009E27 A6 04            [ 1] 5067 	ld a,#TK_INTGR 
      009E29 81               [ 4] 5068 	ret 
                                   5069 
                                   5070 ;---------------------
                                   5071 ;BASIC: KEY
                                   5072 ; wait for a character 
                                   5073 ; received from STDIN 
                                   5074 ; input:
                                   5075 ;	none 
                                   5076 ; output:
                                   5077 ;	X 		ASCII character 
                                   5078 ;---------------------
      009E2A                       5079 key:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009E2A CD 82 2F         [ 4] 5080 	call getc 
      009E2D 5F               [ 1] 5081 	clrw x 
      009E2E 97               [ 1] 5082 	ld xl,a 
      009E2F A6 04            [ 1] 5083 	ld a,#TK_INTGR
      009E31 81               [ 4] 5084 	ret
                                   5085 
                                   5086 ;----------------------
                                   5087 ; BASIC: QKEY
                                   5088 ; Return true if there 
                                   5089 ; is a character in 
                                   5090 ; waiting in STDIN 
                                   5091 ; input:
                                   5092 ;  none 
                                   5093 ; output:
                                   5094 ;   X 		0|1 
                                   5095 ;-----------------------
      009E32                       5096 qkey: 
      009E32 5F               [ 1] 5097 	clrw x 
      009E33 72 0B 52 40 01   [ 2] 5098 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      009E38 5C               [ 1] 5099 	incw x 
      009E39 A6 04            [ 1] 5100 9$: ld a,#TK_INTGR
      009E3B 81               [ 4] 5101 	ret 
                                   5102 
                                   5103 ;---------------------
                                   5104 ; BASIC: GPIO(expr,reg)
                                   5105 ; return gpio address 
                                   5106 ; expr {0..8}
                                   5107 ; input:
                                   5108 ;   none 
                                   5109 ; output:
                                   5110 ;   X 		gpio register address
                                   5111 ;----------------------------
      009E3C                       5112 gpio:
      009E3C CD 92 52         [ 4] 5113 	call func_args 
      009E3F A1 02            [ 1] 5114 	cp a,#2
      009E41 27 03            [ 1] 5115 	jreq 1$
      009E43 CC 87 8F         [ 2] 5116 	jp syntax_error  
      009E46                       5117 1$:	
      009E46 AE 00 02         [ 2] 5118 	ldw x,#2
      009E49 72 DE 00 17      [ 5] 5119 	ldw x,([dstkptr],x) ; port 
      009E4D 2B 1B            [ 1] 5120 	jrmi bad_port
      009E4F A3 00 09         [ 2] 5121 	cpw x,#9
      009E52 2A 16            [ 1] 5122 	jrpl bad_port
      009E54 A6 05            [ 1] 5123 	ld a,#5
      009E56 42               [ 4] 5124 	mul x,a
      009E57 1C 50 00         [ 2] 5125 	addw x,#GPIO_BASE 
      009E5A 89               [ 2] 5126 	pushw x 
      009E5B CD 90 0E         [ 4] 5127 	call dpop 
      009E5E 72 FB 01         [ 2] 5128 	addw x,(1,sp)
      009E61 1F 01            [ 2] 5129 	ldw (1,sp),x  
      009E63 CD 90 35         [ 4] 5130 	call ddrop  
      009E66 85               [ 2] 5131 	popw x 
      009E67 A6 04            [ 1] 5132 	ld a,#TK_INTGR
      009E69 81               [ 4] 5133 	ret
      009E6A                       5134 bad_port:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009E6A A6 0A            [ 1] 5135 	ld a,#ERR_BAD_VALUE
      009E6C CC 87 91         [ 2] 5136 	jp tb_error
                                   5137 
                                   5138 
                                   5139 ;-------------------------
                                   5140 ; BASIC: UFLASH 
                                   5141 ; return user flash address
                                   5142 ; input:
                                   5143 ;  none 
                                   5144 ; output:
                                   5145 ;	A		TK_INTGR
                                   5146 ;   X 		user address 
                                   5147 ;---------------------------
      009E6F                       5148 uflash:
      009E6F AE A2 80         [ 2] 5149 	ldw x,#user_space 
      009E72 A6 04            [ 1] 5150 	ld a,#TK_INTGR 
      009E74 81               [ 4] 5151 	ret 
                                   5152 
                                   5153 
                                   5154 ;---------------------
                                   5155 ; BASIC: USR(addr[,arg])
                                   5156 ; execute a function written 
                                   5157 ; in binary code.
                                   5158 ; binary fonction should 
                                   5159 ; return token attribute in A 
                                   5160 ; and value in X. 
                                   5161 ; input:
                                   5162 ;   addr	routine address 
                                   5163 ;   arg 	is an optional argument 
                                   5164 ; output:
                                   5165 ;   A 		token attribute 
                                   5166 ;   X       returned value 
                                   5167 ;---------------------
      009E75                       5168 usr:
      009E75 90 89            [ 2] 5169 	pushw y 	
      009E77 CD 92 52         [ 4] 5170 	call func_args 
      009E7A A1 01            [ 1] 5171 	cp a,#1 
      009E7C 2A 03            [ 1] 5172 	jrpl 2$ 
      009E7E CC 87 8F         [ 2] 5173 	jp syntax_error 
      009E81                       5174 2$: 
      009E81 CD 90 0E         [ 4] 5175 	call dpop 
      009E84 A1 02            [ 1] 5176 	cp a,#2 
      009E86 2B 05            [ 1] 5177 	jrmi 4$
      009E88 90 93            [ 1] 5178 	ldw y,x ; y=arg 
      009E8A CD 90 0E         [ 4] 5179 	call dpop ;x=addr 
      009E8D 51               [ 1] 5180 4$:	exgw y,x ; y=addr,x=arg 
      009E8E 90 FD            [ 4] 5181 	call (y)
      009E90 90 85            [ 2] 5182 	popw y 
      009E92 81               [ 4] 5183 	ret 
                                   5184 
                                   5185 ;------------------------------
                                   5186 ; BASIC: BYE 
                                   5187 ; halt mcu in its lowest power mode 
                                   5188 ; wait for reset or external interrupt
                                   5189 ; do a cold start on wakeup.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5190 ;------------------------------
      009E93                       5191 bye:
      009E93 72 0D 52 40 FB   [ 2] 5192 	btjf UART3_SR,#UART_SR_TC,.
      009E98 8E               [10] 5193 	halt
      009E99 CC 85 D4         [ 2] 5194 	jp cold_start  
                                   5195 
                                   5196 ;----------------------------------
                                   5197 ; BASIC: SLEEP 
                                   5198 ; halt mcu until reset or external
                                   5199 ; interrupt.
                                   5200 ; Resume progam after SLEEP command
                                   5201 ;----------------------------------
      009E9C                       5202 sleep:
      009E9C 72 0D 52 40 FB   [ 2] 5203 	btjf UART3_SR,#UART_SR_TC,.
      009EA1 72 16 00 20      [ 1] 5204 	bset flags,#FSLEEP
      009EA5 8E               [10] 5205 	halt 
      009EA6 81               [ 4] 5206 	ret 
                                   5207 
                                   5208 ;-------------------------------
                                   5209 ; BASIC: PAUSE expr 
                                   5210 ; suspend execution for n msec.
                                   5211 ; input:
                                   5212 ;	none
                                   5213 ; output:
                                   5214 ;	none 
                                   5215 ;------------------------------
      009EA7                       5216 pause:
      009EA7 CD 93 30         [ 4] 5217 	call expression
      009EAA A1 04            [ 1] 5218 	cp a,#TK_INTGR
      009EAC 27 03            [ 1] 5219 	jreq pause02 
      009EAE CC 87 8F         [ 2] 5220 	jp syntax_error
      009EB1                       5221 pause02: 
      009EB1 5D               [ 2] 5222 1$: tnzw x 
      009EB2 27 04            [ 1] 5223 	jreq 2$
      009EB4 8F               [10] 5224 	wfi 
      009EB5 5A               [ 2] 5225 	decw x 
      009EB6 26 F9            [ 1] 5226 	jrne 1$
      009EB8 4F               [ 1] 5227 2$:	clr a 
      009EB9 81               [ 4] 5228 	ret 
                                   5229 
                                   5230 ;------------------------------
                                   5231 ; BASIC: TICKS
                                   5232 ; return msec ticks counter value 
                                   5233 ; input:
                                   5234 ; 	none 
                                   5235 ; output:
                                   5236 ;	X 		TK_INTGR
                                   5237 ;-------------------------------
      009EBA                       5238 get_ticks:
      009EBA CE 00 0B         [ 2] 5239 	ldw x,ticks 
      009EBD A6 04            [ 1] 5240 	ld a,#TK_INTGR
      009EBF 81               [ 4] 5241 	ret 
                                   5242 
                                   5243 
                                   5244 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5245 ;------------------------------
                                   5246 ; BASIC: ABS(expr)
                                   5247 ; return absolute value of expr.
                                   5248 ; input:
                                   5249 ;   none
                                   5250 ; output:
                                   5251 ;   X     	positive integer
                                   5252 ;-------------------------------
      009EC0                       5253 abs:
      009EC0 CD 92 52         [ 4] 5254 	call func_args 
      009EC3 A1 01            [ 1] 5255 	cp a,#1 
      009EC5 27 03            [ 1] 5256 	jreq 0$ 
      009EC7 CC 87 8F         [ 2] 5257 	jp syntax_error
      009ECA                       5258 0$:  
      009ECA CD 90 0E         [ 4] 5259     call dpop   
      009ECD 9E               [ 1] 5260 	ld a,xh 
      009ECE A5 80            [ 1] 5261 	bcp a,#0x80 
      009ED0 27 01            [ 1] 5262 	jreq 2$ 
      009ED2 50               [ 2] 5263 	negw x 
      009ED3 A6 04            [ 1] 5264 2$: ld a,#TK_INTGR 
      009ED5 81               [ 4] 5265 	ret 
                                   5266 
                                   5267 ;------------------------------
                                   5268 ; BASIC: AND(expr1,expr2)
                                   5269 ; Apply bit AND relation between
                                   5270 ; the 2 arguments, i.e expr1 & expr2 
                                   5271 ; output:
                                   5272 ; 	A 		TK_INTGR
                                   5273 ;   X 		result 
                                   5274 ;------------------------------
      009ED6                       5275 bit_and:
      009ED6 CD 92 52         [ 4] 5276 	call func_args 
      009ED9 A1 02            [ 1] 5277 	cp a,#2
      009EDB 27 03            [ 1] 5278 	jreq 1$
      009EDD CC 87 8F         [ 2] 5279 	jp syntax_error 
      009EE0 CD 90 0E         [ 4] 5280 1$:	call dpop 
      009EE3 89               [ 2] 5281 	pushw x 
      009EE4 CD 90 0E         [ 4] 5282 	call dpop 
      009EE7 9E               [ 1] 5283 	ld a,xh 
      009EE8 14 01            [ 1] 5284 	and a,(1,sp)
      009EEA 95               [ 1] 5285 	ld xh,a 
      009EEB 9F               [ 1] 5286 	ld a,xl
      009EEC 14 02            [ 1] 5287 	and a,(2,sp)
      009EEE 97               [ 1] 5288 	ld xl,a 
      001E6F                       5289 	_drop 2 
      009EEF 5B 02            [ 2]    1     addw sp,#2 
      009EF1 A6 04            [ 1] 5290 	ld a,#TK_INTGR
      009EF3 81               [ 4] 5291 	ret
                                   5292 
                                   5293 ;------------------------------
                                   5294 ; BASIC: OR(expr1,expr2)
                                   5295 ; Apply bit OR relation between
                                   5296 ; the 2 arguments, i.e expr1 | expr2 
                                   5297 ; output:
                                   5298 ; 	A 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   5299 ;   X 		result 
                                   5300 ;------------------------------
      009EF4                       5301 bit_or:
      009EF4 CD 92 52         [ 4] 5302 	call func_args 
      009EF7 A1 02            [ 1] 5303 	cp a,#2
      009EF9 27 03            [ 1] 5304 	jreq 1$
      009EFB CC 87 8F         [ 2] 5305 	jp syntax_error 
      009EFE                       5306 1$: 
      009EFE CD 90 0E         [ 4] 5307 	call dpop 
      009F01 89               [ 2] 5308 	pushw x 
      009F02 CD 90 0E         [ 4] 5309 	call dpop 
      009F05 9E               [ 1] 5310 	ld a,xh 
      009F06 1A 01            [ 1] 5311 	or a,(1,sp)
      009F08 95               [ 1] 5312 	ld xh,a 
      009F09 9F               [ 1] 5313 	ld a,xl 
      009F0A 1A 02            [ 1] 5314 	or a,(2,sp)
      009F0C 97               [ 1] 5315 	ld xl,a 
      001E8D                       5316 	_drop 2 
      009F0D 5B 02            [ 2]    1     addw sp,#2 
      009F0F A6 04            [ 1] 5317 	ld a,#TK_INTGR 
      009F11 81               [ 4] 5318 	ret
                                   5319 
                                   5320 ;------------------------------
                                   5321 ; BASIC: XOR(expr1,expr2)
                                   5322 ; Apply bit XOR relation between
                                   5323 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5324 ; output:
                                   5325 ; 	A 		TK_INTGR
                                   5326 ;   X 		result 
                                   5327 ;------------------------------
      009F12                       5328 bit_xor:
      009F12 CD 92 52         [ 4] 5329 	call func_args 
      009F15 A1 02            [ 1] 5330 	cp a,#2
      009F17 27 03            [ 1] 5331 	jreq 1$
      009F19 CC 87 8F         [ 2] 5332 	jp syntax_error 
      009F1C                       5333 1$: 
      009F1C CD 90 0E         [ 4] 5334 	call dpop 
      009F1F 89               [ 2] 5335 	pushw x 
      009F20 CD 90 0E         [ 4] 5336 	call dpop 
      009F23 9E               [ 1] 5337 	ld a,xh 
      009F24 18 01            [ 1] 5338 	xor a,(1,sp)
      009F26 95               [ 1] 5339 	ld xh,a 
      009F27 9F               [ 1] 5340 	ld a,xl 
      009F28 18 02            [ 1] 5341 	xor a,(2,sp)
      009F2A 97               [ 1] 5342 	ld xl,a 
      001EAB                       5343 	_drop 2 
      009F2B 5B 02            [ 2]    1     addw sp,#2 
      009F2D A6 04            [ 1] 5344 	ld a,#TK_INTGR 
      009F2F 81               [ 4] 5345 	ret 
                                   5346 
                                   5347 ;------------------------------
                                   5348 ; BASIC: LSHIFT(expr1,expr2)
                                   5349 ; logical shift left expr1 by 
                                   5350 ; expr2 bits 
                                   5351 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5352 ; 	A 		TK_INTGR
                                   5353 ;   X 		result 
                                   5354 ;------------------------------
      009F30                       5355 lshift:
      009F30 CD 92 52         [ 4] 5356 	call func_args
      009F33 A1 02            [ 1] 5357 	cp a,#2 
      009F35 27 03            [ 1] 5358 	jreq 1$
      009F37 CC 87 8F         [ 2] 5359 	jp syntax_error
      009F3A CD 90 0E         [ 4] 5360 1$: call dpop  
      009F3D 51               [ 1] 5361 	exgw x,y 
      009F3E CD 90 0E         [ 4] 5362 	call dpop
      009F41 90 5D            [ 2] 5363 	tnzw y 
      009F43 27 05            [ 1] 5364 	jreq 4$
      009F45 58               [ 2] 5365 2$:	sllw x 
      009F46 90 5A            [ 2] 5366 	decw y 
      009F48 26 FB            [ 1] 5367 	jrne 2$
      009F4A                       5368 4$:  
      009F4A A6 04            [ 1] 5369 	ld a,#TK_INTGR
      009F4C 81               [ 4] 5370 	ret
                                   5371 
                                   5372 ;------------------------------
                                   5373 ; BASIC: RSHIFT(expr1,expr2)
                                   5374 ; logical shift right expr1 by 
                                   5375 ; expr2 bits.
                                   5376 ; output:
                                   5377 ; 	A 		TK_INTGR
                                   5378 ;   X 		result 
                                   5379 ;------------------------------
      009F4D                       5380 rshift:
      009F4D CD 92 52         [ 4] 5381 	call func_args
      009F50 A1 02            [ 1] 5382 	cp a,#2 
      009F52 27 03            [ 1] 5383 	jreq 1$
      009F54 CC 87 8F         [ 2] 5384 	jp syntax_error
      009F57 CD 90 0E         [ 4] 5385 1$: call dpop  
      009F5A 51               [ 1] 5386 	exgw x,y 
      009F5B CD 90 0E         [ 4] 5387 	call dpop
      009F5E 90 5D            [ 2] 5388 	tnzw y 
      009F60 27 05            [ 1] 5389 	jreq 4$
      009F62 54               [ 2] 5390 2$:	srlw x 
      009F63 90 5A            [ 2] 5391 	decw y 
      009F65 26 FB            [ 1] 5392 	jrne 2$
      009F67                       5393 4$:  
      009F67 A6 04            [ 1] 5394 	ld a,#TK_INTGR
      009F69 81               [ 4] 5395 	ret
                                   5396 
                                   5397 ;--------------------------
                                   5398 ; BASIC: FCPU integer
                                   5399 ; set CPU frequency 
                                   5400 ;-------------------------- 
                                   5401 
      009F6A                       5402 fcpu:
      009F6A A6 04            [ 1] 5403 	ld a,#TK_INTGR
      009F6C CD 92 21         [ 4] 5404 	call expect 
      009F6F 9F               [ 1] 5405 	ld a,xl 
      009F70 A4 07            [ 1] 5406 	and a,#7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009F72 C7 50 C6         [ 1] 5407 	ld CLK_CKDIVR,a 
      009F75 81               [ 4] 5408 	ret 
                                   5409 
                                   5410 ;------------------------------
                                   5411 ; BASIC: RND(expr)
                                   5412 ; return random number 
                                   5413 ; between 1 and expr inclusive
                                   5414 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5415 ; input:
                                   5416 ; 	none 
                                   5417 ; output:
                                   5418 ;	X 		random positive integer 
                                   5419 ;------------------------------
      009F76                       5420 random:
      009F76 CD 92 52         [ 4] 5421 	call func_args 
      009F79 A1 01            [ 1] 5422 	cp a,#1
      009F7B 27 03            [ 1] 5423 	jreq 1$
      009F7D CC 87 8F         [ 2] 5424 	jp syntax_error
      009F80                       5425 1$: 
      009F80 CD 90 0E         [ 4] 5426 	call dpop 
      009F83 89               [ 2] 5427 	pushw x 
      009F84 9E               [ 1] 5428 	ld a,xh 
      009F85 A5 80            [ 1] 5429 	bcp a,#0x80 
      009F87 27 05            [ 1] 5430 	jreq 2$
      009F89 A6 0A            [ 1] 5431 	ld a,#ERR_BAD_VALUE
      009F8B CC 87 91         [ 2] 5432 	jp tb_error
      009F8E                       5433 2$: 
                                   5434 ; acc16=(x<<5)^x 
      009F8E CE 00 0D         [ 2] 5435 	ldw x,seedx 
      009F91 58               [ 2] 5436 	sllw x 
      009F92 58               [ 2] 5437 	sllw x 
      009F93 58               [ 2] 5438 	sllw x 
      009F94 58               [ 2] 5439 	sllw x 
      009F95 58               [ 2] 5440 	sllw x 
      009F96 9E               [ 1] 5441 	ld a,xh 
      009F97 C8 00 0D         [ 1] 5442 	xor a,seedx 
      009F9A C7 00 09         [ 1] 5443 	ld acc16,a 
      009F9D 9F               [ 1] 5444 	ld a,xl 
      009F9E C8 00 0E         [ 1] 5445 	xor a,seedx+1 
      009FA1 C7 00 0A         [ 1] 5446 	ld acc8,a 
                                   5447 ; seedx=seedy 
      009FA4 CE 00 0F         [ 2] 5448 	ldw x,seedy 
      009FA7 CF 00 0D         [ 2] 5449 	ldw seedx,x  
                                   5450 ; seedy=seedy^(seedy>>1)
      009FAA 90 54            [ 2] 5451 	srlw y 
      009FAC 90 9E            [ 1] 5452 	ld a,yh 
      009FAE C8 00 0F         [ 1] 5453 	xor a,seedy 
      009FB1 C7 00 0F         [ 1] 5454 	ld seedy,a  
      009FB4 90 9F            [ 1] 5455 	ld a,yl 
      009FB6 C8 00 10         [ 1] 5456 	xor a,seedy+1 
      009FB9 C7 00 10         [ 1] 5457 	ld seedy+1,a 
                                   5458 ; acc16>>3 
      009FBC CE 00 09         [ 2] 5459 	ldw x,acc16 
      009FBF 54               [ 2] 5460 	srlw x 
      009FC0 54               [ 2] 5461 	srlw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009FC1 54               [ 2] 5462 	srlw x 
                                   5463 ; x=acc16^x 
      009FC2 9E               [ 1] 5464 	ld a,xh 
      009FC3 C8 00 09         [ 1] 5465 	xor a,acc16 
      009FC6 95               [ 1] 5466 	ld xh,a 
      009FC7 9F               [ 1] 5467 	ld a,xl 
      009FC8 C8 00 0A         [ 1] 5468 	xor a,acc8 
      009FCB 97               [ 1] 5469 	ld xl,a 
                                   5470 ; seedy=x^seedy 
      009FCC C8 00 10         [ 1] 5471 	xor a,seedy+1
      009FCF 97               [ 1] 5472 	ld xl,a 
      009FD0 9E               [ 1] 5473 	ld a,xh 
      009FD1 C8 00 0F         [ 1] 5474 	xor a,seedy
      009FD4 95               [ 1] 5475 	ld xh,a 
      009FD5 CF 00 0F         [ 2] 5476 	ldw seedy,x 
                                   5477 ; return seedy modulo expr + 1 
      009FD8 90 85            [ 2] 5478 	popw y 
      009FDA 65               [ 2] 5479 	divw x,y 
      009FDB 93               [ 1] 5480 	ldw x,y 
      009FDC 5C               [ 1] 5481 	incw x 
      009FDD A6 04            [ 1] 5482 	ld a,#TK_INTGR
      009FDF 81               [ 4] 5483 	ret 
                                   5484 
                                   5485 ;---------------------------------
                                   5486 ; BASIC: WORDS 
                                   5487 ; affiche la listes des mots du
                                   5488 ; dictionnaire.
                                   5489 ;---------------------------------
                           000001  5490 	WLEN=1
                           000002  5491 	LLEN=2  
                           000002  5492 	VSIZE=2 
      009FE0                       5493 words:
      001F60                       5494 	_vars VSIZE
      009FE0 52 02            [ 2]    1     sub sp,#VSIZE 
      009FE2 0F 02            [ 1] 5495 	clr (LLEN,sp)
      009FE4 90 AE A2 5A      [ 2] 5496 	ldw y,#kword_dict+2
      009FE8 93               [ 1] 5497 0$:	ldw x,y
      009FE9 F6               [ 1] 5498 	ld a,(x)
      009FEA A4 0F            [ 1] 5499 	and a,#15 
      009FEC 6B 01            [ 1] 5500 	ld (WLEN,sp),a 
      009FEE 5C               [ 1] 5501 1$:	incw x 
      009FEF F6               [ 1] 5502 	ld a,(x)
      009FF0 CD 82 26         [ 4] 5503 	call putc 
      009FF3 0C 02            [ 1] 5504 	inc (LLEN,sp)
      009FF5 0A 01            [ 1] 5505 	dec (WLEN,sp)
      009FF7 26 F5            [ 1] 5506 	jrne 1$
      009FF9 A6 46            [ 1] 5507 	ld a,#70
      009FFB 11 02            [ 1] 5508 	cp a,(LLEN,sp)
      009FFD 2B 09            [ 1] 5509 	jrmi 2$   
      009FFF A6 20            [ 1] 5510 	ld a,#SPACE 
      00A001 CD 82 26         [ 4] 5511 	call putc 
      00A004 0C 02            [ 1] 5512 	inc (LLEN,sp) 
      00A006 20 07            [ 2] 5513 	jra 3$
      00A008 A6 0D            [ 1] 5514 2$: ld a,#CR 
      00A00A CD 82 26         [ 4] 5515 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      00A00D 0F 02            [ 1] 5516 	clr (LLEN,sp)
      00A00F 72 A2 00 02      [ 2] 5517 3$:	subw y,#2 
      00A013 90 FE            [ 2] 5518 	ldw y,(y)
      00A015 26 D1            [ 1] 5519 	jrne 0$  
      001F97                       5520 	_drop VSIZE 
      00A017 5B 02            [ 2]    1     addw sp,#VSIZE 
      00A019 81               [ 4] 5521 	ret 
                                   5522 
                                   5523 
                                   5524 ;*********************************
                                   5525 
                                   5526 ;------------------------------
                                   5527 ;      dictionary 
                                   5528 ; format:
                                   5529 ;   link:   2 bytes 
                                   5530 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5531 ;   cmd_name: 16 byte max 
                                   5532 ;   code_address: 2 bytes 
                                   5533 ;------------------------------
                                   5534 	.macro _dict_entry len,name,cmd 
                                   5535 	.word LINK 
                                   5536 	LINK=.
                                   5537 name:
                                   5538 	.byte len 	
                                   5539 	.ascii "name"
                                   5540 	.word cmd 
                                   5541 	.endm 
                                   5542 
                           000000  5543 	LINK=0
      00A01A                       5544 kword_end:
      001F9A                       5545 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      00A01A 00 00                    1 	.word LINK 
                           001F9C     2 	LINK=.
      00A01C                          3 XOR:
      00A01C 43                       4 	.byte 3+F_IFUNC 	
      00A01D 58 4F 52                 5 	.ascii "XOR"
      00A020 9F 12                    6 	.word bit_xor 
      001FA2                       5546 	_dict_entry,5,WRITE,write  
      00A022 A0 1C                    1 	.word LINK 
                           001FA4     2 	LINK=.
      00A024                          3 WRITE:
      00A024 05                       4 	.byte 5 	
      00A025 57 52 49 54 45           5 	.ascii "WRITE"
      00A02A 9D C4                    6 	.word write 
      001FAC                       5547 	_dict_entry,5,WORDS,words 
      00A02C A0 24                    1 	.word LINK 
                           001FAE     2 	LINK=.
      00A02E                          3 WORDS:
      00A02E 05                       4 	.byte 5 	
      00A02F 57 4F 52 44 53           5 	.ascii "WORDS"
      00A034 9F E0                    6 	.word words 
      001FB6                       5548 	_dict_entry 4,WAIT,wait 
      00A036 A0 2E                    1 	.word LINK 
                           001FB8     2 	LINK=.
      00A038                          3 WAIT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      00A038 04                       4 	.byte 4 	
      00A039 57 41 49 54              5 	.ascii "WAIT"
      00A03D 97 88                    6 	.word wait 
      001FBF                       5549 	_dict_entry,3+F_IFUNC,USR,usr
      00A03F A0 38                    1 	.word LINK 
                           001FC1     2 	LINK=.
      00A041                          3 USR:
      00A041 43                       4 	.byte 3+F_IFUNC 	
      00A042 55 53 52                 5 	.ascii "USR"
      00A045 9E 75                    6 	.word usr 
      001FC7                       5550 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      00A047 A0 41                    1 	.word LINK 
                           001FC9     2 	LINK=.
      00A049                          3 UFLASH:
      00A049 46                       4 	.byte 6+F_IFUNC 	
      00A04A 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      00A050 9E 6F                    6 	.word uflash 
      001FD2                       5551 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      00A052 A0 49                    1 	.word LINK 
                           001FD4     2 	LINK=.
      00A054                          3 UBOUND:
      00A054 46                       4 	.byte 6+F_IFUNC 	
      00A055 55 42 4F 55 4E 44        5 	.ascii "UBOUND"
      00A05B 93 EF                    6 	.word ubound 
      001FDD                       5552 	_dict_entry,2,TO,to
      00A05D A0 54                    1 	.word LINK 
                           001FDF     2 	LINK=.
      00A05F                          3 TO:
      00A05F 02                       4 	.byte 2 	
      00A060 54 4F                    5 	.ascii "TO"
      00A062 98 7F                    6 	.word to 
      001FE4                       5553 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      00A064 A0 5F                    1 	.word LINK 
                           001FE6     2 	LINK=.
      00A066                          3 TICKS:
      00A066 45                       4 	.byte 5+F_IFUNC 	
      00A067 54 49 43 4B 53           5 	.ascii "TICKS"
      00A06C 9E BA                    6 	.word get_ticks 
      001FEE                       5554 	_dict_entry,4,STOP,stop 
      00A06E A0 66                    1 	.word LINK 
                           001FF0     2 	LINK=.
      00A070                          3 STOP:
      00A070 04                       4 	.byte 4 	
      00A071 53 54 4F 50              5 	.ascii "STOP"
      00A075 99 FB                    6 	.word stop 
      001FF7                       5555 	_dict_entry,4,STEP,step 
      00A077 A0 70                    1 	.word LINK 
                           001FF9     2 	LINK=.
      00A079                          3 STEP:
      00A079 04                       4 	.byte 4 	
      00A07A 53 54 45 50              5 	.ascii "STEP"
      00A07E 98 AF                    6 	.word step 
      002000                       5556 	_dict_entry,5,SLEEP,sleep 
      00A080 A0 79                    1 	.word LINK 
                           002002     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      00A082                          3 SLEEP:
      00A082 05                       4 	.byte 5 	
      00A083 53 4C 45 45 50           5 	.ascii "SLEEP"
      00A088 9E 9C                    6 	.word sleep 
      00200A                       5557 	_dict_entry,4+F_IFUNC,SIZE,size
      00A08A A0 82                    1 	.word LINK 
                           00200C     2 	LINK=.
      00A08C                          3 SIZE:
      00A08C 44                       4 	.byte 4+F_IFUNC 	
      00A08D 53 49 5A 45              5 	.ascii "SIZE"
      00A091 93 E5                    6 	.word size 
      002013                       5558     _dict_entry,4,SHOW,show 
      00A093 A0 8C                    1 	.word LINK 
                           002015     2 	LINK=.
      00A095                          3 SHOW:
      00A095 04                       4 	.byte 4 	
      00A096 53 48 4F 57              5 	.ascii "SHOW"
      00A09A 93 CB                    6 	.word show 
      00201C                       5559 	_dict_entry,4,SAVE,save
      00A09C A0 95                    1 	.word LINK 
                           00201E     2 	LINK=.
      00A09E                          3 SAVE:
      00A09E 04                       4 	.byte 4 	
      00A09F 53 41 56 45              5 	.ascii "SAVE"
      00A0A3 9B B7                    6 	.word save 
      002025                       5560 	_dict_entry 3,RUN,run
      00A0A5 A0 9E                    1 	.word LINK 
                           002027     2 	LINK=.
      00A0A7                          3 RUN:
      00A0A7 03                       4 	.byte 3 	
      00A0A8 52 55 4E                 5 	.ascii "RUN"
      00A0AB 99 B8                    6 	.word run 
      00202D                       5561 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      00A0AD A0 A7                    1 	.word LINK 
                           00202F     2 	LINK=.
      00A0AF                          3 RSHIFT:
      00A0AF 46                       4 	.byte 6+F_IFUNC 	
      00A0B0 52 53 48 49 46 54        5 	.ascii "RSHIFT"
      00A0B6 9F 4D                    6 	.word rshift 
      002038                       5562 	_dict_entry,3+F_IFUNC,RND,random 
      00A0B8 A0 AF                    1 	.word LINK 
                           00203A     2 	LINK=.
      00A0BA                          3 RND:
      00A0BA 43                       4 	.byte 3+F_IFUNC 	
      00A0BB 52 4E 44                 5 	.ascii "RND"
      00A0BE 9F 76                    6 	.word random 
      002040                       5563 	_dict_entry,6,RETURN,return 
      00A0C0 A0 BA                    1 	.word LINK 
                           002042     2 	LINK=.
      00A0C2                          3 RETURN:
      00A0C2 06                       4 	.byte 6 	
      00A0C3 52 45 54 55 52 4E        5 	.ascii "RETURN"
      00A0C9 99 98                    6 	.word return 
      00204B                       5564 	_dict_entry 6,REMARK,rem 
      00A0CB A0 C2                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



                           00204D     2 	LINK=.
      00A0CD                          3 REMARK:
      00A0CD 06                       4 	.byte 6 	
      00A0CE 52 45 4D 41 52 4B        5 	.ascii "REMARK"
      00A0D4 97 82                    6 	.word rem 
      002056                       5565 	_dict_entry,6,REBOOT,cold_start 
      00A0D6 A0 CD                    1 	.word LINK 
                           002058     2 	LINK=.
      00A0D8                          3 REBOOT:
      00A0D8 06                       4 	.byte 6 	
      00A0D9 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      00A0DF 85 D4                    6 	.word cold_start 
      002061                       5566 	_dict_entry,5+F_IFUNC,RDADC,read_adc
      00A0E1 A0 D8                    1 	.word LINK 
                           002063     2 	LINK=.
      00A0E3                          3 RDADC:
      00A0E3 45                       4 	.byte 5+F_IFUNC 	
      00A0E4 52 44 41 44 43           5 	.ascii "RDADC"
      00A0E9 9A 7F                    6 	.word read_adc 
      00206B                       5567 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      00A0EB A0 E3                    1 	.word LINK 
                           00206D     2 	LINK=.
      00A0ED                          3 QKEY:
      00A0ED 44                       4 	.byte 4+F_IFUNC 	
      00A0EE 51 4B 45 59              5 	.ascii "QKEY"
      00A0F2 9E 32                    6 	.word qkey 
      002074                       5568 	_dict_entry,6,PWRADC,power_adc 
      00A0F4 A0 ED                    1 	.word LINK 
                           002076     2 	LINK=.
      00A0F6                          3 PWRADC:
      00A0F6 06                       4 	.byte 6 	
      00A0F7 50 57 52 41 44 43        5 	.ascii "PWRADC"
      00A0FD 9A 32                    6 	.word power_adc 
      00207F                       5569 	_dict_entry 5,PRINT,print 
      00A0FF A0 F6                    1 	.word LINK 
                           002081     2 	LINK=.
      00A101                          3 PRINT:
      00A101 05                       4 	.byte 5 	
      00A102 50 52 49 4E 54           5 	.ascii "PRINT"
      00A107 96 7D                    6 	.word print 
      002089                       5570 	_dict_entry,4,POKE,poke 
      00A109 A1 01                    1 	.word LINK 
                           00208B     2 	LINK=.
      00A10B                          3 POKE:
      00A10B 04                       4 	.byte 4 	
      00A10C 50 4F 4B 45              5 	.ascii "POKE"
      00A110 98 1B                    6 	.word poke 
      002092                       5571 	_dict_entry,4+F_IFUNC,PEEK,peek 
      00A112 A1 0B                    1 	.word LINK 
                           002094     2 	LINK=.
      00A114                          3 PEEK:
      00A114 44                       4 	.byte 4+F_IFUNC 	
      00A115 50 45 45 4B              5 	.ascii "PEEK"
      00A119 98 2E                    6 	.word peek 
      00209B                       5572 	_dict_entry,5,PAUSE,pause 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      00A11B A1 14                    1 	.word LINK 
                           00209D     2 	LINK=.
      00A11D                          3 PAUSE:
      00A11D 05                       4 	.byte 5 	
      00A11E 50 41 55 53 45           5 	.ascii "PAUSE"
      00A123 9E A7                    6 	.word pause 
      0020A5                       5573 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A125 A1 1D                    1 	.word LINK 
                           0020A7     2 	LINK=.
      00A127                          3 OR:
      00A127 42                       4 	.byte 2+F_IFUNC 	
      00A128 4F 52                    5 	.ascii "OR"
      00A12A 9E F4                    6 	.word bit_or 
      0020AC                       5574 	_dict_entry,3+F_CONST,ODR,GPIO_ODR
      00A12C A1 27                    1 	.word LINK 
                           0020AE     2 	LINK=.
      00A12E                          3 ODR:
      00A12E C3                       4 	.byte 3+F_CONST 	
      00A12F 4F 44 52                 5 	.ascii "ODR"
      00A132 00 00                    6 	.word GPIO_ODR 
      0020B4                       5575 	_dict_entry,3,NEW,new
      00A134 A1 2E                    1 	.word LINK 
                           0020B6     2 	LINK=.
      00A136                          3 NEW:
      00A136 03                       4 	.byte 3 	
      00A137 4E 45 57                 5 	.ascii "NEW"
      00A13A 9A F5                    6 	.word new 
      0020BC                       5576 	_dict_entry,4,NEXT,next 
      00A13C A1 36                    1 	.word LINK 
                           0020BE     2 	LINK=.
      00A13E                          3 NEXT:
      00A13E 04                       4 	.byte 4 	
      00A13F 4E 45 58 54              5 	.ascii "NEXT"
      00A143 98 D7                    6 	.word next 
      0020C5                       5577 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A145 A1 3E                    1 	.word LINK 
                           0020C7     2 	LINK=.
      00A147                          3 LSHIFT:
      00A147 46                       4 	.byte 6+F_IFUNC 	
      00A148 4C 53 48 49 46 54        5 	.ascii "LSHIFT"
      00A14E 9F 30                    6 	.word lshift 
      0020D0                       5578 	_dict_entry,4,LOAD,load 
      00A150 A1 47                    1 	.word LINK 
                           0020D2     2 	LINK=.
      00A152                          3 LOAD:
      00A152 04                       4 	.byte 4 	
      00A153 4C 4F 41 44              5 	.ascii "LOAD"
      00A157 9C 7B                    6 	.word load 
      0020D9                       5579 	_dict_entry 4,LIST,list
      00A159 A1 52                    1 	.word LINK 
                           0020DB     2 	LINK=.
      00A15B                          3 LIST:
      00A15B 04                       4 	.byte 4 	
      00A15C 4C 49 53 54              5 	.ascii "LIST"
      00A160 94 39                    6 	.word list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      0020E2                       5580 	_dict_entry 3,LET,let 
      00A162 A1 5B                    1 	.word LINK 
                           0020E4     2 	LINK=.
      00A164                          3 LET:
      00A164 03                       4 	.byte 3 	
      00A165 4C 45 54                 5 	.ascii "LET"
      00A168 94 11                    6 	.word let 
      0020EA                       5581 	_dict_entry,3+F_IFUNC,KEY,key 
      00A16A A1 64                    1 	.word LINK 
                           0020EC     2 	LINK=.
      00A16C                          3 KEY:
      00A16C 43                       4 	.byte 3+F_IFUNC 	
      00A16D 4B 45 59                 5 	.ascii "KEY"
      00A170 9E 2A                    6 	.word key 
      0020F2                       5582 	_dict_entry,5,INPUT,input_var  
      00A172 A1 6C                    1 	.word LINK 
                           0020F4     2 	LINK=.
      00A174                          3 INPUT:
      00A174 05                       4 	.byte 5 	
      00A175 49 4E 50 55 54           5 	.ascii "INPUT"
      00A17A 97 0E                    6 	.word input_var 
      0020FC                       5583 	_dict_entry,2,IF,if 
      00A17C A1 74                    1 	.word LINK 
                           0020FE     2 	LINK=.
      00A17E                          3 IF:
      00A17E 02                       4 	.byte 2 	
      00A17F 49 46                    5 	.ascii "IF"
      00A181 98 41                    6 	.word if 
      002103                       5584 	_dict_entry,3+F_CONST,IDR,GPIO_IDR
      00A183 A1 7E                    1 	.word LINK 
                           002105     2 	LINK=.
      00A185                          3 IDR:
      00A185 C3                       4 	.byte 3+F_CONST 	
      00A186 49 44 52                 5 	.ascii "IDR"
      00A189 00 01                    6 	.word GPIO_IDR 
      00210B                       5585 	_dict_entry,3,HEX,hex_base
      00A18B A1 85                    1 	.word LINK 
                           00210D     2 	LINK=.
      00A18D                          3 HEX:
      00A18D 03                       4 	.byte 3 	
      00A18E 48 45 58                 5 	.ascii "HEX"
      00A191 93 DB                    6 	.word hex_base 
      002113                       5586 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A193 A1 8D                    1 	.word LINK 
                           002115     2 	LINK=.
      00A195                          3 GPIO:
      00A195 44                       4 	.byte 4+F_IFUNC 	
      00A196 47 50 49 4F              5 	.ascii "GPIO"
      00A19A 9E 3C                    6 	.word gpio 
      00211C                       5587 	_dict_entry,4,GOTO,goto 
      00A19C A1 95                    1 	.word LINK 
                           00211E     2 	LINK=.
      00A19E                          3 GOTO:
      00A19E 04                       4 	.byte 4 	
      00A19F 47 4F 54 4F              5 	.ascii "GOTO"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      00A1A3 99 46                    6 	.word goto 
      002125                       5588 	_dict_entry,5,GOSUB,gosub 
      00A1A5 A1 9E                    1 	.word LINK 
                           002127     2 	LINK=.
      00A1A7                          3 GOSUB:
      00A1A7 05                       4 	.byte 5 	
      00A1A8 47 4F 53 55 42           5 	.ascii "GOSUB"
      00A1AD 99 53                    6 	.word gosub 
      00212F                       5589 	_dict_entry,6,FORGET,forget 
      00A1AF A1 A7                    1 	.word LINK 
                           002131     2 	LINK=.
      00A1B1                          3 FORGET:
      00A1B1 06                       4 	.byte 6 	
      00A1B2 46 4F 52 47 45 54        5 	.ascii "FORGET"
      00A1B8 9C E3                    6 	.word forget 
      00213A                       5590 	_dict_entry,3,FOR,for 
      00A1BA A1 B1                    1 	.word LINK 
                           00213C     2 	LINK=.
      00A1BC                          3 FOR:
      00A1BC 03                       4 	.byte 3 	
      00A1BD 46 4F 52                 5 	.ascii "FOR"
      00A1C0 98 55                    6 	.word for 
      002142                       5591 	_dict_entry,4,FCPU,fcpu 
      00A1C2 A1 BC                    1 	.word LINK 
                           002144     2 	LINK=.
      00A1C4                          3 FCPU:
      00A1C4 04                       4 	.byte 4 	
      00A1C5 46 43 50 55              5 	.ascii "FCPU"
      00A1C9 9F 6A                    6 	.word fcpu 
      00214B                       5592 	_dict_entry,6+F_CONST,EEPROM,EEPROM_BASE  
      00A1CB A1 C4                    1 	.word LINK 
                           00214D     2 	LINK=.
      00A1CD                          3 EEPROM:
      00A1CD C6                       4 	.byte 6+F_CONST 	
      00A1CE 45 45 50 52 4F 4D        5 	.ascii "EEPROM"
      00A1D4 40 00                    6 	.word EEPROM_BASE 
      002156                       5593 	_dict_entry,3,DIR,directory 
      00A1D6 A1 CD                    1 	.word LINK 
                           002158     2 	LINK=.
      00A1D8                          3 DIR:
      00A1D8 03                       4 	.byte 3 	
      00A1D9 44 49 52                 5 	.ascii "DIR"
      00A1DC 9D 2E                    6 	.word directory 
      00215E                       5594 	_dict_entry,3,DEC,dec_base
      00A1DE A1 D8                    1 	.word LINK 
                           002160     2 	LINK=.
      00A1E0                          3 DEC:
      00A1E0 03                       4 	.byte 3 	
      00A1E1 44 45 43                 5 	.ascii "DEC"
      00A1E4 93 E0                    6 	.word dec_base 
      002166                       5595 	_dict_entry,3+F_CONST,DDR,GPIO_DDR
      00A1E6 A1 E0                    1 	.word LINK 
                           002168     2 	LINK=.
      00A1E8                          3 DDR:
      00A1E8 C3                       4 	.byte 3+F_CONST 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      00A1E9 44 44 52                 5 	.ascii "DDR"
      00A1EC 00 02                    6 	.word GPIO_DDR 
      00216E                       5596 	_dict_entry,3+F_CONST,CRL,GPIO_CR1
      00A1EE A1 E8                    1 	.word LINK 
                           002170     2 	LINK=.
      00A1F0                          3 CRL:
      00A1F0 C3                       4 	.byte 3+F_CONST 	
      00A1F1 43 52 4C                 5 	.ascii "CRL"
      00A1F4 00 03                    6 	.word GPIO_CR1 
      002176                       5597 	_dict_entry,3+F_CONST,CRH,GPIO_CR2
      00A1F6 A1 F0                    1 	.word LINK 
                           002178     2 	LINK=.
      00A1F8                          3 CRH:
      00A1F8 C3                       4 	.byte 3+F_CONST 	
      00A1F9 43 52 48                 5 	.ascii "CRH"
      00A1FC 00 04                    6 	.word GPIO_CR2 
      00217E                       5598 	_dict_entry,4+F_CFUNC,CHAR,char
      00A1FE A1 F8                    1 	.word LINK 
                           002180     2 	LINK=.
      00A200                          3 CHAR:
      00A200 84                       4 	.byte 4+F_CFUNC 	
      00A201 43 48 41 52              5 	.ascii "CHAR"
      00A205 9D FB                    6 	.word char 
      002187                       5599 	_dict_entry,3,BYE,bye 
      00A207 A2 00                    1 	.word LINK 
                           002189     2 	LINK=.
      00A209                          3 BYE:
      00A209 03                       4 	.byte 3 	
      00A20A 42 59 45                 5 	.ascii "BYE"
      00A20D 9E 93                    6 	.word bye 
      00218F                       5600 	_dict_entry,5,BTOGL,bit_toggle
      00A20F A2 09                    1 	.word LINK 
                           002191     2 	LINK=.
      00A211                          3 BTOGL:
      00A211 05                       4 	.byte 5 	
      00A212 42 54 4F 47 4C           5 	.ascii "BTOGL"
      00A217 97 DC                    6 	.word bit_toggle 
      002199                       5601 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A219 A2 11                    1 	.word LINK 
                           00219B     2 	LINK=.
      00A21B                          3 BTEST:
      00A21B 45                       4 	.byte 5+F_IFUNC 	
      00A21C 42 54 45 53 54           5 	.ascii "BTEST"
      00A221 97 F0                    6 	.word bit_test 
      0021A3                       5602 	_dict_entry,4,BSET,bit_set 
      00A223 A2 1B                    1 	.word LINK 
                           0021A5     2 	LINK=.
      00A225                          3 BSET:
      00A225 04                       4 	.byte 4 	
      00A226 42 53 45 54              5 	.ascii "BSET"
      00A22A 97 B3                    6 	.word bit_set 
      0021AC                       5603 	_dict_entry,4,BRES,bit_reset
      00A22C A2 25                    1 	.word LINK 
                           0021AE     2 	LINK=.
      00A22E                          3 BRES:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      00A22E 04                       4 	.byte 4 	
      00A22F 42 52 45 53              5 	.ascii "BRES"
      00A233 97 C7                    6 	.word bit_reset 
      0021B5                       5604 	_dict_entry,5,BREAK,break 
      00A235 A2 2E                    1 	.word LINK 
                           0021B7     2 	LINK=.
      00A237                          3 BREAK:
      00A237 05                       4 	.byte 5 	
      00A238 42 52 45 41 4B           5 	.ascii "BREAK"
      00A23D 9A A9                    6 	.word break 
      0021BF                       5605 	_dict_entry,4,BEEP,beep 
      00A23F A2 37                    1 	.word LINK 
                           0021C1     2 	LINK=.
      00A241                          3 BEEP:
      00A241 04                       4 	.byte 4 	
      00A242 42 45 45 50              5 	.ascii "BEEP"
      00A246 9A 0A                    6 	.word beep 
      0021C8                       5606 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A248 A2 41                    1 	.word LINK 
                           0021CA     2 	LINK=.
      00A24A                          3 ASC:
      00A24A 43                       4 	.byte 3+F_IFUNC 	
      00A24B 41 53 43                 5 	.ascii "ASC"
      00A24E 9E 0F                    6 	.word ascii 
      0021D0                       5607 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A250 A2 4A                    1 	.word LINK 
                           0021D2     2 	LINK=.
      00A252                          3 AND:
      00A252 43                       4 	.byte 3+F_IFUNC 	
      00A253 41 4E 44                 5 	.ascii "AND"
      00A256 9E D6                    6 	.word bit_and 
      00A258                       5608 kword_dict:
      0021D8                       5609 	_dict_entry,3+F_IFUNC,ABS,abs
      00A258 A2 52                    1 	.word LINK 
                           0021DA     2 	LINK=.
      00A25A                          3 ABS:
      00A25A 43                       4 	.byte 3+F_IFUNC 	
      00A25B 41 42 53                 5 	.ascii "ABS"
      00A25E 9E C0                    6 	.word abs 
                                   5610 	
                                   5611 
      00A280                       5612 	.bndry 128 ; align on FLASH block.
                                   5613 ; free space for user application  
      00A280                       5614 user_space:
                                   5615 ; USR() function test
      00A280 89               [ 2] 5616 	pushw x 
      00A281 72 1A 50 0A      [ 1] 5617 	bset PC_ODR,#5 
      00A285 85               [ 2] 5618 	popw x 
      00A286 CD 9E B1         [ 4] 5619 	call pause02 
      00A289 72 1B 50 0A      [ 1] 5620 	bres PC_ODR,#5 
      00A28D 81               [ 4] 5621 	ret
                                   5622 
                                   5623 	.area FLASH_DRIVE (ABS)
      010000                       5624 	.org 0x10000
      010000                       5625 fdrive:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



                                   5626 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        0021DA R   |     ADC_CR1 =  005401 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        0021D2 R
    ARG_CNT =  000001     |     ARG_OFS =  000002     |   5 ASC        0021CA R
    ATTRIB  =  000002     |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_TBR =  0050F2     |     B0_MASK =  000001     |     B115200 =  000006 
    B19200  =  000003     |     B1_MASK =  000002     |     B230400 =  000007 
    B2400   =  000000     |     B2_MASK =  000004     |     B38400  =  000004 
    B3_MASK =  000008     |     B460800 =  000008     |     B4800   =  000001 
    B4_MASK =  000010     |     B57600  =  000005     |     B5_MASK =  000020 
    B6_MASK =  000040     |     B7_MASK =  000080     |     B921600 =  000009 
    B9600   =  000002     |     BASE    =  000002     |     BASE_SAV=  000001 
  5 BEEP       0021C1 R   |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |     BELL    =  000007 
    BINARY  =  000001     |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BLOCK_ER=  000000     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  000005     |   5 BREAK      0021B7 R
  5 BRES       0021AE R   |   5 BSET       0021A5 R   |     BSIZE   =  000001 
    BSP     =  000008     |   5 BTEST      00219B R   |   5 BTOGL      002191 R
    BTW     =  000001     |     BUFIDX  =  000003     |   5 BYE        002189 R
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
  5 CHAR       002180 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
    CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0     |     CLK_ICKR=  000002 
    CLK_ICKR=  000000     |     CLK_ICKR=  000001     |     CLK_ICKR=  000003 
    CLK_ICKR=  000004     |     CLK_ICKR=  000005     |     CLK_PCKE=  0050C7 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Symbol Table

    CLK_PCKE=  000000     |     CLK_PCKE=  000001     |     CLK_PCKE=  000007 
    CLK_PCKE=  000005     |     CLK_PCKE=  000006     |     CLK_PCKE=  000004 
    CLK_PCKE=  000002     |     CLK_PCKE=  000003     |     CLK_PCKE=  0050CA 
    CLK_PCKE=  000003     |     CLK_PCKE=  000002     |     CLK_PCKE=  000007 
    CLK_SWCR=  0050C5     |     CLK_SWCR=  000000     |     CLK_SWCR=  000001 
    CLK_SWCR=  000002     |     CLK_SWCR=  000003     |     CLK_SWIM=  0050CD 
    CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1 
    CLK_SWR_=  0000D2     |     CMD_END =  000002     |     CNT     =  000008 
    COMMA   =  000001     |     COUNT   =  000001     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        002178 R
  5 CRL        002170 R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
    CTRL_C  =  000003     |     CTRL_D  =  000004     |     CTRL_E  =  000005 
    CTRL_F  =  000006     |     CTRL_G  =  000007     |     CTRL_H  =  000008 
    CTRL_I  =  000009     |     CTRL_J  =  00000A     |     CTRL_K  =  00000B 
    CTRL_L  =  00000C     |     CTRL_M  =  00000D     |     CTRL_N  =  00000E 
    CTRL_O  =  00000F     |     CTRL_P  =  000010     |     CTRL_Q  =  000011 
    CTRL_R  =  000012     |     CTRL_S  =  000013     |     CTRL_T  =  000014 
    CTRL_U  =  000015     |     CTRL_V  =  000016     |     CTRL_W  =  000017 
    CTRL_X  =  000018     |     CTRL_Y  =  000019     |     CTRL_Z  =  00001A 
    CTXT_SIZ=  000006     |     CURR    =  000002     |     CX_BPTR =  000001 
    CX_CNT  =  000005     |     CX_IN   =  000004     |     CX_LNO  =  000003 
    DBG_A   =  000005     |     DBG_CC  =  000006     |     DBG_X   =  000003 
    DBG_Y   =  000001     |   5 DDR        002168 R   |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   5 DEC        002160 R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        002158 R   |     DIVIDND =  000007     |     DIVISR  =  000005 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |     DSTACK_S=  000040 
  5 EEPROM     00214D R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |     EOF     =  0000FF     |     ERR_BAD_=  00000A 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_L=  000005 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |   5 FCPU       002144 R   |     FF      =  00000C 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_IA=  000006     |     FLASH_IA=  000001     |     FLASH_IA=  000000 
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   5 FOR        00213C R
  5 FORGET     002131 R   |     FRUN    =  000000     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FTRAP   =  000001     |     F_CFUNC =  000080 
    F_CMD   =  000000     |     F_CONST =  0000C0     |     F_IFUNC =  000040 
  5 GOSUB      002127 R   |     GOS_RET =  000003     |   5 GOTO       00211E R
  5 GPIO       002115 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   5 HEX        00210D R
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
    I2C_WRIT=  000000     |   5 IDR        002105 R   |   5 IF         0020FE R
    IN      =  000007     |     INCR    =  000001     |   5 INPUT      0020F4 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008004     |     INT_VECT=  008050     |     INT_VECT=  00804C 
    INT_VECT=  00805C     |     INT_VECT=  008058     |     INW     =  000003 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        0020EC R
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  5 LET        0020E4 R   |     LINENO  =  000005     |   5 LINK    =  0021DA R
  5 LIST       0020DB R   |     LL      =  000002     |     LLEN    =  000002 
    LL_HB   =  000001     |     LNO     =  000005     |     LN_PTR  =  000005 
  5 LOAD       0020D2 R   |   5 LSHIFT     0020C7 R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        0020B6 R
  5 NEXT       0020BE R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NL      =  00000A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R   |   5 ODR        0020AE R
    OP      =  000005     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |   5 OR         0020A7 R
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |     PAD_SIZE=  000028     |   5 PAUSE      00209D R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       002094 R   |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PI_BASE =  005028     |     PI_CR1  =  00502B     |     PI_CR2  =  00502C 
    PI_DDR  =  00502A     |     PI_IDR  =  005029     |     PI_ODR  =  005028 
  5 POKE       00208B R   |     PREV    =  000001     |   5 PRINT      002081 R
    PROD    =  000002     |     PSIZE   =  000001     |   5 PWRADC     002076 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

  5 QKEY       00206D R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 RDADC      002063 R   |   5 REBOOT     002058 R
  5 REG_A      000932 R   |   5 REG_CC     000936 R   |   5 REG_EPC    000925 R
  5 REG_SP     00093B R   |   5 REG_X      00092E R   |   5 REG_Y      00092A R
    RELOP   =  000005     |   5 REMARK     00204D R   |     RETL1   =  000001 
  5 RETURN     002042 R   |   5 RND        00203A R   |     ROP     =  004800 
  5 RSHIFT     00202F R   |     RST_SR  =  0050B3     |   5 RUN        002027 R
    RXCHAR  =  000001     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   5 SAVE       00201E R
    SDIVD   =  000002     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       002015 R   |     SIGN    =  000001 
  5 SIZE       00200C R   |     SKIP    =  000006     |   5 SLEEP      002002 R
    SPACE   =  000020     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  000080     |   5 STATES     0008E8 R   |   5 STEP       001FF9 R
  5 STOP       001FF0 R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      001FE6 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]

Symbol Table

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
    TK_CONST=  000009     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_IFUNC=  000007     |     TK_INTGR=  000004 
    TK_LE   =  000036     |     TK_LPARE=  00000B     |     TK_LT   =  000034 
    TK_MINUS=  000011     |     TK_MOD  =  000022     |     TK_MULT =  000020 
    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_PLUS =  000010 
    TK_QSTR =  00000A     |     TK_RPARE=  00000C     |     TK_SHARP=  00000E 
    TK_VAR  =  000005     |   5 TO         001FDF R   |   5 Timer4Up   000019 R
  5 TrapHand   00000A R   |     U8      =  000003     |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]

Symbol Table

    UART1_RX=  000004     |     UART1_SR=  005230     |     UART1_TX=  000005 
    UART3   =  000001     |     UART3_BA=  005240     |     UART3_BR=  005242 
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
    UBC     =  004801     |   5 UBOUND     001FD4 R   |   5 UFLASH     001FC9 R
  5 USER_ABO   00007E R   |   5 USR        001FC1 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 UserButt   000025 R
    VSIZ    =  000002     |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       001FB8 R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      001FAE R   |   5 WRITE      001FA4 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XADR    =  000001     |     XMASK   =  000001 
  5 XOR        001F9C R   |     XSAVE   =  000003     |     YSAVE   =  000003 
  5 abs        001E40 R   |   1 acc16      000008 R   |   1 acc24      000007 R
  1 acc8       000009 R   |   5 accept_c   000ADC R   |   5 add        00106F R
  5 ansi_seq   000A9E R   |   5 arg_list   0011AE R   |   1 array_si   00001D R
  5 ascii      001D8F R   |   5 at_tst     000DA9 R   |   5 atoi24     000EBC R
  5 atoi_exi   000F2A R   |   5 bad_port   001DEA R   |   1 base       000006 R
  1 basicptr   000004 R   |   5 beep       00198A R   |   5 bin_exit   000CAD R
  5 bit_and    001E56 R   |   5 bit_or     001E74 R   |   5 bit_rese   001747 R
  5 bit_set    001733 R   |   5 bit_test   001770 R   |   5 bit_togg   00175C R
  5 bit_xor    001E92 R   |   5 bkslsh_t   000D54 R   |   5 bksp       0001C2 R
  5 break      001A29 R   |   5 break_po   001A57 R   |   5 bye        001E13 R
  5 char       001D7B R   |   5 check_fu   0003E5 R   |   5 clear_ba   0005E1 R
  5 clear_va   0004EF R   |   5 clock_in   000099 R   |   5 cmd_itf    000B00 R
  5 cmd_name   00111A R   |   5 cmp_name   001ACB R   |   5 cold_sta   000554 R
  5 colon_ts   000D7D R   |   5 comma_ts   000D88 R   |   5 compile    0003F4 R
  5 convert_   000C35 R   |   1 count      000003 R   |   5 cp_loop    00115D R
  5 create_g   000344 R   |   5 cstk_pro   001039 R   |   5 dash_tst   000D9E R
  5 ddrop      000FB5 R   |   5 ddrop_n    000FF2 R   |   5 ddup       000FBE R
  5 dec_base   001360 R   |   5 del_back   000ACD R   |   5 del_line   00030C R
  5 del_ln     000ABE R   |   5 delete     0001D2 R   |   5 dir_loop   001CBA R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]

Symbol Table

  5 director   001CAE R   |   5 divide     0010C5 R   |   5 divu24_8   000A2B R
  5 dotr       001042 R   |   5 dotr_loo   001057 R   |   5 dots       00100F R
  5 dpick      000FCF R   |   5 dpop       000F8E R   |   5 dpush      000F81 R
  5 drive_fr   001D37 R   |   3 dstack     001740 R   |   3 dstack_u   001780 R
  5 dstk_pro   001005 R   |   1 dstkptr    000016 R   |   5 dswap      000F9B R
  5 eql_tst    000E09 R   |   5 equal      0015F0 R   |   5 err_bad_   0006BE R
  5 err_cmd_   00067F R   |   5 err_div0   000641 R   |   5 err_dupl   00069A R
  5 err_math   000627 R   |   5 err_mem_   00060A R   |   5 err_msg    0005F2 R
  5 err_no_a   0006CB R   |   5 err_no_l   000651 R   |   5 err_not_   0006AC R
  5 err_run_   000668 R   |   5 err_synt   000618 R   |   5 escaped    000C4A R
  5 expect     0011A1 R   |   5 expr_exi   0012F1 R   |   5 expressi   0012B0 R
  5 factor     001209 R   |   1 farptr     000010 R   |   5 fcpu       001EEA R
  7 fdrive     010000 R   |   5 fetch      000FDE R   |   5 fetchc     000BED R
  1 ffree      000013 R   |   5 file_cou   001D2F R   |   5 final_te   000A98 R
  5 first_li   0013E4 R   |   1 flags      00001F R   |   5 for        0017D5 R
  5 forget     001C63 R   |   1 free_ram   000055 R   |   5 func_arg   0011D2 R
  5 ge         0015F2 R   |   5 get_arra   0011E2 R   |   5 get_tick   001E3A R
  5 get_toke   000CEF R   |   5 getc       0001AF R   |   5 go_commo   0018F6 R
  5 gosub      0018D3 R   |   5 goto       0018C6 R   |   5 gpio       001DBC R
  5 gt         0015EE R   |   5 gt_tst     000E14 R   |   5 hex_base   00135B R
  5 hse_cloc   00018F R   |   5 hsi_cloc   000199 R   |   5 if         0017C1 R
  1 in         000001 R   |   1 in.saved   000002 R   |   1 in.w       000000 R
  5 incr_far   001A80 R   |   5 input_ex   0016FF R   |   5 input_lo   00169A R
  5 input_va   00168E R   |   5 insert_l   00037D R   |   5 insert_l   0003E2 R
  5 interp     00077F R   |   5 interp_l   0007BF R   |   5 invalid    000B45 R
  5 invalid_   000BC3 R   |   5 is_alpha   0004FD R   |   5 is_digit   000EA7 R
  5 itoa       0009E4 R   |   5 itoa_loo   0009FC R   |   5 key        001DAA R
  5 kword_di   0021D8 R   |   5 kword_en   001F9A R   |   5 last_lin   0013ED R
  5 le         0015F7 R   |   5 ledoff     000838 R   |   5 ledon      000833 R
  5 ledtoggl   00083D R   |   5 left_arr   000A9E R   |   5 left_par   000846 R
  5 let        001391 R   |   5 let02      00139B R   |   5 lines_sk   0013F2 R
  5 list       0013B9 R   |   5 list_exi   001439 R   |   5 list_sta   001415 R
  5 load       001BFB R   |   5 loop_bac   00189F R   |   1 loop_dep   00001C R
  5 loop_don   0018B4 R   |   5 lshift     001EB0 R   |   5 lt         0015F5 R
  5 lt_tst     000E4D R   |   5 mem_peek   000B62 R   |   5 modulo     001109 R
  5 move       0002A6 R   |   5 move_dow   0002C4 R   |   5 move_exi   0002E5 R
  5 move_loo   0002C9 R   |   5 move_up    0002B6 R   |   5 mul_char   0015DF R
  5 multiply   00107D R   |   5 mulu24_8   000F2E R   |   5 nbr_tst    000D2A R
  5 ne         0015FA R   |   5 neg_acc2   000A53 R   |   5 new        001A75 R
  5 next       001857 R   |   5 next_tok   0007EF R   |   5 no_match   00116F R
  5 none       000CEF R   |   5 number     000BF3 GR  |   5 other      000E85 R
  3 pad        001718 R   |   5 parse_bi   000C8D R   |   5 parse_in   000C52 R
  5 parse_ke   000CB5 R   |   5 parse_qu   000BFA R   |   5 pause      001E27 R
  5 pause02    001E31 R   |   5 peek       0017AE R   |   5 peek_byt   000B8D R
  5 plus_tst   000DDD R   |   5 poke       00179B R   |   5 power_ad   0019B2 R
  5 prcnt_ts   000DFE R   |   5 print      0015FD R   |   5 print_ex   001662 R
  5 print_fa   000BD2 R   |   5 print_in   000988 R   |   5 print_re   000895 R
  5 print_st   000B55 R   |   5 prt_basi   00148C R   |   5 prt_cmd_   00143C R
  5 prt_loop   001601 R   |   5 prt_peek   000256 R   |   5 prt_quot   001450 R
  5 prt_reg1   000876 R   |   5 prt_reg8   000851 R   |   5 prt_regs   0001EC R
  5 prti24     000940 R   |   1 ptr16      000011 R   |   1 ptr8       000012 R
  5 putc       0001A6 R   |   5 puts       0001B8 R   |   5 qkey       001DB2 R
  5 qmark_ts   000DB4 R   |   5 random     001EF6 R   |   5 read_adc   0019FF R
  5 readln     000A76 R   |   5 readln_l   000A7C R   |   5 readln_q   000AF1 R
  5 regs_sta   00022F R   |   5 rel_exit   001348 R   |   5 relation   0012F4 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]

Symbol Table

  5 relop_st   0015E2 R   |   5 rem        001702 R   |   5 repl       000B0E R
  5 repl_exi   000B36 R   |   5 reprint    000A9E R   |   5 reset_co   0015FF R
  5 rest_con   00167E R   |   5 return     001918 R   |   5 right_ar   000A9E R
  5 rparnt_t   000D72 R   |   5 rshift     001ECD R   |   5 rt_msg     0006FF R
  5 run        001938 R   |   5 save       001B37 R   |   5 save_con   00166E R
  5 search_d   00114C R   |   5 search_e   00119D R   |   5 search_f   001AEC R
  5 search_l   0002E8 R   |   5 search_l   0002F0 R   |   5 search_n   001150 R
  1 seedx      00000C R   |   1 seedy      00000E R   |   5 seek_fdr   001A8E R
  5 sharp_ts   000D93 R   |   5 show       00134B R   |   5 single_c   0015DB R
  5 size       001365 R   |   5 skip       000F68 R   |   5 slash_ts   000DF3 R
  5 sleep      001E1C R   |   5 software   00050E R   |   5 spaces     0001E0 R
  3 stack_fu   001780 R   |   3 stack_un   001800 R   |   5 star_tst   000DE8 R
  5 step       00182F R   |   5 stop       00197B R   |   5 store      000FE8 R
  5 store_lo   001841 R   |   5 str_matc   00117E R   |   5 str_tst    000D19 R
  5 strcmp     000287 R   |   5 strcpy     000298 R   |   5 strlen     00027A R
  5 substrac   001077 R   |   5 syntax_e   00070F R   |   1 tab_widt   000020 R
  5 tb_error   000711 R   |   5 term       001263 R   |   5 term01     00126C R
  5 term_exi   0012AD R   |   5 test_p     000B4D R   |   3 tib        0016C8 R
  5 tick_tst   000DCB R   |   1 ticks      00000A R   |   5 timer4_i   0000AF R
  5 to         0017FF R   |   5 to_upper   000EB0 GR  |   5 token_ch   000E94 R
  5 token_ex   000EA4 R   |   1 txtbgn     000018 R   |   1 txtend     00001A R
  5 uart3_in   000178 R   |   5 uart3_se   000188 R   |   5 uart_ena   0001A1 R
  5 ubound     00136F R   |   5 uflash     001DEF R   |   5 unget_to   000F7B R
  5 unlock_e   0000C4 R   |   5 unlock_f   0000D2 R   |   5 user_spa   002200 R
  5 usr        001DF5 R   |   1 vars       000021 R   |   5 wait       001708 R
  5 warm_sta   000763 R   |   5 words      001F60 R   |   5 write      001D44 R
  5 write_bl   000155 R   |   5 write_by   0000E0 R   |   5 write_ee   00011C R
  5 write_ex   000150 R   |   5 write_fl   000106 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     55   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   220E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

