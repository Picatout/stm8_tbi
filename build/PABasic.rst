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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      000001                         39 _dbg 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      001800                         93 stack_unf: ; stack underflow ; control_stack bottom 
                                     94 
                                     95 
                                     96 ;--------------------------------------
                                     97     .area HOME 
                                     98 ;--------------------------------------
      008000 82 00 85 EF             99     int cold_start
                           000001   100 .if DEBUG
      008004 82 00 80 98            101 	int TrapHandler 		;TRAP  software interrupt
                           000000   102 .else
                                    103 	int NonHandledInterrupt ;TRAP  software interrupt
                                    104 .endif
      008008 82 00 80 89            105 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 8A            106 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 89            107 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 89            108 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 89            109 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 89            110 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 89            111 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 B3            112 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
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
      008064 82 00 80 A7            128 	int Timer4UpdateHandler	;int23 TIM4 update/overflow used as msec ticks counter
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
      00808A                        146 AWUHandler:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      00808A 72 19 50 F0      [ 1]  147 	bres AWU_CSR,#AWU_CSR_AWUEN
      00808E 55 00 3F 50 F1   [ 1]  148 	mov AWU_APR,0x3F
      008093 72 5F 50 F2      [ 1]  149 	clr AWU_TBR 
      008097 80               [11]  150 	iret
                                    151 
                                    152 ;------------------------------------
                                    153 ; software interrupt handler  
                                    154 ;------------------------------------
                           000001   155 .if DEBUG 
      008098                        156 TrapHandler:
      008098 72 12 00 20      [ 1]  157 	bset flags,#FTRAP 
      00809C CD 89 35         [ 4]  158 	call print_registers
      00809F CD 8B A0         [ 4]  159 	call cmd_itf
      0080A2 72 13 00 20      [ 1]  160 	bres flags,#FTRAP 	
      0080A6 80               [11]  161 	iret
                                    162 .endif 
                                    163 
      0080A7                        164 Timer4UpdateHandler:
      0080A7 72 5F 53 42      [ 1]  165 	clr TIM4_SR 
      0080AB CE 00 0B         [ 2]  166 	ldw x,ticks
      0080AE 5C               [ 2]  167 	incw x
      0080AF CF 00 0B         [ 2]  168 	ldw ticks,x 
      0080B2 80               [11]  169 	iret 
                                    170 
                                    171 
                                    172 ;------------------------------------
                                    173 ; Triggered by pressing USER UserButton 
                                    174 ; on NUCLEO card.
                                    175 ;------------------------------------
      0080B3                        176 UserButtonHandler:
                                    177 ; wait button release
      0080B3 5F               [ 1]  178 	clrw x
      0080B4 5A               [ 2]  179 1$: decw x 
      0080B5 26 FD            [ 1]  180 	jrne 1$
      0080B7 72 09 50 15 F8   [ 2]  181 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    182 ; if MCU suspended by SLEEP resume program
      0080BC 72 07 00 20 05   [ 2]  183     btjf flags,#FSLEEP,2$
      0080C1 72 17 00 20      [ 1]  184 	bres flags,#FSLEEP 
      0080C5 80               [11]  185 	iret
      0080C6 72 00 00 20 03   [ 2]  186 2$:	btjt flags,#FRUN,4$
      0080CB CC 81 04         [ 2]  187 	jp 9$ 
      0080CE                        188 4$:	; program interrupted by user 
      0080CE 72 11 00 20      [ 1]  189 	bres flags,#FRUN 
      0080D2 AE 81 0C         [ 2]  190 	ldw x,#USER_ABORT
      0080D5 CD 82 53         [ 4]  191 	call puts 
      0080D8 CE 00 05         [ 2]  192 	ldw x,basicptr
      0080DB FE               [ 2]  193 	ldw x,(x)
                                    194 ; print line number 
      0080DC 35 0A 00 07      [ 1]  195 	mov base,#10 
      0080E0 35 06 00 21      [ 1]  196 	mov tab_width,#6
      0080E4 CD 8A 28         [ 4]  197 	call print_int  	
      0080E7 CE 00 05         [ 2]  198 	ldw x,basicptr 
      0080EA 1C 00 03         [ 2]  199 	addw x,#3  
      0080ED CD 82 53         [ 4]  200 	call puts 
      0080F0 A6 0D            [ 1]  201 	ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      0080F2 CD 82 41         [ 4]  202 	call putc
      0080F5 5F               [ 1]  203 	clrw x  
      0080F6 C6 00 02         [ 1]  204 	ld a,in 
      0080F9 AB 03            [ 1]  205 	add a,#3 ; adjustment for line number display 
      0080FB 97               [ 1]  206 	ld xl,a 
      0080FC CD 82 7B         [ 4]  207 	call spaces 
      0080FF A6 5E            [ 1]  208 	ld a,#'^
      008101 CD 82 41         [ 4]  209 	call putc 
      008104                        210 9$:
      008104 AE 17 FF         [ 2]  211     ldw x,#STACK_EMPTY 
      008107 94               [ 1]  212     ldw sp,x
      008108 9A               [ 1]  213 	rim 
      008109 CC 88 03         [ 2]  214 	jp warm_start
                                    215 
      00810C 0A 50 72 6F 67 72 61   216 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    217 
                                    218 ;----------------------------------------
                                    219 ; inialize MCU clock 
                                    220 ; input:
                                    221 ;   A 		source  HSI | 1 HSE 
                                    222 ;   XL      CLK_CKDIVR , clock divisor 
                                    223 ; output:
                                    224 ;   none 
                                    225 ;----------------------------------------
      008127                        226 clock_init:	
      008127 C1 50 C3         [ 1]  227 	cp a,CLK_CMSR 
      00812A 27 0C            [ 1]  228 	jreq 2$ ; no switching required 
                                    229 ; select clock source 
      00812C 72 12 50 C5      [ 1]  230 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008130 C7 50 C4         [ 1]  231 	ld CLK_SWR,a
      008133 C1 50 C3         [ 1]  232 1$:	cp a,CLK_CMSR
      008136 26 FB            [ 1]  233 	jrne 1$
      008138                        234 2$: 	
                                    235 ; HSI and cpu clock divisor 
      008138 9F               [ 1]  236 	ld a,xl 
      008139 C7 50 C6         [ 1]  237 	ld CLK_CKDIVR,a  
      00813C 81               [ 4]  238 	ret
                                    239 
                                    240 ;---------------------------------
                                    241 ; TIM4 is configured to generate an 
                                    242 ; interrupt every millisecond 
                                    243 ;----------------------------------
      00813D                        244 timer4_init:
      00813D 72 18 50 C7      [ 1]  245 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      008141 35 07 53 45      [ 1]  246 	mov TIM4_PSCR,#7 ; prescale 128  
      008145 35 7D 53 46      [ 1]  247 	mov TIM4_ARR,#125 ; set for 1msec.
      008149 35 05 53 40      [ 1]  248 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00814D 72 10 53 41      [ 1]  249 	bset TIM4_IER,#TIM4_IER_UIE 
      008151 81               [ 4]  250 	ret
                                    251 
                                    252 
                                    253 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    254 ; unlock EEPROM for writing/erasing
                                    255 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    256 ; input:
                                    257 ;  none
                                    258 ; output:
                                    259 ;  none 
                                    260 ;----------------------------------
      008152                        261 unlock_eeprom:
      008152 35 AE 50 64      [ 1]  262 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008156 35 56 50 64      [ 1]  263     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00815A 72 07 50 5F FB   [ 2]  264 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00815F 81               [ 4]  265 	ret
                                    266 
                                    267 ;----------------------------------
                                    268 ; unlock FLASH for writing/erasing
                                    269 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    270 ; input:
                                    271 ;  none
                                    272 ; output:
                                    273 ;  none
                                    274 ;----------------------------------
      008160                        275 unlock_flash:
      008160 35 56 50 62      [ 1]  276 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008164 35 AE 50 62      [ 1]  277 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008168 72 03 50 5F FB   [ 2]  278 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00816D 81               [ 4]  279 	ret
                                    280 
                           000000   281 	BLOCK_ERASE=0
                                    282 ;----------------------------
                                    283 ; erase block code must be 
                                    284 ;executed from RAM
                                    285 ;-----------------------------
                           000000   286 .if BLOCK_ERASE 
                                    287 ; this code is copied to RAM 
                                    288 erase_start:
                                    289 	clr a 
                                    290     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    291     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    292 	ldf [farptr],a
                                    293     inc farptr+2 
                                    294     ldf [farptr],a
                                    295     inc farptr+2 
                                    296     ldf [farptr],a
                                    297     inc farptr+2 
                                    298     ldf [farptr],a
                                    299 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    300 	ret
                                    301 erase_end:
                                    302 
                                    303 ; copy erase_start in RAM 
                                    304 move_code_in_ram:
                                    305 	ldw x,#erase_end 
                                    306 	subw x,#erase_start
                                    307 	ldw acc16,x 
                                    308 	ldw x,#pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    309 	ldw y,#erase_start 
                                    310 	call move 
                                    311 	ret 
                                    312 
                                    313 ;-----------------------------------
                                    314 ; erase flash or EEPROM block 
                                    315 ; a block is 128 bytes 
                                    316 ; input:
                                    317 ;   farptr  address block begin
                                    318 ; output:
                                    319 ;   none
                                    320 ;--------------------------------------
                                    321 erase_block:
                                    322 	ldw x,farptr+1 
                                    323 	pushw x 
                                    324 	call move_code_in_ram 
                                    325 	popw x 
                                    326 	ldw farptr+1,x 
                                    327 	tnz farptr
                                    328 	jrne erase_flash 
                                    329 	ldw x,#FLASH_BASE 
                                    330 	cpw x,farptr+1 
                                    331 	jrpl erase_flash 
                                    332 ; erase eeprom block
                                    333 	call unlock_eeprom 
                                    334 	sim 
                                    335 	call pad   
                                    336 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    337 	rim 
                                    338 	ret 
                                    339 ; erase flash block:
                                    340 erase_flash:
                                    341 	call unlock_flash 
                                    342 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    343 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    344 	clr a 
                                    345 	sim 
                                    346 	call pad 
                                    347     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    348 	rim 
                                    349 	ret 
                                    350 .endif ; BLOCK_ERASE 
                                    351 
                                    352 
                                    353 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    354 ; write a byte to FLASH or EEPROM 
                                    355 ; input:
                                    356 ;    a  		byte to write
                                    357 ;    farptr  	address
                                    358 ;    x          farptr[x]
                                    359 ; output:
                                    360 ;    none
                                    361 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    362 	; variables locales
                           000001   363 	BTW = 1   ; byte to write offset on stack
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                           000002   364 	OPT = 2   ; OPTION flag offset on stack
                           000002   365 	VSIZE = 2
      00816E                        366 write_byte:
      00816E 90 89            [ 2]  367 	pushw y
      0000F0                        368 	_vars VSIZE
      008170 52 02            [ 2]    1     sub sp,#VSIZE 
      008172 6B 01            [ 1]  369 	ld (BTW,sp),a ; byte to write 
      008174 0F 02            [ 1]  370 	clr (OPT,sp)  ; OPTION flag
                                    371 ; put addr[15:0] in Y, for bounds check.
      008176 90 CE 00 12      [ 2]  372 	ldw y,farptr+1   ; Y=addr15:0
                                    373 ; check addr[23:16], if <> 0 then it is extened flash memory
      00817A 72 5D 00 11      [ 1]  374 	tnz farptr 
      00817E 26 14            [ 1]  375 	jrne write_flash
      008180 90 A3 A4 00      [ 2]  376     cpw y,#user_space
      008184 24 0E            [ 1]  377     jruge write_flash
      008186 90 A3 40 00      [ 2]  378 	cpw y,#EEPROM_BASE  
      00818A 25 52            [ 1]  379     jrult write_exit
      00818C 90 A3 48 00      [ 2]  380 	cpw y,#OPTION_BASE
      008190 25 18            [ 1]  381 	jrult write_eeprom
      008192 20 4A            [ 2]  382     jra write_exit
                                    383 ; write program memory
      008194                        384 write_flash:
      008194 CD 81 60         [ 4]  385 	call unlock_flash 
      008197 9B               [ 1]  386 1$:	sim 
      008198 7B 01            [ 1]  387 	ld a,(BTW,sp)
      00819A 92 A7 00 11      [ 4]  388 	ldf ([farptr],x),a ; farptr[x]=A
      00819E 72 05 50 5F FB   [ 2]  389 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081A3 9A               [ 1]  390     rim 
      0081A4 72 13 50 5F      [ 1]  391     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0081A8 20 34            [ 2]  392     jra write_exit
                                    393 ; write eeprom and option
      0081AA                        394 write_eeprom:
      0081AA CD 81 52         [ 4]  395 	call unlock_eeprom
                                    396 	; check for data eeprom or option eeprom
      0081AD 90 A3 48 00      [ 2]  397 	cpw y,#OPTION_BASE
      0081B1 2B 08            [ 1]  398 	jrmi 1$
      0081B3 90 A3 48 80      [ 2]  399 	cpw y,#OPTION_END+1
      0081B7 2A 02            [ 1]  400 	jrpl 1$
      0081B9 03 02            [ 1]  401 	cpl (OPT,sp)
      0081BB                        402 1$: 
      0081BB 0D 02            [ 1]  403     tnz (OPT,sp)
      0081BD 27 08            [ 1]  404     jreq 2$
                                    405 	; pour modifier une option il faut modifier ces 2 bits
      0081BF 72 1E 50 5B      [ 1]  406     bset FLASH_CR2,#FLASH_CR2_OPT
      0081C3 72 1F 50 5C      [ 1]  407     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081C7                        408 2$: 
      0081C7 7B 01            [ 1]  409     ld a,(BTW,sp)
      0081C9 92 A7 00 11      [ 4]  410     ldf ([farptr],x),a
      0081CD 0D 02            [ 1]  411     tnz (OPT,sp)
      0081CF 27 08            [ 1]  412     jreq 3$
      0081D1 5C               [ 2]  413     incw x
      0081D2 7B 01            [ 1]  414     ld a,(BTW,sp)
      0081D4 43               [ 1]  415     cpl a
      0081D5 92 A7 00 11      [ 4]  416     ldf ([farptr],x),a
      0081D9 72 05 50 5F FB   [ 2]  417 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0081DE                        418 write_exit:
      00015E                        419 	_drop VSIZE 
      0081DE 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081E0 90 85            [ 2]  420 	popw y
      0081E2 81               [ 4]  421     ret
                                    422 
                                    423 ;--------------------------------------------
                                    424 ; write a data block to eeprom or flash 
                                    425 ; input:
                                    426 ;   Y        source address   
                                    427 ;   X        array index  destination  farptr[x]
                                    428 ;   BSIZE    block size bytes 
                                    429 ;   farptr   write address , byte* 
                                    430 ; output:
                                    431 ;	X 		after last byte written 
                                    432 ;   Y 		after last byte read 
                                    433 ;  farptr   point after block
                                    434 ;---------------------------------------------
      0081E3                        435 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000163                        436 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    437 	; local var 
                           000001   438 	XSAVE=1 
                           000002   439 	VSIZE=2 
      000163                        440 write_block:
      000163                        441 	_vars VSIZE
      0081E3 52 02            [ 2]    1     sub sp,#VSIZE 
      0081E5 1F 01            [ 2]  442 	ldw (XSAVE,sp),x 
      0081E7 1E 05            [ 2]  443 	ldw x,(BSIZE,sp) 
      0081E9 27 13            [ 1]  444 	jreq 9$
      0081EB 1E 01            [ 2]  445 1$:	ldw x,(XSAVE,sp)
      0081ED 90 F6            [ 1]  446 	ld a,(y)
      0081EF CD 81 6E         [ 4]  447 	call write_byte 
      0081F2 5C               [ 2]  448 	incw x 
      0081F3 90 5C            [ 2]  449 	incw y 
      0081F5 1F 01            [ 2]  450 	ldw (XSAVE,sp),x
      0081F7 1E 05            [ 2]  451 	ldw x,(BSIZE,sp)
      0081F9 5A               [ 2]  452 	decw x
      0081FA 1F 05            [ 2]  453 	ldw (BSIZE,sp),x 
      0081FC 26 ED            [ 1]  454 	jrne 1$
      0081FE                        455 9$:
      0081FE 1E 01            [ 2]  456 	ldw x,(XSAVE,sp)
      008200 CD 9B 9B         [ 4]  457 	call incr_farptr
      000183                        458 	_drop VSIZE
      008203 5B 02            [ 2]    1     addw sp,#VSIZE 
      008205 81               [ 4]  459 	ret 
                                    460 
                                    461 
                                    462 ;---------------------------------------------
                                    463 ;   UART1 subroutines
                                    464 ;---------------------------------------------
                                    465 
                                    466 ;---------------------------------------------
                                    467 ; initialize UART1, 115200 8N1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    468 ; input:
                                    469 ;	none
                                    470 ; output:
                                    471 ;   none
                                    472 ;---------------------------------------------
      008206                        473 uart1_init:
      008206 72 1A 50 02      [ 1]  474     bset PA_DDR,#UART1_TX_PIN
      00820A 72 1A 50 03      [ 1]  475     bset PA_CR1,#UART1_TX_PIN 
      00820E 72 1A 50 04      [ 1]  476     bset PA_CR2,#UART1_TX_PIN 
                                    477 ; enable UART1 clock
      008212 72 14 50 C7      [ 1]  478 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008216                        479 uart1_set_baud: 
                                    480 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    481 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008216 A6 E1            [ 1]  482 	ld a,#CLK_SWR_HSI
      008218 C1 50 C3         [ 1]  483 	cp a,CLK_CMSR 
      00821B 27 0A            [ 1]  484 	jreq 2$ 
      00821D                        485 1$: ; 8 Mhz 	
      00821D 35 05 52 33      [ 1]  486 	mov UART1_BRR2,#0x05 ; must be loaded first
      008221 35 04 52 32      [ 1]  487 	mov UART1_BRR1,#0x4
      008225 20 08            [ 2]  488 	jra 3$
      008227                        489 2$: ; 16 Mhz 	
      008227 35 0B 52 33      [ 1]  490 	mov UART1_BRR2,#0x0b ; must be loaded first
      00822B 35 08 52 32      [ 1]  491 	mov UART1_BRR1,#0x08
      00822F                        492 3$:
      00822F 72 5F 52 31      [ 1]  493     clr UART1_DR
      008233 35 0C 52 35      [ 1]  494 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
      008237 72 10 52 35      [ 1]  495 	bset UART1_CR2,#UART_CR2_SBK
      00823B 72 0D 52 30 FB   [ 2]  496     btjf UART1_SR,#UART_SR_TC,.
      008240 81               [ 4]  497     ret
                                    498 
                                    499 ;---------------------------------
                                    500 ; send character to UART1 
                                    501 ; input:
                                    502 ;   A 
                                    503 ; output:
                                    504 ;   none 
                                    505 ;--------------------------------	
      008241                        506 putc:
      008241 72 0F 52 30 FB   [ 2]  507 	btjf UART1_SR,#UART_SR_TXE,.
      008246 C7 52 31         [ 1]  508 	ld UART1_DR,a 
      008249 81               [ 4]  509 	ret 
                                    510 
                                    511 ;---------------------------------
                                    512 ; wait character from UART1 
                                    513 ; input:
                                    514 ;   none
                                    515 ; output:
                                    516 ;   A 			char  
                                    517 ;--------------------------------	
      00824A                        518 getc:
      00824A 72 0B 52 30 FB   [ 2]  519 	btjf UART1_SR,#UART_SR_RXNE,.
      00824F C6 52 31         [ 1]  520 	ld a,UART1_DR 
      008252 81               [ 4]  521 	ret 
                                    522 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    523 ;-----------------------------
                                    524 ; send an ASCIZ string to UART1 
                                    525 ; input: 
                                    526 ;   x 		char * 
                                    527 ; output:
                                    528 ;   none 
                                    529 ;-------------------------------
      008253                        530 puts:
      008253 F6               [ 1]  531     ld a,(x)
      008254 27 06            [ 1]  532 	jreq 1$
      008256 CD 82 41         [ 4]  533 	call putc 
      008259 5C               [ 2]  534 	incw x 
      00825A 20 F7            [ 2]  535 	jra puts 
      00825C 81               [ 4]  536 1$:	ret 
                                    537 
                                    538 
                                    539 ;---------------------------
                                    540 ; delete character at left 
                                    541 ; of cursor on terminal 
                                    542 ; input:
                                    543 ;   none 
                                    544 ; output:
                                    545 ;	none 
                                    546 ;---------------------------
      00825D                        547 bksp:
      00825D A6 08            [ 1]  548 	ld a,#BSP 
      00825F CD 82 41         [ 4]  549 	call putc 
      008262 A6 20            [ 1]  550 	ld a,#SPACE 
      008264 CD 82 41         [ 4]  551 	call putc 
      008267 A6 08            [ 1]  552 	ld a,#BSP 
      008269 CD 82 41         [ 4]  553 	call putc 
      00826C 81               [ 4]  554 	ret 
                                    555 ;---------------------------
                                    556 ; delete n character left of cursor 
                                    557 ; at terminal.
                                    558 ; input: 
                                    559 ;   A   	number of characters to delete.
                                    560 ; output:
                                    561 ;    none 
                                    562 ;--------------------------	
      00826D                        563 delete:
      00826D 88               [ 1]  564 	push a 
      00826E 0D 01            [ 1]  565 0$:	tnz (1,sp)
      008270 27 07            [ 1]  566 	jreq 1$
      008272 CD 82 5D         [ 4]  567 	call bksp 
      008275 0A 01            [ 1]  568 	dec (1,sp)
      008277 20 F5            [ 2]  569 	jra 0$
      008279 84               [ 1]  570 1$:	pop a 
      00827A 81               [ 4]  571 	ret
                                    572 
                                    573 ;--------------------------
                                    574 ; print n spaces on terminal
                                    575 ; input:
                                    576 ;  X 		number of spaces 
                                    577 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    578 ;	none 
                                    579 ;---------------------------
      00827B                        580 spaces:
      00827B A6 20            [ 1]  581 	ld a,#SPACE 
      00827D 5D               [ 2]  582 1$:	tnzw x
      00827E 27 06            [ 1]  583 	jreq 9$
      008280 CD 82 41         [ 4]  584 	call putc 
      008283 5A               [ 2]  585 	decw x
      008284 20 F7            [ 2]  586 	jra 1$
      008286                        587 9$: 
      008286 81               [ 4]  588 	ret 
                                    589 
                           000001   590 .if DEBUG 
                                    591 ;---------------------------------
                                    592 ;; print actual registers states 
                                    593 ;; as pushed on stack 
                                    594 ;; {Y,X,CC,A}
                                    595 ;---------------------------------
      008287                        596 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      000207                        597 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      000207                        598 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      000207                        599 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      000207                        600 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      000207                        601 prt_regs:
      008287 AE 82 CA         [ 2]  602 	ldw x,#regs_state 
      00828A CD 82 53         [ 4]  603 	call puts
                                    604 ; register PC
      00828D 16 01            [ 2]  605 	ldw y,(1,sp)
      00828F AE 89 C5         [ 2]  606 	ldw x,#REG_EPC 
      008292 CD 89 16         [ 4]  607 	call prt_reg16 
                                    608 ; register CC 
      008295 7B 08            [ 1]  609 	ld a,(R_CC,sp)
      008297 AE 89 D6         [ 2]  610 	ldw x,#REG_CC 
      00829A CD 88 F1         [ 4]  611 	call prt_reg8 
                                    612 ; register A 
      00829D 7B 07            [ 1]  613 	ld a,(R_A,sp)
      00829F AE 89 D2         [ 2]  614 	ldw x,#REG_A 
      0082A2 CD 88 F1         [ 4]  615 	call prt_reg8 
                                    616 ; register X 
      0082A5 16 05            [ 2]  617 	ldw y,(R_X,sp)
      0082A7 AE 89 CE         [ 2]  618 	ldw x,#REG_X 
      0082AA CD 89 16         [ 4]  619 	call prt_reg16 
                                    620 ; register Y 
      0082AD 16 03            [ 2]  621 	ldw y,(R_Y,sp)
      0082AF AE 89 CA         [ 2]  622 	ldw x,#REG_Y 
      0082B2 CD 89 16         [ 4]  623 	call prt_reg16 
                                    624 ; register SP 
      0082B5 90 96            [ 1]  625 	ldw y,sp
      0082B7 72 A9 00 08      [ 2]  626 	addw y,#6+ARG_OFS  
      0082BB AE 89 DB         [ 2]  627 	ldw x,#REG_SP
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082BE CD 89 16         [ 4]  628 	call prt_reg16
      0082C1 A6 0D            [ 1]  629 	ld a,#CR 
      0082C3 CD 82 41         [ 4]  630 	call putc
      0082C6 CD 82 41         [ 4]  631 	call putc   
      0082C9 81               [ 4]  632 	ret 
                                    633 
      0082CA 0A 72 65 67 69 73 74   634 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    635 
                                    636 
                                    637 ;--------------------
                                    638 ; print content at address in hex.
                                    639 ; input:
                                    640 ;   X 	address to peek 
                                    641 ; output:
                                    642 ;	none 
                                    643 ;--------------------	
      0082F1                        644 prt_peek:
      0082F1 89               [ 2]  645 	pushw x 
      0082F2 CF 00 09         [ 2]  646 	ldw acc16,x 
      0082F5 72 5F 00 08      [ 1]  647 	clr acc24 
      0082F9 5F               [ 1]  648 	clrw x 
      0082FA A6 10            [ 1]  649 	ld a,#16 
      0082FC CD 89 E0         [ 4]  650 	call prti24 
      0082FF A6 3A            [ 1]  651 	ld a,#': 
      008301 CD 82 41         [ 4]  652 	call putc 
      008304 A6 20            [ 1]  653 	ld a,#SPACE 
      008306 CD 82 41         [ 4]  654 	call putc 
      008309 85               [ 2]  655 	popw x 
      00830A F6               [ 1]  656 	ld a,(x)
      00830B C7 00 0A         [ 1]  657 	ld acc8,a 
      00830E 5F               [ 1]  658 	clrw x 
      00830F A6 10            [ 1]  659 	ld a,#16 
      008311 CD 89 E0         [ 4]  660 	call prti24
      008314 81               [ 4]  661 	ret 
                                    662 .endif ; DEBUG  
                                    663 
                                    664 ;-------------------------------------
                                    665 ; retrun string length
                                    666 ; input:
                                    667 ;   X         .asciz  
                                    668 ; output:
                                    669 ;   X         length 
                                    670 ;-------------------------------------
      008315                        671 strlen:
      008315 90 93            [ 1]  672 	ldw y,x 
      008317 5F               [ 1]  673 	clrw x 
      008318 90 7D            [ 1]  674 1$:	tnz (y) 
      00831A 27 05            [ 1]  675 	jreq 9$ 
      00831C 5C               [ 2]  676 	incw x
      00831D 90 5C            [ 2]  677 	incw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00831F 20 F7            [ 2]  678 	jra 1$ 
      008321 81               [ 4]  679 9$: ret 
                                    680 
                                    681 ;------------------------------------
                                    682 ; compare 2 strings
                                    683 ; input:
                                    684 ;   X 		char* first string 
                                    685 ;   Y       char* second string 
                                    686 ; output:
                                    687 ;   A 		0|1 
                                    688 ;-------------------------------------
      008322                        689 strcmp:
      008322 F6               [ 1]  690 	ld a,(x)
      008323 27 0B            [ 1]  691 	jreq 5$ 
      008325 90 F1            [ 1]  692 	cp a,(y) 
      008327 26 05            [ 1]  693 	jrne 4$ 
      008329 5C               [ 2]  694 	incw x 
      00832A 90 5C            [ 2]  695 	incw y 
      00832C 20 F4            [ 2]  696 	jra strcmp 
      00832E                        697 4$: ; not same  
      00832E 4F               [ 1]  698 	clr a 
      00832F 81               [ 4]  699 	ret 
      008330                        700 5$: ; same 
      008330 A6 01            [ 1]  701 	ld a,#1 
      008332 81               [ 4]  702 	ret 
                                    703 
                                    704 
                                    705 ;---------------------------------------
                                    706 ;  copy src to dest 
                                    707 ; input:
                                    708 ;   X 		dest 
                                    709 ;   Y 		src 
                                    710 ; output: 
                                    711 ;   X 		dest 
                                    712 ;----------------------------------
      008333                        713 strcpy:
      008333 89               [ 2]  714 	pushw x 
      008334 90 F6            [ 1]  715 1$: ld a,(y)
      008336 27 06            [ 1]  716 	jreq 9$ 
      008338 F7               [ 1]  717 	ld (x),a 
      008339 5C               [ 2]  718 	incw x 
      00833A 90 5C            [ 2]  719 	incw y 
      00833C 20 F6            [ 2]  720 	jra 1$ 
      00833E 7F               [ 1]  721 9$:	clr (x)
      00833F 85               [ 2]  722 	popw x 
      008340 81               [ 4]  723 	ret 
                                    724 
                                    725 ;---------------------------------------
                                    726 ; move memory block 
                                    727 ; input:
                                    728 ;   X 		destination 
                                    729 ;   Y 	    source 
                                    730 ;   acc16	size 
                                    731 ; output:
                                    732 ;   none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                                    733 ;--------------------------------------
                           000001   734 	INCR=1 ; increament high byte 
                           000002   735 	LB=2 ; increament low byte 
                           000002   736 	VSIZE=2
      008341                        737 move:
      0002C1                        738 	_vars VSIZE 
      008341 52 02            [ 2]    1     sub sp,#VSIZE 
      008343 0F 01            [ 1]  739 	clr (INCR,sp)
      008345 0F 02            [ 1]  740 	clr (LB,sp)
      008347 90 89            [ 2]  741 	pushw y 
      008349 13 01            [ 2]  742 	cpw x,(1,sp) ; compare DEST to SRC 
      00834B 90 85            [ 2]  743 	popw y 
      00834D 27 31            [ 1]  744 	jreq move_exit ; x==y 
      00834F 2B 0E            [ 1]  745 	jrmi move_down
      008351                        746 move_up: ; start from top address with incr=-1
      008351 72 BB 00 09      [ 2]  747 	addw x,acc16
      008355 72 B9 00 09      [ 2]  748 	addw y,acc16
      008359 03 01            [ 1]  749 	cpl (INCR,sp)
      00835B 03 02            [ 1]  750 	cpl (LB,sp)   ; increment = -1 
      00835D 20 05            [ 2]  751 	jra move_loop  
      00835F                        752 move_down: ; start from bottom address with incr=1 
      00835F 5A               [ 2]  753     decw x 
      008360 90 5A            [ 2]  754 	decw y
      008362 0C 02            [ 1]  755 	inc (LB,sp) ; incr=1 
      008364                        756 move_loop:	
      008364 C6 00 09         [ 1]  757     ld a, acc16 
      008367 CA 00 0A         [ 1]  758 	or a, acc8
      00836A 27 14            [ 1]  759 	jreq move_exit 
      00836C 72 FB 01         [ 2]  760 	addw x,(INCR,sp)
      00836F 72 F9 01         [ 2]  761 	addw y,(INCR,sp) 
      008372 90 F6            [ 1]  762 	ld a,(y)
      008374 F7               [ 1]  763 	ld (x),a 
      008375 89               [ 2]  764 	pushw x 
      008376 CE 00 09         [ 2]  765 	ldw x,acc16 
      008379 5A               [ 2]  766 	decw x 
      00837A CF 00 09         [ 2]  767 	ldw acc16,x 
      00837D 85               [ 2]  768 	popw x 
      00837E 20 E4            [ 2]  769 	jra move_loop
      008380                        770 move_exit:
      000300                        771 	_drop VSIZE
      008380 5B 02            [ 2]    1     addw sp,#VSIZE 
      008382 81               [ 4]  772 	ret 	
                                    773 
                                    774 ;-------------------------------------
                                    775 ; search text area for a line with 
                                    776 ; same number as line#  
                                    777 ; input:
                                    778 ;	X 			line# 
                                    779 ; output:
                                    780 ;   X 			addr of line | 0 
                                    781 ;   Y           line#|insert address if not found  
                                    782 ;-------------------------------------
                           000001   783 	LL=1 ; line length 
                           000002   784 	LB=2 ; line length low byte 
                           000002   785 	VSIZE=2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      008383                        786 search_lineno:
      000303                        787 	_vars VSIZE
      008383 52 02            [ 2]    1     sub sp,#VSIZE 
      008385 0F 01            [ 1]  788 	clr (LL,sp)
      008387 90 CE 00 19      [ 2]  789 	ldw y,txtbgn
      00838B                        790 search_ln_loop:
      00838B 90 C3 00 1B      [ 2]  791 	cpw y,txtend 
      00838F 2A 10            [ 1]  792 	jrpl 8$
      008391 90 F3            [ 1]  793 	cpw x,(y)
      008393 27 0E            [ 1]  794 	jreq 9$
      008395 2B 0A            [ 1]  795 	jrmi 8$ 
      008397 90 E6 02         [ 1]  796 	ld a,(2,y)
      00839A 6B 02            [ 1]  797 	ld (LB,sp),a 
      00839C 72 F9 01         [ 2]  798 	addw y,(LL,sp)
      00839F 20 EA            [ 2]  799 	jra search_ln_loop 
      0083A1                        800 8$: 
      0083A1 5F               [ 1]  801 	clrw x 	
      0083A2 51               [ 1]  802 	exgw x,y 
      000323                        803 9$: _drop VSIZE
      0083A3 5B 02            [ 2]    1     addw sp,#VSIZE 
      0083A5 51               [ 1]  804 	exgw x,y   
      0083A6 81               [ 4]  805 	ret 
                                    806 
                                    807 ;-------------------------------------
                                    808 ; delete line at addr
                                    809 ; move new line to insert with end of text 
                                    810 ; otherwise it would be overwritten.
                                    811 ; input:
                                    812 ;   X 		addr of line i.e DEST for move 
                                    813 ;-------------------------------------
                           000001   814 	LLEN=1
                           000003   815 	SRC=3
                           000004   816 	VSIZE=4
      0083A7                        817 del_line: 
      000327                        818 	_vars VSIZE 
      0083A7 52 04            [ 2]    1     sub sp,#VSIZE 
      0083A9 E6 02            [ 1]  819 	ld a,(2,x) ; line length
      0083AB 6B 02            [ 1]  820 	ld (LLEN+1,sp),a 
      0083AD 0F 01            [ 1]  821 	clr (LLEN,sp)
      0083AF 90 93            [ 1]  822 	ldw y,x  
      0083B1 72 F9 01         [ 2]  823 	addw y,(LLEN,sp) ;SRC  
      0083B4 17 03            [ 2]  824 	ldw (SRC,sp),y  ;save source 
      0083B6 90 CE 00 1B      [ 2]  825 	ldw y,txtend 
      0083BA 90 E6 02         [ 1]  826 	ld a,(2,y)
      0083BD 90 5F            [ 1]  827 	clrw y 
      0083BF 90 97            [ 1]  828 	ld yl,a  
      0083C1 72 B9 00 1B      [ 2]  829 	addw y,txtend
      0083C5 72 F2 03         [ 2]  830 	subw y,(SRC,sp) ; y=count 
      0083C8 90 CF 00 09      [ 2]  831 	ldw acc16,y 
      0083CC 16 03            [ 2]  832 	ldw y,(SRC,sp)    ; source
      0083CE CD 83 41         [ 4]  833 	call move
      0083D1 90 CE 00 1B      [ 2]  834 	ldw y,txtend 
      0083D5 72 F2 01         [ 2]  835 	subw y,(LLEN,sp)
      0083D8 90 CF 00 1B      [ 2]  836 	ldw txtend,y  
      00035C                        837 	_drop VSIZE     
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0083DC 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083DE 81               [ 4]  838 	ret 
                                    839 
                                    840 ;---------------------------------------------
                                    841 ; create a gap in text area 
                                    842 ; move new line to insert in gap with end of text
                                    843 ; otherwise it would be overwritten.
                                    844 ; input:
                                    845 ;    X 			addr gap start 
                                    846 ;    Y 			gap length 
                                    847 ; output:
                                    848 ;    X 			addr gap start 
                                    849 ;--------------------------------------------
                           000001   850 	DEST=1
                           000003   851 	SRC=3
                           000005   852 	LEN=5
                           000006   853 	VSIZE=6 
      0083DF                        854 create_gap:
      00035F                        855 	_vars VSIZE
      0083DF 52 06            [ 2]    1     sub sp,#VSIZE 
      0083E1 1F 03            [ 2]  856 	ldw (SRC,sp),x 
      0083E3 17 05            [ 2]  857 	ldw (LEN,sp),y 
      0083E5 90 CF 00 09      [ 2]  858 	ldw acc16,y 
      0083E9 90 93            [ 1]  859 	ldw y,x ; SRC
      0083EB 72 BB 00 09      [ 2]  860 	addw x,acc16  
      0083EF 1F 01            [ 2]  861 	ldw (DEST,sp),x 
                                    862 ;compute size to move 	
      0083F1 CE 00 1B         [ 2]  863 	ldw x,txtend 
      0083F4 E6 02            [ 1]  864 	ld a,(2,x) ; pending line length 
      0083F6 C7 00 0A         [ 1]  865 	ld acc8,a 
      0083F9 72 5F 00 09      [ 1]  866 	clr acc16 
      0083FD 72 BB 00 09      [ 2]  867 	addw x,acc16 
      008401 72 F0 03         [ 2]  868 	subw x,(SRC,sp)
      008404 CF 00 09         [ 2]  869 	ldw acc16,x ; size to move
      008407 1E 01            [ 2]  870 	ldw x,(DEST,sp) 
      008409 CD 83 41         [ 4]  871 	call move
      00840C CE 00 1B         [ 2]  872 	ldw x,txtend
      00840F 72 FB 05         [ 2]  873 	addw x,(LEN,sp)
      008412 CF 00 1B         [ 2]  874 	ldw txtend,x
      000395                        875 9$:	_drop VSIZE 
      008415 5B 06            [ 2]    1     addw sp,#VSIZE 
      008417 81               [ 4]  876 	ret 
                                    877 
                                    878 
                                    879 ;--------------------------------------------
                                    880 ; insert line in tib into text area 
                                    881 ; first search for already existing 
                                    882 ; replace existing 
                                    883 ; if strlen(tib)==0 delete existing 
                                    884 ; input:
                                    885 ;   ptr16 				pointer to tokenized line  
                                    886 ; output:
                                    887 ;   none
                                    888 ;---------------------------------------------
                           000001   889 	DEST=1  ; text area insertion address 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                           000003   890 	SRC=3   ; str to insert address 
                           000005   891 	LINENO=5 ; line number 
                           000007   892 	LLEN=7 ; line length 
                           000008   893 	VSIZE=8  
      008418                        894 insert_line:
      000398                        895 	_vars VSIZE 
      008418 52 08            [ 2]    1     sub sp,#VSIZE 
      00841A CE 00 12         [ 2]  896 	ldw x,ptr16  
      00841D C3 00 19         [ 2]  897 	cpw x,txtbgn 
      008420 26 0D            [ 1]  898 	jrne 0$
                                    899 ;first text line 
      008422 AE 00 02         [ 2]  900 	ldw x,#2 
      008425 72 D6 00 12      [ 4]  901 	ld a,([ptr16],x)
      008429 5F               [ 1]  902 	clrw x 
      00842A 97               [ 1]  903 	ld xl,a
      00842B 1F 07            [ 2]  904 	ldw (LLEN,sp),x  
      00842D 20 45            [ 2]  905 	jra 5$
      00842F 72 CE 00 12      [ 5]  906 0$:	ldw x,[ptr16]
                                    907 ; new line number
      008433 1F 05            [ 2]  908 	ldw (LINENO,sp),x 
      008435 AE 00 02         [ 2]  909 	ldw x,#2 
      008438 72 D6 00 12      [ 4]  910 	ld a,([ptr16],x)
      00843C 97               [ 1]  911 	ld xl,a
                                    912 ; new line length
      00843D 1F 07            [ 2]  913 	ldw (LLEN,sp),x
                                    914 ; check if that line number already exit 	
      00843F 1E 05            [ 2]  915 	ldw x,(LINENO,sp)
      008441 CD 83 83         [ 4]  916 	call search_lineno 
      008444 5D               [ 2]  917 	tnzw x 
      008445 26 04            [ 1]  918 	jrne 2$
                                    919 ; line doesn't exit
                                    920 ; it will be inserted at this point.  	
      008447 17 01            [ 2]  921 	ldw (DEST,sp),y 
      008449 20 05            [ 2]  922 	jra 3$
                                    923 ; line exit delete it.
                                    924 ; it will be replaced by new one 	
      00844B 1F 01            [ 2]  925 2$: ldw (DEST,sp),x 
      00844D CD 83 A7         [ 4]  926 	call del_line
      008450                        927 3$: 
                                    928 ; insert new line or leave if LLEN==3
                                    929 ; LLEN==3 means empty line 
      008450 A6 03            [ 1]  930 	ld a,#3
      008452 11 08            [ 1]  931 	cp a,(LLEN+1,sp)
      008454 27 27            [ 1]  932 	jreq insert_ln_exit ; empty line exit.
                                    933 ; if insertion point at txtend 
                                    934 ; no move required 
      008456 1E 01            [ 2]  935 	ldw x,(DEST,sp)
      008458 C3 00 1B         [ 2]  936 	cpw x,txtend 
      00845B 2A 17            [ 1]  937 	jrpl 5$ 
                                    938 ; must create a gap
                                    939 ; at insertion point  
      00845D 1E 01            [ 2]  940 	ldw x,(DEST,sp)
      00845F 16 07            [ 2]  941 	ldw y,(LLEN,sp)
      008461 CD 83 DF         [ 4]  942 	call create_gap 
                                    943 ; move new line in gap 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008464 1E 07            [ 2]  944 	ldw x,(LLEN,sp)
      008466 CF 00 09         [ 2]  945 	ldw acc16,x 
      008469 90 CE 00 1B      [ 2]  946 	ldw y,txtend ;SRC 
      00846D 1E 01            [ 2]  947 	ldw x,(DEST,sp) ; dest address 
      00846F CD 83 41         [ 4]  948 	call move 
      008472 20 09            [ 2]  949 	jra insert_ln_exit  
      008474                        950 5$: ; no move required 
      008474 1E 07            [ 2]  951 	ldw x,(LLEN,sp) 
      008476 72 BB 00 1B      [ 2]  952 	addw x,txtend 
      00847A CF 00 1B         [ 2]  953 	ldw txtend,x 
      00847D                        954 insert_ln_exit:	
      0003FD                        955 	_drop VSIZE
      00847D 5B 08            [ 2]    1     addw sp,#VSIZE 
      00847F 81               [ 4]  956 	ret
                                    957 
                                    958 
                                    959 ;-----------------------------
                                    960 ; check if text buffer full
                                    961 ; input:
                                    962 ;   ptr16     addr start tokenize line 
                                    963 ;   X         buffer index 
                                    964 ; output:
                                    965 ;   none 
                                    966 ;-----------------------------------
      008480                        967 check_full:
      008480 72 BB 00 12      [ 2]  968 	addw x,ptr16 
      008484 A3 16 C8         [ 2]  969 	cpw x,#tib 
      008487 25 05            [ 1]  970 	jrult 1$
      008489 A6 01            [ 1]  971 	ld a,#ERR_MEM_FULL
      00848B CC 87 B1         [ 2]  972 	jp tb_error 
      00848E 81               [ 4]  973 1$: ret 
                                    974 
                                    975 
                                    976 ;-----------------------------------
                                    977 ; create token list form text line 
                                    978 ; save this list in text area
                                    979 ; input:
                                    980 ;   none
                                    981 ; output:
                                    982 ;   basicptr     token list buffer
                                    983 ;   line# 		 BASIC line number 
                                    984 ;   in.w  		 cleared 
                                    985 ;-----------------------------------
                                    986 	.macro _incr_ptr16 n 
                                    987 	ldw x,#n 
                                    988 	addw x,ptr16 
                                    989 	ldw ptr16,x 
                                    990 	.endm 
                                    991 
                           000001   992 	XSAVE=1
                           000003   993 	BUFIDX=3
                           000004   994 	VSIZE=4
      00848F                        995 compile:
      00040F                        996 	_vars VSIZE 
      00848F 52 04            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008491 72 1A 00 20      [ 1]  997 	bset flags,#FCOMP 
      008495 CE 00 1B         [ 2]  998 	ldw x,txtend
      008498 CF 00 12         [ 2]  999 	ldw ptr16,x 
      00849B 5F               [ 1] 1000 	clrw x 
      00849C AE 00 03         [ 2] 1001 	ldw x,#3
      00849F 1F 03            [ 2] 1002 	ldw (BUFIDX,sp),X  
      0084A1 CD 84 80         [ 4] 1003 	call check_full
      0084A4 5F               [ 1] 1004 	clrw x 
      0084A5 72 CF 00 12      [ 5] 1005 	ldw [ptr16],x 
      0084A9 CD 8D 8F         [ 4] 1006 	call get_token
      0084AC 1F 01            [ 2] 1007 	ldw (XSAVE,sp),x 
      0084AE A1 04            [ 1] 1008 	cp a,#TK_INTGR 
      0084B0 26 11            [ 1] 1009 	jrne 3$
      0084B2 A3 00 00         [ 2] 1010 	cpw x,#0  
      0084B5 22 03            [ 1] 1011 	jrugt 1$
      0084B7 CC 87 AF         [ 2] 1012 	jp syntax_error 
      0084BA 72 CF 00 12      [ 5] 1013 1$:	ldw [ptr16],x; line number
      0084BE CD 8D 8F         [ 4] 1014 2$:	call get_token
      0084C1 1F 01            [ 2] 1015 	ldw (XSAVE,sp),x 
      0084C3 A1 00            [ 1] 1016 3$:	cp a,#TK_NONE 
      0084C5 26 03            [ 1] 1017 	jrne 30$
      0084C7 CC 85 5A         [ 2] 1018 	jp 9$
      0084CA                       1019 30$: 	 
      0084CA 1E 03            [ 2] 1020 	ldw x,(BUFIDX,sp)
      0084CC CD 84 80         [ 4] 1021 	call check_full 
      0084CF 16 03            [ 2] 1022 	ldw y,(BUFIDX,sp) 
      0084D1 91 D7 12         [ 4] 1023 	ld ([ptr16],y),a ; token attribute 
      0084D4 90 5C            [ 2] 1024 	incw y
      0084D6 17 03            [ 2] 1025 	ldw (BUFIDX,sp),y
      0084D8 A1 01            [ 1] 1026 	cp a,#TK_COLON 
      0084DA 26 02            [ 1] 1027 	jrne 31$
      0084DC 20 E0            [ 2] 1028 	jra 2$ 
      0084DE                       1029 31$:
      0084DE A1 03            [ 1] 1030 	cp a,#TK_CHAR
      0084E0 26 0C            [ 1] 1031 	jrne 32$ 
      0084E2 1E 01            [ 2] 1032 	ldw x,(XSAVE,sp)
      0084E4 9F               [ 1] 1033 	ld a,xl 
      0084E5 91 D7 12         [ 4] 1034 	ld ([ptr16],y),a
      0084E8 90 5C            [ 2] 1035 	incw y 
      0084EA 17 03            [ 2] 1036 	ldw (BUFIDX,sp),y 
      0084EC 20 D0            [ 2] 1037 	jra 2$ 
      0084EE                       1038 32$:
      0084EE A1 02            [ 1] 1039 	cp a,#TK_ARRAY 
      0084F0 27 CC            [ 1] 1040 	jreq 2$ 
      0084F2 A1 0A            [ 1] 1041 	cp a,#TK_QSTR 
      0084F4 26 25            [ 1] 1042 	jrne 4$
      0084F6 AE 17 18         [ 2] 1043 	ldw x,#pad 
      0084F9 CD 83 15         [ 4] 1044 	call strlen
      0084FC 5C               [ 2] 1045 	incw x  
      0084FD CD 84 80         [ 4] 1046 	call check_full 
      008500 90 AE 17 18      [ 2] 1047 	ldw y,#pad 
      008504 CE 00 12         [ 2] 1048 	ldw x,ptr16
      008507 72 FB 03         [ 2] 1049 	addw x,(BUFIDX,sp)	
      00850A CD 83 33         [ 4] 1050 	call strcpy 
      00850D AE 17 18         [ 2] 1051 	ldw x,#pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008510 CD 83 15         [ 4] 1052 	call strlen 
      008513 5C               [ 2] 1053 	incw x
      008514 72 FB 03         [ 2] 1054 	addw x,(BUFIDX,sp) 
      008517 1F 03            [ 2] 1055 	ldw (BUFIDX,sp),x
      008519 20 A3            [ 2] 1056 	jra 2$  
      00851B A1 04            [ 1] 1057 4$: cp a,#TK_INTGR
      00851D 25 9F            [ 1] 1058 	jrult 2$
      00851F A1 09            [ 1] 1059 	cp a,#TK_CONST 
      008521 22 9B            [ 1] 1060 	Jrugt 2$
      008523 1E 01            [ 2] 1061 	ldw x,(XSAVE,sp) 
      008525 16 03            [ 2] 1062 	ldw y,(BUFIDX,sp)
      008527 91 DF 12         [ 5] 1063 	ldw ([ptr16],y),x
      00852A A3 97 A4         [ 2] 1064 	cpw x,#rem 
      00852D 26 22            [ 1] 1065 	jrne 5$	
                                   1066 ; comment advance in.w to eol 
      00852F 72 A9 00 02      [ 2] 1067 	addw y,#2 ; skip exec address 
      008533 17 03            [ 2] 1068 	ldw (BUFIDX,sp),y 
      008535 CE 00 12         [ 2] 1069 	ldw x,ptr16 
      008538 72 FB 03         [ 2] 1070 	addw x,(BUFIDX,sp)
      00853B 90 CE 00 01      [ 2] 1071 	ldw y,in.w 
      00853F 72 A9 16 C8      [ 2] 1072 	addw y,#tib 
      008543 CD 83 33         [ 4] 1073 	call strcpy 	
      008546 CD 83 15         [ 4] 1074 	call strlen 
      008549 5C               [ 2] 1075 	incw x ; skip string 0. 
      00854A 72 FB 03         [ 2] 1076 	addw x,(BUFIDX,sp)
      00854D 1F 03            [ 2] 1077 	ldw (BUFIDX,sp),x 
      00854F 20 09            [ 2] 1078 	jra 9$
      008551 72 A9 00 02      [ 2] 1079 5$:	addw y,#2 
      008555 17 03            [ 2] 1080 	ldw (BUFIDX,sp),y 
      008557 CC 84 BE         [ 2] 1081 	jp 2$
      00855A                       1082 9$: 
      00855A AE 00 02         [ 2] 1083 	ldw x,#2
      00855D 16 03            [ 2] 1084 	ldw y,(BUFIDX,sp)
      00855F 90 9F            [ 1] 1085 	ld a,yl 
      008561 72 D7 00 12      [ 4] 1086 	ld ([ptr16],x),a  	
      008565 72 CE 00 12      [ 5] 1087 	ldw x,[ptr16]
      008569 27 09            [ 1] 1088 	jreq 10$
      00856B CD 84 18         [ 4] 1089 	call insert_line
      00856E 72 5F 00 04      [ 1] 1090 	clr  count 
      008572 20 0F            [ 2] 1091 	jra  11$ 
      008574                       1092 10$: 
      008574 CE 00 12         [ 2] 1093 	ldw x,ptr16 
      008577 CF 00 05         [ 2] 1094 	ldw basicptr,x 
      00857A E6 02            [ 1] 1095 	ld a,(2,x)
      00857C C7 00 04         [ 1] 1096 	ld count,a 
      00857F 35 03 00 02      [ 1] 1097 	mov in,#3 
      008583                       1098 11$:
      000503                       1099 	_drop VSIZE 
      008583 5B 04            [ 2]    1     addw sp,#VSIZE 
      008585 72 1B 00 20      [ 1] 1100 	bres flags,#FCOMP 
      008589 81               [ 4] 1101 	ret 
                                   1102 
                                   1103 
                                   1104 ;------------------------------------
                                   1105 ;  set all variables to zero 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1106 ; input:
                                   1107 ;   none 
                                   1108 ; output:
                                   1109 ;	none
                                   1110 ;------------------------------------
      00858A                       1111 clear_vars:
      00858A AE 00 22         [ 2] 1112 	ldw x,#vars 
      00858D 90 AE 00 34      [ 2] 1113 	ldw y,#2*26 
      008591 7F               [ 1] 1114 1$:	clr (x)
      008592 5C               [ 2] 1115 	incw x 
      008593 90 5A            [ 2] 1116 	decw y 
      008595 26 FA            [ 1] 1117 	jrne 1$
      008597 81               [ 4] 1118 	ret 
                                   1119 
                                   1120 ;-------------------------------------
                                   1121 ; check if A is a letter
                                   1122 ; input:
                                   1123 ;   A 			character to test 
                                   1124 ; output:
                                   1125 ;   C flag      1 true, 0 false 
                                   1126 ;-------------------------------------
      008598                       1127 is_alpha:
      008598 A1 41            [ 1] 1128 	cp a,#'A 
      00859A 8C               [ 1] 1129 	ccf
      00859B 24 0B            [ 1] 1130 	jrnc 9$ 
      00859D A1 5B            [ 1] 1131 	cp a,#'Z+1 
      00859F 25 07            [ 1] 1132 	jrc 9$ 
      0085A1 A1 61            [ 1] 1133 	cp a,#'a 
      0085A3 8C               [ 1] 1134 	ccf 
      0085A4 24 02            [ 1] 1135 	jrnc 9$
      0085A6 A1 7B            [ 1] 1136 	cp a,#'z+1   
      0085A8 81               [ 4] 1137 9$: ret 	
                                   1138 
                                   1139 ;-------------------------------------
                                   1140 ;  program initialization entry point 
                                   1141 ;-------------------------------------
                           000001  1142 	MAJOR=1
                           000000  1143 	MINOR=0
      0085A9 0A 0A 54 69 6E 79 20  1144 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0085EF                       1145 cold_start:
                                   1146 ;set stack 
      0085EF AE 17 FF         [ 2] 1147 	ldw x,#STACK_EMPTY
      0085F2 94               [ 1] 1148 	ldw sp,x   
                                   1149 ; clear all ram 
      0085F3 7F               [ 1] 1150 0$: clr (x)
      0085F4 5A               [ 2] 1151 	decw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      0085F5 26 FC            [ 1] 1152 	jrne 0$
                                   1153 ; activate pull up on all inputs 
      0085F7 A6 FF            [ 1] 1154 	ld a,#255 
      0085F9 C7 50 03         [ 1] 1155 	ld PA_CR1,a 
      0085FC C7 50 08         [ 1] 1156 	ld PB_CR1,a 
      0085FF C7 50 0D         [ 1] 1157 	ld PC_CR1,a 
      008602 C7 50 12         [ 1] 1158 	ld PD_CR1,a 
      008605 C7 50 17         [ 1] 1159 	ld PE_CR1,a 
      008608 C7 50 1C         [ 1] 1160 	ld PF_CR1,a 
      00860B C7 50 21         [ 1] 1161 	ld PG_CR1,a 
      00860E C7 50 2B         [ 1] 1162 	ld PI_CR1,a 
                                   1163 ; disable schmitt triggers on Arduino CN4 analog inputs
      008611 55 00 3F 54 07   [ 1] 1164 	mov ADC_TDRL,0x3f
                                   1165 ; disable peripherals clocks
                                   1166 ;	clr CLK_PCKENR1 
                                   1167 ;	clr CLK_PCKENR2
      008616 72 5F 50 F2      [ 1] 1168 	clr AWU_TBR 
      00861A 72 14 50 CA      [ 1] 1169 	bset CLK_PCKENR2,#2 ; enable LSI for beeper
                                   1170 ; select internal clock no divisor: 16 Mhz 	
      00861E A6 E1            [ 1] 1171 	ld a,#CLK_SWR_HSI 
      008620 5F               [ 1] 1172 	clrw x  
      008621 CD 81 27         [ 4] 1173     call clock_init 
      008624 CD 81 3D         [ 4] 1174 	call timer4_init
                                   1175 ; UART1 at 115200 BAUD
      008627 CD 82 06         [ 4] 1176 	call uart1_init
                                   1177 ; activate PE_4 (user button interrupt)
      00862A 72 18 50 18      [ 1] 1178     bset PE_CR2,#USR_BTN_BIT 
                                   1179 ; display system information
      00862E AE 85 A9         [ 2] 1180 	ldw x,#software 
      008631 CD 82 53         [ 4] 1181 	call puts 
      008634 A6 01            [ 1] 1182 	ld a,#MAJOR 
      008636 C7 00 0A         [ 1] 1183 	ld acc8,a 
      008639 5F               [ 1] 1184 	clrw x 
      00863A CF 00 08         [ 2] 1185 	ldw acc24,x 
      00863D A6 0A            [ 1] 1186 	ld a,#10 
      00863F CD 89 E0         [ 4] 1187 	call prti24 
      008642 A6 2E            [ 1] 1188 	ld a,#'.
      008644 CD 82 41         [ 4] 1189 	call putc 
      008647 A6 00            [ 1] 1190 	ld a,#MINOR 
      008649 C7 00 0A         [ 1] 1191 	ld acc8,a 
      00864C 5F               [ 1] 1192 	clrw x 
      00864D CF 00 08         [ 2] 1193 	ldw acc24,x 
      008650 A6 0A            [ 1] 1194 	ld a,#10 
      008652 CD 89 E0         [ 4] 1195 	call prti24 
      008655 A6 0D            [ 1] 1196 	ld a,#CR 
      008657 CD 82 41         [ 4] 1197 	call putc 
      00865A CD 9B A9         [ 4] 1198 	call seek_fdrive 
                                   1199 ; configure LD2 pin 
      00865D 72 1A 50 0D      [ 1] 1200     bset PC_CR1,#LED2_BIT
      008661 72 1A 50 0E      [ 1] 1201     bset PC_CR2,#LED2_BIT
      008665 72 1A 50 0C      [ 1] 1202     bset PC_DDR,#LED2_BIT
      008669 9A               [ 1] 1203 	rim 
      00866A 72 5C 00 10      [ 1] 1204 	inc seedy+1 
      00866E 72 5C 00 0E      [ 1] 1205 	inc seedx+1 
      008672 CD 86 81         [ 4] 1206 	call clear_basic
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      008675 CD 94 11         [ 4] 1207 	call ubound 
      008678 CD 90 2E         [ 4] 1208 	call dpop 
      00867B CF 00 1E         [ 2] 1209 	ldw array_size,x 
      00867E CC 88 03         [ 2] 1210     jp warm_start 
                                   1211 
                                   1212 ;---------------------------
                                   1213 ; reset BASIC text variables 
                                   1214 ; and clear variables 
                                   1215 ;---------------------------
      008681                       1216 clear_basic:
      008681 72 5F 00 04      [ 1] 1217 	clr count 
      008685 AE 00 56         [ 2] 1218 	ldw x,#free_ram 
      008688 CF 00 19         [ 2] 1219 	ldw txtbgn,x 
      00868B CF 00 1B         [ 2] 1220 	ldw txtend,x 
      00868E CD 85 8A         [ 4] 1221 	call clear_vars 
      008691 81               [ 4] 1222 	ret 
                                   1223 
                                   1224 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1225 ;;   Tiny BASIC error messages     ;;
                                   1226 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008692                       1227 err_msg:
      008692 00 00 86 AA 86 B8 86  1228 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             C7 86 E1 86 F1
      00869E 87 08 87 1F 87 3A 87  1229 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             4C 87 5E
      0086A8 87 6B                 1230 	.word err_no_access 
                                   1231 
      0086AA 0A 4D 65 6D 6F 72 79  1232 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      0086B8 0A 73 79 6E 74 61 78  1233 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      0086C7 0A 6D 61 74 68 20 6F  1234 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0086E1 0A 64 69 76 69 73 69  1235 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      0086F1 0A 69 6E 76 61 6C 69  1236 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      008708 0A 72 75 6E 20 74 69  1237 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      00871F 0A 63 6F 6D 6D 61 6E  1238 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      00873A 0A 64 75 70 6C 69 63  1239 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      00874C 0A 46 69 6C 65 20 6E  1240 err_not_file: .asciz "\nFile not found.\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal  6F-Bits]



             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      008754 74 20 66 6F 75 6E 64  1241 err_bad_value: .asciz "\nbad value.\n"
             2E 0A 00 0A 62 61
      008761 64 20 76 61 6C 75 65  1242 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             2E 0A 00 0A 46 69 6C
             65 20 69 6E 20 65 78
             74 65 6E 64 65 64 20
             6D 65 6D 6F 72 79 2C
             20 63 61 6E 27 74 20
             62 65 20 72 75 6E 20
             66 72 6F
                                   1243 
      008795 6D 20 74 68 65 72 65  1244 rt_msg: .asciz "last token id: "
             2E 0A 00 6C 61 73 74
             20 74
                                   1245 
      00072F                       1246 syntax_error:
      0087A5 6F 6B            [ 1] 1247 	ld a,#ERR_SYNTAX 
                                   1248 
      000731                       1249 tb_error:
      0087A7 65 6E 20         [ 2] 1250 	ldw x, #err_msg 
      0087AA 69 64 3A 20      [ 1] 1251 	clr acc16 
      0087AE 00               [ 1] 1252 	sll a
      0087AF 72 59 00 08      [ 1] 1253 	rlc acc16  
      0087AF A6 02 09         [ 1] 1254 	ld acc8, a 
      0087B1 72 BB 00 08      [ 2] 1255 	addw x,acc16 
      0087B1 AE               [ 2] 1256 	ldw x,(x)
      0087B2 86 92 72         [ 4] 1257 	call puts
      0087B5 5F 00 09 48 72   [ 2] 1258 	btjf flags,#FCOMP, 1$
      0087BA 59 00 09         [ 2] 1259 	ldw x,#tib
      0087BD C7 00 0A         [ 4] 1260 	call puts 
      0087C0 72 BB            [ 1] 1261 	ld a,#CR 
      0087C2 00 09 FE         [ 4] 1262 	call putc
      0087C5 CD 82 53         [ 2] 1263 	ldw x,in.w
      0087C8 72 0B 00         [ 4] 1264 	call spaces
      0087CB 20 18            [ 1] 1265 	ld a,#'^
      0087CD AE 16 C8         [ 4] 1266 	call putc 
      0087D0 CD 82            [ 2] 1267 	jra 6$
      0087D2 53 A6 0D         [ 2] 1268 1$:	ldw x,basicptr
      0087D5 CD 82 41         [ 4] 1269 	call prt_basic_line
      0087D8 CE 00 01         [ 2] 1270 	ldw x,#rt_msg 
      0087DB CD 82 7B         [ 4] 1271 	call puts 
      0087DE A6               [ 1] 1272 	clrw x 
      0087DF 5E CD 82         [ 1] 1273 	ld a,in.saved 
      0087E2 41               [ 1] 1274 	ld xl,a 
      0087E3 20 1A CE 00      [ 4] 1275 	ld a,([basicptr],x)
      0087E7 05               [ 1] 1276 	clrw x 
      0087E8 CD               [ 1] 1277 	ld xl,a 
      0087E9 95 2E AE         [ 4] 1278 	call print_int 
      0087EC 87 9F CD         [ 2] 1279 6$: ldw x,#STACK_EMPTY 
      0087EF 82               [ 1] 1280     ldw sp,x
      000783                       1281 warm_start:
      0087F0 53 5F C6 00      [ 1] 1282 	clr flags 
      0087F4 03 97 72 D6      [ 1] 1283 	clr loop_depth 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0087F8 00 05 5F         [ 2] 1284 	ldw x,#dstack_unf 
      0087FB 97 CD 8A         [ 2] 1285 	ldw dstkptr,x 
      0087FE 28 AE 17 FF      [ 1] 1286 	mov tab_width,#TAB_WIDTH 
      008802 94 0A 00 06      [ 1] 1287 	mov base,#10 
      008803 AE 16 C8         [ 2] 1288 	ldw x,#tib 
      008803 72 5F 00         [ 2] 1289 	ldw basicptr,x 
                                   1290 ;----------------------------
                                   1291 ;   BASIC interpreter
                                   1292 ;----------------------------
      00079F                       1293 interp:
      008806 20 72 5F 00      [ 1] 1294 	clr in.w
      00880A 1D AE 17 80 CF   [ 2] 1295 	btjf flags,#FRUN,4$ 
                                   1296 ; running program
                                   1297 ; goto next basic line 
      00880F 00 17 35         [ 2] 1298 	ldw x,basicptr
      008812 04 00            [ 1] 1299 	ld a,(2,x) ; line length 
      008814 21 35 0A         [ 1] 1300 	ld acc8,a 
      008817 00 07 AE 16      [ 1] 1301 	clr acc16 
      00881B C8 CF 00 05      [ 2] 1302 	addw x,acc16
      00881F C3 00 1A         [ 2] 1303 	cpw x,txtend 
      00881F 72 5F            [ 1] 1304 	jrpl warm_start
      008821 00 01 72         [ 2] 1305 	ldw basicptr,x ; start of next line  
      008824 01 00            [ 1] 1306 	ld a,(2,x)
      008826 20 23 CE         [ 1] 1307 	ld count,a 
      008829 00 05 E6 02      [ 1] 1308 	mov in,#3 ; skip first 3 bytes of line 
      00882D C7 00            [ 2] 1309 	jra interp_loop 
      0007CB                       1310 4$: ; commande line mode 	
      00882F 0A 72 5F 00      [ 1] 1311 	clr in
      008833 09 72            [ 1] 1312 	ld a,#CR 
      008835 BB 00 09         [ 4] 1313 	call putc 
      008838 C3 00            [ 1] 1314 	ld a,#'> 
      00883A 1B 2A C6         [ 4] 1315 	call putc 
      00883D CF 00 05         [ 4] 1316 	call readln
      008840 E6 02 C7         [ 4] 1317 	call compile
      0007DF                       1318 interp_loop:  
      008843 00 04 35         [ 1] 1319 	ld a,in 
      008846 03 00 02         [ 1] 1320 	cp a,count  
      008849 20 14            [ 1] 1321 	jrpl interp
      00884B CD 08 0F         [ 4] 1322 	call next_token
      00884B 72 5F            [ 1] 1323 	cp a,#TK_COLON 
      00884D 00 02            [ 1] 1324 	jreq interp_loop 
      00884F A6 0D            [ 1] 1325 	cp a,#TK_NONE 
                                   1326 ;	jreq interp 
      0007F0                       1327 1$:
      008851 CD 82            [ 1] 1328 	cp a,#TK_VAR
      008853 41 A6            [ 1] 1329 	jrne 2$
      008855 3E CD 82         [ 4] 1330 	call let02  
      008858 41 CD            [ 2] 1331 	jra interp_loop 
      0007F9                       1332 2$:	
      00885A 8B 16            [ 1] 1333 	cp a,#TK_ARRAY 
      00885C CD 84            [ 1] 1334 	jrne 3$
      00885E 8F 12 02         [ 4] 1335 	call get_array_element
      00885F CD 13 BD         [ 4] 1336 	call let02 
      00885F C6 00            [ 2] 1337 	jra interp_loop 
      000805                       1338 3$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008861 02 C1            [ 1] 1339 	cp a,#TK_CMD
      008863 00 04            [ 1] 1340 	jrne 4$
      008865 2A               [ 4] 1341 	call (x) 
      008866 B8 CD            [ 2] 1342 	jra interp_loop 
      00080C                       1343 4$:	
      008868 88 8F A1         [ 2] 1344 	jp syntax_error 
                                   1345 
                                   1346 ;--------------------------
                                   1347 ; extract next token from
                                   1348 ; token list 
                                   1349 ; basicptr -> base address 
                                   1350 ; in  -> offset in list array 
                                   1351 ; output:
                                   1352 ;   A 		token attribute
                                   1353 ;   X 		token value if there is one
                                   1354 ;----------------------------------------
      00080F                       1355 next_token:
      00886B 01 27 F1         [ 1] 1356 	ld a,in 
      00886E A1 00 03         [ 1] 1357 	sub a,count 
      008870 27 3B            [ 1] 1358 	jreq 9$
      008870 A1 05 26 05 CD   [ 1] 1359 	mov in.saved,in
      008875 94 3D 20         [ 2] 1360 	ldw x,basicptr 
      008878 E6 D6 00 00      [ 4] 1361 	ld a,([in.w],x)
      008879 72 5C 00 01      [ 1] 1362 	inc in 
      008879 A1 02            [ 1] 1363 	cp a,#TK_ARRAY  
      00887B 26 08            [ 2] 1364 	jrule 9$
      00887D CD 92            [ 1] 1365 	cp a,#TK_CHAR
      00887F 82 CD            [ 1] 1366 	jrne 1$
      008881 94 3D 20 DA      [ 4] 1367 	ld a,([in.w],x)
      008885 72 5C 00 01      [ 1] 1368 	inc in
      008885 A1               [ 1] 1369 	clrw x 
      008886 06               [ 1] 1370 	ld xl,a 
      008887 26 03            [ 1] 1371 	ld a,#TK_CHAR
      008889 FD               [ 4] 1372 	ret 
      00888A 20 D3            [ 1] 1373 1$:	cp a,#TK_QSTR 
      00888C 25 06            [ 1] 1374 	jrult 2$
      00888C CC 87 AF 00      [ 2] 1375 	addw x,in.w 
      00888F 20 0C            [ 2] 1376 	jra 9$
      00888F C6 00 02 C0      [ 5] 1377 2$: ldw x,([in.w],x)
      008893 00 04 27 3B      [ 1] 1378 	inc in 
      008897 55 00 02 00      [ 1] 1379 	inc in
      00889B 03               [ 4] 1380 9$: ret	
                                   1381 
                                   1382 
                                   1383 ;----------------------------------------
                                   1384 ;   DEBUG support functions
                                   1385 ;----------------------------------------
                           000001  1386 .if DEBUG 
                                   1387 ; turn LED on 
      000853                       1388 ledon:
      00889C CE 00 05 72      [ 1] 1389     bset PC_ODR,#LED2_BIT
      0088A0 D6               [ 4] 1390     ret 
                                   1391 
                                   1392 ; turn LED off 
      000858                       1393 ledoff:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0088A1 00 01 72 5C      [ 1] 1394     bres PC_ODR,#LED2_BIT 
      0088A5 00               [ 4] 1395     ret 
                                   1396 
                                   1397 ; invert LED status 
      00085D                       1398 ledtoggle:
      0088A6 02 A1            [ 1] 1399     ld a,#LED2_MASK
      0088A8 02 23 27         [ 1] 1400     xor a,PC_ODR
      0088AB A1 03 26         [ 1] 1401     ld PC_ODR,a
      0088AE 0D               [ 4] 1402     ret 
                                   1403 
      000866                       1404 left_paren:
      0088AF 72 D6            [ 1] 1405 	ld a,#SPACE 
      0088B1 00 01 72         [ 4] 1406 	call putc
      0088B4 5C 00            [ 1] 1407 	ld a,#'( 
      0088B6 02 5F 97         [ 4] 1408 	call putc 	
      0088B9 A6               [ 4] 1409 	ret 
                                   1410 
                                   1411 ;------------------------------
                                   1412 ; print 8 bit register 
                                   1413 ; input:
                                   1414 ;   X  point to register name 
                                   1415 ;   A  register value to print 
                                   1416 ; output:
                                   1417 ;   none
                                   1418 ;------------------------------- 
      000871                       1419 prt_reg8:
      0088BA 03               [ 1] 1420 	push a 
      0088BB 81 A1 0A         [ 4] 1421 	call puts 
      0088BE 25 06            [ 1] 1422 	ld a,(1,sp) 
      0088C0 72 BB 00         [ 1] 1423 	ld acc8,a 
      0088C3 01               [ 1] 1424 	clrw x 
      0088C4 20               [ 1] 1425 	ld xl,a 
      0088C5 0C 72 DE 00      [ 1] 1426 	mov base,#16
      0088C9 01 72 5C         [ 4] 1427 	call print_int 
      0088CC 00 02 72         [ 4] 1428 	call left_paren 
      0088CF 5C               [ 1] 1429 	pop a 
      0088D0 00               [ 1] 1430 	clrw x 
      0088D1 02               [ 1] 1431 	ld xl,a 
      0088D2 81 0A 00 06      [ 1] 1432 	mov base,#10 
      0088D3 CD 09 A8         [ 4] 1433 	call print_int  
      0088D3 72 1A            [ 1] 1434 	ld a,#') 
      0088D5 50 0A 81         [ 4] 1435 	call putc
      0088D8 81               [ 4] 1436 	ret
                                   1437 
                                   1438 ;--------------------------------
                                   1439 ; print 16 bits register 
                                   1440 ; input:
                                   1441 ;   X   point register name 
                                   1442 ;   Y   register value to print 
                                   1443 ; output:
                                   1444 ;  none
                                   1445 ;--------------------------------
      000896                       1446 prt_reg16: 
      0088D8 72 1B            [ 2] 1447 	pushw y 
      0088DA 50 0A 81         [ 4] 1448 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0088DD 1E 01            [ 2] 1449 	ldw x,(1,sp) 
      0088DD A6 20 C8 50      [ 1] 1450 	mov base,#16 
      0088E1 0A C7 50         [ 4] 1451 	call print_int  
      0088E4 0A 81 66         [ 4] 1452 	call left_paren 
      0088E6 85               [ 2] 1453 	popw x 
      0088E6 A6 20 CD 82      [ 1] 1454 	mov base,#10 
      0088EA 41 A6 28         [ 4] 1455 	call print_int  
      0088ED CD 82            [ 1] 1456 	ld a,#') 
      0088EF 41 81 C1         [ 4] 1457 	call putc
      0088F1 81               [ 4] 1458 	ret 
                                   1459 
                                   1460 ;------------------------------------
                                   1461 ; print registers contents saved on
                                   1462 ; stack by trap interrupt.
                                   1463 ;------------------------------------
      0008B5                       1464 print_registers:
      0088F1 88 CD 82         [ 2] 1465 	ldw x,#STATES
      0088F4 53 7B 01         [ 4] 1466 	call puts
                                   1467 ; print EPC 
      0088F7 C7 00 0A         [ 2] 1468 	ldw x, #REG_EPC
      0088FA 5F 97 35         [ 4] 1469 	call puts 
      0088FD 10 00            [ 1] 1470 	ld a, (11,sp)
      0088FF 07 CD 8A         [ 1] 1471 	ld acc8,a 
      008902 28 CD            [ 1] 1472 	ld a, (10,sp) 
      008904 88 E6 84         [ 1] 1473 	ld acc16,a 
      008907 5F 97            [ 1] 1474 	ld a,(9,sp) 
      008909 35 0A 00         [ 1] 1475 	ld acc24,a
      00890C 07               [ 1] 1476 	clrw x  
      00890D CD 8A            [ 1] 1477 	ld a,#16
      00890F 28 A6 29         [ 4] 1478 	call prti24  
                                   1479 ; print X
      008912 CD 82 41         [ 2] 1480 	ldw x,#REG_X
      008915 81 05            [ 2] 1481 	ldw y,(5,sp)
      008916 CD 08 96         [ 4] 1482 	call prt_reg16  
                                   1483 ; print Y 
      008916 90 89 CD         [ 2] 1484 	ldw x,#REG_Y
      008919 82 53            [ 2] 1485 	ldw y, (7,sp)
      00891B 1E 01 35         [ 4] 1486 	call prt_reg16  
                                   1487 ; print A 
      00891E 10 00 07         [ 2] 1488 	ldw x,#REG_A
      008921 CD 8A            [ 1] 1489 	ld a, (4,sp) 
      008923 28 CD 88         [ 4] 1490 	call prt_reg8
                                   1491 ; print CC 
      008926 E6 85 35         [ 2] 1492 	ldw x,#REG_CC 
      008929 0A 00            [ 1] 1493 	ld a, (3,sp) 
      00892B 07 CD 8A         [ 4] 1494 	call prt_reg8 
                                   1495 ; print SP 
      00892E 28 A6 29         [ 2] 1496 	ldw x,#REG_SP
      008931 CD 82            [ 1] 1497 	ldw y,sp 
      008933 41 81 00 0C      [ 2] 1498 	addw y,#12
      008935 CD 08 96         [ 4] 1499 	call prt_reg16  
      008935 AE 89            [ 1] 1500 	ld a,#'\n' 
      008937 88 CD 82         [ 4] 1501 	call putc
      00893A 53               [ 4] 1502 	ret
                                   1503 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00893B AE 89 C5 CD 82 53 7B  1504 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             0B C7 00 0A 7B 0A C7
             00 09 7B 09 C7 00 08
             5F A6 10 CD 89 E0 AE
             89 CE 16 05 CD 89 16
             AE 89 CA 16 07 CD 89
             16 AE 89 D2 7B 04 CD
             88 F1 AE 89 D6 7B 03
             CD 88 F1 AE 89
      008978 DB 90 96 72 A9        1505 REG_EPC: .asciz "EPC:"
      00897D 00 0C CD 89           1506 REG_Y:   .asciz "\nY:" 
      008981 16 A6 0A CD           1507 REG_X:   .asciz "\nX:"
      008985 82 41 81 0A           1508 REG_A:   .asciz "\nA:" 
      008989 52 65 67 69 73        1509 REG_CC:  .asciz "\nCC:"
      00898E 74 65 72 73 20        1510 REG_SP:  .asciz "\nSP:"
                                   1511 .endif ; DEBUG 
                                   1512 
                                   1513 ;------------------------------------
                                   1514 ; print integer in acc24 
                                   1515 ; input:
                                   1516 ;	acc24 		integer to print 
                                   1517 ;	A 			numerical base for conversion 
                                   1518 ;               if bit 7 is set add a space at print end.
                                   1519 ;   XL 			field width, 0 -> no fill.
                                   1520 ;  output:
                                   1521 ;    none 
                                   1522 ;------------------------------------
                           000001  1523 	WIDTH = 1
                           000002  1524 	BASE = 2
                           000003  1525 	ADD_SPACE=3 ; add a space after number 
                           000003  1526 	VSIZE = 3
      000960                       1527 prti24:
      000960                       1528 	_vars VSIZE 
      008993 73 74            [ 2]    1     sub sp,#VSIZE 
      008995 61 74            [ 1] 1529 	clr (ADD_SPACE,sp)
      008997 65 20            [ 1] 1530 	bcp a,#0x80 
      008999 61 74            [ 1] 1531 	jreq 0$ 
      00899B 20 61            [ 1] 1532 	cpl (ADD_SPACE,sp)
      00899D 62 6F            [ 1] 1533 0$:	and a,#31 
      00899F 72 74            [ 1] 1534 	ld (BASE,sp),a
      0089A1 20               [ 1] 1535 	ld a,xl
      0089A2 70 6F            [ 1] 1536 	ld (WIDTH,sp),a 
      0089A4 69 6E            [ 1] 1537 	ld a, (BASE,sp)  
      0089A6 74 2E 0A         [ 4] 1538     call itoa  ; conversion entier en  .asciz
      0089A9 2D 2D            [ 1] 1539 1$: ld a,(WIDTH,sp)
      0089AB 2D 2D            [ 1] 1540 	jreq 4$
      0089AD 2D 2D 2D         [ 1] 1541 	ld acc8,a 
      0089B0 2D               [ 2] 1542 	pushw x 
      0089B1 2D 2D 2D         [ 4] 1543 	call strlen 
      0089B4 2D               [ 1] 1544 	ld a,xl 
      0089B5 2D               [ 2] 1545 	popw x 
      0089B6 2D 2D 2D         [ 3] 1546 	exg a,acc8 
      0089B9 2D 2D 2D         [ 1] 1547 	sub a,acc8 
      0089BC 2D 2D            [ 1] 1548 	jrmi 4$
      0089BE 2D 2D            [ 1] 1549 	ld (WIDTH,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0089C0 2D 2D            [ 1] 1550 	ld  a,#SPACE
      0089C2 2D 0A            [ 1] 1551 3$: tnz (WIDTH,sp)
      0089C4 00 45            [ 1] 1552 	jreq 4$
      0089C6 50               [ 2] 1553 	decw x 
      0089C7 43               [ 1] 1554 	ld (x),a 
      0089C8 3A 00            [ 1] 1555 	dec (WIDTH,sp) 
      0089CA 0A 59            [ 2] 1556 	jra 3$
      000999                       1557 4$: 
      0089CC 3A 00 0A         [ 4] 1558 	call puts 
      0089CF 58 3A            [ 1] 1559 	tnz (ADD_SPACE,sp)
      0089D1 00 0A            [ 1] 1560 	jreq 5$
      0089D3 41 3A            [ 1] 1561     ld a,#SPACE 
      0089D5 00 0A 43         [ 4] 1562 	call putc 
      0009A5                       1563 5$: _drop VSIZE 
      0089D8 43 3A            [ 2]    1     addw sp,#VSIZE 
      0089DA 00               [ 4] 1564     ret	
                                   1565 
                                   1566 ;-----------------------------------
                                   1567 ; print a 16 bit integer 
                                   1568 ; using variable 'base' as conversion
                                   1569 ; format.
                                   1570 ; input:
                                   1571 ;   X       integer to print 
                                   1572 ;   base    conversion base 
                                   1573 ; output:
                                   1574 ;   none 
                                   1575 ;-----------------------------------
                           000001  1576 	SIGN=1
                           000001  1577 	VSIZE=1
      0009A8                       1578 print_int: 
      0009A8                       1579 	_vars VSIZE 
      0089DB 0A 53            [ 2]    1     sub sp,#VSIZE 
      0089DD 50 3A            [ 1] 1580 	clr (SIGN,sp)
      0089DF 00 AE 17 3F      [ 2] 1581 	ldw y,#pad+PAD_SIZE-1 
      0089E0 90 7F            [ 1] 1582 	clr (y)
      0089E0 52 03 0F         [ 1] 1583 	ld a,base  
      0089E3 03 A5            [ 1] 1584 	cp a,#10 
      0089E5 80 27            [ 1] 1585 	jrne 1$ 
      0089E7 02               [ 2] 1586 	tnzw x 
      0089E8 03 03            [ 1] 1587 	jrpl 1$ 
      0089EA A4 1F            [ 1] 1588 	cpl (SIGN,sp)
      0089EC 6B               [ 2] 1589 	negw x 	 
      0009BF                       1590 1$:	
      0089ED 02 9F 6B         [ 1] 1591 	ld a,base 
      0089F0 01               [ 2] 1592 	div x,a 
      0089F1 7B 02            [ 1] 1593 	add a,#'0 
      0089F3 CD 8A            [ 1] 1594 	cp a,#'9+1 
      0089F5 84 7B            [ 1] 1595 	jrmi 2$ 
      0089F7 01 27            [ 1] 1596 	add a,#7 
      0089F9 1F C7            [ 2] 1597 2$: decw y 
      0089FB 00 0A            [ 1] 1598 	ld (y),a 
      0089FD 89               [ 2] 1599 	tnzw x 
      0089FE CD 83            [ 1] 1600 	jrne 1$ 
      008A00 15 9F            [ 1] 1601 	ld a,#16 
      008A02 85 31 00         [ 1] 1602 	cp a,base 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A05 0A C0            [ 1] 1603 	jrne 3$
      008A07 00 0A            [ 1] 1604 	ld a,#'$
      008A09 2B 0E            [ 2] 1605 	decw y  
      008A0B 6B 01            [ 1] 1606 	ld (y),a
      008A0D A6 20            [ 2] 1607 	jra 9$ 
      008A0F 0D 01            [ 1] 1608 3$: tnz (SIGN,sp)
      008A11 27 06            [ 1] 1609 	jreq 9$ 
      008A13 5A F7            [ 1] 1610 	ld a,#'-
      008A15 0A 01            [ 2] 1611 	decw y  
      008A17 20 F6            [ 1] 1612 	ld (y),a
      008A19                       1613 9$:	
      008A19 CD               [ 1] 1614 	ldw x,y 
      008A1A 82 53 0D         [ 2] 1615 	subw x,#pad+PAD_SIZE-1 
      008A1D 03               [ 2] 1616 	negw x  
      0009F0                       1617 10$:
      008A1E 27 05            [ 2] 1618 	decw y 
      008A20 A6 20            [ 1] 1619 	ld a,#SPACE 
      008A22 CD 82            [ 1] 1620 	ld (y),a
      008A24 41               [ 2] 1621 	incw x 
      008A25 5B               [ 1] 1622 	ld a,xl 
      008A26 03 81 20         [ 1] 1623 	cp a,tab_width
      008A28 2B F3            [ 1] 1624 	jrmi 10$ 
      0009FD                       1625 12$:
      008A28 52               [ 1] 1626     ldw x,y 
      008A29 01 0F 01         [ 4] 1627 	call puts  
      000A01                       1628 	_drop VSIZE 
      008A2C 90 AE            [ 2]    1     addw sp,#VSIZE 
      008A2E 17               [ 4] 1629 	ret 
                                   1630 
                                   1631 ;------------------------------------
                                   1632 ; convert integer in acc24 to string
                                   1633 ; input:
                                   1634 ;   A	  	base
                                   1635 ;	acc24	integer to convert
                                   1636 ; output:
                                   1637 ;   X  		pointer to string
                                   1638 ;------------------------------------
                           000001  1639 	SIGN=1  ; integer sign 
                           000002  1640 	BASE=2  ; numeric base 
                           000002  1641 	VSIZE=2  ;locals size
      000A04                       1642 itoa:
      008A2F 3F 90            [ 2] 1643 	sub sp,#VSIZE
      008A31 7F C6            [ 1] 1644 	ld (BASE,sp), a  ; base
      008A33 00 07            [ 1] 1645 	clr (SIGN,sp)    ; sign
      008A35 A1 0A            [ 1] 1646 	cp a,#10
      008A37 26 06            [ 1] 1647 	jrne 1$
                                   1648 	; base 10 string display with negative sign if bit 23==1
      008A39 5D 2A 03 03 01   [ 2] 1649 	btjf acc24,#7,1$
      008A3E 50 01            [ 1] 1650 	cpl (SIGN,sp)
      008A3F CD 0A 73         [ 4] 1651 	call neg_acc24
      000A18                       1652 1$:
                                   1653 ; initialize string pointer 
      008A3F C6 00 07         [ 2] 1654 	ldw x,#pad+PAD_SIZE-1
      008A42 62               [ 1] 1655 	clr (x)
      000A1C                       1656 itoa_loop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A43 AB 30            [ 1] 1657     ld a,(BASE,sp)
      008A45 A1 3A 2B         [ 4] 1658     call divu24_8 ; acc24/A 
      008A48 02 AB            [ 1] 1659     add a,#'0  ; remainder of division
      008A4A 07 90            [ 1] 1660     cp a,#'9+1
      008A4C 5A 90            [ 1] 1661     jrmi 2$
      008A4E F7 5D            [ 1] 1662     add a,#7 
      008A50 26               [ 2] 1663 2$: decw x
      008A51 ED               [ 1] 1664     ld (x),a
                                   1665 	; if acc24==0 conversion done
      008A52 A6 10 C1         [ 1] 1666 	ld a,acc24
      008A55 00 07 26         [ 1] 1667 	or a,acc16
      008A58 08 A6 24         [ 1] 1668 	or a,acc8
      008A5B 90 5A            [ 1] 1669     jrne itoa_loop
                                   1670 	;conversion done, next add '$' or '-' as required
      008A5D 90 F7            [ 1] 1671 	ld a,(BASE,sp)
      008A5F 20 0A            [ 1] 1672 	cp a,#16
      008A61 0D 01            [ 1] 1673 	jreq 8$
      008A63 27 06            [ 1] 1674 	ld a,(SIGN,sp)
      008A65 A6 2D            [ 1] 1675     jreq 10$
      008A67 90 5A            [ 1] 1676     ld a,#'-
      008A69 90 F7            [ 2] 1677 	jra 9$ 
      008A6B A6 24            [ 1] 1678 8$: ld a,#'$ 
      008A6B 93               [ 2] 1679 9$: decw x
      008A6C 1D               [ 1] 1680     ld (x),a
      000A48                       1681 10$:
      008A6D 17 3F            [ 2] 1682 	addw sp,#VSIZE
      008A6F 50               [ 4] 1683 	ret
                                   1684 
                                   1685 ;-------------------------------------
                                   1686 ; divide uint24_t by uint8_t
                                   1687 ; used to convert uint24_t to string
                                   1688 ; input:
                                   1689 ;	acc24	dividend
                                   1690 ;   A 		divisor
                                   1691 ; output:
                                   1692 ;   acc24	quotient
                                   1693 ;   A		remainder
                                   1694 ;------------------------------------- 
                                   1695 ; offset  on sp of arguments and locals
                           000001  1696 	U8   = 1   ; divisor on stack
                           000001  1697 	VSIZE =1
      008A70                       1698 divu24_8:
      008A70 90               [ 2] 1699 	pushw x ; save x
      008A71 5A               [ 1] 1700 	push a 
                                   1701 	; ld dividend UU:MM bytes in X
      008A72 A6 20 90         [ 1] 1702 	ld a, acc24
      008A75 F7               [ 1] 1703 	ld xh,a
      008A76 5C 9F C1         [ 1] 1704 	ld a,acc24+1
      008A79 00               [ 1] 1705 	ld xl,a
      008A7A 21 2B            [ 1] 1706 	ld a,(U8,SP) ; divisor
      008A7C F3               [ 2] 1707 	div x,a ; UU:MM/U8
      008A7D 88               [ 1] 1708 	push a  ;save remainder
      008A7D 93               [ 1] 1709 	ld a,xh
      008A7E CD 82 53         [ 1] 1710 	ld acc24,a
      008A81 5B               [ 1] 1711 	ld a,xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008A82 01 81 08         [ 1] 1712 	ld acc24+1,a
      008A84 84               [ 1] 1713 	pop a
      008A84 52               [ 1] 1714 	ld xh,a
      008A85 02 6B 02         [ 1] 1715 	ld a,acc24+2
      008A88 0F               [ 1] 1716 	ld xl,a
      008A89 01 A1            [ 1] 1717 	ld a,(U8,sp) ; divisor
      008A8B 0A               [ 2] 1718 	div x,a  ; R:LL/U8
      008A8C 26 0A            [ 1] 1719 	ld (U8,sp),a ; save remainder
      008A8E 72               [ 1] 1720 	ld a,xl
      008A8F 0F 00 08         [ 1] 1721 	ld acc24+2,a
      008A92 05               [ 1] 1722 	pop a
      008A93 03               [ 2] 1723 	popw x
      008A94 01               [ 4] 1724 	ret
                                   1725 
                                   1726 ;------------------------------------
                                   1727 ;  two's complement acc24
                                   1728 ;  input:
                                   1729 ;		acc24 variable
                                   1730 ;  output:
                                   1731 ;		acc24 variable
                                   1732 ;-------------------------------------
      000A73                       1733 neg_acc24:
      008A95 CD 8A F3 09      [ 1] 1734 	cpl acc24+2
      008A98 72 53 00 08      [ 1] 1735 	cpl acc24+1
      008A98 AE 17 3F 7F      [ 1] 1736 	cpl acc24
      008A9C A6 01            [ 1] 1737 	ld a,#1
      008A9C 7B 02 CD         [ 1] 1738 	add a,acc24+2
      008A9F 8A CB AB         [ 1] 1739 	ld acc24+2,a
      008AA2 30               [ 1] 1740 	clr a
      008AA3 A1 3A 2B         [ 1] 1741 	adc a,acc24+1
      008AA6 02 AB 07         [ 1] 1742 	ld acc24+1,a 
      008AA9 5A               [ 1] 1743 	clr a 
      008AAA F7 C6 00         [ 1] 1744 	adc a,acc24 
      008AAD 08 CA 00         [ 1] 1745 	ld acc24,a 
      008AB0 09               [ 4] 1746 	ret
                                   1747 
                                   1748 
                                   1749 ;------------------------------------
                                   1750 ; read a line of text from terminal
                                   1751 ; input:
                                   1752 ;	none
                                   1753 ; local variable on stack:
                                   1754 ;	LL  line length
                                   1755 ;   RXCHAR last received chaaracte 
                                   1756 ; output:
                                   1757 ;   text in tib  buffer
                                   1758 ;------------------------------------
                                   1759 	; local variables
                           000001  1760 	LL_HB=1
                           000001  1761 	RXCHAR = 1 ; last char received
                           000002  1762 	LL = 2  ; accepted line length
                           000002  1763 	VSIZE=2 
      000A96                       1764 readln:
      008AB1 CA               [ 1] 1765 	clrw x 
      008AB2 00               [ 2] 1766 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008AB3 0A 26 E6 7B      [ 2] 1767  	ldw y,#tib ; input buffer
      000A9C                       1768 readln_loop:
      008AB7 02 A1 10         [ 4] 1769 	call getc
      008ABA 27 08            [ 1] 1770 	ld (RXCHAR,sp),a
      008ABC 7B 01            [ 1] 1771 	cp a,#CR
      008ABE 27 08            [ 1] 1772 	jrne 1$
      008AC0 A6 2D 20         [ 2] 1773 	jp readln_quit
      008AC3 02 A6            [ 1] 1774 1$:	cp a,#NL
      008AC5 24 5A            [ 1] 1775 	jreq readln_quit
      008AC7 F7 08            [ 1] 1776 	cp a,#BSP
      008AC8 27 3D            [ 1] 1777 	jreq del_back
      008AC8 5B 02            [ 1] 1778 	cp a,#CTRL_D
      008ACA 81 2A            [ 1] 1779 	jreq del_ln
      008ACB A1 12            [ 1] 1780 	cp a,#CTRL_R 
      008ACB 89 88            [ 1] 1781 	jreq reprint 
                                   1782 ;	cp a,#'[
                                   1783 ;	jreq ansi_seq
      000AB8                       1784 final_test:
      008ACD C6 00            [ 1] 1785 	cp a,#SPACE
      008ACF 08 95            [ 1] 1786 	jrpl accept_char
      008AD1 C6 00            [ 2] 1787 	jra readln_loop
      000ABE                       1788 ansi_seq:
                                   1789 ;	call getc
                                   1790 ;	cp a,#'C 
                                   1791 ;	jreq rigth_arrow
                                   1792 ;	cp a,#'D 
                                   1793 ;	jreq left_arrow 
                                   1794 ;	jra final_test
      000ABE                       1795 right_arrow:
                                   1796 ;	ld a,#BSP 
                                   1797 ;	call putc 
                                   1798 ;	jra realn_loop 
      000ABE                       1799 left_arrow:
                                   1800 
                                   1801 ;	jra readln_loop
      000ABE                       1802 reprint: 
      008AD3 09 97            [ 1] 1803 	tnz (LL,sp)
      008AD5 7B 01            [ 1] 1804 	jrne readln_loop
      008AD7 62 88 9E         [ 2] 1805 	ldw x,#tib 
      008ADA C7 00 08         [ 4] 1806 	call strlen 
      008ADD 9F C7 00 09      [ 2] 1807 	ldw y,#tib 
      008AE1 84               [ 1] 1808 	ld a,xl
      008AE2 95 C6            [ 1] 1809 	jreq readln_loop
      008AE4 00 0A            [ 1] 1810 	ld (LL,sp),a 
      008AE6 97 7B 01         [ 2] 1811 	ldw x,#tib 
      008AE9 62 6B 01         [ 4] 1812 	call puts
      008AEC 9F C7            [ 1] 1813 	clr (LL_HB,sp)
      008AEE 00 0A 84         [ 2] 1814 	addw y,(LL_HB,sp)
      008AF1 85 81            [ 2] 1815 	jra readln_loop 
      008AF3                       1816 del_ln:
      008AF3 72 53            [ 1] 1817 	ld a,(LL,sp)
      008AF5 00 0A 72         [ 4] 1818 	call delete
      008AF8 53 00 09 72      [ 2] 1819 	ldw y,#tib
      008AFC 53 00            [ 1] 1820 	clr (y)
      008AFE 08 A6            [ 1] 1821 	clr (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B00 01 CB            [ 2] 1822 	jra readln_loop
      000AED                       1823 del_back:
      008B02 00 0A            [ 1] 1824     tnz (LL,sp)
      008B04 C7 00            [ 1] 1825     jreq readln_loop
      008B06 0A 4F            [ 1] 1826     dec (LL,sp)
      008B08 C9 00            [ 2] 1827     decw y
      008B0A 09 C7            [ 1] 1828     clr  (y)
      008B0C 00 09 4F         [ 4] 1829     call bksp 
      008B0F C9 00            [ 2] 1830     jra readln_loop	
      000AFC                       1831 accept_char:
      008B11 08 C7            [ 1] 1832 	ld a,#TIB_SIZE-1
      008B13 00 08            [ 1] 1833 	cp a, (LL,sp)
      008B15 81 9A            [ 1] 1834 	jreq readln_loop
      008B16 7B 01            [ 1] 1835 	ld a,(RXCHAR,sp)
      008B16 5F 89            [ 1] 1836 	ld (y),a
      008B18 90 AE            [ 1] 1837 	inc (LL,sp)
      008B1A 16 C8            [ 2] 1838 	incw y
      008B1C 90 7F            [ 1] 1839 	clr (y)
      008B1C CD 82 4A         [ 4] 1840 	call putc 
      008B1F 6B 01            [ 2] 1841 	jra readln_loop
      000B11                       1842 readln_quit:
      008B21 A1 0D            [ 1] 1843 	clr (y)
      008B23 26 03            [ 1] 1844 	ld a,(LL,sp)
      008B25 CC 8B 91         [ 1] 1845 	ld count,a 
      000B18                       1846 	_drop VSIZE 
      008B28 A1 0A            [ 2]    1     addw sp,#VSIZE 
      008B2A 27 65            [ 1] 1847 	ld a,#CR
      008B2C A1 08 27         [ 4] 1848 	call putc
      008B2F 3D               [ 4] 1849 	ret
                                   1850 
                           000001  1851 .if DEBUG 	
                                   1852 ;----------------------------
                                   1853 ; command interface
                                   1854 ; only 3 commands:
                                   1855 ;  'q' to resume application
                                   1856 ;  'p [addr]' to print memory values 
                                   1857 ;  's addr' to print string 
                                   1858 ;----------------------------
                                   1859 ;local variable 
                           000001  1860 	PSIZE=1
                           000001  1861 	VSIZE=1 
      000B20                       1862 cmd_itf:
      008B30 A1 04            [ 2] 1863 	sub sp,#VSIZE 
      008B32 27 2A A1 12      [ 1] 1864 	clr farptr 
      008B36 27 06 00 11      [ 1] 1865 	clr farptr+1 
      008B38 72 5F 00 12      [ 1] 1866 	clr farptr+2  
      000B2E                       1867 repl:
      008B38 A1 20            [ 1] 1868 	ld a,#CR 
      008B3A 2A 40 20         [ 4] 1869 	call putc 
      008B3D DE 3F            [ 1] 1870 	ld a,#'? 
      008B3E CD 01 C1         [ 4] 1871 	call putc
      008B3E 72 5F 00 00      [ 1] 1872 	clr in.w 
      008B3E 72 5F 00 01      [ 1] 1873 	clr in 
      008B3E CD 0A 96         [ 4] 1874 	call readln
      008B3E 0D 02 26 DA      [ 2] 1875 	ldw y,#tib  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B42 AE 16            [ 1] 1876 	ld a,(y)
      008B44 C8 CD            [ 1] 1877 	jreq repl  
      008B46 83 15 90 AE      [ 1] 1878 	inc in 
      008B4A 16 C8 9F         [ 4] 1879 	call to_upper 
      008B4D 27 CD            [ 1] 1880 	cp a,#'Q 
      008B4F 6B 02            [ 1] 1881 	jrne test_p
      000B56                       1882 repl_exit:
      008B51 AE 16 C8 CD      [ 1] 1883 	clr tib 
      008B55 82 53 0F 01      [ 1] 1884 	clr count 
      008B59 72 F9 01 20      [ 1] 1885 	clr in 
      000B62                       1886 	_drop #VSIZE 	
      008B5D BE 01            [ 2]    1     addw sp,##VSIZE 
      008B5E 81               [ 4] 1887 	ret  
      000B65                       1888 invalid:
      008B5E 7B 02 CD         [ 2] 1889 	ldw x,#invalid_cmd 
      008B61 82 6D 90         [ 4] 1890 	call puts 
      008B64 AE 16            [ 2] 1891 	jra repl 
      000B6D                       1892 test_p:	
      008B66 C8 90            [ 1] 1893     cp a,#'P 
      008B68 7F 0F            [ 1] 1894 	jreq mem_peek
      008B6A 02 20            [ 1] 1895     cp a,#'S 
      008B6C AF F0            [ 1] 1896 	jrne invalid 
      008B6D                       1897 print_string:	
      008B6D 0D 02 27         [ 4] 1898 	call get_token
      008B70 AB 0A            [ 1] 1899 	cp a,#TK_INTGR 
      008B72 02 90            [ 1] 1900 	jrne invalid 
      008B74 5A 90 7F         [ 4] 1901 	call puts
      008B77 CD 82 5D         [ 2] 1902 	jp repl 	
      000B82                       1903 mem_peek:
      008B7A 20 A0            [ 1] 1904 	ld a,#SPACE 
      008B7C CD 0F 88         [ 4] 1905 	call skip  	 
      008B7C A6 4F 11 02      [ 2] 1906 	addw y,in.w 
      008B80 27 9A 7B         [ 2] 1907 	ldw x,#pad 
      008B83 01 90 F7         [ 4] 1908 	call strcpy
      008B86 0C 02 90         [ 4] 1909 	call atoi24 	
      008B89 5C 90 7F         [ 1] 1910 	ld a, acc24 
      008B8C CD 82 41         [ 1] 1911 	or a,acc16 
      008B8F 20 8B 09         [ 1] 1912 	or a,acc8 
      008B91 26 02            [ 1] 1913 	jrne 1$ 
      008B91 90 7F            [ 2] 1914 	jra peek_byte  
      008B93 7B 02 C7         [ 2] 1915 1$:	ldw x,acc24 
      008B96 00 04 5B         [ 2] 1916 	ldw farptr,x 
      008B99 02 A6 0D         [ 1] 1917 	ld a,acc8 
      008B9C CD 82 41         [ 1] 1918 	ld farptr+2,a 
      000BAD                       1919 peek_byte:
      008B9F 81 0B F2         [ 4] 1920 	call print_farptr 
      008BA0 A6 08            [ 1] 1921 	ld a,#8 
      008BA0 52 01            [ 1] 1922 	ld (PSIZE,sp),a 
      008BA2 72               [ 1] 1923 	clrw x 
      008BA3 5F 00 11         [ 4] 1924 1$:	call fetchc  
      008BA6 72               [ 2] 1925 	pushw x 
      008BA7 5F 00 12         [ 1] 1926 	ld acc8,a 
      008BAA 72               [ 1] 1927 	clrw x 
      008BAB 5F 00 13         [ 2] 1928 	ldw acc24,x 
      008BAE A6 90            [ 1] 1929 	ld a,#16+128
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008BAE A6 0D CD         [ 4] 1930 	call prti24
      008BB1 82               [ 2] 1931 	popw x 
      008BB2 41 A6            [ 1] 1932 	dec (PSIZE,sp)
      008BB4 3F CD            [ 1] 1933 	jrne 1$ 
      008BB6 82 41            [ 1] 1934 	ld a,#8 
      008BB8 72 5F 00         [ 1] 1935 	add a,farptr+2 
      008BBB 01 72 5F         [ 1] 1936 	ld farptr+2,a
      008BBE 00               [ 1] 1937 	clr a 
      008BBF 02 CD 8B         [ 1] 1938 	adc a,farptr+1 
      008BC2 16 90 AE         [ 1] 1939 	ld farptr+1,a 
      008BC5 16               [ 1] 1940 	clr a 
      008BC6 C8 90 F6         [ 1] 1941 	adc a,farptr 
      008BC9 27 E3 72         [ 1] 1942 	ld farptr,a 
      008BCC 5C 00 02         [ 2] 1943 	jp repl  
                                   1944 
      008BCF CD 8F 50 A1 51 26 17  1945 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1946 
                                   1947 ;----------------------------
                                   1948 ; display farptr address
                                   1949 ;----------------------------
      008BD6                       1950 print_farptr:
      008BD6 72 5F 16         [ 1] 1951 	ld a ,farptr+2 
      008BD9 C8 72 5F         [ 1] 1952 	ld acc8,a 
      008BDC 00 04 72         [ 2] 1953 	ldw x,farptr 
      008BDF 5F 00 02         [ 2] 1954 	ldw acc24,x 
      008BE2 5B               [ 1] 1955 	clrw x 
      008BE3 01 81            [ 1] 1956 	ld a,#16 
      008BE5 CD 09 60         [ 4] 1957 	call prti24
      008BE5 AE 8C            [ 1] 1958 	ld a,#SPACE 
      008BE7 63 CD 82         [ 4] 1959 	call putc 
      008BEA 53 20 C1         [ 4] 1960 	call putc 
      008BED 81               [ 4] 1961 	ret
                                   1962 
                                   1963 ;------------------------------------
                                   1964 ; get byte at address farptr[X]
                                   1965 ; input:
                                   1966 ;	 farptr   address to peek
                                   1967 ;    X		  farptr index 	
                                   1968 ; output:
                                   1969 ;	 A 		  byte from memory  
                                   1970 ;    x		  incremented by 1
                                   1971 ;------------------------------------
      000C0D                       1972 fetchc: ; @C
      008BED A1 50 27 11      [ 5] 1973 	ldf a,([farptr],x)
      008BF1 A1               [ 2] 1974 	incw x
      008BF2 53               [ 4] 1975 	ret
                                   1976 
                                   1977 
                                   1978 ;------------------------------------
                                   1979 ; expect a number from command line 
                                   1980 ; next argument
                                   1981 ;  input:
                                   1982 ;	  none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   1983 ;  output:
                                   1984 ;    acc24   int24_t 
                                   1985 ;------------------------------------
      000C13                       1986 number::
      008BF3 26 F0 0F         [ 4] 1987 	call get_token
      008BF5 CD 0E DC         [ 4] 1988 	call atoi24
      008BF5 CD               [ 4] 1989 	ret
                                   1990 .endif ; DEBUG 
                                   1991 
                                   1992 ;------------------------------------
                                   1993 ; parse quoted string 
                                   1994 ; input:
                                   1995 ;   Y 	pointer to tib 
                                   1996 ;   X   pointer to pad
                                   1997 ; output:
                                   1998 ;	pad   parsed string
                                   1999 ;   TOS  char* to pad  
                                   2000 ;------------------------------------
                           000001  2001 	PREV = 1
                           000002  2002 	CURR =2 
                           000002  2003 	VSIZE=2 
      000C1A                       2004 parse_quote: ; { -- addr }
      000C1A                       2005 	_vars VSIZE 
      008BF6 8D 8F            [ 2]    1     sub sp,#VSIZE 
      008BF8 A1               [ 1] 2006 	clr a
      008BF9 04 26            [ 1] 2007 1$:	ld (PREV,sp),a 
      008BFB E9 CD 82 53      [ 1] 2008 2$:	inc in
      008BFF CC 8B AE         [ 4] 2009 	ld a,([in.w],y)
      008C02 27 24            [ 1] 2010 	jreq 6$
      008C02 A6 20            [ 1] 2011 	ld (CURR,sp),a 
      008C04 CD 90            [ 1] 2012 	ld a,#'\
      008C06 08 72            [ 1] 2013 	cp a, (PREV,sp)
      008C08 B9 00            [ 1] 2014 	jrne 3$
      008C0A 01 AE            [ 1] 2015 	clr (PREV,sp)
      008C0C 17 18            [ 1] 2016 	ld a,(CURR,sp)
      008C0E CD 83            [ 4] 2017 	callr convert_escape
      008C10 33               [ 1] 2018 	ld (x),a 
      008C11 CD               [ 2] 2019 	incw x 
      008C12 8F 5C            [ 2] 2020 	jra 2$
      000C3A                       2021 3$:
      008C14 C6 00            [ 1] 2022 	ld a,(CURR,sp)
      008C16 08 CA            [ 1] 2023 	cp a,#'\'
      008C18 00 09            [ 1] 2024 	jreq 1$
      008C1A CA 00            [ 1] 2025 	cp a,#'"
      008C1C 0A 26            [ 1] 2026 	jreq 5$ 
      008C1E 02               [ 1] 2027 	ld (x),a 
      008C1F 20               [ 2] 2028 	incw x 
      008C20 0C CE            [ 2] 2029 	jra 2$
      008C22 00 08 CF 00      [ 1] 2030 5$:	inc in 
      008C26 11               [ 1] 2031 6$: clr (x)
      008C27 C6 00 0A         [ 2] 2032 	ldw x,#pad 
      000C50                       2033 	_drop VSIZE
      008C2A C7 00            [ 2]    1     addw sp,#VSIZE 
      008C2C 13 0A            [ 1] 2034 	ld a,#TK_QSTR  
      008C2D 81               [ 4] 2035 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2036 
                                   2037 ;---------------------------------------
                                   2038 ; called by parse_quote
                                   2039 ; subtitute escaped character 
                                   2040 ; by their ASCII value .
                                   2041 ; input:
                                   2042 ;   A  character following '\'
                                   2043 ; output:
                                   2044 ;   A  substitued char or same if not valid.
                                   2045 ;---------------------------------------
      000C55                       2046 convert_escape:
      008C2D CD               [ 2] 2047 	pushw x 
      008C2E 8C 72 A6         [ 2] 2048 	ldw x,#escaped 
      008C31 08               [ 1] 2049 1$:	cp a,(x)
      008C32 6B 01            [ 1] 2050 	jreq 2$
      008C34 5F               [ 1] 2051 	tnz (x)
      008C35 CD 8C            [ 1] 2052 	jreq 3$
      008C37 8D               [ 2] 2053 	incw x 
      008C38 89 C7            [ 2] 2054 	jra 1$
      008C3A 00 0A 5F         [ 2] 2055 2$: subw x,#escaped 
      008C3D CF               [ 1] 2056 	ld a,xl 
      008C3E 00 08            [ 1] 2057 	add a,#7
      008C40 A6               [ 2] 2058 3$:	popw x 
      008C41 90               [ 4] 2059 	ret 
                                   2060 
      008C42 CD 89 E0 85 0A 01 26  2061 escaped: .asciz "abtnvfr"
             EB
                                   2062 
                                   2063 ;-------------------------
                                   2064 ; integer parser 
                                   2065 ; input:
                                   2066 ;   X 		point to pad 
                                   2067 ;   Y 		point to tib 
                                   2068 ;   A 	    first digit|'$' 
                                   2069 ; output:  
                                   2070 ;   pad     number string 
                                   2071 ;   X 		integer 
                                   2072 ;   A 		TK_INTGR
                                   2073 ;-------------------------
                           000001  2074 	BASE=1
                           000002  2075 	TCHAR=2 
                           000002  2076 	VSIZE=2 
      000C72                       2077 parse_integer: ; { -- n }
      008C4A A6 08            [ 1] 2078 	push #0 ; TCHAR 
      008C4C CB 00            [ 1] 2079 	cp a,#'$
      008C4E 13 C7            [ 1] 2080 	jreq 1$ 
      008C50 00 13            [ 1] 2081 	push #10 ; BASE=10 
      008C52 4F C9            [ 2] 2082 	jra 2$ 
      008C54 00 12            [ 1] 2083 1$: push #16  ; BASE=16
      008C56 C7               [ 1] 2084 2$:	ld (x),a 
      008C57 00               [ 2] 2085 	incw x 
      008C58 12 4F C9 00      [ 1] 2086 	inc in 
      008C5C 11 C7 00         [ 4] 2087 	ld a,([in.w],y)
      008C5F 11 CC 8B         [ 4] 2088 	call to_upper 
      008C62 AE 6E            [ 1] 2089 	ld (TCHAR,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C64 6F 74 20         [ 4] 2090 	call is_digit 
      008C67 61 20            [ 1] 2091 	jrc 2$
      008C69 63 6F            [ 1] 2092 	ld a,#16 
      008C6B 6D 6D            [ 1] 2093 	cp a,(BASE,sp)
      008C6D 61 6E            [ 1] 2094 	jrne 3$ 
      008C6F 64 0A            [ 1] 2095 	ld a,(TCHAR,sp)
      008C71 00 41            [ 1] 2096 	cp a,#'A 
      008C72 2B 04            [ 1] 2097 	jrmi 3$ 
      008C72 C6 00            [ 1] 2098 	cp a,#'G 
      008C74 13 C7            [ 1] 2099 	jrmi 2$ 
      008C76 00               [ 1] 2100 3$:	clr (x)
      008C77 0A CE 00         [ 4] 2101 	call atoi24
      008C7A 11 CF 00         [ 2] 2102 	ldw x,acc16 
      008C7D 08 5F            [ 1] 2103 	ld a,#TK_INTGR
      000CAA                       2104 	_drop VSIZE  
      008C7F A6 10            [ 2]    1     addw sp,#VSIZE 
      008C81 CD               [ 4] 2105 	ret 	
                                   2106 
                                   2107 ;-------------------------
                                   2108 ; binary integer parser 
                                   2109 ; input:
                                   2110 ;   X 		point to pad 
                                   2111 ;   Y 		point to tib 
                                   2112 ;   A 	    '%' 
                                   2113 ; output:  
                                   2114 ;   pad     number string 
                                   2115 ;   X 		integer 
                                   2116 ;   A 		TK_INTGR
                                   2117 ;   TOS     integer 
                                   2118 ;-------------------------
                           000001  2119 	BINARY=1
                           000002  2120 	VSIZE=2
      000CAD                       2121 parse_binary: ; { -- n }
      008C82 89 E0            [ 1] 2122 	push #0
      008C84 A6 20            [ 1] 2123 	push #0
      008C86 CD               [ 1] 2124 1$: ld (x),a 
      008C87 82               [ 2] 2125 	incw x 
      008C88 41 CD 82 41      [ 1] 2126 	inc in 
      008C8C 81 D6 00         [ 4] 2127 	ld a,([in.w],y)
      008C8D A1 30            [ 1] 2128 	cp a,#'0 
      008C8D 92 AF            [ 1] 2129 	jreq 2$
      008C8F 00 11            [ 1] 2130 	cp a,#'1 
      008C91 5C 81            [ 1] 2131 	jreq 2$ 
      008C93 20 09            [ 2] 2132 	jra bin_exit 
      008C93 CD 8D            [ 1] 2133 2$: sub a,#'0	
      008C95 8F               [ 1] 2134 	rrc a 
      008C96 CD 8F            [ 1] 2135 	rlc (BINARY+1,sp)
      008C98 5C 81            [ 1] 2136 	rlc (BINARY,sp)
      008C9A 20 E4            [ 2] 2137 	jra 1$  
      000CCD                       2138 bin_exit:
      008C9A 52               [ 1] 2139 	clr (x)
      008C9B 02 4F            [ 2] 2140 	ldw x,(BINARY,sp)
      008C9D 6B 01            [ 1] 2141 	ld a,#TK_INTGR 	
      000CD2                       2142 	_drop VSIZE 
      008C9F 72 5C            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CA1 00               [ 4] 2143 	ret
                                   2144 
                                   2145 ;---------------------------
                                   2146 ;  token begin with a letter,
                                   2147 ;  is keyword or variable. 	
                                   2148 ; input:
                                   2149 ;   X 		point to pad 
                                   2150 ;   Y 		point to text
                                   2151 ;   A 	    first letter  
                                   2152 ; output:
                                   2153 ;   X		exec_addr|var_addr 
                                   2154 ;   A 		TK_CMD 
                                   2155 ;   pad 	keyword|var_name  
                                   2156 ;   TOS     exec_addr|var_addr 
                                   2157 ;--------------------------  
      000CD5                       2158 parse_keyword: ; { -- exec_addr|var_addr}
      008CA2 02 91 D6         [ 4] 2159 	call to_upper 
      008CA5 01               [ 1] 2160 	ld (x),a 
      008CA6 27               [ 2] 2161 	incw x 
      008CA7 24 6B 02 A6      [ 1] 2162 	inc in 
      008CAB 5C 11 01         [ 4] 2163 	ld a,([in.w],y)
      008CAE 26 0A 0F         [ 4] 2164 	call is_alpha 
      008CB1 01 7B            [ 1] 2165 	jrc parse_keyword 
      008CB3 02               [ 1] 2166 1$: clr (x)
      008CB4 AD 1F F7 5C      [ 1] 2167 	tnz pad+1 
      008CB8 20 E5            [ 1] 2168 	jrne 2$
                                   2169 ; one letter variable name 
      008CBA C6 17 18         [ 1] 2170 	ld a,pad 
      008CBA 7B 02            [ 1] 2171 	sub a,#'A 
      008CBC A1               [ 1] 2172 	sll a 
      008CBD 5C               [ 1] 2173 	push a 
      008CBE 27 DD            [ 1] 2174 	push #0
      008CC0 A1 22 27         [ 2] 2175 	ldw x,#vars 
      008CC3 04 F7 5C         [ 2] 2176 	addw x,(1,sp) ; X=var address 
      000CFC                       2177 	_drop 2 
      008CC6 20 D7            [ 2]    1     addw sp,#2 
      008CC8 72 5C            [ 1] 2178 	ld a,#TK_VAR 
      008CCA 00 02            [ 2] 2179 	jra 4$ 
      000D02                       2180 2$: ; check for keyword, otherwise syntax error.
      000D02                       2181 	_ldx_dict kword_dict
      008CCC 7F AE 17         [ 2]    1     ldw x,#kword_dict+2
      008CCF 18 5B 02         [ 4] 2182 	call search_dict
      008CD2 A6               [ 1] 2183 	tnz a
      008CD3 0A 81            [ 1] 2184 	jrne 4$ 
      008CD5 CC 07 2F         [ 2] 2185 	jp syntax_error
      008CD5 89               [ 4] 2186 4$:	ret  	
                                   2187 
                                   2188 
                                   2189 ;------------------------------------
                                   2190 ; Command line tokenizer
                                   2191 ; scan text for next token
                                   2192 ; move token in 'pad'
                                   2193 ; input: 
      000D0F                       2194 	none: 
                                   2195 ; use:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2196 ;	Y   pointer to text
                                   2197 ;   X	pointer to pad 
                                   2198 ;   in.w   index in text buffer
                                   2199 ; output:
                                   2200 ;   A       token attribute 
                                   2201 ;   pad 	token as .asciz
                                   2202 ;   X 		token value   
                                   2203 ;------------------------------------
                                   2204 	; use to check special character 
                                   2205 	.macro _case c t  
                                   2206 	ld a,#c 
                                   2207 	cp a,(TCHAR,sp) 
                                   2208 	jrne t
                                   2209 	.endm 
                                   2210 
                           000001  2211 	TCHAR=1
                           000002  2212 	ATTRIB=2 
                           000002  2213 	VSIZE=2
      000D0F                       2214 get_token: 
      008CD6 AE 8C EA F1      [ 2] 2215 	ldw y,#tib    	
      008CDA 27 06 7D         [ 1] 2216 	ld a,in 
      008CDD 27 09 5C         [ 1] 2217 	cp a,count 
      008CE0 20 F7            [ 1] 2218 	jrmi 1$
      008CE2 1D 8C            [ 1] 2219 	ld a,#TK_NONE 
      008CE4 EA               [ 4] 2220 	ret 
      000D1E                       2221 1$:	
      000D1E                       2222 	_vars VSIZE
      008CE5 9F AB            [ 2]    1     sub sp,#VSIZE 
      008CE7 07 85 81         [ 2] 2223 	ldw x, #pad
      008CEA 61 62            [ 1] 2224 	ld a,#SPACE
      008CEC 74 6E 76         [ 4] 2225 	call skip
      008CEF 66 72 00 00 02   [ 1] 2226 	mov in.saved,in 
      008CF2 91 D6 00         [ 4] 2227 	ld a,([in.w],y)
      008CF2 4B 00            [ 1] 2228 	jrne str_tst
      008CF4 A1 24 27 04      [ 1] 2229 	clr pad 
      008CF8 4B 0A 20         [ 2] 2230 	jp token_exit ; end of line 
                                   2231 
      000D39                       2232 str_tst: ; check for quoted string  	
      008CFB 02 4B 10         [ 4] 2233 	call to_upper 
      008CFE F7 5C            [ 1] 2234 	ld (TCHAR,sp),a 
      000D3E                       2235 	_case '"' nbr_tst
      008D00 72 5C            [ 1]    1 	ld a,#'"' 
      008D02 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D04 91 D6            [ 1]    3 	jrne nbr_tst
      008D06 01 CD 8F         [ 4] 2236 	call parse_quote
      008D09 50 6B 02         [ 2] 2237 	jp token_exit
      000D4A                       2238 nbr_tst: ; check for number 
      008D0C CD 8F            [ 1] 2239 	ld a,#'$'
      008D0E 47 25            [ 1] 2240 	cp a,(TCHAR,sp) 
      008D10 ED A6            [ 1] 2241 	jreq 1$
      008D12 10 11            [ 1] 2242 	ld a,#'&
      008D14 01 26            [ 1] 2243 	cp a,(TCHAR,sp)
      008D16 0A 7B            [ 1] 2244 	jrne 0$
      008D18 02 A1 41         [ 4] 2245 	call parse_binary ; expect binary integer 
      008D1B 2B 04 A1         [ 2] 2246 	jp token_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D1E 47 2B            [ 1] 2247 0$:	ld a,(TCHAR,sp)
      008D20 DD 7F CD         [ 4] 2248 	call is_digit
      008D23 8F 5C            [ 1] 2249 	jrnc 3$
      008D25 CE 00 09         [ 4] 2250 1$:	call parse_integer 
      008D28 A6 04 5B         [ 2] 2251 	jp token_exit 
      000D69                       2252 3$: 
      000D69                       2253 	_case '(' bkslsh_tst 
      008D2B 02 81            [ 1]    1 	ld a,#'(' 
      008D2D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D2D 4B 00            [ 1]    3 	jrne bkslsh_tst
      008D2F 4B 00            [ 1] 2254 	ld a,#TK_LPAREN
      008D31 F7 5C 72         [ 2] 2255 	jp token_char   	
      000D74                       2256 bkslsh_tst:
      000D74                       2257 	_case '\',rparnt_tst
      008D34 5C 00            [ 1]    1 	ld a,#'\' 
      008D36 02 91            [ 1]    2 	cp a,(TCHAR,sp) 
      008D38 D6 01            [ 1]    3 	jrne rparnt_tst
      008D3A A1 30            [ 1] 2258 	ld a,(TCHAR,sp)
      008D3C 27               [ 1] 2259 	ld (x),a 
      008D3D 06               [ 2] 2260 	incw x 
      008D3E A1 31 27 02      [ 1] 2261 	inc in 
      008D42 20 09 A0         [ 4] 2262 	ld a,([in.w],y)
      008D45 30               [ 1] 2263 	ld (x),a 
      008D46 46               [ 2] 2264 	incw x 
      008D47 09 02 09 01      [ 1] 2265 	inc in  
      008D4B 20               [ 1] 2266 	clr (x) 
      008D4C E4               [ 1] 2267 	ld xl,a 
      008D4D A6 03            [ 1] 2268 	ld a,#TK_CHAR 
      008D4D 7F 1E 01         [ 2] 2269 	jp token_exit 
      000D92                       2270 rparnt_tst:		
      000D92                       2271 	_case ')' colon_tst 
      008D50 A6 04            [ 1]    1 	ld a,#')' 
      008D52 5B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D54 81 05            [ 1]    3 	jrne colon_tst
      008D55 A6 0C            [ 1] 2272 	ld a,#TK_RPAREN 
      008D55 CD 8F 50         [ 2] 2273 	jp token_char 
      000D9D                       2274 colon_tst:
      000D9D                       2275 	_case ':' comma_tst 
      008D58 F7 5C            [ 1]    1 	ld a,#':' 
      008D5A 72 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008D5C 00 02            [ 1]    3 	jrne comma_tst
      008D5E 91 D6            [ 1] 2276 	ld a,#TK_COLON 
      008D60 01 CD 85         [ 2] 2277 	jp token_char 
      000DA8                       2278 comma_tst:
      000DA8                       2279 	_case COMMA sharp_tst 
      008D63 98 25            [ 1]    1 	ld a,#COMMA 
      008D65 EF 7F            [ 1]    2 	cp a,(TCHAR,sp) 
      008D67 72 5D            [ 1]    3 	jrne sharp_tst
      008D69 17 19            [ 1] 2280 	ld a,#TK_COMMA
      008D6B 26 15 C6         [ 2] 2281 	jp token_char
      000DB3                       2282 sharp_tst:
      000DB3                       2283 	_case SHARP dash_tst 
      008D6E 17 18            [ 1]    1 	ld a,#SHARP 
      008D70 A0 41            [ 1]    2 	cp a,(TCHAR,sp) 
      008D72 48 88            [ 1]    3 	jrne dash_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008D74 4B 00            [ 1] 2284 	ld a,#TK_SHARP
      008D76 AE 00 22         [ 2] 2285 	jp token_char  	 	 
      000DBE                       2286 dash_tst: 	
      000DBE                       2287 	_case '-' at_tst 
      008D79 72 FB            [ 1]    1 	ld a,#'-' 
      008D7B 01 5B            [ 1]    2 	cp a,(TCHAR,sp) 
      008D7D 02 A6            [ 1]    3 	jrne at_tst
      008D7F 05 20            [ 1] 2288 	ld a,#TK_MINUS  
      008D81 0C 0E B4         [ 2] 2289 	jp token_char 
      008D82                       2290 at_tst:
      000DC9                       2291 	_case '@' qmark_tst 
      008D82 AE A3            [ 1]    1 	ld a,#'@' 
      008D84 ED CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008D86 91 EC            [ 1]    3 	jrne qmark_tst
      008D88 4D 26            [ 1] 2292 	ld a,#TK_ARRAY 
      008D8A 03 CC 87         [ 2] 2293 	jp token_char
      000DD4                       2294 qmark_tst:
      000DD4                       2295 	_case '?' tick_tst 
      008D8D AF 81            [ 1]    1 	ld a,#'?' 
      008D8F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D8F 26 11            [ 1]    3 	jrne tick_tst
      008D8F 90 AE            [ 1] 2296 	ld a,(TCHAR,sp)
      008D91 16               [ 1] 2297 	ld (x),a 
      008D92 C8               [ 2] 2298 	incw x 
      008D93 C6               [ 1] 2299 	clr (x)
      008D94 00 02 C1 00      [ 1] 2300 	inc in 
      008D98 04 2B            [ 1] 2301 	ld a,#TK_CMD 
      008D9A 03 A6 00         [ 2] 2302 	ldw x,#print 
      008D9D 81 0E C4         [ 2] 2303 	jp token_exit
      008D9E                       2304 tick_tst: ; ignore comment 
      000DEB                       2305 	_case TICK plus_tst 
      008D9E 52 02            [ 1]    1 	ld a,#TICK 
      008DA0 AE 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA2 18 A6            [ 1]    3 	jrne plus_tst
      008DA4 20 CD 90 08      [ 1] 2306 	inc in 
      008DA8 55 00            [ 1] 2307 	ld a,#TK_CMD 
      008DAA 02 00 03         [ 2] 2308 	ldw x,#rem 
      008DAD 91 D6 01         [ 2] 2309 	jp token_exit 
      000DFD                       2310 plus_tst:
      000DFD                       2311 	_case '+' star_tst 
      008DB0 26 07            [ 1]    1 	ld a,#'+' 
      008DB2 72 5F            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB4 17 18            [ 1]    3 	jrne star_tst
      008DB6 CC 8F            [ 1] 2312 	ld a,#TK_PLUS  
      008DB8 44 0E B4         [ 2] 2313 	jp token_char 
      008DB9                       2314 star_tst:
      000E08                       2315 	_case '*' slash_tst 
      008DB9 CD 8F            [ 1]    1 	ld a,#'*' 
      008DBB 50 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008DBD 01 A6            [ 1]    3 	jrne slash_tst
      008DBF 22 11            [ 1] 2316 	ld a,#TK_MULT 
      008DC1 01 26 06         [ 2] 2317 	jp token_char 
      000E13                       2318 slash_tst: 
      000E13                       2319 	_case '/' prcnt_tst 
      008DC4 CD 8C            [ 1]    1 	ld a,#'/' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DC6 9A CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC8 8F 44            [ 1]    3 	jrne prcnt_tst
      008DCA A6 21            [ 1] 2320 	ld a,#TK_DIV 
      008DCA A6 24 11         [ 2] 2321 	jp token_char 
      000E1E                       2322 prcnt_tst:
      000E1E                       2323 	_case '%' eql_tst 
      008DCD 01 27            [ 1]    1 	ld a,#'%' 
      008DCF 13 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD1 26 11            [ 1]    3 	jrne eql_tst
      008DD3 01 26            [ 1] 2324 	ld a,#TK_MOD
      008DD5 06 CD 8D         [ 2] 2325 	jp token_char  
                                   2326 ; 1 or 2 character tokens 	
      000E29                       2327 eql_tst:
      000E29                       2328 	_case '=' gt_tst 		
      008DD8 2D CC            [ 1]    1 	ld a,#'=' 
      008DDA 8F 44            [ 1]    2 	cp a,(TCHAR,sp) 
      008DDC 7B 01            [ 1]    3 	jrne gt_tst
      008DDE CD 8F            [ 1] 2329 	ld a,#TK_EQUAL
      008DE0 47 24 06         [ 2] 2330 	jp token_char 
      000E34                       2331 gt_tst:
      000E34                       2332 	_case '>' lt_tst 
      008DE3 CD 8C            [ 1]    1 	ld a,#'>' 
      008DE5 F2 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE7 8F 44            [ 1]    3 	jrne lt_tst
      008DE9 A6 31            [ 1] 2333 	ld a,#TK_GT 
      008DE9 A6 28            [ 1] 2334 	ld (ATTRIB,sp),a 
      008DEB 11 01 26 05      [ 1] 2335 	inc in 
      008DEF A6 0B CC         [ 4] 2336 	ld a,([in.w],y)
      008DF2 8F 34            [ 1] 2337 	cp a,#'=
      008DF4 26 0C            [ 1] 2338 	jrne 1$
      008DF4 A6 5C            [ 1] 2339 	ld a,(TCHAR,sp)
      008DF6 11               [ 1] 2340 	ld (x),a
      008DF7 01               [ 2] 2341 	incw x 
      008DF8 26 18            [ 1] 2342 	ld a,#'=
      008DFA 7B 01            [ 1] 2343 	ld (TCHAR,sp),a 
      008DFC F7 5C            [ 1] 2344 	ld a,#TK_GE 
      008DFE 72 5C            [ 2] 2345 	jra token_char  
      008E00 00 02            [ 1] 2346 1$: cp a,#'<
      008E02 91 D6            [ 1] 2347 	jrne 2$
      008E04 01 F7            [ 1] 2348 	ld a,(TCHAR,sp)
      008E06 5C               [ 1] 2349 	ld (x),a
      008E07 72               [ 2] 2350 	incw x 
      008E08 5C 00            [ 1] 2351 	ld a,#'<	
      008E0A 02 7F            [ 1] 2352 	ld (TCHAR,sp),a 
      008E0C 97 A6            [ 1] 2353 	ld a,#TK_NE 
      008E0E 03 CC            [ 2] 2354 	jra token_char 
      008E10 8F 44 00 01      [ 1] 2355 2$: dec in
      008E12 7B 02            [ 1] 2356 	ld a,(ATTRIB,sp)
      008E12 A6 29            [ 2] 2357 	jra token_char 
      000E6D                       2358 lt_tst:
      000E6D                       2359 	_case '<' other
      008E14 11 01            [ 1]    1 	ld a,#'<' 
      008E16 26 05            [ 1]    2 	cp a,(TCHAR,sp) 
      008E18 A6 0C            [ 1]    3 	jrne other
      008E1A CC 8F            [ 1] 2360 	ld a,#TK_LT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E1C 34 02            [ 1] 2361 	ld (ATTRIB,sp),a 
      008E1D 72 5C 00 01      [ 1] 2362 	inc in 
      008E1D A6 3A 11         [ 4] 2363 	ld a,([in.w],y)
      008E20 01 26            [ 1] 2364 	cp a,#'=
      008E22 05 A6            [ 1] 2365 	jrne 1$
      008E24 01 CC            [ 1] 2366 	ld a,(TCHAR,sp)
      008E26 8F               [ 1] 2367 	ld (x),a 
      008E27 34 3D            [ 1] 2368 	ld a,#'=
      008E28 6B 01            [ 1] 2369 	ld (TCHAR,sp),a 
      008E28 A6 2C            [ 1] 2370 	ld a,#TK_LE 
      008E2A 11 01            [ 2] 2371 	jra token_char 
      008E2C 26 05            [ 1] 2372 1$: cp a,#'>
      008E2E A6 0D            [ 1] 2373 	jrne 2$
      008E30 CC 8F            [ 1] 2374 	ld a,(TCHAR,sp)
      008E32 34               [ 1] 2375 	ld (x),a 
      008E33 5C               [ 2] 2376 	incw x 
      008E33 A6 23            [ 1] 2377 	ld a,#'>
      008E35 11 01            [ 1] 2378 	ld (TCHAR,sp),a 
      008E37 26 05            [ 1] 2379 	ld a,#TK_NE 
      008E39 A6 0E            [ 2] 2380 	jra token_char 
      008E3B CC 8F 34 01      [ 1] 2381 2$: dec in 
      008E3E 7B 02            [ 1] 2382 	ld a,(ATTRIB,sp)
      008E3E A6 2D            [ 2] 2383 	jra token_char 	
      000EA5                       2384 other: ; not a special character 	 
      008E40 11 01            [ 1] 2385 	ld a,(TCHAR,sp)
      008E42 26 05 A6         [ 4] 2386 	call is_alpha 
      008E45 11 CC            [ 1] 2387 	jrc 30$ 
      008E47 8F 34 2F         [ 2] 2388 	jp syntax_error 
      008E49                       2389 30$: 
      008E49 A6 40 11         [ 4] 2390 	call parse_keyword
      008E4C 01 26            [ 2] 2391 	jra token_exit 
      000EB4                       2392 token_char:
      008E4E 05 A6            [ 1] 2393 	ld (ATTRIB,sp),a 
      008E50 02 CC            [ 1] 2394 	ld a,(TCHAR,sp)
      008E52 8F               [ 1] 2395 	ld (x),a 
      008E53 34               [ 2] 2396 	incw x 
      008E54 7F               [ 1] 2397 	clr(x)
      008E54 A6 3F 11 01      [ 1] 2398 	inc in 
      008E58 26 11            [ 1] 2399 	ld a,(ATTRIB,sp)
      008E5A 7B 01 F7         [ 2] 2400 	ldw x,#pad 
      000EC4                       2401 token_exit:
      000EC4                       2402 	_drop VSIZE 
      008E5D 5C 7F            [ 2]    1     addw sp,#VSIZE 
      008E5F 72               [ 4] 2403 	ret
                                   2404 
                                   2405 
                                   2406 
                                   2407 ;------------------------------------
                                   2408 ; check if character in {'0'..'9'}
                                   2409 ; input:
                                   2410 ;    A  character to test
                                   2411 ; output:
                                   2412 ;    Carry  0 not digit | 1 digit
                                   2413 ;------------------------------------
      000EC7                       2414 is_digit:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E60 5C 00            [ 1] 2415 	cp a,#'0
      008E62 02 A6            [ 1] 2416 	jrc 1$
      008E64 06 AE            [ 1] 2417     cp a,#'9+1
      008E66 96               [ 1] 2418 	ccf 
      008E67 9F               [ 1] 2419 1$:	ccf 
      008E68 CC               [ 4] 2420     ret
                                   2421 
                                   2422 ;------------------------------------
                                   2423 ; convert alpha to uppercase
                                   2424 ; input:
                                   2425 ;    a  character to convert
                                   2426 ; output:
                                   2427 ;    a  uppercase character
                                   2428 ;------------------------------------
      000ED0                       2429 to_upper::
      008E69 8F 44            [ 1] 2430 	cp a,#'a
      008E6B 2A 01            [ 1] 2431 	jrpl 1$
      008E6B A6               [ 4] 2432 0$:	ret
      008E6C 27 11            [ 1] 2433 1$: cp a,#'z	
      008E6E 01 26            [ 1] 2434 	jrugt 0$
      008E70 0C 72            [ 1] 2435 	sub a,#32
      008E72 5C               [ 4] 2436 	ret
                                   2437 	
                                   2438 ;------------------------------------
                                   2439 ; convert pad content in integer
                                   2440 ; input:
                                   2441 ;    pad		.asciz to convert
                                   2442 ; output:
                                   2443 ;    acc24      int24_t
                                   2444 ;------------------------------------
                                   2445 	; local variables
                           000001  2446 	SIGN=1 ; 1 byte, 
                           000002  2447 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2448 	TEMP=3 ; 1 byte, temporary storage
                           000003  2449 	VSIZE=3 ; 3 bytes reserved for local storage
      000EDC                       2450 atoi24:
      008E73 00               [ 2] 2451 	pushw x ;save x
      008E74 02 A6            [ 2] 2452 	sub sp,#VSIZE
                                   2453 	; acc24=0 
      008E76 06 AE 97 A4      [ 1] 2454 	clr acc24    
      008E7A CC 8F 44 08      [ 1] 2455 	clr acc16
      008E7D 72 5F 00 09      [ 1] 2456 	clr acc8 
      008E7D A6 2B 11         [ 1] 2457 	ld a, pad 
      008E80 01 26            [ 1] 2458 	jreq atoi_exit
      008E82 05 A6            [ 1] 2459 	clr (SIGN,sp)
      008E84 10 CC            [ 1] 2460 	ld a,#10
      008E86 8F 34            [ 1] 2461 	ld (BASE,sp),a ; default base decimal
      008E88 AE 17 18         [ 2] 2462 	ldw x,#pad ; pointer to string to convert
      008E88 A6               [ 1] 2463 	ld a,(x)
      008E89 2A 11            [ 1] 2464 	jreq 9$  ; completed if 0
      008E8B 01 26            [ 1] 2465 	cp a,#'-
      008E8D 05 A6            [ 1] 2466 	jrne 1$
      008E8F 20 CC            [ 1] 2467 	cpl (SIGN,sp)
      008E91 8F 34            [ 2] 2468 	jra 2$
      008E93 A1 24            [ 1] 2469 1$: cp a,#'$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008E93 A6 2F            [ 1] 2470 	jrne 3$
      008E95 11 01            [ 1] 2471 	ld a,#16
      008E97 26 05            [ 1] 2472 	ld (BASE,sp),a
      008E99 A6               [ 2] 2473 2$:	incw x
      008E9A 21               [ 1] 2474 	ld a,(x)
      000F0E                       2475 3$:	
      008E9B CC 8F            [ 1] 2476 	cp a,#'a
      008E9D 34 02            [ 1] 2477 	jrmi 4$
      008E9E A0 20            [ 1] 2478 	sub a,#32
      008E9E A6 25            [ 1] 2479 4$:	cp a,#'0
      008EA0 11 01            [ 1] 2480 	jrmi 9$
      008EA2 26 05            [ 1] 2481 	sub a,#'0
      008EA4 A6 22            [ 1] 2482 	cp a,#10
      008EA6 CC 8F            [ 1] 2483 	jrmi 5$
      008EA8 34 07            [ 1] 2484 	sub a,#7
      008EA9 11 02            [ 1] 2485 	cp a,(BASE,sp)
      008EA9 A6 3D            [ 1] 2486 	jrpl 9$
      008EAB 11 01            [ 1] 2487 5$:	ld (TEMP,sp),a
      008EAD 26 05            [ 1] 2488 	ld a,(BASE,sp)
      008EAF A6 32 CC         [ 4] 2489 	call mulu24_8
      008EB2 8F 34            [ 1] 2490 	ld a,(TEMP,sp)
      008EB4 CB 00 09         [ 1] 2491 	add a,acc24+2
      008EB4 A6 3E 11         [ 1] 2492 	ld acc24+2,a
      008EB7 01               [ 1] 2493 	clr a
      008EB8 26 33 A6         [ 1] 2494 	adc a,acc24+1
      008EBB 31 6B 02         [ 1] 2495 	ld acc24+1,a
      008EBE 72               [ 1] 2496 	clr a
      008EBF 5C 00 02         [ 1] 2497 	adc a,acc24
      008EC2 91 D6 01         [ 1] 2498 	ld acc24,a
      008EC5 A1 3D            [ 2] 2499 	jra 2$
      008EC7 26 0C            [ 1] 2500 9$:	tnz (SIGN,sp)
      008EC9 7B 01            [ 1] 2501     jreq atoi_exit
      008ECB F7 5C A6         [ 4] 2502     call neg_acc24
      000F4A                       2503 atoi_exit: 
      008ECE 3D 6B            [ 2] 2504 	addw sp,#VSIZE
      008ED0 01               [ 2] 2505 	popw x ; restore x
      008ED1 A6               [ 4] 2506 	ret
                                   2507 
                                   2508 ;--------------------------------------
                                   2509 ; unsigned multiply uint24_t by uint8_t
                                   2510 ; use to convert numerical string to uint24_t
                                   2511 ; input:
                                   2512 ;	acc24	uint24_t 
                                   2513 ;   A		uint8_t
                                   2514 ; output:
                                   2515 ;   acc24   A*acc24
                                   2516 ;-------------------------------------
                                   2517 ; local variables offset  on sp
                           000003  2518 	U8   = 3   ; A pushed on stack
                           000002  2519 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2520 	OVFH = 1  ; multiplication overflow high byte
                           000003  2521 	VSIZE = 3
      000F4E                       2522 mulu24_8:
      008ED2 33               [ 2] 2523 	pushw x    ; save X
                                   2524 	; local variables
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008ED3 20               [ 1] 2525 	push a     ; U8
      008ED4 5F               [ 1] 2526 	clrw x     ; initialize overflow to 0
      008ED5 A1               [ 2] 2527 	pushw x    ; multiplication overflow
                                   2528 ; multiply low byte.
      008ED6 3C 26 0C         [ 1] 2529 	ld a,acc24+2
      008ED9 7B               [ 1] 2530 	ld xl,a
      008EDA 01 F7            [ 1] 2531 	ld a,(U8,sp)
      008EDC 5C               [ 4] 2532 	mul x,a
      008EDD A6               [ 1] 2533 	ld a,xl
      008EDE 3C 6B 01         [ 1] 2534 	ld acc24+2,a
      008EE1 A6               [ 1] 2535 	ld a, xh
      008EE2 35 20            [ 1] 2536 	ld (OVFL,sp),a
                                   2537 ; multipy middle byte
      008EE4 4F 72 5A         [ 1] 2538 	ld a,acc24+1
      008EE7 00               [ 1] 2539 	ld xl,a
      008EE8 02 7B            [ 1] 2540 	ld a, (U8,sp)
      008EEA 02               [ 4] 2541 	mul x,a
                                   2542 ; add overflow to this partial product
      008EEB 20 47 01         [ 2] 2543 	addw x,(OVFH,sp)
      008EED 9F               [ 1] 2544 	ld a,xl
      008EED A6 3C 11         [ 1] 2545 	ld acc24+1,a
      008EF0 01               [ 1] 2546 	clr a
      008EF1 26 32            [ 1] 2547 	adc a,#0
      008EF3 A6 34            [ 1] 2548 	ld (OVFH,sp),a
      008EF5 6B               [ 1] 2549 	ld a,xh
      008EF6 02 72            [ 1] 2550 	ld (OVFL,sp),a
                                   2551 ; multiply most signficant byte	
      008EF8 5C 00 02         [ 1] 2552 	ld a, acc24
      008EFB 91               [ 1] 2553 	ld xl, a
      008EFC D6 01            [ 1] 2554 	ld a, (U8,sp)
      008EFE A1               [ 4] 2555 	mul x,a
      008EFF 3D 26 0B         [ 2] 2556 	addw x, (OVFH,sp)
      008F02 7B               [ 1] 2557 	ld a, xl
      008F03 01 F7 A6         [ 1] 2558 	ld acc24,a
      008F06 3D 6B            [ 2] 2559     addw sp,#VSIZE
      008F08 01               [ 2] 2560 	popw x
      008F09 A6               [ 4] 2561 	ret
                                   2562 
                                   2563 ;------------------------------------
                                   2564 ; skip character c in text starting from 'in'
                                   2565 ; input:
                                   2566 ;	 y 		point to text buffer
                                   2567 ;    a 		character to skip
                                   2568 ; output:  
                                   2569 ;	'in' ajusted to new position
                                   2570 ;------------------------------------
                           000001  2571 	C = 1 ; local var
      000F88                       2572 skip:
      008F0A 36               [ 1] 2573 	push a
      008F0B 20 27 A1         [ 4] 2574 1$:	ld a,([in.w],y)
      008F0E 3E 26            [ 1] 2575 	jreq 2$
      008F10 0C 7B            [ 1] 2576 	cp a,(C,sp)
      008F12 01 F7            [ 1] 2577 	jrne 2$
      008F14 5C A6 3E 6B      [ 1] 2578 	inc in
      008F18 01 A6            [ 2] 2579 	jra 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      000F98                       2580 2$: _drop 1 
      008F1A 35 20            [ 2]    1     addw sp,#1 
      008F1C 17               [ 4] 2581 	ret
                                   2582 	
                                   2583 ;------------------------------
                                   2584 ; restore 'in.w' variable to 
                                   2585 ; its value before last call
                                   2586 ; to get_token.
                                   2587 ;------------------------------
      000F9B                       2588 unget_token:
      008F1D 72 5A 00 02 7B   [ 1] 2589 	mov in,in.saved
      008F22 02               [ 4] 2590 	ret 
                                   2591 
                                   2592 
                                   2593 ;******************************
                                   2594 ;  data stack manipulation
                                   2595 ;*****************************
                                   2596 ;----------------------	
                                   2597 ; push X on data stack 
                                   2598 ; input:
                                   2599 ;	X 
                                   2600 ; output:
                                   2601 ;	none 
                                   2602 ;----------------------	
      000FA1                       2603 dpush:
      000FA1                       2604     _dp_down
      008F23 20 0F 00 17      [ 1]    1     dec dstkptr+1 
      008F25 72 5A 00 17      [ 1]    2     dec dstkptr+1
      008F25 7B 01 CD 85      [ 5] 2605     ldw [dstkptr],x  
      008F29 98               [ 4] 2606 	ret 
                                   2607 
                                   2608 
                                   2609 ;----------------------	
                                   2610 ; pop data stack in X 
                                   2611 ; input:
                                   2612 ;	none
                                   2613 ; output:
                                   2614 ;	X   
                                   2615 ;----------------------	
      000FAE                       2616 dpop: 
      008F2A 25 03 CC 87      [ 5] 2617     ldw x, [dstkptr]
      000FB2                       2618 	_dp_up
      008F2E AF 5C 00 17      [ 1]    1     inc dstkptr+1
      008F2F 72 5C 00 17      [ 1]    2     inc dstkptr+1
      008F2F CD               [ 4] 2619 	ret 
                                   2620 
                                   2621 ;-----------------------------
                                   2622 ; swap top 2 elements of dstack
                                   2623 ;  {n1 n2 -- n2 n1 }
                                   2624 ;-----------------------------
      000FBB                       2625 dswap:
      008F30 8D 55 20 10      [ 5] 2626 	ldw x,[dstkptr]
      008F34 89               [ 2] 2627 	pushw x 
      008F34 6B 02 7B         [ 2] 2628 	ldw x,#2 
      008F37 01 F7 5C 7F      [ 5] 2629 	ldw x,([dstkptr],x) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008F3B 72 5C 00 02      [ 5] 2630 	ldw [dstkptr],x 
      008F3F 7B 02 AE         [ 2] 2631 	ldw x,#2
      008F42 17 18            [ 2] 2632 	popw y 
      008F44 72 DF 00 16      [ 5] 2633 	ldw ([dstkptr],x),y 
      008F44 5B               [ 4] 2634 	ret
                                   2635 
                                   2636 ;-----------------------------
                                   2637 ; drop TOS 
                                   2638 ;-----------------------------
      000FD5                       2639 ddrop: ; { n -- }
      000FD5                       2640 	_dp_up 
      008F45 02 81 00 17      [ 1]    1     inc dstkptr+1
      008F47 72 5C 00 17      [ 1]    2     inc dstkptr+1
      008F47 A1               [ 4] 2641 	ret
                                   2642 	
                                   2643 ;-----------------------------
                                   2644 ; duplicate TOS 
                                   2645 ;  dstack: { ix...n -- ix...n n }
                                   2646 ;-----------------------------
      000FDE                       2647 ddup:
      008F48 30 25 03 A1      [ 5] 2648 	ldw x,[dstkptr]
      000FE2                       2649 	_dp_down
      008F4C 3A 8C 8C 81      [ 1]    1     dec dstkptr+1 
      008F50 72 5A 00 17      [ 1]    2     dec dstkptr+1
      008F50 A1 61 2A 01      [ 5] 2650     ldw [dstkptr],x  
      008F54 81               [ 4] 2651 	ret 
                                   2652 
                                   2653 
                                   2654 ;----------------------------------
                                   2655 ; pick value n from dstack 
                                   2656 ; put it on TOS
                                   2657 ; dstack: {ix,..,p -- ix,...,np }
                                   2658 ;-----------------------------------
      000FEF                       2659 dpick:
      008F55 A1 7A 22 FB      [ 5] 2660 	ldw x,[dstkptr]
      008F59 A0               [ 2] 2661 	sllw x 
      008F5A 20 81 00 16      [ 2] 2662 	addw x,dstkptr 
      008F5C FE               [ 2] 2663 	ldw x,(x)
      008F5C 89 52 03 72      [ 5] 2664 	ldw [dstkptr],x 
      008F60 5F               [ 4] 2665 	ret
                                   2666 
                                   2667 ;---------------------------
                                   2668 ;  fetch variable in X 
                                   2669 ;  dstack:{ addr -- value }
                                   2670 ;---------------------------
      000FFE                       2671 fetch:
      008F61 00 08 72 5F      [ 5] 2672 	ldw x,[dstkptr]
      008F65 00               [ 2] 2673 	ldw x,(x)
      008F66 09 72 5F 00      [ 5] 2674 	ldw [dstkptr],x
      008F6A 0A               [ 4] 2675 	ret 
                                   2676 
                                   2677 ;----------------------------
                                   2678 ; store variable 
                                   2679 ; dstack: {addr value -- }
                                   2680 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      001008                       2681 store:
      008F6B C6 17 18         [ 4] 2682 	call dpop 
      008F6E 27 5A            [ 1] 2683 	ldw y,x   ; y=value 
      008F70 0F 01 A6         [ 4] 2684 	call dpop 
      008F73 0A               [ 2] 2685 	ldw (x),y 
      008F74 6B               [ 4] 2686 	ret 
                                   2687 
                                   2688 ;---------------------------------
                                   2689 ; drop n elements from data stack 
                                   2690 ; input: 
                                   2691 ;   X 		n 
                                   2692 ; output:
                                   2693 ;   none 
                                   2694 ;-------------------------------------
      001012                       2695 ddrop_n:
      008F75 02 AE            [ 2] 2696 	pushw y 
      008F77 17 18 F6 27      [ 2] 2697 	ldw y,dstkptr 
      008F7B 47               [ 2] 2698 	sllw x 
      008F7C A1               [ 2] 2699 	pushw x 
      008F7D 2D 26 04         [ 2] 2700 	addw y,(1,sp)
      008F80 03 01 20 08      [ 2] 2701 	ldw dstkptr,y 
      008F84 A1               [ 2] 2702 	popw x 
      008F85 24 26            [ 2] 2703 	popw y
      008F87 06               [ 4] 2704 	ret 
                                   2705 
      008F88 A6 10 6B 02 5C F6 6B  2706 dstk_prompt: .asciz "\ndstack: " 
             3A 20 00
                                   2707 ;----------------------------
                                   2708 ; print dstack content 
                                   2709 ;---------------------------
                           000001  2710 	XSAVE=1
                           000002  2711 	VSIZE=2
      008F8E                       2712 dots:
      00102F                       2713 	_vars VSIZE 
      008F8E A1 61            [ 2]    1     sub sp,#VSIZE 
      008F90 2B 02 A0         [ 2] 2714 	ldw x,#dstk_prompt 
      008F93 20 A1 30         [ 4] 2715 	call puts
      008F96 2B 2B A0         [ 2] 2716 	ldw x,#dstack_unf-CELL_SIZE
      008F99 30 A1 0A 2B      [ 1] 2717 	mov base,#10 
      008F9D 06 A0 07         [ 2] 2718 1$:	cpw x,dstkptr 
      008FA0 11 02            [ 1] 2719 	jrult 4$ 
      008FA2 2A 1F            [ 2] 2720 	ldw (XSAVE,sp),x
      008FA4 6B               [ 2] 2721 	ldw  x,(x)
      008FA5 03 7B 02         [ 4] 2722 	call print_int 
      008FA8 CD 8F            [ 2] 2723 	ldw x,(XSAVE,sp)
      008FAA CE 7B 03         [ 2] 2724 	subw x,#CELL_SIZE 
      008FAD CB 00            [ 2] 2725 	jra 1$ 
      008FAF 0A C7            [ 1] 2726 4$: ld a,#CR 
      008FB1 00 0A 4F         [ 4] 2727 	call putc 
      001055                       2728 	_drop VSIZE
      008FB4 C9 00            [ 2]    1     addw sp,#VSIZE 
      008FB6 09               [ 1] 2729 	clr a 
      008FB7 C7               [ 4] 2730 	ret
                                   2731 
      008FB8 00 09 4F C9 00 08 C7  2732 cstk_prompt: .asciz "\nctack: "
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal  00-Bits]



             20 00
                                   2733 ;--------------------------------
                                   2734 ; print cstack content
                                   2735 ;--------------------------------
                           000001  2736 	XSAVE=1
                           000002  2737 	VSIZE=2 
      001062                       2738 dotr:
      001062                       2739 	_vars VSIZE 
      008FC0 08 20            [ 2]    1     sub sp,#VSIZE 
      008FC2 C9 0D 01         [ 2] 2740 	ldw x,#cstk_prompt
      008FC5 27 03 CD         [ 4] 2741 	call puts 
      008FC8 8A               [ 1] 2742 	ldw x,sp 
      008FC9 F3 00 07         [ 2] 2743 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008FCA 1F 01            [ 2] 2744 	ldw (XSAVE,sp),x  
      008FCA 5B 03 85         [ 2] 2745 	ldw x,#RAM_SIZE-2
      008FCD 81 10 00 06      [ 1] 2746 	mov base,#16
      008FCE                       2747 dotr_loop:
      008FCE 89 88            [ 2] 2748 	cpw x,(XSAVE,sp)
      008FD0 5F 89            [ 1] 2749 	jrmi 9$
      008FD2 C6               [ 2] 2750 	pushw x  
      008FD3 00               [ 2] 2751 	ldw x,(x)
      008FD4 0A 97 7B         [ 4] 2752 	call print_int 
      008FD7 03               [ 2] 2753 	popw x  
      008FD8 42 9F C7         [ 2] 2754 	subw x,#CELL_SIZE
      008FDB 00 0A            [ 2] 2755 	jra dotr_loop 
      008FDD 9E 6B            [ 1] 2756 9$:	ld a,#CR 
      008FDF 02 C6 00         [ 4] 2757 	call putc 
      00108B                       2758 	_drop VSIZE 
      008FE2 09 97            [ 2]    1     addw sp,#VSIZE 
      008FE4 7B               [ 1] 2759 	clr a 
      008FE5 03               [ 4] 2760 	ret
                                   2761 
                                   2762 
                                   2763 ;--------------------------------
                                   2764 ;  add 2 integers
                                   2765 ;  input:
                                   2766 ;    N1     on cstack 
                                   2767 ;    N2     on cstack 
                                   2768 ;  output:
                                   2769 ;    X 		n2+n1 
                                   2770 ;--------------------------------
                                   2771 	;arugments on cstack 
      00108F                       2772 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00108F                       2773 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      00108F                       2774 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      00108F                       2775 add:
      008FE6 42 72            [ 2] 2776 	ldw x ,(N2,sp)
      008FE8 FB 01 9F         [ 2] 2777 	addw x,(N1,sp)
      008FEB C7 00            [ 2] 2778 	ldw (N1,sp),x 
      008FED 09               [ 4] 2779 	ret 
                                   2780 
                                   2781 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2782 ;  substract 2 ntegers
                                   2783 ;  input:
                                   2784 ;    N1     on cstack 
                                   2785 ;    N2     on cstack 
                                   2786 ;  output:
                                   2787 ;    X 		n2+n1 
                                   2788 ;--------------------------------
      001097                       2789 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001097                       2790 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001097                       2791 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001097                       2792 substract:
      008FEE 4F A9            [ 2] 2793 	ldw x,(N2,sp)
      008FF0 00 6B 01         [ 2] 2794 	subw x,(N1,sp)
      008FF3 9E               [ 4] 2795 	ret 
                                   2796 
                                   2797 ;-------------------------------------
                                   2798 ; multiply 2 integers
                                   2799 ; product overflow is ignored unless
                                   2800 ; MATH_OVF assembler flag is set to 1
                                   2801 ; input:
                                   2802 ;  	N1      on cstack
                                   2803 ;   N2 		on cstack 
                                   2804 ; output:
                                   2805 ;	X        N1*N2 
                                   2806 ;-------------------------------------
                                   2807 	;arguments 
      00109D                       2808 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      00109D                       2809 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      00109D                       2810 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      00109D                       2811 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      00109D                       2812 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2813    ; local variables 
                           000001  2814 	SIGN=1
                           000002  2815 	PROD=2
                           000003  2816 	VSIZE=3
      00109D                       2817 multiply:
      00109D                       2818 	_vars VSIZE 
      008FF4 6B 02            [ 2]    1     sub sp,#VSIZE 
      008FF6 C6 00            [ 1] 2819 	clr (SIGN,sp)
      008FF8 08 97            [ 2] 2820 	ldw x,(N1_HB,sp)
      008FFA 7B               [ 1] 2821 	ld a,xh  
      008FFB 03 42            [ 1] 2822 	bcp a,#0x80 
      008FFD 72 FB            [ 1] 2823 	jreq 2$
      008FFF 01 9F            [ 1] 2824 	cpl (SIGN,sp)
      009001 C7               [ 2] 2825 	negw x 
      009002 00 08            [ 2] 2826 	ldw (N1_HB,sp),x 
      009004 5B 03            [ 2] 2827 2$: ldw x,(N2_HB,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009006 85               [ 1] 2828 	ld a,xh  
      009007 81 80            [ 1] 2829 	bcp a,#0x80 
      009008 27 05            [ 1] 2830 	jreq 3$
      009008 88 91            [ 1] 2831 	cpl (SIGN,sp)
      00900A D6               [ 2] 2832 	negw x 
      00900B 01 27            [ 2] 2833 	ldw (N2_HB,sp),x 
                                   2834 ; N1_LB * N2_LB 	
      00900D 0A 11            [ 1] 2835 3$:	ld a,(N1_LB,sp)
      00900F 01               [ 1] 2836 	ld xl,a 
      009010 26 06            [ 1] 2837 	ld a,(N2_LB,sp) 
      009012 72               [ 4] 2838 	mul x,a 
                           000000  2839 .if MATH_OVF 	
                                   2840 	ld a,xh 
                                   2841 	bcp a,#0x80 
                                   2842 	jreq 4$ 
                                   2843 	ld a,#ERR_MATH_OVF 
                                   2844 	jp tb_error
                                   2845 .endif 	 
      009013 5C 00            [ 2] 2846 4$:	ldw (PROD,sp),x
                                   2847 ; N1_LB * N2_HB	 
      009015 02 20            [ 1] 2848 	ld a,(N1_LB,sp) 
      009017 F1               [ 1] 2849 	ld xl,a 
      009018 5B 01            [ 1] 2850 	ld a,(N2_HB,sp)
      00901A 81               [ 4] 2851 	mul x,a
      00901B 9F               [ 1] 2852 	ld a,xl 
      00901B 55 00            [ 1] 2853 	add a,(PROD,sp)
                           000000  2854 .if MATH_OVF 	
                                   2855 	bcp a,#0x80 
                                   2856 	jreq 5$ 
                                   2857 	ld a,#ERR_MATH_OVF 
                                   2858 	jp tb_error
                                   2859 .endif 	 
      00901D 03 00            [ 1] 2860 5$:	ld (PROD,sp),a 
                                   2861 ; N1_HB * N2_LB 
      00901F 02 81            [ 1] 2862 	ld a,(N1_HB,sp)
      009021 97               [ 1] 2863 	ld xl,a 
      009021 72 5A            [ 1] 2864 	ld a,(N2_LB,sp)
      009023 00               [ 4] 2865 	mul x,a 
      009024 18               [ 1] 2866 	ld a,xl 
      009025 72 5A            [ 1] 2867 	add a,(PROD,sp)
                           000000  2868 .if MATH_OVF 	
                                   2869 	bcp a,#0x80 
                                   2870 	jreq 6$ 
                                   2871 	ld a,#ERR_MATH_OVF 
                                   2872 	jp tb_error
                                   2873 .endif 	 
      009027 00 18            [ 1] 2874 6$:	ld (PROD,sp),a 
                                   2875 ; N1_HB * N2_HB 	
                                   2876 ; it is pointless to multiply N1_HB*N2_HB 
                                   2877 ; as this product is over 65535 or 0 
                                   2878 ;
                                   2879 ; sign adjust product
      009029 72 CF            [ 1] 2880 	tnz (SIGN,sp)
      00902B 00 17            [ 1] 2881 	jreq 7$
      00902D 81 02            [ 2] 2882 	ldw x, (PROD,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00902E 50               [ 2] 2883 	negw x
      00902E 72 CE            [ 2] 2884 	ldw (PROD,sp),x  
      0010E0                       2885 7$: 
      009030 00 17            [ 2] 2886 	ldw x,(PROD,sp) 
      0010E2                       2887 	_drop VSIZE 
      009032 72 5C            [ 2]    1     addw sp,#VSIZE 
      009034 00               [ 4] 2888 	ret
                                   2889 
                                   2890 ;----------------------------------
                                   2891 ;  euclidian divide n2/n1 
                                   2892 ; input:
                                   2893 ;    N2 	on cstack
                                   2894 ;    N1 	on cstack
                                   2895 ; output:
                                   2896 ;    X      n2/n1 
                                   2897 ;    Y      remainder 
                                   2898 ;----------------------------------
      0010E5                       2899 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      0010E5                       2900 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      0010E5                       2901 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2902 	; local variables
                           000001  2903 	SQUOT=1 ; sign quotient
                           000002  2904 	SDIVD=2 ; sign dividend  
                           000002  2905 	VSIZE=2
      0010E5                       2906 divide:
      0010E5                       2907 	_vars VSIZE 
      009035 18 72            [ 2]    1     sub sp,#VSIZE 
      009037 5C 00            [ 1] 2908 	clr (SQUOT,sp)
      009039 18 81            [ 1] 2909 	clr (SDIVD,sp)
                                   2910 ; check for 0 divisor
      00903B 1E 05            [ 2] 2911 	ldw x,(DIVISR,sp)
      00903B 72               [ 2] 2912 	tnzw x 
      00903C CE 00            [ 1] 2913     jrne 0$
      00903E 17 89            [ 1] 2914 	ld a,#ERR_DIV0 
      009040 AE 00 02         [ 2] 2915 	jp tb_error 
                                   2916 ; check divisor sign 	
      009043 72               [ 1] 2917 0$:	ld a,xh 
      009044 DE 00            [ 1] 2918 	bcp a,#0x80 
      009046 17 72            [ 1] 2919 	jreq 1$
      009048 CF 00            [ 1] 2920 	cpl (SQUOT,sp)
      00904A 17               [ 2] 2921 	negw x 
      00904B AE 00            [ 2] 2922 1$:	ldw (DIVISR,sp),x
                                   2923 ; check dividend sign 	 
      00904D 02 90            [ 2] 2924     ldw x,(DIVIDND,sp)
      00904F 85               [ 1] 2925 	ld a,xh 
      009050 72 DF            [ 1] 2926 	bcp a,#0x80 
      009052 00 17            [ 1] 2927 	jreq 2$ 
      009054 81 01            [ 1] 2928 	cpl (SQUOT,sp)
      009055 03 02            [ 1] 2929 	cpl (SDIVD,sp)
      009055 72               [ 2] 2930 	negw x 
      009056 5C 00            [ 2] 2931 2$:	ldw y,(DIVISR,sp)
      009058 18               [ 2] 2932 	divw x,y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009059 72 5C 00 18      [ 2] 2933 	ldw acc16,y 
                                   2934 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      00905D 81 02            [ 1] 2935 	tnz (SDIVD,sp)
      00905E 27 0B            [ 1] 2936 	jreq 7$
      00905E 72 CE            [ 2] 2937 	tnzw y 
      009060 00 17            [ 1] 2938 	jreq 7$
      009062 72               [ 2] 2939 	incw x
      009063 5A 00            [ 2] 2940 	ldw y,(DIVISR,sp)
      009065 18 72 5A 00      [ 2] 2941 	subw y,acc16
      009069 18 72            [ 1] 2942 7$: tnz (SQUOT,sp)
      00906B CF 00            [ 1] 2943 	jreq 9$ 	 
      00906D 17               [ 2] 2944 8$:	negw x 
      001126                       2945 9$: 
      001126                       2946 	_drop VSIZE 
      00906E 81 02            [ 2]    1     addw sp,#VSIZE 
      00906F 81               [ 4] 2947 	ret 
                                   2948 
                                   2949 
                                   2950 ;----------------------------------
                                   2951 ;  remainder resulting from euclidian 
                                   2952 ;  division of n2/n1 
                                   2953 ; input:
                                   2954 ;   N1 		cstack 
                                   2955 ;   N2      cstack
                                   2956 ; output:
                                   2957 ;   X       N2%N1 
                                   2958 ;----------------------------------
                           000003  2959 	N1=3
                           000005  2960 	N2=5
                           000004  2961 	VSIZE=4
      001129                       2962 modulo:
      00906F 72 CE            [ 2] 2963 	Ldw x,(N1,sp)
      009071 00 17            [ 2] 2964 	ldw y,(N2,sp)
      00112D                       2965 	_vars VSIZE 
      009073 58 72            [ 2]    1     sub sp,#VSIZE 
      009075 BB 00            [ 2] 2966 	ldw (1,sp),x 
      009077 17 FE            [ 2] 2967 	ldw (3,sp),y 
      009079 72 CF 00         [ 4] 2968 	call divide 
      00907C 17               [ 1] 2969 	ldw x,y
      001137                       2970 	_drop VSIZE 
      00907D 81 04            [ 2]    1     addw sp,#VSIZE 
      00907E 81               [ 4] 2971 	ret 
                                   2972 
                                   2973 
                                   2974 ;----------------------------------
                                   2975 ; search in kword_dict command name
                                   2976 ;  from its execution address 
                                   2977 ; input:
                                   2978 ;   X       	execution address 
                                   2979 ; output:
                                   2980 ;   X 			cstr*  | 0 
                                   2981 ;--------------------------------
                           000001  2982 	XADR=1 
                           000003  2983 	LINK=3 
                           000004  2984 	VSIZE=4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00113A                       2985 cmd_name:
      00113A                       2986 	_vars VSIZE 
      00907E 72 CE            [ 2]    1     sub sp,#VSIZE 
      009080 00 17 FE 72      [ 1] 2987 	clr acc16 
      009084 CF 00            [ 2] 2988 	ldw (XADR,sp),x  
      009086 17 81 6B         [ 2] 2989 	ldw x,#kword_dict	
      009088 1F 03            [ 2] 2990 1$:	ldw (LINK,sp),x
      009088 CD 90            [ 1] 2991 	ld a,(2,x)
      00908A 2E 90            [ 1] 2992 	and a,#15 
      00908C 93 CD 90         [ 1] 2993 	ld acc8,a 
      00908F 2E FF 81         [ 2] 2994 	addw x,#3
      009092 72 BB 00 08      [ 2] 2995 	addw x,acc16
      009092 90               [ 2] 2996 	ldw x,(x) ; execution address 
      009093 89 90            [ 2] 2997 	cpw x,(XADR,sp)
      009095 CE 00            [ 1] 2998 	jreq 2$
      009097 17 58            [ 2] 2999 	ldw x,(LINK,sp)
      009099 89               [ 2] 3000 	ldw x,(x) 
      00909A 72 F9 01         [ 2] 3001 	subw x,#2  
      00909D 90 CF            [ 1] 3002 	jrne 1$
      00909F 00 17            [ 2] 3003 	jra 9$
      0090A1 85 90            [ 2] 3004 2$: ldw x,(LINK,sp)
      0090A3 85 81 0A         [ 2] 3005 	addw x,#2 	
      001169                       3006 9$:	_drop VSIZE
      0090A6 64 73            [ 2]    1     addw sp,#VSIZE 
      0090A8 74               [ 4] 3007 	ret
                                   3008 
                                   3009 
                                   3010 ;---------------------------------
                                   3011 ; input:
                                   3012 ;	X 		dictionary entry point 
                                   3013 ;  pad		.asciz name to search 
                                   3014 ; output:
                                   3015 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3016 ;  X		execution address | 0 
                                   3017 ;---------------------------------
                           000001  3018 	NLEN=1 ; cmd length 
                           000002  3019 	YSAVE=2
                           000003  3020 	VSIZE=3 
      00116C                       3021 search_dict:
      00116C                       3022 	_vars VSIZE 
      0090A9 61 63            [ 2]    1     sub sp,#VSIZE 
      0090AB 6B 3A            [ 1] 3023 	ldw y,x 
      001170                       3024 search_next:	
      0090AD 20 00            [ 1] 3025 	ld a,(y)
      0090AF A4 0F            [ 1] 3026 	and a,#0xf 
      0090AF 52 02            [ 1] 3027 	ld (NLEN,sp),a  
      0090B1 AE 90 A5         [ 2] 3028 	ldw x,#pad 
      0090B4 CD 82            [ 2] 3029 	ldw (YSAVE,sp),y
      0090B6 53 AE            [ 2] 3030 	incw y  
      00117D                       3031 cp_loop:
      0090B8 17               [ 1] 3032 	ld a,(x)
      0090B9 7E 35            [ 1] 3033 	jreq str_match 
      0090BB 0A 00            [ 1] 3034 	tnz (NLEN,sp)
      0090BD 07 C3            [ 1] 3035 	jreq no_match  
      0090BF 00 17            [ 1] 3036 	cp a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0090C1 25 0D            [ 1] 3037 	jrne no_match 
      0090C3 1F 01            [ 2] 3038 	incw y 
      0090C5 FE               [ 2] 3039 	incw x
      0090C6 CD 8A            [ 1] 3040 	dec (NLEN,sp)
      0090C8 28 1E            [ 2] 3041 	jra cp_loop 
      00118F                       3042 no_match:
      0090CA 01 1D            [ 2] 3043 	ldw y,(YSAVE,sp) 
      0090CC 00 02 20 EE      [ 2] 3044 	subw y,#2 ; move Y to link field
      0090D0 A6 0D            [ 1] 3045 	push #TK_NONE 
      0090D2 CD 82            [ 2] 3046 	ldw y,(y) ; next word link 
      0090D4 41               [ 1] 3047 	pop a ; TK_NONE 
      0090D5 5B 02            [ 1] 3048 	jreq search_exit  ; not found  
                                   3049 ;try next 
      0090D7 4F 81            [ 2] 3050 	jra search_next
      00119E                       3051 str_match:
      0090D9 0A 63            [ 2] 3052 	ldw y,(YSAVE,sp)
      0090DB 74 61            [ 1] 3053 	ld a,(y)
      0090DD 63 6B            [ 1] 3054 	ld (NLEN,sp),a ; needed to test keyword type  
      0090DF 3A 20            [ 1] 3055 	and a,#0xf 
                                   3056 ; move y to procedure address field 	
      0090E1 00               [ 1] 3057 	inc a 
      0090E2 C7 00 09         [ 1] 3058 	ld acc8,a 
      0090E2 52 02 AE 90      [ 1] 3059 	clr acc16 
      0090E6 D9 CD 82 53      [ 2] 3060 	addw y,acc16 
      0090EA 96 1C            [ 2] 3061 	ldw y,(y) ; routine entry point 
                                   3062 ;determine keyword type bits 7:6 
      0090EC 00 07            [ 1] 3063 	ld a,(NLEN,sp)
      0090EE 1F               [ 1] 3064 	swap a 
      0090EF 01 AE            [ 1] 3065 	and a,#0xc
      0090F1 17               [ 1] 3066 	srl a
      0090F2 FE               [ 1] 3067 	srl a 
      0090F3 35 10            [ 1] 3068 	add a,#6
      0011BD                       3069 search_exit: 
      0090F5 00               [ 1] 3070 	ldw x,y ; x=routine address 
      0011BE                       3071 	_drop VSIZE 	 
      0090F6 07 03            [ 2]    1     addw sp,#VSIZE 
      0090F7 81               [ 4] 3072 	ret 
                                   3073 
                                   3074 ;---------------------
                                   3075 ; check if next token
                                   3076 ;  is of expected type 
                                   3077 ; input:
                                   3078 ;   A 		 expected token attribute
                                   3079 ;  ouput:
                                   3080 ;   none     if fail call tb_error 
                                   3081 ;--------------------
      0011C1                       3082 expect:
      0090F7 13               [ 1] 3083 	push a 
      0090F8 01 2B 0B         [ 4] 3084 	call next_token 
      0090FB 89 FE            [ 1] 3085 	cp a,(1,sp)
      0090FD CD 8A            [ 1] 3086 	jreq 1$
      0090FF 28 85 1D         [ 2] 3087 	jp syntax_error
      009102 00               [ 1] 3088 1$: pop a 
      009103 02               [ 4] 3089 	ret 
                                   3090 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3091 
                                   3092 ;-------------------------------
                                   3093 ; parse embedded BASIC routines 
                                   3094 ; arguments list.
                                   3095 ; arg_list::=  rel[','rel]*
                                   3096 ; all arguments are of integer type
                                   3097 ; input:
                                   3098 ;   none
                                   3099 ; output:
                                   3100 ;   A 			number of arguments pushed on dstack  
                                   3101 ;--------------------------------
                           000001  3102 	ARG_CNT=1 
      0011CE                       3103 arg_list:
      009104 20 F1            [ 1] 3104 	push #0  
      009106 A6 0D CD         [ 4] 3105 1$: call relation
      009109 82 41            [ 1] 3106 	cp a,#TK_NONE 
      00910B 5B 02            [ 1] 3107 	jreq 5$
      00910D 4F 81            [ 1] 3108 	cp a,#TK_INTGR
      00910F 26 12            [ 1] 3109 	jrne 4$
      00910F 1E 05 72         [ 4] 3110 3$: call dpush 
      009112 FB 03            [ 1] 3111     inc (ARG_CNT,sp)
      009114 1F 03 81         [ 4] 3112 	call next_token 
      009117 A1 00            [ 1] 3113 	cp a,#TK_NONE 
      009117 1E 05            [ 1] 3114 	jreq 5$ 
      009119 72 F0            [ 1] 3115 	cp a,#TK_COMMA 
      00911B 03 81            [ 1] 3116 	jrne 4$
      00911D 20 E3            [ 2] 3117 	jra 1$ 
      00911D 52 03 0F         [ 4] 3118 4$:	call unget_token 
      009120 01               [ 1] 3119 5$:	pop a 
      009121 1E               [ 4] 3120 	ret 
                                   3121 
                                   3122 
      0011F2                       3123 func_args:
      009122 06 9E            [ 1] 3124 	ld a,#TK_LPAREN 
      009124 A5 80 27         [ 4] 3125 	call expect 
      009127 05 03 01         [ 4] 3126 	call arg_list 
      00912A 50               [ 1] 3127 	push a 
      00912B 1F 06            [ 1] 3128 	ld a,#TK_RPAREN 
      00912D 1E 08 9E         [ 4] 3129 	call expect 
      009130 A5               [ 1] 3130 	pop a 
      009131 80               [ 4] 3131 	ret 
                                   3132 
                                   3133 
                                   3134 ;--------------------------------
                                   3135 ;   BASIC commnands 
                                   3136 ;--------------------------------
                                   3137 
                                   3138 ;--------------------------------
                                   3139 ;  arithmetic and relational 
                                   3140 ;  routines
                                   3141 ;  operators precedence
                                   3142 ;  highest to lowest
                                   3143 ;  operators on same row have 
                                   3144 ;  same precedence and are executed
                                   3145 ;  from left to right.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3146 ;	'*','/','%'
                                   3147 ;   '-','+'
                                   3148 ;   '=','>','<','>=','<=','<>','><'
                                   3149 ;   '<>' and '><' are equivalent for not equal.
                                   3150 ;--------------------------------
                                   3151 
                                   3152 ;---------------------
                                   3153 ; return array element
                                   3154 ; address from @(expr)
                                   3155 ; input:
                                   3156 ;   A 		TK_ARRAY
                                   3157 ; output:
                                   3158 ;   A 		TK_INTGR
                                   3159 ;	X 		element address 
                                   3160 ;----------------------
      001202                       3161 get_array_element:
      009132 27 05 03         [ 4] 3162 	call func_args 
      009135 01 50            [ 1] 3163 	cp a,#1
      009137 1F 08            [ 1] 3164 	jreq 1$
      009139 7B 07 97         [ 2] 3165 	jp syntax_error
      00913C 7B 09 42         [ 4] 3166 1$: call dpop  
                                   3167 	; check for bounds 
      00913F 1F 02 7B         [ 2] 3168 	cpw x,array_size 
      009142 07 97            [ 2] 3169 	jrule 3$
                                   3170 ; bounds {1..array_size}	
      009144 7B 08            [ 1] 3171 2$: ld a,#ERR_BAD_VALUE 
      009146 42 9F 1B         [ 2] 3172 	jp tb_error 
      009149 02               [ 2] 3173 3$: tnzw  x
      00914A 6B 02            [ 1] 3174 	jreq 2$ 
      00914C 7B               [ 2] 3175 	sllw x 
      00914D 06               [ 2] 3176 	pushw x 
      00914E 97 7B 09         [ 2] 3177 	ldw x,#tib
      009151 42 9F 1B         [ 2] 3178 	subw x,(1,sp)
      001224                       3179 	_drop 2   
      009154 02 6B            [ 2]    1     addw sp,#2 
      009156 02 0D            [ 1] 3180 	ld a,#TK_INTGR
      009158 01               [ 4] 3181 	ret 
                                   3182 
                                   3183 ;***********************************
                                   3184 ;   expression parse,execute 
                                   3185 ;***********************************
                                   3186 ;-----------------------------------
                                   3187 ; factor ::= ['+'|'-'|e] var | @ |
                                   3188 ;			 integer | function |
                                   3189 ;			 '('relation')' 
                                   3190 ; output:
                                   3191 ;   A    token attribute 
                                   3192 ;   X 	 integer
                                   3193 ; ---------------------------------
                           000001  3194 	NEG=1
                           000001  3195 	VSIZE=1
      001229                       3196 factor:
      001229                       3197 	_vars VSIZE 
      009159 27 05            [ 2]    1     sub sp,#VSIZE 
      00915B 1E 02 50         [ 4] 3198 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00915E 1F 02            [ 1] 3199 	cp a,#CMD_END 
      009160 2B 50            [ 1] 3200 	jrmi 20$
      009160 1E 02            [ 1] 3201 1$:	ld (NEG,sp),a 
      009162 5B 03            [ 1] 3202 	and a,#TK_GRP_MASK
      009164 81 10            [ 1] 3203 	cp a,#TK_GRP_ADD 
      009165 27 04            [ 1] 3204 	jreq 2$
      009165 52 02            [ 1] 3205 	ld a,(NEG,sp)
      009167 0F 01            [ 2] 3206 	jra 4$  
      00123E                       3207 2$:	
      009169 0F 02 1E         [ 4] 3208 	call next_token 
      001241                       3209 4$:	
      00916C 05 5D            [ 1] 3210 	cp a,#TK_IFUNC 
      00916E 26 05            [ 1] 3211 	jrne 5$ 
      009170 A6               [ 4] 3212 	call (x) 
      009171 04 CC            [ 2] 3213 	jra 18$ 
      001248                       3214 5$:
      009173 87 B1            [ 1] 3215 	cp a,#TK_INTGR
      009175 9E A5            [ 1] 3216 	jrne 6$
      009177 80 27            [ 2] 3217 	jra 18$
      00124E                       3218 6$:
      009179 03 03            [ 1] 3219 	cp a,#TK_ARRAY
      00917B 01 50            [ 1] 3220 	jrne 10$
      00917D 1F 05 1E         [ 4] 3221 	call get_array_element
      009180 07               [ 2] 3222 	ldw x,(x)
      009181 9E A5            [ 2] 3223 	jra 18$ 
      001258                       3224 10$:
      009183 80 27            [ 1] 3225 	cp a,#TK_VAR 
      009185 05 03            [ 1] 3226 	jrne 11$
      009187 01               [ 2] 3227 	ldw x,(x)
      009188 03 02            [ 2] 3228 	jra 18$
      00125F                       3229 11$: 
      00918A 50 16            [ 1] 3230 	cp a,#TK_CONST 
      00918C 05 65            [ 1] 3231 	jreq 18$
      001263                       3232 12$:			
      00918E 90 CF            [ 1] 3233 	cp a,#TK_LPAREN
      009190 00 09            [ 1] 3234 	jrne 16$
      009192 0D 02 27         [ 4] 3235 	call relation
      009195 0B               [ 2] 3236 	pushw x 
      009196 90 5D            [ 1] 3237 	ld a,#TK_RPAREN 
      009198 27 07 5C         [ 4] 3238 	call expect
      00919B 16               [ 2] 3239 	popw x 
      00919C 05 72            [ 2] 3240 	jra 18$	
      001273                       3241 16$:
      00919E B2 00 09         [ 4] 3242 	call unget_token
      0091A1 0D               [ 1] 3243 	clr a 
      0091A2 01 27            [ 2] 3244 	jra 20$ 
      001279                       3245 18$: 
      0091A4 01 50            [ 1] 3246 	ld a,#TK_MINUS 
      0091A6 11 01            [ 1] 3247 	cp a,(NEG,sp)
      0091A6 5B 02            [ 1] 3248 	jrne 19$
      0091A8 81               [ 2] 3249 	negw x
      0091A9                       3250 19$:
      0091A9 1E 03            [ 1] 3251 	ld a,#TK_INTGR
      001282                       3252 20$:
      001282                       3253 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0091AB 16 05            [ 2]    1     addw sp,#VSIZE 
      0091AD 52               [ 4] 3254 	ret
                                   3255 
                                   3256 ;-----------------------------------
                                   3257 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3258 ; output:
                                   3259 ;   A    	token attribute 
                                   3260 ;	X		integer
                                   3261 ;-----------------------------------
                           000001  3262 	N1=1
                           000003  3263 	N2=3
                           000005  3264 	MULOP=5
                           000005  3265 	VSIZE=5
      001285                       3266 term:
      001285                       3267 	_vars VSIZE
      0091AE 04 1F            [ 2]    1     sub sp,#VSIZE 
      0091B0 01 17 03         [ 4] 3268 	call factor
      0091B3 CD 91            [ 1] 3269 	cp a,#CMD_END
      0091B5 65 93            [ 1] 3270 	jrmi term_exit
      00128E                       3271 term01:	 ; check for  operator 
      0091B7 5B 04            [ 2] 3272 	ldw (N2,sp),x  ; save first factor 
      0091B9 81 08 0F         [ 4] 3273 	call next_token
      0091BA A1 02            [ 1] 3274 	cp a,#2
      0091BA 52 04            [ 1] 3275 	jrmi 9$
      0091BC 72 5F            [ 1] 3276 0$:	ld (MULOP,sp),a
      0091BE 00 09            [ 1] 3277 	and a,#TK_GRP_MASK
      0091C0 1F 01            [ 1] 3278 	cp a,#TK_GRP_MULT
      0091C2 AE A3            [ 1] 3279 	jreq 1$
      0091C4 EB 1F            [ 1] 3280 	ld a,(MULOP,sp) 
      0091C6 03 E6 02         [ 4] 3281 	call unget_token 
      0091C9 A4 0F            [ 2] 3282 	jra 9$
      0012A6                       3283 1$:	; got *|/|%
      0091CB C7 00 0A         [ 4] 3284 	call factor
      0091CE 1C 00            [ 1] 3285 	cp a,#TK_INTGR
      0091D0 03 72            [ 1] 3286 	jreq 2$ 
      0091D2 BB 00 09         [ 2] 3287 	jp syntax_error
      0091D5 FE 13            [ 2] 3288 2$:	ldw (N1,sp),x  
      0091D7 01 27            [ 1] 3289 	ld a,(MULOP,sp) 
      0091D9 0A 1E            [ 1] 3290 	cp a,#TK_MULT 
      0091DB 03 FE            [ 1] 3291 	jrne 3$
      0091DD 1D 00 02         [ 4] 3292 	call multiply 
      0091E0 26 E3            [ 2] 3293 	jra term01
      0091E2 20 05            [ 1] 3294 3$: cp a,#TK_DIV 
      0091E4 1E 03            [ 1] 3295 	jrne 4$ 
      0091E6 1C 00 02         [ 4] 3296 	call divide 
      0091E9 5B 04            [ 2] 3297 	jra term01 
      0091EB 81 11 29         [ 4] 3298 4$: call modulo
      0091EC 20 C3            [ 2] 3299 	jra term01 
      0091EC 52 03            [ 2] 3300 9$: ldw x,(N2,sp)  
      0091EE 90 93            [ 1] 3301 	ld a,#TK_INTGR 	
      0091F0                       3302 term_exit:
      0012CF                       3303 	_drop VSIZE 
      0091F0 90 F6            [ 2]    1     addw sp,#VSIZE 
      0091F2 A4               [ 4] 3304 	ret 
                                   3305 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3306 ;-------------------------------
                                   3307 ;  expr ::= term [['+'|'-'] term]*
                                   3308 ;  result range {-32768..32767}
                                   3309 ;  output:
                                   3310 ;   A    token attribute 
                                   3311 ;   X	 integer   
                                   3312 ;-------------------------------
                           000001  3313 	N1=1 
                           000003  3314 	N2=3
                           000005  3315 	OP=5 
                           000005  3316 	VSIZE=5 
      0012D2                       3317 expression:
      0012D2                       3318 	_vars VSIZE 
      0091F3 0F 6B            [ 2]    1     sub sp,#VSIZE 
      0091F5 01 AE 17         [ 4] 3319 	call term
      0091F8 18 17            [ 1] 3320 	cp a,#CMD_END 
      0091FA 02 90            [ 1] 3321 	jrmi expr_exit 
      0091FC 5C 03            [ 2] 3322 0$:	ldw (N2,sp),x 
      0091FD CD 08 0F         [ 4] 3323 	call next_token
      0091FD F6 27            [ 1] 3324 	cp a,#2
      0091FF 1E 0D            [ 1] 3325 	jrmi 9$ 
      009201 01 27            [ 1] 3326 1$:	ld (OP,sp),a  
      009203 0B 90            [ 1] 3327 	and a,#TK_GRP_MASK
      009205 F1 26            [ 1] 3328 	cp a,#TK_GRP_ADD 
      009207 07 90            [ 1] 3329 	jreq 2$ 
      009209 5C 5C            [ 1] 3330 	ld a,(OP,sp)
      00920B 0A 01 20         [ 4] 3331 	call unget_token
      00920E EE 1C            [ 2] 3332 	jra 9$
      00920F                       3333 2$: 
      00920F 16 02 72         [ 4] 3334 	call term
      009212 A2 00            [ 1] 3335 	cp a,#TK_INTGR 
      009214 02 4B            [ 1] 3336 	jreq 3$
      009216 00 90 FE         [ 2] 3337 	jp syntax_error
      009219 84 27            [ 2] 3338 3$:	ldw (N1,sp),x 
      00921B 21 20            [ 1] 3339 	ld a,(OP,sp)
      00921D D2 10            [ 1] 3340 	cp a,#TK_PLUS 
      00921E 26 05            [ 1] 3341 	jrne 4$
      00921E 16 02 90         [ 4] 3342 	call add 
      009221 F6 6B            [ 2] 3343 	jra 0$ 
      009223 01 A4 0F         [ 4] 3344 4$:	call substract
      009226 4C C7            [ 2] 3345 	jra 0$
      009228 00 0A            [ 2] 3346 9$: ldw x,(N2,sp)
      00922A 72 5F            [ 1] 3347 	ld a,#TK_INTGR	
      001313                       3348 expr_exit:
      001313                       3349 	_drop VSIZE 
      00922C 00 09            [ 2]    1     addw sp,#VSIZE 
      00922E 72               [ 4] 3350 	ret 
                                   3351 
                                   3352 ;---------------------------------------------
                                   3353 ; rel ::= expr rel_op expr
                                   3354 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3355 ;  relation return 1 | 0  for true | false 
                                   3356 ;  output:
                                   3357 ;    A 		token attribute  
                                   3358 ;	 X		1|0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3359 ;---------------------------------------------
                           000001  3360 	N1=1
                           000003  3361 	N2=3
                           000005  3362 	RELOP=5
                           000005  3363 	VSIZE=5 
      001316                       3364 relation: 
      001316                       3365 	_vars VSIZE
      00922F B9 00            [ 2]    1     sub sp,#VSIZE 
      009231 09 90 FE         [ 4] 3366 	call expression
      009234 7B 01            [ 1] 3367 	cp a,#CMD_END  
      009236 4E A4            [ 1] 3368 	jrmi rel_exit 
                                   3369 	; expect rel_op or leave 
      009238 0C 44            [ 2] 3370 	ldw (N2,sp),x 
      00923A 44 AB 06         [ 4] 3371 	call next_token 
      00923D A1 02            [ 1] 3372 	cp a,#2
      00923D 93 5B            [ 1] 3373 	jrmi 9$
      001328                       3374 1$:	
      00923F 03 81            [ 1] 3375 	ld (RELOP,sp),a 
      009241 A4 30            [ 1] 3376 	and a,#TK_GRP_MASK
      009241 88 CD            [ 1] 3377 	cp a,#TK_GRP_RELOP 
      009243 88 8F            [ 1] 3378 	jreq 2$
      009245 11 01            [ 1] 3379 	ld a,(RELOP,sp)
      009247 27 03 CC         [ 4] 3380 	call unget_token  
      00924A 87 AF            [ 2] 3381 	jra 9$
      001337                       3382 2$:	; expect another expression or error 
      00924C 84 81 D2         [ 4] 3383 	call expression
      00924E A1 04            [ 1] 3384 	cp a,#TK_INTGR 
      00924E 4B 00            [ 1] 3385 	jreq 3$
      009250 CD 93 96         [ 2] 3386 	jp syntax_error 
      009253 A1 00            [ 2] 3387 3$:	ldw (N1,sp),x 
      009255 27 19 A1         [ 4] 3388 	call substract
      009258 04 26            [ 1] 3389 	jrne 4$
      00925A 12 CD 90 21      [ 1] 3390 	mov acc8,#2 ; n1==n2
      00925E 0C 01            [ 2] 3391 	jra 6$ 
      00134E                       3392 4$: 
      009260 CD 88            [ 1] 3393 	jrsgt 5$  
      009262 8F A1 00 27      [ 1] 3394 	mov acc8,#4 ; n1<2 
      009266 09 A1            [ 2] 3395 	jra 6$
      001356                       3396 5$:
      009268 0D 26 02 20      [ 1] 3397 	mov acc8,#1 ; n1>n2 
      00135A                       3398 6$:
      00926C E3               [ 1] 3399 	clrw x 
      00926D CD 90 1B         [ 1] 3400 	ld a, acc8  
      009270 84 81            [ 1] 3401 	and a,(RELOP,sp)
      009272 4D               [ 1] 3402 	tnz a 
      009272 A6 0B            [ 1] 3403 	jreq 10$
      009274 CD               [ 2] 3404 	incw x 
      001364                       3405 7$:	 
      009275 92 41            [ 2] 3406 	jra 10$  	
      009277 CD 92            [ 2] 3407 9$: ldw x,(N2,sp)
      001368                       3408 10$:
      009279 4E 88            [ 1] 3409 	ld a,#TK_INTGR
      00136A                       3410 rel_exit: 	 
      00136A                       3411 	_drop VSIZE
      00927B A6 0C            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00927D CD               [ 4] 3412 	ret 
                                   3413 
                                   3414 ;--------------------------------
                                   3415 ; BASIC: SHOW 
                                   3416 ;  show content of dstack,cstack
                                   3417 ;--------------------------------
      00136D                       3418 show:
      00927E 92 41 84         [ 1] 3419 	ld a,base 
      009281 81               [ 1] 3420 	push a 
      009282 CD 10 2F         [ 4] 3421 	call dots
      009282 CD 92 72         [ 4] 3422 	call dotr 
      009285 A1               [ 1] 3423 	pop a 
      009286 01 27 03         [ 1] 3424 	ld base,a 
      009289 CC               [ 1] 3425 	clr a 
      00928A 87               [ 4] 3426 	ret
                                   3427 
                                   3428 ;--------------------------------------------
                                   3429 ; BASIC: HEX 
                                   3430 ; select hexadecimal base for integer print
                                   3431 ;---------------------------------------------
      00137D                       3432 hex_base:
      00928B AF CD 90 2E      [ 1] 3433 	mov base,#16 
      00928F C3               [ 4] 3434 	ret 
                                   3435 
                                   3436 ;--------------------------------------------
                                   3437 ; BASIC: DEC 
                                   3438 ; select decimal base for integer print
                                   3439 ;---------------------------------------------
      001382                       3440 dec_base:
      009290 00 1E 23 05      [ 1] 3441 	mov base,#10
      009294 A6               [ 4] 3442 	ret 
                                   3443 
                                   3444 ;------------------------
                                   3445 ; BASIC: SIZE 
                                   3446 ; return free size in text area
                                   3447 ; output:
                                   3448 ;   A 		TK_INTGR
                                   3449 ;   X 	    size integer
                                   3450 ;--------------------------
      001387                       3451 size:
      009295 0A CC 87         [ 2] 3452 	ldw x,#tib 
      009298 B1 5D 27 F8      [ 2] 3453 	subw x,txtend 
      00929C 58 89            [ 1] 3454 	ld a,#TK_INTGR
      00929E AE               [ 4] 3455 	ret 
                                   3456 
                                   3457 
                                   3458 ;------------------------
                                   3459 ; BASIC: UBOUND  
                                   3460 ; return array variable size 
                                   3461 ; output:
                                   3462 ;   A 		TK_INTGR
                                   3463 ;   X 	    array size 
                                   3464 ;--------------------------
      001391                       3465 ubound:
      00929F 16 C8 72         [ 2] 3466 	ldw x,#tib
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0092A2 F0 01 5B 02      [ 2] 3467 	subw x,txtend 
      0092A6 A6 04 81 04      [ 2] 3468 	ldw y,basicptr 
      0092A9 90 C3 00 1A      [ 2] 3469 	cpw y,txtend 
      0092A9 52 01            [ 1] 3470 	jrult 1$
      0092AB CD 88 8F         [ 1] 3471 	push count 
      0092AE A1 02            [ 1] 3472 	push #0 
      0092B0 2B 50 6B         [ 2] 3473 	subw x,(1,sp)
      0013AA                       3474 	_drop 2 
      0092B3 01 A4            [ 2]    1     addw sp,#2 
      0092B5 30               [ 2] 3475 1$:	srlw x 
      0092B6 A1 10 27         [ 2] 3476 	ldw array_size,x
      0092B9 04 7B            [ 1] 3477 	ld a,#TK_INTGR
      0092BB 01               [ 4] 3478 	ret 
                                   3479 
                                   3480 ;-----------------------------
                                   3481 ; BASIC: LET var=expr 
                                   3482 ; variable assignement 
                                   3483 ; output:
                                   3484 ;   A 		TK_NONE 
                                   3485 ;-----------------------------
      0013B3                       3486 let:
      0092BC 20 03 0F         [ 4] 3487 	call next_token 
      0092BE A1 05            [ 1] 3488 	cp a,#TK_VAR 
      0092BE CD 88            [ 1] 3489 	jreq let02
      0092C0 8F 07 2F         [ 2] 3490 	jp syntax_error
      0092C1                       3491 let02:
      0092C1 A1 07 26         [ 4] 3492 	call dpush 
      0092C4 03 FD 20         [ 4] 3493 	call next_token 
      0092C7 31 32            [ 1] 3494 	cp a,#TK_EQUAL
      0092C8 27 03            [ 1] 3495 	jreq 1$
      0092C8 A1 04 26         [ 2] 3496 	jp syntax_error
      0013CA                       3497 1$:	
      0092CB 02 20 2B         [ 4] 3498 	call relation   
      0092CE A1 04            [ 1] 3499 	cp a,#TK_INTGR 
      0092CE A1 02            [ 1] 3500 	jreq 2$
      0092D0 26 06 CD         [ 2] 3501 	jp syntax_error
      0013D4                       3502 2$:	
      0092D3 92 82            [ 1] 3503 	ldw y,x 
      0092D5 FE 20 21         [ 4] 3504 	call dpop  
      0092D8 FF               [ 2] 3505 	ldw (x),y   
      0092D8 A1               [ 4] 3506 	ret 
                                   3507 
                                   3508 ;----------------------------
                                   3509 ; BASIC: LIST [[start][,end]]
                                   3510 ; list program lines 
                                   3511 ; form start to end 
                                   3512 ; if empty argument list then 
                                   3513 ; list all.
                                   3514 ;----------------------------
                           000001  3515 	FIRST=1
                           000003  3516 	LAST=3 
                           000005  3517 	LN_PTR=5
                           000006  3518 	VSIZE=6 
      0013DB                       3519 list:
      0013DB                       3520 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0092D9 05 26            [ 2]    1     sub sp,#VSIZE 
      0092DB 03 FE 20         [ 2] 3521 	ldw x,txtbgn 
      0092DE 1A 00 1A         [ 2] 3522 	cpw x,txtend 
      0092DF 2B 03            [ 1] 3523 	jrmi 1$
      0092DF A1 09 27         [ 2] 3524 	jp list_exit ; nothing to list 
      0092E2 16 05            [ 2] 3525 1$:	ldw (LN_PTR,sp),x 
      0092E3 FE               [ 2] 3526 	ldw x,(x) 
      0092E3 A1 0B            [ 2] 3527 	ldw (FIRST,sp),x ; list from first line 
      0092E5 26 0C CD         [ 2] 3528 	ldw x,#0x7fff ; biggest line number 
      0092E8 93 96            [ 2] 3529 	ldw (LAST,sp),x 
      0092EA 89 A6 0C         [ 4] 3530 	call arg_list
      0092ED CD               [ 1] 3531 	tnz a
      0092EE 92 41            [ 1] 3532 	jreq list_start 
      0092F0 85 20            [ 1] 3533 	cp a,#2 
      0092F2 06 07            [ 1] 3534 	jreq 4$
      0092F3 A1 01            [ 1] 3535 	cp a,#1 
      0092F3 CD 90            [ 1] 3536 	jreq first_line 
      0092F5 1B 4F 20         [ 2] 3537 	jp syntax_error 
      0092F8 09 0F BB         [ 4] 3538 4$:	call dswap
      0092F9                       3539 first_line:
      0092F9 A6 11 11         [ 4] 3540 	call dpop 
      0092FC 01 26            [ 2] 3541 	ldw (FIRST,sp),x 
      0092FE 01 50            [ 1] 3542 	cp a,#1 
      009300 27 05            [ 1] 3543 	jreq lines_skip 	
      00140F                       3544 last_line:
      009300 A6 04 AE         [ 4] 3545 	call dpop 
      009302 1F 03            [ 2] 3546 	ldw (LAST,sp),x 
      001414                       3547 lines_skip:
      009302 5B 01 81         [ 2] 3548 	ldw x,txtbgn
      009305 1F 05            [ 2] 3549 2$:	ldw (LN_PTR,sp),x 
      009305 52 05 CD         [ 2] 3550 	cpw x,txtend 
      009308 92 A9            [ 1] 3551 	jrpl list_exit 
      00930A A1               [ 2] 3552 	ldw x,(x) ;line# 
      00930B 02 2B            [ 2] 3553 	cpw x,(FIRST,sp)
      00930D 41 14            [ 1] 3554 	jrpl list_start 
      00930E 1E 05            [ 2] 3555 	ldw x,(LN_PTR,sp) 
      00930E 1F 03 CD         [ 2] 3556 	addw x,#2 
      009311 88               [ 1] 3557 	ld a,(x)
      009312 8F               [ 2] 3558 	incw x 
      009313 A1 02 2B         [ 1] 3559 	ld acc8,a 
      009316 34 6B 05 A4      [ 1] 3560 	clr acc16 
      00931A 30 A1 20 27      [ 2] 3561 	addw x,acc16
      00931E 07 7B            [ 2] 3562 	jra 2$ 
                                   3563 ; print loop
      001437                       3564 list_start:
      009320 05 CD            [ 2] 3565 	ldw x,(LN_PTR,sp)
      001439                       3566 3$:	
      009322 90 1B 20         [ 4] 3567 	call prt_basic_line
      009325 25 05            [ 2] 3568 	ldw x,(LN_PTR,sp)
      009326 E6 02            [ 1] 3569 	ld a,(2,x)
      009326 CD 92 A9         [ 1] 3570 	ld acc8,a 
      009329 A1 04 27 03      [ 1] 3571 	clr acc16 
      00932D CC 87 AF 1F      [ 2] 3572 	addw x,acc16
      009331 01 7B 05         [ 2] 3573 	cpw x,txtend 
      009334 A1 20            [ 1] 3574 	jrpl list_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009336 26 05            [ 2] 3575 	ldw (LN_PTR,sp),x
      009338 CD               [ 2] 3576 	ldw x,(x)
      009339 91 1D            [ 2] 3577 	cpw x,(LAST,sp)  
      00933B 20 D1            [ 1] 3578 	jrsgt list_exit 
      00933D A1 21            [ 2] 3579 	ldw x,(LN_PTR,sp)
      00933F 26 05            [ 2] 3580 	jra 3$
      00145B                       3581 list_exit:
      00145B                       3582 	_drop VSIZE 
      009341 CD 91            [ 2]    1     addw sp,#VSIZE 
      009343 65               [ 4] 3583 	ret
                                   3584 
                                   3585 ;-------------------------
                                   3586 ; print counted string 
                                   3587 ; input:
                                   3588 ;   X 		address of string
                                   3589 ;--------------------------
      00145E                       3590 prt_cmd_name:
      009344 20               [ 1] 3591 	ld a,(x)
      009345 C8               [ 2] 3592 	incw x
      009346 CD 91            [ 1] 3593 	and a,#15  
      009348 A9               [ 1] 3594 	push a 
      009349 20 C3            [ 1] 3595 1$: tnz (1,sp) 
      00934B 1E 03            [ 1] 3596 	jreq 9$
      00934D A6               [ 1] 3597 	ld a,(x)
      00934E 04 01 C1         [ 4] 3598 	call putc 
      00934F 5C               [ 2] 3599 	incw x
      00934F 5B 05            [ 1] 3600 	dec (1,sp)	 
      009351 81 F3            [ 2] 3601 	jra 1$
      009352 84               [ 1] 3602 9$: pop a 
      009352 52               [ 4] 3603 	ret	
                                   3604 
                                   3605 ;--------------------------
                                   3606 ; print TK_QSTR
                                   3607 ; converting control character
                                   3608 ; to backslash sequence
                                   3609 ; input:
                                   3610 ;   X        char *
                                   3611 ;-----------------------------
      001472                       3612 prt_quote:
      009353 05 CD            [ 1] 3613 	ld a,#'"
      009355 93 05 A1         [ 4] 3614 	call putc 
      009358 02               [ 1] 3615 1$:	ld a,(x)
      009359 2B 38            [ 1] 3616 	jreq 9$
      00935B 1F               [ 2] 3617 	incw x 
      00935C 03 CD            [ 1] 3618 	cp a,#SPACE 
      00935E 88 8F            [ 1] 3619 	jrult 3$
      009360 A1 02 2B         [ 4] 3620 	call putc
      009363 2B 6B            [ 1] 3621 	cp a,#'\ 
      009365 05 A4            [ 1] 3622 	jrne 1$ 
      001486                       3623 2$:
      009367 30 A1 10         [ 4] 3624 	call putc 
      00936A 27 07            [ 2] 3625 	jra 1$
      00936C 7B               [ 1] 3626 3$: push a 
      00936D 05 CD            [ 1] 3627 	ld a,#'\
      00936F 90 1B 20         [ 4] 3628 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009372 1C               [ 1] 3629 	pop a 
      009373 A0 07            [ 1] 3630 	sub a,#7
      009373 CD 93 05         [ 1] 3631 	ld acc8,a 
      009376 A1 04 27 03      [ 1] 3632 	clr acc16
      00937A CC 87 AF 1F      [ 2] 3633 	ldw y,#escaped 
      00937E 01 7B 05 A1      [ 2] 3634 	addw y,acc16 
      009382 10 26            [ 1] 3635 	ld a,(y)
      009384 05 CD            [ 2] 3636 	jra 2$
      009386 91 0F            [ 1] 3637 9$: ld a,#'"
      009388 20 D1 CD         [ 4] 3638 	call putc 
      00938B 91               [ 2] 3639 	incw x 
      00938C 17               [ 4] 3640 	ret
                                   3641 
                                   3642 
                                   3643 ;--------------------------
                                   3644 ; decompile line from token list 
                                   3645 ; input:
                                   3646 ;   X 		pointer at line
                                   3647 ; output:
                                   3648 ;   none 
                                   3649 ;--------------------------	
                           000001  3650 	BASE_SAV=1
                           000002  3651 	WIDTH_SAV=2
                           000003  3652 	XSAVE=3
                           000005  3653 	LLEN=5
                           000005  3654 	VSIZE=5 
      0014AE                       3655 prt_basic_line:
      0014AE                       3656 	_vars VSIZE 
      00938D 20 CC            [ 2]    1     sub sp,#VSIZE 
      00938F 1E 03 A6         [ 1] 3657 	ld a,base
      009392 04 01            [ 1] 3658 	ld (BASE_SAV,sp),a  
      009393 C6 00 20         [ 1] 3659 	ld a,tab_width 
      009393 5B 05            [ 1] 3660 	ld (WIDTH_SAV,sp),a 
      009395 81 00 11         [ 2] 3661 	ldw ptr16,x
      009396 FE               [ 2] 3662 	ldw x,(x)
      009396 52 05 CD 93      [ 1] 3663 	mov base,#10
      00939A 52 A1 02 2B      [ 1] 3664 	mov tab_width,#5
      00939E 4B 1F 03         [ 4] 3665 	call print_int ; print line number 
      0093A1 CD 88            [ 1] 3666 	ld a,#SPACE 
      0093A3 8F A1 02         [ 4] 3667 	call putc 
      0093A6 2B 3E 00 20      [ 1] 3668 	clr tab_width
      0093A8 AE 00 02         [ 2] 3669 	ldw x,#2
      0093A8 6B 05 A4 30      [ 4] 3670 	ld a,([ptr16],x)
      0093AC A1 30            [ 1] 3671 	ld (LLEN,sp),a 
      0093AE 27               [ 2] 3672 	incw x
      0093AF 07               [ 1] 3673 1$:	ld a,xl 
      0093B0 7B 05            [ 1] 3674 	cp a,(LLEN,sp)
      0093B2 CD 90            [ 1] 3675 	jrmi 20$
      0093B4 1B 20 2F         [ 2] 3676 	jp 90$
      0093B7                       3677 20$:	 
      0093B7 CD 93 52 A1      [ 4] 3678 	ld a,([ptr16],x)
      0093BB 04               [ 2] 3679 	incw x 
      0093BC 27 03            [ 2] 3680 	ldw (XSAVE,sp),x 
      0093BE CC 87            [ 1] 3681 	cp a,#TK_CMD 
      0093C0 AF 1F            [ 1] 3682 	jrult 5$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0093C2 01 CD            [ 1] 3683 	cp a,#TK_CONST 
      0093C4 91 17            [ 1] 3684 	jrugt 4$
      0014F3                       3685 2$:	
      0093C6 26 06 35 02      [ 5] 3686 	ldw x,([ptr16],x)
      0093CA 00 0A 20         [ 2] 3687 	cpw x,#rem 
      0093CD 0C 14            [ 1] 3688 	jrne 3$
      0093CE A6 27            [ 1] 3689 	ld a,#''
      0093CE 2C 06 35         [ 4] 3690 	call putc 
      0093D1 04 00            [ 2] 3691 	ldw x,(XSAVE,sp)
      0093D3 0A 20 04         [ 2] 3692 	addw x,#2
      0093D6 72 BB 00 11      [ 2] 3693 	addw x,ptr16  
      0093D6 35 01 00         [ 4] 3694 	call puts 
      0093D9 0A 15 EB         [ 2] 3695 	jp 90$ 
      0093DA CD 11 3A         [ 4] 3696 3$:	call cmd_name
      0093DA 5F C6 00         [ 4] 3697 	call prt_cmd_name
      0093DD 0A 14            [ 1] 3698 	ld a,#SPACE 
      0093DF 05 4D 27         [ 4] 3699 	call putc 
      0093E2 05 5C            [ 2] 3700 	ldw x,(XSAVE,sp)
      0093E4 1C 00 02         [ 2] 3701 	addw x,#2
      0093E4 20 02            [ 2] 3702 	jra 1$
      0093E6 1E 03            [ 1] 3703 4$: cp a,#TK_QSTR 
      0093E8 26 0D            [ 1] 3704 	jrne 5$
      0093E8 A6 04 00 11      [ 2] 3705 	addw x,ptr16
      0093EA CD 14 72         [ 4] 3706 	call prt_quote 
      0093EA 5B 05 81 11      [ 2] 3707 	subw x,ptr16  
      0093ED 20 A9            [ 2] 3708 	jra 1$
      0093ED C6 00            [ 1] 3709 5$:	cp a,#TK_VAR
      0093EF 07 88            [ 1] 3710 	jrne 6$ 
      0093F1 CD 90 AF CD      [ 5] 3711 	ldw x,([ptr16],x)
      0093F5 90 E2 84         [ 2] 3712 	subw x,#vars 
      0093F8 C7               [ 1] 3713 	ld a,xl
      0093F9 00               [ 1] 3714 	srl a 
      0093FA 07 4F            [ 1] 3715 	add a,#'A 
      0093FC 81 01 C1         [ 4] 3716 	call putc 
      0093FD A6 20            [ 1] 3717 	ld a,#SPACE 
      0093FD 35 10 00         [ 4] 3718 	call putc 
      009400 07 81            [ 2] 3719 	ldw x,(XSAVE,sp)
      009402 1C 00 02         [ 2] 3720 	addw x,#2 
      009402 35 0A            [ 2] 3721 	jra 1$ 
      009404 00 07            [ 1] 3722 6$: cp a,#TK_ARRAY 
      009406 81 0A            [ 1] 3723 	jrne 7$
      009407 A6 40            [ 1] 3724 	ld a,#'@ 
      009407 AE 16 C8         [ 4] 3725 	call putc 
      00940A 72 B0            [ 2] 3726 	ldw x,(XSAVE,sp)
      00940C 00 1B A6         [ 2] 3727 	jp 1$ 
      00940F 04 81            [ 1] 3728 7$: cp a,#TK_INTGR 
      009411 26 14            [ 1] 3729 	jrne 8$
      009411 AE 16 C8 72      [ 5] 3730 	ldw x,([ptr16],x)
      009415 B0 00 1B         [ 4] 3731 	call print_int
      009418 90 CE            [ 1] 3732 	ld a,#SPACE 
      00941A 00 05 90         [ 4] 3733 	call putc 
      00941D C3 00            [ 2] 3734 	ldw x,(XSAVE,sp)
      00941F 1B 25 0A         [ 2] 3735 	addw x,#2 
      009422 3B 00 04         [ 2] 3736 	jp 1$
      009425 4B 00            [ 1] 3737 8$: cp a,#TK_GT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009427 72 F0            [ 1] 3738 	jrmi 9$
      009429 01 5B            [ 1] 3739 	cp a,#TK_NE 
      00942B 02 54            [ 1] 3740 	jrugt 9$
      00942D CF 00            [ 1] 3741 	sub a,#TK_GT  
      00942F 1E               [ 1] 3742 	sll a 
      009430 A6 04            [ 1] 3743 	clrw y 
      009432 81 97            [ 1] 3744 	ld yl,a 
      009433 72 A9 16 04      [ 2] 3745 	addw y,#relop_str 
      009433 CD 88            [ 2] 3746 	ldw y,(y)
      009435 8F               [ 1] 3747 	ldw x,y 
      009436 A1 05 27         [ 4] 3748 	call puts 
      009439 03 CC            [ 2] 3749 	ldw x,(XSAVE,sp)
      00943B 87 AF DC         [ 2] 3750 	jp 1$
      00943D A1 10            [ 1] 3751 9$: cp a,#TK_PLUS 
      00943D CD 90            [ 1] 3752 	jrne 10$
      00943F 21 CD            [ 1] 3753 	ld a,#'+
      009441 88 8F            [ 2] 3754 	jra 80$ 
      009443 A1 32            [ 1] 3755 10$: cp a,#TK_MINUS
      009445 27 03            [ 1] 3756 	jrne 11$
      009447 CC 87            [ 1] 3757 	ld a,#'-
      009449 AF 3E            [ 2] 3758 	jra 80$
      00944A A1 20            [ 1] 3759 11$: cp a,#TK_MULT 
      00944A CD 93            [ 1] 3760 	jrmi 12$
      00944C 96 A1            [ 1] 3761 	cp a,#TK_MOD 
      00944E 04 27            [ 1] 3762 	jrugt 12$
      009450 03 CC            [ 1] 3763 	sub a,#0x20
      009452 87               [ 1] 3764 	clrw x 
      009453 AF               [ 1] 3765 	ld xl,a 
      009454 1C 16 01         [ 2] 3766 	addw x,#mul_char 
      009454 90               [ 1] 3767 	ld a,(x)
      009455 93 CD            [ 2] 3768 	jra 80$ 
      009457 90 2E            [ 1] 3769 12$: cp a,#TK_LPAREN 
      009459 FF 81            [ 1] 3770 	jrmi 13$
      00945B A1 0E            [ 1] 3771 	cp a,#TK_SHARP 
      00945B 52 06            [ 1] 3772 	jrugt 13$
      00945D CE 00            [ 1] 3773 	sub a,#TK_LPAREN
      00945F 19               [ 1] 3774 	clrw x 
      009460 C3               [ 1] 3775 	ld xl,a 
      009461 00 1B 2B         [ 2] 3776 	addw x,#single_char 
      009464 03               [ 1] 3777 	ld a,(x)
      009465 CC 94            [ 2] 3778 	jra 80$
      009467 DB 1F            [ 1] 3779 13$: cp a,#TK_CHAR 
      009469 05 FE            [ 1] 3780 	jrne 14$
      00946B 1F 01            [ 1] 3781 	ld a,#'\
      00946D AE 7F FF         [ 4] 3782 	call putc 
      009470 1F 03            [ 2] 3783 	ldw x,(XSAVE,sp)
      009472 CD 92 4E 4D      [ 4] 3784 	ld a,([ptr16],x)
      009476 27               [ 2] 3785 	incw x 
      009477 3F A1            [ 2] 3786 	ldw (XSAVE,sp),x 
      009479 02 27 07         [ 4] 3787 	call putc 
      00947C A1 01 27         [ 2] 3788 	jp 1$ 
      00947F 06 CC            [ 1] 3789 14$: ld a,#':
      009481 87 AF CD         [ 4] 3790 80$: call putc 
      009484 90 3B            [ 2] 3791 	ldw x,(XSAVE,sp)
      009486 CC 14 DC         [ 2] 3792 	jp 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0015EB                       3793 90$: 
      009486 CD 90            [ 1] 3794 	ld a,#CR 
      009488 2E 1F 01         [ 4] 3795 	call putc
      00948B A1 01            [ 1] 3796 	ld a,(WIDTH_SAV,sp) 
      00948D 27 05 20         [ 1] 3797 	ld tab_width,a 
      00948F 7B 01            [ 1] 3798 	ld a,(BASE_SAV,sp) 
      00948F CD 90 2E         [ 1] 3799 	ld base,a
      0015FA                       3800 	_drop VSIZE 
      009492 1F 03            [ 2]    1     addw sp,#VSIZE 
      009494 81               [ 4] 3801 	ret 	
      009494 CE 00 19 1F           3802 single_char: .byte '(',')',',','#'
      009498 05 C3 00              3803 mul_char: .byte '*','/','%'
      00949B 1B 2A 3D FE 13 01 2A  3804 relop_str: .word gt,equal,ge,lt,le,ne 
             14 1E 05 1C 00
      0094A7 02 F6                 3805 gt: .asciz ">"
      0094A9 5C C7                 3806 equal: .asciz "="
      0094AB 00 0A 72              3807 ge: .asciz ">="
      0094AE 5F 00                 3808 lt: .asciz "<"
      0094B0 09 72 BB              3809 le: .asciz "<="
      0094B3 00 09 20              3810 ne:  .asciz "<>"
                                   3811 
                                   3812 
                                   3813 ;---------------------------------
                                   3814 ; BASIC: PRINT|? arg_list 
                                   3815 ; print values from argument list
                                   3816 ;----------------------------------
                           000001  3817 	COMMA=1
                           000001  3818 	VSIZE=1
      00161F                       3819 print:
      0094B6 E0 00            [ 1] 3820 push #0 ; local variable COMMA 
      0094B7                       3821 reset_comma:
      0094B7 1E 05            [ 1] 3822 	clr (COMMA,sp)
      0094B9                       3823 prt_loop:
      0094B9 CD 95 2E         [ 4] 3824 	call relation 
      0094BC 1E 05            [ 1] 3825 	cp a,#TK_COLON 
      0094BE E6 02            [ 1] 3826 	jreq print_exit   
      0094C0 C7 00            [ 1] 3827 	cp a,#TK_INTGR 
      0094C2 0A 72            [ 1] 3828 	jrne 0$ 
      0094C4 5F 00 09         [ 4] 3829 	call print_int 
      0094C7 72 BB            [ 2] 3830 	jra reset_comma
      001633                       3831 0$: 	
      0094C9 00 09 C3         [ 4] 3832 	call next_token
      0094CC 00 1B            [ 1] 3833 	cp a,#TK_NONE 
      0094CE 2A 0B            [ 1] 3834 	jreq print_exit 
      0094D0 1F 05            [ 1] 3835 1$:	cp a,#TK_QSTR
      0094D2 FE 13            [ 1] 3836 	jrne 2$   
      0094D4 03 2C 04         [ 4] 3837 	call puts
      0094D7 1E               [ 2] 3838 	incw x 
      0094D8 05 20 DE 04      [ 2] 3839 	subw x,basicptr 
      0094DB 9F               [ 1] 3840 	ld a,xl 
      0094DB 5B 06 81         [ 1] 3841 	ld in,a  
      0094DE 20 D5            [ 2] 3842 	jra reset_comma
      0094DE F6 5C            [ 1] 3843 2$: cp a,#TK_CHAR 
      0094E0 A4 0F            [ 1] 3844 	jrne 3$
      0094E2 88               [ 1] 3845 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0094E3 0D 01 27         [ 4] 3846 	call putc 
      0094E6 09 F6            [ 2] 3847 	jra reset_comma 
      001656                       3848 3$: 	
      0094E8 CD 82            [ 1] 3849 	cp a,#TK_CFUNC 
      0094EA 41 5C            [ 1] 3850 	jrne 4$ 
      0094EC 0A               [ 4] 3851 	call (x)
      0094ED 01               [ 1] 3852 	ld a,xl 
      0094EE 20 F3 84         [ 4] 3853 	call putc
      0094F1 81 C0            [ 2] 3854 	jra reset_comma 
      0094F2                       3855 4$: 
      0094F2 A6 22            [ 1] 3856 	cp a,#TK_COMMA 
      0094F4 CD 82            [ 1] 3857 	jrne 5$
      0094F6 41 F6            [ 1] 3858 	cpl (COMMA,sp) 
      0094F8 27 2D 5C         [ 2] 3859 	jp prt_loop   
      00166A                       3860 5$: 
      0094FB A1 20            [ 1] 3861 	cp a,#TK_SHARP
      0094FD 25 0C            [ 1] 3862 	jrne 7$
      0094FF CD 82 41         [ 4] 3863 	call next_token
      009502 A1 5C            [ 1] 3864 	cp a,#TK_INTGR 
      009504 26 F1            [ 1] 3865 	jreq 6$
      009506 CC 07 2F         [ 2] 3866 	jp syntax_error 
      001678                       3867 6$:
      009506 CD               [ 1] 3868 	ld a,xl 
      009507 82 41            [ 1] 3869 	and a,#15 
      009509 20 EC 88         [ 1] 3870 	ld tab_width,a 
      00950C A6 5C CD         [ 2] 3871 	jp reset_comma 
      001681                       3872 7$:	
      00950F 82 41 84         [ 4] 3873 	call unget_token
      001684                       3874 print_exit:
      009512 A0 07            [ 1] 3875 	tnz (COMMA,sp)
      009514 C7 00            [ 1] 3876 	jrne 9$
      009516 0A 72            [ 1] 3877 	ld a,#CR 
      009518 5F 00 09         [ 4] 3878     call putc 
      00168D                       3879 9$:	_drop VSIZE 
      00951B 90 AE            [ 2]    1     addw sp,#VSIZE 
      00951D 8C               [ 4] 3880 	ret 
                                   3881 
                                   3882 ;----------------------
                                   3883 ; 'save_context' and
                                   3884 ; 'rest_context' must be 
                                   3885 ; called at the same 
                                   3886 ; call stack depth 
                                   3887 ; i.e. SP must have the 
                                   3888 ; save value at  
                                   3889 ; entry point of both 
                                   3890 ; routine. 
                                   3891 ;---------------------
                           000006  3892 	CTXT_SIZE=6 ; size of saved data 
                                   3893 ;--------------------
                                   3894 ; save current BASIC
                                   3895 ; interpreter context 
                                   3896 ; on cstack 
                                   3897 ;--------------------
      001690                       3898 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      001690                       3899 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001690                       3900 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001690                       3901 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001690                       3902 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      001690                       3903 save_context:
      00951E EA 72 B9         [ 2] 3904 	ldw x,basicptr 
      009521 00 09            [ 2] 3905 	ldw (BPTR,sp),x
      009523 90 F6 20         [ 1] 3906 	ld a,in 
      009526 DF A6            [ 1] 3907 	ld (IN,sp),a
      009528 22 CD 82         [ 1] 3908 	ld a,count 
      00952B 41 5C            [ 1] 3909 	ld (CNT,sp),a  
      00952D 81               [ 4] 3910 	ret
                                   3911 
                                   3912 ;-----------------------
                                   3913 ; restore previously saved 
                                   3914 ; BASIC interpreter context 
                                   3915 ; from cstack 
                                   3916 ;-------------------------
      00952E                       3917 rest_context:
      00952E 52 05            [ 2] 3918 	ldw x,(BPTR,sp)
      009530 C6 00 07         [ 2] 3919 	ldw basicptr,x 
      009533 6B 01            [ 1] 3920 	ld a,(IN,sp)
      009535 C6 00 21         [ 1] 3921 	ld in,a
      009538 6B 02            [ 1] 3922 	ld a,(CNT,sp)
      00953A CF 00 12         [ 1] 3923 	ld count,a  
      00953D FE               [ 4] 3924 	ret
                                   3925 
                                   3926 ;------------------------------------------
                                   3927 ; BASIC: INPUT [string],var[,[string],var]
                                   3928 ; input value in variables 
                                   3929 ; [string] optionally can be used as prompt 
                                   3930 ;-----------------------------------------
                           000001  3931 	CX_BPTR=1
                           000003  3932 	CX_LNO=3
                           000004  3933 	CX_IN=4
                           000005  3934 	CX_CNT=5
                           000006  3935 	SKIP=6
                           000007  3936 	VSIZE=7
      0016B0                       3937 input_var:
      00953E 35 0A 00 07 35   [ 2] 3938 	btjt flags,#FRUN,1$ 
      009543 05 00            [ 1] 3939 	ld a,#ERR_RUN_ONLY 
      009545 21 CD 8A         [ 2] 3940 	jp tb_error 
      0016BA                       3941 1$:	_vars VSIZE 
      009548 28 A6            [ 2]    1     sub sp,#VSIZE 
      0016BC                       3942 input_loop:
      00954A 20 CD            [ 1] 3943 	clr (SKIP,sp)
      00954C 82 41 72         [ 4] 3944 	call next_token 
      00954F 5F 00            [ 1] 3945 	cp a,#TK_NONE 
      009551 21 AE            [ 1] 3946 	jreq input_exit 
      009553 00 02            [ 1] 3947 	cp a,#TK_QSTR 
      009555 72 D6            [ 1] 3948 	jrne 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      009557 00 12 6B         [ 4] 3949 	call puts 
      00955A 05 5C            [ 1] 3950 	cpl (SKIP,sp)
      00955C 9F 11 05         [ 4] 3951 	call next_token 
      00955F 2B 03            [ 1] 3952 1$: cp a,#TK_VAR  
      009561 CC 96            [ 1] 3953 	jreq 2$ 
      009563 6B 07 2F         [ 2] 3954 	jp syntax_error
      009564 CD 0F A1         [ 4] 3955 2$:	call dpush 
      009564 72 D6            [ 1] 3956 	tnz (SKIP,sp)
      009566 00 12            [ 1] 3957 	jrne 21$ 
      009568 5C 1F            [ 1] 3958 	ld a,#':
      00956A 03 A1 06         [ 1] 3959 	ld pad+1,a 
      00956D 25 44 A1 09      [ 1] 3960 	clr pad+2
      009571 22 2F 18         [ 2] 3961 	ldw x,#pad 
      009573 CD 01 D3         [ 4] 3962 	call puts   
      0016EE                       3963 21$:
      009573 72 DE 00         [ 4] 3964 	call save_context 
      009576 12 A3 97         [ 2] 3965 	ldw x,#tib 
      009579 A4 26 14         [ 2] 3966 	ldw basicptr,x  
      00957C A6 27 CD 82      [ 1] 3967 	clr count  
      009580 41 1E 03         [ 4] 3968 	call readln 
      009583 1C 00 02 72      [ 1] 3969 	clr in 
      009587 BB 00 12         [ 4] 3970 	call relation 
      00958A CD 82            [ 1] 3971 	cp a,#TK_INTGR
      00958C 53 CC            [ 1] 3972 	jreq 3$ 
      00958E 96 6B CD         [ 2] 3973 	jp syntax_error
      009591 91 BA CD         [ 4] 3974 3$: call dpush 
      009594 94 DE A6         [ 4] 3975 	call store 
      009597 20 CD 82         [ 4] 3976 	call rest_context
      00959A 41 1E 03         [ 4] 3977 	call next_token 
      00959D 1C 00            [ 1] 3978 	cp a,#TK_COMMA 
      00959F 02 20            [ 1] 3979 	jrne 4$
      0095A1 BA A1            [ 2] 3980 	jra input_loop 
      0095A3 0A 26 0D         [ 4] 3981 4$:	call unget_token 
      001721                       3982 input_exit:
      001721                       3983 	_drop VSIZE 
      0095A6 72 BB            [ 2]    1     addw sp,#VSIZE 
      0095A8 00               [ 4] 3984 	ret 
                                   3985 
                                   3986 
                                   3987 ;---------------------
                                   3988 ; BASIC: REMARK | ' 
                                   3989 ; skip comment to end of line 
                                   3990 ;---------------------- 
      001724                       3991 rem:
      0095A9 12 CD 94 F2 72   [ 1] 3992  	mov count,in 
      0095AE B0               [ 4] 3993 	ret 
                                   3994 
                                   3995 ;---------------------
                                   3996 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3997 ; read in loop 'addr'  
                                   3998 ; apply & 'mask' to value 
                                   3999 ; loop while result==0.  
                                   4000 ; if 'xor_mask' given 
                                   4001 ; apply ^ in second  
                                   4002 ; loop while result==0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4003 ;---------------------
                           000001  4004 	XMASK=1 
                           000002  4005 	MASK=2
                           000003  4006 	ADDR=3
                           000004  4007 	VSIZE=4
      00172A                       4008 wait: 
      00172A                       4009 	_vars VSIZE
      0095AF 00 12            [ 2]    1     sub sp,#VSIZE 
      0095B1 20 A9            [ 1] 4010 	clr (XMASK,sp) 
      0095B3 A1 05 26         [ 4] 4011 	call arg_list 
      0095B6 1A 72            [ 1] 4012 	cp a,#2
      0095B8 DE 00            [ 1] 4013 	jruge 0$
      0095BA 12 1D 00         [ 2] 4014 	jp syntax_error 
      0095BD 22 9F            [ 1] 4015 0$:	cp a,#3
      0095BF 44 AB            [ 1] 4016 	jrult 1$
      0095C1 41 CD 82         [ 4] 4017 	call dpop 
      0095C4 41               [ 1] 4018 	ld a,xl
      0095C5 A6 20            [ 1] 4019 	ld (XMASK,sp),a 
      0095C7 CD 82 41         [ 4] 4020 1$: call dpop ; mask 
      0095CA 1E               [ 1] 4021 	ld a,xl 
      0095CB 03 1C            [ 1] 4022 	ld (MASK,sp),a 
      0095CD 00 02 20         [ 4] 4023 	call dpop ; address 
      0095D0 8B               [ 1] 4024 2$:	ld a,(x)
      0095D1 A1 02            [ 1] 4025 	and a,(MASK,sp)
      0095D3 26 0A            [ 1] 4026 	xor a,(XMASK,sp)
      0095D5 A6 40            [ 1] 4027 	jreq 2$ 
      001752                       4028 	_drop VSIZE 
      0095D7 CD 82            [ 2]    1     addw sp,#VSIZE 
      0095D9 41               [ 4] 4029 	ret 
                                   4030 
                                   4031 ;---------------------
                                   4032 ; BASIC: BSET addr,mask
                                   4033 ; set bits at 'addr' corresponding 
                                   4034 ; to those of 'mask' that are at 1.
                                   4035 ; arguments:
                                   4036 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4037 ;   mask        mask|addr
                                   4038 ; output:
                                   4039 ;	none 
                                   4040 ;--------------------------
      001755                       4041 bit_set:
      0095DA 1E 03 CC         [ 4] 4042 	call arg_list 
      0095DD 95 5C            [ 1] 4043 	cp a,#2	 
      0095DF A1 04            [ 1] 4044 	jreq 1$ 
      0095E1 26 14 72         [ 2] 4045 	jp syntax_error
      00175F                       4046 1$: 
      0095E4 DE 00 12         [ 4] 4047 	call dpop ; mask 
      0095E7 CD               [ 1] 4048 	ld a,xl 
      0095E8 8A 28 A6         [ 4] 4049 	call dpop ; addr  
      0095EB 20               [ 1] 4050 	or a,(x)
      0095EC CD               [ 1] 4051 	ld (x),a
      0095ED 82               [ 4] 4052 	ret 
                                   4053 
                                   4054 ;---------------------
                                   4055 ; BASIC: BRES addr,mask
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4056 ; reset bits at 'addr' corresponding 
                                   4057 ; to those of 'mask' that are at 1.
                                   4058 ; arguments:
                                   4059 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4060 ;   mask	    ~mask&*addr  
                                   4061 ; output:
                                   4062 ;	none 
                                   4063 ;--------------------------
      001769                       4064 bit_reset:
      0095EE 41 1E 03         [ 4] 4065 	call arg_list 
      0095F1 1C 00            [ 1] 4066 	cp a,#2  
      0095F3 02 CC            [ 1] 4067 	jreq 1$ 
      0095F5 95 5C A1         [ 2] 4068 	jp syntax_error
      001773                       4069 1$: 
      0095F8 31 2B 1A         [ 4] 4070 	call dpop ; mask 
      0095FB A1               [ 1] 4071 	ld a,xl 
      0095FC 35               [ 1] 4072 	cpl a 
      0095FD 22 16 A0         [ 4] 4073 	call dpop ; addr  
      009600 31               [ 1] 4074 	and a,(x)
      009601 48               [ 1] 4075 	ld (x),a 
      009602 90               [ 4] 4076 	ret 
                                   4077 
                                   4078 ;---------------------
                                   4079 ; BASIC: BRES addr,mask
                                   4080 ; toggle bits at 'addr' corresponding 
                                   4081 ; to those of 'mask' that are at 1.
                                   4082 ; arguments:
                                   4083 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4084 ;   mask	    mask^*addr  
                                   4085 ; output:
                                   4086 ;	none 
                                   4087 ;--------------------------
      00177E                       4088 bit_toggle:
      009603 5F 90 97         [ 4] 4089 	call arg_list 
      009606 72 A9            [ 1] 4090 	cp a,#2 
      009608 96 84            [ 1] 4091 	jreq 1$ 
      00960A 90 FE 93         [ 2] 4092 	jp syntax_error
      00960D CD 82 53         [ 4] 4093 1$: call dpop ; mask 
      009610 1E               [ 1] 4094 	ld a,xl 
      009611 03 CC 95         [ 4] 4095 	call dpop ; addr  
      009614 5C               [ 1] 4096 	xor a,(x)
      009615 A1               [ 1] 4097 	ld (x),a 
      009616 10               [ 4] 4098 	ret 
                                   4099 
                                   4100 
                                   4101 ;---------------------
                                   4102 ; BASIC: BTEST(addr,bit)
                                   4103 ; return bit value at 'addr' 
                                   4104 ; bit is in range {0..7}.
                                   4105 ; arguments:
                                   4106 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4107 ;   bit 	    bit position {0..7}  
                                   4108 ; output:
                                   4109 ;	none 
                                   4110 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      001792                       4111 bit_test:
      009617 26 04 A6         [ 4] 4112 	call func_args 
      00961A 2B 20            [ 1] 4113 	cp a,#2
      00961C 46 A1            [ 1] 4114 	jreq 0$
      00961E 11 26 04         [ 2] 4115 	jp syntax_error
      00179C                       4116 0$:	
      009621 A6 2D 20         [ 4] 4117 	call dpop 
      009624 3E               [ 1] 4118 	ld a,xl 
      009625 A1 20            [ 1] 4119 	and a,#7
      009627 2B               [ 1] 4120 	push a 
      009628 0E A1            [ 1] 4121 	ld a,#1 
      00962A 22 22            [ 1] 4122 1$: tnz (1,sp)
      00962C 0A A0            [ 1] 4123 	jreq 2$
      00962E 20               [ 1] 4124 	sll a 
      00962F 5F 97            [ 1] 4125 	dec (1,sp)
      009631 1C 96            [ 2] 4126 	jra 1$
      009633 81 F6 20         [ 4] 4127 2$: call dpop 
      009636 2C               [ 1] 4128 	and a,(x)
      009637 A1 0B            [ 1] 4129 	jreq 3$
      009639 2B 0E            [ 1] 4130 	ld a,#1 
      00963B A1               [ 1] 4131 3$:	clrw x 
      00963C 0E               [ 1] 4132 	ld xl,a 
      00963D 22 0A            [ 1] 4133 	ld a,#TK_INTGR
      0017BA                       4134 	_drop 1 
      00963F A0 0B            [ 2]    1     addw sp,#1 
      009641 5F               [ 4] 4135 	ret
                                   4136 
                                   4137 
                                   4138 ;--------------------
                                   4139 ; BASIC: POKE addr,byte
                                   4140 ; put a byte at addr 
                                   4141 ;--------------------
      0017BD                       4142 poke:
      009642 97 1C 96         [ 4] 4143 	call arg_list 
      009645 7D F6            [ 1] 4144 	cp a,#2
      009647 20 1A            [ 1] 4145 	jreq 1$
      009649 A1 03 26         [ 2] 4146 	jp syntax_error
      0017C7                       4147 1$:	
      00964C 14 A6 5C         [ 4] 4148 	call dpop 
      00964F CD               [ 1] 4149     ld a,xl 
      009650 82 41 1E         [ 4] 4150 	call dpop 
      009653 03               [ 1] 4151 	ld (x),a 
      009654 72               [ 4] 4152 	ret 
                                   4153 
                                   4154 ;-----------------------
                                   4155 ; BASIC: PEEK(addr)
                                   4156 ; get the byte at addr 
                                   4157 ; input:
                                   4158 ;	none 
                                   4159 ; output:
                                   4160 ;	X 		value 
                                   4161 ;-----------------------
      0017D0                       4162 peek:
      009655 D6 00 12         [ 4] 4163 	call func_args
      009658 5C 1F            [ 1] 4164 	cp a,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00965A 03 CD            [ 1] 4165 	jreq 1$
      00965C 82 41 CC         [ 2] 4166 	jp syntax_error
      00965F 95 5C A6         [ 4] 4167 1$:	call dpop 
      009662 3A               [ 1] 4168 	ld a,(x)
      009663 CD               [ 1] 4169 	clrw x 
      009664 82               [ 1] 4170 	ld xl,a 
      009665 41 1E            [ 1] 4171 	ld a,#TK_INTGR
      009667 03               [ 4] 4172 	ret 
                                   4173 
      0017E3                       4174 if: 
      009668 CC 95 5C         [ 4] 4175 	call relation 
      00966B A1 04            [ 1] 4176 	cp a,#TK_INTGR
      00966B A6 0D            [ 1] 4177 	jreq 1$ 
      00966D CD 82 41         [ 2] 4178 	jp syntax_error
      009670 7B               [ 1] 4179 1$:	clr a 
      009671 02               [ 2] 4180 	tnzw x 
      009672 C7 00            [ 1] 4181 	jrne 9$  
                                   4182 ;skip to next line
      009674 21 7B 01 C7 00   [ 1] 4183 	mov in,count
      009679 07               [ 4] 4184 9$:	ret 
                                   4185 
                                   4186 ;------------------------
                                   4187 ; BASIC: FOR var=expr 
                                   4188 ; set variable to expression 
                                   4189 ; leave variable address 
                                   4190 ; on dstack and set
                                   4191 ; FFOR bit in 'flags'
                                   4192 ;-----------------
                           000001  4193 	RETL1=1
                           000003  4194 	INW=3
                           000005  4195 	BPTR=5
      0017F7                       4196 for: ; { -- var_addr }
      00967A 5B 05            [ 1] 4197 	ld a,#TK_VAR 
      00967C 81 28 29         [ 4] 4198 	call expect
      00967F 2C 23 2A         [ 4] 4199 	call dpush 
      009682 2F 25 96         [ 4] 4200 	call let02 
      009685 90 96 92 96      [ 1] 4201 	bset flags,#FFOR 
                                   4202 ; open space on cstack for BPTR and INW 
      009689 94               [ 2] 4203 	popw x ; call return address 
      001807                       4204 	_vars 4
      00968A 96 97            [ 2]    1     sub sp,#4 
      00968C 96               [ 2] 4205 	pushw x  ; RETL1 
      00968D 99               [ 1] 4206 	clrw x 
      00968E 96 9C            [ 2] 4207 	ldw (BPTR,sp),x 
      009690 3E 00            [ 2] 4208 	ldw (INW,sp),x 
      009692 3D 00 3E         [ 4] 4209 	call next_token 
      009695 3D 00            [ 1] 4210 	cp a,#TK_CMD 
      009697 3C 00            [ 1] 4211 	jreq 1$
      009699 3C 3D 00         [ 2] 4212 	jp syntax_error
      001819                       4213 1$:  
      00969C 3C 3E 00         [ 2] 4214 	cpw x,#to 
      00969F 27 03            [ 1] 4215 	jreq to
      00969F 4B 00 2F         [ 2] 4216 	jp syntax_error 
                                   4217 
                                   4218 ;-----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                                   4219 ; BASIC: TO expr 
                                   4220 ; second part of FOR loop initilization
                                   4221 ; leave limit on dstack and set 
                                   4222 ; FTO bit in 'flags'
                                   4223 ;-----------------------------------
      0096A1                       4224 to: ; { var_addr -- var_addr limit step }
      0096A1 0F 01 00 1F 03   [ 2] 4225 	btjt flags,#FFOR,1$
      0096A3 CC 07 2F         [ 2] 4226 	jp syntax_error
      0096A3 CD 93 96         [ 4] 4227 1$: call relation  
      0096A6 A1 01            [ 1] 4228 	cp a,#TK_INTGR 
      0096A8 27 5A            [ 1] 4229 	jreq 2$ 
      0096AA A1 04 26         [ 2] 4230 	jp syntax_error
      001833                       4231 2$: 
      0096AD 05 CD 8A         [ 4] 4232     call dpush ; limit
      0096B0 28 20 EE         [ 2] 4233 	ldw x,in.w 
      0096B3 CD 08 0F         [ 4] 4234 	call next_token
      0096B3 CD 88            [ 1] 4235 	cp a,#TK_NONE  
      0096B5 8F A1            [ 1] 4236 	jreq 4$ 
      0096B7 00 27            [ 1] 4237 	cp a,#TK_CMD
      0096B9 4A A1            [ 1] 4238 	jrne 3$
      0096BB 0A 26 0E         [ 2] 4239 	cpw x,#step 
      0096BE CD 82            [ 1] 4240 	jreq step
      001849                       4241 3$:	
      0096C0 53 5C 72         [ 4] 4242 	call unget_token   	 
      00184C                       4243 4$:	
      0096C3 B0 00 05         [ 2] 4244 	ldw x,#1   ; default step  
      0096C6 9F C7            [ 2] 4245 	jra store_loop_addr 
                                   4246 
                                   4247 
                                   4248 ;----------------------------------
                                   4249 ; BASIC: STEP expr 
                                   4250 ; optional third par of FOR loop
                                   4251 ; initialization. 	
                                   4252 ;------------------------------------
      001851                       4253 step: ; {var limit -- var limit step}
      0096C8 00 02 20 D5 A1   [ 2] 4254 	btjt flags,#FFOR,1$
      0096CD 03 26 06         [ 2] 4255 	jp syntax_error
      0096D0 9F CD 82         [ 4] 4256 1$: call relation
      0096D3 41 20            [ 1] 4257 	cp a,#TK_INTGR
      0096D5 CB 03            [ 1] 4258 	jreq store_loop_addr  
      0096D6 CC 07 2F         [ 2] 4259 	jp syntax_error
                                   4260 ; leave loop back entry point on cstack 
                                   4261 ; cstack is 2 call deep from interp_loop
      001863                       4262 store_loop_addr:
      0096D6 A1 08 26         [ 4] 4263 	call dpush 
      0096D9 07 FD 9F         [ 2] 4264 	ldw x,basicptr  
      0096DC CD 82            [ 2] 4265 	ldw (BPTR,sp),x 
      0096DE 41 20 C0         [ 2] 4266 	ldw x,in.w 
      0096E1 1F 03            [ 2] 4267 	ldw (INW,sp),x   
      0096E1 A1 0D 26 05      [ 1] 4268 	bres flags,#FFOR 
      0096E5 03 01 CC 96      [ 1] 4269 	inc loop_depth  
      0096E9 A3               [ 4] 4270 	ret 
                                   4271 
                                   4272 ;--------------------------------
                                   4273 ; BASIC: NEXT var 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4274 ; FOR loop control 
                                   4275 ; increment variable with step 
                                   4276 ; and compare with limit 
                                   4277 ; loop if threshold not crossed.
                                   4278 ; else clean both stacks. 
                                   4279 ; and decrement 'loop_depth' 
                                   4280 ;--------------------------------
      0096EA                       4281 next: ; {var limit step -- [var limit step ] }
      0096EA A1 0E 26 13      [ 1] 4282 	tnz loop_depth 
      0096EE CD 88            [ 1] 4283 	jrne 1$ 
      0096F0 8F A1 04         [ 2] 4284 	jp syntax_error 
      001882                       4285 1$: 
      0096F3 27 03            [ 1] 4286 	ld a,#TK_VAR 
      0096F5 CC 87 AF         [ 4] 4287 	call expect
                                   4288 ; check for good variable after NEXT 	 
      0096F8 90 93            [ 1] 4289 	ldw y,x 
      0096F8 9F A4 0F         [ 2] 4290 	ldw x,#4  
      0096FB C7 00 21 CC      [ 4] 4291 	cpw y,([dstkptr],x) ; compare variables address 
      0096FF 96 A1            [ 1] 4292 	jreq 2$  
      009701 CC 07 2F         [ 2] 4293 	jp syntax_error ; not the good one 
      001895                       4294 2$: ; increment variable 
      009701 CD               [ 1] 4295 	ldw x,y
      009702 90               [ 2] 4296 	ldw x,(x)  ; get var value 
      009703 1B 00 08         [ 2] 4297 	ldw acc16,x 
      009704 72 CE 00 16      [ 5] 4298 	ldw x,[dstkptr] ; step
      009704 0D 01 26 05      [ 2] 4299 	addw x,acc16 ; var+step 
      009708 A6 0D            [ 2] 4300 	ldw (y),x ; save var new value 
                                   4301 ; compare with limit 
      00970A CD 82            [ 1] 4302 	ldw y,x 
      00970C 41 5B 01 81      [ 5] 4303 	ldw x,[dstkptr] ; step in x 
      009710 5D               [ 2] 4304 	tnzw x  
      009710 CE 00            [ 1] 4305 	jrpl 4$ ; positive step 
                                   4306 ;negative step 
      009712 05 1F 03         [ 2] 4307 	ldw x,#2
      009715 C6 00 02 6B      [ 4] 4308 	cpw y,([dstkptr],x)
      009719 07 C6            [ 1] 4309 	jrslt loop_done
      00971B 00 04            [ 2] 4310 	jra loop_back 
      0018B8                       4311 4$: ; positive step
      00971D 6B 08 81         [ 2] 4312 	ldw x,#2 
      009720 72 D3 00 16      [ 4] 4313 	cpw y,([dstkptr],x)
      009720 1E 03            [ 1] 4314 	jrsgt loop_done
      0018C1                       4315 loop_back:
      009722 CF 00            [ 2] 4316 	ldw x,(BPTR,sp)
      009724 05 7B 07         [ 2] 4317 	ldw basicptr,x 
      009727 C7 00 02 7B 08   [ 2] 4318 	btjf flags,#FRUN,1$ 
      00972C C7 00            [ 1] 4319 	ld a,(2,x)
      00972E 04 81 03         [ 1] 4320 	ld count,a
      009730 1E 03            [ 2] 4321 1$:	ldw x,(INW,sp)
      009730 72 00 00         [ 2] 4322 	ldw in.w,x 
      009733 20               [ 4] 4323 	ret 
      0018D6                       4324 loop_done:
                                   4325 	; remove var limit step on dstack 
      009734 05 A6 06         [ 2] 4326 	ldw x,dstkptr 
      009737 CC 87 B1         [ 2] 4327 	addw x,#3*CELL_SIZE
      00973A 52 07 16         [ 2] 4328 	ldw dstkptr,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4329 	; remove 2 return address on cstack 
      00973C 85               [ 2] 4330 	popw x
      0018E0                       4331 	_drop 4
      00973C 0F 06            [ 2]    1     addw sp,#4 
      00973E CD               [ 2] 4332 	pushw x 
      00973F 88 8F A1 00      [ 1] 4333 	dec loop_depth 
      009743 27               [ 4] 4334 	ret 
                                   4335 
                                   4336 
                                   4337 ;------------------------
                                   4338 ; BASIC: GOTO line# 
                                   4339 ; jump to line# 
                                   4340 ; here cstack is 2 call deep from interp_loop 
                                   4341 ;------------------------
      0018E8                       4342 goto:
      009744 5C A1 0A 26 08   [ 2] 4343 	btjt flags,#FRUN,0$ 
      009749 CD 82            [ 1] 4344 	ld a,#ERR_RUN_ONLY
      00974B 53 03 06         [ 2] 4345 	jp tb_error 
      00974E CD               [ 4] 4346 	ret 
      00974F 88 8F            [ 2] 4347 0$:	jra go_common
                                   4348 
                                   4349 ;--------------------
                                   4350 ; BASIC: GOSUB line#
                                   4351 ; basic subroutine call
                                   4352 ; actual line# and basicptr 
                                   4353 ; are saved on cstack
                                   4354 ; here cstack is 2 call deep from interp_loop 
                                   4355 ;--------------------
                           000003  4356 	GOS_RET=3
      0018F5                       4357 gosub:
      009751 A1 05 27 03 CC   [ 2] 4358 	btjt flags,#FRUN,0$ 
      009756 87 AF            [ 1] 4359 	ld a,#ERR_RUN_ONLY
      009758 CD 90 21         [ 2] 4360 	jp tb_error 
      00975B 0D               [ 4] 4361 	ret 
      00975C 06               [ 2] 4362 0$:	popw x 
      00975D 26 0F            [ 2] 4363 	sub sp,#2 
      00975F A6               [ 2] 4364 	pushw x 
      009760 3A C7 17         [ 2] 4365 	ldw x,basicptr
      009763 19 72            [ 1] 4366 	ld a,(2,x)
      009765 5F 17            [ 1] 4367 	add a,#3 
      009767 1A AE 17         [ 1] 4368 	ld acc8,a 
      00976A 18 CD 82 53      [ 1] 4369 	clr acc16 
      00976E 72 BB 00 08      [ 2] 4370 	addw x,acc16
      00976E CD 97            [ 2] 4371 	ldw (GOS_RET,sp),x 
      001918                       4372 go_common: 
      009770 10 AE 16         [ 4] 4373 	call relation 
      009773 C8 CF            [ 1] 4374 	cp a,#TK_INTGR
      009775 00 05            [ 1] 4375 	jreq 1$ 
      009777 72 5F 00         [ 2] 4376 	jp syntax_error
      001922                       4377 1$: 
      00977A 04 CD 8B         [ 4] 4378 	call search_lineno  
      00977D 16               [ 2] 4379 	tnzw x 
      00977E 72 5F            [ 1] 4380 	jrne 2$ 
      009780 00 02            [ 1] 4381 	ld a,#ERR_NO_LINE 
      009782 CD 93 96         [ 2] 4382 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00192D                       4383 2$: 
      009785 A1 04 27         [ 2] 4384 	ldw basicptr,x 
      009788 03 CC            [ 1] 4385 	ld a,(2,x)
      00978A 87 AF CD         [ 1] 4386 	ld count,a 
      00978D 90 21 CD 90      [ 1] 4387 	mov in,#3 
      009791 88               [ 4] 4388 	ret 
                                   4389 
                                   4390 ;------------------------
                                   4391 ; BASIC: RETURN 
                                   4392 ; exit from a subroutine 
                                   4393 ; cstack is 2 level deep from interp_loop 
                                   4394 ;------------------------
      00193A                       4395 return:
      009792 CD 97 20 CD 88   [ 2] 4396 	btjt flags,#FRUN,0$ 
      009797 8F A1            [ 1] 4397 	ld a,#ERR_RUN_ONLY
      009799 0D 26 02         [ 2] 4398 	jp tb_error 
      001944                       4399 0$:	
      00979C 20 9E            [ 2] 4400 	ldw x,(GOS_RET,sp) 
      00979E CD 90 1B         [ 2] 4401 	ldw basicptr,x 
      0097A1 E6 02            [ 1] 4402 	ld a,(2,x)
      0097A1 5B 07            [ 1] 4403 	add a,#3 
      0097A3 81 00 03         [ 1] 4404 	ld count,a 
      0097A4 35 03 00 01      [ 1] 4405 	mov in,#3
      0097A4 55               [ 1] 4406 	clr a 
      0097A5 00               [ 2] 4407 	popw x 
      001956                       4408 	_drop 2
      0097A6 02 00            [ 2]    1     addw sp,#2 
      0097A8 04               [ 2] 4409 	pushw x
      0097A9 81               [ 4] 4410 	ret  
                                   4411 
                                   4412 
                                   4413 ;----------------------------------
                                   4414 ; BASIC: RUN
                                   4415 ; run BASIC program in RAM
                                   4416 ;----------------------------------- 
      0097AA                       4417 run: 
      0097AA 52 04 0F 01 CD   [ 2] 4418 	btjf flags,#FRUN,0$  
      0097AF 92               [ 1] 4419 	clr a 
      0097B0 4E               [ 4] 4420 	ret
      001961                       4421 0$: 
      0097B1 A1 02 24 03 CC   [ 2] 4422 	btjf flags,#FBREAK,1$
      001966                       4423 	_drop 2 
      0097B6 87 AF            [ 2]    1     addw sp,#2 
      0097B8 A1 03 25         [ 4] 4424 	call rest_context
      00196B                       4425 	_drop CTXT_SIZE 
      0097BB 06 CD            [ 2]    1     addw sp,#CTXT_SIZE 
      0097BD 90 2E 9F 6B      [ 1] 4426 	bres flags,#FBREAK 
      0097C1 01 CD 90 2E      [ 1] 4427 	bset flags,#FRUN 
      0097C5 9F 6B 02         [ 2] 4428 	jp interp_loop 
      0097C8 CD 90 2E         [ 2] 4429 1$:	ldw x,txtbgn
      0097CB F6 14 02         [ 2] 4430 	cpw x,txtend 
      0097CE 18 01            [ 1] 4431 	jrmi 2$ 
      0097D0 27               [ 1] 4432 	clr a 
      0097D1 F9               [ 4] 4433 	ret 
      0097D2 5B 04 81         [ 4] 4434 2$: call ubound 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0097D5                       4435 	_drop 2 
      0097D5 CD 92            [ 2]    1     addw sp,#2 
      0097D7 4E A1 02         [ 2] 4436 	ldw x,txtbgn 
      0097DA 27 03 CC         [ 2] 4437 	ldw basicptr,x 
      0097DD 87 AF            [ 1] 4438 	ld a,(2,x)
      0097DF C7 00 03         [ 1] 4439 	ld count,a
      0097DF CD 90 2E 9F      [ 1] 4440 	mov in,#3	
      0097E3 CD 90 2E FA      [ 1] 4441 	bset flags,#FRUN 
      0097E7 F7 81 DF         [ 2] 4442 	jp interp_loop 
                                   4443 
                                   4444 
                                   4445 ;----------------------
                                   4446 ; BASIC: STOP 
                                   4447 ; stop running program
                                   4448 ;---------------------- 
      0097E9                       4449 stop: 
                                   4450 ; clean dstack and cstack 
      0097E9 CD 92 4E         [ 2] 4451 	ldw x,#STACK_EMPTY 
      0097EC A1               [ 1] 4452 	ldw sp,x 
      0097ED 02 27 03 CC      [ 1] 4453 	bres flags,#FRUN 
      0097F1 87 AF 00 1F      [ 1] 4454 	bres flags,#FBREAK
      0097F3 CC 07 83         [ 2] 4455 	jp warm_start
                                   4456 
                                   4457 ;-----------------------
                                   4458 ; BASIC BEEP expr1,expr2
                                   4459 ; used MCU internal beeper 
                                   4460 ; to produce a sound
                                   4461 ; arguments:
                                   4462 ;    expr1   frequency  (expr1%32)
                                   4463 ;    expr2   duration msec.
                                   4464 ;---------------------------
      0019AC                       4465 beep:
      0097F3 CD 90 2E         [ 4] 4466 	call arg_list 
      0097F6 9F 43            [ 1] 4467 	cp a,#2 
      0097F8 CD 90            [ 1] 4468 	jreq 1$
      0097FA 2E F4 F7         [ 2] 4469 	jp syntax_error 
      0019B6                       4470 1$: 
      0097FD 81 00 16         [ 2] 4471 	ldw x,dstkptr 
      0097FE EE 02            [ 2] 4472 	ldw x,(2,x);frequency 
      0097FE CD 92            [ 1] 4473 	ld a,#31
      009800 4E               [ 2] 4474 	div x,a 
      009801 A1 02 27         [ 1] 4475 	ld BEEP_CSR,a	
      009804 03 CC 87 AF      [ 1] 4476 	bset BEEP_CSR,#5 
      009808 CD 90 2E         [ 4] 4477 	call dpop 
      00980B 9F CD 90         [ 4] 4478 	call pause02 
      00980E 2E F8 F7         [ 4] 4479 	call ddrop 
      009811 81 1F            [ 1] 4480 	ld a,#0x1f
      009812 C7 50 F3         [ 1] 4481 	ld BEEP_CSR,a 
      009812 CD               [ 4] 4482 	ret 
                                   4483 
                                   4484 ;-------------------------------
                                   4485 ; BASIC: PWRADC 0|1 [,divisor]  
                                   4486 ; disable/enanble ADC 
                                   4487 ;-------------------------------
      0019D4                       4488 power_adc:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009813 92 72 A1         [ 4] 4489 	call arg_list 
      009816 02 27            [ 1] 4490 	cp a,#2	
      009818 03 CC            [ 1] 4491 	jreq 1$
      00981A 87 AF            [ 1] 4492 	cp a,#1 
      00981C 27 03            [ 1] 4493 	jreq 0$ 
      00981C CD 90 2E         [ 2] 4494 	jp syntax_error 
      00981F 9F A4 07         [ 2] 4495 0$: ldw x,#0
      009822 88 A6 01         [ 4] 4496 	call dpush 
      009825 0D 01 27         [ 2] 4497 1$: ldw x,#2
      009828 05 48 0A 01      [ 5] 4498 	ldw x,([dstkptr],x) ; on|off
      00982C 20               [ 2] 4499 	tnzw x 
      00982D F7 CD            [ 1] 4500 	jreq 2$ 
      00982F 90 2E F4 27      [ 5] 4501 	ldw x,[dstkptr] ; divisor 
      009833 02               [ 1] 4502 	ld a,xl
      009834 A6 01            [ 1] 4503 	and a,#7
      009836 5F               [ 1] 4504 	swap a 
      009837 97 A6 04         [ 1] 4505 	ld ADC_CR1,a
      00983A 5B 01 81 CA      [ 1] 4506 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00983D 72 10 54 01      [ 1] 4507 	bset ADC_CR1,#ADC_CR1_ADON 
      001A05                       4508 	_usec_dly 7 
      00983D CD 92 4E         [ 2]    1     ldw x,#(16*7-2)/4
      009840 A1               [ 2]    2     decw x
      009841 02               [ 1]    3     nop 
      009842 27 03            [ 1]    4     jrne .-4
      009844 CC 87            [ 2] 4509 	jra 3$
      009846 AF 11 54 01      [ 1] 4510 2$: bres ADC_CR1,#ADC_CR1_ADON
      009847 72 17 50 CA      [ 1] 4511 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      009847 CD 90 2E         [ 2] 4512 3$:	ldw x,#2
      00984A 9F CD 90         [ 4] 4513 	call ddrop_n 
      00984D 2E               [ 4] 4514 	ret
                                   4515 
                                   4516 ;-----------------------------
                                   4517 ; BASIC: RDADC(channel)
                                   4518 ; read adc channel {0..5}
                                   4519 ; output:
                                   4520 ;   A 		TK_INTGR 
                                   4521 ;   X 		value 
                                   4522 ;-----------------------------
      001A1D                       4523 analog_read:
      00984E F7 81 F2         [ 4] 4524 	call func_args 
      009850 A1 01            [ 1] 4525 	cp a,#1 
      009850 CD 92            [ 1] 4526 	jreq 1$
      009852 72 A1 01         [ 2] 4527 	jp syntax_error
      009855 27 03 CC         [ 4] 4528 1$: call dpop 
      009858 87 AF CD         [ 2] 4529 	cpw x,#5 
      00985B 90 2E            [ 2] 4530 	jrule 2$
      00985D F6 5F            [ 1] 4531 	ld a,#ERR_BAD_VALUE
      00985F 97 A6 04         [ 2] 4532 	jp tb_error 
      009862 81               [ 1] 4533 2$: ld a,xl
      009863 C7 00 09         [ 1] 4534 	ld acc8,a 
      009863 CD 93            [ 1] 4535 	ld a,#5
      009865 96 A1 04         [ 1] 4536 	sub a,acc8 
      009868 27 03 CC         [ 1] 4537 	ld ADC_CSR,a
      00986B 87 AF 4F 5D      [ 1] 4538 	bset ADC_CR2,#ADC_CR2_ALIGN
      00986F 26 05 55 00      [ 1] 4539 	bset ADC_CR1,#ADC_CR1_ADON
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009873 04 00 02 81 FB   [ 2] 4540 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009877 CE 54 04         [ 2] 4541 	ldw x,ADC_DRH
      009877 A6 05            [ 1] 4542 	ld a,#TK_INTGR
      009879 CD               [ 4] 4543 	ret 
                                   4544 
                                   4545 ;-----------------------
                                   4546 ; BASIC: DREAD(pin)
                                   4547 ; read state of a digital pin 
                                   4548 ; pin# {0..15}
                                   4549 ; output:
                                   4550 ;    A 		TK_INTGR
                                   4551 ;    X      0|1 
                                   4552 ;-------------------------
                           000001  4553 	PINNO=1
                           000001  4554 	VSIZE=1
      001A53                       4555 digital_read:
      001A53                       4556 	_vars VSIZE 
      00987A 92 41            [ 2]    1     sub sp,#VSIZE 
      00987C CD 90 21         [ 4] 4557 	call func_args
      00987F CD 94            [ 1] 4558 	cp a,#1
      009881 3D 72            [ 1] 4559 	jreq 1$
      009883 14 00 20         [ 2] 4560 	jp syntax_error
      009886 85 52 04         [ 4] 4561 1$: call dpop 
      009889 89 5F 1F         [ 2] 4562 	cpw x,#15 
      00988C 05 1F            [ 2] 4563 	jrule 2$
      00988E 03 CD            [ 1] 4564 	ld a,#ERR_BAD_VALUE
      009890 88 8F A1         [ 2] 4565 	jp tb_error 
      009893 06 27 03         [ 4] 4566 2$:	call select_pin 
      009896 CC 87            [ 1] 4567 	ld (PINNO,sp),a
      009898 AF 01            [ 1] 4568 	ld a,(GPIO_IDR,x)
      009899 0D 01            [ 1] 4569 	tnz (PINNO,sp)
      009899 A3 98            [ 1] 4570 	jreq 8$
      00989B A1               [ 1] 4571 3$: srl a 
      00989C 27 03            [ 1] 4572 	dec (PINNO,sp)
      00989E CC 87            [ 1] 4573 	jrne 3$ 
      0098A0 AF 01            [ 1] 4574 8$: and a,#1 
      0098A1 5F               [ 1] 4575 	clrw x 
      0098A1 72               [ 1] 4576 	ld xl,a 
      0098A2 04 00            [ 1] 4577 	ld a,#TK_INTGR
      001A82                       4578 	_drop VSIZE
      0098A4 20 03            [ 2]    1     addw sp,#VSIZE 
      0098A6 CC               [ 4] 4579 	ret
                                   4580 
                                   4581 ;-----------------------
                                   4582 ; BASIC: DWRITE pin,0|1
                                   4583 ; write to a digital pin 
                                   4584 ; pin# {0..15}
                                   4585 ; output:
                                   4586 ;    A 		TK_INTGR
                                   4587 ;    X      0|1 
                                   4588 ;-------------------------
                           000001  4589 	PINNO=1
                           000002  4590 	PINVAL=2
                           000002  4591 	VSIZE=2
      001A85                       4592 digital_write:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      001A85                       4593 	_vars VSIZE 
      0098A7 87 AF            [ 2]    1     sub sp,#VSIZE 
      0098A9 CD 93 96         [ 4] 4594 	call arg_list  
      0098AC A1 04            [ 1] 4595 	cp a,#2 
      0098AE 27 03            [ 1] 4596 	jreq 1$
      0098B0 CC 87 AF         [ 2] 4597 	jp syntax_error
      0098B3 CD 0F AE         [ 4] 4598 1$: call dpop 
      0098B3 CD               [ 1] 4599 	ld a,xl 
      0098B4 90 21            [ 1] 4600 	ld (PINVAL,sp),a
      0098B6 CE 00 01         [ 4] 4601 	call dpop
      0098B9 CD 88 8F         [ 2] 4602 	cpw x,#15 
      0098BC A1 00            [ 2] 4603 	jrule 2$
      0098BE 27 0C            [ 1] 4604 	ld a,#ERR_BAD_VALUE
      0098C0 A1 06 26         [ 2] 4605 	jp tb_error 
      0098C3 05 A3 98         [ 4] 4606 2$:	call select_pin 
      0098C6 D1 27            [ 1] 4607 	ld (PINNO,sp),a 
      0098C8 08 01            [ 1] 4608 	ld a,#1
      0098C9 0D 01            [ 1] 4609 	tnz (PINNO,sp)
      0098C9 CD 90            [ 1] 4610 	jreq 4$
      0098CB 1B               [ 1] 4611 3$: sll a
      0098CC 0A 01            [ 1] 4612 	dec (PINNO,sp)
      0098CC AE 00            [ 1] 4613 	jrne 3$
      0098CE 01 20            [ 1] 4614 4$: tnz (PINVAL,sp)
      0098D0 12 05            [ 1] 4615 	jrne 5$
      0098D1 43               [ 1] 4616 	cpl a 
      0098D1 72 04            [ 1] 4617 	and a,(GPIO_ODR,x)
      0098D3 00 20            [ 2] 4618 	jra 8$
      0098D5 03 CC            [ 1] 4619 5$: or a,(GPIO_ODR,x)
      0098D7 87 AF            [ 1] 4620 8$: ld (GPIO_ODR,x),a 
      001AC1                       4621 	_drop VSIZE 
      0098D9 CD 93            [ 2]    1     addw sp,#VSIZE 
      0098DB 96               [ 4] 4622 	ret
                                   4623 
                                   4624 
                                   4625 ;-----------------------
                                   4626 ; BASIC: BREAK 
                                   4627 ; insert a breakpoint 
                                   4628 ; in pogram. 
                                   4629 ; the program is resumed
                                   4630 ; with RUN 
                                   4631 ;-------------------------
      001AC4                       4632 break:
      0098DC A1 04 27 03 CC   [ 2] 4633 	btjt flags,#FRUN,2$
      0098E1 87               [ 1] 4634 	clr a
      0098E2 AF               [ 4] 4635 	ret 
      0098E3                       4636 2$:	 
                                   4637 ; create space on cstack to save context 
      0098E3 CD 90 21         [ 2] 4638 	ldw x,#break_point 
      0098E6 CE 00 05         [ 4] 4639 	call puts 
      001AD1                       4640 	_drop 2 ;drop return address 
      0098E9 1F 05            [ 2]    1     addw sp,#2 
      001AD3                       4641 	_vars CTXT_SIZE ; context size 
      0098EB CE 00            [ 2]    1     sub sp,#CTXT_SIZE 
      0098ED 01 1F 03         [ 4] 4642 	call save_context 
      0098F0 72 15 00         [ 2] 4643 	ldw x,#tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0098F3 20 72 5C         [ 2] 4644 	ldw basicptr,x
      0098F6 00               [ 1] 4645 	clr (x)
      0098F7 1D 81 00 03      [ 1] 4646 	clr count  
      0098F9 5F               [ 1] 4647 	clrw x 
      0098F9 72 5D 00         [ 2] 4648 	ldw in.w,x
      0098FC 1D 26 03 CC      [ 1] 4649 	bres flags,#FRUN 
      009900 87 AF 00 1F      [ 1] 4650 	bset flags,#FBREAK
      009902 CC 07 DF         [ 2] 4651 	jp interp_loop 
      009902 A6 05 CD 92 41 90 93  4652 break_point: .asciz "\nbreak point, RUN to resume.\n"
             AE 00 04 72 D3 00 17
             27 03 CC 87 AF 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4653 
                                   4654 ;-----------------------
                                   4655 ; BASIC: NEW
                                   4656 ; from command line only 
                                   4657 ; free program memory
                                   4658 ; and clear variables 
                                   4659 ;------------------------
      009915                       4660 new: 
      009915 93 FE CF 00 09   [ 2] 4661 	btjf flags,#FRUN,0$ 
      00991A 72               [ 1] 4662 	clr a 
      00991B CE               [ 4] 4663 	ret 
      001B17                       4664 0$:	
      00991C 00 17 72         [ 4] 4665 	call clear_basic 
      00991F BB               [ 4] 4666 	ret 
                                   4667 	 
                                   4668 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4669 ;   file system routines
                                   4670 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4671 
                                   4672 ;--------------------
                                   4673 ; input:
                                   4674 ;   X     increment 
                                   4675 ; output:
                                   4676 ;   farptr  incremented 
                                   4677 ;---------------------
      001B1B                       4678 incr_farptr:
      009920 00 09 90 FF      [ 2] 4679 	addw x,farptr+1 
      009924 90 93            [ 1] 4680 	jrnc 1$
      009926 72 CE 00 17      [ 1] 4681 	inc farptr 
      00992A 5D 2A 0B         [ 2] 4682 1$:	ldw farptr+1,x  
      00992D AE               [ 4] 4683 	ret 
                                   4684 
                                   4685 ;------------------------------
                                   4686 ; extended flash memory used as FLASH_DRIVE 
                                   4687 ; seek end of used flash drive   
                                   4688 ; starting at 0x10000 address.
                                   4689 ; 4 consecutives 0 bytes signal free space. 
                                   4690 ; input:
                                   4691 ;	none
                                   4692 ; output:
                                   4693 ;   ffree     free_addr| 0 if memory full.
                                   4694 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      001B29                       4695 seek_fdrive:
                                   4696 ; start scan at 0x10000 address 
      00992E 00 02            [ 1] 4697 	ld a,#1
      009930 72 D3 00         [ 1] 4698 	ld farptr,a 
      009933 17               [ 1] 4699 	clrw x 
      009934 2F 20 20         [ 2] 4700 	ldw farptr+1,x 
      001B32                       4701 1$:
      009937 09 00 03         [ 2] 4702 	ldw x,#3  
      009938 92 AF 00 10      [ 5] 4703 2$:	ldf a,([farptr],x) 
      009938 AE 00            [ 1] 4704 	jrne 3$
      00993A 02               [ 2] 4705 	decw x
      00993B 72 D3            [ 1] 4706 	jrpl 2$
      00993D 00 17            [ 2] 4707 	jra 4$ 
      00993F 2C               [ 2] 4708 3$:	incw x 
      009940 15 1B 1B         [ 4] 4709 	call incr_farptr
      009941 AE 02 7F         [ 2] 4710 	ldw x,#0x27f 
      009941 1E 05 CF         [ 2] 4711 	cpw x,farptr
      009944 00 05            [ 1] 4712 	jrpl 1$
                                   4713 ; drive full 
      009946 72 01 00 20      [ 1] 4714 	clr ffree 
      00994A 05 E6 02 C7      [ 1] 4715 	clr ffree+1 
      00994E 00 04 1E 03      [ 1] 4716 	clr ffree+2 
      009952 CF               [ 4] 4717 	ret
      001B59                       4718 4$: ; copy farptr to ffree	 
      009953 00 01 81         [ 2] 4719 	ldw x,farptr 
      009956 C6 00 12         [ 1] 4720 	ld a,farptr+2 
      009956 CE 00 17         [ 2] 4721 	ldw ffree,x 
      009959 1C 00 06         [ 1] 4722 	ld ffree+2,a  
      00995C CF               [ 4] 4723 	ret 
                                   4724 
                                   4725 ;-----------------------
                                   4726 ; compare file name 
                                   4727 ; with name pointed by Y  
                                   4728 ; input:
                                   4729 ;   farptr   file name 
                                   4730 ;   Y        target name 
                                   4731 ; output:
                                   4732 ;   farptr 	 at file_name
                                   4733 ;   X 		 farptr[x] point at size field  
                                   4734 ;   Carry    0|1 no match|match  
                                   4735 ;----------------------
      001B66                       4736 cmp_name:
      00995D 00               [ 1] 4737 	clrw x
      00995E 17 85 5B 04      [ 5] 4738 1$:	ldf a,([farptr],x)
      009962 89 72            [ 1] 4739 	cp a,(y)
      009964 5A 00            [ 1] 4740 	jrne 4$
      009966 1D               [ 1] 4741 	tnz a 
      009967 81 12            [ 1] 4742 	jreq 9$ 
      009968 5C               [ 2] 4743     incw x 
      009968 72 00            [ 2] 4744 	incw y 
      00996A 00 20            [ 2] 4745 	jra 1$
      001B77                       4746 4$: ;no match 
      00996C 06               [ 1] 4747 	tnz a 
      00996D A6 06            [ 1] 4748 	jreq 5$
      00996F CC               [ 2] 4749 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009970 87 B1 81 20      [ 5] 4750 	ldf a,([farptr],x)
      009974 23 F6            [ 2] 4751 	jra 4$  
      009975 5C               [ 2] 4752 5$:	incw x ; farptr[x] point at 'size' field 
      009975 72               [ 1] 4753 	rcf 
      009976 00               [ 4] 4754 	ret
      001B84                       4755 9$: ; match  
      009977 00               [ 2] 4756 	incw x  ; farptr[x] at 'size' field 
      009978 20               [ 1] 4757 	scf 
      009979 06               [ 4] 4758 	ret 
                                   4759 
                                   4760 ;-----------------------
                                   4761 ; search file in 
                                   4762 ; flash memory 
                                   4763 ; input:
                                   4764 ;   Y       file name  
                                   4765 ; output:
                                   4766 ;   farptr  addr at name|0
                                   4767 ;-----------------------
                           000001  4768 	FSIZE=1
                           000003  4769 	YSAVE=3
                           000004  4770 	VSIZE=4 
      001B87                       4771 search_file: 
      001B87                       4772 	_vars VSIZE
      00997A A6 06            [ 2]    1     sub sp,#VSIZE 
      00997C CC 87            [ 2] 4773 	ldw (YSAVE,sp),y  
      00997E B1               [ 1] 4774 	clrw x 
      00997F 81 85 52         [ 2] 4775 	ldw farptr+1,x 
      009982 02 89 CE 00      [ 1] 4776 	mov farptr,#1
      001B93                       4777 1$:	
                                   4778 ; check if farptr is after any file 
                                   4779 ; if  0 then so.
      009986 05 E6 02 AB      [ 5] 4780 	ldf a,[farptr]
      00998A 03 C7            [ 1] 4781 	jreq 6$
      00998C 00               [ 1] 4782 2$: clrw x 	
      00998D 0A 72            [ 2] 4783 	ldw y,(YSAVE,sp) 
      00998F 5F 00 09         [ 4] 4784 	call cmp_name
      009992 72 BB            [ 1] 4785 	jrc 9$
      009994 00 09 1F 03      [ 5] 4786 	ldf a,([farptr],x)
      009998 6B 01            [ 1] 4787 	ld (FSIZE,sp),a 
      009998 CD               [ 2] 4788 	incw x 
      009999 93 96 A1 04      [ 5] 4789 	ldf a,([farptr],x)
      00999D 27 03            [ 1] 4790 	ld (FSIZE+1,sp),a 
      00999F CC               [ 2] 4791 	incw x 
      0099A0 87 AF 01         [ 2] 4792 	addw x,(FSIZE,sp) ; count to skip 
      0099A2 5C               [ 2] 4793 	incw x ; skip over EOF marker 
      0099A2 CD 83 83         [ 4] 4794 	call incr_farptr ; now at next file 'name_field'
      0099A5 5D 26 05         [ 2] 4795 	ldw x,#0x280
      0099A8 A6 05 CC         [ 2] 4796 	cpw x,farptr 
      0099AB 87 B1            [ 1] 4797 	jrpl 1$
      0099AD                       4798 6$: ; file not found 
      0099AD CF 00 05 E6      [ 1] 4799 	clr farptr
      0099B1 02 C7 00 04      [ 1] 4800 	clr farptr+1 
      0099B5 35 03 00 02      [ 1] 4801 	clr farptr+2 
      001BCA                       4802 	_drop VSIZE 
      0099B9 81 04            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      0099BA 98               [ 1] 4803 	rcf
      0099BA 72               [ 4] 4804 	ret
      001BCE                       4805 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001BCE                       4806 	_drop VSIZE 
      0099BB 00 00            [ 2]    1     addw sp,#VSIZE 
      0099BD 20               [ 1] 4807 	scf 	
      0099BE 05               [ 4] 4808 	ret
                                   4809 
                                   4810 ;--------------------------------
                                   4811 ; BASIC: SAVE "name" 
                                   4812 ; save text program in 
                                   4813 ; flash memory used as 
                                   4814 ;--------------------------------
                           000001  4815 	BSIZE=1
                           000003  4816 	NAMEPTR=3
                           000004  4817 	VSIZE=4
      001BD2                       4818 save:
      0099BF A6 06 CC 87 B1   [ 2] 4819 	btjf flags,#FRUN,0$ 
      0099C4 A6 07            [ 1] 4820 	ld a,#ERR_CMD_ONLY 
      0099C4 1E 03 CF         [ 2] 4821 	jp tb_error
      001BDC                       4822 0$:	 
      0099C7 00 05 E6         [ 2] 4823 	ldw x,txtend 
      0099CA 02 AB 03 C7      [ 2] 4824 	subw x,txtbgn
      0099CE 00 04            [ 1] 4825 	jrne 1$
                                   4826 ; nothing to save 
      0099D0 35               [ 4] 4827 	ret 
      001BE6                       4828 1$:	
      001BE6                       4829 	_vars VSIZE 
      0099D1 03 00            [ 2]    1     sub sp,#VSIZE 
      0099D3 02 4F            [ 2] 4830 	ldw (BSIZE,sp),x 
      0099D5 85 5B 02         [ 4] 4831 	call next_token	
      0099D8 89 81            [ 1] 4832 	cp a,#TK_QSTR
      0099DA 27 03            [ 1] 4833 	jreq 2$
      0099DA 72 01 00         [ 2] 4834 	jp syntax_error
      001BF4                       4835 2$: 
      0099DD 20 02 4F 81      [ 2] 4836 	ldw y,basicptr 
      0099E1 72 B9 00 00      [ 2] 4837 	addw y,in.w
      0099E1 72 09            [ 2] 4838 	ldw (NAMEPTR,sp),y  
      0099E3 00 20 12 5B 02   [ 1] 4839 	mov in,count 
                                   4840 ; check if enough free space 
      0099E8 CD               [ 1] 4841 	ldw x,y 
      0099E9 97 20 5B         [ 4] 4842 	call strlen 
      0099EC 06 72 19         [ 2] 4843 	addw x,#3 
      0099EF 00 20 72         [ 2] 4844 	addw x,(BSIZE,sp)
      0099F2 10 00 20 CC      [ 1] 4845 	tnz ffree 
      0099F6 88 5F            [ 1] 4846 	jrne 21$
      0099F8 CE 00 19 C3      [ 2] 4847 	subw x,ffree+1 
      0099FC 00 1B            [ 2] 4848 	jrule 21$
      0099FE 2B 02            [ 1] 4849 	ld a,#ERR_MEM_FULL 
      009A00 4F 81 CD         [ 2] 4850 	jp tb_error
      001C1E                       4851 21$: 
                                   4852 ; check for existing file of that name 
      009A03 94 11            [ 2] 4853 	ldw y,(NAMEPTR,sp)	
      009A05 5B 02 CE         [ 4] 4854 	call search_file 
      009A08 00 19            [ 1] 4855 	jrnc 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009A0A CF 00            [ 1] 4856 	ld a,#ERR_DUPLICATE 
      009A0C 05 E6 02         [ 2] 4857 	jp tb_error 
      001C2A                       4858 3$:	;** write file name to flash **
      009A0F C7 00 04         [ 2] 4859 	ldw x,ffree 
      009A12 35 03 00         [ 1] 4860 	ld a,ffree+2 
      009A15 02 72 10         [ 2] 4861 	ldw farptr,x 
      009A18 00 20 CC         [ 1] 4862 	ld farptr+2,a 
      009A1B 88 5F            [ 2] 4863 	ldw x,(NAMEPTR,sp)  
      009A1D CD 02 95         [ 4] 4864 	call strlen 
      009A1D AE               [ 2] 4865 	incw  x
      009A1E 17 FF            [ 2] 4866 	ldw (BSIZE,sp),x  
      009A20 94               [ 1] 4867 	clrw x   
      009A21 72 11            [ 2] 4868 	ldw y,(NAMEPTR,sp)
      009A23 00 20 72         [ 4] 4869 	call write_block  
                                   4870 ;** write file length after name **
      009A26 19 00 20         [ 2] 4871 	ldw x,txtend 
      009A29 CC 88 03 18      [ 2] 4872 	subw x,txtbgn
      009A2C 1F 01            [ 2] 4873 	ldw (BSIZE,sp),x 
      009A2C CD               [ 1] 4874 	clrw x 
      009A2D 92 4E            [ 1] 4875 	ld a,(1,sp)
      009A2F A1 02 27         [ 4] 4876 	call write_byte 
      009A32 03               [ 2] 4877 	incw x 
      009A33 CC 87            [ 1] 4878 	ld a,(2,sp)
      009A35 AF 00 EE         [ 4] 4879 	call write_byte
      009A36 5C               [ 2] 4880 	incw x  
      009A36 CE 00 17         [ 4] 4881 	call incr_farptr ; move farptr after SIZE field 
                                   4882 ;** write BASIC text **
                                   4883 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009A39 EE 02            [ 2] 4884 	ldw x,(BSIZE,sp)
      009A3B A6               [ 2] 4885 	pushw x ; write_block argument 
      009A3C 1F               [ 1] 4886 	clrw x 
      009A3D 62 C7 50 F3      [ 2] 4887 	ldw y,txtbgn  ; BASIC text to save 
      009A41 72 1A 50         [ 4] 4888 	call write_block 
      001C68                       4889 	_drop 2 ;  drop write_block argument  
      009A44 F3 CD            [ 2]    1     addw sp,#2 
                                   4890 ; write en end of file marker 
      009A46 90 2E CD         [ 2] 4891 	ldw x,#1
      009A49 9F 4C            [ 1] 4892 	ld a,#EOF  
      009A4B CD 90 55         [ 4] 4893 	call write_byte 
      009A4E A6 1F C7         [ 4] 4894 	call incr_farptr
                                   4895 ; save farptr in ffree
      009A51 50 F3 81         [ 2] 4896 	ldw x,farptr 
      009A54 C6 00 12         [ 1] 4897 	ld a,farptr+2 
      009A54 CD 92 4E         [ 2] 4898 	ldw ffree,x 
      009A57 A1 02 27         [ 1] 4899 	ld ffree+2,a
                                   4900 ;write 4 zero bytes as an end of all files marker 
      009A5A 0D               [ 1] 4901     clrw x 
      009A5B A1 01            [ 1] 4902 	push #4 
      001C84                       4903 4$:
      009A5D 27               [ 1] 4904 	clr a 
      009A5E 03 CC 87         [ 4] 4905 	call write_byte 
      009A61 AF               [ 2] 4906 	incw x 
      009A62 AE 00            [ 1] 4907 	dec (1,sp)
      009A64 00 CD            [ 1] 4908 	jrne 4$
      009A66 90               [ 1] 4909 5$: pop a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4910 ; display saved size  
      009A67 21 AE            [ 2] 4911 	ldw x,(BSIZE,sp) 
      009A69 00 02 72         [ 4] 4912 	call print_int 
      001C93                       4913 	_drop VSIZE 
      009A6C DE 00            [ 2]    1     addw sp,#VSIZE 
      009A6E 17               [ 4] 4914 	ret 
                                   4915 
                                   4916 
                                   4917 ;------------------------
                                   4918 ; BASIC: LOAD "file" 
                                   4919 ; load file to RAM 
                                   4920 ; for execution 
                                   4921 ;------------------------
      001C96                       4922 load:
      009A6F 5D 27 1C 72 CE   [ 2] 4923 	btjf flags,#FRUN,0$ 
      009A74 00 17            [ 1] 4924 	jreq 0$ 
      009A76 9F A4            [ 1] 4925 	ld a,#ERR_CMD_ONLY 
      009A78 07 4E C7         [ 2] 4926 	jp tb_error 
      001CA2                       4927 0$:	
      009A7B 54 01 72         [ 4] 4928 	call next_token 
      009A7E 16 50            [ 1] 4929 	cp a,#TK_QSTR
      009A80 CA 72            [ 1] 4930 	jreq 1$
      009A82 10 54 01         [ 2] 4931 	jp syntax_error 
      001CAC                       4932 1$:	
      009A85 AE 00 1B 5A      [ 2] 4933 	ldw y,basicptr
      009A89 9D 26 FA 20      [ 2] 4934 	addw y,in.w 
      009A8D 08 72 11 54 01   [ 1] 4935 	mov in,count 
      009A92 72 17 50         [ 4] 4936 	call search_file 
      009A95 CA AE            [ 1] 4937 	jrc 2$ 
      009A97 00 02            [ 1] 4938 	ld a,#ERR_NOT_FILE
      009A99 CD 90 92         [ 2] 4939 	jp tb_error  
      001CC3                       4940 2$:	
      009A9C 81 1B 1B         [ 4] 4941 	call incr_farptr  
      009A9D CD 06 01         [ 4] 4942 	call clear_basic  
      009A9D CD               [ 1] 4943 	clrw x
      009A9E 92 72 A1 01      [ 5] 4944 	ldf a,([farptr],x)
      009AA2 27 03            [ 1] 4945 	ld yh,a 
      009AA4 CC               [ 2] 4946 	incw x  
      009AA5 87 AF CD 90      [ 5] 4947 	ldf a,([farptr],x)
      009AA9 2E               [ 2] 4948 	incw x 
      009AAA A3 00            [ 1] 4949 	ld yl,a 
      009AAC 05 23 05 A6      [ 2] 4950 	addw y,txtbgn
      009AB0 0A CC 87 B1      [ 2] 4951 	ldw txtend,y
      009AB4 9F C7 00 0A      [ 2] 4952 	ldw y,txtbgn
      001CE4                       4953 3$:	; load BASIC text 	
      009AB8 A6 05 C0 00      [ 5] 4954 	ldf a,([farptr],x)
      009ABC 0A C7            [ 1] 4955 	ld (y),a 
      009ABE 54               [ 2] 4956 	incw x 
      009ABF 00 72            [ 2] 4957 	incw y 
      009AC1 16 54 02 72      [ 2] 4958 	cpw y,txtend 
      009AC5 10 54            [ 1] 4959 	jrmi 3$
                                   4960 ; print loaded size 	 
      009AC7 01 72 0F         [ 2] 4961 	ldw x,txtend 
      009ACA 54 00 FB CE      [ 2] 4962 	subw x,txtbgn
      009ACE 54 04 A6         [ 4] 4963 	call print_int 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009AD1 04               [ 4] 4964 	ret 
                                   4965 
                                   4966 ;-----------------------------------
                                   4967 ; BASIC: FORGET ["file_name"] 
                                   4968 ; erase file_name and all others 
                                   4969 ; after it. 
                                   4970 ; without argument erase all files 
                                   4971 ;-----------------------------------
      001CFE                       4972 forget:
      009AD2 81 08 0F         [ 4] 4973 	call next_token 
      009AD3 A1 00            [ 1] 4974 	cp a,#TK_NONE 
      009AD3 52 01            [ 1] 4975 	jreq 3$ 
      009AD5 CD 92            [ 1] 4976 	cp a,#TK_QSTR
      009AD7 72 A1            [ 1] 4977 	jreq 1$
      009AD9 01 27 03         [ 2] 4978 	jp syntax_error
      009ADC CC 87 AF CD      [ 2] 4979 1$: ldw y,basicptr
      009AE0 90 2E A3 00      [ 2] 4980 	addw y,in.w
      009AE4 0F 23 05 A6 0A   [ 1] 4981 	mov in,count 
      009AE9 CC 87 B1         [ 4] 4982 	call search_file
      009AEC CD A0            [ 1] 4983 	jrc 2$
      009AEE 9F 6B            [ 1] 4984 	ld a,#ERR_NOT_FILE 
      009AF0 01 E6 01         [ 2] 4985 	jp tb_error 
      001D23                       4986 2$: 
      009AF3 0D 01 27         [ 2] 4987 	ldw x,farptr
      009AF6 05 44 0A         [ 1] 4988 	ld a,farptr+2
      009AF9 01 26            [ 2] 4989 	jra 4$ 
      001D2B                       4990 3$: ; forget all files 
      009AFB FB A4 01         [ 2] 4991 	ldw x,#0x100
      009AFE 5F               [ 1] 4992 	clr a 
      009AFF 97 A6 04         [ 2] 4993 	ldw farptr,x 
      009B02 5B 01 81         [ 1] 4994 	ld farptr+2,a 
      009B05                       4995 4$:
      009B05 52 02 CD         [ 2] 4996 	ldw ffree,x 
      009B08 92 4E A1         [ 1] 4997 	ld ffree+2,a 
      009B0B 02 27            [ 1] 4998 	push #4
      009B0D 03               [ 1] 4999 	clrw x 
      001D3E                       5000 5$: 
      009B0E CC               [ 1] 5001 	clr a  
      009B0F 87 AF CD         [ 4] 5002 	call write_byte 
      009B12 90               [ 2] 5003 	incw x 
      009B13 2E 9F            [ 1] 5004 	dec (1,sp)
      009B15 6B 02            [ 1] 5005 	jrne 5$	
      009B17 CD               [ 1] 5006 6$: pop a 
      009B18 90               [ 4] 5007 	ret 
                                   5008 
                                   5009 ;----------------------
                                   5010 ; BASIC: DIR 
                                   5011 ; list saved files 
                                   5012 ;----------------------
                           000001  5013 	COUNT=1 ; files counter 
                           000002  5014 	VSIZE=2 
      001D49                       5015 directory:
      001D49                       5016 	_vars VSIZE 
      009B19 2E A3            [ 2]    1     sub sp,#VSIZE 
      009B1B 00               [ 1] 5017 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009B1C 0F 23            [ 2] 5018 	ldw (COUNT,sp),x 
      009B1E 05 A6 0A         [ 2] 5019 	ldw farptr+1,x 
      009B21 CC 87 B1 CD      [ 1] 5020 	mov farptr,#1 
      001D55                       5021 dir_loop:
      009B25 A0               [ 1] 5022 	clrw x 
      009B26 9F 6B 01 A6      [ 5] 5023 	ldf a,([farptr],x)
      009B2A 01 0D            [ 1] 5024 	jreq 8$ 
      001D5C                       5025 1$: ;name loop 	
      009B2C 01 27 05 48      [ 5] 5026 	ldf a,([farptr],x)
      009B30 0A 01            [ 1] 5027 	jreq 2$ 
      009B32 26 FB 0D         [ 4] 5028 	call putc 
      009B35 02               [ 2] 5029 	incw x 
      009B36 26 05            [ 2] 5030 	jra 1$
      009B38 43               [ 2] 5031 2$: incw x ; skip ending 0. 
      009B39 E4 00            [ 1] 5032 	ld a,#SPACE 
      009B3B 20 02 EA         [ 4] 5033 	call putc 
                                   5034 ; get file size 	
      009B3E 00 E7 00 5B      [ 5] 5035 	ldf a,([farptr],x)
      009B42 02 81            [ 1] 5036 	ld yh,a 
      009B44 5C               [ 2] 5037 	incw x 
      009B44 72 00 00 20      [ 5] 5038 	ldf a,([farptr],x)
      009B48 02               [ 2] 5039 	incw x 
      009B49 4F 81            [ 1] 5040 	ld yl,a 
      009B4B 90 89            [ 2] 5041 	pushw y 
      009B4B AE 9B 72         [ 2] 5042 	addw x,(1,sp)
      009B4E CD               [ 2] 5043 	incw x ; skip EOF marker 
                                   5044 ; skip to next file 
      009B4F 82 53 5B         [ 4] 5045 	call incr_farptr 
                                   5046 ; print file size 
      009B52 02               [ 2] 5047 	popw x ; file size 
      009B53 52 06 CD         [ 4] 5048 	call print_int 
      009B56 97 10            [ 1] 5049 	ld a,#CR 
      009B58 AE 16 C8         [ 4] 5050 	call putc
      009B5B CF 00            [ 2] 5051 	ldw x,(COUNT,sp)
      009B5D 05               [ 2] 5052 	incw x
      009B5E 7F 72            [ 2] 5053 	ldw (COUNT,sp),x  
      009B60 5F 00            [ 2] 5054 	jra dir_loop 
      001D95                       5055 8$: ; print number of files 
      009B62 04 5F            [ 2] 5056 	ldw x,(COUNT,sp)
      009B64 CF 00 01         [ 4] 5057 	call print_int 
      009B67 72 11 00         [ 2] 5058 	ldw x,#file_count 
      009B6A 20 72 18         [ 4] 5059 	call puts  
                                   5060 ; print drive free space 	
      009B6D 00 20            [ 1] 5061 	ld a,#0xff 
      009B6F CC 88 5F         [ 1] 5062 	sub a,ffree+2 
      009B72 0A 62 72         [ 1] 5063 	ld acc8,a 
      009B75 65 61            [ 1] 5064 	ld a,#0x7f 
      009B77 6B 20 70         [ 1] 5065 	sbc a,ffree+1 
      009B7A 6F 69 6E         [ 1] 5066 	ld acc16,a 
      009B7D 74 2C            [ 1] 5067 	ld a,#2 
      009B7F 20 52 55         [ 1] 5068 	sbc a,ffree 
      009B82 4E 20 74         [ 1] 5069 	ld acc24,a 
      009B85 6F               [ 1] 5070 	clrw x  
      009B86 20 72            [ 1] 5071 	ld a,#6 
      009B88 65               [ 1] 5072 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009B89 73 75            [ 1] 5073 	ld a,#10 
      009B8B 6D 65 2E         [ 4] 5074 	call prti24 
      009B8E 0A 00 D2         [ 2] 5075 	ldw x,#drive_free
      009B90 CD 01 D3         [ 4] 5076 	call puts 
      001DC7                       5077 	_drop VSIZE 
      009B90 72 01            [ 2]    1     addw sp,#VSIZE 
      009B92 00               [ 4] 5078 	ret
      009B93 20 02 4F 81 65 73 0A  5079 file_count: .asciz " files\n"
             00
      009B97 20 62 79 74 65 73 20  5080 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5081 
                                   5082 ;---------------------
                                   5083 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5084 ; write 1 or more byte to FLASH or EEPROM
                                   5085 ; starting at address  
                                   5086 ; input:
                                   5087 ;   expr1  	is address 
                                   5088 ;   expr2   is byte to write
                                   5089 ; output:
                                   5090 ;   none 
                                   5091 ;---------------------
                           000001  5092 	ADDR=1
                           000002  5093 	VSIZ=2 
      001DDF                       5094 write:
      001DDF                       5095 	_vars VSIZE 
      009B97 CD 86            [ 2]    1     sub sp,#VSIZE 
      009B99 81 81 00 10      [ 1] 5096 	clr farptr ; expect 16 bits address 
      009B9B CD 12 D2         [ 4] 5097 	call expression
      009B9B 72 BB            [ 1] 5098 	cp a,#TK_INTGR 
      009B9D 00 12            [ 1] 5099 	jreq 0$
      009B9F 24 04 72         [ 2] 5100 	jp syntax_error
      009BA2 5C 00            [ 2] 5101 0$: ldw (ADDR,sp),x 
      009BA4 11 CF 00         [ 4] 5102 	call next_token 
      009BA7 12 81            [ 1] 5103 	cp a,#TK_COMMA 
      009BA9 27 02            [ 1] 5104 	jreq 1$ 
      009BA9 A6 01            [ 2] 5105 	jra 9$ 
      009BAB C7 00 11         [ 4] 5106 1$:	call expression
      009BAE 5F CF            [ 1] 5107 	cp a,#TK_INTGR
      009BB0 00 12            [ 1] 5108 	jreq 2$
      009BB2 CC 07 2F         [ 2] 5109 	jp syntax_error
      009BB2 AE               [ 1] 5110 2$:	ld a,xl 
      009BB3 00 03            [ 2] 5111 	ldw x,(ADDR,sp) 
      009BB5 92 AF 00         [ 2] 5112 	ldw farptr+1,x 
      009BB8 11               [ 1] 5113 	clrw x 
      009BB9 26 05 5A         [ 4] 5114 	call write_byte
      009BBC 2A F7            [ 2] 5115 	ldw x,(ADDR,sp)
      009BBE 20               [ 2] 5116 	incw x 
      009BBF 19 5C            [ 2] 5117 	jra 0$ 
      001E13                       5118 9$:
      001E13                       5119 	_drop VSIZE
      009BC1 CD 9B            [ 2]    1     addw sp,#VSIZE 
      009BC3 9B               [ 4] 5120 	ret 
                                   5121 
                                   5122 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5123 ;---------------------
                                   5124 ;BASIC: CHAR(expr)
                                   5125 ; évaluate expression 
                                   5126 ; and take the 7 least 
                                   5127 ; bits as ASCII character
                                   5128 ;---------------------
      001E16                       5129 char:
      009BC4 AE 02 7F         [ 4] 5130 	call func_args 
      009BC7 C3 00            [ 1] 5131 	cp a,#1
      009BC9 11 2A            [ 1] 5132 	jreq 1$
      009BCB E6 72 5F         [ 2] 5133 	jp syntax_error
      009BCE 00 14 72         [ 4] 5134 1$:	call dpop 
      009BD1 5F               [ 1] 5135 	ld a,xl 
      009BD2 00 15            [ 1] 5136 	and a,#0x7f 
      009BD4 72               [ 1] 5137 	ld xl,a
      009BD5 5F 00            [ 1] 5138 	ld a,#TK_CHAR
      009BD7 16               [ 4] 5139 	ret
                                   5140 
                                   5141 ;---------------------
                                   5142 ; BASIC: ASC(string|char)
                                   5143 ; extract first character 
                                   5144 ; of string argument 
                                   5145 ; return it as TK_INTGR 
                                   5146 ;---------------------
      001E2A                       5147 ascii:
      009BD8 81 11 F2         [ 4] 5148 	call func_args 
      009BD9 CD 08 0F         [ 4] 5149 	call next_token 
      009BD9 CE 00            [ 1] 5150 	cp a,#TK_QSTR 
      009BDB 11 C6            [ 1] 5151 	jreq 1$
      009BDD 00 13            [ 1] 5152 	cp a,#TK_CHAR 
      009BDF CF 00            [ 1] 5153 	jreq 2$ 
      009BE1 14 C7 00         [ 2] 5154 	jp syntax_error
      001E3B                       5155 1$: 
      009BE4 16               [ 1] 5156 	ld a,(x)
      009BE5 81 01            [ 2] 5157 	jra 3$
      009BE6                       5158 2$: 
      009BE6 5F               [ 1] 5159 	ld a,xl 
      009BE7 92               [ 1] 5160 3$:	ld xl,a 
      009BE8 AF               [ 1] 5161 	clr a  
      009BE9 00               [ 1] 5162 	ld xh,a 
      009BEA 11 90            [ 1] 5163 	ld a,#TK_INTGR 
      009BEC F1               [ 4] 5164 	ret 
                                   5165 
                                   5166 ;---------------------
                                   5167 ;BASIC: KEY
                                   5168 ; wait for a character 
                                   5169 ; received from STDIN 
                                   5170 ; input:
                                   5171 ;	none 
                                   5172 ; output:
                                   5173 ;	X 		ASCII character 
                                   5174 ;---------------------
      001E45                       5175 key:
      009BED 26 08 4D         [ 4] 5176 	call getc 
      009BF0 27               [ 1] 5177 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009BF1 12               [ 1] 5178 	ld xl,a 
      009BF2 5C 90            [ 1] 5179 	ld a,#TK_INTGR
      009BF4 5C               [ 4] 5180 	ret
                                   5181 
                                   5182 ;----------------------
                                   5183 ; BASIC: QKEY
                                   5184 ; Return true if there 
                                   5185 ; is a character in 
                                   5186 ; waiting in STDIN 
                                   5187 ; input:
                                   5188 ;  none 
                                   5189 ; output:
                                   5190 ;   X 		0|1 
                                   5191 ;-----------------------
      001E4D                       5192 qkey: 
      009BF5 20               [ 1] 5193 	clrw x 
      009BF6 F0 0B 52 30 01   [ 2] 5194 	btjf UART1_SR,#UART_SR_RXNE,9$ 
      009BF7 5C               [ 2] 5195 	incw x 
      009BF7 4D 27            [ 1] 5196 9$: ld a,#TK_INTGR
      009BF9 07               [ 4] 5197 	ret 
                                   5198 
                                   5199 ;---------------------
                                   5200 ; BASIC: GPIO(expr,reg)
                                   5201 ; return gpio address 
                                   5202 ; expr {0..8}
                                   5203 ; input:
                                   5204 ;   none 
                                   5205 ; output:
                                   5206 ;   X 		gpio register address
                                   5207 ;----------------------------
      001E57                       5208 gpio:
      009BFA 5C 92 AF         [ 4] 5209 	call func_args 
      009BFD 00 11            [ 1] 5210 	cp a,#2
      009BFF 20 F6            [ 1] 5211 	jreq 1$
      009C01 5C 98 81         [ 2] 5212 	jp syntax_error  
      009C04                       5213 1$:	
      009C04 5C 99 81         [ 2] 5214 	ldw x,#2
      009C07 72 DE 00 16      [ 5] 5215 	ldw x,([dstkptr],x) ; port 
      009C07 52 04            [ 1] 5216 	jrmi bad_port
      009C09 17 03 5F         [ 2] 5217 	cpw x,#9
      009C0C CF 00            [ 1] 5218 	jrpl bad_port
      009C0E 12 35            [ 1] 5219 	ld a,#5
      009C10 01               [ 4] 5220 	mul x,a
      009C11 00 11 00         [ 2] 5221 	addw x,#GPIO_BASE 
      009C13 89               [ 2] 5222 	pushw x 
      009C13 92 BC 00         [ 4] 5223 	call dpop 
      009C16 11 27 25         [ 2] 5224 	addw x,(1,sp)
      009C19 5F 16            [ 2] 5225 	ldw (1,sp),x  
      009C1B 03 CD 9B         [ 4] 5226 	call ddrop  
      009C1E E6               [ 2] 5227 	popw x 
      009C1F 25 2D            [ 1] 5228 	ld a,#TK_INTGR
      009C21 92               [ 4] 5229 	ret
      001E85                       5230 bad_port:
      009C22 AF 00            [ 1] 5231 	ld a,#ERR_BAD_VALUE
      009C24 11 6B 01         [ 2] 5232 	jp tb_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5233 
                                   5234 
                                   5235 ;-------------------------
                                   5236 ; BASIC: UFLASH 
                                   5237 ; return user flash address
                                   5238 ; input:
                                   5239 ;  none 
                                   5240 ; output:
                                   5241 ;	A		TK_INTGR
                                   5242 ;   X 		user address 
                                   5243 ;---------------------------
      001E8A                       5244 uflash:
      009C27 5C 92 AF         [ 2] 5245 	ldw x,#user_space 
      009C2A 00 11            [ 1] 5246 	ld a,#TK_INTGR 
      009C2C 6B               [ 4] 5247 	ret 
                                   5248 
                                   5249 
                                   5250 ;---------------------
                                   5251 ; BASIC: USR(addr[,arg])
                                   5252 ; execute a function written 
                                   5253 ; in binary code.
                                   5254 ; binary fonction should 
                                   5255 ; return token attribute in A 
                                   5256 ; and value in X. 
                                   5257 ; input:
                                   5258 ;   addr	routine address 
                                   5259 ;   arg 	is an optional argument 
                                   5260 ; output:
                                   5261 ;   A 		token attribute 
                                   5262 ;   X       returned value 
                                   5263 ;---------------------
      001E90                       5264 usr:
      009C2D 02 5C            [ 2] 5265 	pushw y 	
      009C2F 72 FB 01         [ 4] 5266 	call func_args 
      009C32 5C CD            [ 1] 5267 	cp a,#1 
      009C34 9B 9B            [ 1] 5268 	jrpl 2$ 
      009C36 AE 02 80         [ 2] 5269 	jp syntax_error 
      001E9C                       5270 2$: 
      009C39 C3 00 11         [ 4] 5271 	call dpop 
      009C3C 2A D5            [ 1] 5272 	cp a,#2 
      009C3E 2B 05            [ 1] 5273 	jrmi 4$
      009C3E 72 5F            [ 1] 5274 	ldw y,x ; y=arg 
      009C40 00 11 72         [ 4] 5275 	call dpop ;x=addr 
      009C43 5F               [ 1] 5276 4$:	exgw y,x ; y=addr,x=arg 
      009C44 00 12            [ 4] 5277 	call (y)
      009C46 72 5F            [ 2] 5278 	popw y 
      009C48 00               [ 4] 5279 	ret 
                                   5280 
                                   5281 ;------------------------------
                                   5282 ; BASIC: BYE 
                                   5283 ; halt mcu in its lowest power mode 
                                   5284 ; wait for reset or external interrupt
                                   5285 ; do a cold start on wakeup.
                                   5286 ;------------------------------
      001EAE                       5287 bye:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009C49 13 5B 04 98 81   [ 2] 5288 	btjf UART1_SR,#UART_SR_TC,.
      009C4E 8E               [10] 5289 	halt
      009C4E 5B 04 99         [ 2] 5290 	jp cold_start  
                                   5291 
                                   5292 ;----------------------------------
                                   5293 ; BASIC: SLEEP 
                                   5294 ; halt mcu until reset or external
                                   5295 ; interrupt.
                                   5296 ; Resume progam after SLEEP command
                                   5297 ;----------------------------------
      001EB7                       5298 sleep:
      009C51 81 0D 52 30 FB   [ 2] 5299 	btjf UART1_SR,#UART_SR_TC,.
      009C52 72 16 00 1F      [ 1] 5300 	bset flags,#FSLEEP
      009C52 72               [10] 5301 	halt 
      009C53 01               [ 4] 5302 	ret 
                                   5303 
                                   5304 ;-------------------------------
                                   5305 ; BASIC: PAUSE expr 
                                   5306 ; suspend execution for n msec.
                                   5307 ; input:
                                   5308 ;	none
                                   5309 ; output:
                                   5310 ;	none 
                                   5311 ;------------------------------
      001EC2                       5312 pause:
      009C54 00 20 05         [ 4] 5313 	call expression
      009C57 A6 07            [ 1] 5314 	cp a,#TK_INTGR
      009C59 CC 87            [ 1] 5315 	jreq pause02 
      009C5B B1 07 2F         [ 2] 5316 	jp syntax_error
      009C5C                       5317 pause02: 
      009C5C CE               [ 2] 5318 1$: tnzw x 
      009C5D 00 1B            [ 1] 5319 	jreq 2$
      009C5F 72               [10] 5320 	wfi 
      009C60 B0               [ 2] 5321 	decw x 
      009C61 00 19            [ 1] 5322 	jrne 1$
      009C63 26               [ 1] 5323 2$:	clr a 
      009C64 01               [ 4] 5324 	ret 
                                   5325 
                                   5326 ;------------------------------
                                   5327 ; BASIC: AWU expr
                                   5328 ; halt mcu for 'expr' milliseconds
                                   5329 ; use Auto wakeup peripheral
                                   5330 ; all oscillators stopped except LSI
                                   5331 ; range: 1ms - 511ms
                                   5332 ; input:
                                   5333 ;  none
                                   5334 ; output:
                                   5335 ;  none:
                                   5336 ;------------------------------
      001ED5                       5337 awu:
      009C65 81 12 D2         [ 4] 5338   call expression
      009C66 A1 04            [ 1] 5339   cp a,#TK_INTGR
      009C66 52 04            [ 1] 5340   jreq awu02
      009C68 1F 01 CD         [ 2] 5341   jp syntax_error
      001EDF                       5342 awu02:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009C6B 88 8F A1         [ 2] 5343   cpw x,#5120
      009C6E 0A 27            [ 1] 5344   jrmi 1$ 
      009C70 03 CC 87 AF      [ 1] 5345   mov AWU_TBR,#15 
      009C74 A6 1E            [ 1] 5346   ld a,#30
      009C74 90               [ 2] 5347   div x,a
      009C75 CE 00            [ 1] 5348   ld a,#16
      009C77 05               [ 2] 5349   div x,a 
      009C78 72 B9            [ 2] 5350   jra 4$
      001EF0                       5351 1$: 
      009C7A 00 01 17         [ 2] 5352   cpw x,#2048
      009C7D 03 55            [ 1] 5353   jrmi 2$ 
      009C7F 00 04 00 02      [ 1] 5354   mov AWU_TBR,#14
      009C83 93 CD            [ 1] 5355   ld a,#80
      009C85 83               [ 2] 5356   div x,a 
      009C86 15 1C            [ 2] 5357   jra 4$   
      001EFE                       5358 2$:
      009C88 00 03 72 FB      [ 1] 5359   mov AWU_TBR,#7
      001F02                       5360 3$:  
                                   5361 ; while X > 64  divide by 2 and increment AWU_TBR 
      009C8C 01 72 5D         [ 2] 5362   cpw x,#64 
      009C8F 00 14            [ 2] 5363   jrule 4$ 
      009C91 26 0B 72 B0      [ 1] 5364   inc AWU_TBR 
      009C95 00               [ 2] 5365   srlw x 
      009C96 15 23            [ 2] 5366   jra 3$ 
      001F0E                       5367 4$:
      009C98 05               [ 1] 5368   ld a, xl
      009C99 A6               [ 1] 5369   dec a 
      009C9A 01 CC            [ 1] 5370   jreq 5$
      009C9C 87               [ 1] 5371   dec a 	
      001F13                       5372 5$: 
      009C9D B1 3E            [ 1] 5373   and a,#0x3e 
      009C9E C7 50 F1         [ 1] 5374   ld AWU_APR,a 
      009C9E 16 03 CD 9C      [ 1] 5375   bset AWU_CSR,#AWU_CSR_AWUEN
      009CA2 07               [10] 5376   halt 
                                   5377 
      009CA3 24               [ 4] 5378   ret 
                                   5379 
                                   5380 ;------------------------------
                                   5381 ; BASIC: TICKS
                                   5382 ; return msec ticks counter value 
                                   5383 ; input:
                                   5384 ; 	none 
                                   5385 ; output:
                                   5386 ;	X 		TK_INTGR
                                   5387 ;-------------------------------
      001F1E                       5388 get_ticks:
      009CA4 05 A6 08         [ 2] 5389 	ldw x,ticks 
      009CA7 CC 87            [ 1] 5390 	ld a,#TK_INTGR
      009CA9 B1               [ 4] 5391 	ret 
                                   5392 
                                   5393 
                                   5394 
                                   5395 ;------------------------------
                                   5396 ; BASIC: ABS(expr)
                                   5397 ; return absolute value of expr.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   5398 ; input:
                                   5399 ;   none
                                   5400 ; output:
                                   5401 ;   X     	positive integer
                                   5402 ;-------------------------------
      009CAA                       5403 abs:
      009CAA CE 00 14         [ 4] 5404 	call func_args 
      009CAD C6 00            [ 1] 5405 	cp a,#1 
      009CAF 16 CF            [ 1] 5406 	jreq 0$ 
      009CB1 00 11 C7         [ 2] 5407 	jp syntax_error
      001F2E                       5408 0$:  
      009CB4 00 13 1E         [ 4] 5409     call dpop   
      009CB7 03               [ 1] 5410 	ld a,xh 
      009CB8 CD 83            [ 1] 5411 	bcp a,#0x80 
      009CBA 15 5C            [ 1] 5412 	jreq 2$ 
      009CBC 1F               [ 2] 5413 	negw x 
      009CBD 01 5F            [ 1] 5414 2$: ld a,#TK_INTGR 
      009CBF 16               [ 4] 5415 	ret 
                                   5416 
                                   5417 ;------------------------------
                                   5418 ; BASIC: AND(expr1,expr2)
                                   5419 ; Apply bit AND relation between
                                   5420 ; the 2 arguments, i.e expr1 & expr2 
                                   5421 ; output:
                                   5422 ; 	A 		TK_INTGR
                                   5423 ;   X 		result 
                                   5424 ;------------------------------
      001F3A                       5425 bit_and:
      009CC0 03 CD 81         [ 4] 5426 	call func_args 
      009CC3 E3 CE            [ 1] 5427 	cp a,#2
      009CC5 00 1B            [ 1] 5428 	jreq 1$
      009CC7 72 B0 00         [ 2] 5429 	jp syntax_error 
      009CCA 19 1F 01         [ 4] 5430 1$:	call dpop 
      009CCD 5F               [ 2] 5431 	pushw x 
      009CCE 7B 01 CD         [ 4] 5432 	call dpop 
      009CD1 81               [ 1] 5433 	ld a,xh 
      009CD2 6E 5C            [ 1] 5434 	and a,(1,sp)
      009CD4 7B               [ 1] 5435 	ld xh,a 
      009CD5 02               [ 1] 5436 	ld a,xl
      009CD6 CD 81            [ 1] 5437 	and a,(2,sp)
      009CD8 6E               [ 1] 5438 	ld xl,a 
      001F53                       5439 	_drop 2 
      009CD9 5C CD            [ 2]    1     addw sp,#2 
      009CDB 9B 9B            [ 1] 5440 	ld a,#TK_INTGR
      009CDD 1E               [ 4] 5441 	ret
                                   5442 
                                   5443 ;------------------------------
                                   5444 ; BASIC: OR(expr1,expr2)
                                   5445 ; Apply bit OR relation between
                                   5446 ; the 2 arguments, i.e expr1 | expr2 
                                   5447 ; output:
                                   5448 ; 	A 		TK_INTGR
                                   5449 ;   X 		result 
                                   5450 ;------------------------------
      001F58                       5451 bit_or:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009CDE 01 89 5F         [ 4] 5452 	call func_args 
      009CE1 90 CE            [ 1] 5453 	cp a,#2
      009CE3 00 19            [ 1] 5454 	jreq 1$
      009CE5 CD 81 E3         [ 2] 5455 	jp syntax_error 
      001F62                       5456 1$: 
      009CE8 5B 02 AE         [ 4] 5457 	call dpop 
      009CEB 00               [ 2] 5458 	pushw x 
      009CEC 01 A6 FF         [ 4] 5459 	call dpop 
      009CEF CD               [ 1] 5460 	ld a,xh 
      009CF0 81 6E            [ 1] 5461 	or a,(1,sp)
      009CF2 CD               [ 1] 5462 	ld xh,a 
      009CF3 9B               [ 1] 5463 	ld a,xl 
      009CF4 9B CE            [ 1] 5464 	or a,(2,sp)
      009CF6 00               [ 1] 5465 	ld xl,a 
      001F71                       5466 	_drop 2 
      009CF7 11 C6            [ 2]    1     addw sp,#2 
      009CF9 00 13            [ 1] 5467 	ld a,#TK_INTGR 
      009CFB CF               [ 4] 5468 	ret
                                   5469 
                                   5470 ;------------------------------
                                   5471 ; BASIC: XOR(expr1,expr2)
                                   5472 ; Apply bit XOR relation between
                                   5473 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5474 ; output:
                                   5475 ; 	A 		TK_INTGR
                                   5476 ;   X 		result 
                                   5477 ;------------------------------
      001F76                       5478 bit_xor:
      009CFC 00 14 C7         [ 4] 5479 	call func_args 
      009CFF 00 16            [ 1] 5480 	cp a,#2
      009D01 5F 4B            [ 1] 5481 	jreq 1$
      009D03 04 07 2F         [ 2] 5482 	jp syntax_error 
      009D04                       5483 1$: 
      009D04 4F CD 81         [ 4] 5484 	call dpop 
      009D07 6E               [ 2] 5485 	pushw x 
      009D08 5C 0A 01         [ 4] 5486 	call dpop 
      009D0B 26               [ 1] 5487 	ld a,xh 
      009D0C F7 84            [ 1] 5488 	xor a,(1,sp)
      009D0E 1E               [ 1] 5489 	ld xh,a 
      009D0F 01               [ 1] 5490 	ld a,xl 
      009D10 CD 8A            [ 1] 5491 	xor a,(2,sp)
      009D12 28               [ 1] 5492 	ld xl,a 
      001F8F                       5493 	_drop 2 
      009D13 5B 04            [ 2]    1     addw sp,#2 
      009D15 81 04            [ 1] 5494 	ld a,#TK_INTGR 
      009D16 81               [ 4] 5495 	ret 
                                   5496 
                                   5497 ;------------------------------
                                   5498 ; BASIC: LSHIFT(expr1,expr2)
                                   5499 ; logical shift left expr1 by 
                                   5500 ; expr2 bits 
                                   5501 ; output:
                                   5502 ; 	A 		TK_INTGR
                                   5503 ;   X 		result 
                                   5504 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      001F94                       5505 lshift:
      009D16 72 01 00         [ 4] 5506 	call func_args
      009D19 20 07            [ 1] 5507 	cp a,#2 
      009D1B 27 05            [ 1] 5508 	jreq 1$
      009D1D A6 07 CC         [ 2] 5509 	jp syntax_error
      009D20 87 B1 AE         [ 4] 5510 1$: call dpop  
      009D22 51               [ 1] 5511 	exgw x,y 
      009D22 CD 88 8F         [ 4] 5512 	call dpop
      009D25 A1 0A            [ 2] 5513 	tnzw y 
      009D27 27 03            [ 1] 5514 	jreq 4$
      009D29 CC               [ 2] 5515 2$:	sllw x 
      009D2A 87 AF            [ 2] 5516 	decw y 
      009D2C 26 FB            [ 1] 5517 	jrne 2$
      001FAE                       5518 4$:  
      009D2C 90 CE            [ 1] 5519 	ld a,#TK_INTGR
      009D2E 00               [ 4] 5520 	ret
                                   5521 
                                   5522 ;------------------------------
                                   5523 ; BASIC: RSHIFT(expr1,expr2)
                                   5524 ; logical shift right expr1 by 
                                   5525 ; expr2 bits.
                                   5526 ; output:
                                   5527 ; 	A 		TK_INTGR
                                   5528 ;   X 		result 
                                   5529 ;------------------------------
      001FB1                       5530 rshift:
      009D2F 05 72 B9         [ 4] 5531 	call func_args
      009D32 00 01            [ 1] 5532 	cp a,#2 
      009D34 55 00            [ 1] 5533 	jreq 1$
      009D36 04 00 02         [ 2] 5534 	jp syntax_error
      009D39 CD 9C 07         [ 4] 5535 1$: call dpop  
      009D3C 25               [ 1] 5536 	exgw x,y 
      009D3D 05 A6 09         [ 4] 5537 	call dpop
      009D40 CC 87            [ 2] 5538 	tnzw y 
      009D42 B1 05            [ 1] 5539 	jreq 4$
      009D43 54               [ 2] 5540 2$:	srlw x 
      009D43 CD 9B            [ 2] 5541 	decw y 
      009D45 9B CD            [ 1] 5542 	jrne 2$
      001FCB                       5543 4$:  
      009D47 86 81            [ 1] 5544 	ld a,#TK_INTGR
      009D49 5F               [ 4] 5545 	ret
                                   5546 
                                   5547 ;--------------------------
                                   5548 ; BASIC: FCPU integer
                                   5549 ; set CPU frequency 
                                   5550 ;-------------------------- 
                                   5551 
      001FCE                       5552 fcpu:
      009D4A 92 AF            [ 1] 5553 	ld a,#TK_INTGR
      009D4C 00 11 90         [ 4] 5554 	call expect 
      009D4F 95               [ 1] 5555 	ld a,xl 
      009D50 5C 92            [ 1] 5556 	and a,#7 
      009D52 AF 00 11         [ 1] 5557 	ld CLK_CKDIVR,a 
      009D55 5C               [ 4] 5558 	ret 
                                   5559 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                                   5560 ;------------------------------
                                   5561 ; BASIC: PMODE pin#, mode 
                                   5562 ; define pin as input or output
                                   5563 ; pin#: {0..15}
                                   5564 ; mode: INPUT|OUTPUT  
                                   5565 ;------------------------------
                           000001  5566 	PINNO=1
                           000001  5567 	VSIZE=1
      001FDA                       5568 pin_mode:
      001FDA                       5569 	_vars VSIZE 
      009D56 90 97            [ 2]    1     sub sp,#VSIZE 
      009D58 72 B9 00         [ 4] 5570 	call arg_list 
      009D5B 19 90            [ 1] 5571 	cp a,#2 
      009D5D CF 00            [ 1] 5572 	jreq 1$
      009D5F 1B 90 CE         [ 2] 5573 	jp syntax_error 
      009D62 00 19 AE         [ 4] 5574 1$: call dpop ; mode 
      009D64 51               [ 1] 5575 	exgw x,y 
      009D64 92 AF 00         [ 4] 5576 	call dpop ; Dx pin 
      009D67 11 90 F7         [ 4] 5577 	call select_pin 
      009D6A 5C 90            [ 1] 5578 	ld (PINNO,sp),a  
      009D6C 5C 90            [ 1] 5579 	ld a,#1 
      009D6E C3 00            [ 1] 5580 	tnz (PINNO,sp)
      009D70 1B 2B            [ 1] 5581 	jreq 4$
      009D72 F1               [ 1] 5582 2$:	sll a 
      009D73 CE 00            [ 1] 5583 	dec (PINNO,sp)
      009D75 1B 72            [ 1] 5584 	jrne 2$ 
      009D77 B0 00            [ 1] 5585 	ld (PINNO,sp),a
      009D79 19 CD            [ 1] 5586 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009D7B 8A 28            [ 1] 5587 	ld (GPIO_CR1,x),a 
      009D7D 81 A3 00 01      [ 2] 5588 4$:	cpw y,#OUTP 
      009D7E 27 07            [ 1] 5589 	jreq 6$
                                   5590 ; input mode
      009D7E CD 88            [ 1] 5591 	ld a,(PINNO,sp)
      009D80 8F               [ 1] 5592 	cpl a 
      009D81 A1 00            [ 1] 5593 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009D83 27 26            [ 2] 5594 	jra 9$
      002010                       5595 6$: ;output mode  
      009D85 A1 0A            [ 1] 5596 	ld a,(PINNO,sp)
      009D87 27 03            [ 1] 5597 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009D89 CC 87            [ 1] 5598 	ld (GPIO_CR2,x),a 
      009D8B AF 90            [ 1] 5599 	ld a,(PINNO,sp)
      009D8D CE 00            [ 1] 5600 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009D8F 05 72            [ 1] 5601 9$:	ld (GPIO_DDR,x),a 
      00201C                       5602 	_drop VSIZE 
      009D91 B9 00            [ 2]    1     addw sp,#VSIZE 
      009D93 01               [ 4] 5603 	ret
                                   5604 
                                   5605 ;------------------------
                                   5606 ; select pin 
                                   5607 ; input:
                                   5608 ;   X 	 {0..15} Arduino Dx 
                                   5609 ; output:
                                   5610 ;   A     stm8s208 pin 
                                   5611 ;   X     base address s208 GPIO port 
                                   5612 ;---------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      00201F                       5613 select_pin:
      009D94 55               [ 2] 5614 	sllw x 
      009D95 00 04 00         [ 2] 5615 	addw x,#arduino_to_8s208 
      009D98 02               [ 2] 5616 	ldw x,(x)
      009D99 CD               [ 1] 5617 	ld a,xl 
      009D9A 9C               [ 1] 5618 	push a 
      009D9B 07               [ 1] 5619 	swapw x 
      009D9C 25 05            [ 1] 5620 	ld a,#5 
      009D9E A6               [ 4] 5621 	mul x,a 
      009D9F 09 CC 87         [ 2] 5622 	addw x,#GPIO_BASE 
      009DA2 B1               [ 1] 5623 	pop a 
      009DA3 81               [ 4] 5624 	ret 
                                   5625 ; translation from Arduino D0..D15 to stm8s208rb 
      00202F                       5626 arduino_to_8s208:
      009DA3 CE 00                 5627 .byte 3,6 ; D0 
      009DA5 11 C6                 5628 .byte 3,5 ; D1 
      009DA7 00 13                 5629 .byte 4,0 ; D2 
      009DA9 20 0A                 5630 .byte 2,1 ; D3
      009DAB 06 00                 5631 .byte 6,0 ; D4
      009DAB AE 01                 5632 .byte 2,2 ; D5
      009DAD 00 4F                 5633 .byte 2,3 ; D6
      009DAF CF 00                 5634 .byte 3,1 ; D7
      009DB1 11 C7                 5635 .byte 3,3 ; D8
      009DB3 00 13                 5636 .byte 2,4 ; D9
      009DB5 04 05                 5637 .byte 4,5 ; D10
      009DB5 CF 00                 5638 .byte 2,6 ; D11
      009DB7 14 C7                 5639 .byte 2,7 ; D12
      009DB9 00 16                 5640 .byte 2,5 ; D13
      009DBB 4B 04                 5641 .byte 4,2 ; D14
      009DBD 5F 01                 5642 .byte 4,1 ; D15
                                   5643 
                                   5644 
                                   5645 ;------------------------------
                                   5646 ; BASIC: RND(expr)
                                   5647 ; return random number 
                                   5648 ; between 1 and expr inclusive
                                   5649 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5650 ; input:
                                   5651 ; 	none 
                                   5652 ; output:
                                   5653 ;	X 		random positive integer 
                                   5654 ;------------------------------
      009DBE                       5655 random:
      009DBE 4F CD 81         [ 4] 5656 	call func_args 
      009DC1 6E 5C            [ 1] 5657 	cp a,#1
      009DC3 0A 01            [ 1] 5658 	jreq 1$
      009DC5 26 F7 84         [ 2] 5659 	jp syntax_error
      002059                       5660 1$: 
      009DC8 81 0F AE         [ 4] 5661 	call dpop 
      009DC9 89               [ 2] 5662 	pushw x 
      009DC9 52               [ 1] 5663 	ld a,xh 
      009DCA 02 5F            [ 1] 5664 	bcp a,#0x80 
      009DCC 1F 01            [ 1] 5665 	jreq 2$
      009DCE CF 00            [ 1] 5666 	ld a,#ERR_BAD_VALUE
      009DD0 12 35 01         [ 2] 5667 	jp tb_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      002067                       5668 2$: 
                                   5669 ; acc16=(x<<5)^x 
      009DD3 00 11 0C         [ 2] 5670 	ldw x,seedx 
      009DD5 58               [ 2] 5671 	sllw x 
      009DD5 5F               [ 2] 5672 	sllw x 
      009DD6 92               [ 2] 5673 	sllw x 
      009DD7 AF               [ 2] 5674 	sllw x 
      009DD8 00               [ 2] 5675 	sllw x 
      009DD9 11               [ 1] 5676 	ld a,xh 
      009DDA 27 39 0C         [ 1] 5677 	xor a,seedx 
      009DDC C7 00 08         [ 1] 5678 	ld acc16,a 
      009DDC 92               [ 1] 5679 	ld a,xl 
      009DDD AF 00 11         [ 1] 5680 	xor a,seedx+1 
      009DE0 27 06 CD         [ 1] 5681 	ld acc8,a 
                                   5682 ; seedx=seedy 
      009DE3 82 41 5C         [ 2] 5683 	ldw x,seedy 
      009DE6 20 F4 5C         [ 2] 5684 	ldw seedx,x  
                                   5685 ; seedy=seedy^(seedy>>1)
      009DE9 A6 20            [ 2] 5686 	srlw y 
      009DEB CD 82            [ 1] 5687 	ld a,yh 
      009DED 41 92 AF         [ 1] 5688 	xor a,seedy 
      009DF0 00 11 90         [ 1] 5689 	ld seedy,a  
      009DF3 95 5C            [ 1] 5690 	ld a,yl 
      009DF5 92 AF 00         [ 1] 5691 	xor a,seedy+1 
      009DF8 11 5C 90         [ 1] 5692 	ld seedy+1,a 
                                   5693 ; acc16>>3 
      009DFB 97 90 89         [ 2] 5694 	ldw x,acc16 
      009DFE 72               [ 2] 5695 	srlw x 
      009DFF FB               [ 2] 5696 	srlw x 
      009E00 01               [ 2] 5697 	srlw x 
                                   5698 ; x=acc16^x 
      009E01 5C               [ 1] 5699 	ld a,xh 
      009E02 CD 9B 9B         [ 1] 5700 	xor a,acc16 
      009E05 85               [ 1] 5701 	ld xh,a 
      009E06 CD               [ 1] 5702 	ld a,xl 
      009E07 8A 28 A6         [ 1] 5703 	xor a,acc8 
      009E0A 0D               [ 1] 5704 	ld xl,a 
                                   5705 ; seedy=x^seedy 
      009E0B CD 82 41         [ 1] 5706 	xor a,seedy+1
      009E0E 1E               [ 1] 5707 	ld xl,a 
      009E0F 01               [ 1] 5708 	ld a,xh 
      009E10 5C 1F 01         [ 1] 5709 	xor a,seedy
      009E13 20               [ 1] 5710 	ld xh,a 
      009E14 C0 00 0E         [ 2] 5711 	ldw seedy,x 
                                   5712 ; return seedy modulo expr + 1 
      009E15 90 85            [ 2] 5713 	popw y 
      009E15 1E               [ 2] 5714 	divw x,y 
      009E16 01               [ 1] 5715 	ldw x,y 
      009E17 CD               [ 2] 5716 	incw x 
      009E18 8A 28            [ 1] 5717 	ld a,#TK_INTGR
      009E1A AE               [ 4] 5718 	ret 
                                   5719 
                                   5720 ;---------------------------------
                                   5721 ; BASIC: WORDS 
                                   5722 ; affiche la listes des mots du
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



                                   5723 ; dictionnaire.
                                   5724 ;---------------------------------
                           000001  5725 	WLEN=1
                           000002  5726 	LLEN=2  
                           000002  5727 	VSIZE=2 
      0020B9                       5728 words:
      0020B9                       5729 	_vars VSIZE
      009E1B 9E 4A            [ 2]    1     sub sp,#VSIZE 
      009E1D CD 82            [ 1] 5730 	clr (LLEN,sp)
      009E1F 53 A6 FF C0      [ 2] 5731 	ldw y,#kword_dict+2
      009E23 00               [ 1] 5732 0$:	ldw x,y
      009E24 16               [ 1] 5733 	ld a,(x)
      009E25 C7 00            [ 1] 5734 	and a,#15 
      009E27 0A A6            [ 1] 5735 	ld (WLEN,sp),a 
      009E29 7F               [ 2] 5736 1$:	incw x 
      009E2A C2               [ 1] 5737 	ld a,(x)
      009E2B 00 15 C7         [ 4] 5738 	call putc 
      009E2E 00 09            [ 1] 5739 	inc (LLEN,sp)
      009E30 A6 02            [ 1] 5740 	dec (WLEN,sp)
      009E32 C2 00            [ 1] 5741 	jrne 1$
      009E34 14 C7            [ 1] 5742 	ld a,#70
      009E36 00 08            [ 1] 5743 	cp a,(LLEN,sp)
      009E38 5F A6            [ 1] 5744 	jrmi 2$   
      009E3A 06 97            [ 1] 5745 	ld a,#SPACE 
      009E3C A6 0A CD         [ 4] 5746 	call putc 
      009E3F 89 E0            [ 1] 5747 	inc (LLEN,sp) 
      009E41 AE 9E            [ 2] 5748 	jra 3$
      009E43 52 CD            [ 1] 5749 2$: ld a,#CR 
      009E45 82 53 5B         [ 4] 5750 	call putc 
      009E48 02 81            [ 1] 5751 	clr (LLEN,sp)
      009E4A 20 66 69 6C      [ 2] 5752 3$:	subw y,#2 
      009E4E 65 73            [ 2] 5753 	ldw y,(y)
      009E50 0A 00            [ 1] 5754 	jrne 0$  
      0020F0                       5755 	_drop VSIZE 
      009E52 20 62            [ 2]    1     addw sp,#VSIZE 
      009E54 79               [ 4] 5756 	ret 
                                   5757 
                                   5758 
                                   5759 ;*********************************
                                   5760 
                                   5761 ;------------------------------
                                   5762 ;      dictionary 
                                   5763 ; format:
                                   5764 ;   link:   2 bytes 
                                   5765 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5766 ;   cmd_name: 16 byte max 
                                   5767 ;   code_address: 2 bytes 
                                   5768 ;------------------------------
                                   5769 	.macro _dict_entry len,name,cmd 
                                   5770 	.word LINK 
                                   5771 	LINK=.
                                   5772 name:
                                   5773 	.byte len 	
                                   5774 	.ascii "name"
                                   5775 	.word cmd 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   5776 	.endm 
                                   5777 
                           000000  5778 	LINK=0
      0020F3                       5779 kword_end:
      0020F3                       5780 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009E55 74 65                    1 	.word LINK 
                           0020F5     2 	LINK=.
      0020F5                          3 XOR:
      009E57 73                       4 	.byte 3+F_IFUNC 	
      009E58 20 66 72                 5 	.ascii "XOR"
      009E5B 65 65                    6 	.word bit_xor 
      0020FB                       5781 	_dict_entry,5,WRITE,write  
      009E5D 0A 00                    1 	.word LINK 
                           0020FD     2 	LINK=.
      009E5F                          3 WRITE:
      009E5F 52                       4 	.byte 5 	
      009E60 02 72 5F 00 11           5 	.ascii "WRITE"
      009E65 CD 93                    6 	.word write 
      002105                       5782 	_dict_entry,5,WORDS,words 
      009E67 52 A1                    1 	.word LINK 
                           002107     2 	LINK=.
      002107                          3 WORDS:
      009E69 04                       4 	.byte 5 	
      009E6A 27 03 CC 87 AF           5 	.ascii "WORDS"
      009E6F 1F 01                    6 	.word words 
      00210F                       5783 	_dict_entry 4,WAIT,wait 
      009E71 CD 88                    1 	.word LINK 
                           002111     2 	LINK=.
      002111                          3 WAIT:
      009E73 8F                       4 	.byte 4 	
      009E74 A1 0D 27 02              5 	.ascii "WAIT"
      009E78 20 19                    6 	.word wait 
      002118                       5784 	_dict_entry,3+F_IFUNC,USR,usr
      009E7A CD 93                    1 	.word LINK 
                           00211A     2 	LINK=.
      00211A                          3 USR:
      009E7C 52                       4 	.byte 3+F_IFUNC 	
      009E7D A1 04 27                 5 	.ascii "USR"
      009E80 03 CC                    6 	.word usr 
      002120                       5785 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009E82 87 AF                    1 	.word LINK 
                           002122     2 	LINK=.
      002122                          3 UFLASH:
      009E84 9F                       4 	.byte 6+F_IFUNC 	
      009E85 1E 01 CF 00 12 5F        5 	.ascii "UFLASH"
      009E8B CD 81                    6 	.word uflash 
      00212B                       5786 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009E8D 6E 1E                    1 	.word LINK 
                           00212D     2 	LINK=.
      00212D                          3 UBOUND:
      009E8F 01                       4 	.byte 6+F_IFUNC 	
      009E90 5C 20 DC 55 4E 44        5 	.ascii "UBOUND"
      009E93 13 91                    6 	.word ubound 
      002136                       5787 	_dict_entry,2,TO,to
      009E93 5B 02                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



                           002138     2 	LINK=.
      002138                          3 TO:
      009E95 81                       4 	.byte 2 	
      009E96 54 4F                    5 	.ascii "TO"
      009E96 CD 92                    6 	.word to 
      00213D                       5788 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      009E98 72 A1                    1 	.word LINK 
                           00213F     2 	LINK=.
      00213F                          3 TICKS:
      009E9A 01                       4 	.byte 5+F_IFUNC 	
      009E9B 27 03 CC 87 AF           5 	.ascii "TICKS"
      009EA0 CD 90                    6 	.word get_ticks 
      002147                       5789 	_dict_entry,4,STOP,stop 
      009EA2 2E 9F                    1 	.word LINK 
                           002149     2 	LINK=.
      002149                          3 STOP:
      009EA4 A4                       4 	.byte 4 	
      009EA5 7F 97 A6 03              5 	.ascii "STOP"
      009EA9 81 9D                    6 	.word stop 
      009EAA                       5790 	_dict_entry,4,STEP,step 
      009EAA CD 92                    1 	.word LINK 
                           002152     2 	LINK=.
      002152                          3 STEP:
      009EAC 72                       4 	.byte 4 	
      009EAD CD 88 8F A1              5 	.ascii "STEP"
      009EB1 0A 27                    6 	.word step 
      002159                       5791 	_dict_entry,5,SLEEP,sleep 
      009EB3 07 A1                    1 	.word LINK 
                           00215B     2 	LINK=.
      00215B                          3 SLEEP:
      009EB5 03                       4 	.byte 5 	
      009EB6 27 06 CC 87 AF           5 	.ascii "SLEEP"
      009EBB 1E B7                    6 	.word sleep 
      002163                       5792 	_dict_entry,4+F_IFUNC,SIZE,size
      009EBB F6 20                    1 	.word LINK 
                           002165     2 	LINK=.
      002165                          3 SIZE:
      009EBD 01                       4 	.byte 4+F_IFUNC 	
      009EBE 53 49 5A 45              5 	.ascii "SIZE"
      009EBE 9F 97                    6 	.word size 
      00216C                       5793     _dict_entry,4,SHOW,show 
      009EC0 4F 95                    1 	.word LINK 
                           00216E     2 	LINK=.
      00216E                          3 SHOW:
      009EC2 A6                       4 	.byte 4 	
      009EC3 04 81 4F 57              5 	.ascii "SHOW"
      009EC5 13 6D                    6 	.word show 
      002175                       5794 	_dict_entry,4,SAVE,save
      009EC5 CD 82                    1 	.word LINK 
                           002177     2 	LINK=.
      002177                          3 SAVE:
      009EC7 4A                       4 	.byte 4 	
      009EC8 5F 97 A6 04              5 	.ascii "SAVE"
      009ECC 81 D2                    6 	.word save 
      009ECD                       5795 	_dict_entry 3,RUN,run
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009ECD 5F 72                    1 	.word LINK 
                           002180     2 	LINK=.
      002180                          3 RUN:
      009ECF 0B                       4 	.byte 3 	
      009ED0 52 30 01                 5 	.ascii "RUN"
      009ED3 5C A6                    6 	.word run 
      002186                       5796 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      009ED5 04 81                    1 	.word LINK 
                           002188     2 	LINK=.
      009ED7                          3 RSHIFT:
      009ED7 CD                       4 	.byte 6+F_IFUNC 	
      009ED8 92 72 A1 02 27 03        5 	.ascii "RSHIFT"
      009EDE CC 87                    6 	.word rshift 
      002191                       5797 	_dict_entry,3+F_IFUNC,RND,random 
      009EE0 AF 88                    1 	.word LINK 
                           002193     2 	LINK=.
      009EE1                          3 RND:
      009EE1 AE                       4 	.byte 3+F_IFUNC 	
      009EE2 00 02 72                 5 	.ascii "RND"
      009EE5 DE 00                    6 	.word random 
      002199                       5798 	_dict_entry,6,RETURN,return 
      009EE7 17 2B                    1 	.word LINK 
                           00219B     2 	LINK=.
      00219B                          3 RETURN:
      009EE9 1B                       4 	.byte 6 	
      009EEA A3 00 09 2A 16 A6        5 	.ascii "RETURN"
      009EF0 05 42                    6 	.word return 
      0021A4                       5799 	_dict_entry 6,REMARK,rem 
      009EF2 1C 50                    1 	.word LINK 
                           0021A6     2 	LINK=.
      0021A6                          3 REMARK:
      009EF4 00                       4 	.byte 6 	
      009EF5 89 CD 90 2E 72 FB        5 	.ascii "REMARK"
      009EFB 01 1F                    6 	.word rem 
      0021AF                       5800 	_dict_entry,6,REBOOT,cold_start 
      009EFD 01 CD                    1 	.word LINK 
                           0021B1     2 	LINK=.
      0021B1                          3 REBOOT:
      009EFF 90                       4 	.byte 6 	
      009F00 55 85 A6 04 81 54        5 	.ascii "REBOOT"
      009F05 05 6F                    6 	.word cold_start 
      0021BA                       5801 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      009F05 A6 0A                    1 	.word LINK 
                           0021BC     2 	LINK=.
      0021BC                          3 QKEY:
      009F07 CC                       4 	.byte 4+F_IFUNC 	
      009F08 87 B1 45 59              5 	.ascii "QKEY"
      009F0A 1E 4D                    6 	.word qkey 
      0021C3                       5802 	_dict_entry,6,PWRADC,power_adc 
      009F0A AE A4                    1 	.word LINK 
                           0021C5     2 	LINK=.
      0021C5                          3 PWRADC:
      009F0C 00                       4 	.byte 6 	
      009F0D A6 04 81 41 44 43        5 	.ascii "PWRADC"
      009F10 19 D4                    6 	.word power_adc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      0021CE                       5803 	_dict_entry 5,PRINT,print 
      009F10 90 89                    1 	.word LINK 
                           0021D0     2 	LINK=.
      0021D0                          3 PRINT:
      009F12 CD                       4 	.byte 5 	
      009F13 92 72 A1 01 2A           5 	.ascii "PRINT"
      009F18 03 CC                    6 	.word print 
      0021D8                       5804 	_dict_entry,4+F_CONST,POUT,OUTP 
      009F1A 87 AF                    1 	.word LINK 
                           0021DA     2 	LINK=.
      009F1C                          3 POUT:
      009F1C CD                       4 	.byte 4+F_CONST 	
      009F1D 90 2E A1 02              5 	.ascii "POUT"
      009F21 2B 05                    6 	.word OUTP 
      0021E1                       5805 	_dict_entry,4,POKE,poke 
      009F23 90 93                    1 	.word LINK 
                           0021E3     2 	LINK=.
      0021E3                          3 POKE:
      009F25 CD                       4 	.byte 4 	
      009F26 90 2E 51 90              5 	.ascii "POKE"
      009F2A FD 90                    6 	.word poke 
      0021EA                       5806 	_dict_entry,4+F_CONST,PINP,INP 
      009F2C 85 81                    1 	.word LINK 
                           0021EC     2 	LINK=.
      009F2E                          3 PINP:
      009F2E 72                       4 	.byte 4+F_CONST 	
      009F2F 0D 52 30 FB              5 	.ascii "PINP"
      009F33 8E CC                    6 	.word INP 
      0021F3                       5807 	_dict_entry,4+F_IFUNC,PEEK,peek 
      009F35 85 EF                    1 	.word LINK 
                           0021F5     2 	LINK=.
      009F37                          3 PEEK:
      009F37 72                       4 	.byte 4+F_IFUNC 	
      009F38 0D 52 30 FB              5 	.ascii "PEEK"
      009F3C 72 16                    6 	.word peek 
      0021FC                       5808 	_dict_entry,5,PMODE,pin_mode 
      009F3E 00 20                    1 	.word LINK 
                           0021FE     2 	LINK=.
      0021FE                          3 PMODE:
      009F40 8E                       4 	.byte 5 	
      009F41 81 4D 4F 44 45           5 	.ascii "PMODE"
      009F42 1F DA                    6 	.word pin_mode 
      002206                       5809 	_dict_entry,5,PAUSE,pause 
      009F42 CD 93                    1 	.word LINK 
                           002208     2 	LINK=.
      002208                          3 PAUSE:
      009F44 52                       4 	.byte 5 	
      009F45 A1 04 27 03 CC           5 	.ascii "PAUSE"
      009F4A 87 AF                    6 	.word pause 
      009F4C                       5810 	_dict_entry,2+F_IFUNC,OR,bit_or
      009F4C 5D 27                    1 	.word LINK 
                           002212     2 	LINK=.
      002212                          3 OR:
      009F4E 04                       4 	.byte 2+F_IFUNC 	
      009F4F 8F 5A                    5 	.ascii "OR"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009F51 26 F9                    6 	.word bit_or 
      002217                       5811 	_dict_entry,3+F_CONST,ODR,GPIO_ODR
      009F53 4F 81                    1 	.word LINK 
                           002219     2 	LINK=.
      009F55                          3 ODR:
      009F55 CD                       4 	.byte 3+F_CONST 	
      009F56 93 52 A1                 5 	.ascii "ODR"
      009F59 04 27                    6 	.word GPIO_ODR 
      00221F                       5812 	_dict_entry,3,NEW,new
      009F5B 03 CC                    1 	.word LINK 
                           002221     2 	LINK=.
      002221                          3 NEW:
      009F5D 87                       4 	.byte 3 	
      009F5E AF 45 57                 5 	.ascii "NEW"
      009F5F 1B 10                    6 	.word new 
      002227                       5813 	_dict_entry,4,NEXT,next 
      009F5F A3 14                    1 	.word LINK 
                           002229     2 	LINK=.
      002229                          3 NEXT:
      009F61 00                       4 	.byte 4 	
      009F62 2B 0C 35 0F              5 	.ascii "NEXT"
      009F66 50 F2                    6 	.word next 
      002230                       5814 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      009F68 A6 1E                    1 	.word LINK 
                           002232     2 	LINK=.
      002232                          3 LSHIFT:
      009F6A 62                       4 	.byte 6+F_IFUNC 	
      009F6B A6 10 62 20 1E 54        5 	.ascii "LSHIFT"
      009F70 1F 94                    6 	.word lshift 
      00223B                       5815 	_dict_entry,4,LOAD,load 
      009F70 A3 08                    1 	.word LINK 
                           00223D     2 	LINK=.
      00223D                          3 LOAD:
      009F72 00                       4 	.byte 4 	
      009F73 2B 09 35 0E              5 	.ascii "LOAD"
      009F77 50 F2                    6 	.word load 
      002244                       5816 	_dict_entry 4,LIST,list
      009F79 A6 50                    1 	.word LINK 
                           002246     2 	LINK=.
      002246                          3 LIST:
      009F7B 62                       4 	.byte 4 	
      009F7C 20 10 53 54              5 	.ascii "LIST"
      009F7E 13 DB                    6 	.word list 
      00224D                       5817 	_dict_entry 3,LET,let 
      009F7E 35 07                    1 	.word LINK 
                           00224F     2 	LINK=.
      00224F                          3 LET:
      009F80 50                       4 	.byte 3 	
      009F81 F2 45 54                 5 	.ascii "LET"
      009F82 13 B3                    6 	.word let 
      002255                       5818 	_dict_entry,3+F_IFUNC,KEY,key 
      009F82 A3 00                    1 	.word LINK 
                           002257     2 	LINK=.
      002257                          3 KEY:
      009F84 40                       4 	.byte 3+F_IFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009F85 23 07 72                 5 	.ascii "KEY"
      009F88 5C 50                    6 	.word key 
      00225D                       5819 	_dict_entry,5,INPUT,input_var  
      009F8A F2 54                    1 	.word LINK 
                           00225F     2 	LINK=.
      00225F                          3 INPUT:
      009F8C 20                       4 	.byte 5 	
      009F8D F4 4E 50 55 54           5 	.ascii "INPUT"
      009F8E 16 B0                    6 	.word input_var 
      002267                       5820 	_dict_entry,2,IF,if 
      009F8E 9F 4A                    1 	.word LINK 
                           002269     2 	LINK=.
      002269                          3 IF:
      009F90 27                       4 	.byte 2 	
      009F91 01 4A                    5 	.ascii "IF"
      009F93 17 E3                    6 	.word if 
      00226E                       5821 	_dict_entry,3+F_CONST,IDR,GPIO_IDR
      009F93 A4 3E                    1 	.word LINK 
                           002270     2 	LINK=.
      002270                          3 IDR:
      009F95 C7                       4 	.byte 3+F_CONST 	
      009F96 50 F1 72                 5 	.ascii "IDR"
      009F99 18 50                    6 	.word GPIO_IDR 
      002276                       5822 	_dict_entry,3,HEX,hex_base
      009F9B F0 8E                    1 	.word LINK 
                           002278     2 	LINK=.
      002278                          3 HEX:
      009F9D 81                       4 	.byte 3 	
      009F9E 48 45 58                 5 	.ascii "HEX"
      009F9E CE 00                    6 	.word hex_base 
      00227E                       5823 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      009FA0 0B A6                    1 	.word LINK 
                           002280     2 	LINK=.
      002280                          3 GPIO:
      009FA2 04                       4 	.byte 4+F_IFUNC 	
      009FA3 81 50 49 4F              5 	.ascii "GPIO"
      009FA4 1E 57                    6 	.word gpio 
      002287                       5824 	_dict_entry,4,GOTO,goto 
      009FA4 CD 92                    1 	.word LINK 
                           002289     2 	LINK=.
      002289                          3 GOTO:
      009FA6 72                       4 	.byte 4 	
      009FA7 A1 01 27 03              5 	.ascii "GOTO"
      009FAB CC 87                    6 	.word goto 
      002290                       5825 	_dict_entry,5,GOSUB,gosub 
      009FAD AF 89                    1 	.word LINK 
                           002292     2 	LINK=.
      009FAE                          3 GOSUB:
      009FAE CD                       4 	.byte 5 	
      009FAF 90 2E 9E A5 80           5 	.ascii "GOSUB"
      009FB4 27 01                    6 	.word gosub 
      00229A                       5826 	_dict_entry,6,FORGET,forget 
      009FB6 50 A6                    1 	.word LINK 
                           00229C     2 	LINK=.
      00229C                          3 FORGET:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009FB8 04                       4 	.byte 6 	
      009FB9 81 4F 52 47 45 54        5 	.ascii "FORGET"
      009FBA 1C FE                    6 	.word forget 
      0022A5                       5827 	_dict_entry,3,FOR,for 
      009FBA CD 92                    1 	.word LINK 
                           0022A7     2 	LINK=.
      0022A7                          3 FOR:
      009FBC 72                       4 	.byte 3 	
      009FBD A1 02 27                 5 	.ascii "FOR"
      009FC0 03 CC                    6 	.word for 
      0022AD                       5828 	_dict_entry,4,FCPU,fcpu 
      009FC2 87 AF                    1 	.word LINK 
                           0022AF     2 	LINK=.
      0022AF                          3 FCPU:
      009FC4 CD                       4 	.byte 4 	
      009FC5 90 2E 89 CD              5 	.ascii "FCPU"
      009FC9 90 2E                    6 	.word fcpu 
      0022B6                       5829 	_dict_entry,6+F_CONST,EEPROM,EEPROM_BASE  
      009FCB 9E 14                    1 	.word LINK 
                           0022B8     2 	LINK=.
      0022B8                          3 EEPROM:
      009FCD 01                       4 	.byte 6+F_CONST 	
      009FCE 95 9F 14 02 97 5B        5 	.ascii "EEPROM"
      009FD4 02 A6                    6 	.word EEPROM_BASE 
      0022C1                       5830 	_dict_entry,6+F_CMD,DWRITE,digital_write
      009FD6 04 81                    1 	.word LINK 
                           0022C3     2 	LINK=.
      009FD8                          3 DWRITE:
      009FD8 CD                       4 	.byte 6+F_CMD 	
      009FD9 92 72 A1 02 27 03        5 	.ascii "DWRITE"
      009FDF CC 87                    6 	.word digital_write 
      0022CC                       5831 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      009FE1 AF C3                    1 	.word LINK 
                           0022CE     2 	LINK=.
      009FE2                          3 DREAD:
      009FE2 CD                       4 	.byte 5+F_IFUNC 	
      009FE3 90 2E 89 CD 90           5 	.ascii "DREAD"
      009FE8 2E 9E                    6 	.word digital_read 
      0022D6                       5832 	_dict_entry,3,DIR,directory 
      009FEA 1A 01                    1 	.word LINK 
                           0022D8     2 	LINK=.
      0022D8                          3 DIR:
      009FEC 95                       4 	.byte 3 	
      009FED 9F 1A 02                 5 	.ascii "DIR"
      009FF0 97 5B                    6 	.word directory 
      0022DE                       5833 	_dict_entry,3,DEC,dec_base
      009FF2 02 A6                    1 	.word LINK 
                           0022E0     2 	LINK=.
      0022E0                          3 DEC:
      009FF4 04                       4 	.byte 3 	
      009FF5 81 45 43                 5 	.ascii "DEC"
      009FF6 13 82                    6 	.word dec_base 
      0022E6                       5834 	_dict_entry,3+F_CONST,DDR,GPIO_DDR
      009FF6 CD 92                    1 	.word LINK 
                           0022E8     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      0022E8                          3 DDR:
      009FF8 72                       4 	.byte 3+F_CONST 	
      009FF9 A1 02 27                 5 	.ascii "DDR"
      009FFC 03 CC                    6 	.word GPIO_DDR 
      0022EE                       5835 	_dict_entry,3+F_CONST,CRL,GPIO_CR1
      009FFE 87 AF                    1 	.word LINK 
                           0022F0     2 	LINK=.
      00A000                          3 CRL:
      00A000 CD                       4 	.byte 3+F_CONST 	
      00A001 90 2E 89                 5 	.ascii "CRL"
      00A004 CD 90                    6 	.word GPIO_CR1 
      0022F6                       5836 	_dict_entry,3+F_CONST,CRH,GPIO_CR2
      00A006 2E 9E                    1 	.word LINK 
                           0022F8     2 	LINK=.
      0022F8                          3 CRH:
      00A008 18                       4 	.byte 3+F_CONST 	
      00A009 01 95 9F                 5 	.ascii "CRH"
      00A00C 18 02                    6 	.word GPIO_CR2 
      0022FE                       5837 	_dict_entry,4+F_CFUNC,CHAR,char
      00A00E 97 5B                    1 	.word LINK 
                           002300     2 	LINK=.
      002300                          3 CHAR:
      00A010 02                       4 	.byte 4+F_CFUNC 	
      00A011 A6 04 81 52              5 	.ascii "CHAR"
      00A014 1E 16                    6 	.word char 
      002307                       5838 	_dict_entry,3,BYE,bye 
      00A014 CD 92                    1 	.word LINK 
                           002309     2 	LINK=.
      002309                          3 BYE:
      00A016 72                       4 	.byte 3 	
      00A017 A1 02 27                 5 	.ascii "BYE"
      00A01A 03 CC                    6 	.word bye 
      00230F                       5839 	_dict_entry,5,BTOGL,bit_toggle
      00A01C 87 AF                    1 	.word LINK 
                           002311     2 	LINK=.
      002311                          3 BTOGL:
      00A01E CD                       4 	.byte 5 	
      00A01F 90 2E 51 CD 90           5 	.ascii "BTOGL"
      00A024 2E 90                    6 	.word bit_toggle 
      002319                       5840 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A026 5D 27                    1 	.word LINK 
                           00231B     2 	LINK=.
      00231B                          3 BTEST:
      00A028 05                       4 	.byte 5+F_IFUNC 	
      00A029 58 90 5A 26 FB           5 	.ascii "BTEST"
      00A02E 17 92                    6 	.word bit_test 
      002323                       5841 	_dict_entry,4,BSET,bit_set 
      00A02E A6 04                    1 	.word LINK 
                           002325     2 	LINK=.
      002325                          3 BSET:
      00A030 81                       4 	.byte 4 	
      00A031 42 53 45 54              5 	.ascii "BSET"
      00A031 CD 92                    6 	.word bit_set 
      00232C                       5842 	_dict_entry,4,BRES,bit_reset
      00A033 72 A1                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



                           00232E     2 	LINK=.
      00232E                          3 BRES:
      00A035 02                       4 	.byte 4 	
      00A036 27 03 CC 87              5 	.ascii "BRES"
      00A03A AF CD                    6 	.word bit_reset 
      002335                       5843 	_dict_entry,5,BREAK,break 
      00A03C 90 2E                    1 	.word LINK 
                           002337     2 	LINK=.
      002337                          3 BREAK:
      00A03E 51                       4 	.byte 5 	
      00A03F CD 90 2E 90 5D           5 	.ascii "BREAK"
      00A044 27 05                    6 	.word break 
      00233F                       5844 	_dict_entry,4,BEEP,beep 
      00A046 54 90                    1 	.word LINK 
                           002341     2 	LINK=.
      002341                          3 BEEP:
      00A048 5A                       4 	.byte 4 	
      00A049 26 FB 45 50              5 	.ascii "BEEP"
      00A04B 19 AC                    6 	.word beep 
      002348                       5845 	_dict_entry,3,AWU,awu 
      00A04B A6 04                    1 	.word LINK 
                           00234A     2 	LINK=.
      00234A                          3 AWU:
      00A04D 81                       4 	.byte 3 	
      00A04E 41 57 55                 5 	.ascii "AWU"
      00A04E A6 04                    6 	.word awu 
      002350                       5846 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A050 CD 92                    1 	.word LINK 
                           002352     2 	LINK=.
      002352                          3 ASC:
      00A052 41                       4 	.byte 3+F_IFUNC 	
      00A053 9F A4 07                 5 	.ascii "ASC"
      00A056 C7 50                    6 	.word ascii 
      002358                       5847 	_dict_entry,6+F_IFUNC,ANREAD,analog_read
      00A058 C6 81                    1 	.word LINK 
                           00235A     2 	LINK=.
      00A05A                          3 ANREAD:
      00A05A 52                       4 	.byte 6+F_IFUNC 	
      00A05B 01 CD 92 4E A1 02        5 	.ascii "ANREAD"
      00A061 27 03                    6 	.word analog_read 
      002363                       5848 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A063 CC 87                    1 	.word LINK 
                           002365     2 	LINK=.
      002365                          3 AND:
      00A065 AF                       4 	.byte 3+F_IFUNC 	
      00A066 CD 90 2E                 5 	.ascii "AND"
      00A069 51 CD                    6 	.word bit_and 
      00236B                       5849 kword_dict:
      00236B                       5850 	_dict_entry,3+F_IFUNC,ABS,abs
      00A06B 90 2E                    1 	.word LINK 
                           00236D     2 	LINK=.
      00236D                          3 ABS:
      00A06D CD                       4 	.byte 3+F_IFUNC 	
      00A06E A0 9F 6B                 5 	.ascii "ABS"
      00A071 01 A6                    6 	.word abs 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                                   5851 	
                                   5852 
      002380                       5853 	.bndry 128 ; align on FLASH block.
                                   5854 ; free space for user application  
      002380                       5855 user_space:
                                   5856 ; USR() function test
      00A073 01               [ 2] 5857 	pushw x 
      00A074 0D 01 27 0B      [ 1] 5858 	bset PC_ODR,#5 
      00A078 48               [ 2] 5859 	popw x 
      00A079 0A 01 26         [ 4] 5860 	call pause02 
      00A07C FB 6B 01 EA      [ 1] 5861 	bres PC_ODR,#5 
      00A080 03               [ 4] 5862 	ret
                                   5863 
                                   5864 	.area FLASH_DRIVE (ABS)
      010000                       5865 	.org 0x10000
      010000                       5866 fdrive:
                                   5867 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        00236D R   |     ADC_CR1 =  005401 
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
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |   5 AND        002365 R
  5 ANREAD     00235A R   |     ARG_CNT =  000001     |     ARG_OFS =  000002 
  5 ASC        002352 R   |     ATTRIB  =  000002     |   5 AWU        00234A R
  5 AWUHandl   00000A R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_CSR_=  000004     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |     BASE    =  000002 
    BASE_SAV=  000001     |   5 BEEP       002341 R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_ER=  000000     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  000005 
  5 BREAK      002337 R   |   5 BRES       00232E R   |   5 BSET       002325 R
    BSIZE   =  000001     |     BSP     =  000008     |   5 BTEST      00231B R
  5 BTOGL      002311 R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        002309 R   |     C       =  000001     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000000     |   5 CHAR       002300 R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
    CLK_ECKR=  000001     |     CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0 
    CLK_ICKR=  000002     |     CLK_ICKR=  000000     |     CLK_ICKR=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]

Symbol Table

    CLK_ICKR=  000003     |     CLK_ICKR=  000004     |     CLK_ICKR=  000005 
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
  5 CRH        0022F8 R   |   5 CRL        0022F0 R   |     CTRL_A  =  000001 
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
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        0022E8 R
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        0022E0 R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        0022D8 R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DREAD      0022CE R   |     DSTACK_S=  000040     |   5 DWRITE     0022C3 R
  5 EEPROM     0022B8 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |     EOF     =  0000FF     |     ERR_BAD_=  00000A 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_L=  000005 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |   5 FCPU       0022AF R   |     FF      =  00000C 
    FFOR    =  000002     |     FHSE    =  7A1200     |     FHSI    =  F42400 
    FIRST   =  000001     |     FLASH_BA=  008000     |     FLASH_CR=  00505A 
    FLASH_CR=  000002     |     FLASH_CR=  000000     |     FLASH_CR=  000003 
    FLASH_CR=  000001     |     FLASH_CR=  00505B     |     FLASH_CR=  000005 
    FLASH_CR=  000004     |     FLASH_CR=  000007     |     FLASH_CR=  000000 
    FLASH_CR=  000006     |     FLASH_DU=  005064     |     FLASH_DU=  0000AE 
    FLASH_DU=  000056     |     FLASH_EN=  027FFF     |     FLASH_FP=  00505D 
    FLASH_FP=  000000     |     FLASH_FP=  000001     |     FLASH_FP=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_FP=  000003     |     FLASH_FP=  000004     |     FLASH_FP=  000005 
    FLASH_IA=  00505F     |     FLASH_IA=  000003     |     FLASH_IA=  000002 
    FLASH_IA=  000006     |     FLASH_IA=  000001     |     FLASH_IA=  000000 
    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   5 FOR        0022A7 R
  5 FORGET     00229C R   |     FRUN    =  000000     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FTRAP   =  000001     |     F_CFUNC =  000080 
    F_CMD   =  000000     |     F_CONST =  0000C0     |     F_IFUNC =  000040 
  5 GOSUB      002292 R   |     GOS_RET =  000003     |   5 GOTO       002289 R
  5 GPIO       002280 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   5 HEX        002278 R
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
    I2C_WRIT=  000000     |   5 IDR        002270 R   |   5 IF         002269 R
    IN      =  000007     |     INCR    =  000001     |     INP     =  000000 
  5 INPUT      00225F R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008034     |     INT_VECT=  008040     |     INT_VECT=  00803C 
    INT_VECT=  008048     |     INT_VECT=  008044     |     INT_VECT=  008064 
    INT_VECT=  008008     |     INT_VECT=  008004     |     INT_VECT=  008050 
    INT_VECT=  00804C     |     INT_VECT=  00805C     |     INT_VECT=  008058 
    INW     =  000003     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        002257 R   |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000005     |   5 LET        00224F R   |     LINENO  =  000005 
  5 LINK    =  00236D R   |   5 LIST       002246 R   |     LL      =  000002 
    LLEN    =  000002     |     LL_HB   =  000001     |     LNO     =  000005 
    LN_PTR  =  000005     |   5 LOAD       00223D R   |   5 LSHIFT     002232 R
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MINOR   =  000000     |     MULOP   =  000005     |     N1      =  000001 
    N1_HB   =  000006     |     N1_LB   =  000007     |     N2      =  000003 
    N2_HB   =  000008     |     N2_LB   =  000009     |     NAFR    =  004804 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        002221 R   |   5 NEXT       002229 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NL      =  00000A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R
  5 ODR        002219 R   |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         002212 R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
    PAD_SIZE=  000028     |   5 PAUSE      002208 R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       0021F5 R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       0021EC R   |     PINVAL  =  000002     |     PI_BASE =  005028 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]

Symbol Table

    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      0021FE R
  5 POKE       0021E3 R   |   5 POUT       0021DA R   |     PREV    =  000001 
  5 PRINT      0021D0 R   |     PROD    =  000002     |     PSIZE   =  000001 
  5 PWRADC     0021C5 R   |   5 QKEY       0021BC R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 REBOOT     0021B1 R
  5 REG_A      000952 R   |   5 REG_CC     000956 R   |   5 REG_EPC    000945 R
  5 REG_SP     00095B R   |   5 REG_X      00094E R   |   5 REG_Y      00094A R
    RELOP   =  000005     |   5 REMARK     0021A6 R   |     RETL1   =  000001 
  5 RETURN     00219B R   |   5 RND        002193 R   |     ROP     =  004800 
  5 RSHIFT     002188 R   |     RST_SR  =  0050B3     |   5 RUN        002180 R
    RXCHAR  =  000001     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   5 SAVE       002177 R
    SDIVD   =  000002     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       00216E R   |     SIGN    =  000001 
  5 SIZE       002165 R   |     SKIP    =  000006     |   5 SLEEP      00215B R
    SPACE   =  000020     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  000080     |   5 STATES     000908 R   |   5 STEP       002152 R
  5 STOP       002149 R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      00213F R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]

Symbol Table

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
    TK_VAR  =  000005     |   5 TO         002138 R   |   5 Timer4Up   000027 R
  5 TrapHand   000018 R   |     U8      =  000003     |     UART1   =  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]

Symbol Table

    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
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
    UBC     =  004801     |   5 UBOUND     00212D R   |   5 UFLASH     002122 R
  5 USER_ABO   00008C R   |   5 USR        00211A R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 UserButt   000033 R
    VSIZ    =  000002     |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       002111 R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      002107 R   |   5 WRITE      0020FD R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XADR    =  000001     |     XMASK   =  000001 
  5 XOR        0020F5 R   |     XSAVE   =  000003     |     YSAVE   =  000003 
  5 abs        001F24 R   |   1 acc16      000008 R   |   1 acc24      000007 R
  1 acc8       000009 R   |   5 accept_c   000AFC R   |   5 add        00108F R
  5 analog_r   001A1D R   |   5 ansi_seq   000ABE R   |   5 arduino_   00202F R
  5 arg_list   0011CE R   |   1 array_si   00001D R   |   5 ascii      001E2A R
  5 at_tst     000DC9 R   |   5 atoi24     000EDC R   |   5 atoi_exi   000F4A R
  5 awu        001ED5 R   |   5 awu02      001EDF R   |   5 bad_port   001E85 R
  1 base       000006 R   |   1 basicptr   000004 R   |   5 beep       0019AC R
  5 bin_exit   000CCD R   |   5 bit_and    001F3A R   |   5 bit_or     001F58 R
  5 bit_rese   001769 R   |   5 bit_set    001755 R   |   5 bit_test   001792 R
  5 bit_togg   00177E R   |   5 bit_xor    001F76 R   |   5 bkslsh_t   000D74 R
  5 bksp       0001DD R   |   5 break      001AC4 R   |   5 break_po   001AF2 R
  5 bye        001EAE R   |   5 char       001E16 R   |   5 check_fu   000400 R
  5 clear_ba   000601 R   |   5 clear_va   00050A R   |   5 clock_in   0000A7 R
  5 cmd_itf    000B20 R   |   5 cmd_name   00113A R   |   5 cmp_name   001B66 R
  5 cold_sta   00056F R   |   5 colon_ts   000D9D R   |   5 comma_ts   000DA8 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]

Symbol Table

  5 compile    00040F R   |   5 convert_   000C55 R   |   1 count      000003 R
  5 cp_loop    00117D R   |   5 create_g   00035F R   |   5 cstk_pro   001059 R
  5 dash_tst   000DBE R   |   5 ddrop      000FD5 R   |   5 ddrop_n    001012 R
  5 ddup       000FDE R   |   5 dec_base   001382 R   |   5 del_back   000AED R
  5 del_line   000327 R   |   5 del_ln     000ADE R   |   5 delete     0001ED R
  5 digital_   001A53 R   |   5 digital_   001A85 R   |   5 dir_loop   001D55 R
  5 director   001D49 R   |   5 divide     0010E5 R   |   5 divu24_8   000A4B R
  5 dotr       001062 R   |   5 dotr_loo   001077 R   |   5 dots       00102F R
  5 dpick      000FEF R   |   5 dpop       000FAE R   |   5 dpush      000FA1 R
  5 drive_fr   001DD2 R   |   3 dstack     001740 R   |   3 dstack_u   001780 R
  5 dstk_pro   001025 R   |   1 dstkptr    000016 R   |   5 dswap      000FBB R
  5 eql_tst    000E29 R   |   5 equal      001612 R   |   5 err_bad_   0006DE R
  5 err_cmd_   00069F R   |   5 err_div0   000661 R   |   5 err_dupl   0006BA R
  5 err_math   000647 R   |   5 err_mem_   00062A R   |   5 err_msg    000612 R
  5 err_no_a   0006EB R   |   5 err_no_l   000671 R   |   5 err_not_   0006CC R
  5 err_run_   000688 R   |   5 err_synt   000638 R   |   5 escaped    000C6A R
  5 expect     0011C1 R   |   5 expr_exi   001313 R   |   5 expressi   0012D2 R
  5 factor     001229 R   |   1 farptr     000010 R   |   5 fcpu       001FCE R
  7 fdrive     010000 R   |   5 fetch      000FFE R   |   5 fetchc     000C0D R
  1 ffree      000013 R   |   5 file_cou   001DCA R   |   5 final_te   000AB8 R
  5 first_li   001406 R   |   1 flags      00001F R   |   5 for        0017F7 R
  5 forget     001CFE R   |   1 free_ram   000055 R   |   5 func_arg   0011F2 R
  5 ge         001614 R   |   5 get_arra   001202 R   |   5 get_tick   001F1E R
  5 get_toke   000D0F R   |   5 getc       0001CA R   |   5 go_commo   001918 R
  5 gosub      0018F5 R   |   5 goto       0018E8 R   |   5 gpio       001E57 R
  5 gt         001610 R   |   5 gt_tst     000E34 R   |   5 hex_base   00137D R
  5 if         0017E3 R   |   1 in         000001 R   |   1 in.saved   000002 R
  1 in.w       000000 R   |   5 incr_far   001B1B R   |   5 input_ex   001721 R
  5 input_lo   0016BC R   |   5 input_va   0016B0 R   |   5 insert_l   000398 R
  5 insert_l   0003FD R   |   5 interp     00079F R   |   5 interp_l   0007DF R
  5 invalid    000B65 R   |   5 invalid_   000BE3 R   |   5 is_alpha   000518 R
  5 is_digit   000EC7 R   |   5 itoa       000A04 R   |   5 itoa_loo   000A1C R
  5 key        001E45 R   |   5 kword_di   00236B R   |   5 kword_en   0020F3 R
  5 last_lin   00140F R   |   5 le         001619 R   |   5 ledoff     000858 R
  5 ledon      000853 R   |   5 ledtoggl   00085D R   |   5 left_arr   000ABE R
  5 left_par   000866 R   |   5 let        0013B3 R   |   5 let02      0013BD R
  5 lines_sk   001414 R   |   5 list       0013DB R   |   5 list_exi   00145B R
  5 list_sta   001437 R   |   5 load       001C96 R   |   5 loop_bac   0018C1 R
  1 loop_dep   00001C R   |   5 loop_don   0018D6 R   |   5 lshift     001F94 R
  5 lt         001617 R   |   5 lt_tst     000E6D R   |   5 mem_peek   000B82 R
  5 modulo     001129 R   |   5 move       0002C1 R   |   5 move_dow   0002DF R
  5 move_exi   000300 R   |   5 move_loo   0002E4 R   |   5 move_up    0002D1 R
  5 mul_char   001601 R   |   5 multiply   00109D R   |   5 mulu24_8   000F4E R
  5 nbr_tst    000D4A R   |   5 ne         00161C R   |   5 neg_acc2   000A73 R
  5 new        001B10 R   |   5 next       001879 R   |   5 next_tok   00080F R
  5 no_match   00118F R   |   5 none       000D0F R   |   5 number     000C13 GR
  5 other      000EA5 R   |   3 pad        001718 R   |   5 parse_bi   000CAD R
  5 parse_in   000C72 R   |   5 parse_ke   000CD5 R   |   5 parse_qu   000C1A R
  5 pause      001EC2 R   |   5 pause02    001ECC R   |   5 peek       0017D0 R
  5 peek_byt   000BAD R   |   5 pin_mode   001FDA R   |   5 plus_tst   000DFD R
  5 poke       0017BD R   |   5 power_ad   0019D4 R   |   5 prcnt_ts   000E1E R
  5 print      00161F R   |   5 print_ex   001684 R   |   5 print_fa   000BF2 R
  5 print_in   0009A8 R   |   5 print_re   0008B5 R   |   5 print_st   000B75 R
  5 prt_basi   0014AE R   |   5 prt_cmd_   00145E R   |   5 prt_loop   001623 R
  5 prt_peek   000271 R   |   5 prt_quot   001472 R   |   5 prt_reg1   000896 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]

Symbol Table

  5 prt_reg8   000871 R   |   5 prt_regs   000207 R   |   5 prti24     000960 R
  1 ptr16      000011 R   |   1 ptr8       000012 R   |   5 putc       0001C1 R
  5 puts       0001D3 R   |   5 qkey       001E4D R   |   5 qmark_ts   000DD4 R
  5 random     00204F R   |   5 readln     000A96 R   |   5 readln_l   000A9C R
  5 readln_q   000B11 R   |   5 regs_sta   00024A R   |   5 rel_exit   00136A R
  5 relation   001316 R   |   5 relop_st   001604 R   |   5 rem        001724 R
  5 repl       000B2E R   |   5 repl_exi   000B56 R   |   5 reprint    000ABE R
  5 reset_co   001621 R   |   5 rest_con   0016A0 R   |   5 return     00193A R
  5 right_ar   000ABE R   |   5 rparnt_t   000D92 R   |   5 rshift     001FB1 R
  5 rt_msg     00071F R   |   5 run        00195A R   |   5 save       001BD2 R
  5 save_con   001690 R   |   5 search_d   00116C R   |   5 search_e   0011BD R
  5 search_f   001B87 R   |   5 search_l   000303 R   |   5 search_l   00030B R
  5 search_n   001170 R   |   1 seedx      00000C R   |   1 seedy      00000E R
  5 seek_fdr   001B29 R   |   5 select_p   00201F R   |   5 sharp_ts   000DB3 R
  5 show       00136D R   |   5 single_c   0015FD R   |   5 size       001387 R
  5 skip       000F88 R   |   5 slash_ts   000E13 R   |   5 sleep      001EB7 R
  5 software   000529 R   |   5 spaces     0001FB R   |   3 stack_fu   001780 R
  3 stack_un   001800 R   |   5 star_tst   000E08 R   |   5 step       001851 R
  5 stop       00199D R   |   5 store      001008 R   |   5 store_lo   001863 R
  5 str_matc   00119E R   |   5 str_tst    000D39 R   |   5 strcmp     0002A2 R
  5 strcpy     0002B3 R   |   5 strlen     000295 R   |   5 substrac   001097 R
  5 syntax_e   00072F R   |   1 tab_widt   000020 R   |   5 tb_error   000731 R
  5 term       001285 R   |   5 term01     00128E R   |   5 term_exi   0012CF R
  5 test_p     000B6D R   |   3 tib        0016C8 R   |   5 tick_tst   000DEB R
  1 ticks      00000A R   |   5 timer4_i   0000BD R   |   5 to         001821 R
  5 to_upper   000ED0 GR  |   5 token_ch   000EB4 R   |   5 token_ex   000EC4 R
  1 txtbgn     000018 R   |   1 txtend     00001A R   |   5 uart1_in   000186 R
  5 uart1_se   000196 R   |   5 ubound     001391 R   |   5 uflash     001E8A R
  5 unget_to   000F9B R   |   5 unlock_e   0000D2 R   |   5 unlock_f   0000E0 R
  5 user_spa   002380 R   |   5 usr        001E90 R   |   1 vars       000021 R
  5 wait       00172A R   |   5 warm_sta   000783 R   |   5 words      0020B9 R
  5 write      001DDF R   |   5 write_bl   000163 R   |   5 write_by   0000EE R
  5 write_ee   00012A R   |   5 write_ex   00015E R   |   5 write_fl   000114 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
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

