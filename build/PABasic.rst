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
      00808E CD 89 27         [ 4]  153 	call print_registers
      008091 CD 8B 92         [ 4]  154 	call cmd_itf
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
      0080C7 CD 82 45         [ 4]  186 	call puts 
      0080CA CE 00 05         [ 2]  187 	ldw x,basicptr
      0080CD FE               [ 2]  188 	ldw x,(x)
                                    189 ; print line number 
      0080CE 35 0A 00 07      [ 1]  190 	mov base,#10 
      0080D2 35 06 00 21      [ 1]  191 	mov tab_width,#6
      0080D6 CD 8A 1A         [ 4]  192 	call print_int  	
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
      0080FB CC 87 F5         [ 2]  209 	jp warm_start
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
      0081F2 CD 9B 8D         [ 4]  452 	call incr_farptr
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
      00824B 5C               [ 1]  529 	incw x 
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
      008281 AE 89 B7         [ 2]  601 	ldw x,#REG_EPC 
      008284 CD 89 08         [ 4]  602 	call prt_reg16 
                                    603 ; register CC 
      008287 7B 08            [ 1]  604 	ld a,(R_CC,sp)
      008289 AE 89 C8         [ 2]  605 	ldw x,#REG_CC 
      00828C CD 88 E3         [ 4]  606 	call prt_reg8 
                                    607 ; register A 
      00828F 7B 07            [ 1]  608 	ld a,(R_A,sp)
      008291 AE 89 C4         [ 2]  609 	ldw x,#REG_A 
      008294 CD 88 E3         [ 4]  610 	call prt_reg8 
                                    611 ; register X 
      008297 16 05            [ 2]  612 	ldw y,(R_X,sp)
      008299 AE 89 C0         [ 2]  613 	ldw x,#REG_X 
      00829C CD 89 08         [ 4]  614 	call prt_reg16 
                                    615 ; register Y 
      00829F 16 03            [ 2]  616 	ldw y,(R_Y,sp)
      0082A1 AE 89 BC         [ 2]  617 	ldw x,#REG_Y 
      0082A4 CD 89 08         [ 4]  618 	call prt_reg16 
                                    619 ; register SP 
      0082A7 90 96            [ 1]  620 	ldw y,sp
      0082A9 72 A9 00 08      [ 2]  621 	addw y,#6+ARG_OFS  
      0082AD AE 89 CD         [ 2]  622 	ldw x,#REG_SP
      0082B0 CD 89 08         [ 4]  623 	call prt_reg16
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
      0082EE CD 89 D2         [ 4]  645 	call prti24 
      0082F1 A6 3A            [ 1]  646 	ld a,#': 
      0082F3 CD 82 33         [ 4]  647 	call putc 
      0082F6 A6 20            [ 1]  648 	ld a,#SPACE 
      0082F8 CD 82 33         [ 4]  649 	call putc 
      0082FB 85               [ 2]  650 	popw x 
      0082FC F6               [ 1]  651 	ld a,(x)
      0082FD C7 00 0A         [ 1]  652 	ld acc8,a 
      008300 5F               [ 1]  653 	clrw x 
      008301 A6 10            [ 1]  654 	ld a,#16 
      008303 CD 89 D2         [ 4]  655 	call prti24
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
      00830E 5C               [ 1]  671 	incw x
      00830F 90 5C            [ 1]  672 	incw y 
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
      00831B 5C               [ 1]  689 	incw x 
      00831C 90 5C            [ 1]  690 	incw y 
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
      00832B 5C               [ 1]  713 	incw x 
      00832C 90 5C            [ 1]  714 	incw y 
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
      00847D CC 87 A3         [ 2]  967 	jp tb_error 
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
      00849B CD 8D 81         [ 4] 1001 	call get_token
      00849E 1F 01            [ 2] 1002 	ldw (XSAVE,sp),x 
      0084A0 A1 04            [ 1] 1003 	cp a,#TK_INTGR 
      0084A2 26 11            [ 1] 1004 	jrne 3$
      0084A4 A3 00 00         [ 2] 1005 	cpw x,#0  
      0084A7 22 03            [ 1] 1006 	jrugt 1$
      0084A9 CC 87 A1         [ 2] 1007 	jp syntax_error 
      0084AC 72 CF 00 12      [ 5] 1008 1$:	ldw [ptr16],x; line number
      0084B0 CD 8D 81         [ 4] 1009 2$:	call get_token
      0084B3 1F 01            [ 2] 1010 	ldw (XSAVE,sp),x 
      0084B5 A1 00            [ 1] 1011 3$:	cp a,#TK_NONE 
      0084B7 26 03            [ 1] 1012 	jrne 30$
      0084B9 CC 85 4C         [ 2] 1013 	jp 9$
      0084BC                       1014 30$: 	 
      0084BC 1E 03            [ 2] 1015 	ldw x,(BUFIDX,sp)
      0084BE CD 84 72         [ 4] 1016 	call check_full 
      0084C1 16 03            [ 2] 1017 	ldw y,(BUFIDX,sp) 
      0084C3 91 D7 12         [ 4] 1018 	ld ([ptr16],y),a ; token attribute 
      0084C6 90 5C            [ 1] 1019 	incw y
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
      0084DA 90 5C            [ 1] 1030 	incw y 
      0084DC 17 03            [ 2] 1031 	ldw (BUFIDX,sp),y 
      0084DE 20 D0            [ 2] 1032 	jra 2$ 
      0084E0                       1033 32$:
      0084E0 A1 02            [ 1] 1034 	cp a,#TK_ARRAY 
      0084E2 27 CC            [ 1] 1035 	jreq 2$ 
      0084E4 A1 0A            [ 1] 1036 	cp a,#TK_QSTR 
      0084E6 26 25            [ 1] 1037 	jrne 4$
      0084E8 AE 17 18         [ 2] 1038 	ldw x,#pad 
      0084EB CD 83 07         [ 4] 1039 	call strlen
      0084EE 5C               [ 1] 1040 	incw x  
      0084EF CD 84 72         [ 4] 1041 	call check_full 
      0084F2 90 AE 17 18      [ 2] 1042 	ldw y,#pad 
      0084F6 CE 00 12         [ 2] 1043 	ldw x,ptr16
      0084F9 72 FB 03         [ 2] 1044 	addw x,(BUFIDX,sp)	
      0084FC CD 83 25         [ 4] 1045 	call strcpy 
      0084FF AE 17 18         [ 2] 1046 	ldw x,#pad 
      008502 CD 83 07         [ 4] 1047 	call strlen 
      008505 5C               [ 1] 1048 	incw x
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
      00851C A3 97 96         [ 2] 1059 	cpw x,#rem 
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
      00853B 5C               [ 1] 1070 	incw x ; skip string 0. 
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
      008584 5C               [ 1] 1110 	incw x 
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
      008608 72 5F 50 C7      [ 1] 1161 	clr CLK_PCKENR1 
      00860C 72 5F 50 CA      [ 1] 1162 	clr CLK_PCKENR2 
                                   1163 ; select internal clock no divisor: 16 Mhz 	
      008610 A6 E1            [ 1] 1164 	ld a,#CLK_SWR_HSI 
      008612 5F               [ 1] 1165 	clrw x  
      008613 CD 81 19         [ 4] 1166     call clock_init 
      008616 CD 81 2F         [ 4] 1167 	call timer4_init
                                   1168 ; UART1 at 115200 BAUD
      008619 CD 81 F8         [ 4] 1169 	call uart1_init
                                   1170 ; activate PE_4 (user button interrupt)
      00861C 72 18 50 18      [ 1] 1171     bset PE_CR2,#USR_BTN_BIT 
                                   1172 ; display system information
      008620 AE 85 9B         [ 2] 1173 	ldw x,#software 
      008623 CD 82 45         [ 4] 1174 	call puts 
      008626 A6 01            [ 1] 1175 	ld a,#MAJOR 
      008628 C7 00 0A         [ 1] 1176 	ld acc8,a 
      00862B 5F               [ 1] 1177 	clrw x 
      00862C CF 00 08         [ 2] 1178 	ldw acc24,x 
      00862F A6 0A            [ 1] 1179 	ld a,#10 
      008631 CD 89 D2         [ 4] 1180 	call prti24 
      008634 A6 2E            [ 1] 1181 	ld a,#'.
      008636 CD 82 33         [ 4] 1182 	call putc 
      008639 A6 00            [ 1] 1183 	ld a,#MINOR 
      00863B C7 00 0A         [ 1] 1184 	ld acc8,a 
      00863E 5F               [ 1] 1185 	clrw x 
      00863F CF 00 08         [ 2] 1186 	ldw acc24,x 
      008642 A6 0A            [ 1] 1187 	ld a,#10 
      008644 CD 89 D2         [ 4] 1188 	call prti24 
      008647 A6 0D            [ 1] 1189 	ld a,#CR 
      008649 CD 82 33         [ 4] 1190 	call putc 
      00864C CD 9B 9B         [ 4] 1191 	call seek_fdrive 
                                   1192 ; configure LD2 pin 
      00864F 72 1A 50 0D      [ 1] 1193     bset PC_CR1,#LED2_BIT
      008653 72 1A 50 0E      [ 1] 1194     bset PC_CR2,#LED2_BIT
      008657 72 1A 50 0C      [ 1] 1195     bset PC_DDR,#LED2_BIT
      00865B 9A               [ 1] 1196 	rim 
      00865C 72 5C 00 10      [ 1] 1197 	inc seedy+1 
      008660 72 5C 00 0E      [ 1] 1198 	inc seedx+1 
      008664 CD 86 73         [ 4] 1199 	call clear_basic
      008667 CD 94 03         [ 4] 1200 	call ubound 
      00866A CD 90 20         [ 4] 1201 	call dpop 
      00866D CF 00 1E         [ 2] 1202 	ldw array_size,x 
      008670 CC 87 F5         [ 2] 1203     jp warm_start 
                                   1204 
                                   1205 ;---------------------------
                                   1206 ; reset BASIC text variables 
                                   1207 ; and clear variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1208 ;---------------------------
      008673                       1209 clear_basic:
      008673 72 5F 00 04      [ 1] 1210 	clr count 
      008677 AE 00 56         [ 2] 1211 	ldw x,#free_ram 
      00867A CF 00 19         [ 2] 1212 	ldw txtbgn,x 
      00867D CF 00 1B         [ 2] 1213 	ldw txtend,x 
      008680 CD 85 7C         [ 4] 1214 	call clear_vars 
      008683 81               [ 4] 1215 	ret 
                                   1216 
                                   1217 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1218 ;;   Tiny BASIC error messages     ;;
                                   1219 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008684                       1220 err_msg:
      008684 00 00 86 9C 86 AA 86  1221 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             B9 86 D3 86 E3
      008690 86 FA 87 11 87 2C 87  1222 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             3E 87 50
      00869A 87 5D                 1223 	.word err_no_access 
                                   1224 
      00869C 0A 4D 65 6D 6F 72 79  1225 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      0086AA 0A 73 79 6E 74 61 78  1226 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      0086B9 0A 6D 61 74 68 20 6F  1227 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0086D3 0A 64 69 76 69 73 69  1228 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      0086E3 0A 69 6E 76 61 6C 69  1229 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      0086FA 0A 72 75 6E 20 74 69  1230 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      008711 0A 63 6F 6D 6D 61 6E  1231 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      00872C 0A 64 75 70 6C 69 63  1232 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      00873E 0A 46 69 6C 65 20 6E  1233 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      008750 0A 62 61 64 20 76 61  1234 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      00875D 0A 46 69 6C 65 20 69  1235 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal  6E-Bits]



             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
                                   1236 
      00877A 27 74 20 62 65 20 72  1237 rt_msg: .asciz "last token id: "
             75 6E 20 66 72 6F 6D
             20 74
                                   1238 
      000721                       1239 syntax_error:
      00878A 68 65            [ 1] 1240 	ld a,#ERR_SYNTAX 
                                   1241 
      000723                       1242 tb_error:
      00878C 72 65 2E         [ 2] 1243 	ldw x, #err_msg 
      00878F 0A 00 6C 61      [ 1] 1244 	clr acc16 
      008793 73               [ 1] 1245 	sll a
      008794 74 20 74 6F      [ 1] 1246 	rlc acc16  
      008798 6B 65 6E         [ 1] 1247 	ld acc8, a 
      00879B 20 69 64 3A      [ 2] 1248 	addw x,acc16 
      00879F 20               [ 2] 1249 	ldw x,(x)
      0087A0 00 01 C5         [ 4] 1250 	call puts
      0087A1 72 0B 00 1F 18   [ 2] 1251 	btjf flags,#FCOMP, 1$
      0087A1 A6 02 C8         [ 2] 1252 	ldw x,#tib
      0087A3 CD 01 C5         [ 4] 1253 	call puts 
      0087A3 AE 86            [ 1] 1254 	ld a,#CR 
      0087A5 84 72 5F         [ 4] 1255 	call putc
      0087A8 00 09 48         [ 2] 1256 	ldw x,in.w
      0087AB 72 59 00         [ 4] 1257 	call spaces
      0087AE 09 C7            [ 1] 1258 	ld a,#'^
      0087B0 00 0A 72         [ 4] 1259 	call putc 
      0087B3 BB 00            [ 2] 1260 	jra 6$
      0087B5 09 FE CD         [ 2] 1261 1$:	ldw x,basicptr
      0087B8 82 45 72         [ 4] 1262 	call prt_basic_line
      0087BB 0B 00 20         [ 2] 1263 	ldw x,#rt_msg 
      0087BE 18 AE 16         [ 4] 1264 	call puts 
      0087C1 C8               [ 1] 1265 	clrw x 
      0087C2 CD 82 45         [ 1] 1266 	ld a,in.saved 
      0087C5 A6               [ 1] 1267 	ld xl,a 
      0087C6 0D CD 82 33      [ 4] 1268 	ld a,([basicptr],x)
      0087CA CE               [ 1] 1269 	clrw x 
      0087CB 00               [ 1] 1270 	ld xl,a 
      0087CC 01 CD 82         [ 4] 1271 	call print_int 
      0087CF 6D A6 5E         [ 2] 1272 6$: ldw x,#STACK_EMPTY 
      0087D2 CD               [ 1] 1273     ldw sp,x
      000775                       1274 warm_start:
      0087D3 82 33 20 1A      [ 1] 1275 	clr flags 
      0087D7 CE 00 05 CD      [ 1] 1276 	clr loop_depth 
      0087DB 95 20 AE         [ 2] 1277 	ldw x,#dstack_unf 
      0087DE 87 91 CD         [ 2] 1278 	ldw dstkptr,x 
      0087E1 82 45 5F C6      [ 1] 1279 	mov tab_width,#TAB_WIDTH 
      0087E5 00 03 97 72      [ 1] 1280 	mov base,#10 
      0087E9 D6 00 05         [ 2] 1281 	ldw x,#tib 
      0087EC 5F 97 CD         [ 2] 1282 	ldw basicptr,x 
                                   1283 ;----------------------------
                                   1284 ;   BASIC interpreter
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1285 ;----------------------------
      000791                       1286 interp:
      0087EF 8A 1A AE 17      [ 1] 1287 	clr in.w
      0087F3 FF 94 00 1F 23   [ 2] 1288 	btjf flags,#FRUN,4$ 
                                   1289 ; running program
                                   1290 ; goto next basic line 
      0087F5 CE 00 04         [ 2] 1291 	ldw x,basicptr
      0087F5 72 5F            [ 1] 1292 	ld a,(2,x) ; line length 
      0087F7 00 20 72         [ 1] 1293 	ld acc8,a 
      0087FA 5F 00 1D AE      [ 1] 1294 	clr acc16 
      0087FE 17 80 CF 00      [ 2] 1295 	addw x,acc16
      008802 17 35 04         [ 2] 1296 	cpw x,txtend 
      008805 00 21            [ 1] 1297 	jrpl warm_start
      008807 35 0A 00         [ 2] 1298 	ldw basicptr,x ; start of next line  
      00880A 07 AE            [ 1] 1299 	ld a,(2,x)
      00880C 16 C8 CF         [ 1] 1300 	ld count,a 
      00880F 00 05 00 01      [ 1] 1301 	mov in,#3 ; skip first 3 bytes of line 
      008811 20 14            [ 2] 1302 	jra interp_loop 
      0007BD                       1303 4$: ; commande line mode 	
      008811 72 5F 00 01      [ 1] 1304 	clr in
      008815 72 01            [ 1] 1305 	ld a,#CR 
      008817 00 20 23         [ 4] 1306 	call putc 
      00881A CE 00            [ 1] 1307 	ld a,#'> 
      00881C 05 E6 02         [ 4] 1308 	call putc 
      00881F C7 00 0A         [ 4] 1309 	call readln
      008822 72 5F 00         [ 4] 1310 	call compile
      0007D1                       1311 interp_loop:  
      008825 09 72 BB         [ 1] 1312 	ld a,in 
      008828 00 09 C3         [ 1] 1313 	cp a,count  
      00882B 00 1B            [ 1] 1314 	jrpl interp
      00882D 2A C6 CF         [ 4] 1315 	call next_token
      008830 00 05            [ 1] 1316 	cp a,#TK_COLON 
      008832 E6 02            [ 1] 1317 	jreq interp_loop 
      008834 C7 00            [ 1] 1318 	cp a,#TK_NONE 
                                   1319 ;	jreq interp 
      0007E2                       1320 1$:
      008836 04 35            [ 1] 1321 	cp a,#TK_VAR
      008838 03 00            [ 1] 1322 	jrne 2$
      00883A 02 20 14         [ 4] 1323 	call let02  
      00883D 20 E6            [ 2] 1324 	jra interp_loop 
      0007EB                       1325 2$:	
      00883D 72 5F            [ 1] 1326 	cp a,#TK_ARRAY 
      00883F 00 02            [ 1] 1327 	jrne 3$
      008841 A6 0D CD         [ 4] 1328 	call get_array_element
      008844 82 33 A6         [ 4] 1329 	call let02 
      008847 3E CD            [ 2] 1330 	jra interp_loop 
      0007F7                       1331 3$:
      008849 82 33            [ 1] 1332 	cp a,#TK_CMD
      00884B CD 8B            [ 1] 1333 	jrne 4$
      00884D 08               [ 4] 1334 	call (x) 
      00884E CD 84            [ 2] 1335 	jra interp_loop 
      0007FE                       1336 4$:	
      008850 81 07 21         [ 2] 1337 	jp syntax_error 
                                   1338 
                                   1339 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1340 ; extract next token from
                                   1341 ; token list 
                                   1342 ; basicptr -> base address 
                                   1343 ; in  -> offset in list array 
                                   1344 ; output:
                                   1345 ;   A 		token attribute
                                   1346 ;   X 		token value if there is one
                                   1347 ;----------------------------------------
      008851                       1348 next_token:
      008851 C6 00 02         [ 1] 1349 	ld a,in 
      008854 C1 00 04         [ 1] 1350 	sub a,count 
      008857 2A B8            [ 1] 1351 	jreq 9$
      008859 CD 88 81 A1 01   [ 1] 1352 	mov in.saved,in
      00885E 27 F1 A1         [ 2] 1353 	ldw x,basicptr 
      008861 00 D6 00 00      [ 4] 1354 	ld a,([in.w],x)
      008862 72 5C 00 01      [ 1] 1355 	inc in 
      008862 A1 05            [ 1] 1356 	cp a,#TK_ARRAY  
      008864 26 05            [ 2] 1357 	jrule 9$
      008866 CD 94            [ 1] 1358 	cp a,#TK_CHAR
      008868 2F 20            [ 1] 1359 	jrne 1$
      00886A E6 D6 00 00      [ 4] 1360 	ld a,([in.w],x)
      00886B 72 5C 00 01      [ 1] 1361 	inc in
      00886B A1               [ 1] 1362 	clrw x 
      00886C 02               [ 1] 1363 	ld xl,a 
      00886D 26 08            [ 1] 1364 	ld a,#TK_CHAR
      00886F CD               [ 4] 1365 	ret 
      008870 92 74            [ 1] 1366 1$:	cp a,#TK_QSTR 
      008872 CD 94            [ 1] 1367 	jrult 2$
      008874 2F 20 DA 00      [ 2] 1368 	addw x,in.w 
      008877 20 0C            [ 2] 1369 	jra 9$
      008877 A1 06 26 03      [ 5] 1370 2$: ldw x,([in.w],x)
      00887B FD 20 D3 01      [ 1] 1371 	inc in 
      00887E 72 5C 00 01      [ 1] 1372 	inc in
      00887E CC               [ 4] 1373 9$: ret	
                                   1374 
                                   1375 
                                   1376 ;----------------------------------------
                                   1377 ;   DEBUG support functions
                                   1378 ;----------------------------------------
                           000001  1379 .if DEBUG 
                                   1380 ; turn LED on 
      000845                       1381 ledon:
      00887F 87 A1 50 0A      [ 1] 1382     bset PC_ODR,#LED2_BIT
      008881 81               [ 4] 1383     ret 
                                   1384 
                                   1385 ; turn LED off 
      00084A                       1386 ledoff:
      008881 C6 00 02 C0      [ 1] 1387     bres PC_ODR,#LED2_BIT 
      008885 00               [ 4] 1388     ret 
                                   1389 
                                   1390 ; invert LED status 
      00084F                       1391 ledtoggle:
      008886 04 27            [ 1] 1392     ld a,#LED2_MASK
      008888 3B 55 00         [ 1] 1393     xor a,PC_ODR
      00888B 02 00 03         [ 1] 1394     ld PC_ODR,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      00888E CE               [ 4] 1395     ret 
                                   1396 
      000858                       1397 left_paren:
      00888F 00 05            [ 1] 1398 	ld a,#SPACE 
      008891 72 D6 00         [ 4] 1399 	call putc
      008894 01 72            [ 1] 1400 	ld a,#'( 
      008896 5C 00 02         [ 4] 1401 	call putc 	
      008899 A1               [ 4] 1402 	ret 
                                   1403 
                                   1404 ;------------------------------
                                   1405 ; print 8 bit register 
                                   1406 ; input:
                                   1407 ;   X  point to register name 
                                   1408 ;   A  register value to print 
                                   1409 ; output:
                                   1410 ;   none
                                   1411 ;------------------------------- 
      000863                       1412 prt_reg8:
      00889A 02               [ 1] 1413 	push a 
      00889B 23 27 A1         [ 4] 1414 	call puts 
      00889E 03 26            [ 1] 1415 	ld a,(1,sp) 
      0088A0 0D 72 D6         [ 1] 1416 	ld acc8,a 
      0088A3 00               [ 1] 1417 	clrw x 
      0088A4 01               [ 1] 1418 	ld xl,a 
      0088A5 72 5C 00 02      [ 1] 1419 	mov base,#16
      0088A9 5F 97 A6         [ 4] 1420 	call print_int 
      0088AC 03 81 A1         [ 4] 1421 	call left_paren 
      0088AF 0A               [ 1] 1422 	pop a 
      0088B0 25               [ 1] 1423 	clrw x 
      0088B1 06               [ 1] 1424 	ld xl,a 
      0088B2 72 BB 00 01      [ 1] 1425 	mov base,#10 
      0088B6 20 0C 72         [ 4] 1426 	call print_int  
      0088B9 DE 00            [ 1] 1427 	ld a,#') 
      0088BB 01 72 5C         [ 4] 1428 	call putc
      0088BE 00               [ 4] 1429 	ret
                                   1430 
                                   1431 ;--------------------------------
                                   1432 ; print 16 bits register 
                                   1433 ; input:
                                   1434 ;   X   point register name 
                                   1435 ;   Y   register value to print 
                                   1436 ; output:
                                   1437 ;  none
                                   1438 ;--------------------------------
      000888                       1439 prt_reg16: 
      0088BF 02 72            [ 2] 1440 	pushw y 
      0088C1 5C 00 02         [ 4] 1441 	call puts 
      0088C4 81 01            [ 2] 1442 	ldw x,(1,sp) 
      0088C5 35 10 00 06      [ 1] 1443 	mov base,#16 
      0088C5 72 1A 50         [ 4] 1444 	call print_int  
      0088C8 0A 81 58         [ 4] 1445 	call left_paren 
      0088CA 85               [ 2] 1446 	popw x 
      0088CA 72 1B 50 0A      [ 1] 1447 	mov base,#10 
      0088CE 81 09 9A         [ 4] 1448 	call print_int  
      0088CF A6 29            [ 1] 1449 	ld a,#') 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0088CF A6 20 C8         [ 4] 1450 	call putc
      0088D2 50               [ 4] 1451 	ret 
                                   1452 
                                   1453 ;------------------------------------
                                   1454 ; print registers contents saved on
                                   1455 ; stack by trap interrupt.
                                   1456 ;------------------------------------
      0008A7                       1457 print_registers:
      0088D3 0A C7 50         [ 2] 1458 	ldw x,#STATES
      0088D6 0A 81 C5         [ 4] 1459 	call puts
                                   1460 ; print EPC 
      0088D8 AE 09 37         [ 2] 1461 	ldw x, #REG_EPC
      0088D8 A6 20 CD         [ 4] 1462 	call puts 
      0088DB 82 33            [ 1] 1463 	ld a, (11,sp)
      0088DD A6 28 CD         [ 1] 1464 	ld acc8,a 
      0088E0 82 33            [ 1] 1465 	ld a, (10,sp) 
      0088E2 81 00 08         [ 1] 1466 	ld acc16,a 
      0088E3 7B 09            [ 1] 1467 	ld a,(9,sp) 
      0088E3 88 CD 82         [ 1] 1468 	ld acc24,a
      0088E6 45               [ 1] 1469 	clrw x  
      0088E7 7B 01            [ 1] 1470 	ld a,#16
      0088E9 C7 00 0A         [ 4] 1471 	call prti24  
                                   1472 ; print X
      0088EC 5F 97 35         [ 2] 1473 	ldw x,#REG_X
      0088EF 10 00            [ 2] 1474 	ldw y,(5,sp)
      0088F1 07 CD 8A         [ 4] 1475 	call prt_reg16  
                                   1476 ; print Y 
      0088F4 1A CD 88         [ 2] 1477 	ldw x,#REG_Y
      0088F7 D8 84            [ 2] 1478 	ldw y, (7,sp)
      0088F9 5F 97 35         [ 4] 1479 	call prt_reg16  
                                   1480 ; print A 
      0088FC 0A 00 07         [ 2] 1481 	ldw x,#REG_A
      0088FF CD 8A            [ 1] 1482 	ld a, (4,sp) 
      008901 1A A6 29         [ 4] 1483 	call prt_reg8
                                   1484 ; print CC 
      008904 CD 82 33         [ 2] 1485 	ldw x,#REG_CC 
      008907 81 03            [ 1] 1486 	ld a, (3,sp) 
      008908 CD 08 63         [ 4] 1487 	call prt_reg8 
                                   1488 ; print SP 
      008908 90 89 CD         [ 2] 1489 	ldw x,#REG_SP
      00890B 82 45            [ 1] 1490 	ldw y,sp 
      00890D 1E 01 35 10      [ 2] 1491 	addw y,#12
      008911 00 07 CD         [ 4] 1492 	call prt_reg16  
      008914 8A 1A            [ 1] 1493 	ld a,#'\n' 
      008916 CD 88 D8         [ 4] 1494 	call putc
      008919 85               [ 4] 1495 	ret
                                   1496 
      00891A 35 0A 00 07 CD 8A 1A  1497 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             A6 29 CD 82 33 81 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



             2D 2D 2D 0A 00
      008927 45 50 43 3A 00        1498 REG_EPC: .asciz "EPC:"
      008927 AE 89 7A CD           1499 REG_Y:   .asciz "\nY:" 
      00892B 82 45 AE 89           1500 REG_X:   .asciz "\nX:"
      00892F B7 CD 82 45           1501 REG_A:   .asciz "\nA:" 
      008933 7B 0B C7 00 0A        1502 REG_CC:  .asciz "\nCC:"
      008938 7B 0A C7 00 09        1503 REG_SP:  .asciz "\nSP:"
                                   1504 .endif ; DEBUG 
                                   1505 
                                   1506 ;------------------------------------
                                   1507 ; print integer in acc24 
                                   1508 ; input:
                                   1509 ;	acc24 		integer to print 
                                   1510 ;	A 			numerical base for conversion 
                                   1511 ;               if bit 7 is set add a space at print end.
                                   1512 ;   XL 			field width, 0 -> no fill.
                                   1513 ;  output:
                                   1514 ;    none 
                                   1515 ;------------------------------------
                           000001  1516 	WIDTH = 1
                           000002  1517 	BASE = 2
                           000003  1518 	ADD_SPACE=3 ; add a space after number 
                           000003  1519 	VSIZE = 3
      000952                       1520 prti24:
      000952                       1521 	_vars VSIZE 
      00893D 7B 09            [ 2]    1     sub sp,#VSIZE 
      00893F C7 00            [ 1] 1522 	clr (ADD_SPACE,sp)
      008941 08 5F            [ 1] 1523 	bcp a,#0x80 
      008943 A6 10            [ 1] 1524 	jreq 0$ 
      008945 CD 89            [ 1] 1525 	cpl (ADD_SPACE,sp)
      008947 D2 AE            [ 1] 1526 0$:	and a,#31 
      008949 89 C0            [ 1] 1527 	ld (BASE,sp),a
      00894B 16               [ 1] 1528 	ld a,xl
      00894C 05 CD            [ 1] 1529 	ld (WIDTH,sp),a 
      00894E 89 08            [ 1] 1530 	ld a, (BASE,sp)  
      008950 AE 89 BC         [ 4] 1531     call itoa  ; conversion entier en  .asciz
      008953 16 07            [ 1] 1532 1$: ld a,(WIDTH,sp)
      008955 CD 89            [ 1] 1533 	jreq 4$
      008957 08 AE 89         [ 1] 1534 	ld acc8,a 
      00895A C4               [ 2] 1535 	pushw x 
      00895B 7B 04 CD         [ 4] 1536 	call strlen 
      00895E 88               [ 1] 1537 	ld a,xl 
      00895F E3               [ 2] 1538 	popw x 
      008960 AE 89 C8         [ 3] 1539 	exg a,acc8 
      008963 7B 03 CD         [ 1] 1540 	sub a,acc8 
      008966 88 E3            [ 1] 1541 	jrmi 4$
      008968 AE 89            [ 1] 1542 	ld (WIDTH,sp),a 
      00896A CD 90            [ 1] 1543 	ld  a,#SPACE
      00896C 96 72            [ 1] 1544 3$: tnz (WIDTH,sp)
      00896E A9 00            [ 1] 1545 	jreq 4$
      008970 0C               [ 2] 1546 	decw x 
      008971 CD               [ 1] 1547 	ld (x),a 
      008972 89 08            [ 1] 1548 	dec (WIDTH,sp) 
      008974 A6 0A            [ 2] 1549 	jra 3$
      00098B                       1550 4$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      008976 CD 82 33         [ 4] 1551 	call puts 
      008979 81 0A            [ 1] 1552 	tnz (ADD_SPACE,sp)
      00897B 52 65            [ 1] 1553 	jreq 5$
      00897D 67 69            [ 1] 1554     ld a,#SPACE 
      00897F 73 74 65         [ 4] 1555 	call putc 
      000997                       1556 5$: _drop VSIZE 
      008982 72 73            [ 2]    1     addw sp,#VSIZE 
      008984 20               [ 4] 1557     ret	
                                   1558 
                                   1559 ;-----------------------------------
                                   1560 ; print a 16 bit integer 
                                   1561 ; using variable 'base' as conversion
                                   1562 ; format.
                                   1563 ; input:
                                   1564 ;   X       integer to print 
                                   1565 ;   base    conversion base 
                                   1566 ; output:
                                   1567 ;   none 
                                   1568 ;-----------------------------------
                           000001  1569 	SIGN=1
                           000001  1570 	VSIZE=1
      00099A                       1571 print_int: 
      00099A                       1572 	_vars VSIZE 
      008985 73 74            [ 2]    1     sub sp,#VSIZE 
      008987 61 74            [ 1] 1573 	clr (SIGN,sp)
      008989 65 20 61 74      [ 2] 1574 	ldw y,#pad+PAD_SIZE-1 
      00898D 20 61            [ 1] 1575 	clr (y)
      00898F 62 6F 72         [ 1] 1576 	ld a,base  
      008992 74 20            [ 1] 1577 	cp a,#10 
      008994 70 6F            [ 1] 1578 	jrne 1$ 
      008996 69               [ 2] 1579 	tnzw x 
      008997 6E 74            [ 1] 1580 	jrpl 1$ 
      008999 2E 0A            [ 1] 1581 	cpl (SIGN,sp)
      00899B 2D               [ 2] 1582 	negw x 	 
      0009B1                       1583 1$:	
      00899C 2D 2D 2D         [ 1] 1584 	ld a,base 
      00899F 2D               [ 2] 1585 	div x,a 
      0089A0 2D 2D            [ 1] 1586 	add a,#'0 
      0089A2 2D 2D            [ 1] 1587 	cp a,#'9+1 
      0089A4 2D 2D            [ 1] 1588 	jrmi 2$ 
      0089A6 2D 2D            [ 1] 1589 	add a,#7 
      0089A8 2D 2D            [ 2] 1590 2$: decw y 
      0089AA 2D 2D            [ 1] 1591 	ld (y),a 
      0089AC 2D               [ 2] 1592 	tnzw x 
      0089AD 2D 2D            [ 1] 1593 	jrne 1$ 
      0089AF 2D 2D            [ 1] 1594 	ld a,#16 
      0089B1 2D 2D 2D         [ 1] 1595 	cp a,base 
      0089B4 2D 0A            [ 1] 1596 	jrne 3$
      0089B6 00 45            [ 1] 1597 	ld a,#'$
      0089B8 50 43            [ 2] 1598 	decw y  
      0089BA 3A 00            [ 1] 1599 	ld (y),a
      0089BC 0A 59            [ 2] 1600 	jra 9$ 
      0089BE 3A 00            [ 1] 1601 3$: tnz (SIGN,sp)
      0089C0 0A 58            [ 1] 1602 	jreq 9$ 
      0089C2 3A 00            [ 1] 1603 	ld a,#'-
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0089C4 0A 41            [ 2] 1604 	decw y  
      0089C6 3A 00            [ 1] 1605 	ld (y),a
      0009DD                       1606 9$:	
      0089C8 0A               [ 1] 1607 	ldw x,y 
      0089C9 43 43 3A         [ 2] 1608 	subw x,#pad+PAD_SIZE-1 
      0089CC 00               [ 2] 1609 	negw x  
      0009E2                       1610 10$:
      0089CD 0A 53            [ 2] 1611 	decw y 
      0089CF 50 3A            [ 1] 1612 	ld a,#SPACE 
      0089D1 00 F7            [ 1] 1613 	ld (y),a
      0089D2 5C               [ 1] 1614 	incw x 
      0089D2 52               [ 1] 1615 	ld a,xl 
      0089D3 03 0F 03         [ 1] 1616 	cp a,tab_width
      0089D6 A5 80            [ 1] 1617 	jrmi 10$ 
      0009EF                       1618 12$:
      0089D8 27               [ 1] 1619     ldw x,y 
      0089D9 02 03 03         [ 4] 1620 	call puts  
      0009F3                       1621 	_drop VSIZE 
      0089DC A4 1F            [ 2]    1     addw sp,#VSIZE 
      0089DE 6B               [ 4] 1622 	ret 
                                   1623 
                                   1624 ;------------------------------------
                                   1625 ; convert integer in acc24 to string
                                   1626 ; input:
                                   1627 ;   A	  	base
                                   1628 ;	acc24	integer to convert
                                   1629 ; output:
                                   1630 ;   X  		pointer to string
                                   1631 ;------------------------------------
                           000001  1632 	SIGN=1  ; integer sign 
                           000002  1633 	BASE=2  ; numeric base 
                           000002  1634 	VSIZE=2  ;locals size
      0009F6                       1635 itoa:
      0089DF 02 9F            [ 2] 1636 	sub sp,#VSIZE
      0089E1 6B 01            [ 1] 1637 	ld (BASE,sp), a  ; base
      0089E3 7B 02            [ 1] 1638 	clr (SIGN,sp)    ; sign
      0089E5 CD 8A            [ 1] 1639 	cp a,#10
      0089E7 76 7B            [ 1] 1640 	jrne 1$
                                   1641 	; base 10 string display with negative sign if bit 23==1
      0089E9 01 27 1F C7 00   [ 2] 1642 	btjf acc24,#7,1$
      0089EE 0A 89            [ 1] 1643 	cpl (SIGN,sp)
      0089F0 CD 83 07         [ 4] 1644 	call neg_acc24
      000A0A                       1645 1$:
                                   1646 ; initialize string pointer 
      0089F3 9F 85 31         [ 2] 1647 	ldw x,#pad+PAD_SIZE-1
      0089F6 00               [ 1] 1648 	clr (x)
      000A0E                       1649 itoa_loop:
      0089F7 0A C0            [ 1] 1650     ld a,(BASE,sp)
      0089F9 00 0A 2B         [ 4] 1651     call divu24_8 ; acc24/A 
      0089FC 0E 6B            [ 1] 1652     add a,#'0  ; remainder of division
      0089FE 01 A6            [ 1] 1653     cp a,#'9+1
      008A00 20 0D            [ 1] 1654     jrmi 2$
      008A02 01 27            [ 1] 1655     add a,#7 
      008A04 06               [ 2] 1656 2$: decw x
      008A05 5A               [ 1] 1657     ld (x),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1658 	; if acc24==0 conversion done
      008A06 F7 0A 01         [ 1] 1659 	ld a,acc24
      008A09 20 F6 08         [ 1] 1660 	or a,acc16
      008A0B CA 00 09         [ 1] 1661 	or a,acc8
      008A0B CD 82            [ 1] 1662     jrne itoa_loop
                                   1663 	;conversion done, next add '$' or '-' as required
      008A0D 45 0D            [ 1] 1664 	ld a,(BASE,sp)
      008A0F 03 27            [ 1] 1665 	cp a,#16
      008A11 05 A6            [ 1] 1666 	jreq 8$
      008A13 20 CD            [ 1] 1667 	ld a,(SIGN,sp)
      008A15 82 33            [ 1] 1668     jreq 10$
      008A17 5B 03            [ 1] 1669     ld a,#'-
      008A19 81 02            [ 2] 1670 	jra 9$ 
      008A1A A6 24            [ 1] 1671 8$: ld a,#'$ 
      008A1A 52               [ 2] 1672 9$: decw x
      008A1B 01               [ 1] 1673     ld (x),a
      000A3A                       1674 10$:
      008A1C 0F 01            [ 2] 1675 	addw sp,#VSIZE
      008A1E 90               [ 4] 1676 	ret
                                   1677 
                                   1678 ;-------------------------------------
                                   1679 ; divide uint24_t by uint8_t
                                   1680 ; used to convert uint24_t to string
                                   1681 ; input:
                                   1682 ;	acc24	dividend
                                   1683 ;   A 		divisor
                                   1684 ; output:
                                   1685 ;   acc24	quotient
                                   1686 ;   A		remainder
                                   1687 ;------------------------------------- 
                                   1688 ; offset  on sp of arguments and locals
                           000001  1689 	U8   = 1   ; divisor on stack
                           000001  1690 	VSIZE =1
      000A3D                       1691 divu24_8:
      008A1F AE               [ 2] 1692 	pushw x ; save x
      008A20 17               [ 1] 1693 	push a 
                                   1694 	; ld dividend UU:MM bytes in X
      008A21 3F 90 7F         [ 1] 1695 	ld a, acc24
      008A24 C6               [ 1] 1696 	ld xh,a
      008A25 00 07 A1         [ 1] 1697 	ld a,acc24+1
      008A28 0A               [ 1] 1698 	ld xl,a
      008A29 26 06            [ 1] 1699 	ld a,(U8,SP) ; divisor
      008A2B 5D               [ 2] 1700 	div x,a ; UU:MM/U8
      008A2C 2A               [ 1] 1701 	push a  ;save remainder
      008A2D 03               [ 1] 1702 	ld a,xh
      008A2E 03 01 50         [ 1] 1703 	ld acc24,a
      008A31 9F               [ 1] 1704 	ld a,xl
      008A31 C6 00 07         [ 1] 1705 	ld acc24+1,a
      008A34 62               [ 1] 1706 	pop a
      008A35 AB               [ 1] 1707 	ld xh,a
      008A36 30 A1 3A         [ 1] 1708 	ld a,acc24+2
      008A39 2B               [ 1] 1709 	ld xl,a
      008A3A 02 AB            [ 1] 1710 	ld a,(U8,sp) ; divisor
      008A3C 07               [ 2] 1711 	div x,a  ; R:LL/U8
      008A3D 90 5A            [ 1] 1712 	ld (U8,sp),a ; save remainder
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008A3F 90               [ 1] 1713 	ld a,xl
      008A40 F7 5D 26         [ 1] 1714 	ld acc24+2,a
      008A43 ED               [ 1] 1715 	pop a
      008A44 A6               [ 2] 1716 	popw x
      008A45 10               [ 4] 1717 	ret
                                   1718 
                                   1719 ;------------------------------------
                                   1720 ;  two's complement acc24
                                   1721 ;  input:
                                   1722 ;		acc24 variable
                                   1723 ;  output:
                                   1724 ;		acc24 variable
                                   1725 ;-------------------------------------
      000A65                       1726 neg_acc24:
      008A46 C1 00 07 26      [ 1] 1727 	cpl acc24+2
      008A4A 08 A6 24 90      [ 1] 1728 	cpl acc24+1
      008A4E 5A 90 F7 20      [ 1] 1729 	cpl acc24
      008A52 0A 0D            [ 1] 1730 	ld a,#1
      008A54 01 27 06         [ 1] 1731 	add a,acc24+2
      008A57 A6 2D 90         [ 1] 1732 	ld acc24+2,a
      008A5A 5A               [ 1] 1733 	clr a
      008A5B 90 F7 08         [ 1] 1734 	adc a,acc24+1
      008A5D C7 00 08         [ 1] 1735 	ld acc24+1,a 
      008A5D 93               [ 1] 1736 	clr a 
      008A5E 1D 17 3F         [ 1] 1737 	adc a,acc24 
      008A61 50 00 07         [ 1] 1738 	ld acc24,a 
      008A62 81               [ 4] 1739 	ret
                                   1740 
                                   1741 
                                   1742 ;------------------------------------
                                   1743 ; read a line of text from terminal
                                   1744 ; input:
                                   1745 ;	none
                                   1746 ; local variable on stack:
                                   1747 ;	LL  line length
                                   1748 ;   RXCHAR last received chaaracte 
                                   1749 ; output:
                                   1750 ;   text in tib  buffer
                                   1751 ;------------------------------------
                                   1752 	; local variables
                           000001  1753 	LL_HB=1
                           000001  1754 	RXCHAR = 1 ; last char received
                           000002  1755 	LL = 2  ; accepted line length
                           000002  1756 	VSIZE=2 
      000A88                       1757 readln:
      008A62 90               [ 1] 1758 	clrw x 
      008A63 5A               [ 2] 1759 	pushw x 
      008A64 A6 20 90 F7      [ 2] 1760  	ldw y,#tib ; input buffer
      000A8E                       1761 readln_loop:
      008A68 5C 9F C1         [ 4] 1762 	call getc
      008A6B 00 21            [ 1] 1763 	ld (RXCHAR,sp),a
      008A6D 2B F3            [ 1] 1764 	cp a,#CR
      008A6F 26 03            [ 1] 1765 	jrne 1$
      008A6F 93 CD 82         [ 2] 1766 	jp readln_quit
      008A72 45 5B            [ 1] 1767 1$:	cp a,#NL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008A74 01 81            [ 1] 1768 	jreq readln_quit
      008A76 A1 08            [ 1] 1769 	cp a,#BSP
      008A76 52 02            [ 1] 1770 	jreq del_back
      008A78 6B 02            [ 1] 1771 	cp a,#CTRL_D
      008A7A 0F 01            [ 1] 1772 	jreq del_ln
      008A7C A1 0A            [ 1] 1773 	cp a,#CTRL_R 
      008A7E 26 0A            [ 1] 1774 	jreq reprint 
                                   1775 ;	cp a,#'[
                                   1776 ;	jreq ansi_seq
      000AAA                       1777 final_test:
      008A80 72 0F            [ 1] 1778 	cp a,#SPACE
      008A82 00 08            [ 1] 1779 	jrpl accept_char
      008A84 05 03            [ 2] 1780 	jra readln_loop
      000AB0                       1781 ansi_seq:
                                   1782 ;	call getc
                                   1783 ;	cp a,#'C 
                                   1784 ;	jreq rigth_arrow
                                   1785 ;	cp a,#'D 
                                   1786 ;	jreq left_arrow 
                                   1787 ;	jra final_test
      000AB0                       1788 right_arrow:
                                   1789 ;	ld a,#BSP 
                                   1790 ;	call putc 
                                   1791 ;	jra realn_loop 
      000AB0                       1792 left_arrow:
                                   1793 
                                   1794 ;	jra readln_loop
      000AB0                       1795 reprint: 
      008A86 01 CD            [ 1] 1796 	tnz (LL,sp)
      008A88 8A E5            [ 1] 1797 	jrne readln_loop
      008A8A AE 16 C8         [ 2] 1798 	ldw x,#tib 
      008A8A AE 17 3F         [ 4] 1799 	call strlen 
      008A8D 7F AE 16 C8      [ 2] 1800 	ldw y,#tib 
      008A8E 9F               [ 1] 1801 	ld a,xl
      008A8E 7B 02            [ 1] 1802 	jreq readln_loop
      008A90 CD 8A            [ 1] 1803 	ld (LL,sp),a 
      008A92 BD AB 30         [ 2] 1804 	ldw x,#tib 
      008A95 A1 3A 2B         [ 4] 1805 	call puts
      008A98 02 AB            [ 1] 1806 	clr (LL_HB,sp)
      008A9A 07 5A F7         [ 2] 1807 	addw y,(LL_HB,sp)
      008A9D C6 00            [ 2] 1808 	jra readln_loop 
      000AD0                       1809 del_ln:
      008A9F 08 CA            [ 1] 1810 	ld a,(LL,sp)
      008AA1 00 09 CA         [ 4] 1811 	call delete
      008AA4 00 0A 26 E6      [ 2] 1812 	ldw y,#tib
      008AA8 7B 02            [ 1] 1813 	clr (y)
      008AAA A1 10            [ 1] 1814 	clr (LL,sp)
      008AAC 27 08            [ 2] 1815 	jra readln_loop
      000ADF                       1816 del_back:
      008AAE 7B 01            [ 1] 1817     tnz (LL,sp)
      008AB0 27 08            [ 1] 1818     jreq readln_loop
      008AB2 A6 2D            [ 1] 1819     dec (LL,sp)
      008AB4 20 02            [ 2] 1820     decw y
      008AB6 A6 24            [ 1] 1821     clr  (y)
      008AB8 5A F7 CF         [ 4] 1822     call bksp 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008ABA 20 A0            [ 2] 1823     jra readln_loop	
      000AEE                       1824 accept_char:
      008ABA 5B 02            [ 1] 1825 	ld a,#TIB_SIZE-1
      008ABC 81 02            [ 1] 1826 	cp a, (LL,sp)
      008ABD 27 9A            [ 1] 1827 	jreq readln_loop
      008ABD 89 88            [ 1] 1828 	ld a,(RXCHAR,sp)
      008ABF C6 00            [ 1] 1829 	ld (y),a
      008AC1 08 95            [ 1] 1830 	inc (LL,sp)
      008AC3 C6 00            [ 1] 1831 	incw y
      008AC5 09 97            [ 1] 1832 	clr (y)
      008AC7 7B 01 62         [ 4] 1833 	call putc 
      008ACA 88 9E            [ 2] 1834 	jra readln_loop
      000B03                       1835 readln_quit:
      008ACC C7 00            [ 1] 1836 	clr (y)
      008ACE 08 9F            [ 1] 1837 	ld a,(LL,sp)
      008AD0 C7 00 09         [ 1] 1838 	ld count,a 
      000B0A                       1839 	_drop VSIZE 
      008AD3 84 95            [ 2]    1     addw sp,#VSIZE 
      008AD5 C6 00            [ 1] 1840 	ld a,#CR
      008AD7 0A 97 7B         [ 4] 1841 	call putc
      008ADA 01               [ 4] 1842 	ret
                                   1843 
                           000001  1844 .if DEBUG 	
                                   1845 ;----------------------------
                                   1846 ; command interface
                                   1847 ; only 3 commands:
                                   1848 ;  'q' to resume application
                                   1849 ;  'p [addr]' to print memory values 
                                   1850 ;  's addr' to print string 
                                   1851 ;----------------------------
                                   1852 ;local variable 
                           000001  1853 	PSIZE=1
                           000001  1854 	VSIZE=1 
      000B12                       1855 cmd_itf:
      008ADB 62 6B            [ 2] 1856 	sub sp,#VSIZE 
      008ADD 01 9F C7 00      [ 1] 1857 	clr farptr 
      008AE1 0A 84 85 81      [ 1] 1858 	clr farptr+1 
      008AE5 72 5F 00 12      [ 1] 1859 	clr farptr+2  
      000B20                       1860 repl:
      008AE5 72 53            [ 1] 1861 	ld a,#CR 
      008AE7 00 0A 72         [ 4] 1862 	call putc 
      008AEA 53 00            [ 1] 1863 	ld a,#'? 
      008AEC 09 72 53         [ 4] 1864 	call putc
      008AEF 00 08 A6 01      [ 1] 1865 	clr in.w 
      008AF3 CB 00 0A C7      [ 1] 1866 	clr in 
      008AF7 00 0A 4F         [ 4] 1867 	call readln
      008AFA C9 00 09 C7      [ 2] 1868 	ldw y,#tib  
      008AFE 00 09            [ 1] 1869 	ld a,(y)
      008B00 4F C9            [ 1] 1870 	jreq repl  
      008B02 00 08 C7 00      [ 1] 1871 	inc in 
      008B06 08 81 C2         [ 4] 1872 	call to_upper 
      008B08 A1 51            [ 1] 1873 	cp a,#'Q 
      008B08 5F 89            [ 1] 1874 	jrne test_p
      000B48                       1875 repl_exit:
      008B0A 90 AE 16 C8      [ 1] 1876 	clr tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B0E 72 5F 00 03      [ 1] 1877 	clr count 
      008B0E CD 82 3C 6B      [ 1] 1878 	clr in 
      000B54                       1879 	_drop #VSIZE 	
      008B12 01 A1            [ 2]    1     addw sp,##VSIZE 
      008B14 0D               [ 4] 1880 	ret  
      000B57                       1881 invalid:
      008B15 26 03 CC         [ 2] 1882 	ldw x,#invalid_cmd 
      008B18 8B 83 A1         [ 4] 1883 	call puts 
      008B1B 0A 27            [ 2] 1884 	jra repl 
      000B5F                       1885 test_p:	
      008B1D 65 A1            [ 1] 1886     cp a,#'P 
      008B1F 08 27            [ 1] 1887 	jreq mem_peek
      008B21 3D A1            [ 1] 1888     cp a,#'S 
      008B23 04 27            [ 1] 1889 	jrne invalid 
      000B67                       1890 print_string:	
      008B25 2A A1 12         [ 4] 1891 	call get_token
      008B28 27 06            [ 1] 1892 	cp a,#TK_INTGR 
      008B2A 26 E9            [ 1] 1893 	jrne invalid 
      008B2A A1 20 2A         [ 4] 1894 	call puts
      008B2D 40 20 DE         [ 2] 1895 	jp repl 	
      008B30                       1896 mem_peek:
      008B30 A6 20            [ 1] 1897 	ld a,#SPACE 
      008B30 CD 0F 7A         [ 4] 1898 	call skip  	 
      008B30 72 B9 00 00      [ 2] 1899 	addw y,in.w 
      008B30 0D 02 26         [ 2] 1900 	ldw x,#pad 
      008B33 DA AE 16         [ 4] 1901 	call strcpy
      008B36 C8 CD 83         [ 4] 1902 	call atoi24 	
      008B39 07 90 AE         [ 1] 1903 	ld a, acc24 
      008B3C 16 C8 9F         [ 1] 1904 	or a,acc16 
      008B3F 27 CD 6B         [ 1] 1905 	or a,acc8 
      008B42 02 AE            [ 1] 1906 	jrne 1$ 
      008B44 16 C8            [ 2] 1907 	jra peek_byte  
      008B46 CD 82 45         [ 2] 1908 1$:	ldw x,acc24 
      008B49 0F 01 72         [ 2] 1909 	ldw farptr,x 
      008B4C F9 01 20         [ 1] 1910 	ld a,acc8 
      008B4F BE 00 12         [ 1] 1911 	ld farptr+2,a 
      008B50                       1912 peek_byte:
      008B50 7B 02 CD         [ 4] 1913 	call print_farptr 
      008B53 82 5F            [ 1] 1914 	ld a,#8 
      008B55 90 AE            [ 1] 1915 	ld (PSIZE,sp),a 
      008B57 16               [ 1] 1916 	clrw x 
      008B58 C8 90 7F         [ 4] 1917 1$:	call fetchc  
      008B5B 0F               [ 2] 1918 	pushw x 
      008B5C 02 20 AF         [ 1] 1919 	ld acc8,a 
      008B5F 5F               [ 1] 1920 	clrw x 
      008B5F 0D 02 27         [ 2] 1921 	ldw acc24,x 
      008B62 AB 0A            [ 1] 1922 	ld a,#16+128
      008B64 02 90 5A         [ 4] 1923 	call prti24
      008B67 90               [ 2] 1924 	popw x 
      008B68 7F CD            [ 1] 1925 	dec (PSIZE,sp)
      008B6A 82 4F            [ 1] 1926 	jrne 1$ 
      008B6C 20 A0            [ 1] 1927 	ld a,#8 
      008B6E CB 00 12         [ 1] 1928 	add a,farptr+2 
      008B6E A6 4F 11         [ 1] 1929 	ld farptr+2,a
      008B71 02               [ 1] 1930 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008B72 27 9A 7B         [ 1] 1931 	adc a,farptr+1 
      008B75 01 90 F7         [ 1] 1932 	ld farptr+1,a 
      008B78 0C               [ 1] 1933 	clr a 
      008B79 02 90 5C         [ 1] 1934 	adc a,farptr 
      008B7C 90 7F CD         [ 1] 1935 	ld farptr,a 
      008B7F 82 33 20         [ 2] 1936 	jp repl  
                                   1937 
      008B82 8B 6F 74 20 61 20 63  1938 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1939 
                                   1940 ;----------------------------
                                   1941 ; display farptr address
                                   1942 ;----------------------------
      008B83                       1943 print_farptr:
      008B83 90 7F 7B         [ 1] 1944 	ld a ,farptr+2 
      008B86 02 C7 00         [ 1] 1945 	ld acc8,a 
      008B89 04 5B 02         [ 2] 1946 	ldw x,farptr 
      008B8C A6 0D CD         [ 2] 1947 	ldw acc24,x 
      008B8F 82               [ 1] 1948 	clrw x 
      008B90 33 81            [ 1] 1949 	ld a,#16 
      008B92 CD 09 52         [ 4] 1950 	call prti24
      008B92 52 01            [ 1] 1951 	ld a,#SPACE 
      008B94 72 5F 00         [ 4] 1952 	call putc 
      008B97 11 72 5F         [ 4] 1953 	call putc 
      008B9A 00               [ 4] 1954 	ret
                                   1955 
                                   1956 ;------------------------------------
                                   1957 ; get byte at address farptr[X]
                                   1958 ; input:
                                   1959 ;	 farptr   address to peek
                                   1960 ;    X		  farptr index 	
                                   1961 ; output:
                                   1962 ;	 A 		  byte from memory  
                                   1963 ;    x		  incremented by 1
                                   1964 ;------------------------------------
      000BFF                       1965 fetchc: ; @C
      008B9B 12 72 5F 00      [ 5] 1966 	ldf a,([farptr],x)
      008B9F 13               [ 1] 1967 	incw x
      008BA0 81               [ 4] 1968 	ret
                                   1969 
                                   1970 
                                   1971 ;------------------------------------
                                   1972 ; expect a number from command line 
                                   1973 ; next argument
                                   1974 ;  input:
                                   1975 ;	  none
                                   1976 ;  output:
                                   1977 ;    acc24   int24_t 
                                   1978 ;------------------------------------
      000C05                       1979 number::
      008BA0 A6 0D CD         [ 4] 1980 	call get_token
      008BA3 82 33 A6         [ 4] 1981 	call atoi24
      008BA6 3F               [ 4] 1982 	ret
                                   1983 .endif ; DEBUG 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   1984 
                                   1985 ;------------------------------------
                                   1986 ; parse quoted string 
                                   1987 ; input:
                                   1988 ;   Y 	pointer to tib 
                                   1989 ;   X   pointer to pad
                                   1990 ; output:
                                   1991 ;	pad   parsed string
                                   1992 ;   TOS  char* to pad  
                                   1993 ;------------------------------------
                           000001  1994 	PREV = 1
                           000002  1995 	CURR =2 
                           000002  1996 	VSIZE=2 
      000C0C                       1997 parse_quote: ; { -- addr }
      000C0C                       1998 	_vars VSIZE 
      008BA7 CD 82            [ 2]    1     sub sp,#VSIZE 
      008BA9 33               [ 1] 1999 	clr a
      008BAA 72 5F            [ 1] 2000 1$:	ld (PREV,sp),a 
      008BAC 00 01 72 5F      [ 1] 2001 2$:	inc in
      008BB0 00 02 CD         [ 4] 2002 	ld a,([in.w],y)
      008BB3 8B 08            [ 1] 2003 	jreq 6$
      008BB5 90 AE            [ 1] 2004 	ld (CURR,sp),a 
      008BB7 16 C8            [ 1] 2005 	ld a,#'\
      008BB9 90 F6            [ 1] 2006 	cp a, (PREV,sp)
      008BBB 27 E3            [ 1] 2007 	jrne 3$
      008BBD 72 5C            [ 1] 2008 	clr (PREV,sp)
      008BBF 00 02            [ 1] 2009 	ld a,(CURR,sp)
      008BC1 CD 8F            [ 4] 2010 	callr convert_escape
      008BC3 42               [ 1] 2011 	ld (x),a 
      008BC4 A1               [ 1] 2012 	incw x 
      008BC5 51 26            [ 2] 2013 	jra 2$
      000C2C                       2014 3$:
      008BC7 17 02            [ 1] 2015 	ld a,(CURR,sp)
      008BC8 A1 5C            [ 1] 2016 	cp a,#'\'
      008BC8 72 5F            [ 1] 2017 	jreq 1$
      008BCA 16 C8            [ 1] 2018 	cp a,#'"
      008BCC 72 5F            [ 1] 2019 	jreq 5$ 
      008BCE 00               [ 1] 2020 	ld (x),a 
      008BCF 04               [ 1] 2021 	incw x 
      008BD0 72 5F            [ 2] 2022 	jra 2$
      008BD2 00 02 5B 01      [ 1] 2023 5$:	inc in 
      008BD6 81               [ 1] 2024 6$: clr (x)
      008BD7 AE 17 18         [ 2] 2025 	ldw x,#pad 
      000C42                       2026 	_drop VSIZE
      008BD7 AE 8C            [ 2]    1     addw sp,#VSIZE 
      008BD9 55 CD            [ 1] 2027 	ld a,#TK_QSTR  
      008BDB 82               [ 4] 2028 	ret 
                                   2029 
                                   2030 ;---------------------------------------
                                   2031 ; called by parse_quote
                                   2032 ; subtitute escaped character 
                                   2033 ; by their ASCII value .
                                   2034 ; input:
                                   2035 ;   A  character following '\'
                                   2036 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2037 ;   A  substitued char or same if not valid.
                                   2038 ;---------------------------------------
      000C47                       2039 convert_escape:
      008BDC 45               [ 2] 2040 	pushw x 
      008BDD 20 C1 5C         [ 2] 2041 	ldw x,#escaped 
      008BDF F1               [ 1] 2042 1$:	cp a,(x)
      008BDF A1 50            [ 1] 2043 	jreq 2$
      008BE1 27               [ 1] 2044 	tnz (x)
      008BE2 11 A1            [ 1] 2045 	jreq 3$
      008BE4 53               [ 1] 2046 	incw x 
      008BE5 26 F0            [ 2] 2047 	jra 1$
      008BE7 1D 0C 5C         [ 2] 2048 2$: subw x,#escaped 
      008BE7 CD               [ 1] 2049 	ld a,xl 
      008BE8 8D 81            [ 1] 2050 	add a,#7
      008BEA A1               [ 2] 2051 3$:	popw x 
      008BEB 04               [ 4] 2052 	ret 
                                   2053 
      008BEC 26 E9 CD 82 45 CC 8B  2054 escaped: .asciz "abtnvfr"
             A0
                                   2055 
                                   2056 ;-------------------------
                                   2057 ; integer parser 
                                   2058 ; input:
                                   2059 ;   X 		point to pad 
                                   2060 ;   Y 		point to tib 
                                   2061 ;   A 	    first digit|'$' 
                                   2062 ; output:  
                                   2063 ;   pad     number string 
                                   2064 ;   X 		integer 
                                   2065 ;   A 		TK_INTGR
                                   2066 ;-------------------------
                           000001  2067 	BASE=1
                           000002  2068 	TCHAR=2 
                           000002  2069 	VSIZE=2 
      008BF4                       2070 parse_integer: ; { -- n }
      008BF4 A6 20            [ 1] 2071 	push #0 ; TCHAR 
      008BF6 CD 8F            [ 1] 2072 	cp a,#'$
      008BF8 FA 72            [ 1] 2073 	jreq 1$ 
      008BFA B9 00            [ 1] 2074 	push #10 ; BASE=10 
      008BFC 01 AE            [ 2] 2075 	jra 2$ 
      008BFE 17 18            [ 1] 2076 1$: push #16  ; BASE=16
      008C00 CD               [ 1] 2077 2$:	ld (x),a 
      008C01 83               [ 1] 2078 	incw x 
      008C02 25 CD 8F 4E      [ 1] 2079 	inc in 
      008C06 C6 00 08         [ 4] 2080 	ld a,([in.w],y)
      008C09 CA 00 09         [ 4] 2081 	call to_upper 
      008C0C CA 00            [ 1] 2082 	ld (TCHAR,sp),a 
      008C0E 0A 26 02         [ 4] 2083 	call is_digit 
      008C11 20 0C            [ 1] 2084 	jrc 2$
      008C13 CE 00            [ 1] 2085 	ld a,#16 
      008C15 08 CF            [ 1] 2086 	cp a,(BASE,sp)
      008C17 00 11            [ 1] 2087 	jrne 3$ 
      008C19 C6 00            [ 1] 2088 	ld a,(TCHAR,sp)
      008C1B 0A C7            [ 1] 2089 	cp a,#'A 
      008C1D 00 13            [ 1] 2090 	jrmi 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C1F A1 47            [ 1] 2091 	cp a,#'G 
      008C1F CD 8C            [ 1] 2092 	jrmi 2$ 
      008C21 64               [ 1] 2093 3$:	clr (x)
      008C22 A6 08 6B         [ 4] 2094 	call atoi24
      008C25 01 5F CD         [ 2] 2095 	ldw x,acc16 
      008C28 8C 7F            [ 1] 2096 	ld a,#TK_INTGR
      000C9C                       2097 	_drop VSIZE  
      008C2A 89 C7            [ 2]    1     addw sp,#VSIZE 
      008C2C 00               [ 4] 2098 	ret 	
                                   2099 
                                   2100 ;-------------------------
                                   2101 ; binary integer parser 
                                   2102 ; input:
                                   2103 ;   X 		point to pad 
                                   2104 ;   Y 		point to tib 
                                   2105 ;   A 	    '%' 
                                   2106 ; output:  
                                   2107 ;   pad     number string 
                                   2108 ;   X 		integer 
                                   2109 ;   A 		TK_INTGR
                                   2110 ;   TOS     integer 
                                   2111 ;-------------------------
                           000001  2112 	BINARY=1
                           000002  2113 	VSIZE=2
      000C9F                       2114 parse_binary: ; { -- n }
      008C2D 0A 5F            [ 1] 2115 	push #0
      008C2F CF 00            [ 1] 2116 	push #0
      008C31 08               [ 1] 2117 1$: ld (x),a 
      008C32 A6               [ 1] 2118 	incw x 
      008C33 90 CD 89 D2      [ 1] 2119 	inc in 
      008C37 85 0A 01         [ 4] 2120 	ld a,([in.w],y)
      008C3A 26 EB            [ 1] 2121 	cp a,#'0 
      008C3C A6 08            [ 1] 2122 	jreq 2$
      008C3E CB 00            [ 1] 2123 	cp a,#'1 
      008C40 13 C7            [ 1] 2124 	jreq 2$ 
      008C42 00 13            [ 2] 2125 	jra bin_exit 
      008C44 4F C9            [ 1] 2126 2$: sub a,#'0	
      008C46 00               [ 1] 2127 	rrc a 
      008C47 12 C7            [ 1] 2128 	rlc (BINARY+1,sp)
      008C49 00 12            [ 1] 2129 	rlc (BINARY,sp)
      008C4B 4F C9            [ 2] 2130 	jra 1$  
      000CBF                       2131 bin_exit:
      008C4D 00               [ 1] 2132 	clr (x)
      008C4E 11 C7            [ 2] 2133 	ldw x,(BINARY,sp)
      008C50 00 11            [ 1] 2134 	ld a,#TK_INTGR 	
      000CC4                       2135 	_drop VSIZE 
      008C52 CC 8B            [ 2]    1     addw sp,#VSIZE 
      008C54 A0               [ 4] 2136 	ret
                                   2137 
                                   2138 ;---------------------------
                                   2139 ;  token begin with a letter,
                                   2140 ;  is keyword or variable. 	
                                   2141 ; input:
                                   2142 ;   X 		point to pad 
                                   2143 ;   Y 		point to text
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2144 ;   A 	    first letter  
                                   2145 ; output:
                                   2146 ;   X		exec_addr|var_addr 
                                   2147 ;   A 		TK_CMD 
                                   2148 ;   pad 	keyword|var_name  
                                   2149 ;   TOS     exec_addr|var_addr 
                                   2150 ;--------------------------  
      000CC7                       2151 parse_keyword: ; { -- exec_addr|var_addr}
      008C55 6E 6F 74         [ 4] 2152 	call to_upper 
      008C58 20               [ 1] 2153 	ld (x),a 
      008C59 61               [ 1] 2154 	incw x 
      008C5A 20 63 6F 6D      [ 1] 2155 	inc in 
      008C5E 6D 61 6E         [ 4] 2156 	ld a,([in.w],y)
      008C61 64 0A 00         [ 4] 2157 	call is_alpha 
      008C64 25 EF            [ 1] 2158 	jrc parse_keyword 
      008C64 C6               [ 1] 2159 1$: clr (x)
      008C65 00 13 C7 00      [ 1] 2160 	tnz pad+1 
      008C69 0A CE            [ 1] 2161 	jrne 2$
                                   2162 ; one letter variable name 
      008C6B 00 11 CF         [ 1] 2163 	ld a,pad 
      008C6E 00 08            [ 1] 2164 	sub a,#'A 
      008C70 5F               [ 1] 2165 	sll a 
      008C71 A6               [ 1] 2166 	push a 
      008C72 10 CD            [ 1] 2167 	push #0
      008C74 89 D2 A6         [ 2] 2168 	ldw x,#vars 
      008C77 20 CD 82         [ 2] 2169 	addw x,(1,sp) ; X=var address 
      000CEE                       2170 	_drop 2 
      008C7A 33 CD            [ 2]    1     addw sp,#2 
      008C7C 82 33            [ 1] 2171 	ld a,#TK_VAR 
      008C7E 81 0C            [ 2] 2172 	jra 4$ 
      008C7F                       2173 2$: ; check for keyword, otherwise syntax error.
      000CF4                       2174 	_ldx_dict kword_dict
      008C7F 92 AF 00         [ 2]    1     ldw x,#kword_dict+2
      008C82 11 5C 81         [ 4] 2175 	call search_dict
      008C85 4D               [ 1] 2176 	tnz a
      008C85 CD 8D            [ 1] 2177 	jrne 4$ 
      008C87 81 CD 8F         [ 2] 2178 	jp syntax_error
      008C8A 4E               [ 4] 2179 4$:	ret  	
                                   2180 
                                   2181 
                                   2182 ;------------------------------------
                                   2183 ; Command line tokenizer
                                   2184 ; scan text for next token
                                   2185 ; move token in 'pad'
                                   2186 ; input: 
      000D01                       2187 	none: 
                                   2188 ; use:
                                   2189 ;	Y   pointer to text
                                   2190 ;   X	pointer to pad 
                                   2191 ;   in.w   index in text buffer
                                   2192 ; output:
                                   2193 ;   A       token attribute 
                                   2194 ;   pad 	token as .asciz
                                   2195 ;   X 		token value   
                                   2196 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2197 	; use to check special character 
                                   2198 	.macro _case c t  
                                   2199 	ld a,#c 
                                   2200 	cp a,(TCHAR,sp) 
                                   2201 	jrne t
                                   2202 	.endm 
                                   2203 
                           000001  2204 	TCHAR=1
                           000002  2205 	ATTRIB=2 
                           000002  2206 	VSIZE=2
      000D01                       2207 get_token: 
      008C8B 81 AE 16 C8      [ 2] 2208 	ldw y,#tib    	
      008C8C C6 00 01         [ 1] 2209 	ld a,in 
      008C8C 52 02 4F         [ 1] 2210 	cp a,count 
      008C8F 6B 01            [ 1] 2211 	jrmi 1$
      008C91 72 5C            [ 1] 2212 	ld a,#TK_NONE 
      008C93 00               [ 4] 2213 	ret 
      000D10                       2214 1$:	
      000D10                       2215 	_vars VSIZE
      008C94 02 91            [ 2]    1     sub sp,#VSIZE 
      008C96 D6 01 27         [ 2] 2216 	ldw x, #pad
      008C99 24 6B            [ 1] 2217 	ld a,#SPACE
      008C9B 02 A6 5C         [ 4] 2218 	call skip
      008C9E 11 01 26 0A 0F   [ 1] 2219 	mov in.saved,in 
      008CA3 01 7B 02         [ 4] 2220 	ld a,([in.w],y)
      008CA6 AD 1F            [ 1] 2221 	jrne str_tst
      008CA8 F7 5C 20 E5      [ 1] 2222 	clr pad 
      008CAC CC 0E B6         [ 2] 2223 	jp token_exit ; end of line 
                                   2224 
      000D2B                       2225 str_tst: ; check for quoted string  	
      008CAC 7B 02 A1         [ 4] 2226 	call to_upper 
      008CAF 5C 27            [ 1] 2227 	ld (TCHAR,sp),a 
      000D30                       2228 	_case '"' nbr_tst
      008CB1 DD A1            [ 1]    1 	ld a,#'"' 
      008CB3 22 27            [ 1]    2 	cp a,(TCHAR,sp) 
      008CB5 04 F7            [ 1]    3 	jrne nbr_tst
      008CB7 5C 20 D7         [ 4] 2229 	call parse_quote
      008CBA 72 5C 00         [ 2] 2230 	jp token_exit
      000D3C                       2231 nbr_tst: ; check for number 
      008CBD 02 7F            [ 1] 2232 	ld a,#'$'
      008CBF AE 17            [ 1] 2233 	cp a,(TCHAR,sp) 
      008CC1 18 5B            [ 1] 2234 	jreq 1$
      008CC3 02 A6            [ 1] 2235 	ld a,#'&
      008CC5 0A 81            [ 1] 2236 	cp a,(TCHAR,sp)
      008CC7 26 06            [ 1] 2237 	jrne 0$
      008CC7 89 AE 8C         [ 4] 2238 	call parse_binary ; expect binary integer 
      008CCA DC F1 27         [ 2] 2239 	jp token_exit 
      008CCD 06 7D            [ 1] 2240 0$:	ld a,(TCHAR,sp)
      008CCF 27 09 5C         [ 4] 2241 	call is_digit
      008CD2 20 F7            [ 1] 2242 	jrnc 3$
      008CD4 1D 8C DC         [ 4] 2243 1$:	call parse_integer 
      008CD7 9F AB 07         [ 2] 2244 	jp token_exit 
      000D5B                       2245 3$: 
      000D5B                       2246 	_case '(' bkslsh_tst 
      008CDA 85 81            [ 1]    1 	ld a,#'(' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008CDC 61 62            [ 1]    2 	cp a,(TCHAR,sp) 
      008CDE 74 6E            [ 1]    3 	jrne bkslsh_tst
      008CE0 76 66            [ 1] 2247 	ld a,#TK_LPAREN
      008CE2 72 00 A6         [ 2] 2248 	jp token_char   	
      008CE4                       2249 bkslsh_tst:
      000D66                       2250 	_case '\',rparnt_tst
      008CE4 4B 00            [ 1]    1 	ld a,#'\' 
      008CE6 A1 24            [ 1]    2 	cp a,(TCHAR,sp) 
      008CE8 27 04            [ 1]    3 	jrne rparnt_tst
      008CEA 4B 0A            [ 1] 2251 	ld a,(TCHAR,sp)
      008CEC 20               [ 1] 2252 	ld (x),a 
      008CED 02               [ 1] 2253 	incw x 
      008CEE 4B 10 F7 5C      [ 1] 2254 	inc in 
      008CF2 72 5C 00         [ 4] 2255 	ld a,([in.w],y)
      008CF5 02               [ 1] 2256 	ld (x),a 
      008CF6 91               [ 1] 2257 	incw x 
      008CF7 D6 01 CD 8F      [ 1] 2258 	inc in  
      008CFB 42               [ 1] 2259 	clr (x) 
      008CFC 6B               [ 1] 2260 	ld xl,a 
      008CFD 02 CD            [ 1] 2261 	ld a,#TK_CHAR 
      008CFF 8F 39 25         [ 2] 2262 	jp token_exit 
      000D84                       2263 rparnt_tst:		
      000D84                       2264 	_case ')' colon_tst 
      008D02 ED A6            [ 1]    1 	ld a,#')' 
      008D04 10 11            [ 1]    2 	cp a,(TCHAR,sp) 
      008D06 01 26            [ 1]    3 	jrne colon_tst
      008D08 0A 7B            [ 1] 2265 	ld a,#TK_RPAREN 
      008D0A 02 A1 41         [ 2] 2266 	jp token_char 
      000D8F                       2267 colon_tst:
      000D8F                       2268 	_case ':' comma_tst 
      008D0D 2B 04            [ 1]    1 	ld a,#':' 
      008D0F A1 47            [ 1]    2 	cp a,(TCHAR,sp) 
      008D11 2B DD            [ 1]    3 	jrne comma_tst
      008D13 7F CD            [ 1] 2269 	ld a,#TK_COLON 
      008D15 8F 4E CE         [ 2] 2270 	jp token_char 
      000D9A                       2271 comma_tst:
      000D9A                       2272 	_case COMMA sharp_tst 
      008D18 00 09            [ 1]    1 	ld a,#COMMA 
      008D1A A6 04            [ 1]    2 	cp a,(TCHAR,sp) 
      008D1C 5B 02            [ 1]    3 	jrne sharp_tst
      008D1E 81 0D            [ 1] 2273 	ld a,#TK_COMMA
      008D1F CC 0E A6         [ 2] 2274 	jp token_char
      000DA5                       2275 sharp_tst:
      000DA5                       2276 	_case SHARP dash_tst 
      008D1F 4B 00            [ 1]    1 	ld a,#SHARP 
      008D21 4B 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008D23 F7 5C            [ 1]    3 	jrne dash_tst
      008D25 72 5C            [ 1] 2277 	ld a,#TK_SHARP
      008D27 00 02 91         [ 2] 2278 	jp token_char  	 	 
      000DB0                       2279 dash_tst: 	
      000DB0                       2280 	_case '-' at_tst 
      008D2A D6 01            [ 1]    1 	ld a,#'-' 
      008D2C A1 30            [ 1]    2 	cp a,(TCHAR,sp) 
      008D2E 27 06            [ 1]    3 	jrne at_tst
      008D30 A1 31            [ 1] 2281 	ld a,#TK_MINUS  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008D32 27 02 20         [ 2] 2282 	jp token_char 
      000DBB                       2283 at_tst:
      000DBB                       2284 	_case '@' qmark_tst 
      008D35 09 A0            [ 1]    1 	ld a,#'@' 
      008D37 30 46            [ 1]    2 	cp a,(TCHAR,sp) 
      008D39 09 02            [ 1]    3 	jrne qmark_tst
      008D3B 09 01            [ 1] 2285 	ld a,#TK_ARRAY 
      008D3D 20 E4 A6         [ 2] 2286 	jp token_char
      008D3F                       2287 qmark_tst:
      000DC6                       2288 	_case '?' tick_tst 
      008D3F 7F 1E            [ 1]    1 	ld a,#'?' 
      008D41 01 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D43 04 5B            [ 1]    3 	jrne tick_tst
      008D45 02 81            [ 1] 2289 	ld a,(TCHAR,sp)
      008D47 F7               [ 1] 2290 	ld (x),a 
      008D47 CD               [ 1] 2291 	incw x 
      008D48 8F               [ 1] 2292 	clr (x)
      008D49 42 F7 5C 72      [ 1] 2293 	inc in 
      008D4D 5C 00            [ 1] 2294 	ld a,#TK_CMD 
      008D4F 02 91 D6         [ 2] 2295 	ldw x,#print 
      008D52 01 CD 85         [ 2] 2296 	jp token_exit
      000DDD                       2297 tick_tst: ; ignore comment 
      000DDD                       2298 	_case TICK plus_tst 
      008D55 8A 25            [ 1]    1 	ld a,#TICK 
      008D57 EF 7F            [ 1]    2 	cp a,(TCHAR,sp) 
      008D59 72 5D            [ 1]    3 	jrne plus_tst
      008D5B 17 19 26 15      [ 1] 2299 	inc in 
      008D5F C6 17            [ 1] 2300 	ld a,#TK_CMD 
      008D61 18 A0 41         [ 2] 2301 	ldw x,#rem 
      008D64 48 88 4B         [ 2] 2302 	jp token_exit 
      000DEF                       2303 plus_tst:
      000DEF                       2304 	_case '+' star_tst 
      008D67 00 AE            [ 1]    1 	ld a,#'+' 
      008D69 00 22            [ 1]    2 	cp a,(TCHAR,sp) 
      008D6B 72 FB            [ 1]    3 	jrne star_tst
      008D6D 01 5B            [ 1] 2305 	ld a,#TK_PLUS  
      008D6F 02 A6 05         [ 2] 2306 	jp token_char 
      000DFA                       2307 star_tst:
      000DFA                       2308 	_case '*' slash_tst 
      008D72 20 0C            [ 1]    1 	ld a,#'*' 
      008D74 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D74 AE A3            [ 1]    3 	jrne slash_tst
      008D76 8E CD            [ 1] 2309 	ld a,#TK_MULT 
      008D78 91 DE 4D         [ 2] 2310 	jp token_char 
      000E05                       2311 slash_tst: 
      000E05                       2312 	_case '/' prcnt_tst 
      008D7B 26 03            [ 1]    1 	ld a,#'/' 
      008D7D CC 87            [ 1]    2 	cp a,(TCHAR,sp) 
      008D7F A1 81            [ 1]    3 	jrne prcnt_tst
      008D81 A6 21            [ 1] 2313 	ld a,#TK_DIV 
      008D81 CC 0E A6         [ 2] 2314 	jp token_char 
      000E10                       2315 prcnt_tst:
      000E10                       2316 	_case '%' eql_tst 
      008D81 90 AE            [ 1]    1 	ld a,#'%' 
      008D83 16 C8            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008D85 C6 00            [ 1]    3 	jrne eql_tst
      008D87 02 C1            [ 1] 2317 	ld a,#TK_MOD
      008D89 00 04 2B         [ 2] 2318 	jp token_char  
                                   2319 ; 1 or 2 character tokens 	
      000E1B                       2320 eql_tst:
      000E1B                       2321 	_case '=' gt_tst 		
      008D8C 03 A6            [ 1]    1 	ld a,#'=' 
      008D8E 00 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008D90 26 05            [ 1]    3 	jrne gt_tst
      008D90 52 02            [ 1] 2322 	ld a,#TK_EQUAL
      008D92 AE 17 18         [ 2] 2323 	jp token_char 
      000E26                       2324 gt_tst:
      000E26                       2325 	_case '>' lt_tst 
      008D95 A6 20            [ 1]    1 	ld a,#'>' 
      008D97 CD 8F            [ 1]    2 	cp a,(TCHAR,sp) 
      008D99 FA 55            [ 1]    3 	jrne lt_tst
      008D9B 00 02            [ 1] 2326 	ld a,#TK_GT 
      008D9D 00 03            [ 1] 2327 	ld (ATTRIB,sp),a 
      008D9F 91 D6 01 26      [ 1] 2328 	inc in 
      008DA3 07 72 5F         [ 4] 2329 	ld a,([in.w],y)
      008DA6 17 18            [ 1] 2330 	cp a,#'=
      008DA8 CC 8F            [ 1] 2331 	jrne 1$
      008DAA 36 01            [ 1] 2332 	ld a,(TCHAR,sp)
      008DAB F7               [ 1] 2333 	ld (x),a
      008DAB CD               [ 1] 2334 	incw x 
      008DAC 8F 42            [ 1] 2335 	ld a,#'=
      008DAE 6B 01            [ 1] 2336 	ld (TCHAR,sp),a 
      008DB0 A6 22            [ 1] 2337 	ld a,#TK_GE 
      008DB2 11 01            [ 2] 2338 	jra token_char  
      008DB4 26 06            [ 1] 2339 1$: cp a,#'<
      008DB6 CD 8C            [ 1] 2340 	jrne 2$
      008DB8 8C CC            [ 1] 2341 	ld a,(TCHAR,sp)
      008DBA 8F               [ 1] 2342 	ld (x),a
      008DBB 36               [ 1] 2343 	incw x 
      008DBC A6 3C            [ 1] 2344 	ld a,#'<	
      008DBC A6 24            [ 1] 2345 	ld (TCHAR,sp),a 
      008DBE 11 01            [ 1] 2346 	ld a,#TK_NE 
      008DC0 27 13            [ 2] 2347 	jra token_char 
      008DC2 A6 26 11 01      [ 1] 2348 2$: dec in
      008DC6 26 06            [ 1] 2349 	ld a,(ATTRIB,sp)
      008DC8 CD 8D            [ 2] 2350 	jra token_char 
      000E5F                       2351 lt_tst:
      000E5F                       2352 	_case '<' other
      008DCA 1F CC            [ 1]    1 	ld a,#'<' 
      008DCC 8F 36            [ 1]    2 	cp a,(TCHAR,sp) 
      008DCE 7B 01            [ 1]    3 	jrne other
      008DD0 CD 8F            [ 1] 2353 	ld a,#TK_LT 
      008DD2 39 24            [ 1] 2354 	ld (ATTRIB,sp),a 
      008DD4 06 CD 8C E4      [ 1] 2355 	inc in 
      008DD8 CC 8F 36         [ 4] 2356 	ld a,([in.w],y)
      008DDB A1 3D            [ 1] 2357 	cp a,#'=
      008DDB A6 28            [ 1] 2358 	jrne 1$
      008DDD 11 01            [ 1] 2359 	ld a,(TCHAR,sp)
      008DDF 26               [ 1] 2360 	ld (x),a 
      008DE0 05 A6            [ 1] 2361 	ld a,#'=
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008DE2 0B CC            [ 1] 2362 	ld (TCHAR,sp),a 
      008DE4 8F 26            [ 1] 2363 	ld a,#TK_LE 
      008DE6 20 27            [ 2] 2364 	jra token_char 
      008DE6 A6 5C            [ 1] 2365 1$: cp a,#'>
      008DE8 11 01            [ 1] 2366 	jrne 2$
      008DEA 26 18            [ 1] 2367 	ld a,(TCHAR,sp)
      008DEC 7B               [ 1] 2368 	ld (x),a 
      008DED 01               [ 1] 2369 	incw x 
      008DEE F7 5C            [ 1] 2370 	ld a,#'>
      008DF0 72 5C            [ 1] 2371 	ld (TCHAR,sp),a 
      008DF2 00 02            [ 1] 2372 	ld a,#TK_NE 
      008DF4 91 D6            [ 2] 2373 	jra token_char 
      008DF6 01 F7 5C 72      [ 1] 2374 2$: dec in 
      008DFA 5C 00            [ 1] 2375 	ld a,(ATTRIB,sp)
      008DFC 02 7F            [ 2] 2376 	jra token_char 	
      000E97                       2377 other: ; not a special character 	 
      008DFE 97 A6            [ 1] 2378 	ld a,(TCHAR,sp)
      008E00 03 CC 8F         [ 4] 2379 	call is_alpha 
      008E03 36 03            [ 1] 2380 	jrc 30$ 
      008E04 CC 07 21         [ 2] 2381 	jp syntax_error 
      000EA1                       2382 30$: 
      008E04 A6 29 11         [ 4] 2383 	call parse_keyword
      008E07 01 26            [ 2] 2384 	jra token_exit 
      000EA6                       2385 token_char:
      008E09 05 A6            [ 1] 2386 	ld (ATTRIB,sp),a 
      008E0B 0C CC            [ 1] 2387 	ld a,(TCHAR,sp)
      008E0D 8F               [ 1] 2388 	ld (x),a 
      008E0E 26               [ 1] 2389 	incw x 
      008E0F 7F               [ 1] 2390 	clr(x)
      008E0F A6 3A 11 01      [ 1] 2391 	inc in 
      008E13 26 05            [ 1] 2392 	ld a,(ATTRIB,sp)
      008E15 A6 01 CC         [ 2] 2393 	ldw x,#pad 
      000EB6                       2394 token_exit:
      000EB6                       2395 	_drop VSIZE 
      008E18 8F 26            [ 2]    1     addw sp,#VSIZE 
      008E1A 81               [ 4] 2396 	ret
                                   2397 
                                   2398 
                                   2399 
                                   2400 ;------------------------------------
                                   2401 ; check if character in {'0'..'9'}
                                   2402 ; input:
                                   2403 ;    A  character to test
                                   2404 ; output:
                                   2405 ;    Carry  0 not digit | 1 digit
                                   2406 ;------------------------------------
      000EB9                       2407 is_digit:
      008E1A A6 2C            [ 1] 2408 	cp a,#'0
      008E1C 11 01            [ 1] 2409 	jrc 1$
      008E1E 26 05            [ 1] 2410     cp a,#'9+1
      008E20 A6               [ 1] 2411 	ccf 
      008E21 0D               [ 1] 2412 1$:	ccf 
      008E22 CC               [ 4] 2413     ret
                                   2414 
                                   2415 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2416 ; convert alpha to uppercase
                                   2417 ; input:
                                   2418 ;    a  character to convert
                                   2419 ; output:
                                   2420 ;    a  uppercase character
                                   2421 ;------------------------------------
      000EC2                       2422 to_upper::
      008E23 8F 26            [ 1] 2423 	cp a,#'a
      008E25 2A 01            [ 1] 2424 	jrpl 1$
      008E25 A6               [ 4] 2425 0$:	ret
      008E26 23 11            [ 1] 2426 1$: cp a,#'z	
      008E28 01 26            [ 1] 2427 	jrugt 0$
      008E2A 05 A6            [ 1] 2428 	sub a,#32
      008E2C 0E               [ 4] 2429 	ret
                                   2430 	
                                   2431 ;------------------------------------
                                   2432 ; convert pad content in integer
                                   2433 ; input:
                                   2434 ;    pad		.asciz to convert
                                   2435 ; output:
                                   2436 ;    acc24      int24_t
                                   2437 ;------------------------------------
                                   2438 	; local variables
                           000001  2439 	SIGN=1 ; 1 byte, 
                           000002  2440 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2441 	TEMP=3 ; 1 byte, temporary storage
                           000003  2442 	VSIZE=3 ; 3 bytes reserved for local storage
      000ECE                       2443 atoi24:
      008E2D CC               [ 2] 2444 	pushw x ;save x
      008E2E 8F 26            [ 2] 2445 	sub sp,#VSIZE
                                   2446 	; acc24=0 
      008E30 72 5F 00 07      [ 1] 2447 	clr acc24    
      008E30 A6 2D 11 01      [ 1] 2448 	clr acc16
      008E34 26 05 A6 11      [ 1] 2449 	clr acc8 
      008E38 CC 8F 26         [ 1] 2450 	ld a, pad 
      008E3B 27 5A            [ 1] 2451 	jreq atoi_exit
      008E3B A6 40            [ 1] 2452 	clr (SIGN,sp)
      008E3D 11 01            [ 1] 2453 	ld a,#10
      008E3F 26 05            [ 1] 2454 	ld (BASE,sp),a ; default base decimal
      008E41 A6 02 CC         [ 2] 2455 	ldw x,#pad ; pointer to string to convert
      008E44 8F               [ 1] 2456 	ld a,(x)
      008E45 26 47            [ 1] 2457 	jreq 9$  ; completed if 0
      008E46 A1 2D            [ 1] 2458 	cp a,#'-
      008E46 A6 3F            [ 1] 2459 	jrne 1$
      008E48 11 01            [ 1] 2460 	cpl (SIGN,sp)
      008E4A 26 11            [ 2] 2461 	jra 2$
      008E4C 7B 01            [ 1] 2462 1$: cp a,#'$
      008E4E F7 5C            [ 1] 2463 	jrne 3$
      008E50 7F 72            [ 1] 2464 	ld a,#16
      008E52 5C 00            [ 1] 2465 	ld (BASE,sp),a
      008E54 02               [ 1] 2466 2$:	incw x
      008E55 A6               [ 1] 2467 	ld a,(x)
      000F00                       2468 3$:	
      008E56 06 AE            [ 1] 2469 	cp a,#'a
      008E58 96 91            [ 1] 2470 	jrmi 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008E5A CC 8F            [ 1] 2471 	sub a,#32
      008E5C 36 30            [ 1] 2472 4$:	cp a,#'0
      008E5D 2B 2B            [ 1] 2473 	jrmi 9$
      008E5D A6 27            [ 1] 2474 	sub a,#'0
      008E5F 11 01            [ 1] 2475 	cp a,#10
      008E61 26 0C            [ 1] 2476 	jrmi 5$
      008E63 72 5C            [ 1] 2477 	sub a,#7
      008E65 00 02            [ 1] 2478 	cp a,(BASE,sp)
      008E67 A6 06            [ 1] 2479 	jrpl 9$
      008E69 AE 97            [ 1] 2480 5$:	ld (TEMP,sp),a
      008E6B 96 CC            [ 1] 2481 	ld a,(BASE,sp)
      008E6D 8F 36 40         [ 4] 2482 	call mulu24_8
      008E6F 7B 03            [ 1] 2483 	ld a,(TEMP,sp)
      008E6F A6 2B 11         [ 1] 2484 	add a,acc24+2
      008E72 01 26 05         [ 1] 2485 	ld acc24+2,a
      008E75 A6               [ 1] 2486 	clr a
      008E76 10 CC 8F         [ 1] 2487 	adc a,acc24+1
      008E79 26 00 08         [ 1] 2488 	ld acc24+1,a
      008E7A 4F               [ 1] 2489 	clr a
      008E7A A6 2A 11         [ 1] 2490 	adc a,acc24
      008E7D 01 26 05         [ 1] 2491 	ld acc24,a
      008E80 A6 20            [ 2] 2492 	jra 2$
      008E82 CC 8F            [ 1] 2493 9$:	tnz (SIGN,sp)
      008E84 26 03            [ 1] 2494     jreq atoi_exit
      008E85 CD 0A 65         [ 4] 2495     call neg_acc24
      000F3C                       2496 atoi_exit: 
      008E85 A6 2F            [ 2] 2497 	addw sp,#VSIZE
      008E87 11               [ 2] 2498 	popw x ; restore x
      008E88 01               [ 4] 2499 	ret
                                   2500 
                                   2501 ;--------------------------------------
                                   2502 ; unsigned multiply uint24_t by uint8_t
                                   2503 ; use to convert numerical string to uint24_t
                                   2504 ; input:
                                   2505 ;	acc24	uint24_t 
                                   2506 ;   A		uint8_t
                                   2507 ; output:
                                   2508 ;   acc24   A*acc24
                                   2509 ;-------------------------------------
                                   2510 ; local variables offset  on sp
                           000003  2511 	U8   = 3   ; A pushed on stack
                           000002  2512 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2513 	OVFH = 1  ; multiplication overflow high byte
                           000003  2514 	VSIZE = 3
      000F40                       2515 mulu24_8:
      008E89 26               [ 2] 2516 	pushw x    ; save X
                                   2517 	; local variables
      008E8A 05               [ 1] 2518 	push a     ; U8
      008E8B A6               [ 1] 2519 	clrw x     ; initialize overflow to 0
      008E8C 21               [ 2] 2520 	pushw x    ; multiplication overflow
                                   2521 ; multiply low byte.
      008E8D CC 8F 26         [ 1] 2522 	ld a,acc24+2
      008E90 97               [ 1] 2523 	ld xl,a
      008E90 A6 25            [ 1] 2524 	ld a,(U8,sp)
      008E92 11               [ 4] 2525 	mul x,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008E93 01               [ 1] 2526 	ld a,xl
      008E94 26 05 A6         [ 1] 2527 	ld acc24+2,a
      008E97 22               [ 1] 2528 	ld a, xh
      008E98 CC 8F            [ 1] 2529 	ld (OVFL,sp),a
                                   2530 ; multipy middle byte
      008E9A 26 00 08         [ 1] 2531 	ld a,acc24+1
      008E9B 97               [ 1] 2532 	ld xl,a
      008E9B A6 3D            [ 1] 2533 	ld a, (U8,sp)
      008E9D 11               [ 4] 2534 	mul x,a
                                   2535 ; add overflow to this partial product
      008E9E 01 26 05         [ 2] 2536 	addw x,(OVFH,sp)
      008EA1 A6               [ 1] 2537 	ld a,xl
      008EA2 32 CC 8F         [ 1] 2538 	ld acc24+1,a
      008EA5 26               [ 1] 2539 	clr a
      008EA6 A9 00            [ 1] 2540 	adc a,#0
      008EA6 A6 3E            [ 1] 2541 	ld (OVFH,sp),a
      008EA8 11               [ 1] 2542 	ld a,xh
      008EA9 01 26            [ 1] 2543 	ld (OVFL,sp),a
                                   2544 ; multiply most signficant byte	
      008EAB 33 A6 31         [ 1] 2545 	ld a, acc24
      008EAE 6B               [ 1] 2546 	ld xl, a
      008EAF 02 72            [ 1] 2547 	ld a, (U8,sp)
      008EB1 5C               [ 4] 2548 	mul x,a
      008EB2 00 02 91         [ 2] 2549 	addw x, (OVFH,sp)
      008EB5 D6               [ 1] 2550 	ld a, xl
      008EB6 01 A1 3D         [ 1] 2551 	ld acc24,a
      008EB9 26 0C            [ 2] 2552     addw sp,#VSIZE
      008EBB 7B               [ 2] 2553 	popw x
      008EBC 01               [ 4] 2554 	ret
                                   2555 
                                   2556 ;------------------------------------
                                   2557 ; skip character c in text starting from 'in'
                                   2558 ; input:
                                   2559 ;	 y 		point to text buffer
                                   2560 ;    a 		character to skip
                                   2561 ; output:  
                                   2562 ;	'in' ajusted to new position
                                   2563 ;------------------------------------
                           000001  2564 	C = 1 ; local var
      000F7A                       2565 skip:
      008EBD F7               [ 1] 2566 	push a
      008EBE 5C A6 3D         [ 4] 2567 1$:	ld a,([in.w],y)
      008EC1 6B 01            [ 1] 2568 	jreq 2$
      008EC3 A6 33            [ 1] 2569 	cp a,(C,sp)
      008EC5 20 5F            [ 1] 2570 	jrne 2$
      008EC7 A1 3C 26 0C      [ 1] 2571 	inc in
      008ECB 7B 01            [ 2] 2572 	jra 1$
      000F8A                       2573 2$: _drop 1 
      008ECD F7 5C            [ 2]    1     addw sp,#1 
      008ECF A6               [ 4] 2574 	ret
                                   2575 	
                                   2576 ;------------------------------
                                   2577 ; restore 'in.w' variable to 
                                   2578 ; its value before last call
                                   2579 ; to get_token.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2580 ;------------------------------
      000F8D                       2581 unget_token:
      008ED0 3C 6B 01 A6 35   [ 1] 2582 	mov in,in.saved
      008ED5 20               [ 4] 2583 	ret 
                                   2584 
                                   2585 
                                   2586 ;******************************
                                   2587 ;  data stack manipulation
                                   2588 ;*****************************
                                   2589 ;----------------------	
                                   2590 ; push X on data stack 
                                   2591 ; input:
                                   2592 ;	X 
                                   2593 ; output:
                                   2594 ;	none 
                                   2595 ;----------------------	
      000F93                       2596 dpush:
      000F93                       2597     _dp_down
      008ED6 4F 72 5A 00      [ 1]    1     dec dstkptr+1 
      008EDA 02 7B 02 20      [ 1]    2     dec dstkptr+1
      008EDE 47 CF 00 16      [ 5] 2598     ldw [dstkptr],x  
      008EDF 81               [ 4] 2599 	ret 
                                   2600 
                                   2601 
                                   2602 ;----------------------	
                                   2603 ; pop data stack in X 
                                   2604 ; input:
                                   2605 ;	none
                                   2606 ; output:
                                   2607 ;	X   
                                   2608 ;----------------------	
      000FA0                       2609 dpop: 
      008EDF A6 3C 11 01      [ 5] 2610     ldw x, [dstkptr]
      000FA4                       2611 	_dp_up
      008EE3 26 32 A6 34      [ 1]    1     inc dstkptr+1
      008EE7 6B 02 72 5C      [ 1]    2     inc dstkptr+1
      008EEB 00               [ 4] 2612 	ret 
                                   2613 
                                   2614 ;-----------------------------
                                   2615 ; swap top 2 elements of dstack
                                   2616 ;  {n1 n2 -- n2 n1 }
                                   2617 ;-----------------------------
      000FAD                       2618 dswap:
      008EEC 02 91 D6 01      [ 5] 2619 	ldw x,[dstkptr]
      008EF0 A1               [ 2] 2620 	pushw x 
      008EF1 3D 26 0B         [ 2] 2621 	ldw x,#2 
      008EF4 7B 01 F7 A6      [ 5] 2622 	ldw x,([dstkptr],x) 
      008EF8 3D 6B 01 A6      [ 5] 2623 	ldw [dstkptr],x 
      008EFC 36 20 27         [ 2] 2624 	ldw x,#2
      008EFF A1 3E            [ 2] 2625 	popw y 
      008F01 26 0C 7B 01      [ 5] 2626 	ldw ([dstkptr],x),y 
      008F05 F7               [ 4] 2627 	ret
                                   2628 
                                   2629 ;-----------------------------
                                   2630 ; drop TOS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2631 ;-----------------------------
      000FC7                       2632 ddrop: ; { n -- }
      000FC7                       2633 	_dp_up 
      008F06 5C A6 3E 6B      [ 1]    1     inc dstkptr+1
      008F0A 01 A6 35 20      [ 1]    2     inc dstkptr+1
      008F0E 17               [ 4] 2634 	ret
                                   2635 	
                                   2636 ;-----------------------------
                                   2637 ; duplicate TOS 
                                   2638 ;  dstack: { ix...n -- ix...n n }
                                   2639 ;-----------------------------
      000FD0                       2640 ddup:
      008F0F 72 5A 00 02      [ 5] 2641 	ldw x,[dstkptr]
      000FD4                       2642 	_dp_down
      008F13 7B 02 20 0F      [ 1]    1     dec dstkptr+1 
      008F17 72 5A 00 17      [ 1]    2     dec dstkptr+1
      008F17 7B 01 CD 85      [ 5] 2643     ldw [dstkptr],x  
      008F1B 8A               [ 4] 2644 	ret 
                                   2645 
                                   2646 
                                   2647 ;----------------------------------
                                   2648 ; pick value n from dstack 
                                   2649 ; put it on TOS
                                   2650 ; dstack: {ix,..,p -- ix,...,np }
                                   2651 ;-----------------------------------
      000FE1                       2652 dpick:
      008F1C 25 03 CC 87      [ 5] 2653 	ldw x,[dstkptr]
      008F20 A1               [ 2] 2654 	sllw x 
      008F21 72 BB 00 16      [ 2] 2655 	addw x,dstkptr 
      008F21 CD               [ 2] 2656 	ldw x,(x)
      008F22 8D 47 20 10      [ 5] 2657 	ldw [dstkptr],x 
      008F26 81               [ 4] 2658 	ret
                                   2659 
                                   2660 ;---------------------------
                                   2661 ;  fetch variable in X 
                                   2662 ;  dstack:{ addr -- value }
                                   2663 ;---------------------------
      000FF0                       2664 fetch:
      008F26 6B 02 7B 01      [ 5] 2665 	ldw x,[dstkptr]
      008F2A F7               [ 2] 2666 	ldw x,(x)
      008F2B 5C 7F 72 5C      [ 5] 2667 	ldw [dstkptr],x
      008F2F 00               [ 4] 2668 	ret 
                                   2669 
                                   2670 ;----------------------------
                                   2671 ; store variable 
                                   2672 ; dstack: {addr value -- }
                                   2673 ;----------------------------
      000FFA                       2674 store:
      008F30 02 7B 02         [ 4] 2675 	call dpop 
      008F33 AE 17            [ 1] 2676 	ldw y,x   ; y=value 
      008F35 18 0F A0         [ 4] 2677 	call dpop 
      008F36 FF               [ 2] 2678 	ldw (x),y 
      008F36 5B               [ 4] 2679 	ret 
                                   2680 
                                   2681 ;---------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2682 ; drop n elements from data stack 
                                   2683 ; input: 
                                   2684 ;   X 		n 
                                   2685 ; output:
                                   2686 ;   none 
                                   2687 ;-------------------------------------
      001004                       2688 ddrop_n:
      008F37 02 81            [ 2] 2689 	pushw y 
      008F39 90 CE 00 16      [ 2] 2690 	ldw y,dstkptr 
      008F39 A1               [ 2] 2691 	sllw x 
      008F3A 30               [ 2] 2692 	pushw x 
      008F3B 25 03 A1         [ 2] 2693 	addw y,(1,sp)
      008F3E 3A 8C 8C 81      [ 2] 2694 	ldw dstkptr,y 
      008F42 85               [ 2] 2695 	popw x 
      008F42 A1 61            [ 2] 2696 	popw y
      008F44 2A               [ 4] 2697 	ret 
                                   2698 
      008F45 01 81 A1 7A 22 FB A0  2699 dstk_prompt: .asciz "\ndstack: " 
             20 81 00
                                   2700 ;----------------------------
                                   2701 ; print dstack content 
                                   2702 ;---------------------------
                           000001  2703 	XSAVE=1
                           000002  2704 	VSIZE=2
      008F4E                       2705 dots:
      001021                       2706 	_vars VSIZE 
      008F4E 89 52            [ 2]    1     sub sp,#VSIZE 
      008F50 03 72 5F         [ 2] 2707 	ldw x,#dstk_prompt 
      008F53 00 08 72         [ 4] 2708 	call puts
      008F56 5F 00 09         [ 2] 2709 	ldw x,#dstack_unf-CELL_SIZE
      008F59 72 5F 00 0A      [ 1] 2710 	mov base,#10 
      008F5D C6 17 18         [ 2] 2711 1$:	cpw x,dstkptr 
      008F60 27 5A            [ 1] 2712 	jrult 4$ 
      008F62 0F 01            [ 2] 2713 	ldw (XSAVE,sp),x
      008F64 A6               [ 2] 2714 	ldw  x,(x)
      008F65 0A 6B 02         [ 4] 2715 	call print_int 
      008F68 AE 17            [ 2] 2716 	ldw x,(XSAVE,sp)
      008F6A 18 F6 27         [ 2] 2717 	subw x,#CELL_SIZE 
      008F6D 47 A1            [ 2] 2718 	jra 1$ 
      008F6F 2D 26            [ 1] 2719 4$: ld a,#CR 
      008F71 04 03 01         [ 4] 2720 	call putc 
      001047                       2721 	_drop VSIZE
      008F74 20 08            [ 2]    1     addw sp,#VSIZE 
      008F76 A1               [ 1] 2722 	clr a 
      008F77 24               [ 4] 2723 	ret
                                   2724 
      008F78 26 06 A6 10 6B 02 5C  2725 cstk_prompt: .asciz "\nctack: "
             F6 00
                                   2726 ;--------------------------------
                                   2727 ; print cstack content
                                   2728 ;--------------------------------
                           000001  2729 	XSAVE=1
                           000002  2730 	VSIZE=2 
      008F80                       2731 dotr:
      001054                       2732 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008F80 A1 61            [ 2]    1     sub sp,#VSIZE 
      008F82 2B 02 A0         [ 2] 2733 	ldw x,#cstk_prompt
      008F85 20 A1 30         [ 4] 2734 	call puts 
      008F88 2B               [ 1] 2735 	ldw x,sp 
      008F89 2B A0 30         [ 2] 2736 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008F8C A1 0A            [ 2] 2737 	ldw (XSAVE,sp),x  
      008F8E 2B 06 A0         [ 2] 2738 	ldw x,#RAM_SIZE-2
      008F91 07 11 02 2A      [ 1] 2739 	mov base,#16
      001069                       2740 dotr_loop:
      008F95 1F 6B            [ 2] 2741 	cpw x,(XSAVE,sp)
      008F97 03 7B            [ 1] 2742 	jrmi 9$
      008F99 02               [ 2] 2743 	pushw x  
      008F9A CD               [ 2] 2744 	ldw x,(x)
      008F9B 8F C0 7B         [ 4] 2745 	call print_int 
      008F9E 03               [ 2] 2746 	popw x  
      008F9F CB 00 0A         [ 2] 2747 	subw x,#CELL_SIZE
      008FA2 C7 00            [ 2] 2748 	jra dotr_loop 
      008FA4 0A 4F            [ 1] 2749 9$:	ld a,#CR 
      008FA6 C9 00 09         [ 4] 2750 	call putc 
      00107D                       2751 	_drop VSIZE 
      008FA9 C7 00            [ 2]    1     addw sp,#VSIZE 
      008FAB 09               [ 1] 2752 	clr a 
      008FAC 4F               [ 4] 2753 	ret
                                   2754 
                                   2755 
                                   2756 ;--------------------------------
                                   2757 ;  add 2 integers
                                   2758 ;  input:
                                   2759 ;    N1     on cstack 
                                   2760 ;    N2     on cstack 
                                   2761 ;  output:
                                   2762 ;    X 		n2+n1 
                                   2763 ;--------------------------------
                                   2764 	;arugments on cstack 
      001081                       2765 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001081                       2766 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001081                       2767 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001081                       2768 add:
      008FAD C9 00            [ 2] 2769 	ldw x ,(N2,sp)
      008FAF 08 C7 00         [ 2] 2770 	addw x,(N1,sp)
      008FB2 08 20            [ 2] 2771 	ldw (N1,sp),x 
      008FB4 C9               [ 4] 2772 	ret 
                                   2773 
                                   2774 ;--------------------------------
                                   2775 ;  substract 2 ntegers
                                   2776 ;  input:
                                   2777 ;    N1     on cstack 
                                   2778 ;    N2     on cstack 
                                   2779 ;  output:
                                   2780 ;    X 		n2+n1 
                                   2781 ;--------------------------------
      001089                       2782 	_argofs 0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                           000002     1     ARG_OFS=2+0 
      001089                       2783 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001089                       2784 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001089                       2785 substract:
      008FB5 0D 01            [ 2] 2786 	ldw x,(N2,sp)
      008FB7 27 03 CD         [ 2] 2787 	subw x,(N1,sp)
      008FBA 8A               [ 4] 2788 	ret 
                                   2789 
                                   2790 ;-------------------------------------
                                   2791 ; multiply 2 integers
                                   2792 ; product overflow is ignored unless
                                   2793 ; MATH_OVF assembler flag is set to 1
                                   2794 ; input:
                                   2795 ;  	N1      on cstack
                                   2796 ;   N2 		on cstack 
                                   2797 ; output:
                                   2798 ;	X        N1*N2 
                                   2799 ;-------------------------------------
                                   2800 	;arguments 
      00108F                       2801 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      00108F                       2802 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      00108F                       2803 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      00108F                       2804 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      00108F                       2805 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2806    ; local variables 
                           000001  2807 	SIGN=1
                           000002  2808 	PROD=2
                           000003  2809 	VSIZE=3
      00108F                       2810 multiply:
      00108F                       2811 	_vars VSIZE 
      008FBB E5 03            [ 2]    1     sub sp,#VSIZE 
      008FBC 0F 01            [ 1] 2812 	clr (SIGN,sp)
      008FBC 5B 03            [ 2] 2813 	ldw x,(N1_HB,sp)
      008FBE 85               [ 1] 2814 	ld a,xh  
      008FBF 81 80            [ 1] 2815 	bcp a,#0x80 
      008FC0 27 05            [ 1] 2816 	jreq 2$
      008FC0 89 88            [ 1] 2817 	cpl (SIGN,sp)
      008FC2 5F               [ 2] 2818 	negw x 
      008FC3 89 C6            [ 2] 2819 	ldw (N1_HB,sp),x 
      008FC5 00 0A            [ 2] 2820 2$: ldw x,(N2_HB,sp)
      008FC7 97               [ 1] 2821 	ld a,xh  
      008FC8 7B 03            [ 1] 2822 	bcp a,#0x80 
      008FCA 42 9F            [ 1] 2823 	jreq 3$
      008FCC C7 00            [ 1] 2824 	cpl (SIGN,sp)
      008FCE 0A               [ 2] 2825 	negw x 
      008FCF 9E 6B            [ 2] 2826 	ldw (N2_HB,sp),x 
                                   2827 ; N1_LB * N2_LB 	
      008FD1 02 C6            [ 1] 2828 3$:	ld a,(N1_LB,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008FD3 00               [ 1] 2829 	ld xl,a 
      008FD4 09 97            [ 1] 2830 	ld a,(N2_LB,sp) 
      008FD6 7B               [ 4] 2831 	mul x,a 
                           000000  2832 .if MATH_OVF 	
                                   2833 	ld a,xh 
                                   2834 	bcp a,#0x80 
                                   2835 	jreq 4$ 
                                   2836 	ld a,#ERR_MATH_OVF 
                                   2837 	jp tb_error
                                   2838 .endif 	 
      008FD7 03 42            [ 2] 2839 4$:	ldw (PROD,sp),x
                                   2840 ; N1_LB * N2_HB	 
      008FD9 72 FB            [ 1] 2841 	ld a,(N1_LB,sp) 
      008FDB 01               [ 1] 2842 	ld xl,a 
      008FDC 9F C7            [ 1] 2843 	ld a,(N2_HB,sp)
      008FDE 00               [ 4] 2844 	mul x,a
      008FDF 09               [ 1] 2845 	ld a,xl 
      008FE0 4F A9            [ 1] 2846 	add a,(PROD,sp)
                           000000  2847 .if MATH_OVF 	
                                   2848 	bcp a,#0x80 
                                   2849 	jreq 5$ 
                                   2850 	ld a,#ERR_MATH_OVF 
                                   2851 	jp tb_error
                                   2852 .endif 	 
      008FE2 00 6B            [ 1] 2853 5$:	ld (PROD,sp),a 
                                   2854 ; N1_HB * N2_LB 
      008FE4 01 9E            [ 1] 2855 	ld a,(N1_HB,sp)
      008FE6 6B               [ 1] 2856 	ld xl,a 
      008FE7 02 C6            [ 1] 2857 	ld a,(N2_LB,sp)
      008FE9 00               [ 4] 2858 	mul x,a 
      008FEA 08               [ 1] 2859 	ld a,xl 
      008FEB 97 7B            [ 1] 2860 	add a,(PROD,sp)
                           000000  2861 .if MATH_OVF 	
                                   2862 	bcp a,#0x80 
                                   2863 	jreq 6$ 
                                   2864 	ld a,#ERR_MATH_OVF 
                                   2865 	jp tb_error
                                   2866 .endif 	 
      008FED 03 42            [ 1] 2867 6$:	ld (PROD,sp),a 
                                   2868 ; N1_HB * N2_HB 	
                                   2869 ; it is pointless to multiply N1_HB*N2_HB 
                                   2870 ; as this product is over 65535 or 0 
                                   2871 ;
                                   2872 ; sign adjust product
      008FEF 72 FB            [ 1] 2873 	tnz (SIGN,sp)
      008FF1 01 9F            [ 1] 2874 	jreq 7$
      008FF3 C7 00            [ 2] 2875 	ldw x, (PROD,sp)
      008FF5 08               [ 2] 2876 	negw x
      008FF6 5B 03            [ 2] 2877 	ldw (PROD,sp),x  
      0010D2                       2878 7$: 
      008FF8 85 81            [ 2] 2879 	ldw x,(PROD,sp) 
      008FFA                       2880 	_drop VSIZE 
      008FFA 88 91            [ 2]    1     addw sp,#VSIZE 
      008FFC D6               [ 4] 2881 	ret
                                   2882 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2883 ;----------------------------------
                                   2884 ;  euclidian divide n2/n1 
                                   2885 ; input:
                                   2886 ;    N2 	on cstack
                                   2887 ;    N1 	on cstack
                                   2888 ; output:
                                   2889 ;    X      n2/n1 
                                   2890 ;    Y      remainder 
                                   2891 ;----------------------------------
      0010D7                       2892 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      0010D7                       2893 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      0010D7                       2894 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2895 	; local variables
                           000001  2896 	SQUOT=1 ; sign quotient
                           000002  2897 	SDIVD=2 ; sign dividend  
                           000002  2898 	VSIZE=2
      0010D7                       2899 divide:
      0010D7                       2900 	_vars VSIZE 
      008FFD 01 27            [ 2]    1     sub sp,#VSIZE 
      008FFF 0A 11            [ 1] 2901 	clr (SQUOT,sp)
      009001 01 26            [ 1] 2902 	clr (SDIVD,sp)
                                   2903 ; check for 0 divisor
      009003 06 72            [ 2] 2904 	ldw x,(DIVISR,sp)
      009005 5C               [ 2] 2905 	tnzw x 
      009006 00 02            [ 1] 2906     jrne 0$
      009008 20 F1            [ 1] 2907 	ld a,#ERR_DIV0 
      00900A 5B 01 81         [ 2] 2908 	jp tb_error 
                                   2909 ; check divisor sign 	
      00900D 9E               [ 1] 2910 0$:	ld a,xh 
      00900D 55 00            [ 1] 2911 	bcp a,#0x80 
      00900F 03 00            [ 1] 2912 	jreq 1$
      009011 02 81            [ 1] 2913 	cpl (SQUOT,sp)
      009013 50               [ 2] 2914 	negw x 
      009013 72 5A            [ 2] 2915 1$:	ldw (DIVISR,sp),x
                                   2916 ; check dividend sign 	 
      009015 00 18            [ 2] 2917     ldw x,(DIVIDND,sp)
      009017 72               [ 1] 2918 	ld a,xh 
      009018 5A 00            [ 1] 2919 	bcp a,#0x80 
      00901A 18 72            [ 1] 2920 	jreq 2$ 
      00901C CF 00            [ 1] 2921 	cpl (SQUOT,sp)
      00901E 17 81            [ 1] 2922 	cpl (SDIVD,sp)
      009020 50               [ 2] 2923 	negw x 
      009020 72 CE            [ 2] 2924 2$:	ldw y,(DIVISR,sp)
      009022 00               [ 2] 2925 	divw x,y
      009023 17 72 5C 00      [ 2] 2926 	ldw acc16,y 
                                   2927 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      009027 18 72            [ 1] 2928 	tnz (SDIVD,sp)
      009029 5C 00            [ 1] 2929 	jreq 7$
      00902B 18 81            [ 2] 2930 	tnzw y 
      00902D 27 07            [ 1] 2931 	jreq 7$
      00902D 72               [ 1] 2932 	incw x
      00902E CE 00            [ 2] 2933 	ldw y,(DIVISR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009030 17 89 AE 00      [ 2] 2934 	subw y,acc16
      009034 02 72            [ 1] 2935 7$: tnz (SQUOT,sp)
      009036 DE 00            [ 1] 2936 	jreq 9$ 	 
      009038 17               [ 2] 2937 8$:	negw x 
      001118                       2938 9$: 
      001118                       2939 	_drop VSIZE 
      009039 72 CF            [ 2]    1     addw sp,#VSIZE 
      00903B 00               [ 4] 2940 	ret 
                                   2941 
                                   2942 
                                   2943 ;----------------------------------
                                   2944 ;  remainder resulting from euclidian 
                                   2945 ;  division of n2/n1 
                                   2946 ; input:
                                   2947 ;   N1 		cstack 
                                   2948 ;   N2      cstack
                                   2949 ; output:
                                   2950 ;   X       N2%N1 
                                   2951 ;----------------------------------
                           000003  2952 	N1=3
                           000005  2953 	N2=5
                           000004  2954 	VSIZE=4
      00111B                       2955 modulo:
      00903C 17 AE            [ 2] 2956 	Ldw x,(N1,sp)
      00903E 00 02            [ 2] 2957 	ldw y,(N2,sp)
      00111F                       2958 	_vars VSIZE 
      009040 90 85            [ 2]    1     sub sp,#VSIZE 
      009042 72 DF            [ 2] 2959 	ldw (1,sp),x 
      009044 00 17            [ 2] 2960 	ldw (3,sp),y 
      009046 81 10 D7         [ 4] 2961 	call divide 
      009047 93               [ 1] 2962 	ldw x,y
      001129                       2963 	_drop VSIZE 
      009047 72 5C            [ 2]    1     addw sp,#VSIZE 
      009049 00               [ 4] 2964 	ret 
                                   2965 
                                   2966 
                                   2967 ;----------------------------------
                                   2968 ; search in kword_dict command name
                                   2969 ;  from its execution address 
                                   2970 ; input:
                                   2971 ;   X       	execution address 
                                   2972 ; output:
                                   2973 ;   X 			cstr*  | 0 
                                   2974 ;--------------------------------
                           000001  2975 	XADR=1 
                           000003  2976 	LINK=3 
                           000004  2977 	VSIZE=4
      00112C                       2978 cmd_name:
      00112C                       2979 	_vars VSIZE 
      00904A 18 72            [ 2]    1     sub sp,#VSIZE 
      00904C 5C 00 18 81      [ 1] 2980 	clr acc16 
      009050 1F 01            [ 2] 2981 	ldw (XADR,sp),x  
      009050 72 CE 00         [ 2] 2982 	ldw x,#kword_dict	
      009053 17 72            [ 2] 2983 1$:	ldw (LINK,sp),x
      009055 5A 00            [ 1] 2984 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      009057 18 72            [ 1] 2985 	and a,#15 
      009059 5A 00 18         [ 1] 2986 	ld acc8,a 
      00905C 72 CF 00         [ 2] 2987 	addw x,#3
      00905F 17 81 00 08      [ 2] 2988 	addw x,acc16
      009061 FE               [ 2] 2989 	ldw x,(x) ; execution address 
      009061 72 CE            [ 2] 2990 	cpw x,(XADR,sp)
      009063 00 17            [ 1] 2991 	jreq 2$
      009065 58 72            [ 2] 2992 	ldw x,(LINK,sp)
      009067 BB               [ 2] 2993 	ldw x,(x) 
      009068 00 17 FE         [ 2] 2994 	subw x,#2  
      00906B 72 CF            [ 1] 2995 	jrne 1$
      00906D 00 17            [ 2] 2996 	jra 9$
      00906F 81 03            [ 2] 2997 2$: ldw x,(LINK,sp)
      009070 1C 00 02         [ 2] 2998 	addw x,#2 	
      00115B                       2999 9$:	_drop VSIZE
      009070 72 CE            [ 2]    1     addw sp,#VSIZE 
      009072 00               [ 4] 3000 	ret
                                   3001 
                                   3002 
                                   3003 ;---------------------------------
                                   3004 ; input:
                                   3005 ;	X 		dictionary entry point 
                                   3006 ;  pad		.asciz name to search 
                                   3007 ; output:
                                   3008 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3009 ;  X		execution address | 0 
                                   3010 ;---------------------------------
                           000001  3011 	NLEN=1 ; cmd length 
                           000002  3012 	YSAVE=2
                           000003  3013 	VSIZE=3 
      00115E                       3014 search_dict:
      00115E                       3015 	_vars VSIZE 
      009073 17 FE            [ 2]    1     sub sp,#VSIZE 
      009075 72 CF            [ 1] 3016 	ldw y,x 
      001162                       3017 search_next:	
      009077 00 17            [ 1] 3018 	ld a,(y)
      009079 81 0F            [ 1] 3019 	and a,#0xf 
      00907A 6B 01            [ 1] 3020 	ld (NLEN,sp),a  
      00907A CD 90 20         [ 2] 3021 	ldw x,#pad 
      00907D 90 93            [ 2] 3022 	ldw (YSAVE,sp),y
      00907F CD 90            [ 1] 3023 	incw y  
      00116F                       3024 cp_loop:
      009081 20               [ 1] 3025 	ld a,(x)
      009082 FF 81            [ 1] 3026 	jreq str_match 
      009084 0D 01            [ 1] 3027 	tnz (NLEN,sp)
      009084 90 89            [ 1] 3028 	jreq no_match  
      009086 90 CE            [ 1] 3029 	cp a,(y)
      009088 00 17            [ 1] 3030 	jrne no_match 
      00908A 58 89            [ 1] 3031 	incw y 
      00908C 72               [ 1] 3032 	incw x
      00908D F9 01            [ 1] 3033 	dec (NLEN,sp)
      00908F 90 CF            [ 2] 3034 	jra cp_loop 
      001181                       3035 no_match:
      009091 00 17            [ 2] 3036 	ldw y,(YSAVE,sp) 
      009093 85 90 85 81      [ 2] 3037 	subw y,#2 ; move Y to link field
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009097 0A 64            [ 1] 3038 	push #TK_NONE 
      009099 73 74            [ 2] 3039 	ldw y,(y) ; next word link 
      00909B 61               [ 1] 3040 	pop a ; TK_NONE 
      00909C 63 6B            [ 1] 3041 	jreq search_exit  ; not found  
                                   3042 ;try next 
      00909E 3A 20            [ 2] 3043 	jra search_next
      001190                       3044 str_match:
      0090A0 00 02            [ 2] 3045 	ldw y,(YSAVE,sp)
      0090A1 90 F6            [ 1] 3046 	ld a,(y)
      0090A1 52 02            [ 1] 3047 	ld (NLEN,sp),a ; needed to test keyword type  
      0090A3 AE 90            [ 1] 3048 	and a,#0xf 
                                   3049 ; move y to procedure address field 	
      0090A5 97               [ 1] 3050 	inc a 
      0090A6 CD 82 45         [ 1] 3051 	ld acc8,a 
      0090A9 AE 17 7E 35      [ 1] 3052 	clr acc16 
      0090AD 0A 00 07 C3      [ 2] 3053 	addw y,acc16 
      0090B1 00 17            [ 2] 3054 	ldw y,(y) ; routine entry point 
                                   3055 ;determine keyword type bits 7:6 
      0090B3 25 0D            [ 1] 3056 	ld a,(NLEN,sp)
      0090B5 1F               [ 1] 3057 	swap a 
      0090B6 01 FE            [ 1] 3058 	and a,#0xc
      0090B8 CD               [ 1] 3059 	srl a
      0090B9 8A               [ 1] 3060 	srl a 
      0090BA 1A 1E            [ 1] 3061 	add a,#6
      0011AF                       3062 search_exit: 
      0090BC 01               [ 1] 3063 	ldw x,y ; x=routine address 
      0011B0                       3064 	_drop VSIZE 	 
      0090BD 1D 00            [ 2]    1     addw sp,#VSIZE 
      0090BF 02               [ 4] 3065 	ret 
                                   3066 
                                   3067 ;---------------------
                                   3068 ; check if next token
                                   3069 ;  is of expected type 
                                   3070 ; input:
                                   3071 ;   A 		 expected token attribute
                                   3072 ;  ouput:
                                   3073 ;   none     if fail call tb_error 
                                   3074 ;--------------------
      0011B3                       3075 expect:
      0090C0 20               [ 1] 3076 	push a 
      0090C1 EE A6 0D         [ 4] 3077 	call next_token 
      0090C4 CD 82            [ 1] 3078 	cp a,(1,sp)
      0090C6 33 5B            [ 1] 3079 	jreq 1$
      0090C8 02 4F 81         [ 2] 3080 	jp syntax_error
      0090CB 0A               [ 1] 3081 1$: pop a 
      0090CC 63               [ 4] 3082 	ret 
                                   3083 
                                   3084 
                                   3085 ;-------------------------------
                                   3086 ; parse embedded BASIC routines 
                                   3087 ; arguments list.
                                   3088 ; arg_list::=  rel[','rel]*
                                   3089 ; all arguments are of integer type
                                   3090 ; input:
                                   3091 ;   none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3092 ; output:
                                   3093 ;   A 			number of arguments pushed on dstack  
                                   3094 ;--------------------------------
                           000001  3095 	ARG_CNT=1 
      0011C0                       3096 arg_list:
      0090CD 74 61            [ 1] 3097 	push #0  
      0090CF 63 6B 3A         [ 4] 3098 1$: call relation
      0090D2 20 00            [ 1] 3099 	cp a,#TK_NONE 
      0090D4 27 19            [ 1] 3100 	jreq 5$
      0090D4 52 02            [ 1] 3101 	cp a,#TK_INTGR
      0090D6 AE 90            [ 1] 3102 	jrne 4$
      0090D8 CB CD 82         [ 4] 3103 3$: call dpush 
      0090DB 45 96            [ 1] 3104     inc (ARG_CNT,sp)
      0090DD 1C 00 07         [ 4] 3105 	call next_token 
      0090E0 1F 01            [ 1] 3106 	cp a,#TK_NONE 
      0090E2 AE 17            [ 1] 3107 	jreq 5$ 
      0090E4 FE 35            [ 1] 3108 	cp a,#TK_COMMA 
      0090E6 10 00            [ 1] 3109 	jrne 4$
      0090E8 07 E3            [ 2] 3110 	jra 1$ 
      0090E9 CD 0F 8D         [ 4] 3111 4$:	call unget_token 
      0090E9 13               [ 1] 3112 5$:	pop a 
      0090EA 01               [ 4] 3113 	ret 
                                   3114 
                                   3115 
      0011E4                       3116 func_args:
      0090EB 2B 0B            [ 1] 3117 	ld a,#TK_LPAREN 
      0090ED 89 FE CD         [ 4] 3118 	call expect 
      0090F0 8A 1A 85         [ 4] 3119 	call arg_list 
      0090F3 1D               [ 1] 3120 	push a 
      0090F4 00 02            [ 1] 3121 	ld a,#TK_RPAREN 
      0090F6 20 F1 A6         [ 4] 3122 	call expect 
      0090F9 0D               [ 1] 3123 	pop a 
      0090FA CD               [ 4] 3124 	ret 
                                   3125 
                                   3126 
                                   3127 ;--------------------------------
                                   3128 ;   BASIC commnands 
                                   3129 ;--------------------------------
                                   3130 
                                   3131 ;--------------------------------
                                   3132 ;  arithmetic and relational 
                                   3133 ;  routines
                                   3134 ;  operators precedence
                                   3135 ;  highest to lowest
                                   3136 ;  operators on same row have 
                                   3137 ;  same precedence and are executed
                                   3138 ;  from left to right.
                                   3139 ;	'*','/','%'
                                   3140 ;   '-','+'
                                   3141 ;   '=','>','<','>=','<=','<>','><'
                                   3142 ;   '<>' and '><' are equivalent for not equal.
                                   3143 ;--------------------------------
                                   3144 
                                   3145 ;---------------------
                                   3146 ; return array element
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3147 ; address from @(expr)
                                   3148 ; input:
                                   3149 ;   A 		TK_ARRAY
                                   3150 ; output:
                                   3151 ;   A 		TK_INTGR
                                   3152 ;	X 		element address 
                                   3153 ;----------------------
      0011F4                       3154 get_array_element:
      0090FB 82 33 5B         [ 4] 3155 	call func_args 
      0090FE 02 4F            [ 1] 3156 	cp a,#1
      009100 81 03            [ 1] 3157 	jreq 1$
      009101 CC 07 21         [ 2] 3158 	jp syntax_error
      009101 1E 05 72         [ 4] 3159 1$: call dpop  
                                   3160 	; check for bounds 
      009104 FB 03 1F         [ 2] 3161 	cpw x,array_size 
      009107 03 81            [ 2] 3162 	jrule 3$
                                   3163 ; bounds {1..array_size}	
      009109 A6 0A            [ 1] 3164 2$: ld a,#ERR_BAD_VALUE 
      009109 1E 05 72         [ 2] 3165 	jp tb_error 
      00910C F0               [ 2] 3166 3$: tnzw  x
      00910D 03 81            [ 1] 3167 	jreq 2$ 
      00910F 58               [ 2] 3168 	sllw x 
      00910F 52               [ 2] 3169 	pushw x 
      009110 03 0F 01         [ 2] 3170 	ldw x,#tib
      009113 1E 06 9E         [ 2] 3171 	subw x,(1,sp)
      001216                       3172 	_drop 2   
      009116 A5 80            [ 2]    1     addw sp,#2 
      009118 27 05            [ 1] 3173 	ld a,#TK_INTGR
      00911A 03               [ 4] 3174 	ret 
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
      00121B                       3189 factor:
      00121B                       3190 	_vars VSIZE 
      00911B 01 50            [ 2]    1     sub sp,#VSIZE 
      00911D 1F 06 1E         [ 4] 3191 	call next_token
      009120 08 9E            [ 1] 3192 	cp a,#CMD_END 
      009122 A5 80            [ 1] 3193 	jrmi 20$
      009124 27 05            [ 1] 3194 1$:	ld (NEG,sp),a 
      009126 03 01            [ 1] 3195 	and a,#TK_GRP_MASK
      009128 50 1F            [ 1] 3196 	cp a,#TK_GRP_ADD 
      00912A 08 7B            [ 1] 3197 	jreq 2$
      00912C 07 97            [ 1] 3198 	ld a,(NEG,sp)
      00912E 7B 09            [ 2] 3199 	jra 4$  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      001230                       3200 2$:	
      009130 42 1F 02         [ 4] 3201 	call next_token 
      001233                       3202 4$:	
      009133 7B 07            [ 1] 3203 	cp a,#TK_IFUNC 
      009135 97 7B            [ 1] 3204 	jrne 5$ 
      009137 08               [ 4] 3205 	call (x) 
      009138 42 9F            [ 2] 3206 	jra 18$ 
      00123A                       3207 5$:
      00913A 1B 02            [ 1] 3208 	cp a,#TK_INTGR
      00913C 6B 02            [ 1] 3209 	jrne 6$
      00913E 7B 06            [ 2] 3210 	jra 18$
      001240                       3211 6$:
      009140 97 7B            [ 1] 3212 	cp a,#TK_ARRAY
      009142 09 42            [ 1] 3213 	jrne 10$
      009144 9F 1B 02         [ 4] 3214 	call get_array_element
      009147 6B               [ 2] 3215 	ldw x,(x)
      009148 02 0D            [ 2] 3216 	jra 18$ 
      00124A                       3217 10$:
      00914A 01 27            [ 1] 3218 	cp a,#TK_VAR 
      00914C 05 1E            [ 1] 3219 	jrne 11$
      00914E 02               [ 2] 3220 	ldw x,(x)
      00914F 50 1F            [ 2] 3221 	jra 18$
      001251                       3222 11$: 
      009151 02 09            [ 1] 3223 	cp a,#TK_CONST 
      009152 27 16            [ 1] 3224 	jreq 18$
      001255                       3225 12$:			
      009152 1E 02            [ 1] 3226 	cp a,#TK_LPAREN
      009154 5B 03            [ 1] 3227 	jrne 16$
      009156 81 13 08         [ 4] 3228 	call relation
      009157 89               [ 2] 3229 	pushw x 
      009157 52 02            [ 1] 3230 	ld a,#TK_RPAREN 
      009159 0F 01 0F         [ 4] 3231 	call expect
      00915C 02               [ 2] 3232 	popw x 
      00915D 1E 05            [ 2] 3233 	jra 18$	
      001265                       3234 16$:
      00915F 5D 26 05         [ 4] 3235 	call unget_token
      009162 A6               [ 1] 3236 	clr a 
      009163 04 CC            [ 2] 3237 	jra 20$ 
      00126B                       3238 18$: 
      009165 87 A3            [ 1] 3239 	ld a,#TK_MINUS 
      009167 9E A5            [ 1] 3240 	cp a,(NEG,sp)
      009169 80 27            [ 1] 3241 	jrne 19$
      00916B 03               [ 2] 3242 	negw x
      001272                       3243 19$:
      00916C 03 01            [ 1] 3244 	ld a,#TK_INTGR
      001274                       3245 20$:
      001274                       3246 	_drop VSIZE
      00916E 50 1F            [ 2]    1     addw sp,#VSIZE 
      009170 05               [ 4] 3247 	ret
                                   3248 
                                   3249 ;-----------------------------------
                                   3250 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3251 ; output:
                                   3252 ;   A    	token attribute 
                                   3253 ;	X		integer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                                   3254 ;-----------------------------------
                           000001  3255 	N1=1
                           000003  3256 	N2=3
                           000005  3257 	MULOP=5
                           000005  3258 	VSIZE=5
      001277                       3259 term:
      001277                       3260 	_vars VSIZE
      009171 1E 07            [ 2]    1     sub sp,#VSIZE 
      009173 9E A5 80         [ 4] 3261 	call factor
      009176 27 05            [ 1] 3262 	cp a,#CMD_END
      009178 03 01            [ 1] 3263 	jrmi term_exit
      001280                       3264 term01:	 ; check for  operator 
      00917A 03 02            [ 2] 3265 	ldw (N2,sp),x  ; save first factor 
      00917C 50 16 05         [ 4] 3266 	call next_token
      00917F 65 90            [ 1] 3267 	cp a,#2
      009181 CF 00            [ 1] 3268 	jrmi 9$
      009183 09 0D            [ 1] 3269 0$:	ld (MULOP,sp),a
      009185 02 27            [ 1] 3270 	and a,#TK_GRP_MASK
      009187 0B 90            [ 1] 3271 	cp a,#TK_GRP_MULT
      009189 5D 27            [ 1] 3272 	jreq 1$
      00918B 07 5C            [ 1] 3273 	ld a,(MULOP,sp) 
      00918D 16 05 72         [ 4] 3274 	call unget_token 
      009190 B2 00            [ 2] 3275 	jra 9$
      001298                       3276 1$:	; got *|/|%
      009192 09 0D 01         [ 4] 3277 	call factor
      009195 27 01            [ 1] 3278 	cp a,#TK_INTGR
      009197 50 03            [ 1] 3279 	jreq 2$ 
      009198 CC 07 21         [ 2] 3280 	jp syntax_error
      009198 5B 02            [ 2] 3281 2$:	ldw (N1,sp),x  
      00919A 81 05            [ 1] 3282 	ld a,(MULOP,sp) 
      00919B A1 20            [ 1] 3283 	cp a,#TK_MULT 
      00919B 1E 03            [ 1] 3284 	jrne 3$
      00919D 16 05 52         [ 4] 3285 	call multiply 
      0091A0 04 1F            [ 2] 3286 	jra term01
      0091A2 01 17            [ 1] 3287 3$: cp a,#TK_DIV 
      0091A4 03 CD            [ 1] 3288 	jrne 4$ 
      0091A6 91 57 93         [ 4] 3289 	call divide 
      0091A9 5B 04            [ 2] 3290 	jra term01 
      0091AB 81 11 1B         [ 4] 3291 4$: call modulo
      0091AC 20 C3            [ 2] 3292 	jra term01 
      0091AC 52 04            [ 2] 3293 9$: ldw x,(N2,sp)  
      0091AE 72 5F            [ 1] 3294 	ld a,#TK_INTGR 	
      0012C1                       3295 term_exit:
      0012C1                       3296 	_drop VSIZE 
      0091B0 00 09            [ 2]    1     addw sp,#VSIZE 
      0091B2 1F               [ 4] 3297 	ret 
                                   3298 
                                   3299 ;-------------------------------
                                   3300 ;  expr ::= term [['+'|'-'] term]*
                                   3301 ;  result range {-32768..32767}
                                   3302 ;  output:
                                   3303 ;   A    token attribute 
                                   3304 ;   X	 integer   
                                   3305 ;-------------------------------
                           000001  3306 	N1=1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                           000003  3307 	N2=3
                           000005  3308 	OP=5 
                           000005  3309 	VSIZE=5 
      0012C4                       3310 expression:
      0012C4                       3311 	_vars VSIZE 
      0091B3 01 AE            [ 2]    1     sub sp,#VSIZE 
      0091B5 A3 8C 1F         [ 4] 3312 	call term
      0091B8 03 E6            [ 1] 3313 	cp a,#CMD_END 
      0091BA 02 A4            [ 1] 3314 	jrmi expr_exit 
      0091BC 0F C7            [ 2] 3315 0$:	ldw (N2,sp),x 
      0091BE 00 0A 1C         [ 4] 3316 	call next_token
      0091C1 00 03            [ 1] 3317 	cp a,#2
      0091C3 72 BB            [ 1] 3318 	jrmi 9$ 
      0091C5 00 09            [ 1] 3319 1$:	ld (OP,sp),a  
      0091C7 FE 13            [ 1] 3320 	and a,#TK_GRP_MASK
      0091C9 01 27            [ 1] 3321 	cp a,#TK_GRP_ADD 
      0091CB 0A 1E            [ 1] 3322 	jreq 2$ 
      0091CD 03 FE            [ 1] 3323 	ld a,(OP,sp)
      0091CF 1D 00 02         [ 4] 3324 	call unget_token
      0091D2 26 E3            [ 2] 3325 	jra 9$
      0012E5                       3326 2$: 
      0091D4 20 05 1E         [ 4] 3327 	call term
      0091D7 03 1C            [ 1] 3328 	cp a,#TK_INTGR 
      0091D9 00 02            [ 1] 3329 	jreq 3$
      0091DB 5B 04 81         [ 2] 3330 	jp syntax_error
      0091DE 1F 01            [ 2] 3331 3$:	ldw (N1,sp),x 
      0091DE 52 03            [ 1] 3332 	ld a,(OP,sp)
      0091E0 90 93            [ 1] 3333 	cp a,#TK_PLUS 
      0091E2 26 05            [ 1] 3334 	jrne 4$
      0091E2 90 F6 A4         [ 4] 3335 	call add 
      0091E5 0F 6B            [ 2] 3336 	jra 0$ 
      0091E7 01 AE 17         [ 4] 3337 4$:	call substract
      0091EA 18 17            [ 2] 3338 	jra 0$
      0091EC 02 90            [ 2] 3339 9$: ldw x,(N2,sp)
      0091EE 5C 04            [ 1] 3340 	ld a,#TK_INTGR	
      0091EF                       3341 expr_exit:
      001305                       3342 	_drop VSIZE 
      0091EF F6 27            [ 2]    1     addw sp,#VSIZE 
      0091F1 1E               [ 4] 3343 	ret 
                                   3344 
                                   3345 ;---------------------------------------------
                                   3346 ; rel ::= expr rel_op expr
                                   3347 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3348 ;  relation return 1 | 0  for true | false 
                                   3349 ;  output:
                                   3350 ;    A 		token attribute  
                                   3351 ;	 X		1|0
                                   3352 ;---------------------------------------------
                           000001  3353 	N1=1
                           000003  3354 	N2=3
                           000005  3355 	RELOP=5
                           000005  3356 	VSIZE=5 
      001308                       3357 relation: 
      001308                       3358 	_vars VSIZE
      0091F2 0D 01            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0091F4 27 0B 90         [ 4] 3359 	call expression
      0091F7 F1 26            [ 1] 3360 	cp a,#CMD_END  
      0091F9 07 90            [ 1] 3361 	jrmi rel_exit 
                                   3362 	; expect rel_op or leave 
      0091FB 5C 5C            [ 2] 3363 	ldw (N2,sp),x 
      0091FD 0A 01 20         [ 4] 3364 	call next_token 
      009200 EE 02            [ 1] 3365 	cp a,#2
      009201 2B 3E            [ 1] 3366 	jrmi 9$
      00131A                       3367 1$:	
      009201 16 02            [ 1] 3368 	ld (RELOP,sp),a 
      009203 72 A2            [ 1] 3369 	and a,#TK_GRP_MASK
      009205 00 02            [ 1] 3370 	cp a,#TK_GRP_RELOP 
      009207 4B 00            [ 1] 3371 	jreq 2$
      009209 90 FE            [ 1] 3372 	ld a,(RELOP,sp)
      00920B 84 27 21         [ 4] 3373 	call unget_token  
      00920E 20 D2            [ 2] 3374 	jra 9$
      009210                       3375 2$:	; expect another expression or error 
      009210 16 02 90         [ 4] 3376 	call expression
      009213 F6 6B            [ 1] 3377 	cp a,#TK_INTGR 
      009215 01 A4            [ 1] 3378 	jreq 3$
      009217 0F 4C C7         [ 2] 3379 	jp syntax_error 
      00921A 00 0A            [ 2] 3380 3$:	ldw (N1,sp),x 
      00921C 72 5F 00         [ 4] 3381 	call substract
      00921F 09 72            [ 1] 3382 	jrne 4$
      009221 B9 00 09 90      [ 1] 3383 	mov acc8,#2 ; n1==n2
      009225 FE 7B            [ 2] 3384 	jra 6$ 
      001340                       3385 4$: 
      009227 01 4E            [ 1] 3386 	jrsgt 5$  
      009229 A4 0C 44 44      [ 1] 3387 	mov acc8,#4 ; n1<2 
      00922D AB 06            [ 2] 3388 	jra 6$
      00922F                       3389 5$:
      00922F 93 5B 03 81      [ 1] 3390 	mov acc8,#1 ; n1>n2 
      009233                       3391 6$:
      009233 88               [ 1] 3392 	clrw x 
      009234 CD 88 81         [ 1] 3393 	ld a, acc8  
      009237 11 01            [ 1] 3394 	and a,(RELOP,sp)
      009239 27               [ 1] 3395 	tnz a 
      00923A 03 CC            [ 1] 3396 	jreq 10$
      00923C 87               [ 1] 3397 	incw x 
      001356                       3398 7$:	 
      00923D A1 84            [ 2] 3399 	jra 10$  	
      00923F 81 03            [ 2] 3400 9$: ldw x,(N2,sp)
      009240                       3401 10$:
      009240 4B 00            [ 1] 3402 	ld a,#TK_INTGR
      00135C                       3403 rel_exit: 	 
      00135C                       3404 	_drop VSIZE
      009242 CD 93            [ 2]    1     addw sp,#VSIZE 
      009244 88               [ 4] 3405 	ret 
                                   3406 
                                   3407 ;--------------------------------
                                   3408 ; BASIC: SHOW 
                                   3409 ;  show content of dstack,cstack
                                   3410 ;--------------------------------
      00135F                       3411 show:
      009245 A1 00 27         [ 1] 3412 	ld a,base 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009248 19               [ 1] 3413 	push a 
      009249 A1 04 26         [ 4] 3414 	call dots
      00924C 12 CD 90         [ 4] 3415 	call dotr 
      00924F 13               [ 1] 3416 	pop a 
      009250 0C 01 CD         [ 1] 3417 	ld base,a 
      009253 88               [ 1] 3418 	clr a 
      009254 81               [ 4] 3419 	ret
                                   3420 
                                   3421 ;--------------------------------------------
                                   3422 ; BASIC: HEX 
                                   3423 ; select hexadecimal base for integer print
                                   3424 ;---------------------------------------------
      00136F                       3425 hex_base:
      009255 A1 00 27 09      [ 1] 3426 	mov base,#16 
      009259 A1               [ 4] 3427 	ret 
                                   3428 
                                   3429 ;--------------------------------------------
                                   3430 ; BASIC: DEC 
                                   3431 ; select decimal base for integer print
                                   3432 ;---------------------------------------------
      001374                       3433 dec_base:
      00925A 0D 26 02 20      [ 1] 3434 	mov base,#10
      00925E E3               [ 4] 3435 	ret 
                                   3436 
                                   3437 ;------------------------
                                   3438 ; BASIC: SIZE 
                                   3439 ; return free size in text area
                                   3440 ; output:
                                   3441 ;   A 		TK_INTGR
                                   3442 ;   X 	    size integer
                                   3443 ;--------------------------
      001379                       3444 size:
      00925F CD 90 0D         [ 2] 3445 	ldw x,#tib 
      009262 84 81 00 1A      [ 2] 3446 	subw x,txtend 
      009264 A6 04            [ 1] 3447 	ld a,#TK_INTGR
      009264 A6               [ 4] 3448 	ret 
                                   3449 
                                   3450 
                                   3451 ;------------------------
                                   3452 ; BASIC: UBOUND  
                                   3453 ; return array variable size 
                                   3454 ; output:
                                   3455 ;   A 		TK_INTGR
                                   3456 ;   X 	    array size 
                                   3457 ;--------------------------
      001383                       3458 ubound:
      009265 0B CD 92         [ 2] 3459 	ldw x,#tib
      009268 33 CD 92 40      [ 2] 3460 	subw x,txtend 
      00926C 88 A6 0C CD      [ 2] 3461 	ldw y,basicptr 
      009270 92 33 84 81      [ 2] 3462 	cpw y,txtend 
      009274 25 0A            [ 1] 3463 	jrult 1$
      009274 CD 92 64         [ 1] 3464 	push count 
      009277 A1 01            [ 1] 3465 	push #0 
      009279 27 03 CC         [ 2] 3466 	subw x,(1,sp)
      00139C                       3467 	_drop 2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      00927C 87 A1            [ 2]    1     addw sp,#2 
      00927E CD               [ 2] 3468 1$:	srlw x 
      00927F 90 20 C3         [ 2] 3469 	ldw array_size,x
      009282 00 1E            [ 1] 3470 	ld a,#TK_INTGR
      009284 23               [ 4] 3471 	ret 
                                   3472 
                                   3473 ;-----------------------------
                                   3474 ; BASIC: LET var=expr 
                                   3475 ; variable assignement 
                                   3476 ; output:
                                   3477 ;   A 		TK_NONE 
                                   3478 ;-----------------------------
      0013A5                       3479 let:
      009285 05 A6 0A         [ 4] 3480 	call next_token 
      009288 CC 87            [ 1] 3481 	cp a,#TK_VAR 
      00928A A3 5D            [ 1] 3482 	jreq let02
      00928C 27 F8 58         [ 2] 3483 	jp syntax_error
      0013AF                       3484 let02:
      00928F 89 AE 16         [ 4] 3485 	call dpush 
      009292 C8 72 F0         [ 4] 3486 	call next_token 
      009295 01 5B            [ 1] 3487 	cp a,#TK_EQUAL
      009297 02 A6            [ 1] 3488 	jreq 1$
      009299 04 81 21         [ 2] 3489 	jp syntax_error
      00929B                       3490 1$:	
      00929B 52 01 CD         [ 4] 3491 	call relation   
      00929E 88 81            [ 1] 3492 	cp a,#TK_INTGR 
      0092A0 A1 02            [ 1] 3493 	jreq 2$
      0092A2 2B 50 6B         [ 2] 3494 	jp syntax_error
      0013C6                       3495 2$:	
      0092A5 01 A4            [ 1] 3496 	ldw y,x 
      0092A7 30 A1 10         [ 4] 3497 	call dpop  
      0092AA 27               [ 2] 3498 	ldw (x),y   
      0092AB 04               [ 4] 3499 	ret 
                                   3500 
                                   3501 ;----------------------------
                                   3502 ; BASIC: LIST [[start][,end]]
                                   3503 ; list program lines 
                                   3504 ; form start to end 
                                   3505 ; if empty argument list then 
                                   3506 ; list all.
                                   3507 ;----------------------------
                           000001  3508 	FIRST=1
                           000003  3509 	LAST=3 
                           000005  3510 	LN_PTR=5
                           000006  3511 	VSIZE=6 
      0013CD                       3512 list:
      0013CD                       3513 	_vars VSIZE
      0092AC 7B 01            [ 2]    1     sub sp,#VSIZE 
      0092AE 20 03 18         [ 2] 3514 	ldw x,txtbgn 
      0092B0 C3 00 1A         [ 2] 3515 	cpw x,txtend 
      0092B0 CD 88            [ 1] 3516 	jrmi 1$
      0092B2 81 14 4D         [ 2] 3517 	jp list_exit ; nothing to list 
      0092B3 1F 05            [ 2] 3518 1$:	ldw (LN_PTR,sp),x 
      0092B3 A1               [ 2] 3519 	ldw x,(x) 
      0092B4 07 26            [ 2] 3520 	ldw (FIRST,sp),x ; list from first line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0092B6 03 FD 20         [ 2] 3521 	ldw x,#0x7fff ; biggest line number 
      0092B9 31 03            [ 2] 3522 	ldw (LAST,sp),x 
      0092BA CD 11 C0         [ 4] 3523 	call arg_list
      0092BA A1               [ 1] 3524 	tnz a
      0092BB 04 26            [ 1] 3525 	jreq list_start 
      0092BD 02 20            [ 1] 3526 	cp a,#2 
      0092BF 2B 07            [ 1] 3527 	jreq 4$
      0092C0 A1 01            [ 1] 3528 	cp a,#1 
      0092C0 A1 02            [ 1] 3529 	jreq first_line 
      0092C2 26 06 CD         [ 2] 3530 	jp syntax_error 
      0092C5 92 74 FE         [ 4] 3531 4$:	call dswap
      0013F8                       3532 first_line:
      0092C8 20 21 A0         [ 4] 3533 	call dpop 
      0092CA 1F 01            [ 2] 3534 	ldw (FIRST,sp),x 
      0092CA A1 05            [ 1] 3535 	cp a,#1 
      0092CC 26 03            [ 1] 3536 	jreq lines_skip 	
      001401                       3537 last_line:
      0092CE FE 20 1A         [ 4] 3538 	call dpop 
      0092D1 1F 03            [ 2] 3539 	ldw (LAST,sp),x 
      001406                       3540 lines_skip:
      0092D1 A1 09 27         [ 2] 3541 	ldw x,txtbgn
      0092D4 16 05            [ 2] 3542 2$:	ldw (LN_PTR,sp),x 
      0092D5 C3 00 1A         [ 2] 3543 	cpw x,txtend 
      0092D5 A1 0B            [ 1] 3544 	jrpl list_exit 
      0092D7 26               [ 2] 3545 	ldw x,(x) ;line# 
      0092D8 0C CD            [ 2] 3546 	cpw x,(FIRST,sp)
      0092DA 93 88            [ 1] 3547 	jrpl list_start 
      0092DC 89 A6            [ 2] 3548 	ldw x,(LN_PTR,sp) 
      0092DE 0C CD 92         [ 2] 3549 	addw x,#2 
      0092E1 33               [ 1] 3550 	ld a,(x)
      0092E2 85               [ 1] 3551 	incw x 
      0092E3 20 06 09         [ 1] 3552 	ld acc8,a 
      0092E5 72 5F 00 08      [ 1] 3553 	clr acc16 
      0092E5 CD 90 0D 4F      [ 2] 3554 	addw x,acc16
      0092E9 20 09            [ 2] 3555 	jra 2$ 
                                   3556 ; print loop
      0092EB                       3557 list_start:
      0092EB A6 11            [ 2] 3558 	ldw x,(LN_PTR,sp)
      00142B                       3559 3$:	
      0092ED 11 01 26         [ 4] 3560 	call prt_basic_line
      0092F0 01 50            [ 2] 3561 	ldw x,(LN_PTR,sp)
      0092F2 E6 02            [ 1] 3562 	ld a,(2,x)
      0092F2 A6 04 09         [ 1] 3563 	ld acc8,a 
      0092F4 72 5F 00 08      [ 1] 3564 	clr acc16 
      0092F4 5B 01 81 08      [ 2] 3565 	addw x,acc16
      0092F7 C3 00 1A         [ 2] 3566 	cpw x,txtend 
      0092F7 52 05            [ 1] 3567 	jrpl list_exit
      0092F9 CD 92            [ 2] 3568 	ldw (LN_PTR,sp),x
      0092FB 9B               [ 2] 3569 	ldw x,(x)
      0092FC A1 02            [ 2] 3570 	cpw x,(LAST,sp)  
      0092FE 2B 41            [ 1] 3571 	jrsgt list_exit 
      009300 1E 05            [ 2] 3572 	ldw x,(LN_PTR,sp)
      009300 1F 03            [ 2] 3573 	jra 3$
      00144D                       3574 list_exit:
      00144D                       3575 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009302 CD 88            [ 2]    1     addw sp,#VSIZE 
      009304 81               [ 4] 3576 	ret
                                   3577 
                                   3578 ;-------------------------
                                   3579 ; print counted string 
                                   3580 ; input:
                                   3581 ;   X 		address of string
                                   3582 ;--------------------------
      001450                       3583 prt_cmd_name:
      009305 A1               [ 1] 3584 	ld a,(x)
      009306 02               [ 1] 3585 	incw x
      009307 2B 34            [ 1] 3586 	and a,#15  
      009309 6B               [ 1] 3587 	push a 
      00930A 05 A4            [ 1] 3588 1$: tnz (1,sp) 
      00930C 30 A1            [ 1] 3589 	jreq 9$
      00930E 20               [ 1] 3590 	ld a,(x)
      00930F 27 07 7B         [ 4] 3591 	call putc 
      009312 05               [ 1] 3592 	incw x
      009313 CD 90            [ 1] 3593 	dec (1,sp)	 
      009315 0D 20            [ 2] 3594 	jra 1$
      009317 25               [ 1] 3595 9$: pop a 
      009318 81               [ 4] 3596 	ret	
                                   3597 
                                   3598 ;--------------------------
                                   3599 ; print TK_QSTR
                                   3600 ; converting control character
                                   3601 ; to backslash sequence
                                   3602 ; input:
                                   3603 ;   X        char *
                                   3604 ;-----------------------------
      001464                       3605 prt_quote:
      009318 CD 92            [ 1] 3606 	ld a,#'"
      00931A 9B A1 04         [ 4] 3607 	call putc 
      00931D 27               [ 1] 3608 1$:	ld a,(x)
      00931E 03 CC            [ 1] 3609 	jreq 9$
      009320 87               [ 1] 3610 	incw x 
      009321 A1 1F            [ 1] 3611 	cp a,#SPACE 
      009323 01 7B            [ 1] 3612 	jrult 3$
      009325 05 A1 20         [ 4] 3613 	call putc
      009328 26 05            [ 1] 3614 	cp a,#'\ 
      00932A CD 91            [ 1] 3615 	jrne 1$ 
      001478                       3616 2$:
      00932C 0F 20 D1         [ 4] 3617 	call putc 
      00932F A1 21            [ 2] 3618 	jra 1$
      009331 26               [ 1] 3619 3$: push a 
      009332 05 CD            [ 1] 3620 	ld a,#'\
      009334 91 57 20         [ 4] 3621 	call putc 
      009337 C8               [ 1] 3622 	pop a 
      009338 CD 91            [ 1] 3623 	sub a,#7
      00933A 9B 20 C3         [ 1] 3624 	ld acc8,a 
      00933D 1E 03 A6 04      [ 1] 3625 	clr acc16
      009341 90 AE 0C 5C      [ 2] 3626 	ldw y,#escaped 
      009341 5B 05 81 08      [ 2] 3627 	addw y,acc16 
      009344 90 F6            [ 1] 3628 	ld a,(y)
      009344 52 05            [ 2] 3629 	jra 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009346 CD 92            [ 1] 3630 9$: ld a,#'"
      009348 F7 A1 02         [ 4] 3631 	call putc 
      00934B 2B               [ 1] 3632 	incw x 
      00934C 38               [ 4] 3633 	ret
                                   3634 
                                   3635 
                                   3636 ;--------------------------
                                   3637 ; decompile line from token list 
                                   3638 ; input:
                                   3639 ;   X 		pointer at line
                                   3640 ; output:
                                   3641 ;   none 
                                   3642 ;--------------------------	
                           000001  3643 	BASE_SAV=1
                           000002  3644 	WIDTH_SAV=2
                           000003  3645 	XSAVE=3
                           000005  3646 	LLEN=5
                           000005  3647 	VSIZE=5 
      0014A0                       3648 prt_basic_line:
      0014A0                       3649 	_vars VSIZE 
      00934D 1F 03            [ 2]    1     sub sp,#VSIZE 
      00934F CD 88 81         [ 1] 3650 	ld a,base
      009352 A1 02            [ 1] 3651 	ld (BASE_SAV,sp),a  
      009354 2B 2B 6B         [ 1] 3652 	ld a,tab_width 
      009357 05 A4            [ 1] 3653 	ld (WIDTH_SAV,sp),a 
      009359 30 A1 10         [ 2] 3654 	ldw ptr16,x
      00935C 27               [ 2] 3655 	ldw x,(x)
      00935D 07 7B 05 CD      [ 1] 3656 	mov base,#10
      009361 90 0D 20 1C      [ 1] 3657 	mov tab_width,#5
      009365 CD 09 9A         [ 4] 3658 	call print_int ; print line number 
      009365 CD 92            [ 1] 3659 	ld a,#SPACE 
      009367 F7 A1 04         [ 4] 3660 	call putc 
      00936A 27 03 CC 87      [ 1] 3661 	clr tab_width
      00936E A1 1F 01         [ 2] 3662 	ldw x,#2
      009371 7B 05 A1 10      [ 4] 3663 	ld a,([ptr16],x)
      009375 26 05            [ 1] 3664 	ld (LLEN,sp),a 
      009377 CD               [ 1] 3665 	incw x
      009378 91               [ 1] 3666 1$:	ld a,xl 
      009379 01 20            [ 1] 3667 	cp a,(LLEN,sp)
      00937B D1 CD            [ 1] 3668 	jrmi 20$
      00937D 91 09 20         [ 2] 3669 	jp 90$
      0014D6                       3670 20$:	 
      009380 CC 1E 03 A6      [ 4] 3671 	ld a,([ptr16],x)
      009384 04               [ 1] 3672 	incw x 
      009385 1F 03            [ 2] 3673 	ldw (XSAVE,sp),x 
      009385 5B 05            [ 1] 3674 	cp a,#TK_CMD 
      009387 81 44            [ 1] 3675 	jrult 5$
      009388 A1 09            [ 1] 3676 	cp a,#TK_CONST 
      009388 52 05            [ 1] 3677 	jrugt 4$
      0014E5                       3678 2$:	
      00938A CD 93 44 A1      [ 5] 3679 	ldw x,([ptr16],x)
      00938E 02 2B 4B         [ 2] 3680 	cpw x,#rem 
      009391 1F 03            [ 1] 3681 	jrne 3$
      009393 CD 88            [ 1] 3682 	ld a,#''
      009395 81 A1 02         [ 4] 3683 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009398 2B 3E            [ 2] 3684 	ldw x,(XSAVE,sp)
      00939A 1C 00 02         [ 2] 3685 	addw x,#2
      00939A 6B 05 A4 30      [ 2] 3686 	addw x,ptr16  
      00939E A1 30 27         [ 4] 3687 	call puts 
      0093A1 07 7B 05         [ 2] 3688 	jp 90$ 
      0093A4 CD 90 0D         [ 4] 3689 3$:	call cmd_name
      0093A7 20 2F 50         [ 4] 3690 	call prt_cmd_name
      0093A9 A6 20            [ 1] 3691 	ld a,#SPACE 
      0093A9 CD 93 44         [ 4] 3692 	call putc 
      0093AC A1 04            [ 2] 3693 	ldw x,(XSAVE,sp)
      0093AE 27 03 CC         [ 2] 3694 	addw x,#2
      0093B1 87 A1            [ 2] 3695 	jra 1$
      0093B3 1F 01            [ 1] 3696 4$: cp a,#TK_QSTR 
      0093B5 CD 91            [ 1] 3697 	jrne 5$
      0093B7 09 26 06 35      [ 2] 3698 	addw x,ptr16
      0093BB 02 00 0A         [ 4] 3699 	call prt_quote 
      0093BE 20 0C 00 11      [ 2] 3700 	subw x,ptr16  
      0093C0 20 A9            [ 2] 3701 	jra 1$
      0093C0 2C 06            [ 1] 3702 5$:	cp a,#TK_VAR
      0093C2 35 04            [ 1] 3703 	jrne 6$ 
      0093C4 00 0A 20 04      [ 5] 3704 	ldw x,([ptr16],x)
      0093C8 1D 00 21         [ 2] 3705 	subw x,#vars 
      0093C8 35               [ 1] 3706 	ld a,xl
      0093C9 01               [ 1] 3707 	srl a 
      0093CA 00 0A            [ 1] 3708 	add a,#'A 
      0093CC CD 01 B3         [ 4] 3709 	call putc 
      0093CC 5F C6            [ 1] 3710 	ld a,#SPACE 
      0093CE 00 0A 14         [ 4] 3711 	call putc 
      0093D1 05 4D            [ 2] 3712 	ldw x,(XSAVE,sp)
      0093D3 27 05 5C         [ 2] 3713 	addw x,#2 
      0093D6 20 8B            [ 2] 3714 	jra 1$ 
      0093D6 20 02            [ 1] 3715 6$: cp a,#TK_ARRAY 
      0093D8 1E 03            [ 1] 3716 	jrne 7$
      0093DA A6 40            [ 1] 3717 	ld a,#'@ 
      0093DA A6 04 B3         [ 4] 3718 	call putc 
      0093DC 1E 03            [ 2] 3719 	ldw x,(XSAVE,sp)
      0093DC 5B 05 81         [ 2] 3720 	jp 1$ 
      0093DF A1 04            [ 1] 3721 7$: cp a,#TK_INTGR 
      0093DF C6 00            [ 1] 3722 	jrne 8$
      0093E1 07 88 CD 90      [ 5] 3723 	ldw x,([ptr16],x)
      0093E5 A1 CD 90         [ 4] 3724 	call print_int
      0093E8 D4 84            [ 1] 3725 	ld a,#SPACE 
      0093EA C7 00 07         [ 4] 3726 	call putc 
      0093ED 4F 81            [ 2] 3727 	ldw x,(XSAVE,sp)
      0093EF 1C 00 02         [ 2] 3728 	addw x,#2 
      0093EF 35 10 00         [ 2] 3729 	jp 1$
      0093F2 07 81            [ 1] 3730 8$: cp a,#TK_GT 
      0093F4 2B 1A            [ 1] 3731 	jrmi 9$
      0093F4 35 0A            [ 1] 3732 	cp a,#TK_NE 
      0093F6 00 07            [ 1] 3733 	jrugt 9$
      0093F8 81 31            [ 1] 3734 	sub a,#TK_GT  
      0093F9 48               [ 1] 3735 	sll a 
      0093F9 AE 16            [ 1] 3736 	clrw y 
      0093FB C8 72            [ 1] 3737 	ld yl,a 
      0093FD B0 00 1B A6      [ 2] 3738 	addw y,#relop_str 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009401 04 81            [ 2] 3739 	ldw y,(y)
      009403 93               [ 1] 3740 	ldw x,y 
      009403 AE 16 C8         [ 4] 3741 	call puts 
      009406 72 B0            [ 2] 3742 	ldw x,(XSAVE,sp)
      009408 00 1B 90         [ 2] 3743 	jp 1$
      00940B CE 00            [ 1] 3744 9$: cp a,#TK_PLUS 
      00940D 05 90            [ 1] 3745 	jrne 10$
      00940F C3 00            [ 1] 3746 	ld a,#'+
      009411 1B 25            [ 2] 3747 	jra 80$ 
      009413 0A 3B            [ 1] 3748 10$: cp a,#TK_MINUS
      009415 00 04            [ 1] 3749 	jrne 11$
      009417 4B 00            [ 1] 3750 	ld a,#'-
      009419 72 F0            [ 2] 3751 	jra 80$
      00941B 01 5B            [ 1] 3752 11$: cp a,#TK_MULT 
      00941D 02 54            [ 1] 3753 	jrmi 12$
      00941F CF 00            [ 1] 3754 	cp a,#TK_MOD 
      009421 1E A6            [ 1] 3755 	jrugt 12$
      009423 04 81            [ 1] 3756 	sub a,#0x20
      009425 5F               [ 1] 3757 	clrw x 
      009425 CD               [ 1] 3758 	ld xl,a 
      009426 88 81 A1         [ 2] 3759 	addw x,#mul_char 
      009429 05               [ 1] 3760 	ld a,(x)
      00942A 27 03            [ 2] 3761 	jra 80$ 
      00942C CC 87            [ 1] 3762 12$: cp a,#TK_LPAREN 
      00942E A1 0E            [ 1] 3763 	jrmi 13$
      00942F A1 0E            [ 1] 3764 	cp a,#TK_SHARP 
      00942F CD 90            [ 1] 3765 	jrugt 13$
      009431 13 CD            [ 1] 3766 	sub a,#TK_LPAREN
      009433 88               [ 1] 3767 	clrw x 
      009434 81               [ 1] 3768 	ld xl,a 
      009435 A1 32 27         [ 2] 3769 	addw x,#single_char 
      009438 03               [ 1] 3770 	ld a,(x)
      009439 CC 87            [ 2] 3771 	jra 80$
      00943B A1 03            [ 1] 3772 13$: cp a,#TK_CHAR 
      00943C 26 14            [ 1] 3773 	jrne 14$
      00943C CD 93            [ 1] 3774 	ld a,#'\
      00943E 88 A1 04         [ 4] 3775 	call putc 
      009441 27 03            [ 2] 3776 	ldw x,(XSAVE,sp)
      009443 CC 87 A1 11      [ 4] 3777 	ld a,([ptr16],x)
      009446 5C               [ 1] 3778 	incw x 
      009446 90 93            [ 2] 3779 	ldw (XSAVE,sp),x 
      009448 CD 90 20         [ 4] 3780 	call putc 
      00944B FF 81 CE         [ 2] 3781 	jp 1$ 
      00944D A6 3A            [ 1] 3782 14$: ld a,#':
      00944D 52 06 CE         [ 4] 3783 80$: call putc 
      009450 00 19            [ 2] 3784 	ldw x,(XSAVE,sp)
      009452 C3 00 1B         [ 2] 3785 	jp 1$ 
      0015DD                       3786 90$: 
      009455 2B 03            [ 1] 3787 	ld a,#CR 
      009457 CC 94 CD         [ 4] 3788 	call putc
      00945A 1F 05            [ 1] 3789 	ld a,(WIDTH_SAV,sp) 
      00945C FE 1F 01         [ 1] 3790 	ld tab_width,a 
      00945F AE 7F            [ 1] 3791 	ld a,(BASE_SAV,sp) 
      009461 FF 1F 03         [ 1] 3792 	ld base,a
      0015EC                       3793 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009464 CD 92            [ 2]    1     addw sp,#VSIZE 
      009466 40               [ 4] 3794 	ret 	
      009467 4D 27 3F A1           3795 single_char: .byte '(',')',',','#'
      00946B 02 27 07              3796 mul_char: .byte '*','/','%'
      00946E A1 01 27 06 CC 87 A1  3797 relop_str: .word gt,equal,ge,lt,le,ne 
             CD 90 2D 16 0E
      009478 3E 00                 3798 gt: .asciz ">"
      009478 CD 90                 3799 equal: .asciz "="
      00947A 20 1F 01              3800 ge: .asciz ">="
      00947D A1 01                 3801 lt: .asciz "<"
      00947F 27 05 00              3802 le: .asciz "<="
      009481 3C 3E 00              3803 ne:  .asciz "<>"
                                   3804 
                                   3805 
                                   3806 ;---------------------------------
                                   3807 ; BASIC: PRINT|? arg_list 
                                   3808 ; print values from argument list
                                   3809 ;----------------------------------
                           000001  3810 	COMMA=1
                           000001  3811 	VSIZE=1
      001611                       3812 print:
      009481 CD 90            [ 1] 3813 push #0 ; local variable COMMA 
      001613                       3814 reset_comma:
      009483 20 1F            [ 1] 3815 	clr (COMMA,sp)
      001615                       3816 prt_loop:
      009485 03 13 08         [ 4] 3817 	call relation 
      009486 A1 01            [ 1] 3818 	cp a,#TK_COLON 
      009486 CE 00            [ 1] 3819 	jreq print_exit   
      009488 19 1F            [ 1] 3820 	cp a,#TK_INTGR 
      00948A 05 C3            [ 1] 3821 	jrne 0$ 
      00948C 00 1B 2A         [ 4] 3822 	call print_int 
      00948F 3D FE            [ 2] 3823 	jra reset_comma
      001625                       3824 0$: 	
      009491 13 01 2A         [ 4] 3825 	call next_token
      009494 14 1E            [ 1] 3826 	cp a,#TK_NONE 
      009496 05 1C            [ 1] 3827 	jreq print_exit 
      009498 00 02            [ 1] 3828 1$:	cp a,#TK_QSTR
      00949A F6 5C            [ 1] 3829 	jrne 2$   
      00949C C7 00 0A         [ 4] 3830 	call puts
      00949F 72               [ 1] 3831 	incw x 
      0094A0 5F 00 09 72      [ 2] 3832 	subw x,basicptr 
      0094A4 BB               [ 1] 3833 	ld a,xl 
      0094A5 00 09 20         [ 1] 3834 	ld in,a  
      0094A8 E0 D5            [ 2] 3835 	jra reset_comma
      0094A9 A1 03            [ 1] 3836 2$: cp a,#TK_CHAR 
      0094A9 1E 05            [ 1] 3837 	jrne 3$
      0094AB 9F               [ 1] 3838 	ld a,xl 
      0094AB CD 95 20         [ 4] 3839 	call putc 
      0094AE 1E 05            [ 2] 3840 	jra reset_comma 
      001648                       3841 3$: 	
      0094B0 E6 02            [ 1] 3842 	cp a,#TK_CFUNC 
      0094B2 C7 00            [ 1] 3843 	jrne 4$ 
      0094B4 0A               [ 4] 3844 	call (x)
      0094B5 72               [ 1] 3845 	ld a,xl 
      0094B6 5F 00 09         [ 4] 3846 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0094B9 72 BB            [ 2] 3847 	jra reset_comma 
      001653                       3848 4$: 
      0094BB 00 09            [ 1] 3849 	cp a,#TK_COMMA 
      0094BD C3 00            [ 1] 3850 	jrne 5$
      0094BF 1B 2A            [ 1] 3851 	cpl (COMMA,sp) 
      0094C1 0B 1F 05         [ 2] 3852 	jp prt_loop   
      00165C                       3853 5$: 
      0094C4 FE 13            [ 1] 3854 	cp a,#TK_SHARP
      0094C6 03 2C            [ 1] 3855 	jrne 7$
      0094C8 04 1E 05         [ 4] 3856 	call next_token
      0094CB 20 DE            [ 1] 3857 	cp a,#TK_INTGR 
      0094CD 27 03            [ 1] 3858 	jreq 6$
      0094CD 5B 06 81         [ 2] 3859 	jp syntax_error 
      0094D0                       3860 6$:
      0094D0 F6               [ 1] 3861 	ld a,xl 
      0094D1 5C A4            [ 1] 3862 	and a,#15 
      0094D3 0F 88 0D         [ 1] 3863 	ld tab_width,a 
      0094D6 01 27 09         [ 2] 3864 	jp reset_comma 
      001673                       3865 7$:	
      0094D9 F6 CD 82         [ 4] 3866 	call unget_token
      001676                       3867 print_exit:
      0094DC 33 5C            [ 1] 3868 	tnz (COMMA,sp)
      0094DE 0A 01            [ 1] 3869 	jrne 9$
      0094E0 20 F3            [ 1] 3870 	ld a,#CR 
      0094E2 84 81 B3         [ 4] 3871     call putc 
      0094E4                       3872 9$:	_drop VSIZE 
      0094E4 A6 22            [ 2]    1     addw sp,#VSIZE 
      0094E6 CD               [ 4] 3873 	ret 
                                   3874 
                                   3875 ;----------------------
                                   3876 ; 'save_context' and
                                   3877 ; 'rest_context' must be 
                                   3878 ; called at the same 
                                   3879 ; call stack depth 
                                   3880 ; i.e. SP must have the 
                                   3881 ; save value at  
                                   3882 ; entry point of both 
                                   3883 ; routine. 
                                   3884 ;---------------------
                           000006  3885 	CTXT_SIZE=6 ; size of saved data 
                                   3886 ;--------------------
                                   3887 ; save current BASIC
                                   3888 ; interpreter context 
                                   3889 ; on cstack 
                                   3890 ;--------------------
      001682                       3891 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001682                       3892 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001682                       3893 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001682                       3894 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001682                       3895 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      001682                       3896 save_context:
      0094E7 82 33 F6         [ 2] 3897 	ldw x,basicptr 
      0094EA 27 2D            [ 2] 3898 	ldw (BPTR,sp),x
      0094EC 5C A1 20         [ 1] 3899 	ld a,in 
      0094EF 25 0C            [ 1] 3900 	ld (IN,sp),a
      0094F1 CD 82 33         [ 1] 3901 	ld a,count 
      0094F4 A1 5C            [ 1] 3902 	ld (CNT,sp),a  
      0094F6 26               [ 4] 3903 	ret
                                   3904 
                                   3905 ;-----------------------
                                   3906 ; restore previously saved 
                                   3907 ; BASIC interpreter context 
                                   3908 ; from cstack 
                                   3909 ;-------------------------
      001692                       3910 rest_context:
      0094F7 F1 03            [ 2] 3911 	ldw x,(BPTR,sp)
      0094F8 CF 00 04         [ 2] 3912 	ldw basicptr,x 
      0094F8 CD 82            [ 1] 3913 	ld a,(IN,sp)
      0094FA 33 20 EC         [ 1] 3914 	ld in,a
      0094FD 88 A6            [ 1] 3915 	ld a,(CNT,sp)
      0094FF 5C CD 82         [ 1] 3916 	ld count,a  
      009502 33               [ 4] 3917 	ret
                                   3918 
                                   3919 ;------------------------------------------
                                   3920 ; BASIC: INPUT [string],var[,[string],var]
                                   3921 ; input value in variables 
                                   3922 ; [string] optionally can be used as prompt 
                                   3923 ;-----------------------------------------
                           000001  3924 	CX_BPTR=1
                           000003  3925 	CX_LNO=3
                           000004  3926 	CX_IN=4
                           000005  3927 	CX_CNT=5
                           000006  3928 	SKIP=6
                           000007  3929 	VSIZE=7
      0016A2                       3930 input_var:
      009503 84 A0 07 C7 00   [ 2] 3931 	btjt flags,#FRUN,1$ 
      009508 0A 72            [ 1] 3932 	ld a,#ERR_RUN_ONLY 
      00950A 5F 00 09         [ 2] 3933 	jp tb_error 
      0016AC                       3934 1$:	_vars VSIZE 
      00950D 90 AE            [ 2]    1     sub sp,#VSIZE 
      0016AE                       3935 input_loop:
      00950F 8C DC            [ 1] 3936 	clr (SKIP,sp)
      009511 72 B9 00         [ 4] 3937 	call next_token 
      009514 09 90            [ 1] 3938 	cp a,#TK_NONE 
      009516 F6 20            [ 1] 3939 	jreq input_exit 
      009518 DF A6            [ 1] 3940 	cp a,#TK_QSTR 
      00951A 22 CD            [ 1] 3941 	jrne 1$ 
      00951C 82 33 5C         [ 4] 3942 	call puts 
      00951F 81 06            [ 1] 3943 	cpl (SKIP,sp)
      009520 CD 08 01         [ 4] 3944 	call next_token 
      009520 52 05            [ 1] 3945 1$: cp a,#TK_VAR  
      009522 C6 00            [ 1] 3946 	jreq 2$ 
      009524 07 6B 01         [ 2] 3947 	jp syntax_error
      009527 C6 00 21         [ 4] 3948 2$:	call dpush 
      00952A 6B 02            [ 1] 3949 	tnz (SKIP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      00952C CF 00            [ 1] 3950 	jrne 21$ 
      00952E 12 FE            [ 1] 3951 	ld a,#':
      009530 35 0A 00         [ 1] 3952 	ld pad+1,a 
      009533 07 35 05 00      [ 1] 3953 	clr pad+2
      009537 21 CD 8A         [ 2] 3954 	ldw x,#pad 
      00953A 1A A6 20         [ 4] 3955 	call puts   
      0016E0                       3956 21$:
      00953D CD 82 33         [ 4] 3957 	call save_context 
      009540 72 5F 00         [ 2] 3958 	ldw x,#tib 
      009543 21 AE 00         [ 2] 3959 	ldw basicptr,x  
      009546 02 72 D6 00      [ 1] 3960 	clr count  
      00954A 12 6B 05         [ 4] 3961 	call readln 
      00954D 5C 9F 11 05      [ 1] 3962 	clr in 
      009551 2B 03 CC         [ 4] 3963 	call relation 
      009554 96 5D            [ 1] 3964 	cp a,#TK_INTGR
      009556 27 03            [ 1] 3965 	jreq 3$ 
      009556 72 D6 00         [ 2] 3966 	jp syntax_error
      009559 12 5C 1F         [ 4] 3967 3$: call dpush 
      00955C 03 A1 06         [ 4] 3968 	call store 
      00955F 25 44 A1         [ 4] 3969 	call rest_context
      009562 09 22 2F         [ 4] 3970 	call next_token 
      009565 A1 0D            [ 1] 3971 	cp a,#TK_COMMA 
      009565 72 DE            [ 1] 3972 	jrne 4$
      009567 00 12            [ 2] 3973 	jra input_loop 
      009569 A3 97 96         [ 4] 3974 4$:	call unget_token 
      001713                       3975 input_exit:
      001713                       3976 	_drop VSIZE 
      00956C 26 14            [ 2]    1     addw sp,#VSIZE 
      00956E A6               [ 4] 3977 	ret 
                                   3978 
                                   3979 
                                   3980 ;---------------------
                                   3981 ; BASIC: REMARK | ' 
                                   3982 ; skip comment to end of line 
                                   3983 ;---------------------- 
      001716                       3984 rem:
      00956F 27 CD 82 33 1E   [ 1] 3985  	mov count,in 
      009574 03               [ 4] 3986 	ret 
                                   3987 
                                   3988 ;---------------------
                                   3989 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3990 ; read in loop 'addr'  
                                   3991 ; apply & 'mask' to value 
                                   3992 ; loop while result==0.  
                                   3993 ; if 'xor_mask' given 
                                   3994 ; apply ^ in second  
                                   3995 ; loop while result==0 
                                   3996 ;---------------------
                           000001  3997 	XMASK=1 
                           000002  3998 	MASK=2
                           000003  3999 	ADDR=3
                           000004  4000 	VSIZE=4
      00171C                       4001 wait: 
      00171C                       4002 	_vars VSIZE
      009575 1C 00            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009577 02 72            [ 1] 4003 	clr (XMASK,sp) 
      009579 BB 00 12         [ 4] 4004 	call arg_list 
      00957C CD 82            [ 1] 4005 	cp a,#2
      00957E 45 CC            [ 1] 4006 	jruge 0$
      009580 96 5D CD         [ 2] 4007 	jp syntax_error 
      009583 91 AC            [ 1] 4008 0$:	cp a,#3
      009585 CD 94            [ 1] 4009 	jrult 1$
      009587 D0 A6 20         [ 4] 4010 	call dpop 
      00958A CD               [ 1] 4011 	ld a,xl
      00958B 82 33            [ 1] 4012 	ld (XMASK,sp),a 
      00958D 1E 03 1C         [ 4] 4013 1$: call dpop ; mask 
      009590 00               [ 1] 4014 	ld a,xl 
      009591 02 20            [ 1] 4015 	ld (MASK,sp),a 
      009593 BA A1 0A         [ 4] 4016 	call dpop ; address 
      009596 26               [ 1] 4017 2$:	ld a,(x)
      009597 0D 72            [ 1] 4018 	and a,(MASK,sp)
      009599 BB 00            [ 1] 4019 	xor a,(XMASK,sp)
      00959B 12 CD            [ 1] 4020 	jreq 2$ 
      001744                       4021 	_drop VSIZE 
      00959D 94 E4            [ 2]    1     addw sp,#VSIZE 
      00959F 72               [ 4] 4022 	ret 
                                   4023 
                                   4024 ;---------------------
                                   4025 ; BASIC: BSET addr,mask
                                   4026 ; set bits at 'addr' corresponding 
                                   4027 ; to those of 'mask' that are at 1.
                                   4028 ; arguments:
                                   4029 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4030 ;   mask        mask|addr
                                   4031 ; output:
                                   4032 ;	none 
                                   4033 ;--------------------------
      001747                       4034 bit_set:
      0095A0 B0 00 12         [ 4] 4035 	call arg_list 
      0095A3 20 A9            [ 1] 4036 	cp a,#2	 
      0095A5 A1 05            [ 1] 4037 	jreq 1$ 
      0095A7 26 1A 72         [ 2] 4038 	jp syntax_error
      001751                       4039 1$: 
      0095AA DE 00 12         [ 4] 4040 	call dpop ; mask 
      0095AD 1D               [ 1] 4041 	ld a,xl 
      0095AE 00 22 9F         [ 4] 4042 	call dpop ; addr  
      0095B1 44               [ 1] 4043 	or a,(x)
      0095B2 AB               [ 1] 4044 	ld (x),a
      0095B3 41               [ 4] 4045 	ret 
                                   4046 
                                   4047 ;---------------------
                                   4048 ; BASIC: BRES addr,mask
                                   4049 ; reset bits at 'addr' corresponding 
                                   4050 ; to those of 'mask' that are at 1.
                                   4051 ; arguments:
                                   4052 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4053 ;   mask	    ~mask&*addr  
                                   4054 ; output:
                                   4055 ;	none 
                                   4056 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00175B                       4057 bit_reset:
      0095B4 CD 82 33         [ 4] 4058 	call arg_list 
      0095B7 A6 20            [ 1] 4059 	cp a,#2  
      0095B9 CD 82            [ 1] 4060 	jreq 1$ 
      0095BB 33 1E 03         [ 2] 4061 	jp syntax_error
      001765                       4062 1$: 
      0095BE 1C 00 02         [ 4] 4063 	call dpop ; mask 
      0095C1 20               [ 1] 4064 	ld a,xl 
      0095C2 8B               [ 1] 4065 	cpl a 
      0095C3 A1 02 26         [ 4] 4066 	call dpop ; addr  
      0095C6 0A               [ 1] 4067 	and a,(x)
      0095C7 A6               [ 1] 4068 	ld (x),a 
      0095C8 40               [ 4] 4069 	ret 
                                   4070 
                                   4071 ;---------------------
                                   4072 ; BASIC: BRES addr,mask
                                   4073 ; toggle bits at 'addr' corresponding 
                                   4074 ; to those of 'mask' that are at 1.
                                   4075 ; arguments:
                                   4076 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4077 ;   mask	    mask^*addr  
                                   4078 ; output:
                                   4079 ;	none 
                                   4080 ;--------------------------
      001770                       4081 bit_toggle:
      0095C9 CD 82 33         [ 4] 4082 	call arg_list 
      0095CC 1E 03            [ 1] 4083 	cp a,#2 
      0095CE CC 95            [ 1] 4084 	jreq 1$ 
      0095D0 4E A1 04         [ 2] 4085 	jp syntax_error
      0095D3 26 14 72         [ 4] 4086 1$: call dpop ; mask 
      0095D6 DE               [ 1] 4087 	ld a,xl 
      0095D7 00 12 CD         [ 4] 4088 	call dpop ; addr  
      0095DA 8A               [ 1] 4089 	xor a,(x)
      0095DB 1A               [ 1] 4090 	ld (x),a 
      0095DC A6               [ 4] 4091 	ret 
                                   4092 
                                   4093 
                                   4094 ;---------------------
                                   4095 ; BASIC: BTEST(addr,bit)
                                   4096 ; return bit value at 'addr' 
                                   4097 ; bit is in range {0..7}.
                                   4098 ; arguments:
                                   4099 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4100 ;   bit 	    bit position {0..7}  
                                   4101 ; output:
                                   4102 ;	none 
                                   4103 ;--------------------------
      001784                       4104 bit_test:
      0095DD 20 CD 82         [ 4] 4105 	call func_args 
      0095E0 33 1E            [ 1] 4106 	cp a,#2
      0095E2 03 1C            [ 1] 4107 	jreq 0$
      0095E4 00 02 CC         [ 2] 4108 	jp syntax_error
      00178E                       4109 0$:	
      0095E7 95 4E A1         [ 4] 4110 	call dpop 
      0095EA 31               [ 1] 4111 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0095EB 2B 1A            [ 1] 4112 	and a,#7
      0095ED A1               [ 1] 4113 	push a 
      0095EE 35 22            [ 1] 4114 	ld a,#1 
      0095F0 16 A0            [ 1] 4115 1$: tnz (1,sp)
      0095F2 31 48            [ 1] 4116 	jreq 2$
      0095F4 90               [ 1] 4117 	sll a 
      0095F5 5F 90            [ 1] 4118 	dec (1,sp)
      0095F7 97 72            [ 2] 4119 	jra 1$
      0095F9 A9 96 76         [ 4] 4120 2$: call dpop 
      0095FC 90               [ 1] 4121 	and a,(x)
      0095FD FE 93            [ 1] 4122 	jreq 3$
      0095FF CD 82            [ 1] 4123 	ld a,#1 
      009601 45               [ 1] 4124 3$:	clrw x 
      009602 1E               [ 1] 4125 	ld xl,a 
      009603 03 CC            [ 1] 4126 	ld a,#TK_INTGR
      0017AC                       4127 	_drop 1 
      009605 95 4E            [ 2]    1     addw sp,#1 
      009607 A1               [ 4] 4128 	ret
                                   4129 
                                   4130 
                                   4131 ;--------------------
                                   4132 ; BASIC: POKE addr,byte
                                   4133 ; put a byte at addr 
                                   4134 ;--------------------
      0017AF                       4135 poke:
      009608 10 26 04         [ 4] 4136 	call arg_list 
      00960B A6 2B            [ 1] 4137 	cp a,#2
      00960D 20 46            [ 1] 4138 	jreq 1$
      00960F A1 11 26         [ 2] 4139 	jp syntax_error
      0017B9                       4140 1$:	
      009612 04 A6 2D         [ 4] 4141 	call dpop 
      009615 20               [ 1] 4142     ld a,xl 
      009616 3E A1 20         [ 4] 4143 	call dpop 
      009619 2B               [ 1] 4144 	ld (x),a 
      00961A 0E               [ 4] 4145 	ret 
                                   4146 
                                   4147 ;-----------------------
                                   4148 ; BASIC: PEEK(addr)
                                   4149 ; get the byte at addr 
                                   4150 ; input:
                                   4151 ;	none 
                                   4152 ; output:
                                   4153 ;	X 		value 
                                   4154 ;-----------------------
      0017C2                       4155 peek:
      00961B A1 22 22         [ 4] 4156 	call func_args
      00961E 0A A0            [ 1] 4157 	cp a,#1
      009620 20 5F            [ 1] 4158 	jreq 1$
      009622 97 1C 96         [ 2] 4159 	jp syntax_error
      009625 73 F6 20         [ 4] 4160 1$:	call dpop 
      009628 2C               [ 1] 4161 	ld a,(x)
      009629 A1               [ 1] 4162 	clrw x 
      00962A 0B               [ 1] 4163 	ld xl,a 
      00962B 2B 0E            [ 1] 4164 	ld a,#TK_INTGR
      00962D A1               [ 4] 4165 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4166 
      0017D5                       4167 if: 
      00962E 0E 22 0A         [ 4] 4168 	call relation 
      009631 A0 0B            [ 1] 4169 	cp a,#TK_INTGR
      009633 5F 97            [ 1] 4170 	jreq 1$ 
      009635 1C 96 6F         [ 2] 4171 	jp syntax_error
      009638 F6               [ 1] 4172 1$:	clr a 
      009639 20               [ 2] 4173 	tnzw x 
      00963A 1A A1            [ 1] 4174 	jrne 9$  
                                   4175 ;skip to next line
      00963C 03 26 14 A6 5C   [ 1] 4176 	mov in,count
      009641 CD               [ 4] 4177 9$:	ret 
                                   4178 
                                   4179 ;------------------------
                                   4180 ; BASIC: FOR var=expr 
                                   4181 ; set variable to expression 
                                   4182 ; leave variable address 
                                   4183 ; on dstack and set
                                   4184 ; FFOR bit in 'flags'
                                   4185 ;-----------------
                           000001  4186 	RETL1=1
                           000003  4187 	INW=3
                           000005  4188 	BPTR=5
      0017E9                       4189 for: ; { -- var_addr }
      009642 82 33            [ 1] 4190 	ld a,#TK_VAR 
      009644 1E 03 72         [ 4] 4191 	call expect
      009647 D6 00 12         [ 4] 4192 	call dpush 
      00964A 5C 1F 03         [ 4] 4193 	call let02 
      00964D CD 82 33 CC      [ 1] 4194 	bset flags,#FFOR 
                                   4195 ; open space on cstack for BPTR and INW 
      009651 95               [ 2] 4196 	popw x ; call return address 
      0017F9                       4197 	_vars 4
      009652 4E A6            [ 2]    1     sub sp,#4 
      009654 3A               [ 2] 4198 	pushw x  ; RETL1 
      009655 CD               [ 1] 4199 	clrw x 
      009656 82 33            [ 2] 4200 	ldw (BPTR,sp),x 
      009658 1E 03            [ 2] 4201 	ldw (INW,sp),x 
      00965A CC 95 4E         [ 4] 4202 	call next_token 
      00965D A1 06            [ 1] 4203 	cp a,#TK_CMD 
      00965D A6 0D            [ 1] 4204 	jreq 1$
      00965F CD 82 33         [ 2] 4205 	jp syntax_error
      00180B                       4206 1$:  
      009662 7B 02 C7         [ 2] 4207 	cpw x,#to 
      009665 00 21            [ 1] 4208 	jreq to
      009667 7B 01 C7         [ 2] 4209 	jp syntax_error 
                                   4210 
                                   4211 ;-----------------------------------
                                   4212 ; BASIC: TO expr 
                                   4213 ; second part of FOR loop initilization
                                   4214 ; leave limit on dstack and set 
                                   4215 ; FTO bit in 'flags'
                                   4216 ;-----------------------------------
      001813                       4217 to: ; { var_addr -- var_addr limit step }
      00966A 00 07 5B 05 81   [ 2] 4218 	btjt flags,#FFOR,1$
      00966F 28 29 2C         [ 2] 4219 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009672 23 2A 2F         [ 4] 4220 1$: call relation  
      009675 25 96            [ 1] 4221 	cp a,#TK_INTGR 
      009677 82 96            [ 1] 4222 	jreq 2$ 
      009679 84 96 86         [ 2] 4223 	jp syntax_error
      001825                       4224 2$: 
      00967C 96 89 96         [ 4] 4225     call dpush ; limit
      00967F 8B 96 8E         [ 2] 4226 	ldw x,in.w 
      009682 3E 00 3D         [ 4] 4227 	call next_token
      009685 00 3E            [ 1] 4228 	cp a,#TK_NONE  
      009687 3D 00            [ 1] 4229 	jreq 4$ 
      009689 3C 00            [ 1] 4230 	cp a,#TK_CMD
      00968B 3C 3D            [ 1] 4231 	jrne 3$
      00968D 00 3C 3E         [ 2] 4232 	cpw x,#step 
      009690 00 08            [ 1] 4233 	jreq step
      009691                       4234 3$:	
      009691 4B 00 8D         [ 4] 4235 	call unget_token   	 
      009693                       4236 4$:	
      009693 0F 01 01         [ 2] 4237 	ldw x,#1   ; default step  
      009695 20 12            [ 2] 4238 	jra store_loop_addr 
                                   4239 
                                   4240 
                                   4241 ;----------------------------------
                                   4242 ; BASIC: STEP expr 
                                   4243 ; optional third par of FOR loop
                                   4244 ; initialization. 	
                                   4245 ;------------------------------------
      001843                       4246 step: ; {var limit -- var limit step}
      009695 CD 93 88 A1 01   [ 2] 4247 	btjt flags,#FFOR,1$
      00969A 27 5A A1         [ 2] 4248 	jp syntax_error
      00969D 04 26 05         [ 4] 4249 1$: call relation
      0096A0 CD 8A            [ 1] 4250 	cp a,#TK_INTGR
      0096A2 1A 20            [ 1] 4251 	jreq store_loop_addr  
      0096A4 EE 07 21         [ 2] 4252 	jp syntax_error
                                   4253 ; leave loop back entry point on cstack 
                                   4254 ; cstack is 2 call deep from interp_loop
      0096A5                       4255 store_loop_addr:
      0096A5 CD 88 81         [ 4] 4256 	call dpush 
      0096A8 A1 00 27         [ 2] 4257 	ldw x,basicptr  
      0096AB 4A A1            [ 2] 4258 	ldw (BPTR,sp),x 
      0096AD 0A 26 0E         [ 2] 4259 	ldw x,in.w 
      0096B0 CD 82            [ 2] 4260 	ldw (INW,sp),x   
      0096B2 45 5C 72 B0      [ 1] 4261 	bres flags,#FFOR 
      0096B6 00 05 9F C7      [ 1] 4262 	inc loop_depth  
      0096BA 00               [ 4] 4263 	ret 
                                   4264 
                                   4265 ;--------------------------------
                                   4266 ; BASIC: NEXT var 
                                   4267 ; FOR loop control 
                                   4268 ; increment variable with step 
                                   4269 ; and compare with limit 
                                   4270 ; loop if threshold not crossed.
                                   4271 ; else clean both stacks. 
                                   4272 ; and decrement 'loop_depth' 
                                   4273 ;--------------------------------
      00186B                       4274 next: ; {var limit step -- [var limit step ] }
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0096BB 02 20 D5 A1      [ 1] 4275 	tnz loop_depth 
      0096BF 03 26            [ 1] 4276 	jrne 1$ 
      0096C1 06 9F CD         [ 2] 4277 	jp syntax_error 
      001874                       4278 1$: 
      0096C4 82 33            [ 1] 4279 	ld a,#TK_VAR 
      0096C6 20 CB B3         [ 4] 4280 	call expect
                                   4281 ; check for good variable after NEXT 	 
      0096C8 90 93            [ 1] 4282 	ldw y,x 
      0096C8 A1 08 26         [ 2] 4283 	ldw x,#4  
      0096CB 07 FD 9F CD      [ 4] 4284 	cpw y,([dstkptr],x) ; compare variables address 
      0096CF 82 33            [ 1] 4285 	jreq 2$  
      0096D1 20 C0 21         [ 2] 4286 	jp syntax_error ; not the good one 
      0096D3                       4287 2$: ; increment variable 
      0096D3 A1               [ 1] 4288 	ldw x,y
      0096D4 0D               [ 2] 4289 	ldw x,(x)  ; get var value 
      0096D5 26 05 03         [ 2] 4290 	ldw acc16,x 
      0096D8 01 CC 96 95      [ 5] 4291 	ldw x,[dstkptr] ; step
      0096DC 72 BB 00 08      [ 2] 4292 	addw x,acc16 ; var+step 
      0096DC A1 0E            [ 2] 4293 	ldw (y),x ; save var new value 
                                   4294 ; compare with limit 
      0096DE 26 13            [ 1] 4295 	ldw y,x 
      0096E0 CD 88 81 A1      [ 5] 4296 	ldw x,[dstkptr] ; step in x 
      0096E4 04               [ 2] 4297 	tnzw x  
      0096E5 27 03            [ 1] 4298 	jrpl 4$ ; positive step 
                                   4299 ;negative step 
      0096E7 CC 87 A1         [ 2] 4300 	ldw x,#2
      0096EA 72 D3 00 16      [ 4] 4301 	cpw y,([dstkptr],x)
      0096EA 9F A4            [ 1] 4302 	jrslt loop_done
      0096EC 0F C7            [ 2] 4303 	jra loop_back 
      0018AA                       4304 4$: ; positive step
      0096EE 00 21 CC         [ 2] 4305 	ldw x,#2 
      0096F1 96 93 00 16      [ 4] 4306 	cpw y,([dstkptr],x)
      0096F3 2C 15            [ 1] 4307 	jrsgt loop_done
      0018B3                       4308 loop_back:
      0096F3 CD 90            [ 2] 4309 	ldw x,(BPTR,sp)
      0096F5 0D 00 04         [ 2] 4310 	ldw basicptr,x 
      0096F6 72 01 00 1F 05   [ 2] 4311 	btjf flags,#FRUN,1$ 
      0096F6 0D 01            [ 1] 4312 	ld a,(2,x)
      0096F8 26 05 A6         [ 1] 4313 	ld count,a
      0096FB 0D CD            [ 2] 4314 1$:	ldw x,(INW,sp)
      0096FD 82 33 5B         [ 2] 4315 	ldw in.w,x 
      009700 01               [ 4] 4316 	ret 
      0018C8                       4317 loop_done:
                                   4318 	; remove var limit step on dstack 
      009701 81 00 16         [ 2] 4319 	ldw x,dstkptr 
      009702 1C 00 06         [ 2] 4320 	addw x,#3*CELL_SIZE
      009702 CE 00 05         [ 2] 4321 	ldw dstkptr,x 
                                   4322 	; remove 2 return address on cstack 
      009705 1F               [ 2] 4323 	popw x
      0018D2                       4324 	_drop 4
      009706 03 C6            [ 2]    1     addw sp,#4 
      009708 00               [ 2] 4325 	pushw x 
      009709 02 6B 07 C6      [ 1] 4326 	dec loop_depth 
      00970D 00               [ 4] 4327 	ret 
                                   4328 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4329 
                                   4330 ;------------------------
                                   4331 ; BASIC: GOTO line# 
                                   4332 ; jump to line# 
                                   4333 ; here cstack is 2 call deep from interp_loop 
                                   4334 ;------------------------
      0018DA                       4335 goto:
      00970E 04 6B 08 81 06   [ 2] 4336 	btjt flags,#FRUN,0$ 
      009712 A6 06            [ 1] 4337 	ld a,#ERR_RUN_ONLY
      009712 1E 03 CF         [ 2] 4338 	jp tb_error 
      009715 00               [ 4] 4339 	ret 
      009716 05 7B            [ 2] 4340 0$:	jra go_common
                                   4341 
                                   4342 ;--------------------
                                   4343 ; BASIC: GOSUB line#
                                   4344 ; basic subroutine call
                                   4345 ; actual line# and basicptr 
                                   4346 ; are saved on cstack
                                   4347 ; here cstack is 2 call deep from interp_loop 
                                   4348 ;--------------------
                           000003  4349 	GOS_RET=3
      0018E7                       4350 gosub:
      009718 07 C7 00 02 7B   [ 2] 4351 	btjt flags,#FRUN,0$ 
      00971D 08 C7            [ 1] 4352 	ld a,#ERR_RUN_ONLY
      00971F 00 04 81         [ 2] 4353 	jp tb_error 
      009722 81               [ 4] 4354 	ret 
      009722 72               [ 2] 4355 0$:	popw x 
      009723 00 00            [ 2] 4356 	sub sp,#2 
      009725 20               [ 2] 4357 	pushw x 
      009726 05 A6 06         [ 2] 4358 	ldw x,basicptr
      009729 CC 87            [ 1] 4359 	ld a,(2,x)
      00972B A3 52            [ 1] 4360 	add a,#3 
      00972D 07 00 09         [ 1] 4361 	ld acc8,a 
      00972E 72 5F 00 08      [ 1] 4362 	clr acc16 
      00972E 0F 06 CD 88      [ 2] 4363 	addw x,acc16
      009732 81 A1            [ 2] 4364 	ldw (GOS_RET,sp),x 
      00190A                       4365 go_common: 
      009734 00 27 5C         [ 4] 4366 	call relation 
      009737 A1 0A            [ 1] 4367 	cp a,#TK_INTGR
      009739 26 08            [ 1] 4368 	jreq 1$ 
      00973B CD 82 45         [ 2] 4369 	jp syntax_error
      001914                       4370 1$: 
      00973E 03 06 CD         [ 4] 4371 	call search_lineno  
      009741 88               [ 2] 4372 	tnzw x 
      009742 81 A1            [ 1] 4373 	jrne 2$ 
      009744 05 27            [ 1] 4374 	ld a,#ERR_NO_LINE 
      009746 03 CC 87         [ 2] 4375 	jp tb_error 
      00191F                       4376 2$: 
      009749 A1 CD 90         [ 2] 4377 	ldw basicptr,x 
      00974C 13 0D            [ 1] 4378 	ld a,(2,x)
      00974E 06 26 0F         [ 1] 4379 	ld count,a 
      009751 A6 3A C7 17      [ 1] 4380 	mov in,#3 
      009755 19               [ 4] 4381 	ret 
                                   4382 
                                   4383 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4384 ; BASIC: RETURN 
                                   4385 ; exit from a subroutine 
                                   4386 ; cstack is 2 level deep from interp_loop 
                                   4387 ;------------------------
      00192C                       4388 return:
      009756 72 5F 17 1A AE   [ 2] 4389 	btjt flags,#FRUN,0$ 
      00975B 17 18            [ 1] 4390 	ld a,#ERR_RUN_ONLY
      00975D CD 82 45         [ 2] 4391 	jp tb_error 
      009760                       4392 0$:	
      009760 CD 97            [ 2] 4393 	ldw x,(GOS_RET,sp) 
      009762 02 AE 16         [ 2] 4394 	ldw basicptr,x 
      009765 C8 CF            [ 1] 4395 	ld a,(2,x)
      009767 00 05            [ 1] 4396 	add a,#3 
      009769 72 5F 00         [ 1] 4397 	ld count,a 
      00976C 04 CD 8B 08      [ 1] 4398 	mov in,#3
      009770 72               [ 1] 4399 	clr a 
      009771 5F               [ 2] 4400 	popw x 
      001948                       4401 	_drop 2
      009772 00 02            [ 2]    1     addw sp,#2 
      009774 CD               [ 2] 4402 	pushw x
      009775 93               [ 4] 4403 	ret  
                                   4404 
                                   4405 
                                   4406 ;----------------------------------
                                   4407 ; BASIC: RUN
                                   4408 ; run BASIC program in RAM
                                   4409 ;----------------------------------- 
      00194C                       4410 run: 
      009776 88 A1 04 27 03   [ 2] 4411 	btjf flags,#FRUN,0$  
      00977B CC               [ 1] 4412 	clr a 
      00977C 87               [ 4] 4413 	ret
      001953                       4414 0$: 
      00977D A1 CD 90 13 CD   [ 2] 4415 	btjf flags,#FBREAK,1$
      001958                       4416 	_drop 2 
      009782 90 7A            [ 2]    1     addw sp,#2 
      009784 CD 97 12         [ 4] 4417 	call rest_context
      00195D                       4418 	_drop CTXT_SIZE 
      009787 CD 88            [ 2]    1     addw sp,#CTXT_SIZE 
      009789 81 A1 0D 26      [ 1] 4419 	bres flags,#FBREAK 
      00978D 02 20 9E CD      [ 1] 4420 	bset flags,#FRUN 
      009791 90 0D D1         [ 2] 4421 	jp interp_loop 
      009793 CE 00 18         [ 2] 4422 1$:	ldw x,txtbgn
      009793 5B 07 81         [ 2] 4423 	cpw x,txtend 
      009796 2B 02            [ 1] 4424 	jrmi 2$ 
      009796 55               [ 1] 4425 	clr a 
      009797 00               [ 4] 4426 	ret 
      009798 02 00 04         [ 4] 4427 2$: call ubound 
      001977                       4428 	_drop 2 
      00979B 81 02            [ 2]    1     addw sp,#2 
      00979C CE 00 18         [ 2] 4429 	ldw x,txtbgn 
      00979C 52 04 0F         [ 2] 4430 	ldw basicptr,x 
      00979F 01 CD            [ 1] 4431 	ld a,(2,x)
      0097A1 92 40 A1         [ 1] 4432 	ld count,a
      0097A4 02 24 03 CC      [ 1] 4433 	mov in,#3	
      0097A8 87 A1 A1 03      [ 1] 4434 	bset flags,#FRUN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0097AC 25 06 CD         [ 2] 4435 	jp interp_loop 
                                   4436 
                                   4437 
                                   4438 ;----------------------
                                   4439 ; BASIC: STOP 
                                   4440 ; stop running program
                                   4441 ;---------------------- 
      00198F                       4442 stop: 
                                   4443 ; clean dstack and cstack 
      0097AF 90 20 9F         [ 2] 4444 	ldw x,#STACK_EMPTY 
      0097B2 6B               [ 1] 4445 	ldw sp,x 
      0097B3 01 CD 90 20      [ 1] 4446 	bres flags,#FRUN 
      0097B7 9F 6B 02 CD      [ 1] 4447 	bres flags,#FBREAK
      0097BB 90 20 F6         [ 2] 4448 	jp warm_start
                                   4449 
                                   4450 ;-----------------------
                                   4451 ; BASIC BEEP expr1,expr2
                                   4452 ; used MCU internal beeper 
                                   4453 ; to produce a sound
                                   4454 ; arguments:
                                   4455 ;    expr1   frequency  (expr1%32)
                                   4456 ;    expr2   duration msec.
                                   4457 ;---------------------------
      00199E                       4458 beep:
      0097BE 14 02 18         [ 4] 4459 	call arg_list 
      0097C1 01 27            [ 1] 4460 	cp a,#2 
      0097C3 F9 5B            [ 1] 4461 	jreq 1$
      0097C5 04 81 21         [ 2] 4462 	jp syntax_error 
      0097C7                       4463 1$: 
      0097C7 CD 92 40         [ 2] 4464 	ldw x,dstkptr 
      0097CA A1 02            [ 2] 4465 	ldw x,(2,x);frequency 
      0097CC 27 03            [ 1] 4466 	ld a,#31
      0097CE CC               [ 2] 4467 	div x,a 
      0097CF 87 A1 F3         [ 1] 4468 	ld BEEP_CSR,a	
      0097D1 72 1A 50 F3      [ 1] 4469 	bset BEEP_CSR,#5 
      0097D1 CD 90 20         [ 4] 4470 	call dpop 
      0097D4 9F CD 90         [ 4] 4471 	call pause02 
      0097D7 20 FA F7         [ 4] 4472 	call ddrop 
      0097DA 81 1F            [ 1] 4473 	ld a,#0x1f
      0097DB C7 50 F3         [ 1] 4474 	ld BEEP_CSR,a 
      0097DB CD               [ 4] 4475 	ret 
                                   4476 
                                   4477 ;-------------------------------
                                   4478 ; BASIC: PWRADC 0|1 [,divisor]  
                                   4479 ; disable/enanble ADC 
                                   4480 ;-------------------------------
      0019C6                       4481 power_adc:
      0097DC 92 40 A1         [ 4] 4482 	call arg_list 
      0097DF 02 27            [ 1] 4483 	cp a,#2	
      0097E1 03 CC            [ 1] 4484 	jreq 1$
      0097E3 87 A1            [ 1] 4485 	cp a,#1 
      0097E5 27 03            [ 1] 4486 	jreq 0$ 
      0097E5 CD 90 20         [ 2] 4487 	jp syntax_error 
      0097E8 9F 43 CD         [ 2] 4488 0$: ldw x,#0
      0097EB 90 20 F4         [ 4] 4489 	call dpush 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0097EE F7 81 02         [ 2] 4490 1$: ldw x,#2
      0097F0 72 DE 00 16      [ 5] 4491 	ldw x,([dstkptr],x) ; on|off
      0097F0 CD               [ 2] 4492 	tnzw x 
      0097F1 92 40            [ 1] 4493 	jreq 2$ 
      0097F3 A1 02 27 03      [ 5] 4494 	ldw x,[dstkptr] ; divisor 
      0097F7 CC               [ 1] 4495 	ld a,xl
      0097F8 87 A1            [ 1] 4496 	and a,#7
      0097FA CD               [ 1] 4497 	swap a 
      0097FB 90 20 9F         [ 1] 4498 	ld ADC_CR1,a
      0097FE CD 90 20 F8      [ 1] 4499 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      009802 F7 81 54 01      [ 1] 4500 	bset ADC_CR1,#ADC_CR1_ADON 
      009804                       4501 	_usec_dly 7 
      009804 CD 92 64         [ 2]    1     ldw x,#(16*7-2)/4
      009807 A1               [ 2]    2     decw x
      009808 02               [ 1]    3     nop 
      009809 27 03            [ 1]    4     jrne .-4
      00980B CC 87            [ 2] 4502 	jra 3$
      00980D A1 11 54 01      [ 1] 4503 2$: bres ADC_CR1,#ADC_CR1_ADON
      00980E 72 17 50 CA      [ 1] 4504 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00980E CD 90 20         [ 2] 4505 3$:	ldw x,#2
      009811 9F A4 07         [ 4] 4506 	call ddrop_n 
      009814 88               [ 4] 4507 	ret
                                   4508 
                                   4509 ;-----------------------------
                                   4510 ; BASIC: RDADC(channel)
                                   4511 ; read adc channel {0..5}
                                   4512 ; output:
                                   4513 ;   A 		TK_INTGR 
                                   4514 ;   X 		value 
                                   4515 ;-----------------------------
      001A0F                       4516 analog_read:
      009815 A6 01 0D         [ 4] 4517 	call func_args 
      009818 01 27            [ 1] 4518 	cp a,#1 
      00981A 05 48            [ 1] 4519 	jreq 1$
      00981C 0A 01 20         [ 2] 4520 	jp syntax_error
      00981F F7 CD 90         [ 4] 4521 1$: call dpop 
      009822 20 F4 27         [ 2] 4522 	cpw x,#5 
      009825 02 A6            [ 2] 4523 	jrule 2$
      009827 01 5F            [ 1] 4524 	ld a,#ERR_BAD_VALUE
      009829 97 A6 04         [ 2] 4525 	jp tb_error 
      00982C 5B               [ 1] 4526 2$: ld a,xl
      00982D 01 81 09         [ 1] 4527 	ld acc8,a 
      00982F A6 05            [ 1] 4528 	ld a,#5
      00982F CD 92 40         [ 1] 4529 	sub a,acc8 
      009832 A1 02 27         [ 1] 4530 	ld ADC_CSR,a
      009835 03 CC 87 A1      [ 1] 4531 	bset ADC_CR2,#ADC_CR2_ALIGN
      009839 72 10 54 01      [ 1] 4532 	bset ADC_CR1,#ADC_CR1_ADON
      009839 CD 90 20 9F CD   [ 2] 4533 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00983E 90 20 F7         [ 2] 4534 	ldw x,ADC_DRH
      009841 81 04            [ 1] 4535 	ld a,#TK_INTGR
      009842 81               [ 4] 4536 	ret 
                                   4537 
                                   4538 ;-----------------------
                                   4539 ; BASIC: DREAD(pin)
                                   4540 ; read state of a digital pin 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4541 ; pin# {0..15}
                                   4542 ; output:
                                   4543 ;    A 		TK_INTGR
                                   4544 ;    X      0|1 
                                   4545 ;-------------------------
                           000001  4546 	PINNO=1
                           000001  4547 	VSIZE=1
      001A45                       4548 digital_read:
      001A45                       4549 	_vars VSIZE 
      009842 CD 92            [ 2]    1     sub sp,#VSIZE 
      009844 64 A1 01         [ 4] 4550 	call func_args
      009847 27 03            [ 1] 4551 	cp a,#1
      009849 CC 87            [ 1] 4552 	jreq 1$
      00984B A1 CD 90         [ 2] 4553 	jp syntax_error
      00984E 20 F6 5F         [ 4] 4554 1$: call dpop 
      009851 97 A6 04         [ 2] 4555 	cpw x,#15 
      009854 81 05            [ 2] 4556 	jrule 2$
      009855 A6 0A            [ 1] 4557 	ld a,#ERR_BAD_VALUE
      009855 CD 93 88         [ 2] 4558 	jp tb_error 
      009858 A1 04 27         [ 4] 4559 2$:	call select_pin 
      00985B 03 CC            [ 1] 4560 	ld (PINNO,sp),a
      00985D 87 A1            [ 1] 4561 	ld a,(GPIO_IDR,x)
      00985F 4F 5D            [ 1] 4562 	tnz (PINNO,sp)
      009861 26 05            [ 1] 4563 	jreq 8$
      009863 55               [ 1] 4564 3$: srl a 
      009864 00 04            [ 1] 4565 	dec (PINNO,sp)
      009866 00 02            [ 1] 4566 	jrne 3$ 
      009868 81 01            [ 1] 4567 8$: and a,#1 
      009869 5F               [ 1] 4568 	clrw x 
      009869 A6               [ 1] 4569 	ld xl,a 
      00986A 05 CD            [ 1] 4570 	ld a,#TK_INTGR
      001A74                       4571 	_drop VSIZE
      00986C 92 33            [ 2]    1     addw sp,#VSIZE 
      00986E CD               [ 4] 4572 	ret
                                   4573 
                                   4574 ;-----------------------
                                   4575 ; BASIC: DWRITE pin,0|1
                                   4576 ; write to a digital pin 
                                   4577 ; pin# {0..15}
                                   4578 ; output:
                                   4579 ;    A 		TK_INTGR
                                   4580 ;    X      0|1 
                                   4581 ;-------------------------
                           000001  4582 	PINNO=1
                           000002  4583 	PINVAL=2
                           000002  4584 	VSIZE=2
      001A77                       4585 digital_write:
      001A77                       4586 	_vars VSIZE 
      00986F 90 13            [ 2]    1     sub sp,#VSIZE 
      009871 CD 94 2F         [ 4] 4587 	call arg_list  
      009874 72 14            [ 1] 4588 	cp a,#2 
      009876 00 20            [ 1] 4589 	jreq 1$
      009878 85 52 04         [ 2] 4590 	jp syntax_error
      00987B 89 5F 1F         [ 4] 4591 1$: call dpop 
      00987E 05               [ 1] 4592 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      00987F 1F 03            [ 1] 4593 	ld (PINVAL,sp),a
      009881 CD 88 81         [ 4] 4594 	call dpop
      009884 A1 06 27         [ 2] 4595 	cpw x,#15 
      009887 03 CC            [ 2] 4596 	jrule 2$
      009889 87 A1            [ 1] 4597 	ld a,#ERR_BAD_VALUE
      00988B CC 07 23         [ 2] 4598 	jp tb_error 
      00988B A3 98 93         [ 4] 4599 2$:	call select_pin 
      00988E 27 03            [ 1] 4600 	ld (PINNO,sp),a 
      009890 CC 87            [ 1] 4601 	ld a,#1
      009892 A1 01            [ 1] 4602 	tnz (PINNO,sp)
      009893 27 05            [ 1] 4603 	jreq 4$
      009893 72               [ 1] 4604 3$: sll a
      009894 04 00            [ 1] 4605 	dec (PINNO,sp)
      009896 20 03            [ 1] 4606 	jrne 3$
      009898 CC 87            [ 1] 4607 4$: tnz (PINVAL,sp)
      00989A A1 CD            [ 1] 4608 	jrne 5$
      00989C 93               [ 1] 4609 	cpl a 
      00989D 88 A1            [ 1] 4610 	and a,(GPIO_ODR,x)
      00989F 04 27            [ 2] 4611 	jra 8$
      0098A1 03 CC            [ 1] 4612 5$: or a,(GPIO_ODR,x)
      0098A3 87 A1            [ 1] 4613 8$: ld (GPIO_ODR,x),a 
      0098A5                       4614 	_drop VSIZE 
      0098A5 CD 90            [ 2]    1     addw sp,#VSIZE 
      0098A7 13               [ 4] 4615 	ret
                                   4616 
                                   4617 
                                   4618 ;-----------------------
                                   4619 ; BASIC: BREAK 
                                   4620 ; insert a breakpoint 
                                   4621 ; in pogram. 
                                   4622 ; the program is resumed
                                   4623 ; with RUN 
                                   4624 ;-------------------------
      001AB6                       4625 break:
      0098A8 CE 00 01 CD 88   [ 2] 4626 	btjt flags,#FRUN,2$
      0098AD 81               [ 1] 4627 	clr a
      0098AE A1               [ 4] 4628 	ret 
      001ABD                       4629 2$:	 
                                   4630 ; create space on cstack to save context 
      0098AF 00 27 0C         [ 2] 4631 	ldw x,#break_point 
      0098B2 A1 06 26         [ 4] 4632 	call puts 
      001AC3                       4633 	_drop 2 ;drop return address 
      0098B5 05 A3            [ 2]    1     addw sp,#2 
      001AC5                       4634 	_vars CTXT_SIZE ; context size 
      0098B7 98 C3            [ 2]    1     sub sp,#CTXT_SIZE 
      0098B9 27 08 82         [ 4] 4635 	call save_context 
      0098BB AE 16 C8         [ 2] 4636 	ldw x,#tib 
      0098BB CD 90 0D         [ 2] 4637 	ldw basicptr,x
      0098BE 7F               [ 1] 4638 	clr (x)
      0098BE AE 00 01 20      [ 1] 4639 	clr count  
      0098C2 12               [ 1] 4640 	clrw x 
      0098C3 CF 00 00         [ 2] 4641 	ldw in.w,x
      0098C3 72 04 00 20      [ 1] 4642 	bres flags,#FRUN 
      0098C7 03 CC 87 A1      [ 1] 4643 	bset flags,#FBREAK
      0098CB CD 93 88         [ 2] 4644 	jp interp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0098CE A1 04 27 03 CC 87 A1  4645 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4646 
                                   4647 ;-----------------------
                                   4648 ; BASIC: NEW
                                   4649 ; from command line only 
                                   4650 ; free program memory
                                   4651 ; and clear variables 
                                   4652 ;------------------------
      0098D5                       4653 new: 
      0098D5 CD 90 13 CE 00   [ 2] 4654 	btjf flags,#FRUN,0$ 
      0098DA 05               [ 1] 4655 	clr a 
      0098DB 1F               [ 4] 4656 	ret 
      001B09                       4657 0$:	
      0098DC 05 CE 00         [ 4] 4658 	call clear_basic 
      0098DF 01               [ 4] 4659 	ret 
                                   4660 	 
                                   4661 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4662 ;   file system routines
                                   4663 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4664 
                                   4665 ;--------------------
                                   4666 ; input:
                                   4667 ;   X     increment 
                                   4668 ; output:
                                   4669 ;   farptr  incremented 
                                   4670 ;---------------------
      001B0D                       4671 incr_farptr:
      0098E0 1F 03 72 15      [ 2] 4672 	addw x,farptr+1 
      0098E4 00 20            [ 1] 4673 	jrnc 1$
      0098E6 72 5C 00 1D      [ 1] 4674 	inc farptr 
      0098EA 81 00 11         [ 2] 4675 1$:	ldw farptr+1,x  
      0098EB 81               [ 4] 4676 	ret 
                                   4677 
                                   4678 ;------------------------------
                                   4679 ; extended flash memory used as FLASH_DRIVE 
                                   4680 ; seek end of used flash drive   
                                   4681 ; starting at 0x10000 address.
                                   4682 ; 4 consecutives 0 bytes signal free space. 
                                   4683 ; input:
                                   4684 ;	none
                                   4685 ; output:
                                   4686 ;   ffree     free_addr| 0 if memory full.
                                   4687 ;------------------------------
      001B1B                       4688 seek_fdrive:
                                   4689 ; start scan at 0x10000 address 
      0098EB 72 5D            [ 1] 4690 	ld a,#1
      0098ED 00 1D 26         [ 1] 4691 	ld farptr,a 
      0098F0 03               [ 1] 4692 	clrw x 
      0098F1 CC 87 A1         [ 2] 4693 	ldw farptr+1,x 
      0098F4                       4694 1$:
      0098F4 A6 05 CD         [ 2] 4695 	ldw x,#3  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      0098F7 92 33 90 93      [ 5] 4696 2$:	ldf a,([farptr],x) 
      0098FB AE 00            [ 1] 4697 	jrne 3$
      0098FD 04               [ 2] 4698 	decw x
      0098FE 72 D3            [ 1] 4699 	jrpl 2$
      009900 00 17            [ 2] 4700 	jra 4$ 
      009902 27               [ 1] 4701 3$:	incw x 
      009903 03 CC 87         [ 4] 4702 	call incr_farptr
      009906 A1 02 7F         [ 2] 4703 	ldw x,#0x27f 
      009907 C3 00 10         [ 2] 4704 	cpw x,farptr
      009907 93 FE            [ 1] 4705 	jrpl 1$
                                   4706 ; drive full 
      009909 CF 00 09 72      [ 1] 4707 	clr ffree 
      00990D CE 00 17 72      [ 1] 4708 	clr ffree+1 
      009911 BB 00 09 90      [ 1] 4709 	clr ffree+2 
      009915 FF               [ 4] 4710 	ret
      001B4B                       4711 4$: ; copy farptr to ffree	 
      009916 90 93 72         [ 2] 4712 	ldw x,farptr 
      009919 CE 00 17         [ 1] 4713 	ld a,farptr+2 
      00991C 5D 2A 0B         [ 2] 4714 	ldw ffree,x 
      00991F AE 00 02         [ 1] 4715 	ld ffree+2,a  
      009922 72               [ 4] 4716 	ret 
                                   4717 
                                   4718 ;-----------------------
                                   4719 ; compare file name 
                                   4720 ; with name pointed by Y  
                                   4721 ; input:
                                   4722 ;   farptr   file name 
                                   4723 ;   Y        target name 
                                   4724 ; output:
                                   4725 ;   farptr 	 at file_name
                                   4726 ;   X 		 farptr[x] point at size field  
                                   4727 ;   Carry    0|1 no match|match  
                                   4728 ;----------------------
      001B58                       4729 cmp_name:
      009923 D3               [ 1] 4730 	clrw x
      009924 00 17 2F 20      [ 5] 4731 1$:	ldf a,([farptr],x)
      009928 20 09            [ 1] 4732 	cp a,(y)
      00992A 26 08            [ 1] 4733 	jrne 4$
      00992A AE               [ 1] 4734 	tnz a 
      00992B 00 02            [ 1] 4735 	jreq 9$ 
      00992D 72               [ 1] 4736     incw x 
      00992E D3 00            [ 1] 4737 	incw y 
      009930 17 2C            [ 2] 4738 	jra 1$
      001B69                       4739 4$: ;no match 
      009932 15               [ 1] 4740 	tnz a 
      009933 27 07            [ 1] 4741 	jreq 5$
      009933 1E               [ 1] 4742 	incw x 
      009934 05 CF 00 05      [ 5] 4743 	ldf a,([farptr],x)
      009938 72 01            [ 2] 4744 	jra 4$  
      00993A 00               [ 1] 4745 5$:	incw x ; farptr[x] point at 'size' field 
      00993B 20               [ 1] 4746 	rcf 
      00993C 05               [ 4] 4747 	ret
      001B76                       4748 9$: ; match  
      00993D E6               [ 1] 4749 	incw x  ; farptr[x] at 'size' field 
      00993E 02               [ 1] 4750 	scf 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      00993F C7               [ 4] 4751 	ret 
                                   4752 
                                   4753 ;-----------------------
                                   4754 ; search file in 
                                   4755 ; flash memory 
                                   4756 ; input:
                                   4757 ;   Y       file name  
                                   4758 ; output:
                                   4759 ;   farptr  addr at name|0
                                   4760 ;-----------------------
                           000001  4761 	FSIZE=1
                           000003  4762 	YSAVE=3
                           000004  4763 	VSIZE=4 
      001B79                       4764 search_file: 
      001B79                       4765 	_vars VSIZE
      009940 00 04            [ 2]    1     sub sp,#VSIZE 
      009942 1E 03            [ 2] 4766 	ldw (YSAVE,sp),y  
      009944 CF               [ 1] 4767 	clrw x 
      009945 00 01 81         [ 2] 4768 	ldw farptr+1,x 
      009948 35 01 00 10      [ 1] 4769 	mov farptr,#1
      001B85                       4770 1$:	
                                   4771 ; check if farptr is after any file 
                                   4772 ; if  0 then so.
      009948 CE 00 17 1C      [ 5] 4773 	ldf a,[farptr]
      00994C 00 06            [ 1] 4774 	jreq 6$
      00994E CF               [ 1] 4775 2$: clrw x 	
      00994F 00 17            [ 2] 4776 	ldw y,(YSAVE,sp) 
      009951 85 5B 04         [ 4] 4777 	call cmp_name
      009954 89 72            [ 1] 4778 	jrc 9$
      009956 5A 00 1D 81      [ 5] 4779 	ldf a,([farptr],x)
      00995A 6B 01            [ 1] 4780 	ld (FSIZE,sp),a 
      00995A 72               [ 1] 4781 	incw x 
      00995B 00 00 20 06      [ 5] 4782 	ldf a,([farptr],x)
      00995F A6 06            [ 1] 4783 	ld (FSIZE+1,sp),a 
      009961 CC               [ 1] 4784 	incw x 
      009962 87 A3 81         [ 2] 4785 	addw x,(FSIZE,sp) ; count to skip 
      009965 20               [ 1] 4786 	incw x ; skip over EOF marker 
      009966 23 1B 0D         [ 4] 4787 	call incr_farptr ; now at next file 'name_field'
      009967 AE 02 80         [ 2] 4788 	ldw x,#0x280
      009967 72 00 00         [ 2] 4789 	cpw x,farptr 
      00996A 20 06            [ 1] 4790 	jrpl 1$
      001BB0                       4791 6$: ; file not found 
      00996C A6 06 CC 87      [ 1] 4792 	clr farptr
      009970 A3 81 85 52      [ 1] 4793 	clr farptr+1 
      009974 02 89 CE 00      [ 1] 4794 	clr farptr+2 
      001BBC                       4795 	_drop VSIZE 
      009978 05 E6            [ 2]    1     addw sp,#VSIZE 
      00997A 02               [ 1] 4796 	rcf
      00997B AB               [ 4] 4797 	ret
      001BC0                       4798 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001BC0                       4799 	_drop VSIZE 
      00997C 03 C7            [ 2]    1     addw sp,#VSIZE 
      00997E 00               [ 1] 4800 	scf 	
      00997F 0A               [ 4] 4801 	ret
                                   4802 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4803 ;--------------------------------
                                   4804 ; BASIC: SAVE "name" 
                                   4805 ; save text program in 
                                   4806 ; flash memory used as 
                                   4807 ;--------------------------------
                           000001  4808 	BSIZE=1
                           000003  4809 	NAMEPTR=3
                           000004  4810 	VSIZE=4
      001BC4                       4811 save:
      009980 72 5F 00 09 72   [ 2] 4812 	btjf flags,#FRUN,0$ 
      009985 BB 00            [ 1] 4813 	ld a,#ERR_CMD_ONLY 
      009987 09 1F 03         [ 2] 4814 	jp tb_error
      00998A                       4815 0$:	 
      00998A CD 93 88         [ 2] 4816 	ldw x,txtend 
      00998D A1 04 27 03      [ 2] 4817 	subw x,txtbgn
      009991 CC 87            [ 1] 4818 	jrne 1$
                                   4819 ; nothing to save 
      009993 A1               [ 4] 4820 	ret 
      009994                       4821 1$:	
      001BD8                       4822 	_vars VSIZE 
      009994 CD 83            [ 2]    1     sub sp,#VSIZE 
      009996 75 5D            [ 2] 4823 	ldw (BSIZE,sp),x 
      009998 26 05 A6         [ 4] 4824 	call next_token	
      00999B 05 CC            [ 1] 4825 	cp a,#TK_QSTR
      00999D 87 A3            [ 1] 4826 	jreq 2$
      00999F CC 07 21         [ 2] 4827 	jp syntax_error
      001BE6                       4828 2$: 
      00999F CF 00 05 E6      [ 2] 4829 	ldw y,basicptr 
      0099A3 02 C7 00 04      [ 2] 4830 	addw y,in.w
      0099A7 35 03            [ 2] 4831 	ldw (NAMEPTR,sp),y  
      0099A9 00 02 81 00 01   [ 1] 4832 	mov in,count 
                                   4833 ; check if enough free space 
      0099AC 93               [ 1] 4834 	ldw x,y 
      0099AC 72 00 00         [ 4] 4835 	call strlen 
      0099AF 20 05 A6         [ 2] 4836 	addw x,#3 
      0099B2 06 CC 87         [ 2] 4837 	addw x,(BSIZE,sp)
      0099B5 A3 5D 00 13      [ 1] 4838 	tnz ffree 
      0099B6 26 0B            [ 1] 4839 	jrne 21$
      0099B6 1E 03 CF 00      [ 2] 4840 	subw x,ffree+1 
      0099BA 05 E6            [ 2] 4841 	jrule 21$
      0099BC 02 AB            [ 1] 4842 	ld a,#ERR_MEM_FULL 
      0099BE 03 C7 00         [ 2] 4843 	jp tb_error
      001C10                       4844 21$: 
                                   4845 ; check for existing file of that name 
      0099C1 04 35            [ 2] 4846 	ldw y,(NAMEPTR,sp)	
      0099C3 03 00 02         [ 4] 4847 	call search_file 
      0099C6 4F 85            [ 1] 4848 	jrnc 3$ 
      0099C8 5B 02            [ 1] 4849 	ld a,#ERR_DUPLICATE 
      0099CA 89 81 23         [ 2] 4850 	jp tb_error 
      0099CC                       4851 3$:	;** write file name to flash **
      0099CC 72 01 00         [ 2] 4852 	ldw x,ffree 
      0099CF 20 02 4F         [ 1] 4853 	ld a,ffree+2 
      0099D2 81 00 10         [ 2] 4854 	ldw farptr,x 
      0099D3 C7 00 12         [ 1] 4855 	ld farptr+2,a 
      0099D3 72 09            [ 2] 4856 	ldw x,(NAMEPTR,sp)  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      0099D5 00 20 12         [ 4] 4857 	call strlen 
      0099D8 5B               [ 1] 4858 	incw  x
      0099D9 02 CD            [ 2] 4859 	ldw (BSIZE,sp),x  
      0099DB 97               [ 1] 4860 	clrw x   
      0099DC 12 5B            [ 2] 4861 	ldw y,(NAMEPTR,sp)
      0099DE 06 72 19         [ 4] 4862 	call write_block  
                                   4863 ;** write file length after name **
      0099E1 00 20 72         [ 2] 4864 	ldw x,txtend 
      0099E4 10 00 20 CC      [ 2] 4865 	subw x,txtbgn
      0099E8 88 51            [ 2] 4866 	ldw (BSIZE,sp),x 
      0099EA CE               [ 1] 4867 	clrw x 
      0099EB 00 19            [ 1] 4868 	ld a,(1,sp)
      0099ED C3 00 1B         [ 4] 4869 	call write_byte 
      0099F0 2B               [ 1] 4870 	incw x 
      0099F1 02 4F            [ 1] 4871 	ld a,(2,sp)
      0099F3 81 CD 94         [ 4] 4872 	call write_byte
      0099F6 03               [ 1] 4873 	incw x  
      0099F7 5B 02 CE         [ 4] 4874 	call incr_farptr ; move farptr after SIZE field 
                                   4875 ;** write BASIC text **
                                   4876 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      0099FA 00 19            [ 2] 4877 	ldw x,(BSIZE,sp)
      0099FC CF               [ 2] 4878 	pushw x ; write_block argument 
      0099FD 00               [ 1] 4879 	clrw x 
      0099FE 05 E6 02 C7      [ 2] 4880 	ldw y,txtbgn  ; BASIC text to save 
      009A02 00 04 35         [ 4] 4881 	call write_block 
      001C5A                       4882 	_drop 2 ;  drop write_block argument  
      009A05 03 00            [ 2]    1     addw sp,#2 
                                   4883 ; write en end of file marker 
      009A07 02 72 10         [ 2] 4884 	ldw x,#1
      009A0A 00 20            [ 1] 4885 	ld a,#EOF  
      009A0C CC 88 51         [ 4] 4886 	call write_byte 
      009A0F CD 1B 0D         [ 4] 4887 	call incr_farptr
                                   4888 ; save farptr in ffree
      009A0F AE 17 FF         [ 2] 4889 	ldw x,farptr 
      009A12 94 72 11         [ 1] 4890 	ld a,farptr+2 
      009A15 00 20 72         [ 2] 4891 	ldw ffree,x 
      009A18 19 00 20         [ 1] 4892 	ld ffree+2,a
                                   4893 ;write 4 zero bytes as an end of all files marker 
      009A1B CC               [ 1] 4894     clrw x 
      009A1C 87 F5            [ 1] 4895 	push #4 
      009A1E                       4896 4$:
      009A1E CD               [ 1] 4897 	clr a 
      009A1F 92 40 A1         [ 4] 4898 	call write_byte 
      009A22 02               [ 1] 4899 	incw x 
      009A23 27 03            [ 1] 4900 	dec (1,sp)
      009A25 CC 87            [ 1] 4901 	jrne 4$
      009A27 A1               [ 1] 4902 5$: pop a 
                                   4903 ; display saved size  
      009A28 1E 01            [ 2] 4904 	ldw x,(BSIZE,sp) 
      009A28 CE 00 17         [ 4] 4905 	call print_int 
      001C85                       4906 	_drop VSIZE 
      009A2B EE 02            [ 2]    1     addw sp,#VSIZE 
      009A2D A6               [ 4] 4907 	ret 
                                   4908 
                                   4909 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4910 ;------------------------
                                   4911 ; BASIC: LOAD "file" 
                                   4912 ; load file to RAM 
                                   4913 ; for execution 
                                   4914 ;------------------------
      001C88                       4915 load:
      009A2E 1F 62 C7 50 F3   [ 2] 4916 	btjf flags,#FRUN,0$ 
      009A33 72 1A            [ 1] 4917 	jreq 0$ 
      009A35 50 F3            [ 1] 4918 	ld a,#ERR_CMD_ONLY 
      009A37 CD 90 20         [ 2] 4919 	jp tb_error 
      001C94                       4920 0$:	
      009A3A CD 9F 3E         [ 4] 4921 	call next_token 
      009A3D CD 90            [ 1] 4922 	cp a,#TK_QSTR
      009A3F 47 A6            [ 1] 4923 	jreq 1$
      009A41 1F C7 50         [ 2] 4924 	jp syntax_error 
      001C9E                       4925 1$:	
      009A44 F3 81 00 04      [ 2] 4926 	ldw y,basicptr
      009A46 72 B9 00 00      [ 2] 4927 	addw y,in.w 
      009A46 CD 92 40 A1 02   [ 1] 4928 	mov in,count 
      009A4B 27 0D A1         [ 4] 4929 	call search_file 
      009A4E 01 27            [ 1] 4930 	jrc 2$ 
      009A50 03 CC            [ 1] 4931 	ld a,#ERR_NOT_FILE
      009A52 87 A1 AE         [ 2] 4932 	jp tb_error  
      001CB5                       4933 2$:	
      009A55 00 00 CD         [ 4] 4934 	call incr_farptr  
      009A58 90 13 AE         [ 4] 4935 	call clear_basic  
      009A5B 00               [ 1] 4936 	clrw x
      009A5C 02 72 DE 00      [ 5] 4937 	ldf a,([farptr],x)
      009A60 17 5D            [ 1] 4938 	ld yh,a 
      009A62 27               [ 1] 4939 	incw x  
      009A63 1C 72 CE 00      [ 5] 4940 	ldf a,([farptr],x)
      009A67 17               [ 1] 4941 	incw x 
      009A68 9F A4            [ 1] 4942 	ld yl,a 
      009A6A 07 4E C7 54      [ 2] 4943 	addw y,txtbgn
      009A6E 01 72 16 50      [ 2] 4944 	ldw txtend,y
      009A72 CA 72 10 54      [ 2] 4945 	ldw y,txtbgn
      001CD6                       4946 3$:	; load BASIC text 	
      009A76 01 AE 00 1B      [ 5] 4947 	ldf a,([farptr],x)
      009A7A 5A 9D            [ 1] 4948 	ld (y),a 
      009A7C 26               [ 1] 4949 	incw x 
      009A7D FA 20            [ 1] 4950 	incw y 
      009A7F 08 72 11 54      [ 2] 4951 	cpw y,txtend 
      009A83 01 72            [ 1] 4952 	jrmi 3$
                                   4953 ; print loaded size 	 
      009A85 17 50 CA         [ 2] 4954 	ldw x,txtend 
      009A88 AE 00 02 CD      [ 2] 4955 	subw x,txtbgn
      009A8C 90 84 81         [ 4] 4956 	call print_int 
      009A8F 81               [ 4] 4957 	ret 
                                   4958 
                                   4959 ;-----------------------------------
                                   4960 ; BASIC: FORGET ["file_name"] 
                                   4961 ; erase file_name and all others 
                                   4962 ; after it. 
                                   4963 ; without argument erase all files 
                                   4964 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      001CF0                       4965 forget:
      009A8F CD 92 64         [ 4] 4966 	call next_token 
      009A92 A1 01            [ 1] 4967 	cp a,#TK_NONE 
      009A94 27 03            [ 1] 4968 	jreq 3$ 
      009A96 CC 87            [ 1] 4969 	cp a,#TK_QSTR
      009A98 A1 CD            [ 1] 4970 	jreq 1$
      009A9A 90 20 A3         [ 2] 4971 	jp syntax_error
      009A9D 00 05 23 05      [ 2] 4972 1$: ldw y,basicptr
      009AA1 A6 0A CC 87      [ 2] 4973 	addw y,in.w
      009AA5 A3 9F C7 00 0A   [ 1] 4974 	mov in,count 
      009AAA A6 05 C0         [ 4] 4975 	call search_file
      009AAD 00 0A            [ 1] 4976 	jrc 2$
      009AAF C7 54            [ 1] 4977 	ld a,#ERR_NOT_FILE 
      009AB1 00 72 16         [ 2] 4978 	jp tb_error 
      001D15                       4979 2$: 
      009AB4 54 02 72         [ 2] 4980 	ldw x,farptr
      009AB7 10 54 01         [ 1] 4981 	ld a,farptr+2
      009ABA 72 0F            [ 2] 4982 	jra 4$ 
      001D1D                       4983 3$: ; forget all files 
      009ABC 54 00 FB         [ 2] 4984 	ldw x,#0x100
      009ABF CE               [ 1] 4985 	clr a 
      009AC0 54 04 A6         [ 2] 4986 	ldw farptr,x 
      009AC3 04 81 12         [ 1] 4987 	ld farptr+2,a 
      009AC5                       4988 4$:
      009AC5 52 01 CD         [ 2] 4989 	ldw ffree,x 
      009AC8 92 64 A1         [ 1] 4990 	ld ffree+2,a 
      009ACB 01 27            [ 1] 4991 	push #4
      009ACD 03               [ 1] 4992 	clrw x 
      001D30                       4993 5$: 
      009ACE CC               [ 1] 4994 	clr a  
      009ACF 87 A1 CD         [ 4] 4995 	call write_byte 
      009AD2 90               [ 1] 4996 	incw x 
      009AD3 20 A3            [ 1] 4997 	dec (1,sp)
      009AD5 00 0F            [ 1] 4998 	jrne 5$	
      009AD7 23               [ 1] 4999 6$: pop a 
      009AD8 05               [ 4] 5000 	ret 
                                   5001 
                                   5002 ;----------------------
                                   5003 ; BASIC: DIR 
                                   5004 ; list saved files 
                                   5005 ;----------------------
                           000001  5006 	COUNT=1 ; files counter 
                           000002  5007 	VSIZE=2 
      001D3B                       5008 directory:
      001D3B                       5009 	_vars VSIZE 
      009AD9 A6 0A            [ 2]    1     sub sp,#VSIZE 
      009ADB CC               [ 1] 5010 	clrw x 
      009ADC 87 A3            [ 2] 5011 	ldw (COUNT,sp),x 
      009ADE CD A0 48         [ 2] 5012 	ldw farptr+1,x 
      009AE1 6B 01 E6 01      [ 1] 5013 	mov farptr,#1 
      001D47                       5014 dir_loop:
      009AE5 0D               [ 1] 5015 	clrw x 
      009AE6 01 27 05 44      [ 5] 5016 	ldf a,([farptr],x)
      009AEA 0A 01            [ 1] 5017 	jreq 8$ 
      001D4E                       5018 1$: ;name loop 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009AEC 26 FB A4 01      [ 5] 5019 	ldf a,([farptr],x)
      009AF0 5F 97            [ 1] 5020 	jreq 2$ 
      009AF2 A6 04 5B         [ 4] 5021 	call putc 
      009AF5 01               [ 1] 5022 	incw x 
      009AF6 81 F4            [ 2] 5023 	jra 1$
      009AF7 5C               [ 1] 5024 2$: incw x ; skip ending 0. 
      009AF7 52 02            [ 1] 5025 	ld a,#SPACE 
      009AF9 CD 92 40         [ 4] 5026 	call putc 
                                   5027 ; get file size 	
      009AFC A1 02 27 03      [ 5] 5028 	ldf a,([farptr],x)
      009B00 CC 87            [ 1] 5029 	ld yh,a 
      009B02 A1               [ 1] 5030 	incw x 
      009B03 CD 90 20 9F      [ 5] 5031 	ldf a,([farptr],x)
      009B07 6B               [ 1] 5032 	incw x 
      009B08 02 CD            [ 1] 5033 	ld yl,a 
      009B0A 90 20            [ 2] 5034 	pushw y 
      009B0C A3 00 0F         [ 2] 5035 	addw x,(1,sp)
      009B0F 23               [ 1] 5036 	incw x ; skip EOF marker 
                                   5037 ; skip to next file 
      009B10 05 A6 0A         [ 4] 5038 	call incr_farptr 
                                   5039 ; print file size 
      009B13 CC               [ 2] 5040 	popw x ; file size 
      009B14 87 A3 CD         [ 4] 5041 	call print_int 
      009B17 A0 48            [ 1] 5042 	ld a,#CR 
      009B19 6B 01 A6         [ 4] 5043 	call putc
      009B1C 01 0D            [ 2] 5044 	ldw x,(COUNT,sp)
      009B1E 01               [ 1] 5045 	incw x
      009B1F 27 05            [ 2] 5046 	ldw (COUNT,sp),x  
      009B21 48 0A            [ 2] 5047 	jra dir_loop 
      001D87                       5048 8$: ; print number of files 
      009B23 01 26            [ 2] 5049 	ldw x,(COUNT,sp)
      009B25 FB 0D 02         [ 4] 5050 	call print_int 
      009B28 26 05 43         [ 2] 5051 	ldw x,#file_count 
      009B2B E4 00 20         [ 4] 5052 	call puts  
                                   5053 ; print drive free space 	
      009B2E 02 EA            [ 1] 5054 	ld a,#0xff 
      009B30 00 E7 00         [ 1] 5055 	sub a,ffree+2 
      009B33 5B 02 81         [ 1] 5056 	ld acc8,a 
      009B36 A6 7F            [ 1] 5057 	ld a,#0x7f 
      009B36 72 00 00         [ 1] 5058 	sbc a,ffree+1 
      009B39 20 02 4F         [ 1] 5059 	ld acc16,a 
      009B3C 81 02            [ 1] 5060 	ld a,#2 
      009B3D C2 00 13         [ 1] 5061 	sbc a,ffree 
      009B3D AE 9B 64         [ 1] 5062 	ld acc24,a 
      009B40 CD               [ 1] 5063 	clrw x  
      009B41 82 45            [ 1] 5064 	ld a,#6 
      009B43 5B               [ 1] 5065 	ld xl,a 
      009B44 02 52            [ 1] 5066 	ld a,#10 
      009B46 06 CD 97         [ 4] 5067 	call prti24 
      009B49 02 AE 16         [ 2] 5068 	ldw x,#drive_free
      009B4C C8 CF 00         [ 4] 5069 	call puts 
      001DB9                       5070 	_drop VSIZE 
      009B4F 05 7F            [ 2]    1     addw sp,#VSIZE 
      009B51 72               [ 4] 5071 	ret
      009B52 5F 00 04 5F CF 00 01  5072 file_count: .asciz " files\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal  72-Bits]



             00
      009B5A 11 00 20 72 18 00 20  5073 drive_free: .asciz " bytes free\n" 
             CC 88 51 0A 62 72
                                   5074 
                                   5075 ;---------------------
                                   5076 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5077 ; write 1 or more byte to FLASH or EEPROM
                                   5078 ; starting at address  
                                   5079 ; input:
                                   5080 ;   expr1  	is address 
                                   5081 ;   expr2   is byte to write
                                   5082 ; output:
                                   5083 ;   none 
                                   5084 ;---------------------
                           000001  5085 	ADDR=1
                           000002  5086 	VSIZ=2 
      001DD1                       5087 write:
      001DD1                       5088 	_vars VSIZE 
      009B67 65 61            [ 2]    1     sub sp,#VSIZE 
      009B69 6B 20 70 6F      [ 1] 5089 	clr farptr ; expect 16 bits address 
      009B6D 69 6E 74         [ 4] 5090 	call expression
      009B70 2C 20            [ 1] 5091 	cp a,#TK_INTGR 
      009B72 52 55            [ 1] 5092 	jreq 0$
      009B74 4E 20 74         [ 2] 5093 	jp syntax_error
      009B77 6F 20            [ 2] 5094 0$: ldw (ADDR,sp),x 
      009B79 72 65 73         [ 4] 5095 	call next_token 
      009B7C 75 6D            [ 1] 5096 	cp a,#TK_COMMA 
      009B7E 65 2E            [ 1] 5097 	jreq 1$ 
      009B80 0A 00            [ 2] 5098 	jra 9$ 
      009B82 CD 12 C4         [ 4] 5099 1$:	call expression
      009B82 72 01            [ 1] 5100 	cp a,#TK_INTGR
      009B84 00 20            [ 1] 5101 	jreq 2$
      009B86 02 4F 81         [ 2] 5102 	jp syntax_error
      009B89 9F               [ 1] 5103 2$:	ld a,xl 
      009B89 CD 86            [ 2] 5104 	ldw x,(ADDR,sp) 
      009B8B 73 81 11         [ 2] 5105 	ldw farptr+1,x 
      009B8D 5F               [ 1] 5106 	clrw x 
      009B8D 72 BB 00         [ 4] 5107 	call write_byte
      009B90 12 24            [ 2] 5108 	ldw x,(ADDR,sp)
      009B92 04               [ 1] 5109 	incw x 
      009B93 72 5C            [ 2] 5110 	jra 0$ 
      001E05                       5111 9$:
      001E05                       5112 	_drop VSIZE
      009B95 00 11            [ 2]    1     addw sp,#VSIZE 
      009B97 CF               [ 4] 5113 	ret 
                                   5114 
                                   5115 
                                   5116 ;---------------------
                                   5117 ;BASIC: CHAR(expr)
                                   5118 ; évaluate expression 
                                   5119 ; and take the 7 least 
                                   5120 ; bits as ASCII character
                                   5121 ;---------------------
      001E08                       5122 char:
      009B98 00 12 81         [ 4] 5123 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009B9B A1 01            [ 1] 5124 	cp a,#1
      009B9B A6 01            [ 1] 5125 	jreq 1$
      009B9D C7 00 11         [ 2] 5126 	jp syntax_error
      009BA0 5F CF 00         [ 4] 5127 1$:	call dpop 
      009BA3 12               [ 1] 5128 	ld a,xl 
      009BA4 A4 7F            [ 1] 5129 	and a,#0x7f 
      009BA4 AE               [ 1] 5130 	ld xl,a
      009BA5 00 03            [ 1] 5131 	ld a,#TK_CHAR
      009BA7 92               [ 4] 5132 	ret
                                   5133 
                                   5134 ;---------------------
                                   5135 ; BASIC: ASC(string|char)
                                   5136 ; extract first character 
                                   5137 ; of string argument 
                                   5138 ; return it as TK_INTGR 
                                   5139 ;---------------------
      001E1C                       5140 ascii:
      009BA8 AF 00 11         [ 4] 5141 	call func_args 
      009BAB 26 05 5A         [ 4] 5142 	call next_token 
      009BAE 2A F7            [ 1] 5143 	cp a,#TK_QSTR 
      009BB0 20 19            [ 1] 5144 	jreq 1$
      009BB2 5C CD            [ 1] 5145 	cp a,#TK_CHAR 
      009BB4 9B 8D            [ 1] 5146 	jreq 2$ 
      009BB6 AE 02 7F         [ 2] 5147 	jp syntax_error
      001E2D                       5148 1$: 
      009BB9 C3               [ 1] 5149 	ld a,(x)
      009BBA 00 11            [ 2] 5150 	jra 3$
      001E30                       5151 2$: 
      009BBC 2A               [ 1] 5152 	ld a,xl 
      009BBD E6               [ 1] 5153 3$:	ld xl,a 
      009BBE 72               [ 1] 5154 	clr a  
      009BBF 5F               [ 1] 5155 	ld xh,a 
      009BC0 00 14            [ 1] 5156 	ld a,#TK_INTGR 
      009BC2 72               [ 4] 5157 	ret 
                                   5158 
                                   5159 ;---------------------
                                   5160 ;BASIC: KEY
                                   5161 ; wait for a character 
                                   5162 ; received from STDIN 
                                   5163 ; input:
                                   5164 ;	none 
                                   5165 ; output:
                                   5166 ;	X 		ASCII character 
                                   5167 ;---------------------
      001E37                       5168 key:
      009BC3 5F 00 15         [ 4] 5169 	call getc 
      009BC6 72               [ 1] 5170 	clrw x 
      009BC7 5F               [ 1] 5171 	ld xl,a 
      009BC8 00 16            [ 1] 5172 	ld a,#TK_INTGR
      009BCA 81               [ 4] 5173 	ret
                                   5174 
                                   5175 ;----------------------
                                   5176 ; BASIC: QKEY
                                   5177 ; Return true if there 
                                   5178 ; is a character in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5179 ; waiting in STDIN 
                                   5180 ; input:
                                   5181 ;  none 
                                   5182 ; output:
                                   5183 ;   X 		0|1 
                                   5184 ;-----------------------
      009BCB                       5185 qkey: 
      009BCB CE               [ 1] 5186 	clrw x 
      009BCC 00 11 C6 00 13   [ 2] 5187 	btjf UART1_SR,#UART_SR_RXNE,9$ 
      009BD1 CF               [ 1] 5188 	incw x 
      009BD2 00 14            [ 1] 5189 9$: ld a,#TK_INTGR
      009BD4 C7               [ 4] 5190 	ret 
                                   5191 
                                   5192 ;---------------------
                                   5193 ; BASIC: GPIO(expr,reg)
                                   5194 ; return gpio address 
                                   5195 ; expr {0..8}
                                   5196 ; input:
                                   5197 ;   none 
                                   5198 ; output:
                                   5199 ;   X 		gpio register address
                                   5200 ;----------------------------
      001E49                       5201 gpio:
      009BD5 00 16 81         [ 4] 5202 	call func_args 
      009BD8 A1 02            [ 1] 5203 	cp a,#2
      009BD8 5F 92            [ 1] 5204 	jreq 1$
      009BDA AF 00 11         [ 2] 5205 	jp syntax_error  
      001E53                       5206 1$:	
      009BDD 90 F1 26         [ 2] 5207 	ldw x,#2
      009BE0 08 4D 27 12      [ 5] 5208 	ldw x,([dstkptr],x) ; port 
      009BE4 5C 90            [ 1] 5209 	jrmi bad_port
      009BE6 5C 20 F0         [ 2] 5210 	cpw x,#9
      009BE9 2A 16            [ 1] 5211 	jrpl bad_port
      009BE9 4D 27            [ 1] 5212 	ld a,#5
      009BEB 07               [ 4] 5213 	mul x,a
      009BEC 5C 92 AF         [ 2] 5214 	addw x,#GPIO_BASE 
      009BEF 00               [ 2] 5215 	pushw x 
      009BF0 11 20 F6         [ 4] 5216 	call dpop 
      009BF3 5C 98 81         [ 2] 5217 	addw x,(1,sp)
      009BF6 1F 01            [ 2] 5218 	ldw (1,sp),x  
      009BF6 5C 99 81         [ 4] 5219 	call ddrop  
      009BF9 85               [ 2] 5220 	popw x 
      009BF9 52 04            [ 1] 5221 	ld a,#TK_INTGR
      009BFB 17               [ 4] 5222 	ret
      001E77                       5223 bad_port:
      009BFC 03 5F            [ 1] 5224 	ld a,#ERR_BAD_VALUE
      009BFE CF 00 12         [ 2] 5225 	jp tb_error
                                   5226 
                                   5227 
                                   5228 ;-------------------------
                                   5229 ; BASIC: UFLASH 
                                   5230 ; return user flash address
                                   5231 ; input:
                                   5232 ;  none 
                                   5233 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5234 ;	A		TK_INTGR
                                   5235 ;   X 		user address 
                                   5236 ;---------------------------
      001E7C                       5237 uflash:
      009C01 35 01 00         [ 2] 5238 	ldw x,#user_space 
      009C04 11 04            [ 1] 5239 	ld a,#TK_INTGR 
      009C05 81               [ 4] 5240 	ret 
                                   5241 
                                   5242 
                                   5243 ;---------------------
                                   5244 ; BASIC: USR(addr[,arg])
                                   5245 ; execute a function written 
                                   5246 ; in binary code.
                                   5247 ; binary fonction should 
                                   5248 ; return token attribute in A 
                                   5249 ; and value in X. 
                                   5250 ; input:
                                   5251 ;   addr	routine address 
                                   5252 ;   arg 	is an optional argument 
                                   5253 ; output:
                                   5254 ;   A 		token attribute 
                                   5255 ;   X       returned value 
                                   5256 ;---------------------
      001E82                       5257 usr:
      009C05 92 BC            [ 2] 5258 	pushw y 	
      009C07 00 11 27         [ 4] 5259 	call func_args 
      009C0A 25 5F            [ 1] 5260 	cp a,#1 
      009C0C 16 03            [ 1] 5261 	jrpl 2$ 
      009C0E CD 9B D8         [ 2] 5262 	jp syntax_error 
      001E8E                       5263 2$: 
      009C11 25 2D 92         [ 4] 5264 	call dpop 
      009C14 AF 00            [ 1] 5265 	cp a,#2 
      009C16 11 6B            [ 1] 5266 	jrmi 4$
      009C18 01 5C            [ 1] 5267 	ldw y,x ; y=arg 
      009C1A 92 AF 00         [ 4] 5268 	call dpop ;x=addr 
      009C1D 11               [ 1] 5269 4$:	exgw y,x ; y=addr,x=arg 
      009C1E 6B 02            [ 4] 5270 	call (y)
      009C20 5C 72            [ 2] 5271 	popw y 
      009C22 FB               [ 4] 5272 	ret 
                                   5273 
                                   5274 ;------------------------------
                                   5275 ; BASIC: BYE 
                                   5276 ; halt mcu in its lowest power mode 
                                   5277 ; wait for reset or external interrupt
                                   5278 ; do a cold start on wakeup.
                                   5279 ;------------------------------
      001EA0                       5280 bye:
      009C23 01 5C CD 9B 8D   [ 2] 5281 	btjf UART1_SR,#UART_SR_TC,.
      009C28 AE               [10] 5282 	halt
      009C29 02 80 C3         [ 2] 5283 	jp cold_start  
                                   5284 
                                   5285 ;----------------------------------
                                   5286 ; BASIC: SLEEP 
                                   5287 ; halt mcu until reset or external
                                   5288 ; interrupt.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   5289 ; Resume progam after SLEEP command
                                   5290 ;----------------------------------
      001EA9                       5291 sleep:
      009C2C 00 11 2A D5 FB   [ 2] 5292 	btjf UART1_SR,#UART_SR_TC,.
      009C30 72 16 00 1F      [ 1] 5293 	bset flags,#FSLEEP
      009C30 72               [10] 5294 	halt 
      009C31 5F               [ 4] 5295 	ret 
                                   5296 
                                   5297 ;-------------------------------
                                   5298 ; BASIC: PAUSE expr 
                                   5299 ; suspend execution for n msec.
                                   5300 ; input:
                                   5301 ;	none
                                   5302 ; output:
                                   5303 ;	none 
                                   5304 ;------------------------------
      001EB4                       5305 pause:
      009C32 00 11 72         [ 4] 5306 	call expression
      009C35 5F 00            [ 1] 5307 	cp a,#TK_INTGR
      009C37 12 72            [ 1] 5308 	jreq pause02 
      009C39 5F 00 13         [ 2] 5309 	jp syntax_error
      001EBE                       5310 pause02: 
      009C3C 5B               [ 2] 5311 1$: tnzw x 
      009C3D 04 98            [ 1] 5312 	jreq 2$
      009C3F 81               [10] 5313 	wfi 
      009C40 5A               [ 2] 5314 	decw x 
      009C40 5B 04            [ 1] 5315 	jrne 1$
      009C42 99               [ 1] 5316 2$:	clr a 
      009C43 81               [ 4] 5317 	ret 
                                   5318 
                                   5319 ;------------------------------
                                   5320 ; BASIC: TICKS
                                   5321 ; return msec ticks counter value 
                                   5322 ; input:
                                   5323 ; 	none 
                                   5324 ; output:
                                   5325 ;	X 		TK_INTGR
                                   5326 ;-------------------------------
      009C44                       5327 get_ticks:
      009C44 72 01 00         [ 2] 5328 	ldw x,ticks 
      009C47 20 05            [ 1] 5329 	ld a,#TK_INTGR
      009C49 A6               [ 4] 5330 	ret 
                                   5331 
                                   5332 
                                   5333 
                                   5334 ;------------------------------
                                   5335 ; BASIC: ABS(expr)
                                   5336 ; return absolute value of expr.
                                   5337 ; input:
                                   5338 ;   none
                                   5339 ; output:
                                   5340 ;   X     	positive integer
                                   5341 ;-------------------------------
      001ECD                       5342 abs:
      009C4A 07 CC 87         [ 4] 5343 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009C4D A3 01            [ 1] 5344 	cp a,#1 
      009C4E 27 03            [ 1] 5345 	jreq 0$ 
      009C4E CE 00 1B         [ 2] 5346 	jp syntax_error
      001ED7                       5347 0$:  
      009C51 72 B0 00         [ 4] 5348     call dpop   
      009C54 19               [ 1] 5349 	ld a,xh 
      009C55 26 01            [ 1] 5350 	bcp a,#0x80 
      009C57 81 01            [ 1] 5351 	jreq 2$ 
      009C58 50               [ 2] 5352 	negw x 
      009C58 52 04            [ 1] 5353 2$: ld a,#TK_INTGR 
      009C5A 1F               [ 4] 5354 	ret 
                                   5355 
                                   5356 ;------------------------------
                                   5357 ; BASIC: AND(expr1,expr2)
                                   5358 ; Apply bit AND relation between
                                   5359 ; the 2 arguments, i.e expr1 & expr2 
                                   5360 ; output:
                                   5361 ; 	A 		TK_INTGR
                                   5362 ;   X 		result 
                                   5363 ;------------------------------
      001EE3                       5364 bit_and:
      009C5B 01 CD 88         [ 4] 5365 	call func_args 
      009C5E 81 A1            [ 1] 5366 	cp a,#2
      009C60 0A 27            [ 1] 5367 	jreq 1$
      009C62 03 CC 87         [ 2] 5368 	jp syntax_error 
      009C65 A1 0F A0         [ 4] 5369 1$:	call dpop 
      009C66 89               [ 2] 5370 	pushw x 
      009C66 90 CE 00         [ 4] 5371 	call dpop 
      009C69 05               [ 1] 5372 	ld a,xh 
      009C6A 72 B9            [ 1] 5373 	and a,(1,sp)
      009C6C 00               [ 1] 5374 	ld xh,a 
      009C6D 01               [ 1] 5375 	ld a,xl
      009C6E 17 03            [ 1] 5376 	and a,(2,sp)
      009C70 55               [ 1] 5377 	ld xl,a 
      001EFC                       5378 	_drop 2 
      009C71 00 04            [ 2]    1     addw sp,#2 
      009C73 00 02            [ 1] 5379 	ld a,#TK_INTGR
      009C75 93               [ 4] 5380 	ret
                                   5381 
                                   5382 ;------------------------------
                                   5383 ; BASIC: OR(expr1,expr2)
                                   5384 ; Apply bit OR relation between
                                   5385 ; the 2 arguments, i.e expr1 | expr2 
                                   5386 ; output:
                                   5387 ; 	A 		TK_INTGR
                                   5388 ;   X 		result 
                                   5389 ;------------------------------
      001F01                       5390 bit_or:
      009C76 CD 83 07         [ 4] 5391 	call func_args 
      009C79 1C 00            [ 1] 5392 	cp a,#2
      009C7B 03 72            [ 1] 5393 	jreq 1$
      009C7D FB 01 72         [ 2] 5394 	jp syntax_error 
      001F0B                       5395 1$: 
      009C80 5D 00 14         [ 4] 5396 	call dpop 
      009C83 26               [ 2] 5397 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009C84 0B 72 B0         [ 4] 5398 	call dpop 
      009C87 00               [ 1] 5399 	ld a,xh 
      009C88 15 23            [ 1] 5400 	or a,(1,sp)
      009C8A 05               [ 1] 5401 	ld xh,a 
      009C8B A6               [ 1] 5402 	ld a,xl 
      009C8C 01 CC            [ 1] 5403 	or a,(2,sp)
      009C8E 87               [ 1] 5404 	ld xl,a 
      001F1A                       5405 	_drop 2 
      009C8F A3 02            [ 2]    1     addw sp,#2 
      009C90 A6 04            [ 1] 5406 	ld a,#TK_INTGR 
      009C90 16               [ 4] 5407 	ret
                                   5408 
                                   5409 ;------------------------------
                                   5410 ; BASIC: XOR(expr1,expr2)
                                   5411 ; Apply bit XOR relation between
                                   5412 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5413 ; output:
                                   5414 ; 	A 		TK_INTGR
                                   5415 ;   X 		result 
                                   5416 ;------------------------------
      001F1F                       5417 bit_xor:
      009C91 03 CD 9B         [ 4] 5418 	call func_args 
      009C94 F9 24            [ 1] 5419 	cp a,#2
      009C96 05 A6            [ 1] 5420 	jreq 1$
      009C98 08 CC 87         [ 2] 5421 	jp syntax_error 
      001F29                       5422 1$: 
      009C9B A3 0F A0         [ 4] 5423 	call dpop 
      009C9C 89               [ 2] 5424 	pushw x 
      009C9C CE 00 14         [ 4] 5425 	call dpop 
      009C9F C6               [ 1] 5426 	ld a,xh 
      009CA0 00 16            [ 1] 5427 	xor a,(1,sp)
      009CA2 CF               [ 1] 5428 	ld xh,a 
      009CA3 00               [ 1] 5429 	ld a,xl 
      009CA4 11 C7            [ 1] 5430 	xor a,(2,sp)
      009CA6 00               [ 1] 5431 	ld xl,a 
      001F38                       5432 	_drop 2 
      009CA7 13 1E            [ 2]    1     addw sp,#2 
      009CA9 03 CD            [ 1] 5433 	ld a,#TK_INTGR 
      009CAB 83               [ 4] 5434 	ret 
                                   5435 
                                   5436 ;------------------------------
                                   5437 ; BASIC: LSHIFT(expr1,expr2)
                                   5438 ; logical shift left expr1 by 
                                   5439 ; expr2 bits 
                                   5440 ; output:
                                   5441 ; 	A 		TK_INTGR
                                   5442 ;   X 		result 
                                   5443 ;------------------------------
      001F3D                       5444 lshift:
      009CAC 07 5C 1F         [ 4] 5445 	call func_args
      009CAF 01 5F            [ 1] 5446 	cp a,#2 
      009CB1 16 03            [ 1] 5447 	jreq 1$
      009CB3 CD 81 D5         [ 2] 5448 	jp syntax_error
      009CB6 CE 00 1B         [ 4] 5449 1$: call dpop  
      009CB9 72               [ 1] 5450 	exgw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009CBA B0 00 19         [ 4] 5451 	call dpop
      009CBD 1F 01            [ 2] 5452 	tnzw y 
      009CBF 5F 7B            [ 1] 5453 	jreq 4$
      009CC1 01               [ 2] 5454 2$:	sllw x 
      009CC2 CD 81            [ 2] 5455 	decw y 
      009CC4 60 5C            [ 1] 5456 	jrne 2$
      001F57                       5457 4$:  
      009CC6 7B 02            [ 1] 5458 	ld a,#TK_INTGR
      009CC8 CD               [ 4] 5459 	ret
                                   5460 
                                   5461 ;------------------------------
                                   5462 ; BASIC: RSHIFT(expr1,expr2)
                                   5463 ; logical shift right expr1 by 
                                   5464 ; expr2 bits.
                                   5465 ; output:
                                   5466 ; 	A 		TK_INTGR
                                   5467 ;   X 		result 
                                   5468 ;------------------------------
      001F5A                       5469 rshift:
      009CC9 81 60 5C         [ 4] 5470 	call func_args
      009CCC CD 9B            [ 1] 5471 	cp a,#2 
      009CCE 8D 1E            [ 1] 5472 	jreq 1$
      009CD0 01 89 5F         [ 2] 5473 	jp syntax_error
      009CD3 90 CE 00         [ 4] 5474 1$: call dpop  
      009CD6 19               [ 1] 5475 	exgw x,y 
      009CD7 CD 81 D5         [ 4] 5476 	call dpop
      009CDA 5B 02            [ 2] 5477 	tnzw y 
      009CDC AE 00            [ 1] 5478 	jreq 4$
      009CDE 01               [ 2] 5479 2$:	srlw x 
      009CDF A6 FF            [ 2] 5480 	decw y 
      009CE1 CD 81            [ 1] 5481 	jrne 2$
      001F74                       5482 4$:  
      009CE3 60 CD            [ 1] 5483 	ld a,#TK_INTGR
      009CE5 9B               [ 4] 5484 	ret
                                   5485 
                                   5486 ;--------------------------
                                   5487 ; BASIC: FCPU integer
                                   5488 ; set CPU frequency 
                                   5489 ;-------------------------- 
                                   5490 
      001F77                       5491 fcpu:
      009CE6 8D CE            [ 1] 5492 	ld a,#TK_INTGR
      009CE8 00 11 C6         [ 4] 5493 	call expect 
      009CEB 00               [ 1] 5494 	ld a,xl 
      009CEC 13 CF            [ 1] 5495 	and a,#7 
      009CEE 00 14 C7         [ 1] 5496 	ld CLK_CKDIVR,a 
      009CF1 00               [ 4] 5497 	ret 
                                   5498 
                                   5499 ;------------------------------
                                   5500 ; BASIC: PMODE pin#, mode 
                                   5501 ; define pin as input or output
                                   5502 ; pin#: {0..15}
                                   5503 ; mode: INPUT|OUTPUT  
                                   5504 ;------------------------------
                           000001  5505 	PINNO=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                           000001  5506 	VSIZE=1
      001F83                       5507 pin_mode:
      001F83                       5508 	_vars VSIZE 
      009CF2 16 5F            [ 2]    1     sub sp,#VSIZE 
      009CF4 4B 04 C0         [ 4] 5509 	call arg_list 
      009CF6 A1 02            [ 1] 5510 	cp a,#2 
      009CF6 4F CD            [ 1] 5511 	jreq 1$
      009CF8 81 60 5C         [ 2] 5512 	jp syntax_error 
      009CFB 0A 01 26         [ 4] 5513 1$: call dpop ; mode 
      009CFE F7               [ 1] 5514 	exgw x,y 
      009CFF 84 1E 01         [ 4] 5515 	call dpop ; Dx pin 
      009D02 CD 8A 1A         [ 4] 5516 	call select_pin 
      009D05 5B 04            [ 1] 5517 	ld (PINNO,sp),a  
      009D07 81 01            [ 1] 5518 	ld a,#1 
      009D08 0D 01            [ 1] 5519 	tnz (PINNO,sp)
      009D08 72 01            [ 1] 5520 	jreq 4$
      009D0A 00               [ 1] 5521 2$:	sll a 
      009D0B 20 07            [ 1] 5522 	dec (PINNO,sp)
      009D0D 27 05            [ 1] 5523 	jrne 2$ 
      009D0F A6 07            [ 1] 5524 	ld (PINNO,sp),a
      009D11 CC 87            [ 1] 5525 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009D13 A3 03            [ 1] 5526 	ld (GPIO_CR1,x),a 
      009D14 90 A3 00 01      [ 2] 5527 4$:	cpw y,#OUTP 
      009D14 CD 88            [ 1] 5528 	jreq 6$
                                   5529 ; input mode
      009D16 81 A1            [ 1] 5530 	ld a,(PINNO,sp)
      009D18 0A               [ 1] 5531 	cpl a 
      009D19 27 03            [ 1] 5532 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009D1B CC 87            [ 2] 5533 	jra 9$
      001FB9                       5534 6$: ;output mode  
      009D1D A1 01            [ 1] 5535 	ld a,(PINNO,sp)
      009D1E EA 04            [ 1] 5536 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009D1E 90 CE            [ 1] 5537 	ld (GPIO_CR2,x),a 
      009D20 00 05            [ 1] 5538 	ld a,(PINNO,sp)
      009D22 72 B9            [ 1] 5539 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009D24 00 01            [ 1] 5540 9$:	ld (GPIO_DDR,x),a 
      001FC5                       5541 	_drop VSIZE 
      009D26 55 00            [ 2]    1     addw sp,#VSIZE 
      009D28 04               [ 4] 5542 	ret
                                   5543 
                                   5544 ;------------------------
                                   5545 ; select pin 
                                   5546 ; input:
                                   5547 ;   X 	 {0..15} Arduino Dx 
                                   5548 ; output:
                                   5549 ;   A     stm8s208 pin 
                                   5550 ;   X     base address s208 GPIO port 
                                   5551 ;---------------------------
      001FC8                       5552 select_pin:
      009D29 00               [ 2] 5553 	sllw x 
      009D2A 02 CD 9B         [ 2] 5554 	addw x,#arduino_to_8s208 
      009D2D F9               [ 2] 5555 	ldw x,(x)
      009D2E 25               [ 1] 5556 	ld a,xl 
      009D2F 05               [ 1] 5557 	push a 
      009D30 A6               [ 1] 5558 	swapw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009D31 09 CC            [ 1] 5559 	ld a,#5 
      009D33 87               [ 4] 5560 	mul x,a 
      009D34 A3 50 00         [ 2] 5561 	addw x,#GPIO_BASE 
      009D35 84               [ 1] 5562 	pop a 
      009D35 CD               [ 4] 5563 	ret 
                                   5564 ; translation from Arduino D0..D15 to stm8s208rb 
      001FD8                       5565 arduino_to_8s208:
      009D36 9B 8D                 5566 .byte 3,6 ; D0 
      009D38 CD 86                 5567 .byte 3,5 ; D1 
      009D3A 73 5F                 5568 .byte 4,0 ; D2 
      009D3C 92 AF                 5569 .byte 2,1 ; D3
      009D3E 00 11                 5570 .byte 6,0 ; D4
      009D40 90 95                 5571 .byte 2,2 ; D5
      009D42 5C 92                 5572 .byte 2,3 ; D6
      009D44 AF 00                 5573 .byte 3,1 ; D7
      009D46 11 5C                 5574 .byte 3,3 ; D8
      009D48 90 97                 5575 .byte 2,4 ; D9
      009D4A 72 B9                 5576 .byte 4,5 ; D10
      009D4C 00 19                 5577 .byte 2,6 ; D11
      009D4E 90 CF                 5578 .byte 2,7 ; D12
      009D50 00 1B                 5579 .byte 2,5 ; D13
      009D52 90 CE                 5580 .byte 4,2 ; D14
      009D54 00 19                 5581 .byte 4,1 ; D15
                                   5582 
                                   5583 
                                   5584 ;------------------------------
                                   5585 ; BASIC: RND(expr)
                                   5586 ; return random number 
                                   5587 ; between 1 and expr inclusive
                                   5588 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5589 ; input:
                                   5590 ; 	none 
                                   5591 ; output:
                                   5592 ;	X 		random positive integer 
                                   5593 ;------------------------------
      009D56                       5594 random:
      009D56 92 AF 00         [ 4] 5595 	call func_args 
      009D59 11 90            [ 1] 5596 	cp a,#1
      009D5B F7 5C            [ 1] 5597 	jreq 1$
      009D5D 90 5C 90         [ 2] 5598 	jp syntax_error
      002002                       5599 1$: 
      009D60 C3 00 1B         [ 4] 5600 	call dpop 
      009D63 2B               [ 2] 5601 	pushw x 
      009D64 F1               [ 1] 5602 	ld a,xh 
      009D65 CE 00            [ 1] 5603 	bcp a,#0x80 
      009D67 1B 72            [ 1] 5604 	jreq 2$
      009D69 B0 00            [ 1] 5605 	ld a,#ERR_BAD_VALUE
      009D6B 19 CD 8A         [ 2] 5606 	jp tb_error
      002010                       5607 2$: 
                                   5608 ; acc16=(x<<5)^x 
      009D6E 1A 81 0C         [ 2] 5609 	ldw x,seedx 
      009D70 58               [ 2] 5610 	sllw x 
      009D70 CD               [ 2] 5611 	sllw x 
      009D71 88               [ 2] 5612 	sllw x 
      009D72 81               [ 2] 5613 	sllw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009D73 A1               [ 2] 5614 	sllw x 
      009D74 00               [ 1] 5615 	ld a,xh 
      009D75 27 26 A1         [ 1] 5616 	xor a,seedx 
      009D78 0A 27 03         [ 1] 5617 	ld acc16,a 
      009D7B CC               [ 1] 5618 	ld a,xl 
      009D7C 87 A1 90         [ 1] 5619 	xor a,seedx+1 
      009D7F CE 00 05         [ 1] 5620 	ld acc8,a 
                                   5621 ; seedx=seedy 
      009D82 72 B9 00         [ 2] 5622 	ldw x,seedy 
      009D85 01 55 00         [ 2] 5623 	ldw seedx,x  
                                   5624 ; seedy=seedy^(seedy>>1)
      009D88 04 00            [ 2] 5625 	srlw y 
      009D8A 02 CD            [ 1] 5626 	ld a,yh 
      009D8C 9B F9 25         [ 1] 5627 	xor a,seedy 
      009D8F 05 A6 09         [ 1] 5628 	ld seedy,a  
      009D92 CC 87            [ 1] 5629 	ld a,yl 
      009D94 A3 00 0F         [ 1] 5630 	xor a,seedy+1 
      009D95 C7 00 0F         [ 1] 5631 	ld seedy+1,a 
                                   5632 ; acc16>>3 
      009D95 CE 00 11         [ 2] 5633 	ldw x,acc16 
      009D98 C6               [ 2] 5634 	srlw x 
      009D99 00               [ 2] 5635 	srlw x 
      009D9A 13               [ 2] 5636 	srlw x 
                                   5637 ; x=acc16^x 
      009D9B 20               [ 1] 5638 	ld a,xh 
      009D9C 0A 00 08         [ 1] 5639 	xor a,acc16 
      009D9D 95               [ 1] 5640 	ld xh,a 
      009D9D AE               [ 1] 5641 	ld a,xl 
      009D9E 01 00 4F         [ 1] 5642 	xor a,acc8 
      009DA1 CF               [ 1] 5643 	ld xl,a 
                                   5644 ; seedy=x^seedy 
      009DA2 00 11 C7         [ 1] 5645 	xor a,seedy+1
      009DA5 00               [ 1] 5646 	ld xl,a 
      009DA6 13               [ 1] 5647 	ld a,xh 
      009DA7 C8 00 0E         [ 1] 5648 	xor a,seedy
      009DA7 CF               [ 1] 5649 	ld xh,a 
      009DA8 00 14 C7         [ 2] 5650 	ldw seedy,x 
                                   5651 ; return seedy modulo expr + 1 
      009DAB 00 16            [ 2] 5652 	popw y 
      009DAD 4B               [ 2] 5653 	divw x,y 
      009DAE 04               [ 1] 5654 	ldw x,y 
      009DAF 5F               [ 1] 5655 	incw x 
      009DB0 A6 04            [ 1] 5656 	ld a,#TK_INTGR
      009DB0 4F               [ 4] 5657 	ret 
                                   5658 
                                   5659 ;---------------------------------
                                   5660 ; BASIC: WORDS 
                                   5661 ; affiche la listes des mots du
                                   5662 ; dictionnaire.
                                   5663 ;---------------------------------
                           000001  5664 	WLEN=1
                           000002  5665 	LLEN=2  
                           000002  5666 	VSIZE=2 
      002062                       5667 words:
      002062                       5668 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009DB1 CD 81            [ 2]    1     sub sp,#VSIZE 
      009DB3 60 5C            [ 1] 5669 	clr (LLEN,sp)
      009DB5 0A 01 26 F7      [ 2] 5670 	ldw y,#kword_dict+2
      009DB9 84               [ 1] 5671 0$:	ldw x,y
      009DBA 81               [ 1] 5672 	ld a,(x)
      009DBB A4 0F            [ 1] 5673 	and a,#15 
      009DBB 52 02            [ 1] 5674 	ld (WLEN,sp),a 
      009DBD 5F               [ 1] 5675 1$:	incw x 
      009DBE 1F               [ 1] 5676 	ld a,(x)
      009DBF 01 CF 00         [ 4] 5677 	call putc 
      009DC2 12 35            [ 1] 5678 	inc (LLEN,sp)
      009DC4 01 00            [ 1] 5679 	dec (WLEN,sp)
      009DC6 11 F5            [ 1] 5680 	jrne 1$
      009DC7 A6 46            [ 1] 5681 	ld a,#70
      009DC7 5F 92            [ 1] 5682 	cp a,(LLEN,sp)
      009DC9 AF 00            [ 1] 5683 	jrmi 2$   
      009DCB 11 27            [ 1] 5684 	ld a,#SPACE 
      009DCD 39 01 B3         [ 4] 5685 	call putc 
      009DCE 0C 02            [ 1] 5686 	inc (LLEN,sp) 
      009DCE 92 AF            [ 2] 5687 	jra 3$
      009DD0 00 11            [ 1] 5688 2$: ld a,#CR 
      009DD2 27 06 CD         [ 4] 5689 	call putc 
      009DD5 82 33            [ 1] 5690 	clr (LLEN,sp)
      009DD7 5C 20 F4 5C      [ 2] 5691 3$:	subw y,#2 
      009DDB A6 20            [ 2] 5692 	ldw y,(y)
      009DDD CD 82            [ 1] 5693 	jrne 0$  
      002099                       5694 	_drop VSIZE 
      009DDF 33 92            [ 2]    1     addw sp,#VSIZE 
      009DE1 AF               [ 4] 5695 	ret 
                                   5696 
                                   5697 
                                   5698 ;*********************************
                                   5699 
                                   5700 ;------------------------------
                                   5701 ;      dictionary 
                                   5702 ; format:
                                   5703 ;   link:   2 bytes 
                                   5704 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5705 ;   cmd_name: 16 byte max 
                                   5706 ;   code_address: 2 bytes 
                                   5707 ;------------------------------
                                   5708 	.macro _dict_entry len,name,cmd 
                                   5709 	.word LINK 
                                   5710 	LINK=.
                                   5711 name:
                                   5712 	.byte len 	
                                   5713 	.ascii "name"
                                   5714 	.word cmd 
                                   5715 	.endm 
                                   5716 
                           000000  5717 	LINK=0
      00209C                       5718 kword_end:
      00209C                       5719 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009DE2 00 11                    1 	.word LINK 
                           00209E     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      00209E                          3 XOR:
      009DE4 90                       4 	.byte 3+F_IFUNC 	
      009DE5 95 5C 92                 5 	.ascii "XOR"
      009DE8 AF 00                    6 	.word bit_xor 
      0020A4                       5720 	_dict_entry,5,WRITE,write  
      009DEA 11 5C                    1 	.word LINK 
                           0020A6     2 	LINK=.
      0020A6                          3 WRITE:
      009DEC 90                       4 	.byte 5 	
      009DED 97 90 89 72 FB           5 	.ascii "WRITE"
      009DF2 01 5C                    6 	.word write 
      0020AE                       5721 	_dict_entry,5,WORDS,words 
      009DF4 CD 9B                    1 	.word LINK 
                           0020B0     2 	LINK=.
      0020B0                          3 WORDS:
      009DF6 8D                       4 	.byte 5 	
      009DF7 85 CD 8A 1A A6           5 	.ascii "WORDS"
      009DFC 0D CD                    6 	.word words 
      0020B8                       5722 	_dict_entry 4,WAIT,wait 
      009DFE 82 33                    1 	.word LINK 
                           0020BA     2 	LINK=.
      0020BA                          3 WAIT:
      009E00 1E                       4 	.byte 4 	
      009E01 01 5C 1F 01              5 	.ascii "WAIT"
      009E05 20 C0                    6 	.word wait 
      009E07                       5723 	_dict_entry,3+F_IFUNC,USR,usr
      009E07 1E 01                    1 	.word LINK 
                           0020C3     2 	LINK=.
      0020C3                          3 USR:
      009E09 CD                       4 	.byte 3+F_IFUNC 	
      009E0A 8A 1A AE                 5 	.ascii "USR"
      009E0D 9E 3C                    6 	.word usr 
      0020C9                       5724 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009E0F CD 82                    1 	.word LINK 
                           0020CB     2 	LINK=.
      0020CB                          3 UFLASH:
      009E11 45                       4 	.byte 6+F_IFUNC 	
      009E12 A6 FF C0 00 16 C7        5 	.ascii "UFLASH"
      009E18 00 0A                    6 	.word uflash 
      0020D4                       5725 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009E1A A6 7F                    1 	.word LINK 
                           0020D6     2 	LINK=.
      0020D6                          3 UBOUND:
      009E1C C2                       4 	.byte 6+F_IFUNC 	
      009E1D 00 15 C7 00 09 A6        5 	.ascii "UBOUND"
      009E23 02 C2                    6 	.word ubound 
      0020DF                       5726 	_dict_entry,2,TO,to
      009E25 00 14                    1 	.word LINK 
                           0020E1     2 	LINK=.
      0020E1                          3 TO:
      009E27 C7                       4 	.byte 2 	
      009E28 00 08                    5 	.ascii "TO"
      009E2A 5F A6                    6 	.word to 
      0020E6                       5727 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      009E2C 06 97                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                           0020E8     2 	LINK=.
      0020E8                          3 TICKS:
      009E2E A6                       4 	.byte 5+F_IFUNC 	
      009E2F 0A CD 89 D2 AE           5 	.ascii "TICKS"
      009E34 9E 44                    6 	.word get_ticks 
      0020F0                       5728 	_dict_entry,4,STOP,stop 
      009E36 CD 82                    1 	.word LINK 
                           0020F2     2 	LINK=.
      0020F2                          3 STOP:
      009E38 45                       4 	.byte 4 	
      009E39 5B 02 81 20              5 	.ascii "STOP"
      009E3D 66 69                    6 	.word stop 
      0020F9                       5729 	_dict_entry,4,STEP,step 
      009E3F 6C 65                    1 	.word LINK 
                           0020FB     2 	LINK=.
      0020FB                          3 STEP:
      009E41 73                       4 	.byte 4 	
      009E42 0A 00 20 62              5 	.ascii "STEP"
      009E46 79 74                    6 	.word step 
      002102                       5730 	_dict_entry,5,SLEEP,sleep 
      009E48 65 73                    1 	.word LINK 
                           002104     2 	LINK=.
      002104                          3 SLEEP:
      009E4A 20                       4 	.byte 5 	
      009E4B 66 72 65 65 0A           5 	.ascii "SLEEP"
      009E50 00 A9                    6 	.word sleep 
      009E51                       5731 	_dict_entry,4+F_IFUNC,SIZE,size
      009E51 52 02                    1 	.word LINK 
                           00210E     2 	LINK=.
      00210E                          3 SIZE:
      009E53 72                       4 	.byte 4+F_IFUNC 	
      009E54 5F 00 11 CD              5 	.ascii "SIZE"
      009E58 93 44                    6 	.word size 
      002115                       5732     _dict_entry,4,SHOW,show 
      009E5A A1 04                    1 	.word LINK 
                           002117     2 	LINK=.
      002117                          3 SHOW:
      009E5C 27                       4 	.byte 4 	
      009E5D 03 CC 87 A1              5 	.ascii "SHOW"
      009E61 1F 01                    6 	.word show 
      00211E                       5733 	_dict_entry,4,SAVE,save
      009E63 CD 88                    1 	.word LINK 
                           002120     2 	LINK=.
      002120                          3 SAVE:
      009E65 81                       4 	.byte 4 	
      009E66 A1 0D 27 02              5 	.ascii "SAVE"
      009E6A 20 19                    6 	.word save 
      002127                       5734 	_dict_entry 3,RUN,run
      009E6C CD 93                    1 	.word LINK 
                           002129     2 	LINK=.
      002129                          3 RUN:
      009E6E 44                       4 	.byte 3 	
      009E6F A1 04 27                 5 	.ascii "RUN"
      009E72 03 CC                    6 	.word run 
      00212F                       5735 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009E74 87 A1                    1 	.word LINK 
                           002131     2 	LINK=.
      002131                          3 RSHIFT:
      009E76 9F                       4 	.byte 6+F_IFUNC 	
      009E77 1E 01 CF 00 12 5F        5 	.ascii "RSHIFT"
      009E7D CD 81                    6 	.word rshift 
      00213A                       5736 	_dict_entry,3+F_IFUNC,RND,random 
      009E7F 60 1E                    1 	.word LINK 
                           00213C     2 	LINK=.
      00213C                          3 RND:
      009E81 01                       4 	.byte 3+F_IFUNC 	
      009E82 5C 20 DC                 5 	.ascii "RND"
      009E85 1F F8                    6 	.word random 
      002142                       5737 	_dict_entry,6,RETURN,return 
      009E85 5B 02                    1 	.word LINK 
                           002144     2 	LINK=.
      002144                          3 RETURN:
      009E87 81                       4 	.byte 6 	
      009E88 52 45 54 55 52 4E        5 	.ascii "RETURN"
      009E88 CD 92                    6 	.word return 
      00214D                       5738 	_dict_entry 6,REMARK,rem 
      009E8A 64 A1                    1 	.word LINK 
                           00214F     2 	LINK=.
      00214F                          3 REMARK:
      009E8C 01                       4 	.byte 6 	
      009E8D 27 03 CC 87 A1 CD        5 	.ascii "REMARK"
      009E93 90 20                    6 	.word rem 
      002158                       5739 	_dict_entry,6,REBOOT,cold_start 
      009E95 9F A4                    1 	.word LINK 
                           00215A     2 	LINK=.
      00215A                          3 REBOOT:
      009E97 7F                       4 	.byte 6 	
      009E98 97 A6 03 81 4F 54        5 	.ascii "REBOOT"
      009E9C 05 61                    6 	.word cold_start 
      002163                       5740 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      009E9C CD 92                    1 	.word LINK 
                           002165     2 	LINK=.
      002165                          3 QKEY:
      009E9E 64                       4 	.byte 4+F_IFUNC 	
      009E9F CD 88 81 A1              5 	.ascii "QKEY"
      009EA3 0A 27                    6 	.word qkey 
      00216C                       5741 	_dict_entry,6,PWRADC,power_adc 
      009EA5 07 A1                    1 	.word LINK 
                           00216E     2 	LINK=.
      00216E                          3 PWRADC:
      009EA7 03                       4 	.byte 6 	
      009EA8 27 06 CC 87 A1 43        5 	.ascii "PWRADC"
      009EAD 19 C6                    6 	.word power_adc 
      002177                       5742 	_dict_entry 5,PRINT,print 
      009EAD F6 20                    1 	.word LINK 
                           002179     2 	LINK=.
      002179                          3 PRINT:
      009EAF 01                       4 	.byte 5 	
      009EB0 50 52 49 4E 54           5 	.ascii "PRINT"
      009EB0 9F 97                    6 	.word print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      002181                       5743 	_dict_entry,4+F_CONST,POUT,OUTP 
      009EB2 4F 95                    1 	.word LINK 
                           002183     2 	LINK=.
      002183                          3 POUT:
      009EB4 A6                       4 	.byte 4+F_CONST 	
      009EB5 04 81 55 54              5 	.ascii "POUT"
      009EB7 00 01                    6 	.word OUTP 
      00218A                       5744 	_dict_entry,4,POKE,poke 
      009EB7 CD 82                    1 	.word LINK 
                           00218C     2 	LINK=.
      00218C                          3 POKE:
      009EB9 3C                       4 	.byte 4 	
      009EBA 5F 97 A6 04              5 	.ascii "POKE"
      009EBE 81 AF                    6 	.word poke 
      009EBF                       5745 	_dict_entry,4+F_CONST,PINP,INP 
      009EBF 5F 72                    1 	.word LINK 
                           002195     2 	LINK=.
      002195                          3 PINP:
      009EC1 0B                       4 	.byte 4+F_CONST 	
      009EC2 52 30 01 5C              5 	.ascii "PINP"
      009EC6 A6 04                    6 	.word INP 
      00219C                       5746 	_dict_entry,4+F_IFUNC,PEEK,peek 
      009EC8 81 95                    1 	.word LINK 
                           00219E     2 	LINK=.
      009EC9                          3 PEEK:
      009EC9 CD                       4 	.byte 4+F_IFUNC 	
      009ECA 92 64 A1 02              5 	.ascii "PEEK"
      009ECE 27 03                    6 	.word peek 
      0021A5                       5747 	_dict_entry,5,PMODE,pin_mode 
      009ED0 CC 87                    1 	.word LINK 
                           0021A7     2 	LINK=.
      0021A7                          3 PMODE:
      009ED2 A1                       4 	.byte 5 	
      009ED3 50 4D 4F 44 45           5 	.ascii "PMODE"
      009ED3 AE 00                    6 	.word pin_mode 
      0021AF                       5748 	_dict_entry,5,PAUSE,pause 
      009ED5 02 72                    1 	.word LINK 
                           0021B1     2 	LINK=.
      0021B1                          3 PAUSE:
      009ED7 DE                       4 	.byte 5 	
      009ED8 00 17 2B 1B A3           5 	.ascii "PAUSE"
      009EDD 00 09                    6 	.word pause 
      0021B9                       5749 	_dict_entry,2+F_IFUNC,OR,bit_or
      009EDF 2A 16                    1 	.word LINK 
                           0021BB     2 	LINK=.
      0021BB                          3 OR:
      009EE1 A6                       4 	.byte 2+F_IFUNC 	
      009EE2 05 42                    5 	.ascii "OR"
      009EE4 1C 50                    6 	.word bit_or 
      0021C0                       5750 	_dict_entry,3+F_CONST,ODR,GPIO_ODR
      009EE6 00 89                    1 	.word LINK 
                           0021C2     2 	LINK=.
      0021C2                          3 ODR:
      009EE8 CD                       4 	.byte 3+F_CONST 	
      009EE9 90 20 72                 5 	.ascii "ODR"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009EEC FB 01                    6 	.word GPIO_ODR 
      0021C8                       5751 	_dict_entry,3,NEW,new
      009EEE 1F 01                    1 	.word LINK 
                           0021CA     2 	LINK=.
      0021CA                          3 NEW:
      009EF0 CD                       4 	.byte 3 	
      009EF1 90 47 85                 5 	.ascii "NEW"
      009EF4 A6 04                    6 	.word new 
      0021D0                       5752 	_dict_entry,4,NEXT,next 
      009EF6 81 CA                    1 	.word LINK 
                           0021D2     2 	LINK=.
      009EF7                          3 NEXT:
      009EF7 A6                       4 	.byte 4 	
      009EF8 0A CC 87 A3              5 	.ascii "NEXT"
      009EFC 18 6B                    6 	.word next 
      0021D9                       5753 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      009EFC AE A4                    1 	.word LINK 
                           0021DB     2 	LINK=.
      0021DB                          3 LSHIFT:
      009EFE 00                       4 	.byte 6+F_IFUNC 	
      009EFF A6 04 81 49 46 54        5 	.ascii "LSHIFT"
      009F02 1F 3D                    6 	.word lshift 
      0021E4                       5754 	_dict_entry,4,LOAD,load 
      009F02 90 89                    1 	.word LINK 
                           0021E6     2 	LINK=.
      0021E6                          3 LOAD:
      009F04 CD                       4 	.byte 4 	
      009F05 92 64 A1 01              5 	.ascii "LOAD"
      009F09 2A 03                    6 	.word load 
      0021ED                       5755 	_dict_entry 4,LIST,list
      009F0B CC 87                    1 	.word LINK 
                           0021EF     2 	LINK=.
      0021EF                          3 LIST:
      009F0D A1                       4 	.byte 4 	
      009F0E 4C 49 53 54              5 	.ascii "LIST"
      009F0E CD 90                    6 	.word list 
      0021F6                       5756 	_dict_entry 3,LET,let 
      009F10 20 A1                    1 	.word LINK 
                           0021F8     2 	LINK=.
      0021F8                          3 LET:
      009F12 02                       4 	.byte 3 	
      009F13 2B 05 90                 5 	.ascii "LET"
      009F16 93 CD                    6 	.word let 
      0021FE                       5757 	_dict_entry,3+F_IFUNC,KEY,key 
      009F18 90 20                    1 	.word LINK 
                           002200     2 	LINK=.
      002200                          3 KEY:
      009F1A 51                       4 	.byte 3+F_IFUNC 	
      009F1B 90 FD 90                 5 	.ascii "KEY"
      009F1E 85 81                    6 	.word key 
      009F20                       5758 	_dict_entry,5,INPUT,input_var  
      009F20 72 0D                    1 	.word LINK 
                           002208     2 	LINK=.
      002208                          3 INPUT:
      009F22 52                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009F23 30 FB 8E CC 85           5 	.ascii "INPUT"
      009F28 E1 A2                    6 	.word input_var 
      009F29                       5759 	_dict_entry,2,IF,if 
      009F29 72 0D                    1 	.word LINK 
                           002212     2 	LINK=.
      002212                          3 IF:
      009F2B 52                       4 	.byte 2 	
      009F2C 30 FB                    5 	.ascii "IF"
      009F2E 72 16                    6 	.word if 
      002217                       5760 	_dict_entry,3+F_CONST,IDR,GPIO_IDR
      009F30 00 20                    1 	.word LINK 
                           002219     2 	LINK=.
      002219                          3 IDR:
      009F32 8E                       4 	.byte 3+F_CONST 	
      009F33 81 44 52                 5 	.ascii "IDR"
      009F34 00 01                    6 	.word GPIO_IDR 
      00221F                       5761 	_dict_entry,3,HEX,hex_base
      009F34 CD 93                    1 	.word LINK 
                           002221     2 	LINK=.
      002221                          3 HEX:
      009F36 44                       4 	.byte 3 	
      009F37 A1 04 27                 5 	.ascii "HEX"
      009F3A 03 CC                    6 	.word hex_base 
      002227                       5762 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      009F3C 87 A1                    1 	.word LINK 
                           002229     2 	LINK=.
      009F3E                          3 GPIO:
      009F3E 5D                       4 	.byte 4+F_IFUNC 	
      009F3F 27 04 8F 5A              5 	.ascii "GPIO"
      009F43 26 F9                    6 	.word gpio 
      002230                       5763 	_dict_entry,4,GOTO,goto 
      009F45 4F 81                    1 	.word LINK 
                           002232     2 	LINK=.
      009F47                          3 GOTO:
      009F47 CE                       4 	.byte 4 	
      009F48 00 0B A6 04              5 	.ascii "GOTO"
      009F4C 81 DA                    6 	.word goto 
      009F4D                       5764 	_dict_entry,5,GOSUB,gosub 
      009F4D CD 92                    1 	.word LINK 
                           00223B     2 	LINK=.
      00223B                          3 GOSUB:
      009F4F 64                       4 	.byte 5 	
      009F50 A1 01 27 03 CC           5 	.ascii "GOSUB"
      009F55 87 A1                    6 	.word gosub 
      009F57                       5765 	_dict_entry,6,FORGET,forget 
      009F57 CD 90                    1 	.word LINK 
                           002245     2 	LINK=.
      002245                          3 FORGET:
      009F59 20                       4 	.byte 6 	
      009F5A 9E A5 80 27 01 50        5 	.ascii "FORGET"
      009F60 A6 04                    6 	.word forget 
      00224E                       5766 	_dict_entry,3,FOR,for 
      009F62 81 45                    1 	.word LINK 
                           002250     2 	LINK=.
      009F63                          3 FOR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009F63 CD                       4 	.byte 3 	
      009F64 92 64 A1                 5 	.ascii "FOR"
      009F67 02 27                    6 	.word for 
      002256                       5767 	_dict_entry,4,FCPU,fcpu 
      009F69 03 CC                    1 	.word LINK 
                           002258     2 	LINK=.
      002258                          3 FCPU:
      009F6B 87                       4 	.byte 4 	
      009F6C A1 CD 90 20              5 	.ascii "FCPU"
      009F70 89 CD                    6 	.word fcpu 
      00225F                       5768 	_dict_entry,6+F_CONST,EEPROM,EEPROM_BASE  
      009F72 90 20                    1 	.word LINK 
                           002261     2 	LINK=.
      002261                          3 EEPROM:
      009F74 9E                       4 	.byte 6+F_CONST 	
      009F75 14 01 95 9F 14 02        5 	.ascii "EEPROM"
      009F7B 97 5B                    6 	.word EEPROM_BASE 
      00226A                       5769 	_dict_entry,6+F_CMD,DWRITE,digital_write
      009F7D 02 A6                    1 	.word LINK 
                           00226C     2 	LINK=.
      00226C                          3 DWRITE:
      009F7F 04                       4 	.byte 6+F_CMD 	
      009F80 81 57 52 49 54 45        5 	.ascii "DWRITE"
      009F81 1A 77                    6 	.word digital_write 
      002275                       5770 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      009F81 CD 92                    1 	.word LINK 
                           002277     2 	LINK=.
      002277                          3 DREAD:
      009F83 64                       4 	.byte 5+F_IFUNC 	
      009F84 A1 02 27 03 CC           5 	.ascii "DREAD"
      009F89 87 A1                    6 	.word digital_read 
      009F8B                       5771 	_dict_entry,3,DIR,directory 
      009F8B CD 90                    1 	.word LINK 
                           002281     2 	LINK=.
      002281                          3 DIR:
      009F8D 20                       4 	.byte 3 	
      009F8E 89 CD 90                 5 	.ascii "DIR"
      009F91 20 9E                    6 	.word directory 
      002287                       5772 	_dict_entry,3,DEC,dec_base
      009F93 1A 01                    1 	.word LINK 
                           002289     2 	LINK=.
      002289                          3 DEC:
      009F95 95                       4 	.byte 3 	
      009F96 9F 1A 02                 5 	.ascii "DEC"
      009F99 97 5B                    6 	.word dec_base 
      00228F                       5773 	_dict_entry,3+F_CONST,DDR,GPIO_DDR
      009F9B 02 A6                    1 	.word LINK 
                           002291     2 	LINK=.
      002291                          3 DDR:
      009F9D 04                       4 	.byte 3+F_CONST 	
      009F9E 81 44 52                 5 	.ascii "DDR"
      009F9F 00 02                    6 	.word GPIO_DDR 
      002297                       5774 	_dict_entry,3+F_CONST,CRL,GPIO_CR1
      009F9F CD 92                    1 	.word LINK 
                           002299     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      002299                          3 CRL:
      009FA1 64                       4 	.byte 3+F_CONST 	
      009FA2 A1 02 27                 5 	.ascii "CRL"
      009FA5 03 CC                    6 	.word GPIO_CR1 
      00229F                       5775 	_dict_entry,3+F_CONST,CRH,GPIO_CR2
      009FA7 87 A1                    1 	.word LINK 
                           0022A1     2 	LINK=.
      009FA9                          3 CRH:
      009FA9 CD                       4 	.byte 3+F_CONST 	
      009FAA 90 20 89                 5 	.ascii "CRH"
      009FAD CD 90                    6 	.word GPIO_CR2 
      0022A7                       5776 	_dict_entry,4+F_CFUNC,CHAR,char
      009FAF 20 9E                    1 	.word LINK 
                           0022A9     2 	LINK=.
      0022A9                          3 CHAR:
      009FB1 18                       4 	.byte 4+F_CFUNC 	
      009FB2 01 95 9F 18              5 	.ascii "CHAR"
      009FB6 02 97                    6 	.word char 
      0022B0                       5777 	_dict_entry,3,BYE,bye 
      009FB8 5B 02                    1 	.word LINK 
                           0022B2     2 	LINK=.
      0022B2                          3 BYE:
      009FBA A6                       4 	.byte 3 	
      009FBB 04 81 45                 5 	.ascii "BYE"
      009FBD 1E A0                    6 	.word bye 
      0022B8                       5778 	_dict_entry,5,BTOGL,bit_toggle
      009FBD CD 92                    1 	.word LINK 
                           0022BA     2 	LINK=.
      0022BA                          3 BTOGL:
      009FBF 64                       4 	.byte 5 	
      009FC0 A1 02 27 03 CC           5 	.ascii "BTOGL"
      009FC5 87 A1                    6 	.word bit_toggle 
      0022C2                       5779 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      009FC7 CD 90                    1 	.word LINK 
                           0022C4     2 	LINK=.
      0022C4                          3 BTEST:
      009FC9 20                       4 	.byte 5+F_IFUNC 	
      009FCA 51 CD 90 20 90           5 	.ascii "BTEST"
      009FCF 5D 27                    6 	.word bit_test 
      0022CC                       5780 	_dict_entry,4,BSET,bit_set 
      009FD1 05 58                    1 	.word LINK 
                           0022CE     2 	LINK=.
      0022CE                          3 BSET:
      009FD3 90                       4 	.byte 4 	
      009FD4 5A 26 FB 54              5 	.ascii "BSET"
      009FD7 17 47                    6 	.word bit_set 
      0022D5                       5781 	_dict_entry,4,BRES,bit_reset
      009FD7 A6 04                    1 	.word LINK 
                           0022D7     2 	LINK=.
      0022D7                          3 BRES:
      009FD9 81                       4 	.byte 4 	
      009FDA 42 52 45 53              5 	.ascii "BRES"
      009FDA CD 92                    6 	.word bit_reset 
      0022DE                       5782 	_dict_entry,5,BREAK,break 
      009FDC 64 A1                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



                           0022E0     2 	LINK=.
      0022E0                          3 BREAK:
      009FDE 02                       4 	.byte 5 	
      009FDF 27 03 CC 87 A1           5 	.ascii "BREAK"
      009FE4 CD 90                    6 	.word break 
      0022E8                       5783 	_dict_entry,4,BEEP,beep 
      009FE6 20 51                    1 	.word LINK 
                           0022EA     2 	LINK=.
      0022EA                          3 BEEP:
      009FE8 CD                       4 	.byte 4 	
      009FE9 90 20 90 5D              5 	.ascii "BEEP"
      009FED 27 05                    6 	.word beep 
      0022F1                       5784 	_dict_entry,3+F_IFUNC,ASC,ascii
      009FEF 54 90                    1 	.word LINK 
                           0022F3     2 	LINK=.
      0022F3                          3 ASC:
      009FF1 5A                       4 	.byte 3+F_IFUNC 	
      009FF2 26 FB 43                 5 	.ascii "ASC"
      009FF4 1E 1C                    6 	.word ascii 
      0022F9                       5785 	_dict_entry,6+F_IFUNC,ANREAD,analog_read
      009FF4 A6 04                    1 	.word LINK 
                           0022FB     2 	LINK=.
      0022FB                          3 ANREAD:
      009FF6 81                       4 	.byte 6+F_IFUNC 	
      009FF7 41 4E 52 45 41 44        5 	.ascii "ANREAD"
      009FF7 A6 04                    6 	.word analog_read 
      002304                       5786 	_dict_entry,3+F_IFUNC,AND,bit_and
      009FF9 CD 92                    1 	.word LINK 
                           002306     2 	LINK=.
      002306                          3 AND:
      009FFB 33                       4 	.byte 3+F_IFUNC 	
      009FFC 9F A4 07                 5 	.ascii "AND"
      009FFF C7 50                    6 	.word bit_and 
      00230C                       5787 kword_dict:
      00230C                       5788 	_dict_entry,3+F_IFUNC,ABS,abs
      00A001 C6 81                    1 	.word LINK 
                           00230E     2 	LINK=.
      00A003                          3 ABS:
      00A003 52                       4 	.byte 3+F_IFUNC 	
      00A004 01 CD 92                 5 	.ascii "ABS"
      00A007 40 A1                    6 	.word abs 
                                   5789 	
                                   5790 
      002380                       5791 	.bndry 128 ; align on FLASH block.
                                   5792 ; free space for user application  
      002380                       5793 user_space:
                                   5794 ; USR() function test
      00A009 02               [ 2] 5795 	pushw x 
      00A00A 27 03 CC 87      [ 1] 5796 	bset PC_ODR,#5 
      00A00E A1               [ 2] 5797 	popw x 
      00A00F CD 90 20         [ 4] 5798 	call pause02 
      00A012 51 CD 90 20      [ 1] 5799 	bres PC_ODR,#5 
      00A016 CD               [ 4] 5800 	ret
                                   5801 
                                   5802 	.area FLASH_DRIVE (ABS)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      010000                       5803 	.org 0x10000
      010000                       5804 fdrive:
                                   5805 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        00230E R   |     ADC_CR1 =  005401 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        002306 R
  5 ANREAD     0022FB R   |     ARG_CNT =  000001     |     ARG_OFS =  000002 
  5 ASC        0022F3 R   |     ATTRIB  =  000002     |     AWU_APR =  0050F1 
    AWU_CSR =  0050F0     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |     BASE    =  000002 
    BASE_SAV=  000001     |   5 BEEP       0022EA R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_ER=  000000     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  000005 
  5 BREAK      0022E0 R   |   5 BRES       0022D7 R   |   5 BSET       0022CE R
    BSIZE   =  000001     |     BSP     =  000008     |   5 BTEST      0022C4 R
  5 BTOGL      0022BA R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        0022B2 R   |     C       =  000001     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000000     |   5 CHAR       0022A9 R   |     CLKOPT  =  004807 
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
  5 CRH        0022A1 R   |   5 CRL        002299 R   |     CTRL_A  =  000001 
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
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        002291 R
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        002289 R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        002281 R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DREAD      002277 R   |     DSTACK_S=  000040     |   5 DWRITE     00226C R
  5 EEPROM     002261 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |     EOF     =  0000FF     |     ERR_BAD_=  00000A 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_L=  000005 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |   5 FCPU       002258 R   |     FF      =  00000C 
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
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   5 FOR        002250 R
  5 FORGET     002245 R   |     FRUN    =  000000     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FTRAP   =  000001     |     F_CFUNC =  000080 
    F_CMD   =  000000     |     F_CONST =  0000C0     |     F_IFUNC =  000040 
  5 GOSUB      00223B R   |     GOS_RET =  000003     |   5 GOTO       002232 R
  5 GPIO       002229 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   5 HEX        002221 R
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
    I2C_WRIT=  000000     |   5 IDR        002219 R   |   5 IF         002212 R
    IN      =  000007     |     INCR    =  000001     |     INP     =  000000 
  5 INPUT      002208 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
  5 KEY        002200 R   |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000005     |   5 LET        0021F8 R   |     LINENO  =  000005 
  5 LINK    =  00230E R   |   5 LIST       0021EF R   |     LL      =  000002 
    LLEN    =  000002     |     LL_HB   =  000001     |     LNO     =  000005 
    LN_PTR  =  000005     |   5 LOAD       0021E6 R   |   5 LSHIFT     0021DB R
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MINOR   =  000000     |     MULOP   =  000005     |     N1      =  000001 
    N1_HB   =  000006     |     N1_LB   =  000007     |     N2      =  000003 
    N2_HB   =  000008     |     N2_LB   =  000009     |     NAFR    =  004804 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        0021CA R   |   5 NEXT       0021D2 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NL      =  00000A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R
  5 ODR        0021C2 R   |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         0021BB R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
    PAD_SIZE=  000028     |   5 PAUSE      0021B1 R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       00219E R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       002195 R   |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]

Symbol Table

    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      0021A7 R
  5 POKE       00218C R   |   5 POUT       002183 R   |     PREV    =  000001 
  5 PRINT      002179 R   |     PROD    =  000002     |     PSIZE   =  000001 
  5 PWRADC     00216E R   |   5 QKEY       002165 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 REBOOT     00215A R
  5 REG_A      000944 R   |   5 REG_CC     000948 R   |   5 REG_EPC    000937 R
  5 REG_SP     00094D R   |   5 REG_X      000940 R   |   5 REG_Y      00093C R
    RELOP   =  000005     |   5 REMARK     00214F R   |     RETL1   =  000001 
  5 RETURN     002144 R   |   5 RND        00213C R   |     ROP     =  004800 
  5 RSHIFT     002131 R   |     RST_SR  =  0050B3     |   5 RUN        002129 R
    RXCHAR  =  000001     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   5 SAVE       002120 R
    SDIVD   =  000002     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       002117 R   |     SIGN    =  000001 
  5 SIZE       00210E R   |     SKIP    =  000006     |   5 SLEEP      002104 R
    SPACE   =  000020     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  000080     |   5 STATES     0008FA R   |   5 STEP       0020FB R
  5 STOP       0020F2 R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      0020E8 R
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
    TK_VAR  =  000005     |   5 TO         0020E1 R   |   5 Timer4Up   000019 R
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
    UBC     =  004801     |   5 UBOUND     0020D6 R   |   5 UFLASH     0020CB R
  5 USER_ABO   00007E R   |   5 USR        0020C3 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 UserButt   000025 R
    VSIZ    =  000002     |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       0020BA R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      0020B0 R   |   5 WRITE      0020A6 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XADR    =  000001     |     XMASK   =  000001 
  5 XOR        00209E R   |     XSAVE   =  000003     |     YSAVE   =  000003 
  5 abs        001ECD R   |   1 acc16      000008 R   |   1 acc24      000007 R
  1 acc8       000009 R   |   5 accept_c   000AEE R   |   5 add        001081 R
  5 analog_r   001A0F R   |   5 ansi_seq   000AB0 R   |   5 arduino_   001FD8 R
  5 arg_list   0011C0 R   |   1 array_si   00001D R   |   5 ascii      001E1C R
  5 at_tst     000DBB R   |   5 atoi24     000ECE R   |   5 atoi_exi   000F3C R
  5 bad_port   001E77 R   |   1 base       000006 R   |   1 basicptr   000004 R
  5 beep       00199E R   |   5 bin_exit   000CBF R   |   5 bit_and    001EE3 R
  5 bit_or     001F01 R   |   5 bit_rese   00175B R   |   5 bit_set    001747 R
  5 bit_test   001784 R   |   5 bit_togg   001770 R   |   5 bit_xor    001F1F R
  5 bkslsh_t   000D66 R   |   5 bksp       0001CF R   |   5 break      001AB6 R
  5 break_po   001AE4 R   |   5 bye        001EA0 R   |   5 char       001E08 R
  5 check_fu   0003F2 R   |   5 clear_ba   0005F3 R   |   5 clear_va   0004FC R
  5 clock_in   000099 R   |   5 cmd_itf    000B12 R   |   5 cmd_name   00112C R
  5 cmp_name   001B58 R   |   5 cold_sta   000561 R   |   5 colon_ts   000D8F R
  5 comma_ts   000D9A R   |   5 compile    000401 R   |   5 convert_   000C47 R
  1 count      000003 R   |   5 cp_loop    00116F R   |   5 create_g   000351 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]

Symbol Table

  5 cstk_pro   00104B R   |   5 dash_tst   000DB0 R   |   5 ddrop      000FC7 R
  5 ddrop_n    001004 R   |   5 ddup       000FD0 R   |   5 dec_base   001374 R
  5 del_back   000ADF R   |   5 del_line   000319 R   |   5 del_ln     000AD0 R
  5 delete     0001DF R   |   5 digital_   001A45 R   |   5 digital_   001A77 R
  5 dir_loop   001D47 R   |   5 director   001D3B R   |   5 divide     0010D7 R
  5 divu24_8   000A3D R   |   5 dotr       001054 R   |   5 dotr_loo   001069 R
  5 dots       001021 R   |   5 dpick      000FE1 R   |   5 dpop       000FA0 R
  5 dpush      000F93 R   |   5 drive_fr   001DC4 R   |   3 dstack     001740 R
  3 dstack_u   001780 R   |   5 dstk_pro   001017 R   |   1 dstkptr    000016 R
  5 dswap      000FAD R   |   5 eql_tst    000E1B R   |   5 equal      001604 R
  5 err_bad_   0006D0 R   |   5 err_cmd_   000691 R   |   5 err_div0   000653 R
  5 err_dupl   0006AC R   |   5 err_math   000639 R   |   5 err_mem_   00061C R
  5 err_msg    000604 R   |   5 err_no_a   0006DD R   |   5 err_no_l   000663 R
  5 err_not_   0006BE R   |   5 err_run_   00067A R   |   5 err_synt   00062A R
  5 escaped    000C5C R   |   5 expect     0011B3 R   |   5 expr_exi   001305 R
  5 expressi   0012C4 R   |   5 factor     00121B R   |   1 farptr     000010 R
  5 fcpu       001F77 R   |   7 fdrive     010000 R   |   5 fetch      000FF0 R
  5 fetchc     000BFF R   |   1 ffree      000013 R   |   5 file_cou   001DBC R
  5 final_te   000AAA R   |   5 first_li   0013F8 R   |   1 flags      00001F R
  5 for        0017E9 R   |   5 forget     001CF0 R   |   1 free_ram   000055 R
  5 func_arg   0011E4 R   |   5 ge         001606 R   |   5 get_arra   0011F4 R
  5 get_tick   001EC7 R   |   5 get_toke   000D01 R   |   5 getc       0001BC R
  5 go_commo   00190A R   |   5 gosub      0018E7 R   |   5 goto       0018DA R
  5 gpio       001E49 R   |   5 gt         001602 R   |   5 gt_tst     000E26 R
  5 hex_base   00136F R   |   5 if         0017D5 R   |   1 in         000001 R
  1 in.saved   000002 R   |   1 in.w       000000 R   |   5 incr_far   001B0D R
  5 input_ex   001713 R   |   5 input_lo   0016AE R   |   5 input_va   0016A2 R
  5 insert_l   00038A R   |   5 insert_l   0003EF R   |   5 interp     000791 R
  5 interp_l   0007D1 R   |   5 invalid    000B57 R   |   5 invalid_   000BD5 R
  5 is_alpha   00050A R   |   5 is_digit   000EB9 R   |   5 itoa       0009F6 R
  5 itoa_loo   000A0E R   |   5 key        001E37 R   |   5 kword_di   00230C R
  5 kword_en   00209C R   |   5 last_lin   001401 R   |   5 le         00160B R
  5 ledoff     00084A R   |   5 ledon      000845 R   |   5 ledtoggl   00084F R
  5 left_arr   000AB0 R   |   5 left_par   000858 R   |   5 let        0013A5 R
  5 let02      0013AF R   |   5 lines_sk   001406 R   |   5 list       0013CD R
  5 list_exi   00144D R   |   5 list_sta   001429 R   |   5 load       001C88 R
  5 loop_bac   0018B3 R   |   1 loop_dep   00001C R   |   5 loop_don   0018C8 R
  5 lshift     001F3D R   |   5 lt         001609 R   |   5 lt_tst     000E5F R
  5 mem_peek   000B74 R   |   5 modulo     00111B R   |   5 move       0002B3 R
  5 move_dow   0002D1 R   |   5 move_exi   0002F2 R   |   5 move_loo   0002D6 R
  5 move_up    0002C3 R   |   5 mul_char   0015F3 R   |   5 multiply   00108F R
  5 mulu24_8   000F40 R   |   5 nbr_tst    000D3C R   |   5 ne         00160E R
  5 neg_acc2   000A65 R   |   5 new        001B02 R   |   5 next       00186B R
  5 next_tok   000801 R   |   5 no_match   001181 R   |   5 none       000D01 R
  5 number     000C05 GR  |   5 other      000E97 R   |   3 pad        001718 R
  5 parse_bi   000C9F R   |   5 parse_in   000C64 R   |   5 parse_ke   000CC7 R
  5 parse_qu   000C0C R   |   5 pause      001EB4 R   |   5 pause02    001EBE R
  5 peek       0017C2 R   |   5 peek_byt   000B9F R   |   5 pin_mode   001F83 R
  5 plus_tst   000DEF R   |   5 poke       0017AF R   |   5 power_ad   0019C6 R
  5 prcnt_ts   000E10 R   |   5 print      001611 R   |   5 print_ex   001676 R
  5 print_fa   000BE4 R   |   5 print_in   00099A R   |   5 print_re   0008A7 R
  5 print_st   000B67 R   |   5 prt_basi   0014A0 R   |   5 prt_cmd_   001450 R
  5 prt_loop   001615 R   |   5 prt_peek   000263 R   |   5 prt_quot   001464 R
  5 prt_reg1   000888 R   |   5 prt_reg8   000863 R   |   5 prt_regs   0001F9 R
  5 prti24     000952 R   |   1 ptr16      000011 R   |   1 ptr8       000012 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]

Symbol Table

  5 putc       0001B3 R   |   5 puts       0001C5 R   |   5 qkey       001E3F R
  5 qmark_ts   000DC6 R   |   5 random     001FF8 R   |   5 readln     000A88 R
  5 readln_l   000A8E R   |   5 readln_q   000B03 R   |   5 regs_sta   00023C R
  5 rel_exit   00135C R   |   5 relation   001308 R   |   5 relop_st   0015F6 R
  5 rem        001716 R   |   5 repl       000B20 R   |   5 repl_exi   000B48 R
  5 reprint    000AB0 R   |   5 reset_co   001613 R   |   5 rest_con   001692 R
  5 return     00192C R   |   5 right_ar   000AB0 R   |   5 rparnt_t   000D84 R
  5 rshift     001F5A R   |   5 rt_msg     000711 R   |   5 run        00194C R
  5 save       001BC4 R   |   5 save_con   001682 R   |   5 search_d   00115E R
  5 search_e   0011AF R   |   5 search_f   001B79 R   |   5 search_l   0002F5 R
  5 search_l   0002FD R   |   5 search_n   001162 R   |   1 seedx      00000C R
  1 seedy      00000E R   |   5 seek_fdr   001B1B R   |   5 select_p   001FC8 R
  5 sharp_ts   000DA5 R   |   5 show       00135F R   |   5 single_c   0015EF R
  5 size       001379 R   |   5 skip       000F7A R   |   5 slash_ts   000E05 R
  5 sleep      001EA9 R   |   5 software   00051B R   |   5 spaces     0001ED R
  3 stack_fu   001780 R   |   3 stack_un   001800 R   |   5 star_tst   000DFA R
  5 step       001843 R   |   5 stop       00198F R   |   5 store      000FFA R
  5 store_lo   001855 R   |   5 str_matc   001190 R   |   5 str_tst    000D2B R
  5 strcmp     000294 R   |   5 strcpy     0002A5 R   |   5 strlen     000287 R
  5 substrac   001089 R   |   5 syntax_e   000721 R   |   1 tab_widt   000020 R
  5 tb_error   000723 R   |   5 term       001277 R   |   5 term01     001280 R
  5 term_exi   0012C1 R   |   5 test_p     000B5F R   |   3 tib        0016C8 R
  5 tick_tst   000DDD R   |   1 ticks      00000A R   |   5 timer4_i   0000AF R
  5 to         001813 R   |   5 to_upper   000EC2 GR  |   5 token_ch   000EA6 R
  5 token_ex   000EB6 R   |   1 txtbgn     000018 R   |   1 txtend     00001A R
  5 uart1_in   000178 R   |   5 uart1_se   000188 R   |   5 ubound     001383 R
  5 uflash     001E7C R   |   5 unget_to   000F8D R   |   5 unlock_e   0000C4 R
  5 unlock_f   0000D2 R   |   5 user_spa   002380 R   |   5 usr        001E82 R
  1 vars       000021 R   |   5 wait       00171C R   |   5 warm_sta   000775 R
  5 words      002062 R   |   5 write      001DD1 R   |   5 write_bl   000155 R
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

