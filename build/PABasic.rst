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
      0081F2 CD 9B 80         [ 4]  452 	call incr_farptr
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
      0084C3 A3 17 09         [ 2] 1056 	cpw x,#rem 
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
      00850F A3 97 89 26      [ 1] 1089 	mov in,#3 
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
             8E 72 1A 50 0D 72 1A
             50 0E
      00864A 72 1A 50 0C 9A 72 5C  1228 err_run_only: .asciz "\nrun time only usage.\n" 
             00 10 72 5C 00 0E CD
             86 66 CD 93 F6 CD 90
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
      0087CD CD 95 13 AE      [ 1] 1380     bset PC_ODR,#LED2_BIT
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
      00885A 94 22 20         [ 4] 1485 	call prt_reg8 
                                   1486 ; print SP 
      00885D E6 09 40         [ 2] 1487 	ldw x,#REG_SP
      00885E 90 96            [ 1] 1488 	ldw y,sp 
      00885E A1 02 26 08      [ 2] 1489 	addw y,#12
      008862 CD 92 67         [ 4] 1490 	call prt_reg16  
      008865 CD 94            [ 1] 1491 	ld a,#'\n' 
      008867 22 20 DA         [ 4] 1492 	call putc
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
      008C9E E5 17 09         [ 2] 2299 	ldw x,#rem 
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
      008D67 AE A3            [ 1] 2421 	cp a,#'a
      008D69 81 CD            [ 1] 2422 	jrpl 1$
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
      008E4C 84 CC 8F 29      [ 5] 2639 	ldw x,[dstkptr]
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
      008E5D 97 89 CC 8F      [ 5] 2651 	ldw x,[dstkptr]
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
      00908F 63               [ 2] 3227 	pushw x 
      009090 6B 3A            [ 1] 3228 	ld a,#TK_RPAREN 
      009092 20 00 A6         [ 4] 3229 	call expect
      009094 85               [ 2] 3230 	popw x 
      009094 52 02            [ 2] 3231 	jra 18$	
      001258                       3232 16$:
      009096 AE 90 8A         [ 4] 3233 	call unget_token
      009099 CD               [ 1] 3234 	clr a 
      00909A 82 38            [ 2] 3235 	jra 20$ 
      00125E                       3236 18$: 
      00909C AE 17            [ 1] 3237 	ld a,#TK_MINUS 
      00909E 7E 35            [ 1] 3238 	cp a,(NEG,sp)
      0090A0 0A 00            [ 1] 3239 	jrne 19$
      0090A2 07               [ 2] 3240 	negw x
      001265                       3241 19$:
      0090A3 C3 00            [ 1] 3242 	ld a,#TK_INTGR
      001267                       3243 20$:
      001267                       3244 	_drop VSIZE
      0090A5 17 25            [ 2]    1     addw sp,#VSIZE 
      0090A7 0D               [ 4] 3245 	ret
                                   3246 
                                   3247 ;-----------------------------------
                                   3248 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3249 ; output:
                                   3250 ;   A    	token attribute 
                                   3251 ;	X		integer
                                   3252 ;-----------------------------------
                           000001  3253 	N1=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                           000003  3254 	N2=3
                           000005  3255 	MULOP=5
                           000005  3256 	VSIZE=5
      00126A                       3257 term:
      00126A                       3258 	_vars VSIZE
      0090A8 1F 01            [ 2]    1     sub sp,#VSIZE 
      0090AA FE CD 8A         [ 4] 3259 	call factor
      0090AD 0D 1E            [ 1] 3260 	cp a,#CMD_END
      0090AF 01 1D            [ 1] 3261 	jrmi term_exit
      001273                       3262 term01:	 ; check for  operator 
      0090B1 00 02            [ 2] 3263 	ldw (N2,sp),x  ; save first factor 
      0090B3 20 EE A6         [ 4] 3264 	call next_token
      0090B6 0D CD            [ 1] 3265 	cp a,#2
      0090B8 82 26            [ 1] 3266 	jrmi 9$
      0090BA 5B 02            [ 1] 3267 0$:	ld (MULOP,sp),a
      0090BC 4F 81            [ 1] 3268 	and a,#TK_GRP_MASK
      0090BE 0A 63            [ 1] 3269 	cp a,#TK_GRP_MULT
      0090C0 74 61            [ 1] 3270 	jreq 1$
      0090C2 63 6B            [ 1] 3271 	ld a,(MULOP,sp) 
      0090C4 3A 20 00         [ 4] 3272 	call unget_token 
      0090C7 20 25            [ 2] 3273 	jra 9$
      00128B                       3274 1$:	; got *|/|%
      0090C7 52 02 AE         [ 4] 3275 	call factor
      0090CA 90 BE            [ 1] 3276 	cp a,#TK_INTGR
      0090CC CD 82            [ 1] 3277 	jreq 2$ 
      0090CE 38 96 1C         [ 2] 3278 	jp syntax_error
      0090D1 00 07            [ 2] 3279 2$:	ldw (N1,sp),x  
      0090D3 1F 01            [ 1] 3280 	ld a,(MULOP,sp) 
      0090D5 AE 17            [ 1] 3281 	cp a,#TK_MULT 
      0090D7 FE 35            [ 1] 3282 	jrne 3$
      0090D9 10 00 07         [ 4] 3283 	call multiply 
      0090DC 20 D1            [ 2] 3284 	jra term01
      0090DC 13 01            [ 1] 3285 3$: cp a,#TK_DIV 
      0090DE 2B 0B            [ 1] 3286 	jrne 4$ 
      0090E0 89 FE CD         [ 4] 3287 	call divide 
      0090E3 8A 0D            [ 2] 3288 	jra term01 
      0090E5 85 1D 00         [ 4] 3289 4$: call modulo
      0090E8 02 20            [ 2] 3290 	jra term01 
      0090EA F1 A6            [ 2] 3291 9$: ldw x,(N2,sp)  
      0090EC 0D CD            [ 1] 3292 	ld a,#TK_INTGR 	
      0012B4                       3293 term_exit:
      0012B4                       3294 	_drop VSIZE 
      0090EE 82 26            [ 2]    1     addw sp,#VSIZE 
      0090F0 5B               [ 4] 3295 	ret 
                                   3296 
                                   3297 ;-------------------------------
                                   3298 ;  expr ::= term [['+'|'-'] term]*
                                   3299 ;  result range {-32768..32767}
                                   3300 ;  output:
                                   3301 ;   A    token attribute 
                                   3302 ;   X	 integer   
                                   3303 ;-------------------------------
                           000001  3304 	N1=1 
                           000003  3305 	N2=3
                           000005  3306 	OP=5 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                           000005  3307 	VSIZE=5 
      0012B7                       3308 expression:
      0012B7                       3309 	_vars VSIZE 
      0090F1 02 4F            [ 2]    1     sub sp,#VSIZE 
      0090F3 81 12 6A         [ 4] 3310 	call term
      0090F4 A1 02            [ 1] 3311 	cp a,#CMD_END 
      0090F4 1E 05            [ 1] 3312 	jrmi expr_exit 
      0090F6 72 FB            [ 2] 3313 0$:	ldw (N2,sp),x 
      0090F8 03 1F 03         [ 4] 3314 	call next_token
      0090FB 81 02            [ 1] 3315 	cp a,#2
      0090FC 2B 2B            [ 1] 3316 	jrmi 9$ 
      0090FC 1E 05            [ 1] 3317 1$:	ld (OP,sp),a  
      0090FE 72 F0            [ 1] 3318 	and a,#TK_GRP_MASK
      009100 03 81            [ 1] 3319 	cp a,#TK_GRP_ADD 
      009102 27 07            [ 1] 3320 	jreq 2$ 
      009102 52 03            [ 1] 3321 	ld a,(OP,sp)
      009104 0F 01 1E         [ 4] 3322 	call unget_token
      009107 06 9E            [ 2] 3323 	jra 9$
      0012D8                       3324 2$: 
      009109 A5 80 27         [ 4] 3325 	call term
      00910C 05 03            [ 1] 3326 	cp a,#TK_INTGR 
      00910E 01 50            [ 1] 3327 	jreq 3$
      009110 1F 06 1E         [ 2] 3328 	jp syntax_error
      009113 08 9E            [ 2] 3329 3$:	ldw (N1,sp),x 
      009115 A5 80            [ 1] 3330 	ld a,(OP,sp)
      009117 27 05            [ 1] 3331 	cp a,#TK_PLUS 
      009119 03 01            [ 1] 3332 	jrne 4$
      00911B 50 1F 08         [ 4] 3333 	call add 
      00911E 7B 07            [ 2] 3334 	jra 0$ 
      009120 97 7B 09         [ 4] 3335 4$:	call substract
      009123 42 1F            [ 2] 3336 	jra 0$
      009125 02 7B            [ 2] 3337 9$: ldw x,(N2,sp)
      009127 07 97            [ 1] 3338 	ld a,#TK_INTGR	
      0012F8                       3339 expr_exit:
      0012F8                       3340 	_drop VSIZE 
      009129 7B 08            [ 2]    1     addw sp,#VSIZE 
      00912B 42               [ 4] 3341 	ret 
                                   3342 
                                   3343 ;---------------------------------------------
                                   3344 ; rel ::= expr rel_op expr
                                   3345 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3346 ;  relation return 1 | 0  for true | false 
                                   3347 ;  output:
                                   3348 ;    A 		token attribute  
                                   3349 ;	 X		1|0
                                   3350 ;---------------------------------------------
                           000001  3351 	N1=1
                           000003  3352 	N2=3
                           000005  3353 	RELOP=5
                           000005  3354 	VSIZE=5 
      0012FB                       3355 relation: 
      0012FB                       3356 	_vars VSIZE
      00912C 9F 1B            [ 2]    1     sub sp,#VSIZE 
      00912E 02 6B 02         [ 4] 3357 	call expression
      009131 7B 06            [ 1] 3358 	cp a,#CMD_END  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009133 97 7B            [ 1] 3359 	jrmi rel_exit 
                                   3360 	; expect rel_op or leave 
      009135 09 42            [ 2] 3361 	ldw (N2,sp),x 
      009137 9F 1B 02         [ 4] 3362 	call next_token 
      00913A 6B 02            [ 1] 3363 	cp a,#2
      00913C 0D 01            [ 1] 3364 	jrmi 9$
      00130D                       3365 1$:	
      00913E 27 05            [ 1] 3366 	ld (RELOP,sp),a 
      009140 1E 02            [ 1] 3367 	and a,#TK_GRP_MASK
      009142 50 1F            [ 1] 3368 	cp a,#TK_GRP_RELOP 
      009144 02 07            [ 1] 3369 	jreq 2$
      009145 7B 05            [ 1] 3370 	ld a,(RELOP,sp)
      009145 1E 02 5B         [ 4] 3371 	call unget_token  
      009148 03 81            [ 2] 3372 	jra 9$
      00914A                       3373 2$:	; expect another expression or error 
      00914A 52 02 0F         [ 4] 3374 	call expression
      00914D 01 0F            [ 1] 3375 	cp a,#TK_INTGR 
      00914F 02 1E            [ 1] 3376 	jreq 3$
      009151 05 5D 26         [ 2] 3377 	jp syntax_error 
      009154 05 A6            [ 2] 3378 3$:	ldw (N1,sp),x 
      009156 04 CC 87         [ 4] 3379 	call substract
      009159 96 9E            [ 1] 3380 	jrne 4$
      00915B A5 80 27 03      [ 1] 3381 	mov acc8,#2 ; n1==n2
      00915F 03 01            [ 2] 3382 	jra 6$ 
      001333                       3383 4$: 
      009161 50 1F            [ 1] 3384 	jrsgt 5$  
      009163 05 1E 07 9E      [ 1] 3385 	mov acc8,#4 ; n1<2 
      009167 A5 80            [ 2] 3386 	jra 6$
      00133B                       3387 5$:
      009169 27 05 03 01      [ 1] 3388 	mov acc8,#1 ; n1>n2 
      00133F                       3389 6$:
      00916D 03               [ 1] 3390 	clrw x 
      00916E 02 50 16         [ 1] 3391 	ld a, acc8  
      009171 05 65            [ 1] 3392 	and a,(RELOP,sp)
      009173 90               [ 1] 3393 	tnz a 
      009174 CF 00            [ 1] 3394 	jreq 10$
      009176 09               [ 1] 3395 	incw x 
      001349                       3396 7$:	 
      009177 0D 02            [ 2] 3397 	jra 10$  	
      009179 27 0B            [ 2] 3398 9$: ldw x,(N2,sp)
      00134D                       3399 10$:
      00917B 90 5D            [ 1] 3400 	ld a,#TK_INTGR
      00134F                       3401 rel_exit: 	 
      00134F                       3402 	_drop VSIZE
      00917D 27 07            [ 2]    1     addw sp,#VSIZE 
      00917F 5C               [ 4] 3403 	ret 
                                   3404 
                                   3405 ;--------------------------------
                                   3406 ; BASIC: SHOW 
                                   3407 ;  show content of dstack,cstack
                                   3408 ;--------------------------------
      001352                       3409 show:
      009180 16 05 72         [ 1] 3410 	ld a,base 
      009183 B2               [ 1] 3411 	push a 
      009184 00 09 0D         [ 4] 3412 	call dots
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009187 01 27 01         [ 4] 3413 	call dotr 
      00918A 50               [ 1] 3414 	pop a 
      00918B C7 00 06         [ 1] 3415 	ld base,a 
      00918B 5B               [ 1] 3416 	clr a 
      00918C 02               [ 4] 3417 	ret
                                   3418 
                                   3419 ;--------------------------------------------
                                   3420 ; BASIC: HEX 
                                   3421 ; select hexadecimal base for integer print
                                   3422 ;---------------------------------------------
      001362                       3423 hex_base:
      00918D 81 10 00 06      [ 1] 3424 	mov base,#16 
      00918E 81               [ 4] 3425 	ret 
                                   3426 
                                   3427 ;--------------------------------------------
                                   3428 ; BASIC: DEC 
                                   3429 ; select decimal base for integer print
                                   3430 ;---------------------------------------------
      001367                       3431 dec_base:
      00918E 1E 03 16 05      [ 1] 3432 	mov base,#10
      009192 52               [ 4] 3433 	ret 
                                   3434 
                                   3435 ;------------------------
                                   3436 ; BASIC: SIZE 
                                   3437 ; return free size in text area
                                   3438 ; output:
                                   3439 ;   A 		TK_INTGR
                                   3440 ;   X 	    size integer
                                   3441 ;--------------------------
      00136C                       3442 size:
      009193 04 1F 01         [ 2] 3443 	ldw x,#tib 
      009196 17 03 CD 91      [ 2] 3444 	subw x,txtend 
      00919A 4A 93            [ 1] 3445 	ld a,#TK_INTGR
      00919C 5B               [ 4] 3446 	ret 
                                   3447 
                                   3448 
                                   3449 ;------------------------
                                   3450 ; BASIC: UBOUND  
                                   3451 ; return array variable size 
                                   3452 ; output:
                                   3453 ;   A 		TK_INTGR
                                   3454 ;   X 	    array size 
                                   3455 ;--------------------------
      001376                       3456 ubound:
      00919D 04 81 C8         [ 2] 3457 	ldw x,#tib
      00919F 72 B0 00 1A      [ 2] 3458 	subw x,txtend 
      00919F 52 04 72 5F      [ 2] 3459 	ldw y,basicptr 
      0091A3 00 09 1F 01      [ 2] 3460 	cpw y,txtend 
      0091A7 AE A3            [ 1] 3461 	jrult 1$
      0091A9 7F 1F 03         [ 1] 3462 	push count 
      0091AC E6 02            [ 1] 3463 	push #0 
      0091AE A4 0F C7         [ 2] 3464 	subw x,(1,sp)
      00138F                       3465 	_drop 2 
      0091B1 00 0A            [ 2]    1     addw sp,#2 
      0091B3 1C               [ 2] 3466 1$:	srlw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0091B4 00 03 72         [ 2] 3467 	ldw array_size,x
      0091B7 BB 00            [ 1] 3468 	ld a,#TK_INTGR
      0091B9 09               [ 4] 3469 	ret 
                                   3470 
                                   3471 ;-----------------------------
                                   3472 ; BASIC: LET var=expr 
                                   3473 ; variable assignement 
                                   3474 ; output:
                                   3475 ;   A 		TK_NONE 
                                   3476 ;-----------------------------
      001398                       3477 let:
      0091BA FE 13 01         [ 4] 3478 	call next_token 
      0091BD 27 0A            [ 1] 3479 	cp a,#TK_VAR 
      0091BF 1E 03            [ 1] 3480 	jreq let02
      0091C1 FE 1D 00         [ 2] 3481 	jp syntax_error
      0013A2                       3482 let02:
      0091C4 02 26 E3         [ 4] 3483 	call dpush 
      0091C7 20 05 1E         [ 4] 3484 	call next_token 
      0091CA 03 1C            [ 1] 3485 	cp a,#TK_EQUAL
      0091CC 00 02            [ 1] 3486 	jreq 1$
      0091CE 5B 04 81         [ 2] 3487 	jp syntax_error
      0091D1                       3488 1$:	
      0091D1 52 03 90         [ 4] 3489 	call relation   
      0091D4 93 04            [ 1] 3490 	cp a,#TK_INTGR 
      0091D5 27 03            [ 1] 3491 	jreq 2$
      0091D5 90 F6 A4         [ 2] 3492 	jp syntax_error
      0013B9                       3493 2$:	
      0091D8 0F 6B            [ 1] 3494 	ldw y,x 
      0091DA 01 AE 17         [ 4] 3495 	call dpop  
      0091DD 18               [ 2] 3496 	ldw (x),y   
      0091DE 17               [ 4] 3497 	ret 
                                   3498 
                                   3499 ;----------------------------
                                   3500 ; BASIC: LIST [[start][,end]]
                                   3501 ; list program lines 
                                   3502 ; form start to end 
                                   3503 ; if empty argument list then 
                                   3504 ; list all.
                                   3505 ;----------------------------
                           000001  3506 	FIRST=1
                           000003  3507 	LAST=3 
                           000005  3508 	LN_PTR=5
                           000006  3509 	VSIZE=6 
      0013C0                       3510 list:
      0013C0                       3511 	_vars VSIZE
      0091DF 02 90            [ 2]    1     sub sp,#VSIZE 
      0091E1 5C 00 18         [ 2] 3512 	ldw x,txtbgn 
      0091E2 C3 00 1A         [ 2] 3513 	cpw x,txtend 
      0091E2 F6 27            [ 1] 3514 	jrmi 1$
      0091E4 1E 0D 01         [ 2] 3515 	jp list_exit ; nothing to list 
      0091E7 27 0B            [ 2] 3516 1$:	ldw (LN_PTR,sp),x 
      0091E9 90               [ 2] 3517 	ldw x,(x) 
      0091EA F1 26            [ 2] 3518 	ldw (FIRST,sp),x ; list from first line 
      0091EC 07 90 5C         [ 2] 3519 	ldw x,#0x7fff ; biggest line number 
      0091EF 5C 0A            [ 2] 3520 	ldw (LAST,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0091F1 01 20 EE         [ 4] 3521 	call arg_list
      0091F4 4D               [ 1] 3522 	tnz a
      0091F4 16 02            [ 1] 3523 	jreq list_start 
      0091F6 72 A2            [ 1] 3524 	cp a,#2 
      0091F8 00 02            [ 1] 3525 	jreq 4$
      0091FA 4B 00            [ 1] 3526 	cp a,#1 
      0091FC 90 FE            [ 1] 3527 	jreq first_line 
      0091FE 84 27 21         [ 2] 3528 	jp syntax_error 
      009201 20 D2 A0         [ 4] 3529 4$:	call dswap
      009203                       3530 first_line:
      009203 16 02 90         [ 4] 3531 	call dpop 
      009206 F6 6B            [ 2] 3532 	ldw (FIRST,sp),x 
      009208 01 A4            [ 1] 3533 	cp a,#1 
      00920A 0F 4C            [ 1] 3534 	jreq lines_skip 	
      0013F4                       3535 last_line:
      00920C C7 00 0A         [ 4] 3536 	call dpop 
      00920F 72 5F            [ 2] 3537 	ldw (LAST,sp),x 
      0013F9                       3538 lines_skip:
      009211 00 09 72         [ 2] 3539 	ldw x,txtbgn
      009214 B9 00            [ 2] 3540 2$:	ldw (LN_PTR,sp),x 
      009216 09 90 FE         [ 2] 3541 	cpw x,txtend 
      009219 7B 01            [ 1] 3542 	jrpl list_exit 
      00921B 4E               [ 2] 3543 	ldw x,(x) ;line# 
      00921C A4 0C            [ 2] 3544 	cpw x,(FIRST,sp)
      00921E 44 44            [ 1] 3545 	jrpl list_start 
      009220 AB 06            [ 2] 3546 	ldw x,(LN_PTR,sp) 
      009222 1C 00 02         [ 2] 3547 	addw x,#2 
      009222 93               [ 1] 3548 	ld a,(x)
      009223 5B               [ 1] 3549 	incw x 
      009224 03 81 09         [ 1] 3550 	ld acc8,a 
      009226 72 5F 00 08      [ 1] 3551 	clr acc16 
      009226 88 CD 88 74      [ 2] 3552 	addw x,acc16
      00922A 11 01            [ 2] 3553 	jra 2$ 
                                   3554 ; print loop
      00141C                       3555 list_start:
      00922C 27 03            [ 2] 3556 	ldw x,(LN_PTR,sp)
      00141E                       3557 3$:	
      00922E CC 87 94         [ 4] 3558 	call prt_basic_line
      009231 84 81            [ 2] 3559 	ldw x,(LN_PTR,sp)
      009233 E6 02            [ 1] 3560 	ld a,(2,x)
      009233 4B 00 CD         [ 1] 3561 	ld acc8,a 
      009236 93 7B A1 00      [ 1] 3562 	clr acc16 
      00923A 27 19 A1 04      [ 2] 3563 	addw x,acc16
      00923E 26 12 CD         [ 2] 3564 	cpw x,txtend 
      009241 90 06            [ 1] 3565 	jrpl list_exit
      009243 0C 01            [ 2] 3566 	ldw (LN_PTR,sp),x
      009245 CD               [ 2] 3567 	ldw x,(x)
      009246 88 74            [ 2] 3568 	cpw x,(LAST,sp)  
      009248 A1 00            [ 1] 3569 	jrsgt list_exit 
      00924A 27 09            [ 2] 3570 	ldw x,(LN_PTR,sp)
      00924C A1 0D            [ 2] 3571 	jra 3$
      001440                       3572 list_exit:
      001440                       3573 	_drop VSIZE 
      00924E 26 02            [ 2]    1     addw sp,#VSIZE 
      009250 20               [ 4] 3574 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3575 
                                   3576 ;-------------------------
                                   3577 ; print counted string 
                                   3578 ; input:
                                   3579 ;   X 		address of string
                                   3580 ;--------------------------
      001443                       3581 prt_cmd_name:
      009251 E3               [ 1] 3582 	ld a,(x)
      009252 CD               [ 1] 3583 	incw x
      009253 90 00            [ 1] 3584 	and a,#15  
      009255 84               [ 1] 3585 	push a 
      009256 81 01            [ 1] 3586 1$: tnz (1,sp) 
      009257 27 09            [ 1] 3587 	jreq 9$
      009257 A6               [ 1] 3588 	ld a,(x)
      009258 0B CD 92         [ 4] 3589 	call putc 
      00925B 26               [ 1] 3590 	incw x
      00925C CD 92            [ 1] 3591 	dec (1,sp)	 
      00925E 33 88            [ 2] 3592 	jra 1$
      009260 A6               [ 1] 3593 9$: pop a 
      009261 0C               [ 4] 3594 	ret	
                                   3595 
                                   3596 ;--------------------------
                                   3597 ; print TK_QSTR
                                   3598 ; converting control character
                                   3599 ; to backslash sequence
                                   3600 ; input:
                                   3601 ;   X        char *
                                   3602 ;-----------------------------
      001457                       3603 prt_quote:
      009262 CD 92            [ 1] 3604 	ld a,#'"
      009264 26 84 81         [ 4] 3605 	call putc 
      009267 F6               [ 1] 3606 1$:	ld a,(x)
      009267 CD 92            [ 1] 3607 	jreq 9$
      009269 57               [ 1] 3608 	incw x 
      00926A A1 01            [ 1] 3609 	cp a,#SPACE 
      00926C 27 03            [ 1] 3610 	jrult 3$
      00926E CC 87 94         [ 4] 3611 	call putc
      009271 CD 90            [ 1] 3612 	cp a,#'\ 
      009273 13 C3            [ 1] 3613 	jrne 1$ 
      00146B                       3614 2$:
      009275 00 1E 23         [ 4] 3615 	call putc 
      009278 05 A6            [ 2] 3616 	jra 1$
      00927A 0A               [ 1] 3617 3$: push a 
      00927B CC 87            [ 1] 3618 	ld a,#'\
      00927D 96 5D 27         [ 4] 3619 	call putc 
      009280 F8               [ 1] 3620 	pop a 
      009281 58 89            [ 1] 3621 	sub a,#7
      009283 AE 16 C8         [ 1] 3622 	ld acc8,a 
      009286 72 F0 01 5B      [ 1] 3623 	clr acc16
      00928A 02 A6 04 81      [ 2] 3624 	ldw y,#escaped 
      00928E 72 B9 00 08      [ 2] 3625 	addw y,acc16 
      00928E 52 01            [ 1] 3626 	ld a,(y)
      009290 CD 88            [ 2] 3627 	jra 2$
      009292 74 A1            [ 1] 3628 9$: ld a,#'"
      009294 02 2B 50         [ 4] 3629 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009297 6B               [ 1] 3630 	incw x 
      009298 01               [ 4] 3631 	ret
                                   3632 
                                   3633 
                                   3634 ;--------------------------
                                   3635 ; decompile line from token list 
                                   3636 ; input:
                                   3637 ;   X 		pointer at line
                                   3638 ; output:
                                   3639 ;   none 
                                   3640 ;--------------------------	
                           000001  3641 	BASE_SAV=1
                           000002  3642 	WIDTH_SAV=2
                           000003  3643 	XSAVE=3
                           000005  3644 	LLEN=5
                           000005  3645 	VSIZE=5 
      001493                       3646 prt_basic_line:
      001493                       3647 	_vars VSIZE 
      009299 A4 30            [ 2]    1     sub sp,#VSIZE 
      00929B A1 10 27         [ 1] 3648 	ld a,base
      00929E 04 7B            [ 1] 3649 	ld (BASE_SAV,sp),a  
      0092A0 01 20 03         [ 1] 3650 	ld a,tab_width 
      0092A3 6B 02            [ 1] 3651 	ld (WIDTH_SAV,sp),a 
      0092A3 CD 88 74         [ 2] 3652 	ldw ptr16,x
      0092A6 FE               [ 2] 3653 	ldw x,(x)
      0092A6 A1 07 26 03      [ 1] 3654 	mov base,#10
      0092AA FD 20 31 20      [ 1] 3655 	mov tab_width,#5
      0092AD CD 09 8D         [ 4] 3656 	call print_int ; print line number 
      0092AD A1 04            [ 1] 3657 	ld a,#SPACE 
      0092AF 26 02 20         [ 4] 3658 	call putc 
      0092B2 2B 5F 00 20      [ 1] 3659 	clr tab_width
      0092B3 AE 00 02         [ 2] 3660 	ldw x,#2
      0092B3 A1 02 26 06      [ 4] 3661 	ld a,([ptr16],x)
      0092B7 CD 92            [ 1] 3662 	ld (LLEN,sp),a 
      0092B9 67               [ 1] 3663 	incw x
      0092BA FE               [ 1] 3664 1$:	ld a,xl 
      0092BB 20 21            [ 1] 3665 	cp a,(LLEN,sp)
      0092BD 2B 03            [ 1] 3666 	jrmi 20$
      0092BD A1 05 26         [ 2] 3667 	jp 90$
      0014C9                       3668 20$:	 
      0092C0 03 FE 20 1A      [ 4] 3669 	ld a,([ptr16],x)
      0092C4 5C               [ 1] 3670 	incw x 
      0092C4 A1 09            [ 2] 3671 	ldw (XSAVE,sp),x 
      0092C6 27 16            [ 1] 3672 	cp a,#TK_CMD 
      0092C8 25 44            [ 1] 3673 	jrult 5$
      0092C8 A1 0B            [ 1] 3674 	cp a,#TK_CONST 
      0092CA 26 0C            [ 1] 3675 	jrugt 4$
      0014D8                       3676 2$:	
      0092CC CD 93 7B 89      [ 5] 3677 	ldw x,([ptr16],x)
      0092D0 A6 0C CD         [ 2] 3678 	cpw x,#rem 
      0092D3 92 26            [ 1] 3679 	jrne 3$
      0092D5 85 20            [ 1] 3680 	ld a,#''
      0092D7 06 01 A6         [ 4] 3681 	call putc 
      0092D8 1E 03            [ 2] 3682 	ldw x,(XSAVE,sp)
      0092D8 CD 90 00         [ 2] 3683 	addw x,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0092DB 4F 20 09 11      [ 2] 3684 	addw x,ptr16  
      0092DE CD 01 B8         [ 4] 3685 	call puts 
      0092DE A6 11 11         [ 2] 3686 	jp 90$ 
      0092E1 01 26 01         [ 4] 3687 3$:	call cmd_name
      0092E4 50 14 43         [ 4] 3688 	call prt_cmd_name
      0092E5 A6 20            [ 1] 3689 	ld a,#SPACE 
      0092E5 A6 04 A6         [ 4] 3690 	call putc 
      0092E7 1E 03            [ 2] 3691 	ldw x,(XSAVE,sp)
      0092E7 5B 01 81         [ 2] 3692 	addw x,#2
      0092EA 20 BA            [ 2] 3693 	jra 1$
      0092EA 52 05            [ 1] 3694 4$: cp a,#TK_QSTR 
      0092EC CD 92            [ 1] 3695 	jrne 5$
      0092EE 8E A1 02 2B      [ 2] 3696 	addw x,ptr16
      0092F2 41 14 57         [ 4] 3697 	call prt_quote 
      0092F3 72 B0 00 11      [ 2] 3698 	subw x,ptr16  
      0092F3 1F 03            [ 2] 3699 	jra 1$
      0092F5 CD 88            [ 1] 3700 5$:	cp a,#TK_VAR
      0092F7 74 A1            [ 1] 3701 	jrne 6$ 
      0092F9 02 2B 34 6B      [ 5] 3702 	ldw x,([ptr16],x)
      0092FD 05 A4 30         [ 2] 3703 	subw x,#vars 
      009300 A1               [ 1] 3704 	ld a,xl
      009301 20               [ 1] 3705 	srl a 
      009302 27 07            [ 1] 3706 	add a,#'A 
      009304 7B 05 CD         [ 4] 3707 	call putc 
      009307 90 00            [ 1] 3708 	ld a,#SPACE 
      009309 20 25 A6         [ 4] 3709 	call putc 
      00930B 1E 03            [ 2] 3710 	ldw x,(XSAVE,sp)
      00930B CD 92 8E         [ 2] 3711 	addw x,#2 
      00930E A1 04            [ 2] 3712 	jra 1$ 
      009310 27 03            [ 1] 3713 6$: cp a,#TK_ARRAY 
      009312 CC 87            [ 1] 3714 	jrne 7$
      009314 94 1F            [ 1] 3715 	ld a,#'@ 
      009316 01 7B 05         [ 4] 3716 	call putc 
      009319 A1 20            [ 2] 3717 	ldw x,(XSAVE,sp)
      00931B 26 05 CD         [ 2] 3718 	jp 1$ 
      00931E 91 02            [ 1] 3719 7$: cp a,#TK_INTGR 
      009320 20 D1            [ 1] 3720 	jrne 8$
      009322 A1 21 26 05      [ 5] 3721 	ldw x,([ptr16],x)
      009326 CD 91 4A         [ 4] 3722 	call print_int
      009329 20 C8            [ 1] 3723 	ld a,#SPACE 
      00932B CD 91 8E         [ 4] 3724 	call putc 
      00932E 20 C3            [ 2] 3725 	ldw x,(XSAVE,sp)
      009330 1E 03 A6         [ 2] 3726 	addw x,#2 
      009333 04 14 C1         [ 2] 3727 	jp 1$
      009334 A1 31            [ 1] 3728 8$: cp a,#TK_GT 
      009334 5B 05            [ 1] 3729 	jrmi 9$
      009336 81 35            [ 1] 3730 	cp a,#TK_NE 
      009337 22 16            [ 1] 3731 	jrugt 9$
      009337 52 05            [ 1] 3732 	sub a,#TK_GT  
      009339 CD               [ 1] 3733 	sll a 
      00933A 92 EA            [ 1] 3734 	clrw y 
      00933C A1 02            [ 1] 3735 	ld yl,a 
      00933E 2B 38 1F 03      [ 2] 3736 	addw y,#relop_str 
      009342 CD 88            [ 2] 3737 	ldw y,(y)
      009344 74               [ 1] 3738 	ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009345 A1 02 2B         [ 4] 3739 	call puts 
      009348 2B 6B            [ 2] 3740 	ldw x,(XSAVE,sp)
      00934A 05 A4 30         [ 2] 3741 	jp 1$
      00934D A1 10            [ 1] 3742 9$: cp a,#TK_PLUS 
      00934F 27 07            [ 1] 3743 	jrne 10$
      009351 7B 05            [ 1] 3744 	ld a,#'+
      009353 CD 90            [ 2] 3745 	jra 80$ 
      009355 00 20            [ 1] 3746 10$: cp a,#TK_MINUS
      009357 1C 04            [ 1] 3747 	jrne 11$
      009358 A6 2D            [ 1] 3748 	ld a,#'-
      009358 CD 92            [ 2] 3749 	jra 80$
      00935A EA A1            [ 1] 3750 11$: cp a,#TK_MULT 
      00935C 04 27            [ 1] 3751 	jrmi 12$
      00935E 03 CC            [ 1] 3752 	cp a,#TK_MOD 
      009360 87 94            [ 1] 3753 	jrugt 12$
      009362 1F 01            [ 1] 3754 	sub a,#0x20
      009364 7B               [ 1] 3755 	clrw x 
      009365 05               [ 1] 3756 	ld xl,a 
      009366 A1 10 26         [ 2] 3757 	addw x,#mul_char 
      009369 05               [ 1] 3758 	ld a,(x)
      00936A CD 90            [ 2] 3759 	jra 80$ 
      00936C F4 20            [ 1] 3760 12$: cp a,#TK_LPAREN 
      00936E D1 CD            [ 1] 3761 	jrmi 13$
      009370 90 FC            [ 1] 3762 	cp a,#TK_SHARP 
      009372 20 CC            [ 1] 3763 	jrugt 13$
      009374 1E 03            [ 1] 3764 	sub a,#TK_LPAREN
      009376 A6               [ 1] 3765 	clrw x 
      009377 04               [ 1] 3766 	ld xl,a 
      009378 1C 15 E2         [ 2] 3767 	addw x,#single_char 
      009378 5B               [ 1] 3768 	ld a,(x)
      009379 05 81            [ 2] 3769 	jra 80$
      00937B A1 03            [ 1] 3770 13$: cp a,#TK_CHAR 
      00937B 52 05            [ 1] 3771 	jrne 14$
      00937D CD 93            [ 1] 3772 	ld a,#'\
      00937F 37 A1 02         [ 4] 3773 	call putc 
      009382 2B 4B            [ 2] 3774 	ldw x,(XSAVE,sp)
      009384 1F 03 CD 88      [ 4] 3775 	ld a,([ptr16],x)
      009388 74               [ 1] 3776 	incw x 
      009389 A1 02            [ 2] 3777 	ldw (XSAVE,sp),x 
      00938B 2B 3E A6         [ 4] 3778 	call putc 
      00938D CC 14 C1         [ 2] 3779 	jp 1$ 
      00938D 6B 05            [ 1] 3780 14$: ld a,#':
      00938F A4 30 A1         [ 4] 3781 80$: call putc 
      009392 30 27            [ 2] 3782 	ldw x,(XSAVE,sp)
      009394 07 7B 05         [ 2] 3783 	jp 1$ 
      0015D0                       3784 90$: 
      009397 CD 90            [ 1] 3785 	ld a,#CR 
      009399 00 20 2F         [ 4] 3786 	call putc
      00939C 7B 02            [ 1] 3787 	ld a,(WIDTH_SAV,sp) 
      00939C CD 93 37         [ 1] 3788 	ld tab_width,a 
      00939F A1 04            [ 1] 3789 	ld a,(BASE_SAV,sp) 
      0093A1 27 03 CC         [ 1] 3790 	ld base,a
      0015DF                       3791 	_drop VSIZE 
      0093A4 87 94            [ 2]    1     addw sp,#VSIZE 
      0093A6 1F               [ 4] 3792 	ret 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0093A7 01 CD 90 FC           3793 single_char: .byte '(',')',',','#'
      0093AB 26 06 35              3794 mul_char: .byte '*','/','%'
      0093AE 02 00 0A 20 0C F9 15  3795 relop_str: .word gt,equal,ge,lt,le,ne 
             FC 15 FE 16 01
      0093B3 3E 00                 3796 gt: .asciz ">"
      0093B3 2C 06                 3797 equal: .asciz "="
      0093B5 35 04 00              3798 ge: .asciz ">="
      0093B8 0A 20                 3799 lt: .asciz "<"
      0093BA 04 3D 00              3800 le: .asciz "<="
      0093BB 3C 3E 00              3801 ne:  .asciz "<>"
                                   3802 
                                   3803 
                                   3804 ;---------------------------------
                                   3805 ; BASIC: PRINT|? arg_list 
                                   3806 ; print values from argument list
                                   3807 ;----------------------------------
                           000001  3808 	COMMA=1
                           000001  3809 	VSIZE=1
      001604                       3810 print:
      0093BB 35 01            [ 1] 3811 push #0 ; local variable COMMA 
      001606                       3812 reset_comma:
      0093BD 00 0A            [ 1] 3813 	clr (COMMA,sp)
      0093BF                       3814 prt_loop:
      0093BF 5F C6 00         [ 4] 3815 	call relation 
      0093C2 0A 14            [ 1] 3816 	cp a,#TK_COLON 
      0093C4 05 4D            [ 1] 3817 	jreq print_exit   
      0093C6 27 05            [ 1] 3818 	cp a,#TK_INTGR 
      0093C8 5C 05            [ 1] 3819 	jrne 0$ 
      0093C9 CD 09 8D         [ 4] 3820 	call print_int 
      0093C9 20 02            [ 2] 3821 	jra reset_comma
      001618                       3822 0$: 	
      0093CB 1E 03 F4         [ 4] 3823 	call next_token
      0093CD A1 00            [ 1] 3824 	cp a,#TK_NONE 
      0093CD A6 04            [ 1] 3825 	jreq print_exit 
      0093CF A1 0A            [ 1] 3826 1$:	cp a,#TK_QSTR
      0093CF 5B 05            [ 1] 3827 	jrne 2$   
      0093D1 81 01 B8         [ 4] 3828 	call puts
      0093D2 5C               [ 1] 3829 	incw x 
      0093D2 C6 00 07 88      [ 2] 3830 	subw x,basicptr 
      0093D6 CD               [ 1] 3831 	ld a,xl 
      0093D7 90 94 CD         [ 1] 3832 	ld in,a  
      0093DA 90 C7            [ 2] 3833 	jra reset_comma
      0093DC 84 C7            [ 1] 3834 2$: cp a,#TK_CHAR 
      0093DE 00 07            [ 1] 3835 	jrne 3$
      0093E0 4F               [ 1] 3836 	ld a,xl 
      0093E1 81 01 A6         [ 4] 3837 	call putc 
      0093E2 20 CB            [ 2] 3838 	jra reset_comma 
      00163B                       3839 3$: 	
      0093E2 35 10            [ 1] 3840 	cp a,#TK_CFUNC 
      0093E4 00 07            [ 1] 3841 	jrne 4$ 
      0093E6 81               [ 4] 3842 	call (x)
      0093E7 9F               [ 1] 3843 	ld a,xl 
      0093E7 35 0A 00         [ 4] 3844 	call putc
      0093EA 07 81            [ 2] 3845 	jra reset_comma 
      0093EC                       3846 4$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0093EC AE 16            [ 1] 3847 	cp a,#TK_COMMA 
      0093EE C8 72            [ 1] 3848 	jrne 5$
      0093F0 B0 00            [ 1] 3849 	cpl (COMMA,sp) 
      0093F2 1B A6 04         [ 2] 3850 	jp prt_loop   
      00164F                       3851 5$: 
      0093F5 81 0E            [ 1] 3852 	cp a,#TK_SHARP
      0093F6 26 13            [ 1] 3853 	jrne 7$
      0093F6 AE 16 C8         [ 4] 3854 	call next_token
      0093F9 72 B0            [ 1] 3855 	cp a,#TK_INTGR 
      0093FB 00 1B            [ 1] 3856 	jreq 6$
      0093FD 90 CE 00         [ 2] 3857 	jp syntax_error 
      00165D                       3858 6$:
      009400 05               [ 1] 3859 	ld a,xl 
      009401 90 C3            [ 1] 3860 	and a,#15 
      009403 00 1B 25         [ 1] 3861 	ld tab_width,a 
      009406 0A 3B 00         [ 2] 3862 	jp reset_comma 
      001666                       3863 7$:	
      009409 04 4B 00         [ 4] 3864 	call unget_token
      001669                       3865 print_exit:
      00940C 72 F0            [ 1] 3866 	tnz (COMMA,sp)
      00940E 01 5B            [ 1] 3867 	jrne 9$
      009410 02 54            [ 1] 3868 	ld a,#CR 
      009412 CF 00 1E         [ 4] 3869     call putc 
      001672                       3870 9$:	_drop VSIZE 
      009415 A6 04            [ 2]    1     addw sp,#VSIZE 
      009417 81               [ 4] 3871 	ret 
                                   3872 
                                   3873 ;----------------------
                                   3874 ; 'save_context' and
                                   3875 ; 'rest_context' must be 
                                   3876 ; called at the same 
                                   3877 ; call stack depth 
                                   3878 ; i.e. SP must have the 
                                   3879 ; save value at  
                                   3880 ; entry point of both 
                                   3881 ; routine. 
                                   3882 ;---------------------
                           000006  3883 	CTXT_SIZE=6 ; size of saved data 
                                   3884 ;--------------------
                                   3885 ; save current BASIC
                                   3886 ; interpreter context 
                                   3887 ; on cstack 
                                   3888 ;--------------------
      009418                       3889 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001675                       3890 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001675                       3891 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001675                       3892 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001675                       3893 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      001675                       3894 save_context:
      009418 CD 88 74         [ 2] 3895 	ldw x,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00941B A1 05            [ 2] 3896 	ldw (BPTR,sp),x
      00941D 27 03 CC         [ 1] 3897 	ld a,in 
      009420 87 94            [ 1] 3898 	ld (IN,sp),a
      009422 C6 00 03         [ 1] 3899 	ld a,count 
      009422 CD 90            [ 1] 3900 	ld (CNT,sp),a  
      009424 06               [ 4] 3901 	ret
                                   3902 
                                   3903 ;-----------------------
                                   3904 ; restore previously saved 
                                   3905 ; BASIC interpreter context 
                                   3906 ; from cstack 
                                   3907 ;-------------------------
      001685                       3908 rest_context:
      009425 CD 88            [ 2] 3909 	ldw x,(BPTR,sp)
      009427 74 A1 32         [ 2] 3910 	ldw basicptr,x 
      00942A 27 03            [ 1] 3911 	ld a,(IN,sp)
      00942C CC 87 94         [ 1] 3912 	ld in,a
      00942F 7B 08            [ 1] 3913 	ld a,(CNT,sp)
      00942F CD 93 7B         [ 1] 3914 	ld count,a  
      009432 A1               [ 4] 3915 	ret
                                   3916 
                                   3917 ;------------------------------------------
                                   3918 ; BASIC: INPUT [string],var[,[string],var]
                                   3919 ; input value in variables 
                                   3920 ; [string] optionally can be used as prompt 
                                   3921 ;-----------------------------------------
                           000001  3922 	CX_BPTR=1
                           000003  3923 	CX_LNO=3
                           000004  3924 	CX_IN=4
                           000005  3925 	CX_CNT=5
                           000006  3926 	SKIP=6
                           000007  3927 	VSIZE=7
      001695                       3928 input_var:
      009433 04 27 03 CC 87   [ 2] 3929 	btjt flags,#FRUN,1$ 
      009438 94 06            [ 1] 3930 	ld a,#ERR_RUN_ONLY 
      009439 CC 07 16         [ 2] 3931 	jp tb_error 
      00169F                       3932 1$:	_vars VSIZE 
      009439 90 93            [ 2]    1     sub sp,#VSIZE 
      0016A1                       3933 input_loop:
      00943B CD 90            [ 1] 3934 	clr (SKIP,sp)
      00943D 13 FF 81         [ 4] 3935 	call next_token 
      009440 A1 00            [ 1] 3936 	cp a,#TK_NONE 
      009440 52 06            [ 1] 3937 	jreq input_exit 
      009442 CE 00            [ 1] 3938 	cp a,#TK_QSTR 
      009444 19 C3            [ 1] 3939 	jrne 1$ 
      009446 00 1B 2B         [ 4] 3940 	call puts 
      009449 03 CC            [ 1] 3941 	cpl (SKIP,sp)
      00944B 94 C0 1F         [ 4] 3942 	call next_token 
      00944E 05 FE            [ 1] 3943 1$: cp a,#TK_VAR  
      009450 1F 01            [ 1] 3944 	jreq 2$ 
      009452 AE 7F FF         [ 2] 3945 	jp syntax_error
      009455 1F 03 CD         [ 4] 3946 2$:	call dpush 
      009458 92 33            [ 1] 3947 	tnz (SKIP,sp)
      00945A 4D 27            [ 1] 3948 	jrne 21$ 
      00945C 3F A1            [ 1] 3949 	ld a,#':
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      00945E 02 27 07         [ 1] 3950 	ld pad+1,a 
      009461 A1 01 27 06      [ 1] 3951 	clr pad+2
      009465 CC 87 94         [ 2] 3952 	ldw x,#pad 
      009468 CD 90 20         [ 4] 3953 	call puts   
      00946B                       3954 21$:
      00946B CD 90 13         [ 4] 3955 	call save_context 
      00946E 1F 01 A1         [ 2] 3956 	ldw x,#tib 
      009471 01 27 05         [ 2] 3957 	ldw basicptr,x  
      009474 72 5F 00 03      [ 1] 3958 	clr count  
      009474 CD 90 13         [ 4] 3959 	call readln 
      009477 1F 03 00 01      [ 1] 3960 	clr in 
      009479 CD 12 FB         [ 4] 3961 	call relation 
      009479 CE 00            [ 1] 3962 	cp a,#TK_INTGR
      00947B 19 1F            [ 1] 3963 	jreq 3$ 
      00947D 05 C3 00         [ 2] 3964 	jp syntax_error
      009480 1B 2A 3D         [ 4] 3965 3$: call dpush 
      009483 FE 13 01         [ 4] 3966 	call store 
      009486 2A 14 1E         [ 4] 3967 	call rest_context
      009489 05 1C 00         [ 4] 3968 	call next_token 
      00948C 02 F6            [ 1] 3969 	cp a,#TK_COMMA 
      00948E 5C C7            [ 1] 3970 	jrne 4$
      009490 00 0A            [ 2] 3971 	jra input_loop 
      009492 72 5F 00         [ 4] 3972 4$:	call unget_token 
      001706                       3973 input_exit:
      001706                       3974 	_drop VSIZE 
      009495 09 72            [ 2]    1     addw sp,#VSIZE 
      009497 BB               [ 4] 3975 	ret 
                                   3976 
                                   3977 
                                   3978 ;---------------------
                                   3979 ; BASIC: REMARK | ' 
                                   3980 ; skip comment to end of line 
                                   3981 ;---------------------- 
      001709                       3982 rem:
      009498 00 09 20 E0 03   [ 1] 3983  	mov count,in 
      00949C 81               [ 4] 3984 	ret 
                                   3985 
                                   3986 ;---------------------
                                   3987 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3988 ; read in loop 'addr'  
                                   3989 ; apply & 'mask' to value 
                                   3990 ; loop while result==0.  
                                   3991 ; if 'xor_mask' given 
                                   3992 ; apply ^ in second  
                                   3993 ; loop while result==0 
                                   3994 ;---------------------
                           000001  3995 	XMASK=1 
                           000002  3996 	MASK=2
                           000003  3997 	ADDR=3
                           000004  3998 	VSIZE=4
      00170F                       3999 wait: 
      00170F                       4000 	_vars VSIZE
      00949C 1E 05            [ 2]    1     sub sp,#VSIZE 
      00949E 0F 01            [ 1] 4001 	clr (XMASK,sp) 
      00949E CD 95 13         [ 4] 4002 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0094A1 1E 05            [ 1] 4003 	cp a,#2
      0094A3 E6 02            [ 1] 4004 	jruge 0$
      0094A5 C7 00 0A         [ 2] 4005 	jp syntax_error 
      0094A8 72 5F            [ 1] 4006 0$:	cp a,#3
      0094AA 00 09            [ 1] 4007 	jrult 1$
      0094AC 72 BB 00         [ 4] 4008 	call dpop 
      0094AF 09               [ 1] 4009 	ld a,xl
      0094B0 C3 00            [ 1] 4010 	ld (XMASK,sp),a 
      0094B2 1B 2A 0B         [ 4] 4011 1$: call dpop ; mask 
      0094B5 1F               [ 1] 4012 	ld a,xl 
      0094B6 05 FE            [ 1] 4013 	ld (MASK,sp),a 
      0094B8 13 03 2C         [ 4] 4014 	call dpop ; address 
      0094BB 04               [ 1] 4015 2$:	ld a,(x)
      0094BC 1E 05            [ 1] 4016 	and a,(MASK,sp)
      0094BE 20 DE            [ 1] 4017 	xor a,(XMASK,sp)
      0094C0 27 F9            [ 1] 4018 	jreq 2$ 
      001737                       4019 	_drop VSIZE 
      0094C0 5B 06            [ 2]    1     addw sp,#VSIZE 
      0094C2 81               [ 4] 4020 	ret 
                                   4021 
                                   4022 ;---------------------
                                   4023 ; BASIC: BSET addr,mask
                                   4024 ; set bits at 'addr' corresponding 
                                   4025 ; to those of 'mask' that are at 1.
                                   4026 ; arguments:
                                   4027 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4028 ;   mask        mask|addr
                                   4029 ; output:
                                   4030 ;	none 
                                   4031 ;--------------------------
      0094C3                       4032 bit_set:
      0094C3 F6 5C A4         [ 4] 4033 	call arg_list 
      0094C6 0F 88            [ 1] 4034 	cp a,#2	 
      0094C8 0D 01            [ 1] 4035 	jreq 1$ 
      0094CA 27 09 F6         [ 2] 4036 	jp syntax_error
      001744                       4037 1$: 
      0094CD CD 82 26         [ 4] 4038 	call dpop ; mask 
      0094D0 5C               [ 1] 4039 	ld a,xl 
      0094D1 0A 01 20         [ 4] 4040 	call dpop ; addr  
      0094D4 F3               [ 1] 4041 	or a,(x)
      0094D5 84               [ 1] 4042 	ld (x),a
      0094D6 81               [ 4] 4043 	ret 
                                   4044 
                                   4045 ;---------------------
                                   4046 ; BASIC: BRES addr,mask
                                   4047 ; reset bits at 'addr' corresponding 
                                   4048 ; to those of 'mask' that are at 1.
                                   4049 ; arguments:
                                   4050 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4051 ;   mask	    ~mask&*addr  
                                   4052 ; output:
                                   4053 ;	none 
                                   4054 ;--------------------------
      0094D7                       4055 bit_reset:
      0094D7 A6 22 CD         [ 4] 4056 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0094DA 82 26            [ 1] 4057 	cp a,#2  
      0094DC F6 27            [ 1] 4058 	jreq 1$ 
      0094DE 2D 5C A1         [ 2] 4059 	jp syntax_error
      001758                       4060 1$: 
      0094E1 20 25 0C         [ 4] 4061 	call dpop ; mask 
      0094E4 CD               [ 1] 4062 	ld a,xl 
      0094E5 82               [ 1] 4063 	cpl a 
      0094E6 26 A1 5C         [ 4] 4064 	call dpop ; addr  
      0094E9 26               [ 1] 4065 	and a,(x)
      0094EA F1               [ 1] 4066 	ld (x),a 
      0094EB 81               [ 4] 4067 	ret 
                                   4068 
                                   4069 ;---------------------
                                   4070 ; BASIC: BRES addr,mask
                                   4071 ; toggle bits at 'addr' corresponding 
                                   4072 ; to those of 'mask' that are at 1.
                                   4073 ; arguments:
                                   4074 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4075 ;   mask	    mask^*addr  
                                   4076 ; output:
                                   4077 ;	none 
                                   4078 ;--------------------------
      001763                       4079 bit_toggle:
      0094EB CD 82 26         [ 4] 4080 	call arg_list 
      0094EE 20 EC            [ 1] 4081 	cp a,#2 
      0094F0 88 A6            [ 1] 4082 	jreq 1$ 
      0094F2 5C CD 82         [ 2] 4083 	jp syntax_error
      0094F5 26 84 A0         [ 4] 4084 1$: call dpop ; mask 
      0094F8 07               [ 1] 4085 	ld a,xl 
      0094F9 C7 00 0A         [ 4] 4086 	call dpop ; addr  
      0094FC 72               [ 1] 4087 	xor a,(x)
      0094FD 5F               [ 1] 4088 	ld (x),a 
      0094FE 00               [ 4] 4089 	ret 
                                   4090 
                                   4091 
                                   4092 ;---------------------
                                   4093 ; BASIC: BTEST(addr,bit)
                                   4094 ; return bit value at 'addr' 
                                   4095 ; bit is in range {0..7}.
                                   4096 ; arguments:
                                   4097 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4098 ;   bit 	    bit position {0..7}  
                                   4099 ; output:
                                   4100 ;	none 
                                   4101 ;--------------------------
      001777                       4102 bit_test:
      0094FF 09 90 AE         [ 4] 4103 	call func_args 
      009502 8C CF            [ 1] 4104 	cp a,#2
      009504 72 B9            [ 1] 4105 	jreq 0$
      009506 00 09 90         [ 2] 4106 	jp syntax_error
      001781                       4107 0$:	
      009509 F6 20 DF         [ 4] 4108 	call dpop 
      00950C A6               [ 1] 4109 	ld a,xl 
      00950D 22 CD            [ 1] 4110 	and a,#7
      00950F 82               [ 1] 4111 	push a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009510 26 5C            [ 1] 4112 	ld a,#1 
      009512 81 01            [ 1] 4113 1$: tnz (1,sp)
      009513 27 05            [ 1] 4114 	jreq 2$
      009513 52               [ 1] 4115 	sll a 
      009514 05 C6            [ 1] 4116 	dec (1,sp)
      009516 00 07            [ 2] 4117 	jra 1$
      009518 6B 01 C6         [ 4] 4118 2$: call dpop 
      00951B 00               [ 1] 4119 	and a,(x)
      00951C 21 6B            [ 1] 4120 	jreq 3$
      00951E 02 CF            [ 1] 4121 	ld a,#1 
      009520 00               [ 1] 4122 3$:	clrw x 
      009521 12               [ 1] 4123 	ld xl,a 
      009522 FE 35            [ 1] 4124 	ld a,#TK_INTGR
      00179F                       4125 	_drop 1 
      009524 0A 00            [ 2]    1     addw sp,#1 
      009526 07               [ 4] 4126 	ret
                                   4127 
                                   4128 
                                   4129 ;--------------------
                                   4130 ; BASIC: POKE addr,byte
                                   4131 ; put a byte at addr 
                                   4132 ;--------------------
      0017A2                       4133 poke:
      009527 35 05 00         [ 4] 4134 	call arg_list 
      00952A 21 CD            [ 1] 4135 	cp a,#2
      00952C 8A 0D            [ 1] 4136 	jreq 1$
      00952E A6 20 CD         [ 2] 4137 	jp syntax_error
      0017AC                       4138 1$:	
      009531 82 26 72         [ 4] 4139 	call dpop 
      009534 5F               [ 1] 4140     ld a,xl 
      009535 00 21 AE         [ 4] 4141 	call dpop 
      009538 00               [ 1] 4142 	ld (x),a 
      009539 02               [ 4] 4143 	ret 
                                   4144 
                                   4145 ;-----------------------
                                   4146 ; BASIC: PEEK(addr)
                                   4147 ; get the byte at addr 
                                   4148 ; input:
                                   4149 ;	none 
                                   4150 ; output:
                                   4151 ;	X 		value 
                                   4152 ;-----------------------
      0017B5                       4153 peek:
      00953A 72 D6 00         [ 4] 4154 	call func_args
      00953D 12 6B            [ 1] 4155 	cp a,#1
      00953F 05 5C            [ 1] 4156 	jreq 1$
      009541 9F 11 05         [ 2] 4157 	jp syntax_error
      009544 2B 03 CC         [ 4] 4158 1$:	call dpop 
      009547 96               [ 1] 4159 	ld a,(x)
      009548 50               [ 1] 4160 	clrw x 
      009549 97               [ 1] 4161 	ld xl,a 
      009549 72 D6            [ 1] 4162 	ld a,#TK_INTGR
      00954B 00               [ 4] 4163 	ret 
                                   4164 
      0017C8                       4165 if: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00954C 12 5C 1F         [ 4] 4166 	call relation 
      00954F 03 A1            [ 1] 4167 	cp a,#TK_INTGR
      009551 06 25            [ 1] 4168 	jreq 1$ 
      009553 44 A1 09         [ 2] 4169 	jp syntax_error
      009556 22               [ 1] 4170 1$:	clr a 
      009557 2F               [ 2] 4171 	tnzw x 
      009558 26 05            [ 1] 4172 	jrne 9$  
                                   4173 ;skip to next line
      009558 72 DE 00 12 A3   [ 1] 4174 	mov in,count
      00955D 97               [ 4] 4175 9$:	ret 
                                   4176 
                                   4177 ;------------------------
                                   4178 ; BASIC: FOR var=expr 
                                   4179 ; set variable to expression 
                                   4180 ; leave variable address 
                                   4181 ; on dstack and set
                                   4182 ; FFOR bit in 'flags'
                                   4183 ;-----------------
                           000001  4184 	RETL1=1
                           000003  4185 	INW=3
                           000005  4186 	BPTR=5
      0017DC                       4187 for: ; { -- var_addr }
      00955E 89 26            [ 1] 4188 	ld a,#TK_VAR 
      009560 14 A6 27         [ 4] 4189 	call expect
      009563 CD 82 26         [ 4] 4190 	call dpush 
      009566 1E 03 1C         [ 4] 4191 	call let02 
      009569 00 02 72 BB      [ 1] 4192 	bset flags,#FFOR 
                                   4193 ; open space on cstack for BPTR and INW 
      00956D 00               [ 2] 4194 	popw x ; call return address 
      0017EC                       4195 	_vars 4
      00956E 12 CD            [ 2]    1     sub sp,#4 
      009570 82               [ 2] 4196 	pushw x  ; RETL1 
      009571 38               [ 1] 4197 	clrw x 
      009572 CC 96            [ 2] 4198 	ldw (BPTR,sp),x 
      009574 50 CD            [ 2] 4199 	ldw (INW,sp),x 
      009576 91 9F CD         [ 4] 4200 	call next_token 
      009579 94 C3            [ 1] 4201 	cp a,#TK_CMD 
      00957B A6 20            [ 1] 4202 	jreq 1$
      00957D CD 82 26         [ 2] 4203 	jp syntax_error
      0017FE                       4204 1$:  
      009580 1E 03 1C         [ 2] 4205 	cpw x,#to 
      009583 00 02            [ 1] 4206 	jreq to
      009585 20 BA A1         [ 2] 4207 	jp syntax_error 
                                   4208 
                                   4209 ;-----------------------------------
                                   4210 ; BASIC: TO expr 
                                   4211 ; second part of FOR loop initilization
                                   4212 ; leave limit on dstack and set 
                                   4213 ; FTO bit in 'flags'
                                   4214 ;-----------------------------------
      001806                       4215 to: ; { var_addr -- var_addr limit step }
      009588 0A 26 0D 72 BB   [ 2] 4216 	btjt flags,#FFOR,1$
      00958D 00 12 CD         [ 2] 4217 	jp syntax_error
      009590 94 D7 72         [ 4] 4218 1$: call relation  
      009593 B0 00            [ 1] 4219 	cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009595 12 20            [ 1] 4220 	jreq 2$ 
      009597 A9 A1 05         [ 2] 4221 	jp syntax_error
      001818                       4222 2$: 
      00959A 26 1A 72         [ 4] 4223     call dpush ; limit
      00959D DE 00 12         [ 2] 4224 	ldw x,in.w 
      0095A0 1D 00 22         [ 4] 4225 	call next_token
      0095A3 9F 44            [ 1] 4226 	cp a,#TK_NONE  
      0095A5 AB 41            [ 1] 4227 	jreq 4$ 
      0095A7 CD 82            [ 1] 4228 	cp a,#TK_CMD
      0095A9 26 A6            [ 1] 4229 	jrne 3$
      0095AB 20 CD 82         [ 2] 4230 	cpw x,#step 
      0095AE 26 1E            [ 1] 4231 	jreq step
      00182E                       4232 3$:	
      0095B0 03 1C 00         [ 4] 4233 	call unget_token   	 
      001831                       4234 4$:	
      0095B3 02 20 8B         [ 2] 4235 	ldw x,#1   ; default step  
      0095B6 A1 02            [ 2] 4236 	jra store_loop_addr 
                                   4237 
                                   4238 
                                   4239 ;----------------------------------
                                   4240 ; BASIC: STEP expr 
                                   4241 ; optional third par of FOR loop
                                   4242 ; initialization. 	
                                   4243 ;------------------------------------
      001836                       4244 step: ; {var limit -- var limit step}
      0095B8 26 0A A6 40 CD   [ 2] 4245 	btjt flags,#FFOR,1$
      0095BD 82 26 1E         [ 2] 4246 	jp syntax_error
      0095C0 03 CC 95         [ 4] 4247 1$: call relation
      0095C3 41 A1            [ 1] 4248 	cp a,#TK_INTGR
      0095C5 04 26            [ 1] 4249 	jreq store_loop_addr  
      0095C7 14 72 DE         [ 2] 4250 	jp syntax_error
                                   4251 ; leave loop back entry point on cstack 
                                   4252 ; cstack is 2 call deep from interp_loop
      001848                       4253 store_loop_addr:
      0095CA 00 12 CD         [ 4] 4254 	call dpush 
      0095CD 8A 0D A6         [ 2] 4255 	ldw x,basicptr  
      0095D0 20 CD            [ 2] 4256 	ldw (BPTR,sp),x 
      0095D2 82 26 1E         [ 2] 4257 	ldw x,in.w 
      0095D5 03 1C            [ 2] 4258 	ldw (INW,sp),x   
      0095D7 00 02 CC 95      [ 1] 4259 	bres flags,#FFOR 
      0095DB 41 A1 31 2B      [ 1] 4260 	inc loop_depth  
      0095DF 1A               [ 4] 4261 	ret 
                                   4262 
                                   4263 ;--------------------------------
                                   4264 ; BASIC: NEXT var 
                                   4265 ; FOR loop control 
                                   4266 ; increment variable with step 
                                   4267 ; and compare with limit 
                                   4268 ; loop if threshold not crossed.
                                   4269 ; else clean both stacks. 
                                   4270 ; and decrement 'loop_depth' 
                                   4271 ;--------------------------------
      00185E                       4272 next: ; {var limit step -- [var limit step ] }
      0095E0 A1 35 22 16      [ 1] 4273 	tnz loop_depth 
      0095E4 A0 31            [ 1] 4274 	jrne 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0095E6 48 90 5F         [ 2] 4275 	jp syntax_error 
      001867                       4276 1$: 
      0095E9 90 97            [ 1] 4277 	ld a,#TK_VAR 
      0095EB 72 A9 96         [ 4] 4278 	call expect
                                   4279 ; check for good variable after NEXT 	 
      0095EE 69 90            [ 1] 4280 	ldw y,x 
      0095F0 FE 93 CD         [ 2] 4281 	ldw x,#4  
      0095F3 82 38 1E 03      [ 4] 4282 	cpw y,([dstkptr],x) ; compare variables address 
      0095F7 CC 95            [ 1] 4283 	jreq 2$  
      0095F9 41 A1 10         [ 2] 4284 	jp syntax_error ; not the good one 
      00187A                       4285 2$: ; increment variable 
      0095FC 26               [ 1] 4286 	ldw x,y
      0095FD 04               [ 2] 4287 	ldw x,(x)  ; get var value 
      0095FE A6 2B 20         [ 2] 4288 	ldw acc16,x 
      009601 46 A1 11 26      [ 5] 4289 	ldw x,[dstkptr] ; step
      009605 04 A6 2D 20      [ 2] 4290 	addw x,acc16 ; var+step 
      009609 3E A1            [ 2] 4291 	ldw (y),x ; save var new value 
                                   4292 ; compare with limit 
      00960B 20 2B            [ 1] 4293 	ldw y,x 
      00960D 0E A1 22 22      [ 5] 4294 	ldw x,[dstkptr] ; step in x 
      009611 0A               [ 2] 4295 	tnzw x  
      009612 A0 20            [ 1] 4296 	jrpl 4$ ; positive step 
                                   4297 ;negative step 
      009614 5F 97 1C         [ 2] 4298 	ldw x,#2
      009617 96 66 F6 20      [ 4] 4299 	cpw y,([dstkptr],x)
      00961B 2C A1            [ 1] 4300 	jrslt loop_done
      00961D 0B 2B            [ 2] 4301 	jra loop_back 
      00189D                       4302 4$: ; positive step
      00961F 0E A1 0E         [ 2] 4303 	ldw x,#2 
      009622 22 0A A0 0B      [ 4] 4304 	cpw y,([dstkptr],x)
      009626 5F 97            [ 1] 4305 	jrsgt loop_done
      0018A6                       4306 loop_back:
      009628 1C 96            [ 2] 4307 	ldw x,(BPTR,sp)
      00962A 62 F6 20         [ 2] 4308 	ldw basicptr,x 
      00962D 1A A1 03 26 14   [ 2] 4309 	btjf flags,#FRUN,1$ 
      009632 A6 5C            [ 1] 4310 	ld a,(2,x)
      009634 CD 82 26         [ 1] 4311 	ld count,a
      009637 1E 03            [ 2] 4312 1$:	ldw x,(INW,sp)
      009639 72 D6 00         [ 2] 4313 	ldw in.w,x 
      00963C 12               [ 4] 4314 	ret 
      0018BB                       4315 loop_done:
                                   4316 	; remove var limit step on dstack 
      00963D 5C 1F 03         [ 2] 4317 	ldw x,dstkptr 
      009640 CD 82 26         [ 2] 4318 	addw x,#3*CELL_SIZE
      009643 CC 95 41         [ 2] 4319 	ldw dstkptr,x 
                                   4320 	; remove 2 return address on cstack 
      009646 A6               [ 2] 4321 	popw x
      0018C5                       4322 	_drop 4
      009647 3A CD            [ 2]    1     addw sp,#4 
      009649 82               [ 2] 4323 	pushw x 
      00964A 26 1E 03 CC      [ 1] 4324 	dec loop_depth 
      00964E 95               [ 4] 4325 	ret 
                                   4326 
                                   4327 
                                   4328 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4329 ; BASIC: GOTO line# 
                                   4330 ; jump to line# 
                                   4331 ; here cstack is 2 call deep from interp_loop 
                                   4332 ;------------------------
      0018CD                       4333 goto:
      00964F 41 00 00 1F 06   [ 2] 4334 	btjt flags,#FRUN,0$ 
      009650 A6 06            [ 1] 4335 	ld a,#ERR_RUN_ONLY
      009650 A6 0D CD         [ 2] 4336 	jp tb_error 
      009653 82               [ 4] 4337 	ret 
      009654 26 7B            [ 2] 4338 0$:	jra go_common
                                   4339 
                                   4340 ;--------------------
                                   4341 ; BASIC: GOSUB line#
                                   4342 ; basic subroutine call
                                   4343 ; actual line# and basicptr 
                                   4344 ; are saved on cstack
                                   4345 ; here cstack is 2 call deep from interp_loop 
                                   4346 ;--------------------
                           000003  4347 	GOS_RET=3
      0018DA                       4348 gosub:
      009656 02 C7 00 21 7B   [ 2] 4349 	btjt flags,#FRUN,0$ 
      00965B 01 C7            [ 1] 4350 	ld a,#ERR_RUN_ONLY
      00965D 00 07 5B         [ 2] 4351 	jp tb_error 
      009660 05               [ 4] 4352 	ret 
      009661 81               [ 2] 4353 0$:	popw x 
      009662 28 29            [ 2] 4354 	sub sp,#2 
      009664 2C               [ 2] 4355 	pushw x 
      009665 23 2A 2F         [ 2] 4356 	ldw x,basicptr
      009668 25 96            [ 1] 4357 	ld a,(2,x)
      00966A 75 96            [ 1] 4358 	add a,#3 
      00966C 77 96 79         [ 1] 4359 	ld acc8,a 
      00966F 96 7C 96 7E      [ 1] 4360 	clr acc16 
      009673 96 81 3E 00      [ 2] 4361 	addw x,acc16
      009677 3D 00            [ 2] 4362 	ldw (GOS_RET,sp),x 
      0018FD                       4363 go_common: 
      009679 3E 3D 00         [ 4] 4364 	call relation 
      00967C 3C 00            [ 1] 4365 	cp a,#TK_INTGR
      00967E 3C 3D            [ 1] 4366 	jreq 1$ 
      009680 00 3C 3E         [ 2] 4367 	jp syntax_error
      001907                       4368 1$: 
      009683 00 02 E8         [ 4] 4369 	call search_lineno  
      009684 5D               [ 2] 4370 	tnzw x 
      009684 4B 00            [ 1] 4371 	jrne 2$ 
      009686 A6 05            [ 1] 4372 	ld a,#ERR_NO_LINE 
      009686 0F 01 16         [ 2] 4373 	jp tb_error 
      009688                       4374 2$: 
      009688 CD 93 7B         [ 2] 4375 	ldw basicptr,x 
      00968B A1 01            [ 1] 4376 	ld a,(2,x)
      00968D 27 5A A1         [ 1] 4377 	ld count,a 
      009690 04 26 05 CD      [ 1] 4378 	mov in,#3 
      009694 8A               [ 4] 4379 	ret 
                                   4380 
                                   4381 ;------------------------
                                   4382 ; BASIC: RETURN 
                                   4383 ; exit from a subroutine 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4384 ; cstack is 2 level deep from interp_loop 
                                   4385 ;------------------------
      00191F                       4386 return:
      009695 0D 20 EE 1F 05   [ 2] 4387 	btjt flags,#FRUN,0$ 
      009698 A6 06            [ 1] 4388 	ld a,#ERR_RUN_ONLY
      009698 CD 88 74         [ 2] 4389 	jp tb_error 
      001929                       4390 0$:	
      00969B A1 00            [ 2] 4391 	ldw x,(GOS_RET,sp) 
      00969D 27 4A A1         [ 2] 4392 	ldw basicptr,x 
      0096A0 0A 26            [ 1] 4393 	ld a,(2,x)
      0096A2 0E CD            [ 1] 4394 	add a,#3 
      0096A4 82 38 5C         [ 1] 4395 	ld count,a 
      0096A7 72 B0 00 05      [ 1] 4396 	mov in,#3
      0096AB 9F               [ 1] 4397 	clr a 
      0096AC C7               [ 2] 4398 	popw x 
      00193B                       4399 	_drop 2
      0096AD 00 02            [ 2]    1     addw sp,#2 
      0096AF 20               [ 2] 4400 	pushw x
      0096B0 D5               [ 4] 4401 	ret  
                                   4402 
                                   4403 
                                   4404 ;----------------------------------
                                   4405 ; BASIC: RUN
                                   4406 ; run BASIC program in RAM
                                   4407 ;----------------------------------- 
      00193F                       4408 run: 
      0096B1 A1 03 26 06 9F   [ 2] 4409 	btjf flags,#FRUN,0$  
      0096B6 CD               [ 1] 4410 	clr a 
      0096B7 82               [ 4] 4411 	ret
      001946                       4412 0$: 
      0096B8 26 20 CB 1F 12   [ 2] 4413 	btjf flags,#FBREAK,1$
      0096BB                       4414 	_drop 2 
      0096BB A1 08            [ 2]    1     addw sp,#2 
      0096BD 26 07 FD         [ 4] 4415 	call rest_context
      001950                       4416 	_drop CTXT_SIZE 
      0096C0 9F CD            [ 2]    1     addw sp,#CTXT_SIZE 
      0096C2 82 26 20 C0      [ 1] 4417 	bres flags,#FBREAK 
      0096C6 72 10 00 1F      [ 1] 4418 	bset flags,#FRUN 
      0096C6 A1 0D 26         [ 2] 4419 	jp interp_loop 
      0096C9 05 03 01         [ 2] 4420 1$:	ldw x,txtbgn
      0096CC CC 96 88         [ 2] 4421 	cpw x,txtend 
      0096CF 2B 02            [ 1] 4422 	jrmi 2$ 
      0096CF A1               [ 1] 4423 	clr a 
      0096D0 0E               [ 4] 4424 	ret 
      0096D1 26 13 CD         [ 4] 4425 2$: call ubound 
      00196A                       4426 	_drop 2 
      0096D4 88 74            [ 2]    1     addw sp,#2 
      0096D6 A1 04 27         [ 2] 4427 	ldw x,txtbgn 
      0096D9 03 CC 87         [ 2] 4428 	ldw basicptr,x 
      0096DC 94 02            [ 1] 4429 	ld a,(2,x)
      0096DD C7 00 03         [ 1] 4430 	ld count,a
      0096DD 9F A4 0F C7      [ 1] 4431 	mov in,#3	
      0096E1 00 21 CC 96      [ 1] 4432 	bset flags,#FRUN 
      0096E5 86 07 C4         [ 2] 4433 	jp interp_loop 
                                   4434 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4435 
                                   4436 ;----------------------
                                   4437 ; BASIC: STOP 
                                   4438 ; stop running program
                                   4439 ;---------------------- 
      0096E6                       4440 stop: 
                                   4441 ; clean dstack and cstack 
      0096E6 CD 90 00         [ 2] 4442 	ldw x,#STACK_EMPTY 
      0096E9 94               [ 1] 4443 	ldw sp,x 
      0096E9 0D 01 26 05      [ 1] 4444 	bres flags,#FRUN 
      0096ED A6 0D CD 82      [ 1] 4445 	bres flags,#FBREAK
      0096F1 26 5B 01         [ 2] 4446 	jp warm_start
                                   4447 
                                   4448 ;-----------------------
                                   4449 ; BASIC BEEP expr1,expr2
                                   4450 ; used MCU internal beeper 
                                   4451 ; to produce a sound
                                   4452 ; arguments:
                                   4453 ;    expr1   frequency  (expr1%32)
                                   4454 ;    expr2   duration msec.
                                   4455 ;---------------------------
      001991                       4456 beep:
      0096F4 81 11 B3         [ 4] 4457 	call arg_list 
      0096F5 A1 02            [ 1] 4458 	cp a,#2 
      0096F5 CE 00            [ 1] 4459 	jreq 1$
      0096F7 05 1F 03         [ 2] 4460 	jp syntax_error 
      00199B                       4461 1$: 
      0096FA C6 00 02         [ 2] 4462 	ldw x,dstkptr 
      0096FD 6B 07            [ 2] 4463 	ldw x,(2,x);frequency 
      0096FF C6 00            [ 1] 4464 	ld a,#31
      009701 04               [ 2] 4465 	div x,a 
      009702 6B 08 81         [ 1] 4466 	ld BEEP_CSR,a	
      009705 72 1A 50 F3      [ 1] 4467 	bset BEEP_CSR,#5 
      009705 1E 03 CF         [ 4] 4468 	call dpop 
      009708 00 05 7B         [ 4] 4469 	call pause02 
      00970B 07 C7 00         [ 4] 4470 	call ddrop 
      00970E 02 7B            [ 1] 4471 	ld a,#0x1f
      009710 08 C7 00         [ 1] 4472 	ld BEEP_CSR,a 
      009713 04               [ 4] 4473 	ret 
                                   4474 
                                   4475 ;-------------------------------
                                   4476 ; BASIC: PWRADC 0|1 [,divisor]  
                                   4477 ; disable/enanble ADC 
                                   4478 ;-------------------------------
      0019B9                       4479 power_adc:
      009714 81 11 B3         [ 4] 4480 	call arg_list 
      009715 A1 02            [ 1] 4481 	cp a,#2	
      009715 72 00            [ 1] 4482 	jreq 1$
      009717 00 20            [ 1] 4483 	cp a,#1 
      009719 05 A6            [ 1] 4484 	jreq 0$ 
      00971B 06 CC 87         [ 2] 4485 	jp syntax_error 
      00971E 96 52 07         [ 2] 4486 0$: ldw x,#0
      009721 CD 0F 86         [ 4] 4487 	call dpush 
      009721 0F 06 CD         [ 2] 4488 1$: ldw x,#2
      009724 88 74 A1 00      [ 5] 4489 	ldw x,([dstkptr],x) ; on|off
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009728 27               [ 2] 4490 	tnzw x 
      009729 5C A1            [ 1] 4491 	jreq 2$ 
      00972B 0A 26 08 CD      [ 5] 4492 	ldw x,[dstkptr] ; divisor 
      00972F 82               [ 1] 4493 	ld a,xl
      009730 38 03            [ 1] 4494 	and a,#7
      009732 06               [ 1] 4495 	swap a 
      009733 CD 88 74         [ 1] 4496 	ld ADC_CR1,a
      009736 A1 05 27 03      [ 1] 4497 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00973A CC 87 94 CD      [ 1] 4498 	bset ADC_CR1,#ADC_CR1_ADON 
      0019EA                       4499 	_usec_dly 7 
      00973E 90 06 0D         [ 2]    1     ldw x,#(16*7-2)/4
      009741 06               [ 2]    2     decw x
      009742 26               [ 1]    3     nop 
      009743 0F A6            [ 1]    4     jrne .-4
      009745 3A C7            [ 2] 4500 	jra 3$
      009747 17 19 72 5F      [ 1] 4501 2$: bres ADC_CR1,#ADC_CR1_ADON
      00974B 17 1A AE 17      [ 1] 4502 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00974F 18 CD 82         [ 2] 4503 3$:	ldw x,#2
      009752 38 0F F7         [ 4] 4504 	call ddrop_n 
      009753 81               [ 4] 4505 	ret
                                   4506 
                                   4507 ;-----------------------------
                                   4508 ; BASIC: RDADC(channel)
                                   4509 ; read adc channel {0..5}
                                   4510 ; output:
                                   4511 ;   A 		TK_INTGR 
                                   4512 ;   X 		value 
                                   4513 ;-----------------------------
      001A02                       4514 analog_read:
      009753 CD 96 F5         [ 4] 4515 	call func_args 
      009756 AE 16            [ 1] 4516 	cp a,#1 
      009758 C8 CF            [ 1] 4517 	jreq 1$
      00975A 00 05 72         [ 2] 4518 	jp syntax_error
      00975D 5F 00 04         [ 4] 4519 1$: call dpop 
      009760 CD 8A FB         [ 2] 4520 	cpw x,#5 
      009763 72 5F            [ 2] 4521 	jrule 2$
      009765 00 02            [ 1] 4522 	ld a,#ERR_BAD_VALUE
      009767 CD 93 7B         [ 2] 4523 	jp tb_error 
      00976A A1               [ 1] 4524 2$: ld a,xl
      00976B 04 27 03         [ 1] 4525 	ld acc8,a 
      00976E CC 87            [ 1] 4526 	ld a,#5
      009770 94 CD 90         [ 1] 4527 	sub a,acc8 
      009773 06 CD 90         [ 1] 4528 	ld ADC_CSR,a
      009776 6D CD 97 05      [ 1] 4529 	bset ADC_CR2,#ADC_CR2_ALIGN
      00977A CD 88 74 A1      [ 1] 4530 	bset ADC_CR1,#ADC_CR1_ADON
      00977E 0D 26 02 20 9E   [ 2] 4531 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009783 CD 90 00         [ 2] 4532 	ldw x,ADC_DRH
      009786 A6 04            [ 1] 4533 	ld a,#TK_INTGR
      009786 5B               [ 4] 4534 	ret 
                                   4535 
                                   4536 ;-----------------------
                                   4537 ; BASIC: DREAD(pin)
                                   4538 ; read state of a digital pin 
                                   4539 ; pin# {0..15}
                                   4540 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4541 ;    A 		TK_INTGR
                                   4542 ;    X      0|1 
                                   4543 ;-------------------------
                           000001  4544 	PINNO=1
                           000001  4545 	VSIZE=1
      001A38                       4546 digital_read:
      001A38                       4547 	_vars VSIZE 
      009787 07 81            [ 2]    1     sub sp,#VSIZE 
      009789 CD 11 D7         [ 4] 4548 	call func_args
      009789 55 00            [ 1] 4549 	cp a,#1
      00978B 02 00            [ 1] 4550 	jreq 1$
      00978D 04 81 14         [ 2] 4551 	jp syntax_error
      00978F CD 0F 93         [ 4] 4552 1$: call dpop 
      00978F 52 04 0F         [ 2] 4553 	cpw x,#15 
      009792 01 CD            [ 2] 4554 	jrule 2$
      009794 92 33            [ 1] 4555 	ld a,#ERR_BAD_VALUE
      009796 A1 02 24         [ 2] 4556 	jp tb_error 
      009799 03 CC 87         [ 4] 4557 2$:	call select_pin 
      00979C 94 A1            [ 1] 4558 	ld (PINNO,sp),a
      00979E 03 25            [ 1] 4559 	ld a,(GPIO_IDR,x)
      0097A0 06 CD            [ 1] 4560 	tnz (PINNO,sp)
      0097A2 90 13            [ 1] 4561 	jreq 8$
      0097A4 9F               [ 1] 4562 3$: srl a 
      0097A5 6B 01            [ 1] 4563 	dec (PINNO,sp)
      0097A7 CD 90            [ 1] 4564 	jrne 3$ 
      0097A9 13 9F            [ 1] 4565 8$: and a,#1 
      0097AB 6B               [ 1] 4566 	clrw x 
      0097AC 02               [ 1] 4567 	ld xl,a 
      0097AD CD 90            [ 1] 4568 	ld a,#TK_INTGR
      001A67                       4569 	_drop VSIZE
      0097AF 13 F6            [ 2]    1     addw sp,#VSIZE 
      0097B1 14               [ 4] 4570 	ret
                                   4571 
                                   4572 ;-----------------------
                                   4573 ; BASIC: DWRITE pin,0|1
                                   4574 ; write to a digital pin 
                                   4575 ; pin# {0..15}
                                   4576 ; output:
                                   4577 ;    A 		TK_INTGR
                                   4578 ;    X      0|1 
                                   4579 ;-------------------------
                           000001  4580 	PINNO=1
                           000002  4581 	PINVAL=2
                           000002  4582 	VSIZE=2
      001A6A                       4583 digital_write:
      001A6A                       4584 	_vars VSIZE 
      0097B2 02 18            [ 2]    1     sub sp,#VSIZE 
      0097B4 01 27 F9         [ 4] 4585 	call arg_list  
      0097B7 5B 04            [ 1] 4586 	cp a,#2 
      0097B9 81 03            [ 1] 4587 	jreq 1$
      0097BA CC 07 14         [ 2] 4588 	jp syntax_error
      0097BA CD 92 33         [ 4] 4589 1$: call dpop 
      0097BD A1               [ 1] 4590 	ld a,xl 
      0097BE 02 27            [ 1] 4591 	ld (PINVAL,sp),a
      0097C0 03 CC 87         [ 4] 4592 	call dpop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0097C3 94 00 0F         [ 2] 4593 	cpw x,#15 
      0097C4 23 05            [ 2] 4594 	jrule 2$
      0097C4 CD 90            [ 1] 4595 	ld a,#ERR_BAD_VALUE
      0097C6 13 9F CD         [ 2] 4596 	jp tb_error 
      0097C9 90 13 FA         [ 4] 4597 2$:	call select_pin 
      0097CC F7 81            [ 1] 4598 	ld (PINNO,sp),a 
      0097CE A6 01            [ 1] 4599 	ld a,#1
      0097CE CD 92            [ 1] 4600 	tnz (PINNO,sp)
      0097D0 33 A1            [ 1] 4601 	jreq 4$
      0097D2 02               [ 1] 4602 3$: sll a
      0097D3 27 03            [ 1] 4603 	dec (PINNO,sp)
      0097D5 CC 87            [ 1] 4604 	jrne 3$
      0097D7 94 02            [ 1] 4605 4$: tnz (PINVAL,sp)
      0097D8 26 05            [ 1] 4606 	jrne 5$
      0097D8 CD               [ 1] 4607 	cpl a 
      0097D9 90 13            [ 1] 4608 	and a,(GPIO_ODR,x)
      0097DB 9F 43            [ 2] 4609 	jra 8$
      0097DD CD 90            [ 1] 4610 5$: or a,(GPIO_ODR,x)
      0097DF 13 F4            [ 1] 4611 8$: ld (GPIO_ODR,x),a 
      001AA6                       4612 	_drop VSIZE 
      0097E1 F7 81            [ 2]    1     addw sp,#VSIZE 
      0097E3 81               [ 4] 4613 	ret
                                   4614 
                                   4615 
                                   4616 ;-----------------------
                                   4617 ; BASIC: BREAK 
                                   4618 ; insert a breakpoint 
                                   4619 ; in pogram. 
                                   4620 ; the program is resumed
                                   4621 ; with RUN 
                                   4622 ;-------------------------
      001AA9                       4623 break:
      0097E3 CD 92 33 A1 02   [ 2] 4624 	btjt flags,#FRUN,2$
      0097E8 27               [ 1] 4625 	clr a
      0097E9 03               [ 4] 4626 	ret 
      001AB0                       4627 2$:	 
                                   4628 ; create space on cstack to save context 
      0097EA CC 87 94         [ 2] 4629 	ldw x,#break_point 
      0097ED CD 90 13         [ 4] 4630 	call puts 
      001AB6                       4631 	_drop 2 ;drop return address 
      0097F0 9F CD            [ 2]    1     addw sp,#2 
      001AB8                       4632 	_vars CTXT_SIZE ; context size 
      0097F2 90 13            [ 2]    1     sub sp,#CTXT_SIZE 
      0097F4 F8 F7 81         [ 4] 4633 	call save_context 
      0097F7 AE 16 C8         [ 2] 4634 	ldw x,#tib 
      0097F7 CD 92 57         [ 2] 4635 	ldw basicptr,x
      0097FA A1               [ 1] 4636 	clr (x)
      0097FB 02 27 03 CC      [ 1] 4637 	clr count  
      0097FF 87               [ 1] 4638 	clrw x 
      009800 94 00 00         [ 2] 4639 	ldw in.w,x
      009801 72 11 00 1F      [ 1] 4640 	bres flags,#FRUN 
      009801 CD 90 13 9F      [ 1] 4641 	bset flags,#FBREAK
      009805 A4 07 88         [ 2] 4642 	jp interp_loop 
      009808 A6 01 0D 01 27 05 48  4643 break_point: .asciz "\nbreak point, RUN to resume.\n"
             0A 01 20 F7 CD 90 13
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal  F4-Bits]



             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4644 
                                   4645 ;-----------------------
                                   4646 ; BASIC: NEW
                                   4647 ; from command line only 
                                   4648 ; free program memory
                                   4649 ; and clear variables 
                                   4650 ;------------------------
      001AF5                       4651 new: 
      009817 27 02 A6 01 5F   [ 2] 4652 	btjf flags,#FRUN,0$ 
      00981C 97               [ 1] 4653 	clr a 
      00981D A6               [ 4] 4654 	ret 
      001AFC                       4655 0$:	
      00981E 04 5B 01         [ 4] 4656 	call clear_basic 
      009821 81               [ 4] 4657 	ret 
                                   4658 	 
                                   4659 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4660 ;   file system routines
                                   4661 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4662 
                                   4663 ;--------------------
                                   4664 ; input:
                                   4665 ;   X     increment 
                                   4666 ; output:
                                   4667 ;   farptr  incremented 
                                   4668 ;---------------------
      009822                       4669 incr_farptr:
      009822 CD 92 33 A1      [ 2] 4670 	addw x,farptr+1 
      009826 02 27            [ 1] 4671 	jrnc 1$
      009828 03 CC 87 94      [ 1] 4672 	inc farptr 
      00982C CF 00 11         [ 2] 4673 1$:	ldw farptr+1,x  
      00982C CD               [ 4] 4674 	ret 
                                   4675 
                                   4676 ;------------------------------
                                   4677 ; extended flash memory used as FLASH_DRIVE 
                                   4678 ; seek end of used flash drive   
                                   4679 ; starting at 0x10000 address.
                                   4680 ; 4 consecutives 0 bytes signal free space. 
                                   4681 ; input:
                                   4682 ;	none
                                   4683 ; output:
                                   4684 ;   ffree     free_addr| 0 if memory full.
                                   4685 ;------------------------------
      001B0E                       4686 seek_fdrive:
                                   4687 ; start scan at 0x10000 address 
      00982D 90 13            [ 1] 4688 	ld a,#1
      00982F 9F CD 90         [ 1] 4689 	ld farptr,a 
      009832 13               [ 1] 4690 	clrw x 
      009833 F7 81 11         [ 2] 4691 	ldw farptr+1,x 
      009835                       4692 1$:
      009835 CD 92 57         [ 2] 4693 	ldw x,#3  
      009838 A1 01 27 03      [ 5] 4694 2$:	ldf a,([farptr],x) 
      00983C CC 87            [ 1] 4695 	jrne 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      00983E 94               [ 2] 4696 	decw x
      00983F CD 90            [ 1] 4697 	jrpl 2$
      009841 13 F6            [ 2] 4698 	jra 4$ 
      009843 5F               [ 1] 4699 3$:	incw x 
      009844 97 A6 04         [ 4] 4700 	call incr_farptr
      009847 81 02 7F         [ 2] 4701 	ldw x,#0x27f 
      009848 C3 00 10         [ 2] 4702 	cpw x,farptr
      009848 CD 93            [ 1] 4703 	jrpl 1$
                                   4704 ; drive full 
      00984A 7B A1 04 27      [ 1] 4705 	clr ffree 
      00984E 03 CC 87 94      [ 1] 4706 	clr ffree+1 
      009852 4F 5D 26 05      [ 1] 4707 	clr ffree+2 
      009856 55               [ 4] 4708 	ret
      001B3E                       4709 4$: ; copy farptr to ffree	 
      009857 00 04 00         [ 2] 4710 	ldw x,farptr 
      00985A 02 81 12         [ 1] 4711 	ld a,farptr+2 
      00985C CF 00 13         [ 2] 4712 	ldw ffree,x 
      00985C A6 05 CD         [ 1] 4713 	ld ffree+2,a  
      00985F 92               [ 4] 4714 	ret 
                                   4715 
                                   4716 ;-----------------------
                                   4717 ; compare file name 
                                   4718 ; with name pointed by Y  
                                   4719 ; input:
                                   4720 ;   farptr   file name 
                                   4721 ;   Y        target name 
                                   4722 ; output:
                                   4723 ;   farptr 	 at file_name
                                   4724 ;   X 		 farptr[x] point at size field  
                                   4725 ;   Carry    0|1 no match|match  
                                   4726 ;----------------------
      001B4B                       4727 cmp_name:
      009860 26               [ 1] 4728 	clrw x
      009861 CD 90 06 CD      [ 5] 4729 1$:	ldf a,([farptr],x)
      009865 94 22            [ 1] 4730 	cp a,(y)
      009867 72 14            [ 1] 4731 	jrne 4$
      009869 00               [ 1] 4732 	tnz a 
      00986A 20 85            [ 1] 4733 	jreq 9$ 
      00986C 52               [ 1] 4734     incw x 
      00986D 04 89            [ 1] 4735 	incw y 
      00986F 5F 1F            [ 2] 4736 	jra 1$
      001B5C                       4737 4$: ;no match 
      009871 05               [ 1] 4738 	tnz a 
      009872 1F 03            [ 1] 4739 	jreq 5$
      009874 CD               [ 1] 4740 	incw x 
      009875 88 74 A1 06      [ 5] 4741 	ldf a,([farptr],x)
      009879 27 03            [ 2] 4742 	jra 4$  
      00987B CC               [ 1] 4743 5$:	incw x ; farptr[x] point at 'size' field 
      00987C 87               [ 1] 4744 	rcf 
      00987D 94               [ 4] 4745 	ret
      00987E                       4746 9$: ; match  
      00987E A3               [ 1] 4747 	incw x  ; farptr[x] at 'size' field 
      00987F 98               [ 1] 4748 	scf 
      009880 86               [ 4] 4749 	ret 
                                   4750 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4751 ;-----------------------
                                   4752 ; search file in 
                                   4753 ; flash memory 
                                   4754 ; input:
                                   4755 ;   Y       file name  
                                   4756 ; output:
                                   4757 ;   farptr  addr at name|0
                                   4758 ;-----------------------
                           000001  4759 	FSIZE=1
                           000003  4760 	YSAVE=3
                           000004  4761 	VSIZE=4 
      001B6C                       4762 search_file: 
      001B6C                       4763 	_vars VSIZE
      009881 27 03            [ 2]    1     sub sp,#VSIZE 
      009883 CC 87            [ 2] 4764 	ldw (YSAVE,sp),y  
      009885 94               [ 1] 4765 	clrw x 
      009886 CF 00 11         [ 2] 4766 	ldw farptr+1,x 
      009886 72 04 00 20      [ 1] 4767 	mov farptr,#1
      001B78                       4768 1$:	
                                   4769 ; check if farptr is after any file 
                                   4770 ; if  0 then so.
      00988A 03 CC 87 94      [ 5] 4771 	ldf a,[farptr]
      00988E CD 93            [ 1] 4772 	jreq 6$
      009890 7B               [ 1] 4773 2$: clrw x 	
      009891 A1 04            [ 2] 4774 	ldw y,(YSAVE,sp) 
      009893 27 03 CC         [ 4] 4775 	call cmp_name
      009896 87 94            [ 1] 4776 	jrc 9$
      009898 92 AF 00 10      [ 5] 4777 	ldf a,([farptr],x)
      009898 CD 90            [ 1] 4778 	ld (FSIZE,sp),a 
      00989A 06               [ 1] 4779 	incw x 
      00989B CE 00 01 CD      [ 5] 4780 	ldf a,([farptr],x)
      00989F 88 74            [ 1] 4781 	ld (FSIZE+1,sp),a 
      0098A1 A1               [ 1] 4782 	incw x 
      0098A2 00 27 0C         [ 2] 4783 	addw x,(FSIZE,sp) ; count to skip 
      0098A5 A1               [ 1] 4784 	incw x ; skip over EOF marker 
      0098A6 06 26 05         [ 4] 4785 	call incr_farptr ; now at next file 'name_field'
      0098A9 A3 98 B6         [ 2] 4786 	ldw x,#0x280
      0098AC 27 08 10         [ 2] 4787 	cpw x,farptr 
      0098AE 2A D5            [ 1] 4788 	jrpl 1$
      001BA3                       4789 6$: ; file not found 
      0098AE CD 90 00 10      [ 1] 4790 	clr farptr
      0098B1 72 5F 00 11      [ 1] 4791 	clr farptr+1 
      0098B1 AE 00 01 20      [ 1] 4792 	clr farptr+2 
      001BAF                       4793 	_drop VSIZE 
      0098B5 12 04            [ 2]    1     addw sp,#VSIZE 
      0098B6 98               [ 1] 4794 	rcf
      0098B6 72               [ 4] 4795 	ret
      001BB3                       4796 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001BB3                       4797 	_drop VSIZE 
      0098B7 04 00            [ 2]    1     addw sp,#VSIZE 
      0098B9 20               [ 1] 4798 	scf 	
      0098BA 03               [ 4] 4799 	ret
                                   4800 
                                   4801 ;--------------------------------
                                   4802 ; BASIC: SAVE "name" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4803 ; save text program in 
                                   4804 ; flash memory used as 
                                   4805 ;--------------------------------
                           000001  4806 	BSIZE=1
                           000003  4807 	NAMEPTR=3
                           000004  4808 	VSIZE=4
      001BB7                       4809 save:
      0098BB CC 87 94 CD 93   [ 2] 4810 	btjf flags,#FRUN,0$ 
      0098C0 7B A1            [ 1] 4811 	ld a,#ERR_CMD_ONLY 
      0098C2 04 27 03         [ 2] 4812 	jp tb_error
      001BC1                       4813 0$:	 
      0098C5 CC 87 94         [ 2] 4814 	ldw x,txtend 
      0098C8 72 B0 00 18      [ 2] 4815 	subw x,txtbgn
      0098C8 CD 90            [ 1] 4816 	jrne 1$
                                   4817 ; nothing to save 
      0098CA 06               [ 4] 4818 	ret 
      001BCB                       4819 1$:	
      001BCB                       4820 	_vars VSIZE 
      0098CB CE 00            [ 2]    1     sub sp,#VSIZE 
      0098CD 05 1F            [ 2] 4821 	ldw (BSIZE,sp),x 
      0098CF 05 CE 00         [ 4] 4822 	call next_token	
      0098D2 01 1F            [ 1] 4823 	cp a,#TK_QSTR
      0098D4 03 72            [ 1] 4824 	jreq 2$
      0098D6 15 00 20         [ 2] 4825 	jp syntax_error
      001BD9                       4826 2$: 
      0098D9 72 5C 00 1D      [ 2] 4827 	ldw y,basicptr 
      0098DD 81 B9 00 00      [ 2] 4828 	addw y,in.w
      0098DE 17 03            [ 2] 4829 	ldw (NAMEPTR,sp),y  
      0098DE 72 5D 00 1D 26   [ 1] 4830 	mov in,count 
                                   4831 ; check if enough free space 
      0098E3 03               [ 1] 4832 	ldw x,y 
      0098E4 CC 87 94         [ 4] 4833 	call strlen 
      0098E7 1C 00 03         [ 2] 4834 	addw x,#3 
      0098E7 A6 05 CD         [ 2] 4835 	addw x,(BSIZE,sp)
      0098EA 92 26 90 93      [ 1] 4836 	tnz ffree 
      0098EE AE 00            [ 1] 4837 	jrne 21$
      0098F0 04 72 D3 00      [ 2] 4838 	subw x,ffree+1 
      0098F4 17 27            [ 2] 4839 	jrule 21$
      0098F6 03 CC            [ 1] 4840 	ld a,#ERR_MEM_FULL 
      0098F8 87 94 16         [ 2] 4841 	jp tb_error
      0098FA                       4842 21$: 
                                   4843 ; check for existing file of that name 
      0098FA 93 FE            [ 2] 4844 	ldw y,(NAMEPTR,sp)	
      0098FC CF 00 09         [ 4] 4845 	call search_file 
      0098FF 72 CE            [ 1] 4846 	jrnc 3$ 
      009901 00 17            [ 1] 4847 	ld a,#ERR_DUPLICATE 
      009903 72 BB 00         [ 2] 4848 	jp tb_error 
      001C0F                       4849 3$:	;** write file name to flash **
      009906 09 90 FF         [ 2] 4850 	ldw x,ffree 
      009909 90 93 72         [ 1] 4851 	ld a,ffree+2 
      00990C CE 00 17         [ 2] 4852 	ldw farptr,x 
      00990F 5D 2A 0B         [ 1] 4853 	ld farptr+2,a 
      009912 AE 00            [ 2] 4854 	ldw x,(NAMEPTR,sp)  
      009914 02 72 D3         [ 4] 4855 	call strlen 
      009917 00               [ 1] 4856 	incw  x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009918 17 2F            [ 2] 4857 	ldw (BSIZE,sp),x  
      00991A 20               [ 1] 4858 	clrw x   
      00991B 20 09            [ 2] 4859 	ldw y,(NAMEPTR,sp)
      00991D CD 01 55         [ 4] 4860 	call write_block  
                                   4861 ;** write file length after name **
      00991D AE 00 02         [ 2] 4862 	ldw x,txtend 
      009920 72 D3 00 17      [ 2] 4863 	subw x,txtbgn
      009924 2C 15            [ 2] 4864 	ldw (BSIZE,sp),x 
      009926 5F               [ 1] 4865 	clrw x 
      009926 1E 05            [ 1] 4866 	ld a,(1,sp)
      009928 CF 00 05         [ 4] 4867 	call write_byte 
      00992B 72               [ 1] 4868 	incw x 
      00992C 01 00            [ 1] 4869 	ld a,(2,sp)
      00992E 20 05 E6         [ 4] 4870 	call write_byte
      009931 02               [ 1] 4871 	incw x  
      009932 C7 00 04         [ 4] 4872 	call incr_farptr ; move farptr after SIZE field 
                                   4873 ;** write BASIC text **
                                   4874 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009935 1E 03            [ 2] 4875 	ldw x,(BSIZE,sp)
      009937 CF               [ 2] 4876 	pushw x ; write_block argument 
      009938 00               [ 1] 4877 	clrw x 
      009939 01 81 00 18      [ 2] 4878 	ldw y,txtbgn  ; BASIC text to save 
      00993B CD 01 55         [ 4] 4879 	call write_block 
      001C4D                       4880 	_drop 2 ;  drop write_block argument  
      00993B CE 00            [ 2]    1     addw sp,#2 
                                   4881 ; write en end of file marker 
      00993D 17 1C 00         [ 2] 4882 	ldw x,#1
      009940 06 CF            [ 1] 4883 	ld a,#EOF  
      009942 00 17 85         [ 4] 4884 	call write_byte 
      009945 5B 04 89         [ 4] 4885 	call incr_farptr
                                   4886 ; save farptr in ffree
      009948 72 5A 00         [ 2] 4887 	ldw x,farptr 
      00994B 1D 81 12         [ 1] 4888 	ld a,farptr+2 
      00994D CF 00 13         [ 2] 4889 	ldw ffree,x 
      00994D 72 00 00         [ 1] 4890 	ld ffree+2,a
                                   4891 ;write 4 zero bytes as an end of all files marker 
      009950 20               [ 1] 4892     clrw x 
      009951 06 A6            [ 1] 4893 	push #4 
      001C69                       4894 4$:
      009953 06               [ 1] 4895 	clr a 
      009954 CC 87 96         [ 4] 4896 	call write_byte 
      009957 81               [ 1] 4897 	incw x 
      009958 20 23            [ 1] 4898 	dec (1,sp)
      00995A 26 F7            [ 1] 4899 	jrne 4$
      00995A 72               [ 1] 4900 5$: pop a 
                                   4901 ; display saved size  
      00995B 00 00            [ 2] 4902 	ldw x,(BSIZE,sp) 
      00995D 20 06 A6         [ 4] 4903 	call print_int 
      001C78                       4904 	_drop VSIZE 
      009960 06 CC            [ 2]    1     addw sp,#VSIZE 
      009962 87               [ 4] 4905 	ret 
                                   4906 
                                   4907 
                                   4908 ;------------------------
                                   4909 ; BASIC: LOAD "file" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4910 ; load file to RAM 
                                   4911 ; for execution 
                                   4912 ;------------------------
      001C7B                       4913 load:
      009963 96 81 85 52 02   [ 2] 4914 	btjf flags,#FRUN,0$ 
      009968 89 CE            [ 1] 4915 	jreq 0$ 
      00996A 00 05            [ 1] 4916 	ld a,#ERR_CMD_ONLY 
      00996C E6 02 AB         [ 2] 4917 	jp tb_error 
      001C87                       4918 0$:	
      00996F 03 C7 00         [ 4] 4919 	call next_token 
      009972 0A 72            [ 1] 4920 	cp a,#TK_QSTR
      009974 5F 00            [ 1] 4921 	jreq 1$
      009976 09 72 BB         [ 2] 4922 	jp syntax_error 
      001C91                       4923 1$:	
      009979 00 09 1F 03      [ 2] 4924 	ldw y,basicptr
      00997D 72 B9 00 00      [ 2] 4925 	addw y,in.w 
      00997D CD 93 7B A1 04   [ 1] 4926 	mov in,count 
      009982 27 03 CC         [ 4] 4927 	call search_file 
      009985 87 94            [ 1] 4928 	jrc 2$ 
      009987 A6 09            [ 1] 4929 	ld a,#ERR_NOT_FILE
      009987 CD 83 68         [ 2] 4930 	jp tb_error  
      001CA8                       4931 2$:	
      00998A 5D 26 05         [ 4] 4932 	call incr_farptr  
      00998D A6 05 CC         [ 4] 4933 	call clear_basic  
      009990 87               [ 1] 4934 	clrw x
      009991 96 AF 00 10      [ 5] 4935 	ldf a,([farptr],x)
      009992 90 95            [ 1] 4936 	ld yh,a 
      009992 CF               [ 1] 4937 	incw x  
      009993 00 05 E6 02      [ 5] 4938 	ldf a,([farptr],x)
      009997 C7               [ 1] 4939 	incw x 
      009998 00 04            [ 1] 4940 	ld yl,a 
      00999A 35 03 00 02      [ 2] 4941 	addw y,txtbgn
      00999E 81 CF 00 1A      [ 2] 4942 	ldw txtend,y
      00999F 90 CE 00 18      [ 2] 4943 	ldw y,txtbgn
      001CC9                       4944 3$:	; load BASIC text 	
      00999F 72 00 00 20      [ 5] 4945 	ldf a,([farptr],x)
      0099A3 05 A6            [ 1] 4946 	ld (y),a 
      0099A5 06               [ 1] 4947 	incw x 
      0099A6 CC 87            [ 1] 4948 	incw y 
      0099A8 96 C3 00 1A      [ 2] 4949 	cpw y,txtend 
      0099A9 2B F1            [ 1] 4950 	jrmi 3$
                                   4951 ; print loaded size 	 
      0099A9 1E 03 CF         [ 2] 4952 	ldw x,txtend 
      0099AC 00 05 E6 02      [ 2] 4953 	subw x,txtbgn
      0099B0 AB 03 C7         [ 4] 4954 	call print_int 
      0099B3 00               [ 4] 4955 	ret 
                                   4956 
                                   4957 ;-----------------------------------
                                   4958 ; BASIC: FORGET ["file_name"] 
                                   4959 ; erase file_name and all others 
                                   4960 ; after it. 
                                   4961 ; without argument erase all files 
                                   4962 ;-----------------------------------
      001CE3                       4963 forget:
      0099B4 04 35 03         [ 4] 4964 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      0099B7 00 02            [ 1] 4965 	cp a,#TK_NONE 
      0099B9 4F 85            [ 1] 4966 	jreq 3$ 
      0099BB 5B 02            [ 1] 4967 	cp a,#TK_QSTR
      0099BD 89 81            [ 1] 4968 	jreq 1$
      0099BF CC 07 14         [ 2] 4969 	jp syntax_error
      0099BF 72 01 00 20      [ 2] 4970 1$: ldw y,basicptr
      0099C3 02 4F 81 00      [ 2] 4971 	addw y,in.w
      0099C6 55 00 03 00 01   [ 1] 4972 	mov in,count 
      0099C6 72 09 00         [ 4] 4973 	call search_file
      0099C9 20 12            [ 1] 4974 	jrc 2$
      0099CB 5B 02            [ 1] 4975 	ld a,#ERR_NOT_FILE 
      0099CD CD 97 05         [ 2] 4976 	jp tb_error 
      001D08                       4977 2$: 
      0099D0 5B 06 72         [ 2] 4978 	ldw x,farptr
      0099D3 19 00 20         [ 1] 4979 	ld a,farptr+2
      0099D6 72 10            [ 2] 4980 	jra 4$ 
      001D10                       4981 3$: ; forget all files 
      0099D8 00 20 CC         [ 2] 4982 	ldw x,#0x100
      0099DB 88               [ 1] 4983 	clr a 
      0099DC 44 CE 00         [ 2] 4984 	ldw farptr,x 
      0099DF 19 C3 00         [ 1] 4985 	ld farptr+2,a 
      001D1A                       4986 4$:
      0099E2 1B 2B 02         [ 2] 4987 	ldw ffree,x 
      0099E5 4F 81 CD         [ 1] 4988 	ld ffree+2,a 
      0099E8 93 F6            [ 1] 4989 	push #4
      0099EA 5B               [ 1] 4990 	clrw x 
      001D23                       4991 5$: 
      0099EB 02               [ 1] 4992 	clr a  
      0099EC CE 00 19         [ 4] 4993 	call write_byte 
      0099EF CF               [ 1] 4994 	incw x 
      0099F0 00 05            [ 1] 4995 	dec (1,sp)
      0099F2 E6 02            [ 1] 4996 	jrne 5$	
      0099F4 C7               [ 1] 4997 6$: pop a 
      0099F5 00               [ 4] 4998 	ret 
                                   4999 
                                   5000 ;----------------------
                                   5001 ; BASIC: DIR 
                                   5002 ; list saved files 
                                   5003 ;----------------------
                           000001  5004 	COUNT=1 ; files counter 
                           000002  5005 	VSIZE=2 
      001D2E                       5006 directory:
      001D2E                       5007 	_vars VSIZE 
      0099F6 04 35            [ 2]    1     sub sp,#VSIZE 
      0099F8 03               [ 1] 5008 	clrw x 
      0099F9 00 02            [ 2] 5009 	ldw (COUNT,sp),x 
      0099FB 72 10 00         [ 2] 5010 	ldw farptr+1,x 
      0099FE 20 CC 88 44      [ 1] 5011 	mov farptr,#1 
      009A02                       5012 dir_loop:
      009A02 AE               [ 1] 5013 	clrw x 
      009A03 17 FF 94 72      [ 5] 5014 	ldf a,([farptr],x)
      009A07 11 00            [ 1] 5015 	jreq 8$ 
      001D41                       5016 1$: ;name loop 	
      009A09 20 72 19 00      [ 5] 5017 	ldf a,([farptr],x)
      009A0D 20 CC            [ 1] 5018 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009A0F 87 E8 A6         [ 4] 5019 	call putc 
      009A11 5C               [ 1] 5020 	incw x 
      009A11 CD 92            [ 2] 5021 	jra 1$
      009A13 33               [ 1] 5022 2$: incw x ; skip ending 0. 
      009A14 A1 02            [ 1] 5023 	ld a,#SPACE 
      009A16 27 03 CC         [ 4] 5024 	call putc 
                                   5025 ; get file size 	
      009A19 87 94 00 10      [ 5] 5026 	ldf a,([farptr],x)
      009A1B 90 95            [ 1] 5027 	ld yh,a 
      009A1B CE               [ 1] 5028 	incw x 
      009A1C 00 17 EE 02      [ 5] 5029 	ldf a,([farptr],x)
      009A20 A6               [ 1] 5030 	incw x 
      009A21 1F 62            [ 1] 5031 	ld yl,a 
      009A23 C7 50            [ 2] 5032 	pushw y 
      009A25 F3 72 1A         [ 2] 5033 	addw x,(1,sp)
      009A28 50               [ 1] 5034 	incw x ; skip EOF marker 
                                   5035 ; skip to next file 
      009A29 F3 CD 90         [ 4] 5036 	call incr_farptr 
                                   5037 ; print file size 
      009A2C 13               [ 2] 5038 	popw x ; file size 
      009A2D CD 9F 31         [ 4] 5039 	call print_int 
      009A30 CD 90            [ 1] 5040 	ld a,#CR 
      009A32 3A A6 1F         [ 4] 5041 	call putc
      009A35 C7 50            [ 2] 5042 	ldw x,(COUNT,sp)
      009A37 F3               [ 1] 5043 	incw x
      009A38 81 01            [ 2] 5044 	ldw (COUNT,sp),x  
      009A39 20 C0            [ 2] 5045 	jra dir_loop 
      001D7A                       5046 8$: ; print number of files 
      009A39 CD 92            [ 2] 5047 	ldw x,(COUNT,sp)
      009A3B 33 A1 02         [ 4] 5048 	call print_int 
      009A3E 27 0D A1         [ 2] 5049 	ldw x,#file_count 
      009A41 01 27 03         [ 4] 5050 	call puts  
                                   5051 ; print drive free space 	
      009A44 CC 87            [ 1] 5052 	ld a,#0xff 
      009A46 94 AE 00         [ 1] 5053 	sub a,ffree+2 
      009A49 00 CD 90         [ 1] 5054 	ld acc8,a 
      009A4C 06 AE            [ 1] 5055 	ld a,#0x7f 
      009A4E 00 02 72         [ 1] 5056 	sbc a,ffree+1 
      009A51 DE 00 17         [ 1] 5057 	ld acc16,a 
      009A54 5D 27            [ 1] 5058 	ld a,#2 
      009A56 1C 72 CE         [ 1] 5059 	sbc a,ffree 
      009A59 00 17 9F         [ 1] 5060 	ld acc24,a 
      009A5C A4               [ 1] 5061 	clrw x  
      009A5D 07 4E            [ 1] 5062 	ld a,#6 
      009A5F C7               [ 1] 5063 	ld xl,a 
      009A60 54 01            [ 1] 5064 	ld a,#10 
      009A62 72 16 50         [ 4] 5065 	call prti24 
      009A65 CA 72 10         [ 2] 5066 	ldw x,#drive_free
      009A68 54 01 AE         [ 4] 5067 	call puts 
      001DAC                       5068 	_drop VSIZE 
      009A6B 00 1B            [ 2]    1     addw sp,#VSIZE 
      009A6D 5A               [ 4] 5069 	ret
      009A6E 9D 26 FA 20 08 72 11  5070 file_count: .asciz " files\n"
             54
      009A76 01 72 17 50 CA AE 00  5071 drive_free: .asciz " bytes free\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal  02-Bits]



             66 72 65 65 0A 00
                                   5072 
                                   5073 ;---------------------
                                   5074 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5075 ; write 1 or more byte to FLASH or EEPROM
                                   5076 ; starting at address  
                                   5077 ; input:
                                   5078 ;   expr1  	is address 
                                   5079 ;   expr2   is byte to write
                                   5080 ; output:
                                   5081 ;   none 
                                   5082 ;---------------------
                           000001  5083 	ADDR=1
                           000002  5084 	VSIZ=2 
      001DC4                       5085 write:
      001DC4                       5086 	_vars VSIZE 
      009A7E CD 90            [ 2]    1     sub sp,#VSIZE 
      009A80 77 81 00 10      [ 1] 5087 	clr farptr ; expect 16 bits address 
      009A82 CD 12 B7         [ 4] 5088 	call expression
      009A82 CD 92            [ 1] 5089 	cp a,#TK_INTGR 
      009A84 57 A1            [ 1] 5090 	jreq 0$
      009A86 01 27 03         [ 2] 5091 	jp syntax_error
      009A89 CC 87            [ 2] 5092 0$: ldw (ADDR,sp),x 
      009A8B 94 CD 90         [ 4] 5093 	call next_token 
      009A8E 13 A3            [ 1] 5094 	cp a,#TK_COMMA 
      009A90 00 05            [ 1] 5095 	jreq 1$ 
      009A92 23 05            [ 2] 5096 	jra 9$ 
      009A94 A6 0A CC         [ 4] 5097 1$:	call expression
      009A97 87 96            [ 1] 5098 	cp a,#TK_INTGR
      009A99 9F C7            [ 1] 5099 	jreq 2$
      009A9B 00 0A A6         [ 2] 5100 	jp syntax_error
      009A9E 05               [ 1] 5101 2$:	ld a,xl 
      009A9F C0 00            [ 2] 5102 	ldw x,(ADDR,sp) 
      009AA1 0A C7 54         [ 2] 5103 	ldw farptr+1,x 
      009AA4 00               [ 1] 5104 	clrw x 
      009AA5 72 16 54         [ 4] 5105 	call write_byte
      009AA8 02 72            [ 2] 5106 	ldw x,(ADDR,sp)
      009AAA 10               [ 1] 5107 	incw x 
      009AAB 54 01            [ 2] 5108 	jra 0$ 
      001DF8                       5109 9$:
      001DF8                       5110 	_drop VSIZE
      009AAD 72 0F            [ 2]    1     addw sp,#VSIZE 
      009AAF 54               [ 4] 5111 	ret 
                                   5112 
                                   5113 
                                   5114 ;---------------------
                                   5115 ;BASIC: CHAR(expr)
                                   5116 ; évaluate expression 
                                   5117 ; and take the 7 least 
                                   5118 ; bits as ASCII character
                                   5119 ;---------------------
      001DFB                       5120 char:
      009AB0 00 FB CE         [ 4] 5121 	call func_args 
      009AB3 54 04            [ 1] 5122 	cp a,#1
      009AB5 A6 04            [ 1] 5123 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009AB7 81 07 14         [ 2] 5124 	jp syntax_error
      009AB8 CD 0F 93         [ 4] 5125 1$:	call dpop 
      009AB8 52               [ 1] 5126 	ld a,xl 
      009AB9 01 CD            [ 1] 5127 	and a,#0x7f 
      009ABB 92               [ 1] 5128 	ld xl,a
      009ABC 57 A1            [ 1] 5129 	ld a,#TK_CHAR
      009ABE 01               [ 4] 5130 	ret
                                   5131 
                                   5132 ;---------------------
                                   5133 ; BASIC: ASC(string|char)
                                   5134 ; extract first character 
                                   5135 ; of string argument 
                                   5136 ; return it as TK_INTGR 
                                   5137 ;---------------------
      001E0F                       5138 ascii:
      009ABF 27 03 CC         [ 4] 5139 	call func_args 
      009AC2 87 94 CD         [ 4] 5140 	call next_token 
      009AC5 90 13            [ 1] 5141 	cp a,#TK_QSTR 
      009AC7 A3 00            [ 1] 5142 	jreq 1$
      009AC9 0F 23            [ 1] 5143 	cp a,#TK_CHAR 
      009ACB 05 A6            [ 1] 5144 	jreq 2$ 
      009ACD 0A CC 87         [ 2] 5145 	jp syntax_error
      001E20                       5146 1$: 
      009AD0 96               [ 1] 5147 	ld a,(x)
      009AD1 CD A0            [ 2] 5148 	jra 3$
      001E23                       5149 2$: 
      009AD3 3B               [ 1] 5150 	ld a,xl 
      009AD4 6B               [ 1] 5151 3$:	ld xl,a 
      009AD5 01               [ 1] 5152 	clr a  
      009AD6 E6               [ 1] 5153 	ld xh,a 
      009AD7 01 0D            [ 1] 5154 	ld a,#TK_INTGR 
      009AD9 01               [ 4] 5155 	ret 
                                   5156 
                                   5157 ;---------------------
                                   5158 ;BASIC: KEY
                                   5159 ; wait for a character 
                                   5160 ; received from STDIN 
                                   5161 ; input:
                                   5162 ;	none 
                                   5163 ; output:
                                   5164 ;	X 		ASCII character 
                                   5165 ;---------------------
      001E2A                       5166 key:
      009ADA 27 05 44         [ 4] 5167 	call getc 
      009ADD 0A               [ 1] 5168 	clrw x 
      009ADE 01               [ 1] 5169 	ld xl,a 
      009ADF 26 FB            [ 1] 5170 	ld a,#TK_INTGR
      009AE1 A4               [ 4] 5171 	ret
                                   5172 
                                   5173 ;----------------------
                                   5174 ; BASIC: QKEY
                                   5175 ; Return true if there 
                                   5176 ; is a character in 
                                   5177 ; waiting in STDIN 
                                   5178 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5179 ;  none 
                                   5180 ; output:
                                   5181 ;   X 		0|1 
                                   5182 ;-----------------------
      001E32                       5183 qkey: 
      009AE2 01               [ 1] 5184 	clrw x 
      009AE3 5F 97 A6 04 5B   [ 2] 5185 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      009AE8 01               [ 1] 5186 	incw x 
      009AE9 81 04            [ 1] 5187 9$: ld a,#TK_INTGR
      009AEA 81               [ 4] 5188 	ret 
                                   5189 
                                   5190 ;---------------------
                                   5191 ; BASIC: GPIO(expr,reg)
                                   5192 ; return gpio address 
                                   5193 ; expr {0..8}
                                   5194 ; input:
                                   5195 ;   none 
                                   5196 ; output:
                                   5197 ;   X 		gpio register address
                                   5198 ;----------------------------
      001E3C                       5199 gpio:
      009AEA 52 02 CD         [ 4] 5200 	call func_args 
      009AED 92 33            [ 1] 5201 	cp a,#2
      009AEF A1 02            [ 1] 5202 	jreq 1$
      009AF1 27 03 CC         [ 2] 5203 	jp syntax_error  
      001E46                       5204 1$:	
      009AF4 87 94 CD         [ 2] 5205 	ldw x,#2
      009AF7 90 13 9F 6B      [ 5] 5206 	ldw x,([dstkptr],x) ; port 
      009AFB 02 CD            [ 1] 5207 	jrmi bad_port
      009AFD 90 13 A3         [ 2] 5208 	cpw x,#9
      009B00 00 0F            [ 1] 5209 	jrpl bad_port
      009B02 23 05            [ 1] 5210 	ld a,#5
      009B04 A6               [ 4] 5211 	mul x,a
      009B05 0A CC 87         [ 2] 5212 	addw x,#GPIO_BASE 
      009B08 96               [ 2] 5213 	pushw x 
      009B09 CD A0 3B         [ 4] 5214 	call dpop 
      009B0C 6B 01 A6         [ 2] 5215 	addw x,(1,sp)
      009B0F 01 0D            [ 2] 5216 	ldw (1,sp),x  
      009B11 01 27 05         [ 4] 5217 	call ddrop  
      009B14 48               [ 2] 5218 	popw x 
      009B15 0A 01            [ 1] 5219 	ld a,#TK_INTGR
      009B17 26               [ 4] 5220 	ret
      001E6A                       5221 bad_port:
      009B18 FB 0D            [ 1] 5222 	ld a,#ERR_BAD_VALUE
      009B1A 02 26 05         [ 2] 5223 	jp tb_error
                                   5224 
                                   5225 
                                   5226 ;-------------------------
                                   5227 ; BASIC: UFLASH 
                                   5228 ; return user flash address
                                   5229 ; input:
                                   5230 ;  none 
                                   5231 ; output:
                                   5232 ;	A		TK_INTGR
                                   5233 ;   X 		user address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5234 ;---------------------------
      001E6F                       5235 uflash:
      009B1D 43 E4 00         [ 2] 5236 	ldw x,#user_space 
      009B20 20 02            [ 1] 5237 	ld a,#TK_INTGR 
      009B22 EA               [ 4] 5238 	ret 
                                   5239 
                                   5240 
                                   5241 ;---------------------
                                   5242 ; BASIC: USR(addr[,arg])
                                   5243 ; execute a function written 
                                   5244 ; in binary code.
                                   5245 ; binary fonction should 
                                   5246 ; return token attribute in A 
                                   5247 ; and value in X. 
                                   5248 ; input:
                                   5249 ;   addr	routine address 
                                   5250 ;   arg 	is an optional argument 
                                   5251 ; output:
                                   5252 ;   A 		token attribute 
                                   5253 ;   X       returned value 
                                   5254 ;---------------------
      001E75                       5255 usr:
      009B23 00 E7            [ 2] 5256 	pushw y 	
      009B25 00 5B 02         [ 4] 5257 	call func_args 
      009B28 81 01            [ 1] 5258 	cp a,#1 
      009B29 2A 03            [ 1] 5259 	jrpl 2$ 
      009B29 72 00 00         [ 2] 5260 	jp syntax_error 
      001E81                       5261 2$: 
      009B2C 20 02 4F         [ 4] 5262 	call dpop 
      009B2F 81 02            [ 1] 5263 	cp a,#2 
      009B30 2B 05            [ 1] 5264 	jrmi 4$
      009B30 AE 9B            [ 1] 5265 	ldw y,x ; y=arg 
      009B32 57 CD 82         [ 4] 5266 	call dpop ;x=addr 
      009B35 38               [ 1] 5267 4$:	exgw y,x ; y=addr,x=arg 
      009B36 5B 02            [ 4] 5268 	call (y)
      009B38 52 06            [ 2] 5269 	popw y 
      009B3A CD               [ 4] 5270 	ret 
                                   5271 
                                   5272 ;------------------------------
                                   5273 ; BASIC: BYE 
                                   5274 ; halt mcu in its lowest power mode 
                                   5275 ; wait for reset or external interrupt
                                   5276 ; do a cold start on wakeup.
                                   5277 ;------------------------------
      001E93                       5278 bye:
      009B3B 96 F5 AE 16 C8   [ 2] 5279 	btjf UART3_SR,#UART_SR_TC,.
      009B40 CF               [10] 5280 	halt
      009B41 00 05 7F         [ 2] 5281 	jp cold_start  
                                   5282 
                                   5283 ;----------------------------------
                                   5284 ; BASIC: SLEEP 
                                   5285 ; halt mcu until reset or external
                                   5286 ; interrupt.
                                   5287 ; Resume progam after SLEEP command
                                   5288 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      001E9C                       5289 sleep:
      009B44 72 5F 00 04 5F   [ 2] 5290 	btjf UART3_SR,#UART_SR_TC,.
      009B49 CF 00 01 72      [ 1] 5291 	bset flags,#FSLEEP
      009B4D 11               [10] 5292 	halt 
      009B4E 00               [ 4] 5293 	ret 
                                   5294 
                                   5295 ;-------------------------------
                                   5296 ; BASIC: PAUSE expr 
                                   5297 ; suspend execution for n msec.
                                   5298 ; input:
                                   5299 ;	none
                                   5300 ; output:
                                   5301 ;	none 
                                   5302 ;------------------------------
      001EA7                       5303 pause:
      009B4F 20 72 18         [ 4] 5304 	call expression
      009B52 00 20            [ 1] 5305 	cp a,#TK_INTGR
      009B54 CC 88            [ 1] 5306 	jreq pause02 
      009B56 44 0A 62         [ 2] 5307 	jp syntax_error
      001EB1                       5308 pause02: 
      009B59 72               [ 2] 5309 1$: tnzw x 
      009B5A 65 61            [ 1] 5310 	jreq 2$
      009B5C 6B               [10] 5311 	wfi 
      009B5D 20               [ 2] 5312 	decw x 
      009B5E 70 6F            [ 1] 5313 	jrne 1$
      009B60 69               [ 1] 5314 2$:	clr a 
      009B61 6E               [ 4] 5315 	ret 
                                   5316 
                                   5317 ;------------------------------
                                   5318 ; BASIC: TICKS
                                   5319 ; return msec ticks counter value 
                                   5320 ; input:
                                   5321 ; 	none 
                                   5322 ; output:
                                   5323 ;	X 		TK_INTGR
                                   5324 ;-------------------------------
      001EBA                       5325 get_ticks:
      009B62 74 2C 20         [ 2] 5326 	ldw x,ticks 
      009B65 52 55            [ 1] 5327 	ld a,#TK_INTGR
      009B67 4E               [ 4] 5328 	ret 
                                   5329 
                                   5330 
                                   5331 
                                   5332 ;------------------------------
                                   5333 ; BASIC: ABS(expr)
                                   5334 ; return absolute value of expr.
                                   5335 ; input:
                                   5336 ;   none
                                   5337 ; output:
                                   5338 ;   X     	positive integer
                                   5339 ;-------------------------------
      001EC0                       5340 abs:
      009B68 20 74 6F         [ 4] 5341 	call func_args 
      009B6B 20 72            [ 1] 5342 	cp a,#1 
      009B6D 65 73            [ 1] 5343 	jreq 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009B6F 75 6D 65         [ 2] 5344 	jp syntax_error
      001ECA                       5345 0$:  
      009B72 2E 0A 00         [ 4] 5346     call dpop   
      009B75 9E               [ 1] 5347 	ld a,xh 
      009B75 72 01            [ 1] 5348 	bcp a,#0x80 
      009B77 00 20            [ 1] 5349 	jreq 2$ 
      009B79 02               [ 2] 5350 	negw x 
      009B7A 4F 81            [ 1] 5351 2$: ld a,#TK_INTGR 
      009B7C 81               [ 4] 5352 	ret 
                                   5353 
                                   5354 ;------------------------------
                                   5355 ; BASIC: AND(expr1,expr2)
                                   5356 ; Apply bit AND relation between
                                   5357 ; the 2 arguments, i.e expr1 & expr2 
                                   5358 ; output:
                                   5359 ; 	A 		TK_INTGR
                                   5360 ;   X 		result 
                                   5361 ;------------------------------
      001ED6                       5362 bit_and:
      009B7C CD 86 66         [ 4] 5363 	call func_args 
      009B7F 81 02            [ 1] 5364 	cp a,#2
      009B80 27 03            [ 1] 5365 	jreq 1$
      009B80 72 BB 00         [ 2] 5366 	jp syntax_error 
      009B83 12 24 04         [ 4] 5367 1$:	call dpop 
      009B86 72               [ 2] 5368 	pushw x 
      009B87 5C 00 11         [ 4] 5369 	call dpop 
      009B8A CF               [ 1] 5370 	ld a,xh 
      009B8B 00 12            [ 1] 5371 	and a,(1,sp)
      009B8D 81               [ 1] 5372 	ld xh,a 
      009B8E 9F               [ 1] 5373 	ld a,xl
      009B8E A6 01            [ 1] 5374 	and a,(2,sp)
      009B90 C7               [ 1] 5375 	ld xl,a 
      001EEF                       5376 	_drop 2 
      009B91 00 11            [ 2]    1     addw sp,#2 
      009B93 5F CF            [ 1] 5377 	ld a,#TK_INTGR
      009B95 00               [ 4] 5378 	ret
                                   5379 
                                   5380 ;------------------------------
                                   5381 ; BASIC: OR(expr1,expr2)
                                   5382 ; Apply bit OR relation between
                                   5383 ; the 2 arguments, i.e expr1 | expr2 
                                   5384 ; output:
                                   5385 ; 	A 		TK_INTGR
                                   5386 ;   X 		result 
                                   5387 ;------------------------------
      001EF4                       5388 bit_or:
      009B96 12 11 D7         [ 4] 5389 	call func_args 
      009B97 A1 02            [ 1] 5390 	cp a,#2
      009B97 AE 00            [ 1] 5391 	jreq 1$
      009B99 03 92 AF         [ 2] 5392 	jp syntax_error 
      001EFE                       5393 1$: 
      009B9C 00 11 26         [ 4] 5394 	call dpop 
      009B9F 05               [ 2] 5395 	pushw x 
      009BA0 5A 2A F7         [ 4] 5396 	call dpop 
      009BA3 20               [ 1] 5397 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009BA4 19 5C            [ 1] 5398 	or a,(1,sp)
      009BA6 CD               [ 1] 5399 	ld xh,a 
      009BA7 9B               [ 1] 5400 	ld a,xl 
      009BA8 80 AE            [ 1] 5401 	or a,(2,sp)
      009BAA 02               [ 1] 5402 	ld xl,a 
      001F0D                       5403 	_drop 2 
      009BAB 7F C3            [ 2]    1     addw sp,#2 
      009BAD 00 11            [ 1] 5404 	ld a,#TK_INTGR 
      009BAF 2A               [ 4] 5405 	ret
                                   5406 
                                   5407 ;------------------------------
                                   5408 ; BASIC: XOR(expr1,expr2)
                                   5409 ; Apply bit XOR relation between
                                   5410 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5411 ; output:
                                   5412 ; 	A 		TK_INTGR
                                   5413 ;   X 		result 
                                   5414 ;------------------------------
      001F12                       5415 bit_xor:
      009BB0 E6 72 5F         [ 4] 5416 	call func_args 
      009BB3 00 14            [ 1] 5417 	cp a,#2
      009BB5 72 5F            [ 1] 5418 	jreq 1$
      009BB7 00 15 72         [ 2] 5419 	jp syntax_error 
      001F1C                       5420 1$: 
      009BBA 5F 00 16         [ 4] 5421 	call dpop 
      009BBD 81               [ 2] 5422 	pushw x 
      009BBE CD 0F 93         [ 4] 5423 	call dpop 
      009BBE CE               [ 1] 5424 	ld a,xh 
      009BBF 00 11            [ 1] 5425 	xor a,(1,sp)
      009BC1 C6               [ 1] 5426 	ld xh,a 
      009BC2 00               [ 1] 5427 	ld a,xl 
      009BC3 13 CF            [ 1] 5428 	xor a,(2,sp)
      009BC5 00               [ 1] 5429 	ld xl,a 
      001F2B                       5430 	_drop 2 
      009BC6 14 C7            [ 2]    1     addw sp,#2 
      009BC8 00 16            [ 1] 5431 	ld a,#TK_INTGR 
      009BCA 81               [ 4] 5432 	ret 
                                   5433 
                                   5434 ;------------------------------
                                   5435 ; BASIC: LSHIFT(expr1,expr2)
                                   5436 ; logical shift left expr1 by 
                                   5437 ; expr2 bits 
                                   5438 ; output:
                                   5439 ; 	A 		TK_INTGR
                                   5440 ;   X 		result 
                                   5441 ;------------------------------
      009BCB                       5442 lshift:
      009BCB 5F 92 AF         [ 4] 5443 	call func_args
      009BCE 00 11            [ 1] 5444 	cp a,#2 
      009BD0 90 F1            [ 1] 5445 	jreq 1$
      009BD2 26 08 4D         [ 2] 5446 	jp syntax_error
      009BD5 27 12 5C         [ 4] 5447 1$: call dpop  
      009BD8 90               [ 1] 5448 	exgw x,y 
      009BD9 5C 20 F0         [ 4] 5449 	call dpop
      009BDC 90 5D            [ 2] 5450 	tnzw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009BDC 4D 27            [ 1] 5451 	jreq 4$
      009BDE 07               [ 2] 5452 2$:	sllw x 
      009BDF 5C 92            [ 2] 5453 	decw y 
      009BE1 AF 00            [ 1] 5454 	jrne 2$
      001F4A                       5455 4$:  
      009BE3 11 20            [ 1] 5456 	ld a,#TK_INTGR
      009BE5 F6               [ 4] 5457 	ret
                                   5458 
                                   5459 ;------------------------------
                                   5460 ; BASIC: RSHIFT(expr1,expr2)
                                   5461 ; logical shift right expr1 by 
                                   5462 ; expr2 bits.
                                   5463 ; output:
                                   5464 ; 	A 		TK_INTGR
                                   5465 ;   X 		result 
                                   5466 ;------------------------------
      001F4D                       5467 rshift:
      009BE6 5C 98 81         [ 4] 5468 	call func_args
      009BE9 A1 02            [ 1] 5469 	cp a,#2 
      009BE9 5C 99            [ 1] 5470 	jreq 1$
      009BEB 81 07 14         [ 2] 5471 	jp syntax_error
      009BEC CD 0F 93         [ 4] 5472 1$: call dpop  
      009BEC 52               [ 1] 5473 	exgw x,y 
      009BED 04 17 03         [ 4] 5474 	call dpop
      009BF0 5F CF            [ 2] 5475 	tnzw y 
      009BF2 00 12            [ 1] 5476 	jreq 4$
      009BF4 35               [ 2] 5477 2$:	srlw x 
      009BF5 01 00            [ 2] 5478 	decw y 
      009BF7 11 FB            [ 1] 5479 	jrne 2$
      009BF8                       5480 4$:  
      009BF8 92 BC            [ 1] 5481 	ld a,#TK_INTGR
      009BFA 00               [ 4] 5482 	ret
                                   5483 
                                   5484 ;--------------------------
                                   5485 ; BASIC: FCPU integer
                                   5486 ; set CPU frequency 
                                   5487 ;-------------------------- 
                                   5488 
      001F6A                       5489 fcpu:
      009BFB 11 27            [ 1] 5490 	ld a,#TK_INTGR
      009BFD 25 5F 16         [ 4] 5491 	call expect 
      009C00 03               [ 1] 5492 	ld a,xl 
      009C01 CD 9B            [ 1] 5493 	and a,#7 
      009C03 CB 25 2D         [ 1] 5494 	ld CLK_CKDIVR,a 
      009C06 92               [ 4] 5495 	ret 
                                   5496 
                                   5497 ;------------------------------
                                   5498 ; BASIC: PMODE pin#, mode 
                                   5499 ; define pin as input or output
                                   5500 ; pin#: {0..15}
                                   5501 ; mode: INPUT|OUTPUT  
                                   5502 ;------------------------------
                           000001  5503 	PINNO=1
                           000001  5504 	VSIZE=1
      001F76                       5505 pin_mode:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      001F76                       5506 	_vars VSIZE 
      009C07 AF 00            [ 2]    1     sub sp,#VSIZE 
      009C09 11 6B 01         [ 4] 5507 	call arg_list 
      009C0C 5C 92            [ 1] 5508 	cp a,#2 
      009C0E AF 00            [ 1] 5509 	jreq 1$
      009C10 11 6B 02         [ 2] 5510 	jp syntax_error 
      009C13 5C 72 FB         [ 4] 5511 1$: call dpop ; mode 
      009C16 01               [ 1] 5512 	exgw x,y 
      009C17 5C CD 9B         [ 4] 5513 	call dpop ; Dx pin 
      009C1A 80 AE 02         [ 4] 5514 	call select_pin 
      009C1D 80 C3            [ 1] 5515 	ld (PINNO,sp),a  
      009C1F 00 11            [ 1] 5516 	ld a,#1 
      009C21 2A D5            [ 1] 5517 	tnz (PINNO,sp)
      009C23 27 0B            [ 1] 5518 	jreq 4$
      009C23 72               [ 1] 5519 2$:	sll a 
      009C24 5F 00            [ 1] 5520 	dec (PINNO,sp)
      009C26 11 72            [ 1] 5521 	jrne 2$ 
      009C28 5F 00            [ 1] 5522 	ld (PINNO,sp),a
      009C2A 12 72            [ 1] 5523 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009C2C 5F 00            [ 1] 5524 	ld (GPIO_CR1,x),a 
      009C2E 13 5B 04 98      [ 2] 5525 4$:	cpw y,#OUTP 
      009C32 81 07            [ 1] 5526 	jreq 6$
                                   5527 ; input mode
      009C33 7B 01            [ 1] 5528 	ld a,(PINNO,sp)
      009C33 5B               [ 1] 5529 	cpl a 
      009C34 04 99            [ 1] 5530 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009C36 81 0A            [ 2] 5531 	jra 9$
      009C37                       5532 6$: ;output mode  
      009C37 72 01            [ 1] 5533 	ld a,(PINNO,sp)
      009C39 00 20            [ 1] 5534 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009C3B 05 A6            [ 1] 5535 	ld (GPIO_CR2,x),a 
      009C3D 07 CC            [ 1] 5536 	ld a,(PINNO,sp)
      009C3F 87 96            [ 1] 5537 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009C41 E7 02            [ 1] 5538 9$:	ld (GPIO_DDR,x),a 
      001FB8                       5539 	_drop VSIZE 
      009C41 CE 00            [ 2]    1     addw sp,#VSIZE 
      009C43 1B               [ 4] 5540 	ret
                                   5541 
                                   5542 ;------------------------
                                   5543 ; select pin 
                                   5544 ; input:
                                   5545 ;   X 	 {0..15} Arduino Dx 
                                   5546 ; output:
                                   5547 ;   A     stm8s208 pin 
                                   5548 ;   X     base address s208 GPIO port 
                                   5549 ;---------------------------
      001FBB                       5550 select_pin:
      009C44 72               [ 2] 5551 	sllw x 
      009C45 B0 00 19         [ 2] 5552 	addw x,#arduino_to_8s208 
      009C48 26               [ 2] 5553 	ldw x,(x)
      009C49 01               [ 1] 5554 	ld a,xl 
      009C4A 81               [ 1] 5555 	push a 
      009C4B 5E               [ 1] 5556 	swapw x 
      009C4B 52 04            [ 1] 5557 	ld a,#5 
      009C4D 1F               [ 4] 5558 	mul x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009C4E 01 CD 88         [ 2] 5559 	addw x,#GPIO_BASE 
      009C51 74               [ 1] 5560 	pop a 
      009C52 A1               [ 4] 5561 	ret 
                                   5562 ; translation from Arduino D0..D15 to stm8s208rb 
      001FCB                       5563 arduino_to_8s208:
      009C53 0A 27                 5564 .byte 3,6 ; D0 
      009C55 03 CC                 5565 .byte 3,5 ; D1 
      009C57 87 94                 5566 .byte 4,0 ; D2 
      009C59 02 01                 5567 .byte 2,1 ; D3
      009C59 90 CE                 5568 .byte 6,0 ; D4
      009C5B 00 05                 5569 .byte 2,2 ; D5
      009C5D 72 B9                 5570 .byte 2,3 ; D6
      009C5F 00 01                 5571 .byte 3,1 ; D7
      009C61 17 03                 5572 .byte 3,3 ; D8
      009C63 55 00                 5573 .byte 2,4 ; D9
      009C65 04 00                 5574 .byte 4,5 ; D10
      009C67 02 93                 5575 .byte 2,6 ; D11
      009C69 CD 82                 5576 .byte 2,7 ; D12
      009C6B FA 1C                 5577 .byte 2,5 ; D13
      009C6D 00 03                 5578 .byte 4,2 ; D14
      009C6F 72 FB                 5579 .byte 4,1 ; D15
                                   5580 
                                   5581 
                                   5582 ;------------------------------
                                   5583 ; BASIC: RND(expr)
                                   5584 ; return random number 
                                   5585 ; between 1 and expr inclusive
                                   5586 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5587 ; input:
                                   5588 ; 	none 
                                   5589 ; output:
                                   5590 ;	X 		random positive integer 
                                   5591 ;------------------------------
      001FEB                       5592 random:
      009C71 01 72 5D         [ 4] 5593 	call func_args 
      009C74 00 14            [ 1] 5594 	cp a,#1
      009C76 26 0B            [ 1] 5595 	jreq 1$
      009C78 72 B0 00         [ 2] 5596 	jp syntax_error
      001FF5                       5597 1$: 
      009C7B 15 23 05         [ 4] 5598 	call dpop 
      009C7E A6               [ 2] 5599 	pushw x 
      009C7F 01               [ 1] 5600 	ld a,xh 
      009C80 CC 87            [ 1] 5601 	bcp a,#0x80 
      009C82 96 05            [ 1] 5602 	jreq 2$
      009C83 A6 0A            [ 1] 5603 	ld a,#ERR_BAD_VALUE
      009C83 16 03 CD         [ 2] 5604 	jp tb_error
      002003                       5605 2$: 
                                   5606 ; acc16=(x<<5)^x 
      009C86 9B EC 24         [ 2] 5607 	ldw x,seedx 
      009C89 05               [ 2] 5608 	sllw x 
      009C8A A6               [ 2] 5609 	sllw x 
      009C8B 08               [ 2] 5610 	sllw x 
      009C8C CC               [ 2] 5611 	sllw x 
      009C8D 87               [ 2] 5612 	sllw x 
      009C8E 96               [ 1] 5613 	ld a,xh 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009C8F C8 00 0C         [ 1] 5614 	xor a,seedx 
      009C8F CE 00 14         [ 1] 5615 	ld acc16,a 
      009C92 C6               [ 1] 5616 	ld a,xl 
      009C93 00 16 CF         [ 1] 5617 	xor a,seedx+1 
      009C96 00 11 C7         [ 1] 5618 	ld acc8,a 
                                   5619 ; seedx=seedy 
      009C99 00 13 1E         [ 2] 5620 	ldw x,seedy 
      009C9C 03 CD 82         [ 2] 5621 	ldw seedx,x  
                                   5622 ; seedy=seedy^(seedy>>1)
      009C9F FA 5C            [ 2] 5623 	srlw y 
      009CA1 1F 01            [ 1] 5624 	ld a,yh 
      009CA3 5F 16 03         [ 1] 5625 	xor a,seedy 
      009CA6 CD 81 D5         [ 1] 5626 	ld seedy,a  
      009CA9 CE 00            [ 1] 5627 	ld a,yl 
      009CAB 1B 72 B0         [ 1] 5628 	xor a,seedy+1 
      009CAE 00 19 1F         [ 1] 5629 	ld seedy+1,a 
                                   5630 ; acc16>>3 
      009CB1 01 5F 7B         [ 2] 5631 	ldw x,acc16 
      009CB4 01               [ 2] 5632 	srlw x 
      009CB5 CD               [ 2] 5633 	srlw x 
      009CB6 81               [ 2] 5634 	srlw x 
                                   5635 ; x=acc16^x 
      009CB7 60               [ 1] 5636 	ld a,xh 
      009CB8 5C 7B 02         [ 1] 5637 	xor a,acc16 
      009CBB CD               [ 1] 5638 	ld xh,a 
      009CBC 81               [ 1] 5639 	ld a,xl 
      009CBD 60 5C CD         [ 1] 5640 	xor a,acc8 
      009CC0 9B               [ 1] 5641 	ld xl,a 
                                   5642 ; seedy=x^seedy 
      009CC1 80 1E 01         [ 1] 5643 	xor a,seedy+1
      009CC4 89               [ 1] 5644 	ld xl,a 
      009CC5 5F               [ 1] 5645 	ld a,xh 
      009CC6 90 CE 00         [ 1] 5646 	xor a,seedy
      009CC9 19               [ 1] 5647 	ld xh,a 
      009CCA CD 81 D5         [ 2] 5648 	ldw seedy,x 
                                   5649 ; return seedy modulo expr + 1 
      009CCD 5B 02            [ 2] 5650 	popw y 
      009CCF AE               [ 2] 5651 	divw x,y 
      009CD0 00               [ 1] 5652 	ldw x,y 
      009CD1 01               [ 1] 5653 	incw x 
      009CD2 A6 FF            [ 1] 5654 	ld a,#TK_INTGR
      009CD4 CD               [ 4] 5655 	ret 
                                   5656 
                                   5657 ;---------------------------------
                                   5658 ; BASIC: WORDS 
                                   5659 ; affiche la listes des mots du
                                   5660 ; dictionnaire.
                                   5661 ;---------------------------------
                           000001  5662 	WLEN=1
                           000002  5663 	LLEN=2  
                           000002  5664 	VSIZE=2 
      002055                       5665 words:
      002055                       5666 	_vars VSIZE
      009CD5 81 60            [ 2]    1     sub sp,#VSIZE 
      009CD7 CD 9B            [ 1] 5667 	clr (LLEN,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009CD9 80 CE 00 11      [ 2] 5668 	ldw y,#kword_dict+2
      009CDD C6               [ 1] 5669 0$:	ldw x,y
      009CDE 00               [ 1] 5670 	ld a,(x)
      009CDF 13 CF            [ 1] 5671 	and a,#15 
      009CE1 00 14            [ 1] 5672 	ld (WLEN,sp),a 
      009CE3 C7               [ 1] 5673 1$:	incw x 
      009CE4 00               [ 1] 5674 	ld a,(x)
      009CE5 16 5F 4B         [ 4] 5675 	call putc 
      009CE8 04 02            [ 1] 5676 	inc (LLEN,sp)
      009CE9 0A 01            [ 1] 5677 	dec (WLEN,sp)
      009CE9 4F CD            [ 1] 5678 	jrne 1$
      009CEB 81 60            [ 1] 5679 	ld a,#70
      009CED 5C 0A            [ 1] 5680 	cp a,(LLEN,sp)
      009CEF 01 26            [ 1] 5681 	jrmi 2$   
      009CF1 F7 84            [ 1] 5682 	ld a,#SPACE 
      009CF3 1E 01 CD         [ 4] 5683 	call putc 
      009CF6 8A 0D            [ 1] 5684 	inc (LLEN,sp) 
      009CF8 5B 04            [ 2] 5685 	jra 3$
      009CFA 81 0D            [ 1] 5686 2$: ld a,#CR 
      009CFB CD 01 A6         [ 4] 5687 	call putc 
      009CFB 72 01            [ 1] 5688 	clr (LLEN,sp)
      009CFD 00 20 07 27      [ 2] 5689 3$:	subw y,#2 
      009D01 05 A6            [ 2] 5690 	ldw y,(y)
      009D03 07 CC            [ 1] 5691 	jrne 0$  
      00208C                       5692 	_drop VSIZE 
      009D05 87 96            [ 2]    1     addw sp,#VSIZE 
      009D07 81               [ 4] 5693 	ret 
                                   5694 
                                   5695 
                                   5696 ;*********************************
                                   5697 
                                   5698 ;------------------------------
                                   5699 ;      dictionary 
                                   5700 ; format:
                                   5701 ;   link:   2 bytes 
                                   5702 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5703 ;   cmd_name: 16 byte max 
                                   5704 ;   code_address: 2 bytes 
                                   5705 ;------------------------------
                                   5706 	.macro _dict_entry len,name,cmd 
                                   5707 	.word LINK 
                                   5708 	LINK=.
                                   5709 name:
                                   5710 	.byte len 	
                                   5711 	.ascii "name"
                                   5712 	.word cmd 
                                   5713 	.endm 
                                   5714 
                           000000  5715 	LINK=0
      00208F                       5716 kword_end:
      00208F                       5717 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009D07 CD 88                    1 	.word LINK 
                           002091     2 	LINK=.
      002091                          3 XOR:
      009D09 74                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009D0A A1 0A 27                 5 	.ascii "XOR"
      009D0D 03 CC                    6 	.word bit_xor 
      002097                       5718 	_dict_entry,5,WRITE,write  
      009D0F 87 94                    1 	.word LINK 
                           002099     2 	LINK=.
      009D11                          3 WRITE:
      009D11 90                       4 	.byte 5 	
      009D12 CE 00 05 72 B9           5 	.ascii "WRITE"
      009D17 00 01                    6 	.word write 
      0020A1                       5719 	_dict_entry,5,WORDS,words 
      009D19 55 00                    1 	.word LINK 
                           0020A3     2 	LINK=.
      0020A3                          3 WORDS:
      009D1B 04                       4 	.byte 5 	
      009D1C 00 02 CD 9B EC           5 	.ascii "WORDS"
      009D21 25 05                    6 	.word words 
      0020AB                       5720 	_dict_entry 4,WAIT,wait 
      009D23 A6 09                    1 	.word LINK 
                           0020AD     2 	LINK=.
      0020AD                          3 WAIT:
      009D25 CC                       4 	.byte 4 	
      009D26 87 96 49 54              5 	.ascii "WAIT"
      009D28 17 0F                    6 	.word wait 
      0020B4                       5721 	_dict_entry,3+F_IFUNC,USR,usr
      009D28 CD 9B                    1 	.word LINK 
                           0020B6     2 	LINK=.
      0020B6                          3 USR:
      009D2A 80                       4 	.byte 3+F_IFUNC 	
      009D2B CD 86 66                 5 	.ascii "USR"
      009D2E 5F 92                    6 	.word usr 
      0020BC                       5722 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009D30 AF 00                    1 	.word LINK 
                           0020BE     2 	LINK=.
      0020BE                          3 UFLASH:
      009D32 11                       4 	.byte 6+F_IFUNC 	
      009D33 90 95 5C 92 AF 00        5 	.ascii "UFLASH"
      009D39 11 5C                    6 	.word uflash 
      0020C7                       5723 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009D3B 90 97                    1 	.word LINK 
                           0020C9     2 	LINK=.
      0020C9                          3 UBOUND:
      009D3D 72                       4 	.byte 6+F_IFUNC 	
      009D3E B9 00 19 90 CF 00        5 	.ascii "UBOUND"
      009D44 1B 90                    6 	.word ubound 
      0020D2                       5724 	_dict_entry,2,TO,to
      009D46 CE 00                    1 	.word LINK 
                           0020D4     2 	LINK=.
      0020D4                          3 TO:
      009D48 19                       4 	.byte 2 	
      009D49 54 4F                    5 	.ascii "TO"
      009D49 92 AF                    6 	.word to 
      0020D9                       5725 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      009D4B 00 11                    1 	.word LINK 
                           0020DB     2 	LINK=.
      0020DB                          3 TICKS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009D4D 90                       4 	.byte 5+F_IFUNC 	
      009D4E F7 5C 90 5C 90           5 	.ascii "TICKS"
      009D53 C3 00                    6 	.word get_ticks 
      0020E3                       5726 	_dict_entry,4,STOP,stop 
      009D55 1B 2B                    1 	.word LINK 
                           0020E5     2 	LINK=.
      0020E5                          3 STOP:
      009D57 F1                       4 	.byte 4 	
      009D58 CE 00 1B 72              5 	.ascii "STOP"
      009D5C B0 00                    6 	.word stop 
      0020EC                       5727 	_dict_entry,4,STEP,step 
      009D5E 19 CD                    1 	.word LINK 
                           0020EE     2 	LINK=.
      0020EE                          3 STEP:
      009D60 8A                       4 	.byte 4 	
      009D61 0D 81 45 50              5 	.ascii "STEP"
      009D63 18 36                    6 	.word step 
      0020F5                       5728 	_dict_entry,5,SLEEP,sleep 
      009D63 CD 88                    1 	.word LINK 
                           0020F7     2 	LINK=.
      0020F7                          3 SLEEP:
      009D65 74                       4 	.byte 5 	
      009D66 A1 00 27 26 A1           5 	.ascii "SLEEP"
      009D6B 0A 27                    6 	.word sleep 
      0020FF                       5729 	_dict_entry,4+F_IFUNC,SIZE,size
      009D6D 03 CC                    1 	.word LINK 
                           002101     2 	LINK=.
      002101                          3 SIZE:
      009D6F 87                       4 	.byte 4+F_IFUNC 	
      009D70 94 90 CE 00              5 	.ascii "SIZE"
      009D74 05 72                    6 	.word size 
      002108                       5730     _dict_entry,4,SHOW,show 
      009D76 B9 00                    1 	.word LINK 
                           00210A     2 	LINK=.
      00210A                          3 SHOW:
      009D78 01                       4 	.byte 4 	
      009D79 55 00 04 00              5 	.ascii "SHOW"
      009D7D 02 CD                    6 	.word show 
      002111                       5731 	_dict_entry,4,SAVE,save
      009D7F 9B EC                    1 	.word LINK 
                           002113     2 	LINK=.
      002113                          3 SAVE:
      009D81 25                       4 	.byte 4 	
      009D82 05 A6 09 CC              5 	.ascii "SAVE"
      009D86 87 96                    6 	.word save 
      009D88                       5732 	_dict_entry 3,RUN,run
      009D88 CE 00                    1 	.word LINK 
                           00211C     2 	LINK=.
      00211C                          3 RUN:
      009D8A 11                       4 	.byte 3 	
      009D8B C6 00 13                 5 	.ascii "RUN"
      009D8E 20 0A                    6 	.word run 
      009D90                       5733 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      009D90 AE 01                    1 	.word LINK 
                           002124     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      002124                          3 RSHIFT:
      009D92 00                       4 	.byte 6+F_IFUNC 	
      009D93 4F CF 00 11 C7 00        5 	.ascii "RSHIFT"
      009D99 13 4D                    6 	.word rshift 
      009D9A                       5734 	_dict_entry,3+F_IFUNC,RND,random 
      009D9A CF 00                    1 	.word LINK 
                           00212F     2 	LINK=.
      00212F                          3 RND:
      009D9C 14                       4 	.byte 3+F_IFUNC 	
      009D9D C7 00 16                 5 	.ascii "RND"
      009DA0 4B 04                    6 	.word random 
      002135                       5735 	_dict_entry,6,RETURN,return 
      009DA2 5F 2F                    1 	.word LINK 
                           002137     2 	LINK=.
      009DA3                          3 RETURN:
      009DA3 4F                       4 	.byte 6 	
      009DA4 CD 81 60 5C 0A 01        5 	.ascii "RETURN"
      009DAA 26 F7                    6 	.word return 
      002140                       5736 	_dict_entry 6,REMARK,rem 
      009DAC 84 81                    1 	.word LINK 
                           002142     2 	LINK=.
      009DAE                          3 REMARK:
      009DAE 52                       4 	.byte 6 	
      009DAF 02 5F 1F 01 CF 00        5 	.ascii "REMARK"
      009DB5 12 35                    6 	.word rem 
      00214B                       5737 	_dict_entry,6,REBOOT,cold_start 
      009DB7 01 00                    1 	.word LINK 
                           00214D     2 	LINK=.
      00214D                          3 REBOOT:
      009DB9 11                       4 	.byte 6 	
      009DBA 52 45 42 4F 4F 54        5 	.ascii "REBOOT"
      009DBA 5F 92                    6 	.word cold_start 
      002156                       5738 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      009DBC AF 00                    1 	.word LINK 
                           002158     2 	LINK=.
      002158                          3 QKEY:
      009DBE 11                       4 	.byte 4+F_IFUNC 	
      009DBF 27 39 45 59              5 	.ascii "QKEY"
      009DC1 1E 32                    6 	.word qkey 
      00215F                       5739 	_dict_entry,6,PWRADC,power_adc 
      009DC1 92 AF                    1 	.word LINK 
                           002161     2 	LINK=.
      002161                          3 PWRADC:
      009DC3 00                       4 	.byte 6 	
      009DC4 11 27 06 CD 82 26        5 	.ascii "PWRADC"
      009DCA 5C 20                    6 	.word power_adc 
      00216A                       5740 	_dict_entry 5,PRINT,print 
      009DCC F4 5C                    1 	.word LINK 
                           00216C     2 	LINK=.
      00216C                          3 PRINT:
      009DCE A6                       4 	.byte 5 	
      009DCF 20 CD 82 26 92           5 	.ascii "PRINT"
      009DD4 AF 00                    6 	.word print 
      002174                       5741 	_dict_entry,4+F_CONST,POUT,OUTP 
      009DD6 11 90                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



                           002176     2 	LINK=.
      002176                          3 POUT:
      009DD8 95                       4 	.byte 4+F_CONST 	
      009DD9 5C 92 AF 00              5 	.ascii "POUT"
      009DDD 11 5C                    6 	.word OUTP 
      00217D                       5742 	_dict_entry,4,POKE,poke 
      009DDF 90 97                    1 	.word LINK 
                           00217F     2 	LINK=.
      00217F                          3 POKE:
      009DE1 90                       4 	.byte 4 	
      009DE2 89 72 FB 01              5 	.ascii "POKE"
      009DE6 5C CD                    6 	.word poke 
      002186                       5743 	_dict_entry,4+F_CONST,PINP,INP 
      009DE8 9B 80                    1 	.word LINK 
                           002188     2 	LINK=.
      002188                          3 PINP:
      009DEA 85                       4 	.byte 4+F_CONST 	
      009DEB CD 8A 0D A6              5 	.ascii "PINP"
      009DEF 0D CD                    6 	.word INP 
      00218F                       5744 	_dict_entry,4+F_IFUNC,PEEK,peek 
      009DF1 82 26                    1 	.word LINK 
                           002191     2 	LINK=.
      002191                          3 PEEK:
      009DF3 1E                       4 	.byte 4+F_IFUNC 	
      009DF4 01 5C 1F 01              5 	.ascii "PEEK"
      009DF8 20 C0                    6 	.word peek 
      009DFA                       5745 	_dict_entry,5,PMODE,pin_mode 
      009DFA 1E 01                    1 	.word LINK 
                           00219A     2 	LINK=.
      00219A                          3 PMODE:
      009DFC CD                       4 	.byte 5 	
      009DFD 8A 0D AE 9E 2F           5 	.ascii "PMODE"
      009E02 CD 82                    6 	.word pin_mode 
      0021A2                       5746 	_dict_entry,5,PAUSE,pause 
      009E04 38 A6                    1 	.word LINK 
                           0021A4     2 	LINK=.
      0021A4                          3 PAUSE:
      009E06 FF                       4 	.byte 5 	
      009E07 C0 00 16 C7 00           5 	.ascii "PAUSE"
      009E0C 0A A6                    6 	.word pause 
      0021AC                       5747 	_dict_entry,2+F_IFUNC,OR,bit_or
      009E0E 7F C2                    1 	.word LINK 
                           0021AE     2 	LINK=.
      0021AE                          3 OR:
      009E10 00                       4 	.byte 2+F_IFUNC 	
      009E11 15 C7                    5 	.ascii "OR"
      009E13 00 09                    6 	.word bit_or 
      0021B3                       5748 	_dict_entry,3+F_CONST,ODR,GPIO_ODR
      009E15 A6 02                    1 	.word LINK 
                           0021B5     2 	LINK=.
      0021B5                          3 ODR:
      009E17 C2                       4 	.byte 3+F_CONST 	
      009E18 00 14 C7                 5 	.ascii "ODR"
      009E1B 00 08                    6 	.word GPIO_ODR 
      0021BB                       5749 	_dict_entry,3,NEW,new
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009E1D 5F A6                    1 	.word LINK 
                           0021BD     2 	LINK=.
      0021BD                          3 NEW:
      009E1F 06                       4 	.byte 3 	
      009E20 97 A6 0A                 5 	.ascii "NEW"
      009E23 CD 89                    6 	.word new 
      0021C3                       5750 	_dict_entry,4,NEXT,next 
      009E25 C5 AE                    1 	.word LINK 
                           0021C5     2 	LINK=.
      0021C5                          3 NEXT:
      009E27 9E                       4 	.byte 4 	
      009E28 37 CD 82 38              5 	.ascii "NEXT"
      009E2C 5B 02                    6 	.word next 
      0021CC                       5751 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      009E2E 81 20                    1 	.word LINK 
                           0021CE     2 	LINK=.
      0021CE                          3 LSHIFT:
      009E30 66                       4 	.byte 6+F_IFUNC 	
      009E31 69 6C 65 73 0A 00        5 	.ascii "LSHIFT"
      009E37 20 62                    6 	.word lshift 
      0021D7                       5752 	_dict_entry,4,LOAD,load 
      009E39 79 74                    1 	.word LINK 
                           0021D9     2 	LINK=.
      0021D9                          3 LOAD:
      009E3B 65                       4 	.byte 4 	
      009E3C 73 20 66 72              5 	.ascii "LOAD"
      009E40 65 65                    6 	.word load 
      0021E0                       5753 	_dict_entry 4,LIST,list
      009E42 0A 00                    1 	.word LINK 
                           0021E2     2 	LINK=.
      009E44                          3 LIST:
      009E44 52                       4 	.byte 4 	
      009E45 02 72 5F 00              5 	.ascii "LIST"
      009E49 11 CD                    6 	.word list 
      0021E9                       5754 	_dict_entry 3,LET,let 
      009E4B 93 37                    1 	.word LINK 
                           0021EB     2 	LINK=.
      0021EB                          3 LET:
      009E4D A1                       4 	.byte 3 	
      009E4E 04 27 03                 5 	.ascii "LET"
      009E51 CC 87                    6 	.word let 
      0021F1                       5755 	_dict_entry,3+F_IFUNC,KEY,key 
      009E53 94 1F                    1 	.word LINK 
                           0021F3     2 	LINK=.
      0021F3                          3 KEY:
      009E55 01                       4 	.byte 3+F_IFUNC 	
      009E56 CD 88 74                 5 	.ascii "KEY"
      009E59 A1 0D                    6 	.word key 
      0021F9                       5756 	_dict_entry,5,INPUT,input_var  
      009E5B 27 02                    1 	.word LINK 
                           0021FB     2 	LINK=.
      0021FB                          3 INPUT:
      009E5D 20                       4 	.byte 5 	
      009E5E 19 CD 93 37 A1           5 	.ascii "INPUT"
      009E63 04 27                    6 	.word input_var 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      002203                       5757 	_dict_entry,2,IF,if 
      009E65 03 CC                    1 	.word LINK 
                           002205     2 	LINK=.
      002205                          3 IF:
      009E67 87                       4 	.byte 2 	
      009E68 94 9F                    5 	.ascii "IF"
      009E6A 1E 01                    6 	.word if 
      00220A                       5758 	_dict_entry,3+F_CONST,IDR,GPIO_IDR
      009E6C CF 00                    1 	.word LINK 
                           00220C     2 	LINK=.
      00220C                          3 IDR:
      009E6E 12                       4 	.byte 3+F_CONST 	
      009E6F 5F CD 81                 5 	.ascii "IDR"
      009E72 60 1E                    6 	.word GPIO_IDR 
      002212                       5759 	_dict_entry,3,HEX,hex_base
      009E74 01 5C                    1 	.word LINK 
                           002214     2 	LINK=.
      002214                          3 HEX:
      009E76 20                       4 	.byte 3 	
      009E77 DC 45 58                 5 	.ascii "HEX"
      009E78 13 62                    6 	.word hex_base 
      00221A                       5760 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      009E78 5B 02                    1 	.word LINK 
                           00221C     2 	LINK=.
      00221C                          3 GPIO:
      009E7A 81                       4 	.byte 4+F_IFUNC 	
      009E7B 47 50 49 4F              5 	.ascii "GPIO"
      009E7B CD 92                    6 	.word gpio 
      002223                       5761 	_dict_entry,4,GOTO,goto 
      009E7D 57 A1                    1 	.word LINK 
                           002225     2 	LINK=.
      002225                          3 GOTO:
      009E7F 01                       4 	.byte 4 	
      009E80 27 03 CC 87              5 	.ascii "GOTO"
      009E84 94 CD                    6 	.word goto 
      00222C                       5762 	_dict_entry,5,GOSUB,gosub 
      009E86 90 13                    1 	.word LINK 
                           00222E     2 	LINK=.
      00222E                          3 GOSUB:
      009E88 9F                       4 	.byte 5 	
      009E89 A4 7F 97 A6 03           5 	.ascii "GOSUB"
      009E8E 81 DA                    6 	.word gosub 
      009E8F                       5763 	_dict_entry,6,FORGET,forget 
      009E8F CD 92                    1 	.word LINK 
                           002238     2 	LINK=.
      002238                          3 FORGET:
      009E91 57                       4 	.byte 6 	
      009E92 CD 88 74 A1 0A 27        5 	.ascii "FORGET"
      009E98 07 A1                    6 	.word forget 
      002241                       5764 	_dict_entry,3,FOR,for 
      009E9A 03 27                    1 	.word LINK 
                           002243     2 	LINK=.
      002243                          3 FOR:
      009E9C 06                       4 	.byte 3 	
      009E9D CC 87 94                 5 	.ascii "FOR"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009EA0 17 DC                    6 	.word for 
      002249                       5765 	_dict_entry,4,FCPU,fcpu 
      009EA0 F6 20                    1 	.word LINK 
                           00224B     2 	LINK=.
      00224B                          3 FCPU:
      009EA2 01                       4 	.byte 4 	
      009EA3 46 43 50 55              5 	.ascii "FCPU"
      009EA3 9F 97                    6 	.word fcpu 
      002252                       5766 	_dict_entry,6+F_CONST,EEPROM,EEPROM_BASE  
      009EA5 4F 95                    1 	.word LINK 
                           002254     2 	LINK=.
      002254                          3 EEPROM:
      009EA7 A6                       4 	.byte 6+F_CONST 	
      009EA8 04 81 50 52 4F 4D        5 	.ascii "EEPROM"
      009EAA 40 00                    6 	.word EEPROM_BASE 
      00225D                       5767 	_dict_entry,6+F_CMD,DWRITE,digital_write
      009EAA CD 82                    1 	.word LINK 
                           00225F     2 	LINK=.
      00225F                          3 DWRITE:
      009EAC 2F                       4 	.byte 6+F_CMD 	
      009EAD 5F 97 A6 04 81 45        5 	.ascii "DWRITE"
      009EB2 1A 6A                    6 	.word digital_write 
      002268                       5768 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      009EB2 5F 72                    1 	.word LINK 
                           00226A     2 	LINK=.
      00226A                          3 DREAD:
      009EB4 0B                       4 	.byte 5+F_IFUNC 	
      009EB5 52 40 01 5C A6           5 	.ascii "DREAD"
      009EBA 04 81                    6 	.word digital_read 
      009EBC                       5769 	_dict_entry,3,DIR,directory 
      009EBC CD 92                    1 	.word LINK 
                           002274     2 	LINK=.
      002274                          3 DIR:
      009EBE 57                       4 	.byte 3 	
      009EBF A1 02 27                 5 	.ascii "DIR"
      009EC2 03 CC                    6 	.word directory 
      00227A                       5770 	_dict_entry,3,DEC,dec_base
      009EC4 87 94                    1 	.word LINK 
                           00227C     2 	LINK=.
      009EC6                          3 DEC:
      009EC6 AE                       4 	.byte 3 	
      009EC7 00 02 72                 5 	.ascii "DEC"
      009ECA DE 00                    6 	.word dec_base 
      002282                       5771 	_dict_entry,3+F_CONST,DDR,GPIO_DDR
      009ECC 17 2B                    1 	.word LINK 
                           002284     2 	LINK=.
      002284                          3 DDR:
      009ECE 1B                       4 	.byte 3+F_CONST 	
      009ECF A3 00 09                 5 	.ascii "DDR"
      009ED2 2A 16                    6 	.word GPIO_DDR 
      00228A                       5772 	_dict_entry,3+F_CONST,CRL,GPIO_CR1
      009ED4 A6 05                    1 	.word LINK 
                           00228C     2 	LINK=.
      00228C                          3 CRL:
      009ED6 42                       4 	.byte 3+F_CONST 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009ED7 1C 50 00                 5 	.ascii "CRL"
      009EDA 89 CD                    6 	.word GPIO_CR1 
      002292                       5773 	_dict_entry,3+F_CONST,CRH,GPIO_CR2
      009EDC 90 13                    1 	.word LINK 
                           002294     2 	LINK=.
      002294                          3 CRH:
      009EDE 72                       4 	.byte 3+F_CONST 	
      009EDF FB 01 1F                 5 	.ascii "CRH"
      009EE2 01 CD                    6 	.word GPIO_CR2 
      00229A                       5774 	_dict_entry,4+F_CFUNC,CHAR,char
      009EE4 90 3A                    1 	.word LINK 
                           00229C     2 	LINK=.
      00229C                          3 CHAR:
      009EE6 85                       4 	.byte 4+F_CFUNC 	
      009EE7 A6 04 81 52              5 	.ascii "CHAR"
      009EEA 1D FB                    6 	.word char 
      0022A3                       5775 	_dict_entry,3,BYE,bye 
      009EEA A6 0A                    1 	.word LINK 
                           0022A5     2 	LINK=.
      0022A5                          3 BYE:
      009EEC CC                       4 	.byte 3 	
      009EED 87 96 45                 5 	.ascii "BYE"
      009EEF 1E 93                    6 	.word bye 
      0022AB                       5776 	_dict_entry,5,BTOGL,bit_toggle
      009EEF AE A4                    1 	.word LINK 
                           0022AD     2 	LINK=.
      0022AD                          3 BTOGL:
      009EF1 00                       4 	.byte 5 	
      009EF2 A6 04 81 47 4C           5 	.ascii "BTOGL"
      009EF5 17 63                    6 	.word bit_toggle 
      0022B5                       5777 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      009EF5 90 89                    1 	.word LINK 
                           0022B7     2 	LINK=.
      0022B7                          3 BTEST:
      009EF7 CD                       4 	.byte 5+F_IFUNC 	
      009EF8 92 57 A1 01 2A           5 	.ascii "BTEST"
      009EFD 03 CC                    6 	.word bit_test 
      0022BF                       5778 	_dict_entry,4,BSET,bit_set 
      009EFF 87 94                    1 	.word LINK 
                           0022C1     2 	LINK=.
      009F01                          3 BSET:
      009F01 CD                       4 	.byte 4 	
      009F02 90 13 A1 02              5 	.ascii "BSET"
      009F06 2B 05                    6 	.word bit_set 
      0022C8                       5779 	_dict_entry,4,BRES,bit_reset
      009F08 90 93                    1 	.word LINK 
                           0022CA     2 	LINK=.
      0022CA                          3 BRES:
      009F0A CD                       4 	.byte 4 	
      009F0B 90 13 51 90              5 	.ascii "BRES"
      009F0F FD 90                    6 	.word bit_reset 
      0022D1                       5780 	_dict_entry,5,BREAK,break 
      009F11 85 81                    1 	.word LINK 
                           0022D3     2 	LINK=.
      009F13                          3 BREAK:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009F13 72                       4 	.byte 5 	
      009F14 0D 52 40 FB 8E           5 	.ascii "BREAK"
      009F19 CC 85                    6 	.word break 
      0022DB                       5781 	_dict_entry,4,BEEP,beep 
      009F1B D4 D3                    1 	.word LINK 
                           0022DD     2 	LINK=.
      009F1C                          3 BEEP:
      009F1C 72                       4 	.byte 4 	
      009F1D 0D 52 40 FB              5 	.ascii "BEEP"
      009F21 72 16                    6 	.word beep 
      0022E4                       5782 	_dict_entry,3+F_IFUNC,ASC,ascii
      009F23 00 20                    1 	.word LINK 
                           0022E6     2 	LINK=.
      0022E6                          3 ASC:
      009F25 8E                       4 	.byte 3+F_IFUNC 	
      009F26 81 53 43                 5 	.ascii "ASC"
      009F27 1E 0F                    6 	.word ascii 
      0022EC                       5783 	_dict_entry,6+F_IFUNC,ANREAD,analog_read
      009F27 CD 93                    1 	.word LINK 
                           0022EE     2 	LINK=.
      0022EE                          3 ANREAD:
      009F29 37                       4 	.byte 6+F_IFUNC 	
      009F2A A1 04 27 03 CC 87        5 	.ascii "ANREAD"
      009F30 94 02                    6 	.word analog_read 
      009F31                       5784 	_dict_entry,3+F_IFUNC,AND,bit_and
      009F31 5D 27                    1 	.word LINK 
                           0022F9     2 	LINK=.
      0022F9                          3 AND:
      009F33 04                       4 	.byte 3+F_IFUNC 	
      009F34 8F 5A 26                 5 	.ascii "AND"
      009F37 F9 4F                    6 	.word bit_and 
      0022FF                       5785 kword_dict:
      0022FF                       5786 	_dict_entry,3+F_IFUNC,ABS,abs
      009F39 81 F9                    1 	.word LINK 
                           002301     2 	LINK=.
      009F3A                          3 ABS:
      009F3A CE                       4 	.byte 3+F_IFUNC 	
      009F3B 00 0B A6                 5 	.ascii "ABS"
      009F3E 04 81                    6 	.word abs 
                                   5787 	
                                   5788 
      009F40                       5789 	.bndry 128 ; align on FLASH block.
                                   5790 ; free space for user application  
      002380                       5791 user_space:
                                   5792 ; USR() function test
      009F40 CD               [ 2] 5793 	pushw x 
      009F41 92 57 A1 01      [ 1] 5794 	bset PC_ODR,#5 
      009F45 27               [ 2] 5795 	popw x 
      009F46 03 CC 87         [ 4] 5796 	call pause02 
      009F49 94 1B 50 0A      [ 1] 5797 	bres PC_ODR,#5 
      009F4A 81               [ 4] 5798 	ret
                                   5799 
                                   5800 	.area FLASH_DRIVE (ABS)
      010000                       5801 	.org 0x10000
      010000                       5802 fdrive:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                                   5803 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002301 R   |     ADC_CR1 =  005401 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        0022F9 R
  5 ANREAD     0022EE R   |     ARG_CNT =  000001     |     ARG_OFS =  000002 
  5 ASC        0022E6 R   |     ATTRIB  =  000002     |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |     BASE    =  000002 
    BASE_SAV=  000001     |   5 BEEP       0022DD R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_ER=  000000     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  000005 
  5 BREAK      0022D3 R   |   5 BRES       0022CA R   |   5 BSET       0022C1 R
    BSIZE   =  000001     |     BSP     =  000008     |   5 BTEST      0022B7 R
  5 BTOGL      0022AD R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        0022A5 R   |     C       =  000001     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000000     |   5 CHAR       00229C R   |     CLKOPT  =  004807 
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
  5 CRH        002294 R   |   5 CRL        00228C R   |     CTRL_A  =  000001 
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
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        002284 R
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        00227C R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        002274 R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DREAD      00226A R   |     DSTACK_S=  000040     |   5 DWRITE     00225F R
  5 EEPROM     002254 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |     EOF     =  0000FF     |     ERR_BAD_=  00000A 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_L=  000005 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |   5 FCPU       00224B R   |     FF      =  00000C 
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
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   5 FOR        002243 R
  5 FORGET     002238 R   |     FRUN    =  000000     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FTRAP   =  000001     |     F_CFUNC =  000080 
    F_CMD   =  000000     |     F_CONST =  0000C0     |     F_IFUNC =  000040 
  5 GOSUB      00222E R   |     GOS_RET =  000003     |   5 GOTO       002225 R
  5 GPIO       00221C R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   5 HEX        002214 R
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
    I2C_WRIT=  000000     |   5 IDR        00220C R   |   5 IF         002205 R
    IN      =  000007     |     INCR    =  000001     |     INP     =  000000 
  5 INPUT      0021FB R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
  5 KEY        0021F3 R   |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000005     |   5 LET        0021EB R   |     LINENO  =  000005 
  5 LINK    =  002301 R   |   5 LIST       0021E2 R   |     LL      =  000002 
    LLEN    =  000002     |     LL_HB   =  000001     |     LNO     =  000005 
    LN_PTR  =  000005     |   5 LOAD       0021D9 R   |   5 LSHIFT     0021CE R
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MINOR   =  000000     |     MULOP   =  000005     |     N1      =  000001 
    N1_HB   =  000006     |     N1_LB   =  000007     |     N2      =  000003 
    N2_HB   =  000008     |     N2_LB   =  000009     |     NAFR    =  004804 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        0021BD R   |   5 NEXT       0021C5 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NL      =  00000A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R
  5 ODR        0021B5 R   |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         0021AE R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
    PAD_SIZE=  000028     |   5 PAUSE      0021A4 R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       002191 R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       002188 R   |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]

Symbol Table

    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      00219A R
  5 POKE       00217F R   |   5 POUT       002176 R   |     PREV    =  000001 
  5 PRINT      00216C R   |     PROD    =  000002     |     PSIZE   =  000001 
  5 PWRADC     002161 R   |   5 QKEY       002158 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 REBOOT     00214D R
  5 REG_A      000937 R   |   5 REG_CC     00093B R   |   5 REG_EPC    00092A R
  5 REG_SP     000940 R   |   5 REG_X      000933 R   |   5 REG_Y      00092F R
    RELOP   =  000005     |   5 REMARK     002142 R   |     RETL1   =  000001 
  5 RETURN     002137 R   |   5 RND        00212F R   |     ROP     =  004800 
  5 RSHIFT     002124 R   |     RST_SR  =  0050B3     |   5 RUN        00211C R
    RXCHAR  =  000001     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   5 SAVE       002113 R
    SDIVD   =  000002     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       00210A R   |     SIGN    =  000001 
  5 SIZE       002101 R   |     SKIP    =  000006     |   5 SLEEP      0020F7 R
    SPACE   =  000020     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  000080     |   5 STATES     0008ED R   |   5 STEP       0020EE R
  5 STOP       0020E5 R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      0020DB R
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
    TK_VAR  =  000005     |   5 TO         0020D4 R   |   5 Timer4Up   000019 R
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
    UBC     =  004801     |   5 UBOUND     0020C9 R   |   5 UFLASH     0020BE R
  5 USER_ABO   00007E R   |   5 USR        0020B6 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 UserButt   000025 R
    VSIZ    =  000002     |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       0020AD R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      0020A3 R   |   5 WRITE      002099 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XADR    =  000001     |     XMASK   =  000001 
  5 XOR        002091 R   |     XSAVE   =  000003     |     YSAVE   =  000003 
  5 abs        001EC0 R   |   1 acc16      000008 R   |   1 acc24      000007 R
  1 acc8       000009 R   |   5 accept_c   000AE1 R   |   5 add        001074 R
  5 analog_r   001A02 R   |   5 ansi_seq   000AA3 R   |   5 arduino_   001FCB R
  5 arg_list   0011B3 R   |   1 array_si   00001D R   |   5 ascii      001E0F R
  5 at_tst     000DAE R   |   5 atoi24     000EC1 R   |   5 atoi_exi   000F2F R
  5 bad_port   001E6A R   |   1 base       000006 R   |   1 basicptr   000004 R
  5 beep       001991 R   |   5 bin_exit   000CB2 R   |   5 bit_and    001ED6 R
  5 bit_or     001EF4 R   |   5 bit_rese   00174E R   |   5 bit_set    00173A R
  5 bit_test   001777 R   |   5 bit_togg   001763 R   |   5 bit_xor    001F12 R
  5 bkslsh_t   000D59 R   |   5 bksp       0001C2 R   |   5 break      001AA9 R
  5 break_po   001AD7 R   |   5 bye        001E93 R   |   5 char       001DFB R
  5 check_fu   0003E5 R   |   5 clear_ba   0005E6 R   |   5 clear_va   0004EF R
  5 clock_in   000099 R   |   5 cmd_itf    000B05 R   |   5 cmd_name   00111F R
  5 cmp_name   001B4B R   |   5 cold_sta   000554 R   |   5 colon_ts   000D82 R
  5 comma_ts   000D8D R   |   5 compile    0003F4 R   |   5 convert_   000C3A R
  1 count      000003 R   |   5 cp_loop    001162 R   |   5 create_g   000344 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]

Symbol Table

  5 cstk_pro   00103E R   |   5 dash_tst   000DA3 R   |   5 ddrop      000FBA R
  5 ddrop_n    000FF7 R   |   5 ddup       000FC3 R   |   5 dec_base   001367 R
  5 del_back   000AD2 R   |   5 del_line   00030C R   |   5 del_ln     000AC3 R
  5 delete     0001D2 R   |   5 digital_   001A38 R   |   5 digital_   001A6A R
  5 dir_loop   001D3A R   |   5 director   001D2E R   |   5 divide     0010CA R
  5 divu24_8   000A30 R   |   5 dotr       001047 R   |   5 dotr_loo   00105C R
  5 dots       001014 R   |   5 dpick      000FD4 R   |   5 dpop       000F93 R
  5 dpush      000F86 R   |   5 drive_fr   001DB7 R   |   3 dstack     001740 R
  3 dstack_u   001780 R   |   5 dstk_pro   00100A R   |   1 dstkptr    000016 R
  5 dswap      000FA0 R   |   5 eql_tst    000E0E R   |   5 equal      0015F7 R
  5 err_bad_   0006C3 R   |   5 err_cmd_   000684 R   |   5 err_div0   000646 R
  5 err_dupl   00069F R   |   5 err_math   00062C R   |   5 err_mem_   00060F R
  5 err_msg    0005F7 R   |   5 err_no_a   0006D0 R   |   5 err_no_l   000656 R
  5 err_not_   0006B1 R   |   5 err_run_   00066D R   |   5 err_synt   00061D R
  5 escaped    000C4F R   |   5 expect     0011A6 R   |   5 expr_exi   0012F8 R
  5 expressi   0012B7 R   |   5 factor     00120E R   |   1 farptr     000010 R
  5 fcpu       001F6A R   |   7 fdrive     010000 R   |   5 fetch      000FE3 R
  5 fetchc     000BF2 R   |   1 ffree      000013 R   |   5 file_cou   001DAF R
  5 final_te   000A9D R   |   5 first_li   0013EB R   |   1 flags      00001F R
  5 for        0017DC R   |   5 forget     001CE3 R   |   1 free_ram   000055 R
  5 func_arg   0011D7 R   |   5 ge         0015F9 R   |   5 get_arra   0011E7 R
  5 get_tick   001EBA R   |   5 get_toke   000CF4 R   |   5 getc       0001AF R
  5 go_commo   0018FD R   |   5 gosub      0018DA R   |   5 goto       0018CD R
  5 gpio       001E3C R   |   5 gt         0015F5 R   |   5 gt_tst     000E19 R
  5 hex_base   001362 R   |   5 hse_cloc   00018F R   |   5 hsi_cloc   000199 R
  5 if         0017C8 R   |   1 in         000001 R   |   1 in.saved   000002 R
  1 in.w       000000 R   |   5 incr_far   001B00 R   |   5 input_ex   001706 R
  5 input_lo   0016A1 R   |   5 input_va   001695 R   |   5 insert_l   00037D R
  5 insert_l   0003E2 R   |   5 interp     000784 R   |   5 interp_l   0007C4 R
  5 invalid    000B4A R   |   5 invalid_   000BC8 R   |   5 is_alpha   0004FD R
  5 is_digit   000EAC R   |   5 itoa       0009E9 R   |   5 itoa_loo   000A01 R
  5 key        001E2A R   |   5 kword_di   0022FF R   |   5 kword_en   00208F R
  5 last_lin   0013F4 R   |   5 le         0015FE R   |   5 ledoff     00083D R
  5 ledon      000838 R   |   5 ledtoggl   000842 R   |   5 left_arr   000AA3 R
  5 left_par   00084B R   |   5 let        001398 R   |   5 let02      0013A2 R
  5 lines_sk   0013F9 R   |   5 list       0013C0 R   |   5 list_exi   001440 R
  5 list_sta   00141C R   |   5 load       001C7B R   |   5 loop_bac   0018A6 R
  1 loop_dep   00001C R   |   5 loop_don   0018BB R   |   5 lshift     001F30 R
  5 lt         0015FC R   |   5 lt_tst     000E52 R   |   5 mem_peek   000B67 R
  5 modulo     00110E R   |   5 move       0002A6 R   |   5 move_dow   0002C4 R
  5 move_exi   0002E5 R   |   5 move_loo   0002C9 R   |   5 move_up    0002B6 R
  5 mul_char   0015E6 R   |   5 multiply   001082 R   |   5 mulu24_8   000F33 R
  5 nbr_tst    000D2F R   |   5 ne         001601 R   |   5 neg_acc2   000A58 R
  5 new        001AF5 R   |   5 next       00185E R   |   5 next_tok   0007F4 R
  5 no_match   001174 R   |   5 none       000CF4 R   |   5 number     000BF8 GR
  5 other      000E8A R   |   3 pad        001718 R   |   5 parse_bi   000C92 R
  5 parse_in   000C57 R   |   5 parse_ke   000CBA R   |   5 parse_qu   000BFF R
  5 pause      001EA7 R   |   5 pause02    001EB1 R   |   5 peek       0017B5 R
  5 peek_byt   000B92 R   |   5 pin_mode   001F76 R   |   5 plus_tst   000DE2 R
  5 poke       0017A2 R   |   5 power_ad   0019B9 R   |   5 prcnt_ts   000E03 R
  5 print      001604 R   |   5 print_ex   001669 R   |   5 print_fa   000BD7 R
  5 print_in   00098D R   |   5 print_re   00089A R   |   5 print_st   000B5A R
  5 prt_basi   001493 R   |   5 prt_cmd_   001443 R   |   5 prt_loop   001608 R
  5 prt_peek   000256 R   |   5 prt_quot   001457 R   |   5 prt_reg1   00087B R
  5 prt_reg8   000856 R   |   5 prt_regs   0001EC R   |   5 prti24     000945 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]

Symbol Table

  1 ptr16      000011 R   |   1 ptr8       000012 R   |   5 putc       0001A6 R
  5 puts       0001B8 R   |   5 qkey       001E32 R   |   5 qmark_ts   000DB9 R
  5 random     001FEB R   |   5 readln     000A7B R   |   5 readln_l   000A81 R
  5 readln_q   000AF6 R   |   5 regs_sta   00022F R   |   5 rel_exit   00134F R
  5 relation   0012FB R   |   5 relop_st   0015E9 R   |   5 rem        001709 R
  5 repl       000B13 R   |   5 repl_exi   000B3B R   |   5 reprint    000AA3 R
  5 reset_co   001606 R   |   5 rest_con   001685 R   |   5 return     00191F R
  5 right_ar   000AA3 R   |   5 rparnt_t   000D77 R   |   5 rshift     001F4D R
  5 rt_msg     000704 R   |   5 run        00193F R   |   5 save       001BB7 R
  5 save_con   001675 R   |   5 search_d   001151 R   |   5 search_e   0011A2 R
  5 search_f   001B6C R   |   5 search_l   0002E8 R   |   5 search_l   0002F0 R
  5 search_n   001155 R   |   1 seedx      00000C R   |   1 seedy      00000E R
  5 seek_fdr   001B0E R   |   5 select_p   001FBB R   |   5 sharp_ts   000D98 R
  5 show       001352 R   |   5 single_c   0015E2 R   |   5 size       00136C R
  5 skip       000F6D R   |   5 slash_ts   000DF8 R   |   5 sleep      001E9C R
  5 software   00050E R   |   5 spaces     0001E0 R   |   3 stack_fu   001780 R
  3 stack_un   001800 R   |   5 star_tst   000DED R   |   5 step       001836 R
  5 stop       001982 R   |   5 store      000FED R   |   5 store_lo   001848 R
  5 str_matc   001183 R   |   5 str_tst    000D1E R   |   5 strcmp     000287 R
  5 strcpy     000298 R   |   5 strlen     00027A R   |   5 substrac   00107C R
  5 syntax_e   000714 R   |   1 tab_widt   000020 R   |   5 tb_error   000716 R
  5 term       00126A R   |   5 term01     001273 R   |   5 term_exi   0012B4 R
  5 test_p     000B52 R   |   3 tib        0016C8 R   |   5 tick_tst   000DD0 R
  1 ticks      00000A R   |   5 timer4_i   0000AF R   |   5 to         001806 R
  5 to_upper   000EB5 GR  |   5 token_ch   000E99 R   |   5 token_ex   000EA9 R
  1 txtbgn     000018 R   |   1 txtend     00001A R   |   5 uart3_in   000178 R
  5 uart3_se   000188 R   |   5 uart_ena   0001A1 R   |   5 ubound     001376 R
  5 uflash     001E6F R   |   5 unget_to   000F80 R   |   5 unlock_e   0000C4 R
  5 unlock_f   0000D2 R   |   5 user_spa   002380 R   |   5 usr        001E75 R
  1 vars       000021 R   |   5 wait       00170F R   |   5 warm_sta   000768 R
  5 words      002055 R   |   5 write      001DC4 R   |   5 write_bl   000155 R
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

