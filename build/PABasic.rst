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
      008000 82 00 85 CC             98     int cold_start
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
      00808E CD 89 0E         [ 4]  152 	call print_registers
      008091 CD 8B 7D         [ 4]  153 	call cmd_itf
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
      0080D6 CD 8A 01         [ 4]  191 	call print_int  	
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
      0080FB CC 87 DB         [ 2]  208 	jp warm_start
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
      0081EE CD 9A A9         [ 4]  450 	call incr_farptr
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
      00826C AE 89 9E         [ 2]  595 	ldw x,#REG_EPC 
      00826F CD 88 EF         [ 4]  596 	call prt_reg16 
                                    597 ; register CC 
      008272 7B 08            [ 1]  598 	ld a,(R_CC,sp)
      008274 AE 89 AF         [ 2]  599 	ldw x,#REG_CC 
      008277 CD 88 CA         [ 4]  600 	call prt_reg8 
                                    601 ; register A 
      00827A 7B 07            [ 1]  602 	ld a,(R_A,sp)
      00827C AE 89 AB         [ 2]  603 	ldw x,#REG_A 
      00827F CD 88 CA         [ 4]  604 	call prt_reg8 
                                    605 ; register X 
      008282 16 05            [ 2]  606 	ldw y,(R_X,sp)
      008284 AE 89 A7         [ 2]  607 	ldw x,#REG_X 
      008287 CD 88 EF         [ 4]  608 	call prt_reg16 
                                    609 ; register Y 
      00828A 16 03            [ 2]  610 	ldw y,(R_Y,sp)
      00828C AE 89 A3         [ 2]  611 	ldw x,#REG_Y 
      00828F CD 88 EF         [ 4]  612 	call prt_reg16 
                                    613 ; register SP 
      008292 90 96            [ 1]  614 	ldw y,sp
      008294 72 A9 00 08      [ 2]  615 	addw y,#6+ARG_OFS  
      008298 AE 89 B4         [ 2]  616 	ldw x,#REG_SP
      00829B CD 88 EF         [ 4]  617 	call prt_reg16
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
      0082D9 CD 89 B9         [ 4]  639 	call prti24 
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
      0082EE CD 89 B9         [ 4]  649 	call prti24
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
      00847D CC 87 8B         [ 2]  955 	jp tb_error 
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
      00849B CD 8D 8E         [ 4]  989 	call get_token
      00849E 1F 01            [ 2]  990 	ldw (XSAVE,sp),x 
      0084A0 A1 02            [ 1]  991 	cp a,#TK_INTGR 
      0084A2 26 11            [ 1]  992 	jrne 3$
      0084A4 A3 00 00         [ 2]  993 	cpw x,#0  
      0084A7 22 03            [ 1]  994 	jrugt 1$
      0084A9 CC 87 89         [ 2]  995 	jp syntax_error 
      0084AC 72 CF 00 15      [ 5]  996 1$:	ldw [ptr16],x; line number
      0084B0 CD 8D 8E         [ 4]  997 2$:	call get_token
      0084B3 1F 01            [ 2]  998 	ldw (XSAVE,sp),x 
      0084B5 A1 00            [ 1]  999 3$:	cp a,#TK_NONE 
      0084B7 27 7A            [ 1] 1000 	jreq 9$ 
      0084B9 1E 03            [ 2] 1001 	ldw x,(BUFIDX,sp)
      0084BB CD 84 72         [ 4] 1002 	call check_full 
      0084BE 16 03            [ 2] 1003 	ldw y,(BUFIDX,sp) 
      0084C0 91 D7 15         [ 4] 1004 	ld ([ptr16],y),a 
      0084C3 90 5C            [ 1] 1005 	incw y
      0084C5 17 03            [ 2] 1006 	ldw (BUFIDX,sp),y
      0084C7 A1 08            [ 1] 1007 	cp a,#TK_QSTR 
      0084C9 26 25            [ 1] 1008 	jrne 4$
      0084CB AE 17 18         [ 2] 1009 	ldw x,#pad 
      0084CE CD 82 F2         [ 4] 1010 	call strlen
      0084D1 5C               [ 1] 1011 	incw x  
      0084D2 CD 84 72         [ 4] 1012 	call check_full 
      0084D5 90 AE 17 18      [ 2] 1013 	ldw y,#pad 
      0084D9 CE 00 15         [ 2] 1014 	ldw x,ptr16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084DC 72 FB 03         [ 2] 1015 	addw x,(BUFIDX,sp)	
      0084DF CD 83 10         [ 4] 1016 	call strcpy 
      0084E2 AE 17 18         [ 2] 1017 	ldw x,#pad 
      0084E5 CD 82 F2         [ 4] 1018 	call strlen 
      0084E8 5C               [ 1] 1019 	incw x
      0084E9 72 FB 03         [ 2] 1020 	addw x,(BUFIDX,sp) 
      0084EC 1F 03            [ 2] 1021 	ldw (BUFIDX,sp),x
      0084EE 20 C0            [ 2] 1022 	jra 2$  
      0084F0 A1 02            [ 1] 1023 4$: cp a,#TK_INTGR
      0084F2 25 BC            [ 1] 1024 	jrult 2$
      0084F4 A1 07            [ 1] 1025 	cp a,#TK_FUNC 
      0084F6 22 B8            [ 1] 1026 	Jrugt 2$
      0084F8 1E 01            [ 2] 1027 	ldw x,(XSAVE,sp) 
      0084FA 16 03            [ 2] 1028 	ldw y,(BUFIDX,sp)
      0084FC 91 DF 15         [ 5] 1029 	ldw ([ptr16],y),x
      0084FF A3 97 42         [ 2] 1030 	cpw x,#rem 
      008502 26 26            [ 1] 1031 	jrne 5$
      008504 72 A9 00 02      [ 2] 1032 	addw y,#2 
      008508 90 89            [ 2] 1033 	pushw y 
      00850A CE 00 15         [ 2] 1034 	ldw x,ptr16 
      00850D 72 FB 01         [ 2] 1035 	addw x,(1,sp)
      000490                       1036 	_drop 2  
      008510 5B 02            [ 2]    1     addw sp,#2 
      008512 90 CE 00 01      [ 2] 1037 	ldw y,in.w 
      008516 72 A9 16 C8      [ 2] 1038 	addw y,#tib 
      00851A CD 83 10         [ 4] 1039 	call strcpy 	
      00851D CD 82 F2         [ 4] 1040 	call strlen 
      008520 1C 00 03         [ 2] 1041 	addw x,#3 ; rem exec address+string 0. 
      008523 72 FB 03         [ 2] 1042 	addw x,(BUFIDX,sp)
      008526 1F 03            [ 2] 1043 	ldw (BUFIDX,sp),x 
      008528 20 09            [ 2] 1044 	jra 9$
      00852A 72 A9 00 02      [ 2] 1045 5$:	addw y,#2 
      00852E 17 03            [ 2] 1046 	ldw (BUFIDX,sp),y 
      008530 CC 84 B0         [ 2] 1047 	jp 2$
      008533                       1048 9$: 
      008533 AE 00 02         [ 2] 1049 	ldw x,#2
      008536 16 03            [ 2] 1050 	ldw y,(BUFIDX,sp)
      008538 90 9F            [ 1] 1051 	ld a,yl 
      00853A 72 D7 00 15      [ 4] 1052 	ld ([ptr16],x),a  	
      00853E 72 CE 00 15      [ 5] 1053 	ldw x,[ptr16]
      008542 27 09            [ 1] 1054 	jreq 10$
      008544 CD 83 F4         [ 4] 1055 	call insert_line
      008547 72 5F 00 03      [ 1] 1056 	clr  count 
      00854B 20 13            [ 2] 1057 	jra  11$ 
      00854D                       1058 10$: 
      00854D CE 00 15         [ 2] 1059 	ldw x,ptr16 
      008550 CF 00 04         [ 2] 1060 	ldw basicptr,x 
      008553 E6 02            [ 1] 1061 	ld a,(2,x)
      008555 C7 00 03         [ 1] 1062 	ld count,a 
      008558 FE               [ 2] 1063 	ldw x,(x)
      008559 CF 00 06         [ 2] 1064 	ldw lineno,x 
      00855C 35 03 00 02      [ 1] 1065 	mov in,#3 
      008560                       1066 11$:
      0004E0                       1067 	_drop VSIZE 
      008560 5B 04            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008562 72 1B 00 25      [ 1] 1068 	bres flags,#FCOMP 
      008566 81               [ 4] 1069 	ret 
                                   1070 
                                   1071 
                                   1072 ;------------------------------------
                                   1073 ;  set all variables to zero 
                                   1074 ; input:
                                   1075 ;   none 
                                   1076 ; output:
                                   1077 ;	none
                                   1078 ;------------------------------------
      008567                       1079 clear_vars:
      008567 AE 00 27         [ 2] 1080 	ldw x,#vars 
      00856A 90 AE 00 34      [ 2] 1081 	ldw y,#2*26 
      00856E 7F               [ 1] 1082 1$:	clr (x)
      00856F 5C               [ 1] 1083 	incw x 
      008570 90 5A            [ 2] 1084 	decw y 
      008572 26 FA            [ 1] 1085 	jrne 1$
      008574 81               [ 4] 1086 	ret 
                                   1087 
                                   1088 ;-------------------------------------
                                   1089 ; check if A is a letter
                                   1090 ; input:
                                   1091 ;   A 			character to test 
                                   1092 ; output:
                                   1093 ;   C flag      1 true, 0 false 
                                   1094 ;-------------------------------------
      008575                       1095 is_alpha:
      008575 A1 41            [ 1] 1096 	cp a,#'A 
      008577 8C               [ 1] 1097 	ccf
      008578 24 0B            [ 1] 1098 	jrnc 9$ 
      00857A A1 5B            [ 1] 1099 	cp a,#'Z+1 
      00857C 25 07            [ 1] 1100 	jrc 9$ 
      00857E A1 61            [ 1] 1101 	cp a,#'a 
      008580 8C               [ 1] 1102 	ccf 
      008581 24 02            [ 1] 1103 	jrnc 9$
      008583 A1 7B            [ 1] 1104 	cp a,#'z+1   
      008585 81               [ 4] 1105 9$: ret 	
                                   1106 
                                   1107 ;-------------------------------------
                                   1108 ;  program initialization entry point 
                                   1109 ;-------------------------------------
                           000001  1110 	MAJOR=1
                           000000  1111 	MINOR=0
      008586 0A 0A 54 69 6E 79 20  1112 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0085CC                       1113 cold_start:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



                                   1114 ;set stack 
      0085CC AE 17 FF         [ 2] 1115 	ldw x,#STACK_EMPTY
      0085CF 94               [ 1] 1116 	ldw sp,x   
                                   1117 ; clear all ram 
      0085D0 7F               [ 1] 1118 0$: clr (x)
      0085D1 5A               [ 2] 1119 	decw x 
      0085D2 26 FC            [ 1] 1120 	jrne 0$
                                   1121 ; activate pull up on all inputs 
      0085D4 A6 FF            [ 1] 1122 	ld a,#255 
      0085D6 C7 50 03         [ 1] 1123 	ld PA_CR1,a 
      0085D9 C7 50 08         [ 1] 1124 	ld PB_CR1,a 
      0085DC C7 50 0D         [ 1] 1125 	ld PC_CR1,a 
      0085DF C7 50 12         [ 1] 1126 	ld PD_CR1,a 
      0085E2 C7 50 17         [ 1] 1127 	ld PE_CR1,a 
      0085E5 C7 50 1C         [ 1] 1128 	ld PF_CR1,a 
      0085E8 C7 50 21         [ 1] 1129 	ld PG_CR1,a 
      0085EB C7 50 2B         [ 1] 1130 	ld PI_CR1,a 
                                   1131 ; select internal clock no divisor: 16 Mhz 	
      0085EE A6 E1            [ 1] 1132 	ld a,#CLK_SWR_HSI 
      0085F0 5F               [ 1] 1133 	clrw x  
      0085F1 CD 81 19         [ 4] 1134     call clock_init 
      0085F4 CD 81 2F         [ 4] 1135 	call timer4_init
                                   1136 ; UART3 at 115200 BAUD
      0085F7 CD 81 F4         [ 4] 1137 	call uart3_init
                                   1138 ; activate PE_4 (user button interrupt)
      0085FA 72 18 50 18      [ 1] 1139     bset PE_CR2,#USR_BTN_BIT 
                                   1140 ; display system information
      0085FE AE 85 86         [ 2] 1141 	ldw x,#software 
      008601 CD 82 30         [ 4] 1142 	call puts 
      008604 A6 01            [ 1] 1143 	ld a,#MAJOR 
      008606 C7 00 0B         [ 1] 1144 	ld acc8,a 
      008609 5F               [ 1] 1145 	clrw x 
      00860A CF 00 09         [ 2] 1146 	ldw acc24,x 
      00860D A6 0A            [ 1] 1147 	ld a,#10 
      00860F CD 89 B9         [ 4] 1148 	call prti24 
      008612 A6 2E            [ 1] 1149 	ld a,#'.
      008614 CD 82 1E         [ 4] 1150 	call putc 
      008617 A6 00            [ 1] 1151 	ld a,#MINOR 
      008619 C7 00 0B         [ 1] 1152 	ld acc8,a 
      00861C 5F               [ 1] 1153 	clrw x 
      00861D CF 00 09         [ 2] 1154 	ldw acc24,x 
      008620 A6 0A            [ 1] 1155 	ld a,#10 
      008622 CD 89 B9         [ 4] 1156 	call prti24 
      008625 A6 0D            [ 1] 1157 	ld a,#CR 
      008627 CD 82 1E         [ 4] 1158 	call putc 
      00862A CD 9A B7         [ 4] 1159 	call seek_fdrive 
                                   1160 ; configure LED2 pin 
      00862D 72 1A 50 0D      [ 1] 1161     bset PC_CR1,#LED2_BIT
      008631 72 1A 50 0E      [ 1] 1162     bset PC_CR2,#LED2_BIT
      008635 72 1A 50 0C      [ 1] 1163     bset PC_DDR,#LED2_BIT
      008639 9A               [ 1] 1164 	rim 
      00863A AE 16 C8         [ 2] 1165 	ldw x,#tib
      00863D CF 00 21         [ 2] 1166 	ldw array_addr,x 
      008640 72 5C 00 11      [ 1] 1167 	inc seedy+1 
      008644 72 5C 00 0F      [ 1] 1168 	inc seedx+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008648 CD 86 57         [ 4] 1169 	call clear_basic
      00864B CD 94 08         [ 4] 1170 	call ubound 
      00864E CD 90 2C         [ 4] 1171 	call dpop 
      008651 CF 00 23         [ 2] 1172 	ldw array_size,x 
      008654 CC 87 DB         [ 2] 1173     jp warm_start 
                                   1174 
                                   1175 ;---------------------------
                                   1176 ; reset BASIC text variables 
                                   1177 ; and clear variables 
                                   1178 ;---------------------------
      008657                       1179 clear_basic:
      008657 5F               [ 1] 1180 	clrw x 
      008658 CF 00 06         [ 2] 1181 	ldw lineno,x
      00865B 72 5F 00 03      [ 1] 1182 	clr count 
      00865F AE 00 5B         [ 2] 1183 	ldw x,#free_ram 
      008662 CF 00 1C         [ 2] 1184 	ldw txtbgn,x 
      008665 CF 00 1E         [ 2] 1185 	ldw txtend,x 
      008668 CD 85 67         [ 4] 1186 	call clear_vars 
      00866B 81               [ 4] 1187 	ret 
                                   1188 
                                   1189 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1190 ;;   Tiny BASIC error messages     ;;
                                   1191 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00866C                       1192 err_msg:
      00866C 00 00 86 84 86 92 86  1193 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             A1 86 BB 86 CB
      008678 86 E2 86 F9 87 14 87  1194 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             26 87 38
      008682 87 45                 1195 	.word err_no_access 
                                   1196 
      008684 0A 4D 65 6D 6F 72 79  1197 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      008692 0A 73 79 6E 74 61 78  1198 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      0086A1 0A 6D 61 74 68 20 6F  1199 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0086BB 0A 64 69 76 69 73 69  1200 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      0086CB 0A 69 6E 76 61 6C 69  1201 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      0086E2 0A 72 75 6E 20 74 69  1202 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      0086F9 0A 63 6F 6D 6D 61 6E  1203 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      008714 0A 64 75 70 6C 69 63  1204 err_duplicate: .asciz "\nduplicate name.\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal  61-Bits]



             61 74 65 20 6E 61 6D
             65 2E 0A 00
      00871C 74 65 20 6E 61 6D 65  1205 err_not_file: .asciz "\nFile not found.\n"
             2E 0A 00 0A 46 69 6C
             65 20 6E 6F
      00872E 74 20 66 6F 75 6E 64  1206 err_bad_value: .asciz "\nbad value.\n"
             2E 0A 00 0A 62 61
      00873B 64 20 76 61 6C 75 65  1207 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             2E 0A 00 0A 46 69 6C
             65 20 69 6E 20 65 78
             74 65 6E 64 65 64 20
             6D 65 6D 6F 72 79 2C
             20 63 61 6E 27 74 20
             62 65 20 72 75 6E 20
             66 72 6F
                                   1208 
      00876F 6D 20 74 68 65 72 65  1209 rt_msg: .asciz "last token id: "
             2E 0A 00 6C 61 73 74
             20 74
                                   1210 
      000709                       1211 syntax_error:
      00877F 6F 6B            [ 1] 1212 	ld a,#ERR_SYNTAX 
                                   1213 
      00070B                       1214 tb_error:
      008781 65 6E 20         [ 2] 1215 	ldw x, #err_msg 
      008784 69 64 3A 20      [ 1] 1216 	clr acc16 
      008788 00               [ 1] 1217 	sll a
      008789 72 59 00 09      [ 1] 1218 	rlc acc16  
      008789 A6 02 0A         [ 1] 1219 	ld acc8, a 
      00878B 72 BB 00 09      [ 2] 1220 	addw x,acc16 
      00878B AE               [ 2] 1221 	ldw x,(x)
      00878C 86 6C 72         [ 4] 1222 	call puts
      00878F 5F 00 0A 48 72   [ 2] 1223 	btjf flags,#FCOMP, 1$
      008794 59 00 0A         [ 2] 1224 	ldw x,#tib
      008797 C7 00 0B         [ 4] 1225 	call puts 
      00879A 72 BB            [ 1] 1226 	ld a,#CR 
      00879C 00 0A FE         [ 4] 1227 	call putc
      00879F CD 82 30         [ 2] 1228 	ldw x,#in.w.saved
      0087A2 72 0B 00         [ 4] 1229 	call spaces
      0087A5 25 18            [ 1] 1230 	ld a,#'^
      0087A7 AE 16 C8         [ 4] 1231 	call putc 
      0087AA CD 82            [ 2] 1232 	jra 6$
      0087AC 30 A6 0D         [ 2] 1233 1$:	ldw x,basicptr
      0087AF CD 82 1E         [ 4] 1234 	call prt_basic_line
      0087B2 AE 00 12         [ 2] 1235 	ldw x,#rt_msg 
      0087B5 CD 82 58         [ 4] 1236 	call puts 
      0087B8 A6 5E CD         [ 2] 1237 	ldw x,in.w.saved 
      0087BB 82 1E 20 18      [ 4] 1238 	ld a,([basicptr],x)
      0087BF CE               [ 1] 1239 	clrw x 
      0087C0 00               [ 1] 1240 	ld xl,a 
      0087C1 04 CD 94         [ 4] 1241 	call print_int 
      0087C4 D5 AE 87         [ 2] 1242 6$: ldw x,#STACK_EMPTY 
      0087C7 79               [ 1] 1243     ldw sp,x
      00075B                       1244 warm_start:
      0087C8 CD 82 30 CE      [ 1] 1245 	clr flags 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0087CC 00 12 72 D6      [ 1] 1246 	clr loop_depth 
      0087D0 00 04 5F         [ 2] 1247 	ldw x,#dstack_unf 
      0087D3 97 CD 8A         [ 2] 1248 	ldw dstkptr,x 
      0087D6 01 AE 17 FF      [ 1] 1249 	mov tab_width,#TAB_WIDTH 
      0087DA 94 0A 00 07      [ 1] 1250 	mov base,#10 
      0087DB 5F               [ 1] 1251 	clrw x 
      0087DB 72 5F 00         [ 2] 1252 	ldw lineno,x 
      0087DE 25 72 5F         [ 2] 1253 	ldw x,#tib 
      0087E1 00 20 AE         [ 2] 1254 	ldw basicptr,x 
                                   1255 ;----------------------------
                                   1256 ;   BASIC interpreter
                                   1257 ;----------------------------
      00077B                       1258 interp:
      0087E4 17 80 CF 00      [ 1] 1259 	clr in.w
      0087E8 1A 35 04 00 26   [ 2] 1260 	btjf flags,#FRUN,4$ 
                                   1261 ; running program
                                   1262 ; goto next basic line 
      0087ED 35 0A 00         [ 2] 1263 	ldw x,basicptr
      0087F0 08 5F            [ 1] 1264 	ld a,(2,x) ; line length 
      0087F2 CF 00 06         [ 1] 1265 	ld acc8,a 
      0087F5 AE 16 C8 CF      [ 1] 1266 	clr acc16 
      0087F9 00 04 00 09      [ 2] 1267 	addw x,acc16
      0087FB C3 00 1D         [ 2] 1268 	cpw x,txtend 
      0087FB 72 5F            [ 1] 1269 	jrpl warm_start
      0087FD 00 01 72         [ 2] 1270 	ldw basicptr,x ; start of next line  
      008800 01 00            [ 1] 1271 	ld a,(2,x)
      008802 25 27 CE         [ 1] 1272 	ld count,a 
      008805 00               [ 2] 1273 	ldw x,(x) ; line no 
      008806 04 E6 02         [ 2] 1274 	ldw lineno,x 
      008809 C7 00 0B 72      [ 1] 1275 	mov in,#3 ; skip first 3 bytes of line 
      00880D 5F 00            [ 2] 1276 	jra interp_loop 
      0007AB                       1277 4$: ; commande line mode 	
      00880F 0A 72 BB 00      [ 1] 1278 	clr in
      008813 0A C3            [ 1] 1279 	ld a,#CR 
      008815 00 1E 2A         [ 4] 1280 	call putc 
      008818 C2 CF            [ 1] 1281 	ld a,#'> 
      00881A 00 04 E6         [ 4] 1282 	call putc 
      00881D 02 C7 00         [ 4] 1283 	call readln
      008820 03 FE CF         [ 4] 1284 	call compile
      0007BF                       1285 interp_loop:  
      008823 00 06 35         [ 1] 1286 	ld a,in 
      008826 03 00 02         [ 1] 1287 	cp a,count  
      008829 20 14            [ 1] 1288 	jrpl interp
      00882B CD 07 EF         [ 4] 1289 	call next_token
      00882B 72 5F            [ 1] 1290 	cp a,#TK_COLON 
      00882D 00 02            [ 1] 1291 	jreq interp_loop 
      00882F A6 0D            [ 1] 1292 	cp a,#TK_NONE 
                                   1293 ;	jreq interp 
      0007D0                       1294 1$:
      008831 CD 82            [ 1] 1295 	cp a,#TK_VAR
      008833 1E A6            [ 1] 1296 	jrne 2$
      008835 3E CD 82         [ 4] 1297 	call let02  
      008838 1E CD            [ 2] 1298 	jra interp_loop 
      0007D9                       1299 2$:	
      00883A 8A EF            [ 1] 1300 	cp a,#TK_ARRAY 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      00883C CD 84            [ 1] 1301 	jrne 3$
      00883E 81 11 F3         [ 4] 1302 	call get_array_element
      00883F CD 13 A0         [ 4] 1303 	call let02 
      00883F C6 00            [ 2] 1304 	jra interp_loop 
      0007E5                       1305 3$:
      008841 02 C1            [ 1] 1306 	cp a,#TK_CMD
      008843 00 03            [ 1] 1307 	jrne 4$
      008845 2A               [ 4] 1308 	call (x) 
      008846 B4 CD            [ 2] 1309 	jra interp_loop 
      0007EC                       1310 4$:	
      008848 88 6F A1         [ 2] 1311 	jp syntax_error 
                                   1312 
                                   1313 ;--------------------------
                                   1314 ; extract next token from
                                   1315 ; token list 
                                   1316 ; basicptr -> base address 
                                   1317 ; in  -> offset in list array 
                                   1318 ; output:
                                   1319 ;   A 		token attribute
                                   1320 ;   X 		token value if there is one
                                   1321 ;----------------------------------------
      0007EF                       1322 next_token:
      00884B 01 27            [ 1] 1323 	push #0
      00884D F1 A1 00         [ 1] 1324 	ld a,in 
      008850 C1 00 02         [ 1] 1325 	cp a,count 
      008850 A1               [ 1] 1326 	pop a 
      008851 03 26            [ 1] 1327 	jrpl 9$ 
      008853 05 CD 94         [ 2] 1328 	ldw x,in.w 
      008856 20 20 E6         [ 2] 1329 	ldw in.w.saved,x 
      008859 CE 00 03         [ 2] 1330 	ldw x,basicptr 
      008859 A1 04 26 08      [ 4] 1331 	ld a,([in.w],x)
      00885D CD 92 73 CD      [ 1] 1332 	inc in 
      008861 94 20            [ 1] 1333 	cp a,#CMD_END 
      008863 20 DA            [ 1] 1334 	jrult 9$
      008865 A1 08            [ 1] 1335 	cp a,#TK_QSTR 
      008865 A1 06            [ 1] 1336 	jrugt 9$
      008867 26 03            [ 1] 1337 	jrult 2$
      008869 FD 20 D3 00      [ 2] 1338 	addw x,in.w 
      00886C 20 10            [ 2] 1339 	jra 9$
      00886C CC 87 89 00      [ 5] 1340 2$: ldw x,([in.w],x)
      00886F 90 CE 00 00      [ 2] 1341 	ldw y,in.w 
      00886F 4B 00 C6 00      [ 2] 1342 	addw y,#2
      008873 02 C1 00 03      [ 2] 1343 	ldw in.w,y
      008877 84               [ 4] 1344 9$: ret	
                                   1345 
                                   1346 
                                   1347 ;----------------------------------------
                                   1348 ;   DEBUG support functions
                                   1349 ;----------------------------------------
                           000001  1350 .if DEBUG 
                                   1351 ; turn LED on 
      00082C                       1352 ledon:
      008878 2A 31 CE 00      [ 1] 1353     bset PC_ODR,#LED2_BIT
      00887C 01               [ 4] 1354     ret 
                                   1355 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1356 ; turn LED off 
      000831                       1357 ledoff:
      00887D CF 00 12 CE      [ 1] 1358     bres PC_ODR,#LED2_BIT 
      008881 00               [ 4] 1359     ret 
                                   1360 
                                   1361 ; invert LED status 
      000836                       1362 ledtoggle:
      008882 04 72            [ 1] 1363     ld a,#LED2_MASK
      008884 D6 00 01         [ 1] 1364     xor a,PC_ODR
      008887 72 5C 00         [ 1] 1365     ld PC_ODR,a
      00888A 02               [ 4] 1366     ret 
                                   1367 
      00083F                       1368 left_paren:
      00888B A1 02            [ 1] 1369 	ld a,#SPACE 
      00888D 25 1C A1         [ 4] 1370 	call putc
      008890 08 22            [ 1] 1371 	ld a,#'( 
      008892 18 25 06         [ 4] 1372 	call putc 	
      008895 72               [ 4] 1373 	ret 
                                   1374 
                                   1375 ;------------------------------
                                   1376 ; print 8 bit register 
                                   1377 ; input:
                                   1378 ;   X  point to register name 
                                   1379 ;   A  register value to print 
                                   1380 ; output:
                                   1381 ;   none
                                   1382 ;------------------------------- 
      00084A                       1383 prt_reg8:
      008896 BB               [ 1] 1384 	push a 
      008897 00 01 20         [ 4] 1385 	call puts 
      00889A 10 72            [ 1] 1386 	ld a,(1,sp) 
      00889C DE 00 01         [ 1] 1387 	ld acc8,a 
      00889F 90               [ 1] 1388 	clrw x 
      0088A0 CE               [ 1] 1389 	ld xl,a 
      0088A1 00 01 72 A9      [ 1] 1390 	mov base,#16
      0088A5 00 02 90         [ 4] 1391 	call print_int 
      0088A8 CF 00 01         [ 4] 1392 	call left_paren 
      0088AB 81               [ 1] 1393 	pop a 
      0088AC 5F               [ 1] 1394 	clrw x 
      0088AC 72               [ 1] 1395 	ld xl,a 
      0088AD 1A 50 0A 81      [ 1] 1396 	mov base,#10 
      0088B1 CD 09 81         [ 4] 1397 	call print_int  
      0088B1 72 1B            [ 1] 1398 	ld a,#') 
      0088B3 50 0A 81         [ 4] 1399 	call putc
      0088B6 81               [ 4] 1400 	ret
                                   1401 
                                   1402 ;--------------------------------
                                   1403 ; print 16 bits register 
                                   1404 ; input:
                                   1405 ;   X   point register name 
                                   1406 ;   Y   register value to print 
                                   1407 ; output:
                                   1408 ;  none
                                   1409 ;--------------------------------
      00086F                       1410 prt_reg16: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0088B6 A6 20            [ 2] 1411 	pushw y 
      0088B8 C8 50 0A         [ 4] 1412 	call puts 
      0088BB C7 50            [ 2] 1413 	ldw x,(1,sp) 
      0088BD 0A 81 00 07      [ 1] 1414 	mov base,#16 
      0088BF CD 09 81         [ 4] 1415 	call print_int  
      0088BF A6 20 CD         [ 4] 1416 	call left_paren 
      0088C2 82               [ 2] 1417 	popw x 
      0088C3 1E A6 28 CD      [ 1] 1418 	mov base,#10 
      0088C7 82 1E 81         [ 4] 1419 	call print_int  
      0088CA A6 29            [ 1] 1420 	ld a,#') 
      0088CA 88 CD 82         [ 4] 1421 	call putc
      0088CD 30               [ 4] 1422 	ret 
                                   1423 
                                   1424 ;------------------------------------
                                   1425 ; print registers contents saved on
                                   1426 ; stack by trap interrupt.
                                   1427 ;------------------------------------
      00088E                       1428 print_registers:
      0088CE 7B 01 C7         [ 2] 1429 	ldw x,#STATES
      0088D1 00 0B 5F         [ 4] 1430 	call puts
                                   1431 ; print EPC 
      0088D4 97 35 10         [ 2] 1432 	ldw x, #REG_EPC
      0088D7 00 08 CD         [ 4] 1433 	call puts 
      0088DA 8A 01            [ 1] 1434 	ld a, (11,sp)
      0088DC CD 88 BF         [ 1] 1435 	ld acc8,a 
      0088DF 84 5F            [ 1] 1436 	ld a, (10,sp) 
      0088E1 97 35 0A         [ 1] 1437 	ld acc16,a 
      0088E4 00 08            [ 1] 1438 	ld a,(9,sp) 
      0088E6 CD 8A 01         [ 1] 1439 	ld acc24,a
      0088E9 A6               [ 1] 1440 	clrw x  
      0088EA 29 CD            [ 1] 1441 	ld a,#16
      0088EC 82 1E 81         [ 4] 1442 	call prti24  
                                   1443 ; print X
      0088EF AE 09 27         [ 2] 1444 	ldw x,#REG_X
      0088EF 90 89            [ 2] 1445 	ldw y,(5,sp)
      0088F1 CD 82 30         [ 4] 1446 	call prt_reg16  
                                   1447 ; print Y 
      0088F4 1E 01 35         [ 2] 1448 	ldw x,#REG_Y
      0088F7 10 00            [ 2] 1449 	ldw y, (7,sp)
      0088F9 08 CD 8A         [ 4] 1450 	call prt_reg16  
                                   1451 ; print A 
      0088FC 01 CD 88         [ 2] 1452 	ldw x,#REG_A
      0088FF BF 85            [ 1] 1453 	ld a, (4,sp) 
      008901 35 0A 00         [ 4] 1454 	call prt_reg8
                                   1455 ; print CC 
      008904 08 CD 8A         [ 2] 1456 	ldw x,#REG_CC 
      008907 01 A6            [ 1] 1457 	ld a, (3,sp) 
      008909 29 CD 82         [ 4] 1458 	call prt_reg8 
                                   1459 ; print SP 
      00890C 1E 81 34         [ 2] 1460 	ldw x,#REG_SP
      00890E 90 96            [ 1] 1461 	ldw y,sp 
      00890E AE 89 61 CD      [ 2] 1462 	addw y,#12
      008912 82 30 AE         [ 4] 1463 	call prt_reg16  
      008915 89 9E            [ 1] 1464 	ld a,#'\n' 
      008917 CD 82 30         [ 4] 1465 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      00891A 7B               [ 4] 1466 	ret
                                   1467 
      00891B 0B C7 00 0B 7B 0A C7  1468 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             00 0A 7B 09 C7 00 09
             5F A6 10 CD 89 B9 AE
             89 A7 16 05 CD 88 EF
             AE 89 A3 16 07 CD 88
             EF AE 89 AB 7B 04 CD
             88 CA AE 89 AF 7B 03
             CD 88 CA AE 89 B4 90
             96 72 A9 00 0C
      008958 CD 88 EF A6 0A        1469 REG_EPC: .asciz "EPC:"
      00895D CD 82 1E 81           1470 REG_Y:   .asciz "\nY:" 
      008961 0A 52 65 67           1471 REG_X:   .asciz "\nX:"
      008965 69 73 74 65           1472 REG_A:   .asciz "\nA:" 
      008969 72 73 20 73 74        1473 REG_CC:  .asciz "\nCC:"
      00896E 61 74 65 20 61        1474 REG_SP:  .asciz "\nSP:"
                                   1475 .endif ; DEBUG 
                                   1476 
                                   1477 ;------------------------------------
                                   1478 ; print integer in acc24 
                                   1479 ; input:
                                   1480 ;	acc24 		integer to print 
                                   1481 ;	A 			numerical base for conversion 
                                   1482 ;               if bit 7 is set add a space at print end.
                                   1483 ;   XL 			field width, 0 -> no fill.
                                   1484 ;  output:
                                   1485 ;    none 
                                   1486 ;------------------------------------
                           000001  1487 	WIDTH = 1
                           000002  1488 	BASE = 2
                           000003  1489 	ADD_SPACE=3 ; add a space after number 
                           000003  1490 	VSIZE = 3
      000939                       1491 prti24:
      000939                       1492 	_vars VSIZE 
      008973 74 20            [ 2]    1     sub sp,#VSIZE 
      008975 61 62            [ 1] 1493 	clr (ADD_SPACE,sp)
      008977 6F 72            [ 1] 1494 	bcp a,#0x80 
      008979 74 20            [ 1] 1495 	jreq 0$ 
      00897B 70 6F            [ 1] 1496 	cpl (ADD_SPACE,sp)
      00897D 69 6E            [ 1] 1497 0$:	and a,#31 
      00897F 74 2E            [ 1] 1498 	ld (BASE,sp),a
      008981 0A               [ 1] 1499 	ld a,xl
      008982 2D 2D            [ 1] 1500 	ld (WIDTH,sp),a 
      008984 2D 2D            [ 1] 1501 	ld a, (BASE,sp)  
      008986 2D 2D 2D         [ 4] 1502     call itoa  ; conversion entier en  .asciz
      008989 2D 2D            [ 1] 1503 1$: ld a,(WIDTH,sp)
      00898B 2D 2D            [ 1] 1504 	jreq 4$
      00898D 2D 2D 2D         [ 1] 1505 	ld acc8,a 
      008990 2D               [ 2] 1506 	pushw x 
      008991 2D 2D 2D         [ 4] 1507 	call strlen 
      008994 2D               [ 1] 1508 	ld a,xl 
      008995 2D               [ 2] 1509 	popw x 
      008996 2D 2D 2D         [ 3] 1510 	exg a,acc8 
      008999 2D 2D 2D         [ 1] 1511 	sub a,acc8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00899C 0A 00            [ 1] 1512 	jrmi 4$
      00899E 45 50            [ 1] 1513 	ld (WIDTH,sp),a 
      0089A0 43 3A            [ 1] 1514 	ld  a,#SPACE
      0089A2 00 0A            [ 1] 1515 3$: tnz (WIDTH,sp)
      0089A4 59 3A            [ 1] 1516 	jreq 4$
      0089A6 00               [ 2] 1517 	decw x 
      0089A7 0A               [ 1] 1518 	ld (x),a 
      0089A8 58 3A            [ 1] 1519 	dec (WIDTH,sp) 
      0089AA 00 0A            [ 2] 1520 	jra 3$
      000972                       1521 4$: 
      0089AC 41 3A 00         [ 4] 1522 	call puts 
      0089AF 0A 43            [ 1] 1523 	tnz (ADD_SPACE,sp)
      0089B1 43 3A            [ 1] 1524 	jreq 5$
      0089B3 00 0A            [ 1] 1525     ld a,#SPACE 
      0089B5 53 50 3A         [ 4] 1526 	call putc 
      00097E                       1527 5$: _drop VSIZE 
      0089B8 00 03            [ 2]    1     addw sp,#VSIZE 
      0089B9 81               [ 4] 1528     ret	
                                   1529 
                                   1530 ;-----------------------------------
                                   1531 ; print a 16 bit integer 
                                   1532 ; using variable 'base' as conversion
                                   1533 ; format.
                                   1534 ; input:
                                   1535 ;   X       integer to print 
                                   1536 ;   base    conversion base 
                                   1537 ; output:
                                   1538 ;   none 
                                   1539 ;-----------------------------------
                           000001  1540 	SIGN=1
                           000001  1541 	VSIZE=1
      000981                       1542 print_int: 
      000981                       1543 	_vars VSIZE 
      0089B9 52 03            [ 2]    1     sub sp,#VSIZE 
      0089BB 0F 03            [ 1] 1544 	clr (SIGN,sp)
      0089BD A5 80 27 02      [ 2] 1545 	ldw y,#pad+PAD_SIZE-1 
      0089C1 03 03            [ 1] 1546 	clr (y)
      0089C3 A4 1F 6B         [ 1] 1547 	ld a,base  
      0089C6 02 9F            [ 1] 1548 	cp a,#10 
      0089C8 6B 01            [ 1] 1549 	jrne 1$ 
      0089CA 7B               [ 2] 1550 	tnzw x 
      0089CB 02 CD            [ 1] 1551 	jrpl 1$ 
      0089CD 8A 5D            [ 1] 1552 	cpl (SIGN,sp)
      0089CF 7B               [ 2] 1553 	negw x 	 
      000998                       1554 1$:	
      0089D0 01 27 1F         [ 1] 1555 	ld a,base 
      0089D3 C7               [ 2] 1556 	div x,a 
      0089D4 00 0B            [ 1] 1557 	add a,#'0 
      0089D6 89 CD            [ 1] 1558 	cp a,#'9+1 
      0089D8 82 F2            [ 1] 1559 	jrmi 2$ 
      0089DA 9F 85            [ 1] 1560 	add a,#7 
      0089DC 31 00            [ 2] 1561 2$: decw y 
      0089DE 0B C0            [ 1] 1562 	ld (y),a 
      0089E0 00               [ 2] 1563 	tnzw x 
      0089E1 0B 2B            [ 1] 1564 	jrne 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0089E3 0E 6B            [ 1] 1565 	ld a,#16 
      0089E5 01 A6 20         [ 1] 1566 	cp a,base 
      0089E8 0D 01            [ 1] 1567 	jrne 3$
      0089EA 27 06            [ 1] 1568 	ld a,#'$
      0089EC 5A F7            [ 2] 1569 	decw y  
      0089EE 0A 01            [ 1] 1570 	ld (y),a
      0089F0 20 F6            [ 2] 1571 	jra 9$ 
      0089F2 0D 01            [ 1] 1572 3$: tnz (SIGN,sp)
      0089F2 CD 82            [ 1] 1573 	jreq 9$ 
      0089F4 30 0D            [ 1] 1574 	ld a,#'-
      0089F6 03 27            [ 2] 1575 	decw y  
      0089F8 05 A6            [ 1] 1576 	ld (y),a
      0009C4                       1577 9$:	
      0089FA 20               [ 1] 1578 	ldw x,y 
      0089FB CD 82 1E         [ 2] 1579 	subw x,#pad+PAD_SIZE-1 
      0089FE 5B               [ 2] 1580 	negw x  
      0009C9                       1581 10$:
      0089FF 03 81            [ 2] 1582 	decw y 
      008A01 A6 20            [ 1] 1583 	ld a,#SPACE 
      008A01 52 01            [ 1] 1584 	ld (y),a
      008A03 0F               [ 1] 1585 	incw x 
      008A04 01               [ 1] 1586 	ld a,xl 
      008A05 90 AE 17         [ 1] 1587 	cp a,tab_width
      008A08 3F 90            [ 1] 1588 	jrmi 10$ 
      0009D6                       1589 12$:
      008A0A 7F               [ 1] 1590     ldw x,y 
      008A0B C6 00 08         [ 4] 1591 	call puts  
      0009DA                       1592 	_drop VSIZE 
      008A0E A1 0A            [ 2]    1     addw sp,#VSIZE 
      008A10 26               [ 4] 1593 	ret 
                                   1594 
                                   1595 ;------------------------------------
                                   1596 ; convert integer in acc24 to string
                                   1597 ; input:
                                   1598 ;   A	  	base
                                   1599 ;	acc24	integer to convert
                                   1600 ; output:
                                   1601 ;   X  		pointer to string
                                   1602 ;------------------------------------
                           000001  1603 	SIGN=1  ; integer sign 
                           000002  1604 	BASE=2  ; numeric base 
                           000002  1605 	VSIZE=2  ;locals size
      0009DD                       1606 itoa:
      008A11 06 5D            [ 2] 1607 	sub sp,#VSIZE
      008A13 2A 03            [ 1] 1608 	ld (BASE,sp), a  ; base
      008A15 03 01            [ 1] 1609 	clr (SIGN,sp)    ; sign
      008A17 50 0A            [ 1] 1610 	cp a,#10
      008A18 26 0A            [ 1] 1611 	jrne 1$
                                   1612 	; base 10 string display with negative sign if bit 23==1
      008A18 C6 00 08 62 AB   [ 2] 1613 	btjf acc24,#7,1$
      008A1D 30 A1            [ 1] 1614 	cpl (SIGN,sp)
      008A1F 3A 2B 02         [ 4] 1615 	call neg_acc24
      0009F1                       1616 1$:
                                   1617 ; initialize string pointer 
      008A22 AB 07 90         [ 2] 1618 	ldw x,#pad+PAD_SIZE-1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A25 5A               [ 1] 1619 	clr (x)
      0009F5                       1620 itoa_loop:
      008A26 90 F7            [ 1] 1621     ld a,(BASE,sp)
      008A28 5D 26 ED         [ 4] 1622     call divu24_8 ; acc24/A 
      008A2B A6 10            [ 1] 1623     add a,#'0  ; remainder of division
      008A2D C1 00            [ 1] 1624     cp a,#'9+1
      008A2F 08 26            [ 1] 1625     jrmi 2$
      008A31 08 A6            [ 1] 1626     add a,#7 
      008A33 24               [ 2] 1627 2$: decw x
      008A34 90               [ 1] 1628     ld (x),a
                                   1629 	; if acc24==0 conversion done
      008A35 5A 90 F7         [ 1] 1630 	ld a,acc24
      008A38 20 0A 0D         [ 1] 1631 	or a,acc16
      008A3B 01 27 06         [ 1] 1632 	or a,acc8
      008A3E A6 2D            [ 1] 1633     jrne itoa_loop
                                   1634 	;conversion done, next add '$' or '-' as required
      008A40 90 5A            [ 1] 1635 	ld a,(BASE,sp)
      008A42 90 F7            [ 1] 1636 	cp a,#16
      008A44 27 08            [ 1] 1637 	jreq 8$
      008A44 93 1D            [ 1] 1638 	ld a,(SIGN,sp)
      008A46 17 3F            [ 1] 1639     jreq 10$
      008A48 50 2D            [ 1] 1640     ld a,#'-
      008A49 20 02            [ 2] 1641 	jra 9$ 
      008A49 90 5A            [ 1] 1642 8$: ld a,#'$ 
      008A4B A6               [ 2] 1643 9$: decw x
      008A4C 20               [ 1] 1644     ld (x),a
      000A21                       1645 10$:
      008A4D 90 F7            [ 2] 1646 	addw sp,#VSIZE
      008A4F 5C               [ 4] 1647 	ret
                                   1648 
                                   1649 ;-------------------------------------
                                   1650 ; divide uint24_t by uint8_t
                                   1651 ; used to convert uint24_t to string
                                   1652 ; input:
                                   1653 ;	acc24	dividend
                                   1654 ;   A 		divisor
                                   1655 ; output:
                                   1656 ;   acc24	quotient
                                   1657 ;   A		remainder
                                   1658 ;------------------------------------- 
                                   1659 ; offset  on sp of arguments and locals
                           000001  1660 	U8   = 1   ; divisor on stack
                           000001  1661 	VSIZE =1
      000A24                       1662 divu24_8:
      008A50 9F               [ 2] 1663 	pushw x ; save x
      008A51 C1               [ 1] 1664 	push a 
                                   1665 	; ld dividend UU:MM bytes in X
      008A52 00 26 2B         [ 1] 1666 	ld a, acc24
      008A55 F3               [ 1] 1667 	ld xh,a
      008A56 C6 00 09         [ 1] 1668 	ld a,acc24+1
      008A56 93               [ 1] 1669 	ld xl,a
      008A57 CD 82            [ 1] 1670 	ld a,(U8,SP) ; divisor
      008A59 30               [ 2] 1671 	div x,a ; UU:MM/U8
      008A5A 5B               [ 1] 1672 	push a  ;save remainder
      008A5B 01               [ 1] 1673 	ld a,xh
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A5C 81 00 08         [ 1] 1674 	ld acc24,a
      008A5D 9F               [ 1] 1675 	ld a,xl
      008A5D 52 02 6B         [ 1] 1676 	ld acc24+1,a
      008A60 02               [ 1] 1677 	pop a
      008A61 0F               [ 1] 1678 	ld xh,a
      008A62 01 A1 0A         [ 1] 1679 	ld a,acc24+2
      008A65 26               [ 1] 1680 	ld xl,a
      008A66 0A 72            [ 1] 1681 	ld a,(U8,sp) ; divisor
      008A68 0F               [ 2] 1682 	div x,a  ; R:LL/U8
      008A69 00 09            [ 1] 1683 	ld (U8,sp),a ; save remainder
      008A6B 05               [ 1] 1684 	ld a,xl
      008A6C 03 01 CD         [ 1] 1685 	ld acc24+2,a
      008A6F 8A               [ 1] 1686 	pop a
      008A70 CC               [ 2] 1687 	popw x
      008A71 81               [ 4] 1688 	ret
                                   1689 
                                   1690 ;------------------------------------
                                   1691 ;  two's complement acc24
                                   1692 ;  input:
                                   1693 ;		acc24 variable
                                   1694 ;  output:
                                   1695 ;		acc24 variable
                                   1696 ;-------------------------------------
      000A4C                       1697 neg_acc24:
      008A71 AE 17 3F 7F      [ 1] 1698 	cpl acc24+2
      008A75 72 53 00 09      [ 1] 1699 	cpl acc24+1
      008A75 7B 02 CD 8A      [ 1] 1700 	cpl acc24
      008A79 A4 AB            [ 1] 1701 	ld a,#1
      008A7B 30 A1 3A         [ 1] 1702 	add a,acc24+2
      008A7E 2B 02 AB         [ 1] 1703 	ld acc24+2,a
      008A81 07               [ 1] 1704 	clr a
      008A82 5A F7 C6         [ 1] 1705 	adc a,acc24+1
      008A85 00 09 CA         [ 1] 1706 	ld acc24+1,a 
      008A88 00               [ 1] 1707 	clr a 
      008A89 0A CA 00         [ 1] 1708 	adc a,acc24 
      008A8C 0B 26 E6         [ 1] 1709 	ld acc24,a 
      008A8F 7B               [ 4] 1710 	ret
                                   1711 
                                   1712 
                                   1713 ;------------------------------------
                                   1714 ; read a line of text from terminal
                                   1715 ; input:
                                   1716 ;	none
                                   1717 ; local variable on stack:
                                   1718 ;	LL  line length
                                   1719 ;   RXCHAR last received chaaracte 
                                   1720 ; output:
                                   1721 ;   text in tib  buffer
                                   1722 ;------------------------------------
                                   1723 	; local variables
                           000001  1724 	LL_HB=1
                           000001  1725 	RXCHAR = 1 ; last char received
                           000002  1726 	LL = 2  ; accepted line length
                           000002  1727 	VSIZE=2 
      000A6F                       1728 readln:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008A90 02               [ 1] 1729 	clrw x 
      008A91 A1               [ 2] 1730 	pushw x 
      008A92 10 27 08 7B      [ 2] 1731  	ldw y,#tib ; input buffer
      000A75                       1732 readln_loop:
      008A96 01 27 08         [ 4] 1733 	call getc
      008A99 A6 2D            [ 1] 1734 	ld (RXCHAR,sp),a
      008A9B 20 02            [ 1] 1735 	cp a,#CR
      008A9D A6 24            [ 1] 1736 	jrne 1$
      008A9F 5A F7 EE         [ 2] 1737 	jp readln_quit
      008AA1 A1 0A            [ 1] 1738 1$:	cp a,#NL
      008AA1 5B 02            [ 1] 1739 	jreq readln_quit
      008AA3 81 08            [ 1] 1740 	cp a,#BSP
      008AA4 27 41            [ 1] 1741 	jreq del_back
      008AA4 89 88            [ 1] 1742 	cp a,#CTRL_D
      008AA6 C6 00            [ 1] 1743 	jreq del_ln
      008AA8 09 95            [ 1] 1744 	cp a,#CTRL_R 
      008AAA C6 00            [ 1] 1745 	jreq reprint 
                                   1746 ;	cp a,#'[
                                   1747 ;	jreq ansi_seq
      000A91                       1748 final_test:
      008AAC 0A 97            [ 1] 1749 	cp a,#SPACE
      008AAE 7B 01            [ 1] 1750 	jrpl accept_char
      008AB0 62 88            [ 2] 1751 	jra readln_loop
      000A97                       1752 ansi_seq:
                                   1753 ;	call getc
                                   1754 ;	cp a,#'C 
                                   1755 ;	jreq rigth_arrow
                                   1756 ;	cp a,#'D 
                                   1757 ;	jreq left_arrow 
                                   1758 ;	jra final_test
      000A97                       1759 right_arrow:
                                   1760 ;	ld a,#BSP 
                                   1761 ;	call putc 
                                   1762 ;	jra realn_loop 
      000A97                       1763 left_arrow:
                                   1764 
                                   1765 ;	jra readln_loop
      000A97                       1766 reprint: 
      008AB2 9E C7 00 09      [ 1] 1767 	tnz count 
      008AB6 9F C7            [ 1] 1768 	jreq readln_loop
      008AB8 00 0A            [ 1] 1769 	tnz (LL,sp)
      008ABA 84 95            [ 1] 1770 	jrne readln_loop
      008ABC C6 00 0B         [ 2] 1771 	ldw x,#tib 
      008ABF 97 7B 01         [ 4] 1772 	call puts
      008AC2 62 6B 01 9F      [ 2] 1773 	ldw y,#tib 
      008AC6 C7 00 0B         [ 1] 1774 	ld a,count 
      008AC9 84 85            [ 1] 1775 	ld (LL,sp),a
      008ACB 81 5F 00 02      [ 1] 1776 	clr count 
      008ACC 0F 01            [ 1] 1777 	clr (LL_HB,sp)
      008ACC 72 53 00         [ 2] 1778 	addw y,(LL_HB,sp)
      008ACF 0B 72            [ 2] 1779 	jra readln_loop 
      000ABB                       1780 del_ln:
      008AD1 53 00            [ 1] 1781 	ld a,(LL,sp)
      008AD3 0A 72 53         [ 4] 1782 	call delete
      008AD6 00 09 A6 01      [ 2] 1783 	ldw y,#tib
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008ADA CB 00            [ 1] 1784 	clr (y)
      008ADC 0B C7            [ 1] 1785 	clr (LL,sp)
      008ADE 00 0B            [ 2] 1786 	jra readln_loop
      000ACA                       1787 del_back:
      008AE0 4F C9            [ 1] 1788     tnz (LL,sp)
      008AE2 00 0A            [ 1] 1789     jreq readln_loop
      008AE4 C7 00            [ 1] 1790     dec (LL,sp)
      008AE6 0A 4F            [ 2] 1791     decw y
      008AE8 C9 00            [ 1] 1792     clr  (y)
      008AEA 09 C7 00         [ 4] 1793     call bksp 
      008AED 09 81            [ 2] 1794     jra readln_loop	
      008AEF                       1795 accept_char:
      008AEF 5F 89            [ 1] 1796 	ld a,#TIB_SIZE-1
      008AF1 90 AE            [ 1] 1797 	cp a, (LL,sp)
      008AF3 16 C8            [ 1] 1798 	jreq readln_loop
      008AF5 7B 01            [ 1] 1799 	ld a,(RXCHAR,sp)
      008AF5 CD 82            [ 1] 1800 	ld (y),a
      008AF7 27 6B            [ 1] 1801 	inc (LL,sp)
      008AF9 01 A1            [ 1] 1802 	incw y
      008AFB 0D 26            [ 1] 1803 	clr (y)
      008AFD 03 CC 8B         [ 4] 1804 	call putc 
      008B00 6E A1            [ 2] 1805 	jra readln_loop
      000AEE                       1806 readln_quit:
      008B02 0A 27            [ 1] 1807 	clr (y)
      008B04 69 A1            [ 1] 1808 	ld a,(LL,sp)
      008B06 08 27 41         [ 1] 1809 	ld count,a 
      000AF5                       1810 	_drop VSIZE 
      008B09 A1 04            [ 2]    1     addw sp,#VSIZE 
      008B0B 27 2E            [ 1] 1811 	ld a,#CR
      008B0D A1 12 27         [ 4] 1812 	call putc
      008B10 06               [ 4] 1813 	ret
                                   1814 
                           000001  1815 .if DEBUG 	
                                   1816 ;----------------------------
                                   1817 ; command interface
                                   1818 ; only 3 commands:
                                   1819 ;  'q' to resume application
                                   1820 ;  'p [addr]' to print memory values 
                                   1821 ;  's addr' to print string 
                                   1822 ;----------------------------
                                   1823 ;local variable 
                           000001  1824 	PSIZE=1
                           000001  1825 	VSIZE=1 
      008B11                       1826 cmd_itf:
      008B11 A1 20            [ 2] 1827 	sub sp,#VSIZE 
      008B13 2A 44 20 DE      [ 1] 1828 	clr farptr 
      008B17 72 5F 00 14      [ 1] 1829 	clr farptr+1 
      008B17 72 5F 00 15      [ 1] 1830 	clr farptr+2  
      008B17                       1831 repl:
      008B17 A6 0D            [ 1] 1832 	ld a,#CR 
      008B17 72 5D 00         [ 4] 1833 	call putc 
      008B1A 03 27            [ 1] 1834 	ld a,#'? 
      008B1C D8 0D 02         [ 4] 1835 	call putc
      008B1F 26 D4 AE 16      [ 1] 1836 	clr in.w 
      008B23 C8 CD 82 30      [ 1] 1837 	clr in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B27 90 AE 16         [ 4] 1838 	call readln
      008B2A C8 C6 00 03      [ 2] 1839 	ldw y,#tib  
      008B2E 6B 02            [ 1] 1840 	ld a,(y)
      008B30 72 5F            [ 1] 1841 	jreq repl  
      008B32 00 03 0F 01      [ 1] 1842 	inc in 
      008B36 72 F9 01         [ 4] 1843 	call to_upper 
      008B39 20 BA            [ 1] 1844 	cp a,#'Q 
      008B3B 26 17            [ 1] 1845 	jrne test_p
      000B33                       1846 repl_exit:
      008B3B 7B 02 CD 82      [ 1] 1847 	clr tib 
      008B3F 4A 90 AE 16      [ 1] 1848 	clr count 
      008B43 C8 90 7F 0F      [ 1] 1849 	clr in 
      000B3F                       1850 	_drop #VSIZE 	
      008B47 02 20            [ 2]    1     addw sp,##VSIZE 
      008B49 AB               [ 4] 1851 	ret  
      008B4A                       1852 invalid:
      008B4A 0D 02 27         [ 2] 1853 	ldw x,#invalid_cmd 
      008B4D A7 0A 02         [ 4] 1854 	call puts 
      008B50 90 5A            [ 2] 1855 	jra repl 
      000B4A                       1856 test_p:	
      008B52 90 7F            [ 1] 1857     cp a,#'P 
      008B54 CD 82            [ 1] 1858 	jreq mem_peek
      008B56 3A 20            [ 1] 1859     cp a,#'S 
      008B58 9C F0            [ 1] 1860 	jrne invalid 
      008B59                       1861 print_string:	
      008B59 A6 4F 11         [ 4] 1862 	call get_token
      008B5C 02 27            [ 1] 1863 	cp a,#TK_INTGR 
      008B5E 96 7B            [ 1] 1864 	jrne invalid 
      008B60 01 90 F7         [ 4] 1865 	call puts
      008B63 0C 02 90         [ 2] 1866 	jp repl 	
      000B5F                       1867 mem_peek:
      008B66 5C 90            [ 1] 1868 	ld a,#SPACE 
      008B68 7F CD 82         [ 4] 1869 	call skip  	 
      008B6B 1E 20 87 00      [ 2] 1870 	addw y,in.w 
      008B6E AE 17 18         [ 2] 1871 	ldw x,#pad 
      008B6E 90 7F 7B         [ 4] 1872 	call strcpy
      008B71 02 C7 00         [ 4] 1873 	call atoi24 	
      008B74 03 5B 02         [ 1] 1874 	ld a, acc24 
      008B77 A6 0D CD         [ 1] 1875 	or a,acc16 
      008B7A 82 1E 81         [ 1] 1876 	or a,acc8 
      008B7D 26 02            [ 1] 1877 	jrne 1$ 
      008B7D 52 01            [ 2] 1878 	jra peek_byte  
      008B7F 72 5F 00         [ 2] 1879 1$:	ldw x,acc24 
      008B82 14 72 5F         [ 2] 1880 	ldw farptr,x 
      008B85 00 15 72         [ 1] 1881 	ld a,acc8 
      008B88 5F 00 16         [ 1] 1882 	ld farptr+2,a 
      008B8B                       1883 peek_byte:
      008B8B A6 0D CD         [ 4] 1884 	call print_farptr 
      008B8E 82 1E            [ 1] 1885 	ld a,#8 
      008B90 A6 3F            [ 1] 1886 	ld (PSIZE,sp),a 
      008B92 CD               [ 1] 1887 	clrw x 
      008B93 82 1E 72         [ 4] 1888 1$:	call fetchc  
      008B96 5F               [ 2] 1889 	pushw x 
      008B97 00 01 72         [ 1] 1890 	ld acc8,a 
      008B9A 5F               [ 1] 1891 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B9B 00 02 CD         [ 2] 1892 	ldw acc24,x 
      008B9E 8A EF            [ 1] 1893 	ld a,#16+128
      008BA0 90 AE 16         [ 4] 1894 	call prti24
      008BA3 C8               [ 2] 1895 	popw x 
      008BA4 90 F6            [ 1] 1896 	dec (PSIZE,sp)
      008BA6 27 E3            [ 1] 1897 	jrne 1$ 
      008BA8 72 5C            [ 1] 1898 	ld a,#8 
      008BAA 00 02 CD         [ 1] 1899 	add a,farptr+2 
      008BAD 8F 4D A1         [ 1] 1900 	ld farptr+2,a
      008BB0 51               [ 1] 1901 	clr a 
      008BB1 26 17 14         [ 1] 1902 	adc a,farptr+1 
      008BB3 C7 00 14         [ 1] 1903 	ld farptr+1,a 
      008BB3 72               [ 1] 1904 	clr a 
      008BB4 5F 16 C8         [ 1] 1905 	adc a,farptr 
      008BB7 72 5F 00         [ 1] 1906 	ld farptr,a 
      008BBA 03 72 5F         [ 2] 1907 	jp repl  
                                   1908 
      008BBD 00 02 5B 01 81 20 63  1909 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1910 
                                   1911 ;----------------------------
                                   1912 ; display farptr address
                                   1913 ;----------------------------
      008BC2                       1914 print_farptr:
      008BC2 AE 8C 40         [ 1] 1915 	ld a ,farptr+2 
      008BC5 CD 82 30         [ 1] 1916 	ld acc8,a 
      008BC8 20 C1 13         [ 2] 1917 	ldw x,farptr 
      008BCA CF 00 08         [ 2] 1918 	ldw acc24,x 
      008BCA A1               [ 1] 1919 	clrw x 
      008BCB 50 27            [ 1] 1920 	ld a,#16 
      008BCD 11 A1 53         [ 4] 1921 	call prti24
      008BD0 26 F0            [ 1] 1922 	ld a,#SPACE 
      008BD2 CD 01 9E         [ 4] 1923 	call putc 
      008BD2 CD 8D 8E         [ 4] 1924 	call putc 
      008BD5 A1               [ 4] 1925 	ret
                                   1926 
                                   1927 ;------------------------------------
                                   1928 ; get byte at address farptr[X]
                                   1929 ; input:
                                   1930 ;	 farptr   address to peek
                                   1931 ;    X		  farptr index 	
                                   1932 ; output:
                                   1933 ;	 A 		  byte from memory  
                                   1934 ;    x		  incremented by 1
                                   1935 ;------------------------------------
      000BEA                       1936 fetchc: ; @C
      008BD6 02 26 E9 CD      [ 5] 1937 	ldf a,([farptr],x)
      008BDA 82               [ 1] 1938 	incw x
      008BDB 30               [ 4] 1939 	ret
                                   1940 
                                   1941 
                                   1942 ;------------------------------------
                                   1943 ; expect a number from command line 
                                   1944 ; next argument
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1945 ;  input:
                                   1946 ;	  none
                                   1947 ;  output:
                                   1948 ;    acc24   int24_t 
                                   1949 ;------------------------------------
      000BF0                       1950 number::
      008BDC CC 8B 8B         [ 4] 1951 	call get_token
      008BDF CD 0E D9         [ 4] 1952 	call atoi24
      008BDF A6               [ 4] 1953 	ret
                                   1954 .endif ; DEBUG 
                                   1955 
                                   1956 ;------------------------------------
                                   1957 ; parse quoted string 
                                   1958 ; input:
                                   1959 ;   Y 	pointer to tib 
                                   1960 ;   X   pointer to pad
                                   1961 ; output:
                                   1962 ;	pad   parsed string
                                   1963 ;   TOS  char* to pad  
                                   1964 ;------------------------------------
                           000001  1965 	PREV = 1
                           000002  1966 	CURR =2 
                           000002  1967 	VSIZE=2 
      000BF7                       1968 parse_quote: ; { -- addr }
      000BF7                       1969 	_vars VSIZE 
      008BE0 20 CD            [ 2]    1     sub sp,#VSIZE 
      008BE2 90               [ 1] 1970 	clr a
      008BE3 05 72            [ 1] 1971 1$:	ld (PREV,sp),a 
      008BE5 B9 00 01 AE      [ 1] 1972 2$:	inc in
      008BE9 17 18 CD         [ 4] 1973 	ld a,([in.w],y)
      008BEC 83 10            [ 1] 1974 	jreq 6$
      008BEE CD 8F            [ 1] 1975 	ld (CURR,sp),a 
      008BF0 59 C6            [ 1] 1976 	ld a,#'\
      008BF2 00 09            [ 1] 1977 	cp a, (PREV,sp)
      008BF4 CA 00            [ 1] 1978 	jrne 3$
      008BF6 0A CA            [ 1] 1979 	clr (PREV,sp)
      008BF8 00 0B            [ 1] 1980 	ld a,(CURR,sp)
      008BFA 26 02            [ 4] 1981 	callr convert_escape
      008BFC 20               [ 1] 1982 	ld (x),a 
      008BFD 0C               [ 1] 1983 	incw x 
      008BFE CE 00            [ 2] 1984 	jra 2$
      000C17                       1985 3$:
      008C00 09 CF            [ 1] 1986 	ld a,(CURR,sp)
      008C02 00 14            [ 1] 1987 	cp a,#'\'
      008C04 C6 00            [ 1] 1988 	jreq 1$
      008C06 0B C7            [ 1] 1989 	cp a,#'"
      008C08 00 16            [ 1] 1990 	jreq 5$ 
      008C0A F7               [ 1] 1991 	ld (x),a 
      008C0A CD               [ 1] 1992 	incw x 
      008C0B 8C 4F            [ 2] 1993 	jra 2$
      008C0D A6 08 6B 01      [ 1] 1994 5$:	inc in 
      008C11 5F               [ 1] 1995 6$: clr (x)
      008C12 CD 8C 6A         [ 2] 1996 	ldw x,#pad 
      000C2D                       1997 	_drop VSIZE
      008C15 89 C7            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008C17 00 0B            [ 1] 1998 	ld a,#TK_QSTR  
      008C19 5F               [ 4] 1999 	ret 
                                   2000 
                                   2001 ;---------------------------------------
                                   2002 ; called by parse_quote
                                   2003 ; subtitute escaped character 
                                   2004 ; by their ASCII value .
                                   2005 ; input:
                                   2006 ;   A  character following '\'
                                   2007 ; output:
                                   2008 ;   A  substitued char or same if not valid.
                                   2009 ;---------------------------------------
      000C32                       2010 convert_escape:
      008C1A CF 00            [ 1] 2011 	cp a,#'a'
      008C1C 09 A6            [ 1] 2012 	jrne 1$
      008C1E 90 CD            [ 1] 2013 	ld a,#7
      008C20 89               [ 4] 2014 	ret 
      008C21 B9 85            [ 1] 2015 1$: cp a,#'b'
      008C23 0A 01            [ 1] 2016 	jrne 2$
      008C25 26 EB            [ 1] 2017 	ld a,#8
      008C27 A6               [ 4] 2018 	ret 
      008C28 08 CB            [ 1] 2019 2$: cp a,#'e' 
      008C2A 00 16            [ 1] 2020     jrne 3$
      008C2C C7 00            [ 1] 2021 	ld a,#'\'
      008C2E 16               [ 4] 2022 	ret  
      008C2F 4F C9            [ 1] 2023 3$: cp a,#'\'
      008C31 00 15            [ 1] 2024 	jrne 4$
      008C33 C7 00            [ 1] 2025 	ld a,#'\'
      008C35 15               [ 4] 2026 	ret 
      008C36 4F C9            [ 1] 2027 4$: cp a,#'f' 
      008C38 00 14            [ 1] 2028 	jrne 5$ 
      008C3A C7 00            [ 1] 2029 	ld a,#FF 
      008C3C 14               [ 4] 2030 	ret  
      008C3D CC 8B            [ 1] 2031 5$: cp a,#'n' 
      008C3F 8B 6E            [ 1] 2032     jrne 6$ 
      008C41 6F 74            [ 1] 2033 	ld a,#0xa 
      008C43 20               [ 4] 2034 	ret  
      008C44 61 20            [ 1] 2035 6$: cp a,#'r' 
      008C46 63 6F            [ 1] 2036 	jrne 7$
      008C48 6D 6D            [ 1] 2037 	ld a,#0xd 
      008C4A 61               [ 4] 2038 	ret  
      008C4B 6E 64            [ 1] 2039 7$: cp a,#'t' 
      008C4D 0A 00            [ 1] 2040 	jrne 8$ 
      008C4F A6 09            [ 1] 2041 	ld a,#9 
      008C4F C6               [ 4] 2042 	ret  
      008C50 00 16            [ 1] 2043 8$: cp a,#'v' 
      008C52 C7 00            [ 1] 2044 	jrne 9$  
      008C54 0B CE            [ 1] 2045 	ld a,#0xb 
      008C56 00               [ 4] 2046 9$:	ret 
                                   2047 
                                   2048 ;-------------------------
                                   2049 ; integer parser 
                                   2050 ; input:
                                   2051 ;   X 		point to pad 
                                   2052 ;   Y 		point to tib 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2053 ;   A 	    first digit|'$' 
                                   2054 ; output:  
                                   2055 ;   pad     number string 
                                   2056 ;   X 		integer 
                                   2057 ;   A 		TK_INTGR
                                   2058 ;-------------------------
                           000001  2059 	BASE=1
                           000002  2060 	TCHAR=2 
                           000002  2061 	VSIZE=2 
      000C71                       2062 parse_integer: ; { -- n }
      008C57 14 CF            [ 1] 2063 	push #0 ; TCHAR 
      008C59 00 09            [ 1] 2064 	cp a,#'$
      008C5B 5F A6            [ 1] 2065 	jreq 1$ 
      008C5D 10 CD            [ 1] 2066 	push #10 ; BASE=10 
      008C5F 89 B9            [ 2] 2067 	jra 2$ 
      008C61 A6 20            [ 1] 2068 1$: push #16  ; BASE=16
      008C63 CD               [ 1] 2069 2$:	ld (x),a 
      008C64 82               [ 1] 2070 	incw x 
      008C65 1E CD 82 1E      [ 1] 2071 	inc in 
      008C69 81 D6 00         [ 4] 2072 	ld a,([in.w],y)
      008C6A CD 0E CD         [ 4] 2073 	call to_upper 
      008C6A 92 AF            [ 1] 2074 	ld (TCHAR,sp),a 
      008C6C 00 14 5C         [ 4] 2075 	call is_digit 
      008C6F 81 ED            [ 1] 2076 	jrc 2$
      008C70 A6 10            [ 1] 2077 	ld a,#16 
      008C70 CD 8D            [ 1] 2078 	cp a,(BASE,sp)
      008C72 8E CD            [ 1] 2079 	jrne 3$ 
      008C74 8F 59            [ 1] 2080 	ld a,(TCHAR,sp)
      008C76 81 41            [ 1] 2081 	cp a,#'A 
      008C77 2B 04            [ 1] 2082 	jrmi 3$ 
      008C77 52 02            [ 1] 2083 	cp a,#'G 
      008C79 4F 6B            [ 1] 2084 	jrmi 2$ 
      008C7B 01               [ 1] 2085 3$:	clr (x)
      008C7C 72 5C 00         [ 4] 2086 	call atoi24
      008C7F 02 91 D6         [ 2] 2087 	ldw x,acc16 
      008C82 01 27            [ 1] 2088 	ld a,#TK_INTGR
      000CA9                       2089 	_drop VSIZE  
      008C84 24 6B            [ 2]    1     addw sp,#VSIZE 
      008C86 02               [ 4] 2090 	ret 	
                                   2091 
                                   2092 ;-------------------------
                                   2093 ; binary integer parser 
                                   2094 ; input:
                                   2095 ;   X 		point to pad 
                                   2096 ;   Y 		point to tib 
                                   2097 ;   A 	    '%' 
                                   2098 ; output:  
                                   2099 ;   pad     number string 
                                   2100 ;   X 		integer 
                                   2101 ;   A 		TK_INTGR
                                   2102 ;   TOS     integer 
                                   2103 ;-------------------------
                           000001  2104 	BINARY=1
                           000002  2105 	VSIZE=2
      000CAC                       2106 parse_binary: ; { -- n }
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C87 A6 5C            [ 1] 2107 	push #0
      008C89 11 01            [ 1] 2108 	push #0
      008C8B 26               [ 1] 2109 1$: ld (x),a 
      008C8C 0A               [ 1] 2110 	incw x 
      008C8D 0F 01 7B 02      [ 1] 2111 	inc in 
      008C91 AD 1F F7         [ 4] 2112 	ld a,([in.w],y)
      008C94 5C 20            [ 1] 2113 	cp a,#'0 
      008C96 E5 06            [ 1] 2114 	jreq 2$
      008C97 A1 31            [ 1] 2115 	cp a,#'1 
      008C97 7B 02            [ 1] 2116 	jreq 2$ 
      008C99 A1 5C            [ 2] 2117 	jra bin_exit 
      008C9B 27 DD            [ 1] 2118 2$: sub a,#'0	
      008C9D A1               [ 1] 2119 	rrc a 
      008C9E 22 27            [ 1] 2120 	rlc (BINARY+1,sp)
      008CA0 04 F7            [ 1] 2121 	rlc (BINARY,sp)
      008CA2 5C 20            [ 2] 2122 	jra 1$  
      000CCC                       2123 bin_exit:
      008CA4 D7               [ 1] 2124 	clr (x)
      008CA5 72 5C            [ 2] 2125 	ldw x,(BINARY,sp)
      008CA7 00 02            [ 1] 2126 	ld a,#TK_INTGR 	
      000CD1                       2127 	_drop VSIZE 
      008CA9 7F AE            [ 2]    1     addw sp,#VSIZE 
      008CAB 17               [ 4] 2128 	ret
                                   2129 
                                   2130 ;---------------------------
                                   2131 ;  token begin with a letter,
                                   2132 ;  is keyword or variable. 	
                                   2133 ; input:
                                   2134 ;   X 		point to pad 
                                   2135 ;   Y 		point to text
                                   2136 ;   A 	    first letter  
                                   2137 ; output:
                                   2138 ;   X		exec_addr|var_addr 
                                   2139 ;   A 		TK_CMD 
                                   2140 ;   pad 	keyword|var_name  
                                   2141 ;   TOS     exec_addr|var_addr 
                                   2142 ;--------------------------  
      000CD4                       2143 parse_keyword: ; { -- exec_addr|var_addr}
      008CAC 18 5B 02         [ 4] 2144 	call to_upper 
      008CAF A6               [ 1] 2145 	ld (x),a 
      008CB0 08               [ 1] 2146 	incw x 
      008CB1 81 5C 00 01      [ 1] 2147 	inc in 
      008CB2 91 D6 00         [ 4] 2148 	ld a,([in.w],y)
      008CB2 A1 61 26         [ 4] 2149 	call is_alpha 
      008CB5 03 A6            [ 1] 2150 	jrc parse_keyword 
      008CB7 07               [ 1] 2151 1$: clr (x)
      008CB8 81 A1 62 26      [ 1] 2152 	tnz pad+1 
      008CBC 03 A6            [ 1] 2153 	jrne 2$
                                   2154 ; one letter variable name 
      008CBE 08 81 A1         [ 1] 2155 	ld a,pad 
      008CC1 65 26            [ 1] 2156 	sub a,#'A 
      008CC3 03               [ 1] 2157 	sll a 
      008CC4 A6               [ 1] 2158 	push a 
      008CC5 5C 81            [ 1] 2159 	push #0
      008CC7 A1 5C 26         [ 2] 2160 	ldw x,#vars 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CCA 03 A6 5C         [ 2] 2161 	addw x,(1,sp) ; X=var address 
      000CFB                       2162 	_drop 2 
      008CCD 81 A1            [ 2]    1     addw sp,#2 
      008CCF 66 26            [ 1] 2163 	ld a,#TK_VAR 
      008CD1 03 A6            [ 2] 2164 	jra 4$ 
      000D01                       2165 2$: ; check for keyword, otherwise syntax error.
      000D01                       2166 	_ldx_dict kword_dict
      008CD3 0C 81 A1         [ 2]    1     ldw x,#kword_dict+2
      008CD6 6E 26 03         [ 4] 2167 	call search_dict
      008CD9 A6               [ 1] 2168 	tnz a
      008CDA 0A 81            [ 1] 2169 	jrne 4$ 
      008CDC A1 72 26         [ 2] 2170 	jp syntax_error
      008CDF 03               [ 4] 2171 4$:	ret  	
                                   2172 
                                   2173 
                                   2174 ;------------------------------------
                                   2175 ; Command line tokenizer
                                   2176 ; scan text for next token
                                   2177 ; move token in 'pad'
                                   2178 ; input: 
      000D0E                       2179 	none: 
                                   2180 ; use:
                                   2181 ;	Y   pointer to text
                                   2182 ;   X	pointer to pad 
                                   2183 ;   in.w   index in text buffer
                                   2184 ; output:
                                   2185 ;   A       token attribute 
                                   2186 ;   pad 	token as .asciz
                                   2187 ;   X 		token value   
                                   2188 ;------------------------------------
                                   2189 	; use to check special character 
                                   2190 	.macro _case c t  
                                   2191 	ld a,#c 
                                   2192 	cp a,(TCHAR,sp) 
                                   2193 	jrne t
                                   2194 	.endm 
                                   2195 
                           000001  2196 	TCHAR=1
                           000002  2197 	ATTRIB=2 
                           000002  2198 	VSIZE=2
      000D0E                       2199 get_token: 
      008CE0 A6 0D 81 A1      [ 2] 2200 	ldw y,#tib    	
      008CE4 74 26 03         [ 1] 2201 	ld a,in 
      008CE7 A6 09 81         [ 1] 2202 	cp a,count 
      008CEA A1 76            [ 1] 2203 	jrmi 1$
      008CEC 26 02            [ 1] 2204 	ld a,#TK_NONE 
      008CEE A6               [ 4] 2205 	ret 
      000D1D                       2206 1$:	
      000D1D                       2207 	_vars VSIZE
      008CEF 0B 81            [ 2]    1     sub sp,#VSIZE 
      008CF1 AE 17 18         [ 2] 2208 	ldw x, #pad
      008CF1 4B 00            [ 1] 2209 	ld a,#SPACE
      008CF3 A1 24 27         [ 4] 2210 	call skip
      008CF6 04 4B 0A         [ 2] 2211 	ldw in.w.saved,x 
      008CF9 20 02 4B         [ 4] 2212 	ld a,([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008CFC 10 F7            [ 1] 2213 	jrne str_tst
      008CFE 5C 72 5C 00      [ 1] 2214 	clr pad 
      008D02 02 91 D6         [ 2] 2215 	jp token_exit ; end of line 
                                   2216 
      000D36                       2217 str_tst: ; check for quoted string  	
      008D05 01 CD 8F         [ 4] 2218 	call to_upper 
      008D08 4D 6B            [ 1] 2219 	ld (TCHAR,sp),a 
      000D3B                       2220 	_case '"' nbr_tst
      008D0A 02 CD            [ 1]    1 	ld a,#'"' 
      008D0C 8F 44            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0E 25 ED            [ 1]    3 	jrne nbr_tst
      008D10 A6 10 11         [ 4] 2221 	call parse_quote
      008D13 01 26 0A         [ 2] 2222 	jp token_exit
      000D47                       2223 nbr_tst: ; check for number 
      008D16 7B 02            [ 1] 2224 	ld a,#'$'
      008D18 A1 41            [ 1] 2225 	cp a,(TCHAR,sp) 
      008D1A 2B 04            [ 1] 2226 	jreq 1$
      008D1C A1 47            [ 1] 2227 	ld a,#'&
      008D1E 2B DD            [ 1] 2228 	cp a,(TCHAR,sp)
      008D20 7F CD            [ 1] 2229 	jrne 0$
      008D22 8F 59 CE         [ 4] 2230 	call parse_binary ; expect binary integer 
      008D25 00 0A A6         [ 2] 2231 	jp token_exit 
      008D28 02 5B            [ 1] 2232 0$:	ld a,(TCHAR,sp)
      008D2A 02 81 C4         [ 4] 2233 	call is_digit
      008D2C 24 06            [ 1] 2234 	jrnc 3$
      008D2C 4B 00 4B         [ 4] 2235 1$:	call parse_integer 
      008D2F 00 F7 5C         [ 2] 2236 	jp token_exit 
      000D66                       2237 3$: 
      000D66                       2238 	_case '(' bkslsh_tst 
      008D32 72 5C            [ 1]    1 	ld a,#'(' 
      008D34 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D36 91 D6            [ 1]    3 	jrne bkslsh_tst
      008D38 01 A1            [ 1] 2239 	ld a,#TK_LPAREN
      008D3A 30 27 06         [ 2] 2240 	jp token_char   	
      000D71                       2241 bkslsh_tst:
      000D71                       2242 	_case '\',rparnt_tst
      008D3D A1 31            [ 1]    1 	ld a,#'\' 
      008D3F 27 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D41 20 09            [ 1]    3 	jrne rparnt_tst
      008D43 A0 30            [ 1] 2243 	ld a,(TCHAR,sp)
      008D45 46               [ 1] 2244 	ld (x),a 
      008D46 09               [ 1] 2245 	incw x 
      008D47 02 09 01 20      [ 1] 2246 	inc in 
      008D4B E4 D6 00         [ 4] 2247 	ld a,([in.w],y)
      008D4C F7               [ 1] 2248 	ld (x),a 
      008D4C 7F               [ 1] 2249 	incw x 
      008D4D 1E 01 A6 02      [ 1] 2250 	inc in  
      008D51 5B               [ 1] 2251 	clr (x) 
      008D52 02               [ 1] 2252 	ld xl,a 
      008D53 81 05            [ 1] 2253 	ld a,#TK_CHAR 
      008D54 CC 0E C1         [ 2] 2254 	jp token_exit 
      000D8F                       2255 rparnt_tst:		
      000D8F                       2256 	_case ')' colon_tst 
      008D54 CD 8F            [ 1]    1 	ld a,#')' 
      008D56 4D F7            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D58 5C 72            [ 1]    3 	jrne colon_tst
      008D5A 5C 00            [ 1] 2257 	ld a,#TK_RPAREN 
      008D5C 02 91 D6         [ 2] 2258 	jp token_char 
      000D9A                       2259 colon_tst:
      000D9A                       2260 	_case ':' comma_tst 
      008D5F 01 CD            [ 1]    1 	ld a,#':' 
      008D61 85 75            [ 1]    2 	cp a,(TCHAR,sp) 
      008D63 25 EF            [ 1]    3 	jrne comma_tst
      008D65 7F 72            [ 1] 2261 	ld a,#TK_COLON 
      008D67 5D 17 19         [ 2] 2262 	jp token_char 
      000DA5                       2263 comma_tst:
      000DA5                       2264 	_case COMMA sharp_tst 
      008D6A 26 15            [ 1]    1 	ld a,#COMMA 
      008D6C C6 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008D6E 18 A0            [ 1]    3 	jrne sharp_tst
      008D70 41 48            [ 1] 2265 	ld a,#TK_COMMA
      008D72 88 4B 00         [ 2] 2266 	jp token_char
      000DB0                       2267 sharp_tst:
      000DB0                       2268 	_case SHARP dash_tst 
      008D75 AE 00            [ 1]    1 	ld a,#SHARP 
      008D77 27 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008D79 FB 01            [ 1]    3 	jrne dash_tst
      008D7B 5B 02            [ 1] 2269 	ld a,#TK_SHARP
      008D7D A6 03 20         [ 2] 2270 	jp token_char  	 	 
      000DBB                       2271 dash_tst: 	
      000DBB                       2272 	_case '-' at_tst 
      008D80 0C 2D            [ 1]    1 	ld a,#'-' 
      008D81 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D81 AE A1            [ 1]    3 	jrne at_tst
      008D83 8D CD            [ 1] 2273 	ld a,#TK_MINUS  
      008D85 91 EA 4D         [ 2] 2274 	jp token_char 
      000DC6                       2275 at_tst:
      000DC6                       2276 	_case '@' qmark_tst 
      008D88 26 03            [ 1]    1 	ld a,#'@' 
      008D8A CC 87            [ 1]    2 	cp a,(TCHAR,sp) 
      008D8C 89 81            [ 1]    3 	jrne qmark_tst
      008D8E A6 04            [ 1] 2277 	ld a,#TK_ARRAY 
      008D8E CC 0E B1         [ 2] 2278 	jp token_char
      000DD1                       2279 qmark_tst:
      000DD1                       2280 	_case '?' tick_tst 
      008D8E 90 AE            [ 1]    1 	ld a,#'?' 
      008D90 16 C8            [ 1]    2 	cp a,(TCHAR,sp) 
      008D92 C6 00            [ 1]    3 	jrne tick_tst
      008D94 02 C1            [ 1] 2281 	ld a,(TCHAR,sp)
      008D96 00               [ 1] 2282 	ld (x),a 
      008D97 03               [ 1] 2283 	incw x 
      008D98 2B               [ 1] 2284 	clr (x)
      008D99 03 A6 00 81      [ 1] 2285 	inc in 
      008D9D A6 06            [ 1] 2286 	ld a,#TK_CMD 
      008D9D 52 02 AE         [ 2] 2287 	ldw x,#print 
      008DA0 17 18 A6         [ 2] 2288 	jp token_exit
      000DE8                       2289 tick_tst: ; ignore comment 
      000DE8                       2290 	_case TICK plus_tst 
      008DA3 20 CD            [ 1]    1 	ld a,#TICK 
      008DA5 90 05            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008DA7 CF 00            [ 1]    3 	jrne plus_tst
      008DA9 12 91 D6 01      [ 1] 2291 	inc in 
      008DAD 26 07            [ 1] 2292 	ld a,#TK_CMD 
      008DAF 72 5F 17         [ 2] 2293 	ldw x,#rem 
      008DB2 18 CC 8F         [ 2] 2294 	jp token_exit 
      000DFA                       2295 plus_tst:
      000DFA                       2296 	_case '+' star_tst 
      008DB5 41 2B            [ 1]    1 	ld a,#'+' 
      008DB6 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB6 CD 8F            [ 1]    3 	jrne star_tst
      008DB8 4D 6B            [ 1] 2297 	ld a,#TK_PLUS  
      008DBA 01 A6 22         [ 2] 2298 	jp token_char 
      000E05                       2299 star_tst:
      000E05                       2300 	_case '*' slash_tst 
      008DBD 11 01            [ 1]    1 	ld a,#'*' 
      008DBF 26 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC1 CD 8C            [ 1]    3 	jrne slash_tst
      008DC3 77 CC            [ 1] 2301 	ld a,#TK_MULT 
      008DC5 8F 41 B1         [ 2] 2302 	jp token_char 
      008DC7                       2303 slash_tst: 
      000E10                       2304 	_case '/' prcnt_tst 
      008DC7 A6 24            [ 1]    1 	ld a,#'/' 
      008DC9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DCB 27 13            [ 1]    3 	jrne prcnt_tst
      008DCD A6 26            [ 1] 2305 	ld a,#TK_DIV 
      008DCF 11 01 26         [ 2] 2306 	jp token_char 
      000E1B                       2307 prcnt_tst:
      000E1B                       2308 	_case '%' eql_tst 
      008DD2 06 CD            [ 1]    1 	ld a,#'%' 
      008DD4 8D 2C            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD6 CC 8F            [ 1]    3 	jrne eql_tst
      008DD8 41 7B            [ 1] 2309 	ld a,#TK_MOD
      008DDA 01 CD 8F         [ 2] 2310 	jp token_char  
                                   2311 ; 1 or 2 character tokens 	
      000E26                       2312 eql_tst:
      000E26                       2313 	_case '=' gt_tst 		
      008DDD 44 24            [ 1]    1 	ld a,#'=' 
      008DDF 06 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE1 8C F1            [ 1]    3 	jrne gt_tst
      008DE3 CC 8F            [ 1] 2314 	ld a,#TK_EQUAL
      008DE5 41 0E B1         [ 2] 2315 	jp token_char 
      008DE6                       2316 gt_tst:
      000E31                       2317 	_case '>' lt_tst 
      008DE6 A6 28            [ 1]    1 	ld a,#'>' 
      008DE8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DEA 26 05            [ 1]    3 	jrne lt_tst
      008DEC A6 09            [ 1] 2318 	ld a,#TK_GT 
      008DEE CC 8F            [ 1] 2319 	ld (ATTRIB,sp),a 
      008DF0 31 5C 00 01      [ 1] 2320 	inc in 
      008DF1 91 D6 00         [ 4] 2321 	ld a,([in.w],y)
      008DF1 A6 5C            [ 1] 2322 	cp a,#'=
      008DF3 11 01            [ 1] 2323 	jrne 1$
      008DF5 26 18            [ 1] 2324 	ld a,(TCHAR,sp)
      008DF7 7B               [ 1] 2325 	ld (x),a
      008DF8 01               [ 1] 2326 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DF9 F7 5C            [ 1] 2327 	ld a,#'=
      008DFB 72 5C            [ 1] 2328 	ld (TCHAR,sp),a 
      008DFD 00 02            [ 1] 2329 	ld a,#TK_GE 
      008DFF 91 D6            [ 2] 2330 	jra token_char  
      008E01 01 F7            [ 1] 2331 1$: cp a,#'<
      008E03 5C 72            [ 1] 2332 	jrne 2$
      008E05 5C 00            [ 1] 2333 	ld a,(TCHAR,sp)
      008E07 02               [ 1] 2334 	ld (x),a
      008E08 7F               [ 1] 2335 	incw x 
      008E09 97 A6            [ 1] 2336 	ld a,#'<	
      008E0B 05 CC            [ 1] 2337 	ld (TCHAR,sp),a 
      008E0D 8F 41            [ 1] 2338 	ld a,#TK_NE 
      008E0F 20 4F            [ 2] 2339 	jra token_char 
      008E0F A6 29 11 01      [ 1] 2340 2$: dec in
      008E13 26 05            [ 1] 2341 	ld a,(ATTRIB,sp)
      008E15 A6 0A            [ 2] 2342 	jra token_char 
      000E6A                       2343 lt_tst:
      000E6A                       2344 	_case '<' other
      008E17 CC 8F            [ 1]    1 	ld a,#'<' 
      008E19 31 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E1A 26 32            [ 1]    3 	jrne other
      008E1A A6 3A            [ 1] 2345 	ld a,#TK_LT 
      008E1C 11 01            [ 1] 2346 	ld (ATTRIB,sp),a 
      008E1E 26 05 A6 01      [ 1] 2347 	inc in 
      008E22 CC 8F 31         [ 4] 2348 	ld a,([in.w],y)
      008E25 A1 3D            [ 1] 2349 	cp a,#'=
      008E25 A6 2C            [ 1] 2350 	jrne 1$
      008E27 11 01            [ 1] 2351 	ld a,(TCHAR,sp)
      008E29 26               [ 1] 2352 	ld (x),a 
      008E2A 05 A6            [ 1] 2353 	ld a,#'=
      008E2C 0B CC            [ 1] 2354 	ld (TCHAR,sp),a 
      008E2E 8F 31            [ 1] 2355 	ld a,#TK_LE 
      008E30 20 27            [ 2] 2356 	jra token_char 
      008E30 A6 23            [ 1] 2357 1$: cp a,#'>
      008E32 11 01            [ 1] 2358 	jrne 2$
      008E34 26 05            [ 1] 2359 	ld a,(TCHAR,sp)
      008E36 A6               [ 1] 2360 	ld (x),a 
      008E37 0C               [ 1] 2361 	incw x 
      008E38 CC 8F            [ 1] 2362 	ld a,#'>
      008E3A 31 01            [ 1] 2363 	ld (TCHAR,sp),a 
      008E3B A6 35            [ 1] 2364 	ld a,#TK_NE 
      008E3B A6 2D            [ 2] 2365 	jra token_char 
      008E3D 11 01 26 05      [ 1] 2366 2$: dec in 
      008E41 A6 11            [ 1] 2367 	ld a,(ATTRIB,sp)
      008E43 CC 8F            [ 2] 2368 	jra token_char 	
      000EA2                       2369 other: ; not a special character 	 
      008E45 31 01            [ 1] 2370 	ld a,(TCHAR,sp)
      008E46 CD 04 F5         [ 4] 2371 	call is_alpha 
      008E46 A6 40            [ 1] 2372 	jrc 30$ 
      008E48 11 01 26         [ 2] 2373 	jp syntax_error 
      000EAC                       2374 30$: 
      008E4B 05 A6 04         [ 4] 2375 	call parse_keyword
      008E4E CC 8F            [ 2] 2376 	jra token_exit 
      000EB1                       2377 token_char:
      008E50 31 02            [ 1] 2378 	ld (ATTRIB,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E51 7B 01            [ 1] 2379 	ld a,(TCHAR,sp)
      008E51 A6               [ 1] 2380 	ld (x),a 
      008E52 3F               [ 1] 2381 	incw x 
      008E53 11               [ 1] 2382 	clr(x)
      008E54 01 26 11 7B      [ 1] 2383 	inc in 
      008E58 01 F7            [ 1] 2384 	ld a,(ATTRIB,sp)
      008E5A 5C 7F 72         [ 2] 2385 	ldw x,#pad 
      000EC1                       2386 token_exit:
      000EC1                       2387 	_drop VSIZE 
      008E5D 5C 00            [ 2]    1     addw sp,#VSIZE 
      008E5F 02               [ 4] 2388 	ret
                                   2389 
                                   2390 
                                   2391 
                                   2392 ;------------------------------------
                                   2393 ; check if character in {'0'..'9'}
                                   2394 ; input:
                                   2395 ;    A  character to test
                                   2396 ; output:
                                   2397 ;    Carry  0 not digit | 1 digit
                                   2398 ;------------------------------------
      000EC4                       2399 is_digit:
      008E60 A6 06            [ 1] 2400 	cp a,#'0
      008E62 AE 96            [ 1] 2401 	jrc 1$
      008E64 34 CC            [ 1] 2402     cp a,#'9+1
      008E66 8F               [ 1] 2403 	ccf 
      008E67 41               [ 1] 2404 1$:	ccf 
      008E68 81               [ 4] 2405     ret
                                   2406 
                                   2407 ;------------------------------------
                                   2408 ; convert alpha to uppercase
                                   2409 ; input:
                                   2410 ;    a  character to convert
                                   2411 ; output:
                                   2412 ;    a  uppercase character
                                   2413 ;------------------------------------
      000ECD                       2414 to_upper::
      008E68 A6 27            [ 1] 2415 	cp a,#'a
      008E6A 11 01            [ 1] 2416 	jrpl 1$
      008E6C 26               [ 4] 2417 0$:	ret
      008E6D 0C 72            [ 1] 2418 1$: cp a,#'z	
      008E6F 5C 00            [ 1] 2419 	jrugt 0$
      008E71 02 A6            [ 1] 2420 	sub a,#32
      008E73 06               [ 4] 2421 	ret
                                   2422 	
                                   2423 ;------------------------------------
                                   2424 ; convert pad content in integer
                                   2425 ; input:
                                   2426 ;    pad		.asciz to convert
                                   2427 ; output:
                                   2428 ;    acc24      int24_t
                                   2429 ;------------------------------------
                                   2430 	; local variables
                           000001  2431 	SIGN=1 ; 1 byte, 
                           000002  2432 	BASE=2 ; 1 byte, numeric base used in conversion
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                           000003  2433 	TEMP=3 ; 1 byte, temporary storage
                           000003  2434 	VSIZE=3 ; 3 bytes reserved for local storage
      000ED9                       2435 atoi24:
      008E74 AE               [ 2] 2436 	pushw x ;save x
      008E75 97 42            [ 2] 2437 	sub sp,#VSIZE
                                   2438 	; acc24=0 
      008E77 CC 8F 41 08      [ 1] 2439 	clr acc24    
      008E7A 72 5F 00 09      [ 1] 2440 	clr acc16
      008E7A A6 2B 11 01      [ 1] 2441 	clr acc8 
      008E7E 26 05 A6         [ 1] 2442 	ld a, pad 
      008E81 10 CC            [ 1] 2443 	jreq atoi_exit
      008E83 8F 31            [ 1] 2444 	clr (SIGN,sp)
      008E85 A6 0A            [ 1] 2445 	ld a,#10
      008E85 A6 2A            [ 1] 2446 	ld (BASE,sp),a ; default base decimal
      008E87 11 01 26         [ 2] 2447 	ldw x,#pad ; pointer to string to convert
      008E8A 05               [ 1] 2448 	ld a,(x)
      008E8B A6 20            [ 1] 2449 	jreq 9$  ; completed if 0
      008E8D CC 8F            [ 1] 2450 	cp a,#'-
      008E8F 31 04            [ 1] 2451 	jrne 1$
      008E90 03 01            [ 1] 2452 	cpl (SIGN,sp)
      008E90 A6 2F            [ 2] 2453 	jra 2$
      008E92 11 01            [ 1] 2454 1$: cp a,#'$
      008E94 26 05            [ 1] 2455 	jrne 3$
      008E96 A6 21            [ 1] 2456 	ld a,#16
      008E98 CC 8F            [ 1] 2457 	ld (BASE,sp),a
      008E9A 31               [ 1] 2458 2$:	incw x
      008E9B F6               [ 1] 2459 	ld a,(x)
      000F0B                       2460 3$:	
      008E9B A6 25            [ 1] 2461 	cp a,#'a
      008E9D 11 01            [ 1] 2462 	jrmi 4$
      008E9F 26 05            [ 1] 2463 	sub a,#32
      008EA1 A6 22            [ 1] 2464 4$:	cp a,#'0
      008EA3 CC 8F            [ 1] 2465 	jrmi 9$
      008EA5 31 30            [ 1] 2466 	sub a,#'0
      008EA6 A1 0A            [ 1] 2467 	cp a,#10
      008EA6 A6 3D            [ 1] 2468 	jrmi 5$
      008EA8 11 01            [ 1] 2469 	sub a,#7
      008EAA 26 05            [ 1] 2470 	cp a,(BASE,sp)
      008EAC A6 32            [ 1] 2471 	jrpl 9$
      008EAE CC 8F            [ 1] 2472 5$:	ld (TEMP,sp),a
      008EB0 31 02            [ 1] 2473 	ld a,(BASE,sp)
      008EB1 CD 0F 4B         [ 4] 2474 	call mulu24_8
      008EB1 A6 3E            [ 1] 2475 	ld a,(TEMP,sp)
      008EB3 11 01 26         [ 1] 2476 	add a,acc24+2
      008EB6 33 A6 31         [ 1] 2477 	ld acc24+2,a
      008EB9 6B               [ 1] 2478 	clr a
      008EBA 02 72 5C         [ 1] 2479 	adc a,acc24+1
      008EBD 00 02 91         [ 1] 2480 	ld acc24+1,a
      008EC0 D6               [ 1] 2481 	clr a
      008EC1 01 A1 3D         [ 1] 2482 	adc a,acc24
      008EC4 26 0C 7B         [ 1] 2483 	ld acc24,a
      008EC7 01 F7            [ 2] 2484 	jra 2$
      008EC9 5C A6            [ 1] 2485 9$:	tnz (SIGN,sp)
      008ECB 3D 6B            [ 1] 2486     jreq atoi_exit
      008ECD 01 A6 33         [ 4] 2487     call neg_acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      000F47                       2488 atoi_exit: 
      008ED0 20 5F            [ 2] 2489 	addw sp,#VSIZE
      008ED2 A1               [ 2] 2490 	popw x ; restore x
      008ED3 3C               [ 4] 2491 	ret
                                   2492 
                                   2493 ;--------------------------------------
                                   2494 ; unsigned multiply uint24_t by uint8_t
                                   2495 ; use to convert numerical string to uint24_t
                                   2496 ; input:
                                   2497 ;	acc24	uint24_t 
                                   2498 ;   A		uint8_t
                                   2499 ; output:
                                   2500 ;   acc24   A*acc24
                                   2501 ;-------------------------------------
                                   2502 ; local variables offset  on sp
                           000003  2503 	U8   = 3   ; A pushed on stack
                           000002  2504 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2505 	OVFH = 1  ; multiplication overflow high byte
                           000003  2506 	VSIZE = 3
      000F4B                       2507 mulu24_8:
      008ED4 26               [ 2] 2508 	pushw x    ; save X
                                   2509 	; local variables
      008ED5 0C               [ 1] 2510 	push a     ; U8
      008ED6 7B               [ 1] 2511 	clrw x     ; initialize overflow to 0
      008ED7 01               [ 2] 2512 	pushw x    ; multiplication overflow
                                   2513 ; multiply low byte.
      008ED8 F7 5C A6         [ 1] 2514 	ld a,acc24+2
      008EDB 3C               [ 1] 2515 	ld xl,a
      008EDC 6B 01            [ 1] 2516 	ld a,(U8,sp)
      008EDE A6               [ 4] 2517 	mul x,a
      008EDF 35               [ 1] 2518 	ld a,xl
      008EE0 20 4F 72         [ 1] 2519 	ld acc24+2,a
      008EE3 5A               [ 1] 2520 	ld a, xh
      008EE4 00 02            [ 1] 2521 	ld (OVFL,sp),a
                                   2522 ; multipy middle byte
      008EE6 7B 02 20         [ 1] 2523 	ld a,acc24+1
      008EE9 47               [ 1] 2524 	ld xl,a
      008EEA 7B 03            [ 1] 2525 	ld a, (U8,sp)
      008EEA A6               [ 4] 2526 	mul x,a
                                   2527 ; add overflow to this partial product
      008EEB 3C 11 01         [ 2] 2528 	addw x,(OVFH,sp)
      008EEE 26               [ 1] 2529 	ld a,xl
      008EEF 32 A6 34         [ 1] 2530 	ld acc24+1,a
      008EF2 6B               [ 1] 2531 	clr a
      008EF3 02 72            [ 1] 2532 	adc a,#0
      008EF5 5C 00            [ 1] 2533 	ld (OVFH,sp),a
      008EF7 02               [ 1] 2534 	ld a,xh
      008EF8 91 D6            [ 1] 2535 	ld (OVFL,sp),a
                                   2536 ; multiply most signficant byte	
      008EFA 01 A1 3D         [ 1] 2537 	ld a, acc24
      008EFD 26               [ 1] 2538 	ld xl, a
      008EFE 0B 7B            [ 1] 2539 	ld a, (U8,sp)
      008F00 01               [ 4] 2540 	mul x,a
      008F01 F7 A6 3D         [ 2] 2541 	addw x, (OVFH,sp)
      008F04 6B               [ 1] 2542 	ld a, xl
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008F05 01 A6 36         [ 1] 2543 	ld acc24,a
      008F08 20 27            [ 2] 2544     addw sp,#VSIZE
      008F0A A1               [ 2] 2545 	popw x
      008F0B 3E               [ 4] 2546 	ret
                                   2547 
                                   2548 ;------------------------------------
                                   2549 ; skip character c in text starting from 'in'
                                   2550 ; input:
                                   2551 ;	 y 		point to text buffer
                                   2552 ;    a 		character to skip
                                   2553 ; output:  
                                   2554 ;	'in' ajusted to new position
                                   2555 ;------------------------------------
                           000001  2556 	C = 1 ; local var
      000F85                       2557 skip:
      008F0C 26               [ 1] 2558 	push a
      008F0D 0C 7B 01         [ 4] 2559 1$:	ld a,([in.w],y)
      008F10 F7 5C            [ 1] 2560 	jreq 2$
      008F12 A6 3E            [ 1] 2561 	cp a,(C,sp)
      008F14 6B 01            [ 1] 2562 	jrne 2$
      008F16 A6 35 20 17      [ 1] 2563 	inc in
      008F1A 72 5A            [ 2] 2564 	jra 1$
      000F95                       2565 2$: _drop 1 
      008F1C 00 02            [ 2]    1     addw sp,#1 
      008F1E 7B               [ 4] 2566 	ret
                                   2567 	
                                   2568 ;------------------------------
                                   2569 ; restore 'in.w' variable to 
                                   2570 ; its value before last call
                                   2571 ; to get_token.
                                   2572 ;------------------------------
      000F98                       2573 unget_token:
      008F1F 02 20 0F         [ 2] 2574 	ldw x,in.w.saved
      008F22 CF 00 00         [ 2] 2575 	ldw in.w,x 
      008F22 7B               [ 4] 2576 	ret 
                                   2577 
                                   2578 
                                   2579 ;******************************
                                   2580 ;  data stack manipulation
                                   2581 ;*****************************
                                   2582 ;----------------------	
                                   2583 ; push X on data stack 
                                   2584 ; input:
                                   2585 ;	X 
                                   2586 ; output:
                                   2587 ;	none 
                                   2588 ;----------------------	
      000F9F                       2589 dpush:
      000F9F                       2590     _dp_down
      008F23 01 CD 85 75      [ 1]    1     dec dstkptr+1 
      008F27 25 03 CC 87      [ 1]    2     dec dstkptr+1
      008F2B 89 CF 00 19      [ 5] 2591     ldw [dstkptr],x  
      008F2C 81               [ 4] 2592 	ret 
                                   2593 
                                   2594 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2595 ;----------------------	
                                   2596 ; pop data stack in X 
                                   2597 ; input:
                                   2598 ;	none
                                   2599 ; output:
                                   2600 ;	X   
                                   2601 ;----------------------	
      000FAC                       2602 dpop: 
      008F2C CD 8D 54 20      [ 5] 2603     ldw x, [dstkptr]
      000FB0                       2604 	_dp_up
      008F30 10 5C 00 1A      [ 1]    1     inc dstkptr+1
      008F31 72 5C 00 1A      [ 1]    2     inc dstkptr+1
      008F31 6B               [ 4] 2605 	ret 
                                   2606 
                                   2607 ;-----------------------------
                                   2608 ; swap top 2 elements of dstack
                                   2609 ;  {n1 n2 -- n2 n1 }
                                   2610 ;-----------------------------
      000FB9                       2611 dswap:
      008F32 02 7B 01 F7      [ 5] 2612 	ldw x,[dstkptr]
      008F36 5C               [ 2] 2613 	pushw x 
      008F37 7F 72 5C         [ 2] 2614 	ldw x,#2 
      008F3A 00 02 7B 02      [ 5] 2615 	ldw x,([dstkptr],x) 
      008F3E AE 17 18 19      [ 5] 2616 	ldw [dstkptr],x 
      008F41 AE 00 02         [ 2] 2617 	ldw x,#2
      008F41 5B 02            [ 2] 2618 	popw y 
      008F43 81 DF 00 19      [ 5] 2619 	ldw ([dstkptr],x),y 
      008F44 81               [ 4] 2620 	ret
                                   2621 
                                   2622 ;-----------------------------
                                   2623 ; drop TOS 
                                   2624 ;-----------------------------
      000FD3                       2625 ddrop: ; { n -- }
      000FD3                       2626 	_dp_up 
      008F44 A1 30 25 03      [ 1]    1     inc dstkptr+1
      008F48 A1 3A 8C 8C      [ 1]    2     inc dstkptr+1
      008F4C 81               [ 4] 2627 	ret
                                   2628 	
                                   2629 ;-----------------------------
                                   2630 ; duplicate TOS 
                                   2631 ;  dstack: { ix...n -- ix...n n }
                                   2632 ;-----------------------------
      008F4D                       2633 ddup:
      008F4D A1 61 2A 01      [ 5] 2634 	ldw x,[dstkptr]
      000FE0                       2635 	_dp_down
      008F51 81 A1 7A 22      [ 1]    1     dec dstkptr+1 
      008F55 FB A0 20 81      [ 1]    2     dec dstkptr+1
      008F59 72 CF 00 19      [ 5] 2636     ldw [dstkptr],x  
      008F59 89               [ 4] 2637 	ret 
                                   2638 
                                   2639 
                                   2640 ;----------------------------------
                                   2641 ; pick value n from dstack 
                                   2642 ; put it on TOS
                                   2643 ; dstack: {ix,..,p -- ix,...,np }
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2644 ;-----------------------------------
      000FED                       2645 dpick:
      008F5A 52 03 72 5F      [ 5] 2646 	ldw x,[dstkptr]
      008F5E 00               [ 2] 2647 	sllw x 
      008F5F 09 72 5F 00      [ 2] 2648 	addw x,dstkptr 
      008F63 0A               [ 2] 2649 	ldw x,(x)
      008F64 72 5F 00 0B      [ 5] 2650 	ldw [dstkptr],x 
      008F68 C6               [ 4] 2651 	ret
                                   2652 
                                   2653 ;---------------------------
                                   2654 ;  fetch variable in X 
                                   2655 ;  dstack:{ addr -- value }
                                   2656 ;---------------------------
      000FFC                       2657 fetch:
      008F69 17 18 27 5A      [ 5] 2658 	ldw x,[dstkptr]
      008F6D 0F               [ 2] 2659 	ldw x,(x)
      008F6E 01 A6 0A 6B      [ 5] 2660 	ldw [dstkptr],x
      008F72 02               [ 4] 2661 	ret 
                                   2662 
                                   2663 ;----------------------------
                                   2664 ; store variable 
                                   2665 ; dstack: {addr value -- }
                                   2666 ;----------------------------
      001006                       2667 store:
      008F73 AE 17 18         [ 4] 2668 	call dpop 
      008F76 F6 27            [ 1] 2669 	ldw y,x   ; y=value 
      008F78 47 A1 2D         [ 4] 2670 	call dpop 
      008F7B 26               [ 2] 2671 	ldw (x),y 
      008F7C 04               [ 4] 2672 	ret 
                                   2673 
                                   2674 ;---------------------------------
                                   2675 ; drop n elements from data stack 
                                   2676 ; input: 
                                   2677 ;   X 		n 
                                   2678 ; output:
                                   2679 ;   none 
                                   2680 ;-------------------------------------
      001010                       2681 ddrop_n:
      008F7D 03 01            [ 2] 2682 	pushw y 
      008F7F 20 08 A1 24      [ 2] 2683 	ldw y,dstkptr 
      008F83 26               [ 2] 2684 	sllw x 
      008F84 06               [ 2] 2685 	pushw x 
      008F85 A6 10 6B         [ 2] 2686 	addw y,(1,sp)
      008F88 02 5C F6 19      [ 2] 2687 	ldw dstkptr,y 
      008F8B 85               [ 2] 2688 	popw x 
      008F8B A1 61            [ 2] 2689 	popw y
      008F8D 2B               [ 4] 2690 	ret 
                                   2691 
      008F8E 02 A0 20 A1 30 2B 2B  2692 dstk_prompt: .asciz "\ndstack: " 
             A0 30 A1
                                   2693 ;----------------------------
                                   2694 ; print dstack content 
                                   2695 ;---------------------------
                           000001  2696 	XSAVE=1
                           000002  2697 	VSIZE=2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      00102D                       2698 dots:
      00102D                       2699 	_vars VSIZE 
      008F98 0A 2B            [ 2]    1     sub sp,#VSIZE 
      008F9A 06 A0 07         [ 2] 2700 	ldw x,#dstk_prompt 
      008F9D 11 02 2A         [ 4] 2701 	call puts
      008FA0 1F 6B 03         [ 2] 2702 	ldw x,#dstack_unf-CELL_SIZE
      008FA3 7B 02 CD 8F      [ 1] 2703 	mov base,#10 
      008FA7 CB 7B 03         [ 2] 2704 1$:	cpw x,dstkptr 
      008FAA CB 00            [ 1] 2705 	jrult 4$ 
      008FAC 0B C7            [ 2] 2706 	ldw (XSAVE,sp),x
      008FAE 00               [ 2] 2707 	ldw  x,(x)
      008FAF 0B 4F C9         [ 4] 2708 	call print_int 
      008FB2 00 0A            [ 2] 2709 	ldw x,(XSAVE,sp)
      008FB4 C7 00 0A         [ 2] 2710 	subw x,#CELL_SIZE 
      008FB7 4F C9            [ 2] 2711 	jra 1$ 
      008FB9 00 09            [ 1] 2712 4$: ld a,#CR 
      008FBB C7 00 09         [ 4] 2713 	call putc 
      001053                       2714 	_drop VSIZE
      008FBE 20 C9            [ 2]    1     addw sp,#VSIZE 
      008FC0 0D               [ 1] 2715 	clr a 
      008FC1 01               [ 4] 2716 	ret
                                   2717 
      008FC2 27 03 CD 8A CC 6B 3A  2718 cstk_prompt: .asciz "\nctack: "
             20 00
                                   2719 ;--------------------------------
                                   2720 ; print cstack content
                                   2721 ;--------------------------------
                           000001  2722 	XSAVE=1
                           000002  2723 	VSIZE=2 
      008FC7                       2724 dotr:
      001060                       2725 	_vars VSIZE 
      008FC7 5B 03            [ 2]    1     sub sp,#VSIZE 
      008FC9 85 81 57         [ 2] 2726 	ldw x,#cstk_prompt
      008FCB CD 01 B0         [ 4] 2727 	call puts 
      008FCB 89               [ 1] 2728 	ldw x,sp 
      008FCC 88 5F 89         [ 2] 2729 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008FCF C6 00            [ 2] 2730 	ldw (XSAVE,sp),x  
      008FD1 0B 97 7B         [ 2] 2731 	ldw x,#RAM_SIZE-2
      008FD4 03 42 9F C7      [ 1] 2732 	mov base,#16
      001075                       2733 dotr_loop:
      008FD8 00 0B            [ 2] 2734 	cpw x,(XSAVE,sp)
      008FDA 9E 6B            [ 1] 2735 	jrmi 9$
      008FDC 02               [ 2] 2736 	pushw x  
      008FDD C6               [ 2] 2737 	ldw x,(x)
      008FDE 00 0A 97         [ 4] 2738 	call print_int 
      008FE1 7B               [ 2] 2739 	popw x  
      008FE2 03 42 72         [ 2] 2740 	subw x,#CELL_SIZE
      008FE5 FB 01            [ 2] 2741 	jra dotr_loop 
      008FE7 9F C7            [ 1] 2742 9$:	ld a,#CR 
      008FE9 00 0A 4F         [ 4] 2743 	call putc 
      001089                       2744 	_drop VSIZE 
      008FEC A9 00            [ 2]    1     addw sp,#VSIZE 
      008FEE 6B               [ 1] 2745 	clr a 
      008FEF 01               [ 4] 2746 	ret
                                   2747 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2748 
                                   2749 ;--------------------------------
                                   2750 ;  add 2 integers
                                   2751 ;  input:
                                   2752 ;    N1     on cstack 
                                   2753 ;    N2     on cstack 
                                   2754 ;  output:
                                   2755 ;    X 		n2+n1 
                                   2756 ;--------------------------------
                                   2757 	;arugments on cstack 
      00108D                       2758 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00108D                       2759 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      00108D                       2760 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      00108D                       2761 add:
      008FF0 9E 6B            [ 2] 2762 	ldw x ,(N2,sp)
      008FF2 02 C6 00         [ 2] 2763 	addw x,(N1,sp)
      008FF5 09 97            [ 2] 2764 	ldw (N1,sp),x 
      008FF7 7B               [ 4] 2765 	ret 
                                   2766 
                                   2767 ;--------------------------------
                                   2768 ;  substract 2 ntegers
                                   2769 ;  input:
                                   2770 ;    N1     on cstack 
                                   2771 ;    N2     on cstack 
                                   2772 ;  output:
                                   2773 ;    X 		n2+n1 
                                   2774 ;--------------------------------
      001095                       2775 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001095                       2776 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001095                       2777 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001095                       2778 substract:
      008FF8 03 42            [ 2] 2779 	ldw x,(N2,sp)
      008FFA 72 FB 01         [ 2] 2780 	subw x,(N1,sp)
      008FFD 9F               [ 4] 2781 	ret 
                                   2782 
                                   2783 ;-------------------------------------
                                   2784 ; multiply 2 integers
                                   2785 ; product overflow is ignored unless
                                   2786 ; MATH_OVF assembler flag is set to 1
                                   2787 ; input:
                                   2788 ;  	N1      on cstack
                                   2789 ;   N2 		on cstack 
                                   2790 ; output:
                                   2791 ;	X        N1*N2 
                                   2792 ;-------------------------------------
                                   2793 	;arguments 
      00109B                       2794 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      00109B                       2795 	_arg N1_HB 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                           000006     1     N1_HB=ARG_OFS+1 
      00109B                       2796 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      00109B                       2797 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      00109B                       2798 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2799    ; local variables 
                           000001  2800 	SIGN=1
                           000002  2801 	PROD=2
                           000003  2802 	VSIZE=3
      00109B                       2803 multiply:
      00109B                       2804 	_vars VSIZE 
      008FFE C7 00            [ 2]    1     sub sp,#VSIZE 
      009000 09 5B            [ 1] 2805 	clr (SIGN,sp)
      009002 03 85            [ 2] 2806 	ldw x,(N1_HB,sp)
      009004 81               [ 1] 2807 	ld a,xh  
      009005 A5 80            [ 1] 2808 	bcp a,#0x80 
      009005 88 91            [ 1] 2809 	jreq 2$
      009007 D6 01            [ 1] 2810 	cpl (SIGN,sp)
      009009 27               [ 2] 2811 	negw x 
      00900A 0A 11            [ 2] 2812 	ldw (N1_HB,sp),x 
      00900C 01 26            [ 2] 2813 2$: ldw x,(N2_HB,sp)
      00900E 06               [ 1] 2814 	ld a,xh  
      00900F 72 5C            [ 1] 2815 	bcp a,#0x80 
      009011 00 02            [ 1] 2816 	jreq 3$
      009013 20 F1            [ 1] 2817 	cpl (SIGN,sp)
      009015 5B               [ 2] 2818 	negw x 
      009016 01 81            [ 2] 2819 	ldw (N2_HB,sp),x 
                                   2820 ; N1_LB * N2_LB 	
      009018 7B 07            [ 1] 2821 3$:	ld a,(N1_LB,sp)
      009018 CE               [ 1] 2822 	ld xl,a 
      009019 00 12            [ 1] 2823 	ld a,(N2_LB,sp) 
      00901B CF               [ 4] 2824 	mul x,a 
                           000000  2825 .if MATH_OVF 	
                                   2826 	ld a,xh 
                                   2827 	bcp a,#0x80 
                                   2828 	jreq 4$ 
                                   2829 	ld a,#ERR_MATH_OVF 
                                   2830 	jp tb_error
                                   2831 .endif 	 
      00901C 00 01            [ 2] 2832 4$:	ldw (PROD,sp),x
                                   2833 ; N1_LB * N2_HB	 
      00901E 81 07            [ 1] 2834 	ld a,(N1_LB,sp) 
      00901F 97               [ 1] 2835 	ld xl,a 
      00901F 72 5A            [ 1] 2836 	ld a,(N2_HB,sp)
      009021 00               [ 4] 2837 	mul x,a
      009022 1B               [ 1] 2838 	ld a,xl 
      009023 72 5A            [ 1] 2839 	add a,(PROD,sp)
                           000000  2840 .if MATH_OVF 	
                                   2841 	bcp a,#0x80 
                                   2842 	jreq 5$ 
                                   2843 	ld a,#ERR_MATH_OVF 
                                   2844 	jp tb_error
                                   2845 .endif 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009025 00 1B            [ 1] 2846 5$:	ld (PROD,sp),a 
                                   2847 ; N1_HB * N2_LB 
      009027 72 CF            [ 1] 2848 	ld a,(N1_HB,sp)
      009029 00               [ 1] 2849 	ld xl,a 
      00902A 1A 81            [ 1] 2850 	ld a,(N2_LB,sp)
      00902C 42               [ 4] 2851 	mul x,a 
      00902C 72               [ 1] 2852 	ld a,xl 
      00902D CE 00            [ 1] 2853 	add a,(PROD,sp)
                           000000  2854 .if MATH_OVF 	
                                   2855 	bcp a,#0x80 
                                   2856 	jreq 6$ 
                                   2857 	ld a,#ERR_MATH_OVF 
                                   2858 	jp tb_error
                                   2859 .endif 	 
      00902F 1A 72            [ 1] 2860 6$:	ld (PROD,sp),a 
                                   2861 ; N1_HB * N2_HB 	
                                   2862 ; it is pointless to multiply N1_HB*N2_HB 
                                   2863 ; as this product is over 65535 or 0 
                                   2864 ;
                                   2865 ; sign adjust product
      009031 5C 00            [ 1] 2866 	tnz (SIGN,sp)
      009033 1B 72            [ 1] 2867 	jreq 7$
      009035 5C 00            [ 2] 2868 	ldw x, (PROD,sp)
      009037 1B               [ 2] 2869 	negw x
      009038 81 02            [ 2] 2870 	ldw (PROD,sp),x  
      009039                       2871 7$: 
      009039 72 CE            [ 2] 2872 	ldw x,(PROD,sp) 
      0010E0                       2873 	_drop VSIZE 
      00903B 00 1A            [ 2]    1     addw sp,#VSIZE 
      00903D 89               [ 4] 2874 	ret
                                   2875 
                                   2876 ;----------------------------------
                                   2877 ;  euclidian divide n2/n1 
                                   2878 ; input:
                                   2879 ;    N2 	on cstack
                                   2880 ;    N1 	on cstack
                                   2881 ; output:
                                   2882 ;    X      n2/n1 
                                   2883 ;    Y      remainder 
                                   2884 ;----------------------------------
      0010E3                       2885 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      0010E3                       2886 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      0010E3                       2887 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2888 	; local variables
                           000001  2889 	SQUOT=1 ; sign quotient
                           000002  2890 	SDIVD=2 ; sign dividend  
                           000002  2891 	VSIZE=2
      0010E3                       2892 divide:
      0010E3                       2893 	_vars VSIZE 
      00903E AE 00            [ 2]    1     sub sp,#VSIZE 
      009040 02 72            [ 1] 2894 	clr (SQUOT,sp)
      009042 DE 00            [ 1] 2895 	clr (SDIVD,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2896 ; check for 0 divisor
      009044 1A 72            [ 2] 2897 	ldw x,(DIVISR,sp)
      009046 CF               [ 2] 2898 	tnzw x 
      009047 00 1A            [ 1] 2899     jrne 0$
      009049 AE 00            [ 1] 2900 	ld a,#ERR_DIV0 
      00904B 02 90 85         [ 2] 2901 	jp tb_error 
                                   2902 ; check divisor sign 	
      00904E 72               [ 1] 2903 0$:	ld a,xh 
      00904F DF 00            [ 1] 2904 	bcp a,#0x80 
      009051 1A 81            [ 1] 2905 	jreq 1$
      009053 03 01            [ 1] 2906 	cpl (SQUOT,sp)
      009053 72               [ 2] 2907 	negw x 
      009054 5C 00            [ 2] 2908 1$:	ldw (DIVISR,sp),x
                                   2909 ; check dividend sign 	 
      009056 1B 72            [ 2] 2910     ldw x,(DIVIDND,sp)
      009058 5C               [ 1] 2911 	ld a,xh 
      009059 00 1B            [ 1] 2912 	bcp a,#0x80 
      00905B 81 05            [ 1] 2913 	jreq 2$ 
      00905C 03 01            [ 1] 2914 	cpl (SQUOT,sp)
      00905C 72 CE            [ 1] 2915 	cpl (SDIVD,sp)
      00905E 00               [ 2] 2916 	negw x 
      00905F 1A 72            [ 2] 2917 2$:	ldw y,(DIVISR,sp)
      009061 5A               [ 2] 2918 	divw x,y
      009062 00 1B 72 5A      [ 2] 2919 	ldw acc16,y 
                                   2920 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      009066 00 1B            [ 1] 2921 	tnz (SDIVD,sp)
      009068 72 CF            [ 1] 2922 	jreq 7$
      00906A 00 1A            [ 2] 2923 	tnzw y 
      00906C 81 07            [ 1] 2924 	jreq 7$
      00906D 5C               [ 1] 2925 	incw x
      00906D 72 CE            [ 2] 2926 	ldw y,(DIVISR,sp)
      00906F 00 1A 58 72      [ 2] 2927 	subw y,acc16
      009073 BB 00            [ 1] 2928 7$: tnz (SQUOT,sp)
      009075 1A FE            [ 1] 2929 	jreq 9$ 	 
      009077 72               [ 2] 2930 8$:	negw x 
      001124                       2931 9$: 
      001124                       2932 	_drop VSIZE 
      009078 CF 00            [ 2]    1     addw sp,#VSIZE 
      00907A 1A               [ 4] 2933 	ret 
                                   2934 
                                   2935 
                                   2936 ;----------------------------------
                                   2937 ;  remainder resulting from euclidian 
                                   2938 ;  division of n2/n1 
                                   2939 ; input:
                                   2940 ;   N1 		cstack 
                                   2941 ;   N2      cstack
                                   2942 ; output:
                                   2943 ;   X       N2%N1 
                                   2944 ;----------------------------------
                           000003  2945 	N1=3
                           000005  2946 	N2=5
                           000004  2947 	VSIZE=4
      001127                       2948 modulo:
      00907B 81 03            [ 2] 2949 	Ldw x,(N1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00907C 16 05            [ 2] 2950 	ldw y,(N2,sp)
      00112B                       2951 	_vars VSIZE 
      00907C 72 CE            [ 2]    1     sub sp,#VSIZE 
      00907E 00 1A            [ 2] 2952 	ldw (1,sp),x 
      009080 FE 72            [ 2] 2953 	ldw (3,sp),y 
      009082 CF 00 1A         [ 4] 2954 	call divide 
      009085 81               [ 1] 2955 	ldw x,y
      009086                       2956 	_drop VSIZE 
      009086 CD 90            [ 2]    1     addw sp,#VSIZE 
      009088 2C               [ 4] 2957 	ret 
                                   2958 
                                   2959 
                                   2960 ;----------------------------------
                                   2961 ; search in kword_dict command name
                                   2962 ;  from its execution address 
                                   2963 ; input:
                                   2964 ;   X       	execution address 
                                   2965 ; output:
                                   2966 ;   X 			cstr*  | 0 
                                   2967 ;--------------------------------
                           000001  2968 	XADR=1 
                           000003  2969 	LINK=3 
                           000004  2970 	VSIZE=4
      001138                       2971 cmd_name:
      001138                       2972 	_vars VSIZE 
      009089 90 93            [ 2]    1     sub sp,#VSIZE 
      00908B CD 90 2C FF      [ 1] 2973 	clr acc16 
      00908F 81 01            [ 2] 2974 	ldw (XADR,sp),x  
      009090 AE 21 0B         [ 2] 2975 	ldw x,#kword_dict	
      009090 90 89            [ 2] 2976 1$:	ldw (LINK,sp),x
      009092 90 CE            [ 1] 2977 	ld a,(2,x)
      009094 00 1A            [ 1] 2978 	and a,#15 
      009096 58 89 72         [ 1] 2979 	ld acc8,a 
      009099 F9 01 90         [ 2] 2980 	addw x,#3
      00909C CF 00 1A 85      [ 2] 2981 	addw x,acc16
      0090A0 90               [ 2] 2982 	ldw x,(x) ; execution address 
      0090A1 85 81            [ 2] 2983 	cpw x,(XADR,sp)
      0090A3 0A 64            [ 1] 2984 	jreq 2$
      0090A5 73 74            [ 2] 2985 	ldw x,(LINK,sp)
      0090A7 61               [ 2] 2986 	ldw x,(x) 
      0090A8 63 6B 3A         [ 2] 2987 	subw x,#2  
      0090AB 20 00            [ 1] 2988 	jrne 1$
      0090AD 20 05            [ 2] 2989 	jra 9$
      0090AD 52 02            [ 2] 2990 2$: ldw x,(LINK,sp)
      0090AF AE 90 A3         [ 2] 2991 	addw x,#2 	
      001167                       2992 9$:	_drop VSIZE
      0090B2 CD 82            [ 2]    1     addw sp,#VSIZE 
      0090B4 30               [ 4] 2993 	ret
                                   2994 
                                   2995 
                                   2996 ;---------------------------------
                                   2997 ; input:
                                   2998 ;	X 		dictionary entry point 
                                   2999 ;  pad		.asciz name to search 
                                   3000 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   3001 ;  A 		TK_CMD|TK_FUNC|TK_NONE 
                                   3002 ;  X		execution address | 0 
                                   3003 ;---------------------------------
                           000001  3004 	NLEN=1 ; cmd length 
                           000002  3005 	YSAVE=2
                           000003  3006 	VSIZE=3 
      00116A                       3007 search_dict:
      00116A                       3008 	_vars VSIZE 
      0090B5 AE 17            [ 2]    1     sub sp,#VSIZE 
      0090B7 7E 35            [ 1] 3009 	ldw y,x 
      00116E                       3010 search_next:	
      0090B9 0A 00            [ 1] 3011 	ld a,(y)
      0090BB 08 C3            [ 1] 3012 	and a,#0xf 
      0090BD 00 1A            [ 1] 3013 	ld (NLEN,sp),a  
      0090BF 25 0D 1F         [ 2] 3014 	ldw x,#pad 
      0090C2 01 FE            [ 2] 3015 	ldw (YSAVE,sp),y
      0090C4 CD 8A            [ 1] 3016 	incw y  
      00117B                       3017 cp_loop:
      0090C6 01               [ 1] 3018 	ld a,(x)
      0090C7 1E 01            [ 1] 3019 	jreq str_match 
      0090C9 1D 00            [ 1] 3020 	tnz (NLEN,sp)
      0090CB 02 20            [ 1] 3021 	jreq no_match  
      0090CD EE A6            [ 1] 3022 	cp a,(y)
      0090CF 0D CD            [ 1] 3023 	jrne no_match 
      0090D1 82 1E            [ 1] 3024 	incw y 
      0090D3 5B               [ 1] 3025 	incw x
      0090D4 02 4F            [ 1] 3026 	dec (NLEN,sp)
      0090D6 81 0A            [ 2] 3027 	jra cp_loop 
      00118D                       3028 no_match:
      0090D8 63 74            [ 2] 3029 	ldw y,(YSAVE,sp) 
      0090DA 61 63 6B 3A      [ 2] 3030 	subw y,#2 ; move Y to link field
      0090DE 20 00            [ 1] 3031 	push #TK_NONE 
      0090E0 90 FE            [ 2] 3032 	ldw y,(y) ; next word link 
      0090E0 52               [ 1] 3033 	pop a ; TK_NONE 
      0090E1 02 AE            [ 1] 3034 	jreq search_exit  ; not found  
                                   3035 ;try next 
      0090E3 90 D7            [ 2] 3036 	jra search_next
      00119C                       3037 str_match:
      0090E5 CD 82            [ 2] 3038 	ldw y,(YSAVE,sp)
      0090E7 30 96            [ 1] 3039 	ld a,(y)
      0090E9 1C 00            [ 1] 3040 	ld (NLEN,sp),a ; needed to test bit 7 
      0090EB 07 1F            [ 1] 3041 	and a,#0x7f 
                                   3042 ; move y to procedure address field 	
      0090ED 01               [ 1] 3043 	inc a 
      0090EE AE 17 FE         [ 1] 3044 	ld acc8,a 
      0090F1 35 10 00 08      [ 1] 3045 	clr acc16 
      0090F5 72 B9 00 09      [ 2] 3046 	addw y,acc16 
      0090F5 13 01            [ 2] 3047 	ldw y,(y) ; routine entry point 
      0090F7 2B 0B            [ 1] 3048 	ld a,(NLEN,sp)
      0090F9 89 FE            [ 1] 3049 	bcp a,#0x80 
      0090FB CD 8A            [ 1] 3050 	jreq 1$
      0090FD 01 85            [ 1] 3051 	ld a,#TK_FUNC 
      0090FF 1D 00            [ 2] 3052 	jra search_exit
      009101 02 20            [ 1] 3053 1$: ld a,#TK_CMD 
      0011BE                       3054 search_exit: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009103 F1               [ 1] 3055 	ldw x,y ; x=routine address 
      0011BF                       3056 	_drop VSIZE 	 
      009104 A6 0D            [ 2]    1     addw sp,#VSIZE 
      009106 CD               [ 4] 3057 	ret 
                                   3058 
                                   3059 ;---------------------
                                   3060 ; check if next token
                                   3061 ;  is of expected type 
                                   3062 ; input:
                                   3063 ;   A 		 expected token attribute
                                   3064 ;  ouput:
                                   3065 ;   none     if fail call tb_error 
                                   3066 ;--------------------
      0011C2                       3067 expect:
      009107 82               [ 1] 3068 	push a 
      009108 1E 5B 02         [ 4] 3069 	call next_token 
      00910B 4F 81            [ 1] 3070 	cp a,(1,sp)
      00910D 27 03            [ 1] 3071 	jreq 1$
      00910D 1E 05 72         [ 2] 3072 	jp syntax_error
      009110 FB               [ 1] 3073 1$: pop a 
      009111 03               [ 4] 3074 	ret 
                                   3075 
                                   3076 
                                   3077 ;-------------------------------
                                   3078 ; parse embedded BASIC routines 
                                   3079 ; arguments list.
                                   3080 ; arg_list::=  rel[','rel]*
                                   3081 ; all arguments are of integer type
                                   3082 ; input:
                                   3083 ;   none
                                   3084 ; output:
                                   3085 ;   A 			number of arguments pushed on dstack  
                                   3086 ;--------------------------------
                           000001  3087 	ARG_CNT=1 
      0011CF                       3088 arg_list:
      009112 1F 03            [ 1] 3089 	push #0  
      009114 81 13 0D         [ 4] 3090 1$: call relation
      009115 A1 00            [ 1] 3091 	cp a,#TK_NONE 
      009115 1E 05            [ 1] 3092 	jreq 5$
      009117 72 F0            [ 1] 3093 	cp a,#TK_INTGR
      009119 03 81            [ 1] 3094 	jrne 4$
      00911B CD 0F 9F         [ 4] 3095 3$: call dpush 
      00911B 52 03            [ 1] 3096     inc (ARG_CNT,sp)
      00911D 0F 01 1E         [ 4] 3097 	call next_token 
      009120 06 9E            [ 1] 3098 	cp a,#TK_NONE 
      009122 A5 80            [ 1] 3099 	jreq 5$ 
      009124 27 05            [ 1] 3100 	cp a,#TK_COMMA 
      009126 03 01            [ 1] 3101 	jrne 4$
      009128 50 1F            [ 2] 3102 	jra 1$ 
      00912A 06 1E 08         [ 4] 3103 4$:	call unget_token 
      00912D 9E               [ 1] 3104 5$:	pop a 
      00912E A5               [ 4] 3105 	ret 
                                   3106 
                                   3107 
                                   3108 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                                   3109 ;--------------------------------
                                   3110 ;   BASIC commnands 
                                   3111 ;--------------------------------
                                   3112 
                                   3113 ;--------------------------------
                                   3114 ;  arithmetic and relational 
                                   3115 ;  routines
                                   3116 ;  operators precedence
                                   3117 ;  highest to lowest
                                   3118 ;  operators on same row have 
                                   3119 ;  same precedence and are executed
                                   3120 ;  from left to right.
                                   3121 ;	'*','/','%'
                                   3122 ;   '-','+'
                                   3123 ;   '=','>','<','>=','<=','<>','><'
                                   3124 ;   '<>' and '><' are equivalent for not equal.
                                   3125 ;--------------------------------
                                   3126 
                                   3127 ;---------------------
                                   3128 ; return array element
                                   3129 ; address from @(expr)
                                   3130 ; input:
                                   3131 ;   A 		TK_ARRAY
                                   3132 ; output:
                                   3133 ;   A 		TK_INTGR
                                   3134 ;	X 		element address 
                                   3135 ;----------------------
      0011F3                       3136 get_array_element:
      00912F 80 27 05         [ 4] 3137 	call ddrop 
      009132 03 01            [ 1] 3138 	ld a,#TK_LPAREN 
      009134 50 1F 08         [ 4] 3139 	call expect
      009137 7B 07 97         [ 4] 3140 	call relation 
      00913A 7B 09            [ 1] 3141 	cp a,#TK_INTGR 
      00913C 42 1F            [ 1] 3142 	jreq 1$
      00913E 02 7B 07         [ 2] 3143 	jp syntax_error
      009141 97               [ 2] 3144 1$: pushw x 
      009142 7B 08            [ 1] 3145 	ld a,#TK_RPAREN 
      009144 42 9F 1B         [ 4] 3146 	call expect
                                   3147 	; check for bounds 
      009147 02               [ 2] 3148 	popw x   
      009148 6B 02 7B         [ 2] 3149 	cpw x,array_size 
      00914B 06 97            [ 2] 3150 	jrule 3$
                                   3151 ; bounds {1..array_size}	
      00914D 7B 09            [ 1] 3152 2$: ld a,#ERR_BAD_VALUE 
      00914F 42 9F 1B         [ 2] 3153 	jp tb_error 
      009152 02               [ 2] 3154 3$: tnzw  x
      009153 6B 02            [ 1] 3155 	jreq 2$ 
      009155 0D               [ 2] 3156 	sllw x 
      009156 01               [ 2] 3157 	pushw x 
      009157 27 05 1E         [ 2] 3158 	ldw x,array_addr  
      00915A 02 50 1F         [ 2] 3159 	subw x,(1,sp)
      001221                       3160 	_drop 2   
      00915D 02 02            [ 2]    1     addw sp,#2 
      00915E A6 02            [ 1] 3161 	ld a,#TK_INTGR
      00915E 1E               [ 4] 3162 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3163 
                                   3164 ;***********************************
                                   3165 ;   expression parse,execute 
                                   3166 ;***********************************
                                   3167 ;-----------------------------------
                                   3168 ; factor ::= ['+'|'-'|e] var | @ |
                                   3169 ;			 integer | function |
                                   3170 ;			 '('relation')' 
                                   3171 ; output:
                                   3172 ;   A    token attribute 
                                   3173 ;   X 	 integer
                                   3174 ; ---------------------------------
                           000001  3175 	NEG=1
                           000001  3176 	VSIZE=1
      001226                       3177 factor:
      001226                       3178 	_vars VSIZE 
      00915F 02 5B            [ 2]    1     sub sp,#VSIZE 
      009161 03 81 EF         [ 4] 3179 	call next_token
      009163 A1 02            [ 1] 3180 	cp a,#CMD_END 
      009163 52 02            [ 1] 3181 	jrmi 20$
      009165 0F 01            [ 1] 3182 1$:	ld (NEG,sp),a 
      009167 0F 02            [ 1] 3183 	and a,#TK_GRP_MASK
      009169 1E 05            [ 1] 3184 	cp a,#TK_GRP_ADD 
      00916B 5D 26            [ 1] 3185 	jreq 2$
      00916D 05 A6            [ 1] 3186 	ld a,(NEG,sp)
      00916F 04 CC            [ 2] 3187 	jra 4$  
      00123B                       3188 2$:	
      009171 87 8B 9E         [ 4] 3189 	call next_token 
      00123E                       3190 4$:	
      009174 A5 80            [ 1] 3191 	cp a,#TK_FUNC 
      009176 27 03            [ 1] 3192 	jrne 5$ 
      009178 03               [ 4] 3193 	call (x) 
      009179 01 50            [ 2] 3194 	jra 18$ 
      001245                       3195 5$:
      00917B 1F 05            [ 1] 3196 	cp a,#TK_INTGR
      00917D 1E 07            [ 1] 3197 	jrne 6$
      00917F 9E A5            [ 2] 3198 	jra 18$
      00124B                       3199 6$:
      009181 80 27            [ 1] 3200 	cp a,#TK_ARRAY
      009183 05 03            [ 1] 3201 	jrne 10$
      009185 01 03 02         [ 4] 3202 	call get_array_element
      009188 50               [ 2] 3203 	ldw x,(x)
      009189 16 05            [ 2] 3204 	jra 18$ 
      001255                       3205 10$:
      00918B 65 90            [ 1] 3206 	cp a,#TK_VAR 
      00918D CF 00            [ 1] 3207 	jrne 12$
      00918F 0A               [ 2] 3208 	ldw x,(x)
      009190 0D 02            [ 2] 3209 	jra 18$
      00125C                       3210 12$:			
      009192 27 0B            [ 1] 3211 	cp a,#TK_LPAREN
      009194 90 5D            [ 1] 3212 	jrne 16$
      009196 27 07 5C         [ 4] 3213 	call relation
      009199 16 05            [ 1] 3214 	ld a,#TK_RPAREN 
      00919B 72 B2 00         [ 4] 3215 	call expect
      00919E 0A 0D            [ 2] 3216 	jra 18$	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      00126A                       3217 16$:
      0091A0 01 27 01         [ 4] 3218 	call unget_token
      0091A3 50               [ 1] 3219 	clr a 
      0091A4 20 09            [ 2] 3220 	jra 20$ 
      001270                       3221 18$: 
      0091A4 5B 02            [ 1] 3222 	ld a,#TK_MINUS 
      0091A6 81 01            [ 1] 3223 	cp a,(NEG,sp)
      0091A7 26 01            [ 1] 3224 	jrne 19$
      0091A7 1E               [ 2] 3225 	negw x
      001277                       3226 19$:
      0091A8 03 16            [ 1] 3227 	ld a,#TK_INTGR
      001279                       3228 20$:
      001279                       3229 	_drop VSIZE
      0091AA 05 52            [ 2]    1     addw sp,#VSIZE 
      0091AC 04               [ 4] 3230 	ret
                                   3231 
                                   3232 ;-----------------------------------
                                   3233 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3234 ; output:
                                   3235 ;   A    	token attribute 
                                   3236 ;	X		integer
                                   3237 ;-----------------------------------
                           000001  3238 	N1=1
                           000003  3239 	N2=3
                           000005  3240 	MULOP=5
                           000005  3241 	VSIZE=5
      00127C                       3242 term:
      00127C                       3243 	_vars VSIZE
      0091AD 1F 01            [ 2]    1     sub sp,#VSIZE 
      0091AF 17 03 CD         [ 4] 3244 	call factor
      0091B2 91 63            [ 1] 3245 	cp a,#CMD_END
      0091B4 93 5B            [ 1] 3246 	jrmi term_exit
      001285                       3247 term01:	 ; check for  operator 
      0091B6 04 81            [ 2] 3248 	ldw (N2,sp),x  ; save first factor 
      0091B8 CD 07 EF         [ 4] 3249 	call next_token
      0091B8 52 04            [ 1] 3250 	cp a,#2
      0091BA 72 5F            [ 1] 3251 	jrmi 9$
      0091BC 00 0A            [ 1] 3252 0$:	ld (MULOP,sp),a
      0091BE 1F 01            [ 1] 3253 	and a,#TK_GRP_MASK
      0091C0 AE A1            [ 1] 3254 	cp a,#TK_GRP_MULT
      0091C2 8B 1F            [ 1] 3255 	jreq 1$
      0091C4 03 E6            [ 1] 3256 	ld a,(MULOP,sp) 
      0091C6 02 A4 0F         [ 4] 3257 	call unget_token 
      0091C9 C7 00            [ 2] 3258 	jra 9$
      00129D                       3259 1$:	; got *|/|%
      0091CB 0B 1C 00         [ 4] 3260 	call factor
      0091CE 03 72            [ 1] 3261 	cp a,#TK_INTGR
      0091D0 BB 00            [ 1] 3262 	jreq 2$ 
      0091D2 0A FE 13         [ 2] 3263 	jp syntax_error
      0091D5 01 27            [ 2] 3264 2$:	ldw (N1,sp),x  
      0091D7 0A 1E            [ 1] 3265 	ld a,(MULOP,sp) 
      0091D9 03 FE            [ 1] 3266 	cp a,#TK_MULT 
      0091DB 1D 00            [ 1] 3267 	jrne 3$
      0091DD 02 26 E3         [ 4] 3268 	call multiply 
      0091E0 20 05            [ 2] 3269 	jra term01
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0091E2 1E 03            [ 1] 3270 3$: cp a,#TK_DIV 
      0091E4 1C 00            [ 1] 3271 	jrne 4$ 
      0091E6 02 5B 04         [ 4] 3272 	call divide 
      0091E9 81 C8            [ 2] 3273 	jra term01 
      0091EA CD 11 27         [ 4] 3274 4$: call modulo
      0091EA 52 03            [ 2] 3275 	jra term01 
      0091EC 90 93            [ 2] 3276 9$: ldw x,(N2,sp)  
      0091EE A6 02            [ 1] 3277 	ld a,#TK_INTGR 	
      0012C6                       3278 term_exit:
      0012C6                       3279 	_drop VSIZE 
      0091EE 90 F6            [ 2]    1     addw sp,#VSIZE 
      0091F0 A4               [ 4] 3280 	ret 
                                   3281 
                                   3282 ;-------------------------------
                                   3283 ;  expr ::= term [['+'|'-'] term]*
                                   3284 ;  result range {-32768..32767}
                                   3285 ;  output:
                                   3286 ;   A    token attribute 
                                   3287 ;   X	 integer   
                                   3288 ;-------------------------------
                           000001  3289 	N1=1 
                           000003  3290 	N2=3
                           000005  3291 	OP=5 
                           000005  3292 	VSIZE=5 
      0012C9                       3293 expression:
      0012C9                       3294 	_vars VSIZE 
      0091F1 0F 6B            [ 2]    1     sub sp,#VSIZE 
      0091F3 01 AE 17         [ 4] 3295 	call term
      0091F6 18 17            [ 1] 3296 	cp a,#CMD_END 
      0091F8 02 90            [ 1] 3297 	jrmi expr_exit 
      0091FA 5C 03            [ 2] 3298 0$:	ldw (N2,sp),x 
      0091FB CD 07 EF         [ 4] 3299 	call next_token
      0091FB F6 27            [ 1] 3300 	cp a,#2
      0091FD 1E 0D            [ 1] 3301 	jrmi 9$ 
      0091FF 01 27            [ 1] 3302 1$:	ld (OP,sp),a  
      009201 0B 90            [ 1] 3303 	and a,#TK_GRP_MASK
      009203 F1 26            [ 1] 3304 	cp a,#TK_GRP_ADD 
      009205 07 90            [ 1] 3305 	jreq 2$ 
      009207 5C 5C            [ 1] 3306 	ld a,(OP,sp)
      009209 0A 01 20         [ 4] 3307 	call unget_token
      00920C EE 1C            [ 2] 3308 	jra 9$
      00920D                       3309 2$: 
      00920D 16 02 72         [ 4] 3310 	call term
      009210 A2 00            [ 1] 3311 	cp a,#TK_INTGR 
      009212 02 4B            [ 1] 3312 	jreq 3$
      009214 00 90 FE         [ 2] 3313 	jp syntax_error
      009217 84 27            [ 2] 3314 3$:	ldw (N1,sp),x 
      009219 24 20            [ 1] 3315 	ld a,(OP,sp)
      00921B D2 10            [ 1] 3316 	cp a,#TK_PLUS 
      00921C 26 05            [ 1] 3317 	jrne 4$
      00921C 16 02 90         [ 4] 3318 	call add 
      00921F F6 6B            [ 2] 3319 	jra 0$ 
      009221 01 A4 7F         [ 4] 3320 4$:	call substract
      009224 4C C7            [ 2] 3321 	jra 0$
      009226 00 0B            [ 2] 3322 9$: ldw x,(N2,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      009228 72 5F            [ 1] 3323 	ld a,#TK_INTGR	
      00130A                       3324 expr_exit:
      00130A                       3325 	_drop VSIZE 
      00922A 00 0A            [ 2]    1     addw sp,#VSIZE 
      00922C 72               [ 4] 3326 	ret 
                                   3327 
                                   3328 ;---------------------------------------------
                                   3329 ; rel ::= expr rel_op expr
                                   3330 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3331 ;  relation return 1 | 0  for true | false 
                                   3332 ;  output:
                                   3333 ;    A 		token attribute  
                                   3334 ;	 X		1|0
                                   3335 ;---------------------------------------------
                           000001  3336 	N1=1
                           000003  3337 	N2=3
                           000005  3338 	RELOP=5
                           000005  3339 	VSIZE=5 
      00130D                       3340 relation: 
      00130D                       3341 	_vars VSIZE
      00922D B9 00            [ 2]    1     sub sp,#VSIZE 
      00922F 0A 90 FE         [ 4] 3342 	call expression
      009232 7B 01            [ 1] 3343 	cp a,#CMD_END  
      009234 A5 80            [ 1] 3344 	jrmi rel_exit 
                                   3345 	; expect rel_op or leave 
      009236 27 04            [ 2] 3346 	ldw (N2,sp),x 
      009238 A6 07 20         [ 4] 3347 	call next_token 
      00923B 02 A6            [ 1] 3348 	cp a,#2
      00923D 06 3E            [ 1] 3349 	jrmi 9$
      00923E                       3350 1$:	
      00923E 93 5B            [ 1] 3351 	ld (RELOP,sp),a 
      009240 03 81            [ 1] 3352 	and a,#TK_GRP_MASK
      009242 A1 30            [ 1] 3353 	cp a,#TK_GRP_RELOP 
      009242 88 CD            [ 1] 3354 	jreq 2$
      009244 88 6F            [ 1] 3355 	ld a,(RELOP,sp)
      009246 11 01 27         [ 4] 3356 	call unget_token  
      009249 03 CC            [ 2] 3357 	jra 9$
      00132E                       3358 2$:	; expect another expression or error 
      00924B 87 89 84         [ 4] 3359 	call expression
      00924E 81 02            [ 1] 3360 	cp a,#TK_INTGR 
      00924F 27 03            [ 1] 3361 	jreq 3$
      00924F 4B 00 CD         [ 2] 3362 	jp syntax_error 
      009252 93 8D            [ 2] 3363 3$:	ldw (N1,sp),x 
      009254 A1 00 27         [ 4] 3364 	call substract
      009257 19 A1            [ 1] 3365 	jrne 4$
      009259 02 26 12 CD      [ 1] 3366 	mov acc8,#2 ; n1==n2
      00925D 90 1F            [ 2] 3367 	jra 6$ 
      001345                       3368 4$: 
      00925F 0C 01            [ 1] 3369 	jrsgt 5$  
      009261 CD 88 6F A1      [ 1] 3370 	mov acc8,#4 ; n1<2 
      009265 00 27            [ 2] 3371 	jra 6$
      00134D                       3372 5$:
      009267 09 A1 0B 26      [ 1] 3373 	mov acc8,#1 ; n1>n2 
      001351                       3374 6$:
      00926B 02               [ 1] 3375 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      00926C 20 E3 CD         [ 1] 3376 	ld a, acc8  
      00926F 90 18            [ 1] 3377 	and a,(RELOP,sp)
      009271 84               [ 1] 3378 	tnz a 
      009272 81 05            [ 1] 3379 	jreq 10$
      009273 5C               [ 1] 3380 	incw x 
      00135B                       3381 7$:	 
      009273 CD 90            [ 2] 3382 	jra 10$  	
      009275 53 A6            [ 2] 3383 9$: ldw x,(N2,sp)
      00135F                       3384 10$:
      009277 09 CD            [ 1] 3385 	ld a,#TK_INTGR
      001361                       3386 rel_exit: 	 
      001361                       3387 	_drop VSIZE
      009279 92 42            [ 2]    1     addw sp,#VSIZE 
      00927B CD               [ 4] 3388 	ret 
                                   3389 
                                   3390 ;--------------------------------
                                   3391 ; BASIC: SHOW 
                                   3392 ;  show content of dstack,cstack
                                   3393 ;--------------------------------
      001364                       3394 show:
      00927C 93 8D A1         [ 1] 3395 	ld a,base 
      00927F 02               [ 1] 3396 	push a 
      009280 27 03 CC         [ 4] 3397 	call dots
      009283 87 89 89         [ 4] 3398 	call dotr 
      009286 A6               [ 1] 3399 	pop a 
      009287 0A CD 92         [ 1] 3400 	ld base,a 
      00928A 42               [ 1] 3401 	clr a 
      00928B 85               [ 4] 3402 	ret
                                   3403 
                                   3404 ;--------------------------------------------
                                   3405 ; BASIC: HEX 
                                   3406 ; select hexadecimal base for integer print
                                   3407 ;---------------------------------------------
      001374                       3408 hex_base:
      00928C C3 00 23 23      [ 1] 3409 	mov base,#16 
      009290 05               [ 4] 3410 	ret 
                                   3411 
                                   3412 ;--------------------------------------------
                                   3413 ; BASIC: DEC 
                                   3414 ; select decimal base for integer print
                                   3415 ;---------------------------------------------
      001379                       3416 dec_base:
      009291 A6 0A CC 87      [ 1] 3417 	mov base,#10
      009295 8B               [ 4] 3418 	ret 
                                   3419 
                                   3420 ;------------------------
                                   3421 ; BASIC: SIZE 
                                   3422 ; return free size in text area
                                   3423 ; output:
                                   3424 ;   A 		TK_INTGR
                                   3425 ;   X 	    size integer
                                   3426 ;--------------------------
      00137E                       3427 size:
      009296 5D 27 F8         [ 2] 3428 	ldw x,#tib 
      009299 58 89 CE 00      [ 2] 3429 	subw x,txtend 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00929D 21 72            [ 1] 3430 	ld a,#TK_INTGR
      00929F F0               [ 4] 3431 	ret 
                                   3432 
                                   3433 
                                   3434 ;------------------------
                                   3435 ; BASIC: UBOUND  
                                   3436 ; return array variable size 
                                   3437 ; output:
                                   3438 ;   A 		TK_INTGR
                                   3439 ;   X 	    array size 
                                   3440 ;--------------------------
      001388                       3441 ubound:
      0092A0 01 5B 02         [ 2] 3442 	ldw x,#tib
      0092A3 A6 02 81 1D      [ 2] 3443 	subw x,txtend 
      0092A6 54               [ 2] 3444 	srlw x 
      0092A6 52 01 CD         [ 2] 3445 	ldw array_size,x
      0092A9 88 6F            [ 1] 3446 	ld a,#TK_INTGR
      0092AB A1               [ 4] 3447 	ret 
                                   3448 
                                   3449 ;-----------------------------
                                   3450 ; BASIC: LET var=expr 
                                   3451 ; variable assignement 
                                   3452 ; output:
                                   3453 ;   A 		TK_NONE 
                                   3454 ;-----------------------------
      001396                       3455 let:
      0092AC 02 2B 4A         [ 4] 3456 	call next_token 
      0092AF 6B 01            [ 1] 3457 	cp a,#TK_VAR 
      0092B1 A4 30            [ 1] 3458 	jreq let02
      0092B3 A1 10 27         [ 2] 3459 	jp syntax_error
      0013A0                       3460 let02:
      0092B6 04 7B 01         [ 4] 3461 	call dpush 
      0092B9 20 03 EF         [ 4] 3462 	call next_token 
      0092BB A1 32            [ 1] 3463 	cp a,#TK_EQUAL
      0092BB CD 88            [ 1] 3464 	jreq 1$
      0092BD 6F 07 09         [ 2] 3465 	jp syntax_error
      0092BE                       3466 1$:	
      0092BE A1 07 26         [ 4] 3467 	call relation   
      0092C1 03 FD            [ 1] 3468 	cp a,#TK_INTGR 
      0092C3 20 2B            [ 1] 3469 	jreq 2$
      0092C5 CC 07 09         [ 2] 3470 	jp syntax_error
      0013B7                       3471 2$:	
      0092C5 A1 02            [ 1] 3472 	ldw y,x 
      0092C7 26 02 20         [ 4] 3473 	call dpop  
      0092CA 25               [ 2] 3474 	ldw (x),y   
      0092CB 81               [ 4] 3475 	ret 
                                   3476 
                                   3477 ;----------------------------
                                   3478 ; BASIC: LIST [[start][,end]]
                                   3479 ; list program lines 
                                   3480 ; form start to end 
                                   3481 ; if empty argument list then 
                                   3482 ; list all.
                                   3483 ;----------------------------
                           000001  3484 	FIRST=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                           000003  3485 	LAST=3 
                           000005  3486 	LN_PTR=5
                           000006  3487 	VSIZE=6 
      0013BE                       3488 list:
      0013BE                       3489 	_vars VSIZE
      0092CB A1 04            [ 2]    1     sub sp,#VSIZE 
      0092CD 26 06 CD         [ 2] 3490 	ldw x,txtbgn 
      0092D0 92 73 FE         [ 2] 3491 	cpw x,txtend 
      0092D3 20 1B            [ 1] 3492 	jrmi 1$
      0092D5 CC 14 3E         [ 2] 3493 	jp list_exit ; nothing to list 
      0092D5 A1 03            [ 2] 3494 1$:	ldw (LN_PTR,sp),x 
      0092D7 26               [ 2] 3495 	ldw x,(x) 
      0092D8 03 FE            [ 2] 3496 	ldw (FIRST,sp),x ; list from first line 
      0092DA 20 14 FF         [ 2] 3497 	ldw x,#0x7fff ; biggest line number 
      0092DC 1F 03            [ 2] 3498 	ldw (LAST,sp),x 
      0092DC A1 09 26         [ 4] 3499 	call arg_list
      0092DF 0A               [ 1] 3500 	tnz a
      0092E0 CD 93            [ 1] 3501 	jreq list_start 
      0092E2 8D A6            [ 1] 3502 	cp a,#2 
      0092E4 0A CD            [ 1] 3503 	jreq 4$
      0092E6 92 42            [ 1] 3504 	cp a,#1 
      0092E8 20 06            [ 1] 3505 	jreq first_line 
      0092EA CC 07 09         [ 2] 3506 	jp syntax_error 
      0092EA CD 90 18         [ 4] 3507 4$:	call dswap
      0013E9                       3508 first_line:
      0092ED 4F 20 09         [ 4] 3509 	call dpop 
      0092F0 1F 01            [ 2] 3510 	ldw (FIRST,sp),x 
      0092F0 A6 11            [ 1] 3511 	cp a,#1 
      0092F2 11 01            [ 1] 3512 	jreq lines_skip 	
      0013F2                       3513 last_line:
      0092F4 26 01 50         [ 4] 3514 	call dpop 
      0092F7 1F 03            [ 2] 3515 	ldw (LAST,sp),x 
      0013F7                       3516 lines_skip:
      0092F7 A6 02 1B         [ 2] 3517 	ldw x,txtbgn
      0092F9 1F 05            [ 2] 3518 2$:	ldw (LN_PTR,sp),x 
      0092F9 5B 01 81         [ 2] 3519 	cpw x,txtend 
      0092FC 2A 3D            [ 1] 3520 	jrpl list_exit 
      0092FC 52               [ 2] 3521 	ldw x,(x) ;lineno 
      0092FD 05 CD            [ 2] 3522 	cpw x,(FIRST,sp)
      0092FF 92 A6            [ 1] 3523 	jrpl list_start 
      009301 A1 02            [ 2] 3524 	ldw x,(LN_PTR,sp) 
      009303 2B 41 02         [ 2] 3525 	addw x,#2 
      009305 F6               [ 1] 3526 	ld a,(x)
      009305 1F               [ 1] 3527 	incw x 
      009306 03 CD 88         [ 1] 3528 	ld acc8,a 
      009309 6F A1 02 2B      [ 1] 3529 	clr acc16 
      00930D 34 6B 05 A4      [ 2] 3530 	addw x,acc16
      009311 30 A1            [ 2] 3531 	jra 2$ 
                                   3532 ; print loop
      00141A                       3533 list_start:
      009313 20 27            [ 2] 3534 	ldw x,(LN_PTR,sp)
      00141C                       3535 3$:	
      009315 07 7B 05         [ 4] 3536 	call prt_basic_line
      009318 CD 90            [ 2] 3537 	ldw x,(LN_PTR,sp)
      00931A 18 20            [ 1] 3538 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00931C 25 00 0A         [ 1] 3539 	ld acc8,a 
      00931D 72 5F 00 09      [ 1] 3540 	clr acc16 
      00931D CD 92 A6 A1      [ 2] 3541 	addw x,acc16
      009321 02 27 03         [ 2] 3542 	cpw x,txtend 
      009324 CC 87            [ 1] 3543 	jrpl list_exit
      009326 89 1F            [ 2] 3544 	ldw (LN_PTR,sp),x
      009328 01               [ 2] 3545 	ldw x,(x)
      009329 7B 05            [ 2] 3546 	cpw x,(LAST,sp)  
      00932B A1 20            [ 1] 3547 	jrsgt list_exit 
      00932D 26 05            [ 2] 3548 	ldw x,(LN_PTR,sp)
      00932F CD 91            [ 2] 3549 	jra 3$
      00143E                       3550 list_exit:
      00143E                       3551 	_drop VSIZE 
      009331 1B 20            [ 2]    1     addw sp,#VSIZE 
      009333 D1               [ 4] 3552 	ret
                                   3553 
                                   3554 ;-------------------------
                                   3555 ; print counted string 
                                   3556 ; input:
                                   3557 ;   X 		address of string
                                   3558 ;--------------------------
      001441                       3559 prt_cmd_name:
      009334 A1               [ 1] 3560 	ld a,(x)
      009335 21               [ 1] 3561 	incw x
      009336 26 05            [ 1] 3562 	and a,#15  
      009338 CD               [ 1] 3563 	push a 
      009339 91 63            [ 1] 3564 1$: tnz (1,sp) 
      00933B 20 C8            [ 1] 3565 	jreq 9$
      00933D CD               [ 1] 3566 	ld a,(x)
      00933E 91 A7 20         [ 4] 3567 	call putc 
      009341 C3               [ 1] 3568 	incw x
      009342 1E 03            [ 1] 3569 	dec (1,sp)	 
      009344 A6 02            [ 2] 3570 	jra 1$
      009346 84               [ 1] 3571 9$: pop a 
      009346 5B               [ 4] 3572 	ret	
                                   3573 
                                   3574 ;--------------------------
                                   3575 ; decompile line from token list 
                                   3576 ; input:
                                   3577 ;   X 		pointer at line
                                   3578 ; output:
                                   3579 ;   none 
                                   3580 ;--------------------------	
                           000001  3581 	BASE_SAV=1
                           000002  3582 	WIDTH_SAV=2
                           000003  3583 	XSAVE=3
                           000005  3584 	LLEN=5
                           000005  3585 	VSIZE=5 
      001455                       3586 prt_basic_line:
      001455                       3587 	_vars VSIZE 
      009347 05 81            [ 2]    1     sub sp,#VSIZE 
      009349 C6 00 07         [ 1] 3588 	ld a,base
      009349 52 05            [ 1] 3589 	ld (BASE_SAV,sp),a  
      00934B CD 92 FC         [ 1] 3590 	ld a,tab_width 
      00934E A1 02            [ 1] 3591 	ld (WIDTH_SAV,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009350 2B 38 1F         [ 2] 3592 	ldw ptr16,x
      009353 03               [ 2] 3593 	ldw x,(x)
      009354 CD 88 6F A1      [ 1] 3594 	mov base,#10
      009358 02 2B 2B 6B      [ 1] 3595 	mov tab_width,#5
      00935C 05 A4 30         [ 4] 3596 	call print_int ; print line number 
      00935F A1 10            [ 1] 3597 	ld a,#SPACE 
      009361 27 07 7B         [ 4] 3598 	call putc 
      009364 05 CD 90 18      [ 1] 3599 	clr tab_width
      009368 20 1C 02         [ 2] 3600 	ldw x,#2
      00936A 72 D6 00 14      [ 4] 3601 	ld a,([ptr16],x)
      00936A CD 92            [ 1] 3602 	ld (LLEN,sp),a 
      00936C FC               [ 1] 3603 	incw x
      00936D A1               [ 1] 3604 1$:	ld a,xl 
      00936E 02 27            [ 1] 3605 	cp a,(LLEN,sp)
      009370 03 CC            [ 1] 3606 	jrmi 19$
      009372 87 89 1F         [ 2] 3607 	jp 90$
      00148B                       3608 19$:	 
      009375 01 7B 05 A1      [ 4] 3609 	ld a,([ptr16],x)
      009379 10               [ 1] 3610 	incw x 
      00937A 26 05            [ 2] 3611 	ldw (XSAVE,sp),x 
      00937C CD 91            [ 1] 3612 	cp a,#TK_CMD 
      00937E 0D 20            [ 1] 3613 	jreq 2$
      009380 D1 CD            [ 1] 3614 	cp a,#TK_FUNC 
      009382 91 15            [ 1] 3615 	jrne 4$
      00149A                       3616 2$:	
      009384 20 CC 1E 03      [ 5] 3617 	ldw x,([ptr16],x)
      009388 A6 02 C2         [ 2] 3618 	cpw x,#rem 
      00938A 26 14            [ 1] 3619 	jrne 3$
      00938A 5B 05            [ 1] 3620 	ld a,#''
      00938C 81 01 9E         [ 4] 3621 	call putc 
      00938D 1E 03            [ 2] 3622 	ldw x,(XSAVE,sp)
      00938D 52 05 CD         [ 2] 3623 	addw x,#2
      009390 93 49 A1 02      [ 2] 3624 	addw x,ptr16  
      009394 2B 4B 1F         [ 4] 3625 	call puts 
      009397 03 CD 88         [ 2] 3626 	jp 90$ 
      00939A 6F A1 02         [ 4] 3627 3$:	call cmd_name
      00939D 2B 3E 41         [ 4] 3628 	call prt_cmd_name
      00939F A6 20            [ 1] 3629 	ld a,#SPACE 
      00939F 6B 05 A4         [ 4] 3630 	call putc 
      0093A2 30 A1            [ 2] 3631 	ldw x,(XSAVE,sp)
      0093A4 30 27 07         [ 2] 3632 	addw x,#2
      0093A7 7B 05            [ 2] 3633 	jra 1$
      0093A9 CD 90            [ 1] 3634 4$: cp a,#TK_QSTR 
      0093AB 18 20            [ 1] 3635 	jrne 5$
      0093AD 2F 22            [ 1] 3636 	ld a,#'" 
      0093AE CD 01 9E         [ 4] 3637 	call putc 
      0093AE CD 93 49 A1      [ 2] 3638 	addw x,ptr16
      0093B2 02 27 03         [ 4] 3639 	call puts 
      0093B5 CC 87            [ 1] 3640 	ld a,#'" 
      0093B7 89 1F 01         [ 4] 3641 	call putc 
      0093BA CD               [ 1] 3642 	incw x
      0093BB 91 15 26 06      [ 2] 3643 	subw x,ptr16  
      0093BF 35 02            [ 2] 3644 	jra 1$
      0093C1 00 0B            [ 1] 3645 5$:	cp a,#TK_VAR
      0093C3 20 0C            [ 1] 3646 	jrne 6$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0093C5 72 DE 00 14      [ 5] 3647 	ldw x,([ptr16],x)
      0093C5 2C 06 35         [ 2] 3648 	subw x,#vars 
      0093C8 04               [ 1] 3649 	ld a,xl
      0093C9 00               [ 1] 3650 	srl a 
      0093CA 0B 20            [ 1] 3651 	add a,#'A 
      0093CC 04 01 9E         [ 4] 3652 	call putc 
      0093CD 1E 03            [ 2] 3653 	ldw x,(XSAVE,sp)
      0093CD 35 01 00         [ 2] 3654 	addw x,#2 
      0093D0 0B 85            [ 2] 3655 	jra 1$ 
      0093D1 A1 04            [ 1] 3656 6$: cp a,#TK_ARRAY 
      0093D1 5F C6            [ 1] 3657 	jrne 7$
      0093D3 00 0B            [ 1] 3658 	ld a,#'@ 
      0093D5 14 05 4D         [ 4] 3659 	call putc 
      0093D8 27 05            [ 2] 3660 	ldw x,(XSAVE,sp)
      0093DA 5C 14 83         [ 2] 3661 	jp 1$ 
      0093DB A1 02            [ 1] 3662 7$: cp a,#TK_INTGR 
      0093DB 20 02            [ 1] 3663 	jrne 8$
      0093DD 1E 03 00 14      [ 5] 3664 	ldw x,([ptr16],x)
      0093DF CD 09 81         [ 4] 3665 	call print_int
      0093DF A6 02            [ 1] 3666 	ld a,#SPACE 
      0093E1 CD 01 9E         [ 4] 3667 	call putc 
      0093E1 5B 05            [ 2] 3668 	ldw x,(XSAVE,sp)
      0093E3 81 00 02         [ 2] 3669 	addw x,#2 
      0093E4 CC 14 83         [ 2] 3670 	jp 1$
      0093E4 C6 00            [ 1] 3671 8$: cp a,#TK_GT 
      0093E6 08 88            [ 1] 3672 	jrmi 9$
      0093E8 CD 90            [ 1] 3673 	cp a,#TK_NE 
      0093EA AD CD            [ 1] 3674 	jrugt 9$
      0093EC 90 E0            [ 1] 3675 	sub a,#TK_GT  
      0093EE 84               [ 1] 3676 	sll a 
      0093EF C7 00            [ 1] 3677 	clrw y 
      0093F1 08 4F            [ 1] 3678 	ld yl,a 
      0093F3 81 A9 15 99      [ 2] 3679 	addw y,#relop_str 
      0093F4 90 FE            [ 2] 3680 	ldw y,(y)
      0093F4 35               [ 1] 3681 	ldw x,y 
      0093F5 10 00 08         [ 4] 3682 	call puts 
      0093F8 81 03            [ 2] 3683 	ldw x,(XSAVE,sp)
      0093F9 CC 14 83         [ 2] 3684 	jp 1$
      0093F9 35 0A            [ 1] 3685 9$: cp a,#TK_PLUS 
      0093FB 00 08            [ 1] 3686 	jrne 10$
      0093FD 81 2B            [ 1] 3687 	ld a,#'+
      0093FE 20 2E            [ 2] 3688 	jra 80$ 
      0093FE AE 16            [ 1] 3689 10$: cp a,#TK_MINUS
      009400 C8 72            [ 1] 3690 	jrne 11$
      009402 B0 00            [ 1] 3691 	ld a,#'-
      009404 1E A6            [ 2] 3692 	jra 80$
      009406 02 81            [ 1] 3693 11$: cp a,#TK_MULT 
      009408 2B 0E            [ 1] 3694 	jrmi 12$
      009408 AE 16            [ 1] 3695 	cp a,#TK_MOD 
      00940A C8 72            [ 1] 3696 	jrugt 12$
      00940C B0 00            [ 1] 3697 	sub a,#0x20
      00940E 1E               [ 1] 3698 	clrw x 
      00940F 54               [ 1] 3699 	ld xl,a 
      009410 CF 00 23         [ 2] 3700 	addw x,#mul_char 
      009413 A6               [ 1] 3701 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009414 02 81            [ 2] 3702 	jra 80$ 
      009416 A1 09            [ 1] 3703 12$: cp a,#TK_LPAREN 
      009416 CD 88            [ 1] 3704 	jrmi 13$
      009418 6F A1            [ 1] 3705 	cp a,#TK_SHARP 
      00941A 03 27            [ 1] 3706 	jrugt 13$
      00941C 03 CC            [ 1] 3707 	sub a,#TK_LPAREN
      00941E 87               [ 1] 3708 	clrw x 
      00941F 89               [ 1] 3709 	ld xl,a 
      009420 1C 15 92         [ 2] 3710 	addw x,#single_char 
      009420 CD               [ 1] 3711 	ld a,(x)
      009421 90 1F            [ 2] 3712 	jra 80$
      009423 CD 88            [ 1] 3713 13$: ld a,#':
      009425 6F A1 32         [ 4] 3714 80$: call putc 
      009428 27 03            [ 2] 3715 	ldw x,(XSAVE,sp)
      00942A CC 87 89         [ 2] 3716 	jp 1$ 
      00942D                       3717 90$: 
      00942D CD 93            [ 1] 3718 	ld a,#CR 
      00942F 8D A1 02         [ 4] 3719 	call putc
      009432 27 03            [ 1] 3720 	ld a,(WIDTH_SAV,sp) 
      009434 CC 87 89         [ 1] 3721 	ld tab_width,a 
      009437 7B 01            [ 1] 3722 	ld a,(BASE_SAV,sp) 
      009437 90 93 CD         [ 1] 3723 	ld base,a
      00158F                       3724 	_drop VSIZE 
      00943A 90 2C            [ 2]    1     addw sp,#VSIZE 
      00943C FF               [ 4] 3725 	ret 	
      00943D 81 29 2C 23           3726 single_char: .byte '(',')',',','#'
      00943E 2A 2F 25              3727 mul_char: .byte '*','/','%'
      00943E 52 06 CE 00 1C C3 00  3728 relop_str: .word gt,equal,ge,lt,le,ne 
             1E 2B 03 CC 94
      00944A BE 1F                 3729 gt: .asciz ">"
      00944C 05 FE                 3730 equal: .asciz "="
      00944E 1F 01 AE              3731 ge: .asciz ">="
      009451 7F FF                 3732 lt: .asciz "<"
      009453 1F 03 CD              3733 le: .asciz "<="
      009456 92 4F 4D              3734 ne:  .asciz "<>"
                                   3735 
                                   3736 
                                   3737 ;---------------------------------
                                   3738 ; BASIC: PRINT|? arg_list 
                                   3739 ; print values from argument list
                                   3740 ;----------------------------------
                           000001  3741 	COMMA=1
                           000001  3742 	VSIZE=1
      0015B4                       3743 print:
      009459 27 3F            [ 1] 3744 push #0 ; local variable COMMA 
      0015B6                       3745 reset_comma:
      00945B A1 02            [ 1] 3746 	clr (COMMA,sp)
      0015B8                       3747 prt_loop:
      00945D 27 07 A1         [ 4] 3748 	call relation 
      009460 01 27            [ 1] 3749 	cp a,#TK_COLON 
      009462 06 CC            [ 1] 3750 	jreq print_exit   
      009464 87 89            [ 1] 3751 	cp a,#TK_INTGR 
      009466 CD 90            [ 1] 3752 	jrne 0$ 
      009468 39 09 81         [ 4] 3753 	call print_int 
      009469 20 EE            [ 2] 3754 	jra reset_comma
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0015C8                       3755 0$: 	
      009469 CD 90 2C         [ 4] 3756 	call next_token
      00946C 1F 01            [ 1] 3757 	cp a,#TK_NONE 
      00946E A1 01            [ 1] 3758 	jreq print_exit 
      009470 27 05            [ 1] 3759 1$:	cp a,#TK_QSTR
      009472 26 0E            [ 1] 3760 	jrne 2$   
      009472 CD 90 2C         [ 4] 3761 	call puts
      009475 1F               [ 1] 3762 	incw x 
      009476 03 B0 00 03      [ 2] 3763 	subw x,basicptr 
      009477 9F               [ 1] 3764 	ld a,xl 
      009477 CE 00 1C         [ 1] 3765 	ld in,a  
      00947A 1F 05            [ 2] 3766 	jra reset_comma
      00947C C3 00            [ 1] 3767 2$: cp a,#TK_CHAR 
      00947E 1E 2A            [ 1] 3768 	jrne 3$
      009480 3D               [ 1] 3769 	ld a,xl 
      009481 FE 13 01         [ 4] 3770 	call putc 
      009484 2A 14            [ 2] 3771 	jra reset_comma 
      0015EB                       3772 3$: 	
      009486 1E 05            [ 1] 3773 	cp a,#TK_FUNC 
      009488 1C 00            [ 1] 3774 	jrne 4$ 
      00948A 02               [ 4] 3775 	call (x)
      00948B F6 5C C7         [ 4] 3776 	call print_int 
      00948E 00 0B            [ 2] 3777 	jra reset_comma 
      0015F5                       3778 4$: 
      009490 72 5F            [ 1] 3779 	cp a,#TK_COMMA 
      009492 00 0A            [ 1] 3780 	jrne 5$
      009494 72 BB            [ 1] 3781 	cpl (COMMA,sp) 
      009496 00 0A 20         [ 2] 3782 	jp prt_loop   
      0015FE                       3783 5$: 
      009499 E0 0C            [ 1] 3784 	cp a,#TK_SHARP
      00949A 26 13            [ 1] 3785 	jrne 7$
      00949A 1E 05 EF         [ 4] 3786 	call next_token
      00949C A1 02            [ 1] 3787 	cp a,#TK_INTGR 
      00949C CD 94            [ 1] 3788 	jreq 6$
      00949E D5 1E 05         [ 2] 3789 	jp syntax_error 
      00160C                       3790 6$:
      0094A1 E6               [ 1] 3791 	ld a,xl 
      0094A2 02 C7            [ 1] 3792 	and a,#15 
      0094A4 00 0B 72         [ 1] 3793 	ld tab_width,a 
      0094A7 5F 00 0A         [ 2] 3794 	jp reset_comma 
      001615                       3795 7$:	
      0094AA 72 BB 00         [ 4] 3796 	call unget_token
      001618                       3797 print_exit:
      0094AD 0A C3            [ 1] 3798 	tnz (COMMA,sp)
      0094AF 00 1E            [ 1] 3799 	jrne 9$
      0094B1 2A 0B            [ 1] 3800 	ld a,#CR 
      0094B3 1F 05 FE         [ 4] 3801     call putc 
      001621                       3802 9$:	_drop VSIZE 
      0094B6 13 03            [ 2]    1     addw sp,#VSIZE 
      0094B8 2C               [ 4] 3803 	ret 
                                   3804 
                                   3805 ;----------------------
                                   3806 ; 'save_context' and
                                   3807 ; 'rest_context' must be 
                                   3808 ; called at the same 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3809 ; call stack depth 
                                   3810 ; i.e. SP must have the 
                                   3811 ; save value at  
                                   3812 ; entry point of both 
                                   3813 ; routine. 
                                   3814 ;---------------------
                           000006  3815 	CTXT_SIZE=6 ; size of saved data 
                                   3816 ;--------------------
                                   3817 ; save current BASIC
                                   3818 ; interpreter context 
                                   3819 ; on cstack 
                                   3820 ;--------------------
      001624                       3821 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001624                       3822 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001624                       3823 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001624                       3824 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001624                       3825 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      001624                       3826 save_context:
      0094B9 04 1E 05         [ 2] 3827 	ldw x,basicptr 
      0094BC 20 DE            [ 2] 3828 	ldw (BPTR,sp),x
      0094BE CE 00 05         [ 2] 3829 	ldw x,lineno 
      0094BE 5B 06            [ 2] 3830 	ldw (LNO,sp),x 
      0094C0 81 00 01         [ 1] 3831 	ld a,in 
      0094C1 6B 07            [ 1] 3832 	ld (IN,sp),a
      0094C1 F6 5C A4         [ 1] 3833 	ld a,count 
      0094C4 0F 88            [ 1] 3834 	ld (CNT,sp),a  
      0094C6 0D               [ 4] 3835 	ret
                                   3836 
                                   3837 ;-----------------------
                                   3838 ; restore previously saved 
                                   3839 ; BASIC interpreter context 
                                   3840 ; from cstack 
                                   3841 ;-------------------------
      001639                       3842 rest_context:
      0094C7 01 27            [ 2] 3843 	ldw x,(BPTR,sp)
      0094C9 09 F6 CD         [ 2] 3844 	ldw basicptr,x 
      0094CC 82 1E            [ 2] 3845 	ldw x,(LNO,sp)
      0094CE 5C 0A 01         [ 2] 3846 	ldw lineno,x 
      0094D1 20 F3            [ 1] 3847 	ld a,(IN,sp)
      0094D3 84 81 01         [ 1] 3848 	ld in,a
      0094D5 7B 08            [ 1] 3849 	ld a,(CNT,sp)
      0094D5 52 05 C6         [ 1] 3850 	ld count,a  
      0094D8 00               [ 4] 3851 	ret
                                   3852 
                                   3853 ;------------------------------------------
                                   3854 ; BASIC: INPUT [string],var[,[string],var]
                                   3855 ; input value in variables 
                                   3856 ; [string] optionally can be used as prompt 
                                   3857 ;-----------------------------------------
                           000001  3858 	CX_BPTR=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                           000003  3859 	CX_LNO=3
                           000004  3860 	CX_IN=4
                           000005  3861 	CX_CNT=5
                           000006  3862 	SKIP=6
                           000007  3863 	VSIZE=7
      00164E                       3864 input_var:
      0094D9 08 6B 01 C6 00   [ 2] 3865 	btjt flags,#FRUN,1$ 
      0094DE 26 6B            [ 1] 3866 	ld a,#ERR_RUN_ONLY 
      0094E0 02 CF 00         [ 2] 3867 	jp tb_error 
      001658                       3868 1$:	_vars VSIZE 
      0094E3 15 FE            [ 2]    1     sub sp,#VSIZE 
      00165A                       3869 input_loop:
      0094E5 35 0A            [ 1] 3870 	clr (SKIP,sp)
      0094E7 00 08 35         [ 4] 3871 	call next_token 
      0094EA 05 00            [ 1] 3872 	cp a,#TK_NONE 
      0094EC 26 CD            [ 1] 3873 	jreq input_exit 
      0094EE 8A 01            [ 1] 3874 	cp a,#TK_QSTR 
      0094F0 A6 20            [ 1] 3875 	jrne 1$ 
      0094F2 CD 82 1E         [ 4] 3876 	call puts 
      0094F5 72 5F            [ 1] 3877 	cpl (SKIP,sp)
      0094F7 00 26 AE         [ 4] 3878 	call next_token 
      0094FA 00 02            [ 1] 3879 1$: cp a,#TK_VAR  
      0094FC 72 D6            [ 1] 3880 	jreq 2$ 
      0094FE 00 15 6B         [ 2] 3881 	jp syntax_error
      009501 05 5C 9F         [ 4] 3882 2$:	call dpush 
      009504 11 05            [ 1] 3883 	tnz (SKIP,sp)
      009506 2B 03            [ 1] 3884 	jrne 21$ 
      009508 CC 96            [ 1] 3885 	ld a,#':
      00950A 00 17 19         [ 1] 3886 	ld pad+1,a 
      00950B 72 5F 17 1A      [ 1] 3887 	clr pad+2
      00950B 72 D6 00         [ 2] 3888 	ldw x,#pad 
      00950E 15 5C 1F         [ 4] 3889 	call puts   
      00168C                       3890 21$:
      009511 03 A1 06         [ 4] 3891 	call save_context 
      009514 27 04 A1         [ 2] 3892 	ldw x,#tib 
      009517 07 26 2F         [ 2] 3893 	ldw basicptr,x  
      00951A 72 5F 00 02      [ 1] 3894 	clr count  
      00951A 72 DE 00         [ 4] 3895 	call readln 
      00951D 15 A3 97 42      [ 1] 3896 	clr in 
      009521 26 14 A6         [ 4] 3897 	call relation 
      009524 27 CD            [ 1] 3898 	cp a,#TK_INTGR
      009526 82 1E            [ 1] 3899 	jreq 3$ 
      009528 1E 03 1C         [ 2] 3900 	jp syntax_error
      00952B 00 02 72         [ 4] 3901 3$: call dpush 
      00952E BB 00 15         [ 4] 3902 	call store 
      009531 CD 82 30         [ 4] 3903 	call rest_context
      009534 CC 96 00         [ 4] 3904 	call next_token 
      009537 CD 91            [ 1] 3905 	cp a,#TK_COMMA 
      009539 B8 CD            [ 1] 3906 	jrne 4$
      00953B 94 C1            [ 2] 3907 	jra input_loop 
      00953D A6 20 CD         [ 4] 3908 4$:	call unget_token 
      0016BF                       3909 input_exit:
      0016BF                       3910 	_drop VSIZE 
      009540 82 1E            [ 2]    1     addw sp,#VSIZE 
      009542 1E               [ 4] 3911 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3912 
                                   3913 
                                   3914 ;---------------------
                                   3915 ; BASIC: REMARK | ' 
                                   3916 ; skip comment to end of line 
                                   3917 ;---------------------- 
      0016C2                       3918 rem:
      009543 03 1C 00 02 20   [ 1] 3919  	mov count,in 
      009548 BA               [ 4] 3920 	ret 
                                   3921 
                                   3922 ;---------------------
                                   3923 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3924 ; read in loop 'addr'  
                                   3925 ; apply & 'mask' to value 
                                   3926 ; loop while result==0.  
                                   3927 ; if 'xor_mask' given 
                                   3928 ; apply ^ in second  
                                   3929 ; loop while result==0 
                                   3930 ;---------------------
                           000001  3931 	XMASK=1 
                           000002  3932 	MASK=2
                           000003  3933 	ADDR=3
                           000004  3934 	VSIZE=4
      0016C8                       3935 wait: 
      0016C8                       3936 	_vars VSIZE
      009549 A1 08            [ 2]    1     sub sp,#VSIZE 
      00954B 26 18            [ 1] 3937 	clr (XMASK,sp) 
      00954D A6 22 CD         [ 4] 3938 	call arg_list 
      009550 82 1E            [ 1] 3939 	cp a,#2
      009552 72 BB            [ 1] 3940 	jruge 0$
      009554 00 15 CD         [ 2] 3941 	jp syntax_error 
      009557 82 30            [ 1] 3942 0$:	cp a,#3
      009559 A6 22            [ 1] 3943 	jrult 1$
      00955B CD 82 1E         [ 4] 3944 	call dpop 
      00955E 5C               [ 1] 3945 	ld a,xl
      00955F 72 B0            [ 1] 3946 	ld (XMASK,sp),a 
      009561 00 15 20         [ 4] 3947 1$: call dpop ; mask 
      009564 9E               [ 1] 3948 	ld a,xl 
      009565 A1 03            [ 1] 3949 	ld (MASK,sp),a 
      009567 26 15 72         [ 4] 3950 	call dpop ; address 
      00956A DE               [ 1] 3951 2$:	ld a,(x)
      00956B 00 15            [ 1] 3952 	and a,(MASK,sp)
      00956D 1D 00            [ 1] 3953 	xor a,(XMASK,sp)
      00956F 27 9F            [ 1] 3954 	jreq 2$ 
      0016F0                       3955 	_drop VSIZE 
      009571 44 AB            [ 2]    1     addw sp,#VSIZE 
      009573 41               [ 4] 3956 	ret 
                                   3957 
                                   3958 ;---------------------
                                   3959 ; BASIC: BSET addr,mask
                                   3960 ; set bits at 'addr' corresponding 
                                   3961 ; to those of 'mask' that are at 1.
                                   3962 ; arguments:
                                   3963 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3964 ;   mask        mask|addr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   3965 ; output:
                                   3966 ;	none 
                                   3967 ;--------------------------
      0016F3                       3968 bit_set:
      009574 CD 82 1E         [ 4] 3969 	call arg_list 
      009577 1E 03            [ 1] 3970 	cp a,#2	 
      009579 1C 00            [ 1] 3971 	jreq 1$ 
      00957B 02 20 85         [ 2] 3972 	jp syntax_error
      0016FD                       3973 1$: 
      00957E A1 04 26         [ 4] 3974 	call dpop ; mask 
      009581 0A               [ 1] 3975 	ld a,xl 
      009582 A6 40 CD         [ 4] 3976 	call dpop ; addr  
      009585 82               [ 1] 3977 	or a,(x)
      009586 1E               [ 1] 3978 	ld (x),a
      009587 1E               [ 4] 3979 	ret 
                                   3980 
                                   3981 ;---------------------
                                   3982 ; BASIC: BRES addr,mask
                                   3983 ; reset bits at 'addr' corresponding 
                                   3984 ; to those of 'mask' that are at 1.
                                   3985 ; arguments:
                                   3986 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3987 ;   mask	    ~mask&*addr  
                                   3988 ; output:
                                   3989 ;	none 
                                   3990 ;--------------------------
      001707                       3991 bit_reset:
      009588 03 CC 95         [ 4] 3992 	call arg_list 
      00958B 03 A1            [ 1] 3993 	cp a,#2  
      00958D 02 26            [ 1] 3994 	jreq 1$ 
      00958F 14 72 DE         [ 2] 3995 	jp syntax_error
      001711                       3996 1$: 
      009592 00 15 CD         [ 4] 3997 	call dpop ; mask 
      009595 8A               [ 1] 3998 	ld a,xl 
      009596 01               [ 1] 3999 	cpl a 
      009597 A6 20 CD         [ 4] 4000 	call dpop ; addr  
      00959A 82               [ 1] 4001 	and a,(x)
      00959B 1E               [ 1] 4002 	ld (x),a 
      00959C 1E               [ 4] 4003 	ret 
                                   4004 
                                   4005 ;---------------------
                                   4006 ; BASIC: BRES addr,mask
                                   4007 ; toggle bits at 'addr' corresponding 
                                   4008 ; to those of 'mask' that are at 1.
                                   4009 ; arguments:
                                   4010 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4011 ;   mask	    mask^*addr  
                                   4012 ; output:
                                   4013 ;	none 
                                   4014 ;--------------------------
      00171C                       4015 bit_toggle:
      00959D 03 1C 00         [ 4] 4016 	call arg_list 
      0095A0 02 CC            [ 1] 4017 	cp a,#2 
      0095A2 95 03            [ 1] 4018 	jreq 1$ 
      0095A4 A1 31 2B         [ 2] 4019 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0095A7 1A A1 35         [ 4] 4020 1$: call dpop ; mask 
      0095AA 22               [ 1] 4021 	ld a,xl 
      0095AB 16 A0 31         [ 4] 4022 	call dpop ; addr  
      0095AE 48               [ 1] 4023 	xor a,(x)
      0095AF 90               [ 1] 4024 	ld (x),a 
      0095B0 5F               [ 4] 4025 	ret 
                                   4026 
                                   4027 
                                   4028 ;--------------------
                                   4029 ; BASIC: POKE addr,byte
                                   4030 ; put a byte at addr 
                                   4031 ;--------------------
      001730                       4032 poke:
      0095B1 90 97 72         [ 4] 4033 	call arg_list 
      0095B4 A9 96            [ 1] 4034 	cp a,#2
      0095B6 19 90            [ 1] 4035 	jreq 1$
      0095B8 FE 93 CD         [ 2] 4036 	jp syntax_error
      00173A                       4037 1$:	
      0095BB 82 30 1E         [ 4] 4038 	call dpop 
      0095BE 03               [ 1] 4039     ld a,xl 
      0095BF CC 95 03         [ 4] 4040 	call dpop 
      0095C2 A1               [ 1] 4041 	ld (x),a 
      0095C3 10               [ 4] 4042 	ret 
                                   4043 
                                   4044 ;-----------------------
                                   4045 ; BASIC: PEEK(addr)
                                   4046 ; get the byte at addr 
                                   4047 ; input:
                                   4048 ;	none 
                                   4049 ; output:
                                   4050 ;	X 		value 
                                   4051 ;-----------------------
      001743                       4052 peek:
      0095C4 26 04            [ 1] 4053 	ld a,#TK_LPAREN 
      0095C6 A6 2B 20         [ 4] 4054 	call expect 
      0095C9 2E A1 11         [ 4] 4055 	call arg_list
      0095CC 26 04            [ 1] 4056 	cp a,#1 
      0095CE A6 2D            [ 1] 4057 	jreq 1$
      0095D0 20 26 A1         [ 2] 4058 	jp syntax_error
      0095D3 20 2B            [ 1] 4059 1$:	ld a,#TK_RPAREN 
      0095D5 0E A1 22         [ 4] 4060 	call expect 
      0095D8 22 0A A0         [ 4] 4061 	call dpop 
      0095DB 20               [ 1] 4062 	ld a,(x)
      0095DC 5F               [ 1] 4063 	clrw x 
      0095DD 97               [ 1] 4064 	ld xl,a 
      0095DE 1C 96            [ 1] 4065 	ld a,#TK_INTGR
      0095E0 16               [ 4] 4066 	ret 
                                   4067 
      001760                       4068 if: 
      0095E1 F6 20 14         [ 4] 4069 	call relation 
      0095E4 A1 09            [ 1] 4070 	cp a,#TK_INTGR
      0095E6 2B 0E            [ 1] 4071 	jreq 1$ 
      0095E8 A1 0C 22         [ 2] 4072 	jp syntax_error
      0095EB 0A               [ 1] 4073 1$:	clr a 
      0095EC A0               [ 2] 4074 	tnzw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      0095ED 09 5F            [ 1] 4075 	jrne 9$  
                                   4076 ;skip to next line
      0095EF 97 1C 96 12 F6   [ 1] 4077 	mov in,count
      0095F4 20               [ 4] 4078 9$:	ret 
                                   4079 
                                   4080 ;------------------------
                                   4081 ; BASIC: FOR var=expr 
                                   4082 ; set variable to expression 
                                   4083 ; leave variable address 
                                   4084 ; on dstack and set
                                   4085 ; FFOR bit in 'flags'
                                   4086 ;-----------------
                           000001  4087 	RETL1=1
                           000003  4088 	INW=3
                           000005  4089 	BPTR=5
      001774                       4090 for: ; { -- var_addr }
      0095F5 02 A6            [ 1] 4091 	ld a,#TK_VAR 
      0095F7 3A CD 82         [ 4] 4092 	call expect
      0095FA 1E 1E 03         [ 4] 4093 	call dpush 
      0095FD CC 95 03         [ 4] 4094 	call let02 
      009600 72 14 00 24      [ 1] 4095 	bset flags,#FFOR 
                                   4096 ; open space on cstack for BPTR and INW 
      009600 A6               [ 2] 4097 	popw x ; call return address 
      001784                       4098 	_vars 4
      009601 0D CD            [ 2]    1     sub sp,#4 
      009603 82               [ 2] 4099 	pushw x  ; RETL1 
      009604 1E               [ 1] 4100 	clrw x 
      009605 7B 02            [ 2] 4101 	ldw (BPTR,sp),x 
      009607 C7 00            [ 2] 4102 	ldw (INW,sp),x 
      009609 26 7B 01         [ 4] 4103 	call next_token 
      00960C C7 00            [ 1] 4104 	cp a,#TK_CMD 
      00960E 08 5B            [ 1] 4105 	jreq 1$
      009610 05 81 28         [ 2] 4106 	jp syntax_error
      001796                       4107 1$:  
      009613 29 2C 23         [ 2] 4108 	cpw x,#to 
      009616 2A 2F            [ 1] 4109 	jreq to
      009618 25 96 25         [ 2] 4110 	jp syntax_error 
                                   4111 
                                   4112 ;-----------------------------------
                                   4113 ; BASIC: TO expr 
                                   4114 ; second part of FOR loop initilization
                                   4115 ; leave limit on dstack and set 
                                   4116 ; FTO bit in 'flags'
                                   4117 ;-----------------------------------
      00179E                       4118 to: ; { var_addr -- var_addr limit step }
      00961B 96 27 96 29 96   [ 2] 4119 	btjt flags,#FFOR,1$
      009620 2C 96 2E         [ 2] 4120 	jp syntax_error
      009623 96 31 3E         [ 4] 4121 1$: call relation  
      009626 00 3D            [ 1] 4122 	cp a,#TK_INTGR 
      009628 00 3E            [ 1] 4123 	jreq 2$ 
      00962A 3D 00 3C         [ 2] 4124 	jp syntax_error
      0017B0                       4125 2$: 
      00962D 00 3C 3D         [ 4] 4126     call dpush ; limit
      009630 00 3C 3E         [ 2] 4127 	ldw x,in.w 
      009633 00 07 EF         [ 4] 4128 	call next_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009634 A1 00            [ 1] 4129 	cp a,#TK_NONE  
      009634 4B 00            [ 1] 4130 	jreq 4$ 
      009636 A1 06            [ 1] 4131 	cp a,#TK_CMD
      009636 0F 01            [ 1] 4132 	jrne 3$
      009638 A3 17 CE         [ 2] 4133 	cpw x,#step 
      009638 CD 93            [ 1] 4134 	jreq step
      0017C6                       4135 3$:	
      00963A 8D A1 01         [ 4] 4136 	call unget_token   	 
      0017C9                       4137 4$:	
      00963D 27 59 A1         [ 2] 4138 	ldw x,#1   ; default step  
      009640 02 26            [ 2] 4139 	jra store_loop_addr 
                                   4140 
                                   4141 
                                   4142 ;----------------------------------
                                   4143 ; BASIC: STEP expr 
                                   4144 ; optional third par of FOR loop
                                   4145 ; initialization. 	
                                   4146 ;------------------------------------
      0017CE                       4147 step: ; {var limit -- var limit step}
      009642 05 CD 8A 01 20   [ 2] 4148 	btjt flags,#FFOR,1$
      009647 EE 07 09         [ 2] 4149 	jp syntax_error
      009648 CD 13 0D         [ 4] 4150 1$: call relation
      009648 CD 88            [ 1] 4151 	cp a,#TK_INTGR
      00964A 6F A1            [ 1] 4152 	jreq store_loop_addr  
      00964C 00 27 49         [ 2] 4153 	jp syntax_error
                                   4154 ; leave loop back entry point on cstack 
                                   4155 ; cstack is 2 call deep from interp_loop
      0017E0                       4156 store_loop_addr:
      00964F A1 08 26         [ 4] 4157 	call dpush 
      009652 0E CD 82         [ 2] 4158 	ldw x,basicptr  
      009655 30 5C            [ 2] 4159 	ldw (BPTR,sp),x 
      009657 72 B0 00         [ 2] 4160 	ldw x,in.w 
      00965A 04 9F            [ 2] 4161 	ldw (INW,sp),x   
      00965C C7 00 02 20      [ 1] 4162 	bres flags,#FFOR 
      009660 D5 A1 05 26      [ 1] 4163 	inc loop_depth  
      009664 06               [ 4] 4164 	ret 
                                   4165 
                                   4166 ;--------------------------------
                                   4167 ; BASIC: NEXT var 
                                   4168 ; FOR loop control 
                                   4169 ; increment variable with step 
                                   4170 ; and compare with limit 
                                   4171 ; loop if threshold not crossed.
                                   4172 ; else clean both stacks. 
                                   4173 ; and decrement 'loop_depth' 
                                   4174 ;--------------------------------
      0017F6                       4175 next: ; {var limit step -- [var limit step ] }
      009665 9F CD 82 1E      [ 1] 4176 	tnz loop_depth 
      009669 20 CB            [ 1] 4177 	jrne 1$ 
      00966B CC 07 09         [ 2] 4178 	jp syntax_error 
      0017FF                       4179 1$: 
      00966B A1 07            [ 1] 4180 	ld a,#TK_VAR 
      00966D 26 06 FD         [ 4] 4181 	call expect
                                   4182 ; check for good variable after NEXT 	 
      009670 CD 8A            [ 1] 4183 	ldw y,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009672 01 20 C1         [ 2] 4184 	ldw x,#4  
      009675 72 D3 00 19      [ 4] 4185 	cpw y,([dstkptr],x) ; compare variables address 
      009675 A1 0B            [ 1] 4186 	jreq 2$  
      009677 26 05 03         [ 2] 4187 	jp syntax_error ; not the good one 
      001812                       4188 2$: ; increment variable 
      00967A 01               [ 1] 4189 	ldw x,y
      00967B CC               [ 2] 4190 	ldw x,(x)  ; get var value 
      00967C 96 38 09         [ 2] 4191 	ldw acc16,x 
      00967E 72 CE 00 19      [ 5] 4192 	ldw x,[dstkptr] ; step
      00967E A1 0C 26 13      [ 2] 4193 	addw x,acc16 ; var+step 
      009682 CD 88            [ 2] 4194 	ldw (y),x ; save var new value 
                                   4195 ; compare with limit 
      009684 6F A1            [ 1] 4196 	ldw y,x 
      009686 02 27 03 CC      [ 5] 4197 	ldw x,[dstkptr] ; step in x 
      00968A 87               [ 2] 4198 	tnzw x  
      00968B 89 0B            [ 1] 4199 	jrpl 4$ ; positive step 
                                   4200 ;negative step 
      00968C AE 00 02         [ 2] 4201 	ldw x,#2
      00968C 9F A4 0F C7      [ 4] 4202 	cpw y,([dstkptr],x)
      009690 00 26            [ 1] 4203 	jrslt loop_done
      009692 CC 96            [ 2] 4204 	jra loop_back 
      001835                       4205 4$: ; positive step
      009694 36 00 02         [ 2] 4206 	ldw x,#2 
      009695 72 D3 00 19      [ 4] 4207 	cpw y,([dstkptr],x)
      009695 CD 90            [ 1] 4208 	jrsgt loop_done
      00183E                       4209 loop_back:
      009697 18 05            [ 2] 4210 	ldw x,(BPTR,sp)
      009698 CF 00 03         [ 2] 4211 	ldw basicptr,x 
      009698 0D 01 26 05 A6   [ 2] 4212 	btjf flags,#FRUN,1$ 
      00969D 0D CD            [ 1] 4213 	ld a,(2,x)
      00969F 82 1E 5B         [ 1] 4214 	ld count,a
      0096A2 01               [ 2] 4215 	ldw x,(x)
      0096A3 81 00 05         [ 2] 4216 	ldw lineno,x
      0096A4 1E 03            [ 2] 4217 1$:	ldw x,(INW,sp)
      0096A4 CE 00 04         [ 2] 4218 	ldw in.w,x 
      0096A7 1F               [ 4] 4219 	ret 
      001857                       4220 loop_done:
                                   4221 	; remove var limit step on dstack 
      0096A8 03 CE 00         [ 2] 4222 	ldw x,dstkptr 
      0096AB 06 1F 05         [ 2] 4223 	addw x,#3*CELL_SIZE
      0096AE C6 00 02         [ 2] 4224 	ldw dstkptr,x 
                                   4225 	; remove 2 return address on cstack 
      0096B1 6B               [ 2] 4226 	popw x
      001861                       4227 	_drop 4
      0096B2 07 C6            [ 2]    1     addw sp,#4 
      0096B4 00               [ 2] 4228 	pushw x 
      0096B5 03 6B 08 81      [ 1] 4229 	dec loop_depth 
      0096B9 81               [ 4] 4230 	ret 
                                   4231 
                                   4232 
                                   4233 ;------------------------
                                   4234 ; BASIC: GOTO lineno 
                                   4235 ; jump to lineno 
                                   4236 ; here cstack is 2 call deep from interp_loop 
                                   4237 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      001869                       4238 goto:
      0096B9 1E 03 CF 00 04   [ 2] 4239 	btjt flags,#FRUN,0$ 
      0096BE 1E 05            [ 1] 4240 	ld a,#ERR_RUN_ONLY
      0096C0 CF 00 06         [ 2] 4241 	jp tb_error 
      0096C3 7B               [ 4] 4242 	ret 
      0096C4 07 C7            [ 2] 4243 0$:	jra go_common
                                   4244 
                                   4245 ;--------------------
                                   4246 ; BASIC: GOSUB lineno
                                   4247 ; basic subroutine call
                                   4248 ; actual lineno and basicptr 
                                   4249 ; are saved on cstack
                                   4250 ; here cstack is 2 call deep from interp_loop 
                                   4251 ;--------------------
                           000003  4252 	GOS_RET=3
      001876                       4253 gosub:
      0096C6 00 02 7B 08 C7   [ 2] 4254 	btjt flags,#FRUN,0$ 
      0096CB 00 03            [ 1] 4255 	ld a,#ERR_RUN_ONLY
      0096CD 81 07 0B         [ 2] 4256 	jp tb_error 
      0096CE 81               [ 4] 4257 	ret 
      0096CE 72               [ 2] 4258 0$:	popw x 
      0096CF 00 00            [ 2] 4259 	sub sp,#2 
      0096D1 25               [ 2] 4260 	pushw x 
      0096D2 05 A6 06         [ 2] 4261 	ldw x,basicptr
      0096D5 CC 87            [ 1] 4262 	ld a,(2,x)
      0096D7 8B 52            [ 1] 4263 	add a,#3 
      0096D9 07 00 0A         [ 1] 4264 	ld acc8,a 
      0096DA 72 5F 00 09      [ 1] 4265 	clr acc16 
      0096DA 0F 06 CD 88      [ 2] 4266 	addw x,acc16
      0096DE 6F A1            [ 2] 4267 	ldw (GOS_RET,sp),x 
      001899                       4268 go_common: 
      0096E0 00 27 5C         [ 4] 4269 	call relation 
      0096E3 A1 08            [ 1] 4270 	cp a,#TK_INTGR
      0096E5 26 08            [ 1] 4271 	jreq 1$ 
      0096E7 CD 82 30         [ 2] 4272 	jp syntax_error
      0018A3                       4273 1$: 
      0096EA 03 06 CD         [ 4] 4274 	call search_lineno  
      0096ED 88               [ 2] 4275 	tnzw x 
      0096EE 6F A1            [ 1] 4276 	jrne 2$ 
      0096F0 03 27            [ 1] 4277 	ld a,#ERR_NO_LINE 
      0096F2 03 CC 87         [ 2] 4278 	jp tb_error 
      0018AE                       4279 2$: 
      0096F5 89 CD 90         [ 2] 4280 	ldw basicptr,x 
      0096F8 1F 0D            [ 1] 4281 	ld a,(2,x)
      0096FA 06 26 0F         [ 1] 4282 	ld count,a 
      0096FD A6               [ 2] 4283 	ldw x,(x)
      0096FE 3A C7 17         [ 2] 4284 	ldw lineno,x 
      009701 19 72 5F 17      [ 1] 4285 	mov in,#3 
      009705 1A               [ 4] 4286 	ret 
                                   4287 
                                   4288 ;------------------------
                                   4289 ; BASIC: RETURN 
                                   4290 ; exit from a subroutine 
                                   4291 ; cstack is 2 level deep from interp_loop 
                                   4292 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0018BF                       4293 return:
      009706 AE 17 18 CD 82   [ 2] 4294 	btjt flags,#FRUN,0$ 
      00970B 30 06            [ 1] 4295 	ld a,#ERR_RUN_ONLY
      00970C CC 07 0B         [ 2] 4296 	jp tb_error 
      0018C9                       4297 0$:	
      00970C CD 96            [ 2] 4298 	ldw x,(GOS_RET,sp) 
      00970E A4 AE 16         [ 2] 4299 	ldw basicptr,x 
      009711 C8 CF            [ 1] 4300 	ld a,(2,x)
      009713 00 04            [ 1] 4301 	add a,#3 
      009715 72 5F 00         [ 1] 4302 	ld count,a 
      009718 03 CD 8A EF      [ 1] 4303 	mov in,#3
      00971C 72               [ 2] 4304 	ldw x,(x)
      00971D 5F 00 02         [ 2] 4305 	ldw lineno,x 
      009720 CD               [ 1] 4306 	clr a 
      009721 93               [ 2] 4307 	popw x 
      0018DF                       4308 	_drop 2
      009722 8D A1            [ 2]    1     addw sp,#2 
      009724 02               [ 2] 4309 	pushw x
      009725 27               [ 4] 4310 	ret  
                                   4311 
                                   4312 
                                   4313 ;----------------------------------
                                   4314 ; BASIC: RUN
                                   4315 ; run BASIC program in RAM
                                   4316 ;----------------------------------- 
      0018E3                       4317 run: 
      009726 03 CC 87 89 CD   [ 2] 4318 	btjf flags,#FRUN,0$  
      00972B 90               [ 1] 4319 	clr a 
      00972C 1F               [ 4] 4320 	ret
      0018EA                       4321 0$: 
      00972D CD 90 86 CD 96   [ 2] 4322 	btjf flags,#FBREAK,1$
      0018EF                       4323 	_drop 2 
      009732 B9 CD            [ 2]    1     addw sp,#2 
      009734 88 6F A1         [ 4] 4324 	call rest_context
      0018F4                       4325 	_drop CTXT_SIZE 
      009737 0B 26            [ 2]    1     addw sp,#CTXT_SIZE 
      009739 02 20 9E CD      [ 1] 4326 	bres flags,#FBREAK 
      00973D 90 18 00 24      [ 1] 4327 	bset flags,#FRUN 
      00973F CC 07 BF         [ 2] 4328 	jp interp_loop 
      00973F 5B 07 81         [ 2] 4329 1$:	ldw x,txtbgn
      009742 C3 00 1D         [ 2] 4330 	cpw x,txtend 
      009742 55 00            [ 1] 4331 	jrmi 2$ 
      009744 02               [ 1] 4332 	clr a 
      009745 00               [ 4] 4333 	ret 
      009746 03 81 88         [ 4] 4334 2$: call ubound 
      009748                       4335 	_drop 2 
      009748 52 04            [ 2]    1     addw sp,#2 
      00974A 0F 01 CD         [ 2] 4336 	ldw x,txtbgn 
      00974D 92 4F A1         [ 2] 4337 	ldw basicptr,x 
      009750 02 24            [ 1] 4338 	ld a,(2,x)
      009752 03 CC 87         [ 1] 4339 	ld count,a
      009755 89               [ 2] 4340 	ldw x,(x)
      009756 A1 03 25         [ 2] 4341 	ldw lineno,x
      009759 06 CD 90 2C      [ 1] 4342 	mov in,#3	
      00975D 9F 6B 01 CD      [ 1] 4343 	bset flags,#FRUN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009761 90 2C 9F         [ 2] 4344 	jp interp_loop 
                                   4345 
                                   4346 
                                   4347 ;----------------------
                                   4348 ; BASIC: STOP 
                                   4349 ; stop running program
                                   4350 ;---------------------- 
      00192A                       4351 stop: 
                                   4352 ; clean dstack and cstack 
      009764 6B 02 CD         [ 2] 4353 	ldw x,#STACK_EMPTY 
      009767 90               [ 1] 4354 	ldw sp,x 
      009768 2C F6 14 02      [ 1] 4355 	bres flags,#FRUN 
      00976C 18 01 27 F9      [ 1] 4356 	bres flags,#FBREAK
      009770 5B 04 81         [ 2] 4357 	jp warm_start
                                   4358 
                                   4359 ;-----------------------
                                   4360 ; BASIC BEEP expr1,expr2
                                   4361 ; used MCU internal beeper 
                                   4362 ; to produce a sound
                                   4363 ; arguments:
                                   4364 ;    expr1   frequency, {1,2,4} mapping to 1K,2K,4K
                                   4365 ;    expr2   duration msec.
                                   4366 ;---------------------------
      009773                       4367 beep:
      009773 CD 92 4F         [ 4] 4368 	call arg_list 
      009776 A1 02            [ 1] 4369 	cp a,#2 
      009778 27 03            [ 1] 4370 	jreq 2$
      00977A CC 87 89         [ 2] 4371 	jp syntax_error 
      00977D CE 00 19         [ 2] 4372 2$: ldw x,dstkptr 
      00977D CD 90            [ 2] 4373 	ldw x,(2,x);frequency 
      00977F 2C               [ 1] 4374 	ld a,xl
      009780 9F               [ 1] 4375 	dec a 
      009781 CD               [ 1] 4376 	swap a 
      009782 90               [ 1] 4377 	sll a 
      009783 2C               [ 1] 4378 	sll a 
      009784 FA F7            [ 1] 4379 	add a,#0x3e 
      009786 81 50 F3         [ 1] 4380 	ld BEEP_CSR,a 
      009787 CD 0F AC         [ 4] 4381 	call dpop 
      009787 CD 92 4F         [ 4] 4382 	call pause02 
      00978A A1 02 27         [ 4] 4383 	call ddrop 
      00978D 03 CC            [ 1] 4384 	ld a,#0x1f
      00978F 87 89 F3         [ 1] 4385 	ld BEEP_CSR,a 
      009791 81               [ 4] 4386 	ret 
                                   4387 
                                   4388 ;-------------------------------
                                   4389 ; BASIC: PWRADC 0|1,divisor  
                                   4390 ; disable/enanble ADC 
                                   4391 ;-------------------------------
      001961                       4392 power_adc:
      009791 CD 90 2C         [ 4] 4393 	call arg_list 
      009794 9F 43            [ 1] 4394 	cp a,#2	
      009796 CD 90            [ 1] 4395 	jreq 1$
      009798 2C F4 F7         [ 2] 4396 	jp syntax_error 
      00979B 81 00 02         [ 2] 4397 1$: ldw x,#2
      00979C 72 DE 00 19      [ 5] 4398 	ldw x,([dstkptr],x) ; on|off
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00979C CD               [ 2] 4399 	tnzw x 
      00979D 92 4F            [ 1] 4400 	jreq 2$ 
      00979F A1 02 27 03      [ 5] 4401 	ldw x,[dstkptr] ; channel
      0097A3 CC               [ 1] 4402 	ld a,xl
      0097A4 87 89            [ 1] 4403 	and a,#7
      0097A6 CD               [ 1] 4404 	swap a 
      0097A7 90 2C 9F         [ 1] 4405 	ld ADC_CR1,a
      0097AA CD 90 2C F8      [ 1] 4406 	bset ADC_CR2,#ADC_CR2_ALIGN ; right 
      0097AE F7 81 54 01      [ 1] 4407 	bset ADC_CR1,#ADC_CR1_ADON 
      0097B0                       4408 	_usec_dly 7 
      0097B0 CD 92 4F         [ 2]    1     ldw x,#(16*7-2)/4
      0097B3 A1               [ 2]    2     decw x
      0097B4 02               [ 1]    3     nop 
      0097B5 27 03            [ 1]    4     jrne .-4
      0097B7 CC 87            [ 2] 4409 	jra 3$
      0097B9 89 11 54 01      [ 1] 4410 2$: bres ADC_CR1,#ADC_CR1_ADON 
      0097BA AE 00 02         [ 2] 4411 3$:	ldw x,#2
      0097BA CD 90 2C         [ 4] 4412 	call ddrop_n 
      0097BD 9F               [ 4] 4413 	ret
                                   4414 
                                   4415 ;-----------------------------
                                   4416 ; BASIC: RDADC(channel)
                                   4417 ; read adc channel 
                                   4418 ; output:
                                   4419 ;   A 		TK_INTGR 
                                   4420 ;   X 		value 
                                   4421 ;-----------------------------
      00199C                       4422 read_adc:
      0097BE CD 90            [ 1] 4423 	ld a,#TK_LPAREN 
      0097C0 2C F7 81         [ 4] 4424 	call expect 
      0097C3 CD 07 EF         [ 4] 4425 	call next_token 
      0097C3 A6 09            [ 1] 4426 	cp a,#TK_INTGR 
      0097C5 CD 92            [ 1] 4427 	jreq 1$
      0097C7 42 CD 92         [ 2] 4428 	jp syntax_error
      0097CA 4F               [ 2] 4429 1$: pushw x 
      0097CB A1 01            [ 1] 4430 	ld a,#TK_RPAREN 
      0097CD 27 03 CC         [ 4] 4431 	call expect 
      0097D0 87               [ 2] 4432 	popw x 
      0097D1 89 A6 0A         [ 2] 4433 	cpw x,#16 
      0097D4 CD 92            [ 1] 4434 	jrult 2$
      0097D6 42 CD            [ 1] 4435 	ld a,#ERR_BAD_VALUE
      0097D8 90 2C F6         [ 2] 4436 	jp tb_error 
      0097DB 5F               [ 1] 4437 2$: ld a,xl
      0097DC 97 A6 02         [ 1] 4438 	ld ADC_CSR,a 
      0097DF 81 10 54 01      [ 1] 4439 	bset ADC_CR1,#ADC_CR1_ADON
      0097E0 72 0F 54 00 FB   [ 2] 4440 	btjf ADC_CSR,#ADC_CSR_EOC,.
      0097E0 CD 93 8D         [ 2] 4441 	ldw x,ADC_DRH 
      0097E3 A1 02            [ 1] 4442 	ld a,#TK_INTGR
      0097E5 27               [ 4] 4443 	ret 
                                   4444 
                                   4445 
                                   4446 ;-----------------------
                                   4447 ; BASIC: BREAK 
                                   4448 ; insert a breakpoint 
                                   4449 ; in pogram. 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



                                   4450 ; the program is resumed
                                   4451 ; with RUN 
                                   4452 ;-------------------------
      0019CF                       4453 break:
      0097E6 03 CC 87 89 4F   [ 2] 4454 	btjt flags,#FRUN,2$
      0097EB 5D               [ 1] 4455 	clr a
      0097EC 26               [ 4] 4456 	ret 
      0019D6                       4457 2$:	 
                                   4458 ; create space on cstack to save context 
      0097ED 05 55 00         [ 2] 4459 	ldw x,#break_point 
      0097F0 03 00 02         [ 4] 4460 	call puts 
      0019DC                       4461 	_drop 2 ;drop return address 
      0097F3 81 02            [ 2]    1     addw sp,#2 
      0097F4                       4462 	_vars CTXT_SIZE ; context size 
      0097F4 A6 03            [ 2]    1     sub sp,#CTXT_SIZE 
      0097F6 CD 92 42         [ 4] 4463 	call save_context 
      0097F9 CD 90 1F         [ 2] 4464 	ldw x,#tib 
      0097FC CD 94 20         [ 2] 4465 	ldw basicptr,x
      0097FF 72               [ 1] 4466 	clr (x)
      009800 14 00 25 85      [ 1] 4467 	clr count  
      009804 52               [ 1] 4468 	clrw x 
      009805 04 89 5F         [ 2] 4469 	ldw lineno,x 
      009808 1F 05 1F         [ 2] 4470 	ldw in.w,x
      00980B 03 CD 88 6F      [ 1] 4471 	bres flags,#FRUN 
      00980F A1 06 27 03      [ 1] 4472 	bset flags,#FBREAK
      009813 CC 87 89         [ 2] 4473 	jp interp_loop 
      009816 0A 62 72 65 61 6B 20  4474 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4475 
                                   4476 ;-----------------------
                                   4477 ; BASIC: NEW
                                   4478 ; from command line only 
                                   4479 ; free program memory
                                   4480 ; and clear variables 
                                   4481 ;------------------------
      001A1E                       4482 new: 
      009816 A3 98 1E 27 03   [ 2] 4483 	btjf flags,#FRUN,0$ 
      00981B CC               [ 1] 4484 	clr a 
      00981C 87               [ 4] 4485 	ret 
      001A25                       4486 0$:	
      00981D 89 05 D7         [ 4] 4487 	call clear_basic 
      00981E 81               [ 4] 4488 	ret 
                                   4489 	 
                                   4490 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4491 ;   file system routines
                                   4492 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4493 
                                   4494 ;--------------------
                                   4495 ; input:
                                   4496 ;   X     increment 
                                   4497 ; output:
                                   4498 ;   farptr  incremented 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4499 ;---------------------
      001A29                       4500 incr_farptr:
      00981E 72 04 00 25      [ 2] 4501 	addw x,farptr+1 
      009822 03 CC            [ 1] 4502 	jrnc 1$
      009824 87 89 CD 93      [ 1] 4503 	inc farptr 
      009828 8D A1 02         [ 2] 4504 1$:	ldw farptr+1,x  
      00982B 27               [ 4] 4505 	ret 
                                   4506 
                                   4507 ;------------------------------
                                   4508 ; extended flash memory used as FLASH_DRIVE 
                                   4509 ; seek end of used flash drive   
                                   4510 ; starting at 0x10000 address.
                                   4511 ; 4 consecutives 0 bytes signal free space. 
                                   4512 ; input:
                                   4513 ;	none
                                   4514 ; output:
                                   4515 ;   ffree     free_addr| 0 if memory full.
                                   4516 ;------------------------------
      001A37                       4517 seek_fdrive:
      00982C 03 CC            [ 1] 4518 	ld a,#1
      00982E 87 89 13         [ 1] 4519 	ld farptr,a 
      009830 5F               [ 1] 4520 	clrw x 
      009830 CD 90 1F         [ 2] 4521 	ldw farptr+1,x 
      001A40                       4522 1$:
      009833 CE               [ 1] 4523 	clrw x 
      009834 00 01 CD 88      [ 5] 4524 	ldf a,([farptr],x) 
      009838 6F A1            [ 1] 4525 	jrne 2$
      00983A 00               [ 1] 4526 	incw x 
      00983B 27 0C A1 06      [ 5] 4527 	ldf a,([farptr],x)
      00983F 26 05            [ 1] 4528 	jrne 2$ 
      009841 A3               [ 1] 4529 	incw x 
      009842 98 4E 27 08      [ 5] 4530 	ldf a,([farptr],x)
      009846 26 07            [ 1] 4531 	jrne 2$ 
      009846 CD               [ 1] 4532 	incw x 
      009847 90 18 00 13      [ 5] 4533 	ldf a,([farptr],x)
      009849 27 28            [ 1] 4534 	jreq 4$ 
      001A5C                       4535 2$: 
      009849 AE 00 01         [ 2] 4536 	addw x,#1
      00984C 20 12 29         [ 4] 4537 	call incr_farptr
      00984E AE 02 7F         [ 2] 4538 	ldw x,#0x27f 
      00984E 72 04 00         [ 2] 4539 	cpw x,farptr
      009851 25 03            [ 1] 4540 	jrpl 1$
      009853 CC 87 89 CD      [ 1] 4541 	clr ffree 
      009857 93 8D A1 02      [ 1] 4542 	clr ffree+1 
      00985B 27 03 CC 87      [ 1] 4543 	clr ffree+2 
      00985F 89 5F 00 08      [ 1] 4544 	clr acc24 
      009860 72 5F 00 09      [ 1] 4545 	clr acc16
      009860 CD 90 1F CE      [ 1] 4546 	clr acc8 
      009864 00 04            [ 2] 4547 	jra 5$
      001A84                       4548 4$: ; copy farptr to ffree	 
      009866 1F 05 CE         [ 2] 4549 	ldw x,farptr+1 
      009869 00 01 1F         [ 2] 4550 	cpw x,#fdrive 
      00986C 03 72            [ 1] 4551 	jreq 41$
                                   4552 	; there is a file, last 0 of that file must be skipped.
      00986E 15 00 25         [ 2] 4553 	ldw x,#1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009871 72 5C 00         [ 4] 4554 	call incr_farptr
      001A92                       4555 41$: 
      009874 20 81 13         [ 2] 4556 	ldw x,farptr 
      009876 C6 00 15         [ 1] 4557 	ld a,farptr+2 
      009876 72 5D 00         [ 2] 4558 	ldw ffree,x 
      009879 20 26 03         [ 1] 4559 	ld ffree+2,a  
      00987C CC               [ 4] 4560 5$:	ret 
                                   4561 
                                   4562 ;-----------------------
                                   4563 ; compare file name 
                                   4564 ; with name pointed by Y  
                                   4565 ; input:
                                   4566 ;   farptr   file name 
                                   4567 ;   Y        target name 
                                   4568 ; output:
                                   4569 ;   farptr 	 at file_name
                                   4570 ;   X 		 farptr[x] point at size field  
                                   4571 ;   Carry    0|1 no match|match  
                                   4572 ;----------------------
      001A9F                       4573 cmp_name:
      00987D 87               [ 1] 4574 	clrw x
      00987E 89 AF 00 13      [ 5] 4575 1$:	ldf a,([farptr],x)
      00987F 90 F1            [ 1] 4576 	cp a,(y)
      00987F A6 03            [ 1] 4577 	jrne 4$
      009881 CD               [ 1] 4578 	tnz a 
      009882 92 42            [ 1] 4579 	jreq 9$ 
      009884 90               [ 1] 4580     incw x 
      009885 93 AE            [ 1] 4581 	incw y 
      009887 00 04            [ 2] 4582 	jra 1$
      001AB0                       4583 4$: ;no match 
      009889 72               [ 1] 4584 	tnz a 
      00988A D3 00            [ 1] 4585 	jreq 5$
      00988C 1A               [ 1] 4586 	incw x 
      00988D 27 03 CC 87      [ 5] 4587 	ldf a,([farptr],x)
      009891 89 F6            [ 2] 4588 	jra 4$  
      009892 5C               [ 1] 4589 5$:	incw x ; farptr[x] point at 'size' field 
      009892 93               [ 1] 4590 	rcf 
      009893 FE               [ 4] 4591 	ret
      001ABD                       4592 9$: ; match  
      009894 CF               [ 1] 4593 	incw x  ; farptr[x] at 'size' field 
      009895 00               [ 1] 4594 	scf 
      009896 0A               [ 4] 4595 	ret 
                                   4596 
                                   4597 ;-----------------------
                                   4598 ; search file in 
                                   4599 ; flash memory 
                                   4600 ; input:
                                   4601 ;   Y       file name  
                                   4602 ; output:
                                   4603 ;   farptr  addr at name|0
                                   4604 ;-----------------------
                           000001  4605 	FSIZE=1
                           000003  4606 	YSAVE=3
                           000004  4607 	VSIZE=4 
      001AC0                       4608 search_file: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      001AC0                       4609 	_vars VSIZE
      009897 72 CE            [ 2]    1     sub sp,#VSIZE 
      009899 00 1A            [ 2] 4610 	ldw (YSAVE,sp),y  
      00989B 72               [ 1] 4611 	clrw x 
      00989C BB 00 0A         [ 2] 4612 	ldw farptr+1,x 
      00989F 90 FF 90 93      [ 1] 4613 	mov farptr,#1
      001ACC                       4614 1$:	
                                   4615 ; check if farptr is after any file 
                                   4616 ; if  0 then so.
      0098A3 72 CE 00 1A      [ 5] 4617 	ldf a,[farptr]
      0098A7 5D 2A            [ 1] 4618 	jreq 6$
      0098A9 0B               [ 1] 4619 2$: clrw x 	
      0098AA AE 00            [ 2] 4620 	ldw y,(YSAVE,sp) 
      0098AC 02 72 D3         [ 4] 4621 	call cmp_name
      0098AF 00 1A            [ 1] 4622 	jrc 9$
      0098B1 2F 24 20 09      [ 5] 4623 	ldf a,([farptr],x)
      0098B5 6B 01            [ 1] 4624 	ld (FSIZE,sp),a 
      0098B5 AE               [ 1] 4625 	incw x 
      0098B6 00 02 72 D3      [ 5] 4626 	ldf a,([farptr],x)
      0098BA 00 1A            [ 1] 4627 	ld (FSIZE+1,sp),a 
      0098BC 2C               [ 1] 4628 	incw x 
      0098BD 19 FB 01         [ 2] 4629 	addw x,(FSIZE,sp) ; count to skip 
      0098BE CD 1A 29         [ 4] 4630 	call incr_farptr ; now at next file 'name_field'
      0098BE 1E 05 CF         [ 2] 4631 	ldw x,#0x280
      0098C1 00 04 72         [ 2] 4632 	cpw x,farptr 
      0098C4 01 00            [ 1] 4633 	jrpl 1$
      001AF6                       4634 6$: ; file not found 
      0098C6 25 09 E6 02      [ 1] 4635 	clr farptr
      0098CA C7 00 03 FE      [ 1] 4636 	clr farptr+1 
      0098CE CF 00 06 1E      [ 1] 4637 	clr farptr+2 
      001B02                       4638 	_drop VSIZE 
      0098D2 03 CF            [ 2]    1     addw sp,#VSIZE 
      0098D4 00               [ 1] 4639 	rcf
      0098D5 01               [ 4] 4640 	ret
      001B06                       4641 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001B06                       4642 	_drop VSIZE 
      0098D6 81 04            [ 2]    1     addw sp,#VSIZE 
      0098D7 99               [ 1] 4643 	scf 	
      0098D7 CE               [ 4] 4644 	ret
                                   4645 
                                   4646 ;--------------------------------
                                   4647 ; BASIC: SAVE "name" 
                                   4648 ; save text program in 
                                   4649 ; flash memory used as 
                                   4650 ;--------------------------------
                           000001  4651 	BSIZE=1
                           000003  4652 	NAMEPTR=3
                           000004  4653 	VSIZE=4
      001B0A                       4654 save:
      0098D8 00 1A 1C 00 06   [ 2] 4655 	btjf flags,#FRUN,0$ 
      0098DD CF 00            [ 1] 4656 	ld a,#ERR_CMD_ONLY 
      0098DF 1A 85 5B         [ 2] 4657 	jp tb_error
      001B14                       4658 0$:	 
      0098E2 04 89 72         [ 2] 4659 	ldw x,txtend 
      0098E5 5A 00 20 81      [ 2] 4660 	subw x,txtbgn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0098E9 26 01            [ 1] 4661 	jrne 10$
                                   4662 ; nothing to save 
      0098E9 72               [ 4] 4663 	ret 
      001B1E                       4664 10$:	
      0098EA 00 00 25         [ 1] 4665 	ld a,ffree 
      0098ED 06 A6 06         [ 1] 4666 	or a,ffree+1
      0098F0 CC 87 8B         [ 1] 4667 	or a,ffree+2 
      0098F3 81 20            [ 1] 4668 	jrne 1$
      0098F5 23 01            [ 1] 4669 	ld a,#ERR_MEM_FULL
      0098F6 CC 07 0B         [ 2] 4670 	jp tb_error 
      001B2E                       4671 1$:  
      0098F6 72 00 00         [ 4] 4672 	call next_token	
      0098F9 25 06            [ 1] 4673 	cp a,#TK_QSTR
      0098FB A6 06            [ 1] 4674 	jreq 2$
      0098FD CC 87 8B         [ 2] 4675 	jp syntax_error
      001B38                       4676 2$: ; check for existing file of that name 
      001B38                       4677 	_vars VSIZE
      009900 81 85            [ 2]    1     sub sp,#VSIZE 
      009902 52 02 89 CE      [ 2] 4678 	ldw y,basicptr 
      009906 00 04 E6 02      [ 2] 4679 	addw y,in.w
      00990A AB 03            [ 2] 4680 	ldw (NAMEPTR,sp),y  
      00990C C7 00 0B 72 5F   [ 1] 4681 	mov in,count 
      009911 00 0A 72         [ 4] 4682 	call search_file 
      009914 BB 00            [ 1] 4683 	jrnc 3$ 
      009916 0A 1F            [ 1] 4684 	ld a,#ERR_DUPLICATE 
      009918 03 07 0B         [ 2] 4685 	jp tb_error 
      009919                       4686 3$:	;** write file name to flash **
      009919 CD 93 8D         [ 2] 4687 	ldw x,ffree 
      00991C A1 02 27         [ 1] 4688 	ld a,ffree+2 
      00991F 03 CC 87         [ 2] 4689 	ldw farptr,x 
      009922 89 00 15         [ 1] 4690 	ld farptr+2,a 
      009923 1E 03            [ 2] 4691 	ldw x,(NAMEPTR,sp)  
      009923 CD 83 60         [ 4] 4692 	call strlen 
      009926 5D               [ 1] 4693 	incw  x
      009927 26 05            [ 2] 4694 	ldw (BSIZE,sp),x  
      009929 A6               [ 1] 4695 	clrw x   
      00992A 05 CC            [ 2] 4696 	ldw y,(NAMEPTR,sp)
      00992C 87 8B 51         [ 4] 4697 	call write_block  
                                   4698 ;** write file length after name **
      00992E CE 00 1D         [ 2] 4699 	ldw x,txtend 
      00992E CF 00 04 E6      [ 2] 4700 	subw x,txtbgn
      009932 02 C7            [ 2] 4701 	ldw (BSIZE,sp),x 
      009934 00               [ 1] 4702 	clrw x 
      009935 03 FE            [ 1] 4703 	ld a,(1,sp)
      009937 CF 00 06         [ 4] 4704 	call write_byte 
      00993A 35               [ 1] 4705 	incw x 
      00993B 03 00            [ 1] 4706 	ld a,(2,sp)
      00993D 02 81 DC         [ 4] 4707 	call write_byte
      00993F 5C               [ 1] 4708 	incw x  
      00993F 72 00 00         [ 4] 4709 	call incr_farptr ; move farptr after SIZE field 
                                   4710 ;** write BASIC text **
                                   4711 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009942 25 05            [ 2] 4712 	ldw x,(BSIZE,sp)
      009944 A6               [ 2] 4713 	pushw x 
      009945 06               [ 1] 4714 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009946 CC 87 8B 1B      [ 2] 4715 	ldw y,txtbgn  ; BASIC text to save 
      009949 CD 01 51         [ 4] 4716 	call write_block 
      001B91                       4717 	_drop 2 ;  drop BSIZE copy 
      009949 1E 03            [ 2]    1     addw sp,#2 
                                   4718 ; save farptr in ffree
      00994B CF 00 04         [ 2] 4719 	ldw x,farptr 
      00994E E6 02 AB         [ 1] 4720 	ld a,farptr+2 
      009951 03 C7 00         [ 2] 4721 	ldw ffree,x 
      009954 03 35 03         [ 1] 4722 	ld ffree+2,a
                                   4723 ; write 4 zero bytes as a safe gard 
      009957 00               [ 1] 4724     clrw x 
      009958 02 FE            [ 1] 4725 	push #4 
      00995A CF 00            [ 1] 4726 4$:	tnz (1,sp)
      00995C 06 4F            [ 1] 4727 	jreq 5$
      00995E 85               [ 1] 4728 	clr a 
      00995F 5B 02 89         [ 4] 4729 	call write_byte 
      009962 81               [ 1] 4730 	incw x 
      009963 0A 01            [ 1] 4731 	dec (1,sp)
      009963 72 01            [ 2] 4732 	jra 4$
      009965 00               [ 1] 4733 5$: pop a 
                                   4734 ; display saved size  
      009966 25 02            [ 2] 4735 	ldw x,(BSIZE,sp) 
      009968 4F 81 81         [ 4] 4736 	call print_int 
      00996A                       4737 	_drop VSIZE 
      00996A 72 09            [ 2]    1     addw sp,#VSIZE 
      00996C 00               [ 4] 4738 	ret 
                                   4739 
                                   4740 
                                   4741 ;------------------------
                                   4742 ; BASIC: LOAD "file" 
                                   4743 ; load file to RAM 
                                   4744 ; for execution 
                                   4745 ;------------------------
      001BB8                       4746 load:
      00996D 25 12 5B 02 CD   [ 2] 4747 	btjf flags,#FRUN,0$ 
      009972 96 B9            [ 1] 4748 	jreq 0$ 
      009974 5B 06            [ 1] 4749 	ld a,#ERR_CMD_ONLY 
      009976 72 19 00         [ 2] 4750 	jp tb_error 
      001BC4                       4751 0$:	
      009979 25 72 10         [ 4] 4752 	call next_token 
      00997C 00 25            [ 1] 4753 	cp a,#TK_QSTR
      00997E CC 88            [ 1] 4754 	jreq 1$
      009980 3F CE 00         [ 2] 4755 	jp syntax_error 
      001BCE                       4756 1$:	
      009983 1C C3 00 1E      [ 2] 4757 	ldw y,basicptr
      009987 2B 02 4F 81      [ 2] 4758 	addw y,in.w 
      00998B CD 94 08 5B 02   [ 1] 4759 	mov in,count 
      009990 CE 00 1C         [ 4] 4760 	call search_file 
      009993 CF 00            [ 1] 4761 	jrc 2$ 
      009995 04 E6            [ 1] 4762 	ld a,#ERR_NOT_FILE
      009997 02 C7 00         [ 2] 4763 	jp tb_error  
      001BE5                       4764 2$:	
      00999A 03 FE CF         [ 4] 4765 	call incr_farptr  
      00999D 00 06 35         [ 4] 4766 	call clear_basic  
      0099A0 03               [ 1] 4767 	clrw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0099A1 00 02 72 10      [ 5] 4768 	ldf a,([farptr],x)
      0099A5 00 25            [ 1] 4769 	ld yh,a 
      0099A7 CC               [ 1] 4770 	incw x  
      0099A8 88 3F 00 13      [ 5] 4771 	ldf a,([farptr],x)
      0099AA 5C               [ 1] 4772 	incw x 
      0099AA AE 17            [ 1] 4773 	ld yl,a 
      0099AC FF 94 72 11      [ 2] 4774 	addw y,txtbgn
      0099B0 00 25 72 19      [ 2] 4775 	ldw txtend,y
      0099B4 00 25 CC 87      [ 2] 4776 	ldw y,txtbgn
      001C06                       4777 3$:	; load BASIC text 	
      0099B8 DB AF 00 13      [ 5] 4778 	ldf a,([farptr],x)
      0099B9 90 F7            [ 1] 4779 	ld (y),a 
      0099B9 CD               [ 1] 4780 	incw x 
      0099BA 92 4F            [ 1] 4781 	incw y 
      0099BC A1 02 27 03      [ 2] 4782 	cpw y,txtend 
      0099C0 CC 87            [ 1] 4783 	jrmi 3$
                                   4784 ; return loaded size 	 
      0099C2 89 CE 00         [ 2] 4785 	ldw x,txtend 
      0099C5 1A EE 02 9F      [ 2] 4786 	subw x,txtbgn
      0099C9 4A 4E 48         [ 4] 4787 	call print_int 
      0099CC 48               [ 4] 4788 	ret 
                                   4789 
                                   4790 ;-----------------------------------
                                   4791 ; BASIC: FORGET ["file_name"] 
                                   4792 ; erase file_name and all others 
                                   4793 ; after it. 
                                   4794 ; without argument erase all files 
                                   4795 ;-----------------------------------
      001C20                       4796 forget:
      0099CD AB 3E C7         [ 4] 4797 	call next_token 
      0099D0 50 F3            [ 1] 4798 	cp a,#TK_NONE 
      0099D2 CD 90            [ 1] 4799 	jreq 3$ 
      0099D4 2C CD            [ 1] 4800 	cp a,#TK_QSTR
      0099D6 9E BB            [ 1] 4801 	jreq 1$
      0099D8 CD 90 53         [ 2] 4802 	jp syntax_error
      0099DB A6 1F C7 50      [ 2] 4803 1$: ldw y,basicptr
      0099DF F3 81 00 00      [ 2] 4804 	addw y,in.w
      0099E1 55 00 02 00 01   [ 1] 4805 	mov in,count 
      0099E1 CD 92 4F         [ 4] 4806 	call search_file
      0099E4 A1 02            [ 1] 4807 	jrc 2$
      0099E6 27 03            [ 1] 4808 	ld a,#ERR_NOT_FILE 
      0099E8 CC 87 89         [ 2] 4809 	jp tb_error 
      001C45                       4810 2$: 
      0099EB AE 00 02         [ 2] 4811 	ldw x,farptr
      0099EE 72 DE 00         [ 1] 4812 	ld a,farptr+2
      0099F1 1A 5D            [ 2] 4813 	jra 4$ 
      001C4D                       4814 3$: ; forget all files 
      0099F3 27 1C 72         [ 2] 4815 	ldw x,#100
      0099F6 CE               [ 1] 4816 	clr a 
      0099F7 00 1A 9F         [ 2] 4817 	ldw farptr,x 
      0099FA A4 07 4E         [ 1] 4818 	ld farptr+2,a 
      001C57                       4819 4$:
      0099FD C7 54 01         [ 2] 4820 	ldw ffree,x 
      009A00 72 16 54         [ 1] 4821 	ld ffree+2,a 
      009A03 02 72            [ 1] 4822 	push #4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009A05 10               [ 1] 4823 	clrw x 
      009A06 54 01            [ 1] 4824 5$: tnz (1,sp)
      009A08 AE 00            [ 1] 4825 	jreq 6$ 
      009A0A 1B               [ 1] 4826 	clr a  
      009A0B 5A 9D 26         [ 4] 4827 	call write_byte 
      009A0E FA               [ 1] 4828 	incw x 
      009A0F 20 04            [ 1] 4829 	dec (1,sp)
      009A11 72 11            [ 2] 4830 	jra 5$	
      009A13 54               [ 1] 4831 6$: pop a 
      009A14 01               [ 4] 4832 	ret 
                                   4833 
                                   4834 ;----------------------
                                   4835 ; BASIC: DIR 
                                   4836 ; list saved files 
                                   4837 ;----------------------
                           000001  4838 	COUNT=1 ; files counter 
                           000002  4839 	VSIZE=2 
      001C6F                       4840 directory:
      001C6F                       4841 	_vars VSIZE 
      009A15 AE 00            [ 2]    1     sub sp,#VSIZE 
      009A17 02               [ 1] 4842 	clrw x 
      009A18 CD 90            [ 2] 4843 	ldw (COUNT,sp),x 
      009A1A 90 81 14         [ 2] 4844 	ldw farptr+1,x 
      009A1C 35 01 00 13      [ 1] 4845 	mov farptr,#1 
      001C7B                       4846 dir_loop:
      009A1C A6               [ 1] 4847 	clrw x 
      009A1D 09 CD 92 42      [ 5] 4848 	ldf a,([farptr],x)
      009A21 CD 88            [ 1] 4849 	jreq 8$ 
      001C82                       4850 1$: ;name loop 	
      009A23 6F A1 02 27      [ 5] 4851 	ldf a,([farptr],x)
      009A27 03 CC            [ 1] 4852 	jreq 2$ 
      009A29 87 89 89         [ 4] 4853 	call putc 
      009A2C A6               [ 1] 4854 	incw x 
      009A2D 0A CD            [ 2] 4855 	jra 1$
      009A2F 92               [ 1] 4856 2$: incw x ; skip ending 0. 
      009A30 42 85            [ 1] 4857 	ld a,#SPACE 
      009A32 A3 00 10         [ 4] 4858 	call putc 
                                   4859 ; get file size 	
      009A35 25 05 A6 0A      [ 5] 4860 	ldf a,([farptr],x)
      009A39 CC 87            [ 1] 4861 	ld yh,a 
      009A3B 8B               [ 1] 4862 	incw x 
      009A3C 9F C7 54 00      [ 5] 4863 	ldf a,([farptr],x)
      009A40 72               [ 1] 4864 	incw x 
      009A41 10 54            [ 1] 4865 	ld yl,a 
      009A43 01 72            [ 2] 4866 	pushw y 
      009A45 0F 54 00         [ 2] 4867 	addw x,(1,sp)
                                   4868 ; skip to next file 
      009A48 FB CE 54         [ 4] 4869 	call incr_farptr 
                                   4870 ; print file size 
      009A4B 04               [ 2] 4871 	popw x ; file size 
      009A4C A6 02 81         [ 4] 4872 	call print_int 
      009A4F A6 0D            [ 1] 4873 	ld a,#CR 
      009A4F 72 00 00         [ 4] 4874 	call putc
      009A52 25 02            [ 2] 4875 	ldw x,(COUNT,sp)
      009A54 4F               [ 1] 4876 	incw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009A55 81 01            [ 2] 4877 	ldw (COUNT,sp),x  
      009A56 20 C1            [ 2] 4878 	jra dir_loop 
      001CBA                       4879 8$: ; print number of files 
      009A56 AE 9A            [ 2] 4880 	ldw x,(COUNT,sp)
      009A58 80 CD 82         [ 4] 4881 	call print_int 
      009A5B 30 5B 02         [ 2] 4882 	ldw x,#file_count 
      009A5E 52 06 CD         [ 4] 4883 	call puts  
                                   4884 ; print drive free space 	
      009A61 96 A4            [ 1] 4885 	ld a,#0xff 
      009A63 AE 16 C8         [ 1] 4886 	sub a,ffree+2 
      009A66 CF 00 04         [ 1] 4887 	ld acc8,a 
      009A69 7F 72            [ 1] 4888 	ld a,#0x7f 
      009A6B 5F 00 03         [ 1] 4889 	sbc a,ffree+1 
      009A6E 5F CF 00         [ 1] 4890 	ld acc16,a 
      009A71 06 CF            [ 1] 4891 	ld a,#2 
      009A73 00 01 72         [ 1] 4892 	sbc a,ffree 
      009A76 11 00 25         [ 1] 4893 	ld acc24,a 
      009A79 72               [ 1] 4894 	clrw x  
      009A7A 18 00            [ 1] 4895 	ld a,#6 
      009A7C 25               [ 1] 4896 	ld xl,a 
      009A7D CC 88            [ 1] 4897 	ld a,#10 
      009A7F 3F 0A 62         [ 4] 4898 	call prti24 
      009A82 72 65 61         [ 2] 4899 	ldw x,#drive_free
      009A85 6B 20 70         [ 4] 4900 	call puts 
      001CEC                       4901 	_drop VSIZE 
      009A88 6F 69            [ 2]    1     addw sp,#VSIZE 
      009A8A 6E               [ 4] 4902 	ret
      009A8B 74 2C 20 52 55 4E 20  4903 file_count: .asciz " files\n"
             74
      009A93 6F 20 72 65 73 75 6D  4904 drive_free: .asciz " bytes free\n" 
             65 2E 0A 00 0A 00
                                   4905 
                                   4906 ;---------------------
                                   4907 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   4908 ; write 1 or more byte to FLASH or EEPROM
                                   4909 ; starting at address  
                                   4910 ; input:
                                   4911 ;   expr1  	is address 
                                   4912 ;   expr2   is byte to write
                                   4913 ; output:
                                   4914 ;   none 
                                   4915 ;---------------------
                           000001  4916 	ADDR=1
                           000002  4917 	VSIZ=2 
      009A9E                       4918 write:
      001D04                       4919 	_vars VSIZE 
      009A9E 72 01            [ 2]    1     sub sp,#VSIZE 
      009AA0 00 25 02 4F      [ 1] 4920 	clr farptr ; expect 16 bits address 
      009AA4 81 12 C9         [ 4] 4921 	call expression
      009AA5 A1 02            [ 1] 4922 	cp a,#TK_INTGR 
      009AA5 CD 86            [ 1] 4923 	jreq 0$
      009AA7 57 81 09         [ 2] 4924 	jp syntax_error
      009AA9 1F 01            [ 2] 4925 0$: ldw (ADDR,sp),x 
      009AA9 72 BB 00         [ 4] 4926 	call next_token 
      009AAC 15 24            [ 1] 4927 	cp a,#TK_COMMA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009AAE 04 72            [ 1] 4928 	jreq 1$ 
      009AB0 5C 00            [ 2] 4929 	jra 9$ 
      009AB2 14 CF 00         [ 4] 4930 1$:	call expression
      009AB5 15 81            [ 1] 4931 	cp a,#TK_INTGR
      009AB7 27 03            [ 1] 4932 	jreq 2$
      009AB7 A6 01 C7         [ 2] 4933 	jp syntax_error
      009ABA 00               [ 1] 4934 2$:	ld a,xl 
      009ABB 14 5F            [ 2] 4935 	ldw x,(ADDR,sp) 
      009ABD CF 00 15         [ 2] 4936 	ldw farptr+1,x 
      009AC0 5F               [ 1] 4937 	clrw x 
      009AC0 5F 92 AF         [ 4] 4938 	call write_byte
      009AC3 00 14            [ 2] 4939 	ldw x,(ADDR,sp)
      009AC5 26               [ 1] 4940 	incw x 
      009AC6 15 5C            [ 2] 4941 	jra 0$ 
      001D38                       4942 9$:
      001D38                       4943 	_drop VSIZE
      009AC8 92 AF            [ 2]    1     addw sp,#VSIZE 
      009ACA 00               [ 4] 4944 	ret 
                                   4945 
                                   4946 
                                   4947 ;---------------------
                                   4948 ;BASIC: CHAR(expr)
                                   4949 ; évaluate expression 
                                   4950 ; and take the 7 least 
                                   4951 ; bits as ASCII character
                                   4952 ;---------------------
      001D3B                       4953 char:
      009ACB 14 26            [ 1] 4954 	ld a,#TK_LPAREN 
      009ACD 0E 5C 92         [ 4] 4955 	call expect 
      009AD0 AF 00 14         [ 4] 4956 	call relation 
      009AD3 26 07            [ 1] 4957 	cp a,#TK_INTGR 
      009AD5 5C 92            [ 1] 4958 	jreq 1$
      009AD7 AF 00 14         [ 2] 4959 	jp syntax_error
      009ADA 27               [ 2] 4960 1$:	pushw x 
      009ADB 28 0A            [ 1] 4961 	ld a,#TK_RPAREN 
      009ADC CD 11 C2         [ 4] 4962 	call expect
      009ADC 1C               [ 2] 4963 	popw x  
      009ADD 00               [ 1] 4964 	ld a,xl 
      009ADE 01 CD            [ 1] 4965 	and a,#0x7f 
      009AE0 9A               [ 1] 4966 	ld xl,a
      009AE1 A9 AE            [ 1] 4967 	ld a,#TK_CHAR
      009AE3 02               [ 4] 4968 	ret
                                   4969 
                                   4970 ;---------------------
                                   4971 ; BASIC: ASC(string|char)
                                   4972 ; extract first character 
                                   4973 ; of string argument 
                                   4974 ; return it as TK_INTGR 
                                   4975 ;---------------------
      001D58                       4976 ascii:
      009AE4 7F C3            [ 1] 4977 	ld a,#TK_LPAREN
      009AE6 00 14 2A         [ 4] 4978 	call expect 
      009AE9 D6 72 5F         [ 4] 4979 	call next_token 
      009AEC 00 17            [ 1] 4980 	cp a,#TK_QSTR 
      009AEE 72 5F            [ 1] 4981 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009AF0 00 18            [ 1] 4982 	cp a,#TK_CHAR 
      009AF2 72 5F            [ 1] 4983 	jreq 2$ 
      009AF4 00 19 72         [ 2] 4984 	jp syntax_error
      001D6B                       4985 1$: 
      009AF7 5F               [ 1] 4986 	ld a,(x)
      009AF8 00 09            [ 2] 4987 	jra 3$
      001D6E                       4988 2$: 
      009AFA 72               [ 1] 4989 	ld a,xl 
      009AFB 5F               [ 1] 4990 3$:	ld xl,a 
      009AFC 00               [ 1] 4991 	clr a  
      009AFD 0A               [ 1] 4992 	ld xh,a 
      009AFE 72               [ 2] 4993 	pushw x  
      009AFF 5F 00            [ 1] 4994 	ld a,#TK_RPAREN 
      009B01 0B 20 1A         [ 4] 4995 	call expect 
      009B04 85               [ 2] 4996 	popw x 
      009B04 CE 00            [ 1] 4997 	ld a,#TK_INTGR 
      009B06 15               [ 4] 4998 	ret 
                                   4999 
                                   5000 ;---------------------
                                   5001 ;BASIC: KEY
                                   5002 ; wait for a character 
                                   5003 ; received from STDIN 
                                   5004 ; input:
                                   5005 ;	none 
                                   5006 ; output:
                                   5007 ;	X 		ASCII character 
                                   5008 ;---------------------
      001D7C                       5009 key:
      009B07 A3 00 00         [ 4] 5010 	call getc 
      009B0A 27               [ 1] 5011 	clrw x 
      009B0B 06               [ 1] 5012 	ld xl,a 
      009B0C AE 00            [ 1] 5013 	ld a,#TK_INTGR
      009B0E 01               [ 4] 5014 	ret
                                   5015 
                                   5016 ;----------------------
                                   5017 ; BASIC: QKEY
                                   5018 ; Return true if there 
                                   5019 ; is a character in 
                                   5020 ; waiting in STDIN 
                                   5021 ; input:
                                   5022 ;  none 
                                   5023 ; output:
                                   5024 ;   X 		0|1 
                                   5025 ;-----------------------
      001D84                       5026 qkey: 
      009B0F CD               [ 1] 5027 	clrw x 
      009B10 9A A9 52 40 01   [ 2] 5028 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      009B12 5C               [ 1] 5029 	incw x 
      009B12 CE 00            [ 1] 5030 9$: ld a,#TK_INTGR
      009B14 14               [ 4] 5031 	ret 
                                   5032 
                                   5033 ;---------------------
                                   5034 ; BASIC: GPIO(expr,reg)
                                   5035 ; return gpio address 
                                   5036 ; expr {0..8}
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   5037 ; input:
                                   5038 ;   none 
                                   5039 ; output:
                                   5040 ;   X 		gpio register address
                                   5041 ;----------------------------
      001D8E                       5042 gpio:
      009B15 C6 00            [ 1] 5043 	ld a,#TK_LPAREN 
      009B17 16 CF 00         [ 4] 5044 	call expect 
      009B1A 17 C7 00         [ 4] 5045 	call arg_list
      009B1D 19 81            [ 1] 5046 	cp a,#2
      009B1F 27 03            [ 1] 5047 	jreq 1$
      009B1F 5F 92 AF         [ 2] 5048 	jp syntax_error  
      001D9D                       5049 1$:	
      009B22 00 14            [ 1] 5050 	ld a,#TK_RPAREN 
      009B24 90 F1 26         [ 4] 5051 	call expect 
      009B27 08 4D 27         [ 2] 5052 	ldw x,#2
      009B2A 12 5C 90 5C      [ 5] 5053 	ldw x,([dstkptr],x) ; port 
      009B2E 20 F0            [ 1] 5054 	jrmi bad_port
      009B30 A3 00 09         [ 2] 5055 	cpw x,#9
      009B30 4D 27            [ 1] 5056 	jrpl bad_port
      009B32 07 5C            [ 1] 5057 	ld a,#5
      009B34 92               [ 4] 5058 	mul x,a
      009B35 AF 00 14         [ 2] 5059 	addw x,#GPIO_BASE 
      009B38 20               [ 2] 5060 	pushw x 
      009B39 F6 5C 98         [ 4] 5061 	call dpop 
      009B3C 81 FB 01         [ 2] 5062 	addw x,(1,sp)
      009B3D 1F 01            [ 2] 5063 	ldw (1,sp),x  
      009B3D 5C 99 81         [ 4] 5064 	call ddrop  
      009B40 85               [ 2] 5065 	popw x 
      009B40 52 04            [ 1] 5066 	ld a,#TK_INTGR
      009B42 17               [ 4] 5067 	ret
      001DC6                       5068 bad_port:
      009B43 03 5F            [ 1] 5069 	ld a,#ERR_BAD_VALUE
      009B45 CF 00 15         [ 2] 5070 	jp tb_error
                                   5071 
                                   5072 ;----------------------
                                   5073 ; BASIC: ODR 
                                   5074 ; return offset of gpio
                                   5075 ; ODR register: 0
                                   5076 ; ---------------------
      001DCB                       5077 port_odr:
      009B48 35 01 00         [ 2] 5078 	ldw x,#GPIO_ODR
      009B4B 14 02            [ 1] 5079 	ld a,#TK_INTGR
      009B4C 81               [ 4] 5080 	ret
                                   5081 
                                   5082 ;----------------------
                                   5083 ; BASIC: IDR 
                                   5084 ; return offset of gpio
                                   5085 ; IDR register: 1
                                   5086 ; ---------------------
      001DD1                       5087 port_idr:
      009B4C 92 BC 00         [ 2] 5088 	ldw x,#GPIO_IDR
      009B4F 14 27            [ 1] 5089 	ld a,#TK_INTGR
      009B51 24               [ 4] 5090 	ret
                                   5091 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   5092 ;----------------------
                                   5093 ; BASIC: DDR 
                                   5094 ; return offset of gpio
                                   5095 ; DDR register: 2
                                   5096 ; ---------------------
      001DD7                       5097 port_ddr:
      009B52 5F 16 03         [ 2] 5098 	ldw x,#GPIO_DDR
      009B55 CD 9B            [ 1] 5099 	ld a,#TK_INTGR
      009B57 1F               [ 4] 5100 	ret
                                   5101 
                                   5102 ;----------------------
                                   5103 ; BASIC: CRL  
                                   5104 ; return offset of gpio
                                   5105 ; CR1 register: 3
                                   5106 ; ---------------------
      001DDD                       5107 port_cr1:
      009B58 25 2C 92         [ 2] 5108 	ldw x,#GPIO_CR1
      009B5B AF 00            [ 1] 5109 	ld a,#TK_INTGR
      009B5D 14               [ 4] 5110 	ret
                                   5111 
                                   5112 ;----------------------
                                   5113 ; BASIC: CRH  
                                   5114 ; return offset of gpio
                                   5115 ; CR2 register: 4
                                   5116 ; ---------------------
      001DE3                       5117 port_cr2:
      009B5E 6B 01 5C         [ 2] 5118 	ldw x,#GPIO_CR2
      009B61 92 AF            [ 1] 5119 	ld a,#TK_INTGR
      009B63 00               [ 4] 5120 	ret
                                   5121 
                                   5122 ;-------------------------
                                   5123 ; BASIC: UFLASH 
                                   5124 ; return user flash address
                                   5125 ; input:
                                   5126 ;  none 
                                   5127 ; output:
                                   5128 ;	A		TK_INTGR
                                   5129 ;   X 		user address 
                                   5130 ;---------------------------
      001DE9                       5131 uflash:
      009B64 14 6B 02         [ 2] 5132 	ldw x,#user_space 
      009B67 5C 72            [ 1] 5133 	ld a,#TK_INTGR 
      009B69 FB               [ 4] 5134 	ret 
                                   5135 
                                   5136 ;-------------------------
                                   5137 ; BASIC: EEPROM 
                                   5138 ; return eeprom address
                                   5139 ; input:
                                   5140 ;  none 
                                   5141 ; output:
                                   5142 ;	A		TK_INTGR
                                   5143 ;   X 		eeprom address 
                                   5144 ;---------------------------
      001DEF                       5145 eeprom:
      009B6A 01 CD 9A         [ 2] 5146 	ldw x,#EEPROM_BASE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009B6D A9 AE            [ 1] 5147 	ld a,#TK_INTGR 
      009B6F 02               [ 4] 5148 	ret 
                                   5149 
                                   5150 ;---------------------
                                   5151 ; BASIC: USR(addr[,arg])
                                   5152 ; execute a function written 
                                   5153 ; in binary code.
                                   5154 ; binary fonction should 
                                   5155 ; return token attribute in A 
                                   5156 ; and value in X. 
                                   5157 ; input:
                                   5158 ;   addr	routine address 
                                   5159 ;   arg 	is an optional argument 
                                   5160 ; output:
                                   5161 ;   A 		token attribute 
                                   5162 ;   X       returned value 
                                   5163 ;---------------------
      001DF5                       5164 usr:
      009B70 80 C3            [ 2] 5165 	pushw y 	
      009B72 00 14            [ 1] 5166 	ld a,#TK_LPAREN 
      009B74 2A D6 C2         [ 4] 5167 	call expect 
      009B76 CD 11 CF         [ 4] 5168 	call arg_list 
      009B76 72 5F            [ 1] 5169 	cp a,#1 
      009B78 00 14            [ 1] 5170 	jrpl 2$ 
      009B7A 72 5F 00         [ 2] 5171 	jp syntax_error 
      009B7D 15 72            [ 1] 5172 2$: ld a,#TK_RPAREN
      009B7F 5F 00 16         [ 4] 5173 	call expect 
      009B82 5B 04 98         [ 4] 5174 	call dpop 
      009B85 81 02            [ 1] 5175 	cp a,#2 
      009B86 2B 05            [ 1] 5176 	jrmi 4$
      009B86 5B 04            [ 1] 5177 	ldw y,x ; y=arg 
      009B88 99 81 AC         [ 4] 5178 	call dpop ;x=addr 
      009B8A 51               [ 1] 5179 4$:	exgw y,x ; y=addr,x=arg 
      009B8A 72 01            [ 4] 5180 	call (y)
      009B8C 00 25            [ 2] 5181 	popw y 
      009B8E 05               [ 4] 5182 	ret 
                                   5183 
                                   5184 ;------------------------------
                                   5185 ; BASIC: BYE 
                                   5186 ; halt mcu in its lowest power mode 
                                   5187 ; wait for reset or external interrupt
                                   5188 ; do a cold start on wakeup.
                                   5189 ;------------------------------
      001E1D                       5190 bye:
      009B8F A6 07 CC 87 8B   [ 2] 5191 	btjf UART3_SR,#UART_SR_TC,.
      009B94 8E               [10] 5192 	halt
      009B94 CE 00 1E         [ 2] 5193 	jp cold_start  
                                   5194 
                                   5195 ;----------------------------------
                                   5196 ; BASIC: SLEEP 
                                   5197 ; halt mcu until reset or external
                                   5198 ; interrupt.
                                   5199 ; Resume progam after SLEEP command
                                   5200 ;----------------------------------
      001E26                       5201 sleep:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009B97 72 B0 00 1C 26   [ 2] 5202 	btjf UART3_SR,#UART_SR_TC,.
      009B9C 01 81 00 24      [ 1] 5203 	bset flags,#FSLEEP
      009B9E 8E               [10] 5204 	halt 
      009B9E C6               [ 4] 5205 	ret 
                                   5206 
                                   5207 ;-------------------------------
                                   5208 ; BASIC: PAUSE expr 
                                   5209 ; suspend execution for n msec.
                                   5210 ; input:
                                   5211 ;	none
                                   5212 ; output:
                                   5213 ;	none 
                                   5214 ;------------------------------
      001E31                       5215 pause:
      009B9F 00 17 CA         [ 4] 5216 	call expression
      009BA2 00 18            [ 1] 5217 	cp a,#TK_INTGR
      009BA4 CA 00            [ 1] 5218 	jreq pause02 
      009BA6 19 26 05         [ 2] 5219 	jp syntax_error
      001E3B                       5220 pause02: 
      009BA9 A6               [ 2] 5221 1$: tnzw x 
      009BAA 01 CC            [ 1] 5222 	jreq 2$
      009BAC 87               [10] 5223 	wfi 
      009BAD 8B               [ 2] 5224 	decw x 
      009BAE 26 F9            [ 1] 5225 	jrne 1$
      009BAE CD               [ 1] 5226 2$:	clr a 
      009BAF 88               [ 4] 5227 	ret 
                                   5228 
                                   5229 ;------------------------------
                                   5230 ; BASIC: TICKS
                                   5231 ; return msec ticks counter value 
                                   5232 ; input:
                                   5233 ; 	none 
                                   5234 ; output:
                                   5235 ;	X 		TK_INTGR
                                   5236 ;-------------------------------
      001E44                       5237 get_ticks:
      009BB0 6F A1 08         [ 2] 5238 	ldw x,ticks 
      009BB3 27 03            [ 1] 5239 	ld a,#TK_INTGR
      009BB5 CC               [ 4] 5240 	ret 
                                   5241 
                                   5242 
                                   5243 
                                   5244 ;------------------------------
                                   5245 ; BASIC: ABS(expr)
                                   5246 ; return absolute value of expr.
                                   5247 ; input:
                                   5248 ;   none
                                   5249 ; output:
                                   5250 ;   X     	positive integer
                                   5251 ;-------------------------------
      001E4A                       5252 abs:
      009BB6 87 89            [ 1] 5253 	ld a,#TK_LPAREN
      009BB8 CD 11 C2         [ 4] 5254 	call expect 
      009BB8 52 04 90         [ 4] 5255 	call arg_list
      009BBB CE 00            [ 1] 5256 	cp a,#1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009BBD 04 72            [ 1] 5257 	jreq 0$ 
      009BBF B9 00 01         [ 2] 5258 	jp syntax_error
      001E59                       5259 0$:  
      009BC2 17 03            [ 1] 5260 	ld a,#TK_RPAREN 
      009BC4 55 00 03         [ 4] 5261 	call expect 
      009BC7 00 02 CD         [ 4] 5262     call dpop   
      009BCA 9B               [ 1] 5263 	ld a,xh 
      009BCB 40 24            [ 1] 5264 	bcp a,#0x80 
      009BCD 05 A6            [ 1] 5265 	jreq 2$ 
      009BCF 08               [ 2] 5266 	negw x 
      009BD0 CC 87            [ 1] 5267 2$: ld a,#TK_INTGR 
      009BD2 8B               [ 4] 5268 	ret 
                                   5269 
                                   5270 ;------------------------------
                                   5271 ; BASIC: RND(expr)
                                   5272 ; return random number 
                                   5273 ; between 1 and expr inclusive
                                   5274 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5275 ; input:
                                   5276 ; 	none 
                                   5277 ; output:
                                   5278 ;	X 		random positive integer 
                                   5279 ;------------------------------
      009BD3                       5280 random:
      009BD3 CE 00            [ 1] 5281 	ld a,#TK_LPAREN 
      009BD5 17 C6 00         [ 4] 5282 	call expect 
      009BD8 19 CF 00         [ 4] 5283 	call arg_list 
      009BDB 14 C7            [ 1] 5284 	cp a,#1
      009BDD 00 16            [ 1] 5285 	jreq 1$
      009BDF 1E 03 CD         [ 2] 5286 	jp syntax_error
      009BE2 82 F2            [ 1] 5287 1$: ld a,#TK_RPAREN
      009BE4 5C 1F 01         [ 4] 5288 	call expect 
      009BE7 5F 16 03         [ 4] 5289 	call dpop 
      009BEA CD               [ 2] 5290 	pushw x 
      009BEB 81               [ 1] 5291 	ld a,xh 
      009BEC D1 CE            [ 1] 5292 	bcp a,#0x80 
      009BEE 00 1E            [ 1] 5293 	jreq 2$
      009BF0 72 B0            [ 1] 5294 	ld a,#ERR_BAD_VALUE
      009BF2 00 1C 1F         [ 2] 5295 	jp tb_error
      001E8C                       5296 2$: 
                                   5297 ; acc16=(x<<5)^x 
      009BF5 01 5F 7B         [ 2] 5298 	ldw x,seedx 
      009BF8 01               [ 2] 5299 	sllw x 
      009BF9 CD               [ 2] 5300 	sllw x 
      009BFA 81               [ 2] 5301 	sllw x 
      009BFB 5C               [ 2] 5302 	sllw x 
      009BFC 5C               [ 2] 5303 	sllw x 
      009BFD 7B               [ 1] 5304 	ld a,xh 
      009BFE 02 CD 81         [ 1] 5305 	xor a,seedx 
      009C01 5C 5C CD         [ 1] 5306 	ld acc16,a 
      009C04 9A               [ 1] 5307 	ld a,xl 
      009C05 A9 1E 01         [ 1] 5308 	xor a,seedx+1 
      009C08 89 5F 90         [ 1] 5309 	ld acc8,a 
                                   5310 ; seedx=seedy 
      009C0B CE 00 1C         [ 2] 5311 	ldw x,seedy 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009C0E CD 81 D1         [ 2] 5312 	ldw seedx,x  
                                   5313 ; seedy=seedy^(seedy>>1)
      009C11 5B 02            [ 2] 5314 	srlw y 
      009C13 CE 00            [ 1] 5315 	ld a,yh 
      009C15 14 C6 00         [ 1] 5316 	xor a,seedy 
      009C18 16 CF 00         [ 1] 5317 	ld seedy,a  
      009C1B 17 C7            [ 1] 5318 	ld a,yl 
      009C1D 00 19 5F         [ 1] 5319 	xor a,seedy+1 
      009C20 4B 04 0D         [ 1] 5320 	ld seedy+1,a 
                                   5321 ; acc16>>3 
      009C23 01 27 09         [ 2] 5322 	ldw x,acc16 
      009C26 4F               [ 2] 5323 	srlw x 
      009C27 CD               [ 2] 5324 	srlw x 
      009C28 81               [ 2] 5325 	srlw x 
                                   5326 ; x=acc16^x 
      009C29 5C               [ 1] 5327 	ld a,xh 
      009C2A 5C 0A 01         [ 1] 5328 	xor a,acc16 
      009C2D 20               [ 1] 5329 	ld xh,a 
      009C2E F3               [ 1] 5330 	ld a,xl 
      009C2F 84 1E 01         [ 1] 5331 	xor a,acc8 
      009C32 CD               [ 1] 5332 	ld xl,a 
                                   5333 ; seedy=x^seedy 
      009C33 8A 01 5B         [ 1] 5334 	xor a,seedy+1
      009C36 04               [ 1] 5335 	ld xl,a 
      009C37 81               [ 1] 5336 	ld a,xh 
      009C38 C8 00 0F         [ 1] 5337 	xor a,seedy
      009C38 72               [ 1] 5338 	ld xh,a 
      009C39 01 00 25         [ 2] 5339 	ldw seedy,x 
                                   5340 ; return seedy modulo expr + 1 
      009C3C 07 27            [ 2] 5341 	popw y 
      009C3E 05               [ 2] 5342 	divw x,y 
      009C3F A6               [ 1] 5343 	ldw x,y 
      009C40 07               [ 1] 5344 	incw x 
      009C41 CC 87            [ 1] 5345 	ld a,#TK_INTGR
      009C43 8B               [ 4] 5346 	ret 
                                   5347 
                                   5348 ;---------------------------------
                                   5349 ; BASIC: WORDS 
                                   5350 ; affiche la listes des mots du
                                   5351 ; dictionnaire.
                                   5352 ;---------------------------------
                           000001  5353 	WLEN=1
                           000002  5354 	LLEN=2  
                           000002  5355 	VSIZE=2 
      009C44                       5356 words:
      001EDE                       5357 	_vars VSIZE
      009C44 CD 88            [ 2]    1     sub sp,#VSIZE 
      009C46 6F A1            [ 1] 5358 	clr (LLEN,sp)
      009C48 08 27 03 CC      [ 2] 5359 	ldw y,#kword_dict+2
      009C4C 87               [ 1] 5360 0$:	ldw x,y
      009C4D 89               [ 1] 5361 	ld a,(x)
      009C4E A4 0F            [ 1] 5362 	and a,#15 
      009C4E 90 CE            [ 1] 5363 	ld (WLEN,sp),a 
      009C50 00               [ 1] 5364 1$:	incw x 
      009C51 04               [ 1] 5365 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009C52 72 B9 00         [ 4] 5366 	call putc 
      009C55 01 55            [ 1] 5367 	inc (LLEN,sp)
      009C57 00 03            [ 1] 5368 	dec (WLEN,sp)
      009C59 00 02            [ 1] 5369 	jrne 1$
      009C5B CD 9B            [ 1] 5370 	ld a,#70
      009C5D 40 25            [ 1] 5371 	cp a,(LLEN,sp)
      009C5F 05 A6            [ 1] 5372 	jrmi 2$   
      009C61 09 CC            [ 1] 5373 	ld a,#SPACE 
      009C63 87 8B 9E         [ 4] 5374 	call putc 
      009C65 0C 02            [ 1] 5375 	inc (LLEN,sp) 
      009C65 CD 9A            [ 2] 5376 	jra 3$
      009C67 A9 CD            [ 1] 5377 2$: ld a,#CR 
      009C69 86 57 5F         [ 4] 5378 	call putc 
      009C6C 92 AF            [ 1] 5379 	clr (LLEN,sp)
      009C6E 00 14 90 95      [ 2] 5380 3$:	subw y,#2 
      009C72 5C 92            [ 2] 5381 	ldw y,(y)
      009C74 AF 00            [ 1] 5382 	jrne 0$  
      001F15                       5383 	_drop VSIZE 
      009C76 14 5C            [ 2]    1     addw sp,#VSIZE 
      009C78 90               [ 4] 5384 	ret 
                                   5385 
                                   5386 
                                   5387 ;*********************************
                                   5388 
                                   5389 ;------------------------------
                                   5390 ;      dictionary 
                                   5391 ; format:
                                   5392 ;   link:   2 bytes 
                                   5393 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5394 ;   cmd_name: 16 byte max 
                                   5395 ;   code_address: 2 bytes 
                                   5396 ;------------------------------
                           000080  5397 	FFUNC=128 ; function flag 
                                   5398 	.macro _dict_entry len,name,cmd 
                                   5399 	.word LINK 
                                   5400 	LINK=.
                                   5401 name:
                                   5402 	.byte len 	
                                   5403 	.ascii "name"
                                   5404 	.word cmd 
                                   5405 	.endm 
                                   5406 
                           000000  5407 	LINK=0
      001F18                       5408 kword_end:
      001F18                       5409 	_dict_entry,3,BYE,bye 
      009C79 97 72                    1 	.word LINK 
                           001F1A     2 	LINK=.
      001F1A                          3 BYE:
      009C7B B9                       4 	.byte 3 	
      009C7C 00 1C 90                 5 	.ascii "BYE"
      009C7F CF 00                    6 	.word bye 
      001F20                       5410 	_dict_entry,5,WORDS,words 
      009C81 1E 90                    1 	.word LINK 
                           001F22     2 	LINK=.
      001F22                          3 WORDS:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009C83 CE                       4 	.byte 5 	
      009C84 00 1C 52 44 53           5 	.ascii "WORDS"
      009C86 1E DE                    6 	.word words 
      001F2A                       5411 	_dict_entry,5,SLEEP,sleep 
      009C86 92 AF                    1 	.word LINK 
                           001F2C     2 	LINK=.
      001F2C                          3 SLEEP:
      009C88 00                       4 	.byte 5 	
      009C89 14 90 F7 5C 90           5 	.ascii "SLEEP"
      009C8E 5C 90                    6 	.word sleep 
      001F34                       5412 	_dict_entry,6,FORGET,forget 
      009C90 C3 00                    1 	.word LINK 
                           001F36     2 	LINK=.
      001F36                          3 FORGET:
      009C92 1E                       4 	.byte 6 	
      009C93 2B F1 CE 00 1E 72        5 	.ascii "FORGET"
      009C99 B0 00                    6 	.word forget 
      001F3F                       5413 	_dict_entry,3,DIR,directory 
      009C9B 1C CD                    1 	.word LINK 
                           001F41     2 	LINK=.
      001F41                          3 DIR:
      009C9D 8A                       4 	.byte 3 	
      009C9E 01 81 52                 5 	.ascii "DIR"
      009CA0 1C 6F                    6 	.word directory 
      001F47                       5414 	_dict_entry,4,LOAD,load 
      009CA0 CD 88                    1 	.word LINK 
                           001F49     2 	LINK=.
      001F49                          3 LOAD:
      009CA2 6F                       4 	.byte 4 	
      009CA3 A1 00 27 26              5 	.ascii "LOAD"
      009CA7 A1 08                    6 	.word load 
      001F50                       5415 	_dict_entry,4,SAVE,save
      009CA9 27 03                    1 	.word LINK 
                           001F52     2 	LINK=.
      001F52                          3 SAVE:
      009CAB CC                       4 	.byte 4 	
      009CAC 87 89 90 CE              5 	.ascii "SAVE"
      009CB0 00 04                    6 	.word save 
      001F59                       5416 	_dict_entry,5,WRITE,write  
      009CB2 72 B9                    1 	.word LINK 
                           001F5B     2 	LINK=.
      001F5B                          3 WRITE:
      009CB4 00                       4 	.byte 5 	
      009CB5 01 55 00 03 00           5 	.ascii "WRITE"
      009CBA 02 CD                    6 	.word write 
      001F63                       5417 	_dict_entry,3,NEW,new
      009CBC 9B 40                    1 	.word LINK 
                           001F65     2 	LINK=.
      001F65                          3 NEW:
      009CBE 25                       4 	.byte 3 	
      009CBF 05 A6 09                 5 	.ascii "NEW"
      009CC2 CC 87                    6 	.word new 
      001F6B                       5418 	_dict_entry,5,BREAK,break 
      009CC4 8B 65                    1 	.word LINK 
                           001F6D     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009CC5                          3 BREAK:
      009CC5 CE                       4 	.byte 5 	
      009CC6 00 14 C6 00 16           5 	.ascii "BREAK"
      009CCB 20 0A                    6 	.word break 
      009CCD                       5419 	_dict_entry,4,BEEP,beep 
      009CCD AE 00                    1 	.word LINK 
                           001F77     2 	LINK=.
      001F77                          3 BEEP:
      009CCF 64                       4 	.byte 4 	
      009CD0 4F CF 00 14              5 	.ascii "BEEP"
      009CD4 C7 00                    6 	.word beep 
      001F7E                       5420 	_dict_entry,4,STOP,stop 
      009CD6 16 77                    1 	.word LINK 
                           001F80     2 	LINK=.
      009CD7                          3 STOP:
      009CD7 CF                       4 	.byte 4 	
      009CD8 00 17 C7 00              5 	.ascii "STOP"
      009CDC 19 4B                    6 	.word stop 
      001F87                       5421     _dict_entry,4,SHOW,show 
      009CDE 04 5F                    1 	.word LINK 
                           001F89     2 	LINK=.
      001F89                          3 SHOW:
      009CE0 0D                       4 	.byte 4 	
      009CE1 01 27 09 4F              5 	.ascii "SHOW"
      009CE5 CD 81                    6 	.word show 
      001F90                       5422 	_dict_entry 3,RUN,run
      009CE7 5C 5C                    1 	.word LINK 
                           001F92     2 	LINK=.
      001F92                          3 RUN:
      009CE9 0A                       4 	.byte 3 	
      009CEA 01 20 F3                 5 	.ascii "RUN"
      009CED 84 81                    6 	.word run 
      009CEF                       5423 	_dict_entry 4,LIST,list
      009CEF 52 02                    1 	.word LINK 
                           001F9A     2 	LINK=.
      001F9A                          3 LIST:
      009CF1 5F                       4 	.byte 4 	
      009CF2 1F 01 CF 00              5 	.ascii "LIST"
      009CF6 15 35                    6 	.word list 
      001FA1                       5424 	_dict_entry,3+FFUNC,USR,usr
      009CF8 01 00                    1 	.word LINK 
                           001FA3     2 	LINK=.
      001FA3                          3 USR:
      009CFA 14                       4 	.byte 3+FFUNC 	
      009CFB 55 53 52                 5 	.ascii "USR"
      009CFB 5F 92                    6 	.word usr 
      001FA9                       5425 	_dict_entry,6+FFUNC,EEPROM,eeprom 
      009CFD AF 00                    1 	.word LINK 
                           001FAB     2 	LINK=.
      001FAB                          3 EEPROM:
      009CFF 14                       4 	.byte 6+FFUNC 	
      009D00 27 38 50 52 4F 4D        5 	.ascii "EEPROM"
      009D02 1D EF                    6 	.word eeprom 
      001FB4                       5426 	_dict_entry,6+FFUNC,UFLASH,uflash 
      009D02 92 AF                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



                           001FB6     2 	LINK=.
      001FB6                          3 UFLASH:
      009D04 00                       4 	.byte 6+FFUNC 	
      009D05 14 27 06 CD 82 1E        5 	.ascii "UFLASH"
      009D0B 5C 20                    6 	.word uflash 
      001FBF                       5427 	_dict_entry,3+FFUNC,ODR,port_odr
      009D0D F4 5C                    1 	.word LINK 
                           001FC1     2 	LINK=.
      001FC1                          3 ODR:
      009D0F A6                       4 	.byte 3+FFUNC 	
      009D10 20 CD 82                 5 	.ascii "ODR"
      009D13 1E 92                    6 	.word port_odr 
      001FC7                       5428 	_dict_entry,3+FFUNC,IDR,port_idr
      009D15 AF 00                    1 	.word LINK 
                           001FC9     2 	LINK=.
      001FC9                          3 IDR:
      009D17 14                       4 	.byte 3+FFUNC 	
      009D18 90 95 5C                 5 	.ascii "IDR"
      009D1B 92 AF                    6 	.word port_idr 
      001FCF                       5429 	_dict_entry,3+FFUNC,DDR,port_ddr 
      009D1D 00 14                    1 	.word LINK 
                           001FD1     2 	LINK=.
      001FD1                          3 DDR:
      009D1F 5C                       4 	.byte 3+FFUNC 	
      009D20 90 97 90                 5 	.ascii "DDR"
      009D23 89 72                    6 	.word port_ddr 
      001FD7                       5430 	_dict_entry,3+FFUNC,CRL,port_cr1 
      009D25 FB 01                    1 	.word LINK 
                           001FD9     2 	LINK=.
      001FD9                          3 CRL:
      009D27 CD                       4 	.byte 3+FFUNC 	
      009D28 9A A9 85                 5 	.ascii "CRL"
      009D2B CD 8A                    6 	.word port_cr1 
      001FDF                       5431 	_dict_entry,3+FFUNC,CRH,port_cr2
      009D2D 01 A6                    1 	.word LINK 
                           001FE1     2 	LINK=.
      001FE1                          3 CRH:
      009D2F 0D                       4 	.byte 3+FFUNC 	
      009D30 CD 82 1E                 5 	.ascii "CRH"
      009D33 1E 01                    6 	.word port_cr2 
      001FE7                       5432 	_dict_entry,4+FFUNC,GPIO,gpio 
      009D35 5C 1F                    1 	.word LINK 
                           001FE9     2 	LINK=.
      001FE9                          3 GPIO:
      009D37 01                       4 	.byte 4+FFUNC 	
      009D38 20 C1 49 4F              5 	.ascii "GPIO"
      009D3A 1D 8E                    6 	.word gpio 
      001FF0                       5433 	_dict_entry,6,PWRADC,power_adc 
      009D3A 1E 01                    1 	.word LINK 
                           001FF2     2 	LINK=.
      001FF2                          3 PWRADC:
      009D3C CD                       4 	.byte 6 	
      009D3D 8A 01 AE 9D 6F CD        5 	.ascii "PWRADC"
      009D43 82 30                    6 	.word power_adc 
      001FFB                       5434 	_dict_entry,5+FFUNC,RDADC,read_adc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      009D45 A6 FF                    1 	.word LINK 
                           001FFD     2 	LINK=.
      001FFD                          3 RDADC:
      009D47 C0                       4 	.byte 5+FFUNC 	
      009D48 00 19 C7 00 0B           5 	.ascii "RDADC"
      009D4D A6 7F                    6 	.word read_adc 
      002005                       5435 	_dict_entry,3+FFUNC,ASC,ascii  
      009D4F C2 00                    1 	.word LINK 
                           002007     2 	LINK=.
      002007                          3 ASC:
      009D51 18                       4 	.byte 3+FFUNC 	
      009D52 C7 00 0A                 5 	.ascii "ASC"
      009D55 A6 02                    6 	.word ascii 
      00200D                       5436 	_dict_entry,4+FFUNC,CHAR,char
      009D57 C2 00                    1 	.word LINK 
                           00200F     2 	LINK=.
      00200F                          3 CHAR:
      009D59 17                       4 	.byte 4+FFUNC 	
      009D5A C7 00 09 5F              5 	.ascii "CHAR"
      009D5E A6 06                    6 	.word char 
      002016                       5437 	_dict_entry,4+FFUNC,QKEY,qkey  
      009D60 97 A6                    1 	.word LINK 
                           002018     2 	LINK=.
      002018                          3 QKEY:
      009D62 0A                       4 	.byte 4+FFUNC 	
      009D63 CD 89 B9 AE              5 	.ascii "QKEY"
      009D67 9D 77                    6 	.word qkey 
      00201F                       5438 	_dict_entry,3+FFUNC,KEY,key 
      009D69 CD 82                    1 	.word LINK 
                           002021     2 	LINK=.
      002021                          3 KEY:
      009D6B 30                       4 	.byte 3+FFUNC 	
      009D6C 5B 02 81                 5 	.ascii "KEY"
      009D6F 20 66                    6 	.word key 
      002027                       5439 	_dict_entry,4+FFUNC,SIZE,size
      009D71 69 6C                    1 	.word LINK 
                           002029     2 	LINK=.
      002029                          3 SIZE:
      009D73 65                       4 	.byte 4+FFUNC 	
      009D74 73 0A 00 20              5 	.ascii "SIZE"
      009D78 62 79                    6 	.word size 
      002030                       5440 	_dict_entry,3,HEX,hex_base
      009D7A 74 65                    1 	.word LINK 
                           002032     2 	LINK=.
      002032                          3 HEX:
      009D7C 73                       4 	.byte 3 	
      009D7D 20 66 72                 5 	.ascii "HEX"
      009D80 65 65                    6 	.word hex_base 
      002038                       5441 	_dict_entry,3,DEC,dec_base
      009D82 0A 00                    1 	.word LINK 
                           00203A     2 	LINK=.
      009D84                          3 DEC:
      009D84 52                       4 	.byte 3 	
      009D85 02 72 5F                 5 	.ascii "DEC"
      009D88 00 14                    6 	.word dec_base 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



      002040                       5442 	_dict_entry,5+FFUNC,TICKS,get_ticks
      009D8A CD 93                    1 	.word LINK 
                           002042     2 	LINK=.
      002042                          3 TICKS:
      009D8C 49                       4 	.byte 5+FFUNC 	
      009D8D A1 02 27 03 CC           5 	.ascii "TICKS"
      009D92 87 89                    6 	.word get_ticks 
      00204A                       5443 	_dict_entry,3+FFUNC,ABS,abs
      009D94 1F 01                    1 	.word LINK 
                           00204C     2 	LINK=.
      00204C                          3 ABS:
      009D96 CD                       4 	.byte 3+FFUNC 	
      009D97 88 6F A1                 5 	.ascii "ABS"
      009D9A 0B 27                    6 	.word abs 
      002052                       5444 	_dict_entry,3+FFUNC,RND,random 
      009D9C 02 20                    1 	.word LINK 
                           002054     2 	LINK=.
      002054                          3 RND:
      009D9E 19                       4 	.byte 3+FFUNC 	
      009D9F CD 93 49                 5 	.ascii "RND"
      009DA2 A1 02                    6 	.word random 
      00205A                       5445 	_dict_entry,5,PAUSE,pause 
      009DA4 27 03                    1 	.word LINK 
                           00205C     2 	LINK=.
      00205C                          3 PAUSE:
      009DA6 CC                       4 	.byte 5 	
      009DA7 87 89 9F 1E 01           5 	.ascii "PAUSE"
      009DAC CF 00                    6 	.word pause 
      002064                       5446 	_dict_entry,4,BSET,bit_set 
      009DAE 15 5F                    1 	.word LINK 
                           002066     2 	LINK=.
      002066                          3 BSET:
      009DB0 CD                       4 	.byte 4 	
      009DB1 81 5C 1E 01              5 	.ascii "BSET"
      009DB5 5C 20                    6 	.word bit_set 
      00206D                       5447 	_dict_entry,4,BRES,bit_reset
      009DB7 DC 66                    1 	.word LINK 
                           00206F     2 	LINK=.
      009DB8                          3 BRES:
      009DB8 5B                       4 	.byte 4 	
      009DB9 02 81 45 53              5 	.ascii "BRES"
      009DBB 17 07                    6 	.word bit_reset 
      002076                       5448 	_dict_entry,5,BTOGL,bit_toggle
      009DBB A6 09                    1 	.word LINK 
                           002078     2 	LINK=.
      002078                          3 BTOGL:
      009DBD CD                       4 	.byte 5 	
      009DBE 92 42 CD 93 8D           5 	.ascii "BTOGL"
      009DC3 A1 02                    6 	.word bit_toggle 
      002080                       5449 	_dict_entry 4,WAIT,wait 
      009DC5 27 03                    1 	.word LINK 
                           002082     2 	LINK=.
      002082                          3 WAIT:
      009DC7 CC                       4 	.byte 4 	
      009DC8 87 89 89 A6              5 	.ascii "WAIT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009DCC 0A CD                    6 	.word wait 
      002089                       5450 	_dict_entry 6,REMARK,rem 
      009DCE 92 42                    1 	.word LINK 
                           00208B     2 	LINK=.
      00208B                          3 REMARK:
      009DD0 85                       4 	.byte 6 	
      009DD1 9F A4 7F 97 A6 05        5 	.ascii "REMARK"
      009DD7 81 C2                    6 	.word rem 
      009DD8                       5451 	_dict_entry 5,PRINT,print 
      009DD8 A6 09                    1 	.word LINK 
                           002096     2 	LINK=.
      002096                          3 PRINT:
      009DDA CD                       4 	.byte 5 	
      009DDB 92 42 CD 88 6F           5 	.ascii "PRINT"
      009DE0 A1 08                    6 	.word print 
      00209E                       5452 	_dict_entry,2,IF,if 
      009DE2 27 07                    1 	.word LINK 
                           0020A0     2 	LINK=.
      0020A0                          3 IF:
      009DE4 A1                       4 	.byte 2 	
      009DE5 05 27                    5 	.ascii "IF"
      009DE7 06 CC                    6 	.word if 
      0020A5                       5453 	_dict_entry,5,GOSUB,gosub 
      009DE9 87 89                    1 	.word LINK 
                           0020A7     2 	LINK=.
      009DEB                          3 GOSUB:
      009DEB F6                       4 	.byte 5 	
      009DEC 20 01 53 55 42           5 	.ascii "GOSUB"
      009DEE 18 76                    6 	.word gosub 
      0020AF                       5454 	_dict_entry,4,GOTO,goto 
      009DEE 9F 97                    1 	.word LINK 
                           0020B1     2 	LINK=.
      0020B1                          3 GOTO:
      009DF0 4F                       4 	.byte 4 	
      009DF1 95 89 A6 0A              5 	.ascii "GOTO"
      009DF5 CD 92                    6 	.word goto 
      0020B8                       5455 	_dict_entry,3,FOR,for 
      009DF7 42 85                    1 	.word LINK 
                           0020BA     2 	LINK=.
      0020BA                          3 FOR:
      009DF9 A6                       4 	.byte 3 	
      009DFA 02 81 52                 5 	.ascii "FOR"
      009DFC 17 74                    6 	.word for 
      0020C0                       5456 	_dict_entry,2,TO,to
      009DFC CD 82                    1 	.word LINK 
                           0020C2     2 	LINK=.
      0020C2                          3 TO:
      009DFE 27                       4 	.byte 2 	
      009DFF 5F 97                    5 	.ascii "TO"
      009E01 A6 02                    6 	.word to 
      0020C7                       5457 	_dict_entry,4,STEP,step 
      009E03 81 C2                    1 	.word LINK 
                           0020C9     2 	LINK=.
      009E04                          3 STEP:
      009E04 5F                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      009E05 72 0B 52 40              5 	.ascii "STEP"
      009E09 01 5C                    6 	.word step 
      0020D0                       5458 	_dict_entry,4,NEXT,next 
      009E0B A6 02                    1 	.word LINK 
                           0020D2     2 	LINK=.
      0020D2                          3 NEXT:
      009E0D 81                       4 	.byte 4 	
      009E0E 4E 45 58 54              5 	.ascii "NEXT"
      009E0E A6 09                    6 	.word next 
      0020D9                       5459 	_dict_entry,6+FFUNC,UBOUND,ubound 
      009E10 CD 92                    1 	.word LINK 
                           0020DB     2 	LINK=.
      0020DB                          3 UBOUND:
      009E12 42                       4 	.byte 6+FFUNC 	
      009E13 CD 92 4F A1 02 27        5 	.ascii "UBOUND"
      009E19 03 CC                    6 	.word ubound 
      0020E4                       5460 	_dict_entry,6,RETURN,return 
      009E1B 87 89                    1 	.word LINK 
                           0020E6     2 	LINK=.
      009E1D                          3 RETURN:
      009E1D A6                       4 	.byte 6 	
      009E1E 0A CD 92 42 AE 00        5 	.ascii "RETURN"
      009E24 02 72                    6 	.word return 
      0020EF                       5461 	_dict_entry,4+FFUNC,PEEK,peek 
      009E26 DE 00                    1 	.word LINK 
                           0020F1     2 	LINK=.
      0020F1                          3 PEEK:
      009E28 1A                       4 	.byte 4+FFUNC 	
      009E29 2B 1B A3 00              5 	.ascii "PEEK"
      009E2D 09 2A                    6 	.word peek 
      0020F8                       5462 	_dict_entry,4,POKE,poke 
      009E2F 16 A6                    1 	.word LINK 
                           0020FA     2 	LINK=.
      0020FA                          3 POKE:
      009E31 05                       4 	.byte 4 	
      009E32 42 1C 50 00              5 	.ascii "POKE"
      009E36 89 CD                    6 	.word poke 
      002101                       5463 	_dict_entry,5,INPUT,input_var  
      009E38 90 2C                    1 	.word LINK 
                           002103     2 	LINK=.
      002103                          3 INPUT:
      009E3A 72                       4 	.byte 5 	
      009E3B FB 01 1F 01 CD           5 	.ascii "INPUT"
      009E40 90 53                    6 	.word input_var 
      00210B                       5464 kword_dict:
      00210B                       5465 	_dict_entry 3,LET,let 
      009E42 85 A6                    1 	.word LINK 
                           00210D     2 	LINK=.
      00210D                          3 LET:
      009E44 02                       4 	.byte 3 	
      009E45 81 45 54                 5 	.ascii "LET"
      009E46 13 96                    6 	.word let 
                                   5466 	
                                   5467 
      002180                       5468 	.bndry 128 ; align on FLASH block.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



                                   5469 ; free space for user application  
      002180                       5470 user_space:
                                   5471 ; USR() function test
      009E46 A6               [ 2] 5472 	pushw x 
      009E47 0A CC 87 8B      [ 1] 5473 	bset PC_ODR,#5 
      009E4B 85               [ 2] 5474 	popw x 
      009E4B AE 00 00         [ 4] 5475 	call pause02 
      009E4E A6 02 81 0A      [ 1] 5476 	bres PC_ODR,#5 
      009E51 81               [ 4] 5477 	ret
                                   5478 
                                   5479 	.area FLASH_DRIVE (ABS)
      010000                       5480 	.org 0x10000
      010000                       5481 fdrive:
                                   5482 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        00204C R   |     ADC_CR1 =  005401 
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
    ARG_OFS =  000002     |   5 ASC        002007 R   |     ATTRIB  =  000002 
    AWU_APR =  0050F1     |     AWU_CSR1=  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BASE_SAV=  000001     |   5 BEEP       001F77 R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |     BINARY  =  000001 
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BLOCK_ER=  000000 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  000005     |   5 BREAK      001F6D R   |   5 BRES       00206F R
  5 BSET       002066 R   |     BSIZE   =  000001     |     BSP     =  000008 
  5 BTOGL      002078 R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        001F1A R   |     C       =  000001     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000000     |   5 CHAR       00200F R   |     CLKOPT  =  004807 
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
  5 CRH        001FE1 R   |   5 CRL        001FD9 R   |     CTRL_A  =  000001 
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
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        001FD1 R
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        00203A R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        001F41 R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
    DSTACK_S=  000040     |   5 EEPROM     001FAB R   |     EEPROM_B=  004000 
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
    FLASH_WS=  00480D     |     FLSI    =  01F400     |   5 FOR        0020BA R
  5 FORGET     001F36 R   |     FRUN    =  000000     |     FSIZE   =  000001 
    FSLEEP  =  000003     |     FTRAP   =  000001     |   5 GOSUB      0020A7 R
    GOS_RET =  000003     |   5 GOTO       0020B1 R   |   5 GPIO       001FE9 R
    GPIO_BAS=  005000     |     GPIO_CR1=  000003     |     GPIO_CR2=  000004 
    GPIO_DDR=  000002     |     GPIO_IDR=  000001     |     GPIO_ODR=  000000 
    GPIO_SIZ=  000005     |   5 HEX        002032 R   |     HSECNT  =  004809 
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
  5 IDR        001FC9 R   |   5 IF         0020A0 R   |     IN      =  000007 
    INCR    =  000001     |   5 INPUT      002103 R   |     INPUT_DI=  000000 
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
    IWDG_RLR=  0050E2     |   5 KEY        002021 R   |     LAST    =  000003 
    LB      =  000002     |     LED2_BIT=  000005     |     LED2_MAS=  000020 
    LED2_POR=  00500A     |     LEN     =  000005     |   5 LET        00210D R
    LINENO  =  000005     |   5 LINK    =  00210D R   |   5 LIST       001F9A R
    LL      =  000002     |     LLEN    =  000002     |     LL_HB   =  000001 
    LNO     =  000005     |     LN_PTR  =  000005     |   5 LOAD       001F49 R
    MAJOR   =  000001     |     MASK    =  000002     |     MATH_OVF=  000000 
    MINOR   =  000000     |     MULOP   =  000005     |     N1      =  000001 
    N1_HB   =  000006     |     N1_LB   =  000007     |     N2      =  000003 
    N2_HB   =  000008     |     N2_LB   =  000009     |     NAFR    =  004804 
    NAMEPTR =  000003     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        001F65 R   |   5 NEXT       0020D2 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NL      =  00000A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R
  5 ODR        001FC1 R   |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |     PAD_SIZE=  000028     |   5 PAUSE      00205C R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       0020F1 R   |     PE_BASE =  005014 
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
  5 POKE       0020FA R   |     PREV    =  000001     |   5 PRINT      002096 R
    PROD    =  000002     |     PSIZE   =  000001     |   5 PWRADC     001FF2 R
  5 QKEY       002018 R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 RDADC      001FFD R   |   5 REG_A      00092B R
  5 REG_CC     00092F R   |   5 REG_EPC    00091E R   |   5 REG_SP     000934 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

  5 REG_X      000927 R   |   5 REG_Y      000923 R   |     RELOP   =  000005 
  5 REMARK     00208B R   |     RETL1   =  000001     |   5 RETURN     0020E6 R
  5 RND        002054 R   |     ROP     =  004800     |     RST_SR  =  0050B3 
  5 RUN        001F92 R   |     RXCHAR  =  000001     |     R_A     =  000007 
    R_CC    =  000008     |     R_X     =  000005     |     R_Y     =  000003 
  5 SAVE       001F52 R   |     SDIVD   =  000002     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       001F89 R
    SIGN    =  000001     |   5 SIZE       002029 R   |     SKIP    =  000006 
  5 SLEEP      001F2C R   |     SPACE   =  000020     |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SQUOT   =  000001     |     SRC     =  000003 
    STACK_EM=  0017FF     |     STACK_SI=  000080     |   5 STATES     0008E1 R
  5 STEP       0020C9 R   |   5 STOP       001F80 R   |     SWIM_CSR=  007F80 
    TAB     =  000009     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      002042 R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
    TIM_CR1_=  000002     |     TK_ARRAY=  000004     |     TK_CHAR =  000005 
    TK_CMD  =  000006     |     TK_COLON=  000001     |     TK_COMMA=  00000B 
    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_FUNC =  000007 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_INTGR=  000002     |     TK_LE   =  000036 
    TK_LPARE=  000009     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_PLUS =  000010     |     TK_QSTR =  000008 
    TK_RPARE=  00000A     |     TK_SHARP=  00000C     |     TK_VAR  =  000003 
  5 TO         0020C2 R   |   5 Timer4Up   000019 R   |   5 TrapHand   00000A R
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
  5 UBOUND     0020DB R   |   5 UFLASH     001FB6 R   |   5 USER_ABO   00007E R
  5 USR        001FA3 R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |   5 UserButt   000025 R   |     VSIZ    =  000002 
    VSIZE   =  000002     |     VT      =  00000B     |   5 WAIT       002082 R
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH   =  000001 
    WIDTH_SA=  000002     |     WLEN    =  000001     |   5 WORDS      001F22 R
  5 WRITE      001F5B R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XADR    =  000001     |     XMASK   =  000001     |     XSAVE   =  000003 
    YSAVE   =  000003     |   5 abs        001E4A R   |   1 acc16      000009 R
  1 acc24      000008 R   |   1 acc8       00000A R   |   5 accept_c   000AD9 R
  5 add        00108D R   |   5 ansi_seq   000A97 R   |   5 arg_list   0011CF R
  1 array_ad   000020 R   |   1 array_si   000022 R   |   5 ascii      001D58 R
  5 at_tst     000DC6 R   |   5 atoi24     000ED9 R   |   5 atoi_exi   000F47 R
  5 bad_port   001DC6 R   |   1 base       000007 R   |   1 basicptr   000003 R
  5 beep       001939 R   |   5 bin_exit   000CCC R   |   5 bit_rese   001707 R
  5 bit_set    0016F3 R   |   5 bit_togg   00171C R   |   5 bkslsh_t   000D71 R
  5 bksp       0001BA R   |   5 break      0019CF R   |   5 break_po   001A00 R
  5 bye        001E1D R   |   5 char       001D3B R   |   5 check_fu   0003F2 R
  5 clear_ba   0005D7 R   |   5 clear_va   0004E7 R   |   5 clock_in   000099 R
  5 cmd_itf    000AFD R   |   5 cmd_name   001138 R   |   5 cmp_name   001A9F R
  5 cold_sta   00054C R   |   5 colon_ts   000D9A R   |   5 comma_ts   000DA5 R
  5 compile    000401 R   |   5 convert_   000C32 R   |   1 count      000002 R
  5 cp_loop    00117B R   |   5 create_g   000343 R   |   5 cstk_pro   001057 R
  5 dash_tst   000DBB R   |   5 ddrop      000FD3 R   |   5 ddrop_n    001010 R
  5 ddup       000FDC R   |   5 dec_base   001379 R   |   5 del_back   000ACA R
  5 del_line   00030B R   |   5 del_ln     000ABB R   |   5 delete     0001CA R
  5 dir_loop   001C7B R   |   5 director   001C6F R   |   5 divide     0010E3 R
  5 divu24_8   000A24 R   |   5 dotr       001060 R   |   5 dotr_loo   001075 R
  5 dots       00102D R   |   5 dpick      000FED R   |   5 dpop       000FAC R
  5 dpush      000F9F R   |   5 drive_fr   001CF7 R   |   3 dstack     001740 R
  3 dstack_u   001780 R   |   5 dstk_pro   001023 R   |   1 dstkptr    000019 R
  5 dswap      000FB9 R   |   5 eeprom     001DEF R   |   5 eql_tst    000E26 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

  5 equal      0015A7 R   |   5 err_bad_   0006B8 R   |   5 err_cmd_   000679 R
  5 err_div0   00063B R   |   5 err_dupl   000694 R   |   5 err_math   000621 R
  5 err_mem_   000604 R   |   5 err_msg    0005EC R   |   5 err_no_a   0006C5 R
  5 err_no_l   00064B R   |   5 err_not_   0006A6 R   |   5 err_run_   000662 R
  5 err_synt   000612 R   |   5 expect     0011C2 R   |   5 expr_exi   00130A R
  5 expressi   0012C9 R   |   5 factor     001226 R   |   1 farptr     000013 R
  7 fdrive     010000 R   |   5 fetch      000FFC R   |   5 fetchc     000BEA R
  1 ffree      000016 R   |   5 file_cou   001CEF R   |   5 final_te   000A91 R
  5 first_li   0013E9 R   |   1 flags      000024 R   |   5 for        001774 R
  5 forget     001C20 R   |   1 free_ram   00005A R   |   5 ge         0015A9 R
  5 get_arra   0011F3 R   |   5 get_tick   001E44 R   |   5 get_toke   000D0E R
  5 getc       0001A7 R   |   5 go_commo   001899 R   |   5 gosub      001876 R
  5 goto       001869 R   |   5 gpio       001D8E R   |   5 gt         0015A5 R
  5 gt_tst     000E31 R   |   5 hex_base   001374 R   |   5 hse_cloc   000187 R
  5 hsi_cloc   000191 R   |   5 if         001760 R   |   1 in         000001 R
  1 in.w       000000 R   |   1 in.w.sav   000011 R   |   5 incr_far   001A29 R
  5 input_ex   0016BF R   |   5 input_lo   00165A R   |   5 input_va   00164E R
  5 insert_l   000374 R   |   5 insert_l   0003EF R   |   5 interp     00077B R
  5 interp_l   0007BF R   |   5 invalid    000B42 R   |   5 invalid_   000BC0 R
  5 is_alpha   0004F5 R   |   5 is_digit   000EC4 R   |   5 itoa       0009DD R
  5 itoa_loo   0009F5 R   |   5 key        001D7C R   |   5 kword_di   00210B R
  5 kword_en   001F18 R   |   5 last_lin   0013F2 R   |   5 le         0015AE R
  5 ledoff     000831 R   |   5 ledon      00082C R   |   5 ledtoggl   000836 R
  5 left_arr   000A97 R   |   5 left_par   00083F R   |   5 let        001396 R
  5 let02      0013A0 R   |   1 lineno     000005 R   |   5 lines_sk   0013F7 R
  5 list       0013BE R   |   5 list_exi   00143E R   |   5 list_sta   00141A R
  5 load       001BB8 R   |   5 loop_bac   00183E R   |   1 loop_dep   00001F R
  5 loop_don   001857 R   |   5 lt         0015AC R   |   5 lt_tst     000E6A R
  5 mem_peek   000B5F R   |   5 modulo     001127 R   |   5 move       00029E R
  5 move_dow   0002BC R   |   5 move_exi   0002DD R   |   5 move_loo   0002C1 R
  5 move_up    0002AE R   |   5 mul_char   001596 R   |   5 multiply   00109B R
  5 mulu24_8   000F4B R   |   5 nbr_tst    000D47 R   |   5 ne         0015B1 R
  5 neg_acc2   000A4C R   |   5 new        001A1E R   |   5 next       0017F6 R
  5 next_tok   0007EF R   |   5 no_match   00118D R   |   5 none       000D0E R
  5 number     000BF0 GR  |   5 other      000EA2 R   |   3 pad        001718 R
  5 parse_bi   000CAC R   |   5 parse_in   000C71 R   |   5 parse_ke   000CD4 R
  5 parse_qu   000BF7 R   |   5 pause      001E31 R   |   5 pause02    001E3B R
  5 peek       001743 R   |   5 peek_byt   000B8A R   |   5 plus_tst   000DFA R
  5 poke       001730 R   |   5 port_cr1   001DDD R   |   5 port_cr2   001DE3 R
  5 port_ddr   001DD7 R   |   5 port_idr   001DD1 R   |   5 port_odr   001DCB R
  5 power_ad   001961 R   |   5 prcnt_ts   000E1B R   |   5 print      0015B4 R
  5 print_ex   001618 R   |   5 print_fa   000BCF R   |   5 print_in   000981 R
  5 print_re   00088E R   |   5 print_st   000B52 R   |   5 prt_basi   001455 R
  5 prt_cmd_   001441 R   |   5 prt_loop   0015B8 R   |   5 prt_peek   00024E R
  5 prt_reg1   00086F R   |   5 prt_reg8   00084A R   |   5 prt_regs   0001E4 R
  5 prti24     000939 R   |   1 ptr16      000014 R   |   1 ptr8       000015 R
  5 putc       00019E R   |   5 puts       0001B0 R   |   5 qkey       001D84 R
  5 qmark_ts   000DD1 R   |   5 random     001E6A R   |   5 read_adc   00199C R
  5 readln     000A6F R   |   5 readln_l   000A75 R   |   5 readln_q   000AEE R
  5 regs_sta   000227 R   |   5 rel_exit   001361 R   |   5 relation   00130D R
  5 relop_st   001599 R   |   5 rem        0016C2 R   |   5 repl       000B0B R
  5 repl_exi   000B33 R   |   5 reprint    000A97 R   |   5 reset_co   0015B6 R
  5 rest_con   001639 R   |   5 return     0018BF R   |   5 right_ar   000A97 R
  5 rparnt_t   000D8F R   |   5 rt_msg     0006F9 R   |   5 run        0018E3 R
  5 save       001B0A R   |   5 save_con   001624 R   |   5 search_d   00116A R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

  5 search_e   0011BE R   |   5 search_f   001AC0 R   |   5 search_l   0002E0 R
  5 search_l   0002EB R   |   5 search_n   00116E R   |   1 seedx      00000D R
  1 seedy      00000F R   |   5 seek_fdr   001A37 R   |   5 sharp_ts   000DB0 R
  5 show       001364 R   |   5 single_c   001592 R   |   5 size       00137E R
  5 skip       000F85 R   |   5 slash_ts   000E10 R   |   5 sleep      001E26 R
  5 software   000506 R   |   5 spaces     0001D8 R   |   3 stack_fu   001780 R
  3 stack_un   001800 R   |   5 star_tst   000E05 R   |   5 step       0017CE R
  5 stop       00192A R   |   5 store      001006 R   |   5 store_lo   0017E0 R
  5 str_matc   00119C R   |   5 str_tst    000D36 R   |   5 strcmp     00027F R
  5 strcpy     000290 R   |   5 strlen     000272 R   |   5 substrac   001095 R
  5 syntax_e   000709 R   |   1 tab_widt   000025 R   |   5 tb_error   00070B R
  5 term       00127C R   |   5 term01     001285 R   |   5 term_exi   0012C6 R
  5 test_p     000B4A R   |   3 tib        0016C8 R   |   5 tick_tst   000DE8 R
  1 ticks      00000B R   |   5 timer4_i   0000AF R   |   5 to         00179E R
  5 to_upper   000ECD GR  |   5 token_ch   000EB1 R   |   5 token_ex   000EC1 R
  1 txtbgn     00001B R   |   1 txtend     00001D R   |   5 uart3_in   000174 R
  5 uart3_se   000180 R   |   5 uart_ena   000199 R   |   5 ubound     001388 R
  5 uflash     001DE9 R   |   5 unget_to   000F98 R   |   5 unlock_e   0000C0 R
  5 unlock_f   0000CE R   |   5 user_spa   002180 R   |   5 usr        001DF5 R
  1 vars       000026 R   |   5 wait       0016C8 R   |   5 warm_sta   00075B R
  5 words      001EDE R   |   5 write      001D04 R   |   5 write_bl   000151 R
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

