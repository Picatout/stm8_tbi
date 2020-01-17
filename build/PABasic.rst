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
      008000 82 00 85 9A             98     int cold_start
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
      00808E CD 88 DC         [ 4]  152 	call print_registers
      008091 CD 8B 4B         [ 4]  153 	call cmd_itf
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
      0080D6 CD 89 CF         [ 4]  191 	call print_int  	
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
      0080FB CC 87 A9         [ 2]  208 	jp warm_start
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
      00816E 90 A3 A1 80      [ 2]  369     cpw y,#user_space
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
      0081EE CD 9A 64         [ 4]  450 	call incr_farptr
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
      00826C AE 89 6C         [ 2]  595 	ldw x,#REG_EPC 
      00826F CD 88 BD         [ 4]  596 	call prt_reg16 
                                    597 ; register CC 
      008272 7B 08            [ 1]  598 	ld a,(R_CC,sp)
      008274 AE 89 7D         [ 2]  599 	ldw x,#REG_CC 
      008277 CD 88 98         [ 4]  600 	call prt_reg8 
                                    601 ; register A 
      00827A 7B 07            [ 1]  602 	ld a,(R_A,sp)
      00827C AE 89 79         [ 2]  603 	ldw x,#REG_A 
      00827F CD 88 98         [ 4]  604 	call prt_reg8 
                                    605 ; register X 
      008282 16 05            [ 2]  606 	ldw y,(R_X,sp)
      008284 AE 89 75         [ 2]  607 	ldw x,#REG_X 
      008287 CD 88 BD         [ 4]  608 	call prt_reg16 
                                    609 ; register Y 
      00828A 16 03            [ 2]  610 	ldw y,(R_Y,sp)
      00828C AE 89 71         [ 2]  611 	ldw x,#REG_Y 
      00828F CD 88 BD         [ 4]  612 	call prt_reg16 
                                    613 ; register SP 
      008292 90 96            [ 1]  614 	ldw y,sp
      008294 72 A9 00 08      [ 2]  615 	addw y,#6+ARG_OFS  
      008298 AE 89 82         [ 2]  616 	ldw x,#REG_SP
      00829B CD 88 BD         [ 4]  617 	call prt_reg16
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
      0082D9 CD 89 87         [ 4]  639 	call prti24 
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
      0082EE CD 89 87         [ 4]  649 	call prti24
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
      00839A 90 CE 00 1E      [ 2]  814 	ldw y,txtend 
      00839E 72 F2 03         [ 2]  815 	subw y,(SRC,sp) ; y=count 
      0083A1 90 CF 00 0A      [ 2]  816 	ldw acc16,y 
      0083A5 16 03            [ 2]  817 	ldw y,(SRC,sp)    ; source
      0083A7 CD 83 1E         [ 4]  818 	call move
      0083AA 90 CE 00 1E      [ 2]  819 	ldw y,txtend 
      0083AE 72 F2 01         [ 2]  820 	subw y,(LLEN,sp)
      0083B1 90 CF 00 1E      [ 2]  821 	ldw txtend,y  
      000335                        822 	_drop VSIZE     
      0083B5 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083B7 81               [ 4]  823 	ret 
                                    824 
                                    825 
                                    826 ;---------------------------------------------
                                    827 ; create a gap in text area 
                                    828 ; input:
                                    829 ;    X 			addr gap start 
                                    830 ;    Y 			gap length 
                                    831 ; output:
                                    832 ;    X 			addr gap start 
                                    833 ;--------------------------------------------
                           000001   834 	DEST=1
                           000003   835 	SRC=3
                           000005   836 	LEN=5
                           000006   837 	VSIZE=6 
      0083B8                        838 create_gap:
      000338                        839 	_vars VSIZE
      0083B8 52 06            [ 2]    1     sub sp,#VSIZE 
      0083BA C3 00 1E         [ 2]  840 	cpw x,txtend 
      0083BD 2A 27            [ 1]  841 	jrpl 9$ ; no need for a gap since at end of text.
      0083BF 1F 03            [ 2]  842 	ldw (SRC,sp),x 
      0083C1 17 05            [ 2]  843 	ldw (LEN,sp),y 
      0083C3 90 CF 00 0A      [ 2]  844 	ldw acc16,y 
      0083C7 90 93            [ 1]  845 	ldw y,x ; SRC
      0083C9 72 BB 00 0A      [ 2]  846 	addw x,acc16  
      0083CD 1F 01            [ 2]  847 	ldw (DEST,sp),x 
                                    848 ;compute size to move 	
      0083CF CE 00 1E         [ 2]  849 	ldw x,txtend 
      0083D2 72 F0 03         [ 2]  850 	subw x,(SRC,sp)
      0083D5 CF 00 0A         [ 2]  851 	ldw acc16,x
      0083D8 1E 01            [ 2]  852 	ldw x,(DEST,sp) 
      0083DA CD 83 1E         [ 4]  853 	call move
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0083DD CE 00 1E         [ 2]  854 	ldw x,txtend
      0083E0 72 FB 05         [ 2]  855 	addw x,(LEN,sp)
      0083E3 CF 00 1E         [ 2]  856 	ldw txtend,x
      000366                        857 9$:	_drop VSIZE 
      0083E6 5B 06            [ 2]    1     addw sp,#VSIZE 
      0083E8 81               [ 4]  858 	ret 
                                    859 
                                    860 
                                    861 ;--------------------------------------------
                                    862 ; insert line in tib into text area 
                                    863 ; first search for already existing 
                                    864 ; replace existing 
                                    865 ; if strlen(tib)==0 delete existing 
                                    866 ; input:
                                    867 ;   ptr16 				pointer to tokenized line  
                                    868 ; output:
                                    869 ;   none
                                    870 ;---------------------------------------------
                           000001   871 	DEST=1  ; text area insertion address 
                           000003   872 	SRC=3   ; str to insert address 
                           000005   873 	LINENO=5 ; line number 
                           000007   874 	LLEN=7 ; line length 
                           000008   875 	VSIZE=8  
      0083E9                        876 insert_line:
      000369                        877 	_vars VSIZE 
      0083E9 52 08            [ 2]    1     sub sp,#VSIZE 
      0083EB CE 00 15         [ 2]  878 	ldw x,ptr16  
      0083EE C3 00 1C         [ 2]  879 	cpw x,txtbgn 
      0083F1 26 12            [ 1]  880 	jrne 0$
      0083F3 AE 00 02         [ 2]  881 	ldw x,#2 
      0083F6 72 D6 00 15      [ 4]  882 	ld a,([ptr16],x)
      0083FA 5F               [ 1]  883 	clrw x 
      0083FB 97               [ 1]  884 	ld xl,a 
      0083FC 72 BB 00 1E      [ 2]  885 	addw x,txtend 
      008400 CF 00 1E         [ 2]  886 	ldw txtend,x 
      008403 20 64            [ 2]  887 	jra insert_ln_exit 
      008405 72 CE 00 15      [ 5]  888 0$:	ldw x,[ptr16]
      008409 1F 05            [ 2]  889 	ldw (LINENO,sp),x 
      00840B AE 00 02         [ 2]  890 	ldw x,#2 
      00840E 72 D6 00 15      [ 4]  891 	ld a,([ptr16],x); line length 
      008412 97               [ 1]  892 	ld xl,a
      008413 1F 07            [ 2]  893 	ldw (LLEN,sp),x
      008415 1E 05            [ 2]  894 	ldw x,(LINENO,sp)
      008417 CD 83 60         [ 4]  895 	call search_lineno 
      00841A 5D               [ 2]  896 	tnzw x 
      00841B 26 04            [ 1]  897 	jrne 2$
                                    898 ; line doesn't exit 	
      00841D 17 01            [ 2]  899 	ldw (DEST,sp),y 
      00841F 20 05            [ 2]  900 	jra 3$
                                    901 ; line exit delete it.	
      008421 1F 01            [ 2]  902 2$: ldw (DEST,sp),x 
      008423 CD 83 8B         [ 4]  903 	call del_line
                                    904 ; leave or insert new line if LLEN>0
      008426                        905 3$: 
      008426 0D 08            [ 1]  906 	tnz (LLEN+1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008428 27 3F            [ 1]  907 	jreq insert_ln_exit ; empty line forget it.
      00842A 1E 01            [ 2]  908 	ldw x,(DEST,sp)
      00842C C3 00 1E         [ 2]  909 	cpw x,txtend 
      00842F 2A 12            [ 1]  910 	jrpl 4$ 
                                    911 ; must create a gap 
      008431 CE 00 1E         [ 2]  912 	ldw x,txtend 
      008434 72 FB 07         [ 2]  913 	addw x,(LLEN,sp)
      008437 CF 00 1E         [ 2]  914 	ldw txtend,x 
      00843A 1E 01            [ 2]  915 	ldw x,(DEST,sp)
      00843C 16 07            [ 2]  916 	ldw y,(LLEN,sp)
      00843E CD 83 B8         [ 4]  917 	call create_gap 
      008441 20 0B            [ 2]  918 	jra 5$ 
      008443                        919 4$: ; leave line at end. 
      008443 CE 00 1E         [ 2]  920 	ldw x,txtend 
      008446 72 FB 07         [ 2]  921 	addw x,(LLEN,sp)
      008449 CF 00 1E         [ 2]  922 	ldw txtend,x 
      00844C 20 1B            [ 2]  923 	jra insert_ln_exit 
      00844E                        924 5$:	
      00844E 1E 07            [ 2]  925 	ldw x,(LLEN,sp)
      008450 CF 00 0A         [ 2]  926 	ldw acc16,x 
      008453 90 CE 00 15      [ 2]  927 	ldw y,ptr16 
      008457 72 F9 07         [ 2]  928 	addw y,(LLEN,sp)
      00845A 1E 01            [ 2]  929 	ldw x,(DEST,sp) ; dest address 
      00845C CD 83 1E         [ 4]  930 	call move 
      00845F CE 00 1E         [ 2]  931 	ldw x,txtend 
      008462 72 F0 07         [ 2]  932 	subw x,(LLEN,sp)
      008465 CF 00 1E         [ 2]  933 	ldw txtend,x
      008468 7F               [ 1]  934 	clr (x) 
      008469                        935 insert_ln_exit:	
      0003E9                        936 	_drop VSIZE
      008469 5B 08            [ 2]    1     addw sp,#VSIZE 
      00846B 81               [ 4]  937 	ret
                                    938 
                                    939 
                                    940 ;-----------------------------
                                    941 ; check if text buffer full
                                    942 ; input:
                                    943 ;   ptr16     addr start tokenize line 
                                    944 ;   X         buffer index 
                                    945 ; output:
                                    946 ;   none 
                                    947 ;-----------------------------------
      00846C                        948 check_full:
      00846C 72 BB 00 15      [ 2]  949 	addw x,ptr16 
      008470 A3 16 C8         [ 2]  950 	cpw x,#tib 
      008473 25 05            [ 1]  951 	jrult 1$
      008475 A6 01            [ 1]  952 	ld a,#ERR_MEM_FULL
      008477 CC 87 59         [ 2]  953 	jp tb_error 
      00847A 81               [ 4]  954 1$: ret 
                                    955 
                                    956 
                                    957 ;-----------------------------------
                                    958 ; create token list form text line 
                                    959 ; save this list in text area
                                    960 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    961 ;   none
                                    962 ; output:
                                    963 ;   basicptr     token list buffer
                                    964 ;   lineno 		 BASIC line number 
                                    965 ;   in.w  		 cleared 
                                    966 ;-----------------------------------
                                    967 	.macro _incr_ptr16 n 
                                    968 	ldw x,#n 
                                    969 	addw x,ptr16 
                                    970 	ldw ptr16,x 
                                    971 	.endm 
                                    972 
                           000001   973 	XSAVE=1
                           000003   974 	BUFIDX=3
                           000004   975 	VSIZE=4
      00847B                        976 compile:
      0003FB                        977 	_vars VSIZE 
      00847B 52 04            [ 2]    1     sub sp,#VSIZE 
      00847D 72 1A 00 25      [ 1]  978 	bset flags,#FCOMP 
      008481 CE 00 1E         [ 2]  979 	ldw x,txtend
      008484 CF 00 15         [ 2]  980 	ldw ptr16,x 
      008487 5F               [ 1]  981 	clrw x 
      008488 AE 00 03         [ 2]  982 	ldw x,#3
      00848B 1F 03            [ 2]  983 	ldw (BUFIDX,sp),X  
      00848D CD 84 6C         [ 4]  984 	call check_full
      008490 5F               [ 1]  985 	clrw x 
      008491 72 CF 00 15      [ 5]  986 	ldw [ptr16],x 
      008495 CD 8D 67         [ 4]  987 	call get_token
      008498 1F 01            [ 2]  988 	ldw (XSAVE,sp),x 
      00849A A1 02            [ 1]  989 	cp a,#TK_INTGR 
      00849C 26 11            [ 1]  990 	jrne 3$
      00849E A3 00 00         [ 2]  991 	cpw x,#0  
      0084A1 22 03            [ 1]  992 	jrugt 1$
      0084A3 CC 87 57         [ 2]  993 	jp syntax_error 
      0084A6 72 CF 00 15      [ 5]  994 1$:	ldw [ptr16],x; line number
      0084AA CD 8D 67         [ 4]  995 2$:	call get_token
      0084AD 1F 01            [ 2]  996 	ldw (XSAVE,sp),x 
      0084AF A1 00            [ 1]  997 3$:	cp a,#TK_NONE 
      0084B1 27 4E            [ 1]  998 	jreq 9$ 
      0084B3 1E 03            [ 2]  999 	ldw x,(BUFIDX,sp)
      0084B5 CD 84 6C         [ 4] 1000 	call check_full 
      0084B8 16 03            [ 2] 1001 	ldw y,(BUFIDX,sp) 
      0084BA 91 D7 15         [ 4] 1002 	ld ([ptr16],y),a 
      0084BD 90 5C            [ 1] 1003 	incw y
      0084BF 17 03            [ 2] 1004 	ldw (BUFIDX,sp),y
      0084C1 A1 08            [ 1] 1005 	cp a,#TK_QSTR 
      0084C3 26 25            [ 1] 1006 	jrne 4$
      0084C5 AE 17 18         [ 2] 1007 	ldw x,#pad 
      0084C8 CD 82 F2         [ 4] 1008 	call strlen
      0084CB 5C               [ 1] 1009 	incw x  
      0084CC CD 84 6C         [ 4] 1010 	call check_full 
      0084CF 90 AE 17 18      [ 2] 1011 	ldw y,#pad 
      0084D3 CE 00 15         [ 2] 1012 	ldw x,ptr16
      0084D6 72 FB 03         [ 2] 1013 	addw x,(BUFIDX,sp)	
      0084D9 CD 83 10         [ 4] 1014 	call strcpy 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084DC AE 17 18         [ 2] 1015 	ldw x,#pad 
      0084DF CD 82 F2         [ 4] 1016 	call strlen 
      0084E2 5C               [ 1] 1017 	incw x
      0084E3 72 FB 03         [ 2] 1018 	addw x,(BUFIDX,sp) 
      0084E6 1F 03            [ 2] 1019 	ldw (BUFIDX,sp),x
      0084E8 20 C0            [ 2] 1020 	jra 2$  
      0084EA A1 02            [ 1] 1021 4$: cp a,#TK_INTGR
      0084EC 25 BC            [ 1] 1022 	jrult 2$
      0084EE A1 07            [ 1] 1023 	cp a,#TK_FUNC 
      0084F0 22 B8            [ 1] 1024 	Jrugt 2$
      0084F2 1E 01            [ 2] 1025 	ldw x,(XSAVE,sp) 
      0084F4 16 03            [ 2] 1026 	ldw y,(BUFIDX,sp)
      0084F6 91 DF 15         [ 5] 1027 	ldw ([ptr16],y),x
      0084F9 72 A9 00 02      [ 2] 1028 	addw y,#2 
      0084FD 17 03            [ 2] 1029 	ldw (BUFIDX,sp),y 
      0084FF 20 A9            [ 2] 1030 	jra 2$
      008501                       1031 9$: 
      008501 AE 00 02         [ 2] 1032 	ldw x,#2
      008504 16 03            [ 2] 1033 	ldw y,(BUFIDX,sp)
      008506 90 9F            [ 1] 1034 	ld a,yl 
      008508 72 D7 00 15      [ 4] 1035 	ld ([ptr16],x),a  	
      00850C 72 CE 00 15      [ 5] 1036 	ldw x,[ptr16]
      008510 27 09            [ 1] 1037 	jreq 10$
      008512 CD 83 E9         [ 4] 1038 	call insert_line
      008515 72 5F 00 03      [ 1] 1039 	clr  count 
      008519 20 13            [ 2] 1040 	jra  11$ 
      00851B                       1041 10$: 
      00851B CE 00 15         [ 2] 1042 	ldw x,ptr16 
      00851E CF 00 04         [ 2] 1043 	ldw basicptr,x 
      008521 E6 02            [ 1] 1044 	ld a,(2,x)
      008523 C7 00 03         [ 1] 1045 	ld count,a 
      008526 FE               [ 2] 1046 	ldw x,(x)
      008527 CF 00 06         [ 2] 1047 	ldw lineno,x 
      00852A 35 03 00 02      [ 1] 1048 	mov in,#3 
      00852E                       1049 11$:
      0004AE                       1050 	_drop VSIZE 
      00852E 5B 04            [ 2]    1     addw sp,#VSIZE 
      008530 72 1B 00 25      [ 1] 1051 	bres flags,#FCOMP 
      008534 81               [ 4] 1052 	ret 
                                   1053 
                                   1054 
                                   1055 ;------------------------------------
                                   1056 ;  set all variables to zero 
                                   1057 ; input:
                                   1058 ;   none 
                                   1059 ; output:
                                   1060 ;	none
                                   1061 ;------------------------------------
      008535                       1062 clear_vars:
      008535 AE 00 27         [ 2] 1063 	ldw x,#vars 
      008538 90 AE 00 34      [ 2] 1064 	ldw y,#2*26 
      00853C 7F               [ 1] 1065 1$:	clr (x)
      00853D 5C               [ 1] 1066 	incw x 
      00853E 90 5A            [ 2] 1067 	decw y 
      008540 26 FA            [ 1] 1068 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008542 81               [ 4] 1069 	ret 
                                   1070 
                                   1071 ;-------------------------------------
                                   1072 ; check if A is a letter
                                   1073 ; input:
                                   1074 ;   A 			character to test 
                                   1075 ; output:
                                   1076 ;   C flag      1 true, 0 false 
                                   1077 ;-------------------------------------
      008543                       1078 is_alpha:
      008543 A1 41            [ 1] 1079 	cp a,#'A 
      008545 8C               [ 1] 1080 	ccf
      008546 24 0B            [ 1] 1081 	jrnc 9$ 
      008548 A1 5B            [ 1] 1082 	cp a,#'Z+1 
      00854A 25 07            [ 1] 1083 	jrc 9$ 
      00854C A1 61            [ 1] 1084 	cp a,#'a 
      00854E 8C               [ 1] 1085 	ccf 
      00854F 24 02            [ 1] 1086 	jrnc 9$
      008551 A1 7B            [ 1] 1087 	cp a,#'z+1   
      008553 81               [ 4] 1088 9$: ret 	
                                   1089 
                                   1090 ;-------------------------------------
                                   1091 ;  program initialization entry point 
                                   1092 ;-------------------------------------
                           000001  1093 	MAJOR=1
                           000000  1094 	MINOR=0
      008554 0A 0A 54 69 6E 79 20  1095 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      00859A                       1096 cold_start:
                                   1097 ;set stack 
      00859A AE 17 FF         [ 2] 1098 	ldw x,#STACK_EMPTY
      00859D 94               [ 1] 1099 	ldw sp,x   
                                   1100 ; clear all ram 
      00859E 7F               [ 1] 1101 0$: clr (x)
      00859F 5A               [ 2] 1102 	decw x 
      0085A0 26 FC            [ 1] 1103 	jrne 0$
                                   1104 ; activate pull up on all inputs 
      0085A2 A6 FF            [ 1] 1105 	ld a,#255 
      0085A4 C7 50 03         [ 1] 1106 	ld PA_CR1,a 
      0085A7 C7 50 08         [ 1] 1107 	ld PB_CR1,a 
      0085AA C7 50 0D         [ 1] 1108 	ld PC_CR1,a 
      0085AD C7 50 12         [ 1] 1109 	ld PD_CR1,a 
      0085B0 C7 50 17         [ 1] 1110 	ld PE_CR1,a 
      0085B3 C7 50 1C         [ 1] 1111 	ld PF_CR1,a 
      0085B6 C7 50 21         [ 1] 1112 	ld PG_CR1,a 
      0085B9 C7 50 2B         [ 1] 1113 	ld PI_CR1,a 
                                   1114 ; select internal clock no divisor: 16 Mhz 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      0085BC A6 E1            [ 1] 1115 	ld a,#CLK_SWR_HSI 
      0085BE 5F               [ 1] 1116 	clrw x  
      0085BF CD 81 19         [ 4] 1117     call clock_init 
      0085C2 CD 81 2F         [ 4] 1118 	call timer4_init
                                   1119 ; UART3 at 115200 BAUD
      0085C5 CD 81 F4         [ 4] 1120 	call uart3_init
                                   1121 ; activate PE_4 (user button interrupt)
      0085C8 72 18 50 18      [ 1] 1122     bset PE_CR2,#USR_BTN_BIT 
                                   1123 ; display system information
      0085CC AE 85 54         [ 2] 1124 	ldw x,#software 
      0085CF CD 82 30         [ 4] 1125 	call puts 
      0085D2 A6 01            [ 1] 1126 	ld a,#MAJOR 
      0085D4 C7 00 0B         [ 1] 1127 	ld acc8,a 
      0085D7 5F               [ 1] 1128 	clrw x 
      0085D8 CF 00 09         [ 2] 1129 	ldw acc24,x 
      0085DB A6 0A            [ 1] 1130 	ld a,#10 
      0085DD CD 89 87         [ 4] 1131 	call prti24 
      0085E0 A6 2E            [ 1] 1132 	ld a,#'.
      0085E2 CD 82 1E         [ 4] 1133 	call putc 
      0085E5 A6 00            [ 1] 1134 	ld a,#MINOR 
      0085E7 C7 00 0B         [ 1] 1135 	ld acc8,a 
      0085EA 5F               [ 1] 1136 	clrw x 
      0085EB CF 00 09         [ 2] 1137 	ldw acc24,x 
      0085EE A6 0A            [ 1] 1138 	ld a,#10 
      0085F0 CD 89 87         [ 4] 1139 	call prti24 
      0085F3 A6 0D            [ 1] 1140 	ld a,#CR 
      0085F5 CD 82 1E         [ 4] 1141 	call putc 
      0085F8 CD 9A 72         [ 4] 1142 	call seek_fdrive 
                                   1143 ; configure LED2 pin 
      0085FB 72 1A 50 0D      [ 1] 1144     bset PC_CR1,#LED2_BIT
      0085FF 72 1A 50 0E      [ 1] 1145     bset PC_CR2,#LED2_BIT
      008603 72 1A 50 0C      [ 1] 1146     bset PC_DDR,#LED2_BIT
      008607 9A               [ 1] 1147 	rim 
      008608 AE 16 C8         [ 2] 1148 	ldw x,#tib
      00860B CF 00 21         [ 2] 1149 	ldw array_addr,x 
      00860E 72 5C 00 11      [ 1] 1150 	inc seedy+1 
      008612 72 5C 00 0F      [ 1] 1151 	inc seedx+1 
      008616 CD 86 25         [ 4] 1152 	call clear_basic
      008619 CD 93 E3         [ 4] 1153 	call ubound 
      00861C CD 90 07         [ 4] 1154 	call dpop 
      00861F CF 00 23         [ 2] 1155 	ldw array_size,x 
      008622 CC 87 A9         [ 2] 1156     jp warm_start 
                                   1157 
                                   1158 ;---------------------------
                                   1159 ; reset BASIC text variables 
                                   1160 ; and clear variables 
                                   1161 ;---------------------------
      008625                       1162 clear_basic:
      008625 5F               [ 1] 1163 	clrw x 
      008626 CF 00 06         [ 2] 1164 	ldw lineno,x
      008629 72 5F 00 03      [ 1] 1165 	clr count 
      00862D AE 00 5B         [ 2] 1166 	ldw x,#free_ram 
      008630 CF 00 1C         [ 2] 1167 	ldw txtbgn,x 
      008633 CF 00 1E         [ 2] 1168 	ldw txtend,x 
      008636 CD 85 35         [ 4] 1169 	call clear_vars 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008639 81               [ 4] 1170 	ret 
                                   1171 
                                   1172 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1173 ;;   Tiny BASIC error messages     ;;
                                   1174 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00863A                       1175 err_msg:
      00863A 00 00 86 52 86 60 86  1176 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             6F 86 89 86 99
      008646 86 B0 86 C7 86 E2 86  1177 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             F4 87 06
      008650 87 13                 1178 	.word err_no_access 
                                   1179 
      008652 0A 4D 65 6D 6F 72 79  1180 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      008660 0A 73 79 6E 74 61 78  1181 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      00866F 0A 6D 61 74 68 20 6F  1182 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      008689 0A 64 69 76 69 73 69  1183 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      008699 0A 69 6E 76 61 6C 69  1184 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      0086B0 0A 72 75 6E 20 74 69  1185 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      0086C7 0A 63 6F 6D 6D 61 6E  1186 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      0086E2 0A 64 75 70 6C 69 63  1187 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      0086F4 0A 46 69 6C 65 20 6E  1188 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      008706 0A 62 61 64 20 76 61  1189 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      008713 0A 46 69 6C 65 20 69  1190 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
                                   1191 
      008747 6C 61 73 74 20 74 6F  1192 rt_msg: .asciz "last token id: "
             6B 65 6E 20 69 64 3A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal  20-Bits]



             20 00
                                   1193 
      0006D7                       1194 syntax_error:
      008756 00 02            [ 1] 1195 	ld a,#ERR_SYNTAX 
                                   1196 
      008757                       1197 tb_error:
      008757 A6 02 BA         [ 2] 1198 	ldw x, #err_msg 
      008759 72 5F 00 09      [ 1] 1199 	clr acc16 
      008759 AE               [ 1] 1200 	sll a
      00875A 86 3A 72 5F      [ 1] 1201 	rlc acc16  
      00875E 00 0A 48         [ 1] 1202 	ld acc8, a 
      008761 72 59 00 0A      [ 2] 1203 	addw x,acc16 
      008765 C7               [ 2] 1204 	ldw x,(x)
      008766 00 0B 72         [ 4] 1205 	call puts
      008769 BB 00 0A FE CD   [ 2] 1206 	btjf flags,#FCOMP, 1$
      00876E 82 30 72         [ 2] 1207 	ldw x,#tib
      008771 0B 00 25         [ 4] 1208 	call puts 
      008774 18 AE            [ 1] 1209 	ld a,#CR 
      008776 16 C8 CD         [ 4] 1210 	call putc
      008779 82 30 A6         [ 2] 1211 	ldw x,#in.w.saved
      00877C 0D CD 82         [ 4] 1212 	call spaces
      00877F 1E AE            [ 1] 1213 	ld a,#'^
      008781 00 12 CD         [ 4] 1214 	call putc 
      008784 82 58            [ 2] 1215 	jra 6$
      008786 A6 5E CD         [ 2] 1216 1$:	ldw x,basicptr
      008789 82 1E 20         [ 4] 1217 	call prt_basic_line
      00878C 18 CE 00         [ 2] 1218 	ldw x,#rt_msg 
      00878F 04 CD 94         [ 4] 1219 	call puts 
      008792 B0 AE 87         [ 2] 1220 	ldw x,in.w.saved 
      008795 47 CD 82 30      [ 4] 1221 	ld a,([basicptr],x)
      008799 CE               [ 1] 1222 	clrw x 
      00879A 00               [ 1] 1223 	ld xl,a 
      00879B 12 72 D6         [ 4] 1224 	call print_int 
      00879E 00 04 5F         [ 2] 1225 6$: ldw x,#STACK_EMPTY 
      0087A1 97               [ 1] 1226     ldw sp,x
      000729                       1227 warm_start:
      0087A2 CD 89 CF AE      [ 1] 1228 	clr flags 
      0087A6 17 FF 94 1F      [ 1] 1229 	clr loop_depth 
      0087A9 AE 17 80         [ 2] 1230 	ldw x,#dstack_unf 
      0087A9 72 5F 00         [ 2] 1231 	ldw dstkptr,x 
      0087AC 25 72 5F 00      [ 1] 1232 	mov tab_width,#TAB_WIDTH 
      0087B0 20 AE 17 80      [ 1] 1233 	mov base,#10 
      0087B4 CF               [ 1] 1234 	clrw x 
      0087B5 00 1A 35         [ 2] 1235 	ldw lineno,x 
      0087B8 04 00 26         [ 2] 1236 	ldw x,#tib 
      0087BB 35 0A 00         [ 2] 1237 	ldw basicptr,x 
                                   1238 ;----------------------------
                                   1239 ;   BASIC interpreter
                                   1240 ;----------------------------
      000749                       1241 interp:
      0087BE 08 5F CF 00      [ 1] 1242 	clr in.w
      0087C2 06 AE 16 C8 CF   [ 2] 1243 	btjf flags,#FRUN,4$ 
                                   1244 ; running program
                                   1245 ; goto next basic line 
      0087C7 00 04 03         [ 2] 1246 	ldw x,basicptr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0087C9 E6 02            [ 1] 1247 	ld a,(2,x) ; line length 
      0087C9 72 5F 00         [ 1] 1248 	ld acc8,a 
      0087CC 01 72 01 00      [ 1] 1249 	clr acc16 
      0087D0 25 27 CE 00      [ 2] 1250 	addw x,acc16
      0087D4 04 E6 02         [ 2] 1251 	cpw x,txtend 
      0087D7 C7 00            [ 1] 1252 	jrpl warm_start
      0087D9 0B 72 5F         [ 2] 1253 	ldw basicptr,x ; start of next line  
      0087DC 00 0A            [ 1] 1254 	ld a,(2,x)
      0087DE 72 BB 00         [ 1] 1255 	ld count,a 
      0087E1 0A               [ 2] 1256 	ldw x,(x) ; line no 
      0087E2 C3 00 1E         [ 2] 1257 	ldw lineno,x 
      0087E5 2A C2 CF 00      [ 1] 1258 	mov in,#3 ; skip first 3 bytes of line 
      0087E9 04 E6            [ 2] 1259 	jra interp_loop 
      000779                       1260 4$: ; commande line mode 	
      0087EB 02 C7 00 03      [ 1] 1261 	clr in
      0087EF FE CF            [ 1] 1262 	ld a,#CR 
      0087F1 00 06 35         [ 4] 1263 	call putc 
      0087F4 03 00            [ 1] 1264 	ld a,#'> 
      0087F6 02 20 14         [ 4] 1265 	call putc 
      0087F9 CD 0A 3D         [ 4] 1266 	call readln
      0087F9 72 5F 00         [ 4] 1267 	call compile
      00078D                       1268 interp_loop:  
      0087FC 02 A6 0D         [ 1] 1269 	ld a,in 
      0087FF CD 82 1E         [ 1] 1270 	cp a,count  
      008802 A6 3E            [ 1] 1271 	jrpl interp
      008804 CD 82 1E         [ 4] 1272 	call next_token
      008807 CD 8A            [ 1] 1273 	cp a,#TK_COLON 
      008809 BD CD            [ 1] 1274 	jreq interp_loop 
      00880B 84 7B            [ 1] 1275 	cp a,#TK_NONE 
                                   1276 ;	jreq interp 
      00880D                       1277 1$:
      00880D C6 00            [ 1] 1278 	cp a,#TK_VAR
      00880F 02 C1            [ 1] 1279 	jrne 2$
      008811 00 03 2A         [ 4] 1280 	call let02  
      008814 B4 CD            [ 2] 1281 	jra interp_loop 
      0007A7                       1282 2$:	
      008816 88 3D            [ 1] 1283 	cp a,#TK_ARRAY 
      008818 A1 01            [ 1] 1284 	jrne 3$
      00881A 27 F1 A1         [ 4] 1285 	call get_array_element
      00881D 00 13 7B         [ 4] 1286 	call let02 
      00881E 20 DA            [ 2] 1287 	jra interp_loop 
      0007B3                       1288 3$:
      00881E A1 03            [ 1] 1289 	cp a,#TK_CMD
      008820 26 05            [ 1] 1290 	jrne 4$
      008822 CD               [ 4] 1291 	call (x) 
      008823 93 FB            [ 2] 1292 	jra interp_loop 
      0007BA                       1293 4$:	
      008825 20 E6 D7         [ 2] 1294 	jp syntax_error 
                                   1295 
                                   1296 ;--------------------------
                                   1297 ; extract next token from
                                   1298 ; token list 
                                   1299 ; basicptr -> base address 
                                   1300 ; in  -> offset in list array 
                                   1301 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



                                   1302 ;   A 		token attribute
                                   1303 ;   X 		token value if there is one
                                   1304 ;----------------------------------------
      008827                       1305 next_token:
      008827 A1 04            [ 1] 1306 	push #0
      008829 26 08 CD         [ 1] 1307 	ld a,in 
      00882C 92 4E CD         [ 1] 1308 	cp a,count 
      00882F 93               [ 1] 1309 	pop a 
      008830 FB 20            [ 1] 1310 	jrpl 9$ 
      008832 DA 00 00         [ 2] 1311 	ldw x,in.w 
      008833 CF 00 11         [ 2] 1312 	ldw in.w.saved,x 
      008833 A1 06 26         [ 2] 1313 	ldw x,basicptr 
      008836 03 FD 20 D3      [ 4] 1314 	ld a,([in.w],x)
      00883A 72 5C 00 01      [ 1] 1315 	inc in 
      00883A CC 87            [ 1] 1316 	cp a,#CMD_END 
      00883C 57 1C            [ 1] 1317 	jrult 9$
      00883D A1 08            [ 1] 1318 	cp a,#TK_QSTR 
      00883D 4B 00            [ 1] 1319 	jrugt 9$
      00883F C6 00            [ 1] 1320 	jrult 2$
      008841 02 C1 00 03      [ 2] 1321 	addw x,in.w 
      008845 84 2A            [ 2] 1322 	jra 9$
      008847 31 CE 00 01      [ 5] 1323 2$: ldw x,([in.w],x)
      00884B CF 00 12 CE      [ 2] 1324 	ldw y,in.w 
      00884F 00 04 72 D6      [ 2] 1325 	addw y,#2
      008853 00 01 72 5C      [ 2] 1326 	ldw in.w,y
      008857 00               [ 4] 1327 9$: ret	
                                   1328 
                                   1329 
                                   1330 ;----------------------------------------
                                   1331 ;   DEBUG support functions
                                   1332 ;----------------------------------------
                           000001  1333 .if DEBUG 
                                   1334 ; turn LED on 
      0007FA                       1335 ledon:
      008858 02 A1 02 25      [ 1] 1336     bset PC_ODR,#LED2_BIT
      00885C 1C               [ 4] 1337     ret 
                                   1338 
                                   1339 ; turn LED off 
      0007FF                       1340 ledoff:
      00885D A1 08 22 18      [ 1] 1341     bres PC_ODR,#LED2_BIT 
      008861 25               [ 4] 1342     ret 
                                   1343 
                                   1344 ; invert LED status 
      000804                       1345 ledtoggle:
      008862 06 72            [ 1] 1346     ld a,#LED2_MASK
      008864 BB 00 01         [ 1] 1347     xor a,PC_ODR
      008867 20 10 72         [ 1] 1348     ld PC_ODR,a
      00886A DE               [ 4] 1349     ret 
                                   1350 
      00080D                       1351 left_paren:
      00886B 00 01            [ 1] 1352 	ld a,#SPACE 
      00886D 90 CE 00         [ 4] 1353 	call putc
      008870 01 72            [ 1] 1354 	ld a,#'( 
      008872 A9 00 02         [ 4] 1355 	call putc 	
      008875 90               [ 4] 1356 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1357 
                                   1358 ;------------------------------
                                   1359 ; print 8 bit register 
                                   1360 ; input:
                                   1361 ;   X  point to register name 
                                   1362 ;   A  register value to print 
                                   1363 ; output:
                                   1364 ;   none
                                   1365 ;------------------------------- 
      000818                       1366 prt_reg8:
      008876 CF               [ 1] 1367 	push a 
      008877 00 01 81         [ 4] 1368 	call puts 
      00887A 7B 01            [ 1] 1369 	ld a,(1,sp) 
      00887A 72 1A 50         [ 1] 1370 	ld acc8,a 
      00887D 0A               [ 1] 1371 	clrw x 
      00887E 81               [ 1] 1372 	ld xl,a 
      00887F 35 10 00 07      [ 1] 1373 	mov base,#16
      00887F 72 1B 50         [ 4] 1374 	call print_int 
      008882 0A 81 0D         [ 4] 1375 	call left_paren 
      008884 84               [ 1] 1376 	pop a 
      008884 A6               [ 1] 1377 	clrw x 
      008885 20               [ 1] 1378 	ld xl,a 
      008886 C8 50 0A C7      [ 1] 1379 	mov base,#10 
      00888A 50 0A 81         [ 4] 1380 	call print_int  
      00888D A6 29            [ 1] 1381 	ld a,#') 
      00888D A6 20 CD         [ 4] 1382 	call putc
      008890 82               [ 4] 1383 	ret
                                   1384 
                                   1385 ;--------------------------------
                                   1386 ; print 16 bits register 
                                   1387 ; input:
                                   1388 ;   X   point register name 
                                   1389 ;   Y   register value to print 
                                   1390 ; output:
                                   1391 ;  none
                                   1392 ;--------------------------------
      00083D                       1393 prt_reg16: 
      008891 1E A6            [ 2] 1394 	pushw y 
      008893 28 CD 82         [ 4] 1395 	call puts 
      008896 1E 81            [ 2] 1396 	ldw x,(1,sp) 
      008898 35 10 00 07      [ 1] 1397 	mov base,#16 
      008898 88 CD 82         [ 4] 1398 	call print_int  
      00889B 30 7B 01         [ 4] 1399 	call left_paren 
      00889E C7               [ 2] 1400 	popw x 
      00889F 00 0B 5F 97      [ 1] 1401 	mov base,#10 
      0088A3 35 10 00         [ 4] 1402 	call print_int  
      0088A6 08 CD            [ 1] 1403 	ld a,#') 
      0088A8 89 CF CD         [ 4] 1404 	call putc
      0088AB 88               [ 4] 1405 	ret 
                                   1406 
                                   1407 ;------------------------------------
                                   1408 ; print registers contents saved on
                                   1409 ; stack by trap interrupt.
                                   1410 ;------------------------------------
      00085C                       1411 print_registers:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0088AC 8D 84 5F         [ 2] 1412 	ldw x,#STATES
      0088AF 97 35 0A         [ 4] 1413 	call puts
                                   1414 ; print EPC 
      0088B2 00 08 CD         [ 2] 1415 	ldw x, #REG_EPC
      0088B5 89 CF A6         [ 4] 1416 	call puts 
      0088B8 29 CD            [ 1] 1417 	ld a, (11,sp)
      0088BA 82 1E 81         [ 1] 1418 	ld acc8,a 
      0088BD 7B 0A            [ 1] 1419 	ld a, (10,sp) 
      0088BD 90 89 CD         [ 1] 1420 	ld acc16,a 
      0088C0 82 30            [ 1] 1421 	ld a,(9,sp) 
      0088C2 1E 01 35         [ 1] 1422 	ld acc24,a
      0088C5 10               [ 1] 1423 	clrw x  
      0088C6 00 08            [ 1] 1424 	ld a,#16
      0088C8 CD 89 CF         [ 4] 1425 	call prti24  
                                   1426 ; print X
      0088CB CD 88 8D         [ 2] 1427 	ldw x,#REG_X
      0088CE 85 35            [ 2] 1428 	ldw y,(5,sp)
      0088D0 0A 00 08         [ 4] 1429 	call prt_reg16  
                                   1430 ; print Y 
      0088D3 CD 89 CF         [ 2] 1431 	ldw x,#REG_Y
      0088D6 A6 29            [ 2] 1432 	ldw y, (7,sp)
      0088D8 CD 82 1E         [ 4] 1433 	call prt_reg16  
                                   1434 ; print A 
      0088DB 81 08 F9         [ 2] 1435 	ldw x,#REG_A
      0088DC 7B 04            [ 1] 1436 	ld a, (4,sp) 
      0088DC AE 89 2F         [ 4] 1437 	call prt_reg8
                                   1438 ; print CC 
      0088DF CD 82 30         [ 2] 1439 	ldw x,#REG_CC 
      0088E2 AE 89            [ 1] 1440 	ld a, (3,sp) 
      0088E4 6C CD 82         [ 4] 1441 	call prt_reg8 
                                   1442 ; print SP 
      0088E7 30 7B 0B         [ 2] 1443 	ldw x,#REG_SP
      0088EA C7 00            [ 1] 1444 	ldw y,sp 
      0088EC 0B 7B 0A C7      [ 2] 1445 	addw y,#12
      0088F0 00 0A 7B         [ 4] 1446 	call prt_reg16  
      0088F3 09 C7            [ 1] 1447 	ld a,#'\n' 
      0088F5 00 09 5F         [ 4] 1448 	call putc
      0088F8 A6               [ 4] 1449 	ret
                                   1450 
      0088F9 10 CD 89 87 AE 89 75  1451 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             16 05 CD 88 BD AE 89
             71 16 07 CD 88 BD AE
             89 79 7B 04 CD 88 98
             AE 89 7D 7B 03 CD 88
             98 AE 89 82 90 96 72
             A9 00 0C CD 88 BD A6
             0A CD 82 1E 81 0A 52
             65 67 69 73 74
      008936 65 72 73 20 73        1452 REG_EPC: .asciz "EPC:"
      00893B 74 61 74 65           1453 REG_Y:   .asciz "\nY:" 
      00893F 20 61 74 20           1454 REG_X:   .asciz "\nX:"
      008943 61 62 6F 72           1455 REG_A:   .asciz "\nA:" 
      008947 74 20 70 6F 69        1456 REG_CC:  .asciz "\nCC:"
      00894C 6E 74 2E 0A 2D        1457 REG_SP:  .asciz "\nSP:"
                                   1458 .endif ; DEBUG 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1459 
                                   1460 ;------------------------------------
                                   1461 ; print integer in acc24 
                                   1462 ; input:
                                   1463 ;	acc24 		integer to print 
                                   1464 ;	A 			numerical base for conversion 
                                   1465 ;               if bit 7 is set add a space at print end.
                                   1466 ;   XL 			field width, 0 -> no fill.
                                   1467 ;  output:
                                   1468 ;    none 
                                   1469 ;------------------------------------
                           000001  1470 	WIDTH = 1
                           000002  1471 	BASE = 2
                           000003  1472 	ADD_SPACE=3 ; add a space after number 
                           000003  1473 	VSIZE = 3
      000907                       1474 prti24:
      000907                       1475 	_vars VSIZE 
      008951 2D 2D            [ 2]    1     sub sp,#VSIZE 
      008953 2D 2D            [ 1] 1476 	clr (ADD_SPACE,sp)
      008955 2D 2D            [ 1] 1477 	bcp a,#0x80 
      008957 2D 2D            [ 1] 1478 	jreq 0$ 
      008959 2D 2D            [ 1] 1479 	cpl (ADD_SPACE,sp)
      00895B 2D 2D            [ 1] 1480 0$:	and a,#31 
      00895D 2D 2D            [ 1] 1481 	ld (BASE,sp),a
      00895F 2D               [ 1] 1482 	ld a,xl
      008960 2D 2D            [ 1] 1483 	ld (WIDTH,sp),a 
      008962 2D 2D            [ 1] 1484 	ld a, (BASE,sp)  
      008964 2D 2D 2D         [ 4] 1485     call itoa  ; conversion entier en  .asciz
      008967 2D 2D            [ 1] 1486 1$: ld a,(WIDTH,sp)
      008969 2D 0A            [ 1] 1487 	jreq 4$
      00896B 00 45 50         [ 1] 1488 	ld acc8,a 
      00896E 43               [ 2] 1489 	pushw x 
      00896F 3A 00 0A         [ 4] 1490 	call strlen 
      008972 59               [ 1] 1491 	ld a,xl 
      008973 3A               [ 2] 1492 	popw x 
      008974 00 0A 58         [ 3] 1493 	exg a,acc8 
      008977 3A 00 0A         [ 1] 1494 	sub a,acc8 
      00897A 41 3A            [ 1] 1495 	jrmi 4$
      00897C 00 0A            [ 1] 1496 	ld (WIDTH,sp),a 
      00897E 43 43            [ 1] 1497 	ld  a,#SPACE
      008980 3A 00            [ 1] 1498 3$: tnz (WIDTH,sp)
      008982 0A 53            [ 1] 1499 	jreq 4$
      008984 50               [ 2] 1500 	decw x 
      008985 3A               [ 1] 1501 	ld (x),a 
      008986 00 01            [ 1] 1502 	dec (WIDTH,sp) 
      008987 20 F6            [ 2] 1503 	jra 3$
      000940                       1504 4$: 
      008987 52 03 0F         [ 4] 1505 	call puts 
      00898A 03 A5            [ 1] 1506 	tnz (ADD_SPACE,sp)
      00898C 80 27            [ 1] 1507 	jreq 5$
      00898E 02 03            [ 1] 1508     ld a,#SPACE 
      008990 03 A4 1F         [ 4] 1509 	call putc 
      00094C                       1510 5$: _drop VSIZE 
      008993 6B 02            [ 2]    1     addw sp,#VSIZE 
      008995 9F               [ 4] 1511     ret	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1512 
                                   1513 ;-----------------------------------
                                   1514 ; print a 16 bit integer 
                                   1515 ; using variable 'base' as conversion
                                   1516 ; format.
                                   1517 ; input:
                                   1518 ;   X       integer to print 
                                   1519 ;   base    conversion base 
                                   1520 ; output:
                                   1521 ;   none 
                                   1522 ;-----------------------------------
                           000001  1523 	SIGN=1
                           000001  1524 	VSIZE=1
      00094F                       1525 print_int: 
      00094F                       1526 	_vars VSIZE 
      008996 6B 01            [ 2]    1     sub sp,#VSIZE 
      008998 7B 02            [ 1] 1527 	clr (SIGN,sp)
      00899A CD 8A 2B 7B      [ 2] 1528 	ldw y,#pad+PAD_SIZE-1 
      00899E 01 27            [ 1] 1529 	clr (y)
      0089A0 1F C7 00         [ 1] 1530 	ld a,base  
      0089A3 0B 89            [ 1] 1531 	cp a,#10 
      0089A5 CD 82            [ 1] 1532 	jrne 1$ 
      0089A7 F2               [ 2] 1533 	tnzw x 
      0089A8 9F 85            [ 1] 1534 	jrpl 1$ 
      0089AA 31 00            [ 1] 1535 	cpl (SIGN,sp)
      0089AC 0B               [ 2] 1536 	negw x 	 
      000966                       1537 1$:	
      0089AD C0 00 0B         [ 1] 1538 	ld a,base 
      0089B0 2B               [ 2] 1539 	div x,a 
      0089B1 0E 6B            [ 1] 1540 	add a,#'0 
      0089B3 01 A6            [ 1] 1541 	cp a,#'9+1 
      0089B5 20 0D            [ 1] 1542 	jrmi 2$ 
      0089B7 01 27            [ 1] 1543 	add a,#7 
      0089B9 06 5A            [ 2] 1544 2$: decw y 
      0089BB F7 0A            [ 1] 1545 	ld (y),a 
      0089BD 01               [ 2] 1546 	tnzw x 
      0089BE 20 F6            [ 1] 1547 	jrne 1$ 
      0089C0 A6 10            [ 1] 1548 	ld a,#16 
      0089C0 CD 82 30         [ 1] 1549 	cp a,base 
      0089C3 0D 03            [ 1] 1550 	jrne 3$
      0089C5 27 05            [ 1] 1551 	ld a,#'$
      0089C7 A6 20            [ 2] 1552 	decw y  
      0089C9 CD 82            [ 1] 1553 	ld (y),a
      0089CB 1E 5B            [ 2] 1554 	jra 9$ 
      0089CD 03 81            [ 1] 1555 3$: tnz (SIGN,sp)
      0089CF 27 06            [ 1] 1556 	jreq 9$ 
      0089CF 52 01            [ 1] 1557 	ld a,#'-
      0089D1 0F 01            [ 2] 1558 	decw y  
      0089D3 90 AE            [ 1] 1559 	ld (y),a
      000992                       1560 9$:	
      0089D5 17               [ 1] 1561 	ldw x,y 
      0089D6 3F 90 7F         [ 2] 1562 	subw x,#pad+PAD_SIZE-1 
      0089D9 C6               [ 2] 1563 	negw x  
      000997                       1564 10$:
      0089DA 00 08            [ 2] 1565 	decw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0089DC A1 0A            [ 1] 1566 	ld a,#SPACE 
      0089DE 26 06            [ 1] 1567 	ld (y),a
      0089E0 5D               [ 1] 1568 	incw x 
      0089E1 2A               [ 1] 1569 	ld a,xl 
      0089E2 03 03 01         [ 1] 1570 	cp a,tab_width
      0089E5 50 F3            [ 1] 1571 	jrmi 10$ 
      0089E6                       1572 12$:
      0089E6 C6               [ 1] 1573     ldw x,y 
      0089E7 00 08 62         [ 4] 1574 	call puts  
      0009A8                       1575 	_drop VSIZE 
      0089EA AB 30            [ 2]    1     addw sp,#VSIZE 
      0089EC A1               [ 4] 1576 	ret 
                                   1577 
                                   1578 ;------------------------------------
                                   1579 ; convert integer in acc24 to string
                                   1580 ; input:
                                   1581 ;   A	  	base
                                   1582 ;	acc24	integer to convert
                                   1583 ; output:
                                   1584 ;   X  		pointer to string
                                   1585 ;------------------------------------
                           000001  1586 	SIGN=1  ; integer sign 
                           000002  1587 	BASE=2  ; numeric base 
                           000002  1588 	VSIZE=2  ;locals size
      0009AB                       1589 itoa:
      0089ED 3A 2B            [ 2] 1590 	sub sp,#VSIZE
      0089EF 02 AB            [ 1] 1591 	ld (BASE,sp), a  ; base
      0089F1 07 90            [ 1] 1592 	clr (SIGN,sp)    ; sign
      0089F3 5A 90            [ 1] 1593 	cp a,#10
      0089F5 F7 5D            [ 1] 1594 	jrne 1$
                                   1595 	; base 10 string display with negative sign if bit 23==1
      0089F7 26 ED A6 10 C1   [ 2] 1596 	btjf acc24,#7,1$
      0089FC 00 08            [ 1] 1597 	cpl (SIGN,sp)
      0089FE 26 08 A6         [ 4] 1598 	call neg_acc24
      0009BF                       1599 1$:
                                   1600 ; initialize string pointer 
      008A01 24 90 5A         [ 2] 1601 	ldw x,#pad+PAD_SIZE-1
      008A04 90               [ 1] 1602 	clr (x)
      0009C3                       1603 itoa_loop:
      008A05 F7 20            [ 1] 1604     ld a,(BASE,sp)
      008A07 0A 0D 01         [ 4] 1605     call divu24_8 ; acc24/A 
      008A0A 27 06            [ 1] 1606     add a,#'0  ; remainder of division
      008A0C A6 2D            [ 1] 1607     cp a,#'9+1
      008A0E 90 5A            [ 1] 1608     jrmi 2$
      008A10 90 F7            [ 1] 1609     add a,#7 
      008A12 5A               [ 2] 1610 2$: decw x
      008A12 93               [ 1] 1611     ld (x),a
                                   1612 	; if acc24==0 conversion done
      008A13 1D 17 3F         [ 1] 1613 	ld a,acc24
      008A16 50 00 09         [ 1] 1614 	or a,acc16
      008A17 CA 00 0A         [ 1] 1615 	or a,acc8
      008A17 90 5A            [ 1] 1616     jrne itoa_loop
                                   1617 	;conversion done, next add '$' or '-' as required
      008A19 A6 20            [ 1] 1618 	ld a,(BASE,sp)
      008A1B 90 F7            [ 1] 1619 	cp a,#16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A1D 5C 9F            [ 1] 1620 	jreq 8$
      008A1F C1 00            [ 1] 1621 	ld a,(SIGN,sp)
      008A21 26 2B            [ 1] 1622     jreq 10$
      008A23 F3 2D            [ 1] 1623     ld a,#'-
      008A24 20 02            [ 2] 1624 	jra 9$ 
      008A24 93 CD            [ 1] 1625 8$: ld a,#'$ 
      008A26 82               [ 2] 1626 9$: decw x
      008A27 30               [ 1] 1627     ld (x),a
      0009EF                       1628 10$:
      008A28 5B 01            [ 2] 1629 	addw sp,#VSIZE
      008A2A 81               [ 4] 1630 	ret
                                   1631 
                                   1632 ;-------------------------------------
                                   1633 ; divide uint24_t by uint8_t
                                   1634 ; used to convert uint24_t to string
                                   1635 ; input:
                                   1636 ;	acc24	dividend
                                   1637 ;   A 		divisor
                                   1638 ; output:
                                   1639 ;   acc24	quotient
                                   1640 ;   A		remainder
                                   1641 ;------------------------------------- 
                                   1642 ; offset  on sp of arguments and locals
                           000001  1643 	U8   = 1   ; divisor on stack
                           000001  1644 	VSIZE =1
      008A2B                       1645 divu24_8:
      008A2B 52               [ 2] 1646 	pushw x ; save x
      008A2C 02               [ 1] 1647 	push a 
                                   1648 	; ld dividend UU:MM bytes in X
      008A2D 6B 02 0F         [ 1] 1649 	ld a, acc24
      008A30 01               [ 1] 1650 	ld xh,a
      008A31 A1 0A 26         [ 1] 1651 	ld a,acc24+1
      008A34 0A               [ 1] 1652 	ld xl,a
      008A35 72 0F            [ 1] 1653 	ld a,(U8,SP) ; divisor
      008A37 00               [ 2] 1654 	div x,a ; UU:MM/U8
      008A38 09               [ 1] 1655 	push a  ;save remainder
      008A39 05               [ 1] 1656 	ld a,xh
      008A3A 03 01 CD         [ 1] 1657 	ld acc24,a
      008A3D 8A               [ 1] 1658 	ld a,xl
      008A3E 9A 00 09         [ 1] 1659 	ld acc24+1,a
      008A3F 84               [ 1] 1660 	pop a
      008A3F AE               [ 1] 1661 	ld xh,a
      008A40 17 3F 7F         [ 1] 1662 	ld a,acc24+2
      008A43 97               [ 1] 1663 	ld xl,a
      008A43 7B 02            [ 1] 1664 	ld a,(U8,sp) ; divisor
      008A45 CD               [ 2] 1665 	div x,a  ; R:LL/U8
      008A46 8A 72            [ 1] 1666 	ld (U8,sp),a ; save remainder
      008A48 AB               [ 1] 1667 	ld a,xl
      008A49 30 A1 3A         [ 1] 1668 	ld acc24+2,a
      008A4C 2B               [ 1] 1669 	pop a
      008A4D 02               [ 2] 1670 	popw x
      008A4E AB               [ 4] 1671 	ret
                                   1672 
                                   1673 ;------------------------------------
                                   1674 ;  two's complement acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1675 ;  input:
                                   1676 ;		acc24 variable
                                   1677 ;  output:
                                   1678 ;		acc24 variable
                                   1679 ;-------------------------------------
      000A1A                       1680 neg_acc24:
      008A4F 07 5A F7 C6      [ 1] 1681 	cpl acc24+2
      008A53 00 09 CA 00      [ 1] 1682 	cpl acc24+1
      008A57 0A CA 00 0B      [ 1] 1683 	cpl acc24
      008A5B 26 E6            [ 1] 1684 	ld a,#1
      008A5D 7B 02 A1         [ 1] 1685 	add a,acc24+2
      008A60 10 27 08         [ 1] 1686 	ld acc24+2,a
      008A63 7B               [ 1] 1687 	clr a
      008A64 01 27 08         [ 1] 1688 	adc a,acc24+1
      008A67 A6 2D 20         [ 1] 1689 	ld acc24+1,a 
      008A6A 02               [ 1] 1690 	clr a 
      008A6B A6 24 5A         [ 1] 1691 	adc a,acc24 
      008A6E F7 00 08         [ 1] 1692 	ld acc24,a 
      008A6F 81               [ 4] 1693 	ret
                                   1694 
                                   1695 
                                   1696 ;------------------------------------
                                   1697 ; read a line of text from terminal
                                   1698 ; input:
                                   1699 ;	none
                                   1700 ; local variable on stack:
                                   1701 ;	LL  line length
                                   1702 ;   RXCHAR last received chaaracte 
                                   1703 ; output:
                                   1704 ;   text in tib  buffer
                                   1705 ;------------------------------------
                                   1706 	; local variables
                           000001  1707 	LL_HB=1
                           000001  1708 	RXCHAR = 1 ; last char received
                           000002  1709 	LL = 2  ; accepted line length
                           000002  1710 	VSIZE=2 
      000A3D                       1711 readln:
      008A6F 5B               [ 1] 1712 	clrw x 
      008A70 02               [ 2] 1713 	pushw x 
      008A71 81 AE 16 C8      [ 2] 1714  	ldw y,#tib ; input buffer
      008A72                       1715 readln_loop:
      008A72 89 88 C6         [ 4] 1716 	call getc
      008A75 00 09            [ 1] 1717 	ld (RXCHAR,sp),a
      008A77 95 C6            [ 1] 1718 	cp a,#CR
      008A79 00 0A            [ 1] 1719 	jrne 1$
      008A7B 97 7B 01         [ 2] 1720 	jp readln_quit
      008A7E 62 88            [ 1] 1721 1$:	cp a,#NL
      008A80 9E C7            [ 1] 1722 	jreq readln_quit
      008A82 00 09            [ 1] 1723 	cp a,#BSP
      008A84 9F C7            [ 1] 1724 	jreq del_back
      008A86 00 0A            [ 1] 1725 	cp a,#CTRL_D
      008A88 84 95            [ 1] 1726 	jreq del_ln
      008A8A C6 00            [ 1] 1727 	cp a,#CTRL_R 
      008A8C 0B 97            [ 1] 1728 	jreq reprint 
                                   1729 ;	cp a,#'[
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1730 ;	jreq ansi_seq
      000A5F                       1731 final_test:
      008A8E 7B 01            [ 1] 1732 	cp a,#SPACE
      008A90 62 6B            [ 1] 1733 	jrpl accept_char
      008A92 01 9F            [ 2] 1734 	jra readln_loop
      000A65                       1735 ansi_seq:
                                   1736 ;	call getc
                                   1737 ;	cp a,#'C 
                                   1738 ;	jreq rigth_arrow
                                   1739 ;	cp a,#'D 
                                   1740 ;	jreq left_arrow 
                                   1741 ;	jra final_test
      000A65                       1742 right_arrow:
                                   1743 ;	ld a,#BSP 
                                   1744 ;	call putc 
                                   1745 ;	jra realn_loop 
      000A65                       1746 left_arrow:
                                   1747 
                                   1748 ;	jra readln_loop
      000A65                       1749 reprint: 
      008A94 C7 00 0B 84      [ 1] 1750 	tnz count 
      008A98 85 81            [ 1] 1751 	jreq readln_loop
      008A9A 0D 02            [ 1] 1752 	tnz (LL,sp)
      008A9A 72 53            [ 1] 1753 	jrne readln_loop
      008A9C 00 0B 72         [ 2] 1754 	ldw x,#tib 
      008A9F 53 00 0A         [ 4] 1755 	call puts
      008AA2 72 53 00 09      [ 2] 1756 	ldw y,#tib 
      008AA6 A6 01 CB         [ 1] 1757 	ld a,count 
      008AA9 00 0B            [ 1] 1758 	ld (LL,sp),a
      008AAB C7 00 0B 4F      [ 1] 1759 	clr count 
      008AAF C9 00            [ 1] 1760 	clr (LL_HB,sp)
      008AB1 0A C7 00         [ 2] 1761 	addw y,(LL_HB,sp)
      008AB4 0A 4F            [ 2] 1762 	jra readln_loop 
      000A89                       1763 del_ln:
      008AB6 C9 00            [ 1] 1764 	ld a,(LL,sp)
      008AB8 09 C7 00         [ 4] 1765 	call delete
      008ABB 09 81 16 C8      [ 2] 1766 	ldw y,#tib
      008ABD 90 7F            [ 1] 1767 	clr (y)
      008ABD 5F 89            [ 1] 1768 	clr (LL,sp)
      008ABF 90 AE            [ 2] 1769 	jra readln_loop
      000A98                       1770 del_back:
      008AC1 16 C8            [ 1] 1771     tnz (LL,sp)
      008AC3 27 A7            [ 1] 1772     jreq readln_loop
      008AC3 CD 82            [ 1] 1773     dec (LL,sp)
      008AC5 27 6B            [ 2] 1774     decw y
      008AC7 01 A1            [ 1] 1775     clr  (y)
      008AC9 0D 26 03         [ 4] 1776     call bksp 
      008ACC CC 8B            [ 2] 1777     jra readln_loop	
      000AA7                       1778 accept_char:
      008ACE 3C A1            [ 1] 1779 	ld a,#TIB_SIZE-1
      008AD0 0A 27            [ 1] 1780 	cp a, (LL,sp)
      008AD2 69 A1            [ 1] 1781 	jreq readln_loop
      008AD4 08 27            [ 1] 1782 	ld a,(RXCHAR,sp)
      008AD6 41 A1            [ 1] 1783 	ld (y),a
      008AD8 04 27            [ 1] 1784 	inc (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008ADA 2E A1            [ 1] 1785 	incw y
      008ADC 12 27            [ 1] 1786 	clr (y)
      008ADE 06 01 9E         [ 4] 1787 	call putc 
      008ADF 20 87            [ 2] 1788 	jra readln_loop
      000ABC                       1789 readln_quit:
      008ADF A1 20            [ 1] 1790 	clr (y)
      008AE1 2A 44            [ 1] 1791 	ld a,(LL,sp)
      008AE3 20 DE 02         [ 1] 1792 	ld count,a 
      008AE5                       1793 	_drop VSIZE 
      008AE5 5B 02            [ 2]    1     addw sp,#VSIZE 
      008AE5 A6 0D            [ 1] 1794 	ld a,#CR
      008AE5 CD 01 9E         [ 4] 1795 	call putc
      008AE5 72               [ 4] 1796 	ret
                                   1797 
                           000001  1798 .if DEBUG 	
                                   1799 ;----------------------------
                                   1800 ; command interface
                                   1801 ; only 3 commands:
                                   1802 ;  'q' to resume application
                                   1803 ;  'p [addr]' to print memory values 
                                   1804 ;  's addr' to print string 
                                   1805 ;----------------------------
                                   1806 ;local variable 
                           000001  1807 	PSIZE=1
                           000001  1808 	VSIZE=1 
      000ACB                       1809 cmd_itf:
      008AE6 5D 00            [ 2] 1810 	sub sp,#VSIZE 
      008AE8 03 27 D8 0D      [ 1] 1811 	clr farptr 
      008AEC 02 26 D4 AE      [ 1] 1812 	clr farptr+1 
      008AF0 16 C8 CD 82      [ 1] 1813 	clr farptr+2  
      000AD9                       1814 repl:
      008AF4 30 90            [ 1] 1815 	ld a,#CR 
      008AF6 AE 16 C8         [ 4] 1816 	call putc 
      008AF9 C6 00            [ 1] 1817 	ld a,#'? 
      008AFB 03 6B 02         [ 4] 1818 	call putc
      008AFE 72 5F 00 03      [ 1] 1819 	clr in.w 
      008B02 0F 01 72 F9      [ 1] 1820 	clr in 
      008B06 01 20 BA         [ 4] 1821 	call readln
      008B09 90 AE 16 C8      [ 2] 1822 	ldw y,#tib  
      008B09 7B 02            [ 1] 1823 	ld a,(y)
      008B0B CD 82            [ 1] 1824 	jreq repl  
      008B0D 4A 90 AE 16      [ 1] 1825 	inc in 
      008B11 C8 90 7F         [ 4] 1826 	call to_upper 
      008B14 0F 02            [ 1] 1827 	cp a,#'Q 
      008B16 20 AB            [ 1] 1828 	jrne test_p
      008B18                       1829 repl_exit:
      008B18 0D 02 27 A7      [ 1] 1830 	clr tib 
      008B1C 0A 02 90 5A      [ 1] 1831 	clr count 
      008B20 90 7F CD 82      [ 1] 1832 	clr in 
      000B0D                       1833 	_drop #VSIZE 	
      008B24 3A 20            [ 2]    1     addw sp,##VSIZE 
      008B26 9C               [ 4] 1834 	ret  
      008B27                       1835 invalid:
      008B27 A6 4F 11         [ 2] 1836 	ldw x,#invalid_cmd 
      008B2A 02 27 96         [ 4] 1837 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B2D 7B 01            [ 2] 1838 	jra repl 
      000B18                       1839 test_p:	
      008B2F 90 F7            [ 1] 1840     cp a,#'P 
      008B31 0C 02            [ 1] 1841 	jreq mem_peek
      008B33 90 5C            [ 1] 1842     cp a,#'S 
      008B35 90 7F            [ 1] 1843 	jrne invalid 
      000B20                       1844 print_string:	
      008B37 CD 82 1E         [ 4] 1845 	call get_token
      008B3A 20 87            [ 1] 1846 	cp a,#TK_INTGR 
      008B3C 26 E9            [ 1] 1847 	jrne invalid 
      008B3C 90 7F 7B         [ 4] 1848 	call puts
      008B3F 02 C7 00         [ 2] 1849 	jp repl 	
      000B2D                       1850 mem_peek:
      008B42 03 5B            [ 1] 1851 	ld a,#SPACE 
      008B44 02 A6 0D         [ 4] 1852 	call skip  	 
      008B47 CD 82 1E 81      [ 2] 1853 	addw y,in.w 
      008B4B AE 17 18         [ 2] 1854 	ldw x,#pad 
      008B4B 52 01 72         [ 4] 1855 	call strcpy
      008B4E 5F 00 14         [ 4] 1856 	call atoi24 	
      008B51 72 5F 00         [ 1] 1857 	ld a, acc24 
      008B54 15 72 5F         [ 1] 1858 	or a,acc16 
      008B57 00 16 0A         [ 1] 1859 	or a,acc8 
      008B59 26 02            [ 1] 1860 	jrne 1$ 
      008B59 A6 0D            [ 2] 1861 	jra peek_byte  
      008B5B CD 82 1E         [ 2] 1862 1$:	ldw x,acc24 
      008B5E A6 3F CD         [ 2] 1863 	ldw farptr,x 
      008B61 82 1E 72         [ 1] 1864 	ld a,acc8 
      008B64 5F 00 01         [ 1] 1865 	ld farptr+2,a 
      000B58                       1866 peek_byte:
      008B67 72 5F 00         [ 4] 1867 	call print_farptr 
      008B6A 02 CD            [ 1] 1868 	ld a,#8 
      008B6C 8A BD            [ 1] 1869 	ld (PSIZE,sp),a 
      008B6E 90               [ 1] 1870 	clrw x 
      008B6F AE 16 C8         [ 4] 1871 1$:	call fetchc  
      008B72 90               [ 2] 1872 	pushw x 
      008B73 F6 27 E3         [ 1] 1873 	ld acc8,a 
      008B76 72               [ 1] 1874 	clrw x 
      008B77 5C 00 02         [ 2] 1875 	ldw acc24,x 
      008B7A CD 8F            [ 1] 1876 	ld a,#16+128
      008B7C 28 A1 51         [ 4] 1877 	call prti24
      008B7F 26               [ 2] 1878 	popw x 
      008B80 17 01            [ 1] 1879 	dec (PSIZE,sp)
      008B81 26 EB            [ 1] 1880 	jrne 1$ 
      008B81 72 5F            [ 1] 1881 	ld a,#8 
      008B83 16 C8 72         [ 1] 1882 	add a,farptr+2 
      008B86 5F 00 03         [ 1] 1883 	ld farptr+2,a
      008B89 72               [ 1] 1884 	clr a 
      008B8A 5F 00 02         [ 1] 1885 	adc a,farptr+1 
      008B8D 5B 01 81         [ 1] 1886 	ld farptr+1,a 
      008B90 4F               [ 1] 1887 	clr a 
      008B90 AE 8C 0E         [ 1] 1888 	adc a,farptr 
      008B93 CD 82 30         [ 1] 1889 	ld farptr,a 
      008B96 20 C1 D9         [ 2] 1890 	jp repl  
                                   1891 
      008B98 6E 6F 74 20 61 20 63  1892 invalid_cmd: .asciz "not a command\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



             6F 6D 6D 61 6E 64 0A
             00
                                   1893 
                                   1894 ;----------------------------
                                   1895 ; display farptr address
                                   1896 ;----------------------------
      000B9D                       1897 print_farptr:
      008B98 A1 50 27         [ 1] 1898 	ld a ,farptr+2 
      008B9B 11 A1 53         [ 1] 1899 	ld acc8,a 
      008B9E 26 F0 13         [ 2] 1900 	ldw x,farptr 
      008BA0 CF 00 08         [ 2] 1901 	ldw acc24,x 
      008BA0 CD               [ 1] 1902 	clrw x 
      008BA1 8D 67            [ 1] 1903 	ld a,#16 
      008BA3 A1 02 26         [ 4] 1904 	call prti24
      008BA6 E9 CD            [ 1] 1905 	ld a,#SPACE 
      008BA8 82 30 CC         [ 4] 1906 	call putc 
      008BAB 8B 59 9E         [ 4] 1907 	call putc 
      008BAD 81               [ 4] 1908 	ret
                                   1909 
                                   1910 ;------------------------------------
                                   1911 ; get byte at address farptr[X]
                                   1912 ; input:
                                   1913 ;	 farptr   address to peek
                                   1914 ;    X		  farptr index 	
                                   1915 ; output:
                                   1916 ;	 A 		  byte from memory  
                                   1917 ;    x		  incremented by 1
                                   1918 ;------------------------------------
      000BB8                       1919 fetchc: ; @C
      008BAD A6 20 CD 8F      [ 5] 1920 	ldf a,([farptr],x)
      008BB1 E0               [ 1] 1921 	incw x
      008BB2 72               [ 4] 1922 	ret
                                   1923 
                                   1924 
                                   1925 ;------------------------------------
                                   1926 ; expect a number from command line 
                                   1927 ; next argument
                                   1928 ;  input:
                                   1929 ;	  none
                                   1930 ;  output:
                                   1931 ;    acc24   int24_t 
                                   1932 ;------------------------------------
      000BBE                       1933 number::
      008BB3 B9 00 01         [ 4] 1934 	call get_token
      008BB6 AE 17 18         [ 4] 1935 	call atoi24
      008BB9 CD               [ 4] 1936 	ret
                                   1937 .endif ; DEBUG 
                                   1938 
                                   1939 ;------------------------------------
                                   1940 ; parse quoted string 
                                   1941 ; input:
                                   1942 ;   Y 	pointer to tib 
                                   1943 ;   X   pointer to pad
                                   1944 ; output:
                                   1945 ;	pad   parsed string
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1946 ;   TOS  char* to pad  
                                   1947 ;------------------------------------
                           000001  1948 	PREV = 1
                           000002  1949 	CURR =2 
                           000002  1950 	VSIZE=2 
      000BC5                       1951 parse_quote: ; { -- addr }
      000BC5                       1952 	_vars VSIZE 
      008BBA 83 10            [ 2]    1     sub sp,#VSIZE 
      008BBC CD               [ 1] 1953 	clr a
      008BBD 8F 34            [ 1] 1954 1$:	ld (PREV,sp),a 
      008BBF C6 00 09 CA      [ 1] 1955 2$:	inc in
      008BC3 00 0A CA         [ 4] 1956 	ld a,([in.w],y)
      008BC6 00 0B            [ 1] 1957 	jreq 6$
      008BC8 26 02            [ 1] 1958 	ld (CURR,sp),a 
      008BCA 20 0C            [ 1] 1959 	ld a,#'\
      008BCC CE 00            [ 1] 1960 	cp a, (PREV,sp)
      008BCE 09 CF            [ 1] 1961 	jrne 3$
      008BD0 00 14            [ 1] 1962 	clr (PREV,sp)
      008BD2 C6 00            [ 1] 1963 	ld a,(CURR,sp)
      008BD4 0B C7            [ 4] 1964 	callr convert_escape
      008BD6 00               [ 1] 1965 	ld (x),a 
      008BD7 16               [ 1] 1966 	incw x 
      008BD8 20 E5            [ 2] 1967 	jra 2$
      000BE5                       1968 3$:
      008BD8 CD 8C            [ 1] 1969 	ld a,(CURR,sp)
      008BDA 1D A6            [ 1] 1970 	cp a,#'\'
      008BDC 08 6B            [ 1] 1971 	jreq 1$
      008BDE 01 5F            [ 1] 1972 	cp a,#'"
      008BE0 CD 8C            [ 1] 1973 	jreq 5$ 
      008BE2 38               [ 1] 1974 	ld (x),a 
      008BE3 89               [ 1] 1975 	incw x 
      008BE4 C7 00            [ 2] 1976 	jra 2$
      008BE6 0B 5F CF 00      [ 1] 1977 5$:	inc in 
      008BEA 09               [ 1] 1978 6$: clr (x)
      008BEB A6 90 CD         [ 2] 1979 	ldw x,#pad 
      000BFB                       1980 	_drop VSIZE
      008BEE 89 87            [ 2]    1     addw sp,#VSIZE 
      008BF0 85 0A            [ 1] 1981 	ld a,#TK_QSTR  
      008BF2 01               [ 4] 1982 	ret 
                                   1983 
                                   1984 ;---------------------------------------
                                   1985 ; called by parse_quote
                                   1986 ; subtitute escaped character 
                                   1987 ; by their ASCII value .
                                   1988 ; input:
                                   1989 ;   A  character following '\'
                                   1990 ; output:
                                   1991 ;   A  substitued char or same if not valid.
                                   1992 ;---------------------------------------
      000C00                       1993 convert_escape:
      008BF3 26 EB            [ 1] 1994 	cp a,#'a'
      008BF5 A6 08            [ 1] 1995 	jrne 1$
      008BF7 CB 00            [ 1] 1996 	ld a,#7
      008BF9 16               [ 4] 1997 	ret 
      008BFA C7 00            [ 1] 1998 1$: cp a,#'b'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BFC 16 4F            [ 1] 1999 	jrne 2$
      008BFE C9 00            [ 1] 2000 	ld a,#8
      008C00 15               [ 4] 2001 	ret 
      008C01 C7 00            [ 1] 2002 2$: cp a,#'e' 
      008C03 15 4F            [ 1] 2003     jrne 3$
      008C05 C9 00            [ 1] 2004 	ld a,#'\'
      008C07 14               [ 4] 2005 	ret  
      008C08 C7 00            [ 1] 2006 3$: cp a,#'\'
      008C0A 14 CC            [ 1] 2007 	jrne 4$
      008C0C 8B 59            [ 1] 2008 	ld a,#'\'
      008C0E 6E               [ 4] 2009 	ret 
      008C0F 6F 74            [ 1] 2010 4$: cp a,#'f' 
      008C11 20 61            [ 1] 2011 	jrne 5$ 
      008C13 20 63            [ 1] 2012 	ld a,#FF 
      008C15 6F               [ 4] 2013 	ret  
      008C16 6D 6D            [ 1] 2014 5$: cp a,#'n' 
      008C18 61 6E            [ 1] 2015     jrne 6$ 
      008C1A 64 0A            [ 1] 2016 	ld a,#0xa 
      008C1C 00               [ 4] 2017 	ret  
      008C1D A1 72            [ 1] 2018 6$: cp a,#'r' 
      008C1D C6 00            [ 1] 2019 	jrne 7$
      008C1F 16 C7            [ 1] 2020 	ld a,#0xd 
      008C21 00               [ 4] 2021 	ret  
      008C22 0B CE            [ 1] 2022 7$: cp a,#'t' 
      008C24 00 14            [ 1] 2023 	jrne 8$ 
      008C26 CF 00            [ 1] 2024 	ld a,#9 
      008C28 09               [ 4] 2025 	ret  
      008C29 5F A6            [ 1] 2026 8$: cp a,#'v' 
      008C2B 10 CD            [ 1] 2027 	jrne 9$  
      008C2D 89 87            [ 1] 2028 	ld a,#0xb 
      008C2F A6               [ 4] 2029 9$:	ret 
                                   2030 
                                   2031 ;-------------------------
                                   2032 ; integer parser 
                                   2033 ; input:
                                   2034 ;   X 		point to pad 
                                   2035 ;   Y 		point to tib 
                                   2036 ;   A 	    first digit|'$' 
                                   2037 ; output:  
                                   2038 ;   pad     number string 
                                   2039 ;   X 		integer 
                                   2040 ;   A 		TK_INTGR
                                   2041 ;-------------------------
                           000001  2042 	BASE=1
                           000002  2043 	TCHAR=2 
                           000002  2044 	VSIZE=2 
      000C3F                       2045 parse_integer: ; { -- n }
      008C30 20 CD            [ 1] 2046 	push #0 ; TCHAR 
      008C32 82 1E            [ 1] 2047 	cp a,#'$
      008C34 CD 82            [ 1] 2048 	jreq 1$ 
      008C36 1E 81            [ 1] 2049 	push #10 ; BASE=10 
      008C38 20 02            [ 2] 2050 	jra 2$ 
      008C38 92 AF            [ 1] 2051 1$: push #16  ; BASE=16
      008C3A 00               [ 1] 2052 2$:	ld (x),a 
      008C3B 14               [ 1] 2053 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C3C 5C 81 00 01      [ 1] 2054 	inc in 
      008C3E 91 D6 00         [ 4] 2055 	ld a,([in.w],y)
      008C3E CD 8D 67         [ 4] 2056 	call to_upper 
      008C41 CD 8F            [ 1] 2057 	ld (TCHAR,sp),a 
      008C43 34 81 9F         [ 4] 2058 	call is_digit 
      008C45 25 ED            [ 1] 2059 	jrc 2$
      008C45 52 02            [ 1] 2060 	ld a,#16 
      008C47 4F 6B            [ 1] 2061 	cp a,(BASE,sp)
      008C49 01 72            [ 1] 2062 	jrne 3$ 
      008C4B 5C 00            [ 1] 2063 	ld a,(TCHAR,sp)
      008C4D 02 91            [ 1] 2064 	cp a,#'A 
      008C4F D6 01            [ 1] 2065 	jrmi 3$ 
      008C51 27 24            [ 1] 2066 	cp a,#'G 
      008C53 6B 02            [ 1] 2067 	jrmi 2$ 
      008C55 A6               [ 1] 2068 3$:	clr (x)
      008C56 5C 11 01         [ 4] 2069 	call atoi24
      008C59 26 0A 0F         [ 2] 2070 	ldw x,acc16 
      008C5C 01 7B            [ 1] 2071 	ld a,#TK_INTGR
      000C77                       2072 	_drop VSIZE  
      008C5E 02 AD            [ 2]    1     addw sp,#VSIZE 
      008C60 1F               [ 4] 2073 	ret 	
                                   2074 
                                   2075 ;-------------------------
                                   2076 ; binary integer parser 
                                   2077 ; input:
                                   2078 ;   X 		point to pad 
                                   2079 ;   Y 		point to tib 
                                   2080 ;   A 	    '%' 
                                   2081 ; output:  
                                   2082 ;   pad     number string 
                                   2083 ;   X 		integer 
                                   2084 ;   A 		TK_INTGR
                                   2085 ;   TOS     integer 
                                   2086 ;-------------------------
                           000001  2087 	BINARY=1
                           000002  2088 	VSIZE=2
      000C7A                       2089 parse_binary: ; { -- n }
      008C61 F7 5C            [ 1] 2090 	push #0
      008C63 20 E5            [ 1] 2091 	push #0
      008C65 F7               [ 1] 2092 1$: ld (x),a 
      008C65 7B               [ 1] 2093 	incw x 
      008C66 02 A1 5C 27      [ 1] 2094 	inc in 
      008C6A DD A1 22         [ 4] 2095 	ld a,([in.w],y)
      008C6D 27 04            [ 1] 2096 	cp a,#'0 
      008C6F F7 5C            [ 1] 2097 	jreq 2$
      008C71 20 D7            [ 1] 2098 	cp a,#'1 
      008C73 72 5C            [ 1] 2099 	jreq 2$ 
      008C75 00 02            [ 2] 2100 	jra bin_exit 
      008C77 7F AE            [ 1] 2101 2$: sub a,#'0	
      008C79 17               [ 1] 2102 	rrc a 
      008C7A 18 5B            [ 1] 2103 	rlc (BINARY+1,sp)
      008C7C 02 A6            [ 1] 2104 	rlc (BINARY,sp)
      008C7E 08 81            [ 2] 2105 	jra 1$  
      008C80                       2106 bin_exit:
      008C80 A1               [ 1] 2107 	clr (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C81 61 26            [ 2] 2108 	ldw x,(BINARY,sp)
      008C83 03 A6            [ 1] 2109 	ld a,#TK_INTGR 	
      000C9F                       2110 	_drop VSIZE 
      008C85 07 81            [ 2]    1     addw sp,#VSIZE 
      008C87 A1               [ 4] 2111 	ret
                                   2112 
                                   2113 ;---------------------------
                                   2114 ;  token begin with a letter,
                                   2115 ;  is keyword or variable. 	
                                   2116 ; input:
                                   2117 ;   X 		point to pad 
                                   2118 ;   Y 		point to text
                                   2119 ;   A 	    first letter  
                                   2120 ; output:
                                   2121 ;   X		exec_addr|var_addr 
                                   2122 ;   A 		TK_CMD 
                                   2123 ;   pad 	keyword|var_name  
                                   2124 ;   TOS     exec_addr|var_addr 
                                   2125 ;--------------------------  
      000CA2                       2126 parse_keyword: ; { -- exec_addr|var_addr}
      008C88 62 26 03         [ 4] 2127 	call to_upper 
      008C8B A6               [ 1] 2128 	ld (x),a 
      008C8C 08               [ 1] 2129 	incw x 
      008C8D 81 A1 65 26      [ 1] 2130 	inc in 
      008C91 03 A6 5C         [ 4] 2131 	ld a,([in.w],y)
      008C94 81 A1 5C         [ 4] 2132 	call is_alpha 
      008C97 26 03            [ 1] 2133 	jrc parse_keyword 
      008C99 A6               [ 1] 2134 1$: clr (x)
      008C9A 5C 81 A1 66      [ 1] 2135 	tnz pad+1 
      008C9E 26 03            [ 1] 2136 	jrne 2$
                                   2137 ; one letter variable name 
      008CA0 A6 0C 81         [ 1] 2138 	ld a,pad 
      008CA3 A1 6E            [ 1] 2139 	sub a,#'A 
      008CA5 26               [ 1] 2140 	sll a 
      008CA6 03               [ 1] 2141 	push a 
      008CA7 A6 0A            [ 1] 2142 	push #0
      008CA9 81 A1 72         [ 2] 2143 	ldw x,#vars 
      008CAC 26 03 A6         [ 2] 2144 	addw x,(1,sp) ; X=var address 
      000CC9                       2145 	_drop 2 
      008CAF 0D 81            [ 2]    1     addw sp,#2 
      008CB1 A1 74            [ 1] 2146 	ld a,#TK_VAR 
      008CB3 26 03            [ 2] 2147 	jra 4$ 
      000CCF                       2148 2$: ; check for keyword, otherwise syntax error.
      000CCF                       2149 	_ldx_dict kword_dict
      008CB5 A6 09 81         [ 2]    1     ldw x,#kword_dict+2
      008CB8 A1 76 26         [ 4] 2150 	call search_dict
      008CBB 02               [ 1] 2151 	tnz a
      008CBC A6 0B            [ 1] 2152 	jrne 3$ 
      008CBE 81 06 D7         [ 2] 2153 	jp syntax_error
      008CBF A3 16 7E         [ 2] 2154 3$: cpw x,#rem  
      008CBF 4B 00            [ 1] 2155 	jrne 4$
      008CC1 A1 24 27 04 4B   [ 1] 2156 	mov in,count 
      008CC6 0A               [ 1] 2157 	clr a 
      008CC7 20               [ 4] 2158 4$:	ret  	
                                   2159 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



                                   2160 
                                   2161 ;------------------------------------
                                   2162 ; Command line tokenizer
                                   2163 ; scan text for next token
                                   2164 ; move token in 'pad'
                                   2165 ; input: 
      000CE7                       2166 	none: 
                                   2167 ; use:
                                   2168 ;	Y   pointer to text
                                   2169 ;   X	pointer to pad 
                                   2170 ;   in.w   index in text buffer
                                   2171 ; output:
                                   2172 ;   A       token attribute 
                                   2173 ;   pad 	token as .asciz
                                   2174 ;   X 		token value   
                                   2175 ;------------------------------------
                                   2176 	; use to check special character 
                                   2177 	.macro _case c t  
                                   2178 	ld a,#c 
                                   2179 	cp a,(TCHAR,sp) 
                                   2180 	jrne t
                                   2181 	.endm 
                                   2182 
                           000001  2183 	TCHAR=1
                           000002  2184 	ATTRIB=2 
                           000002  2185 	VSIZE=2
      000CE7                       2186 get_token: 
      008CC8 02 4B 10 F7      [ 2] 2187 	ldw y,#tib    	
      008CCC 5C 72 5C         [ 1] 2188 	ld a,in 
      008CCF 00 02 91         [ 1] 2189 	cp a,count 
      008CD2 D6 01            [ 1] 2190 	jrmi 1$
      008CD4 CD 8F            [ 1] 2191 	ld a,#TK_NONE 
      008CD6 28               [ 4] 2192 	ret 
      000CF6                       2193 1$:	
      000CF6                       2194 	_vars VSIZE
      008CD7 6B 02            [ 2]    1     sub sp,#VSIZE 
      008CD9 CD 8F 1F         [ 2] 2195 	ldw x, #pad
      008CDC 25 ED            [ 1] 2196 	ld a,#SPACE
      008CDE A6 10 11         [ 4] 2197 	call skip
      008CE1 01 26 0A         [ 2] 2198 	ldw in.w.saved,x 
      008CE4 7B 02 A1         [ 4] 2199 	ld a,([in.w],y)
      008CE7 41 2B            [ 1] 2200 	jrne str_tst
      008CE9 04 A1 47 2B      [ 1] 2201 	clr pad 
      008CED DD 7F CD         [ 2] 2202 	jp token_exit ; end of line 
                                   2203 
      000D0F                       2204 str_tst: ; check for quoted string  	
      008CF0 8F 34 CE         [ 4] 2205 	call to_upper 
      008CF3 00 0A            [ 1] 2206 	ld (TCHAR,sp),a 
      000D14                       2207 	_case '"' nbr_tst
      008CF5 A6 02            [ 1]    1 	ld a,#'"' 
      008CF7 5B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008CF9 81 06            [ 1]    3 	jrne nbr_tst
      008CFA CD 0B C5         [ 4] 2208 	call parse_quote
      008CFA 4B 00 4B         [ 2] 2209 	jp token_exit
      000D20                       2210 nbr_tst: ; check for number 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008CFD 00 F7            [ 1] 2211 	ld a,#'$'
      008CFF 5C 72            [ 1] 2212 	cp a,(TCHAR,sp) 
      008D01 5C 00            [ 1] 2213 	jreq 1$
      008D03 02 91            [ 1] 2214 	ld a,#'&
      008D05 D6 01            [ 1] 2215 	cp a,(TCHAR,sp)
      008D07 A1 30            [ 1] 2216 	jrne 0$
      008D09 27 06 A1         [ 4] 2217 	call parse_binary ; expect binary integer 
      008D0C 31 27 02         [ 2] 2218 	jp token_exit 
      008D0F 20 09            [ 1] 2219 0$:	ld a,(TCHAR,sp)
      008D11 A0 30 46         [ 4] 2220 	call is_digit
      008D14 09 02            [ 1] 2221 	jrnc 3$
      008D16 09 01 20         [ 4] 2222 1$:	call parse_integer 
      008D19 E4 0E 9C         [ 2] 2223 	jp token_exit 
      008D1A                       2224 3$: 
      000D3F                       2225 	_case '(' bkslsh_tst 
      008D1A 7F 1E            [ 1]    1 	ld a,#'(' 
      008D1C 01 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008D1E 02 5B            [ 1]    3 	jrne bkslsh_tst
      008D20 02 81            [ 1] 2226 	ld a,#TK_LPAREN
      008D22 CC 0E 8C         [ 2] 2227 	jp token_char   	
      000D4A                       2228 bkslsh_tst:
      000D4A                       2229 	_case '\',rparnt_tst
      008D22 CD 8F            [ 1]    1 	ld a,#'\' 
      008D24 28 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008D26 5C 72            [ 1]    3 	jrne rparnt_tst
      008D28 5C 00            [ 1] 2230 	ld a,(TCHAR,sp)
      008D2A 02               [ 1] 2231 	ld (x),a 
      008D2B 91               [ 1] 2232 	incw x 
      008D2C D6 01 CD 85      [ 1] 2233 	inc in 
      008D30 43 25 EF         [ 4] 2234 	ld a,([in.w],y)
      008D33 7F               [ 1] 2235 	ld (x),a 
      008D34 72               [ 1] 2236 	incw x 
      008D35 5D 17 19 26      [ 1] 2237 	inc in  
      008D39 15               [ 1] 2238 	clr (x) 
      008D3A C6               [ 1] 2239 	ld xl,a 
      008D3B 17 18            [ 1] 2240 	ld a,#TK_CHAR 
      008D3D A0 41 48         [ 2] 2241 	jp token_exit 
      000D68                       2242 rparnt_tst:		
      000D68                       2243 	_case ')' colon_tst 
      008D40 88 4B            [ 1]    1 	ld a,#')' 
      008D42 00 AE            [ 1]    2 	cp a,(TCHAR,sp) 
      008D44 00 27            [ 1]    3 	jrne colon_tst
      008D46 72 FB            [ 1] 2244 	ld a,#TK_RPAREN 
      008D48 01 5B 02         [ 2] 2245 	jp token_char 
      000D73                       2246 colon_tst:
      000D73                       2247 	_case ':' comma_tst 
      008D4B A6 03            [ 1]    1 	ld a,#':' 
      008D4D 20 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008D4F 26 05            [ 1]    3 	jrne comma_tst
      008D4F AE A1            [ 1] 2248 	ld a,#TK_COLON 
      008D51 2C CD 91         [ 2] 2249 	jp token_char 
      000D7E                       2250 comma_tst:
      000D7E                       2251 	_case COMMA sharp_tst 
      008D54 C5 4D            [ 1]    1 	ld a,#COMMA 
      008D56 26 03            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D58 CC 87            [ 1]    3 	jrne sharp_tst
      008D5A 57 A3            [ 1] 2252 	ld a,#TK_COMMA
      008D5C 96 FE 26         [ 2] 2253 	jp token_char
      000D89                       2254 sharp_tst:
      000D89                       2255 	_case SHARP dash_tst 
      008D5F 06 55            [ 1]    1 	ld a,#SHARP 
      008D61 00 03            [ 1]    2 	cp a,(TCHAR,sp) 
      008D63 00 02            [ 1]    3 	jrne dash_tst
      008D65 4F 81            [ 1] 2256 	ld a,#TK_SHARP
      008D67 CC 0E 8C         [ 2] 2257 	jp token_char  	 	 
      008D67                       2258 dash_tst: 	
      000D94                       2259 	_case '-' at_tst 
      008D67 90 AE            [ 1]    1 	ld a,#'-' 
      008D69 16 C8            [ 1]    2 	cp a,(TCHAR,sp) 
      008D6B C6 00            [ 1]    3 	jrne at_tst
      008D6D 02 C1            [ 1] 2260 	ld a,#TK_MINUS  
      008D6F 00 03 2B         [ 2] 2261 	jp token_char 
      000D9F                       2262 at_tst:
      000D9F                       2263 	_case '@' qmark_tst 
      008D72 03 A6            [ 1]    1 	ld a,#'@' 
      008D74 00 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008D76 26 05            [ 1]    3 	jrne qmark_tst
      008D76 52 02            [ 1] 2264 	ld a,#TK_ARRAY 
      008D78 AE 17 18         [ 2] 2265 	jp token_char
      000DAA                       2266 qmark_tst:
      000DAA                       2267 	_case '?' tick_tst 
      008D7B A6 20            [ 1]    1 	ld a,#'?' 
      008D7D CD 8F            [ 1]    2 	cp a,(TCHAR,sp) 
      008D7F E0 CF            [ 1]    3 	jrne tick_tst
      008D81 00 12            [ 1] 2268 	ld a,(TCHAR,sp)
      008D83 91               [ 1] 2269 	ld (x),a 
      008D84 D6               [ 1] 2270 	incw x 
      008D85 01               [ 1] 2271 	clr (x)
      008D86 26 07 72 5F      [ 1] 2272 	inc in 
      008D8A 17 18            [ 1] 2273 	ld a,#TK_CMD 
      008D8C CC 8F 1C         [ 2] 2274 	ldw x,#print 
      008D8F CC 0E 9C         [ 2] 2275 	jp token_exit
      000DC1                       2276 tick_tst: ; ignore comment 
      000DC1                       2277 	_case TICK plus_tst 
      008D8F CD 8F            [ 1]    1 	ld a,#TICK 
      008D91 28 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008D93 01 A6            [ 1]    3 	jrne plus_tst
      008D95 22 11            [ 1] 2278 	ld a,(TCHAR,sp)
      008D97 01               [ 1] 2279 	ld (x),a 
      008D98 26               [ 1] 2280 	incw x 
      008D99 06               [ 1] 2281 	clr (x)
      008D9A CD 8C 45 CC 8F   [ 1] 2282 	mov in,count  
      008D9F 1C               [ 1] 2283 	clr a 
      008DA0 CC 0E 9C         [ 2] 2284 	jp token_exit 
      000DD5                       2285 plus_tst:
      000DD5                       2286 	_case '+' star_tst 
      008DA0 A6 24            [ 1]    1 	ld a,#'+' 
      008DA2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA4 27 13            [ 1]    3 	jrne star_tst
      008DA6 A6 26            [ 1] 2287 	ld a,#TK_PLUS  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008DA8 11 01 26         [ 2] 2288 	jp token_char 
      000DE0                       2289 star_tst:
      000DE0                       2290 	_case '*' slash_tst 
      008DAB 06 CD            [ 1]    1 	ld a,#'*' 
      008DAD 8C FA            [ 1]    2 	cp a,(TCHAR,sp) 
      008DAF CC 8F            [ 1]    3 	jrne slash_tst
      008DB1 1C 7B            [ 1] 2291 	ld a,#TK_MULT 
      008DB3 01 CD 8F         [ 2] 2292 	jp token_char 
      000DEB                       2293 slash_tst: 
      000DEB                       2294 	_case '/' prcnt_tst 
      008DB6 1F 24            [ 1]    1 	ld a,#'/' 
      008DB8 06 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008DBA 8C BF            [ 1]    3 	jrne prcnt_tst
      008DBC CC 8F            [ 1] 2295 	ld a,#TK_DIV 
      008DBE 1C 0E 8C         [ 2] 2296 	jp token_char 
      008DBF                       2297 prcnt_tst:
      000DF6                       2298 	_case '%' eql_tst 
      008DBF A6 28            [ 1]    1 	ld a,#'%' 
      008DC1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC3 26 05            [ 1]    3 	jrne eql_tst
      008DC5 A6 09            [ 1] 2299 	ld a,#TK_MOD
      008DC7 CC 8F 0C         [ 2] 2300 	jp token_char  
                                   2301 ; 1 or 2 character tokens 	
      008DCA                       2302 eql_tst:
      000E01                       2303 	_case '=' gt_tst 		
      008DCA A6 5C            [ 1]    1 	ld a,#'=' 
      008DCC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DCE 26 18            [ 1]    3 	jrne gt_tst
      008DD0 7B 01            [ 1] 2304 	ld a,#TK_EQUAL
      008DD2 F7 5C 72         [ 2] 2305 	jp token_char 
      000E0C                       2306 gt_tst:
      000E0C                       2307 	_case '>' lt_tst 
      008DD5 5C 00            [ 1]    1 	ld a,#'>' 
      008DD7 02 91            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD9 D6 01            [ 1]    3 	jrne lt_tst
      008DDB F7 5C            [ 1] 2308 	ld a,#TK_GT 
      008DDD 72 5C            [ 1] 2309 	ld (ATTRIB,sp),a 
      008DDF 00 02 7F 97      [ 1] 2310 	inc in 
      008DE3 A6 05 CC         [ 4] 2311 	ld a,([in.w],y)
      008DE6 8F 1C            [ 1] 2312 	cp a,#'=
      008DE8 26 0C            [ 1] 2313 	jrne 1$
      008DE8 A6 29            [ 1] 2314 	ld a,(TCHAR,sp)
      008DEA 11               [ 1] 2315 	ld (x),a
      008DEB 01               [ 1] 2316 	incw x 
      008DEC 26 05            [ 1] 2317 	ld a,#'=
      008DEE A6 0A            [ 1] 2318 	ld (TCHAR,sp),a 
      008DF0 CC 8F            [ 1] 2319 	ld a,#TK_GE 
      008DF2 0C 5F            [ 2] 2320 	jra token_char  
      008DF3 A1 3C            [ 1] 2321 1$: cp a,#'<
      008DF3 A6 3A            [ 1] 2322 	jrne 2$
      008DF5 11 01            [ 1] 2323 	ld a,(TCHAR,sp)
      008DF7 26               [ 1] 2324 	ld (x),a
      008DF8 05               [ 1] 2325 	incw x 
      008DF9 A6 01            [ 1] 2326 	ld a,#'<	
      008DFB CC 8F            [ 1] 2327 	ld (TCHAR,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DFD 0C 35            [ 1] 2328 	ld a,#TK_NE 
      008DFE 20 4F            [ 2] 2329 	jra token_char 
      008DFE A6 2C 11 01      [ 1] 2330 2$: dec in
      008E02 26 05            [ 1] 2331 	ld a,(ATTRIB,sp)
      008E04 A6 0B            [ 2] 2332 	jra token_char 
      000E45                       2333 lt_tst:
      000E45                       2334 	_case '<' other
      008E06 CC 8F            [ 1]    1 	ld a,#'<' 
      008E08 0C 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E09 26 32            [ 1]    3 	jrne other
      008E09 A6 23            [ 1] 2335 	ld a,#TK_LT 
      008E0B 11 01            [ 1] 2336 	ld (ATTRIB,sp),a 
      008E0D 26 05 A6 0C      [ 1] 2337 	inc in 
      008E11 CC 8F 0C         [ 4] 2338 	ld a,([in.w],y)
      008E14 A1 3D            [ 1] 2339 	cp a,#'=
      008E14 A6 2D            [ 1] 2340 	jrne 1$
      008E16 11 01            [ 1] 2341 	ld a,(TCHAR,sp)
      008E18 26               [ 1] 2342 	ld (x),a 
      008E19 05 A6            [ 1] 2343 	ld a,#'=
      008E1B 11 CC            [ 1] 2344 	ld (TCHAR,sp),a 
      008E1D 8F 0C            [ 1] 2345 	ld a,#TK_LE 
      008E1F 20 27            [ 2] 2346 	jra token_char 
      008E1F A6 40            [ 1] 2347 1$: cp a,#'>
      008E21 11 01            [ 1] 2348 	jrne 2$
      008E23 26 05            [ 1] 2349 	ld a,(TCHAR,sp)
      008E25 A6               [ 1] 2350 	ld (x),a 
      008E26 04               [ 1] 2351 	incw x 
      008E27 CC 8F            [ 1] 2352 	ld a,#'>
      008E29 0C 01            [ 1] 2353 	ld (TCHAR,sp),a 
      008E2A A6 35            [ 1] 2354 	ld a,#TK_NE 
      008E2A A6 3F            [ 2] 2355 	jra token_char 
      008E2C 11 01 26 11      [ 1] 2356 2$: dec in 
      008E30 7B 01            [ 1] 2357 	ld a,(ATTRIB,sp)
      008E32 F7 5C            [ 2] 2358 	jra token_char 	
      000E7D                       2359 other: ; not a special character 	 
      008E34 7F 72            [ 1] 2360 	ld a,(TCHAR,sp)
      008E36 5C 00 02         [ 4] 2361 	call is_alpha 
      008E39 A6 06            [ 1] 2362 	jrc 30$ 
      008E3B AE 95 F0         [ 2] 2363 	jp syntax_error 
      000E87                       2364 30$: 
      008E3E CC 8F 1C         [ 4] 2365 	call parse_keyword
      008E41 20 10            [ 2] 2366 	jra token_exit 
      000E8C                       2367 token_char:
      008E41 A6 27            [ 1] 2368 	ld (ATTRIB,sp),a 
      008E43 11 01            [ 1] 2369 	ld a,(TCHAR,sp)
      008E45 26               [ 1] 2370 	ld (x),a 
      008E46 0E               [ 1] 2371 	incw x 
      008E47 7B               [ 1] 2372 	clr(x)
      008E48 01 F7 5C 7F      [ 1] 2373 	inc in 
      008E4C 55 00            [ 1] 2374 	ld a,(ATTRIB,sp)
      008E4E 03 00 02         [ 2] 2375 	ldw x,#pad 
      000E9C                       2376 token_exit:
      000E9C                       2377 	_drop VSIZE 
      008E51 4F CC            [ 2]    1     addw sp,#VSIZE 
      008E53 8F               [ 4] 2378 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2379 
                                   2380 
                                   2381 
                                   2382 ;------------------------------------
                                   2383 ; check if character in {'0'..'9'}
                                   2384 ; input:
                                   2385 ;    A  character to test
                                   2386 ; output:
                                   2387 ;    Carry  0 not digit | 1 digit
                                   2388 ;------------------------------------
      000E9F                       2389 is_digit:
      008E54 1C 30            [ 1] 2390 	cp a,#'0
      008E55 25 03            [ 1] 2391 	jrc 1$
      008E55 A6 2B            [ 1] 2392     cp a,#'9+1
      008E57 11               [ 1] 2393 	ccf 
      008E58 01               [ 1] 2394 1$:	ccf 
      008E59 26               [ 4] 2395     ret
                                   2396 
                                   2397 ;------------------------------------
                                   2398 ; convert alpha to uppercase
                                   2399 ; input:
                                   2400 ;    a  character to convert
                                   2401 ; output:
                                   2402 ;    a  uppercase character
                                   2403 ;------------------------------------
      000EA8                       2404 to_upper::
      008E5A 05 A6            [ 1] 2405 	cp a,#'a
      008E5C 10 CC            [ 1] 2406 	jrpl 1$
      008E5E 8F               [ 4] 2407 0$:	ret
      008E5F 0C 7A            [ 1] 2408 1$: cp a,#'z	
      008E60 22 FB            [ 1] 2409 	jrugt 0$
      008E60 A6 2A            [ 1] 2410 	sub a,#32
      008E62 11               [ 4] 2411 	ret
                                   2412 	
                                   2413 ;------------------------------------
                                   2414 ; convert pad content in integer
                                   2415 ; input:
                                   2416 ;    pad		.asciz to convert
                                   2417 ; output:
                                   2418 ;    acc24      int24_t
                                   2419 ;------------------------------------
                                   2420 	; local variables
                           000001  2421 	SIGN=1 ; 1 byte, 
                           000002  2422 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2423 	TEMP=3 ; 1 byte, temporary storage
                           000003  2424 	VSIZE=3 ; 3 bytes reserved for local storage
      000EB4                       2425 atoi24:
      008E63 01               [ 2] 2426 	pushw x ;save x
      008E64 26 05            [ 2] 2427 	sub sp,#VSIZE
                                   2428 	; acc24=0 
      008E66 A6 20 CC 8F      [ 1] 2429 	clr acc24    
      008E6A 0C 5F 00 09      [ 1] 2430 	clr acc16
      008E6B 72 5F 00 0A      [ 1] 2431 	clr acc8 
      008E6B A6 2F 11         [ 1] 2432 	ld a, pad 
      008E6E 01 26            [ 1] 2433 	jreq atoi_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008E70 05 A6            [ 1] 2434 	clr (SIGN,sp)
      008E72 21 CC            [ 1] 2435 	ld a,#10
      008E74 8F 0C            [ 1] 2436 	ld (BASE,sp),a ; default base decimal
      008E76 AE 17 18         [ 2] 2437 	ldw x,#pad ; pointer to string to convert
      008E76 A6               [ 1] 2438 	ld a,(x)
      008E77 25 11            [ 1] 2439 	jreq 9$  ; completed if 0
      008E79 01 26            [ 1] 2440 	cp a,#'-
      008E7B 05 A6            [ 1] 2441 	jrne 1$
      008E7D 22 CC            [ 1] 2442 	cpl (SIGN,sp)
      008E7F 8F 0C            [ 2] 2443 	jra 2$
      008E81 A1 24            [ 1] 2444 1$: cp a,#'$
      008E81 A6 3D            [ 1] 2445 	jrne 3$
      008E83 11 01            [ 1] 2446 	ld a,#16
      008E85 26 05            [ 1] 2447 	ld (BASE,sp),a
      008E87 A6               [ 1] 2448 2$:	incw x
      008E88 32               [ 1] 2449 	ld a,(x)
      000EE6                       2450 3$:	
      008E89 CC 8F            [ 1] 2451 	cp a,#'a
      008E8B 0C 02            [ 1] 2452 	jrmi 4$
      008E8C A0 20            [ 1] 2453 	sub a,#32
      008E8C A6 3E            [ 1] 2454 4$:	cp a,#'0
      008E8E 11 01            [ 1] 2455 	jrmi 9$
      008E90 26 33            [ 1] 2456 	sub a,#'0
      008E92 A6 31            [ 1] 2457 	cp a,#10
      008E94 6B 02            [ 1] 2458 	jrmi 5$
      008E96 72 5C            [ 1] 2459 	sub a,#7
      008E98 00 02            [ 1] 2460 	cp a,(BASE,sp)
      008E9A 91 D6            [ 1] 2461 	jrpl 9$
      008E9C 01 A1            [ 1] 2462 5$:	ld (TEMP,sp),a
      008E9E 3D 26            [ 1] 2463 	ld a,(BASE,sp)
      008EA0 0C 7B 01         [ 4] 2464 	call mulu24_8
      008EA3 F7 5C            [ 1] 2465 	ld a,(TEMP,sp)
      008EA5 A6 3D 6B         [ 1] 2466 	add a,acc24+2
      008EA8 01 A6 33         [ 1] 2467 	ld acc24+2,a
      008EAB 20               [ 1] 2468 	clr a
      008EAC 5F A1 3C         [ 1] 2469 	adc a,acc24+1
      008EAF 26 0C 7B         [ 1] 2470 	ld acc24+1,a
      008EB2 01               [ 1] 2471 	clr a
      008EB3 F7 5C A6         [ 1] 2472 	adc a,acc24
      008EB6 3C 6B 01         [ 1] 2473 	ld acc24,a
      008EB9 A6 35            [ 2] 2474 	jra 2$
      008EBB 20 4F            [ 1] 2475 9$:	tnz (SIGN,sp)
      008EBD 72 5A            [ 1] 2476     jreq atoi_exit
      008EBF 00 02 7B         [ 4] 2477     call neg_acc24
      000F22                       2478 atoi_exit: 
      008EC2 02 20            [ 2] 2479 	addw sp,#VSIZE
      008EC4 47               [ 2] 2480 	popw x ; restore x
      008EC5 81               [ 4] 2481 	ret
                                   2482 
                                   2483 ;--------------------------------------
                                   2484 ; unsigned multiply uint24_t by uint8_t
                                   2485 ; use to convert numerical string to uint24_t
                                   2486 ; input:
                                   2487 ;	acc24	uint24_t 
                                   2488 ;   A		uint8_t
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2489 ; output:
                                   2490 ;   acc24   A*acc24
                                   2491 ;-------------------------------------
                                   2492 ; local variables offset  on sp
                           000003  2493 	U8   = 3   ; A pushed on stack
                           000002  2494 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2495 	OVFH = 1  ; multiplication overflow high byte
                           000003  2496 	VSIZE = 3
      000F26                       2497 mulu24_8:
      008EC5 A6               [ 2] 2498 	pushw x    ; save X
                                   2499 	; local variables
      008EC6 3C               [ 1] 2500 	push a     ; U8
      008EC7 11               [ 1] 2501 	clrw x     ; initialize overflow to 0
      008EC8 01               [ 2] 2502 	pushw x    ; multiplication overflow
                                   2503 ; multiply low byte.
      008EC9 26 32 A6         [ 1] 2504 	ld a,acc24+2
      008ECC 34               [ 1] 2505 	ld xl,a
      008ECD 6B 02            [ 1] 2506 	ld a,(U8,sp)
      008ECF 72               [ 4] 2507 	mul x,a
      008ED0 5C               [ 1] 2508 	ld a,xl
      008ED1 00 02 91         [ 1] 2509 	ld acc24+2,a
      008ED4 D6               [ 1] 2510 	ld a, xh
      008ED5 01 A1            [ 1] 2511 	ld (OVFL,sp),a
                                   2512 ; multipy middle byte
      008ED7 3D 26 0B         [ 1] 2513 	ld a,acc24+1
      008EDA 7B               [ 1] 2514 	ld xl,a
      008EDB 01 F7            [ 1] 2515 	ld a, (U8,sp)
      008EDD A6               [ 4] 2516 	mul x,a
                                   2517 ; add overflow to this partial product
      008EDE 3D 6B 01         [ 2] 2518 	addw x,(OVFH,sp)
      008EE1 A6               [ 1] 2519 	ld a,xl
      008EE2 36 20 27         [ 1] 2520 	ld acc24+1,a
      008EE5 A1               [ 1] 2521 	clr a
      008EE6 3E 26            [ 1] 2522 	adc a,#0
      008EE8 0C 7B            [ 1] 2523 	ld (OVFH,sp),a
      008EEA 01               [ 1] 2524 	ld a,xh
      008EEB F7 5C            [ 1] 2525 	ld (OVFL,sp),a
                                   2526 ; multiply most signficant byte	
      008EED A6 3E 6B         [ 1] 2527 	ld a, acc24
      008EF0 01               [ 1] 2528 	ld xl, a
      008EF1 A6 35            [ 1] 2529 	ld a, (U8,sp)
      008EF3 20               [ 4] 2530 	mul x,a
      008EF4 17 72 5A         [ 2] 2531 	addw x, (OVFH,sp)
      008EF7 00               [ 1] 2532 	ld a, xl
      008EF8 02 7B 02         [ 1] 2533 	ld acc24,a
      008EFB 20 0F            [ 2] 2534     addw sp,#VSIZE
      008EFD 85               [ 2] 2535 	popw x
      008EFD 7B               [ 4] 2536 	ret
                                   2537 
                                   2538 ;------------------------------------
                                   2539 ; skip character c in text starting from 'in'
                                   2540 ; input:
                                   2541 ;	 y 		point to text buffer
                                   2542 ;    a 		character to skip
                                   2543 ; output:  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2544 ;	'in' ajusted to new position
                                   2545 ;------------------------------------
                           000001  2546 	C = 1 ; local var
      000F60                       2547 skip:
      008EFE 01               [ 1] 2548 	push a
      008EFF CD 85 43         [ 4] 2549 1$:	ld a,([in.w],y)
      008F02 25 03            [ 1] 2550 	jreq 2$
      008F04 CC 87            [ 1] 2551 	cp a,(C,sp)
      008F06 57 06            [ 1] 2552 	jrne 2$
      008F07 72 5C 00 01      [ 1] 2553 	inc in
      008F07 CD 8D            [ 2] 2554 	jra 1$
      000F70                       2555 2$: _drop 1 
      008F09 22 20            [ 2]    1     addw sp,#1 
      008F0B 10               [ 4] 2556 	ret
                                   2557 	
                                   2558 ;------------------------------
                                   2559 ; restore 'in.w' variable to 
                                   2560 ; its value before last call
                                   2561 ; to get_token.
                                   2562 ;------------------------------
      008F0C                       2563 unget_token:
      008F0C 6B 02 7B         [ 2] 2564 	ldw x,in.w.saved
      008F0F 01 F7 5C         [ 2] 2565 	ldw in.w,x 
      008F12 7F               [ 4] 2566 	ret 
                                   2567 
                                   2568 
                                   2569 ;******************************
                                   2570 ;  data stack manipulation
                                   2571 ;*****************************
                                   2572 ;----------------------	
                                   2573 ; push X on data stack 
                                   2574 ; input:
                                   2575 ;	X 
                                   2576 ; output:
                                   2577 ;	none 
                                   2578 ;----------------------	
      000F7A                       2579 dpush:
      000F7A                       2580     _dp_down
      008F13 72 5C 00 02      [ 1]    1     dec dstkptr+1 
      008F17 7B 02 AE 17      [ 1]    2     dec dstkptr+1
      008F1B 18 CF 00 19      [ 5] 2581     ldw [dstkptr],x  
      008F1C 81               [ 4] 2582 	ret 
                                   2583 
                                   2584 
                                   2585 ;----------------------	
                                   2586 ; pop data stack in X 
                                   2587 ; input:
                                   2588 ;	none
                                   2589 ; output:
                                   2590 ;	X   
                                   2591 ;----------------------	
      000F87                       2592 dpop: 
      008F1C 5B 02 81 19      [ 5] 2593     ldw x, [dstkptr]
      008F1F                       2594 	_dp_up
      008F1F A1 30 25 03      [ 1]    1     inc dstkptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008F23 A1 3A 8C 8C      [ 1]    2     inc dstkptr+1
      008F27 81               [ 4] 2595 	ret 
                                   2596 
                                   2597 ;-----------------------------
                                   2598 ; swap top 2 elements of dstack
                                   2599 ;  {n1 n2 -- n2 n1 }
                                   2600 ;-----------------------------
      008F28                       2601 dswap:
      008F28 A1 61 2A 01      [ 5] 2602 	ldw x,[dstkptr]
      008F2C 81               [ 2] 2603 	pushw x 
      008F2D A1 7A 22         [ 2] 2604 	ldw x,#2 
      008F30 FB A0 20 81      [ 5] 2605 	ldw x,([dstkptr],x) 
      008F34 72 CF 00 19      [ 5] 2606 	ldw [dstkptr],x 
      008F34 89 52 03         [ 2] 2607 	ldw x,#2
      008F37 72 5F            [ 2] 2608 	popw y 
      008F39 00 09 72 5F      [ 5] 2609 	ldw ([dstkptr],x),y 
      008F3D 00               [ 4] 2610 	ret
                                   2611 
                                   2612 ;-----------------------------
                                   2613 ; drop TOS 
                                   2614 ;-----------------------------
      000FAE                       2615 ddrop: ; { n -- }
      000FAE                       2616 	_dp_up 
      008F3E 0A 72 5F 00      [ 1]    1     inc dstkptr+1
      008F42 0B C6 17 18      [ 1]    2     inc dstkptr+1
      008F46 27               [ 4] 2617 	ret
                                   2618 	
                                   2619 ;-----------------------------
                                   2620 ; duplicate TOS 
                                   2621 ;  dstack: { ix...n -- ix...n n }
                                   2622 ;-----------------------------
      000FB7                       2623 ddup:
      008F47 5A 0F 01 A6      [ 5] 2624 	ldw x,[dstkptr]
      000FBB                       2625 	_dp_down
      008F4B 0A 6B 02 AE      [ 1]    1     dec dstkptr+1 
      008F4F 17 18 F6 27      [ 1]    2     dec dstkptr+1
      008F53 47 A1 2D 26      [ 5] 2626     ldw [dstkptr],x  
      008F57 04               [ 4] 2627 	ret 
                                   2628 
                                   2629 
                                   2630 ;----------------------------------
                                   2631 ; pick value n from dstack 
                                   2632 ; put it on TOS
                                   2633 ; dstack: {ix,..,p -- ix,...,np }
                                   2634 ;-----------------------------------
      000FC8                       2635 dpick:
      008F58 03 01 20 08      [ 5] 2636 	ldw x,[dstkptr]
      008F5C A1               [ 2] 2637 	sllw x 
      008F5D 24 26 06 A6      [ 2] 2638 	addw x,dstkptr 
      008F61 10               [ 2] 2639 	ldw x,(x)
      008F62 6B 02 5C F6      [ 5] 2640 	ldw [dstkptr],x 
      008F66 81               [ 4] 2641 	ret
                                   2642 
                                   2643 ;---------------------------
                                   2644 ;  fetch variable in X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2645 ;  dstack:{ addr -- value }
                                   2646 ;---------------------------
      000FD7                       2647 fetch:
      008F66 A1 61 2B 02      [ 5] 2648 	ldw x,[dstkptr]
      008F6A A0               [ 2] 2649 	ldw x,(x)
      008F6B 20 A1 30 2B      [ 5] 2650 	ldw [dstkptr],x
      008F6F 2B               [ 4] 2651 	ret 
                                   2652 
                                   2653 ;----------------------------
                                   2654 ; store variable 
                                   2655 ; dstack: {addr value -- }
                                   2656 ;----------------------------
      000FE1                       2657 store:
      008F70 A0 30 A1         [ 4] 2658 	call dpop 
      008F73 0A 2B            [ 1] 2659 	ldw y,x   ; y=value 
      008F75 06 A0 07         [ 4] 2660 	call dpop 
      008F78 11               [ 2] 2661 	ldw (x),y 
      008F79 02               [ 4] 2662 	ret 
                                   2663 
                                   2664 ;---------------------------------
                                   2665 ; drop n elements from data stack 
                                   2666 ; input: 
                                   2667 ;   X 		n 
                                   2668 ; output:
                                   2669 ;   none 
                                   2670 ;-------------------------------------
      000FEB                       2671 ddrop_n:
      008F7A 2A 1F            [ 2] 2672 	pushw y 
      008F7C 6B 03 7B 02      [ 2] 2673 	ldw y,dstkptr 
      008F80 CD               [ 2] 2674 	sllw x 
      008F81 8F               [ 2] 2675 	pushw x 
      008F82 A6 7B 03         [ 2] 2676 	addw y,(1,sp)
      008F85 CB 00 0B C7      [ 2] 2677 	ldw dstkptr,y 
      008F89 00               [ 2] 2678 	popw x 
      008F8A 0B 4F            [ 2] 2679 	popw y
      008F8C C9               [ 4] 2680 	ret 
                                   2681 
      008F8D 00 0A C7 00 0A 4F C9  2682 dstk_prompt: .asciz "\ndstack: " 
             00 09 C7
                                   2683 ;----------------------------
                                   2684 ; print dstack content 
                                   2685 ;---------------------------
                           000001  2686 	XSAVE=1
                           000002  2687 	VSIZE=2
      001008                       2688 dots:
      001008                       2689 	_vars VSIZE 
      008F97 00 09            [ 2]    1     sub sp,#VSIZE 
      008F99 20 C9 0D         [ 2] 2690 	ldw x,#dstk_prompt 
      008F9C 01 27 03         [ 4] 2691 	call puts
      008F9F CD 8A 9A         [ 2] 2692 	ldw x,#dstack_unf-CELL_SIZE
      008FA2 35 0A 00 07      [ 1] 2693 	mov base,#10 
      008FA2 5B 03 85         [ 2] 2694 1$:	cpw x,dstkptr 
      008FA5 81 0D            [ 1] 2695 	jrult 4$ 
      008FA6 1F 01            [ 2] 2696 	ldw (XSAVE,sp),x
      008FA6 89               [ 2] 2697 	ldw  x,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008FA7 88 5F 89         [ 4] 2698 	call print_int 
      008FAA C6 00            [ 2] 2699 	ldw x,(XSAVE,sp)
      008FAC 0B 97 7B         [ 2] 2700 	subw x,#CELL_SIZE 
      008FAF 03 42            [ 2] 2701 	jra 1$ 
      008FB1 9F C7            [ 1] 2702 4$: ld a,#CR 
      008FB3 00 0B 9E         [ 4] 2703 	call putc 
      00102E                       2704 	_drop VSIZE
      008FB6 6B 02            [ 2]    1     addw sp,#VSIZE 
      008FB8 C6               [ 1] 2705 	clr a 
      008FB9 00               [ 4] 2706 	ret
                                   2707 
      008FBA 0A 97 7B 03 42 72 FB  2708 cstk_prompt: .asciz "\nctack: "
             01 9F
                                   2709 ;--------------------------------
                                   2710 ; print cstack content
                                   2711 ;--------------------------------
                           000001  2712 	XSAVE=1
                           000002  2713 	VSIZE=2 
      00103B                       2714 dotr:
      00103B                       2715 	_vars VSIZE 
      008FC3 C7 00            [ 2]    1     sub sp,#VSIZE 
      008FC5 0A 4F A9         [ 2] 2716 	ldw x,#cstk_prompt
      008FC8 00 6B 01         [ 4] 2717 	call puts 
      008FCB 9E               [ 1] 2718 	ldw x,sp 
      008FCC 6B 02 C6         [ 2] 2719 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008FCF 00 09            [ 2] 2720 	ldw (XSAVE,sp),x  
      008FD1 97 7B 03         [ 2] 2721 	ldw x,#RAM_SIZE-2
      008FD4 42 72 FB 01      [ 1] 2722 	mov base,#16
      001050                       2723 dotr_loop:
      008FD8 9F C7            [ 2] 2724 	cpw x,(XSAVE,sp)
      008FDA 00 09            [ 1] 2725 	jrmi 9$
      008FDC 5B               [ 2] 2726 	pushw x  
      008FDD 03               [ 2] 2727 	ldw x,(x)
      008FDE 85 81 4F         [ 4] 2728 	call print_int 
      008FE0 85               [ 2] 2729 	popw x  
      008FE0 88 91 D6         [ 2] 2730 	subw x,#CELL_SIZE
      008FE3 01 27            [ 2] 2731 	jra dotr_loop 
      008FE5 0A 11            [ 1] 2732 9$:	ld a,#CR 
      008FE7 01 26 06         [ 4] 2733 	call putc 
      001064                       2734 	_drop VSIZE 
      008FEA 72 5C            [ 2]    1     addw sp,#VSIZE 
      008FEC 00               [ 1] 2735 	clr a 
      008FED 02               [ 4] 2736 	ret
                                   2737 
                                   2738 
                                   2739 ;--------------------------------
                                   2740 ;  add 2 integers
                                   2741 ;  input:
                                   2742 ;    N1     on cstack 
                                   2743 ;    N2     on cstack 
                                   2744 ;  output:
                                   2745 ;    X 		n2+n1 
                                   2746 ;--------------------------------
                                   2747 	;arugments on cstack 
      001068                       2748 	_argofs 0 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                           000002     1     ARG_OFS=2+0 
      001068                       2749 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001068                       2750 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001068                       2751 add:
      008FEE 20 F1            [ 2] 2752 	ldw x ,(N2,sp)
      008FF0 5B 01 81         [ 2] 2753 	addw x,(N1,sp)
      008FF3 1F 03            [ 2] 2754 	ldw (N1,sp),x 
      008FF3 CE               [ 4] 2755 	ret 
                                   2756 
                                   2757 ;--------------------------------
                                   2758 ;  substract 2 ntegers
                                   2759 ;  input:
                                   2760 ;    N1     on cstack 
                                   2761 ;    N2     on cstack 
                                   2762 ;  output:
                                   2763 ;    X 		n2+n1 
                                   2764 ;--------------------------------
      001070                       2765 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001070                       2766 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001070                       2767 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001070                       2768 substract:
      008FF4 00 12            [ 2] 2769 	ldw x,(N2,sp)
      008FF6 CF 00 01         [ 2] 2770 	subw x,(N1,sp)
      008FF9 81               [ 4] 2771 	ret 
                                   2772 
                                   2773 ;-------------------------------------
                                   2774 ; multiply 2 integers
                                   2775 ; product overflow is ignored unless
                                   2776 ; MATH_OVF assembler flag is set to 1
                                   2777 ; input:
                                   2778 ;  	N1      on cstack
                                   2779 ;   N2 		on cstack 
                                   2780 ; output:
                                   2781 ;	X        N1*N2 
                                   2782 ;-------------------------------------
                                   2783 	;arguments 
      008FFA                       2784 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      001076                       2785 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      001076                       2786 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      001076                       2787 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      001076                       2788 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2789    ; local variables 
                           000001  2790 	SIGN=1
                           000002  2791 	PROD=2
                           000003  2792 	VSIZE=3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      001076                       2793 multiply:
      001076                       2794 	_vars VSIZE 
      008FFA 72 5A            [ 2]    1     sub sp,#VSIZE 
      008FFC 00 1B            [ 1] 2795 	clr (SIGN,sp)
      008FFE 72 5A            [ 2] 2796 	ldw x,(N1_HB,sp)
      009000 00               [ 1] 2797 	ld a,xh  
      009001 1B 72            [ 1] 2798 	bcp a,#0x80 
      009003 CF 00            [ 1] 2799 	jreq 2$
      009005 1A 81            [ 1] 2800 	cpl (SIGN,sp)
      009007 50               [ 2] 2801 	negw x 
      009007 72 CE            [ 2] 2802 	ldw (N1_HB,sp),x 
      009009 00 1A            [ 2] 2803 2$: ldw x,(N2_HB,sp)
      00900B 72               [ 1] 2804 	ld a,xh  
      00900C 5C 00            [ 1] 2805 	bcp a,#0x80 
      00900E 1B 72            [ 1] 2806 	jreq 3$
      009010 5C 00            [ 1] 2807 	cpl (SIGN,sp)
      009012 1B               [ 2] 2808 	negw x 
      009013 81 08            [ 2] 2809 	ldw (N2_HB,sp),x 
                                   2810 ; N1_LB * N2_LB 	
      009014 7B 07            [ 1] 2811 3$:	ld a,(N1_LB,sp)
      009014 72               [ 1] 2812 	ld xl,a 
      009015 CE 00            [ 1] 2813 	ld a,(N2_LB,sp) 
      009017 1A               [ 4] 2814 	mul x,a 
                           000000  2815 .if MATH_OVF 	
                                   2816 	ld a,xh 
                                   2817 	bcp a,#0x80 
                                   2818 	jreq 4$ 
                                   2819 	ld a,#ERR_MATH_OVF 
                                   2820 	jp tb_error
                                   2821 .endif 	 
      009018 89 AE            [ 2] 2822 4$:	ldw (PROD,sp),x
                                   2823 ; N1_LB * N2_HB	 
      00901A 00 02            [ 1] 2824 	ld a,(N1_LB,sp) 
      00901C 72               [ 1] 2825 	ld xl,a 
      00901D DE 00            [ 1] 2826 	ld a,(N2_HB,sp)
      00901F 1A               [ 4] 2827 	mul x,a
      009020 72               [ 1] 2828 	ld a,xl 
      009021 CF 00            [ 1] 2829 	add a,(PROD,sp)
                           000000  2830 .if MATH_OVF 	
                                   2831 	bcp a,#0x80 
                                   2832 	jreq 5$ 
                                   2833 	ld a,#ERR_MATH_OVF 
                                   2834 	jp tb_error
                                   2835 .endif 	 
      009023 1A AE            [ 1] 2836 5$:	ld (PROD,sp),a 
                                   2837 ; N1_HB * N2_LB 
      009025 00 02            [ 1] 2838 	ld a,(N1_HB,sp)
      009027 90               [ 1] 2839 	ld xl,a 
      009028 85 72            [ 1] 2840 	ld a,(N2_LB,sp)
      00902A DF               [ 4] 2841 	mul x,a 
      00902B 00               [ 1] 2842 	ld a,xl 
      00902C 1A 81            [ 1] 2843 	add a,(PROD,sp)
                           000000  2844 .if MATH_OVF 	
                                   2845 	bcp a,#0x80 
                                   2846 	jreq 6$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2847 	ld a,#ERR_MATH_OVF 
                                   2848 	jp tb_error
                                   2849 .endif 	 
      00902E 6B 02            [ 1] 2850 6$:	ld (PROD,sp),a 
                                   2851 ; N1_HB * N2_HB 	
                                   2852 ; it is pointless to multiply N1_HB*N2_HB 
                                   2853 ; as this product is over 65535 or 0 
                                   2854 ;
                                   2855 ; sign adjust product
      00902E 72 5C            [ 1] 2856 	tnz (SIGN,sp)
      009030 00 1B            [ 1] 2857 	jreq 7$
      009032 72 5C            [ 2] 2858 	ldw x, (PROD,sp)
      009034 00               [ 2] 2859 	negw x
      009035 1B 81            [ 2] 2860 	ldw (PROD,sp),x  
      009037                       2861 7$: 
      009037 72 CE            [ 2] 2862 	ldw x,(PROD,sp) 
      0010BB                       2863 	_drop VSIZE 
      009039 00 1A            [ 2]    1     addw sp,#VSIZE 
      00903B 72               [ 4] 2864 	ret
                                   2865 
                                   2866 ;----------------------------------
                                   2867 ;  euclidian divide n2/n1 
                                   2868 ; input:
                                   2869 ;    N2 	on cstack
                                   2870 ;    N1 	on cstack
                                   2871 ; output:
                                   2872 ;    X      n2/n1 
                                   2873 ;    Y      remainder 
                                   2874 ;----------------------------------
      0010BE                       2875 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      0010BE                       2876 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      0010BE                       2877 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2878 	; local variables
                           000001  2879 	SQUOT=1 ; sign quotient
                           000002  2880 	SDIVD=2 ; sign dividend  
                           000002  2881 	VSIZE=2
      0010BE                       2882 divide:
      0010BE                       2883 	_vars VSIZE 
      00903C 5A 00            [ 2]    1     sub sp,#VSIZE 
      00903E 1B 72            [ 1] 2884 	clr (SQUOT,sp)
      009040 5A 00            [ 1] 2885 	clr (SDIVD,sp)
                                   2886 ; check for 0 divisor
      009042 1B 72            [ 2] 2887 	ldw x,(DIVISR,sp)
      009044 CF               [ 2] 2888 	tnzw x 
      009045 00 1A            [ 1] 2889     jrne 0$
      009047 81 04            [ 1] 2890 	ld a,#ERR_DIV0 
      009048 CC 06 D9         [ 2] 2891 	jp tb_error 
                                   2892 ; check divisor sign 	
      009048 72               [ 1] 2893 0$:	ld a,xh 
      009049 CE 00            [ 1] 2894 	bcp a,#0x80 
      00904B 1A 58            [ 1] 2895 	jreq 1$
      00904D 72 BB            [ 1] 2896 	cpl (SQUOT,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      00904F 00               [ 2] 2897 	negw x 
      009050 1A FE            [ 2] 2898 1$:	ldw (DIVISR,sp),x
                                   2899 ; check dividend sign 	 
      009052 72 CF            [ 2] 2900     ldw x,(DIVIDND,sp)
      009054 00               [ 1] 2901 	ld a,xh 
      009055 1A 81            [ 1] 2902 	bcp a,#0x80 
      009057 27 05            [ 1] 2903 	jreq 2$ 
      009057 72 CE            [ 1] 2904 	cpl (SQUOT,sp)
      009059 00 1A            [ 1] 2905 	cpl (SDIVD,sp)
      00905B FE               [ 2] 2906 	negw x 
      00905C 72 CF            [ 2] 2907 2$:	ldw y,(DIVISR,sp)
      00905E 00               [ 2] 2908 	divw x,y
      00905F 1A 81 00 09      [ 2] 2909 	ldw acc16,y 
                                   2910 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      009061 0D 02            [ 1] 2911 	tnz (SDIVD,sp)
      009061 CD 90            [ 1] 2912 	jreq 7$
      009063 07 90            [ 2] 2913 	tnzw y 
      009065 93 CD            [ 1] 2914 	jreq 7$
      009067 90               [ 1] 2915 	incw x
      009068 07 FF            [ 2] 2916 	ldw y,(DIVISR,sp)
      00906A 81 B2 00 09      [ 2] 2917 	subw y,acc16
      00906B 0D 01            [ 1] 2918 7$: tnz (SQUOT,sp)
      00906B 90 89            [ 1] 2919 	jreq 9$ 	 
      00906D 90               [ 2] 2920 8$:	negw x 
      0010FF                       2921 9$: 
      0010FF                       2922 	_drop VSIZE 
      00906E CE 00            [ 2]    1     addw sp,#VSIZE 
      009070 1A               [ 4] 2923 	ret 
                                   2924 
                                   2925 
                                   2926 ;----------------------------------
                                   2927 ;  remainder resulting from euclidian 
                                   2928 ;  division of n2/n1 
                                   2929 ; input:
                                   2930 ;   N1 		cstack 
                                   2931 ;   N2      cstack
                                   2932 ; output:
                                   2933 ;   X       N2%N1 
                                   2934 ;----------------------------------
                           000003  2935 	N1=3
                           000005  2936 	N2=5
                           000004  2937 	VSIZE=4
      001102                       2938 modulo:
      009071 58 89            [ 2] 2939 	Ldw x,(N1,sp)
      009073 72 F9            [ 2] 2940 	ldw y,(N2,sp)
      001106                       2941 	_vars VSIZE 
      009075 01 90            [ 2]    1     sub sp,#VSIZE 
      009077 CF 00            [ 2] 2942 	ldw (1,sp),x 
      009079 1A 85            [ 2] 2943 	ldw (3,sp),y 
      00907B 90 85 81         [ 4] 2944 	call divide 
      00907E 0A               [ 1] 2945 	ldw x,y
      001110                       2946 	_drop VSIZE 
      00907F 64 73            [ 2]    1     addw sp,#VSIZE 
      009081 74               [ 4] 2947 	ret 
                                   2948 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2949 
                                   2950 ;----------------------------------
                                   2951 ; search in kword_dict command name
                                   2952 ;  from its execution address 
                                   2953 ; input:
                                   2954 ;   X       	execution address 
                                   2955 ; output:
                                   2956 ;   X 			cstr*  | 0 
                                   2957 ;--------------------------------
                           000001  2958 	XADR=1 
                           000003  2959 	LINK=3 
                           000004  2960 	VSIZE=4
      001113                       2961 cmd_name:
      001113                       2962 	_vars VSIZE 
      009082 61 63            [ 2]    1     sub sp,#VSIZE 
      009084 6B 3A 20 00      [ 1] 2963 	clr acc16 
      009088 1F 01            [ 2] 2964 	ldw (XADR,sp),x  
      009088 52 02 AE         [ 2] 2965 	ldw x,#kword_dict	
      00908B 90 7E            [ 2] 2966 1$:	ldw (LINK,sp),x
      00908D CD 82            [ 1] 2967 	ld a,(2,x)
      00908F 30 AE            [ 1] 2968 	and a,#15 
      009091 17 7E 35         [ 1] 2969 	ld acc8,a 
      009094 0A 00 08         [ 2] 2970 	addw x,#3
      009097 C3 00 1A 25      [ 2] 2971 	addw x,acc16
      00909B 0D               [ 2] 2972 	ldw x,(x) ; execution address 
      00909C 1F 01            [ 2] 2973 	cpw x,(XADR,sp)
      00909E FE CD            [ 1] 2974 	jreq 2$
      0090A0 89 CF            [ 2] 2975 	ldw x,(LINK,sp)
      0090A2 1E               [ 2] 2976 	ldw x,(x) 
      0090A3 01 1D 00         [ 2] 2977 	subw x,#2  
      0090A6 02 20            [ 1] 2978 	jrne 1$
      0090A8 EE A6            [ 2] 2979 	jra 9$
      0090AA 0D CD            [ 2] 2980 2$: ldw x,(LINK,sp)
      0090AC 82 1E 5B         [ 2] 2981 	addw x,#2 	
      001142                       2982 9$:	_drop VSIZE
      0090AF 02 4F            [ 2]    1     addw sp,#VSIZE 
      0090B1 81               [ 4] 2983 	ret
                                   2984 
                                   2985 
                                   2986 ;---------------------------------
                                   2987 ; input:
                                   2988 ;	X 		dictionary entry point 
                                   2989 ;  pad		.asciz name to search 
                                   2990 ; output:
                                   2991 ;  A 		TK_CMD|TK_FUNC|TK_NONE 
                                   2992 ;  X		execution address | 0 
                                   2993 ;---------------------------------
                           000001  2994 	NLEN=1 ; cmd length 
                           000002  2995 	YSAVE=2
                           000003  2996 	VSIZE=3 
      001145                       2997 search_dict:
      001145                       2998 	_vars VSIZE 
      0090B2 0A 63            [ 2]    1     sub sp,#VSIZE 
      0090B4 74 61            [ 1] 2999 	ldw y,x 
      001149                       3000 search_next:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0090B6 63 6B            [ 1] 3001 	ld a,(y)
      0090B8 3A 20            [ 1] 3002 	and a,#0xf 
      0090BA 00 01            [ 1] 3003 	ld (NLEN,sp),a  
      0090BB AE 17 18         [ 2] 3004 	ldw x,#pad 
      0090BB 52 02            [ 2] 3005 	ldw (YSAVE,sp),y
      0090BD AE 90            [ 1] 3006 	incw y  
      001156                       3007 cp_loop:
      0090BF B2               [ 1] 3008 	ld a,(x)
      0090C0 CD 82            [ 1] 3009 	jreq str_match 
      0090C2 30 96            [ 1] 3010 	tnz (NLEN,sp)
      0090C4 1C 00            [ 1] 3011 	jreq no_match  
      0090C6 07 1F            [ 1] 3012 	cp a,(y)
      0090C8 01 AE            [ 1] 3013 	jrne no_match 
      0090CA 17 FE            [ 1] 3014 	incw y 
      0090CC 35               [ 1] 3015 	incw x
      0090CD 10 00            [ 1] 3016 	dec (NLEN,sp)
      0090CF 08 EE            [ 2] 3017 	jra cp_loop 
      0090D0                       3018 no_match:
      0090D0 13 01            [ 2] 3019 	ldw y,(YSAVE,sp) 
      0090D2 2B 0B 89 FE      [ 2] 3020 	subw y,#2 ; move Y to link field
      0090D6 CD 89            [ 1] 3021 	push #TK_NONE 
      0090D8 CF 85            [ 2] 3022 	ldw y,(y) ; next word link 
      0090DA 1D               [ 1] 3023 	pop a ; TK_NONE 
      0090DB 00 02            [ 1] 3024 	jreq search_exit  ; not found  
                                   3025 ;try next 
      0090DD 20 F1            [ 2] 3026 	jra search_next
      001177                       3027 str_match:
      0090DF A6 0D            [ 2] 3028 	ldw y,(YSAVE,sp)
      0090E1 CD 82            [ 1] 3029 	ld a,(y)
      0090E3 1E 5B            [ 1] 3030 	ld (NLEN,sp),a ; needed to test bit 7 
      0090E5 02 4F            [ 1] 3031 	and a,#0x7f 
                                   3032 ; move y to procedure address field 	
      0090E7 81               [ 1] 3033 	inc a 
      0090E8 C7 00 0A         [ 1] 3034 	ld acc8,a 
      0090E8 1E 05 72 FB      [ 1] 3035 	clr acc16 
      0090EC 03 1F 03 81      [ 2] 3036 	addw y,acc16 
      0090F0 90 FE            [ 2] 3037 	ldw y,(y) ; routine entry point 
      0090F0 1E 05            [ 1] 3038 	ld a,(NLEN,sp)
      0090F2 72 F0            [ 1] 3039 	bcp a,#0x80 
      0090F4 03 81            [ 1] 3040 	jreq 1$
      0090F6 A6 07            [ 1] 3041 	ld a,#TK_FUNC 
      0090F6 52 03            [ 2] 3042 	jra search_exit
      0090F8 0F 01            [ 1] 3043 1$: ld a,#TK_CMD 
      001199                       3044 search_exit: 
      0090FA 1E               [ 1] 3045 	ldw x,y ; x=routine address 
      00119A                       3046 	_drop VSIZE 	 
      0090FB 06 9E            [ 2]    1     addw sp,#VSIZE 
      0090FD A5               [ 4] 3047 	ret 
                                   3048 
                                   3049 ;---------------------
                                   3050 ; check if next token
                                   3051 ;  is of expected type 
                                   3052 ; input:
                                   3053 ;   A 		 expected token attribute
                                   3054 ;  ouput:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3055 ;   none     if fail call tb_error 
                                   3056 ;--------------------
      00119D                       3057 expect:
      0090FE 80               [ 1] 3058 	push a 
      0090FF 27 05 03         [ 4] 3059 	call next_token 
      009102 01 50            [ 1] 3060 	cp a,(1,sp)
      009104 1F 06            [ 1] 3061 	jreq 1$
      009106 1E 08 9E         [ 2] 3062 	jp syntax_error
      009109 A5               [ 1] 3063 1$: pop a 
      00910A 80               [ 4] 3064 	ret 
                                   3065 
                                   3066 
                                   3067 ;-------------------------------
                                   3068 ; parse embedded BASIC routines 
                                   3069 ; arguments list.
                                   3070 ; arg_list::=  rel[','rel]*
                                   3071 ; all arguments are of integer type
                                   3072 ; input:
                                   3073 ;   none
                                   3074 ; output:
                                   3075 ;   A 			number of arguments pushed on dstack  
                                   3076 ;--------------------------------
                           000001  3077 	ARG_CNT=1 
      0011AA                       3078 arg_list:
      00910B 27 05            [ 1] 3079 	push #0  
      00910D 03 01 50         [ 4] 3080 1$: call relation
      009110 1F 08            [ 1] 3081 	cp a,#TK_NONE 
      009112 7B 07            [ 1] 3082 	jreq 5$
      009114 97 7B            [ 1] 3083 	cp a,#TK_INTGR
      009116 09 42            [ 1] 3084 	jrne 4$
      009118 1F 02 7B         [ 4] 3085 3$: call dpush 
      00911B 07 97            [ 1] 3086     inc (ARG_CNT,sp)
      00911D 7B 08 42         [ 4] 3087 	call next_token 
      009120 9F 1B            [ 1] 3088 	cp a,#TK_NONE 
      009122 02 6B            [ 1] 3089 	jreq 5$ 
      009124 02 7B            [ 1] 3090 	cp a,#TK_COMMA 
      009126 06 97            [ 1] 3091 	jrne 4$
      009128 7B 09            [ 2] 3092 	jra 1$ 
      00912A 42 9F 1B         [ 4] 3093 4$:	call unget_token 
      00912D 02               [ 1] 3094 5$:	pop a 
      00912E 6B               [ 4] 3095 	ret 
                                   3096 
                                   3097 
                                   3098 
                                   3099 ;--------------------------------
                                   3100 ;   BASIC commnands 
                                   3101 ;--------------------------------
                                   3102 
                                   3103 ;--------------------------------
                                   3104 ;  arithmetic and relational 
                                   3105 ;  routines
                                   3106 ;  operators precedence
                                   3107 ;  highest to lowest
                                   3108 ;  operators on same row have 
                                   3109 ;  same precedence and are executed
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3110 ;  from left to right.
                                   3111 ;	'*','/','%'
                                   3112 ;   '-','+'
                                   3113 ;   '=','>','<','>=','<=','<>','><'
                                   3114 ;   '<>' and '><' are equivalent for not equal.
                                   3115 ;--------------------------------
                                   3116 
                                   3117 ;---------------------
                                   3118 ; return array element
                                   3119 ; address from @(expr)
                                   3120 ; input:
                                   3121 ;   A 		TK_ARRAY
                                   3122 ; output:
                                   3123 ;   A 		TK_INTGR
                                   3124 ;	X 		element address 
                                   3125 ;----------------------
      0011CE                       3126 get_array_element:
      00912F 02 0D 01         [ 4] 3127 	call ddrop 
      009132 27 05            [ 1] 3128 	ld a,#TK_LPAREN 
      009134 1E 02 50         [ 4] 3129 	call expect
      009137 1F 02 E8         [ 4] 3130 	call relation 
      009139 A1 02            [ 1] 3131 	cp a,#TK_INTGR 
      009139 1E 02            [ 1] 3132 	jreq 1$
      00913B 5B 03 81         [ 2] 3133 	jp syntax_error
      00913E 89               [ 2] 3134 1$: pushw x 
      00913E 52 02            [ 1] 3135 	ld a,#TK_RPAREN 
      009140 0F 01 0F         [ 4] 3136 	call expect
                                   3137 	; check for bounds 
      009143 02               [ 2] 3138 	popw x   
      009144 1E 05 5D         [ 2] 3139 	cpw x,array_size 
      009147 26 05            [ 2] 3140 	jrule 3$
                                   3141 ; bounds {1..array_size}	
      009149 A6 04            [ 1] 3142 2$: ld a,#ERR_BAD_VALUE 
      00914B CC 87 59         [ 2] 3143 	jp tb_error 
      00914E 9E               [ 2] 3144 3$: tnzw  x
      00914F A5 80            [ 1] 3145 	jreq 2$ 
      009151 27               [ 2] 3146 	sllw x 
      009152 03               [ 2] 3147 	pushw x 
      009153 03 01 50         [ 2] 3148 	ldw x,array_addr  
      009156 1F 05 1E         [ 2] 3149 	subw x,(1,sp)
      0011FC                       3150 	_drop 2   
      009159 07 9E            [ 2]    1     addw sp,#2 
      00915B A5 80            [ 1] 3151 	ld a,#TK_INTGR
      00915D 27               [ 4] 3152 	ret 
                                   3153 
                                   3154 ;***********************************
                                   3155 ;   expression parse,execute 
                                   3156 ;***********************************
                                   3157 ;-----------------------------------
                                   3158 ; factor ::= ['+'|'-'|e] var | @ |
                                   3159 ;			 integer | function |
                                   3160 ;			 '('relation')' 
                                   3161 ; output:
                                   3162 ;   A    token attribute 
                                   3163 ;   X 	 integer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3164 ; ---------------------------------
                           000001  3165 	NEG=1
                           000001  3166 	VSIZE=1
      001201                       3167 factor:
      001201                       3168 	_vars VSIZE 
      00915E 05 03            [ 2]    1     sub sp,#VSIZE 
      009160 01 03 02         [ 4] 3169 	call next_token
      009163 50 16            [ 1] 3170 	cp a,#CMD_END 
      009165 05 65            [ 1] 3171 	jrmi 20$
      009167 90 CF            [ 1] 3172 1$:	ld (NEG,sp),a 
      009169 00 0A            [ 1] 3173 	and a,#TK_GRP_MASK
      00916B 0D 02            [ 1] 3174 	cp a,#TK_GRP_ADD 
      00916D 27 0B            [ 1] 3175 	jreq 2$
      00916F 90 5D            [ 1] 3176 	ld a,(NEG,sp)
      009171 27 07            [ 2] 3177 	jra 4$  
      001216                       3178 2$:	
      009173 5C 16 05         [ 4] 3179 	call next_token 
      001219                       3180 4$:	
      009176 72 B2            [ 1] 3181 	cp a,#TK_FUNC 
      009178 00 0A            [ 1] 3182 	jrne 5$ 
      00917A 0D               [ 4] 3183 	call (x) 
      00917B 01 27            [ 2] 3184 	jra 18$ 
      001220                       3185 5$:
      00917D 01 50            [ 1] 3186 	cp a,#TK_INTGR
      00917F 26 02            [ 1] 3187 	jrne 6$
      00917F 5B 02            [ 2] 3188 	jra 18$
      001226                       3189 6$:
      009181 81 04            [ 1] 3190 	cp a,#TK_ARRAY
      009182 26 06            [ 1] 3191 	jrne 10$
      009182 1E 03 16         [ 4] 3192 	call get_array_element
      009185 05               [ 2] 3193 	ldw x,(x)
      009186 52 04            [ 2] 3194 	jra 18$ 
      001230                       3195 10$:
      009188 1F 01            [ 1] 3196 	cp a,#TK_VAR 
      00918A 17 03            [ 1] 3197 	jrne 12$
      00918C CD               [ 2] 3198 	ldw x,(x)
      00918D 91 3E            [ 2] 3199 	jra 18$
      001237                       3200 12$:			
      00918F 93 5B            [ 1] 3201 	cp a,#TK_LPAREN
      009191 04 81            [ 1] 3202 	jrne 16$
      009193 CD 12 E8         [ 4] 3203 	call relation
      009193 52 04            [ 1] 3204 	ld a,#TK_RPAREN 
      009195 72 5F 00         [ 4] 3205 	call expect
      009198 0A 1F            [ 2] 3206 	jra 18$	
      001245                       3207 16$:
      00919A 01 AE A1         [ 4] 3208 	call unget_token
      00919D 2A               [ 1] 3209 	clr a 
      00919E 1F 03            [ 2] 3210 	jra 20$ 
      00124B                       3211 18$: 
      0091A0 E6 02            [ 1] 3212 	ld a,#TK_MINUS 
      0091A2 A4 0F            [ 1] 3213 	cp a,(NEG,sp)
      0091A4 C7 00            [ 1] 3214 	jrne 19$
      0091A6 0B               [ 2] 3215 	negw x
      001252                       3216 19$:
      0091A7 1C 00            [ 1] 3217 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      001254                       3218 20$:
      001254                       3219 	_drop VSIZE
      0091A9 03 72            [ 2]    1     addw sp,#VSIZE 
      0091AB BB               [ 4] 3220 	ret
                                   3221 
                                   3222 ;-----------------------------------
                                   3223 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3224 ; output:
                                   3225 ;   A    	token attribute 
                                   3226 ;	X		integer
                                   3227 ;-----------------------------------
                           000001  3228 	N1=1
                           000003  3229 	N2=3
                           000005  3230 	MULOP=5
                           000005  3231 	VSIZE=5
      001257                       3232 term:
      001257                       3233 	_vars VSIZE
      0091AC 00 0A            [ 2]    1     sub sp,#VSIZE 
      0091AE FE 13 01         [ 4] 3234 	call factor
      0091B1 27 0A            [ 1] 3235 	cp a,#CMD_END
      0091B3 1E 03            [ 1] 3236 	jrmi term_exit
      001260                       3237 term01:	 ; check for  operator 
      0091B5 FE 1D            [ 2] 3238 	ldw (N2,sp),x  ; save first factor 
      0091B7 00 02 26         [ 4] 3239 	call next_token
      0091BA E3 20            [ 1] 3240 	cp a,#2
      0091BC 05 1E            [ 1] 3241 	jrmi 9$
      0091BE 03 1C            [ 1] 3242 0$:	ld (MULOP,sp),a
      0091C0 00 02            [ 1] 3243 	and a,#TK_GRP_MASK
      0091C2 5B 04            [ 1] 3244 	cp a,#TK_GRP_MULT
      0091C4 81 07            [ 1] 3245 	jreq 1$
      0091C5 7B 05            [ 1] 3246 	ld a,(MULOP,sp) 
      0091C5 52 03 90         [ 4] 3247 	call unget_token 
      0091C8 93 25            [ 2] 3248 	jra 9$
      0091C9                       3249 1$:	; got *|/|%
      0091C9 90 F6 A4         [ 4] 3250 	call factor
      0091CC 0F 6B            [ 1] 3251 	cp a,#TK_INTGR
      0091CE 01 AE            [ 1] 3252 	jreq 2$ 
      0091D0 17 18 17         [ 2] 3253 	jp syntax_error
      0091D3 02 90            [ 2] 3254 2$:	ldw (N1,sp),x  
      0091D5 5C 05            [ 1] 3255 	ld a,(MULOP,sp) 
      0091D6 A1 20            [ 1] 3256 	cp a,#TK_MULT 
      0091D6 F6 27            [ 1] 3257 	jrne 3$
      0091D8 1E 0D 01         [ 4] 3258 	call multiply 
      0091DB 27 0B            [ 2] 3259 	jra term01
      0091DD 90 F1            [ 1] 3260 3$: cp a,#TK_DIV 
      0091DF 26 07            [ 1] 3261 	jrne 4$ 
      0091E1 90 5C 5C         [ 4] 3262 	call divide 
      0091E4 0A 01            [ 2] 3263 	jra term01 
      0091E6 20 EE 02         [ 4] 3264 4$: call modulo
      0091E8 20 C3            [ 2] 3265 	jra term01 
      0091E8 16 02            [ 2] 3266 9$: ldw x,(N2,sp)  
      0091EA 72 A2            [ 1] 3267 	ld a,#TK_INTGR 	
      0012A1                       3268 term_exit:
      0012A1                       3269 	_drop VSIZE 
      0091EC 00 02            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0091EE 4B               [ 4] 3270 	ret 
                                   3271 
                                   3272 ;-------------------------------
                                   3273 ;  expr ::= term [['+'|'-'] term]*
                                   3274 ;  result range {-32768..32767}
                                   3275 ;  output:
                                   3276 ;   A    token attribute 
                                   3277 ;   X	 integer   
                                   3278 ;-------------------------------
                           000001  3279 	N1=1 
                           000003  3280 	N2=3
                           000005  3281 	OP=5 
                           000005  3282 	VSIZE=5 
      0012A4                       3283 expression:
      0012A4                       3284 	_vars VSIZE 
      0091EF 00 90            [ 2]    1     sub sp,#VSIZE 
      0091F1 FE 84 27         [ 4] 3285 	call term
      0091F4 24 20            [ 1] 3286 	cp a,#CMD_END 
      0091F6 D2 38            [ 1] 3287 	jrmi expr_exit 
      0091F7 1F 03            [ 2] 3288 0$:	ldw (N2,sp),x 
      0091F7 16 02 90         [ 4] 3289 	call next_token
      0091FA F6 6B            [ 1] 3290 	cp a,#2
      0091FC 01 A4            [ 1] 3291 	jrmi 9$ 
      0091FE 7F 4C            [ 1] 3292 1$:	ld (OP,sp),a  
      009200 C7 00            [ 1] 3293 	and a,#TK_GRP_MASK
      009202 0B 72            [ 1] 3294 	cp a,#TK_GRP_ADD 
      009204 5F 00            [ 1] 3295 	jreq 2$ 
      009206 0A 72            [ 1] 3296 	ld a,(OP,sp)
      009208 B9 00 0A         [ 4] 3297 	call unget_token
      00920B 90 FE            [ 2] 3298 	jra 9$
      0012C5                       3299 2$: 
      00920D 7B 01 A5         [ 4] 3300 	call term
      009210 80 27            [ 1] 3301 	cp a,#TK_INTGR 
      009212 04 A6            [ 1] 3302 	jreq 3$
      009214 07 20 02         [ 2] 3303 	jp syntax_error
      009217 A6 06            [ 2] 3304 3$:	ldw (N1,sp),x 
      009219 7B 05            [ 1] 3305 	ld a,(OP,sp)
      009219 93 5B            [ 1] 3306 	cp a,#TK_PLUS 
      00921B 03 81            [ 1] 3307 	jrne 4$
      00921D CD 10 68         [ 4] 3308 	call add 
      00921D 88 CD            [ 2] 3309 	jra 0$ 
      00921F 88 3D 11         [ 4] 3310 4$:	call substract
      009222 01 27            [ 2] 3311 	jra 0$
      009224 03 CC            [ 2] 3312 9$: ldw x,(N2,sp)
      009226 87 57            [ 1] 3313 	ld a,#TK_INTGR	
      0012E5                       3314 expr_exit:
      0012E5                       3315 	_drop VSIZE 
      009228 84 81            [ 2]    1     addw sp,#VSIZE 
      00922A 81               [ 4] 3316 	ret 
                                   3317 
                                   3318 ;---------------------------------------------
                                   3319 ; rel ::= expr rel_op expr
                                   3320 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3321 ;  relation return 1 | 0  for true | false 
                                   3322 ;  output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3323 ;    A 		token attribute  
                                   3324 ;	 X		1|0
                                   3325 ;---------------------------------------------
                           000001  3326 	N1=1
                           000003  3327 	N2=3
                           000005  3328 	RELOP=5
                           000005  3329 	VSIZE=5 
      0012E8                       3330 relation: 
      0012E8                       3331 	_vars VSIZE
      00922A 4B 00            [ 2]    1     sub sp,#VSIZE 
      00922C CD 93 68         [ 4] 3332 	call expression
      00922F A1 00            [ 1] 3333 	cp a,#CMD_END  
      009231 27 19            [ 1] 3334 	jrmi rel_exit 
                                   3335 	; expect rel_op or leave 
      009233 A1 02            [ 2] 3336 	ldw (N2,sp),x 
      009235 26 12 CD         [ 4] 3337 	call next_token 
      009238 8F FA            [ 1] 3338 	cp a,#2
      00923A 0C 01            [ 1] 3339 	jrmi 9$
      0012FA                       3340 1$:	
      00923C CD 88            [ 1] 3341 	ld (RELOP,sp),a 
      00923E 3D A1            [ 1] 3342 	and a,#TK_GRP_MASK
      009240 00 27            [ 1] 3343 	cp a,#TK_GRP_RELOP 
      009242 09 A1            [ 1] 3344 	jreq 2$
      009244 0B 26            [ 1] 3345 	ld a,(RELOP,sp)
      009246 02 20 E3         [ 4] 3346 	call unget_token  
      009249 CD 8F            [ 2] 3347 	jra 9$
      001309                       3348 2$:	; expect another expression or error 
      00924B F3 84 81         [ 4] 3349 	call expression
      00924E A1 02            [ 1] 3350 	cp a,#TK_INTGR 
      00924E CD 90            [ 1] 3351 	jreq 3$
      009250 2E A6 09         [ 2] 3352 	jp syntax_error 
      009253 CD 92            [ 2] 3353 3$:	ldw (N1,sp),x 
      009255 1D CD 93         [ 4] 3354 	call substract
      009258 68 A1            [ 1] 3355 	jrne 4$
      00925A 02 27 03 CC      [ 1] 3356 	mov acc8,#2 ; n1==n2
      00925E 87 57            [ 2] 3357 	jra 6$ 
      001320                       3358 4$: 
      009260 89 A6            [ 1] 3359 	jrsgt 5$  
      009262 0A CD 92 1D      [ 1] 3360 	mov acc8,#4 ; n1<2 
      009266 85 C3            [ 2] 3361 	jra 6$
      001328                       3362 5$:
      009268 00 23 23 05      [ 1] 3363 	mov acc8,#1 ; n1>n2 
      00132C                       3364 6$:
      00926C A6               [ 1] 3365 	clrw x 
      00926D 0A CC 87         [ 1] 3366 	ld a, acc8  
      009270 59 5D            [ 1] 3367 	and a,(RELOP,sp)
      009272 27               [ 1] 3368 	tnz a 
      009273 F8 58            [ 1] 3369 	jreq 10$
      009275 89               [ 1] 3370 	incw x 
      001336                       3371 7$:	 
      009276 CE 00            [ 2] 3372 	jra 10$  	
      009278 21 72            [ 2] 3373 9$: ldw x,(N2,sp)
      00133A                       3374 10$:
      00927A F0 01            [ 1] 3375 	ld a,#TK_INTGR
      00133C                       3376 rel_exit: 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00133C                       3377 	_drop VSIZE
      00927C 5B 02            [ 2]    1     addw sp,#VSIZE 
      00927E A6               [ 4] 3378 	ret 
                                   3379 
                                   3380 ;--------------------------------
                                   3381 ; BASIC: SHOW 
                                   3382 ;  show content of dstack,cstack
                                   3383 ;--------------------------------
      00133F                       3384 show:
      00927F 02 81 07         [ 1] 3385 	ld a,base 
      009281 88               [ 1] 3386 	push a 
      009281 52 01 CD         [ 4] 3387 	call dots
      009284 88 3D A1         [ 4] 3388 	call dotr 
      009287 02               [ 1] 3389 	pop a 
      009288 2B 4A 6B         [ 1] 3390 	ld base,a 
      00928B 01               [ 1] 3391 	clr a 
      00928C A4               [ 4] 3392 	ret
                                   3393 
                                   3394 ;--------------------------------------------
                                   3395 ; BASIC: HEX 
                                   3396 ; select hexadecimal base for integer print
                                   3397 ;---------------------------------------------
      00134F                       3398 hex_base:
      00928D 30 A1 10 27      [ 1] 3399 	mov base,#16 
      009291 04               [ 4] 3400 	ret 
                                   3401 
                                   3402 ;--------------------------------------------
                                   3403 ; BASIC: DEC 
                                   3404 ; select decimal base for integer print
                                   3405 ;---------------------------------------------
      001354                       3406 dec_base:
      009292 7B 01 20 03      [ 1] 3407 	mov base,#10
      009296 81               [ 4] 3408 	ret 
                                   3409 
                                   3410 ;------------------------
                                   3411 ; BASIC: SIZE 
                                   3412 ; return free size in text area
                                   3413 ; output:
                                   3414 ;   A 		TK_INTGR
                                   3415 ;   X 	    size integer
                                   3416 ;--------------------------
      001359                       3417 size:
      009296 CD 88 3D         [ 2] 3418 	ldw x,#tib 
      009299 72 B0 00 1D      [ 2] 3419 	subw x,txtend 
      009299 A1 07            [ 1] 3420 	ld a,#TK_INTGR
      00929B 26               [ 4] 3421 	ret 
                                   3422 
                                   3423 
                                   3424 ;------------------------
                                   3425 ; BASIC: UBOUND  
                                   3426 ; return array variable size 
                                   3427 ; output:
                                   3428 ;   A 		TK_INTGR
                                   3429 ;   X 	    array size 
                                   3430 ;--------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      001363                       3431 ubound:
      00929C 03 FD 20         [ 2] 3432 	ldw x,#tib
      00929F 2B B0 00 1D      [ 2] 3433 	subw x,txtend 
      0092A0 54               [ 2] 3434 	srlw x 
      0092A0 A1 02 26         [ 2] 3435 	ldw array_size,x
      0092A3 02 20            [ 1] 3436 	ld a,#TK_INTGR
      0092A5 25               [ 4] 3437 	ret 
                                   3438 
                                   3439 ;-----------------------------
                                   3440 ; BASIC: LET var=expr 
                                   3441 ; variable assignement 
                                   3442 ; output:
                                   3443 ;   A 		TK_NONE 
                                   3444 ;-----------------------------
      0092A6                       3445 let:
      0092A6 A1 04 26         [ 4] 3446 	call next_token 
      0092A9 06 CD            [ 1] 3447 	cp a,#TK_VAR 
      0092AB 92 4E            [ 1] 3448 	jreq let02
      0092AD FE 20 1B         [ 2] 3449 	jp syntax_error
      0092B0                       3450 let02:
      0092B0 A1 03 26         [ 4] 3451 	call dpush 
      0092B3 03 FE 20         [ 4] 3452 	call next_token 
      0092B6 14 32            [ 1] 3453 	cp a,#TK_EQUAL
      0092B7 27 03            [ 1] 3454 	jreq 1$
      0092B7 A1 09 26         [ 2] 3455 	jp syntax_error
      001388                       3456 1$:	
      0092BA 0A CD 93         [ 4] 3457 	call relation   
      0092BD 68 A6            [ 1] 3458 	cp a,#TK_INTGR 
      0092BF 0A CD            [ 1] 3459 	jreq 2$
      0092C1 92 1D 20         [ 2] 3460 	jp syntax_error
      001392                       3461 2$:	
      0092C4 06 93            [ 1] 3462 	ldw y,x 
      0092C5 CD 0F 87         [ 4] 3463 	call dpop  
      0092C5 CD               [ 2] 3464 	ldw (x),y   
      0092C6 8F               [ 4] 3465 	ret 
                                   3466 
                                   3467 ;----------------------------
                                   3468 ; BASIC: LIST [[start][,end]]
                                   3469 ; list program lines 
                                   3470 ; form start to end 
                                   3471 ; if empty argument list then 
                                   3472 ; list all.
                                   3473 ;----------------------------
                           000001  3474 	FIRST=1
                           000003  3475 	LAST=3 
                           000005  3476 	LN_PTR=5
                           000006  3477 	VSIZE=6 
      001399                       3478 list:
      001399                       3479 	_vars VSIZE
      0092C7 F3 4F            [ 2]    1     sub sp,#VSIZE 
      0092C9 20 09 1B         [ 2] 3480 	ldw x,txtbgn 
      0092CB C3 00 1D         [ 2] 3481 	cpw x,txtend 
      0092CB A6 11            [ 1] 3482 	jrmi 1$
      0092CD 11 01 26         [ 2] 3483 	jp list_exit ; nothing to list 
      0092D0 01 50            [ 2] 3484 1$:	ldw (LN_PTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0092D2 FE               [ 2] 3485 	ldw x,(x) 
      0092D2 A6 02            [ 2] 3486 	ldw (FIRST,sp),x ; list from first line 
      0092D4 AE 7F FF         [ 2] 3487 	ldw x,#0x7fff ; biggest line number 
      0092D4 5B 01            [ 2] 3488 	ldw (LAST,sp),x 
      0092D6 81 11 AA         [ 4] 3489 	call arg_list
      0092D7 4D               [ 1] 3490 	tnz a
      0092D7 52 05            [ 1] 3491 	jreq list_start 
      0092D9 CD 92            [ 1] 3492 	cp a,#2 
      0092DB 81 A1            [ 1] 3493 	jreq 4$
      0092DD 02 2B            [ 1] 3494 	cp a,#1 
      0092DF 41 06            [ 1] 3495 	jreq first_line 
      0092E0 CC 06 D7         [ 2] 3496 	jp syntax_error 
      0092E0 1F 03 CD         [ 4] 3497 4$:	call dswap
      0013C4                       3498 first_line:
      0092E3 88 3D A1         [ 4] 3499 	call dpop 
      0092E6 02 2B            [ 2] 3500 	ldw (FIRST,sp),x 
      0092E8 34 6B            [ 1] 3501 	cp a,#1 
      0092EA 05 A4            [ 1] 3502 	jreq lines_skip 	
      0013CD                       3503 last_line:
      0092EC 30 A1 20         [ 4] 3504 	call dpop 
      0092EF 27 07            [ 2] 3505 	ldw (LAST,sp),x 
      0013D2                       3506 lines_skip:
      0092F1 7B 05 CD         [ 2] 3507 	ldw x,txtbgn
      0092F4 8F F3            [ 2] 3508 2$:	ldw (LN_PTR,sp),x 
      0092F6 20 25 1D         [ 2] 3509 	cpw x,txtend 
      0092F8 2A 3D            [ 1] 3510 	jrpl list_exit 
      0092F8 CD               [ 2] 3511 	ldw x,(x) ;lineno 
      0092F9 92 81            [ 2] 3512 	cpw x,(FIRST,sp)
      0092FB A1 02            [ 1] 3513 	jrpl list_start 
      0092FD 27 03            [ 2] 3514 	ldw x,(LN_PTR,sp) 
      0092FF CC 87 57         [ 2] 3515 	addw x,#2 
      009302 1F               [ 1] 3516 	ld a,(x)
      009303 01               [ 1] 3517 	incw x 
      009304 7B 05 A1         [ 1] 3518 	ld acc8,a 
      009307 20 26 05 CD      [ 1] 3519 	clr acc16 
      00930B 90 F6 20 D1      [ 2] 3520 	addw x,acc16
      00930F A1 21            [ 2] 3521 	jra 2$ 
                                   3522 ; print loop
      0013F5                       3523 list_start:
      009311 26 05            [ 2] 3524 	ldw x,(LN_PTR,sp)
      0013F7                       3525 3$:	
      009313 CD 91 3E         [ 4] 3526 	call prt_basic_line
      009316 20 C8            [ 2] 3527 	ldw x,(LN_PTR,sp)
      009318 CD 91            [ 1] 3528 	ld a,(2,x)
      00931A 82 20 C3         [ 1] 3529 	ld acc8,a 
      00931D 1E 03 A6 02      [ 1] 3530 	clr acc16 
      009321 72 BB 00 09      [ 2] 3531 	addw x,acc16
      009321 5B 05 81         [ 2] 3532 	cpw x,txtend 
      009324 2A 0B            [ 1] 3533 	jrpl list_exit
      009324 52 05            [ 2] 3534 	ldw (LN_PTR,sp),x
      009326 CD               [ 2] 3535 	ldw x,(x)
      009327 92 D7            [ 2] 3536 	cpw x,(LAST,sp)  
      009329 A1 02            [ 1] 3537 	jrsgt list_exit 
      00932B 2B 38            [ 2] 3538 	ldw x,(LN_PTR,sp)
      00932D 1F 03            [ 2] 3539 	jra 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      001419                       3540 list_exit:
      001419                       3541 	_drop VSIZE 
      00932F CD 88            [ 2]    1     addw sp,#VSIZE 
      009331 3D               [ 4] 3542 	ret
                                   3543 
                                   3544 ;-------------------------
                                   3545 ; print counted string 
                                   3546 ; input:
                                   3547 ;   X 		address of string
                                   3548 ;--------------------------
      00141C                       3549 prt_cmd_name:
      009332 A1               [ 1] 3550 	ld a,(x)
      009333 02               [ 1] 3551 	incw x
      009334 2B 2B            [ 1] 3552 	and a,#15  
      009336 6B               [ 1] 3553 	push a 
      009337 05 A4            [ 1] 3554 1$: tnz (1,sp) 
      009339 30 A1            [ 1] 3555 	jreq 9$
      00933B 10               [ 1] 3556 	ld a,(x)
      00933C 27 07 7B         [ 4] 3557 	call putc 
      00933F 05               [ 1] 3558 	incw x
      009340 CD 8F            [ 1] 3559 	dec (1,sp)	 
      009342 F3 20            [ 2] 3560 	jra 1$
      009344 1C               [ 1] 3561 9$: pop a 
      009345 81               [ 4] 3562 	ret	
                                   3563 
                                   3564 ;--------------------------
                                   3565 ; decompile line from token list 
                                   3566 ; input:
                                   3567 ;   X 		pointer at line
                                   3568 ; output:
                                   3569 ;   none 
                                   3570 ;--------------------------	
                           000001  3571 	BASE_SAV=1
                           000002  3572 	WIDTH_SAV=2
                           000003  3573 	XSAVE=3
                           000005  3574 	LLEN=5
                           000005  3575 	VSIZE=5 
      001430                       3576 prt_basic_line:
      001430                       3577 	_vars VSIZE 
      009345 CD 92            [ 2]    1     sub sp,#VSIZE 
      009347 D7 A1 02         [ 1] 3578 	ld a,base
      00934A 27 03            [ 1] 3579 	ld (BASE_SAV,sp),a  
      00934C CC 87 57         [ 1] 3580 	ld a,tab_width 
      00934F 1F 01            [ 1] 3581 	ld (WIDTH_SAV,sp),a 
      009351 7B 05 A1         [ 2] 3582 	ldw ptr16,x
      009354 10               [ 2] 3583 	ldw x,(x)
      009355 26 05 CD 90      [ 1] 3584 	mov base,#10
      009359 E8 20 D1 CD      [ 1] 3585 	mov tab_width,#5
      00935D 90 F0 20         [ 4] 3586 	call print_int ; print line number 
      009360 CC 1E            [ 1] 3587 	ld a,#SPACE 
      009362 03 A6 02         [ 4] 3588 	call putc 
      009365 72 5F 00 25      [ 1] 3589 	clr tab_width
      009365 5B 05 81         [ 2] 3590 	ldw x,#2
      009368 72 D6 00 14      [ 4] 3591 	ld a,([ptr16],x)
      009368 52 05            [ 1] 3592 	ld (LLEN,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      00936A CD               [ 1] 3593 	incw x
      00936B 93               [ 1] 3594 1$:	ld a,xl 
      00936C 24 A1            [ 1] 3595 	cp a,(LLEN,sp)
      00936E 02 2B            [ 1] 3596 	jrmi 19$
      009370 4B 1F 03         [ 2] 3597 	jp 90$
      001466                       3598 19$:	 
      009373 CD 88 3D A1      [ 4] 3599 	ld a,([ptr16],x)
      009377 02               [ 1] 3600 	incw x 
      009378 2B 3E            [ 2] 3601 	ldw (XSAVE,sp),x 
      00937A A1 06            [ 1] 3602 	cp a,#TK_CMD 
      00937A 6B 05            [ 1] 3603 	jreq 2$
      00937C A4 30            [ 1] 3604 	cp a,#TK_FUNC 
      00937E A1 30            [ 1] 3605 	jrne 4$
      001475                       3606 2$:	
      009380 27 07 7B 05      [ 5] 3607 	ldw x,([ptr16],x)
      009384 CD 8F F3         [ 4] 3608 	call cmd_name
      009387 20 2F 1C         [ 4] 3609 	call prt_cmd_name
      009389 A6 20            [ 1] 3610 	ld a,#SPACE 
      009389 CD 93 24         [ 4] 3611 	call putc 
      00938C A1 02            [ 2] 3612 	ldw x,(XSAVE,sp)
      00938E 27 03 CC         [ 2] 3613 	addw x,#2
      009391 87 57            [ 2] 3614 	jra 1$
      009393 1F 01            [ 1] 3615 4$: cp a,#TK_QSTR 
      009395 CD 90            [ 1] 3616 	jrne 5$
      009397 F0 26            [ 1] 3617 	ld a,#'" 
      009399 06 35 02         [ 4] 3618 	call putc 
      00939C 00 0B 20 0C      [ 2] 3619 	addw x,ptr16
      0093A0 CD 01 B0         [ 4] 3620 	call puts 
      0093A0 2C 06            [ 1] 3621 	ld a,#'" 
      0093A2 35 04 00         [ 4] 3622 	call putc 
      0093A5 0B               [ 1] 3623 	incw x
      0093A6 20 04 00 14      [ 2] 3624 	subw x,ptr16  
      0093A8 20 B7            [ 2] 3625 	jra 1$
      0093A8 35 01            [ 1] 3626 5$:	cp a,#TK_VAR
      0093AA 00 0B            [ 1] 3627 	jrne 6$ 
      0093AC 72 DE 00 14      [ 5] 3628 	ldw x,([ptr16],x)
      0093AC 5F C6 00         [ 2] 3629 	subw x,#vars 
      0093AF 0B               [ 1] 3630 	ld a,xl
      0093B0 14               [ 1] 3631 	srl a 
      0093B1 05 4D            [ 1] 3632 	add a,#'A 
      0093B3 27 05 5C         [ 4] 3633 	call putc 
      0093B6 1E 03            [ 2] 3634 	ldw x,(XSAVE,sp)
      0093B6 20 02 1E         [ 2] 3635 	addw x,#2 
      0093B9 03 9E            [ 2] 3636 	jra 1$ 
      0093BA A1 04            [ 1] 3637 6$: cp a,#TK_ARRAY 
      0093BA A6 02            [ 1] 3638 	jrne 7$
      0093BC A6 40            [ 1] 3639 	ld a,#'@ 
      0093BC 5B 05 81         [ 4] 3640 	call putc 
      0093BF 1E 03            [ 2] 3641 	ldw x,(XSAVE,sp)
      0093BF C6 00            [ 2] 3642 	jra 1$ 
      0093C1 08 88            [ 1] 3643 7$: cp a,#TK_INTGR 
      0093C3 CD 90            [ 1] 3644 	jrne 8$
      0093C5 88 CD 90 BB      [ 5] 3645 	ldw x,([ptr16],x)
      0093C9 84 C7 00         [ 4] 3646 	call print_int
      0093CC 08 4F            [ 2] 3647 	ldw x,(XSAVE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0093CE 81 00 02         [ 2] 3648 	addw x,#2 
      0093CF CC 14 5E         [ 2] 3649 	jp 1$
      0093CF 35 10            [ 1] 3650 8$: cp a,#TK_GT 
      0093D1 00 08            [ 1] 3651 	jrmi 9$
      0093D3 81 35            [ 1] 3652 	cp a,#TK_NE 
      0093D4 22 16            [ 1] 3653 	jrugt 9$
      0093D4 35 0A            [ 1] 3654 	sub a,#TK_GT  
      0093D6 00               [ 1] 3655 	sll a 
      0093D7 08 81            [ 1] 3656 	clrw y 
      0093D9 90 97            [ 1] 3657 	ld yl,a 
      0093D9 AE 16 C8 72      [ 2] 3658 	addw y,#relop_str 
      0093DD B0 00            [ 2] 3659 	ldw y,(y)
      0093DF 1E               [ 1] 3660 	ldw x,y 
      0093E0 A6 02 81         [ 4] 3661 	call puts 
      0093E3 1E 03            [ 2] 3662 	ldw x,(XSAVE,sp)
      0093E3 AE 16 C8         [ 2] 3663 	jp 1$
      0093E6 72 B0            [ 1] 3664 9$: cp a,#TK_PLUS 
      0093E8 00 1E            [ 1] 3665 	jrne 10$
      0093EA 54 CF            [ 1] 3666 	ld a,#'+
      0093EC 00 23            [ 2] 3667 	jra 80$ 
      0093EE A6 02            [ 1] 3668 10$: cp a,#TK_MINUS
      0093F0 81 04            [ 1] 3669 	jrne 11$
      0093F1 A6 2D            [ 1] 3670 	ld a,#'-
      0093F1 CD 88            [ 2] 3671 	jra 80$
      0093F3 3D A1            [ 1] 3672 11$: cp a,#TK_MULT 
      0093F5 03 27            [ 1] 3673 	jrmi 12$
      0093F7 03 CC            [ 1] 3674 	cp a,#TK_MOD 
      0093F9 87 57            [ 1] 3675 	jrugt 12$
      0093FB A0 20            [ 1] 3676 	sub a,#0x20
      0093FB CD               [ 1] 3677 	clrw x 
      0093FC 8F               [ 1] 3678 	ld xl,a 
      0093FD FA CD 88         [ 2] 3679 	addw x,#mul_char 
      009400 3D               [ 1] 3680 	ld a,(x)
      009401 A1 32            [ 2] 3681 	jra 80$ 
      009403 27 03            [ 1] 3682 12$: cp a,#TK_LPAREN 
      009405 CC 87            [ 1] 3683 	jrmi 13$
      009407 57 0C            [ 1] 3684 	cp a,#TK_SHARP 
      009408 22 0A            [ 1] 3685 	jrugt 13$
      009408 CD 93            [ 1] 3686 	sub a,#TK_LPAREN
      00940A 68               [ 1] 3687 	clrw x 
      00940B A1               [ 1] 3688 	ld xl,a 
      00940C 02 27 03         [ 2] 3689 	addw x,#single_char 
      00940F CC               [ 1] 3690 	ld a,(x)
      009410 87 57            [ 2] 3691 	jra 80$
      009412 A6 3A            [ 1] 3692 13$: ld a,#':
      009412 90 93 CD         [ 4] 3693 80$: call putc 
      009415 90 07            [ 2] 3694 	ldw x,(XSAVE,sp)
      009417 FF 81 5E         [ 2] 3695 	jp 1$ 
      009419                       3696 90$: 
      009419 52 06            [ 1] 3697 	ld a,#CR 
      00941B CE 00 1C         [ 4] 3698 	call putc
      00941E C3 00            [ 1] 3699 	ld a,(WIDTH_SAV,sp) 
      009420 1E 2B 03         [ 1] 3700 	ld tab_width,a 
      009423 CC 94            [ 1] 3701 	ld a,(BASE_SAV,sp) 
      009425 99 1F 05         [ 1] 3702 	ld base,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      00154B                       3703 	_drop VSIZE 
      009428 FE 1F            [ 2]    1     addw sp,#VSIZE 
      00942A 01               [ 4] 3704 	ret 	
      00942B AE 7F FF 1F           3705 single_char: .byte '(',')',',','#'
      00942F 03 CD 92              3706 mul_char: .byte '*','/','%'
      009432 2A 4D 27 3F A1 02 27  3707 relop_str: .word gt,equal,ge,lt,le,ne 
             07 A1 01 27 06
      00943E CC 87                 3708 gt: .asciz ">"
      009440 57 CD                 3709 equal: .asciz "="
      009442 90 14 00              3710 ge: .asciz ">="
      009444 3C 00                 3711 lt: .asciz "<"
      009444 CD 90 07              3712 le: .asciz "<="
      009447 1F 01 A1              3713 ne:  .asciz "<>"
                                   3714 
                                   3715 
                                   3716 ;---------------------------------
                                   3717 ; BASIC: PRINT|? arg_list 
                                   3718 ; print values from argument list
                                   3719 ;----------------------------------
                           000001  3720 	COMMA=1
                           000001  3721 	VSIZE=1
      001570                       3722 print:
      00944A 01 27            [ 1] 3723 push #0 ; local variable COMMA 
      001572                       3724 reset_comma:
      00944C 05 01            [ 1] 3725 	clr (COMMA,sp)
      00944D                       3726 prt_loop:
      00944D CD 90 07         [ 4] 3727 	call relation 
      009450 1F 03            [ 1] 3728 	cp a,#TK_COLON 
      009452 27 59            [ 1] 3729 	jreq print_exit   
      009452 CE 00            [ 1] 3730 	cp a,#TK_INTGR 
      009454 1C 1F            [ 1] 3731 	jrne 0$ 
      009456 05 C3 00         [ 4] 3732 	call print_int 
      009459 1E 2A            [ 2] 3733 	jra reset_comma
      001584                       3734 0$: 	
      00945B 3D FE 13         [ 4] 3735 	call next_token
      00945E 01 2A            [ 1] 3736 	cp a,#TK_NONE 
      009460 14 1E            [ 1] 3737 	jreq print_exit 
      009462 05 1C            [ 1] 3738 1$:	cp a,#TK_QSTR
      009464 00 02            [ 1] 3739 	jrne 2$   
      009466 F6 5C C7         [ 4] 3740 	call puts
      009469 00               [ 1] 3741 	incw x 
      00946A 0B 72 5F 00      [ 2] 3742 	subw x,basicptr 
      00946E 0A               [ 1] 3743 	ld a,xl 
      00946F 72 BB 00         [ 1] 3744 	ld in,a  
      009472 0A 20            [ 2] 3745 	jra reset_comma
      009474 E0 05            [ 1] 3746 2$: cp a,#TK_CHAR 
      009475 26 06            [ 1] 3747 	jrne 3$
      009475 1E               [ 1] 3748 	ld a,xl 
      009476 05 01 9E         [ 4] 3749 	call putc 
      009477 20 CB            [ 2] 3750 	jra reset_comma 
      0015A7                       3751 3$: 	
      009477 CD 94            [ 1] 3752 	cp a,#TK_FUNC 
      009479 B0 1E            [ 1] 3753 	jrne 4$ 
      00947B 05               [ 4] 3754 	call (x)
      00947C E6 02 C7         [ 4] 3755 	call print_int 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00947F 00 0B            [ 2] 3756 	jra reset_comma 
      0015B1                       3757 4$: 
      009481 72 5F            [ 1] 3758 	cp a,#TK_COMMA 
      009483 00 0A            [ 1] 3759 	jrne 5$
      009485 72 BB            [ 1] 3760 	cpl (COMMA,sp) 
      009487 00 0A C3         [ 2] 3761 	jp prt_loop   
      0015BA                       3762 5$: 
      00948A 00 1E            [ 1] 3763 	cp a,#TK_SHARP
      00948C 2A 0B            [ 1] 3764 	jrne 7$
      00948E 1F 05 FE         [ 4] 3765 	call next_token
      009491 13 03            [ 1] 3766 	cp a,#TK_INTGR 
      009493 2C 04            [ 1] 3767 	jreq 6$
      009495 1E 05 20         [ 2] 3768 	jp syntax_error 
      0015C8                       3769 6$:
      009498 DE               [ 1] 3770 	ld a,xl 
      009499 A4 0F            [ 1] 3771 	and a,#15 
      009499 5B 06 81         [ 1] 3772 	ld tab_width,a 
      00949C CC 15 72         [ 2] 3773 	jp reset_comma 
      0015D1                       3774 7$:	
      00949C F6 5C A4         [ 4] 3775 	call unget_token
      0015D4                       3776 print_exit:
      00949F 0F 88            [ 1] 3777 	tnz (COMMA,sp)
      0094A1 0D 01            [ 1] 3778 	jrne 9$
      0094A3 27 09            [ 1] 3779 	ld a,#CR 
      0094A5 F6 CD 82         [ 4] 3780     call putc 
      0015DD                       3781 9$:	_drop VSIZE 
      0094A8 1E 5C            [ 2]    1     addw sp,#VSIZE 
      0094AA 0A               [ 4] 3782 	ret 
                                   3783 
                                   3784 ;----------------------
                                   3785 ; 'save_context' and
                                   3786 ; 'rest_context' must be 
                                   3787 ; called at the same 
                                   3788 ; call stack depth 
                                   3789 ; i.e. SP must have the 
                                   3790 ; save value at  
                                   3791 ; entry point of both 
                                   3792 ; routine. 
                                   3793 ;---------------------
                           000006  3794 	CTXT_SIZE=6 ; size of saved data 
                                   3795 ;--------------------
                                   3796 ; save current BASIC
                                   3797 ; interpreter context 
                                   3798 ; on cstack 
                                   3799 ;--------------------
      0015E0                       3800 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0015E0                       3801 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      0015E0                       3802 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      0015E0                       3803 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      0015E0                       3804 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0015E0                       3805 save_context:
      0094AB 01 20 F3         [ 2] 3806 	ldw x,basicptr 
      0094AE 84 81            [ 2] 3807 	ldw (BPTR,sp),x
      0094B0 CE 00 05         [ 2] 3808 	ldw x,lineno 
      0094B0 52 05            [ 2] 3809 	ldw (LNO,sp),x 
      0094B2 C6 00 08         [ 1] 3810 	ld a,in 
      0094B5 6B 01            [ 1] 3811 	ld (IN,sp),a
      0094B7 C6 00 26         [ 1] 3812 	ld a,count 
      0094BA 6B 02            [ 1] 3813 	ld (CNT,sp),a  
      0094BC CF               [ 4] 3814 	ret
                                   3815 
                                   3816 ;-----------------------
                                   3817 ; restore previously saved 
                                   3818 ; BASIC interpreter context 
                                   3819 ; from cstack 
                                   3820 ;-------------------------
      0015F5                       3821 rest_context:
      0094BD 00 15            [ 2] 3822 	ldw x,(BPTR,sp)
      0094BF FE 35 0A         [ 2] 3823 	ldw basicptr,x 
      0094C2 00 08            [ 2] 3824 	ldw x,(LNO,sp)
      0094C4 35 05 00         [ 2] 3825 	ldw lineno,x 
      0094C7 26 CD            [ 1] 3826 	ld a,(IN,sp)
      0094C9 89 CF A6         [ 1] 3827 	ld in,a
      0094CC 20 CD            [ 1] 3828 	ld a,(CNT,sp)
      0094CE 82 1E 72         [ 1] 3829 	ld count,a  
      0094D1 5F               [ 4] 3830 	ret
                                   3831 
                                   3832 ;------------------------------------------
                                   3833 ; BASIC: INPUT [string],var[,[string],var]
                                   3834 ; input value in variables 
                                   3835 ; [string] optionally can be used as prompt 
                                   3836 ;-----------------------------------------
                           000001  3837 	CX_BPTR=1
                           000003  3838 	CX_LNO=3
                           000004  3839 	CX_IN=4
                           000005  3840 	CX_CNT=5
                           000006  3841 	SKIP=6
                           000007  3842 	VSIZE=7
      00160A                       3843 input_var:
      0094D2 00 26 AE 00 02   [ 2] 3844 	btjt flags,#FRUN,1$ 
      0094D7 72 D6            [ 1] 3845 	ld a,#ERR_RUN_ONLY 
      0094D9 00 15 6B         [ 2] 3846 	jp tb_error 
      001614                       3847 1$:	_vars VSIZE 
      0094DC 05 5C            [ 2]    1     sub sp,#VSIZE 
      001616                       3848 input_loop:
      0094DE 9F 11            [ 1] 3849 	clr (SKIP,sp)
      0094E0 05 2B 03         [ 4] 3850 	call next_token 
      0094E3 CC 95            [ 1] 3851 	cp a,#TK_NONE 
      0094E5 BC 5C            [ 1] 3852 	jreq input_exit 
      0094E6 A1 08            [ 1] 3853 	cp a,#TK_QSTR 
      0094E6 72 D6            [ 1] 3854 	jrne 1$ 
      0094E8 00 15 5C         [ 4] 3855 	call puts 
      0094EB 1F 03            [ 1] 3856 	cpl (SKIP,sp)
      0094ED A1 06 27         [ 4] 3857 	call next_token 
      0094F0 04 A1            [ 1] 3858 1$: cp a,#TK_VAR  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0094F2 07 26            [ 1] 3859 	jreq 2$ 
      0094F4 16 06 D7         [ 2] 3860 	jp syntax_error
      0094F5 CD 0F 7A         [ 4] 3861 2$:	call dpush 
      0094F5 72 DE            [ 1] 3862 	tnz (SKIP,sp)
      0094F7 00 15            [ 1] 3863 	jrne 21$ 
      0094F9 CD 91            [ 1] 3864 	ld a,#':
      0094FB 93 CD 94         [ 1] 3865 	ld pad+1,a 
      0094FE 9C A6 20 CD      [ 1] 3866 	clr pad+2
      009502 82 1E 1E         [ 2] 3867 	ldw x,#pad 
      009505 03 1C 00         [ 4] 3868 	call puts   
      001648                       3869 21$:
      009508 02 20 D3         [ 4] 3870 	call save_context 
      00950B A1 08 26         [ 2] 3871 	ldw x,#tib 
      00950E 18 A6 22         [ 2] 3872 	ldw basicptr,x  
      009511 CD 82 1E 72      [ 1] 3873 	clr count  
      009515 BB 00 15         [ 4] 3874 	call readln 
      009518 CD 82 30 A6      [ 1] 3875 	clr in 
      00951C 22 CD 82         [ 4] 3876 	call relation 
      00951F 1E 5C            [ 1] 3877 	cp a,#TK_INTGR
      009521 72 B0            [ 1] 3878 	jreq 3$ 
      009523 00 15 20         [ 2] 3879 	jp syntax_error
      009526 B7 A1 03         [ 4] 3880 3$: call dpush 
      009529 26 15 72         [ 4] 3881 	call store 
      00952C DE 00 15         [ 4] 3882 	call rest_context
      00952F 1D 00 27         [ 4] 3883 	call next_token 
      009532 9F 44            [ 1] 3884 	cp a,#TK_COMMA 
      009534 AB 41            [ 1] 3885 	jrne 4$
      009536 CD 82            [ 2] 3886 	jra input_loop 
      009538 1E 1E 03         [ 4] 3887 4$:	call unget_token 
      00167B                       3888 input_exit:
      00167B                       3889 	_drop VSIZE 
      00953B 1C 00            [ 2]    1     addw sp,#VSIZE 
      00953D 02               [ 4] 3890 	ret 
                                   3891 
                                   3892 
                                   3893 ;---------------------
                                   3894 ; BASIC: REMARK | ' 
                                   3895 ; begin a comment 
                                   3896 ; comment are ignored 
                                   3897 ; use ' insted of REM 
                                   3898 ; This is never called
                                   3899 ; because get_token 
                                   3900 ; take care of skipping
                                   3901 ; comment. but required
                                   3902 ; for future use of 
                                   3903 ; keyword reverse search.  
                                   3904 ;---------------------- 
      00167E                       3905 rem: 
      00953E 20               [ 4] 3906 	ret 
                                   3907 
                                   3908 ;---------------------
                                   3909 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3910 ; read in loop 'addr'  
                                   3911 ; apply & 'mask' to value 
                                   3912 ; loop while result==0.  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3913 ; if 'xor_mask' given 
                                   3914 ; apply ^ in second  
                                   3915 ; loop while result==0 
                                   3916 ;---------------------
                           000001  3917 	XMASK=1 
                           000002  3918 	MASK=2
                           000003  3919 	ADDR=3
                           000004  3920 	VSIZE=4
      00167F                       3921 wait: 
      00167F                       3922 	_vars VSIZE
      00953F 9E A1            [ 2]    1     sub sp,#VSIZE 
      009541 04 26            [ 1] 3923 	clr (XMASK,sp) 
      009543 09 A6 40         [ 4] 3924 	call arg_list 
      009546 CD 82            [ 1] 3925 	cp a,#2
      009548 1E 1E            [ 1] 3926 	jruge 0$
      00954A 03 20 91         [ 2] 3927 	jp syntax_error 
      00954D A1 02            [ 1] 3928 0$:	cp a,#3
      00954F 26 0F            [ 1] 3929 	jrult 1$
      009551 72 DE 00         [ 4] 3930 	call dpop 
      009554 15               [ 1] 3931 	ld a,xl
      009555 CD 89            [ 1] 3932 	ld (XMASK,sp),a 
      009557 CF 1E 03         [ 4] 3933 1$: call dpop ; mask 
      00955A 1C               [ 1] 3934 	ld a,xl 
      00955B 00 02            [ 1] 3935 	ld (MASK,sp),a 
      00955D CC 94 DE         [ 4] 3936 	call dpop ; address 
      009560 A1               [ 1] 3937 2$:	ld a,(x)
      009561 31 2B            [ 1] 3938 	and a,(MASK,sp)
      009563 1A A1            [ 1] 3939 	xor a,(XMASK,sp)
      009565 35 22            [ 1] 3940 	jreq 2$ 
      0016A7                       3941 	_drop VSIZE 
      009567 16 A0            [ 2]    1     addw sp,#VSIZE 
      009569 31               [ 4] 3942 	ret 
                                   3943 
                                   3944 ;---------------------
                                   3945 ; BASIC: BSET addr,mask
                                   3946 ; set bits at 'addr' corresponding 
                                   3947 ; to those of 'mask' that are at 1.
                                   3948 ; arguments:
                                   3949 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3950 ;   mask        mask|addr
                                   3951 ; output:
                                   3952 ;	none 
                                   3953 ;--------------------------
      0016AA                       3954 bit_set:
      00956A 48 90 5F         [ 4] 3955 	call arg_list 
      00956D 90 97            [ 1] 3956 	cp a,#2	 
      00956F 72 A9            [ 1] 3957 	jreq 1$ 
      009571 95 D5 90         [ 2] 3958 	jp syntax_error
      0016B4                       3959 1$: 
      009574 FE 93 CD         [ 4] 3960 	call dpop ; mask 
      009577 82               [ 1] 3961 	ld a,xl 
      009578 30 1E 03         [ 4] 3962 	call dpop ; addr  
      00957B CC               [ 1] 3963 	or a,(x)
      00957C 94               [ 1] 3964 	ld (x),a
      00957D DE               [ 4] 3965 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   3966 
                                   3967 ;---------------------
                                   3968 ; BASIC: BRES addr,mask
                                   3969 ; reset bits at 'addr' corresponding 
                                   3970 ; to those of 'mask' that are at 1.
                                   3971 ; arguments:
                                   3972 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3973 ;   mask	    ~mask&*addr  
                                   3974 ; output:
                                   3975 ;	none 
                                   3976 ;--------------------------
      0016BE                       3977 bit_reset:
      00957E A1 10 26         [ 4] 3978 	call arg_list 
      009581 04 A6            [ 1] 3979 	cp a,#2  
      009583 2B 20            [ 1] 3980 	jreq 1$ 
      009585 2E A1 11         [ 2] 3981 	jp syntax_error
      0016C8                       3982 1$: 
      009588 26 04 A6         [ 4] 3983 	call dpop ; mask 
      00958B 2D               [ 1] 3984 	ld a,xl 
      00958C 20               [ 1] 3985 	cpl a 
      00958D 26 A1 20         [ 4] 3986 	call dpop ; addr  
      009590 2B               [ 1] 3987 	and a,(x)
      009591 0E               [ 1] 3988 	ld (x),a 
      009592 A1               [ 4] 3989 	ret 
                                   3990 
                                   3991 ;---------------------
                                   3992 ; BASIC: BRES addr,mask
                                   3993 ; toggle bits at 'addr' corresponding 
                                   3994 ; to those of 'mask' that are at 1.
                                   3995 ; arguments:
                                   3996 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3997 ;   mask	    mask^*addr  
                                   3998 ; output:
                                   3999 ;	none 
                                   4000 ;--------------------------
      0016D3                       4001 bit_toggle:
      009593 22 22 0A         [ 4] 4002 	call arg_list 
      009596 A0 20            [ 1] 4003 	cp a,#2 
      009598 5F 97            [ 1] 4004 	jreq 1$ 
      00959A 1C 95 D2         [ 2] 4005 	jp syntax_error
      00959D F6 20 14         [ 4] 4006 1$: call dpop ; mask 
      0095A0 A1               [ 1] 4007 	ld a,xl 
      0095A1 09 2B 0E         [ 4] 4008 	call dpop ; addr  
      0095A4 A1               [ 1] 4009 	xor a,(x)
      0095A5 0C               [ 1] 4010 	ld (x),a 
      0095A6 22               [ 4] 4011 	ret 
                                   4012 
                                   4013 
                                   4014 ;--------------------
                                   4015 ; BASIC: POKE addr,byte
                                   4016 ; put a byte at addr 
                                   4017 ;--------------------
      0016E7                       4018 poke:
      0095A7 0A A0 09         [ 4] 4019 	call arg_list 
      0095AA 5F 97            [ 1] 4020 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0095AC 1C 95            [ 1] 4021 	jreq 1$
      0095AE CE F6 20         [ 2] 4022 	jp syntax_error
      0016F1                       4023 1$:	
      0095B1 02 A6 3A         [ 4] 4024 	call dpop 
      0095B4 CD               [ 1] 4025     ld a,xl 
      0095B5 82 1E 1E         [ 4] 4026 	call dpop 
      0095B8 03               [ 1] 4027 	ld (x),a 
      0095B9 CC               [ 4] 4028 	ret 
                                   4029 
                                   4030 ;-----------------------
                                   4031 ; BASIC: PEEK(addr)
                                   4032 ; get the byte at addr 
                                   4033 ; input:
                                   4034 ;	none 
                                   4035 ; output:
                                   4036 ;	X 		value 
                                   4037 ;-----------------------
      0016FA                       4038 peek:
      0095BA 94 DE            [ 1] 4039 	ld a,#TK_LPAREN 
      0095BC CD 11 9D         [ 4] 4040 	call expect 
      0095BC A6 0D CD         [ 4] 4041 	call arg_list
      0095BF 82 1E            [ 1] 4042 	cp a,#1 
      0095C1 7B 02            [ 1] 4043 	jreq 1$
      0095C3 C7 00 26         [ 2] 4044 	jp syntax_error
      0095C6 7B 01            [ 1] 4045 1$:	ld a,#TK_RPAREN 
      0095C8 C7 00 08         [ 4] 4046 	call expect 
      0095CB 5B 05 81         [ 4] 4047 	call dpop 
      0095CE 28               [ 1] 4048 	ld a,(x)
      0095CF 29               [ 1] 4049 	clrw x 
      0095D0 2C               [ 1] 4050 	ld xl,a 
      0095D1 23 2A            [ 1] 4051 	ld a,#TK_INTGR
      0095D3 2F               [ 4] 4052 	ret 
                                   4053 
      001717                       4054 if: 
      0095D4 25 95 E1         [ 4] 4055 	call relation 
      0095D7 95 E3            [ 1] 4056 	cp a,#TK_INTGR
      0095D9 95 E5            [ 1] 4057 	jreq 1$ 
      0095DB 95 E8 95         [ 2] 4058 	jp syntax_error
      0095DE EA               [ 1] 4059 1$:	clr a 
      0095DF 95               [ 2] 4060 	tnzw x 
      0095E0 ED 3E            [ 1] 4061 	jrne 9$  
                                   4062 ;skip to next line
      0095E2 00 3D 00 3E 3D   [ 1] 4063 	mov in,count
      0095E7 00               [ 4] 4064 9$:	ret 
                                   4065 
                                   4066 ;------------------------
                                   4067 ; BASIC: FOR var=expr 
                                   4068 ; set variable to expression 
                                   4069 ; leave variable address 
                                   4070 ; on dstack and set
                                   4071 ; FFOR bit in 'flags'
                                   4072 ;-----------------
                           000001  4073 	RETL1=1
                           000003  4074 	INW=3
                           000005  4075 	BPTR=5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00172B                       4076 for: ; { -- var_addr }
      0095E8 3C 00            [ 1] 4077 	ld a,#TK_VAR 
      0095EA 3C 3D 00         [ 4] 4078 	call expect
      0095ED 3C 3E 00         [ 4] 4079 	call dpush 
      0095F0 CD 13 7B         [ 4] 4080 	call let02 
      0095F0 4B 00 00 24      [ 1] 4081 	bset flags,#FFOR 
                                   4082 ; open space on cstack for BPTR and INW 
      0095F2 85               [ 2] 4083 	popw x ; call return address 
      00173B                       4084 	_vars 4
      0095F2 0F 01            [ 2]    1     sub sp,#4 
      0095F4 89               [ 2] 4085 	pushw x  ; RETL1 
      0095F4 CD               [ 1] 4086 	clrw x 
      0095F5 93 68            [ 2] 4087 	ldw (BPTR,sp),x 
      0095F7 A1 01            [ 2] 4088 	ldw (INW,sp),x 
      0095F9 27 59 A1         [ 4] 4089 	call next_token 
      0095FC 02 26            [ 1] 4090 	cp a,#TK_CMD 
      0095FE 05 CD            [ 1] 4091 	jreq 1$
      009600 89 CF 20         [ 2] 4092 	jp syntax_error
      00174D                       4093 1$:  
      009603 EE 17 55         [ 2] 4094 	cpw x,#to 
      009604 27 03            [ 1] 4095 	jreq to
      009604 CD 88 3D         [ 2] 4096 	jp syntax_error 
                                   4097 
                                   4098 ;-----------------------------------
                                   4099 ; BASIC: TO expr 
                                   4100 ; second part of FOR loop initilization
                                   4101 ; leave limit on dstack and set 
                                   4102 ; FTO bit in 'flags'
                                   4103 ;-----------------------------------
      001755                       4104 to: ; { var_addr -- var_addr limit step }
      009607 A1 00 27 49 A1   [ 2] 4105 	btjt flags,#FFOR,1$
      00960C 08 26 0E         [ 2] 4106 	jp syntax_error
      00960F CD 82 30         [ 4] 4107 1$: call relation  
      009612 5C 72            [ 1] 4108 	cp a,#TK_INTGR 
      009614 B0 00            [ 1] 4109 	jreq 2$ 
      009616 04 9F C7         [ 2] 4110 	jp syntax_error
      001767                       4111 2$: 
      009619 00 02 20         [ 4] 4112     call dpush ; limit
      00961C D5 A1 05         [ 2] 4113 	ldw x,in.w 
      00961F 26 06 9F         [ 4] 4114 	call next_token
      009622 CD 82            [ 1] 4115 	cp a,#TK_NONE  
      009624 1E 20            [ 1] 4116 	jreq 4$ 
      009626 CB 06            [ 1] 4117 	cp a,#TK_CMD
      009627 26 05            [ 1] 4118 	jrne 3$
      009627 A1 07 26         [ 2] 4119 	cpw x,#step 
      00962A 06 FD            [ 1] 4120 	jreq step
      00177D                       4121 3$:	
      00962C CD 89 CF         [ 4] 4122 	call unget_token   	 
      001780                       4123 4$:	
      00962F 20 C1 01         [ 2] 4124 	ldw x,#1   ; default step  
      009631 20 12            [ 2] 4125 	jra store_loop_addr 
                                   4126 
                                   4127 
                                   4128 ;----------------------------------
                                   4129 ; BASIC: STEP expr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4130 ; optional third par of FOR loop
                                   4131 ; initialization. 	
                                   4132 ;------------------------------------
      001785                       4133 step: ; {var limit -- var limit step}
      009631 A1 0B 26 05 03   [ 2] 4134 	btjt flags,#FFOR,1$
      009636 01 CC 95         [ 2] 4135 	jp syntax_error
      009639 F4 12 E8         [ 4] 4136 1$: call relation
      00963A A1 02            [ 1] 4137 	cp a,#TK_INTGR
      00963A A1 0C            [ 1] 4138 	jreq store_loop_addr  
      00963C 26 13 CD         [ 2] 4139 	jp syntax_error
                                   4140 ; leave loop back entry point on cstack 
                                   4141 ; cstack is 2 call deep from interp_loop
      001797                       4142 store_loop_addr:
      00963F 88 3D A1         [ 4] 4143 	call dpush 
      009642 02 27 03         [ 2] 4144 	ldw x,basicptr  
      009645 CC 87            [ 2] 4145 	ldw (BPTR,sp),x 
      009647 57 00 00         [ 2] 4146 	ldw x,in.w 
      009648 1F 03            [ 2] 4147 	ldw (INW,sp),x   
      009648 9F A4 0F C7      [ 1] 4148 	bres flags,#FFOR 
      00964C 00 26 CC 95      [ 1] 4149 	inc loop_depth  
      009650 F2               [ 4] 4150 	ret 
                                   4151 
                                   4152 ;--------------------------------
                                   4153 ; BASIC: NEXT var 
                                   4154 ; FOR loop control 
                                   4155 ; increment variable with step 
                                   4156 ; and compare with limit 
                                   4157 ; loop if threshold not crossed.
                                   4158 ; else clean both stacks. 
                                   4159 ; and decrement 'loop_depth' 
                                   4160 ;--------------------------------
      009651                       4161 next: ; {var limit step -- [var limit step ] }
      009651 CD 8F F3 1F      [ 1] 4162 	tnz loop_depth 
      009654 26 03            [ 1] 4163 	jrne 1$ 
      009654 0D 01 26         [ 2] 4164 	jp syntax_error 
      0017B6                       4165 1$: 
      009657 05 A6            [ 1] 4166 	ld a,#TK_VAR 
      009659 0D CD 82         [ 4] 4167 	call expect
                                   4168 ; check for good variable after NEXT 	 
      00965C 1E 5B            [ 1] 4169 	ldw y,x 
      00965E 01 81 04         [ 2] 4170 	ldw x,#4  
      009660 72 D3 00 19      [ 4] 4171 	cpw y,([dstkptr],x) ; compare variables address 
      009660 CE 00            [ 1] 4172 	jreq 2$  
      009662 04 1F 03         [ 2] 4173 	jp syntax_error ; not the good one 
      0017C9                       4174 2$: ; increment variable 
      009665 CE               [ 1] 4175 	ldw x,y
      009666 00               [ 2] 4176 	ldw x,(x)  ; get var value 
      009667 06 1F 05         [ 2] 4177 	ldw acc16,x 
      00966A C6 00 02 6B      [ 5] 4178 	ldw x,[dstkptr] ; step
      00966E 07 C6 00 03      [ 2] 4179 	addw x,acc16 ; var+step 
      009672 6B 08            [ 2] 4180 	ldw (y),x ; save var new value 
                                   4181 ; compare with limit 
      009674 81 93            [ 1] 4182 	ldw y,x 
      009675 72 CE 00 19      [ 5] 4183 	ldw x,[dstkptr] ; step in x 
      009675 1E               [ 2] 4184 	tnzw x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009676 03 CF            [ 1] 4185 	jrpl 4$ ; positive step 
                                   4186 ;negative step 
      009678 00 04 1E         [ 2] 4187 	ldw x,#2
      00967B 05 CF 00 06      [ 4] 4188 	cpw y,([dstkptr],x)
      00967F 7B 07            [ 1] 4189 	jrslt loop_done
      009681 C7 00            [ 2] 4190 	jra loop_back 
      0017EC                       4191 4$: ; positive step
      009683 02 7B 08         [ 2] 4192 	ldw x,#2 
      009686 C7 00 03 81      [ 4] 4193 	cpw y,([dstkptr],x)
      00968A 2C 1B            [ 1] 4194 	jrsgt loop_done
      0017F5                       4195 loop_back:
      00968A 72 00            [ 2] 4196 	ldw x,(BPTR,sp)
      00968C 00 25 05         [ 2] 4197 	ldw basicptr,x 
      00968F A6 06 CC 87 59   [ 2] 4198 	btjf flags,#FRUN,1$ 
      009694 52 07            [ 1] 4199 	ld a,(2,x)
      009696 AB 02            [ 1] 4200 	add a,#2 
      009696 0F 06 CD         [ 1] 4201 	ld count,a
      009699 88               [ 2] 4202 	ldw x,(x)
      00969A 3D A1 00         [ 2] 4203 	ldw lineno,x
      00969D 27 5C            [ 2] 4204 1$:	ldw x,(INW,sp)
      00969F A1 08 26         [ 2] 4205 	ldw in.w,x 
      0096A2 08               [ 4] 4206 	ret 
      001810                       4207 loop_done:
                                   4208 	; remove var limit step on dstack 
      0096A3 CD 82 30         [ 2] 4209 	ldw x,dstkptr 
      0096A6 03 06 CD         [ 2] 4210 	addw x,#3*CELL_SIZE
      0096A9 88 3D A1         [ 2] 4211 	ldw dstkptr,x 
                                   4212 	; remove 2 return address on cstack 
      0096AC 03               [ 2] 4213 	popw x
      00181A                       4214 	_drop 4
      0096AD 27 03            [ 2]    1     addw sp,#4 
      0096AF CC               [ 2] 4215 	pushw x 
      0096B0 87 57 CD 8F      [ 1] 4216 	dec loop_depth 
      0096B4 FA               [ 4] 4217 	ret 
                                   4218 
                                   4219 
                                   4220 ;------------------------
                                   4221 ; BASIC: GOTO lineno 
                                   4222 ; jump to lineno 
                                   4223 ; here cstack is 2 call deep from interp_loop 
                                   4224 ;------------------------
      001822                       4225 goto:
      0096B5 0D 06 26 0F A6   [ 2] 4226 	btjt flags,#FRUN,0$ 
      0096BA 3A C7            [ 1] 4227 	ld a,#ERR_RUN_ONLY
      0096BC 17 19 72         [ 2] 4228 	jp tb_error 
      0096BF 5F               [ 4] 4229 	ret 
      0096C0 17 1A            [ 2] 4230 0$:	jra go_common
                                   4231 
                                   4232 ;--------------------
                                   4233 ; BASIC: GOSUB lineno
                                   4234 ; basic subroutine call
                                   4235 ; actual lineno and basicptr 
                                   4236 ; are saved on cstack
                                   4237 ; here cstack is 2 call deep from interp_loop 
                                   4238 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



                           000003  4239 	GOS_RET=3
      00182F                       4240 gosub:
      0096C2 AE 17 18 CD 82   [ 2] 4241 	btjt flags,#FRUN,0$ 
      0096C7 30 06            [ 1] 4242 	ld a,#ERR_RUN_ONLY
      0096C8 CC 06 D9         [ 2] 4243 	jp tb_error 
      0096C8 CD               [ 4] 4244 	ret 
      0096C9 96               [ 2] 4245 0$:	popw x 
      0096CA 60 AE            [ 2] 4246 	sub sp,#2 
      0096CC 16               [ 2] 4247 	pushw x 
      0096CD C8 CF 00         [ 2] 4248 	ldw x,basicptr
      0096D0 04 72            [ 1] 4249 	ld a,(2,x)
      0096D2 5F 00            [ 1] 4250 	add a,#3 
      0096D4 03 CD 8A         [ 1] 4251 	ld acc8,a 
      0096D7 BD 72 5F 00      [ 1] 4252 	clr acc16 
      0096DB 02 CD 93 68      [ 2] 4253 	addw x,acc16
      0096DF A1 02            [ 2] 4254 	ldw (GOS_RET,sp),x 
      001852                       4255 go_common: 
      0096E1 27 03 CC         [ 4] 4256 	call relation 
      0096E4 87 57            [ 1] 4257 	cp a,#TK_INTGR
      0096E6 CD 8F            [ 1] 4258 	jreq 1$ 
      0096E8 FA CD 90         [ 2] 4259 	jp syntax_error
      00185C                       4260 1$: 
      0096EB 61 CD 96         [ 4] 4261 	call search_lineno  
      0096EE 75               [ 2] 4262 	tnzw x 
      0096EF CD 88            [ 1] 4263 	jrne 2$ 
      0096F1 3D A1            [ 1] 4264 	ld a,#ERR_NO_LINE 
      0096F3 0B 26 02         [ 2] 4265 	jp tb_error 
      001867                       4266 2$: 
      0096F6 20 9E CD         [ 2] 4267 	ldw basicptr,x 
      0096F9 8F F3            [ 1] 4268 	ld a,(2,x)
      0096FB AB 03            [ 1] 4269 	add a,#3 
      0096FB 5B 07 81         [ 1] 4270 	ld count,a 
      0096FE FE               [ 2] 4271 	ldw x,(x)
      0096FE 81 00 05         [ 2] 4272 	ldw lineno,x 
      0096FF 35 03 00 01      [ 1] 4273 	mov in,#3 
      0096FF 52               [ 4] 4274 	ret 
                                   4275 
                                   4276 ;------------------------
                                   4277 ; BASIC: RETURN 
                                   4278 ; exit from a subroutine 
                                   4279 ; cstack is 2 level deep from interp_loop 
                                   4280 ;------------------------
      00187A                       4281 return:
      009700 04 0F 01 CD 92   [ 2] 4282 	btjt flags,#FRUN,0$ 
      009705 2A A1            [ 1] 4283 	ld a,#ERR_RUN_ONLY
      009707 02 24 03         [ 2] 4284 	jp tb_error 
      001884                       4285 0$:	
      00970A CC 87            [ 2] 4286 	ldw x,(GOS_RET,sp) 
      00970C 57 A1 03         [ 2] 4287 	ldw basicptr,x 
      00970F 25 06            [ 1] 4288 	ld a,(2,x)
      009711 CD 90            [ 1] 4289 	add a,#3 
      009713 07 9F 6B         [ 1] 4290 	ld count,a 
      009716 01 CD 90 07      [ 1] 4291 	mov in,#3
      00971A 9F               [ 2] 4292 	ldw x,(x)
      00971B 6B 02 CD         [ 2] 4293 	ldw lineno,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      00971E 90               [ 1] 4294 	clr a 
      00971F 07               [ 2] 4295 	popw x 
      00189A                       4296 	_drop 2
      009720 F6 14            [ 2]    1     addw sp,#2 
      009722 02               [ 2] 4297 	pushw x
      009723 18               [ 4] 4298 	ret  
                                   4299 
                                   4300 
                                   4301 ;----------------------------------
                                   4302 ; BASIC: RUN
                                   4303 ; run BASIC program in RAM
                                   4304 ;----------------------------------- 
      00189E                       4305 run: 
      009724 01 27 F9 5B 04   [ 2] 4306 	btjf flags,#FRUN,0$  
      009729 81               [ 1] 4307 	clr a 
      00972A 81               [ 4] 4308 	ret
      0018A5                       4309 0$: 
      00972A CD 92 2A A1 02   [ 2] 4310 	btjf flags,#FBREAK,1$
      0018AA                       4311 	_drop 2 
      00972F 27 03            [ 2]    1     addw sp,#2 
      009731 CC 87 57         [ 4] 4312 	call rest_context
      009734                       4313 	_drop CTXT_SIZE 
      009734 CD 90            [ 2]    1     addw sp,#CTXT_SIZE 
      009736 07 9F CD 90      [ 1] 4314 	bres flags,#FBREAK 
      00973A 07 FA F7 81      [ 1] 4315 	bset flags,#FRUN 
      00973E CC 07 8D         [ 2] 4316 	jp interp_loop 
      00973E CD 92 2A         [ 2] 4317 1$:	ldw x,txtbgn
      009741 A1 02 27         [ 2] 4318 	cpw x,txtend 
      009744 03 CC            [ 1] 4319 	jrmi 2$ 
      009746 87               [ 1] 4320 	clr a 
      009747 57               [ 4] 4321 	ret 
      009748 CD 13 63         [ 4] 4322 2$: call ubound 
      0018C9                       4323 	_drop 2 
      009748 CD 90            [ 2]    1     addw sp,#2 
      00974A 07 9F 43         [ 2] 4324 	ldw x,txtbgn 
      00974D CD 90 07         [ 2] 4325 	ldw basicptr,x 
      009750 F4 F7            [ 1] 4326 	ld a,(2,x)
      009752 81 00 02         [ 1] 4327 	ld count,a
      009753 FE               [ 2] 4328 	ldw x,(x)
      009753 CD 92 2A         [ 2] 4329 	ldw lineno,x
      009756 A1 02 27 03      [ 1] 4330 	mov in,#3	
      00975A CC 87 57 CD      [ 1] 4331 	bset flags,#FRUN 
      00975E 90 07 9F         [ 2] 4332 	jp interp_loop 
                                   4333 
                                   4334 
                                   4335 ;----------------------
                                   4336 ; BASIC: STOP 
                                   4337 ; stop running program
                                   4338 ;---------------------- 
      0018E5                       4339 stop: 
                                   4340 ; clean dstack and cstack 
      009761 CD 90 07         [ 2] 4341 	ldw x,#STACK_EMPTY 
      009764 F8               [ 1] 4342 	ldw sp,x 
      009765 F7 81 00 24      [ 1] 4343 	bres flags,#FRUN 
      009767 72 19 00 24      [ 1] 4344 	bres flags,#FBREAK
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009767 CD 92 2A         [ 2] 4345 	jp warm_start
                                   4346 
                                   4347 ;-----------------------
                                   4348 ; BASIC BEEP expr1,expr2
                                   4349 ; used MCU internal beeper 
                                   4350 ; to produce a sound
                                   4351 ; arguments:
                                   4352 ;    expr1   frequency, {1,2,4} mapping to 1K,2K,4K
                                   4353 ;    expr2   duration msec.
                                   4354 ;---------------------------
      0018F4                       4355 beep:
      00976A A1 02 27         [ 4] 4356 	call arg_list 
      00976D 03 CC            [ 1] 4357 	cp a,#2 
      00976F 87 57            [ 1] 4358 	jreq 2$
      009771 CC 06 D7         [ 2] 4359 	jp syntax_error 
      009771 CD 90 07         [ 2] 4360 2$: ldw x,dstkptr 
      009774 9F CD            [ 2] 4361 	ldw x,(2,x);frequency 
      009776 90               [ 1] 4362 	ld a,xl
      009777 07               [ 1] 4363 	dec a 
      009778 F7               [ 1] 4364 	swap a 
      009779 81               [ 1] 4365 	sll a 
      00977A 48               [ 1] 4366 	sll a 
      00977A A6 09            [ 1] 4367 	add a,#0x3e 
      00977C CD 92 1D         [ 1] 4368 	ld BEEP_CSR,a 
      00977F CD 92 2A         [ 4] 4369 	call dpop 
      009782 A1 01 27         [ 4] 4370 	call pause02 
      009785 03 CC 87         [ 4] 4371 	call ddrop 
      009788 57 A6            [ 1] 4372 	ld a,#0x1f
      00978A 0A CD 92         [ 1] 4373 	ld BEEP_CSR,a 
      00978D 1D               [ 4] 4374 	ret 
                                   4375 
                                   4376 ;-------------------------------
                                   4377 ; BASIC: PWRADC 0|1,divisor  
                                   4378 ; disable/enanble ADC 
                                   4379 ;-------------------------------
      00191C                       4380 power_adc:
      00978E CD 90 07         [ 4] 4381 	call arg_list 
      009791 F6 5F            [ 1] 4382 	cp a,#2	
      009793 97 A6            [ 1] 4383 	jreq 1$
      009795 02 81 D7         [ 2] 4384 	jp syntax_error 
      009797 AE 00 02         [ 2] 4385 1$: ldw x,#2
      009797 CD 93 68 A1      [ 5] 4386 	ldw x,([dstkptr],x) ; on|off
      00979B 02               [ 2] 4387 	tnzw x 
      00979C 27 03            [ 1] 4388 	jreq 2$ 
      00979E CC 87 57 4F      [ 5] 4389 	ldw x,[dstkptr] ; channel
      0097A2 5D               [ 1] 4390 	ld a,xl
      0097A3 26 05            [ 1] 4391 	and a,#7
      0097A5 55               [ 1] 4392 	swap a 
      0097A6 00 03 00         [ 1] 4393 	ld ADC_CR1,a
      0097A9 02 81 54 02      [ 1] 4394 	bset ADC_CR2,#ADC_CR2_ALIGN ; right 
      0097AB 72 10 54 01      [ 1] 4395 	bset ADC_CR1,#ADC_CR1_ADON 
      001943                       4396 	_usec_dly 7 
      0097AB A6 03 CD         [ 2]    1     ldw x,#(16*7-2)/4
      0097AE 92               [ 2]    2     decw x
      0097AF 1D               [ 1]    3     nop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0097B0 CD 8F            [ 1]    4     jrne .-4
      0097B2 FA CD            [ 2] 4397 	jra 3$
      0097B4 93 FB 72 14      [ 1] 4398 2$: bres ADC_CR1,#ADC_CR1_ADON 
      0097B8 00 25 85         [ 2] 4399 3$:	ldw x,#2
      0097BB 52 04 89         [ 4] 4400 	call ddrop_n 
      0097BE 5F               [ 4] 4401 	ret
                                   4402 
                                   4403 ;-----------------------------
                                   4404 ; BASIC: RDADC(channel)
                                   4405 ; read adc channel 
                                   4406 ; output:
                                   4407 ;   A 		TK_INTGR 
                                   4408 ;   X 		value 
                                   4409 ;-----------------------------
      001957                       4410 read_adc:
      0097BF 1F 05            [ 1] 4411 	ld a,#TK_LPAREN 
      0097C1 1F 03 CD         [ 4] 4412 	call expect 
      0097C4 88 3D A1         [ 4] 4413 	call next_token 
      0097C7 06 27            [ 1] 4414 	cp a,#TK_INTGR 
      0097C9 03 CC            [ 1] 4415 	jreq 1$
      0097CB 87 57 D7         [ 2] 4416 	jp syntax_error
      0097CD 89               [ 2] 4417 1$: pushw x 
      0097CD A3 97            [ 1] 4418 	ld a,#TK_RPAREN 
      0097CF D5 27 03         [ 4] 4419 	call expect 
      0097D2 CC               [ 2] 4420 	popw x 
      0097D3 87 57 10         [ 2] 4421 	cpw x,#16 
      0097D5 25 05            [ 1] 4422 	jrult 2$
      0097D5 72 04            [ 1] 4423 	ld a,#ERR_BAD_VALUE
      0097D7 00 25 03         [ 2] 4424 	jp tb_error 
      0097DA CC               [ 1] 4425 2$: ld a,xl
      0097DB 87 57 CD         [ 1] 4426 	ld ADC_CSR,a 
      0097DE 93 68 A1 02      [ 1] 4427 	bset ADC_CR1,#ADC_CR1_ADON
      0097E2 27 03 CC 87 57   [ 2] 4428 	btjf ADC_CSR,#ADC_CSR_EOC,.
      0097E7 CE 54 04         [ 2] 4429 	ldw x,ADC_DRH 
      0097E7 CD 8F            [ 1] 4430 	ld a,#TK_INTGR
      0097E9 FA               [ 4] 4431 	ret 
                                   4432 
                                   4433 
                                   4434 ;-----------------------
                                   4435 ; BASIC: BREAK 
                                   4436 ; insert a breakpoint 
                                   4437 ; in pogram. 
                                   4438 ; the program is resumed
                                   4439 ; with RUN 
                                   4440 ;-------------------------
      00198A                       4441 break:
      0097EA CE 00 01 CD 88   [ 2] 4442 	btjt flags,#FRUN,2$
      0097EF 3D               [ 1] 4443 	clr a
      0097F0 A1               [ 4] 4444 	ret 
      001991                       4445 2$:	 
                                   4446 ; create space on cstack to save context 
      0097F1 00 27 0C         [ 2] 4447 	ldw x,#break_point 
      0097F4 A1 06 26         [ 4] 4448 	call puts 
      001997                       4449 	_drop 2 ;drop return address 
      0097F7 05 A3            [ 2]    1     addw sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      001999                       4450 	_vars CTXT_SIZE ; context size 
      0097F9 98 05            [ 2]    1     sub sp,#CTXT_SIZE 
      0097FB 27 08 E0         [ 4] 4451 	call save_context 
      0097FD AE 16 C8         [ 2] 4452 	ldw x,#tib 
      0097FD CD 8F F3         [ 2] 4453 	ldw basicptr,x
      009800 7F               [ 1] 4454 	clr (x)
      009800 AE 00 01 20      [ 1] 4455 	clr count  
      009804 12               [ 1] 4456 	clrw x 
      009805 CF 00 05         [ 2] 4457 	ldw lineno,x 
      009805 72 04 00         [ 2] 4458 	ldw in.w,x
      009808 25 03 CC 87      [ 1] 4459 	bres flags,#FRUN 
      00980C 57 CD 93 68      [ 1] 4460 	bset flags,#FBREAK
      009810 A1 02 27         [ 2] 4461 	jp interp_loop 
      009813 03 CC 87 57 61 6B 20  4462 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4463 
                                   4464 ;-----------------------
                                   4465 ; BASIC: NEW
                                   4466 ; from command line only 
                                   4467 ; free program memory
                                   4468 ; and clear variables 
                                   4469 ;------------------------
      009817                       4470 new: 
      009817 CD 8F FA CE 00   [ 2] 4471 	btjf flags,#FRUN,0$ 
      00981C 04               [ 1] 4472 	clr a 
      00981D 1F               [ 4] 4473 	ret 
      0019E0                       4474 0$:	
      00981E 05 CE 00         [ 4] 4475 	call clear_basic 
      009821 01               [ 4] 4476 	ret 
                                   4477 	 
                                   4478 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4479 ;   file system routines
                                   4480 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4481 
                                   4482 ;--------------------
                                   4483 ; input:
                                   4484 ;   X     increment 
                                   4485 ; output:
                                   4486 ;   farptr  incremented 
                                   4487 ;---------------------
      0019E4                       4488 incr_farptr:
      009822 1F 03 72 15      [ 2] 4489 	addw x,farptr+1 
      009826 00 25            [ 1] 4490 	jrnc 1$
      009828 72 5C 00 20      [ 1] 4491 	inc farptr 
      00982C 81 00 14         [ 2] 4492 1$:	ldw farptr+1,x  
      00982D 81               [ 4] 4493 	ret 
                                   4494 
                                   4495 ;------------------------------
                                   4496 ; extended flash memory used as FLASH_DRIVE 
                                   4497 ; seek end of used flash drive   
                                   4498 ; starting at 0x10000 address.
                                   4499 ; 4 consecutives 0 bytes signal free space. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4500 ; input:
                                   4501 ;	none
                                   4502 ; output:
                                   4503 ;   ffree     free_addr| 0 if memory full.
                                   4504 ;------------------------------
      0019F2                       4505 seek_fdrive:
      00982D 72 5D            [ 1] 4506 	ld a,#1
      00982F 00 20 26         [ 1] 4507 	ld farptr,a 
      009832 03               [ 1] 4508 	clrw x 
      009833 CC 87 57         [ 2] 4509 	ldw farptr+1,x 
      009836                       4510 1$:
      009836 A6               [ 1] 4511 	clrw x 
      009837 03 CD 92 1D      [ 5] 4512 	ldf a,([farptr],x) 
      00983B 90 93            [ 1] 4513 	jrne 2$
      00983D AE               [ 1] 4514 	incw x 
      00983E 00 04 72 D3      [ 5] 4515 	ldf a,([farptr],x)
      009842 00 1A            [ 1] 4516 	jrne 2$ 
      009844 27               [ 1] 4517 	incw x 
      009845 03 CC 87 57      [ 5] 4518 	ldf a,([farptr],x)
      009849 26 07            [ 1] 4519 	jrne 2$ 
      009849 93               [ 1] 4520 	incw x 
      00984A FE CF 00 0A      [ 5] 4521 	ldf a,([farptr],x)
      00984E 72 CE            [ 1] 4522 	jreq 4$ 
      001A17                       4523 2$: 
      009850 00 1A 72         [ 2] 4524 	addw x,#1
      009853 BB 00 0A         [ 4] 4525 	call incr_farptr
      009856 90 FF 90         [ 2] 4526 	ldw x,#0x27f 
      009859 93 72 CE         [ 2] 4527 	cpw x,farptr
      00985C 00 1A            [ 1] 4528 	jrpl 1$
      00985E 5D 2A 0B AE      [ 1] 4529 	clr ffree 
      009862 00 02 72 D3      [ 1] 4530 	clr ffree+1 
      009866 00 1A 2F 26      [ 1] 4531 	clr ffree+2 
      00986A 20 09 00 08      [ 1] 4532 	clr acc24 
      00986C 72 5F 00 09      [ 1] 4533 	clr acc16
      00986C AE 00 02 72      [ 1] 4534 	clr acc8 
      009870 D3 00            [ 2] 4535 	jra 5$
      001A3F                       4536 4$: ; copy farptr to ffree	 
      009872 1A 2C 1B         [ 2] 4537 	ldw x,farptr+1 
      009875 A3 00 00         [ 2] 4538 	cpw x,#fdrive 
      009875 1E 05            [ 1] 4539 	jreq 41$
                                   4540 	; there is a file, last 0 of that file must be skipped.
      009877 CF 00 04         [ 2] 4541 	ldw x,#1
      00987A 72 01 00         [ 4] 4542 	call incr_farptr
      001A4D                       4543 41$: 
      00987D 25 0B E6         [ 2] 4544 	ldw x,farptr 
      009880 02 AB 02         [ 1] 4545 	ld a,farptr+2 
      009883 C7 00 03         [ 2] 4546 	ldw ffree,x 
      009886 FE CF 00         [ 1] 4547 	ld ffree+2,a  
      009889 06               [ 4] 4548 5$:	ret 
                                   4549 
                                   4550 ;-----------------------
                                   4551 ; compare file name 
                                   4552 ; with name pointed by Y  
                                   4553 ; input:
                                   4554 ;   farptr   file name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4555 ;   Y        target name 
                                   4556 ; output:
                                   4557 ;   farptr 	 at file_name
                                   4558 ;   X 		 farptr[x] point at size field  
                                   4559 ;   Carry    0|1 no match|match  
                                   4560 ;----------------------
      001A5A                       4561 cmp_name:
      00988A 1E               [ 1] 4562 	clrw x
      00988B 03 CF 00 01      [ 5] 4563 1$:	ldf a,([farptr],x)
      00988F 81 F1            [ 1] 4564 	cp a,(y)
      009890 26 08            [ 1] 4565 	jrne 4$
      009890 CE               [ 1] 4566 	tnz a 
      009891 00 1A            [ 1] 4567 	jreq 9$ 
      009893 1C               [ 1] 4568     incw x 
      009894 00 06            [ 1] 4569 	incw y 
      009896 CF 00            [ 2] 4570 	jra 1$
      001A6B                       4571 4$: ;no match 
      009898 1A               [ 1] 4572 	tnz a 
      009899 85 5B            [ 1] 4573 	jreq 5$
      00989B 04               [ 1] 4574 	incw x 
      00989C 89 72 5A 00      [ 5] 4575 	ldf a,([farptr],x)
      0098A0 20 81            [ 2] 4576 	jra 4$  
      0098A2 5C               [ 1] 4577 5$:	incw x ; farptr[x] point at 'size' field 
      0098A2 72               [ 1] 4578 	rcf 
      0098A3 00               [ 4] 4579 	ret
      001A78                       4580 9$: ; match  
      0098A4 00               [ 1] 4581 	incw x  ; farptr[x] at 'size' field 
      0098A5 25               [ 1] 4582 	scf 
      0098A6 06               [ 4] 4583 	ret 
                                   4584 
                                   4585 ;-----------------------
                                   4586 ; search file in 
                                   4587 ; flash memory 
                                   4588 ; input:
                                   4589 ;   Y       file name  
                                   4590 ; output:
                                   4591 ;   farptr  addr at name|0
                                   4592 ;-----------------------
                           000001  4593 	FSIZE=1
                           000003  4594 	YSAVE=3
                           000004  4595 	VSIZE=4 
      001A7B                       4596 search_file: 
      001A7B                       4597 	_vars VSIZE
      0098A7 A6 06            [ 2]    1     sub sp,#VSIZE 
      0098A9 CC 87            [ 2] 4598 	ldw (YSAVE,sp),y  
      0098AB 59               [ 1] 4599 	clrw x 
      0098AC 81 20 23         [ 2] 4600 	ldw farptr+1,x 
      0098AF 35 01 00 13      [ 1] 4601 	mov farptr,#1
      001A87                       4602 1$:	
                                   4603 ; check if farptr is after any file 
                                   4604 ; if  0 then so.
      0098AF 72 00 00 25      [ 5] 4605 	ldf a,[farptr]
      0098B3 06 A6            [ 1] 4606 	jreq 6$
      0098B5 06               [ 1] 4607 2$: clrw x 	
      0098B6 CC 87            [ 2] 4608 	ldw y,(YSAVE,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      0098B8 59 81 85         [ 4] 4609 	call cmp_name
      0098BB 52 02            [ 1] 4610 	jrc 9$
      0098BD 89 CE 00 04      [ 5] 4611 	ldf a,([farptr],x)
      0098C1 E6 02            [ 1] 4612 	ld (FSIZE,sp),a 
      0098C3 AB               [ 1] 4613 	incw x 
      0098C4 03 C7 00 0B      [ 5] 4614 	ldf a,([farptr],x)
      0098C8 72 5F            [ 1] 4615 	ld (FSIZE+1,sp),a 
      0098CA 00               [ 1] 4616 	incw x 
      0098CB 0A 72 BB         [ 2] 4617 	addw x,(FSIZE,sp) ; count to skip 
      0098CE 00 0A 1F         [ 4] 4618 	call incr_farptr ; now at next file 'name_field'
      0098D1 03 02 80         [ 2] 4619 	ldw x,#0x280
      0098D2 C3 00 13         [ 2] 4620 	cpw x,farptr 
      0098D2 CD 93            [ 1] 4621 	jrpl 1$
      001AB1                       4622 6$: ; file not found 
      0098D4 68 A1 02 27      [ 1] 4623 	clr farptr
      0098D8 03 CC 87 57      [ 1] 4624 	clr farptr+1 
      0098DC 72 5F 00 15      [ 1] 4625 	clr farptr+2 
      001ABD                       4626 	_drop VSIZE 
      0098DC CD 83            [ 2]    1     addw sp,#VSIZE 
      0098DE 60               [ 1] 4627 	rcf
      0098DF 5D               [ 4] 4628 	ret
      001AC1                       4629 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001AC1                       4630 	_drop VSIZE 
      0098E0 26 05            [ 2]    1     addw sp,#VSIZE 
      0098E2 A6               [ 1] 4631 	scf 	
      0098E3 05               [ 4] 4632 	ret
                                   4633 
                                   4634 ;--------------------------------
                                   4635 ; BASIC: SAVE "name" 
                                   4636 ; save text program in 
                                   4637 ; flash memory used as 
                                   4638 ;--------------------------------
      001AC5                       4639 save:
      0098E4 CC 87 59 24 05   [ 2] 4640 	btjf flags,#FRUN,0$ 
      0098E7 A6 07            [ 1] 4641 	ld a,#ERR_CMD_ONLY 
      0098E7 CF 00 04         [ 2] 4642 	jp tb_error
      001ACF                       4643 0$:	 
      0098EA E6 02 AB         [ 2] 4644 	ldw x,txtend 
      0098ED 03 C7 00 03      [ 2] 4645 	subw x,txtbgn
      0098F1 FE CF            [ 1] 4646 	jrne 10$
                                   4647 ; nothing to save 
      0098F3 00               [ 1] 4648 	clr a 
      0098F4 06               [ 4] 4649 	ret 
      001ADA                       4650 10$:	
      0098F5 35 03 00         [ 1] 4651 	ld a,ffree 
      0098F8 02 81 17         [ 1] 4652 	or a,ffree+1
      0098FA CA 00 18         [ 1] 4653 	or a,ffree+2 
      0098FA 72 00            [ 1] 4654 	jrne 1$
      0098FC 00 25            [ 1] 4655 	ld a,#ERR_MEM_FULL
      0098FE 05 A6 06         [ 2] 4656 	jp tb_error 
      009901 CC 87 59         [ 4] 4657 1$: call next_token	
      009904 A1 08            [ 1] 4658 	cp a,#TK_QSTR
      009904 1E 03            [ 1] 4659 	jreq 2$
      009906 CF 00 04         [ 2] 4660 	jp syntax_error
      001AF4                       4661 2$: ; check for existing file of that name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009909 E6 02            [ 1] 4662 	ldw y,x ; file name pointer 
      00990B AB 03 C7         [ 4] 4663 	call search_file 
      00990E 00 03            [ 1] 4664 	jrnc 3$ 
      009910 35 03            [ 1] 4665 	ld a,#ERR_DUPLICATE 
      009912 00 02 FE         [ 2] 4666 	jp tb_error 
      001B00                       4667 3$:	;** write file name to flash **
      009915 CF 00 06         [ 2] 4668 	ldw x,ffree 
      009918 4F 85 5B         [ 1] 4669 	ld a,ffree+2 
      00991B 02 89 81         [ 2] 4670 	ldw farptr,x 
      00991E C7 00 15         [ 1] 4671 	ld farptr+2,a 
      00991E 72 01 00         [ 2] 4672 	ldw x,#pad  
      009921 25 02 4F         [ 4] 4673 	call strlen 
      009924 81               [ 1] 4674 	incw  x
      009925 89               [ 2] 4675 	pushw x 
      009925 72               [ 1] 4676 	clrw x   
      009926 09 00 25 12      [ 2] 4677 	ldw y,#pad 
      00992A 5B 02 CD         [ 4] 4678 	call write_block  
      001B1C                       4679 	_drop 2 ; drop pushed X 
      00992D 96 75            [ 2]    1     addw sp,#2 
                                   4680 ;** write file length after name **
      00992F 5B 06 72         [ 2] 4681 	ldw x,txtend 
      009932 19 00 25 72      [ 2] 4682 	subw x,txtbgn
      009936 10               [ 2] 4683 	pushw x ; file size 
      009937 00               [ 1] 4684 	clrw x 
      009938 25 CC            [ 1] 4685 	ld a,(1,sp)
      00993A 88 0D CE         [ 4] 4686 	call write_byte 
      00993D 00               [ 1] 4687 	incw x 
      00993E 1C C3            [ 1] 4688 	ld a,(2,sp)
      009940 00 1E 2B         [ 4] 4689 	call write_byte
      009943 02               [ 1] 4690 	incw x  
      009944 4F 81 CD         [ 4] 4691 	call incr_farptr ; move farptr after SIZE field 
                                   4692 ;** write BASIC text **
                                   4693 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009947 93 E3            [ 2] 4694 	ldw x,(1,sp)
      009949 5B               [ 2] 4695 	pushw x 
      00994A 02               [ 1] 4696 	clrw x 
      00994B CE 00 1C CF      [ 2] 4697 	ldw y,txtbgn  ; BASIC text to save 
      00994F 00 04 E6         [ 4] 4698 	call write_block 
      001B41                       4699 	_drop 2 ;  drop BSIZE argument
      009952 02 C7            [ 2]    1     addw sp,#2 
                                   4700 ; save farptr in ffree
      009954 00 03 FE         [ 2] 4701 	ldw x,farptr 
      009957 CF 00 06         [ 1] 4702 	ld a,farptr+2 
      00995A 35 03 00         [ 2] 4703 	ldw ffree,x 
      00995D 02 72 10         [ 1] 4704 	ld ffree+2,a
                                   4705 ; write 4 zero bytes as a safe gard 
      009960 00               [ 1] 4706     clrw x 
      009961 25               [ 1] 4707 	clr a 
      009962 CC 88 0D         [ 4] 4708 	call write_byte 
      009965 5C               [ 1] 4709 	incw x 
      009965 AE               [ 1] 4710 	clr a 
      009966 17 FF 94         [ 4] 4711 	call write_byte
      009969 72               [ 1] 4712 	incw x 
      00996A 11               [ 1] 4713 	clr a 
      00996B 00 25 72         [ 4] 4714 	call write_byte
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4715 ; display saved size  
      00996E 19               [ 2] 4716 	popw x ; first copy of BSIZE 
      00996F 00 25            [ 1] 4717 	ld a,#TK_INTGR 
      009971 CC               [ 4] 4718 	ret 
                                   4719 
                                   4720 
                                   4721 ;------------------------
                                   4722 ; BASIC: LOAD "file" 
                                   4723 ; load file to RAM 
                                   4724 ; for execution 
                                   4725 ;------------------------
      001B62                       4726 load:
      009972 87 A9 00 24 07   [ 2] 4727 	btjf flags,#FRUN,0$ 
      009974 27 05            [ 1] 4728 	jreq 0$ 
      009974 CD 92            [ 1] 4729 	ld a,#ERR_CMD_ONLY 
      009976 2A A1 02         [ 2] 4730 	jp tb_error 
      001B6E                       4731 0$:	
      009979 27 03 CC         [ 4] 4732 	call next_token 
      00997C 87 57            [ 1] 4733 	cp a,#TK_QSTR
      00997E CE 00            [ 1] 4734 	jreq 1$
      009980 1A EE 02         [ 2] 4735 	jp syntax_error 
      001B78                       4736 1$:	
      009983 9F 4A            [ 1] 4737 	ldw y,x 
      009985 4E 48 48         [ 4] 4738 	call search_file 
      009988 AB 3E            [ 1] 4739 	jrc 2$ 
      00998A C7 50            [ 1] 4740 	ld a,#ERR_NOT_FILE
      00998C F3 CD 90         [ 2] 4741 	jp tb_error  
      001B84                       4742 2$:	
      00998F 07 CD 9E         [ 4] 4743 	call incr_farptr  
      009992 5A CD 90         [ 4] 4744 	call clear_basic  
      009995 2E               [ 1] 4745 	clrw x
      009996 A6 1F C7 50      [ 5] 4746 	ldf a,([farptr],x)
      00999A F3 81            [ 1] 4747 	ld yh,a 
      00999C 5C               [ 1] 4748 	incw x  
      00999C CD 92 2A A1      [ 5] 4749 	ldf a,([farptr],x)
      0099A0 02               [ 1] 4750 	incw x 
      0099A1 27 03            [ 1] 4751 	ld yl,a 
      0099A3 CC 87 57 AE      [ 2] 4752 	addw y,txtbgn
      0099A7 00 02 72 DE      [ 2] 4753 	ldw txtend,y
      0099AB 00 1A 5D 27      [ 2] 4754 	ldw y,txtbgn
      001BA5                       4755 3$:	; load BASIC text 	
      0099AF 1C 72 CE 00      [ 5] 4756 	ldf a,([farptr],x)
      0099B3 1A 9F            [ 1] 4757 	ld (y),a 
      0099B5 A4               [ 1] 4758 	incw x 
      0099B6 07 4E            [ 1] 4759 	incw y 
      0099B8 C7 54 01 72      [ 2] 4760 	cpw y,txtend 
      0099BC 16 54            [ 1] 4761 	jrmi 3$
                                   4762 ; return loaded size 	 
      0099BE 02 72 10         [ 2] 4763 	ldw x,txtend 
      0099C1 54 01 AE 00      [ 2] 4764 	subw x,txtbgn
      0099C5 1B 5A 9D         [ 4] 4765 	call print_int 
      0099C8 26               [ 4] 4766 	ret 
                                   4767 
                                   4768 ;-----------------------------------
                                   4769 ; BASIC: FORGET ["file_name"] 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4770 ; erase file_name and all others 
                                   4771 ; after it. 
                                   4772 ; without argument erase all files 
                                   4773 ;-----------------------------------
      001BBF                       4774 forget:
      0099C9 FA 20 04         [ 4] 4775 	call next_token 
      0099CC 72 11            [ 1] 4776 	cp a,#TK_NONE 
      0099CE 54 01            [ 1] 4777 	jreq 3$ 
      0099D0 AE 00            [ 1] 4778 	cp a,#TK_QSTR
      0099D2 02 CD            [ 1] 4779 	jreq 1$
      0099D4 90 6B 81         [ 2] 4780 	jp syntax_error
      0099D7 90 93            [ 1] 4781 1$: ldw y,x
      0099D7 A6 09 CD         [ 4] 4782 	call search_file
      0099DA 92 1D            [ 1] 4783 	jrc 2$
      0099DC CD 88            [ 1] 4784 	ld a,#ERR_NOT_FILE 
      0099DE 3D A1 02         [ 2] 4785 	jp tb_error 
      001BD9                       4786 2$: 
      0099E1 27 03 CC         [ 2] 4787 	ldw x,farptr
      0099E4 87 57 89         [ 1] 4788 	ld a,farptr+2
      0099E7 A6 0A            [ 2] 4789 	jra 4$ 
      001BE1                       4790 3$: ; forget all files 
      0099E9 CD 92 1D         [ 2] 4791 	ldw x,#fdrive
      0099EC 85               [ 1] 4792 	clr a 
      0099ED A3               [ 1] 4793 	rrwa x 
      0099EE 00 10 25         [ 2] 4794 	ldw farptr,x 
      0099F1 05 A6 0A         [ 1] 4795 	ld farptr+2,a 
      001BEC                       4796 4$:
      0099F4 CC 87 59         [ 2] 4797 	ldw ffree,x 
      0099F7 9F C7 54         [ 1] 4798 	ld ffree+2,a 
      0099FA 00               [ 1] 4799 5$:	clrw x 
      0099FB 72               [ 1] 4800 	clr a  
      0099FC 10 54 01         [ 4] 4801 	call write_byte 
      0099FF 72 0F 54         [ 2] 4802 	ldw x,#1 
      009A02 00 FB CE         [ 4] 4803 	call incr_farptr
      009A05 54 04 A6         [ 1] 4804 	ld a,farptr
      009A08 02 81 16         [ 1] 4805 	cp a,ffree 
      009A0A 2B ED            [ 1] 4806 	jrmi 5$ 
      009A0A 72 00 00         [ 2] 4807 	ldw x,farptr+1 
      009A0D 25 02 4F         [ 2] 4808 	cpw x,ffree+1
      009A10 81 E5            [ 1] 4809 	jrmi 5$
      009A11 81               [ 4] 4810 	ret 
                                   4811 
                                   4812 ;----------------------
                                   4813 ; BASIC: DIR 
                                   4814 ; list saved files 
                                   4815 ;----------------------
                           000001  4816 	COUNT=1 ; files counter 
                           000002  4817 	VSIZE=2 
      001C0E                       4818 directory:
      001C0E                       4819 	_vars VSIZE 
      009A11 AE 9A            [ 2]    1     sub sp,#VSIZE 
      009A13 3B               [ 1] 4820 	clrw x 
      009A14 CD 82            [ 2] 4821 	ldw (COUNT,sp),x 
      009A16 30 5B 02         [ 2] 4822 	ldw farptr+1,x 
      009A19 52 06 CD 96      [ 1] 4823 	mov farptr,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      001C1A                       4824 dir_loop:
      009A1D 60               [ 1] 4825 	clrw x 
      009A1E AE 16 C8 CF      [ 5] 4826 	ldf a,([farptr],x)
      009A22 00 04            [ 1] 4827 	jreq 8$ 
      001C21                       4828 1$: ;name loop 	
      009A24 7F 72 5F 00      [ 5] 4829 	ldf a,([farptr],x)
      009A28 03 5F            [ 1] 4830 	jreq 2$ 
      009A2A CF 00 06         [ 4] 4831 	call putc 
      009A2D CF               [ 1] 4832 	incw x 
      009A2E 00 01            [ 2] 4833 	jra 1$
      009A30 72               [ 1] 4834 2$: incw x ; skip ending 0. 
      009A31 11 00            [ 1] 4835 	ld a,#SPACE 
      009A33 25 72 18         [ 4] 4836 	call putc 
                                   4837 ; get file size 	
      009A36 00 25 CC 88      [ 5] 4838 	ldf a,([farptr],x)
      009A3A 0D 0A            [ 1] 4839 	ld yh,a 
      009A3C 62               [ 1] 4840 	incw x 
      009A3D 72 65 61 6B      [ 5] 4841 	ldf a,([farptr],x)
      009A41 20               [ 1] 4842 	incw x 
      009A42 70 6F            [ 1] 4843 	ld yl,a 
      009A44 69 6E            [ 2] 4844 	pushw y 
      009A46 74 2C 20         [ 2] 4845 	addw x,(1,sp)
      009A49 52 55 4E         [ 4] 4846 	call incr_farptr 
      009A4C 20               [ 2] 4847 	popw x ; file size 
      009A4D 74 6F 20         [ 4] 4848 	call print_int 
      009A50 72 65            [ 1] 4849 	ld a,#CR 
      009A52 73 75 6D         [ 4] 4850 	call putc
      009A55 65 2E            [ 2] 4851 	ldw x,(COUNT,sp)
      009A57 0A               [ 1] 4852 	incw x
      009A58 00 01            [ 2] 4853 	ldw (COUNT,sp),x  
      009A59 20 C1            [ 2] 4854 	jra dir_loop 
      001C59                       4855 8$: ; print number of files 
      009A59 72 01            [ 2] 4856 	ldw x,(COUNT,sp)
      009A5B 00 25 02         [ 4] 4857 	call print_int 
      009A5E 4F 81 8E         [ 2] 4858 	ldw x,#file_count 
      009A60 CD 01 B0         [ 4] 4859 	call puts  
                                   4860 ; print drive free space 	
      009A60 CD 86            [ 1] 4861 	ld a,#0xff 
      009A62 25 81 18         [ 1] 4862 	sub a,ffree+2 
      009A64 C7 00 0A         [ 1] 4863 	ld acc8,a 
      009A64 72 BB            [ 1] 4864 	ld a,#0x7f 
      009A66 00 15 24         [ 1] 4865 	sbc a,ffree+1 
      009A69 04 72 5C         [ 1] 4866 	ld acc16,a 
      009A6C 00 14            [ 1] 4867 	ld a,#2 
      009A6E CF 00 15         [ 1] 4868 	sbc a,ffree 
      009A71 81 00 08         [ 1] 4869 	ld acc24,a 
      009A72 5F               [ 1] 4870 	clrw x  
      009A72 A6 01            [ 1] 4871 	ld a,#6 
      009A74 C7               [ 1] 4872 	ld xl,a 
      009A75 00 14            [ 1] 4873 	ld a,#10 
      009A77 5F CF 00         [ 4] 4874 	call prti24 
      009A7A 15 1C 96         [ 2] 4875 	ldw x,#drive_free
      009A7B CD 01 B0         [ 4] 4876 	call puts 
      001C8B                       4877 	_drop VSIZE 
      009A7B 5F 92            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009A7D AF               [ 4] 4878 	ret
      009A7E 00 14 26 15 5C 92 AF  4879 file_count: .asciz " files\n"
             00
      009A86 14 26 0E 5C 92 AF 00  4880 drive_free: .asciz " bytes free\n" 
             14 26 07 5C 92 AF
                                   4881 
                                   4882 ;---------------------
                                   4883 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   4884 ; write 1 or more byte to FLASH or EEPROM
                                   4885 ; starting at address  
                                   4886 ; input:
                                   4887 ;   expr1  	is address 
                                   4888 ;   expr2   is byte to write
                                   4889 ; output:
                                   4890 ;   none 
                                   4891 ;---------------------
                           000001  4892 	ADDR=1
                           000002  4893 	VSIZ=2 
      001CA3                       4894 write:
      001CA3                       4895 	_vars VSIZE 
      009A93 00 14            [ 2]    1     sub sp,#VSIZE 
      009A95 27 28 00 13      [ 1] 4896 	clr farptr ; expect 16 bits address 
      009A97 CD 12 A4         [ 4] 4897 	call expression
      009A97 1C 00            [ 1] 4898 	cp a,#TK_INTGR 
      009A99 01 CD            [ 1] 4899 	jreq 0$
      009A9B 9A 64 AE         [ 2] 4900 	jp syntax_error
      009A9E 02 7F            [ 2] 4901 0$: ldw (ADDR,sp),x 
      009AA0 C3 00 14         [ 4] 4902 	call next_token 
      009AA3 2A D6            [ 1] 4903 	cp a,#TK_COMMA 
      009AA5 72 5F            [ 1] 4904 	jreq 1$ 
      009AA7 00 17            [ 2] 4905 	jra 9$ 
      009AA9 72 5F 00         [ 4] 4906 1$:	call expression
      009AAC 18 72            [ 1] 4907 	cp a,#TK_INTGR
      009AAE 5F 00            [ 1] 4908 	jreq 2$
      009AB0 19 72 5F         [ 2] 4909 	jp syntax_error
      009AB3 00               [ 1] 4910 2$:	ld a,xl 
      009AB4 09 72            [ 2] 4911 	ldw x,(ADDR,sp) 
      009AB6 5F 00 0A         [ 2] 4912 	ldw farptr+1,x 
      009AB9 72               [ 1] 4913 	clrw x 
      009ABA 5F 00 0B         [ 4] 4914 	call write_byte
      009ABD 20 1A            [ 2] 4915 	ldw x,(ADDR,sp)
      009ABF 5C               [ 1] 4916 	incw x 
      009ABF CE 00            [ 2] 4917 	jra 0$ 
      001CD7                       4918 9$:
      001CD7                       4919 	_drop VSIZE
      009AC1 15 A3            [ 2]    1     addw sp,#VSIZE 
      009AC3 00               [ 4] 4920 	ret 
                                   4921 
                                   4922 
                                   4923 ;---------------------
                                   4924 ;BASIC: CHAR(expr)
                                   4925 ; évaluate expression 
                                   4926 ; and take the 7 least 
                                   4927 ; bits as ASCII character
                                   4928 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      001CDA                       4929 char:
      009AC4 00 27            [ 1] 4930 	ld a,#TK_LPAREN 
      009AC6 06 AE 00         [ 4] 4931 	call expect 
      009AC9 01 CD 9A         [ 4] 4932 	call relation 
      009ACC 64 02            [ 1] 4933 	cp a,#TK_INTGR 
      009ACD 27 03            [ 1] 4934 	jreq 1$
      009ACD CE 00 14         [ 2] 4935 	jp syntax_error
      009AD0 C6               [ 2] 4936 1$:	pushw x 
      009AD1 00 16            [ 1] 4937 	ld a,#TK_RPAREN 
      009AD3 CF 00 17         [ 4] 4938 	call expect
      009AD6 C7               [ 2] 4939 	popw x  
      009AD7 00               [ 1] 4940 	ld a,xl 
      009AD8 19 81            [ 1] 4941 	and a,#0x7f 
      009ADA 97               [ 1] 4942 	ld xl,a
      009ADA 5F 92            [ 1] 4943 	ld a,#TK_CHAR
      009ADC AF               [ 4] 4944 	ret
                                   4945 
                                   4946 ;---------------------
                                   4947 ; BASIC: ASC(string|char)
                                   4948 ; extract first character 
                                   4949 ; of string argument 
                                   4950 ; return it as TK_INTGR 
                                   4951 ;---------------------
      001CF7                       4952 ascii:
      009ADD 00 14            [ 1] 4953 	ld a,#TK_LPAREN
      009ADF 90 F1 26         [ 4] 4954 	call expect 
      009AE2 08 4D 27         [ 4] 4955 	call next_token 
      009AE5 12 5C            [ 1] 4956 	cp a,#TK_QSTR 
      009AE7 90 5C            [ 1] 4957 	jreq 1$
      009AE9 20 F0            [ 1] 4958 	cp a,#TK_CHAR 
      009AEB 27 06            [ 1] 4959 	jreq 2$ 
      009AEB 4D 27 07         [ 2] 4960 	jp syntax_error
      001D0A                       4961 1$: 
      009AEE 5C               [ 1] 4962 	ld a,(x)
      009AEF 92 AF            [ 2] 4963 	jra 3$
      001D0D                       4964 2$: 
      009AF1 00               [ 1] 4965 	ld a,xl 
      009AF2 14               [ 1] 4966 3$:	ld xl,a 
      009AF3 20               [ 1] 4967 	clr a  
      009AF4 F6               [ 1] 4968 	ld xh,a 
      009AF5 5C               [ 2] 4969 	pushw x  
      009AF6 98 81            [ 1] 4970 	ld a,#TK_RPAREN 
      009AF8 CD 11 9D         [ 4] 4971 	call expect 
      009AF8 5C               [ 2] 4972 	popw x 
      009AF9 99 81            [ 1] 4973 	ld a,#TK_INTGR 
      009AFB 81               [ 4] 4974 	ret 
                                   4975 
                                   4976 ;---------------------
                                   4977 ;BASIC: KEY
                                   4978 ; wait for a character 
                                   4979 ; received from STDIN 
                                   4980 ; input:
                                   4981 ;	none 
                                   4982 ; output:
                                   4983 ;	X 		ASCII character 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   4984 ;---------------------
      001D1B                       4985 key:
      009AFB 52 04 17         [ 4] 4986 	call getc 
      009AFE 03               [ 1] 4987 	clrw x 
      009AFF 5F               [ 1] 4988 	ld xl,a 
      009B00 CF 00            [ 1] 4989 	ld a,#TK_INTGR
      009B02 15               [ 4] 4990 	ret
                                   4991 
                                   4992 ;----------------------
                                   4993 ; BASIC: QKEY
                                   4994 ; Return true if there 
                                   4995 ; is a character in 
                                   4996 ; waiting in STDIN 
                                   4997 ; input:
                                   4998 ;  none 
                                   4999 ; output:
                                   5000 ;   X 		0|1 
                                   5001 ;-----------------------
      001D23                       5002 qkey: 
      009B03 35               [ 1] 5003 	clrw x 
      009B04 01 00 14 40 01   [ 2] 5004 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      009B07 5C               [ 1] 5005 	incw x 
      009B07 92 BC            [ 1] 5006 9$: ld a,#TK_INTGR
      009B09 00               [ 4] 5007 	ret 
                                   5008 
                                   5009 ;---------------------
                                   5010 ; BASIC: GPIO(expr,reg)
                                   5011 ; return gpio address 
                                   5012 ; expr {0..8}
                                   5013 ; input:
                                   5014 ;   none 
                                   5015 ; output:
                                   5016 ;   X 		gpio register address
                                   5017 ;----------------------------
      001D2D                       5018 gpio:
      009B0A 14 27            [ 1] 5019 	ld a,#TK_LPAREN 
      009B0C 24 5F 16         [ 4] 5020 	call expect 
      009B0F 03 CD 9A         [ 4] 5021 	call arg_list
      009B12 DA 25            [ 1] 5022 	cp a,#2
      009B14 2C 92            [ 1] 5023 	jreq 1$
      009B16 AF 00 14         [ 2] 5024 	jp syntax_error  
      001D3C                       5025 1$:	
      009B19 6B 01            [ 1] 5026 	ld a,#TK_RPAREN 
      009B1B 5C 92 AF         [ 4] 5027 	call expect 
      009B1E 00 14 6B         [ 2] 5028 	ldw x,#2
      009B21 02 5C 72 FB      [ 5] 5029 	ldw x,([dstkptr],x) ; port 
      009B25 01 CD            [ 1] 5030 	jrmi bad_port
      009B27 9A 64 AE         [ 2] 5031 	cpw x,#9
      009B2A 02 80            [ 1] 5032 	jrpl bad_port
      009B2C C3 00            [ 1] 5033 	ld a,#5
      009B2E 14               [ 4] 5034 	mul x,a
      009B2F 2A D6 00         [ 2] 5035 	addw x,#GPIO_BASE 
      009B31 89               [ 2] 5036 	pushw x 
      009B31 72 5F 00         [ 4] 5037 	call dpop 
      009B34 14 72 5F         [ 2] 5038 	addw x,(1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009B37 00 15            [ 2] 5039 	ldw (1,sp),x  
      009B39 72 5F 00         [ 4] 5040 	call ddrop  
      009B3C 16               [ 2] 5041 	popw x 
      009B3D 5B 04            [ 1] 5042 	ld a,#TK_INTGR
      009B3F 98               [ 4] 5043 	ret
      001D65                       5044 bad_port:
      009B40 81 0A            [ 1] 5045 	ld a,#ERR_BAD_VALUE
      009B41 CC 06 D9         [ 2] 5046 	jp tb_error
                                   5047 
                                   5048 ;----------------------
                                   5049 ; BASIC: ODR 
                                   5050 ; return offset of gpio
                                   5051 ; ODR register: 0
                                   5052 ; ---------------------
      001D6A                       5053 port_odr:
      009B41 5B 04 99         [ 2] 5054 	ldw x,#GPIO_ODR
      009B44 81 02            [ 1] 5055 	ld a,#TK_INTGR
      009B45 81               [ 4] 5056 	ret
                                   5057 
                                   5058 ;----------------------
                                   5059 ; BASIC: IDR 
                                   5060 ; return offset of gpio
                                   5061 ; IDR register: 1
                                   5062 ; ---------------------
      001D70                       5063 port_idr:
      009B45 72 01 00         [ 2] 5064 	ldw x,#GPIO_IDR
      009B48 25 05            [ 1] 5065 	ld a,#TK_INTGR
      009B4A A6               [ 4] 5066 	ret
                                   5067 
                                   5068 ;----------------------
                                   5069 ; BASIC: DDR 
                                   5070 ; return offset of gpio
                                   5071 ; DDR register: 2
                                   5072 ; ---------------------
      001D76                       5073 port_ddr:
      009B4B 07 CC 87         [ 2] 5074 	ldw x,#GPIO_DDR
      009B4E 59 02            [ 1] 5075 	ld a,#TK_INTGR
      009B4F 81               [ 4] 5076 	ret
                                   5077 
                                   5078 ;----------------------
                                   5079 ; BASIC: CRL  
                                   5080 ; return offset of gpio
                                   5081 ; CR1 register: 3
                                   5082 ; ---------------------
      001D7C                       5083 port_cr1:
      009B4F CE 00 1E         [ 2] 5084 	ldw x,#GPIO_CR1
      009B52 72 B0            [ 1] 5085 	ld a,#TK_INTGR
      009B54 00               [ 4] 5086 	ret
                                   5087 
                                   5088 ;----------------------
                                   5089 ; BASIC: CRH  
                                   5090 ; return offset of gpio
                                   5091 ; CR2 register: 4
                                   5092 ; ---------------------
      001D82                       5093 port_cr2:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009B55 1C 26 02         [ 2] 5094 	ldw x,#GPIO_CR2
      009B58 4F 81            [ 1] 5095 	ld a,#TK_INTGR
      009B5A 81               [ 4] 5096 	ret
                                   5097 
                                   5098 ;-------------------------
                                   5099 ; BASIC: UFLASH 
                                   5100 ; return user flash address
                                   5101 ; input:
                                   5102 ;  none 
                                   5103 ; output:
                                   5104 ;	A		TK_INTGR
                                   5105 ;   X 		user address 
                                   5106 ;---------------------------
      001D88                       5107 uflash:
      009B5A C6 00 17         [ 2] 5108 	ldw x,#user_space 
      009B5D CA 00            [ 1] 5109 	ld a,#TK_INTGR 
      009B5F 18               [ 4] 5110 	ret 
                                   5111 
                                   5112 ;-------------------------
                                   5113 ; BASIC: EEPROM 
                                   5114 ; return eeprom address
                                   5115 ; input:
                                   5116 ;  none 
                                   5117 ; output:
                                   5118 ;	A		TK_INTGR
                                   5119 ;   X 		eeprom address 
                                   5120 ;---------------------------
      001D8E                       5121 eeprom:
      009B60 CA 00 19         [ 2] 5122 	ldw x,#EEPROM_BASE 
      009B63 26 05            [ 1] 5123 	ld a,#TK_INTGR 
      009B65 A6               [ 4] 5124 	ret 
                                   5125 
                                   5126 ;---------------------
                                   5127 ; BASIC: USR(addr[,arg])
                                   5128 ; execute a function written 
                                   5129 ; in binary code.
                                   5130 ; binary fonction should 
                                   5131 ; return token attribute in A 
                                   5132 ; and value in X. 
                                   5133 ; input:
                                   5134 ;   addr	routine address 
                                   5135 ;   arg 	is an optional argument 
                                   5136 ; output:
                                   5137 ;   A 		token attribute 
                                   5138 ;   X       returned value 
                                   5139 ;---------------------
      001D94                       5140 usr:
      009B66 01 CC            [ 2] 5141 	pushw y 	
      009B68 87 59            [ 1] 5142 	ld a,#TK_LPAREN 
      009B6A CD 88 3D         [ 4] 5143 	call expect 
      009B6D A1 08 27         [ 4] 5144 	call arg_list 
      009B70 03 CC            [ 1] 5145 	cp a,#1 
      009B72 87 57            [ 1] 5146 	jrpl 2$ 
      009B74 CC 06 D7         [ 2] 5147 	jp syntax_error 
      009B74 90 93            [ 1] 5148 2$: ld a,#TK_RPAREN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009B76 CD 9A FB         [ 4] 5149 	call expect 
      009B79 24 05 A6         [ 4] 5150 	call dpop 
      009B7C 08 CC            [ 1] 5151 	cp a,#2 
      009B7E 87 59            [ 1] 5152 	jrmi 4$
      009B80 90 93            [ 1] 5153 	ldw y,x ; y=arg 
      009B80 CE 00 17         [ 4] 5154 	call dpop ;x=addr 
      009B83 C6               [ 1] 5155 4$:	exgw y,x ; y=addr,x=arg 
      009B84 00 19            [ 4] 5156 	call (y)
      009B86 CF 00            [ 2] 5157 	popw y 
      009B88 14               [ 4] 5158 	ret 
                                   5159 
                                   5160 ;------------------------------
                                   5161 ; BASIC: BYE 
                                   5162 ; halt mcu in its lowest power mode 
                                   5163 ; wait for reset or external interrupt
                                   5164 ; do a cold start on wakeup.
                                   5165 ;------------------------------
      001DBC                       5166 bye:
      009B89 C7 00 16 AE 17   [ 2] 5167 	btjf UART3_SR,#UART_SR_TC,.
      009B8E 18               [10] 5168 	halt
      009B8F CD 82 F2         [ 2] 5169 	jp cold_start  
                                   5170 
                                   5171 ;----------------------------------
                                   5172 ; BASIC: SLEEP 
                                   5173 ; halt mcu until reset or external
                                   5174 ; interrupt.
                                   5175 ; Resume progam after SLEEP command
                                   5176 ;----------------------------------
      001DC5                       5177 sleep:
      009B92 5C 89 5F 90 AE   [ 2] 5178 	btjf UART3_SR,#UART_SR_TC,.
      009B97 17 18 CD 81      [ 1] 5179 	bset flags,#FSLEEP
      009B9B D1               [10] 5180 	halt 
      009B9C 5B               [ 4] 5181 	ret 
                                   5182 
                                   5183 ;-------------------------------
                                   5184 ; BASIC: PAUSE expr 
                                   5185 ; suspend execution for n msec.
                                   5186 ; input:
                                   5187 ;	none
                                   5188 ; output:
                                   5189 ;	none 
                                   5190 ;------------------------------
      001DD0                       5191 pause:
      009B9D 02 CE 00         [ 4] 5192 	call expression
      009BA0 1E 72            [ 1] 5193 	cp a,#TK_INTGR
      009BA2 B0 00            [ 1] 5194 	jreq pause02 
      009BA4 1C 89 5F         [ 2] 5195 	jp syntax_error
      001DDA                       5196 pause02: 
      009BA7 7B               [ 2] 5197 1$: tnzw x 
      009BA8 01 CD            [ 1] 5198 	jreq 2$
      009BAA 81               [10] 5199 	wfi 
      009BAB 5C               [ 2] 5200 	decw x 
      009BAC 5C 7B            [ 1] 5201 	jrne 1$
      009BAE 02               [ 1] 5202 2$:	clr a 
      009BAF CD               [ 4] 5203 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5204 
                                   5205 ;------------------------------
                                   5206 ; BASIC: TICKS
                                   5207 ; return msec ticks counter value 
                                   5208 ; input:
                                   5209 ; 	none 
                                   5210 ; output:
                                   5211 ;	X 		TK_INTGR
                                   5212 ;-------------------------------
      001DE3                       5213 get_ticks:
      009BB0 81 5C 5C         [ 2] 5214 	ldw x,ticks 
      009BB3 CD 9A            [ 1] 5215 	ld a,#TK_INTGR
      009BB5 64               [ 4] 5216 	ret 
                                   5217 
                                   5218 
                                   5219 
                                   5220 ;------------------------------
                                   5221 ; BASIC: ABS(expr)
                                   5222 ; return absolute value of expr.
                                   5223 ; input:
                                   5224 ;   none
                                   5225 ; output:
                                   5226 ;   X     	positive integer
                                   5227 ;-------------------------------
      001DE9                       5228 abs:
      009BB6 1E 01            [ 1] 5229 	ld a,#TK_LPAREN
      009BB8 89 5F 90         [ 4] 5230 	call expect 
      009BBB CE 00 1C         [ 4] 5231 	call arg_list
      009BBE CD 81            [ 1] 5232 	cp a,#1 
      009BC0 D1 5B            [ 1] 5233 	jreq 0$ 
      009BC2 02 CE 00         [ 2] 5234 	jp syntax_error
      001DF8                       5235 0$:  
      009BC5 14 C6            [ 1] 5236 	ld a,#TK_RPAREN 
      009BC7 00 16 CF         [ 4] 5237 	call expect 
      009BCA 00 17 C7         [ 4] 5238     call dpop   
      009BCD 00               [ 1] 5239 	ld a,xh 
      009BCE 19 5F            [ 1] 5240 	bcp a,#0x80 
      009BD0 4F CD            [ 1] 5241 	jreq 2$ 
      009BD2 81               [ 2] 5242 	negw x 
      009BD3 5C 5C            [ 1] 5243 2$: ld a,#TK_INTGR 
      009BD5 4F               [ 4] 5244 	ret 
                                   5245 
                                   5246 ;------------------------------
                                   5247 ; BASIC: RND(expr)
                                   5248 ; return random number 
                                   5249 ; between 1 and expr inclusive
                                   5250 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5251 ; input:
                                   5252 ; 	none 
                                   5253 ; output:
                                   5254 ;	X 		random positive integer 
                                   5255 ;------------------------------
      001E09                       5256 random:
      009BD6 CD 81            [ 1] 5257 	ld a,#TK_LPAREN 
      009BD8 5C 5C 4F         [ 4] 5258 	call expect 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009BDB CD 81 5C         [ 4] 5259 	call arg_list 
      009BDE 85 A6            [ 1] 5260 	cp a,#1
      009BE0 02 81            [ 1] 5261 	jreq 1$
      009BE2 CC 06 D7         [ 2] 5262 	jp syntax_error
      009BE2 72 01            [ 1] 5263 1$: ld a,#TK_RPAREN
      009BE4 00 25 07         [ 4] 5264 	call expect 
      009BE7 27 05 A6         [ 4] 5265 	call dpop 
      009BEA 07               [ 2] 5266 	pushw x 
      009BEB CC               [ 1] 5267 	ld a,xh 
      009BEC 87 59            [ 1] 5268 	bcp a,#0x80 
      009BEE 27 05            [ 1] 5269 	jreq 2$
      009BEE CD 88            [ 1] 5270 	ld a,#ERR_BAD_VALUE
      009BF0 3D A1 08         [ 2] 5271 	jp tb_error
      001E2B                       5272 2$: 
                                   5273 ; acc16=(x<<5)^x 
      009BF3 27 03 CC         [ 2] 5274 	ldw x,seedx 
      009BF6 87               [ 2] 5275 	sllw x 
      009BF7 57               [ 2] 5276 	sllw x 
      009BF8 58               [ 2] 5277 	sllw x 
      009BF8 90               [ 2] 5278 	sllw x 
      009BF9 93               [ 2] 5279 	sllw x 
      009BFA CD               [ 1] 5280 	ld a,xh 
      009BFB 9A FB 25         [ 1] 5281 	xor a,seedx 
      009BFE 05 A6 09         [ 1] 5282 	ld acc16,a 
      009C01 CC               [ 1] 5283 	ld a,xl 
      009C02 87 59 0E         [ 1] 5284 	xor a,seedx+1 
      009C04 C7 00 0A         [ 1] 5285 	ld acc8,a 
                                   5286 ; seedx=seedy 
      009C04 CD 9A 64         [ 2] 5287 	ldw x,seedy 
      009C07 CD 86 25         [ 2] 5288 	ldw seedx,x  
                                   5289 ; seedy=seedy^(seedy>>1)
      009C0A 5F 92            [ 2] 5290 	srlw y 
      009C0C AF 00            [ 1] 5291 	ld a,yh 
      009C0E 14 90 95         [ 1] 5292 	xor a,seedy 
      009C11 5C 92 AF         [ 1] 5293 	ld seedy,a  
      009C14 00 14            [ 1] 5294 	ld a,yl 
      009C16 5C 90 97         [ 1] 5295 	xor a,seedy+1 
      009C19 72 B9 00         [ 1] 5296 	ld seedy+1,a 
                                   5297 ; acc16>>3 
      009C1C 1C 90 CF         [ 2] 5298 	ldw x,acc16 
      009C1F 00               [ 2] 5299 	srlw x 
      009C20 1E               [ 2] 5300 	srlw x 
      009C21 90               [ 2] 5301 	srlw x 
                                   5302 ; x=acc16^x 
      009C22 CE               [ 1] 5303 	ld a,xh 
      009C23 00 1C 09         [ 1] 5304 	xor a,acc16 
      009C25 95               [ 1] 5305 	ld xh,a 
      009C25 92               [ 1] 5306 	ld a,xl 
      009C26 AF 00 14         [ 1] 5307 	xor a,acc8 
      009C29 90               [ 1] 5308 	ld xl,a 
                                   5309 ; seedy=x^seedy 
      009C2A F7 5C 90         [ 1] 5310 	xor a,seedy+1
      009C2D 5C               [ 1] 5311 	ld xl,a 
      009C2E 90               [ 1] 5312 	ld a,xh 
      009C2F C3 00 1E         [ 1] 5313 	xor a,seedy
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009C32 2B               [ 1] 5314 	ld xh,a 
      009C33 F1 CE 00         [ 2] 5315 	ldw seedy,x 
                                   5316 ; return seedy modulo expr + 1 
      009C36 1E 72            [ 2] 5317 	popw y 
      009C38 B0               [ 2] 5318 	divw x,y 
      009C39 00               [ 1] 5319 	ldw x,y 
      009C3A 1C               [ 1] 5320 	incw x 
      009C3B CD 89            [ 1] 5321 	ld a,#TK_INTGR
      009C3D CF               [ 4] 5322 	ret 
                                   5323 
                                   5324 ;---------------------------------
                                   5325 ; BASIC: WORDS 
                                   5326 ; affiche la listes des mots du
                                   5327 ; dictionnaire.
                                   5328 ;---------------------------------
                           000001  5329 	WLEN=1
                           000002  5330 	LLEN=2  
                           000002  5331 	VSIZE=2 
      001E7D                       5332 words:
      001E7D                       5333 	_vars VSIZE
      009C3E 81 02            [ 2]    1     sub sp,#VSIZE 
      009C3F 0F 02            [ 1] 5334 	clr (LLEN,sp)
      009C3F CD 88 3D A1      [ 2] 5335 	ldw y,#kword_dict+2
      009C43 00               [ 1] 5336 0$:	ldw x,y
      009C44 27               [ 1] 5337 	ld a,(x)
      009C45 1B A1            [ 1] 5338 	and a,#15 
      009C47 08 27            [ 1] 5339 	ld (WLEN,sp),a 
      009C49 03               [ 1] 5340 1$:	incw x 
      009C4A CC               [ 1] 5341 	ld a,(x)
      009C4B 87 57 90         [ 4] 5342 	call putc 
      009C4E 93 CD            [ 1] 5343 	inc (LLEN,sp)
      009C50 9A FB            [ 1] 5344 	dec (WLEN,sp)
      009C52 25 05            [ 1] 5345 	jrne 1$
      009C54 A6 09            [ 1] 5346 	ld a,#70
      009C56 CC 87            [ 1] 5347 	cp a,(LLEN,sp)
      009C58 59 09            [ 1] 5348 	jrmi 2$   
      009C59 A6 20            [ 1] 5349 	ld a,#SPACE 
      009C59 CE 00 14         [ 4] 5350 	call putc 
      009C5C C6 00            [ 1] 5351 	inc (LLEN,sp) 
      009C5E 16 20            [ 2] 5352 	jra 3$
      009C60 0B 0D            [ 1] 5353 2$: ld a,#CR 
      009C61 CD 01 9E         [ 4] 5354 	call putc 
      009C61 AE 00            [ 1] 5355 	clr (LLEN,sp)
      009C63 00 4F 01 CF      [ 2] 5356 3$:	subw y,#2 
      009C67 00 14            [ 2] 5357 	ldw y,(y)
      009C69 C7 00            [ 1] 5358 	jrne 0$  
      001EB4                       5359 	_drop VSIZE 
      009C6B 16 02            [ 2]    1     addw sp,#VSIZE 
      009C6C 81               [ 4] 5360 	ret 
                                   5361 
                                   5362 
                                   5363 ;*********************************
                                   5364 
                                   5365 ;------------------------------
                                   5366 ;      dictionary 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5367 ; format:
                                   5368 ;   link:   2 bytes 
                                   5369 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5370 ;   cmd_name: 16 byte max 
                                   5371 ;   code_address: 2 bytes 
                                   5372 ;------------------------------
                           000080  5373 	FFUNC=128 ; function flag 
                                   5374 	.macro _dict_entry len,name,cmd 
                                   5375 	.word LINK 
                                   5376 	LINK=.
                                   5377 name:
                                   5378 	.byte len 	
                                   5379 	.ascii "name"
                                   5380 	.word cmd 
                                   5381 	.endm 
                                   5382 
                           000000  5383 	LINK=0
      001EB7                       5384 kword_end:
      001EB7                       5385 	_dict_entry,3,BYE,bye 
      009C6C CF 00                    1 	.word LINK 
                           001EB9     2 	LINK=.
      001EB9                          3 BYE:
      009C6E 17                       4 	.byte 3 	
      009C6F C7 00 19                 5 	.ascii "BYE"
      009C72 5F 4F                    6 	.word bye 
      001EBF                       5386 	_dict_entry,5,WORDS,words 
      009C74 CD 81                    1 	.word LINK 
                           001EC1     2 	LINK=.
      001EC1                          3 WORDS:
      009C76 5C                       4 	.byte 5 	
      009C77 AE 00 01 CD 9A           5 	.ascii "WORDS"
      009C7C 64 C6                    6 	.word words 
      001EC9                       5387 	_dict_entry,5,SLEEP,sleep 
      009C7E 00 14                    1 	.word LINK 
                           001ECB     2 	LINK=.
      001ECB                          3 SLEEP:
      009C80 C1                       4 	.byte 5 	
      009C81 00 17 2B ED CE           5 	.ascii "SLEEP"
      009C86 00 15                    6 	.word sleep 
      001ED3                       5388 	_dict_entry,6,FORGET,forget 
      009C88 C3 00                    1 	.word LINK 
                           001ED5     2 	LINK=.
      001ED5                          3 FORGET:
      009C8A 18                       4 	.byte 6 	
      009C8B 2B E5 81 47 45 54        5 	.ascii "FORGET"
      009C8E 1B BF                    6 	.word forget 
      001EDE                       5389 	_dict_entry,3,DIR,directory 
      009C8E 52 02                    1 	.word LINK 
                           001EE0     2 	LINK=.
      001EE0                          3 DIR:
      009C90 5F                       4 	.byte 3 	
      009C91 1F 01 CF                 5 	.ascii "DIR"
      009C94 00 15                    6 	.word directory 
      001EE6                       5390 	_dict_entry,4,LOAD,load 
      009C96 35 01                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



                           001EE8     2 	LINK=.
      001EE8                          3 LOAD:
      009C98 00                       4 	.byte 4 	
      009C99 14 4F 41 44              5 	.ascii "LOAD"
      009C9A 1B 62                    6 	.word load 
      001EEF                       5391 	_dict_entry,4,SAVE,save
      009C9A 5F 92                    1 	.word LINK 
                           001EF1     2 	LINK=.
      001EF1                          3 SAVE:
      009C9C AF                       4 	.byte 4 	
      009C9D 00 14 27 38              5 	.ascii "SAVE"
      009CA1 1A C5                    6 	.word save 
      001EF8                       5392 	_dict_entry,5,WRITE,write  
      009CA1 92 AF                    1 	.word LINK 
                           001EFA     2 	LINK=.
      001EFA                          3 WRITE:
      009CA3 00                       4 	.byte 5 	
      009CA4 14 27 06 CD 82           5 	.ascii "WRITE"
      009CA9 1E 5C                    6 	.word write 
      001F02                       5393 	_dict_entry,3,NEW,new
      009CAB 20 F4                    1 	.word LINK 
                           001F04     2 	LINK=.
      001F04                          3 NEW:
      009CAD 5C                       4 	.byte 3 	
      009CAE A6 20 CD                 5 	.ascii "NEW"
      009CB1 82 1E                    6 	.word new 
      001F0A                       5394 	_dict_entry,5,BREAK,break 
      009CB3 92 AF                    1 	.word LINK 
                           001F0C     2 	LINK=.
      001F0C                          3 BREAK:
      009CB5 00                       4 	.byte 5 	
      009CB6 14 90 95 5C 92           5 	.ascii "BREAK"
      009CBB AF 00                    6 	.word break 
      001F14                       5395 	_dict_entry,4,BEEP,beep 
      009CBD 14 5C                    1 	.word LINK 
                           001F16     2 	LINK=.
      001F16                          3 BEEP:
      009CBF 90                       4 	.byte 4 	
      009CC0 97 90 89 72              5 	.ascii "BEEP"
      009CC4 FB 01                    6 	.word beep 
      001F1D                       5396 	_dict_entry,4,STOP,stop 
      009CC6 CD 9A                    1 	.word LINK 
                           001F1F     2 	LINK=.
      001F1F                          3 STOP:
      009CC8 64                       4 	.byte 4 	
      009CC9 85 CD 89 CF              5 	.ascii "STOP"
      009CCD A6 0D                    6 	.word stop 
      001F26                       5397     _dict_entry,4,SHOW,show 
      009CCF CD 82                    1 	.word LINK 
                           001F28     2 	LINK=.
      001F28                          3 SHOW:
      009CD1 1E                       4 	.byte 4 	
      009CD2 1E 01 5C 1F              5 	.ascii "SHOW"
      009CD6 01 20                    6 	.word show 
      001F2F                       5398 	_dict_entry 3,RUN,run
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009CD8 C1 28                    1 	.word LINK 
                           001F31     2 	LINK=.
      009CD9                          3 RUN:
      009CD9 1E                       4 	.byte 3 	
      009CDA 01 CD 89                 5 	.ascii "RUN"
      009CDD CF AE                    6 	.word run 
      001F37                       5399 	_dict_entry 4,LIST,list
      009CDF 9D 0E                    1 	.word LINK 
                           001F39     2 	LINK=.
      001F39                          3 LIST:
      009CE1 CD                       4 	.byte 4 	
      009CE2 82 30 A6 FF              5 	.ascii "LIST"
      009CE6 C0 00                    6 	.word list 
      001F40                       5400 	_dict_entry,3+FFUNC,USR,usr
      009CE8 19 C7                    1 	.word LINK 
                           001F42     2 	LINK=.
      001F42                          3 USR:
      009CEA 00                       4 	.byte 3+FFUNC 	
      009CEB 0B A6 7F                 5 	.ascii "USR"
      009CEE C2 00                    6 	.word usr 
      001F48                       5401 	_dict_entry,6+FFUNC,EEPROM,eeprom 
      009CF0 18 C7                    1 	.word LINK 
                           001F4A     2 	LINK=.
      001F4A                          3 EEPROM:
      009CF2 00                       4 	.byte 6+FFUNC 	
      009CF3 0A A6 02 C2 00 17        5 	.ascii "EEPROM"
      009CF9 C7 00                    6 	.word eeprom 
      001F53                       5402 	_dict_entry,6+FFUNC,UFLASH,uflash 
      009CFB 09 5F                    1 	.word LINK 
                           001F55     2 	LINK=.
      001F55                          3 UFLASH:
      009CFD A6                       4 	.byte 6+FFUNC 	
      009CFE 06 97 A6 0A CD 89        5 	.ascii "UFLASH"
      009D04 87 AE                    6 	.word uflash 
      001F5E                       5403 	_dict_entry,3+FFUNC,ODR,port_odr
      009D06 9D 16                    1 	.word LINK 
                           001F60     2 	LINK=.
      001F60                          3 ODR:
      009D08 CD                       4 	.byte 3+FFUNC 	
      009D09 82 30 5B                 5 	.ascii "ODR"
      009D0C 02 81                    6 	.word port_odr 
      001F66                       5404 	_dict_entry,3+FFUNC,IDR,port_idr
      009D0E 20 66                    1 	.word LINK 
                           001F68     2 	LINK=.
      001F68                          3 IDR:
      009D10 69                       4 	.byte 3+FFUNC 	
      009D11 6C 65 73                 5 	.ascii "IDR"
      009D14 0A 00                    6 	.word port_idr 
      001F6E                       5405 	_dict_entry,3+FFUNC,DDR,port_ddr 
      009D16 20 62                    1 	.word LINK 
                           001F70     2 	LINK=.
      001F70                          3 DDR:
      009D18 79                       4 	.byte 3+FFUNC 	
      009D19 74 65 73                 5 	.ascii "DDR"
      009D1C 20 66                    6 	.word port_ddr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      001F76                       5406 	_dict_entry,3+FFUNC,CRL,port_cr1 
      009D1E 72 65                    1 	.word LINK 
                           001F78     2 	LINK=.
      001F78                          3 CRL:
      009D20 65                       4 	.byte 3+FFUNC 	
      009D21 0A 00 4C                 5 	.ascii "CRL"
      009D23 1D 7C                    6 	.word port_cr1 
      001F7E                       5407 	_dict_entry,3+FFUNC,CRH,port_cr2
      009D23 52 02                    1 	.word LINK 
                           001F80     2 	LINK=.
      001F80                          3 CRH:
      009D25 72                       4 	.byte 3+FFUNC 	
      009D26 5F 00 14                 5 	.ascii "CRH"
      009D29 CD 93                    6 	.word port_cr2 
      001F86                       5408 	_dict_entry,4+FFUNC,GPIO,gpio 
      009D2B 24 A1                    1 	.word LINK 
                           001F88     2 	LINK=.
      001F88                          3 GPIO:
      009D2D 02                       4 	.byte 4+FFUNC 	
      009D2E 27 03 CC 87              5 	.ascii "GPIO"
      009D32 57 1F                    6 	.word gpio 
      001F8F                       5409 	_dict_entry,6,PWRADC,power_adc 
      009D34 01 CD                    1 	.word LINK 
                           001F91     2 	LINK=.
      001F91                          3 PWRADC:
      009D36 88                       4 	.byte 6 	
      009D37 3D A1 0B 27 02 20        5 	.ascii "PWRADC"
      009D3D 19 CD                    6 	.word power_adc 
      001F9A                       5410 	_dict_entry,5+FFUNC,RDADC,read_adc
      009D3F 93 24                    1 	.word LINK 
                           001F9C     2 	LINK=.
      001F9C                          3 RDADC:
      009D41 A1                       4 	.byte 5+FFUNC 	
      009D42 02 27 03 CC 87           5 	.ascii "RDADC"
      009D47 57 9F                    6 	.word read_adc 
      001FA4                       5411 	_dict_entry,3+FFUNC,ASC,ascii  
      009D49 1E 01                    1 	.word LINK 
                           001FA6     2 	LINK=.
      001FA6                          3 ASC:
      009D4B CF                       4 	.byte 3+FFUNC 	
      009D4C 00 15 5F                 5 	.ascii "ASC"
      009D4F CD 81                    6 	.word ascii 
      001FAC                       5412 	_dict_entry,4+FFUNC,CHAR,char
      009D51 5C 1E                    1 	.word LINK 
                           001FAE     2 	LINK=.
      001FAE                          3 CHAR:
      009D53 01                       4 	.byte 4+FFUNC 	
      009D54 5C 20 DC 52              5 	.ascii "CHAR"
      009D57 1C DA                    6 	.word char 
      001FB5                       5413 	_dict_entry,4+FFUNC,QKEY,qkey  
      009D57 5B 02                    1 	.word LINK 
                           001FB7     2 	LINK=.
      001FB7                          3 QKEY:
      009D59 81                       4 	.byte 4+FFUNC 	
      009D5A 51 4B 45 59              5 	.ascii "QKEY"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009D5A A6 09                    6 	.word qkey 
      001FBE                       5414 	_dict_entry,3+FFUNC,KEY,key 
      009D5C CD 92                    1 	.word LINK 
                           001FC0     2 	LINK=.
      001FC0                          3 KEY:
      009D5E 1D                       4 	.byte 3+FFUNC 	
      009D5F CD 93 68                 5 	.ascii "KEY"
      009D62 A1 02                    6 	.word key 
      001FC6                       5415 	_dict_entry,4+FFUNC,SIZE,size
      009D64 27 03                    1 	.word LINK 
                           001FC8     2 	LINK=.
      001FC8                          3 SIZE:
      009D66 CC                       4 	.byte 4+FFUNC 	
      009D67 87 57 89 A6              5 	.ascii "SIZE"
      009D6B 0A CD                    6 	.word size 
      001FCF                       5416 	_dict_entry,3,HEX,hex_base
      009D6D 92 1D                    1 	.word LINK 
                           001FD1     2 	LINK=.
      001FD1                          3 HEX:
      009D6F 85                       4 	.byte 3 	
      009D70 9F A4 7F                 5 	.ascii "HEX"
      009D73 97 A6                    6 	.word hex_base 
      001FD7                       5417 	_dict_entry,3,DEC,dec_base
      009D75 05 81                    1 	.word LINK 
                           001FD9     2 	LINK=.
      009D77                          3 DEC:
      009D77 A6                       4 	.byte 3 	
      009D78 09 CD 92                 5 	.ascii "DEC"
      009D7B 1D CD                    6 	.word dec_base 
      001FDF                       5418 	_dict_entry,5+FFUNC,TICKS,get_ticks
      009D7D 88 3D                    1 	.word LINK 
                           001FE1     2 	LINK=.
      001FE1                          3 TICKS:
      009D7F A1                       4 	.byte 5+FFUNC 	
      009D80 08 27 07 A1 05           5 	.ascii "TICKS"
      009D85 27 06                    6 	.word get_ticks 
      001FE9                       5419 	_dict_entry,3+FFUNC,ABS,abs
      009D87 CC 87                    1 	.word LINK 
                           001FEB     2 	LINK=.
      001FEB                          3 ABS:
      009D89 57                       4 	.byte 3+FFUNC 	
      009D8A 41 42 53                 5 	.ascii "ABS"
      009D8A F6 20                    6 	.word abs 
      001FF1                       5420 	_dict_entry,3+FFUNC,RND,random 
      009D8C 01 EB                    1 	.word LINK 
                           001FF3     2 	LINK=.
      009D8D                          3 RND:
      009D8D 9F                       4 	.byte 3+FFUNC 	
      009D8E 97 4F 95                 5 	.ascii "RND"
      009D91 89 A6                    6 	.word random 
      001FF9                       5421 	_dict_entry,5,PAUSE,pause 
      009D93 0A CD                    1 	.word LINK 
                           001FFB     2 	LINK=.
      001FFB                          3 PAUSE:
      009D95 92                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      009D96 1D 85 A6 02 81           5 	.ascii "PAUSE"
      009D9B 1D D0                    6 	.word pause 
      002003                       5422 	_dict_entry,4,BSET,bit_set 
      009D9B CD 82                    1 	.word LINK 
                           002005     2 	LINK=.
      002005                          3 BSET:
      009D9D 27                       4 	.byte 4 	
      009D9E 5F 97 A6 02              5 	.ascii "BSET"
      009DA2 81 AA                    6 	.word bit_set 
      009DA3                       5423 	_dict_entry,4,BRES,bit_reset
      009DA3 5F 72                    1 	.word LINK 
                           00200E     2 	LINK=.
      00200E                          3 BRES:
      009DA5 0B                       4 	.byte 4 	
      009DA6 52 40 01 5C              5 	.ascii "BRES"
      009DAA A6 02                    6 	.word bit_reset 
      002015                       5424 	_dict_entry,5,BTOGL,bit_toggle
      009DAC 81 0E                    1 	.word LINK 
                           002017     2 	LINK=.
      009DAD                          3 BTOGL:
      009DAD A6                       4 	.byte 5 	
      009DAE 09 CD 92 1D CD           5 	.ascii "BTOGL"
      009DB3 92 2A                    6 	.word bit_toggle 
      00201F                       5425 	_dict_entry 4,WAIT,wait 
      009DB5 A1 02                    1 	.word LINK 
                           002021     2 	LINK=.
      002021                          3 WAIT:
      009DB7 27                       4 	.byte 4 	
      009DB8 03 CC 87 57              5 	.ascii "WAIT"
      009DBC 16 7F                    6 	.word wait 
      002028                       5426 	_dict_entry 6,REMARK,rem 
      009DBC A6 0A                    1 	.word LINK 
                           00202A     2 	LINK=.
      00202A                          3 REMARK:
      009DBE CD                       4 	.byte 6 	
      009DBF 92 1D AE 00 02 72        5 	.ascii "REMARK"
      009DC5 DE 00                    6 	.word rem 
      002033                       5427 	_dict_entry 5,PRINT,print 
      009DC7 1A 2B                    1 	.word LINK 
                           002035     2 	LINK=.
      002035                          3 PRINT:
      009DC9 1B                       4 	.byte 5 	
      009DCA A3 00 09 2A 16           5 	.ascii "PRINT"
      009DCF A6 05                    6 	.word print 
      00203D                       5428 	_dict_entry,2,IF,if 
      009DD1 42 1C                    1 	.word LINK 
                           00203F     2 	LINK=.
      00203F                          3 IF:
      009DD3 50                       4 	.byte 2 	
      009DD4 00 89                    5 	.ascii "IF"
      009DD6 CD 90                    6 	.word if 
      002044                       5429 	_dict_entry,5,GOSUB,gosub 
      009DD8 07 72                    1 	.word LINK 
                           002046     2 	LINK=.
      002046                          3 GOSUB:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009DDA FB                       4 	.byte 5 	
      009DDB 01 1F 01 CD 90           5 	.ascii "GOSUB"
      009DE0 2E 85                    6 	.word gosub 
      00204E                       5430 	_dict_entry,4,GOTO,goto 
      009DE2 A6 02                    1 	.word LINK 
                           002050     2 	LINK=.
      002050                          3 GOTO:
      009DE4 81                       4 	.byte 4 	
      009DE5 47 4F 54 4F              5 	.ascii "GOTO"
      009DE5 A6 0A                    6 	.word goto 
      002057                       5431 	_dict_entry,3,FOR,for 
      009DE7 CC 87                    1 	.word LINK 
                           002059     2 	LINK=.
      002059                          3 FOR:
      009DE9 59                       4 	.byte 3 	
      009DEA 46 4F 52                 5 	.ascii "FOR"
      009DEA AE 00                    6 	.word for 
      00205F                       5432 	_dict_entry,2,TO,to
      009DEC 00 A6                    1 	.word LINK 
                           002061     2 	LINK=.
      002061                          3 TO:
      009DEE 02                       4 	.byte 2 	
      009DEF 81 4F                    5 	.ascii "TO"
      009DF0 17 55                    6 	.word to 
      002066                       5433 	_dict_entry,4,STEP,step 
      009DF0 AE 00                    1 	.word LINK 
                           002068     2 	LINK=.
      002068                          3 STEP:
      009DF2 01                       4 	.byte 4 	
      009DF3 A6 02 81 50              5 	.ascii "STEP"
      009DF6 17 85                    6 	.word step 
      00206F                       5434 	_dict_entry,4,NEXT,next 
      009DF6 AE 00                    1 	.word LINK 
                           002071     2 	LINK=.
      002071                          3 NEXT:
      009DF8 02                       4 	.byte 4 	
      009DF9 A6 02 81 54              5 	.ascii "NEXT"
      009DFC 17 AD                    6 	.word next 
      002078                       5435 	_dict_entry,6+FFUNC,UBOUND,ubound 
      009DFC AE 00                    1 	.word LINK 
                           00207A     2 	LINK=.
      00207A                          3 UBOUND:
      009DFE 03                       4 	.byte 6+FFUNC 	
      009DFF A6 02 81 55 4E 44        5 	.ascii "UBOUND"
      009E02 13 63                    6 	.word ubound 
      002083                       5436 	_dict_entry,6,RETURN,return 
      009E02 AE 00                    1 	.word LINK 
                           002085     2 	LINK=.
      002085                          3 RETURN:
      009E04 04                       4 	.byte 6 	
      009E05 A6 02 81 55 52 4E        5 	.ascii "RETURN"
      009E08 18 7A                    6 	.word return 
      00208E                       5437 	_dict_entry,4+FFUNC,PEEK,peek 
      009E08 AE A1                    1 	.word LINK 
                           002090     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      002090                          3 PEEK:
      009E0A 80                       4 	.byte 4+FFUNC 	
      009E0B A6 02 81 4B              5 	.ascii "PEEK"
      009E0E 16 FA                    6 	.word peek 
      002097                       5438 	_dict_entry,4,POKE,poke 
      009E0E AE 40                    1 	.word LINK 
                           002099     2 	LINK=.
      002099                          3 POKE:
      009E10 00                       4 	.byte 4 	
      009E11 A6 02 81 45              5 	.ascii "POKE"
      009E14 16 E7                    6 	.word poke 
      0020A0                       5439 	_dict_entry,5,INPUT,input_var  
      009E14 90 89                    1 	.word LINK 
                           0020A2     2 	LINK=.
      0020A2                          3 INPUT:
      009E16 A6                       4 	.byte 5 	
      009E17 09 CD 92 1D CD           5 	.ascii "INPUT"
      009E1C 92 2A                    6 	.word input_var 
      0020AA                       5440 kword_dict:
      0020AA                       5441 	_dict_entry 3,LET,let 
      009E1E A1 01                    1 	.word LINK 
                           0020AC     2 	LINK=.
      0020AC                          3 LET:
      009E20 2A                       4 	.byte 3 	
      009E21 03 CC 87                 5 	.ascii "LET"
      009E24 57 A6                    6 	.word let 
                                   5442 	
                                   5443 
      002100                       5444 	.bndry 128 ; align on FLASH block.
                                   5445 ; free space for user application  
      002100                       5446 user_space:
                                   5447 ; USR() function test
      009E26 0A               [ 2] 5448 	pushw x 
      009E27 CD 92 1D CD      [ 1] 5449 	bset PC_ODR,#5 
      009E2B 90               [ 2] 5450 	popw x 
      009E2C 07 A1 02         [ 4] 5451 	call pause02 
      009E2F 2B 05 90 93      [ 1] 5452 	bres PC_ODR,#5 
      009E33 CD               [ 4] 5453 	ret
                                   5454 
                                   5455 	.area FLASH_DRIVE (ABS)
      010000                       5456 	.org 0x10000
      010000                       5457 fdrive:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        001FEB R   |     ADC_CR1 =  005401 
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
    ARG_OFS =  000002     |   5 ASC        001FA6 R   |     ATTRIB  =  000002 
    AWU_APR =  0050F1     |     AWU_CSR1=  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BASE_SAV=  000001     |   5 BEEP       001F16 R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |     BINARY  =  000001 
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BLOCK_ER=  000000 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  000005     |   5 BREAK      001F0C R   |   5 BRES       00200E R
  5 BSET       002005 R   |     BSIZE   =  000005     |     BSP     =  000008 
  5 BTOGL      002017 R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        001EB9 R   |     C       =  000001     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000000     |   5 CHAR       001FAE R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
    CLK_ECKR=  000001     |     CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0 
    CLK_ICKR=  000002     |     CLK_ICKR=  000000     |     CLK_ICKR=  000001 
    CLK_ICKR=  000003     |     CLK_ICKR=  000004     |     CLK_ICKR=  000005 
    CLK_PCKE=  0050C7     |     CLK_PCKE=  000000     |     CLK_PCKE=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
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
  5 CRH        001F80 R   |   5 CRL        001F78 R   |     CTRL_A  =  000001 
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
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        001F70 R
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        001FD9 R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        001EE0 R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
    DSTACK_S=  000040     |   5 EEPROM     001F4A R   |     EEPROM_B=  004000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_NC=  00505C     |     FLASH_NF=  00505E     |     FLASH_NF=  000000 
    FLASH_NF=  000001     |     FLASH_NF=  000002     |     FLASH_NF=  000003 
    FLASH_NF=  000004     |     FLASH_NF=  000005     |     FLASH_PU=  005062 
    FLASH_PU=  000056     |     FLASH_PU=  0000AE     |     FLASH_SI=  020000 
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   5 FOR        002059 R
  5 FORGET     001ED5 R   |     FRUN    =  000000     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FTRAP   =  000001     |   5 GOSUB      002046 R
    GOS_RET =  000003     |   5 GOTO       002050 R   |   5 GPIO       001F88 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   5 HEX        001FD1 R   |     HSECNT  =  004809 
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
  5 IDR        001F68 R   |   5 IF         00203F R   |     IN      =  000007 
    INCR    =  000001     |   5 INPUT      0020A2 R   |     INPUT_DI=  000000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Symbol Table

    ITC_SPR2=  007F71     |     ITC_SPR3=  007F72     |     ITC_SPR4=  007F73 
    ITC_SPR5=  007F74     |     ITC_SPR6=  007F75     |     ITC_SPR7=  007F76 
    ITC_SPR8=  007F77     |     IWDG_KR =  0050E0     |     IWDG_PR =  0050E1 
    IWDG_RLR=  0050E2     |   5 KEY        001FC0 R   |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000005     |   5 LET        0020AC R
    LINENO  =  000005     |   5 LINK    =  0020AC R   |   5 LIST       001F39 R
    LL      =  000002     |     LLEN    =  000002     |     LL_HB   =  000001 
    LNO     =  000005     |     LN_PTR  =  000005     |   5 LOAD       001EE8 R
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MINOR   =  000000     |     MULOP   =  000005     |     N1      =  000001 
    N1_HB   =  000006     |     N1_LB   =  000007     |     N2      =  000003 
    N2_HB   =  000008     |     N2_LB   =  000009     |     NAFR    =  004804 
    NCLKOPT =  004808     |     NEG     =  000001     |   5 NEW        001F04 R
  5 NEXT       002071 R   |     NFLASH_W=  00480E     |     NHSECNT =  00480A 
    NL      =  00000A     |     NLEN    =  000001     |     NOPT1   =  004802 
    NOPT2   =  004804     |     NOPT3   =  004806     |     NOPT4   =  004808 
    NOPT5   =  00480A     |     NOPT6   =  00480C     |     NOPT7   =  00480E 
    NOPTBL  =  00487F     |     NUBC    =  004802     |     NWDGOPT =  004806 
    NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF 
    NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R   |   5 ODR        001F60 R
    OP      =  000005     |     OPT     =  000002     |     OPT0    =  004800 
    OPT1    =  004801     |     OPT2    =  004803     |     OPT3    =  004805 
    OPT4    =  004807     |     OPT5    =  004809     |     OPT6    =  00480B 
    OPT7    =  00480D     |     OPTBL   =  00487E     |     OPTION_B=  004800 
    OPTION_E=  00487F     |     OPTION_S=  000080     |     OUTPUT_F=  000001 
    OUTPUT_O=  000000     |     OUTPUT_P=  000001     |     OUTPUT_S=  000000 
    OVFH    =  000001     |     OVFL    =  000002     |     PA      =  000000 
    PAD_SIZE=  000028     |   5 PAUSE      001FFB R   |     PA_BASE =  005000 
    PA_CR1  =  005003     |     PA_CR2  =  005004     |     PA_DDR  =  005002 
    PA_IDR  =  005001     |     PA_ODR  =  005000     |     PB      =  000005 
    PB_BASE =  005005     |     PB_CR1  =  005008     |     PB_CR2  =  005009 
    PB_DDR  =  005007     |     PB_IDR  =  005006     |     PB_ODR  =  005005 
    PC      =  00000A     |     PC_BASE =  00500A     |     PC_CR1  =  00500D 
    PC_CR2  =  00500E     |     PC_DDR  =  00500C     |     PC_IDR  =  00500B 
    PC_ODR  =  00500A     |     PD      =  00000F     |     PD_BASE =  00500F 
    PD_CR1  =  005012     |     PD_CR2  =  005013     |     PD_DDR  =  005011 
    PD_IDR  =  005010     |     PD_ODR  =  00500F     |     PE      =  000014 
  5 PEEK       002090 R   |     PE_BASE =  005014     |     PE_CR1  =  005017 
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
    PI_IDR  =  005029     |     PI_ODR  =  005028     |   5 POKE       002099 R
    PREV    =  000001     |   5 PRINT      002035 R   |     PROD    =  000002 
    PSIZE   =  000001     |   5 PWRADC     001F91 R   |   5 QKEY       001FB7 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  5 RDADC      001F9C R   |   5 REG_A      0008F9 R   |   5 REG_CC     0008FD R
  5 REG_EPC    0008EC R   |   5 REG_SP     000902 R   |   5 REG_X      0008F5 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Symbol Table

  5 REG_Y      0008F1 R   |     RELOP   =  000005     |   5 REMARK     00202A R
    RETL1   =  000001     |   5 RETURN     002085 R   |   5 RND        001FF3 R
    ROP     =  004800     |     RST_SR  =  0050B3     |   5 RUN        001F31 R
    RXCHAR  =  000001     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   5 SAVE       001EF1 R
    SDIVD   =  000002     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       001F28 R   |     SIGN    =  000001 
  5 SIZE       001FC8 R   |     SKIP    =  000006     |   5 SLEEP      001ECB R
    SPACE   =  000020     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  000080     |   5 STATES     0008AF R   |   5 STEP       002068 R
  5 STOP       001F1F R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      001FE1 R
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
    TIM1_PSC=  005260     |     TIM1_PSC=  005261     |     TIM1_RCR=  005264 
    TIM1_SMC=  005252     |     TIM1_SMC=  000007     |     TIM1_SMC=  000000 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

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
    TK_ARRAY=  000004     |     TK_CHAR =  000005     |     TK_CMD  =  000006 
    TK_COLON=  000001     |     TK_COMMA=  00000B     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_FUNC =  000007     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_INTGR=  000002     |     TK_LE   =  000036     |     TK_LPARE=  000009 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  000008     |     TK_RPARE=  00000A 
    TK_SHARP=  00000C     |     TK_VAR  =  000003     |   5 TO         002061 R
  5 Timer4Up   000019 R   |   5 TrapHand   00000A R   |     U8      =  000003 
    UART1   =  000000     |     UART1_BA=  005230     |     UART1_BR=  005232 
    UART1_BR=  005233     |     UART1_CR=  005234     |     UART1_CR=  005235 
    UART1_CR=  005236     |     UART1_CR=  005237     |     UART1_CR=  005238 
    UART1_DR=  005231     |     UART1_GT=  005239     |     UART1_PO=  000000 
    UART1_PS=  00523A     |     UART1_RX=  000004     |     UART1_SR=  005230 
    UART1_TX=  000005     |     UART3   =  000001     |     UART3_BA=  005240 
    UART3_BR=  005242     |     UART3_BR=  005243     |     UART3_CR=  005244 
    UART3_CR=  005245     |     UART3_CR=  005246     |     UART3_CR=  005247 
    UART3_CR=  004249     |     UART3_DR=  005241     |     UART3_PO=  00000F 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Symbol Table

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
    UART_SR_=  000007     |     UBC     =  004801     |   5 UBOUND     00207A R
  5 UFLASH     001F55 R   |   5 USER_ABO   00007E R   |   5 USR        001F42 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 UserButt   000025 R   |     VSIZ    =  000002     |     VSIZE   =  000002 
    VT      =  00000B     |   5 WAIT       002021 R   |     WDGOPT  =  004805 
    WDGOPT_I=  000002     |     WDGOPT_L=  000003     |     WDGOPT_W=  000000 
    WDGOPT_W=  000001     |     WIDTH   =  000001     |     WIDTH_SA=  000002 
    WLEN    =  000001     |   5 WORDS      001EC1 R   |   5 WRITE      001EFA R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XADR    =  000001 
    XMASK   =  000001     |     XSAVE   =  000003     |     YSAVE   =  000003 
  5 abs        001DE9 R   |   1 acc16      000009 R   |   1 acc24      000008 R
  1 acc8       00000A R   |   5 accept_c   000AA7 R   |   5 add        001068 R
  5 ansi_seq   000A65 R   |   5 arg_list   0011AA R   |   1 array_ad   000020 R
  1 array_si   000022 R   |   5 ascii      001CF7 R   |   5 at_tst     000D9F R
  5 atoi24     000EB4 R   |   5 atoi_exi   000F22 R   |   5 bad_port   001D65 R
  1 base       000007 R   |   1 basicptr   000003 R   |   5 beep       0018F4 R
  5 bin_exit   000C9A R   |   5 bit_rese   0016BE R   |   5 bit_set    0016AA R
  5 bit_togg   0016D3 R   |   5 bkslsh_t   000D4A R   |   5 bksp       0001BA R
  5 break      00198A R   |   5 break_po   0019BB R   |   5 bye        001DBC R
  5 char       001CDA R   |   5 check_fu   0003EC R   |   5 clear_ba   0005A5 R
  5 clear_va   0004B5 R   |   5 clock_in   000099 R   |   5 cmd_itf    000ACB R
  5 cmd_name   001113 R   |   5 cmp_name   001A5A R   |   5 cold_sta   00051A R
  5 colon_ts   000D73 R   |   5 comma_ts   000D7E R   |   5 compile    0003FB R
  5 convert_   000C00 R   |   1 count      000002 R   |   5 cp_loop    001156 R
  5 create_g   000338 R   |   5 cstk_pro   001032 R   |   5 dash_tst   000D94 R
  5 ddrop      000FAE R   |   5 ddrop_n    000FEB R   |   5 ddup       000FB7 R
  5 dec_base   001354 R   |   5 del_back   000A98 R   |   5 del_line   00030B R
  5 del_ln     000A89 R   |   5 delete     0001CA R   |   5 dir_loop   001C1A R
  5 director   001C0E R   |   5 divide     0010BE R   |   5 divu24_8   0009F2 R
  5 dotr       00103B R   |   5 dotr_loo   001050 R   |   5 dots       001008 R
  5 dpick      000FC8 R   |   5 dpop       000F87 R   |   5 dpush      000F7A R
  5 drive_fr   001C96 R   |   3 dstack     001740 R   |   3 dstack_u   001780 R
  5 dstk_pro   000FFE R   |   1 dstkptr    000019 R   |   5 dswap      000F94 R
  5 eeprom     001D8E R   |   5 eql_tst    000E01 R   |   5 equal      001563 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

  5 err_bad_   000686 R   |   5 err_cmd_   000647 R   |   5 err_div0   000609 R
  5 err_dupl   000662 R   |   5 err_math   0005EF R   |   5 err_mem_   0005D2 R
  5 err_msg    0005BA R   |   5 err_no_a   000693 R   |   5 err_no_l   000619 R
  5 err_not_   000674 R   |   5 err_run_   000630 R   |   5 err_synt   0005E0 R
  5 expect     00119D R   |   5 expr_exi   0012E5 R   |   5 expressi   0012A4 R
  5 factor     001201 R   |   1 farptr     000013 R   |   7 fdrive     010000 R
  5 fetch      000FD7 R   |   5 fetchc     000BB8 R   |   1 ffree      000016 R
  5 file_cou   001C8E R   |   5 final_te   000A5F R   |   5 first_li   0013C4 R
  1 flags      000024 R   |   5 for        00172B R   |   5 forget     001BBF R
  1 free_ram   00005A R   |   5 ge         001565 R   |   5 get_arra   0011CE R
  5 get_tick   001DE3 R   |   5 get_toke   000CE7 R   |   5 getc       0001A7 R
  5 go_commo   001852 R   |   5 gosub      00182F R   |   5 goto       001822 R
  5 gpio       001D2D R   |   5 gt         001561 R   |   5 gt_tst     000E0C R
  5 hex_base   00134F R   |   5 hse_cloc   000187 R   |   5 hsi_cloc   000191 R
  5 if         001717 R   |   1 in         000001 R   |   1 in.w       000000 R
  1 in.w.sav   000011 R   |   5 incr_far   0019E4 R   |   5 input_ex   00167B R
  5 input_lo   001616 R   |   5 input_va   00160A R   |   5 insert_l   000369 R
  5 insert_l   0003E9 R   |   5 interp     000749 R   |   5 interp_l   00078D R
  5 invalid    000B10 R   |   5 invalid_   000B8E R   |   5 is_alpha   0004C3 R
  5 is_digit   000E9F R   |   5 itoa       0009AB R   |   5 itoa_loo   0009C3 R
  5 key        001D1B R   |   5 kword_di   0020AA R   |   5 kword_en   001EB7 R
  5 last_lin   0013CD R   |   5 le         00156A R   |   5 ledoff     0007FF R
  5 ledon      0007FA R   |   5 ledtoggl   000804 R   |   5 left_arr   000A65 R
  5 left_par   00080D R   |   5 let        001371 R   |   5 let02      00137B R
  1 lineno     000005 R   |   5 lines_sk   0013D2 R   |   5 list       001399 R
  5 list_exi   001419 R   |   5 list_sta   0013F5 R   |   5 load       001B62 R
  5 loop_bac   0017F5 R   |   1 loop_dep   00001F R   |   5 loop_don   001810 R
  5 lt         001568 R   |   5 lt_tst     000E45 R   |   5 mem_peek   000B2D R
  5 modulo     001102 R   |   5 move       00029E R   |   5 move_dow   0002BC R
  5 move_exi   0002DD R   |   5 move_loo   0002C1 R   |   5 move_up    0002AE R
  5 mul_char   001552 R   |   5 multiply   001076 R   |   5 mulu24_8   000F26 R
  5 nbr_tst    000D20 R   |   5 ne         00156D R   |   5 neg_acc2   000A1A R
  5 new        0019D9 R   |   5 next       0017AD R   |   5 next_tok   0007BD R
  5 no_match   001168 R   |   5 none       000CE7 R   |   5 number     000BBE GR
  5 other      000E7D R   |   3 pad        001718 R   |   5 parse_bi   000C7A R
  5 parse_in   000C3F R   |   5 parse_ke   000CA2 R   |   5 parse_qu   000BC5 R
  5 pause      001DD0 R   |   5 pause02    001DDA R   |   5 peek       0016FA R
  5 peek_byt   000B58 R   |   5 plus_tst   000DD5 R   |   5 poke       0016E7 R
  5 port_cr1   001D7C R   |   5 port_cr2   001D82 R   |   5 port_ddr   001D76 R
  5 port_idr   001D70 R   |   5 port_odr   001D6A R   |   5 power_ad   00191C R
  5 prcnt_ts   000DF6 R   |   5 print      001570 R   |   5 print_ex   0015D4 R
  5 print_fa   000B9D R   |   5 print_in   00094F R   |   5 print_re   00085C R
  5 print_st   000B20 R   |   5 prt_basi   001430 R   |   5 prt_cmd_   00141C R
  5 prt_loop   001574 R   |   5 prt_peek   00024E R   |   5 prt_reg1   00083D R
  5 prt_reg8   000818 R   |   5 prt_regs   0001E4 R   |   5 prti24     000907 R
  1 ptr16      000014 R   |   1 ptr8       000015 R   |   5 putc       00019E R
  5 puts       0001B0 R   |   5 qkey       001D23 R   |   5 qmark_ts   000DAA R
  5 random     001E09 R   |   5 read_adc   001957 R   |   5 readln     000A3D R
  5 readln_l   000A43 R   |   5 readln_q   000ABC R   |   5 regs_sta   000227 R
  5 rel_exit   00133C R   |   5 relation   0012E8 R   |   5 relop_st   001555 R
  5 rem        00167E R   |   5 repl       000AD9 R   |   5 repl_exi   000B01 R
  5 reprint    000A65 R   |   5 reset_co   001572 R   |   5 rest_con   0015F5 R
  5 return     00187A R   |   5 right_ar   000A65 R   |   5 rparnt_t   000D68 R
  5 rt_msg     0006C7 R   |   5 run        00189E R   |   5 save       001AC5 R
  5 save_con   0015E0 R   |   5 search_d   001145 R   |   5 search_e   001199 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

  5 search_f   001A7B R   |   5 search_l   0002E0 R   |   5 search_l   0002EB R
  5 search_n   001149 R   |   1 seedx      00000D R   |   1 seedy      00000F R
  5 seek_fdr   0019F2 R   |   5 sharp_ts   000D89 R   |   5 show       00133F R
  5 single_c   00154E R   |   5 size       001359 R   |   5 skip       000F60 R
  5 slash_ts   000DEB R   |   5 sleep      001DC5 R   |   5 software   0004D4 R
  5 spaces     0001D8 R   |   3 stack_fu   001780 R   |   3 stack_un   001800 R
  5 star_tst   000DE0 R   |   5 step       001785 R   |   5 stop       0018E5 R
  5 store      000FE1 R   |   5 store_lo   001797 R   |   5 str_matc   001177 R
  5 str_tst    000D0F R   |   5 strcmp     00027F R   |   5 strcpy     000290 R
  5 strlen     000272 R   |   5 substrac   001070 R   |   5 syntax_e   0006D7 R
  1 tab_widt   000025 R   |   5 tb_error   0006D9 R   |   5 term       001257 R
  5 term01     001260 R   |   5 term_exi   0012A1 R   |   5 test_p     000B18 R
  3 tib        0016C8 R   |   5 tick_tst   000DC1 R   |   1 ticks      00000B R
  5 timer4_i   0000AF R   |   5 to         001755 R   |   5 to_upper   000EA8 GR
  5 token_ch   000E8C R   |   5 token_ex   000E9C R   |   1 txtbgn     00001B R
  1 txtend     00001D R   |   5 uart3_in   000174 R   |   5 uart3_se   000180 R
  5 uart_ena   000199 R   |   5 ubound     001363 R   |   5 uflash     001D88 R
  5 unget_to   000F73 R   |   5 unlock_e   0000C0 R   |   5 unlock_f   0000CE R
  5 user_spa   002100 R   |   5 usr        001D94 R   |   1 vars       000026 R
  5 wait       00167F R   |   5 warm_sta   000729 R   |   5 words      001E7D R
  5 write      001CA3 R   |   5 write_bl   000151 R   |   5 write_by   0000DC R
  5 write_ee   000118 R   |   5 write_ex   00014C R   |   5 write_fl   000102 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5A   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   210E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

