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
                           004000    57 	AUTORUN_NAME=0x4000 ; address in EEPROM where auto run file name is saved 
                                     58 
      000002                         59 in.w:  .blkb 1 ; parser position in text line
      000003                         60 in:    .blkb 1 ; low byte of in.w
      000004                         61 in.saved: .blkb 1 ; set by get_token before parsing next token, used by unget_token
      000005                         62 count: .blkb 1 ; current BASIC line length and tib text length  
      000007                         63 basicptr:  .blkb 2  ; point to current BASIC line 
      000008                         64 base:  .blkb 1 ; nemeric base used to print integer 
      000009                         65 acc24: .blkb 1 ; 24 bit accumulator
      00000A                         66 acc16: .blkb 1 ; 16 bit accumulator, middle byte of acc24
      00000B                         67 acc8:  .blkb 1 ;  8 bit accumulator, least byte of acc24 
      00000D                         68 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      00000F                         69 timer: .blkw 1 ;  milliseconds count down timer 
      000011                         70 seedx: .blkw 1  ; xorshift 16 seed x  used by RND() function 
      000013                         71 seedy: .blkw 1  ; xorshift 16 seed y  used by RND() funcion
      000014                         72 farptr: .blkb 1 ; 24 bits pointer used by file system
      000015                         73 ptr16:  .blkb 1 ; 16 bits pointer ,  middle byte of farptr
      000016                         74 ptr8:   .blkb 1 ; 8 bits pointer, least byte of farptr 
      000019                         75 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001B                         76 dstkptr: .blkw 1  ; data stack pointer 
      00001D                         77 txtbgn: .ds 2 ; tokenized BASIC text beginning address 
      00001F                         78 txtend: .ds 2 ; tokenized BASIC text end address 
      000020                         79 loop_depth: .ds 1 ; FOR loop depth, level of nested loop. Conformity check   
      000022                         80 array_size: .ds 2 ; array size 
      000023                         81 flags: .ds 1 ; various boolean flags
      000024                         82 tab_width: .ds 1 ; print colon width (4)
      000058                         83 vars: .ds 2*26 ; BASIC variables A-Z, keep it as but last .
                                     84 ; keep as last variable 
      0016C8                         85 free_ram: ; from here RAM free for BASIC text 
                                     86 
                                     87 ;-----------------------------------
                                     88     .area SSEG (ABS)
                                     89 ;-----------------------------------	
      0016C8                         90     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE-DSTACK_SIZE 
      001718                         91 tib: .ds TIB_SIZE             ; transaction input buffer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      001740                         92 pad: .ds PAD_SIZE             ; working buffer
      001780                         93 dstack: .ds DSTACK_SIZE 	  ; data stack used by FOR...NEXT 
      001780                         94 dstack_empty: ; dstack underflow ; data stack bottom 
      001800                         95 stack_full: .ds STACK_SIZE   ; control stack 
      001800                         96 stack_unf: ; stack underflow ; control_stack bottom 
                                     97 
                                     98 
                                     99 ;--------------------------------------
                                    100     .area HOME 
                                    101 ;--------------------------------------
      008000 82 00 85 F9            102     int cold_start
                           000001   103 .if DEBUG
      008004 82 00 80 98            104 	int TrapHandler 		;TRAP  software interrupt
                           000000   105 .else
                                    106 	int NonHandledInterrupt ;TRAP  software interrupt
                                    107 .endif
      008008 82 00 80 89            108 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 8A            109 	int AWUHandler          ;int1 AWU   auto wake up from halt
      008010 82 00 80 89            110 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 89            111 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 89            112 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 89            113 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 89            114 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 BD            115 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 89            116 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 89            117 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 89            118 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 89            119 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 89            120 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 89            121 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 89            122 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 89            123 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 89            124 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 89            125 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 89            126 	int NonHandledInterrupt ;int18 UART1 RX full
      008054 82 00 80 89            127 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 89            128 	int NonHandledInterrupt ;int20 UART1 TX completed
      00805C 82 00 80 89            129 	int NonHandledInterrupt ;int21 UART1 RX full
      008060 82 00 80 89            130 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 A7            131 	int Timer4UpdateHandler	;int23 TIM4 update/overflow used as msec ticks counter
      008068 82 00 80 89            132 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 89            133 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 89            134 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 89            135 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 89            136 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 89            137 	int NonHandledInterrupt ;int29  not used
                                    138 
                                    139 ;---------------------------------------
                                    140     .area CODE
                                    141 ;---------------------------------------
                           000001   142 .if DEBUG
      008080 53 54 4D 38 5F 54 42   143 .asciz "STM8_TBI" ; I like to put module name here.
             49 00
                                    144 .endif 
                                    145 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008089                        146 NonHandledInterrupt:
      008089 71                     147     .byte 0x71  ; reinitialize MCU
                                    148 
      00808A                        149 AWUHandler:
      00808A 72 19 50 F0      [ 1]  150 	bres AWU_CSR,#AWU_CSR_AWUEN
      00808E 55 00 3F 50 F1   [ 1]  151 	mov AWU_APR,0x3F
      008093 72 5F 50 F2      [ 1]  152 	clr AWU_TBR 
      008097 80               [11]  153 	iret
                                    154 
                                    155 ;------------------------------------
                                    156 ; software interrupt handler  
                                    157 ;------------------------------------
                           000001   158 .if DEBUG 
      008098                        159 TrapHandler:
      008098 72 12 00 22      [ 1]  160 	bset flags,#FTRAP 
      00809C CD 89 82         [ 4]  161 	call print_registers
      00809F CD 8B ED         [ 4]  162 	call cmd_itf
      0080A2 72 13 00 22      [ 1]  163 	bres flags,#FTRAP 	
      0080A6 80               [11]  164 	iret
                                    165 .endif 
                                    166 
      0080A7                        167 Timer4UpdateHandler:
      0080A7 72 5F 53 42      [ 1]  168 	clr TIM4_SR 
      0080AB CE 00 0B         [ 2]  169 	ldw x,ticks
      0080AE 5C               [ 2]  170 	incw x
      0080AF CF 00 0B         [ 2]  171 	ldw ticks,x 
      0080B2 CE 00 0D         [ 2]  172 	ldw x,timer
      0080B5 5D               [ 2]  173 	tnzw x 
      0080B6 27 04            [ 1]  174 	jreq 1$
      0080B8 5A               [ 2]  175 	decw x 
      0080B9 CF 00 0D         [ 2]  176 	ldw timer,x 
      0080BC                        177 1$:	
      0080BC 80               [11]  178 	iret 
                                    179 
                                    180 
                                    181 ;------------------------------------
                                    182 ; Triggered by pressing USER UserButton 
                                    183 ; on NUCLEO card.
                                    184 ;------------------------------------
      0080BD                        185 UserButtonHandler:
                                    186 ; wait button release
      0080BD 5F               [ 1]  187 	clrw x
      0080BE 5A               [ 2]  188 1$: decw x 
      0080BF 26 FD            [ 1]  189 	jrne 1$
      0080C1 72 09 50 15 F8   [ 2]  190 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    191 ; if MCU suspended by SLEEP resume program
      0080C6 72 07 00 22 05   [ 2]  192     btjf flags,#FSLEEP,2$
      0080CB 72 17 00 22      [ 1]  193 	bres flags,#FSLEEP 
      0080CF 80               [11]  194 	iret
      0080D0 72 00 00 22 03   [ 2]  195 2$:	btjt flags,#FRUN,4$
      0080D5 CC 81 0E         [ 2]  196 	jp 9$ 
      0080D8                        197 4$:	; program interrupted by user 
      0080D8 72 11 00 22      [ 1]  198 	bres flags,#FRUN 
      0080DC AE 81 16         [ 2]  199 	ldw x,#USER_ABORT
      0080DF CD 82 5D         [ 4]  200 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      0080E2 CE 00 05         [ 2]  201 	ldw x,basicptr
      0080E5 FE               [ 2]  202 	ldw x,(x)
                                    203 ; print line number 
      0080E6 35 0A 00 07      [ 1]  204 	mov base,#10 
      0080EA 35 06 00 23      [ 1]  205 	mov tab_width,#6
      0080EE CD 8A 75         [ 4]  206 	call print_int  	
      0080F1 CE 00 05         [ 2]  207 	ldw x,basicptr 
      0080F4 1C 00 03         [ 2]  208 	addw x,#3  
      0080F7 CD 82 5D         [ 4]  209 	call puts 
      0080FA A6 0D            [ 1]  210 	ld a,#CR 
      0080FC CD 82 4B         [ 4]  211 	call putc
      0080FF 5F               [ 1]  212 	clrw x  
      008100 C6 00 02         [ 1]  213 	ld a,in 
      008103 AB 03            [ 1]  214 	add a,#3 ; adjustment for line number display 
      008105 97               [ 1]  215 	ld xl,a 
      008106 CD 82 85         [ 4]  216 	call spaces 
      008109 A6 5E            [ 1]  217 	ld a,#'^
      00810B CD 82 4B         [ 4]  218 	call putc 
      00810E                        219 9$:
      00810E AE 17 FF         [ 2]  220     ldw x,#STACK_EMPTY 
      008111 94               [ 1]  221     ldw sp,x
      008112 9A               [ 1]  222 	rim 
      008113 CC 88 69         [ 2]  223 	jp warm_start
                                    224 
      008116 0A 50 72 6F 67 72 61   225 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    226 
                                    227 ;----------------------------------------
                                    228 ; inialize MCU clock 
                                    229 ; input:
                                    230 ;   A 		source  HSI | 1 HSE 
                                    231 ;   XL      CLK_CKDIVR , clock divisor 
                                    232 ; output:
                                    233 ;   none 
                                    234 ;----------------------------------------
      008131                        235 clock_init:	
      008131 C1 50 C3         [ 1]  236 	cp a,CLK_CMSR 
      008134 27 0C            [ 1]  237 	jreq 2$ ; no switching required 
                                    238 ; select clock source 
      008136 72 12 50 C5      [ 1]  239 	bset CLK_SWCR,#CLK_SWCR_SWEN
      00813A C7 50 C4         [ 1]  240 	ld CLK_SWR,a
      00813D C1 50 C3         [ 1]  241 1$:	cp a,CLK_CMSR
      008140 26 FB            [ 1]  242 	jrne 1$
      008142                        243 2$: 	
                                    244 ; HSI and cpu clock divisor 
      008142 9F               [ 1]  245 	ld a,xl 
      008143 C7 50 C6         [ 1]  246 	ld CLK_CKDIVR,a  
      008146 81               [ 4]  247 	ret
                                    248 
                                    249 ;---------------------------------
                                    250 ; TIM4 is configured to generate an 
                                    251 ; interrupt every millisecond 
                                    252 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      008147                        253 timer4_init:
      008147 72 18 50 C7      [ 1]  254 	bset CLK_PCKENR1,#CLK_PCKENR1_TIM4
      00814B 35 07 53 45      [ 1]  255 	mov TIM4_PSCR,#7 ; prescale 128  
      00814F 35 7D 53 46      [ 1]  256 	mov TIM4_ARR,#125 ; set for 1msec.
      008153 35 05 53 40      [ 1]  257 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008157 72 10 53 41      [ 1]  258 	bset TIM4_IER,#TIM4_IER_UIE 
      00815B 81               [ 4]  259 	ret
                                    260 
                                    261 
                                    262 ;----------------------------------
                                    263 ; unlock EEPROM for writing/erasing
                                    264 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    265 ; input:
                                    266 ;  none
                                    267 ; output:
                                    268 ;  none 
                                    269 ;----------------------------------
      00815C                        270 unlock_eeprom:
      00815C 35 AE 50 64      [ 1]  271 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008160 35 56 50 64      [ 1]  272     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008164 72 07 50 5F FB   [ 2]  273 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008169 81               [ 4]  274 	ret
                                    275 
                                    276 ;----------------------------------
                                    277 ; unlock FLASH for writing/erasing
                                    278 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    279 ; input:
                                    280 ;  none
                                    281 ; output:
                                    282 ;  none
                                    283 ;----------------------------------
      00816A                        284 unlock_flash:
      00816A 35 56 50 62      [ 1]  285 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      00816E 35 AE 50 62      [ 1]  286 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008172 72 03 50 5F FB   [ 2]  287 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008177 81               [ 4]  288 	ret
                                    289 
                           000000   290 	BLOCK_ERASE=0
                                    291 ;----------------------------
                                    292 ; erase block code must be 
                                    293 ;executed from RAM
                                    294 ;-----------------------------
                           000000   295 .if BLOCK_ERASE 
                                    296 ; this code is copied to RAM 
                                    297 erase_start:
                                    298 	clr a 
                                    299     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    300     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    301 	ldf [farptr],a
                                    302     inc farptr+2 
                                    303     ldf [farptr],a
                                    304     inc farptr+2 
                                    305     ldf [farptr],a
                                    306     inc farptr+2 
                                    307     ldf [farptr],a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    308 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    309 	ret
                                    310 erase_end:
                                    311 
                                    312 ; copy erase_start in RAM 
                                    313 move_code_in_ram:
                                    314 	ldw x,#erase_end 
                                    315 	subw x,#erase_start
                                    316 	ldw acc16,x 
                                    317 	ldw x,#pad 
                                    318 	ldw y,#erase_start 
                                    319 	call move 
                                    320 	ret 
                                    321 
                                    322 ;-----------------------------------
                                    323 ; erase flash or EEPROM block 
                                    324 ; a block is 128 bytes 
                                    325 ; input:
                                    326 ;   farptr  address block begin
                                    327 ; output:
                                    328 ;   none
                                    329 ;--------------------------------------
                                    330 erase_block:
                                    331 	ldw x,farptr+1 
                                    332 	pushw x 
                                    333 	call move_code_in_ram 
                                    334 	popw x 
                                    335 	ldw farptr+1,x 
                                    336 	tnz farptr
                                    337 	jrne erase_flash 
                                    338 	ldw x,#FLASH_BASE 
                                    339 	cpw x,farptr+1 
                                    340 	jrpl erase_flash 
                                    341 ; erase eeprom block
                                    342 	call unlock_eeprom 
                                    343 	sim 
                                    344 	call pad   
                                    345 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    346 	rim 
                                    347 	ret 
                                    348 ; erase flash block:
                                    349 erase_flash:
                                    350 	call unlock_flash 
                                    351 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    352 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    353 	clr a 
                                    354 	sim 
                                    355 	call pad 
                                    356     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    357 	rim 
                                    358 	ret 
                                    359 .endif ; BLOCK_ERASE 
                                    360 
                                    361 
                                    362 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    363 ; write a byte to FLASH or EEPROM 
                                    364 ; input:
                                    365 ;    a  		byte to write
                                    366 ;    farptr  	address
                                    367 ;    x          farptr[x]
                                    368 ; output:
                                    369 ;    none
                                    370 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    371 	; variables locales
                           000001   372 	BTW = 1   ; byte to write offset on stack
                           000002   373 	OPT = 2   ; OPTION flag offset on stack
                           000002   374 	VSIZE = 2
      008178                        375 write_byte:
      008178 90 89            [ 2]  376 	pushw y
      0000FA                        377 	_vars VSIZE
      00817A 52 02            [ 2]    1     sub sp,#VSIZE 
      00817C 6B 01            [ 1]  378 	ld (BTW,sp),a ; byte to write 
      00817E 0F 02            [ 1]  379 	clr (OPT,sp)  ; OPTION flag
                                    380 ; put addr[15:0] in Y, for bounds check.
      008180 90 CE 00 14      [ 2]  381 	ldw y,farptr+1   ; Y=addr15:0
                                    382 ; check addr[23:16], if <> 0 then it is extened flash memory
      008184 72 5D 00 13      [ 1]  383 	tnz farptr 
      008188 26 14            [ 1]  384 	jrne write_flash
      00818A 90 A3 A6 00      [ 2]  385     cpw y,#user_space
      00818E 24 0E            [ 1]  386     jruge write_flash
      008190 90 A3 40 00      [ 2]  387 	cpw y,#EEPROM_BASE  
      008194 25 52            [ 1]  388     jrult write_exit
      008196 90 A3 48 00      [ 2]  389 	cpw y,#OPTION_BASE
      00819A 25 18            [ 1]  390 	jrult write_eeprom
      00819C 20 4A            [ 2]  391     jra write_exit
                                    392 ; write program memory
      00819E                        393 write_flash:
      00819E CD 81 6A         [ 4]  394 	call unlock_flash 
      0081A1 9B               [ 1]  395 1$:	sim 
      0081A2 7B 01            [ 1]  396 	ld a,(BTW,sp)
      0081A4 92 A7 00 13      [ 4]  397 	ldf ([farptr],x),a ; farptr[x]=A
      0081A8 72 05 50 5F FB   [ 2]  398 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081AD 9A               [ 1]  399     rim 
      0081AE 72 13 50 5F      [ 1]  400     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0081B2 20 34            [ 2]  401     jra write_exit
                                    402 ; write eeprom and option
      0081B4                        403 write_eeprom:
      0081B4 CD 81 5C         [ 4]  404 	call unlock_eeprom
                                    405 	; check for data eeprom or option eeprom
      0081B7 90 A3 48 00      [ 2]  406 	cpw y,#OPTION_BASE
      0081BB 2B 08            [ 1]  407 	jrmi 1$
      0081BD 90 A3 48 80      [ 2]  408 	cpw y,#OPTION_END+1
      0081C1 2A 02            [ 1]  409 	jrpl 1$
      0081C3 03 02            [ 1]  410 	cpl (OPT,sp)
      0081C5                        411 1$: 
      0081C5 0D 02            [ 1]  412     tnz (OPT,sp)
      0081C7 27 08            [ 1]  413     jreq 2$
                                    414 	; pour modifier une option il faut modifier ces 2 bits
      0081C9 72 1E 50 5B      [ 1]  415     bset FLASH_CR2,#FLASH_CR2_OPT
      0081CD 72 1F 50 5C      [ 1]  416     bres FLASH_NCR2,#FLASH_CR2_OPT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      0081D1                        417 2$: 
      0081D1 7B 01            [ 1]  418     ld a,(BTW,sp)
      0081D3 92 A7 00 13      [ 4]  419     ldf ([farptr],x),a
      0081D7 0D 02            [ 1]  420     tnz (OPT,sp)
      0081D9 27 08            [ 1]  421     jreq 3$
      0081DB 5C               [ 2]  422     incw x
      0081DC 7B 01            [ 1]  423     ld a,(BTW,sp)
      0081DE 43               [ 1]  424     cpl a
      0081DF 92 A7 00 13      [ 4]  425     ldf ([farptr],x),a
      0081E3 72 05 50 5F FB   [ 2]  426 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081E8                        427 write_exit:
      000168                        428 	_drop VSIZE 
      0081E8 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081EA 90 85            [ 2]  429 	popw y
      0081EC 81               [ 4]  430     ret
                                    431 
                                    432 ;--------------------------------------------
                                    433 ; write a data block to eeprom or flash 
                                    434 ; input:
                                    435 ;   Y        source address   
                                    436 ;   X        array index  destination  farptr[x]
                                    437 ;   BSIZE    block size bytes 
                                    438 ;   farptr   write address , byte* 
                                    439 ; output:
                                    440 ;	X 		after last byte written 
                                    441 ;   Y 		after last byte read 
                                    442 ;  farptr   point after block
                                    443 ;---------------------------------------------
      0081ED                        444 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      00016D                        445 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    446 	; local var 
                           000001   447 	XSAVE=1 
                           000002   448 	VSIZE=2 
      00016D                        449 write_block:
      00016D                        450 	_vars VSIZE
      0081ED 52 02            [ 2]    1     sub sp,#VSIZE 
      0081EF 1F 01            [ 2]  451 	ldw (XSAVE,sp),x 
      0081F1 1E 05            [ 2]  452 	ldw x,(BSIZE,sp) 
      0081F3 27 13            [ 1]  453 	jreq 9$
      0081F5 1E 01            [ 2]  454 1$:	ldw x,(XSAVE,sp)
      0081F7 90 F6            [ 1]  455 	ld a,(y)
      0081F9 CD 81 78         [ 4]  456 	call write_byte 
      0081FC 5C               [ 2]  457 	incw x 
      0081FD 90 5C            [ 2]  458 	incw y 
      0081FF 1F 01            [ 2]  459 	ldw (XSAVE,sp),x
      008201 1E 05            [ 2]  460 	ldw x,(BSIZE,sp)
      008203 5A               [ 2]  461 	decw x
      008204 1F 05            [ 2]  462 	ldw (BSIZE,sp),x 
      008206 26 ED            [ 1]  463 	jrne 1$
      008208                        464 9$:
      008208 1E 01            [ 2]  465 	ldw x,(XSAVE,sp)
      00820A CD 9C 08         [ 4]  466 	call incr_farptr
      00018D                        467 	_drop VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00820D 5B 02            [ 2]    1     addw sp,#VSIZE 
      00820F 81               [ 4]  468 	ret 
                                    469 
                                    470 
                                    471 ;---------------------------------------------
                                    472 ;   UART1 subroutines
                                    473 ;---------------------------------------------
                                    474 
                                    475 ;---------------------------------------------
                                    476 ; initialize UART1, 115200 8N1
                                    477 ; input:
                                    478 ;	none
                                    479 ; output:
                                    480 ;   none
                                    481 ;---------------------------------------------
      008210                        482 uart1_init:
      008210 72 1A 50 02      [ 1]  483     bset PA_DDR,#UART1_TX_PIN
      008214 72 1A 50 03      [ 1]  484     bset PA_CR1,#UART1_TX_PIN 
      008218 72 1A 50 04      [ 1]  485     bset PA_CR2,#UART1_TX_PIN 
                                    486 ; enable UART1 clock
      00821C 72 14 50 C7      [ 1]  487 	bset CLK_PCKENR1,#CLK_PCKENR1_UART1	
      008220                        488 uart1_set_baud: 
                                    489 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    490 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008220 A6 E1            [ 1]  491 	ld a,#CLK_SWR_HSI
      008222 C1 50 C3         [ 1]  492 	cp a,CLK_CMSR 
      008225 27 0A            [ 1]  493 	jreq 2$ 
      008227                        494 1$: ; 8 Mhz 	
      008227 35 05 52 33      [ 1]  495 	mov UART1_BRR2,#0x05 ; must be loaded first
      00822B 35 04 52 32      [ 1]  496 	mov UART1_BRR1,#0x4
      00822F 20 08            [ 2]  497 	jra 3$
      008231                        498 2$: ; 16 Mhz 	
      008231 35 0B 52 33      [ 1]  499 	mov UART1_BRR2,#0x0b ; must be loaded first
      008235 35 08 52 32      [ 1]  500 	mov UART1_BRR1,#0x08
      008239                        501 3$:
      008239 72 5F 52 31      [ 1]  502     clr UART1_DR
      00823D 35 0C 52 35      [ 1]  503 	mov UART1_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
      008241 72 10 52 35      [ 1]  504 	bset UART1_CR2,#UART_CR2_SBK
      008245 72 0D 52 30 FB   [ 2]  505     btjf UART1_SR,#UART_SR_TC,.
      00824A 81               [ 4]  506     ret
                                    507 
                                    508 ;---------------------------------
                                    509 ; send character to UART1 
                                    510 ; input:
                                    511 ;   A 
                                    512 ; output:
                                    513 ;   none 
                                    514 ;--------------------------------	
      00824B                        515 putc:
      00824B 72 0F 52 30 FB   [ 2]  516 	btjf UART1_SR,#UART_SR_TXE,.
      008250 C7 52 31         [ 1]  517 	ld UART1_DR,a 
      008253 81               [ 4]  518 	ret 
                                    519 
                                    520 ;---------------------------------
                                    521 ; wait character from UART1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    522 ; input:
                                    523 ;   none
                                    524 ; output:
                                    525 ;   A 			char  
                                    526 ;--------------------------------	
      008254                        527 getc:
      008254 72 0B 52 30 FB   [ 2]  528 	btjf UART1_SR,#UART_SR_RXNE,.
      008259 C6 52 31         [ 1]  529 	ld a,UART1_DR 
      00825C 81               [ 4]  530 	ret 
                                    531 
                                    532 ;-----------------------------
                                    533 ; send an ASCIZ string to UART1 
                                    534 ; input: 
                                    535 ;   x 		char * 
                                    536 ; output:
                                    537 ;   none 
                                    538 ;-------------------------------
      00825D                        539 puts:
      00825D F6               [ 1]  540     ld a,(x)
      00825E 27 06            [ 1]  541 	jreq 1$
      008260 CD 82 4B         [ 4]  542 	call putc 
      008263 5C               [ 2]  543 	incw x 
      008264 20 F7            [ 2]  544 	jra puts 
      008266 81               [ 4]  545 1$:	ret 
                                    546 
                                    547 
                                    548 ;---------------------------
                                    549 ; delete character at left 
                                    550 ; of cursor on terminal 
                                    551 ; input:
                                    552 ;   none 
                                    553 ; output:
                                    554 ;	none 
                                    555 ;---------------------------
      008267                        556 bksp:
      008267 A6 08            [ 1]  557 	ld a,#BSP 
      008269 CD 82 4B         [ 4]  558 	call putc 
      00826C A6 20            [ 1]  559 	ld a,#SPACE 
      00826E CD 82 4B         [ 4]  560 	call putc 
      008271 A6 08            [ 1]  561 	ld a,#BSP 
      008273 CD 82 4B         [ 4]  562 	call putc 
      008276 81               [ 4]  563 	ret 
                                    564 ;---------------------------
                                    565 ; delete n character left of cursor 
                                    566 ; at terminal.
                                    567 ; input: 
                                    568 ;   A   	number of characters to delete.
                                    569 ; output:
                                    570 ;    none 
                                    571 ;--------------------------	
      008277                        572 delete:
      008277 88               [ 1]  573 	push a 
      008278 0D 01            [ 1]  574 0$:	tnz (1,sp)
      00827A 27 07            [ 1]  575 	jreq 1$
      00827C CD 82 67         [ 4]  576 	call bksp 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      00827F 0A 01            [ 1]  577 	dec (1,sp)
      008281 20 F5            [ 2]  578 	jra 0$
      008283 84               [ 1]  579 1$:	pop a 
      008284 81               [ 4]  580 	ret
                                    581 
                                    582 ;--------------------------
                                    583 ; print n spaces on terminal
                                    584 ; input:
                                    585 ;  X 		number of spaces 
                                    586 ; output:
                                    587 ;	none 
                                    588 ;---------------------------
      008285                        589 spaces:
      008285 A6 20            [ 1]  590 	ld a,#SPACE 
      008287 5D               [ 2]  591 1$:	tnzw x
      008288 27 06            [ 1]  592 	jreq 9$
      00828A CD 82 4B         [ 4]  593 	call putc 
      00828D 5A               [ 2]  594 	decw x
      00828E 20 F7            [ 2]  595 	jra 1$
      008290                        596 9$: 
      008290 81               [ 4]  597 	ret 
                                    598 
                           000001   599 .if DEBUG 
                                    600 ;---------------------------------
                                    601 ;; print actual registers states 
                                    602 ;; as pushed on stack 
                                    603 ;; {Y,X,CC,A}
                                    604 ;---------------------------------
      008291                        605 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      000211                        606 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      000211                        607 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      000211                        608 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      000211                        609 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      000211                        610 prt_regs:
      008291 AE 82 D4         [ 2]  611 	ldw x,#regs_state 
      008294 CD 82 5D         [ 4]  612 	call puts
                                    613 ; register PC
      008297 16 01            [ 2]  614 	ldw y,(1,sp)
      008299 AE 8A 12         [ 2]  615 	ldw x,#REG_EPC 
      00829C CD 89 63         [ 4]  616 	call prt_reg16 
                                    617 ; register CC 
      00829F 7B 08            [ 1]  618 	ld a,(R_CC,sp)
      0082A1 AE 8A 23         [ 2]  619 	ldw x,#REG_CC 
      0082A4 CD 89 3E         [ 4]  620 	call prt_reg8 
                                    621 ; register A 
      0082A7 7B 07            [ 1]  622 	ld a,(R_A,sp)
      0082A9 AE 8A 1F         [ 2]  623 	ldw x,#REG_A 
      0082AC CD 89 3E         [ 4]  624 	call prt_reg8 
                                    625 ; register X 
      0082AF 16 05            [ 2]  626 	ldw y,(R_X,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082B1 AE 8A 1B         [ 2]  627 	ldw x,#REG_X 
      0082B4 CD 89 63         [ 4]  628 	call prt_reg16 
                                    629 ; register Y 
      0082B7 16 03            [ 2]  630 	ldw y,(R_Y,sp)
      0082B9 AE 8A 17         [ 2]  631 	ldw x,#REG_Y 
      0082BC CD 89 63         [ 4]  632 	call prt_reg16 
                                    633 ; register SP 
      0082BF 90 96            [ 1]  634 	ldw y,sp
      0082C1 72 A9 00 08      [ 2]  635 	addw y,#6+ARG_OFS  
      0082C5 AE 8A 28         [ 2]  636 	ldw x,#REG_SP
      0082C8 CD 89 63         [ 4]  637 	call prt_reg16
      0082CB A6 0D            [ 1]  638 	ld a,#CR 
      0082CD CD 82 4B         [ 4]  639 	call putc
      0082D0 CD 82 4B         [ 4]  640 	call putc   
      0082D3 81               [ 4]  641 	ret 
                                    642 
      0082D4 0A 72 65 67 69 73 74   643 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    644 
                                    645 
                                    646 ;--------------------
                                    647 ; print content at address in hex.
                                    648 ; input:
                                    649 ;   X 	address to peek 
                                    650 ; output:
                                    651 ;	none 
                                    652 ;--------------------	
      0082FB                        653 prt_peek:
      0082FB 89               [ 2]  654 	pushw x 
      0082FC CF 00 09         [ 2]  655 	ldw acc16,x 
      0082FF 72 5F 00 08      [ 1]  656 	clr acc24 
      008303 5F               [ 1]  657 	clrw x 
      008304 A6 10            [ 1]  658 	ld a,#16 
      008306 CD 8A 2D         [ 4]  659 	call prti24 
      008309 A6 3A            [ 1]  660 	ld a,#': 
      00830B CD 82 4B         [ 4]  661 	call putc 
      00830E A6 20            [ 1]  662 	ld a,#SPACE 
      008310 CD 82 4B         [ 4]  663 	call putc 
      008313 85               [ 2]  664 	popw x 
      008314 F6               [ 1]  665 	ld a,(x)
      008315 C7 00 0A         [ 1]  666 	ld acc8,a 
      008318 5F               [ 1]  667 	clrw x 
      008319 A6 10            [ 1]  668 	ld a,#16 
      00831B CD 8A 2D         [ 4]  669 	call prti24
      00831E 81               [ 4]  670 	ret 
                                    671 .endif ; DEBUG  
                                    672 
                                    673 ;-------------------------------------
                                    674 ; retrun string length
                                    675 ; input:
                                    676 ;   X         .asciz  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    677 ; output:
                                    678 ;   X         length 
                                    679 ;-------------------------------------
      00831F                        680 strlen:
      00831F 90 93            [ 1]  681 	ldw y,x 
      008321 5F               [ 1]  682 	clrw x 
      008322 90 7D            [ 1]  683 1$:	tnz (y) 
      008324 27 05            [ 1]  684 	jreq 9$ 
      008326 5C               [ 2]  685 	incw x
      008327 90 5C            [ 2]  686 	incw y 
      008329 20 F7            [ 2]  687 	jra 1$ 
      00832B 81               [ 4]  688 9$: ret 
                                    689 
                                    690 ;------------------------------------
                                    691 ; compare 2 strings
                                    692 ; input:
                                    693 ;   X 		char* first string 
                                    694 ;   Y       char* second string 
                                    695 ; output:
                                    696 ;   A 		0|1 
                                    697 ;-------------------------------------
      00832C                        698 strcmp:
      00832C F6               [ 1]  699 	ld a,(x)
      00832D 27 0B            [ 1]  700 	jreq 5$ 
      00832F 90 F1            [ 1]  701 	cp a,(y) 
      008331 26 05            [ 1]  702 	jrne 4$ 
      008333 5C               [ 2]  703 	incw x 
      008334 90 5C            [ 2]  704 	incw y 
      008336 20 F4            [ 2]  705 	jra strcmp 
      008338                        706 4$: ; not same  
      008338 4F               [ 1]  707 	clr a 
      008339 81               [ 4]  708 	ret 
      00833A                        709 5$: ; same 
      00833A A6 01            [ 1]  710 	ld a,#1 
      00833C 81               [ 4]  711 	ret 
                                    712 
                                    713 
                                    714 ;---------------------------------------
                                    715 ;  copy src to dest 
                                    716 ; input:
                                    717 ;   X 		dest 
                                    718 ;   Y 		src 
                                    719 ; output: 
                                    720 ;   X 		dest 
                                    721 ;----------------------------------
      00833D                        722 strcpy:
      00833D 89               [ 2]  723 	pushw x 
      00833E 90 F6            [ 1]  724 1$: ld a,(y)
      008340 27 06            [ 1]  725 	jreq 9$ 
      008342 F7               [ 1]  726 	ld (x),a 
      008343 5C               [ 2]  727 	incw x 
      008344 90 5C            [ 2]  728 	incw y 
      008346 20 F6            [ 2]  729 	jra 1$ 
      008348 7F               [ 1]  730 9$:	clr (x)
      008349 85               [ 2]  731 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      00834A 81               [ 4]  732 	ret 
                                    733 
                                    734 ;---------------------------------------
                                    735 ; move memory block 
                                    736 ; input:
                                    737 ;   X 		destination 
                                    738 ;   Y 	    source 
                                    739 ;   acc16	size 
                                    740 ; output:
                                    741 ;   none 
                                    742 ;--------------------------------------
                           000001   743 	INCR=1 ; increament high byte 
                           000002   744 	LB=2 ; increament low byte 
                           000002   745 	VSIZE=2
      00834B                        746 move:
      0002CB                        747 	_vars VSIZE 
      00834B 52 02            [ 2]    1     sub sp,#VSIZE 
      00834D 0F 01            [ 1]  748 	clr (INCR,sp)
      00834F 0F 02            [ 1]  749 	clr (LB,sp)
      008351 90 89            [ 2]  750 	pushw y 
      008353 13 01            [ 2]  751 	cpw x,(1,sp) ; compare DEST to SRC 
      008355 90 85            [ 2]  752 	popw y 
      008357 27 31            [ 1]  753 	jreq move_exit ; x==y 
      008359 2B 0E            [ 1]  754 	jrmi move_down
      00835B                        755 move_up: ; start from top address with incr=-1
      00835B 72 BB 00 09      [ 2]  756 	addw x,acc16
      00835F 72 B9 00 09      [ 2]  757 	addw y,acc16
      008363 03 01            [ 1]  758 	cpl (INCR,sp)
      008365 03 02            [ 1]  759 	cpl (LB,sp)   ; increment = -1 
      008367 20 05            [ 2]  760 	jra move_loop  
      008369                        761 move_down: ; start from bottom address with incr=1 
      008369 5A               [ 2]  762     decw x 
      00836A 90 5A            [ 2]  763 	decw y
      00836C 0C 02            [ 1]  764 	inc (LB,sp) ; incr=1 
      00836E                        765 move_loop:	
      00836E C6 00 09         [ 1]  766     ld a, acc16 
      008371 CA 00 0A         [ 1]  767 	or a, acc8
      008374 27 14            [ 1]  768 	jreq move_exit 
      008376 72 FB 01         [ 2]  769 	addw x,(INCR,sp)
      008379 72 F9 01         [ 2]  770 	addw y,(INCR,sp) 
      00837C 90 F6            [ 1]  771 	ld a,(y)
      00837E F7               [ 1]  772 	ld (x),a 
      00837F 89               [ 2]  773 	pushw x 
      008380 CE 00 09         [ 2]  774 	ldw x,acc16 
      008383 5A               [ 2]  775 	decw x 
      008384 CF 00 09         [ 2]  776 	ldw acc16,x 
      008387 85               [ 2]  777 	popw x 
      008388 20 E4            [ 2]  778 	jra move_loop
      00838A                        779 move_exit:
      00030A                        780 	_drop VSIZE
      00838A 5B 02            [ 2]    1     addw sp,#VSIZE 
      00838C 81               [ 4]  781 	ret 	
                                    782 
                                    783 ;-------------------------------------
                                    784 ; search text area for a line with 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



                                    785 ; same number as line#  
                                    786 ; input:
                                    787 ;	X 			line# 
                                    788 ; output:
                                    789 ;   X 			addr of line | 0 
                                    790 ;   Y           line#|insert address if not found  
                                    791 ;-------------------------------------
                           000001   792 	LL=1 ; line length 
                           000002   793 	LB=2 ; line length low byte 
                           000002   794 	VSIZE=2 
      00838D                        795 search_lineno:
      00030D                        796 	_vars VSIZE
      00838D 52 02            [ 2]    1     sub sp,#VSIZE 
      00838F 0F 01            [ 1]  797 	clr (LL,sp)
      008391 90 CE 00 1B      [ 2]  798 	ldw y,txtbgn
      008395                        799 search_ln_loop:
      008395 90 C3 00 1D      [ 2]  800 	cpw y,txtend 
      008399 2A 10            [ 1]  801 	jrpl 8$
      00839B 90 F3            [ 1]  802 	cpw x,(y)
      00839D 27 0E            [ 1]  803 	jreq 9$
      00839F 2B 0A            [ 1]  804 	jrmi 8$ 
      0083A1 90 E6 02         [ 1]  805 	ld a,(2,y)
      0083A4 6B 02            [ 1]  806 	ld (LB,sp),a 
      0083A6 72 F9 01         [ 2]  807 	addw y,(LL,sp)
      0083A9 20 EA            [ 2]  808 	jra search_ln_loop 
      0083AB                        809 8$: 
      0083AB 5F               [ 1]  810 	clrw x 	
      0083AC 51               [ 1]  811 	exgw x,y 
      00032D                        812 9$: _drop VSIZE
      0083AD 5B 02            [ 2]    1     addw sp,#VSIZE 
      0083AF 51               [ 1]  813 	exgw x,y   
      0083B0 81               [ 4]  814 	ret 
                                    815 
                                    816 ;-------------------------------------
                                    817 ; delete line at addr
                                    818 ; move new line to insert with end of text 
                                    819 ; otherwise it would be overwritten.
                                    820 ; input:
                                    821 ;   X 		addr of line i.e DEST for move 
                                    822 ;-------------------------------------
                           000001   823 	LLEN=1
                           000003   824 	SRC=3
                           000004   825 	VSIZE=4
      0083B1                        826 del_line: 
      000331                        827 	_vars VSIZE 
      0083B1 52 04            [ 2]    1     sub sp,#VSIZE 
      0083B3 E6 02            [ 1]  828 	ld a,(2,x) ; line length
      0083B5 6B 02            [ 1]  829 	ld (LLEN+1,sp),a 
      0083B7 0F 01            [ 1]  830 	clr (LLEN,sp)
      0083B9 90 93            [ 1]  831 	ldw y,x  
      0083BB 72 F9 01         [ 2]  832 	addw y,(LLEN,sp) ;SRC  
      0083BE 17 03            [ 2]  833 	ldw (SRC,sp),y  ;save source 
      0083C0 90 CE 00 1D      [ 2]  834 	ldw y,txtend 
      0083C4 90 E6 02         [ 1]  835 	ld a,(2,y)
      0083C7 90 5F            [ 1]  836 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      0083C9 90 97            [ 1]  837 	ld yl,a  
      0083CB 72 B9 00 1D      [ 2]  838 	addw y,txtend
      0083CF 72 F2 03         [ 2]  839 	subw y,(SRC,sp) ; y=count 
      0083D2 90 CF 00 09      [ 2]  840 	ldw acc16,y 
      0083D6 16 03            [ 2]  841 	ldw y,(SRC,sp)    ; source
      0083D8 CD 83 4B         [ 4]  842 	call move
      0083DB 90 CE 00 1D      [ 2]  843 	ldw y,txtend 
      0083DF 72 F2 01         [ 2]  844 	subw y,(LLEN,sp)
      0083E2 90 CF 00 1D      [ 2]  845 	ldw txtend,y  
      000366                        846 	_drop VSIZE     
      0083E6 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083E8 81               [ 4]  847 	ret 
                                    848 
                                    849 ;---------------------------------------------
                                    850 ; create a gap in text area 
                                    851 ; move new line to insert in gap with end of text
                                    852 ; otherwise it would be overwritten.
                                    853 ; input:
                                    854 ;    X 			addr gap start 
                                    855 ;    Y 			gap length 
                                    856 ; output:
                                    857 ;    X 			addr gap start 
                                    858 ;--------------------------------------------
                           000001   859 	DEST=1
                           000003   860 	SRC=3
                           000005   861 	LEN=5
                           000006   862 	VSIZE=6 
      0083E9                        863 create_gap:
      000369                        864 	_vars VSIZE
      0083E9 52 06            [ 2]    1     sub sp,#VSIZE 
      0083EB 1F 03            [ 2]  865 	ldw (SRC,sp),x 
      0083ED 17 05            [ 2]  866 	ldw (LEN,sp),y 
      0083EF 90 CF 00 09      [ 2]  867 	ldw acc16,y 
      0083F3 90 93            [ 1]  868 	ldw y,x ; SRC
      0083F5 72 BB 00 09      [ 2]  869 	addw x,acc16  
      0083F9 1F 01            [ 2]  870 	ldw (DEST,sp),x 
                                    871 ;compute size to move 	
      0083FB CE 00 1D         [ 2]  872 	ldw x,txtend 
      0083FE E6 02            [ 1]  873 	ld a,(2,x) ; pending line length 
      008400 C7 00 0A         [ 1]  874 	ld acc8,a 
      008403 72 5F 00 09      [ 1]  875 	clr acc16 
      008407 72 BB 00 09      [ 2]  876 	addw x,acc16 
      00840B 72 F0 03         [ 2]  877 	subw x,(SRC,sp)
      00840E CF 00 09         [ 2]  878 	ldw acc16,x ; size to move
      008411 1E 01            [ 2]  879 	ldw x,(DEST,sp) 
      008413 CD 83 4B         [ 4]  880 	call move
      008416 CE 00 1D         [ 2]  881 	ldw x,txtend
      008419 72 FB 05         [ 2]  882 	addw x,(LEN,sp)
      00841C CF 00 1D         [ 2]  883 	ldw txtend,x
      00039F                        884 9$:	_drop VSIZE 
      00841F 5B 06            [ 2]    1     addw sp,#VSIZE 
      008421 81               [ 4]  885 	ret 
                                    886 
                                    887 
                                    888 ;--------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    889 ; insert line in tib into text area 
                                    890 ; first search for already existing 
                                    891 ; replace existing 
                                    892 ; if strlen(tib)==0 delete existing 
                                    893 ; input:
                                    894 ;   ptr16 				pointer to tokenized line  
                                    895 ; output:
                                    896 ;   none
                                    897 ;---------------------------------------------
                           000001   898 	DEST=1  ; text area insertion address 
                           000003   899 	SRC=3   ; str to insert address 
                           000005   900 	LINENO=5 ; line number 
                           000007   901 	LLEN=7 ; line length 
                           000008   902 	VSIZE=8  
      008422                        903 insert_line:
      0003A2                        904 	_vars VSIZE 
      008422 52 08            [ 2]    1     sub sp,#VSIZE 
      008424 CE 00 14         [ 2]  905 	ldw x,ptr16  
      008427 C3 00 1B         [ 2]  906 	cpw x,txtbgn 
      00842A 26 0D            [ 1]  907 	jrne 0$
                                    908 ;first text line 
      00842C AE 00 02         [ 2]  909 	ldw x,#2 
      00842F 72 D6 00 14      [ 4]  910 	ld a,([ptr16],x)
      008433 5F               [ 1]  911 	clrw x 
      008434 97               [ 1]  912 	ld xl,a
      008435 1F 07            [ 2]  913 	ldw (LLEN,sp),x  
      008437 20 45            [ 2]  914 	jra 5$
      008439 72 CE 00 14      [ 5]  915 0$:	ldw x,[ptr16]
                                    916 ; new line number
      00843D 1F 05            [ 2]  917 	ldw (LINENO,sp),x 
      00843F AE 00 02         [ 2]  918 	ldw x,#2 
      008442 72 D6 00 14      [ 4]  919 	ld a,([ptr16],x)
      008446 97               [ 1]  920 	ld xl,a
                                    921 ; new line length
      008447 1F 07            [ 2]  922 	ldw (LLEN,sp),x
                                    923 ; check if that line number already exit 	
      008449 1E 05            [ 2]  924 	ldw x,(LINENO,sp)
      00844B CD 83 8D         [ 4]  925 	call search_lineno 
      00844E 5D               [ 2]  926 	tnzw x 
      00844F 26 04            [ 1]  927 	jrne 2$
                                    928 ; line doesn't exit
                                    929 ; it will be inserted at this point.  	
      008451 17 01            [ 2]  930 	ldw (DEST,sp),y 
      008453 20 05            [ 2]  931 	jra 3$
                                    932 ; line exit delete it.
                                    933 ; it will be replaced by new one 	
      008455 1F 01            [ 2]  934 2$: ldw (DEST,sp),x 
      008457 CD 83 B1         [ 4]  935 	call del_line
      00845A                        936 3$: 
                                    937 ; insert new line or leave if LLEN==3
                                    938 ; LLEN==3 means empty line 
      00845A A6 03            [ 1]  939 	ld a,#3
      00845C 11 08            [ 1]  940 	cp a,(LLEN+1,sp)
      00845E 27 27            [ 1]  941 	jreq insert_ln_exit ; empty line exit.
                                    942 ; if insertion point at txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



                                    943 ; no move required 
      008460 1E 01            [ 2]  944 	ldw x,(DEST,sp)
      008462 C3 00 1D         [ 2]  945 	cpw x,txtend 
      008465 2A 17            [ 1]  946 	jrpl 5$ 
                                    947 ; must create a gap
                                    948 ; at insertion point  
      008467 1E 01            [ 2]  949 	ldw x,(DEST,sp)
      008469 16 07            [ 2]  950 	ldw y,(LLEN,sp)
      00846B CD 83 E9         [ 4]  951 	call create_gap 
                                    952 ; move new line in gap 
      00846E 1E 07            [ 2]  953 	ldw x,(LLEN,sp)
      008470 CF 00 09         [ 2]  954 	ldw acc16,x 
      008473 90 CE 00 1D      [ 2]  955 	ldw y,txtend ;SRC 
      008477 1E 01            [ 2]  956 	ldw x,(DEST,sp) ; dest address 
      008479 CD 83 4B         [ 4]  957 	call move 
      00847C 20 09            [ 2]  958 	jra insert_ln_exit  
      00847E                        959 5$: ; no move required 
      00847E 1E 07            [ 2]  960 	ldw x,(LLEN,sp) 
      008480 72 BB 00 1D      [ 2]  961 	addw x,txtend 
      008484 CF 00 1D         [ 2]  962 	ldw txtend,x 
      008487                        963 insert_ln_exit:	
      000407                        964 	_drop VSIZE
      008487 5B 08            [ 2]    1     addw sp,#VSIZE 
      008489 81               [ 4]  965 	ret
                                    966 
                                    967 
                                    968 ;-----------------------------
                                    969 ; check if text buffer full
                                    970 ; input:
                                    971 ;   ptr16     addr start tokenize line 
                                    972 ;   X         buffer index 
                                    973 ; output:
                                    974 ;   none 
                                    975 ;-----------------------------------
      00848A                        976 check_full:
      00848A 72 BB 00 14      [ 2]  977 	addw x,ptr16 
      00848E A3 16 C8         [ 2]  978 	cpw x,#tib 
      008491 25 05            [ 1]  979 	jrult 1$
      008493 A6 01            [ 1]  980 	ld a,#ERR_MEM_FULL
      008495 CC 88 17         [ 2]  981 	jp tb_error 
      008498 81               [ 4]  982 1$: ret 
                                    983 
                                    984 
                                    985 ;-----------------------------------
                                    986 ; create token list form text line 
                                    987 ; save this list in text area
                                    988 ; input:
                                    989 ;   none
                                    990 ; output:
                                    991 ;   basicptr     token list buffer
                                    992 ;   line# 		 BASIC line number 
                                    993 ;   in.w  		 cleared 
                                    994 ;-----------------------------------
                                    995 	.macro _incr_ptr16 n 
                                    996 	ldw x,#n 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    997 	addw x,ptr16 
                                    998 	ldw ptr16,x 
                                    999 	.endm 
                                   1000 
                           000001  1001 	XSAVE=1
                           000003  1002 	BUFIDX=3
                           000004  1003 	VSIZE=4
      008499                       1004 compile:
      000419                       1005 	_vars VSIZE 
      008499 52 04            [ 2]    1     sub sp,#VSIZE 
      00849B 72 1A 00 22      [ 1] 1006 	bset flags,#FCOMP 
      00849F CE 00 1D         [ 2] 1007 	ldw x,txtend
      0084A2 CF 00 14         [ 2] 1008 	ldw ptr16,x 
      0084A5 5F               [ 1] 1009 	clrw x 
      0084A6 AE 00 03         [ 2] 1010 	ldw x,#3
      0084A9 1F 03            [ 2] 1011 	ldw (BUFIDX,sp),X  
      0084AB CD 84 8A         [ 4] 1012 	call check_full
      0084AE 5F               [ 1] 1013 	clrw x 
      0084AF 72 CF 00 14      [ 5] 1014 	ldw [ptr16],x 
      0084B3 CD 8D DC         [ 4] 1015 	call get_token
      0084B6 1F 01            [ 2] 1016 	ldw (XSAVE,sp),x 
      0084B8 A1 04            [ 1] 1017 	cp a,#TK_INTGR 
      0084BA 26 11            [ 1] 1018 	jrne 3$
      0084BC A3 00 00         [ 2] 1019 	cpw x,#0  
      0084BF 22 03            [ 1] 1020 	jrugt 1$
      0084C1 CC 88 15         [ 2] 1021 	jp syntax_error 
      0084C4 72 CF 00 14      [ 5] 1022 1$:	ldw [ptr16],x; line number
      0084C8 CD 8D DC         [ 4] 1023 2$:	call get_token
      0084CB 1F 01            [ 2] 1024 	ldw (XSAVE,sp),x 
      0084CD A1 00            [ 1] 1025 3$:	cp a,#TK_NONE 
      0084CF 26 03            [ 1] 1026 	jrne 30$
      0084D1 CC 85 64         [ 2] 1027 	jp 9$
      0084D4                       1028 30$: 	 
      0084D4 1E 03            [ 2] 1029 	ldw x,(BUFIDX,sp)
      0084D6 CD 84 8A         [ 4] 1030 	call check_full 
      0084D9 16 03            [ 2] 1031 	ldw y,(BUFIDX,sp) 
      0084DB 91 D7 14         [ 4] 1032 	ld ([ptr16],y),a ; token attribute 
      0084DE 90 5C            [ 2] 1033 	incw y
      0084E0 17 03            [ 2] 1034 	ldw (BUFIDX,sp),y
      0084E2 A1 01            [ 1] 1035 	cp a,#TK_COLON 
      0084E4 26 02            [ 1] 1036 	jrne 31$
      0084E6 20 E0            [ 2] 1037 	jra 2$ 
      0084E8                       1038 31$:
      0084E8 A1 03            [ 1] 1039 	cp a,#TK_CHAR
      0084EA 26 0C            [ 1] 1040 	jrne 32$ 
      0084EC 1E 01            [ 2] 1041 	ldw x,(XSAVE,sp)
      0084EE 9F               [ 1] 1042 	ld a,xl 
      0084EF 91 D7 14         [ 4] 1043 	ld ([ptr16],y),a
      0084F2 90 5C            [ 2] 1044 	incw y 
      0084F4 17 03            [ 2] 1045 	ldw (BUFIDX,sp),y 
      0084F6 20 D0            [ 2] 1046 	jra 2$ 
      0084F8                       1047 32$:
      0084F8 A1 02            [ 1] 1048 	cp a,#TK_ARRAY 
      0084FA 27 CC            [ 1] 1049 	jreq 2$ 
      0084FC A1 0A            [ 1] 1050 	cp a,#TK_QSTR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084FE 26 25            [ 1] 1051 	jrne 4$
      008500 AE 17 18         [ 2] 1052 	ldw x,#pad 
      008503 CD 83 1F         [ 4] 1053 	call strlen
      008506 5C               [ 2] 1054 	incw x  
      008507 CD 84 8A         [ 4] 1055 	call check_full 
      00850A 90 AE 17 18      [ 2] 1056 	ldw y,#pad 
      00850E CE 00 14         [ 2] 1057 	ldw x,ptr16
      008511 72 FB 03         [ 2] 1058 	addw x,(BUFIDX,sp)	
      008514 CD 83 3D         [ 4] 1059 	call strcpy 
      008517 AE 17 18         [ 2] 1060 	ldw x,#pad 
      00851A CD 83 1F         [ 4] 1061 	call strlen 
      00851D 5C               [ 2] 1062 	incw x
      00851E 72 FB 03         [ 2] 1063 	addw x,(BUFIDX,sp) 
      008521 1F 03            [ 2] 1064 	ldw (BUFIDX,sp),x
      008523 20 A3            [ 2] 1065 	jra 2$  
      008525 A1 04            [ 1] 1066 4$: cp a,#TK_INTGR
      008527 25 9F            [ 1] 1067 	jrult 2$
      008529 A1 09            [ 1] 1068 	cp a,#TK_CONST 
      00852B 22 9B            [ 1] 1069 	Jrugt 2$
      00852D 1E 01            [ 2] 1070 	ldw x,(XSAVE,sp) 
      00852F 16 03            [ 2] 1071 	ldw y,(BUFIDX,sp)
      008531 91 DF 14         [ 5] 1072 	ldw ([ptr16],y),x
      008534 A3 97 F1         [ 2] 1073 	cpw x,#rem 
      008537 26 22            [ 1] 1074 	jrne 5$	
                                   1075 ; comment advance in.w to eol 
      008539 72 A9 00 02      [ 2] 1076 	addw y,#2 ; skip exec address 
      00853D 17 03            [ 2] 1077 	ldw (BUFIDX,sp),y 
      00853F CE 00 14         [ 2] 1078 	ldw x,ptr16 
      008542 72 FB 03         [ 2] 1079 	addw x,(BUFIDX,sp)
      008545 90 CE 00 01      [ 2] 1080 	ldw y,in.w 
      008549 72 A9 16 C8      [ 2] 1081 	addw y,#tib 
      00854D CD 83 3D         [ 4] 1082 	call strcpy 	
      008550 CD 83 1F         [ 4] 1083 	call strlen 
      008553 5C               [ 2] 1084 	incw x ; skip string 0. 
      008554 72 FB 03         [ 2] 1085 	addw x,(BUFIDX,sp)
      008557 1F 03            [ 2] 1086 	ldw (BUFIDX,sp),x 
      008559 20 09            [ 2] 1087 	jra 9$
      00855B 72 A9 00 02      [ 2] 1088 5$:	addw y,#2 
      00855F 17 03            [ 2] 1089 	ldw (BUFIDX,sp),y 
      008561 CC 84 C8         [ 2] 1090 	jp 2$
      008564                       1091 9$: 
      008564 AE 00 02         [ 2] 1092 	ldw x,#2
      008567 16 03            [ 2] 1093 	ldw y,(BUFIDX,sp)
      008569 90 9F            [ 1] 1094 	ld a,yl 
      00856B 72 D7 00 14      [ 4] 1095 	ld ([ptr16],x),a  	
      00856F 72 CE 00 14      [ 5] 1096 	ldw x,[ptr16]
      008573 27 09            [ 1] 1097 	jreq 10$
      008575 CD 84 22         [ 4] 1098 	call insert_line
      008578 72 5F 00 04      [ 1] 1099 	clr  count 
      00857C 20 0F            [ 2] 1100 	jra  11$ 
      00857E                       1101 10$: 
      00857E CE 00 14         [ 2] 1102 	ldw x,ptr16 
      008581 CF 00 05         [ 2] 1103 	ldw basicptr,x 
      008584 E6 02            [ 1] 1104 	ld a,(2,x)
      008586 C7 00 04         [ 1] 1105 	ld count,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008589 35 03 00 02      [ 1] 1106 	mov in,#3 
      00858D                       1107 11$:
      00050D                       1108 	_drop VSIZE 
      00858D 5B 04            [ 2]    1     addw sp,#VSIZE 
      00858F 72 1B 00 22      [ 1] 1109 	bres flags,#FCOMP 
      008593 81               [ 4] 1110 	ret 
                                   1111 
                                   1112 
                                   1113 ;------------------------------------
                                   1114 ;  set all variables to zero 
                                   1115 ; input:
                                   1116 ;   none 
                                   1117 ; output:
                                   1118 ;	none
                                   1119 ;------------------------------------
      008594                       1120 clear_vars:
      008594 AE 00 24         [ 2] 1121 	ldw x,#vars 
      008597 90 AE 00 34      [ 2] 1122 	ldw y,#2*26 
      00859B 7F               [ 1] 1123 1$:	clr (x)
      00859C 5C               [ 2] 1124 	incw x 
      00859D 90 5A            [ 2] 1125 	decw y 
      00859F 26 FA            [ 1] 1126 	jrne 1$
      0085A1 81               [ 4] 1127 	ret 
                                   1128 
                                   1129 ;-------------------------------------
                                   1130 ; check if A is a letter
                                   1131 ; input:
                                   1132 ;   A 			character to test 
                                   1133 ; output:
                                   1134 ;   C flag      1 true, 0 false 
                                   1135 ;-------------------------------------
      0085A2                       1136 is_alpha:
      0085A2 A1 41            [ 1] 1137 	cp a,#'A 
      0085A4 8C               [ 1] 1138 	ccf
      0085A5 24 0B            [ 1] 1139 	jrnc 9$ 
      0085A7 A1 5B            [ 1] 1140 	cp a,#'Z+1 
      0085A9 25 07            [ 1] 1141 	jrc 9$ 
      0085AB A1 61            [ 1] 1142 	cp a,#'a 
      0085AD 8C               [ 1] 1143 	ccf 
      0085AE 24 02            [ 1] 1144 	jrnc 9$
      0085B0 A1 7B            [ 1] 1145 	cp a,#'z+1   
      0085B2 81               [ 4] 1146 9$: ret 	
                                   1147 
                                   1148 ;-------------------------------------
                                   1149 ;  program initialization entry point 
                                   1150 ;-------------------------------------
                           000001  1151 	MAJOR=1
                           000000  1152 	MINOR=0
      0085B3 0A 0A 54 69 6E 79 20  1153 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal  73-Bits]



             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      000579                       1154 cold_start:
                                   1155 ;set stack 
      0085E5 20 32 30         [ 2] 1156 	ldw x,#STACK_EMPTY
      0085E8 31               [ 1] 1157 	ldw sp,x   
                                   1158 ; clear all ram 
      0085E9 39               [ 1] 1159 0$: clr (x)
      0085EA 2C               [ 2] 1160 	decw x 
      0085EB 32 30            [ 1] 1161 	jrne 0$
                                   1162 ; activate pull up on all inputs 
      0085ED 32 30            [ 1] 1163 	ld a,#255 
      0085EF 0A 76 65         [ 1] 1164 	ld PA_CR1,a 
      0085F2 72 73 69         [ 1] 1165 	ld PB_CR1,a 
      0085F5 6F 6E 20         [ 1] 1166 	ld PC_CR1,a 
      0085F8 00 50 12         [ 1] 1167 	ld PD_CR1,a 
      0085F9 C7 50 17         [ 1] 1168 	ld PE_CR1,a 
      0085F9 AE 17 FF         [ 1] 1169 	ld PF_CR1,a 
      0085FC 94 7F 5A         [ 1] 1170 	ld PG_CR1,a 
      0085FF 26 FC A6         [ 1] 1171 	ld PI_CR1,a 
                                   1172 ; disable schmitt triggers on Arduino CN4 analog inputs
      008602 FF C7 50 03 C7   [ 1] 1173 	mov ADC_TDRL,0x3f
                                   1174 ; disable peripherals clocks
                                   1175 ;	clr CLK_PCKENR1 
                                   1176 ;	clr CLK_PCKENR2
      008607 50 08 C7 50      [ 1] 1177 	clr AWU_TBR 
      00860B 0D C7 50 12      [ 1] 1178 	bset CLK_PCKENR2,#2 ; enable LSI for beeper
                                   1179 ; select internal clock no divisor: 16 Mhz 	
      00860F C7 50            [ 1] 1180 	ld a,#CLK_SWR_HSI 
      008611 17               [ 1] 1181 	clrw x  
      008612 C7 50 1C         [ 4] 1182     call clock_init 
      008615 C7 50 21         [ 4] 1183 	call timer4_init
                                   1184 ; UART1 at 115200 BAUD
      008618 C7 50 2B         [ 4] 1185 	call uart1_init
                                   1186 ; activate PE_4 (user button interrupt)
      00861B 55 00 3F 54      [ 1] 1187     bset PE_CR2,#USR_BTN_BIT 
                                   1188 ; display system information
      00861F 07 72 5F         [ 2] 1189 	ldw x,#software 
      008622 50 F2 72         [ 4] 1190 	call puts 
      008625 14 50            [ 1] 1191 	ld a,#MAJOR 
      008627 CA A6 E1         [ 1] 1192 	ld acc8,a 
      00862A 5F               [ 1] 1193 	clrw x 
      00862B CD 81 31         [ 2] 1194 	ldw acc24,x 
      00862E CD 81            [ 1] 1195 	ld a,#10 
      008630 47 CD 82         [ 4] 1196 	call prti24 
      008633 10 72            [ 1] 1197 	ld a,#'.
      008635 18 50 18         [ 4] 1198 	call putc 
      008638 AE 85            [ 1] 1199 	ld a,#MINOR 
      00863A B3 CD 82         [ 1] 1200 	ld acc8,a 
      00863D 5D               [ 1] 1201 	clrw x 
      00863E A6 01 C7         [ 2] 1202 	ldw acc24,x 
      008641 00 0A            [ 1] 1203 	ld a,#10 
      008643 5F CF 00         [ 4] 1204 	call prti24 
      008646 08 A6            [ 1] 1205 	ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008648 0A CD 8A         [ 4] 1206 	call putc 
      00864B 2D A6 2E         [ 4] 1207 	call seek_fdrive 
                                   1208 ; configure LD2 pin 
      00864E CD 82 4B A6      [ 1] 1209     bset PC_CR1,#LED2_BIT
      008652 00 C7 00 0A      [ 1] 1210     bset PC_CR2,#LED2_BIT
      008656 5F CF 00 08      [ 1] 1211     bset PC_DDR,#LED2_BIT
      00865A A6               [ 1] 1212 	rim 
      00865B 0A CD 8A 2D      [ 1] 1213 	inc seedy+1 
      00865F A6 0D CD 82      [ 1] 1214 	inc seedx+1 
      008663 4B CD 9C         [ 4] 1215 	call clear_basic
      008666 16 72 1A         [ 4] 1216 	call ubound 
      008669 50 0D 72         [ 4] 1217 	call dpop 
      00866C 1A 50 0E         [ 2] 1218 	ldw array_size,x
      00866F 72 1A 50         [ 4] 1219 	call warm_init
      008672 0C 9A 72         [ 4] 1220 	call load_autorun
      008675 5C 00 12         [ 2] 1221     jp interp 
                                   1222 
      000611                       1223 warm_init:
      008678 72 5C 00 10      [ 1] 1224 	clr flags 
      00867C CD 86 E7 CD      [ 1] 1225 	clr loop_depth 
      008680 94 5E CD         [ 2] 1226 	ldw x,#dstack_empty 
      008683 90 7B CF         [ 2] 1227 	ldw dstkptr,x 
      008686 00 20 CD 86      [ 1] 1228 	mov tab_width,#TAB_WIDTH 
      00868A 91 CD 86 AE      [ 1] 1229 	mov base,#10 
      00868E CC 88 6C         [ 2] 1230 	ldw x,#tib 
      008691 CF 00 04         [ 2] 1231 	ldw basicptr,x 
      008691 72               [ 4] 1232 	ret 
                                   1233 
                                   1234 ;--------------------------
                                   1235 ; if autorun file defined 
                                   1236 ; in eeprom address AUTORUN_NAME 
                                   1237 ; load and run it.
                                   1238 ;-------------------------
      00062E                       1239 load_autorun:
      008692 5F 00 22         [ 2] 1240 	ldw x,#AUTORUN_NAME
      008695 72               [ 1] 1241 	ld a,(x)
      008696 5F 00            [ 1] 1242 	jreq 9$
      008698 1F AE 17 80      [ 2] 1243 	ldw y,#AUTORUN_NAME
      00869C CF 00 19         [ 4] 1244 	call search_file
      00869F 35 04            [ 1] 1245 	jrc 2$ 
      0086A1 00 23            [ 2] 1246 	jra 9$ 
      0086A3 35 0A 00         [ 4] 1247 2$:	call load_file
      0086A6 07 AE 16         [ 2] 1248 	ldw x,#AUTORUN_NAME 
      0086A9 C8 CF 00         [ 4] 1249 	call puts
      0086AC 05 81 52         [ 2] 1250 	ldw x,#autorun_msg 
      0086AE CD 01 DD         [ 4] 1251 	call puts 
      0086AE AE 40 00         [ 2] 1252 	jp run_it    
      0086B1 F6               [ 4] 1253 9$: ret 	
                                   1254 
      0086B2 27 1D 90 AE 40 00 CD  1255 autorun_msg: .asciz " loaded and running\n"
             9C 74 25 02 20 12 CD
             9D 83 AE 40 00 CD 82
                                   1256 ;---------------------------
                                   1257 ; reset BASIC text variables 
                                   1258 ; and clear variables 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal  5D-Bits]



                                   1259 ;---------------------------
      000667                       1260 clear_basic:
      0086C8 AE 86 D2 CD      [ 1] 1261 	clr count 
      0086CC 82 5D CC         [ 2] 1262 	ldw x,#free_ram 
      0086CF 9A 6F 81         [ 2] 1263 	ldw txtbgn,x 
      0086D2 20 6C 6F         [ 2] 1264 	ldw txtend,x 
      0086D5 61 64 65         [ 4] 1265 	call clear_vars 
      0086D8 64               [ 4] 1266 	ret 
                                   1267 
                                   1268 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1269 ;;   Tiny BASIC error messages     ;;
                                   1270 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      000678                       1271 err_msg:
      0086D9 20 61 6E 64 20 72 75  1272 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             6E 6E 69 6E 67
      0086E5 0A 00 07 05 07 20 07  1273 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             32 07 44
      0086E7 07 51                 1274 	.word err_no_access 
                                   1275 
      0086E7 72 5F 00 04 AE 00 58  1276 err_mem_full: .asciz "\nMemory full\n" 
             CF 00 1B CF 00 1D CD
      0086F5 85 94 81 6E 74 61 78  1277 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      0086F8 0A 6D 61 74 68 20 6F  1278 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0086F8 00 00 87 10 87 1E 87  1279 err_div0: .asciz "\ndivision by 0\n" 
             2D 87 47 87 57 87 6E
             87 85
      008708 87 A0 87 B2 87 C4 87  1280 err_no_line: .asciz "\ninvalid line number.\n"
             D1 0A 4D 65 6D 6F 72
             79 20 66 75 6C 6C 0A
             00 0A
      00871F 73 79 6E 74 61 78 20  1281 err_run_only: .asciz "\nrun time only usage.\n" 
             65 72 72 6F 72 0A 00
             0A 6D 61 74 68 20 6F
             70 65
      008736 72 61 74 69 6F 6E 20  1282 err_cmd_only: .asciz "\ncommand line only usage.\n"
             6F 76 65 72 66 6C 6F
             77 0A 00 0A 64 69 76
             69 73 69 6F 6E 20
      008751 62 79 20 30 0A 00 0A  1283 err_duplicate: .asciz "\nduplicate name.\n"
             69 6E 76 61 6C 69 64
             20 6C 69 6E
      008763 65 20 6E 75 6D 62 65  1284 err_not_file: .asciz "\nFile not found.\n"
             72 2E 0A 00 0A 72 75
             6E 20 74 69
      008775 6D 65 20 6F 6E 6C 79  1285 err_bad_value: .asciz "\nbad value.\n"
             20 75 73 61 67 65
      008782 2E 0A 00 0A 63 6F 6D  1286 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6D 61 6E 64 20 6C 69
             6E 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal  0A-Bits]



             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
                                   1287 
      00879F 00 0A 64 75 70 6C 69  1288 rt_msg: .asciz "last token id: "
             63 61 74 65 20 6E 61
             6D 65
                                   1289 
      000795                       1290 syntax_error:
      0087AF 2E 0A            [ 1] 1291 	ld a,#ERR_SYNTAX 
                                   1292 
      000797                       1293 tb_error:
      0087B1 00 0A 46         [ 2] 1294 	ldw x, #err_msg 
      0087B4 69 6C 65 20      [ 1] 1295 	clr acc16 
      0087B8 6E               [ 1] 1296 	sll a
      0087B9 6F 74 20 66      [ 1] 1297 	rlc acc16  
      0087BD 6F 75 6E         [ 1] 1298 	ld acc8, a 
      0087C0 64 2E 0A 00      [ 2] 1299 	addw x,acc16 
      0087C4 0A               [ 2] 1300 	ldw x,(x)
      0087C5 62 61 64         [ 4] 1301 	call puts
      0087C8 20 76 61 6C 75   [ 2] 1302 	btjf flags,#FCOMP, 1$
      0087CD 65 2E 0A         [ 2] 1303 	ldw x,#tib
      0087D0 00 0A 46         [ 4] 1304 	call puts 
      0087D3 69 6C            [ 1] 1305 	ld a,#CR 
      0087D5 65 20 69         [ 4] 1306 	call putc
      0087D8 6E 20 65         [ 2] 1307 	ldw x,in.w
      0087DB 78 74 65         [ 4] 1308 	call spaces
      0087DE 6E 64            [ 1] 1309 	ld a,#'^
      0087E0 65 64 20         [ 4] 1310 	call putc 
      0087E3 6D 65            [ 2] 1311 	jra 6$
      0087E5 6D 6F 72         [ 2] 1312 1$:	ldw x,basicptr
      0087E8 79 2C 20         [ 4] 1313 	call prt_basic_line
      0087EB 63 61 6E         [ 2] 1314 	ldw x,#rt_msg 
      0087EE 27 74 20         [ 4] 1315 	call puts 
      0087F1 62               [ 1] 1316 	clrw x 
      0087F2 65 20 72         [ 1] 1317 	ld a,in.saved 
      0087F5 75               [ 1] 1318 	ld xl,a 
      0087F6 6E 20 66 72      [ 4] 1319 	ld a,([basicptr],x)
      0087FA 6F               [ 1] 1320 	clrw x 
      0087FB 6D               [ 1] 1321 	ld xl,a 
      0087FC 20 74 68         [ 4] 1322 	call print_int 
      0087FF 65 72 65         [ 2] 1323 6$: ldw x,#STACK_EMPTY 
      008802 2E               [ 1] 1324     ldw sp,x
      0007E9                       1325 warm_start:
      008803 0A 00 6C         [ 4] 1326 	call warm_init
                                   1327 ;----------------------------
                                   1328 ;   BASIC interpreter
                                   1329 ;----------------------------
      0007EC                       1330 interp:
      008806 61 73 74 20      [ 1] 1331 	clr in.w
      00880A 74 6F 6B 65 6E   [ 2] 1332 	btjf flags,#FRUN,4$ 
                                   1333 ; running program
                                   1334 ; goto next basic line 
      00880F 20 69 64         [ 2] 1335 	ldw x,basicptr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008812 3A 20            [ 1] 1336 	ld a,(2,x) ; line length 
      008814 00 00 09         [ 1] 1337 	ld acc8,a 
      008815 72 5F 00 08      [ 1] 1338 	clr acc16 
      008815 A6 02 00 08      [ 2] 1339 	addw x,acc16
      008817 C3 00 1C         [ 2] 1340 	cpw x,txtend 
      008817 AE 86            [ 1] 1341 	jrpl warm_start
      008819 F8 72 5F         [ 2] 1342 	ldw basicptr,x ; start of next line  
      00881C 00 09            [ 1] 1343 	ld a,(2,x)
      00881E 48 72 59         [ 1] 1344 	ld count,a 
      008821 00 09 C7 00      [ 1] 1345 	mov in,#3 ; skip first 3 bytes of line 
      008825 0A 72            [ 2] 1346 	jra interp_loop 
      000818                       1347 4$: ; commande line mode 	
      008827 BB 00 09 FE      [ 1] 1348 	clr in
      00882B CD 82            [ 1] 1349 	ld a,#CR 
      00882D 5D 72 0B         [ 4] 1350 	call putc 
      008830 00 22            [ 1] 1351 	ld a,#'> 
      008832 18 AE 16         [ 4] 1352 	call putc 
      008835 C8 CD 82         [ 4] 1353 	call readln
      008838 5D A6 0D         [ 4] 1354 	call compile
      00082C                       1355 interp_loop:  
      00883B CD 82 4B         [ 1] 1356 	ld a,in 
      00883E CE 00 01         [ 1] 1357 	cp a,count  
      008841 CD 82            [ 1] 1358 	jrpl interp
      008843 85 A6 5E         [ 4] 1359 	call next_token
      008846 CD 82            [ 1] 1360 	cp a,#TK_COLON 
      008848 4B 20            [ 1] 1361 	jreq interp_loop 
      00884A 1A CE            [ 1] 1362 	cp a,#TK_NONE 
                                   1363 ;	jreq interp 
      00083D                       1364 1$:
      00884C 00 05            [ 1] 1365 	cp a,#TK_VAR
      00884E CD 95            [ 1] 1366 	jrne 2$
      008850 7B AE 88         [ 4] 1367 	call let02  
      008853 05 CD            [ 2] 1368 	jra interp_loop 
      000846                       1369 2$:	
      008855 82 5D            [ 1] 1370 	cp a,#TK_ARRAY 
      008857 5F C6            [ 1] 1371 	jrne 3$
      008859 00 03 97         [ 4] 1372 	call get_array_element
      00885C 72 D6 00         [ 4] 1373 	call let02 
      00885F 05 5F            [ 2] 1374 	jra interp_loop 
      000852                       1375 3$:
      008861 97 CD            [ 1] 1376 	cp a,#TK_CMD
      008863 8A 75            [ 1] 1377 	jrne 4$
      008865 AE               [ 4] 1378 	call (x) 
      008866 17 FF            [ 2] 1379 	jra interp_loop 
      000859                       1380 4$:	
      008868 94 07 95         [ 2] 1381 	jp syntax_error 
                                   1382 
                                   1383 ;--------------------------
                                   1384 ; extract next token from
                                   1385 ; token list 
                                   1386 ; basicptr -> base address 
                                   1387 ; in  -> offset in list array 
                                   1388 ; output:
                                   1389 ;   A 		token attribute
                                   1390 ;   X 		token value if there is one
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1391 ;----------------------------------------
      008869                       1392 next_token:
      008869 CD 86 91         [ 1] 1393 	ld a,in 
      00886C C0 00 03         [ 1] 1394 	sub a,count 
      00886C 72 5F            [ 1] 1395 	jreq 9$
      00886E 00 01 72 01 00   [ 1] 1396 	mov in.saved,in
      008873 22 23 CE         [ 2] 1397 	ldw x,basicptr 
      008876 00 05 E6 02      [ 4] 1398 	ld a,([in.w],x)
      00887A C7 00 0A 72      [ 1] 1399 	inc in 
      00887E 5F 00            [ 1] 1400 	cp a,#TK_ARRAY  
      008880 09 72            [ 2] 1401 	jrule 9$
      008882 BB 00            [ 1] 1402 	cp a,#TK_CHAR
      008884 09 C3            [ 1] 1403 	jrne 1$
      008886 00 1D 2A DF      [ 4] 1404 	ld a,([in.w],x)
      00888A CF 00 05 E6      [ 1] 1405 	inc in
      00888E 02               [ 1] 1406 	clrw x 
      00888F C7               [ 1] 1407 	ld xl,a 
      008890 00 04            [ 1] 1408 	ld a,#TK_CHAR
      008892 35               [ 4] 1409 	ret 
      008893 03 00            [ 1] 1410 1$:	cp a,#TK_QSTR 
      008895 02 20            [ 1] 1411 	jrult 2$
      008897 14 BB 00 00      [ 2] 1412 	addw x,in.w 
      008898 20 0C            [ 2] 1413 	jra 9$
      008898 72 5F 00 02      [ 5] 1414 2$: ldw x,([in.w],x)
      00889C A6 0D CD 82      [ 1] 1415 	inc in 
      0088A0 4B A6 3E CD      [ 1] 1416 	inc in
      0088A4 82               [ 4] 1417 9$: ret	
                                   1418 
                                   1419 
                                   1420 ;----------------------------------------
                                   1421 ;   DEBUG support functions
                                   1422 ;----------------------------------------
                           000001  1423 .if DEBUG 
                                   1424 ; turn LED on 
      0008A0                       1425 ledon:
      0088A5 4B CD 8B 63      [ 1] 1426     bset PC_ODR,#LED2_BIT
      0088A9 CD               [ 4] 1427     ret 
                                   1428 
                                   1429 ; turn LED off 
      0008A5                       1430 ledoff:
      0088AA 84 99 50 0A      [ 1] 1431     bres PC_ODR,#LED2_BIT 
      0088AC 81               [ 4] 1432     ret 
                                   1433 
                                   1434 ; invert LED status 
      0008AA                       1435 ledtoggle:
      0088AC C6 00            [ 1] 1436     ld a,#LED2_MASK
      0088AE 02 C1 00         [ 1] 1437     xor a,PC_ODR
      0088B1 04 2A B8         [ 1] 1438     ld PC_ODR,a
      0088B4 CD               [ 4] 1439     ret 
                                   1440 
      0008B3                       1441 left_paren:
      0088B5 88 DC            [ 1] 1442 	ld a,#SPACE 
      0088B7 A1 01 27         [ 4] 1443 	call putc
      0088BA F1 A1            [ 1] 1444 	ld a,#'( 
      0088BC 00 01 CB         [ 4] 1445 	call putc 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0088BD 81               [ 4] 1446 	ret 
                                   1447 
                                   1448 ;------------------------------
                                   1449 ; print 8 bit register 
                                   1450 ; input:
                                   1451 ;   X  point to register name 
                                   1452 ;   A  register value to print 
                                   1453 ; output:
                                   1454 ;   none
                                   1455 ;------------------------------- 
      0008BE                       1456 prt_reg8:
      0088BD A1               [ 1] 1457 	push a 
      0088BE 05 26 05         [ 4] 1458 	call puts 
      0088C1 CD 94            [ 1] 1459 	ld a,(1,sp) 
      0088C3 8A 20 E6         [ 1] 1460 	ld acc8,a 
      0088C6 5F               [ 1] 1461 	clrw x 
      0088C6 A1               [ 1] 1462 	ld xl,a 
      0088C7 02 26 08 CD      [ 1] 1463 	mov base,#16
      0088CB 92 CF CD         [ 4] 1464 	call print_int 
      0088CE 94 8A 20         [ 4] 1465 	call left_paren 
      0088D1 DA               [ 1] 1466 	pop a 
      0088D2 5F               [ 1] 1467 	clrw x 
      0088D2 A1               [ 1] 1468 	ld xl,a 
      0088D3 06 26 03 FD      [ 1] 1469 	mov base,#10 
      0088D7 20 D3 F5         [ 4] 1470 	call print_int  
      0088D9 A6 29            [ 1] 1471 	ld a,#') 
      0088D9 CC 88 15         [ 4] 1472 	call putc
      0088DC 81               [ 4] 1473 	ret
                                   1474 
                                   1475 ;--------------------------------
                                   1476 ; print 16 bits register 
                                   1477 ; input:
                                   1478 ;   X   point register name 
                                   1479 ;   Y   register value to print 
                                   1480 ; output:
                                   1481 ;  none
                                   1482 ;--------------------------------
      0008E3                       1483 prt_reg16: 
      0088DC C6 00            [ 2] 1484 	pushw y 
      0088DE 02 C0 00         [ 4] 1485 	call puts 
      0088E1 04 27            [ 2] 1486 	ldw x,(1,sp) 
      0088E3 3B 55 00 02      [ 1] 1487 	mov base,#16 
      0088E7 00 03 CE         [ 4] 1488 	call print_int  
      0088EA 00 05 72         [ 4] 1489 	call left_paren 
      0088ED D6               [ 2] 1490 	popw x 
      0088EE 00 01 72 5C      [ 1] 1491 	mov base,#10 
      0088F2 00 02 A1         [ 4] 1492 	call print_int  
      0088F5 02 23            [ 1] 1493 	ld a,#') 
      0088F7 27 A1 03         [ 4] 1494 	call putc
      0088FA 26               [ 4] 1495 	ret 
                                   1496 
                                   1497 ;------------------------------------
                                   1498 ; print registers contents saved on
                                   1499 ; stack by trap interrupt.
                                   1500 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      000902                       1501 print_registers:
      0088FB 0D 72 D6         [ 2] 1502 	ldw x,#STATES
      0088FE 00 01 72         [ 4] 1503 	call puts
                                   1504 ; print EPC 
      008901 5C 00 02         [ 2] 1505 	ldw x, #REG_EPC
      008904 5F 97 A6         [ 4] 1506 	call puts 
      008907 03 81            [ 1] 1507 	ld a, (11,sp)
      008909 A1 0A 25         [ 1] 1508 	ld acc8,a 
      00890C 06 72            [ 1] 1509 	ld a, (10,sp) 
      00890E BB 00 01         [ 1] 1510 	ld acc16,a 
      008911 20 0C            [ 1] 1511 	ld a,(9,sp) 
      008913 72 DE 00         [ 1] 1512 	ld acc24,a
      008916 01               [ 1] 1513 	clrw x  
      008917 72 5C            [ 1] 1514 	ld a,#16
      008919 00 02 72         [ 4] 1515 	call prti24  
                                   1516 ; print X
      00891C 5C 00 02         [ 2] 1517 	ldw x,#REG_X
      00891F 81 05            [ 2] 1518 	ldw y,(5,sp)
      008920 CD 08 E3         [ 4] 1519 	call prt_reg16  
                                   1520 ; print Y 
      008920 72 1A 50         [ 2] 1521 	ldw x,#REG_Y
      008923 0A 81            [ 2] 1522 	ldw y, (7,sp)
      008925 CD 08 E3         [ 4] 1523 	call prt_reg16  
                                   1524 ; print A 
      008925 72 1B 50         [ 2] 1525 	ldw x,#REG_A
      008928 0A 81            [ 1] 1526 	ld a, (4,sp) 
      00892A CD 08 BE         [ 4] 1527 	call prt_reg8
                                   1528 ; print CC 
      00892A A6 20 C8         [ 2] 1529 	ldw x,#REG_CC 
      00892D 50 0A            [ 1] 1530 	ld a, (3,sp) 
      00892F C7 50 0A         [ 4] 1531 	call prt_reg8 
                                   1532 ; print SP 
      008932 81 09 A8         [ 2] 1533 	ldw x,#REG_SP
      008933 90 96            [ 1] 1534 	ldw y,sp 
      008933 A6 20 CD 82      [ 2] 1535 	addw y,#12
      008937 4B A6 28         [ 4] 1536 	call prt_reg16  
      00893A CD 82            [ 1] 1537 	ld a,#'\n' 
      00893C 4B 81 CB         [ 4] 1538 	call putc
      00893E 81               [ 4] 1539 	ret
                                   1540 
      00893E 88 CD 82 5D 7B 01 C7  1541 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             00 0A 5F 97 35 10 00
             07 CD 8A 75 CD 89 33
             84 5F 97 35 0A 00 07
             CD 8A 75 A6 29 CD 82
             4B 81 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      008963 45 50 43 3A 00        1542 REG_EPC: .asciz "EPC:"
      008963 90 89 CD 82           1543 REG_Y:   .asciz "\nY:" 
      008967 5D 1E 01 35           1544 REG_X:   .asciz "\nX:"
      00896B 10 00 07 CD           1545 REG_A:   .asciz "\nA:" 
      00896F 8A 75 CD 89 33        1546 REG_CC:  .asciz "\nCC:"
      008974 85 35 0A 00 07        1547 REG_SP:  .asciz "\nSP:"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1548 .endif ; DEBUG 
                                   1549 
                                   1550 ;------------------------------------
                                   1551 ; print integer in acc24 
                                   1552 ; input:
                                   1553 ;	acc24 		integer to print 
                                   1554 ;	A 			numerical base for conversion 
                                   1555 ;               if bit 7 is set add a space at print end.
                                   1556 ;   XL 			field width, 0 -> no fill.
                                   1557 ;  output:
                                   1558 ;    none 
                                   1559 ;------------------------------------
                           000001  1560 	WIDTH = 1
                           000002  1561 	BASE = 2
                           000003  1562 	ADD_SPACE=3 ; add a space after number 
                           000003  1563 	VSIZE = 3
      0009AD                       1564 prti24:
      0009AD                       1565 	_vars VSIZE 
      008979 CD 8A            [ 2]    1     sub sp,#VSIZE 
      00897B 75 A6            [ 1] 1566 	clr (ADD_SPACE,sp)
      00897D 29 CD            [ 1] 1567 	bcp a,#0x80 
      00897F 82 4B            [ 1] 1568 	jreq 0$ 
      008981 81 03            [ 1] 1569 	cpl (ADD_SPACE,sp)
      008982 A4 1F            [ 1] 1570 0$:	and a,#31 
      008982 AE 89            [ 1] 1571 	ld (BASE,sp),a
      008984 D5               [ 1] 1572 	ld a,xl
      008985 CD 82            [ 1] 1573 	ld (WIDTH,sp),a 
      008987 5D AE            [ 1] 1574 	ld a, (BASE,sp)  
      008989 8A 12 CD         [ 4] 1575     call itoa  ; conversion entier en  .asciz
      00898C 82 5D            [ 1] 1576 1$: ld a,(WIDTH,sp)
      00898E 7B 0B            [ 1] 1577 	jreq 4$
      008990 C7 00 0A         [ 1] 1578 	ld acc8,a 
      008993 7B               [ 2] 1579 	pushw x 
      008994 0A C7 00         [ 4] 1580 	call strlen 
      008997 09               [ 1] 1581 	ld a,xl 
      008998 7B               [ 2] 1582 	popw x 
      008999 09 C7 00         [ 3] 1583 	exg a,acc8 
      00899C 08 5F A6         [ 1] 1584 	sub a,acc8 
      00899F 10 CD            [ 1] 1585 	jrmi 4$
      0089A1 8A 2D            [ 1] 1586 	ld (WIDTH,sp),a 
      0089A3 AE 8A            [ 1] 1587 	ld  a,#SPACE
      0089A5 1B 16            [ 1] 1588 3$: tnz (WIDTH,sp)
      0089A7 05 CD            [ 1] 1589 	jreq 4$
      0089A9 89               [ 2] 1590 	decw x 
      0089AA 63               [ 1] 1591 	ld (x),a 
      0089AB AE 8A            [ 1] 1592 	dec (WIDTH,sp) 
      0089AD 17 16            [ 2] 1593 	jra 3$
      0009E6                       1594 4$: 
      0089AF 07 CD 89         [ 4] 1595 	call puts 
      0089B2 63 AE            [ 1] 1596 	tnz (ADD_SPACE,sp)
      0089B4 8A 1F            [ 1] 1597 	jreq 5$
      0089B6 7B 04            [ 1] 1598     ld a,#SPACE 
      0089B8 CD 89 3E         [ 4] 1599 	call putc 
      0009F2                       1600 5$: _drop VSIZE 
      0089BB AE 8A            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0089BD 23               [ 4] 1601     ret	
                                   1602 
                                   1603 ;-----------------------------------
                                   1604 ; print a 16 bit integer 
                                   1605 ; using variable 'base' as conversion
                                   1606 ; format.
                                   1607 ; input:
                                   1608 ;   X       integer to print 
                                   1609 ;   base    conversion base 
                                   1610 ; output:
                                   1611 ;   none 
                                   1612 ;-----------------------------------
                           000001  1613 	SIGN=1
                           000001  1614 	VSIZE=1
      0009F5                       1615 print_int: 
      0009F5                       1616 	_vars VSIZE 
      0089BE 7B 03            [ 2]    1     sub sp,#VSIZE 
      0089C0 CD 89            [ 1] 1617 	clr (SIGN,sp)
      0089C2 3E AE 8A 28      [ 2] 1618 	ldw y,#pad+PAD_SIZE-1 
      0089C6 90 96            [ 1] 1619 	clr (y)
      0089C8 72 A9 00         [ 1] 1620 	ld a,base  
      0089CB 0C CD            [ 1] 1621 	cp a,#10 
      0089CD 89 63            [ 1] 1622 	jrne 1$ 
      0089CF A6               [ 2] 1623 	tnzw x 
      0089D0 0A CD            [ 1] 1624 	jrpl 1$ 
      0089D2 82 4B            [ 1] 1625 	cpl (SIGN,sp)
      0089D4 81               [ 2] 1626 	negw x 	 
      000A0C                       1627 1$:	
      0089D5 0A 52 65         [ 1] 1628 	ld a,base 
      0089D8 67               [ 2] 1629 	div x,a 
      0089D9 69 73            [ 1] 1630 	add a,#'0 
      0089DB 74 65            [ 1] 1631 	cp a,#'9+1 
      0089DD 72 73            [ 1] 1632 	jrmi 2$ 
      0089DF 20 73            [ 1] 1633 	add a,#7 
      0089E1 74 61            [ 2] 1634 2$: decw y 
      0089E3 74 65            [ 1] 1635 	ld (y),a 
      0089E5 20               [ 2] 1636 	tnzw x 
      0089E6 61 74            [ 1] 1637 	jrne 1$ 
      0089E8 20 61            [ 1] 1638 	ld a,#16 
      0089EA 62 6F 72         [ 1] 1639 	cp a,base 
      0089ED 74 20            [ 1] 1640 	jrne 3$
      0089EF 70 6F            [ 1] 1641 	ld a,#'$
      0089F1 69 6E            [ 2] 1642 	decw y  
      0089F3 74 2E            [ 1] 1643 	ld (y),a
      0089F5 0A 2D            [ 2] 1644 	jra 9$ 
      0089F7 2D 2D            [ 1] 1645 3$: tnz (SIGN,sp)
      0089F9 2D 2D            [ 1] 1646 	jreq 9$ 
      0089FB 2D 2D            [ 1] 1647 	ld a,#'-
      0089FD 2D 2D            [ 2] 1648 	decw y  
      0089FF 2D 2D            [ 1] 1649 	ld (y),a
      000A38                       1650 9$:	
      008A01 2D               [ 1] 1651 	ldw x,y 
      008A02 2D 2D 2D         [ 2] 1652 	subw x,#pad+PAD_SIZE-1 
      008A05 2D               [ 2] 1653 	negw x  
      000A3D                       1654 10$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A06 2D 2D            [ 2] 1655 	decw y 
      008A08 2D 2D            [ 1] 1656 	ld a,#SPACE 
      008A0A 2D 2D            [ 1] 1657 	ld (y),a
      008A0C 2D               [ 2] 1658 	incw x 
      008A0D 2D               [ 1] 1659 	ld a,xl 
      008A0E 2D 2D 0A         [ 1] 1660 	cp a,tab_width
      008A11 00 45            [ 1] 1661 	jrmi 10$ 
      000A4A                       1662 12$:
      008A13 50               [ 1] 1663     ldw x,y 
      008A14 43 3A 00         [ 4] 1664 	call puts  
      000A4E                       1665 	_drop VSIZE 
      008A17 0A 59            [ 2]    1     addw sp,#VSIZE 
      008A19 3A               [ 4] 1666 	ret 
                                   1667 
                                   1668 ;------------------------------------
                                   1669 ; convert integer in acc24 to string
                                   1670 ; input:
                                   1671 ;   A	  	base
                                   1672 ;	acc24	integer to convert
                                   1673 ; output:
                                   1674 ;   X  		pointer to string
                                   1675 ;------------------------------------
                           000001  1676 	SIGN=1  ; integer sign 
                           000002  1677 	BASE=2  ; numeric base 
                           000002  1678 	VSIZE=2  ;locals size
      000A51                       1679 itoa:
      008A1A 00 0A            [ 2] 1680 	sub sp,#VSIZE
      008A1C 58 3A            [ 1] 1681 	ld (BASE,sp), a  ; base
      008A1E 00 0A            [ 1] 1682 	clr (SIGN,sp)    ; sign
      008A20 41 3A            [ 1] 1683 	cp a,#10
      008A22 00 0A            [ 1] 1684 	jrne 1$
                                   1685 	; base 10 string display with negative sign if bit 23==1
      008A24 43 43 3A 00 0A   [ 2] 1686 	btjf acc24,#7,1$
      008A29 53 50            [ 1] 1687 	cpl (SIGN,sp)
      008A2B 3A 00 C0         [ 4] 1688 	call neg_acc24
      008A2D                       1689 1$:
                                   1690 ; initialize string pointer 
      008A2D 52 03 0F         [ 2] 1691 	ldw x,#pad+PAD_SIZE-1
      008A30 03               [ 1] 1692 	clr (x)
      000A69                       1693 itoa_loop:
      008A31 A5 80            [ 1] 1694     ld a,(BASE,sp)
      008A33 27 02 03         [ 4] 1695     call divu24_8 ; acc24/A 
      008A36 03 A4            [ 1] 1696     add a,#'0  ; remainder of division
      008A38 1F 6B            [ 1] 1697     cp a,#'9+1
      008A3A 02 9F            [ 1] 1698     jrmi 2$
      008A3C 6B 01            [ 1] 1699     add a,#7 
      008A3E 7B               [ 2] 1700 2$: decw x
      008A3F 02               [ 1] 1701     ld (x),a
                                   1702 	; if acc24==0 conversion done
      008A40 CD 8A D1         [ 1] 1703 	ld a,acc24
      008A43 7B 01 27         [ 1] 1704 	or a,acc16
      008A46 1F C7 00         [ 1] 1705 	or a,acc8
      008A49 0A 89            [ 1] 1706     jrne itoa_loop
                                   1707 	;conversion done, next add '$' or '-' as required
      008A4B CD 83            [ 1] 1708 	ld a,(BASE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A4D 1F 9F            [ 1] 1709 	cp a,#16
      008A4F 85 31            [ 1] 1710 	jreq 8$
      008A51 00 0A            [ 1] 1711 	ld a,(SIGN,sp)
      008A53 C0 00            [ 1] 1712     jreq 10$
      008A55 0A 2B            [ 1] 1713     ld a,#'-
      008A57 0E 6B            [ 2] 1714 	jra 9$ 
      008A59 01 A6            [ 1] 1715 8$: ld a,#'$ 
      008A5B 20               [ 2] 1716 9$: decw x
      008A5C 0D               [ 1] 1717     ld (x),a
      000A95                       1718 10$:
      008A5D 01 27            [ 2] 1719 	addw sp,#VSIZE
      008A5F 06               [ 4] 1720 	ret
                                   1721 
                                   1722 ;-------------------------------------
                                   1723 ; divide uint24_t by uint8_t
                                   1724 ; used to convert uint24_t to string
                                   1725 ; input:
                                   1726 ;	acc24	dividend
                                   1727 ;   A 		divisor
                                   1728 ; output:
                                   1729 ;   acc24	quotient
                                   1730 ;   A		remainder
                                   1731 ;------------------------------------- 
                                   1732 ; offset  on sp of arguments and locals
                           000001  1733 	U8   = 1   ; divisor on stack
                           000001  1734 	VSIZE =1
      000A98                       1735 divu24_8:
      008A60 5A               [ 2] 1736 	pushw x ; save x
      008A61 F7               [ 1] 1737 	push a 
                                   1738 	; ld dividend UU:MM bytes in X
      008A62 0A 01 20         [ 1] 1739 	ld a, acc24
      008A65 F6               [ 1] 1740 	ld xh,a
      008A66 C6 00 08         [ 1] 1741 	ld a,acc24+1
      008A66 CD               [ 1] 1742 	ld xl,a
      008A67 82 5D            [ 1] 1743 	ld a,(U8,SP) ; divisor
      008A69 0D               [ 2] 1744 	div x,a ; UU:MM/U8
      008A6A 03               [ 1] 1745 	push a  ;save remainder
      008A6B 27               [ 1] 1746 	ld a,xh
      008A6C 05 A6 20         [ 1] 1747 	ld acc24,a
      008A6F CD               [ 1] 1748 	ld a,xl
      008A70 82 4B 5B         [ 1] 1749 	ld acc24+1,a
      008A73 03               [ 1] 1750 	pop a
      008A74 81               [ 1] 1751 	ld xh,a
      008A75 C6 00 09         [ 1] 1752 	ld a,acc24+2
      008A75 52               [ 1] 1753 	ld xl,a
      008A76 01 0F            [ 1] 1754 	ld a,(U8,sp) ; divisor
      008A78 01               [ 2] 1755 	div x,a  ; R:LL/U8
      008A79 90 AE            [ 1] 1756 	ld (U8,sp),a ; save remainder
      008A7B 17               [ 1] 1757 	ld a,xl
      008A7C 3F 90 7F         [ 1] 1758 	ld acc24+2,a
      008A7F C6               [ 1] 1759 	pop a
      008A80 00               [ 2] 1760 	popw x
      008A81 07               [ 4] 1761 	ret
                                   1762 
                                   1763 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1764 ;  two's complement acc24
                                   1765 ;  input:
                                   1766 ;		acc24 variable
                                   1767 ;  output:
                                   1768 ;		acc24 variable
                                   1769 ;-------------------------------------
      000AC0                       1770 neg_acc24:
      008A82 A1 0A 26 06      [ 1] 1771 	cpl acc24+2
      008A86 5D 2A 03 03      [ 1] 1772 	cpl acc24+1
      008A8A 01 50 00 07      [ 1] 1773 	cpl acc24
      008A8C A6 01            [ 1] 1774 	ld a,#1
      008A8C C6 00 07         [ 1] 1775 	add a,acc24+2
      008A8F 62 AB 30         [ 1] 1776 	ld acc24+2,a
      008A92 A1               [ 1] 1777 	clr a
      008A93 3A 2B 02         [ 1] 1778 	adc a,acc24+1
      008A96 AB 07 90         [ 1] 1779 	ld acc24+1,a 
      008A99 5A               [ 1] 1780 	clr a 
      008A9A 90 F7 5D         [ 1] 1781 	adc a,acc24 
      008A9D 26 ED A6         [ 1] 1782 	ld acc24,a 
      008AA0 10               [ 4] 1783 	ret
                                   1784 
                                   1785 
                                   1786 ;------------------------------------
                                   1787 ; read a line of text from terminal
                                   1788 ; input:
                                   1789 ;	none
                                   1790 ; local variable on stack:
                                   1791 ;	LL  line length
                                   1792 ;   RXCHAR last received chaaracte 
                                   1793 ; output:
                                   1794 ;   text in tib  buffer
                                   1795 ;------------------------------------
                                   1796 	; local variables
                           000001  1797 	LL_HB=1
                           000001  1798 	RXCHAR = 1 ; last char received
                           000002  1799 	LL = 2  ; accepted line length
                           000002  1800 	VSIZE=2 
      000AE3                       1801 readln:
      008AA1 C1               [ 1] 1802 	clrw x 
      008AA2 00               [ 2] 1803 	pushw x 
      008AA3 07 26 08 A6      [ 2] 1804  	ldw y,#tib ; input buffer
      000AE9                       1805 readln_loop:
      008AA7 24 90 5A         [ 4] 1806 	call getc
      008AAA 90 F7            [ 1] 1807 	ld (RXCHAR,sp),a
      008AAC 20 0A            [ 1] 1808 	cp a,#CR
      008AAE 0D 01            [ 1] 1809 	jrne 1$
      008AB0 27 06 A6         [ 2] 1810 	jp readln_quit
      008AB3 2D 90            [ 1] 1811 1$:	cp a,#NL
      008AB5 5A 90            [ 1] 1812 	jreq readln_quit
      008AB7 F7 08            [ 1] 1813 	cp a,#BSP
      008AB8 27 3D            [ 1] 1814 	jreq del_back
      008AB8 93 1D            [ 1] 1815 	cp a,#CTRL_D
      008ABA 17 3F            [ 1] 1816 	jreq del_ln
      008ABC 50 12            [ 1] 1817 	cp a,#CTRL_R 
      008ABD 27 06            [ 1] 1818 	jreq reprint 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1819 ;	cp a,#'[
                                   1820 ;	jreq ansi_seq
      000B05                       1821 final_test:
      008ABD 90 5A            [ 1] 1822 	cp a,#SPACE
      008ABF A6 20            [ 1] 1823 	jrpl accept_char
      008AC1 90 F7            [ 2] 1824 	jra readln_loop
      000B0B                       1825 ansi_seq:
                                   1826 ;	call getc
                                   1827 ;	cp a,#'C 
                                   1828 ;	jreq rigth_arrow
                                   1829 ;	cp a,#'D 
                                   1830 ;	jreq left_arrow 
                                   1831 ;	jra final_test
      000B0B                       1832 right_arrow:
                                   1833 ;	ld a,#BSP 
                                   1834 ;	call putc 
                                   1835 ;	jra realn_loop 
      000B0B                       1836 left_arrow:
                                   1837 
                                   1838 ;	jra readln_loop
      000B0B                       1839 reprint: 
      008AC3 5C 9F            [ 1] 1840 	tnz (LL,sp)
      008AC5 C1 00            [ 1] 1841 	jrne readln_loop
      008AC7 23 2B F3         [ 2] 1842 	ldw x,#tib 
      008ACA CD 02 9F         [ 4] 1843 	call strlen 
      008ACA 93 CD 82 5D      [ 2] 1844 	ldw y,#tib 
      008ACE 5B               [ 1] 1845 	ld a,xl
      008ACF 01 81            [ 1] 1846 	jreq readln_loop
      008AD1 6B 02            [ 1] 1847 	ld (LL,sp),a 
      008AD1 52 02 6B         [ 2] 1848 	ldw x,#tib 
      008AD4 02 0F 01         [ 4] 1849 	call puts
      008AD7 A1 0A            [ 1] 1850 	clr (LL_HB,sp)
      008AD9 26 0A 72         [ 2] 1851 	addw y,(LL_HB,sp)
      008ADC 0F 00            [ 2] 1852 	jra readln_loop 
      000B2B                       1853 del_ln:
      008ADE 08 05            [ 1] 1854 	ld a,(LL,sp)
      008AE0 03 01 CD         [ 4] 1855 	call delete
      008AE3 8B 40 16 C8      [ 2] 1856 	ldw y,#tib
      008AE5 90 7F            [ 1] 1857 	clr (y)
      008AE5 AE 17            [ 1] 1858 	clr (LL,sp)
      008AE7 3F 7F            [ 2] 1859 	jra readln_loop
      008AE9                       1860 del_back:
      008AE9 7B 02            [ 1] 1861     tnz (LL,sp)
      008AEB CD 8B            [ 1] 1862     jreq readln_loop
      008AED 18 AB            [ 1] 1863     dec (LL,sp)
      008AEF 30 A1            [ 2] 1864     decw y
      008AF1 3A 2B            [ 1] 1865     clr  (y)
      008AF3 02 AB 07         [ 4] 1866     call bksp 
      008AF6 5A F7            [ 2] 1867     jra readln_loop	
      000B49                       1868 accept_char:
      008AF8 C6 00            [ 1] 1869 	ld a,#TIB_SIZE-1
      008AFA 08 CA            [ 1] 1870 	cp a, (LL,sp)
      008AFC 00 09            [ 1] 1871 	jreq readln_loop
      008AFE CA 00            [ 1] 1872 	ld a,(RXCHAR,sp)
      008B00 0A 26            [ 1] 1873 	ld (y),a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B02 E6 7B            [ 1] 1874 	inc (LL,sp)
      008B04 02 A1            [ 2] 1875 	incw y
      008B06 10 27            [ 1] 1876 	clr (y)
      008B08 08 7B 01         [ 4] 1877 	call putc 
      008B0B 27 08            [ 2] 1878 	jra readln_loop
      000B5E                       1879 readln_quit:
      008B0D A6 2D            [ 1] 1880 	clr (y)
      008B0F 20 02            [ 1] 1881 	ld a,(LL,sp)
      008B11 A6 24 5A         [ 1] 1882 	ld count,a 
      000B65                       1883 	_drop VSIZE 
      008B14 F7 02            [ 2]    1     addw sp,#VSIZE 
      008B15 A6 0D            [ 1] 1884 	ld a,#CR
      008B15 5B 02 81         [ 4] 1885 	call putc
      008B18 81               [ 4] 1886 	ret
                                   1887 
                           000001  1888 .if DEBUG 	
                                   1889 ;----------------------------
                                   1890 ; command interface
                                   1891 ; only 3 commands:
                                   1892 ;  'q' to resume application
                                   1893 ;  'p [addr]' to print memory values 
                                   1894 ;  's addr' to print string 
                                   1895 ;----------------------------
                                   1896 ;local variable 
                           000001  1897 	PSIZE=1
                           000001  1898 	VSIZE=1 
      000B6D                       1899 cmd_itf:
      008B18 89 88            [ 2] 1900 	sub sp,#VSIZE 
      008B1A C6 00 08 95      [ 1] 1901 	clr farptr 
      008B1E C6 00 09 97      [ 1] 1902 	clr farptr+1 
      008B22 7B 01 62 88      [ 1] 1903 	clr farptr+2  
      000B7B                       1904 repl:
      008B26 9E C7            [ 1] 1905 	ld a,#CR 
      008B28 00 08 9F         [ 4] 1906 	call putc 
      008B2B C7 00            [ 1] 1907 	ld a,#'? 
      008B2D 09 84 95         [ 4] 1908 	call putc
      008B30 C6 00 0A 97      [ 1] 1909 	clr in.w 
      008B34 7B 01 62 6B      [ 1] 1910 	clr in 
      008B38 01 9F C7         [ 4] 1911 	call readln
      008B3B 00 0A 84 85      [ 2] 1912 	ldw y,#tib  
      008B3F 81 F6            [ 1] 1913 	ld a,(y)
      008B40 27 E3            [ 1] 1914 	jreq repl  
      008B40 72 53 00 0A      [ 1] 1915 	inc in 
      008B44 72 53 00         [ 4] 1916 	call to_upper 
      008B47 09 72            [ 1] 1917 	cp a,#'Q 
      008B49 53 00            [ 1] 1918 	jrne test_p
      000BA3                       1919 repl_exit:
      008B4B 08 A6 01 CB      [ 1] 1920 	clr tib 
      008B4F 00 0A C7 00      [ 1] 1921 	clr count 
      008B53 0A 4F C9 00      [ 1] 1922 	clr in 
      000BAF                       1923 	_drop #VSIZE 	
      008B57 09 C7            [ 2]    1     addw sp,##VSIZE 
      008B59 00               [ 4] 1924 	ret  
      000BB2                       1925 invalid:
      008B5A 09 4F C9         [ 2] 1926 	ldw x,#invalid_cmd 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B5D 00 08 C7         [ 4] 1927 	call puts 
      008B60 00 08            [ 2] 1928 	jra repl 
      000BBA                       1929 test_p:	
      008B62 81 50            [ 1] 1930     cp a,#'P 
      008B63 27 11            [ 1] 1931 	jreq mem_peek
      008B63 5F 89            [ 1] 1932     cp a,#'S 
      008B65 90 AE            [ 1] 1933 	jrne invalid 
      000BC2                       1934 print_string:	
      008B67 16 C8 5C         [ 4] 1935 	call get_token
      008B69 A1 04            [ 1] 1936 	cp a,#TK_INTGR 
      008B69 CD 82            [ 1] 1937 	jrne invalid 
      008B6B 54 6B 01         [ 4] 1938 	call puts
      008B6E A1 0D 26         [ 2] 1939 	jp repl 	
      000BCF                       1940 mem_peek:
      008B71 03 CC            [ 1] 1941 	ld a,#SPACE 
      008B73 8B DE A1         [ 4] 1942 	call skip  	 
      008B76 0A 27 65 A1      [ 2] 1943 	addw y,in.w 
      008B7A 08 27 3D         [ 2] 1944 	ldw x,#pad 
      008B7D A1 04 27         [ 4] 1945 	call strcpy
      008B80 2A A1 12         [ 4] 1946 	call atoi24 	
      008B83 27 06 07         [ 1] 1947 	ld a, acc24 
      008B85 CA 00 08         [ 1] 1948 	or a,acc16 
      008B85 A1 20 2A         [ 1] 1949 	or a,acc8 
      008B88 40 20            [ 1] 1950 	jrne 1$ 
      008B8A DE 0C            [ 2] 1951 	jra peek_byte  
      008B8B CE 00 07         [ 2] 1952 1$:	ldw x,acc24 
      008B8B CF 00 12         [ 2] 1953 	ldw farptr,x 
      008B8B C6 00 09         [ 1] 1954 	ld a,acc8 
      008B8B C7 00 14         [ 1] 1955 	ld farptr+2,a 
      000BFA                       1956 peek_byte:
      008B8B 0D 02 26         [ 4] 1957 	call print_farptr 
      008B8E DA AE            [ 1] 1958 	ld a,#8 
      008B90 16 C8            [ 1] 1959 	ld (PSIZE,sp),a 
      008B92 CD               [ 1] 1960 	clrw x 
      008B93 83 1F 90         [ 4] 1961 1$:	call fetchc  
      008B96 AE               [ 2] 1962 	pushw x 
      008B97 16 C8 9F         [ 1] 1963 	ld acc8,a 
      008B9A 27               [ 1] 1964 	clrw x 
      008B9B CD 6B 02         [ 2] 1965 	ldw acc24,x 
      008B9E AE 16            [ 1] 1966 	ld a,#16+128
      008BA0 C8 CD 82         [ 4] 1967 	call prti24
      008BA3 5D               [ 2] 1968 	popw x 
      008BA4 0F 01            [ 1] 1969 	dec (PSIZE,sp)
      008BA6 72 F9            [ 1] 1970 	jrne 1$ 
      008BA8 01 20            [ 1] 1971 	ld a,#8 
      008BAA BE 00 14         [ 1] 1972 	add a,farptr+2 
      008BAB C7 00 14         [ 1] 1973 	ld farptr+2,a
      008BAB 7B               [ 1] 1974 	clr a 
      008BAC 02 CD 82         [ 1] 1975 	adc a,farptr+1 
      008BAF 77 90 AE         [ 1] 1976 	ld farptr+1,a 
      008BB2 16               [ 1] 1977 	clr a 
      008BB3 C8 90 7F         [ 1] 1978 	adc a,farptr 
      008BB6 0F 02 20         [ 1] 1979 	ld farptr,a 
      008BB9 AF 0B 7B         [ 2] 1980 	jp repl  
                                   1981 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008BBA 6E 6F 74 20 61 20 63  1982 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1983 
                                   1984 ;----------------------------
                                   1985 ; display farptr address
                                   1986 ;----------------------------
      000C3F                       1987 print_farptr:
      008BBA 0D 02 27         [ 1] 1988 	ld a ,farptr+2 
      008BBD AB 0A 02         [ 1] 1989 	ld acc8,a 
      008BC0 90 5A 90         [ 2] 1990 	ldw x,farptr 
      008BC3 7F CD 82         [ 2] 1991 	ldw acc24,x 
      008BC6 67               [ 1] 1992 	clrw x 
      008BC7 20 A0            [ 1] 1993 	ld a,#16 
      008BC9 CD 09 AD         [ 4] 1994 	call prti24
      008BC9 A6 4F            [ 1] 1995 	ld a,#SPACE 
      008BCB 11 02 27         [ 4] 1996 	call putc 
      008BCE 9A 7B 01         [ 4] 1997 	call putc 
      008BD1 90               [ 4] 1998 	ret
                                   1999 
                                   2000 ;------------------------------------
                                   2001 ; get byte at address farptr[X]
                                   2002 ; input:
                                   2003 ;	 farptr   address to peek
                                   2004 ;    X		  farptr index 	
                                   2005 ; output:
                                   2006 ;	 A 		  byte from memory  
                                   2007 ;    x		  incremented by 1
                                   2008 ;------------------------------------
      000C5A                       2009 fetchc: ; @C
      008BD2 F7 0C 02 90      [ 5] 2010 	ldf a,([farptr],x)
      008BD6 5C               [ 2] 2011 	incw x
      008BD7 90               [ 4] 2012 	ret
                                   2013 
                                   2014 
                                   2015 ;------------------------------------
                                   2016 ; expect a number from command line 
                                   2017 ; next argument
                                   2018 ;  input:
                                   2019 ;	  none
                                   2020 ;  output:
                                   2021 ;    acc24   int24_t 
                                   2022 ;------------------------------------
      000C60                       2023 number::
      008BD8 7F CD 82         [ 4] 2024 	call get_token
      008BDB 4B 20 8B         [ 4] 2025 	call atoi24
      008BDE 81               [ 4] 2026 	ret
                                   2027 .endif ; DEBUG 
                                   2028 
                                   2029 ;------------------------------------
                                   2030 ; parse quoted string 
                                   2031 ; input:
                                   2032 ;   Y 	pointer to tib 
                                   2033 ;   X   pointer to pad
                                   2034 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2035 ;	pad   parsed string
                                   2036 ;   TOS  char* to pad  
                                   2037 ;------------------------------------
                           000001  2038 	PREV = 1
                           000002  2039 	CURR =2 
                           000002  2040 	VSIZE=2 
      000C67                       2041 parse_quote: ; { -- addr }
      000C67                       2042 	_vars VSIZE 
      008BDE 90 7F            [ 2]    1     sub sp,#VSIZE 
      008BE0 7B               [ 1] 2043 	clr a
      008BE1 02 C7            [ 1] 2044 1$:	ld (PREV,sp),a 
      008BE3 00 04 5B 02      [ 1] 2045 2$:	inc in
      008BE7 A6 0D CD         [ 4] 2046 	ld a,([in.w],y)
      008BEA 82 4B            [ 1] 2047 	jreq 6$
      008BEC 81 02            [ 1] 2048 	ld (CURR,sp),a 
      008BED A6 5C            [ 1] 2049 	ld a,#'\
      008BED 52 01            [ 1] 2050 	cp a, (PREV,sp)
      008BEF 72 5F            [ 1] 2051 	jrne 3$
      008BF1 00 13            [ 1] 2052 	clr (PREV,sp)
      008BF3 72 5F            [ 1] 2053 	ld a,(CURR,sp)
      008BF5 00 14            [ 4] 2054 	callr convert_escape
      008BF7 72               [ 1] 2055 	ld (x),a 
      008BF8 5F               [ 2] 2056 	incw x 
      008BF9 00 15            [ 2] 2057 	jra 2$
      008BFB                       2058 3$:
      008BFB A6 0D            [ 1] 2059 	ld a,(CURR,sp)
      008BFD CD 82            [ 1] 2060 	cp a,#'\'
      008BFF 4B A6            [ 1] 2061 	jreq 1$
      008C01 3F CD            [ 1] 2062 	cp a,#'"
      008C03 82 4B            [ 1] 2063 	jreq 5$ 
      008C05 72               [ 1] 2064 	ld (x),a 
      008C06 5F               [ 2] 2065 	incw x 
      008C07 00 01            [ 2] 2066 	jra 2$
      008C09 72 5F 00 02      [ 1] 2067 5$:	inc in 
      008C0D CD               [ 1] 2068 6$: clr (x)
      008C0E 8B 63 90         [ 2] 2069 	ldw x,#pad 
      000C9D                       2070 	_drop VSIZE
      008C11 AE 16            [ 2]    1     addw sp,#VSIZE 
      008C13 C8 90            [ 1] 2071 	ld a,#TK_QSTR  
      008C15 F6               [ 4] 2072 	ret 
                                   2073 
                                   2074 ;---------------------------------------
                                   2075 ; called by parse_quote
                                   2076 ; subtitute escaped character 
                                   2077 ; by their ASCII value .
                                   2078 ; input:
                                   2079 ;   A  character following '\'
                                   2080 ; output:
                                   2081 ;   A  substitued char or same if not valid.
                                   2082 ;---------------------------------------
      000CA2                       2083 convert_escape:
      008C16 27               [ 2] 2084 	pushw x 
      008C17 E3 72 5C         [ 2] 2085 	ldw x,#escaped 
      008C1A 00               [ 1] 2086 1$:	cp a,(x)
      008C1B 02 CD            [ 1] 2087 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C1D 8F               [ 1] 2088 	tnz (x)
      008C1E 9D A1            [ 1] 2089 	jreq 3$
      008C20 51               [ 2] 2090 	incw x 
      008C21 26 17            [ 2] 2091 	jra 1$
      008C23 1D 0C B7         [ 2] 2092 2$: subw x,#escaped 
      008C23 72               [ 1] 2093 	ld a,xl 
      008C24 5F 16            [ 1] 2094 	add a,#7
      008C26 C8               [ 2] 2095 3$:	popw x 
      008C27 72               [ 4] 2096 	ret 
                                   2097 
      008C28 5F 00 04 72 5F 00 02  2098 escaped: .asciz "abtnvfr"
             5B
                                   2099 
                                   2100 ;-------------------------
                                   2101 ; integer parser 
                                   2102 ; input:
                                   2103 ;   X 		point to pad 
                                   2104 ;   Y 		point to tib 
                                   2105 ;   A 	    first digit|'$' 
                                   2106 ; output:  
                                   2107 ;   pad     number string 
                                   2108 ;   X 		integer 
                                   2109 ;   A 		TK_INTGR
                                   2110 ;-------------------------
                           000001  2111 	BASE=1
                           000002  2112 	TCHAR=2 
                           000002  2113 	VSIZE=2 
      000CBF                       2114 parse_integer: ; { -- n }
      008C30 01 81            [ 1] 2115 	push #0 ; TCHAR 
      008C32 A1 24            [ 1] 2116 	cp a,#'$
      008C32 AE 8C            [ 1] 2117 	jreq 1$ 
      008C34 B0 CD            [ 1] 2118 	push #10 ; BASE=10 
      008C36 82 5D            [ 2] 2119 	jra 2$ 
      008C38 20 C1            [ 1] 2120 1$: push #16  ; BASE=16
      008C3A F7               [ 1] 2121 2$:	ld (x),a 
      008C3A A1               [ 2] 2122 	incw x 
      008C3B 50 27 11 A1      [ 1] 2123 	inc in 
      008C3F 53 26 F0         [ 4] 2124 	ld a,([in.w],y)
      008C42 CD 0F 1D         [ 4] 2125 	call to_upper 
      008C42 CD 8D            [ 1] 2126 	ld (TCHAR,sp),a 
      008C44 DC A1 04         [ 4] 2127 	call is_digit 
      008C47 26 E9            [ 1] 2128 	jrc 2$
      008C49 CD 82            [ 1] 2129 	ld a,#16 
      008C4B 5D CC            [ 1] 2130 	cp a,(BASE,sp)
      008C4D 8B FB            [ 1] 2131 	jrne 3$ 
      008C4F 7B 02            [ 1] 2132 	ld a,(TCHAR,sp)
      008C4F A6 20            [ 1] 2133 	cp a,#'A 
      008C51 CD 90            [ 1] 2134 	jrmi 3$ 
      008C53 55 72            [ 1] 2135 	cp a,#'G 
      008C55 B9 00            [ 1] 2136 	jrmi 2$ 
      008C57 01               [ 1] 2137 3$:	clr (x)
      008C58 AE 17 18         [ 4] 2138 	call atoi24
      008C5B CD 83 3D         [ 2] 2139 	ldw x,acc16 
      008C5E CD 8F            [ 1] 2140 	ld a,#TK_INTGR
      000CF7                       2141 	_drop VSIZE  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C60 A9 C6            [ 2]    1     addw sp,#VSIZE 
      008C62 00               [ 4] 2142 	ret 	
                                   2143 
                                   2144 ;-------------------------
                                   2145 ; binary integer parser 
                                   2146 ; input:
                                   2147 ;   X 		point to pad 
                                   2148 ;   Y 		point to tib 
                                   2149 ;   A 	    '%' 
                                   2150 ; output:  
                                   2151 ;   pad     number string 
                                   2152 ;   X 		integer 
                                   2153 ;   A 		TK_INTGR
                                   2154 ;   TOS     integer 
                                   2155 ;-------------------------
                           000001  2156 	BINARY=1
                           000002  2157 	VSIZE=2
      000CFA                       2158 parse_binary: ; { -- n }
      008C63 08 CA            [ 1] 2159 	push #0
      008C65 00 09            [ 1] 2160 	push #0
      008C67 CA               [ 1] 2161 1$: ld (x),a 
      008C68 00               [ 2] 2162 	incw x 
      008C69 0A 26 02 20      [ 1] 2163 	inc in 
      008C6D 0C CE 00         [ 4] 2164 	ld a,([in.w],y)
      008C70 08 CF            [ 1] 2165 	cp a,#'0 
      008C72 00 13            [ 1] 2166 	jreq 2$
      008C74 C6 00            [ 1] 2167 	cp a,#'1 
      008C76 0A C7            [ 1] 2168 	jreq 2$ 
      008C78 00 15            [ 2] 2169 	jra bin_exit 
      008C7A A0 30            [ 1] 2170 2$: sub a,#'0	
      008C7A CD               [ 1] 2171 	rrc a 
      008C7B 8C BF            [ 1] 2172 	rlc (BINARY+1,sp)
      008C7D A6 08            [ 1] 2173 	rlc (BINARY,sp)
      008C7F 6B 01            [ 2] 2174 	jra 1$  
      000D1A                       2175 bin_exit:
      008C81 5F               [ 1] 2176 	clr (x)
      008C82 CD 8C            [ 2] 2177 	ldw x,(BINARY,sp)
      008C84 DA 89            [ 1] 2178 	ld a,#TK_INTGR 	
      000D1F                       2179 	_drop VSIZE 
      008C86 C7 00            [ 2]    1     addw sp,#VSIZE 
      008C88 0A               [ 4] 2180 	ret
                                   2181 
                                   2182 ;---------------------------
                                   2183 ;  token begin with a letter,
                                   2184 ;  is keyword or variable. 	
                                   2185 ; input:
                                   2186 ;   X 		point to pad 
                                   2187 ;   Y 		point to text
                                   2188 ;   A 	    first letter  
                                   2189 ; output:
                                   2190 ;   X		exec_addr|var_addr 
                                   2191 ;   A 		TK_CMD 
                                   2192 ;   pad 	keyword|var_name  
                                   2193 ;   TOS     exec_addr|var_addr 
                                   2194 ;--------------------------  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      000D22                       2195 parse_keyword: ; { -- exec_addr|var_addr}
      008C89 5F CF 00         [ 4] 2196 	call to_upper 
      008C8C 08               [ 1] 2197 	ld (x),a 
      008C8D A6               [ 2] 2198 	incw x 
      008C8E 90 CD 8A 2D      [ 1] 2199 	inc in 
      008C92 85 0A 01         [ 4] 2200 	ld a,([in.w],y)
      008C95 26 EB A6         [ 4] 2201 	call is_alpha 
      008C98 08 CB            [ 1] 2202 	jrc parse_keyword 
      008C9A 00               [ 1] 2203 1$: clr (x)
      008C9B 15 C7 00 15      [ 1] 2204 	tnz pad+1 
      008C9F 4F C9            [ 1] 2205 	jrne 2$
                                   2206 ; one letter variable name 
      008CA1 00 14 C7         [ 1] 2207 	ld a,pad 
      008CA4 00 14            [ 1] 2208 	sub a,#'A 
      008CA6 4F               [ 1] 2209 	sll a 
      008CA7 C9               [ 1] 2210 	push a 
      008CA8 00 13            [ 1] 2211 	push #0
      008CAA C7 00 13         [ 2] 2212 	ldw x,#vars 
      008CAD CC 8B FB         [ 2] 2213 	addw x,(1,sp) ; X=var address 
      000D49                       2214 	_drop 2 
      008CB0 6E 6F            [ 2]    1     addw sp,#2 
      008CB2 74 20            [ 1] 2215 	ld a,#TK_VAR 
      008CB4 61 20            [ 2] 2216 	jra 4$ 
      000D4F                       2217 2$: ; check for keyword, otherwise syntax error.
      000D4F                       2218 	_ldx_dict kword_dict
      008CB6 63 6F 6D         [ 2]    1     ldw x,#kword_dict+2
      008CB9 6D 61 6E         [ 4] 2219 	call search_dict
      008CBC 64               [ 1] 2220 	tnz a
      008CBD 0A 00            [ 1] 2221 	jrne 4$ 
      008CBF CC 07 95         [ 2] 2222 	jp syntax_error
      008CBF C6               [ 4] 2223 4$:	ret  	
                                   2224 
                                   2225 
                                   2226 ;------------------------------------
                                   2227 ; Command line tokenizer
                                   2228 ; scan text for next token
                                   2229 ; move token in 'pad'
                                   2230 ; input: 
      000D5C                       2231 	none: 
                                   2232 ; use:
                                   2233 ;	Y   pointer to text
                                   2234 ;   X	pointer to pad 
                                   2235 ;   in.w   index in text buffer
                                   2236 ; output:
                                   2237 ;   A       token attribute 
                                   2238 ;   pad 	token as .asciz
                                   2239 ;   X 		token value   
                                   2240 ;------------------------------------
                                   2241 	; use to check special character 
                                   2242 	.macro _case c t  
                                   2243 	ld a,#c 
                                   2244 	cp a,(TCHAR,sp) 
                                   2245 	jrne t
                                   2246 	.endm 
                                   2247 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                           000001  2248 	TCHAR=1
                           000002  2249 	ATTRIB=2 
                           000002  2250 	VSIZE=2
      000D5C                       2251 get_token: 
      008CC0 00 15 C7 00      [ 2] 2252 	ldw y,#tib    	
      008CC4 0A CE 00         [ 1] 2253 	ld a,in 
      008CC7 13 CF 00         [ 1] 2254 	cp a,count 
      008CCA 08 5F            [ 1] 2255 	jrmi 1$
      008CCC A6 10            [ 1] 2256 	ld a,#TK_NONE 
      008CCE CD               [ 4] 2257 	ret 
      000D6B                       2258 1$:	
      000D6B                       2259 	_vars VSIZE
      008CCF 8A 2D            [ 2]    1     sub sp,#VSIZE 
      008CD1 A6 20 CD         [ 2] 2260 	ldw x, #pad
      008CD4 82 4B            [ 1] 2261 	ld a,#SPACE
      008CD6 CD 82 4B         [ 4] 2262 	call skip
      008CD9 81 00 01 00 02   [ 1] 2263 	mov in.saved,in 
      008CDA 91 D6 00         [ 4] 2264 	ld a,([in.w],y)
      008CDA 92 AF            [ 1] 2265 	jrne str_tst
      008CDC 00 13 5C 81      [ 1] 2266 	clr pad 
      008CE0 CC 0F 11         [ 2] 2267 	jp token_exit ; end of line 
                                   2268 
      000D86                       2269 str_tst: ; check for quoted string  	
      008CE0 CD 8D DC         [ 4] 2270 	call to_upper 
      008CE3 CD 8F            [ 1] 2271 	ld (TCHAR,sp),a 
      000D8B                       2272 	_case '"' nbr_tst
      008CE5 A9 81            [ 1]    1 	ld a,#'"' 
      008CE7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CE7 52 02            [ 1]    3 	jrne nbr_tst
      008CE9 4F 6B 01         [ 4] 2273 	call parse_quote
      008CEC 72 5C 00         [ 2] 2274 	jp token_exit
      000D97                       2275 nbr_tst: ; check for number 
      008CEF 02 91            [ 1] 2276 	ld a,#'$'
      008CF1 D6 01            [ 1] 2277 	cp a,(TCHAR,sp) 
      008CF3 27 24            [ 1] 2278 	jreq 1$
      008CF5 6B 02            [ 1] 2279 	ld a,#'&
      008CF7 A6 5C            [ 1] 2280 	cp a,(TCHAR,sp)
      008CF9 11 01            [ 1] 2281 	jrne 0$
      008CFB 26 0A 0F         [ 4] 2282 	call parse_binary ; expect binary integer 
      008CFE 01 7B 02         [ 2] 2283 	jp token_exit 
      008D01 AD 1F            [ 1] 2284 0$:	ld a,(TCHAR,sp)
      008D03 F7 5C 20         [ 4] 2285 	call is_digit
      008D06 E5 06            [ 1] 2286 	jrnc 3$
      008D07 CD 0C BF         [ 4] 2287 1$:	call parse_integer 
      008D07 7B 02 A1         [ 2] 2288 	jp token_exit 
      000DB6                       2289 3$: 
      000DB6                       2290 	_case '(' bkslsh_tst 
      008D0A 5C 27            [ 1]    1 	ld a,#'(' 
      008D0C DD A1            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0E 22 27            [ 1]    3 	jrne bkslsh_tst
      008D10 04 F7            [ 1] 2291 	ld a,#TK_LPAREN
      008D12 5C 20 D7         [ 2] 2292 	jp token_char   	
      000DC1                       2293 bkslsh_tst:
      000DC1                       2294 	_case '\',rparnt_tst
      008D15 72 5C            [ 1]    1 	ld a,#'\' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D17 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D19 7F AE            [ 1]    3 	jrne rparnt_tst
      008D1B 17 18            [ 1] 2295 	ld a,(TCHAR,sp)
      008D1D 5B               [ 1] 2296 	ld (x),a 
      008D1E 02               [ 2] 2297 	incw x 
      008D1F A6 0A 81 01      [ 1] 2298 	inc in 
      008D22 91 D6 00         [ 4] 2299 	ld a,([in.w],y)
      008D22 89               [ 1] 2300 	ld (x),a 
      008D23 AE               [ 2] 2301 	incw x 
      008D24 8D 37 F1 27      [ 1] 2302 	inc in  
      008D28 06               [ 1] 2303 	clr (x) 
      008D29 7D               [ 1] 2304 	ld xl,a 
      008D2A 27 09            [ 1] 2305 	ld a,#TK_CHAR 
      008D2C 5C 20 F7         [ 2] 2306 	jp token_exit 
      000DDF                       2307 rparnt_tst:		
      000DDF                       2308 	_case ')' colon_tst 
      008D2F 1D 8D            [ 1]    1 	ld a,#')' 
      008D31 37 9F            [ 1]    2 	cp a,(TCHAR,sp) 
      008D33 AB 07            [ 1]    3 	jrne colon_tst
      008D35 85 81            [ 1] 2309 	ld a,#TK_RPAREN 
      008D37 61 62 74         [ 2] 2310 	jp token_char 
      000DEA                       2311 colon_tst:
      000DEA                       2312 	_case ':' comma_tst 
      008D3A 6E 76            [ 1]    1 	ld a,#':' 
      008D3C 66 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008D3E 00 05            [ 1]    3 	jrne comma_tst
      008D3F A6 01            [ 1] 2313 	ld a,#TK_COLON 
      008D3F 4B 00 A1         [ 2] 2314 	jp token_char 
      000DF5                       2315 comma_tst:
      000DF5                       2316 	_case COMMA sharp_tst 
      008D42 24 27            [ 1]    1 	ld a,#COMMA 
      008D44 04 4B            [ 1]    2 	cp a,(TCHAR,sp) 
      008D46 0A 20            [ 1]    3 	jrne sharp_tst
      008D48 02 4B            [ 1] 2317 	ld a,#TK_COMMA
      008D4A 10 F7 5C         [ 2] 2318 	jp token_char
      000E00                       2319 sharp_tst:
      000E00                       2320 	_case SHARP dash_tst 
      008D4D 72 5C            [ 1]    1 	ld a,#SHARP 
      008D4F 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D51 91 D6            [ 1]    3 	jrne dash_tst
      008D53 01 CD            [ 1] 2321 	ld a,#TK_SHARP
      008D55 8F 9D 6B         [ 2] 2322 	jp token_char  	 	 
      000E0B                       2323 dash_tst: 	
      000E0B                       2324 	_case '-' at_tst 
      008D58 02 CD            [ 1]    1 	ld a,#'-' 
      008D5A 8F 94            [ 1]    2 	cp a,(TCHAR,sp) 
      008D5C 25 ED            [ 1]    3 	jrne at_tst
      008D5E A6 10            [ 1] 2325 	ld a,#TK_MINUS  
      008D60 11 01 26         [ 2] 2326 	jp token_char 
      000E16                       2327 at_tst:
      000E16                       2328 	_case '@' qmark_tst 
      008D63 0A 7B            [ 1]    1 	ld a,#'@' 
      008D65 02 A1            [ 1]    2 	cp a,(TCHAR,sp) 
      008D67 41 2B            [ 1]    3 	jrne qmark_tst
      008D69 04 A1            [ 1] 2329 	ld a,#TK_ARRAY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008D6B 47 2B DD         [ 2] 2330 	jp token_char
      000E21                       2331 qmark_tst:
      000E21                       2332 	_case '?' tick_tst 
      008D6E 7F CD            [ 1]    1 	ld a,#'?' 
      008D70 8F A9            [ 1]    2 	cp a,(TCHAR,sp) 
      008D72 CE 00            [ 1]    3 	jrne tick_tst
      008D74 09 A6            [ 1] 2333 	ld a,(TCHAR,sp)
      008D76 04               [ 1] 2334 	ld (x),a 
      008D77 5B               [ 2] 2335 	incw x 
      008D78 02               [ 1] 2336 	clr (x)
      008D79 81 5C 00 01      [ 1] 2337 	inc in 
      008D7A A6 06            [ 1] 2338 	ld a,#TK_CMD 
      008D7A 4B 00 4B         [ 2] 2339 	ldw x,#print 
      008D7D 00 F7 5C         [ 2] 2340 	jp token_exit
      000E38                       2341 tick_tst: ; ignore comment 
      000E38                       2342 	_case TICK plus_tst 
      008D80 72 5C            [ 1]    1 	ld a,#TICK 
      008D82 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D84 91 D6            [ 1]    3 	jrne plus_tst
      008D86 01 A1 30 27      [ 1] 2343 	inc in 
      008D8A 06 A1            [ 1] 2344 	ld a,#TK_CMD 
      008D8C 31 27 02         [ 2] 2345 	ldw x,#rem 
      008D8F 20 09 A0         [ 2] 2346 	jp token_exit 
      000E4A                       2347 plus_tst:
      000E4A                       2348 	_case '+' star_tst 
      008D92 30 46            [ 1]    1 	ld a,#'+' 
      008D94 09 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D96 09 01            [ 1]    3 	jrne star_tst
      008D98 20 E4            [ 1] 2349 	ld a,#TK_PLUS  
      008D9A CC 0F 01         [ 2] 2350 	jp token_char 
      000E55                       2351 star_tst:
      000E55                       2352 	_case '*' slash_tst 
      008D9A 7F 1E            [ 1]    1 	ld a,#'*' 
      008D9C 01 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D9E 04 5B            [ 1]    3 	jrne slash_tst
      008DA0 02 81            [ 1] 2353 	ld a,#TK_MULT 
      008DA2 CC 0F 01         [ 2] 2354 	jp token_char 
      000E60                       2355 slash_tst: 
      000E60                       2356 	_case '/' prcnt_tst 
      008DA2 CD 8F            [ 1]    1 	ld a,#'/' 
      008DA4 9D F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA6 5C 72            [ 1]    3 	jrne prcnt_tst
      008DA8 5C 00            [ 1] 2357 	ld a,#TK_DIV 
      008DAA 02 91 D6         [ 2] 2358 	jp token_char 
      000E6B                       2359 prcnt_tst:
      000E6B                       2360 	_case '%' eql_tst 
      008DAD 01 CD            [ 1]    1 	ld a,#'%' 
      008DAF 85 A2            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB1 25 EF            [ 1]    3 	jrne eql_tst
      008DB3 7F 72            [ 1] 2361 	ld a,#TK_MOD
      008DB5 5D 17 19         [ 2] 2362 	jp token_char  
                                   2363 ; 1 or 2 character tokens 	
      000E76                       2364 eql_tst:
      000E76                       2365 	_case '=' gt_tst 		
      008DB8 26 15            [ 1]    1 	ld a,#'=' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DBA C6 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008DBC 18 A0            [ 1]    3 	jrne gt_tst
      008DBE 41 48            [ 1] 2366 	ld a,#TK_EQUAL
      008DC0 88 4B 00         [ 2] 2367 	jp token_char 
      000E81                       2368 gt_tst:
      000E81                       2369 	_case '>' lt_tst 
      008DC3 AE 00            [ 1]    1 	ld a,#'>' 
      008DC5 24 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC7 FB 01            [ 1]    3 	jrne lt_tst
      008DC9 5B 02            [ 1] 2370 	ld a,#TK_GT 
      008DCB A6 05            [ 1] 2371 	ld (ATTRIB,sp),a 
      008DCD 20 0C 00 01      [ 1] 2372 	inc in 
      008DCF 91 D6 00         [ 4] 2373 	ld a,([in.w],y)
      008DCF AE A5            [ 1] 2374 	cp a,#'=
      008DD1 90 CD            [ 1] 2375 	jrne 1$
      008DD3 92 39            [ 1] 2376 	ld a,(TCHAR,sp)
      008DD5 4D               [ 1] 2377 	ld (x),a
      008DD6 26               [ 2] 2378 	incw x 
      008DD7 03 CC            [ 1] 2379 	ld a,#'=
      008DD9 88 15            [ 1] 2380 	ld (TCHAR,sp),a 
      008DDB 81 33            [ 1] 2381 	ld a,#TK_GE 
      008DDC 20 5F            [ 2] 2382 	jra token_char  
      008DDC A1 3C            [ 1] 2383 1$: cp a,#'<
      008DDC 90 AE            [ 1] 2384 	jrne 2$
      008DDE 16 C8            [ 1] 2385 	ld a,(TCHAR,sp)
      008DE0 C6               [ 1] 2386 	ld (x),a
      008DE1 00               [ 2] 2387 	incw x 
      008DE2 02 C1            [ 1] 2388 	ld a,#'<	
      008DE4 00 04            [ 1] 2389 	ld (TCHAR,sp),a 
      008DE6 2B 03            [ 1] 2390 	ld a,#TK_NE 
      008DE8 A6 00            [ 2] 2391 	jra token_char 
      008DEA 81 5A 00 01      [ 1] 2392 2$: dec in
      008DEB 7B 02            [ 1] 2393 	ld a,(ATTRIB,sp)
      008DEB 52 02            [ 2] 2394 	jra token_char 
      000EBA                       2395 lt_tst:
      000EBA                       2396 	_case '<' other
      008DED AE 17            [ 1]    1 	ld a,#'<' 
      008DEF 18 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF1 20 CD            [ 1]    3 	jrne other
      008DF3 90 55            [ 1] 2397 	ld a,#TK_LT 
      008DF5 55 00            [ 1] 2398 	ld (ATTRIB,sp),a 
      008DF7 02 00 03 91      [ 1] 2399 	inc in 
      008DFB D6 01 26         [ 4] 2400 	ld a,([in.w],y)
      008DFE 07 72            [ 1] 2401 	cp a,#'=
      008E00 5F 17            [ 1] 2402 	jrne 1$
      008E02 18 CC            [ 1] 2403 	ld a,(TCHAR,sp)
      008E04 8F               [ 1] 2404 	ld (x),a 
      008E05 91 3D            [ 1] 2405 	ld a,#'=
      008E06 6B 01            [ 1] 2406 	ld (TCHAR,sp),a 
      008E06 CD 8F            [ 1] 2407 	ld a,#TK_LE 
      008E08 9D 6B            [ 2] 2408 	jra token_char 
      008E0A 01 A6            [ 1] 2409 1$: cp a,#'>
      008E0C 22 11            [ 1] 2410 	jrne 2$
      008E0E 01 26            [ 1] 2411 	ld a,(TCHAR,sp)
      008E10 06               [ 1] 2412 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E11 CD               [ 2] 2413 	incw x 
      008E12 8C E7            [ 1] 2414 	ld a,#'>
      008E14 CC 8F            [ 1] 2415 	ld (TCHAR,sp),a 
      008E16 91 35            [ 1] 2416 	ld a,#TK_NE 
      008E17 20 17            [ 2] 2417 	jra token_char 
      008E17 A6 24 11 01      [ 1] 2418 2$: dec in 
      008E1B 27 13            [ 1] 2419 	ld a,(ATTRIB,sp)
      008E1D A6 26            [ 2] 2420 	jra token_char 	
      000EF2                       2421 other: ; not a special character 	 
      008E1F 11 01            [ 1] 2422 	ld a,(TCHAR,sp)
      008E21 26 06 CD         [ 4] 2423 	call is_alpha 
      008E24 8D 7A            [ 1] 2424 	jrc 30$ 
      008E26 CC 8F 91         [ 2] 2425 	jp syntax_error 
      000EFC                       2426 30$: 
      008E29 7B 01 CD         [ 4] 2427 	call parse_keyword
      008E2C 8F 94            [ 2] 2428 	jra token_exit 
      000F01                       2429 token_char:
      008E2E 24 06            [ 1] 2430 	ld (ATTRIB,sp),a 
      008E30 CD 8D            [ 1] 2431 	ld a,(TCHAR,sp)
      008E32 3F               [ 1] 2432 	ld (x),a 
      008E33 CC               [ 2] 2433 	incw x 
      008E34 8F               [ 1] 2434 	clr(x)
      008E35 91 5C 00 01      [ 1] 2435 	inc in 
      008E36 7B 02            [ 1] 2436 	ld a,(ATTRIB,sp)
      008E36 A6 28 11         [ 2] 2437 	ldw x,#pad 
      000F11                       2438 token_exit:
      000F11                       2439 	_drop VSIZE 
      008E39 01 26            [ 2]    1     addw sp,#VSIZE 
      008E3B 05               [ 4] 2440 	ret
                                   2441 
                                   2442 
                                   2443 
                                   2444 ;------------------------------------
                                   2445 ; check if character in {'0'..'9'}
                                   2446 ; input:
                                   2447 ;    A  character to test
                                   2448 ; output:
                                   2449 ;    Carry  0 not digit | 1 digit
                                   2450 ;------------------------------------
      000F14                       2451 is_digit:
      008E3C A6 0B            [ 1] 2452 	cp a,#'0
      008E3E CC 8F            [ 1] 2453 	jrc 1$
      008E40 81 3A            [ 1] 2454     cp a,#'9+1
      008E41 8C               [ 1] 2455 	ccf 
      008E41 A6               [ 1] 2456 1$:	ccf 
      008E42 5C               [ 4] 2457     ret
                                   2458 
                                   2459 ;------------------------------------
                                   2460 ; convert alpha to uppercase
                                   2461 ; input:
                                   2462 ;    a  character to convert
                                   2463 ; output:
                                   2464 ;    a  uppercase character
                                   2465 ;------------------------------------
      000F1D                       2466 to_upper::
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E43 11 01            [ 1] 2467 	cp a,#'a
      008E45 26 18            [ 1] 2468 	jrpl 1$
      008E47 7B               [ 4] 2469 0$:	ret
      008E48 01 F7            [ 1] 2470 1$: cp a,#'z	
      008E4A 5C 72            [ 1] 2471 	jrugt 0$
      008E4C 5C 00            [ 1] 2472 	sub a,#32
      008E4E 02               [ 4] 2473 	ret
                                   2474 	
                                   2475 ;------------------------------------
                                   2476 ; convert pad content in integer
                                   2477 ; input:
                                   2478 ;    pad		.asciz to convert
                                   2479 ; output:
                                   2480 ;    acc24      int24_t
                                   2481 ;------------------------------------
                                   2482 	; local variables
                           000001  2483 	SIGN=1 ; 1 byte, 
                           000002  2484 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2485 	TEMP=3 ; 1 byte, temporary storage
                           000003  2486 	VSIZE=3 ; 3 bytes reserved for local storage
      000F29                       2487 atoi24:
      008E4F 91               [ 2] 2488 	pushw x ;save x
      008E50 D6 01            [ 2] 2489 	sub sp,#VSIZE
                                   2490 	; acc24=0 
      008E52 F7 5C 72 5C      [ 1] 2491 	clr acc24    
      008E56 00 02 7F 97      [ 1] 2492 	clr acc16
      008E5A A6 03 CC 8F      [ 1] 2493 	clr acc8 
      008E5E 91 17 18         [ 1] 2494 	ld a, pad 
      008E5F 27 5A            [ 1] 2495 	jreq atoi_exit
      008E5F A6 29            [ 1] 2496 	clr (SIGN,sp)
      008E61 11 01            [ 1] 2497 	ld a,#10
      008E63 26 05            [ 1] 2498 	ld (BASE,sp),a ; default base decimal
      008E65 A6 0C CC         [ 2] 2499 	ldw x,#pad ; pointer to string to convert
      008E68 8F               [ 1] 2500 	ld a,(x)
      008E69 81 47            [ 1] 2501 	jreq 9$  ; completed if 0
      008E6A A1 2D            [ 1] 2502 	cp a,#'-
      008E6A A6 3A            [ 1] 2503 	jrne 1$
      008E6C 11 01            [ 1] 2504 	cpl (SIGN,sp)
      008E6E 26 05            [ 2] 2505 	jra 2$
      008E70 A6 01            [ 1] 2506 1$: cp a,#'$
      008E72 CC 8F            [ 1] 2507 	jrne 3$
      008E74 81 10            [ 1] 2508 	ld a,#16
      008E75 6B 02            [ 1] 2509 	ld (BASE,sp),a
      008E75 A6               [ 2] 2510 2$:	incw x
      008E76 2C               [ 1] 2511 	ld a,(x)
      000F5B                       2512 3$:	
      008E77 11 01            [ 1] 2513 	cp a,#'a
      008E79 26 05            [ 1] 2514 	jrmi 4$
      008E7B A6 0D            [ 1] 2515 	sub a,#32
      008E7D CC 8F            [ 1] 2516 4$:	cp a,#'0
      008E7F 81 2B            [ 1] 2517 	jrmi 9$
      008E80 A0 30            [ 1] 2518 	sub a,#'0
      008E80 A6 23            [ 1] 2519 	cp a,#10
      008E82 11 01            [ 1] 2520 	jrmi 5$
      008E84 26 05            [ 1] 2521 	sub a,#7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008E86 A6 0E            [ 1] 2522 	cp a,(BASE,sp)
      008E88 CC 8F            [ 1] 2523 	jrpl 9$
      008E8A 81 03            [ 1] 2524 5$:	ld (TEMP,sp),a
      008E8B 7B 02            [ 1] 2525 	ld a,(BASE,sp)
      008E8B A6 2D 11         [ 4] 2526 	call mulu24_8
      008E8E 01 26            [ 1] 2527 	ld a,(TEMP,sp)
      008E90 05 A6 11         [ 1] 2528 	add a,acc24+2
      008E93 CC 8F 81         [ 1] 2529 	ld acc24+2,a
      008E96 4F               [ 1] 2530 	clr a
      008E96 A6 40 11         [ 1] 2531 	adc a,acc24+1
      008E99 01 26 05         [ 1] 2532 	ld acc24+1,a
      008E9C A6               [ 1] 2533 	clr a
      008E9D 02 CC 8F         [ 1] 2534 	adc a,acc24
      008EA0 81 00 07         [ 1] 2535 	ld acc24,a
      008EA1 20 C9            [ 2] 2536 	jra 2$
      008EA1 A6 3F            [ 1] 2537 9$:	tnz (SIGN,sp)
      008EA3 11 01            [ 1] 2538     jreq atoi_exit
      008EA5 26 11 7B         [ 4] 2539     call neg_acc24
      000F97                       2540 atoi_exit: 
      008EA8 01 F7            [ 2] 2541 	addw sp,#VSIZE
      008EAA 5C               [ 2] 2542 	popw x ; restore x
      008EAB 7F               [ 4] 2543 	ret
                                   2544 
                                   2545 ;--------------------------------------
                                   2546 ; unsigned multiply uint24_t by uint8_t
                                   2547 ; use to convert numerical string to uint24_t
                                   2548 ; input:
                                   2549 ;	acc24	uint24_t 
                                   2550 ;   A		uint8_t
                                   2551 ; output:
                                   2552 ;   acc24   A*acc24
                                   2553 ;-------------------------------------
                                   2554 ; local variables offset  on sp
                           000003  2555 	U8   = 3   ; A pushed on stack
                           000002  2556 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2557 	OVFH = 1  ; multiplication overflow high byte
                           000003  2558 	VSIZE = 3
      000F9B                       2559 mulu24_8:
      008EAC 72               [ 2] 2560 	pushw x    ; save X
                                   2561 	; local variables
      008EAD 5C               [ 1] 2562 	push a     ; U8
      008EAE 00               [ 1] 2563 	clrw x     ; initialize overflow to 0
      008EAF 02               [ 2] 2564 	pushw x    ; multiplication overflow
                                   2565 ; multiply low byte.
      008EB0 A6 06 AE         [ 1] 2566 	ld a,acc24+2
      008EB3 96               [ 1] 2567 	ld xl,a
      008EB4 EC CC            [ 1] 2568 	ld a,(U8,sp)
      008EB6 8F               [ 4] 2569 	mul x,a
      008EB7 91               [ 1] 2570 	ld a,xl
      008EB8 C7 00 09         [ 1] 2571 	ld acc24+2,a
      008EB8 A6               [ 1] 2572 	ld a, xh
      008EB9 27 11            [ 1] 2573 	ld (OVFL,sp),a
                                   2574 ; multipy middle byte
      008EBB 01 26 0C         [ 1] 2575 	ld a,acc24+1
      008EBE 72               [ 1] 2576 	ld xl,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008EBF 5C 00            [ 1] 2577 	ld a, (U8,sp)
      008EC1 02               [ 4] 2578 	mul x,a
                                   2579 ; add overflow to this partial product
      008EC2 A6 06 AE         [ 2] 2580 	addw x,(OVFH,sp)
      008EC5 97               [ 1] 2581 	ld a,xl
      008EC6 F1 CC 8F         [ 1] 2582 	ld acc24+1,a
      008EC9 91               [ 1] 2583 	clr a
      008ECA A9 00            [ 1] 2584 	adc a,#0
      008ECA A6 2B            [ 1] 2585 	ld (OVFH,sp),a
      008ECC 11               [ 1] 2586 	ld a,xh
      008ECD 01 26            [ 1] 2587 	ld (OVFL,sp),a
                                   2588 ; multiply most signficant byte	
      008ECF 05 A6 10         [ 1] 2589 	ld a, acc24
      008ED2 CC               [ 1] 2590 	ld xl, a
      008ED3 8F 81            [ 1] 2591 	ld a, (U8,sp)
      008ED5 42               [ 4] 2592 	mul x,a
      008ED5 A6 2A 11         [ 2] 2593 	addw x, (OVFH,sp)
      008ED8 01               [ 1] 2594 	ld a, xl
      008ED9 26 05 A6         [ 1] 2595 	ld acc24,a
      008EDC 20 CC            [ 2] 2596     addw sp,#VSIZE
      008EDE 8F               [ 2] 2597 	popw x
      008EDF 81               [ 4] 2598 	ret
                                   2599 
                                   2600 ;------------------------------------
                                   2601 ; skip character c in text starting from 'in'
                                   2602 ; input:
                                   2603 ;	 y 		point to text buffer
                                   2604 ;    a 		character to skip
                                   2605 ; output:  
                                   2606 ;	'in' ajusted to new position
                                   2607 ;------------------------------------
                           000001  2608 	C = 1 ; local var
      008EE0                       2609 skip:
      008EE0 A6               [ 1] 2610 	push a
      008EE1 2F 11 01         [ 4] 2611 1$:	ld a,([in.w],y)
      008EE4 26 05            [ 1] 2612 	jreq 2$
      008EE6 A6 21            [ 1] 2613 	cp a,(C,sp)
      008EE8 CC 8F            [ 1] 2614 	jrne 2$
      008EEA 81 5C 00 01      [ 1] 2615 	inc in
      008EEB 20 F1            [ 2] 2616 	jra 1$
      000FE5                       2617 2$: _drop 1 
      008EEB A6 25            [ 2]    1     addw sp,#1 
      008EED 11               [ 4] 2618 	ret
                                   2619 	
                                   2620 ;------------------------------
                                   2621 ; restore 'in.w' variable to 
                                   2622 ; its value before last call
                                   2623 ; to get_token.
                                   2624 ;------------------------------
      000FE8                       2625 unget_token:
      008EEE 01 26 05 A6 22   [ 1] 2626 	mov in,in.saved
      008EF3 CC               [ 4] 2627 	ret 
                                   2628 
                                   2629 
                                   2630 ;******************************
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2631 ;  data stack manipulation
                                   2632 ;*****************************
                                   2633 ;----------------------	
                                   2634 ; push X on data stack 
                                   2635 ; input:
                                   2636 ;	X 
                                   2637 ; output:
                                   2638 ;	none 
                                   2639 ;----------------------	
      000FEE                       2640 dpush:
      000FEE                       2641     _dp_down
      008EF4 8F 81 00 19      [ 1]    1     dec dstkptr+1 
      008EF6 72 5A 00 19      [ 1]    2     dec dstkptr+1
      008EF6 A6 3D 11 01      [ 5] 2642     ldw [dstkptr],x  
      008EFA 26               [ 4] 2643 	ret 
                                   2644 
                                   2645 
                                   2646 ;----------------------	
                                   2647 ; pop data stack in X 
                                   2648 ; input:
                                   2649 ;	none
                                   2650 ; output:
                                   2651 ;	X   
                                   2652 ;----------------------	
      000FFB                       2653 dpop: 
      008EFB 05 A6 32 CC      [ 5] 2654     ldw x, [dstkptr]
      000FFF                       2655 	_dp_up
      008EFF 8F 81 00 19      [ 1]    1     inc dstkptr+1
      008F01 72 5C 00 19      [ 1]    2     inc dstkptr+1
      008F01 A6               [ 4] 2656 	ret 
                                   2657 
                                   2658 ;-----------------------------
                                   2659 ; swap top 2 elements of dstack
                                   2660 ;  {n1 n2 -- n2 n1 }
                                   2661 ;-----------------------------
      001008                       2662 dswap:
      008F02 3E 11 01 26      [ 5] 2663 	ldw x,[dstkptr]
      008F06 33               [ 2] 2664 	pushw x 
      008F07 A6 31 6B         [ 2] 2665 	ldw x,#2 
      008F0A 02 72 5C 00      [ 5] 2666 	ldw x,([dstkptr],x) 
      008F0E 02 91 D6 01      [ 5] 2667 	ldw [dstkptr],x 
      008F12 A1 3D 26         [ 2] 2668 	ldw x,#2
      008F15 0C 7B            [ 2] 2669 	popw y 
      008F17 01 F7 5C A6      [ 5] 2670 	ldw ([dstkptr],x),y 
      008F1B 3D               [ 4] 2671 	ret
                                   2672 
                                   2673 ;-----------------------------
                                   2674 ; drop TOS 
                                   2675 ;-----------------------------
      001022                       2676 ddrop: ; { n -- }
      001022                       2677 	_dp_up 
      008F1C 6B 01 A6 33      [ 1]    1     inc dstkptr+1
      008F20 20 5F A1 3C      [ 1]    2     inc dstkptr+1
      008F24 26               [ 4] 2678 	ret
                                   2679 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2680 ;-----------------------------
                                   2681 ; duplicate TOS 
                                   2682 ;  dstack: { ix...n -- ix...n n }
                                   2683 ;-----------------------------
      00102B                       2684 ddup:
      008F25 0C 7B 01 F7      [ 5] 2685 	ldw x,[dstkptr]
      00102F                       2686 	_dp_down
      008F29 5C A6 3C 6B      [ 1]    1     dec dstkptr+1 
      008F2D 01 A6 35 20      [ 1]    2     dec dstkptr+1
      008F31 4F 72 5A 00      [ 5] 2687     ldw [dstkptr],x  
      008F35 02               [ 4] 2688 	ret 
                                   2689 
                                   2690 
                                   2691 ;----------------------------------
                                   2692 ; pick value n from dstack 
                                   2693 ; put it on TOS
                                   2694 ; dstack: {ix,..,p -- ix,...,np }
                                   2695 ;-----------------------------------
      00103C                       2696 dpick:
      008F36 7B 02 20 47      [ 5] 2697 	ldw x,[dstkptr]
      008F3A 58               [ 2] 2698 	sllw x 
      008F3A A6 3C 11 01      [ 2] 2699 	addw x,dstkptr 
      008F3E 26               [ 2] 2700 	ldw x,(x)
      008F3F 32 A6 34 6B      [ 5] 2701 	ldw [dstkptr],x 
      008F43 02               [ 4] 2702 	ret
                                   2703 
                                   2704 ;---------------------------
                                   2705 ;  fetch variable in X 
                                   2706 ;  dstack:{ addr -- value }
                                   2707 ;---------------------------
      00104B                       2708 fetch:
      008F44 72 5C 00 02      [ 5] 2709 	ldw x,[dstkptr]
      008F48 91               [ 2] 2710 	ldw x,(x)
      008F49 D6 01 A1 3D      [ 5] 2711 	ldw [dstkptr],x
      008F4D 26               [ 4] 2712 	ret 
                                   2713 
                                   2714 ;----------------------------
                                   2715 ; store variable 
                                   2716 ; dstack: {addr value -- }
                                   2717 ;----------------------------
      001055                       2718 store:
      008F4E 0B 7B 01         [ 4] 2719 	call dpop 
      008F51 F7 A6            [ 1] 2720 	ldw y,x   ; y=value 
      008F53 3D 6B 01         [ 4] 2721 	call dpop 
      008F56 A6               [ 2] 2722 	ldw (x),y 
      008F57 36               [ 4] 2723 	ret 
                                   2724 
                                   2725 ;---------------------------------
                                   2726 ; drop n elements from data stack 
                                   2727 ; input: 
                                   2728 ;   X 		n 
                                   2729 ; output:
                                   2730 ;   none 
                                   2731 ;-------------------------------------
      00105F                       2732 ddrop_n:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008F58 20 27            [ 2] 2733 	pushw y 
      008F5A A1 3E 26 0C      [ 2] 2734 	ldw y,dstkptr 
      008F5E 7B               [ 2] 2735 	sllw x 
      008F5F 01               [ 2] 2736 	pushw x 
      008F60 F7 5C A6         [ 2] 2737 	addw y,(1,sp)
      008F63 3E 6B 01 A6      [ 2] 2738 	ldw dstkptr,y 
      008F67 35               [ 2] 2739 	popw x 
      008F68 20 17            [ 2] 2740 	popw y
      008F6A 72               [ 4] 2741 	ret 
                                   2742 
      008F6B 5A 00 02 7B 02 20 0F  2743 dstk_prompt: .asciz "\ndstack: " 
             3A 20 00
                                   2744 ;----------------------------
                                   2745 ; print dstack content 
                                   2746 ;---------------------------
                           000001  2747 	XSAVE=1
                           000002  2748 	VSIZE=2
      008F72                       2749 dots:
      00107C                       2750 	_vars VSIZE 
      008F72 7B 01            [ 2]    1     sub sp,#VSIZE 
      008F74 CD 85 A2         [ 2] 2751 	ldw x,#dstk_prompt 
      008F77 25 03 CC         [ 4] 2752 	call puts
      008F7A 88 15 7E         [ 2] 2753 	ldw x,#dstack_empty-CELL_SIZE
      008F7C 35 0A 00 06      [ 1] 2754 	mov base,#10 
      008F7C CD 8D A2         [ 2] 2755 1$:	cpw x,dstkptr 
      008F7F 20 10            [ 1] 2756 	jrult 4$ 
      008F81 1F 01            [ 2] 2757 	ldw (XSAVE,sp),x
      008F81 6B               [ 2] 2758 	ldw  x,(x)
      008F82 02 7B 01         [ 4] 2759 	call print_int 
      008F85 F7 5C            [ 2] 2760 	ldw x,(XSAVE,sp)
      008F87 7F 72 5C         [ 2] 2761 	subw x,#CELL_SIZE 
      008F8A 00 02            [ 2] 2762 	jra 1$ 
      008F8C 7B 02            [ 1] 2763 4$: ld a,#CR 
      008F8E AE 17 18         [ 4] 2764 	call putc 
      008F91                       2765 	_drop VSIZE
      008F91 5B 02            [ 2]    1     addw sp,#VSIZE 
      008F93 81               [ 1] 2766 	clr a 
      008F94 81               [ 4] 2767 	ret
                                   2768 
      008F94 A1 30 25 03 A1 3A 8C  2769 cstk_prompt: .asciz "\nctack: "
             8C 81
                                   2770 ;--------------------------------
                                   2771 ; print cstack content
                                   2772 ;--------------------------------
                           000001  2773 	XSAVE=1
                           000002  2774 	VSIZE=2 
      008F9D                       2775 dotr:
      0010AF                       2776 	_vars VSIZE 
      008F9D A1 61            [ 2]    1     sub sp,#VSIZE 
      008F9F 2A 01 81         [ 2] 2777 	ldw x,#cstk_prompt
      008FA2 A1 7A 22         [ 4] 2778 	call puts 
      008FA5 FB               [ 1] 2779 	ldw x,sp 
      008FA6 A0 20 81         [ 2] 2780 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008FA9 1F 01            [ 2] 2781 	ldw (XSAVE,sp),x  
      008FA9 89 52 03         [ 2] 2782 	ldw x,#RAM_SIZE-2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008FAC 72 5F 00 08      [ 1] 2783 	mov base,#16
      0010C4                       2784 dotr_loop:
      008FB0 72 5F            [ 2] 2785 	cpw x,(XSAVE,sp)
      008FB2 00 09            [ 1] 2786 	jrmi 9$
      008FB4 72               [ 2] 2787 	pushw x  
      008FB5 5F               [ 2] 2788 	ldw x,(x)
      008FB6 00 0A C6         [ 4] 2789 	call print_int 
      008FB9 17               [ 2] 2790 	popw x  
      008FBA 18 27 5A         [ 2] 2791 	subw x,#CELL_SIZE
      008FBD 0F 01            [ 2] 2792 	jra dotr_loop 
      008FBF A6 0A            [ 1] 2793 9$:	ld a,#CR 
      008FC1 6B 02 AE         [ 4] 2794 	call putc 
      0010D8                       2795 	_drop VSIZE 
      008FC4 17 18            [ 2]    1     addw sp,#VSIZE 
      008FC6 F6               [ 1] 2796 	clr a 
      008FC7 27               [ 4] 2797 	ret
                                   2798 
                                   2799 
                                   2800 ;--------------------------------
                                   2801 ;  add 2 integers
                                   2802 ;  input:
                                   2803 ;    N1     on cstack 
                                   2804 ;    N2     on cstack 
                                   2805 ;  output:
                                   2806 ;    X 		n2+n1 
                                   2807 ;--------------------------------
                                   2808 	;arugments on cstack 
      0010DC                       2809 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0010DC                       2810 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      0010DC                       2811 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      0010DC                       2812 add:
      008FC8 47 A1            [ 2] 2813 	ldw x ,(N2,sp)
      008FCA 2D 26 04         [ 2] 2814 	addw x,(N1,sp)
      008FCD 03 01            [ 2] 2815 	ldw (N1,sp),x 
      008FCF 20               [ 4] 2816 	ret 
                                   2817 
                                   2818 ;--------------------------------
                                   2819 ;  substract 2 ntegers
                                   2820 ;  input:
                                   2821 ;    N1     on cstack 
                                   2822 ;    N2     on cstack 
                                   2823 ;  output:
                                   2824 ;    X 		n2+n1 
                                   2825 ;--------------------------------
      0010E4                       2826 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0010E4                       2827 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      0010E4                       2828 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      0010E4                       2829 substract:
      008FD0 08 A1            [ 2] 2830 	ldw x,(N2,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      008FD2 24 26 06         [ 2] 2831 	subw x,(N1,sp)
      008FD5 A6               [ 4] 2832 	ret 
                                   2833 
                                   2834 ;-------------------------------------
                                   2835 ; multiply 2 integers
                                   2836 ; product overflow is ignored unless
                                   2837 ; MATH_OVF assembler flag is set to 1
                                   2838 ; input:
                                   2839 ;  	N1      on cstack
                                   2840 ;   N2 		on cstack 
                                   2841 ; output:
                                   2842 ;	X        N1*N2 
                                   2843 ;-------------------------------------
                                   2844 	;arguments 
      0010EA                       2845 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      0010EA                       2846 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      0010EA                       2847 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      0010EA                       2848 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      0010EA                       2849 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2850    ; local variables 
                           000001  2851 	SIGN=1
                           000002  2852 	PROD=2
                           000003  2853 	VSIZE=3
      0010EA                       2854 multiply:
      0010EA                       2855 	_vars VSIZE 
      008FD6 10 6B            [ 2]    1     sub sp,#VSIZE 
      008FD8 02 5C            [ 1] 2856 	clr (SIGN,sp)
      008FDA F6 06            [ 2] 2857 	ldw x,(N1_HB,sp)
      008FDB 9E               [ 1] 2858 	ld a,xh  
      008FDB A1 61            [ 1] 2859 	bcp a,#0x80 
      008FDD 2B 02            [ 1] 2860 	jreq 2$
      008FDF A0 20            [ 1] 2861 	cpl (SIGN,sp)
      008FE1 A1               [ 2] 2862 	negw x 
      008FE2 30 2B            [ 2] 2863 	ldw (N1_HB,sp),x 
      008FE4 2B A0            [ 2] 2864 2$: ldw x,(N2_HB,sp)
      008FE6 30               [ 1] 2865 	ld a,xh  
      008FE7 A1 0A            [ 1] 2866 	bcp a,#0x80 
      008FE9 2B 06            [ 1] 2867 	jreq 3$
      008FEB A0 07            [ 1] 2868 	cpl (SIGN,sp)
      008FED 11               [ 2] 2869 	negw x 
      008FEE 02 2A            [ 2] 2870 	ldw (N2_HB,sp),x 
                                   2871 ; N1_LB * N2_LB 	
      008FF0 1F 6B            [ 1] 2872 3$:	ld a,(N1_LB,sp)
      008FF2 03               [ 1] 2873 	ld xl,a 
      008FF3 7B 02            [ 1] 2874 	ld a,(N2_LB,sp) 
      008FF5 CD               [ 4] 2875 	mul x,a 
                           000000  2876 .if MATH_OVF 	
                                   2877 	ld a,xh 
                                   2878 	bcp a,#0x80 
                                   2879 	jreq 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2880 	ld a,#ERR_MATH_OVF 
                                   2881 	jp tb_error
                                   2882 .endif 	 
      008FF6 90 1B            [ 2] 2883 4$:	ldw (PROD,sp),x
                                   2884 ; N1_LB * N2_HB	 
      008FF8 7B 03            [ 1] 2885 	ld a,(N1_LB,sp) 
      008FFA CB               [ 1] 2886 	ld xl,a 
      008FFB 00 0A            [ 1] 2887 	ld a,(N2_HB,sp)
      008FFD C7               [ 4] 2888 	mul x,a
      008FFE 00               [ 1] 2889 	ld a,xl 
      008FFF 0A 4F            [ 1] 2890 	add a,(PROD,sp)
                           000000  2891 .if MATH_OVF 	
                                   2892 	bcp a,#0x80 
                                   2893 	jreq 5$ 
                                   2894 	ld a,#ERR_MATH_OVF 
                                   2895 	jp tb_error
                                   2896 .endif 	 
      009001 C9 00            [ 1] 2897 5$:	ld (PROD,sp),a 
                                   2898 ; N1_HB * N2_LB 
      009003 09 C7            [ 1] 2899 	ld a,(N1_HB,sp)
      009005 00               [ 1] 2900 	ld xl,a 
      009006 09 4F            [ 1] 2901 	ld a,(N2_LB,sp)
      009008 C9               [ 4] 2902 	mul x,a 
      009009 00               [ 1] 2903 	ld a,xl 
      00900A 08 C7            [ 1] 2904 	add a,(PROD,sp)
                           000000  2905 .if MATH_OVF 	
                                   2906 	bcp a,#0x80 
                                   2907 	jreq 6$ 
                                   2908 	ld a,#ERR_MATH_OVF 
                                   2909 	jp tb_error
                                   2910 .endif 	 
      00900C 00 08            [ 1] 2911 6$:	ld (PROD,sp),a 
                                   2912 ; N1_HB * N2_HB 	
                                   2913 ; it is pointless to multiply N1_HB*N2_HB 
                                   2914 ; as this product is over 65535 or 0 
                                   2915 ;
                                   2916 ; sign adjust product
      00900E 20 C9            [ 1] 2917 	tnz (SIGN,sp)
      009010 0D 01            [ 1] 2918 	jreq 7$
      009012 27 03            [ 2] 2919 	ldw x, (PROD,sp)
      009014 CD               [ 2] 2920 	negw x
      009015 8B 40            [ 2] 2921 	ldw (PROD,sp),x  
      009017                       2922 7$: 
      009017 5B 03            [ 2] 2923 	ldw x,(PROD,sp) 
      00112F                       2924 	_drop VSIZE 
      009019 85 81            [ 2]    1     addw sp,#VSIZE 
      00901B 81               [ 4] 2925 	ret
                                   2926 
                                   2927 ;----------------------------------
                                   2928 ;  euclidian divide n2/n1 
                                   2929 ; input:
                                   2930 ;    N2 	on cstack
                                   2931 ;    N1 	on cstack
                                   2932 ; output:
                                   2933 ;    X      n2/n1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2934 ;    Y      remainder 
                                   2935 ;----------------------------------
      001132                       2936 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      001132                       2937 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      001132                       2938 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2939 	; local variables
                           000001  2940 	SQUOT=1 ; sign quotient
                           000002  2941 	SDIVD=2 ; sign dividend  
                           000002  2942 	VSIZE=2
      001132                       2943 divide:
      001132                       2944 	_vars VSIZE 
      00901B 89 88            [ 2]    1     sub sp,#VSIZE 
      00901D 5F 89            [ 1] 2945 	clr (SQUOT,sp)
      00901F C6 00            [ 1] 2946 	clr (SDIVD,sp)
                                   2947 ; check for 0 divisor
      009021 0A 97            [ 2] 2948 	ldw x,(DIVISR,sp)
      009023 7B               [ 2] 2949 	tnzw x 
      009024 03 42            [ 1] 2950     jrne 0$
      009026 9F C7            [ 1] 2951 	ld a,#ERR_DIV0 
      009028 00 0A 9E         [ 2] 2952 	jp tb_error 
                                   2953 ; check divisor sign 	
      00902B 6B               [ 1] 2954 0$:	ld a,xh 
      00902C 02 C6            [ 1] 2955 	bcp a,#0x80 
      00902E 00 09            [ 1] 2956 	jreq 1$
      009030 97 7B            [ 1] 2957 	cpl (SQUOT,sp)
      009032 03               [ 2] 2958 	negw x 
      009033 42 72            [ 2] 2959 1$:	ldw (DIVISR,sp),x
                                   2960 ; check dividend sign 	 
      009035 FB 01            [ 2] 2961     ldw x,(DIVIDND,sp)
      009037 9F               [ 1] 2962 	ld a,xh 
      009038 C7 00            [ 1] 2963 	bcp a,#0x80 
      00903A 09 4F            [ 1] 2964 	jreq 2$ 
      00903C A9 00            [ 1] 2965 	cpl (SQUOT,sp)
      00903E 6B 01            [ 1] 2966 	cpl (SDIVD,sp)
      009040 9E               [ 2] 2967 	negw x 
      009041 6B 02            [ 2] 2968 2$:	ldw y,(DIVISR,sp)
      009043 C6               [ 2] 2969 	divw x,y
      009044 00 08 97 7B      [ 2] 2970 	ldw acc16,y 
                                   2971 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      009048 03 42            [ 1] 2972 	tnz (SDIVD,sp)
      00904A 72 FB            [ 1] 2973 	jreq 7$
      00904C 01 9F            [ 2] 2974 	tnzw y 
      00904E C7 00            [ 1] 2975 	jreq 7$
      009050 08               [ 2] 2976 	incw x
      009051 5B 03            [ 2] 2977 	ldw y,(DIVISR,sp)
      009053 85 81 00 08      [ 2] 2978 	subw y,acc16
      009055 0D 01            [ 1] 2979 7$: tnz (SQUOT,sp)
      009055 88 91            [ 1] 2980 	jreq 9$ 	 
      009057 D6               [ 2] 2981 8$:	negw x 
      001173                       2982 9$: 
      001173                       2983 	_drop VSIZE 
      009058 01 27            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00905A 0A               [ 4] 2984 	ret 
                                   2985 
                                   2986 
                                   2987 ;----------------------------------
                                   2988 ;  remainder resulting from euclidian 
                                   2989 ;  division of n2/n1 
                                   2990 ; input:
                                   2991 ;   N1 		cstack 
                                   2992 ;   N2      cstack
                                   2993 ; output:
                                   2994 ;   X       N2%N1 
                                   2995 ;----------------------------------
                           000003  2996 	N1=3
                           000005  2997 	N2=5
                           000004  2998 	VSIZE=4
      001176                       2999 modulo:
      00905B 11 01            [ 2] 3000 	Ldw x,(N1,sp)
      00905D 26 06            [ 2] 3001 	ldw y,(N2,sp)
      00117A                       3002 	_vars VSIZE 
      00905F 72 5C            [ 2]    1     sub sp,#VSIZE 
      009061 00 02            [ 2] 3003 	ldw (1,sp),x 
      009063 20 F1            [ 2] 3004 	ldw (3,sp),y 
      009065 5B 01 81         [ 4] 3005 	call divide 
      009068 93               [ 1] 3006 	ldw x,y
      001184                       3007 	_drop VSIZE 
      009068 55 00            [ 2]    1     addw sp,#VSIZE 
      00906A 03               [ 4] 3008 	ret 
                                   3009 
                                   3010 
                                   3011 ;----------------------------------
                                   3012 ; search in kword_dict command name
                                   3013 ;  from its execution address 
                                   3014 ; input:
                                   3015 ;   X       	execution address 
                                   3016 ; output:
                                   3017 ;   X 			cstr*  | 0 
                                   3018 ;--------------------------------
                           000001  3019 	XADR=1 
                           000003  3020 	LINK=3 
                           000004  3021 	VSIZE=4
      001187                       3022 cmd_name:
      001187                       3023 	_vars VSIZE 
      00906B 00 02            [ 2]    1     sub sp,#VSIZE 
      00906D 81 5F 00 08      [ 1] 3024 	clr acc16 
      00906E 1F 01            [ 2] 3025 	ldw (XADR,sp),x  
      00906E 72 5A 00         [ 2] 3026 	ldw x,#kword_dict	
      009071 1A 72            [ 2] 3027 1$:	ldw (LINK,sp),x
      009073 5A 00            [ 1] 3028 	ld a,(2,x)
      009075 1A 72            [ 1] 3029 	and a,#15 
      009077 CF 00 19         [ 1] 3030 	ld acc8,a 
      00907A 81 00 03         [ 2] 3031 	addw x,#3
      00907B 72 BB 00 08      [ 2] 3032 	addw x,acc16
      00907B 72               [ 2] 3033 	ldw x,(x) ; execution address 
      00907C CE 00            [ 2] 3034 	cpw x,(XADR,sp)
      00907E 19 72            [ 1] 3035 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      009080 5C 00            [ 2] 3036 	ldw x,(LINK,sp)
      009082 1A               [ 2] 3037 	ldw x,(x) 
      009083 72 5C 00         [ 2] 3038 	subw x,#2  
      009086 1A 81            [ 1] 3039 	jrne 1$
      009088 20 05            [ 2] 3040 	jra 9$
      009088 72 CE            [ 2] 3041 2$: ldw x,(LINK,sp)
      00908A 00 19 89         [ 2] 3042 	addw x,#2 	
      0011B6                       3043 9$:	_drop VSIZE
      00908D AE 00            [ 2]    1     addw sp,#VSIZE 
      00908F 02               [ 4] 3044 	ret
                                   3045 
                                   3046 
                                   3047 ;---------------------------------
                                   3048 ; input:
                                   3049 ;	X 		dictionary entry point 
                                   3050 ;  pad		.asciz name to search 
                                   3051 ; output:
                                   3052 ;  A 		TK_CMD|TK_IFUNC|TK_NONE 
                                   3053 ;  X		execution address | 0 
                                   3054 ;---------------------------------
                           000001  3055 	NLEN=1 ; cmd length 
                           000002  3056 	YSAVE=2
                           000003  3057 	VSIZE=3 
      0011B9                       3058 search_dict:
      0011B9                       3059 	_vars VSIZE 
      009090 72 DE            [ 2]    1     sub sp,#VSIZE 
      009092 00 19            [ 1] 3060 	ldw y,x 
      0011BD                       3061 search_next:	
      009094 72 CF            [ 1] 3062 	ld a,(y)
      009096 00 19            [ 1] 3063 	and a,#0xf 
      009098 AE 00            [ 1] 3064 	ld (NLEN,sp),a  
      00909A 02 90 85         [ 2] 3065 	ldw x,#pad 
      00909D 72 DF            [ 2] 3066 	ldw (YSAVE,sp),y
      00909F 00 19            [ 2] 3067 	incw y  
      0011CA                       3068 cp_loop:
      0090A1 81               [ 1] 3069 	ld a,(x)
      0090A2 27 1E            [ 1] 3070 	jreq str_match 
      0090A2 72 5C            [ 1] 3071 	tnz (NLEN,sp)
      0090A4 00 1A            [ 1] 3072 	jreq no_match  
      0090A6 72 5C            [ 1] 3073 	cp a,(y)
      0090A8 00 1A            [ 1] 3074 	jrne no_match 
      0090AA 81 5C            [ 2] 3075 	incw y 
      0090AB 5C               [ 2] 3076 	incw x
      0090AB 72 CE            [ 1] 3077 	dec (NLEN,sp)
      0090AD 00 19            [ 2] 3078 	jra cp_loop 
      0011DC                       3079 no_match:
      0090AF 72 5A            [ 2] 3080 	ldw y,(YSAVE,sp) 
      0090B1 00 1A 72 5A      [ 2] 3081 	subw y,#2 ; move Y to link field
      0090B5 00 1A            [ 1] 3082 	push #TK_NONE 
      0090B7 72 CF            [ 2] 3083 	ldw y,(y) ; next word link 
      0090B9 00               [ 1] 3084 	pop a ; TK_NONE 
      0090BA 19 81            [ 1] 3085 	jreq search_exit  ; not found  
                                   3086 ;try next 
      0090BC 20 D2            [ 2] 3087 	jra search_next
      0011EB                       3088 str_match:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0090BC 72 CE            [ 2] 3089 	ldw y,(YSAVE,sp)
      0090BE 00 19            [ 1] 3090 	ld a,(y)
      0090C0 58 72            [ 1] 3091 	ld (NLEN,sp),a ; needed to test keyword type  
      0090C2 BB 00            [ 1] 3092 	and a,#0xf 
                                   3093 ; move y to procedure address field 	
      0090C4 19               [ 1] 3094 	inc a 
      0090C5 FE 72 CF         [ 1] 3095 	ld acc8,a 
      0090C8 00 19 81 08      [ 1] 3096 	clr acc16 
      0090CB 72 B9 00 08      [ 2] 3097 	addw y,acc16 
      0090CB 72 CE            [ 2] 3098 	ldw y,(y) ; routine entry point 
                                   3099 ;determine keyword type bits 7:6 
      0090CD 00 19            [ 1] 3100 	ld a,(NLEN,sp)
      0090CF FE               [ 1] 3101 	swap a 
      0090D0 72 CF            [ 1] 3102 	and a,#0xc
      0090D2 00               [ 1] 3103 	srl a
      0090D3 19               [ 1] 3104 	srl a 
      0090D4 81 06            [ 1] 3105 	add a,#6
      0090D5                       3106 search_exit: 
      0090D5 CD               [ 1] 3107 	ldw x,y ; x=routine address 
      00120B                       3108 	_drop VSIZE 	 
      0090D6 90 7B            [ 2]    1     addw sp,#VSIZE 
      0090D8 90               [ 4] 3109 	ret 
                                   3110 
                                   3111 ;---------------------
                                   3112 ; check if next token
                                   3113 ;  is of expected type 
                                   3114 ; input:
                                   3115 ;   A 		 expected token attribute
                                   3116 ;  ouput:
                                   3117 ;   none     if fail call tb_error 
                                   3118 ;--------------------
      00120E                       3119 expect:
      0090D9 93               [ 1] 3120 	push a 
      0090DA CD 90 7B         [ 4] 3121 	call next_token 
      0090DD FF 81            [ 1] 3122 	cp a,(1,sp)
      0090DF 27 03            [ 1] 3123 	jreq 1$
      0090DF 90 89 90         [ 2] 3124 	jp syntax_error
      0090E2 CE               [ 1] 3125 1$: pop a 
      0090E3 00               [ 4] 3126 	ret 
                                   3127 
                                   3128 
                                   3129 ;-------------------------------
                                   3130 ; parse embedded BASIC routines 
                                   3131 ; arguments list.
                                   3132 ; arg_list::=  rel[','rel]*
                                   3133 ; all arguments are of integer type
                                   3134 ; input:
                                   3135 ;   none
                                   3136 ; output:
                                   3137 ;   A 			number of arguments pushed on dstack  
                                   3138 ;--------------------------------
                           000001  3139 	ARG_CNT=1 
      00121B                       3140 arg_list:
      0090E4 19 58            [ 1] 3141 	push #0  
      0090E6 89 72 F9         [ 4] 3142 1$: call relation
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0090E9 01 90            [ 1] 3143 	cp a,#TK_NONE 
      0090EB CF 00            [ 1] 3144 	jreq 5$
      0090ED 19 85            [ 1] 3145 	cp a,#TK_INTGR
      0090EF 90 85            [ 1] 3146 	jrne 4$
      0090F1 81 0A 64         [ 4] 3147 3$: call dpush 
      0090F4 73 74            [ 1] 3148     inc (ARG_CNT,sp)
      0090F6 61 63 6B         [ 4] 3149 	call next_token 
      0090F9 3A 20            [ 1] 3150 	cp a,#TK_NONE 
      0090FB 00 09            [ 1] 3151 	jreq 5$ 
      0090FC A1 0D            [ 1] 3152 	cp a,#TK_COMMA 
      0090FC 52 02            [ 1] 3153 	jrne 4$
      0090FE AE 90            [ 2] 3154 	jra 1$ 
      009100 F2 CD 82         [ 4] 3155 4$:	call unget_token 
      009103 5D               [ 1] 3156 5$:	pop a 
      009104 AE               [ 4] 3157 	ret 
                                   3158 
                                   3159 
      00123F                       3160 func_args:
      009105 17 7E            [ 1] 3161 	ld a,#TK_LPAREN 
      009107 35 0A 00         [ 4] 3162 	call expect 
      00910A 07 C3 00         [ 4] 3163 	call arg_list 
      00910D 19               [ 1] 3164 	push a 
      00910E 25 0D            [ 1] 3165 	ld a,#TK_RPAREN 
      009110 1F 01 FE         [ 4] 3166 	call expect 
      009113 CD               [ 1] 3167 	pop a 
      009114 8A               [ 4] 3168 	ret 
                                   3169 
                                   3170 
                                   3171 ;--------------------------------
                                   3172 ;   BASIC commnands 
                                   3173 ;--------------------------------
                                   3174 
                                   3175 ;--------------------------------
                                   3176 ;  arithmetic and relational 
                                   3177 ;  routines
                                   3178 ;  operators precedence
                                   3179 ;  highest to lowest
                                   3180 ;  operators on same row have 
                                   3181 ;  same precedence and are executed
                                   3182 ;  from left to right.
                                   3183 ;	'*','/','%'
                                   3184 ;   '-','+'
                                   3185 ;   '=','>','<','>=','<=','<>','><'
                                   3186 ;   '<>' and '><' are equivalent for not equal.
                                   3187 ;--------------------------------
                                   3188 
                                   3189 ;---------------------
                                   3190 ; return array element
                                   3191 ; address from @(expr)
                                   3192 ; input:
                                   3193 ;   A 		TK_ARRAY
                                   3194 ; output:
                                   3195 ;   A 		TK_INTGR
                                   3196 ;	X 		element address 
                                   3197 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      00124F                       3198 get_array_element:
      009115 75 1E 01         [ 4] 3199 	call func_args 
      009118 1D 00            [ 1] 3200 	cp a,#1
      00911A 02 20            [ 1] 3201 	jreq 1$
      00911C EE A6 0D         [ 2] 3202 	jp syntax_error
      00911F CD 82 4B         [ 4] 3203 1$: call dpop  
                                   3204 	; check for bounds 
      009122 5B 02 4F         [ 2] 3205 	cpw x,array_size 
      009125 81 0A            [ 2] 3206 	jrule 3$
                                   3207 ; bounds {1..array_size}	
      009127 63 74            [ 1] 3208 2$: ld a,#ERR_BAD_VALUE 
      009129 61 63 6B         [ 2] 3209 	jp tb_error 
      00912C 3A               [ 2] 3210 3$: tnzw  x
      00912D 20 00            [ 1] 3211 	jreq 2$ 
      00912F 58               [ 2] 3212 	sllw x 
      00912F 52               [ 2] 3213 	pushw x 
      009130 02 AE 91         [ 2] 3214 	ldw x,#tib
      009133 26 CD 82         [ 2] 3215 	subw x,(1,sp)
      001271                       3216 	_drop 2   
      009136 5D 96            [ 2]    1     addw sp,#2 
      009138 1C 00            [ 1] 3217 	ld a,#TK_INTGR
      00913A 07               [ 4] 3218 	ret 
                                   3219 
                                   3220 ;***********************************
                                   3221 ;   expression parse,execute 
                                   3222 ;***********************************
                                   3223 ;-----------------------------------
                                   3224 ; factor ::= ['+'|'-'|e] var | @ |
                                   3225 ;			 integer | function |
                                   3226 ;			 '('relation')' 
                                   3227 ; output:
                                   3228 ;   A    token attribute 
                                   3229 ;   X 	 integer
                                   3230 ; ---------------------------------
                           000001  3231 	NEG=1
                           000001  3232 	VSIZE=1
      001276                       3233 factor:
      001276                       3234 	_vars VSIZE 
      00913B 1F 01            [ 2]    1     sub sp,#VSIZE 
      00913D AE 17 FE         [ 4] 3235 	call next_token
      009140 35 10            [ 1] 3236 	cp a,#CMD_END 
      009142 00 07            [ 1] 3237 	jrmi 20$
      009144 6B 01            [ 1] 3238 1$:	ld (NEG,sp),a 
      009144 13 01            [ 1] 3239 	and a,#TK_GRP_MASK
      009146 2B 0B            [ 1] 3240 	cp a,#TK_GRP_ADD 
      009148 89 FE            [ 1] 3241 	jreq 2$
      00914A CD 8A            [ 1] 3242 	ld a,(NEG,sp)
      00914C 75 85            [ 2] 3243 	jra 4$  
      00128B                       3244 2$:	
      00914E 1D 00 02         [ 4] 3245 	call next_token 
      00128E                       3246 4$:	
      009151 20 F1            [ 1] 3247 	cp a,#TK_IFUNC 
      009153 A6 0D            [ 1] 3248 	jrne 5$ 
      009155 CD               [ 4] 3249 	call (x) 
      009156 82 4B            [ 2] 3250 	jra 18$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      001295                       3251 5$:
      009158 5B 02            [ 1] 3252 	cp a,#TK_INTGR
      00915A 4F 81            [ 1] 3253 	jrne 6$
      00915C 20 2B            [ 2] 3254 	jra 18$
      00129B                       3255 6$:
      00915C 1E 05            [ 1] 3256 	cp a,#TK_ARRAY
      00915E 72 FB            [ 1] 3257 	jrne 10$
      009160 03 1F 03         [ 4] 3258 	call get_array_element
      009163 81               [ 2] 3259 	ldw x,(x)
      009164 20 21            [ 2] 3260 	jra 18$ 
      0012A5                       3261 10$:
      009164 1E 05            [ 1] 3262 	cp a,#TK_VAR 
      009166 72 F0            [ 1] 3263 	jrne 11$
      009168 03               [ 2] 3264 	ldw x,(x)
      009169 81 1A            [ 2] 3265 	jra 18$
      00916A                       3266 11$: 
      00916A 52 03            [ 1] 3267 	cp a,#TK_CONST 
      00916C 0F 01            [ 1] 3268 	jreq 18$
      0012B0                       3269 12$:			
      00916E 1E 06            [ 1] 3270 	cp a,#TK_LPAREN
      009170 9E A5            [ 1] 3271 	jrne 16$
      009172 80 27 05         [ 4] 3272 	call relation
      009175 03               [ 2] 3273 	pushw x 
      009176 01 50            [ 1] 3274 	ld a,#TK_RPAREN 
      009178 1F 06 1E         [ 4] 3275 	call expect
      00917B 08               [ 2] 3276 	popw x 
      00917C 9E A5            [ 2] 3277 	jra 18$	
      0012C0                       3278 16$:
      00917E 80 27 05         [ 4] 3279 	call unget_token
      009181 03               [ 1] 3280 	clr a 
      009182 01 50            [ 2] 3281 	jra 20$ 
      0012C6                       3282 18$: 
      009184 1F 08            [ 1] 3283 	ld a,#TK_MINUS 
      009186 7B 07            [ 1] 3284 	cp a,(NEG,sp)
      009188 97 7B            [ 1] 3285 	jrne 19$
      00918A 09               [ 2] 3286 	negw x
      0012CD                       3287 19$:
      00918B 42 1F            [ 1] 3288 	ld a,#TK_INTGR
      0012CF                       3289 20$:
      0012CF                       3290 	_drop VSIZE
      00918D 02 7B            [ 2]    1     addw sp,#VSIZE 
      00918F 07               [ 4] 3291 	ret
                                   3292 
                                   3293 ;-----------------------------------
                                   3294 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3295 ; output:
                                   3296 ;   A    	token attribute 
                                   3297 ;	X		integer
                                   3298 ;-----------------------------------
                           000001  3299 	N1=1
                           000003  3300 	N2=3
                           000005  3301 	MULOP=5
                           000005  3302 	VSIZE=5
      0012D2                       3303 term:
      0012D2                       3304 	_vars VSIZE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009190 97 7B            [ 2]    1     sub sp,#VSIZE 
      009192 08 42 9F         [ 4] 3305 	call factor
      009195 1B 02            [ 1] 3306 	cp a,#CMD_END
      009197 6B 02            [ 1] 3307 	jrmi term_exit
      0012DB                       3308 term01:	 ; check for  operator 
      009199 7B 06            [ 2] 3309 	ldw (N2,sp),x  ; save first factor 
      00919B 97 7B 09         [ 4] 3310 	call next_token
      00919E 42 9F            [ 1] 3311 	cp a,#2
      0091A0 1B 02            [ 1] 3312 	jrmi 9$
      0091A2 6B 02            [ 1] 3313 0$:	ld (MULOP,sp),a
      0091A4 0D 01            [ 1] 3314 	and a,#TK_GRP_MASK
      0091A6 27 05            [ 1] 3315 	cp a,#TK_GRP_MULT
      0091A8 1E 02            [ 1] 3316 	jreq 1$
      0091AA 50 1F            [ 1] 3317 	ld a,(MULOP,sp) 
      0091AC 02 0F E8         [ 4] 3318 	call unget_token 
      0091AD 20 25            [ 2] 3319 	jra 9$
      0012F3                       3320 1$:	; got *|/|%
      0091AD 1E 02 5B         [ 4] 3321 	call factor
      0091B0 03 81            [ 1] 3322 	cp a,#TK_INTGR
      0091B2 27 03            [ 1] 3323 	jreq 2$ 
      0091B2 52 02 0F         [ 2] 3324 	jp syntax_error
      0091B5 01 0F            [ 2] 3325 2$:	ldw (N1,sp),x  
      0091B7 02 1E            [ 1] 3326 	ld a,(MULOP,sp) 
      0091B9 05 5D            [ 1] 3327 	cp a,#TK_MULT 
      0091BB 26 05            [ 1] 3328 	jrne 3$
      0091BD A6 04 CC         [ 4] 3329 	call multiply 
      0091C0 88 17            [ 2] 3330 	jra term01
      0091C2 9E A5            [ 1] 3331 3$: cp a,#TK_DIV 
      0091C4 80 27            [ 1] 3332 	jrne 4$ 
      0091C6 03 03 01         [ 4] 3333 	call divide 
      0091C9 50 1F            [ 2] 3334 	jra term01 
      0091CB 05 1E 07         [ 4] 3335 4$: call modulo
      0091CE 9E A5            [ 2] 3336 	jra term01 
      0091D0 80 27            [ 2] 3337 9$: ldw x,(N2,sp)  
      0091D2 05 03            [ 1] 3338 	ld a,#TK_INTGR 	
      00131C                       3339 term_exit:
      00131C                       3340 	_drop VSIZE 
      0091D4 01 03            [ 2]    1     addw sp,#VSIZE 
      0091D6 02               [ 4] 3341 	ret 
                                   3342 
                                   3343 ;-------------------------------
                                   3344 ;  expr ::= term [['+'|'-'] term]*
                                   3345 ;  result range {-32768..32767}
                                   3346 ;  output:
                                   3347 ;   A    token attribute 
                                   3348 ;   X	 integer   
                                   3349 ;-------------------------------
                           000001  3350 	N1=1 
                           000003  3351 	N2=3
                           000005  3352 	OP=5 
                           000005  3353 	VSIZE=5 
      00131F                       3354 expression:
      00131F                       3355 	_vars VSIZE 
      0091D7 50 16            [ 2]    1     sub sp,#VSIZE 
      0091D9 05 65 90         [ 4] 3356 	call term
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      0091DC CF 00            [ 1] 3357 	cp a,#CMD_END 
      0091DE 09 0D            [ 1] 3358 	jrmi expr_exit 
      0091E0 02 27            [ 2] 3359 0$:	ldw (N2,sp),x 
      0091E2 0B 90 5D         [ 4] 3360 	call next_token
      0091E5 27 07            [ 1] 3361 	cp a,#2
      0091E7 5C 16            [ 1] 3362 	jrmi 9$ 
      0091E9 05 72            [ 1] 3363 1$:	ld (OP,sp),a  
      0091EB B2 00            [ 1] 3364 	and a,#TK_GRP_MASK
      0091ED 09 0D            [ 1] 3365 	cp a,#TK_GRP_ADD 
      0091EF 01 27            [ 1] 3366 	jreq 2$ 
      0091F1 01 50            [ 1] 3367 	ld a,(OP,sp)
      0091F3 CD 0F E8         [ 4] 3368 	call unget_token
      0091F3 5B 02            [ 2] 3369 	jra 9$
      001340                       3370 2$: 
      0091F5 81 12 D2         [ 4] 3371 	call term
      0091F6 A1 04            [ 1] 3372 	cp a,#TK_INTGR 
      0091F6 1E 03            [ 1] 3373 	jreq 3$
      0091F8 16 05 52         [ 2] 3374 	jp syntax_error
      0091FB 04 1F            [ 2] 3375 3$:	ldw (N1,sp),x 
      0091FD 01 17            [ 1] 3376 	ld a,(OP,sp)
      0091FF 03 CD            [ 1] 3377 	cp a,#TK_PLUS 
      009201 91 B2            [ 1] 3378 	jrne 4$
      009203 93 5B 04         [ 4] 3379 	call add 
      009206 81 D1            [ 2] 3380 	jra 0$ 
      009207 CD 10 E4         [ 4] 3381 4$:	call substract
      009207 52 04            [ 2] 3382 	jra 0$
      009209 72 5F            [ 2] 3383 9$: ldw x,(N2,sp)
      00920B 00 09            [ 1] 3384 	ld a,#TK_INTGR	
      001360                       3385 expr_exit:
      001360                       3386 	_drop VSIZE 
      00920D 1F 01            [ 2]    1     addw sp,#VSIZE 
      00920F AE               [ 4] 3387 	ret 
                                   3388 
                                   3389 ;---------------------------------------------
                                   3390 ; rel ::= expr rel_op expr
                                   3391 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3392 ;  relation return 1 | 0  for true | false 
                                   3393 ;  output:
                                   3394 ;    A 		token attribute  
                                   3395 ;	 X		1|0
                                   3396 ;---------------------------------------------
                           000001  3397 	N1=1
                           000003  3398 	N2=3
                           000005  3399 	RELOP=5
                           000005  3400 	VSIZE=5 
      001363                       3401 relation: 
      001363                       3402 	_vars VSIZE
      009210 A5 8E            [ 2]    1     sub sp,#VSIZE 
      009212 1F 03 E6         [ 4] 3403 	call expression
      009215 02 A4            [ 1] 3404 	cp a,#CMD_END  
      009217 0F C7            [ 1] 3405 	jrmi rel_exit 
                                   3406 	; expect rel_op or leave 
      009219 00 0A            [ 2] 3407 	ldw (N2,sp),x 
      00921B 1C 00 03         [ 4] 3408 	call next_token 
      00921E 72 BB            [ 1] 3409 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009220 00 09            [ 1] 3410 	jrmi 9$
      001375                       3411 1$:	
      009222 FE 13            [ 1] 3412 	ld (RELOP,sp),a 
      009224 01 27            [ 1] 3413 	and a,#TK_GRP_MASK
      009226 0A 1E            [ 1] 3414 	cp a,#TK_GRP_RELOP 
      009228 03 FE            [ 1] 3415 	jreq 2$
      00922A 1D 00            [ 1] 3416 	ld a,(RELOP,sp)
      00922C 02 26 E3         [ 4] 3417 	call unget_token  
      00922F 20 05            [ 2] 3418 	jra 9$
      001384                       3419 2$:	; expect another expression or error 
      009231 1E 03 1C         [ 4] 3420 	call expression
      009234 00 02            [ 1] 3421 	cp a,#TK_INTGR 
      009236 5B 04            [ 1] 3422 	jreq 3$
      009238 81 07 95         [ 2] 3423 	jp syntax_error 
      009239 1F 01            [ 2] 3424 3$:	ldw (N1,sp),x 
      009239 52 03 90         [ 4] 3425 	call substract
      00923C 93 06            [ 1] 3426 	jrne 4$
      00923D 35 02 00 09      [ 1] 3427 	mov acc8,#2 ; n1==n2
      00923D 90 F6            [ 2] 3428 	jra 6$ 
      00139B                       3429 4$: 
      00923F A4 0F            [ 1] 3430 	jrsgt 5$  
      009241 6B 01 AE 17      [ 1] 3431 	mov acc8,#4 ; n1<2 
      009245 18 17            [ 2] 3432 	jra 6$
      0013A3                       3433 5$:
      009247 02 90 5C 09      [ 1] 3434 	mov acc8,#1 ; n1>n2 
      00924A                       3435 6$:
      00924A F6               [ 1] 3436 	clrw x 
      00924B 27 1E 0D         [ 1] 3437 	ld a, acc8  
      00924E 01 27            [ 1] 3438 	and a,(RELOP,sp)
      009250 0B               [ 1] 3439 	tnz a 
      009251 90 F1            [ 1] 3440 	jreq 10$
      009253 26               [ 2] 3441 	incw x 
      0013B1                       3442 7$:	 
      009254 07 90            [ 2] 3443 	jra 10$  	
      009256 5C 5C            [ 2] 3444 9$: ldw x,(N2,sp)
      0013B5                       3445 10$:
      009258 0A 01            [ 1] 3446 	ld a,#TK_INTGR
      0013B7                       3447 rel_exit: 	 
      0013B7                       3448 	_drop VSIZE
      00925A 20 EE            [ 2]    1     addw sp,#VSIZE 
      00925C 81               [ 4] 3449 	ret 
                                   3450 
                                   3451 ;--------------------------------
                                   3452 ; BASIC: SHOW 
                                   3453 ;  show content of dstack,cstack
                                   3454 ;--------------------------------
      0013BA                       3455 show:
      00925C 16 02 72         [ 1] 3456 	ld a,base 
      00925F A2               [ 1] 3457 	push a 
      009260 00 02 4B         [ 4] 3458 	call dots
      009263 00 90 FE         [ 4] 3459 	call dotr 
      009266 84               [ 1] 3460 	pop a 
      009267 27 21 20         [ 1] 3461 	ld base,a 
      00926A D2               [ 1] 3462 	clr a 
      00926B 81               [ 4] 3463 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3464 
                                   3465 ;--------------------------------------------
                                   3466 ; BASIC: HEX 
                                   3467 ; select hexadecimal base for integer print
                                   3468 ;---------------------------------------------
      0013CA                       3469 hex_base:
      00926B 16 02 90 F6      [ 1] 3470 	mov base,#16 
      00926F 6B               [ 4] 3471 	ret 
                                   3472 
                                   3473 ;--------------------------------------------
                                   3474 ; BASIC: DEC 
                                   3475 ; select decimal base for integer print
                                   3476 ;---------------------------------------------
      0013CF                       3477 dec_base:
      009270 01 A4 0F 4C      [ 1] 3478 	mov base,#10
      009274 C7               [ 4] 3479 	ret 
                                   3480 
                                   3481 ;------------------------
                                   3482 ; BASIC: SIZE 
                                   3483 ; return free size in text area
                                   3484 ; output:
                                   3485 ;   A 		TK_INTGR
                                   3486 ;   X 	    size integer
                                   3487 ;--------------------------
      0013D4                       3488 size:
      009275 00 0A 72         [ 2] 3489 	ldw x,#tib 
      009278 5F 00 09 72      [ 2] 3490 	subw x,txtend 
      00927C B9 00            [ 1] 3491 	ld a,#TK_INTGR
      00927E 09               [ 4] 3492 	ret 
                                   3493 
                                   3494 
                                   3495 ;------------------------
                                   3496 ; BASIC: UBOUND  
                                   3497 ; return array variable size 
                                   3498 ; output:
                                   3499 ;   A 		TK_INTGR
                                   3500 ;   X 	    array size 
                                   3501 ;--------------------------
      0013DE                       3502 ubound:
      00927F 90 FE 7B         [ 2] 3503 	ldw x,#tib
      009282 01 4E A4 0C      [ 2] 3504 	subw x,txtend 
      009286 44 44 AB 06      [ 2] 3505 	ldw y,basicptr 
      00928A 90 C3 00 1C      [ 2] 3506 	cpw y,txtend 
      00928A 93 5B            [ 1] 3507 	jrult 1$
      00928C 03 81 03         [ 1] 3508 	push count 
      00928E 4B 00            [ 1] 3509 	push #0 
      00928E 88 CD 88         [ 2] 3510 	subw x,(1,sp)
      0013F7                       3511 	_drop 2 
      009291 DC 11            [ 2]    1     addw sp,#2 
      009293 01               [ 2] 3512 1$:	srlw x 
      009294 27 03 CC         [ 2] 3513 	ldw array_size,x
      009297 88 15            [ 1] 3514 	ld a,#TK_INTGR
      009299 84               [ 4] 3515 	ret 
                                   3516 
                                   3517 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3518 ; BASIC: LET var=expr 
                                   3519 ; variable assignement 
                                   3520 ; output:
                                   3521 ;   A 		TK_NONE 
                                   3522 ;-----------------------------
      001400                       3523 let:
      00929A 81 08 5C         [ 4] 3524 	call next_token 
      00929B A1 05            [ 1] 3525 	cp a,#TK_VAR 
      00929B 4B 00            [ 1] 3526 	jreq let02
      00929D CD 93 E3         [ 2] 3527 	jp syntax_error
      00140A                       3528 let02:
      0092A0 A1 00 27         [ 4] 3529 	call dpush 
      0092A3 19 A1 04         [ 4] 3530 	call next_token 
      0092A6 26 12            [ 1] 3531 	cp a,#TK_EQUAL
      0092A8 CD 90            [ 1] 3532 	jreq 1$
      0092AA 6E 0C 01         [ 2] 3533 	jp syntax_error
      001417                       3534 1$:	
      0092AD CD 88 DC         [ 4] 3535 	call relation   
      0092B0 A1 00            [ 1] 3536 	cp a,#TK_INTGR 
      0092B2 27 09            [ 1] 3537 	jreq 2$
      0092B4 A1 0D 26         [ 2] 3538 	jp syntax_error
      001421                       3539 2$:	
      0092B7 02 20            [ 1] 3540 	ldw y,x 
      0092B9 E3 CD 90         [ 4] 3541 	call dpop  
      0092BC 68               [ 2] 3542 	ldw (x),y   
      0092BD 84               [ 4] 3543 	ret 
                                   3544 
                                   3545 ;----------------------------
                                   3546 ; BASIC: LIST [[start][,end]]
                                   3547 ; list program lines 
                                   3548 ; form start to end 
                                   3549 ; if empty argument list then 
                                   3550 ; list all.
                                   3551 ;----------------------------
                           000001  3552 	FIRST=1
                           000003  3553 	LAST=3 
                           000005  3554 	LN_PTR=5
                           000006  3555 	VSIZE=6 
      001428                       3556 list:
      001428                       3557 	_vars VSIZE
      0092BE 81 06            [ 2]    1     sub sp,#VSIZE 
      0092BF CE 00 1A         [ 2] 3558 	ldw x,txtbgn 
      0092BF A6 0B CD         [ 2] 3559 	cpw x,txtend 
      0092C2 92 8E            [ 1] 3560 	jrmi 1$
      0092C4 CD 92 9B         [ 2] 3561 	jp list_exit ; nothing to list 
      0092C7 88 A6            [ 2] 3562 1$:	ldw (LN_PTR,sp),x 
      0092C9 0C               [ 2] 3563 	ldw x,(x) 
      0092CA CD 92            [ 2] 3564 	ldw (FIRST,sp),x ; list from first line 
      0092CC 8E 84 81         [ 2] 3565 	ldw x,#0x7fff ; biggest line number 
      0092CF 1F 03            [ 2] 3566 	ldw (LAST,sp),x 
      0092CF CD 92 BF         [ 4] 3567 	call arg_list
      0092D2 A1               [ 1] 3568 	tnz a
      0092D3 01 27            [ 1] 3569 	jreq list_start 
      0092D5 03 CC            [ 1] 3570 	cp a,#2 
      0092D7 88 15            [ 1] 3571 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0092D9 CD 90            [ 1] 3572 	cp a,#1 
      0092DB 7B C3            [ 1] 3573 	jreq first_line 
      0092DD 00 20 23         [ 2] 3574 	jp syntax_error 
      0092E0 05 A6 0A         [ 4] 3575 4$:	call dswap
      001453                       3576 first_line:
      0092E3 CC 88 17         [ 4] 3577 	call dpop 
      0092E6 5D 27            [ 2] 3578 	ldw (FIRST,sp),x 
      0092E8 F8 58            [ 1] 3579 	cp a,#1 
      0092EA 89 AE            [ 1] 3580 	jreq lines_skip 	
      00145C                       3581 last_line:
      0092EC 16 C8 72         [ 4] 3582 	call dpop 
      0092EF F0 01            [ 2] 3583 	ldw (LAST,sp),x 
      001461                       3584 lines_skip:
      0092F1 5B 02 A6         [ 2] 3585 	ldw x,txtbgn
      0092F4 04 81            [ 2] 3586 2$:	ldw (LN_PTR,sp),x 
      0092F6 C3 00 1C         [ 2] 3587 	cpw x,txtend 
      0092F6 52 01            [ 1] 3588 	jrpl list_exit 
      0092F8 CD               [ 2] 3589 	ldw x,(x) ;line# 
      0092F9 88 DC            [ 2] 3590 	cpw x,(FIRST,sp)
      0092FB A1 02            [ 1] 3591 	jrpl list_start 
      0092FD 2B 50            [ 2] 3592 	ldw x,(LN_PTR,sp) 
      0092FF 6B 01 A4         [ 2] 3593 	addw x,#2 
      009302 30               [ 1] 3594 	ld a,(x)
      009303 A1               [ 2] 3595 	incw x 
      009304 10 27 04         [ 1] 3596 	ld acc8,a 
      009307 7B 01 20 03      [ 1] 3597 	clr acc16 
      00930B 72 BB 00 08      [ 2] 3598 	addw x,acc16
      00930B CD 88            [ 2] 3599 	jra 2$ 
                                   3600 ; print loop
      001484                       3601 list_start:
      00930D DC 05            [ 2] 3602 	ldw x,(LN_PTR,sp)
      00930E                       3603 3$:	
      00930E A1 07 26         [ 4] 3604 	call prt_basic_line
      009311 03 FD            [ 2] 3605 	ldw x,(LN_PTR,sp)
      009313 20 31            [ 1] 3606 	ld a,(2,x)
      009315 C7 00 09         [ 1] 3607 	ld acc8,a 
      009315 A1 04 26 02      [ 1] 3608 	clr acc16 
      009319 20 2B 00 08      [ 2] 3609 	addw x,acc16
      00931B C3 00 1C         [ 2] 3610 	cpw x,txtend 
      00931B A1 02            [ 1] 3611 	jrpl list_exit
      00931D 26 06            [ 2] 3612 	ldw (LN_PTR,sp),x
      00931F CD               [ 2] 3613 	ldw x,(x)
      009320 92 CF            [ 2] 3614 	cpw x,(LAST,sp)  
      009322 FE 20            [ 1] 3615 	jrsgt list_exit 
      009324 21 05            [ 2] 3616 	ldw x,(LN_PTR,sp)
      009325 20 DE            [ 2] 3617 	jra 3$
      0014A8                       3618 list_exit:
      0014A8                       3619 	_drop VSIZE 
      009325 A1 05            [ 2]    1     addw sp,#VSIZE 
      009327 26               [ 4] 3620 	ret
                                   3621 
                                   3622 ;-------------------------
                                   3623 ; print counted string 
                                   3624 ; input:
                                   3625 ;   X 		address of string
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3626 ;--------------------------
      0014AB                       3627 prt_cmd_name:
      009328 03               [ 1] 3628 	ld a,(x)
      009329 FE               [ 2] 3629 	incw x
      00932A 20 1A            [ 1] 3630 	and a,#15  
      00932C 88               [ 1] 3631 	push a 
      00932C A1 09            [ 1] 3632 1$: tnz (1,sp) 
      00932E 27 16            [ 1] 3633 	jreq 9$
      009330 F6               [ 1] 3634 	ld a,(x)
      009330 A1 0B 26         [ 4] 3635 	call putc 
      009333 0C               [ 2] 3636 	incw x
      009334 CD 93            [ 1] 3637 	dec (1,sp)	 
      009336 E3 89            [ 2] 3638 	jra 1$
      009338 A6               [ 1] 3639 9$: pop a 
      009339 0C               [ 4] 3640 	ret	
                                   3641 
                                   3642 ;--------------------------
                                   3643 ; print TK_QSTR
                                   3644 ; converting control character
                                   3645 ; to backslash sequence
                                   3646 ; input:
                                   3647 ;   X        char *
                                   3648 ;-----------------------------
      0014BF                       3649 prt_quote:
      00933A CD 92            [ 1] 3650 	ld a,#'"
      00933C 8E 85 20         [ 4] 3651 	call putc 
      00933F 06               [ 1] 3652 1$:	ld a,(x)
      009340 27 2D            [ 1] 3653 	jreq 9$
      009340 CD               [ 2] 3654 	incw x 
      009341 90 68            [ 1] 3655 	cp a,#SPACE 
      009343 4F 20            [ 1] 3656 	jrult 3$
      009345 09 01 CB         [ 4] 3657 	call putc
      009346 A1 5C            [ 1] 3658 	cp a,#'\ 
      009346 A6 11            [ 1] 3659 	jrne 1$ 
      0014D3                       3660 2$:
      009348 11 01 26         [ 4] 3661 	call putc 
      00934B 01 50            [ 2] 3662 	jra 1$
      00934D 88               [ 1] 3663 3$: push a 
      00934D A6 04            [ 1] 3664 	ld a,#'\
      00934F CD 01 CB         [ 4] 3665 	call putc 
      00934F 5B               [ 1] 3666 	pop a 
      009350 01 81            [ 1] 3667 	sub a,#7
      009352 C7 00 09         [ 1] 3668 	ld acc8,a 
      009352 52 05 CD 92      [ 1] 3669 	clr acc16
      009356 F6 A1 02 2B      [ 2] 3670 	ldw y,#escaped 
      00935A 41 B9 00 08      [ 2] 3671 	addw y,acc16 
      00935B 90 F6            [ 1] 3672 	ld a,(y)
      00935B 1F 03            [ 2] 3673 	jra 2$
      00935D CD 88            [ 1] 3674 9$: ld a,#'"
      00935F DC A1 02         [ 4] 3675 	call putc 
      009362 2B               [ 2] 3676 	incw x 
      009363 34               [ 4] 3677 	ret
                                   3678 
                                   3679 
                                   3680 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3681 ; decompile line from token list 
                                   3682 ; input:
                                   3683 ;   X 		pointer at line
                                   3684 ; output:
                                   3685 ;   none 
                                   3686 ;--------------------------	
                           000001  3687 	BASE_SAV=1
                           000002  3688 	WIDTH_SAV=2
                           000003  3689 	XSAVE=3
                           000005  3690 	LLEN=5
                           000005  3691 	VSIZE=5 
      0014FB                       3692 prt_basic_line:
      0014FB                       3693 	_vars VSIZE 
      009364 6B 05            [ 2]    1     sub sp,#VSIZE 
      009366 A4 30 A1         [ 1] 3694 	ld a,base
      009369 20 27            [ 1] 3695 	ld (BASE_SAV,sp),a  
      00936B 07 7B 05         [ 1] 3696 	ld a,tab_width 
      00936E CD 90            [ 1] 3697 	ld (WIDTH_SAV,sp),a 
      009370 68 20 25         [ 2] 3698 	ldw ptr16,x
      009373 FE               [ 2] 3699 	ldw x,(x)
      009373 CD 92 F6 A1      [ 1] 3700 	mov base,#10
      009377 04 27 03 CC      [ 1] 3701 	mov tab_width,#5
      00937B 88 15 1F         [ 4] 3702 	call print_int ; print line number 
      00937E 01 7B            [ 1] 3703 	ld a,#SPACE 
      009380 05 A1 20         [ 4] 3704 	call putc 
      009383 26 05 CD 91      [ 1] 3705 	clr tab_width
      009387 6A 20 D1         [ 2] 3706 	ldw x,#2
      00938A A1 21 26 05      [ 4] 3707 	ld a,([ptr16],x)
      00938E CD 91            [ 1] 3708 	ld (LLEN,sp),a 
      009390 B2               [ 2] 3709 	incw x
      009391 20               [ 1] 3710 1$:	ld a,xl 
      009392 C8 CD            [ 1] 3711 	cp a,(LLEN,sp)
      009394 91 F6            [ 1] 3712 	jrmi 20$
      009396 20 C3 1E         [ 2] 3713 	jp 90$
      001531                       3714 20$:	 
      009399 03 A6 04 13      [ 4] 3715 	ld a,([ptr16],x)
      00939C 5C               [ 2] 3716 	incw x 
      00939C 5B 05            [ 2] 3717 	ldw (XSAVE,sp),x 
      00939E 81 06            [ 1] 3718 	cp a,#TK_CMD 
      00939F 25 44            [ 1] 3719 	jrult 5$
      00939F 52 05            [ 1] 3720 	cp a,#TK_CONST 
      0093A1 CD 93            [ 1] 3721 	jrugt 4$
      001540                       3722 2$:	
      0093A3 52 A1 02 2B      [ 5] 3723 	ldw x,([ptr16],x)
      0093A7 38 1F 03         [ 2] 3724 	cpw x,#rem 
      0093AA CD 88            [ 1] 3725 	jrne 3$
      0093AC DC A1            [ 1] 3726 	ld a,#''
      0093AE 02 2B 2B         [ 4] 3727 	call putc 
      0093B1 6B 05            [ 2] 3728 	ldw x,(XSAVE,sp)
      0093B3 A4 30 A1         [ 2] 3729 	addw x,#2
      0093B6 10 27 07 7B      [ 2] 3730 	addw x,ptr16  
      0093BA 05 CD 90         [ 4] 3731 	call puts 
      0093BD 68 20 1C         [ 2] 3732 	jp 90$ 
      0093C0 CD 11 87         [ 4] 3733 3$:	call cmd_name
      0093C0 CD 93 52         [ 4] 3734 	call prt_cmd_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0093C3 A1 04            [ 1] 3735 	ld a,#SPACE 
      0093C5 27 03 CC         [ 4] 3736 	call putc 
      0093C8 88 15            [ 2] 3737 	ldw x,(XSAVE,sp)
      0093CA 1F 01 7B         [ 2] 3738 	addw x,#2
      0093CD 05 A1            [ 2] 3739 	jra 1$
      0093CF 10 26            [ 1] 3740 4$: cp a,#TK_QSTR 
      0093D1 05 CD            [ 1] 3741 	jrne 5$
      0093D3 91 5C 20 D1      [ 2] 3742 	addw x,ptr16
      0093D7 CD 91 64         [ 4] 3743 	call prt_quote 
      0093DA 20 CC 1E 03      [ 2] 3744 	subw x,ptr16  
      0093DE A6 04            [ 2] 3745 	jra 1$
      0093E0 A1 05            [ 1] 3746 5$:	cp a,#TK_VAR
      0093E0 5B 05            [ 1] 3747 	jrne 6$ 
      0093E2 81 DE 00 13      [ 5] 3748 	ldw x,([ptr16],x)
      0093E3 1D 00 23         [ 2] 3749 	subw x,#vars 
      0093E3 52               [ 1] 3750 	ld a,xl
      0093E4 05               [ 1] 3751 	srl a 
      0093E5 CD 93            [ 1] 3752 	add a,#'A 
      0093E7 9F A1 02         [ 4] 3753 	call putc 
      0093EA 2B 4B            [ 1] 3754 	ld a,#SPACE 
      0093EC 1F 03 CD         [ 4] 3755 	call putc 
      0093EF 88 DC            [ 2] 3756 	ldw x,(XSAVE,sp)
      0093F1 A1 02 2B         [ 2] 3757 	addw x,#2 
      0093F4 3E 8B            [ 2] 3758 	jra 1$ 
      0093F5 A1 02            [ 1] 3759 6$: cp a,#TK_ARRAY 
      0093F5 6B 05            [ 1] 3760 	jrne 7$
      0093F7 A4 30            [ 1] 3761 	ld a,#'@ 
      0093F9 A1 30 27         [ 4] 3762 	call putc 
      0093FC 07 7B            [ 2] 3763 	ldw x,(XSAVE,sp)
      0093FE 05 CD 90         [ 2] 3764 	jp 1$ 
      009401 68 20            [ 1] 3765 7$: cp a,#TK_INTGR 
      009403 2F 14            [ 1] 3766 	jrne 8$
      009404 72 DE 00 13      [ 5] 3767 	ldw x,([ptr16],x)
      009404 CD 93 9F         [ 4] 3768 	call print_int
      009407 A1 04            [ 1] 3769 	ld a,#SPACE 
      009409 27 03 CC         [ 4] 3770 	call putc 
      00940C 88 15            [ 2] 3771 	ldw x,(XSAVE,sp)
      00940E 1F 01 CD         [ 2] 3772 	addw x,#2 
      009411 91 64 26         [ 2] 3773 	jp 1$
      009414 06 35            [ 1] 3774 8$: cp a,#TK_GT 
      009416 02 00            [ 1] 3775 	jrmi 9$
      009418 0A 20            [ 1] 3776 	cp a,#TK_NE 
      00941A 0C 16            [ 1] 3777 	jrugt 9$
      00941B A0 31            [ 1] 3778 	sub a,#TK_GT  
      00941B 2C               [ 1] 3779 	sll a 
      00941C 06 35            [ 1] 3780 	clrw y 
      00941E 04 00            [ 1] 3781 	ld yl,a 
      009420 0A 20 04 51      [ 2] 3782 	addw y,#relop_str 
      009423 90 FE            [ 2] 3783 	ldw y,(y)
      009423 35               [ 1] 3784 	ldw x,y 
      009424 01 00 0A         [ 4] 3785 	call puts 
      009427 1E 03            [ 2] 3786 	ldw x,(XSAVE,sp)
      009427 5F C6 00         [ 2] 3787 	jp 1$
      00942A 0A 14            [ 1] 3788 9$: cp a,#TK_PLUS 
      00942C 05 4D            [ 1] 3789 	jrne 10$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00942E 27 05            [ 1] 3790 	ld a,#'+
      009430 5C 46            [ 2] 3791 	jra 80$ 
      009431 A1 11            [ 1] 3792 10$: cp a,#TK_MINUS
      009431 20 02            [ 1] 3793 	jrne 11$
      009433 1E 03            [ 1] 3794 	ld a,#'-
      009435 20 3E            [ 2] 3795 	jra 80$
      009435 A6 04            [ 1] 3796 11$: cp a,#TK_MULT 
      009437 2B 0E            [ 1] 3797 	jrmi 12$
      009437 5B 05            [ 1] 3798 	cp a,#TK_MOD 
      009439 81 0A            [ 1] 3799 	jrugt 12$
      00943A A0 20            [ 1] 3800 	sub a,#0x20
      00943A C6               [ 1] 3801 	clrw x 
      00943B 00               [ 1] 3802 	ld xl,a 
      00943C 07 88 CD         [ 2] 3803 	addw x,#mul_char 
      00943F 90               [ 1] 3804 	ld a,(x)
      009440 FC CD            [ 2] 3805 	jra 80$ 
      009442 91 2F            [ 1] 3806 12$: cp a,#TK_LPAREN 
      009444 84 C7            [ 1] 3807 	jrmi 13$
      009446 00 07            [ 1] 3808 	cp a,#TK_SHARP 
      009448 4F 81            [ 1] 3809 	jrugt 13$
      00944A A0 0B            [ 1] 3810 	sub a,#TK_LPAREN
      00944A 35               [ 1] 3811 	clrw x 
      00944B 10               [ 1] 3812 	ld xl,a 
      00944C 00 07 81         [ 2] 3813 	addw x,#single_char 
      00944F F6               [ 1] 3814 	ld a,(x)
      00944F 35 0A            [ 2] 3815 	jra 80$
      009451 00 07            [ 1] 3816 13$: cp a,#TK_CHAR 
      009453 81 14            [ 1] 3817 	jrne 14$
      009454 A6 5C            [ 1] 3818 	ld a,#'\
      009454 AE 16 C8         [ 4] 3819 	call putc 
      009457 72 B0            [ 2] 3820 	ldw x,(XSAVE,sp)
      009459 00 1D A6 04      [ 4] 3821 	ld a,([ptr16],x)
      00945D 81               [ 2] 3822 	incw x 
      00945E 1F 03            [ 2] 3823 	ldw (XSAVE,sp),x 
      00945E AE 16 C8         [ 4] 3824 	call putc 
      009461 72 B0 00         [ 2] 3825 	jp 1$ 
      009464 1D 90            [ 1] 3826 14$: ld a,#':
      009466 CE 00 05         [ 4] 3827 80$: call putc 
      009469 90 C3            [ 2] 3828 	ldw x,(XSAVE,sp)
      00946B 00 1D 25         [ 2] 3829 	jp 1$ 
      001638                       3830 90$: 
      00946E 0A 3B            [ 1] 3831 	ld a,#CR 
      009470 00 04 4B         [ 4] 3832 	call putc
      009473 00 72            [ 1] 3833 	ld a,(WIDTH_SAV,sp) 
      009475 F0 01 5B         [ 1] 3834 	ld tab_width,a 
      009478 02 54            [ 1] 3835 	ld a,(BASE_SAV,sp) 
      00947A CF 00 20         [ 1] 3836 	ld base,a
      001647                       3837 	_drop VSIZE 
      00947D A6 04            [ 2]    1     addw sp,#VSIZE 
      00947F 81               [ 4] 3838 	ret 	
      009480 28 29 2C 23           3839 single_char: .byte '(',')',',','#'
      009480 CD 88 DC              3840 mul_char: .byte '*','/','%'
      009483 A1 05 27 03 CC 88 15  3841 relop_str: .word gt,equal,ge,lt,le,ne 
             64 16 66 16 69
      00948A 3E 00                 3842 gt: .asciz ">"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      00948A CD 90                 3843 equal: .asciz "="
      00948C 6E CD 88              3844 ge: .asciz ">="
      00948F DC A1                 3845 lt: .asciz "<"
      009491 32 27 03              3846 le: .asciz "<="
      009494 CC 88 15              3847 ne:  .asciz "<>"
                                   3848 
                                   3849 
                                   3850 ;---------------------------------
                                   3851 ; BASIC: PRINT|? arg_list 
                                   3852 ; print values from argument list
                                   3853 ;----------------------------------
                           000001  3854 	COMMA=1
                           000001  3855 	VSIZE=1
      009497                       3856 print:
      009497 CD 93            [ 1] 3857 push #0 ; local variable COMMA 
      00166E                       3858 reset_comma:
      009499 E3 A1            [ 1] 3859 	clr (COMMA,sp)
      001670                       3860 prt_loop:
      00949B 04 27 03         [ 4] 3861 	call relation 
      00949E CC 88            [ 1] 3862 	cp a,#TK_COLON 
      0094A0 15 5A            [ 1] 3863 	jreq print_exit   
      0094A1 A1 04            [ 1] 3864 	cp a,#TK_INTGR 
      0094A1 90 93            [ 1] 3865 	jrne 0$ 
      0094A3 CD 90 7B         [ 4] 3866 	call print_int 
      0094A6 FF 81            [ 2] 3867 	jra reset_comma
      0094A8                       3868 0$: 	
      0094A8 52 06 CE         [ 4] 3869 	call next_token
      0094AB 00 1B            [ 1] 3870 	cp a,#TK_NONE 
      0094AD C3 00            [ 1] 3871 	jreq print_exit 
      0094AF 1D 2B            [ 1] 3872 1$:	cp a,#TK_QSTR
      0094B1 03 CC            [ 1] 3873 	jrne 2$   
      0094B3 95 28 1F         [ 4] 3874 	call puts
      0094B6 05               [ 2] 3875 	incw x 
      0094B7 FE 1F 01 AE      [ 2] 3876 	subw x,basicptr 
      0094BB 7F               [ 1] 3877 	ld a,xl 
      0094BC FF 1F 03         [ 1] 3878 	ld in,a  
      0094BF CD 92            [ 2] 3879 	jra reset_comma
      0094C1 9B 4D            [ 1] 3880 2$: cp a,#TK_CHAR 
      0094C3 27 3F            [ 1] 3881 	jrne 3$
      0094C5 A1               [ 1] 3882 	ld a,xl 
      0094C6 02 27 07         [ 4] 3883 	call putc 
      0094C9 A1 01            [ 2] 3884 	jra reset_comma 
      0016A3                       3885 3$: 	
      0094CB 27 06            [ 1] 3886 	cp a,#TK_CFUNC 
      0094CD CC 88            [ 1] 3887 	jrne 4$ 
      0094CF 15               [ 4] 3888 	call (x)
      0094D0 CD               [ 1] 3889 	ld a,xl 
      0094D1 90 88 CB         [ 4] 3890 	call putc
      0094D3 20 C0            [ 2] 3891 	jra reset_comma 
      0016AE                       3892 4$: 
      0094D3 CD 90            [ 1] 3893 	cp a,#TK_COMMA 
      0094D5 7B 1F            [ 1] 3894 	jrne 5$
      0094D7 01 A1            [ 1] 3895 	cpl (COMMA,sp) 
      0094D9 01 27 05         [ 2] 3896 	jp prt_loop   
      0094DC                       3897 5$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0094DC CD 90            [ 1] 3898 	cp a,#TK_SHARP
      0094DE 7B 1F            [ 1] 3899 	jrne 7$
      0094E0 03 08 5C         [ 4] 3900 	call next_token
      0094E1 A1 04            [ 1] 3901 	cp a,#TK_INTGR 
      0094E1 CE 00            [ 1] 3902 	jreq 6$
      0094E3 1B 1F 05         [ 2] 3903 	jp syntax_error 
      0016C5                       3904 6$:
      0094E6 C3               [ 1] 3905 	ld a,xl 
      0094E7 00 1D            [ 1] 3906 	and a,#15 
      0094E9 2A 3D FE         [ 1] 3907 	ld tab_width,a 
      0094EC 13 01 2A         [ 2] 3908 	jp reset_comma 
      0016CE                       3909 7$:	
      0094EF 14 1E 05         [ 4] 3910 	call unget_token
      0016D1                       3911 print_exit:
      0094F2 1C 00            [ 1] 3912 	tnz (COMMA,sp)
      0094F4 02 F6            [ 1] 3913 	jrne 9$
      0094F6 5C C7            [ 1] 3914 	ld a,#CR 
      0094F8 00 0A 72         [ 4] 3915     call putc 
      0016DA                       3916 9$:	_drop VSIZE 
      0094FB 5F 00            [ 2]    1     addw sp,#VSIZE 
      0094FD 09               [ 4] 3917 	ret 
                                   3918 
                                   3919 ;----------------------
                                   3920 ; 'save_context' and
                                   3921 ; 'rest_context' must be 
                                   3922 ; called at the same 
                                   3923 ; call stack depth 
                                   3924 ; i.e. SP must have the 
                                   3925 ; save value at  
                                   3926 ; entry point of both 
                                   3927 ; routine. 
                                   3928 ;---------------------
                           000006  3929 	CTXT_SIZE=6 ; size of saved data 
                                   3930 ;--------------------
                                   3931 ; save current BASIC
                                   3932 ; interpreter context 
                                   3933 ; on cstack 
                                   3934 ;--------------------
      0016DD                       3935 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0016DD                       3936 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      0016DD                       3937 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      0016DD                       3938 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      0016DD                       3939 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      0016DD                       3940 save_context:
      0094FE 72 BB 00         [ 2] 3941 	ldw x,basicptr 
      009501 09 20            [ 2] 3942 	ldw (BPTR,sp),x
      009503 E0 00 01         [ 1] 3943 	ld a,in 
      009504 6B 07            [ 1] 3944 	ld (IN,sp),a
      009504 1E 05 03         [ 1] 3945 	ld a,count 
      009506 6B 08            [ 1] 3946 	ld (CNT,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009506 CD               [ 4] 3947 	ret
                                   3948 
                                   3949 ;-----------------------
                                   3950 ; restore previously saved 
                                   3951 ; BASIC interpreter context 
                                   3952 ; from cstack 
                                   3953 ;-------------------------
      0016ED                       3954 rest_context:
      009507 95 7B            [ 2] 3955 	ldw x,(BPTR,sp)
      009509 1E 05 E6         [ 2] 3956 	ldw basicptr,x 
      00950C 02 C7            [ 1] 3957 	ld a,(IN,sp)
      00950E 00 0A 72         [ 1] 3958 	ld in,a
      009511 5F 00            [ 1] 3959 	ld a,(CNT,sp)
      009513 09 72 BB         [ 1] 3960 	ld count,a  
      009516 00               [ 4] 3961 	ret
                                   3962 
                                   3963 ;------------------------------------------
                                   3964 ; BASIC: INPUT [string],var[,[string],var]
                                   3965 ; input value in variables 
                                   3966 ; [string] optionally can be used as prompt 
                                   3967 ;-----------------------------------------
                           000001  3968 	CX_BPTR=1
                           000003  3969 	CX_LNO=3
                           000004  3970 	CX_IN=4
                           000005  3971 	CX_CNT=5
                           000006  3972 	SKIP=6
                           000007  3973 	VSIZE=7
      0016FD                       3974 input_var:
      009517 09 C3 00 1D 2A   [ 2] 3975 	btjt flags,#FRUN,1$ 
      00951C 0B 1F            [ 1] 3976 	ld a,#ERR_RUN_ONLY 
      00951E 05 FE 13         [ 2] 3977 	jp tb_error 
      001707                       3978 1$:	_vars VSIZE 
      009521 03 2C            [ 2]    1     sub sp,#VSIZE 
      001709                       3979 input_loop:
      009523 04 1E            [ 1] 3980 	clr (SKIP,sp)
      009525 05 20 DE         [ 4] 3981 	call next_token 
      009528 A1 00            [ 1] 3982 	cp a,#TK_NONE 
      009528 5B 06            [ 1] 3983 	jreq input_exit 
      00952A 81 0A            [ 1] 3984 	cp a,#TK_QSTR 
      00952B 26 08            [ 1] 3985 	jrne 1$ 
      00952B F6 5C A4         [ 4] 3986 	call puts 
      00952E 0F 88            [ 1] 3987 	cpl (SKIP,sp)
      009530 0D 01 27         [ 4] 3988 	call next_token 
      009533 09 F6            [ 1] 3989 1$: cp a,#TK_VAR  
      009535 CD 82            [ 1] 3990 	jreq 2$ 
      009537 4B 5C 0A         [ 2] 3991 	jp syntax_error
      00953A 01 20 F3         [ 4] 3992 2$:	call dpush 
      00953D 84 81            [ 1] 3993 	tnz (SKIP,sp)
      00953F 26 0F            [ 1] 3994 	jrne 21$ 
      00953F A6 22            [ 1] 3995 	ld a,#':
      009541 CD 82 4B         [ 1] 3996 	ld pad+1,a 
      009544 F6 27 2D 5C      [ 1] 3997 	clr pad+2
      009548 A1 20 25         [ 2] 3998 	ldw x,#pad 
      00954B 0C CD 82         [ 4] 3999 	call puts   
      00173B                       4000 21$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      00954E 4B A1 5C         [ 4] 4001 	call save_context 
      009551 26 F1 C8         [ 2] 4002 	ldw x,#tib 
      009553 CF 00 04         [ 2] 4003 	ldw basicptr,x  
      009553 CD 82 4B 20      [ 1] 4004 	clr count  
      009557 EC 88 A6         [ 4] 4005 	call readln 
      00955A 5C CD 82 4B      [ 1] 4006 	clr in 
      00955E 84 A0 07         [ 4] 4007 	call relation 
      009561 C7 00            [ 1] 4008 	cp a,#TK_INTGR
      009563 0A 72            [ 1] 4009 	jreq 3$ 
      009565 5F 00 09         [ 2] 4010 	jp syntax_error
      009568 90 AE 8D         [ 4] 4011 3$: call dpush 
      00956B 37 72 B9         [ 4] 4012 	call store 
      00956E 00 09 90         [ 4] 4013 	call rest_context
      009571 F6 20 DF         [ 4] 4014 	call next_token 
      009574 A6 22            [ 1] 4015 	cp a,#TK_COMMA 
      009576 CD 82            [ 1] 4016 	jrne 4$
      009578 4B 5C            [ 2] 4017 	jra input_loop 
      00957A 81 0F E8         [ 4] 4018 4$:	call unget_token 
      00957B                       4019 input_exit:
      00176E                       4020 	_drop VSIZE 
      00957B 52 05            [ 2]    1     addw sp,#VSIZE 
      00957D C6               [ 4] 4021 	ret 
                                   4022 
                                   4023 
                                   4024 ;---------------------
                                   4025 ; BASIC: REMARK | ' 
                                   4026 ; skip comment to end of line 
                                   4027 ;---------------------- 
      001771                       4028 rem:
      00957E 00 07 6B 01 C6   [ 1] 4029  	mov count,in 
      009583 00               [ 4] 4030 	ret 
                                   4031 
                                   4032 ;---------------------
                                   4033 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   4034 ; read in loop 'addr'  
                                   4035 ; apply & 'mask' to value 
                                   4036 ; loop while result==0.  
                                   4037 ; if 'xor_mask' given 
                                   4038 ; apply ^ in second  
                                   4039 ; loop while result==0 
                                   4040 ;---------------------
                           000001  4041 	XMASK=1 
                           000002  4042 	MASK=2
                           000003  4043 	ADDR=3
                           000004  4044 	VSIZE=4
      001777                       4045 wait: 
      001777                       4046 	_vars VSIZE
      009584 23 6B            [ 2]    1     sub sp,#VSIZE 
      009586 02 CF            [ 1] 4047 	clr (XMASK,sp) 
      009588 00 14 FE         [ 4] 4048 	call arg_list 
      00958B 35 0A            [ 1] 4049 	cp a,#2
      00958D 00 07            [ 1] 4050 	jruge 0$
      00958F 35 05 00         [ 2] 4051 	jp syntax_error 
      009592 23 CD            [ 1] 4052 0$:	cp a,#3
      009594 8A 75            [ 1] 4053 	jrult 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009596 A6 20 CD         [ 4] 4054 	call dpop 
      009599 82               [ 1] 4055 	ld a,xl
      00959A 4B 72            [ 1] 4056 	ld (XMASK,sp),a 
      00959C 5F 00 23         [ 4] 4057 1$: call dpop ; mask 
      00959F AE               [ 1] 4058 	ld a,xl 
      0095A0 00 02            [ 1] 4059 	ld (MASK,sp),a 
      0095A2 72 D6 00         [ 4] 4060 	call dpop ; address 
      0095A5 14               [ 1] 4061 2$:	ld a,(x)
      0095A6 6B 05            [ 1] 4062 	and a,(MASK,sp)
      0095A8 5C 9F            [ 1] 4063 	xor a,(XMASK,sp)
      0095AA 11 05            [ 1] 4064 	jreq 2$ 
      00179F                       4065 	_drop VSIZE 
      0095AC 2B 03            [ 2]    1     addw sp,#VSIZE 
      0095AE CC               [ 4] 4066 	ret 
                                   4067 
                                   4068 ;---------------------
                                   4069 ; BASIC: BSET addr,mask
                                   4070 ; set bits at 'addr' corresponding 
                                   4071 ; to those of 'mask' that are at 1.
                                   4072 ; arguments:
                                   4073 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4074 ;   mask        mask|addr
                                   4075 ; output:
                                   4076 ;	none 
                                   4077 ;--------------------------
      0017A2                       4078 bit_set:
      0095AF 96 B8 1B         [ 4] 4079 	call arg_list 
      0095B1 A1 02            [ 1] 4080 	cp a,#2	 
      0095B1 72 D6            [ 1] 4081 	jreq 1$ 
      0095B3 00 14 5C         [ 2] 4082 	jp syntax_error
      0017AC                       4083 1$: 
      0095B6 1F 03 A1         [ 4] 4084 	call dpop ; mask 
      0095B9 06               [ 1] 4085 	ld a,xl 
      0095BA 25 44 A1         [ 4] 4086 	call dpop ; addr  
      0095BD 09               [ 1] 4087 	or a,(x)
      0095BE 22               [ 1] 4088 	ld (x),a
      0095BF 2F               [ 4] 4089 	ret 
                                   4090 
                                   4091 ;---------------------
                                   4092 ; BASIC: BRES addr,mask
                                   4093 ; reset bits at 'addr' corresponding 
                                   4094 ; to those of 'mask' that are at 1.
                                   4095 ; arguments:
                                   4096 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4097 ;   mask	    ~mask&*addr  
                                   4098 ; output:
                                   4099 ;	none 
                                   4100 ;--------------------------
      0095C0                       4101 bit_reset:
      0095C0 72 DE 00         [ 4] 4102 	call arg_list 
      0095C3 14 A3            [ 1] 4103 	cp a,#2  
      0095C5 97 F1            [ 1] 4104 	jreq 1$ 
      0095C7 26 14 A6         [ 2] 4105 	jp syntax_error
      0017C0                       4106 1$: 
      0095CA 27 CD 82         [ 4] 4107 	call dpop ; mask 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0095CD 4B               [ 1] 4108 	ld a,xl 
      0095CE 1E               [ 1] 4109 	cpl a 
      0095CF 03 1C 00         [ 4] 4110 	call dpop ; addr  
      0095D2 02               [ 1] 4111 	and a,(x)
      0095D3 72               [ 1] 4112 	ld (x),a 
      0095D4 BB               [ 4] 4113 	ret 
                                   4114 
                                   4115 ;---------------------
                                   4116 ; BASIC: BRES addr,mask
                                   4117 ; toggle bits at 'addr' corresponding 
                                   4118 ; to those of 'mask' that are at 1.
                                   4119 ; arguments:
                                   4120 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4121 ;   mask	    mask^*addr  
                                   4122 ; output:
                                   4123 ;	none 
                                   4124 ;--------------------------
      0017CB                       4125 bit_toggle:
      0095D5 00 14 CD         [ 4] 4126 	call arg_list 
      0095D8 82 5D            [ 1] 4127 	cp a,#2 
      0095DA CC 96            [ 1] 4128 	jreq 1$ 
      0095DC B8 CD 92         [ 2] 4129 	jp syntax_error
      0095DF 07 CD 95         [ 4] 4130 1$: call dpop ; mask 
      0095E2 2B               [ 1] 4131 	ld a,xl 
      0095E3 A6 20 CD         [ 4] 4132 	call dpop ; addr  
      0095E6 82               [ 1] 4133 	xor a,(x)
      0095E7 4B               [ 1] 4134 	ld (x),a 
      0095E8 1E               [ 4] 4135 	ret 
                                   4136 
                                   4137 
                                   4138 ;---------------------
                                   4139 ; BASIC: BTEST(addr,bit)
                                   4140 ; return bit value at 'addr' 
                                   4141 ; bit is in range {0..7}.
                                   4142 ; arguments:
                                   4143 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4144 ;   bit 	    bit position {0..7}  
                                   4145 ; output:
                                   4146 ;	none 
                                   4147 ;--------------------------
      0017DF                       4148 bit_test:
      0095E9 03 1C 00         [ 4] 4149 	call func_args 
      0095EC 02 20            [ 1] 4150 	cp a,#2
      0095EE BA A1            [ 1] 4151 	jreq 0$
      0095F0 0A 26 0D         [ 2] 4152 	jp syntax_error
      0017E9                       4153 0$:	
      0095F3 72 BB 00         [ 4] 4154 	call dpop 
      0095F6 14               [ 1] 4155 	ld a,xl 
      0095F7 CD 95            [ 1] 4156 	and a,#7
      0095F9 3F               [ 1] 4157 	push a 
      0095FA 72 B0            [ 1] 4158 	ld a,#1 
      0095FC 00 14            [ 1] 4159 1$: tnz (1,sp)
      0095FE 20 A9            [ 1] 4160 	jreq 2$
      009600 A1               [ 1] 4161 	sll a 
      009601 05 26            [ 1] 4162 	dec (1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009603 1A 72            [ 2] 4163 	jra 1$
      009605 DE 00 14         [ 4] 4164 2$: call dpop 
      009608 1D               [ 1] 4165 	and a,(x)
      009609 00 24            [ 1] 4166 	jreq 3$
      00960B 9F 44            [ 1] 4167 	ld a,#1 
      00960D AB               [ 1] 4168 3$:	clrw x 
      00960E 41               [ 1] 4169 	ld xl,a 
      00960F CD 82            [ 1] 4170 	ld a,#TK_INTGR
      001807                       4171 	_drop 1 
      009611 4B A6            [ 2]    1     addw sp,#1 
      009613 20               [ 4] 4172 	ret
                                   4173 
                                   4174 
                                   4175 ;--------------------
                                   4176 ; BASIC: POKE addr,byte
                                   4177 ; put a byte at addr 
                                   4178 ;--------------------
      00180A                       4179 poke:
      009614 CD 82 4B         [ 4] 4180 	call arg_list 
      009617 1E 03            [ 1] 4181 	cp a,#2
      009619 1C 00            [ 1] 4182 	jreq 1$
      00961B 02 20 8B         [ 2] 4183 	jp syntax_error
      001814                       4184 1$:	
      00961E A1 02 26         [ 4] 4185 	call dpop 
      009621 0A               [ 1] 4186     ld a,xl 
      009622 A6 40 CD         [ 4] 4187 	call dpop 
      009625 82               [ 1] 4188 	ld (x),a 
      009626 4B               [ 4] 4189 	ret 
                                   4190 
                                   4191 ;-----------------------
                                   4192 ; BASIC: PEEK(addr)
                                   4193 ; get the byte at addr 
                                   4194 ; input:
                                   4195 ;	none 
                                   4196 ; output:
                                   4197 ;	X 		value 
                                   4198 ;-----------------------
      00181D                       4199 peek:
      009627 1E 03 CC         [ 4] 4200 	call func_args
      00962A 95 A9            [ 1] 4201 	cp a,#1
      00962C A1 04            [ 1] 4202 	jreq 1$
      00962E 26 14 72         [ 2] 4203 	jp syntax_error
      009631 DE 00 14         [ 4] 4204 1$:	call dpop 
      009634 CD               [ 1] 4205 	ld a,(x)
      009635 8A               [ 1] 4206 	clrw x 
      009636 75               [ 1] 4207 	ld xl,a 
      009637 A6 20            [ 1] 4208 	ld a,#TK_INTGR
      009639 CD               [ 4] 4209 	ret 
                                   4210 
                                   4211 ;----------------------------
                                   4212 ; BASIC: XPEEK(page,addr)
                                   4213 ; read extended memory byte
                                   4214 ; page in range {0,1,2}
                                   4215 ;----------------------------
      001830                       4216 xpeek:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00963A 82 4B 1E         [ 4] 4217 	call func_args 
      00963D 03 1C            [ 1] 4218 	cp a,#2 
      00963F 00 02            [ 1] 4219 	jreq 1$
      009641 CC 95 A9         [ 2] 4220 	jp syntax_error
      00183A                       4221 1$: 
      009644 A1 31 2B         [ 4] 4222 	call dpop 
      009647 1A A1 35         [ 2] 4223 	ldw farptr+1,x 
      00964A 22 16 A0         [ 4] 4224 	call dpop 
      00964D 31               [ 1] 4225 	ld a,xl 
      00964E 48 90 5F         [ 1] 4226 	ld farptr,a 
      009651 90               [ 1] 4227 	clrw x
      009652 97 72 A9 96      [ 5] 4228 	ldf a,[farptr]
      009656 D1               [ 1] 4229 	ld xl,a 
      009657 90 FE            [ 1] 4230 	ld a,#TK_INTGR 
      009659 93               [ 4] 4231 	ret 
                                   4232 
                                   4233 ;---------------------------
                                   4234 ; BASIC IF expr : instructions
                                   4235 ; evaluate expr and if true 
                                   4236 ; execute instructions on same line. 
                                   4237 ;----------------------------
      001850                       4238 if: 
      00965A CD 82 5D         [ 4] 4239 	call relation 
      00965D 1E 03            [ 1] 4240 	cp a,#TK_INTGR
      00965F CC 95            [ 1] 4241 	jreq 1$ 
      009661 A9 A1 10         [ 2] 4242 	jp syntax_error
      009664 26               [ 1] 4243 1$:	clr a 
      009665 04               [ 2] 4244 	tnzw x 
      009666 A6 2B            [ 1] 4245 	jrne 9$  
                                   4246 ;skip to next line
      009668 20 46 A1 11 26   [ 1] 4247 	mov in,count
      00966D 04               [ 4] 4248 9$:	ret 
                                   4249 
                                   4250 ;------------------------
                                   4251 ; BASIC: FOR var=expr 
                                   4252 ; set variable to expression 
                                   4253 ; leave variable address 
                                   4254 ; on dstack and set
                                   4255 ; FFOR bit in 'flags'
                                   4256 ;-----------------
                           000001  4257 	RETL1=1
                           000003  4258 	INW=3
                           000005  4259 	BPTR=5
      001864                       4260 for: ; { -- var_addr }
      00966E A6 2D            [ 1] 4261 	ld a,#TK_VAR 
      009670 20 3E A1         [ 4] 4262 	call expect
      009673 20 2B 0E         [ 4] 4263 	call dpush 
      009676 A1 22 22         [ 4] 4264 	call let02 
      009679 0A A0 20 5F      [ 1] 4265 	bset flags,#FFOR 
                                   4266 ; open space on cstack for BPTR and INW 
      00967D 97               [ 2] 4267 	popw x ; call return address 
      001874                       4268 	_vars 4
      00967E 1C 96            [ 2]    1     sub sp,#4 
      009680 CE               [ 2] 4269 	pushw x  ; RETL1 
      009681 F6               [ 1] 4270 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009682 20 2C            [ 2] 4271 	ldw (BPTR,sp),x 
      009684 A1 0B            [ 2] 4272 	ldw (INW,sp),x 
      009686 2B 0E A1         [ 4] 4273 	call next_token 
      009689 0E 22            [ 1] 4274 	cp a,#TK_CMD 
      00968B 0A A0            [ 1] 4275 	jreq 1$
      00968D 0B 5F 97         [ 2] 4276 	jp syntax_error
      001886                       4277 1$:  
      009690 1C 96 CA         [ 2] 4278 	cpw x,#to 
      009693 F6 20            [ 1] 4279 	jreq to
      009695 1A A1 03         [ 2] 4280 	jp syntax_error 
                                   4281 
                                   4282 ;-----------------------------------
                                   4283 ; BASIC: TO expr 
                                   4284 ; second part of FOR loop initilization
                                   4285 ; leave limit on dstack and set 
                                   4286 ; FTO bit in 'flags'
                                   4287 ;-----------------------------------
      00188E                       4288 to: ; { var_addr -- var_addr limit step }
      009698 26 14 A6 5C CD   [ 2] 4289 	btjt flags,#FFOR,1$
      00969D 82 4B 1E         [ 2] 4290 	jp syntax_error
      0096A0 03 72 D6         [ 4] 4291 1$: call relation  
      0096A3 00 14            [ 1] 4292 	cp a,#TK_INTGR 
      0096A5 5C 1F            [ 1] 4293 	jreq 2$ 
      0096A7 03 CD 82         [ 2] 4294 	jp syntax_error
      0018A0                       4295 2$: 
      0096AA 4B CC 95         [ 4] 4296     call dpush ; limit
      0096AD A9 A6 3A         [ 2] 4297 	ldw x,in.w 
      0096B0 CD 82 4B         [ 4] 4298 	call next_token
      0096B3 1E 03            [ 1] 4299 	cp a,#TK_NONE  
      0096B5 CC 95            [ 1] 4300 	jreq 4$ 
      0096B7 A9 06            [ 1] 4301 	cp a,#TK_CMD
      0096B8 26 05            [ 1] 4302 	jrne 3$
      0096B8 A6 0D CD         [ 2] 4303 	cpw x,#step 
      0096BB 82 4B            [ 1] 4304 	jreq step
      0018B6                       4305 3$:	
      0096BD 7B 02 C7         [ 4] 4306 	call unget_token   	 
      0018B9                       4307 4$:	
      0096C0 00 23 7B         [ 2] 4308 	ldw x,#1   ; default step  
      0096C3 01 C7            [ 2] 4309 	jra store_loop_addr 
                                   4310 
                                   4311 
                                   4312 ;----------------------------------
                                   4313 ; BASIC: STEP expr 
                                   4314 ; optional third par of FOR loop
                                   4315 ; initialization. 	
                                   4316 ;------------------------------------
      0018BE                       4317 step: ; {var limit -- var limit step}
      0096C5 00 07 5B 05 81   [ 2] 4318 	btjt flags,#FFOR,1$
      0096CA 28 29 2C         [ 2] 4319 	jp syntax_error
      0096CD 23 2A 2F         [ 4] 4320 1$: call relation
      0096D0 25 96            [ 1] 4321 	cp a,#TK_INTGR
      0096D2 DD 96            [ 1] 4322 	jreq store_loop_addr  
      0096D4 DF 96 E1         [ 2] 4323 	jp syntax_error
                                   4324 ; leave loop back entry point on cstack 
                                   4325 ; cstack is 2 call deep from interp_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0018D0                       4326 store_loop_addr:
      0096D7 96 E4 96         [ 4] 4327 	call dpush 
      0096DA E6 96 E9         [ 2] 4328 	ldw x,basicptr  
      0096DD 3E 00            [ 2] 4329 	ldw (BPTR,sp),x 
      0096DF 3D 00 3E         [ 2] 4330 	ldw x,in.w 
      0096E2 3D 00            [ 2] 4331 	ldw (INW,sp),x   
      0096E4 3C 00 3C 3D      [ 1] 4332 	bres flags,#FFOR 
      0096E8 00 3C 3E 00      [ 1] 4333 	inc loop_depth  
      0096EC 81               [ 4] 4334 	ret 
                                   4335 
                                   4336 ;--------------------------------
                                   4337 ; BASIC: NEXT var 
                                   4338 ; FOR loop control 
                                   4339 ; increment variable with step 
                                   4340 ; and compare with limit 
                                   4341 ; loop if threshold not crossed.
                                   4342 ; else clean both stacks. 
                                   4343 ; and decrement 'loop_depth' 
                                   4344 ;--------------------------------
      0018E6                       4345 next: ; {var limit step -- [var limit step ] }
      0096EC 4B 00 00 1E      [ 1] 4346 	tnz loop_depth 
      0096EE 26 03            [ 1] 4347 	jrne 1$ 
      0096EE 0F 01 95         [ 2] 4348 	jp syntax_error 
      0096F0                       4349 1$: 
      0096F0 CD 93            [ 1] 4350 	ld a,#TK_VAR 
      0096F2 E3 A1 01         [ 4] 4351 	call expect
                                   4352 ; check for good variable after NEXT 	 
      0096F5 27 5A            [ 1] 4353 	ldw y,x 
      0096F7 A1 04 26         [ 2] 4354 	ldw x,#4  
      0096FA 05 CD 8A 75      [ 4] 4355 	cpw y,([dstkptr],x) ; compare variables address 
      0096FE 20 EE            [ 1] 4356 	jreq 2$  
      009700 CC 07 95         [ 2] 4357 	jp syntax_error ; not the good one 
      001902                       4358 2$: ; increment variable 
      009700 CD               [ 1] 4359 	ldw x,y
      009701 88               [ 2] 4360 	ldw x,(x)  ; get var value 
      009702 DC A1 00         [ 2] 4361 	ldw acc16,x 
      009705 27 4A A1 0A      [ 5] 4362 	ldw x,[dstkptr] ; step
      009709 26 0E CD 82      [ 2] 4363 	addw x,acc16 ; var+step 
      00970D 5D 5C            [ 2] 4364 	ldw (y),x ; save var new value 
                                   4365 ; compare with limit 
      00970F 72 B0            [ 1] 4366 	ldw y,x 
      009711 00 05 9F C7      [ 5] 4367 	ldw x,[dstkptr] ; step in x 
      009715 00               [ 2] 4368 	tnzw x  
      009716 02 20            [ 1] 4369 	jrpl 4$ ; positive step 
                                   4370 ;negative step 
      009718 D5 A1 03         [ 2] 4371 	ldw x,#2
      00971B 26 06 9F CD      [ 4] 4372 	cpw y,([dstkptr],x)
      00971F 82 4B            [ 1] 4373 	jrslt loop_done
      009721 20 CB            [ 2] 4374 	jra loop_back 
      009723                       4375 4$: ; positive step
      009723 A1 08 26         [ 2] 4376 	ldw x,#2 
      009726 07 FD 9F CD      [ 4] 4377 	cpw y,([dstkptr],x)
      00972A 82 4B            [ 1] 4378 	jrsgt loop_done
      00192E                       4379 loop_back:
      00972C 20 C0            [ 2] 4380 	ldw x,(BPTR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      00972E CF 00 04         [ 2] 4381 	ldw basicptr,x 
      00972E A1 0D 26 05 03   [ 2] 4382 	btjf flags,#FRUN,1$ 
      009733 01 CC            [ 1] 4383 	ld a,(2,x)
      009735 96 F0 03         [ 1] 4384 	ld count,a
      009737 1E 03            [ 2] 4385 1$:	ldw x,(INW,sp)
      009737 A1 0E 26         [ 2] 4386 	ldw in.w,x 
      00973A 13               [ 4] 4387 	ret 
      001943                       4388 loop_done:
                                   4389 	; remove var limit step on dstack 
      00973B CD 88 DC         [ 2] 4390 	ldw x,dstkptr 
      00973E A1 04 27         [ 2] 4391 	addw x,#3*CELL_SIZE
      009741 03 CC 88         [ 2] 4392 	ldw dstkptr,x 
                                   4393 	; remove 2 return address on cstack 
      009744 15               [ 2] 4394 	popw x
      009745                       4395 	_drop 4
      009745 9F A4            [ 2]    1     addw sp,#4 
      009747 0F               [ 2] 4396 	pushw x 
      009748 C7 00 23 CC      [ 1] 4397 	dec loop_depth 
      00974C 96               [ 4] 4398 	ret 
                                   4399 
                                   4400 
                                   4401 ;------------------------
                                   4402 ; BASIC: GOTO line# 
                                   4403 ; jump to line# 
                                   4404 ; here cstack is 2 call deep from interp_loop 
                                   4405 ;------------------------
      001955                       4406 goto:
      00974D EE 00 00 21 06   [ 2] 4407 	btjt flags,#FRUN,0$ 
      00974E A6 06            [ 1] 4408 	ld a,#ERR_RUN_ONLY
      00974E CD 90 68         [ 2] 4409 	jp tb_error 
      009751 81               [ 4] 4410 	ret 
      009751 0D 01            [ 2] 4411 0$:	jra go_common
                                   4412 
                                   4413 ;--------------------
                                   4414 ; BASIC: GOSUB line#
                                   4415 ; basic subroutine call
                                   4416 ; actual line# and basicptr 
                                   4417 ; are saved on cstack
                                   4418 ; here cstack is 2 call deep from interp_loop 
                                   4419 ;--------------------
                           000003  4420 	GOS_RET=3
      001962                       4421 gosub:
      009753 26 05 A6 0D CD   [ 2] 4422 	btjt flags,#FRUN,0$ 
      009758 82 4B            [ 1] 4423 	ld a,#ERR_RUN_ONLY
      00975A 5B 01 81         [ 2] 4424 	jp tb_error 
      00975D 81               [ 4] 4425 	ret 
      00975D CE               [ 2] 4426 0$:	popw x 
      00975E 00 05            [ 2] 4427 	sub sp,#2 
      009760 1F               [ 2] 4428 	pushw x 
      009761 03 C6 00         [ 2] 4429 	ldw x,basicptr
      009764 02 6B            [ 1] 4430 	ld a,(2,x)
      009766 07 C6            [ 1] 4431 	add a,#3 
      009768 00 04 6B         [ 1] 4432 	ld acc8,a 
      00976B 08 81 00 08      [ 1] 4433 	clr acc16 
      00976D 72 BB 00 08      [ 2] 4434 	addw x,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00976D 1E 03            [ 2] 4435 	ldw (GOS_RET,sp),x 
      001985                       4436 go_common: 
      00976F CF 00 05         [ 4] 4437 	call relation 
      009772 7B 07            [ 1] 4438 	cp a,#TK_INTGR
      009774 C7 00            [ 1] 4439 	jreq 1$ 
      009776 02 7B 08         [ 2] 4440 	jp syntax_error
      00198F                       4441 1$: 
      009779 C7 00 04         [ 4] 4442 	call search_lineno  
      00977C 81               [ 2] 4443 	tnzw x 
      00977D 26 05            [ 1] 4444 	jrne 2$ 
      00977D 72 00            [ 1] 4445 	ld a,#ERR_NO_LINE 
      00977F 00 22 05         [ 2] 4446 	jp tb_error 
      00199A                       4447 2$: 
      009782 A6 06 CC         [ 2] 4448 	ldw basicptr,x 
      009785 88 17            [ 1] 4449 	ld a,(2,x)
      009787 52 07 03         [ 1] 4450 	ld count,a 
      009789 35 03 00 01      [ 1] 4451 	mov in,#3 
      009789 0F               [ 4] 4452 	ret 
                                   4453 
                                   4454 ;------------------------
                                   4455 ; BASIC: RETURN 
                                   4456 ; exit from a subroutine 
                                   4457 ; cstack is 2 level deep from interp_loop 
                                   4458 ;------------------------
      0019A7                       4459 return:
      00978A 06 CD 88 DC A1   [ 2] 4460 	btjt flags,#FRUN,0$ 
      00978F 00 27            [ 1] 4461 	ld a,#ERR_RUN_ONLY
      009791 5C A1 0A         [ 2] 4462 	jp tb_error 
      0019B1                       4463 0$:	
      009794 26 08            [ 2] 4464 	ldw x,(GOS_RET,sp) 
      009796 CD 82 5D         [ 2] 4465 	ldw basicptr,x 
      009799 03 06            [ 1] 4466 	ld a,(2,x)
      00979B CD 88            [ 1] 4467 	add a,#3 
      00979D DC A1 05         [ 1] 4468 	ld count,a 
      0097A0 27 03 CC 88      [ 1] 4469 	mov in,#3
      0097A4 15               [ 1] 4470 	clr a 
      0097A5 CD               [ 2] 4471 	popw x 
      0019C3                       4472 	_drop 2
      0097A6 90 6E            [ 2]    1     addw sp,#2 
      0097A8 0D               [ 2] 4473 	pushw x
      0097A9 06               [ 4] 4474 	ret  
                                   4475 
                                   4476 
                                   4477 ;----------------------------------
                                   4478 ; BASIC: RUN
                                   4479 ; run BASIC program in RAM
                                   4480 ;----------------------------------- 
      0019C7                       4481 run: 
      0097AA 26 0F A6 3A C7   [ 2] 4482 	btjf flags,#FRUN,0$  
      0097AF 17               [ 1] 4483 	clr a 
      0097B0 19               [ 4] 4484 	ret
      0019CE                       4485 0$: 
      0097B1 72 5F 17 1A AE   [ 2] 4486 	btjf flags,#FBREAK,1$
      0019D3                       4487 	_drop 2 
      0097B6 17 18            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0097B8 CD 82 5D         [ 4] 4488 	call rest_context
      0097BB                       4489 	_drop CTXT_SIZE 
      0097BB CD 97            [ 2]    1     addw sp,#CTXT_SIZE 
      0097BD 5D AE 16 C8      [ 1] 4490 	bres flags,#FBREAK 
      0097C1 CF 00 05 72      [ 1] 4491 	bset flags,#FRUN 
      0097C5 5F 00 04         [ 2] 4492 	jp interp_loop 
      0097C8 CD 8B 63         [ 2] 4493 1$:	ldw x,txtbgn
      0097CB 72 5F 00         [ 2] 4494 	cpw x,txtend 
      0097CE 02 CD            [ 1] 4495 	jrmi run_it 
      0097D0 93               [ 1] 4496 	clr a 
      0097D1 E3               [ 4] 4497 	ret
                                   4498 
      0019EF                       4499 run_it:	 
      0097D2 A1 04 27         [ 4] 4500     call ubound 
      0019F2                       4501 	_drop 2 
      0097D5 03 CC            [ 2]    1     addw sp,#2 
      0097D7 88 15 CD         [ 2] 4502 	ldw x,txtbgn 
      0097DA 90 6E CD         [ 2] 4503 	ldw basicptr,x 
      0097DD 90 D5            [ 1] 4504 	ld a,(2,x)
      0097DF CD 97 6D         [ 1] 4505 	ld count,a
      0097E2 CD 88 DC A1      [ 1] 4506 	mov in,#3	
      0097E6 0D 26 02 20      [ 1] 4507 	bset flags,#FRUN 
      0097EA 9E CD 90         [ 2] 4508 	jp interp_loop 
                                   4509 
                                   4510 
                                   4511 ;----------------------
                                   4512 ; BASIC: STOP 
                                   4513 ; stop running program
                                   4514 ;---------------------- 
      001A0A                       4515 stop: 
                                   4516 ; clean dstack and cstack 
      0097ED 68 17 FF         [ 2] 4517 	ldw x,#STACK_EMPTY 
      0097EE 94               [ 1] 4518 	ldw sp,x 
      0097EE 5B 07 81 21      [ 1] 4519 	bres flags,#FRUN 
      0097F1 72 19 00 21      [ 1] 4520 	bres flags,#FBREAK
      0097F1 55 00 02         [ 2] 4521 	jp warm_start
                                   4522 
                                   4523 ;-----------------------
                                   4524 ; BASIC BEEP expr1,expr2
                                   4525 ; used MCU internal beeper 
                                   4526 ; to produce a sound
                                   4527 ; arguments:
                                   4528 ;    expr1   frequency  (expr1%32)
                                   4529 ;    expr2   duration msec.
                                   4530 ;---------------------------
      001A19                       4531 beep:
      0097F4 00 04 81         [ 4] 4532 	call arg_list 
      0097F7 A1 02            [ 1] 4533 	cp a,#2 
      0097F7 52 04            [ 1] 4534 	jreq 1$
      0097F9 0F 01 CD         [ 2] 4535 	jp syntax_error 
      001A23                       4536 1$: 
      0097FC 92 9B A1         [ 2] 4537 	ldw x,dstkptr 
      0097FF 02 24            [ 2] 4538 	ldw x,(2,x);frequency 
      009801 03 CC            [ 1] 4539 	ld a,#31
      009803 88               [ 2] 4540 	div x,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009804 15 A1 03         [ 1] 4541 	ld BEEP_CSR,a	
      009807 25 06 CD 90      [ 1] 4542 	bset BEEP_CSR,#5 
      00980B 7B 9F 6B         [ 4] 4543 	call dpop 
      00980E 01 CD 90         [ 4] 4544 	call pause02 
      009811 7B 9F 6B         [ 4] 4545 	call ddrop 
      009814 02 CD            [ 1] 4546 	ld a,#0x1f
      009816 90 7B F6         [ 1] 4547 	ld BEEP_CSR,a 
      009819 14               [ 4] 4548 	ret 
                                   4549 
                                   4550 ;-------------------------------
                                   4551 ; BASIC: PWRADC 0|1 [,divisor]  
                                   4552 ; disable/enanble ADC 
                                   4553 ;-------------------------------
      001A41                       4554 power_adc:
      00981A 02 18 01         [ 4] 4555 	call arg_list 
      00981D 27 F9            [ 1] 4556 	cp a,#2	
      00981F 5B 04            [ 1] 4557 	jreq 1$
      009821 81 01            [ 1] 4558 	cp a,#1 
      009822 27 03            [ 1] 4559 	jreq 0$ 
      009822 CD 92 9B         [ 2] 4560 	jp syntax_error 
      009825 A1 02 27         [ 2] 4561 0$: ldw x,#0
      009828 03 CC 88         [ 4] 4562 	call dpush 
      00982B 15 00 02         [ 2] 4563 1$: ldw x,#2
      00982C 72 DE 00 18      [ 5] 4564 	ldw x,([dstkptr],x) ; on|off
      00982C CD               [ 2] 4565 	tnzw x 
      00982D 90 7B            [ 1] 4566 	jreq 2$ 
      00982F 9F CD 90 7B      [ 5] 4567 	ldw x,[dstkptr] ; divisor 
      009833 FA               [ 1] 4568 	ld a,xl
      009834 F7 81            [ 1] 4569 	and a,#7
      009836 4E               [ 1] 4570 	swap a 
      009836 CD 92 9B         [ 1] 4571 	ld ADC_CR1,a
      009839 A1 02 27 03      [ 1] 4572 	bset CLK_PCKENR2,#CLK_PCKENR2_ADC
      00983D CC 88 15 01      [ 1] 4573 	bset ADC_CR1,#ADC_CR1_ADON 
      009840                       4574 	_usec_dly 7 
      009840 CD 90 7B         [ 2]    1     ldw x,#(16*7-2)/4
      009843 9F               [ 2]    2     decw x
      009844 43               [ 1]    3     nop 
      009845 CD 90            [ 1]    4     jrne .-4
      009847 7B F4            [ 2] 4575 	jra 3$
      009849 F7 81 54 01      [ 1] 4576 2$: bres ADC_CR1,#ADC_CR1_ADON
      00984B 72 17 50 CA      [ 1] 4577 	bres CLK_PCKENR2,#CLK_PCKENR2_ADC
      00984B CD 92 9B         [ 2] 4578 3$:	ldw x,#2
      00984E A1 02 27         [ 4] 4579 	call ddrop_n 
      009851 03               [ 4] 4580 	ret
                                   4581 
                                   4582 ;-----------------------------
                                   4583 ; BASIC: RDADC(channel)
                                   4584 ; read adc channel {0..5}
                                   4585 ; output:
                                   4586 ;   A 		TK_INTGR 
                                   4587 ;   X 		value 
                                   4588 ;-----------------------------
      001A8A                       4589 analog_read:
      009852 CC 88 15         [ 4] 4590 	call func_args 
      009855 CD 90            [ 1] 4591 	cp a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009857 7B 9F            [ 1] 4592 	jreq 1$
      009859 CD 90 7B         [ 2] 4593 	jp syntax_error
      00985C F8 F7 81         [ 4] 4594 1$: call dpop 
      00985F A3 00 05         [ 2] 4595 	cpw x,#5 
      00985F CD 92            [ 2] 4596 	jrule 2$
      009861 BF A1            [ 1] 4597 	ld a,#ERR_BAD_VALUE
      009863 02 27 03         [ 2] 4598 	jp tb_error 
      009866 CC               [ 1] 4599 2$: ld a,xl
      009867 88 15 09         [ 1] 4600 	ld acc8,a 
      009869 A6 05            [ 1] 4601 	ld a,#5
      009869 CD 90 7B         [ 1] 4602 	sub a,acc8 
      00986C 9F A4 07         [ 1] 4603 	ld ADC_CSR,a
      00986F 88 A6 01 0D      [ 1] 4604 	bset ADC_CR2,#ADC_CR2_ALIGN
      009873 01 27 05 48      [ 1] 4605 	bset ADC_CR1,#ADC_CR1_ADON
      009877 0A 01 20 F7 CD   [ 2] 4606 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00987C 90 7B F4         [ 2] 4607 	ldw x,ADC_DRH
      00987F 27 02            [ 1] 4608 	ld a,#TK_INTGR
      009881 A6               [ 4] 4609 	ret 
                                   4610 
                                   4611 ;-----------------------
                                   4612 ; BASIC: DREAD(pin)
                                   4613 ; read state of a digital pin 
                                   4614 ; pin# {0..15}
                                   4615 ; output:
                                   4616 ;    A 		TK_INTGR
                                   4617 ;    X      0|1 
                                   4618 ;-------------------------
                           000001  4619 	PINNO=1
                           000001  4620 	VSIZE=1
      001AC0                       4621 digital_read:
      001AC0                       4622 	_vars VSIZE 
      009882 01 5F            [ 2]    1     sub sp,#VSIZE 
      009884 97 A6 04         [ 4] 4623 	call func_args
      009887 5B 01            [ 1] 4624 	cp a,#1
      009889 81 03            [ 1] 4625 	jreq 1$
      00988A CC 07 95         [ 2] 4626 	jp syntax_error
      00988A CD 92 9B         [ 4] 4627 1$: call dpop 
      00988D A1 02 27         [ 2] 4628 	cpw x,#15 
      009890 03 CC            [ 2] 4629 	jrule 2$
      009892 88 15            [ 1] 4630 	ld a,#ERR_BAD_VALUE
      009894 CC 07 97         [ 2] 4631 	jp tb_error 
      009894 CD 90 7B         [ 4] 4632 2$:	call select_pin 
      009897 9F CD            [ 1] 4633 	ld (PINNO,sp),a
      009899 90 7B            [ 1] 4634 	ld a,(GPIO_IDR,x)
      00989B F7 81            [ 1] 4635 	tnz (PINNO,sp)
      00989D 27 05            [ 1] 4636 	jreq 8$
      00989D CD               [ 1] 4637 3$: srl a 
      00989E 92 BF            [ 1] 4638 	dec (PINNO,sp)
      0098A0 A1 01            [ 1] 4639 	jrne 3$ 
      0098A2 27 03            [ 1] 4640 8$: and a,#1 
      0098A4 CC               [ 1] 4641 	clrw x 
      0098A5 88               [ 1] 4642 	ld xl,a 
      0098A6 15 CD            [ 1] 4643 	ld a,#TK_INTGR
      001AEF                       4644 	_drop VSIZE
      0098A8 90 7B            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0098AA F6               [ 4] 4645 	ret
                                   4646 
                                   4647 ;-----------------------
                                   4648 ; BASIC: DWRITE pin,0|1
                                   4649 ; write to a digital pin 
                                   4650 ; pin# {0..15}
                                   4651 ; output:
                                   4652 ;    A 		TK_INTGR
                                   4653 ;    X      0|1 
                                   4654 ;-------------------------
                           000001  4655 	PINNO=1
                           000002  4656 	PINVAL=2
                           000002  4657 	VSIZE=2
      001AF2                       4658 digital_write:
      001AF2                       4659 	_vars VSIZE 
      0098AB 5F 97            [ 2]    1     sub sp,#VSIZE 
      0098AD A6 04 81         [ 4] 4660 	call arg_list  
      0098B0 A1 02            [ 1] 4661 	cp a,#2 
      0098B0 CD 92            [ 1] 4662 	jreq 1$
      0098B2 BF A1 02         [ 2] 4663 	jp syntax_error
      0098B5 27 03 CC         [ 4] 4664 1$: call dpop 
      0098B8 88               [ 1] 4665 	ld a,xl 
      0098B9 15 02            [ 1] 4666 	ld (PINVAL,sp),a
      0098BA CD 0F FB         [ 4] 4667 	call dpop
      0098BA CD 90 7B         [ 2] 4668 	cpw x,#15 
      0098BD CF 00            [ 2] 4669 	jrule 2$
      0098BF 14 CD            [ 1] 4670 	ld a,#ERR_BAD_VALUE
      0098C1 90 7B 9F         [ 2] 4671 	jp tb_error 
      0098C4 C7 00 13         [ 4] 4672 2$:	call select_pin 
      0098C7 5F 92            [ 1] 4673 	ld (PINNO,sp),a 
      0098C9 BC 00            [ 1] 4674 	ld a,#1
      0098CB 13 97            [ 1] 4675 	tnz (PINNO,sp)
      0098CD A6 04            [ 1] 4676 	jreq 4$
      0098CF 81               [ 1] 4677 3$: sll a
      0098D0 0A 01            [ 1] 4678 	dec (PINNO,sp)
      0098D0 CD 93            [ 1] 4679 	jrne 3$
      0098D2 E3 A1            [ 1] 4680 4$: tnz (PINVAL,sp)
      0098D4 04 27            [ 1] 4681 	jrne 5$
      0098D6 03               [ 1] 4682 	cpl a 
      0098D7 CC 88            [ 1] 4683 	and a,(GPIO_ODR,x)
      0098D9 15 4F            [ 2] 4684 	jra 8$
      0098DB 5D 26            [ 1] 4685 5$: or a,(GPIO_ODR,x)
      0098DD 05 55            [ 1] 4686 8$: ld (GPIO_ODR,x),a 
      001B2E                       4687 	_drop VSIZE 
      0098DF 00 04            [ 2]    1     addw sp,#VSIZE 
      0098E1 00               [ 4] 4688 	ret
                                   4689 
                                   4690 
                                   4691 ;-----------------------
                                   4692 ; BASIC: BREAK 
                                   4693 ; insert a breakpoint 
                                   4694 ; in pogram. 
                                   4695 ; the program is resumed
                                   4696 ; with RUN 
                                   4697 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      001B31                       4698 break:
      0098E2 02 81 00 21 02   [ 2] 4699 	btjt flags,#FRUN,2$
      0098E4 4F               [ 1] 4700 	clr a
      0098E4 A6               [ 4] 4701 	ret 
      001B38                       4702 2$:	 
                                   4703 ; create space on cstack to save context 
      0098E5 05 CD 92         [ 2] 4704 	ldw x,#break_point 
      0098E8 8E CD 90         [ 4] 4705 	call puts 
      001B3E                       4706 	_drop 2 ;drop return address 
      0098EB 6E CD            [ 2]    1     addw sp,#2 
      001B40                       4707 	_vars CTXT_SIZE ; context size 
      0098ED 94 8A            [ 2]    1     sub sp,#CTXT_SIZE 
      0098EF 72 14 00         [ 4] 4708 	call save_context 
      0098F2 22 85 52         [ 2] 4709 	ldw x,#tib 
      0098F5 04 89 5F         [ 2] 4710 	ldw basicptr,x
      0098F8 1F               [ 1] 4711 	clr (x)
      0098F9 05 1F 03 CD      [ 1] 4712 	clr count  
      0098FD 88               [ 1] 4713 	clrw x 
      0098FE DC A1 06         [ 2] 4714 	ldw in.w,x
      009901 27 03 CC 88      [ 1] 4715 	bres flags,#FRUN 
      009905 15 18 00 21      [ 1] 4716 	bset flags,#FBREAK
      009906 CC 08 2C         [ 2] 4717 	jp interp_loop 
      009906 A3 99 0E 27 03 CC 88  4718 break_point: .asciz "\nbreak point, RUN to resume.\n"
             15 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4719 
                                   4720 ;-----------------------
                                   4721 ; BASIC: NEW
                                   4722 ; from command line only 
                                   4723 ; free program memory
                                   4724 ; and clear variables 
                                   4725 ;------------------------
      00990E                       4726 new: 
      00990E 72 04 00 22 03   [ 2] 4727 	btjf flags,#FRUN,0$ 
      009913 CC               [ 1] 4728 	clr a 
      009914 88               [ 4] 4729 	ret 
      001B84                       4730 0$:	
      009915 15 CD 93         [ 4] 4731 	call clear_basic 
      009918 E3               [ 4] 4732 	ret 
                                   4733 	 
                                   4734 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4735 ;   file system routines
                                   4736 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4737 
                                   4738 ;--------------------
                                   4739 ; input:
                                   4740 ;   X     increment 
                                   4741 ; output:
                                   4742 ;   farptr  incremented 
                                   4743 ;---------------------
      001B88                       4744 incr_farptr:
      009919 A1 04 27 03      [ 2] 4745 	addw x,farptr+1 
      00991D CC 88            [ 1] 4746 	jrnc 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      00991F 15 5C 00 12      [ 1] 4747 	inc farptr 
      009920 CF 00 13         [ 2] 4748 1$:	ldw farptr+1,x  
      009920 CD               [ 4] 4749 	ret 
                                   4750 
                                   4751 ;------------------------------
                                   4752 ; extended flash memory used as FLASH_DRIVE 
                                   4753 ; seek end of used flash drive   
                                   4754 ; starting at 0x10000 address.
                                   4755 ; 4 consecutives 0 bytes signal free space. 
                                   4756 ; input:
                                   4757 ;	none
                                   4758 ; output:
                                   4759 ;   ffree     free_addr| 0 if memory full.
                                   4760 ;------------------------------
      001B96                       4761 seek_fdrive:
                                   4762 ; start scan at 0x10000 address 
      009921 90 6E            [ 1] 4763 	ld a,#1
      009923 CE 00 01         [ 1] 4764 	ld farptr,a 
      009926 CD               [ 1] 4765 	clrw x 
      009927 88 DC A1         [ 2] 4766 	ldw farptr+1,x 
      001B9F                       4767 1$:
      00992A 00 27 0C         [ 2] 4768 	ldw x,#3  
      00992D A1 06 26 05      [ 5] 4769 2$:	ldf a,([farptr],x) 
      009931 A3 99            [ 1] 4770 	jrne 3$
      009933 3E               [ 2] 4771 	decw x
      009934 27 08            [ 1] 4772 	jrpl 2$
      009936 20 19            [ 2] 4773 	jra 4$ 
      009936 CD               [ 2] 4774 3$:	incw x 
      009937 90 68 88         [ 4] 4775 	call incr_farptr
      009939 AE 02 7F         [ 2] 4776 	ldw x,#0x27f 
      009939 AE 00 01         [ 2] 4777 	cpw x,farptr
      00993C 20 12            [ 1] 4778 	jrpl 1$
                                   4779 ; drive full 
      00993E 72 5F 00 15      [ 1] 4780 	clr ffree 
      00993E 72 04 00 22      [ 1] 4781 	clr ffree+1 
      009942 03 CC 88 15      [ 1] 4782 	clr ffree+2 
      009946 CD               [ 4] 4783 	ret
      001BC6                       4784 4$: ; copy farptr to ffree	 
      009947 93 E3 A1         [ 2] 4785 	ldw x,farptr 
      00994A 04 27 03         [ 1] 4786 	ld a,farptr+2 
      00994D CC 88 15         [ 2] 4787 	ldw ffree,x 
      009950 C7 00 17         [ 1] 4788 	ld ffree+2,a  
      009950 CD               [ 4] 4789 	ret 
                                   4790 
                                   4791 ;-----------------------
                                   4792 ; compare file name 
                                   4793 ; with name pointed by Y  
                                   4794 ; input:
                                   4795 ;   farptr   file name 
                                   4796 ;   Y        target name 
                                   4797 ; output:
                                   4798 ;   farptr 	 at file_name
                                   4799 ;   X 		 farptr[x] point at size field  
                                   4800 ;   Carry    0|1 no match|match  
                                   4801 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      001BD3                       4802 cmp_name:
      009951 90               [ 1] 4803 	clrw x
      009952 6E CE 00 05      [ 5] 4804 1$:	ldf a,([farptr],x)
      009956 1F 05            [ 1] 4805 	cp a,(y)
      009958 CE 00            [ 1] 4806 	jrne 4$
      00995A 01               [ 1] 4807 	tnz a 
      00995B 1F 03            [ 1] 4808 	jreq 9$ 
      00995D 72               [ 2] 4809     incw x 
      00995E 15 00            [ 2] 4810 	incw y 
      009960 22 72            [ 2] 4811 	jra 1$
      001BE4                       4812 4$: ;no match 
      009962 5C               [ 1] 4813 	tnz a 
      009963 00 1F            [ 1] 4814 	jreq 5$
      009965 81               [ 2] 4815 	incw x 
      009966 92 AF 00 12      [ 5] 4816 	ldf a,([farptr],x)
      009966 72 5D            [ 2] 4817 	jra 4$  
      009968 00               [ 2] 4818 5$:	incw x ; farptr[x] point at 'size' field 
      009969 1F               [ 1] 4819 	rcf 
      00996A 26               [ 4] 4820 	ret
      001BF1                       4821 9$: ; match  
      00996B 03               [ 2] 4822 	incw x  ; farptr[x] at 'size' field 
      00996C CC               [ 1] 4823 	scf 
      00996D 88               [ 4] 4824 	ret 
                                   4825 
                                   4826 ;-----------------------
                                   4827 ; search file in 
                                   4828 ; flash memory 
                                   4829 ; input:
                                   4830 ;   Y       file name  
                                   4831 ; output:
                                   4832 ;   farptr  addr at name|0
                                   4833 ;-----------------------
                           000001  4834 	FSIZE=1
                           000003  4835 	YSAVE=3
                           000004  4836 	VSIZE=4 
      001BF4                       4837 search_file: 
      001BF4                       4838 	_vars VSIZE
      00996E 15 04            [ 2]    1     sub sp,#VSIZE 
      00996F 17 03            [ 2] 4839 	ldw (YSAVE,sp),y  
      00996F A6               [ 1] 4840 	clrw x 
      009970 05 CD 92         [ 2] 4841 	ldw farptr+1,x 
      009973 8E 90 93 AE      [ 1] 4842 	mov farptr,#1
      001C00                       4843 1$:	
                                   4844 ; check if farptr is after any file 
                                   4845 ; if  0 then so.
      009977 00 04 72 D3      [ 5] 4846 	ldf a,[farptr]
      00997B 00 19            [ 1] 4847 	jreq 6$
      00997D 27               [ 1] 4848 2$: clrw x 	
      00997E 03 CC            [ 2] 4849 	ldw y,(YSAVE,sp) 
      009980 88 15 D3         [ 4] 4850 	call cmp_name
      009982 25 2D            [ 1] 4851 	jrc 9$
      009982 93 FE CF 00      [ 5] 4852 	ldf a,([farptr],x)
      009986 09 72            [ 1] 4853 	ld (FSIZE,sp),a 
      009988 CE               [ 2] 4854 	incw x 
      009989 00 19 72 BB      [ 5] 4855 	ldf a,([farptr],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      00998D 00 09            [ 1] 4856 	ld (FSIZE+1,sp),a 
      00998F 90               [ 2] 4857 	incw x 
      009990 FF 90 93         [ 2] 4858 	addw x,(FSIZE,sp) ; count to skip 
      009993 72               [ 2] 4859 	incw x ; skip over EOF marker 
      009994 CE 00 19         [ 4] 4860 	call incr_farptr ; now at next file 'name_field'
      009997 5D 2A 0B         [ 2] 4861 	ldw x,#0x280
      00999A AE 00 02         [ 2] 4862 	cpw x,farptr 
      00999D 72 D3            [ 1] 4863 	jrpl 1$
      001C2B                       4864 6$: ; file not found 
      00999F 00 19 2F 20      [ 1] 4865 	clr farptr
      0099A3 20 09 00 13      [ 1] 4866 	clr farptr+1 
      0099A5 72 5F 00 14      [ 1] 4867 	clr farptr+2 
      001C37                       4868 	_drop VSIZE 
      0099A5 AE 00            [ 2]    1     addw sp,#VSIZE 
      0099A7 02               [ 1] 4869 	rcf
      0099A8 72               [ 4] 4870 	ret
      001C3B                       4871 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001C3B                       4872 	_drop VSIZE 
      0099A9 D3 00            [ 2]    1     addw sp,#VSIZE 
      0099AB 19               [ 1] 4873 	scf 	
      0099AC 2C               [ 4] 4874 	ret
                                   4875 
                                   4876 ;--------------------------------
                                   4877 ; BASIC: SAVE "name" 
                                   4878 ; save text program in 
                                   4879 ; flash memory used as 
                                   4880 ;--------------------------------
                           000001  4881 	BSIZE=1
                           000003  4882 	NAMEPTR=3
                           000004  4883 	VSIZE=4
      001C3F                       4884 save:
      0099AD 15 01 00 21 05   [ 2] 4885 	btjf flags,#FRUN,0$ 
      0099AE A6 07            [ 1] 4886 	ld a,#ERR_CMD_ONLY 
      0099AE 1E 05 CF         [ 2] 4887 	jp tb_error
      001C49                       4888 0$:	 
      0099B1 00 05 72         [ 2] 4889 	ldw x,txtend 
      0099B4 01 00 22 05      [ 2] 4890 	subw x,txtbgn
      0099B8 E6 02            [ 1] 4891 	jrne 1$
                                   4892 ; nothing to save 
      0099BA C7               [ 4] 4893 	ret 
      001C53                       4894 1$:	
      001C53                       4895 	_vars VSIZE 
      0099BB 00 04            [ 2]    1     sub sp,#VSIZE 
      0099BD 1E 03            [ 2] 4896 	ldw (BSIZE,sp),x 
      0099BF CF 00 01         [ 4] 4897 	call next_token	
      0099C2 81 0A            [ 1] 4898 	cp a,#TK_QSTR
      0099C3 27 03            [ 1] 4899 	jreq 2$
      0099C3 CE 00 19         [ 2] 4900 	jp syntax_error
      001C61                       4901 2$: 
      0099C6 1C 00 06 CF      [ 2] 4902 	ldw y,basicptr 
      0099CA 00 19 85 5B      [ 2] 4903 	addw y,in.w
      0099CE 04 89            [ 2] 4904 	ldw (NAMEPTR,sp),y  
      0099D0 72 5A 00 1F 81   [ 1] 4905 	mov in,count 
                                   4906 ; check if enough free space 
      0099D5 93               [ 1] 4907 	ldw x,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      0099D5 72 00 00         [ 4] 4908 	call strlen 
      0099D8 22 06 A6         [ 2] 4909 	addw x,#3 
      0099DB 06 CC 88         [ 2] 4910 	addw x,(BSIZE,sp)
      0099DE 17 81 20 23      [ 1] 4911 	tnz ffree 
      0099E2 26 0B            [ 1] 4912 	jrne 21$
      0099E2 72 00 00 22      [ 2] 4913 	subw x,ffree+1 
      0099E6 06 A6            [ 2] 4914 	jrule 21$
      0099E8 06 CC            [ 1] 4915 	ld a,#ERR_MEM_FULL 
      0099EA 88 17 81         [ 2] 4916 	jp tb_error
      001C8B                       4917 21$: 
                                   4918 ; check for existing file of that name 
      0099ED 85 52            [ 2] 4919 	ldw y,(NAMEPTR,sp)	
      0099EF 02 89 CE         [ 4] 4920 	call search_file 
      0099F2 00 05            [ 1] 4921 	jrnc 3$ 
      0099F4 E6 02            [ 1] 4922 	ld a,#ERR_DUPLICATE 
      0099F6 AB 03 C7         [ 2] 4923 	jp tb_error 
      001C97                       4924 3$:	;** write file name to flash **
      0099F9 00 0A 72         [ 2] 4925 	ldw x,ffree 
      0099FC 5F 00 09         [ 1] 4926 	ld a,ffree+2 
      0099FF 72 BB 00         [ 2] 4927 	ldw farptr,x 
      009A02 09 1F 03         [ 1] 4928 	ld farptr+2,a 
      009A05 1E 03            [ 2] 4929 	ldw x,(NAMEPTR,sp)  
      009A05 CD 93 E3         [ 4] 4930 	call strlen 
      009A08 A1               [ 2] 4931 	incw  x
      009A09 04 27            [ 2] 4932 	ldw (BSIZE,sp),x  
      009A0B 03               [ 1] 4933 	clrw x   
      009A0C CC 88            [ 2] 4934 	ldw y,(NAMEPTR,sp)
      009A0E 15 01 6D         [ 4] 4935 	call write_block  
                                   4936 ;** write file length after name **
      009A0F CE 00 1C         [ 2] 4937 	ldw x,txtend 
      009A0F CD 83 8D 5D      [ 2] 4938 	subw x,txtbgn
      009A13 26 05            [ 2] 4939 	ldw (BSIZE,sp),x 
      009A15 A6               [ 1] 4940 	clrw x 
      009A16 05 CC            [ 1] 4941 	ld a,(1,sp)
      009A18 88 17 F8         [ 4] 4942 	call write_byte 
      009A1A 5C               [ 2] 4943 	incw x 
      009A1A CF 00            [ 1] 4944 	ld a,(2,sp)
      009A1C 05 E6 02         [ 4] 4945 	call write_byte
      009A1F C7               [ 2] 4946 	incw x  
      009A20 00 04 35         [ 4] 4947 	call incr_farptr ; move farptr after SIZE field 
                                   4948 ;** write BASIC text **
                                   4949 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009A23 03 00            [ 2] 4950 	ldw x,(BSIZE,sp)
      009A25 02               [ 2] 4951 	pushw x ; write_block argument 
      009A26 81               [ 1] 4952 	clrw x 
      009A27 90 CE 00 1A      [ 2] 4953 	ldw y,txtbgn  ; BASIC text to save 
      009A27 72 00 00         [ 4] 4954 	call write_block 
      001CD5                       4955 	_drop 2 ;  drop write_block argument  
      009A2A 22 05            [ 2]    1     addw sp,#2 
                                   4956 ; write en end of file marker 
      009A2C A6 06 CC         [ 2] 4957 	ldw x,#1
      009A2F 88 17            [ 1] 4958 	ld a,#EOF  
      009A31 CD 00 F8         [ 4] 4959 	call write_byte 
      009A31 1E 03 CF         [ 4] 4960 	call incr_farptr
                                   4961 ; save farptr in ffree
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009A34 00 05 E6         [ 2] 4962 	ldw x,farptr 
      009A37 02 AB 03         [ 1] 4963 	ld a,farptr+2 
      009A3A C7 00 04         [ 2] 4964 	ldw ffree,x 
      009A3D 35 03 00         [ 1] 4965 	ld ffree+2,a
                                   4966 ;write 4 zero bytes as an end of all files marker 
      009A40 02               [ 1] 4967     clrw x 
      009A41 4F 85            [ 1] 4968 	push #4 
      001CF1                       4969 4$:
      009A43 5B               [ 1] 4970 	clr a 
      009A44 02 89 81         [ 4] 4971 	call write_byte 
      009A47 5C               [ 2] 4972 	incw x 
      009A47 72 01            [ 1] 4973 	dec (1,sp)
      009A49 00 22            [ 1] 4974 	jrne 4$
      009A4B 02               [ 1] 4975 5$: pop a 
                                   4976 ; display saved size  
      009A4C 4F 81            [ 2] 4977 	ldw x,(BSIZE,sp) 
      009A4E CD 09 F5         [ 4] 4978 	call print_int 
      001D00                       4979 	_drop VSIZE 
      009A4E 72 09            [ 2]    1     addw sp,#VSIZE 
      009A50 00               [ 4] 4980 	ret 
                                   4981 
                                   4982 ;----------------------
                                   4983 ; load file in RAM memory
                                   4984 ; input:
                                   4985 ;    farptr point at file size 
                                   4986 ; output:
                                   4987 ;   y point after BASIC program in RAM.
                                   4988 ;------------------------
      001D03                       4989 load_file:
      009A51 22 12 5B         [ 4] 4990 	call incr_farptr  
      009A54 02 CD 97         [ 4] 4991 	call clear_basic  
      009A57 6D               [ 1] 4992 	clrw x
      009A58 5B 06 72 19      [ 5] 4993 	ldf a,([farptr],x)
      009A5C 00 22            [ 1] 4994 	ld yh,a 
      009A5E 72               [ 2] 4995 	incw x  
      009A5F 10 00 22 CC      [ 5] 4996 	ldf a,([farptr],x)
      009A63 88               [ 2] 4997 	incw x 
      009A64 AC CE            [ 1] 4998 	ld yl,a 
      009A66 00 1B C3 00      [ 2] 4999 	addw y,txtbgn
      009A6A 1D 2B 02 4F      [ 2] 5000 	ldw txtend,y
      009A6E 81 CE 00 1A      [ 2] 5001 	ldw y,txtbgn
      009A6F                       5002 3$:	; load BASIC text 	
      009A6F CD 94 5E 5B      [ 5] 5003 	ldf a,([farptr],x)
      009A73 02 CE            [ 1] 5004 	ld (y),a 
      009A75 00               [ 2] 5005 	incw x 
      009A76 1B CF            [ 2] 5006 	incw y 
      009A78 00 05 E6 02      [ 2] 5007 	cpw y,txtend 
      009A7C C7 00            [ 1] 5008 	jrmi 3$
      009A7E 04               [ 4] 5009 	ret 
                                   5010 
                                   5011 ;------------------------
                                   5012 ; BASIC: LOAD "file" 
                                   5013 ; load file to RAM 
                                   5014 ; for execution 
                                   5015 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      001D34                       5016 load:
      009A7F 35 03 00 02 72   [ 2] 5017 	btjf flags,#FRUN,0$ 
      009A84 10 00            [ 1] 5018 	jreq 0$ 
      009A86 22 CC            [ 1] 5019 	ld a,#ERR_CMD_ONLY 
      009A88 88 AC 97         [ 2] 5020 	jp tb_error 
      009A8A                       5021 0$:	
      009A8A AE 17 FF         [ 4] 5022 	call next_token 
      009A8D 94 72            [ 1] 5023 	cp a,#TK_QSTR
      009A8F 11 00            [ 1] 5024 	jreq 1$
      009A91 22 72 19         [ 2] 5025 	jp syntax_error 
      001D4A                       5026 1$:	
      009A94 00 22 CC 88      [ 2] 5027 	ldw y,basicptr
      009A98 69 B9 00 00      [ 2] 5028 	addw y,in.w 
      009A99 55 00 03 00 01   [ 1] 5029 	mov in,count 
      009A99 CD 92 9B         [ 4] 5030 	call search_file 
      009A9C A1 02            [ 1] 5031 	jrc 2$ 
      009A9E 27 03            [ 1] 5032 	ld a,#ERR_NOT_FILE
      009AA0 CC 88 15         [ 2] 5033 	jp tb_error  
      009AA3                       5034 2$:
      009AA3 CE 00 19         [ 4] 5035 	call load_file
                                   5036 ; print loaded size 	 
      009AA6 EE 02 A6         [ 2] 5037 	ldw x,txtend 
      009AA9 1F 62 C7 50      [ 2] 5038 	subw x,txtbgn
      009AAD F3 72 1A         [ 4] 5039 	call print_int 
      009AB0 50               [ 4] 5040 	ret 
                                   5041 
                                   5042 ;-----------------------------------
                                   5043 ; BASIC: FORGET ["file_name"] 
                                   5044 ; erase file_name and all others 
                                   5045 ; after it. 
                                   5046 ; without argument erase all files 
                                   5047 ;-----------------------------------
      001D6F                       5048 forget:
      009AB1 F3 CD 90         [ 4] 5049 	call next_token 
      009AB4 7B CD            [ 1] 5050 	cp a,#TK_NONE 
      009AB6 9F FE            [ 1] 5051 	jreq 3$ 
      009AB8 CD 90            [ 1] 5052 	cp a,#TK_QSTR
      009ABA A2 A6            [ 1] 5053 	jreq 1$
      009ABC 1F C7 50         [ 2] 5054 	jp syntax_error
      009ABF F3 81 00 04      [ 2] 5055 1$: ldw y,basicptr
      009AC1 72 B9 00 00      [ 2] 5056 	addw y,in.w
      009AC1 CD 92 9B A1 02   [ 1] 5057 	mov in,count 
      009AC6 27 0D A1         [ 4] 5058 	call search_file
      009AC9 01 27            [ 1] 5059 	jrc 2$
      009ACB 03 CC            [ 1] 5060 	ld a,#ERR_NOT_FILE 
      009ACD 88 15 AE         [ 2] 5061 	jp tb_error 
      001D94                       5062 2$: 
      009AD0 00 00 CD         [ 2] 5063 	ldw x,farptr
      009AD3 90 6E AE         [ 1] 5064 	ld a,farptr+2
      009AD6 00 02            [ 2] 5065 	jra 4$ 
      001D9C                       5066 3$: ; forget all files 
      009AD8 72 DE 00         [ 2] 5067 	ldw x,#0x100
      009ADB 19               [ 1] 5068 	clr a 
      009ADC 5D 27 1C         [ 2] 5069 	ldw farptr,x 
      009ADF 72 CE 00         [ 1] 5070 	ld farptr+2,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      001DA6                       5071 4$:
      009AE2 19 9F A4         [ 2] 5072 	ldw ffree,x 
      009AE5 07 4E C7         [ 1] 5073 	ld ffree+2,a 
      009AE8 54 01            [ 1] 5074 	push #4
      009AEA 72               [ 1] 5075 	clrw x 
      001DAF                       5076 5$: 
      009AEB 16               [ 1] 5077 	clr a  
      009AEC 50 CA 72         [ 4] 5078 	call write_byte 
      009AEF 10               [ 2] 5079 	incw x 
      009AF0 54 01            [ 1] 5080 	dec (1,sp)
      009AF2 AE 00            [ 1] 5081 	jrne 5$	
      009AF4 1B               [ 1] 5082 6$: pop a 
      009AF5 5A               [ 4] 5083 	ret 
                                   5084 
                                   5085 ;----------------------
                                   5086 ; BASIC: DIR 
                                   5087 ; list saved files 
                                   5088 ;----------------------
                           000001  5089 	COUNT=1 ; files counter 
                           000002  5090 	VSIZE=2 
      001DBA                       5091 directory:
      001DBA                       5092 	_vars VSIZE 
      009AF6 9D 26            [ 2]    1     sub sp,#VSIZE 
      009AF8 FA               [ 1] 5093 	clrw x 
      009AF9 20 08            [ 2] 5094 	ldw (COUNT,sp),x 
      009AFB 72 11 54         [ 2] 5095 	ldw farptr+1,x 
      009AFE 01 72 17 50      [ 1] 5096 	mov farptr,#1 
      001DC6                       5097 dir_loop:
      009B02 CA               [ 1] 5098 	clrw x 
      009B03 AE 00 02 CD      [ 5] 5099 	ldf a,([farptr],x)
      009B07 90 DF            [ 1] 5100 	jreq 8$ 
      001DCD                       5101 1$: ;name loop 	
      009B09 81 AF 00 12      [ 5] 5102 	ldf a,([farptr],x)
      009B0A 27 06            [ 1] 5103 	jreq 2$ 
      009B0A CD 92 BF         [ 4] 5104 	call putc 
      009B0D A1               [ 2] 5105 	incw x 
      009B0E 01 27            [ 2] 5106 	jra 1$
      009B10 03               [ 2] 5107 2$: incw x ; skip ending 0. 
      009B11 CC 88            [ 1] 5108 	ld a,#SPACE 
      009B13 15 CD 90         [ 4] 5109 	call putc 
                                   5110 ; get file size 	
      009B16 7B A3 00 05      [ 5] 5111 	ldf a,([farptr],x)
      009B1A 23 05            [ 1] 5112 	ld yh,a 
      009B1C A6               [ 2] 5113 	incw x 
      009B1D 0A CC 88 17      [ 5] 5114 	ldf a,([farptr],x)
      009B21 9F               [ 2] 5115 	incw x 
      009B22 C7 00            [ 1] 5116 	ld yl,a 
      009B24 0A A6            [ 2] 5117 	pushw y 
      009B26 05 C0 00         [ 2] 5118 	addw x,(1,sp)
      009B29 0A               [ 2] 5119 	incw x ; skip EOF marker 
                                   5120 ; skip to next file 
      009B2A C7 54 00         [ 4] 5121 	call incr_farptr 
                                   5122 ; print file size 
      009B2D 72               [ 2] 5123 	popw x ; file size 
      009B2E 16 54 02         [ 4] 5124 	call print_int 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009B31 72 10            [ 1] 5125 	ld a,#CR 
      009B33 54 01 72         [ 4] 5126 	call putc
      009B36 0F 54            [ 2] 5127 	ldw x,(COUNT,sp)
      009B38 00               [ 2] 5128 	incw x
      009B39 FB CE            [ 2] 5129 	ldw (COUNT,sp),x  
      009B3B 54 04            [ 2] 5130 	jra dir_loop 
      001E06                       5131 8$: ; print number of files 
      009B3D A6 04            [ 2] 5132 	ldw x,(COUNT,sp)
      009B3F 81 09 F5         [ 4] 5133 	call print_int 
      009B40 AE 1E 3B         [ 2] 5134 	ldw x,#file_count 
      009B40 52 01 CD         [ 4] 5135 	call puts  
                                   5136 ; print drive free space 	
      009B43 92 BF            [ 1] 5137 	ld a,#0xff 
      009B45 A1 01 27         [ 1] 5138 	sub a,ffree+2 
      009B48 03 CC 88         [ 1] 5139 	ld acc8,a 
      009B4B 15 CD            [ 1] 5140 	ld a,#0x7f 
      009B4D 90 7B A3         [ 1] 5141 	sbc a,ffree+1 
      009B50 00 0F 23         [ 1] 5142 	ld acc16,a 
      009B53 05 A6            [ 1] 5143 	ld a,#2 
      009B55 0A CC 88         [ 1] 5144 	sbc a,ffree 
      009B58 17 CD A1         [ 1] 5145 	ld acc24,a 
      009B5B 51               [ 1] 5146 	clrw x  
      009B5C 6B 01            [ 1] 5147 	ld a,#6 
      009B5E E6               [ 1] 5148 	ld xl,a 
      009B5F 01 0D            [ 1] 5149 	ld a,#10 
      009B61 01 27 05         [ 4] 5150 	call prti24 
      009B64 44 0A 01         [ 2] 5151 	ldw x,#drive_free
      009B67 26 FB A4         [ 4] 5152 	call puts 
      001E38                       5153 	_drop VSIZE 
      009B6A 01 5F            [ 2]    1     addw sp,#VSIZE 
      009B6C 97               [ 4] 5154 	ret
      009B6D A6 04 5B 01 81 73 0A  5155 file_count: .asciz " files\n"
             00
      009B72 20 62 79 74 65 73 20  5156 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   5157 
                                   5158 ;---------------------
                                   5159 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   5160 ; write 1 or more byte to FLASH or EEPROM
                                   5161 ; starting at address  
                                   5162 ; input:
                                   5163 ;   expr1  	is address 
                                   5164 ;   expr2   is byte to write
                                   5165 ; output:
                                   5166 ;   none 
                                   5167 ;---------------------
                           000001  5168 	ADDR=1
                           000002  5169 	VSIZ=2 
      001E50                       5170 write:
      001E50                       5171 	_vars VSIZE 
      009B72 52 02            [ 2]    1     sub sp,#VSIZE 
      009B74 CD 92 9B A1      [ 1] 5172 	clr farptr ; expect 16 bits address 
      009B78 02 27 03         [ 4] 5173 	call expression
      009B7B CC 88            [ 1] 5174 	cp a,#TK_INTGR 
      009B7D 15 CD            [ 1] 5175 	jreq 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009B7F 90 7B 9F         [ 2] 5176 	jp syntax_error
      009B82 6B 02            [ 2] 5177 0$: ldw (ADDR,sp),x 
      009B84 CD 90 7B         [ 4] 5178 	call next_token 
      009B87 A3 00            [ 1] 5179 	cp a,#TK_COMMA 
      009B89 0F 23            [ 1] 5180 	jreq 1$ 
      009B8B 05 A6            [ 2] 5181 	jra 9$ 
      009B8D 0A CC 88         [ 4] 5182 1$:	call expression
      009B90 17 CD            [ 1] 5183 	cp a,#TK_INTGR
      009B92 A1 51            [ 1] 5184 	jreq 2$
      009B94 6B 01 A6         [ 2] 5185 	jp syntax_error
      009B97 01               [ 1] 5186 2$:	ld a,xl 
      009B98 0D 01            [ 2] 5187 	ldw x,(ADDR,sp) 
      009B9A 27 05 48         [ 2] 5188 	ldw farptr+1,x 
      009B9D 0A               [ 1] 5189 	clrw x 
      009B9E 01 26 FB         [ 4] 5190 	call write_byte
      009BA1 0D 02            [ 2] 5191 	ldw x,(ADDR,sp)
      009BA3 26               [ 2] 5192 	incw x 
      009BA4 05 43            [ 2] 5193 	jra 0$ 
      001E84                       5194 9$:
      001E84                       5195 	_drop VSIZE
      009BA6 E4 00            [ 2]    1     addw sp,#VSIZE 
      009BA8 20               [ 4] 5196 	ret 
                                   5197 
                                   5198 
                                   5199 ;---------------------
                                   5200 ;BASIC: CHAR(expr)
                                   5201 ; évaluate expression 
                                   5202 ; and take the 7 least 
                                   5203 ; bits as ASCII character
                                   5204 ;---------------------
      001E87                       5205 char:
      009BA9 02 EA 00         [ 4] 5206 	call func_args 
      009BAC E7 00            [ 1] 5207 	cp a,#1
      009BAE 5B 02            [ 1] 5208 	jreq 1$
      009BB0 81 07 95         [ 2] 5209 	jp syntax_error
      009BB1 CD 0F FB         [ 4] 5210 1$:	call dpop 
      009BB1 72               [ 1] 5211 	ld a,xl 
      009BB2 00 00            [ 1] 5212 	and a,#0x7f 
      009BB4 22               [ 1] 5213 	ld xl,a
      009BB5 02 4F            [ 1] 5214 	ld a,#TK_CHAR
      009BB7 81               [ 4] 5215 	ret
                                   5216 
                                   5217 ;---------------------
                                   5218 ; BASIC: ASC(string|char)
                                   5219 ; extract first character 
                                   5220 ; of string argument 
                                   5221 ; return it as TK_INTGR 
                                   5222 ;---------------------
      009BB8                       5223 ascii:
      009BB8 AE 9B DF         [ 4] 5224 	call func_args 
      009BBB CD 82 5D         [ 4] 5225 	call next_token 
      009BBE 5B 02            [ 1] 5226 	cp a,#TK_QSTR 
      009BC0 52 06            [ 1] 5227 	jreq 1$
      009BC2 CD 97            [ 1] 5228 	cp a,#TK_CHAR 
      009BC4 5D AE            [ 1] 5229 	jreq 2$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009BC6 16 C8 CF         [ 2] 5230 	jp syntax_error
      001EAC                       5231 1$: 
      009BC9 00               [ 1] 5232 	ld a,(x)
      009BCA 05 7F            [ 2] 5233 	jra 3$
      001EAF                       5234 2$: 
      009BCC 72               [ 1] 5235 	ld a,xl 
      009BCD 5F               [ 1] 5236 3$:	ld xl,a 
      009BCE 00               [ 1] 5237 	clr a  
      009BCF 04               [ 1] 5238 	ld xh,a 
      009BD0 5F CF            [ 1] 5239 	ld a,#TK_INTGR 
      009BD2 00               [ 4] 5240 	ret 
                                   5241 
                                   5242 ;---------------------
                                   5243 ;BASIC: KEY
                                   5244 ; wait for a character 
                                   5245 ; received from STDIN 
                                   5246 ; input:
                                   5247 ;	none 
                                   5248 ; output:
                                   5249 ;	X 		ASCII character 
                                   5250 ;---------------------
      001EB6                       5251 key:
      009BD3 01 72 11         [ 4] 5252 	call getc 
      009BD6 00               [ 1] 5253 	clrw x 
      009BD7 22               [ 1] 5254 	ld xl,a 
      009BD8 72 18            [ 1] 5255 	ld a,#TK_INTGR
      009BDA 00               [ 4] 5256 	ret
                                   5257 
                                   5258 ;----------------------
                                   5259 ; BASIC: QKEY
                                   5260 ; Return true if there 
                                   5261 ; is a character in 
                                   5262 ; waiting in STDIN 
                                   5263 ; input:
                                   5264 ;  none 
                                   5265 ; output:
                                   5266 ;   X 		0|1 
                                   5267 ;-----------------------
      001EBE                       5268 qkey: 
      009BDB 22               [ 1] 5269 	clrw x 
      009BDC CC 88 AC 0A 62   [ 2] 5270 	btjf UART1_SR,#UART_SR_RXNE,9$ 
      009BE1 72               [ 2] 5271 	incw x 
      009BE2 65 61            [ 1] 5272 9$: ld a,#TK_INTGR
      009BE4 6B               [ 4] 5273 	ret 
                                   5274 
                                   5275 ;---------------------
                                   5276 ; BASIC: GPIO(expr,reg)
                                   5277 ; return gpio address 
                                   5278 ; expr {0..8}
                                   5279 ; input:
                                   5280 ;   none 
                                   5281 ; output:
                                   5282 ;   X 		gpio register address
                                   5283 ;----------------------------
      001EC8                       5284 gpio:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009BE5 20 70 6F         [ 4] 5285 	call func_args 
      009BE8 69 6E            [ 1] 5286 	cp a,#2
      009BEA 74 2C            [ 1] 5287 	jreq 1$
      009BEC 20 52 55         [ 2] 5288 	jp syntax_error  
      001ED2                       5289 1$:	
      009BEF 4E 20 74         [ 2] 5290 	ldw x,#2
      009BF2 6F 20 72 65      [ 5] 5291 	ldw x,([dstkptr],x) ; port 
      009BF6 73 75            [ 1] 5292 	jrmi bad_port
      009BF8 6D 65 2E         [ 2] 5293 	cpw x,#9
      009BFB 0A 00            [ 1] 5294 	jrpl bad_port
      009BFD A6 05            [ 1] 5295 	ld a,#5
      009BFD 72               [ 4] 5296 	mul x,a
      009BFE 01 00 22         [ 2] 5297 	addw x,#GPIO_BASE 
      009C01 02               [ 2] 5298 	pushw x 
      009C02 4F 81 FB         [ 4] 5299 	call dpop 
      009C04 72 FB 01         [ 2] 5300 	addw x,(1,sp)
      009C04 CD 86            [ 2] 5301 	ldw (1,sp),x  
      009C06 E7 81 22         [ 4] 5302 	call ddrop  
      009C08 85               [ 2] 5303 	popw x 
      009C08 72 BB            [ 1] 5304 	ld a,#TK_INTGR
      009C0A 00               [ 4] 5305 	ret
      001EF6                       5306 bad_port:
      009C0B 14 24            [ 1] 5307 	ld a,#ERR_BAD_VALUE
      009C0D 04 72 5C         [ 2] 5308 	jp tb_error
                                   5309 
                                   5310 
                                   5311 ;-------------------------
                                   5312 ; BASIC: UFLASH 
                                   5313 ; return user flash address
                                   5314 ; input:
                                   5315 ;  none 
                                   5316 ; output:
                                   5317 ;	A		TK_INTGR
                                   5318 ;   X 		user address 
                                   5319 ;---------------------------
      001EFB                       5320 uflash:
      009C10 00 13 CF         [ 2] 5321 	ldw x,#user_space 
      009C13 00 14            [ 1] 5322 	ld a,#TK_INTGR 
      009C15 81               [ 4] 5323 	ret 
                                   5324 
                                   5325 
                                   5326 ;---------------------
                                   5327 ; BASIC: USR(addr[,arg])
                                   5328 ; execute a function written 
                                   5329 ; in binary code.
                                   5330 ; binary fonction should 
                                   5331 ; return token attribute in A 
                                   5332 ; and value in X. 
                                   5333 ; input:
                                   5334 ;   addr	routine address 
                                   5335 ;   arg 	is an optional argument 
                                   5336 ; output:
                                   5337 ;   A 		token attribute 
                                   5338 ;   X       returned value 
                                   5339 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009C16                       5340 usr:
      009C16 A6 01            [ 2] 5341 	pushw y 	
      009C18 C7 00 13         [ 4] 5342 	call func_args 
      009C1B 5F CF            [ 1] 5343 	cp a,#1 
      009C1D 00 14            [ 1] 5344 	jrpl 2$ 
      009C1F CC 07 95         [ 2] 5345 	jp syntax_error 
      001F0D                       5346 2$: 
      009C1F AE 00 03         [ 4] 5347 	call dpop 
      009C22 92 AF            [ 1] 5348 	cp a,#2 
      009C24 00 13            [ 1] 5349 	jrmi 4$
      009C26 26 05            [ 1] 5350 	ldw y,x ; y=arg 
      009C28 5A 2A F7         [ 4] 5351 	call dpop ;x=addr 
      009C2B 20               [ 1] 5352 4$:	exgw y,x ; y=addr,x=arg 
      009C2C 19 5C            [ 4] 5353 	call (y)
      009C2E CD 9C            [ 2] 5354 	popw y 
      009C30 08               [ 4] 5355 	ret 
                                   5356 
                                   5357 ;------------------------------
                                   5358 ; BASIC: BYE 
                                   5359 ; halt mcu in its lowest power mode 
                                   5360 ; wait for reset or external interrupt
                                   5361 ; do a cold start on wakeup.
                                   5362 ;------------------------------
      001F1F                       5363 bye:
      009C31 AE 02 7F C3 00   [ 2] 5364 	btjf UART1_SR,#UART_SR_TC,.
      009C36 13               [10] 5365 	halt
      009C37 2A E6 72         [ 2] 5366 	jp cold_start  
                                   5367 
                                   5368 ;----------------------------------
                                   5369 ; BASIC: AUTORUN "file_name" 
                                   5370 ; record in eeprom at adrress AUTORUN_NAME
                                   5371 ; the name of file to load and execute
                                   5372 ; at startup 
                                   5373 ; input:
                                   5374 ;   file_name   file to execute 
                                   5375 ; output:
                                   5376 ;   none
                                   5377 ;-----------------------------------
      001F28                       5378 autorun: 
      009C3A 5F 00 16 72 5F   [ 2] 5379 	btjf flags,#FRUN,0$ 
      009C3F 00 17            [ 1] 5380 	jreq 0$ 
      009C41 72 5F            [ 1] 5381 	ld a,#ERR_CMD_ONLY 
      009C43 00 18 81         [ 2] 5382 	jp tb_error 
      009C46                       5383 0$:	
      009C46 CE 00 13         [ 4] 5384 	call next_token 
      009C49 C6 00            [ 1] 5385 	cp a,#TK_QSTR
      009C4B 15 CF            [ 1] 5386 	jreq 1$
      009C4D 00 16 C7         [ 2] 5387 	jp syntax_error 
      001F3E                       5388 1$:	
      009C50 00               [ 2] 5389 	pushw x ; file name char*
      009C51 18 81            [ 1] 5390 	ldw y,x  
      009C53 CD 1B F4         [ 4] 5391 	call search_file 
      009C53 5F 92            [ 1] 5392 	jrc 2$ 
      009C55 AF 00            [ 1] 5393 	ld a,#ERR_NOT_FILE
      009C57 13 90 F1         [ 2] 5394 	jp tb_error  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      001F4B                       5395 2$: 
      009C5A 26 08 4D 27 12   [ 1] 5396 	mov in,count 
      009C5F 5C 90 5C 20      [ 1] 5397 	clr farptr 
      009C63 F0 40 00         [ 2] 5398 	ldw x,#AUTORUN_NAME
      009C64 CF 00 13         [ 2] 5399 	ldw farptr+1,x 
      009C64 4D 27            [ 2] 5400 	ldw x,(1,sp)  
      009C66 07 5C 92         [ 4] 5401 	call strlen  ; return length in X 
      009C69 AF 00            [ 2] 5402 	popw y 
      009C6B 13               [ 2] 5403 	pushw x 
      009C6C 20               [ 1] 5404 	clrw x 
      009C6D F6 5C 98         [ 4] 5405 	call write_block 
      001F66                       5406 	_drop 2 
      009C70 81 02            [ 2]    1     addw sp,#2 
      009C71 81               [ 4] 5407 	ret 
                                   5408 
                                   5409 ;----------------------------------
                                   5410 ; BASIC: SLEEP 
                                   5411 ; halt mcu until reset or external
                                   5412 ; interrupt.
                                   5413 ; Resume progam after SLEEP command
                                   5414 ;----------------------------------
      001F69                       5415 sleep:
      009C71 5C 99 81 30 FB   [ 2] 5416 	btjf UART1_SR,#UART_SR_TC,.
      009C74 72 16 00 21      [ 1] 5417 	bset flags,#FSLEEP
      009C74 52               [10] 5418 	halt 
      009C75 04               [ 4] 5419 	ret 
                                   5420 
                                   5421 ;-------------------------------
                                   5422 ; BASIC: PAUSE expr 
                                   5423 ; suspend execution for n msec.
                                   5424 ; input:
                                   5425 ;	none
                                   5426 ; output:
                                   5427 ;	none 
                                   5428 ;------------------------------
      001F74                       5429 pause:
      009C76 17 03 5F         [ 4] 5430 	call expression
      009C79 CF 00            [ 1] 5431 	cp a,#TK_INTGR
      009C7B 14 35            [ 1] 5432 	jreq pause02 
      009C7D 01 00 13         [ 2] 5433 	jp syntax_error
      009C80                       5434 pause02: 
      009C80 92               [ 2] 5435 1$: tnzw x 
      009C81 BC 00            [ 1] 5436 	jreq 2$
      009C83 13               [10] 5437 	wfi 
      009C84 27               [ 2] 5438 	decw x 
      009C85 25 5F            [ 1] 5439 	jrne 1$
      009C87 16               [ 1] 5440 2$:	clr a 
      009C88 03               [ 4] 5441 	ret 
                                   5442 
                                   5443 ;------------------------------
                                   5444 ; BASIC: AWU expr
                                   5445 ; halt mcu for 'expr' milliseconds
                                   5446 ; use Auto wakeup peripheral
                                   5447 ; all oscillators stopped except LSI
                                   5448 ; range: 1ms - 511ms
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   5449 ; input:
                                   5450 ;  none
                                   5451 ; output:
                                   5452 ;  none:
                                   5453 ;------------------------------
      001F87                       5454 awu:
      009C89 CD 9C 53         [ 4] 5455   call expression
      009C8C 25 2D            [ 1] 5456   cp a,#TK_INTGR
      009C8E 92 AF            [ 1] 5457   jreq awu02
      009C90 00 13 6B         [ 2] 5458   jp syntax_error
      001F91                       5459 awu02:
      009C93 01 5C 92         [ 2] 5460   cpw x,#5120
      009C96 AF 00            [ 1] 5461   jrmi 1$ 
      009C98 13 6B 02 5C      [ 1] 5462   mov AWU_TBR,#15 
      009C9C 72 FB            [ 1] 5463   ld a,#30
      009C9E 01               [ 2] 5464   div x,a
      009C9F 5C CD            [ 1] 5465   ld a,#16
      009CA1 9C               [ 2] 5466   div x,a 
      009CA2 08 AE            [ 2] 5467   jra 4$
      001FA2                       5468 1$: 
      009CA4 02 80 C3         [ 2] 5469   cpw x,#2048
      009CA7 00 13            [ 1] 5470   jrmi 2$ 
      009CA9 2A D5 50 F2      [ 1] 5471   mov AWU_TBR,#14
      009CAB A6 50            [ 1] 5472   ld a,#80
      009CAB 72               [ 2] 5473   div x,a 
      009CAC 5F 00            [ 2] 5474   jra 4$   
      001FB0                       5475 2$:
      009CAE 13 72 5F 00      [ 1] 5476   mov AWU_TBR,#7
      001FB4                       5477 3$:  
                                   5478 ; while X > 64  divide by 2 and increment AWU_TBR 
      009CB2 14 72 5F         [ 2] 5479   cpw x,#64 
      009CB5 00 15            [ 2] 5480   jrule 4$ 
      009CB7 5B 04 98 81      [ 1] 5481   inc AWU_TBR 
      009CBB 54               [ 2] 5482   srlw x 
      009CBB 5B 04            [ 2] 5483   jra 3$ 
      001FC0                       5484 4$:
      009CBD 99               [ 1] 5485   ld a, xl
      009CBE 81               [ 1] 5486   dec a 
      009CBF 27 01            [ 1] 5487   jreq 5$
      009CBF 72               [ 1] 5488   dec a 	
      001FC5                       5489 5$: 
      009CC0 01 00            [ 1] 5490   and a,#0x3e 
      009CC2 22 05 A6         [ 1] 5491   ld AWU_APR,a 
      009CC5 07 CC 88 17      [ 1] 5492   bset AWU_CSR,#AWU_CSR_AWUEN
      009CC9 8E               [10] 5493   halt 
                                   5494 
      009CC9 CE               [ 4] 5495   ret 
                                   5496 
                                   5497 ;------------------------------
                                   5498 ; BASIC: TICKS
                                   5499 ; return msec ticks counter value 
                                   5500 ; input:
                                   5501 ; 	none 
                                   5502 ; output:
                                   5503 ;	X 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



                                   5504 ;-------------------------------
      001FD0                       5505 get_ticks:
      009CCA 00 1D 72         [ 2] 5506 	ldw x,ticks 
      009CCD B0 00            [ 1] 5507 	ld a,#TK_INTGR
      009CCF 1B               [ 4] 5508 	ret 
                                   5509 
                                   5510 
                                   5511 
                                   5512 ;------------------------------
                                   5513 ; BASIC: ABS(expr)
                                   5514 ; return absolute value of expr.
                                   5515 ; input:
                                   5516 ;   none
                                   5517 ; output:
                                   5518 ;   X     	positive integer
                                   5519 ;-------------------------------
      001FD6                       5520 abs:
      009CD0 26 01 81         [ 4] 5521 	call func_args 
      009CD3 A1 01            [ 1] 5522 	cp a,#1 
      009CD3 52 04            [ 1] 5523 	jreq 0$ 
      009CD5 1F 01 CD         [ 2] 5524 	jp syntax_error
      001FE0                       5525 0$:  
      009CD8 88 DC A1         [ 4] 5526     call dpop   
      009CDB 0A               [ 1] 5527 	ld a,xh 
      009CDC 27 03            [ 1] 5528 	bcp a,#0x80 
      009CDE CC 88            [ 1] 5529 	jreq 2$ 
      009CE0 15               [ 2] 5530 	negw x 
      009CE1 A6 04            [ 1] 5531 2$: ld a,#TK_INTGR 
      009CE1 90               [ 4] 5532 	ret 
                                   5533 
                                   5534 ;------------------------------
                                   5535 ; BASIC: AND(expr1,expr2)
                                   5536 ; Apply bit AND relation between
                                   5537 ; the 2 arguments, i.e expr1 & expr2 
                                   5538 ; output:
                                   5539 ; 	A 		TK_INTGR
                                   5540 ;   X 		result 
                                   5541 ;------------------------------
      001FEC                       5542 bit_and:
      009CE2 CE 00 05         [ 4] 5543 	call func_args 
      009CE5 72 B9            [ 1] 5544 	cp a,#2
      009CE7 00 01            [ 1] 5545 	jreq 1$
      009CE9 17 03 55         [ 2] 5546 	jp syntax_error 
      009CEC 00 04 00         [ 4] 5547 1$:	call dpop 
      009CEF 02               [ 2] 5548 	pushw x 
      009CF0 93 CD 83         [ 4] 5549 	call dpop 
      009CF3 1F               [ 1] 5550 	ld a,xh 
      009CF4 1C 00            [ 1] 5551 	and a,(1,sp)
      009CF6 03               [ 1] 5552 	ld xh,a 
      009CF7 72               [ 1] 5553 	ld a,xl
      009CF8 FB 01            [ 1] 5554 	and a,(2,sp)
      009CFA 72               [ 1] 5555 	ld xl,a 
      002005                       5556 	_drop 2 
      009CFB 5D 00            [ 2]    1     addw sp,#2 
      009CFD 16 26            [ 1] 5557 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009CFF 0B               [ 4] 5558 	ret
                                   5559 
                                   5560 ;------------------------------
                                   5561 ; BASIC: OR(expr1,expr2)
                                   5562 ; Apply bit OR relation between
                                   5563 ; the 2 arguments, i.e expr1 | expr2 
                                   5564 ; output:
                                   5565 ; 	A 		TK_INTGR
                                   5566 ;   X 		result 
                                   5567 ;------------------------------
      00200A                       5568 bit_or:
      009D00 72 B0 00         [ 4] 5569 	call func_args 
      009D03 17 23            [ 1] 5570 	cp a,#2
      009D05 05 A6            [ 1] 5571 	jreq 1$
      009D07 01 CC 88         [ 2] 5572 	jp syntax_error 
      002014                       5573 1$: 
      009D0A 17 0F FB         [ 4] 5574 	call dpop 
      009D0B 89               [ 2] 5575 	pushw x 
      009D0B 16 03 CD         [ 4] 5576 	call dpop 
      009D0E 9C               [ 1] 5577 	ld a,xh 
      009D0F 74 24            [ 1] 5578 	or a,(1,sp)
      009D11 05               [ 1] 5579 	ld xh,a 
      009D12 A6               [ 1] 5580 	ld a,xl 
      009D13 08 CC            [ 1] 5581 	or a,(2,sp)
      009D15 88               [ 1] 5582 	ld xl,a 
      002023                       5583 	_drop 2 
      009D16 17 02            [ 2]    1     addw sp,#2 
      009D17 A6 04            [ 1] 5584 	ld a,#TK_INTGR 
      009D17 CE               [ 4] 5585 	ret
                                   5586 
                                   5587 ;------------------------------
                                   5588 ; BASIC: XOR(expr1,expr2)
                                   5589 ; Apply bit XOR relation between
                                   5590 ; the 2 arguments, i.e expr1 ^ expr2 
                                   5591 ; output:
                                   5592 ; 	A 		TK_INTGR
                                   5593 ;   X 		result 
                                   5594 ;------------------------------
      002028                       5595 bit_xor:
      009D18 00 16 C6         [ 4] 5596 	call func_args 
      009D1B 00 18            [ 1] 5597 	cp a,#2
      009D1D CF 00            [ 1] 5598 	jreq 1$
      009D1F 13 C7 00         [ 2] 5599 	jp syntax_error 
      002032                       5600 1$: 
      009D22 15 1E 03         [ 4] 5601 	call dpop 
      009D25 CD               [ 2] 5602 	pushw x 
      009D26 83 1F 5C         [ 4] 5603 	call dpop 
      009D29 1F               [ 1] 5604 	ld a,xh 
      009D2A 01 5F            [ 1] 5605 	xor a,(1,sp)
      009D2C 16               [ 1] 5606 	ld xh,a 
      009D2D 03               [ 1] 5607 	ld a,xl 
      009D2E CD 81            [ 1] 5608 	xor a,(2,sp)
      009D30 ED               [ 1] 5609 	ld xl,a 
      002041                       5610 	_drop 2 
      009D31 CE 00            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009D33 1D 72            [ 1] 5611 	ld a,#TK_INTGR 
      009D35 B0               [ 4] 5612 	ret 
                                   5613 
                                   5614 ;------------------------------
                                   5615 ; BASIC: LSHIFT(expr1,expr2)
                                   5616 ; logical shift left expr1 by 
                                   5617 ; expr2 bits 
                                   5618 ; output:
                                   5619 ; 	A 		TK_INTGR
                                   5620 ;   X 		result 
                                   5621 ;------------------------------
      002046                       5622 lshift:
      009D36 00 1B 1F         [ 4] 5623 	call func_args
      009D39 01 5F            [ 1] 5624 	cp a,#2 
      009D3B 7B 01            [ 1] 5625 	jreq 1$
      009D3D CD 81 78         [ 2] 5626 	jp syntax_error
      009D40 5C 7B 02         [ 4] 5627 1$: call dpop  
      009D43 CD               [ 1] 5628 	exgw x,y 
      009D44 81 78 5C         [ 4] 5629 	call dpop
      009D47 CD 9C            [ 2] 5630 	tnzw y 
      009D49 08 1E            [ 1] 5631 	jreq 4$
      009D4B 01               [ 2] 5632 2$:	sllw x 
      009D4C 89 5F            [ 2] 5633 	decw y 
      009D4E 90 CE            [ 1] 5634 	jrne 2$
      002060                       5635 4$:  
      009D50 00 1B            [ 1] 5636 	ld a,#TK_INTGR
      009D52 CD               [ 4] 5637 	ret
                                   5638 
                                   5639 ;------------------------------
                                   5640 ; BASIC: RSHIFT(expr1,expr2)
                                   5641 ; logical shift right expr1 by 
                                   5642 ; expr2 bits.
                                   5643 ; output:
                                   5644 ; 	A 		TK_INTGR
                                   5645 ;   X 		result 
                                   5646 ;------------------------------
      002063                       5647 rshift:
      009D53 81 ED 5B         [ 4] 5648 	call func_args
      009D56 02 AE            [ 1] 5649 	cp a,#2 
      009D58 00 01            [ 1] 5650 	jreq 1$
      009D5A A6 FF CD         [ 2] 5651 	jp syntax_error
      009D5D 81 78 CD         [ 4] 5652 1$: call dpop  
      009D60 9C               [ 1] 5653 	exgw x,y 
      009D61 08 CE 00         [ 4] 5654 	call dpop
      009D64 13 C6            [ 2] 5655 	tnzw y 
      009D66 00 15            [ 1] 5656 	jreq 4$
      009D68 CF               [ 2] 5657 2$:	srlw x 
      009D69 00 16            [ 2] 5658 	decw y 
      009D6B C7 00            [ 1] 5659 	jrne 2$
      00207D                       5660 4$:  
      009D6D 18 5F            [ 1] 5661 	ld a,#TK_INTGR
      009D6F 4B               [ 4] 5662 	ret
                                   5663 
                                   5664 ;--------------------------
                                   5665 ; BASIC: FCPU integer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                                   5666 ; set CPU frequency 
                                   5667 ;-------------------------- 
                                   5668 
      002080                       5669 fcpu:
      009D70 04 04            [ 1] 5670 	ld a,#TK_INTGR
      009D71 CD 12 0E         [ 4] 5671 	call expect 
      009D71 4F               [ 1] 5672 	ld a,xl 
      009D72 CD 81            [ 1] 5673 	and a,#7 
      009D74 78 5C 0A         [ 1] 5674 	ld CLK_CKDIVR,a 
      009D77 01               [ 4] 5675 	ret 
                                   5676 
                                   5677 ;------------------------------
                                   5678 ; BASIC: PMODE pin#, mode 
                                   5679 ; define pin as input or output
                                   5680 ; pin#: {0..15}
                                   5681 ; mode: INPUT|OUTPUT  
                                   5682 ;------------------------------
                           000001  5683 	PINNO=1
                           000001  5684 	VSIZE=1
      00208C                       5685 pin_mode:
      00208C                       5686 	_vars VSIZE 
      009D78 26 F7            [ 2]    1     sub sp,#VSIZE 
      009D7A 84 1E 01         [ 4] 5687 	call arg_list 
      009D7D CD 8A            [ 1] 5688 	cp a,#2 
      009D7F 75 5B            [ 1] 5689 	jreq 1$
      009D81 04 81 95         [ 2] 5690 	jp syntax_error 
      009D83 CD 0F FB         [ 4] 5691 1$: call dpop ; mode 
      009D83 CD               [ 1] 5692 	exgw x,y 
      009D84 9C 08 CD         [ 4] 5693 	call dpop ; Dx pin 
      009D87 86 E7 5F         [ 4] 5694 	call select_pin 
      009D8A 92 AF            [ 1] 5695 	ld (PINNO,sp),a  
      009D8C 00 13            [ 1] 5696 	ld a,#1 
      009D8E 90 95            [ 1] 5697 	tnz (PINNO,sp)
      009D90 5C 92            [ 1] 5698 	jreq 4$
      009D92 AF               [ 1] 5699 2$:	sll a 
      009D93 00 13            [ 1] 5700 	dec (PINNO,sp)
      009D95 5C 90            [ 1] 5701 	jrne 2$ 
      009D97 97 72            [ 1] 5702 	ld (PINNO,sp),a
      009D99 B9 00            [ 1] 5703 	or a,(GPIO_CR1,x) ;if input->pull-up else push-pull 
      009D9B 1B 90            [ 1] 5704 	ld (GPIO_CR1,x),a 
      009D9D CF 00 1D 90      [ 2] 5705 4$:	cpw y,#OUTP 
      009DA1 CE 00            [ 1] 5706 	jreq 6$
                                   5707 ; input mode
      009DA3 1B 01            [ 1] 5708 	ld a,(PINNO,sp)
      009DA4 43               [ 1] 5709 	cpl a 
      009DA4 92 AF            [ 1] 5710 	and a,(GPIO_DDR,x)	; bit==0 for input. 
      009DA6 00 13            [ 2] 5711 	jra 9$
      0020C2                       5712 6$: ;output mode  
      009DA8 90 F7            [ 1] 5713 	ld a,(PINNO,sp)
      009DAA 5C 90            [ 1] 5714 	or a,(GPIO_CR2,x) ;port speed 10 Mhz 
      009DAC 5C 90            [ 1] 5715 	ld (GPIO_CR2,x),a 
      009DAE C3 00            [ 1] 5716 	ld a,(PINNO,sp)
      009DB0 1D 2B            [ 1] 5717 	or a,(GPIO_DDR,x) ; bit==1 for output 
      009DB2 F1 81            [ 1] 5718 9$:	ld (GPIO_DDR,x),a 
      009DB4                       5719 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009DB4 72 01            [ 2]    1     addw sp,#VSIZE 
      009DB6 00               [ 4] 5720 	ret
                                   5721 
                                   5722 ;------------------------
                                   5723 ; select pin 
                                   5724 ; input:
                                   5725 ;   X 	 {0..15} Arduino Dx 
                                   5726 ; output:
                                   5727 ;   A     stm8s208 pin 
                                   5728 ;   X     base address s208 GPIO port 
                                   5729 ;---------------------------
      0020D1                       5730 select_pin:
      009DB7 22               [ 2] 5731 	sllw x 
      009DB8 07 27 05         [ 2] 5732 	addw x,#arduino_to_8s208 
      009DBB A6               [ 2] 5733 	ldw x,(x)
      009DBC 07               [ 1] 5734 	ld a,xl 
      009DBD CC               [ 1] 5735 	push a 
      009DBE 88               [ 1] 5736 	swapw x 
      009DBF 17 05            [ 1] 5737 	ld a,#5 
      009DC0 42               [ 4] 5738 	mul x,a 
      009DC0 CD 88 DC         [ 2] 5739 	addw x,#GPIO_BASE 
      009DC3 A1               [ 1] 5740 	pop a 
      009DC4 0A               [ 4] 5741 	ret 
                                   5742 ; translation from Arduino D0..D15 to stm8s208rb 
      0020E1                       5743 arduino_to_8s208:
      009DC5 27 03                 5744 .byte 3,6 ; D0 
      009DC7 CC 88                 5745 .byte 3,5 ; D1 
      009DC9 15 00                 5746 .byte 4,0 ; D2 
      009DCA 02 01                 5747 .byte 2,1 ; D3
      009DCA 90 CE                 5748 .byte 6,0 ; D4
      009DCC 00 05                 5749 .byte 2,2 ; D5
      009DCE 72 B9                 5750 .byte 2,3 ; D6
      009DD0 00 01                 5751 .byte 3,1 ; D7
      009DD2 55 00                 5752 .byte 3,3 ; D8
      009DD4 04 00                 5753 .byte 2,4 ; D9
      009DD6 02 CD                 5754 .byte 4,5 ; D10
      009DD8 9C 74                 5755 .byte 2,6 ; D11
      009DDA 25 05                 5756 .byte 2,7 ; D12
      009DDC A6 09                 5757 .byte 2,5 ; D13
      009DDE CC 88                 5758 .byte 4,2 ; D14
      009DE0 17 01                 5759 .byte 4,1 ; D15
                                   5760 
                                   5761 
                                   5762 ;------------------------------
                                   5763 ; BASIC: RND(expr)
                                   5764 ; return random number 
                                   5765 ; between 1 and expr inclusive
                                   5766 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5767 ; input:
                                   5768 ; 	none 
                                   5769 ; output:
                                   5770 ;	X 		random positive integer 
                                   5771 ;------------------------------
      009DE1                       5772 random:
      009DE1 CD 9D 83         [ 4] 5773 	call func_args 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009DE4 CE 00            [ 1] 5774 	cp a,#1
      009DE6 1D 72            [ 1] 5775 	jreq 1$
      009DE8 B0 00 1B         [ 2] 5776 	jp syntax_error
      00210B                       5777 1$: 
      009DEB CD 8A 75         [ 4] 5778 	call dpop 
      009DEE 81               [ 2] 5779 	pushw x 
      009DEF 9E               [ 1] 5780 	ld a,xh 
      009DEF CD 88            [ 1] 5781 	bcp a,#0x80 
      009DF1 DC A1            [ 1] 5782 	jreq 2$
      009DF3 00 27            [ 1] 5783 	ld a,#ERR_BAD_VALUE
      009DF5 26 A1 0A         [ 2] 5784 	jp tb_error
      002119                       5785 2$: 
                                   5786 ; acc16=(x<<5)^x 
      009DF8 27 03 CC         [ 2] 5787 	ldw x,seedx 
      009DFB 88               [ 2] 5788 	sllw x 
      009DFC 15               [ 2] 5789 	sllw x 
      009DFD 90               [ 2] 5790 	sllw x 
      009DFE CE               [ 2] 5791 	sllw x 
      009DFF 00               [ 2] 5792 	sllw x 
      009E00 05               [ 1] 5793 	ld a,xh 
      009E01 72 B9 00         [ 1] 5794 	xor a,seedx 
      009E04 01 55 00         [ 1] 5795 	ld acc16,a 
      009E07 04               [ 1] 5796 	ld a,xl 
      009E08 00 02 CD         [ 1] 5797 	xor a,seedx+1 
      009E0B 9C 74 25         [ 1] 5798 	ld acc8,a 
                                   5799 ; seedx=seedy 
      009E0E 05 A6 09         [ 2] 5800 	ldw x,seedy 
      009E11 CC 88 17         [ 2] 5801 	ldw seedx,x  
                                   5802 ; seedy=seedy^(seedy>>1)
      009E14 90 54            [ 2] 5803 	srlw y 
      009E14 CE 00            [ 1] 5804 	ld a,yh 
      009E16 13 C6 00         [ 1] 5805 	xor a,seedy 
      009E19 15 20 0A         [ 1] 5806 	ld seedy,a  
      009E1C 90 9F            [ 1] 5807 	ld a,yl 
      009E1C AE 01 00         [ 1] 5808 	xor a,seedy+1 
      009E1F 4F CF 00         [ 1] 5809 	ld seedy+1,a 
                                   5810 ; acc16>>3 
      009E22 13 C7 00         [ 2] 5811 	ldw x,acc16 
      009E25 15               [ 2] 5812 	srlw x 
      009E26 54               [ 2] 5813 	srlw x 
      009E26 CF               [ 2] 5814 	srlw x 
                                   5815 ; x=acc16^x 
      009E27 00               [ 1] 5816 	ld a,xh 
      009E28 16 C7 00         [ 1] 5817 	xor a,acc16 
      009E2B 18               [ 1] 5818 	ld xh,a 
      009E2C 4B               [ 1] 5819 	ld a,xl 
      009E2D 04 5F 09         [ 1] 5820 	xor a,acc8 
      009E2F 97               [ 1] 5821 	ld xl,a 
                                   5822 ; seedy=x^seedy 
      009E2F 4F CD 81         [ 1] 5823 	xor a,seedy+1
      009E32 78               [ 1] 5824 	ld xl,a 
      009E33 5C               [ 1] 5825 	ld a,xh 
      009E34 0A 01 26         [ 1] 5826 	xor a,seedy
      009E37 F7               [ 1] 5827 	ld xh,a 
      009E38 84 81 10         [ 2] 5828 	ldw seedy,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   5829 ; return seedy modulo expr + 1 
      009E3A 90 85            [ 2] 5830 	popw y 
      009E3A 52               [ 2] 5831 	divw x,y 
      009E3B 02               [ 1] 5832 	ldw x,y 
      009E3C 5F               [ 2] 5833 	incw x 
      009E3D 1F 01            [ 1] 5834 	ld a,#TK_INTGR
      009E3F CF               [ 4] 5835 	ret 
                                   5836 
                                   5837 ;---------------------------------
                                   5838 ; BASIC: WORDS 
                                   5839 ; affiche la listes des mots du
                                   5840 ; dictionnaire.
                                   5841 ;---------------------------------
                           000001  5842 	WLEN=1
                           000002  5843 	LLEN=2  
                           000002  5844 	VSIZE=2 
      00216B                       5845 words:
      00216B                       5846 	_vars VSIZE
      009E40 00 14            [ 2]    1     sub sp,#VSIZE 
      009E42 35 01            [ 1] 5847 	clr (LLEN,sp)
      009E44 00 13 25 10      [ 2] 5848 	ldw y,#kword_dict+2
      009E46 93               [ 1] 5849 0$:	ldw x,y
      009E46 5F               [ 1] 5850 	ld a,(x)
      009E47 92 AF            [ 1] 5851 	and a,#15 
      009E49 00 13            [ 1] 5852 	ld (WLEN,sp),a 
      009E4B 27               [ 2] 5853 1$:	incw x 
      009E4C 39               [ 1] 5854 	ld a,(x)
      009E4D CD 01 CB         [ 4] 5855 	call putc 
      009E4D 92 AF            [ 1] 5856 	inc (LLEN,sp)
      009E4F 00 13            [ 1] 5857 	dec (WLEN,sp)
      009E51 27 06            [ 1] 5858 	jrne 1$
      009E53 CD 82            [ 1] 5859 	ld a,#70
      009E55 4B 5C            [ 1] 5860 	cp a,(LLEN,sp)
      009E57 20 F4            [ 1] 5861 	jrmi 2$   
      009E59 5C A6            [ 1] 5862 	ld a,#SPACE 
      009E5B 20 CD 82         [ 4] 5863 	call putc 
      009E5E 4B 92            [ 1] 5864 	inc (LLEN,sp) 
      009E60 AF 00            [ 2] 5865 	jra 3$
      009E62 13 90            [ 1] 5866 2$: ld a,#CR 
      009E64 95 5C 92         [ 4] 5867 	call putc 
      009E67 AF 00            [ 1] 5868 	clr (LLEN,sp)
      009E69 13 5C 90 97      [ 2] 5869 3$:	subw y,#2 
      009E6D 90 89            [ 2] 5870 	ldw y,(y)
      009E6F 72 FB            [ 1] 5871 	jrne 0$  
      0021A2                       5872 	_drop VSIZE 
      009E71 01 5C            [ 2]    1     addw sp,#VSIZE 
      009E73 CD               [ 4] 5873 	ret 
                                   5874 
                                   5875 
                                   5876 ;-----------------------------
                                   5877 ; BASIC: TIMER expr 
                                   5878 ; initialize count down timer 
                                   5879 ;-----------------------------
      0021A5                       5880 set_timer:
      009E74 9C 08 85         [ 4] 5881 	call arg_list
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      009E77 CD 8A            [ 1] 5882 	cp a,#1 
      009E79 75 A6            [ 1] 5883 	jreq 1$
      009E7B 0D CD 82         [ 2] 5884 	jp syntax_error
      0021AF                       5885 1$: 
      009E7E 4B 1E 01         [ 4] 5886 	call dpop 
      009E81 5C 1F 01         [ 2] 5887 	ldw timer,x 
      009E84 20               [ 4] 5888 	ret 
                                   5889 
                                   5890 ;------------------------------
                                   5891 ; BASIC: TIMEOUT 
                                   5892 ; return state of timer 
                                   5893 ;------------------------------
      0021B6                       5894 timeout:
      009E85 C0 00 0C         [ 2] 5895 	ldw x,timer 
      009E86                       5896 logical_complement:
      009E86 1E               [ 2] 5897 	cplw x 
      009E87 01 CD 8A         [ 2] 5898 	cpw x,#-1
      009E8A 75 AE            [ 1] 5899 	jreq 2$
      009E8C 9E               [ 1] 5900 	clrw x 
      009E8D BB CD            [ 1] 5901 2$:	ld a,#TK_INTGR
      009E8F 82               [ 4] 5902 	ret 
                                   5903 
                                   5904 ;--------------------------------
                                   5905 ; BASIC NOT(expr) 
                                   5906 ; return logical complement of expr
                                   5907 ;--------------------------------
      0021C3                       5908 func_not:
      009E90 5D A6 FF         [ 4] 5909 	call func_args  
      009E93 C0 00            [ 1] 5910 	cp a,#1
      009E95 18 C7            [ 1] 5911 	jreq 1$
      009E97 00 0A A6         [ 2] 5912 	jp syntax_error
      009E9A 7F C2 00         [ 4] 5913 1$:	call dpop 
      009E9D 17 C7            [ 2] 5914 	jra logical_complement
                                   5915 
                                   5916 
                                   5917 
                                   5918 ;-----------------------------------
                                   5919 ; BASIC: ENIWDG expr1, expr2 
                                   5920 ; enable independant watchdog timer 
                                   5921 ;-----------------------------------
      0021D2                       5922 enable_iwdg:
      009E9F 00 09 A6         [ 4] 5923 	call arg_list
      009EA2 02 C2            [ 1] 5924 	cp a,#2 
      009EA4 00 16            [ 1] 5925 	jreq 1$
      009EA6 C7 00 08         [ 2] 5926 	jp syntax_error 
      0021DC                       5927 1$: 	
      009EA9 5F A6 06 97      [ 1] 5928 	mov IWDG_KR,#IWDG_KEY_ENABLE
      009EAD A6 0A CD         [ 4] 5929 	call dpop 
      009EB0 8A 2D AE 9E      [ 1] 5930 	mov IWDG_KR,#IWDG_KEY_ACCESS 
      009EB4 C3               [ 1] 5931 	ld a,xl 
      009EB5 CD 82 5D         [ 1] 5932 	ld IWDG_RLR,a 
      009EB8 5B 02 81         [ 4] 5933 	call dpop
      009EBB 20 66            [ 1] 5934 	ld a,#7
      009EBD 69               [ 2] 5935 	div x,a 
      009EBE 6C 65 73 0A      [ 1] 5936 	mov IWDG_KR,#IWDG_KEY_ACCESS 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]



      009EC2 00 20 62         [ 1] 5937 	ld IWDG_PR,a 
      009EC5 79 74 65 73      [ 1] 5938 	mov IWDG_KR,#IWDG_KEY_REFRESH
      009EC9 20               [ 4] 5939 	ret 
                                   5940 
                                   5941 
                                   5942 ;-----------------------------------
                                   5943 ; BASIC: REFIWDG 0|1 
                                   5944 ; refresh independant watchdog count down 
                                   5945 ; timer before it reset MCU. 
                                   5946 ;-----------------------------------
      0021FD                       5947 refresh_iwdg:
      009ECA 66 72 65 65      [ 1] 5948 	mov IWDG_KR,#IWDG_KEY_REFRESH 
      009ECE 0A               [ 4] 5949 	ret 
                                   5950 
                                   5951 
                                   5952 ;-------------------------------------
                                   5953 ; BASIC: LOG2(expr)
                                   5954 ; return logarithm base 2 of expr 
                                   5955 ; this is the position of most significant
                                   5956 ; bit set. 
                                   5957 ; input: 
                                   5958 ; output:
                                   5959 ;   X     log2 
                                   5960 ;   A     TK_INTGR 
                                   5961 ;*********************************
      002202                       5962 log2:
      009ECF 00 12 3F         [ 4] 5963 	call func_args 
      009ED0 A1 01            [ 1] 5964 	cp a,#1 
      009ED0 52 02            [ 1] 5965 	jreq 1$
      009ED2 72 5F 00         [ 2] 5966 	jp syntax_error 
      009ED5 13 CD 93         [ 4] 5967 1$: call dpop
      00220F                       5968 first_one:
      009ED8 9F               [ 2] 5969 	tnzw x 
      009ED9 A1 04            [ 1] 5970 	jreq 4$
      009EDB 27 03            [ 1] 5971 	ld a,#15 
      009EDD CC               [ 2] 5972 2$: rlcw x 
      009EDE 88 15            [ 1] 5973     jrc 3$
      009EE0 1F               [ 1] 5974 	dec a 
      009EE1 01 CD            [ 2] 5975 	jra 2$
      009EE3 88               [ 1] 5976 3$: clrw x 
      009EE4 DC               [ 1] 5977     ld xl,a
      009EE5 A1 0D            [ 1] 5978 4$:	ld a,#TK_INTGR
      009EE7 27               [ 4] 5979 	ret 
                                   5980 
                                   5981 ;-----------------------------------
                                   5982 ; BASIC: PWR(expr) 
                                   5983 ; expr ->{0..15}
                                   5984 ; return 2^expr 
                                   5985 ; output:
                                   5986 ;    x    2^expr 
                                   5987 ;-----------------------------------
      00221F                       5988 pwr2:
      009EE8 02 20 19         [ 4] 5989     call func_args 
      009EEB CD 93            [ 1] 5990 	cp a,#1
      009EED 9F A1            [ 1] 5991 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]



      009EEF 04 27 03         [ 2] 5992 	jp syntax_error 
      009EF2 CC 88 15         [ 4] 5993 1$: call dpop 
      009EF5 9F               [ 1] 5994 	ld a,xl 
      009EF6 1E 01            [ 1] 5995 	and a,#15
      009EF8 CF               [ 1] 5996 	clrw x 
      009EF9 00               [ 2] 5997 	incw x 
      009EFA 14               [ 1] 5998 2$: tnz a 
      009EFB 5F CD            [ 1] 5999 	jreq 3$
      009EFD 81               [ 2] 6000 	slaw x 
      009EFE 78               [ 1] 6001 	dec a 
      009EFF 1E 01            [ 2] 6002 	jra 2$ 
      009F01 5C 20            [ 1] 6003 3$: ld a,#TK_INTGR
      009F03 DC               [ 4] 6004 	ret 
                                   6005 
                                   6006 
                                   6007 ;------------------------------
                                   6008 ;      dictionary 
                                   6009 ; format:
                                   6010 ;   link:   2 bytes 
                                   6011 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   6012 ;   cmd_name: 16 byte max 
                                   6013 ;   code_address: 2 bytes 
                                   6014 ;------------------------------
                                   6015 	.macro _dict_entry len,name,cmd 
                                   6016 	.word LINK 
                                   6017 	LINK=.
                                   6018 name:
                                   6019 	.byte len 	
                                   6020 	.ascii "name"
                                   6021 	.word cmd 
                                   6022 	.endm 
                                   6023 
                           000000  6024 	LINK=0
      009F04                       6025 kword_end:
      00223B                       6026 	_dict_entry,5+F_IFUNC,XPEEK,xpeek 
      009F04 5B 02                    1 	.word LINK 
                           00223D     2 	LINK=.
      00223D                          3 XPEEK:
      009F06 81                       4 	.byte 5+F_IFUNC 	
      009F07 58 50 45 45 4B           5 	.ascii "XPEEK"
      009F07 CD 92                    6 	.word xpeek 
      002245                       6027 	_dict_entry,3+F_IFUNC,XOR,bit_xor
      009F09 BF A1                    1 	.word LINK 
                           002247     2 	LINK=.
      002247                          3 XOR:
      009F0B 01                       4 	.byte 3+F_IFUNC 	
      009F0C 27 03 CC                 5 	.ascii "XOR"
      009F0F 88 15                    6 	.word bit_xor 
      00224D                       6028 	_dict_entry,5,WRITE,write  
      009F11 CD 90                    1 	.word LINK 
                           00224F     2 	LINK=.
      00224F                          3 WRITE:
      009F13 7B                       4 	.byte 5 	
      009F14 9F A4 7F 97 A6           5 	.ascii "WRITE"
      009F19 03 81                    6 	.word write 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]



      009F1B                       6029 	_dict_entry,5,WORDS,words 
      009F1B CD 92                    1 	.word LINK 
                           002259     2 	LINK=.
      002259                          3 WORDS:
      009F1D BF                       4 	.byte 5 	
      009F1E CD 88 DC A1 0A           5 	.ascii "WORDS"
      009F23 27 07                    6 	.word words 
      002261                       6030 	_dict_entry 4,WAIT,wait 
      009F25 A1 03                    1 	.word LINK 
                           002263     2 	LINK=.
      002263                          3 WAIT:
      009F27 27                       4 	.byte 4 	
      009F28 06 CC 88 15              5 	.ascii "WAIT"
      009F2C 17 77                    6 	.word wait 
      00226A                       6031 	_dict_entry,3+F_IFUNC,USR,usr
      009F2C F6 20                    1 	.word LINK 
                           00226C     2 	LINK=.
      00226C                          3 USR:
      009F2E 01                       4 	.byte 3+F_IFUNC 	
      009F2F 55 53 52                 5 	.ascii "USR"
      009F2F 9F 97                    6 	.word usr 
      002272                       6032 	_dict_entry,6+F_IFUNC,UFLASH,uflash 
      009F31 4F 95                    1 	.word LINK 
                           002274     2 	LINK=.
      002274                          3 UFLASH:
      009F33 A6                       4 	.byte 6+F_IFUNC 	
      009F34 04 81 4C 41 53 48        5 	.ascii "UFLASH"
      009F36 1E FB                    6 	.word uflash 
      00227D                       6033 	_dict_entry,6+F_IFUNC,UBOUND,ubound 
      009F36 CD 82                    1 	.word LINK 
                           00227F     2 	LINK=.
      00227F                          3 UBOUND:
      009F38 54                       4 	.byte 6+F_IFUNC 	
      009F39 5F 97 A6 04 81 44        5 	.ascii "UBOUND"
      009F3E 13 DE                    6 	.word ubound 
      002288                       6034 	_dict_entry,2,TO,to
      009F3E 5F 72                    1 	.word LINK 
                           00228A     2 	LINK=.
      00228A                          3 TO:
      009F40 0B                       4 	.byte 2 	
      009F41 52 30                    5 	.ascii "TO"
      009F43 01 5C                    6 	.word to 
      00228F                       6035 	_dict_entry,7+F_IFUNC,TIMEOUT,timeout 
      009F45 A6 04                    1 	.word LINK 
                           002291     2 	LINK=.
      002291                          3 TIMEOUT:
      009F47 81                       4 	.byte 7+F_IFUNC 	
      009F48 54 49 4D 45 4F 55 54     5 	.ascii "TIMEOUT"
      009F48 CD 92                    6 	.word timeout 
      00229B                       6036 	_dict_entry,5,TIMER,set_timer
      009F4A BF A1                    1 	.word LINK 
                           00229D     2 	LINK=.
      00229D                          3 TIMER:
      009F4C 02                       4 	.byte 5 	
      009F4D 27 03 CC 88 15           5 	.ascii "TIMER"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]



      009F52 21 A5                    6 	.word set_timer 
      0022A5                       6037 	_dict_entry,5+F_IFUNC,TICKS,get_ticks
      009F52 AE 00                    1 	.word LINK 
                           0022A7     2 	LINK=.
      0022A7                          3 TICKS:
      009F54 02                       4 	.byte 5+F_IFUNC 	
      009F55 72 DE 00 19 2B           5 	.ascii "TICKS"
      009F5A 1B A3                    6 	.word get_ticks 
      0022AF                       6038 	_dict_entry,4,STOP,stop 
      009F5C 00 09                    1 	.word LINK 
                           0022B1     2 	LINK=.
      0022B1                          3 STOP:
      009F5E 2A                       4 	.byte 4 	
      009F5F 16 A6 05 42              5 	.ascii "STOP"
      009F63 1C 50                    6 	.word stop 
      0022B8                       6039 	_dict_entry,4,STEP,step 
      009F65 00 89                    1 	.word LINK 
                           0022BA     2 	LINK=.
      0022BA                          3 STEP:
      009F67 CD                       4 	.byte 4 	
      009F68 90 7B 72 FB              5 	.ascii "STEP"
      009F6C 01 1F                    6 	.word step 
      0022C1                       6040 	_dict_entry,5,SLEEP,sleep 
      009F6E 01 CD                    1 	.word LINK 
                           0022C3     2 	LINK=.
      0022C3                          3 SLEEP:
      009F70 90                       4 	.byte 5 	
      009F71 A2 85 A6 04 81           5 	.ascii "SLEEP"
      009F76 1F 69                    6 	.word sleep 
      0022CB                       6041 	_dict_entry,4+F_IFUNC,SIZE,size
      009F76 A6 0A                    1 	.word LINK 
                           0022CD     2 	LINK=.
      0022CD                          3 SIZE:
      009F78 CC                       4 	.byte 4+F_IFUNC 	
      009F79 88 17 5A 45              5 	.ascii "SIZE"
      009F7B 13 D4                    6 	.word size 
      0022D4                       6042     _dict_entry,4,SHOW,show 
      009F7B AE A6                    1 	.word LINK 
                           0022D6     2 	LINK=.
      0022D6                          3 SHOW:
      009F7D 00                       4 	.byte 4 	
      009F7E A6 04 81 57              5 	.ascii "SHOW"
      009F81 13 BA                    6 	.word show 
      0022DD                       6043 	_dict_entry,4,SAVE,save
      009F81 90 89                    1 	.word LINK 
                           0022DF     2 	LINK=.
      0022DF                          3 SAVE:
      009F83 CD                       4 	.byte 4 	
      009F84 92 BF A1 01              5 	.ascii "SAVE"
      009F88 2A 03                    6 	.word save 
      0022E6                       6044 	_dict_entry 3,RUN,run
      009F8A CC 88                    1 	.word LINK 
                           0022E8     2 	LINK=.
      0022E8                          3 RUN:
      009F8C 15                       4 	.byte 3 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]



      009F8D 52 55 4E                 5 	.ascii "RUN"
      009F8D CD 90                    6 	.word run 
      0022EE                       6045 	_dict_entry,6+F_IFUNC,RSHIFT,rshift
      009F8F 7B A1                    1 	.word LINK 
                           0022F0     2 	LINK=.
      0022F0                          3 RSHIFT:
      009F91 02                       4 	.byte 6+F_IFUNC 	
      009F92 2B 05 90 93 CD 90        5 	.ascii "RSHIFT"
      009F98 7B 51                    6 	.word rshift 
      0022F9                       6046 	_dict_entry,3+F_IFUNC,RND,random 
      009F9A 90 FD                    1 	.word LINK 
                           0022FB     2 	LINK=.
      0022FB                          3 RND:
      009F9C 90                       4 	.byte 3+F_IFUNC 	
      009F9D 85 81 44                 5 	.ascii "RND"
      009F9F 21 01                    6 	.word random 
      002301                       6047 	_dict_entry,6,RETURN,return 
      009F9F 72 0D                    1 	.word LINK 
                           002303     2 	LINK=.
      002303                          3 RETURN:
      009FA1 52                       4 	.byte 6 	
      009FA2 30 FB 8E CC 85 F9        5 	.ascii "RETURN"
      009FA8 19 A7                    6 	.word return 
      00230C                       6048 	_dict_entry 6,REMARK,rem 
      009FA8 72 01                    1 	.word LINK 
                           00230E     2 	LINK=.
      00230E                          3 REMARK:
      009FAA 00                       4 	.byte 6 	
      009FAB 22 07 27 05 A6 07        5 	.ascii "REMARK"
      009FB1 CC 88                    6 	.word rem 
      002317                       6049 	_dict_entry,7,REFIWDG,refresh_iwdg
      009FB3 17 0E                    1 	.word LINK 
                           002319     2 	LINK=.
      009FB4                          3 REFIWDG:
      009FB4 CD                       4 	.byte 7 	
      009FB5 88 DC A1 0A 27 03 CC     5 	.ascii "REFIWDG"
      009FBC 88 15                    6 	.word refresh_iwdg 
      009FBE                       6050 	_dict_entry,6,REBOOT,cold_start 
      009FBE 89 90                    1 	.word LINK 
                           002325     2 	LINK=.
      002325                          3 REBOOT:
      009FC0 93                       4 	.byte 6 	
      009FC1 CD 9C 74 25 05 A6        5 	.ascii "REBOOT"
      009FC7 09 CC                    6 	.word cold_start 
      00232E                       6051 	_dict_entry,4+F_IFUNC,QKEY,qkey  
      009FC9 88 17                    1 	.word LINK 
                           002330     2 	LINK=.
      009FCB                          3 QKEY:
      009FCB 55                       4 	.byte 4+F_IFUNC 	
      009FCC 00 04 00 02              5 	.ascii "QKEY"
      009FD0 72 5F                    6 	.word qkey 
      002337                       6052 	_dict_entry,3+F_IFUNC,PWR,pwr2
      009FD2 00 13                    1 	.word LINK 
                           002339     2 	LINK=.
      002339                          3 PWR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]



      009FD4 AE                       4 	.byte 3+F_IFUNC 	
      009FD5 40 00 CF                 5 	.ascii "PWR"
      009FD8 00 14                    6 	.word pwr2 
      00233F                       6053 	_dict_entry 5,PRINT,print 
      009FDA 1E 01                    1 	.word LINK 
                           002341     2 	LINK=.
      002341                          3 PRINT:
      009FDC CD                       4 	.byte 5 	
      009FDD 83 1F 90 85 89           5 	.ascii "PRINT"
      009FE2 5F CD                    6 	.word print 
      002349                       6054 	_dict_entry,4+F_CONST,POUT,OUTP 
      009FE4 81 ED                    1 	.word LINK 
                           00234B     2 	LINK=.
      00234B                          3 POUT:
      009FE6 5B                       4 	.byte 4+F_CONST 	
      009FE7 02 81 55 54              5 	.ascii "POUT"
      009FE9 00 01                    6 	.word OUTP 
      002352                       6055 	_dict_entry,4,POKE,poke 
      009FE9 72 0D                    1 	.word LINK 
                           002354     2 	LINK=.
      002354                          3 POKE:
      009FEB 52                       4 	.byte 4 	
      009FEC 30 FB 72 16              5 	.ascii "POKE"
      009FF0 00 22                    6 	.word poke 
      00235B                       6056 	_dict_entry,4+F_CONST,PINP,INP 
      009FF2 8E 81                    1 	.word LINK 
                           00235D     2 	LINK=.
      009FF4                          3 PINP:
      009FF4 CD                       4 	.byte 4+F_CONST 	
      009FF5 93 9F A1 04              5 	.ascii "PINP"
      009FF9 27 03                    6 	.word INP 
      002364                       6057 	_dict_entry,4+F_IFUNC,PEEK,peek 
      009FFB CC 88                    1 	.word LINK 
                           002366     2 	LINK=.
      002366                          3 PEEK:
      009FFD 15                       4 	.byte 4+F_IFUNC 	
      009FFE 50 45 45 4B              5 	.ascii "PEEK"
      009FFE 5D 27                    6 	.word peek 
      00236D                       6058 	_dict_entry,5,PMODE,pin_mode 
      00A000 04 8F                    1 	.word LINK 
                           00236F     2 	LINK=.
      00236F                          3 PMODE:
      00A002 5A                       4 	.byte 5 	
      00A003 26 F9 4F 81 45           5 	.ascii "PMODE"
      00A007 20 8C                    6 	.word pin_mode 
      002377                       6059 	_dict_entry,5,PAUSE,pause 
      00A007 CD 93                    1 	.word LINK 
                           002379     2 	LINK=.
      002379                          3 PAUSE:
      00A009 9F                       4 	.byte 5 	
      00A00A A1 04 27 03 CC           5 	.ascii "PAUSE"
      00A00F 88 15                    6 	.word pause 
      00A011                       6060 	_dict_entry,2+F_IFUNC,OR,bit_or
      00A011 A3 14                    1 	.word LINK 
                           002383     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]



      002383                          3 OR:
      00A013 00                       4 	.byte 2+F_IFUNC 	
      00A014 2B 0C                    5 	.ascii "OR"
      00A016 35 0F                    6 	.word bit_or 
      002388                       6061 	_dict_entry,3+F_CONST,ODR,GPIO_ODR
      00A018 50 F2                    1 	.word LINK 
                           00238A     2 	LINK=.
      00238A                          3 ODR:
      00A01A A6                       4 	.byte 3+F_CONST 	
      00A01B 1E 62 A6                 5 	.ascii "ODR"
      00A01E 10 62                    6 	.word GPIO_ODR 
      002390                       6062 	_dict_entry,3+F_IFUNC,NOT,func_not 
      00A020 20 1E                    1 	.word LINK 
                           002392     2 	LINK=.
      00A022                          3 NOT:
      00A022 A3                       4 	.byte 3+F_IFUNC 	
      00A023 08 00 2B                 5 	.ascii "NOT"
      00A026 09 35                    6 	.word func_not 
      002398                       6063 	_dict_entry,3,NEW,new
      00A028 0E 50                    1 	.word LINK 
                           00239A     2 	LINK=.
      00239A                          3 NEW:
      00A02A F2                       4 	.byte 3 	
      00A02B A6 50 62                 5 	.ascii "NEW"
      00A02E 20 10                    6 	.word new 
      00A030                       6064 	_dict_entry,4,NEXT,next 
      00A030 35 07                    1 	.word LINK 
                           0023A2     2 	LINK=.
      0023A2                          3 NEXT:
      00A032 50                       4 	.byte 4 	
      00A033 F2 45 58 54              5 	.ascii "NEXT"
      00A034 18 E6                    6 	.word next 
      0023A9                       6065 	_dict_entry,6+F_IFUNC,LSHIFT,lshift
      00A034 A3 00                    1 	.word LINK 
                           0023AB     2 	LINK=.
      0023AB                          3 LSHIFT:
      00A036 40                       4 	.byte 6+F_IFUNC 	
      00A037 23 07 72 5C 50 F2        5 	.ascii "LSHIFT"
      00A03D 54 20                    6 	.word lshift 
      0023B4                       6066 	_dict_entry,3+F_IFUNC,LOG,log2 
      00A03F F4 AB                    1 	.word LINK 
                           0023B6     2 	LINK=.
      00A040                          3 LOG:
      00A040 9F                       4 	.byte 3+F_IFUNC 	
      00A041 4A 27 01                 5 	.ascii "LOG"
      00A044 4A 02                    6 	.word log2 
      00A045                       6067 	_dict_entry,4,LOAD,load 
      00A045 A4 3E                    1 	.word LINK 
                           0023BE     2 	LINK=.
      0023BE                          3 LOAD:
      00A047 C7                       4 	.byte 4 	
      00A048 50 F1 72 18              5 	.ascii "LOAD"
      00A04C 50 F0                    6 	.word load 
      0023C5                       6068 	_dict_entry 4,LIST,list
      00A04E 8E 81                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]



                           0023C7     2 	LINK=.
      00A050                          3 LIST:
      00A050 CE                       4 	.byte 4 	
      00A051 00 0B A6 04              5 	.ascii "LIST"
      00A055 81 28                    6 	.word list 
      00A056                       6069 	_dict_entry 3,LET,let 
      00A056 CD 92                    1 	.word LINK 
                           0023D0     2 	LINK=.
      0023D0                          3 LET:
      00A058 BF                       4 	.byte 3 	
      00A059 A1 01 27                 5 	.ascii "LET"
      00A05C 03 CC                    6 	.word let 
      0023D6                       6070 	_dict_entry,3+F_IFUNC,KEY,key 
      00A05E 88 15                    1 	.word LINK 
                           0023D8     2 	LINK=.
      00A060                          3 KEY:
      00A060 CD                       4 	.byte 3+F_IFUNC 	
      00A061 90 7B 9E                 5 	.ascii "KEY"
      00A064 A5 80                    6 	.word key 
      0023DE                       6071 	_dict_entry,5,INPUT,input_var  
      00A066 27 01                    1 	.word LINK 
                           0023E0     2 	LINK=.
      0023E0                          3 INPUT:
      00A068 50                       4 	.byte 5 	
      00A069 A6 04 81 55 54           5 	.ascii "INPUT"
      00A06C 16 FD                    6 	.word input_var 
      0023E8                       6072 	_dict_entry,2,IF,if 
      00A06C CD 92                    1 	.word LINK 
                           0023EA     2 	LINK=.
      0023EA                          3 IF:
      00A06E BF                       4 	.byte 2 	
      00A06F A1 02                    5 	.ascii "IF"
      00A071 27 03                    6 	.word if 
      0023EF                       6073 	_dict_entry,3+F_CONST,IDR,GPIO_IDR
      00A073 CC 88                    1 	.word LINK 
                           0023F1     2 	LINK=.
      0023F1                          3 IDR:
      00A075 15                       4 	.byte 3+F_CONST 	
      00A076 CD 90 7B                 5 	.ascii "IDR"
      00A079 89 CD                    6 	.word GPIO_IDR 
      0023F7                       6074 	_dict_entry,3,HEX,hex_base
      00A07B 90 7B                    1 	.word LINK 
                           0023F9     2 	LINK=.
      0023F9                          3 HEX:
      00A07D 9E                       4 	.byte 3 	
      00A07E 14 01 95                 5 	.ascii "HEX"
      00A081 9F 14                    6 	.word hex_base 
      0023FF                       6075 	_dict_entry,4+F_IFUNC,GPIO,gpio 
      00A083 02 97                    1 	.word LINK 
                           002401     2 	LINK=.
      002401                          3 GPIO:
      00A085 5B                       4 	.byte 4+F_IFUNC 	
      00A086 02 A6 04 81              5 	.ascii "GPIO"
      00A08A 1E C8                    6 	.word gpio 
      002408                       6076 	_dict_entry,4,GOTO,goto 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]



      00A08A CD 92                    1 	.word LINK 
                           00240A     2 	LINK=.
      00240A                          3 GOTO:
      00A08C BF                       4 	.byte 4 	
      00A08D A1 02 27 03              5 	.ascii "GOTO"
      00A091 CC 88                    6 	.word goto 
      002411                       6077 	_dict_entry,5,GOSUB,gosub 
      00A093 15 0A                    1 	.word LINK 
                           002413     2 	LINK=.
      00A094                          3 GOSUB:
      00A094 CD                       4 	.byte 5 	
      00A095 90 7B 89 CD 90           5 	.ascii "GOSUB"
      00A09A 7B 9E                    6 	.word gosub 
      00241B                       6078 	_dict_entry,6,FORGET,forget 
      00A09C 1A 01                    1 	.word LINK 
                           00241D     2 	LINK=.
      00241D                          3 FORGET:
      00A09E 95                       4 	.byte 6 	
      00A09F 9F 1A 02 97 5B 02        5 	.ascii "FORGET"
      00A0A5 A6 04                    6 	.word forget 
      002426                       6079 	_dict_entry,3,FOR,for 
      00A0A7 81 1D                    1 	.word LINK 
                           002428     2 	LINK=.
      00A0A8                          3 FOR:
      00A0A8 CD                       4 	.byte 3 	
      00A0A9 92 BF A1                 5 	.ascii "FOR"
      00A0AC 02 27                    6 	.word for 
      00242E                       6080 	_dict_entry,4,FCPU,fcpu 
      00A0AE 03 CC                    1 	.word LINK 
                           002430     2 	LINK=.
      002430                          3 FCPU:
      00A0B0 88                       4 	.byte 4 	
      00A0B1 15 43 50 55              5 	.ascii "FCPU"
      00A0B2 20 80                    6 	.word fcpu 
      002437                       6081 	_dict_entry,6,ENIWDG,enable_iwdg
      00A0B2 CD 90                    1 	.word LINK 
                           002439     2 	LINK=.
      002439                          3 ENIWDG:
      00A0B4 7B                       4 	.byte 6 	
      00A0B5 89 CD 90 7B 9E 18        5 	.ascii "ENIWDG"
      00A0BB 01 95                    6 	.word enable_iwdg 
      002442                       6082 	_dict_entry,6+F_CONST,EEPROM,EEPROM_BASE  
      00A0BD 9F 18                    1 	.word LINK 
                           002444     2 	LINK=.
      002444                          3 EEPROM:
      00A0BF 02                       4 	.byte 6+F_CONST 	
      00A0C0 97 5B 02 A6 04 81        5 	.ascii "EEPROM"
      00A0C6 40 00                    6 	.word EEPROM_BASE 
      00244D                       6083 	_dict_entry,6+F_CMD,DWRITE,digital_write
      00A0C6 CD 92                    1 	.word LINK 
                           00244F     2 	LINK=.
      00244F                          3 DWRITE:
      00A0C8 BF                       4 	.byte 6+F_CMD 	
      00A0C9 A1 02 27 03 CC 88        5 	.ascii "DWRITE"
      00A0CF 15 CD                    6 	.word digital_write 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
Hexadecimal [24-Bits]



      002458                       6084 	_dict_entry,5+F_IFUNC,DREAD,digital_read
      00A0D1 90 7B                    1 	.word LINK 
                           00245A     2 	LINK=.
      00245A                          3 DREAD:
      00A0D3 51                       4 	.byte 5+F_IFUNC 	
      00A0D4 CD 90 7B 90 5D           5 	.ascii "DREAD"
      00A0D9 27 05                    6 	.word digital_read 
      002462                       6085 	_dict_entry,3,DIR,directory 
      00A0DB 58 90                    1 	.word LINK 
                           002464     2 	LINK=.
      002464                          3 DIR:
      00A0DD 5A                       4 	.byte 3 	
      00A0DE 26 FB 52                 5 	.ascii "DIR"
      00A0E0 1D BA                    6 	.word directory 
      00246A                       6086 	_dict_entry,3,DEC,dec_base
      00A0E0 A6 04                    1 	.word LINK 
                           00246C     2 	LINK=.
      00246C                          3 DEC:
      00A0E2 81                       4 	.byte 3 	
      00A0E3 44 45 43                 5 	.ascii "DEC"
      00A0E3 CD 92                    6 	.word dec_base 
      002472                       6087 	_dict_entry,3+F_CONST,DDR,GPIO_DDR
      00A0E5 BF A1                    1 	.word LINK 
                           002474     2 	LINK=.
      002474                          3 DDR:
      00A0E7 02                       4 	.byte 3+F_CONST 	
      00A0E8 27 03 CC                 5 	.ascii "DDR"
      00A0EB 88 15                    6 	.word GPIO_DDR 
      00247A                       6088 	_dict_entry,3+F_CONST,CRL,GPIO_CR1
      00A0ED CD 90                    1 	.word LINK 
                           00247C     2 	LINK=.
      00247C                          3 CRL:
      00A0EF 7B                       4 	.byte 3+F_CONST 	
      00A0F0 51 CD 90                 5 	.ascii "CRL"
      00A0F3 7B 90                    6 	.word GPIO_CR1 
      002482                       6089 	_dict_entry,3+F_CONST,CRH,GPIO_CR2
      00A0F5 5D 27                    1 	.word LINK 
                           002484     2 	LINK=.
      002484                          3 CRH:
      00A0F7 05                       4 	.byte 3+F_CONST 	
      00A0F8 54 90 5A                 5 	.ascii "CRH"
      00A0FB 26 FB                    6 	.word GPIO_CR2 
      00A0FD                       6090 	_dict_entry,4+F_CFUNC,CHAR,char
      00A0FD A6 04                    1 	.word LINK 
                           00248C     2 	LINK=.
      00248C                          3 CHAR:
      00A0FF 81                       4 	.byte 4+F_CFUNC 	
      00A100 43 48 41 52              5 	.ascii "CHAR"
      00A100 A6 04                    6 	.word char 
      002493                       6091 	_dict_entry,3,BYE,bye 
      00A102 CD 92                    1 	.word LINK 
                           002495     2 	LINK=.
      002495                          3 BYE:
      00A104 8E                       4 	.byte 3 	
      00A105 9F A4 07                 5 	.ascii "BYE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 123.
Hexadecimal [24-Bits]



      00A108 C7 50                    6 	.word bye 
      00249B                       6092 	_dict_entry,5,BTOGL,bit_toggle
      00A10A C6 81                    1 	.word LINK 
                           00249D     2 	LINK=.
      00A10C                          3 BTOGL:
      00A10C 52                       4 	.byte 5 	
      00A10D 01 CD 92 9B A1           5 	.ascii "BTOGL"
      00A112 02 27                    6 	.word bit_toggle 
      0024A5                       6093 	_dict_entry,5+F_IFUNC,BTEST,bit_test 
      00A114 03 CC                    1 	.word LINK 
                           0024A7     2 	LINK=.
      0024A7                          3 BTEST:
      00A116 88                       4 	.byte 5+F_IFUNC 	
      00A117 15 CD 90 7B 51           5 	.ascii "BTEST"
      00A11C CD 90                    6 	.word bit_test 
      0024AF                       6094 	_dict_entry,4,BSET,bit_set 
      00A11E 7B CD                    1 	.word LINK 
                           0024B1     2 	LINK=.
      0024B1                          3 BSET:
      00A120 A1                       4 	.byte 4 	
      00A121 51 6B 01 A6              5 	.ascii "BSET"
      00A125 01 0D                    6 	.word bit_set 
      0024B8                       6095 	_dict_entry,4,BRES,bit_reset
      00A127 01 27                    1 	.word LINK 
                           0024BA     2 	LINK=.
      0024BA                          3 BRES:
      00A129 0B                       4 	.byte 4 	
      00A12A 48 0A 01 26              5 	.ascii "BRES"
      00A12E FB 6B                    6 	.word bit_reset 
      0024C1                       6096 	_dict_entry,5,BREAK,break 
      00A130 01 EA                    1 	.word LINK 
                           0024C3     2 	LINK=.
      0024C3                          3 BREAK:
      00A132 03                       4 	.byte 5 	
      00A133 E7 03 90 A3 00           5 	.ascii "BREAK"
      00A138 01 27                    6 	.word break 
      0024CB                       6097 	_dict_entry,4,BEEP,beep 
      00A13A 07 7B                    1 	.word LINK 
                           0024CD     2 	LINK=.
      0024CD                          3 BEEP:
      00A13C 01                       4 	.byte 4 	
      00A13D 43 E4 02 20              5 	.ascii "BEEP"
      00A141 0A 19                    6 	.word beep 
      00A142                       6098 	_dict_entry,3,AWU,awu 
      00A142 7B 01                    1 	.word LINK 
                           0024D6     2 	LINK=.
      0024D6                          3 AWU:
      00A144 EA                       4 	.byte 3 	
      00A145 04 E7 04                 5 	.ascii "AWU"
      00A148 7B 01                    6 	.word awu 
      0024DC                       6099 	_dict_entry,7,AUTORUN,autorun
      00A14A EA 02                    1 	.word LINK 
                           0024DE     2 	LINK=.
      0024DE                          3 AUTORUN:
      00A14C E7                       4 	.byte 7 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 124.
Hexadecimal [24-Bits]



      00A14D 02 5B 01 81 52 55 4E     5 	.ascii "AUTORUN"
      00A151 1F 28                    6 	.word autorun 
      0024E8                       6100 	_dict_entry,3+F_IFUNC,ASC,ascii
      00A151 58 1C                    1 	.word LINK 
                           0024EA     2 	LINK=.
      0024EA                          3 ASC:
      00A153 A1                       4 	.byte 3+F_IFUNC 	
      00A154 61 FE 9F                 5 	.ascii "ASC"
      00A157 88 5E                    6 	.word ascii 
      0024F0                       6101 	_dict_entry,3+F_IFUNC,AND,bit_and
      00A159 A6 05                    1 	.word LINK 
                           0024F2     2 	LINK=.
      0024F2                          3 AND:
      00A15B 42                       4 	.byte 3+F_IFUNC 	
      00A15C 1C 50 00                 5 	.ascii "AND"
      00A15F 84 81                    6 	.word bit_and 
      00A161                       6102 	_dict_entry,7+F_IFUNC,ADCREAD,analog_read
      00A161 03 06                    1 	.word LINK 
                           0024FA     2 	LINK=.
      0024FA                          3 ADCREAD:
      00A163 03                       4 	.byte 7+F_IFUNC 	
      00A164 05 04 00 02 01 06 00     5 	.ascii "ADCREAD"
      00A16B 02 02                    6 	.word analog_read 
      002504                       6103 	_dict_entry,5,ADCON,power_adc 
      00A16D 02 03                    1 	.word LINK 
                           002506     2 	LINK=.
      002506                          3 ADCON:
      00A16F 03                       4 	.byte 5 	
      00A170 01 03 03 02 04           5 	.ascii "ADCON"
      00A175 04 05                    6 	.word power_adc 
      00250E                       6104 kword_dict:
      00250E                       6105 	_dict_entry,3+F_IFUNC,ABS,abs
      00A177 02 06                    1 	.word LINK 
                           002510     2 	LINK=.
      002510                          3 ABS:
      00A179 02                       4 	.byte 3+F_IFUNC 	
      00A17A 07 02 05                 5 	.ascii "ABS"
      00A17D 04 02                    6 	.word abs 
                                   6106 	
                                   6107 
      002580                       6108 	.bndry 128 ; align on FLASH block.
                                   6109 ; free space for user application  
      002580                       6110 user_space:
                                   6111 ; USR() function test
      00A17F 04               [ 2] 6112 	pushw x 
      00A180 01 1A 50 0A      [ 1] 6113 	bset PC_ODR,#5 
      00A181 85               [ 2] 6114 	popw x 
      00A181 CD 92 BF         [ 4] 6115 	call pause02 
      00A184 A1 01 27 03      [ 1] 6116 	bres PC_ODR,#5 
      00A188 CC               [ 4] 6117 	ret
                                   6118 
                                   6119 	.area FLASH_DRIVE (ABS)
      010000                       6120 	.org 0x10000
      010000                       6121 fdrive:
      00A189 88 15 00 00           6122 .byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 125.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002510 R   |   5 ADCON      002506 R
  5 ADCREAD    0024FA R   |     ADC_CR1 =  005401     |     ADC_CR1_=  000000 
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
    AFR7_BEE=  000007     |   5 AND        0024F2 R   |     ARG_CNT =  000001 
    ARG_OFS =  000002     |   5 ASC        0024EA R   |     ATTRIB  =  000002 
  5 AUTORUN    0024DE R   |     AUTORUN_=  004000     |   5 AWU        0024D6 R
  5 AWUHandl   00000A R   |     AWU_APR =  0050F1     |     AWU_CSR =  0050F0 
    AWU_CSR_=  000004     |     AWU_TBR =  0050F2     |     B0_MASK =  000001 
    B115200 =  000006     |     B19200  =  000003     |     B1_MASK =  000002 
    B230400 =  000007     |     B2400   =  000000     |     B2_MASK =  000004 
    B38400  =  000004     |     B3_MASK =  000008     |     B460800 =  000008 
    B4800   =  000001     |     B4_MASK =  000010     |     B57600  =  000005 
    B5_MASK =  000020     |     B6_MASK =  000040     |     B7_MASK =  000080 
    B921600 =  000009     |     B9600   =  000002     |     BASE    =  000002 
    BASE_SAV=  000001     |   5 BEEP       0024CD R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_ER=  000000     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  000005 
  5 BREAK      0024C3 R   |   5 BRES       0024BA R   |   5 BSET       0024B1 R
    BSIZE   =  000001     |     BSP     =  000008     |   5 BTEST      0024A7 R
  5 BTOGL      00249D R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        002495 R   |     C       =  000001     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000000     |   5 CHAR       00248C R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
    CLK_ECKR=  000001     |     CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 126.
Hexadecimal [24-Bits]

Symbol Table

    CLK_ICKR=  000002     |     CLK_ICKR=  000000     |     CLK_ICKR=  000001 
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
  5 CRH        002484 R   |   5 CRL        00247C R   |     CTRL_A  =  000001 
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
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        002474 R
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        00246C R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        002464 R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
  5 DREAD      00245A R   |     DSTACK_S=  000040     |   5 DWRITE     00244F R
  5 EEPROM     002444 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |   5 ENIWDG     002439 R   |     EOF     =  0000FF 
    ERR_BAD_=  00000A     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_L=  000005     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |   5 FCPU       002430 R
    FF      =  00000C     |     FFOR    =  000002     |     FHSE    =  7A1200 
    FHSI    =  F42400     |     FIRST   =  000001     |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 127.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLSI    =  01F400 
  5 FOR        002428 R   |   5 FORGET     00241D R   |     FRUN    =  000000 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FTRAP   =  000001 
    F_CFUNC =  000080     |     F_CMD   =  000000     |     F_CONST =  0000C0 
    F_IFUNC =  000040     |   5 GOSUB      002413 R   |     GOS_RET =  000003 
  5 GOTO       00240A R   |   5 GPIO       002401 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  5 HEX        0023F9 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        0023F1 R
  5 IF         0023EA R   |     IN      =  000007     |     INCR    =  000001 
    INP     =  000000     |   5 INPUT      0023E0 R   |     INPUT_DI=  000000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 128.
Hexadecimal [24-Bits]

Symbol Table

    INT_VECT=  008054     |     INT_VECT=  008000     |     INT_VECT=  008030 
    INT_VECT=  008038     |     INT_VECT=  008034     |     INT_VECT=  008040 
    INT_VECT=  00803C     |     INT_VECT=  008048     |     INT_VECT=  008044 
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  008050     |     INT_VECT=  00804C     |     INT_VECT=  00805C 
    INT_VECT=  008058     |     INW     =  000003     |     ITC_SPR1=  007F70 
    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KEY=  000055     |     IWDG_KEY=  0000CC 
    IWDG_KEY=  0000AA     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   5 KEY        0023D8 R   |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000005     |   5 LET        0023D0 R
    LINENO  =  000005     |   5 LINK    =  002510 R   |   5 LIST       0023C7 R
    LL      =  000002     |     LLEN    =  000002     |     LL_HB   =  000001 
    LNO     =  000005     |     LN_PTR  =  000005     |   5 LOAD       0023BE R
  5 LOG        0023B6 R   |   5 LSHIFT     0023AB R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NAMEPTR =  000003 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        00239A R
  5 NEXT       0023A2 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NL      =  00000A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |   5 NOT        002392 R   |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R
  5 ODR        00238A R   |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
  5 OR         002383 R   |     OUTP    =  000001     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
    PAD_SIZE=  000028     |   5 PAUSE      002379 R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       002366 R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
    PE_CR2  =  005018     |     PE_DDR  =  005016     |     PE_IDR  =  005015 
    PE_ODR  =  005014     |     PF      =  000019     |     PF_BASE =  005019 
    PF_CR1  =  00501C     |     PF_CR2  =  00501D     |     PF_DDR  =  00501B 
    PF_IDR  =  00501A     |     PF_ODR  =  005019     |     PG      =  00001E 
    PG_BASE =  00501E     |     PG_CR1  =  005021     |     PG_CR2  =  005022 
    PG_DDR  =  005020     |     PG_IDR  =  00501F     |     PG_ODR  =  00501E 
    PH      =  000023     |     PH_BASE =  005023     |     PH_CR1  =  005026 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 129.
Hexadecimal [24-Bits]

Symbol Table

    PH_CR2  =  005027     |     PH_DDR  =  005025     |     PH_IDR  =  005024 
    PH_ODR  =  005023     |     PI      =  000028     |     PINNO   =  000001 
  5 PINP       00235D R   |     PINVAL  =  000002     |     PI_BASE =  005028 
    PI_CR1  =  00502B     |     PI_CR2  =  00502C     |     PI_DDR  =  00502A 
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 PMODE      00236F R
  5 POKE       002354 R   |   5 POUT       00234B R   |     PREV    =  000001 
  5 PRINT      002341 R   |     PROD    =  000002     |     PSIZE   =  000001 
  5 PWR        002339 R   |   5 QKEY       002330 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 REBOOT     002325 R
  5 REFIWDG    002319 R   |   5 REG_A      00099F R   |   5 REG_CC     0009A3 R
  5 REG_EPC    000992 R   |   5 REG_SP     0009A8 R   |   5 REG_X      00099B R
  5 REG_Y      000997 R   |     RELOP   =  000005     |   5 REMARK     00230E R
    RETL1   =  000001     |   5 RETURN     002303 R   |   5 RND        0022FB R
    ROP     =  004800     |   5 RSHIFT     0022F0 R   |     RST_SR  =  0050B3 
  5 RUN        0022E8 R   |     RXCHAR  =  000001     |     R_A     =  000007 
    R_CC    =  000008     |     R_X     =  000005     |     R_Y     =  000003 
  5 SAVE       0022DF R   |     SDIVD   =  000002     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       0022D6 R
    SIGN    =  000001     |   5 SIZE       0022CD R   |     SKIP    =  000006 
  5 SLEEP      0022C3 R   |     SPACE   =  000020     |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SQUOT   =  000001     |     SRC     =  000003 
    STACK_EM=  0017FF     |     STACK_SI=  000080     |   5 STATES     000955 R
  5 STEP       0022BA R   |   5 STOP       0022B1 R   |     SWIM_CSR=  007F80 
    TAB     =  000009     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      0022A7 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 130.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_EGR=  005257     |     TIM1_EGR=  000007     |     TIM1_EGR=  000001 
    TIM1_EGR=  000002     |     TIM1_EGR=  000003     |     TIM1_EGR=  000004 
    TIM1_EGR=  000005     |     TIM1_EGR=  000006     |     TIM1_EGR=  000000 
    TIM1_ETR=  005253     |     TIM1_ETR=  000006     |     TIM1_ETR=  000000 
    TIM1_ETR=  000001     |     TIM1_ETR=  000002     |     TIM1_ETR=  000003 
    TIM1_ETR=  000007     |     TIM1_ETR=  000004     |     TIM1_ETR=  000005 
    TIM1_IER=  005254     |     TIM1_IER=  000007     |     TIM1_IER=  000001 
    TIM1_IER=  000002     |     TIM1_IER=  000003     |     TIM1_IER=  000004 
    TIM1_IER=  000005     |     TIM1_IER=  000006     |     TIM1_IER=  000000 
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
    TIM4_SR =  005342     |     TIM4_SR_=  000000     |   5 TIMEOUT    002291 R
  5 TIMER      00229D R   |     TIM_CR1_=  000007     |     TIM_CR1_=  000000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 131.
Hexadecimal [24-Bits]

Symbol Table

    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_PLUS =  000010 
    TK_QSTR =  00000A     |     TK_RPARE=  00000C     |     TK_SHARP=  00000E 
    TK_VAR  =  000005     |   5 TO         00228A R   |   5 Timer4Up   000027 R
  5 TrapHand   000018 R   |     U8      =  000003     |     UART1   =  000000 
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
    UBC     =  004801     |   5 UBOUND     00227F R   |   5 UFLASH     002274 R
  5 USER_ABO   000096 R   |   5 USR        00226C R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 UserButt   00003D R
    VSIZ    =  000002     |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       002263 R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      002259 R   |   5 WRITE      00224F R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XADR    =  000001     |     XMASK   =  000001 
  5 XOR        002247 R   |   5 XPEEK      00223D R   |     XSAVE   =  000003 
    YSAVE   =  000003     |   5 abs        001FD6 R   |   1 acc16      000008 R
  1 acc24      000007 R   |   1 acc8       000009 R   |   5 accept_c   000B49 R
  5 add        0010DC R   |   5 analog_r   001A8A R   |   5 ansi_seq   000B0B R
  5 arduino_   0020E1 R   |   5 arg_list   00121B R   |   1 array_si   00001F R
  5 ascii      001E9B R   |   5 at_tst     000E16 R   |   5 atoi24     000F29 R
  5 atoi_exi   000F97 R   |   5 autorun    001F28 R   |   5 autorun_   000652 R
  5 awu        001F87 R   |   5 awu02      001F91 R   |   5 bad_port   001EF6 R
  1 base       000006 R   |   1 basicptr   000004 R   |   5 beep       001A19 R
  5 bin_exit   000D1A R   |   5 bit_and    001FEC R   |   5 bit_or     00200A R
  5 bit_rese   0017B6 R   |   5 bit_set    0017A2 R   |   5 bit_test   0017DF R
  5 bit_togg   0017CB R   |   5 bit_xor    002028 R   |   5 bkslsh_t   000DC1 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 132.
Hexadecimal [24-Bits]

Symbol Table

  5 bksp       0001E7 R   |   5 break      001B31 R   |   5 break_po   001B5F R
  5 bye        001F1F R   |   5 char       001E87 R   |   5 check_fu   00040A R
  5 clear_ba   000667 R   |   5 clear_va   000514 R   |   5 clock_in   0000B1 R
  5 cmd_itf    000B6D R   |   5 cmd_name   001187 R   |   5 cmp_name   001BD3 R
  5 cold_sta   000579 R   |   5 colon_ts   000DEA R   |   5 comma_ts   000DF5 R
  5 compile    000419 R   |   5 convert_   000CA2 R   |   1 count      000003 R
  5 cp_loop    0011CA R   |   5 create_g   000369 R   |   5 cstk_pro   0010A6 R
  5 dash_tst   000E0B R   |   5 ddrop      001022 R   |   5 ddrop_n    00105F R
  5 ddup       00102B R   |   5 dec_base   0013CF R   |   5 del_back   000B3A R
  5 del_line   000331 R   |   5 del_ln     000B2B R   |   5 delete     0001F7 R
  5 digital_   001AC0 R   |   5 digital_   001AF2 R   |   5 dir_loop   001DC6 R
  5 director   001DBA R   |   5 divide     001132 R   |   5 divu24_8   000A98 R
  5 dotr       0010AF R   |   5 dotr_loo   0010C4 R   |   5 dots       00107C R
  5 dpick      00103C R   |   5 dpop       000FFB R   |   5 dpush      000FEE R
  5 drive_fr   001E43 R   |   3 dstack     001740 R   |   3 dstack_e   001780 R
  5 dstk_pro   001072 R   |   1 dstkptr    000018 R   |   5 dswap      001008 R
  5 enable_i   0021D2 R   |   5 eql_tst    000E76 R   |   5 equal      00165F R
  5 err_bad_   000744 R   |   5 err_cmd_   000705 R   |   5 err_div0   0006C7 R
  5 err_dupl   000720 R   |   5 err_math   0006AD R   |   5 err_mem_   000690 R
  5 err_msg    000678 R   |   5 err_no_a   000751 R   |   5 err_no_l   0006D7 R
  5 err_not_   000732 R   |   5 err_run_   0006EE R   |   5 err_synt   00069E R
  5 escaped    000CB7 R   |   5 expect     00120E R   |   5 expr_exi   001360 R
  5 expressi   00131F R   |   5 factor     001276 R   |   1 farptr     000012 R
  5 fcpu       002080 R   |   7 fdrive     010000 R   |   5 fetch      00104B R
  5 fetchc     000C5A R   |   1 ffree      000015 R   |   5 file_cou   001E3B R
  5 final_te   000B05 R   |   5 first_li   001453 R   |   5 first_on   00220F R
  1 flags      000021 R   |   5 for        001864 R   |   5 forget     001D6F R
  1 free_ram   000057 R   |   5 func_arg   00123F R   |   5 func_not   0021C3 R
  5 ge         001661 R   |   5 get_arra   00124F R   |   5 get_tick   001FD0 R
  5 get_toke   000D5C R   |   5 getc       0001D4 R   |   5 go_commo   001985 R
  5 gosub      001962 R   |   5 goto       001955 R   |   5 gpio       001EC8 R
  5 gt         00165D R   |   5 gt_tst     000E81 R   |   5 hex_base   0013CA R
  5 if         001850 R   |   1 in         000001 R   |   1 in.saved   000002 R
  1 in.w       000000 R   |   5 incr_far   001B88 R   |   5 input_ex   00176E R
  5 input_lo   001709 R   |   5 input_va   0016FD R   |   5 insert_l   0003A2 R
  5 insert_l   000407 R   |   5 interp     0007EC R   |   5 interp_l   00082C R
  5 invalid    000BB2 R   |   5 invalid_   000C30 R   |   5 is_alpha   000522 R
  5 is_digit   000F14 R   |   5 itoa       000A51 R   |   5 itoa_loo   000A69 R
  5 key        001EB6 R   |   5 kword_di   00250E R   |   5 kword_en   00223B R
  5 last_lin   00145C R   |   5 le         001666 R   |   5 ledoff     0008A5 R
  5 ledon      0008A0 R   |   5 ledtoggl   0008AA R   |   5 left_arr   000B0B R
  5 left_par   0008B3 R   |   5 let        001400 R   |   5 let02      00140A R
  5 lines_sk   001461 R   |   5 list       001428 R   |   5 list_exi   0014A8 R
  5 list_sta   001484 R   |   5 load       001D34 R   |   5 load_aut   00062E R
  5 load_fil   001D03 R   |   5 log2       002202 R   |   5 logical_   0021B9 R
  5 loop_bac   00192E R   |   1 loop_dep   00001E R   |   5 loop_don   001943 R
  5 lshift     002046 R   |   5 lt         001664 R   |   5 lt_tst     000EBA R
  5 mem_peek   000BCF R   |   5 modulo     001176 R   |   5 move       0002CB R
  5 move_dow   0002E9 R   |   5 move_exi   00030A R   |   5 move_loo   0002EE R
  5 move_up    0002DB R   |   5 mul_char   00164E R   |   5 multiply   0010EA R
  5 mulu24_8   000F9B R   |   5 nbr_tst    000D97 R   |   5 ne         001669 R
  5 neg_acc2   000AC0 R   |   5 new        001B7D R   |   5 next       0018E6 R
  5 next_tok   00085C R   |   5 no_match   0011DC R   |   5 none       000D5C R
  5 number     000C60 GR  |   5 other      000EF2 R   |   3 pad        001718 R
  5 parse_bi   000CFA R   |   5 parse_in   000CBF R   |   5 parse_ke   000D22 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 133.
Hexadecimal [24-Bits]

Symbol Table

  5 parse_qu   000C67 R   |   5 pause      001F74 R   |   5 pause02    001F7E R
  5 peek       00181D R   |   5 peek_byt   000BFA R   |   5 pin_mode   00208C R
  5 plus_tst   000E4A R   |   5 poke       00180A R   |   5 power_ad   001A41 R
  5 prcnt_ts   000E6B R   |   5 print      00166C R   |   5 print_ex   0016D1 R
  5 print_fa   000C3F R   |   5 print_in   0009F5 R   |   5 print_re   000902 R
  5 print_st   000BC2 R   |   5 prt_basi   0014FB R   |   5 prt_cmd_   0014AB R
  5 prt_loop   001670 R   |   5 prt_peek   00027B R   |   5 prt_quot   0014BF R
  5 prt_reg1   0008E3 R   |   5 prt_reg8   0008BE R   |   5 prt_regs   000211 R
  5 prti24     0009AD R   |   1 ptr16      000013 R   |   1 ptr8       000014 R
  5 putc       0001CB R   |   5 puts       0001DD R   |   5 pwr2       00221F R
  5 qkey       001EBE R   |   5 qmark_ts   000E21 R   |   5 random     002101 R
  5 readln     000AE3 R   |   5 readln_l   000AE9 R   |   5 readln_q   000B5E R
  5 refresh_   0021FD R   |   5 regs_sta   000254 R   |   5 rel_exit   0013B7 R
  5 relation   001363 R   |   5 relop_st   001651 R   |   5 rem        001771 R
  5 repl       000B7B R   |   5 repl_exi   000BA3 R   |   5 reprint    000B0B R
  5 reset_co   00166E R   |   5 rest_con   0016ED R   |   5 return     0019A7 R
  5 right_ar   000B0B R   |   5 rparnt_t   000DDF R   |   5 rshift     002063 R
  5 rt_msg     000785 R   |   5 run        0019C7 R   |   5 run_it     0019EF R
  5 save       001C3F R   |   5 save_con   0016DD R   |   5 search_d   0011B9 R
  5 search_e   00120A R   |   5 search_f   001BF4 R   |   5 search_l   00030D R
  5 search_l   000315 R   |   5 search_n   0011BD R   |   1 seedx      00000E R
  1 seedy      000010 R   |   5 seek_fdr   001B96 R   |   5 select_p   0020D1 R
  5 set_time   0021A5 R   |   5 sharp_ts   000E00 R   |   5 show       0013BA R
  5 single_c   00164A R   |   5 size       0013D4 R   |   5 skip       000FD5 R
  5 slash_ts   000E60 R   |   5 sleep      001F69 R   |   5 software   000533 R
  5 spaces     000205 R   |   3 stack_fu   001780 R   |   3 stack_un   001800 R
  5 star_tst   000E55 R   |   5 step       0018BE R   |   5 stop       001A0A R
  5 store      001055 R   |   5 store_lo   0018D0 R   |   5 str_matc   0011EB R
  5 str_tst    000D86 R   |   5 strcmp     0002AC R   |   5 strcpy     0002BD R
  5 strlen     00029F R   |   5 substrac   0010E4 R   |   5 syntax_e   000795 R
  1 tab_widt   000022 R   |   5 tb_error   000797 R   |   5 term       0012D2 R
  5 term01     0012DB R   |   5 term_exi   00131C R   |   5 test_p     000BBA R
  3 tib        0016C8 R   |   5 tick_tst   000E38 R   |   1 ticks      00000A R
  5 timeout    0021B6 R   |   1 timer      00000C R   |   5 timer4_i   0000C7 R
  5 to         00188E R   |   5 to_upper   000F1D GR  |   5 token_ch   000F01 R
  5 token_ex   000F11 R   |   1 txtbgn     00001A R   |   1 txtend     00001C R
  5 uart1_in   000190 R   |   5 uart1_se   0001A0 R   |   5 ubound     0013DE R
  5 uflash     001EFB R   |   5 unget_to   000FE8 R   |   5 unlock_e   0000DC R
  5 unlock_f   0000EA R   |   5 user_spa   002580 R   |   5 usr        001F01 R
  1 vars       000023 R   |   5 wait       001777 R   |   5 warm_ini   000611 R
  5 warm_sta   0007E9 R   |   5 words      00216B R   |   5 write      001E50 R
  5 write_bl   00016D R   |   5 write_by   0000F8 R   |   5 write_ee   000134 R
  5 write_ex   000168 R   |   5 write_fl   00011E R   |   5 xpeek      001830 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 134.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     57   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   258E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      4   flags    8

