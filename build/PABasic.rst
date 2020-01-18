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
                           000000    47 	FRUN=0 ; flags run code in variable flags
                           000001    48 	FTRAP=1 ; inside trap handler 
                           000002    49 	FFOR=2 ; FOR loop in preparation 
                           000003    50 	FSLEEP=3 ; halt produit par la commande SLEEP 
                           000004    51 	FBREAK=4 ; break point flag 
                           000005    52 	FCOMP=5  ; compiling flags 
                                     53 
      000002                         54 in.w:  .blkb 1 ; parser position in text line
      000003                         55 in:    .blkb 1 ; low byte of in.w
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



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
      008000 82 00 85 E5             98     int cold_start
                           000001    99 .if DEBUG
      008004 82 00 80 8A            100 	int TrapHandler 		;TRAP  software interrupt
                           000000   101 .else
                                    102 	int NonHandledInterrupt ;TRAP  software interrupt
                                    103 .endif
      008008 82 00 80 89            104 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 89            105 	int NonHandledInterrupt ;int1 AWU   auto wake up from halt
      008010 82 00 80 89            106 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 89            107 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 89            108 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 89            109 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 89            110 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



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
      00808E CD 89 34         [ 4]  152 	call print_registers
      008091 CD 8B A3         [ 4]  153 	call cmd_itf
      008094 72 13 00 25      [ 1]  154 	bres flags,#FTRAP 	
      008098 80               [11]  155 	iret
                                    156 .endif 
                                    157 
      008099                        158 Timer4UpdateHandler:
      008099 72 5F 53 42      [ 1]  159 	clr TIM4_SR 
      00809D CE 00 0C         [ 2]  160 	ldw x,ticks
      0080A0 5C               [ 1]  161 	incw x
      0080A1 CF 00 0C         [ 2]  162 	ldw ticks,x 
      0080A4 80               [11]  163 	iret 
                                    164 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



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
      0080D6 CD 8A 27         [ 4]  191 	call print_int  	
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
      0080FB CC 87 F4         [ 2]  208 	jp warm_start
                                    209 
      0080FE 0A 50 72 6F 67 72 61   210 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    211 
                                    212 
                                    213 ;----------------------------------------
                                    214 ; inialize MCU clock 
                                    215 ; input:
                                    216 ;   A 		source  HSI | 1 HSE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



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
      00812F 35 07 53 45      [ 1]  240 	mov TIM4_PSCR,#7 ; prescale 128  
      008133 35 7D 53 46      [ 1]  241 	mov TIM4_ARR,#125 ; set for 1msec.
      008137 35 05 53 40      [ 1]  242 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00813B 72 10 53 41      [ 1]  243 	bset TIM4_IER,#TIM4_IER_UIE 
      00813F 81               [ 4]  244 	ret
                                    245 
                                    246 ;----------------------------------
                                    247 ; unlock EEPROM for writing/erasing
                                    248 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    249 ; input:
                                    250 ;  none
                                    251 ; output:
                                    252 ;  none 
                                    253 ;----------------------------------
      008140                        254 unlock_eeprom:
      008140 35 AE 50 64      [ 1]  255 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008144 35 56 50 64      [ 1]  256     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008148 72 07 50 5F FB   [ 2]  257 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00814D 81               [ 4]  258 	ret
                                    259 
                                    260 ;----------------------------------
                                    261 ; unlock FLASH for writing/erasing
                                    262 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    263 ; input:
                                    264 ;  none
                                    265 ; output:
                                    266 ;  none
                                    267 ;----------------------------------
      00814E                        268 unlock_flash:
      00814E 35 56 50 62      [ 1]  269 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008152 35 AE 50 62      [ 1]  270 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008156 72 03 50 5F FB   [ 2]  271 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      00815B 81               [ 4]  272 	ret
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
                                    318 	popw x 
                                    319 	ldw farptr+1,x 
                                    320 	tnz farptr
                                    321 	jrne erase_flash 
                                    322 	ldw x,#FLASH_BASE 
                                    323 	cpw x,farptr+1 
                                    324 	jrpl erase_flash 
                                    325 ; erase eeprom block
                                    326 	call unlock_eeprom 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



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
      00815C                        359 write_byte:
      00815C 90 89            [ 2]  360 	pushw y
      0000DE                        361 	_vars VSIZE
      00815E 52 02            [ 2]    1     sub sp,#VSIZE 
      008160 6B 01            [ 1]  362 	ld (BTW,sp),a ; byte to write 
      008162 0F 02            [ 1]  363 	clr (OPT,sp)  ; OPTION flag
                                    364 ; put addr[15:0] in Y, for bounds check.
      008164 90 CE 00 15      [ 2]  365 	ldw y,farptr+1   ; Y=addr15:0
                                    366 ; check addr[23:16], if <> 0 then it is extened flash memory
      008168 72 5D 00 14      [ 1]  367 	tnz farptr 
      00816C 26 14            [ 1]  368 	jrne write_flash
      00816E 90 A3 A2 00      [ 2]  369     cpw y,#user_space
      008172 24 0E            [ 1]  370     jruge write_flash
      008174 90 A3 40 00      [ 2]  371 	cpw y,#EEPROM_BASE  
      008178 25 52            [ 1]  372     jrult write_exit
      00817A 90 A3 48 00      [ 2]  373 	cpw y,#OPTION_BASE
      00817E 25 18            [ 1]  374 	jrult write_eeprom
      008180 20 4A            [ 2]  375     jra write_exit
                                    376 ; write program memory
      008182                        377 write_flash:
      008182 CD 81 4E         [ 4]  378 	call unlock_flash 
      008185 9B               [ 1]  379 1$:	sim 
      008186 7B 01            [ 1]  380 	ld a,(BTW,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008188 92 A7 00 14      [ 4]  381 	ldf ([farptr],x),a ; farptr[x]=A
      00818C 72 05 50 5F FB   [ 2]  382 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008191 9A               [ 1]  383     rim 
      008192 72 13 50 5F      [ 1]  384     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008196 20 34            [ 2]  385     jra write_exit
                                    386 ; write eeprom and option
      008198                        387 write_eeprom:
      008198 CD 81 40         [ 4]  388 	call unlock_eeprom
                                    389 	; check for data eeprom or option eeprom
      00819B 90 A3 48 00      [ 2]  390 	cpw y,#OPTION_BASE
      00819F 2B 08            [ 1]  391 	jrmi 1$
      0081A1 90 A3 48 80      [ 2]  392 	cpw y,#OPTION_END+1
      0081A5 2A 02            [ 1]  393 	jrpl 1$
      0081A7 03 02            [ 1]  394 	cpl (OPT,sp)
      0081A9                        395 1$: 
      0081A9 0D 02            [ 1]  396     tnz (OPT,sp)
      0081AB 27 08            [ 1]  397     jreq 2$
                                    398 	; pour modifier une option il faut modifier ces 2 bits
      0081AD 72 1E 50 5B      [ 1]  399     bset FLASH_CR2,#FLASH_CR2_OPT
      0081B1 72 1F 50 5C      [ 1]  400     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081B5                        401 2$: 
      0081B5 7B 01            [ 1]  402     ld a,(BTW,sp)
      0081B7 92 A7 00 14      [ 4]  403     ldf ([farptr],x),a
      0081BB 0D 02            [ 1]  404     tnz (OPT,sp)
      0081BD 27 08            [ 1]  405     jreq 3$
      0081BF 5C               [ 1]  406     incw x
      0081C0 7B 01            [ 1]  407     ld a,(BTW,sp)
      0081C2 43               [ 1]  408     cpl a
      0081C3 92 A7 00 14      [ 4]  409     ldf ([farptr],x),a
      0081C7 72 05 50 5F FB   [ 2]  410 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081CC                        411 write_exit:
      00014C                        412 	_drop VSIZE 
      0081CC 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081CE 90 85            [ 2]  413 	popw y
      0081D0 81               [ 4]  414     ret
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
                                    426 ;  farptr   point after block
                                    427 ;---------------------------------------------
      0081D1                        428 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000151                        429 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    430 	; local var 
                           000001   431 	XSAVE=1 
                           000002   432 	VSIZE=2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      000151                        433 write_block:
      000151                        434 	_vars VSIZE
      0081D1 52 02            [ 2]    1     sub sp,#VSIZE 
      0081D3 1F 01            [ 2]  435 	ldw (XSAVE,sp),x 
      0081D5 1E 05            [ 2]  436 	ldw x,(BSIZE,sp) 
      0081D7 27 13            [ 1]  437 	jreq 9$
      0081D9 1E 01            [ 2]  438 1$:	ldw x,(XSAVE,sp)
      0081DB 90 F6            [ 1]  439 	ld a,(y)
      0081DD CD 81 5C         [ 4]  440 	call write_byte 
      0081E0 5C               [ 1]  441 	incw x 
      0081E1 90 5C            [ 1]  442 	incw y 
      0081E3 1F 01            [ 2]  443 	ldw (XSAVE,sp),x
      0081E5 1E 05            [ 2]  444 	ldw x,(BSIZE,sp)
      0081E7 5A               [ 2]  445 	decw x
      0081E8 1F 05            [ 2]  446 	ldw (BSIZE,sp),x 
      0081EA 26 ED            [ 1]  447 	jrne 1$
      0081EC                        448 9$:
      0081EC 1E 01            [ 2]  449 	ldw x,(XSAVE,sp)
      0081EE CD 9A EC         [ 4]  450 	call incr_farptr
      000171                        451 	_drop VSIZE
      0081F1 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081F3 81               [ 4]  452 	ret 
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
      0081F4                        466 uart3_init:
                                    467 	; configure tx pin
      0081F4 72 1A 50 11      [ 1]  468 	bset PD_DDR,#BIT5 ; tx pin
      0081F8 72 1A 50 12      [ 1]  469 	bset PD_CR1,#BIT5 ; push-pull output
      0081FC 72 1A 50 13      [ 1]  470 	bset PD_CR2,#BIT5 ; fast output
      008200                        471 uart3_set_baud: 
                                    472 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    473 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008200 A6 E1            [ 1]  474 	ld a,#CLK_SWR_HSI
      008202 C1 50 C3         [ 1]  475 	cp a,CLK_CMSR 
      008205 27 0A            [ 1]  476 	jreq hsi_clock 
      008207                        477 hse_clock: ; 8 Mhz 	
      008207 35 05 52 43      [ 1]  478 	mov UART3_BRR2,#0x05 ; must be loaded first
      00820B 35 04 52 42      [ 1]  479 	mov UART3_BRR1,#0x4
      00820F 20 08            [ 2]  480 	jra uart_enable
      008211                        481 hsi_clock: ; 16 Mhz 	
      008211 35 0B 52 43      [ 1]  482 	mov UART3_BRR2,#0x0b ; must be loaded first
      008215 35 08 52 42      [ 1]  483 	mov UART3_BRR1,#0x08
      008219                        484 uart_enable:	
      008219 35 0C 52 45      [ 1]  485 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      00821D 81               [ 4]  486 	ret
                                    487 	
                                    488 ;---------------------------------
                                    489 ; send character to UART3 
                                    490 ; input:
                                    491 ;   A 
                                    492 ; output:
                                    493 ;   none 
                                    494 ;--------------------------------	
      00821E                        495 putc:
      00821E 72 0F 52 40 FB   [ 2]  496 	btjf UART3_SR,#UART_SR_TXE,.
      008223 C7 52 41         [ 1]  497 	ld UART3_DR,a 
      008226 81               [ 4]  498 	ret 
                                    499 
                                    500 ;---------------------------------
                                    501 ; wait character from UART3 
                                    502 ; input:
                                    503 ;   none
                                    504 ; output:
                                    505 ;   A 			char  
                                    506 ;--------------------------------	
      008227                        507 getc:
      008227 72 0B 52 40 FB   [ 2]  508 	btjf UART3_SR,#UART_SR_RXNE,.
      00822C C6 52 41         [ 1]  509 	ld a,UART3_DR 
      00822F 81               [ 4]  510 	ret 
                                    511 
                                    512 ;-----------------------------
                                    513 ; send an ASCIZ string to UART3 
                                    514 ; input: 
                                    515 ;   x 		char * 
                                    516 ; output:
                                    517 ;   none 
                                    518 ;-------------------------------
      008230                        519 puts:
      008230 F6               [ 1]  520     ld a,(x)
      008231 27 06            [ 1]  521 	jreq 1$
      008233 CD 82 1E         [ 4]  522 	call putc 
      008236 5C               [ 1]  523 	incw x 
      008237 20 F7            [ 2]  524 	jra puts 
      008239 81               [ 4]  525 1$:	ret 
                                    526 
                                    527 
                                    528 ;---------------------------
                                    529 ; delete character at left 
                                    530 ; of cursor on terminal 
                                    531 ; input:
                                    532 ;   none 
                                    533 ; output:
                                    534 ;	none 
                                    535 ;---------------------------
      00823A                        536 bksp:
      00823A A6 08            [ 1]  537 	ld a,#BSP 
      00823C CD 82 1E         [ 4]  538 	call putc 
      00823F A6 20            [ 1]  539 	ld a,#SPACE 
      008241 CD 82 1E         [ 4]  540 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008244 A6 08            [ 1]  541 	ld a,#BSP 
      008246 CD 82 1E         [ 4]  542 	call putc 
      008249 81               [ 4]  543 	ret 
                                    544 ;---------------------------
                                    545 ; delete n character left of cursor 
                                    546 ; at terminal.
                                    547 ; input: 
                                    548 ;   A   	number of characters to delete.
                                    549 ; output:
                                    550 ;    none 
                                    551 ;--------------------------	
      00824A                        552 delete:
      00824A 88               [ 1]  553 	push a 
      00824B 0D 01            [ 1]  554 0$:	tnz (1,sp)
      00824D 27 07            [ 1]  555 	jreq 1$
      00824F CD 82 3A         [ 4]  556 	call bksp 
      008252 0A 01            [ 1]  557 	dec (1,sp)
      008254 20 F5            [ 2]  558 	jra 0$
      008256 84               [ 1]  559 1$:	pop a 
      008257 81               [ 4]  560 	ret
                                    561 
                                    562 ;--------------------------
                                    563 ; print n spaces on terminal
                                    564 ; input:
                                    565 ;  X 		number of spaces 
                                    566 ; output:
                                    567 ;	none 
                                    568 ;---------------------------
      008258                        569 spaces:
      008258 A6 20            [ 1]  570 	ld a,#SPACE 
      00825A 5D               [ 2]  571 1$:	tnzw x
      00825B 27 06            [ 1]  572 	jreq 9$
      00825D CD 82 1E         [ 4]  573 	call putc 
      008260 5A               [ 2]  574 	decw x
      008261 20 F7            [ 2]  575 	jra 1$
      008263                        576 9$: 
      008263 81               [ 4]  577 	ret 
                                    578 
                           000001   579 .if DEBUG 
                                    580 ;---------------------------------
                                    581 ;; print actual registers states 
                                    582 ;; as pushed on stack 
                                    583 ;; {Y,X,CC,A}
                                    584 ;---------------------------------
      008264                        585 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0001E4                        586 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0001E4                        587 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0001E4                        588 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0001E4                        589 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0001E4                        590 prt_regs:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008264 AE 82 A7         [ 2]  591 	ldw x,#regs_state 
      008267 CD 82 30         [ 4]  592 	call puts
                                    593 ; register PC
      00826A 16 01            [ 2]  594 	ldw y,(1,sp)
      00826C AE 89 C4         [ 2]  595 	ldw x,#REG_EPC 
      00826F CD 89 15         [ 4]  596 	call prt_reg16 
                                    597 ; register CC 
      008272 7B 08            [ 1]  598 	ld a,(R_CC,sp)
      008274 AE 89 D5         [ 2]  599 	ldw x,#REG_CC 
      008277 CD 88 F0         [ 4]  600 	call prt_reg8 
                                    601 ; register A 
      00827A 7B 07            [ 1]  602 	ld a,(R_A,sp)
      00827C AE 89 D1         [ 2]  603 	ldw x,#REG_A 
      00827F CD 88 F0         [ 4]  604 	call prt_reg8 
                                    605 ; register X 
      008282 16 05            [ 2]  606 	ldw y,(R_X,sp)
      008284 AE 89 CD         [ 2]  607 	ldw x,#REG_X 
      008287 CD 89 15         [ 4]  608 	call prt_reg16 
                                    609 ; register Y 
      00828A 16 03            [ 2]  610 	ldw y,(R_Y,sp)
      00828C AE 89 C9         [ 2]  611 	ldw x,#REG_Y 
      00828F CD 89 15         [ 4]  612 	call prt_reg16 
                                    613 ; register SP 
      008292 90 96            [ 1]  614 	ldw y,sp
      008294 72 A9 00 08      [ 2]  615 	addw y,#6+ARG_OFS  
      008298 AE 89 DA         [ 2]  616 	ldw x,#REG_SP
      00829B CD 89 15         [ 4]  617 	call prt_reg16
      00829E A6 0D            [ 1]  618 	ld a,#CR 
      0082A0 CD 82 1E         [ 4]  619 	call putc
      0082A3 CD 82 1E         [ 4]  620 	call putc   
      0082A6 81               [ 4]  621 	ret 
                                    622 
      0082A7 0A 72 65 67 69 73 74   623 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
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
                                    632 ;--------------------	
      0082CE                        633 prt_peek:
      0082CE 89               [ 2]  634 	pushw x 
      0082CF CF 00 0A         [ 2]  635 	ldw acc16,x 
      0082D2 72 5F 00 09      [ 1]  636 	clr acc24 
      0082D6 5F               [ 1]  637 	clrw x 
      0082D7 A6 10            [ 1]  638 	ld a,#16 
      0082D9 CD 89 DF         [ 4]  639 	call prti24 
      0082DC A6 3A            [ 1]  640 	ld a,#': 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082DE CD 82 1E         [ 4]  641 	call putc 
      0082E1 A6 20            [ 1]  642 	ld a,#SPACE 
      0082E3 CD 82 1E         [ 4]  643 	call putc 
      0082E6 85               [ 2]  644 	popw x 
      0082E7 F6               [ 1]  645 	ld a,(x)
      0082E8 C7 00 0B         [ 1]  646 	ld acc8,a 
      0082EB 5F               [ 1]  647 	clrw x 
      0082EC A6 10            [ 1]  648 	ld a,#16 
      0082EE CD 89 DF         [ 4]  649 	call prti24
      0082F1 81               [ 4]  650 	ret 
                                    651 .endif ; DEBUG  
                                    652 
                                    653 ;-------------------------------------
                                    654 ; retrun string length
                                    655 ; input:
                                    656 ;   X         .asciz  
                                    657 ; output:
                                    658 ;   X         length 
                                    659 ;-------------------------------------
      0082F2                        660 strlen:
      0082F2 90 93            [ 1]  661 	ldw y,x 
      0082F4 5F               [ 1]  662 	clrw x 
      0082F5 90 7D            [ 1]  663 1$:	tnz (y) 
      0082F7 27 05            [ 1]  664 	jreq 9$ 
      0082F9 5C               [ 1]  665 	incw x
      0082FA 90 5C            [ 1]  666 	incw y 
      0082FC 20 F7            [ 2]  667 	jra 1$ 
      0082FE 81               [ 4]  668 9$: ret 
                                    669 
                                    670 ;------------------------------------
                                    671 ; compare 2 strings
                                    672 ; input:
                                    673 ;   X 		char* first string 
                                    674 ;   Y       char* second string 
                                    675 ; output:
                                    676 ;   A 		0|1 
                                    677 ;-------------------------------------
      0082FF                        678 strcmp:
      0082FF F6               [ 1]  679 	ld a,(x)
      008300 27 0B            [ 1]  680 	jreq 5$ 
      008302 90 F1            [ 1]  681 	cp a,(y) 
      008304 26 05            [ 1]  682 	jrne 4$ 
      008306 5C               [ 1]  683 	incw x 
      008307 90 5C            [ 1]  684 	incw y 
      008309 20 F4            [ 2]  685 	jra strcmp 
      00830B                        686 4$: ; not same  
      00830B 4F               [ 1]  687 	clr a 
      00830C 81               [ 4]  688 	ret 
      00830D                        689 5$: ; same 
      00830D A6 01            [ 1]  690 	ld a,#1 
      00830F 81               [ 4]  691 	ret 
                                    692 
                                    693 
                                    694 ;---------------------------------------
                                    695 ;  copy src to dest 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    696 ; input:
                                    697 ;   X 		dest 
                                    698 ;   Y 		src 
                                    699 ; output: 
                                    700 ;   X 		dest 
                                    701 ;----------------------------------
      008310                        702 strcpy:
      008310 89               [ 2]  703 	pushw x 
      008311 90 F6            [ 1]  704 1$: ld a,(y)
      008313 27 06            [ 1]  705 	jreq 9$ 
      008315 F7               [ 1]  706 	ld (x),a 
      008316 5C               [ 1]  707 	incw x 
      008317 90 5C            [ 1]  708 	incw y 
      008319 20 F6            [ 2]  709 	jra 1$ 
      00831B 7F               [ 1]  710 9$:	clr (x)
      00831C 85               [ 2]  711 	popw x 
      00831D 81               [ 4]  712 	ret 
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
      00831E                        726 move:
      00029E                        727 	_vars VSIZE 
      00831E 52 02            [ 2]    1     sub sp,#VSIZE 
      008320 0F 01            [ 1]  728 	clr (INCR,sp)
      008322 0F 02            [ 1]  729 	clr (LB,sp)
      008324 90 89            [ 2]  730 	pushw y 
      008326 13 01            [ 2]  731 	cpw x,(1,sp) ; compare DEST to SRC 
      008328 90 85            [ 2]  732 	popw y 
      00832A 27 31            [ 1]  733 	jreq move_exit ; x==y 
      00832C 2B 0E            [ 1]  734 	jrmi move_down
      00832E                        735 move_up: ; start from top address with incr=-1
      00832E 72 BB 00 0A      [ 2]  736 	addw x,acc16
      008332 72 B9 00 0A      [ 2]  737 	addw y,acc16
      008336 03 01            [ 1]  738 	cpl (INCR,sp)
      008338 03 02            [ 1]  739 	cpl (LB,sp)   ; increment = -1 
      00833A 20 05            [ 2]  740 	jra move_loop  
      00833C                        741 move_down: ; start from bottom address with incr=1 
      00833C 5A               [ 2]  742     decw x 
      00833D 90 5A            [ 2]  743 	decw y
      00833F 0C 02            [ 1]  744 	inc (LB,sp) ; incr=1 
      008341                        745 move_loop:	
      008341 C6 00 0A         [ 1]  746     ld a, acc16 
      008344 CA 00 0B         [ 1]  747 	or a, acc8
      008347 27 14            [ 1]  748 	jreq move_exit 
      008349 72 FB 01         [ 2]  749 	addw x,(INCR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      00834C 72 F9 01         [ 2]  750 	addw y,(INCR,sp) 
      00834F 90 F6            [ 1]  751 	ld a,(y)
      008351 F7               [ 1]  752 	ld (x),a 
      008352 89               [ 2]  753 	pushw x 
      008353 CE 00 0A         [ 2]  754 	ldw x,acc16 
      008356 5A               [ 2]  755 	decw x 
      008357 CF 00 0A         [ 2]  756 	ldw acc16,x 
      00835A 85               [ 2]  757 	popw x 
      00835B 20 E4            [ 2]  758 	jra move_loop
      00835D                        759 move_exit:
      0002DD                        760 	_drop VSIZE
      00835D 5B 02            [ 2]    1     addw sp,#VSIZE 
      00835F 81               [ 4]  761 	ret 	
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
      008360                        775 search_lineno:
      0002E0                        776 	_vars VSIZE
      008360 52 02            [ 2]    1     sub sp,#VSIZE 
      008362 CF 00 0A         [ 2]  777 	ldw acc16,x 
      008365 0F 01            [ 1]  778 	clr (LL,sp)
      008367 90 CE 00 1C      [ 2]  779 	ldw y,txtbgn
      00836B                        780 search_ln_loop:
      00836B 90 C3 00 1E      [ 2]  781 	cpw y,txtend 
      00836F 2A 13            [ 1]  782 	jrpl 8$
      008371 93               [ 1]  783 	ldw x,y 
      008372 FE               [ 2]  784 	ldw x,(x) ; x=line number 
      008373 C3 00 0A         [ 2]  785 	cpw x,acc16 
      008376 27 0F            [ 1]  786 	jreq 9$ 
      008378 2A 0A            [ 1]  787 	jrpl 8$ ; from here all lines are > lineno 
      00837A 90 E6 02         [ 1]  788 	ld a,(2,y)
      00837D 6B 02            [ 1]  789 	ld (LB,sp),a 
      00837F 72 F9 01         [ 2]  790 	addw y,(LL,sp)
      008382 20 E7            [ 2]  791 	jra search_ln_loop 
      008384 51               [ 1]  792 8$: exgw x,y 
      008385 90 5F            [ 1]  793 	clrw y 	
      000307                        794 9$: _drop VSIZE
      008387 5B 02            [ 2]    1     addw sp,#VSIZE 
      008389 51               [ 1]  795 	exgw x,y   
      00838A 81               [ 4]  796 	ret 
                                    797 
                                    798 ;-------------------------------------
                                    799 ; delete line at addr
                                    800 ; input:
                                    801 ;   X 		addr of line i.e DEST for move 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    802 ;-------------------------------------
                           000001   803 	LLEN=1
                           000003   804 	SRC=3
                           000004   805 	VSIZE=4
      00838B                        806 del_line: 
      00030B                        807 	_vars VSIZE 
      00838B 52 04            [ 2]    1     sub sp,#VSIZE 
      00838D E6 02            [ 1]  808 	ld a,(2,x) ; line length
      00838F 6B 02            [ 1]  809 	ld (LLEN+1,sp),a 
      008391 0F 01            [ 1]  810 	clr (LLEN,sp)
      008393 90 93            [ 1]  811 	ldw y,x  
      008395 72 F9 01         [ 2]  812 	addw y,(LLEN,sp) ;SRC  
      008398 17 03            [ 2]  813 	ldw (SRC,sp),y  ;save source 
      00839A 90 CE 00 15      [ 2]  814 	ldw y,ptr16
      00839E 90 E6 02         [ 1]  815 	ld a,(2,y)
      0083A1 90 5F            [ 1]  816 	clrw y 
      0083A3 90 97            [ 1]  817 	ld yl,a  
      0083A5 72 B9 00 1E      [ 2]  818 	addw y,txtend
      0083A9 72 F2 03         [ 2]  819 	subw y,(SRC,sp) ; y=count 
      0083AC 90 CF 00 0A      [ 2]  820 	ldw acc16,y 
      0083B0 16 03            [ 2]  821 	ldw y,(SRC,sp)    ; source
      0083B2 CD 83 1E         [ 4]  822 	call move
      0083B5 90 CE 00 1E      [ 2]  823 	ldw y,txtend 
      0083B9 72 F2 01         [ 2]  824 	subw y,(LLEN,sp)
      0083BC 90 CF 00 1E      [ 2]  825 	ldw txtend,y  
      000340                        826 	_drop VSIZE     
      0083C0 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083C2 81               [ 4]  827 	ret 
                                    828 
                                    829 ;---------------------------------------------
                                    830 ; create a gap in text area 
                                    831 ; input:
                                    832 ;    X 			addr gap start 
                                    833 ;    Y 			gap length 
                                    834 ; output:
                                    835 ;    X 			addr gap start 
                                    836 ;--------------------------------------------
                           000001   837 	DEST=1
                           000003   838 	SRC=3
                           000005   839 	LEN=5
                           000006   840 	VSIZE=6 
      0083C3                        841 create_gap:
      000343                        842 	_vars VSIZE
      0083C3 52 06            [ 2]    1     sub sp,#VSIZE 
      0083C5 C3 00 1E         [ 2]  843 	cpw x,txtend 
      0083C8 2A 27            [ 1]  844 	jrpl 9$ ; no need for a gap since at end of text.
      0083CA 1F 03            [ 2]  845 	ldw (SRC,sp),x 
      0083CC 17 05            [ 2]  846 	ldw (LEN,sp),y 
      0083CE 90 CF 00 0A      [ 2]  847 	ldw acc16,y 
      0083D2 90 93            [ 1]  848 	ldw y,x ; SRC
      0083D4 72 BB 00 0A      [ 2]  849 	addw x,acc16  
      0083D8 1F 01            [ 2]  850 	ldw (DEST,sp),x 
                                    851 ;compute size to move 	
      0083DA CE 00 1E         [ 2]  852 	ldw x,txtend 
      0083DD 72 F0 03         [ 2]  853 	subw x,(SRC,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0083E0 CF 00 0A         [ 2]  854 	ldw acc16,x
      0083E3 1E 01            [ 2]  855 	ldw x,(DEST,sp) 
      0083E5 CD 83 1E         [ 4]  856 	call move
      0083E8 CE 00 1E         [ 2]  857 	ldw x,txtend
      0083EB 72 FB 05         [ 2]  858 	addw x,(LEN,sp)
      0083EE CF 00 1E         [ 2]  859 	ldw txtend,x
      000371                        860 9$:	_drop VSIZE 
      0083F1 5B 06            [ 2]    1     addw sp,#VSIZE 
      0083F3 81               [ 4]  861 	ret 
                                    862 
                                    863 
                                    864 ;--------------------------------------------
                                    865 ; insert line in tib into text area 
                                    866 ; first search for already existing 
                                    867 ; replace existing 
                                    868 ; if strlen(tib)==0 delete existing 
                                    869 ; input:
                                    870 ;   ptr16 				pointer to tokenized line  
                                    871 ; output:
                                    872 ;   none
                                    873 ;---------------------------------------------
                           000001   874 	DEST=1  ; text area insertion address 
                           000003   875 	SRC=3   ; str to insert address 
                           000005   876 	LINENO=5 ; line number 
                           000007   877 	LLEN=7 ; line length 
                           000008   878 	VSIZE=8  
      0083F4                        879 insert_line:
      000374                        880 	_vars VSIZE 
      0083F4 52 08            [ 2]    1     sub sp,#VSIZE 
      0083F6 CE 00 15         [ 2]  881 	ldw x,ptr16  
      0083F9 C3 00 1C         [ 2]  882 	cpw x,txtbgn 
      0083FC 26 0D            [ 1]  883 	jrne 0$
      0083FE AE 00 02         [ 2]  884 	ldw x,#2 
      008401 72 D6 00 15      [ 4]  885 	ld a,([ptr16],x)
      008405 5F               [ 1]  886 	clrw x 
      008406 97               [ 1]  887 	ld xl,a
      008407 1F 07            [ 2]  888 	ldw (LLEN,sp),x  
      008409 20 3E            [ 2]  889 	jra 4$
      00840B 72 CE 00 15      [ 5]  890 0$:	ldw x,[ptr16]
      00840F 1F 05            [ 2]  891 	ldw (LINENO,sp),x 
      008411 AE 00 02         [ 2]  892 	ldw x,#2 
      008414 72 D6 00 15      [ 4]  893 	ld a,([ptr16],x); line length 
      008418 97               [ 1]  894 	ld xl,a
      008419 1F 07            [ 2]  895 	ldw (LLEN,sp),x
      00841B 1E 05            [ 2]  896 	ldw x,(LINENO,sp)
      00841D CD 83 60         [ 4]  897 	call search_lineno 
      008420 5D               [ 2]  898 	tnzw x 
      008421 26 04            [ 1]  899 	jrne 2$
                                    900 ; line doesn't exit 	
      008423 17 01            [ 2]  901 	ldw (DEST,sp),y 
      008425 20 05            [ 2]  902 	jra 3$
                                    903 ; line exit delete it.	
      008427 1F 01            [ 2]  904 2$: ldw (DEST,sp),x 
      008429 CD 83 8B         [ 4]  905 	call del_line
                                    906 ; leave or insert new line if LLEN>0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      00842C                        907 3$: 
      00842C 0D 08            [ 1]  908 	tnz (LLEN+1,sp)
      00842E 27 3F            [ 1]  909 	jreq insert_ln_exit ; empty line forget it.
      008430 1E 01            [ 2]  910 	ldw x,(DEST,sp)
      008432 C3 00 1E         [ 2]  911 	cpw x,txtend 
      008435 2A 12            [ 1]  912 	jrpl 4$ 
                                    913 ; must create a gap 
      008437 CE 00 1E         [ 2]  914 	ldw x,txtend 
      00843A 72 FB 07         [ 2]  915 	addw x,(LLEN,sp)
      00843D CF 00 1E         [ 2]  916 	ldw txtend,x 
      008440 1E 01            [ 2]  917 	ldw x,(DEST,sp)
      008442 16 07            [ 2]  918 	ldw y,(LLEN,sp)
      008444 CD 83 C3         [ 4]  919 	call create_gap 
      008447 20 0B            [ 2]  920 	jra 5$ 
      008449                        921 4$: ; leave line at end. 
      008449 1E 07            [ 2]  922 	ldw x,(LLEN,sp) 
      00844B 72 BB 00 1E      [ 2]  923 	addw x,txtend 
      00844F CF 00 1E         [ 2]  924 	ldw txtend,x 
      008452 20 1B            [ 2]  925 	jra insert_ln_exit 
      008454                        926 5$:	
      008454 1E 07            [ 2]  927 	ldw x,(LLEN,sp)
      008456 CF 00 0A         [ 2]  928 	ldw acc16,x 
      008459 90 CE 00 15      [ 2]  929 	ldw y,ptr16 
      00845D 72 F9 07         [ 2]  930 	addw y,(LLEN,sp)
      008460 1E 01            [ 2]  931 	ldw x,(DEST,sp) ; dest address 
      008462 CD 83 1E         [ 4]  932 	call move 
      008465 CE 00 1E         [ 2]  933 	ldw x,txtend 
      008468 72 F0 07         [ 2]  934 	subw x,(LLEN,sp)
      00846B CF 00 1E         [ 2]  935 	ldw txtend,x
      00846E 7F               [ 1]  936 	clr (x) 
      00846F                        937 insert_ln_exit:	
      0003EF                        938 	_drop VSIZE
      00846F 5B 08            [ 2]    1     addw sp,#VSIZE 
      008471 81               [ 4]  939 	ret
                                    940 
                                    941 
                                    942 ;-----------------------------
                                    943 ; check if text buffer full
                                    944 ; input:
                                    945 ;   ptr16     addr start tokenize line 
                                    946 ;   X         buffer index 
                                    947 ; output:
                                    948 ;   none 
                                    949 ;-----------------------------------
      008472                        950 check_full:
      008472 72 BB 00 15      [ 2]  951 	addw x,ptr16 
      008476 A3 16 C8         [ 2]  952 	cpw x,#tib 
      008479 25 05            [ 1]  953 	jrult 1$
      00847B A6 01            [ 1]  954 	ld a,#ERR_MEM_FULL
      00847D CC 87 A4         [ 2]  955 	jp tb_error 
      008480 81               [ 4]  956 1$: ret 
                                    957 
                                    958 
                                    959 ;-----------------------------------
                                    960 ; create token list form text line 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    961 ; save this list in text area
                                    962 ; input:
                                    963 ;   none
                                    964 ; output:
                                    965 ;   basicptr     token list buffer
                                    966 ;   lineno 		 BASIC line number 
                                    967 ;   in.w  		 cleared 
                                    968 ;-----------------------------------
                                    969 	.macro _incr_ptr16 n 
                                    970 	ldw x,#n 
                                    971 	addw x,ptr16 
                                    972 	ldw ptr16,x 
                                    973 	.endm 
                                    974 
                           000001   975 	XSAVE=1
                           000003   976 	BUFIDX=3
                           000004   977 	VSIZE=4
      008481                        978 compile:
      000401                        979 	_vars VSIZE 
      008481 52 04            [ 2]    1     sub sp,#VSIZE 
      008483 72 1A 00 25      [ 1]  980 	bset flags,#FCOMP 
      008487 CE 00 1E         [ 2]  981 	ldw x,txtend
      00848A CF 00 15         [ 2]  982 	ldw ptr16,x 
      00848D 5F               [ 1]  983 	clrw x 
      00848E AE 00 03         [ 2]  984 	ldw x,#3
      008491 1F 03            [ 2]  985 	ldw (BUFIDX,sp),X  
      008493 CD 84 72         [ 4]  986 	call check_full
      008496 5F               [ 1]  987 	clrw x 
      008497 72 CF 00 15      [ 5]  988 	ldw [ptr16],x 
      00849B CD 8D B4         [ 4]  989 	call get_token
      00849E 1F 01            [ 2]  990 	ldw (XSAVE,sp),x 
      0084A0 A1 03            [ 1]  991 	cp a,#TK_INTGR 
      0084A2 26 11            [ 1]  992 	jrne 3$
      0084A4 A3 00 00         [ 2]  993 	cpw x,#0  
      0084A7 22 03            [ 1]  994 	jrugt 1$
      0084A9 CC 87 A2         [ 2]  995 	jp syntax_error 
      0084AC 72 CF 00 15      [ 5]  996 1$:	ldw [ptr16],x; line number
      0084B0 CD 8D B4         [ 4]  997 2$:	call get_token
      0084B3 1F 01            [ 2]  998 	ldw (XSAVE,sp),x 
      0084B5 A1 00            [ 1]  999 3$:	cp a,#TK_NONE 
      0084B7 26 03            [ 1] 1000 	jrne 30$
      0084B9 CC 85 4C         [ 2] 1001 	jp 9$
      0084BC                       1002 30$: 	 
      0084BC 1E 03            [ 2] 1003 	ldw x,(BUFIDX,sp)
      0084BE CD 84 72         [ 4] 1004 	call check_full 
      0084C1 16 03            [ 2] 1005 	ldw y,(BUFIDX,sp) 
      0084C3 91 D7 15         [ 4] 1006 	ld ([ptr16],y),a 
      0084C6 90 5C            [ 1] 1007 	incw y
      0084C8 17 03            [ 2] 1008 	ldw (BUFIDX,sp),y
      0084CA A1 01            [ 1] 1009 	cp a,#TK_COLON 
      0084CC 26 02            [ 1] 1010 	jrne 31$
      0084CE 20 E0            [ 2] 1011 	jra 2$ 
      0084D0                       1012 31$:
      0084D0 A1 02            [ 1] 1013 	cp a,#TK_CHAR
      0084D2 26 0C            [ 1] 1014 	jrne 32$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084D4 1E 01            [ 2] 1015 	ldw x,(XSAVE,sp)
      0084D6 9F               [ 1] 1016 	ld a,xl 
      0084D7 91 D7 15         [ 4] 1017 	ld ([ptr16],y),a
      0084DA 90 5C            [ 1] 1018 	incw y 
      0084DC 17 03            [ 2] 1019 	ldw (BUFIDX,sp),y 
      0084DE 20 D0            [ 2] 1020 	jra 2$ 
      0084E0                       1021 32$:
      0084E0 A1 08            [ 1] 1022 	cp a,#TK_QSTR 
      0084E2 26 25            [ 1] 1023 	jrne 4$
      0084E4 AE 17 18         [ 2] 1024 	ldw x,#pad 
      0084E7 CD 82 F2         [ 4] 1025 	call strlen
      0084EA 5C               [ 1] 1026 	incw x  
      0084EB CD 84 72         [ 4] 1027 	call check_full 
      0084EE 90 AE 17 18      [ 2] 1028 	ldw y,#pad 
      0084F2 CE 00 15         [ 2] 1029 	ldw x,ptr16
      0084F5 72 FB 03         [ 2] 1030 	addw x,(BUFIDX,sp)	
      0084F8 CD 83 10         [ 4] 1031 	call strcpy 
      0084FB AE 17 18         [ 2] 1032 	ldw x,#pad 
      0084FE CD 82 F2         [ 4] 1033 	call strlen 
      008501 5C               [ 1] 1034 	incw x
      008502 72 FB 03         [ 2] 1035 	addw x,(BUFIDX,sp) 
      008505 1F 03            [ 2] 1036 	ldw (BUFIDX,sp),x
      008507 20 A7            [ 2] 1037 	jra 2$  
      008509 A1 03            [ 1] 1038 4$: cp a,#TK_INTGR
      00850B 25 A3            [ 1] 1039 	jrult 2$
      00850D A1 07            [ 1] 1040 	cp a,#TK_FUNC 
      00850F 22 9F            [ 1] 1041 	Jrugt 2$
      008511 1E 01            [ 2] 1042 	ldw x,(XSAVE,sp) 
      008513 16 03            [ 2] 1043 	ldw y,(BUFIDX,sp)
      008515 91 DF 15         [ 5] 1044 	ldw ([ptr16],y),x
      008518 A3 97 85         [ 2] 1045 	cpw x,#rem 
      00851B 26 26            [ 1] 1046 	jrne 5$
      00851D 72 A9 00 02      [ 2] 1047 	addw y,#2 
      008521 90 89            [ 2] 1048 	pushw y 
      008523 CE 00 15         [ 2] 1049 	ldw x,ptr16 
      008526 72 FB 01         [ 2] 1050 	addw x,(1,sp)
      0004A9                       1051 	_drop 2  
      008529 5B 02            [ 2]    1     addw sp,#2 
      00852B 90 CE 00 01      [ 2] 1052 	ldw y,in.w 
      00852F 72 A9 16 C8      [ 2] 1053 	addw y,#tib 
      008533 CD 83 10         [ 4] 1054 	call strcpy 	
      008536 CD 82 F2         [ 4] 1055 	call strlen 
      008539 1C 00 03         [ 2] 1056 	addw x,#3 ; rem exec address+string 0. 
      00853C 72 FB 03         [ 2] 1057 	addw x,(BUFIDX,sp)
      00853F 1F 03            [ 2] 1058 	ldw (BUFIDX,sp),x 
      008541 20 09            [ 2] 1059 	jra 9$
      008543 72 A9 00 02      [ 2] 1060 5$:	addw y,#2 
      008547 17 03            [ 2] 1061 	ldw (BUFIDX,sp),y 
      008549 CC 84 B0         [ 2] 1062 	jp 2$
      00854C                       1063 9$: 
      00854C AE 00 02         [ 2] 1064 	ldw x,#2
      00854F 16 03            [ 2] 1065 	ldw y,(BUFIDX,sp)
      008551 90 9F            [ 1] 1066 	ld a,yl 
      008553 72 D7 00 15      [ 4] 1067 	ld ([ptr16],x),a  	
      008557 72 CE 00 15      [ 5] 1068 	ldw x,[ptr16]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00855B 27 09            [ 1] 1069 	jreq 10$
      00855D CD 83 F4         [ 4] 1070 	call insert_line
      008560 72 5F 00 03      [ 1] 1071 	clr  count 
      008564 20 13            [ 2] 1072 	jra  11$ 
      008566                       1073 10$: 
      008566 CE 00 15         [ 2] 1074 	ldw x,ptr16 
      008569 CF 00 04         [ 2] 1075 	ldw basicptr,x 
      00856C E6 02            [ 1] 1076 	ld a,(2,x)
      00856E C7 00 03         [ 1] 1077 	ld count,a 
      008571 FE               [ 2] 1078 	ldw x,(x)
      008572 CF 00 06         [ 2] 1079 	ldw lineno,x 
      008575 35 03 00 02      [ 1] 1080 	mov in,#3 
      008579                       1081 11$:
      0004F9                       1082 	_drop VSIZE 
      008579 5B 04            [ 2]    1     addw sp,#VSIZE 
      00857B 72 1B 00 25      [ 1] 1083 	bres flags,#FCOMP 
      00857F 81               [ 4] 1084 	ret 
                                   1085 
                                   1086 
                                   1087 ;------------------------------------
                                   1088 ;  set all variables to zero 
                                   1089 ; input:
                                   1090 ;   none 
                                   1091 ; output:
                                   1092 ;	none
                                   1093 ;------------------------------------
      008580                       1094 clear_vars:
      008580 AE 00 27         [ 2] 1095 	ldw x,#vars 
      008583 90 AE 00 34      [ 2] 1096 	ldw y,#2*26 
      008587 7F               [ 1] 1097 1$:	clr (x)
      008588 5C               [ 1] 1098 	incw x 
      008589 90 5A            [ 2] 1099 	decw y 
      00858B 26 FA            [ 1] 1100 	jrne 1$
      00858D 81               [ 4] 1101 	ret 
                                   1102 
                                   1103 ;-------------------------------------
                                   1104 ; check if A is a letter
                                   1105 ; input:
                                   1106 ;   A 			character to test 
                                   1107 ; output:
                                   1108 ;   C flag      1 true, 0 false 
                                   1109 ;-------------------------------------
      00858E                       1110 is_alpha:
      00858E A1 41            [ 1] 1111 	cp a,#'A 
      008590 8C               [ 1] 1112 	ccf
      008591 24 0B            [ 1] 1113 	jrnc 9$ 
      008593 A1 5B            [ 1] 1114 	cp a,#'Z+1 
      008595 25 07            [ 1] 1115 	jrc 9$ 
      008597 A1 61            [ 1] 1116 	cp a,#'a 
      008599 8C               [ 1] 1117 	ccf 
      00859A 24 02            [ 1] 1118 	jrnc 9$
      00859C A1 7B            [ 1] 1119 	cp a,#'z+1   
      00859E 81               [ 4] 1120 9$: ret 	
                                   1121 
                                   1122 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1123 ;  program initialization entry point 
                                   1124 ;-------------------------------------
                           000001  1125 	MAJOR=1
                           000000  1126 	MINOR=0
      00859F 0A 0A 54 69 6E 79 20  1127 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0085E5                       1128 cold_start:
                                   1129 ;set stack 
      0085E5 AE 17 FF         [ 2] 1130 	ldw x,#STACK_EMPTY
      0085E8 94               [ 1] 1131 	ldw sp,x   
                                   1132 ; clear all ram 
      0085E9 7F               [ 1] 1133 0$: clr (x)
      0085EA 5A               [ 2] 1134 	decw x 
      0085EB 26 FC            [ 1] 1135 	jrne 0$
                                   1136 ; activate pull up on all inputs 
      0085ED A6 FF            [ 1] 1137 	ld a,#255 
      0085EF C7 50 03         [ 1] 1138 	ld PA_CR1,a 
      0085F2 C7 50 08         [ 1] 1139 	ld PB_CR1,a 
      0085F5 C7 50 0D         [ 1] 1140 	ld PC_CR1,a 
      0085F8 C7 50 12         [ 1] 1141 	ld PD_CR1,a 
      0085FB C7 50 17         [ 1] 1142 	ld PE_CR1,a 
      0085FE C7 50 1C         [ 1] 1143 	ld PF_CR1,a 
      008601 C7 50 21         [ 1] 1144 	ld PG_CR1,a 
      008604 C7 50 2B         [ 1] 1145 	ld PI_CR1,a 
                                   1146 ; select internal clock no divisor: 16 Mhz 	
      008607 A6 E1            [ 1] 1147 	ld a,#CLK_SWR_HSI 
      008609 5F               [ 1] 1148 	clrw x  
      00860A CD 81 19         [ 4] 1149     call clock_init 
      00860D CD 81 2F         [ 4] 1150 	call timer4_init
                                   1151 ; UART3 at 115200 BAUD
      008610 CD 81 F4         [ 4] 1152 	call uart3_init
                                   1153 ; activate PE_4 (user button interrupt)
      008613 72 18 50 18      [ 1] 1154     bset PE_CR2,#USR_BTN_BIT 
                                   1155 ; display system information
      008617 AE 85 9F         [ 2] 1156 	ldw x,#software 
      00861A CD 82 30         [ 4] 1157 	call puts 
      00861D A6 01            [ 1] 1158 	ld a,#MAJOR 
      00861F C7 00 0B         [ 1] 1159 	ld acc8,a 
      008622 5F               [ 1] 1160 	clrw x 
      008623 CF 00 09         [ 2] 1161 	ldw acc24,x 
      008626 A6 0A            [ 1] 1162 	ld a,#10 
      008628 CD 89 DF         [ 4] 1163 	call prti24 
      00862B A6 2E            [ 1] 1164 	ld a,#'.
      00862D CD 82 1E         [ 4] 1165 	call putc 
      008630 A6 00            [ 1] 1166 	ld a,#MINOR 
      008632 C7 00 0B         [ 1] 1167 	ld acc8,a 
      008635 5F               [ 1] 1168 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008636 CF 00 09         [ 2] 1169 	ldw acc24,x 
      008639 A6 0A            [ 1] 1170 	ld a,#10 
      00863B CD 89 DF         [ 4] 1171 	call prti24 
      00863E A6 0D            [ 1] 1172 	ld a,#CR 
      008640 CD 82 1E         [ 4] 1173 	call putc 
      008643 CD 9A FA         [ 4] 1174 	call seek_fdrive 
                                   1175 ; configure LED2 pin 
      008646 72 1A 50 0D      [ 1] 1176     bset PC_CR1,#LED2_BIT
      00864A 72 1A 50 0E      [ 1] 1177     bset PC_CR2,#LED2_BIT
      00864E 72 1A 50 0C      [ 1] 1178     bset PC_DDR,#LED2_BIT
      008652 9A               [ 1] 1179 	rim 
      008653 AE 16 C8         [ 2] 1180 	ldw x,#tib
      008656 CF 00 21         [ 2] 1181 	ldw array_addr,x 
      008659 72 5C 00 11      [ 1] 1182 	inc seedy+1 
      00865D 72 5C 00 0F      [ 1] 1183 	inc seedx+1 
      008661 CD 86 70         [ 4] 1184 	call clear_basic
      008664 CD 94 2E         [ 4] 1185 	call ubound 
      008667 CD 90 52         [ 4] 1186 	call dpop 
      00866A CF 00 23         [ 2] 1187 	ldw array_size,x 
      00866D CC 87 F4         [ 2] 1188     jp warm_start 
                                   1189 
                                   1190 ;---------------------------
                                   1191 ; reset BASIC text variables 
                                   1192 ; and clear variables 
                                   1193 ;---------------------------
      008670                       1194 clear_basic:
      008670 5F               [ 1] 1195 	clrw x 
      008671 CF 00 06         [ 2] 1196 	ldw lineno,x
      008674 72 5F 00 03      [ 1] 1197 	clr count 
      008678 AE 00 5B         [ 2] 1198 	ldw x,#free_ram 
      00867B CF 00 1C         [ 2] 1199 	ldw txtbgn,x 
      00867E CF 00 1E         [ 2] 1200 	ldw txtend,x 
      008681 CD 85 80         [ 4] 1201 	call clear_vars 
      008684 81               [ 4] 1202 	ret 
                                   1203 
                                   1204 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1205 ;;   Tiny BASIC error messages     ;;
                                   1206 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008685                       1207 err_msg:
      008685 00 00 86 9D 86 AB 86  1208 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             BA 86 D4 86 E4
      008691 86 FB 87 12 87 2D 87  1209 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             3F 87 51
      00869B 87 5E                 1210 	.word err_no_access 
                                   1211 
      00869D 0A 4D 65 6D 6F 72 79  1212 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      0086AB 0A 73 79 6E 74 61 78  1213 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      0086BA 0A 6D 61 74 68 20 6F  1214 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0086D4 0A 64 69 76 69 73 69  1215 err_div0: .asciz "\ndivision by 0\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal  6F-Bits]



             6F 6E 20 62 79 20 30
             0A 00
      0086DC 6E 20 62 79 20 30 0A  1216 err_no_line: .asciz "\ninvalid line number.\n"
             00 0A 69 6E 76 61 6C
             69 64 20 6C 69 6E 65
             20 6E
      0086F3 75 6D 62 65 72 2E 0A  1217 err_run_only: .asciz "\nrun time only usage.\n" 
             00 0A 72 75 6E 20 74
             69 6D 65 20 6F 6E 6C
             79 20
      00870A 75 73 61 67 65 2E 0A  1218 err_cmd_only: .asciz "\ncommand line only usage.\n"
             00 0A 63 6F 6D 6D 61
             6E 64 20 6C 69 6E 65
             20 6F 6E 6C 79 20
      008725 75 73 61 67 65 2E 0A  1219 err_duplicate: .asciz "\nduplicate name.\n"
             00 0A 64 75 70 6C 69
             63 61 74 65
      008737 20 6E 61 6D 65 2E 0A  1220 err_not_file: .asciz "\nFile not found.\n"
             00 0A 46 69 6C 65 20
             6E 6F 74 20
      008749 66 6F 75 6E 64 2E 0A  1221 err_bad_value: .asciz "\nbad value.\n"
             00 0A 62 61 64 20
      008756 76 61 6C 75 65 2E 0A  1222 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             00 0A 46 69 6C 65 20
             69 6E 20 65 78 74 65
             6E 64 65 64 20 6D 65
             6D 6F 72 79 2C 20 63
             61 6E 27 74 20 62 65
             20 72 75 6E 20 66 72
             6F 6D 20
                                   1223 
      00878A 74 68 65 72 65 2E 0A  1224 rt_msg: .asciz "last token id: "
             00 6C 61 73 74 20 74
             6F 6B
                                   1225 
      000722                       1226 syntax_error:
      00879A 65 6E            [ 1] 1227 	ld a,#ERR_SYNTAX 
                                   1228 
      000724                       1229 tb_error:
      00879C 20 69 64         [ 2] 1230 	ldw x, #err_msg 
      00879F 3A 20 00 09      [ 1] 1231 	clr acc16 
      0087A2 48               [ 1] 1232 	sll a
      0087A2 A6 02 00 09      [ 1] 1233 	rlc acc16  
      0087A4 C7 00 0A         [ 1] 1234 	ld acc8, a 
      0087A4 AE 86 85 72      [ 2] 1235 	addw x,acc16 
      0087A8 5F               [ 2] 1236 	ldw x,(x)
      0087A9 00 0A 48         [ 4] 1237 	call puts
      0087AC 72 59 00 0A C7   [ 2] 1238 	btjf flags,#FCOMP, 1$
      0087B1 00 0B 72         [ 2] 1239 	ldw x,#tib
      0087B4 BB 00 0A         [ 4] 1240 	call puts 
      0087B7 FE CD            [ 1] 1241 	ld a,#CR 
      0087B9 82 30 72         [ 4] 1242 	call putc
      0087BC 0B 00 25         [ 2] 1243 	ldw x,#in.w.saved
      0087BF 18 AE 16         [ 4] 1244 	call spaces
      0087C2 C8 CD            [ 1] 1245 	ld a,#'^
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0087C4 82 30 A6         [ 4] 1246 	call putc 
      0087C7 0D CD            [ 2] 1247 	jra 6$
      0087C9 82 1E AE         [ 2] 1248 1$:	ldw x,basicptr
      0087CC 00 12 CD         [ 4] 1249 	call prt_basic_line
      0087CF 82 58 A6         [ 2] 1250 	ldw x,#rt_msg 
      0087D2 5E CD 82         [ 4] 1251 	call puts 
      0087D5 1E 20 18         [ 2] 1252 	ldw x,in.w.saved 
      0087D8 CE 00 04 CD      [ 4] 1253 	ld a,([basicptr],x)
      0087DC 94               [ 1] 1254 	clrw x 
      0087DD FB               [ 1] 1255 	ld xl,a 
      0087DE AE 87 92         [ 4] 1256 	call print_int 
      0087E1 CD 82 30         [ 2] 1257 6$: ldw x,#STACK_EMPTY 
      0087E4 CE               [ 1] 1258     ldw sp,x
      000774                       1259 warm_start:
      0087E5 00 12 72 D6      [ 1] 1260 	clr flags 
      0087E9 00 04 5F 97      [ 1] 1261 	clr loop_depth 
      0087ED CD 8A 27         [ 2] 1262 	ldw x,#dstack_unf 
      0087F0 AE 17 FF         [ 2] 1263 	ldw dstkptr,x 
      0087F3 94 04 00 25      [ 1] 1264 	mov tab_width,#TAB_WIDTH 
      0087F4 35 0A 00 07      [ 1] 1265 	mov base,#10 
      0087F4 72               [ 1] 1266 	clrw x 
      0087F5 5F 00 25         [ 2] 1267 	ldw lineno,x 
      0087F8 72 5F 00         [ 2] 1268 	ldw x,#tib 
      0087FB 20 AE 17         [ 2] 1269 	ldw basicptr,x 
                                   1270 ;----------------------------
                                   1271 ;   BASIC interpreter
                                   1272 ;----------------------------
      000794                       1273 interp:
      0087FE 80 CF 00 1A      [ 1] 1274 	clr in.w
      008802 35 04 00 26 35   [ 2] 1275 	btjf flags,#FRUN,4$ 
                                   1276 ; running program
                                   1277 ; goto next basic line 
      008807 0A 00 08         [ 2] 1278 	ldw x,basicptr
      00880A 5F CF            [ 1] 1279 	ld a,(2,x) ; line length 
      00880C 00 06 AE         [ 1] 1280 	ld acc8,a 
      00880F 16 C8 CF 00      [ 1] 1281 	clr acc16 
      008813 04 BB 00 09      [ 2] 1282 	addw x,acc16
      008814 C3 00 1D         [ 2] 1283 	cpw x,txtend 
      008814 72 5F            [ 1] 1284 	jrpl warm_start
      008816 00 01 72         [ 2] 1285 	ldw basicptr,x ; start of next line  
      008819 01 00            [ 1] 1286 	ld a,(2,x)
      00881B 25 27 CE         [ 1] 1287 	ld count,a 
      00881E 00               [ 2] 1288 	ldw x,(x) ; line no 
      00881F 04 E6 02         [ 2] 1289 	ldw lineno,x 
      008822 C7 00 0B 72      [ 1] 1290 	mov in,#3 ; skip first 3 bytes of line 
      008826 5F 00            [ 2] 1291 	jra interp_loop 
      0007C4                       1292 4$: ; commande line mode 	
      008828 0A 72 BB 00      [ 1] 1293 	clr in
      00882C 0A C3            [ 1] 1294 	ld a,#CR 
      00882E 00 1E 2A         [ 4] 1295 	call putc 
      008831 C2 CF            [ 1] 1296 	ld a,#'> 
      008833 00 04 E6         [ 4] 1297 	call putc 
      008836 02 C7 00         [ 4] 1298 	call readln
      008839 03 FE CF         [ 4] 1299 	call compile
      0007D8                       1300 interp_loop:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      00883C 00 06 35         [ 1] 1301 	ld a,in 
      00883F 03 00 02         [ 1] 1302 	cp a,count  
      008842 20 14            [ 1] 1303 	jrpl interp
      008844 CD 08 08         [ 4] 1304 	call next_token
      008844 72 5F            [ 1] 1305 	cp a,#TK_COLON 
      008846 00 02            [ 1] 1306 	jreq interp_loop 
      008848 A6 0D            [ 1] 1307 	cp a,#TK_NONE 
                                   1308 ;	jreq interp 
      0007E9                       1309 1$:
      00884A CD 82            [ 1] 1310 	cp a,#TK_VAR
      00884C 1E A6            [ 1] 1311 	jrne 2$
      00884E 3E CD 82         [ 4] 1312 	call let02  
      008851 1E CD            [ 2] 1313 	jra interp_loop 
      0007F2                       1314 2$:	
      008853 8B 15            [ 1] 1315 	cp a,#TK_ARRAY 
      008855 CD 84            [ 1] 1316 	jrne 3$
      008857 81 12 19         [ 4] 1317 	call get_array_element
      008858 CD 13 C6         [ 4] 1318 	call let02 
      008858 C6 00            [ 2] 1319 	jra interp_loop 
      0007FE                       1320 3$:
      00885A 02 C1            [ 1] 1321 	cp a,#TK_CMD
      00885C 00 03            [ 1] 1322 	jrne 4$
      00885E 2A               [ 4] 1323 	call (x) 
      00885F B4 CD            [ 2] 1324 	jra interp_loop 
      000805                       1325 4$:	
      008861 88 88 A1         [ 2] 1326 	jp syntax_error 
                                   1327 
                                   1328 ;--------------------------
                                   1329 ; extract next token from
                                   1330 ; token list 
                                   1331 ; basicptr -> base address 
                                   1332 ; in  -> offset in list array 
                                   1333 ; output:
                                   1334 ;   A 		token attribute
                                   1335 ;   X 		token value if there is one
                                   1336 ;----------------------------------------
      000808                       1337 next_token:
      008864 01 27            [ 1] 1338 	push #0
      008866 F1 A1 00         [ 1] 1339 	ld a,in 
      008869 C1 00 02         [ 1] 1340 	cp a,count 
      008869 A1               [ 1] 1341 	pop a 
      00886A 04 26            [ 1] 1342 	jrpl 9$ 
      00886C 05 CD 94         [ 2] 1343 	ldw x,in.w 
      00886F 46 20 E6         [ 2] 1344 	ldw in.w.saved,x 
      008872 CE 00 03         [ 2] 1345 	ldw x,basicptr 
      008872 A1 05 26 08      [ 4] 1346 	ld a,([in.w],x)
      008876 CD 92 99 CD      [ 1] 1347 	inc in 
      00887A 94 46            [ 1] 1348 	cp a,#CMD_END 
      00887C 20 DA            [ 1] 1349 	jrult 9$
      00887E A1 02            [ 1] 1350 	cp a,#TK_CHAR
      00887E A1 06            [ 1] 1351 	jrne 1$
      008880 26 03 FD 20      [ 4] 1352 	ld a,([in.w],x)
      008884 D3 5C 00 01      [ 1] 1353 	inc in
      008885 5F               [ 1] 1354 	clrw x 
      008885 CC               [ 1] 1355 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008886 87 A2            [ 1] 1356 	ld a,#TK_CHAR
      008888 81               [ 4] 1357 	ret 
      008888 4B 00            [ 1] 1358 1$:	cp a,#TK_QSTR 
      00888A C6 00            [ 1] 1359 	jrugt 9$
      00888C 02 C1            [ 1] 1360 	jrult 2$
      00888E 00 03 84 2A      [ 2] 1361 	addw x,in.w 
      008892 3E CE            [ 2] 1362 	jra 9$
      008894 00 01 CF 00      [ 5] 1363 2$: ldw x,([in.w],x)
      008898 12 CE 00 04      [ 1] 1364 	inc in 
      00889C 72 D6 00 01      [ 1] 1365 	inc in
      0088A0 72               [ 4] 1366 9$: ret	
                                   1367 
                                   1368 
                                   1369 ;----------------------------------------
                                   1370 ;   DEBUG support functions
                                   1371 ;----------------------------------------
                           000001  1372 .if DEBUG 
                                   1373 ; turn LED on 
      000852                       1374 ledon:
      0088A1 5C 00 02 A1      [ 1] 1375     bset PC_ODR,#LED2_BIT
      0088A5 02               [ 4] 1376     ret 
                                   1377 
                                   1378 ; turn LED off 
      000857                       1379 ledoff:
      0088A6 25 29 A1 02      [ 1] 1380     bres PC_ODR,#LED2_BIT 
      0088AA 26               [ 4] 1381     ret 
                                   1382 
                                   1383 ; invert LED status 
      00085C                       1384 ledtoggle:
      0088AB 0D 72            [ 1] 1385     ld a,#LED2_MASK
      0088AD D6 00 01         [ 1] 1386     xor a,PC_ODR
      0088B0 72 5C 00         [ 1] 1387     ld PC_ODR,a
      0088B3 02               [ 4] 1388     ret 
                                   1389 
      000865                       1390 left_paren:
      0088B4 5F 97            [ 1] 1391 	ld a,#SPACE 
      0088B6 A6 02 81         [ 4] 1392 	call putc
      0088B9 A1 08            [ 1] 1393 	ld a,#'( 
      0088BB 22 14 25         [ 4] 1394 	call putc 	
      0088BE 06               [ 4] 1395 	ret 
                                   1396 
                                   1397 ;------------------------------
                                   1398 ; print 8 bit register 
                                   1399 ; input:
                                   1400 ;   X  point to register name 
                                   1401 ;   A  register value to print 
                                   1402 ; output:
                                   1403 ;   none
                                   1404 ;------------------------------- 
      000870                       1405 prt_reg8:
      0088BF 72               [ 1] 1406 	push a 
      0088C0 BB 00 01         [ 4] 1407 	call puts 
      0088C3 20 0C            [ 1] 1408 	ld a,(1,sp) 
      0088C5 72 DE 00         [ 1] 1409 	ld acc8,a 
      0088C8 01               [ 1] 1410 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0088C9 72               [ 1] 1411 	ld xl,a 
      0088CA 5C 00 02 72      [ 1] 1412 	mov base,#16
      0088CE 5C 00 02         [ 4] 1413 	call print_int 
      0088D1 81 08 65         [ 4] 1414 	call left_paren 
      0088D2 84               [ 1] 1415 	pop a 
      0088D2 72               [ 1] 1416 	clrw x 
      0088D3 1A               [ 1] 1417 	ld xl,a 
      0088D4 50 0A 81 07      [ 1] 1418 	mov base,#10 
      0088D7 CD 09 A7         [ 4] 1419 	call print_int  
      0088D7 72 1B            [ 1] 1420 	ld a,#') 
      0088D9 50 0A 81         [ 4] 1421 	call putc
      0088DC 81               [ 4] 1422 	ret
                                   1423 
                                   1424 ;--------------------------------
                                   1425 ; print 16 bits register 
                                   1426 ; input:
                                   1427 ;   X   point register name 
                                   1428 ;   Y   register value to print 
                                   1429 ; output:
                                   1430 ;  none
                                   1431 ;--------------------------------
      000895                       1432 prt_reg16: 
      0088DC A6 20            [ 2] 1433 	pushw y 
      0088DE C8 50 0A         [ 4] 1434 	call puts 
      0088E1 C7 50            [ 2] 1435 	ldw x,(1,sp) 
      0088E3 0A 81 00 07      [ 1] 1436 	mov base,#16 
      0088E5 CD 09 A7         [ 4] 1437 	call print_int  
      0088E5 A6 20 CD         [ 4] 1438 	call left_paren 
      0088E8 82               [ 2] 1439 	popw x 
      0088E9 1E A6 28 CD      [ 1] 1440 	mov base,#10 
      0088ED 82 1E 81         [ 4] 1441 	call print_int  
      0088F0 A6 29            [ 1] 1442 	ld a,#') 
      0088F0 88 CD 82         [ 4] 1443 	call putc
      0088F3 30               [ 4] 1444 	ret 
                                   1445 
                                   1446 ;------------------------------------
                                   1447 ; print registers contents saved on
                                   1448 ; stack by trap interrupt.
                                   1449 ;------------------------------------
      0008B4                       1450 print_registers:
      0088F4 7B 01 C7         [ 2] 1451 	ldw x,#STATES
      0088F7 00 0B 5F         [ 4] 1452 	call puts
                                   1453 ; print EPC 
      0088FA 97 35 10         [ 2] 1454 	ldw x, #REG_EPC
      0088FD 00 08 CD         [ 4] 1455 	call puts 
      008900 8A 27            [ 1] 1456 	ld a, (11,sp)
      008902 CD 88 E5         [ 1] 1457 	ld acc8,a 
      008905 84 5F            [ 1] 1458 	ld a, (10,sp) 
      008907 97 35 0A         [ 1] 1459 	ld acc16,a 
      00890A 00 08            [ 1] 1460 	ld a,(9,sp) 
      00890C CD 8A 27         [ 1] 1461 	ld acc24,a
      00890F A6               [ 1] 1462 	clrw x  
      008910 29 CD            [ 1] 1463 	ld a,#16
      008912 82 1E 81         [ 4] 1464 	call prti24  
                                   1465 ; print X
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      008915 AE 09 4D         [ 2] 1466 	ldw x,#REG_X
      008915 90 89            [ 2] 1467 	ldw y,(5,sp)
      008917 CD 82 30         [ 4] 1468 	call prt_reg16  
                                   1469 ; print Y 
      00891A 1E 01 35         [ 2] 1470 	ldw x,#REG_Y
      00891D 10 00            [ 2] 1471 	ldw y, (7,sp)
      00891F 08 CD 8A         [ 4] 1472 	call prt_reg16  
                                   1473 ; print A 
      008922 27 CD 88         [ 2] 1474 	ldw x,#REG_A
      008925 E5 85            [ 1] 1475 	ld a, (4,sp) 
      008927 35 0A 00         [ 4] 1476 	call prt_reg8
                                   1477 ; print CC 
      00892A 08 CD 8A         [ 2] 1478 	ldw x,#REG_CC 
      00892D 27 A6            [ 1] 1479 	ld a, (3,sp) 
      00892F 29 CD 82         [ 4] 1480 	call prt_reg8 
                                   1481 ; print SP 
      008932 1E 81 5A         [ 2] 1482 	ldw x,#REG_SP
      008934 90 96            [ 1] 1483 	ldw y,sp 
      008934 AE 89 87 CD      [ 2] 1484 	addw y,#12
      008938 82 30 AE         [ 4] 1485 	call prt_reg16  
      00893B 89 C4            [ 1] 1486 	ld a,#'\n' 
      00893D CD 82 30         [ 4] 1487 	call putc
      008940 7B               [ 4] 1488 	ret
                                   1489 
      008941 0B C7 00 0B 7B 0A C7  1490 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             00 0A 7B 09 C7 00 09
             5F A6 10 CD 89 DF AE
             89 CD 16 05 CD 89 15
             AE 89 C9 16 07 CD 89
             15 AE 89 D1 7B 04 CD
             88 F0 AE 89 D5 7B 03
             CD 88 F0 AE 89 DA 90
             96 72 A9 00 0C
      00897E CD 89 15 A6 0A        1491 REG_EPC: .asciz "EPC:"
      008983 CD 82 1E 81           1492 REG_Y:   .asciz "\nY:" 
      008987 0A 52 65 67           1493 REG_X:   .asciz "\nX:"
      00898B 69 73 74 65           1494 REG_A:   .asciz "\nA:" 
      00898F 72 73 20 73 74        1495 REG_CC:  .asciz "\nCC:"
      008994 61 74 65 20 61        1496 REG_SP:  .asciz "\nSP:"
                                   1497 .endif ; DEBUG 
                                   1498 
                                   1499 ;------------------------------------
                                   1500 ; print integer in acc24 
                                   1501 ; input:
                                   1502 ;	acc24 		integer to print 
                                   1503 ;	A 			numerical base for conversion 
                                   1504 ;               if bit 7 is set add a space at print end.
                                   1505 ;   XL 			field width, 0 -> no fill.
                                   1506 ;  output:
                                   1507 ;    none 
                                   1508 ;------------------------------------
                           000001  1509 	WIDTH = 1
                           000002  1510 	BASE = 2
                           000003  1511 	ADD_SPACE=3 ; add a space after number 
                           000003  1512 	VSIZE = 3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00095F                       1513 prti24:
      00095F                       1514 	_vars VSIZE 
      008999 74 20            [ 2]    1     sub sp,#VSIZE 
      00899B 61 62            [ 1] 1515 	clr (ADD_SPACE,sp)
      00899D 6F 72            [ 1] 1516 	bcp a,#0x80 
      00899F 74 20            [ 1] 1517 	jreq 0$ 
      0089A1 70 6F            [ 1] 1518 	cpl (ADD_SPACE,sp)
      0089A3 69 6E            [ 1] 1519 0$:	and a,#31 
      0089A5 74 2E            [ 1] 1520 	ld (BASE,sp),a
      0089A7 0A               [ 1] 1521 	ld a,xl
      0089A8 2D 2D            [ 1] 1522 	ld (WIDTH,sp),a 
      0089AA 2D 2D            [ 1] 1523 	ld a, (BASE,sp)  
      0089AC 2D 2D 2D         [ 4] 1524     call itoa  ; conversion entier en  .asciz
      0089AF 2D 2D            [ 1] 1525 1$: ld a,(WIDTH,sp)
      0089B1 2D 2D            [ 1] 1526 	jreq 4$
      0089B3 2D 2D 2D         [ 1] 1527 	ld acc8,a 
      0089B6 2D               [ 2] 1528 	pushw x 
      0089B7 2D 2D 2D         [ 4] 1529 	call strlen 
      0089BA 2D               [ 1] 1530 	ld a,xl 
      0089BB 2D               [ 2] 1531 	popw x 
      0089BC 2D 2D 2D         [ 3] 1532 	exg a,acc8 
      0089BF 2D 2D 2D         [ 1] 1533 	sub a,acc8 
      0089C2 0A 00            [ 1] 1534 	jrmi 4$
      0089C4 45 50            [ 1] 1535 	ld (WIDTH,sp),a 
      0089C6 43 3A            [ 1] 1536 	ld  a,#SPACE
      0089C8 00 0A            [ 1] 1537 3$: tnz (WIDTH,sp)
      0089CA 59 3A            [ 1] 1538 	jreq 4$
      0089CC 00               [ 2] 1539 	decw x 
      0089CD 0A               [ 1] 1540 	ld (x),a 
      0089CE 58 3A            [ 1] 1541 	dec (WIDTH,sp) 
      0089D0 00 0A            [ 2] 1542 	jra 3$
      000998                       1543 4$: 
      0089D2 41 3A 00         [ 4] 1544 	call puts 
      0089D5 0A 43            [ 1] 1545 	tnz (ADD_SPACE,sp)
      0089D7 43 3A            [ 1] 1546 	jreq 5$
      0089D9 00 0A            [ 1] 1547     ld a,#SPACE 
      0089DB 53 50 3A         [ 4] 1548 	call putc 
      0009A4                       1549 5$: _drop VSIZE 
      0089DE 00 03            [ 2]    1     addw sp,#VSIZE 
      0089DF 81               [ 4] 1550     ret	
                                   1551 
                                   1552 ;-----------------------------------
                                   1553 ; print a 16 bit integer 
                                   1554 ; using variable 'base' as conversion
                                   1555 ; format.
                                   1556 ; input:
                                   1557 ;   X       integer to print 
                                   1558 ;   base    conversion base 
                                   1559 ; output:
                                   1560 ;   none 
                                   1561 ;-----------------------------------
                           000001  1562 	SIGN=1
                           000001  1563 	VSIZE=1
      0009A7                       1564 print_int: 
      0009A7                       1565 	_vars VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0089DF 52 03            [ 2]    1     sub sp,#VSIZE 
      0089E1 0F 03            [ 1] 1566 	clr (SIGN,sp)
      0089E3 A5 80 27 02      [ 2] 1567 	ldw y,#pad+PAD_SIZE-1 
      0089E7 03 03            [ 1] 1568 	clr (y)
      0089E9 A4 1F 6B         [ 1] 1569 	ld a,base  
      0089EC 02 9F            [ 1] 1570 	cp a,#10 
      0089EE 6B 01            [ 1] 1571 	jrne 1$ 
      0089F0 7B               [ 2] 1572 	tnzw x 
      0089F1 02 CD            [ 1] 1573 	jrpl 1$ 
      0089F3 8A 83            [ 1] 1574 	cpl (SIGN,sp)
      0089F5 7B               [ 2] 1575 	negw x 	 
      0009BE                       1576 1$:	
      0089F6 01 27 1F         [ 1] 1577 	ld a,base 
      0089F9 C7               [ 2] 1578 	div x,a 
      0089FA 00 0B            [ 1] 1579 	add a,#'0 
      0089FC 89 CD            [ 1] 1580 	cp a,#'9+1 
      0089FE 82 F2            [ 1] 1581 	jrmi 2$ 
      008A00 9F 85            [ 1] 1582 	add a,#7 
      008A02 31 00            [ 2] 1583 2$: decw y 
      008A04 0B C0            [ 1] 1584 	ld (y),a 
      008A06 00               [ 2] 1585 	tnzw x 
      008A07 0B 2B            [ 1] 1586 	jrne 1$ 
      008A09 0E 6B            [ 1] 1587 	ld a,#16 
      008A0B 01 A6 20         [ 1] 1588 	cp a,base 
      008A0E 0D 01            [ 1] 1589 	jrne 3$
      008A10 27 06            [ 1] 1590 	ld a,#'$
      008A12 5A F7            [ 2] 1591 	decw y  
      008A14 0A 01            [ 1] 1592 	ld (y),a
      008A16 20 F6            [ 2] 1593 	jra 9$ 
      008A18 0D 01            [ 1] 1594 3$: tnz (SIGN,sp)
      008A18 CD 82            [ 1] 1595 	jreq 9$ 
      008A1A 30 0D            [ 1] 1596 	ld a,#'-
      008A1C 03 27            [ 2] 1597 	decw y  
      008A1E 05 A6            [ 1] 1598 	ld (y),a
      0009EA                       1599 9$:	
      008A20 20               [ 1] 1600 	ldw x,y 
      008A21 CD 82 1E         [ 2] 1601 	subw x,#pad+PAD_SIZE-1 
      008A24 5B               [ 2] 1602 	negw x  
      0009EF                       1603 10$:
      008A25 03 81            [ 2] 1604 	decw y 
      008A27 A6 20            [ 1] 1605 	ld a,#SPACE 
      008A27 52 01            [ 1] 1606 	ld (y),a
      008A29 0F               [ 1] 1607 	incw x 
      008A2A 01               [ 1] 1608 	ld a,xl 
      008A2B 90 AE 17         [ 1] 1609 	cp a,tab_width
      008A2E 3F 90            [ 1] 1610 	jrmi 10$ 
      0009FC                       1611 12$:
      008A30 7F               [ 1] 1612     ldw x,y 
      008A31 C6 00 08         [ 4] 1613 	call puts  
      000A00                       1614 	_drop VSIZE 
      008A34 A1 0A            [ 2]    1     addw sp,#VSIZE 
      008A36 26               [ 4] 1615 	ret 
                                   1616 
                                   1617 ;------------------------------------
                                   1618 ; convert integer in acc24 to string
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1619 ; input:
                                   1620 ;   A	  	base
                                   1621 ;	acc24	integer to convert
                                   1622 ; output:
                                   1623 ;   X  		pointer to string
                                   1624 ;------------------------------------
                           000001  1625 	SIGN=1  ; integer sign 
                           000002  1626 	BASE=2  ; numeric base 
                           000002  1627 	VSIZE=2  ;locals size
      000A03                       1628 itoa:
      008A37 06 5D            [ 2] 1629 	sub sp,#VSIZE
      008A39 2A 03            [ 1] 1630 	ld (BASE,sp), a  ; base
      008A3B 03 01            [ 1] 1631 	clr (SIGN,sp)    ; sign
      008A3D 50 0A            [ 1] 1632 	cp a,#10
      008A3E 26 0A            [ 1] 1633 	jrne 1$
                                   1634 	; base 10 string display with negative sign if bit 23==1
      008A3E C6 00 08 62 AB   [ 2] 1635 	btjf acc24,#7,1$
      008A43 30 A1            [ 1] 1636 	cpl (SIGN,sp)
      008A45 3A 2B 02         [ 4] 1637 	call neg_acc24
      000A17                       1638 1$:
                                   1639 ; initialize string pointer 
      008A48 AB 07 90         [ 2] 1640 	ldw x,#pad+PAD_SIZE-1
      008A4B 5A               [ 1] 1641 	clr (x)
      000A1B                       1642 itoa_loop:
      008A4C 90 F7            [ 1] 1643     ld a,(BASE,sp)
      008A4E 5D 26 ED         [ 4] 1644     call divu24_8 ; acc24/A 
      008A51 A6 10            [ 1] 1645     add a,#'0  ; remainder of division
      008A53 C1 00            [ 1] 1646     cp a,#'9+1
      008A55 08 26            [ 1] 1647     jrmi 2$
      008A57 08 A6            [ 1] 1648     add a,#7 
      008A59 24               [ 2] 1649 2$: decw x
      008A5A 90               [ 1] 1650     ld (x),a
                                   1651 	; if acc24==0 conversion done
      008A5B 5A 90 F7         [ 1] 1652 	ld a,acc24
      008A5E 20 0A 0D         [ 1] 1653 	or a,acc16
      008A61 01 27 06         [ 1] 1654 	or a,acc8
      008A64 A6 2D            [ 1] 1655     jrne itoa_loop
                                   1656 	;conversion done, next add '$' or '-' as required
      008A66 90 5A            [ 1] 1657 	ld a,(BASE,sp)
      008A68 90 F7            [ 1] 1658 	cp a,#16
      008A6A 27 08            [ 1] 1659 	jreq 8$
      008A6A 93 1D            [ 1] 1660 	ld a,(SIGN,sp)
      008A6C 17 3F            [ 1] 1661     jreq 10$
      008A6E 50 2D            [ 1] 1662     ld a,#'-
      008A6F 20 02            [ 2] 1663 	jra 9$ 
      008A6F 90 5A            [ 1] 1664 8$: ld a,#'$ 
      008A71 A6               [ 2] 1665 9$: decw x
      008A72 20               [ 1] 1666     ld (x),a
      000A47                       1667 10$:
      008A73 90 F7            [ 2] 1668 	addw sp,#VSIZE
      008A75 5C               [ 4] 1669 	ret
                                   1670 
                                   1671 ;-------------------------------------
                                   1672 ; divide uint24_t by uint8_t
                                   1673 ; used to convert uint24_t to string
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1674 ; input:
                                   1675 ;	acc24	dividend
                                   1676 ;   A 		divisor
                                   1677 ; output:
                                   1678 ;   acc24	quotient
                                   1679 ;   A		remainder
                                   1680 ;------------------------------------- 
                                   1681 ; offset  on sp of arguments and locals
                           000001  1682 	U8   = 1   ; divisor on stack
                           000001  1683 	VSIZE =1
      000A4A                       1684 divu24_8:
      008A76 9F               [ 2] 1685 	pushw x ; save x
      008A77 C1               [ 1] 1686 	push a 
                                   1687 	; ld dividend UU:MM bytes in X
      008A78 00 26 2B         [ 1] 1688 	ld a, acc24
      008A7B F3               [ 1] 1689 	ld xh,a
      008A7C C6 00 09         [ 1] 1690 	ld a,acc24+1
      008A7C 93               [ 1] 1691 	ld xl,a
      008A7D CD 82            [ 1] 1692 	ld a,(U8,SP) ; divisor
      008A7F 30               [ 2] 1693 	div x,a ; UU:MM/U8
      008A80 5B               [ 1] 1694 	push a  ;save remainder
      008A81 01               [ 1] 1695 	ld a,xh
      008A82 81 00 08         [ 1] 1696 	ld acc24,a
      008A83 9F               [ 1] 1697 	ld a,xl
      008A83 52 02 6B         [ 1] 1698 	ld acc24+1,a
      008A86 02               [ 1] 1699 	pop a
      008A87 0F               [ 1] 1700 	ld xh,a
      008A88 01 A1 0A         [ 1] 1701 	ld a,acc24+2
      008A8B 26               [ 1] 1702 	ld xl,a
      008A8C 0A 72            [ 1] 1703 	ld a,(U8,sp) ; divisor
      008A8E 0F               [ 2] 1704 	div x,a  ; R:LL/U8
      008A8F 00 09            [ 1] 1705 	ld (U8,sp),a ; save remainder
      008A91 05               [ 1] 1706 	ld a,xl
      008A92 03 01 CD         [ 1] 1707 	ld acc24+2,a
      008A95 8A               [ 1] 1708 	pop a
      008A96 F2               [ 2] 1709 	popw x
      008A97 81               [ 4] 1710 	ret
                                   1711 
                                   1712 ;------------------------------------
                                   1713 ;  two's complement acc24
                                   1714 ;  input:
                                   1715 ;		acc24 variable
                                   1716 ;  output:
                                   1717 ;		acc24 variable
                                   1718 ;-------------------------------------
      000A72                       1719 neg_acc24:
      008A97 AE 17 3F 7F      [ 1] 1720 	cpl acc24+2
      008A9B 72 53 00 09      [ 1] 1721 	cpl acc24+1
      008A9B 7B 02 CD 8A      [ 1] 1722 	cpl acc24
      008A9F CA AB            [ 1] 1723 	ld a,#1
      008AA1 30 A1 3A         [ 1] 1724 	add a,acc24+2
      008AA4 2B 02 AB         [ 1] 1725 	ld acc24+2,a
      008AA7 07               [ 1] 1726 	clr a
      008AA8 5A F7 C6         [ 1] 1727 	adc a,acc24+1
      008AAB 00 09 CA         [ 1] 1728 	ld acc24+1,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008AAE 00               [ 1] 1729 	clr a 
      008AAF 0A CA 00         [ 1] 1730 	adc a,acc24 
      008AB2 0B 26 E6         [ 1] 1731 	ld acc24,a 
      008AB5 7B               [ 4] 1732 	ret
                                   1733 
                                   1734 
                                   1735 ;------------------------------------
                                   1736 ; read a line of text from terminal
                                   1737 ; input:
                                   1738 ;	none
                                   1739 ; local variable on stack:
                                   1740 ;	LL  line length
                                   1741 ;   RXCHAR last received chaaracte 
                                   1742 ; output:
                                   1743 ;   text in tib  buffer
                                   1744 ;------------------------------------
                                   1745 	; local variables
                           000001  1746 	LL_HB=1
                           000001  1747 	RXCHAR = 1 ; last char received
                           000002  1748 	LL = 2  ; accepted line length
                           000002  1749 	VSIZE=2 
      000A95                       1750 readln:
      008AB6 02               [ 1] 1751 	clrw x 
      008AB7 A1               [ 2] 1752 	pushw x 
      008AB8 10 27 08 7B      [ 2] 1753  	ldw y,#tib ; input buffer
      000A9B                       1754 readln_loop:
      008ABC 01 27 08         [ 4] 1755 	call getc
      008ABF A6 2D            [ 1] 1756 	ld (RXCHAR,sp),a
      008AC1 20 02            [ 1] 1757 	cp a,#CR
      008AC3 A6 24            [ 1] 1758 	jrne 1$
      008AC5 5A F7 14         [ 2] 1759 	jp readln_quit
      008AC7 A1 0A            [ 1] 1760 1$:	cp a,#NL
      008AC7 5B 02            [ 1] 1761 	jreq readln_quit
      008AC9 81 08            [ 1] 1762 	cp a,#BSP
      008ACA 27 41            [ 1] 1763 	jreq del_back
      008ACA 89 88            [ 1] 1764 	cp a,#CTRL_D
      008ACC C6 00            [ 1] 1765 	jreq del_ln
      008ACE 09 95            [ 1] 1766 	cp a,#CTRL_R 
      008AD0 C6 00            [ 1] 1767 	jreq reprint 
                                   1768 ;	cp a,#'[
                                   1769 ;	jreq ansi_seq
      000AB7                       1770 final_test:
      008AD2 0A 97            [ 1] 1771 	cp a,#SPACE
      008AD4 7B 01            [ 1] 1772 	jrpl accept_char
      008AD6 62 88            [ 2] 1773 	jra readln_loop
      000ABD                       1774 ansi_seq:
                                   1775 ;	call getc
                                   1776 ;	cp a,#'C 
                                   1777 ;	jreq rigth_arrow
                                   1778 ;	cp a,#'D 
                                   1779 ;	jreq left_arrow 
                                   1780 ;	jra final_test
      000ABD                       1781 right_arrow:
                                   1782 ;	ld a,#BSP 
                                   1783 ;	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1784 ;	jra realn_loop 
      000ABD                       1785 left_arrow:
                                   1786 
                                   1787 ;	jra readln_loop
      000ABD                       1788 reprint: 
      008AD8 9E C7 00 09      [ 1] 1789 	tnz count 
      008ADC 9F C7            [ 1] 1790 	jreq readln_loop
      008ADE 00 0A            [ 1] 1791 	tnz (LL,sp)
      008AE0 84 95            [ 1] 1792 	jrne readln_loop
      008AE2 C6 00 0B         [ 2] 1793 	ldw x,#tib 
      008AE5 97 7B 01         [ 4] 1794 	call puts
      008AE8 62 6B 01 9F      [ 2] 1795 	ldw y,#tib 
      008AEC C7 00 0B         [ 1] 1796 	ld a,count 
      008AEF 84 85            [ 1] 1797 	ld (LL,sp),a
      008AF1 81 5F 00 02      [ 1] 1798 	clr count 
      008AF2 0F 01            [ 1] 1799 	clr (LL_HB,sp)
      008AF2 72 53 00         [ 2] 1800 	addw y,(LL_HB,sp)
      008AF5 0B 72            [ 2] 1801 	jra readln_loop 
      000AE1                       1802 del_ln:
      008AF7 53 00            [ 1] 1803 	ld a,(LL,sp)
      008AF9 0A 72 53         [ 4] 1804 	call delete
      008AFC 00 09 A6 01      [ 2] 1805 	ldw y,#tib
      008B00 CB 00            [ 1] 1806 	clr (y)
      008B02 0B C7            [ 1] 1807 	clr (LL,sp)
      008B04 00 0B            [ 2] 1808 	jra readln_loop
      000AF0                       1809 del_back:
      008B06 4F C9            [ 1] 1810     tnz (LL,sp)
      008B08 00 0A            [ 1] 1811     jreq readln_loop
      008B0A C7 00            [ 1] 1812     dec (LL,sp)
      008B0C 0A 4F            [ 2] 1813     decw y
      008B0E C9 00            [ 1] 1814     clr  (y)
      008B10 09 C7 00         [ 4] 1815     call bksp 
      008B13 09 81            [ 2] 1816     jra readln_loop	
      008B15                       1817 accept_char:
      008B15 5F 89            [ 1] 1818 	ld a,#TIB_SIZE-1
      008B17 90 AE            [ 1] 1819 	cp a, (LL,sp)
      008B19 16 C8            [ 1] 1820 	jreq readln_loop
      008B1B 7B 01            [ 1] 1821 	ld a,(RXCHAR,sp)
      008B1B CD 82            [ 1] 1822 	ld (y),a
      008B1D 27 6B            [ 1] 1823 	inc (LL,sp)
      008B1F 01 A1            [ 1] 1824 	incw y
      008B21 0D 26            [ 1] 1825 	clr (y)
      008B23 03 CC 8B         [ 4] 1826 	call putc 
      008B26 94 A1            [ 2] 1827 	jra readln_loop
      000B14                       1828 readln_quit:
      008B28 0A 27            [ 1] 1829 	clr (y)
      008B2A 69 A1            [ 1] 1830 	ld a,(LL,sp)
      008B2C 08 27 41         [ 1] 1831 	ld count,a 
      000B1B                       1832 	_drop VSIZE 
      008B2F A1 04            [ 2]    1     addw sp,#VSIZE 
      008B31 27 2E            [ 1] 1833 	ld a,#CR
      008B33 A1 12 27         [ 4] 1834 	call putc
      008B36 06               [ 4] 1835 	ret
                                   1836 
                           000001  1837 .if DEBUG 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1838 ;----------------------------
                                   1839 ; command interface
                                   1840 ; only 3 commands:
                                   1841 ;  'q' to resume application
                                   1842 ;  'p [addr]' to print memory values 
                                   1843 ;  's addr' to print string 
                                   1844 ;----------------------------
                                   1845 ;local variable 
                           000001  1846 	PSIZE=1
                           000001  1847 	VSIZE=1 
      008B37                       1848 cmd_itf:
      008B37 A1 20            [ 2] 1849 	sub sp,#VSIZE 
      008B39 2A 44 20 DE      [ 1] 1850 	clr farptr 
      008B3D 72 5F 00 14      [ 1] 1851 	clr farptr+1 
      008B3D 72 5F 00 15      [ 1] 1852 	clr farptr+2  
      008B3D                       1853 repl:
      008B3D A6 0D            [ 1] 1854 	ld a,#CR 
      008B3D 72 5D 00         [ 4] 1855 	call putc 
      008B40 03 27            [ 1] 1856 	ld a,#'? 
      008B42 D8 0D 02         [ 4] 1857 	call putc
      008B45 26 D4 AE 16      [ 1] 1858 	clr in.w 
      008B49 C8 CD 82 30      [ 1] 1859 	clr in 
      008B4D 90 AE 16         [ 4] 1860 	call readln
      008B50 C8 C6 00 03      [ 2] 1861 	ldw y,#tib  
      008B54 6B 02            [ 1] 1862 	ld a,(y)
      008B56 72 5F            [ 1] 1863 	jreq repl  
      008B58 00 03 0F 01      [ 1] 1864 	inc in 
      008B5C 72 F9 01         [ 4] 1865 	call to_upper 
      008B5F 20 BA            [ 1] 1866 	cp a,#'Q 
      008B61 26 17            [ 1] 1867 	jrne test_p
      000B59                       1868 repl_exit:
      008B61 7B 02 CD 82      [ 1] 1869 	clr tib 
      008B65 4A 90 AE 16      [ 1] 1870 	clr count 
      008B69 C8 90 7F 0F      [ 1] 1871 	clr in 
      000B65                       1872 	_drop #VSIZE 	
      008B6D 02 20            [ 2]    1     addw sp,##VSIZE 
      008B6F AB               [ 4] 1873 	ret  
      008B70                       1874 invalid:
      008B70 0D 02 27         [ 2] 1875 	ldw x,#invalid_cmd 
      008B73 A7 0A 02         [ 4] 1876 	call puts 
      008B76 90 5A            [ 2] 1877 	jra repl 
      000B70                       1878 test_p:	
      008B78 90 7F            [ 1] 1879     cp a,#'P 
      008B7A CD 82            [ 1] 1880 	jreq mem_peek
      008B7C 3A 20            [ 1] 1881     cp a,#'S 
      008B7E 9C F0            [ 1] 1882 	jrne invalid 
      008B7F                       1883 print_string:	
      008B7F A6 4F 11         [ 4] 1884 	call get_token
      008B82 02 27            [ 1] 1885 	cp a,#TK_INTGR 
      008B84 96 7B            [ 1] 1886 	jrne invalid 
      008B86 01 90 F7         [ 4] 1887 	call puts
      008B89 0C 02 90         [ 2] 1888 	jp repl 	
      000B85                       1889 mem_peek:
      008B8C 5C 90            [ 1] 1890 	ld a,#SPACE 
      008B8E 7F CD 82         [ 4] 1891 	call skip  	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B91 1E 20 87 00      [ 2] 1892 	addw y,in.w 
      008B94 AE 17 18         [ 2] 1893 	ldw x,#pad 
      008B94 90 7F 7B         [ 4] 1894 	call strcpy
      008B97 02 C7 00         [ 4] 1895 	call atoi24 	
      008B9A 03 5B 02         [ 1] 1896 	ld a, acc24 
      008B9D A6 0D CD         [ 1] 1897 	or a,acc16 
      008BA0 82 1E 81         [ 1] 1898 	or a,acc8 
      008BA3 26 02            [ 1] 1899 	jrne 1$ 
      008BA3 52 01            [ 2] 1900 	jra peek_byte  
      008BA5 72 5F 00         [ 2] 1901 1$:	ldw x,acc24 
      008BA8 14 72 5F         [ 2] 1902 	ldw farptr,x 
      008BAB 00 15 72         [ 1] 1903 	ld a,acc8 
      008BAE 5F 00 16         [ 1] 1904 	ld farptr+2,a 
      008BB1                       1905 peek_byte:
      008BB1 A6 0D CD         [ 4] 1906 	call print_farptr 
      008BB4 82 1E            [ 1] 1907 	ld a,#8 
      008BB6 A6 3F            [ 1] 1908 	ld (PSIZE,sp),a 
      008BB8 CD               [ 1] 1909 	clrw x 
      008BB9 82 1E 72         [ 4] 1910 1$:	call fetchc  
      008BBC 5F               [ 2] 1911 	pushw x 
      008BBD 00 01 72         [ 1] 1912 	ld acc8,a 
      008BC0 5F               [ 1] 1913 	clrw x 
      008BC1 00 02 CD         [ 2] 1914 	ldw acc24,x 
      008BC4 8B 15            [ 1] 1915 	ld a,#16+128
      008BC6 90 AE 16         [ 4] 1916 	call prti24
      008BC9 C8               [ 2] 1917 	popw x 
      008BCA 90 F6            [ 1] 1918 	dec (PSIZE,sp)
      008BCC 27 E3            [ 1] 1919 	jrne 1$ 
      008BCE 72 5C            [ 1] 1920 	ld a,#8 
      008BD0 00 02 CD         [ 1] 1921 	add a,farptr+2 
      008BD3 8F 73 A1         [ 1] 1922 	ld farptr+2,a
      008BD6 51               [ 1] 1923 	clr a 
      008BD7 26 17 14         [ 1] 1924 	adc a,farptr+1 
      008BD9 C7 00 14         [ 1] 1925 	ld farptr+1,a 
      008BD9 72               [ 1] 1926 	clr a 
      008BDA 5F 16 C8         [ 1] 1927 	adc a,farptr 
      008BDD 72 5F 00         [ 1] 1928 	ld farptr,a 
      008BE0 03 72 5F         [ 2] 1929 	jp repl  
                                   1930 
      008BE3 00 02 5B 01 81 20 63  1931 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1932 
                                   1933 ;----------------------------
                                   1934 ; display farptr address
                                   1935 ;----------------------------
      008BE8                       1936 print_farptr:
      008BE8 AE 8C 66         [ 1] 1937 	ld a ,farptr+2 
      008BEB CD 82 30         [ 1] 1938 	ld acc8,a 
      008BEE 20 C1 13         [ 2] 1939 	ldw x,farptr 
      008BF0 CF 00 08         [ 2] 1940 	ldw acc24,x 
      008BF0 A1               [ 1] 1941 	clrw x 
      008BF1 50 27            [ 1] 1942 	ld a,#16 
      008BF3 11 A1 53         [ 4] 1943 	call prti24
      008BF6 26 F0            [ 1] 1944 	ld a,#SPACE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008BF8 CD 01 9E         [ 4] 1945 	call putc 
      008BF8 CD 8D B4         [ 4] 1946 	call putc 
      008BFB A1               [ 4] 1947 	ret
                                   1948 
                                   1949 ;------------------------------------
                                   1950 ; get byte at address farptr[X]
                                   1951 ; input:
                                   1952 ;	 farptr   address to peek
                                   1953 ;    X		  farptr index 	
                                   1954 ; output:
                                   1955 ;	 A 		  byte from memory  
                                   1956 ;    x		  incremented by 1
                                   1957 ;------------------------------------
      000C10                       1958 fetchc: ; @C
      008BFC 03 26 E9 CD      [ 5] 1959 	ldf a,([farptr],x)
      008C00 82               [ 1] 1960 	incw x
      008C01 30               [ 4] 1961 	ret
                                   1962 
                                   1963 
                                   1964 ;------------------------------------
                                   1965 ; expect a number from command line 
                                   1966 ; next argument
                                   1967 ;  input:
                                   1968 ;	  none
                                   1969 ;  output:
                                   1970 ;    acc24   int24_t 
                                   1971 ;------------------------------------
      000C16                       1972 number::
      008C02 CC 8B B1         [ 4] 1973 	call get_token
      008C05 CD 0E FF         [ 4] 1974 	call atoi24
      008C05 A6               [ 4] 1975 	ret
                                   1976 .endif ; DEBUG 
                                   1977 
                                   1978 ;------------------------------------
                                   1979 ; parse quoted string 
                                   1980 ; input:
                                   1981 ;   Y 	pointer to tib 
                                   1982 ;   X   pointer to pad
                                   1983 ; output:
                                   1984 ;	pad   parsed string
                                   1985 ;   TOS  char* to pad  
                                   1986 ;------------------------------------
                           000001  1987 	PREV = 1
                           000002  1988 	CURR =2 
                           000002  1989 	VSIZE=2 
      000C1D                       1990 parse_quote: ; { -- addr }
      000C1D                       1991 	_vars VSIZE 
      008C06 20 CD            [ 2]    1     sub sp,#VSIZE 
      008C08 90               [ 1] 1992 	clr a
      008C09 2B 72            [ 1] 1993 1$:	ld (PREV,sp),a 
      008C0B B9 00 01 AE      [ 1] 1994 2$:	inc in
      008C0F 17 18 CD         [ 4] 1995 	ld a,([in.w],y)
      008C12 83 10            [ 1] 1996 	jreq 6$
      008C14 CD 8F            [ 1] 1997 	ld (CURR,sp),a 
      008C16 7F C6            [ 1] 1998 	ld a,#'\
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008C18 00 09            [ 1] 1999 	cp a, (PREV,sp)
      008C1A CA 00            [ 1] 2000 	jrne 3$
      008C1C 0A CA            [ 1] 2001 	clr (PREV,sp)
      008C1E 00 0B            [ 1] 2002 	ld a,(CURR,sp)
      008C20 26 02            [ 4] 2003 	callr convert_escape
      008C22 20               [ 1] 2004 	ld (x),a 
      008C23 0C               [ 1] 2005 	incw x 
      008C24 CE 00            [ 2] 2006 	jra 2$
      000C3D                       2007 3$:
      008C26 09 CF            [ 1] 2008 	ld a,(CURR,sp)
      008C28 00 14            [ 1] 2009 	cp a,#'\'
      008C2A C6 00            [ 1] 2010 	jreq 1$
      008C2C 0B C7            [ 1] 2011 	cp a,#'"
      008C2E 00 16            [ 1] 2012 	jreq 5$ 
      008C30 F7               [ 1] 2013 	ld (x),a 
      008C30 CD               [ 1] 2014 	incw x 
      008C31 8C 75            [ 2] 2015 	jra 2$
      008C33 A6 08 6B 01      [ 1] 2016 5$:	inc in 
      008C37 5F               [ 1] 2017 6$: clr (x)
      008C38 CD 8C 90         [ 2] 2018 	ldw x,#pad 
      000C53                       2019 	_drop VSIZE
      008C3B 89 C7            [ 2]    1     addw sp,#VSIZE 
      008C3D 00 0B            [ 1] 2020 	ld a,#TK_QSTR  
      008C3F 5F               [ 4] 2021 	ret 
                                   2022 
                                   2023 ;---------------------------------------
                                   2024 ; called by parse_quote
                                   2025 ; subtitute escaped character 
                                   2026 ; by their ASCII value .
                                   2027 ; input:
                                   2028 ;   A  character following '\'
                                   2029 ; output:
                                   2030 ;   A  substitued char or same if not valid.
                                   2031 ;---------------------------------------
      000C58                       2032 convert_escape:
      008C40 CF 00            [ 1] 2033 	cp a,#'a'
      008C42 09 A6            [ 1] 2034 	jrne 1$
      008C44 90 CD            [ 1] 2035 	ld a,#7
      008C46 89               [ 4] 2036 	ret 
      008C47 DF 85            [ 1] 2037 1$: cp a,#'b'
      008C49 0A 01            [ 1] 2038 	jrne 2$
      008C4B 26 EB            [ 1] 2039 	ld a,#8
      008C4D A6               [ 4] 2040 	ret 
      008C4E 08 CB            [ 1] 2041 2$: cp a,#'e' 
      008C50 00 16            [ 1] 2042     jrne 3$
      008C52 C7 00            [ 1] 2043 	ld a,#'\'
      008C54 16               [ 4] 2044 	ret  
      008C55 4F C9            [ 1] 2045 3$: cp a,#'\'
      008C57 00 15            [ 1] 2046 	jrne 4$
      008C59 C7 00            [ 1] 2047 	ld a,#'\'
      008C5B 15               [ 4] 2048 	ret 
      008C5C 4F C9            [ 1] 2049 4$: cp a,#'f' 
      008C5E 00 14            [ 1] 2050 	jrne 5$ 
      008C60 C7 00            [ 1] 2051 	ld a,#FF 
      008C62 14               [ 4] 2052 	ret  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C63 CC 8B            [ 1] 2053 5$: cp a,#'n' 
      008C65 B1 6E            [ 1] 2054     jrne 6$ 
      008C67 6F 74            [ 1] 2055 	ld a,#0xa 
      008C69 20               [ 4] 2056 	ret  
      008C6A 61 20            [ 1] 2057 6$: cp a,#'r' 
      008C6C 63 6F            [ 1] 2058 	jrne 7$
      008C6E 6D 6D            [ 1] 2059 	ld a,#0xd 
      008C70 61               [ 4] 2060 	ret  
      008C71 6E 64            [ 1] 2061 7$: cp a,#'t' 
      008C73 0A 00            [ 1] 2062 	jrne 8$ 
      008C75 A6 09            [ 1] 2063 	ld a,#9 
      008C75 C6               [ 4] 2064 	ret  
      008C76 00 16            [ 1] 2065 8$: cp a,#'v' 
      008C78 C7 00            [ 1] 2066 	jrne 9$  
      008C7A 0B CE            [ 1] 2067 	ld a,#0xb 
      008C7C 00               [ 4] 2068 9$:	ret 
                                   2069 
                                   2070 ;-------------------------
                                   2071 ; integer parser 
                                   2072 ; input:
                                   2073 ;   X 		point to pad 
                                   2074 ;   Y 		point to tib 
                                   2075 ;   A 	    first digit|'$' 
                                   2076 ; output:  
                                   2077 ;   pad     number string 
                                   2078 ;   X 		integer 
                                   2079 ;   A 		TK_INTGR
                                   2080 ;-------------------------
                           000001  2081 	BASE=1
                           000002  2082 	TCHAR=2 
                           000002  2083 	VSIZE=2 
      000C97                       2084 parse_integer: ; { -- n }
      008C7D 14 CF            [ 1] 2085 	push #0 ; TCHAR 
      008C7F 00 09            [ 1] 2086 	cp a,#'$
      008C81 5F A6            [ 1] 2087 	jreq 1$ 
      008C83 10 CD            [ 1] 2088 	push #10 ; BASE=10 
      008C85 89 DF            [ 2] 2089 	jra 2$ 
      008C87 A6 20            [ 1] 2090 1$: push #16  ; BASE=16
      008C89 CD               [ 1] 2091 2$:	ld (x),a 
      008C8A 82               [ 1] 2092 	incw x 
      008C8B 1E CD 82 1E      [ 1] 2093 	inc in 
      008C8F 81 D6 00         [ 4] 2094 	ld a,([in.w],y)
      008C90 CD 0E F3         [ 4] 2095 	call to_upper 
      008C90 92 AF            [ 1] 2096 	ld (TCHAR,sp),a 
      008C92 00 14 5C         [ 4] 2097 	call is_digit 
      008C95 81 ED            [ 1] 2098 	jrc 2$
      008C96 A6 10            [ 1] 2099 	ld a,#16 
      008C96 CD 8D            [ 1] 2100 	cp a,(BASE,sp)
      008C98 B4 CD            [ 1] 2101 	jrne 3$ 
      008C9A 8F 7F            [ 1] 2102 	ld a,(TCHAR,sp)
      008C9C 81 41            [ 1] 2103 	cp a,#'A 
      008C9D 2B 04            [ 1] 2104 	jrmi 3$ 
      008C9D 52 02            [ 1] 2105 	cp a,#'G 
      008C9F 4F 6B            [ 1] 2106 	jrmi 2$ 
      008CA1 01               [ 1] 2107 3$:	clr (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008CA2 72 5C 00         [ 4] 2108 	call atoi24
      008CA5 02 91 D6         [ 2] 2109 	ldw x,acc16 
      008CA8 01 27            [ 1] 2110 	ld a,#TK_INTGR
      000CCF                       2111 	_drop VSIZE  
      008CAA 24 6B            [ 2]    1     addw sp,#VSIZE 
      008CAC 02               [ 4] 2112 	ret 	
                                   2113 
                                   2114 ;-------------------------
                                   2115 ; binary integer parser 
                                   2116 ; input:
                                   2117 ;   X 		point to pad 
                                   2118 ;   Y 		point to tib 
                                   2119 ;   A 	    '%' 
                                   2120 ; output:  
                                   2121 ;   pad     number string 
                                   2122 ;   X 		integer 
                                   2123 ;   A 		TK_INTGR
                                   2124 ;   TOS     integer 
                                   2125 ;-------------------------
                           000001  2126 	BINARY=1
                           000002  2127 	VSIZE=2
      000CD2                       2128 parse_binary: ; { -- n }
      008CAD A6 5C            [ 1] 2129 	push #0
      008CAF 11 01            [ 1] 2130 	push #0
      008CB1 26               [ 1] 2131 1$: ld (x),a 
      008CB2 0A               [ 1] 2132 	incw x 
      008CB3 0F 01 7B 02      [ 1] 2133 	inc in 
      008CB7 AD 1F F7         [ 4] 2134 	ld a,([in.w],y)
      008CBA 5C 20            [ 1] 2135 	cp a,#'0 
      008CBC E5 06            [ 1] 2136 	jreq 2$
      008CBD A1 31            [ 1] 2137 	cp a,#'1 
      008CBD 7B 02            [ 1] 2138 	jreq 2$ 
      008CBF A1 5C            [ 2] 2139 	jra bin_exit 
      008CC1 27 DD            [ 1] 2140 2$: sub a,#'0	
      008CC3 A1               [ 1] 2141 	rrc a 
      008CC4 22 27            [ 1] 2142 	rlc (BINARY+1,sp)
      008CC6 04 F7            [ 1] 2143 	rlc (BINARY,sp)
      008CC8 5C 20            [ 2] 2144 	jra 1$  
      000CF2                       2145 bin_exit:
      008CCA D7               [ 1] 2146 	clr (x)
      008CCB 72 5C            [ 2] 2147 	ldw x,(BINARY,sp)
      008CCD 00 02            [ 1] 2148 	ld a,#TK_INTGR 	
      000CF7                       2149 	_drop VSIZE 
      008CCF 7F AE            [ 2]    1     addw sp,#VSIZE 
      008CD1 17               [ 4] 2150 	ret
                                   2151 
                                   2152 ;---------------------------
                                   2153 ;  token begin with a letter,
                                   2154 ;  is keyword or variable. 	
                                   2155 ; input:
                                   2156 ;   X 		point to pad 
                                   2157 ;   Y 		point to text
                                   2158 ;   A 	    first letter  
                                   2159 ; output:
                                   2160 ;   X		exec_addr|var_addr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2161 ;   A 		TK_CMD 
                                   2162 ;   pad 	keyword|var_name  
                                   2163 ;   TOS     exec_addr|var_addr 
                                   2164 ;--------------------------  
      000CFA                       2165 parse_keyword: ; { -- exec_addr|var_addr}
      008CD2 18 5B 02         [ 4] 2166 	call to_upper 
      008CD5 A6               [ 1] 2167 	ld (x),a 
      008CD6 08               [ 1] 2168 	incw x 
      008CD7 81 5C 00 01      [ 1] 2169 	inc in 
      008CD8 91 D6 00         [ 4] 2170 	ld a,([in.w],y)
      008CD8 A1 61 26         [ 4] 2171 	call is_alpha 
      008CDB 03 A6            [ 1] 2172 	jrc parse_keyword 
      008CDD 07               [ 1] 2173 1$: clr (x)
      008CDE 81 A1 62 26      [ 1] 2174 	tnz pad+1 
      008CE2 03 A6            [ 1] 2175 	jrne 2$
                                   2176 ; one letter variable name 
      008CE4 08 81 A1         [ 1] 2177 	ld a,pad 
      008CE7 65 26            [ 1] 2178 	sub a,#'A 
      008CE9 03               [ 1] 2179 	sll a 
      008CEA A6               [ 1] 2180 	push a 
      008CEB 5C 81            [ 1] 2181 	push #0
      008CED A1 5C 26         [ 2] 2182 	ldw x,#vars 
      008CF0 03 A6 5C         [ 2] 2183 	addw x,(1,sp) ; X=var address 
      000D21                       2184 	_drop 2 
      008CF3 81 A1            [ 2]    1     addw sp,#2 
      008CF5 66 26            [ 1] 2185 	ld a,#TK_VAR 
      008CF7 03 A6            [ 2] 2186 	jra 4$ 
      000D27                       2187 2$: ; check for keyword, otherwise syntax error.
      000D27                       2188 	_ldx_dict kword_dict
      008CF9 0C 81 A1         [ 2]    1     ldw x,#kword_dict+2
      008CFC 6E 26 03         [ 4] 2189 	call search_dict
      008CFF A6               [ 1] 2190 	tnz a
      008D00 0A 81            [ 1] 2191 	jrne 4$ 
      008D02 A1 72 26         [ 2] 2192 	jp syntax_error
      008D05 03               [ 4] 2193 4$:	ret  	
                                   2194 
                                   2195 
                                   2196 ;------------------------------------
                                   2197 ; Command line tokenizer
                                   2198 ; scan text for next token
                                   2199 ; move token in 'pad'
                                   2200 ; input: 
      000D34                       2201 	none: 
                                   2202 ; use:
                                   2203 ;	Y   pointer to text
                                   2204 ;   X	pointer to pad 
                                   2205 ;   in.w   index in text buffer
                                   2206 ; output:
                                   2207 ;   A       token attribute 
                                   2208 ;   pad 	token as .asciz
                                   2209 ;   X 		token value   
                                   2210 ;------------------------------------
                                   2211 	; use to check special character 
                                   2212 	.macro _case c t  
                                   2213 	ld a,#c 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



                                   2214 	cp a,(TCHAR,sp) 
                                   2215 	jrne t
                                   2216 	.endm 
                                   2217 
                           000001  2218 	TCHAR=1
                           000002  2219 	ATTRIB=2 
                           000002  2220 	VSIZE=2
      000D34                       2221 get_token: 
      008D06 A6 0D 81 A1      [ 2] 2222 	ldw y,#tib    	
      008D0A 74 26 03         [ 1] 2223 	ld a,in 
      008D0D A6 09 81         [ 1] 2224 	cp a,count 
      008D10 A1 76            [ 1] 2225 	jrmi 1$
      008D12 26 02            [ 1] 2226 	ld a,#TK_NONE 
      008D14 A6               [ 4] 2227 	ret 
      000D43                       2228 1$:	
      000D43                       2229 	_vars VSIZE
      008D15 0B 81            [ 2]    1     sub sp,#VSIZE 
      008D17 AE 17 18         [ 2] 2230 	ldw x, #pad
      008D17 4B 00            [ 1] 2231 	ld a,#SPACE
      008D19 A1 24 27         [ 4] 2232 	call skip
      008D1C 04 4B 0A         [ 2] 2233 	ldw in.w.saved,x 
      008D1F 20 02 4B         [ 4] 2234 	ld a,([in.w],y)
      008D22 10 F7            [ 1] 2235 	jrne str_tst
      008D24 5C 72 5C 00      [ 1] 2236 	clr pad 
      008D28 02 91 D6         [ 2] 2237 	jp token_exit ; end of line 
                                   2238 
      000D5C                       2239 str_tst: ; check for quoted string  	
      008D2B 01 CD 8F         [ 4] 2240 	call to_upper 
      008D2E 73 6B            [ 1] 2241 	ld (TCHAR,sp),a 
      000D61                       2242 	_case '"' nbr_tst
      008D30 02 CD            [ 1]    1 	ld a,#'"' 
      008D32 8F 6A            [ 1]    2 	cp a,(TCHAR,sp) 
      008D34 25 ED            [ 1]    3 	jrne nbr_tst
      008D36 A6 10 11         [ 4] 2243 	call parse_quote
      008D39 01 26 0A         [ 2] 2244 	jp token_exit
      000D6D                       2245 nbr_tst: ; check for number 
      008D3C 7B 02            [ 1] 2246 	ld a,#'$'
      008D3E A1 41            [ 1] 2247 	cp a,(TCHAR,sp) 
      008D40 2B 04            [ 1] 2248 	jreq 1$
      008D42 A1 47            [ 1] 2249 	ld a,#'&
      008D44 2B DD            [ 1] 2250 	cp a,(TCHAR,sp)
      008D46 7F CD            [ 1] 2251 	jrne 0$
      008D48 8F 7F CE         [ 4] 2252 	call parse_binary ; expect binary integer 
      008D4B 00 0A A6         [ 2] 2253 	jp token_exit 
      008D4E 03 5B            [ 1] 2254 0$:	ld a,(TCHAR,sp)
      008D50 02 81 EA         [ 4] 2255 	call is_digit
      008D52 24 06            [ 1] 2256 	jrnc 3$
      008D52 4B 00 4B         [ 4] 2257 1$:	call parse_integer 
      008D55 00 F7 5C         [ 2] 2258 	jp token_exit 
      000D8C                       2259 3$: 
      000D8C                       2260 	_case '(' bkslsh_tst 
      008D58 72 5C            [ 1]    1 	ld a,#'(' 
      008D5A 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D5C 91 D6            [ 1]    3 	jrne bkslsh_tst
      008D5E 01 A1            [ 1] 2261 	ld a,#TK_LPAREN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D60 30 27 06         [ 2] 2262 	jp token_char   	
      000D97                       2263 bkslsh_tst:
      000D97                       2264 	_case '\',rparnt_tst
      008D63 A1 31            [ 1]    1 	ld a,#'\' 
      008D65 27 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D67 20 09            [ 1]    3 	jrne rparnt_tst
      008D69 A0 30            [ 1] 2265 	ld a,(TCHAR,sp)
      008D6B 46               [ 1] 2266 	ld (x),a 
      008D6C 09               [ 1] 2267 	incw x 
      008D6D 02 09 01 20      [ 1] 2268 	inc in 
      008D71 E4 D6 00         [ 4] 2269 	ld a,([in.w],y)
      008D72 F7               [ 1] 2270 	ld (x),a 
      008D72 7F               [ 1] 2271 	incw x 
      008D73 1E 01 A6 03      [ 1] 2272 	inc in  
      008D77 5B               [ 1] 2273 	clr (x) 
      008D78 02               [ 1] 2274 	ld xl,a 
      008D79 81 02            [ 1] 2275 	ld a,#TK_CHAR 
      008D7A CC 0E E7         [ 2] 2276 	jp token_exit 
      000DB5                       2277 rparnt_tst:		
      000DB5                       2278 	_case ')' colon_tst 
      008D7A CD 8F            [ 1]    1 	ld a,#')' 
      008D7C 73 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008D7E 5C 72            [ 1]    3 	jrne colon_tst
      008D80 5C 00            [ 1] 2279 	ld a,#TK_RPAREN 
      008D82 02 91 D6         [ 2] 2280 	jp token_char 
      000DC0                       2281 colon_tst:
      000DC0                       2282 	_case ':' comma_tst 
      008D85 01 CD            [ 1]    1 	ld a,#':' 
      008D87 85 8E            [ 1]    2 	cp a,(TCHAR,sp) 
      008D89 25 EF            [ 1]    3 	jrne comma_tst
      008D8B 7F 72            [ 1] 2283 	ld a,#TK_COLON 
      008D8D 5D 17 19         [ 2] 2284 	jp token_char 
      000DCB                       2285 comma_tst:
      000DCB                       2286 	_case COMMA sharp_tst 
      008D90 26 15            [ 1]    1 	ld a,#COMMA 
      008D92 C6 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008D94 18 A0            [ 1]    3 	jrne sharp_tst
      008D96 41 48            [ 1] 2287 	ld a,#TK_COMMA
      008D98 88 4B 00         [ 2] 2288 	jp token_char
      000DD6                       2289 sharp_tst:
      000DD6                       2290 	_case SHARP dash_tst 
      008D9B AE 00            [ 1]    1 	ld a,#SHARP 
      008D9D 27 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008D9F FB 01            [ 1]    3 	jrne dash_tst
      008DA1 5B 02            [ 1] 2291 	ld a,#TK_SHARP
      008DA3 A6 04 20         [ 2] 2292 	jp token_char  	 	 
      000DE1                       2293 dash_tst: 	
      000DE1                       2294 	_case '-' at_tst 
      008DA6 0C 2D            [ 1]    1 	ld a,#'-' 
      008DA7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA7 AE A1            [ 1]    3 	jrne at_tst
      008DA9 D0 CD            [ 1] 2295 	ld a,#TK_MINUS  
      008DAB 92 10 4D         [ 2] 2296 	jp token_char 
      000DEC                       2297 at_tst:
      000DEC                       2298 	_case '@' qmark_tst 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008DAE 26 03            [ 1]    1 	ld a,#'@' 
      008DB0 CC 87            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB2 A2 81            [ 1]    3 	jrne qmark_tst
      008DB4 A6 05            [ 1] 2299 	ld a,#TK_ARRAY 
      008DB4 CC 0E D7         [ 2] 2300 	jp token_char
      000DF7                       2301 qmark_tst:
      000DF7                       2302 	_case '?' tick_tst 
      008DB4 90 AE            [ 1]    1 	ld a,#'?' 
      008DB6 16 C8            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB8 C6 00            [ 1]    3 	jrne tick_tst
      008DBA 02 C1            [ 1] 2303 	ld a,(TCHAR,sp)
      008DBC 00               [ 1] 2304 	ld (x),a 
      008DBD 03               [ 1] 2305 	incw x 
      008DBE 2B               [ 1] 2306 	clr (x)
      008DBF 03 A6 00 81      [ 1] 2307 	inc in 
      008DC3 A6 06            [ 1] 2308 	ld a,#TK_CMD 
      008DC3 52 02 AE         [ 2] 2309 	ldw x,#print 
      008DC6 17 18 A6         [ 2] 2310 	jp token_exit
      000E0E                       2311 tick_tst: ; ignore comment 
      000E0E                       2312 	_case TICK plus_tst 
      008DC9 20 CD            [ 1]    1 	ld a,#TICK 
      008DCB 90 2B            [ 1]    2 	cp a,(TCHAR,sp) 
      008DCD CF 00            [ 1]    3 	jrne plus_tst
      008DCF 12 91 D6 01      [ 1] 2313 	inc in 
      008DD3 26 07            [ 1] 2314 	ld a,#TK_CMD 
      008DD5 72 5F 17         [ 2] 2315 	ldw x,#rem 
      008DD8 18 CC 8F         [ 2] 2316 	jp token_exit 
      000E20                       2317 plus_tst:
      000E20                       2318 	_case '+' star_tst 
      008DDB 67 2B            [ 1]    1 	ld a,#'+' 
      008DDC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DDC CD 8F            [ 1]    3 	jrne star_tst
      008DDE 73 6B            [ 1] 2319 	ld a,#TK_PLUS  
      008DE0 01 A6 22         [ 2] 2320 	jp token_char 
      000E2B                       2321 star_tst:
      000E2B                       2322 	_case '*' slash_tst 
      008DE3 11 01            [ 1]    1 	ld a,#'*' 
      008DE5 26 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE7 CD 8C            [ 1]    3 	jrne slash_tst
      008DE9 9D CC            [ 1] 2323 	ld a,#TK_MULT 
      008DEB 8F 67 D7         [ 2] 2324 	jp token_char 
      008DED                       2325 slash_tst: 
      000E36                       2326 	_case '/' prcnt_tst 
      008DED A6 24            [ 1]    1 	ld a,#'/' 
      008DEF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF1 27 13            [ 1]    3 	jrne prcnt_tst
      008DF3 A6 26            [ 1] 2327 	ld a,#TK_DIV 
      008DF5 11 01 26         [ 2] 2328 	jp token_char 
      000E41                       2329 prcnt_tst:
      000E41                       2330 	_case '%' eql_tst 
      008DF8 06 CD            [ 1]    1 	ld a,#'%' 
      008DFA 8D 52            [ 1]    2 	cp a,(TCHAR,sp) 
      008DFC CC 8F            [ 1]    3 	jrne eql_tst
      008DFE 67 7B            [ 1] 2331 	ld a,#TK_MOD
      008E00 01 CD 8F         [ 2] 2332 	jp token_char  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2333 ; 1 or 2 character tokens 	
      000E4C                       2334 eql_tst:
      000E4C                       2335 	_case '=' gt_tst 		
      008E03 6A 24            [ 1]    1 	ld a,#'=' 
      008E05 06 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008E07 8D 17            [ 1]    3 	jrne gt_tst
      008E09 CC 8F            [ 1] 2336 	ld a,#TK_EQUAL
      008E0B 67 0E D7         [ 2] 2337 	jp token_char 
      008E0C                       2338 gt_tst:
      000E57                       2339 	_case '>' lt_tst 
      008E0C A6 28            [ 1]    1 	ld a,#'>' 
      008E0E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E10 26 05            [ 1]    3 	jrne lt_tst
      008E12 A6 09            [ 1] 2340 	ld a,#TK_GT 
      008E14 CC 8F            [ 1] 2341 	ld (ATTRIB,sp),a 
      008E16 57 5C 00 01      [ 1] 2342 	inc in 
      008E17 91 D6 00         [ 4] 2343 	ld a,([in.w],y)
      008E17 A6 5C            [ 1] 2344 	cp a,#'=
      008E19 11 01            [ 1] 2345 	jrne 1$
      008E1B 26 18            [ 1] 2346 	ld a,(TCHAR,sp)
      008E1D 7B               [ 1] 2347 	ld (x),a
      008E1E 01               [ 1] 2348 	incw x 
      008E1F F7 5C            [ 1] 2349 	ld a,#'=
      008E21 72 5C            [ 1] 2350 	ld (TCHAR,sp),a 
      008E23 00 02            [ 1] 2351 	ld a,#TK_GE 
      008E25 91 D6            [ 2] 2352 	jra token_char  
      008E27 01 F7            [ 1] 2353 1$: cp a,#'<
      008E29 5C 72            [ 1] 2354 	jrne 2$
      008E2B 5C 00            [ 1] 2355 	ld a,(TCHAR,sp)
      008E2D 02               [ 1] 2356 	ld (x),a
      008E2E 7F               [ 1] 2357 	incw x 
      008E2F 97 A6            [ 1] 2358 	ld a,#'<	
      008E31 02 CC            [ 1] 2359 	ld (TCHAR,sp),a 
      008E33 8F 67            [ 1] 2360 	ld a,#TK_NE 
      008E35 20 4F            [ 2] 2361 	jra token_char 
      008E35 A6 29 11 01      [ 1] 2362 2$: dec in
      008E39 26 05            [ 1] 2363 	ld a,(ATTRIB,sp)
      008E3B A6 0A            [ 2] 2364 	jra token_char 
      000E90                       2365 lt_tst:
      000E90                       2366 	_case '<' other
      008E3D CC 8F            [ 1]    1 	ld a,#'<' 
      008E3F 57 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E40 26 32            [ 1]    3 	jrne other
      008E40 A6 3A            [ 1] 2367 	ld a,#TK_LT 
      008E42 11 01            [ 1] 2368 	ld (ATTRIB,sp),a 
      008E44 26 05 A6 01      [ 1] 2369 	inc in 
      008E48 CC 8F 57         [ 4] 2370 	ld a,([in.w],y)
      008E4B A1 3D            [ 1] 2371 	cp a,#'=
      008E4B A6 2C            [ 1] 2372 	jrne 1$
      008E4D 11 01            [ 1] 2373 	ld a,(TCHAR,sp)
      008E4F 26               [ 1] 2374 	ld (x),a 
      008E50 05 A6            [ 1] 2375 	ld a,#'=
      008E52 0B CC            [ 1] 2376 	ld (TCHAR,sp),a 
      008E54 8F 57            [ 1] 2377 	ld a,#TK_LE 
      008E56 20 27            [ 2] 2378 	jra token_char 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E56 A6 23            [ 1] 2379 1$: cp a,#'>
      008E58 11 01            [ 1] 2380 	jrne 2$
      008E5A 26 05            [ 1] 2381 	ld a,(TCHAR,sp)
      008E5C A6               [ 1] 2382 	ld (x),a 
      008E5D 0C               [ 1] 2383 	incw x 
      008E5E CC 8F            [ 1] 2384 	ld a,#'>
      008E60 57 01            [ 1] 2385 	ld (TCHAR,sp),a 
      008E61 A6 35            [ 1] 2386 	ld a,#TK_NE 
      008E61 A6 2D            [ 2] 2387 	jra token_char 
      008E63 11 01 26 05      [ 1] 2388 2$: dec in 
      008E67 A6 11            [ 1] 2389 	ld a,(ATTRIB,sp)
      008E69 CC 8F            [ 2] 2390 	jra token_char 	
      000EC8                       2391 other: ; not a special character 	 
      008E6B 57 01            [ 1] 2392 	ld a,(TCHAR,sp)
      008E6C CD 05 0E         [ 4] 2393 	call is_alpha 
      008E6C A6 40            [ 1] 2394 	jrc 30$ 
      008E6E 11 01 26         [ 2] 2395 	jp syntax_error 
      000ED2                       2396 30$: 
      008E71 05 A6 05         [ 4] 2397 	call parse_keyword
      008E74 CC 8F            [ 2] 2398 	jra token_exit 
      000ED7                       2399 token_char:
      008E76 57 02            [ 1] 2400 	ld (ATTRIB,sp),a 
      008E77 7B 01            [ 1] 2401 	ld a,(TCHAR,sp)
      008E77 A6               [ 1] 2402 	ld (x),a 
      008E78 3F               [ 1] 2403 	incw x 
      008E79 11               [ 1] 2404 	clr(x)
      008E7A 01 26 11 7B      [ 1] 2405 	inc in 
      008E7E 01 F7            [ 1] 2406 	ld a,(ATTRIB,sp)
      008E80 5C 7F 72         [ 2] 2407 	ldw x,#pad 
      000EE7                       2408 token_exit:
      000EE7                       2409 	_drop VSIZE 
      008E83 5C 00            [ 2]    1     addw sp,#VSIZE 
      008E85 02               [ 4] 2410 	ret
                                   2411 
                                   2412 
                                   2413 
                                   2414 ;------------------------------------
                                   2415 ; check if character in {'0'..'9'}
                                   2416 ; input:
                                   2417 ;    A  character to test
                                   2418 ; output:
                                   2419 ;    Carry  0 not digit | 1 digit
                                   2420 ;------------------------------------
      000EEA                       2421 is_digit:
      008E86 A6 06            [ 1] 2422 	cp a,#'0
      008E88 AE 96            [ 1] 2423 	jrc 1$
      008E8A 77 CC            [ 1] 2424     cp a,#'9+1
      008E8C 8F               [ 1] 2425 	ccf 
      008E8D 67               [ 1] 2426 1$:	ccf 
      008E8E 81               [ 4] 2427     ret
                                   2428 
                                   2429 ;------------------------------------
                                   2430 ; convert alpha to uppercase
                                   2431 ; input:
                                   2432 ;    a  character to convert
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2433 ; output:
                                   2434 ;    a  uppercase character
                                   2435 ;------------------------------------
      000EF3                       2436 to_upper::
      008E8E A6 27            [ 1] 2437 	cp a,#'a
      008E90 11 01            [ 1] 2438 	jrpl 1$
      008E92 26               [ 4] 2439 0$:	ret
      008E93 0C 72            [ 1] 2440 1$: cp a,#'z	
      008E95 5C 00            [ 1] 2441 	jrugt 0$
      008E97 02 A6            [ 1] 2442 	sub a,#32
      008E99 06               [ 4] 2443 	ret
                                   2444 	
                                   2445 ;------------------------------------
                                   2446 ; convert pad content in integer
                                   2447 ; input:
                                   2448 ;    pad		.asciz to convert
                                   2449 ; output:
                                   2450 ;    acc24      int24_t
                                   2451 ;------------------------------------
                                   2452 	; local variables
                           000001  2453 	SIGN=1 ; 1 byte, 
                           000002  2454 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2455 	TEMP=3 ; 1 byte, temporary storage
                           000003  2456 	VSIZE=3 ; 3 bytes reserved for local storage
      000EFF                       2457 atoi24:
      008E9A AE               [ 2] 2458 	pushw x ;save x
      008E9B 97 85            [ 2] 2459 	sub sp,#VSIZE
                                   2460 	; acc24=0 
      008E9D CC 8F 67 08      [ 1] 2461 	clr acc24    
      008EA0 72 5F 00 09      [ 1] 2462 	clr acc16
      008EA0 A6 2B 11 01      [ 1] 2463 	clr acc8 
      008EA4 26 05 A6         [ 1] 2464 	ld a, pad 
      008EA7 10 CC            [ 1] 2465 	jreq atoi_exit
      008EA9 8F 57            [ 1] 2466 	clr (SIGN,sp)
      008EAB A6 0A            [ 1] 2467 	ld a,#10
      008EAB A6 2A            [ 1] 2468 	ld (BASE,sp),a ; default base decimal
      008EAD 11 01 26         [ 2] 2469 	ldw x,#pad ; pointer to string to convert
      008EB0 05               [ 1] 2470 	ld a,(x)
      008EB1 A6 20            [ 1] 2471 	jreq 9$  ; completed if 0
      008EB3 CC 8F            [ 1] 2472 	cp a,#'-
      008EB5 57 04            [ 1] 2473 	jrne 1$
      008EB6 03 01            [ 1] 2474 	cpl (SIGN,sp)
      008EB6 A6 2F            [ 2] 2475 	jra 2$
      008EB8 11 01            [ 1] 2476 1$: cp a,#'$
      008EBA 26 05            [ 1] 2477 	jrne 3$
      008EBC A6 21            [ 1] 2478 	ld a,#16
      008EBE CC 8F            [ 1] 2479 	ld (BASE,sp),a
      008EC0 57               [ 1] 2480 2$:	incw x
      008EC1 F6               [ 1] 2481 	ld a,(x)
      000F31                       2482 3$:	
      008EC1 A6 25            [ 1] 2483 	cp a,#'a
      008EC3 11 01            [ 1] 2484 	jrmi 4$
      008EC5 26 05            [ 1] 2485 	sub a,#32
      008EC7 A6 22            [ 1] 2486 4$:	cp a,#'0
      008EC9 CC 8F            [ 1] 2487 	jrmi 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008ECB 57 30            [ 1] 2488 	sub a,#'0
      008ECC A1 0A            [ 1] 2489 	cp a,#10
      008ECC A6 3D            [ 1] 2490 	jrmi 5$
      008ECE 11 01            [ 1] 2491 	sub a,#7
      008ED0 26 05            [ 1] 2492 	cp a,(BASE,sp)
      008ED2 A6 32            [ 1] 2493 	jrpl 9$
      008ED4 CC 8F            [ 1] 2494 5$:	ld (TEMP,sp),a
      008ED6 57 02            [ 1] 2495 	ld a,(BASE,sp)
      008ED7 CD 0F 71         [ 4] 2496 	call mulu24_8
      008ED7 A6 3E            [ 1] 2497 	ld a,(TEMP,sp)
      008ED9 11 01 26         [ 1] 2498 	add a,acc24+2
      008EDC 33 A6 31         [ 1] 2499 	ld acc24+2,a
      008EDF 6B               [ 1] 2500 	clr a
      008EE0 02 72 5C         [ 1] 2501 	adc a,acc24+1
      008EE3 00 02 91         [ 1] 2502 	ld acc24+1,a
      008EE6 D6               [ 1] 2503 	clr a
      008EE7 01 A1 3D         [ 1] 2504 	adc a,acc24
      008EEA 26 0C 7B         [ 1] 2505 	ld acc24,a
      008EED 01 F7            [ 2] 2506 	jra 2$
      008EEF 5C A6            [ 1] 2507 9$:	tnz (SIGN,sp)
      008EF1 3D 6B            [ 1] 2508     jreq atoi_exit
      008EF3 01 A6 33         [ 4] 2509     call neg_acc24
      000F6D                       2510 atoi_exit: 
      008EF6 20 5F            [ 2] 2511 	addw sp,#VSIZE
      008EF8 A1               [ 2] 2512 	popw x ; restore x
      008EF9 3C               [ 4] 2513 	ret
                                   2514 
                                   2515 ;--------------------------------------
                                   2516 ; unsigned multiply uint24_t by uint8_t
                                   2517 ; use to convert numerical string to uint24_t
                                   2518 ; input:
                                   2519 ;	acc24	uint24_t 
                                   2520 ;   A		uint8_t
                                   2521 ; output:
                                   2522 ;   acc24   A*acc24
                                   2523 ;-------------------------------------
                                   2524 ; local variables offset  on sp
                           000003  2525 	U8   = 3   ; A pushed on stack
                           000002  2526 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2527 	OVFH = 1  ; multiplication overflow high byte
                           000003  2528 	VSIZE = 3
      000F71                       2529 mulu24_8:
      008EFA 26               [ 2] 2530 	pushw x    ; save X
                                   2531 	; local variables
      008EFB 0C               [ 1] 2532 	push a     ; U8
      008EFC 7B               [ 1] 2533 	clrw x     ; initialize overflow to 0
      008EFD 01               [ 2] 2534 	pushw x    ; multiplication overflow
                                   2535 ; multiply low byte.
      008EFE F7 5C A6         [ 1] 2536 	ld a,acc24+2
      008F01 3C               [ 1] 2537 	ld xl,a
      008F02 6B 01            [ 1] 2538 	ld a,(U8,sp)
      008F04 A6               [ 4] 2539 	mul x,a
      008F05 35               [ 1] 2540 	ld a,xl
      008F06 20 4F 72         [ 1] 2541 	ld acc24+2,a
      008F09 5A               [ 1] 2542 	ld a, xh
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008F0A 00 02            [ 1] 2543 	ld (OVFL,sp),a
                                   2544 ; multipy middle byte
      008F0C 7B 02 20         [ 1] 2545 	ld a,acc24+1
      008F0F 47               [ 1] 2546 	ld xl,a
      008F10 7B 03            [ 1] 2547 	ld a, (U8,sp)
      008F10 A6               [ 4] 2548 	mul x,a
                                   2549 ; add overflow to this partial product
      008F11 3C 11 01         [ 2] 2550 	addw x,(OVFH,sp)
      008F14 26               [ 1] 2551 	ld a,xl
      008F15 32 A6 34         [ 1] 2552 	ld acc24+1,a
      008F18 6B               [ 1] 2553 	clr a
      008F19 02 72            [ 1] 2554 	adc a,#0
      008F1B 5C 00            [ 1] 2555 	ld (OVFH,sp),a
      008F1D 02               [ 1] 2556 	ld a,xh
      008F1E 91 D6            [ 1] 2557 	ld (OVFL,sp),a
                                   2558 ; multiply most signficant byte	
      008F20 01 A1 3D         [ 1] 2559 	ld a, acc24
      008F23 26               [ 1] 2560 	ld xl, a
      008F24 0B 7B            [ 1] 2561 	ld a, (U8,sp)
      008F26 01               [ 4] 2562 	mul x,a
      008F27 F7 A6 3D         [ 2] 2563 	addw x, (OVFH,sp)
      008F2A 6B               [ 1] 2564 	ld a, xl
      008F2B 01 A6 36         [ 1] 2565 	ld acc24,a
      008F2E 20 27            [ 2] 2566     addw sp,#VSIZE
      008F30 A1               [ 2] 2567 	popw x
      008F31 3E               [ 4] 2568 	ret
                                   2569 
                                   2570 ;------------------------------------
                                   2571 ; skip character c in text starting from 'in'
                                   2572 ; input:
                                   2573 ;	 y 		point to text buffer
                                   2574 ;    a 		character to skip
                                   2575 ; output:  
                                   2576 ;	'in' ajusted to new position
                                   2577 ;------------------------------------
                           000001  2578 	C = 1 ; local var
      000FAB                       2579 skip:
      008F32 26               [ 1] 2580 	push a
      008F33 0C 7B 01         [ 4] 2581 1$:	ld a,([in.w],y)
      008F36 F7 5C            [ 1] 2582 	jreq 2$
      008F38 A6 3E            [ 1] 2583 	cp a,(C,sp)
      008F3A 6B 01            [ 1] 2584 	jrne 2$
      008F3C A6 35 20 17      [ 1] 2585 	inc in
      008F40 72 5A            [ 2] 2586 	jra 1$
      000FBB                       2587 2$: _drop 1 
      008F42 00 02            [ 2]    1     addw sp,#1 
      008F44 7B               [ 4] 2588 	ret
                                   2589 	
                                   2590 ;------------------------------
                                   2591 ; restore 'in.w' variable to 
                                   2592 ; its value before last call
                                   2593 ; to get_token.
                                   2594 ;------------------------------
      000FBE                       2595 unget_token:
      008F45 02 20 0F         [ 2] 2596 	ldw x,in.w.saved
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008F48 CF 00 00         [ 2] 2597 	ldw in.w,x 
      008F48 7B               [ 4] 2598 	ret 
                                   2599 
                                   2600 
                                   2601 ;******************************
                                   2602 ;  data stack manipulation
                                   2603 ;*****************************
                                   2604 ;----------------------	
                                   2605 ; push X on data stack 
                                   2606 ; input:
                                   2607 ;	X 
                                   2608 ; output:
                                   2609 ;	none 
                                   2610 ;----------------------	
      000FC5                       2611 dpush:
      000FC5                       2612     _dp_down
      008F49 01 CD 85 8E      [ 1]    1     dec dstkptr+1 
      008F4D 25 03 CC 87      [ 1]    2     dec dstkptr+1
      008F51 A2 CF 00 19      [ 5] 2613     ldw [dstkptr],x  
      008F52 81               [ 4] 2614 	ret 
                                   2615 
                                   2616 
                                   2617 ;----------------------	
                                   2618 ; pop data stack in X 
                                   2619 ; input:
                                   2620 ;	none
                                   2621 ; output:
                                   2622 ;	X   
                                   2623 ;----------------------	
      000FD2                       2624 dpop: 
      008F52 CD 8D 7A 20      [ 5] 2625     ldw x, [dstkptr]
      000FD6                       2626 	_dp_up
      008F56 10 5C 00 1A      [ 1]    1     inc dstkptr+1
      008F57 72 5C 00 1A      [ 1]    2     inc dstkptr+1
      008F57 6B               [ 4] 2627 	ret 
                                   2628 
                                   2629 ;-----------------------------
                                   2630 ; swap top 2 elements of dstack
                                   2631 ;  {n1 n2 -- n2 n1 }
                                   2632 ;-----------------------------
      000FDF                       2633 dswap:
      008F58 02 7B 01 F7      [ 5] 2634 	ldw x,[dstkptr]
      008F5C 5C               [ 2] 2635 	pushw x 
      008F5D 7F 72 5C         [ 2] 2636 	ldw x,#2 
      008F60 00 02 7B 02      [ 5] 2637 	ldw x,([dstkptr],x) 
      008F64 AE 17 18 19      [ 5] 2638 	ldw [dstkptr],x 
      008F67 AE 00 02         [ 2] 2639 	ldw x,#2
      008F67 5B 02            [ 2] 2640 	popw y 
      008F69 81 DF 00 19      [ 5] 2641 	ldw ([dstkptr],x),y 
      008F6A 81               [ 4] 2642 	ret
                                   2643 
                                   2644 ;-----------------------------
                                   2645 ; drop TOS 
                                   2646 ;-----------------------------
      000FF9                       2647 ddrop: ; { n -- }
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      000FF9                       2648 	_dp_up 
      008F6A A1 30 25 03      [ 1]    1     inc dstkptr+1
      008F6E A1 3A 8C 8C      [ 1]    2     inc dstkptr+1
      008F72 81               [ 4] 2649 	ret
                                   2650 	
                                   2651 ;-----------------------------
                                   2652 ; duplicate TOS 
                                   2653 ;  dstack: { ix...n -- ix...n n }
                                   2654 ;-----------------------------
      008F73                       2655 ddup:
      008F73 A1 61 2A 01      [ 5] 2656 	ldw x,[dstkptr]
      001006                       2657 	_dp_down
      008F77 81 A1 7A 22      [ 1]    1     dec dstkptr+1 
      008F7B FB A0 20 81      [ 1]    2     dec dstkptr+1
      008F7F 72 CF 00 19      [ 5] 2658     ldw [dstkptr],x  
      008F7F 89               [ 4] 2659 	ret 
                                   2660 
                                   2661 
                                   2662 ;----------------------------------
                                   2663 ; pick value n from dstack 
                                   2664 ; put it on TOS
                                   2665 ; dstack: {ix,..,p -- ix,...,np }
                                   2666 ;-----------------------------------
      001013                       2667 dpick:
      008F80 52 03 72 5F      [ 5] 2668 	ldw x,[dstkptr]
      008F84 00               [ 2] 2669 	sllw x 
      008F85 09 72 5F 00      [ 2] 2670 	addw x,dstkptr 
      008F89 0A               [ 2] 2671 	ldw x,(x)
      008F8A 72 5F 00 0B      [ 5] 2672 	ldw [dstkptr],x 
      008F8E C6               [ 4] 2673 	ret
                                   2674 
                                   2675 ;---------------------------
                                   2676 ;  fetch variable in X 
                                   2677 ;  dstack:{ addr -- value }
                                   2678 ;---------------------------
      001022                       2679 fetch:
      008F8F 17 18 27 5A      [ 5] 2680 	ldw x,[dstkptr]
      008F93 0F               [ 2] 2681 	ldw x,(x)
      008F94 01 A6 0A 6B      [ 5] 2682 	ldw [dstkptr],x
      008F98 02               [ 4] 2683 	ret 
                                   2684 
                                   2685 ;----------------------------
                                   2686 ; store variable 
                                   2687 ; dstack: {addr value -- }
                                   2688 ;----------------------------
      00102C                       2689 store:
      008F99 AE 17 18         [ 4] 2690 	call dpop 
      008F9C F6 27            [ 1] 2691 	ldw y,x   ; y=value 
      008F9E 47 A1 2D         [ 4] 2692 	call dpop 
      008FA1 26               [ 2] 2693 	ldw (x),y 
      008FA2 04               [ 4] 2694 	ret 
                                   2695 
                                   2696 ;---------------------------------
                                   2697 ; drop n elements from data stack 
                                   2698 ; input: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2699 ;   X 		n 
                                   2700 ; output:
                                   2701 ;   none 
                                   2702 ;-------------------------------------
      001036                       2703 ddrop_n:
      008FA3 03 01            [ 2] 2704 	pushw y 
      008FA5 20 08 A1 24      [ 2] 2705 	ldw y,dstkptr 
      008FA9 26               [ 2] 2706 	sllw x 
      008FAA 06               [ 2] 2707 	pushw x 
      008FAB A6 10 6B         [ 2] 2708 	addw y,(1,sp)
      008FAE 02 5C F6 19      [ 2] 2709 	ldw dstkptr,y 
      008FB1 85               [ 2] 2710 	popw x 
      008FB1 A1 61            [ 2] 2711 	popw y
      008FB3 2B               [ 4] 2712 	ret 
                                   2713 
      008FB4 02 A0 20 A1 30 2B 2B  2714 dstk_prompt: .asciz "\ndstack: " 
             A0 30 A1
                                   2715 ;----------------------------
                                   2716 ; print dstack content 
                                   2717 ;---------------------------
                           000001  2718 	XSAVE=1
                           000002  2719 	VSIZE=2
      001053                       2720 dots:
      001053                       2721 	_vars VSIZE 
      008FBE 0A 2B            [ 2]    1     sub sp,#VSIZE 
      008FC0 06 A0 07         [ 2] 2722 	ldw x,#dstk_prompt 
      008FC3 11 02 2A         [ 4] 2723 	call puts
      008FC6 1F 6B 03         [ 2] 2724 	ldw x,#dstack_unf-CELL_SIZE
      008FC9 7B 02 CD 8F      [ 1] 2725 	mov base,#10 
      008FCD F1 7B 03         [ 2] 2726 1$:	cpw x,dstkptr 
      008FD0 CB 00            [ 1] 2727 	jrult 4$ 
      008FD2 0B C7            [ 2] 2728 	ldw (XSAVE,sp),x
      008FD4 00               [ 2] 2729 	ldw  x,(x)
      008FD5 0B 4F C9         [ 4] 2730 	call print_int 
      008FD8 00 0A            [ 2] 2731 	ldw x,(XSAVE,sp)
      008FDA C7 00 0A         [ 2] 2732 	subw x,#CELL_SIZE 
      008FDD 4F C9            [ 2] 2733 	jra 1$ 
      008FDF 00 09            [ 1] 2734 4$: ld a,#CR 
      008FE1 C7 00 09         [ 4] 2735 	call putc 
      001079                       2736 	_drop VSIZE
      008FE4 20 C9            [ 2]    1     addw sp,#VSIZE 
      008FE6 0D               [ 1] 2737 	clr a 
      008FE7 01               [ 4] 2738 	ret
                                   2739 
      008FE8 27 03 CD 8A F2 6B 3A  2740 cstk_prompt: .asciz "\nctack: "
             20 00
                                   2741 ;--------------------------------
                                   2742 ; print cstack content
                                   2743 ;--------------------------------
                           000001  2744 	XSAVE=1
                           000002  2745 	VSIZE=2 
      008FED                       2746 dotr:
      001086                       2747 	_vars VSIZE 
      008FED 5B 03            [ 2]    1     sub sp,#VSIZE 
      008FEF 85 81 7D         [ 2] 2748 	ldw x,#cstk_prompt
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008FF1 CD 01 B0         [ 4] 2749 	call puts 
      008FF1 89               [ 1] 2750 	ldw x,sp 
      008FF2 88 5F 89         [ 2] 2751 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008FF5 C6 00            [ 2] 2752 	ldw (XSAVE,sp),x  
      008FF7 0B 97 7B         [ 2] 2753 	ldw x,#RAM_SIZE-2
      008FFA 03 42 9F C7      [ 1] 2754 	mov base,#16
      00109B                       2755 dotr_loop:
      008FFE 00 0B            [ 2] 2756 	cpw x,(XSAVE,sp)
      009000 9E 6B            [ 1] 2757 	jrmi 9$
      009002 02               [ 2] 2758 	pushw x  
      009003 C6               [ 2] 2759 	ldw x,(x)
      009004 00 0A 97         [ 4] 2760 	call print_int 
      009007 7B               [ 2] 2761 	popw x  
      009008 03 42 72         [ 2] 2762 	subw x,#CELL_SIZE
      00900B FB 01            [ 2] 2763 	jra dotr_loop 
      00900D 9F C7            [ 1] 2764 9$:	ld a,#CR 
      00900F 00 0A 4F         [ 4] 2765 	call putc 
      0010AF                       2766 	_drop VSIZE 
      009012 A9 00            [ 2]    1     addw sp,#VSIZE 
      009014 6B               [ 1] 2767 	clr a 
      009015 01               [ 4] 2768 	ret
                                   2769 
                                   2770 
                                   2771 ;--------------------------------
                                   2772 ;  add 2 integers
                                   2773 ;  input:
                                   2774 ;    N1     on cstack 
                                   2775 ;    N2     on cstack 
                                   2776 ;  output:
                                   2777 ;    X 		n2+n1 
                                   2778 ;--------------------------------
                                   2779 	;arugments on cstack 
      0010B3                       2780 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0010B3                       2781 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      0010B3                       2782 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      0010B3                       2783 add:
      009016 9E 6B            [ 2] 2784 	ldw x ,(N2,sp)
      009018 02 C6 00         [ 2] 2785 	addw x,(N1,sp)
      00901B 09 97            [ 2] 2786 	ldw (N1,sp),x 
      00901D 7B               [ 4] 2787 	ret 
                                   2788 
                                   2789 ;--------------------------------
                                   2790 ;  substract 2 ntegers
                                   2791 ;  input:
                                   2792 ;    N1     on cstack 
                                   2793 ;    N2     on cstack 
                                   2794 ;  output:
                                   2795 ;    X 		n2+n1 
                                   2796 ;--------------------------------
      0010BB                       2797 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0010BB                       2798 	_arg N1 1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                           000003     1     N1=ARG_OFS+1 
      0010BB                       2799 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      0010BB                       2800 substract:
      00901E 03 42            [ 2] 2801 	ldw x,(N2,sp)
      009020 72 FB 01         [ 2] 2802 	subw x,(N1,sp)
      009023 9F               [ 4] 2803 	ret 
                                   2804 
                                   2805 ;-------------------------------------
                                   2806 ; multiply 2 integers
                                   2807 ; product overflow is ignored unless
                                   2808 ; MATH_OVF assembler flag is set to 1
                                   2809 ; input:
                                   2810 ;  	N1      on cstack
                                   2811 ;   N2 		on cstack 
                                   2812 ; output:
                                   2813 ;	X        N1*N2 
                                   2814 ;-------------------------------------
                                   2815 	;arguments 
      0010C1                       2816 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      0010C1                       2817 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      0010C1                       2818 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      0010C1                       2819 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      0010C1                       2820 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2821    ; local variables 
                           000001  2822 	SIGN=1
                           000002  2823 	PROD=2
                           000003  2824 	VSIZE=3
      0010C1                       2825 multiply:
      0010C1                       2826 	_vars VSIZE 
      009024 C7 00            [ 2]    1     sub sp,#VSIZE 
      009026 09 5B            [ 1] 2827 	clr (SIGN,sp)
      009028 03 85            [ 2] 2828 	ldw x,(N1_HB,sp)
      00902A 81               [ 1] 2829 	ld a,xh  
      00902B A5 80            [ 1] 2830 	bcp a,#0x80 
      00902B 88 91            [ 1] 2831 	jreq 2$
      00902D D6 01            [ 1] 2832 	cpl (SIGN,sp)
      00902F 27               [ 2] 2833 	negw x 
      009030 0A 11            [ 2] 2834 	ldw (N1_HB,sp),x 
      009032 01 26            [ 2] 2835 2$: ldw x,(N2_HB,sp)
      009034 06               [ 1] 2836 	ld a,xh  
      009035 72 5C            [ 1] 2837 	bcp a,#0x80 
      009037 00 02            [ 1] 2838 	jreq 3$
      009039 20 F1            [ 1] 2839 	cpl (SIGN,sp)
      00903B 5B               [ 2] 2840 	negw x 
      00903C 01 81            [ 2] 2841 	ldw (N2_HB,sp),x 
                                   2842 ; N1_LB * N2_LB 	
      00903E 7B 07            [ 1] 2843 3$:	ld a,(N1_LB,sp)
      00903E CE               [ 1] 2844 	ld xl,a 
      00903F 00 12            [ 1] 2845 	ld a,(N2_LB,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009041 CF               [ 4] 2846 	mul x,a 
                           000000  2847 .if MATH_OVF 	
                                   2848 	ld a,xh 
                                   2849 	bcp a,#0x80 
                                   2850 	jreq 4$ 
                                   2851 	ld a,#ERR_MATH_OVF 
                                   2852 	jp tb_error
                                   2853 .endif 	 
      009042 00 01            [ 2] 2854 4$:	ldw (PROD,sp),x
                                   2855 ; N1_LB * N2_HB	 
      009044 81 07            [ 1] 2856 	ld a,(N1_LB,sp) 
      009045 97               [ 1] 2857 	ld xl,a 
      009045 72 5A            [ 1] 2858 	ld a,(N2_HB,sp)
      009047 00               [ 4] 2859 	mul x,a
      009048 1B               [ 1] 2860 	ld a,xl 
      009049 72 5A            [ 1] 2861 	add a,(PROD,sp)
                           000000  2862 .if MATH_OVF 	
                                   2863 	bcp a,#0x80 
                                   2864 	jreq 5$ 
                                   2865 	ld a,#ERR_MATH_OVF 
                                   2866 	jp tb_error
                                   2867 .endif 	 
      00904B 00 1B            [ 1] 2868 5$:	ld (PROD,sp),a 
                                   2869 ; N1_HB * N2_LB 
      00904D 72 CF            [ 1] 2870 	ld a,(N1_HB,sp)
      00904F 00               [ 1] 2871 	ld xl,a 
      009050 1A 81            [ 1] 2872 	ld a,(N2_LB,sp)
      009052 42               [ 4] 2873 	mul x,a 
      009052 72               [ 1] 2874 	ld a,xl 
      009053 CE 00            [ 1] 2875 	add a,(PROD,sp)
                           000000  2876 .if MATH_OVF 	
                                   2877 	bcp a,#0x80 
                                   2878 	jreq 6$ 
                                   2879 	ld a,#ERR_MATH_OVF 
                                   2880 	jp tb_error
                                   2881 .endif 	 
      009055 1A 72            [ 1] 2882 6$:	ld (PROD,sp),a 
                                   2883 ; N1_HB * N2_HB 	
                                   2884 ; it is pointless to multiply N1_HB*N2_HB 
                                   2885 ; as this product is over 65535 or 0 
                                   2886 ;
                                   2887 ; sign adjust product
      009057 5C 00            [ 1] 2888 	tnz (SIGN,sp)
      009059 1B 72            [ 1] 2889 	jreq 7$
      00905B 5C 00            [ 2] 2890 	ldw x, (PROD,sp)
      00905D 1B               [ 2] 2891 	negw x
      00905E 81 02            [ 2] 2892 	ldw (PROD,sp),x  
      00905F                       2893 7$: 
      00905F 72 CE            [ 2] 2894 	ldw x,(PROD,sp) 
      001106                       2895 	_drop VSIZE 
      009061 00 1A            [ 2]    1     addw sp,#VSIZE 
      009063 89               [ 4] 2896 	ret
                                   2897 
                                   2898 ;----------------------------------
                                   2899 ;  euclidian divide n2/n1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2900 ; input:
                                   2901 ;    N2 	on cstack
                                   2902 ;    N1 	on cstack
                                   2903 ; output:
                                   2904 ;    X      n2/n1 
                                   2905 ;    Y      remainder 
                                   2906 ;----------------------------------
      001109                       2907 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      001109                       2908 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      001109                       2909 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2910 	; local variables
                           000001  2911 	SQUOT=1 ; sign quotient
                           000002  2912 	SDIVD=2 ; sign dividend  
                           000002  2913 	VSIZE=2
      001109                       2914 divide:
      001109                       2915 	_vars VSIZE 
      009064 AE 00            [ 2]    1     sub sp,#VSIZE 
      009066 02 72            [ 1] 2916 	clr (SQUOT,sp)
      009068 DE 00            [ 1] 2917 	clr (SDIVD,sp)
                                   2918 ; check for 0 divisor
      00906A 1A 72            [ 2] 2919 	ldw x,(DIVISR,sp)
      00906C CF               [ 2] 2920 	tnzw x 
      00906D 00 1A            [ 1] 2921     jrne 0$
      00906F AE 00            [ 1] 2922 	ld a,#ERR_DIV0 
      009071 02 90 85         [ 2] 2923 	jp tb_error 
                                   2924 ; check divisor sign 	
      009074 72               [ 1] 2925 0$:	ld a,xh 
      009075 DF 00            [ 1] 2926 	bcp a,#0x80 
      009077 1A 81            [ 1] 2927 	jreq 1$
      009079 03 01            [ 1] 2928 	cpl (SQUOT,sp)
      009079 72               [ 2] 2929 	negw x 
      00907A 5C 00            [ 2] 2930 1$:	ldw (DIVISR,sp),x
                                   2931 ; check dividend sign 	 
      00907C 1B 72            [ 2] 2932     ldw x,(DIVIDND,sp)
      00907E 5C               [ 1] 2933 	ld a,xh 
      00907F 00 1B            [ 1] 2934 	bcp a,#0x80 
      009081 81 05            [ 1] 2935 	jreq 2$ 
      009082 03 01            [ 1] 2936 	cpl (SQUOT,sp)
      009082 72 CE            [ 1] 2937 	cpl (SDIVD,sp)
      009084 00               [ 2] 2938 	negw x 
      009085 1A 72            [ 2] 2939 2$:	ldw y,(DIVISR,sp)
      009087 5A               [ 2] 2940 	divw x,y
      009088 00 1B 72 5A      [ 2] 2941 	ldw acc16,y 
                                   2942 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      00908C 00 1B            [ 1] 2943 	tnz (SDIVD,sp)
      00908E 72 CF            [ 1] 2944 	jreq 7$
      009090 00 1A            [ 2] 2945 	tnzw y 
      009092 81 07            [ 1] 2946 	jreq 7$
      009093 5C               [ 1] 2947 	incw x
      009093 72 CE            [ 2] 2948 	ldw y,(DIVISR,sp)
      009095 00 1A 58 72      [ 2] 2949 	subw y,acc16
      009099 BB 00            [ 1] 2950 7$: tnz (SQUOT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00909B 1A FE            [ 1] 2951 	jreq 9$ 	 
      00909D 72               [ 2] 2952 8$:	negw x 
      00114A                       2953 9$: 
      00114A                       2954 	_drop VSIZE 
      00909E CF 00            [ 2]    1     addw sp,#VSIZE 
      0090A0 1A               [ 4] 2955 	ret 
                                   2956 
                                   2957 
                                   2958 ;----------------------------------
                                   2959 ;  remainder resulting from euclidian 
                                   2960 ;  division of n2/n1 
                                   2961 ; input:
                                   2962 ;   N1 		cstack 
                                   2963 ;   N2      cstack
                                   2964 ; output:
                                   2965 ;   X       N2%N1 
                                   2966 ;----------------------------------
                           000003  2967 	N1=3
                           000005  2968 	N2=5
                           000004  2969 	VSIZE=4
      00114D                       2970 modulo:
      0090A1 81 03            [ 2] 2971 	Ldw x,(N1,sp)
      0090A2 16 05            [ 2] 2972 	ldw y,(N2,sp)
      001151                       2973 	_vars VSIZE 
      0090A2 72 CE            [ 2]    1     sub sp,#VSIZE 
      0090A4 00 1A            [ 2] 2974 	ldw (1,sp),x 
      0090A6 FE 72            [ 2] 2975 	ldw (3,sp),y 
      0090A8 CF 00 1A         [ 4] 2976 	call divide 
      0090AB 81               [ 1] 2977 	ldw x,y
      0090AC                       2978 	_drop VSIZE 
      0090AC CD 90            [ 2]    1     addw sp,#VSIZE 
      0090AE 52               [ 4] 2979 	ret 
                                   2980 
                                   2981 
                                   2982 ;----------------------------------
                                   2983 ; search in kword_dict command name
                                   2984 ;  from its execution address 
                                   2985 ; input:
                                   2986 ;   X       	execution address 
                                   2987 ; output:
                                   2988 ;   X 			cstr*  | 0 
                                   2989 ;--------------------------------
                           000001  2990 	XADR=1 
                           000003  2991 	LINK=3 
                           000004  2992 	VSIZE=4
      00115E                       2993 cmd_name:
      00115E                       2994 	_vars VSIZE 
      0090AF 90 93            [ 2]    1     sub sp,#VSIZE 
      0090B1 CD 90 52 FF      [ 1] 2995 	clr acc16 
      0090B5 81 01            [ 2] 2996 	ldw (XADR,sp),x  
      0090B6 AE 21 4E         [ 2] 2997 	ldw x,#kword_dict	
      0090B6 90 89            [ 2] 2998 1$:	ldw (LINK,sp),x
      0090B8 90 CE            [ 1] 2999 	ld a,(2,x)
      0090BA 00 1A            [ 1] 3000 	and a,#15 
      0090BC 58 89 72         [ 1] 3001 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0090BF F9 01 90         [ 2] 3002 	addw x,#3
      0090C2 CF 00 1A 85      [ 2] 3003 	addw x,acc16
      0090C6 90               [ 2] 3004 	ldw x,(x) ; execution address 
      0090C7 85 81            [ 2] 3005 	cpw x,(XADR,sp)
      0090C9 0A 64            [ 1] 3006 	jreq 2$
      0090CB 73 74            [ 2] 3007 	ldw x,(LINK,sp)
      0090CD 61               [ 2] 3008 	ldw x,(x) 
      0090CE 63 6B 3A         [ 2] 3009 	subw x,#2  
      0090D1 20 00            [ 1] 3010 	jrne 1$
      0090D3 20 05            [ 2] 3011 	jra 9$
      0090D3 52 02            [ 2] 3012 2$: ldw x,(LINK,sp)
      0090D5 AE 90 C9         [ 2] 3013 	addw x,#2 	
      00118D                       3014 9$:	_drop VSIZE
      0090D8 CD 82            [ 2]    1     addw sp,#VSIZE 
      0090DA 30               [ 4] 3015 	ret
                                   3016 
                                   3017 
                                   3018 ;---------------------------------
                                   3019 ; input:
                                   3020 ;	X 		dictionary entry point 
                                   3021 ;  pad		.asciz name to search 
                                   3022 ; output:
                                   3023 ;  A 		TK_CMD|TK_FUNC|TK_NONE 
                                   3024 ;  X		execution address | 0 
                                   3025 ;---------------------------------
                           000001  3026 	NLEN=1 ; cmd length 
                           000002  3027 	YSAVE=2
                           000003  3028 	VSIZE=3 
      001190                       3029 search_dict:
      001190                       3030 	_vars VSIZE 
      0090DB AE 17            [ 2]    1     sub sp,#VSIZE 
      0090DD 7E 35            [ 1] 3031 	ldw y,x 
      001194                       3032 search_next:	
      0090DF 0A 00            [ 1] 3033 	ld a,(y)
      0090E1 08 C3            [ 1] 3034 	and a,#0xf 
      0090E3 00 1A            [ 1] 3035 	ld (NLEN,sp),a  
      0090E5 25 0D 1F         [ 2] 3036 	ldw x,#pad 
      0090E8 01 FE            [ 2] 3037 	ldw (YSAVE,sp),y
      0090EA CD 8A            [ 1] 3038 	incw y  
      0011A1                       3039 cp_loop:
      0090EC 27               [ 1] 3040 	ld a,(x)
      0090ED 1E 01            [ 1] 3041 	jreq str_match 
      0090EF 1D 00            [ 1] 3042 	tnz (NLEN,sp)
      0090F1 02 20            [ 1] 3043 	jreq no_match  
      0090F3 EE A6            [ 1] 3044 	cp a,(y)
      0090F5 0D CD            [ 1] 3045 	jrne no_match 
      0090F7 82 1E            [ 1] 3046 	incw y 
      0090F9 5B               [ 1] 3047 	incw x
      0090FA 02 4F            [ 1] 3048 	dec (NLEN,sp)
      0090FC 81 0A            [ 2] 3049 	jra cp_loop 
      0011B3                       3050 no_match:
      0090FE 63 74            [ 2] 3051 	ldw y,(YSAVE,sp) 
      009100 61 63 6B 3A      [ 2] 3052 	subw y,#2 ; move Y to link field
      009104 20 00            [ 1] 3053 	push #TK_NONE 
      009106 90 FE            [ 2] 3054 	ldw y,(y) ; next word link 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009106 52               [ 1] 3055 	pop a ; TK_NONE 
      009107 02 AE            [ 1] 3056 	jreq search_exit  ; not found  
                                   3057 ;try next 
      009109 90 FD            [ 2] 3058 	jra search_next
      0011C2                       3059 str_match:
      00910B CD 82            [ 2] 3060 	ldw y,(YSAVE,sp)
      00910D 30 96            [ 1] 3061 	ld a,(y)
      00910F 1C 00            [ 1] 3062 	ld (NLEN,sp),a ; needed to test bit 7 
      009111 07 1F            [ 1] 3063 	and a,#0x7f 
                                   3064 ; move y to procedure address field 	
      009113 01               [ 1] 3065 	inc a 
      009114 AE 17 FE         [ 1] 3066 	ld acc8,a 
      009117 35 10 00 08      [ 1] 3067 	clr acc16 
      00911B 72 B9 00 09      [ 2] 3068 	addw y,acc16 
      00911B 13 01            [ 2] 3069 	ldw y,(y) ; routine entry point 
      00911D 2B 0B            [ 1] 3070 	ld a,(NLEN,sp)
      00911F 89 FE            [ 1] 3071 	bcp a,#0x80 
      009121 CD 8A            [ 1] 3072 	jreq 1$
      009123 27 85            [ 1] 3073 	ld a,#TK_FUNC 
      009125 1D 00            [ 2] 3074 	jra search_exit
      009127 02 20            [ 1] 3075 1$: ld a,#TK_CMD 
      0011E4                       3076 search_exit: 
      009129 F1               [ 1] 3077 	ldw x,y ; x=routine address 
      0011E5                       3078 	_drop VSIZE 	 
      00912A A6 0D            [ 2]    1     addw sp,#VSIZE 
      00912C CD               [ 4] 3079 	ret 
                                   3080 
                                   3081 ;---------------------
                                   3082 ; check if next token
                                   3083 ;  is of expected type 
                                   3084 ; input:
                                   3085 ;   A 		 expected token attribute
                                   3086 ;  ouput:
                                   3087 ;   none     if fail call tb_error 
                                   3088 ;--------------------
      0011E8                       3089 expect:
      00912D 82               [ 1] 3090 	push a 
      00912E 1E 5B 02         [ 4] 3091 	call next_token 
      009131 4F 81            [ 1] 3092 	cp a,(1,sp)
      009133 27 03            [ 1] 3093 	jreq 1$
      009133 1E 05 72         [ 2] 3094 	jp syntax_error
      009136 FB               [ 1] 3095 1$: pop a 
      009137 03               [ 4] 3096 	ret 
                                   3097 
                                   3098 
                                   3099 ;-------------------------------
                                   3100 ; parse embedded BASIC routines 
                                   3101 ; arguments list.
                                   3102 ; arg_list::=  rel[','rel]*
                                   3103 ; all arguments are of integer type
                                   3104 ; input:
                                   3105 ;   none
                                   3106 ; output:
                                   3107 ;   A 			number of arguments pushed on dstack  
                                   3108 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                           000001  3109 	ARG_CNT=1 
      0011F5                       3110 arg_list:
      009138 1F 03            [ 1] 3111 	push #0  
      00913A 81 13 33         [ 4] 3112 1$: call relation
      00913B A1 00            [ 1] 3113 	cp a,#TK_NONE 
      00913B 1E 05            [ 1] 3114 	jreq 5$
      00913D 72 F0            [ 1] 3115 	cp a,#TK_INTGR
      00913F 03 81            [ 1] 3116 	jrne 4$
      009141 CD 0F C5         [ 4] 3117 3$: call dpush 
      009141 52 03            [ 1] 3118     inc (ARG_CNT,sp)
      009143 0F 01 1E         [ 4] 3119 	call next_token 
      009146 06 9E            [ 1] 3120 	cp a,#TK_NONE 
      009148 A5 80            [ 1] 3121 	jreq 5$ 
      00914A 27 05            [ 1] 3122 	cp a,#TK_COMMA 
      00914C 03 01            [ 1] 3123 	jrne 4$
      00914E 50 1F            [ 2] 3124 	jra 1$ 
      009150 06 1E 08         [ 4] 3125 4$:	call unget_token 
      009153 9E               [ 1] 3126 5$:	pop a 
      009154 A5               [ 4] 3127 	ret 
                                   3128 
                                   3129 
                                   3130 
                                   3131 ;--------------------------------
                                   3132 ;   BASIC commnands 
                                   3133 ;--------------------------------
                                   3134 
                                   3135 ;--------------------------------
                                   3136 ;  arithmetic and relational 
                                   3137 ;  routines
                                   3138 ;  operators precedence
                                   3139 ;  highest to lowest
                                   3140 ;  operators on same row have 
                                   3141 ;  same precedence and are executed
                                   3142 ;  from left to right.
                                   3143 ;	'*','/','%'
                                   3144 ;   '-','+'
                                   3145 ;   '=','>','<','>=','<=','<>','><'
                                   3146 ;   '<>' and '><' are equivalent for not equal.
                                   3147 ;--------------------------------
                                   3148 
                                   3149 ;---------------------
                                   3150 ; return array element
                                   3151 ; address from @(expr)
                                   3152 ; input:
                                   3153 ;   A 		TK_ARRAY
                                   3154 ; output:
                                   3155 ;   A 		TK_INTGR
                                   3156 ;	X 		element address 
                                   3157 ;----------------------
      001219                       3158 get_array_element:
      009155 80 27 05         [ 4] 3159 	call ddrop 
      009158 03 01            [ 1] 3160 	ld a,#TK_LPAREN 
      00915A 50 1F 08         [ 4] 3161 	call expect
      00915D 7B 07 97         [ 4] 3162 	call relation 
      009160 7B 09            [ 1] 3163 	cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009162 42 1F            [ 1] 3164 	jreq 1$
      009164 02 7B 07         [ 2] 3165 	jp syntax_error
      009167 97               [ 2] 3166 1$: pushw x 
      009168 7B 08            [ 1] 3167 	ld a,#TK_RPAREN 
      00916A 42 9F 1B         [ 4] 3168 	call expect
                                   3169 	; check for bounds 
      00916D 02               [ 2] 3170 	popw x   
      00916E 6B 02 7B         [ 2] 3171 	cpw x,array_size 
      009171 06 97            [ 2] 3172 	jrule 3$
                                   3173 ; bounds {1..array_size}	
      009173 7B 09            [ 1] 3174 2$: ld a,#ERR_BAD_VALUE 
      009175 42 9F 1B         [ 2] 3175 	jp tb_error 
      009178 02               [ 2] 3176 3$: tnzw  x
      009179 6B 02            [ 1] 3177 	jreq 2$ 
      00917B 0D               [ 2] 3178 	sllw x 
      00917C 01               [ 2] 3179 	pushw x 
      00917D 27 05 1E         [ 2] 3180 	ldw x,array_addr  
      009180 02 50 1F         [ 2] 3181 	subw x,(1,sp)
      001247                       3182 	_drop 2   
      009183 02 02            [ 2]    1     addw sp,#2 
      009184 A6 03            [ 1] 3183 	ld a,#TK_INTGR
      009184 1E               [ 4] 3184 	ret 
                                   3185 
                                   3186 ;***********************************
                                   3187 ;   expression parse,execute 
                                   3188 ;***********************************
                                   3189 ;-----------------------------------
                                   3190 ; factor ::= ['+'|'-'|e] var | @ |
                                   3191 ;			 integer | function |
                                   3192 ;			 '('relation')' 
                                   3193 ; output:
                                   3194 ;   A    token attribute 
                                   3195 ;   X 	 integer
                                   3196 ; ---------------------------------
                           000001  3197 	NEG=1
                           000001  3198 	VSIZE=1
      00124C                       3199 factor:
      00124C                       3200 	_vars VSIZE 
      009185 02 5B            [ 2]    1     sub sp,#VSIZE 
      009187 03 81 08         [ 4] 3201 	call next_token
      009189 A1 02            [ 1] 3202 	cp a,#CMD_END 
      009189 52 02            [ 1] 3203 	jrmi 20$
      00918B 0F 01            [ 1] 3204 1$:	ld (NEG,sp),a 
      00918D 0F 02            [ 1] 3205 	and a,#TK_GRP_MASK
      00918F 1E 05            [ 1] 3206 	cp a,#TK_GRP_ADD 
      009191 5D 26            [ 1] 3207 	jreq 2$
      009193 05 A6            [ 1] 3208 	ld a,(NEG,sp)
      009195 04 CC            [ 2] 3209 	jra 4$  
      001261                       3210 2$:	
      009197 87 A4 9E         [ 4] 3211 	call next_token 
      001264                       3212 4$:	
      00919A A5 80            [ 1] 3213 	cp a,#TK_FUNC 
      00919C 27 03            [ 1] 3214 	jrne 5$ 
      00919E 03               [ 4] 3215 	call (x) 
      00919F 01 50            [ 2] 3216 	jra 18$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00126B                       3217 5$:
      0091A1 1F 05            [ 1] 3218 	cp a,#TK_INTGR
      0091A3 1E 07            [ 1] 3219 	jrne 6$
      0091A5 9E A5            [ 2] 3220 	jra 18$
      001271                       3221 6$:
      0091A7 80 27            [ 1] 3222 	cp a,#TK_ARRAY
      0091A9 05 03            [ 1] 3223 	jrne 10$
      0091AB 01 03 02         [ 4] 3224 	call get_array_element
      0091AE 50               [ 2] 3225 	ldw x,(x)
      0091AF 16 05            [ 2] 3226 	jra 18$ 
      00127B                       3227 10$:
      0091B1 65 90            [ 1] 3228 	cp a,#TK_VAR 
      0091B3 CF 00            [ 1] 3229 	jrne 12$
      0091B5 0A               [ 2] 3230 	ldw x,(x)
      0091B6 0D 02            [ 2] 3231 	jra 18$
      001282                       3232 12$:			
      0091B8 27 0B            [ 1] 3233 	cp a,#TK_LPAREN
      0091BA 90 5D            [ 1] 3234 	jrne 16$
      0091BC 27 07 5C         [ 4] 3235 	call relation
      0091BF 16 05            [ 1] 3236 	ld a,#TK_RPAREN 
      0091C1 72 B2 00         [ 4] 3237 	call expect
      0091C4 0A 0D            [ 2] 3238 	jra 18$	
      001290                       3239 16$:
      0091C6 01 27 01         [ 4] 3240 	call unget_token
      0091C9 50               [ 1] 3241 	clr a 
      0091CA 20 09            [ 2] 3242 	jra 20$ 
      001296                       3243 18$: 
      0091CA 5B 02            [ 1] 3244 	ld a,#TK_MINUS 
      0091CC 81 01            [ 1] 3245 	cp a,(NEG,sp)
      0091CD 26 01            [ 1] 3246 	jrne 19$
      0091CD 1E               [ 2] 3247 	negw x
      00129D                       3248 19$:
      0091CE 03 16            [ 1] 3249 	ld a,#TK_INTGR
      00129F                       3250 20$:
      00129F                       3251 	_drop VSIZE
      0091D0 05 52            [ 2]    1     addw sp,#VSIZE 
      0091D2 04               [ 4] 3252 	ret
                                   3253 
                                   3254 ;-----------------------------------
                                   3255 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3256 ; output:
                                   3257 ;   A    	token attribute 
                                   3258 ;	X		integer
                                   3259 ;-----------------------------------
                           000001  3260 	N1=1
                           000003  3261 	N2=3
                           000005  3262 	MULOP=5
                           000005  3263 	VSIZE=5
      0012A2                       3264 term:
      0012A2                       3265 	_vars VSIZE
      0091D3 1F 01            [ 2]    1     sub sp,#VSIZE 
      0091D5 17 03 CD         [ 4] 3266 	call factor
      0091D8 91 89            [ 1] 3267 	cp a,#CMD_END
      0091DA 93 5B            [ 1] 3268 	jrmi term_exit
      0012AB                       3269 term01:	 ; check for  operator 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0091DC 04 81            [ 2] 3270 	ldw (N2,sp),x  ; save first factor 
      0091DE CD 08 08         [ 4] 3271 	call next_token
      0091DE 52 04            [ 1] 3272 	cp a,#2
      0091E0 72 5F            [ 1] 3273 	jrmi 9$
      0091E2 00 0A            [ 1] 3274 0$:	ld (MULOP,sp),a
      0091E4 1F 01            [ 1] 3275 	and a,#TK_GRP_MASK
      0091E6 AE A1            [ 1] 3276 	cp a,#TK_GRP_MULT
      0091E8 CE 1F            [ 1] 3277 	jreq 1$
      0091EA 03 E6            [ 1] 3278 	ld a,(MULOP,sp) 
      0091EC 02 A4 0F         [ 4] 3279 	call unget_token 
      0091EF C7 00            [ 2] 3280 	jra 9$
      0012C3                       3281 1$:	; got *|/|%
      0091F1 0B 1C 00         [ 4] 3282 	call factor
      0091F4 03 72            [ 1] 3283 	cp a,#TK_INTGR
      0091F6 BB 00            [ 1] 3284 	jreq 2$ 
      0091F8 0A FE 13         [ 2] 3285 	jp syntax_error
      0091FB 01 27            [ 2] 3286 2$:	ldw (N1,sp),x  
      0091FD 0A 1E            [ 1] 3287 	ld a,(MULOP,sp) 
      0091FF 03 FE            [ 1] 3288 	cp a,#TK_MULT 
      009201 1D 00            [ 1] 3289 	jrne 3$
      009203 02 26 E3         [ 4] 3290 	call multiply 
      009206 20 05            [ 2] 3291 	jra term01
      009208 1E 03            [ 1] 3292 3$: cp a,#TK_DIV 
      00920A 1C 00            [ 1] 3293 	jrne 4$ 
      00920C 02 5B 04         [ 4] 3294 	call divide 
      00920F 81 C8            [ 2] 3295 	jra term01 
      009210 CD 11 4D         [ 4] 3296 4$: call modulo
      009210 52 03            [ 2] 3297 	jra term01 
      009212 90 93            [ 2] 3298 9$: ldw x,(N2,sp)  
      009214 A6 03            [ 1] 3299 	ld a,#TK_INTGR 	
      0012EC                       3300 term_exit:
      0012EC                       3301 	_drop VSIZE 
      009214 90 F6            [ 2]    1     addw sp,#VSIZE 
      009216 A4               [ 4] 3302 	ret 
                                   3303 
                                   3304 ;-------------------------------
                                   3305 ;  expr ::= term [['+'|'-'] term]*
                                   3306 ;  result range {-32768..32767}
                                   3307 ;  output:
                                   3308 ;   A    token attribute 
                                   3309 ;   X	 integer   
                                   3310 ;-------------------------------
                           000001  3311 	N1=1 
                           000003  3312 	N2=3
                           000005  3313 	OP=5 
                           000005  3314 	VSIZE=5 
      0012EF                       3315 expression:
      0012EF                       3316 	_vars VSIZE 
      009217 0F 6B            [ 2]    1     sub sp,#VSIZE 
      009219 01 AE 17         [ 4] 3317 	call term
      00921C 18 17            [ 1] 3318 	cp a,#CMD_END 
      00921E 02 90            [ 1] 3319 	jrmi expr_exit 
      009220 5C 03            [ 2] 3320 0$:	ldw (N2,sp),x 
      009221 CD 08 08         [ 4] 3321 	call next_token
      009221 F6 27            [ 1] 3322 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      009223 1E 0D            [ 1] 3323 	jrmi 9$ 
      009225 01 27            [ 1] 3324 1$:	ld (OP,sp),a  
      009227 0B 90            [ 1] 3325 	and a,#TK_GRP_MASK
      009229 F1 26            [ 1] 3326 	cp a,#TK_GRP_ADD 
      00922B 07 90            [ 1] 3327 	jreq 2$ 
      00922D 5C 5C            [ 1] 3328 	ld a,(OP,sp)
      00922F 0A 01 20         [ 4] 3329 	call unget_token
      009232 EE 1C            [ 2] 3330 	jra 9$
      009233                       3331 2$: 
      009233 16 02 72         [ 4] 3332 	call term
      009236 A2 00            [ 1] 3333 	cp a,#TK_INTGR 
      009238 02 4B            [ 1] 3334 	jreq 3$
      00923A 00 90 FE         [ 2] 3335 	jp syntax_error
      00923D 84 27            [ 2] 3336 3$:	ldw (N1,sp),x 
      00923F 24 20            [ 1] 3337 	ld a,(OP,sp)
      009241 D2 10            [ 1] 3338 	cp a,#TK_PLUS 
      009242 26 05            [ 1] 3339 	jrne 4$
      009242 16 02 90         [ 4] 3340 	call add 
      009245 F6 6B            [ 2] 3341 	jra 0$ 
      009247 01 A4 7F         [ 4] 3342 4$:	call substract
      00924A 4C C7            [ 2] 3343 	jra 0$
      00924C 00 0B            [ 2] 3344 9$: ldw x,(N2,sp)
      00924E 72 5F            [ 1] 3345 	ld a,#TK_INTGR	
      001330                       3346 expr_exit:
      001330                       3347 	_drop VSIZE 
      009250 00 0A            [ 2]    1     addw sp,#VSIZE 
      009252 72               [ 4] 3348 	ret 
                                   3349 
                                   3350 ;---------------------------------------------
                                   3351 ; rel ::= expr rel_op expr
                                   3352 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3353 ;  relation return 1 | 0  for true | false 
                                   3354 ;  output:
                                   3355 ;    A 		token attribute  
                                   3356 ;	 X		1|0
                                   3357 ;---------------------------------------------
                           000001  3358 	N1=1
                           000003  3359 	N2=3
                           000005  3360 	RELOP=5
                           000005  3361 	VSIZE=5 
      001333                       3362 relation: 
      001333                       3363 	_vars VSIZE
      009253 B9 00            [ 2]    1     sub sp,#VSIZE 
      009255 0A 90 FE         [ 4] 3364 	call expression
      009258 7B 01            [ 1] 3365 	cp a,#CMD_END  
      00925A A5 80            [ 1] 3366 	jrmi rel_exit 
                                   3367 	; expect rel_op or leave 
      00925C 27 04            [ 2] 3368 	ldw (N2,sp),x 
      00925E A6 07 20         [ 4] 3369 	call next_token 
      009261 02 A6            [ 1] 3370 	cp a,#2
      009263 06 3E            [ 1] 3371 	jrmi 9$
      009264                       3372 1$:	
      009264 93 5B            [ 1] 3373 	ld (RELOP,sp),a 
      009266 03 81            [ 1] 3374 	and a,#TK_GRP_MASK
      009268 A1 30            [ 1] 3375 	cp a,#TK_GRP_RELOP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009268 88 CD            [ 1] 3376 	jreq 2$
      00926A 88 88            [ 1] 3377 	ld a,(RELOP,sp)
      00926C 11 01 27         [ 4] 3378 	call unget_token  
      00926F 03 CC            [ 2] 3379 	jra 9$
      001354                       3380 2$:	; expect another expression or error 
      009271 87 A2 84         [ 4] 3381 	call expression
      009274 81 03            [ 1] 3382 	cp a,#TK_INTGR 
      009275 27 03            [ 1] 3383 	jreq 3$
      009275 4B 00 CD         [ 2] 3384 	jp syntax_error 
      009278 93 B3            [ 2] 3385 3$:	ldw (N1,sp),x 
      00927A A1 00 27         [ 4] 3386 	call substract
      00927D 19 A1            [ 1] 3387 	jrne 4$
      00927F 03 26 12 CD      [ 1] 3388 	mov acc8,#2 ; n1==n2
      009283 90 45            [ 2] 3389 	jra 6$ 
      00136B                       3390 4$: 
      009285 0C 01            [ 1] 3391 	jrsgt 5$  
      009287 CD 88 88 A1      [ 1] 3392 	mov acc8,#4 ; n1<2 
      00928B 00 27            [ 2] 3393 	jra 6$
      001373                       3394 5$:
      00928D 09 A1 0B 26      [ 1] 3395 	mov acc8,#1 ; n1>n2 
      001377                       3396 6$:
      009291 02               [ 1] 3397 	clrw x 
      009292 20 E3 CD         [ 1] 3398 	ld a, acc8  
      009295 90 3E            [ 1] 3399 	and a,(RELOP,sp)
      009297 84               [ 1] 3400 	tnz a 
      009298 81 05            [ 1] 3401 	jreq 10$
      009299 5C               [ 1] 3402 	incw x 
      001381                       3403 7$:	 
      009299 CD 90            [ 2] 3404 	jra 10$  	
      00929B 79 A6            [ 2] 3405 9$: ldw x,(N2,sp)
      001385                       3406 10$:
      00929D 09 CD            [ 1] 3407 	ld a,#TK_INTGR
      001387                       3408 rel_exit: 	 
      001387                       3409 	_drop VSIZE
      00929F 92 68            [ 2]    1     addw sp,#VSIZE 
      0092A1 CD               [ 4] 3410 	ret 
                                   3411 
                                   3412 ;--------------------------------
                                   3413 ; BASIC: SHOW 
                                   3414 ;  show content of dstack,cstack
                                   3415 ;--------------------------------
      00138A                       3416 show:
      0092A2 93 B3 A1         [ 1] 3417 	ld a,base 
      0092A5 03               [ 1] 3418 	push a 
      0092A6 27 03 CC         [ 4] 3419 	call dots
      0092A9 87 A2 89         [ 4] 3420 	call dotr 
      0092AC A6               [ 1] 3421 	pop a 
      0092AD 0A CD 92         [ 1] 3422 	ld base,a 
      0092B0 68               [ 1] 3423 	clr a 
      0092B1 85               [ 4] 3424 	ret
                                   3425 
                                   3426 ;--------------------------------------------
                                   3427 ; BASIC: HEX 
                                   3428 ; select hexadecimal base for integer print
                                   3429 ;---------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00139A                       3430 hex_base:
      0092B2 C3 00 23 23      [ 1] 3431 	mov base,#16 
      0092B6 05               [ 4] 3432 	ret 
                                   3433 
                                   3434 ;--------------------------------------------
                                   3435 ; BASIC: DEC 
                                   3436 ; select decimal base for integer print
                                   3437 ;---------------------------------------------
      00139F                       3438 dec_base:
      0092B7 A6 0A CC 87      [ 1] 3439 	mov base,#10
      0092BB A4               [ 4] 3440 	ret 
                                   3441 
                                   3442 ;------------------------
                                   3443 ; BASIC: SIZE 
                                   3444 ; return free size in text area
                                   3445 ; output:
                                   3446 ;   A 		TK_INTGR
                                   3447 ;   X 	    size integer
                                   3448 ;--------------------------
      0013A4                       3449 size:
      0092BC 5D 27 F8         [ 2] 3450 	ldw x,#tib 
      0092BF 58 89 CE 00      [ 2] 3451 	subw x,txtend 
      0092C3 21 72            [ 1] 3452 	ld a,#TK_INTGR
      0092C5 F0               [ 4] 3453 	ret 
                                   3454 
                                   3455 
                                   3456 ;------------------------
                                   3457 ; BASIC: UBOUND  
                                   3458 ; return array variable size 
                                   3459 ; output:
                                   3460 ;   A 		TK_INTGR
                                   3461 ;   X 	    array size 
                                   3462 ;--------------------------
      0013AE                       3463 ubound:
      0092C6 01 5B 02         [ 2] 3464 	ldw x,#tib
      0092C9 A6 03 81 1D      [ 2] 3465 	subw x,txtend 
      0092CC 54               [ 2] 3466 	srlw x 
      0092CC 52 01 CD         [ 2] 3467 	ldw array_size,x
      0092CF 88 88            [ 1] 3468 	ld a,#TK_INTGR
      0092D1 A1               [ 4] 3469 	ret 
                                   3470 
                                   3471 ;-----------------------------
                                   3472 ; BASIC: LET var=expr 
                                   3473 ; variable assignement 
                                   3474 ; output:
                                   3475 ;   A 		TK_NONE 
                                   3476 ;-----------------------------
      0013BC                       3477 let:
      0092D2 02 2B 4A         [ 4] 3478 	call next_token 
      0092D5 6B 01            [ 1] 3479 	cp a,#TK_VAR 
      0092D7 A4 30            [ 1] 3480 	jreq let02
      0092D9 A1 10 27         [ 2] 3481 	jp syntax_error
      0013C6                       3482 let02:
      0092DC 04 7B 01         [ 4] 3483 	call dpush 
      0092DF 20 03 08         [ 4] 3484 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0092E1 A1 32            [ 1] 3485 	cp a,#TK_EQUAL
      0092E1 CD 88            [ 1] 3486 	jreq 1$
      0092E3 88 07 22         [ 2] 3487 	jp syntax_error
      0092E4                       3488 1$:	
      0092E4 A1 07 26         [ 4] 3489 	call relation   
      0092E7 03 FD            [ 1] 3490 	cp a,#TK_INTGR 
      0092E9 20 2B            [ 1] 3491 	jreq 2$
      0092EB CC 07 22         [ 2] 3492 	jp syntax_error
      0013DD                       3493 2$:	
      0092EB A1 03            [ 1] 3494 	ldw y,x 
      0092ED 26 02 20         [ 4] 3495 	call dpop  
      0092F0 25               [ 2] 3496 	ldw (x),y   
      0092F1 81               [ 4] 3497 	ret 
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
      0013E4                       3510 list:
      0013E4                       3511 	_vars VSIZE
      0092F1 A1 05            [ 2]    1     sub sp,#VSIZE 
      0092F3 26 06 CD         [ 2] 3512 	ldw x,txtbgn 
      0092F6 92 99 FE         [ 2] 3513 	cpw x,txtend 
      0092F9 20 1B            [ 1] 3514 	jrmi 1$
      0092FB CC 14 64         [ 2] 3515 	jp list_exit ; nothing to list 
      0092FB A1 04            [ 2] 3516 1$:	ldw (LN_PTR,sp),x 
      0092FD 26               [ 2] 3517 	ldw x,(x) 
      0092FE 03 FE            [ 2] 3518 	ldw (FIRST,sp),x ; list from first line 
      009300 20 14 FF         [ 2] 3519 	ldw x,#0x7fff ; biggest line number 
      009302 1F 03            [ 2] 3520 	ldw (LAST,sp),x 
      009302 A1 09 26         [ 4] 3521 	call arg_list
      009305 0A               [ 1] 3522 	tnz a
      009306 CD 93            [ 1] 3523 	jreq list_start 
      009308 B3 A6            [ 1] 3524 	cp a,#2 
      00930A 0A CD            [ 1] 3525 	jreq 4$
      00930C 92 68            [ 1] 3526 	cp a,#1 
      00930E 20 06            [ 1] 3527 	jreq first_line 
      009310 CC 07 22         [ 2] 3528 	jp syntax_error 
      009310 CD 90 3E         [ 4] 3529 4$:	call dswap
      00140F                       3530 first_line:
      009313 4F 20 09         [ 4] 3531 	call dpop 
      009316 1F 01            [ 2] 3532 	ldw (FIRST,sp),x 
      009316 A6 11            [ 1] 3533 	cp a,#1 
      009318 11 01            [ 1] 3534 	jreq lines_skip 	
      001418                       3535 last_line:
      00931A 26 01 50         [ 4] 3536 	call dpop 
      00931D 1F 03            [ 2] 3537 	ldw (LAST,sp),x 
      00141D                       3538 lines_skip:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00931D A6 03 1B         [ 2] 3539 	ldw x,txtbgn
      00931F 1F 05            [ 2] 3540 2$:	ldw (LN_PTR,sp),x 
      00931F 5B 01 81         [ 2] 3541 	cpw x,txtend 
      009322 2A 3D            [ 1] 3542 	jrpl list_exit 
      009322 52               [ 2] 3543 	ldw x,(x) ;lineno 
      009323 05 CD            [ 2] 3544 	cpw x,(FIRST,sp)
      009325 92 CC            [ 1] 3545 	jrpl list_start 
      009327 A1 02            [ 2] 3546 	ldw x,(LN_PTR,sp) 
      009329 2B 41 02         [ 2] 3547 	addw x,#2 
      00932B F6               [ 1] 3548 	ld a,(x)
      00932B 1F               [ 1] 3549 	incw x 
      00932C 03 CD 88         [ 1] 3550 	ld acc8,a 
      00932F 88 A1 02 2B      [ 1] 3551 	clr acc16 
      009333 34 6B 05 A4      [ 2] 3552 	addw x,acc16
      009337 30 A1            [ 2] 3553 	jra 2$ 
                                   3554 ; print loop
      001440                       3555 list_start:
      009339 20 27            [ 2] 3556 	ldw x,(LN_PTR,sp)
      001442                       3557 3$:	
      00933B 07 7B 05         [ 4] 3558 	call prt_basic_line
      00933E CD 90            [ 2] 3559 	ldw x,(LN_PTR,sp)
      009340 3E 20            [ 1] 3560 	ld a,(2,x)
      009342 25 00 0A         [ 1] 3561 	ld acc8,a 
      009343 72 5F 00 09      [ 1] 3562 	clr acc16 
      009343 CD 92 CC A1      [ 2] 3563 	addw x,acc16
      009347 03 27 03         [ 2] 3564 	cpw x,txtend 
      00934A CC 87            [ 1] 3565 	jrpl list_exit
      00934C A2 1F            [ 2] 3566 	ldw (LN_PTR,sp),x
      00934E 01               [ 2] 3567 	ldw x,(x)
      00934F 7B 05            [ 2] 3568 	cpw x,(LAST,sp)  
      009351 A1 20            [ 1] 3569 	jrsgt list_exit 
      009353 26 05            [ 2] 3570 	ldw x,(LN_PTR,sp)
      009355 CD 91            [ 2] 3571 	jra 3$
      001464                       3572 list_exit:
      001464                       3573 	_drop VSIZE 
      009357 41 20            [ 2]    1     addw sp,#VSIZE 
      009359 D1               [ 4] 3574 	ret
                                   3575 
                                   3576 ;-------------------------
                                   3577 ; print counted string 
                                   3578 ; input:
                                   3579 ;   X 		address of string
                                   3580 ;--------------------------
      001467                       3581 prt_cmd_name:
      00935A A1               [ 1] 3582 	ld a,(x)
      00935B 21               [ 1] 3583 	incw x
      00935C 26 05            [ 1] 3584 	and a,#15  
      00935E CD               [ 1] 3585 	push a 
      00935F 91 89            [ 1] 3586 1$: tnz (1,sp) 
      009361 20 C8            [ 1] 3587 	jreq 9$
      009363 CD               [ 1] 3588 	ld a,(x)
      009364 91 CD 20         [ 4] 3589 	call putc 
      009367 C3               [ 1] 3590 	incw x
      009368 1E 03            [ 1] 3591 	dec (1,sp)	 
      00936A A6 03            [ 2] 3592 	jra 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00936C 84               [ 1] 3593 9$: pop a 
      00936C 5B               [ 4] 3594 	ret	
                                   3595 
                                   3596 ;--------------------------
                                   3597 ; decompile line from token list 
                                   3598 ; input:
                                   3599 ;   X 		pointer at line
                                   3600 ; output:
                                   3601 ;   none 
                                   3602 ;--------------------------	
                           000001  3603 	BASE_SAV=1
                           000002  3604 	WIDTH_SAV=2
                           000003  3605 	XSAVE=3
                           000005  3606 	LLEN=5
                           000005  3607 	VSIZE=5 
      00147B                       3608 prt_basic_line:
      00147B                       3609 	_vars VSIZE 
      00936D 05 81            [ 2]    1     sub sp,#VSIZE 
      00936F C6 00 07         [ 1] 3610 	ld a,base
      00936F 52 05            [ 1] 3611 	ld (BASE_SAV,sp),a  
      009371 CD 93 22         [ 1] 3612 	ld a,tab_width 
      009374 A1 02            [ 1] 3613 	ld (WIDTH_SAV,sp),a 
      009376 2B 38 1F         [ 2] 3614 	ldw ptr16,x
      009379 03               [ 2] 3615 	ldw x,(x)
      00937A CD 88 88 A1      [ 1] 3616 	mov base,#10
      00937E 02 2B 2B 6B      [ 1] 3617 	mov tab_width,#5
      009382 05 A4 30         [ 4] 3618 	call print_int ; print line number 
      009385 A1 10            [ 1] 3619 	ld a,#SPACE 
      009387 27 07 7B         [ 4] 3620 	call putc 
      00938A 05 CD 90 3E      [ 1] 3621 	clr tab_width
      00938E 20 1C 02         [ 2] 3622 	ldw x,#2
      009390 72 D6 00 14      [ 4] 3623 	ld a,([ptr16],x)
      009390 CD 93            [ 1] 3624 	ld (LLEN,sp),a 
      009392 22               [ 1] 3625 	incw x
      009393 A1               [ 1] 3626 1$:	ld a,xl 
      009394 03 27            [ 1] 3627 	cp a,(LLEN,sp)
      009396 03 CC            [ 1] 3628 	jrmi 19$
      009398 87 A2 1F         [ 2] 3629 	jp 90$
      0014B1                       3630 19$:	 
      00939B 01 7B 05 A1      [ 4] 3631 	ld a,([ptr16],x)
      00939F 10               [ 1] 3632 	incw x 
      0093A0 26 05            [ 2] 3633 	ldw (XSAVE,sp),x 
      0093A2 CD 91            [ 1] 3634 	cp a,#TK_CMD 
      0093A4 33 20            [ 1] 3635 	jreq 2$
      0093A6 D1 CD            [ 1] 3636 	cp a,#TK_FUNC 
      0093A8 91 3B            [ 1] 3637 	jrne 4$
      0014C0                       3638 2$:	
      0093AA 20 CC 1E 03      [ 5] 3639 	ldw x,([ptr16],x)
      0093AE A6 03 05         [ 2] 3640 	cpw x,#rem 
      0093B0 26 14            [ 1] 3641 	jrne 3$
      0093B0 5B 05            [ 1] 3642 	ld a,#''
      0093B2 81 01 9E         [ 4] 3643 	call putc 
      0093B3 1E 03            [ 2] 3644 	ldw x,(XSAVE,sp)
      0093B3 52 05 CD         [ 2] 3645 	addw x,#2
      0093B6 93 6F A1 02      [ 2] 3646 	addw x,ptr16  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0093BA 2B 4B 1F         [ 4] 3647 	call puts 
      0093BD 03 CD 88         [ 2] 3648 	jp 90$ 
      0093C0 88 A1 02         [ 4] 3649 3$:	call cmd_name
      0093C3 2B 3E 67         [ 4] 3650 	call prt_cmd_name
      0093C5 A6 20            [ 1] 3651 	ld a,#SPACE 
      0093C5 6B 05 A4         [ 4] 3652 	call putc 
      0093C8 30 A1            [ 2] 3653 	ldw x,(XSAVE,sp)
      0093CA 30 27 07         [ 2] 3654 	addw x,#2
      0093CD 7B 05            [ 2] 3655 	jra 1$
      0093CF CD 90            [ 1] 3656 4$: cp a,#TK_QSTR 
      0093D1 3E 20            [ 1] 3657 	jrne 5$
      0093D3 2F 22            [ 1] 3658 	ld a,#'" 
      0093D4 CD 01 9E         [ 4] 3659 	call putc 
      0093D4 CD 93 6F A1      [ 2] 3660 	addw x,ptr16
      0093D8 03 27 03         [ 4] 3661 	call puts 
      0093DB CC 87            [ 1] 3662 	ld a,#'" 
      0093DD A2 1F 01         [ 4] 3663 	call putc 
      0093E0 CD               [ 1] 3664 	incw x
      0093E1 91 3B 26 06      [ 2] 3665 	subw x,ptr16  
      0093E5 35 02            [ 2] 3666 	jra 1$
      0093E7 00 0B            [ 1] 3667 5$:	cp a,#TK_VAR
      0093E9 20 0C            [ 1] 3668 	jrne 6$ 
      0093EB 72 DE 00 14      [ 5] 3669 	ldw x,([ptr16],x)
      0093EB 2C 06 35         [ 2] 3670 	subw x,#vars 
      0093EE 04               [ 1] 3671 	ld a,xl
      0093EF 00               [ 1] 3672 	srl a 
      0093F0 0B 20            [ 1] 3673 	add a,#'A 
      0093F2 04 01 9E         [ 4] 3674 	call putc 
      0093F3 A6 20            [ 1] 3675 	ld a,#SPACE 
      0093F3 35 01 00         [ 4] 3676 	call putc 
      0093F6 0B 03            [ 2] 3677 	ldw x,(XSAVE,sp)
      0093F7 1C 00 02         [ 2] 3678 	addw x,#2 
      0093F7 5F C6            [ 2] 3679 	jra 1$ 
      0093F9 00 0B            [ 1] 3680 6$: cp a,#TK_ARRAY 
      0093FB 14 05            [ 1] 3681 	jrne 7$
      0093FD 4D 27            [ 1] 3682 	ld a,#'@ 
      0093FF 05 5C 9E         [ 4] 3683 	call putc 
      009401 1E 03            [ 2] 3684 	ldw x,(XSAVE,sp)
      009401 20 02 1E         [ 2] 3685 	jp 1$ 
      009404 03 03            [ 1] 3686 7$: cp a,#TK_INTGR 
      009405 26 14            [ 1] 3687 	jrne 8$
      009405 A6 03 00 14      [ 5] 3688 	ldw x,([ptr16],x)
      009407 CD 09 A7         [ 4] 3689 	call print_int
      009407 5B 05            [ 1] 3690 	ld a,#SPACE 
      009409 81 01 9E         [ 4] 3691 	call putc 
      00940A 1E 03            [ 2] 3692 	ldw x,(XSAVE,sp)
      00940A C6 00 08         [ 2] 3693 	addw x,#2 
      00940D 88 CD 90         [ 2] 3694 	jp 1$
      009410 D3 CD            [ 1] 3695 8$: cp a,#TK_GT 
      009412 91 06            [ 1] 3696 	jrmi 9$
      009414 84 C7            [ 1] 3697 	cp a,#TK_NE 
      009416 00 08            [ 1] 3698 	jrugt 9$
      009418 4F 81            [ 1] 3699 	sub a,#TK_GT  
      00941A 48               [ 1] 3700 	sll a 
      00941A 35 10            [ 1] 3701 	clrw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      00941C 00 08            [ 1] 3702 	ld yl,a 
      00941E 81 A9 15 DC      [ 2] 3703 	addw y,#relop_str 
      00941F 90 FE            [ 2] 3704 	ldw y,(y)
      00941F 35               [ 1] 3705 	ldw x,y 
      009420 0A 00 08         [ 4] 3706 	call puts 
      009423 81 03            [ 2] 3707 	ldw x,(XSAVE,sp)
      009424 CC 14 A9         [ 2] 3708 	jp 1$
      009424 AE 16            [ 1] 3709 9$: cp a,#TK_PLUS 
      009426 C8 72            [ 1] 3710 	jrne 10$
      009428 B0 00            [ 1] 3711 	ld a,#'+
      00942A 1E A6            [ 2] 3712 	jra 80$ 
      00942C 03 81            [ 1] 3713 10$: cp a,#TK_MINUS
      00942E 26 04            [ 1] 3714 	jrne 11$
      00942E AE 16            [ 1] 3715 	ld a,#'-
      009430 C8 72            [ 2] 3716 	jra 80$
      009432 B0 00            [ 1] 3717 11$: cp a,#TK_MULT 
      009434 1E 54            [ 1] 3718 	jrmi 12$
      009436 CF 00            [ 1] 3719 	cp a,#TK_MOD 
      009438 23 A6            [ 1] 3720 	jrugt 12$
      00943A 03 81            [ 1] 3721 	sub a,#0x20
      00943C 5F               [ 1] 3722 	clrw x 
      00943C CD               [ 1] 3723 	ld xl,a 
      00943D 88 88 A1         [ 2] 3724 	addw x,#mul_char 
      009440 04               [ 1] 3725 	ld a,(x)
      009441 27 03            [ 2] 3726 	jra 80$ 
      009443 CC 87            [ 1] 3727 12$: cp a,#TK_LPAREN 
      009445 A2 0E            [ 1] 3728 	jrmi 13$
      009446 A1 0C            [ 1] 3729 	cp a,#TK_SHARP 
      009446 CD 90            [ 1] 3730 	jrugt 13$
      009448 45 CD            [ 1] 3731 	sub a,#TK_LPAREN
      00944A 88               [ 1] 3732 	clrw x 
      00944B 88               [ 1] 3733 	ld xl,a 
      00944C A1 32 27         [ 2] 3734 	addw x,#single_char 
      00944F 03               [ 1] 3735 	ld a,(x)
      009450 CC 87            [ 2] 3736 	jra 80$
      009452 A2 02            [ 1] 3737 13$: cp a,#TK_CHAR 
      009453 26 14            [ 1] 3738 	jrne 14$
      009453 CD 93            [ 1] 3739 	ld a,#'\
      009455 B3 A1 03         [ 4] 3740 	call putc 
      009458 27 03            [ 2] 3741 	ldw x,(XSAVE,sp)
      00945A CC 87 A2 14      [ 4] 3742 	ld a,([ptr16],x)
      00945D 5C               [ 1] 3743 	incw x 
      00945D 90 93            [ 2] 3744 	ldw (XSAVE,sp),x 
      00945F CD 90 52         [ 4] 3745 	call putc 
      009462 FF 81 A9         [ 2] 3746 	jp 1$ 
      009464 A6 3A            [ 1] 3747 14$: ld a,#':
      009464 52 06 CE         [ 4] 3748 80$: call putc 
      009467 00 1C            [ 2] 3749 	ldw x,(XSAVE,sp)
      009469 C3 00 1E         [ 2] 3750 	jp 1$ 
      0015C3                       3751 90$: 
      00946C 2B 03            [ 1] 3752 	ld a,#CR 
      00946E CC 94 E4         [ 4] 3753 	call putc
      009471 1F 05            [ 1] 3754 	ld a,(WIDTH_SAV,sp) 
      009473 FE 1F 01         [ 1] 3755 	ld tab_width,a 
      009476 AE 7F            [ 1] 3756 	ld a,(BASE_SAV,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009478 FF 1F 03         [ 1] 3757 	ld base,a
      0015D2                       3758 	_drop VSIZE 
      00947B CD 92            [ 2]    1     addw sp,#VSIZE 
      00947D 75               [ 4] 3759 	ret 	
      00947E 4D 27 3F A1           3760 single_char: .byte '(',')',',','#'
      009482 02 27 07              3761 mul_char: .byte '*','/','%'
      009485 A1 01 27 06 CC 87 A2  3762 relop_str: .word gt,equal,ge,lt,le,ne 
             CD 90 5F 15 F4
      00948F 3E 00                 3763 gt: .asciz ">"
      00948F CD 90                 3764 equal: .asciz "="
      009491 52 1F 01              3765 ge: .asciz ">="
      009494 A1 01                 3766 lt: .asciz "<"
      009496 27 05 00              3767 le: .asciz "<="
      009498 3C 3E 00              3768 ne:  .asciz "<>"
                                   3769 
                                   3770 
                                   3771 ;---------------------------------
                                   3772 ; BASIC: PRINT|? arg_list 
                                   3773 ; print values from argument list
                                   3774 ;----------------------------------
                           000001  3775 	COMMA=1
                           000001  3776 	VSIZE=1
      0015F7                       3777 print:
      009498 CD 90            [ 1] 3778 push #0 ; local variable COMMA 
      0015F9                       3779 reset_comma:
      00949A 52 1F            [ 1] 3780 	clr (COMMA,sp)
      0015FB                       3781 prt_loop:
      00949C 03 13 33         [ 4] 3782 	call relation 
      00949D A1 01            [ 1] 3783 	cp a,#TK_COLON 
      00949D CE 00            [ 1] 3784 	jreq print_exit   
      00949F 1C 1F            [ 1] 3785 	cp a,#TK_INTGR 
      0094A1 05 C3            [ 1] 3786 	jrne 0$ 
      0094A3 00 1E 2A         [ 4] 3787 	call print_int 
      0094A6 3D FE            [ 2] 3788 	jra reset_comma
      00160B                       3789 0$: 	
      0094A8 13 01 2A         [ 4] 3790 	call next_token
      0094AB 14 1E            [ 1] 3791 	cp a,#TK_NONE 
      0094AD 05 1C            [ 1] 3792 	jreq print_exit 
      0094AF 00 02            [ 1] 3793 1$:	cp a,#TK_QSTR
      0094B1 F6 5C            [ 1] 3794 	jrne 2$   
      0094B3 C7 00 0B         [ 4] 3795 	call puts
      0094B6 72               [ 1] 3796 	incw x 
      0094B7 5F 00 0A 72      [ 2] 3797 	subw x,basicptr 
      0094BB BB               [ 1] 3798 	ld a,xl 
      0094BC 00 0A 20         [ 1] 3799 	ld in,a  
      0094BF E0 D5            [ 2] 3800 	jra reset_comma
      0094C0 A1 02            [ 1] 3801 2$: cp a,#TK_CHAR 
      0094C0 1E 05            [ 1] 3802 	jrne 3$
      0094C2 9F               [ 1] 3803 	ld a,xl 
      0094C2 CD 94 FB         [ 4] 3804 	call putc 
      0094C5 1E 05            [ 2] 3805 	jra reset_comma 
      00162E                       3806 3$: 	
      0094C7 E6 02            [ 1] 3807 	cp a,#TK_FUNC 
      0094C9 C7 00            [ 1] 3808 	jrne 4$ 
      0094CB 0B               [ 4] 3809 	call (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0094CC 72 5F 00         [ 4] 3810 	call print_int 
      0094CF 0A 72            [ 2] 3811 	jra reset_comma 
      001638                       3812 4$: 
      0094D1 BB 00            [ 1] 3813 	cp a,#TK_COMMA 
      0094D3 0A C3            [ 1] 3814 	jrne 5$
      0094D5 00 1E            [ 1] 3815 	cpl (COMMA,sp) 
      0094D7 2A 0B 1F         [ 2] 3816 	jp prt_loop   
      001641                       3817 5$: 
      0094DA 05 FE            [ 1] 3818 	cp a,#TK_SHARP
      0094DC 13 03            [ 1] 3819 	jrne 7$
      0094DE 2C 04 1E         [ 4] 3820 	call next_token
      0094E1 05 20            [ 1] 3821 	cp a,#TK_INTGR 
      0094E3 DE 03            [ 1] 3822 	jreq 6$
      0094E4 CC 07 22         [ 2] 3823 	jp syntax_error 
      00164F                       3824 6$:
      0094E4 5B               [ 1] 3825 	ld a,xl 
      0094E5 06 81            [ 1] 3826 	and a,#15 
      0094E7 C7 00 25         [ 1] 3827 	ld tab_width,a 
      0094E7 F6 5C A4         [ 2] 3828 	jp reset_comma 
      001658                       3829 7$:	
      0094EA 0F 88 0D         [ 4] 3830 	call unget_token
      00165B                       3831 print_exit:
      0094ED 01 27            [ 1] 3832 	tnz (COMMA,sp)
      0094EF 09 F6            [ 1] 3833 	jrne 9$
      0094F1 CD 82            [ 1] 3834 	ld a,#CR 
      0094F3 1E 5C 0A         [ 4] 3835     call putc 
      001664                       3836 9$:	_drop VSIZE 
      0094F6 01 20            [ 2]    1     addw sp,#VSIZE 
      0094F8 F3               [ 4] 3837 	ret 
                                   3838 
                                   3839 ;----------------------
                                   3840 ; 'save_context' and
                                   3841 ; 'rest_context' must be 
                                   3842 ; called at the same 
                                   3843 ; call stack depth 
                                   3844 ; i.e. SP must have the 
                                   3845 ; save value at  
                                   3846 ; entry point of both 
                                   3847 ; routine. 
                                   3848 ;---------------------
                           000006  3849 	CTXT_SIZE=6 ; size of saved data 
                                   3850 ;--------------------
                                   3851 ; save current BASIC
                                   3852 ; interpreter context 
                                   3853 ; on cstack 
                                   3854 ;--------------------
      001667                       3855 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001667                       3856 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001667                       3857 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001667                       3858 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001667                       3859 	_arg CNT 6
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                           000008     1     CNT=ARG_OFS+6 
      001667                       3860 save_context:
      0094F9 84 81 03         [ 2] 3861 	ldw x,basicptr 
      0094FB 1F 03            [ 2] 3862 	ldw (BPTR,sp),x
      0094FB 52 05 C6         [ 2] 3863 	ldw x,lineno 
      0094FE 00 08            [ 2] 3864 	ldw (LNO,sp),x 
      009500 6B 01 C6         [ 1] 3865 	ld a,in 
      009503 00 26            [ 1] 3866 	ld (IN,sp),a
      009505 6B 02 CF         [ 1] 3867 	ld a,count 
      009508 00 15            [ 1] 3868 	ld (CNT,sp),a  
      00950A FE               [ 4] 3869 	ret
                                   3870 
                                   3871 ;-----------------------
                                   3872 ; restore previously saved 
                                   3873 ; BASIC interpreter context 
                                   3874 ; from cstack 
                                   3875 ;-------------------------
      00167C                       3876 rest_context:
      00950B 35 0A            [ 2] 3877 	ldw x,(BPTR,sp)
      00950D 00 08 35         [ 2] 3878 	ldw basicptr,x 
      009510 05 00            [ 2] 3879 	ldw x,(LNO,sp)
      009512 26 CD 8A         [ 2] 3880 	ldw lineno,x 
      009515 27 A6            [ 1] 3881 	ld a,(IN,sp)
      009517 20 CD 82         [ 1] 3882 	ld in,a
      00951A 1E 72            [ 1] 3883 	ld a,(CNT,sp)
      00951C 5F 00 26         [ 1] 3884 	ld count,a  
      00951F AE               [ 4] 3885 	ret
                                   3886 
                                   3887 ;------------------------------------------
                                   3888 ; BASIC: INPUT [string],var[,[string],var]
                                   3889 ; input value in variables 
                                   3890 ; [string] optionally can be used as prompt 
                                   3891 ;-----------------------------------------
                           000001  3892 	CX_BPTR=1
                           000003  3893 	CX_LNO=3
                           000004  3894 	CX_IN=4
                           000005  3895 	CX_CNT=5
                           000006  3896 	SKIP=6
                           000007  3897 	VSIZE=7
      001691                       3898 input_var:
      009520 00 02 72 D6 00   [ 2] 3899 	btjt flags,#FRUN,1$ 
      009525 15 6B            [ 1] 3900 	ld a,#ERR_RUN_ONLY 
      009527 05 5C 9F         [ 2] 3901 	jp tb_error 
      00169B                       3902 1$:	_vars VSIZE 
      00952A 11 05            [ 2]    1     sub sp,#VSIZE 
      00169D                       3903 input_loop:
      00952C 2B 03            [ 1] 3904 	clr (SKIP,sp)
      00952E CC 96 43         [ 4] 3905 	call next_token 
      009531 A1 00            [ 1] 3906 	cp a,#TK_NONE 
      009531 72 D6            [ 1] 3907 	jreq input_exit 
      009533 00 15            [ 1] 3908 	cp a,#TK_QSTR 
      009535 5C 1F            [ 1] 3909 	jrne 1$ 
      009537 03 A1 06         [ 4] 3910 	call puts 
      00953A 27 04            [ 1] 3911 	cpl (SKIP,sp)
      00953C A1 07 26         [ 4] 3912 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00953F 2F 04            [ 1] 3913 1$: cp a,#TK_VAR  
      009540 27 03            [ 1] 3914 	jreq 2$ 
      009540 72 DE 00         [ 2] 3915 	jp syntax_error
      009543 15 A3 97         [ 4] 3916 2$:	call dpush 
      009546 85 26            [ 1] 3917 	tnz (SKIP,sp)
      009548 14 A6            [ 1] 3918 	jrne 21$ 
      00954A 27 CD            [ 1] 3919 	ld a,#':
      00954C 82 1E 1E         [ 1] 3920 	ld pad+1,a 
      00954F 03 1C 00 02      [ 1] 3921 	clr pad+2
      009553 72 BB 00         [ 2] 3922 	ldw x,#pad 
      009556 15 CD 82         [ 4] 3923 	call puts   
      0016CF                       3924 21$:
      009559 30 CC 96         [ 4] 3925 	call save_context 
      00955C 43 CD 91         [ 2] 3926 	ldw x,#tib 
      00955F DE CD 94         [ 2] 3927 	ldw basicptr,x  
      009562 E7 A6 20 CD      [ 1] 3928 	clr count  
      009566 82 1E 1E         [ 4] 3929 	call readln 
      009569 03 1C 00 02      [ 1] 3930 	clr in 
      00956D 20 BA A1         [ 4] 3931 	call relation 
      009570 08 26            [ 1] 3932 	cp a,#TK_INTGR
      009572 18 A6            [ 1] 3933 	jreq 3$ 
      009574 22 CD 82         [ 2] 3934 	jp syntax_error
      009577 1E 72 BB         [ 4] 3935 3$: call dpush 
      00957A 00 15 CD         [ 4] 3936 	call store 
      00957D 82 30 A6         [ 4] 3937 	call rest_context
      009580 22 CD 82         [ 4] 3938 	call next_token 
      009583 1E 5C            [ 1] 3939 	cp a,#TK_COMMA 
      009585 72 B0            [ 1] 3940 	jrne 4$
      009587 00 15            [ 2] 3941 	jra input_loop 
      009589 20 9E A1         [ 4] 3942 4$:	call unget_token 
      001702                       3943 input_exit:
      001702                       3944 	_drop VSIZE 
      00958C 04 26            [ 2]    1     addw sp,#VSIZE 
      00958E 1A               [ 4] 3945 	ret 
                                   3946 
                                   3947 
                                   3948 ;---------------------
                                   3949 ; BASIC: REMARK | ' 
                                   3950 ; skip comment to end of line 
                                   3951 ;---------------------- 
      001705                       3952 rem:
      00958F 72 DE 00 15 1D   [ 1] 3953  	mov count,in 
      009594 00               [ 4] 3954 	ret 
                                   3955 
                                   3956 ;---------------------
                                   3957 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3958 ; read in loop 'addr'  
                                   3959 ; apply & 'mask' to value 
                                   3960 ; loop while result==0.  
                                   3961 ; if 'xor_mask' given 
                                   3962 ; apply ^ in second  
                                   3963 ; loop while result==0 
                                   3964 ;---------------------
                           000001  3965 	XMASK=1 
                           000002  3966 	MASK=2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                           000003  3967 	ADDR=3
                           000004  3968 	VSIZE=4
      00170B                       3969 wait: 
      00170B                       3970 	_vars VSIZE
      009595 27 9F            [ 2]    1     sub sp,#VSIZE 
      009597 44 AB            [ 1] 3971 	clr (XMASK,sp) 
      009599 41 CD 82         [ 4] 3972 	call arg_list 
      00959C 1E A6            [ 1] 3973 	cp a,#2
      00959E 20 CD            [ 1] 3974 	jruge 0$
      0095A0 82 1E 1E         [ 2] 3975 	jp syntax_error 
      0095A3 03 1C            [ 1] 3976 0$:	cp a,#3
      0095A5 00 02            [ 1] 3977 	jrult 1$
      0095A7 20 80 A1         [ 4] 3978 	call dpop 
      0095AA 05               [ 1] 3979 	ld a,xl
      0095AB 26 0A            [ 1] 3980 	ld (XMASK,sp),a 
      0095AD A6 40 CD         [ 4] 3981 1$: call dpop ; mask 
      0095B0 82               [ 1] 3982 	ld a,xl 
      0095B1 1E 1E            [ 1] 3983 	ld (MASK,sp),a 
      0095B3 03 CC 95         [ 4] 3984 	call dpop ; address 
      0095B6 29               [ 1] 3985 2$:	ld a,(x)
      0095B7 A1 03            [ 1] 3986 	and a,(MASK,sp)
      0095B9 26 14            [ 1] 3987 	xor a,(XMASK,sp)
      0095BB 72 DE            [ 1] 3988 	jreq 2$ 
      001733                       3989 	_drop VSIZE 
      0095BD 00 15            [ 2]    1     addw sp,#VSIZE 
      0095BF CD               [ 4] 3990 	ret 
                                   3991 
                                   3992 ;---------------------
                                   3993 ; BASIC: BSET addr,mask
                                   3994 ; set bits at 'addr' corresponding 
                                   3995 ; to those of 'mask' that are at 1.
                                   3996 ; arguments:
                                   3997 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3998 ;   mask        mask|addr
                                   3999 ; output:
                                   4000 ;	none 
                                   4001 ;--------------------------
      001736                       4002 bit_set:
      0095C0 8A 27 A6         [ 4] 4003 	call arg_list 
      0095C3 20 CD            [ 1] 4004 	cp a,#2	 
      0095C5 82 1E            [ 1] 4005 	jreq 1$ 
      0095C7 1E 03 1C         [ 2] 4006 	jp syntax_error
      001740                       4007 1$: 
      0095CA 00 02 CC         [ 4] 4008 	call dpop ; mask 
      0095CD 95               [ 1] 4009 	ld a,xl 
      0095CE 29 A1 31         [ 4] 4010 	call dpop ; addr  
      0095D1 2B               [ 1] 4011 	or a,(x)
      0095D2 1A               [ 1] 4012 	ld (x),a
      0095D3 A1               [ 4] 4013 	ret 
                                   4014 
                                   4015 ;---------------------
                                   4016 ; BASIC: BRES addr,mask
                                   4017 ; reset bits at 'addr' corresponding 
                                   4018 ; to those of 'mask' that are at 1.
                                   4019 ; arguments:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4020 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4021 ;   mask	    ~mask&*addr  
                                   4022 ; output:
                                   4023 ;	none 
                                   4024 ;--------------------------
      00174A                       4025 bit_reset:
      0095D4 35 22 16         [ 4] 4026 	call arg_list 
      0095D7 A0 31            [ 1] 4027 	cp a,#2  
      0095D9 48 90            [ 1] 4028 	jreq 1$ 
      0095DB 5F 90 97         [ 2] 4029 	jp syntax_error
      001754                       4030 1$: 
      0095DE 72 A9 96         [ 4] 4031 	call dpop ; mask 
      0095E1 5C               [ 1] 4032 	ld a,xl 
      0095E2 90               [ 1] 4033 	cpl a 
      0095E3 FE 93 CD         [ 4] 4034 	call dpop ; addr  
      0095E6 82               [ 1] 4035 	and a,(x)
      0095E7 30               [ 1] 4036 	ld (x),a 
      0095E8 1E               [ 4] 4037 	ret 
                                   4038 
                                   4039 ;---------------------
                                   4040 ; BASIC: BRES addr,mask
                                   4041 ; toggle bits at 'addr' corresponding 
                                   4042 ; to those of 'mask' that are at 1.
                                   4043 ; arguments:
                                   4044 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4045 ;   mask	    mask^*addr  
                                   4046 ; output:
                                   4047 ;	none 
                                   4048 ;--------------------------
      00175F                       4049 bit_toggle:
      0095E9 03 CC 95         [ 4] 4050 	call arg_list 
      0095EC 29 A1            [ 1] 4051 	cp a,#2 
      0095EE 10 26            [ 1] 4052 	jreq 1$ 
      0095F0 04 A6 2B         [ 2] 4053 	jp syntax_error
      0095F3 20 46 A1         [ 4] 4054 1$: call dpop ; mask 
      0095F6 11               [ 1] 4055 	ld a,xl 
      0095F7 26 04 A6         [ 4] 4056 	call dpop ; addr  
      0095FA 2D               [ 1] 4057 	xor a,(x)
      0095FB 20               [ 1] 4058 	ld (x),a 
      0095FC 3E               [ 4] 4059 	ret 
                                   4060 
                                   4061 
                                   4062 ;--------------------
                                   4063 ; BASIC: POKE addr,byte
                                   4064 ; put a byte at addr 
                                   4065 ;--------------------
      001773                       4066 poke:
      0095FD A1 20 2B         [ 4] 4067 	call arg_list 
      009600 0E A1            [ 1] 4068 	cp a,#2
      009602 22 22            [ 1] 4069 	jreq 1$
      009604 0A A0 20         [ 2] 4070 	jp syntax_error
      00177D                       4071 1$:	
      009607 5F 97 1C         [ 4] 4072 	call dpop 
      00960A 96               [ 1] 4073     ld a,xl 
      00960B 59 F6 20         [ 4] 4074 	call dpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00960E 2C               [ 1] 4075 	ld (x),a 
      00960F A1               [ 4] 4076 	ret 
                                   4077 
                                   4078 ;-----------------------
                                   4079 ; BASIC: PEEK(addr)
                                   4080 ; get the byte at addr 
                                   4081 ; input:
                                   4082 ;	none 
                                   4083 ; output:
                                   4084 ;	X 		value 
                                   4085 ;-----------------------
      001786                       4086 peek:
      009610 09 2B            [ 1] 4087 	ld a,#TK_LPAREN 
      009612 0E A1 0C         [ 4] 4088 	call expect 
      009615 22 0A A0         [ 4] 4089 	call arg_list
      009618 09 5F            [ 1] 4090 	cp a,#1 
      00961A 97 1C            [ 1] 4091 	jreq 1$
      00961C 96 55 F6         [ 2] 4092 	jp syntax_error
      00961F 20 1A            [ 1] 4093 1$:	ld a,#TK_RPAREN 
      009621 A1 02 26         [ 4] 4094 	call expect 
      009624 14 A6 5C         [ 4] 4095 	call dpop 
      009627 CD               [ 1] 4096 	ld a,(x)
      009628 82               [ 1] 4097 	clrw x 
      009629 1E               [ 1] 4098 	ld xl,a 
      00962A 1E 03            [ 1] 4099 	ld a,#TK_INTGR
      00962C 72               [ 4] 4100 	ret 
                                   4101 
      0017A3                       4102 if: 
      00962D D6 00 15         [ 4] 4103 	call relation 
      009630 5C 1F            [ 1] 4104 	cp a,#TK_INTGR
      009632 03 CD            [ 1] 4105 	jreq 1$ 
      009634 82 1E CC         [ 2] 4106 	jp syntax_error
      009637 95               [ 1] 4107 1$:	clr a 
      009638 29               [ 2] 4108 	tnzw x 
      009639 A6 3A            [ 1] 4109 	jrne 9$  
                                   4110 ;skip to next line
      00963B CD 82 1E 1E 03   [ 1] 4111 	mov in,count
      009640 CC               [ 4] 4112 9$:	ret 
                                   4113 
                                   4114 ;------------------------
                                   4115 ; BASIC: FOR var=expr 
                                   4116 ; set variable to expression 
                                   4117 ; leave variable address 
                                   4118 ; on dstack and set
                                   4119 ; FFOR bit in 'flags'
                                   4120 ;-----------------
                           000001  4121 	RETL1=1
                           000003  4122 	INW=3
                           000005  4123 	BPTR=5
      0017B7                       4124 for: ; { -- var_addr }
      009641 95 29            [ 1] 4125 	ld a,#TK_VAR 
      009643 CD 11 E8         [ 4] 4126 	call expect
      009643 A6 0D CD         [ 4] 4127 	call dpush 
      009646 82 1E 7B         [ 4] 4128 	call let02 
      009649 02 C7 00 26      [ 1] 4129 	bset flags,#FFOR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4130 ; open space on cstack for BPTR and INW 
      00964D 7B               [ 2] 4131 	popw x ; call return address 
      0017C7                       4132 	_vars 4
      00964E 01 C7            [ 2]    1     sub sp,#4 
      009650 00               [ 2] 4133 	pushw x  ; RETL1 
      009651 08               [ 1] 4134 	clrw x 
      009652 5B 05            [ 2] 4135 	ldw (BPTR,sp),x 
      009654 81 28            [ 2] 4136 	ldw (INW,sp),x 
      009656 29 2C 23         [ 4] 4137 	call next_token 
      009659 2A 2F            [ 1] 4138 	cp a,#TK_CMD 
      00965B 25 96            [ 1] 4139 	jreq 1$
      00965D 68 96 6A         [ 2] 4140 	jp syntax_error
      0017D9                       4141 1$:  
      009660 96 6C 96         [ 2] 4142 	cpw x,#to 
      009663 6F 96            [ 1] 4143 	jreq to
      009665 71 96 74         [ 2] 4144 	jp syntax_error 
                                   4145 
                                   4146 ;-----------------------------------
                                   4147 ; BASIC: TO expr 
                                   4148 ; second part of FOR loop initilization
                                   4149 ; leave limit on dstack and set 
                                   4150 ; FTO bit in 'flags'
                                   4151 ;-----------------------------------
      0017E1                       4152 to: ; { var_addr -- var_addr limit step }
      009668 3E 00 3D 00 3E   [ 2] 4153 	btjt flags,#FFOR,1$
      00966D 3D 00 3C         [ 2] 4154 	jp syntax_error
      009670 00 3C 3D         [ 4] 4155 1$: call relation  
      009673 00 3C            [ 1] 4156 	cp a,#TK_INTGR 
      009675 3E 00            [ 1] 4157 	jreq 2$ 
      009677 CC 07 22         [ 2] 4158 	jp syntax_error
      0017F3                       4159 2$: 
      009677 4B 00 C5         [ 4] 4160     call dpush ; limit
      009679 CE 00 00         [ 2] 4161 	ldw x,in.w 
      009679 0F 01 08         [ 4] 4162 	call next_token
      00967B A1 00            [ 1] 4163 	cp a,#TK_NONE  
      00967B CD 93            [ 1] 4164 	jreq 4$ 
      00967D B3 A1            [ 1] 4165 	cp a,#TK_CMD
      00967F 01 27            [ 1] 4166 	jrne 3$
      009681 59 A1 03         [ 2] 4167 	cpw x,#step 
      009684 26 05            [ 1] 4168 	jreq step
      001809                       4169 3$:	
      009686 CD 8A 27         [ 4] 4170 	call unget_token   	 
      00180C                       4171 4$:	
      009689 20 EE 01         [ 2] 4172 	ldw x,#1   ; default step  
      00968B 20 12            [ 2] 4173 	jra store_loop_addr 
                                   4174 
                                   4175 
                                   4176 ;----------------------------------
                                   4177 ; BASIC: STEP expr 
                                   4178 ; optional third par of FOR loop
                                   4179 ; initialization. 	
                                   4180 ;------------------------------------
      001811                       4181 step: ; {var limit -- var limit step}
      00968B CD 88 88 A1 00   [ 2] 4182 	btjt flags,#FFOR,1$
      009690 27 49 A1         [ 2] 4183 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009693 08 26 0E         [ 4] 4184 1$: call relation
      009696 CD 82            [ 1] 4185 	cp a,#TK_INTGR
      009698 30 5C            [ 1] 4186 	jreq store_loop_addr  
      00969A 72 B0 00         [ 2] 4187 	jp syntax_error
                                   4188 ; leave loop back entry point on cstack 
                                   4189 ; cstack is 2 call deep from interp_loop
      001823                       4190 store_loop_addr:
      00969D 04 9F C7         [ 4] 4191 	call dpush 
      0096A0 00 02 20         [ 2] 4192 	ldw x,basicptr  
      0096A3 D5 A1            [ 2] 4193 	ldw (BPTR,sp),x 
      0096A5 02 26 06         [ 2] 4194 	ldw x,in.w 
      0096A8 9F CD            [ 2] 4195 	ldw (INW,sp),x   
      0096AA 82 1E 20 CB      [ 1] 4196 	bres flags,#FFOR 
      0096AE 72 5C 00 1F      [ 1] 4197 	inc loop_depth  
      0096AE A1               [ 4] 4198 	ret 
                                   4199 
                                   4200 ;--------------------------------
                                   4201 ; BASIC: NEXT var 
                                   4202 ; FOR loop control 
                                   4203 ; increment variable with step 
                                   4204 ; and compare with limit 
                                   4205 ; loop if threshold not crossed.
                                   4206 ; else clean both stacks. 
                                   4207 ; and decrement 'loop_depth' 
                                   4208 ;--------------------------------
      001839                       4209 next: ; {var limit step -- [var limit step ] }
      0096AF 07 26 06 FD      [ 1] 4210 	tnz loop_depth 
      0096B3 CD 8A            [ 1] 4211 	jrne 1$ 
      0096B5 27 20 C1         [ 2] 4212 	jp syntax_error 
      0096B8                       4213 1$: 
      0096B8 A1 0B            [ 1] 4214 	ld a,#TK_VAR 
      0096BA 26 05 03         [ 4] 4215 	call expect
                                   4216 ; check for good variable after NEXT 	 
      0096BD 01 CC            [ 1] 4217 	ldw y,x 
      0096BF 96 7B 04         [ 2] 4218 	ldw x,#4  
      0096C1 72 D3 00 19      [ 4] 4219 	cpw y,([dstkptr],x) ; compare variables address 
      0096C1 A1 0C            [ 1] 4220 	jreq 2$  
      0096C3 26 13 CD         [ 2] 4221 	jp syntax_error ; not the good one 
      001855                       4222 2$: ; increment variable 
      0096C6 88               [ 1] 4223 	ldw x,y
      0096C7 88               [ 2] 4224 	ldw x,(x)  ; get var value 
      0096C8 A1 03 27         [ 2] 4225 	ldw acc16,x 
      0096CB 03 CC 87 A2      [ 5] 4226 	ldw x,[dstkptr] ; step
      0096CF 72 BB 00 09      [ 2] 4227 	addw x,acc16 ; var+step 
      0096CF 9F A4            [ 2] 4228 	ldw (y),x ; save var new value 
                                   4229 ; compare with limit 
      0096D1 0F C7            [ 1] 4230 	ldw y,x 
      0096D3 00 26 CC 96      [ 5] 4231 	ldw x,[dstkptr] ; step in x 
      0096D7 79               [ 2] 4232 	tnzw x  
      0096D8 2A 0B            [ 1] 4233 	jrpl 4$ ; positive step 
                                   4234 ;negative step 
      0096D8 CD 90 3E         [ 2] 4235 	ldw x,#2
      0096DB 72 D3 00 19      [ 4] 4236 	cpw y,([dstkptr],x)
      0096DB 0D 01            [ 1] 4237 	jrslt loop_done
      0096DD 26 05            [ 2] 4238 	jra loop_back 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      001878                       4239 4$: ; positive step
      0096DF A6 0D CD         [ 2] 4240 	ldw x,#2 
      0096E2 82 1E 5B 01      [ 4] 4241 	cpw y,([dstkptr],x)
      0096E6 81 19            [ 1] 4242 	jrsgt loop_done
      0096E7                       4243 loop_back:
      0096E7 CE 00            [ 2] 4244 	ldw x,(BPTR,sp)
      0096E9 04 1F 03         [ 2] 4245 	ldw basicptr,x 
      0096EC CE 00 06 1F 05   [ 2] 4246 	btjf flags,#FRUN,1$ 
      0096F1 C6 00            [ 1] 4247 	ld a,(2,x)
      0096F3 02 6B 07         [ 1] 4248 	ld count,a
      0096F6 C6               [ 2] 4249 	ldw x,(x)
      0096F7 00 03 6B         [ 2] 4250 	ldw lineno,x
      0096FA 08 81            [ 2] 4251 1$:	ldw x,(INW,sp)
      0096FC CF 00 00         [ 2] 4252 	ldw in.w,x 
      0096FC 1E               [ 4] 4253 	ret 
      00189A                       4254 loop_done:
                                   4255 	; remove var limit step on dstack 
      0096FD 03 CF 00         [ 2] 4256 	ldw x,dstkptr 
      009700 04 1E 05         [ 2] 4257 	addw x,#3*CELL_SIZE
      009703 CF 00 06         [ 2] 4258 	ldw dstkptr,x 
                                   4259 	; remove 2 return address on cstack 
      009706 7B               [ 2] 4260 	popw x
      0018A4                       4261 	_drop 4
      009707 07 C7            [ 2]    1     addw sp,#4 
      009709 00               [ 2] 4262 	pushw x 
      00970A 02 7B 08 C7      [ 1] 4263 	dec loop_depth 
      00970E 00               [ 4] 4264 	ret 
                                   4265 
                                   4266 
                                   4267 ;------------------------
                                   4268 ; BASIC: GOTO lineno 
                                   4269 ; jump to lineno 
                                   4270 ; here cstack is 2 call deep from interp_loop 
                                   4271 ;------------------------
      0018AC                       4272 goto:
      00970F 03 81 00 24 06   [ 2] 4273 	btjt flags,#FRUN,0$ 
      009711 A6 06            [ 1] 4274 	ld a,#ERR_RUN_ONLY
      009711 72 00 00         [ 2] 4275 	jp tb_error 
      009714 25               [ 4] 4276 	ret 
      009715 05 A6            [ 2] 4277 0$:	jra go_common
                                   4278 
                                   4279 ;--------------------
                                   4280 ; BASIC: GOSUB lineno
                                   4281 ; basic subroutine call
                                   4282 ; actual lineno and basicptr 
                                   4283 ; are saved on cstack
                                   4284 ; here cstack is 2 call deep from interp_loop 
                                   4285 ;--------------------
                           000003  4286 	GOS_RET=3
      0018B9                       4287 gosub:
      009717 06 CC 87 A4 52   [ 2] 4288 	btjt flags,#FRUN,0$ 
      00971C 07 06            [ 1] 4289 	ld a,#ERR_RUN_ONLY
      00971D CC 07 24         [ 2] 4290 	jp tb_error 
      00971D 0F               [ 4] 4291 	ret 
      00971E 06               [ 2] 4292 0$:	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      00971F CD 88            [ 2] 4293 	sub sp,#2 
      009721 88               [ 2] 4294 	pushw x 
      009722 A1 00 27         [ 2] 4295 	ldw x,basicptr
      009725 5C A1            [ 1] 4296 	ld a,(2,x)
      009727 08 26            [ 1] 4297 	add a,#3 
      009729 08 CD 82         [ 1] 4298 	ld acc8,a 
      00972C 30 03 06 CD      [ 1] 4299 	clr acc16 
      009730 88 88 A1 04      [ 2] 4300 	addw x,acc16
      009734 27 03            [ 2] 4301 	ldw (GOS_RET,sp),x 
      0018DC                       4302 go_common: 
      009736 CC 87 A2         [ 4] 4303 	call relation 
      009739 CD 90            [ 1] 4304 	cp a,#TK_INTGR
      00973B 45 0D            [ 1] 4305 	jreq 1$ 
      00973D 06 26 0F         [ 2] 4306 	jp syntax_error
      0018E6                       4307 1$: 
      009740 A6 3A C7         [ 4] 4308 	call search_lineno  
      009743 17               [ 2] 4309 	tnzw x 
      009744 19 72            [ 1] 4310 	jrne 2$ 
      009746 5F 17            [ 1] 4311 	ld a,#ERR_NO_LINE 
      009748 1A AE 17         [ 2] 4312 	jp tb_error 
      0018F1                       4313 2$: 
      00974B 18 CD 82         [ 2] 4314 	ldw basicptr,x 
      00974E 30 02            [ 1] 4315 	ld a,(2,x)
      00974F C7 00 02         [ 1] 4316 	ld count,a 
      00974F CD               [ 2] 4317 	ldw x,(x)
      009750 96 E7 AE         [ 2] 4318 	ldw lineno,x 
      009753 16 C8 CF 00      [ 1] 4319 	mov in,#3 
      009757 04               [ 4] 4320 	ret 
                                   4321 
                                   4322 ;------------------------
                                   4323 ; BASIC: RETURN 
                                   4324 ; exit from a subroutine 
                                   4325 ; cstack is 2 level deep from interp_loop 
                                   4326 ;------------------------
      001902                       4327 return:
      009758 72 5F 00 03 CD   [ 2] 4328 	btjt flags,#FRUN,0$ 
      00975D 8B 15            [ 1] 4329 	ld a,#ERR_RUN_ONLY
      00975F 72 5F 00         [ 2] 4330 	jp tb_error 
      00190C                       4331 0$:	
      009762 02 CD            [ 2] 4332 	ldw x,(GOS_RET,sp) 
      009764 93 B3 A1         [ 2] 4333 	ldw basicptr,x 
      009767 03 27            [ 1] 4334 	ld a,(2,x)
      009769 03 CC            [ 1] 4335 	add a,#3 
      00976B 87 A2 CD         [ 1] 4336 	ld count,a 
      00976E 90 45 CD 90      [ 1] 4337 	mov in,#3
      009772 AC               [ 2] 4338 	ldw x,(x)
      009773 CD 96 FC         [ 2] 4339 	ldw lineno,x 
      009776 CD               [ 1] 4340 	clr a 
      009777 88               [ 2] 4341 	popw x 
      001922                       4342 	_drop 2
      009778 88 A1            [ 2]    1     addw sp,#2 
      00977A 0B               [ 2] 4343 	pushw x
      00977B 26               [ 4] 4344 	ret  
                                   4345 
                                   4346 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4347 ;----------------------------------
                                   4348 ; BASIC: RUN
                                   4349 ; run BASIC program in RAM
                                   4350 ;----------------------------------- 
      001926                       4351 run: 
      00977C 02 20 9E CD 90   [ 2] 4352 	btjf flags,#FRUN,0$  
      009781 3E               [ 1] 4353 	clr a 
      009782 81               [ 4] 4354 	ret
      00192D                       4355 0$: 
      009782 5B 07 81 24 12   [ 2] 4356 	btjf flags,#FBREAK,1$
      009785                       4357 	_drop 2 
      009785 55 00            [ 2]    1     addw sp,#2 
      009787 02 00 03         [ 4] 4358 	call rest_context
      001937                       4359 	_drop CTXT_SIZE 
      00978A 81 06            [ 2]    1     addw sp,#CTXT_SIZE 
      00978B 72 19 00 24      [ 1] 4360 	bres flags,#FBREAK 
      00978B 52 04 0F 01      [ 1] 4361 	bset flags,#FRUN 
      00978F CD 92 75         [ 2] 4362 	jp interp_loop 
      009792 A1 02 24         [ 2] 4363 1$:	ldw x,txtbgn
      009795 03 CC 87         [ 2] 4364 	cpw x,txtend 
      009798 A2 A1            [ 1] 4365 	jrmi 2$ 
      00979A 03               [ 1] 4366 	clr a 
      00979B 25               [ 4] 4367 	ret 
      00979C 06 CD 90         [ 4] 4368 2$: call ubound 
      001951                       4369 	_drop 2 
      00979F 52 9F            [ 2]    1     addw sp,#2 
      0097A1 6B 01 CD         [ 2] 4370 	ldw x,txtbgn 
      0097A4 90 52 9F         [ 2] 4371 	ldw basicptr,x 
      0097A7 6B 02            [ 1] 4372 	ld a,(2,x)
      0097A9 CD 90 52         [ 1] 4373 	ld count,a
      0097AC F6               [ 2] 4374 	ldw x,(x)
      0097AD 14 02 18         [ 2] 4375 	ldw lineno,x
      0097B0 01 27 F9 5B      [ 1] 4376 	mov in,#3	
      0097B4 04 81 00 24      [ 1] 4377 	bset flags,#FRUN 
      0097B6 CC 07 D8         [ 2] 4378 	jp interp_loop 
                                   4379 
                                   4380 
                                   4381 ;----------------------
                                   4382 ; BASIC: STOP 
                                   4383 ; stop running program
                                   4384 ;---------------------- 
      00196D                       4385 stop: 
                                   4386 ; clean dstack and cstack 
      0097B6 CD 92 75         [ 2] 4387 	ldw x,#STACK_EMPTY 
      0097B9 A1               [ 1] 4388 	ldw sp,x 
      0097BA 02 27 03 CC      [ 1] 4389 	bres flags,#FRUN 
      0097BE 87 A2 00 24      [ 1] 4390 	bres flags,#FBREAK
      0097C0 CC 07 74         [ 2] 4391 	jp warm_start
                                   4392 
                                   4393 ;-----------------------
                                   4394 ; BASIC BEEP expr1,expr2
                                   4395 ; used MCU internal beeper 
                                   4396 ; to produce a sound
                                   4397 ; arguments:
                                   4398 ;    expr1   frequency, {1,2,4} mapping to 1K,2K,4K
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4399 ;    expr2   duration msec.
                                   4400 ;---------------------------
      00197C                       4401 beep:
      0097C0 CD 90 52         [ 4] 4402 	call arg_list 
      0097C3 9F CD            [ 1] 4403 	cp a,#2 
      0097C5 90 52            [ 1] 4404 	jreq 2$
      0097C7 FA F7 81         [ 2] 4405 	jp syntax_error 
      0097CA CE 00 19         [ 2] 4406 2$: ldw x,dstkptr 
      0097CA CD 92            [ 2] 4407 	ldw x,(2,x);frequency 
      0097CC 75               [ 1] 4408 	ld a,xl
      0097CD A1               [ 1] 4409 	dec a 
      0097CE 02               [ 1] 4410 	swap a 
      0097CF 27               [ 1] 4411 	sll a 
      0097D0 03               [ 1] 4412 	sll a 
      0097D1 CC 87            [ 1] 4413 	add a,#0x3e 
      0097D3 A2 50 F3         [ 1] 4414 	ld BEEP_CSR,a 
      0097D4 CD 0F D2         [ 4] 4415 	call dpop 
      0097D4 CD 90 52         [ 4] 4416 	call pause02 
      0097D7 9F 43 CD         [ 4] 4417 	call ddrop 
      0097DA 90 52            [ 1] 4418 	ld a,#0x1f
      0097DC F4 F7 81         [ 1] 4419 	ld BEEP_CSR,a 
      0097DF 81               [ 4] 4420 	ret 
                                   4421 
                                   4422 ;-------------------------------
                                   4423 ; BASIC: PWRADC 0|1,divisor  
                                   4424 ; disable/enanble ADC 
                                   4425 ;-------------------------------
      0019A4                       4426 power_adc:
      0097DF CD 92 75         [ 4] 4427 	call arg_list 
      0097E2 A1 02            [ 1] 4428 	cp a,#2	
      0097E4 27 03            [ 1] 4429 	jreq 1$
      0097E6 CC 87 A2         [ 2] 4430 	jp syntax_error 
      0097E9 CD 90 52         [ 2] 4431 1$: ldw x,#2
      0097EC 9F CD 90 52      [ 5] 4432 	ldw x,([dstkptr],x) ; on|off
      0097F0 F8               [ 2] 4433 	tnzw x 
      0097F1 F7 81            [ 1] 4434 	jreq 2$ 
      0097F3 72 CE 00 19      [ 5] 4435 	ldw x,[dstkptr] ; channel
      0097F3 CD               [ 1] 4436 	ld a,xl
      0097F4 92 75            [ 1] 4437 	and a,#7
      0097F6 A1               [ 1] 4438 	swap a 
      0097F7 02 27 03         [ 1] 4439 	ld ADC_CR1,a
      0097FA CC 87 A2 02      [ 1] 4440 	bset ADC_CR2,#ADC_CR2_ALIGN ; right 
      0097FD 72 10 54 01      [ 1] 4441 	bset ADC_CR1,#ADC_CR1_ADON 
      0019CB                       4442 	_usec_dly 7 
      0097FD CD 90 52         [ 2]    1     ldw x,#(16*7-2)/4
      009800 9F               [ 2]    2     decw x
      009801 CD               [ 1]    3     nop 
      009802 90 52            [ 1]    4     jrne .-4
      009804 F7 81            [ 2] 4443 	jra 3$
      009806 72 11 54 01      [ 1] 4444 2$: bres ADC_CR1,#ADC_CR1_ADON 
      009806 A6 09 CD         [ 2] 4445 3$:	ldw x,#2
      009809 92 68 CD         [ 4] 4446 	call ddrop_n 
      00980C 92               [ 4] 4447 	ret
                                   4448 
                                   4449 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4450 ; BASIC: RDADC(channel)
                                   4451 ; read adc channel 
                                   4452 ; output:
                                   4453 ;   A 		TK_INTGR 
                                   4454 ;   X 		value 
                                   4455 ;-----------------------------
      0019DF                       4456 read_adc:
      00980D 75 A1            [ 1] 4457 	ld a,#TK_LPAREN 
      00980F 01 27 03         [ 4] 4458 	call expect 
      009812 CC 87 A2         [ 4] 4459 	call next_token 
      009815 A6 0A            [ 1] 4460 	cp a,#TK_INTGR 
      009817 CD 92            [ 1] 4461 	jreq 1$
      009819 68 CD 90         [ 2] 4462 	jp syntax_error
      00981C 52               [ 2] 4463 1$: pushw x 
      00981D F6 5F            [ 1] 4464 	ld a,#TK_RPAREN 
      00981F 97 A6 03         [ 4] 4465 	call expect 
      009822 81               [ 2] 4466 	popw x 
      009823 A3 00 10         [ 2] 4467 	cpw x,#16 
      009823 CD 93            [ 1] 4468 	jrult 2$
      009825 B3 A1            [ 1] 4469 	ld a,#ERR_BAD_VALUE
      009827 03 27 03         [ 2] 4470 	jp tb_error 
      00982A CC               [ 1] 4471 2$: ld a,xl
      00982B 87 A2 4F         [ 1] 4472 	ld ADC_CSR,a 
      00982E 5D 26 05 55      [ 1] 4473 	bset ADC_CR1,#ADC_CR1_ADON
      009832 00 03 00 02 81   [ 2] 4474 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009837 CE 54 04         [ 2] 4475 	ldw x,ADC_DRH 
      009837 A6 04            [ 1] 4476 	ld a,#TK_INTGR
      009839 CD               [ 4] 4477 	ret 
                                   4478 
                                   4479 
                                   4480 ;-----------------------
                                   4481 ; BASIC: BREAK 
                                   4482 ; insert a breakpoint 
                                   4483 ; in pogram. 
                                   4484 ; the program is resumed
                                   4485 ; with RUN 
                                   4486 ;-------------------------
      001A12                       4487 break:
      00983A 92 68 CD 90 45   [ 2] 4488 	btjt flags,#FRUN,2$
      00983F CD               [ 1] 4489 	clr a
      009840 94               [ 4] 4490 	ret 
      001A19                       4491 2$:	 
                                   4492 ; create space on cstack to save context 
      009841 46 72 14         [ 2] 4493 	ldw x,#break_point 
      009844 00 25 85         [ 4] 4494 	call puts 
      001A1F                       4495 	_drop 2 ;drop return address 
      009847 52 04            [ 2]    1     addw sp,#2 
      001A21                       4496 	_vars CTXT_SIZE ; context size 
      009849 89 5F            [ 2]    1     sub sp,#CTXT_SIZE 
      00984B 1F 05 1F         [ 4] 4497 	call save_context 
      00984E 03 CD 88         [ 2] 4498 	ldw x,#tib 
      009851 88 A1 06         [ 2] 4499 	ldw basicptr,x
      009854 27               [ 1] 4500 	clr (x)
      009855 03 CC 87 A2      [ 1] 4501 	clr count  
      009859 5F               [ 1] 4502 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009859 A3 98 61         [ 2] 4503 	ldw lineno,x 
      00985C 27 03 CC         [ 2] 4504 	ldw in.w,x
      00985F 87 A2 00 24      [ 1] 4505 	bres flags,#FRUN 
      009861 72 18 00 24      [ 1] 4506 	bset flags,#FBREAK
      009861 72 04 00         [ 2] 4507 	jp interp_loop 
      009864 25 03 CC 87 A2 CD 93  4508 break_point: .asciz "\nbreak point, RUN to resume.\n"
             B3 A1 03 27 03 CC 87
             A2 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4509 
                                   4510 ;-----------------------
                                   4511 ; BASIC: NEW
                                   4512 ; from command line only 
                                   4513 ; free program memory
                                   4514 ; and clear variables 
                                   4515 ;------------------------
      009873                       4516 new: 
      009873 CD 90 45 CE 00   [ 2] 4517 	btjf flags,#FRUN,0$ 
      009878 01               [ 1] 4518 	clr a 
      009879 CD               [ 4] 4519 	ret 
      001A68                       4520 0$:	
      00987A 88 88 A1         [ 4] 4521 	call clear_basic 
      00987D 00               [ 4] 4522 	ret 
                                   4523 	 
                                   4524 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4525 ;   file system routines
                                   4526 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4527 
                                   4528 ;--------------------
                                   4529 ; input:
                                   4530 ;   X     increment 
                                   4531 ; output:
                                   4532 ;   farptr  incremented 
                                   4533 ;---------------------
      001A6C                       4534 incr_farptr:
      00987E 27 0C A1 06      [ 2] 4535 	addw x,farptr+1 
      009882 26 05            [ 1] 4536 	jrnc 1$
      009884 A3 98 91 27      [ 1] 4537 	inc farptr 
      009888 08 00 14         [ 2] 4538 1$:	ldw farptr+1,x  
      009889 81               [ 4] 4539 	ret 
                                   4540 
                                   4541 ;------------------------------
                                   4542 ; extended flash memory used as FLASH_DRIVE 
                                   4543 ; seek end of used flash drive   
                                   4544 ; starting at 0x10000 address.
                                   4545 ; 4 consecutives 0 bytes signal free space. 
                                   4546 ; input:
                                   4547 ;	none
                                   4548 ; output:
                                   4549 ;   ffree     free_addr| 0 if memory full.
                                   4550 ;------------------------------
      001A7A                       4551 seek_fdrive:
      009889 CD 90            [ 1] 4552 	ld a,#1
      00988B 3E 00 13         [ 1] 4553 	ld farptr,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      00988C 5F               [ 1] 4554 	clrw x 
      00988C AE 00 01         [ 2] 4555 	ldw farptr+1,x 
      001A83                       4556 1$:
      00988F 20               [ 1] 4557 	clrw x 
      009890 12 AF 00 13      [ 5] 4558 	ldf a,([farptr],x) 
      009891 26 15            [ 1] 4559 	jrne 2$
      009891 72               [ 1] 4560 	incw x 
      009892 04 00 25 03      [ 5] 4561 	ldf a,([farptr],x)
      009896 CC 87            [ 1] 4562 	jrne 2$ 
      009898 A2               [ 1] 4563 	incw x 
      009899 CD 93 B3 A1      [ 5] 4564 	ldf a,([farptr],x)
      00989D 03 27            [ 1] 4565 	jrne 2$ 
      00989F 03               [ 1] 4566 	incw x 
      0098A0 CC 87 A2 13      [ 5] 4567 	ldf a,([farptr],x)
      0098A3 27 28            [ 1] 4568 	jreq 4$ 
      001A9F                       4569 2$: 
      0098A3 CD 90 45         [ 2] 4570 	addw x,#1
      0098A6 CE 00 04         [ 4] 4571 	call incr_farptr
      0098A9 1F 05 CE         [ 2] 4572 	ldw x,#0x27f 
      0098AC 00 01 1F         [ 2] 4573 	cpw x,farptr
      0098AF 03 72            [ 1] 4574 	jrpl 1$
      0098B1 15 00 25 72      [ 1] 4575 	clr ffree 
      0098B5 5C 00 20 81      [ 1] 4576 	clr ffree+1 
      0098B9 72 5F 00 18      [ 1] 4577 	clr ffree+2 
      0098B9 72 5D 00 20      [ 1] 4578 	clr acc24 
      0098BD 26 03 CC 87      [ 1] 4579 	clr acc16
      0098C1 A2 5F 00 0A      [ 1] 4580 	clr acc8 
      0098C2 20 1A            [ 2] 4581 	jra 5$
      001AC7                       4582 4$: ; copy farptr to ffree	 
      0098C2 A6 04 CD         [ 2] 4583 	ldw x,farptr+1 
      0098C5 92 68 90         [ 2] 4584 	cpw x,#fdrive 
      0098C8 93 AE            [ 1] 4585 	jreq 41$
                                   4586 	; there is a file, last 0 of that file must be skipped.
      0098CA 00 04 72         [ 2] 4587 	ldw x,#1
      0098CD D3 00 1A         [ 4] 4588 	call incr_farptr
      001AD5                       4589 41$: 
      0098D0 27 03 CC         [ 2] 4590 	ldw x,farptr 
      0098D3 87 A2 15         [ 1] 4591 	ld a,farptr+2 
      0098D5 CF 00 16         [ 2] 4592 	ldw ffree,x 
      0098D5 93 FE CF         [ 1] 4593 	ld ffree+2,a  
      0098D8 00               [ 4] 4594 5$:	ret 
                                   4595 
                                   4596 ;-----------------------
                                   4597 ; compare file name 
                                   4598 ; with name pointed by Y  
                                   4599 ; input:
                                   4600 ;   farptr   file name 
                                   4601 ;   Y        target name 
                                   4602 ; output:
                                   4603 ;   farptr 	 at file_name
                                   4604 ;   X 		 farptr[x] point at size field  
                                   4605 ;   Carry    0|1 no match|match  
                                   4606 ;----------------------
      001AE2                       4607 cmp_name:
      0098D9 0A               [ 1] 4608 	clrw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0098DA 72 CE 00 1A      [ 5] 4609 1$:	ldf a,([farptr],x)
      0098DE 72 BB            [ 1] 4610 	cp a,(y)
      0098E0 00 0A            [ 1] 4611 	jrne 4$
      0098E2 90               [ 1] 4612 	tnz a 
      0098E3 FF 90            [ 1] 4613 	jreq 9$ 
      0098E5 93               [ 1] 4614     incw x 
      0098E6 72 CE            [ 1] 4615 	incw y 
      0098E8 00 1A            [ 2] 4616 	jra 1$
      001AF3                       4617 4$: ;no match 
      0098EA 5D               [ 1] 4618 	tnz a 
      0098EB 2A 0B            [ 1] 4619 	jreq 5$
      0098ED AE               [ 1] 4620 	incw x 
      0098EE 00 02 72 D3      [ 5] 4621 	ldf a,([farptr],x)
      0098F2 00 1A            [ 2] 4622 	jra 4$  
      0098F4 2F               [ 1] 4623 5$:	incw x ; farptr[x] point at 'size' field 
      0098F5 24               [ 1] 4624 	rcf 
      0098F6 20               [ 4] 4625 	ret
      001B00                       4626 9$: ; match  
      0098F7 09               [ 1] 4627 	incw x  ; farptr[x] at 'size' field 
      0098F8 99               [ 1] 4628 	scf 
      0098F8 AE               [ 4] 4629 	ret 
                                   4630 
                                   4631 ;-----------------------
                                   4632 ; search file in 
                                   4633 ; flash memory 
                                   4634 ; input:
                                   4635 ;   Y       file name  
                                   4636 ; output:
                                   4637 ;   farptr  addr at name|0
                                   4638 ;-----------------------
                           000001  4639 	FSIZE=1
                           000003  4640 	YSAVE=3
                           000004  4641 	VSIZE=4 
      001B03                       4642 search_file: 
      001B03                       4643 	_vars VSIZE
      0098F9 00 02            [ 2]    1     sub sp,#VSIZE 
      0098FB 72 D3            [ 2] 4644 	ldw (YSAVE,sp),y  
      0098FD 00               [ 1] 4645 	clrw x 
      0098FE 1A 2C 19         [ 2] 4646 	ldw farptr+1,x 
      009901 35 01 00 13      [ 1] 4647 	mov farptr,#1
      001B0F                       4648 1$:	
                                   4649 ; check if farptr is after any file 
                                   4650 ; if  0 then so.
      009901 1E 05 CF 00      [ 5] 4651 	ldf a,[farptr]
      009905 04 72            [ 1] 4652 	jreq 6$
      009907 01               [ 1] 4653 2$: clrw x 	
      009908 00 25            [ 2] 4654 	ldw y,(YSAVE,sp) 
      00990A 09 E6 02         [ 4] 4655 	call cmp_name
      00990D C7 00            [ 1] 4656 	jrc 9$
      00990F 03 FE CF 00      [ 5] 4657 	ldf a,([farptr],x)
      009913 06 1E            [ 1] 4658 	ld (FSIZE,sp),a 
      009915 03               [ 1] 4659 	incw x 
      009916 CF 00 01 81      [ 5] 4660 	ldf a,([farptr],x)
      00991A 6B 02            [ 1] 4661 	ld (FSIZE+1,sp),a 
      00991A CE               [ 1] 4662 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      00991B 00 1A 1C         [ 2] 4663 	addw x,(FSIZE,sp) ; count to skip 
      00991E 00 06 CF         [ 4] 4664 	call incr_farptr ; now at next file 'name_field'
      009921 00 1A 85         [ 2] 4665 	ldw x,#0x280
      009924 5B 04 89         [ 2] 4666 	cpw x,farptr 
      009927 72 5A            [ 1] 4667 	jrpl 1$
      001B39                       4668 6$: ; file not found 
      009929 00 20 81 13      [ 1] 4669 	clr farptr
      00992C 72 5F 00 14      [ 1] 4670 	clr farptr+1 
      00992C 72 00 00 25      [ 1] 4671 	clr farptr+2 
      001B45                       4672 	_drop VSIZE 
      009930 06 A6            [ 2]    1     addw sp,#VSIZE 
      009932 06               [ 1] 4673 	rcf
      009933 CC               [ 4] 4674 	ret
      001B49                       4675 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001B49                       4676 	_drop VSIZE 
      009934 87 A4            [ 2]    1     addw sp,#VSIZE 
      009936 81               [ 1] 4677 	scf 	
      009937 20               [ 4] 4678 	ret
                                   4679 
                                   4680 ;--------------------------------
                                   4681 ; BASIC: SAVE "name" 
                                   4682 ; save text program in 
                                   4683 ; flash memory used as 
                                   4684 ;--------------------------------
                           000001  4685 	BSIZE=1
                           000003  4686 	NAMEPTR=3
                           000004  4687 	VSIZE=4
      001B4D                       4688 save:
      009938 23 01 00 24 05   [ 2] 4689 	btjf flags,#FRUN,0$ 
      009939 A6 07            [ 1] 4690 	ld a,#ERR_CMD_ONLY 
      009939 72 00 00         [ 2] 4691 	jp tb_error
      001B57                       4692 0$:	 
      00993C 25 06 A6         [ 2] 4693 	ldw x,txtend 
      00993F 06 CC 87 A4      [ 2] 4694 	subw x,txtbgn
      009943 81 85            [ 1] 4695 	jrne 10$
                                   4696 ; nothing to save 
      009945 52               [ 4] 4697 	ret 
      001B61                       4698 10$:	
      009946 02 89 CE         [ 1] 4699 	ld a,ffree 
      009949 00 04 E6         [ 1] 4700 	or a,ffree+1
      00994C 02 AB 03         [ 1] 4701 	or a,ffree+2 
      00994F C7 00            [ 1] 4702 	jrne 1$
      009951 0B 72            [ 1] 4703 	ld a,#ERR_MEM_FULL
      009953 5F 00 0A         [ 2] 4704 	jp tb_error 
      001B71                       4705 1$:  
      009956 72 BB 00         [ 4] 4706 	call next_token	
      009959 0A 1F            [ 1] 4707 	cp a,#TK_QSTR
      00995B 03 03            [ 1] 4708 	jreq 2$
      00995C CC 07 22         [ 2] 4709 	jp syntax_error
      001B7B                       4710 2$: ; check for existing file of that name 
      001B7B                       4711 	_vars VSIZE
      00995C CD 93            [ 2]    1     sub sp,#VSIZE 
      00995E B3 A1 03 27      [ 2] 4712 	ldw y,basicptr 
      009962 03 CC 87 A2      [ 2] 4713 	addw y,in.w
      009966 17 03            [ 2] 4714 	ldw (NAMEPTR,sp),y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009966 CD 83 60 5D 26   [ 1] 4715 	mov in,count 
      00996B 05 A6 05         [ 4] 4716 	call search_file 
      00996E CC 87            [ 1] 4717 	jrnc 3$ 
      009970 A4 08            [ 1] 4718 	ld a,#ERR_DUPLICATE 
      009971 CC 07 24         [ 2] 4719 	jp tb_error 
      001B96                       4720 3$:	;** write file name to flash **
      009971 CF 00 04         [ 2] 4721 	ldw x,ffree 
      009974 E6 02 C7         [ 1] 4722 	ld a,ffree+2 
      009977 00 03 FE         [ 2] 4723 	ldw farptr,x 
      00997A CF 00 06         [ 1] 4724 	ld farptr+2,a 
      00997D 35 03            [ 2] 4725 	ldw x,(NAMEPTR,sp)  
      00997F 00 02 81         [ 4] 4726 	call strlen 
      009982 5C               [ 1] 4727 	incw  x
      009982 72 00            [ 2] 4728 	ldw (BSIZE,sp),x  
      009984 00               [ 1] 4729 	clrw x   
      009985 25 05            [ 2] 4730 	ldw y,(NAMEPTR,sp)
      009987 A6 06 CC         [ 4] 4731 	call write_block  
                                   4732 ;** write file length after name **
      00998A 87 A4 1D         [ 2] 4733 	ldw x,txtend 
      00998C 72 B0 00 1B      [ 2] 4734 	subw x,txtbgn
      00998C 1E 03            [ 2] 4735 	ldw (BSIZE,sp),x 
      00998E CF               [ 1] 4736 	clrw x 
      00998F 00 04            [ 1] 4737 	ld a,(1,sp)
      009991 E6 02 AB         [ 4] 4738 	call write_byte 
      009994 03               [ 1] 4739 	incw x 
      009995 C7 00            [ 1] 4740 	ld a,(2,sp)
      009997 03 35 03         [ 4] 4741 	call write_byte
      00999A 00               [ 1] 4742 	incw x  
      00999B 02 FE CF         [ 4] 4743 	call incr_farptr ; move farptr after SIZE field 
                                   4744 ;** write BASIC text **
                                   4745 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      00999E 00 06            [ 2] 4746 	ldw x,(BSIZE,sp)
      0099A0 4F               [ 2] 4747 	pushw x 
      0099A1 85               [ 1] 4748 	clrw x 
      0099A2 5B 02 89 81      [ 2] 4749 	ldw y,txtbgn  ; BASIC text to save 
      0099A6 CD 01 51         [ 4] 4750 	call write_block 
      001BD4                       4751 	_drop 2 ;  drop BSIZE copy 
      0099A6 72 01            [ 2]    1     addw sp,#2 
                                   4752 ; save farptr in ffree
      0099A8 00 25 02         [ 2] 4753 	ldw x,farptr 
      0099AB 4F 81 15         [ 1] 4754 	ld a,farptr+2 
      0099AD CF 00 16         [ 2] 4755 	ldw ffree,x 
      0099AD 72 09 00         [ 1] 4756 	ld ffree+2,a
                                   4757 ; write 4 zero bytes as a safe gard 
      0099B0 25               [ 1] 4758     clrw x 
      0099B1 12 5B            [ 1] 4759 	push #4 
      0099B3 02 CD            [ 1] 4760 4$:	tnz (1,sp)
      0099B5 96 FC            [ 1] 4761 	jreq 5$
      0099B7 5B               [ 1] 4762 	clr a 
      0099B8 06 72 19         [ 4] 4763 	call write_byte 
      0099BB 00               [ 1] 4764 	incw x 
      0099BC 25 72            [ 1] 4765 	dec (1,sp)
      0099BE 10 00            [ 2] 4766 	jra 4$
      0099C0 25               [ 1] 4767 5$: pop a 
                                   4768 ; display saved size  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0099C1 CC 88            [ 2] 4769 	ldw x,(BSIZE,sp) 
      0099C3 58 CE 00         [ 4] 4770 	call print_int 
      001BF8                       4771 	_drop VSIZE 
      0099C6 1C C3            [ 2]    1     addw sp,#VSIZE 
      0099C8 00               [ 4] 4772 	ret 
                                   4773 
                                   4774 
                                   4775 ;------------------------
                                   4776 ; BASIC: LOAD "file" 
                                   4777 ; load file to RAM 
                                   4778 ; for execution 
                                   4779 ;------------------------
      001BFB                       4780 load:
      0099C9 1E 2B 02 4F 81   [ 2] 4781 	btjf flags,#FRUN,0$ 
      0099CE CD 94            [ 1] 4782 	jreq 0$ 
      0099D0 2E 5B            [ 1] 4783 	ld a,#ERR_CMD_ONLY 
      0099D2 02 CE 00         [ 2] 4784 	jp tb_error 
      001C07                       4785 0$:	
      0099D5 1C CF 00         [ 4] 4786 	call next_token 
      0099D8 04 E6            [ 1] 4787 	cp a,#TK_QSTR
      0099DA 02 C7            [ 1] 4788 	jreq 1$
      0099DC 00 03 FE         [ 2] 4789 	jp syntax_error 
      001C11                       4790 1$:	
      0099DF CF 00 06 35      [ 2] 4791 	ldw y,basicptr
      0099E3 03 00 02 72      [ 2] 4792 	addw y,in.w 
      0099E7 10 00 25 CC 88   [ 1] 4793 	mov in,count 
      0099EC 58 1B 03         [ 4] 4794 	call search_file 
      0099ED 25 05            [ 1] 4795 	jrc 2$ 
      0099ED AE 17            [ 1] 4796 	ld a,#ERR_NOT_FILE
      0099EF FF 94 72         [ 2] 4797 	jp tb_error  
      001C28                       4798 2$:	
      0099F2 11 00 25         [ 4] 4799 	call incr_farptr  
      0099F5 72 19 00         [ 4] 4800 	call clear_basic  
      0099F8 25               [ 1] 4801 	clrw x
      0099F9 CC 87 F4 13      [ 5] 4802 	ldf a,([farptr],x)
      0099FC 90 95            [ 1] 4803 	ld yh,a 
      0099FC CD               [ 1] 4804 	incw x  
      0099FD 92 75 A1 02      [ 5] 4805 	ldf a,([farptr],x)
      009A01 27               [ 1] 4806 	incw x 
      009A02 03 CC            [ 1] 4807 	ld yl,a 
      009A04 87 A2 CE 00      [ 2] 4808 	addw y,txtbgn
      009A08 1A EE 02 9F      [ 2] 4809 	ldw txtend,y
      009A0C 4A 4E 48 48      [ 2] 4810 	ldw y,txtbgn
      001C49                       4811 3$:	; load BASIC text 	
      009A10 AB 3E C7 50      [ 5] 4812 	ldf a,([farptr],x)
      009A14 F3 CD            [ 1] 4813 	ld (y),a 
      009A16 90               [ 1] 4814 	incw x 
      009A17 52 CD            [ 1] 4815 	incw y 
      009A19 9E FE CD 90      [ 2] 4816 	cpw y,txtend 
      009A1D 79 A6            [ 1] 4817 	jrmi 3$
                                   4818 ; return loaded size 	 
      009A1F 1F C7 50         [ 2] 4819 	ldw x,txtend 
      009A22 F3 81 00 1B      [ 2] 4820 	subw x,txtbgn
      009A24 CD 09 A7         [ 4] 4821 	call print_int 
      009A24 CD               [ 4] 4822 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4823 
                                   4824 ;-----------------------------------
                                   4825 ; BASIC: FORGET ["file_name"] 
                                   4826 ; erase file_name and all others 
                                   4827 ; after it. 
                                   4828 ; without argument erase all files 
                                   4829 ;-----------------------------------
      001C63                       4830 forget:
      009A25 92 75 A1         [ 4] 4831 	call next_token 
      009A28 02 27            [ 1] 4832 	cp a,#TK_NONE 
      009A2A 03 CC            [ 1] 4833 	jreq 3$ 
      009A2C 87 A2            [ 1] 4834 	cp a,#TK_QSTR
      009A2E AE 00            [ 1] 4835 	jreq 1$
      009A30 02 72 DE         [ 2] 4836 	jp syntax_error
      009A33 00 1A 5D 27      [ 2] 4837 1$: ldw y,basicptr
      009A37 1C 72 CE 00      [ 2] 4838 	addw y,in.w
      009A3B 1A 9F A4 07 4E   [ 1] 4839 	mov in,count 
      009A40 C7 54 01         [ 4] 4840 	call search_file
      009A43 72 16            [ 1] 4841 	jrc 2$
      009A45 54 02            [ 1] 4842 	ld a,#ERR_NOT_FILE 
      009A47 72 10 54         [ 2] 4843 	jp tb_error 
      001C88                       4844 2$: 
      009A4A 01 AE 00         [ 2] 4845 	ldw x,farptr
      009A4D 1B 5A 9D         [ 1] 4846 	ld a,farptr+2
      009A50 26 FA            [ 2] 4847 	jra 4$ 
      001C90                       4848 3$: ; forget all files 
      009A52 20 04 72         [ 2] 4849 	ldw x,#100
      009A55 11               [ 1] 4850 	clr a 
      009A56 54 01 AE         [ 2] 4851 	ldw farptr,x 
      009A59 00 02 CD         [ 1] 4852 	ld farptr+2,a 
      001C9A                       4853 4$:
      009A5C 90 B6 81         [ 2] 4854 	ldw ffree,x 
      009A5F C7 00 18         [ 1] 4855 	ld ffree+2,a 
      009A5F A6 09            [ 1] 4856 	push #4
      009A61 CD               [ 1] 4857 	clrw x 
      009A62 92 68            [ 1] 4858 5$: tnz (1,sp)
      009A64 CD 88            [ 1] 4859 	jreq 6$ 
      009A66 88               [ 1] 4860 	clr a  
      009A67 A1 03 27         [ 4] 4861 	call write_byte 
      009A6A 03               [ 1] 4862 	incw x 
      009A6B CC 87            [ 1] 4863 	dec (1,sp)
      009A6D A2 89            [ 2] 4864 	jra 5$	
      009A6F A6               [ 1] 4865 6$: pop a 
      009A70 0A               [ 4] 4866 	ret 
                                   4867 
                                   4868 ;----------------------
                                   4869 ; BASIC: DIR 
                                   4870 ; list saved files 
                                   4871 ;----------------------
                           000001  4872 	COUNT=1 ; files counter 
                           000002  4873 	VSIZE=2 
      001CB2                       4874 directory:
      001CB2                       4875 	_vars VSIZE 
      009A71 CD 92            [ 2]    1     sub sp,#VSIZE 
      009A73 68               [ 1] 4876 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009A74 85 A3            [ 2] 4877 	ldw (COUNT,sp),x 
      009A76 00 10 25         [ 2] 4878 	ldw farptr+1,x 
      009A79 05 A6 0A CC      [ 1] 4879 	mov farptr,#1 
      001CBE                       4880 dir_loop:
      009A7D 87               [ 1] 4881 	clrw x 
      009A7E A4 9F C7 54      [ 5] 4882 	ldf a,([farptr],x)
      009A82 00 72            [ 1] 4883 	jreq 8$ 
      001CC5                       4884 1$: ;name loop 	
      009A84 10 54 01 72      [ 5] 4885 	ldf a,([farptr],x)
      009A88 0F 54            [ 1] 4886 	jreq 2$ 
      009A8A 00 FB CE         [ 4] 4887 	call putc 
      009A8D 54               [ 1] 4888 	incw x 
      009A8E 04 A6            [ 2] 4889 	jra 1$
      009A90 03               [ 1] 4890 2$: incw x ; skip ending 0. 
      009A91 81 20            [ 1] 4891 	ld a,#SPACE 
      009A92 CD 01 9E         [ 4] 4892 	call putc 
                                   4893 ; get file size 	
      009A92 72 00 00 25      [ 5] 4894 	ldf a,([farptr],x)
      009A96 02 4F            [ 1] 4895 	ld yh,a 
      009A98 81               [ 1] 4896 	incw x 
      009A99 92 AF 00 13      [ 5] 4897 	ldf a,([farptr],x)
      009A99 AE               [ 1] 4898 	incw x 
      009A9A 9A C3            [ 1] 4899 	ld yl,a 
      009A9C CD 82            [ 2] 4900 	pushw y 
      009A9E 30 5B 02         [ 2] 4901 	addw x,(1,sp)
                                   4902 ; skip to next file 
      009AA1 52 06 CD         [ 4] 4903 	call incr_farptr 
                                   4904 ; print file size 
      009AA4 96               [ 2] 4905 	popw x ; file size 
      009AA5 E7 AE 16         [ 4] 4906 	call print_int 
      009AA8 C8 CF            [ 1] 4907 	ld a,#CR 
      009AAA 00 04 7F         [ 4] 4908 	call putc
      009AAD 72 5F            [ 2] 4909 	ldw x,(COUNT,sp)
      009AAF 00               [ 1] 4910 	incw x
      009AB0 03 5F            [ 2] 4911 	ldw (COUNT,sp),x  
      009AB2 CF 00            [ 2] 4912 	jra dir_loop 
      001CFD                       4913 8$: ; print number of files 
      009AB4 06 CF            [ 2] 4914 	ldw x,(COUNT,sp)
      009AB6 00 01 72         [ 4] 4915 	call print_int 
      009AB9 11 00 25         [ 2] 4916 	ldw x,#file_count 
      009ABC 72 18 00         [ 4] 4917 	call puts  
                                   4918 ; print drive free space 	
      009ABF 25 CC            [ 1] 4919 	ld a,#0xff 
      009AC1 88 58 0A         [ 1] 4920 	sub a,ffree+2 
      009AC4 62 72 65         [ 1] 4921 	ld acc8,a 
      009AC7 61 6B            [ 1] 4922 	ld a,#0x7f 
      009AC9 20 70 6F         [ 1] 4923 	sbc a,ffree+1 
      009ACC 69 6E 74         [ 1] 4924 	ld acc16,a 
      009ACF 2C 20            [ 1] 4925 	ld a,#2 
      009AD1 52 55 4E         [ 1] 4926 	sbc a,ffree 
      009AD4 20 74 6F         [ 1] 4927 	ld acc24,a 
      009AD7 20               [ 1] 4928 	clrw x  
      009AD8 72 65            [ 1] 4929 	ld a,#6 
      009ADA 73               [ 1] 4930 	ld xl,a 
      009ADB 75 6D            [ 1] 4931 	ld a,#10 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009ADD 65 2E 0A         [ 4] 4932 	call prti24 
      009AE0 00 1D 3A         [ 2] 4933 	ldw x,#drive_free
      009AE1 CD 01 B0         [ 4] 4934 	call puts 
      001D2F                       4935 	_drop VSIZE 
      009AE1 72 01            [ 2]    1     addw sp,#VSIZE 
      009AE3 00               [ 4] 4936 	ret
      009AE4 25 02 4F 81 65 73 0A  4937 file_count: .asciz " files\n"
             00
      009AE8 20 62 79 74 65 73 20  4938 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   4939 
                                   4940 ;---------------------
                                   4941 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   4942 ; write 1 or more byte to FLASH or EEPROM
                                   4943 ; starting at address  
                                   4944 ; input:
                                   4945 ;   expr1  	is address 
                                   4946 ;   expr2   is byte to write
                                   4947 ; output:
                                   4948 ;   none 
                                   4949 ;---------------------
                           000001  4950 	ADDR=1
                           000002  4951 	VSIZ=2 
      001D47                       4952 write:
      001D47                       4953 	_vars VSIZE 
      009AE8 CD 86            [ 2]    1     sub sp,#VSIZE 
      009AEA 70 81 00 13      [ 1] 4954 	clr farptr ; expect 16 bits address 
      009AEC CD 12 EF         [ 4] 4955 	call expression
      009AEC 72 BB            [ 1] 4956 	cp a,#TK_INTGR 
      009AEE 00 15            [ 1] 4957 	jreq 0$
      009AF0 24 04 72         [ 2] 4958 	jp syntax_error
      009AF3 5C 00            [ 2] 4959 0$: ldw (ADDR,sp),x 
      009AF5 14 CF 00         [ 4] 4960 	call next_token 
      009AF8 15 81            [ 1] 4961 	cp a,#TK_COMMA 
      009AFA 27 02            [ 1] 4962 	jreq 1$ 
      009AFA A6 01            [ 2] 4963 	jra 9$ 
      009AFC C7 00 14         [ 4] 4964 1$:	call expression
      009AFF 5F CF            [ 1] 4965 	cp a,#TK_INTGR
      009B01 00 15            [ 1] 4966 	jreq 2$
      009B03 CC 07 22         [ 2] 4967 	jp syntax_error
      009B03 5F               [ 1] 4968 2$:	ld a,xl 
      009B04 92 AF            [ 2] 4969 	ldw x,(ADDR,sp) 
      009B06 00 14 26         [ 2] 4970 	ldw farptr+1,x 
      009B09 15               [ 1] 4971 	clrw x 
      009B0A 5C 92 AF         [ 4] 4972 	call write_byte
      009B0D 00 14            [ 2] 4973 	ldw x,(ADDR,sp)
      009B0F 26               [ 1] 4974 	incw x 
      009B10 0E 5C            [ 2] 4975 	jra 0$ 
      001D7B                       4976 9$:
      001D7B                       4977 	_drop VSIZE
      009B12 92 AF            [ 2]    1     addw sp,#VSIZE 
      009B14 00               [ 4] 4978 	ret 
                                   4979 
                                   4980 
                                   4981 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   4982 ;BASIC: CHAR(expr)
                                   4983 ; évaluate expression 
                                   4984 ; and take the 7 least 
                                   4985 ; bits as ASCII character
                                   4986 ;---------------------
      001D7E                       4987 char:
      009B15 14 26            [ 1] 4988 	ld a,#TK_LPAREN 
      009B17 07 5C 92         [ 4] 4989 	call expect 
      009B1A AF 00 14         [ 4] 4990 	call relation 
      009B1D 27 28            [ 1] 4991 	cp a,#TK_INTGR 
      009B1F 27 03            [ 1] 4992 	jreq 1$
      009B1F 1C 00 01         [ 2] 4993 	jp syntax_error
      009B22 CD               [ 2] 4994 1$:	pushw x 
      009B23 9A EC            [ 1] 4995 	ld a,#TK_RPAREN 
      009B25 AE 02 7F         [ 4] 4996 	call expect
      009B28 C3               [ 2] 4997 	popw x  
      009B29 00               [ 1] 4998 	ld a,xl 
      009B2A 14 2A            [ 1] 4999 	and a,#0x7f 
      009B2C D6               [ 1] 5000 	ld xl,a
      009B2D 72 5F            [ 1] 5001 	ld a,#TK_CHAR
      009B2F 00               [ 4] 5002 	ret
                                   5003 
                                   5004 ;---------------------
                                   5005 ; BASIC: ASC(string|char)
                                   5006 ; extract first character 
                                   5007 ; of string argument 
                                   5008 ; return it as TK_INTGR 
                                   5009 ;---------------------
      001D9B                       5010 ascii:
      009B30 17 72            [ 1] 5011 	ld a,#TK_LPAREN
      009B32 5F 00 18         [ 4] 5012 	call expect 
      009B35 72 5F 00         [ 4] 5013 	call next_token 
      009B38 19 72            [ 1] 5014 	cp a,#TK_QSTR 
      009B3A 5F 00            [ 1] 5015 	jreq 1$
      009B3C 09 72            [ 1] 5016 	cp a,#TK_CHAR 
      009B3E 5F 00            [ 1] 5017 	jreq 2$ 
      009B40 0A 72 5F         [ 2] 5018 	jp syntax_error
      001DAE                       5019 1$: 
      009B43 00               [ 1] 5020 	ld a,(x)
      009B44 0B 20            [ 2] 5021 	jra 3$
      001DB1                       5022 2$: 
      009B46 1A               [ 1] 5023 	ld a,xl 
      009B47 97               [ 1] 5024 3$:	ld xl,a 
      009B47 CE               [ 1] 5025 	clr a  
      009B48 00               [ 1] 5026 	ld xh,a 
      009B49 15               [ 2] 5027 	pushw x  
      009B4A A3 00            [ 1] 5028 	ld a,#TK_RPAREN 
      009B4C 00 27 06         [ 4] 5029 	call expect 
      009B4F AE               [ 2] 5030 	popw x 
      009B50 00 01            [ 1] 5031 	ld a,#TK_INTGR 
      009B52 CD               [ 4] 5032 	ret 
                                   5033 
                                   5034 ;---------------------
                                   5035 ;BASIC: KEY
                                   5036 ; wait for a character 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   5037 ; received from STDIN 
                                   5038 ; input:
                                   5039 ;	none 
                                   5040 ; output:
                                   5041 ;	X 		ASCII character 
                                   5042 ;---------------------
      001DBF                       5043 key:
      009B53 9A EC A7         [ 4] 5044 	call getc 
      009B55 5F               [ 1] 5045 	clrw x 
      009B55 CE               [ 1] 5046 	ld xl,a 
      009B56 00 14            [ 1] 5047 	ld a,#TK_INTGR
      009B58 C6               [ 4] 5048 	ret
                                   5049 
                                   5050 ;----------------------
                                   5051 ; BASIC: QKEY
                                   5052 ; Return true if there 
                                   5053 ; is a character in 
                                   5054 ; waiting in STDIN 
                                   5055 ; input:
                                   5056 ;  none 
                                   5057 ; output:
                                   5058 ;   X 		0|1 
                                   5059 ;-----------------------
      001DC7                       5060 qkey: 
      009B59 00               [ 1] 5061 	clrw x 
      009B5A 16 CF 00 17 C7   [ 2] 5062 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      009B5F 00               [ 1] 5063 	incw x 
      009B60 19 81            [ 1] 5064 9$: ld a,#TK_INTGR
      009B62 81               [ 4] 5065 	ret 
                                   5066 
                                   5067 ;---------------------
                                   5068 ; BASIC: GPIO(expr,reg)
                                   5069 ; return gpio address 
                                   5070 ; expr {0..8}
                                   5071 ; input:
                                   5072 ;   none 
                                   5073 ; output:
                                   5074 ;   X 		gpio register address
                                   5075 ;----------------------------
      001DD1                       5076 gpio:
      009B62 5F 92            [ 1] 5077 	ld a,#TK_LPAREN 
      009B64 AF 00 14         [ 4] 5078 	call expect 
      009B67 90 F1 26         [ 4] 5079 	call arg_list
      009B6A 08 4D            [ 1] 5080 	cp a,#2
      009B6C 27 12            [ 1] 5081 	jreq 1$
      009B6E 5C 90 5C         [ 2] 5082 	jp syntax_error  
      001DE0                       5083 1$:	
      009B71 20 F0            [ 1] 5084 	ld a,#TK_RPAREN 
      009B73 CD 11 E8         [ 4] 5085 	call expect 
      009B73 4D 27 07         [ 2] 5086 	ldw x,#2
      009B76 5C 92 AF 00      [ 5] 5087 	ldw x,([dstkptr],x) ; port 
      009B7A 14 20            [ 1] 5088 	jrmi bad_port
      009B7C F6 5C 98         [ 2] 5089 	cpw x,#9
      009B7F 81 16            [ 1] 5090 	jrpl bad_port
      009B80 A6 05            [ 1] 5091 	ld a,#5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009B80 5C               [ 4] 5092 	mul x,a
      009B81 99 81 00         [ 2] 5093 	addw x,#GPIO_BASE 
      009B83 89               [ 2] 5094 	pushw x 
      009B83 52 04 17         [ 4] 5095 	call dpop 
      009B86 03 5F CF         [ 2] 5096 	addw x,(1,sp)
      009B89 00 15            [ 2] 5097 	ldw (1,sp),x  
      009B8B 35 01 00         [ 4] 5098 	call ddrop  
      009B8E 14               [ 2] 5099 	popw x 
      009B8F A6 03            [ 1] 5100 	ld a,#TK_INTGR
      009B8F 92               [ 4] 5101 	ret
      001E09                       5102 bad_port:
      009B90 BC 00            [ 1] 5103 	ld a,#ERR_BAD_VALUE
      009B92 14 27 24         [ 2] 5104 	jp tb_error
                                   5105 
                                   5106 ;----------------------
                                   5107 ; BASIC: ODR 
                                   5108 ; return offset of gpio
                                   5109 ; ODR register: 0
                                   5110 ; ---------------------
      001E0E                       5111 port_odr:
      009B95 5F 16 03         [ 2] 5112 	ldw x,#GPIO_ODR
      009B98 CD 9B            [ 1] 5113 	ld a,#TK_INTGR
      009B9A 62               [ 4] 5114 	ret
                                   5115 
                                   5116 ;----------------------
                                   5117 ; BASIC: IDR 
                                   5118 ; return offset of gpio
                                   5119 ; IDR register: 1
                                   5120 ; ---------------------
      001E14                       5121 port_idr:
      009B9B 25 2C 92         [ 2] 5122 	ldw x,#GPIO_IDR
      009B9E AF 00            [ 1] 5123 	ld a,#TK_INTGR
      009BA0 14               [ 4] 5124 	ret
                                   5125 
                                   5126 ;----------------------
                                   5127 ; BASIC: DDR 
                                   5128 ; return offset of gpio
                                   5129 ; DDR register: 2
                                   5130 ; ---------------------
      001E1A                       5131 port_ddr:
      009BA1 6B 01 5C         [ 2] 5132 	ldw x,#GPIO_DDR
      009BA4 92 AF            [ 1] 5133 	ld a,#TK_INTGR
      009BA6 00               [ 4] 5134 	ret
                                   5135 
                                   5136 ;----------------------
                                   5137 ; BASIC: CRL  
                                   5138 ; return offset of gpio
                                   5139 ; CR1 register: 3
                                   5140 ; ---------------------
      001E20                       5141 port_cr1:
      009BA7 14 6B 02         [ 2] 5142 	ldw x,#GPIO_CR1
      009BAA 5C 72            [ 1] 5143 	ld a,#TK_INTGR
      009BAC FB               [ 4] 5144 	ret
                                   5145 
                                   5146 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5147 ; BASIC: CRH  
                                   5148 ; return offset of gpio
                                   5149 ; CR2 register: 4
                                   5150 ; ---------------------
      001E26                       5151 port_cr2:
      009BAD 01 CD 9A         [ 2] 5152 	ldw x,#GPIO_CR2
      009BB0 EC AE            [ 1] 5153 	ld a,#TK_INTGR
      009BB2 02               [ 4] 5154 	ret
                                   5155 
                                   5156 ;-------------------------
                                   5157 ; BASIC: UFLASH 
                                   5158 ; return user flash address
                                   5159 ; input:
                                   5160 ;  none 
                                   5161 ; output:
                                   5162 ;	A		TK_INTGR
                                   5163 ;   X 		user address 
                                   5164 ;---------------------------
      001E2C                       5165 uflash:
      009BB3 80 C3 00         [ 2] 5166 	ldw x,#user_space 
      009BB6 14 2A            [ 1] 5167 	ld a,#TK_INTGR 
      009BB8 D6               [ 4] 5168 	ret 
                                   5169 
                                   5170 ;-------------------------
                                   5171 ; BASIC: EEPROM 
                                   5172 ; return eeprom address
                                   5173 ; input:
                                   5174 ;  none 
                                   5175 ; output:
                                   5176 ;	A		TK_INTGR
                                   5177 ;   X 		eeprom address 
                                   5178 ;---------------------------
      009BB9                       5179 eeprom:
      009BB9 72 5F 00         [ 2] 5180 	ldw x,#EEPROM_BASE 
      009BBC 14 72            [ 1] 5181 	ld a,#TK_INTGR 
      009BBE 5F               [ 4] 5182 	ret 
                                   5183 
                                   5184 ;---------------------
                                   5185 ; BASIC: USR(addr[,arg])
                                   5186 ; execute a function written 
                                   5187 ; in binary code.
                                   5188 ; binary fonction should 
                                   5189 ; return token attribute in A 
                                   5190 ; and value in X. 
                                   5191 ; input:
                                   5192 ;   addr	routine address 
                                   5193 ;   arg 	is an optional argument 
                                   5194 ; output:
                                   5195 ;   A 		token attribute 
                                   5196 ;   X       returned value 
                                   5197 ;---------------------
      001E38                       5198 usr:
      009BBF 00 15            [ 2] 5199 	pushw y 	
      009BC1 72 5F            [ 1] 5200 	ld a,#TK_LPAREN 
      009BC3 00 16 5B         [ 4] 5201 	call expect 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009BC6 04 98 81         [ 4] 5202 	call arg_list 
      009BC9 A1 01            [ 1] 5203 	cp a,#1 
      009BC9 5B 04            [ 1] 5204 	jrpl 2$ 
      009BCB 99 81 22         [ 2] 5205 	jp syntax_error 
      009BCD A6 0A            [ 1] 5206 2$: ld a,#TK_RPAREN
      009BCD 72 01 00         [ 4] 5207 	call expect 
      009BD0 25 05 A6         [ 4] 5208 	call dpop 
      009BD3 07 CC            [ 1] 5209 	cp a,#2 
      009BD5 87 A4            [ 1] 5210 	jrmi 4$
      009BD7 90 93            [ 1] 5211 	ldw y,x ; y=arg 
      009BD7 CE 00 1E         [ 4] 5212 	call dpop ;x=addr 
      009BDA 72               [ 1] 5213 4$:	exgw y,x ; y=addr,x=arg 
      009BDB B0 00            [ 4] 5214 	call (y)
      009BDD 1C 26            [ 2] 5215 	popw y 
      009BDF 01               [ 4] 5216 	ret 
                                   5217 
                                   5218 ;------------------------------
                                   5219 ; BASIC: BYE 
                                   5220 ; halt mcu in its lowest power mode 
                                   5221 ; wait for reset or external interrupt
                                   5222 ; do a cold start on wakeup.
                                   5223 ;------------------------------
      001E60                       5224 bye:
      009BE0 81 0D 52 40 FB   [ 2] 5225 	btjf UART3_SR,#UART_SR_TC,.
      009BE1 8E               [10] 5226 	halt
      009BE1 C6 00 17         [ 2] 5227 	jp cold_start  
                                   5228 
                                   5229 ;----------------------------------
                                   5230 ; BASIC: SLEEP 
                                   5231 ; halt mcu until reset or external
                                   5232 ; interrupt.
                                   5233 ; Resume progam after SLEEP command
                                   5234 ;----------------------------------
      001E69                       5235 sleep:
      009BE4 CA 00 18 CA 00   [ 2] 5236 	btjf UART3_SR,#UART_SR_TC,.
      009BE9 19 26 05 A6      [ 1] 5237 	bset flags,#FSLEEP
      009BED 01               [10] 5238 	halt 
      009BEE CC               [ 4] 5239 	ret 
                                   5240 
                                   5241 ;-------------------------------
                                   5242 ; BASIC: PAUSE expr 
                                   5243 ; suspend execution for n msec.
                                   5244 ; input:
                                   5245 ;	none
                                   5246 ; output:
                                   5247 ;	none 
                                   5248 ;------------------------------
      001E74                       5249 pause:
      009BEF 87 A4 EF         [ 4] 5250 	call expression
      009BF1 A1 03            [ 1] 5251 	cp a,#TK_INTGR
      009BF1 CD 88            [ 1] 5252 	jreq pause02 
      009BF3 88 A1 08         [ 2] 5253 	jp syntax_error
      001E7E                       5254 pause02: 
      009BF6 27               [ 2] 5255 1$: tnzw x 
      009BF7 03 CC            [ 1] 5256 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009BF9 87               [10] 5257 	wfi 
      009BFA A2               [ 2] 5258 	decw x 
      009BFB 26 F9            [ 1] 5259 	jrne 1$
      009BFB 52               [ 1] 5260 2$:	clr a 
      009BFC 04               [ 4] 5261 	ret 
                                   5262 
                                   5263 ;------------------------------
                                   5264 ; BASIC: TICKS
                                   5265 ; return msec ticks counter value 
                                   5266 ; input:
                                   5267 ; 	none 
                                   5268 ; output:
                                   5269 ;	X 		TK_INTGR
                                   5270 ;-------------------------------
      001E87                       5271 get_ticks:
      009BFD 90 CE 00         [ 2] 5272 	ldw x,ticks 
      009C00 04 72            [ 1] 5273 	ld a,#TK_INTGR
      009C02 B9               [ 4] 5274 	ret 
                                   5275 
                                   5276 
                                   5277 
                                   5278 ;------------------------------
                                   5279 ; BASIC: ABS(expr)
                                   5280 ; return absolute value of expr.
                                   5281 ; input:
                                   5282 ;   none
                                   5283 ; output:
                                   5284 ;   X     	positive integer
                                   5285 ;-------------------------------
      001E8D                       5286 abs:
      009C03 00 01            [ 1] 5287 	ld a,#TK_LPAREN
      009C05 17 03 55         [ 4] 5288 	call expect 
      009C08 00 03 00         [ 4] 5289 	call arg_list
      009C0B 02 CD            [ 1] 5290 	cp a,#1 
      009C0D 9B 83            [ 1] 5291 	jreq 0$ 
      009C0F 24 05 A6         [ 2] 5292 	jp syntax_error
      001E9C                       5293 0$:  
      009C12 08 CC            [ 1] 5294 	ld a,#TK_RPAREN 
      009C14 87 A4 E8         [ 4] 5295 	call expect 
      009C16 CD 0F D2         [ 4] 5296     call dpop   
      009C16 CE               [ 1] 5297 	ld a,xh 
      009C17 00 17            [ 1] 5298 	bcp a,#0x80 
      009C19 C6 00            [ 1] 5299 	jreq 2$ 
      009C1B 19               [ 2] 5300 	negw x 
      009C1C CF 00            [ 1] 5301 2$: ld a,#TK_INTGR 
      009C1E 14               [ 4] 5302 	ret 
                                   5303 
                                   5304 ;------------------------------
                                   5305 ; BASIC: RND(expr)
                                   5306 ; return random number 
                                   5307 ; between 1 and expr inclusive
                                   5308 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5309 ; input:
                                   5310 ; 	none 
                                   5311 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



                                   5312 ;	X 		random positive integer 
                                   5313 ;------------------------------
      001EAD                       5314 random:
      009C1F C7 00            [ 1] 5315 	ld a,#TK_LPAREN 
      009C21 16 1E 03         [ 4] 5316 	call expect 
      009C24 CD 82 F2         [ 4] 5317 	call arg_list 
      009C27 5C 1F            [ 1] 5318 	cp a,#1
      009C29 01 5F            [ 1] 5319 	jreq 1$
      009C2B 16 03 CD         [ 2] 5320 	jp syntax_error
      009C2E 81 D1            [ 1] 5321 1$: ld a,#TK_RPAREN
      009C30 CE 00 1E         [ 4] 5322 	call expect 
      009C33 72 B0 00         [ 4] 5323 	call dpop 
      009C36 1C               [ 2] 5324 	pushw x 
      009C37 1F               [ 1] 5325 	ld a,xh 
      009C38 01 5F            [ 1] 5326 	bcp a,#0x80 
      009C3A 7B 01            [ 1] 5327 	jreq 2$
      009C3C CD 81            [ 1] 5328 	ld a,#ERR_BAD_VALUE
      009C3E 5C 5C 7B         [ 2] 5329 	jp tb_error
      001ECF                       5330 2$: 
                                   5331 ; acc16=(x<<5)^x 
      009C41 02 CD 81         [ 2] 5332 	ldw x,seedx 
      009C44 5C               [ 2] 5333 	sllw x 
      009C45 5C               [ 2] 5334 	sllw x 
      009C46 CD               [ 2] 5335 	sllw x 
      009C47 9A               [ 2] 5336 	sllw x 
      009C48 EC               [ 2] 5337 	sllw x 
      009C49 1E               [ 1] 5338 	ld a,xh 
      009C4A 01 89 5F         [ 1] 5339 	xor a,seedx 
      009C4D 90 CE 00         [ 1] 5340 	ld acc16,a 
      009C50 1C               [ 1] 5341 	ld a,xl 
      009C51 CD 81 D1         [ 1] 5342 	xor a,seedx+1 
      009C54 5B 02 CE         [ 1] 5343 	ld acc8,a 
                                   5344 ; seedx=seedy 
      009C57 00 14 C6         [ 2] 5345 	ldw x,seedy 
      009C5A 00 16 CF         [ 2] 5346 	ldw seedx,x  
                                   5347 ; seedy=seedy^(seedy>>1)
      009C5D 00 17            [ 2] 5348 	srlw y 
      009C5F C7 00            [ 1] 5349 	ld a,yh 
      009C61 19 5F 4B         [ 1] 5350 	xor a,seedy 
      009C64 04 0D 01         [ 1] 5351 	ld seedy,a  
      009C67 27 09            [ 1] 5352 	ld a,yl 
      009C69 4F CD 81         [ 1] 5353 	xor a,seedy+1 
      009C6C 5C 5C 0A         [ 1] 5354 	ld seedy+1,a 
                                   5355 ; acc16>>3 
      009C6F 01 20 F3         [ 2] 5356 	ldw x,acc16 
      009C72 84               [ 2] 5357 	srlw x 
      009C73 1E               [ 2] 5358 	srlw x 
      009C74 01               [ 2] 5359 	srlw x 
                                   5360 ; x=acc16^x 
      009C75 CD               [ 1] 5361 	ld a,xh 
      009C76 8A 27 5B         [ 1] 5362 	xor a,acc16 
      009C79 04               [ 1] 5363 	ld xh,a 
      009C7A 81               [ 1] 5364 	ld a,xl 
      009C7B C8 00 0A         [ 1] 5365 	xor a,acc8 
      009C7B 72               [ 1] 5366 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5367 ; seedy=x^seedy 
      009C7C 01 00 25         [ 1] 5368 	xor a,seedy+1
      009C7F 07               [ 1] 5369 	ld xl,a 
      009C80 27               [ 1] 5370 	ld a,xh 
      009C81 05 A6 07         [ 1] 5371 	xor a,seedy
      009C84 CC               [ 1] 5372 	ld xh,a 
      009C85 87 A4 0F         [ 2] 5373 	ldw seedy,x 
                                   5374 ; return seedy modulo expr + 1 
      009C87 90 85            [ 2] 5375 	popw y 
      009C87 CD               [ 2] 5376 	divw x,y 
      009C88 88               [ 1] 5377 	ldw x,y 
      009C89 88               [ 1] 5378 	incw x 
      009C8A A1 08            [ 1] 5379 	ld a,#TK_INTGR
      009C8C 27               [ 4] 5380 	ret 
                                   5381 
                                   5382 ;---------------------------------
                                   5383 ; BASIC: WORDS 
                                   5384 ; affiche la listes des mots du
                                   5385 ; dictionnaire.
                                   5386 ;---------------------------------
                           000001  5387 	WLEN=1
                           000002  5388 	LLEN=2  
                           000002  5389 	VSIZE=2 
      001F21                       5390 words:
      001F21                       5391 	_vars VSIZE
      009C8D 03 CC            [ 2]    1     sub sp,#VSIZE 
      009C8F 87 A2            [ 1] 5392 	clr (LLEN,sp)
      009C91 90 AE 21 50      [ 2] 5393 	ldw y,#kword_dict+2
      009C91 90               [ 1] 5394 0$:	ldw x,y
      009C92 CE               [ 1] 5395 	ld a,(x)
      009C93 00 04            [ 1] 5396 	and a,#15 
      009C95 72 B9            [ 1] 5397 	ld (WLEN,sp),a 
      009C97 00               [ 1] 5398 1$:	incw x 
      009C98 01               [ 1] 5399 	ld a,(x)
      009C99 55 00 03         [ 4] 5400 	call putc 
      009C9C 00 02            [ 1] 5401 	inc (LLEN,sp)
      009C9E CD 9B            [ 1] 5402 	dec (WLEN,sp)
      009CA0 83 25            [ 1] 5403 	jrne 1$
      009CA2 05 A6            [ 1] 5404 	ld a,#70
      009CA4 09 CC            [ 1] 5405 	cp a,(LLEN,sp)
      009CA6 87 A4            [ 1] 5406 	jrmi 2$   
      009CA8 A6 20            [ 1] 5407 	ld a,#SPACE 
      009CA8 CD 9A EC         [ 4] 5408 	call putc 
      009CAB CD 86            [ 1] 5409 	inc (LLEN,sp) 
      009CAD 70 5F            [ 2] 5410 	jra 3$
      009CAF 92 AF            [ 1] 5411 2$: ld a,#CR 
      009CB1 00 14 90         [ 4] 5412 	call putc 
      009CB4 95 5C            [ 1] 5413 	clr (LLEN,sp)
      009CB6 92 AF 00 14      [ 2] 5414 3$:	subw y,#2 
      009CBA 5C 90            [ 2] 5415 	ldw y,(y)
      009CBC 97 72            [ 1] 5416 	jrne 0$  
      001F58                       5417 	_drop VSIZE 
      009CBE B9 00            [ 2]    1     addw sp,#VSIZE 
      009CC0 1C               [ 4] 5418 	ret 
                                   5419 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                                   5420 
                                   5421 ;*********************************
                                   5422 
                                   5423 ;------------------------------
                                   5424 ;      dictionary 
                                   5425 ; format:
                                   5426 ;   link:   2 bytes 
                                   5427 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5428 ;   cmd_name: 16 byte max 
                                   5429 ;   code_address: 2 bytes 
                                   5430 ;------------------------------
                           000080  5431 	FFUNC=128 ; function flag 
                                   5432 	.macro _dict_entry len,name,cmd 
                                   5433 	.word LINK 
                                   5434 	LINK=.
                                   5435 name:
                                   5436 	.byte len 	
                                   5437 	.ascii "name"
                                   5438 	.word cmd 
                                   5439 	.endm 
                                   5440 
                           000000  5441 	LINK=0
      001F5B                       5442 kword_end:
      001F5B                       5443 	_dict_entry,3,BYE,bye 
      009CC1 90 CF                    1 	.word LINK 
                           001F5D     2 	LINK=.
      001F5D                          3 BYE:
      009CC3 00                       4 	.byte 3 	
      009CC4 1E 90 CE                 5 	.ascii "BYE"
      009CC7 00 1C                    6 	.word bye 
      009CC9                       5444 	_dict_entry,5,WORDS,words 
      009CC9 92 AF                    1 	.word LINK 
                           001F65     2 	LINK=.
      001F65                          3 WORDS:
      009CCB 00                       4 	.byte 5 	
      009CCC 14 90 F7 5C 90           5 	.ascii "WORDS"
      009CD1 5C 90                    6 	.word words 
      001F6D                       5445 	_dict_entry,5,SLEEP,sleep 
      009CD3 C3 00                    1 	.word LINK 
                           001F6F     2 	LINK=.
      001F6F                          3 SLEEP:
      009CD5 1E                       4 	.byte 5 	
      009CD6 2B F1 CE 00 1E           5 	.ascii "SLEEP"
      009CDB 72 B0                    6 	.word sleep 
      001F77                       5446 	_dict_entry,6,FORGET,forget 
      009CDD 00 1C                    1 	.word LINK 
                           001F79     2 	LINK=.
      001F79                          3 FORGET:
      009CDF CD                       4 	.byte 6 	
      009CE0 8A 27 81 47 45 54        5 	.ascii "FORGET"
      009CE3 1C 63                    6 	.word forget 
      001F82                       5447 	_dict_entry,3,DIR,directory 
      009CE3 CD 88                    1 	.word LINK 
                           001F84     2 	LINK=.
      001F84                          3 DIR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009CE5 88                       4 	.byte 3 	
      009CE6 A1 00 27                 5 	.ascii "DIR"
      009CE9 26 A1                    6 	.word directory 
      001F8A                       5448 	_dict_entry,4,LOAD,load 
      009CEB 08 27                    1 	.word LINK 
                           001F8C     2 	LINK=.
      001F8C                          3 LOAD:
      009CED 03                       4 	.byte 4 	
      009CEE CC 87 A2 90              5 	.ascii "LOAD"
      009CF2 CE 00                    6 	.word load 
      001F93                       5449 	_dict_entry,4,SAVE,save
      009CF4 04 72                    1 	.word LINK 
                           001F95     2 	LINK=.
      001F95                          3 SAVE:
      009CF6 B9                       4 	.byte 4 	
      009CF7 00 01 55 00              5 	.ascii "SAVE"
      009CFB 03 00                    6 	.word save 
      001F9C                       5450 	_dict_entry,5,WRITE,write  
      009CFD 02 CD                    1 	.word LINK 
                           001F9E     2 	LINK=.
      001F9E                          3 WRITE:
      009CFF 9B                       4 	.byte 5 	
      009D00 83 25 05 A6 09           5 	.ascii "WRITE"
      009D05 CC 87                    6 	.word write 
      001FA6                       5451 	_dict_entry,3,NEW,new
      009D07 A4 9E                    1 	.word LINK 
                           001FA8     2 	LINK=.
      009D08                          3 NEW:
      009D08 CE                       4 	.byte 3 	
      009D09 00 14 C6                 5 	.ascii "NEW"
      009D0C 00 16                    6 	.word new 
      001FAE                       5452 	_dict_entry,5,BREAK,break 
      009D0E 20 0A                    1 	.word LINK 
                           001FB0     2 	LINK=.
      009D10                          3 BREAK:
      009D10 AE                       4 	.byte 5 	
      009D11 00 64 4F CF 00           5 	.ascii "BREAK"
      009D16 14 C7                    6 	.word break 
      001FB8                       5453 	_dict_entry,4,BEEP,beep 
      009D18 00 16                    1 	.word LINK 
                           001FBA     2 	LINK=.
      009D1A                          3 BEEP:
      009D1A CF                       4 	.byte 4 	
      009D1B 00 17 C7 00              5 	.ascii "BEEP"
      009D1F 19 4B                    6 	.word beep 
      001FC1                       5454 	_dict_entry,4,STOP,stop 
      009D21 04 5F                    1 	.word LINK 
                           001FC3     2 	LINK=.
      001FC3                          3 STOP:
      009D23 0D                       4 	.byte 4 	
      009D24 01 27 09 4F              5 	.ascii "STOP"
      009D28 CD 81                    6 	.word stop 
      001FCA                       5455     _dict_entry,4,SHOW,show 
      009D2A 5C 5C                    1 	.word LINK 
                           001FCC     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      001FCC                          3 SHOW:
      009D2C 0A                       4 	.byte 4 	
      009D2D 01 20 F3 84              5 	.ascii "SHOW"
      009D31 81 8A                    6 	.word show 
      009D32                       5456 	_dict_entry 3,RUN,run
      009D32 52 02                    1 	.word LINK 
                           001FD5     2 	LINK=.
      001FD5                          3 RUN:
      009D34 5F                       4 	.byte 3 	
      009D35 1F 01 CF                 5 	.ascii "RUN"
      009D38 00 15                    6 	.word run 
      001FDB                       5457 	_dict_entry 4,LIST,list
      009D3A 35 01                    1 	.word LINK 
                           001FDD     2 	LINK=.
      001FDD                          3 LIST:
      009D3C 00                       4 	.byte 4 	
      009D3D 14 49 53 54              5 	.ascii "LIST"
      009D3E 13 E4                    6 	.word list 
      001FE4                       5458 	_dict_entry,3+FFUNC,USR,usr
      009D3E 5F 92                    1 	.word LINK 
                           001FE6     2 	LINK=.
      001FE6                          3 USR:
      009D40 AF                       4 	.byte 3+FFUNC 	
      009D41 00 14 27                 5 	.ascii "USR"
      009D44 38 38                    6 	.word usr 
      009D45                       5459 	_dict_entry,6+FFUNC,EEPROM,eeprom 
      009D45 92 AF                    1 	.word LINK 
                           001FEE     2 	LINK=.
      001FEE                          3 EEPROM:
      009D47 00                       4 	.byte 6+FFUNC 	
      009D48 14 27 06 CD 82 1E        5 	.ascii "EEPROM"
      009D4E 5C 20                    6 	.word eeprom 
      001FF7                       5460 	_dict_entry,6+FFUNC,UFLASH,uflash 
      009D50 F4 5C                    1 	.word LINK 
                           001FF9     2 	LINK=.
      001FF9                          3 UFLASH:
      009D52 A6                       4 	.byte 6+FFUNC 	
      009D53 20 CD 82 1E 92 AF        5 	.ascii "UFLASH"
      009D59 00 14                    6 	.word uflash 
      002002                       5461 	_dict_entry,3+FFUNC,ODR,port_odr
      009D5B 90 95                    1 	.word LINK 
                           002004     2 	LINK=.
      002004                          3 ODR:
      009D5D 5C                       4 	.byte 3+FFUNC 	
      009D5E 92 AF 00                 5 	.ascii "ODR"
      009D61 14 5C                    6 	.word port_odr 
      00200A                       5462 	_dict_entry,3+FFUNC,IDR,port_idr
      009D63 90 97                    1 	.word LINK 
                           00200C     2 	LINK=.
      00200C                          3 IDR:
      009D65 90                       4 	.byte 3+FFUNC 	
      009D66 89 72 FB                 5 	.ascii "IDR"
      009D69 01 CD                    6 	.word port_idr 
      002012                       5463 	_dict_entry,3+FFUNC,DDR,port_ddr 
      009D6B 9A EC                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



                           002014     2 	LINK=.
      002014                          3 DDR:
      009D6D 85                       4 	.byte 3+FFUNC 	
      009D6E CD 8A 27                 5 	.ascii "DDR"
      009D71 A6 0D                    6 	.word port_ddr 
      00201A                       5464 	_dict_entry,3+FFUNC,CRL,port_cr1 
      009D73 CD 82                    1 	.word LINK 
                           00201C     2 	LINK=.
      00201C                          3 CRL:
      009D75 1E                       4 	.byte 3+FFUNC 	
      009D76 1E 01 5C                 5 	.ascii "CRL"
      009D79 1F 01                    6 	.word port_cr1 
      002022                       5465 	_dict_entry,3+FFUNC,CRH,port_cr2
      009D7B 20 C1                    1 	.word LINK 
                           002024     2 	LINK=.
      009D7D                          3 CRH:
      009D7D 1E                       4 	.byte 3+FFUNC 	
      009D7E 01 CD 8A                 5 	.ascii "CRH"
      009D81 27 AE                    6 	.word port_cr2 
      00202A                       5466 	_dict_entry,4+FFUNC,GPIO,gpio 
      009D83 9D B2                    1 	.word LINK 
                           00202C     2 	LINK=.
      00202C                          3 GPIO:
      009D85 CD                       4 	.byte 4+FFUNC 	
      009D86 82 30 A6 FF              5 	.ascii "GPIO"
      009D8A C0 00                    6 	.word gpio 
      002033                       5467 	_dict_entry,6,PWRADC,power_adc 
      009D8C 19 C7                    1 	.word LINK 
                           002035     2 	LINK=.
      002035                          3 PWRADC:
      009D8E 00                       4 	.byte 6 	
      009D8F 0B A6 7F C2 00 18        5 	.ascii "PWRADC"
      009D95 C7 00                    6 	.word power_adc 
      00203E                       5468 	_dict_entry,5+FFUNC,RDADC,read_adc
      009D97 0A A6                    1 	.word LINK 
                           002040     2 	LINK=.
      002040                          3 RDADC:
      009D99 02                       4 	.byte 5+FFUNC 	
      009D9A C2 00 17 C7 00           5 	.ascii "RDADC"
      009D9F 09 5F                    6 	.word read_adc 
      002048                       5469 	_dict_entry,3+FFUNC,ASC,ascii  
      009DA1 A6 06                    1 	.word LINK 
                           00204A     2 	LINK=.
      00204A                          3 ASC:
      009DA3 97                       4 	.byte 3+FFUNC 	
      009DA4 A6 0A CD                 5 	.ascii "ASC"
      009DA7 89 DF                    6 	.word ascii 
      002050                       5470 	_dict_entry,4+FFUNC,CHAR,char
      009DA9 AE 9D                    1 	.word LINK 
                           002052     2 	LINK=.
      002052                          3 CHAR:
      009DAB BA                       4 	.byte 4+FFUNC 	
      009DAC CD 82 30 5B              5 	.ascii "CHAR"
      009DB0 02 81                    6 	.word char 
      002059                       5471 	_dict_entry,4+FFUNC,QKEY,qkey  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009DB2 20 66                    1 	.word LINK 
                           00205B     2 	LINK=.
      00205B                          3 QKEY:
      009DB4 69                       4 	.byte 4+FFUNC 	
      009DB5 6C 65 73 0A              5 	.ascii "QKEY"
      009DB9 00 20                    6 	.word qkey 
      002062                       5472 	_dict_entry,3+FFUNC,KEY,key 
      009DBB 62 79                    1 	.word LINK 
                           002064     2 	LINK=.
      002064                          3 KEY:
      009DBD 74                       4 	.byte 3+FFUNC 	
      009DBE 65 73 20                 5 	.ascii "KEY"
      009DC1 66 72                    6 	.word key 
      00206A                       5473 	_dict_entry,4+FFUNC,SIZE,size
      009DC3 65 65                    1 	.word LINK 
                           00206C     2 	LINK=.
      00206C                          3 SIZE:
      009DC5 0A                       4 	.byte 4+FFUNC 	
      009DC6 00 49 5A 45              5 	.ascii "SIZE"
      009DC7 13 A4                    6 	.word size 
      002073                       5474 	_dict_entry,3,HEX,hex_base
      009DC7 52 02                    1 	.word LINK 
                           002075     2 	LINK=.
      002075                          3 HEX:
      009DC9 72                       4 	.byte 3 	
      009DCA 5F 00 14                 5 	.ascii "HEX"
      009DCD CD 93                    6 	.word hex_base 
      00207B                       5475 	_dict_entry,3,DEC,dec_base
      009DCF 6F A1                    1 	.word LINK 
                           00207D     2 	LINK=.
      00207D                          3 DEC:
      009DD1 03                       4 	.byte 3 	
      009DD2 27 03 CC                 5 	.ascii "DEC"
      009DD5 87 A2                    6 	.word dec_base 
      002083                       5476 	_dict_entry,5+FFUNC,TICKS,get_ticks
      009DD7 1F 01                    1 	.word LINK 
                           002085     2 	LINK=.
      002085                          3 TICKS:
      009DD9 CD                       4 	.byte 5+FFUNC 	
      009DDA 88 88 A1 0B 27           5 	.ascii "TICKS"
      009DDF 02 20                    6 	.word get_ticks 
      00208D                       5477 	_dict_entry,3+FFUNC,ABS,abs
      009DE1 19 CD                    1 	.word LINK 
                           00208F     2 	LINK=.
      00208F                          3 ABS:
      009DE3 93                       4 	.byte 3+FFUNC 	
      009DE4 6F A1 03                 5 	.ascii "ABS"
      009DE7 27 03                    6 	.word abs 
      002095                       5478 	_dict_entry,3+FFUNC,RND,random 
      009DE9 CC 87                    1 	.word LINK 
                           002097     2 	LINK=.
      002097                          3 RND:
      009DEB A2                       4 	.byte 3+FFUNC 	
      009DEC 9F 1E 01                 5 	.ascii "RND"
      009DEF CF 00                    6 	.word random 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      00209D                       5479 	_dict_entry,5,PAUSE,pause 
      009DF1 15 5F                    1 	.word LINK 
                           00209F     2 	LINK=.
      00209F                          3 PAUSE:
      009DF3 CD                       4 	.byte 5 	
      009DF4 81 5C 1E 01 5C           5 	.ascii "PAUSE"
      009DF9 20 DC                    6 	.word pause 
      009DFB                       5480 	_dict_entry,4,BSET,bit_set 
      009DFB 5B 02                    1 	.word LINK 
                           0020A9     2 	LINK=.
      0020A9                          3 BSET:
      009DFD 81                       4 	.byte 4 	
      009DFE 42 53 45 54              5 	.ascii "BSET"
      009DFE A6 09                    6 	.word bit_set 
      0020B0                       5481 	_dict_entry,4,BRES,bit_reset
      009E00 CD 92                    1 	.word LINK 
                           0020B2     2 	LINK=.
      0020B2                          3 BRES:
      009E02 68                       4 	.byte 4 	
      009E03 CD 93 B3 A1              5 	.ascii "BRES"
      009E07 03 27                    6 	.word bit_reset 
      0020B9                       5482 	_dict_entry,5,BTOGL,bit_toggle
      009E09 03 CC                    1 	.word LINK 
                           0020BB     2 	LINK=.
      0020BB                          3 BTOGL:
      009E0B 87                       4 	.byte 5 	
      009E0C A2 89 A6 0A CD           5 	.ascii "BTOGL"
      009E11 92 68                    6 	.word bit_toggle 
      0020C3                       5483 	_dict_entry 4,WAIT,wait 
      009E13 85 9F                    1 	.word LINK 
                           0020C5     2 	LINK=.
      0020C5                          3 WAIT:
      009E15 A4                       4 	.byte 4 	
      009E16 7F 97 A6 02              5 	.ascii "WAIT"
      009E1A 81 0B                    6 	.word wait 
      009E1B                       5484 	_dict_entry 6,REMARK,rem 
      009E1B A6 09                    1 	.word LINK 
                           0020CE     2 	LINK=.
      0020CE                          3 REMARK:
      009E1D CD                       4 	.byte 6 	
      009E1E 92 68 CD 88 88 A1        5 	.ascii "REMARK"
      009E24 08 27                    6 	.word rem 
      0020D7                       5485 	_dict_entry 5,PRINT,print 
      009E26 07 A1                    1 	.word LINK 
                           0020D9     2 	LINK=.
      0020D9                          3 PRINT:
      009E28 02                       4 	.byte 5 	
      009E29 27 06 CC 87 A2           5 	.ascii "PRINT"
      009E2E 15 F7                    6 	.word print 
      0020E1                       5486 	_dict_entry,2,IF,if 
      009E2E F6 20                    1 	.word LINK 
                           0020E3     2 	LINK=.
      0020E3                          3 IF:
      009E30 01                       4 	.byte 2 	
      009E31 49 46                    5 	.ascii "IF"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009E31 9F 97                    6 	.word if 
      0020E8                       5487 	_dict_entry,5,GOSUB,gosub 
      009E33 4F 95                    1 	.word LINK 
                           0020EA     2 	LINK=.
      0020EA                          3 GOSUB:
      009E35 89                       4 	.byte 5 	
      009E36 A6 0A CD 92 68           5 	.ascii "GOSUB"
      009E3B 85 A6                    6 	.word gosub 
      0020F2                       5488 	_dict_entry,4,GOTO,goto 
      009E3D 03 81                    1 	.word LINK 
                           0020F4     2 	LINK=.
      009E3F                          3 GOTO:
      009E3F CD                       4 	.byte 4 	
      009E40 82 27 5F 97              5 	.ascii "GOTO"
      009E44 A6 03                    6 	.word goto 
      0020FB                       5489 	_dict_entry,3,FOR,for 
      009E46 81 F4                    1 	.word LINK 
                           0020FD     2 	LINK=.
      009E47                          3 FOR:
      009E47 5F                       4 	.byte 3 	
      009E48 72 0B 52                 5 	.ascii "FOR"
      009E4B 40 01                    6 	.word for 
      002103                       5490 	_dict_entry,2,TO,to
      009E4D 5C A6                    1 	.word LINK 
                           002105     2 	LINK=.
      002105                          3 TO:
      009E4F 03                       4 	.byte 2 	
      009E50 81 4F                    5 	.ascii "TO"
      009E51 17 E1                    6 	.word to 
      00210A                       5491 	_dict_entry,4,STEP,step 
      009E51 A6 09                    1 	.word LINK 
                           00210C     2 	LINK=.
      00210C                          3 STEP:
      009E53 CD                       4 	.byte 4 	
      009E54 92 68 CD 92              5 	.ascii "STEP"
      009E58 75 A1                    6 	.word step 
      002113                       5492 	_dict_entry,4,NEXT,next 
      009E5A 02 27                    1 	.word LINK 
                           002115     2 	LINK=.
      002115                          3 NEXT:
      009E5C 03                       4 	.byte 4 	
      009E5D CC 87 A2 54              5 	.ascii "NEXT"
      009E60 18 39                    6 	.word next 
      00211C                       5493 	_dict_entry,6+FFUNC,UBOUND,ubound 
      009E60 A6 0A                    1 	.word LINK 
                           00211E     2 	LINK=.
      00211E                          3 UBOUND:
      009E62 CD                       4 	.byte 6+FFUNC 	
      009E63 92 68 AE 00 02 72        5 	.ascii "UBOUND"
      009E69 DE 00                    6 	.word ubound 
      002127                       5494 	_dict_entry,6,RETURN,return 
      009E6B 1A 2B                    1 	.word LINK 
                           002129     2 	LINK=.
      002129                          3 RETURN:
      009E6D 1B                       4 	.byte 6 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009E6E A3 00 09 2A 16 A6        5 	.ascii "RETURN"
      009E74 05 42                    6 	.word return 
      002132                       5495 	_dict_entry,4+FFUNC,PEEK,peek 
      009E76 1C 50                    1 	.word LINK 
                           002134     2 	LINK=.
      002134                          3 PEEK:
      009E78 00                       4 	.byte 4+FFUNC 	
      009E79 89 CD 90 52              5 	.ascii "PEEK"
      009E7D 72 FB                    6 	.word peek 
      00213B                       5496 	_dict_entry,4,POKE,poke 
      009E7F 01 1F                    1 	.word LINK 
                           00213D     2 	LINK=.
      00213D                          3 POKE:
      009E81 01                       4 	.byte 4 	
      009E82 CD 90 79 85              5 	.ascii "POKE"
      009E86 A6 03                    6 	.word poke 
      002144                       5497 	_dict_entry,5,INPUT,input_var  
      009E88 81 3D                    1 	.word LINK 
                           002146     2 	LINK=.
      009E89                          3 INPUT:
      009E89 A6                       4 	.byte 5 	
      009E8A 0A CC 87 A4 54           5 	.ascii "INPUT"
      009E8E 16 91                    6 	.word input_var 
      00214E                       5498 kword_dict:
      00214E                       5499 	_dict_entry 3,LET,let 
      009E8E AE 00                    1 	.word LINK 
                           002150     2 	LINK=.
      002150                          3 LET:
      009E90 00                       4 	.byte 3 	
      009E91 A6 03 81                 5 	.ascii "LET"
      009E94 13 BC                    6 	.word let 
                                   5500 	
                                   5501 
      002180                       5502 	.bndry 128 ; align on FLASH block.
                                   5503 ; free space for user application  
      002180                       5504 user_space:
                                   5505 ; USR() function test
      009E94 AE               [ 2] 5506 	pushw x 
      009E95 00 01 A6 03      [ 1] 5507 	bset PC_ODR,#5 
      009E99 81               [ 2] 5508 	popw x 
      009E9A CD 1E 7E         [ 4] 5509 	call pause02 
      009E9A AE 00 02 A6      [ 1] 5510 	bres PC_ODR,#5 
      009E9E 03               [ 4] 5511 	ret
                                   5512 
                                   5513 	.area FLASH_DRIVE (ABS)
      010000                       5514 	.org 0x10000
      010000                       5515 fdrive:
                                   5516 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        00208F R   |     ADC_CR1 =  005401 
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
    ARG_OFS =  000002     |   5 ASC        00204A R   |     ATTRIB  =  000002 
    AWU_APR =  0050F1     |     AWU_CSR1=  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BASE_SAV=  000001     |   5 BEEP       001FBA R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |     BINARY  =  000001 
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BLOCK_ER=  000000 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  000005     |   5 BREAK      001FB0 R   |   5 BRES       0020B2 R
  5 BSET       0020A9 R   |     BSIZE   =  000001     |     BSP     =  000008 
  5 BTOGL      0020BB R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        001F5D R   |     C       =  000001     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000000     |   5 CHAR       002052 R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
    CLK_ECKR=  000001     |     CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0 
    CLK_ICKR=  000002     |     CLK_ICKR=  000000     |     CLK_ICKR=  000001 
    CLK_ICKR=  000003     |     CLK_ICKR=  000004     |     CLK_ICKR=  000005 
    CLK_PCKE=  0050C7     |     CLK_PCKE=  000000     |     CLK_PCKE=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
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
  5 CRH        002024 R   |   5 CRL        00201C R   |     CTRL_A  =  000001 
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
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        002014 R
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        00207D R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        001F84 R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
    DSTACK_S=  000040     |   5 EEPROM     001FEE R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |     ERR_BAD_=  00000A 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_L=  000005 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FCOMP   =  000005     |     FF      =  00000C     |     FFOR    =  000002 
    FFUNC   =  000080     |     FHSE    =  7A1200     |     FHSI    =  F42400 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   5 FOR        0020FD R
  5 FORGET     001F79 R   |     FRUN    =  000000     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FTRAP   =  000001     |   5 GOSUB      0020EA R
    GOS_RET =  000003     |   5 GOTO       0020F4 R   |   5 GPIO       00202C R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   5 HEX        002075 R   |     HSECNT  =  004809 
    I2C_CCRH=  00521C     |     I2C_CCRH=  000080     |     I2C_CCRH=  0000C0 
    I2C_CCRH=  000080     |     I2C_CCRH=  000000     |     I2C_CCRH=  000001 
    I2C_CCRH=  000000     |     I2C_CCRL=  00521B     |     I2C_CCRL=  00001A 
    I2C_CCRL=  000002     |     I2C_CCRL=  00000D     |     I2C_CCRL=  000050 
    I2C_CCRL=  000090     |     I2C_CCRL=  0000A0     |     I2C_CR1 =  005210 
    I2C_CR1_=  000006     |     I2C_CR1_=  000007     |     I2C_CR1_=  000000 
    I2C_CR2 =  005211     |     I2C_CR2_=  000002     |     I2C_CR2_=  000003 
    I2C_CR2_=  000000     |     I2C_CR2_=  000001     |     I2C_CR2_=  000007 
    I2C_DR  =  005216     |     I2C_FREQ=  005212     |     I2C_ITR =  00521A 
    I2C_ITR_=  000002     |     I2C_ITR_=  000000     |     I2C_ITR_=  000001 
    I2C_OARH=  005214     |     I2C_OARH=  000001     |     I2C_OARH=  000002 
    I2C_OARH=  000006     |     I2C_OARH=  000007     |     I2C_OARL=  005213 
    I2C_OARL=  000000     |     I2C_OAR_=  000813     |     I2C_OAR_=  000009 
    I2C_PECR=  00521E     |     I2C_READ=  000001     |     I2C_SR1 =  005217 
    I2C_SR1_=  000003     |     I2C_SR1_=  000001     |     I2C_SR1_=  000002 
    I2C_SR1_=  000006     |     I2C_SR1_=  000000     |     I2C_SR1_=  000004 
    I2C_SR1_=  000007     |     I2C_SR2 =  005218     |     I2C_SR2_=  000002 
    I2C_SR2_=  000001     |     I2C_SR2_=  000000     |     I2C_SR2_=  000003 
    I2C_SR2_=  000005     |     I2C_SR3 =  005219     |     I2C_SR3_=  000001 
    I2C_SR3_=  000007     |     I2C_SR3_=  000004     |     I2C_SR3_=  000000 
    I2C_SR3_=  000002     |     I2C_TRIS=  00521D     |     I2C_TRIS=  000005 
    I2C_TRIS=  000005     |     I2C_TRIS=  000005     |     I2C_TRIS=  000011 
    I2C_TRIS=  000011     |     I2C_TRIS=  000011     |     I2C_WRIT=  000000 
  5 IDR        00200C R   |   5 IF         0020E3 R   |     IN      =  000007 
    INCR    =  000001     |   5 INPUT      002146 R   |     INPUT_DI=  000000 
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
    INT_VECT=  008064     |     INT_VECT=  008008     |     INT_VECT=  008004 
    INT_VECT=  008050     |     INT_VECT=  00804C     |     INT_VECT=  00805C 
    INT_VECT=  008058     |     INW     =  000003     |     ITC_SPR1=  007F70 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Symbol Table

    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   5 KEY        002064 R   |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000005     |   5 LET        002150 R
    LINENO  =  000005     |   5 LINK    =  002150 R   |   5 LIST       001FDD R
    LL      =  000002     |     LLEN    =  000002     |     LL_HB   =  000001 
    LNO     =  000005     |     LN_PTR  =  000005     |   5 LOAD       001F8C R
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MINOR   =  000000     |     MULOP   =  000005     |     N1      =  000001 
    N1_HB   =  000006     |     N1_LB   =  000007     |     N2      =  000003 
    N2_HB   =  000008     |     N2_LB   =  000009     |     NAFR    =  004804 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        001FA8 R   |   5 NEXT       002115 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NL      =  00000A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R
  5 ODR        002004 R   |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |     PAD_SIZE=  000028     |   5 PAUSE      00209F R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       002134 R   |     PE_BASE =  005014 
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
  5 POKE       00213D R   |     PREV    =  000001     |   5 PRINT      0020D9 R
    PROD    =  000002     |     PSIZE   =  000001     |   5 PWRADC     002035 R
  5 QKEY       00205B R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 RDADC      002040 R   |   5 REG_A      000951 R
  5 REG_CC     000955 R   |   5 REG_EPC    000944 R   |   5 REG_SP     00095A R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

  5 REG_X      00094D R   |   5 REG_Y      000949 R   |     RELOP   =  000005 
  5 REMARK     0020CE R   |     RETL1   =  000001     |   5 RETURN     002129 R
  5 RND        002097 R   |     ROP     =  004800     |     RST_SR  =  0050B3 
  5 RUN        001FD5 R   |     RXCHAR  =  000001     |     R_A     =  000007 
    R_CC    =  000008     |     R_X     =  000005     |     R_Y     =  000003 
  5 SAVE       001F95 R   |     SDIVD   =  000002     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       001FCC R
    SIGN    =  000001     |   5 SIZE       00206C R   |     SKIP    =  000006 
  5 SLEEP      001F6F R   |     SPACE   =  000020     |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SQUOT   =  000001     |     SRC     =  000003 
    STACK_EM=  0017FF     |     STACK_SI=  000080     |   5 STATES     000907 R
  5 STEP       00210C R   |   5 STOP       001FC3 R   |     SWIM_CSR=  007F80 
    TAB     =  000009     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      002085 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
    TIM1_OIS=  00526F     |     TIM1_PSC=  005260     |     TIM1_PSC=  005261 
    TIM1_RCR=  005264     |     TIM1_SMC=  005252     |     TIM1_SMC=  000007 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM_CR1_=  000002     |     TK_ARRAY=  000005     |     TK_CHAR =  000002 
    TK_CMD  =  000006     |     TK_COLON=  000001     |     TK_COMMA=  00000B 
    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_FUNC =  000007 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_INTGR=  000003     |     TK_LE   =  000036 
    TK_LPARE=  000009     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_PLUS =  000010     |     TK_QSTR =  000008 
    TK_RPARE=  00000A     |     TK_SHARP=  00000C     |     TK_VAR  =  000004 
  5 TO         002105 R   |   5 Timer4Up   000019 R   |   5 TrapHand   00000A R
    U8      =  000003     |     UART1   =  000000     |     UART1_BA=  005230 
    UART1_BR=  005232     |     UART1_BR=  005233     |     UART1_CR=  005234 
    UART1_CR=  005235     |     UART1_CR=  005236     |     UART1_CR=  005237 
    UART1_CR=  005238     |     UART1_DR=  005231     |     UART1_GT=  005239 
    UART1_PO=  000000     |     UART1_PS=  00523A     |     UART1_RX=  000004 
    UART1_SR=  005230     |     UART1_TX=  000005     |     UART3   =  000001 
    UART3_BA=  005240     |     UART3_BR=  005242     |     UART3_BR=  005243 
    UART3_CR=  005244     |     UART3_CR=  005245     |     UART3_CR=  005246 
    UART3_CR=  005247     |     UART3_CR=  004249     |     UART3_DR=  005241 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

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
  5 UBOUND     00211E R   |   5 UFLASH     001FF9 R   |   5 USER_ABO   00007E R
  5 USR        001FE6 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |   5 UserButt   000025 R   |     VSIZ    =  000002 
    VSIZE   =  000002     |     VT      =  00000B     |   5 WAIT       0020C5 R
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH   =  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   5 WORDS      001F65 R
  5 WRITE      001F9E R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XADR    =  000001     |     XMASK   =  000001     |     XSAVE   =  000003 
    YSAVE   =  000003     |   5 abs        001E8D R   |   1 acc16      000009 R
  1 acc24      000008 R   |   1 acc8       00000A R   |   5 accept_c   000AFF R
  5 add        0010B3 R   |   5 ansi_seq   000ABD R   |   5 arg_list   0011F5 R
  1 array_ad   000020 R   |   1 array_si   000022 R   |   5 ascii      001D9B R
  5 at_tst     000DEC R   |   5 atoi24     000EFF R   |   5 atoi_exi   000F6D R
  5 bad_port   001E09 R   |   1 base       000007 R   |   1 basicptr   000003 R
  5 beep       00197C R   |   5 bin_exit   000CF2 R   |   5 bit_rese   00174A R
  5 bit_set    001736 R   |   5 bit_togg   00175F R   |   5 bkslsh_t   000D97 R
  5 bksp       0001BA R   |   5 break      001A12 R   |   5 break_po   001A43 R
  5 bye        001E60 R   |   5 char       001D7E R   |   5 check_fu   0003F2 R
  5 clear_ba   0005F0 R   |   5 clear_va   000500 R   |   5 clock_in   000099 R
  5 cmd_itf    000B23 R   |   5 cmd_name   00115E R   |   5 cmp_name   001AE2 R
  5 cold_sta   000565 R   |   5 colon_ts   000DC0 R   |   5 comma_ts   000DCB R
  5 compile    000401 R   |   5 convert_   000C58 R   |   1 count      000002 R
  5 cp_loop    0011A1 R   |   5 create_g   000343 R   |   5 cstk_pro   00107D R
  5 dash_tst   000DE1 R   |   5 ddrop      000FF9 R   |   5 ddrop_n    001036 R
  5 ddup       001002 R   |   5 dec_base   00139F R   |   5 del_back   000AF0 R
  5 del_line   00030B R   |   5 del_ln     000AE1 R   |   5 delete     0001CA R
  5 dir_loop   001CBE R   |   5 director   001CB2 R   |   5 divide     001109 R
  5 divu24_8   000A4A R   |   5 dotr       001086 R   |   5 dotr_loo   00109B R
  5 dots       001053 R   |   5 dpick      001013 R   |   5 dpop       000FD2 R
  5 dpush      000FC5 R   |   5 drive_fr   001D3A R   |   3 dstack     001740 R
  3 dstack_u   001780 R   |   5 dstk_pro   001049 R   |   1 dstkptr    000019 R
  5 dswap      000FDF R   |   5 eeprom     001E32 R   |   5 eql_tst    000E4C R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

  5 equal      0015EA R   |   5 err_bad_   0006D1 R   |   5 err_cmd_   000692 R
  5 err_div0   000654 R   |   5 err_dupl   0006AD R   |   5 err_math   00063A R
  5 err_mem_   00061D R   |   5 err_msg    000605 R   |   5 err_no_a   0006DE R
  5 err_no_l   000664 R   |   5 err_not_   0006BF R   |   5 err_run_   00067B R
  5 err_synt   00062B R   |   5 expect     0011E8 R   |   5 expr_exi   001330 R
  5 expressi   0012EF R   |   5 factor     00124C R   |   1 farptr     000013 R
  7 fdrive     010000 R   |   5 fetch      001022 R   |   5 fetchc     000C10 R
  1 ffree      000016 R   |   5 file_cou   001D32 R   |   5 final_te   000AB7 R
  5 first_li   00140F R   |   1 flags      000024 R   |   5 for        0017B7 R
  5 forget     001C63 R   |   1 free_ram   00005A R   |   5 ge         0015EC R
  5 get_arra   001219 R   |   5 get_tick   001E87 R   |   5 get_toke   000D34 R
  5 getc       0001A7 R   |   5 go_commo   0018DC R   |   5 gosub      0018B9 R
  5 goto       0018AC R   |   5 gpio       001DD1 R   |   5 gt         0015E8 R
  5 gt_tst     000E57 R   |   5 hex_base   00139A R   |   5 hse_cloc   000187 R
  5 hsi_cloc   000191 R   |   5 if         0017A3 R   |   1 in         000001 R
  1 in.w       000000 R   |   1 in.w.sav   000011 R   |   5 incr_far   001A6C R
  5 input_ex   001702 R   |   5 input_lo   00169D R   |   5 input_va   001691 R
  5 insert_l   000374 R   |   5 insert_l   0003EF R   |   5 interp     000794 R
  5 interp_l   0007D8 R   |   5 invalid    000B68 R   |   5 invalid_   000BE6 R
  5 is_alpha   00050E R   |   5 is_digit   000EEA R   |   5 itoa       000A03 R
  5 itoa_loo   000A1B R   |   5 key        001DBF R   |   5 kword_di   00214E R
  5 kword_en   001F5B R   |   5 last_lin   001418 R   |   5 le         0015F1 R
  5 ledoff     000857 R   |   5 ledon      000852 R   |   5 ledtoggl   00085C R
  5 left_arr   000ABD R   |   5 left_par   000865 R   |   5 let        0013BC R
  5 let02      0013C6 R   |   1 lineno     000005 R   |   5 lines_sk   00141D R
  5 list       0013E4 R   |   5 list_exi   001464 R   |   5 list_sta   001440 R
  5 load       001BFB R   |   5 loop_bac   001881 R   |   1 loop_dep   00001F R
  5 loop_don   00189A R   |   5 lt         0015EF R   |   5 lt_tst     000E90 R
  5 mem_peek   000B85 R   |   5 modulo     00114D R   |   5 move       00029E R
  5 move_dow   0002BC R   |   5 move_exi   0002DD R   |   5 move_loo   0002C1 R
  5 move_up    0002AE R   |   5 mul_char   0015D9 R   |   5 multiply   0010C1 R
  5 mulu24_8   000F71 R   |   5 nbr_tst    000D6D R   |   5 ne         0015F4 R
  5 neg_acc2   000A72 R   |   5 new        001A61 R   |   5 next       001839 R
  5 next_tok   000808 R   |   5 no_match   0011B3 R   |   5 none       000D34 R
  5 number     000C16 GR  |   5 other      000EC8 R   |   3 pad        001718 R
  5 parse_bi   000CD2 R   |   5 parse_in   000C97 R   |   5 parse_ke   000CFA R
  5 parse_qu   000C1D R   |   5 pause      001E74 R   |   5 pause02    001E7E R
  5 peek       001786 R   |   5 peek_byt   000BB0 R   |   5 plus_tst   000E20 R
  5 poke       001773 R   |   5 port_cr1   001E20 R   |   5 port_cr2   001E26 R
  5 port_ddr   001E1A R   |   5 port_idr   001E14 R   |   5 port_odr   001E0E R
  5 power_ad   0019A4 R   |   5 prcnt_ts   000E41 R   |   5 print      0015F7 R
  5 print_ex   00165B R   |   5 print_fa   000BF5 R   |   5 print_in   0009A7 R
  5 print_re   0008B4 R   |   5 print_st   000B78 R   |   5 prt_basi   00147B R
  5 prt_cmd_   001467 R   |   5 prt_loop   0015FB R   |   5 prt_peek   00024E R
  5 prt_reg1   000895 R   |   5 prt_reg8   000870 R   |   5 prt_regs   0001E4 R
  5 prti24     00095F R   |   1 ptr16      000014 R   |   1 ptr8       000015 R
  5 putc       00019E R   |   5 puts       0001B0 R   |   5 qkey       001DC7 R
  5 qmark_ts   000DF7 R   |   5 random     001EAD R   |   5 read_adc   0019DF R
  5 readln     000A95 R   |   5 readln_l   000A9B R   |   5 readln_q   000B14 R
  5 regs_sta   000227 R   |   5 rel_exit   001387 R   |   5 relation   001333 R
  5 relop_st   0015DC R   |   5 rem        001705 R   |   5 repl       000B31 R
  5 repl_exi   000B59 R   |   5 reprint    000ABD R   |   5 reset_co   0015F9 R
  5 rest_con   00167C R   |   5 return     001902 R   |   5 right_ar   000ABD R
  5 rparnt_t   000DB5 R   |   5 rt_msg     000712 R   |   5 run        001926 R
  5 save       001B4D R   |   5 save_con   001667 R   |   5 search_d   001190 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

  5 search_e   0011E4 R   |   5 search_f   001B03 R   |   5 search_l   0002E0 R
  5 search_l   0002EB R   |   5 search_n   001194 R   |   1 seedx      00000D R
  1 seedy      00000F R   |   5 seek_fdr   001A7A R   |   5 sharp_ts   000DD6 R
  5 show       00138A R   |   5 single_c   0015D5 R   |   5 size       0013A4 R
  5 skip       000FAB R   |   5 slash_ts   000E36 R   |   5 sleep      001E69 R
  5 software   00051F R   |   5 spaces     0001D8 R   |   3 stack_fu   001780 R
  3 stack_un   001800 R   |   5 star_tst   000E2B R   |   5 step       001811 R
  5 stop       00196D R   |   5 store      00102C R   |   5 store_lo   001823 R
  5 str_matc   0011C2 R   |   5 str_tst    000D5C R   |   5 strcmp     00027F R
  5 strcpy     000290 R   |   5 strlen     000272 R   |   5 substrac   0010BB R
  5 syntax_e   000722 R   |   1 tab_widt   000025 R   |   5 tb_error   000724 R
  5 term       0012A2 R   |   5 term01     0012AB R   |   5 term_exi   0012EC R
  5 test_p     000B70 R   |   3 tib        0016C8 R   |   5 tick_tst   000E0E R
  1 ticks      00000B R   |   5 timer4_i   0000AF R   |   5 to         0017E1 R
  5 to_upper   000EF3 GR  |   5 token_ch   000ED7 R   |   5 token_ex   000EE7 R
  1 txtbgn     00001B R   |   1 txtend     00001D R   |   5 uart3_in   000174 R
  5 uart3_se   000180 R   |   5 uart_ena   000199 R   |   5 ubound     0013AE R
  5 uflash     001E2C R   |   5 unget_to   000FBE R   |   5 unlock_e   0000C0 R
  5 unlock_f   0000CE R   |   5 user_spa   002180 R   |   5 usr        001E38 R
  1 vars       000026 R   |   5 wait       00170B R   |   5 warm_sta   000774 R
  5 words      001F21 R   |   5 write      001D47 R   |   5 write_bl   000151 R
  5 write_by   0000DC R   |   5 write_ee   000118 R   |   5 write_ex   00014C R
  5 write_fl   000102 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
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

