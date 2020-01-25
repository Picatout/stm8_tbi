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
      008000 82 00 85 D4             99     int cold_start
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    148 ; software interrupt handler  
                                    149 ;------------------------------------
                           000001   150 .if DEBUG 
      00808A                        151 TrapHandler:
      00808A 72 12 00 20      [ 1]  152 	bset flags,#FTRAP 
      00808E CD 89 1A         [ 4]  153 	call print_registers
      008091 CD 8B 85         [ 4]  154 	call cmd_itf
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
      0080D6 CD 8A 0D         [ 4]  192 	call print_int  	
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080F1 A6 5E            [ 1]  203 	ld a,#'^
      0080F3 CD 82 26         [ 4]  204 	call putc 
      0080F6                        205 9$:
      0080F6 AE 17 FF         [ 2]  206     ldw x,#STACK_EMPTY 
      0080F9 94               [ 1]  207     ldw sp,x
      0080FA 9A               [ 1]  208 	rim 
      0080FB CC 87 E8         [ 2]  209 	jp warm_start
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
      008172 90 A3 A3 00      [ 2]  371     cpw y,#user_space
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
      0081E4 5C               [ 1]  443 	incw x 
      0081E5 90 5C            [ 1]  444 	incw y 
      0081E7 1F 01            [ 2]  445 	ldw (XSAVE,sp),x
      0081E9 1E 05            [ 2]  446 	ldw x,(BSIZE,sp)
      0081EB 5A               [ 2]  447 	decw x
      0081EC 1F 05            [ 2]  448 	ldw (BSIZE,sp),x 
      0081EE 26 ED            [ 1]  449 	jrne 1$
      0081F0                        450 9$:
      0081F0 1E 01            [ 2]  451 	ldw x,(XSAVE,sp)
      0081F2 CD 9B 0D         [ 4]  452 	call incr_farptr
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      0081F8 72 16 50 C7      [ 1]  469 	bset CLK_PCKENR1,#CLK_PCKENR1_UART3 
                                    470 	; configure tx pin
      0081FC 72 1A 50 11      [ 1]  471 	bset PD_DDR,#BIT5 ; tx pin
      008200 72 1A 50 12      [ 1]  472 	bset PD_CR1,#BIT5 ; push-pull output
      008204 72 1A 50 13      [ 1]  473 	bset PD_CR2,#BIT5 ; fast output
      008208                        474 uart3_set_baud: 
                                    475 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008239 27 06            [ 1]  524 	jreq 1$
      00823B CD 82 26         [ 4]  525 	call putc 
      00823E 5C               [ 1]  526 	incw x 
      00823F 20 F7            [ 2]  527 	jra puts 
      008241 81               [ 4]  528 1$:	ret 
                                    529 
                                    530 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      00826B                        579 9$: 
      00826B 81               [ 4]  580 	ret 
                                    581 
                           000001   582 .if DEBUG 
                                    583 ;---------------------------------
                                    584 ;; print actual registers states 
                                    585 ;; as pushed on stack 
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
      008274 AE 89 AA         [ 2]  598 	ldw x,#REG_EPC 
      008277 CD 88 FB         [ 4]  599 	call prt_reg16 
                                    600 ; register CC 
      00827A 7B 08            [ 1]  601 	ld a,(R_CC,sp)
      00827C AE 89 BB         [ 2]  602 	ldw x,#REG_CC 
      00827F CD 88 D6         [ 4]  603 	call prt_reg8 
                                    604 ; register A 
      008282 7B 07            [ 1]  605 	ld a,(R_A,sp)
      008284 AE 89 B7         [ 2]  606 	ldw x,#REG_A 
      008287 CD 88 D6         [ 4]  607 	call prt_reg8 
                                    608 ; register X 
      00828A 16 05            [ 2]  609 	ldw y,(R_X,sp)
      00828C AE 89 B3         [ 2]  610 	ldw x,#REG_X 
      00828F CD 88 FB         [ 4]  611 	call prt_reg16 
                                    612 ; register Y 
      008292 16 03            [ 2]  613 	ldw y,(R_Y,sp)
      008294 AE 89 AF         [ 2]  614 	ldw x,#REG_Y 
      008297 CD 88 FB         [ 4]  615 	call prt_reg16 
                                    616 ; register SP 
      00829A 90 96            [ 1]  617 	ldw y,sp
      00829C 72 A9 00 08      [ 2]  618 	addw y,#6+ARG_OFS  
      0082A0 AE 89 C0         [ 2]  619 	ldw x,#REG_SP
      0082A3 CD 88 FB         [ 4]  620 	call prt_reg16
      0082A6 A6 0D            [ 1]  621 	ld a,#CR 
      0082A8 CD 82 26         [ 4]  622 	call putc
      0082AB CD 82 26         [ 4]  623 	call putc   
      0082AE 81               [ 4]  624 	ret 
                                    625 
      0082AF 0A 72 65 67 69 73 74   626 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal  2D-Bits]



             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    627 
                                    628 
                                    629 ;--------------------
                                    630 ; print content at address in hex.
                                    631 ; input:
                                    632 ;   X 	address to peek 
                                    633 ; output:
                                    634 ;	none 
                                    635 ;--------------------	
      000256                        636 prt_peek:
      0082C5 2D               [ 2]  637 	pushw x 
      0082C6 2D 2D 2D         [ 2]  638 	ldw acc16,x 
      0082C9 2D 2D 2D 2D      [ 1]  639 	clr acc24 
      0082CD 2D               [ 1]  640 	clrw x 
      0082CE 2D 2D            [ 1]  641 	ld a,#16 
      0082D0 2D 2D 2D         [ 4]  642 	call prti24 
      0082D3 2D 0A            [ 1]  643 	ld a,#': 
      0082D5 00 01 A6         [ 4]  644 	call putc 
      0082D6 A6 20            [ 1]  645 	ld a,#SPACE 
      0082D6 89 CF 00         [ 4]  646 	call putc 
      0082D9 09               [ 2]  647 	popw x 
      0082DA 72               [ 1]  648 	ld a,(x)
      0082DB 5F 00 08         [ 1]  649 	ld acc8,a 
      0082DE 5F               [ 1]  650 	clrw x 
      0082DF A6 10            [ 1]  651 	ld a,#16 
      0082E1 CD 89 C5         [ 4]  652 	call prti24
      0082E4 A6               [ 4]  653 	ret 
                                    654 .endif ; DEBUG  
                                    655 
                                    656 ;-------------------------------------
                                    657 ; retrun string length
                                    658 ; input:
                                    659 ;   X         .asciz  
                                    660 ; output:
                                    661 ;   X         length 
                                    662 ;-------------------------------------
      00027A                        663 strlen:
      0082E5 3A CD            [ 1]  664 	ldw y,x 
      0082E7 82               [ 1]  665 	clrw x 
      0082E8 26 A6            [ 1]  666 1$:	tnz (y) 
      0082EA 20 CD            [ 1]  667 	jreq 9$ 
      0082EC 82               [ 1]  668 	incw x
      0082ED 26 85            [ 1]  669 	incw y 
      0082EF F6 C7            [ 2]  670 	jra 1$ 
      0082F1 00               [ 4]  671 9$: ret 
                                    672 
                                    673 ;------------------------------------
                                    674 ; compare 2 strings
                                    675 ; input:
                                    676 ;   X 		char* first string 
                                    677 ;   Y       char* second string 
                                    678 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    679 ;   A 		0|1 
                                    680 ;-------------------------------------
      000287                        681 strcmp:
      0082F2 0A               [ 1]  682 	ld a,(x)
      0082F3 5F A6            [ 1]  683 	jreq 5$ 
      0082F5 10 CD            [ 1]  684 	cp a,(y) 
      0082F7 89 C5            [ 1]  685 	jrne 4$ 
      0082F9 81               [ 1]  686 	incw x 
      0082FA 90 5C            [ 1]  687 	incw y 
      0082FA 90 93            [ 2]  688 	jra strcmp 
      000293                        689 4$: ; not same  
      0082FC 5F               [ 1]  690 	clr a 
      0082FD 90               [ 4]  691 	ret 
      000295                        692 5$: ; same 
      0082FE 7D 27            [ 1]  693 	ld a,#1 
      008300 05               [ 4]  694 	ret 
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
      000298                        705 strcpy:
      008301 5C               [ 2]  706 	pushw x 
      008302 90 5C            [ 1]  707 1$: ld a,(y)
      008304 20 F7            [ 1]  708 	jreq 9$ 
      008306 81               [ 1]  709 	ld (x),a 
      008307 5C               [ 1]  710 	incw x 
      008307 F6 27            [ 1]  711 	incw y 
      008309 0B 90            [ 2]  712 	jra 1$ 
      00830B F1               [ 1]  713 9$:	clr (x)
      00830C 26               [ 2]  714 	popw x 
      00830D 05               [ 4]  715 	ret 
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
      0002A6                        729 move:
      0002A6                        730 	_vars VSIZE 
      00830E 5C 90            [ 2]    1     sub sp,#VSIZE 
      008310 5C 20            [ 1]  731 	clr (INCR,sp)
      008312 F4 02            [ 1]  732 	clr (LB,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008313 90 89            [ 2]  733 	pushw y 
      008313 4F 81            [ 2]  734 	cpw x,(1,sp) ; compare DEST to SRC 
      008315 90 85            [ 2]  735 	popw y 
      008315 A6 01            [ 1]  736 	jreq move_exit ; x==y 
      008317 81 0E            [ 1]  737 	jrmi move_down
      008318                        738 move_up: ; start from top address with incr=-1
      008318 89 90 F6 27      [ 2]  739 	addw x,acc16
      00831C 06 F7 5C 90      [ 2]  740 	addw y,acc16
      008320 5C 20            [ 1]  741 	cpl (INCR,sp)
      008322 F6 7F            [ 1]  742 	cpl (LB,sp)   ; increment = -1 
      008324 85 81            [ 2]  743 	jra move_loop  
      008326                        744 move_down: ; start from bottom address with incr=1 
      008326 52               [ 2]  745     decw x 
      008327 02 0F            [ 2]  746 	decw y
      008329 01 0F            [ 1]  747 	inc (LB,sp) ; incr=1 
      0002C9                        748 move_loop:	
      00832B 02 90 89         [ 1]  749     ld a, acc16 
      00832E 13 01 90         [ 1]  750 	or a, acc8
      008331 85 27            [ 1]  751 	jreq move_exit 
      008333 31 2B 0E         [ 2]  752 	addw x,(INCR,sp)
      008336 72 F9 01         [ 2]  753 	addw y,(INCR,sp) 
      008336 72 BB            [ 1]  754 	ld a,(y)
      008338 00               [ 1]  755 	ld (x),a 
      008339 09               [ 2]  756 	pushw x 
      00833A 72 B9 00         [ 2]  757 	ldw x,acc16 
      00833D 09               [ 2]  758 	decw x 
      00833E 03 01 03         [ 2]  759 	ldw acc16,x 
      008341 02               [ 2]  760 	popw x 
      008342 20 05            [ 2]  761 	jra move_loop
      008344                        762 move_exit:
      0002E5                        763 	_drop VSIZE
      008344 5A 90            [ 2]    1     addw sp,#VSIZE 
      008346 5A               [ 4]  764 	ret 	
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
      0002E8                        778 search_lineno:
      0002E8                        779 	_vars VSIZE
      008347 0C 02            [ 2]    1     sub sp,#VSIZE 
      008349 0F 01            [ 1]  780 	clr (LL,sp)
      008349 C6 00 09 CA      [ 2]  781 	ldw y,txtbgn
      0002F0                        782 search_ln_loop:
      00834D 00 0A 27 14      [ 2]  783 	cpw y,txtend 
      008351 72 FB            [ 1]  784 	jrpl 8$
      008353 01 72            [ 1]  785 	cpw x,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      008355 F9 01            [ 1]  786 	jreq 9$
      008357 90 F6            [ 1]  787 	jrmi 8$ 
      008359 F7 89 CE         [ 1]  788 	ld a,(2,y)
      00835C 00 09            [ 1]  789 	ld (LB,sp),a 
      00835E 5A CF 00         [ 2]  790 	addw y,(LL,sp)
      008361 09 85            [ 2]  791 	jra search_ln_loop 
      000306                        792 8$: 
      008363 20               [ 1]  793 	clrw x 	
      008364 E4               [ 1]  794 	exgw x,y 
      008365                        795 9$: _drop VSIZE
      008365 5B 02            [ 2]    1     addw sp,#VSIZE 
      008367 81               [ 1]  796 	exgw x,y   
      008368 81               [ 4]  797 	ret 
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
      00030C                        809 del_line: 
      00030C                        810 	_vars VSIZE 
      008368 52 02            [ 2]    1     sub sp,#VSIZE 
      00836A 0F 01            [ 1]  811 	ld a,(2,x) ; line length
      00836C 90 CE            [ 1]  812 	ld (LLEN+1,sp),a 
      00836E 00 19            [ 1]  813 	clr (LLEN,sp)
      008370 90 93            [ 1]  814 	ldw y,x  
      008370 90 C3 00         [ 2]  815 	addw y,(LLEN,sp) ;SRC  
      008373 1B 2A            [ 2]  816 	ldw (SRC,sp),y  ;save source 
      008375 10 90 F3 27      [ 2]  817 	ldw y,txtend 
      008379 0E 2B 0A         [ 1]  818 	ld a,(2,y)
      00837C 90 E6            [ 1]  819 	clrw y 
      00837E 02 6B            [ 1]  820 	ld yl,a  
      008380 02 72 F9 01      [ 2]  821 	addw y,txtend
      008384 20 EA 03         [ 2]  822 	subw y,(SRC,sp) ; y=count 
      008386 90 CF 00 08      [ 2]  823 	ldw acc16,y 
      008386 5F 51            [ 2]  824 	ldw y,(SRC,sp)    ; source
      008388 5B 02 51         [ 4]  825 	call move
      00838B 81 CE 00 1A      [ 2]  826 	ldw y,txtend 
      00838C 72 F2 01         [ 2]  827 	subw y,(LLEN,sp)
      00838C 52 04 E6 02      [ 2]  828 	ldw txtend,y  
      000341                        829 	_drop VSIZE     
      008390 6B 02            [ 2]    1     addw sp,#VSIZE 
      008392 0F               [ 4]  830 	ret 
                                    831 
                                    832 ;---------------------------------------------
                                    833 ; create a gap in text area 
                                    834 ; move new line to insert in gap with end of text
                                    835 ; otherwise it would be overwritten.
                                    836 ; input:
                                    837 ;    X 			addr gap start 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    838 ;    Y 			gap length 
                                    839 ; output:
                                    840 ;    X 			addr gap start 
                                    841 ;--------------------------------------------
                           000001   842 	DEST=1
                           000003   843 	SRC=3
                           000005   844 	LEN=5
                           000006   845 	VSIZE=6 
      000344                        846 create_gap:
      000344                        847 	_vars VSIZE
      008393 01 90            [ 2]    1     sub sp,#VSIZE 
      008395 93 72            [ 2]  848 	ldw (SRC,sp),x 
      008397 F9 01            [ 2]  849 	ldw (LEN,sp),y 
      008399 17 03 90 CE      [ 2]  850 	ldw acc16,y 
      00839D 00 1B            [ 1]  851 	ldw y,x ; SRC
      00839F 90 E6 02 90      [ 2]  852 	addw x,acc16  
      0083A3 5F 90            [ 2]  853 	ldw (DEST,sp),x 
                                    854 ;compute size to move 	
      0083A5 97 72 B9         [ 2]  855 	ldw x,txtend 
      0083A8 00 1B            [ 1]  856 	ld a,(2,x) ; pending line length 
      0083AA 72 F2 03         [ 1]  857 	ld acc8,a 
      0083AD 90 CF 00 09      [ 1]  858 	clr acc16 
      0083B1 16 03 CD 83      [ 2]  859 	addw x,acc16 
      0083B5 26 90 CE         [ 2]  860 	subw x,(SRC,sp)
      0083B8 00 1B 72         [ 2]  861 	ldw acc16,x ; size to move
      0083BB F2 01            [ 2]  862 	ldw x,(DEST,sp) 
      0083BD 90 CF 00         [ 4]  863 	call move
      0083C0 1B 5B 04         [ 2]  864 	ldw x,txtend
      0083C3 81 FB 05         [ 2]  865 	addw x,(LEN,sp)
      0083C4 CF 00 1A         [ 2]  866 	ldw txtend,x
      00037A                        867 9$:	_drop VSIZE 
      0083C4 52 06            [ 2]    1     addw sp,#VSIZE 
      0083C6 1F               [ 4]  868 	ret 
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
      00037D                        886 insert_line:
      00037D                        887 	_vars VSIZE 
      0083C7 03 17            [ 2]    1     sub sp,#VSIZE 
      0083C9 05 90 CF         [ 2]  888 	ldw x,ptr16  
      0083CC 00 09 90         [ 2]  889 	cpw x,txtbgn 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0083CF 93 72            [ 1]  890 	jrne 0$
                                    891 ;first text line 
      0083D1 BB 00 09         [ 2]  892 	ldw x,#2 
      0083D4 1F 01 CE 00      [ 4]  893 	ld a,([ptr16],x)
      0083D8 1B               [ 1]  894 	clrw x 
      0083D9 E6               [ 1]  895 	ld xl,a
      0083DA 02 C7            [ 2]  896 	ldw (LLEN,sp),x  
      0083DC 00 0A            [ 2]  897 	jra 5$
      0083DE 72 5F 00 09      [ 5]  898 0$:	ldw x,[ptr16]
                                    899 ; new line number
      0083E2 72 BB            [ 2]  900 	ldw (LINENO,sp),x 
      0083E4 00 09 72         [ 2]  901 	ldw x,#2 
      0083E7 F0 03 CF 00      [ 4]  902 	ld a,([ptr16],x)
      0083EB 09               [ 1]  903 	ld xl,a
                                    904 ; new line length
      0083EC 1E 01            [ 2]  905 	ldw (LLEN,sp),x
                                    906 ; check if that line number already exit 	
      0083EE CD 83            [ 2]  907 	ldw x,(LINENO,sp)
      0083F0 26 CE 00         [ 4]  908 	call search_lineno 
      0083F3 1B               [ 2]  909 	tnzw x 
      0083F4 72 FB            [ 1]  910 	jrne 2$
                                    911 ; line doesn't exit
                                    912 ; it will be inserted at this point.  	
      0083F6 05 CF            [ 2]  913 	ldw (DEST,sp),y 
      0083F8 00 1B            [ 2]  914 	jra 3$
                                    915 ; line exit delete it.
                                    916 ; it will be replaced by new one 	
      0083FA 5B 06            [ 2]  917 2$: ldw (DEST,sp),x 
      0083FC 81 03 0C         [ 4]  918 	call del_line
      0083FD                        919 3$: 
                                    920 ; insert new line or leave if LLEN==3
                                    921 ; LLEN==3 means empty line 
      0083FD 52 08            [ 1]  922 	ld a,#3
      0083FF CE 00            [ 1]  923 	cp a,(LLEN+1,sp)
      008401 12 C3            [ 1]  924 	jreq insert_ln_exit ; empty line exit.
                                    925 ; if insertion point at txtend 
                                    926 ; no move required 
      008403 00 19            [ 2]  927 	ldw x,(DEST,sp)
      008405 26 0D AE         [ 2]  928 	cpw x,txtend 
      008408 00 02            [ 1]  929 	jrpl 5$ 
                                    930 ; must create a gap
                                    931 ; at insertion point  
      00840A 72 D6            [ 2]  932 	ldw x,(DEST,sp)
      00840C 00 12            [ 2]  933 	ldw y,(LLEN,sp)
      00840E 5F 97 1F         [ 4]  934 	call create_gap 
                                    935 ; move new line in gap 
      008411 07 20            [ 2]  936 	ldw x,(LLEN,sp)
      008413 45 72 CE         [ 2]  937 	ldw acc16,x 
      008416 00 12 1F 05      [ 2]  938 	ldw y,txtend ;SRC 
      00841A AE 00            [ 2]  939 	ldw x,(DEST,sp) ; dest address 
      00841C 02 72 D6         [ 4]  940 	call move 
      00841F 00 12            [ 2]  941 	jra insert_ln_exit  
      0003D9                        942 5$: ; no move required 
      008421 97 1F            [ 2]  943 	ldw x,(LLEN,sp) 
      008423 07 1E 05 CD      [ 2]  944 	addw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008427 83 68 5D         [ 2]  945 	ldw txtend,x 
      0003E2                        946 insert_ln_exit:	
      0003E2                        947 	_drop VSIZE
      00842A 26 04            [ 2]    1     addw sp,#VSIZE 
      00842C 17               [ 4]  948 	ret
                                    949 
                                    950 
                                    951 ;-----------------------------
                                    952 ; check if text buffer full
                                    953 ; input:
                                    954 ;   ptr16     addr start tokenize line 
                                    955 ;   X         buffer index 
                                    956 ; output:
                                    957 ;   none 
                                    958 ;-----------------------------------
      0003E5                        959 check_full:
      00842D 01 20 05 1F      [ 2]  960 	addw x,ptr16 
      008431 01 CD 83         [ 2]  961 	cpw x,#tib 
      008434 8C 05            [ 1]  962 	jrult 1$
      008435 A6 01            [ 1]  963 	ld a,#ERR_MEM_FULL
      008435 A6 03 11         [ 2]  964 	jp tb_error 
      008438 08               [ 4]  965 1$: ret 
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
      0003F4                        987 compile:
      0003F4                        988 	_vars VSIZE 
      008439 27 27            [ 2]    1     sub sp,#VSIZE 
      00843B 1E 01 C3 00      [ 1]  989 	bset flags,#FCOMP 
      00843F 1B 2A 17         [ 2]  990 	ldw x,txtend
      008442 1E 01 16         [ 2]  991 	ldw ptr16,x 
      008445 07               [ 1]  992 	clrw x 
      008446 CD 83 C4         [ 2]  993 	ldw x,#3
      008449 1E 07            [ 2]  994 	ldw (BUFIDX,sp),X  
      00844B CF 00 09         [ 4]  995 	call check_full
      00844E 90               [ 1]  996 	clrw x 
      00844F CE 00 1B 1E      [ 5]  997 	ldw [ptr16],x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008453 01 CD 83         [ 4]  998 	call get_token
      008456 26 20            [ 2]  999 	ldw (XSAVE,sp),x 
      008458 09 04            [ 1] 1000 	cp a,#TK_INTGR 
      008459 26 11            [ 1] 1001 	jrne 3$
      008459 1E 07 72         [ 2] 1002 	cpw x,#0  
      00845C BB 00            [ 1] 1003 	jrugt 1$
      00845E 1B CF 00         [ 2] 1004 	jp syntax_error 
      008461 1B CF 00 11      [ 5] 1005 1$:	ldw [ptr16],x; line number
      008462 CD 0C F4         [ 4] 1006 2$:	call get_token
      008462 5B 08            [ 2] 1007 	ldw (XSAVE,sp),x 
      008464 81 00            [ 1] 1008 3$:	cp a,#TK_NONE 
      008465 26 03            [ 1] 1009 	jrne 30$
      008465 72 BB 00         [ 2] 1010 	jp 9$
      00042F                       1011 30$: 	 
      008468 12 A3            [ 2] 1012 	ldw x,(BUFIDX,sp)
      00846A 16 C8 25         [ 4] 1013 	call check_full 
      00846D 05 A6            [ 2] 1014 	ldw y,(BUFIDX,sp) 
      00846F 01 CC 87         [ 4] 1015 	ld ([ptr16],y),a ; token attribute 
      008472 96 81            [ 1] 1016 	incw y
      008474 17 03            [ 2] 1017 	ldw (BUFIDX,sp),y
      008474 52 04            [ 1] 1018 	cp a,#TK_COLON 
      008476 72 1A            [ 1] 1019 	jrne 31$
      008478 00 20            [ 2] 1020 	jra 2$ 
      000443                       1021 31$:
      00847A CE 00            [ 1] 1022 	cp a,#TK_CHAR
      00847C 1B CF            [ 1] 1023 	jrne 32$ 
      00847E 00 12            [ 2] 1024 	ldw x,(XSAVE,sp)
      008480 5F               [ 1] 1025 	ld a,xl 
      008481 AE 00 03         [ 4] 1026 	ld ([ptr16],y),a
      008484 1F 03            [ 1] 1027 	incw y 
      008486 CD 84            [ 2] 1028 	ldw (BUFIDX,sp),y 
      008488 65 5F            [ 2] 1029 	jra 2$ 
      000453                       1030 32$:
      00848A 72 CF            [ 1] 1031 	cp a,#TK_ARRAY 
      00848C 00 12            [ 1] 1032 	jreq 2$ 
      00848E CD 8D            [ 1] 1033 	cp a,#TK_QSTR 
      008490 74 1F            [ 1] 1034 	jrne 4$
      008492 01 A1 04         [ 2] 1035 	ldw x,#pad 
      008495 26 11 A3         [ 4] 1036 	call strlen
      008498 00               [ 1] 1037 	incw x  
      008499 00 22 03         [ 4] 1038 	call check_full 
      00849C CC 87 94 72      [ 2] 1039 	ldw y,#pad 
      0084A0 CF 00 12         [ 2] 1040 	ldw x,ptr16
      0084A3 CD 8D 74         [ 2] 1041 	addw x,(BUFIDX,sp)	
      0084A6 1F 01 A1         [ 4] 1042 	call strcpy 
      0084A9 00 26 03         [ 2] 1043 	ldw x,#pad 
      0084AC CC 85 3F         [ 4] 1044 	call strlen 
      0084AF 5C               [ 1] 1045 	incw x
      0084AF 1E 03 CD         [ 2] 1046 	addw x,(BUFIDX,sp) 
      0084B2 84 65            [ 2] 1047 	ldw (BUFIDX,sp),x
      0084B4 16 03            [ 2] 1048 	jra 2$  
      0084B6 91 D7            [ 1] 1049 4$: cp a,#TK_INTGR
      0084B8 12 90            [ 1] 1050 	jrult 2$
      0084BA 5C 17            [ 1] 1051 	cp a,#TK_CONST 
      0084BC 03 A1            [ 1] 1052 	Jrugt 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      0084BE 01 26            [ 2] 1053 	ldw x,(XSAVE,sp) 
      0084C0 02 20            [ 2] 1054 	ldw y,(BUFIDX,sp)
      0084C2 E0 DF 11         [ 5] 1055 	ldw ([ptr16],y),x
      0084C3 A3 17 07         [ 2] 1056 	cpw x,#rem 
      0084C3 A1 03            [ 1] 1057 	jrne 5$	
                                   1058 ; comment advance in.w to eol 
      0084C5 26 0C 1E 01      [ 2] 1059 	addw y,#2 ; skip exec address 
      0084C9 9F 91            [ 2] 1060 	ldw (BUFIDX,sp),y 
      0084CB D7 12 90         [ 2] 1061 	ldw x,ptr16 
      0084CE 5C 17 03         [ 2] 1062 	addw x,(BUFIDX,sp)
      0084D1 20 D0 00 00      [ 2] 1063 	ldw y,in.w 
      0084D3 72 A9 16 C8      [ 2] 1064 	addw y,#tib 
      0084D3 A1 02 27         [ 4] 1065 	call strcpy 	
      0084D6 CC A1 0A         [ 4] 1066 	call strlen 
      0084D9 26               [ 1] 1067 	incw x ; skip string 0. 
      0084DA 25 AE 17         [ 2] 1068 	addw x,(BUFIDX,sp)
      0084DD 18 CD            [ 2] 1069 	ldw (BUFIDX,sp),x 
      0084DF 82 FA            [ 2] 1070 	jra 9$
      0084E1 5C CD 84 65      [ 2] 1071 5$:	addw y,#2 
      0084E5 90 AE            [ 2] 1072 	ldw (BUFIDX,sp),y 
      0084E7 17 18 CE         [ 2] 1073 	jp 2$
      0004BF                       1074 9$: 
      0084EA 00 12 72         [ 2] 1075 	ldw x,#2
      0084ED FB 03            [ 2] 1076 	ldw y,(BUFIDX,sp)
      0084EF CD 83            [ 1] 1077 	ld a,yl 
      0084F1 18 AE 17 18      [ 4] 1078 	ld ([ptr16],x),a  	
      0084F5 CD 82 FA 5C      [ 5] 1079 	ldw x,[ptr16]
      0084F9 72 FB            [ 1] 1080 	jreq 10$
      0084FB 03 1F 03         [ 4] 1081 	call insert_line
      0084FE 20 A3 A1 04      [ 1] 1082 	clr  count 
      008502 25 9F            [ 2] 1083 	jra  11$ 
      0004D9                       1084 10$: 
      008504 A1 09 22         [ 2] 1085 	ldw x,ptr16 
      008507 9B 1E 01         [ 2] 1086 	ldw basicptr,x 
      00850A 16 03            [ 1] 1087 	ld a,(2,x)
      00850C 91 DF 12         [ 1] 1088 	ld count,a 
      00850F A3 97 87 26      [ 1] 1089 	mov in,#3 
      0004E8                       1090 11$:
      0004E8                       1091 	_drop VSIZE 
      008513 22 72            [ 2]    1     addw sp,#VSIZE 
      008515 A9 00 02 17      [ 1] 1092 	bres flags,#FCOMP 
      008519 03               [ 4] 1093 	ret 
                                   1094 
                                   1095 
                                   1096 ;------------------------------------
                                   1097 ;  set all variables to zero 
                                   1098 ; input:
                                   1099 ;   none 
                                   1100 ; output:
                                   1101 ;	none
                                   1102 ;------------------------------------
      0004EF                       1103 clear_vars:
      00851A CE 00 12         [ 2] 1104 	ldw x,#vars 
      00851D 72 FB 03 90      [ 2] 1105 	ldw y,#2*26 
      008521 CE               [ 1] 1106 1$:	clr (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      008522 00               [ 1] 1107 	incw x 
      008523 01 72            [ 2] 1108 	decw y 
      008525 A9 16            [ 1] 1109 	jrne 1$
      008527 C8               [ 4] 1110 	ret 
                                   1111 
                                   1112 ;-------------------------------------
                                   1113 ; check if A is a letter
                                   1114 ; input:
                                   1115 ;   A 			character to test 
                                   1116 ; output:
                                   1117 ;   C flag      1 true, 0 false 
                                   1118 ;-------------------------------------
      0004FD                       1119 is_alpha:
      008528 CD 83            [ 1] 1120 	cp a,#'A 
      00852A 18               [ 1] 1121 	ccf
      00852B CD 82            [ 1] 1122 	jrnc 9$ 
      00852D FA 5C            [ 1] 1123 	cp a,#'Z+1 
      00852F 72 FB            [ 1] 1124 	jrc 9$ 
      008531 03 1F            [ 1] 1125 	cp a,#'a 
      008533 03               [ 1] 1126 	ccf 
      008534 20 09            [ 1] 1127 	jrnc 9$
      008536 72 A9            [ 1] 1128 	cp a,#'z+1   
      008538 00               [ 4] 1129 9$: ret 	
                                   1130 
                                   1131 ;-------------------------------------
                                   1132 ;  program initialization entry point 
                                   1133 ;-------------------------------------
                           000001  1134 	MAJOR=1
                           000000  1135 	MINOR=0
      008539 02 17 03 CC 84 A3 20  1136 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      00853F                       1137 cold_start:
                                   1138 ;set stack 
      00853F AE 00 02         [ 2] 1139 	ldw x,#STACK_EMPTY
      008542 16               [ 1] 1140 	ldw sp,x   
                                   1141 ; clear all ram 
      008543 03               [ 1] 1142 0$: clr (x)
      008544 90               [ 2] 1143 	decw x 
      008545 9F 72            [ 1] 1144 	jrne 0$
                                   1145 ; activate pull up on all inputs 
      008547 D7 00            [ 1] 1146 	ld a,#255 
      008549 12 72 CE         [ 1] 1147 	ld PA_CR1,a 
      00854C 00 12 27         [ 1] 1148 	ld PB_CR1,a 
      00854F 09 CD 83         [ 1] 1149 	ld PC_CR1,a 
      008552 FD 72 5F         [ 1] 1150 	ld PD_CR1,a 
      008555 00 04 20         [ 1] 1151 	ld PE_CR1,a 
      008558 0F 50 1C         [ 1] 1152 	ld PF_CR1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008559 C7 50 21         [ 1] 1153 	ld PG_CR1,a 
      008559 CE 00 12         [ 1] 1154 	ld PI_CR1,a 
                                   1155 ; disable schmitt triggers on Arduino CN4 analog inputs
      00855C CF 00 05 E6 02   [ 1] 1156 	mov ADC_TDRL,0x3f
                                   1157 ; disable peripherals clocks
      008561 C7 00 04 35      [ 1] 1158 	clr CLK_PCKENR1 
      008565 03 00 02 CA      [ 1] 1159 	clr CLK_PCKENR2 
                                   1160 			
                                   1161 ; select internal clock no divisor: 16 Mhz 	
      008568 A6 E1            [ 1] 1162 	ld a,#CLK_SWR_HSI 
      008568 5B               [ 1] 1163 	clrw x  
      008569 04 72 1B         [ 4] 1164     call clock_init 
      00856C 00 20 81         [ 4] 1165 	call timer4_init
                                   1166 ; UART3 at 115200 BAUD
      00856F CD 01 78         [ 4] 1167 	call uart3_init
                                   1168 ; activate PE_4 (user button interrupt)
      00856F AE 00 22 90      [ 1] 1169     bset PE_CR2,#USR_BTN_BIT 
                                   1170 ; display system information
      008573 AE 00 34         [ 2] 1171 	ldw x,#software 
      008576 7F 5C 90         [ 4] 1172 	call puts 
      008579 5A 26            [ 1] 1173 	ld a,#MAJOR 
      00857B FA 81 09         [ 1] 1174 	ld acc8,a 
      00857D 5F               [ 1] 1175 	clrw x 
      00857D A1 41 8C         [ 2] 1176 	ldw acc24,x 
      008580 24 0B            [ 1] 1177 	ld a,#10 
      008582 A1 5B 25         [ 4] 1178 	call prti24 
      008585 07 A1            [ 1] 1179 	ld a,#'.
      008587 61 8C 24         [ 4] 1180 	call putc 
      00858A 02 A1            [ 1] 1181 	ld a,#MINOR 
      00858C 7B 81 0A         [ 1] 1182 	ld acc8,a 
      00858F 0A               [ 1] 1183 	clrw x 
      008590 54 69 6E         [ 2] 1184 	ldw acc24,x 
      008593 79 20            [ 1] 1185 	ld a,#10 
      008595 42 41 53         [ 4] 1186 	call prti24 
      008598 49 43            [ 1] 1187 	ld a,#CR 
      00859A 20 66 6F         [ 4] 1188 	call putc 
      00859D 72 20 53         [ 4] 1189 	call seek_fdrive 
                                   1190 ; configure LD2 pin 
      0085A0 54 4D 38 0A      [ 1] 1191     bset PC_CR1,#LED2_BIT
      0085A4 43 6F 70 79      [ 1] 1192     bset PC_CR2,#LED2_BIT
      0085A8 72 69 67 68      [ 1] 1193     bset PC_DDR,#LED2_BIT
      0085AC 74               [ 1] 1194 	rim 
      0085AD 2C 20 4A 61      [ 1] 1195 	inc seedy+1 
      0085B1 63 71 75 65      [ 1] 1196 	inc seedx+1 
      0085B5 73 20 44         [ 4] 1197 	call clear_basic
      0085B8 65 73 63         [ 4] 1198 	call ubound 
      0085BB 68 65 6E         [ 4] 1199 	call dpop 
      0085BE 65 73 20         [ 2] 1200 	ldw array_size,x 
      0085C1 32 30 31         [ 2] 1201     jp warm_start 
                                   1202 
                                   1203 ;---------------------------
                                   1204 ; reset BASIC text variables 
                                   1205 ; and clear variables 
                                   1206 ;---------------------------
      0005E6                       1207 clear_basic:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0085C4 39 2C 32 30      [ 1] 1208 	clr count 
      0085C8 32 30 0A         [ 2] 1209 	ldw x,#free_ram 
      0085CB 76 65 72         [ 2] 1210 	ldw txtbgn,x 
      0085CE 73 69 6F         [ 2] 1211 	ldw txtend,x 
      0085D1 6E 20 00         [ 4] 1212 	call clear_vars 
      0085D4 81               [ 4] 1213 	ret 
                                   1214 
                                   1215 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1216 ;;   Tiny BASIC error messages     ;;
                                   1217 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      0005F7                       1218 err_msg:
      0085D4 AE 17 FF 94 7F 5A 26  1219 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             FC A6 FF C7 50
      0085E0 03 C7 50 08 C7 50 0D  1220 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             C7 50 12
      0085EA C7 50                 1221 	.word err_no_access 
                                   1222 
      0085EC 17 C7 50 1C C7 50 21  1223 err_mem_full: .asciz "\nMemory full\n" 
             C7 50 2B 55 00 3F 54
      0085FA 07 72 5F 50 C7 72 5F  1224 err_syntax: .asciz "\nsyntax error\n" 
             50 CA A6 E1 5F CD 81
             19
      008609 CD 81 2F CD 81 F8 72  1225 err_math_ovf: .asciz "\nmath operation overflow\n"
             18 50 18 AE 85 8E CD
             82 38 A6 01 C7 00 0A
             5F CF 00 08 A6
      008623 0A CD 89 C5 A6 2E CD  1226 err_div0: .asciz "\ndivision by 0\n" 
             82 26 A6 00 C7 00 0A
             5F CF
      008633 00 08 A6 0A CD 89 C5  1227 err_no_line: .asciz "\ninvalid line number.\n"
             A6 0D CD 82 26 CD 9B
             1B 72 1A 50 0D 72 1A
             50 0E
      00864A 72 1A 50 0C 9A 72 5C  1228 err_run_only: .asciz "\nrun time only usage.\n" 
             00 10 72 5C 00 0E CD
             86 66 CD 93 F4 CD 90
             13 CF
      008661 00 1E CC 87 E8 61 6E  1229 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      008666 0A 64 75 70 6C 69 63  1230 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      008666 72 5F 00 04 AE 00 56  1231 err_not_file: .asciz "\nFile not found.\n"
             CF 00 19 CF 00 1B CD
             85 6F 81 00
      008677 0A 62 61 64 20 76 61  1232 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      008677 00 00 86 8F 86 9D 86  1233 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             AC 86 C6 86 D6 86 ED
             87 04 87 1F 87 31 87
             43 87 50 0A 4D 65 6D
             6F 72 79 20 66 75 6C
             6C 0A 00 0A 73 79 6E
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal  74-Bits]



             6D 20 74 68 65 72 65
             2E 0A 00
                                   1234 
      0086A2 61 78 20 65 72 72 6F  1235 rt_msg: .asciz "last token id: "
             72 0A 00 0A 6D 61 74
             68 20
                                   1236 
      000714                       1237 syntax_error:
      0086B2 6F 70            [ 1] 1238 	ld a,#ERR_SYNTAX 
                                   1239 
      000716                       1240 tb_error:
      0086B4 65 72 61         [ 2] 1241 	ldw x, #err_msg 
      0086B7 74 69 6F 6E      [ 1] 1242 	clr acc16 
      0086BB 20               [ 1] 1243 	sll a
      0086BC 6F 76 65 72      [ 1] 1244 	rlc acc16  
      0086C0 66 6C 6F         [ 1] 1245 	ld acc8, a 
      0086C3 77 0A 00 0A      [ 2] 1246 	addw x,acc16 
      0086C7 64               [ 2] 1247 	ldw x,(x)
      0086C8 69 76 69         [ 4] 1248 	call puts
      0086CB 73 69 6F 6E 20   [ 2] 1249 	btjf flags,#FCOMP, 1$
      0086D0 62 79 20         [ 2] 1250 	ldw x,#tib
      0086D3 30 0A 00         [ 4] 1251 	call puts 
      0086D6 0A 69            [ 1] 1252 	ld a,#CR 
      0086D8 6E 76 61         [ 4] 1253 	call putc
      0086DB 6C 69 64         [ 2] 1254 	ldw x,in.w
      0086DE 20 6C 69         [ 4] 1255 	call spaces
      0086E1 6E 65            [ 1] 1256 	ld a,#'^
      0086E3 20 6E 75         [ 4] 1257 	call putc 
      0086E6 6D 62            [ 2] 1258 	jra 6$
      0086E8 65 72 2E         [ 2] 1259 1$:	ldw x,basicptr
      0086EB 0A 00 0A         [ 4] 1260 	call prt_basic_line
      0086EE 72 75 6E         [ 2] 1261 	ldw x,#rt_msg 
      0086F1 20 74 69         [ 4] 1262 	call puts 
      0086F4 6D               [ 1] 1263 	clrw x 
      0086F5 65 20 6F         [ 1] 1264 	ld a,in.saved 
      0086F8 6E               [ 1] 1265 	ld xl,a 
      0086F9 6C 79 20 75      [ 4] 1266 	ld a,([basicptr],x)
      0086FD 73               [ 1] 1267 	clrw x 
      0086FE 61               [ 1] 1268 	ld xl,a 
      0086FF 67 65 2E         [ 4] 1269 	call print_int 
      008702 0A 00 0A         [ 2] 1270 6$: ldw x,#STACK_EMPTY 
      008705 63               [ 1] 1271     ldw sp,x
      000768                       1272 warm_start:
      008706 6F 6D 6D 61      [ 1] 1273 	clr flags 
      00870A 6E 64 20 6C      [ 1] 1274 	clr loop_depth 
      00870E 69 6E 65         [ 2] 1275 	ldw x,#dstack_unf 
      008711 20 6F 6E         [ 2] 1276 	ldw dstkptr,x 
      008714 6C 79 20 75      [ 1] 1277 	mov tab_width,#TAB_WIDTH 
      008718 73 61 67 65      [ 1] 1278 	mov base,#10 
      00871C 2E 0A 00         [ 2] 1279 	ldw x,#tib 
      00871F 0A 64 75         [ 2] 1280 	ldw basicptr,x 
                                   1281 ;----------------------------
                                   1282 ;   BASIC interpreter
                                   1283 ;----------------------------
      000784                       1284 interp:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008722 70 6C 69 63      [ 1] 1285 	clr in.w
      008726 61 74 65 20 6E   [ 2] 1286 	btjf flags,#FRUN,4$ 
                                   1287 ; running program
                                   1288 ; goto next basic line 
      00872B 61 6D 65         [ 2] 1289 	ldw x,basicptr
      00872E 2E 0A            [ 1] 1290 	ld a,(2,x) ; line length 
      008730 00 0A 46         [ 1] 1291 	ld acc8,a 
      008733 69 6C 65 20      [ 1] 1292 	clr acc16 
      008737 6E 6F 74 20      [ 2] 1293 	addw x,acc16
      00873B 66 6F 75         [ 2] 1294 	cpw x,txtend 
      00873E 6E 64            [ 1] 1295 	jrpl warm_start
      008740 2E 0A 00         [ 2] 1296 	ldw basicptr,x ; start of next line  
      008743 0A 62            [ 1] 1297 	ld a,(2,x)
      008745 61 64 20         [ 1] 1298 	ld count,a 
      008748 76 61 6C 75      [ 1] 1299 	mov in,#3 ; skip first 3 bytes of line 
      00874C 65 2E            [ 2] 1300 	jra interp_loop 
      0007B0                       1301 4$: ; commande line mode 	
      00874E 0A 00 0A 46      [ 1] 1302 	clr in
      008752 69 6C            [ 1] 1303 	ld a,#CR 
      008754 65 20 69         [ 4] 1304 	call putc 
      008757 6E 20            [ 1] 1305 	ld a,#'> 
      008759 65 78 74         [ 4] 1306 	call putc 
      00875C 65 6E 64         [ 4] 1307 	call readln
      00875F 65 64 20         [ 4] 1308 	call compile
      0007C4                       1309 interp_loop:  
      008762 6D 65 6D         [ 1] 1310 	ld a,in 
      008765 6F 72 79         [ 1] 1311 	cp a,count  
      008768 2C 20            [ 1] 1312 	jrpl interp
      00876A 63 61 6E         [ 4] 1313 	call next_token
      00876D 27 74            [ 1] 1314 	cp a,#TK_COLON 
      00876F 20 62            [ 1] 1315 	jreq interp_loop 
      008771 65 20            [ 1] 1316 	cp a,#TK_NONE 
                                   1317 ;	jreq interp 
      0007D5                       1318 1$:
      008773 72 75            [ 1] 1319 	cp a,#TK_VAR
      008775 6E 20            [ 1] 1320 	jrne 2$
      008777 66 72 6F         [ 4] 1321 	call let02  
      00877A 6D 20            [ 2] 1322 	jra interp_loop 
      0007DE                       1323 2$:	
      00877C 74 68            [ 1] 1324 	cp a,#TK_ARRAY 
      00877E 65 72            [ 1] 1325 	jrne 3$
      008780 65 2E 0A         [ 4] 1326 	call get_array_element
      008783 00 6C 61         [ 4] 1327 	call let02 
      008786 73 74            [ 2] 1328 	jra interp_loop 
      0007EA                       1329 3$:
      008788 20 74            [ 1] 1330 	cp a,#TK_CMD
      00878A 6F 6B            [ 1] 1331 	jrne 4$
      00878C 65               [ 4] 1332 	call (x) 
      00878D 6E 20            [ 2] 1333 	jra interp_loop 
      0007F1                       1334 4$:	
      00878F 69 64 3A         [ 2] 1335 	jp syntax_error 
                                   1336 
                                   1337 ;--------------------------
                                   1338 ; extract next token from
                                   1339 ; token list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1340 ; basicptr -> base address 
                                   1341 ; in  -> offset in list array 
                                   1342 ; output:
                                   1343 ;   A 		token attribute
                                   1344 ;   X 		token value if there is one
                                   1345 ;----------------------------------------
      0007F4                       1346 next_token:
      008792 20 00 01         [ 1] 1347 	ld a,in 
      008794 C0 00 03         [ 1] 1348 	sub a,count 
      008794 A6 02            [ 1] 1349 	jreq 9$
      008796 55 00 01 00 02   [ 1] 1350 	mov in.saved,in
      008796 AE 86 77         [ 2] 1351 	ldw x,basicptr 
      008799 72 5F 00 09      [ 4] 1352 	ld a,([in.w],x)
      00879D 48 72 59 00      [ 1] 1353 	inc in 
      0087A1 09 C7            [ 1] 1354 	cp a,#TK_ARRAY  
      0087A3 00 0A            [ 2] 1355 	jrule 9$
      0087A5 72 BB            [ 1] 1356 	cp a,#TK_CHAR
      0087A7 00 09            [ 1] 1357 	jrne 1$
      0087A9 FE CD 82 38      [ 4] 1358 	ld a,([in.w],x)
      0087AD 72 0B 00 20      [ 1] 1359 	inc in
      0087B1 18               [ 1] 1360 	clrw x 
      0087B2 AE               [ 1] 1361 	ld xl,a 
      0087B3 16 C8            [ 1] 1362 	ld a,#TK_CHAR
      0087B5 CD               [ 4] 1363 	ret 
      0087B6 82 38            [ 1] 1364 1$:	cp a,#TK_QSTR 
      0087B8 A6 0D            [ 1] 1365 	jrult 2$
      0087BA CD 82 26 CE      [ 2] 1366 	addw x,in.w 
      0087BE 00 01            [ 2] 1367 	jra 9$
      0087C0 CD 82 60 A6      [ 5] 1368 2$: ldw x,([in.w],x)
      0087C4 5E CD 82 26      [ 1] 1369 	inc in 
      0087C8 20 1A CE 00      [ 1] 1370 	inc in
      0087CC 05               [ 4] 1371 9$: ret	
                                   1372 
                                   1373 
                                   1374 ;----------------------------------------
                                   1375 ;   DEBUG support functions
                                   1376 ;----------------------------------------
                           000001  1377 .if DEBUG 
                                   1378 ; turn LED on 
      000838                       1379 ledon:
      0087CD CD 95 11 AE      [ 1] 1380     bset PC_ODR,#LED2_BIT
      0087D1 87               [ 4] 1381     ret 
                                   1382 
                                   1383 ; turn LED off 
      00083D                       1384 ledoff:
      0087D2 84 CD 82 38      [ 1] 1385     bres PC_ODR,#LED2_BIT 
      0087D6 5F               [ 4] 1386     ret 
                                   1387 
                                   1388 ; invert LED status 
      000842                       1389 ledtoggle:
      0087D7 C6 00            [ 1] 1390     ld a,#LED2_MASK
      0087D9 03 97 72         [ 1] 1391     xor a,PC_ODR
      0087DC D6 00 05         [ 1] 1392     ld PC_ODR,a
      0087DF 5F               [ 4] 1393     ret 
                                   1394 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      00084B                       1395 left_paren:
      0087E0 97 CD            [ 1] 1396 	ld a,#SPACE 
      0087E2 8A 0D AE         [ 4] 1397 	call putc
      0087E5 17 FF            [ 1] 1398 	ld a,#'( 
      0087E7 94 01 A6         [ 4] 1399 	call putc 	
      0087E8 81               [ 4] 1400 	ret 
                                   1401 
                                   1402 ;------------------------------
                                   1403 ; print 8 bit register 
                                   1404 ; input:
                                   1405 ;   X  point to register name 
                                   1406 ;   A  register value to print 
                                   1407 ; output:
                                   1408 ;   none
                                   1409 ;------------------------------- 
      000856                       1410 prt_reg8:
      0087E8 72               [ 1] 1411 	push a 
      0087E9 5F 00 20         [ 4] 1412 	call puts 
      0087EC 72 5F            [ 1] 1413 	ld a,(1,sp) 
      0087EE 00 1D AE         [ 1] 1414 	ld acc8,a 
      0087F1 17               [ 1] 1415 	clrw x 
      0087F2 80               [ 1] 1416 	ld xl,a 
      0087F3 CF 00 17 35      [ 1] 1417 	mov base,#16
      0087F7 04 00 21         [ 4] 1418 	call print_int 
      0087FA 35 0A 00         [ 4] 1419 	call left_paren 
      0087FD 07               [ 1] 1420 	pop a 
      0087FE AE               [ 1] 1421 	clrw x 
      0087FF 16               [ 1] 1422 	ld xl,a 
      008800 C8 CF 00 05      [ 1] 1423 	mov base,#10 
      008804 CD 09 8D         [ 4] 1424 	call print_int  
      008804 72 5F            [ 1] 1425 	ld a,#') 
      008806 00 01 72         [ 4] 1426 	call putc
      008809 01               [ 4] 1427 	ret
                                   1428 
                                   1429 ;--------------------------------
                                   1430 ; print 16 bits register 
                                   1431 ; input:
                                   1432 ;   X   point register name 
                                   1433 ;   Y   register value to print 
                                   1434 ; output:
                                   1435 ;  none
                                   1436 ;--------------------------------
      00087B                       1437 prt_reg16: 
      00880A 00 20            [ 2] 1438 	pushw y 
      00880C 23 CE 00         [ 4] 1439 	call puts 
      00880F 05 E6            [ 2] 1440 	ldw x,(1,sp) 
      008811 02 C7 00 0A      [ 1] 1441 	mov base,#16 
      008815 72 5F 00         [ 4] 1442 	call print_int  
      008818 09 72 BB         [ 4] 1443 	call left_paren 
      00881B 00               [ 2] 1444 	popw x 
      00881C 09 C3 00 1B      [ 1] 1445 	mov base,#10 
      008820 2A C6 CF         [ 4] 1446 	call print_int  
      008823 00 05            [ 1] 1447 	ld a,#') 
      008825 E6 02 C7         [ 4] 1448 	call putc
      008828 00               [ 4] 1449 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1450 
                                   1451 ;------------------------------------
                                   1452 ; print registers contents saved on
                                   1453 ; stack by trap interrupt.
                                   1454 ;------------------------------------
      00089A                       1455 print_registers:
      008829 04 35 03         [ 2] 1456 	ldw x,#STATES
      00882C 00 02 20         [ 4] 1457 	call puts
                                   1458 ; print EPC 
      00882F 14 09 2A         [ 2] 1459 	ldw x, #REG_EPC
      008830 CD 01 B8         [ 4] 1460 	call puts 
      008830 72 5F            [ 1] 1461 	ld a, (11,sp)
      008832 00 02 A6         [ 1] 1462 	ld acc8,a 
      008835 0D CD            [ 1] 1463 	ld a, (10,sp) 
      008837 82 26 A6         [ 1] 1464 	ld acc16,a 
      00883A 3E CD            [ 1] 1465 	ld a,(9,sp) 
      00883C 82 26 CD         [ 1] 1466 	ld acc24,a
      00883F 8A               [ 1] 1467 	clrw x  
      008840 FB CD            [ 1] 1468 	ld a,#16
      008842 84 74 45         [ 4] 1469 	call prti24  
                                   1470 ; print X
      008844 AE 09 33         [ 2] 1471 	ldw x,#REG_X
      008844 C6 00            [ 2] 1472 	ldw y,(5,sp)
      008846 02 C1 00         [ 4] 1473 	call prt_reg16  
                                   1474 ; print Y 
      008849 04 2A B8         [ 2] 1475 	ldw x,#REG_Y
      00884C CD 88            [ 2] 1476 	ldw y, (7,sp)
      00884E 74 A1 01         [ 4] 1477 	call prt_reg16  
                                   1478 ; print A 
      008851 27 F1 A1         [ 2] 1479 	ldw x,#REG_A
      008854 00 04            [ 1] 1480 	ld a, (4,sp) 
      008855 CD 08 56         [ 4] 1481 	call prt_reg8
                                   1482 ; print CC 
      008855 A1 05 26         [ 2] 1483 	ldw x,#REG_CC 
      008858 05 CD            [ 1] 1484 	ld a, (3,sp) 
      00885A 94 20 20         [ 4] 1485 	call prt_reg8 
                                   1486 ; print SP 
      00885D E6 09 40         [ 2] 1487 	ldw x,#REG_SP
      00885E 90 96            [ 1] 1488 	ldw y,sp 
      00885E A1 02 26 08      [ 2] 1489 	addw y,#12
      008862 CD 92 67         [ 4] 1490 	call prt_reg16  
      008865 CD 94            [ 1] 1491 	ld a,#'\n' 
      008867 20 20 DA         [ 4] 1492 	call putc
      00886A 81               [ 4] 1493 	ret
                                   1494 
      00886A A1 06 26 03 FD 20 D3  1495 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      008871 45 50 43 3A 00        1496 REG_EPC: .asciz "EPC:"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008871 CC 87 94 00           1497 REG_Y:   .asciz "\nY:" 
      008874 0A 58 3A 00           1498 REG_X:   .asciz "\nX:"
      008874 C6 00 02 C0           1499 REG_A:   .asciz "\nA:" 
      008878 00 04 27 3B 55        1500 REG_CC:  .asciz "\nCC:"
      00887D 00 02 00 03 CE        1501 REG_SP:  .asciz "\nSP:"
                                   1502 .endif ; DEBUG 
                                   1503 
                                   1504 ;------------------------------------
                                   1505 ; print integer in acc24 
                                   1506 ; input:
                                   1507 ;	acc24 		integer to print 
                                   1508 ;	A 			numerical base for conversion 
                                   1509 ;               if bit 7 is set add a space at print end.
                                   1510 ;   XL 			field width, 0 -> no fill.
                                   1511 ;  output:
                                   1512 ;    none 
                                   1513 ;------------------------------------
                           000001  1514 	WIDTH = 1
                           000002  1515 	BASE = 2
                           000003  1516 	ADD_SPACE=3 ; add a space after number 
                           000003  1517 	VSIZE = 3
      000945                       1518 prti24:
      000945                       1519 	_vars VSIZE 
      008882 00 05            [ 2]    1     sub sp,#VSIZE 
      008884 72 D6            [ 1] 1520 	clr (ADD_SPACE,sp)
      008886 00 01            [ 1] 1521 	bcp a,#0x80 
      008888 72 5C            [ 1] 1522 	jreq 0$ 
      00888A 00 02            [ 1] 1523 	cpl (ADD_SPACE,sp)
      00888C A1 02            [ 1] 1524 0$:	and a,#31 
      00888E 23 27            [ 1] 1525 	ld (BASE,sp),a
      008890 A1               [ 1] 1526 	ld a,xl
      008891 03 26            [ 1] 1527 	ld (WIDTH,sp),a 
      008893 0D 72            [ 1] 1528 	ld a, (BASE,sp)  
      008895 D6 00 01         [ 4] 1529     call itoa  ; conversion entier en  .asciz
      008898 72 5C            [ 1] 1530 1$: ld a,(WIDTH,sp)
      00889A 00 02            [ 1] 1531 	jreq 4$
      00889C 5F 97 A6         [ 1] 1532 	ld acc8,a 
      00889F 03               [ 2] 1533 	pushw x 
      0088A0 81 A1 0A         [ 4] 1534 	call strlen 
      0088A3 25               [ 1] 1535 	ld a,xl 
      0088A4 06               [ 2] 1536 	popw x 
      0088A5 72 BB 00         [ 3] 1537 	exg a,acc8 
      0088A8 01 20 0C         [ 1] 1538 	sub a,acc8 
      0088AB 72 DE            [ 1] 1539 	jrmi 4$
      0088AD 00 01            [ 1] 1540 	ld (WIDTH,sp),a 
      0088AF 72 5C            [ 1] 1541 	ld  a,#SPACE
      0088B1 00 02            [ 1] 1542 3$: tnz (WIDTH,sp)
      0088B3 72 5C            [ 1] 1543 	jreq 4$
      0088B5 00               [ 2] 1544 	decw x 
      0088B6 02               [ 1] 1545 	ld (x),a 
      0088B7 81 01            [ 1] 1546 	dec (WIDTH,sp) 
      0088B8 20 F6            [ 2] 1547 	jra 3$
      00097E                       1548 4$: 
      0088B8 72 1A 50         [ 4] 1549 	call puts 
      0088BB 0A 81            [ 1] 1550 	tnz (ADD_SPACE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0088BD 27 05            [ 1] 1551 	jreq 5$
      0088BD 72 1B            [ 1] 1552     ld a,#SPACE 
      0088BF 50 0A 81         [ 4] 1553 	call putc 
      0088C2                       1554 5$: _drop VSIZE 
      0088C2 A6 20            [ 2]    1     addw sp,#VSIZE 
      0088C4 C8               [ 4] 1555     ret	
                                   1556 
                                   1557 ;-----------------------------------
                                   1558 ; print a 16 bit integer 
                                   1559 ; using variable 'base' as conversion
                                   1560 ; format.
                                   1561 ; input:
                                   1562 ;   X       integer to print 
                                   1563 ;   base    conversion base 
                                   1564 ; output:
                                   1565 ;   none 
                                   1566 ;-----------------------------------
                           000001  1567 	SIGN=1
                           000001  1568 	VSIZE=1
      00098D                       1569 print_int: 
      00098D                       1570 	_vars VSIZE 
      0088C5 50 0A            [ 2]    1     sub sp,#VSIZE 
      0088C7 C7 50            [ 1] 1571 	clr (SIGN,sp)
      0088C9 0A 81 17 3F      [ 2] 1572 	ldw y,#pad+PAD_SIZE-1 
      0088CB 90 7F            [ 1] 1573 	clr (y)
      0088CB A6 20 CD         [ 1] 1574 	ld a,base  
      0088CE 82 26            [ 1] 1575 	cp a,#10 
      0088D0 A6 28            [ 1] 1576 	jrne 1$ 
      0088D2 CD               [ 2] 1577 	tnzw x 
      0088D3 82 26            [ 1] 1578 	jrpl 1$ 
      0088D5 81 01            [ 1] 1579 	cpl (SIGN,sp)
      0088D6 50               [ 2] 1580 	negw x 	 
      0009A4                       1581 1$:	
      0088D6 88 CD 82         [ 1] 1582 	ld a,base 
      0088D9 38               [ 2] 1583 	div x,a 
      0088DA 7B 01            [ 1] 1584 	add a,#'0 
      0088DC C7 00            [ 1] 1585 	cp a,#'9+1 
      0088DE 0A 5F            [ 1] 1586 	jrmi 2$ 
      0088E0 97 35            [ 1] 1587 	add a,#7 
      0088E2 10 00            [ 2] 1588 2$: decw y 
      0088E4 07 CD            [ 1] 1589 	ld (y),a 
      0088E6 8A               [ 2] 1590 	tnzw x 
      0088E7 0D CD            [ 1] 1591 	jrne 1$ 
      0088E9 88 CB            [ 1] 1592 	ld a,#16 
      0088EB 84 5F 97         [ 1] 1593 	cp a,base 
      0088EE 35 0A            [ 1] 1594 	jrne 3$
      0088F0 00 07            [ 1] 1595 	ld a,#'$
      0088F2 CD 8A            [ 2] 1596 	decw y  
      0088F4 0D A6            [ 1] 1597 	ld (y),a
      0088F6 29 CD            [ 2] 1598 	jra 9$ 
      0088F8 82 26            [ 1] 1599 3$: tnz (SIGN,sp)
      0088FA 81 06            [ 1] 1600 	jreq 9$ 
      0088FB A6 2D            [ 1] 1601 	ld a,#'-
      0088FB 90 89            [ 2] 1602 	decw y  
      0088FD CD 82            [ 1] 1603 	ld (y),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0009D0                       1604 9$:	
      0088FF 38               [ 1] 1605 	ldw x,y 
      008900 1E 01 35         [ 2] 1606 	subw x,#pad+PAD_SIZE-1 
      008903 10               [ 2] 1607 	negw x  
      0009D5                       1608 10$:
      008904 00 07            [ 2] 1609 	decw y 
      008906 CD 8A            [ 1] 1610 	ld a,#SPACE 
      008908 0D CD            [ 1] 1611 	ld (y),a
      00890A 88               [ 1] 1612 	incw x 
      00890B CB               [ 1] 1613 	ld a,xl 
      00890C 85 35 0A         [ 1] 1614 	cp a,tab_width
      00890F 00 07            [ 1] 1615 	jrmi 10$ 
      0009E2                       1616 12$:
      008911 CD               [ 1] 1617     ldw x,y 
      008912 8A 0D A6         [ 4] 1618 	call puts  
      0009E6                       1619 	_drop VSIZE 
      008915 29 CD            [ 2]    1     addw sp,#VSIZE 
      008917 82               [ 4] 1620 	ret 
                                   1621 
                                   1622 ;------------------------------------
                                   1623 ; convert integer in acc24 to string
                                   1624 ; input:
                                   1625 ;   A	  	base
                                   1626 ;	acc24	integer to convert
                                   1627 ; output:
                                   1628 ;   X  		pointer to string
                                   1629 ;------------------------------------
                           000001  1630 	SIGN=1  ; integer sign 
                           000002  1631 	BASE=2  ; numeric base 
                           000002  1632 	VSIZE=2  ;locals size
      0009E9                       1633 itoa:
      008918 26 81            [ 2] 1634 	sub sp,#VSIZE
      00891A 6B 02            [ 1] 1635 	ld (BASE,sp), a  ; base
      00891A AE 89            [ 1] 1636 	clr (SIGN,sp)    ; sign
      00891C 6D CD            [ 1] 1637 	cp a,#10
      00891E 82 38            [ 1] 1638 	jrne 1$
                                   1639 	; base 10 string display with negative sign if bit 23==1
      008920 AE 89 AA CD 82   [ 2] 1640 	btjf acc24,#7,1$
      008925 38 7B            [ 1] 1641 	cpl (SIGN,sp)
      008927 0B C7 00         [ 4] 1642 	call neg_acc24
      0009FD                       1643 1$:
                                   1644 ; initialize string pointer 
      00892A 0A 7B 0A         [ 2] 1645 	ldw x,#pad+PAD_SIZE-1
      00892D C7               [ 1] 1646 	clr (x)
      000A01                       1647 itoa_loop:
      00892E 00 09            [ 1] 1648     ld a,(BASE,sp)
      008930 7B 09 C7         [ 4] 1649     call divu24_8 ; acc24/A 
      008933 00 08            [ 1] 1650     add a,#'0  ; remainder of division
      008935 5F A6            [ 1] 1651     cp a,#'9+1
      008937 10 CD            [ 1] 1652     jrmi 2$
      008939 89 C5            [ 1] 1653     add a,#7 
      00893B AE               [ 2] 1654 2$: decw x
      00893C 89               [ 1] 1655     ld (x),a
                                   1656 	; if acc24==0 conversion done
      00893D B3 16 05         [ 1] 1657 	ld a,acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008940 CD 88 FB         [ 1] 1658 	or a,acc16
      008943 AE 89 AF         [ 1] 1659 	or a,acc8
      008946 16 07            [ 1] 1660     jrne itoa_loop
                                   1661 	;conversion done, next add '$' or '-' as required
      008948 CD 88            [ 1] 1662 	ld a,(BASE,sp)
      00894A FB AE            [ 1] 1663 	cp a,#16
      00894C 89 B7            [ 1] 1664 	jreq 8$
      00894E 7B 04            [ 1] 1665 	ld a,(SIGN,sp)
      008950 CD 88            [ 1] 1666     jreq 10$
      008952 D6 AE            [ 1] 1667     ld a,#'-
      008954 89 BB            [ 2] 1668 	jra 9$ 
      008956 7B 03            [ 1] 1669 8$: ld a,#'$ 
      008958 CD               [ 2] 1670 9$: decw x
      008959 88               [ 1] 1671     ld (x),a
      000A2D                       1672 10$:
      00895A D6 AE            [ 2] 1673 	addw sp,#VSIZE
      00895C 89               [ 4] 1674 	ret
                                   1675 
                                   1676 ;-------------------------------------
                                   1677 ; divide uint24_t by uint8_t
                                   1678 ; used to convert uint24_t to string
                                   1679 ; input:
                                   1680 ;	acc24	dividend
                                   1681 ;   A 		divisor
                                   1682 ; output:
                                   1683 ;   acc24	quotient
                                   1684 ;   A		remainder
                                   1685 ;------------------------------------- 
                                   1686 ; offset  on sp of arguments and locals
                           000001  1687 	U8   = 1   ; divisor on stack
                           000001  1688 	VSIZE =1
      000A30                       1689 divu24_8:
      00895D C0               [ 2] 1690 	pushw x ; save x
      00895E 90               [ 1] 1691 	push a 
                                   1692 	; ld dividend UU:MM bytes in X
      00895F 96 72 A9         [ 1] 1693 	ld a, acc24
      008962 00               [ 1] 1694 	ld xh,a
      008963 0C CD 88         [ 1] 1695 	ld a,acc24+1
      008966 FB               [ 1] 1696 	ld xl,a
      008967 A6 0A            [ 1] 1697 	ld a,(U8,SP) ; divisor
      008969 CD               [ 2] 1698 	div x,a ; UU:MM/U8
      00896A 82               [ 1] 1699 	push a  ;save remainder
      00896B 26               [ 1] 1700 	ld a,xh
      00896C 81 0A 52         [ 1] 1701 	ld acc24,a
      00896F 65               [ 1] 1702 	ld a,xl
      008970 67 69 73         [ 1] 1703 	ld acc24+1,a
      008973 74               [ 1] 1704 	pop a
      008974 65               [ 1] 1705 	ld xh,a
      008975 72 73 20         [ 1] 1706 	ld a,acc24+2
      008978 73               [ 1] 1707 	ld xl,a
      008979 74 61            [ 1] 1708 	ld a,(U8,sp) ; divisor
      00897B 74               [ 2] 1709 	div x,a  ; R:LL/U8
      00897C 65 20            [ 1] 1710 	ld (U8,sp),a ; save remainder
      00897E 61               [ 1] 1711 	ld a,xl
      00897F 74 20 61         [ 1] 1712 	ld acc24+2,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008982 62               [ 1] 1713 	pop a
      008983 6F               [ 2] 1714 	popw x
      008984 72               [ 4] 1715 	ret
                                   1716 
                                   1717 ;------------------------------------
                                   1718 ;  two's complement acc24
                                   1719 ;  input:
                                   1720 ;		acc24 variable
                                   1721 ;  output:
                                   1722 ;		acc24 variable
                                   1723 ;-------------------------------------
      000A58                       1724 neg_acc24:
      008985 74 20 70 6F      [ 1] 1725 	cpl acc24+2
      008989 69 6E 74 2E      [ 1] 1726 	cpl acc24+1
      00898D 0A 2D 2D 2D      [ 1] 1727 	cpl acc24
      008991 2D 2D            [ 1] 1728 	ld a,#1
      008993 2D 2D 2D         [ 1] 1729 	add a,acc24+2
      008996 2D 2D 2D         [ 1] 1730 	ld acc24+2,a
      008999 2D               [ 1] 1731 	clr a
      00899A 2D 2D 2D         [ 1] 1732 	adc a,acc24+1
      00899D 2D 2D 2D         [ 1] 1733 	ld acc24+1,a 
      0089A0 2D               [ 1] 1734 	clr a 
      0089A1 2D 2D 2D         [ 1] 1735 	adc a,acc24 
      0089A4 2D 2D 2D         [ 1] 1736 	ld acc24,a 
      0089A7 2D               [ 4] 1737 	ret
                                   1738 
                                   1739 
                                   1740 ;------------------------------------
                                   1741 ; read a line of text from terminal
                                   1742 ; input:
                                   1743 ;	none
                                   1744 ; local variable on stack:
                                   1745 ;	LL  line length
                                   1746 ;   RXCHAR last received chaaracte 
                                   1747 ; output:
                                   1748 ;   text in tib  buffer
                                   1749 ;------------------------------------
                                   1750 	; local variables
                           000001  1751 	LL_HB=1
                           000001  1752 	RXCHAR = 1 ; last char received
                           000002  1753 	LL = 2  ; accepted line length
                           000002  1754 	VSIZE=2 
      000A7B                       1755 readln:
      0089A8 0A               [ 1] 1756 	clrw x 
      0089A9 00               [ 2] 1757 	pushw x 
      0089AA 45 50 43 3A      [ 2] 1758  	ldw y,#tib ; input buffer
      000A81                       1759 readln_loop:
      0089AE 00 0A 59         [ 4] 1760 	call getc
      0089B1 3A 00            [ 1] 1761 	ld (RXCHAR,sp),a
      0089B3 0A 58            [ 1] 1762 	cp a,#CR
      0089B5 3A 00            [ 1] 1763 	jrne 1$
      0089B7 0A 41 3A         [ 2] 1764 	jp readln_quit
      0089BA 00 0A            [ 1] 1765 1$:	cp a,#NL
      0089BC 43 43            [ 1] 1766 	jreq readln_quit
      0089BE 3A 00            [ 1] 1767 	cp a,#BSP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      0089C0 0A 53            [ 1] 1768 	jreq del_back
      0089C2 50 3A            [ 1] 1769 	cp a,#CTRL_D
      0089C4 00 2A            [ 1] 1770 	jreq del_ln
      0089C5 A1 12            [ 1] 1771 	cp a,#CTRL_R 
      0089C5 52 03            [ 1] 1772 	jreq reprint 
                                   1773 ;	cp a,#'[
                                   1774 ;	jreq ansi_seq
      000A9D                       1775 final_test:
      0089C7 0F 03            [ 1] 1776 	cp a,#SPACE
      0089C9 A5 80            [ 1] 1777 	jrpl accept_char
      0089CB 27 02            [ 2] 1778 	jra readln_loop
      000AA3                       1779 ansi_seq:
                                   1780 ;	call getc
                                   1781 ;	cp a,#'C 
                                   1782 ;	jreq rigth_arrow
                                   1783 ;	cp a,#'D 
                                   1784 ;	jreq left_arrow 
                                   1785 ;	jra final_test
      000AA3                       1786 right_arrow:
                                   1787 ;	ld a,#BSP 
                                   1788 ;	call putc 
                                   1789 ;	jra realn_loop 
      000AA3                       1790 left_arrow:
                                   1791 
                                   1792 ;	jra readln_loop
      000AA3                       1793 reprint: 
      0089CD 03 03            [ 1] 1794 	tnz (LL,sp)
      0089CF A4 1F            [ 1] 1795 	jrne readln_loop
      0089D1 6B 02 9F         [ 2] 1796 	ldw x,#tib 
      0089D4 6B 01 7B         [ 4] 1797 	call strlen 
      0089D7 02 CD 8A 69      [ 2] 1798 	ldw y,#tib 
      0089DB 7B               [ 1] 1799 	ld a,xl
      0089DC 01 27            [ 1] 1800 	jreq readln_loop
      0089DE 1F C7            [ 1] 1801 	ld (LL,sp),a 
      0089E0 00 0A 89         [ 2] 1802 	ldw x,#tib 
      0089E3 CD 82 FA         [ 4] 1803 	call puts
      0089E6 9F 85            [ 1] 1804 	clr (LL_HB,sp)
      0089E8 31 00 0A         [ 2] 1805 	addw y,(LL_HB,sp)
      0089EB C0 00            [ 2] 1806 	jra readln_loop 
      000AC3                       1807 del_ln:
      0089ED 0A 2B            [ 1] 1808 	ld a,(LL,sp)
      0089EF 0E 6B 01         [ 4] 1809 	call delete
      0089F2 A6 20 0D 01      [ 2] 1810 	ldw y,#tib
      0089F6 27 06            [ 1] 1811 	clr (y)
      0089F8 5A F7            [ 1] 1812 	clr (LL,sp)
      0089FA 0A 01            [ 2] 1813 	jra readln_loop
      000AD2                       1814 del_back:
      0089FC 20 F6            [ 1] 1815     tnz (LL,sp)
      0089FE 27 AB            [ 1] 1816     jreq readln_loop
      0089FE CD 82            [ 1] 1817     dec (LL,sp)
      008A00 38 0D            [ 2] 1818     decw y
      008A02 03 27            [ 1] 1819     clr  (y)
      008A04 05 A6 20         [ 4] 1820     call bksp 
      008A07 CD 82            [ 2] 1821     jra readln_loop	
      000AE1                       1822 accept_char:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008A09 26 5B            [ 1] 1823 	ld a,#TIB_SIZE-1
      008A0B 03 81            [ 1] 1824 	cp a, (LL,sp)
      008A0D 27 9A            [ 1] 1825 	jreq readln_loop
      008A0D 52 01            [ 1] 1826 	ld a,(RXCHAR,sp)
      008A0F 0F 01            [ 1] 1827 	ld (y),a
      008A11 90 AE            [ 1] 1828 	inc (LL,sp)
      008A13 17 3F            [ 1] 1829 	incw y
      008A15 90 7F            [ 1] 1830 	clr (y)
      008A17 C6 00 07         [ 4] 1831 	call putc 
      008A1A A1 0A            [ 2] 1832 	jra readln_loop
      000AF6                       1833 readln_quit:
      008A1C 26 06            [ 1] 1834 	clr (y)
      008A1E 5D 2A            [ 1] 1835 	ld a,(LL,sp)
      008A20 03 03 01         [ 1] 1836 	ld count,a 
      000AFD                       1837 	_drop VSIZE 
      008A23 50 02            [ 2]    1     addw sp,#VSIZE 
      008A24 A6 0D            [ 1] 1838 	ld a,#CR
      008A24 C6 00 07         [ 4] 1839 	call putc
      008A27 62               [ 4] 1840 	ret
                                   1841 
                           000001  1842 .if DEBUG 	
                                   1843 ;----------------------------
                                   1844 ; command interface
                                   1845 ; only 3 commands:
                                   1846 ;  'q' to resume application
                                   1847 ;  'p [addr]' to print memory values 
                                   1848 ;  's addr' to print string 
                                   1849 ;----------------------------
                                   1850 ;local variable 
                           000001  1851 	PSIZE=1
                           000001  1852 	VSIZE=1 
      000B05                       1853 cmd_itf:
      008A28 AB 30            [ 2] 1854 	sub sp,#VSIZE 
      008A2A A1 3A 2B 02      [ 1] 1855 	clr farptr 
      008A2E AB 07 90 5A      [ 1] 1856 	clr farptr+1 
      008A32 90 F7 5D 26      [ 1] 1857 	clr farptr+2  
      000B13                       1858 repl:
      008A36 ED A6            [ 1] 1859 	ld a,#CR 
      008A38 10 C1 00         [ 4] 1860 	call putc 
      008A3B 07 26            [ 1] 1861 	ld a,#'? 
      008A3D 08 A6 24         [ 4] 1862 	call putc
      008A40 90 5A 90 F7      [ 1] 1863 	clr in.w 
      008A44 20 0A 0D 01      [ 1] 1864 	clr in 
      008A48 27 06 A6         [ 4] 1865 	call readln
      008A4B 2D 90 5A 90      [ 2] 1866 	ldw y,#tib  
      008A4F F7 F6            [ 1] 1867 	ld a,(y)
      008A50 27 E3            [ 1] 1868 	jreq repl  
      008A50 93 1D 17 3F      [ 1] 1869 	inc in 
      008A54 50 0E B5         [ 4] 1870 	call to_upper 
      008A55 A1 51            [ 1] 1871 	cp a,#'Q 
      008A55 90 5A            [ 1] 1872 	jrne test_p
      000B3B                       1873 repl_exit:
      008A57 A6 20 90 F7      [ 1] 1874 	clr tib 
      008A5B 5C 9F C1 00      [ 1] 1875 	clr count 
      008A5F 21 2B F3 01      [ 1] 1876 	clr in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008A62                       1877 	_drop #VSIZE 	
      008A62 93 CD            [ 2]    1     addw sp,##VSIZE 
      008A64 82               [ 4] 1878 	ret  
      000B4A                       1879 invalid:
      008A65 38 5B 01         [ 2] 1880 	ldw x,#invalid_cmd 
      008A68 81 01 B8         [ 4] 1881 	call puts 
      008A69 20 C1            [ 2] 1882 	jra repl 
      000B52                       1883 test_p:	
      008A69 52 02            [ 1] 1884     cp a,#'P 
      008A6B 6B 02            [ 1] 1885 	jreq mem_peek
      008A6D 0F 01            [ 1] 1886     cp a,#'S 
      008A6F A1 0A            [ 1] 1887 	jrne invalid 
      000B5A                       1888 print_string:	
      008A71 26 0A 72         [ 4] 1889 	call get_token
      008A74 0F 00            [ 1] 1890 	cp a,#TK_INTGR 
      008A76 08 05            [ 1] 1891 	jrne invalid 
      008A78 03 01 CD         [ 4] 1892 	call puts
      008A7B 8A D8 13         [ 2] 1893 	jp repl 	
      008A7D                       1894 mem_peek:
      008A7D AE 17            [ 1] 1895 	ld a,#SPACE 
      008A7F 3F 7F 6D         [ 4] 1896 	call skip  	 
      008A81 72 B9 00 00      [ 2] 1897 	addw y,in.w 
      008A81 7B 02 CD         [ 2] 1898 	ldw x,#pad 
      008A84 8A B0 AB         [ 4] 1899 	call strcpy
      008A87 30 A1 3A         [ 4] 1900 	call atoi24 	
      008A8A 2B 02 AB         [ 1] 1901 	ld a, acc24 
      008A8D 07 5A F7         [ 1] 1902 	or a,acc16 
      008A90 C6 00 08         [ 1] 1903 	or a,acc8 
      008A93 CA 00            [ 1] 1904 	jrne 1$ 
      008A95 09 CA            [ 2] 1905 	jra peek_byte  
      008A97 00 0A 26         [ 2] 1906 1$:	ldw x,acc24 
      008A9A E6 7B 02         [ 2] 1907 	ldw farptr,x 
      008A9D A1 10 27         [ 1] 1908 	ld a,acc8 
      008AA0 08 7B 01         [ 1] 1909 	ld farptr+2,a 
      000B92                       1910 peek_byte:
      008AA3 27 08 A6         [ 4] 1911 	call print_farptr 
      008AA6 2D 20            [ 1] 1912 	ld a,#8 
      008AA8 02 A6            [ 1] 1913 	ld (PSIZE,sp),a 
      008AAA 24               [ 1] 1914 	clrw x 
      008AAB 5A F7 F2         [ 4] 1915 1$:	call fetchc  
      008AAD 89               [ 2] 1916 	pushw x 
      008AAD 5B 02 81         [ 1] 1917 	ld acc8,a 
      008AB0 5F               [ 1] 1918 	clrw x 
      008AB0 89 88 C6         [ 2] 1919 	ldw acc24,x 
      008AB3 00 08            [ 1] 1920 	ld a,#16+128
      008AB5 95 C6 00         [ 4] 1921 	call prti24
      008AB8 09               [ 2] 1922 	popw x 
      008AB9 97 7B            [ 1] 1923 	dec (PSIZE,sp)
      008ABB 01 62            [ 1] 1924 	jrne 1$ 
      008ABD 88 9E            [ 1] 1925 	ld a,#8 
      008ABF C7 00 08         [ 1] 1926 	add a,farptr+2 
      008AC2 9F C7 00         [ 1] 1927 	ld farptr+2,a
      008AC5 09               [ 1] 1928 	clr a 
      008AC6 84 95 C6         [ 1] 1929 	adc a,farptr+1 
      008AC9 00 0A 97         [ 1] 1930 	ld farptr+1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008ACC 7B               [ 1] 1931 	clr a 
      008ACD 01 62 6B         [ 1] 1932 	adc a,farptr 
      008AD0 01 9F C7         [ 1] 1933 	ld farptr,a 
      008AD3 00 0A 84         [ 2] 1934 	jp repl  
                                   1935 
      008AD6 85 81 74 20 61 20 63  1936 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1937 
                                   1938 ;----------------------------
                                   1939 ; display farptr address
                                   1940 ;----------------------------
      008AD8                       1941 print_farptr:
      008AD8 72 53 00         [ 1] 1942 	ld a ,farptr+2 
      008ADB 0A 72 53         [ 1] 1943 	ld acc8,a 
      008ADE 00 09 72         [ 2] 1944 	ldw x,farptr 
      008AE1 53 00 08         [ 2] 1945 	ldw acc24,x 
      008AE4 A6               [ 1] 1946 	clrw x 
      008AE5 01 CB            [ 1] 1947 	ld a,#16 
      008AE7 00 0A C7         [ 4] 1948 	call prti24
      008AEA 00 0A            [ 1] 1949 	ld a,#SPACE 
      008AEC 4F C9 00         [ 4] 1950 	call putc 
      008AEF 09 C7 00         [ 4] 1951 	call putc 
      008AF2 09               [ 4] 1952 	ret
                                   1953 
                                   1954 ;------------------------------------
                                   1955 ; get byte at address farptr[X]
                                   1956 ; input:
                                   1957 ;	 farptr   address to peek
                                   1958 ;    X		  farptr index 	
                                   1959 ; output:
                                   1960 ;	 A 		  byte from memory  
                                   1961 ;    x		  incremented by 1
                                   1962 ;------------------------------------
      000BF2                       1963 fetchc: ; @C
      008AF3 4F C9 00 08      [ 5] 1964 	ldf a,([farptr],x)
      008AF7 C7               [ 1] 1965 	incw x
      008AF8 00               [ 4] 1966 	ret
                                   1967 
                                   1968 
                                   1969 ;------------------------------------
                                   1970 ; expect a number from command line 
                                   1971 ; next argument
                                   1972 ;  input:
                                   1973 ;	  none
                                   1974 ;  output:
                                   1975 ;    acc24   int24_t 
                                   1976 ;------------------------------------
      000BF8                       1977 number::
      008AF9 08 81 F4         [ 4] 1978 	call get_token
      008AFB CD 0E C1         [ 4] 1979 	call atoi24
      008AFB 5F               [ 4] 1980 	ret
                                   1981 .endif ; DEBUG 
                                   1982 
                                   1983 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   1984 ; parse quoted string 
                                   1985 ; input:
                                   1986 ;   Y 	pointer to tib 
                                   1987 ;   X   pointer to pad
                                   1988 ; output:
                                   1989 ;	pad   parsed string
                                   1990 ;   TOS  char* to pad  
                                   1991 ;------------------------------------
                           000001  1992 	PREV = 1
                           000002  1993 	CURR =2 
                           000002  1994 	VSIZE=2 
      000BFF                       1995 parse_quote: ; { -- addr }
      000BFF                       1996 	_vars VSIZE 
      008AFC 89 90            [ 2]    1     sub sp,#VSIZE 
      008AFE AE               [ 1] 1997 	clr a
      008AFF 16 C8            [ 1] 1998 1$:	ld (PREV,sp),a 
      008B01 72 5C 00 01      [ 1] 1999 2$:	inc in
      008B01 CD 82 2F         [ 4] 2000 	ld a,([in.w],y)
      008B04 6B 01            [ 1] 2001 	jreq 6$
      008B06 A1 0D            [ 1] 2002 	ld (CURR,sp),a 
      008B08 26 03            [ 1] 2003 	ld a,#'\
      008B0A CC 8B            [ 1] 2004 	cp a, (PREV,sp)
      008B0C 76 A1            [ 1] 2005 	jrne 3$
      008B0E 0A 27            [ 1] 2006 	clr (PREV,sp)
      008B10 65 A1            [ 1] 2007 	ld a,(CURR,sp)
      008B12 08 27            [ 4] 2008 	callr convert_escape
      008B14 3D               [ 1] 2009 	ld (x),a 
      008B15 A1               [ 1] 2010 	incw x 
      008B16 04 27            [ 2] 2011 	jra 2$
      000C1F                       2012 3$:
      008B18 2A A1            [ 1] 2013 	ld a,(CURR,sp)
      008B1A 12 27            [ 1] 2014 	cp a,#'\'
      008B1C 06 DD            [ 1] 2015 	jreq 1$
      008B1D A1 22            [ 1] 2016 	cp a,#'"
      008B1D A1 20            [ 1] 2017 	jreq 5$ 
      008B1F 2A               [ 1] 2018 	ld (x),a 
      008B20 40               [ 1] 2019 	incw x 
      008B21 20 DE            [ 2] 2020 	jra 2$
      008B23 72 5C 00 01      [ 1] 2021 5$:	inc in 
      008B23 7F               [ 1] 2022 6$: clr (x)
      008B23 AE 17 18         [ 2] 2023 	ldw x,#pad 
      008B23                       2024 	_drop VSIZE
      008B23 0D 02            [ 2]    1     addw sp,#VSIZE 
      008B25 26 DA            [ 1] 2025 	ld a,#TK_QSTR  
      008B27 AE               [ 4] 2026 	ret 
                                   2027 
                                   2028 ;---------------------------------------
                                   2029 ; called by parse_quote
                                   2030 ; subtitute escaped character 
                                   2031 ; by their ASCII value .
                                   2032 ; input:
                                   2033 ;   A  character following '\'
                                   2034 ; output:
                                   2035 ;   A  substitued char or same if not valid.
                                   2036 ;---------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      000C3A                       2037 convert_escape:
      008B28 16               [ 2] 2038 	pushw x 
      008B29 C8 CD 82         [ 2] 2039 	ldw x,#escaped 
      008B2C FA               [ 1] 2040 1$:	cp a,(x)
      008B2D 90 AE            [ 1] 2041 	jreq 2$
      008B2F 16               [ 1] 2042 	tnz (x)
      008B30 C8 9F            [ 1] 2043 	jreq 3$
      008B32 27               [ 1] 2044 	incw x 
      008B33 CD 6B            [ 2] 2045 	jra 1$
      008B35 02 AE 16         [ 2] 2046 2$: subw x,#escaped 
      008B38 C8               [ 1] 2047 	ld a,xl 
      008B39 CD 82            [ 1] 2048 	add a,#7
      008B3B 38               [ 2] 2049 3$:	popw x 
      008B3C 0F               [ 4] 2050 	ret 
                                   2051 
      008B3D 01 72 F9 01 20 BE 72  2052 escaped: .asciz "abtnvfr"
             00
                                   2053 
                                   2054 ;-------------------------
                                   2055 ; integer parser 
                                   2056 ; input:
                                   2057 ;   X 		point to pad 
                                   2058 ;   Y 		point to tib 
                                   2059 ;   A 	    first digit|'$' 
                                   2060 ; output:  
                                   2061 ;   pad     number string 
                                   2062 ;   X 		integer 
                                   2063 ;   A 		TK_INTGR
                                   2064 ;-------------------------
                           000001  2065 	BASE=1
                           000002  2066 	TCHAR=2 
                           000002  2067 	VSIZE=2 
      008B43                       2068 parse_integer: ; { -- n }
      008B43 7B 02            [ 1] 2069 	push #0 ; TCHAR 
      008B45 CD 82            [ 1] 2070 	cp a,#'$
      008B47 52 90            [ 1] 2071 	jreq 1$ 
      008B49 AE 16            [ 1] 2072 	push #10 ; BASE=10 
      008B4B C8 90            [ 2] 2073 	jra 2$ 
      008B4D 7F 0F            [ 1] 2074 1$: push #16  ; BASE=16
      008B4F 02               [ 1] 2075 2$:	ld (x),a 
      008B50 20               [ 1] 2076 	incw x 
      008B51 AF 5C 00 01      [ 1] 2077 	inc in 
      008B52 91 D6 00         [ 4] 2078 	ld a,([in.w],y)
      008B52 0D 02 27         [ 4] 2079 	call to_upper 
      008B55 AB 0A            [ 1] 2080 	ld (TCHAR,sp),a 
      008B57 02 90 5A         [ 4] 2081 	call is_digit 
      008B5A 90 7F            [ 1] 2082 	jrc 2$
      008B5C CD 82            [ 1] 2083 	ld a,#16 
      008B5E 42 20            [ 1] 2084 	cp a,(BASE,sp)
      008B60 A0 0A            [ 1] 2085 	jrne 3$ 
      008B61 7B 02            [ 1] 2086 	ld a,(TCHAR,sp)
      008B61 A6 4F            [ 1] 2087 	cp a,#'A 
      008B63 11 02            [ 1] 2088 	jrmi 3$ 
      008B65 27 9A            [ 1] 2089 	cp a,#'G 
      008B67 7B 01            [ 1] 2090 	jrmi 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008B69 90               [ 1] 2091 3$:	clr (x)
      008B6A F7 0C 02         [ 4] 2092 	call atoi24
      008B6D 90 5C 90         [ 2] 2093 	ldw x,acc16 
      008B70 7F CD            [ 1] 2094 	ld a,#TK_INTGR
      000C8F                       2095 	_drop VSIZE  
      008B72 82 26            [ 2]    1     addw sp,#VSIZE 
      008B74 20               [ 4] 2096 	ret 	
                                   2097 
                                   2098 ;-------------------------
                                   2099 ; binary integer parser 
                                   2100 ; input:
                                   2101 ;   X 		point to pad 
                                   2102 ;   Y 		point to tib 
                                   2103 ;   A 	    '%' 
                                   2104 ; output:  
                                   2105 ;   pad     number string 
                                   2106 ;   X 		integer 
                                   2107 ;   A 		TK_INTGR
                                   2108 ;   TOS     integer 
                                   2109 ;-------------------------
                           000001  2110 	BINARY=1
                           000002  2111 	VSIZE=2
      000C92                       2112 parse_binary: ; { -- n }
      008B75 8B 00            [ 1] 2113 	push #0
      008B76 4B 00            [ 1] 2114 	push #0
      008B76 90               [ 1] 2115 1$: ld (x),a 
      008B77 7F               [ 1] 2116 	incw x 
      008B78 7B 02 C7 00      [ 1] 2117 	inc in 
      008B7C 04 5B 02         [ 4] 2118 	ld a,([in.w],y)
      008B7F A6 0D            [ 1] 2119 	cp a,#'0 
      008B81 CD 82            [ 1] 2120 	jreq 2$
      008B83 26 81            [ 1] 2121 	cp a,#'1 
      008B85 27 02            [ 1] 2122 	jreq 2$ 
      008B85 52 01            [ 2] 2123 	jra bin_exit 
      008B87 72 5F            [ 1] 2124 2$: sub a,#'0	
      008B89 00               [ 1] 2125 	rrc a 
      008B8A 11 72            [ 1] 2126 	rlc (BINARY+1,sp)
      008B8C 5F 00            [ 1] 2127 	rlc (BINARY,sp)
      008B8E 12 72            [ 2] 2128 	jra 1$  
      000CB2                       2129 bin_exit:
      008B90 5F               [ 1] 2130 	clr (x)
      008B91 00 13            [ 2] 2131 	ldw x,(BINARY,sp)
      008B93 A6 04            [ 1] 2132 	ld a,#TK_INTGR 	
      000CB7                       2133 	_drop VSIZE 
      008B93 A6 0D            [ 2]    1     addw sp,#VSIZE 
      008B95 CD               [ 4] 2134 	ret
                                   2135 
                                   2136 ;---------------------------
                                   2137 ;  token begin with a letter,
                                   2138 ;  is keyword or variable. 	
                                   2139 ; input:
                                   2140 ;   X 		point to pad 
                                   2141 ;   Y 		point to text
                                   2142 ;   A 	    first letter  
                                   2143 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2144 ;   X		exec_addr|var_addr 
                                   2145 ;   A 		TK_CMD 
                                   2146 ;   pad 	keyword|var_name  
                                   2147 ;   TOS     exec_addr|var_addr 
                                   2148 ;--------------------------  
      000CBA                       2149 parse_keyword: ; { -- exec_addr|var_addr}
      008B96 82 26 A6         [ 4] 2150 	call to_upper 
      008B99 3F               [ 1] 2151 	ld (x),a 
      008B9A CD               [ 1] 2152 	incw x 
      008B9B 82 26 72 5F      [ 1] 2153 	inc in 
      008B9F 00 01 72         [ 4] 2154 	ld a,([in.w],y)
      008BA2 5F 00 02         [ 4] 2155 	call is_alpha 
      008BA5 CD 8A            [ 1] 2156 	jrc parse_keyword 
      008BA7 FB               [ 1] 2157 1$: clr (x)
      008BA8 90 AE 16 C8      [ 1] 2158 	tnz pad+1 
      008BAC 90 F6            [ 1] 2159 	jrne 2$
                                   2160 ; one letter variable name 
      008BAE 27 E3 72         [ 1] 2161 	ld a,pad 
      008BB1 5C 00            [ 1] 2162 	sub a,#'A 
      008BB3 02               [ 1] 2163 	sll a 
      008BB4 CD               [ 1] 2164 	push a 
      008BB5 8F 35            [ 1] 2165 	push #0
      008BB7 A1 51 26         [ 2] 2166 	ldw x,#vars 
      008BBA 17 FB 01         [ 2] 2167 	addw x,(1,sp) ; X=var address 
      008BBB                       2168 	_drop 2 
      008BBB 72 5F            [ 2]    1     addw sp,#2 
      008BBD 16 C8            [ 1] 2169 	ld a,#TK_VAR 
      008BBF 72 5F            [ 2] 2170 	jra 4$ 
      000CE7                       2171 2$: ; check for keyword, otherwise syntax error.
      000CE7                       2172 	_ldx_dict kword_dict
      008BC1 00 04 72         [ 2]    1     ldw x,#kword_dict+2
      008BC4 5F 00 02         [ 4] 2173 	call search_dict
      008BC7 5B               [ 1] 2174 	tnz a
      008BC8 01 81            [ 1] 2175 	jrne 4$ 
      008BCA CC 07 14         [ 2] 2176 	jp syntax_error
      008BCA AE               [ 4] 2177 4$:	ret  	
                                   2178 
                                   2179 
                                   2180 ;------------------------------------
                                   2181 ; Command line tokenizer
                                   2182 ; scan text for next token
                                   2183 ; move token in 'pad'
                                   2184 ; input: 
      000CF4                       2185 	none: 
                                   2186 ; use:
                                   2187 ;	Y   pointer to text
                                   2188 ;   X	pointer to pad 
                                   2189 ;   in.w   index in text buffer
                                   2190 ; output:
                                   2191 ;   A       token attribute 
                                   2192 ;   pad 	token as .asciz
                                   2193 ;   X 		token value   
                                   2194 ;------------------------------------
                                   2195 	; use to check special character 
                                   2196 	.macro _case c t  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2197 	ld a,#c 
                                   2198 	cp a,(TCHAR,sp) 
                                   2199 	jrne t
                                   2200 	.endm 
                                   2201 
                           000001  2202 	TCHAR=1
                           000002  2203 	ATTRIB=2 
                           000002  2204 	VSIZE=2
      000CF4                       2205 get_token: 
      008BCB 8C 48 CD 82      [ 2] 2206 	ldw y,#tib    	
      008BCF 38 20 C1         [ 1] 2207 	ld a,in 
      008BD2 C1 00 03         [ 1] 2208 	cp a,count 
      008BD2 A1 50            [ 1] 2209 	jrmi 1$
      008BD4 27 11            [ 1] 2210 	ld a,#TK_NONE 
      008BD6 A1               [ 4] 2211 	ret 
      000D03                       2212 1$:	
      000D03                       2213 	_vars VSIZE
      008BD7 53 26            [ 2]    1     sub sp,#VSIZE 
      008BD9 F0 17 18         [ 2] 2214 	ldw x, #pad
      008BDA A6 20            [ 1] 2215 	ld a,#SPACE
      008BDA CD 8D 74         [ 4] 2216 	call skip
      008BDD A1 04 26 E9 CD   [ 1] 2217 	mov in.saved,in 
      008BE2 82 38 CC         [ 4] 2218 	ld a,([in.w],y)
      008BE5 8B 93            [ 1] 2219 	jrne str_tst
      008BE7 72 5F 17 18      [ 1] 2220 	clr pad 
      008BE7 A6 20 CD         [ 2] 2221 	jp token_exit ; end of line 
                                   2222 
      000D1E                       2223 str_tst: ; check for quoted string  	
      008BEA 8F ED 72         [ 4] 2224 	call to_upper 
      008BED B9 00            [ 1] 2225 	ld (TCHAR,sp),a 
      000D23                       2226 	_case '"' nbr_tst
      008BEF 01 AE            [ 1]    1 	ld a,#'"' 
      008BF1 17 18            [ 1]    2 	cp a,(TCHAR,sp) 
      008BF3 CD 83            [ 1]    3 	jrne nbr_tst
      008BF5 18 CD 8F         [ 4] 2227 	call parse_quote
      008BF8 41 C6 00         [ 2] 2228 	jp token_exit
      000D2F                       2229 nbr_tst: ; check for number 
      008BFB 08 CA            [ 1] 2230 	ld a,#'$'
      008BFD 00 09            [ 1] 2231 	cp a,(TCHAR,sp) 
      008BFF CA 00            [ 1] 2232 	jreq 1$
      008C01 0A 26            [ 1] 2233 	ld a,#'&
      008C03 02 20            [ 1] 2234 	cp a,(TCHAR,sp)
      008C05 0C CE            [ 1] 2235 	jrne 0$
      008C07 00 08 CF         [ 4] 2236 	call parse_binary ; expect binary integer 
      008C0A 00 11 C6         [ 2] 2237 	jp token_exit 
      008C0D 00 0A            [ 1] 2238 0$:	ld a,(TCHAR,sp)
      008C0F C7 00 13         [ 4] 2239 	call is_digit
      008C12 24 06            [ 1] 2240 	jrnc 3$
      008C12 CD 8C 57         [ 4] 2241 1$:	call parse_integer 
      008C15 A6 08 6B         [ 2] 2242 	jp token_exit 
      000D4E                       2243 3$: 
      000D4E                       2244 	_case '(' bkslsh_tst 
      008C18 01 5F            [ 1]    1 	ld a,#'(' 
      008C1A CD 8C            [ 1]    2 	cp a,(TCHAR,sp) 
      008C1C 72 89            [ 1]    3 	jrne bkslsh_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008C1E C7 00            [ 1] 2245 	ld a,#TK_LPAREN
      008C20 0A 5F CF         [ 2] 2246 	jp token_char   	
      000D59                       2247 bkslsh_tst:
      000D59                       2248 	_case '\',rparnt_tst
      008C23 00 08            [ 1]    1 	ld a,#'\' 
      008C25 A6 90            [ 1]    2 	cp a,(TCHAR,sp) 
      008C27 CD 89            [ 1]    3 	jrne rparnt_tst
      008C29 C5 85            [ 1] 2249 	ld a,(TCHAR,sp)
      008C2B 0A               [ 1] 2250 	ld (x),a 
      008C2C 01               [ 1] 2251 	incw x 
      008C2D 26 EB A6 08      [ 1] 2252 	inc in 
      008C31 CB 00 13         [ 4] 2253 	ld a,([in.w],y)
      008C34 C7               [ 1] 2254 	ld (x),a 
      008C35 00               [ 1] 2255 	incw x 
      008C36 13 4F C9 00      [ 1] 2256 	inc in  
      008C3A 12               [ 1] 2257 	clr (x) 
      008C3B C7               [ 1] 2258 	ld xl,a 
      008C3C 00 12            [ 1] 2259 	ld a,#TK_CHAR 
      008C3E 4F C9 00         [ 2] 2260 	jp token_exit 
      000D77                       2261 rparnt_tst:		
      000D77                       2262 	_case ')' colon_tst 
      008C41 11 C7            [ 1]    1 	ld a,#')' 
      008C43 00 11            [ 1]    2 	cp a,(TCHAR,sp) 
      008C45 CC 8B            [ 1]    3 	jrne colon_tst
      008C47 93 6E            [ 1] 2263 	ld a,#TK_RPAREN 
      008C49 6F 74 20         [ 2] 2264 	jp token_char 
      000D82                       2265 colon_tst:
      000D82                       2266 	_case ':' comma_tst 
      008C4C 61 20            [ 1]    1 	ld a,#':' 
      008C4E 63 6F            [ 1]    2 	cp a,(TCHAR,sp) 
      008C50 6D 6D            [ 1]    3 	jrne comma_tst
      008C52 61 6E            [ 1] 2267 	ld a,#TK_COLON 
      008C54 64 0A 00         [ 2] 2268 	jp token_char 
      008C57                       2269 comma_tst:
      000D8D                       2270 	_case COMMA sharp_tst 
      008C57 C6 00            [ 1]    1 	ld a,#COMMA 
      008C59 13 C7            [ 1]    2 	cp a,(TCHAR,sp) 
      008C5B 00 0A            [ 1]    3 	jrne sharp_tst
      008C5D CE 00            [ 1] 2271 	ld a,#TK_COMMA
      008C5F 11 CF 00         [ 2] 2272 	jp token_char
      000D98                       2273 sharp_tst:
      000D98                       2274 	_case SHARP dash_tst 
      008C62 08 5F            [ 1]    1 	ld a,#SHARP 
      008C64 A6 10            [ 1]    2 	cp a,(TCHAR,sp) 
      008C66 CD 89            [ 1]    3 	jrne dash_tst
      008C68 C5 A6            [ 1] 2275 	ld a,#TK_SHARP
      008C6A 20 CD 82         [ 2] 2276 	jp token_char  	 	 
      000DA3                       2277 dash_tst: 	
      000DA3                       2278 	_case '-' at_tst 
      008C6D 26 CD            [ 1]    1 	ld a,#'-' 
      008C6F 82 26            [ 1]    2 	cp a,(TCHAR,sp) 
      008C71 81 05            [ 1]    3 	jrne at_tst
      008C72 A6 11            [ 1] 2279 	ld a,#TK_MINUS  
      008C72 92 AF 00         [ 2] 2280 	jp token_char 
      000DAE                       2281 at_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      000DAE                       2282 	_case '@' qmark_tst 
      008C75 11 5C            [ 1]    1 	ld a,#'@' 
      008C77 81 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C78 26 05            [ 1]    3 	jrne qmark_tst
      008C78 CD 8D            [ 1] 2283 	ld a,#TK_ARRAY 
      008C7A 74 CD 8F         [ 2] 2284 	jp token_char
      000DB9                       2285 qmark_tst:
      000DB9                       2286 	_case '?' tick_tst 
      008C7D 41 81            [ 1]    1 	ld a,#'?' 
      008C7F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C7F 52 02            [ 1]    3 	jrne tick_tst
      008C81 4F 6B            [ 1] 2287 	ld a,(TCHAR,sp)
      008C83 01               [ 1] 2288 	ld (x),a 
      008C84 72               [ 1] 2289 	incw x 
      008C85 5C               [ 1] 2290 	clr (x)
      008C86 00 02 91 D6      [ 1] 2291 	inc in 
      008C8A 01 27            [ 1] 2292 	ld a,#TK_CMD 
      008C8C 24 6B 02         [ 2] 2293 	ldw x,#print 
      008C8F A6 5C 11         [ 2] 2294 	jp token_exit
      000DD0                       2295 tick_tst: ; ignore comment 
      000DD0                       2296 	_case TICK plus_tst 
      008C92 01 26            [ 1]    1 	ld a,#TICK 
      008C94 0A 0F            [ 1]    2 	cp a,(TCHAR,sp) 
      008C96 01 7B            [ 1]    3 	jrne plus_tst
      008C98 02 AD 1F F7      [ 1] 2297 	inc in 
      008C9C 5C 20            [ 1] 2298 	ld a,#TK_CMD 
      008C9E E5 17 07         [ 2] 2299 	ldw x,#rem 
      008C9F CC 0E A9         [ 2] 2300 	jp token_exit 
      000DE2                       2301 plus_tst:
      000DE2                       2302 	_case '+' star_tst 
      008C9F 7B 02            [ 1]    1 	ld a,#'+' 
      008CA1 A1 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA3 27 DD            [ 1]    3 	jrne star_tst
      008CA5 A1 22            [ 1] 2303 	ld a,#TK_PLUS  
      008CA7 27 04 F7         [ 2] 2304 	jp token_char 
      000DED                       2305 star_tst:
      000DED                       2306 	_case '*' slash_tst 
      008CAA 5C 20            [ 1]    1 	ld a,#'*' 
      008CAC D7 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008CAE 5C 00            [ 1]    3 	jrne slash_tst
      008CB0 02 7F            [ 1] 2307 	ld a,#TK_MULT 
      008CB2 AE 17 18         [ 2] 2308 	jp token_char 
      000DF8                       2309 slash_tst: 
      000DF8                       2310 	_case '/' prcnt_tst 
      008CB5 5B 02            [ 1]    1 	ld a,#'/' 
      008CB7 A6 0A            [ 1]    2 	cp a,(TCHAR,sp) 
      008CB9 81 05            [ 1]    3 	jrne prcnt_tst
      008CBA A6 21            [ 1] 2311 	ld a,#TK_DIV 
      008CBA 89 AE 8C         [ 2] 2312 	jp token_char 
      000E03                       2313 prcnt_tst:
      000E03                       2314 	_case '%' eql_tst 
      008CBD CF F1            [ 1]    1 	ld a,#'%' 
      008CBF 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008CC1 7D 27            [ 1]    3 	jrne eql_tst
      008CC3 09 5C            [ 1] 2315 	ld a,#TK_MOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008CC5 20 F7 1D         [ 2] 2316 	jp token_char  
                                   2317 ; 1 or 2 character tokens 	
      000E0E                       2318 eql_tst:
      000E0E                       2319 	_case '=' gt_tst 		
      008CC8 8C CF            [ 1]    1 	ld a,#'=' 
      008CCA 9F AB            [ 1]    2 	cp a,(TCHAR,sp) 
      008CCC 07 85            [ 1]    3 	jrne gt_tst
      008CCE 81 61            [ 1] 2320 	ld a,#TK_EQUAL
      008CD0 62 74 6E         [ 2] 2321 	jp token_char 
      000E19                       2322 gt_tst:
      000E19                       2323 	_case '>' lt_tst 
      008CD3 76 66            [ 1]    1 	ld a,#'>' 
      008CD5 72 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008CD7 26 33            [ 1]    3 	jrne lt_tst
      008CD7 4B 00            [ 1] 2324 	ld a,#TK_GT 
      008CD9 A1 24            [ 1] 2325 	ld (ATTRIB,sp),a 
      008CDB 27 04 4B 0A      [ 1] 2326 	inc in 
      008CDF 20 02 4B         [ 4] 2327 	ld a,([in.w],y)
      008CE2 10 F7            [ 1] 2328 	cp a,#'=
      008CE4 5C 72            [ 1] 2329 	jrne 1$
      008CE6 5C 00            [ 1] 2330 	ld a,(TCHAR,sp)
      008CE8 02               [ 1] 2331 	ld (x),a
      008CE9 91               [ 1] 2332 	incw x 
      008CEA D6 01            [ 1] 2333 	ld a,#'=
      008CEC CD 8F            [ 1] 2334 	ld (TCHAR,sp),a 
      008CEE 35 6B            [ 1] 2335 	ld a,#TK_GE 
      008CF0 02 CD            [ 2] 2336 	jra token_char  
      008CF2 8F 2C            [ 1] 2337 1$: cp a,#'<
      008CF4 25 ED            [ 1] 2338 	jrne 2$
      008CF6 A6 10            [ 1] 2339 	ld a,(TCHAR,sp)
      008CF8 11               [ 1] 2340 	ld (x),a
      008CF9 01               [ 1] 2341 	incw x 
      008CFA 26 0A            [ 1] 2342 	ld a,#'<	
      008CFC 7B 02            [ 1] 2343 	ld (TCHAR,sp),a 
      008CFE A1 41            [ 1] 2344 	ld a,#TK_NE 
      008D00 2B 04            [ 2] 2345 	jra token_char 
      008D02 A1 47 2B DD      [ 1] 2346 2$: dec in
      008D06 7F CD            [ 1] 2347 	ld a,(ATTRIB,sp)
      008D08 8F 41            [ 2] 2348 	jra token_char 
      000E52                       2349 lt_tst:
      000E52                       2350 	_case '<' other
      008D0A CE 00            [ 1]    1 	ld a,#'<' 
      008D0C 09 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0E 04 5B            [ 1]    3 	jrne other
      008D10 02 81            [ 1] 2351 	ld a,#TK_LT 
      008D12 6B 02            [ 1] 2352 	ld (ATTRIB,sp),a 
      008D12 4B 00 4B 00      [ 1] 2353 	inc in 
      008D16 F7 5C 72         [ 4] 2354 	ld a,([in.w],y)
      008D19 5C 00            [ 1] 2355 	cp a,#'=
      008D1B 02 91            [ 1] 2356 	jrne 1$
      008D1D D6 01            [ 1] 2357 	ld a,(TCHAR,sp)
      008D1F A1               [ 1] 2358 	ld (x),a 
      008D20 30 27            [ 1] 2359 	ld a,#'=
      008D22 06 A1            [ 1] 2360 	ld (TCHAR,sp),a 
      008D24 31 27            [ 1] 2361 	ld a,#TK_LE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008D26 02 20            [ 2] 2362 	jra token_char 
      008D28 09 A0            [ 1] 2363 1$: cp a,#'>
      008D2A 30 46            [ 1] 2364 	jrne 2$
      008D2C 09 02            [ 1] 2365 	ld a,(TCHAR,sp)
      008D2E 09               [ 1] 2366 	ld (x),a 
      008D2F 01               [ 1] 2367 	incw x 
      008D30 20 E4            [ 1] 2368 	ld a,#'>
      008D32 6B 01            [ 1] 2369 	ld (TCHAR,sp),a 
      008D32 7F 1E            [ 1] 2370 	ld a,#TK_NE 
      008D34 01 A6            [ 2] 2371 	jra token_char 
      008D36 04 5B 02 81      [ 1] 2372 2$: dec in 
      008D3A 7B 02            [ 1] 2373 	ld a,(ATTRIB,sp)
      008D3A CD 8F            [ 2] 2374 	jra token_char 	
      000E8A                       2375 other: ; not a special character 	 
      008D3C 35 F7            [ 1] 2376 	ld a,(TCHAR,sp)
      008D3E 5C 72 5C         [ 4] 2377 	call is_alpha 
      008D41 00 02            [ 1] 2378 	jrc 30$ 
      008D43 91 D6 01         [ 2] 2379 	jp syntax_error 
      000E94                       2380 30$: 
      008D46 CD 85 7D         [ 4] 2381 	call parse_keyword
      008D49 25 EF            [ 2] 2382 	jra token_exit 
      000E99                       2383 token_char:
      008D4B 7F 72            [ 1] 2384 	ld (ATTRIB,sp),a 
      008D4D 5D 17            [ 1] 2385 	ld a,(TCHAR,sp)
      008D4F 19               [ 1] 2386 	ld (x),a 
      008D50 26               [ 1] 2387 	incw x 
      008D51 15               [ 1] 2388 	clr(x)
      008D52 C6 17 18 A0      [ 1] 2389 	inc in 
      008D56 41 48            [ 1] 2390 	ld a,(ATTRIB,sp)
      008D58 88 4B 00         [ 2] 2391 	ldw x,#pad 
      000EA9                       2392 token_exit:
      000EA9                       2393 	_drop VSIZE 
      008D5B AE 00            [ 2]    1     addw sp,#VSIZE 
      008D5D 22               [ 4] 2394 	ret
                                   2395 
                                   2396 
                                   2397 
                                   2398 ;------------------------------------
                                   2399 ; check if character in {'0'..'9'}
                                   2400 ; input:
                                   2401 ;    A  character to test
                                   2402 ; output:
                                   2403 ;    Carry  0 not digit | 1 digit
                                   2404 ;------------------------------------
      000EAC                       2405 is_digit:
      008D5E 72 FB            [ 1] 2406 	cp a,#'0
      008D60 01 5B            [ 1] 2407 	jrc 1$
      008D62 02 A6            [ 1] 2408     cp a,#'9+1
      008D64 05               [ 1] 2409 	ccf 
      008D65 20               [ 1] 2410 1$:	ccf 
      008D66 0C               [ 4] 2411     ret
                                   2412 
                                   2413 ;------------------------------------
                                   2414 ; convert alpha to uppercase
                                   2415 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2416 ;    a  character to convert
                                   2417 ; output:
                                   2418 ;    a  uppercase character
                                   2419 ;------------------------------------
      008D67                       2420 to_upper::
      008D67 AE A2            [ 1] 2421 	cp a,#'a
      008D69 F3 CD            [ 1] 2422 	jrpl 1$
      008D6B 91               [ 4] 2423 0$:	ret
      008D6C D1 4D            [ 1] 2424 1$: cp a,#'z	
      008D6E 26 03            [ 1] 2425 	jrugt 0$
      008D70 CC 87            [ 1] 2426 	sub a,#32
      008D72 94               [ 4] 2427 	ret
                                   2428 	
                                   2429 ;------------------------------------
                                   2430 ; convert pad content in integer
                                   2431 ; input:
                                   2432 ;    pad		.asciz to convert
                                   2433 ; output:
                                   2434 ;    acc24      int24_t
                                   2435 ;------------------------------------
                                   2436 	; local variables
                           000001  2437 	SIGN=1 ; 1 byte, 
                           000002  2438 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2439 	TEMP=3 ; 1 byte, temporary storage
                           000003  2440 	VSIZE=3 ; 3 bytes reserved for local storage
      000EC1                       2441 atoi24:
      008D73 81               [ 2] 2442 	pushw x ;save x
      008D74 52 03            [ 2] 2443 	sub sp,#VSIZE
                                   2444 	; acc24=0 
      008D74 72 5F 00 07      [ 1] 2445 	clr acc24    
      008D74 90 AE 16 C8      [ 1] 2446 	clr acc16
      008D78 C6 00 02 C1      [ 1] 2447 	clr acc8 
      008D7C 00 04 2B         [ 1] 2448 	ld a, pad 
      008D7F 03 A6            [ 1] 2449 	jreq atoi_exit
      008D81 00 81            [ 1] 2450 	clr (SIGN,sp)
      008D83 A6 0A            [ 1] 2451 	ld a,#10
      008D83 52 02            [ 1] 2452 	ld (BASE,sp),a ; default base decimal
      008D85 AE 17 18         [ 2] 2453 	ldw x,#pad ; pointer to string to convert
      008D88 A6               [ 1] 2454 	ld a,(x)
      008D89 20 CD            [ 1] 2455 	jreq 9$  ; completed if 0
      008D8B 8F ED            [ 1] 2456 	cp a,#'-
      008D8D 55 00            [ 1] 2457 	jrne 1$
      008D8F 02 00            [ 1] 2458 	cpl (SIGN,sp)
      008D91 03 91            [ 2] 2459 	jra 2$
      008D93 D6 01            [ 1] 2460 1$: cp a,#'$
      008D95 26 07            [ 1] 2461 	jrne 3$
      008D97 72 5F            [ 1] 2462 	ld a,#16
      008D99 17 18            [ 1] 2463 	ld (BASE,sp),a
      008D9B CC               [ 1] 2464 2$:	incw x
      008D9C 8F               [ 1] 2465 	ld a,(x)
      000EF3                       2466 3$:	
      008D9D 29 61            [ 1] 2467 	cp a,#'a
      008D9E 2B 02            [ 1] 2468 	jrmi 4$
      008D9E CD 8F            [ 1] 2469 	sub a,#32
      008DA0 35 6B            [ 1] 2470 4$:	cp a,#'0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008DA2 01 A6            [ 1] 2471 	jrmi 9$
      008DA4 22 11            [ 1] 2472 	sub a,#'0
      008DA6 01 26            [ 1] 2473 	cp a,#10
      008DA8 06 CD            [ 1] 2474 	jrmi 5$
      008DAA 8C 7F            [ 1] 2475 	sub a,#7
      008DAC CC 8F            [ 1] 2476 	cp a,(BASE,sp)
      008DAE 29 1F            [ 1] 2477 	jrpl 9$
      008DAF 6B 03            [ 1] 2478 5$:	ld (TEMP,sp),a
      008DAF A6 24            [ 1] 2479 	ld a,(BASE,sp)
      008DB1 11 01 27         [ 4] 2480 	call mulu24_8
      008DB4 13 A6            [ 1] 2481 	ld a,(TEMP,sp)
      008DB6 26 11 01         [ 1] 2482 	add a,acc24+2
      008DB9 26 06 CD         [ 1] 2483 	ld acc24+2,a
      008DBC 8D               [ 1] 2484 	clr a
      008DBD 12 CC 8F         [ 1] 2485 	adc a,acc24+1
      008DC0 29 7B 01         [ 1] 2486 	ld acc24+1,a
      008DC3 CD               [ 1] 2487 	clr a
      008DC4 8F 2C 24         [ 1] 2488 	adc a,acc24
      008DC7 06 CD 8C         [ 1] 2489 	ld acc24,a
      008DCA D7 CC            [ 2] 2490 	jra 2$
      008DCC 8F 29            [ 1] 2491 9$:	tnz (SIGN,sp)
      008DCE 27 03            [ 1] 2492     jreq atoi_exit
      008DCE A6 28 11         [ 4] 2493     call neg_acc24
      000F2F                       2494 atoi_exit: 
      008DD1 01 26            [ 2] 2495 	addw sp,#VSIZE
      008DD3 05               [ 2] 2496 	popw x ; restore x
      008DD4 A6               [ 4] 2497 	ret
                                   2498 
                                   2499 ;--------------------------------------
                                   2500 ; unsigned multiply uint24_t by uint8_t
                                   2501 ; use to convert numerical string to uint24_t
                                   2502 ; input:
                                   2503 ;	acc24	uint24_t 
                                   2504 ;   A		uint8_t
                                   2505 ; output:
                                   2506 ;   acc24   A*acc24
                                   2507 ;-------------------------------------
                                   2508 ; local variables offset  on sp
                           000003  2509 	U8   = 3   ; A pushed on stack
                           000002  2510 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2511 	OVFH = 1  ; multiplication overflow high byte
                           000003  2512 	VSIZE = 3
      000F33                       2513 mulu24_8:
      008DD5 0B               [ 2] 2514 	pushw x    ; save X
                                   2515 	; local variables
      008DD6 CC               [ 1] 2516 	push a     ; U8
      008DD7 8F               [ 1] 2517 	clrw x     ; initialize overflow to 0
      008DD8 19               [ 2] 2518 	pushw x    ; multiplication overflow
                                   2519 ; multiply low byte.
      008DD9 C6 00 09         [ 1] 2520 	ld a,acc24+2
      008DD9 A6               [ 1] 2521 	ld xl,a
      008DDA 5C 11            [ 1] 2522 	ld a,(U8,sp)
      008DDC 01               [ 4] 2523 	mul x,a
      008DDD 26               [ 1] 2524 	ld a,xl
      008DDE 18 7B 01         [ 1] 2525 	ld acc24+2,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008DE1 F7               [ 1] 2526 	ld a, xh
      008DE2 5C 72            [ 1] 2527 	ld (OVFL,sp),a
                                   2528 ; multipy middle byte
      008DE4 5C 00 02         [ 1] 2529 	ld a,acc24+1
      008DE7 91               [ 1] 2530 	ld xl,a
      008DE8 D6 01            [ 1] 2531 	ld a, (U8,sp)
      008DEA F7               [ 4] 2532 	mul x,a
                                   2533 ; add overflow to this partial product
      008DEB 5C 72 5C         [ 2] 2534 	addw x,(OVFH,sp)
      008DEE 00               [ 1] 2535 	ld a,xl
      008DEF 02 7F 97         [ 1] 2536 	ld acc24+1,a
      008DF2 A6               [ 1] 2537 	clr a
      008DF3 03 CC            [ 1] 2538 	adc a,#0
      008DF5 8F 29            [ 1] 2539 	ld (OVFH,sp),a
      008DF7 9E               [ 1] 2540 	ld a,xh
      008DF7 A6 29            [ 1] 2541 	ld (OVFL,sp),a
                                   2542 ; multiply most signficant byte	
      008DF9 11 01 26         [ 1] 2543 	ld a, acc24
      008DFC 05               [ 1] 2544 	ld xl, a
      008DFD A6 0C            [ 1] 2545 	ld a, (U8,sp)
      008DFF CC               [ 4] 2546 	mul x,a
      008E00 8F 19 01         [ 2] 2547 	addw x, (OVFH,sp)
      008E02 9F               [ 1] 2548 	ld a, xl
      008E02 A6 3A 11         [ 1] 2549 	ld acc24,a
      008E05 01 26            [ 2] 2550     addw sp,#VSIZE
      008E07 05               [ 2] 2551 	popw x
      008E08 A6               [ 4] 2552 	ret
                                   2553 
                                   2554 ;------------------------------------
                                   2555 ; skip character c in text starting from 'in'
                                   2556 ; input:
                                   2557 ;	 y 		point to text buffer
                                   2558 ;    a 		character to skip
                                   2559 ; output:  
                                   2560 ;	'in' ajusted to new position
                                   2561 ;------------------------------------
                           000001  2562 	C = 1 ; local var
      000F6D                       2563 skip:
      008E09 01               [ 1] 2564 	push a
      008E0A CC 8F 19         [ 4] 2565 1$:	ld a,([in.w],y)
      008E0D 27 0A            [ 1] 2566 	jreq 2$
      008E0D A6 2C            [ 1] 2567 	cp a,(C,sp)
      008E0F 11 01            [ 1] 2568 	jrne 2$
      008E11 26 05 A6 0D      [ 1] 2569 	inc in
      008E15 CC 8F            [ 2] 2570 	jra 1$
      000F7D                       2571 2$: _drop 1 
      008E17 19 01            [ 2]    1     addw sp,#1 
      008E18 81               [ 4] 2572 	ret
                                   2573 	
                                   2574 ;------------------------------
                                   2575 ; restore 'in.w' variable to 
                                   2576 ; its value before last call
                                   2577 ; to get_token.
                                   2578 ;------------------------------
      000F80                       2579 unget_token:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008E18 A6 23 11 01 26   [ 1] 2580 	mov in,in.saved
      008E1D 05               [ 4] 2581 	ret 
                                   2582 
                                   2583 
                                   2584 ;******************************
                                   2585 ;  data stack manipulation
                                   2586 ;*****************************
                                   2587 ;----------------------	
                                   2588 ; push X on data stack 
                                   2589 ; input:
                                   2590 ;	X 
                                   2591 ; output:
                                   2592 ;	none 
                                   2593 ;----------------------	
      000F86                       2594 dpush:
      000F86                       2595     _dp_down
      008E1E A6 0E CC 8F      [ 1]    1     dec dstkptr+1 
      008E22 19 5A 00 17      [ 1]    2     dec dstkptr+1
      008E23 72 CF 00 16      [ 5] 2596     ldw [dstkptr],x  
      008E23 A6               [ 4] 2597 	ret 
                                   2598 
                                   2599 
                                   2600 ;----------------------	
                                   2601 ; pop data stack in X 
                                   2602 ; input:
                                   2603 ;	none
                                   2604 ; output:
                                   2605 ;	X   
                                   2606 ;----------------------	
      000F93                       2607 dpop: 
      008E24 2D 11 01 26      [ 5] 2608     ldw x, [dstkptr]
      000F97                       2609 	_dp_up
      008E28 05 A6 11 CC      [ 1]    1     inc dstkptr+1
      008E2C 8F 19 00 17      [ 1]    2     inc dstkptr+1
      008E2E 81               [ 4] 2610 	ret 
                                   2611 
                                   2612 ;-----------------------------
                                   2613 ; swap top 2 elements of dstack
                                   2614 ;  {n1 n2 -- n2 n1 }
                                   2615 ;-----------------------------
      000FA0                       2616 dswap:
      008E2E A6 40 11 01      [ 5] 2617 	ldw x,[dstkptr]
      008E32 26               [ 2] 2618 	pushw x 
      008E33 05 A6 02         [ 2] 2619 	ldw x,#2 
      008E36 CC 8F 19 16      [ 5] 2620 	ldw x,([dstkptr],x) 
      008E39 72 CF 00 16      [ 5] 2621 	ldw [dstkptr],x 
      008E39 A6 3F 11         [ 2] 2622 	ldw x,#2
      008E3C 01 26            [ 2] 2623 	popw y 
      008E3E 11 7B 01 F7      [ 5] 2624 	ldw ([dstkptr],x),y 
      008E42 5C               [ 4] 2625 	ret
                                   2626 
                                   2627 ;-----------------------------
                                   2628 ; drop TOS 
                                   2629 ;-----------------------------
      000FBA                       2630 ddrop: ; { n -- }
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      000FBA                       2631 	_dp_up 
      008E43 7F 72 5C 00      [ 1]    1     inc dstkptr+1
      008E47 02 A6 06 AE      [ 1]    2     inc dstkptr+1
      008E4B 96               [ 4] 2632 	ret
                                   2633 	
                                   2634 ;-----------------------------
                                   2635 ; duplicate TOS 
                                   2636 ;  dstack: { ix...n -- ix...n n }
                                   2637 ;-----------------------------
      000FC3                       2638 ddup:
      008E4C 82 CC 8F 29      [ 5] 2639 	ldw x,[dstkptr]
      008E50                       2640 	_dp_down
      008E50 A6 27 11 01      [ 1]    1     dec dstkptr+1 
      008E54 26 0C 72 5C      [ 1]    2     dec dstkptr+1
      008E58 00 02 A6 06      [ 5] 2641     ldw [dstkptr],x  
      008E5C AE               [ 4] 2642 	ret 
                                   2643 
                                   2644 
                                   2645 ;----------------------------------
                                   2646 ; pick value n from dstack 
                                   2647 ; put it on TOS
                                   2648 ; dstack: {ix,..,p -- ix,...,np }
                                   2649 ;-----------------------------------
      000FD4                       2650 dpick:
      008E5D 97 87 CC 8F      [ 5] 2651 	ldw x,[dstkptr]
      008E61 29               [ 2] 2652 	sllw x 
      008E62 72 BB 00 16      [ 2] 2653 	addw x,dstkptr 
      008E62 A6               [ 2] 2654 	ldw x,(x)
      008E63 2B 11 01 26      [ 5] 2655 	ldw [dstkptr],x 
      008E67 05               [ 4] 2656 	ret
                                   2657 
                                   2658 ;---------------------------
                                   2659 ;  fetch variable in X 
                                   2660 ;  dstack:{ addr -- value }
                                   2661 ;---------------------------
      000FE3                       2662 fetch:
      008E68 A6 10 CC 8F      [ 5] 2663 	ldw x,[dstkptr]
      008E6C 19               [ 2] 2664 	ldw x,(x)
      008E6D 72 CF 00 16      [ 5] 2665 	ldw [dstkptr],x
      008E6D A6               [ 4] 2666 	ret 
                                   2667 
                                   2668 ;----------------------------
                                   2669 ; store variable 
                                   2670 ; dstack: {addr value -- }
                                   2671 ;----------------------------
      000FED                       2672 store:
      008E6E 2A 11 01         [ 4] 2673 	call dpop 
      008E71 26 05            [ 1] 2674 	ldw y,x   ; y=value 
      008E73 A6 20 CC         [ 4] 2675 	call dpop 
      008E76 8F               [ 2] 2676 	ldw (x),y 
      008E77 19               [ 4] 2677 	ret 
                                   2678 
                                   2679 ;---------------------------------
                                   2680 ; drop n elements from data stack 
                                   2681 ; input: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2682 ;   X 		n 
                                   2683 ; output:
                                   2684 ;   none 
                                   2685 ;-------------------------------------
      008E78                       2686 ddrop_n:
      008E78 A6 2F            [ 2] 2687 	pushw y 
      008E7A 11 01 26 05      [ 2] 2688 	ldw y,dstkptr 
      008E7E A6               [ 2] 2689 	sllw x 
      008E7F 21               [ 2] 2690 	pushw x 
      008E80 CC 8F 19         [ 2] 2691 	addw y,(1,sp)
      008E83 90 CF 00 16      [ 2] 2692 	ldw dstkptr,y 
      008E83 A6               [ 2] 2693 	popw x 
      008E84 25 11            [ 2] 2694 	popw y
      008E86 01               [ 4] 2695 	ret 
                                   2696 
      008E87 26 05 A6 22 CC 8F 19  2697 dstk_prompt: .asciz "\ndstack: " 
             3A 20 00
                                   2698 ;----------------------------
                                   2699 ; print dstack content 
                                   2700 ;---------------------------
                           000001  2701 	XSAVE=1
                           000002  2702 	VSIZE=2
      008E8E                       2703 dots:
      001014                       2704 	_vars VSIZE 
      008E8E A6 3D            [ 2]    1     sub sp,#VSIZE 
      008E90 11 01 26         [ 2] 2705 	ldw x,#dstk_prompt 
      008E93 05 A6 32         [ 4] 2706 	call puts
      008E96 CC 8F 19         [ 2] 2707 	ldw x,#dstack_unf-CELL_SIZE
      008E99 35 0A 00 06      [ 1] 2708 	mov base,#10 
      008E99 A6 3E 11         [ 2] 2709 1$:	cpw x,dstkptr 
      008E9C 01 26            [ 1] 2710 	jrult 4$ 
      008E9E 33 A6            [ 2] 2711 	ldw (XSAVE,sp),x
      008EA0 31               [ 2] 2712 	ldw  x,(x)
      008EA1 6B 02 72         [ 4] 2713 	call print_int 
      008EA4 5C 00            [ 2] 2714 	ldw x,(XSAVE,sp)
      008EA6 02 91 D6         [ 2] 2715 	subw x,#CELL_SIZE 
      008EA9 01 A1            [ 2] 2716 	jra 1$ 
      008EAB 3D 26            [ 1] 2717 4$: ld a,#CR 
      008EAD 0C 7B 01         [ 4] 2718 	call putc 
      00103A                       2719 	_drop VSIZE
      008EB0 F7 5C            [ 2]    1     addw sp,#VSIZE 
      008EB2 A6               [ 1] 2720 	clr a 
      008EB3 3D               [ 4] 2721 	ret
                                   2722 
      008EB4 6B 01 A6 33 20 5F A1  2723 cstk_prompt: .asciz "\nctack: "
             3C 26
                                   2724 ;--------------------------------
                                   2725 ; print cstack content
                                   2726 ;--------------------------------
                           000001  2727 	XSAVE=1
                           000002  2728 	VSIZE=2 
      001047                       2729 dotr:
      001047                       2730 	_vars VSIZE 
      008EBD 0C 7B            [ 2]    1     sub sp,#VSIZE 
      008EBF 01 F7 5C         [ 2] 2731 	ldw x,#cstk_prompt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008EC2 A6 3C 6B         [ 4] 2732 	call puts 
      008EC5 01               [ 1] 2733 	ldw x,sp 
      008EC6 A6 35 20         [ 2] 2734 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008EC9 4F 72            [ 2] 2735 	ldw (XSAVE,sp),x  
      008ECB 5A 00 02         [ 2] 2736 	ldw x,#RAM_SIZE-2
      008ECE 7B 02 20 47      [ 1] 2737 	mov base,#16
      008ED2                       2738 dotr_loop:
      008ED2 A6 3C            [ 2] 2739 	cpw x,(XSAVE,sp)
      008ED4 11 01            [ 1] 2740 	jrmi 9$
      008ED6 26               [ 2] 2741 	pushw x  
      008ED7 32               [ 2] 2742 	ldw x,(x)
      008ED8 A6 34 6B         [ 4] 2743 	call print_int 
      008EDB 02               [ 2] 2744 	popw x  
      008EDC 72 5C 00         [ 2] 2745 	subw x,#CELL_SIZE
      008EDF 02 91            [ 2] 2746 	jra dotr_loop 
      008EE1 D6 01            [ 1] 2747 9$:	ld a,#CR 
      008EE3 A1 3D 26         [ 4] 2748 	call putc 
      001070                       2749 	_drop VSIZE 
      008EE6 0B 7B            [ 2]    1     addw sp,#VSIZE 
      008EE8 01               [ 1] 2750 	clr a 
      008EE9 F7               [ 4] 2751 	ret
                                   2752 
                                   2753 
                                   2754 ;--------------------------------
                                   2755 ;  add 2 integers
                                   2756 ;  input:
                                   2757 ;    N1     on cstack 
                                   2758 ;    N2     on cstack 
                                   2759 ;  output:
                                   2760 ;    X 		n2+n1 
                                   2761 ;--------------------------------
                                   2762 	;arugments on cstack 
      001074                       2763 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001074                       2764 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001074                       2765 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001074                       2766 add:
      008EEA A6 3D            [ 2] 2767 	ldw x ,(N2,sp)
      008EEC 6B 01 A6         [ 2] 2768 	addw x,(N1,sp)
      008EEF 36 20            [ 2] 2769 	ldw (N1,sp),x 
      008EF1 27               [ 4] 2770 	ret 
                                   2771 
                                   2772 ;--------------------------------
                                   2773 ;  substract 2 ntegers
                                   2774 ;  input:
                                   2775 ;    N1     on cstack 
                                   2776 ;    N2     on cstack 
                                   2777 ;  output:
                                   2778 ;    X 		n2+n1 
                                   2779 ;--------------------------------
      00107C                       2780 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00107C                       2781 	_arg N1 1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                           000003     1     N1=ARG_OFS+1 
      00107C                       2782 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      00107C                       2783 substract:
      008EF2 A1 3E            [ 2] 2784 	ldw x,(N2,sp)
      008EF4 26 0C 7B         [ 2] 2785 	subw x,(N1,sp)
      008EF7 01               [ 4] 2786 	ret 
                                   2787 
                                   2788 ;-------------------------------------
                                   2789 ; multiply 2 integers
                                   2790 ; product overflow is ignored unless
                                   2791 ; MATH_OVF assembler flag is set to 1
                                   2792 ; input:
                                   2793 ;  	N1      on cstack
                                   2794 ;   N2 		on cstack 
                                   2795 ; output:
                                   2796 ;	X        N1*N2 
                                   2797 ;-------------------------------------
                                   2798 	;arguments 
      001082                       2799 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      001082                       2800 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      001082                       2801 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      001082                       2802 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      001082                       2803 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2804    ; local variables 
                           000001  2805 	SIGN=1
                           000002  2806 	PROD=2
                           000003  2807 	VSIZE=3
      001082                       2808 multiply:
      001082                       2809 	_vars VSIZE 
      008EF8 F7 5C            [ 2]    1     sub sp,#VSIZE 
      008EFA A6 3E            [ 1] 2810 	clr (SIGN,sp)
      008EFC 6B 01            [ 2] 2811 	ldw x,(N1_HB,sp)
      008EFE A6               [ 1] 2812 	ld a,xh  
      008EFF 35 20            [ 1] 2813 	bcp a,#0x80 
      008F01 17 72            [ 1] 2814 	jreq 2$
      008F03 5A 00            [ 1] 2815 	cpl (SIGN,sp)
      008F05 02               [ 2] 2816 	negw x 
      008F06 7B 02            [ 2] 2817 	ldw (N1_HB,sp),x 
      008F08 20 0F            [ 2] 2818 2$: ldw x,(N2_HB,sp)
      008F0A 9E               [ 1] 2819 	ld a,xh  
      008F0A 7B 01            [ 1] 2820 	bcp a,#0x80 
      008F0C CD 85            [ 1] 2821 	jreq 3$
      008F0E 7D 25            [ 1] 2822 	cpl (SIGN,sp)
      008F10 03               [ 2] 2823 	negw x 
      008F11 CC 87            [ 2] 2824 	ldw (N2_HB,sp),x 
                                   2825 ; N1_LB * N2_LB 	
      008F13 94 07            [ 1] 2826 3$:	ld a,(N1_LB,sp)
      008F14 97               [ 1] 2827 	ld xl,a 
      008F14 CD 8D            [ 1] 2828 	ld a,(N2_LB,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008F16 3A               [ 4] 2829 	mul x,a 
                           000000  2830 .if MATH_OVF 	
                                   2831 	ld a,xh 
                                   2832 	bcp a,#0x80 
                                   2833 	jreq 4$ 
                                   2834 	ld a,#ERR_MATH_OVF 
                                   2835 	jp tb_error
                                   2836 .endif 	 
      008F17 20 10            [ 2] 2837 4$:	ldw (PROD,sp),x
                                   2838 ; N1_LB * N2_HB	 
      008F19 7B 07            [ 1] 2839 	ld a,(N1_LB,sp) 
      008F19 6B               [ 1] 2840 	ld xl,a 
      008F1A 02 7B            [ 1] 2841 	ld a,(N2_HB,sp)
      008F1C 01               [ 4] 2842 	mul x,a
      008F1D F7               [ 1] 2843 	ld a,xl 
      008F1E 5C 7F            [ 1] 2844 	add a,(PROD,sp)
                           000000  2845 .if MATH_OVF 	
                                   2846 	bcp a,#0x80 
                                   2847 	jreq 5$ 
                                   2848 	ld a,#ERR_MATH_OVF 
                                   2849 	jp tb_error
                                   2850 .endif 	 
      008F20 72 5C            [ 1] 2851 5$:	ld (PROD,sp),a 
                                   2852 ; N1_HB * N2_LB 
      008F22 00 02            [ 1] 2853 	ld a,(N1_HB,sp)
      008F24 7B               [ 1] 2854 	ld xl,a 
      008F25 02 AE            [ 1] 2855 	ld a,(N2_LB,sp)
      008F27 17               [ 4] 2856 	mul x,a 
      008F28 18               [ 1] 2857 	ld a,xl 
      008F29 1B 02            [ 1] 2858 	add a,(PROD,sp)
                           000000  2859 .if MATH_OVF 	
                                   2860 	bcp a,#0x80 
                                   2861 	jreq 6$ 
                                   2862 	ld a,#ERR_MATH_OVF 
                                   2863 	jp tb_error
                                   2864 .endif 	 
      008F29 5B 02            [ 1] 2865 6$:	ld (PROD,sp),a 
                                   2866 ; N1_HB * N2_HB 	
                                   2867 ; it is pointless to multiply N1_HB*N2_HB 
                                   2868 ; as this product is over 65535 or 0 
                                   2869 ;
                                   2870 ; sign adjust product
      008F2B 81 01            [ 1] 2871 	tnz (SIGN,sp)
      008F2C 27 05            [ 1] 2872 	jreq 7$
      008F2C A1 30            [ 2] 2873 	ldw x, (PROD,sp)
      008F2E 25               [ 2] 2874 	negw x
      008F2F 03 A1            [ 2] 2875 	ldw (PROD,sp),x  
      0010C5                       2876 7$: 
      008F31 3A 8C            [ 2] 2877 	ldw x,(PROD,sp) 
      0010C7                       2878 	_drop VSIZE 
      008F33 8C 81            [ 2]    1     addw sp,#VSIZE 
      008F35 81               [ 4] 2879 	ret
                                   2880 
                                   2881 ;----------------------------------
                                   2882 ;  euclidian divide n2/n1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2883 ; input:
                                   2884 ;    N2 	on cstack
                                   2885 ;    N1 	on cstack
                                   2886 ; output:
                                   2887 ;    X      n2/n1 
                                   2888 ;    Y      remainder 
                                   2889 ;----------------------------------
      0010CA                       2890 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      0010CA                       2891 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      0010CA                       2892 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2893 	; local variables
                           000001  2894 	SQUOT=1 ; sign quotient
                           000002  2895 	SDIVD=2 ; sign dividend  
                           000002  2896 	VSIZE=2
      0010CA                       2897 divide:
      0010CA                       2898 	_vars VSIZE 
      008F35 A1 61            [ 2]    1     sub sp,#VSIZE 
      008F37 2A 01            [ 1] 2899 	clr (SQUOT,sp)
      008F39 81 A1            [ 1] 2900 	clr (SDIVD,sp)
                                   2901 ; check for 0 divisor
      008F3B 7A 22            [ 2] 2902 	ldw x,(DIVISR,sp)
      008F3D FB               [ 2] 2903 	tnzw x 
      008F3E A0 20            [ 1] 2904     jrne 0$
      008F40 81 04            [ 1] 2905 	ld a,#ERR_DIV0 
      008F41 CC 07 16         [ 2] 2906 	jp tb_error 
                                   2907 ; check divisor sign 	
      008F41 89               [ 1] 2908 0$:	ld a,xh 
      008F42 52 03            [ 1] 2909 	bcp a,#0x80 
      008F44 72 5F            [ 1] 2910 	jreq 1$
      008F46 00 08            [ 1] 2911 	cpl (SQUOT,sp)
      008F48 72               [ 2] 2912 	negw x 
      008F49 5F 00            [ 2] 2913 1$:	ldw (DIVISR,sp),x
                                   2914 ; check dividend sign 	 
      008F4B 09 72            [ 2] 2915     ldw x,(DIVIDND,sp)
      008F4D 5F               [ 1] 2916 	ld a,xh 
      008F4E 00 0A            [ 1] 2917 	bcp a,#0x80 
      008F50 C6 17            [ 1] 2918 	jreq 2$ 
      008F52 18 27            [ 1] 2919 	cpl (SQUOT,sp)
      008F54 5A 0F            [ 1] 2920 	cpl (SDIVD,sp)
      008F56 01               [ 2] 2921 	negw x 
      008F57 A6 0A            [ 2] 2922 2$:	ldw y,(DIVISR,sp)
      008F59 6B               [ 2] 2923 	divw x,y
      008F5A 02 AE 17 18      [ 2] 2924 	ldw acc16,y 
                                   2925 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      008F5E F6 27            [ 1] 2926 	tnz (SDIVD,sp)
      008F60 47 A1            [ 1] 2927 	jreq 7$
      008F62 2D 26            [ 2] 2928 	tnzw y 
      008F64 04 03            [ 1] 2929 	jreq 7$
      008F66 01               [ 1] 2930 	incw x
      008F67 20 08            [ 2] 2931 	ldw y,(DIVISR,sp)
      008F69 A1 24 26 06      [ 2] 2932 	subw y,acc16
      008F6D A6 10            [ 1] 2933 7$: tnz (SQUOT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008F6F 6B 02            [ 1] 2934 	jreq 9$ 	 
      008F71 5C               [ 2] 2935 8$:	negw x 
      00110B                       2936 9$: 
      00110B                       2937 	_drop VSIZE 
      008F72 F6 02            [ 2]    1     addw sp,#VSIZE 
      008F73 81               [ 4] 2938 	ret 
                                   2939 
                                   2940 
                                   2941 ;----------------------------------
                                   2942 ;  remainder resulting from euclidian 
                                   2943 ;  division of n2/n1 
                                   2944 ; input:
                                   2945 ;   N1 		cstack 
                                   2946 ;   N2      cstack
                                   2947 ; output:
                                   2948 ;   X       N2%N1 
                                   2949 ;----------------------------------
                           000003  2950 	N1=3
                           000005  2951 	N2=5
                           000004  2952 	VSIZE=4
      00110E                       2953 modulo:
      008F73 A1 61            [ 2] 2954 	Ldw x,(N1,sp)
      008F75 2B 02            [ 2] 2955 	ldw y,(N2,sp)
      001112                       2956 	_vars VSIZE 
      008F77 A0 20            [ 2]    1     sub sp,#VSIZE 
      008F79 A1 30            [ 2] 2957 	ldw (1,sp),x 
      008F7B 2B 2B            [ 2] 2958 	ldw (3,sp),y 
      008F7D A0 30 A1         [ 4] 2959 	call divide 
      008F80 0A               [ 1] 2960 	ldw x,y
      00111C                       2961 	_drop VSIZE 
      008F81 2B 06            [ 2]    1     addw sp,#VSIZE 
      008F83 A0               [ 4] 2962 	ret 
                                   2963 
                                   2964 
                                   2965 ;----------------------------------
                                   2966 ; search in kword_dict command name
                                   2967 ;  from its execution address 
                                   2968 ; input:
                                   2969 ;   X       	execution address 
                                   2970 ; output:
                                   2971 ;   X 			cstr*  | 0 
                                   2972 ;--------------------------------
                           000001  2973 	XADR=1 
                           000003  2974 	LINK=3 
                           000004  2975 	VSIZE=4
      00111F                       2976 cmd_name:
      00111F                       2977 	_vars VSIZE 
      008F84 07 11            [ 2]    1     sub sp,#VSIZE 
      008F86 02 2A 1F 6B      [ 1] 2978 	clr acc16 
      008F8A 03 7B            [ 2] 2979 	ldw (XADR,sp),x  
      008F8C 02 CD 8F         [ 2] 2980 	ldw x,#kword_dict	
      008F8F B3 7B            [ 2] 2981 1$:	ldw (LINK,sp),x
      008F91 03 CB            [ 1] 2982 	ld a,(2,x)
      008F93 00 0A            [ 1] 2983 	and a,#15 
      008F95 C7 00 0A         [ 1] 2984 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      008F98 4F C9 00         [ 2] 2985 	addw x,#3
      008F9B 09 C7 00 09      [ 2] 2986 	addw x,acc16
      008F9F 4F               [ 2] 2987 	ldw x,(x) ; execution address 
      008FA0 C9 00            [ 2] 2988 	cpw x,(XADR,sp)
      008FA2 08 C7            [ 1] 2989 	jreq 2$
      008FA4 00 08            [ 2] 2990 	ldw x,(LINK,sp)
      008FA6 20               [ 2] 2991 	ldw x,(x) 
      008FA7 C9 0D 01         [ 2] 2992 	subw x,#2  
      008FAA 27 03            [ 1] 2993 	jrne 1$
      008FAC CD 8A            [ 2] 2994 	jra 9$
      008FAE D8 03            [ 2] 2995 2$: ldw x,(LINK,sp)
      008FAF 1C 00 02         [ 2] 2996 	addw x,#2 	
      00114E                       2997 9$:	_drop VSIZE
      008FAF 5B 03            [ 2]    1     addw sp,#VSIZE 
      008FB1 85               [ 4] 2998 	ret
                                   2999 
                                   3000 
                                   3001 ;---------------------------------
                                   3002 ; input:
                                   3003 ;	X 		dictionary entry point 
                                   3004 ;  pad		.asciz name to search 
                                   3005 ; output:
                                   3006 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3007 ;  X		execution address | 0 
                                   3008 ;---------------------------------
                           000001  3009 	NLEN=1 ; cmd length 
                           000002  3010 	YSAVE=2
                           000003  3011 	VSIZE=3 
      001151                       3012 search_dict:
      001151                       3013 	_vars VSIZE 
      008FB2 81 03            [ 2]    1     sub sp,#VSIZE 
      008FB3 90 93            [ 1] 3014 	ldw y,x 
      001155                       3015 search_next:	
      008FB3 89 88            [ 1] 3016 	ld a,(y)
      008FB5 5F 89            [ 1] 3017 	and a,#0xf 
      008FB7 C6 00            [ 1] 3018 	ld (NLEN,sp),a  
      008FB9 0A 97 7B         [ 2] 3019 	ldw x,#pad 
      008FBC 03 42            [ 2] 3020 	ldw (YSAVE,sp),y
      008FBE 9F C7            [ 1] 3021 	incw y  
      001162                       3022 cp_loop:
      008FC0 00               [ 1] 3023 	ld a,(x)
      008FC1 0A 9E            [ 1] 3024 	jreq str_match 
      008FC3 6B 02            [ 1] 3025 	tnz (NLEN,sp)
      008FC5 C6 00            [ 1] 3026 	jreq no_match  
      008FC7 09 97            [ 1] 3027 	cp a,(y)
      008FC9 7B 03            [ 1] 3028 	jrne no_match 
      008FCB 42 72            [ 1] 3029 	incw y 
      008FCD FB               [ 1] 3030 	incw x
      008FCE 01 9F            [ 1] 3031 	dec (NLEN,sp)
      008FD0 C7 00            [ 2] 3032 	jra cp_loop 
      001174                       3033 no_match:
      008FD2 09 4F            [ 2] 3034 	ldw y,(YSAVE,sp) 
      008FD4 A9 00 6B 01      [ 2] 3035 	subw y,#2 ; move Y to link field
      008FD8 9E 6B            [ 1] 3036 	push #TK_NONE 
      008FDA 02 C6            [ 2] 3037 	ldw y,(y) ; next word link 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      008FDC 00               [ 1] 3038 	pop a ; TK_NONE 
      008FDD 08 97            [ 1] 3039 	jreq search_exit  ; not found  
                                   3040 ;try next 
      008FDF 7B 03            [ 2] 3041 	jra search_next
      001183                       3042 str_match:
      008FE1 42 72            [ 2] 3043 	ldw y,(YSAVE,sp)
      008FE3 FB 01            [ 1] 3044 	ld a,(y)
      008FE5 9F C7            [ 1] 3045 	ld (NLEN,sp),a ; needed to test keyword type  
      008FE7 00 08            [ 1] 3046 	and a,#0xf 
                                   3047 ; move y to procedure address field 	
      008FE9 5B               [ 1] 3048 	inc a 
      008FEA 03 85 81         [ 1] 3049 	ld acc8,a 
      008FED 72 5F 00 08      [ 1] 3050 	clr acc16 
      008FED 88 91 D6 01      [ 2] 3051 	addw y,acc16 
      008FF1 27 0A            [ 2] 3052 	ldw y,(y) ; routine entry point 
                                   3053 ;determine keyword type bits 7:6 
      008FF3 11 01            [ 1] 3054 	ld a,(NLEN,sp)
      008FF5 26               [ 1] 3055 	swap a 
      008FF6 06 72            [ 1] 3056 	and a,#0xc
      008FF8 5C               [ 1] 3057 	srl a
      008FF9 00               [ 1] 3058 	srl a 
      008FFA 02 20            [ 1] 3059 	add a,#6
      0011A2                       3060 search_exit: 
      008FFC F1               [ 1] 3061 	ldw x,y ; x=routine address 
      0011A3                       3062 	_drop VSIZE 	 
      008FFD 5B 01            [ 2]    1     addw sp,#VSIZE 
      008FFF 81               [ 4] 3063 	ret 
                                   3064 
                                   3065 ;---------------------
                                   3066 ; check if next token
                                   3067 ;  is of expected type 
                                   3068 ; input:
                                   3069 ;   A 		 expected token attribute
                                   3070 ;  ouput:
                                   3071 ;   none     if fail call tb_error 
                                   3072 ;--------------------
      009000                       3073 expect:
      009000 55               [ 1] 3074 	push a 
      009001 00 03 00         [ 4] 3075 	call next_token 
      009004 02 81            [ 1] 3076 	cp a,(1,sp)
      009006 27 03            [ 1] 3077 	jreq 1$
      009006 72 5A 00         [ 2] 3078 	jp syntax_error
      009009 18               [ 1] 3079 1$: pop a 
      00900A 72               [ 4] 3080 	ret 
                                   3081 
                                   3082 
                                   3083 ;-------------------------------
                                   3084 ; parse embedded BASIC routines 
                                   3085 ; arguments list.
                                   3086 ; arg_list::=  rel[','rel]*
                                   3087 ; all arguments are of integer type
                                   3088 ; input:
                                   3089 ;   none
                                   3090 ; output:
                                   3091 ;   A 			number of arguments pushed on dstack  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3092 ;--------------------------------
                           000001  3093 	ARG_CNT=1 
      0011B3                       3094 arg_list:
      00900B 5A 00            [ 1] 3095 	push #0  
      00900D 18 72 CF         [ 4] 3096 1$: call relation
      009010 00 17            [ 1] 3097 	cp a,#TK_NONE 
      009012 81 19            [ 1] 3098 	jreq 5$
      009013 A1 04            [ 1] 3099 	cp a,#TK_INTGR
      009013 72 CE            [ 1] 3100 	jrne 4$
      009015 00 17 72         [ 4] 3101 3$: call dpush 
      009018 5C 00            [ 1] 3102     inc (ARG_CNT,sp)
      00901A 18 72 5C         [ 4] 3103 	call next_token 
      00901D 00 18            [ 1] 3104 	cp a,#TK_NONE 
      00901F 81 09            [ 1] 3105 	jreq 5$ 
      009020 A1 0D            [ 1] 3106 	cp a,#TK_COMMA 
      009020 72 CE            [ 1] 3107 	jrne 4$
      009022 00 17            [ 2] 3108 	jra 1$ 
      009024 89 AE 00         [ 4] 3109 4$:	call unget_token 
      009027 02               [ 1] 3110 5$:	pop a 
      009028 72               [ 4] 3111 	ret 
                                   3112 
                                   3113 
      0011D7                       3114 func_args:
      009029 DE 00            [ 1] 3115 	ld a,#TK_LPAREN 
      00902B 17 72 CF         [ 4] 3116 	call expect 
      00902E 00 17 AE         [ 4] 3117 	call arg_list 
      009031 00               [ 1] 3118 	push a 
      009032 02 90            [ 1] 3119 	ld a,#TK_RPAREN 
      009034 85 72 DF         [ 4] 3120 	call expect 
      009037 00               [ 1] 3121 	pop a 
      009038 17               [ 4] 3122 	ret 
                                   3123 
                                   3124 
                                   3125 ;--------------------------------
                                   3126 ;   BASIC commnands 
                                   3127 ;--------------------------------
                                   3128 
                                   3129 ;--------------------------------
                                   3130 ;  arithmetic and relational 
                                   3131 ;  routines
                                   3132 ;  operators precedence
                                   3133 ;  highest to lowest
                                   3134 ;  operators on same row have 
                                   3135 ;  same precedence and are executed
                                   3136 ;  from left to right.
                                   3137 ;	'*','/','%'
                                   3138 ;   '-','+'
                                   3139 ;   '=','>','<','>=','<=','<>','><'
                                   3140 ;   '<>' and '><' are equivalent for not equal.
                                   3141 ;--------------------------------
                                   3142 
                                   3143 ;---------------------
                                   3144 ; return array element
                                   3145 ; address from @(expr)
                                   3146 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3147 ;   A 		TK_ARRAY
                                   3148 ; output:
                                   3149 ;   A 		TK_INTGR
                                   3150 ;	X 		element address 
                                   3151 ;----------------------
      0011E7                       3152 get_array_element:
      009039 81 11 D7         [ 4] 3153 	call func_args 
      00903A A1 01            [ 1] 3154 	cp a,#1
      00903A 72 5C            [ 1] 3155 	jreq 1$
      00903C 00 18 72         [ 2] 3156 	jp syntax_error
      00903F 5C 00 18         [ 4] 3157 1$: call dpop  
                                   3158 	; check for bounds 
      009042 81 00 1D         [ 2] 3159 	cpw x,array_size 
      009043 23 05            [ 2] 3160 	jrule 3$
                                   3161 ; bounds {1..array_size}	
      009043 72 CE            [ 1] 3162 2$: ld a,#ERR_BAD_VALUE 
      009045 00 17 72         [ 2] 3163 	jp tb_error 
      009048 5A               [ 2] 3164 3$: tnzw  x
      009049 00 18            [ 1] 3165 	jreq 2$ 
      00904B 72               [ 2] 3166 	sllw x 
      00904C 5A               [ 2] 3167 	pushw x 
      00904D 00 18 72         [ 2] 3168 	ldw x,#tib
      009050 CF 00 17         [ 2] 3169 	subw x,(1,sp)
      001209                       3170 	_drop 2   
      009053 81 02            [ 2]    1     addw sp,#2 
      009054 A6 04            [ 1] 3171 	ld a,#TK_INTGR
      009054 72               [ 4] 3172 	ret 
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
      00120E                       3187 factor:
      00120E                       3188 	_vars VSIZE 
      009055 CE 00            [ 2]    1     sub sp,#VSIZE 
      009057 17 58 72         [ 4] 3189 	call next_token
      00905A BB 00            [ 1] 3190 	cp a,#CMD_END 
      00905C 17 FE            [ 1] 3191 	jrmi 20$
      00905E 72 CF            [ 1] 3192 1$:	ld (NEG,sp),a 
      009060 00 17            [ 1] 3193 	and a,#TK_GRP_MASK
      009062 81 10            [ 1] 3194 	cp a,#TK_GRP_ADD 
      009063 27 04            [ 1] 3195 	jreq 2$
      009063 72 CE            [ 1] 3196 	ld a,(NEG,sp)
      009065 00 17            [ 2] 3197 	jra 4$  
      001223                       3198 2$:	
      009067 FE 72 CF         [ 4] 3199 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      001226                       3200 4$:	
      00906A 00 17            [ 1] 3201 	cp a,#TK_IFUNC 
      00906C 81 03            [ 1] 3202 	jrne 5$ 
      00906D FD               [ 4] 3203 	call (x) 
      00906D CD 90            [ 2] 3204 	jra 18$ 
      00122D                       3205 5$:
      00906F 13 90            [ 1] 3206 	cp a,#TK_INTGR
      009071 93 CD            [ 1] 3207 	jrne 6$
      009073 90 13            [ 2] 3208 	jra 18$
      001233                       3209 6$:
      009075 FF 81            [ 1] 3210 	cp a,#TK_ARRAY
      009077 26 06            [ 1] 3211 	jrne 10$
      009077 90 89 90         [ 4] 3212 	call get_array_element
      00907A CE               [ 2] 3213 	ldw x,(x)
      00907B 00 17            [ 2] 3214 	jra 18$ 
      00123D                       3215 10$:
      00907D 58 89            [ 1] 3216 	cp a,#TK_VAR 
      00907F 72 F9            [ 1] 3217 	jrne 11$
      009081 01               [ 2] 3218 	ldw x,(x)
      009082 90 CF            [ 2] 3219 	jra 18$
      001244                       3220 11$: 
      009084 00 17            [ 1] 3221 	cp a,#TK_CONST 
      009086 85 90            [ 1] 3222 	jreq 18$
      001248                       3223 12$:			
      009088 85 81            [ 1] 3224 	cp a,#TK_LPAREN
      00908A 0A 64            [ 1] 3225 	jrne 16$
      00908C 73 74 61         [ 4] 3226 	call relation
      00908F 63 6B            [ 1] 3227 	ld a,#TK_RPAREN 
      009091 3A 20 00         [ 4] 3228 	call expect
      009094 20 06            [ 2] 3229 	jra 18$	
      001256                       3230 16$:
      009094 52 02 AE         [ 4] 3231 	call unget_token
      009097 90               [ 1] 3232 	clr a 
      009098 8A CD            [ 2] 3233 	jra 20$ 
      00125C                       3234 18$: 
      00909A 82 38            [ 1] 3235 	ld a,#TK_MINUS 
      00909C AE 17            [ 1] 3236 	cp a,(NEG,sp)
      00909E 7E 35            [ 1] 3237 	jrne 19$
      0090A0 0A               [ 2] 3238 	negw x
      001263                       3239 19$:
      0090A1 00 07            [ 1] 3240 	ld a,#TK_INTGR
      001265                       3241 20$:
      001265                       3242 	_drop VSIZE
      0090A3 C3 00            [ 2]    1     addw sp,#VSIZE 
      0090A5 17               [ 4] 3243 	ret
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                           000005  3254 	VSIZE=5
      001268                       3255 term:
      001268                       3256 	_vars VSIZE
      0090A6 25 0D            [ 2]    1     sub sp,#VSIZE 
      0090A8 1F 01 FE         [ 4] 3257 	call factor
      0090AB CD 8A            [ 1] 3258 	cp a,#CMD_END
      0090AD 0D 1E            [ 1] 3259 	jrmi term_exit
      001271                       3260 term01:	 ; check for  operator 
      0090AF 01 1D            [ 2] 3261 	ldw (N2,sp),x  ; save first factor 
      0090B1 00 02 20         [ 4] 3262 	call next_token
      0090B4 EE A6            [ 1] 3263 	cp a,#2
      0090B6 0D CD            [ 1] 3264 	jrmi 9$
      0090B8 82 26            [ 1] 3265 0$:	ld (MULOP,sp),a
      0090BA 5B 02            [ 1] 3266 	and a,#TK_GRP_MASK
      0090BC 4F 81            [ 1] 3267 	cp a,#TK_GRP_MULT
      0090BE 0A 63            [ 1] 3268 	jreq 1$
      0090C0 74 61            [ 1] 3269 	ld a,(MULOP,sp) 
      0090C2 63 6B 3A         [ 4] 3270 	call unget_token 
      0090C5 20 00            [ 2] 3271 	jra 9$
      0090C7                       3272 1$:	; got *|/|%
      0090C7 52 02 AE         [ 4] 3273 	call factor
      0090CA 90 BE            [ 1] 3274 	cp a,#TK_INTGR
      0090CC CD 82            [ 1] 3275 	jreq 2$ 
      0090CE 38 96 1C         [ 2] 3276 	jp syntax_error
      0090D1 00 07            [ 2] 3277 2$:	ldw (N1,sp),x  
      0090D3 1F 01            [ 1] 3278 	ld a,(MULOP,sp) 
      0090D5 AE 17            [ 1] 3279 	cp a,#TK_MULT 
      0090D7 FE 35            [ 1] 3280 	jrne 3$
      0090D9 10 00 07         [ 4] 3281 	call multiply 
      0090DC 20 D1            [ 2] 3282 	jra term01
      0090DC 13 01            [ 1] 3283 3$: cp a,#TK_DIV 
      0090DE 2B 0B            [ 1] 3284 	jrne 4$ 
      0090E0 89 FE CD         [ 4] 3285 	call divide 
      0090E3 8A 0D            [ 2] 3286 	jra term01 
      0090E5 85 1D 00         [ 4] 3287 4$: call modulo
      0090E8 02 20            [ 2] 3288 	jra term01 
      0090EA F1 A6            [ 2] 3289 9$: ldw x,(N2,sp)  
      0090EC 0D CD            [ 1] 3290 	ld a,#TK_INTGR 	
      0012B2                       3291 term_exit:
      0012B2                       3292 	_drop VSIZE 
      0090EE 82 26            [ 2]    1     addw sp,#VSIZE 
      0090F0 5B               [ 4] 3293 	ret 
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
      0012B5                       3306 expression:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0012B5                       3307 	_vars VSIZE 
      0090F1 02 4F            [ 2]    1     sub sp,#VSIZE 
      0090F3 81 12 68         [ 4] 3308 	call term
      0090F4 A1 02            [ 1] 3309 	cp a,#CMD_END 
      0090F4 1E 05            [ 1] 3310 	jrmi expr_exit 
      0090F6 72 FB            [ 2] 3311 0$:	ldw (N2,sp),x 
      0090F8 03 1F 03         [ 4] 3312 	call next_token
      0090FB 81 02            [ 1] 3313 	cp a,#2
      0090FC 2B 2B            [ 1] 3314 	jrmi 9$ 
      0090FC 1E 05            [ 1] 3315 1$:	ld (OP,sp),a  
      0090FE 72 F0            [ 1] 3316 	and a,#TK_GRP_MASK
      009100 03 81            [ 1] 3317 	cp a,#TK_GRP_ADD 
      009102 27 07            [ 1] 3318 	jreq 2$ 
      009102 52 03            [ 1] 3319 	ld a,(OP,sp)
      009104 0F 01 1E         [ 4] 3320 	call unget_token
      009107 06 9E            [ 2] 3321 	jra 9$
      0012D6                       3322 2$: 
      009109 A5 80 27         [ 4] 3323 	call term
      00910C 05 03            [ 1] 3324 	cp a,#TK_INTGR 
      00910E 01 50            [ 1] 3325 	jreq 3$
      009110 1F 06 1E         [ 2] 3326 	jp syntax_error
      009113 08 9E            [ 2] 3327 3$:	ldw (N1,sp),x 
      009115 A5 80            [ 1] 3328 	ld a,(OP,sp)
      009117 27 05            [ 1] 3329 	cp a,#TK_PLUS 
      009119 03 01            [ 1] 3330 	jrne 4$
      00911B 50 1F 08         [ 4] 3331 	call add 
      00911E 7B 07            [ 2] 3332 	jra 0$ 
      009120 97 7B 09         [ 4] 3333 4$:	call substract
      009123 42 1F            [ 2] 3334 	jra 0$
      009125 02 7B            [ 2] 3335 9$: ldw x,(N2,sp)
      009127 07 97            [ 1] 3336 	ld a,#TK_INTGR	
      0012F6                       3337 expr_exit:
      0012F6                       3338 	_drop VSIZE 
      009129 7B 08            [ 2]    1     addw sp,#VSIZE 
      00912B 42               [ 4] 3339 	ret 
                                   3340 
                                   3341 ;---------------------------------------------
                                   3342 ; rel ::= expr rel_op expr
                                   3343 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3344 ;  relation return 1 | 0  for true | false 
                                   3345 ;  output:
                                   3346 ;    A 		token attribute  
                                   3347 ;	 X		1|0
                                   3348 ;---------------------------------------------
                           000001  3349 	N1=1
                           000003  3350 	N2=3
                           000005  3351 	RELOP=5
                           000005  3352 	VSIZE=5 
      0012F9                       3353 relation: 
      0012F9                       3354 	_vars VSIZE
      00912C 9F 1B            [ 2]    1     sub sp,#VSIZE 
      00912E 02 6B 02         [ 4] 3355 	call expression
      009131 7B 06            [ 1] 3356 	cp a,#CMD_END  
      009133 97 7B            [ 1] 3357 	jrmi rel_exit 
                                   3358 	; expect rel_op or leave 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009135 09 42            [ 2] 3359 	ldw (N2,sp),x 
      009137 9F 1B 02         [ 4] 3360 	call next_token 
      00913A 6B 02            [ 1] 3361 	cp a,#2
      00913C 0D 01            [ 1] 3362 	jrmi 9$
      00130B                       3363 1$:	
      00913E 27 05            [ 1] 3364 	ld (RELOP,sp),a 
      009140 1E 02            [ 1] 3365 	and a,#TK_GRP_MASK
      009142 50 1F            [ 1] 3366 	cp a,#TK_GRP_RELOP 
      009144 02 07            [ 1] 3367 	jreq 2$
      009145 7B 05            [ 1] 3368 	ld a,(RELOP,sp)
      009145 1E 02 5B         [ 4] 3369 	call unget_token  
      009148 03 81            [ 2] 3370 	jra 9$
      00914A                       3371 2$:	; expect another expression or error 
      00914A 52 02 0F         [ 4] 3372 	call expression
      00914D 01 0F            [ 1] 3373 	cp a,#TK_INTGR 
      00914F 02 1E            [ 1] 3374 	jreq 3$
      009151 05 5D 26         [ 2] 3375 	jp syntax_error 
      009154 05 A6            [ 2] 3376 3$:	ldw (N1,sp),x 
      009156 04 CC 87         [ 4] 3377 	call substract
      009159 96 9E            [ 1] 3378 	jrne 4$
      00915B A5 80 27 03      [ 1] 3379 	mov acc8,#2 ; n1==n2
      00915F 03 01            [ 2] 3380 	jra 6$ 
      001331                       3381 4$: 
      009161 50 1F            [ 1] 3382 	jrsgt 5$  
      009163 05 1E 07 9E      [ 1] 3383 	mov acc8,#4 ; n1<2 
      009167 A5 80            [ 2] 3384 	jra 6$
      001339                       3385 5$:
      009169 27 05 03 01      [ 1] 3386 	mov acc8,#1 ; n1>n2 
      00133D                       3387 6$:
      00916D 03               [ 1] 3388 	clrw x 
      00916E 02 50 16         [ 1] 3389 	ld a, acc8  
      009171 05 65            [ 1] 3390 	and a,(RELOP,sp)
      009173 90               [ 1] 3391 	tnz a 
      009174 CF 00            [ 1] 3392 	jreq 10$
      009176 09               [ 1] 3393 	incw x 
      001347                       3394 7$:	 
      009177 0D 02            [ 2] 3395 	jra 10$  	
      009179 27 0B            [ 2] 3396 9$: ldw x,(N2,sp)
      00134B                       3397 10$:
      00917B 90 5D            [ 1] 3398 	ld a,#TK_INTGR
      00134D                       3399 rel_exit: 	 
      00134D                       3400 	_drop VSIZE
      00917D 27 07            [ 2]    1     addw sp,#VSIZE 
      00917F 5C               [ 4] 3401 	ret 
                                   3402 
                                   3403 ;--------------------------------
                                   3404 ; BASIC: SHOW 
                                   3405 ;  show content of dstack,cstack
                                   3406 ;--------------------------------
      001350                       3407 show:
      009180 16 05 72         [ 1] 3408 	ld a,base 
      009183 B2               [ 1] 3409 	push a 
      009184 00 09 0D         [ 4] 3410 	call dots
      009187 01 27 01         [ 4] 3411 	call dotr 
      00918A 50               [ 1] 3412 	pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00918B C7 00 06         [ 1] 3413 	ld base,a 
      00918B 5B               [ 1] 3414 	clr a 
      00918C 02               [ 4] 3415 	ret
                                   3416 
                                   3417 ;--------------------------------------------
                                   3418 ; BASIC: HEX 
                                   3419 ; select hexadecimal base for integer print
                                   3420 ;---------------------------------------------
      001360                       3421 hex_base:
      00918D 81 10 00 06      [ 1] 3422 	mov base,#16 
      00918E 81               [ 4] 3423 	ret 
                                   3424 
                                   3425 ;--------------------------------------------
                                   3426 ; BASIC: DEC 
                                   3427 ; select decimal base for integer print
                                   3428 ;---------------------------------------------
      001365                       3429 dec_base:
      00918E 1E 03 16 05      [ 1] 3430 	mov base,#10
      009192 52               [ 4] 3431 	ret 
                                   3432 
                                   3433 ;------------------------
                                   3434 ; BASIC: SIZE 
                                   3435 ; return free size in text area
                                   3436 ; output:
                                   3437 ;   A 		TK_INTGR
                                   3438 ;   X 	    size integer
                                   3439 ;--------------------------
      00136A                       3440 size:
      009193 04 1F 01         [ 2] 3441 	ldw x,#tib 
      009196 17 03 CD 91      [ 2] 3442 	subw x,txtend 
      00919A 4A 93            [ 1] 3443 	ld a,#TK_INTGR
      00919C 5B               [ 4] 3444 	ret 
                                   3445 
                                   3446 
                                   3447 ;------------------------
                                   3448 ; BASIC: UBOUND  
                                   3449 ; return array variable size 
                                   3450 ; output:
                                   3451 ;   A 		TK_INTGR
                                   3452 ;   X 	    array size 
                                   3453 ;--------------------------
      001374                       3454 ubound:
      00919D 04 81 C8         [ 2] 3455 	ldw x,#tib
      00919F 72 B0 00 1A      [ 2] 3456 	subw x,txtend 
      00919F 52 04 72 5F      [ 2] 3457 	ldw y,basicptr 
      0091A3 00 09 1F 01      [ 2] 3458 	cpw y,txtend 
      0091A7 AE A2            [ 1] 3459 	jrult 1$
      0091A9 F1 1F 03         [ 1] 3460 	push count 
      0091AC E6 02            [ 1] 3461 	push #0 
      0091AE A4 0F C7         [ 2] 3462 	subw x,(1,sp)
      00138D                       3463 	_drop 2 
      0091B1 00 0A            [ 2]    1     addw sp,#2 
      0091B3 1C               [ 2] 3464 1$:	srlw x 
      0091B4 00 03 72         [ 2] 3465 	ldw array_size,x
      0091B7 BB 00            [ 1] 3466 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0091B9 09               [ 4] 3467 	ret 
                                   3468 
                                   3469 ;-----------------------------
                                   3470 ; BASIC: LET var=expr 
                                   3471 ; variable assignement 
                                   3472 ; output:
                                   3473 ;   A 		TK_NONE 
                                   3474 ;-----------------------------
      001396                       3475 let:
      0091BA FE 13 01         [ 4] 3476 	call next_token 
      0091BD 27 0A            [ 1] 3477 	cp a,#TK_VAR 
      0091BF 1E 03            [ 1] 3478 	jreq let02
      0091C1 FE 1D 00         [ 2] 3479 	jp syntax_error
      0013A0                       3480 let02:
      0091C4 02 26 E3         [ 4] 3481 	call dpush 
      0091C7 20 05 1E         [ 4] 3482 	call next_token 
      0091CA 03 1C            [ 1] 3483 	cp a,#TK_EQUAL
      0091CC 00 02            [ 1] 3484 	jreq 1$
      0091CE 5B 04 81         [ 2] 3485 	jp syntax_error
      0091D1                       3486 1$:	
      0091D1 52 03 90         [ 4] 3487 	call relation   
      0091D4 93 04            [ 1] 3488 	cp a,#TK_INTGR 
      0091D5 27 03            [ 1] 3489 	jreq 2$
      0091D5 90 F6 A4         [ 2] 3490 	jp syntax_error
      0013B7                       3491 2$:	
      0091D8 0F 6B            [ 1] 3492 	ldw y,x 
      0091DA 01 AE 17         [ 4] 3493 	call dpop  
      0091DD 18               [ 2] 3494 	ldw (x),y   
      0091DE 17               [ 4] 3495 	ret 
                                   3496 
                                   3497 ;----------------------------
                                   3498 ; BASIC: LIST [[start][,end]]
                                   3499 ; list program lines 
                                   3500 ; form start to end 
                                   3501 ; if empty argument list then 
                                   3502 ; list all.
                                   3503 ;----------------------------
                           000001  3504 	FIRST=1
                           000003  3505 	LAST=3 
                           000005  3506 	LN_PTR=5
                           000006  3507 	VSIZE=6 
      0013BE                       3508 list:
      0013BE                       3509 	_vars VSIZE
      0091DF 02 90            [ 2]    1     sub sp,#VSIZE 
      0091E1 5C 00 18         [ 2] 3510 	ldw x,txtbgn 
      0091E2 C3 00 1A         [ 2] 3511 	cpw x,txtend 
      0091E2 F6 27            [ 1] 3512 	jrmi 1$
      0091E4 1E 0D 01         [ 2] 3513 	jp list_exit ; nothing to list 
      0091E7 27 0B            [ 2] 3514 1$:	ldw (LN_PTR,sp),x 
      0091E9 90               [ 2] 3515 	ldw x,(x) 
      0091EA F1 26            [ 2] 3516 	ldw (FIRST,sp),x ; list from first line 
      0091EC 07 90 5C         [ 2] 3517 	ldw x,#0x7fff ; biggest line number 
      0091EF 5C 0A            [ 2] 3518 	ldw (LAST,sp),x 
      0091F1 01 20 EE         [ 4] 3519 	call arg_list
      0091F4 4D               [ 1] 3520 	tnz a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0091F4 16 02            [ 1] 3521 	jreq list_start 
      0091F6 72 A2            [ 1] 3522 	cp a,#2 
      0091F8 00 02            [ 1] 3523 	jreq 4$
      0091FA 4B 00            [ 1] 3524 	cp a,#1 
      0091FC 90 FE            [ 1] 3525 	jreq first_line 
      0091FE 84 27 21         [ 2] 3526 	jp syntax_error 
      009201 20 D2 A0         [ 4] 3527 4$:	call dswap
      009203                       3528 first_line:
      009203 16 02 90         [ 4] 3529 	call dpop 
      009206 F6 6B            [ 2] 3530 	ldw (FIRST,sp),x 
      009208 01 A4            [ 1] 3531 	cp a,#1 
      00920A 0F 4C            [ 1] 3532 	jreq lines_skip 	
      0013F2                       3533 last_line:
      00920C C7 00 0A         [ 4] 3534 	call dpop 
      00920F 72 5F            [ 2] 3535 	ldw (LAST,sp),x 
      0013F7                       3536 lines_skip:
      009211 00 09 72         [ 2] 3537 	ldw x,txtbgn
      009214 B9 00            [ 2] 3538 2$:	ldw (LN_PTR,sp),x 
      009216 09 90 FE         [ 2] 3539 	cpw x,txtend 
      009219 7B 01            [ 1] 3540 	jrpl list_exit 
      00921B 4E               [ 2] 3541 	ldw x,(x) ;line# 
      00921C A4 0C            [ 2] 3542 	cpw x,(FIRST,sp)
      00921E 44 44            [ 1] 3543 	jrpl list_start 
      009220 AB 06            [ 2] 3544 	ldw x,(LN_PTR,sp) 
      009222 1C 00 02         [ 2] 3545 	addw x,#2 
      009222 93               [ 1] 3546 	ld a,(x)
      009223 5B               [ 1] 3547 	incw x 
      009224 03 81 09         [ 1] 3548 	ld acc8,a 
      009226 72 5F 00 08      [ 1] 3549 	clr acc16 
      009226 88 CD 88 74      [ 2] 3550 	addw x,acc16
      00922A 11 01            [ 2] 3551 	jra 2$ 
                                   3552 ; print loop
      00141A                       3553 list_start:
      00922C 27 03            [ 2] 3554 	ldw x,(LN_PTR,sp)
      00141C                       3555 3$:	
      00922E CC 87 94         [ 4] 3556 	call prt_basic_line
      009231 84 81            [ 2] 3557 	ldw x,(LN_PTR,sp)
      009233 E6 02            [ 1] 3558 	ld a,(2,x)
      009233 4B 00 CD         [ 1] 3559 	ld acc8,a 
      009236 93 79 A1 00      [ 1] 3560 	clr acc16 
      00923A 27 19 A1 04      [ 2] 3561 	addw x,acc16
      00923E 26 12 CD         [ 2] 3562 	cpw x,txtend 
      009241 90 06            [ 1] 3563 	jrpl list_exit
      009243 0C 01            [ 2] 3564 	ldw (LN_PTR,sp),x
      009245 CD               [ 2] 3565 	ldw x,(x)
      009246 88 74            [ 2] 3566 	cpw x,(LAST,sp)  
      009248 A1 00            [ 1] 3567 	jrsgt list_exit 
      00924A 27 09            [ 2] 3568 	ldw x,(LN_PTR,sp)
      00924C A1 0D            [ 2] 3569 	jra 3$
      00143E                       3570 list_exit:
      00143E                       3571 	_drop VSIZE 
      00924E 26 02            [ 2]    1     addw sp,#VSIZE 
      009250 20               [ 4] 3572 	ret
                                   3573 
                                   3574 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3575 ; print counted string 
                                   3576 ; input:
                                   3577 ;   X 		address of string
                                   3578 ;--------------------------
      001441                       3579 prt_cmd_name:
      009251 E3               [ 1] 3580 	ld a,(x)
      009252 CD               [ 1] 3581 	incw x
      009253 90 00            [ 1] 3582 	and a,#15  
      009255 84               [ 1] 3583 	push a 
      009256 81 01            [ 1] 3584 1$: tnz (1,sp) 
      009257 27 09            [ 1] 3585 	jreq 9$
      009257 A6               [ 1] 3586 	ld a,(x)
      009258 0B CD 92         [ 4] 3587 	call putc 
      00925B 26               [ 1] 3588 	incw x
      00925C CD 92            [ 1] 3589 	dec (1,sp)	 
      00925E 33 88            [ 2] 3590 	jra 1$
      009260 A6               [ 1] 3591 9$: pop a 
      009261 0C               [ 4] 3592 	ret	
                                   3593 
                                   3594 ;--------------------------
                                   3595 ; print TK_QSTR
                                   3596 ; converting control character
                                   3597 ; to backslash sequence
                                   3598 ; input:
                                   3599 ;   X        char *
                                   3600 ;-----------------------------
      001455                       3601 prt_quote:
      009262 CD 92            [ 1] 3602 	ld a,#'"
      009264 26 84 81         [ 4] 3603 	call putc 
      009267 F6               [ 1] 3604 1$:	ld a,(x)
      009267 CD 92            [ 1] 3605 	jreq 9$
      009269 57               [ 1] 3606 	incw x 
      00926A A1 01            [ 1] 3607 	cp a,#SPACE 
      00926C 27 03            [ 1] 3608 	jrult 3$
      00926E CC 87 94         [ 4] 3609 	call putc
      009271 CD 90            [ 1] 3610 	cp a,#'\ 
      009273 13 C3            [ 1] 3611 	jrne 1$ 
      001469                       3612 2$:
      009275 00 1E 23         [ 4] 3613 	call putc 
      009278 05 A6            [ 2] 3614 	jra 1$
      00927A 0A               [ 1] 3615 3$: push a 
      00927B CC 87            [ 1] 3616 	ld a,#'\
      00927D 96 5D 27         [ 4] 3617 	call putc 
      009280 F8               [ 1] 3618 	pop a 
      009281 58 89            [ 1] 3619 	sub a,#7
      009283 AE 16 C8         [ 1] 3620 	ld acc8,a 
      009286 72 F0 01 5B      [ 1] 3621 	clr acc16
      00928A 02 A6 04 81      [ 2] 3622 	ldw y,#escaped 
      00928E 72 B9 00 08      [ 2] 3623 	addw y,acc16 
      00928E 52 01            [ 1] 3624 	ld a,(y)
      009290 CD 88            [ 2] 3625 	jra 2$
      009292 74 A1            [ 1] 3626 9$: ld a,#'"
      009294 02 2B 4E         [ 4] 3627 	call putc 
      009297 6B               [ 1] 3628 	incw x 
      009298 01               [ 4] 3629 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3630 
                                   3631 
                                   3632 ;--------------------------
                                   3633 ; decompile line from token list 
                                   3634 ; input:
                                   3635 ;   X 		pointer at line
                                   3636 ; output:
                                   3637 ;   none 
                                   3638 ;--------------------------	
                           000001  3639 	BASE_SAV=1
                           000002  3640 	WIDTH_SAV=2
                           000003  3641 	XSAVE=3
                           000005  3642 	LLEN=5
                           000005  3643 	VSIZE=5 
      001491                       3644 prt_basic_line:
      001491                       3645 	_vars VSIZE 
      009299 A4 30            [ 2]    1     sub sp,#VSIZE 
      00929B A1 10 27         [ 1] 3646 	ld a,base
      00929E 04 7B            [ 1] 3647 	ld (BASE_SAV,sp),a  
      0092A0 01 20 03         [ 1] 3648 	ld a,tab_width 
      0092A3 6B 02            [ 1] 3649 	ld (WIDTH_SAV,sp),a 
      0092A3 CD 88 74         [ 2] 3650 	ldw ptr16,x
      0092A6 FE               [ 2] 3651 	ldw x,(x)
      0092A6 A1 07 26 03      [ 1] 3652 	mov base,#10
      0092AA FD 20 2F 20      [ 1] 3653 	mov tab_width,#5
      0092AD CD 09 8D         [ 4] 3654 	call print_int ; print line number 
      0092AD A1 04            [ 1] 3655 	ld a,#SPACE 
      0092AF 26 02 20         [ 4] 3656 	call putc 
      0092B2 29 5F 00 20      [ 1] 3657 	clr tab_width
      0092B3 AE 00 02         [ 2] 3658 	ldw x,#2
      0092B3 A1 02 26 06      [ 4] 3659 	ld a,([ptr16],x)
      0092B7 CD 92            [ 1] 3660 	ld (LLEN,sp),a 
      0092B9 67               [ 1] 3661 	incw x
      0092BA FE               [ 1] 3662 1$:	ld a,xl 
      0092BB 20 1F            [ 1] 3663 	cp a,(LLEN,sp)
      0092BD 2B 03            [ 1] 3664 	jrmi 20$
      0092BD A1 05 26         [ 2] 3665 	jp 90$
      0014C7                       3666 20$:	 
      0092C0 03 FE 20 18      [ 4] 3667 	ld a,([ptr16],x)
      0092C4 5C               [ 1] 3668 	incw x 
      0092C4 A1 09            [ 2] 3669 	ldw (XSAVE,sp),x 
      0092C6 27 14            [ 1] 3670 	cp a,#TK_CMD 
      0092C8 25 44            [ 1] 3671 	jrult 5$
      0092C8 A1 0B            [ 1] 3672 	cp a,#TK_CONST 
      0092CA 26 0A            [ 1] 3673 	jrugt 4$
      0014D6                       3674 2$:	
      0092CC CD 93 79 A6      [ 5] 3675 	ldw x,([ptr16],x)
      0092D0 0C CD 92         [ 2] 3676 	cpw x,#rem 
      0092D3 26 20            [ 1] 3677 	jrne 3$
      0092D5 06 27            [ 1] 3678 	ld a,#''
      0092D6 CD 01 A6         [ 4] 3679 	call putc 
      0092D6 CD 90            [ 2] 3680 	ldw x,(XSAVE,sp)
      0092D8 00 4F 20         [ 2] 3681 	addw x,#2
      0092DB 09 BB 00 11      [ 2] 3682 	addw x,ptr16  
      0092DC CD 01 B8         [ 4] 3683 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0092DC A6 11 11         [ 2] 3684 	jp 90$ 
      0092DF 01 26 01         [ 4] 3685 3$:	call cmd_name
      0092E2 50 14 41         [ 4] 3686 	call prt_cmd_name
      0092E3 A6 20            [ 1] 3687 	ld a,#SPACE 
      0092E3 A6 04 A6         [ 4] 3688 	call putc 
      0092E5 1E 03            [ 2] 3689 	ldw x,(XSAVE,sp)
      0092E5 5B 01 81         [ 2] 3690 	addw x,#2
      0092E8 20 BA            [ 2] 3691 	jra 1$
      0092E8 52 05            [ 1] 3692 4$: cp a,#TK_QSTR 
      0092EA CD 92            [ 1] 3693 	jrne 5$
      0092EC 8E A1 02 2B      [ 2] 3694 	addw x,ptr16
      0092F0 41 14 55         [ 4] 3695 	call prt_quote 
      0092F1 72 B0 00 11      [ 2] 3696 	subw x,ptr16  
      0092F1 1F 03            [ 2] 3697 	jra 1$
      0092F3 CD 88            [ 1] 3698 5$:	cp a,#TK_VAR
      0092F5 74 A1            [ 1] 3699 	jrne 6$ 
      0092F7 02 2B 34 6B      [ 5] 3700 	ldw x,([ptr16],x)
      0092FB 05 A4 30         [ 2] 3701 	subw x,#vars 
      0092FE A1               [ 1] 3702 	ld a,xl
      0092FF 20               [ 1] 3703 	srl a 
      009300 27 07            [ 1] 3704 	add a,#'A 
      009302 7B 05 CD         [ 4] 3705 	call putc 
      009305 90 00            [ 1] 3706 	ld a,#SPACE 
      009307 20 25 A6         [ 4] 3707 	call putc 
      009309 1E 03            [ 2] 3708 	ldw x,(XSAVE,sp)
      009309 CD 92 8E         [ 2] 3709 	addw x,#2 
      00930C A1 04            [ 2] 3710 	jra 1$ 
      00930E 27 03            [ 1] 3711 6$: cp a,#TK_ARRAY 
      009310 CC 87            [ 1] 3712 	jrne 7$
      009312 94 1F            [ 1] 3713 	ld a,#'@ 
      009314 01 7B 05         [ 4] 3714 	call putc 
      009317 A1 20            [ 2] 3715 	ldw x,(XSAVE,sp)
      009319 26 05 CD         [ 2] 3716 	jp 1$ 
      00931C 91 02            [ 1] 3717 7$: cp a,#TK_INTGR 
      00931E 20 D1            [ 1] 3718 	jrne 8$
      009320 A1 21 26 05      [ 5] 3719 	ldw x,([ptr16],x)
      009324 CD 91 4A         [ 4] 3720 	call print_int
      009327 20 C8            [ 1] 3721 	ld a,#SPACE 
      009329 CD 91 8E         [ 4] 3722 	call putc 
      00932C 20 C3            [ 2] 3723 	ldw x,(XSAVE,sp)
      00932E 1E 03 A6         [ 2] 3724 	addw x,#2 
      009331 04 14 BF         [ 2] 3725 	jp 1$
      009332 A1 31            [ 1] 3726 8$: cp a,#TK_GT 
      009332 5B 05            [ 1] 3727 	jrmi 9$
      009334 81 35            [ 1] 3728 	cp a,#TK_NE 
      009335 22 16            [ 1] 3729 	jrugt 9$
      009335 52 05            [ 1] 3730 	sub a,#TK_GT  
      009337 CD               [ 1] 3731 	sll a 
      009338 92 E8            [ 1] 3732 	clrw y 
      00933A A1 02            [ 1] 3733 	ld yl,a 
      00933C 2B 38 1F 03      [ 2] 3734 	addw y,#relop_str 
      009340 CD 88            [ 2] 3735 	ldw y,(y)
      009342 74               [ 1] 3736 	ldw x,y 
      009343 A1 02 2B         [ 4] 3737 	call puts 
      009346 2B 6B            [ 2] 3738 	ldw x,(XSAVE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009348 05 A4 30         [ 2] 3739 	jp 1$
      00934B A1 10            [ 1] 3740 9$: cp a,#TK_PLUS 
      00934D 27 07            [ 1] 3741 	jrne 10$
      00934F 7B 05            [ 1] 3742 	ld a,#'+
      009351 CD 90            [ 2] 3743 	jra 80$ 
      009353 00 20            [ 1] 3744 10$: cp a,#TK_MINUS
      009355 1C 04            [ 1] 3745 	jrne 11$
      009356 A6 2D            [ 1] 3746 	ld a,#'-
      009356 CD 92            [ 2] 3747 	jra 80$
      009358 E8 A1            [ 1] 3748 11$: cp a,#TK_MULT 
      00935A 04 27            [ 1] 3749 	jrmi 12$
      00935C 03 CC            [ 1] 3750 	cp a,#TK_MOD 
      00935E 87 94            [ 1] 3751 	jrugt 12$
      009360 1F 01            [ 1] 3752 	sub a,#0x20
      009362 7B               [ 1] 3753 	clrw x 
      009363 05               [ 1] 3754 	ld xl,a 
      009364 A1 10 26         [ 2] 3755 	addw x,#mul_char 
      009367 05               [ 1] 3756 	ld a,(x)
      009368 CD 90            [ 2] 3757 	jra 80$ 
      00936A F4 20            [ 1] 3758 12$: cp a,#TK_LPAREN 
      00936C D1 CD            [ 1] 3759 	jrmi 13$
      00936E 90 FC            [ 1] 3760 	cp a,#TK_SHARP 
      009370 20 CC            [ 1] 3761 	jrugt 13$
      009372 1E 03            [ 1] 3762 	sub a,#TK_LPAREN
      009374 A6               [ 1] 3763 	clrw x 
      009375 04               [ 1] 3764 	ld xl,a 
      009376 1C 15 E0         [ 2] 3765 	addw x,#single_char 
      009376 5B               [ 1] 3766 	ld a,(x)
      009377 05 81            [ 2] 3767 	jra 80$
      009379 A1 03            [ 1] 3768 13$: cp a,#TK_CHAR 
      009379 52 05            [ 1] 3769 	jrne 14$
      00937B CD 93            [ 1] 3770 	ld a,#'\
      00937D 35 A1 02         [ 4] 3771 	call putc 
      009380 2B 4B            [ 2] 3772 	ldw x,(XSAVE,sp)
      009382 1F 03 CD 88      [ 4] 3773 	ld a,([ptr16],x)
      009386 74               [ 1] 3774 	incw x 
      009387 A1 02            [ 2] 3775 	ldw (XSAVE,sp),x 
      009389 2B 3E A6         [ 4] 3776 	call putc 
      00938B CC 14 BF         [ 2] 3777 	jp 1$ 
      00938B 6B 05            [ 1] 3778 14$: ld a,#':
      00938D A4 30 A1         [ 4] 3779 80$: call putc 
      009390 30 27            [ 2] 3780 	ldw x,(XSAVE,sp)
      009392 07 7B 05         [ 2] 3781 	jp 1$ 
      0015CE                       3782 90$: 
      009395 CD 90            [ 1] 3783 	ld a,#CR 
      009397 00 20 2F         [ 4] 3784 	call putc
      00939A 7B 02            [ 1] 3785 	ld a,(WIDTH_SAV,sp) 
      00939A CD 93 35         [ 1] 3786 	ld tab_width,a 
      00939D A1 04            [ 1] 3787 	ld a,(BASE_SAV,sp) 
      00939F 27 03 CC         [ 1] 3788 	ld base,a
      0015DD                       3789 	_drop VSIZE 
      0093A2 87 94            [ 2]    1     addw sp,#VSIZE 
      0093A4 1F               [ 4] 3790 	ret 	
      0093A5 01 CD 90 FC           3791 single_char: .byte '(',')',',','#'
      0093A9 26 06 35              3792 mul_char: .byte '*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0093AC 02 00 0A 20 0C F7 15  3793 relop_str: .word gt,equal,ge,lt,le,ne 
             FA 15 FC 15 FF
      0093B1 3E 00                 3794 gt: .asciz ">"
      0093B1 2C 06                 3795 equal: .asciz "="
      0093B3 35 04 00              3796 ge: .asciz ">="
      0093B6 0A 20                 3797 lt: .asciz "<"
      0093B8 04 3D 00              3798 le: .asciz "<="
      0093B9 3C 3E 00              3799 ne:  .asciz "<>"
                                   3800 
                                   3801 
                                   3802 ;---------------------------------
                                   3803 ; BASIC: PRINT|? arg_list 
                                   3804 ; print values from argument list
                                   3805 ;----------------------------------
                           000001  3806 	COMMA=1
                           000001  3807 	VSIZE=1
      001602                       3808 print:
      0093B9 35 01            [ 1] 3809 push #0 ; local variable COMMA 
      001604                       3810 reset_comma:
      0093BB 00 0A            [ 1] 3811 	clr (COMMA,sp)
      0093BD                       3812 prt_loop:
      0093BD 5F C6 00         [ 4] 3813 	call relation 
      0093C0 0A 14            [ 1] 3814 	cp a,#TK_COLON 
      0093C2 05 4D            [ 1] 3815 	jreq print_exit   
      0093C4 27 05            [ 1] 3816 	cp a,#TK_INTGR 
      0093C6 5C 05            [ 1] 3817 	jrne 0$ 
      0093C7 CD 09 8D         [ 4] 3818 	call print_int 
      0093C7 20 02            [ 2] 3819 	jra reset_comma
      001616                       3820 0$: 	
      0093C9 1E 03 F4         [ 4] 3821 	call next_token
      0093CB A1 00            [ 1] 3822 	cp a,#TK_NONE 
      0093CB A6 04            [ 1] 3823 	jreq print_exit 
      0093CD A1 0A            [ 1] 3824 1$:	cp a,#TK_QSTR
      0093CD 5B 05            [ 1] 3825 	jrne 2$   
      0093CF 81 01 B8         [ 4] 3826 	call puts
      0093D0 5C               [ 1] 3827 	incw x 
      0093D0 C6 00 07 88      [ 2] 3828 	subw x,basicptr 
      0093D4 CD               [ 1] 3829 	ld a,xl 
      0093D5 90 94 CD         [ 1] 3830 	ld in,a  
      0093D8 90 C7            [ 2] 3831 	jra reset_comma
      0093DA 84 C7            [ 1] 3832 2$: cp a,#TK_CHAR 
      0093DC 00 07            [ 1] 3833 	jrne 3$
      0093DE 4F               [ 1] 3834 	ld a,xl 
      0093DF 81 01 A6         [ 4] 3835 	call putc 
      0093E0 20 CB            [ 2] 3836 	jra reset_comma 
      001639                       3837 3$: 	
      0093E0 35 10            [ 1] 3838 	cp a,#TK_CFUNC 
      0093E2 00 07            [ 1] 3839 	jrne 4$ 
      0093E4 81               [ 4] 3840 	call (x)
      0093E5 9F               [ 1] 3841 	ld a,xl 
      0093E5 35 0A 00         [ 4] 3842 	call putc
      0093E8 07 81            [ 2] 3843 	jra reset_comma 
      0093EA                       3844 4$: 
      0093EA AE 16            [ 1] 3845 	cp a,#TK_COMMA 
      0093EC C8 72            [ 1] 3846 	jrne 5$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0093EE B0 00            [ 1] 3847 	cpl (COMMA,sp) 
      0093F0 1B A6 04         [ 2] 3848 	jp prt_loop   
      00164D                       3849 5$: 
      0093F3 81 0E            [ 1] 3850 	cp a,#TK_SHARP
      0093F4 26 13            [ 1] 3851 	jrne 7$
      0093F4 AE 16 C8         [ 4] 3852 	call next_token
      0093F7 72 B0            [ 1] 3853 	cp a,#TK_INTGR 
      0093F9 00 1B            [ 1] 3854 	jreq 6$
      0093FB 90 CE 00         [ 2] 3855 	jp syntax_error 
      00165B                       3856 6$:
      0093FE 05               [ 1] 3857 	ld a,xl 
      0093FF 90 C3            [ 1] 3858 	and a,#15 
      009401 00 1B 25         [ 1] 3859 	ld tab_width,a 
      009404 0A 3B 00         [ 2] 3860 	jp reset_comma 
      001664                       3861 7$:	
      009407 04 4B 00         [ 4] 3862 	call unget_token
      001667                       3863 print_exit:
      00940A 72 F0            [ 1] 3864 	tnz (COMMA,sp)
      00940C 01 5B            [ 1] 3865 	jrne 9$
      00940E 02 54            [ 1] 3866 	ld a,#CR 
      009410 CF 00 1E         [ 4] 3867     call putc 
      001670                       3868 9$:	_drop VSIZE 
      009413 A6 04            [ 2]    1     addw sp,#VSIZE 
      009415 81               [ 4] 3869 	ret 
                                   3870 
                                   3871 ;----------------------
                                   3872 ; 'save_context' and
                                   3873 ; 'rest_context' must be 
                                   3874 ; called at the same 
                                   3875 ; call stack depth 
                                   3876 ; i.e. SP must have the 
                                   3877 ; save value at  
                                   3878 ; entry point of both 
                                   3879 ; routine. 
                                   3880 ;---------------------
                           000006  3881 	CTXT_SIZE=6 ; size of saved data 
                                   3882 ;--------------------
                                   3883 ; save current BASIC
                                   3884 ; interpreter context 
                                   3885 ; on cstack 
                                   3886 ;--------------------
      009416                       3887 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001673                       3888 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001673                       3889 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001673                       3890 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001673                       3891 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      001673                       3892 save_context:
      009416 CD 88 74         [ 2] 3893 	ldw x,basicptr 
      009419 A1 05            [ 2] 3894 	ldw (BPTR,sp),x
      00941B 27 03 CC         [ 1] 3895 	ld a,in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00941E 87 94            [ 1] 3896 	ld (IN,sp),a
      009420 C6 00 03         [ 1] 3897 	ld a,count 
      009420 CD 90            [ 1] 3898 	ld (CNT,sp),a  
      009422 06               [ 4] 3899 	ret
                                   3900 
                                   3901 ;-----------------------
                                   3902 ; restore previously saved 
                                   3903 ; BASIC interpreter context 
                                   3904 ; from cstack 
                                   3905 ;-------------------------
      001683                       3906 rest_context:
      009423 CD 88            [ 2] 3907 	ldw x,(BPTR,sp)
      009425 74 A1 32         [ 2] 3908 	ldw basicptr,x 
      009428 27 03            [ 1] 3909 	ld a,(IN,sp)
      00942A CC 87 94         [ 1] 3910 	ld in,a
      00942D 7B 08            [ 1] 3911 	ld a,(CNT,sp)
      00942D CD 93 79         [ 1] 3912 	ld count,a  
      009430 A1               [ 4] 3913 	ret
                                   3914 
                                   3915 ;------------------------------------------
                                   3916 ; BASIC: INPUT [string],var[,[string],var]
                                   3917 ; input value in variables 
                                   3918 ; [string] optionally can be used as prompt 
                                   3919 ;-----------------------------------------
                           000001  3920 	CX_BPTR=1
                           000003  3921 	CX_LNO=3
                           000004  3922 	CX_IN=4
                           000005  3923 	CX_CNT=5
                           000006  3924 	SKIP=6
                           000007  3925 	VSIZE=7
      001693                       3926 input_var:
      009431 04 27 03 CC 87   [ 2] 3927 	btjt flags,#FRUN,1$ 
      009436 94 06            [ 1] 3928 	ld a,#ERR_RUN_ONLY 
      009437 CC 07 16         [ 2] 3929 	jp tb_error 
      00169D                       3930 1$:	_vars VSIZE 
      009437 90 93            [ 2]    1     sub sp,#VSIZE 
      00169F                       3931 input_loop:
      009439 CD 90            [ 1] 3932 	clr (SKIP,sp)
      00943B 13 FF 81         [ 4] 3933 	call next_token 
      00943E A1 00            [ 1] 3934 	cp a,#TK_NONE 
      00943E 52 06            [ 1] 3935 	jreq input_exit 
      009440 CE 00            [ 1] 3936 	cp a,#TK_QSTR 
      009442 19 C3            [ 1] 3937 	jrne 1$ 
      009444 00 1B 2B         [ 4] 3938 	call puts 
      009447 03 CC            [ 1] 3939 	cpl (SKIP,sp)
      009449 94 BE 1F         [ 4] 3940 	call next_token 
      00944C 05 FE            [ 1] 3941 1$: cp a,#TK_VAR  
      00944E 1F 01            [ 1] 3942 	jreq 2$ 
      009450 AE 7F FF         [ 2] 3943 	jp syntax_error
      009453 1F 03 CD         [ 4] 3944 2$:	call dpush 
      009456 92 33            [ 1] 3945 	tnz (SKIP,sp)
      009458 4D 27            [ 1] 3946 	jrne 21$ 
      00945A 3F A1            [ 1] 3947 	ld a,#':
      00945C 02 27 07         [ 1] 3948 	ld pad+1,a 
      00945F A1 01 27 06      [ 1] 3949 	clr pad+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009463 CC 87 94         [ 2] 3950 	ldw x,#pad 
      009466 CD 90 20         [ 4] 3951 	call puts   
      009469                       3952 21$:
      009469 CD 90 13         [ 4] 3953 	call save_context 
      00946C 1F 01 A1         [ 2] 3954 	ldw x,#tib 
      00946F 01 27 05         [ 2] 3955 	ldw basicptr,x  
      009472 72 5F 00 03      [ 1] 3956 	clr count  
      009472 CD 90 13         [ 4] 3957 	call readln 
      009475 1F 03 00 01      [ 1] 3958 	clr in 
      009477 CD 12 F9         [ 4] 3959 	call relation 
      009477 CE 00            [ 1] 3960 	cp a,#TK_INTGR
      009479 19 1F            [ 1] 3961 	jreq 3$ 
      00947B 05 C3 00         [ 2] 3962 	jp syntax_error
      00947E 1B 2A 3D         [ 4] 3963 3$: call dpush 
      009481 FE 13 01         [ 4] 3964 	call store 
      009484 2A 14 1E         [ 4] 3965 	call rest_context
      009487 05 1C 00         [ 4] 3966 	call next_token 
      00948A 02 F6            [ 1] 3967 	cp a,#TK_COMMA 
      00948C 5C C7            [ 1] 3968 	jrne 4$
      00948E 00 0A            [ 2] 3969 	jra input_loop 
      009490 72 5F 00         [ 4] 3970 4$:	call unget_token 
      001704                       3971 input_exit:
      001704                       3972 	_drop VSIZE 
      009493 09 72            [ 2]    1     addw sp,#VSIZE 
      009495 BB               [ 4] 3973 	ret 
                                   3974 
                                   3975 
                                   3976 ;---------------------
                                   3977 ; BASIC: REMARK | ' 
                                   3978 ; skip comment to end of line 
                                   3979 ;---------------------- 
      001707                       3980 rem:
      009496 00 09 20 E0 03   [ 1] 3981  	mov count,in 
      00949A 81               [ 4] 3982 	ret 
                                   3983 
                                   3984 ;---------------------
                                   3985 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3986 ; read in loop 'addr'  
                                   3987 ; apply & 'mask' to value 
                                   3988 ; loop while result==0.  
                                   3989 ; if 'xor_mask' given 
                                   3990 ; apply ^ in second  
                                   3991 ; loop while result==0 
                                   3992 ;---------------------
                           000001  3993 	XMASK=1 
                           000002  3994 	MASK=2
                           000003  3995 	ADDR=3
                           000004  3996 	VSIZE=4
      00170D                       3997 wait: 
      00170D                       3998 	_vars VSIZE
      00949A 1E 05            [ 2]    1     sub sp,#VSIZE 
      00949C 0F 01            [ 1] 3999 	clr (XMASK,sp) 
      00949C CD 95 11         [ 4] 4000 	call arg_list 
      00949F 1E 05            [ 1] 4001 	cp a,#2
      0094A1 E6 02            [ 1] 4002 	jruge 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0094A3 C7 00 0A         [ 2] 4003 	jp syntax_error 
      0094A6 72 5F            [ 1] 4004 0$:	cp a,#3
      0094A8 00 09            [ 1] 4005 	jrult 1$
      0094AA 72 BB 00         [ 4] 4006 	call dpop 
      0094AD 09               [ 1] 4007 	ld a,xl
      0094AE C3 00            [ 1] 4008 	ld (XMASK,sp),a 
      0094B0 1B 2A 0B         [ 4] 4009 1$: call dpop ; mask 
      0094B3 1F               [ 1] 4010 	ld a,xl 
      0094B4 05 FE            [ 1] 4011 	ld (MASK,sp),a 
      0094B6 13 03 2C         [ 4] 4012 	call dpop ; address 
      0094B9 04               [ 1] 4013 2$:	ld a,(x)
      0094BA 1E 05            [ 1] 4014 	and a,(MASK,sp)
      0094BC 20 DE            [ 1] 4015 	xor a,(XMASK,sp)
      0094BE 27 F9            [ 1] 4016 	jreq 2$ 
      001735                       4017 	_drop VSIZE 
      0094BE 5B 06            [ 2]    1     addw sp,#VSIZE 
      0094C0 81               [ 4] 4018 	ret 
                                   4019 
                                   4020 ;---------------------
                                   4021 ; BASIC: BSET addr,mask
                                   4022 ; set bits at 'addr' corresponding 
                                   4023 ; to those of 'mask' that are at 1.
                                   4024 ; arguments:
                                   4025 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4026 ;   mask        mask|addr
                                   4027 ; output:
                                   4028 ;	none 
                                   4029 ;--------------------------
      0094C1                       4030 bit_set:
      0094C1 F6 5C A4         [ 4] 4031 	call arg_list 
      0094C4 0F 88            [ 1] 4032 	cp a,#2	 
      0094C6 0D 01            [ 1] 4033 	jreq 1$ 
      0094C8 27 09 F6         [ 2] 4034 	jp syntax_error
      001742                       4035 1$: 
      0094CB CD 82 26         [ 4] 4036 	call dpop ; mask 
      0094CE 5C               [ 1] 4037 	ld a,xl 
      0094CF 0A 01 20         [ 4] 4038 	call dpop ; addr  
      0094D2 F3               [ 1] 4039 	or a,(x)
      0094D3 84               [ 1] 4040 	ld (x),a
      0094D4 81               [ 4] 4041 	ret 
                                   4042 
                                   4043 ;---------------------
                                   4044 ; BASIC: BRES addr,mask
                                   4045 ; reset bits at 'addr' corresponding 
                                   4046 ; to those of 'mask' that are at 1.
                                   4047 ; arguments:
                                   4048 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4049 ;   mask	    ~mask&*addr  
                                   4050 ; output:
                                   4051 ;	none 
                                   4052 ;--------------------------
      0094D5                       4053 bit_reset:
      0094D5 A6 22 CD         [ 4] 4054 	call arg_list 
      0094D8 82 26            [ 1] 4055 	cp a,#2  
      0094DA F6 27            [ 1] 4056 	jreq 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0094DC 2D 5C A1         [ 2] 4057 	jp syntax_error
      001756                       4058 1$: 
      0094DF 20 25 0C         [ 4] 4059 	call dpop ; mask 
      0094E2 CD               [ 1] 4060 	ld a,xl 
      0094E3 82               [ 1] 4061 	cpl a 
      0094E4 26 A1 5C         [ 4] 4062 	call dpop ; addr  
      0094E7 26               [ 1] 4063 	and a,(x)
      0094E8 F1               [ 1] 4064 	ld (x),a 
      0094E9 81               [ 4] 4065 	ret 
                                   4066 
                                   4067 ;---------------------
                                   4068 ; BASIC: BRES addr,mask
                                   4069 ; toggle bits at 'addr' corresponding 
                                   4070 ; to those of 'mask' that are at 1.
                                   4071 ; arguments:
                                   4072 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4073 ;   mask	    mask^*addr  
                                   4074 ; output:
                                   4075 ;	none 
                                   4076 ;--------------------------
      001761                       4077 bit_toggle:
      0094E9 CD 82 26         [ 4] 4078 	call arg_list 
      0094EC 20 EC            [ 1] 4079 	cp a,#2 
      0094EE 88 A6            [ 1] 4080 	jreq 1$ 
      0094F0 5C CD 82         [ 2] 4081 	jp syntax_error
      0094F3 26 84 A0         [ 4] 4082 1$: call dpop ; mask 
      0094F6 07               [ 1] 4083 	ld a,xl 
      0094F7 C7 00 0A         [ 4] 4084 	call dpop ; addr  
      0094FA 72               [ 1] 4085 	xor a,(x)
      0094FB 5F               [ 1] 4086 	ld (x),a 
      0094FC 00               [ 4] 4087 	ret 
                                   4088 
                                   4089 
                                   4090 ;---------------------
                                   4091 ; BASIC: BTEST(addr,bit)
                                   4092 ; return bit value at 'addr' 
                                   4093 ; bit is in range {0..7}.
                                   4094 ; arguments:
                                   4095 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4096 ;   bit 	    bit position {0..7}  
                                   4097 ; output:
                                   4098 ;	none 
                                   4099 ;--------------------------
      001775                       4100 bit_test:
      0094FD 09 90 AE         [ 4] 4101 	call func_args 
      009500 8C CF            [ 1] 4102 	cp a,#2
      009502 72 B9            [ 1] 4103 	jreq 0$
      009504 00 09 90         [ 2] 4104 	jp syntax_error
      00177F                       4105 0$:	
      009507 F6 20 DF         [ 4] 4106 	call dpop 
      00950A A6               [ 1] 4107 	ld a,xl 
      00950B 22 CD            [ 1] 4108 	and a,#7
      00950D 82               [ 1] 4109 	push a 
      00950E 26 5C            [ 1] 4110 	ld a,#1 
      009510 81 01            [ 1] 4111 1$: tnz (1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009511 27 05            [ 1] 4112 	jreq 2$
      009511 52               [ 1] 4113 	sll a 
      009512 05 C6            [ 1] 4114 	dec (1,sp)
      009514 00 07            [ 2] 4115 	jra 1$
      009516 6B 01 C6         [ 4] 4116 2$: call dpop 
      009519 00               [ 1] 4117 	and a,(x)
      00951A 21 6B            [ 1] 4118 	jreq 3$
      00951C 02 CF            [ 1] 4119 	ld a,#1 
      00951E 00               [ 1] 4120 3$:	clrw x 
      00951F 12               [ 1] 4121 	ld xl,a 
      009520 FE 35            [ 1] 4122 	ld a,#TK_INTGR
      00179D                       4123 	_drop 1 
      009522 0A 00            [ 2]    1     addw sp,#1 
      009524 07               [ 4] 4124 	ret
                                   4125 
                                   4126 
                                   4127 ;--------------------
                                   4128 ; BASIC: POKE addr,byte
                                   4129 ; put a byte at addr 
                                   4130 ;--------------------
      0017A0                       4131 poke:
      009525 35 05 00         [ 4] 4132 	call arg_list 
      009528 21 CD            [ 1] 4133 	cp a,#2
      00952A 8A 0D            [ 1] 4134 	jreq 1$
      00952C A6 20 CD         [ 2] 4135 	jp syntax_error
      0017AA                       4136 1$:	
      00952F 82 26 72         [ 4] 4137 	call dpop 
      009532 5F               [ 1] 4138     ld a,xl 
      009533 00 21 AE         [ 4] 4139 	call dpop 
      009536 00               [ 1] 4140 	ld (x),a 
      009537 02               [ 4] 4141 	ret 
                                   4142 
                                   4143 ;-----------------------
                                   4144 ; BASIC: PEEK(addr)
                                   4145 ; get the byte at addr 
                                   4146 ; input:
                                   4147 ;	none 
                                   4148 ; output:
                                   4149 ;	X 		value 
                                   4150 ;-----------------------
      0017B3                       4151 peek:
      009538 72 D6 00         [ 4] 4152 	call func_args
      00953B 12 6B            [ 1] 4153 	cp a,#1
      00953D 05 5C            [ 1] 4154 	jreq 1$
      00953F 9F 11 05         [ 2] 4155 	jp syntax_error
      009542 2B 03 CC         [ 4] 4156 1$:	call dpop 
      009545 96               [ 1] 4157 	ld a,(x)
      009546 4E               [ 1] 4158 	clrw x 
      009547 97               [ 1] 4159 	ld xl,a 
      009547 72 D6            [ 1] 4160 	ld a,#TK_INTGR
      009549 00               [ 4] 4161 	ret 
                                   4162 
      0017C6                       4163 if: 
      00954A 12 5C 1F         [ 4] 4164 	call relation 
      00954D 03 A1            [ 1] 4165 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00954F 06 25            [ 1] 4166 	jreq 1$ 
      009551 44 A1 09         [ 2] 4167 	jp syntax_error
      009554 22               [ 1] 4168 1$:	clr a 
      009555 2F               [ 2] 4169 	tnzw x 
      009556 26 05            [ 1] 4170 	jrne 9$  
                                   4171 ;skip to next line
      009556 72 DE 00 12 A3   [ 1] 4172 	mov in,count
      00955B 97               [ 4] 4173 9$:	ret 
                                   4174 
                                   4175 ;------------------------
                                   4176 ; BASIC: FOR var=expr 
                                   4177 ; set variable to expression 
                                   4178 ; leave variable address 
                                   4179 ; on dstack and set
                                   4180 ; FFOR bit in 'flags'
                                   4181 ;-----------------
                           000001  4182 	RETL1=1
                           000003  4183 	INW=3
                           000005  4184 	BPTR=5
      0017DA                       4185 for: ; { -- var_addr }
      00955C 87 26            [ 1] 4186 	ld a,#TK_VAR 
      00955E 14 A6 27         [ 4] 4187 	call expect
      009561 CD 82 26         [ 4] 4188 	call dpush 
      009564 1E 03 1C         [ 4] 4189 	call let02 
      009567 00 02 72 BB      [ 1] 4190 	bset flags,#FFOR 
                                   4191 ; open space on cstack for BPTR and INW 
      00956B 00               [ 2] 4192 	popw x ; call return address 
      0017EA                       4193 	_vars 4
      00956C 12 CD            [ 2]    1     sub sp,#4 
      00956E 82               [ 2] 4194 	pushw x  ; RETL1 
      00956F 38               [ 1] 4195 	clrw x 
      009570 CC 96            [ 2] 4196 	ldw (BPTR,sp),x 
      009572 4E CD            [ 2] 4197 	ldw (INW,sp),x 
      009574 91 9F CD         [ 4] 4198 	call next_token 
      009577 94 C1            [ 1] 4199 	cp a,#TK_CMD 
      009579 A6 20            [ 1] 4200 	jreq 1$
      00957B CD 82 26         [ 2] 4201 	jp syntax_error
      0017FC                       4202 1$:  
      00957E 1E 03 1C         [ 2] 4203 	cpw x,#to 
      009581 00 02            [ 1] 4204 	jreq to
      009583 20 BA A1         [ 2] 4205 	jp syntax_error 
                                   4206 
                                   4207 ;-----------------------------------
                                   4208 ; BASIC: TO expr 
                                   4209 ; second part of FOR loop initilization
                                   4210 ; leave limit on dstack and set 
                                   4211 ; FTO bit in 'flags'
                                   4212 ;-----------------------------------
      001804                       4213 to: ; { var_addr -- var_addr limit step }
      009586 0A 26 0D 72 BB   [ 2] 4214 	btjt flags,#FFOR,1$
      00958B 00 12 CD         [ 2] 4215 	jp syntax_error
      00958E 94 D5 72         [ 4] 4216 1$: call relation  
      009591 B0 00            [ 1] 4217 	cp a,#TK_INTGR 
      009593 12 20            [ 1] 4218 	jreq 2$ 
      009595 A9 A1 05         [ 2] 4219 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      001816                       4220 2$: 
      009598 26 1A 72         [ 4] 4221     call dpush ; limit
      00959B DE 00 12         [ 2] 4222 	ldw x,in.w 
      00959E 1D 00 22         [ 4] 4223 	call next_token
      0095A1 9F 44            [ 1] 4224 	cp a,#TK_NONE  
      0095A3 AB 41            [ 1] 4225 	jreq 4$ 
      0095A5 CD 82            [ 1] 4226 	cp a,#TK_CMD
      0095A7 26 A6            [ 1] 4227 	jrne 3$
      0095A9 20 CD 82         [ 2] 4228 	cpw x,#step 
      0095AC 26 1E            [ 1] 4229 	jreq step
      00182C                       4230 3$:	
      0095AE 03 1C 00         [ 4] 4231 	call unget_token   	 
      00182F                       4232 4$:	
      0095B1 02 20 8B         [ 2] 4233 	ldw x,#1   ; default step  
      0095B4 A1 02            [ 2] 4234 	jra store_loop_addr 
                                   4235 
                                   4236 
                                   4237 ;----------------------------------
                                   4238 ; BASIC: STEP expr 
                                   4239 ; optional third par of FOR loop
                                   4240 ; initialization. 	
                                   4241 ;------------------------------------
      001834                       4242 step: ; {var limit -- var limit step}
      0095B6 26 0A A6 40 CD   [ 2] 4243 	btjt flags,#FFOR,1$
      0095BB 82 26 1E         [ 2] 4244 	jp syntax_error
      0095BE 03 CC 95         [ 4] 4245 1$: call relation
      0095C1 3F A1            [ 1] 4246 	cp a,#TK_INTGR
      0095C3 04 26            [ 1] 4247 	jreq store_loop_addr  
      0095C5 14 72 DE         [ 2] 4248 	jp syntax_error
                                   4249 ; leave loop back entry point on cstack 
                                   4250 ; cstack is 2 call deep from interp_loop
      001846                       4251 store_loop_addr:
      0095C8 00 12 CD         [ 4] 4252 	call dpush 
      0095CB 8A 0D A6         [ 2] 4253 	ldw x,basicptr  
      0095CE 20 CD            [ 2] 4254 	ldw (BPTR,sp),x 
      0095D0 82 26 1E         [ 2] 4255 	ldw x,in.w 
      0095D3 03 1C            [ 2] 4256 	ldw (INW,sp),x   
      0095D5 00 02 CC 95      [ 1] 4257 	bres flags,#FFOR 
      0095D9 3F A1 31 2B      [ 1] 4258 	inc loop_depth  
      0095DD 1A               [ 4] 4259 	ret 
                                   4260 
                                   4261 ;--------------------------------
                                   4262 ; BASIC: NEXT var 
                                   4263 ; FOR loop control 
                                   4264 ; increment variable with step 
                                   4265 ; and compare with limit 
                                   4266 ; loop if threshold not crossed.
                                   4267 ; else clean both stacks. 
                                   4268 ; and decrement 'loop_depth' 
                                   4269 ;--------------------------------
      00185C                       4270 next: ; {var limit step -- [var limit step ] }
      0095DE A1 35 22 16      [ 1] 4271 	tnz loop_depth 
      0095E2 A0 31            [ 1] 4272 	jrne 1$ 
      0095E4 48 90 5F         [ 2] 4273 	jp syntax_error 
      001865                       4274 1$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095E7 90 97            [ 1] 4275 	ld a,#TK_VAR 
      0095E9 72 A9 96         [ 4] 4276 	call expect
                                   4277 ; check for good variable after NEXT 	 
      0095EC 67 90            [ 1] 4278 	ldw y,x 
      0095EE FE 93 CD         [ 2] 4279 	ldw x,#4  
      0095F1 82 38 1E 03      [ 4] 4280 	cpw y,([dstkptr],x) ; compare variables address 
      0095F5 CC 95            [ 1] 4281 	jreq 2$  
      0095F7 3F A1 10         [ 2] 4282 	jp syntax_error ; not the good one 
      001878                       4283 2$: ; increment variable 
      0095FA 26               [ 1] 4284 	ldw x,y
      0095FB 04               [ 2] 4285 	ldw x,(x)  ; get var value 
      0095FC A6 2B 20         [ 2] 4286 	ldw acc16,x 
      0095FF 46 A1 11 26      [ 5] 4287 	ldw x,[dstkptr] ; step
      009603 04 A6 2D 20      [ 2] 4288 	addw x,acc16 ; var+step 
      009607 3E A1            [ 2] 4289 	ldw (y),x ; save var new value 
                                   4290 ; compare with limit 
      009609 20 2B            [ 1] 4291 	ldw y,x 
      00960B 0E A1 22 22      [ 5] 4292 	ldw x,[dstkptr] ; step in x 
      00960F 0A               [ 2] 4293 	tnzw x  
      009610 A0 20            [ 1] 4294 	jrpl 4$ ; positive step 
                                   4295 ;negative step 
      009612 5F 97 1C         [ 2] 4296 	ldw x,#2
      009615 96 64 F6 20      [ 4] 4297 	cpw y,([dstkptr],x)
      009619 2C A1            [ 1] 4298 	jrslt loop_done
      00961B 0B 2B            [ 2] 4299 	jra loop_back 
      00189B                       4300 4$: ; positive step
      00961D 0E A1 0E         [ 2] 4301 	ldw x,#2 
      009620 22 0A A0 0B      [ 4] 4302 	cpw y,([dstkptr],x)
      009624 5F 97            [ 1] 4303 	jrsgt loop_done
      0018A4                       4304 loop_back:
      009626 1C 96            [ 2] 4305 	ldw x,(BPTR,sp)
      009628 60 F6 20         [ 2] 4306 	ldw basicptr,x 
      00962B 1A A1 03 26 14   [ 2] 4307 	btjf flags,#FRUN,1$ 
      009630 A6 5C            [ 1] 4308 	ld a,(2,x)
      009632 CD 82 26         [ 1] 4309 	ld count,a
      009635 1E 03            [ 2] 4310 1$:	ldw x,(INW,sp)
      009637 72 D6 00         [ 2] 4311 	ldw in.w,x 
      00963A 12               [ 4] 4312 	ret 
      0018B9                       4313 loop_done:
                                   4314 	; remove var limit step on dstack 
      00963B 5C 1F 03         [ 2] 4315 	ldw x,dstkptr 
      00963E CD 82 26         [ 2] 4316 	addw x,#3*CELL_SIZE
      009641 CC 95 3F         [ 2] 4317 	ldw dstkptr,x 
                                   4318 	; remove 2 return address on cstack 
      009644 A6               [ 2] 4319 	popw x
      0018C3                       4320 	_drop 4
      009645 3A CD            [ 2]    1     addw sp,#4 
      009647 82               [ 2] 4321 	pushw x 
      009648 26 1E 03 CC      [ 1] 4322 	dec loop_depth 
      00964C 95               [ 4] 4323 	ret 
                                   4324 
                                   4325 
                                   4326 ;------------------------
                                   4327 ; BASIC: GOTO line# 
                                   4328 ; jump to line# 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4329 ; here cstack is 2 call deep from interp_loop 
                                   4330 ;------------------------
      0018CB                       4331 goto:
      00964D 3F 00 00 1F 06   [ 2] 4332 	btjt flags,#FRUN,0$ 
      00964E A6 06            [ 1] 4333 	ld a,#ERR_RUN_ONLY
      00964E A6 0D CD         [ 2] 4334 	jp tb_error 
      009651 82               [ 4] 4335 	ret 
      009652 26 7B            [ 2] 4336 0$:	jra go_common
                                   4337 
                                   4338 ;--------------------
                                   4339 ; BASIC: GOSUB line#
                                   4340 ; basic subroutine call
                                   4341 ; actual line# and basicptr 
                                   4342 ; are saved on cstack
                                   4343 ; here cstack is 2 call deep from interp_loop 
                                   4344 ;--------------------
                           000003  4345 	GOS_RET=3
      0018D8                       4346 gosub:
      009654 02 C7 00 21 7B   [ 2] 4347 	btjt flags,#FRUN,0$ 
      009659 01 C7            [ 1] 4348 	ld a,#ERR_RUN_ONLY
      00965B 00 07 5B         [ 2] 4349 	jp tb_error 
      00965E 05               [ 4] 4350 	ret 
      00965F 81               [ 2] 4351 0$:	popw x 
      009660 28 29            [ 2] 4352 	sub sp,#2 
      009662 2C               [ 2] 4353 	pushw x 
      009663 23 2A 2F         [ 2] 4354 	ldw x,basicptr
      009666 25 96            [ 1] 4355 	ld a,(2,x)
      009668 73 96            [ 1] 4356 	add a,#3 
      00966A 75 96 77         [ 1] 4357 	ld acc8,a 
      00966D 96 7A 96 7C      [ 1] 4358 	clr acc16 
      009671 96 7F 3E 00      [ 2] 4359 	addw x,acc16
      009675 3D 00            [ 2] 4360 	ldw (GOS_RET,sp),x 
      0018FB                       4361 go_common: 
      009677 3E 3D 00         [ 4] 4362 	call relation 
      00967A 3C 00            [ 1] 4363 	cp a,#TK_INTGR
      00967C 3C 3D            [ 1] 4364 	jreq 1$ 
      00967E 00 3C 3E         [ 2] 4365 	jp syntax_error
      001905                       4366 1$: 
      009681 00 02 E8         [ 4] 4367 	call search_lineno  
      009682 5D               [ 2] 4368 	tnzw x 
      009682 4B 00            [ 1] 4369 	jrne 2$ 
      009684 A6 05            [ 1] 4370 	ld a,#ERR_NO_LINE 
      009684 0F 01 16         [ 2] 4371 	jp tb_error 
      009686                       4372 2$: 
      009686 CD 93 79         [ 2] 4373 	ldw basicptr,x 
      009689 A1 01            [ 1] 4374 	ld a,(2,x)
      00968B 27 5A A1         [ 1] 4375 	ld count,a 
      00968E 04 26 05 CD      [ 1] 4376 	mov in,#3 
      009692 8A               [ 4] 4377 	ret 
                                   4378 
                                   4379 ;------------------------
                                   4380 ; BASIC: RETURN 
                                   4381 ; exit from a subroutine 
                                   4382 ; cstack is 2 level deep from interp_loop 
                                   4383 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00191D                       4384 return:
      009693 0D 20 EE 1F 05   [ 2] 4385 	btjt flags,#FRUN,0$ 
      009696 A6 06            [ 1] 4386 	ld a,#ERR_RUN_ONLY
      009696 CD 88 74         [ 2] 4387 	jp tb_error 
      001927                       4388 0$:	
      009699 A1 00            [ 2] 4389 	ldw x,(GOS_RET,sp) 
      00969B 27 4A A1         [ 2] 4390 	ldw basicptr,x 
      00969E 0A 26            [ 1] 4391 	ld a,(2,x)
      0096A0 0E CD            [ 1] 4392 	add a,#3 
      0096A2 82 38 5C         [ 1] 4393 	ld count,a 
      0096A5 72 B0 00 05      [ 1] 4394 	mov in,#3
      0096A9 9F               [ 1] 4395 	clr a 
      0096AA C7               [ 2] 4396 	popw x 
      001939                       4397 	_drop 2
      0096AB 00 02            [ 2]    1     addw sp,#2 
      0096AD 20               [ 2] 4398 	pushw x
      0096AE D5               [ 4] 4399 	ret  
                                   4400 
                                   4401 
                                   4402 ;----------------------------------
                                   4403 ; BASIC: RUN
                                   4404 ; run BASIC program in RAM
                                   4405 ;----------------------------------- 
      00193D                       4406 run: 
      0096AF A1 03 26 06 9F   [ 2] 4407 	btjf flags,#FRUN,0$  
      0096B4 CD               [ 1] 4408 	clr a 
      0096B5 82               [ 4] 4409 	ret
      001944                       4410 0$: 
      0096B6 26 20 CB 1F 12   [ 2] 4411 	btjf flags,#FBREAK,1$
      0096B9                       4412 	_drop 2 
      0096B9 A1 08            [ 2]    1     addw sp,#2 
      0096BB 26 07 FD         [ 4] 4413 	call rest_context
      00194E                       4414 	_drop CTXT_SIZE 
      0096BE 9F CD            [ 2]    1     addw sp,#CTXT_SIZE 
      0096C0 82 26 20 C0      [ 1] 4415 	bres flags,#FBREAK 
      0096C4 72 10 00 1F      [ 1] 4416 	bset flags,#FRUN 
      0096C4 A1 0D 26         [ 2] 4417 	jp interp_loop 
      0096C7 05 03 01         [ 2] 4418 1$:	ldw x,txtbgn
      0096CA CC 96 86         [ 2] 4419 	cpw x,txtend 
      0096CD 2B 02            [ 1] 4420 	jrmi 2$ 
      0096CD A1               [ 1] 4421 	clr a 
      0096CE 0E               [ 4] 4422 	ret 
      0096CF 26 13 CD         [ 4] 4423 2$: call ubound 
      001968                       4424 	_drop 2 
      0096D2 88 74            [ 2]    1     addw sp,#2 
      0096D4 A1 04 27         [ 2] 4425 	ldw x,txtbgn 
      0096D7 03 CC 87         [ 2] 4426 	ldw basicptr,x 
      0096DA 94 02            [ 1] 4427 	ld a,(2,x)
      0096DB C7 00 03         [ 1] 4428 	ld count,a
      0096DB 9F A4 0F C7      [ 1] 4429 	mov in,#3	
      0096DF 00 21 CC 96      [ 1] 4430 	bset flags,#FRUN 
      0096E3 84 07 C4         [ 2] 4431 	jp interp_loop 
                                   4432 
                                   4433 
                                   4434 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4435 ; BASIC: STOP 
                                   4436 ; stop running program
                                   4437 ;---------------------- 
      0096E4                       4438 stop: 
                                   4439 ; clean dstack and cstack 
      0096E4 CD 90 00         [ 2] 4440 	ldw x,#STACK_EMPTY 
      0096E7 94               [ 1] 4441 	ldw sp,x 
      0096E7 0D 01 26 05      [ 1] 4442 	bres flags,#FRUN 
      0096EB A6 0D CD 82      [ 1] 4443 	bres flags,#FBREAK
      0096EF 26 5B 01         [ 2] 4444 	jp warm_start
                                   4445 
                                   4446 ;-----------------------
                                   4447 ; BASIC BEEP expr1,expr2
                                   4448 ; used MCU internal beeper 
                                   4449 ; to produce a sound
                                   4450 ; arguments:
                                   4451 ;    expr1   frequency  (expr1%32)
                                   4452 ;    expr2   duration msec.
                                   4453 ;---------------------------
      00198F                       4454 beep:
      0096F2 81 11 B3         [ 4] 4455 	call arg_list 
      0096F3 A1 02            [ 1] 4456 	cp a,#2 
      0096F3 CE 00            [ 1] 4457 	jreq 1$
      0096F5 05 1F 03         [ 2] 4458 	jp syntax_error 
      001999                       4459 1$: 
      0096F8 C6 00 02         [ 2] 4460 	ldw x,dstkptr 
      0096FB 6B 07            [ 2] 4461 	ldw x,(2,x);frequency 
      0096FD C6 00            [ 1] 4462 	ld a,#31
      0096FF 04               [ 2] 4463 	div x,a 
      009700 6B 08 81         [ 1] 4464 	ld BEEP_CSR,a	
      009703 72 1A 50 F3      [ 1] 4465 	bset BEEP_CSR,#5 
      009703 1E 03 CF         [ 4] 4466 	call dpop 
      009706 00 05 7B         [ 4] 4467 	call pause02 
      009709 07 C7 00         [ 4] 4468 	call ddrop 
      00970C 02 7B            [ 1] 4469 	ld a,#0x1f
      00970E 08 C7 00         [ 1] 4470 	ld BEEP_CSR,a 
      009711 04               [ 4] 4471 	ret 
                                   4472 
                                   4473 ;-------------------------------
                                   4474 ; BASIC: PWRADC 0|1 [,divisor]  
                                   4475 ; disable/enanble ADC 
                                   4476 ;-------------------------------
      0019B7                       4477 power_adc:
      009712 81 11 B3         [ 4] 4478 	call arg_list 
      009713 A1 02            [ 1] 4479 	cp a,#2	
      009713 72 00            [ 1] 4480 	jreq 1$
      009715 00 20            [ 1] 4481 	cp a,#1 
      009717 05 A6            [ 1] 4482 	jreq 0$ 
      009719 06 CC 87         [ 2] 4483 	jp syntax_error 
      00971C 96 52 07         [ 2] 4484 0$: ldw x,#0
      00971F CD 0F 86         [ 4] 4485 	call dpush 
      00971F 0F 06 CD         [ 2] 4486 1$: ldw x,#2
      009722 88 74 A1 00      [ 5] 4487 	ldw x,([dstkptr],x) ; on|off
      009726 27               [ 2] 4488 	tnzw x 
      009727 5C A1            [ 1] 4489 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009729 0A 26 08 CD      [ 5] 4490 	ldw x,[dstkptr] ; divisor 
      00972D 82               [ 1] 4491 	ld a,xl
      00972E 38 03            [ 1] 4492 	and a,#7
      009730 06               [ 1] 4493 	swap a 
      009731 CD 88 74         [ 1] 4494 	ld ADC_CR1,a
      009734 A1 05 27 03      [ 1] 4495 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009738 CC 87 94 CD      [ 1] 4496 	bset ADC_CR1,#ADC_CR1_ADON 
      0019E8                       4497 	_usec_dly 7 
      00973C 90 06 0D         [ 2]    1     ldw x,#(16*7-2)/4
      00973F 06               [ 2]    2     decw x
      009740 26               [ 1]    3     nop 
      009741 0F A6            [ 1]    4     jrne .-4
      009743 3A C7            [ 2] 4498 	jra 3$
      009745 17 19 72 5F      [ 1] 4499 2$: bres ADC_CR1,#ADC_CR1_ADON
      009749 17 1A AE 17      [ 1] 4500 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00974D 18 CD 82         [ 2] 4501 3$:	ldw x,#2
      009750 38 0F F7         [ 4] 4502 	call ddrop_n 
      009751 81               [ 4] 4503 	ret
                                   4504 
                                   4505 ;-----------------------------
                                   4506 ; BASIC: RDADC(channel)
                                   4507 ; read adc channel {0..5}
                                   4508 ; output:
                                   4509 ;   A 		TK_INTGR 
                                   4510 ;   X 		value 
                                   4511 ;-----------------------------
      001A00                       4512 analog_read:
      009751 CD 96 F3         [ 4] 4513 	call func_args 
      009754 AE 16            [ 1] 4514 	cp a,#1 
      009756 C8 CF            [ 1] 4515 	jreq 1$
      009758 00 05 72         [ 2] 4516 	jp syntax_error
      00975B 5F 00 04         [ 4] 4517 1$: call dpop 
      00975E CD 8A FB         [ 2] 4518 	cpw x,#5 
      009761 72 5F            [ 2] 4519 	jrule 2$
      009763 00 02            [ 1] 4520 	ld a,#ERR_BAD_VALUE
      009765 CD 93 79         [ 2] 4521 	jp tb_error 
      009768 A1               [ 1] 4522 2$: ld a,xl
      009769 04 27 03         [ 1] 4523 	ld acc8,a 
      00976C CC 87            [ 1] 4524 	ld a,#5
      00976E 94 CD 90         [ 1] 4525 	sub a,acc8 
      009771 06 CD 90         [ 1] 4526 	ld ADC_CSR,a
      009774 6D CD 97 03      [ 1] 4527 	bset ADC_CR2,#ADC_CR2_ALIGN
      009778 CD 88 74 A1      [ 1] 4528 	bset ADC_CR1,#ADC_CR1_ADON
      00977C 0D 26 02 20 9E   [ 2] 4529 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009781 CD 90 00         [ 2] 4530 	ldw x,ADC_DRH
      009784 A6 04            [ 1] 4531 	ld a,#TK_INTGR
      009784 5B               [ 4] 4532 	ret 
                                   4533 
                                   4534 
                                   4535 ;-----------------------
                                   4536 ; BASIC: BREAK 
                                   4537 ; insert a breakpoint 
                                   4538 ; in pogram. 
                                   4539 ; the program is resumed
                                   4540 ; with RUN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4541 ;-------------------------
      001A36                       4542 break:
      009785 07 81 00 1F 02   [ 2] 4543 	btjt flags,#FRUN,2$
      009787 4F               [ 1] 4544 	clr a
      009787 55               [ 4] 4545 	ret 
      001A3D                       4546 2$:	 
                                   4547 ; create space on cstack to save context 
      009788 00 02 00         [ 2] 4548 	ldw x,#break_point 
      00978B 04 81 B8         [ 4] 4549 	call puts 
      00978D                       4550 	_drop 2 ;drop return address 
      00978D 52 04            [ 2]    1     addw sp,#2 
      001A45                       4551 	_vars CTXT_SIZE ; context size 
      00978F 0F 01            [ 2]    1     sub sp,#CTXT_SIZE 
      009791 CD 92 33         [ 4] 4552 	call save_context 
      009794 A1 02 24         [ 2] 4553 	ldw x,#tib 
      009797 03 CC 87         [ 2] 4554 	ldw basicptr,x
      00979A 94               [ 1] 4555 	clr (x)
      00979B A1 03 25 06      [ 1] 4556 	clr count  
      00979F CD               [ 1] 4557 	clrw x 
      0097A0 90 13 9F         [ 2] 4558 	ldw in.w,x
      0097A3 6B 01 CD 90      [ 1] 4559 	bres flags,#FRUN 
      0097A7 13 9F 6B 02      [ 1] 4560 	bset flags,#FBREAK
      0097AB CD 90 13         [ 2] 4561 	jp interp_loop 
      0097AE F6 14 02 18 01 27 F9  4562 break_point: .asciz "\nbreak point, RUN to resume.\n"
             5B 04 81 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4563 
                                   4564 ;-----------------------
                                   4565 ; BASIC: NEW
                                   4566 ; from command line only 
                                   4567 ; free program memory
                                   4568 ; and clear variables 
                                   4569 ;------------------------
      0097B8                       4570 new: 
      0097B8 CD 92 33 A1 02   [ 2] 4571 	btjf flags,#FRUN,0$ 
      0097BD 27               [ 1] 4572 	clr a 
      0097BE 03               [ 4] 4573 	ret 
      001A89                       4574 0$:	
      0097BF CC 87 94         [ 4] 4575 	call clear_basic 
      0097C2 81               [ 4] 4576 	ret 
                                   4577 	 
                                   4578 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4579 ;   file system routines
                                   4580 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4581 
                                   4582 ;--------------------
                                   4583 ; input:
                                   4584 ;   X     increment 
                                   4585 ; output:
                                   4586 ;   farptr  incremented 
                                   4587 ;---------------------
      001A8D                       4588 incr_farptr:
      0097C2 CD 90 13 9F      [ 2] 4589 	addw x,farptr+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0097C6 CD 90            [ 1] 4590 	jrnc 1$
      0097C8 13 FA F7 81      [ 1] 4591 	inc farptr 
      0097CC CF 00 11         [ 2] 4592 1$:	ldw farptr+1,x  
      0097CC CD               [ 4] 4593 	ret 
                                   4594 
                                   4595 ;------------------------------
                                   4596 ; extended flash memory used as FLASH_DRIVE 
                                   4597 ; seek end of used flash drive   
                                   4598 ; starting at 0x10000 address.
                                   4599 ; 4 consecutives 0 bytes signal free space. 
                                   4600 ; input:
                                   4601 ;	none
                                   4602 ; output:
                                   4603 ;   ffree     free_addr| 0 if memory full.
                                   4604 ;------------------------------
      001A9B                       4605 seek_fdrive:
                                   4606 ; start scan at 0x10000 address 
      0097CD 92 33            [ 1] 4607 	ld a,#1
      0097CF A1 02 27         [ 1] 4608 	ld farptr,a 
      0097D2 03               [ 1] 4609 	clrw x 
      0097D3 CC 87 94         [ 2] 4610 	ldw farptr+1,x 
      0097D6                       4611 1$:
      0097D6 CD 90 13         [ 2] 4612 	ldw x,#3  
      0097D9 9F 43 CD 90      [ 5] 4613 2$:	ldf a,([farptr],x) 
      0097DD 13 F4            [ 1] 4614 	jrne 3$
      0097DF F7               [ 2] 4615 	decw x
      0097E0 81 F7            [ 1] 4616 	jrpl 2$
      0097E1 20 19            [ 2] 4617 	jra 4$ 
      0097E1 CD               [ 1] 4618 3$:	incw x 
      0097E2 92 33 A1         [ 4] 4619 	call incr_farptr
      0097E5 02 27 03         [ 2] 4620 	ldw x,#0x27f 
      0097E8 CC 87 94         [ 2] 4621 	cpw x,farptr
      0097EB CD 90            [ 1] 4622 	jrpl 1$
                                   4623 ; drive full 
      0097ED 13 9F CD 90      [ 1] 4624 	clr ffree 
      0097F1 13 F8 F7 81      [ 1] 4625 	clr ffree+1 
      0097F5 72 5F 00 15      [ 1] 4626 	clr ffree+2 
      0097F5 CD               [ 4] 4627 	ret
      001ACB                       4628 4$: ; copy farptr to ffree	 
      0097F6 92 57 A1         [ 2] 4629 	ldw x,farptr 
      0097F9 02 27 03         [ 1] 4630 	ld a,farptr+2 
      0097FC CC 87 94         [ 2] 4631 	ldw ffree,x 
      0097FF C7 00 15         [ 1] 4632 	ld ffree+2,a  
      0097FF CD               [ 4] 4633 	ret 
                                   4634 
                                   4635 ;-----------------------
                                   4636 ; compare file name 
                                   4637 ; with name pointed by Y  
                                   4638 ; input:
                                   4639 ;   farptr   file name 
                                   4640 ;   Y        target name 
                                   4641 ; output:
                                   4642 ;   farptr 	 at file_name
                                   4643 ;   X 		 farptr[x] point at size field  
                                   4644 ;   Carry    0|1 no match|match  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4645 ;----------------------
      001AD8                       4646 cmp_name:
      009800 90               [ 1] 4647 	clrw x
      009801 13 9F A4 07      [ 5] 4648 1$:	ldf a,([farptr],x)
      009805 88 A6            [ 1] 4649 	cp a,(y)
      009807 01 0D            [ 1] 4650 	jrne 4$
      009809 01               [ 1] 4651 	tnz a 
      00980A 27 05            [ 1] 4652 	jreq 9$ 
      00980C 48               [ 1] 4653     incw x 
      00980D 0A 01            [ 1] 4654 	incw y 
      00980F 20 F7            [ 2] 4655 	jra 1$
      001AE9                       4656 4$: ;no match 
      009811 CD               [ 1] 4657 	tnz a 
      009812 90 13            [ 1] 4658 	jreq 5$
      009814 F4               [ 1] 4659 	incw x 
      009815 27 02 A6 01      [ 5] 4660 	ldf a,([farptr],x)
      009819 5F 97            [ 2] 4661 	jra 4$  
      00981B A6               [ 1] 4662 5$:	incw x ; farptr[x] point at 'size' field 
      00981C 04               [ 1] 4663 	rcf 
      00981D 5B               [ 4] 4664 	ret
      001AF6                       4665 9$: ; match  
      00981E 01               [ 1] 4666 	incw x  ; farptr[x] at 'size' field 
      00981F 81               [ 1] 4667 	scf 
      009820 81               [ 4] 4668 	ret 
                                   4669 
                                   4670 ;-----------------------
                                   4671 ; search file in 
                                   4672 ; flash memory 
                                   4673 ; input:
                                   4674 ;   Y       file name  
                                   4675 ; output:
                                   4676 ;   farptr  addr at name|0
                                   4677 ;-----------------------
                           000001  4678 	FSIZE=1
                           000003  4679 	YSAVE=3
                           000004  4680 	VSIZE=4 
      001AF9                       4681 search_file: 
      001AF9                       4682 	_vars VSIZE
      009820 CD 92            [ 2]    1     sub sp,#VSIZE 
      009822 33 A1            [ 2] 4683 	ldw (YSAVE,sp),y  
      009824 02               [ 1] 4684 	clrw x 
      009825 27 03 CC         [ 2] 4685 	ldw farptr+1,x 
      009828 87 94 00 10      [ 1] 4686 	mov farptr,#1
      00982A                       4687 1$:	
                                   4688 ; check if farptr is after any file 
                                   4689 ; if  0 then so.
      00982A CD 90 13 9F      [ 5] 4690 	ldf a,[farptr]
      00982E CD 90            [ 1] 4691 	jreq 6$
      009830 13               [ 1] 4692 2$: clrw x 	
      009831 F7 81            [ 2] 4693 	ldw y,(YSAVE,sp) 
      009833 CD 1A D8         [ 4] 4694 	call cmp_name
      009833 CD 92            [ 1] 4695 	jrc 9$
      009835 57 A1 01 27      [ 5] 4696 	ldf a,([farptr],x)
      009839 03 CC            [ 1] 4697 	ld (FSIZE,sp),a 
      00983B 87               [ 1] 4698 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      00983C 94 CD 90 13      [ 5] 4699 	ldf a,([farptr],x)
      009840 F6 5F            [ 1] 4700 	ld (FSIZE+1,sp),a 
      009842 97               [ 1] 4701 	incw x 
      009843 A6 04 81         [ 2] 4702 	addw x,(FSIZE,sp) ; count to skip 
      009846 5C               [ 1] 4703 	incw x ; skip over EOF marker 
      009846 CD 93 79         [ 4] 4704 	call incr_farptr ; now at next file 'name_field'
      009849 A1 04 27         [ 2] 4705 	ldw x,#0x280
      00984C 03 CC 87         [ 2] 4706 	cpw x,farptr 
      00984F 94 4F            [ 1] 4707 	jrpl 1$
      001B30                       4708 6$: ; file not found 
      009851 5D 26 05 55      [ 1] 4709 	clr farptr
      009855 00 04 00 02      [ 1] 4710 	clr farptr+1 
      009859 81 5F 00 12      [ 1] 4711 	clr farptr+2 
      00985A                       4712 	_drop VSIZE 
      00985A A6 05            [ 2]    1     addw sp,#VSIZE 
      00985C CD               [ 1] 4713 	rcf
      00985D 92               [ 4] 4714 	ret
      001B40                       4715 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001B40                       4716 	_drop VSIZE 
      00985E 26 CD            [ 2]    1     addw sp,#VSIZE 
      009860 90               [ 1] 4717 	scf 	
      009861 06               [ 4] 4718 	ret
                                   4719 
                                   4720 ;--------------------------------
                                   4721 ; BASIC: SAVE "name" 
                                   4722 ; save text program in 
                                   4723 ; flash memory used as 
                                   4724 ;--------------------------------
                           000001  4725 	BSIZE=1
                           000003  4726 	NAMEPTR=3
                           000004  4727 	VSIZE=4
      001B44                       4728 save:
      009862 CD 94 20 72 14   [ 2] 4729 	btjf flags,#FRUN,0$ 
      009867 00 20            [ 1] 4730 	ld a,#ERR_CMD_ONLY 
      009869 85 52 04         [ 2] 4731 	jp tb_error
      001B4E                       4732 0$:	 
      00986C 89 5F 1F         [ 2] 4733 	ldw x,txtend 
      00986F 05 1F 03 CD      [ 2] 4734 	subw x,txtbgn
      009873 88 74            [ 1] 4735 	jrne 1$
                                   4736 ; nothing to save 
      009875 A1               [ 4] 4737 	ret 
      001B58                       4738 1$:	
      001B58                       4739 	_vars VSIZE 
      009876 06 27            [ 2]    1     sub sp,#VSIZE 
      009878 03 CC            [ 2] 4740 	ldw (BSIZE,sp),x 
      00987A 87 94 F4         [ 4] 4741 	call next_token	
      00987C A1 0A            [ 1] 4742 	cp a,#TK_QSTR
      00987C A3 98            [ 1] 4743 	jreq 2$
      00987E 84 27 03         [ 2] 4744 	jp syntax_error
      001B66                       4745 2$: 
      009881 CC 87 94 04      [ 2] 4746 	ldw y,basicptr 
      009884 72 B9 00 00      [ 2] 4747 	addw y,in.w
      009884 72 04            [ 2] 4748 	ldw (NAMEPTR,sp),y  
      009886 00 20 03 CC 87   [ 1] 4749 	mov in,count 
                                   4750 ; check if enough free space 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      00988B 94               [ 1] 4751 	ldw x,y 
      00988C CD 93 79         [ 4] 4752 	call strlen 
      00988F A1 04 27         [ 2] 4753 	addw x,#3 
      009892 03 CC 87         [ 2] 4754 	addw x,(BSIZE,sp)
      009895 94 5D 00 13      [ 1] 4755 	tnz ffree 
      009896 26 0B            [ 1] 4756 	jrne 21$
      009896 CD 90 06 CE      [ 2] 4757 	subw x,ffree+1 
      00989A 00 01            [ 2] 4758 	jrule 21$
      00989C CD 88            [ 1] 4759 	ld a,#ERR_MEM_FULL 
      00989E 74 A1 00         [ 2] 4760 	jp tb_error
      001B90                       4761 21$: 
                                   4762 ; check for existing file of that name 
      0098A1 27 0C            [ 2] 4763 	ldw y,(NAMEPTR,sp)	
      0098A3 A1 06 26         [ 4] 4764 	call search_file 
      0098A6 05 A3            [ 1] 4765 	jrnc 3$ 
      0098A8 98 B4            [ 1] 4766 	ld a,#ERR_DUPLICATE 
      0098AA 27 08 16         [ 2] 4767 	jp tb_error 
      0098AC                       4768 3$:	;** write file name to flash **
      0098AC CD 90 00         [ 2] 4769 	ldw x,ffree 
      0098AF C6 00 15         [ 1] 4770 	ld a,ffree+2 
      0098AF AE 00 01         [ 2] 4771 	ldw farptr,x 
      0098B2 20 12 12         [ 1] 4772 	ld farptr+2,a 
      0098B4 1E 03            [ 2] 4773 	ldw x,(NAMEPTR,sp)  
      0098B4 72 04 00         [ 4] 4774 	call strlen 
      0098B7 20               [ 1] 4775 	incw  x
      0098B8 03 CC            [ 2] 4776 	ldw (BSIZE,sp),x  
      0098BA 87               [ 1] 4777 	clrw x   
      0098BB 94 CD            [ 2] 4778 	ldw y,(NAMEPTR,sp)
      0098BD 93 79 A1         [ 4] 4779 	call write_block  
                                   4780 ;** write file length after name **
      0098C0 04 27 03         [ 2] 4781 	ldw x,txtend 
      0098C3 CC 87 94 18      [ 2] 4782 	subw x,txtbgn
      0098C6 1F 01            [ 2] 4783 	ldw (BSIZE,sp),x 
      0098C6 CD               [ 1] 4784 	clrw x 
      0098C7 90 06            [ 1] 4785 	ld a,(1,sp)
      0098C9 CE 00 05         [ 4] 4786 	call write_byte 
      0098CC 1F               [ 1] 4787 	incw x 
      0098CD 05 CE            [ 1] 4788 	ld a,(2,sp)
      0098CF 00 01 1F         [ 4] 4789 	call write_byte
      0098D2 03               [ 1] 4790 	incw x  
      0098D3 72 15 00         [ 4] 4791 	call incr_farptr ; move farptr after SIZE field 
                                   4792 ;** write BASIC text **
                                   4793 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      0098D6 20 72            [ 2] 4794 	ldw x,(BSIZE,sp)
      0098D8 5C               [ 2] 4795 	pushw x ; write_block argument 
      0098D9 00               [ 1] 4796 	clrw x 
      0098DA 1D 81 00 18      [ 2] 4797 	ldw y,txtbgn  ; BASIC text to save 
      0098DC CD 01 55         [ 4] 4798 	call write_block 
      001BDA                       4799 	_drop 2 ;  drop write_block argument  
      0098DC 72 5D            [ 2]    1     addw sp,#2 
                                   4800 ; write en end of file marker 
      0098DE 00 1D 26         [ 2] 4801 	ldw x,#1
      0098E1 03 CC            [ 1] 4802 	ld a,#EOF  
      0098E3 87 94 E0         [ 4] 4803 	call write_byte 
      0098E5 CD 1A 8D         [ 4] 4804 	call incr_farptr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4805 ; save farptr in ffree
      0098E5 A6 05 CD         [ 2] 4806 	ldw x,farptr 
      0098E8 92 26 90         [ 1] 4807 	ld a,farptr+2 
      0098EB 93 AE 00         [ 2] 4808 	ldw ffree,x 
      0098EE 04 72 D3         [ 1] 4809 	ld ffree+2,a
                                   4810 ;write 4 zero bytes as an end of all files marker 
      0098F1 00               [ 1] 4811     clrw x 
      0098F2 17 27            [ 1] 4812 	push #4 
      001BF6                       4813 4$:
      0098F4 03               [ 1] 4814 	clr a 
      0098F5 CC 87 94         [ 4] 4815 	call write_byte 
      0098F8 5C               [ 1] 4816 	incw x 
      0098F8 93 FE            [ 1] 4817 	dec (1,sp)
      0098FA CF 00            [ 1] 4818 	jrne 4$
      0098FC 09               [ 1] 4819 5$: pop a 
                                   4820 ; display saved size  
      0098FD 72 CE            [ 2] 4821 	ldw x,(BSIZE,sp) 
      0098FF 00 17 72         [ 4] 4822 	call print_int 
      001C05                       4823 	_drop VSIZE 
      009902 BB 00            [ 2]    1     addw sp,#VSIZE 
      009904 09               [ 4] 4824 	ret 
                                   4825 
                                   4826 
                                   4827 ;------------------------
                                   4828 ; BASIC: LOAD "file" 
                                   4829 ; load file to RAM 
                                   4830 ; for execution 
                                   4831 ;------------------------
      001C08                       4832 load:
      009905 90 FF 90 93 72   [ 2] 4833 	btjf flags,#FRUN,0$ 
      00990A CE 00            [ 1] 4834 	jreq 0$ 
      00990C 17 5D            [ 1] 4835 	ld a,#ERR_CMD_ONLY 
      00990E 2A 0B AE         [ 2] 4836 	jp tb_error 
      001C14                       4837 0$:	
      009911 00 02 72         [ 4] 4838 	call next_token 
      009914 D3 00            [ 1] 4839 	cp a,#TK_QSTR
      009916 17 2F            [ 1] 4840 	jreq 1$
      009918 20 20 09         [ 2] 4841 	jp syntax_error 
      00991B                       4842 1$:	
      00991B AE 00 02 72      [ 2] 4843 	ldw y,basicptr
      00991F D3 00 17 2C      [ 2] 4844 	addw y,in.w 
      009923 15 00 03 00 01   [ 1] 4845 	mov in,count 
      009924 CD 1A F9         [ 4] 4846 	call search_file 
      009924 1E 05            [ 1] 4847 	jrc 2$ 
      009926 CF 00            [ 1] 4848 	ld a,#ERR_NOT_FILE
      009928 05 72 01         [ 2] 4849 	jp tb_error  
      001C35                       4850 2$:	
      00992B 00 20 05         [ 4] 4851 	call incr_farptr  
      00992E E6 02 C7         [ 4] 4852 	call clear_basic  
      009931 00               [ 1] 4853 	clrw x
      009932 04 1E 03 CF      [ 5] 4854 	ldf a,([farptr],x)
      009936 00 01            [ 1] 4855 	ld yh,a 
      009938 81               [ 1] 4856 	incw x  
      009939 92 AF 00 10      [ 5] 4857 	ldf a,([farptr],x)
      009939 CE               [ 1] 4858 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      00993A 00 17            [ 1] 4859 	ld yl,a 
      00993C 1C 00 06 CF      [ 2] 4860 	addw y,txtbgn
      009940 00 17 85 5B      [ 2] 4861 	ldw txtend,y
      009944 04 89 72 5A      [ 2] 4862 	ldw y,txtbgn
      001C56                       4863 3$:	; load BASIC text 	
      009948 00 1D 81 10      [ 5] 4864 	ldf a,([farptr],x)
      00994B 90 F7            [ 1] 4865 	ld (y),a 
      00994B 72               [ 1] 4866 	incw x 
      00994C 00 00            [ 1] 4867 	incw y 
      00994E 20 06 A6 06      [ 2] 4868 	cpw y,txtend 
      009952 CC 87            [ 1] 4869 	jrmi 3$
                                   4870 ; print loaded size 	 
      009954 96 81 20         [ 2] 4871 	ldw x,txtend 
      009957 23 B0 00 18      [ 2] 4872 	subw x,txtbgn
      009958 CD 09 8D         [ 4] 4873 	call print_int 
      009958 72               [ 4] 4874 	ret 
                                   4875 
                                   4876 ;-----------------------------------
                                   4877 ; BASIC: FORGET ["file_name"] 
                                   4878 ; erase file_name and all others 
                                   4879 ; after it. 
                                   4880 ; without argument erase all files 
                                   4881 ;-----------------------------------
      001C70                       4882 forget:
      009959 00 00 20         [ 4] 4883 	call next_token 
      00995C 06 A6            [ 1] 4884 	cp a,#TK_NONE 
      00995E 06 CC            [ 1] 4885 	jreq 3$ 
      009960 87 96            [ 1] 4886 	cp a,#TK_QSTR
      009962 81 85            [ 1] 4887 	jreq 1$
      009964 52 02 89         [ 2] 4888 	jp syntax_error
      009967 CE 00 05 E6      [ 2] 4889 1$: ldw y,basicptr
      00996B 02 AB 03 C7      [ 2] 4890 	addw y,in.w
      00996F 00 0A 72 5F 00   [ 1] 4891 	mov in,count 
      009974 09 72 BB         [ 4] 4892 	call search_file
      009977 00 09            [ 1] 4893 	jrc 2$
      009979 1F 03            [ 1] 4894 	ld a,#ERR_NOT_FILE 
      00997B CC 07 16         [ 2] 4895 	jp tb_error 
      001C95                       4896 2$: 
      00997B CD 93 79         [ 2] 4897 	ldw x,farptr
      00997E A1 04 27         [ 1] 4898 	ld a,farptr+2
      009981 03 CC            [ 2] 4899 	jra 4$ 
      001C9D                       4900 3$: ; forget all files 
      009983 87 94 00         [ 2] 4901 	ldw x,#0x100
      009985 4F               [ 1] 4902 	clr a 
      009985 CD 83 68         [ 2] 4903 	ldw farptr,x 
      009988 5D 26 05         [ 1] 4904 	ld farptr+2,a 
      001CA7                       4905 4$:
      00998B A6 05 CC         [ 2] 4906 	ldw ffree,x 
      00998E 87 96 15         [ 1] 4907 	ld ffree+2,a 
      009990 4B 04            [ 1] 4908 	push #4
      009990 CF               [ 1] 4909 	clrw x 
      001CB0                       4910 5$: 
      009991 00               [ 1] 4911 	clr a  
      009992 05 E6 02         [ 4] 4912 	call write_byte 
      009995 C7               [ 1] 4913 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009996 00 04            [ 1] 4914 	dec (1,sp)
      009998 35 03            [ 1] 4915 	jrne 5$	
      00999A 00               [ 1] 4916 6$: pop a 
      00999B 02               [ 4] 4917 	ret 
                                   4918 
                                   4919 ;----------------------
                                   4920 ; BASIC: DIR 
                                   4921 ; list saved files 
                                   4922 ;----------------------
                           000001  4923 	COUNT=1 ; files counter 
                           000002  4924 	VSIZE=2 
      001CBB                       4925 directory:
      001CBB                       4926 	_vars VSIZE 
      00999C 81 02            [ 2]    1     sub sp,#VSIZE 
      00999D 5F               [ 1] 4927 	clrw x 
      00999D 72 00            [ 2] 4928 	ldw (COUNT,sp),x 
      00999F 00 20 05         [ 2] 4929 	ldw farptr+1,x 
      0099A2 A6 06 CC 87      [ 1] 4930 	mov farptr,#1 
      001CC7                       4931 dir_loop:
      0099A6 96               [ 1] 4932 	clrw x 
      0099A7 92 AF 00 10      [ 5] 4933 	ldf a,([farptr],x)
      0099A7 1E 03            [ 1] 4934 	jreq 8$ 
      001CCE                       4935 1$: ;name loop 	
      0099A9 CF 00 05 E6      [ 5] 4936 	ldf a,([farptr],x)
      0099AD 02 AB            [ 1] 4937 	jreq 2$ 
      0099AF 03 C7 00         [ 4] 4938 	call putc 
      0099B2 04               [ 1] 4939 	incw x 
      0099B3 35 03            [ 2] 4940 	jra 1$
      0099B5 00               [ 1] 4941 2$: incw x ; skip ending 0. 
      0099B6 02 4F            [ 1] 4942 	ld a,#SPACE 
      0099B8 85 5B 02         [ 4] 4943 	call putc 
                                   4944 ; get file size 	
      0099BB 89 81 00 10      [ 5] 4945 	ldf a,([farptr],x)
      0099BD 90 95            [ 1] 4946 	ld yh,a 
      0099BD 72               [ 1] 4947 	incw x 
      0099BE 01 00 20 02      [ 5] 4948 	ldf a,([farptr],x)
      0099C2 4F               [ 1] 4949 	incw x 
      0099C3 81 97            [ 1] 4950 	ld yl,a 
      0099C4 90 89            [ 2] 4951 	pushw y 
      0099C4 72 09 00         [ 2] 4952 	addw x,(1,sp)
      0099C7 20               [ 1] 4953 	incw x ; skip EOF marker 
                                   4954 ; skip to next file 
      0099C8 12 5B 02         [ 4] 4955 	call incr_farptr 
                                   4956 ; print file size 
      0099CB CD               [ 2] 4957 	popw x ; file size 
      0099CC 97 03 5B         [ 4] 4958 	call print_int 
      0099CF 06 72            [ 1] 4959 	ld a,#CR 
      0099D1 19 00 20         [ 4] 4960 	call putc
      0099D4 72 10            [ 2] 4961 	ldw x,(COUNT,sp)
      0099D6 00               [ 1] 4962 	incw x
      0099D7 20 CC            [ 2] 4963 	ldw (COUNT,sp),x  
      0099D9 88 44            [ 2] 4964 	jra dir_loop 
      001D07                       4965 8$: ; print number of files 
      0099DB CE 00            [ 2] 4966 	ldw x,(COUNT,sp)
      0099DD 19 C3 00         [ 4] 4967 	call print_int 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0099E0 1B 2B 02         [ 2] 4968 	ldw x,#file_count 
      0099E3 4F 81 CD         [ 4] 4969 	call puts  
                                   4970 ; print drive free space 	
      0099E6 93 F4            [ 1] 4971 	ld a,#0xff 
      0099E8 5B 02 CE         [ 1] 4972 	sub a,ffree+2 
      0099EB 00 19 CF         [ 1] 4973 	ld acc8,a 
      0099EE 00 05            [ 1] 4974 	ld a,#0x7f 
      0099F0 E6 02 C7         [ 1] 4975 	sbc a,ffree+1 
      0099F3 00 04 35         [ 1] 4976 	ld acc16,a 
      0099F6 03 00            [ 1] 4977 	ld a,#2 
      0099F8 02 72 10         [ 1] 4978 	sbc a,ffree 
      0099FB 00 20 CC         [ 1] 4979 	ld acc24,a 
      0099FE 88               [ 1] 4980 	clrw x  
      0099FF 44 06            [ 1] 4981 	ld a,#6 
      009A00 97               [ 1] 4982 	ld xl,a 
      009A00 AE 17            [ 1] 4983 	ld a,#10 
      009A02 FF 94 72         [ 4] 4984 	call prti24 
      009A05 11 00 20         [ 2] 4985 	ldw x,#drive_free
      009A08 72 19 00         [ 4] 4986 	call puts 
      001D39                       4987 	_drop VSIZE 
      009A0B 20 CC            [ 2]    1     addw sp,#VSIZE 
      009A0D 87               [ 4] 4988 	ret
      009A0E E8 66 69 6C 65 73 0A  4989 file_count: .asciz " files\n"
             00
      009A0F 20 62 79 74 65 73 20  4990 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   4991 
                                   4992 ;---------------------
                                   4993 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   4994 ; write 1 or more byte to FLASH or EEPROM
                                   4995 ; starting at address  
                                   4996 ; input:
                                   4997 ;   expr1  	is address 
                                   4998 ;   expr2   is byte to write
                                   4999 ; output:
                                   5000 ;   none 
                                   5001 ;---------------------
                           000001  5002 	ADDR=1
                           000002  5003 	VSIZ=2 
      001D51                       5004 write:
      001D51                       5005 	_vars VSIZE 
      009A0F CD 92            [ 2]    1     sub sp,#VSIZE 
      009A11 33 A1 02 27      [ 1] 5006 	clr farptr ; expect 16 bits address 
      009A15 03 CC 87         [ 4] 5007 	call expression
      009A18 94 04            [ 1] 5008 	cp a,#TK_INTGR 
      009A19 27 03            [ 1] 5009 	jreq 0$
      009A19 CE 00 17         [ 2] 5010 	jp syntax_error
      009A1C EE 02            [ 2] 5011 0$: ldw (ADDR,sp),x 
      009A1E A6 1F 62         [ 4] 5012 	call next_token 
      009A21 C7 50            [ 1] 5013 	cp a,#TK_COMMA 
      009A23 F3 72            [ 1] 5014 	jreq 1$ 
      009A25 1A 50            [ 2] 5015 	jra 9$ 
      009A27 F3 CD 90         [ 4] 5016 1$:	call expression
      009A2A 13 CD            [ 1] 5017 	cp a,#TK_INTGR
      009A2C 9E BE            [ 1] 5018 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A2E CD 90 3A         [ 2] 5019 	jp syntax_error
      009A31 A6               [ 1] 5020 2$:	ld a,xl 
      009A32 1F C7            [ 2] 5021 	ldw x,(ADDR,sp) 
      009A34 50 F3 81         [ 2] 5022 	ldw farptr+1,x 
      009A37 5F               [ 1] 5023 	clrw x 
      009A37 CD 92 33         [ 4] 5024 	call write_byte
      009A3A A1 02            [ 2] 5025 	ldw x,(ADDR,sp)
      009A3C 27               [ 1] 5026 	incw x 
      009A3D 0D A1            [ 2] 5027 	jra 0$ 
      001D85                       5028 9$:
      001D85                       5029 	_drop VSIZE
      009A3F 01 27            [ 2]    1     addw sp,#VSIZE 
      009A41 03               [ 4] 5030 	ret 
                                   5031 
                                   5032 
                                   5033 ;---------------------
                                   5034 ;BASIC: CHAR(expr)
                                   5035 ; évaluate expression 
                                   5036 ; and take the 7 least 
                                   5037 ; bits as ASCII character
                                   5038 ;---------------------
      001D88                       5039 char:
      009A42 CC 87 94         [ 4] 5040 	call func_args 
      009A45 AE 00            [ 1] 5041 	cp a,#1
      009A47 00 CD            [ 1] 5042 	jreq 1$
      009A49 90 06 AE         [ 2] 5043 	jp syntax_error
      009A4C 00 02 72         [ 4] 5044 1$:	call dpop 
      009A4F DE               [ 1] 5045 	ld a,xl 
      009A50 00 17            [ 1] 5046 	and a,#0x7f 
      009A52 5D               [ 1] 5047 	ld xl,a
      009A53 27 1C            [ 1] 5048 	ld a,#TK_CHAR
      009A55 72               [ 4] 5049 	ret
                                   5050 
                                   5051 ;---------------------
                                   5052 ; BASIC: ASC(string|char)
                                   5053 ; extract first character 
                                   5054 ; of string argument 
                                   5055 ; return it as TK_INTGR 
                                   5056 ;---------------------
      001D9C                       5057 ascii:
      009A56 CE 00 17         [ 4] 5058 	call func_args 
      009A59 9F A4 07         [ 4] 5059 	call next_token 
      009A5C 4E C7            [ 1] 5060 	cp a,#TK_QSTR 
      009A5E 54 01            [ 1] 5061 	jreq 1$
      009A60 72 16            [ 1] 5062 	cp a,#TK_CHAR 
      009A62 50 CA            [ 1] 5063 	jreq 2$ 
      009A64 72 10 54         [ 2] 5064 	jp syntax_error
      001DAD                       5065 1$: 
      009A67 01               [ 1] 5066 	ld a,(x)
      009A68 AE 00            [ 2] 5067 	jra 3$
      001DB0                       5068 2$: 
      009A6A 1B               [ 1] 5069 	ld a,xl 
      009A6B 5A               [ 1] 5070 3$:	ld xl,a 
      009A6C 9D               [ 1] 5071 	clr a  
      009A6D 26               [ 1] 5072 	ld xh,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009A6E FA 20            [ 1] 5073 	ld a,#TK_INTGR 
      009A70 08               [ 4] 5074 	ret 
                                   5075 
                                   5076 ;---------------------
                                   5077 ;BASIC: KEY
                                   5078 ; wait for a character 
                                   5079 ; received from STDIN 
                                   5080 ; input:
                                   5081 ;	none 
                                   5082 ; output:
                                   5083 ;	X 		ASCII character 
                                   5084 ;---------------------
      001DB7                       5085 key:
      009A71 72 11 54         [ 4] 5086 	call getc 
      009A74 01               [ 1] 5087 	clrw x 
      009A75 72               [ 1] 5088 	ld xl,a 
      009A76 17 50            [ 1] 5089 	ld a,#TK_INTGR
      009A78 CA               [ 4] 5090 	ret
                                   5091 
                                   5092 ;----------------------
                                   5093 ; BASIC: QKEY
                                   5094 ; Return true if there 
                                   5095 ; is a character in 
                                   5096 ; waiting in STDIN 
                                   5097 ; input:
                                   5098 ;  none 
                                   5099 ; output:
                                   5100 ;   X 		0|1 
                                   5101 ;-----------------------
      001DBF                       5102 qkey: 
      009A79 AE               [ 1] 5103 	clrw x 
      009A7A 00 02 CD 90 77   [ 2] 5104 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      009A7F 81               [ 1] 5105 	incw x 
      009A80 A6 04            [ 1] 5106 9$: ld a,#TK_INTGR
      009A80 CD               [ 4] 5107 	ret 
                                   5108 
                                   5109 ;---------------------
                                   5110 ; BASIC: GPIO(expr,reg)
                                   5111 ; return gpio address 
                                   5112 ; expr {0..8}
                                   5113 ; input:
                                   5114 ;   none 
                                   5115 ; output:
                                   5116 ;   X 		gpio register address
                                   5117 ;----------------------------
      001DC9                       5118 gpio:
      009A81 92 57 A1         [ 4] 5119 	call func_args 
      009A84 01 27            [ 1] 5120 	cp a,#2
      009A86 03 CC            [ 1] 5121 	jreq 1$
      009A88 87 94 CD         [ 2] 5122 	jp syntax_error  
      001DD3                       5123 1$:	
      009A8B 90 13 A3         [ 2] 5124 	ldw x,#2
      009A8E 00 05 23 05      [ 5] 5125 	ldw x,([dstkptr],x) ; port 
      009A92 A6 0A            [ 1] 5126 	jrmi bad_port
      009A94 CC 87 96         [ 2] 5127 	cpw x,#9
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009A97 9F C7            [ 1] 5128 	jrpl bad_port
      009A99 00 0A            [ 1] 5129 	ld a,#5
      009A9B A6               [ 4] 5130 	mul x,a
      009A9C 05 C0 00         [ 2] 5131 	addw x,#GPIO_BASE 
      009A9F 0A               [ 2] 5132 	pushw x 
      009AA0 C7 54 00         [ 4] 5133 	call dpop 
      009AA3 72 16 54         [ 2] 5134 	addw x,(1,sp)
      009AA6 02 72            [ 2] 5135 	ldw (1,sp),x  
      009AA8 10 54 01         [ 4] 5136 	call ddrop  
      009AAB 72               [ 2] 5137 	popw x 
      009AAC 0F 54            [ 1] 5138 	ld a,#TK_INTGR
      009AAE 00               [ 4] 5139 	ret
      001DF7                       5140 bad_port:
      009AAF FB CE            [ 1] 5141 	ld a,#ERR_BAD_VALUE
      009AB1 54 04 A6         [ 2] 5142 	jp tb_error
                                   5143 
                                   5144 
                                   5145 ;-------------------------
                                   5146 ; BASIC: UFLASH 
                                   5147 ; return user flash address
                                   5148 ; input:
                                   5149 ;  none 
                                   5150 ; output:
                                   5151 ;	A		TK_INTGR
                                   5152 ;   X 		user address 
                                   5153 ;---------------------------
      001DFC                       5154 uflash:
      009AB4 04 81 80         [ 2] 5155 	ldw x,#user_space 
      009AB6 A6 04            [ 1] 5156 	ld a,#TK_INTGR 
      009AB6 72               [ 4] 5157 	ret 
                                   5158 
                                   5159 
                                   5160 ;---------------------
                                   5161 ; BASIC: USR(addr[,arg])
                                   5162 ; execute a function written 
                                   5163 ; in binary code.
                                   5164 ; binary fonction should 
                                   5165 ; return token attribute in A 
                                   5166 ; and value in X. 
                                   5167 ; input:
                                   5168 ;   addr	routine address 
                                   5169 ;   arg 	is an optional argument 
                                   5170 ; output:
                                   5171 ;   A 		token attribute 
                                   5172 ;   X       returned value 
                                   5173 ;---------------------
      001E02                       5174 usr:
      009AB7 00 00            [ 2] 5175 	pushw y 	
      009AB9 20 02 4F         [ 4] 5176 	call func_args 
      009ABC 81 01            [ 1] 5177 	cp a,#1 
      009ABD 2A 03            [ 1] 5178 	jrpl 2$ 
      009ABD AE 9A E4         [ 2] 5179 	jp syntax_error 
      001E0E                       5180 2$: 
      009AC0 CD 82 38         [ 4] 5181 	call dpop 
      009AC3 5B 02            [ 1] 5182 	cp a,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009AC5 52 06            [ 1] 5183 	jrmi 4$
      009AC7 CD 96            [ 1] 5184 	ldw y,x ; y=arg 
      009AC9 F3 AE 16         [ 4] 5185 	call dpop ;x=addr 
      009ACC C8               [ 1] 5186 4$:	exgw y,x ; y=addr,x=arg 
      009ACD CF 00            [ 4] 5187 	call (y)
      009ACF 05 7F            [ 2] 5188 	popw y 
      009AD1 72               [ 4] 5189 	ret 
                                   5190 
                                   5191 ;------------------------------
                                   5192 ; BASIC: BYE 
                                   5193 ; halt mcu in its lowest power mode 
                                   5194 ; wait for reset or external interrupt
                                   5195 ; do a cold start on wakeup.
                                   5196 ;------------------------------
      001E20                       5197 bye:
      009AD2 5F 00 04 5F CF   [ 2] 5198 	btjf UART3_SR,#UART_SR_TC,.
      009AD7 00               [10] 5199 	halt
      009AD8 01 72 11         [ 2] 5200 	jp cold_start  
                                   5201 
                                   5202 ;----------------------------------
                                   5203 ; BASIC: SLEEP 
                                   5204 ; halt mcu until reset or external
                                   5205 ; interrupt.
                                   5206 ; Resume progam after SLEEP command
                                   5207 ;----------------------------------
      001E29                       5208 sleep:
      009ADB 00 20 72 18 00   [ 2] 5209 	btjf UART3_SR,#UART_SR_TC,.
      009AE0 20 CC 88 44      [ 1] 5210 	bset flags,#FSLEEP
      009AE4 0A               [10] 5211 	halt 
      009AE5 62               [ 4] 5212 	ret 
                                   5213 
                                   5214 ;-------------------------------
                                   5215 ; BASIC: PAUSE expr 
                                   5216 ; suspend execution for n msec.
                                   5217 ; input:
                                   5218 ;	none
                                   5219 ; output:
                                   5220 ;	none 
                                   5221 ;------------------------------
      001E34                       5222 pause:
      009AE6 72 65 61         [ 4] 5223 	call expression
      009AE9 6B 20            [ 1] 5224 	cp a,#TK_INTGR
      009AEB 70 6F            [ 1] 5225 	jreq pause02 
      009AED 69 6E 74         [ 2] 5226 	jp syntax_error
      001E3E                       5227 pause02: 
      009AF0 2C               [ 2] 5228 1$: tnzw x 
      009AF1 20 52            [ 1] 5229 	jreq 2$
      009AF3 55               [10] 5230 	wfi 
      009AF4 4E               [ 2] 5231 	decw x 
      009AF5 20 74            [ 1] 5232 	jrne 1$
      009AF7 6F               [ 1] 5233 2$:	clr a 
      009AF8 20               [ 4] 5234 	ret 
                                   5235 
                                   5236 ;------------------------------
                                   5237 ; BASIC: TICKS
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5238 ; return msec ticks counter value 
                                   5239 ; input:
                                   5240 ; 	none 
                                   5241 ; output:
                                   5242 ;	X 		TK_INTGR
                                   5243 ;-------------------------------
      001E47                       5244 get_ticks:
      009AF9 72 65 73         [ 2] 5245 	ldw x,ticks 
      009AFC 75 6D            [ 1] 5246 	ld a,#TK_INTGR
      009AFE 65               [ 4] 5247 	ret 
                                   5248 
                                   5249 
                                   5250 
                                   5251 ;------------------------------
                                   5252 ; BASIC: ABS(expr)
                                   5253 ; return absolute value of expr.
                                   5254 ; input:
                                   5255 ;   none
                                   5256 ; output:
                                   5257 ;   X     	positive integer
                                   5258 ;-------------------------------
      001E4D                       5259 abs:
      009AFF 2E 0A 00         [ 4] 5260 	call func_args 
      009B02 A1 01            [ 1] 5261 	cp a,#1 
      009B02 72 01            [ 1] 5262 	jreq 0$ 
      009B04 00 20 02         [ 2] 5263 	jp syntax_error
      001E57                       5264 0$:  
      009B07 4F 81 93         [ 4] 5265     call dpop   
      009B09 9E               [ 1] 5266 	ld a,xh 
      009B09 CD 86            [ 1] 5267 	bcp a,#0x80 
      009B0B 66 81            [ 1] 5268 	jreq 2$ 
      009B0D 50               [ 2] 5269 	negw x 
      009B0D 72 BB            [ 1] 5270 2$: ld a,#TK_INTGR 
      009B0F 00               [ 4] 5271 	ret 
                                   5272 
                                   5273 ;------------------------------
                                   5274 ; BASIC: AND(expr1,expr2)
                                   5275 ; Apply bit AND relation between
                                   5276 ; the 2 arguments, i.e expr1 & expr2 
                                   5277 ; output:
                                   5278 ; 	A 		TK_INTGR
                                   5279 ;   X 		result 
                                   5280 ;------------------------------
      001E63                       5281 bit_and:
      009B10 12 24 04         [ 4] 5282 	call func_args 
      009B13 72 5C            [ 1] 5283 	cp a,#2
      009B15 00 11            [ 1] 5284 	jreq 1$
      009B17 CF 00 12         [ 2] 5285 	jp syntax_error 
      009B1A 81 0F 93         [ 4] 5286 1$:	call dpop 
      009B1B 89               [ 2] 5287 	pushw x 
      009B1B A6 01 C7         [ 4] 5288 	call dpop 
      009B1E 00               [ 1] 5289 	ld a,xh 
      009B1F 11 5F            [ 1] 5290 	and a,(1,sp)
      009B21 CF               [ 1] 5291 	ld xh,a 
      009B22 00               [ 1] 5292 	ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B23 12 02            [ 1] 5293 	and a,(2,sp)
      009B24 97               [ 1] 5294 	ld xl,a 
      001E7C                       5295 	_drop 2 
      009B24 AE 00            [ 2]    1     addw sp,#2 
      009B26 03 92            [ 1] 5296 	ld a,#TK_INTGR
      009B28 AF               [ 4] 5297 	ret
                                   5298 
                                   5299 ;------------------------------
                                   5300 ; BASIC: OR(expr1,expr2)
                                   5301 ; Apply bit OR relation between
                                   5302 ; the 2 arguments, i.e expr1 | expr2 
                                   5303 ; output:
                                   5304 ; 	A 		TK_INTGR
                                   5305 ;   X 		result 
                                   5306 ;------------------------------
      001E81                       5307 bit_or:
      009B29 00 11 26         [ 4] 5308 	call func_args 
      009B2C 05 5A            [ 1] 5309 	cp a,#2
      009B2E 2A F7            [ 1] 5310 	jreq 1$
      009B30 20 19 5C         [ 2] 5311 	jp syntax_error 
      001E8B                       5312 1$: 
      009B33 CD 9B 0D         [ 4] 5313 	call dpop 
      009B36 AE               [ 2] 5314 	pushw x 
      009B37 02 7F C3         [ 4] 5315 	call dpop 
      009B3A 00               [ 1] 5316 	ld a,xh 
      009B3B 11 2A            [ 1] 5317 	or a,(1,sp)
      009B3D E6               [ 1] 5318 	ld xh,a 
      009B3E 72               [ 1] 5319 	ld a,xl 
      009B3F 5F 00            [ 1] 5320 	or a,(2,sp)
      009B41 14               [ 1] 5321 	ld xl,a 
      001E9A                       5322 	_drop 2 
      009B42 72 5F            [ 2]    1     addw sp,#2 
      009B44 00 15            [ 1] 5323 	ld a,#TK_INTGR 
      009B46 72               [ 4] 5324 	ret
                                   5325 
                                   5326 ;------------------------------
                                   5327 ; BASIC: XOR(expr1,expr2)
                                   5328 ; Apply bit XOR relation between
                                   5329 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5330 ; output:
                                   5331 ; 	A 		TK_INTGR
                                   5332 ;   X 		result 
                                   5333 ;------------------------------
      001E9F                       5334 bit_xor:
      009B47 5F 00 16         [ 4] 5335 	call func_args 
      009B4A 81 02            [ 1] 5336 	cp a,#2
      009B4B 27 03            [ 1] 5337 	jreq 1$
      009B4B CE 00 11         [ 2] 5338 	jp syntax_error 
      001EA9                       5339 1$: 
      009B4E C6 00 13         [ 4] 5340 	call dpop 
      009B51 CF               [ 2] 5341 	pushw x 
      009B52 00 14 C7         [ 4] 5342 	call dpop 
      009B55 00               [ 1] 5343 	ld a,xh 
      009B56 16 81            [ 1] 5344 	xor a,(1,sp)
      009B58 95               [ 1] 5345 	ld xh,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009B58 5F               [ 1] 5346 	ld a,xl 
      009B59 92 AF            [ 1] 5347 	xor a,(2,sp)
      009B5B 00               [ 1] 5348 	ld xl,a 
      001EB8                       5349 	_drop 2 
      009B5C 11 90            [ 2]    1     addw sp,#2 
      009B5E F1 26            [ 1] 5350 	ld a,#TK_INTGR 
      009B60 08               [ 4] 5351 	ret 
                                   5352 
                                   5353 ;------------------------------
                                   5354 ; BASIC: LSHIFT(expr1,expr2)
                                   5355 ; logical shift left expr1 by 
                                   5356 ; expr2 bits 
                                   5357 ; output:
                                   5358 ; 	A 		TK_INTGR
                                   5359 ;   X 		result 
                                   5360 ;------------------------------
      001EBD                       5361 lshift:
      009B61 4D 27 12         [ 4] 5362 	call func_args
      009B64 5C 90            [ 1] 5363 	cp a,#2 
      009B66 5C 20            [ 1] 5364 	jreq 1$
      009B68 F0 07 14         [ 2] 5365 	jp syntax_error
      009B69 CD 0F 93         [ 4] 5366 1$: call dpop  
      009B69 4D               [ 1] 5367 	exgw x,y 
      009B6A 27 07 5C         [ 4] 5368 	call dpop
      009B6D 92 AF            [ 2] 5369 	tnzw y 
      009B6F 00 11            [ 1] 5370 	jreq 4$
      009B71 20               [ 2] 5371 2$:	sllw x 
      009B72 F6 5C            [ 2] 5372 	decw y 
      009B74 98 81            [ 1] 5373 	jrne 2$
      009B76                       5374 4$:  
      009B76 5C 99            [ 1] 5375 	ld a,#TK_INTGR
      009B78 81               [ 4] 5376 	ret
                                   5377 
                                   5378 ;------------------------------
                                   5379 ; BASIC: RSHIFT(expr1,expr2)
                                   5380 ; logical shift right expr1 by 
                                   5381 ; expr2 bits.
                                   5382 ; output:
                                   5383 ; 	A 		TK_INTGR
                                   5384 ;   X 		result 
                                   5385 ;------------------------------
      009B79                       5386 rshift:
      009B79 52 04 17         [ 4] 5387 	call func_args
      009B7C 03 5F            [ 1] 5388 	cp a,#2 
      009B7E CF 00            [ 1] 5389 	jreq 1$
      009B80 12 35 01         [ 2] 5390 	jp syntax_error
      009B83 00 11 93         [ 4] 5391 1$: call dpop  
      009B85 51               [ 1] 5392 	exgw x,y 
      009B85 92 BC 00         [ 4] 5393 	call dpop
      009B88 11 27            [ 2] 5394 	tnzw y 
      009B8A 25 5F            [ 1] 5395 	jreq 4$
      009B8C 16               [ 2] 5396 2$:	srlw x 
      009B8D 03 CD            [ 2] 5397 	decw y 
      009B8F 9B 58            [ 1] 5398 	jrne 2$
      001EF4                       5399 4$:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009B91 25 2D            [ 1] 5400 	ld a,#TK_INTGR
      009B93 92               [ 4] 5401 	ret
                                   5402 
                                   5403 ;--------------------------
                                   5404 ; BASIC: FCPU integer
                                   5405 ; set CPU frequency 
                                   5406 ;-------------------------- 
                                   5407 
      001EF7                       5408 fcpu:
      009B94 AF 00            [ 1] 5409 	ld a,#TK_INTGR
      009B96 11 6B 01         [ 4] 5410 	call expect 
      009B99 5C               [ 1] 5411 	ld a,xl 
      009B9A 92 AF            [ 1] 5412 	and a,#7 
      009B9C 00 11 6B         [ 1] 5413 	ld CLK_CKDIVR,a 
      009B9F 02               [ 4] 5414 	ret 
                                   5415 
                                   5416 ;------------------------------
                                   5417 ; BASIC: PMODE pin#, mode 
                                   5418 ; define pin as input or output
                                   5419 ; pin#: {0..15}
                                   5420 ; mode: INPUT|OUTPUT  
                                   5421 ;------------------------------
                           000001  5422 	PINNO=1
                           000001  5423 	VSIZE=1
      001F03                       5424 pin_mode:
      001F03                       5425 	_vars VSIZE 
      009BA0 5C 72            [ 2]    1     sub sp,#VSIZE 
      009BA2 FB 01 5C         [ 4] 5426 	call arg_list 
      009BA5 CD 9B            [ 1] 5427 	cp a,#2 
      009BA7 0D AE            [ 1] 5428 	jreq 1$
      009BA9 02 80 C3         [ 2] 5429 	jp syntax_error 
      009BAC 00 11 2A         [ 4] 5430 1$: call dpop ; mode 
      009BAF D5               [ 1] 5431 	exgw x,y 
      009BB0 CD 0F 93         [ 4] 5432 	call dpop 
      009BB0 72               [ 2] 5433 	sllw x 
      009BB1 5F 00 11         [ 2] 5434 	addw x,#arduino_to_8s208 
      009BB4 72               [ 2] 5435 	ldw x,(x) ; xh=port,xl=pin 
      009BB5 5F               [ 1] 5436 	ld a,xl 
      009BB6 00 12            [ 1] 5437 	ld (PINNO,sp),a 
      009BB8 72               [ 1] 5438 	swapw x 
      009BB9 5F 00            [ 1] 5439 	ld a,#5 
      009BBB 13               [ 4] 5440 	mul x,a 
      009BBC 5B 04 98         [ 2] 5441 	addw x,#GPIO_BASE ; port base address 
      009BBF 81 01            [ 1] 5442 	ld a,#1 
      009BC0 0D 01            [ 1] 5443 	tnz (PINNO,sp)
      009BC0 5B 04            [ 1] 5444 	jreq 4$
      009BC2 99               [ 1] 5445 2$:	sll a 
      009BC3 81 01            [ 1] 5446 	dec (PINNO,sp)
      009BC4 26 FB            [ 1] 5447 	jrne 2$ 
      009BC4 72 01            [ 1] 5448 	ld (PINNO,sp),a
      009BC6 00 20            [ 1] 5449 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009BC8 05 A6            [ 1] 5450 	ld (GPIO_CR1,x),a 
      009BCA 07 CC 87 96      [ 2] 5451 4$:	cpw y,#OUTP 
      009BCE 27 07            [ 1] 5452 	jreq 6$
                                   5453 ; input mode
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009BCE CE 00            [ 1] 5454 	ld a,(PINNO,sp)
      009BD0 1B               [ 1] 5455 	cpl a 
      009BD1 72 B0            [ 1] 5456 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009BD3 00 19            [ 2] 5457 	jra 9$
      001F43                       5458 6$: ;output mode  
      009BD5 26 01            [ 1] 5459 	ld a,(PINNO,sp)
      009BD7 81 04            [ 1] 5460 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009BD8 E7 04            [ 1] 5461 	ld (GPIO_CR2,x),a 
      009BD8 52 04            [ 1] 5462 	ld a,(PINNO,sp)
      009BDA 1F 01            [ 1] 5463 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009BDC CD 88            [ 1] 5464 9$:	ld (GPIO_DDR,x),a 
      001F4F                       5465 	_drop VSIZE 
      009BDE 74 A1            [ 2]    1     addw sp,#VSIZE 
      009BE0 0A               [ 4] 5466 	ret
                                   5467 ; translation from Arduino D0..D15 to stm8s208rb 
      001F52                       5468 arduino_to_8s208:
      009BE1 27 03                 5469 .byte 3,6 ; D0 
      009BE3 CC 87                 5470 .byte 3,5 ; D1 
      009BE5 94 00                 5471 .byte 4,0 ; D2 
      009BE6 02 01                 5472 .byte 2,1 ; D3
      009BE6 90 CE                 5473 .byte 6,0 ; D4
      009BE8 00 05                 5474 .byte 2,2 ; D5
      009BEA 72 B9                 5475 .byte 2,3 ; D6
      009BEC 00 01                 5476 .byte 3,1 ; D7
      009BEE 17 03                 5477 .byte 3,3 ; D8
      009BF0 55 00                 5478 .byte 2,4 ; D9
      009BF2 04 00                 5479 .byte 4,5 ; D10
      009BF4 02 93                 5480 .byte 2,6 ; D11
      009BF6 CD 82                 5481 .byte 2,7 ; D12
      009BF8 FA 1C                 5482 .byte 2,5 ; D13
      009BFA 00 03                 5483 .byte 4,2 ; D14
      009BFC 72 FB                 5484 .byte 4,1 ; D15
                                   5485 
                                   5486 
                                   5487 ;------------------------------
                                   5488 ; BASIC: RND(expr)
                                   5489 ; return random number 
                                   5490 ; between 1 and expr inclusive
                                   5491 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5492 ; input:
                                   5493 ; 	none 
                                   5494 ; output:
                                   5495 ;	X 		random positive integer 
                                   5496 ;------------------------------
      001F72                       5497 random:
      009BFE 01 72 5D         [ 4] 5498 	call func_args 
      009C01 00 14            [ 1] 5499 	cp a,#1
      009C03 26 0B            [ 1] 5500 	jreq 1$
      009C05 72 B0 00         [ 2] 5501 	jp syntax_error
      001F7C                       5502 1$: 
      009C08 15 23 05         [ 4] 5503 	call dpop 
      009C0B A6               [ 2] 5504 	pushw x 
      009C0C 01               [ 1] 5505 	ld a,xh 
      009C0D CC 87            [ 1] 5506 	bcp a,#0x80 
      009C0F 96 05            [ 1] 5507 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C10 A6 0A            [ 1] 5508 	ld a,#ERR_BAD_VALUE
      009C10 16 03 CD         [ 2] 5509 	jp tb_error
      001F8A                       5510 2$: 
                                   5511 ; acc16=(x<<5)^x 
      009C13 9B 79 24         [ 2] 5512 	ldw x,seedx 
      009C16 05               [ 2] 5513 	sllw x 
      009C17 A6               [ 2] 5514 	sllw x 
      009C18 08               [ 2] 5515 	sllw x 
      009C19 CC               [ 2] 5516 	sllw x 
      009C1A 87               [ 2] 5517 	sllw x 
      009C1B 96               [ 1] 5518 	ld a,xh 
      009C1C C8 00 0C         [ 1] 5519 	xor a,seedx 
      009C1C CE 00 14         [ 1] 5520 	ld acc16,a 
      009C1F C6               [ 1] 5521 	ld a,xl 
      009C20 00 16 CF         [ 1] 5522 	xor a,seedx+1 
      009C23 00 11 C7         [ 1] 5523 	ld acc8,a 
                                   5524 ; seedx=seedy 
      009C26 00 13 1E         [ 2] 5525 	ldw x,seedy 
      009C29 03 CD 82         [ 2] 5526 	ldw seedx,x  
                                   5527 ; seedy=seedy^(seedy>>1)
      009C2C FA 5C            [ 2] 5528 	srlw y 
      009C2E 1F 01            [ 1] 5529 	ld a,yh 
      009C30 5F 16 03         [ 1] 5530 	xor a,seedy 
      009C33 CD 81 D5         [ 1] 5531 	ld seedy,a  
      009C36 CE 00            [ 1] 5532 	ld a,yl 
      009C38 1B 72 B0         [ 1] 5533 	xor a,seedy+1 
      009C3B 00 19 1F         [ 1] 5534 	ld seedy+1,a 
                                   5535 ; acc16>>3 
      009C3E 01 5F 7B         [ 2] 5536 	ldw x,acc16 
      009C41 01               [ 2] 5537 	srlw x 
      009C42 CD               [ 2] 5538 	srlw x 
      009C43 81               [ 2] 5539 	srlw x 
                                   5540 ; x=acc16^x 
      009C44 60               [ 1] 5541 	ld a,xh 
      009C45 5C 7B 02         [ 1] 5542 	xor a,acc16 
      009C48 CD               [ 1] 5543 	ld xh,a 
      009C49 81               [ 1] 5544 	ld a,xl 
      009C4A 60 5C CD         [ 1] 5545 	xor a,acc8 
      009C4D 9B               [ 1] 5546 	ld xl,a 
                                   5547 ; seedy=x^seedy 
      009C4E 0D 1E 01         [ 1] 5548 	xor a,seedy+1
      009C51 89               [ 1] 5549 	ld xl,a 
      009C52 5F               [ 1] 5550 	ld a,xh 
      009C53 90 CE 00         [ 1] 5551 	xor a,seedy
      009C56 19               [ 1] 5552 	ld xh,a 
      009C57 CD 81 D5         [ 2] 5553 	ldw seedy,x 
                                   5554 ; return seedy modulo expr + 1 
      009C5A 5B 02            [ 2] 5555 	popw y 
      009C5C AE               [ 2] 5556 	divw x,y 
      009C5D 00               [ 1] 5557 	ldw x,y 
      009C5E 01               [ 1] 5558 	incw x 
      009C5F A6 FF            [ 1] 5559 	ld a,#TK_INTGR
      009C61 CD               [ 4] 5560 	ret 
                                   5561 
                                   5562 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   5563 ; BASIC: WORDS 
                                   5564 ; affiche la listes des mots du
                                   5565 ; dictionnaire.
                                   5566 ;---------------------------------
                           000001  5567 	WLEN=1
                           000002  5568 	LLEN=2  
                           000002  5569 	VSIZE=2 
      001FDC                       5570 words:
      001FDC                       5571 	_vars VSIZE
      009C62 81 60            [ 2]    1     sub sp,#VSIZE 
      009C64 CD 9B            [ 1] 5572 	clr (LLEN,sp)
      009C66 0D CE 00 11      [ 2] 5573 	ldw y,#kword_dict+2
      009C6A C6               [ 1] 5574 0$:	ldw x,y
      009C6B 00               [ 1] 5575 	ld a,(x)
      009C6C 13 CF            [ 1] 5576 	and a,#15 
      009C6E 00 14            [ 1] 5577 	ld (WLEN,sp),a 
      009C70 C7               [ 1] 5578 1$:	incw x 
      009C71 00               [ 1] 5579 	ld a,(x)
      009C72 16 5F 4B         [ 4] 5580 	call putc 
      009C75 04 02            [ 1] 5581 	inc (LLEN,sp)
      009C76 0A 01            [ 1] 5582 	dec (WLEN,sp)
      009C76 4F CD            [ 1] 5583 	jrne 1$
      009C78 81 60            [ 1] 5584 	ld a,#70
      009C7A 5C 0A            [ 1] 5585 	cp a,(LLEN,sp)
      009C7C 01 26            [ 1] 5586 	jrmi 2$   
      009C7E F7 84            [ 1] 5587 	ld a,#SPACE 
      009C80 1E 01 CD         [ 4] 5588 	call putc 
      009C83 8A 0D            [ 1] 5589 	inc (LLEN,sp) 
      009C85 5B 04            [ 2] 5590 	jra 3$
      009C87 81 0D            [ 1] 5591 2$: ld a,#CR 
      009C88 CD 01 A6         [ 4] 5592 	call putc 
      009C88 72 01            [ 1] 5593 	clr (LLEN,sp)
      009C8A 00 20 07 27      [ 2] 5594 3$:	subw y,#2 
      009C8E 05 A6            [ 2] 5595 	ldw y,(y)
      009C90 07 CC            [ 1] 5596 	jrne 0$  
      002013                       5597 	_drop VSIZE 
      009C92 87 96            [ 2]    1     addw sp,#VSIZE 
      009C94 81               [ 4] 5598 	ret 
                                   5599 
                                   5600 
                                   5601 ;*********************************
                                   5602 
                                   5603 ;------------------------------
                                   5604 ;      dictionary 
                                   5605 ; format:
                                   5606 ;   link:   2 bytes 
                                   5607 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5608 ;   cmd_name: 16 byte max 
                                   5609 ;   code_address: 2 bytes 
                                   5610 ;------------------------------
                                   5611 	.macro _dict_entry len,name,cmd 
                                   5612 	.word LINK 
                                   5613 	LINK=.
                                   5614 name:
                                   5615 	.byte len 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   5616 	.ascii "name"
                                   5617 	.word cmd 
                                   5618 	.endm 
                                   5619 
                           000000  5620 	LINK=0
      002016                       5621 kword_end:
      002016                       5622 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009C94 CD 88                    1 	.word LINK 
                           002018     2 	LINK=.
      002018                          3 XOR:
      009C96 74                       4 	.byte 3+F_IFUNC 	
      009C97 A1 0A 27                 5 	.ascii "XOR"
      009C9A 03 CC                    6 	.word bit_xor 
      00201E                       5623 	_dict_entry,5,WRITE,write  
      009C9C 87 94                    1 	.word LINK 
                           002020     2 	LINK=.
      009C9E                          3 WRITE:
      009C9E 90                       4 	.byte 5 	
      009C9F CE 00 05 72 B9           5 	.ascii "WRITE"
      009CA4 00 01                    6 	.word write 
      002028                       5624 	_dict_entry,5,WORDS,words 
      009CA6 55 00                    1 	.word LINK 
                           00202A     2 	LINK=.
      00202A                          3 WORDS:
      009CA8 04                       4 	.byte 5 	
      009CA9 00 02 CD 9B 79           5 	.ascii "WORDS"
      009CAE 25 05                    6 	.word words 
      002032                       5625 	_dict_entry 4,WAIT,wait 
      009CB0 A6 09                    1 	.word LINK 
                           002034     2 	LINK=.
      002034                          3 WAIT:
      009CB2 CC                       4 	.byte 4 	
      009CB3 87 96 49 54              5 	.ascii "WAIT"
      009CB5 17 0D                    6 	.word wait 
      00203B                       5626 	_dict_entry,3+F_IFUNC,USR,usr
      009CB5 CD 9B                    1 	.word LINK 
                           00203D     2 	LINK=.
      00203D                          3 USR:
      009CB7 0D                       4 	.byte 3+F_IFUNC 	
      009CB8 CD 86 66                 5 	.ascii "USR"
      009CBB 5F 92                    6 	.word usr 
      002043                       5627 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009CBD AF 00                    1 	.word LINK 
                           002045     2 	LINK=.
      002045                          3 UFLASH:
      009CBF 11                       4 	.byte 6+F_IFUNC 	
      009CC0 90 95 5C 92 AF 00        5 	.ascii "UFLASH"
      009CC6 11 5C                    6 	.word uflash 
      00204E                       5628 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009CC8 90 97                    1 	.word LINK 
                           002050     2 	LINK=.
      002050                          3 UBOUND:
      009CCA 72                       4 	.byte 6+F_IFUNC 	
      009CCB B9 00 19 90 CF 00        5 	.ascii "UBOUND"
      009CD1 1B 90                    6 	.word ubound 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      002059                       5629 	_dict_entry,2,TO,to
      009CD3 CE 00                    1 	.word LINK 
                           00205B     2 	LINK=.
      00205B                          3 TO:
      009CD5 19                       4 	.byte 2 	
      009CD6 54 4F                    5 	.ascii "TO"
      009CD6 92 AF                    6 	.word to 
      002060                       5630 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      009CD8 00 11                    1 	.word LINK 
                           002062     2 	LINK=.
      002062                          3 TICKS:
      009CDA 90                       4 	.byte 5+F_IFUNC 	
      009CDB F7 5C 90 5C 90           5 	.ascii "TICKS"
      009CE0 C3 00                    6 	.word get_ticks 
      00206A                       5631 	_dict_entry,4,STOP,stop 
      009CE2 1B 2B                    1 	.word LINK 
                           00206C     2 	LINK=.
      00206C                          3 STOP:
      009CE4 F1                       4 	.byte 4 	
      009CE5 CE 00 1B 72              5 	.ascii "STOP"
      009CE9 B0 00                    6 	.word stop 
      002073                       5632 	_dict_entry,4,STEP,step 
      009CEB 19 CD                    1 	.word LINK 
                           002075     2 	LINK=.
      002075                          3 STEP:
      009CED 8A                       4 	.byte 4 	
      009CEE 0D 81 45 50              5 	.ascii "STEP"
      009CF0 18 34                    6 	.word step 
      00207C                       5633 	_dict_entry,5,SLEEP,sleep 
      009CF0 CD 88                    1 	.word LINK 
                           00207E     2 	LINK=.
      00207E                          3 SLEEP:
      009CF2 74                       4 	.byte 5 	
      009CF3 A1 00 27 26 A1           5 	.ascii "SLEEP"
      009CF8 0A 27                    6 	.word sleep 
      002086                       5634 	_dict_entry,4+F_IFUNC,SIZE,size
      009CFA 03 CC                    1 	.word LINK 
                           002088     2 	LINK=.
      002088                          3 SIZE:
      009CFC 87                       4 	.byte 4+F_IFUNC 	
      009CFD 94 90 CE 00              5 	.ascii "SIZE"
      009D01 05 72                    6 	.word size 
      00208F                       5635     _dict_entry,4,SHOW,show 
      009D03 B9 00                    1 	.word LINK 
                           002091     2 	LINK=.
      002091                          3 SHOW:
      009D05 01                       4 	.byte 4 	
      009D06 55 00 04 00              5 	.ascii "SHOW"
      009D0A 02 CD                    6 	.word show 
      002098                       5636 	_dict_entry,4,SAVE,save
      009D0C 9B 79                    1 	.word LINK 
                           00209A     2 	LINK=.
      00209A                          3 SAVE:
      009D0E 25                       4 	.byte 4 	
      009D0F 05 A6 09 CC              5 	.ascii "SAVE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009D13 87 96                    6 	.word save 
      009D15                       5637 	_dict_entry 3,RUN,run
      009D15 CE 00                    1 	.word LINK 
                           0020A3     2 	LINK=.
      0020A3                          3 RUN:
      009D17 11                       4 	.byte 3 	
      009D18 C6 00 13                 5 	.ascii "RUN"
      009D1B 20 0A                    6 	.word run 
      009D1D                       5638 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      009D1D AE 01                    1 	.word LINK 
                           0020AB     2 	LINK=.
      0020AB                          3 RSHIFT:
      009D1F 00                       4 	.byte 6+F_IFUNC 	
      009D20 4F CF 00 11 C7 00        5 	.ascii "RSHIFT"
      009D26 13 DA                    6 	.word rshift 
      009D27                       5639 	_dict_entry,3+F_IFUNC,RND,random 
      009D27 CF 00                    1 	.word LINK 
                           0020B6     2 	LINK=.
      0020B6                          3 RND:
      009D29 14                       4 	.byte 3+F_IFUNC 	
      009D2A C7 00 16                 5 	.ascii "RND"
      009D2D 4B 04                    6 	.word random 
      0020BC                       5640 	_dict_entry,6,RETURN,return 
      009D2F 5F B6                    1 	.word LINK 
                           0020BE     2 	LINK=.
      009D30                          3 RETURN:
      009D30 4F                       4 	.byte 6 	
      009D31 CD 81 60 5C 0A 01        5 	.ascii "RETURN"
      009D37 26 F7                    6 	.word return 
      0020C7                       5641 	_dict_entry 6,REMARK,rem 
      009D39 84 81                    1 	.word LINK 
                           0020C9     2 	LINK=.
      009D3B                          3 REMARK:
      009D3B 52                       4 	.byte 6 	
      009D3C 02 5F 1F 01 CF 00        5 	.ascii "REMARK"
      009D42 12 35                    6 	.word rem 
      0020D2                       5642 	_dict_entry,6,REBOOT,cold_start 
      009D44 01 00                    1 	.word LINK 
                           0020D4     2 	LINK=.
      0020D4                          3 REBOOT:
      009D46 11                       4 	.byte 6 	
      009D47 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      009D47 5F 92                    6 	.word cold_start 
      0020DD                       5643 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      009D49 AF 00                    1 	.word LINK 
                           0020DF     2 	LINK=.
      0020DF                          3 QKEY:
      009D4B 11                       4 	.byte 4+F_IFUNC 	
      009D4C 27 39 45 59              5 	.ascii "QKEY"
      009D4E 1D BF                    6 	.word qkey 
      0020E6                       5644 	_dict_entry,6,PWRADC,power_adc 
      009D4E 92 AF                    1 	.word LINK 
                           0020E8     2 	LINK=.
      0020E8                          3 PWRADC:
      009D50 00                       4 	.byte 6 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009D51 11 27 06 CD 82 26        5 	.ascii "PWRADC"
      009D57 5C 20                    6 	.word power_adc 
      0020F1                       5645 	_dict_entry 5,PRINT,print 
      009D59 F4 5C                    1 	.word LINK 
                           0020F3     2 	LINK=.
      0020F3                          3 PRINT:
      009D5B A6                       4 	.byte 5 	
      009D5C 20 CD 82 26 92           5 	.ascii "PRINT"
      009D61 AF 00                    6 	.word print 
      0020FB                       5646 	_dict_entry,4+F_CONST,POUT,OUTP 
      009D63 11 90                    1 	.word LINK 
                           0020FD     2 	LINK=.
      0020FD                          3 POUT:
      009D65 95                       4 	.byte 4+F_CONST 	
      009D66 5C 92 AF 00              5 	.ascii "POUT"
      009D6A 11 5C                    6 	.word OUTP 
      002104                       5647 	_dict_entry,4,POKE,poke 
      009D6C 90 97                    1 	.word LINK 
                           002106     2 	LINK=.
      002106                          3 POKE:
      009D6E 90                       4 	.byte 4 	
      009D6F 89 72 FB 01              5 	.ascii "POKE"
      009D73 5C CD                    6 	.word poke 
      00210D                       5648 	_dict_entry,4+F_CONST,PINP,INP 
      009D75 9B 0D                    1 	.word LINK 
                           00210F     2 	LINK=.
      00210F                          3 PINP:
      009D77 85                       4 	.byte 4+F_CONST 	
      009D78 CD 8A 0D A6              5 	.ascii "PINP"
      009D7C 0D CD                    6 	.word INP 
      002116                       5649 	_dict_entry,4+F_IFUNC,PEEK,peek 
      009D7E 82 26                    1 	.word LINK 
                           002118     2 	LINK=.
      002118                          3 PEEK:
      009D80 1E                       4 	.byte 4+F_IFUNC 	
      009D81 01 5C 1F 01              5 	.ascii "PEEK"
      009D85 20 C0                    6 	.word peek 
      009D87                       5650 	_dict_entry,5,PMODE,pin_mode 
      009D87 1E 01                    1 	.word LINK 
                           002121     2 	LINK=.
      002121                          3 PMODE:
      009D89 CD                       4 	.byte 5 	
      009D8A 8A 0D AE 9D BC           5 	.ascii "PMODE"
      009D8F CD 82                    6 	.word pin_mode 
      002129                       5651 	_dict_entry,5,PAUSE,pause 
      009D91 38 A6                    1 	.word LINK 
                           00212B     2 	LINK=.
      00212B                          3 PAUSE:
      009D93 FF                       4 	.byte 5 	
      009D94 C0 00 16 C7 00           5 	.ascii "PAUSE"
      009D99 0A A6                    6 	.word pause 
      002133                       5652 	_dict_entry,2+F_IFUNC,OR,bit_or
      009D9B 7F C2                    1 	.word LINK 
                           002135     2 	LINK=.
      002135                          3 OR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009D9D 00                       4 	.byte 2+F_IFUNC 	
      009D9E 15 C7                    5 	.ascii "OR"
      009DA0 00 09                    6 	.word bit_or 
      00213A                       5653 	_dict_entry,3+F_CONST,ODR,GPIO_ODR
      009DA2 A6 02                    1 	.word LINK 
                           00213C     2 	LINK=.
      00213C                          3 ODR:
      009DA4 C2                       4 	.byte 3+F_CONST 	
      009DA5 00 14 C7                 5 	.ascii "ODR"
      009DA8 00 08                    6 	.word GPIO_ODR 
      002142                       5654 	_dict_entry,3,NEW,new
      009DAA 5F A6                    1 	.word LINK 
                           002144     2 	LINK=.
      002144                          3 NEW:
      009DAC 06                       4 	.byte 3 	
      009DAD 97 A6 0A                 5 	.ascii "NEW"
      009DB0 CD 89                    6 	.word new 
      00214A                       5655 	_dict_entry,4,NEXT,next 
      009DB2 C5 AE                    1 	.word LINK 
                           00214C     2 	LINK=.
      00214C                          3 NEXT:
      009DB4 9D                       4 	.byte 4 	
      009DB5 C4 CD 82 38              5 	.ascii "NEXT"
      009DB9 5B 02                    6 	.word next 
      002153                       5656 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      009DBB 81 20                    1 	.word LINK 
                           002155     2 	LINK=.
      002155                          3 LSHIFT:
      009DBD 66                       4 	.byte 6+F_IFUNC 	
      009DBE 69 6C 65 73 0A 00        5 	.ascii "LSHIFT"
      009DC4 20 62                    6 	.word lshift 
      00215E                       5657 	_dict_entry,4,LOAD,load 
      009DC6 79 74                    1 	.word LINK 
                           002160     2 	LINK=.
      002160                          3 LOAD:
      009DC8 65                       4 	.byte 4 	
      009DC9 73 20 66 72              5 	.ascii "LOAD"
      009DCD 65 65                    6 	.word load 
      002167                       5658 	_dict_entry 4,LIST,list
      009DCF 0A 00                    1 	.word LINK 
                           002169     2 	LINK=.
      009DD1                          3 LIST:
      009DD1 52                       4 	.byte 4 	
      009DD2 02 72 5F 00              5 	.ascii "LIST"
      009DD6 11 CD                    6 	.word list 
      002170                       5659 	_dict_entry 3,LET,let 
      009DD8 93 35                    1 	.word LINK 
                           002172     2 	LINK=.
      002172                          3 LET:
      009DDA A1                       4 	.byte 3 	
      009DDB 04 27 03                 5 	.ascii "LET"
      009DDE CC 87                    6 	.word let 
      002178                       5660 	_dict_entry,3+F_IFUNC,KEY,key 
      009DE0 94 1F                    1 	.word LINK 
                           00217A     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      00217A                          3 KEY:
      009DE2 01                       4 	.byte 3+F_IFUNC 	
      009DE3 CD 88 74                 5 	.ascii "KEY"
      009DE6 A1 0D                    6 	.word key 
      002180                       5661 	_dict_entry,5,INPUT,input_var  
      009DE8 27 02                    1 	.word LINK 
                           002182     2 	LINK=.
      002182                          3 INPUT:
      009DEA 20                       4 	.byte 5 	
      009DEB 19 CD 93 35 A1           5 	.ascii "INPUT"
      009DF0 04 27                    6 	.word input_var 
      00218A                       5662 	_dict_entry,2,IF,if 
      009DF2 03 CC                    1 	.word LINK 
                           00218C     2 	LINK=.
      00218C                          3 IF:
      009DF4 87                       4 	.byte 2 	
      009DF5 94 9F                    5 	.ascii "IF"
      009DF7 1E 01                    6 	.word if 
      002191                       5663 	_dict_entry,3+F_CONST,IDR,GPIO_IDR
      009DF9 CF 00                    1 	.word LINK 
                           002193     2 	LINK=.
      002193                          3 IDR:
      009DFB 12                       4 	.byte 3+F_CONST 	
      009DFC 5F CD 81                 5 	.ascii "IDR"
      009DFF 60 1E                    6 	.word GPIO_IDR 
      002199                       5664 	_dict_entry,3,HEX,hex_base
      009E01 01 5C                    1 	.word LINK 
                           00219B     2 	LINK=.
      00219B                          3 HEX:
      009E03 20                       4 	.byte 3 	
      009E04 DC 45 58                 5 	.ascii "HEX"
      009E05 13 60                    6 	.word hex_base 
      0021A1                       5665 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      009E05 5B 02                    1 	.word LINK 
                           0021A3     2 	LINK=.
      0021A3                          3 GPIO:
      009E07 81                       4 	.byte 4+F_IFUNC 	
      009E08 47 50 49 4F              5 	.ascii "GPIO"
      009E08 CD 92                    6 	.word gpio 
      0021AA                       5666 	_dict_entry,4,GOTO,goto 
      009E0A 57 A1                    1 	.word LINK 
                           0021AC     2 	LINK=.
      0021AC                          3 GOTO:
      009E0C 01                       4 	.byte 4 	
      009E0D 27 03 CC 87              5 	.ascii "GOTO"
      009E11 94 CD                    6 	.word goto 
      0021B3                       5667 	_dict_entry,5,GOSUB,gosub 
      009E13 90 13                    1 	.word LINK 
                           0021B5     2 	LINK=.
      0021B5                          3 GOSUB:
      009E15 9F                       4 	.byte 5 	
      009E16 A4 7F 97 A6 03           5 	.ascii "GOSUB"
      009E1B 81 D8                    6 	.word gosub 
      009E1C                       5668 	_dict_entry,6,FORGET,forget 
      009E1C CD 92                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



                           0021BF     2 	LINK=.
      0021BF                          3 FORGET:
      009E1E 57                       4 	.byte 6 	
      009E1F CD 88 74 A1 0A 27        5 	.ascii "FORGET"
      009E25 07 A1                    6 	.word forget 
      0021C8                       5669 	_dict_entry,3,FOR,for 
      009E27 03 27                    1 	.word LINK 
                           0021CA     2 	LINK=.
      0021CA                          3 FOR:
      009E29 06                       4 	.byte 3 	
      009E2A CC 87 94                 5 	.ascii "FOR"
      009E2D 17 DA                    6 	.word for 
      0021D0                       5670 	_dict_entry,4,FCPU,fcpu 
      009E2D F6 20                    1 	.word LINK 
                           0021D2     2 	LINK=.
      0021D2                          3 FCPU:
      009E2F 01                       4 	.byte 4 	
      009E30 46 43 50 55              5 	.ascii "FCPU"
      009E30 9F 97                    6 	.word fcpu 
      0021D9                       5671 	_dict_entry,6+F_CONST,EEPROM,EEPROM_BASE  
      009E32 4F 95                    1 	.word LINK 
                           0021DB     2 	LINK=.
      0021DB                          3 EEPROM:
      009E34 A6                       4 	.byte 6+F_CONST 	
      009E35 04 81 50 52 4F 4D        5 	.ascii "EEPROM"
      009E37 40 00                    6 	.word EEPROM_BASE 
      0021E4                       5672 	_dict_entry,3,DIR,directory 
      009E37 CD 82                    1 	.word LINK 
                           0021E6     2 	LINK=.
      0021E6                          3 DIR:
      009E39 2F                       4 	.byte 3 	
      009E3A 5F 97 A6                 5 	.ascii "DIR"
      009E3D 04 81                    6 	.word directory 
      009E3F                       5673 	_dict_entry,3,DEC,dec_base
      009E3F 5F 72                    1 	.word LINK 
                           0021EE     2 	LINK=.
      0021EE                          3 DEC:
      009E41 0B                       4 	.byte 3 	
      009E42 52 40 01                 5 	.ascii "DEC"
      009E45 5C A6                    6 	.word dec_base 
      0021F4                       5674 	_dict_entry,3+F_CONST,DDR,GPIO_DDR
      009E47 04 81                    1 	.word LINK 
                           0021F6     2 	LINK=.
      009E49                          3 DDR:
      009E49 CD                       4 	.byte 3+F_CONST 	
      009E4A 92 57 A1                 5 	.ascii "DDR"
      009E4D 02 27                    6 	.word GPIO_DDR 
      0021FC                       5675 	_dict_entry,3+F_CONST,CRL,GPIO_CR1
      009E4F 03 CC                    1 	.word LINK 
                           0021FE     2 	LINK=.
      0021FE                          3 CRL:
      009E51 87                       4 	.byte 3+F_CONST 	
      009E52 94 52 4C                 5 	.ascii "CRL"
      009E53 00 03                    6 	.word GPIO_CR1 
      002204                       5676 	_dict_entry,3+F_CONST,CRH,GPIO_CR2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009E53 AE 00                    1 	.word LINK 
                           002206     2 	LINK=.
      002206                          3 CRH:
      009E55 02                       4 	.byte 3+F_CONST 	
      009E56 72 DE 00                 5 	.ascii "CRH"
      009E59 17 2B                    6 	.word GPIO_CR2 
      00220C                       5677 	_dict_entry,4+F_CFUNC,CHAR,char
      009E5B 1B A3                    1 	.word LINK 
                           00220E     2 	LINK=.
      00220E                          3 CHAR:
      009E5D 00                       4 	.byte 4+F_CFUNC 	
      009E5E 09 2A 16 A6              5 	.ascii "CHAR"
      009E62 05 42                    6 	.word char 
      002215                       5678 	_dict_entry,3,BYE,bye 
      009E64 1C 50                    1 	.word LINK 
                           002217     2 	LINK=.
      002217                          3 BYE:
      009E66 00                       4 	.byte 3 	
      009E67 89 CD 90                 5 	.ascii "BYE"
      009E6A 13 72                    6 	.word bye 
      00221D                       5679 	_dict_entry,5,BTOGL,bit_toggle
      009E6C FB 01                    1 	.word LINK 
                           00221F     2 	LINK=.
      00221F                          3 BTOGL:
      009E6E 1F                       4 	.byte 5 	
      009E6F 01 CD 90 3A 85           5 	.ascii "BTOGL"
      009E74 A6 04                    6 	.word bit_toggle 
      002227                       5680 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      009E76 81 1F                    1 	.word LINK 
                           002229     2 	LINK=.
      009E77                          3 BTEST:
      009E77 A6                       4 	.byte 5+F_IFUNC 	
      009E78 0A CC 87 96 54           5 	.ascii "BTEST"
      009E7C 17 75                    6 	.word bit_test 
      002231                       5681 	_dict_entry,4,BSET,bit_set 
      009E7C AE A3                    1 	.word LINK 
                           002233     2 	LINK=.
      002233                          3 BSET:
      009E7E 00                       4 	.byte 4 	
      009E7F A6 04 81 54              5 	.ascii "BSET"
      009E82 17 38                    6 	.word bit_set 
      00223A                       5682 	_dict_entry,4,BRES,bit_reset
      009E82 90 89                    1 	.word LINK 
                           00223C     2 	LINK=.
      00223C                          3 BRES:
      009E84 CD                       4 	.byte 4 	
      009E85 92 57 A1 01              5 	.ascii "BRES"
      009E89 2A 03                    6 	.word bit_reset 
      002243                       5683 	_dict_entry,5,BREAK,break 
      009E8B CC 87                    1 	.word LINK 
                           002245     2 	LINK=.
      002245                          3 BREAK:
      009E8D 94                       4 	.byte 5 	
      009E8E 42 52 45 41 4B           5 	.ascii "BREAK"
      009E8E CD 90                    6 	.word break 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      00224D                       5684 	_dict_entry,4,BEEP,beep 
      009E90 13 A1                    1 	.word LINK 
                           00224F     2 	LINK=.
      00224F                          3 BEEP:
      009E92 02                       4 	.byte 4 	
      009E93 2B 05 90 93              5 	.ascii "BEEP"
      009E97 CD 90                    6 	.word beep 
      002256                       5685 	_dict_entry,3+F_IFUNC,ASC,ascii
      009E99 13 51                    1 	.word LINK 
                           002258     2 	LINK=.
      002258                          3 ASC:
      009E9B 90                       4 	.byte 3+F_IFUNC 	
      009E9C FD 90 85                 5 	.ascii "ASC"
      009E9F 81 9C                    6 	.word ascii 
      009EA0                       5686 	_dict_entry,6+F_IFUNC,ANREAD,analog_read
      009EA0 72 0D                    1 	.word LINK 
                           002260     2 	LINK=.
      002260                          3 ANREAD:
      009EA2 52                       4 	.byte 6+F_IFUNC 	
      009EA3 40 FB 8E CC 85 D4        5 	.ascii "ANREAD"
      009EA9 1A 00                    6 	.word analog_read 
      002269                       5687 	_dict_entry,3+F_IFUNC,AND,bit_and
      009EA9 72 0D                    1 	.word LINK 
                           00226B     2 	LINK=.
      00226B                          3 AND:
      009EAB 52                       4 	.byte 3+F_IFUNC 	
      009EAC 40 FB 72                 5 	.ascii "AND"
      009EAF 16 00                    6 	.word bit_and 
      002271                       5688 kword_dict:
      002271                       5689 	_dict_entry,3+F_IFUNC,ABS,abs
      009EB1 20 8E                    1 	.word LINK 
                           002273     2 	LINK=.
      002273                          3 ABS:
      009EB3 81                       4 	.byte 3+F_IFUNC 	
      009EB4 41 42 53                 5 	.ascii "ABS"
      009EB4 CD 93                    6 	.word abs 
                                   5690 	
                                   5691 
      002280                       5692 	.bndry 128 ; align on FLASH block.
                                   5693 ; free space for user application  
      002280                       5694 user_space:
                                   5695 ; USR() function test
      009EB6 35               [ 2] 5696 	pushw x 
      009EB7 A1 04 27 03      [ 1] 5697 	bset PC_ODR,#5 
      009EBB CC               [ 2] 5698 	popw x 
      009EBC 87 94 3E         [ 4] 5699 	call pause02 
      009EBE 72 1B 50 0A      [ 1] 5700 	bres PC_ODR,#5 
      009EBE 5D               [ 4] 5701 	ret
                                   5702 
                                   5703 	.area FLASH_DRIVE (ABS)
      010000                       5704 	.org 0x10000
      010000                       5705 fdrive:
                                   5706 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002273 R   |     ADC_CR1 =  005401 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        00226B R
  5 ANREAD     002260 R   |     ARG_CNT =  000001     |     ARG_OFS =  000002 
  5 ASC        002258 R   |     ATTRIB  =  000002     |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |     BASE    =  000002 
    BASE_SAV=  000001     |   5 BEEP       00224F R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_ER=  000000     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  000005 
  5 BREAK      002245 R   |   5 BRES       00223C R   |   5 BSET       002233 R
    BSIZE   =  000001     |     BSP     =  000008     |   5 BTEST      002229 R
  5 BTOGL      00221F R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        002217 R   |     C       =  000001     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000000     |   5 CHAR       00220E R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
    CLK_ECKR=  000001     |     CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0 
    CLK_ICKR=  000002     |     CLK_ICKR=  000000     |     CLK_ICKR=  000001 
    CLK_ICKR=  000003     |     CLK_ICKR=  000004     |     CLK_ICKR=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
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
  5 CRH        002206 R   |   5 CRL        0021FE R   |     CTRL_A  =  000001 
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
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        0021F6 R
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        0021EE R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        0021E6 R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
    DSTACK_S=  000040     |   5 EEPROM     0021DB R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |     EOF     =  0000FF 
    ERR_BAD_=  00000A     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_L=  000005     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |   5 FCPU       0021D2 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLSI    =  01F400 
  5 FOR        0021CA R   |   5 FORGET     0021BF R   |     FRUN    =  000000 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      0021B5 R   |     GOS_RET =  000003 
  5 GOTO       0021AC R   |   5 GPIO       0021A3 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  5 HEX        00219B R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        002193 R
  5 IF         00218C R   |     IN      =  000007     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      002182 R   |     INPUT_DI=  000000 
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
    INT_VECT=  008028     |     INT_VECT=  00802C     |     INT_VECT=  008010 
    INT_VECT=  008014     |     INT_VECT=  008018     |     INT_VECT=  00801C 
    INT_VECT=  008020     |     INT_VECT=  008024     |     INT_VECT=  008068 
    INT_VECT=  008054     |     INT_VECT=  008000     |     INT_VECT=  008030 
    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  008050     |     INT_VECT=  00804C     |     INT_VECT=  00805C 
    INT_VECT=  008058     |     INW     =  000003     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   5 KEY        00217A R   |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000005     |   5 LET        002172 R
    LINENO  =  000005     |   5 LINK    =  002273 R   |   5 LIST       002169 R
    LL      =  000002     |     LLEN    =  000002     |     LL_HB   =  000001 
    LNO     =  000005     |     LN_PTR  =  000005     |   5 LOAD       002160 R
  5 LSHIFT     002155 R   |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MINOR   =  000000     |     MULOP   =  000005 
    N1      =  000001     |     N1_HB   =  000006     |     N1_LB   =  000007 
    N2      =  000003     |     N2_HB   =  000008     |     N2_LB   =  000009 
    NAFR    =  004804     |     NAMEPTR =  000003     |     NCLKOPT =  004808 
    NEG     =  000001     |   5 NEW        002144 R   |   5 NEXT       00214C R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NL      =  00000A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000009 R   |   5 ODR        00213C R   |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |   5 OR         002135 R   |     OUTP    =  000001 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |     PAD_SIZE=  000028     |   5 PAUSE      00212B R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       002118 R   |     PE_BASE =  005014 
    PE_CR1  =  005017     |     PE_CR2  =  005018     |     PE_DDR  =  005016 
    PE_IDR  =  005015     |     PE_ODR  =  005014     |     PF      =  000019 
    PF_BASE =  005019     |     PF_CR1  =  00501C     |     PF_CR2  =  00501D 
    PF_DDR  =  00501B     |     PF_IDR  =  00501A     |     PF_ODR  =  005019 
    PG      =  00001E     |     PG_BASE =  00501E     |     PG_CR1  =  005021 
    PG_CR2  =  005022     |     PG_DDR  =  005020     |     PG_IDR  =  00501F 
    PG_ODR  =  00501E     |     PH      =  000023     |     PH_BASE =  005023 
    PH_CR1  =  005026     |     PH_CR2  =  005027     |     PH_DDR  =  005025 
    PH_IDR  =  005024     |     PH_ODR  =  005023     |     PI      =  000028 
    PINNO   =  000001     |   5 PINP       00210F R   |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      002121 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]

Symbol Table

  5 POKE       002106 R   |   5 POUT       0020FD R   |     PREV    =  000001 
  5 PRINT      0020F3 R   |     PROD    =  000002     |     PSIZE   =  000001 
  5 PWRADC     0020E8 R   |   5 QKEY       0020DF R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 REBOOT     0020D4 R
  5 REG_A      000937 R   |   5 REG_CC     00093B R   |   5 REG_EPC    00092A R
  5 REG_SP     000940 R   |   5 REG_X      000933 R   |   5 REG_Y      00092F R
    RELOP   =  000005     |   5 REMARK     0020C9 R   |     RETL1   =  000001 
  5 RETURN     0020BE R   |   5 RND        0020B6 R   |     ROP     =  004800 
  5 RSHIFT     0020AB R   |     RST_SR  =  0050B3     |   5 RUN        0020A3 R
    RXCHAR  =  000001     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   5 SAVE       00209A R
    SDIVD   =  000002     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       002091 R   |     SIGN    =  000001 
  5 SIZE       002088 R   |     SKIP    =  000006     |   5 SLEEP      00207E R
    SPACE   =  000020     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  000080     |   5 STATES     0008ED R   |   5 STEP       002075 R
  5 STOP       00206C R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      002062 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]

Symbol Table

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
    TK_VAR  =  000005     |   5 TO         00205B R   |   5 Timer4Up   000019 R
  5 TrapHand   00000A R   |     U8      =  000003     |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]

Symbol Table

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
    UBC     =  004801     |   5 UBOUND     002050 R   |   5 UFLASH     002045 R
  5 USER_ABO   00007E R   |   5 USR        00203D R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 UserButt   000025 R
    VSIZ    =  000002     |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       002034 R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      00202A R   |   5 WRITE      002020 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XADR    =  000001     |     XMASK   =  000001 
  5 XOR        002018 R   |     XSAVE   =  000003     |     YSAVE   =  000003 
  5 abs        001E4D R   |   1 acc16      000008 R   |   1 acc24      000007 R
  1 acc8       000009 R   |   5 accept_c   000AE1 R   |   5 add        001074 R
  5 analog_r   001A00 R   |   5 ansi_seq   000AA3 R   |   5 arduino_   001F52 R
  5 arg_list   0011B3 R   |   1 array_si   00001D R   |   5 ascii      001D9C R
  5 at_tst     000DAE R   |   5 atoi24     000EC1 R   |   5 atoi_exi   000F2F R
  5 bad_port   001DF7 R   |   1 base       000006 R   |   1 basicptr   000004 R
  5 beep       00198F R   |   5 bin_exit   000CB2 R   |   5 bit_and    001E63 R
  5 bit_or     001E81 R   |   5 bit_rese   00174C R   |   5 bit_set    001738 R
  5 bit_test   001775 R   |   5 bit_togg   001761 R   |   5 bit_xor    001E9F R
  5 bkslsh_t   000D59 R   |   5 bksp       0001C2 R   |   5 break      001A36 R
  5 break_po   001A64 R   |   5 bye        001E20 R   |   5 char       001D88 R
  5 check_fu   0003E5 R   |   5 clear_ba   0005E6 R   |   5 clear_va   0004EF R
  5 clock_in   000099 R   |   5 cmd_itf    000B05 R   |   5 cmd_name   00111F R
  5 cmp_name   001AD8 R   |   5 cold_sta   000554 R   |   5 colon_ts   000D82 R
  5 comma_ts   000D8D R   |   5 compile    0003F4 R   |   5 convert_   000C3A R
  1 count      000003 R   |   5 cp_loop    001162 R   |   5 create_g   000344 R
  5 cstk_pro   00103E R   |   5 dash_tst   000DA3 R   |   5 ddrop      000FBA R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]

Symbol Table

  5 ddrop_n    000FF7 R   |   5 ddup       000FC3 R   |   5 dec_base   001365 R
  5 del_back   000AD2 R   |   5 del_line   00030C R   |   5 del_ln     000AC3 R
  5 delete     0001D2 R   |   5 dir_loop   001CC7 R   |   5 director   001CBB R
  5 divide     0010CA R   |   5 divu24_8   000A30 R   |   5 dotr       001047 R
  5 dotr_loo   00105C R   |   5 dots       001014 R   |   5 dpick      000FD4 R
  5 dpop       000F93 R   |   5 dpush      000F86 R   |   5 drive_fr   001D44 R
  3 dstack     001740 R   |   3 dstack_u   001780 R   |   5 dstk_pro   00100A R
  1 dstkptr    000016 R   |   5 dswap      000FA0 R   |   5 eql_tst    000E0E R
  5 equal      0015F5 R   |   5 err_bad_   0006C3 R   |   5 err_cmd_   000684 R
  5 err_div0   000646 R   |   5 err_dupl   00069F R   |   5 err_math   00062C R
  5 err_mem_   00060F R   |   5 err_msg    0005F7 R   |   5 err_no_a   0006D0 R
  5 err_no_l   000656 R   |   5 err_not_   0006B1 R   |   5 err_run_   00066D R
  5 err_synt   00061D R   |   5 escaped    000C4F R   |   5 expect     0011A6 R
  5 expr_exi   0012F6 R   |   5 expressi   0012B5 R   |   5 factor     00120E R
  1 farptr     000010 R   |   5 fcpu       001EF7 R   |   7 fdrive     010000 R
  5 fetch      000FE3 R   |   5 fetchc     000BF2 R   |   1 ffree      000013 R
  5 file_cou   001D3C R   |   5 final_te   000A9D R   |   5 first_li   0013E9 R
  1 flags      00001F R   |   5 for        0017DA R   |   5 forget     001C70 R
  1 free_ram   000055 R   |   5 func_arg   0011D7 R   |   5 ge         0015F7 R
  5 get_arra   0011E7 R   |   5 get_tick   001E47 R   |   5 get_toke   000CF4 R
  5 getc       0001AF R   |   5 go_commo   0018FB R   |   5 gosub      0018D8 R
  5 goto       0018CB R   |   5 gpio       001DC9 R   |   5 gt         0015F3 R
  5 gt_tst     000E19 R   |   5 hex_base   001360 R   |   5 hse_cloc   00018F R
  5 hsi_cloc   000199 R   |   5 if         0017C6 R   |   1 in         000001 R
  1 in.saved   000002 R   |   1 in.w       000000 R   |   5 incr_far   001A8D R
  5 input_ex   001704 R   |   5 input_lo   00169F R   |   5 input_va   001693 R
  5 insert_l   00037D R   |   5 insert_l   0003E2 R   |   5 interp     000784 R
  5 interp_l   0007C4 R   |   5 invalid    000B4A R   |   5 invalid_   000BC8 R
  5 is_alpha   0004FD R   |   5 is_digit   000EAC R   |   5 itoa       0009E9 R
  5 itoa_loo   000A01 R   |   5 key        001DB7 R   |   5 kword_di   002271 R
  5 kword_en   002016 R   |   5 last_lin   0013F2 R   |   5 le         0015FC R
  5 ledoff     00083D R   |   5 ledon      000838 R   |   5 ledtoggl   000842 R
  5 left_arr   000AA3 R   |   5 left_par   00084B R   |   5 let        001396 R
  5 let02      0013A0 R   |   5 lines_sk   0013F7 R   |   5 list       0013BE R
  5 list_exi   00143E R   |   5 list_sta   00141A R   |   5 load       001C08 R
  5 loop_bac   0018A4 R   |   1 loop_dep   00001C R   |   5 loop_don   0018B9 R
  5 lshift     001EBD R   |   5 lt         0015FA R   |   5 lt_tst     000E52 R
  5 mem_peek   000B67 R   |   5 modulo     00110E R   |   5 move       0002A6 R
  5 move_dow   0002C4 R   |   5 move_exi   0002E5 R   |   5 move_loo   0002C9 R
  5 move_up    0002B6 R   |   5 mul_char   0015E4 R   |   5 multiply   001082 R
  5 mulu24_8   000F33 R   |   5 nbr_tst    000D2F R   |   5 ne         0015FF R
  5 neg_acc2   000A58 R   |   5 new        001A82 R   |   5 next       00185C R
  5 next_tok   0007F4 R   |   5 no_match   001174 R   |   5 none       000CF4 R
  5 number     000BF8 GR  |   5 other      000E8A R   |   3 pad        001718 R
  5 parse_bi   000C92 R   |   5 parse_in   000C57 R   |   5 parse_ke   000CBA R
  5 parse_qu   000BFF R   |   5 pause      001E34 R   |   5 pause02    001E3E R
  5 peek       0017B3 R   |   5 peek_byt   000B92 R   |   5 pin_mode   001F03 R
  5 plus_tst   000DE2 R   |   5 poke       0017A0 R   |   5 power_ad   0019B7 R
  5 prcnt_ts   000E03 R   |   5 print      001602 R   |   5 print_ex   001667 R
  5 print_fa   000BD7 R   |   5 print_in   00098D R   |   5 print_re   00089A R
  5 print_st   000B5A R   |   5 prt_basi   001491 R   |   5 prt_cmd_   001441 R
  5 prt_loop   001606 R   |   5 prt_peek   000256 R   |   5 prt_quot   001455 R
  5 prt_reg1   00087B R   |   5 prt_reg8   000856 R   |   5 prt_regs   0001EC R
  5 prti24     000945 R   |   1 ptr16      000011 R   |   1 ptr8       000012 R
  5 putc       0001A6 R   |   5 puts       0001B8 R   |   5 qkey       001DBF R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]

Symbol Table

  5 qmark_ts   000DB9 R   |   5 random     001F72 R   |   5 readln     000A7B R
  5 readln_l   000A81 R   |   5 readln_q   000AF6 R   |   5 regs_sta   00022F R
  5 rel_exit   00134D R   |   5 relation   0012F9 R   |   5 relop_st   0015E7 R
  5 rem        001707 R   |   5 repl       000B13 R   |   5 repl_exi   000B3B R
  5 reprint    000AA3 R   |   5 reset_co   001604 R   |   5 rest_con   001683 R
  5 return     00191D R   |   5 right_ar   000AA3 R   |   5 rparnt_t   000D77 R
  5 rshift     001EDA R   |   5 rt_msg     000704 R   |   5 run        00193D R
  5 save       001B44 R   |   5 save_con   001673 R   |   5 search_d   001151 R
  5 search_e   0011A2 R   |   5 search_f   001AF9 R   |   5 search_l   0002E8 R
  5 search_l   0002F0 R   |   5 search_n   001155 R   |   1 seedx      00000C R
  1 seedy      00000E R   |   5 seek_fdr   001A9B R   |   5 sharp_ts   000D98 R
  5 show       001350 R   |   5 single_c   0015E0 R   |   5 size       00136A R
  5 skip       000F6D R   |   5 slash_ts   000DF8 R   |   5 sleep      001E29 R
  5 software   00050E R   |   5 spaces     0001E0 R   |   3 stack_fu   001780 R
  3 stack_un   001800 R   |   5 star_tst   000DED R   |   5 step       001834 R
  5 stop       001980 R   |   5 store      000FED R   |   5 store_lo   001846 R
  5 str_matc   001183 R   |   5 str_tst    000D1E R   |   5 strcmp     000287 R
  5 strcpy     000298 R   |   5 strlen     00027A R   |   5 substrac   00107C R
  5 syntax_e   000714 R   |   1 tab_widt   000020 R   |   5 tb_error   000716 R
  5 term       001268 R   |   5 term01     001271 R   |   5 term_exi   0012B2 R
  5 test_p     000B52 R   |   3 tib        0016C8 R   |   5 tick_tst   000DD0 R
  1 ticks      00000A R   |   5 timer4_i   0000AF R   |   5 to         001804 R
  5 to_upper   000EB5 GR  |   5 token_ch   000E99 R   |   5 token_ex   000EA9 R
  1 txtbgn     000018 R   |   1 txtend     00001A R   |   5 uart3_in   000178 R
  5 uart3_se   000188 R   |   5 uart_ena   0001A1 R   |   5 ubound     001374 R
  5 uflash     001DFC R   |   5 unget_to   000F80 R   |   5 unlock_e   0000C4 R
  5 unlock_f   0000D2 R   |   5 user_spa   002280 R   |   5 usr        001E02 R
  1 vars       000021 R   |   5 wait       00170D R   |   5 warm_sta   000768 R
  5 words      001FDC R   |   5 write      001D51 R   |   5 write_bl   000155 R
  5 write_by   0000E0 R   |   5 write_ee   00011C R   |   5 write_ex   000150 R
  5 write_fl   000106 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     55   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   228E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

