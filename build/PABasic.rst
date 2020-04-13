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
                                        
                                     37     .list 
                                     38 
      000001                         39 _dbg 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



                           000001     1     DEBUG=1
                                     40 
                                     41 ;--------------------------------------
                                     42     .area DATA 
                                     43 ;--------------------------------------	
                                     44 
                           000050    45 	TIB_SIZE=80
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



                                     94 
                                     95 
                                     96 ;--------------------------------------
                                     97     .area HOME 
                                     98 ;--------------------------------------
      008000 82 00 85 E1             99     int cold_start
                           000001   100 .if DEBUG
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
      008058 82 00 80 89            125 	int NonHandledInterrupt ;int20 UART1 TX completed
      00805C 82 00 80 89            126 	int NonHandledInterrupt ;int21 UART1 RX full
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    148 ; software interrupt handler  
                                    149 ;------------------------------------
                           000001   150 .if DEBUG 
      00808A                        151 TrapHandler:
      00808A 72 12 00 20      [ 1]  152 	bset flags,#FTRAP 
      00808E CD 89 23         [ 4]  153 	call print_registers
      008091 CD 8B 8E         [ 4]  154 	call cmd_itf
      008094 72 13 00 20      [ 1]  155 	bres flags,#FTRAP 	
      008098 80               [11]  156 	iret
                                    157 .endif 
                                    158 
      008099                        159 Timer4UpdateHandler:
      008099 72 5F 53 42      [ 1]  160 	clr TIM4_SR 
      00809D CE 00 0B         [ 2]  161 	ldw x,ticks
      0080A0 5C               [ 2]  162 	incw x
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
      0080C7 CD 82 45         [ 4]  186 	call puts 
      0080CA CE 00 05         [ 2]  187 	ldw x,basicptr
      0080CD FE               [ 2]  188 	ldw x,(x)
                                    189 ; print line number 
      0080CE 35 0A 00 07      [ 1]  190 	mov base,#10 
      0080D2 35 06 00 21      [ 1]  191 	mov tab_width,#6
      0080D6 CD 8A 16         [ 4]  192 	call print_int  	
      0080D9 CE 00 05         [ 2]  193 	ldw x,basicptr 
      0080DC 1C 00 03         [ 2]  194 	addw x,#3  
      0080DF CD 82 45         [ 4]  195 	call puts 
      0080E2 A6 0D            [ 1]  196 	ld a,#CR 
      0080E4 CD 82 33         [ 4]  197 	call putc
      0080E7 5F               [ 1]  198 	clrw x  
      0080E8 C6 00 02         [ 1]  199 	ld a,in 
      0080EB AB 03            [ 1]  200 	add a,#3 ; adjustment for line number display 
      0080ED 97               [ 1]  201 	ld xl,a 
      0080EE CD 82 6D         [ 4]  202 	call spaces 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080F1 A6 5E            [ 1]  203 	ld a,#'^
      0080F3 CD 82 33         [ 4]  204 	call putc 
      0080F6                        205 9$:
      0080F6 AE 17 FF         [ 2]  206     ldw x,#STACK_EMPTY 
      0080F9 94               [ 1]  207     ldw sp,x
      0080FA 9A               [ 1]  208 	rim 
      0080FB CC 87 F1         [ 2]  209 	jp warm_start
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    255 ;----------------------------------
      008144                        256 unlock_eeprom:
      008144 35 AE 50 64      [ 1]  257 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008148 35 56 50 64      [ 1]  258     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00814C 72 07 50 5F FB   [ 2]  259 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008151 81               [ 4]  260 	ret
                                    261 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    310 ; a block is 128 bytes 
                                    311 ; input:
                                    312 ;   farptr  address block begin
                                    313 ; output:
                                    314 ;   none
                                    315 ;--------------------------------------
                                    316 erase_block:
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008164 6B 01            [ 1]  364 	ld (BTW,sp),a ; byte to write 
      008166 0F 02            [ 1]  365 	clr (OPT,sp)  ; OPTION flag
                                    366 ; put addr[15:0] in Y, for bounds check.
      008168 90 CE 00 12      [ 2]  367 	ldw y,farptr+1   ; Y=addr15:0
                                    368 ; check addr[23:16], if <> 0 then it is extened flash memory
      00816C 72 5D 00 11      [ 1]  369 	tnz farptr 
      008170 26 14            [ 1]  370 	jrne write_flash
      008172 90 A3 A4 00      [ 2]  371     cpw y,#user_space
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
      0081C3 5C               [ 2]  408     incw x
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                                    418 ;--------------------------------------------
                                    419 ; write a data block to eeprom or flash 
                                    420 ; input:
                                    421 ;   Y        source address   
                                    422 ;   X        array index  destination  farptr[x]
                                    423 ;   BSIZE    block size bytes 
                                    424 ;   farptr   write address , byte* 
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
      0081E4 5C               [ 2]  443 	incw x 
      0081E5 90 5C            [ 2]  444 	incw y 
      0081E7 1F 01            [ 2]  445 	ldw (XSAVE,sp),x
      0081E9 1E 05            [ 2]  446 	ldw x,(BSIZE,sp)
      0081EB 5A               [ 2]  447 	decw x
      0081EC 1F 05            [ 2]  448 	ldw (BSIZE,sp),x 
      0081EE 26 ED            [ 1]  449 	jrne 1$
      0081F0                        450 9$:
      0081F0 1E 01            [ 2]  451 	ldw x,(XSAVE,sp)
      0081F2 CD 9B 89         [ 4]  452 	call incr_farptr
      000175                        453 	_drop VSIZE
      0081F5 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081F7 81               [ 4]  454 	ret 
                                    455 
                                    456 
                                    457 ;---------------------------------------------
                                    458 ;   UART1 subroutines
                                    459 ;---------------------------------------------
                                    460 
                                    461 ;---------------------------------------------
                                    462 ; initialize UART1, 115200 8N1
                                    463 ; input:
                                    464 ;	none
                                    465 ; output:
                                    466 ;   none
                                    467 ;---------------------------------------------
      0081F8                        468 uart1_init:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081F8 72 1A 50 02      [ 1]  469     bset PA_DDR,#UART1_TX_PIN
      0081FC 72 1A 50 03      [ 1]  470     bset PA_CR1,#UART1_TX_PIN 
      008200 72 1A 50 04      [ 1]  471     bset PA_CR2,#UART1_TX_PIN 
                                    472 ; enable UART1 clock
      008204 72 14 50 C7      [ 1]  473 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008208                        474 uart1_set_baud: 
                                    475 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    476 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008208 A6 E1            [ 1]  477 	ld a,#CLK_SWR_HSI
      00820A C1 50 C3         [ 1]  478 	cp a,CLK_CMSR 
      00820D 27 0A            [ 1]  479 	jreq 2$ 
      00820F                        480 1$: ; 8 Mhz 	
      00820F 35 05 52 33      [ 1]  481 	mov UART1_BRR2,#0x05 ; must be loaded first
      008213 35 04 52 32      [ 1]  482 	mov UART1_BRR1,#0x4
      008217 20 08            [ 2]  483 	jra 3$
      008219                        484 2$: ; 16 Mhz 	
      008219 35 0B 52 33      [ 1]  485 	mov UART1_BRR2,#0x0b ; must be loaded first
      00821D 35 08 52 32      [ 1]  486 	mov UART1_BRR1,#0x08
      008221                        487 3$:
      008221 72 5F 52 31      [ 1]  488     clr UART1_DR
      008225 35 0C 52 35      [ 1]  489 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
      008229 72 10 52 35      [ 1]  490 	bset UART1_CR2,#UART_CR2_SBK
      00822D 72 0D 52 30 FB   [ 2]  491     btjf UART1_SR,#UART_SR_TC,.
      008232 81               [ 4]  492     ret
                                    493 
                                    494 ;---------------------------------
                                    495 ; send character to UART1 
                                    496 ; input:
                                    497 ;   A 
                                    498 ; output:
                                    499 ;   none 
                                    500 ;--------------------------------	
      008233                        501 putc:
      008233 72 0F 52 30 FB   [ 2]  502 	btjf UART1_SR,#UART_SR_TXE,.
      008238 C7 52 31         [ 1]  503 	ld UART1_DR,a 
      00823B 81               [ 4]  504 	ret 
                                    505 
                                    506 ;---------------------------------
                                    507 ; wait character from UART1 
                                    508 ; input:
                                    509 ;   none
                                    510 ; output:
                                    511 ;   A 			char  
                                    512 ;--------------------------------	
      00823C                        513 getc:
      00823C 72 0B 52 30 FB   [ 2]  514 	btjf UART1_SR,#UART_SR_RXNE,.
      008241 C6 52 31         [ 1]  515 	ld a,UART1_DR 
      008244 81               [ 4]  516 	ret 
                                    517 
                                    518 ;-----------------------------
                                    519 ; send an ASCIZ string to UART1 
                                    520 ; input: 
                                    521 ;   x 		char * 
                                    522 ; output:
                                    523 ;   none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    524 ;-------------------------------
      008245                        525 puts:
      008245 F6               [ 1]  526     ld a,(x)
      008246 27 06            [ 1]  527 	jreq 1$
      008248 CD 82 33         [ 4]  528 	call putc 
      00824B 5C               [ 2]  529 	incw x 
      00824C 20 F7            [ 2]  530 	jra puts 
      00824E 81               [ 4]  531 1$:	ret 
                                    532 
                                    533 
                                    534 ;---------------------------
                                    535 ; delete character at left 
                                    536 ; of cursor on terminal 
                                    537 ; input:
                                    538 ;   none 
                                    539 ; output:
                                    540 ;	none 
                                    541 ;---------------------------
      00824F                        542 bksp:
      00824F A6 08            [ 1]  543 	ld a,#BSP 
      008251 CD 82 33         [ 4]  544 	call putc 
      008254 A6 20            [ 1]  545 	ld a,#SPACE 
      008256 CD 82 33         [ 4]  546 	call putc 
      008259 A6 08            [ 1]  547 	ld a,#BSP 
      00825B CD 82 33         [ 4]  548 	call putc 
      00825E 81               [ 4]  549 	ret 
                                    550 ;---------------------------
                                    551 ; delete n character left of cursor 
                                    552 ; at terminal.
                                    553 ; input: 
                                    554 ;   A   	number of characters to delete.
                                    555 ; output:
                                    556 ;    none 
                                    557 ;--------------------------	
      00825F                        558 delete:
      00825F 88               [ 1]  559 	push a 
      008260 0D 01            [ 1]  560 0$:	tnz (1,sp)
      008262 27 07            [ 1]  561 	jreq 1$
      008264 CD 82 4F         [ 4]  562 	call bksp 
      008267 0A 01            [ 1]  563 	dec (1,sp)
      008269 20 F5            [ 2]  564 	jra 0$
      00826B 84               [ 1]  565 1$:	pop a 
      00826C 81               [ 4]  566 	ret
                                    567 
                                    568 ;--------------------------
                                    569 ; print n spaces on terminal
                                    570 ; input:
                                    571 ;  X 		number of spaces 
                                    572 ; output:
                                    573 ;	none 
                                    574 ;---------------------------
      00826D                        575 spaces:
      00826D A6 20            [ 1]  576 	ld a,#SPACE 
      00826F 5D               [ 2]  577 1$:	tnzw x
      008270 27 06            [ 1]  578 	jreq 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008272 CD 82 33         [ 4]  579 	call putc 
      008275 5A               [ 2]  580 	decw x
      008276 20 F7            [ 2]  581 	jra 1$
      008278                        582 9$: 
      008278 81               [ 4]  583 	ret 
                                    584 
                           000001   585 .if DEBUG 
                                    586 ;---------------------------------
                                    587 ;; print actual registers states 
                                    588 ;; as pushed on stack 
                                    589 ;; {Y,X,CC,A}
                                    590 ;---------------------------------
      008279                        591 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0001F9                        592 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0001F9                        593 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0001F9                        594 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0001F9                        595 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0001F9                        596 prt_regs:
      008279 AE 82 BC         [ 2]  597 	ldw x,#regs_state 
      00827C CD 82 45         [ 4]  598 	call puts
                                    599 ; register PC
      00827F 16 01            [ 2]  600 	ldw y,(1,sp)
      008281 AE 89 B3         [ 2]  601 	ldw x,#REG_EPC 
      008284 CD 89 04         [ 4]  602 	call prt_reg16 
                                    603 ; register CC 
      008287 7B 08            [ 1]  604 	ld a,(R_CC,sp)
      008289 AE 89 C4         [ 2]  605 	ldw x,#REG_CC 
      00828C CD 88 DF         [ 4]  606 	call prt_reg8 
                                    607 ; register A 
      00828F 7B 07            [ 1]  608 	ld a,(R_A,sp)
      008291 AE 89 C0         [ 2]  609 	ldw x,#REG_A 
      008294 CD 88 DF         [ 4]  610 	call prt_reg8 
                                    611 ; register X 
      008297 16 05            [ 2]  612 	ldw y,(R_X,sp)
      008299 AE 89 BC         [ 2]  613 	ldw x,#REG_X 
      00829C CD 89 04         [ 4]  614 	call prt_reg16 
                                    615 ; register Y 
      00829F 16 03            [ 2]  616 	ldw y,(R_Y,sp)
      0082A1 AE 89 B8         [ 2]  617 	ldw x,#REG_Y 
      0082A4 CD 89 04         [ 4]  618 	call prt_reg16 
                                    619 ; register SP 
      0082A7 90 96            [ 1]  620 	ldw y,sp
      0082A9 72 A9 00 08      [ 2]  621 	addw y,#6+ARG_OFS  
      0082AD AE 89 C9         [ 2]  622 	ldw x,#REG_SP
      0082B0 CD 89 04         [ 4]  623 	call prt_reg16
      0082B3 A6 0D            [ 1]  624 	ld a,#CR 
      0082B5 CD 82 33         [ 4]  625 	call putc
      0082B8 CD 82 33         [ 4]  626 	call putc   
      0082BB 81               [ 4]  627 	ret 
                                    628 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082BC 0A 72 65 67 69 73 74   629 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    630 
                                    631 
                                    632 ;--------------------
                                    633 ; print content at address in hex.
                                    634 ; input:
                                    635 ;   X 	address to peek 
                                    636 ; output:
                                    637 ;	none 
                                    638 ;--------------------	
      0082E3                        639 prt_peek:
      0082E3 89               [ 2]  640 	pushw x 
      0082E4 CF 00 09         [ 2]  641 	ldw acc16,x 
      0082E7 72 5F 00 08      [ 1]  642 	clr acc24 
      0082EB 5F               [ 1]  643 	clrw x 
      0082EC A6 10            [ 1]  644 	ld a,#16 
      0082EE CD 89 CE         [ 4]  645 	call prti24 
      0082F1 A6 3A            [ 1]  646 	ld a,#': 
      0082F3 CD 82 33         [ 4]  647 	call putc 
      0082F6 A6 20            [ 1]  648 	ld a,#SPACE 
      0082F8 CD 82 33         [ 4]  649 	call putc 
      0082FB 85               [ 2]  650 	popw x 
      0082FC F6               [ 1]  651 	ld a,(x)
      0082FD C7 00 0A         [ 1]  652 	ld acc8,a 
      008300 5F               [ 1]  653 	clrw x 
      008301 A6 10            [ 1]  654 	ld a,#16 
      008303 CD 89 CE         [ 4]  655 	call prti24
      008306 81               [ 4]  656 	ret 
                                    657 .endif ; DEBUG  
                                    658 
                                    659 ;-------------------------------------
                                    660 ; retrun string length
                                    661 ; input:
                                    662 ;   X         .asciz  
                                    663 ; output:
                                    664 ;   X         length 
                                    665 ;-------------------------------------
      008307                        666 strlen:
      008307 90 93            [ 1]  667 	ldw y,x 
      008309 5F               [ 1]  668 	clrw x 
      00830A 90 7D            [ 1]  669 1$:	tnz (y) 
      00830C 27 05            [ 1]  670 	jreq 9$ 
      00830E 5C               [ 2]  671 	incw x
      00830F 90 5C            [ 2]  672 	incw y 
      008311 20 F7            [ 2]  673 	jra 1$ 
      008313 81               [ 4]  674 9$: ret 
                                    675 
                                    676 ;------------------------------------
                                    677 ; compare 2 strings
                                    678 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    679 ;   X 		char* first string 
                                    680 ;   Y       char* second string 
                                    681 ; output:
                                    682 ;   A 		0|1 
                                    683 ;-------------------------------------
      008314                        684 strcmp:
      008314 F6               [ 1]  685 	ld a,(x)
      008315 27 0B            [ 1]  686 	jreq 5$ 
      008317 90 F1            [ 1]  687 	cp a,(y) 
      008319 26 05            [ 1]  688 	jrne 4$ 
      00831B 5C               [ 2]  689 	incw x 
      00831C 90 5C            [ 2]  690 	incw y 
      00831E 20 F4            [ 2]  691 	jra strcmp 
      008320                        692 4$: ; not same  
      008320 4F               [ 1]  693 	clr a 
      008321 81               [ 4]  694 	ret 
      008322                        695 5$: ; same 
      008322 A6 01            [ 1]  696 	ld a,#1 
      008324 81               [ 4]  697 	ret 
                                    698 
                                    699 
                                    700 ;---------------------------------------
                                    701 ;  copy src to dest 
                                    702 ; input:
                                    703 ;   X 		dest 
                                    704 ;   Y 		src 
                                    705 ; output: 
                                    706 ;   X 		dest 
                                    707 ;----------------------------------
      008325                        708 strcpy:
      008325 89               [ 2]  709 	pushw x 
      008326 90 F6            [ 1]  710 1$: ld a,(y)
      008328 27 06            [ 1]  711 	jreq 9$ 
      00832A F7               [ 1]  712 	ld (x),a 
      00832B 5C               [ 2]  713 	incw x 
      00832C 90 5C            [ 2]  714 	incw y 
      00832E 20 F6            [ 2]  715 	jra 1$ 
      008330 7F               [ 1]  716 9$:	clr (x)
      008331 85               [ 2]  717 	popw x 
      008332 81               [ 4]  718 	ret 
                                    719 
                                    720 ;---------------------------------------
                                    721 ; move memory block 
                                    722 ; input:
                                    723 ;   X 		destination 
                                    724 ;   Y 	    source 
                                    725 ;   acc16	size 
                                    726 ; output:
                                    727 ;   none 
                                    728 ;--------------------------------------
                           000001   729 	INCR=1 ; increament high byte 
                           000002   730 	LB=2 ; increament low byte 
                           000002   731 	VSIZE=2
      008333                        732 move:
      0002B3                        733 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008333 52 02            [ 2]    1     sub sp,#VSIZE 
      008335 0F 01            [ 1]  734 	clr (INCR,sp)
      008337 0F 02            [ 1]  735 	clr (LB,sp)
      008339 90 89            [ 2]  736 	pushw y 
      00833B 13 01            [ 2]  737 	cpw x,(1,sp) ; compare DEST to SRC 
      00833D 90 85            [ 2]  738 	popw y 
      00833F 27 31            [ 1]  739 	jreq move_exit ; x==y 
      008341 2B 0E            [ 1]  740 	jrmi move_down
      008343                        741 move_up: ; start from top address with incr=-1
      008343 72 BB 00 09      [ 2]  742 	addw x,acc16
      008347 72 B9 00 09      [ 2]  743 	addw y,acc16
      00834B 03 01            [ 1]  744 	cpl (INCR,sp)
      00834D 03 02            [ 1]  745 	cpl (LB,sp)   ; increment = -1 
      00834F 20 05            [ 2]  746 	jra move_loop  
      008351                        747 move_down: ; start from bottom address with incr=1 
      008351 5A               [ 2]  748     decw x 
      008352 90 5A            [ 2]  749 	decw y
      008354 0C 02            [ 1]  750 	inc (LB,sp) ; incr=1 
      008356                        751 move_loop:	
      008356 C6 00 09         [ 1]  752     ld a, acc16 
      008359 CA 00 0A         [ 1]  753 	or a, acc8
      00835C 27 14            [ 1]  754 	jreq move_exit 
      00835E 72 FB 01         [ 2]  755 	addw x,(INCR,sp)
      008361 72 F9 01         [ 2]  756 	addw y,(INCR,sp) 
      008364 90 F6            [ 1]  757 	ld a,(y)
      008366 F7               [ 1]  758 	ld (x),a 
      008367 89               [ 2]  759 	pushw x 
      008368 CE 00 09         [ 2]  760 	ldw x,acc16 
      00836B 5A               [ 2]  761 	decw x 
      00836C CF 00 09         [ 2]  762 	ldw acc16,x 
      00836F 85               [ 2]  763 	popw x 
      008370 20 E4            [ 2]  764 	jra move_loop
      008372                        765 move_exit:
      0002F2                        766 	_drop VSIZE
      008372 5B 02            [ 2]    1     addw sp,#VSIZE 
      008374 81               [ 4]  767 	ret 	
                                    768 
                                    769 ;-------------------------------------
                                    770 ; search text area for a line with 
                                    771 ; same number as line#  
                                    772 ; input:
                                    773 ;	X 			line# 
                                    774 ; output:
                                    775 ;   X 			addr of line | 0 
                                    776 ;   Y           line#|insert address if not found  
                                    777 ;-------------------------------------
                           000001   778 	LL=1 ; line length 
                           000002   779 	LB=2 ; line length low byte 
                           000002   780 	VSIZE=2 
      008375                        781 search_lineno:
      0002F5                        782 	_vars VSIZE
      008375 52 02            [ 2]    1     sub sp,#VSIZE 
      008377 0F 01            [ 1]  783 	clr (LL,sp)
      008379 90 CE 00 19      [ 2]  784 	ldw y,txtbgn
      00837D                        785 search_ln_loop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00837D 90 C3 00 1B      [ 2]  786 	cpw y,txtend 
      008381 2A 10            [ 1]  787 	jrpl 8$
      008383 90 F3            [ 1]  788 	cpw x,(y)
      008385 27 0E            [ 1]  789 	jreq 9$
      008387 2B 0A            [ 1]  790 	jrmi 8$ 
      008389 90 E6 02         [ 1]  791 	ld a,(2,y)
      00838C 6B 02            [ 1]  792 	ld (LB,sp),a 
      00838E 72 F9 01         [ 2]  793 	addw y,(LL,sp)
      008391 20 EA            [ 2]  794 	jra search_ln_loop 
      008393                        795 8$: 
      008393 5F               [ 1]  796 	clrw x 	
      008394 51               [ 1]  797 	exgw x,y 
      000315                        798 9$: _drop VSIZE
      008395 5B 02            [ 2]    1     addw sp,#VSIZE 
      008397 51               [ 1]  799 	exgw x,y   
      008398 81               [ 4]  800 	ret 
                                    801 
                                    802 ;-------------------------------------
                                    803 ; delete line at addr
                                    804 ; move new line to insert with end of text 
                                    805 ; otherwise it would be overwritten.
                                    806 ; input:
                                    807 ;   X 		addr of line i.e DEST for move 
                                    808 ;-------------------------------------
                           000001   809 	LLEN=1
                           000003   810 	SRC=3
                           000004   811 	VSIZE=4
      008399                        812 del_line: 
      000319                        813 	_vars VSIZE 
      008399 52 04            [ 2]    1     sub sp,#VSIZE 
      00839B E6 02            [ 1]  814 	ld a,(2,x) ; line length
      00839D 6B 02            [ 1]  815 	ld (LLEN+1,sp),a 
      00839F 0F 01            [ 1]  816 	clr (LLEN,sp)
      0083A1 90 93            [ 1]  817 	ldw y,x  
      0083A3 72 F9 01         [ 2]  818 	addw y,(LLEN,sp) ;SRC  
      0083A6 17 03            [ 2]  819 	ldw (SRC,sp),y  ;save source 
      0083A8 90 CE 00 1B      [ 2]  820 	ldw y,txtend 
      0083AC 90 E6 02         [ 1]  821 	ld a,(2,y)
      0083AF 90 5F            [ 1]  822 	clrw y 
      0083B1 90 97            [ 1]  823 	ld yl,a  
      0083B3 72 B9 00 1B      [ 2]  824 	addw y,txtend
      0083B7 72 F2 03         [ 2]  825 	subw y,(SRC,sp) ; y=count 
      0083BA 90 CF 00 09      [ 2]  826 	ldw acc16,y 
      0083BE 16 03            [ 2]  827 	ldw y,(SRC,sp)    ; source
      0083C0 CD 83 33         [ 4]  828 	call move
      0083C3 90 CE 00 1B      [ 2]  829 	ldw y,txtend 
      0083C7 72 F2 01         [ 2]  830 	subw y,(LLEN,sp)
      0083CA 90 CF 00 1B      [ 2]  831 	ldw txtend,y  
      00034E                        832 	_drop VSIZE     
      0083CE 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083D0 81               [ 4]  833 	ret 
                                    834 
                                    835 ;---------------------------------------------
                                    836 ; create a gap in text area 
                                    837 ; move new line to insert in gap with end of text
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    838 ; otherwise it would be overwritten.
                                    839 ; input:
                                    840 ;    X 			addr gap start 
                                    841 ;    Y 			gap length 
                                    842 ; output:
                                    843 ;    X 			addr gap start 
                                    844 ;--------------------------------------------
                           000001   845 	DEST=1
                           000003   846 	SRC=3
                           000005   847 	LEN=5
                           000006   848 	VSIZE=6 
      0083D1                        849 create_gap:
      000351                        850 	_vars VSIZE
      0083D1 52 06            [ 2]    1     sub sp,#VSIZE 
      0083D3 1F 03            [ 2]  851 	ldw (SRC,sp),x 
      0083D5 17 05            [ 2]  852 	ldw (LEN,sp),y 
      0083D7 90 CF 00 09      [ 2]  853 	ldw acc16,y 
      0083DB 90 93            [ 1]  854 	ldw y,x ; SRC
      0083DD 72 BB 00 09      [ 2]  855 	addw x,acc16  
      0083E1 1F 01            [ 2]  856 	ldw (DEST,sp),x 
                                    857 ;compute size to move 	
      0083E3 CE 00 1B         [ 2]  858 	ldw x,txtend 
      0083E6 E6 02            [ 1]  859 	ld a,(2,x) ; pending line length 
      0083E8 C7 00 0A         [ 1]  860 	ld acc8,a 
      0083EB 72 5F 00 09      [ 1]  861 	clr acc16 
      0083EF 72 BB 00 09      [ 2]  862 	addw x,acc16 
      0083F3 72 F0 03         [ 2]  863 	subw x,(SRC,sp)
      0083F6 CF 00 09         [ 2]  864 	ldw acc16,x ; size to move
      0083F9 1E 01            [ 2]  865 	ldw x,(DEST,sp) 
      0083FB CD 83 33         [ 4]  866 	call move
      0083FE CE 00 1B         [ 2]  867 	ldw x,txtend
      008401 72 FB 05         [ 2]  868 	addw x,(LEN,sp)
      008404 CF 00 1B         [ 2]  869 	ldw txtend,x
      000387                        870 9$:	_drop VSIZE 
      008407 5B 06            [ 2]    1     addw sp,#VSIZE 
      008409 81               [ 4]  871 	ret 
                                    872 
                                    873 
                                    874 ;--------------------------------------------
                                    875 ; insert line in tib into text area 
                                    876 ; first search for already existing 
                                    877 ; replace existing 
                                    878 ; if strlen(tib)==0 delete existing 
                                    879 ; input:
                                    880 ;   ptr16 				pointer to tokenized line  
                                    881 ; output:
                                    882 ;   none
                                    883 ;---------------------------------------------
                           000001   884 	DEST=1  ; text area insertion address 
                           000003   885 	SRC=3   ; str to insert address 
                           000005   886 	LINENO=5 ; line number 
                           000007   887 	LLEN=7 ; line length 
                           000008   888 	VSIZE=8  
      00840A                        889 insert_line:
      00038A                        890 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      00840A 52 08            [ 2]    1     sub sp,#VSIZE 
      00840C CE 00 12         [ 2]  891 	ldw x,ptr16  
      00840F C3 00 19         [ 2]  892 	cpw x,txtbgn 
      008412 26 0D            [ 1]  893 	jrne 0$
                                    894 ;first text line 
      008414 AE 00 02         [ 2]  895 	ldw x,#2 
      008417 72 D6 00 12      [ 4]  896 	ld a,([ptr16],x)
      00841B 5F               [ 1]  897 	clrw x 
      00841C 97               [ 1]  898 	ld xl,a
      00841D 1F 07            [ 2]  899 	ldw (LLEN,sp),x  
      00841F 20 45            [ 2]  900 	jra 5$
      008421 72 CE 00 12      [ 5]  901 0$:	ldw x,[ptr16]
                                    902 ; new line number
      008425 1F 05            [ 2]  903 	ldw (LINENO,sp),x 
      008427 AE 00 02         [ 2]  904 	ldw x,#2 
      00842A 72 D6 00 12      [ 4]  905 	ld a,([ptr16],x)
      00842E 97               [ 1]  906 	ld xl,a
                                    907 ; new line length
      00842F 1F 07            [ 2]  908 	ldw (LLEN,sp),x
                                    909 ; check if that line number already exit 	
      008431 1E 05            [ 2]  910 	ldw x,(LINENO,sp)
      008433 CD 83 75         [ 4]  911 	call search_lineno 
      008436 5D               [ 2]  912 	tnzw x 
      008437 26 04            [ 1]  913 	jrne 2$
                                    914 ; line doesn't exit
                                    915 ; it will be inserted at this point.  	
      008439 17 01            [ 2]  916 	ldw (DEST,sp),y 
      00843B 20 05            [ 2]  917 	jra 3$
                                    918 ; line exit delete it.
                                    919 ; it will be replaced by new one 	
      00843D 1F 01            [ 2]  920 2$: ldw (DEST,sp),x 
      00843F CD 83 99         [ 4]  921 	call del_line
      008442                        922 3$: 
                                    923 ; insert new line or leave if LLEN==3
                                    924 ; LLEN==3 means empty line 
      008442 A6 03            [ 1]  925 	ld a,#3
      008444 11 08            [ 1]  926 	cp a,(LLEN+1,sp)
      008446 27 27            [ 1]  927 	jreq insert_ln_exit ; empty line exit.
                                    928 ; if insertion point at txtend 
                                    929 ; no move required 
      008448 1E 01            [ 2]  930 	ldw x,(DEST,sp)
      00844A C3 00 1B         [ 2]  931 	cpw x,txtend 
      00844D 2A 17            [ 1]  932 	jrpl 5$ 
                                    933 ; must create a gap
                                    934 ; at insertion point  
      00844F 1E 01            [ 2]  935 	ldw x,(DEST,sp)
      008451 16 07            [ 2]  936 	ldw y,(LLEN,sp)
      008453 CD 83 D1         [ 4]  937 	call create_gap 
                                    938 ; move new line in gap 
      008456 1E 07            [ 2]  939 	ldw x,(LLEN,sp)
      008458 CF 00 09         [ 2]  940 	ldw acc16,x 
      00845B 90 CE 00 1B      [ 2]  941 	ldw y,txtend ;SRC 
      00845F 1E 01            [ 2]  942 	ldw x,(DEST,sp) ; dest address 
      008461 CD 83 33         [ 4]  943 	call move 
      008464 20 09            [ 2]  944 	jra insert_ln_exit  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008466                        945 5$: ; no move required 
      008466 1E 07            [ 2]  946 	ldw x,(LLEN,sp) 
      008468 72 BB 00 1B      [ 2]  947 	addw x,txtend 
      00846C CF 00 1B         [ 2]  948 	ldw txtend,x 
      00846F                        949 insert_ln_exit:	
      0003EF                        950 	_drop VSIZE
      00846F 5B 08            [ 2]    1     addw sp,#VSIZE 
      008471 81               [ 4]  951 	ret
                                    952 
                                    953 
                                    954 ;-----------------------------
                                    955 ; check if text buffer full
                                    956 ; input:
                                    957 ;   ptr16     addr start tokenize line 
                                    958 ;   X         buffer index 
                                    959 ; output:
                                    960 ;   none 
                                    961 ;-----------------------------------
      008472                        962 check_full:
      008472 72 BB 00 12      [ 2]  963 	addw x,ptr16 
      008476 A3 16 C8         [ 2]  964 	cpw x,#tib 
      008479 25 05            [ 1]  965 	jrult 1$
      00847B A6 01            [ 1]  966 	ld a,#ERR_MEM_FULL
      00847D CC 87 9F         [ 2]  967 	jp tb_error 
      008480 81               [ 4]  968 1$: ret 
                                    969 
                                    970 
                                    971 ;-----------------------------------
                                    972 ; create token list form text line 
                                    973 ; save this list in text area
                                    974 ; input:
                                    975 ;   none
                                    976 ; output:
                                    977 ;   basicptr     token list buffer
                                    978 ;   line# 		 BASIC line number 
                                    979 ;   in.w  		 cleared 
                                    980 ;-----------------------------------
                                    981 	.macro _incr_ptr16 n 
                                    982 	ldw x,#n 
                                    983 	addw x,ptr16 
                                    984 	ldw ptr16,x 
                                    985 	.endm 
                                    986 
                           000001   987 	XSAVE=1
                           000003   988 	BUFIDX=3
                           000004   989 	VSIZE=4
      008481                        990 compile:
      000401                        991 	_vars VSIZE 
      008481 52 04            [ 2]    1     sub sp,#VSIZE 
      008483 72 1A 00 20      [ 1]  992 	bset flags,#FCOMP 
      008487 CE 00 1B         [ 2]  993 	ldw x,txtend
      00848A CF 00 12         [ 2]  994 	ldw ptr16,x 
      00848D 5F               [ 1]  995 	clrw x 
      00848E AE 00 03         [ 2]  996 	ldw x,#3
      008491 1F 03            [ 2]  997 	ldw (BUFIDX,sp),X  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008493 CD 84 72         [ 4]  998 	call check_full
      008496 5F               [ 1]  999 	clrw x 
      008497 72 CF 00 12      [ 5] 1000 	ldw [ptr16],x 
      00849B CD 8D 7D         [ 4] 1001 	call get_token
      00849E 1F 01            [ 2] 1002 	ldw (XSAVE,sp),x 
      0084A0 A1 04            [ 1] 1003 	cp a,#TK_INTGR 
      0084A2 26 11            [ 1] 1004 	jrne 3$
      0084A4 A3 00 00         [ 2] 1005 	cpw x,#0  
      0084A7 22 03            [ 1] 1006 	jrugt 1$
      0084A9 CC 87 9D         [ 2] 1007 	jp syntax_error 
      0084AC 72 CF 00 12      [ 5] 1008 1$:	ldw [ptr16],x; line number
      0084B0 CD 8D 7D         [ 4] 1009 2$:	call get_token
      0084B3 1F 01            [ 2] 1010 	ldw (XSAVE,sp),x 
      0084B5 A1 00            [ 1] 1011 3$:	cp a,#TK_NONE 
      0084B7 26 03            [ 1] 1012 	jrne 30$
      0084B9 CC 85 4C         [ 2] 1013 	jp 9$
      0084BC                       1014 30$: 	 
      0084BC 1E 03            [ 2] 1015 	ldw x,(BUFIDX,sp)
      0084BE CD 84 72         [ 4] 1016 	call check_full 
      0084C1 16 03            [ 2] 1017 	ldw y,(BUFIDX,sp) 
      0084C3 91 D7 12         [ 4] 1018 	ld ([ptr16],y),a ; token attribute 
      0084C6 90 5C            [ 2] 1019 	incw y
      0084C8 17 03            [ 2] 1020 	ldw (BUFIDX,sp),y
      0084CA A1 01            [ 1] 1021 	cp a,#TK_COLON 
      0084CC 26 02            [ 1] 1022 	jrne 31$
      0084CE 20 E0            [ 2] 1023 	jra 2$ 
      0084D0                       1024 31$:
      0084D0 A1 03            [ 1] 1025 	cp a,#TK_CHAR
      0084D2 26 0C            [ 1] 1026 	jrne 32$ 
      0084D4 1E 01            [ 2] 1027 	ldw x,(XSAVE,sp)
      0084D6 9F               [ 1] 1028 	ld a,xl 
      0084D7 91 D7 12         [ 4] 1029 	ld ([ptr16],y),a
      0084DA 90 5C            [ 2] 1030 	incw y 
      0084DC 17 03            [ 2] 1031 	ldw (BUFIDX,sp),y 
      0084DE 20 D0            [ 2] 1032 	jra 2$ 
      0084E0                       1033 32$:
      0084E0 A1 02            [ 1] 1034 	cp a,#TK_ARRAY 
      0084E2 27 CC            [ 1] 1035 	jreq 2$ 
      0084E4 A1 0A            [ 1] 1036 	cp a,#TK_QSTR 
      0084E6 26 25            [ 1] 1037 	jrne 4$
      0084E8 AE 17 18         [ 2] 1038 	ldw x,#pad 
      0084EB CD 83 07         [ 4] 1039 	call strlen
      0084EE 5C               [ 2] 1040 	incw x  
      0084EF CD 84 72         [ 4] 1041 	call check_full 
      0084F2 90 AE 17 18      [ 2] 1042 	ldw y,#pad 
      0084F6 CE 00 12         [ 2] 1043 	ldw x,ptr16
      0084F9 72 FB 03         [ 2] 1044 	addw x,(BUFIDX,sp)	
      0084FC CD 83 25         [ 4] 1045 	call strcpy 
      0084FF AE 17 18         [ 2] 1046 	ldw x,#pad 
      008502 CD 83 07         [ 4] 1047 	call strlen 
      008505 5C               [ 2] 1048 	incw x
      008506 72 FB 03         [ 2] 1049 	addw x,(BUFIDX,sp) 
      008509 1F 03            [ 2] 1050 	ldw (BUFIDX,sp),x
      00850B 20 A3            [ 2] 1051 	jra 2$  
      00850D A1 04            [ 1] 1052 4$: cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00850F 25 9F            [ 1] 1053 	jrult 2$
      008511 A1 09            [ 1] 1054 	cp a,#TK_CONST 
      008513 22 9B            [ 1] 1055 	Jrugt 2$
      008515 1E 01            [ 2] 1056 	ldw x,(XSAVE,sp) 
      008517 16 03            [ 2] 1057 	ldw y,(BUFIDX,sp)
      008519 91 DF 12         [ 5] 1058 	ldw ([ptr16],y),x
      00851C A3 97 92         [ 2] 1059 	cpw x,#rem 
      00851F 26 22            [ 1] 1060 	jrne 5$	
                                   1061 ; comment advance in.w to eol 
      008521 72 A9 00 02      [ 2] 1062 	addw y,#2 ; skip exec address 
      008525 17 03            [ 2] 1063 	ldw (BUFIDX,sp),y 
      008527 CE 00 12         [ 2] 1064 	ldw x,ptr16 
      00852A 72 FB 03         [ 2] 1065 	addw x,(BUFIDX,sp)
      00852D 90 CE 00 01      [ 2] 1066 	ldw y,in.w 
      008531 72 A9 16 C8      [ 2] 1067 	addw y,#tib 
      008535 CD 83 25         [ 4] 1068 	call strcpy 	
      008538 CD 83 07         [ 4] 1069 	call strlen 
      00853B 5C               [ 2] 1070 	incw x ; skip string 0. 
      00853C 72 FB 03         [ 2] 1071 	addw x,(BUFIDX,sp)
      00853F 1F 03            [ 2] 1072 	ldw (BUFIDX,sp),x 
      008541 20 09            [ 2] 1073 	jra 9$
      008543 72 A9 00 02      [ 2] 1074 5$:	addw y,#2 
      008547 17 03            [ 2] 1075 	ldw (BUFIDX,sp),y 
      008549 CC 84 B0         [ 2] 1076 	jp 2$
      00854C                       1077 9$: 
      00854C AE 00 02         [ 2] 1078 	ldw x,#2
      00854F 16 03            [ 2] 1079 	ldw y,(BUFIDX,sp)
      008551 90 9F            [ 1] 1080 	ld a,yl 
      008553 72 D7 00 12      [ 4] 1081 	ld ([ptr16],x),a  	
      008557 72 CE 00 12      [ 5] 1082 	ldw x,[ptr16]
      00855B 27 09            [ 1] 1083 	jreq 10$
      00855D CD 84 0A         [ 4] 1084 	call insert_line
      008560 72 5F 00 04      [ 1] 1085 	clr  count 
      008564 20 0F            [ 2] 1086 	jra  11$ 
      008566                       1087 10$: 
      008566 CE 00 12         [ 2] 1088 	ldw x,ptr16 
      008569 CF 00 05         [ 2] 1089 	ldw basicptr,x 
      00856C E6 02            [ 1] 1090 	ld a,(2,x)
      00856E C7 00 04         [ 1] 1091 	ld count,a 
      008571 35 03 00 02      [ 1] 1092 	mov in,#3 
      008575                       1093 11$:
      0004F5                       1094 	_drop VSIZE 
      008575 5B 04            [ 2]    1     addw sp,#VSIZE 
      008577 72 1B 00 20      [ 1] 1095 	bres flags,#FCOMP 
      00857B 81               [ 4] 1096 	ret 
                                   1097 
                                   1098 
                                   1099 ;------------------------------------
                                   1100 ;  set all variables to zero 
                                   1101 ; input:
                                   1102 ;   none 
                                   1103 ; output:
                                   1104 ;	none
                                   1105 ;------------------------------------
      00857C                       1106 clear_vars:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00857C AE 00 22         [ 2] 1107 	ldw x,#vars 
      00857F 90 AE 00 34      [ 2] 1108 	ldw y,#2*26 
      008583 7F               [ 1] 1109 1$:	clr (x)
      008584 5C               [ 2] 1110 	incw x 
      008585 90 5A            [ 2] 1111 	decw y 
      008587 26 FA            [ 1] 1112 	jrne 1$
      008589 81               [ 4] 1113 	ret 
                                   1114 
                                   1115 ;-------------------------------------
                                   1116 ; check if A is a letter
                                   1117 ; input:
                                   1118 ;   A 			character to test 
                                   1119 ; output:
                                   1120 ;   C flag      1 true, 0 false 
                                   1121 ;-------------------------------------
      00858A                       1122 is_alpha:
      00858A A1 41            [ 1] 1123 	cp a,#'A 
      00858C 8C               [ 1] 1124 	ccf
      00858D 24 0B            [ 1] 1125 	jrnc 9$ 
      00858F A1 5B            [ 1] 1126 	cp a,#'Z+1 
      008591 25 07            [ 1] 1127 	jrc 9$ 
      008593 A1 61            [ 1] 1128 	cp a,#'a 
      008595 8C               [ 1] 1129 	ccf 
      008596 24 02            [ 1] 1130 	jrnc 9$
      008598 A1 7B            [ 1] 1131 	cp a,#'z+1   
      00859A 81               [ 4] 1132 9$: ret 	
                                   1133 
                                   1134 ;-------------------------------------
                                   1135 ;  program initialization entry point 
                                   1136 ;-------------------------------------
                           000001  1137 	MAJOR=1
                           000000  1138 	MINOR=0
      00859B 0A 0A 54 69 6E 79 20  1139 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0085E1                       1140 cold_start:
                                   1141 ;set stack 
      0085E1 AE 17 FF         [ 2] 1142 	ldw x,#STACK_EMPTY
      0085E4 94               [ 1] 1143 	ldw sp,x   
                                   1144 ; clear all ram 
      0085E5 7F               [ 1] 1145 0$: clr (x)
      0085E6 5A               [ 2] 1146 	decw x 
      0085E7 26 FC            [ 1] 1147 	jrne 0$
                                   1148 ; activate pull up on all inputs 
      0085E9 A6 FF            [ 1] 1149 	ld a,#255 
      0085EB C7 50 03         [ 1] 1150 	ld PA_CR1,a 
      0085EE C7 50 08         [ 1] 1151 	ld PB_CR1,a 
      0085F1 C7 50 0D         [ 1] 1152 	ld PC_CR1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0085F4 C7 50 12         [ 1] 1153 	ld PD_CR1,a 
      0085F7 C7 50 17         [ 1] 1154 	ld PE_CR1,a 
      0085FA C7 50 1C         [ 1] 1155 	ld PF_CR1,a 
      0085FD C7 50 21         [ 1] 1156 	ld PG_CR1,a 
      008600 C7 50 2B         [ 1] 1157 	ld PI_CR1,a 
                                   1158 ; disable schmitt triggers on Arduino CN4 analog inputs
      008603 55 00 3F 54 07   [ 1] 1159 	mov ADC_TDRL,0x3f
                                   1160 ; disable peripherals clocks
                                   1161 ;	clr CLK_PCKENR1 
                                   1162 ;	clr CLK_PCKENR2
      008608 72 14 50 CA      [ 1] 1163 	bset CLK_PCKENR2,#2
                                   1164 ; select internal clock no divisor: 16 Mhz 	
      00860C A6 E1            [ 1] 1165 	ld a,#CLK_SWR_HSI 
      00860E 5F               [ 1] 1166 	clrw x  
      00860F CD 81 19         [ 4] 1167     call clock_init 
      008612 CD 81 2F         [ 4] 1168 	call timer4_init
                                   1169 ; UART1 at 115200 BAUD
      008615 CD 81 F8         [ 4] 1170 	call uart1_init
                                   1171 ; activate PE_4 (user button interrupt)
      008618 72 18 50 18      [ 1] 1172     bset PE_CR2,#USR_BTN_BIT 
                                   1173 ; display system information
      00861C AE 85 9B         [ 2] 1174 	ldw x,#software 
      00861F CD 82 45         [ 4] 1175 	call puts 
      008622 A6 01            [ 1] 1176 	ld a,#MAJOR 
      008624 C7 00 0A         [ 1] 1177 	ld acc8,a 
      008627 5F               [ 1] 1178 	clrw x 
      008628 CF 00 08         [ 2] 1179 	ldw acc24,x 
      00862B A6 0A            [ 1] 1180 	ld a,#10 
      00862D CD 89 CE         [ 4] 1181 	call prti24 
      008630 A6 2E            [ 1] 1182 	ld a,#'.
      008632 CD 82 33         [ 4] 1183 	call putc 
      008635 A6 00            [ 1] 1184 	ld a,#MINOR 
      008637 C7 00 0A         [ 1] 1185 	ld acc8,a 
      00863A 5F               [ 1] 1186 	clrw x 
      00863B CF 00 08         [ 2] 1187 	ldw acc24,x 
      00863E A6 0A            [ 1] 1188 	ld a,#10 
      008640 CD 89 CE         [ 4] 1189 	call prti24 
      008643 A6 0D            [ 1] 1190 	ld a,#CR 
      008645 CD 82 33         [ 4] 1191 	call putc 
      008648 CD 9B 97         [ 4] 1192 	call seek_fdrive 
                                   1193 ; configure LD2 pin 
      00864B 72 1A 50 0D      [ 1] 1194     bset PC_CR1,#LED2_BIT
      00864F 72 1A 50 0E      [ 1] 1195     bset PC_CR2,#LED2_BIT
      008653 72 1A 50 0C      [ 1] 1196     bset PC_DDR,#LED2_BIT
      008657 9A               [ 1] 1197 	rim 
      008658 72 5C 00 10      [ 1] 1198 	inc seedy+1 
      00865C 72 5C 00 0E      [ 1] 1199 	inc seedx+1 
      008660 CD 86 6F         [ 4] 1200 	call clear_basic
      008663 CD 93 FF         [ 4] 1201 	call ubound 
      008666 CD 90 1C         [ 4] 1202 	call dpop 
      008669 CF 00 1E         [ 2] 1203 	ldw array_size,x 
      00866C CC 87 F1         [ 2] 1204     jp warm_start 
                                   1205 
                                   1206 ;---------------------------
                                   1207 ; reset BASIC text variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1208 ; and clear variables 
                                   1209 ;---------------------------
      00866F                       1210 clear_basic:
      00866F 72 5F 00 04      [ 1] 1211 	clr count 
      008673 AE 00 56         [ 2] 1212 	ldw x,#free_ram 
      008676 CF 00 19         [ 2] 1213 	ldw txtbgn,x 
      008679 CF 00 1B         [ 2] 1214 	ldw txtend,x 
      00867C CD 85 7C         [ 4] 1215 	call clear_vars 
      00867F 81               [ 4] 1216 	ret 
                                   1217 
                                   1218 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1219 ;;   Tiny BASIC error messages     ;;
                                   1220 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008680                       1221 err_msg:
      008680 00 00 86 98 86 A6 86  1222 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             B5 86 CF 86 DF
      00868C 86 F6 87 0D 87 28 87  1223 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             3A 87 4C
      008696 87 59                 1224 	.word err_no_access 
                                   1225 
      008698 0A 4D 65 6D 6F 72 79  1226 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      0086A6 0A 73 79 6E 74 61 78  1227 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      0086B5 0A 6D 61 74 68 20 6F  1228 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0086CF 0A 64 69 76 69 73 69  1229 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      0086DF 0A 69 6E 76 61 6C 69  1230 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      0086F6 0A 72 75 6E 20 74 69  1231 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      00870D 0A 63 6F 6D 6D 61 6E  1232 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      008728 0A 64 75 70 6C 69 63  1233 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      00873A 0A 46 69 6C 65 20 6E  1234 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      00874C 0A 62 61 64 20 76 61  1235 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      008759 0A 46 69 6C 65 20 69  1236 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal  6F-Bits]



             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
                                   1237 
      00876F 72 79 2C 20 63 61 6E  1238 rt_msg: .asciz "last token id: "
             27 74 20 62 65 20 72
             75 6E
                                   1239 
      00071D                       1240 syntax_error:
      00877F 20 66            [ 1] 1241 	ld a,#ERR_SYNTAX 
                                   1242 
      00071F                       1243 tb_error:
      008781 72 6F 6D         [ 2] 1244 	ldw x, #err_msg 
      008784 20 74 68 65      [ 1] 1245 	clr acc16 
      008788 72               [ 1] 1246 	sll a
      008789 65 2E 0A 00      [ 1] 1247 	rlc acc16  
      00878D 6C 61 73         [ 1] 1248 	ld acc8, a 
      008790 74 20 74 6F      [ 2] 1249 	addw x,acc16 
      008794 6B               [ 2] 1250 	ldw x,(x)
      008795 65 6E 20         [ 4] 1251 	call puts
      008798 69 64 3A 20 00   [ 2] 1252 	btjf flags,#FCOMP, 1$
      00879D AE 16 C8         [ 2] 1253 	ldw x,#tib
      00879D A6 02 C5         [ 4] 1254 	call puts 
      00879F A6 0D            [ 1] 1255 	ld a,#CR 
      00879F AE 86 80         [ 4] 1256 	call putc
      0087A2 72 5F 00         [ 2] 1257 	ldw x,in.w
      0087A5 09 48 72         [ 4] 1258 	call spaces
      0087A8 59 00            [ 1] 1259 	ld a,#'^
      0087AA 09 C7 00         [ 4] 1260 	call putc 
      0087AD 0A 72            [ 2] 1261 	jra 6$
      0087AF BB 00 09         [ 2] 1262 1$:	ldw x,basicptr
      0087B2 FE CD 82         [ 4] 1263 	call prt_basic_line
      0087B5 45 72 0B         [ 2] 1264 	ldw x,#rt_msg 
      0087B8 00 20 18         [ 4] 1265 	call puts 
      0087BB AE               [ 1] 1266 	clrw x 
      0087BC 16 C8 CD         [ 1] 1267 	ld a,in.saved 
      0087BF 82               [ 1] 1268 	ld xl,a 
      0087C0 45 A6 0D CD      [ 4] 1269 	ld a,([basicptr],x)
      0087C4 82               [ 1] 1270 	clrw x 
      0087C5 33               [ 1] 1271 	ld xl,a 
      0087C6 CE 00 01         [ 4] 1272 	call print_int 
      0087C9 CD 82 6D         [ 2] 1273 6$: ldw x,#STACK_EMPTY 
      0087CC A6               [ 1] 1274     ldw sp,x
      000771                       1275 warm_start:
      0087CD 5E CD 82 33      [ 1] 1276 	clr flags 
      0087D1 20 1A CE 00      [ 1] 1277 	clr loop_depth 
      0087D5 05 CD 95         [ 2] 1278 	ldw x,#dstack_unf 
      0087D8 1C AE 87         [ 2] 1279 	ldw dstkptr,x 
      0087DB 8D CD 82 45      [ 1] 1280 	mov tab_width,#TAB_WIDTH 
      0087DF 5F C6 00 03      [ 1] 1281 	mov base,#10 
      0087E3 97 72 D6         [ 2] 1282 	ldw x,#tib 
      0087E6 00 05 5F         [ 2] 1283 	ldw basicptr,x 
                                   1284 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1285 ;   BASIC interpreter
                                   1286 ;----------------------------
      00078D                       1287 interp:
      0087E9 97 CD 8A 16      [ 1] 1288 	clr in.w
      0087ED AE 17 FF 94 23   [ 2] 1289 	btjf flags,#FRUN,4$ 
                                   1290 ; running program
                                   1291 ; goto next basic line 
      0087F1 CE 00 04         [ 2] 1292 	ldw x,basicptr
      0087F1 72 5F            [ 1] 1293 	ld a,(2,x) ; line length 
      0087F3 00 20 72         [ 1] 1294 	ld acc8,a 
      0087F6 5F 00 1D AE      [ 1] 1295 	clr acc16 
      0087FA 17 80 CF 00      [ 2] 1296 	addw x,acc16
      0087FE 17 35 04         [ 2] 1297 	cpw x,txtend 
      008801 00 21            [ 1] 1298 	jrpl warm_start
      008803 35 0A 00         [ 2] 1299 	ldw basicptr,x ; start of next line  
      008806 07 AE            [ 1] 1300 	ld a,(2,x)
      008808 16 C8 CF         [ 1] 1301 	ld count,a 
      00880B 00 05 00 01      [ 1] 1302 	mov in,#3 ; skip first 3 bytes of line 
      00880D 20 14            [ 2] 1303 	jra interp_loop 
      0007B9                       1304 4$: ; commande line mode 	
      00880D 72 5F 00 01      [ 1] 1305 	clr in
      008811 72 01            [ 1] 1306 	ld a,#CR 
      008813 00 20 23         [ 4] 1307 	call putc 
      008816 CE 00            [ 1] 1308 	ld a,#'> 
      008818 05 E6 02         [ 4] 1309 	call putc 
      00881B C7 00 0A         [ 4] 1310 	call readln
      00881E 72 5F 00         [ 4] 1311 	call compile
      0007CD                       1312 interp_loop:  
      008821 09 72 BB         [ 1] 1313 	ld a,in 
      008824 00 09 C3         [ 1] 1314 	cp a,count  
      008827 00 1B            [ 1] 1315 	jrpl interp
      008829 2A C6 CF         [ 4] 1316 	call next_token
      00882C 00 05            [ 1] 1317 	cp a,#TK_COLON 
      00882E E6 02            [ 1] 1318 	jreq interp_loop 
      008830 C7 00            [ 1] 1319 	cp a,#TK_NONE 
                                   1320 ;	jreq interp 
      0007DE                       1321 1$:
      008832 04 35            [ 1] 1322 	cp a,#TK_VAR
      008834 03 00            [ 1] 1323 	jrne 2$
      008836 02 20 14         [ 4] 1324 	call let02  
      008839 20 E6            [ 2] 1325 	jra interp_loop 
      0007E7                       1326 2$:	
      008839 72 5F            [ 1] 1327 	cp a,#TK_ARRAY 
      00883B 00 02            [ 1] 1328 	jrne 3$
      00883D A6 0D CD         [ 4] 1329 	call get_array_element
      008840 82 33 A6         [ 4] 1330 	call let02 
      008843 3E CD            [ 2] 1331 	jra interp_loop 
      0007F3                       1332 3$:
      008845 82 33            [ 1] 1333 	cp a,#TK_CMD
      008847 CD 8B            [ 1] 1334 	jrne 4$
      008849 04               [ 4] 1335 	call (x) 
      00884A CD 84            [ 2] 1336 	jra interp_loop 
      0007FA                       1337 4$:	
      00884C 81 07 1D         [ 2] 1338 	jp syntax_error 
                                   1339 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1340 ;--------------------------
                                   1341 ; extract next token from
                                   1342 ; token list 
                                   1343 ; basicptr -> base address 
                                   1344 ; in  -> offset in list array 
                                   1345 ; output:
                                   1346 ;   A 		token attribute
                                   1347 ;   X 		token value if there is one
                                   1348 ;----------------------------------------
      00884D                       1349 next_token:
      00884D C6 00 02         [ 1] 1350 	ld a,in 
      008850 C1 00 04         [ 1] 1351 	sub a,count 
      008853 2A B8            [ 1] 1352 	jreq 9$
      008855 CD 88 7D A1 01   [ 1] 1353 	mov in.saved,in
      00885A 27 F1 A1         [ 2] 1354 	ldw x,basicptr 
      00885D 00 D6 00 00      [ 4] 1355 	ld a,([in.w],x)
      00885E 72 5C 00 01      [ 1] 1356 	inc in 
      00885E A1 05            [ 1] 1357 	cp a,#TK_ARRAY  
      008860 26 05            [ 2] 1358 	jrule 9$
      008862 CD 94            [ 1] 1359 	cp a,#TK_CHAR
      008864 2B 20            [ 1] 1360 	jrne 1$
      008866 E6 D6 00 00      [ 4] 1361 	ld a,([in.w],x)
      008867 72 5C 00 01      [ 1] 1362 	inc in
      008867 A1               [ 1] 1363 	clrw x 
      008868 02               [ 1] 1364 	ld xl,a 
      008869 26 08            [ 1] 1365 	ld a,#TK_CHAR
      00886B CD               [ 4] 1366 	ret 
      00886C 92 70            [ 1] 1367 1$:	cp a,#TK_QSTR 
      00886E CD 94            [ 1] 1368 	jrult 2$
      008870 2B 20 DA 00      [ 2] 1369 	addw x,in.w 
      008873 20 0C            [ 2] 1370 	jra 9$
      008873 A1 06 26 03      [ 5] 1371 2$: ldw x,([in.w],x)
      008877 FD 20 D3 01      [ 1] 1372 	inc in 
      00887A 72 5C 00 01      [ 1] 1373 	inc in
      00887A CC               [ 4] 1374 9$: ret	
                                   1375 
                                   1376 
                                   1377 ;----------------------------------------
                                   1378 ;   DEBUG support functions
                                   1379 ;----------------------------------------
                           000001  1380 .if DEBUG 
                                   1381 ; turn LED on 
      000841                       1382 ledon:
      00887B 87 9D 50 0A      [ 1] 1383     bset PC_ODR,#LED2_BIT
      00887D 81               [ 4] 1384     ret 
                                   1385 
                                   1386 ; turn LED off 
      000846                       1387 ledoff:
      00887D C6 00 02 C0      [ 1] 1388     bres PC_ODR,#LED2_BIT 
      008881 00               [ 4] 1389     ret 
                                   1390 
                                   1391 ; invert LED status 
      00084B                       1392 ledtoggle:
      008882 04 27            [ 1] 1393     ld a,#LED2_MASK
      008884 3B 55 00         [ 1] 1394     xor a,PC_ODR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008887 02 00 03         [ 1] 1395     ld PC_ODR,a
      00888A CE               [ 4] 1396     ret 
                                   1397 
      000854                       1398 left_paren:
      00888B 00 05            [ 1] 1399 	ld a,#SPACE 
      00888D 72 D6 00         [ 4] 1400 	call putc
      008890 01 72            [ 1] 1401 	ld a,#'( 
      008892 5C 00 02         [ 4] 1402 	call putc 	
      008895 A1               [ 4] 1403 	ret 
                                   1404 
                                   1405 ;------------------------------
                                   1406 ; print 8 bit register 
                                   1407 ; input:
                                   1408 ;   X  point to register name 
                                   1409 ;   A  register value to print 
                                   1410 ; output:
                                   1411 ;   none
                                   1412 ;------------------------------- 
      00085F                       1413 prt_reg8:
      008896 02               [ 1] 1414 	push a 
      008897 23 27 A1         [ 4] 1415 	call puts 
      00889A 03 26            [ 1] 1416 	ld a,(1,sp) 
      00889C 0D 72 D6         [ 1] 1417 	ld acc8,a 
      00889F 00               [ 1] 1418 	clrw x 
      0088A0 01               [ 1] 1419 	ld xl,a 
      0088A1 72 5C 00 02      [ 1] 1420 	mov base,#16
      0088A5 5F 97 A6         [ 4] 1421 	call print_int 
      0088A8 03 81 A1         [ 4] 1422 	call left_paren 
      0088AB 0A               [ 1] 1423 	pop a 
      0088AC 25               [ 1] 1424 	clrw x 
      0088AD 06               [ 1] 1425 	ld xl,a 
      0088AE 72 BB 00 01      [ 1] 1426 	mov base,#10 
      0088B2 20 0C 72         [ 4] 1427 	call print_int  
      0088B5 DE 00            [ 1] 1428 	ld a,#') 
      0088B7 01 72 5C         [ 4] 1429 	call putc
      0088BA 00               [ 4] 1430 	ret
                                   1431 
                                   1432 ;--------------------------------
                                   1433 ; print 16 bits register 
                                   1434 ; input:
                                   1435 ;   X   point register name 
                                   1436 ;   Y   register value to print 
                                   1437 ; output:
                                   1438 ;  none
                                   1439 ;--------------------------------
      000884                       1440 prt_reg16: 
      0088BB 02 72            [ 2] 1441 	pushw y 
      0088BD 5C 00 02         [ 4] 1442 	call puts 
      0088C0 81 01            [ 2] 1443 	ldw x,(1,sp) 
      0088C1 35 10 00 06      [ 1] 1444 	mov base,#16 
      0088C1 72 1A 50         [ 4] 1445 	call print_int  
      0088C4 0A 81 54         [ 4] 1446 	call left_paren 
      0088C6 85               [ 2] 1447 	popw x 
      0088C6 72 1B 50 0A      [ 1] 1448 	mov base,#10 
      0088CA 81 09 96         [ 4] 1449 	call print_int  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0088CB A6 29            [ 1] 1450 	ld a,#') 
      0088CB A6 20 C8         [ 4] 1451 	call putc
      0088CE 50               [ 4] 1452 	ret 
                                   1453 
                                   1454 ;------------------------------------
                                   1455 ; print registers contents saved on
                                   1456 ; stack by trap interrupt.
                                   1457 ;------------------------------------
      0008A3                       1458 print_registers:
      0088CF 0A C7 50         [ 2] 1459 	ldw x,#STATES
      0088D2 0A 81 C5         [ 4] 1460 	call puts
                                   1461 ; print EPC 
      0088D4 AE 09 33         [ 2] 1462 	ldw x, #REG_EPC
      0088D4 A6 20 CD         [ 4] 1463 	call puts 
      0088D7 82 33            [ 1] 1464 	ld a, (11,sp)
      0088D9 A6 28 CD         [ 1] 1465 	ld acc8,a 
      0088DC 82 33            [ 1] 1466 	ld a, (10,sp) 
      0088DE 81 00 08         [ 1] 1467 	ld acc16,a 
      0088DF 7B 09            [ 1] 1468 	ld a,(9,sp) 
      0088DF 88 CD 82         [ 1] 1469 	ld acc24,a
      0088E2 45               [ 1] 1470 	clrw x  
      0088E3 7B 01            [ 1] 1471 	ld a,#16
      0088E5 C7 00 0A         [ 4] 1472 	call prti24  
                                   1473 ; print X
      0088E8 5F 97 35         [ 2] 1474 	ldw x,#REG_X
      0088EB 10 00            [ 2] 1475 	ldw y,(5,sp)
      0088ED 07 CD 8A         [ 4] 1476 	call prt_reg16  
                                   1477 ; print Y 
      0088F0 16 CD 88         [ 2] 1478 	ldw x,#REG_Y
      0088F3 D4 84            [ 2] 1479 	ldw y, (7,sp)
      0088F5 5F 97 35         [ 4] 1480 	call prt_reg16  
                                   1481 ; print A 
      0088F8 0A 00 07         [ 2] 1482 	ldw x,#REG_A
      0088FB CD 8A            [ 1] 1483 	ld a, (4,sp) 
      0088FD 16 A6 29         [ 4] 1484 	call prt_reg8
                                   1485 ; print CC 
      008900 CD 82 33         [ 2] 1486 	ldw x,#REG_CC 
      008903 81 03            [ 1] 1487 	ld a, (3,sp) 
      008904 CD 08 5F         [ 4] 1488 	call prt_reg8 
                                   1489 ; print SP 
      008904 90 89 CD         [ 2] 1490 	ldw x,#REG_SP
      008907 82 45            [ 1] 1491 	ldw y,sp 
      008909 1E 01 35 10      [ 2] 1492 	addw y,#12
      00890D 00 07 CD         [ 4] 1493 	call prt_reg16  
      008910 8A 16            [ 1] 1494 	ld a,#'\n' 
      008912 CD 88 D4         [ 4] 1495 	call putc
      008915 85               [ 4] 1496 	ret
                                   1497 
      008916 35 0A 00 07 CD 8A 16  1498 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             A6 29 CD 82 33 81 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      008923 45 50 43 3A 00        1499 REG_EPC: .asciz "EPC:"
      008923 AE 89 76 CD           1500 REG_Y:   .asciz "\nY:" 
      008927 82 45 AE 89           1501 REG_X:   .asciz "\nX:"
      00892B B3 CD 82 45           1502 REG_A:   .asciz "\nA:" 
      00892F 7B 0B C7 00 0A        1503 REG_CC:  .asciz "\nCC:"
      008934 7B 0A C7 00 09        1504 REG_SP:  .asciz "\nSP:"
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
      00094E                       1521 prti24:
      00094E                       1522 	_vars VSIZE 
      008939 7B 09            [ 2]    1     sub sp,#VSIZE 
      00893B C7 00            [ 1] 1523 	clr (ADD_SPACE,sp)
      00893D 08 5F            [ 1] 1524 	bcp a,#0x80 
      00893F A6 10            [ 1] 1525 	jreq 0$ 
      008941 CD 89            [ 1] 1526 	cpl (ADD_SPACE,sp)
      008943 CE AE            [ 1] 1527 0$:	and a,#31 
      008945 89 BC            [ 1] 1528 	ld (BASE,sp),a
      008947 16               [ 1] 1529 	ld a,xl
      008948 05 CD            [ 1] 1530 	ld (WIDTH,sp),a 
      00894A 89 04            [ 1] 1531 	ld a, (BASE,sp)  
      00894C AE 89 B8         [ 4] 1532     call itoa  ; conversion entier en  .asciz
      00894F 16 07            [ 1] 1533 1$: ld a,(WIDTH,sp)
      008951 CD 89            [ 1] 1534 	jreq 4$
      008953 04 AE 89         [ 1] 1535 	ld acc8,a 
      008956 C0               [ 2] 1536 	pushw x 
      008957 7B 04 CD         [ 4] 1537 	call strlen 
      00895A 88               [ 1] 1538 	ld a,xl 
      00895B DF               [ 2] 1539 	popw x 
      00895C AE 89 C4         [ 3] 1540 	exg a,acc8 
      00895F 7B 03 CD         [ 1] 1541 	sub a,acc8 
      008962 88 DF            [ 1] 1542 	jrmi 4$
      008964 AE 89            [ 1] 1543 	ld (WIDTH,sp),a 
      008966 C9 90            [ 1] 1544 	ld  a,#SPACE
      008968 96 72            [ 1] 1545 3$: tnz (WIDTH,sp)
      00896A A9 00            [ 1] 1546 	jreq 4$
      00896C 0C               [ 2] 1547 	decw x 
      00896D CD               [ 1] 1548 	ld (x),a 
      00896E 89 04            [ 1] 1549 	dec (WIDTH,sp) 
      008970 A6 0A            [ 2] 1550 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      000987                       1551 4$: 
      008972 CD 82 33         [ 4] 1552 	call puts 
      008975 81 0A            [ 1] 1553 	tnz (ADD_SPACE,sp)
      008977 52 65            [ 1] 1554 	jreq 5$
      008979 67 69            [ 1] 1555     ld a,#SPACE 
      00897B 73 74 65         [ 4] 1556 	call putc 
      000993                       1557 5$: _drop VSIZE 
      00897E 72 73            [ 2]    1     addw sp,#VSIZE 
      008980 20               [ 4] 1558     ret	
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
      000996                       1572 print_int: 
      000996                       1573 	_vars VSIZE 
      008981 73 74            [ 2]    1     sub sp,#VSIZE 
      008983 61 74            [ 1] 1574 	clr (SIGN,sp)
      008985 65 20 61 74      [ 2] 1575 	ldw y,#pad+PAD_SIZE-1 
      008989 20 61            [ 1] 1576 	clr (y)
      00898B 62 6F 72         [ 1] 1577 	ld a,base  
      00898E 74 20            [ 1] 1578 	cp a,#10 
      008990 70 6F            [ 1] 1579 	jrne 1$ 
      008992 69               [ 2] 1580 	tnzw x 
      008993 6E 74            [ 1] 1581 	jrpl 1$ 
      008995 2E 0A            [ 1] 1582 	cpl (SIGN,sp)
      008997 2D               [ 2] 1583 	negw x 	 
      0009AD                       1584 1$:	
      008998 2D 2D 2D         [ 1] 1585 	ld a,base 
      00899B 2D               [ 2] 1586 	div x,a 
      00899C 2D 2D            [ 1] 1587 	add a,#'0 
      00899E 2D 2D            [ 1] 1588 	cp a,#'9+1 
      0089A0 2D 2D            [ 1] 1589 	jrmi 2$ 
      0089A2 2D 2D            [ 1] 1590 	add a,#7 
      0089A4 2D 2D            [ 2] 1591 2$: decw y 
      0089A6 2D 2D            [ 1] 1592 	ld (y),a 
      0089A8 2D               [ 2] 1593 	tnzw x 
      0089A9 2D 2D            [ 1] 1594 	jrne 1$ 
      0089AB 2D 2D            [ 1] 1595 	ld a,#16 
      0089AD 2D 2D 2D         [ 1] 1596 	cp a,base 
      0089B0 2D 0A            [ 1] 1597 	jrne 3$
      0089B2 00 45            [ 1] 1598 	ld a,#'$
      0089B4 50 43            [ 2] 1599 	decw y  
      0089B6 3A 00            [ 1] 1600 	ld (y),a
      0089B8 0A 59            [ 2] 1601 	jra 9$ 
      0089BA 3A 00            [ 1] 1602 3$: tnz (SIGN,sp)
      0089BC 0A 58            [ 1] 1603 	jreq 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0089BE 3A 00            [ 1] 1604 	ld a,#'-
      0089C0 0A 41            [ 2] 1605 	decw y  
      0089C2 3A 00            [ 1] 1606 	ld (y),a
      0009D9                       1607 9$:	
      0089C4 0A               [ 1] 1608 	ldw x,y 
      0089C5 43 43 3A         [ 2] 1609 	subw x,#pad+PAD_SIZE-1 
      0089C8 00               [ 2] 1610 	negw x  
      0009DE                       1611 10$:
      0089C9 0A 53            [ 2] 1612 	decw y 
      0089CB 50 3A            [ 1] 1613 	ld a,#SPACE 
      0089CD 00 F7            [ 1] 1614 	ld (y),a
      0089CE 5C               [ 2] 1615 	incw x 
      0089CE 52               [ 1] 1616 	ld a,xl 
      0089CF 03 0F 03         [ 1] 1617 	cp a,tab_width
      0089D2 A5 80            [ 1] 1618 	jrmi 10$ 
      0009EB                       1619 12$:
      0089D4 27               [ 1] 1620     ldw x,y 
      0089D5 02 03 03         [ 4] 1621 	call puts  
      0009EF                       1622 	_drop VSIZE 
      0089D8 A4 1F            [ 2]    1     addw sp,#VSIZE 
      0089DA 6B               [ 4] 1623 	ret 
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
      0009F2                       1636 itoa:
      0089DB 02 9F            [ 2] 1637 	sub sp,#VSIZE
      0089DD 6B 01            [ 1] 1638 	ld (BASE,sp), a  ; base
      0089DF 7B 02            [ 1] 1639 	clr (SIGN,sp)    ; sign
      0089E1 CD 8A            [ 1] 1640 	cp a,#10
      0089E3 72 7B            [ 1] 1641 	jrne 1$
                                   1642 	; base 10 string display with negative sign if bit 23==1
      0089E5 01 27 1F C7 00   [ 2] 1643 	btjf acc24,#7,1$
      0089EA 0A 89            [ 1] 1644 	cpl (SIGN,sp)
      0089EC CD 83 07         [ 4] 1645 	call neg_acc24
      000A06                       1646 1$:
                                   1647 ; initialize string pointer 
      0089EF 9F 85 31         [ 2] 1648 	ldw x,#pad+PAD_SIZE-1
      0089F2 00               [ 1] 1649 	clr (x)
      000A0A                       1650 itoa_loop:
      0089F3 0A C0            [ 1] 1651     ld a,(BASE,sp)
      0089F5 00 0A 2B         [ 4] 1652     call divu24_8 ; acc24/A 
      0089F8 0E 6B            [ 1] 1653     add a,#'0  ; remainder of division
      0089FA 01 A6            [ 1] 1654     cp a,#'9+1
      0089FC 20 0D            [ 1] 1655     jrmi 2$
      0089FE 01 27            [ 1] 1656     add a,#7 
      008A00 06               [ 2] 1657 2$: decw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A01 5A               [ 1] 1658     ld (x),a
                                   1659 	; if acc24==0 conversion done
      008A02 F7 0A 01         [ 1] 1660 	ld a,acc24
      008A05 20 F6 08         [ 1] 1661 	or a,acc16
      008A07 CA 00 09         [ 1] 1662 	or a,acc8
      008A07 CD 82            [ 1] 1663     jrne itoa_loop
                                   1664 	;conversion done, next add '$' or '-' as required
      008A09 45 0D            [ 1] 1665 	ld a,(BASE,sp)
      008A0B 03 27            [ 1] 1666 	cp a,#16
      008A0D 05 A6            [ 1] 1667 	jreq 8$
      008A0F 20 CD            [ 1] 1668 	ld a,(SIGN,sp)
      008A11 82 33            [ 1] 1669     jreq 10$
      008A13 5B 03            [ 1] 1670     ld a,#'-
      008A15 81 02            [ 2] 1671 	jra 9$ 
      008A16 A6 24            [ 1] 1672 8$: ld a,#'$ 
      008A16 52               [ 2] 1673 9$: decw x
      008A17 01               [ 1] 1674     ld (x),a
      000A36                       1675 10$:
      008A18 0F 01            [ 2] 1676 	addw sp,#VSIZE
      008A1A 90               [ 4] 1677 	ret
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
      000A39                       1692 divu24_8:
      008A1B AE               [ 2] 1693 	pushw x ; save x
      008A1C 17               [ 1] 1694 	push a 
                                   1695 	; ld dividend UU:MM bytes in X
      008A1D 3F 90 7F         [ 1] 1696 	ld a, acc24
      008A20 C6               [ 1] 1697 	ld xh,a
      008A21 00 07 A1         [ 1] 1698 	ld a,acc24+1
      008A24 0A               [ 1] 1699 	ld xl,a
      008A25 26 06            [ 1] 1700 	ld a,(U8,SP) ; divisor
      008A27 5D               [ 2] 1701 	div x,a ; UU:MM/U8
      008A28 2A               [ 1] 1702 	push a  ;save remainder
      008A29 03               [ 1] 1703 	ld a,xh
      008A2A 03 01 50         [ 1] 1704 	ld acc24,a
      008A2D 9F               [ 1] 1705 	ld a,xl
      008A2D C6 00 07         [ 1] 1706 	ld acc24+1,a
      008A30 62               [ 1] 1707 	pop a
      008A31 AB               [ 1] 1708 	ld xh,a
      008A32 30 A1 3A         [ 1] 1709 	ld a,acc24+2
      008A35 2B               [ 1] 1710 	ld xl,a
      008A36 02 AB            [ 1] 1711 	ld a,(U8,sp) ; divisor
      008A38 07               [ 2] 1712 	div x,a  ; R:LL/U8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008A39 90 5A            [ 1] 1713 	ld (U8,sp),a ; save remainder
      008A3B 90               [ 1] 1714 	ld a,xl
      008A3C F7 5D 26         [ 1] 1715 	ld acc24+2,a
      008A3F ED               [ 1] 1716 	pop a
      008A40 A6               [ 2] 1717 	popw x
      008A41 10               [ 4] 1718 	ret
                                   1719 
                                   1720 ;------------------------------------
                                   1721 ;  two's complement acc24
                                   1722 ;  input:
                                   1723 ;		acc24 variable
                                   1724 ;  output:
                                   1725 ;		acc24 variable
                                   1726 ;-------------------------------------
      000A61                       1727 neg_acc24:
      008A42 C1 00 07 26      [ 1] 1728 	cpl acc24+2
      008A46 08 A6 24 90      [ 1] 1729 	cpl acc24+1
      008A4A 5A 90 F7 20      [ 1] 1730 	cpl acc24
      008A4E 0A 0D            [ 1] 1731 	ld a,#1
      008A50 01 27 06         [ 1] 1732 	add a,acc24+2
      008A53 A6 2D 90         [ 1] 1733 	ld acc24+2,a
      008A56 5A               [ 1] 1734 	clr a
      008A57 90 F7 08         [ 1] 1735 	adc a,acc24+1
      008A59 C7 00 08         [ 1] 1736 	ld acc24+1,a 
      008A59 93               [ 1] 1737 	clr a 
      008A5A 1D 17 3F         [ 1] 1738 	adc a,acc24 
      008A5D 50 00 07         [ 1] 1739 	ld acc24,a 
      008A5E 81               [ 4] 1740 	ret
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
      000A84                       1758 readln:
      008A5E 90               [ 1] 1759 	clrw x 
      008A5F 5A               [ 2] 1760 	pushw x 
      008A60 A6 20 90 F7      [ 2] 1761  	ldw y,#tib ; input buffer
      000A8A                       1762 readln_loop:
      008A64 5C 9F C1         [ 4] 1763 	call getc
      008A67 00 21            [ 1] 1764 	ld (RXCHAR,sp),a
      008A69 2B F3            [ 1] 1765 	cp a,#CR
      008A6B 26 03            [ 1] 1766 	jrne 1$
      008A6B 93 CD 82         [ 2] 1767 	jp readln_quit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008A6E 45 5B            [ 1] 1768 1$:	cp a,#NL
      008A70 01 81            [ 1] 1769 	jreq readln_quit
      008A72 A1 08            [ 1] 1770 	cp a,#BSP
      008A72 52 02            [ 1] 1771 	jreq del_back
      008A74 6B 02            [ 1] 1772 	cp a,#CTRL_D
      008A76 0F 01            [ 1] 1773 	jreq del_ln
      008A78 A1 0A            [ 1] 1774 	cp a,#CTRL_R 
      008A7A 26 0A            [ 1] 1775 	jreq reprint 
                                   1776 ;	cp a,#'[
                                   1777 ;	jreq ansi_seq
      000AA6                       1778 final_test:
      008A7C 72 0F            [ 1] 1779 	cp a,#SPACE
      008A7E 00 08            [ 1] 1780 	jrpl accept_char
      008A80 05 03            [ 2] 1781 	jra readln_loop
      000AAC                       1782 ansi_seq:
                                   1783 ;	call getc
                                   1784 ;	cp a,#'C 
                                   1785 ;	jreq rigth_arrow
                                   1786 ;	cp a,#'D 
                                   1787 ;	jreq left_arrow 
                                   1788 ;	jra final_test
      000AAC                       1789 right_arrow:
                                   1790 ;	ld a,#BSP 
                                   1791 ;	call putc 
                                   1792 ;	jra realn_loop 
      000AAC                       1793 left_arrow:
                                   1794 
                                   1795 ;	jra readln_loop
      000AAC                       1796 reprint: 
      008A82 01 CD            [ 1] 1797 	tnz (LL,sp)
      008A84 8A E1            [ 1] 1798 	jrne readln_loop
      008A86 AE 16 C8         [ 2] 1799 	ldw x,#tib 
      008A86 AE 17 3F         [ 4] 1800 	call strlen 
      008A89 7F AE 16 C8      [ 2] 1801 	ldw y,#tib 
      008A8A 9F               [ 1] 1802 	ld a,xl
      008A8A 7B 02            [ 1] 1803 	jreq readln_loop
      008A8C CD 8A            [ 1] 1804 	ld (LL,sp),a 
      008A8E B9 AB 30         [ 2] 1805 	ldw x,#tib 
      008A91 A1 3A 2B         [ 4] 1806 	call puts
      008A94 02 AB            [ 1] 1807 	clr (LL_HB,sp)
      008A96 07 5A F7         [ 2] 1808 	addw y,(LL_HB,sp)
      008A99 C6 00            [ 2] 1809 	jra readln_loop 
      000ACC                       1810 del_ln:
      008A9B 08 CA            [ 1] 1811 	ld a,(LL,sp)
      008A9D 00 09 CA         [ 4] 1812 	call delete
      008AA0 00 0A 26 E6      [ 2] 1813 	ldw y,#tib
      008AA4 7B 02            [ 1] 1814 	clr (y)
      008AA6 A1 10            [ 1] 1815 	clr (LL,sp)
      008AA8 27 08            [ 2] 1816 	jra readln_loop
      000ADB                       1817 del_back:
      008AAA 7B 01            [ 1] 1818     tnz (LL,sp)
      008AAC 27 08            [ 1] 1819     jreq readln_loop
      008AAE A6 2D            [ 1] 1820     dec (LL,sp)
      008AB0 20 02            [ 2] 1821     decw y
      008AB2 A6 24            [ 1] 1822     clr  (y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008AB4 5A F7 CF         [ 4] 1823     call bksp 
      008AB6 20 A0            [ 2] 1824     jra readln_loop	
      000AEA                       1825 accept_char:
      008AB6 5B 02            [ 1] 1826 	ld a,#TIB_SIZE-1
      008AB8 81 02            [ 1] 1827 	cp a, (LL,sp)
      008AB9 27 9A            [ 1] 1828 	jreq readln_loop
      008AB9 89 88            [ 1] 1829 	ld a,(RXCHAR,sp)
      008ABB C6 00            [ 1] 1830 	ld (y),a
      008ABD 08 95            [ 1] 1831 	inc (LL,sp)
      008ABF C6 00            [ 2] 1832 	incw y
      008AC1 09 97            [ 1] 1833 	clr (y)
      008AC3 7B 01 62         [ 4] 1834 	call putc 
      008AC6 88 9E            [ 2] 1835 	jra readln_loop
      000AFF                       1836 readln_quit:
      008AC8 C7 00            [ 1] 1837 	clr (y)
      008ACA 08 9F            [ 1] 1838 	ld a,(LL,sp)
      008ACC C7 00 09         [ 1] 1839 	ld count,a 
      000B06                       1840 	_drop VSIZE 
      008ACF 84 95            [ 2]    1     addw sp,#VSIZE 
      008AD1 C6 00            [ 1] 1841 	ld a,#CR
      008AD3 0A 97 7B         [ 4] 1842 	call putc
      008AD6 01               [ 4] 1843 	ret
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
      000B0E                       1856 cmd_itf:
      008AD7 62 6B            [ 2] 1857 	sub sp,#VSIZE 
      008AD9 01 9F C7 00      [ 1] 1858 	clr farptr 
      008ADD 0A 84 85 81      [ 1] 1859 	clr farptr+1 
      008AE1 72 5F 00 12      [ 1] 1860 	clr farptr+2  
      000B1C                       1861 repl:
      008AE1 72 53            [ 1] 1862 	ld a,#CR 
      008AE3 00 0A 72         [ 4] 1863 	call putc 
      008AE6 53 00            [ 1] 1864 	ld a,#'? 
      008AE8 09 72 53         [ 4] 1865 	call putc
      008AEB 00 08 A6 01      [ 1] 1866 	clr in.w 
      008AEF CB 00 0A C7      [ 1] 1867 	clr in 
      008AF3 00 0A 4F         [ 4] 1868 	call readln
      008AF6 C9 00 09 C7      [ 2] 1869 	ldw y,#tib  
      008AFA 00 09            [ 1] 1870 	ld a,(y)
      008AFC 4F C9            [ 1] 1871 	jreq repl  
      008AFE 00 08 C7 00      [ 1] 1872 	inc in 
      008B02 08 81 BE         [ 4] 1873 	call to_upper 
      008B04 A1 51            [ 1] 1874 	cp a,#'Q 
      008B04 5F 89            [ 1] 1875 	jrne test_p
      000B44                       1876 repl_exit:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B06 90 AE 16 C8      [ 1] 1877 	clr tib 
      008B0A 72 5F 00 03      [ 1] 1878 	clr count 
      008B0A CD 82 3C 6B      [ 1] 1879 	clr in 
      000B50                       1880 	_drop #VSIZE 	
      008B0E 01 A1            [ 2]    1     addw sp,##VSIZE 
      008B10 0D               [ 4] 1881 	ret  
      000B53                       1882 invalid:
      008B11 26 03 CC         [ 2] 1883 	ldw x,#invalid_cmd 
      008B14 8B 7F A1         [ 4] 1884 	call puts 
      008B17 0A 27            [ 2] 1885 	jra repl 
      000B5B                       1886 test_p:	
      008B19 65 A1            [ 1] 1887     cp a,#'P 
      008B1B 08 27            [ 1] 1888 	jreq mem_peek
      008B1D 3D A1            [ 1] 1889     cp a,#'S 
      008B1F 04 27            [ 1] 1890 	jrne invalid 
      000B63                       1891 print_string:	
      008B21 2A A1 12         [ 4] 1892 	call get_token
      008B24 27 06            [ 1] 1893 	cp a,#TK_INTGR 
      008B26 26 E9            [ 1] 1894 	jrne invalid 
      008B26 A1 20 2A         [ 4] 1895 	call puts
      008B29 40 20 DE         [ 2] 1896 	jp repl 	
      008B2C                       1897 mem_peek:
      008B2C A6 20            [ 1] 1898 	ld a,#SPACE 
      008B2C CD 0F 76         [ 4] 1899 	call skip  	 
      008B2C 72 B9 00 00      [ 2] 1900 	addw y,in.w 
      008B2C 0D 02 26         [ 2] 1901 	ldw x,#pad 
      008B2F DA AE 16         [ 4] 1902 	call strcpy
      008B32 C8 CD 83         [ 4] 1903 	call atoi24 	
      008B35 07 90 AE         [ 1] 1904 	ld a, acc24 
      008B38 16 C8 9F         [ 1] 1905 	or a,acc16 
      008B3B 27 CD 6B         [ 1] 1906 	or a,acc8 
      008B3E 02 AE            [ 1] 1907 	jrne 1$ 
      008B40 16 C8            [ 2] 1908 	jra peek_byte  
      008B42 CD 82 45         [ 2] 1909 1$:	ldw x,acc24 
      008B45 0F 01 72         [ 2] 1910 	ldw farptr,x 
      008B48 F9 01 20         [ 1] 1911 	ld a,acc8 
      008B4B BE 00 12         [ 1] 1912 	ld farptr+2,a 
      008B4C                       1913 peek_byte:
      008B4C 7B 02 CD         [ 4] 1914 	call print_farptr 
      008B4F 82 5F            [ 1] 1915 	ld a,#8 
      008B51 90 AE            [ 1] 1916 	ld (PSIZE,sp),a 
      008B53 16               [ 1] 1917 	clrw x 
      008B54 C8 90 7F         [ 4] 1918 1$:	call fetchc  
      008B57 0F               [ 2] 1919 	pushw x 
      008B58 02 20 AF         [ 1] 1920 	ld acc8,a 
      008B5B 5F               [ 1] 1921 	clrw x 
      008B5B 0D 02 27         [ 2] 1922 	ldw acc24,x 
      008B5E AB 0A            [ 1] 1923 	ld a,#16+128
      008B60 02 90 5A         [ 4] 1924 	call prti24
      008B63 90               [ 2] 1925 	popw x 
      008B64 7F CD            [ 1] 1926 	dec (PSIZE,sp)
      008B66 82 4F            [ 1] 1927 	jrne 1$ 
      008B68 20 A0            [ 1] 1928 	ld a,#8 
      008B6A CB 00 12         [ 1] 1929 	add a,farptr+2 
      008B6A A6 4F 11         [ 1] 1930 	ld farptr+2,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008B6D 02               [ 1] 1931 	clr a 
      008B6E 27 9A 7B         [ 1] 1932 	adc a,farptr+1 
      008B71 01 90 F7         [ 1] 1933 	ld farptr+1,a 
      008B74 0C               [ 1] 1934 	clr a 
      008B75 02 90 5C         [ 1] 1935 	adc a,farptr 
      008B78 90 7F CD         [ 1] 1936 	ld farptr,a 
      008B7B 82 33 20         [ 2] 1937 	jp repl  
                                   1938 
      008B7E 8B 6F 74 20 61 20 63  1939 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1940 
                                   1941 ;----------------------------
                                   1942 ; display farptr address
                                   1943 ;----------------------------
      008B7F                       1944 print_farptr:
      008B7F 90 7F 7B         [ 1] 1945 	ld a ,farptr+2 
      008B82 02 C7 00         [ 1] 1946 	ld acc8,a 
      008B85 04 5B 02         [ 2] 1947 	ldw x,farptr 
      008B88 A6 0D CD         [ 2] 1948 	ldw acc24,x 
      008B8B 82               [ 1] 1949 	clrw x 
      008B8C 33 81            [ 1] 1950 	ld a,#16 
      008B8E CD 09 4E         [ 4] 1951 	call prti24
      008B8E 52 01            [ 1] 1952 	ld a,#SPACE 
      008B90 72 5F 00         [ 4] 1953 	call putc 
      008B93 11 72 5F         [ 4] 1954 	call putc 
      008B96 00               [ 4] 1955 	ret
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
      000BFB                       1966 fetchc: ; @C
      008B97 12 72 5F 00      [ 5] 1967 	ldf a,([farptr],x)
      008B9B 13               [ 2] 1968 	incw x
      008B9C 81               [ 4] 1969 	ret
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
      000C01                       1980 number::
      008B9C A6 0D CD         [ 4] 1981 	call get_token
      008B9F 82 33 A6         [ 4] 1982 	call atoi24
      008BA2 3F               [ 4] 1983 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   1984 .endif ; DEBUG 
                                   1985 
                                   1986 ;------------------------------------
                                   1987 ; parse quoted string 
                                   1988 ; input:
                                   1989 ;   Y 	pointer to tib 
                                   1990 ;   X   pointer to pad
                                   1991 ; output:
                                   1992 ;	pad   parsed string
                                   1993 ;   TOS  char* to pad  
                                   1994 ;------------------------------------
                           000001  1995 	PREV = 1
                           000002  1996 	CURR =2 
                           000002  1997 	VSIZE=2 
      000C08                       1998 parse_quote: ; { -- addr }
      000C08                       1999 	_vars VSIZE 
      008BA3 CD 82            [ 2]    1     sub sp,#VSIZE 
      008BA5 33               [ 1] 2000 	clr a
      008BA6 72 5F            [ 1] 2001 1$:	ld (PREV,sp),a 
      008BA8 00 01 72 5F      [ 1] 2002 2$:	inc in
      008BAC 00 02 CD         [ 4] 2003 	ld a,([in.w],y)
      008BAF 8B 04            [ 1] 2004 	jreq 6$
      008BB1 90 AE            [ 1] 2005 	ld (CURR,sp),a 
      008BB3 16 C8            [ 1] 2006 	ld a,#'\
      008BB5 90 F6            [ 1] 2007 	cp a, (PREV,sp)
      008BB7 27 E3            [ 1] 2008 	jrne 3$
      008BB9 72 5C            [ 1] 2009 	clr (PREV,sp)
      008BBB 00 02            [ 1] 2010 	ld a,(CURR,sp)
      008BBD CD 8F            [ 4] 2011 	callr convert_escape
      008BBF 3E               [ 1] 2012 	ld (x),a 
      008BC0 A1               [ 2] 2013 	incw x 
      008BC1 51 26            [ 2] 2014 	jra 2$
      000C28                       2015 3$:
      008BC3 17 02            [ 1] 2016 	ld a,(CURR,sp)
      008BC4 A1 5C            [ 1] 2017 	cp a,#'\'
      008BC4 72 5F            [ 1] 2018 	jreq 1$
      008BC6 16 C8            [ 1] 2019 	cp a,#'"
      008BC8 72 5F            [ 1] 2020 	jreq 5$ 
      008BCA 00               [ 1] 2021 	ld (x),a 
      008BCB 04               [ 2] 2022 	incw x 
      008BCC 72 5F            [ 2] 2023 	jra 2$
      008BCE 00 02 5B 01      [ 1] 2024 5$:	inc in 
      008BD2 81               [ 1] 2025 6$: clr (x)
      008BD3 AE 17 18         [ 2] 2026 	ldw x,#pad 
      000C3E                       2027 	_drop VSIZE
      008BD3 AE 8C            [ 2]    1     addw sp,#VSIZE 
      008BD5 51 CD            [ 1] 2028 	ld a,#TK_QSTR  
      008BD7 82               [ 4] 2029 	ret 
                                   2030 
                                   2031 ;---------------------------------------
                                   2032 ; called by parse_quote
                                   2033 ; subtitute escaped character 
                                   2034 ; by their ASCII value .
                                   2035 ; input:
                                   2036 ;   A  character following '\'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2037 ; output:
                                   2038 ;   A  substitued char or same if not valid.
                                   2039 ;---------------------------------------
      000C43                       2040 convert_escape:
      008BD8 45               [ 2] 2041 	pushw x 
      008BD9 20 C1 58         [ 2] 2042 	ldw x,#escaped 
      008BDB F1               [ 1] 2043 1$:	cp a,(x)
      008BDB A1 50            [ 1] 2044 	jreq 2$
      008BDD 27               [ 1] 2045 	tnz (x)
      008BDE 11 A1            [ 1] 2046 	jreq 3$
      008BE0 53               [ 2] 2047 	incw x 
      008BE1 26 F0            [ 2] 2048 	jra 1$
      008BE3 1D 0C 58         [ 2] 2049 2$: subw x,#escaped 
      008BE3 CD               [ 1] 2050 	ld a,xl 
      008BE4 8D 7D            [ 1] 2051 	add a,#7
      008BE6 A1               [ 2] 2052 3$:	popw x 
      008BE7 04               [ 4] 2053 	ret 
                                   2054 
      008BE8 26 E9 CD 82 45 CC 8B  2055 escaped: .asciz "abtnvfr"
             9C
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
      008BF0                       2071 parse_integer: ; { -- n }
      008BF0 A6 20            [ 1] 2072 	push #0 ; TCHAR 
      008BF2 CD 8F            [ 1] 2073 	cp a,#'$
      008BF4 F6 72            [ 1] 2074 	jreq 1$ 
      008BF6 B9 00            [ 1] 2075 	push #10 ; BASE=10 
      008BF8 01 AE            [ 2] 2076 	jra 2$ 
      008BFA 17 18            [ 1] 2077 1$: push #16  ; BASE=16
      008BFC CD               [ 1] 2078 2$:	ld (x),a 
      008BFD 83               [ 2] 2079 	incw x 
      008BFE 25 CD 8F 4A      [ 1] 2080 	inc in 
      008C02 C6 00 08         [ 4] 2081 	ld a,([in.w],y)
      008C05 CA 00 09         [ 4] 2082 	call to_upper 
      008C08 CA 00            [ 1] 2083 	ld (TCHAR,sp),a 
      008C0A 0A 26 02         [ 4] 2084 	call is_digit 
      008C0D 20 0C            [ 1] 2085 	jrc 2$
      008C0F CE 00            [ 1] 2086 	ld a,#16 
      008C11 08 CF            [ 1] 2087 	cp a,(BASE,sp)
      008C13 00 11            [ 1] 2088 	jrne 3$ 
      008C15 C6 00            [ 1] 2089 	ld a,(TCHAR,sp)
      008C17 0A C7            [ 1] 2090 	cp a,#'A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C19 00 13            [ 1] 2091 	jrmi 3$ 
      008C1B A1 47            [ 1] 2092 	cp a,#'G 
      008C1B CD 8C            [ 1] 2093 	jrmi 2$ 
      008C1D 60               [ 1] 2094 3$:	clr (x)
      008C1E A6 08 6B         [ 4] 2095 	call atoi24
      008C21 01 5F CD         [ 2] 2096 	ldw x,acc16 
      008C24 8C 7B            [ 1] 2097 	ld a,#TK_INTGR
      000C98                       2098 	_drop VSIZE  
      008C26 89 C7            [ 2]    1     addw sp,#VSIZE 
      008C28 00               [ 4] 2099 	ret 	
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
      000C9B                       2115 parse_binary: ; { -- n }
      008C29 0A 5F            [ 1] 2116 	push #0
      008C2B CF 00            [ 1] 2117 	push #0
      008C2D 08               [ 1] 2118 1$: ld (x),a 
      008C2E A6               [ 2] 2119 	incw x 
      008C2F 90 CD 89 CE      [ 1] 2120 	inc in 
      008C33 85 0A 01         [ 4] 2121 	ld a,([in.w],y)
      008C36 26 EB            [ 1] 2122 	cp a,#'0 
      008C38 A6 08            [ 1] 2123 	jreq 2$
      008C3A CB 00            [ 1] 2124 	cp a,#'1 
      008C3C 13 C7            [ 1] 2125 	jreq 2$ 
      008C3E 00 13            [ 2] 2126 	jra bin_exit 
      008C40 4F C9            [ 1] 2127 2$: sub a,#'0	
      008C42 00               [ 1] 2128 	rrc a 
      008C43 12 C7            [ 1] 2129 	rlc (BINARY+1,sp)
      008C45 00 12            [ 1] 2130 	rlc (BINARY,sp)
      008C47 4F C9            [ 2] 2131 	jra 1$  
      000CBB                       2132 bin_exit:
      008C49 00               [ 1] 2133 	clr (x)
      008C4A 11 C7            [ 2] 2134 	ldw x,(BINARY,sp)
      008C4C 00 11            [ 1] 2135 	ld a,#TK_INTGR 	
      000CC0                       2136 	_drop VSIZE 
      008C4E CC 8B            [ 2]    1     addw sp,#VSIZE 
      008C50 9C               [ 4] 2137 	ret
                                   2138 
                                   2139 ;---------------------------
                                   2140 ;  token begin with a letter,
                                   2141 ;  is keyword or variable. 	
                                   2142 ; input:
                                   2143 ;   X 		point to pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2144 ;   Y 		point to text
                                   2145 ;   A 	    first letter  
                                   2146 ; output:
                                   2147 ;   X		exec_addr|var_addr 
                                   2148 ;   A 		TK_CMD 
                                   2149 ;   pad 	keyword|var_name  
                                   2150 ;   TOS     exec_addr|var_addr 
                                   2151 ;--------------------------  
      000CC3                       2152 parse_keyword: ; { -- exec_addr|var_addr}
      008C51 6E 6F 74         [ 4] 2153 	call to_upper 
      008C54 20               [ 1] 2154 	ld (x),a 
      008C55 61               [ 2] 2155 	incw x 
      008C56 20 63 6F 6D      [ 1] 2156 	inc in 
      008C5A 6D 61 6E         [ 4] 2157 	ld a,([in.w],y)
      008C5D 64 0A 00         [ 4] 2158 	call is_alpha 
      008C60 25 EF            [ 1] 2159 	jrc parse_keyword 
      008C60 C6               [ 1] 2160 1$: clr (x)
      008C61 00 13 C7 00      [ 1] 2161 	tnz pad+1 
      008C65 0A CE            [ 1] 2162 	jrne 2$
                                   2163 ; one letter variable name 
      008C67 00 11 CF         [ 1] 2164 	ld a,pad 
      008C6A 00 08            [ 1] 2165 	sub a,#'A 
      008C6C 5F               [ 1] 2166 	sll a 
      008C6D A6               [ 1] 2167 	push a 
      008C6E 10 CD            [ 1] 2168 	push #0
      008C70 89 CE A6         [ 2] 2169 	ldw x,#vars 
      008C73 20 CD 82         [ 2] 2170 	addw x,(1,sp) ; X=var address 
      000CEA                       2171 	_drop 2 
      008C76 33 CD            [ 2]    1     addw sp,#2 
      008C78 82 33            [ 1] 2172 	ld a,#TK_VAR 
      008C7A 81 0C            [ 2] 2173 	jra 4$ 
      008C7B                       2174 2$: ; check for keyword, otherwise syntax error.
      000CF0                       2175 	_ldx_dict kword_dict
      008C7B 92 AF 00         [ 2]    1     ldw x,#kword_dict+2
      008C7E 11 5C 81         [ 4] 2176 	call search_dict
      008C81 4D               [ 1] 2177 	tnz a
      008C81 CD 8D            [ 1] 2178 	jrne 4$ 
      008C83 7D CD 8F         [ 2] 2179 	jp syntax_error
      008C86 4A               [ 4] 2180 4$:	ret  	
                                   2181 
                                   2182 
                                   2183 ;------------------------------------
                                   2184 ; Command line tokenizer
                                   2185 ; scan text for next token
                                   2186 ; move token in 'pad'
                                   2187 ; input: 
      000CFD                       2188 	none: 
                                   2189 ; use:
                                   2190 ;	Y   pointer to text
                                   2191 ;   X	pointer to pad 
                                   2192 ;   in.w   index in text buffer
                                   2193 ; output:
                                   2194 ;   A       token attribute 
                                   2195 ;   pad 	token as .asciz
                                   2196 ;   X 		token value   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



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
      000CFD                       2208 get_token: 
      008C87 81 AE 16 C8      [ 2] 2209 	ldw y,#tib    	
      008C88 C6 00 01         [ 1] 2210 	ld a,in 
      008C88 52 02 4F         [ 1] 2211 	cp a,count 
      008C8B 6B 01            [ 1] 2212 	jrmi 1$
      008C8D 72 5C            [ 1] 2213 	ld a,#TK_NONE 
      008C8F 00               [ 4] 2214 	ret 
      000D0C                       2215 1$:	
      000D0C                       2216 	_vars VSIZE
      008C90 02 91            [ 2]    1     sub sp,#VSIZE 
      008C92 D6 01 27         [ 2] 2217 	ldw x, #pad
      008C95 24 6B            [ 1] 2218 	ld a,#SPACE
      008C97 02 A6 5C         [ 4] 2219 	call skip
      008C9A 11 01 26 0A 0F   [ 1] 2220 	mov in.saved,in 
      008C9F 01 7B 02         [ 4] 2221 	ld a,([in.w],y)
      008CA2 AD 1F            [ 1] 2222 	jrne str_tst
      008CA4 F7 5C 20 E5      [ 1] 2223 	clr pad 
      008CA8 CC 0E B2         [ 2] 2224 	jp token_exit ; end of line 
                                   2225 
      000D27                       2226 str_tst: ; check for quoted string  	
      008CA8 7B 02 A1         [ 4] 2227 	call to_upper 
      008CAB 5C 27            [ 1] 2228 	ld (TCHAR,sp),a 
      000D2C                       2229 	_case '"' nbr_tst
      008CAD DD A1            [ 1]    1 	ld a,#'"' 
      008CAF 22 27            [ 1]    2 	cp a,(TCHAR,sp) 
      008CB1 04 F7            [ 1]    3 	jrne nbr_tst
      008CB3 5C 20 D7         [ 4] 2230 	call parse_quote
      008CB6 72 5C 00         [ 2] 2231 	jp token_exit
      000D38                       2232 nbr_tst: ; check for number 
      008CB9 02 7F            [ 1] 2233 	ld a,#'$'
      008CBB AE 17            [ 1] 2234 	cp a,(TCHAR,sp) 
      008CBD 18 5B            [ 1] 2235 	jreq 1$
      008CBF 02 A6            [ 1] 2236 	ld a,#'&
      008CC1 0A 81            [ 1] 2237 	cp a,(TCHAR,sp)
      008CC3 26 06            [ 1] 2238 	jrne 0$
      008CC3 89 AE 8C         [ 4] 2239 	call parse_binary ; expect binary integer 
      008CC6 D8 F1 27         [ 2] 2240 	jp token_exit 
      008CC9 06 7D            [ 1] 2241 0$:	ld a,(TCHAR,sp)
      008CCB 27 09 5C         [ 4] 2242 	call is_digit
      008CCE 20 F7            [ 1] 2243 	jrnc 3$
      008CD0 1D 8C D8         [ 4] 2244 1$:	call parse_integer 
      008CD3 9F AB 07         [ 2] 2245 	jp token_exit 
      000D57                       2246 3$: 
      000D57                       2247 	_case '(' bkslsh_tst 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008CD6 85 81            [ 1]    1 	ld a,#'(' 
      008CD8 61 62            [ 1]    2 	cp a,(TCHAR,sp) 
      008CDA 74 6E            [ 1]    3 	jrne bkslsh_tst
      008CDC 76 66            [ 1] 2248 	ld a,#TK_LPAREN
      008CDE 72 00 A2         [ 2] 2249 	jp token_char   	
      008CE0                       2250 bkslsh_tst:
      000D62                       2251 	_case '\',rparnt_tst
      008CE0 4B 00            [ 1]    1 	ld a,#'\' 
      008CE2 A1 24            [ 1]    2 	cp a,(TCHAR,sp) 
      008CE4 27 04            [ 1]    3 	jrne rparnt_tst
      008CE6 4B 0A            [ 1] 2252 	ld a,(TCHAR,sp)
      008CE8 20               [ 1] 2253 	ld (x),a 
      008CE9 02               [ 2] 2254 	incw x 
      008CEA 4B 10 F7 5C      [ 1] 2255 	inc in 
      008CEE 72 5C 00         [ 4] 2256 	ld a,([in.w],y)
      008CF1 02               [ 1] 2257 	ld (x),a 
      008CF2 91               [ 2] 2258 	incw x 
      008CF3 D6 01 CD 8F      [ 1] 2259 	inc in  
      008CF7 3E               [ 1] 2260 	clr (x) 
      008CF8 6B               [ 1] 2261 	ld xl,a 
      008CF9 02 CD            [ 1] 2262 	ld a,#TK_CHAR 
      008CFB 8F 35 25         [ 2] 2263 	jp token_exit 
      000D80                       2264 rparnt_tst:		
      000D80                       2265 	_case ')' colon_tst 
      008CFE ED A6            [ 1]    1 	ld a,#')' 
      008D00 10 11            [ 1]    2 	cp a,(TCHAR,sp) 
      008D02 01 26            [ 1]    3 	jrne colon_tst
      008D04 0A 7B            [ 1] 2266 	ld a,#TK_RPAREN 
      008D06 02 A1 41         [ 2] 2267 	jp token_char 
      000D8B                       2268 colon_tst:
      000D8B                       2269 	_case ':' comma_tst 
      008D09 2B 04            [ 1]    1 	ld a,#':' 
      008D0B A1 47            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0D 2B DD            [ 1]    3 	jrne comma_tst
      008D0F 7F CD            [ 1] 2270 	ld a,#TK_COLON 
      008D11 8F 4A CE         [ 2] 2271 	jp token_char 
      000D96                       2272 comma_tst:
      000D96                       2273 	_case COMMA sharp_tst 
      008D14 00 09            [ 1]    1 	ld a,#COMMA 
      008D16 A6 04            [ 1]    2 	cp a,(TCHAR,sp) 
      008D18 5B 02            [ 1]    3 	jrne sharp_tst
      008D1A 81 0D            [ 1] 2274 	ld a,#TK_COMMA
      008D1B CC 0E A2         [ 2] 2275 	jp token_char
      000DA1                       2276 sharp_tst:
      000DA1                       2277 	_case SHARP dash_tst 
      008D1B 4B 00            [ 1]    1 	ld a,#SHARP 
      008D1D 4B 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008D1F F7 5C            [ 1]    3 	jrne dash_tst
      008D21 72 5C            [ 1] 2278 	ld a,#TK_SHARP
      008D23 00 02 91         [ 2] 2279 	jp token_char  	 	 
      000DAC                       2280 dash_tst: 	
      000DAC                       2281 	_case '-' at_tst 
      008D26 D6 01            [ 1]    1 	ld a,#'-' 
      008D28 A1 30            [ 1]    2 	cp a,(TCHAR,sp) 
      008D2A 27 06            [ 1]    3 	jrne at_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008D2C A1 31            [ 1] 2282 	ld a,#TK_MINUS  
      008D2E 27 02 20         [ 2] 2283 	jp token_char 
      000DB7                       2284 at_tst:
      000DB7                       2285 	_case '@' qmark_tst 
      008D31 09 A0            [ 1]    1 	ld a,#'@' 
      008D33 30 46            [ 1]    2 	cp a,(TCHAR,sp) 
      008D35 09 02            [ 1]    3 	jrne qmark_tst
      008D37 09 01            [ 1] 2286 	ld a,#TK_ARRAY 
      008D39 20 E4 A2         [ 2] 2287 	jp token_char
      008D3B                       2288 qmark_tst:
      000DC2                       2289 	_case '?' tick_tst 
      008D3B 7F 1E            [ 1]    1 	ld a,#'?' 
      008D3D 01 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D3F 04 5B            [ 1]    3 	jrne tick_tst
      008D41 02 81            [ 1] 2290 	ld a,(TCHAR,sp)
      008D43 F7               [ 1] 2291 	ld (x),a 
      008D43 CD               [ 2] 2292 	incw x 
      008D44 8F               [ 1] 2293 	clr (x)
      008D45 3E F7 5C 72      [ 1] 2294 	inc in 
      008D49 5C 00            [ 1] 2295 	ld a,#TK_CMD 
      008D4B 02 91 D6         [ 2] 2296 	ldw x,#print 
      008D4E 01 CD 85         [ 2] 2297 	jp token_exit
      000DD9                       2298 tick_tst: ; ignore comment 
      000DD9                       2299 	_case TICK plus_tst 
      008D51 8A 25            [ 1]    1 	ld a,#TICK 
      008D53 EF 7F            [ 1]    2 	cp a,(TCHAR,sp) 
      008D55 72 5D            [ 1]    3 	jrne plus_tst
      008D57 17 19 26 15      [ 1] 2300 	inc in 
      008D5B C6 17            [ 1] 2301 	ld a,#TK_CMD 
      008D5D 18 A0 41         [ 2] 2302 	ldw x,#rem 
      008D60 48 88 4B         [ 2] 2303 	jp token_exit 
      000DEB                       2304 plus_tst:
      000DEB                       2305 	_case '+' star_tst 
      008D63 00 AE            [ 1]    1 	ld a,#'+' 
      008D65 00 22            [ 1]    2 	cp a,(TCHAR,sp) 
      008D67 72 FB            [ 1]    3 	jrne star_tst
      008D69 01 5B            [ 1] 2306 	ld a,#TK_PLUS  
      008D6B 02 A6 05         [ 2] 2307 	jp token_char 
      000DF6                       2308 star_tst:
      000DF6                       2309 	_case '*' slash_tst 
      008D6E 20 0C            [ 1]    1 	ld a,#'*' 
      008D70 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D70 AE A3            [ 1]    3 	jrne slash_tst
      008D72 8A CD            [ 1] 2310 	ld a,#TK_MULT 
      008D74 91 DA 4D         [ 2] 2311 	jp token_char 
      000E01                       2312 slash_tst: 
      000E01                       2313 	_case '/' prcnt_tst 
      008D77 26 03            [ 1]    1 	ld a,#'/' 
      008D79 CC 87            [ 1]    2 	cp a,(TCHAR,sp) 
      008D7B 9D 81            [ 1]    3 	jrne prcnt_tst
      008D7D A6 21            [ 1] 2314 	ld a,#TK_DIV 
      008D7D CC 0E A2         [ 2] 2315 	jp token_char 
      000E0C                       2316 prcnt_tst:
      000E0C                       2317 	_case '%' eql_tst 
      008D7D 90 AE            [ 1]    1 	ld a,#'%' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008D7F 16 C8            [ 1]    2 	cp a,(TCHAR,sp) 
      008D81 C6 00            [ 1]    3 	jrne eql_tst
      008D83 02 C1            [ 1] 2318 	ld a,#TK_MOD
      008D85 00 04 2B         [ 2] 2319 	jp token_char  
                                   2320 ; 1 or 2 character tokens 	
      000E17                       2321 eql_tst:
      000E17                       2322 	_case '=' gt_tst 		
      008D88 03 A6            [ 1]    1 	ld a,#'=' 
      008D8A 00 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008D8C 26 05            [ 1]    3 	jrne gt_tst
      008D8C 52 02            [ 1] 2323 	ld a,#TK_EQUAL
      008D8E AE 17 18         [ 2] 2324 	jp token_char 
      000E22                       2325 gt_tst:
      000E22                       2326 	_case '>' lt_tst 
      008D91 A6 20            [ 1]    1 	ld a,#'>' 
      008D93 CD 8F            [ 1]    2 	cp a,(TCHAR,sp) 
      008D95 F6 55            [ 1]    3 	jrne lt_tst
      008D97 00 02            [ 1] 2327 	ld a,#TK_GT 
      008D99 00 03            [ 1] 2328 	ld (ATTRIB,sp),a 
      008D9B 91 D6 01 26      [ 1] 2329 	inc in 
      008D9F 07 72 5F         [ 4] 2330 	ld a,([in.w],y)
      008DA2 17 18            [ 1] 2331 	cp a,#'=
      008DA4 CC 8F            [ 1] 2332 	jrne 1$
      008DA6 32 01            [ 1] 2333 	ld a,(TCHAR,sp)
      008DA7 F7               [ 1] 2334 	ld (x),a
      008DA7 CD               [ 2] 2335 	incw x 
      008DA8 8F 3E            [ 1] 2336 	ld a,#'=
      008DAA 6B 01            [ 1] 2337 	ld (TCHAR,sp),a 
      008DAC A6 22            [ 1] 2338 	ld a,#TK_GE 
      008DAE 11 01            [ 2] 2339 	jra token_char  
      008DB0 26 06            [ 1] 2340 1$: cp a,#'<
      008DB2 CD 8C            [ 1] 2341 	jrne 2$
      008DB4 88 CC            [ 1] 2342 	ld a,(TCHAR,sp)
      008DB6 8F               [ 1] 2343 	ld (x),a
      008DB7 32               [ 2] 2344 	incw x 
      008DB8 A6 3C            [ 1] 2345 	ld a,#'<	
      008DB8 A6 24            [ 1] 2346 	ld (TCHAR,sp),a 
      008DBA 11 01            [ 1] 2347 	ld a,#TK_NE 
      008DBC 27 13            [ 2] 2348 	jra token_char 
      008DBE A6 26 11 01      [ 1] 2349 2$: dec in
      008DC2 26 06            [ 1] 2350 	ld a,(ATTRIB,sp)
      008DC4 CD 8D            [ 2] 2351 	jra token_char 
      000E5B                       2352 lt_tst:
      000E5B                       2353 	_case '<' other
      008DC6 1B CC            [ 1]    1 	ld a,#'<' 
      008DC8 8F 32            [ 1]    2 	cp a,(TCHAR,sp) 
      008DCA 7B 01            [ 1]    3 	jrne other
      008DCC CD 8F            [ 1] 2354 	ld a,#TK_LT 
      008DCE 35 24            [ 1] 2355 	ld (ATTRIB,sp),a 
      008DD0 06 CD 8C E0      [ 1] 2356 	inc in 
      008DD4 CC 8F 32         [ 4] 2357 	ld a,([in.w],y)
      008DD7 A1 3D            [ 1] 2358 	cp a,#'=
      008DD7 A6 28            [ 1] 2359 	jrne 1$
      008DD9 11 01            [ 1] 2360 	ld a,(TCHAR,sp)
      008DDB 26               [ 1] 2361 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008DDC 05 A6            [ 1] 2362 	ld a,#'=
      008DDE 0B CC            [ 1] 2363 	ld (TCHAR,sp),a 
      008DE0 8F 22            [ 1] 2364 	ld a,#TK_LE 
      008DE2 20 27            [ 2] 2365 	jra token_char 
      008DE2 A6 5C            [ 1] 2366 1$: cp a,#'>
      008DE4 11 01            [ 1] 2367 	jrne 2$
      008DE6 26 18            [ 1] 2368 	ld a,(TCHAR,sp)
      008DE8 7B               [ 1] 2369 	ld (x),a 
      008DE9 01               [ 2] 2370 	incw x 
      008DEA F7 5C            [ 1] 2371 	ld a,#'>
      008DEC 72 5C            [ 1] 2372 	ld (TCHAR,sp),a 
      008DEE 00 02            [ 1] 2373 	ld a,#TK_NE 
      008DF0 91 D6            [ 2] 2374 	jra token_char 
      008DF2 01 F7 5C 72      [ 1] 2375 2$: dec in 
      008DF6 5C 00            [ 1] 2376 	ld a,(ATTRIB,sp)
      008DF8 02 7F            [ 2] 2377 	jra token_char 	
      000E93                       2378 other: ; not a special character 	 
      008DFA 97 A6            [ 1] 2379 	ld a,(TCHAR,sp)
      008DFC 03 CC 8F         [ 4] 2380 	call is_alpha 
      008DFF 32 03            [ 1] 2381 	jrc 30$ 
      008E00 CC 07 1D         [ 2] 2382 	jp syntax_error 
      000E9D                       2383 30$: 
      008E00 A6 29 11         [ 4] 2384 	call parse_keyword
      008E03 01 26            [ 2] 2385 	jra token_exit 
      000EA2                       2386 token_char:
      008E05 05 A6            [ 1] 2387 	ld (ATTRIB,sp),a 
      008E07 0C CC            [ 1] 2388 	ld a,(TCHAR,sp)
      008E09 8F               [ 1] 2389 	ld (x),a 
      008E0A 22               [ 2] 2390 	incw x 
      008E0B 7F               [ 1] 2391 	clr(x)
      008E0B A6 3A 11 01      [ 1] 2392 	inc in 
      008E0F 26 05            [ 1] 2393 	ld a,(ATTRIB,sp)
      008E11 A6 01 CC         [ 2] 2394 	ldw x,#pad 
      000EB2                       2395 token_exit:
      000EB2                       2396 	_drop VSIZE 
      008E14 8F 22            [ 2]    1     addw sp,#VSIZE 
      008E16 81               [ 4] 2397 	ret
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
      000EB5                       2408 is_digit:
      008E16 A6 2C            [ 1] 2409 	cp a,#'0
      008E18 11 01            [ 1] 2410 	jrc 1$
      008E1A 26 05            [ 1] 2411     cp a,#'9+1
      008E1C A6               [ 1] 2412 	ccf 
      008E1D 0D               [ 1] 2413 1$:	ccf 
      008E1E CC               [ 4] 2414     ret
                                   2415 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2416 ;------------------------------------
                                   2417 ; convert alpha to uppercase
                                   2418 ; input:
                                   2419 ;    a  character to convert
                                   2420 ; output:
                                   2421 ;    a  uppercase character
                                   2422 ;------------------------------------
      000EBE                       2423 to_upper::
      008E1F 8F 22            [ 1] 2424 	cp a,#'a
      008E21 2A 01            [ 1] 2425 	jrpl 1$
      008E21 A6               [ 4] 2426 0$:	ret
      008E22 23 11            [ 1] 2427 1$: cp a,#'z	
      008E24 01 26            [ 1] 2428 	jrugt 0$
      008E26 05 A6            [ 1] 2429 	sub a,#32
      008E28 0E               [ 4] 2430 	ret
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
      000ECA                       2444 atoi24:
      008E29 CC               [ 2] 2445 	pushw x ;save x
      008E2A 8F 22            [ 2] 2446 	sub sp,#VSIZE
                                   2447 	; acc24=0 
      008E2C 72 5F 00 07      [ 1] 2448 	clr acc24    
      008E2C A6 2D 11 01      [ 1] 2449 	clr acc16
      008E30 26 05 A6 11      [ 1] 2450 	clr acc8 
      008E34 CC 8F 22         [ 1] 2451 	ld a, pad 
      008E37 27 5A            [ 1] 2452 	jreq atoi_exit
      008E37 A6 40            [ 1] 2453 	clr (SIGN,sp)
      008E39 11 01            [ 1] 2454 	ld a,#10
      008E3B 26 05            [ 1] 2455 	ld (BASE,sp),a ; default base decimal
      008E3D A6 02 CC         [ 2] 2456 	ldw x,#pad ; pointer to string to convert
      008E40 8F               [ 1] 2457 	ld a,(x)
      008E41 22 47            [ 1] 2458 	jreq 9$  ; completed if 0
      008E42 A1 2D            [ 1] 2459 	cp a,#'-
      008E42 A6 3F            [ 1] 2460 	jrne 1$
      008E44 11 01            [ 1] 2461 	cpl (SIGN,sp)
      008E46 26 11            [ 2] 2462 	jra 2$
      008E48 7B 01            [ 1] 2463 1$: cp a,#'$
      008E4A F7 5C            [ 1] 2464 	jrne 3$
      008E4C 7F 72            [ 1] 2465 	ld a,#16
      008E4E 5C 00            [ 1] 2466 	ld (BASE,sp),a
      008E50 02               [ 2] 2467 2$:	incw x
      008E51 A6               [ 1] 2468 	ld a,(x)
      000EFC                       2469 3$:	
      008E52 06 AE            [ 1] 2470 	cp a,#'a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008E54 96 8D            [ 1] 2471 	jrmi 4$
      008E56 CC 8F            [ 1] 2472 	sub a,#32
      008E58 32 30            [ 1] 2473 4$:	cp a,#'0
      008E59 2B 2B            [ 1] 2474 	jrmi 9$
      008E59 A6 27            [ 1] 2475 	sub a,#'0
      008E5B 11 01            [ 1] 2476 	cp a,#10
      008E5D 26 0C            [ 1] 2477 	jrmi 5$
      008E5F 72 5C            [ 1] 2478 	sub a,#7
      008E61 00 02            [ 1] 2479 	cp a,(BASE,sp)
      008E63 A6 06            [ 1] 2480 	jrpl 9$
      008E65 AE 97            [ 1] 2481 5$:	ld (TEMP,sp),a
      008E67 92 CC            [ 1] 2482 	ld a,(BASE,sp)
      008E69 8F 32 3C         [ 4] 2483 	call mulu24_8
      008E6B 7B 03            [ 1] 2484 	ld a,(TEMP,sp)
      008E6B A6 2B 11         [ 1] 2485 	add a,acc24+2
      008E6E 01 26 05         [ 1] 2486 	ld acc24+2,a
      008E71 A6               [ 1] 2487 	clr a
      008E72 10 CC 8F         [ 1] 2488 	adc a,acc24+1
      008E75 22 00 08         [ 1] 2489 	ld acc24+1,a
      008E76 4F               [ 1] 2490 	clr a
      008E76 A6 2A 11         [ 1] 2491 	adc a,acc24
      008E79 01 26 05         [ 1] 2492 	ld acc24,a
      008E7C A6 20            [ 2] 2493 	jra 2$
      008E7E CC 8F            [ 1] 2494 9$:	tnz (SIGN,sp)
      008E80 22 03            [ 1] 2495     jreq atoi_exit
      008E81 CD 0A 61         [ 4] 2496     call neg_acc24
      000F38                       2497 atoi_exit: 
      008E81 A6 2F            [ 2] 2498 	addw sp,#VSIZE
      008E83 11               [ 2] 2499 	popw x ; restore x
      008E84 01               [ 4] 2500 	ret
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
      000F3C                       2516 mulu24_8:
      008E85 26               [ 2] 2517 	pushw x    ; save X
                                   2518 	; local variables
      008E86 05               [ 1] 2519 	push a     ; U8
      008E87 A6               [ 1] 2520 	clrw x     ; initialize overflow to 0
      008E88 21               [ 2] 2521 	pushw x    ; multiplication overflow
                                   2522 ; multiply low byte.
      008E89 CC 8F 22         [ 1] 2523 	ld a,acc24+2
      008E8C 97               [ 1] 2524 	ld xl,a
      008E8C A6 25            [ 1] 2525 	ld a,(U8,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008E8E 11               [ 4] 2526 	mul x,a
      008E8F 01               [ 1] 2527 	ld a,xl
      008E90 26 05 A6         [ 1] 2528 	ld acc24+2,a
      008E93 22               [ 1] 2529 	ld a, xh
      008E94 CC 8F            [ 1] 2530 	ld (OVFL,sp),a
                                   2531 ; multipy middle byte
      008E96 22 00 08         [ 1] 2532 	ld a,acc24+1
      008E97 97               [ 1] 2533 	ld xl,a
      008E97 A6 3D            [ 1] 2534 	ld a, (U8,sp)
      008E99 11               [ 4] 2535 	mul x,a
                                   2536 ; add overflow to this partial product
      008E9A 01 26 05         [ 2] 2537 	addw x,(OVFH,sp)
      008E9D A6               [ 1] 2538 	ld a,xl
      008E9E 32 CC 8F         [ 1] 2539 	ld acc24+1,a
      008EA1 22               [ 1] 2540 	clr a
      008EA2 A9 00            [ 1] 2541 	adc a,#0
      008EA2 A6 3E            [ 1] 2542 	ld (OVFH,sp),a
      008EA4 11               [ 1] 2543 	ld a,xh
      008EA5 01 26            [ 1] 2544 	ld (OVFL,sp),a
                                   2545 ; multiply most signficant byte	
      008EA7 33 A6 31         [ 1] 2546 	ld a, acc24
      008EAA 6B               [ 1] 2547 	ld xl, a
      008EAB 02 72            [ 1] 2548 	ld a, (U8,sp)
      008EAD 5C               [ 4] 2549 	mul x,a
      008EAE 00 02 91         [ 2] 2550 	addw x, (OVFH,sp)
      008EB1 D6               [ 1] 2551 	ld a, xl
      008EB2 01 A1 3D         [ 1] 2552 	ld acc24,a
      008EB5 26 0C            [ 2] 2553     addw sp,#VSIZE
      008EB7 7B               [ 2] 2554 	popw x
      008EB8 01               [ 4] 2555 	ret
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
      000F76                       2566 skip:
      008EB9 F7               [ 1] 2567 	push a
      008EBA 5C A6 3D         [ 4] 2568 1$:	ld a,([in.w],y)
      008EBD 6B 01            [ 1] 2569 	jreq 2$
      008EBF A6 33            [ 1] 2570 	cp a,(C,sp)
      008EC1 20 5F            [ 1] 2571 	jrne 2$
      008EC3 A1 3C 26 0C      [ 1] 2572 	inc in
      008EC7 7B 01            [ 2] 2573 	jra 1$
      000F86                       2574 2$: _drop 1 
      008EC9 F7 5C            [ 2]    1     addw sp,#1 
      008ECB A6               [ 4] 2575 	ret
                                   2576 	
                                   2577 ;------------------------------
                                   2578 ; restore 'in.w' variable to 
                                   2579 ; its value before last call
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2580 ; to get_token.
                                   2581 ;------------------------------
      000F89                       2582 unget_token:
      008ECC 3C 6B 01 A6 35   [ 1] 2583 	mov in,in.saved
      008ED1 20               [ 4] 2584 	ret 
                                   2585 
                                   2586 
                                   2587 ;******************************
                                   2588 ;  data stack manipulation
                                   2589 ;*****************************
                                   2590 ;----------------------	
                                   2591 ; push X on data stack 
                                   2592 ; input:
                                   2593 ;	X 
                                   2594 ; output:
                                   2595 ;	none 
                                   2596 ;----------------------	
      000F8F                       2597 dpush:
      000F8F                       2598     _dp_down
      008ED2 4F 72 5A 00      [ 1]    1     dec dstkptr+1 
      008ED6 02 7B 02 20      [ 1]    2     dec dstkptr+1
      008EDA 47 CF 00 16      [ 5] 2599     ldw [dstkptr],x  
      008EDB 81               [ 4] 2600 	ret 
                                   2601 
                                   2602 
                                   2603 ;----------------------	
                                   2604 ; pop data stack in X 
                                   2605 ; input:
                                   2606 ;	none
                                   2607 ; output:
                                   2608 ;	X   
                                   2609 ;----------------------	
      000F9C                       2610 dpop: 
      008EDB A6 3C 11 01      [ 5] 2611     ldw x, [dstkptr]
      000FA0                       2612 	_dp_up
      008EDF 26 32 A6 34      [ 1]    1     inc dstkptr+1
      008EE3 6B 02 72 5C      [ 1]    2     inc dstkptr+1
      008EE7 00               [ 4] 2613 	ret 
                                   2614 
                                   2615 ;-----------------------------
                                   2616 ; swap top 2 elements of dstack
                                   2617 ;  {n1 n2 -- n2 n1 }
                                   2618 ;-----------------------------
      000FA9                       2619 dswap:
      008EE8 02 91 D6 01      [ 5] 2620 	ldw x,[dstkptr]
      008EEC A1               [ 2] 2621 	pushw x 
      008EED 3D 26 0B         [ 2] 2622 	ldw x,#2 
      008EF0 7B 01 F7 A6      [ 5] 2623 	ldw x,([dstkptr],x) 
      008EF4 3D 6B 01 A6      [ 5] 2624 	ldw [dstkptr],x 
      008EF8 36 20 27         [ 2] 2625 	ldw x,#2
      008EFB A1 3E            [ 2] 2626 	popw y 
      008EFD 26 0C 7B 01      [ 5] 2627 	ldw ([dstkptr],x),y 
      008F01 F7               [ 4] 2628 	ret
                                   2629 
                                   2630 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2631 ; drop TOS 
                                   2632 ;-----------------------------
      000FC3                       2633 ddrop: ; { n -- }
      000FC3                       2634 	_dp_up 
      008F02 5C A6 3E 6B      [ 1]    1     inc dstkptr+1
      008F06 01 A6 35 20      [ 1]    2     inc dstkptr+1
      008F0A 17               [ 4] 2635 	ret
                                   2636 	
                                   2637 ;-----------------------------
                                   2638 ; duplicate TOS 
                                   2639 ;  dstack: { ix...n -- ix...n n }
                                   2640 ;-----------------------------
      000FCC                       2641 ddup:
      008F0B 72 5A 00 02      [ 5] 2642 	ldw x,[dstkptr]
      000FD0                       2643 	_dp_down
      008F0F 7B 02 20 0F      [ 1]    1     dec dstkptr+1 
      008F13 72 5A 00 17      [ 1]    2     dec dstkptr+1
      008F13 7B 01 CD 85      [ 5] 2644     ldw [dstkptr],x  
      008F17 8A               [ 4] 2645 	ret 
                                   2646 
                                   2647 
                                   2648 ;----------------------------------
                                   2649 ; pick value n from dstack 
                                   2650 ; put it on TOS
                                   2651 ; dstack: {ix,..,p -- ix,...,np }
                                   2652 ;-----------------------------------
      000FDD                       2653 dpick:
      008F18 25 03 CC 87      [ 5] 2654 	ldw x,[dstkptr]
      008F1C 9D               [ 2] 2655 	sllw x 
      008F1D 72 BB 00 16      [ 2] 2656 	addw x,dstkptr 
      008F1D CD               [ 2] 2657 	ldw x,(x)
      008F1E 8D 43 20 10      [ 5] 2658 	ldw [dstkptr],x 
      008F22 81               [ 4] 2659 	ret
                                   2660 
                                   2661 ;---------------------------
                                   2662 ;  fetch variable in X 
                                   2663 ;  dstack:{ addr -- value }
                                   2664 ;---------------------------
      000FEC                       2665 fetch:
      008F22 6B 02 7B 01      [ 5] 2666 	ldw x,[dstkptr]
      008F26 F7               [ 2] 2667 	ldw x,(x)
      008F27 5C 7F 72 5C      [ 5] 2668 	ldw [dstkptr],x
      008F2B 00               [ 4] 2669 	ret 
                                   2670 
                                   2671 ;----------------------------
                                   2672 ; store variable 
                                   2673 ; dstack: {addr value -- }
                                   2674 ;----------------------------
      000FF6                       2675 store:
      008F2C 02 7B 02         [ 4] 2676 	call dpop 
      008F2F AE 17            [ 1] 2677 	ldw y,x   ; y=value 
      008F31 18 0F 9C         [ 4] 2678 	call dpop 
      008F32 FF               [ 2] 2679 	ldw (x),y 
      008F32 5B               [ 4] 2680 	ret 
                                   2681 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2682 ;---------------------------------
                                   2683 ; drop n elements from data stack 
                                   2684 ; input: 
                                   2685 ;   X 		n 
                                   2686 ; output:
                                   2687 ;   none 
                                   2688 ;-------------------------------------
      001000                       2689 ddrop_n:
      008F33 02 81            [ 2] 2690 	pushw y 
      008F35 90 CE 00 16      [ 2] 2691 	ldw y,dstkptr 
      008F35 A1               [ 2] 2692 	sllw x 
      008F36 30               [ 2] 2693 	pushw x 
      008F37 25 03 A1         [ 2] 2694 	addw y,(1,sp)
      008F3A 3A 8C 8C 81      [ 2] 2695 	ldw dstkptr,y 
      008F3E 85               [ 2] 2696 	popw x 
      008F3E A1 61            [ 2] 2697 	popw y
      008F40 2A               [ 4] 2698 	ret 
                                   2699 
      008F41 01 81 A1 7A 22 FB A0  2700 dstk_prompt: .asciz "\ndstack: " 
             20 81 00
                                   2701 ;----------------------------
                                   2702 ; print dstack content 
                                   2703 ;---------------------------
                           000001  2704 	XSAVE=1
                           000002  2705 	VSIZE=2
      008F4A                       2706 dots:
      00101D                       2707 	_vars VSIZE 
      008F4A 89 52            [ 2]    1     sub sp,#VSIZE 
      008F4C 03 72 5F         [ 2] 2708 	ldw x,#dstk_prompt 
      008F4F 00 08 72         [ 4] 2709 	call puts
      008F52 5F 00 09         [ 2] 2710 	ldw x,#dstack_unf-CELL_SIZE
      008F55 72 5F 00 0A      [ 1] 2711 	mov base,#10 
      008F59 C6 17 18         [ 2] 2712 1$:	cpw x,dstkptr 
      008F5C 27 5A            [ 1] 2713 	jrult 4$ 
      008F5E 0F 01            [ 2] 2714 	ldw (XSAVE,sp),x
      008F60 A6               [ 2] 2715 	ldw  x,(x)
      008F61 0A 6B 02         [ 4] 2716 	call print_int 
      008F64 AE 17            [ 2] 2717 	ldw x,(XSAVE,sp)
      008F66 18 F6 27         [ 2] 2718 	subw x,#CELL_SIZE 
      008F69 47 A1            [ 2] 2719 	jra 1$ 
      008F6B 2D 26            [ 1] 2720 4$: ld a,#CR 
      008F6D 04 03 01         [ 4] 2721 	call putc 
      001043                       2722 	_drop VSIZE
      008F70 20 08            [ 2]    1     addw sp,#VSIZE 
      008F72 A1               [ 1] 2723 	clr a 
      008F73 24               [ 4] 2724 	ret
                                   2725 
      008F74 26 06 A6 10 6B 02 5C  2726 cstk_prompt: .asciz "\nctack: "
             F6 00
                                   2727 ;--------------------------------
                                   2728 ; print cstack content
                                   2729 ;--------------------------------
                           000001  2730 	XSAVE=1
                           000002  2731 	VSIZE=2 
      008F7C                       2732 dotr:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      001050                       2733 	_vars VSIZE 
      008F7C A1 61            [ 2]    1     sub sp,#VSIZE 
      008F7E 2B 02 A0         [ 2] 2734 	ldw x,#cstk_prompt
      008F81 20 A1 30         [ 4] 2735 	call puts 
      008F84 2B               [ 1] 2736 	ldw x,sp 
      008F85 2B A0 30         [ 2] 2737 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008F88 A1 0A            [ 2] 2738 	ldw (XSAVE,sp),x  
      008F8A 2B 06 A0         [ 2] 2739 	ldw x,#RAM_SIZE-2
      008F8D 07 11 02 2A      [ 1] 2740 	mov base,#16
      001065                       2741 dotr_loop:
      008F91 1F 6B            [ 2] 2742 	cpw x,(XSAVE,sp)
      008F93 03 7B            [ 1] 2743 	jrmi 9$
      008F95 02               [ 2] 2744 	pushw x  
      008F96 CD               [ 2] 2745 	ldw x,(x)
      008F97 8F BC 7B         [ 4] 2746 	call print_int 
      008F9A 03               [ 2] 2747 	popw x  
      008F9B CB 00 0A         [ 2] 2748 	subw x,#CELL_SIZE
      008F9E C7 00            [ 2] 2749 	jra dotr_loop 
      008FA0 0A 4F            [ 1] 2750 9$:	ld a,#CR 
      008FA2 C9 00 09         [ 4] 2751 	call putc 
      001079                       2752 	_drop VSIZE 
      008FA5 C7 00            [ 2]    1     addw sp,#VSIZE 
      008FA7 09               [ 1] 2753 	clr a 
      008FA8 4F               [ 4] 2754 	ret
                                   2755 
                                   2756 
                                   2757 ;--------------------------------
                                   2758 ;  add 2 integers
                                   2759 ;  input:
                                   2760 ;    N1     on cstack 
                                   2761 ;    N2     on cstack 
                                   2762 ;  output:
                                   2763 ;    X 		n2+n1 
                                   2764 ;--------------------------------
                                   2765 	;arugments on cstack 
      00107D                       2766 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00107D                       2767 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      00107D                       2768 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      00107D                       2769 add:
      008FA9 C9 00            [ 2] 2770 	ldw x ,(N2,sp)
      008FAB 08 C7 00         [ 2] 2771 	addw x,(N1,sp)
      008FAE 08 20            [ 2] 2772 	ldw (N1,sp),x 
      008FB0 C9               [ 4] 2773 	ret 
                                   2774 
                                   2775 ;--------------------------------
                                   2776 ;  substract 2 ntegers
                                   2777 ;  input:
                                   2778 ;    N1     on cstack 
                                   2779 ;    N2     on cstack 
                                   2780 ;  output:
                                   2781 ;    X 		n2+n1 
                                   2782 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      001085                       2783 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001085                       2784 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001085                       2785 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001085                       2786 substract:
      008FB1 0D 01            [ 2] 2787 	ldw x,(N2,sp)
      008FB3 27 03 CD         [ 2] 2788 	subw x,(N1,sp)
      008FB6 8A               [ 4] 2789 	ret 
                                   2790 
                                   2791 ;-------------------------------------
                                   2792 ; multiply 2 integers
                                   2793 ; product overflow is ignored unless
                                   2794 ; MATH_OVF assembler flag is set to 1
                                   2795 ; input:
                                   2796 ;  	N1      on cstack
                                   2797 ;   N2 		on cstack 
                                   2798 ; output:
                                   2799 ;	X        N1*N2 
                                   2800 ;-------------------------------------
                                   2801 	;arguments 
      00108B                       2802 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      00108B                       2803 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      00108B                       2804 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      00108B                       2805 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      00108B                       2806 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2807    ; local variables 
                           000001  2808 	SIGN=1
                           000002  2809 	PROD=2
                           000003  2810 	VSIZE=3
      00108B                       2811 multiply:
      00108B                       2812 	_vars VSIZE 
      008FB7 E1 03            [ 2]    1     sub sp,#VSIZE 
      008FB8 0F 01            [ 1] 2813 	clr (SIGN,sp)
      008FB8 5B 03            [ 2] 2814 	ldw x,(N1_HB,sp)
      008FBA 85               [ 1] 2815 	ld a,xh  
      008FBB 81 80            [ 1] 2816 	bcp a,#0x80 
      008FBC 27 05            [ 1] 2817 	jreq 2$
      008FBC 89 88            [ 1] 2818 	cpl (SIGN,sp)
      008FBE 5F               [ 2] 2819 	negw x 
      008FBF 89 C6            [ 2] 2820 	ldw (N1_HB,sp),x 
      008FC1 00 0A            [ 2] 2821 2$: ldw x,(N2_HB,sp)
      008FC3 97               [ 1] 2822 	ld a,xh  
      008FC4 7B 03            [ 1] 2823 	bcp a,#0x80 
      008FC6 42 9F            [ 1] 2824 	jreq 3$
      008FC8 C7 00            [ 1] 2825 	cpl (SIGN,sp)
      008FCA 0A               [ 2] 2826 	negw x 
      008FCB 9E 6B            [ 2] 2827 	ldw (N2_HB,sp),x 
                                   2828 ; N1_LB * N2_LB 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008FCD 02 C6            [ 1] 2829 3$:	ld a,(N1_LB,sp)
      008FCF 00               [ 1] 2830 	ld xl,a 
      008FD0 09 97            [ 1] 2831 	ld a,(N2_LB,sp) 
      008FD2 7B               [ 4] 2832 	mul x,a 
                           000000  2833 .if MATH_OVF 	
                                   2834 	ld a,xh 
                                   2835 	bcp a,#0x80 
                                   2836 	jreq 4$ 
                                   2837 	ld a,#ERR_MATH_OVF 
                                   2838 	jp tb_error
                                   2839 .endif 	 
      008FD3 03 42            [ 2] 2840 4$:	ldw (PROD,sp),x
                                   2841 ; N1_LB * N2_HB	 
      008FD5 72 FB            [ 1] 2842 	ld a,(N1_LB,sp) 
      008FD7 01               [ 1] 2843 	ld xl,a 
      008FD8 9F C7            [ 1] 2844 	ld a,(N2_HB,sp)
      008FDA 00               [ 4] 2845 	mul x,a
      008FDB 09               [ 1] 2846 	ld a,xl 
      008FDC 4F A9            [ 1] 2847 	add a,(PROD,sp)
                           000000  2848 .if MATH_OVF 	
                                   2849 	bcp a,#0x80 
                                   2850 	jreq 5$ 
                                   2851 	ld a,#ERR_MATH_OVF 
                                   2852 	jp tb_error
                                   2853 .endif 	 
      008FDE 00 6B            [ 1] 2854 5$:	ld (PROD,sp),a 
                                   2855 ; N1_HB * N2_LB 
      008FE0 01 9E            [ 1] 2856 	ld a,(N1_HB,sp)
      008FE2 6B               [ 1] 2857 	ld xl,a 
      008FE3 02 C6            [ 1] 2858 	ld a,(N2_LB,sp)
      008FE5 00               [ 4] 2859 	mul x,a 
      008FE6 08               [ 1] 2860 	ld a,xl 
      008FE7 97 7B            [ 1] 2861 	add a,(PROD,sp)
                           000000  2862 .if MATH_OVF 	
                                   2863 	bcp a,#0x80 
                                   2864 	jreq 6$ 
                                   2865 	ld a,#ERR_MATH_OVF 
                                   2866 	jp tb_error
                                   2867 .endif 	 
      008FE9 03 42            [ 1] 2868 6$:	ld (PROD,sp),a 
                                   2869 ; N1_HB * N2_HB 	
                                   2870 ; it is pointless to multiply N1_HB*N2_HB 
                                   2871 ; as this product is over 65535 or 0 
                                   2872 ;
                                   2873 ; sign adjust product
      008FEB 72 FB            [ 1] 2874 	tnz (SIGN,sp)
      008FED 01 9F            [ 1] 2875 	jreq 7$
      008FEF C7 00            [ 2] 2876 	ldw x, (PROD,sp)
      008FF1 08               [ 2] 2877 	negw x
      008FF2 5B 03            [ 2] 2878 	ldw (PROD,sp),x  
      0010CE                       2879 7$: 
      008FF4 85 81            [ 2] 2880 	ldw x,(PROD,sp) 
      008FF6                       2881 	_drop VSIZE 
      008FF6 88 91            [ 2]    1     addw sp,#VSIZE 
      008FF8 D6               [ 4] 2882 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2883 
                                   2884 ;----------------------------------
                                   2885 ;  euclidian divide n2/n1 
                                   2886 ; input:
                                   2887 ;    N2 	on cstack
                                   2888 ;    N1 	on cstack
                                   2889 ; output:
                                   2890 ;    X      n2/n1 
                                   2891 ;    Y      remainder 
                                   2892 ;----------------------------------
      0010D3                       2893 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      0010D3                       2894 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      0010D3                       2895 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2896 	; local variables
                           000001  2897 	SQUOT=1 ; sign quotient
                           000002  2898 	SDIVD=2 ; sign dividend  
                           000002  2899 	VSIZE=2
      0010D3                       2900 divide:
      0010D3                       2901 	_vars VSIZE 
      008FF9 01 27            [ 2]    1     sub sp,#VSIZE 
      008FFB 0A 11            [ 1] 2902 	clr (SQUOT,sp)
      008FFD 01 26            [ 1] 2903 	clr (SDIVD,sp)
                                   2904 ; check for 0 divisor
      008FFF 06 72            [ 2] 2905 	ldw x,(DIVISR,sp)
      009001 5C               [ 2] 2906 	tnzw x 
      009002 00 02            [ 1] 2907     jrne 0$
      009004 20 F1            [ 1] 2908 	ld a,#ERR_DIV0 
      009006 5B 01 81         [ 2] 2909 	jp tb_error 
                                   2910 ; check divisor sign 	
      009009 9E               [ 1] 2911 0$:	ld a,xh 
      009009 55 00            [ 1] 2912 	bcp a,#0x80 
      00900B 03 00            [ 1] 2913 	jreq 1$
      00900D 02 81            [ 1] 2914 	cpl (SQUOT,sp)
      00900F 50               [ 2] 2915 	negw x 
      00900F 72 5A            [ 2] 2916 1$:	ldw (DIVISR,sp),x
                                   2917 ; check dividend sign 	 
      009011 00 18            [ 2] 2918     ldw x,(DIVIDND,sp)
      009013 72               [ 1] 2919 	ld a,xh 
      009014 5A 00            [ 1] 2920 	bcp a,#0x80 
      009016 18 72            [ 1] 2921 	jreq 2$ 
      009018 CF 00            [ 1] 2922 	cpl (SQUOT,sp)
      00901A 17 81            [ 1] 2923 	cpl (SDIVD,sp)
      00901C 50               [ 2] 2924 	negw x 
      00901C 72 CE            [ 2] 2925 2$:	ldw y,(DIVISR,sp)
      00901E 00               [ 2] 2926 	divw x,y
      00901F 17 72 5C 00      [ 2] 2927 	ldw acc16,y 
                                   2928 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      009023 18 72            [ 1] 2929 	tnz (SDIVD,sp)
      009025 5C 00            [ 1] 2930 	jreq 7$
      009027 18 81            [ 2] 2931 	tnzw y 
      009029 27 07            [ 1] 2932 	jreq 7$
      009029 72               [ 2] 2933 	incw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00902A CE 00            [ 2] 2934 	ldw y,(DIVISR,sp)
      00902C 17 89 AE 00      [ 2] 2935 	subw y,acc16
      009030 02 72            [ 1] 2936 7$: tnz (SQUOT,sp)
      009032 DE 00            [ 1] 2937 	jreq 9$ 	 
      009034 17               [ 2] 2938 8$:	negw x 
      001114                       2939 9$: 
      001114                       2940 	_drop VSIZE 
      009035 72 CF            [ 2]    1     addw sp,#VSIZE 
      009037 00               [ 4] 2941 	ret 
                                   2942 
                                   2943 
                                   2944 ;----------------------------------
                                   2945 ;  remainder resulting from euclidian 
                                   2946 ;  division of n2/n1 
                                   2947 ; input:
                                   2948 ;   N1 		cstack 
                                   2949 ;   N2      cstack
                                   2950 ; output:
                                   2951 ;   X       N2%N1 
                                   2952 ;----------------------------------
                           000003  2953 	N1=3
                           000005  2954 	N2=5
                           000004  2955 	VSIZE=4
      001117                       2956 modulo:
      009038 17 AE            [ 2] 2957 	Ldw x,(N1,sp)
      00903A 00 02            [ 2] 2958 	ldw y,(N2,sp)
      00111B                       2959 	_vars VSIZE 
      00903C 90 85            [ 2]    1     sub sp,#VSIZE 
      00903E 72 DF            [ 2] 2960 	ldw (1,sp),x 
      009040 00 17            [ 2] 2961 	ldw (3,sp),y 
      009042 81 10 D3         [ 4] 2962 	call divide 
      009043 93               [ 1] 2963 	ldw x,y
      001125                       2964 	_drop VSIZE 
      009043 72 5C            [ 2]    1     addw sp,#VSIZE 
      009045 00               [ 4] 2965 	ret 
                                   2966 
                                   2967 
                                   2968 ;----------------------------------
                                   2969 ; search in kword_dict command name
                                   2970 ;  from its execution address 
                                   2971 ; input:
                                   2972 ;   X       	execution address 
                                   2973 ; output:
                                   2974 ;   X 			cstr*  | 0 
                                   2975 ;--------------------------------
                           000001  2976 	XADR=1 
                           000003  2977 	LINK=3 
                           000004  2978 	VSIZE=4
      001128                       2979 cmd_name:
      001128                       2980 	_vars VSIZE 
      009046 18 72            [ 2]    1     sub sp,#VSIZE 
      009048 5C 00 18 81      [ 1] 2981 	clr acc16 
      00904C 1F 01            [ 2] 2982 	ldw (XADR,sp),x  
      00904C 72 CE 00         [ 2] 2983 	ldw x,#kword_dict	
      00904F 17 72            [ 2] 2984 1$:	ldw (LINK,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      009051 5A 00            [ 1] 2985 	ld a,(2,x)
      009053 18 72            [ 1] 2986 	and a,#15 
      009055 5A 00 18         [ 1] 2987 	ld acc8,a 
      009058 72 CF 00         [ 2] 2988 	addw x,#3
      00905B 17 81 00 08      [ 2] 2989 	addw x,acc16
      00905D FE               [ 2] 2990 	ldw x,(x) ; execution address 
      00905D 72 CE            [ 2] 2991 	cpw x,(XADR,sp)
      00905F 00 17            [ 1] 2992 	jreq 2$
      009061 58 72            [ 2] 2993 	ldw x,(LINK,sp)
      009063 BB               [ 2] 2994 	ldw x,(x) 
      009064 00 17 FE         [ 2] 2995 	subw x,#2  
      009067 72 CF            [ 1] 2996 	jrne 1$
      009069 00 17            [ 2] 2997 	jra 9$
      00906B 81 03            [ 2] 2998 2$: ldw x,(LINK,sp)
      00906C 1C 00 02         [ 2] 2999 	addw x,#2 	
      001157                       3000 9$:	_drop VSIZE
      00906C 72 CE            [ 2]    1     addw sp,#VSIZE 
      00906E 00               [ 4] 3001 	ret
                                   3002 
                                   3003 
                                   3004 ;---------------------------------
                                   3005 ; input:
                                   3006 ;	X 		dictionary entry point 
                                   3007 ;  pad		.asciz name to search 
                                   3008 ; output:
                                   3009 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3010 ;  X		execution address | 0 
                                   3011 ;---------------------------------
                           000001  3012 	NLEN=1 ; cmd length 
                           000002  3013 	YSAVE=2
                           000003  3014 	VSIZE=3 
      00115A                       3015 search_dict:
      00115A                       3016 	_vars VSIZE 
      00906F 17 FE            [ 2]    1     sub sp,#VSIZE 
      009071 72 CF            [ 1] 3017 	ldw y,x 
      00115E                       3018 search_next:	
      009073 00 17            [ 1] 3019 	ld a,(y)
      009075 81 0F            [ 1] 3020 	and a,#0xf 
      009076 6B 01            [ 1] 3021 	ld (NLEN,sp),a  
      009076 CD 90 1C         [ 2] 3022 	ldw x,#pad 
      009079 90 93            [ 2] 3023 	ldw (YSAVE,sp),y
      00907B CD 90            [ 2] 3024 	incw y  
      00116B                       3025 cp_loop:
      00907D 1C               [ 1] 3026 	ld a,(x)
      00907E FF 81            [ 1] 3027 	jreq str_match 
      009080 0D 01            [ 1] 3028 	tnz (NLEN,sp)
      009080 90 89            [ 1] 3029 	jreq no_match  
      009082 90 CE            [ 1] 3030 	cp a,(y)
      009084 00 17            [ 1] 3031 	jrne no_match 
      009086 58 89            [ 2] 3032 	incw y 
      009088 72               [ 2] 3033 	incw x
      009089 F9 01            [ 1] 3034 	dec (NLEN,sp)
      00908B 90 CF            [ 2] 3035 	jra cp_loop 
      00117D                       3036 no_match:
      00908D 00 17            [ 2] 3037 	ldw y,(YSAVE,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      00908F 85 90 85 81      [ 2] 3038 	subw y,#2 ; move Y to link field
      009093 0A 64            [ 1] 3039 	push #TK_NONE 
      009095 73 74            [ 2] 3040 	ldw y,(y) ; next word link 
      009097 61               [ 1] 3041 	pop a ; TK_NONE 
      009098 63 6B            [ 1] 3042 	jreq search_exit  ; not found  
                                   3043 ;try next 
      00909A 3A 20            [ 2] 3044 	jra search_next
      00118C                       3045 str_match:
      00909C 00 02            [ 2] 3046 	ldw y,(YSAVE,sp)
      00909D 90 F6            [ 1] 3047 	ld a,(y)
      00909D 52 02            [ 1] 3048 	ld (NLEN,sp),a ; needed to test keyword type  
      00909F AE 90            [ 1] 3049 	and a,#0xf 
                                   3050 ; move y to procedure address field 	
      0090A1 93               [ 1] 3051 	inc a 
      0090A2 CD 82 45         [ 1] 3052 	ld acc8,a 
      0090A5 AE 17 7E 35      [ 1] 3053 	clr acc16 
      0090A9 0A 00 07 C3      [ 2] 3054 	addw y,acc16 
      0090AD 00 17            [ 2] 3055 	ldw y,(y) ; routine entry point 
                                   3056 ;determine keyword type bits 7:6 
      0090AF 25 0D            [ 1] 3057 	ld a,(NLEN,sp)
      0090B1 1F               [ 1] 3058 	swap a 
      0090B2 01 FE            [ 1] 3059 	and a,#0xc
      0090B4 CD               [ 1] 3060 	srl a
      0090B5 8A               [ 1] 3061 	srl a 
      0090B6 16 1E            [ 1] 3062 	add a,#6
      0011AB                       3063 search_exit: 
      0090B8 01               [ 1] 3064 	ldw x,y ; x=routine address 
      0011AC                       3065 	_drop VSIZE 	 
      0090B9 1D 00            [ 2]    1     addw sp,#VSIZE 
      0090BB 02               [ 4] 3066 	ret 
                                   3067 
                                   3068 ;---------------------
                                   3069 ; check if next token
                                   3070 ;  is of expected type 
                                   3071 ; input:
                                   3072 ;   A 		 expected token attribute
                                   3073 ;  ouput:
                                   3074 ;   none     if fail call tb_error 
                                   3075 ;--------------------
      0011AF                       3076 expect:
      0090BC 20               [ 1] 3077 	push a 
      0090BD EE A6 0D         [ 4] 3078 	call next_token 
      0090C0 CD 82            [ 1] 3079 	cp a,(1,sp)
      0090C2 33 5B            [ 1] 3080 	jreq 1$
      0090C4 02 4F 81         [ 2] 3081 	jp syntax_error
      0090C7 0A               [ 1] 3082 1$: pop a 
      0090C8 63               [ 4] 3083 	ret 
                                   3084 
                                   3085 
                                   3086 ;-------------------------------
                                   3087 ; parse embedded BASIC routines 
                                   3088 ; arguments list.
                                   3089 ; arg_list::=  rel[','rel]*
                                   3090 ; all arguments are of integer type
                                   3091 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3092 ;   none
                                   3093 ; output:
                                   3094 ;   A 			number of arguments pushed on dstack  
                                   3095 ;--------------------------------
                           000001  3096 	ARG_CNT=1 
      0011BC                       3097 arg_list:
      0090C9 74 61            [ 1] 3098 	push #0  
      0090CB 63 6B 3A         [ 4] 3099 1$: call relation
      0090CE 20 00            [ 1] 3100 	cp a,#TK_NONE 
      0090D0 27 19            [ 1] 3101 	jreq 5$
      0090D0 52 02            [ 1] 3102 	cp a,#TK_INTGR
      0090D2 AE 90            [ 1] 3103 	jrne 4$
      0090D4 C7 CD 82         [ 4] 3104 3$: call dpush 
      0090D7 45 96            [ 1] 3105     inc (ARG_CNT,sp)
      0090D9 1C 00 07         [ 4] 3106 	call next_token 
      0090DC 1F 01            [ 1] 3107 	cp a,#TK_NONE 
      0090DE AE 17            [ 1] 3108 	jreq 5$ 
      0090E0 FE 35            [ 1] 3109 	cp a,#TK_COMMA 
      0090E2 10 00            [ 1] 3110 	jrne 4$
      0090E4 07 E3            [ 2] 3111 	jra 1$ 
      0090E5 CD 0F 89         [ 4] 3112 4$:	call unget_token 
      0090E5 13               [ 1] 3113 5$:	pop a 
      0090E6 01               [ 4] 3114 	ret 
                                   3115 
                                   3116 
      0011E0                       3117 func_args:
      0090E7 2B 0B            [ 1] 3118 	ld a,#TK_LPAREN 
      0090E9 89 FE CD         [ 4] 3119 	call expect 
      0090EC 8A 16 85         [ 4] 3120 	call arg_list 
      0090EF 1D               [ 1] 3121 	push a 
      0090F0 00 02            [ 1] 3122 	ld a,#TK_RPAREN 
      0090F2 20 F1 A6         [ 4] 3123 	call expect 
      0090F5 0D               [ 1] 3124 	pop a 
      0090F6 CD               [ 4] 3125 	ret 
                                   3126 
                                   3127 
                                   3128 ;--------------------------------
                                   3129 ;   BASIC commnands 
                                   3130 ;--------------------------------
                                   3131 
                                   3132 ;--------------------------------
                                   3133 ;  arithmetic and relational 
                                   3134 ;  routines
                                   3135 ;  operators precedence
                                   3136 ;  highest to lowest
                                   3137 ;  operators on same row have 
                                   3138 ;  same precedence and are executed
                                   3139 ;  from left to right.
                                   3140 ;	'*','/','%'
                                   3141 ;   '-','+'
                                   3142 ;   '=','>','<','>=','<=','<>','><'
                                   3143 ;   '<>' and '><' are equivalent for not equal.
                                   3144 ;--------------------------------
                                   3145 
                                   3146 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3147 ; return array element
                                   3148 ; address from @(expr)
                                   3149 ; input:
                                   3150 ;   A 		TK_ARRAY
                                   3151 ; output:
                                   3152 ;   A 		TK_INTGR
                                   3153 ;	X 		element address 
                                   3154 ;----------------------
      0011F0                       3155 get_array_element:
      0090F7 82 33 5B         [ 4] 3156 	call func_args 
      0090FA 02 4F            [ 1] 3157 	cp a,#1
      0090FC 81 03            [ 1] 3158 	jreq 1$
      0090FD CC 07 1D         [ 2] 3159 	jp syntax_error
      0090FD 1E 05 72         [ 4] 3160 1$: call dpop  
                                   3161 	; check for bounds 
      009100 FB 03 1F         [ 2] 3162 	cpw x,array_size 
      009103 03 81            [ 2] 3163 	jrule 3$
                                   3164 ; bounds {1..array_size}	
      009105 A6 0A            [ 1] 3165 2$: ld a,#ERR_BAD_VALUE 
      009105 1E 05 72         [ 2] 3166 	jp tb_error 
      009108 F0               [ 2] 3167 3$: tnzw  x
      009109 03 81            [ 1] 3168 	jreq 2$ 
      00910B 58               [ 2] 3169 	sllw x 
      00910B 52               [ 2] 3170 	pushw x 
      00910C 03 0F 01         [ 2] 3171 	ldw x,#tib
      00910F 1E 06 9E         [ 2] 3172 	subw x,(1,sp)
      001212                       3173 	_drop 2   
      009112 A5 80            [ 2]    1     addw sp,#2 
      009114 27 05            [ 1] 3174 	ld a,#TK_INTGR
      009116 03               [ 4] 3175 	ret 
                                   3176 
                                   3177 ;***********************************
                                   3178 ;   expression parse,execute 
                                   3179 ;***********************************
                                   3180 ;-----------------------------------
                                   3181 ; factor ::= ['+'|'-'|e] var | @ |
                                   3182 ;			 integer | function |
                                   3183 ;			 '('relation')' 
                                   3184 ; output:
                                   3185 ;   A    token attribute 
                                   3186 ;   X 	 integer
                                   3187 ; ---------------------------------
                           000001  3188 	NEG=1
                           000001  3189 	VSIZE=1
      001217                       3190 factor:
      001217                       3191 	_vars VSIZE 
      009117 01 50            [ 2]    1     sub sp,#VSIZE 
      009119 1F 06 1E         [ 4] 3192 	call next_token
      00911C 08 9E            [ 1] 3193 	cp a,#CMD_END 
      00911E A5 80            [ 1] 3194 	jrmi 20$
      009120 27 05            [ 1] 3195 1$:	ld (NEG,sp),a 
      009122 03 01            [ 1] 3196 	and a,#TK_GRP_MASK
      009124 50 1F            [ 1] 3197 	cp a,#TK_GRP_ADD 
      009126 08 7B            [ 1] 3198 	jreq 2$
      009128 07 97            [ 1] 3199 	ld a,(NEG,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00912A 7B 09            [ 2] 3200 	jra 4$  
      00122C                       3201 2$:	
      00912C 42 1F 02         [ 4] 3202 	call next_token 
      00122F                       3203 4$:	
      00912F 7B 07            [ 1] 3204 	cp a,#TK_IFUNC 
      009131 97 7B            [ 1] 3205 	jrne 5$ 
      009133 08               [ 4] 3206 	call (x) 
      009134 42 9F            [ 2] 3207 	jra 18$ 
      001236                       3208 5$:
      009136 1B 02            [ 1] 3209 	cp a,#TK_INTGR
      009138 6B 02            [ 1] 3210 	jrne 6$
      00913A 7B 06            [ 2] 3211 	jra 18$
      00123C                       3212 6$:
      00913C 97 7B            [ 1] 3213 	cp a,#TK_ARRAY
      00913E 09 42            [ 1] 3214 	jrne 10$
      009140 9F 1B 02         [ 4] 3215 	call get_array_element
      009143 6B               [ 2] 3216 	ldw x,(x)
      009144 02 0D            [ 2] 3217 	jra 18$ 
      001246                       3218 10$:
      009146 01 27            [ 1] 3219 	cp a,#TK_VAR 
      009148 05 1E            [ 1] 3220 	jrne 11$
      00914A 02               [ 2] 3221 	ldw x,(x)
      00914B 50 1F            [ 2] 3222 	jra 18$
      00124D                       3223 11$: 
      00914D 02 09            [ 1] 3224 	cp a,#TK_CONST 
      00914E 27 16            [ 1] 3225 	jreq 18$
      001251                       3226 12$:			
      00914E 1E 02            [ 1] 3227 	cp a,#TK_LPAREN
      009150 5B 03            [ 1] 3228 	jrne 16$
      009152 81 13 04         [ 4] 3229 	call relation
      009153 89               [ 2] 3230 	pushw x 
      009153 52 02            [ 1] 3231 	ld a,#TK_RPAREN 
      009155 0F 01 0F         [ 4] 3232 	call expect
      009158 02               [ 2] 3233 	popw x 
      009159 1E 05            [ 2] 3234 	jra 18$	
      001261                       3235 16$:
      00915B 5D 26 05         [ 4] 3236 	call unget_token
      00915E A6               [ 1] 3237 	clr a 
      00915F 04 CC            [ 2] 3238 	jra 20$ 
      001267                       3239 18$: 
      009161 87 9F            [ 1] 3240 	ld a,#TK_MINUS 
      009163 9E A5            [ 1] 3241 	cp a,(NEG,sp)
      009165 80 27            [ 1] 3242 	jrne 19$
      009167 03               [ 2] 3243 	negw x
      00126E                       3244 19$:
      009168 03 01            [ 1] 3245 	ld a,#TK_INTGR
      001270                       3246 20$:
      001270                       3247 	_drop VSIZE
      00916A 50 1F            [ 2]    1     addw sp,#VSIZE 
      00916C 05               [ 4] 3248 	ret
                                   3249 
                                   3250 ;-----------------------------------
                                   3251 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3252 ; output:
                                   3253 ;   A    	token attribute 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3254 ;	X		integer
                                   3255 ;-----------------------------------
                           000001  3256 	N1=1
                           000003  3257 	N2=3
                           000005  3258 	MULOP=5
                           000005  3259 	VSIZE=5
      001273                       3260 term:
      001273                       3261 	_vars VSIZE
      00916D 1E 07            [ 2]    1     sub sp,#VSIZE 
      00916F 9E A5 80         [ 4] 3262 	call factor
      009172 27 05            [ 1] 3263 	cp a,#CMD_END
      009174 03 01            [ 1] 3264 	jrmi term_exit
      00127C                       3265 term01:	 ; check for  operator 
      009176 03 02            [ 2] 3266 	ldw (N2,sp),x  ; save first factor 
      009178 50 16 05         [ 4] 3267 	call next_token
      00917B 65 90            [ 1] 3268 	cp a,#2
      00917D CF 00            [ 1] 3269 	jrmi 9$
      00917F 09 0D            [ 1] 3270 0$:	ld (MULOP,sp),a
      009181 02 27            [ 1] 3271 	and a,#TK_GRP_MASK
      009183 0B 90            [ 1] 3272 	cp a,#TK_GRP_MULT
      009185 5D 27            [ 1] 3273 	jreq 1$
      009187 07 5C            [ 1] 3274 	ld a,(MULOP,sp) 
      009189 16 05 72         [ 4] 3275 	call unget_token 
      00918C B2 00            [ 2] 3276 	jra 9$
      001294                       3277 1$:	; got *|/|%
      00918E 09 0D 01         [ 4] 3278 	call factor
      009191 27 01            [ 1] 3279 	cp a,#TK_INTGR
      009193 50 03            [ 1] 3280 	jreq 2$ 
      009194 CC 07 1D         [ 2] 3281 	jp syntax_error
      009194 5B 02            [ 2] 3282 2$:	ldw (N1,sp),x  
      009196 81 05            [ 1] 3283 	ld a,(MULOP,sp) 
      009197 A1 20            [ 1] 3284 	cp a,#TK_MULT 
      009197 1E 03            [ 1] 3285 	jrne 3$
      009199 16 05 52         [ 4] 3286 	call multiply 
      00919C 04 1F            [ 2] 3287 	jra term01
      00919E 01 17            [ 1] 3288 3$: cp a,#TK_DIV 
      0091A0 03 CD            [ 1] 3289 	jrne 4$ 
      0091A2 91 53 93         [ 4] 3290 	call divide 
      0091A5 5B 04            [ 2] 3291 	jra term01 
      0091A7 81 11 17         [ 4] 3292 4$: call modulo
      0091A8 20 C3            [ 2] 3293 	jra term01 
      0091A8 52 04            [ 2] 3294 9$: ldw x,(N2,sp)  
      0091AA 72 5F            [ 1] 3295 	ld a,#TK_INTGR 	
      0012BD                       3296 term_exit:
      0012BD                       3297 	_drop VSIZE 
      0091AC 00 09            [ 2]    1     addw sp,#VSIZE 
      0091AE 1F               [ 4] 3298 	ret 
                                   3299 
                                   3300 ;-------------------------------
                                   3301 ;  expr ::= term [['+'|'-'] term]*
                                   3302 ;  result range {-32768..32767}
                                   3303 ;  output:
                                   3304 ;   A    token attribute 
                                   3305 ;   X	 integer   
                                   3306 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                           000001  3307 	N1=1 
                           000003  3308 	N2=3
                           000005  3309 	OP=5 
                           000005  3310 	VSIZE=5 
      0012C0                       3311 expression:
      0012C0                       3312 	_vars VSIZE 
      0091AF 01 AE            [ 2]    1     sub sp,#VSIZE 
      0091B1 A3 88 1F         [ 4] 3313 	call term
      0091B4 03 E6            [ 1] 3314 	cp a,#CMD_END 
      0091B6 02 A4            [ 1] 3315 	jrmi expr_exit 
      0091B8 0F C7            [ 2] 3316 0$:	ldw (N2,sp),x 
      0091BA 00 0A 1C         [ 4] 3317 	call next_token
      0091BD 00 03            [ 1] 3318 	cp a,#2
      0091BF 72 BB            [ 1] 3319 	jrmi 9$ 
      0091C1 00 09            [ 1] 3320 1$:	ld (OP,sp),a  
      0091C3 FE 13            [ 1] 3321 	and a,#TK_GRP_MASK
      0091C5 01 27            [ 1] 3322 	cp a,#TK_GRP_ADD 
      0091C7 0A 1E            [ 1] 3323 	jreq 2$ 
      0091C9 03 FE            [ 1] 3324 	ld a,(OP,sp)
      0091CB 1D 00 02         [ 4] 3325 	call unget_token
      0091CE 26 E3            [ 2] 3326 	jra 9$
      0012E1                       3327 2$: 
      0091D0 20 05 1E         [ 4] 3328 	call term
      0091D3 03 1C            [ 1] 3329 	cp a,#TK_INTGR 
      0091D5 00 02            [ 1] 3330 	jreq 3$
      0091D7 5B 04 81         [ 2] 3331 	jp syntax_error
      0091DA 1F 01            [ 2] 3332 3$:	ldw (N1,sp),x 
      0091DA 52 03            [ 1] 3333 	ld a,(OP,sp)
      0091DC 90 93            [ 1] 3334 	cp a,#TK_PLUS 
      0091DE 26 05            [ 1] 3335 	jrne 4$
      0091DE 90 F6 A4         [ 4] 3336 	call add 
      0091E1 0F 6B            [ 2] 3337 	jra 0$ 
      0091E3 01 AE 17         [ 4] 3338 4$:	call substract
      0091E6 18 17            [ 2] 3339 	jra 0$
      0091E8 02 90            [ 2] 3340 9$: ldw x,(N2,sp)
      0091EA 5C 04            [ 1] 3341 	ld a,#TK_INTGR	
      0091EB                       3342 expr_exit:
      001301                       3343 	_drop VSIZE 
      0091EB F6 27            [ 2]    1     addw sp,#VSIZE 
      0091ED 1E               [ 4] 3344 	ret 
                                   3345 
                                   3346 ;---------------------------------------------
                                   3347 ; rel ::= expr rel_op expr
                                   3348 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3349 ;  relation return 1 | 0  for true | false 
                                   3350 ;  output:
                                   3351 ;    A 		token attribute  
                                   3352 ;	 X		1|0
                                   3353 ;---------------------------------------------
                           000001  3354 	N1=1
                           000003  3355 	N2=3
                           000005  3356 	RELOP=5
                           000005  3357 	VSIZE=5 
      001304                       3358 relation: 
      001304                       3359 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0091EE 0D 01            [ 2]    1     sub sp,#VSIZE 
      0091F0 27 0B 90         [ 4] 3360 	call expression
      0091F3 F1 26            [ 1] 3361 	cp a,#CMD_END  
      0091F5 07 90            [ 1] 3362 	jrmi rel_exit 
                                   3363 	; expect rel_op or leave 
      0091F7 5C 5C            [ 2] 3364 	ldw (N2,sp),x 
      0091F9 0A 01 20         [ 4] 3365 	call next_token 
      0091FC EE 02            [ 1] 3366 	cp a,#2
      0091FD 2B 3E            [ 1] 3367 	jrmi 9$
      001316                       3368 1$:	
      0091FD 16 02            [ 1] 3369 	ld (RELOP,sp),a 
      0091FF 72 A2            [ 1] 3370 	and a,#TK_GRP_MASK
      009201 00 02            [ 1] 3371 	cp a,#TK_GRP_RELOP 
      009203 4B 00            [ 1] 3372 	jreq 2$
      009205 90 FE            [ 1] 3373 	ld a,(RELOP,sp)
      009207 84 27 21         [ 4] 3374 	call unget_token  
      00920A 20 D2            [ 2] 3375 	jra 9$
      00920C                       3376 2$:	; expect another expression or error 
      00920C 16 02 90         [ 4] 3377 	call expression
      00920F F6 6B            [ 1] 3378 	cp a,#TK_INTGR 
      009211 01 A4            [ 1] 3379 	jreq 3$
      009213 0F 4C C7         [ 2] 3380 	jp syntax_error 
      009216 00 0A            [ 2] 3381 3$:	ldw (N1,sp),x 
      009218 72 5F 00         [ 4] 3382 	call substract
      00921B 09 72            [ 1] 3383 	jrne 4$
      00921D B9 00 09 90      [ 1] 3384 	mov acc8,#2 ; n1==n2
      009221 FE 7B            [ 2] 3385 	jra 6$ 
      00133C                       3386 4$: 
      009223 01 4E            [ 1] 3387 	jrsgt 5$  
      009225 A4 0C 44 44      [ 1] 3388 	mov acc8,#4 ; n1<2 
      009229 AB 06            [ 2] 3389 	jra 6$
      00922B                       3390 5$:
      00922B 93 5B 03 81      [ 1] 3391 	mov acc8,#1 ; n1>n2 
      00922F                       3392 6$:
      00922F 88               [ 1] 3393 	clrw x 
      009230 CD 88 7D         [ 1] 3394 	ld a, acc8  
      009233 11 01            [ 1] 3395 	and a,(RELOP,sp)
      009235 27               [ 1] 3396 	tnz a 
      009236 03 CC            [ 1] 3397 	jreq 10$
      009238 87               [ 2] 3398 	incw x 
      001352                       3399 7$:	 
      009239 9D 84            [ 2] 3400 	jra 10$  	
      00923B 81 03            [ 2] 3401 9$: ldw x,(N2,sp)
      00923C                       3402 10$:
      00923C 4B 00            [ 1] 3403 	ld a,#TK_INTGR
      001358                       3404 rel_exit: 	 
      001358                       3405 	_drop VSIZE
      00923E CD 93            [ 2]    1     addw sp,#VSIZE 
      009240 84               [ 4] 3406 	ret 
                                   3407 
                                   3408 ;--------------------------------
                                   3409 ; BASIC: SHOW 
                                   3410 ;  show content of dstack,cstack
                                   3411 ;--------------------------------
      00135B                       3412 show:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009241 A1 00 27         [ 1] 3413 	ld a,base 
      009244 19               [ 1] 3414 	push a 
      009245 A1 04 26         [ 4] 3415 	call dots
      009248 12 CD 90         [ 4] 3416 	call dotr 
      00924B 0F               [ 1] 3417 	pop a 
      00924C 0C 01 CD         [ 1] 3418 	ld base,a 
      00924F 88               [ 1] 3419 	clr a 
      009250 7D               [ 4] 3420 	ret
                                   3421 
                                   3422 ;--------------------------------------------
                                   3423 ; BASIC: HEX 
                                   3424 ; select hexadecimal base for integer print
                                   3425 ;---------------------------------------------
      00136B                       3426 hex_base:
      009251 A1 00 27 09      [ 1] 3427 	mov base,#16 
      009255 A1               [ 4] 3428 	ret 
                                   3429 
                                   3430 ;--------------------------------------------
                                   3431 ; BASIC: DEC 
                                   3432 ; select decimal base for integer print
                                   3433 ;---------------------------------------------
      001370                       3434 dec_base:
      009256 0D 26 02 20      [ 1] 3435 	mov base,#10
      00925A E3               [ 4] 3436 	ret 
                                   3437 
                                   3438 ;------------------------
                                   3439 ; BASIC: SIZE 
                                   3440 ; return free size in text area
                                   3441 ; output:
                                   3442 ;   A 		TK_INTGR
                                   3443 ;   X 	    size integer
                                   3444 ;--------------------------
      001375                       3445 size:
      00925B CD 90 09         [ 2] 3446 	ldw x,#tib 
      00925E 84 81 00 1A      [ 2] 3447 	subw x,txtend 
      009260 A6 04            [ 1] 3448 	ld a,#TK_INTGR
      009260 A6               [ 4] 3449 	ret 
                                   3450 
                                   3451 
                                   3452 ;------------------------
                                   3453 ; BASIC: UBOUND  
                                   3454 ; return array variable size 
                                   3455 ; output:
                                   3456 ;   A 		TK_INTGR
                                   3457 ;   X 	    array size 
                                   3458 ;--------------------------
      00137F                       3459 ubound:
      009261 0B CD 92         [ 2] 3460 	ldw x,#tib
      009264 2F CD 92 3C      [ 2] 3461 	subw x,txtend 
      009268 88 A6 0C CD      [ 2] 3462 	ldw y,basicptr 
      00926C 92 2F 84 81      [ 2] 3463 	cpw y,txtend 
      009270 25 0A            [ 1] 3464 	jrult 1$
      009270 CD 92 60         [ 1] 3465 	push count 
      009273 A1 01            [ 1] 3466 	push #0 
      009275 27 03 CC         [ 2] 3467 	subw x,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      001398                       3468 	_drop 2 
      009278 87 9D            [ 2]    1     addw sp,#2 
      00927A CD               [ 2] 3469 1$:	srlw x 
      00927B 90 1C C3         [ 2] 3470 	ldw array_size,x
      00927E 00 1E            [ 1] 3471 	ld a,#TK_INTGR
      009280 23               [ 4] 3472 	ret 
                                   3473 
                                   3474 ;-----------------------------
                                   3475 ; BASIC: LET var=expr 
                                   3476 ; variable assignement 
                                   3477 ; output:
                                   3478 ;   A 		TK_NONE 
                                   3479 ;-----------------------------
      0013A1                       3480 let:
      009281 05 A6 0A         [ 4] 3481 	call next_token 
      009284 CC 87            [ 1] 3482 	cp a,#TK_VAR 
      009286 9F 5D            [ 1] 3483 	jreq let02
      009288 27 F8 58         [ 2] 3484 	jp syntax_error
      0013AB                       3485 let02:
      00928B 89 AE 16         [ 4] 3486 	call dpush 
      00928E C8 72 F0         [ 4] 3487 	call next_token 
      009291 01 5B            [ 1] 3488 	cp a,#TK_EQUAL
      009293 02 A6            [ 1] 3489 	jreq 1$
      009295 04 81 1D         [ 2] 3490 	jp syntax_error
      009297                       3491 1$:	
      009297 52 01 CD         [ 4] 3492 	call relation   
      00929A 88 7D            [ 1] 3493 	cp a,#TK_INTGR 
      00929C A1 02            [ 1] 3494 	jreq 2$
      00929E 2B 50 6B         [ 2] 3495 	jp syntax_error
      0013C2                       3496 2$:	
      0092A1 01 A4            [ 1] 3497 	ldw y,x 
      0092A3 30 A1 10         [ 4] 3498 	call dpop  
      0092A6 27               [ 2] 3499 	ldw (x),y   
      0092A7 04               [ 4] 3500 	ret 
                                   3501 
                                   3502 ;----------------------------
                                   3503 ; BASIC: LIST [[start][,end]]
                                   3504 ; list program lines 
                                   3505 ; form start to end 
                                   3506 ; if empty argument list then 
                                   3507 ; list all.
                                   3508 ;----------------------------
                           000001  3509 	FIRST=1
                           000003  3510 	LAST=3 
                           000005  3511 	LN_PTR=5
                           000006  3512 	VSIZE=6 
      0013C9                       3513 list:
      0013C9                       3514 	_vars VSIZE
      0092A8 7B 01            [ 2]    1     sub sp,#VSIZE 
      0092AA 20 03 18         [ 2] 3515 	ldw x,txtbgn 
      0092AC C3 00 1A         [ 2] 3516 	cpw x,txtend 
      0092AC CD 88            [ 1] 3517 	jrmi 1$
      0092AE 7D 14 49         [ 2] 3518 	jp list_exit ; nothing to list 
      0092AF 1F 05            [ 2] 3519 1$:	ldw (LN_PTR,sp),x 
      0092AF A1               [ 2] 3520 	ldw x,(x) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0092B0 07 26            [ 2] 3521 	ldw (FIRST,sp),x ; list from first line 
      0092B2 03 FD 20         [ 2] 3522 	ldw x,#0x7fff ; biggest line number 
      0092B5 31 03            [ 2] 3523 	ldw (LAST,sp),x 
      0092B6 CD 11 BC         [ 4] 3524 	call arg_list
      0092B6 A1               [ 1] 3525 	tnz a
      0092B7 04 26            [ 1] 3526 	jreq list_start 
      0092B9 02 20            [ 1] 3527 	cp a,#2 
      0092BB 2B 07            [ 1] 3528 	jreq 4$
      0092BC A1 01            [ 1] 3529 	cp a,#1 
      0092BC A1 02            [ 1] 3530 	jreq first_line 
      0092BE 26 06 CD         [ 2] 3531 	jp syntax_error 
      0092C1 92 70 FE         [ 4] 3532 4$:	call dswap
      0013F4                       3533 first_line:
      0092C4 20 21 9C         [ 4] 3534 	call dpop 
      0092C6 1F 01            [ 2] 3535 	ldw (FIRST,sp),x 
      0092C6 A1 05            [ 1] 3536 	cp a,#1 
      0092C8 26 03            [ 1] 3537 	jreq lines_skip 	
      0013FD                       3538 last_line:
      0092CA FE 20 1A         [ 4] 3539 	call dpop 
      0092CD 1F 03            [ 2] 3540 	ldw (LAST,sp),x 
      001402                       3541 lines_skip:
      0092CD A1 09 27         [ 2] 3542 	ldw x,txtbgn
      0092D0 16 05            [ 2] 3543 2$:	ldw (LN_PTR,sp),x 
      0092D1 C3 00 1A         [ 2] 3544 	cpw x,txtend 
      0092D1 A1 0B            [ 1] 3545 	jrpl list_exit 
      0092D3 26               [ 2] 3546 	ldw x,(x) ;line# 
      0092D4 0C CD            [ 2] 3547 	cpw x,(FIRST,sp)
      0092D6 93 84            [ 1] 3548 	jrpl list_start 
      0092D8 89 A6            [ 2] 3549 	ldw x,(LN_PTR,sp) 
      0092DA 0C CD 92         [ 2] 3550 	addw x,#2 
      0092DD 2F               [ 1] 3551 	ld a,(x)
      0092DE 85               [ 2] 3552 	incw x 
      0092DF 20 06 09         [ 1] 3553 	ld acc8,a 
      0092E1 72 5F 00 08      [ 1] 3554 	clr acc16 
      0092E1 CD 90 09 4F      [ 2] 3555 	addw x,acc16
      0092E5 20 09            [ 2] 3556 	jra 2$ 
                                   3557 ; print loop
      0092E7                       3558 list_start:
      0092E7 A6 11            [ 2] 3559 	ldw x,(LN_PTR,sp)
      001427                       3560 3$:	
      0092E9 11 01 26         [ 4] 3561 	call prt_basic_line
      0092EC 01 50            [ 2] 3562 	ldw x,(LN_PTR,sp)
      0092EE E6 02            [ 1] 3563 	ld a,(2,x)
      0092EE A6 04 09         [ 1] 3564 	ld acc8,a 
      0092F0 72 5F 00 08      [ 1] 3565 	clr acc16 
      0092F0 5B 01 81 08      [ 2] 3566 	addw x,acc16
      0092F3 C3 00 1A         [ 2] 3567 	cpw x,txtend 
      0092F3 52 05            [ 1] 3568 	jrpl list_exit
      0092F5 CD 92            [ 2] 3569 	ldw (LN_PTR,sp),x
      0092F7 97               [ 2] 3570 	ldw x,(x)
      0092F8 A1 02            [ 2] 3571 	cpw x,(LAST,sp)  
      0092FA 2B 41            [ 1] 3572 	jrsgt list_exit 
      0092FC 1E 05            [ 2] 3573 	ldw x,(LN_PTR,sp)
      0092FC 1F 03            [ 2] 3574 	jra 3$
      001449                       3575 list_exit:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      001449                       3576 	_drop VSIZE 
      0092FE CD 88            [ 2]    1     addw sp,#VSIZE 
      009300 7D               [ 4] 3577 	ret
                                   3578 
                                   3579 ;-------------------------
                                   3580 ; print counted string 
                                   3581 ; input:
                                   3582 ;   X 		address of string
                                   3583 ;--------------------------
      00144C                       3584 prt_cmd_name:
      009301 A1               [ 1] 3585 	ld a,(x)
      009302 02               [ 2] 3586 	incw x
      009303 2B 34            [ 1] 3587 	and a,#15  
      009305 6B               [ 1] 3588 	push a 
      009306 05 A4            [ 1] 3589 1$: tnz (1,sp) 
      009308 30 A1            [ 1] 3590 	jreq 9$
      00930A 20               [ 1] 3591 	ld a,(x)
      00930B 27 07 7B         [ 4] 3592 	call putc 
      00930E 05               [ 2] 3593 	incw x
      00930F CD 90            [ 1] 3594 	dec (1,sp)	 
      009311 09 20            [ 2] 3595 	jra 1$
      009313 25               [ 1] 3596 9$: pop a 
      009314 81               [ 4] 3597 	ret	
                                   3598 
                                   3599 ;--------------------------
                                   3600 ; print TK_QSTR
                                   3601 ; converting control character
                                   3602 ; to backslash sequence
                                   3603 ; input:
                                   3604 ;   X        char *
                                   3605 ;-----------------------------
      001460                       3606 prt_quote:
      009314 CD 92            [ 1] 3607 	ld a,#'"
      009316 97 A1 04         [ 4] 3608 	call putc 
      009319 27               [ 1] 3609 1$:	ld a,(x)
      00931A 03 CC            [ 1] 3610 	jreq 9$
      00931C 87               [ 2] 3611 	incw x 
      00931D 9D 1F            [ 1] 3612 	cp a,#SPACE 
      00931F 01 7B            [ 1] 3613 	jrult 3$
      009321 05 A1 20         [ 4] 3614 	call putc
      009324 26 05            [ 1] 3615 	cp a,#'\ 
      009326 CD 91            [ 1] 3616 	jrne 1$ 
      001474                       3617 2$:
      009328 0B 20 D1         [ 4] 3618 	call putc 
      00932B A1 21            [ 2] 3619 	jra 1$
      00932D 26               [ 1] 3620 3$: push a 
      00932E 05 CD            [ 1] 3621 	ld a,#'\
      009330 91 53 20         [ 4] 3622 	call putc 
      009333 C8               [ 1] 3623 	pop a 
      009334 CD 91            [ 1] 3624 	sub a,#7
      009336 97 20 C3         [ 1] 3625 	ld acc8,a 
      009339 1E 03 A6 04      [ 1] 3626 	clr acc16
      00933D 90 AE 0C 58      [ 2] 3627 	ldw y,#escaped 
      00933D 5B 05 81 08      [ 2] 3628 	addw y,acc16 
      009340 90 F6            [ 1] 3629 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009340 52 05            [ 2] 3630 	jra 2$
      009342 CD 92            [ 1] 3631 9$: ld a,#'"
      009344 F3 A1 02         [ 4] 3632 	call putc 
      009347 2B               [ 2] 3633 	incw x 
      009348 38               [ 4] 3634 	ret
                                   3635 
                                   3636 
                                   3637 ;--------------------------
                                   3638 ; decompile line from token list 
                                   3639 ; input:
                                   3640 ;   X 		pointer at line
                                   3641 ; output:
                                   3642 ;   none 
                                   3643 ;--------------------------	
                           000001  3644 	BASE_SAV=1
                           000002  3645 	WIDTH_SAV=2
                           000003  3646 	XSAVE=3
                           000005  3647 	LLEN=5
                           000005  3648 	VSIZE=5 
      00149C                       3649 prt_basic_line:
      00149C                       3650 	_vars VSIZE 
      009349 1F 03            [ 2]    1     sub sp,#VSIZE 
      00934B CD 88 7D         [ 1] 3651 	ld a,base
      00934E A1 02            [ 1] 3652 	ld (BASE_SAV,sp),a  
      009350 2B 2B 6B         [ 1] 3653 	ld a,tab_width 
      009353 05 A4            [ 1] 3654 	ld (WIDTH_SAV,sp),a 
      009355 30 A1 10         [ 2] 3655 	ldw ptr16,x
      009358 27               [ 2] 3656 	ldw x,(x)
      009359 07 7B 05 CD      [ 1] 3657 	mov base,#10
      00935D 90 09 20 1C      [ 1] 3658 	mov tab_width,#5
      009361 CD 09 96         [ 4] 3659 	call print_int ; print line number 
      009361 CD 92            [ 1] 3660 	ld a,#SPACE 
      009363 F3 A1 04         [ 4] 3661 	call putc 
      009366 27 03 CC 87      [ 1] 3662 	clr tab_width
      00936A 9D 1F 01         [ 2] 3663 	ldw x,#2
      00936D 7B 05 A1 10      [ 4] 3664 	ld a,([ptr16],x)
      009371 26 05            [ 1] 3665 	ld (LLEN,sp),a 
      009373 CD               [ 2] 3666 	incw x
      009374 90               [ 1] 3667 1$:	ld a,xl 
      009375 FD 20            [ 1] 3668 	cp a,(LLEN,sp)
      009377 D1 CD            [ 1] 3669 	jrmi 20$
      009379 91 05 20         [ 2] 3670 	jp 90$
      0014D2                       3671 20$:	 
      00937C CC 1E 03 A6      [ 4] 3672 	ld a,([ptr16],x)
      009380 04               [ 2] 3673 	incw x 
      009381 1F 03            [ 2] 3674 	ldw (XSAVE,sp),x 
      009381 5B 05            [ 1] 3675 	cp a,#TK_CMD 
      009383 81 44            [ 1] 3676 	jrult 5$
      009384 A1 09            [ 1] 3677 	cp a,#TK_CONST 
      009384 52 05            [ 1] 3678 	jrugt 4$
      0014E1                       3679 2$:	
      009386 CD 93 40 A1      [ 5] 3680 	ldw x,([ptr16],x)
      00938A 02 2B 4B         [ 2] 3681 	cpw x,#rem 
      00938D 1F 03            [ 1] 3682 	jrne 3$
      00938F CD 88            [ 1] 3683 	ld a,#''
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009391 7D A1 02         [ 4] 3684 	call putc 
      009394 2B 3E            [ 2] 3685 	ldw x,(XSAVE,sp)
      009396 1C 00 02         [ 2] 3686 	addw x,#2
      009396 6B 05 A4 30      [ 2] 3687 	addw x,ptr16  
      00939A A1 30 27         [ 4] 3688 	call puts 
      00939D 07 7B 05         [ 2] 3689 	jp 90$ 
      0093A0 CD 90 09         [ 4] 3690 3$:	call cmd_name
      0093A3 20 2F 4C         [ 4] 3691 	call prt_cmd_name
      0093A5 A6 20            [ 1] 3692 	ld a,#SPACE 
      0093A5 CD 93 40         [ 4] 3693 	call putc 
      0093A8 A1 04            [ 2] 3694 	ldw x,(XSAVE,sp)
      0093AA 27 03 CC         [ 2] 3695 	addw x,#2
      0093AD 87 9D            [ 2] 3696 	jra 1$
      0093AF 1F 01            [ 1] 3697 4$: cp a,#TK_QSTR 
      0093B1 CD 91            [ 1] 3698 	jrne 5$
      0093B3 05 26 06 35      [ 2] 3699 	addw x,ptr16
      0093B7 02 00 0A         [ 4] 3700 	call prt_quote 
      0093BA 20 0C 00 11      [ 2] 3701 	subw x,ptr16  
      0093BC 20 A9            [ 2] 3702 	jra 1$
      0093BC 2C 06            [ 1] 3703 5$:	cp a,#TK_VAR
      0093BE 35 04            [ 1] 3704 	jrne 6$ 
      0093C0 00 0A 20 04      [ 5] 3705 	ldw x,([ptr16],x)
      0093C4 1D 00 21         [ 2] 3706 	subw x,#vars 
      0093C4 35               [ 1] 3707 	ld a,xl
      0093C5 01               [ 1] 3708 	srl a 
      0093C6 00 0A            [ 1] 3709 	add a,#'A 
      0093C8 CD 01 B3         [ 4] 3710 	call putc 
      0093C8 5F C6            [ 1] 3711 	ld a,#SPACE 
      0093CA 00 0A 14         [ 4] 3712 	call putc 
      0093CD 05 4D            [ 2] 3713 	ldw x,(XSAVE,sp)
      0093CF 27 05 5C         [ 2] 3714 	addw x,#2 
      0093D2 20 8B            [ 2] 3715 	jra 1$ 
      0093D2 20 02            [ 1] 3716 6$: cp a,#TK_ARRAY 
      0093D4 1E 03            [ 1] 3717 	jrne 7$
      0093D6 A6 40            [ 1] 3718 	ld a,#'@ 
      0093D6 A6 04 B3         [ 4] 3719 	call putc 
      0093D8 1E 03            [ 2] 3720 	ldw x,(XSAVE,sp)
      0093D8 5B 05 81         [ 2] 3721 	jp 1$ 
      0093DB A1 04            [ 1] 3722 7$: cp a,#TK_INTGR 
      0093DB C6 00            [ 1] 3723 	jrne 8$
      0093DD 07 88 CD 90      [ 5] 3724 	ldw x,([ptr16],x)
      0093E1 9D CD 90         [ 4] 3725 	call print_int
      0093E4 D0 84            [ 1] 3726 	ld a,#SPACE 
      0093E6 C7 00 07         [ 4] 3727 	call putc 
      0093E9 4F 81            [ 2] 3728 	ldw x,(XSAVE,sp)
      0093EB 1C 00 02         [ 2] 3729 	addw x,#2 
      0093EB 35 10 00         [ 2] 3730 	jp 1$
      0093EE 07 81            [ 1] 3731 8$: cp a,#TK_GT 
      0093F0 2B 1A            [ 1] 3732 	jrmi 9$
      0093F0 35 0A            [ 1] 3733 	cp a,#TK_NE 
      0093F2 00 07            [ 1] 3734 	jrugt 9$
      0093F4 81 31            [ 1] 3735 	sub a,#TK_GT  
      0093F5 48               [ 1] 3736 	sll a 
      0093F5 AE 16            [ 1] 3737 	clrw y 
      0093F7 C8 72            [ 1] 3738 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0093F9 B0 00 1B A6      [ 2] 3739 	addw y,#relop_str 
      0093FD 04 81            [ 2] 3740 	ldw y,(y)
      0093FF 93               [ 1] 3741 	ldw x,y 
      0093FF AE 16 C8         [ 4] 3742 	call puts 
      009402 72 B0            [ 2] 3743 	ldw x,(XSAVE,sp)
      009404 00 1B 90         [ 2] 3744 	jp 1$
      009407 CE 00            [ 1] 3745 9$: cp a,#TK_PLUS 
      009409 05 90            [ 1] 3746 	jrne 10$
      00940B C3 00            [ 1] 3747 	ld a,#'+
      00940D 1B 25            [ 2] 3748 	jra 80$ 
      00940F 0A 3B            [ 1] 3749 10$: cp a,#TK_MINUS
      009411 00 04            [ 1] 3750 	jrne 11$
      009413 4B 00            [ 1] 3751 	ld a,#'-
      009415 72 F0            [ 2] 3752 	jra 80$
      009417 01 5B            [ 1] 3753 11$: cp a,#TK_MULT 
      009419 02 54            [ 1] 3754 	jrmi 12$
      00941B CF 00            [ 1] 3755 	cp a,#TK_MOD 
      00941D 1E A6            [ 1] 3756 	jrugt 12$
      00941F 04 81            [ 1] 3757 	sub a,#0x20
      009421 5F               [ 1] 3758 	clrw x 
      009421 CD               [ 1] 3759 	ld xl,a 
      009422 88 7D A1         [ 2] 3760 	addw x,#mul_char 
      009425 05               [ 1] 3761 	ld a,(x)
      009426 27 03            [ 2] 3762 	jra 80$ 
      009428 CC 87            [ 1] 3763 12$: cp a,#TK_LPAREN 
      00942A 9D 0E            [ 1] 3764 	jrmi 13$
      00942B A1 0E            [ 1] 3765 	cp a,#TK_SHARP 
      00942B CD 90            [ 1] 3766 	jrugt 13$
      00942D 0F CD            [ 1] 3767 	sub a,#TK_LPAREN
      00942F 88               [ 1] 3768 	clrw x 
      009430 7D               [ 1] 3769 	ld xl,a 
      009431 A1 32 27         [ 2] 3770 	addw x,#single_char 
      009434 03               [ 1] 3771 	ld a,(x)
      009435 CC 87            [ 2] 3772 	jra 80$
      009437 9D 03            [ 1] 3773 13$: cp a,#TK_CHAR 
      009438 26 14            [ 1] 3774 	jrne 14$
      009438 CD 93            [ 1] 3775 	ld a,#'\
      00943A 84 A1 04         [ 4] 3776 	call putc 
      00943D 27 03            [ 2] 3777 	ldw x,(XSAVE,sp)
      00943F CC 87 9D 11      [ 4] 3778 	ld a,([ptr16],x)
      009442 5C               [ 2] 3779 	incw x 
      009442 90 93            [ 2] 3780 	ldw (XSAVE,sp),x 
      009444 CD 90 1C         [ 4] 3781 	call putc 
      009447 FF 81 CA         [ 2] 3782 	jp 1$ 
      009449 A6 3A            [ 1] 3783 14$: ld a,#':
      009449 52 06 CE         [ 4] 3784 80$: call putc 
      00944C 00 19            [ 2] 3785 	ldw x,(XSAVE,sp)
      00944E C3 00 1B         [ 2] 3786 	jp 1$ 
      0015D9                       3787 90$: 
      009451 2B 03            [ 1] 3788 	ld a,#CR 
      009453 CC 94 C9         [ 4] 3789 	call putc
      009456 1F 05            [ 1] 3790 	ld a,(WIDTH_SAV,sp) 
      009458 FE 1F 01         [ 1] 3791 	ld tab_width,a 
      00945B AE 7F            [ 1] 3792 	ld a,(BASE_SAV,sp) 
      00945D FF 1F 03         [ 1] 3793 	ld base,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0015E8                       3794 	_drop VSIZE 
      009460 CD 92            [ 2]    1     addw sp,#VSIZE 
      009462 3C               [ 4] 3795 	ret 	
      009463 4D 27 3F A1           3796 single_char: .byte '(',')',',','#'
      009467 02 27 07              3797 mul_char: .byte '*','/','%'
      00946A A1 01 27 06 CC 87 9D  3798 relop_str: .word gt,equal,ge,lt,le,ne 
             CD 90 29 16 0A
      009474 3E 00                 3799 gt: .asciz ">"
      009474 CD 90                 3800 equal: .asciz "="
      009476 1C 1F 01              3801 ge: .asciz ">="
      009479 A1 01                 3802 lt: .asciz "<"
      00947B 27 05 00              3803 le: .asciz "<="
      00947D 3C 3E 00              3804 ne:  .asciz "<>"
                                   3805 
                                   3806 
                                   3807 ;---------------------------------
                                   3808 ; BASIC: PRINT|? arg_list 
                                   3809 ; print values from argument list
                                   3810 ;----------------------------------
                           000001  3811 	COMMA=1
                           000001  3812 	VSIZE=1
      00160D                       3813 print:
      00947D CD 90            [ 1] 3814 push #0 ; local variable COMMA 
      00160F                       3815 reset_comma:
      00947F 1C 1F            [ 1] 3816 	clr (COMMA,sp)
      001611                       3817 prt_loop:
      009481 03 13 04         [ 4] 3818 	call relation 
      009482 A1 01            [ 1] 3819 	cp a,#TK_COLON 
      009482 CE 00            [ 1] 3820 	jreq print_exit   
      009484 19 1F            [ 1] 3821 	cp a,#TK_INTGR 
      009486 05 C3            [ 1] 3822 	jrne 0$ 
      009488 00 1B 2A         [ 4] 3823 	call print_int 
      00948B 3D FE            [ 2] 3824 	jra reset_comma
      001621                       3825 0$: 	
      00948D 13 01 2A         [ 4] 3826 	call next_token
      009490 14 1E            [ 1] 3827 	cp a,#TK_NONE 
      009492 05 1C            [ 1] 3828 	jreq print_exit 
      009494 00 02            [ 1] 3829 1$:	cp a,#TK_QSTR
      009496 F6 5C            [ 1] 3830 	jrne 2$   
      009498 C7 00 0A         [ 4] 3831 	call puts
      00949B 72               [ 2] 3832 	incw x 
      00949C 5F 00 09 72      [ 2] 3833 	subw x,basicptr 
      0094A0 BB               [ 1] 3834 	ld a,xl 
      0094A1 00 09 20         [ 1] 3835 	ld in,a  
      0094A4 E0 D5            [ 2] 3836 	jra reset_comma
      0094A5 A1 03            [ 1] 3837 2$: cp a,#TK_CHAR 
      0094A5 1E 05            [ 1] 3838 	jrne 3$
      0094A7 9F               [ 1] 3839 	ld a,xl 
      0094A7 CD 95 1C         [ 4] 3840 	call putc 
      0094AA 1E 05            [ 2] 3841 	jra reset_comma 
      001644                       3842 3$: 	
      0094AC E6 02            [ 1] 3843 	cp a,#TK_CFUNC 
      0094AE C7 00            [ 1] 3844 	jrne 4$ 
      0094B0 0A               [ 4] 3845 	call (x)
      0094B1 72               [ 1] 3846 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0094B2 5F 00 09         [ 4] 3847 	call putc
      0094B5 72 BB            [ 2] 3848 	jra reset_comma 
      00164F                       3849 4$: 
      0094B7 00 09            [ 1] 3850 	cp a,#TK_COMMA 
      0094B9 C3 00            [ 1] 3851 	jrne 5$
      0094BB 1B 2A            [ 1] 3852 	cpl (COMMA,sp) 
      0094BD 0B 1F 05         [ 2] 3853 	jp prt_loop   
      001658                       3854 5$: 
      0094C0 FE 13            [ 1] 3855 	cp a,#TK_SHARP
      0094C2 03 2C            [ 1] 3856 	jrne 7$
      0094C4 04 1E 05         [ 4] 3857 	call next_token
      0094C7 20 DE            [ 1] 3858 	cp a,#TK_INTGR 
      0094C9 27 03            [ 1] 3859 	jreq 6$
      0094C9 5B 06 81         [ 2] 3860 	jp syntax_error 
      0094CC                       3861 6$:
      0094CC F6               [ 1] 3862 	ld a,xl 
      0094CD 5C A4            [ 1] 3863 	and a,#15 
      0094CF 0F 88 0D         [ 1] 3864 	ld tab_width,a 
      0094D2 01 27 09         [ 2] 3865 	jp reset_comma 
      00166F                       3866 7$:	
      0094D5 F6 CD 82         [ 4] 3867 	call unget_token
      001672                       3868 print_exit:
      0094D8 33 5C            [ 1] 3869 	tnz (COMMA,sp)
      0094DA 0A 01            [ 1] 3870 	jrne 9$
      0094DC 20 F3            [ 1] 3871 	ld a,#CR 
      0094DE 84 81 B3         [ 4] 3872     call putc 
      0094E0                       3873 9$:	_drop VSIZE 
      0094E0 A6 22            [ 2]    1     addw sp,#VSIZE 
      0094E2 CD               [ 4] 3874 	ret 
                                   3875 
                                   3876 ;----------------------
                                   3877 ; 'save_context' and
                                   3878 ; 'rest_context' must be 
                                   3879 ; called at the same 
                                   3880 ; call stack depth 
                                   3881 ; i.e. SP must have the 
                                   3882 ; save value at  
                                   3883 ; entry point of both 
                                   3884 ; routine. 
                                   3885 ;---------------------
                           000006  3886 	CTXT_SIZE=6 ; size of saved data 
                                   3887 ;--------------------
                                   3888 ; save current BASIC
                                   3889 ; interpreter context 
                                   3890 ; on cstack 
                                   3891 ;--------------------
      00167E                       3892 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00167E                       3893 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00167E                       3894 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      00167E                       3895 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      00167E                       3896 	_arg CNT 6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                           000008     1     CNT=ARG_OFS+6 
      00167E                       3897 save_context:
      0094E3 82 33 F6         [ 2] 3898 	ldw x,basicptr 
      0094E6 27 2D            [ 2] 3899 	ldw (BPTR,sp),x
      0094E8 5C A1 20         [ 1] 3900 	ld a,in 
      0094EB 25 0C            [ 1] 3901 	ld (IN,sp),a
      0094ED CD 82 33         [ 1] 3902 	ld a,count 
      0094F0 A1 5C            [ 1] 3903 	ld (CNT,sp),a  
      0094F2 26               [ 4] 3904 	ret
                                   3905 
                                   3906 ;-----------------------
                                   3907 ; restore previously saved 
                                   3908 ; BASIC interpreter context 
                                   3909 ; from cstack 
                                   3910 ;-------------------------
      00168E                       3911 rest_context:
      0094F3 F1 03            [ 2] 3912 	ldw x,(BPTR,sp)
      0094F4 CF 00 04         [ 2] 3913 	ldw basicptr,x 
      0094F4 CD 82            [ 1] 3914 	ld a,(IN,sp)
      0094F6 33 20 EC         [ 1] 3915 	ld in,a
      0094F9 88 A6            [ 1] 3916 	ld a,(CNT,sp)
      0094FB 5C CD 82         [ 1] 3917 	ld count,a  
      0094FE 33               [ 4] 3918 	ret
                                   3919 
                                   3920 ;------------------------------------------
                                   3921 ; BASIC: INPUT [string],var[,[string],var]
                                   3922 ; input value in variables 
                                   3923 ; [string] optionally can be used as prompt 
                                   3924 ;-----------------------------------------
                           000001  3925 	CX_BPTR=1
                           000003  3926 	CX_LNO=3
                           000004  3927 	CX_IN=4
                           000005  3928 	CX_CNT=5
                           000006  3929 	SKIP=6
                           000007  3930 	VSIZE=7
      00169E                       3931 input_var:
      0094FF 84 A0 07 C7 00   [ 2] 3932 	btjt flags,#FRUN,1$ 
      009504 0A 72            [ 1] 3933 	ld a,#ERR_RUN_ONLY 
      009506 5F 00 09         [ 2] 3934 	jp tb_error 
      0016A8                       3935 1$:	_vars VSIZE 
      009509 90 AE            [ 2]    1     sub sp,#VSIZE 
      0016AA                       3936 input_loop:
      00950B 8C D8            [ 1] 3937 	clr (SKIP,sp)
      00950D 72 B9 00         [ 4] 3938 	call next_token 
      009510 09 90            [ 1] 3939 	cp a,#TK_NONE 
      009512 F6 20            [ 1] 3940 	jreq input_exit 
      009514 DF A6            [ 1] 3941 	cp a,#TK_QSTR 
      009516 22 CD            [ 1] 3942 	jrne 1$ 
      009518 82 33 5C         [ 4] 3943 	call puts 
      00951B 81 06            [ 1] 3944 	cpl (SKIP,sp)
      00951C CD 07 FD         [ 4] 3945 	call next_token 
      00951C 52 05            [ 1] 3946 1$: cp a,#TK_VAR  
      00951E C6 00            [ 1] 3947 	jreq 2$ 
      009520 07 6B 01         [ 2] 3948 	jp syntax_error
      009523 C6 00 21         [ 4] 3949 2$:	call dpush 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009526 6B 02            [ 1] 3950 	tnz (SKIP,sp)
      009528 CF 00            [ 1] 3951 	jrne 21$ 
      00952A 12 FE            [ 1] 3952 	ld a,#':
      00952C 35 0A 00         [ 1] 3953 	ld pad+1,a 
      00952F 07 35 05 00      [ 1] 3954 	clr pad+2
      009533 21 CD 8A         [ 2] 3955 	ldw x,#pad 
      009536 16 A6 20         [ 4] 3956 	call puts   
      0016DC                       3957 21$:
      009539 CD 82 33         [ 4] 3958 	call save_context 
      00953C 72 5F 00         [ 2] 3959 	ldw x,#tib 
      00953F 21 AE 00         [ 2] 3960 	ldw basicptr,x  
      009542 02 72 D6 00      [ 1] 3961 	clr count  
      009546 12 6B 05         [ 4] 3962 	call readln 
      009549 5C 9F 11 05      [ 1] 3963 	clr in 
      00954D 2B 03 CC         [ 4] 3964 	call relation 
      009550 96 59            [ 1] 3965 	cp a,#TK_INTGR
      009552 27 03            [ 1] 3966 	jreq 3$ 
      009552 72 D6 00         [ 2] 3967 	jp syntax_error
      009555 12 5C 1F         [ 4] 3968 3$: call dpush 
      009558 03 A1 06         [ 4] 3969 	call store 
      00955B 25 44 A1         [ 4] 3970 	call rest_context
      00955E 09 22 2F         [ 4] 3971 	call next_token 
      009561 A1 0D            [ 1] 3972 	cp a,#TK_COMMA 
      009561 72 DE            [ 1] 3973 	jrne 4$
      009563 00 12            [ 2] 3974 	jra input_loop 
      009565 A3 97 92         [ 4] 3975 4$:	call unget_token 
      00170F                       3976 input_exit:
      00170F                       3977 	_drop VSIZE 
      009568 26 14            [ 2]    1     addw sp,#VSIZE 
      00956A A6               [ 4] 3978 	ret 
                                   3979 
                                   3980 
                                   3981 ;---------------------
                                   3982 ; BASIC: REMARK | ' 
                                   3983 ; skip comment to end of line 
                                   3984 ;---------------------- 
      001712                       3985 rem:
      00956B 27 CD 82 33 1E   [ 1] 3986  	mov count,in 
      009570 03               [ 4] 3987 	ret 
                                   3988 
                                   3989 ;---------------------
                                   3990 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3991 ; read in loop 'addr'  
                                   3992 ; apply & 'mask' to value 
                                   3993 ; loop while result==0.  
                                   3994 ; if 'xor_mask' given 
                                   3995 ; apply ^ in second  
                                   3996 ; loop while result==0 
                                   3997 ;---------------------
                           000001  3998 	XMASK=1 
                           000002  3999 	MASK=2
                           000003  4000 	ADDR=3
                           000004  4001 	VSIZE=4
      001718                       4002 wait: 
      001718                       4003 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009571 1C 00            [ 2]    1     sub sp,#VSIZE 
      009573 02 72            [ 1] 4004 	clr (XMASK,sp) 
      009575 BB 00 12         [ 4] 4005 	call arg_list 
      009578 CD 82            [ 1] 4006 	cp a,#2
      00957A 45 CC            [ 1] 4007 	jruge 0$
      00957C 96 59 CD         [ 2] 4008 	jp syntax_error 
      00957F 91 A8            [ 1] 4009 0$:	cp a,#3
      009581 CD 94            [ 1] 4010 	jrult 1$
      009583 CC A6 20         [ 4] 4011 	call dpop 
      009586 CD               [ 1] 4012 	ld a,xl
      009587 82 33            [ 1] 4013 	ld (XMASK,sp),a 
      009589 1E 03 1C         [ 4] 4014 1$: call dpop ; mask 
      00958C 00               [ 1] 4015 	ld a,xl 
      00958D 02 20            [ 1] 4016 	ld (MASK,sp),a 
      00958F BA A1 0A         [ 4] 4017 	call dpop ; address 
      009592 26               [ 1] 4018 2$:	ld a,(x)
      009593 0D 72            [ 1] 4019 	and a,(MASK,sp)
      009595 BB 00            [ 1] 4020 	xor a,(XMASK,sp)
      009597 12 CD            [ 1] 4021 	jreq 2$ 
      001740                       4022 	_drop VSIZE 
      009599 94 E0            [ 2]    1     addw sp,#VSIZE 
      00959B 72               [ 4] 4023 	ret 
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
      001743                       4035 bit_set:
      00959C B0 00 12         [ 4] 4036 	call arg_list 
      00959F 20 A9            [ 1] 4037 	cp a,#2	 
      0095A1 A1 05            [ 1] 4038 	jreq 1$ 
      0095A3 26 1A 72         [ 2] 4039 	jp syntax_error
      00174D                       4040 1$: 
      0095A6 DE 00 12         [ 4] 4041 	call dpop ; mask 
      0095A9 1D               [ 1] 4042 	ld a,xl 
      0095AA 00 22 9F         [ 4] 4043 	call dpop ; addr  
      0095AD 44               [ 1] 4044 	or a,(x)
      0095AE AB               [ 1] 4045 	ld (x),a
      0095AF 41               [ 4] 4046 	ret 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4057 ;--------------------------
      001757                       4058 bit_reset:
      0095B0 CD 82 33         [ 4] 4059 	call arg_list 
      0095B3 A6 20            [ 1] 4060 	cp a,#2  
      0095B5 CD 82            [ 1] 4061 	jreq 1$ 
      0095B7 33 1E 03         [ 2] 4062 	jp syntax_error
      001761                       4063 1$: 
      0095BA 1C 00 02         [ 4] 4064 	call dpop ; mask 
      0095BD 20               [ 1] 4065 	ld a,xl 
      0095BE 8B               [ 1] 4066 	cpl a 
      0095BF A1 02 26         [ 4] 4067 	call dpop ; addr  
      0095C2 0A               [ 1] 4068 	and a,(x)
      0095C3 A6               [ 1] 4069 	ld (x),a 
      0095C4 40               [ 4] 4070 	ret 
                                   4071 
                                   4072 ;---------------------
                                   4073 ; BASIC: BRES addr,mask
                                   4074 ; toggle bits at 'addr' corresponding 
                                   4075 ; to those of 'mask' that are at 1.
                                   4076 ; arguments:
                                   4077 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4078 ;   mask	    mask^*addr  
                                   4079 ; output:
                                   4080 ;	none 
                                   4081 ;--------------------------
      00176C                       4082 bit_toggle:
      0095C5 CD 82 33         [ 4] 4083 	call arg_list 
      0095C8 1E 03            [ 1] 4084 	cp a,#2 
      0095CA CC 95            [ 1] 4085 	jreq 1$ 
      0095CC 4A A1 04         [ 2] 4086 	jp syntax_error
      0095CF 26 14 72         [ 4] 4087 1$: call dpop ; mask 
      0095D2 DE               [ 1] 4088 	ld a,xl 
      0095D3 00 12 CD         [ 4] 4089 	call dpop ; addr  
      0095D6 8A               [ 1] 4090 	xor a,(x)
      0095D7 16               [ 1] 4091 	ld (x),a 
      0095D8 A6               [ 4] 4092 	ret 
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
      001780                       4105 bit_test:
      0095D9 20 CD 82         [ 4] 4106 	call func_args 
      0095DC 33 1E            [ 1] 4107 	cp a,#2
      0095DE 03 1C            [ 1] 4108 	jreq 0$
      0095E0 00 02 CC         [ 2] 4109 	jp syntax_error
      00178A                       4110 0$:	
      0095E3 95 4A A1         [ 4] 4111 	call dpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0095E6 31               [ 1] 4112 	ld a,xl 
      0095E7 2B 1A            [ 1] 4113 	and a,#7
      0095E9 A1               [ 1] 4114 	push a 
      0095EA 35 22            [ 1] 4115 	ld a,#1 
      0095EC 16 A0            [ 1] 4116 1$: tnz (1,sp)
      0095EE 31 48            [ 1] 4117 	jreq 2$
      0095F0 90               [ 1] 4118 	sll a 
      0095F1 5F 90            [ 1] 4119 	dec (1,sp)
      0095F3 97 72            [ 2] 4120 	jra 1$
      0095F5 A9 96 72         [ 4] 4121 2$: call dpop 
      0095F8 90               [ 1] 4122 	and a,(x)
      0095F9 FE 93            [ 1] 4123 	jreq 3$
      0095FB CD 82            [ 1] 4124 	ld a,#1 
      0095FD 45               [ 1] 4125 3$:	clrw x 
      0095FE 1E               [ 1] 4126 	ld xl,a 
      0095FF 03 CC            [ 1] 4127 	ld a,#TK_INTGR
      0017A8                       4128 	_drop 1 
      009601 95 4A            [ 2]    1     addw sp,#1 
      009603 A1               [ 4] 4129 	ret
                                   4130 
                                   4131 
                                   4132 ;--------------------
                                   4133 ; BASIC: POKE addr,byte
                                   4134 ; put a byte at addr 
                                   4135 ;--------------------
      0017AB                       4136 poke:
      009604 10 26 04         [ 4] 4137 	call arg_list 
      009607 A6 2B            [ 1] 4138 	cp a,#2
      009609 20 46            [ 1] 4139 	jreq 1$
      00960B A1 11 26         [ 2] 4140 	jp syntax_error
      0017B5                       4141 1$:	
      00960E 04 A6 2D         [ 4] 4142 	call dpop 
      009611 20               [ 1] 4143     ld a,xl 
      009612 3E A1 20         [ 4] 4144 	call dpop 
      009615 2B               [ 1] 4145 	ld (x),a 
      009616 0E               [ 4] 4146 	ret 
                                   4147 
                                   4148 ;-----------------------
                                   4149 ; BASIC: PEEK(addr)
                                   4150 ; get the byte at addr 
                                   4151 ; input:
                                   4152 ;	none 
                                   4153 ; output:
                                   4154 ;	X 		value 
                                   4155 ;-----------------------
      0017BE                       4156 peek:
      009617 A1 22 22         [ 4] 4157 	call func_args
      00961A 0A A0            [ 1] 4158 	cp a,#1
      00961C 20 5F            [ 1] 4159 	jreq 1$
      00961E 97 1C 96         [ 2] 4160 	jp syntax_error
      009621 6F F6 20         [ 4] 4161 1$:	call dpop 
      009624 2C               [ 1] 4162 	ld a,(x)
      009625 A1               [ 1] 4163 	clrw x 
      009626 0B               [ 1] 4164 	ld xl,a 
      009627 2B 0E            [ 1] 4165 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009629 A1               [ 4] 4166 	ret 
                                   4167 
      0017D1                       4168 if: 
      00962A 0E 22 0A         [ 4] 4169 	call relation 
      00962D A0 0B            [ 1] 4170 	cp a,#TK_INTGR
      00962F 5F 97            [ 1] 4171 	jreq 1$ 
      009631 1C 96 6B         [ 2] 4172 	jp syntax_error
      009634 F6               [ 1] 4173 1$:	clr a 
      009635 20               [ 2] 4174 	tnzw x 
      009636 1A A1            [ 1] 4175 	jrne 9$  
                                   4176 ;skip to next line
      009638 03 26 14 A6 5C   [ 1] 4177 	mov in,count
      00963D CD               [ 4] 4178 9$:	ret 
                                   4179 
                                   4180 ;------------------------
                                   4181 ; BASIC: FOR var=expr 
                                   4182 ; set variable to expression 
                                   4183 ; leave variable address 
                                   4184 ; on dstack and set
                                   4185 ; FFOR bit in 'flags'
                                   4186 ;-----------------
                           000001  4187 	RETL1=1
                           000003  4188 	INW=3
                           000005  4189 	BPTR=5
      0017E5                       4190 for: ; { -- var_addr }
      00963E 82 33            [ 1] 4191 	ld a,#TK_VAR 
      009640 1E 03 72         [ 4] 4192 	call expect
      009643 D6 00 12         [ 4] 4193 	call dpush 
      009646 5C 1F 03         [ 4] 4194 	call let02 
      009649 CD 82 33 CC      [ 1] 4195 	bset flags,#FFOR 
                                   4196 ; open space on cstack for BPTR and INW 
      00964D 95               [ 2] 4197 	popw x ; call return address 
      0017F5                       4198 	_vars 4
      00964E 4A A6            [ 2]    1     sub sp,#4 
      009650 3A               [ 2] 4199 	pushw x  ; RETL1 
      009651 CD               [ 1] 4200 	clrw x 
      009652 82 33            [ 2] 4201 	ldw (BPTR,sp),x 
      009654 1E 03            [ 2] 4202 	ldw (INW,sp),x 
      009656 CC 95 4A         [ 4] 4203 	call next_token 
      009659 A1 06            [ 1] 4204 	cp a,#TK_CMD 
      009659 A6 0D            [ 1] 4205 	jreq 1$
      00965B CD 82 33         [ 2] 4206 	jp syntax_error
      001807                       4207 1$:  
      00965E 7B 02 C7         [ 2] 4208 	cpw x,#to 
      009661 00 21            [ 1] 4209 	jreq to
      009663 7B 01 C7         [ 2] 4210 	jp syntax_error 
                                   4211 
                                   4212 ;-----------------------------------
                                   4213 ; BASIC: TO expr 
                                   4214 ; second part of FOR loop initilization
                                   4215 ; leave limit on dstack and set 
                                   4216 ; FTO bit in 'flags'
                                   4217 ;-----------------------------------
      00180F                       4218 to: ; { var_addr -- var_addr limit step }
      009666 00 07 5B 05 81   [ 2] 4219 	btjt flags,#FFOR,1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      00966B 28 29 2C         [ 2] 4220 	jp syntax_error
      00966E 23 2A 2F         [ 4] 4221 1$: call relation  
      009671 25 96            [ 1] 4222 	cp a,#TK_INTGR 
      009673 7E 96            [ 1] 4223 	jreq 2$ 
      009675 80 96 82         [ 2] 4224 	jp syntax_error
      001821                       4225 2$: 
      009678 96 85 96         [ 4] 4226     call dpush ; limit
      00967B 87 96 8A         [ 2] 4227 	ldw x,in.w 
      00967E 3E 00 3D         [ 4] 4228 	call next_token
      009681 00 3E            [ 1] 4229 	cp a,#TK_NONE  
      009683 3D 00            [ 1] 4230 	jreq 4$ 
      009685 3C 00            [ 1] 4231 	cp a,#TK_CMD
      009687 3C 3D            [ 1] 4232 	jrne 3$
      009689 00 3C 3E         [ 2] 4233 	cpw x,#step 
      00968C 00 08            [ 1] 4234 	jreq step
      00968D                       4235 3$:	
      00968D 4B 00 89         [ 4] 4236 	call unget_token   	 
      00968F                       4237 4$:	
      00968F 0F 01 01         [ 2] 4238 	ldw x,#1   ; default step  
      009691 20 12            [ 2] 4239 	jra store_loop_addr 
                                   4240 
                                   4241 
                                   4242 ;----------------------------------
                                   4243 ; BASIC: STEP expr 
                                   4244 ; optional third par of FOR loop
                                   4245 ; initialization. 	
                                   4246 ;------------------------------------
      00183F                       4247 step: ; {var limit -- var limit step}
      009691 CD 93 84 A1 01   [ 2] 4248 	btjt flags,#FFOR,1$
      009696 27 5A A1         [ 2] 4249 	jp syntax_error
      009699 04 26 05         [ 4] 4250 1$: call relation
      00969C CD 8A            [ 1] 4251 	cp a,#TK_INTGR
      00969E 16 20            [ 1] 4252 	jreq store_loop_addr  
      0096A0 EE 07 1D         [ 2] 4253 	jp syntax_error
                                   4254 ; leave loop back entry point on cstack 
                                   4255 ; cstack is 2 call deep from interp_loop
      0096A1                       4256 store_loop_addr:
      0096A1 CD 88 7D         [ 4] 4257 	call dpush 
      0096A4 A1 00 27         [ 2] 4258 	ldw x,basicptr  
      0096A7 4A A1            [ 2] 4259 	ldw (BPTR,sp),x 
      0096A9 0A 26 0E         [ 2] 4260 	ldw x,in.w 
      0096AC CD 82            [ 2] 4261 	ldw (INW,sp),x   
      0096AE 45 5C 72 B0      [ 1] 4262 	bres flags,#FFOR 
      0096B2 00 05 9F C7      [ 1] 4263 	inc loop_depth  
      0096B6 00               [ 4] 4264 	ret 
                                   4265 
                                   4266 ;--------------------------------
                                   4267 ; BASIC: NEXT var 
                                   4268 ; FOR loop control 
                                   4269 ; increment variable with step 
                                   4270 ; and compare with limit 
                                   4271 ; loop if threshold not crossed.
                                   4272 ; else clean both stacks. 
                                   4273 ; and decrement 'loop_depth' 
                                   4274 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      001867                       4275 next: ; {var limit step -- [var limit step ] }
      0096B7 02 20 D5 A1      [ 1] 4276 	tnz loop_depth 
      0096BB 03 26            [ 1] 4277 	jrne 1$ 
      0096BD 06 9F CD         [ 2] 4278 	jp syntax_error 
      001870                       4279 1$: 
      0096C0 82 33            [ 1] 4280 	ld a,#TK_VAR 
      0096C2 20 CB AF         [ 4] 4281 	call expect
                                   4282 ; check for good variable after NEXT 	 
      0096C4 90 93            [ 1] 4283 	ldw y,x 
      0096C4 A1 08 26         [ 2] 4284 	ldw x,#4  
      0096C7 07 FD 9F CD      [ 4] 4285 	cpw y,([dstkptr],x) ; compare variables address 
      0096CB 82 33            [ 1] 4286 	jreq 2$  
      0096CD 20 C0 1D         [ 2] 4287 	jp syntax_error ; not the good one 
      0096CF                       4288 2$: ; increment variable 
      0096CF A1               [ 1] 4289 	ldw x,y
      0096D0 0D               [ 2] 4290 	ldw x,(x)  ; get var value 
      0096D1 26 05 03         [ 2] 4291 	ldw acc16,x 
      0096D4 01 CC 96 91      [ 5] 4292 	ldw x,[dstkptr] ; step
      0096D8 72 BB 00 08      [ 2] 4293 	addw x,acc16 ; var+step 
      0096D8 A1 0E            [ 2] 4294 	ldw (y),x ; save var new value 
                                   4295 ; compare with limit 
      0096DA 26 13            [ 1] 4296 	ldw y,x 
      0096DC CD 88 7D A1      [ 5] 4297 	ldw x,[dstkptr] ; step in x 
      0096E0 04               [ 2] 4298 	tnzw x  
      0096E1 27 03            [ 1] 4299 	jrpl 4$ ; positive step 
                                   4300 ;negative step 
      0096E3 CC 87 9D         [ 2] 4301 	ldw x,#2
      0096E6 72 D3 00 16      [ 4] 4302 	cpw y,([dstkptr],x)
      0096E6 9F A4            [ 1] 4303 	jrslt loop_done
      0096E8 0F C7            [ 2] 4304 	jra loop_back 
      0018A6                       4305 4$: ; positive step
      0096EA 00 21 CC         [ 2] 4306 	ldw x,#2 
      0096ED 96 8F 00 16      [ 4] 4307 	cpw y,([dstkptr],x)
      0096EF 2C 15            [ 1] 4308 	jrsgt loop_done
      0018AF                       4309 loop_back:
      0096EF CD 90            [ 2] 4310 	ldw x,(BPTR,sp)
      0096F1 09 00 04         [ 2] 4311 	ldw basicptr,x 
      0096F2 72 01 00 1F 05   [ 2] 4312 	btjf flags,#FRUN,1$ 
      0096F2 0D 01            [ 1] 4313 	ld a,(2,x)
      0096F4 26 05 A6         [ 1] 4314 	ld count,a
      0096F7 0D CD            [ 2] 4315 1$:	ldw x,(INW,sp)
      0096F9 82 33 5B         [ 2] 4316 	ldw in.w,x 
      0096FC 01               [ 4] 4317 	ret 
      0018C4                       4318 loop_done:
                                   4319 	; remove var limit step on dstack 
      0096FD 81 00 16         [ 2] 4320 	ldw x,dstkptr 
      0096FE 1C 00 06         [ 2] 4321 	addw x,#3*CELL_SIZE
      0096FE CE 00 05         [ 2] 4322 	ldw dstkptr,x 
                                   4323 	; remove 2 return address on cstack 
      009701 1F               [ 2] 4324 	popw x
      0018CE                       4325 	_drop 4
      009702 03 C6            [ 2]    1     addw sp,#4 
      009704 00               [ 2] 4326 	pushw x 
      009705 02 6B 07 C6      [ 1] 4327 	dec loop_depth 
      009709 00               [ 4] 4328 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4329 
                                   4330 
                                   4331 ;------------------------
                                   4332 ; BASIC: GOTO line# 
                                   4333 ; jump to line# 
                                   4334 ; here cstack is 2 call deep from interp_loop 
                                   4335 ;------------------------
      0018D6                       4336 goto:
      00970A 04 6B 08 81 06   [ 2] 4337 	btjt flags,#FRUN,0$ 
      00970E A6 06            [ 1] 4338 	ld a,#ERR_RUN_ONLY
      00970E 1E 03 CF         [ 2] 4339 	jp tb_error 
      009711 00               [ 4] 4340 	ret 
      009712 05 7B            [ 2] 4341 0$:	jra go_common
                                   4342 
                                   4343 ;--------------------
                                   4344 ; BASIC: GOSUB line#
                                   4345 ; basic subroutine call
                                   4346 ; actual line# and basicptr 
                                   4347 ; are saved on cstack
                                   4348 ; here cstack is 2 call deep from interp_loop 
                                   4349 ;--------------------
                           000003  4350 	GOS_RET=3
      0018E3                       4351 gosub:
      009714 07 C7 00 02 7B   [ 2] 4352 	btjt flags,#FRUN,0$ 
      009719 08 C7            [ 1] 4353 	ld a,#ERR_RUN_ONLY
      00971B 00 04 81         [ 2] 4354 	jp tb_error 
      00971E 81               [ 4] 4355 	ret 
      00971E 72               [ 2] 4356 0$:	popw x 
      00971F 00 00            [ 2] 4357 	sub sp,#2 
      009721 20               [ 2] 4358 	pushw x 
      009722 05 A6 06         [ 2] 4359 	ldw x,basicptr
      009725 CC 87            [ 1] 4360 	ld a,(2,x)
      009727 9F 52            [ 1] 4361 	add a,#3 
      009729 07 00 09         [ 1] 4362 	ld acc8,a 
      00972A 72 5F 00 08      [ 1] 4363 	clr acc16 
      00972A 0F 06 CD 88      [ 2] 4364 	addw x,acc16
      00972E 7D A1            [ 2] 4365 	ldw (GOS_RET,sp),x 
      001906                       4366 go_common: 
      009730 00 27 5C         [ 4] 4367 	call relation 
      009733 A1 0A            [ 1] 4368 	cp a,#TK_INTGR
      009735 26 08            [ 1] 4369 	jreq 1$ 
      009737 CD 82 45         [ 2] 4370 	jp syntax_error
      001910                       4371 1$: 
      00973A 03 06 CD         [ 4] 4372 	call search_lineno  
      00973D 88               [ 2] 4373 	tnzw x 
      00973E 7D A1            [ 1] 4374 	jrne 2$ 
      009740 05 27            [ 1] 4375 	ld a,#ERR_NO_LINE 
      009742 03 CC 87         [ 2] 4376 	jp tb_error 
      00191B                       4377 2$: 
      009745 9D CD 90         [ 2] 4378 	ldw basicptr,x 
      009748 0F 0D            [ 1] 4379 	ld a,(2,x)
      00974A 06 26 0F         [ 1] 4380 	ld count,a 
      00974D A6 3A C7 17      [ 1] 4381 	mov in,#3 
      009751 19               [ 4] 4382 	ret 
                                   4383 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4384 ;------------------------
                                   4385 ; BASIC: RETURN 
                                   4386 ; exit from a subroutine 
                                   4387 ; cstack is 2 level deep from interp_loop 
                                   4388 ;------------------------
      001928                       4389 return:
      009752 72 5F 17 1A AE   [ 2] 4390 	btjt flags,#FRUN,0$ 
      009757 17 18            [ 1] 4391 	ld a,#ERR_RUN_ONLY
      009759 CD 82 45         [ 2] 4392 	jp tb_error 
      00975C                       4393 0$:	
      00975C CD 96            [ 2] 4394 	ldw x,(GOS_RET,sp) 
      00975E FE AE 16         [ 2] 4395 	ldw basicptr,x 
      009761 C8 CF            [ 1] 4396 	ld a,(2,x)
      009763 00 05            [ 1] 4397 	add a,#3 
      009765 72 5F 00         [ 1] 4398 	ld count,a 
      009768 04 CD 8B 04      [ 1] 4399 	mov in,#3
      00976C 72               [ 1] 4400 	clr a 
      00976D 5F               [ 2] 4401 	popw x 
      001944                       4402 	_drop 2
      00976E 00 02            [ 2]    1     addw sp,#2 
      009770 CD               [ 2] 4403 	pushw x
      009771 93               [ 4] 4404 	ret  
                                   4405 
                                   4406 
                                   4407 ;----------------------------------
                                   4408 ; BASIC: RUN
                                   4409 ; run BASIC program in RAM
                                   4410 ;----------------------------------- 
      001948                       4411 run: 
      009772 84 A1 04 27 03   [ 2] 4412 	btjf flags,#FRUN,0$  
      009777 CC               [ 1] 4413 	clr a 
      009778 87               [ 4] 4414 	ret
      00194F                       4415 0$: 
      009779 9D CD 90 0F CD   [ 2] 4416 	btjf flags,#FBREAK,1$
      001954                       4417 	_drop 2 
      00977E 90 76            [ 2]    1     addw sp,#2 
      009780 CD 97 0E         [ 4] 4418 	call rest_context
      001959                       4419 	_drop CTXT_SIZE 
      009783 CD 88            [ 2]    1     addw sp,#CTXT_SIZE 
      009785 7D A1 0D 26      [ 1] 4420 	bres flags,#FBREAK 
      009789 02 20 9E CD      [ 1] 4421 	bset flags,#FRUN 
      00978D 90 09 CD         [ 2] 4422 	jp interp_loop 
      00978F CE 00 18         [ 2] 4423 1$:	ldw x,txtbgn
      00978F 5B 07 81         [ 2] 4424 	cpw x,txtend 
      009792 2B 02            [ 1] 4425 	jrmi 2$ 
      009792 55               [ 1] 4426 	clr a 
      009793 00               [ 4] 4427 	ret 
      009794 02 00 04         [ 4] 4428 2$: call ubound 
      001973                       4429 	_drop 2 
      009797 81 02            [ 2]    1     addw sp,#2 
      009798 CE 00 18         [ 2] 4430 	ldw x,txtbgn 
      009798 52 04 0F         [ 2] 4431 	ldw basicptr,x 
      00979B 01 CD            [ 1] 4432 	ld a,(2,x)
      00979D 92 3C A1         [ 1] 4433 	ld count,a
      0097A0 02 24 03 CC      [ 1] 4434 	mov in,#3	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0097A4 87 9D A1 03      [ 1] 4435 	bset flags,#FRUN 
      0097A8 25 06 CD         [ 2] 4436 	jp interp_loop 
                                   4437 
                                   4438 
                                   4439 ;----------------------
                                   4440 ; BASIC: STOP 
                                   4441 ; stop running program
                                   4442 ;---------------------- 
      00198B                       4443 stop: 
                                   4444 ; clean dstack and cstack 
      0097AB 90 1C 9F         [ 2] 4445 	ldw x,#STACK_EMPTY 
      0097AE 6B               [ 1] 4446 	ldw sp,x 
      0097AF 01 CD 90 1C      [ 1] 4447 	bres flags,#FRUN 
      0097B3 9F 6B 02 CD      [ 1] 4448 	bres flags,#FBREAK
      0097B7 90 1C F6         [ 2] 4449 	jp warm_start
                                   4450 
                                   4451 ;-----------------------
                                   4452 ; BASIC BEEP expr1,expr2
                                   4453 ; used MCU internal beeper 
                                   4454 ; to produce a sound
                                   4455 ; arguments:
                                   4456 ;    expr1   frequency  (expr1%32)
                                   4457 ;    expr2   duration msec.
                                   4458 ;---------------------------
      00199A                       4459 beep:
      0097BA 14 02 18         [ 4] 4460 	call arg_list 
      0097BD 01 27            [ 1] 4461 	cp a,#2 
      0097BF F9 5B            [ 1] 4462 	jreq 1$
      0097C1 04 81 1D         [ 2] 4463 	jp syntax_error 
      0097C3                       4464 1$: 
      0097C3 CD 92 3C         [ 2] 4465 	ldw x,dstkptr 
      0097C6 A1 02            [ 2] 4466 	ldw x,(2,x);frequency 
      0097C8 27 03            [ 1] 4467 	ld a,#31
      0097CA CC               [ 2] 4468 	div x,a 
      0097CB 87 9D F3         [ 1] 4469 	ld BEEP_CSR,a	
      0097CD 72 1A 50 F3      [ 1] 4470 	bset BEEP_CSR,#5 
      0097CD CD 90 1C         [ 4] 4471 	call dpop 
      0097D0 9F CD 90         [ 4] 4472 	call pause02 
      0097D3 1C FA F7         [ 4] 4473 	call ddrop 
      0097D6 81 1F            [ 1] 4474 	ld a,#0x1f
      0097D7 C7 50 F3         [ 1] 4475 	ld BEEP_CSR,a 
      0097D7 CD               [ 4] 4476 	ret 
                                   4477 
                                   4478 ;-------------------------------
                                   4479 ; BASIC: PWRADC 0|1 [,divisor]  
                                   4480 ; disable/enanble ADC 
                                   4481 ;-------------------------------
      0019C2                       4482 power_adc:
      0097D8 92 3C A1         [ 4] 4483 	call arg_list 
      0097DB 02 27            [ 1] 4484 	cp a,#2	
      0097DD 03 CC            [ 1] 4485 	jreq 1$
      0097DF 87 9D            [ 1] 4486 	cp a,#1 
      0097E1 27 03            [ 1] 4487 	jreq 0$ 
      0097E1 CD 90 1C         [ 2] 4488 	jp syntax_error 
      0097E4 9F 43 CD         [ 2] 4489 0$: ldw x,#0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0097E7 90 1C F4         [ 4] 4490 	call dpush 
      0097EA F7 81 02         [ 2] 4491 1$: ldw x,#2
      0097EC 72 DE 00 16      [ 5] 4492 	ldw x,([dstkptr],x) ; on|off
      0097EC CD               [ 2] 4493 	tnzw x 
      0097ED 92 3C            [ 1] 4494 	jreq 2$ 
      0097EF A1 02 27 03      [ 5] 4495 	ldw x,[dstkptr] ; divisor 
      0097F3 CC               [ 1] 4496 	ld a,xl
      0097F4 87 9D            [ 1] 4497 	and a,#7
      0097F6 CD               [ 1] 4498 	swap a 
      0097F7 90 1C 9F         [ 1] 4499 	ld ADC_CR1,a
      0097FA CD 90 1C F8      [ 1] 4500 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      0097FE F7 81 54 01      [ 1] 4501 	bset ADC_CR1,#ADC_CR1_ADON 
      009800                       4502 	_usec_dly 7 
      009800 CD 92 60         [ 2]    1     ldw x,#(16*7-2)/4
      009803 A1               [ 2]    2     decw x
      009804 02               [ 1]    3     nop 
      009805 27 03            [ 1]    4     jrne .-4
      009807 CC 87            [ 2] 4503 	jra 3$
      009809 9D 11 54 01      [ 1] 4504 2$: bres ADC_CR1,#ADC_CR1_ADON
      00980A 72 17 50 CA      [ 1] 4505 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00980A CD 90 1C         [ 2] 4506 3$:	ldw x,#2
      00980D 9F A4 07         [ 4] 4507 	call ddrop_n 
      009810 88               [ 4] 4508 	ret
                                   4509 
                                   4510 ;-----------------------------
                                   4511 ; BASIC: RDADC(channel)
                                   4512 ; read adc channel {0..5}
                                   4513 ; output:
                                   4514 ;   A 		TK_INTGR 
                                   4515 ;   X 		value 
                                   4516 ;-----------------------------
      001A0B                       4517 analog_read:
      009811 A6 01 0D         [ 4] 4518 	call func_args 
      009814 01 27            [ 1] 4519 	cp a,#1 
      009816 05 48            [ 1] 4520 	jreq 1$
      009818 0A 01 20         [ 2] 4521 	jp syntax_error
      00981B F7 CD 90         [ 4] 4522 1$: call dpop 
      00981E 1C F4 27         [ 2] 4523 	cpw x,#5 
      009821 02 A6            [ 2] 4524 	jrule 2$
      009823 01 5F            [ 1] 4525 	ld a,#ERR_BAD_VALUE
      009825 97 A6 04         [ 2] 4526 	jp tb_error 
      009828 5B               [ 1] 4527 2$: ld a,xl
      009829 01 81 09         [ 1] 4528 	ld acc8,a 
      00982B A6 05            [ 1] 4529 	ld a,#5
      00982B CD 92 3C         [ 1] 4530 	sub a,acc8 
      00982E A1 02 27         [ 1] 4531 	ld ADC_CSR,a
      009831 03 CC 87 9D      [ 1] 4532 	bset ADC_CR2,#ADC_CR2_ALIGN
      009835 72 10 54 01      [ 1] 4533 	bset ADC_CR1,#ADC_CR1_ADON
      009835 CD 90 1C 9F CD   [ 2] 4534 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00983A 90 1C F7         [ 2] 4535 	ldw x,ADC_DRH
      00983D 81 04            [ 1] 4536 	ld a,#TK_INTGR
      00983E 81               [ 4] 4537 	ret 
                                   4538 
                                   4539 ;-----------------------
                                   4540 ; BASIC: DREAD(pin)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4541 ; read state of a digital pin 
                                   4542 ; pin# {0..15}
                                   4543 ; output:
                                   4544 ;    A 		TK_INTGR
                                   4545 ;    X      0|1 
                                   4546 ;-------------------------
                           000001  4547 	PINNO=1
                           000001  4548 	VSIZE=1
      001A41                       4549 digital_read:
      001A41                       4550 	_vars VSIZE 
      00983E CD 92            [ 2]    1     sub sp,#VSIZE 
      009840 60 A1 01         [ 4] 4551 	call func_args
      009843 27 03            [ 1] 4552 	cp a,#1
      009845 CC 87            [ 1] 4553 	jreq 1$
      009847 9D CD 90         [ 2] 4554 	jp syntax_error
      00984A 1C F6 5F         [ 4] 4555 1$: call dpop 
      00984D 97 A6 04         [ 2] 4556 	cpw x,#15 
      009850 81 05            [ 2] 4557 	jrule 2$
      009851 A6 0A            [ 1] 4558 	ld a,#ERR_BAD_VALUE
      009851 CD 93 84         [ 2] 4559 	jp tb_error 
      009854 A1 04 27         [ 4] 4560 2$:	call select_pin 
      009857 03 CC            [ 1] 4561 	ld (PINNO,sp),a
      009859 87 9D            [ 1] 4562 	ld a,(GPIO_IDR,x)
      00985B 4F 5D            [ 1] 4563 	tnz (PINNO,sp)
      00985D 26 05            [ 1] 4564 	jreq 8$
      00985F 55               [ 1] 4565 3$: srl a 
      009860 00 04            [ 1] 4566 	dec (PINNO,sp)
      009862 00 02            [ 1] 4567 	jrne 3$ 
      009864 81 01            [ 1] 4568 8$: and a,#1 
      009865 5F               [ 1] 4569 	clrw x 
      009865 A6               [ 1] 4570 	ld xl,a 
      009866 05 CD            [ 1] 4571 	ld a,#TK_INTGR
      001A70                       4572 	_drop VSIZE
      009868 92 2F            [ 2]    1     addw sp,#VSIZE 
      00986A CD               [ 4] 4573 	ret
                                   4574 
                                   4575 ;-----------------------
                                   4576 ; BASIC: DWRITE pin,0|1
                                   4577 ; write to a digital pin 
                                   4578 ; pin# {0..15}
                                   4579 ; output:
                                   4580 ;    A 		TK_INTGR
                                   4581 ;    X      0|1 
                                   4582 ;-------------------------
                           000001  4583 	PINNO=1
                           000002  4584 	PINVAL=2
                           000002  4585 	VSIZE=2
      001A73                       4586 digital_write:
      001A73                       4587 	_vars VSIZE 
      00986B 90 0F            [ 2]    1     sub sp,#VSIZE 
      00986D CD 94 2B         [ 4] 4588 	call arg_list  
      009870 72 14            [ 1] 4589 	cp a,#2 
      009872 00 20            [ 1] 4590 	jreq 1$
      009874 85 52 04         [ 2] 4591 	jp syntax_error
      009877 89 5F 1F         [ 4] 4592 1$: call dpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      00987A 05               [ 1] 4593 	ld a,xl 
      00987B 1F 03            [ 1] 4594 	ld (PINVAL,sp),a
      00987D CD 88 7D         [ 4] 4595 	call dpop
      009880 A1 06 27         [ 2] 4596 	cpw x,#15 
      009883 03 CC            [ 2] 4597 	jrule 2$
      009885 87 9D            [ 1] 4598 	ld a,#ERR_BAD_VALUE
      009887 CC 07 1F         [ 2] 4599 	jp tb_error 
      009887 A3 98 8F         [ 4] 4600 2$:	call select_pin 
      00988A 27 03            [ 1] 4601 	ld (PINNO,sp),a 
      00988C CC 87            [ 1] 4602 	ld a,#1
      00988E 9D 01            [ 1] 4603 	tnz (PINNO,sp)
      00988F 27 05            [ 1] 4604 	jreq 4$
      00988F 72               [ 1] 4605 3$: sll a
      009890 04 00            [ 1] 4606 	dec (PINNO,sp)
      009892 20 03            [ 1] 4607 	jrne 3$
      009894 CC 87            [ 1] 4608 4$: tnz (PINVAL,sp)
      009896 9D CD            [ 1] 4609 	jrne 5$
      009898 93               [ 1] 4610 	cpl a 
      009899 84 A1            [ 1] 4611 	and a,(GPIO_ODR,x)
      00989B 04 27            [ 2] 4612 	jra 8$
      00989D 03 CC            [ 1] 4613 5$: or a,(GPIO_ODR,x)
      00989F 87 9D            [ 1] 4614 8$: ld (GPIO_ODR,x),a 
      0098A1                       4615 	_drop VSIZE 
      0098A1 CD 90            [ 2]    1     addw sp,#VSIZE 
      0098A3 0F               [ 4] 4616 	ret
                                   4617 
                                   4618 
                                   4619 ;-----------------------
                                   4620 ; BASIC: BREAK 
                                   4621 ; insert a breakpoint 
                                   4622 ; in pogram. 
                                   4623 ; the program is resumed
                                   4624 ; with RUN 
                                   4625 ;-------------------------
      001AB2                       4626 break:
      0098A4 CE 00 01 CD 88   [ 2] 4627 	btjt flags,#FRUN,2$
      0098A9 7D               [ 1] 4628 	clr a
      0098AA A1               [ 4] 4629 	ret 
      001AB9                       4630 2$:	 
                                   4631 ; create space on cstack to save context 
      0098AB 00 27 0C         [ 2] 4632 	ldw x,#break_point 
      0098AE A1 06 26         [ 4] 4633 	call puts 
      001ABF                       4634 	_drop 2 ;drop return address 
      0098B1 05 A3            [ 2]    1     addw sp,#2 
      001AC1                       4635 	_vars CTXT_SIZE ; context size 
      0098B3 98 BF            [ 2]    1     sub sp,#CTXT_SIZE 
      0098B5 27 08 7E         [ 4] 4636 	call save_context 
      0098B7 AE 16 C8         [ 2] 4637 	ldw x,#tib 
      0098B7 CD 90 09         [ 2] 4638 	ldw basicptr,x
      0098BA 7F               [ 1] 4639 	clr (x)
      0098BA AE 00 01 20      [ 1] 4640 	clr count  
      0098BE 12               [ 1] 4641 	clrw x 
      0098BF CF 00 00         [ 2] 4642 	ldw in.w,x
      0098BF 72 04 00 20      [ 1] 4643 	bres flags,#FRUN 
      0098C3 03 CC 87 9D      [ 1] 4644 	bset flags,#FBREAK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0098C7 CD 93 84         [ 2] 4645 	jp interp_loop 
      0098CA A1 04 27 03 CC 87 9D  4646 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4647 
                                   4648 ;-----------------------
                                   4649 ; BASIC: NEW
                                   4650 ; from command line only 
                                   4651 ; free program memory
                                   4652 ; and clear variables 
                                   4653 ;------------------------
      0098D1                       4654 new: 
      0098D1 CD 90 0F CE 00   [ 2] 4655 	btjf flags,#FRUN,0$ 
      0098D6 05               [ 1] 4656 	clr a 
      0098D7 1F               [ 4] 4657 	ret 
      001B05                       4658 0$:	
      0098D8 05 CE 00         [ 4] 4659 	call clear_basic 
      0098DB 01               [ 4] 4660 	ret 
                                   4661 	 
                                   4662 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4663 ;   file system routines
                                   4664 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4665 
                                   4666 ;--------------------
                                   4667 ; input:
                                   4668 ;   X     increment 
                                   4669 ; output:
                                   4670 ;   farptr  incremented 
                                   4671 ;---------------------
      001B09                       4672 incr_farptr:
      0098DC 1F 03 72 15      [ 2] 4673 	addw x,farptr+1 
      0098E0 00 20            [ 1] 4674 	jrnc 1$
      0098E2 72 5C 00 1D      [ 1] 4675 	inc farptr 
      0098E6 81 00 11         [ 2] 4676 1$:	ldw farptr+1,x  
      0098E7 81               [ 4] 4677 	ret 
                                   4678 
                                   4679 ;------------------------------
                                   4680 ; extended flash memory used as FLASH_DRIVE 
                                   4681 ; seek end of used flash drive   
                                   4682 ; starting at 0x10000 address.
                                   4683 ; 4 consecutives 0 bytes signal free space. 
                                   4684 ; input:
                                   4685 ;	none
                                   4686 ; output:
                                   4687 ;   ffree     free_addr| 0 if memory full.
                                   4688 ;------------------------------
      001B17                       4689 seek_fdrive:
                                   4690 ; start scan at 0x10000 address 
      0098E7 72 5D            [ 1] 4691 	ld a,#1
      0098E9 00 1D 26         [ 1] 4692 	ld farptr,a 
      0098EC 03               [ 1] 4693 	clrw x 
      0098ED CC 87 9D         [ 2] 4694 	ldw farptr+1,x 
      0098F0                       4695 1$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0098F0 A6 05 CD         [ 2] 4696 	ldw x,#3  
      0098F3 92 2F 90 93      [ 5] 4697 2$:	ldf a,([farptr],x) 
      0098F7 AE 00            [ 1] 4698 	jrne 3$
      0098F9 04               [ 2] 4699 	decw x
      0098FA 72 D3            [ 1] 4700 	jrpl 2$
      0098FC 00 17            [ 2] 4701 	jra 4$ 
      0098FE 27               [ 2] 4702 3$:	incw x 
      0098FF 03 CC 87         [ 4] 4703 	call incr_farptr
      009902 9D 02 7F         [ 2] 4704 	ldw x,#0x27f 
      009903 C3 00 10         [ 2] 4705 	cpw x,farptr
      009903 93 FE            [ 1] 4706 	jrpl 1$
                                   4707 ; drive full 
      009905 CF 00 09 72      [ 1] 4708 	clr ffree 
      009909 CE 00 17 72      [ 1] 4709 	clr ffree+1 
      00990D BB 00 09 90      [ 1] 4710 	clr ffree+2 
      009911 FF               [ 4] 4711 	ret
      001B47                       4712 4$: ; copy farptr to ffree	 
      009912 90 93 72         [ 2] 4713 	ldw x,farptr 
      009915 CE 00 17         [ 1] 4714 	ld a,farptr+2 
      009918 5D 2A 0B         [ 2] 4715 	ldw ffree,x 
      00991B AE 00 02         [ 1] 4716 	ld ffree+2,a  
      00991E 72               [ 4] 4717 	ret 
                                   4718 
                                   4719 ;-----------------------
                                   4720 ; compare file name 
                                   4721 ; with name pointed by Y  
                                   4722 ; input:
                                   4723 ;   farptr   file name 
                                   4724 ;   Y        target name 
                                   4725 ; output:
                                   4726 ;   farptr 	 at file_name
                                   4727 ;   X 		 farptr[x] point at size field  
                                   4728 ;   Carry    0|1 no match|match  
                                   4729 ;----------------------
      001B54                       4730 cmp_name:
      00991F D3               [ 1] 4731 	clrw x
      009920 00 17 2F 20      [ 5] 4732 1$:	ldf a,([farptr],x)
      009924 20 09            [ 1] 4733 	cp a,(y)
      009926 26 08            [ 1] 4734 	jrne 4$
      009926 AE               [ 1] 4735 	tnz a 
      009927 00 02            [ 1] 4736 	jreq 9$ 
      009929 72               [ 2] 4737     incw x 
      00992A D3 00            [ 2] 4738 	incw y 
      00992C 17 2C            [ 2] 4739 	jra 1$
      001B65                       4740 4$: ;no match 
      00992E 15               [ 1] 4741 	tnz a 
      00992F 27 07            [ 1] 4742 	jreq 5$
      00992F 1E               [ 2] 4743 	incw x 
      009930 05 CF 00 05      [ 5] 4744 	ldf a,([farptr],x)
      009934 72 01            [ 2] 4745 	jra 4$  
      009936 00               [ 2] 4746 5$:	incw x ; farptr[x] point at 'size' field 
      009937 20               [ 1] 4747 	rcf 
      009938 05               [ 4] 4748 	ret
      001B72                       4749 9$: ; match  
      009939 E6               [ 2] 4750 	incw x  ; farptr[x] at 'size' field 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      00993A 02               [ 1] 4751 	scf 
      00993B C7               [ 4] 4752 	ret 
                                   4753 
                                   4754 ;-----------------------
                                   4755 ; search file in 
                                   4756 ; flash memory 
                                   4757 ; input:
                                   4758 ;   Y       file name  
                                   4759 ; output:
                                   4760 ;   farptr  addr at name|0
                                   4761 ;-----------------------
                           000001  4762 	FSIZE=1
                           000003  4763 	YSAVE=3
                           000004  4764 	VSIZE=4 
      001B75                       4765 search_file: 
      001B75                       4766 	_vars VSIZE
      00993C 00 04            [ 2]    1     sub sp,#VSIZE 
      00993E 1E 03            [ 2] 4767 	ldw (YSAVE,sp),y  
      009940 CF               [ 1] 4768 	clrw x 
      009941 00 01 81         [ 2] 4769 	ldw farptr+1,x 
      009944 35 01 00 10      [ 1] 4770 	mov farptr,#1
      001B81                       4771 1$:	
                                   4772 ; check if farptr is after any file 
                                   4773 ; if  0 then so.
      009944 CE 00 17 1C      [ 5] 4774 	ldf a,[farptr]
      009948 00 06            [ 1] 4775 	jreq 6$
      00994A CF               [ 1] 4776 2$: clrw x 	
      00994B 00 17            [ 2] 4777 	ldw y,(YSAVE,sp) 
      00994D 85 5B 04         [ 4] 4778 	call cmp_name
      009950 89 72            [ 1] 4779 	jrc 9$
      009952 5A 00 1D 81      [ 5] 4780 	ldf a,([farptr],x)
      009956 6B 01            [ 1] 4781 	ld (FSIZE,sp),a 
      009956 72               [ 2] 4782 	incw x 
      009957 00 00 20 06      [ 5] 4783 	ldf a,([farptr],x)
      00995B A6 06            [ 1] 4784 	ld (FSIZE+1,sp),a 
      00995D CC               [ 2] 4785 	incw x 
      00995E 87 9F 81         [ 2] 4786 	addw x,(FSIZE,sp) ; count to skip 
      009961 20               [ 2] 4787 	incw x ; skip over EOF marker 
      009962 23 1B 09         [ 4] 4788 	call incr_farptr ; now at next file 'name_field'
      009963 AE 02 80         [ 2] 4789 	ldw x,#0x280
      009963 72 00 00         [ 2] 4790 	cpw x,farptr 
      009966 20 06            [ 1] 4791 	jrpl 1$
      001BAC                       4792 6$: ; file not found 
      009968 A6 06 CC 87      [ 1] 4793 	clr farptr
      00996C 9F 81 85 52      [ 1] 4794 	clr farptr+1 
      009970 02 89 CE 00      [ 1] 4795 	clr farptr+2 
      001BB8                       4796 	_drop VSIZE 
      009974 05 E6            [ 2]    1     addw sp,#VSIZE 
      009976 02               [ 1] 4797 	rcf
      009977 AB               [ 4] 4798 	ret
      001BBC                       4799 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001BBC                       4800 	_drop VSIZE 
      009978 03 C7            [ 2]    1     addw sp,#VSIZE 
      00997A 00               [ 1] 4801 	scf 	
      00997B 0A               [ 4] 4802 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4803 
                                   4804 ;--------------------------------
                                   4805 ; BASIC: SAVE "name" 
                                   4806 ; save text program in 
                                   4807 ; flash memory used as 
                                   4808 ;--------------------------------
                           000001  4809 	BSIZE=1
                           000003  4810 	NAMEPTR=3
                           000004  4811 	VSIZE=4
      001BC0                       4812 save:
      00997C 72 5F 00 09 72   [ 2] 4813 	btjf flags,#FRUN,0$ 
      009981 BB 00            [ 1] 4814 	ld a,#ERR_CMD_ONLY 
      009983 09 1F 03         [ 2] 4815 	jp tb_error
      009986                       4816 0$:	 
      009986 CD 93 84         [ 2] 4817 	ldw x,txtend 
      009989 A1 04 27 03      [ 2] 4818 	subw x,txtbgn
      00998D CC 87            [ 1] 4819 	jrne 1$
                                   4820 ; nothing to save 
      00998F 9D               [ 4] 4821 	ret 
      009990                       4822 1$:	
      001BD4                       4823 	_vars VSIZE 
      009990 CD 83            [ 2]    1     sub sp,#VSIZE 
      009992 75 5D            [ 2] 4824 	ldw (BSIZE,sp),x 
      009994 26 05 A6         [ 4] 4825 	call next_token	
      009997 05 CC            [ 1] 4826 	cp a,#TK_QSTR
      009999 87 9F            [ 1] 4827 	jreq 2$
      00999B CC 07 1D         [ 2] 4828 	jp syntax_error
      001BE2                       4829 2$: 
      00999B CF 00 05 E6      [ 2] 4830 	ldw y,basicptr 
      00999F 02 C7 00 04      [ 2] 4831 	addw y,in.w
      0099A3 35 03            [ 2] 4832 	ldw (NAMEPTR,sp),y  
      0099A5 00 02 81 00 01   [ 1] 4833 	mov in,count 
                                   4834 ; check if enough free space 
      0099A8 93               [ 1] 4835 	ldw x,y 
      0099A8 72 00 00         [ 4] 4836 	call strlen 
      0099AB 20 05 A6         [ 2] 4837 	addw x,#3 
      0099AE 06 CC 87         [ 2] 4838 	addw x,(BSIZE,sp)
      0099B1 9F 5D 00 13      [ 1] 4839 	tnz ffree 
      0099B2 26 0B            [ 1] 4840 	jrne 21$
      0099B2 1E 03 CF 00      [ 2] 4841 	subw x,ffree+1 
      0099B6 05 E6            [ 2] 4842 	jrule 21$
      0099B8 02 AB            [ 1] 4843 	ld a,#ERR_MEM_FULL 
      0099BA 03 C7 00         [ 2] 4844 	jp tb_error
      001C0C                       4845 21$: 
                                   4846 ; check for existing file of that name 
      0099BD 04 35            [ 2] 4847 	ldw y,(NAMEPTR,sp)	
      0099BF 03 00 02         [ 4] 4848 	call search_file 
      0099C2 4F 85            [ 1] 4849 	jrnc 3$ 
      0099C4 5B 02            [ 1] 4850 	ld a,#ERR_DUPLICATE 
      0099C6 89 81 1F         [ 2] 4851 	jp tb_error 
      0099C8                       4852 3$:	;** write file name to flash **
      0099C8 72 01 00         [ 2] 4853 	ldw x,ffree 
      0099CB 20 02 4F         [ 1] 4854 	ld a,ffree+2 
      0099CE 81 00 10         [ 2] 4855 	ldw farptr,x 
      0099CF C7 00 12         [ 1] 4856 	ld farptr+2,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      0099CF 72 09            [ 2] 4857 	ldw x,(NAMEPTR,sp)  
      0099D1 00 20 12         [ 4] 4858 	call strlen 
      0099D4 5B               [ 2] 4859 	incw  x
      0099D5 02 CD            [ 2] 4860 	ldw (BSIZE,sp),x  
      0099D7 97               [ 1] 4861 	clrw x   
      0099D8 0E 5B            [ 2] 4862 	ldw y,(NAMEPTR,sp)
      0099DA 06 72 19         [ 4] 4863 	call write_block  
                                   4864 ;** write file length after name **
      0099DD 00 20 72         [ 2] 4865 	ldw x,txtend 
      0099E0 10 00 20 CC      [ 2] 4866 	subw x,txtbgn
      0099E4 88 4D            [ 2] 4867 	ldw (BSIZE,sp),x 
      0099E6 CE               [ 1] 4868 	clrw x 
      0099E7 00 19            [ 1] 4869 	ld a,(1,sp)
      0099E9 C3 00 1B         [ 4] 4870 	call write_byte 
      0099EC 2B               [ 2] 4871 	incw x 
      0099ED 02 4F            [ 1] 4872 	ld a,(2,sp)
      0099EF 81 CD 93         [ 4] 4873 	call write_byte
      0099F2 FF               [ 2] 4874 	incw x  
      0099F3 5B 02 CE         [ 4] 4875 	call incr_farptr ; move farptr after SIZE field 
                                   4876 ;** write BASIC text **
                                   4877 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      0099F6 00 19            [ 2] 4878 	ldw x,(BSIZE,sp)
      0099F8 CF               [ 2] 4879 	pushw x ; write_block argument 
      0099F9 00               [ 1] 4880 	clrw x 
      0099FA 05 E6 02 C7      [ 2] 4881 	ldw y,txtbgn  ; BASIC text to save 
      0099FE 00 04 35         [ 4] 4882 	call write_block 
      001C56                       4883 	_drop 2 ;  drop write_block argument  
      009A01 03 00            [ 2]    1     addw sp,#2 
                                   4884 ; write en end of file marker 
      009A03 02 72 10         [ 2] 4885 	ldw x,#1
      009A06 00 20            [ 1] 4886 	ld a,#EOF  
      009A08 CC 88 4D         [ 4] 4887 	call write_byte 
      009A0B CD 1B 09         [ 4] 4888 	call incr_farptr
                                   4889 ; save farptr in ffree
      009A0B AE 17 FF         [ 2] 4890 	ldw x,farptr 
      009A0E 94 72 11         [ 1] 4891 	ld a,farptr+2 
      009A11 00 20 72         [ 2] 4892 	ldw ffree,x 
      009A14 19 00 20         [ 1] 4893 	ld ffree+2,a
                                   4894 ;write 4 zero bytes as an end of all files marker 
      009A17 CC               [ 1] 4895     clrw x 
      009A18 87 F1            [ 1] 4896 	push #4 
      009A1A                       4897 4$:
      009A1A CD               [ 1] 4898 	clr a 
      009A1B 92 3C A1         [ 4] 4899 	call write_byte 
      009A1E 02               [ 2] 4900 	incw x 
      009A1F 27 03            [ 1] 4901 	dec (1,sp)
      009A21 CC 87            [ 1] 4902 	jrne 4$
      009A23 9D               [ 1] 4903 5$: pop a 
                                   4904 ; display saved size  
      009A24 1E 01            [ 2] 4905 	ldw x,(BSIZE,sp) 
      009A24 CE 00 17         [ 4] 4906 	call print_int 
      001C81                       4907 	_drop VSIZE 
      009A27 EE 02            [ 2]    1     addw sp,#VSIZE 
      009A29 A6               [ 4] 4908 	ret 
                                   4909 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4910 
                                   4911 ;------------------------
                                   4912 ; BASIC: LOAD "file" 
                                   4913 ; load file to RAM 
                                   4914 ; for execution 
                                   4915 ;------------------------
      001C84                       4916 load:
      009A2A 1F 62 C7 50 F3   [ 2] 4917 	btjf flags,#FRUN,0$ 
      009A2F 72 1A            [ 1] 4918 	jreq 0$ 
      009A31 50 F3            [ 1] 4919 	ld a,#ERR_CMD_ONLY 
      009A33 CD 90 1C         [ 2] 4920 	jp tb_error 
      001C90                       4921 0$:	
      009A36 CD 9F 3A         [ 4] 4922 	call next_token 
      009A39 CD 90            [ 1] 4923 	cp a,#TK_QSTR
      009A3B 43 A6            [ 1] 4924 	jreq 1$
      009A3D 1F C7 50         [ 2] 4925 	jp syntax_error 
      001C9A                       4926 1$:	
      009A40 F3 81 00 04      [ 2] 4927 	ldw y,basicptr
      009A42 72 B9 00 00      [ 2] 4928 	addw y,in.w 
      009A42 CD 92 3C A1 02   [ 1] 4929 	mov in,count 
      009A47 27 0D A1         [ 4] 4930 	call search_file 
      009A4A 01 27            [ 1] 4931 	jrc 2$ 
      009A4C 03 CC            [ 1] 4932 	ld a,#ERR_NOT_FILE
      009A4E 87 9D AE         [ 2] 4933 	jp tb_error  
      001CB1                       4934 2$:	
      009A51 00 00 CD         [ 4] 4935 	call incr_farptr  
      009A54 90 0F AE         [ 4] 4936 	call clear_basic  
      009A57 00               [ 1] 4937 	clrw x
      009A58 02 72 DE 00      [ 5] 4938 	ldf a,([farptr],x)
      009A5C 17 5D            [ 1] 4939 	ld yh,a 
      009A5E 27               [ 2] 4940 	incw x  
      009A5F 1C 72 CE 00      [ 5] 4941 	ldf a,([farptr],x)
      009A63 17               [ 2] 4942 	incw x 
      009A64 9F A4            [ 1] 4943 	ld yl,a 
      009A66 07 4E C7 54      [ 2] 4944 	addw y,txtbgn
      009A6A 01 72 16 50      [ 2] 4945 	ldw txtend,y
      009A6E CA 72 10 54      [ 2] 4946 	ldw y,txtbgn
      001CD2                       4947 3$:	; load BASIC text 	
      009A72 01 AE 00 1B      [ 5] 4948 	ldf a,([farptr],x)
      009A76 5A 9D            [ 1] 4949 	ld (y),a 
      009A78 26               [ 2] 4950 	incw x 
      009A79 FA 20            [ 2] 4951 	incw y 
      009A7B 08 72 11 54      [ 2] 4952 	cpw y,txtend 
      009A7F 01 72            [ 1] 4953 	jrmi 3$
                                   4954 ; print loaded size 	 
      009A81 17 50 CA         [ 2] 4955 	ldw x,txtend 
      009A84 AE 00 02 CD      [ 2] 4956 	subw x,txtbgn
      009A88 90 80 81         [ 4] 4957 	call print_int 
      009A8B 81               [ 4] 4958 	ret 
                                   4959 
                                   4960 ;-----------------------------------
                                   4961 ; BASIC: FORGET ["file_name"] 
                                   4962 ; erase file_name and all others 
                                   4963 ; after it. 
                                   4964 ; without argument erase all files 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   4965 ;-----------------------------------
      001CEC                       4966 forget:
      009A8B CD 92 60         [ 4] 4967 	call next_token 
      009A8E A1 01            [ 1] 4968 	cp a,#TK_NONE 
      009A90 27 03            [ 1] 4969 	jreq 3$ 
      009A92 CC 87            [ 1] 4970 	cp a,#TK_QSTR
      009A94 9D CD            [ 1] 4971 	jreq 1$
      009A96 90 1C A3         [ 2] 4972 	jp syntax_error
      009A99 00 05 23 05      [ 2] 4973 1$: ldw y,basicptr
      009A9D A6 0A CC 87      [ 2] 4974 	addw y,in.w
      009AA1 9F 9F C7 00 0A   [ 1] 4975 	mov in,count 
      009AA6 A6 05 C0         [ 4] 4976 	call search_file
      009AA9 00 0A            [ 1] 4977 	jrc 2$
      009AAB C7 54            [ 1] 4978 	ld a,#ERR_NOT_FILE 
      009AAD 00 72 16         [ 2] 4979 	jp tb_error 
      001D11                       4980 2$: 
      009AB0 54 02 72         [ 2] 4981 	ldw x,farptr
      009AB3 10 54 01         [ 1] 4982 	ld a,farptr+2
      009AB6 72 0F            [ 2] 4983 	jra 4$ 
      001D19                       4984 3$: ; forget all files 
      009AB8 54 00 FB         [ 2] 4985 	ldw x,#0x100
      009ABB CE               [ 1] 4986 	clr a 
      009ABC 54 04 A6         [ 2] 4987 	ldw farptr,x 
      009ABF 04 81 12         [ 1] 4988 	ld farptr+2,a 
      009AC1                       4989 4$:
      009AC1 52 01 CD         [ 2] 4990 	ldw ffree,x 
      009AC4 92 60 A1         [ 1] 4991 	ld ffree+2,a 
      009AC7 01 27            [ 1] 4992 	push #4
      009AC9 03               [ 1] 4993 	clrw x 
      001D2C                       4994 5$: 
      009ACA CC               [ 1] 4995 	clr a  
      009ACB 87 9D CD         [ 4] 4996 	call write_byte 
      009ACE 90               [ 2] 4997 	incw x 
      009ACF 1C A3            [ 1] 4998 	dec (1,sp)
      009AD1 00 0F            [ 1] 4999 	jrne 5$	
      009AD3 23               [ 1] 5000 6$: pop a 
      009AD4 05               [ 4] 5001 	ret 
                                   5002 
                                   5003 ;----------------------
                                   5004 ; BASIC: DIR 
                                   5005 ; list saved files 
                                   5006 ;----------------------
                           000001  5007 	COUNT=1 ; files counter 
                           000002  5008 	VSIZE=2 
      001D37                       5009 directory:
      001D37                       5010 	_vars VSIZE 
      009AD5 A6 0A            [ 2]    1     sub sp,#VSIZE 
      009AD7 CC               [ 1] 5011 	clrw x 
      009AD8 87 9F            [ 2] 5012 	ldw (COUNT,sp),x 
      009ADA CD A0 44         [ 2] 5013 	ldw farptr+1,x 
      009ADD 6B 01 E6 01      [ 1] 5014 	mov farptr,#1 
      001D43                       5015 dir_loop:
      009AE1 0D               [ 1] 5016 	clrw x 
      009AE2 01 27 05 44      [ 5] 5017 	ldf a,([farptr],x)
      009AE6 0A 01            [ 1] 5018 	jreq 8$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      001D4A                       5019 1$: ;name loop 	
      009AE8 26 FB A4 01      [ 5] 5020 	ldf a,([farptr],x)
      009AEC 5F 97            [ 1] 5021 	jreq 2$ 
      009AEE A6 04 5B         [ 4] 5022 	call putc 
      009AF1 01               [ 2] 5023 	incw x 
      009AF2 81 F4            [ 2] 5024 	jra 1$
      009AF3 5C               [ 2] 5025 2$: incw x ; skip ending 0. 
      009AF3 52 02            [ 1] 5026 	ld a,#SPACE 
      009AF5 CD 92 3C         [ 4] 5027 	call putc 
                                   5028 ; get file size 	
      009AF8 A1 02 27 03      [ 5] 5029 	ldf a,([farptr],x)
      009AFC CC 87            [ 1] 5030 	ld yh,a 
      009AFE 9D               [ 2] 5031 	incw x 
      009AFF CD 90 1C 9F      [ 5] 5032 	ldf a,([farptr],x)
      009B03 6B               [ 2] 5033 	incw x 
      009B04 02 CD            [ 1] 5034 	ld yl,a 
      009B06 90 1C            [ 2] 5035 	pushw y 
      009B08 A3 00 0F         [ 2] 5036 	addw x,(1,sp)
      009B0B 23               [ 2] 5037 	incw x ; skip EOF marker 
                                   5038 ; skip to next file 
      009B0C 05 A6 0A         [ 4] 5039 	call incr_farptr 
                                   5040 ; print file size 
      009B0F CC               [ 2] 5041 	popw x ; file size 
      009B10 87 9F CD         [ 4] 5042 	call print_int 
      009B13 A0 44            [ 1] 5043 	ld a,#CR 
      009B15 6B 01 A6         [ 4] 5044 	call putc
      009B18 01 0D            [ 2] 5045 	ldw x,(COUNT,sp)
      009B1A 01               [ 2] 5046 	incw x
      009B1B 27 05            [ 2] 5047 	ldw (COUNT,sp),x  
      009B1D 48 0A            [ 2] 5048 	jra dir_loop 
      001D83                       5049 8$: ; print number of files 
      009B1F 01 26            [ 2] 5050 	ldw x,(COUNT,sp)
      009B21 FB 0D 02         [ 4] 5051 	call print_int 
      009B24 26 05 43         [ 2] 5052 	ldw x,#file_count 
      009B27 E4 00 20         [ 4] 5053 	call puts  
                                   5054 ; print drive free space 	
      009B2A 02 EA            [ 1] 5055 	ld a,#0xff 
      009B2C 00 E7 00         [ 1] 5056 	sub a,ffree+2 
      009B2F 5B 02 81         [ 1] 5057 	ld acc8,a 
      009B32 A6 7F            [ 1] 5058 	ld a,#0x7f 
      009B32 72 00 00         [ 1] 5059 	sbc a,ffree+1 
      009B35 20 02 4F         [ 1] 5060 	ld acc16,a 
      009B38 81 02            [ 1] 5061 	ld a,#2 
      009B39 C2 00 13         [ 1] 5062 	sbc a,ffree 
      009B39 AE 9B 60         [ 1] 5063 	ld acc24,a 
      009B3C CD               [ 1] 5064 	clrw x  
      009B3D 82 45            [ 1] 5065 	ld a,#6 
      009B3F 5B               [ 1] 5066 	ld xl,a 
      009B40 02 52            [ 1] 5067 	ld a,#10 
      009B42 06 CD 96         [ 4] 5068 	call prti24 
      009B45 FE AE 16         [ 2] 5069 	ldw x,#drive_free
      009B48 C8 CF 00         [ 4] 5070 	call puts 
      001DB5                       5071 	_drop VSIZE 
      009B4B 05 7F            [ 2]    1     addw sp,#VSIZE 
      009B4D 72               [ 4] 5072 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009B4E 5F 00 04 5F CF 00 01  5073 file_count: .asciz " files\n"
             72
      009B56 11 00 20 72 18 00 20  5074 drive_free: .asciz " bytes free\n" 
             CC 88 4D 0A 62 72
                                   5075 
                                   5076 ;---------------------
                                   5077 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5078 ; write 1 or more byte to FLASH or EEPROM
                                   5079 ; starting at address  
                                   5080 ; input:
                                   5081 ;   expr1  	is address 
                                   5082 ;   expr2   is byte to write
                                   5083 ; output:
                                   5084 ;   none 
                                   5085 ;---------------------
                           000001  5086 	ADDR=1
                           000002  5087 	VSIZ=2 
      001DCD                       5088 write:
      001DCD                       5089 	_vars VSIZE 
      009B63 65 61            [ 2]    1     sub sp,#VSIZE 
      009B65 6B 20 70 6F      [ 1] 5090 	clr farptr ; expect 16 bits address 
      009B69 69 6E 74         [ 4] 5091 	call expression
      009B6C 2C 20            [ 1] 5092 	cp a,#TK_INTGR 
      009B6E 52 55            [ 1] 5093 	jreq 0$
      009B70 4E 20 74         [ 2] 5094 	jp syntax_error
      009B73 6F 20            [ 2] 5095 0$: ldw (ADDR,sp),x 
      009B75 72 65 73         [ 4] 5096 	call next_token 
      009B78 75 6D            [ 1] 5097 	cp a,#TK_COMMA 
      009B7A 65 2E            [ 1] 5098 	jreq 1$ 
      009B7C 0A 00            [ 2] 5099 	jra 9$ 
      009B7E CD 12 C0         [ 4] 5100 1$:	call expression
      009B7E 72 01            [ 1] 5101 	cp a,#TK_INTGR
      009B80 00 20            [ 1] 5102 	jreq 2$
      009B82 02 4F 81         [ 2] 5103 	jp syntax_error
      009B85 9F               [ 1] 5104 2$:	ld a,xl 
      009B85 CD 86            [ 2] 5105 	ldw x,(ADDR,sp) 
      009B87 6F 81 11         [ 2] 5106 	ldw farptr+1,x 
      009B89 5F               [ 1] 5107 	clrw x 
      009B89 72 BB 00         [ 4] 5108 	call write_byte
      009B8C 12 24            [ 2] 5109 	ldw x,(ADDR,sp)
      009B8E 04               [ 2] 5110 	incw x 
      009B8F 72 5C            [ 2] 5111 	jra 0$ 
      001E01                       5112 9$:
      001E01                       5113 	_drop VSIZE
      009B91 00 11            [ 2]    1     addw sp,#VSIZE 
      009B93 CF               [ 4] 5114 	ret 
                                   5115 
                                   5116 
                                   5117 ;---------------------
                                   5118 ;BASIC: CHAR(expr)
                                   5119 ; évaluate expression 
                                   5120 ; and take the 7 least 
                                   5121 ; bits as ASCII character
                                   5122 ;---------------------
      001E04                       5123 char:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009B94 00 12 81         [ 4] 5124 	call func_args 
      009B97 A1 01            [ 1] 5125 	cp a,#1
      009B97 A6 01            [ 1] 5126 	jreq 1$
      009B99 C7 00 11         [ 2] 5127 	jp syntax_error
      009B9C 5F CF 00         [ 4] 5128 1$:	call dpop 
      009B9F 12               [ 1] 5129 	ld a,xl 
      009BA0 A4 7F            [ 1] 5130 	and a,#0x7f 
      009BA0 AE               [ 1] 5131 	ld xl,a
      009BA1 00 03            [ 1] 5132 	ld a,#TK_CHAR
      009BA3 92               [ 4] 5133 	ret
                                   5134 
                                   5135 ;---------------------
                                   5136 ; BASIC: ASC(string|char)
                                   5137 ; extract first character 
                                   5138 ; of string argument 
                                   5139 ; return it as TK_INTGR 
                                   5140 ;---------------------
      001E18                       5141 ascii:
      009BA4 AF 00 11         [ 4] 5142 	call func_args 
      009BA7 26 05 5A         [ 4] 5143 	call next_token 
      009BAA 2A F7            [ 1] 5144 	cp a,#TK_QSTR 
      009BAC 20 19            [ 1] 5145 	jreq 1$
      009BAE 5C CD            [ 1] 5146 	cp a,#TK_CHAR 
      009BB0 9B 89            [ 1] 5147 	jreq 2$ 
      009BB2 AE 02 7F         [ 2] 5148 	jp syntax_error
      001E29                       5149 1$: 
      009BB5 C3               [ 1] 5150 	ld a,(x)
      009BB6 00 11            [ 2] 5151 	jra 3$
      001E2C                       5152 2$: 
      009BB8 2A               [ 1] 5153 	ld a,xl 
      009BB9 E6               [ 1] 5154 3$:	ld xl,a 
      009BBA 72               [ 1] 5155 	clr a  
      009BBB 5F               [ 1] 5156 	ld xh,a 
      009BBC 00 14            [ 1] 5157 	ld a,#TK_INTGR 
      009BBE 72               [ 4] 5158 	ret 
                                   5159 
                                   5160 ;---------------------
                                   5161 ;BASIC: KEY
                                   5162 ; wait for a character 
                                   5163 ; received from STDIN 
                                   5164 ; input:
                                   5165 ;	none 
                                   5166 ; output:
                                   5167 ;	X 		ASCII character 
                                   5168 ;---------------------
      001E33                       5169 key:
      009BBF 5F 00 15         [ 4] 5170 	call getc 
      009BC2 72               [ 1] 5171 	clrw x 
      009BC3 5F               [ 1] 5172 	ld xl,a 
      009BC4 00 16            [ 1] 5173 	ld a,#TK_INTGR
      009BC6 81               [ 4] 5174 	ret
                                   5175 
                                   5176 ;----------------------
                                   5177 ; BASIC: QKEY
                                   5178 ; Return true if there 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5179 ; is a character in 
                                   5180 ; waiting in STDIN 
                                   5181 ; input:
                                   5182 ;  none 
                                   5183 ; output:
                                   5184 ;   X 		0|1 
                                   5185 ;-----------------------
      009BC7                       5186 qkey: 
      009BC7 CE               [ 1] 5187 	clrw x 
      009BC8 00 11 C6 00 13   [ 2] 5188 	btjf UART1_SR,#UART_SR_RXNE,9$ 
      009BCD CF               [ 2] 5189 	incw x 
      009BCE 00 14            [ 1] 5190 9$: ld a,#TK_INTGR
      009BD0 C7               [ 4] 5191 	ret 
                                   5192 
                                   5193 ;---------------------
                                   5194 ; BASIC: GPIO(expr,reg)
                                   5195 ; return gpio address 
                                   5196 ; expr {0..8}
                                   5197 ; input:
                                   5198 ;   none 
                                   5199 ; output:
                                   5200 ;   X 		gpio register address
                                   5201 ;----------------------------
      001E45                       5202 gpio:
      009BD1 00 16 81         [ 4] 5203 	call func_args 
      009BD4 A1 02            [ 1] 5204 	cp a,#2
      009BD4 5F 92            [ 1] 5205 	jreq 1$
      009BD6 AF 00 11         [ 2] 5206 	jp syntax_error  
      001E4F                       5207 1$:	
      009BD9 90 F1 26         [ 2] 5208 	ldw x,#2
      009BDC 08 4D 27 12      [ 5] 5209 	ldw x,([dstkptr],x) ; port 
      009BE0 5C 90            [ 1] 5210 	jrmi bad_port
      009BE2 5C 20 F0         [ 2] 5211 	cpw x,#9
      009BE5 2A 16            [ 1] 5212 	jrpl bad_port
      009BE5 4D 27            [ 1] 5213 	ld a,#5
      009BE7 07               [ 4] 5214 	mul x,a
      009BE8 5C 92 AF         [ 2] 5215 	addw x,#GPIO_BASE 
      009BEB 00               [ 2] 5216 	pushw x 
      009BEC 11 20 F6         [ 4] 5217 	call dpop 
      009BEF 5C 98 81         [ 2] 5218 	addw x,(1,sp)
      009BF2 1F 01            [ 2] 5219 	ldw (1,sp),x  
      009BF2 5C 99 81         [ 4] 5220 	call ddrop  
      009BF5 85               [ 2] 5221 	popw x 
      009BF5 52 04            [ 1] 5222 	ld a,#TK_INTGR
      009BF7 17               [ 4] 5223 	ret
      001E73                       5224 bad_port:
      009BF8 03 5F            [ 1] 5225 	ld a,#ERR_BAD_VALUE
      009BFA CF 00 12         [ 2] 5226 	jp tb_error
                                   5227 
                                   5228 
                                   5229 ;-------------------------
                                   5230 ; BASIC: UFLASH 
                                   5231 ; return user flash address
                                   5232 ; input:
                                   5233 ;  none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5234 ; output:
                                   5235 ;	A		TK_INTGR
                                   5236 ;   X 		user address 
                                   5237 ;---------------------------
      001E78                       5238 uflash:
      009BFD 35 01 00         [ 2] 5239 	ldw x,#user_space 
      009C00 11 04            [ 1] 5240 	ld a,#TK_INTGR 
      009C01 81               [ 4] 5241 	ret 
                                   5242 
                                   5243 
                                   5244 ;---------------------
                                   5245 ; BASIC: USR(addr[,arg])
                                   5246 ; execute a function written 
                                   5247 ; in binary code.
                                   5248 ; binary fonction should 
                                   5249 ; return token attribute in A 
                                   5250 ; and value in X. 
                                   5251 ; input:
                                   5252 ;   addr	routine address 
                                   5253 ;   arg 	is an optional argument 
                                   5254 ; output:
                                   5255 ;   A 		token attribute 
                                   5256 ;   X       returned value 
                                   5257 ;---------------------
      001E7E                       5258 usr:
      009C01 92 BC            [ 2] 5259 	pushw y 	
      009C03 00 11 27         [ 4] 5260 	call func_args 
      009C06 25 5F            [ 1] 5261 	cp a,#1 
      009C08 16 03            [ 1] 5262 	jrpl 2$ 
      009C0A CD 9B D4         [ 2] 5263 	jp syntax_error 
      001E8A                       5264 2$: 
      009C0D 25 2D 92         [ 4] 5265 	call dpop 
      009C10 AF 00            [ 1] 5266 	cp a,#2 
      009C12 11 6B            [ 1] 5267 	jrmi 4$
      009C14 01 5C            [ 1] 5268 	ldw y,x ; y=arg 
      009C16 92 AF 00         [ 4] 5269 	call dpop ;x=addr 
      009C19 11               [ 1] 5270 4$:	exgw y,x ; y=addr,x=arg 
      009C1A 6B 02            [ 4] 5271 	call (y)
      009C1C 5C 72            [ 2] 5272 	popw y 
      009C1E FB               [ 4] 5273 	ret 
                                   5274 
                                   5275 ;------------------------------
                                   5276 ; BASIC: BYE 
                                   5277 ; halt mcu in its lowest power mode 
                                   5278 ; wait for reset or external interrupt
                                   5279 ; do a cold start on wakeup.
                                   5280 ;------------------------------
      001E9C                       5281 bye:
      009C1F 01 5C CD 9B 89   [ 2] 5282 	btjf UART1_SR,#UART_SR_TC,.
      009C24 AE               [10] 5283 	halt
      009C25 02 80 C3         [ 2] 5284 	jp cold_start  
                                   5285 
                                   5286 ;----------------------------------
                                   5287 ; BASIC: SLEEP 
                                   5288 ; halt mcu until reset or external
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   5289 ; interrupt.
                                   5290 ; Resume progam after SLEEP command
                                   5291 ;----------------------------------
      001EA5                       5292 sleep:
      009C28 00 11 2A D5 FB   [ 2] 5293 	btjf UART1_SR,#UART_SR_TC,.
      009C2C 72 16 00 1F      [ 1] 5294 	bset flags,#FSLEEP
      009C2C 72               [10] 5295 	halt 
      009C2D 5F               [ 4] 5296 	ret 
                                   5297 
                                   5298 ;-------------------------------
                                   5299 ; BASIC: PAUSE expr 
                                   5300 ; suspend execution for n msec.
                                   5301 ; input:
                                   5302 ;	none
                                   5303 ; output:
                                   5304 ;	none 
                                   5305 ;------------------------------
      001EB0                       5306 pause:
      009C2E 00 11 72         [ 4] 5307 	call expression
      009C31 5F 00            [ 1] 5308 	cp a,#TK_INTGR
      009C33 12 72            [ 1] 5309 	jreq pause02 
      009C35 5F 00 13         [ 2] 5310 	jp syntax_error
      001EBA                       5311 pause02: 
      009C38 5B               [ 2] 5312 1$: tnzw x 
      009C39 04 98            [ 1] 5313 	jreq 2$
      009C3B 81               [10] 5314 	wfi 
      009C3C 5A               [ 2] 5315 	decw x 
      009C3C 5B 04            [ 1] 5316 	jrne 1$
      009C3E 99               [ 1] 5317 2$:	clr a 
      009C3F 81               [ 4] 5318 	ret 
                                   5319 
                                   5320 ;------------------------------
                                   5321 ; BASIC: TICKS
                                   5322 ; return msec ticks counter value 
                                   5323 ; input:
                                   5324 ; 	none 
                                   5325 ; output:
                                   5326 ;	X 		TK_INTGR
                                   5327 ;-------------------------------
      009C40                       5328 get_ticks:
      009C40 72 01 00         [ 2] 5329 	ldw x,ticks 
      009C43 20 05            [ 1] 5330 	ld a,#TK_INTGR
      009C45 A6               [ 4] 5331 	ret 
                                   5332 
                                   5333 
                                   5334 
                                   5335 ;------------------------------
                                   5336 ; BASIC: ABS(expr)
                                   5337 ; return absolute value of expr.
                                   5338 ; input:
                                   5339 ;   none
                                   5340 ; output:
                                   5341 ;   X     	positive integer
                                   5342 ;-------------------------------
      001EC9                       5343 abs:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009C46 07 CC 87         [ 4] 5344 	call func_args 
      009C49 9F 01            [ 1] 5345 	cp a,#1 
      009C4A 27 03            [ 1] 5346 	jreq 0$ 
      009C4A CE 00 1B         [ 2] 5347 	jp syntax_error
      001ED3                       5348 0$:  
      009C4D 72 B0 00         [ 4] 5349     call dpop   
      009C50 19               [ 1] 5350 	ld a,xh 
      009C51 26 01            [ 1] 5351 	bcp a,#0x80 
      009C53 81 01            [ 1] 5352 	jreq 2$ 
      009C54 50               [ 2] 5353 	negw x 
      009C54 52 04            [ 1] 5354 2$: ld a,#TK_INTGR 
      009C56 1F               [ 4] 5355 	ret 
                                   5356 
                                   5357 ;------------------------------
                                   5358 ; BASIC: AND(expr1,expr2)
                                   5359 ; Apply bit AND relation between
                                   5360 ; the 2 arguments, i.e expr1 & expr2 
                                   5361 ; output:
                                   5362 ; 	A 		TK_INTGR
                                   5363 ;   X 		result 
                                   5364 ;------------------------------
      001EDF                       5365 bit_and:
      009C57 01 CD 88         [ 4] 5366 	call func_args 
      009C5A 7D A1            [ 1] 5367 	cp a,#2
      009C5C 0A 27            [ 1] 5368 	jreq 1$
      009C5E 03 CC 87         [ 2] 5369 	jp syntax_error 
      009C61 9D 0F 9C         [ 4] 5370 1$:	call dpop 
      009C62 89               [ 2] 5371 	pushw x 
      009C62 90 CE 00         [ 4] 5372 	call dpop 
      009C65 05               [ 1] 5373 	ld a,xh 
      009C66 72 B9            [ 1] 5374 	and a,(1,sp)
      009C68 00               [ 1] 5375 	ld xh,a 
      009C69 01               [ 1] 5376 	ld a,xl
      009C6A 17 03            [ 1] 5377 	and a,(2,sp)
      009C6C 55               [ 1] 5378 	ld xl,a 
      001EF8                       5379 	_drop 2 
      009C6D 00 04            [ 2]    1     addw sp,#2 
      009C6F 00 02            [ 1] 5380 	ld a,#TK_INTGR
      009C71 93               [ 4] 5381 	ret
                                   5382 
                                   5383 ;------------------------------
                                   5384 ; BASIC: OR(expr1,expr2)
                                   5385 ; Apply bit OR relation between
                                   5386 ; the 2 arguments, i.e expr1 | expr2 
                                   5387 ; output:
                                   5388 ; 	A 		TK_INTGR
                                   5389 ;   X 		result 
                                   5390 ;------------------------------
      001EFD                       5391 bit_or:
      009C72 CD 83 07         [ 4] 5392 	call func_args 
      009C75 1C 00            [ 1] 5393 	cp a,#2
      009C77 03 72            [ 1] 5394 	jreq 1$
      009C79 FB 01 72         [ 2] 5395 	jp syntax_error 
      001F07                       5396 1$: 
      009C7C 5D 00 14         [ 4] 5397 	call dpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009C7F 26               [ 2] 5398 	pushw x 
      009C80 0B 72 B0         [ 4] 5399 	call dpop 
      009C83 00               [ 1] 5400 	ld a,xh 
      009C84 15 23            [ 1] 5401 	or a,(1,sp)
      009C86 05               [ 1] 5402 	ld xh,a 
      009C87 A6               [ 1] 5403 	ld a,xl 
      009C88 01 CC            [ 1] 5404 	or a,(2,sp)
      009C8A 87               [ 1] 5405 	ld xl,a 
      001F16                       5406 	_drop 2 
      009C8B 9F 02            [ 2]    1     addw sp,#2 
      009C8C A6 04            [ 1] 5407 	ld a,#TK_INTGR 
      009C8C 16               [ 4] 5408 	ret
                                   5409 
                                   5410 ;------------------------------
                                   5411 ; BASIC: XOR(expr1,expr2)
                                   5412 ; Apply bit XOR relation between
                                   5413 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5414 ; output:
                                   5415 ; 	A 		TK_INTGR
                                   5416 ;   X 		result 
                                   5417 ;------------------------------
      001F1B                       5418 bit_xor:
      009C8D 03 CD 9B         [ 4] 5419 	call func_args 
      009C90 F5 24            [ 1] 5420 	cp a,#2
      009C92 05 A6            [ 1] 5421 	jreq 1$
      009C94 08 CC 87         [ 2] 5422 	jp syntax_error 
      001F25                       5423 1$: 
      009C97 9F 0F 9C         [ 4] 5424 	call dpop 
      009C98 89               [ 2] 5425 	pushw x 
      009C98 CE 00 14         [ 4] 5426 	call dpop 
      009C9B C6               [ 1] 5427 	ld a,xh 
      009C9C 00 16            [ 1] 5428 	xor a,(1,sp)
      009C9E CF               [ 1] 5429 	ld xh,a 
      009C9F 00               [ 1] 5430 	ld a,xl 
      009CA0 11 C7            [ 1] 5431 	xor a,(2,sp)
      009CA2 00               [ 1] 5432 	ld xl,a 
      001F34                       5433 	_drop 2 
      009CA3 13 1E            [ 2]    1     addw sp,#2 
      009CA5 03 CD            [ 1] 5434 	ld a,#TK_INTGR 
      009CA7 83               [ 4] 5435 	ret 
                                   5436 
                                   5437 ;------------------------------
                                   5438 ; BASIC: LSHIFT(expr1,expr2)
                                   5439 ; logical shift left expr1 by 
                                   5440 ; expr2 bits 
                                   5441 ; output:
                                   5442 ; 	A 		TK_INTGR
                                   5443 ;   X 		result 
                                   5444 ;------------------------------
      001F39                       5445 lshift:
      009CA8 07 5C 1F         [ 4] 5446 	call func_args
      009CAB 01 5F            [ 1] 5447 	cp a,#2 
      009CAD 16 03            [ 1] 5448 	jreq 1$
      009CAF CD 81 D5         [ 2] 5449 	jp syntax_error
      009CB2 CE 00 1B         [ 4] 5450 1$: call dpop  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009CB5 72               [ 1] 5451 	exgw x,y 
      009CB6 B0 00 19         [ 4] 5452 	call dpop
      009CB9 1F 01            [ 2] 5453 	tnzw y 
      009CBB 5F 7B            [ 1] 5454 	jreq 4$
      009CBD 01               [ 2] 5455 2$:	sllw x 
      009CBE CD 81            [ 2] 5456 	decw y 
      009CC0 60 5C            [ 1] 5457 	jrne 2$
      001F53                       5458 4$:  
      009CC2 7B 02            [ 1] 5459 	ld a,#TK_INTGR
      009CC4 CD               [ 4] 5460 	ret
                                   5461 
                                   5462 ;------------------------------
                                   5463 ; BASIC: RSHIFT(expr1,expr2)
                                   5464 ; logical shift right expr1 by 
                                   5465 ; expr2 bits.
                                   5466 ; output:
                                   5467 ; 	A 		TK_INTGR
                                   5468 ;   X 		result 
                                   5469 ;------------------------------
      001F56                       5470 rshift:
      009CC5 81 60 5C         [ 4] 5471 	call func_args
      009CC8 CD 9B            [ 1] 5472 	cp a,#2 
      009CCA 89 1E            [ 1] 5473 	jreq 1$
      009CCC 01 89 5F         [ 2] 5474 	jp syntax_error
      009CCF 90 CE 00         [ 4] 5475 1$: call dpop  
      009CD2 19               [ 1] 5476 	exgw x,y 
      009CD3 CD 81 D5         [ 4] 5477 	call dpop
      009CD6 5B 02            [ 2] 5478 	tnzw y 
      009CD8 AE 00            [ 1] 5479 	jreq 4$
      009CDA 01               [ 2] 5480 2$:	srlw x 
      009CDB A6 FF            [ 2] 5481 	decw y 
      009CDD CD 81            [ 1] 5482 	jrne 2$
      001F70                       5483 4$:  
      009CDF 60 CD            [ 1] 5484 	ld a,#TK_INTGR
      009CE1 9B               [ 4] 5485 	ret
                                   5486 
                                   5487 ;--------------------------
                                   5488 ; BASIC: FCPU integer
                                   5489 ; set CPU frequency 
                                   5490 ;-------------------------- 
                                   5491 
      001F73                       5492 fcpu:
      009CE2 89 CE            [ 1] 5493 	ld a,#TK_INTGR
      009CE4 00 11 C6         [ 4] 5494 	call expect 
      009CE7 00               [ 1] 5495 	ld a,xl 
      009CE8 13 CF            [ 1] 5496 	and a,#7 
      009CEA 00 14 C7         [ 1] 5497 	ld CLK_CKDIVR,a 
      009CED 00               [ 4] 5498 	ret 
                                   5499 
                                   5500 ;------------------------------
                                   5501 ; BASIC: PMODE pin#, mode 
                                   5502 ; define pin as input or output
                                   5503 ; pin#: {0..15}
                                   5504 ; mode: INPUT|OUTPUT  
                                   5505 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                           000001  5506 	PINNO=1
                           000001  5507 	VSIZE=1
      001F7F                       5508 pin_mode:
      001F7F                       5509 	_vars VSIZE 
      009CEE 16 5F            [ 2]    1     sub sp,#VSIZE 
      009CF0 4B 04 BC         [ 4] 5510 	call arg_list 
      009CF2 A1 02            [ 1] 5511 	cp a,#2 
      009CF2 4F CD            [ 1] 5512 	jreq 1$
      009CF4 81 60 5C         [ 2] 5513 	jp syntax_error 
      009CF7 0A 01 26         [ 4] 5514 1$: call dpop ; mode 
      009CFA F7               [ 1] 5515 	exgw x,y 
      009CFB 84 1E 01         [ 4] 5516 	call dpop ; Dx pin 
      009CFE CD 8A 16         [ 4] 5517 	call select_pin 
      009D01 5B 04            [ 1] 5518 	ld (PINNO,sp),a  
      009D03 81 01            [ 1] 5519 	ld a,#1 
      009D04 0D 01            [ 1] 5520 	tnz (PINNO,sp)
      009D04 72 01            [ 1] 5521 	jreq 4$
      009D06 00               [ 1] 5522 2$:	sll a 
      009D07 20 07            [ 1] 5523 	dec (PINNO,sp)
      009D09 27 05            [ 1] 5524 	jrne 2$ 
      009D0B A6 07            [ 1] 5525 	ld (PINNO,sp),a
      009D0D CC 87            [ 1] 5526 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009D0F 9F 03            [ 1] 5527 	ld (GPIO_CR1,x),a 
      009D10 90 A3 00 01      [ 2] 5528 4$:	cpw y,#OUTP 
      009D10 CD 88            [ 1] 5529 	jreq 6$
                                   5530 ; input mode
      009D12 7D A1            [ 1] 5531 	ld a,(PINNO,sp)
      009D14 0A               [ 1] 5532 	cpl a 
      009D15 27 03            [ 1] 5533 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009D17 CC 87            [ 2] 5534 	jra 9$
      001FB5                       5535 6$: ;output mode  
      009D19 9D 01            [ 1] 5536 	ld a,(PINNO,sp)
      009D1A EA 04            [ 1] 5537 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009D1A 90 CE            [ 1] 5538 	ld (GPIO_CR2,x),a 
      009D1C 00 05            [ 1] 5539 	ld a,(PINNO,sp)
      009D1E 72 B9            [ 1] 5540 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009D20 00 01            [ 1] 5541 9$:	ld (GPIO_DDR,x),a 
      001FC1                       5542 	_drop VSIZE 
      009D22 55 00            [ 2]    1     addw sp,#VSIZE 
      009D24 04               [ 4] 5543 	ret
                                   5544 
                                   5545 ;------------------------
                                   5546 ; select pin 
                                   5547 ; input:
                                   5548 ;   X 	 {0..15} Arduino Dx 
                                   5549 ; output:
                                   5550 ;   A     stm8s208 pin 
                                   5551 ;   X     base address s208 GPIO port 
                                   5552 ;---------------------------
      001FC4                       5553 select_pin:
      009D25 00               [ 2] 5554 	sllw x 
      009D26 02 CD 9B         [ 2] 5555 	addw x,#arduino_to_8s208 
      009D29 F5               [ 2] 5556 	ldw x,(x)
      009D2A 25               [ 1] 5557 	ld a,xl 
      009D2B 05               [ 1] 5558 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009D2C A6               [ 1] 5559 	swapw x 
      009D2D 09 CC            [ 1] 5560 	ld a,#5 
      009D2F 87               [ 4] 5561 	mul x,a 
      009D30 9F 50 00         [ 2] 5562 	addw x,#GPIO_BASE 
      009D31 84               [ 1] 5563 	pop a 
      009D31 CD               [ 4] 5564 	ret 
                                   5565 ; translation from Arduino D0..D15 to stm8s208rb 
      001FD4                       5566 arduino_to_8s208:
      009D32 9B 89                 5567 .byte 3,6 ; D0 
      009D34 CD 86                 5568 .byte 3,5 ; D1 
      009D36 6F 5F                 5569 .byte 4,0 ; D2 
      009D38 92 AF                 5570 .byte 2,1 ; D3
      009D3A 00 11                 5571 .byte 6,0 ; D4
      009D3C 90 95                 5572 .byte 2,2 ; D5
      009D3E 5C 92                 5573 .byte 2,3 ; D6
      009D40 AF 00                 5574 .byte 3,1 ; D7
      009D42 11 5C                 5575 .byte 3,3 ; D8
      009D44 90 97                 5576 .byte 2,4 ; D9
      009D46 72 B9                 5577 .byte 4,5 ; D10
      009D48 00 19                 5578 .byte 2,6 ; D11
      009D4A 90 CF                 5579 .byte 2,7 ; D12
      009D4C 00 1B                 5580 .byte 2,5 ; D13
      009D4E 90 CE                 5581 .byte 4,2 ; D14
      009D50 00 19                 5582 .byte 4,1 ; D15
                                   5583 
                                   5584 
                                   5585 ;------------------------------
                                   5586 ; BASIC: RND(expr)
                                   5587 ; return random number 
                                   5588 ; between 1 and expr inclusive
                                   5589 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5590 ; input:
                                   5591 ; 	none 
                                   5592 ; output:
                                   5593 ;	X 		random positive integer 
                                   5594 ;------------------------------
      009D52                       5595 random:
      009D52 92 AF 00         [ 4] 5596 	call func_args 
      009D55 11 90            [ 1] 5597 	cp a,#1
      009D57 F7 5C            [ 1] 5598 	jreq 1$
      009D59 90 5C 90         [ 2] 5599 	jp syntax_error
      001FFE                       5600 1$: 
      009D5C C3 00 1B         [ 4] 5601 	call dpop 
      009D5F 2B               [ 2] 5602 	pushw x 
      009D60 F1               [ 1] 5603 	ld a,xh 
      009D61 CE 00            [ 1] 5604 	bcp a,#0x80 
      009D63 1B 72            [ 1] 5605 	jreq 2$
      009D65 B0 00            [ 1] 5606 	ld a,#ERR_BAD_VALUE
      009D67 19 CD 8A         [ 2] 5607 	jp tb_error
      00200C                       5608 2$: 
                                   5609 ; acc16=(x<<5)^x 
      009D6A 16 81 0C         [ 2] 5610 	ldw x,seedx 
      009D6C 58               [ 2] 5611 	sllw x 
      009D6C CD               [ 2] 5612 	sllw x 
      009D6D 88               [ 2] 5613 	sllw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009D6E 7D               [ 2] 5614 	sllw x 
      009D6F A1               [ 2] 5615 	sllw x 
      009D70 00               [ 1] 5616 	ld a,xh 
      009D71 27 26 A1         [ 1] 5617 	xor a,seedx 
      009D74 0A 27 03         [ 1] 5618 	ld acc16,a 
      009D77 CC               [ 1] 5619 	ld a,xl 
      009D78 87 9D 90         [ 1] 5620 	xor a,seedx+1 
      009D7B CE 00 05         [ 1] 5621 	ld acc8,a 
                                   5622 ; seedx=seedy 
      009D7E 72 B9 00         [ 2] 5623 	ldw x,seedy 
      009D81 01 55 00         [ 2] 5624 	ldw seedx,x  
                                   5625 ; seedy=seedy^(seedy>>1)
      009D84 04 00            [ 2] 5626 	srlw y 
      009D86 02 CD            [ 1] 5627 	ld a,yh 
      009D88 9B F5 25         [ 1] 5628 	xor a,seedy 
      009D8B 05 A6 09         [ 1] 5629 	ld seedy,a  
      009D8E CC 87            [ 1] 5630 	ld a,yl 
      009D90 9F 00 0F         [ 1] 5631 	xor a,seedy+1 
      009D91 C7 00 0F         [ 1] 5632 	ld seedy+1,a 
                                   5633 ; acc16>>3 
      009D91 CE 00 11         [ 2] 5634 	ldw x,acc16 
      009D94 C6               [ 2] 5635 	srlw x 
      009D95 00               [ 2] 5636 	srlw x 
      009D96 13               [ 2] 5637 	srlw x 
                                   5638 ; x=acc16^x 
      009D97 20               [ 1] 5639 	ld a,xh 
      009D98 0A 00 08         [ 1] 5640 	xor a,acc16 
      009D99 95               [ 1] 5641 	ld xh,a 
      009D99 AE               [ 1] 5642 	ld a,xl 
      009D9A 01 00 4F         [ 1] 5643 	xor a,acc8 
      009D9D CF               [ 1] 5644 	ld xl,a 
                                   5645 ; seedy=x^seedy 
      009D9E 00 11 C7         [ 1] 5646 	xor a,seedy+1
      009DA1 00               [ 1] 5647 	ld xl,a 
      009DA2 13               [ 1] 5648 	ld a,xh 
      009DA3 C8 00 0E         [ 1] 5649 	xor a,seedy
      009DA3 CF               [ 1] 5650 	ld xh,a 
      009DA4 00 14 C7         [ 2] 5651 	ldw seedy,x 
                                   5652 ; return seedy modulo expr + 1 
      009DA7 00 16            [ 2] 5653 	popw y 
      009DA9 4B               [ 2] 5654 	divw x,y 
      009DAA 04               [ 1] 5655 	ldw x,y 
      009DAB 5F               [ 2] 5656 	incw x 
      009DAC A6 04            [ 1] 5657 	ld a,#TK_INTGR
      009DAC 4F               [ 4] 5658 	ret 
                                   5659 
                                   5660 ;---------------------------------
                                   5661 ; BASIC: WORDS 
                                   5662 ; affiche la listes des mots du
                                   5663 ; dictionnaire.
                                   5664 ;---------------------------------
                           000001  5665 	WLEN=1
                           000002  5666 	LLEN=2  
                           000002  5667 	VSIZE=2 
      00205E                       5668 words:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      00205E                       5669 	_vars VSIZE
      009DAD CD 81            [ 2]    1     sub sp,#VSIZE 
      009DAF 60 5C            [ 1] 5670 	clr (LLEN,sp)
      009DB1 0A 01 26 F7      [ 2] 5671 	ldw y,#kword_dict+2
      009DB5 84               [ 1] 5672 0$:	ldw x,y
      009DB6 81               [ 1] 5673 	ld a,(x)
      009DB7 A4 0F            [ 1] 5674 	and a,#15 
      009DB7 52 02            [ 1] 5675 	ld (WLEN,sp),a 
      009DB9 5F               [ 2] 5676 1$:	incw x 
      009DBA 1F               [ 1] 5677 	ld a,(x)
      009DBB 01 CF 00         [ 4] 5678 	call putc 
      009DBE 12 35            [ 1] 5679 	inc (LLEN,sp)
      009DC0 01 00            [ 1] 5680 	dec (WLEN,sp)
      009DC2 11 F5            [ 1] 5681 	jrne 1$
      009DC3 A6 46            [ 1] 5682 	ld a,#70
      009DC3 5F 92            [ 1] 5683 	cp a,(LLEN,sp)
      009DC5 AF 00            [ 1] 5684 	jrmi 2$   
      009DC7 11 27            [ 1] 5685 	ld a,#SPACE 
      009DC9 39 01 B3         [ 4] 5686 	call putc 
      009DCA 0C 02            [ 1] 5687 	inc (LLEN,sp) 
      009DCA 92 AF            [ 2] 5688 	jra 3$
      009DCC 00 11            [ 1] 5689 2$: ld a,#CR 
      009DCE 27 06 CD         [ 4] 5690 	call putc 
      009DD1 82 33            [ 1] 5691 	clr (LLEN,sp)
      009DD3 5C 20 F4 5C      [ 2] 5692 3$:	subw y,#2 
      009DD7 A6 20            [ 2] 5693 	ldw y,(y)
      009DD9 CD 82            [ 1] 5694 	jrne 0$  
      002095                       5695 	_drop VSIZE 
      009DDB 33 92            [ 2]    1     addw sp,#VSIZE 
      009DDD AF               [ 4] 5696 	ret 
                                   5697 
                                   5698 
                                   5699 ;*********************************
                                   5700 
                                   5701 ;------------------------------
                                   5702 ;      dictionary 
                                   5703 ; format:
                                   5704 ;   link:   2 bytes 
                                   5705 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5706 ;   cmd_name: 16 byte max 
                                   5707 ;   code_address: 2 bytes 
                                   5708 ;------------------------------
                                   5709 	.macro _dict_entry len,name,cmd 
                                   5710 	.word LINK 
                                   5711 	LINK=.
                                   5712 name:
                                   5713 	.byte len 	
                                   5714 	.ascii "name"
                                   5715 	.word cmd 
                                   5716 	.endm 
                                   5717 
                           000000  5718 	LINK=0
      002098                       5719 kword_end:
      002098                       5720 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009DDE 00 11                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                           00209A     2 	LINK=.
      00209A                          3 XOR:
      009DE0 90                       4 	.byte 3+F_IFUNC 	
      009DE1 95 5C 92                 5 	.ascii "XOR"
      009DE4 AF 00                    6 	.word bit_xor 
      0020A0                       5721 	_dict_entry,5,WRITE,write  
      009DE6 11 5C                    1 	.word LINK 
                           0020A2     2 	LINK=.
      0020A2                          3 WRITE:
      009DE8 90                       4 	.byte 5 	
      009DE9 97 90 89 72 FB           5 	.ascii "WRITE"
      009DEE 01 5C                    6 	.word write 
      0020AA                       5722 	_dict_entry,5,WORDS,words 
      009DF0 CD 9B                    1 	.word LINK 
                           0020AC     2 	LINK=.
      0020AC                          3 WORDS:
      009DF2 89                       4 	.byte 5 	
      009DF3 85 CD 8A 16 A6           5 	.ascii "WORDS"
      009DF8 0D CD                    6 	.word words 
      0020B4                       5723 	_dict_entry 4,WAIT,wait 
      009DFA 82 33                    1 	.word LINK 
                           0020B6     2 	LINK=.
      0020B6                          3 WAIT:
      009DFC 1E                       4 	.byte 4 	
      009DFD 01 5C 1F 01              5 	.ascii "WAIT"
      009E01 20 C0                    6 	.word wait 
      009E03                       5724 	_dict_entry,3+F_IFUNC,USR,usr
      009E03 1E 01                    1 	.word LINK 
                           0020BF     2 	LINK=.
      0020BF                          3 USR:
      009E05 CD                       4 	.byte 3+F_IFUNC 	
      009E06 8A 16 AE                 5 	.ascii "USR"
      009E09 9E 38                    6 	.word usr 
      0020C5                       5725 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009E0B CD 82                    1 	.word LINK 
                           0020C7     2 	LINK=.
      0020C7                          3 UFLASH:
      009E0D 45                       4 	.byte 6+F_IFUNC 	
      009E0E A6 FF C0 00 16 C7        5 	.ascii "UFLASH"
      009E14 00 0A                    6 	.word uflash 
      0020D0                       5726 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009E16 A6 7F                    1 	.word LINK 
                           0020D2     2 	LINK=.
      0020D2                          3 UBOUND:
      009E18 C2                       4 	.byte 6+F_IFUNC 	
      009E19 00 15 C7 00 09 A6        5 	.ascii "UBOUND"
      009E1F 02 C2                    6 	.word ubound 
      0020DB                       5727 	_dict_entry,2,TO,to
      009E21 00 14                    1 	.word LINK 
                           0020DD     2 	LINK=.
      0020DD                          3 TO:
      009E23 C7                       4 	.byte 2 	
      009E24 00 08                    5 	.ascii "TO"
      009E26 5F A6                    6 	.word to 
      0020E2                       5728 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009E28 06 97                    1 	.word LINK 
                           0020E4     2 	LINK=.
      0020E4                          3 TICKS:
      009E2A A6                       4 	.byte 5+F_IFUNC 	
      009E2B 0A CD 89 CE AE           5 	.ascii "TICKS"
      009E30 9E 40                    6 	.word get_ticks 
      0020EC                       5729 	_dict_entry,4,STOP,stop 
      009E32 CD 82                    1 	.word LINK 
                           0020EE     2 	LINK=.
      0020EE                          3 STOP:
      009E34 45                       4 	.byte 4 	
      009E35 5B 02 81 20              5 	.ascii "STOP"
      009E39 66 69                    6 	.word stop 
      0020F5                       5730 	_dict_entry,4,STEP,step 
      009E3B 6C 65                    1 	.word LINK 
                           0020F7     2 	LINK=.
      0020F7                          3 STEP:
      009E3D 73                       4 	.byte 4 	
      009E3E 0A 00 20 62              5 	.ascii "STEP"
      009E42 79 74                    6 	.word step 
      0020FE                       5731 	_dict_entry,5,SLEEP,sleep 
      009E44 65 73                    1 	.word LINK 
                           002100     2 	LINK=.
      002100                          3 SLEEP:
      009E46 20                       4 	.byte 5 	
      009E47 66 72 65 65 0A           5 	.ascii "SLEEP"
      009E4C 00 A5                    6 	.word sleep 
      009E4D                       5732 	_dict_entry,4+F_IFUNC,SIZE,size
      009E4D 52 02                    1 	.word LINK 
                           00210A     2 	LINK=.
      00210A                          3 SIZE:
      009E4F 72                       4 	.byte 4+F_IFUNC 	
      009E50 5F 00 11 CD              5 	.ascii "SIZE"
      009E54 93 40                    6 	.word size 
      002111                       5733     _dict_entry,4,SHOW,show 
      009E56 A1 04                    1 	.word LINK 
                           002113     2 	LINK=.
      002113                          3 SHOW:
      009E58 27                       4 	.byte 4 	
      009E59 03 CC 87 9D              5 	.ascii "SHOW"
      009E5D 1F 01                    6 	.word show 
      00211A                       5734 	_dict_entry,4,SAVE,save
      009E5F CD 88                    1 	.word LINK 
                           00211C     2 	LINK=.
      00211C                          3 SAVE:
      009E61 7D                       4 	.byte 4 	
      009E62 A1 0D 27 02              5 	.ascii "SAVE"
      009E66 20 19                    6 	.word save 
      002123                       5735 	_dict_entry 3,RUN,run
      009E68 CD 93                    1 	.word LINK 
                           002125     2 	LINK=.
      002125                          3 RUN:
      009E6A 40                       4 	.byte 3 	
      009E6B A1 04 27                 5 	.ascii "RUN"
      009E6E 03 CC                    6 	.word run 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      00212B                       5736 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      009E70 87 9D                    1 	.word LINK 
                           00212D     2 	LINK=.
      00212D                          3 RSHIFT:
      009E72 9F                       4 	.byte 6+F_IFUNC 	
      009E73 1E 01 CF 00 12 5F        5 	.ascii "RSHIFT"
      009E79 CD 81                    6 	.word rshift 
      002136                       5737 	_dict_entry,3+F_IFUNC,RND,random 
      009E7B 60 1E                    1 	.word LINK 
                           002138     2 	LINK=.
      002138                          3 RND:
      009E7D 01                       4 	.byte 3+F_IFUNC 	
      009E7E 5C 20 DC                 5 	.ascii "RND"
      009E81 1F F4                    6 	.word random 
      00213E                       5738 	_dict_entry,6,RETURN,return 
      009E81 5B 02                    1 	.word LINK 
                           002140     2 	LINK=.
      002140                          3 RETURN:
      009E83 81                       4 	.byte 6 	
      009E84 52 45 54 55 52 4E        5 	.ascii "RETURN"
      009E84 CD 92                    6 	.word return 
      002149                       5739 	_dict_entry 6,REMARK,rem 
      009E86 60 A1                    1 	.word LINK 
                           00214B     2 	LINK=.
      00214B                          3 REMARK:
      009E88 01                       4 	.byte 6 	
      009E89 27 03 CC 87 9D CD        5 	.ascii "REMARK"
      009E8F 90 1C                    6 	.word rem 
      002154                       5740 	_dict_entry,6,REBOOT,cold_start 
      009E91 9F A4                    1 	.word LINK 
                           002156     2 	LINK=.
      002156                          3 REBOOT:
      009E93 7F                       4 	.byte 6 	
      009E94 97 A6 03 81 4F 54        5 	.ascii "REBOOT"
      009E98 05 61                    6 	.word cold_start 
      00215F                       5741 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      009E98 CD 92                    1 	.word LINK 
                           002161     2 	LINK=.
      002161                          3 QKEY:
      009E9A 60                       4 	.byte 4+F_IFUNC 	
      009E9B CD 88 7D A1              5 	.ascii "QKEY"
      009E9F 0A 27                    6 	.word qkey 
      002168                       5742 	_dict_entry,6,PWRADC,power_adc 
      009EA1 07 A1                    1 	.word LINK 
                           00216A     2 	LINK=.
      00216A                          3 PWRADC:
      009EA3 03                       4 	.byte 6 	
      009EA4 27 06 CC 87 9D 43        5 	.ascii "PWRADC"
      009EA9 19 C2                    6 	.word power_adc 
      002173                       5743 	_dict_entry 5,PRINT,print 
      009EA9 F6 20                    1 	.word LINK 
                           002175     2 	LINK=.
      002175                          3 PRINT:
      009EAB 01                       4 	.byte 5 	
      009EAC 50 52 49 4E 54           5 	.ascii "PRINT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009EAC 9F 97                    6 	.word print 
      00217D                       5744 	_dict_entry,4+F_CONST,POUT,OUTP 
      009EAE 4F 95                    1 	.word LINK 
                           00217F     2 	LINK=.
      00217F                          3 POUT:
      009EB0 A6                       4 	.byte 4+F_CONST 	
      009EB1 04 81 55 54              5 	.ascii "POUT"
      009EB3 00 01                    6 	.word OUTP 
      002186                       5745 	_dict_entry,4,POKE,poke 
      009EB3 CD 82                    1 	.word LINK 
                           002188     2 	LINK=.
      002188                          3 POKE:
      009EB5 3C                       4 	.byte 4 	
      009EB6 5F 97 A6 04              5 	.ascii "POKE"
      009EBA 81 AB                    6 	.word poke 
      009EBB                       5746 	_dict_entry,4+F_CONST,PINP,INP 
      009EBB 5F 72                    1 	.word LINK 
                           002191     2 	LINK=.
      002191                          3 PINP:
      009EBD 0B                       4 	.byte 4+F_CONST 	
      009EBE 52 30 01 5C              5 	.ascii "PINP"
      009EC2 A6 04                    6 	.word INP 
      002198                       5747 	_dict_entry,4+F_IFUNC,PEEK,peek 
      009EC4 81 91                    1 	.word LINK 
                           00219A     2 	LINK=.
      009EC5                          3 PEEK:
      009EC5 CD                       4 	.byte 4+F_IFUNC 	
      009EC6 92 60 A1 02              5 	.ascii "PEEK"
      009ECA 27 03                    6 	.word peek 
      0021A1                       5748 	_dict_entry,5,PMODE,pin_mode 
      009ECC CC 87                    1 	.word LINK 
                           0021A3     2 	LINK=.
      0021A3                          3 PMODE:
      009ECE 9D                       4 	.byte 5 	
      009ECF 50 4D 4F 44 45           5 	.ascii "PMODE"
      009ECF AE 00                    6 	.word pin_mode 
      0021AB                       5749 	_dict_entry,5,PAUSE,pause 
      009ED1 02 72                    1 	.word LINK 
                           0021AD     2 	LINK=.
      0021AD                          3 PAUSE:
      009ED3 DE                       4 	.byte 5 	
      009ED4 00 17 2B 1B A3           5 	.ascii "PAUSE"
      009ED9 00 09                    6 	.word pause 
      0021B5                       5750 	_dict_entry,2+F_IFUNC,OR,bit_or
      009EDB 2A 16                    1 	.word LINK 
                           0021B7     2 	LINK=.
      0021B7                          3 OR:
      009EDD A6                       4 	.byte 2+F_IFUNC 	
      009EDE 05 42                    5 	.ascii "OR"
      009EE0 1C 50                    6 	.word bit_or 
      0021BC                       5751 	_dict_entry,3+F_CONST,ODR,GPIO_ODR
      009EE2 00 89                    1 	.word LINK 
                           0021BE     2 	LINK=.
      0021BE                          3 ODR:
      009EE4 CD                       4 	.byte 3+F_CONST 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009EE5 90 1C 72                 5 	.ascii "ODR"
      009EE8 FB 01                    6 	.word GPIO_ODR 
      0021C4                       5752 	_dict_entry,3,NEW,new
      009EEA 1F 01                    1 	.word LINK 
                           0021C6     2 	LINK=.
      0021C6                          3 NEW:
      009EEC CD                       4 	.byte 3 	
      009EED 90 43 85                 5 	.ascii "NEW"
      009EF0 A6 04                    6 	.word new 
      0021CC                       5753 	_dict_entry,4,NEXT,next 
      009EF2 81 C6                    1 	.word LINK 
                           0021CE     2 	LINK=.
      009EF3                          3 NEXT:
      009EF3 A6                       4 	.byte 4 	
      009EF4 0A CC 87 9F              5 	.ascii "NEXT"
      009EF8 18 67                    6 	.word next 
      0021D5                       5754 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      009EF8 AE A4                    1 	.word LINK 
                           0021D7     2 	LINK=.
      0021D7                          3 LSHIFT:
      009EFA 00                       4 	.byte 6+F_IFUNC 	
      009EFB A6 04 81 49 46 54        5 	.ascii "LSHIFT"
      009EFE 1F 39                    6 	.word lshift 
      0021E0                       5755 	_dict_entry,4,LOAD,load 
      009EFE 90 89                    1 	.word LINK 
                           0021E2     2 	LINK=.
      0021E2                          3 LOAD:
      009F00 CD                       4 	.byte 4 	
      009F01 92 60 A1 01              5 	.ascii "LOAD"
      009F05 2A 03                    6 	.word load 
      0021E9                       5756 	_dict_entry 4,LIST,list
      009F07 CC 87                    1 	.word LINK 
                           0021EB     2 	LINK=.
      0021EB                          3 LIST:
      009F09 9D                       4 	.byte 4 	
      009F0A 4C 49 53 54              5 	.ascii "LIST"
      009F0A CD 90                    6 	.word list 
      0021F2                       5757 	_dict_entry 3,LET,let 
      009F0C 1C A1                    1 	.word LINK 
                           0021F4     2 	LINK=.
      0021F4                          3 LET:
      009F0E 02                       4 	.byte 3 	
      009F0F 2B 05 90                 5 	.ascii "LET"
      009F12 93 CD                    6 	.word let 
      0021FA                       5758 	_dict_entry,3+F_IFUNC,KEY,key 
      009F14 90 1C                    1 	.word LINK 
                           0021FC     2 	LINK=.
      0021FC                          3 KEY:
      009F16 51                       4 	.byte 3+F_IFUNC 	
      009F17 90 FD 90                 5 	.ascii "KEY"
      009F1A 85 81                    6 	.word key 
      009F1C                       5759 	_dict_entry,5,INPUT,input_var  
      009F1C 72 0D                    1 	.word LINK 
                           002204     2 	LINK=.
      002204                          3 INPUT:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009F1E 52                       4 	.byte 5 	
      009F1F 30 FB 8E CC 85           5 	.ascii "INPUT"
      009F24 E1 9E                    6 	.word input_var 
      009F25                       5760 	_dict_entry,2,IF,if 
      009F25 72 0D                    1 	.word LINK 
                           00220E     2 	LINK=.
      00220E                          3 IF:
      009F27 52                       4 	.byte 2 	
      009F28 30 FB                    5 	.ascii "IF"
      009F2A 72 16                    6 	.word if 
      002213                       5761 	_dict_entry,3+F_CONST,IDR,GPIO_IDR
      009F2C 00 20                    1 	.word LINK 
                           002215     2 	LINK=.
      002215                          3 IDR:
      009F2E 8E                       4 	.byte 3+F_CONST 	
      009F2F 81 44 52                 5 	.ascii "IDR"
      009F30 00 01                    6 	.word GPIO_IDR 
      00221B                       5762 	_dict_entry,3,HEX,hex_base
      009F30 CD 93                    1 	.word LINK 
                           00221D     2 	LINK=.
      00221D                          3 HEX:
      009F32 40                       4 	.byte 3 	
      009F33 A1 04 27                 5 	.ascii "HEX"
      009F36 03 CC                    6 	.word hex_base 
      002223                       5763 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      009F38 87 9D                    1 	.word LINK 
                           002225     2 	LINK=.
      009F3A                          3 GPIO:
      009F3A 5D                       4 	.byte 4+F_IFUNC 	
      009F3B 27 04 8F 5A              5 	.ascii "GPIO"
      009F3F 26 F9                    6 	.word gpio 
      00222C                       5764 	_dict_entry,4,GOTO,goto 
      009F41 4F 81                    1 	.word LINK 
                           00222E     2 	LINK=.
      009F43                          3 GOTO:
      009F43 CE                       4 	.byte 4 	
      009F44 00 0B A6 04              5 	.ascii "GOTO"
      009F48 81 D6                    6 	.word goto 
      009F49                       5765 	_dict_entry,5,GOSUB,gosub 
      009F49 CD 92                    1 	.word LINK 
                           002237     2 	LINK=.
      002237                          3 GOSUB:
      009F4B 60                       4 	.byte 5 	
      009F4C A1 01 27 03 CC           5 	.ascii "GOSUB"
      009F51 87 9D                    6 	.word gosub 
      009F53                       5766 	_dict_entry,6,FORGET,forget 
      009F53 CD 90                    1 	.word LINK 
                           002241     2 	LINK=.
      002241                          3 FORGET:
      009F55 1C                       4 	.byte 6 	
      009F56 9E A5 80 27 01 50        5 	.ascii "FORGET"
      009F5C A6 04                    6 	.word forget 
      00224A                       5767 	_dict_entry,3,FOR,for 
      009F5E 81 41                    1 	.word LINK 
                           00224C     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009F5F                          3 FOR:
      009F5F CD                       4 	.byte 3 	
      009F60 92 60 A1                 5 	.ascii "FOR"
      009F63 02 27                    6 	.word for 
      002252                       5768 	_dict_entry,4,FCPU,fcpu 
      009F65 03 CC                    1 	.word LINK 
                           002254     2 	LINK=.
      002254                          3 FCPU:
      009F67 87                       4 	.byte 4 	
      009F68 9D CD 90 1C              5 	.ascii "FCPU"
      009F6C 89 CD                    6 	.word fcpu 
      00225B                       5769 	_dict_entry,6+F_CONST,EEPROM,EEPROM_BASE  
      009F6E 90 1C                    1 	.word LINK 
                           00225D     2 	LINK=.
      00225D                          3 EEPROM:
      009F70 9E                       4 	.byte 6+F_CONST 	
      009F71 14 01 95 9F 14 02        5 	.ascii "EEPROM"
      009F77 97 5B                    6 	.word EEPROM_BASE 
      002266                       5770 	_dict_entry,6+F_CMD,DWRITE,digital_write
      009F79 02 A6                    1 	.word LINK 
                           002268     2 	LINK=.
      002268                          3 DWRITE:
      009F7B 04                       4 	.byte 6+F_CMD 	
      009F7C 81 57 52 49 54 45        5 	.ascii "DWRITE"
      009F7D 1A 73                    6 	.word digital_write 
      002271                       5771 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      009F7D CD 92                    1 	.word LINK 
                           002273     2 	LINK=.
      002273                          3 DREAD:
      009F7F 60                       4 	.byte 5+F_IFUNC 	
      009F80 A1 02 27 03 CC           5 	.ascii "DREAD"
      009F85 87 9D                    6 	.word digital_read 
      009F87                       5772 	_dict_entry,3,DIR,directory 
      009F87 CD 90                    1 	.word LINK 
                           00227D     2 	LINK=.
      00227D                          3 DIR:
      009F89 1C                       4 	.byte 3 	
      009F8A 89 CD 90                 5 	.ascii "DIR"
      009F8D 1C 9E                    6 	.word directory 
      002283                       5773 	_dict_entry,3,DEC,dec_base
      009F8F 1A 01                    1 	.word LINK 
                           002285     2 	LINK=.
      002285                          3 DEC:
      009F91 95                       4 	.byte 3 	
      009F92 9F 1A 02                 5 	.ascii "DEC"
      009F95 97 5B                    6 	.word dec_base 
      00228B                       5774 	_dict_entry,3+F_CONST,DDR,GPIO_DDR
      009F97 02 A6                    1 	.word LINK 
                           00228D     2 	LINK=.
      00228D                          3 DDR:
      009F99 04                       4 	.byte 3+F_CONST 	
      009F9A 81 44 52                 5 	.ascii "DDR"
      009F9B 00 02                    6 	.word GPIO_DDR 
      002293                       5775 	_dict_entry,3+F_CONST,CRL,GPIO_CR1
      009F9B CD 92                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



                           002295     2 	LINK=.
      002295                          3 CRL:
      009F9D 60                       4 	.byte 3+F_CONST 	
      009F9E A1 02 27                 5 	.ascii "CRL"
      009FA1 03 CC                    6 	.word GPIO_CR1 
      00229B                       5776 	_dict_entry,3+F_CONST,CRH,GPIO_CR2
      009FA3 87 9D                    1 	.word LINK 
                           00229D     2 	LINK=.
      009FA5                          3 CRH:
      009FA5 CD                       4 	.byte 3+F_CONST 	
      009FA6 90 1C 89                 5 	.ascii "CRH"
      009FA9 CD 90                    6 	.word GPIO_CR2 
      0022A3                       5777 	_dict_entry,4+F_CFUNC,CHAR,char
      009FAB 1C 9E                    1 	.word LINK 
                           0022A5     2 	LINK=.
      0022A5                          3 CHAR:
      009FAD 18                       4 	.byte 4+F_CFUNC 	
      009FAE 01 95 9F 18              5 	.ascii "CHAR"
      009FB2 02 97                    6 	.word char 
      0022AC                       5778 	_dict_entry,3,BYE,bye 
      009FB4 5B 02                    1 	.word LINK 
                           0022AE     2 	LINK=.
      0022AE                          3 BYE:
      009FB6 A6                       4 	.byte 3 	
      009FB7 04 81 45                 5 	.ascii "BYE"
      009FB9 1E 9C                    6 	.word bye 
      0022B4                       5779 	_dict_entry,5,BTOGL,bit_toggle
      009FB9 CD 92                    1 	.word LINK 
                           0022B6     2 	LINK=.
      0022B6                          3 BTOGL:
      009FBB 60                       4 	.byte 5 	
      009FBC A1 02 27 03 CC           5 	.ascii "BTOGL"
      009FC1 87 9D                    6 	.word bit_toggle 
      0022BE                       5780 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      009FC3 CD 90                    1 	.word LINK 
                           0022C0     2 	LINK=.
      0022C0                          3 BTEST:
      009FC5 1C                       4 	.byte 5+F_IFUNC 	
      009FC6 51 CD 90 1C 90           5 	.ascii "BTEST"
      009FCB 5D 27                    6 	.word bit_test 
      0022C8                       5781 	_dict_entry,4,BSET,bit_set 
      009FCD 05 58                    1 	.word LINK 
                           0022CA     2 	LINK=.
      0022CA                          3 BSET:
      009FCF 90                       4 	.byte 4 	
      009FD0 5A 26 FB 54              5 	.ascii "BSET"
      009FD3 17 43                    6 	.word bit_set 
      0022D1                       5782 	_dict_entry,4,BRES,bit_reset
      009FD3 A6 04                    1 	.word LINK 
                           0022D3     2 	LINK=.
      0022D3                          3 BRES:
      009FD5 81                       4 	.byte 4 	
      009FD6 42 52 45 53              5 	.ascii "BRES"
      009FD6 CD 92                    6 	.word bit_reset 
      0022DA                       5783 	_dict_entry,5,BREAK,break 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009FD8 60 A1                    1 	.word LINK 
                           0022DC     2 	LINK=.
      0022DC                          3 BREAK:
      009FDA 02                       4 	.byte 5 	
      009FDB 27 03 CC 87 9D           5 	.ascii "BREAK"
      009FE0 CD 90                    6 	.word break 
      0022E4                       5784 	_dict_entry,4,BEEP,beep 
      009FE2 1C 51                    1 	.word LINK 
                           0022E6     2 	LINK=.
      0022E6                          3 BEEP:
      009FE4 CD                       4 	.byte 4 	
      009FE5 90 1C 90 5D              5 	.ascii "BEEP"
      009FE9 27 05                    6 	.word beep 
      0022ED                       5785 	_dict_entry,3+F_IFUNC,ASC,ascii
      009FEB 54 90                    1 	.word LINK 
                           0022EF     2 	LINK=.
      0022EF                          3 ASC:
      009FED 5A                       4 	.byte 3+F_IFUNC 	
      009FEE 26 FB 43                 5 	.ascii "ASC"
      009FF0 1E 18                    6 	.word ascii 
      0022F5                       5786 	_dict_entry,6+F_IFUNC,ANREAD,analog_read
      009FF0 A6 04                    1 	.word LINK 
                           0022F7     2 	LINK=.
      0022F7                          3 ANREAD:
      009FF2 81                       4 	.byte 6+F_IFUNC 	
      009FF3 41 4E 52 45 41 44        5 	.ascii "ANREAD"
      009FF3 A6 04                    6 	.word analog_read 
      002300                       5787 	_dict_entry,3+F_IFUNC,AND,bit_and
      009FF5 CD 92                    1 	.word LINK 
                           002302     2 	LINK=.
      002302                          3 AND:
      009FF7 2F                       4 	.byte 3+F_IFUNC 	
      009FF8 9F A4 07                 5 	.ascii "AND"
      009FFB C7 50                    6 	.word bit_and 
      002308                       5788 kword_dict:
      002308                       5789 	_dict_entry,3+F_IFUNC,ABS,abs
      009FFD C6 81                    1 	.word LINK 
                           00230A     2 	LINK=.
      009FFF                          3 ABS:
      009FFF 52                       4 	.byte 3+F_IFUNC 	
      00A000 01 CD 92                 5 	.ascii "ABS"
      00A003 3C A1                    6 	.word abs 
                                   5790 	
                                   5791 
      002380                       5792 	.bndry 128 ; align on FLASH block.
                                   5793 ; free space for user application  
      002380                       5794 user_space:
                                   5795 ; USR() function test
      00A005 02               [ 2] 5796 	pushw x 
      00A006 27 03 CC 87      [ 1] 5797 	bset PC_ODR,#5 
      00A00A 9D               [ 2] 5798 	popw x 
      00A00B CD 90 1C         [ 4] 5799 	call pause02 
      00A00E 51 CD 90 1C      [ 1] 5800 	bres PC_ODR,#5 
      00A012 CD               [ 4] 5801 	ret
                                   5802 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                   5803 	.area FLASH_DRIVE (ABS)
      010000                       5804 	.org 0x10000
      010000                       5805 fdrive:
                                   5806 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        00230A R   |     ADC_CR1 =  005401 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        002302 R
  5 ANREAD     0022F7 R   |     ARG_CNT =  000001     |     ARG_OFS =  000002 
  5 ASC        0022EF R   |     ATTRIB  =  000002     |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |     BASE    =  000002 
    BASE_SAV=  000001     |   5 BEEP       0022E6 R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_ER=  000000     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  000005 
  5 BREAK      0022DC R   |   5 BRES       0022D3 R   |   5 BSET       0022CA R
    BSIZE   =  000001     |     BSP     =  000008     |   5 BTEST      0022C0 R
  5 BTOGL      0022B6 R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        0022AE R   |     C       =  000001     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000000     |   5 CHAR       0022A5 R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
    CLK_ECKR=  000001     |     CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0 
    CLK_ICKR=  000002     |     CLK_ICKR=  000000     |     CLK_ICKR=  000001 
    CLK_ICKR=  000003     |     CLK_ICKR=  000004     |     CLK_ICKR=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]

Symbol Table

    CLK_PCKE=  0050C7     |     CLK_PCKE=  000000     |     CLK_PCKE=  000001 
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
  5 CRH        00229D R   |   5 CRL        002295 R   |     CTRL_A  =  000001 
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
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        00228D R
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        002285 R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        00227D R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DREAD      002273 R   |     DSTACK_S=  000040     |   5 DWRITE     002268 R
  5 EEPROM     00225D R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |     EOF     =  0000FF     |     ERR_BAD_=  00000A 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_L=  000005 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |   5 FCPU       002254 R   |     FF      =  00000C 
    FFOR    =  000002     |     FHSE    =  7A1200     |     FHSI    =  F42400 
    FIRST   =  000001     |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
    FLASH_CR=  000002     |     FLASH_CR=  000000     |     FLASH_CR=  000003 
    FLASH_CR=  000001     |     FLASH_CR=  00505B     |     FLASH_CR=  000005 
    FLASH_CR=  000004     |     FLASH_CR=  000007     |     FLASH_CR=  000000 
    FLASH_CR=  000006     |     FLASH_DU=  005064     |     FLASH_DU=  0000AE 
    FLASH_DU=  000056     |     FLASH_EN=  027FFF     |     FLASH_FP=  00505D 
    FLASH_FP=  000000     |     FLASH_FP=  000001     |     FLASH_FP=  000002 
    FLASH_FP=  000003     |     FLASH_FP=  000004     |     FLASH_FP=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_IA=  00505F     |     FLASH_IA=  000003     |     FLASH_IA=  000002 
    FLASH_IA=  000006     |     FLASH_IA=  000001     |     FLASH_IA=  000000 
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   5 FOR        00224C R
  5 FORGET     002241 R   |     FRUN    =  000000     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FTRAP   =  000001     |     F_CFUNC =  000080 
    F_CMD   =  000000     |     F_CONST =  0000C0     |     F_IFUNC =  000040 
  5 GOSUB      002237 R   |     GOS_RET =  000003     |   5 GOTO       00222E R
  5 GPIO       002225 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   5 HEX        00221D R
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
    I2C_WRIT=  000000     |   5 IDR        002215 R   |   5 IF         00220E R
    IN      =  000007     |     INCR    =  000001     |     INP     =  000000 
  5 INPUT      002204 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008048     |     INT_VECT=  008044     |     INT_VECT=  008064 
    INT_VECT=  008008     |     INT_VECT=  008004     |     INT_VECT=  008050 
    INT_VECT=  00804C     |     INT_VECT=  00805C     |     INT_VECT=  008058 
    INW     =  000003     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        0021FC R   |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000005     |   5 LET        0021F4 R   |     LINENO  =  000005 
  5 LINK    =  00230A R   |   5 LIST       0021EB R   |     LL      =  000002 
    LLEN    =  000002     |     LL_HB   =  000001     |     LNO     =  000005 
    LN_PTR  =  000005     |   5 LOAD       0021E2 R   |   5 LSHIFT     0021D7 R
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MINOR   =  000000     |     MULOP   =  000005     |     N1      =  000001 
    N1_HB   =  000006     |     N1_LB   =  000007     |     N2      =  000003 
    N2_HB   =  000008     |     N2_LB   =  000009     |     NAFR    =  004804 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        0021C6 R   |   5 NEXT       0021CE R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NL      =  00000A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R
  5 ODR        0021BE R   |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         0021B7 R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
    PAD_SIZE=  000028     |   5 PAUSE      0021AD R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       00219A R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       002191 R   |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]

Symbol Table

    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      0021A3 R
  5 POKE       002188 R   |   5 POUT       00217F R   |     PREV    =  000001 
  5 PRINT      002175 R   |     PROD    =  000002     |     PSIZE   =  000001 
  5 PWRADC     00216A R   |   5 QKEY       002161 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 REBOOT     002156 R
  5 REG_A      000940 R   |   5 REG_CC     000944 R   |   5 REG_EPC    000933 R
  5 REG_SP     000949 R   |   5 REG_X      00093C R   |   5 REG_Y      000938 R
    RELOP   =  000005     |   5 REMARK     00214B R   |     RETL1   =  000001 
  5 RETURN     002140 R   |   5 RND        002138 R   |     ROP     =  004800 
  5 RSHIFT     00212D R   |     RST_SR  =  0050B3     |   5 RUN        002125 R
    RXCHAR  =  000001     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   5 SAVE       00211C R
    SDIVD   =  000002     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       002113 R   |     SIGN    =  000001 
  5 SIZE       00210A R   |     SKIP    =  000006     |   5 SLEEP      002100 R
    SPACE   =  000020     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  000080     |   5 STATES     0008F6 R   |   5 STEP       0020F7 R
  5 STOP       0020EE R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      0020E4 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]

Symbol Table

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
    TK_VAR  =  000005     |   5 TO         0020DD R   |   5 Timer4Up   000019 R
  5 TrapHand   00000A R   |     U8      =  000003     |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]

Symbol Table

    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
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
    UBC     =  004801     |   5 UBOUND     0020D2 R   |   5 UFLASH     0020C7 R
  5 USER_ABO   00007E R   |   5 USR        0020BF R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 UserButt   000025 R
    VSIZ    =  000002     |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       0020B6 R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      0020AC R   |   5 WRITE      0020A2 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XADR    =  000001     |     XMASK   =  000001 
  5 XOR        00209A R   |     XSAVE   =  000003     |     YSAVE   =  000003 
  5 abs        001EC9 R   |   1 acc16      000008 R   |   1 acc24      000007 R
  1 acc8       000009 R   |   5 accept_c   000AEA R   |   5 add        00107D R
  5 analog_r   001A0B R   |   5 ansi_seq   000AAC R   |   5 arduino_   001FD4 R
  5 arg_list   0011BC R   |   1 array_si   00001D R   |   5 ascii      001E18 R
  5 at_tst     000DB7 R   |   5 atoi24     000ECA R   |   5 atoi_exi   000F38 R
  5 bad_port   001E73 R   |   1 base       000006 R   |   1 basicptr   000004 R
  5 beep       00199A R   |   5 bin_exit   000CBB R   |   5 bit_and    001EDF R
  5 bit_or     001EFD R   |   5 bit_rese   001757 R   |   5 bit_set    001743 R
  5 bit_test   001780 R   |   5 bit_togg   00176C R   |   5 bit_xor    001F1B R
  5 bkslsh_t   000D62 R   |   5 bksp       0001CF R   |   5 break      001AB2 R
  5 break_po   001AE0 R   |   5 bye        001E9C R   |   5 char       001E04 R
  5 check_fu   0003F2 R   |   5 clear_ba   0005EF R   |   5 clear_va   0004FC R
  5 clock_in   000099 R   |   5 cmd_itf    000B0E R   |   5 cmd_name   001128 R
  5 cmp_name   001B54 R   |   5 cold_sta   000561 R   |   5 colon_ts   000D8B R
  5 comma_ts   000D96 R   |   5 compile    000401 R   |   5 convert_   000C43 R
  1 count      000003 R   |   5 cp_loop    00116B R   |   5 create_g   000351 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]

Symbol Table

  5 cstk_pro   001047 R   |   5 dash_tst   000DAC R   |   5 ddrop      000FC3 R
  5 ddrop_n    001000 R   |   5 ddup       000FCC R   |   5 dec_base   001370 R
  5 del_back   000ADB R   |   5 del_line   000319 R   |   5 del_ln     000ACC R
  5 delete     0001DF R   |   5 digital_   001A41 R   |   5 digital_   001A73 R
  5 dir_loop   001D43 R   |   5 director   001D37 R   |   5 divide     0010D3 R
  5 divu24_8   000A39 R   |   5 dotr       001050 R   |   5 dotr_loo   001065 R
  5 dots       00101D R   |   5 dpick      000FDD R   |   5 dpop       000F9C R
  5 dpush      000F8F R   |   5 drive_fr   001DC0 R   |   3 dstack     001740 R
  3 dstack_u   001780 R   |   5 dstk_pro   001013 R   |   1 dstkptr    000016 R
  5 dswap      000FA9 R   |   5 eql_tst    000E17 R   |   5 equal      001600 R
  5 err_bad_   0006CC R   |   5 err_cmd_   00068D R   |   5 err_div0   00064F R
  5 err_dupl   0006A8 R   |   5 err_math   000635 R   |   5 err_mem_   000618 R
  5 err_msg    000600 R   |   5 err_no_a   0006D9 R   |   5 err_no_l   00065F R
  5 err_not_   0006BA R   |   5 err_run_   000676 R   |   5 err_synt   000626 R
  5 escaped    000C58 R   |   5 expect     0011AF R   |   5 expr_exi   001301 R
  5 expressi   0012C0 R   |   5 factor     001217 R   |   1 farptr     000010 R
  5 fcpu       001F73 R   |   7 fdrive     010000 R   |   5 fetch      000FEC R
  5 fetchc     000BFB R   |   1 ffree      000013 R   |   5 file_cou   001DB8 R
  5 final_te   000AA6 R   |   5 first_li   0013F4 R   |   1 flags      00001F R
  5 for        0017E5 R   |   5 forget     001CEC R   |   1 free_ram   000055 R
  5 func_arg   0011E0 R   |   5 ge         001602 R   |   5 get_arra   0011F0 R
  5 get_tick   001EC3 R   |   5 get_toke   000CFD R   |   5 getc       0001BC R
  5 go_commo   001906 R   |   5 gosub      0018E3 R   |   5 goto       0018D6 R
  5 gpio       001E45 R   |   5 gt         0015FE R   |   5 gt_tst     000E22 R
  5 hex_base   00136B R   |   5 if         0017D1 R   |   1 in         000001 R
  1 in.saved   000002 R   |   1 in.w       000000 R   |   5 incr_far   001B09 R
  5 input_ex   00170F R   |   5 input_lo   0016AA R   |   5 input_va   00169E R
  5 insert_l   00038A R   |   5 insert_l   0003EF R   |   5 interp     00078D R
  5 interp_l   0007CD R   |   5 invalid    000B53 R   |   5 invalid_   000BD1 R
  5 is_alpha   00050A R   |   5 is_digit   000EB5 R   |   5 itoa       0009F2 R
  5 itoa_loo   000A0A R   |   5 key        001E33 R   |   5 kword_di   002308 R
  5 kword_en   002098 R   |   5 last_lin   0013FD R   |   5 le         001607 R
  5 ledoff     000846 R   |   5 ledon      000841 R   |   5 ledtoggl   00084B R
  5 left_arr   000AAC R   |   5 left_par   000854 R   |   5 let        0013A1 R
  5 let02      0013AB R   |   5 lines_sk   001402 R   |   5 list       0013C9 R
  5 list_exi   001449 R   |   5 list_sta   001425 R   |   5 load       001C84 R
  5 loop_bac   0018AF R   |   1 loop_dep   00001C R   |   5 loop_don   0018C4 R
  5 lshift     001F39 R   |   5 lt         001605 R   |   5 lt_tst     000E5B R
  5 mem_peek   000B70 R   |   5 modulo     001117 R   |   5 move       0002B3 R
  5 move_dow   0002D1 R   |   5 move_exi   0002F2 R   |   5 move_loo   0002D6 R
  5 move_up    0002C3 R   |   5 mul_char   0015EF R   |   5 multiply   00108B R
  5 mulu24_8   000F3C R   |   5 nbr_tst    000D38 R   |   5 ne         00160A R
  5 neg_acc2   000A61 R   |   5 new        001AFE R   |   5 next       001867 R
  5 next_tok   0007FD R   |   5 no_match   00117D R   |   5 none       000CFD R
  5 number     000C01 GR  |   5 other      000E93 R   |   3 pad        001718 R
  5 parse_bi   000C9B R   |   5 parse_in   000C60 R   |   5 parse_ke   000CC3 R
  5 parse_qu   000C08 R   |   5 pause      001EB0 R   |   5 pause02    001EBA R
  5 peek       0017BE R   |   5 peek_byt   000B9B R   |   5 pin_mode   001F7F R
  5 plus_tst   000DEB R   |   5 poke       0017AB R   |   5 power_ad   0019C2 R
  5 prcnt_ts   000E0C R   |   5 print      00160D R   |   5 print_ex   001672 R
  5 print_fa   000BE0 R   |   5 print_in   000996 R   |   5 print_re   0008A3 R
  5 print_st   000B63 R   |   5 prt_basi   00149C R   |   5 prt_cmd_   00144C R
  5 prt_loop   001611 R   |   5 prt_peek   000263 R   |   5 prt_quot   001460 R
  5 prt_reg1   000884 R   |   5 prt_reg8   00085F R   |   5 prt_regs   0001F9 R
  5 prti24     00094E R   |   1 ptr16      000011 R   |   1 ptr8       000012 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]

Symbol Table

  5 putc       0001B3 R   |   5 puts       0001C5 R   |   5 qkey       001E3B R
  5 qmark_ts   000DC2 R   |   5 random     001FF4 R   |   5 readln     000A84 R
  5 readln_l   000A8A R   |   5 readln_q   000AFF R   |   5 regs_sta   00023C R
  5 rel_exit   001358 R   |   5 relation   001304 R   |   5 relop_st   0015F2 R
  5 rem        001712 R   |   5 repl       000B1C R   |   5 repl_exi   000B44 R
  5 reprint    000AAC R   |   5 reset_co   00160F R   |   5 rest_con   00168E R
  5 return     001928 R   |   5 right_ar   000AAC R   |   5 rparnt_t   000D80 R
  5 rshift     001F56 R   |   5 rt_msg     00070D R   |   5 run        001948 R
  5 save       001BC0 R   |   5 save_con   00167E R   |   5 search_d   00115A R
  5 search_e   0011AB R   |   5 search_f   001B75 R   |   5 search_l   0002F5 R
  5 search_l   0002FD R   |   5 search_n   00115E R   |   1 seedx      00000C R
  1 seedy      00000E R   |   5 seek_fdr   001B17 R   |   5 select_p   001FC4 R
  5 sharp_ts   000DA1 R   |   5 show       00135B R   |   5 single_c   0015EB R
  5 size       001375 R   |   5 skip       000F76 R   |   5 slash_ts   000E01 R
  5 sleep      001EA5 R   |   5 software   00051B R   |   5 spaces     0001ED R
  3 stack_fu   001780 R   |   3 stack_un   001800 R   |   5 star_tst   000DF6 R
  5 step       00183F R   |   5 stop       00198B R   |   5 store      000FF6 R
  5 store_lo   001851 R   |   5 str_matc   00118C R   |   5 str_tst    000D27 R
  5 strcmp     000294 R   |   5 strcpy     0002A5 R   |   5 strlen     000287 R
  5 substrac   001085 R   |   5 syntax_e   00071D R   |   1 tab_widt   000020 R
  5 tb_error   00071F R   |   5 term       001273 R   |   5 term01     00127C R
  5 term_exi   0012BD R   |   5 test_p     000B5B R   |   3 tib        0016C8 R
  5 tick_tst   000DD9 R   |   1 ticks      00000A R   |   5 timer4_i   0000AF R
  5 to         00180F R   |   5 to_upper   000EBE GR  |   5 token_ch   000EA2 R
  5 token_ex   000EB2 R   |   1 txtbgn     000018 R   |   1 txtend     00001A R
  5 uart1_in   000178 R   |   5 uart1_se   000188 R   |   5 ubound     00137F R
  5 uflash     001E78 R   |   5 unget_to   000F89 R   |   5 unlock_e   0000C4 R
  5 unlock_f   0000D2 R   |   5 user_spa   002380 R   |   5 usr        001E7E R
  1 vars       000021 R   |   5 wait       001718 R   |   5 warm_sta   000771 R
  5 words      00205E R   |   5 write      001DCD R   |   5 write_bl   000155 R
  5 write_by   0000E0 R   |   5 write_ee   00011C R   |   5 write_ex   000150 R
  5 write_fl   000106 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     55   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   238E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

