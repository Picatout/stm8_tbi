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
                                     52 
      000002                         53 in.w:  .blkb 1 ; parser position in text line
      000003                         54 in:    .blkb 1 ; low byte of in.w
      000004                         55 count: .blkb 1 ; length of string in text line  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      000006                         56 basicptr:  .blkb 2  ; point to text buffer 
      000008                         57 lineno: .blkb 2  ; BASIC line number 
      000009                         58 base:  .blkb 1 ; nemeric base used to print integer 
      00000A                         59 acc24: .blkb 1 ; 24 accumulator
      00000B                         60 acc16: .blkb 1
      00000C                         61 acc8:  .blkb 1
      00000E                         62 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000010                         63 seedx: .blkw 1  ; xorshift 16 seed x 
      000012                         64 seedy: .blkw 1  ; xorshift 16 seed y 
      000014                         65 in.w.saved: .blkw 1 ; set by get_token before parsing next token, used by unget_token
      000015                         66 farptr: .blkb 1 ; far pointer used by file system
      000016                         67 ptr16:  .blkb 1 ; middle byte of farptr
      000017                         68 ptr8:   .blkb 1 ; least byte of farptr 
      00001A                         69 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001C                         70 dstkptr: .blkw 1  ; data stack pointer 
      00001E                         71 txtbgn: .ds 2 ; BASIC text beginning address 
      000020                         72 txtend: .ds 2 ; BASIC text end address 
      000021                         73 loop_depth: .ds 1 ; FOR loop depth, level of nested loop.  
      000023                         74 array_addr: .ds 2 ; address of @ array 
      000025                         75 array_size: .ds 2 ; array size 
      000026                         76 flags: .ds 1 ; boolean flags
      000027                         77 tab_width: .ds 1 ; print colon width (4)
      00005B                         78 vars: .ds 2*26 ; BASIC variables A-Z, keep it as but last .
                                     79 ; keep as last variable 
      0016C8                         80 free_ram: ; from here RAM free for BASIC text 
                                     81 
                                     82 ;-----------------------------------
                                     83     .area SSEG (ABS)
                                     84 ;-----------------------------------	
      0016C8                         85     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE-DSTACK_SIZE 
      001718                         86 tib: .ds TIB_SIZE             ; transaction input buffer
      001740                         87 pad: .ds PAD_SIZE             ; working buffer
      001780                         88 dstack: .ds DSTACK_SIZE 	  ; data stack used by FOR...NEXT 
      001780                         89 dstack_unf: ; dstack underflow ; data stack bottom 
      001800                         90 stack_full: .ds STACK_SIZE   ; control stack 
      001800                         91 stack_unf: ; stack underflow ; control_stack bottom 
                                     92 
                                     93 
                                     94 ;--------------------------------------
                                     95     .area HOME 
                                     96 ;--------------------------------------
      008000 82 00 85 C1             97     int cold_start
                           000001    98 .if DEBUG
      008004 82 00 80 8A             99 	int TrapHandler 		;TRAP  software interrupt
                           000000   100 .else
                                    101 	int NonHandledInterrupt ;TRAP  software interrupt
                                    102 .endif
      008008 82 00 80 89            103 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 89            104 	int NonHandledInterrupt ;int1 AWU   auto wake up from halt
      008010 82 00 80 89            105 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 89            106 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 89            107 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 89            108 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 89            109 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 A5            110 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008028 82 00 80 89            111 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 89            112 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 89            113 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 89            114 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 89            115 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 89            116 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 89            117 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 89            118 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 89            119 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 89            120 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 89            121 	int NonHandledInterrupt ;int18 UART1 RX full
      008054 82 00 80 89            122 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 89            123 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 89            124 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 89            125 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 99            126 	int Timer4UpdateHandler	;int23 TIM4 update/overflow used as msec ticks counter
      008068 82 00 80 89            127 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 89            128 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 89            129 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 89            130 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 89            131 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 89            132 	int NonHandledInterrupt ;int29  not used
                                    133 
                                    134 ;---------------------------------------
                                    135     .area CODE
                                    136 ;---------------------------------------
                           000001   137 .if DEBUG
      008080 53 54 4D 38 5F 54 42   138 .asciz "STM8_TBI" ; I like to put module name here.
             49 00
                                    139 .endif 
                                    140 
      008089                        141 NonHandledInterrupt:
      008089 71                     142     .byte 0x71  ; reinitialize MCU
                                    143 
                                    144 
                                    145 ;------------------------------------
                                    146 ; software interrupt handler  
                                    147 ;------------------------------------
                           000001   148 .if DEBUG 
      00808A                        149 TrapHandler:
      00808A 72 12 00 25      [ 1]  150 	bset flags,#FTRAP 
      00808E CD 88 D1         [ 4]  151 	call print_registers
      008091 CD 8B 40         [ 4]  152 	call cmd_itf
      008094 72 13 00 25      [ 1]  153 	bres flags,#FTRAP 	
      008098 80               [11]  154 	iret
                                    155 .endif 
                                    156 
      008099                        157 Timer4UpdateHandler:
      008099 72 5F 53 42      [ 1]  158 	clr TIM4_SR 
      00809D CE 00 0C         [ 2]  159 	ldw x,ticks
      0080A0 5C               [ 1]  160 	incw x
      0080A1 CF 00 0C         [ 2]  161 	ldw ticks,x 
      0080A4 80               [11]  162 	iret 
                                    163 
                                    164 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    165 ;------------------------------------
                                    166 ; Triggered by pressing USER UserButton 
                                    167 ; on NUCLEO card.
                                    168 ;------------------------------------
      0080A5                        169 UserButtonHandler:
                                    170 ; wait button release
      0080A5 5F               [ 1]  171 	clrw x
      0080A6 5A               [ 2]  172 1$: decw x 
      0080A7 26 FD            [ 1]  173 	jrne 1$
      0080A9 72 09 50 15 F8   [ 2]  174 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    175 ; if MCU suspended by SLEEP resume program
      0080AE 72 07 00 25 05   [ 2]  176     btjf flags,#FSLEEP,2$
      0080B3 72 17 00 25      [ 1]  177 	bres flags,#FSLEEP 
      0080B7 80               [11]  178 	iret
      0080B8 72 00 00 25 03   [ 2]  179 2$:	btjt flags,#FRUN,4$
      0080BD CC 80 F6         [ 2]  180 	jp 9$ 
      0080C0                        181 4$:	; program interrupted by user 
      0080C0 72 11 00 25      [ 1]  182 	bres flags,#FRUN 
      0080C4 AE 80 FE         [ 2]  183 	ldw x,#USER_ABORT
      0080C7 CD 82 30         [ 4]  184 	call puts 
      0080CA CE 00 04         [ 2]  185 	ldw x,basicptr
      0080CD FE               [ 2]  186 	ldw x,(x)
                                    187 ; print line number 
      0080CE 35 0A 00 08      [ 1]  188 	mov base,#10 
      0080D2 35 06 00 26      [ 1]  189 	mov tab_width,#6
      0080D6 CD 89 C4         [ 4]  190 	call print_int  	
      0080D9 CE 00 04         [ 2]  191 	ldw x,basicptr 
      0080DC 1C 00 03         [ 2]  192 	addw x,#3  
      0080DF CD 82 30         [ 4]  193 	call puts 
      0080E2 A6 0D            [ 1]  194 	ld a,#CR 
      0080E4 CD 82 1E         [ 4]  195 	call putc
      0080E7 5F               [ 1]  196 	clrw x  
      0080E8 C6 00 02         [ 1]  197 	ld a,in 
      0080EB AB 03            [ 1]  198 	add a,#3 ; adjustment for line number display 
      0080ED 97               [ 1]  199 	ld xl,a 
      0080EE CD 82 58         [ 4]  200 	call spaces 
      0080F1 A6 5E            [ 1]  201 	ld a,#'^
      0080F3 CD 82 1E         [ 4]  202 	call putc 
      0080F6                        203 9$:
      0080F6 AE 17 FF         [ 2]  204     ldw x,#STACK_EMPTY 
      0080F9 94               [ 1]  205     ldw sp,x
      0080FA 9A               [ 1]  206 	rim 
      0080FB CC 87 CA         [ 2]  207 	jp warm_start
                                    208 
      0080FE 0A 50 72 6F 67 72 61   209 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    210 
                                    211 
                                    212 ;----------------------------------------
                                    213 ; inialize MCU clock 
                                    214 ; input:
                                    215 ;   A 		source  HSI | 1 HSE 
                                    216 ;   XL      CLK_CKDIVR , clock divisor 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    217 ; output:
                                    218 ;   none 
                                    219 ;----------------------------------------
      008119                        220 clock_init:	
      008119 C1 50 C3         [ 1]  221 	cp a,CLK_CMSR 
      00811C 27 0C            [ 1]  222 	jreq 2$ ; no switching required 
                                    223 ; select clock source 
      00811E 72 12 50 C5      [ 1]  224 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008122 C7 50 C4         [ 1]  225 	ld CLK_SWR,a
      008125 C1 50 C3         [ 1]  226 1$:	cp a,CLK_CMSR
      008128 26 FB            [ 1]  227 	jrne 1$
      00812A                        228 2$: 	
                                    229 ; HSI and cpu clock divisor 
      00812A 9F               [ 1]  230 	ld a,xl 
      00812B C7 50 C6         [ 1]  231 	ld CLK_CKDIVR,a  
      00812E 81               [ 4]  232 	ret
                                    233 
                                    234 ;---------------------------------
                                    235 ; TIM4 is configured to generate an 
                                    236 ; interrupt every millisecond 
                                    237 ;----------------------------------
      00812F                        238 timer4_init:
      00812F 35 07 53 45      [ 1]  239 	mov TIM4_PSCR,#7 ; prescale 128  
      008133 35 7D 53 46      [ 1]  240 	mov TIM4_ARR,#125 ; set for 1msec.
      008137 35 05 53 40      [ 1]  241 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00813B 72 10 53 41      [ 1]  242 	bset TIM4_IER,#TIM4_IER_UIE 
      00813F 81               [ 4]  243 	ret
                                    244 
                                    245 ;----------------------------------
                                    246 ; unlock EEPROM for writing/erasing
                                    247 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    248 ; input:
                                    249 ;  none
                                    250 ; output:
                                    251 ;  none 
                                    252 ;----------------------------------
      008140                        253 unlock_eeprom:
      008140 35 AE 50 64      [ 1]  254 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008144 35 56 50 64      [ 1]  255     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008148 72 07 50 5F FB   [ 2]  256 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00814D 81               [ 4]  257 	ret
                                    258 
                                    259 ;----------------------------------
                                    260 ; unlock FLASH for writing/erasing
                                    261 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    262 ; input:
                                    263 ;  none
                                    264 ; output:
                                    265 ;  none
                                    266 ;----------------------------------
      00814E                        267 unlock_flash:
      00814E 35 56 50 62      [ 1]  268 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008152 35 AE 50 62      [ 1]  269 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008156 72 03 50 5F FB   [ 2]  270 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00815B 81               [ 4]  271 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    272 
                           000000   273 	BLOCK_ERASE=0
                                    274 ;----------------------------
                                    275 ; erase block code must be 
                                    276 ;executed from RAM
                                    277 ;-----------------------------
                           000000   278 .if BLOCK_ERASE 
                                    279 ; this code is copied to RAM 
                                    280 erase_start:
                                    281 	clr a 
                                    282     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    283     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    284 	ldf [farptr],a
                                    285     inc farptr+2 
                                    286     ldf [farptr],a
                                    287     inc farptr+2 
                                    288     ldf [farptr],a
                                    289     inc farptr+2 
                                    290     ldf [farptr],a
                                    291 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    292 	ret
                                    293 erase_end:
                                    294 
                                    295 ; copy erase_start in RAM 
                                    296 move_code_in_ram:
                                    297 	ldw x,#erase_end 
                                    298 	subw x,#erase_start
                                    299 	ldw acc16,x 
                                    300 	ldw x,#pad 
                                    301 	ldw y,#erase_start 
                                    302 	call move 
                                    303 	ret 
                                    304 
                                    305 ;-----------------------------------
                                    306 ; erase flash or EEPROM block 
                                    307 ; a block is 128 bytes 
                                    308 ; input:
                                    309 ;   farptr  address block begin
                                    310 ; output:
                                    311 ;   none
                                    312 ;--------------------------------------
                                    313 erase_block:
                                    314 	ldw x,farptr+1 
                                    315 	pushw x 
                                    316 	call move_code_in_ram 
                                    317 	popw x 
                                    318 	ldw farptr+1,x 
                                    319 	tnz farptr
                                    320 	jrne erase_flash 
                                    321 	ldw x,#FLASH_BASE 
                                    322 	cpw x,farptr+1 
                                    323 	jrpl erase_flash 
                                    324 ; erase eeprom block
                                    325 	call unlock_eeprom 
                                    326 	sim 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    327 	call pad   
                                    328 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    329 	rim 
                                    330 	ret 
                                    331 ; erase flash block:
                                    332 erase_flash:
                                    333 	call unlock_flash 
                                    334 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    335 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    336 	clr a 
                                    337 	sim 
                                    338 	call pad 
                                    339     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    340 	rim 
                                    341 	ret 
                                    342 .endif ; BLOCK_ERASE 
                                    343 
                                    344 
                                    345 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    346 ; write a byte to FLASH or EEPROM 
                                    347 ; input:
                                    348 ;    a  		byte to write
                                    349 ;    farptr  	address
                                    350 ;    x          farptr[x]
                                    351 ; output:
                                    352 ;    none
                                    353 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    354 	; variables locales
                           000001   355 	BTW = 1   ; byte to write offset on stack
                           000002   356 	OPT = 2   ; OPTION flag offset on stack
                           000002   357 	VSIZE = 2
      00815C                        358 write_byte:
      00815C 90 89            [ 2]  359 	pushw y
      0000DE                        360 	_vars VSIZE
      00815E 52 02            [ 2]    1     sub sp,#VSIZE 
      008160 6B 01            [ 1]  361 	ld (BTW,sp),a ; byte to write 
      008162 0F 02            [ 1]  362 	clr (OPT,sp)  ; OPTION flag
                                    363 ; put addr[15:0] in Y, for bounds check.
      008164 90 CE 00 15      [ 2]  364 	ldw y,farptr+1   ; Y=addr15:0
                                    365 ; check addr[23:16], if <> 0 then it is extened flash memory
      008168 72 5D 00 14      [ 1]  366 	tnz farptr 
      00816C 26 14            [ 1]  367 	jrne write_flash
      00816E 90 A3 A0 00      [ 2]  368     cpw y,#user_space
      008172 24 0E            [ 1]  369     jruge write_flash
      008174 90 A3 40 00      [ 2]  370 	cpw y,#EEPROM_BASE  
      008178 25 52            [ 1]  371     jrult write_exit
      00817A 90 A3 48 00      [ 2]  372 	cpw y,#OPTION_BASE
      00817E 25 18            [ 1]  373 	jrult write_eeprom
      008180 20 4A            [ 2]  374     jra write_exit
                                    375 ; write program memory
      008182                        376 write_flash:
      008182 CD 81 4E         [ 4]  377 	call unlock_flash 
      008185 9B               [ 1]  378 1$:	sim 
      008186 7B 01            [ 1]  379 	ld a,(BTW,sp)
      008188 92 A7 00 14      [ 4]  380 	ldf ([farptr],x),a ; farptr[x]=A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      00818C 72 05 50 5F FB   [ 2]  381 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008191 9A               [ 1]  382     rim 
      008192 72 13 50 5F      [ 1]  383     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008196 20 34            [ 2]  384     jra write_exit
                                    385 ; write eeprom and option
      008198                        386 write_eeprom:
      008198 CD 81 40         [ 4]  387 	call unlock_eeprom
                                    388 	; check for data eeprom or option eeprom
      00819B 90 A3 48 00      [ 2]  389 	cpw y,#OPTION_BASE
      00819F 2B 08            [ 1]  390 	jrmi 1$
      0081A1 90 A3 48 80      [ 2]  391 	cpw y,#OPTION_END+1
      0081A5 2A 02            [ 1]  392 	jrpl 1$
      0081A7 03 02            [ 1]  393 	cpl (OPT,sp)
      0081A9                        394 1$: 
      0081A9 0D 02            [ 1]  395     tnz (OPT,sp)
      0081AB 27 08            [ 1]  396     jreq 2$
                                    397 	; pour modifier une option il faut modifier ces 2 bits
      0081AD 72 1E 50 5B      [ 1]  398     bset FLASH_CR2,#FLASH_CR2_OPT
      0081B1 72 1F 50 5C      [ 1]  399     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081B5                        400 2$: 
      0081B5 7B 01            [ 1]  401     ld a,(BTW,sp)
      0081B7 92 A7 00 14      [ 4]  402     ldf ([farptr],x),a
      0081BB 0D 02            [ 1]  403     tnz (OPT,sp)
      0081BD 27 08            [ 1]  404     jreq 3$
      0081BF 5C               [ 1]  405     incw x
      0081C0 7B 01            [ 1]  406     ld a,(BTW,sp)
      0081C2 43               [ 1]  407     cpl a
      0081C3 92 A7 00 14      [ 4]  408     ldf ([farptr],x),a
      0081C7 72 05 50 5F FB   [ 2]  409 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081CC                        410 write_exit:
      00014C                        411 	_drop VSIZE 
      0081CC 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081CE 90 85            [ 2]  412 	popw y
      0081D0 81               [ 4]  413     ret
                                    414 
                                    415 ;--------------------------------------------
                                    416 ; write a data block to eeprom or flash 
                                    417 ; input:
                                    418 ;   Y        source address   
                                    419 ;   X        array index  destination  farptr[x]
                                    420 ;   BSIZE    block size bytes 
                                    421 ;   farptr   write address , byte* 
                                    422 ; output:
                                    423 ;	X 		after last byte written 
                                    424 ;   Y 		after last byte read 
                                    425 ;  farptr   point after block
                                    426 ;---------------------------------------------
      0081D1                        427 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000151                        428 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    429 	; local var 
                           000001   430 	XSAVE=1 
                           000002   431 	VSIZE=2 
      000151                        432 write_block:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      000151                        433 	_vars VSIZE
      0081D1 52 02            [ 2]    1     sub sp,#VSIZE 
      0081D3 1F 01            [ 2]  434 	ldw (XSAVE,sp),x 
      0081D5 1E 05            [ 2]  435 	ldw x,(BSIZE,sp) 
      0081D7 27 13            [ 1]  436 	jreq 9$
      0081D9 1E 01            [ 2]  437 1$:	ldw x,(XSAVE,sp)
      0081DB 90 F6            [ 1]  438 	ld a,(y)
      0081DD CD 81 5C         [ 4]  439 	call write_byte 
      0081E0 5C               [ 1]  440 	incw x 
      0081E1 90 5C            [ 1]  441 	incw y 
      0081E3 1F 01            [ 2]  442 	ldw (XSAVE,sp),x
      0081E5 1E 05            [ 2]  443 	ldw x,(BSIZE,sp)
      0081E7 5A               [ 2]  444 	decw x
      0081E8 1F 05            [ 2]  445 	ldw (BSIZE,sp),x 
      0081EA 26 ED            [ 1]  446 	jrne 1$
      0081EC                        447 9$:
      0081EC 1E 01            [ 2]  448 	ldw x,(XSAVE,sp)
      0081EE CD 98 F0         [ 4]  449 	call incr_farptr
      000171                        450 	_drop VSIZE
      0081F1 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081F3 81               [ 4]  451 	ret 
                                    452 
                                    453 
                                    454 ;---------------------------------------------
                                    455 ;   UART3 subroutines
                                    456 ;---------------------------------------------
                                    457 
                                    458 ;---------------------------------------------
                                    459 ; initialize UART3, 115200 8N1
                                    460 ; input:
                                    461 ;	none
                                    462 ; output:
                                    463 ;   none
                                    464 ;---------------------------------------------
      0081F4                        465 uart3_init:
                                    466 	; configure tx pin
      0081F4 72 1A 50 11      [ 1]  467 	bset PD_DDR,#BIT5 ; tx pin
      0081F8 72 1A 50 12      [ 1]  468 	bset PD_CR1,#BIT5 ; push-pull output
      0081FC 72 1A 50 13      [ 1]  469 	bset PD_CR2,#BIT5 ; fast output
      008200                        470 uart3_set_baud: 
                                    471 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    472 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008200 A6 E1            [ 1]  473 	ld a,#CLK_SWR_HSI
      008202 C1 50 C3         [ 1]  474 	cp a,CLK_CMSR 
      008205 27 0A            [ 1]  475 	jreq hsi_clock 
      008207                        476 hse_clock: ; 8 Mhz 	
      008207 35 05 52 43      [ 1]  477 	mov UART3_BRR2,#0x05 ; must be loaded first
      00820B 35 04 52 42      [ 1]  478 	mov UART3_BRR1,#0x4
      00820F 20 08            [ 2]  479 	jra uart_enable
      008211                        480 hsi_clock: ; 16 Mhz 	
      008211 35 0B 52 43      [ 1]  481 	mov UART3_BRR2,#0x0b ; must be loaded first
      008215 35 08 52 42      [ 1]  482 	mov UART3_BRR1,#0x08
      008219                        483 uart_enable:	
      008219 35 0C 52 45      [ 1]  484 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
      00821D 81               [ 4]  485 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    486 	
                                    487 ;---------------------------------
                                    488 ; send character to UART3 
                                    489 ; input:
                                    490 ;   A 
                                    491 ; output:
                                    492 ;   none 
                                    493 ;--------------------------------	
      00821E                        494 putc:
      00821E 72 0F 52 40 FB   [ 2]  495 	btjf UART3_SR,#UART_SR_TXE,.
      008223 C7 52 41         [ 1]  496 	ld UART3_DR,a 
      008226 81               [ 4]  497 	ret 
                                    498 
                                    499 ;---------------------------------
                                    500 ; wait character from UART3 
                                    501 ; input:
                                    502 ;   none
                                    503 ; output:
                                    504 ;   A 			char  
                                    505 ;--------------------------------	
      008227                        506 getc:
      008227 72 0B 52 40 FB   [ 2]  507 	btjf UART3_SR,#UART_SR_RXNE,.
      00822C C6 52 41         [ 1]  508 	ld a,UART3_DR 
      00822F 81               [ 4]  509 	ret 
                                    510 
                                    511 ;-----------------------------
                                    512 ; send an ASCIZ string to UART3 
                                    513 ; input: 
                                    514 ;   x 		char * 
                                    515 ; output:
                                    516 ;   none 
                                    517 ;-------------------------------
      008230                        518 puts:
      008230 F6               [ 1]  519     ld a,(x)
      008231 27 06            [ 1]  520 	jreq 1$
      008233 CD 82 1E         [ 4]  521 	call putc 
      008236 5C               [ 1]  522 	incw x 
      008237 20 F7            [ 2]  523 	jra puts 
      008239 81               [ 4]  524 1$:	ret 
                                    525 
                                    526 
                                    527 ;---------------------------
                                    528 ; delete character at left 
                                    529 ; of cursor on terminal 
                                    530 ; input:
                                    531 ;   none 
                                    532 ; output:
                                    533 ;	none 
                                    534 ;---------------------------
      00823A                        535 bksp:
      00823A A6 08            [ 1]  536 	ld a,#BSP 
      00823C CD 82 1E         [ 4]  537 	call putc 
      00823F A6 20            [ 1]  538 	ld a,#SPACE 
      008241 CD 82 1E         [ 4]  539 	call putc 
      008244 A6 08            [ 1]  540 	ld a,#BSP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008246 CD 82 1E         [ 4]  541 	call putc 
      008249 81               [ 4]  542 	ret 
                                    543 ;---------------------------
                                    544 ; delete n character left of cursor 
                                    545 ; at terminal.
                                    546 ; input: 
                                    547 ;   A   	number of characters to delete.
                                    548 ; output:
                                    549 ;    none 
                                    550 ;--------------------------	
      00824A                        551 delete:
      00824A 88               [ 1]  552 	push a 
      00824B 0D 01            [ 1]  553 0$:	tnz (1,sp)
      00824D 27 07            [ 1]  554 	jreq 1$
      00824F CD 82 3A         [ 4]  555 	call bksp 
      008252 0A 01            [ 1]  556 	dec (1,sp)
      008254 20 F5            [ 2]  557 	jra 0$
      008256 84               [ 1]  558 1$:	pop a 
      008257 81               [ 4]  559 	ret
                                    560 
                                    561 ;--------------------------
                                    562 ; print n spaces on terminal
                                    563 ; input:
                                    564 ;  X 		number of spaces 
                                    565 ; output:
                                    566 ;	none 
                                    567 ;---------------------------
      008258                        568 spaces:
      008258 A6 20            [ 1]  569 	ld a,#SPACE 
      00825A 5D               [ 2]  570 1$:	tnzw x
      00825B 27 06            [ 1]  571 	jreq 9$
      00825D CD 82 1E         [ 4]  572 	call putc 
      008260 5A               [ 2]  573 	decw x
      008261 20 F7            [ 2]  574 	jra 1$
      008263                        575 9$: 
      008263 81               [ 4]  576 	ret 
                                    577 
                           000001   578 .if DEBUG 
                                    579 ;---------------------------------
                                    580 ;; print actual registers states 
                                    581 ;; as pushed on stack 
                                    582 ;; {Y,X,CC,A}
                                    583 ;---------------------------------
      008264                        584 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0001E4                        585 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0001E4                        586 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0001E4                        587 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0001E4                        588 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0001E4                        589 prt_regs:
      008264 AE 82 A7         [ 2]  590 	ldw x,#regs_state 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008267 CD 82 30         [ 4]  591 	call puts
                                    592 ; register PC
      00826A 16 01            [ 2]  593 	ldw y,(1,sp)
      00826C AE 89 61         [ 2]  594 	ldw x,#REG_EPC 
      00826F CD 88 B2         [ 4]  595 	call prt_reg16 
                                    596 ; register CC 
      008272 7B 08            [ 1]  597 	ld a,(R_CC,sp)
      008274 AE 89 72         [ 2]  598 	ldw x,#REG_CC 
      008277 CD 88 8D         [ 4]  599 	call prt_reg8 
                                    600 ; register A 
      00827A 7B 07            [ 1]  601 	ld a,(R_A,sp)
      00827C AE 89 6E         [ 2]  602 	ldw x,#REG_A 
      00827F CD 88 8D         [ 4]  603 	call prt_reg8 
                                    604 ; register X 
      008282 16 05            [ 2]  605 	ldw y,(R_X,sp)
      008284 AE 89 6A         [ 2]  606 	ldw x,#REG_X 
      008287 CD 88 B2         [ 4]  607 	call prt_reg16 
                                    608 ; register Y 
      00828A 16 03            [ 2]  609 	ldw y,(R_Y,sp)
      00828C AE 89 66         [ 2]  610 	ldw x,#REG_Y 
      00828F CD 88 B2         [ 4]  611 	call prt_reg16 
                                    612 ; register SP 
      008292 90 96            [ 1]  613 	ldw y,sp
      008294 72 A9 00 08      [ 2]  614 	addw y,#6+ARG_OFS  
      008298 AE 89 77         [ 2]  615 	ldw x,#REG_SP
      00829B CD 88 B2         [ 4]  616 	call prt_reg16
      00829E A6 0D            [ 1]  617 	ld a,#CR 
      0082A0 CD 82 1E         [ 4]  618 	call putc
      0082A3 CD 82 1E         [ 4]  619 	call putc   
      0082A6 81               [ 4]  620 	ret 
                                    621 
      0082A7 0A 72 65 67 69 73 74   622 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    623 
                                    624 
                                    625 ;--------------------
                                    626 ; print content at address in hex.
                                    627 ; input:
                                    628 ;   X 	address to peek 
                                    629 ; output:
                                    630 ;	none 
                                    631 ;--------------------	
      0082CE                        632 prt_peek:
      0082CE 89               [ 2]  633 	pushw x 
      0082CF CF 00 0A         [ 2]  634 	ldw acc16,x 
      0082D2 72 5F 00 09      [ 1]  635 	clr acc24 
      0082D6 5F               [ 1]  636 	clrw x 
      0082D7 A6 10            [ 1]  637 	ld a,#16 
      0082D9 CD 89 7C         [ 4]  638 	call prti24 
      0082DC A6 3A            [ 1]  639 	ld a,#': 
      0082DE CD 82 1E         [ 4]  640 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082E1 A6 20            [ 1]  641 	ld a,#SPACE 
      0082E3 CD 82 1E         [ 4]  642 	call putc 
      0082E6 85               [ 2]  643 	popw x 
      0082E7 F6               [ 1]  644 	ld a,(x)
      0082E8 C7 00 0B         [ 1]  645 	ld acc8,a 
      0082EB 5F               [ 1]  646 	clrw x 
      0082EC A6 10            [ 1]  647 	ld a,#16 
      0082EE CD 89 7C         [ 4]  648 	call prti24
      0082F1 81               [ 4]  649 	ret 
                                    650 .endif ; DEBUG  
                                    651 
                                    652 ;-------------------------------------
                                    653 ; retrun string length
                                    654 ; input:
                                    655 ;   X         .asciz  
                                    656 ; output:
                                    657 ;   X         length 
                                    658 ;-------------------------------------
      0082F2                        659 strlen:
      0082F2 90 93            [ 1]  660 	ldw y,x 
      0082F4 5F               [ 1]  661 	clrw x 
      0082F5 90 7D            [ 1]  662 1$:	tnz (y) 
      0082F7 27 05            [ 1]  663 	jreq 9$ 
      0082F9 5C               [ 1]  664 	incw x
      0082FA 90 5C            [ 1]  665 	incw y 
      0082FC 20 F7            [ 2]  666 	jra 1$ 
      0082FE 81               [ 4]  667 9$: ret 
                                    668 
                                    669 ;------------------------------------
                                    670 ; compare 2 strings
                                    671 ; input:
                                    672 ;   X 		char* first string 
                                    673 ;   Y       char* second string 
                                    674 ; output:
                                    675 ;   A 		0|1 
                                    676 ;-------------------------------------
      0082FF                        677 strcmp:
      0082FF F6               [ 1]  678 	ld a,(x)
      008300 27 0B            [ 1]  679 	jreq 5$ 
      008302 90 F1            [ 1]  680 	cp a,(y) 
      008304 26 05            [ 1]  681 	jrne 4$ 
      008306 5C               [ 1]  682 	incw x 
      008307 90 5C            [ 1]  683 	incw y 
      008309 20 F4            [ 2]  684 	jra strcmp 
      00830B                        685 4$: ; not same  
      00830B 4F               [ 1]  686 	clr a 
      00830C 81               [ 4]  687 	ret 
      00830D                        688 5$: ; same 
      00830D A6 01            [ 1]  689 	ld a,#1 
      00830F 81               [ 4]  690 	ret 
                                    691 
                                    692 
                                    693 ;---------------------------------------
                                    694 ;  copy src to dest 
                                    695 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    696 ;   X 		dest 
                                    697 ;   Y 		src 
                                    698 ; output: 
                                    699 ;   X 		dest 
                                    700 ;----------------------------------
      008310                        701 strcpy:
      008310 89               [ 2]  702 	pushw x 
      008311 90 F6            [ 1]  703 1$: ld a,(y)
      008313 27 06            [ 1]  704 	jreq 9$ 
      008315 F7               [ 1]  705 	ld (x),a 
      008316 5C               [ 1]  706 	incw x 
      008317 90 5C            [ 1]  707 	incw y 
      008319 20 F6            [ 2]  708 	jra 1$ 
      00831B 7F               [ 1]  709 9$:	clr (x)
      00831C 85               [ 2]  710 	popw x 
      00831D 81               [ 4]  711 	ret 
                                    712 
                                    713 ;---------------------------------------
                                    714 ; move memory block 
                                    715 ; input:
                                    716 ;   X 		destination 
                                    717 ;   Y 	    source 
                                    718 ;   acc16	size 
                                    719 ; output:
                                    720 ;   none 
                                    721 ;--------------------------------------
                           000001   722 	INCR=1 ; increament high byte 
                           000002   723 	LB=2 ; increament low byte 
                           000002   724 	VSIZE=2
      00831E                        725 move:
      00029E                        726 	_vars VSIZE 
      00831E 52 02            [ 2]    1     sub sp,#VSIZE 
      008320 0F 01            [ 1]  727 	clr (INCR,sp)
      008322 0F 02            [ 1]  728 	clr (LB,sp)
      008324 90 89            [ 2]  729 	pushw y 
      008326 13 01            [ 2]  730 	cpw x,(1,sp) ; compare DEST to SRC 
      008328 90 85            [ 2]  731 	popw y 
      00832A 27 31            [ 1]  732 	jreq move_exit ; x==y 
      00832C 2B 0E            [ 1]  733 	jrmi move_down
      00832E                        734 move_up: ; start from top address with incr=-1
      00832E 72 BB 00 0A      [ 2]  735 	addw x,acc16
      008332 72 B9 00 0A      [ 2]  736 	addw y,acc16
      008336 03 01            [ 1]  737 	cpl (INCR,sp)
      008338 03 02            [ 1]  738 	cpl (LB,sp)   ; increment = -1 
      00833A 20 05            [ 2]  739 	jra move_loop  
      00833C                        740 move_down: ; start from bottom address with incr=1 
      00833C 5A               [ 2]  741     decw x 
      00833D 90 5A            [ 2]  742 	decw y
      00833F 0C 02            [ 1]  743 	inc (LB,sp) ; incr=1 
      008341                        744 move_loop:	
      008341 C6 00 0A         [ 1]  745     ld a, acc16 
      008344 CA 00 0B         [ 1]  746 	or a, acc8
      008347 27 14            [ 1]  747 	jreq move_exit 
      008349 72 FB 01         [ 2]  748 	addw x,(INCR,sp)
      00834C 72 F9 01         [ 2]  749 	addw y,(INCR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      00834F 90 F6            [ 1]  750 	ld a,(y)
      008351 F7               [ 1]  751 	ld (x),a 
      008352 89               [ 2]  752 	pushw x 
      008353 CE 00 0A         [ 2]  753 	ldw x,acc16 
      008356 5A               [ 2]  754 	decw x 
      008357 CF 00 0A         [ 2]  755 	ldw acc16,x 
      00835A 85               [ 2]  756 	popw x 
      00835B 20 E4            [ 2]  757 	jra move_loop
      00835D                        758 move_exit:
      0002DD                        759 	_drop VSIZE
      00835D 5B 02            [ 2]    1     addw sp,#VSIZE 
      00835F 81               [ 4]  760 	ret 	
                                    761 
                                    762 ;-------------------------------------
                                    763 ; search text area for a line with 
                                    764 ; same number as lineno  
                                    765 ; input:
                                    766 ;	X 			lineno 
                                    767 ; output:
                                    768 ;   X 			addr of line | 0 
                                    769 ;   Y           lineno|insert address if not found  
                                    770 ;-------------------------------------
                           000001   771 	LL=1 ; line length 
                           000002   772 	LB=2 ; line length low byte 
                           000002   773 	VSIZE=2 
      008360                        774 search_lineno:
      0002E0                        775 	_vars VSIZE
      008360 52 02            [ 2]    1     sub sp,#VSIZE 
      008362 CF 00 0A         [ 2]  776 	ldw acc16,x 
      008365 0F 01            [ 1]  777 	clr (LL,sp)
      008367 90 CE 00 1C      [ 2]  778 	ldw y,txtbgn
      00836B                        779 search_ln_loop:
      00836B 90 C3 00 1E      [ 2]  780 	cpw y,txtend 
      00836F 2A 13            [ 1]  781 	jrpl 8$
      008371 93               [ 1]  782 	ldw x,y 
      008372 FE               [ 2]  783 	ldw x,(x) ; x=line number 
      008373 C3 00 0A         [ 2]  784 	cpw x,acc16 
      008376 27 0F            [ 1]  785 	jreq 9$ 
      008378 2A 0A            [ 1]  786 	jrpl 8$ ; from here all lines are > lineno 
      00837A 90 E6 02         [ 1]  787 	ld a,(2,y)
      00837D 6B 02            [ 1]  788 	ld (LB,sp),a 
      00837F 72 F9 01         [ 2]  789 	addw y,(LL,sp)
      008382 20 E7            [ 2]  790 	jra search_ln_loop 
      008384 51               [ 1]  791 8$: exgw x,y 
      008385 90 5F            [ 1]  792 	clrw y 	
      000307                        793 9$: _drop VSIZE
      008387 5B 02            [ 2]    1     addw sp,#VSIZE 
      008389 51               [ 1]  794 	exgw x,y   
      00838A 81               [ 4]  795 	ret 
                                    796 
                                    797 ;-------------------------------------
                                    798 ; delete line at addr
                                    799 ; input:
                                    800 ;   X 		addr of line i.e DEST for move 
                                    801 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                           000001   802 	LLEN=1
                           000003   803 	SRC=3
                           000004   804 	VSIZE=4
      00838B                        805 del_line: 
      00030B                        806 	_vars VSIZE 
      00838B 52 04            [ 2]    1     sub sp,#VSIZE 
      00838D E6 02            [ 1]  807 	ld a,(2,x) ; line length
      00838F 6B 02            [ 1]  808 	ld (LLEN+1,sp),a 
      008391 0F 01            [ 1]  809 	clr (LLEN,sp)
      008393 90 93            [ 1]  810 	ldw y,x  
      008395 72 F9 01         [ 2]  811 	addw y,(LLEN,sp) ;SRC  
      008398 17 03            [ 2]  812 	ldw (SRC,sp),y  ;save source 
      00839A 90 CE 00 1E      [ 2]  813 	ldw y,txtend 
      00839E 72 F2 03         [ 2]  814 	subw y,(SRC,sp) ; y=count 
      0083A1 90 CF 00 0A      [ 2]  815 	ldw acc16,y 
      0083A5 16 03            [ 2]  816 	ldw y,(SRC,sp)    ; source
      0083A7 CD 83 1E         [ 4]  817 	call move
      0083AA 90 CE 00 1E      [ 2]  818 	ldw y,txtend 
      0083AE 72 F2 01         [ 2]  819 	subw y,(LLEN,sp)
      0083B1 90 CF 00 1E      [ 2]  820 	ldw txtend,y  
      000335                        821 	_drop VSIZE     
      0083B5 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083B7 81               [ 4]  822 	ret 
                                    823 
                                    824 
                                    825 ;---------------------------------------------
                                    826 ; create a gap in text area 
                                    827 ; input:
                                    828 ;    X 			addr gap start 
                                    829 ;    Y 			gap length 
                                    830 ; output:
                                    831 ;    X 			addr gap start 
                                    832 ;--------------------------------------------
                           000001   833 	DEST=1
                           000003   834 	SRC=3
                           000005   835 	LEN=5
                           000006   836 	VSIZE=6 
      0083B8                        837 create_gap:
      000338                        838 	_vars VSIZE
      0083B8 52 06            [ 2]    1     sub sp,#VSIZE 
      0083BA C3 00 1E         [ 2]  839 	cpw x,txtend 
      0083BD 2A 27            [ 1]  840 	jrpl 9$ ; no need for a gap since at end of text.
      0083BF 1F 03            [ 2]  841 	ldw (SRC,sp),x 
      0083C1 17 05            [ 2]  842 	ldw (LEN,sp),y 
      0083C3 90 CF 00 0A      [ 2]  843 	ldw acc16,y 
      0083C7 90 93            [ 1]  844 	ldw y,x ; SRC
      0083C9 72 BB 00 0A      [ 2]  845 	addw x,acc16  
      0083CD 1F 01            [ 2]  846 	ldw (DEST,sp),x 
                                    847 ;compute size to move 	
      0083CF CE 00 1E         [ 2]  848 	ldw x,txtend 
      0083D2 72 F0 03         [ 2]  849 	subw x,(SRC,sp)
      0083D5 CF 00 0A         [ 2]  850 	ldw acc16,x
      0083D8 1E 01            [ 2]  851 	ldw x,(DEST,sp) 
      0083DA CD 83 1E         [ 4]  852 	call move
      0083DD CE 00 1E         [ 2]  853 	ldw x,txtend
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0083E0 72 FB 05         [ 2]  854 	addw x,(LEN,sp)
      0083E3 CF 00 1E         [ 2]  855 	ldw txtend,x
      000366                        856 9$:	_drop VSIZE 
      0083E6 5B 06            [ 2]    1     addw sp,#VSIZE 
      0083E8 81               [ 4]  857 	ret 
                                    858 
                                    859 
                                    860 ;--------------------------------------------
                                    861 ; insert line in tib into text area 
                                    862 ; first search for already existing 
                                    863 ; replace existing 
                                    864 ; if strlen(tib)==0 delete existing 
                                    865 ; input:
                                    866 ;   ptr16 				pointer to tokenized line  
                                    867 ; output:
                                    868 ;   none
                                    869 ;---------------------------------------------
                           000001   870 	DEST=1  ; text area insertion address 
                           000003   871 	SRC=3   ; str to insert address 
                           000005   872 	LINENO=5 ; line number 
                           000007   873 	LLEN=7 ; line length 
                           000008   874 	VSIZE=8  
      0083E9                        875 insert_line:
      000369                        876 	_vars VSIZE 
      0083E9 52 08            [ 2]    1     sub sp,#VSIZE 
      0083EB CE 00 15         [ 2]  877 	ldw x,ptr16  
      0083EE C3 00 1C         [ 2]  878 	cpw x,txtbgn 
      0083F1 26 12            [ 1]  879 	jrne 0$
      0083F3 AE 00 02         [ 2]  880 	ldw x,#2 
      0083F6 72 D6 00 15      [ 4]  881 	ld a,([ptr16],x)
      0083FA 5F               [ 1]  882 	clrw x 
      0083FB 97               [ 1]  883 	ld xl,a 
      0083FC 72 BB 00 1E      [ 2]  884 	addw x,txtend 
      008400 CF 00 1E         [ 2]  885 	ldw txtend,x 
      008403 20 6F            [ 2]  886 	jra insert_ln_exit 
      008405 72 CE 00 15      [ 5]  887 0$:	ldw x,[ptr16]
      008409 1F 05            [ 2]  888 	ldw (LINENO,sp),x 
      00840B AE 00 02         [ 2]  889 	ldw x,#2 
      00840E 72 D6 00 15      [ 4]  890 	ld a,([ptr16],x); line length 
      008412 97               [ 1]  891 	ld xl,a
      008413 1F 07            [ 2]  892 	ldw (LLEN,sp),x
      008415 1E 05            [ 2]  893 	ldw x,(LINENO,sp)
      008417 CD 83 60         [ 4]  894 	call search_lineno 
      00841A 5D               [ 2]  895 	tnzw x 
      00841B 26 04            [ 1]  896 	jrne 2$
                                    897 ; line doesn't exit 	
      00841D 17 01            [ 2]  898 	ldw (DEST,sp),y 
      00841F 20 05            [ 2]  899 	jra 3$
                                    900 ; line exit delete it.	
      008421 1F 01            [ 2]  901 2$: ldw (DEST,sp),x 
      008423 CD 83 8B         [ 4]  902 	call del_line
                                    903 ; leave or insert new line if LLEN>0
      008426                        904 3$: 
      008426 0D 08            [ 1]  905 	tnz (LLEN+1,sp)
      008428 27 4A            [ 1]  906 	jreq insert_ln_exit ; empty line forget it.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      00842A 1E 01            [ 2]  907 	ldw x,(DEST,sp)
      00842C C3 00 1E         [ 2]  908 	cpw x,txtend 
      00842F 2A 12            [ 1]  909 	jrpl 4$ 
                                    910 ; must create a gap 
      008431 CE 00 1E         [ 2]  911 	ldw x,txtend 
      008434 72 FB 07         [ 2]  912 	addw x,(LLEN,sp)
      008437 CF 00 1E         [ 2]  913 	ldw txtend,x 
      00843A 1E 01            [ 2]  914 	ldw x,(DEST,sp)
      00843C 16 07            [ 2]  915 	ldw y,(LLEN,sp)
      00843E CD 83 B8         [ 4]  916 	call create_gap 
      008441 20 0B            [ 2]  917 	jra 5$ 
      008443                        918 4$: ; leave line at end. 
      008443 CE 00 1E         [ 2]  919 	ldw x,txtend 
      008446 72 FB 07         [ 2]  920 	addw x,(LLEN,sp)
      008449 CF 00 1E         [ 2]  921 	ldw txtend,x 
      00844C 20 26            [ 2]  922 	jra insert_ln_exit 
      00844E                        923 5$:	
      00844E 1E 07            [ 2]  924 	ldw x,(LLEN,sp)
      008450 CF 00 0A         [ 2]  925 	ldw acc16,x 
      008453 90 CE 00 15      [ 2]  926 	ldw y,ptr16 
      008457 72 F9 07         [ 2]  927 	addw y,(LLEN,sp)
      00845A 1E 01            [ 2]  928 	ldw x,(DEST,sp) ; dest address 
      00845C CD 83 1E         [ 4]  929 	call move 
      00845F CE 00 1E         [ 2]  930 	ldw x,txtend 
      008462 72 F0 07         [ 2]  931 	subw x,(LLEN,sp)
      008465 CF 00 1E         [ 2]  932 	ldw txtend,x 
      008468 72 5F 16 C8      [ 1]  933 	clr tib 
      00846C 72 5F 00 03      [ 1]  934 	clr count 
      008470 72 5F 00 02      [ 1]  935 	clr in 
      008474                        936 insert_ln_exit:	
      0003F4                        937 	_drop VSIZE
      008474 5B 08            [ 2]    1     addw sp,#VSIZE 
      008476 81               [ 4]  938 	ret
                                    939 
                                    940 
                                    941 ;-----------------------------
                                    942 ; check if text buffer full
                                    943 ; input:
                                    944 ;   ptr16     addr start tokenize line 
                                    945 ;   X         buffer index 
                                    946 ; output:
                                    947 ;   none 
                                    948 ;-----------------------------------
      008477                        949 check_full:
      008477 72 BB 00 15      [ 2]  950 	addw x,ptr16 
      00847B A3 16 C8         [ 2]  951 	cpw x,#tib 
      00847E 25 05            [ 1]  952 	jrult 1$
      008480 A6 01            [ 1]  953 	ld a,#ERR_MEM_FULL
      008482 CC 87 70         [ 2]  954 	jp tb_error 
      008485 81               [ 4]  955 1$: ret 
                                    956 
                                    957 
                                    958 ;-----------------------------------
                                    959 ; create token list form text line 
                                    960 ; save this list in text area
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    961 ; input:
                                    962 ;   none
                                    963 ; output:
                                    964 ;   basicptr     token list buffer
                                    965 ;   lineno 		 BASIC line number 
                                    966 ;   in.w  		 cleared 
                                    967 ;-----------------------------------
                                    968 	.macro _incr_ptr16 n 
                                    969 	ldw x,#n 
                                    970 	addw x,ptr16 
                                    971 	ldw ptr16,x 
                                    972 	.endm 
                                    973 
                           000001   974 	XSAVE=1
                           000003   975 	BUFIDX=3
                           000004   976 	VSIZE=4
      008486                        977 compile:
      000406                        978 	_vars VSIZE 
      008486 52 04            [ 2]    1     sub sp,#VSIZE 
      008488 CE 00 1E         [ 2]  979 	ldw x,txtend
      00848B CF 00 15         [ 2]  980 	ldw ptr16,x 
      00848E 5F               [ 1]  981 	clrw x 
      00848F AE 00 03         [ 2]  982 	ldw x,#3
      008492 1F 03            [ 2]  983 	ldw (BUFIDX,sp),X  
      008494 CD 84 77         [ 4]  984 	call check_full
      008497 5F               [ 1]  985 	clrw x 
      008498 72 CF 00 15      [ 5]  986 	ldw [ptr16],x 
      00849C CD 8D 5C         [ 4]  987 	call get_token
      00849F 1F 01            [ 2]  988 	ldw (XSAVE,sp),x 
      0084A1 A1 02            [ 1]  989 	cp a,#TK_INTGR 
      0084A3 26 11            [ 1]  990 	jrne 3$
      0084A5 A3 00 00         [ 2]  991 	cpw x,#0  
      0084A8 22 03            [ 1]  992 	jrugt 1$
      0084AA CC 87 6E         [ 2]  993 	jp syntax_error 
      0084AD 72 CF 00 15      [ 5]  994 1$:	ldw [ptr16],x; line number
      0084B1 CD 8D 5C         [ 4]  995 2$:	call get_token
      0084B4 1F 01            [ 2]  996 	ldw (XSAVE,sp),x 
      0084B6 A1 00            [ 1]  997 3$:	cp a,#TK_NONE 
      0084B8 27 4C            [ 1]  998 	jreq 9$ 
      0084BA 1E 03            [ 2]  999 	ldw x,(BUFIDX,sp)
      0084BC CD 84 77         [ 4] 1000 	call check_full 
      0084BF 16 03            [ 2] 1001 	ldw y,(BUFIDX,sp) 
      0084C1 91 D7 15         [ 4] 1002 	ld ([ptr16],y),a 
      0084C4 90 5C            [ 1] 1003 	incw y
      0084C6 17 03            [ 2] 1004 	ldw (BUFIDX,sp),y
      0084C8 A1 07            [ 1] 1005 	cp a,#TK_QSTR 
      0084CA 26 25            [ 1] 1006 	jrne 4$
      0084CC AE 17 18         [ 2] 1007 	ldw x,#pad 
      0084CF CD 82 F2         [ 4] 1008 	call strlen
      0084D2 5C               [ 1] 1009 	incw x  
      0084D3 CD 84 77         [ 4] 1010 	call check_full 
      0084D6 90 AE 17 18      [ 2] 1011 	ldw y,#pad 
      0084DA CE 00 15         [ 2] 1012 	ldw x,ptr16
      0084DD 72 FB 03         [ 2] 1013 	addw x,(BUFIDX,sp)	
      0084E0 CD 83 10         [ 4] 1014 	call strcpy 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084E3 AE 17 18         [ 2] 1015 	ldw x,#pad 
      0084E6 CD 82 F2         [ 4] 1016 	call strlen 
      0084E9 5C               [ 1] 1017 	incw x
      0084EA 72 FB 03         [ 2] 1018 	addw x,(BUFIDX,sp) 
      0084ED 1F 03            [ 2] 1019 	ldw (BUFIDX,sp),x
      0084EF 20 C0            [ 2] 1020 	jra 2$  
      0084F1 A1 02            [ 1] 1021 4$: cp a,#TK_INTGR
      0084F3 25 BC            [ 1] 1022 	jrult 2$
      0084F5 A1 06            [ 1] 1023 	cp a,#TK_FUNC 
      0084F7 22 B8            [ 1] 1024 	Jrugt 2$
      0084F9 1E 01            [ 2] 1025 	ldw x,(XSAVE,sp) 
      0084FB 91 DF 15         [ 5] 1026 	ldw ([ptr16],y),x
      0084FE 72 A9 00 02      [ 2] 1027 	addw y,#2 
      008502 17 03            [ 2] 1028 	ldw (BUFIDX,sp),y 
      008504 20 AB            [ 2] 1029 	jra 2$
      008506                       1030 9$: 
      008506 AE 00 02         [ 2] 1031 	ldw x,#2
      008509 16 03            [ 2] 1032 	ldw y,(BUFIDX,sp)
      00850B 90 9F            [ 1] 1033 	ld a,yl 
      00850D 72 D7 00 15      [ 4] 1034 	ld ([ptr16],x),a  	
      008511 72 CE 00 15      [ 5] 1035 	ldw x,[ptr16]
      008515 27 41            [ 1] 1036 	jreq 10$
      000497                       1037 _dbg_prt_var txtend
                           000001     1     .if DEBUG
      000497                          2     _dbg_save_regs 
                           000001     1     .if DEBUG
      008517 8A               [ 1]    2     push cc ; (6,sp)
      008518 88               [ 1]    3     push a   ; (5,sp)
      008519 89               [ 2]    4     pushw x  ; (3,sp)
      00851A 90 89            [ 2]    5     pushw y  ; (1,sp)
                                      6     .endif 
      00851C CE 00 1E         [ 2]    3     ldw x,txtend 
      00851F CF 00 0A         [ 2]    4     ldw acc16,x 
      008522 72 5F 00 09      [ 1]    5     clr acc24 
      008526 5F               [ 1]    6     clrw x 
      008527 A6 90            [ 1]    7     ld a,#16+128  
      008529 CD 89 7C         [ 4]    8     call prti24
      00852C A6 0D            [ 1]    9     ld a,#CR 
      00852E CD 82 1E         [ 4]   10     call putc  
      0004B1                         11     _dbg_restore_regs 
                           000001     1     .if DEBUG 
      008531 90 85            [ 2]    2     popw y 
      008533 85               [ 2]    3     popw x 
      008534 84               [ 1]    4     pop a 
      008535 86               [ 1]    5     pop cc 
                                      6     .endif 
                                     12     .endif 
      008536 CD 83 E9         [ 4] 1038 	call insert_line 
      0004B9                       1039 _dbg_prt_var txtend
                           000001     1     .if DEBUG
      0004B9                          2     _dbg_save_regs 
                           000001     1     .if DEBUG
      008539 8A               [ 1]    2     push cc ; (6,sp)
      00853A 88               [ 1]    3     push a   ; (5,sp)
      00853B 89               [ 2]    4     pushw x  ; (3,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00853C 90 89            [ 2]    5     pushw y  ; (1,sp)
                                      6     .endif 
      00853E CE 00 1E         [ 2]    3     ldw x,txtend 
      008541 CF 00 0A         [ 2]    4     ldw acc16,x 
      008544 72 5F 00 09      [ 1]    5     clr acc24 
      008548 5F               [ 1]    6     clrw x 
      008549 A6 90            [ 1]    7     ld a,#16+128  
      00854B CD 89 7C         [ 4]    8     call prti24
      00854E A6 0D            [ 1]    9     ld a,#CR 
      008550 CD 82 1E         [ 4]   10     call putc  
      0004D3                         11     _dbg_restore_regs 
                           000001     1     .if DEBUG 
      008553 90 85            [ 2]    2     popw y 
      008555 85               [ 2]    3     popw x 
      008556 84               [ 1]    4     pop a 
      008557 86               [ 1]    5     pop cc 
                                      6     .endif 
                                     12     .endif 
      008558                       1040 10$: 
      008558 83               [ 9] 1041 trap 	
      0004D9                       1042 	_drop VSIZE 
      008559 5B 04            [ 2]    1     addw sp,#VSIZE 
      00855B 81               [ 4] 1043 	ret 
                                   1044 
                                   1045 
                                   1046 ;------------------------------------
                                   1047 ;  set all variables to zero 
                                   1048 ; input:
                                   1049 ;   none 
                                   1050 ; output:
                                   1051 ;	none
                                   1052 ;------------------------------------
      00855C                       1053 clear_vars:
      00855C AE 00 27         [ 2] 1054 	ldw x,#vars 
      00855F 90 AE 00 34      [ 2] 1055 	ldw y,#2*26 
      008563 7F               [ 1] 1056 1$:	clr (x)
      008564 5C               [ 1] 1057 	incw x 
      008565 90 5A            [ 2] 1058 	decw y 
      008567 26 FA            [ 1] 1059 	jrne 1$
      008569 81               [ 4] 1060 	ret 
                                   1061 
                                   1062 ;-------------------------------------
                                   1063 ; check if A is a letter
                                   1064 ; input:
                                   1065 ;   A 			character to test 
                                   1066 ; output:
                                   1067 ;   C flag      1 true, 0 false 
                                   1068 ;-------------------------------------
      00856A                       1069 is_alpha:
      00856A A1 41            [ 1] 1070 	cp a,#'A 
      00856C 8C               [ 1] 1071 	ccf
      00856D 24 0B            [ 1] 1072 	jrnc 9$ 
      00856F A1 5B            [ 1] 1073 	cp a,#'Z+1 
      008571 25 07            [ 1] 1074 	jrc 9$ 
      008573 A1 61            [ 1] 1075 	cp a,#'a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      008575 8C               [ 1] 1076 	ccf 
      008576 24 02            [ 1] 1077 	jrnc 9$
      008578 A1 7B            [ 1] 1078 	cp a,#'z+1   
      00857A 81               [ 4] 1079 9$: ret 	
                                   1080 
                                   1081 ;-------------------------------------
                                   1082 ;  program initialization entry point 
                                   1083 ;-------------------------------------
                           000001  1084 	MAJOR=1
                           000000  1085 	MINOR=0
      00857B 0A 0A 54 69 6E 79 20  1086 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0085C1                       1087 cold_start:
                                   1088 ;set stack 
      0085C1 AE 17 FF         [ 2] 1089 	ldw x,#STACK_EMPTY
      0085C4 94               [ 1] 1090 	ldw sp,x   
                                   1091 ; clear all ram 
      0085C5 7F               [ 1] 1092 0$: clr (x)
      0085C6 5A               [ 2] 1093 	decw x 
      0085C7 26 FC            [ 1] 1094 	jrne 0$
                                   1095 ; activate pull up on all inputs 
      0085C9 A6 FF            [ 1] 1096 	ld a,#255 
      0085CB C7 50 03         [ 1] 1097 	ld PA_CR1,a 
      0085CE C7 50 08         [ 1] 1098 	ld PB_CR1,a 
      0085D1 C7 50 0D         [ 1] 1099 	ld PC_CR1,a 
      0085D4 C7 50 12         [ 1] 1100 	ld PD_CR1,a 
      0085D7 C7 50 17         [ 1] 1101 	ld PE_CR1,a 
      0085DA C7 50 1C         [ 1] 1102 	ld PF_CR1,a 
      0085DD C7 50 21         [ 1] 1103 	ld PG_CR1,a 
      0085E0 C7 50 2B         [ 1] 1104 	ld PI_CR1,a 
                                   1105 ; select internal clock no divisor: 16 Mhz 	
      0085E3 A6 E1            [ 1] 1106 	ld a,#CLK_SWR_HSI 
      0085E5 5F               [ 1] 1107 	clrw x  
      0085E6 CD 81 19         [ 4] 1108     call clock_init 
      0085E9 CD 81 2F         [ 4] 1109 	call timer4_init
                                   1110 ; UART3 at 115200 BAUD
      0085EC CD 81 F4         [ 4] 1111 	call uart3_init
                                   1112 ; activate PE_4 (user button interrupt)
      0085EF 72 18 50 18      [ 1] 1113     bset PE_CR2,#USR_BTN_BIT 
                                   1114 ; display system information
      0085F3 AE 85 7B         [ 2] 1115 	ldw x,#software 
      0085F6 CD 82 30         [ 4] 1116 	call puts 
      0085F9 A6 01            [ 1] 1117 	ld a,#MAJOR 
      0085FB C7 00 0B         [ 1] 1118 	ld acc8,a 
      0085FE 5F               [ 1] 1119 	clrw x 
      0085FF CF 00 09         [ 2] 1120 	ldw acc24,x 
      008602 A6 0A            [ 1] 1121 	ld a,#10 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008604 CD 89 7C         [ 4] 1122 	call prti24 
      008607 A6 2E            [ 1] 1123 	ld a,#'.
      008609 CD 82 1E         [ 4] 1124 	call putc 
      00860C A6 00            [ 1] 1125 	ld a,#MINOR 
      00860E C7 00 0B         [ 1] 1126 	ld acc8,a 
      008611 5F               [ 1] 1127 	clrw x 
      008612 CF 00 09         [ 2] 1128 	ldw acc24,x 
      008615 A6 0A            [ 1] 1129 	ld a,#10 
      008617 CD 89 7C         [ 4] 1130 	call prti24 
      00861A A6 0D            [ 1] 1131 	ld a,#CR 
      00861C CD 82 1E         [ 4] 1132 	call putc 
      00861F CD 98 FE         [ 4] 1133 	call seek_fdrive 
                                   1134 ; configure LED2 pin 
      008622 72 1A 50 0D      [ 1] 1135     bset PC_CR1,#LED2_BIT
      008626 72 1A 50 0E      [ 1] 1136     bset PC_CR2,#LED2_BIT
      00862A 72 1A 50 0C      [ 1] 1137     bset PC_DDR,#LED2_BIT
      00862E 9A               [ 1] 1138 	rim 
      00862F AE 16 C8         [ 2] 1139 	ldw x,#tib
      008632 CF 00 21         [ 2] 1140 	ldw array_addr,x 
      008635 72 5C 00 11      [ 1] 1141 	inc seedy+1 
      008639 72 5C 00 0F      [ 1] 1142 	inc seedx+1 
      00863D CD 86 4C         [ 4] 1143 	call clear_basic
      008640 CD 93 A9         [ 4] 1144 	call ubound 
      008643 CD 8F FF         [ 4] 1145 	call dpop 
      008646 CF 00 23         [ 2] 1146 	ldw array_size,x 
      008649 CC 87 CA         [ 2] 1147     jp warm_start 
                                   1148 
                                   1149 ;---------------------------
                                   1150 ; reset BASIC text variables 
                                   1151 ; and clear variables 
                                   1152 ;---------------------------
      00864C                       1153 clear_basic:
      00864C 5F               [ 1] 1154 	clrw x 
      00864D CF 00 06         [ 2] 1155 	ldw lineno,x
      008650 72 5F 00 03      [ 1] 1156 	clr count 
      008654 AE 00 5B         [ 2] 1157 	ldw x,#free_ram 
      008657 CF 00 1C         [ 2] 1158 	ldw txtbgn,x 
      00865A CF 00 1E         [ 2] 1159 	ldw txtend,x 
      00865D CD 85 5C         [ 4] 1160 	call clear_vars 
      008660 81               [ 4] 1161 	ret 
                                   1162 
                                   1163 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1164 ;;   Tiny BASIC error messages     ;;
                                   1165 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008661                       1166 err_msg:
      008661 00 00 86 79 86 87 86  1167 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             96 86 B0 86 C0
      00866D 86 D7 86 EE 87 09 87  1168 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             1B 87 2D
      008677 87 3A                 1169 	.word err_no_access 
                                   1170 
      008679 0A 4D 65 6D 6F 72 79  1171 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      008687 0A 73 79 6E 74 61 78  1172 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal  00-Bits]



             00
      008696 0A 6D 61 74 68 20 6F  1173 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0086B0 0A 64 69 76 69 73 69  1174 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      0086C0 0A 69 6E 76 61 6C 69  1175 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      0086D7 0A 72 75 6E 20 74 69  1176 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      0086EE 0A 63 6F 6D 6D 61 6E  1177 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      008709 0A 64 75 70 6C 69 63  1178 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      00871B 0A 46 69 6C 65 20 6E  1179 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      00872D 0A 62 61 64 20 76 61  1180 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      00873A 0A 46 69 6C 65 20 69  1181 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
                                   1182 
      00876E                       1183 syntax_error:
      00876E A6 02            [ 1] 1184 	ld a,#ERR_SYNTAX 
                                   1185 
      008770                       1186 tb_error:
      008770 AE 86 61         [ 2] 1187 	ldw x, #err_msg 
      008773 72 5F 00 0A      [ 1] 1188 	clr acc16 
      008777 48               [ 1] 1189 	sll a
      008778 72 59 00 0A      [ 1] 1190 	rlc acc16  
      00877C C7 00 0B         [ 1] 1191 	ld acc8, a 
      00877F 72 BB 00 0A      [ 2] 1192 	addw x,acc16 
      008783 FE               [ 2] 1193 	ldw x,(x)
      008784 CD 82 30         [ 4] 1194 	call puts
      008787 CE 00 06         [ 2] 1195 	ldw x,lineno 
      00878A 5D               [ 2] 1196 	tnzw x 
      00878B 27 0B            [ 1] 1197 	jreq 2$
      00878D 35 06 00 26      [ 1] 1198 	mov tab_width,#6
      008791 35 0A 00 08      [ 1] 1199 	mov base,#10 
      008795 CD 89 C4         [ 4] 1200 	call print_int 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      008798                       1201 2$:	 
      008798 CE 00 04         [ 2] 1202 	ldw x,basicptr   
      00879B C6 00 06         [ 1] 1203 	ld a,lineno 
      00879E CA 00 07         [ 1] 1204 	or a,lineno+1
      0087A1 27 03            [ 1] 1205 	jreq 3$
      0087A3 1C 00 03         [ 2] 1206 	addw x,#3 
      0087A6 CD 82 30         [ 4] 1207 3$:	call puts 
      0087A9 A6 0D            [ 1] 1208 	ld a,#CR 
      0087AB CD 82 1E         [ 4] 1209 	call putc 
      0087AE 5F               [ 1] 1210 	clrw x 
      0087AF C6 00 06         [ 1] 1211 	ld a,lineno 
      0087B2 CA 00 07         [ 1] 1212 	or a,lineno+1
      0087B5 27 03            [ 1] 1213 	jreq 4$
      0087B7 AE 00 03         [ 2] 1214 	ldw x,#3 
      0087BA 72 BB 00 01      [ 2] 1215 4$:	addw x,in.w 
      0087BE CD 82 58         [ 4] 1216 	call spaces
      0087C1 A6 5E            [ 1] 1217 	ld a,#'^ 
      0087C3 CD 82 1E         [ 4] 1218 	call putc 
      0087C6 AE 17 FF         [ 2] 1219 1$: ldw x,#STACK_EMPTY 
      0087C9 94               [ 1] 1220     ldw sp,x
      0087CA                       1221 warm_start:
      0087CA 72 5F 00 25      [ 1] 1222 	clr flags 
      0087CE 72 5F 00 20      [ 1] 1223 	clr loop_depth 
      0087D2 AE 17 80         [ 2] 1224 	ldw x,#dstack_unf 
      0087D5 CF 00 1A         [ 2] 1225 	ldw dstkptr,x 
      0087D8 35 04 00 26      [ 1] 1226 	mov tab_width,#TAB_WIDTH 
      0087DC 35 0A 00 08      [ 1] 1227 	mov base,#10 
      0087E0 5F               [ 1] 1228 	clrw x 
      0087E1 CF 00 06         [ 2] 1229 	ldw lineno,x 
      0087E4 AE 16 C8         [ 2] 1230 	ldw x,#tib 
      0087E7 CF 00 04         [ 2] 1231 	ldw basicptr,x 
                                   1232 ;----------------------------
                                   1233 ;   BASIC interpreter
                                   1234 ;----------------------------
      0087EA                       1235 interp:
      0087EA 72 5F 00 01      [ 1] 1236 	clr in.w
      0087EE 72 01 00 25 2C   [ 2] 1237 	btjf flags,#FRUN,4$ 
                                   1238 ; running program
                                   1239 ; goto next basic line 
      0087F3 CE 00 04         [ 2] 1240 	ldw x,basicptr
      0087F6 E6 02            [ 1] 1241 	ld a,(2,x) ; line length 
      0087F8 C7 00 0B         [ 1] 1242 	ld acc8,a 
      0087FB 72 5F 00 0A      [ 1] 1243 	clr acc16 
      0087FF 1C 00 03         [ 2] 1244 	addw x,#3 
      008802 72 BB 00 0A      [ 2] 1245 	addw x,acc16
      008806 C3 00 1E         [ 2] 1246 	cpw x,txtend 
      008809 2A BF            [ 1] 1247 	jrpl warm_start
      00880B CF 00 04         [ 2] 1248 	ldw basicptr,x ; start of next line  
      00880E E6 02            [ 1] 1249 	ld a,(2,x)
      008810 AB 02            [ 1] 1250 	add a,#2 ; because 'in' start at 3.
      008812 C7 00 03         [ 1] 1251 	ld count,a 
      008815 FE               [ 2] 1252 	ldw x,(x) ; line no 
      008816 CF 00 06         [ 2] 1253 	ldw lineno,x 
      008819 35 03 00 02      [ 1] 1254 	mov in,#3 ; skip first 3 bytes of line 
      00881D 20 14            [ 2] 1255 	jra interp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      00881F                       1256 4$: ; commande line mode 	
      00881F 72 5F 00 02      [ 1] 1257 	clr in 
      008823 A6 0D            [ 1] 1258 	ld a,#CR 
      008825 CD 82 1E         [ 4] 1259 	call putc 
      008828 A6 3E            [ 1] 1260 	ld a,#'> 
      00882A CD 82 1E         [ 4] 1261 	call putc 
      00882D CD 8A B2         [ 4] 1262 	call readln
      008830 CD 84 86         [ 4] 1263 	call compile
      008833                       1264 interp_loop:  
      008833 C6 00 02         [ 1] 1265 	ld a,in 
      008836 C1 00 03         [ 1] 1266 	cp a,count 
      008839 2A AF            [ 1] 1267 	jrpl interp
      00883B CD 8D 5C         [ 4] 1268 	call get_token
      00883E A1 01            [ 1] 1269 	cp a,#TK_COLON 
      008840 27 F1            [ 1] 1270 	jreq interp_loop 
      008842 A1 00            [ 1] 1271 	cp a,#TK_NONE 
      008844 27 A4            [ 1] 1272 	jreq interp 
      008846                       1273 1$:
      008846 A1 03            [ 1] 1274 	cp a,#TK_VAR
      008848 26 05            [ 1] 1275 	jrne 2$
      00884A CD 93 C1         [ 4] 1276 	call let02  
      00884D 20 E4            [ 2] 1277 	jra interp_loop 
      00884F                       1278 2$:	
      00884F A1 04            [ 1] 1279 	cp a,#TK_ARRAY 
      008851 26 08            [ 1] 1280 	jrne 3$
      008853 CD 92 14         [ 4] 1281 	call get_array_element
      008856 CD 93 C1         [ 4] 1282 	call let02 
      008859 20 D8            [ 2] 1283 	jra interp_loop 
      00885B                       1284 3$:
      00885B A1 05            [ 1] 1285 	cp a,#TK_CMD
      00885D 26 03            [ 1] 1286 	jrne 4$
      00885F FD               [ 4] 1287 	call (x) 
      008860 20 D1            [ 2] 1288 	jra interp_loop 
      008862                       1289 4$:	
      008862 A1 02            [ 1] 1290 	cp a,#TK_INTGR
      008864 26 06            [ 1] 1291 	jrne 5$
      008866 CD 83 E9         [ 4] 1292 	call insert_line 
      008869 CC 87 EA         [ 2] 1293 	jp interp
      00886C                       1294 5$: 
      00886C CC 87 6E         [ 2] 1295 	jp syntax_error 
                                   1296 
                                   1297 ;----------------------------------------
                                   1298 ;   DEBUG support functions
                                   1299 ;----------------------------------------
                           000001  1300 .if DEBUG 
                                   1301 ; turn LED on 
      00886F                       1302 ledon:
      00886F 72 1A 50 0A      [ 1] 1303     bset PC_ODR,#LED2_BIT
      008873 81               [ 4] 1304     ret 
                                   1305 
                                   1306 ; turn LED off 
      008874                       1307 ledoff:
      008874 72 1B 50 0A      [ 1] 1308     bres PC_ODR,#LED2_BIT 
      008878 81               [ 4] 1309     ret 
                                   1310 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



                                   1311 ; invert LED status 
      008879                       1312 ledtoggle:
      008879 A6 20            [ 1] 1313     ld a,#LED2_MASK
      00887B C8 50 0A         [ 1] 1314     xor a,PC_ODR
      00887E C7 50 0A         [ 1] 1315     ld PC_ODR,a
      008881 81               [ 4] 1316     ret 
                                   1317 
      008882                       1318 left_paren:
      008882 A6 20            [ 1] 1319 	ld a,#SPACE 
      008884 CD 82 1E         [ 4] 1320 	call putc
      008887 A6 28            [ 1] 1321 	ld a,#'( 
      008889 CD 82 1E         [ 4] 1322 	call putc 	
      00888C 81               [ 4] 1323 	ret 
                                   1324 
                                   1325 ;------------------------------
                                   1326 ; print 8 bit register 
                                   1327 ; input:
                                   1328 ;   X  point to register name 
                                   1329 ;   A  register value to print 
                                   1330 ; output:
                                   1331 ;   none
                                   1332 ;------------------------------- 
      00888D                       1333 prt_reg8:
      00888D 88               [ 1] 1334 	push a 
      00888E CD 82 30         [ 4] 1335 	call puts 
      008891 7B 01            [ 1] 1336 	ld a,(1,sp) 
      008893 C7 00 0B         [ 1] 1337 	ld acc8,a 
      008896 5F               [ 1] 1338 	clrw x 
      008897 97               [ 1] 1339 	ld xl,a 
      008898 35 10 00 08      [ 1] 1340 	mov base,#16
      00889C CD 89 C4         [ 4] 1341 	call print_int 
      00889F CD 88 82         [ 4] 1342 	call left_paren 
      0088A2 84               [ 1] 1343 	pop a 
      0088A3 5F               [ 1] 1344 	clrw x 
      0088A4 97               [ 1] 1345 	ld xl,a 
      0088A5 35 0A 00 08      [ 1] 1346 	mov base,#10 
      0088A9 CD 89 C4         [ 4] 1347 	call print_int  
      0088AC A6 29            [ 1] 1348 	ld a,#') 
      0088AE CD 82 1E         [ 4] 1349 	call putc
      0088B1 81               [ 4] 1350 	ret
                                   1351 
                                   1352 ;--------------------------------
                                   1353 ; print 16 bits register 
                                   1354 ; input:
                                   1355 ;   X   point register name 
                                   1356 ;   Y   register value to print 
                                   1357 ; output:
                                   1358 ;  none
                                   1359 ;--------------------------------
      0088B2                       1360 prt_reg16: 
      0088B2 90 89            [ 2] 1361 	pushw y 
      0088B4 CD 82 30         [ 4] 1362 	call puts 
      0088B7 1E 01            [ 2] 1363 	ldw x,(1,sp) 
      0088B9 35 10 00 08      [ 1] 1364 	mov base,#16 
      0088BD CD 89 C4         [ 4] 1365 	call print_int  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0088C0 CD 88 82         [ 4] 1366 	call left_paren 
      0088C3 85               [ 2] 1367 	popw x 
      0088C4 35 0A 00 08      [ 1] 1368 	mov base,#10 
      0088C8 CD 89 C4         [ 4] 1369 	call print_int  
      0088CB A6 29            [ 1] 1370 	ld a,#') 
      0088CD CD 82 1E         [ 4] 1371 	call putc
      0088D0 81               [ 4] 1372 	ret 
                                   1373 
                                   1374 ;------------------------------------
                                   1375 ; print registers contents saved on
                                   1376 ; stack by trap interrupt.
                                   1377 ;------------------------------------
      0088D1                       1378 print_registers:
      0088D1 AE 89 24         [ 2] 1379 	ldw x,#STATES
      0088D4 CD 82 30         [ 4] 1380 	call puts
                                   1381 ; print EPC 
      0088D7 AE 89 61         [ 2] 1382 	ldw x, #REG_EPC
      0088DA CD 82 30         [ 4] 1383 	call puts 
      0088DD 7B 0B            [ 1] 1384 	ld a, (11,sp)
      0088DF C7 00 0B         [ 1] 1385 	ld acc8,a 
      0088E2 7B 0A            [ 1] 1386 	ld a, (10,sp) 
      0088E4 C7 00 0A         [ 1] 1387 	ld acc16,a 
      0088E7 7B 09            [ 1] 1388 	ld a,(9,sp) 
      0088E9 C7 00 09         [ 1] 1389 	ld acc24,a
      0088EC 5F               [ 1] 1390 	clrw x  
      0088ED A6 10            [ 1] 1391 	ld a,#16
      0088EF CD 89 7C         [ 4] 1392 	call prti24  
                                   1393 ; print X
      0088F2 AE 89 6A         [ 2] 1394 	ldw x,#REG_X
      0088F5 16 05            [ 2] 1395 	ldw y,(5,sp)
      0088F7 CD 88 B2         [ 4] 1396 	call prt_reg16  
                                   1397 ; print Y 
      0088FA AE 89 66         [ 2] 1398 	ldw x,#REG_Y
      0088FD 16 07            [ 2] 1399 	ldw y, (7,sp)
      0088FF CD 88 B2         [ 4] 1400 	call prt_reg16  
                                   1401 ; print A 
      008902 AE 89 6E         [ 2] 1402 	ldw x,#REG_A
      008905 7B 04            [ 1] 1403 	ld a, (4,sp) 
      008907 CD 88 8D         [ 4] 1404 	call prt_reg8
                                   1405 ; print CC 
      00890A AE 89 72         [ 2] 1406 	ldw x,#REG_CC 
      00890D 7B 03            [ 1] 1407 	ld a, (3,sp) 
      00890F CD 88 8D         [ 4] 1408 	call prt_reg8 
                                   1409 ; print SP 
      008912 AE 89 77         [ 2] 1410 	ldw x,#REG_SP
      008915 90 96            [ 1] 1411 	ldw y,sp 
      008917 72 A9 00 0C      [ 2] 1412 	addw y,#12
      00891B CD 88 B2         [ 4] 1413 	call prt_reg16  
      00891E A6 0A            [ 1] 1414 	ld a,#'\n' 
      008920 CD 82 1E         [ 4] 1415 	call putc
      008923 81               [ 4] 1416 	ret
                                   1417 
      008924 0A 52 65 67 69 73 74  1418 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal  62-Bits]



             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      00893A 6F 72 74 20 70        1419 REG_EPC: .asciz "EPC:"
      00893F 6F 69 6E 74           1420 REG_Y:   .asciz "\nY:" 
      008943 2E 0A 2D 2D           1421 REG_X:   .asciz "\nX:"
      008947 2D 2D 2D 2D           1422 REG_A:   .asciz "\nA:" 
      00894B 2D 2D 2D 2D 2D        1423 REG_CC:  .asciz "\nCC:"
      008950 2D 2D 2D 2D 2D        1424 REG_SP:  .asciz "\nSP:"
                                   1425 .endif ; DEBUG 
                                   1426 
                                   1427 ;------------------------------------
                                   1428 ; print integer in acc24 
                                   1429 ; input:
                                   1430 ;	acc24 		integer to print 
                                   1431 ;	A 			numerical base for conversion 
                                   1432 ;               if bit 7 is set add a space at print end.
                                   1433 ;   XL 			field width, 0 -> no fill.
                                   1434 ;  output:
                                   1435 ;    none 
                                   1436 ;------------------------------------
                           000001  1437 	WIDTH = 1
                           000002  1438 	BASE = 2
                           000003  1439 	ADD_SPACE=3 ; add a space after number 
                           000003  1440 	VSIZE = 3
      0008FC                       1441 prti24:
      0008FC                       1442 	_vars VSIZE 
      008955 2D 2D            [ 2]    1     sub sp,#VSIZE 
      008957 2D 2D            [ 1] 1443 	clr (ADD_SPACE,sp)
      008959 2D 2D            [ 1] 1444 	bcp a,#0x80 
      00895B 2D 2D            [ 1] 1445 	jreq 0$ 
      00895D 2D 2D            [ 1] 1446 	cpl (ADD_SPACE,sp)
      00895F 0A 00            [ 1] 1447 0$:	and a,#31 
      008961 45 50            [ 1] 1448 	ld (BASE,sp),a
      008963 43               [ 1] 1449 	ld a,xl
      008964 3A 00            [ 1] 1450 	ld (WIDTH,sp),a 
      008966 0A 59            [ 1] 1451 	ld a, (BASE,sp)  
      008968 3A 00 0A         [ 4] 1452     call itoa  ; conversion entier en  .asciz
      00896B 58 3A            [ 1] 1453 1$: ld a,(WIDTH,sp)
      00896D 00 0A            [ 1] 1454 	jreq 4$
      00896F 41 3A 00         [ 1] 1455 	ld acc8,a 
      008972 0A               [ 2] 1456 	pushw x 
      008973 43 43 3A         [ 4] 1457 	call strlen 
      008976 00               [ 1] 1458 	ld a,xl 
      008977 0A               [ 2] 1459 	popw x 
      008978 53 50 3A         [ 3] 1460 	exg a,acc8 
      00897B 00 00 0A         [ 1] 1461 	sub a,acc8 
      00897C 2B 0E            [ 1] 1462 	jrmi 4$
      00897C 52 03            [ 1] 1463 	ld (WIDTH,sp),a 
      00897E 0F 03            [ 1] 1464 	ld  a,#SPACE
      008980 A5 80            [ 1] 1465 3$: tnz (WIDTH,sp)
      008982 27 02            [ 1] 1466 	jreq 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008984 03               [ 2] 1467 	decw x 
      008985 03               [ 1] 1468 	ld (x),a 
      008986 A4 1F            [ 1] 1469 	dec (WIDTH,sp) 
      008988 6B 02            [ 2] 1470 	jra 3$
      000935                       1471 4$: 
      00898A 9F 6B 01         [ 4] 1472 	call puts 
      00898D 7B 02            [ 1] 1473 	tnz (ADD_SPACE,sp)
      00898F CD 8A            [ 1] 1474 	jreq 5$
      008991 20 7B            [ 1] 1475     ld a,#SPACE 
      008993 01 27 1F         [ 4] 1476 	call putc 
      000941                       1477 5$: _drop VSIZE 
      008996 C7 00            [ 2]    1     addw sp,#VSIZE 
      008998 0B               [ 4] 1478     ret	
                                   1479 
                                   1480 ;-----------------------------------
                                   1481 ; print a 16 bit integer 
                                   1482 ; using variable 'base' as conversion
                                   1483 ; format.
                                   1484 ; input:
                                   1485 ;   X       integer to print 
                                   1486 ;   base    conversion base 
                                   1487 ; output:
                                   1488 ;   none 
                                   1489 ;-----------------------------------
                           000001  1490 	SIGN=1
                           000001  1491 	VSIZE=1
      000944                       1492 print_int: 
      000944                       1493 	_vars VSIZE 
      008999 89 CD            [ 2]    1     sub sp,#VSIZE 
      00899B 82 F2            [ 1] 1494 	clr (SIGN,sp)
      00899D 9F 85 31 00      [ 2] 1495 	ldw y,#pad+PAD_SIZE-1 
      0089A1 0B C0            [ 1] 1496 	clr (y)
      0089A3 00 0B 2B         [ 1] 1497 	ld a,base  
      0089A6 0E 6B            [ 1] 1498 	cp a,#10 
      0089A8 01 A6            [ 1] 1499 	jrne 1$ 
      0089AA 20               [ 2] 1500 	tnzw x 
      0089AB 0D 01            [ 1] 1501 	jrpl 1$ 
      0089AD 27 06            [ 1] 1502 	cpl (SIGN,sp)
      0089AF 5A               [ 2] 1503 	negw x 	 
      00095B                       1504 1$:	
      0089B0 F7 0A 01         [ 1] 1505 	ld a,base 
      0089B3 20               [ 2] 1506 	div x,a 
      0089B4 F6 30            [ 1] 1507 	add a,#'0 
      0089B5 A1 3A            [ 1] 1508 	cp a,#'9+1 
      0089B5 CD 82            [ 1] 1509 	jrmi 2$ 
      0089B7 30 0D            [ 1] 1510 	add a,#7 
      0089B9 03 27            [ 2] 1511 2$: decw y 
      0089BB 05 A6            [ 1] 1512 	ld (y),a 
      0089BD 20               [ 2] 1513 	tnzw x 
      0089BE CD 82            [ 1] 1514 	jrne 1$ 
      0089C0 1E 5B            [ 1] 1515 	ld a,#16 
      0089C2 03 81 07         [ 1] 1516 	cp a,base 
      0089C4 26 08            [ 1] 1517 	jrne 3$
      0089C4 52 01            [ 1] 1518 	ld a,#'$
      0089C6 0F 01            [ 2] 1519 	decw y  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0089C8 90 AE            [ 1] 1520 	ld (y),a
      0089CA 17 3F            [ 2] 1521 	jra 9$ 
      0089CC 90 7F            [ 1] 1522 3$: tnz (SIGN,sp)
      0089CE C6 00            [ 1] 1523 	jreq 9$ 
      0089D0 08 A1            [ 1] 1524 	ld a,#'-
      0089D2 0A 26            [ 2] 1525 	decw y  
      0089D4 06 5D            [ 1] 1526 	ld (y),a
      000987                       1527 9$:	
      0089D6 2A               [ 1] 1528 	ldw x,y 
      0089D7 03 03 01         [ 2] 1529 	subw x,#pad+PAD_SIZE-1 
      0089DA 50               [ 2] 1530 	negw x  
      0089DB                       1531 10$:
      0089DB C6 00            [ 2] 1532 	decw y 
      0089DD 08 62            [ 1] 1533 	ld a,#SPACE 
      0089DF AB 30            [ 1] 1534 	ld (y),a
      0089E1 A1               [ 1] 1535 	incw x 
      0089E2 3A               [ 1] 1536 	ld a,xl 
      0089E3 2B 02 AB         [ 1] 1537 	cp a,tab_width
      0089E6 07 90            [ 1] 1538 	jrmi 10$ 
      000999                       1539 12$:
      0089E8 5A               [ 1] 1540     ldw x,y 
      0089E9 90 F7 5D         [ 4] 1541 	call puts  
      00099D                       1542 	_drop VSIZE 
      0089EC 26 ED            [ 2]    1     addw sp,#VSIZE 
      0089EE A6               [ 4] 1543 	ret 
                                   1544 
                                   1545 ;------------------------------------
                                   1546 ; convert integer in acc24 to string
                                   1547 ; input:
                                   1548 ;   A	  	base
                                   1549 ;	acc24	integer to convert
                                   1550 ; output:
                                   1551 ;   X  		pointer to string
                                   1552 ;------------------------------------
                           000001  1553 	SIGN=1  ; integer sign 
                           000002  1554 	BASE=2  ; numeric base 
                           000002  1555 	VSIZE=2  ;locals size
      0009A0                       1556 itoa:
      0089EF 10 C1            [ 2] 1557 	sub sp,#VSIZE
      0089F1 00 08            [ 1] 1558 	ld (BASE,sp), a  ; base
      0089F3 26 08            [ 1] 1559 	clr (SIGN,sp)    ; sign
      0089F5 A6 24            [ 1] 1560 	cp a,#10
      0089F7 90 5A            [ 1] 1561 	jrne 1$
                                   1562 	; base 10 string display with negative sign if bit 23==1
      0089F9 90 F7 20 0A 0D   [ 2] 1563 	btjf acc24,#7,1$
      0089FE 01 27            [ 1] 1564 	cpl (SIGN,sp)
      008A00 06 A6 2D         [ 4] 1565 	call neg_acc24
      0009B4                       1566 1$:
                                   1567 ; initialize string pointer 
      008A03 90 5A 90         [ 2] 1568 	ldw x,#pad+PAD_SIZE-1
      008A06 F7               [ 1] 1569 	clr (x)
      008A07                       1570 itoa_loop:
      008A07 93 1D            [ 1] 1571     ld a,(BASE,sp)
      008A09 17 3F 50         [ 4] 1572     call divu24_8 ; acc24/A 
      008A0C AB 30            [ 1] 1573     add a,#'0  ; remainder of division
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A0C 90 5A            [ 1] 1574     cp a,#'9+1
      008A0E A6 20            [ 1] 1575     jrmi 2$
      008A10 90 F7            [ 1] 1576     add a,#7 
      008A12 5C               [ 2] 1577 2$: decw x
      008A13 9F               [ 1] 1578     ld (x),a
                                   1579 	; if acc24==0 conversion done
      008A14 C1 00 26         [ 1] 1580 	ld a,acc24
      008A17 2B F3 09         [ 1] 1581 	or a,acc16
      008A19 CA 00 0A         [ 1] 1582 	or a,acc8
      008A19 93 CD            [ 1] 1583     jrne itoa_loop
                                   1584 	;conversion done, next add '$' or '-' as required
      008A1B 82 30            [ 1] 1585 	ld a,(BASE,sp)
      008A1D 5B 01            [ 1] 1586 	cp a,#16
      008A1F 81 08            [ 1] 1587 	jreq 8$
      008A20 7B 01            [ 1] 1588 	ld a,(SIGN,sp)
      008A20 52 02            [ 1] 1589     jreq 10$
      008A22 6B 02            [ 1] 1590     ld a,#'-
      008A24 0F 01            [ 2] 1591 	jra 9$ 
      008A26 A1 0A            [ 1] 1592 8$: ld a,#'$ 
      008A28 26               [ 2] 1593 9$: decw x
      008A29 0A               [ 1] 1594     ld (x),a
      0009E4                       1595 10$:
      008A2A 72 0F            [ 2] 1596 	addw sp,#VSIZE
      008A2C 00               [ 4] 1597 	ret
                                   1598 
                                   1599 ;-------------------------------------
                                   1600 ; divide uint24_t by uint8_t
                                   1601 ; used to convert uint24_t to string
                                   1602 ; input:
                                   1603 ;	acc24	dividend
                                   1604 ;   A 		divisor
                                   1605 ; output:
                                   1606 ;   acc24	quotient
                                   1607 ;   A		remainder
                                   1608 ;------------------------------------- 
                                   1609 ; offset  on sp of arguments and locals
                           000001  1610 	U8   = 1   ; divisor on stack
                           000001  1611 	VSIZE =1
      0009E7                       1612 divu24_8:
      008A2D 09               [ 2] 1613 	pushw x ; save x
      008A2E 05               [ 1] 1614 	push a 
                                   1615 	; ld dividend UU:MM bytes in X
      008A2F 03 01 CD         [ 1] 1616 	ld a, acc24
      008A32 8A               [ 1] 1617 	ld xh,a
      008A33 8F 00 09         [ 1] 1618 	ld a,acc24+1
      008A34 97               [ 1] 1619 	ld xl,a
      008A34 AE 17            [ 1] 1620 	ld a,(U8,SP) ; divisor
      008A36 3F               [ 2] 1621 	div x,a ; UU:MM/U8
      008A37 7F               [ 1] 1622 	push a  ;save remainder
      008A38 9E               [ 1] 1623 	ld a,xh
      008A38 7B 02 CD         [ 1] 1624 	ld acc24,a
      008A3B 8A               [ 1] 1625 	ld a,xl
      008A3C 67 AB 30         [ 1] 1626 	ld acc24+1,a
      008A3F A1               [ 1] 1627 	pop a
      008A40 3A               [ 1] 1628 	ld xh,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A41 2B 02 AB         [ 1] 1629 	ld a,acc24+2
      008A44 07               [ 1] 1630 	ld xl,a
      008A45 5A F7            [ 1] 1631 	ld a,(U8,sp) ; divisor
      008A47 C6               [ 2] 1632 	div x,a  ; R:LL/U8
      008A48 00 09            [ 1] 1633 	ld (U8,sp),a ; save remainder
      008A4A CA               [ 1] 1634 	ld a,xl
      008A4B 00 0A CA         [ 1] 1635 	ld acc24+2,a
      008A4E 00               [ 1] 1636 	pop a
      008A4F 0B               [ 2] 1637 	popw x
      008A50 26               [ 4] 1638 	ret
                                   1639 
                                   1640 ;------------------------------------
                                   1641 ;  two's complement acc24
                                   1642 ;  input:
                                   1643 ;		acc24 variable
                                   1644 ;  output:
                                   1645 ;		acc24 variable
                                   1646 ;-------------------------------------
      000A0F                       1647 neg_acc24:
      008A51 E6 7B 02 A1      [ 1] 1648 	cpl acc24+2
      008A55 10 27 08 7B      [ 1] 1649 	cpl acc24+1
      008A59 01 27 08 A6      [ 1] 1650 	cpl acc24
      008A5D 2D 20            [ 1] 1651 	ld a,#1
      008A5F 02 A6 24         [ 1] 1652 	add a,acc24+2
      008A62 5A F7 0A         [ 1] 1653 	ld acc24+2,a
      008A64 4F               [ 1] 1654 	clr a
      008A64 5B 02 81         [ 1] 1655 	adc a,acc24+1
      008A67 C7 00 09         [ 1] 1656 	ld acc24+1,a 
      008A67 89               [ 1] 1657 	clr a 
      008A68 88 C6 00         [ 1] 1658 	adc a,acc24 
      008A6B 09 95 C6         [ 1] 1659 	ld acc24,a 
      008A6E 00               [ 4] 1660 	ret
                                   1661 
                                   1662 
                                   1663 ;------------------------------------
                                   1664 ; read a line of text from terminal
                                   1665 ; input:
                                   1666 ;	none
                                   1667 ; local variable on stack:
                                   1668 ;	LL  line length
                                   1669 ;   RXCHAR last received chaaracte 
                                   1670 ; output:
                                   1671 ;   text in tib  buffer
                                   1672 ;------------------------------------
                                   1673 	; local variables
                           000001  1674 	LL_HB=1
                           000001  1675 	RXCHAR = 1 ; last char received
                           000002  1676 	LL = 2  ; accepted line length
                           000002  1677 	VSIZE=2 
      000A32                       1678 readln:
      008A6F 0A               [ 1] 1679 	clrw x 
      008A70 97               [ 2] 1680 	pushw x 
      008A71 7B 01 62 88      [ 2] 1681  	ldw y,#tib ; input buffer
      000A38                       1682 readln_loop:
      008A75 9E C7 00         [ 4] 1683 	call getc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008A78 09 9F            [ 1] 1684 	ld (RXCHAR,sp),a
      008A7A C7 00            [ 1] 1685 	cp a,#CR
      008A7C 0A 84            [ 1] 1686 	jrne 1$
      008A7E 95 C6 00         [ 2] 1687 	jp readln_quit
      008A81 0B 97            [ 1] 1688 1$:	cp a,#NL
      008A83 7B 01            [ 1] 1689 	jreq readln_quit
      008A85 62 6B            [ 1] 1690 	cp a,#BSP
      008A87 01 9F            [ 1] 1691 	jreq del_back
      008A89 C7 00            [ 1] 1692 	cp a,#CTRL_D
      008A8B 0B 84            [ 1] 1693 	jreq del_ln
      008A8D 85 81            [ 1] 1694 	cp a,#CTRL_R 
      008A8F 27 06            [ 1] 1695 	jreq reprint 
                                   1696 ;	cp a,#'[
                                   1697 ;	jreq ansi_seq
      000A54                       1698 final_test:
      008A8F 72 53            [ 1] 1699 	cp a,#SPACE
      008A91 00 0B            [ 1] 1700 	jrpl accept_char
      008A93 72 53            [ 2] 1701 	jra readln_loop
      000A5A                       1702 ansi_seq:
                                   1703 ;	call getc
                                   1704 ;	cp a,#'C 
                                   1705 ;	jreq rigth_arrow
                                   1706 ;	cp a,#'D 
                                   1707 ;	jreq left_arrow 
                                   1708 ;	jra final_test
      000A5A                       1709 right_arrow:
                                   1710 ;	ld a,#BSP 
                                   1711 ;	call putc 
                                   1712 ;	jra realn_loop 
      000A5A                       1713 left_arrow:
                                   1714 
                                   1715 ;	jra readln_loop
      000A5A                       1716 reprint: 
      008A95 00 0A 72 53      [ 1] 1717 	tnz count 
      008A99 00 09            [ 1] 1718 	jreq readln_loop
      008A9B A6 01            [ 1] 1719 	tnz (LL,sp)
      008A9D CB 00            [ 1] 1720 	jrne readln_loop
      008A9F 0B C7 00         [ 2] 1721 	ldw x,#tib 
      008AA2 0B 4F C9         [ 4] 1722 	call puts
      008AA5 00 0A C7 00      [ 2] 1723 	ldw y,#tib 
      008AA9 0A 4F C9         [ 1] 1724 	ld a,count 
      008AAC 00 09            [ 1] 1725 	ld (LL,sp),a
      008AAE C7 00 09 81      [ 1] 1726 	clr count 
      008AB2 0F 01            [ 1] 1727 	clr (LL_HB,sp)
      008AB2 5F 89 90         [ 2] 1728 	addw y,(LL_HB,sp)
      008AB5 AE 16            [ 2] 1729 	jra readln_loop 
      000A7E                       1730 del_ln:
      008AB7 C8 02            [ 1] 1731 	ld a,(LL,sp)
      008AB8 CD 01 CA         [ 4] 1732 	call delete
      008AB8 CD 82 27 6B      [ 2] 1733 	ldw y,#tib
      008ABC 01 A1            [ 1] 1734 	clr (y)
      008ABE 0D 26            [ 1] 1735 	clr (LL,sp)
      008AC0 03 CC            [ 2] 1736 	jra readln_loop
      000A8D                       1737 del_back:
      008AC2 8B 31            [ 1] 1738     tnz (LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008AC4 A1 0A            [ 1] 1739     jreq readln_loop
      008AC6 27 69            [ 1] 1740     dec (LL,sp)
      008AC8 A1 08            [ 2] 1741     decw y
      008ACA 27 41            [ 1] 1742     clr  (y)
      008ACC A1 04 27         [ 4] 1743     call bksp 
      008ACF 2E A1            [ 2] 1744     jra readln_loop	
      000A9C                       1745 accept_char:
      008AD1 12 27            [ 1] 1746 	ld a,#TIB_SIZE-1
      008AD3 06 02            [ 1] 1747 	cp a, (LL,sp)
      008AD4 27 96            [ 1] 1748 	jreq readln_loop
      008AD4 A1 20            [ 1] 1749 	ld a,(RXCHAR,sp)
      008AD6 2A 44            [ 1] 1750 	ld (y),a
      008AD8 20 DE            [ 1] 1751 	inc (LL,sp)
      008ADA 90 5C            [ 1] 1752 	incw y
      008ADA 90 7F            [ 1] 1753 	clr (y)
      008ADA CD 01 9E         [ 4] 1754 	call putc 
      008ADA 20 87            [ 2] 1755 	jra readln_loop
      000AB1                       1756 readln_quit:
      008ADA 72 5D            [ 1] 1757 	clr (y)
      008ADC 00 03            [ 1] 1758 	ld a,(LL,sp)
      008ADE 27 D8 0D         [ 1] 1759 	ld count,a 
      000AB8                       1760 	_drop VSIZE 
      008AE1 02 26            [ 2]    1     addw sp,#VSIZE 
      008AE3 D4 AE            [ 1] 1761 	ld a,#CR
      008AE5 16 C8 CD         [ 4] 1762 	call putc
      008AE8 82               [ 4] 1763 	ret
                                   1764 
                           000001  1765 .if DEBUG 	
                                   1766 ;----------------------------
                                   1767 ; command interface
                                   1768 ; only 3 commands:
                                   1769 ;  'q' to resume application
                                   1770 ;  'p [addr]' to print memory values 
                                   1771 ;  's addr' to print string 
                                   1772 ;----------------------------
                                   1773 ;local variable 
                           000001  1774 	PSIZE=1
                           000001  1775 	VSIZE=1 
      000AC0                       1776 cmd_itf:
      008AE9 30 90            [ 2] 1777 	sub sp,#VSIZE 
      008AEB AE 16 C8 C6      [ 1] 1778 	clr farptr 
      008AEF 00 03 6B 02      [ 1] 1779 	clr farptr+1 
      008AF3 72 5F 00 03      [ 1] 1780 	clr farptr+2  
      000ACE                       1781 repl:
      008AF7 0F 01            [ 1] 1782 	ld a,#CR 
      008AF9 72 F9 01         [ 4] 1783 	call putc 
      008AFC 20 BA            [ 1] 1784 	ld a,#'? 
      008AFE CD 01 9E         [ 4] 1785 	call putc
      008AFE 7B 02 CD 82      [ 1] 1786 	clr in.w 
      008B02 4A 90 AE 16      [ 1] 1787 	clr in 
      008B06 C8 90 7F         [ 4] 1788 	call readln
      008B09 0F 02 20 AB      [ 2] 1789 	ldw y,#tib  
      008B0D 90 F6            [ 1] 1790 	ld a,(y)
      008B0D 0D 02            [ 1] 1791 	jreq repl  
      008B0F 27 A7 0A 02      [ 1] 1792 	inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B13 90 5A 90         [ 4] 1793 	call to_upper 
      008B16 7F CD            [ 1] 1794 	cp a,#'Q 
      008B18 82 3A            [ 1] 1795 	jrne test_p
      000AF6                       1796 repl_exit:
      008B1A 20 9C 16 C8      [ 1] 1797 	clr tib 
      008B1C 72 5F 00 02      [ 1] 1798 	clr count 
      008B1C A6 4F 11 02      [ 1] 1799 	clr in 
      000B02                       1800 	_drop #VSIZE 	
      008B20 27 96            [ 2]    1     addw sp,##VSIZE 
      008B22 7B               [ 4] 1801 	ret  
      000B05                       1802 invalid:
      008B23 01 90 F7         [ 2] 1803 	ldw x,#invalid_cmd 
      008B26 0C 02 90         [ 4] 1804 	call puts 
      008B29 5C 90            [ 2] 1805 	jra repl 
      000B0D                       1806 test_p:	
      008B2B 7F CD            [ 1] 1807     cp a,#'P 
      008B2D 82 1E            [ 1] 1808 	jreq mem_peek
      008B2F 20 87            [ 1] 1809     cp a,#'S 
      008B31 26 F0            [ 1] 1810 	jrne invalid 
      000B15                       1811 print_string:	
      008B31 90 7F 7B         [ 4] 1812 	call get_token
      008B34 02 C7            [ 1] 1813 	cp a,#TK_INTGR 
      008B36 00 03            [ 1] 1814 	jrne invalid 
      008B38 5B 02 A6         [ 4] 1815 	call puts
      008B3B 0D CD 82         [ 2] 1816 	jp repl 	
      000B22                       1817 mem_peek:
      008B3E 1E 81            [ 1] 1818 	ld a,#SPACE 
      008B40 CD 0F 58         [ 4] 1819 	call skip  	 
      008B40 52 01 72 5F      [ 2] 1820 	addw y,in.w 
      008B44 00 14 72         [ 2] 1821 	ldw x,#pad 
      008B47 5F 00 15         [ 4] 1822 	call strcpy
      008B4A 72 5F 00         [ 4] 1823 	call atoi24 	
      008B4D 16 00 08         [ 1] 1824 	ld a, acc24 
      008B4E CA 00 09         [ 1] 1825 	or a,acc16 
      008B4E A6 0D CD         [ 1] 1826 	or a,acc8 
      008B51 82 1E            [ 1] 1827 	jrne 1$ 
      008B53 A6 3F            [ 2] 1828 	jra peek_byte  
      008B55 CD 82 1E         [ 2] 1829 1$:	ldw x,acc24 
      008B58 72 5F 00         [ 2] 1830 	ldw farptr,x 
      008B5B 01 72 5F         [ 1] 1831 	ld a,acc8 
      008B5E 00 02 CD         [ 1] 1832 	ld farptr+2,a 
      000B4D                       1833 peek_byte:
      008B61 8A B2 90         [ 4] 1834 	call print_farptr 
      008B64 AE 16            [ 1] 1835 	ld a,#8 
      008B66 C8 90            [ 1] 1836 	ld (PSIZE,sp),a 
      008B68 F6               [ 1] 1837 	clrw x 
      008B69 27 E3 72         [ 4] 1838 1$:	call fetchc  
      008B6C 5C               [ 2] 1839 	pushw x 
      008B6D 00 02 CD         [ 1] 1840 	ld acc8,a 
      008B70 8F               [ 1] 1841 	clrw x 
      008B71 20 A1 51         [ 2] 1842 	ldw acc24,x 
      008B74 26 17            [ 1] 1843 	ld a,#16+128
      008B76 CD 08 FC         [ 4] 1844 	call prti24
      008B76 72               [ 2] 1845 	popw x 
      008B77 5F 16            [ 1] 1846 	dec (PSIZE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B79 C8 72            [ 1] 1847 	jrne 1$ 
      008B7B 5F 00            [ 1] 1848 	ld a,#8 
      008B7D 03 72 5F         [ 1] 1849 	add a,farptr+2 
      008B80 00 02 5B         [ 1] 1850 	ld farptr+2,a
      008B83 01               [ 1] 1851 	clr a 
      008B84 81 00 14         [ 1] 1852 	adc a,farptr+1 
      008B85 C7 00 14         [ 1] 1853 	ld farptr+1,a 
      008B85 AE               [ 1] 1854 	clr a 
      008B86 8C 03 CD         [ 1] 1855 	adc a,farptr 
      008B89 82 30 20         [ 1] 1856 	ld farptr,a 
      008B8C C1 0A CE         [ 2] 1857 	jp repl  
                                   1858 
      008B8D 6E 6F 74 20 61 20 63  1859 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1860 
                                   1861 ;----------------------------
                                   1862 ; display farptr address
                                   1863 ;----------------------------
      000B92                       1864 print_farptr:
      008B8D A1 50 27         [ 1] 1865 	ld a ,farptr+2 
      008B90 11 A1 53         [ 1] 1866 	ld acc8,a 
      008B93 26 F0 13         [ 2] 1867 	ldw x,farptr 
      008B95 CF 00 08         [ 2] 1868 	ldw acc24,x 
      008B95 CD               [ 1] 1869 	clrw x 
      008B96 8D 5C            [ 1] 1870 	ld a,#16 
      008B98 A1 02 26         [ 4] 1871 	call prti24
      008B9B E9 CD            [ 1] 1872 	ld a,#SPACE 
      008B9D 82 30 CC         [ 4] 1873 	call putc 
      008BA0 8B 4E 9E         [ 4] 1874 	call putc 
      008BA2 81               [ 4] 1875 	ret
                                   1876 
                                   1877 ;------------------------------------
                                   1878 ; get byte at address farptr[X]
                                   1879 ; input:
                                   1880 ;	 farptr   address to peek
                                   1881 ;    X		  farptr index 	
                                   1882 ; output:
                                   1883 ;	 A 		  byte from memory  
                                   1884 ;    x		  incremented by 1
                                   1885 ;------------------------------------
      000BAD                       1886 fetchc: ; @C
      008BA2 A6 20 CD 8F      [ 5] 1887 	ldf a,([farptr],x)
      008BA6 D8               [ 1] 1888 	incw x
      008BA7 72               [ 4] 1889 	ret
                                   1890 
                                   1891 
                                   1892 ;------------------------------------
                                   1893 ; expect a number from command line 
                                   1894 ; next argument
                                   1895 ;  input:
                                   1896 ;	  none
                                   1897 ;  output:
                                   1898 ;    acc24   int24_t 
                                   1899 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      000BB3                       1900 number::
      008BA8 B9 00 01         [ 4] 1901 	call get_token
      008BAB AE 17 18         [ 4] 1902 	call atoi24
      008BAE CD               [ 4] 1903 	ret
                                   1904 .endif ; DEBUG 
                                   1905 
                                   1906 ;------------------------------------
                                   1907 ; parse quoted string 
                                   1908 ; input:
                                   1909 ;   Y 	pointer to tib 
                                   1910 ;   X   pointer to pad
                                   1911 ; output:
                                   1912 ;	pad   parsed string
                                   1913 ;   TOS  char* to pad  
                                   1914 ;------------------------------------
                           000001  1915 	PREV = 1
                           000002  1916 	CURR =2 
                           000002  1917 	VSIZE=2 
      000BBA                       1918 parse_quote: ; { -- addr }
      000BBA                       1919 	_vars VSIZE 
      008BAF 83 10            [ 2]    1     sub sp,#VSIZE 
      008BB1 CD               [ 1] 1920 	clr a
      008BB2 8F 2C            [ 1] 1921 1$:	ld (PREV,sp),a 
      008BB4 C6 00 09 CA      [ 1] 1922 2$:	inc in
      008BB8 00 0A CA         [ 4] 1923 	ld a,([in.w],y)
      008BBB 00 0B            [ 1] 1924 	jreq 6$
      008BBD 26 02            [ 1] 1925 	ld (CURR,sp),a 
      008BBF 20 0C            [ 1] 1926 	ld a,#'\
      008BC1 CE 00            [ 1] 1927 	cp a, (PREV,sp)
      008BC3 09 CF            [ 1] 1928 	jrne 3$
      008BC5 00 14            [ 1] 1929 	clr (PREV,sp)
      008BC7 C6 00            [ 1] 1930 	ld a,(CURR,sp)
      008BC9 0B C7            [ 4] 1931 	callr convert_escape
      008BCB 00               [ 1] 1932 	ld (x),a 
      008BCC 16               [ 1] 1933 	incw x 
      008BCD 20 E5            [ 2] 1934 	jra 2$
      000BDA                       1935 3$:
      008BCD CD 8C            [ 1] 1936 	ld a,(CURR,sp)
      008BCF 12 A6            [ 1] 1937 	cp a,#'\'
      008BD1 08 6B            [ 1] 1938 	jreq 1$
      008BD3 01 5F            [ 1] 1939 	cp a,#'"
      008BD5 CD 8C            [ 1] 1940 	jreq 5$ 
      008BD7 2D               [ 1] 1941 	ld (x),a 
      008BD8 89               [ 1] 1942 	incw x 
      008BD9 C7 00            [ 2] 1943 	jra 2$
      008BDB 0B 5F CF 00      [ 1] 1944 5$:	inc in 
      008BDF 09               [ 1] 1945 6$: clr (x)
      008BE0 A6 90 CD         [ 2] 1946 	ldw x,#pad 
      000BF0                       1947 	_drop VSIZE
      008BE3 89 7C            [ 2]    1     addw sp,#VSIZE 
      008BE5 85 0A            [ 1] 1948 	ld a,#TK_QSTR  
      008BE7 01               [ 4] 1949 	ret 
                                   1950 
                                   1951 ;---------------------------------------
                                   1952 ; called by parse_quote
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   1953 ; subtitute escaped character 
                                   1954 ; by their ASCII value .
                                   1955 ; input:
                                   1956 ;   A  character following '\'
                                   1957 ; output:
                                   1958 ;   A  substitued char or same if not valid.
                                   1959 ;---------------------------------------
      000BF5                       1960 convert_escape:
      008BE8 26 EB            [ 1] 1961 	cp a,#'a'
      008BEA A6 08            [ 1] 1962 	jrne 1$
      008BEC CB 00            [ 1] 1963 	ld a,#7
      008BEE 16               [ 4] 1964 	ret 
      008BEF C7 00            [ 1] 1965 1$: cp a,#'b'
      008BF1 16 4F            [ 1] 1966 	jrne 2$
      008BF3 C9 00            [ 1] 1967 	ld a,#8
      008BF5 15               [ 4] 1968 	ret 
      008BF6 C7 00            [ 1] 1969 2$: cp a,#'e' 
      008BF8 15 4F            [ 1] 1970     jrne 3$
      008BFA C9 00            [ 1] 1971 	ld a,#'\'
      008BFC 14               [ 4] 1972 	ret  
      008BFD C7 00            [ 1] 1973 3$: cp a,#'\'
      008BFF 14 CC            [ 1] 1974 	jrne 4$
      008C01 8B 4E            [ 1] 1975 	ld a,#'\'
      008C03 6E               [ 4] 1976 	ret 
      008C04 6F 74            [ 1] 1977 4$: cp a,#'f' 
      008C06 20 61            [ 1] 1978 	jrne 5$ 
      008C08 20 63            [ 1] 1979 	ld a,#FF 
      008C0A 6F               [ 4] 1980 	ret  
      008C0B 6D 6D            [ 1] 1981 5$: cp a,#'n' 
      008C0D 61 6E            [ 1] 1982     jrne 6$ 
      008C0F 64 0A            [ 1] 1983 	ld a,#0xa 
      008C11 00               [ 4] 1984 	ret  
      008C12 A1 72            [ 1] 1985 6$: cp a,#'r' 
      008C12 C6 00            [ 1] 1986 	jrne 7$
      008C14 16 C7            [ 1] 1987 	ld a,#0xd 
      008C16 00               [ 4] 1988 	ret  
      008C17 0B CE            [ 1] 1989 7$: cp a,#'t' 
      008C19 00 14            [ 1] 1990 	jrne 8$ 
      008C1B CF 00            [ 1] 1991 	ld a,#9 
      008C1D 09               [ 4] 1992 	ret  
      008C1E 5F A6            [ 1] 1993 8$: cp a,#'v' 
      008C20 10 CD            [ 1] 1994 	jrne 9$  
      008C22 89 7C            [ 1] 1995 	ld a,#0xb 
      008C24 A6               [ 4] 1996 9$:	ret 
                                   1997 
                                   1998 ;-------------------------
                                   1999 ; integer parser 
                                   2000 ; input:
                                   2001 ;   X 		point to pad 
                                   2002 ;   Y 		point to tib 
                                   2003 ;   A 	    first digit|'$' 
                                   2004 ; output:  
                                   2005 ;   pad     number string 
                                   2006 ;   X 		integer 
                                   2007 ;   A 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2008 ;   TOS     integer 
                                   2009 ;-------------------------
                           000001  2010 	BASE=1
                           000002  2011 	TCHAR=2 
                           000002  2012 	VSIZE=2 
      000C34                       2013 parse_integer: ; { -- n }
      008C25 20 CD            [ 1] 2014 	push #0 ; TCHAR 
      008C27 82 1E            [ 1] 2015 	cp a,#'$
      008C29 CD 82            [ 1] 2016 	jreq 1$ 
      008C2B 1E 81            [ 1] 2017 	push #10 ; BASE=10 
      008C2D 20 02            [ 2] 2018 	jra 2$ 
      008C2D 92 AF            [ 1] 2019 1$: push #16  ; BASE=16
      008C2F 00               [ 1] 2020 2$:	ld (x),a 
      008C30 14               [ 1] 2021 	incw x 
      008C31 5C 81 00 01      [ 1] 2022 	inc in 
      008C33 91 D6 00         [ 4] 2023 	ld a,([in.w],y)
      008C33 CD 8D 5C         [ 4] 2024 	call to_upper 
      008C36 CD 8F            [ 1] 2025 	ld (TCHAR,sp),a 
      008C38 2C 81 97         [ 4] 2026 	call is_digit 
      008C3A 25 ED            [ 1] 2027 	jrc 2$
      008C3A 52 02            [ 1] 2028 	ld a,#16 
      008C3C 4F 6B            [ 1] 2029 	cp a,(BASE,sp)
      008C3E 01 72            [ 1] 2030 	jrne 3$ 
      008C40 5C 00            [ 1] 2031 	ld a,(TCHAR,sp)
      008C42 02 91            [ 1] 2032 	cp a,#'A 
      008C44 D6 01            [ 1] 2033 	jrmi 3$ 
      008C46 27 24            [ 1] 2034 	cp a,#'G 
      008C48 6B 02            [ 1] 2035 	jrmi 2$ 
      008C4A A6               [ 1] 2036 3$:	clr (x)
      008C4B 5C 11 01         [ 4] 2037 	call atoi24
      008C4E 26 0A 0F         [ 2] 2038 	ldw x,acc16 
      008C51 01 7B            [ 1] 2039 	ld a,#TK_INTGR
      000C6C                       2040 	_drop VSIZE  
      008C53 02 AD            [ 2]    1     addw sp,#VSIZE 
      008C55 1F               [ 4] 2041 	ret 	
                                   2042 
                                   2043 ;-------------------------
                                   2044 ; binary integer parser 
                                   2045 ; input:
                                   2046 ;   X 		point to pad 
                                   2047 ;   Y 		point to tib 
                                   2048 ;   A 	    '%' 
                                   2049 ; output:  
                                   2050 ;   pad     number string 
                                   2051 ;   X 		integer 
                                   2052 ;   A 		TK_INTGR
                                   2053 ;   TOS     integer 
                                   2054 ;-------------------------
                           000001  2055 	BINARY=1
                           000002  2056 	VSIZE=2
      000C6F                       2057 parse_binary: ; { -- n }
      008C56 F7 5C            [ 1] 2058 	push #0
      008C58 20 E5            [ 1] 2059 	push #0
      008C5A F7               [ 1] 2060 1$: ld (x),a 
      008C5A 7B               [ 1] 2061 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C5B 02 A1 5C 27      [ 1] 2062 	inc in 
      008C5F DD A1 22         [ 4] 2063 	ld a,([in.w],y)
      008C62 27 04            [ 1] 2064 	cp a,#'0 
      008C64 F7 5C            [ 1] 2065 	jreq 2$
      008C66 20 D7            [ 1] 2066 	cp a,#'1 
      008C68 72 5C            [ 1] 2067 	jreq 2$ 
      008C6A 00 02            [ 2] 2068 	jra bin_exit 
      008C6C 7F AE            [ 1] 2069 2$: sub a,#'0	
      008C6E 17               [ 1] 2070 	rrc a 
      008C6F 18 5B            [ 1] 2071 	rlc (BINARY+1,sp)
      008C71 02 A6            [ 1] 2072 	rlc (BINARY,sp)
      008C73 07 81            [ 2] 2073 	jra 1$  
      008C75                       2074 bin_exit:
      008C75 A1               [ 1] 2075 	clr (x)
      008C76 61 26            [ 2] 2076 	ldw x,(BINARY,sp)
      008C78 03 A6            [ 1] 2077 	ld a,#TK_INTGR 	
      000C94                       2078 	_drop VSIZE 
      008C7A 07 81            [ 2]    1     addw sp,#VSIZE 
      008C7C A1               [ 4] 2079 	ret
                                   2080 
                                   2081 ;---------------------------
                                   2082 ;  token begin with a letter,
                                   2083 ;  is keyword or variable. 	
                                   2084 ; input:
                                   2085 ;   X 		point to pad 
                                   2086 ;   Y 		point to text
                                   2087 ;   A 	    first letter  
                                   2088 ; output:
                                   2089 ;   X		exec_addr|var_addr 
                                   2090 ;   A 		TK_CMD 
                                   2091 ;   pad 	keyword|var_name  
                                   2092 ;   TOS     exec_addr|var_addr 
                                   2093 ;--------------------------  
      000C97                       2094 parse_keyword: ; { -- exec_addr|var_addr}
      008C7D 62 26 03         [ 4] 2095 	call to_upper 
      008C80 A6               [ 1] 2096 	ld (x),a 
      008C81 08               [ 1] 2097 	incw x 
      008C82 81 A1 65 26      [ 1] 2098 	inc in 
      008C86 03 A6 5C         [ 4] 2099 	ld a,([in.w],y)
      008C89 81 A1 5C         [ 4] 2100 	call is_alpha 
      008C8C 26 03            [ 1] 2101 	jrc parse_keyword 
      008C8E A6               [ 1] 2102 1$: clr (x)
      008C8F 5C 81 A1 66      [ 1] 2103 	tnz pad+1 
      008C93 26 03            [ 1] 2104 	jrne 2$
                                   2105 ; one letter variable name 
      008C95 A6 0C 81         [ 1] 2106 	ld a,pad 
      008C98 A1 6E            [ 1] 2107 	sub a,#'A 
      008C9A 26               [ 1] 2108 	sll a 
      008C9B 03               [ 1] 2109 	push a 
      008C9C A6 0A            [ 1] 2110 	push #0
      008C9E 81 A1 72         [ 2] 2111 	ldw x,#vars 
      008CA1 26 03 A6         [ 2] 2112 	addw x,(1,sp) ; X=var address 
      000CBE                       2113 	_drop 2 
      008CA4 0D 81            [ 2]    1     addw sp,#2 
      008CA6 A1 74            [ 1] 2114 	ld a,#TK_VAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CA8 26 03            [ 2] 2115 	jra 4$ 
      000CC4                       2116 2$: ; check for keyword, otherwise syntax error.
      000CC4                       2117 	_ldx_dict kword_dict
      008CAA A6 09 81         [ 2]    1     ldw x,#kword_dict+2
      008CAD A1 76 26         [ 4] 2118 	call search_dict
      008CB0 02               [ 1] 2119 	tnz a
      008CB1 A6 0B            [ 1] 2120 	jrne 3$ 
      008CB3 81 06 EE         [ 2] 2121 	jp syntax_error
      008CB4 A3 15 08         [ 2] 2122 3$: cpw x,#rem  
      008CB4 4B 00            [ 1] 2123 	jrne 4$
      008CB6 A1 24 27 04 4B   [ 1] 2124 	mov in,count 
      008CBB 0A               [ 1] 2125 	clr a 
      008CBC 20               [ 4] 2126 4$:	ret  	
                                   2127 
                                   2128 
                                   2129 ;------------------------------------
                                   2130 ; Command line tokenizer
                                   2131 ; scan text for next token
                                   2132 ; move token in 'pad'
                                   2133 ; input: 
      000CDC                       2134 	none: 
                                   2135 ; use:
                                   2136 ;	Y   pointer to text
                                   2137 ;   X	pointer to pad 
                                   2138 ;   in.w   index in text buffer
                                   2139 ; output:
                                   2140 ;   A       token attribute 
                                   2141 ;   pad 	token as .asciz
                                   2142 ;   X 		token value   
                                   2143 ;------------------------------------
                                   2144 	; use to check special character 
                                   2145 	.macro _case c t  
                                   2146 	ld a,#c 
                                   2147 	cp a,(TCHAR,sp) 
                                   2148 	jrne t
                                   2149 	.endm 
                                   2150 
                           000001  2151 	TCHAR=1
                           000002  2152 	ATTRIB=2 
                           000002  2153 	VSIZE=2
      000CDC                       2154 get_token: 
      008CBD 02 4B 10         [ 2] 2155 	ldw x,in.w 
      008CC0 F7 5C 72         [ 2] 2156 	ldw in.w.saved,x 
      008CC3 5C 00 02 91      [ 2] 2157 	ldw y,basicptr   	
      008CC7 D6 01 CD         [ 1] 2158 	ld a,in 
      008CCA 8F 20 6B         [ 1] 2159 	cp a,count 
      008CCD 02 CD            [ 1] 2160 	jrmi 1$
      008CCF 8F 17            [ 1] 2161 	ld a,#TK_NONE 
      008CD1 25               [ 4] 2162 	ret 
      000CF1                       2163 1$:	
      000CF1                       2164 	_vars VSIZE
      008CD2 ED A6            [ 2]    1     sub sp,#VSIZE 
      008CD4 10 11 01         [ 2] 2165 	ldw x, #pad
      008CD7 26 0A            [ 1] 2166 	ld a,#SPACE
      008CD9 7B 02 A1         [ 4] 2167 	call skip
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008CDC 41 2B 04         [ 4] 2168 	ld a,([in.w],y)
      008CDF A1 47            [ 1] 2169 	jrne str_tst
      008CE1 2B DD 7F CD      [ 1] 2170 	clr pad 
      008CE5 8F 2C CE         [ 2] 2171 	jp token_exit ; end of line 
                                   2172 
      000D07                       2173 str_tst: ; check for quoted string  	
      008CE8 00 0A A6         [ 4] 2174 	call to_upper 
      008CEB 02 5B            [ 1] 2175 	ld (TCHAR,sp),a 
      000D0C                       2176 	_case '"' nbr_tst
      008CED 02 81            [ 1]    1 	ld a,#'"' 
      008CEF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CEF 4B 00            [ 1]    3 	jrne nbr_tst
      008CF1 4B 00 F7         [ 4] 2177 	call parse_quote
      008CF4 5C 72 5C         [ 2] 2178 	jp token_exit
      000D18                       2179 nbr_tst: ; check for number 
      008CF7 00 02            [ 1] 2180 	ld a,#'$'
      008CF9 91 D6            [ 1] 2181 	cp a,(TCHAR,sp) 
      008CFB 01 A1            [ 1] 2182 	jreq 1$
      008CFD 30 27            [ 1] 2183 	ld a,#'&
      008CFF 06 A1            [ 1] 2184 	cp a,(TCHAR,sp)
      008D01 31 27            [ 1] 2185 	jrne 0$
      008D03 02 20 09         [ 4] 2186 	call parse_binary ; expect binary integer 
      008D06 A0 30 46         [ 2] 2187 	jp token_exit 
      008D09 09 02            [ 1] 2188 0$:	ld a,(TCHAR,sp)
      008D0B 09 01 20         [ 4] 2189 	call is_digit
      008D0E E4 06            [ 1] 2190 	jrnc 3$
      008D0F CD 0C 34         [ 4] 2191 1$:	call parse_integer 
      008D0F 7F 1E 01         [ 2] 2192 	jp token_exit 
      000D37                       2193 3$: 
      000D37                       2194 	_case '(' bkslsh_tst 
      008D12 A6 02            [ 1]    1 	ld a,#'(' 
      008D14 5B 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D16 81 05            [ 1]    3 	jrne bkslsh_tst
      008D17 A6 08            [ 1] 2195 	ld a,#TK_LPAREN
      008D17 CD 8F 20         [ 2] 2196 	jp token_char   	
      000D42                       2197 bkslsh_tst:
      000D42                       2198 	_case '\',rparnt_tst
      008D1A F7 5C            [ 1]    1 	ld a,#'\' 
      008D1C 72 5C            [ 1]    2 	cp a,(TCHAR,sp) 
      008D1E 00 02            [ 1]    3 	jrne rparnt_tst
      008D20 91 D6            [ 1] 2199 	ld a,(TCHAR,sp)
      008D22 01               [ 1] 2200 	ld (x),a 
      008D23 CD               [ 1] 2201 	incw x 
      008D24 85 6A 25 EF      [ 1] 2202 	inc in 
      008D28 7F 72 5D         [ 4] 2203 	ld a,([in.w],y)
      008D2B 17               [ 1] 2204 	ld (x),a 
      008D2C 19               [ 1] 2205 	incw x 
      008D2D 26 15 C6 17      [ 1] 2206 	inc in  
      008D31 18               [ 1] 2207 	clr (x) 
      008D32 A0               [ 1] 2208 	ld xl,a 
      008D33 41 48            [ 1] 2209 	ld a,#TK_CHAR 
      008D35 88 4B 00         [ 2] 2210 	jp token_exit 
      000D60                       2211 rparnt_tst:		
      000D60                       2212 	_case ')' colon_tst 
      008D38 AE 00            [ 1]    1 	ld a,#')' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D3A 27 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008D3C FB 01            [ 1]    3 	jrne colon_tst
      008D3E 5B 02            [ 1] 2213 	ld a,#TK_RPAREN 
      008D40 A6 03 20         [ 2] 2214 	jp token_char 
      000D6B                       2215 colon_tst:
      000D6B                       2216 	_case ':' comma_tst 
      008D43 17 3A            [ 1]    1 	ld a,#':' 
      008D44 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D44 AE 9F            [ 1]    3 	jrne comma_tst
      008D46 B8 CD            [ 1] 2217 	ld a,#TK_COLON 
      008D48 91 8B 4D         [ 2] 2218 	jp token_char 
      000D76                       2219 comma_tst:
      000D76                       2220 	_case COMMA sharp_tst 
      008D4B 26 03            [ 1]    1 	ld a,#COMMA 
      008D4D CC 87            [ 1]    2 	cp a,(TCHAR,sp) 
      008D4F 6E A3            [ 1]    3 	jrne sharp_tst
      008D51 95 88            [ 1] 2221 	ld a,#TK_COMMA
      008D53 26 06 55         [ 2] 2222 	jp token_char
      000D81                       2223 sharp_tst:
      000D81                       2224 	_case SHARP dash_tst 
      008D56 00 03            [ 1]    1 	ld a,#SHARP 
      008D58 00 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D5A 4F 81            [ 1]    3 	jrne dash_tst
      008D5C A6 0B            [ 1] 2225 	ld a,#TK_SHARP
      008D5C CC 0E 84         [ 2] 2226 	jp token_char  	 	 
      000D8C                       2227 dash_tst: 	
      000D8C                       2228 	_case '-' at_tst 
      008D5C CE 00            [ 1]    1 	ld a,#'-' 
      008D5E 01 CF            [ 1]    2 	cp a,(TCHAR,sp) 
      008D60 00 12            [ 1]    3 	jrne at_tst
      008D62 90 CE            [ 1] 2229 	ld a,#TK_MINUS  
      008D64 00 04 C6         [ 2] 2230 	jp token_char 
      000D97                       2231 at_tst:
      000D97                       2232 	_case '@' qmark_tst 
      008D67 00 02            [ 1]    1 	ld a,#'@' 
      008D69 C1 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008D6B 03 2B            [ 1]    3 	jrne qmark_tst
      008D6D 03 A6            [ 1] 2233 	ld a,#TK_ARRAY 
      008D6F 00 81 84         [ 2] 2234 	jp token_char
      008D71                       2235 qmark_tst:
      000DA2                       2236 	_case '?' tick_tst 
      008D71 52 02            [ 1]    1 	ld a,#'?' 
      008D73 AE 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008D75 18 A6            [ 1]    3 	jrne tick_tst
      008D77 20 CD            [ 1] 2237 	ld a,(TCHAR,sp)
      008D79 8F               [ 1] 2238 	ld (x),a 
      008D7A D8               [ 1] 2239 	incw x 
      008D7B 91               [ 1] 2240 	clr (x)
      008D7C D6 01 26 07      [ 1] 2241 	inc in 
      008D80 72 5F            [ 1] 2242 	ld a,#TK_CMD 
      008D82 17 18 CC         [ 2] 2243 	ldw x,#print 
      008D85 8F 14 94         [ 2] 2244 	jp token_exit
      008D87                       2245 tick_tst: ; ignore comment 
      000DB9                       2246 	_case TICK plus_tst 
      008D87 CD 8F            [ 1]    1 	ld a,#TICK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008D89 20 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008D8B 01 A6            [ 1]    3 	jrne plus_tst
      008D8D 22 11            [ 1] 2247 	ld a,(TCHAR,sp)
      008D8F 01               [ 1] 2248 	ld (x),a 
      008D90 26               [ 1] 2249 	incw x 
      008D91 06               [ 1] 2250 	clr (x)
      008D92 CD 8C 3A CC 8F   [ 1] 2251 	mov in,count  
      008D97 14               [ 1] 2252 	clr a 
      008D98 CC 0E 94         [ 2] 2253 	jp token_exit 
      000DCD                       2254 plus_tst:
      000DCD                       2255 	_case '+' star_tst 
      008D98 A6 24            [ 1]    1 	ld a,#'+' 
      008D9A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D9C 27 13            [ 1]    3 	jrne star_tst
      008D9E A6 26            [ 1] 2256 	ld a,#TK_PLUS  
      008DA0 11 01 26         [ 2] 2257 	jp token_char 
      000DD8                       2258 star_tst:
      000DD8                       2259 	_case '*' slash_tst 
      008DA3 06 CD            [ 1]    1 	ld a,#'*' 
      008DA5 8C EF            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA7 CC 8F            [ 1]    3 	jrne slash_tst
      008DA9 14 7B            [ 1] 2260 	ld a,#TK_MULT 
      008DAB 01 CD 8F         [ 2] 2261 	jp token_char 
      000DE3                       2262 slash_tst: 
      000DE3                       2263 	_case '/' prcnt_tst 
      008DAE 17 24            [ 1]    1 	ld a,#'/' 
      008DB0 06 CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB2 8C B4            [ 1]    3 	jrne prcnt_tst
      008DB4 CC 8F            [ 1] 2264 	ld a,#TK_DIV 
      008DB6 14 0E 84         [ 2] 2265 	jp token_char 
      008DB7                       2266 prcnt_tst:
      000DEE                       2267 	_case '%' eql_tst 
      008DB7 A6 28            [ 1]    1 	ld a,#'%' 
      008DB9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DBB 26 05            [ 1]    3 	jrne eql_tst
      008DBD A6 08            [ 1] 2268 	ld a,#TK_MOD
      008DBF CC 8F 04         [ 2] 2269 	jp token_char  
                                   2270 ; 1 or 2 character tokens 	
      008DC2                       2271 eql_tst:
      000DF9                       2272 	_case '=' gt_tst 		
      008DC2 A6 5C            [ 1]    1 	ld a,#'=' 
      008DC4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC6 26 18            [ 1]    3 	jrne gt_tst
      008DC8 7B 01            [ 1] 2273 	ld a,#TK_EQUAL
      008DCA F7 5C 72         [ 2] 2274 	jp token_char 
      000E04                       2275 gt_tst:
      000E04                       2276 	_case '>' lt_tst 
      008DCD 5C 00            [ 1]    1 	ld a,#'>' 
      008DCF 02 91            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD1 D6 01            [ 1]    3 	jrne lt_tst
      008DD3 F7 5C            [ 1] 2277 	ld a,#TK_GT 
      008DD5 72 5C            [ 1] 2278 	ld (ATTRIB,sp),a 
      008DD7 00 02 7F 97      [ 1] 2279 	inc in 
      008DDB A6 0C CC         [ 4] 2280 	ld a,([in.w],y)
      008DDE 8F 14            [ 1] 2281 	cp a,#'=
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DE0 26 0C            [ 1] 2282 	jrne 1$
      008DE0 A6 29            [ 1] 2283 	ld a,(TCHAR,sp)
      008DE2 11               [ 1] 2284 	ld (x),a
      008DE3 01               [ 1] 2285 	incw x 
      008DE4 26 05            [ 1] 2286 	ld a,#'=
      008DE6 A6 09            [ 1] 2287 	ld (TCHAR,sp),a 
      008DE8 CC 8F            [ 1] 2288 	ld a,#TK_GE 
      008DEA 04 5F            [ 2] 2289 	jra token_char  
      008DEB A1 3C            [ 1] 2290 1$: cp a,#'<
      008DEB A6 3A            [ 1] 2291 	jrne 2$
      008DED 11 01            [ 1] 2292 	ld a,(TCHAR,sp)
      008DEF 26               [ 1] 2293 	ld (x),a
      008DF0 05               [ 1] 2294 	incw x 
      008DF1 A6 01            [ 1] 2295 	ld a,#'<	
      008DF3 CC 8F            [ 1] 2296 	ld (TCHAR,sp),a 
      008DF5 04 35            [ 1] 2297 	ld a,#TK_NE 
      008DF6 20 4F            [ 2] 2298 	jra token_char 
      008DF6 A6 2C 11 01      [ 1] 2299 2$: dec in
      008DFA 26 05            [ 1] 2300 	ld a,(ATTRIB,sp)
      008DFC A6 0A            [ 2] 2301 	jra token_char 
      000E3D                       2302 lt_tst:
      000E3D                       2303 	_case '<' other
      008DFE CC 8F            [ 1]    1 	ld a,#'<' 
      008E00 04 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E01 26 32            [ 1]    3 	jrne other
      008E01 A6 23            [ 1] 2304 	ld a,#TK_LT 
      008E03 11 01            [ 1] 2305 	ld (ATTRIB,sp),a 
      008E05 26 05 A6 0B      [ 1] 2306 	inc in 
      008E09 CC 8F 04         [ 4] 2307 	ld a,([in.w],y)
      008E0C A1 3D            [ 1] 2308 	cp a,#'=
      008E0C A6 2D            [ 1] 2309 	jrne 1$
      008E0E 11 01            [ 1] 2310 	ld a,(TCHAR,sp)
      008E10 26               [ 1] 2311 	ld (x),a 
      008E11 05 A6            [ 1] 2312 	ld a,#'=
      008E13 11 CC            [ 1] 2313 	ld (TCHAR,sp),a 
      008E15 8F 04            [ 1] 2314 	ld a,#TK_LE 
      008E17 20 27            [ 2] 2315 	jra token_char 
      008E17 A6 40            [ 1] 2316 1$: cp a,#'>
      008E19 11 01            [ 1] 2317 	jrne 2$
      008E1B 26 05            [ 1] 2318 	ld a,(TCHAR,sp)
      008E1D A6               [ 1] 2319 	ld (x),a 
      008E1E 04               [ 1] 2320 	incw x 
      008E1F CC 8F            [ 1] 2321 	ld a,#'>
      008E21 04 01            [ 1] 2322 	ld (TCHAR,sp),a 
      008E22 A6 35            [ 1] 2323 	ld a,#TK_NE 
      008E22 A6 3F            [ 2] 2324 	jra token_char 
      008E24 11 01 26 11      [ 1] 2325 2$: dec in 
      008E28 7B 01            [ 1] 2326 	ld a,(ATTRIB,sp)
      008E2A F7 5C            [ 2] 2327 	jra token_char 	
      000E75                       2328 other: ; not a special character 	 
      008E2C 7F 72            [ 1] 2329 	ld a,(TCHAR,sp)
      008E2E 5C 00 02         [ 4] 2330 	call is_alpha 
      008E31 A6 05            [ 1] 2331 	jrc 30$ 
      008E33 AE 94 83         [ 2] 2332 	jp syntax_error 
      000E7F                       2333 30$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E36 CC 8F 14         [ 4] 2334 	call parse_keyword
      008E39 20 10            [ 2] 2335 	jra token_exit 
      000E84                       2336 token_char:
      008E39 A6 27            [ 1] 2337 	ld (ATTRIB,sp),a 
      008E3B 11 01            [ 1] 2338 	ld a,(TCHAR,sp)
      008E3D 26               [ 1] 2339 	ld (x),a 
      008E3E 0E               [ 1] 2340 	incw x 
      008E3F 7B               [ 1] 2341 	clr(x)
      008E40 01 F7 5C 7F      [ 1] 2342 	inc in 
      008E44 55 00            [ 1] 2343 	ld a,(ATTRIB,sp)
      008E46 03 00 02         [ 2] 2344 	ldw x,#pad 
      000E94                       2345 token_exit:
      000E94                       2346 	_drop VSIZE 
      008E49 4F CC            [ 2]    1     addw sp,#VSIZE 
      008E4B 8F               [ 4] 2347 	ret
                                   2348 
                                   2349 
                                   2350 
                                   2351 ;------------------------------------
                                   2352 ; check if character in {'0'..'9'}
                                   2353 ; input:
                                   2354 ;    A  character to test
                                   2355 ; output:
                                   2356 ;    Carry  0 not digit | 1 digit
                                   2357 ;------------------------------------
      000E97                       2358 is_digit:
      008E4C 14 30            [ 1] 2359 	cp a,#'0
      008E4D 25 03            [ 1] 2360 	jrc 1$
      008E4D A6 2B            [ 1] 2361     cp a,#'9+1
      008E4F 11               [ 1] 2362 	ccf 
      008E50 01               [ 1] 2363 1$:	ccf 
      008E51 26               [ 4] 2364     ret
                                   2365 
                                   2366 ;------------------------------------
                                   2367 ; convert alpha to uppercase
                                   2368 ; input:
                                   2369 ;    a  character to convert
                                   2370 ; output:
                                   2371 ;    a  uppercase character
                                   2372 ;------------------------------------
      000EA0                       2373 to_upper::
      008E52 05 A6            [ 1] 2374 	cp a,#'a
      008E54 10 CC            [ 1] 2375 	jrpl 1$
      008E56 8F               [ 4] 2376 0$:	ret
      008E57 04 7A            [ 1] 2377 1$: cp a,#'z	
      008E58 22 FB            [ 1] 2378 	jrugt 0$
      008E58 A6 2A            [ 1] 2379 	sub a,#32
      008E5A 11               [ 4] 2380 	ret
                                   2381 	
                                   2382 ;------------------------------------
                                   2383 ; convert pad content in integer
                                   2384 ; input:
                                   2385 ;    pad		.asciz to convert
                                   2386 ; output:
                                   2387 ;    acc24      int24_t
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2388 ;------------------------------------
                                   2389 	; local variables
                           000001  2390 	SIGN=1 ; 1 byte, 
                           000002  2391 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2392 	TEMP=3 ; 1 byte, temporary storage
                           000003  2393 	VSIZE=3 ; 3 bytes reserved for local storage
      000EAC                       2394 atoi24:
      008E5B 01               [ 2] 2395 	pushw x ;save x
      008E5C 26 05            [ 2] 2396 	sub sp,#VSIZE
                                   2397 	; acc24=0 
      008E5E A6 20 CC 8F      [ 1] 2398 	clr acc24    
      008E62 04 5F 00 09      [ 1] 2399 	clr acc16
      008E63 72 5F 00 0A      [ 1] 2400 	clr acc8 
      008E63 A6 2F 11         [ 1] 2401 	ld a, pad 
      008E66 01 26            [ 1] 2402 	jreq atoi_exit
      008E68 05 A6            [ 1] 2403 	clr (SIGN,sp)
      008E6A 21 CC            [ 1] 2404 	ld a,#10
      008E6C 8F 04            [ 1] 2405 	ld (BASE,sp),a ; default base decimal
      008E6E AE 17 18         [ 2] 2406 	ldw x,#pad ; pointer to string to convert
      008E6E A6               [ 1] 2407 	ld a,(x)
      008E6F 25 11            [ 1] 2408 	jreq 9$  ; completed if 0
      008E71 01 26            [ 1] 2409 	cp a,#'-
      008E73 05 A6            [ 1] 2410 	jrne 1$
      008E75 22 CC            [ 1] 2411 	cpl (SIGN,sp)
      008E77 8F 04            [ 2] 2412 	jra 2$
      008E79 A1 24            [ 1] 2413 1$: cp a,#'$
      008E79 A6 3D            [ 1] 2414 	jrne 3$
      008E7B 11 01            [ 1] 2415 	ld a,#16
      008E7D 26 05            [ 1] 2416 	ld (BASE,sp),a
      008E7F A6               [ 1] 2417 2$:	incw x
      008E80 32               [ 1] 2418 	ld a,(x)
      000EDE                       2419 3$:	
      008E81 CC 8F            [ 1] 2420 	cp a,#'a
      008E83 04 02            [ 1] 2421 	jrmi 4$
      008E84 A0 20            [ 1] 2422 	sub a,#32
      008E84 A6 3E            [ 1] 2423 4$:	cp a,#'0
      008E86 11 01            [ 1] 2424 	jrmi 9$
      008E88 26 33            [ 1] 2425 	sub a,#'0
      008E8A A6 31            [ 1] 2426 	cp a,#10
      008E8C 6B 02            [ 1] 2427 	jrmi 5$
      008E8E 72 5C            [ 1] 2428 	sub a,#7
      008E90 00 02            [ 1] 2429 	cp a,(BASE,sp)
      008E92 91 D6            [ 1] 2430 	jrpl 9$
      008E94 01 A1            [ 1] 2431 5$:	ld (TEMP,sp),a
      008E96 3D 26            [ 1] 2432 	ld a,(BASE,sp)
      008E98 0C 7B 01         [ 4] 2433 	call mulu24_8
      008E9B F7 5C            [ 1] 2434 	ld a,(TEMP,sp)
      008E9D A6 3D 6B         [ 1] 2435 	add a,acc24+2
      008EA0 01 A6 33         [ 1] 2436 	ld acc24+2,a
      008EA3 20               [ 1] 2437 	clr a
      008EA4 5F A1 3C         [ 1] 2438 	adc a,acc24+1
      008EA7 26 0C 7B         [ 1] 2439 	ld acc24+1,a
      008EAA 01               [ 1] 2440 	clr a
      008EAB F7 5C A6         [ 1] 2441 	adc a,acc24
      008EAE 3C 6B 01         [ 1] 2442 	ld acc24,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008EB1 A6 35            [ 2] 2443 	jra 2$
      008EB3 20 4F            [ 1] 2444 9$:	tnz (SIGN,sp)
      008EB5 72 5A            [ 1] 2445     jreq atoi_exit
      008EB7 00 02 7B         [ 4] 2446     call neg_acc24
      000F1A                       2447 atoi_exit: 
      008EBA 02 20            [ 2] 2448 	addw sp,#VSIZE
      008EBC 47               [ 2] 2449 	popw x ; restore x
      008EBD 81               [ 4] 2450 	ret
                                   2451 
                                   2452 ;--------------------------------------
                                   2453 ; unsigned multiply uint24_t by uint8_t
                                   2454 ; use to convert numerical string to uint24_t
                                   2455 ; input:
                                   2456 ;	acc24	uint24_t 
                                   2457 ;   A		uint8_t
                                   2458 ; output:
                                   2459 ;   acc24   A*acc24
                                   2460 ;-------------------------------------
                                   2461 ; local variables offset  on sp
                           000003  2462 	U8   = 3   ; A pushed on stack
                           000002  2463 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2464 	OVFH = 1  ; multiplication overflow high byte
                           000003  2465 	VSIZE = 3
      000F1E                       2466 mulu24_8:
      008EBD A6               [ 2] 2467 	pushw x    ; save X
                                   2468 	; local variables
      008EBE 3C               [ 1] 2469 	push a     ; U8
      008EBF 11               [ 1] 2470 	clrw x     ; initialize overflow to 0
      008EC0 01               [ 2] 2471 	pushw x    ; multiplication overflow
                                   2472 ; multiply low byte.
      008EC1 26 32 A6         [ 1] 2473 	ld a,acc24+2
      008EC4 34               [ 1] 2474 	ld xl,a
      008EC5 6B 02            [ 1] 2475 	ld a,(U8,sp)
      008EC7 72               [ 4] 2476 	mul x,a
      008EC8 5C               [ 1] 2477 	ld a,xl
      008EC9 00 02 91         [ 1] 2478 	ld acc24+2,a
      008ECC D6               [ 1] 2479 	ld a, xh
      008ECD 01 A1            [ 1] 2480 	ld (OVFL,sp),a
                                   2481 ; multipy middle byte
      008ECF 3D 26 0B         [ 1] 2482 	ld a,acc24+1
      008ED2 7B               [ 1] 2483 	ld xl,a
      008ED3 01 F7            [ 1] 2484 	ld a, (U8,sp)
      008ED5 A6               [ 4] 2485 	mul x,a
                                   2486 ; add overflow to this partial product
      008ED6 3D 6B 01         [ 2] 2487 	addw x,(OVFH,sp)
      008ED9 A6               [ 1] 2488 	ld a,xl
      008EDA 36 20 27         [ 1] 2489 	ld acc24+1,a
      008EDD A1               [ 1] 2490 	clr a
      008EDE 3E 26            [ 1] 2491 	adc a,#0
      008EE0 0C 7B            [ 1] 2492 	ld (OVFH,sp),a
      008EE2 01               [ 1] 2493 	ld a,xh
      008EE3 F7 5C            [ 1] 2494 	ld (OVFL,sp),a
                                   2495 ; multiply most signficant byte	
      008EE5 A6 3E 6B         [ 1] 2496 	ld a, acc24
      008EE8 01               [ 1] 2497 	ld xl, a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008EE9 A6 35            [ 1] 2498 	ld a, (U8,sp)
      008EEB 20               [ 4] 2499 	mul x,a
      008EEC 17 72 5A         [ 2] 2500 	addw x, (OVFH,sp)
      008EEF 00               [ 1] 2501 	ld a, xl
      008EF0 02 7B 02         [ 1] 2502 	ld acc24,a
      008EF3 20 0F            [ 2] 2503     addw sp,#VSIZE
      008EF5 85               [ 2] 2504 	popw x
      008EF5 7B               [ 4] 2505 	ret
                                   2506 
                                   2507 ;------------------------------------
                                   2508 ; skip character c in text starting from 'in'
                                   2509 ; input:
                                   2510 ;	 y 		point to text buffer
                                   2511 ;    a 		character to skip
                                   2512 ; output:  
                                   2513 ;	'in' ajusted to new position
                                   2514 ;------------------------------------
                           000001  2515 	C = 1 ; local var
      000F58                       2516 skip:
      008EF6 01               [ 1] 2517 	push a
      008EF7 CD 85 6A         [ 4] 2518 1$:	ld a,([in.w],y)
      008EFA 25 03            [ 1] 2519 	jreq 2$
      008EFC CC 87            [ 1] 2520 	cp a,(C,sp)
      008EFE 6E 06            [ 1] 2521 	jrne 2$
      008EFF 72 5C 00 01      [ 1] 2522 	inc in
      008EFF CD 8D            [ 2] 2523 	jra 1$
      000F68                       2524 2$: _drop 1 
      008F01 17 20            [ 2]    1     addw sp,#1 
      008F03 10               [ 4] 2525 	ret
                                   2526 	
                                   2527 ;------------------------------
                                   2528 ; restore 'in.w' variable to 
                                   2529 ; its value before last call
                                   2530 ; to get_token.
                                   2531 ;------------------------------
      008F04                       2532 unget_token:
      008F04 6B 02 7B         [ 2] 2533 	ldw x,in.w.saved
      008F07 01 F7 5C         [ 2] 2534 	ldw in.w,x 
      008F0A 7F               [ 4] 2535 	ret 
                                   2536 
                                   2537 
                                   2538 ;******************************
                                   2539 ;  data stack manipulation
                                   2540 ;*****************************
                                   2541 ;----------------------	
                                   2542 ; push X on data stack 
                                   2543 ; input:
                                   2544 ;	X 
                                   2545 ; output:
                                   2546 ;	none 
                                   2547 ;----------------------	
      000F72                       2548 dpush:
      000F72                       2549     _dp_down
      008F0B 72 5C 00 02      [ 1]    1     dec dstkptr+1 
      008F0F 7B 02 AE 17      [ 1]    2     dec dstkptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008F13 18 CF 00 19      [ 5] 2550     ldw [dstkptr],x  
      008F14 81               [ 4] 2551 	ret 
                                   2552 
                                   2553 
                                   2554 ;----------------------	
                                   2555 ; pop data stack in X 
                                   2556 ; input:
                                   2557 ;	none
                                   2558 ; output:
                                   2559 ;	X   
                                   2560 ;----------------------	
      000F7F                       2561 dpop: 
      008F14 5B 02 81 19      [ 5] 2562     ldw x, [dstkptr]
      008F17                       2563 	_dp_up
      008F17 A1 30 25 03      [ 1]    1     inc dstkptr+1
      008F1B A1 3A 8C 8C      [ 1]    2     inc dstkptr+1
      008F1F 81               [ 4] 2564 	ret 
                                   2565 
                                   2566 ;-----------------------------
                                   2567 ; swap top 2 elements of dstack
                                   2568 ;  {n1 n2 -- n2 n1 }
                                   2569 ;-----------------------------
      008F20                       2570 dswap:
      008F20 A1 61 2A 01      [ 5] 2571 	ldw x,[dstkptr]
      008F24 81               [ 2] 2572 	pushw x 
      008F25 A1 7A 22         [ 2] 2573 	ldw x,#2 
      008F28 FB A0 20 81      [ 5] 2574 	ldw x,([dstkptr],x) 
      008F2C 72 CF 00 19      [ 5] 2575 	ldw [dstkptr],x 
      008F2C 89 52 03         [ 2] 2576 	ldw x,#2
      008F2F 72 5F            [ 2] 2577 	popw y 
      008F31 00 09 72 5F      [ 5] 2578 	ldw ([dstkptr],x),y 
      008F35 00               [ 4] 2579 	ret
                                   2580 
                                   2581 ;-----------------------------
                                   2582 ; drop TOS 
                                   2583 ;-----------------------------
      000FA6                       2584 ddrop: ; { n -- }
      000FA6                       2585 	_dp_up 
      008F36 0A 72 5F 00      [ 1]    1     inc dstkptr+1
      008F3A 0B C6 17 18      [ 1]    2     inc dstkptr+1
      008F3E 27               [ 4] 2586 	ret
                                   2587 	
                                   2588 ;-----------------------------
                                   2589 ; duplicate TOS 
                                   2590 ;  dstack: { ix...n -- ix...n n }
                                   2591 ;-----------------------------
      000FAF                       2592 ddup:
      008F3F 5A 0F 01 A6      [ 5] 2593 	ldw x,[dstkptr]
      000FB3                       2594 	_dp_down
      008F43 0A 6B 02 AE      [ 1]    1     dec dstkptr+1 
      008F47 17 18 F6 27      [ 1]    2     dec dstkptr+1
      008F4B 47 A1 2D 26      [ 5] 2595     ldw [dstkptr],x  
      008F4F 04               [ 4] 2596 	ret 
                                   2597 
                                   2598 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2599 ;----------------------------------
                                   2600 ; pick value n from dstack 
                                   2601 ; put it on TOS
                                   2602 ; dstack: {ix,..,p -- ix,...,np }
                                   2603 ;-----------------------------------
      000FC0                       2604 dpick:
      008F50 03 01 20 08      [ 5] 2605 	ldw x,[dstkptr]
      008F54 A1               [ 2] 2606 	sllw x 
      008F55 24 26 06 A6      [ 2] 2607 	addw x,dstkptr 
      008F59 10               [ 2] 2608 	ldw x,(x)
      008F5A 6B 02 5C F6      [ 5] 2609 	ldw [dstkptr],x 
      008F5E 81               [ 4] 2610 	ret
                                   2611 
                                   2612 ;---------------------------
                                   2613 ;  fetch variable in X 
                                   2614 ;  dstack:{ addr -- value }
                                   2615 ;---------------------------
      000FCF                       2616 fetch:
      008F5E A1 61 2B 02      [ 5] 2617 	ldw x,[dstkptr]
      008F62 A0               [ 2] 2618 	ldw x,(x)
      008F63 20 A1 30 2B      [ 5] 2619 	ldw [dstkptr],x
      008F67 2B               [ 4] 2620 	ret 
                                   2621 
                                   2622 ;----------------------------
                                   2623 ; store variable 
                                   2624 ; dstack: {addr value -- }
                                   2625 ;----------------------------
      000FD9                       2626 store:
      008F68 A0 30 A1         [ 4] 2627 	call dpop 
      008F6B 0A 2B            [ 1] 2628 	ldw y,x   ; y=value 
      008F6D 06 A0 07         [ 4] 2629 	call dpop 
      008F70 11               [ 2] 2630 	ldw (x),y 
      008F71 02               [ 4] 2631 	ret 
                                   2632 
                                   2633 ;---------------------------------
                                   2634 ; drop n elements from data stack 
                                   2635 ; input: 
                                   2636 ;   X 		n 
                                   2637 ; output:
                                   2638 ;   none 
                                   2639 ;-------------------------------------
      000FE3                       2640 ddrop_n:
      008F72 2A 1F            [ 2] 2641 	pushw y 
      008F74 6B 03 7B 02      [ 2] 2642 	ldw y,dstkptr 
      008F78 CD               [ 2] 2643 	sllw x 
      008F79 8F               [ 2] 2644 	pushw x 
      008F7A 9E 7B 03         [ 2] 2645 	addw y,(1,sp)
      008F7D CB 00 0B C7      [ 2] 2646 	ldw dstkptr,y 
      008F81 00               [ 2] 2647 	popw x 
      008F82 0B 4F            [ 2] 2648 	popw y
      008F84 C9               [ 4] 2649 	ret 
                                   2650 
      008F85 00 0A C7 00 0A 4F C9  2651 dstk_prompt: .asciz "\ndstack: " 
             00 09 C7
                                   2652 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2653 ; print dstack content 
                                   2654 ;---------------------------
                           000001  2655 	XSAVE=1
                           000002  2656 	VSIZE=2
      001000                       2657 dots:
      001000                       2658 	_vars VSIZE 
      008F8F 00 09            [ 2]    1     sub sp,#VSIZE 
      008F91 20 C9 0D         [ 2] 2659 	ldw x,#dstk_prompt 
      008F94 01 27 03         [ 4] 2660 	call puts
      008F97 CD 8A 8F         [ 2] 2661 	ldw x,#dstack_unf-CELL_SIZE
      008F9A 35 0A 00 07      [ 1] 2662 	mov base,#10 
      008F9A 5B 03 85         [ 2] 2663 1$:	cpw x,dstkptr 
      008F9D 81 0D            [ 1] 2664 	jrult 4$ 
      008F9E 1F 01            [ 2] 2665 	ldw (XSAVE,sp),x
      008F9E 89               [ 2] 2666 	ldw  x,(x)
      008F9F 88 5F 89         [ 4] 2667 	call print_int 
      008FA2 C6 00            [ 2] 2668 	ldw x,(XSAVE,sp)
      008FA4 0B 97 7B         [ 2] 2669 	subw x,#CELL_SIZE 
      008FA7 03 42            [ 2] 2670 	jra 1$ 
      008FA9 9F C7            [ 1] 2671 4$: ld a,#CR 
      008FAB 00 0B 9E         [ 4] 2672 	call putc 
      001026                       2673 	_drop VSIZE
      008FAE 6B 02            [ 2]    1     addw sp,#VSIZE 
      008FB0 C6               [ 1] 2674 	clr a 
      008FB1 00               [ 4] 2675 	ret
                                   2676 
      008FB2 0A 97 7B 03 42 72 FB  2677 cstk_prompt: .asciz "\nctack: "
             01 9F
                                   2678 ;--------------------------------
                                   2679 ; print cstack content
                                   2680 ;--------------------------------
                           000001  2681 	XSAVE=1
                           000002  2682 	VSIZE=2 
      001033                       2683 dotr:
      001033                       2684 	_vars VSIZE 
      008FBB C7 00            [ 2]    1     sub sp,#VSIZE 
      008FBD 0A 4F A9         [ 2] 2685 	ldw x,#cstk_prompt
      008FC0 00 6B 01         [ 4] 2686 	call puts 
      008FC3 9E               [ 1] 2687 	ldw x,sp 
      008FC4 6B 02 C6         [ 2] 2688 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008FC7 00 09            [ 2] 2689 	ldw (XSAVE,sp),x  
      008FC9 97 7B 03         [ 2] 2690 	ldw x,#RAM_SIZE-2
      008FCC 42 72 FB 01      [ 1] 2691 	mov base,#16
      001048                       2692 dotr_loop:
      008FD0 9F C7            [ 2] 2693 	cpw x,(XSAVE,sp)
      008FD2 00 09            [ 1] 2694 	jrmi 9$
      008FD4 5B               [ 2] 2695 	pushw x  
      008FD5 03               [ 2] 2696 	ldw x,(x)
      008FD6 85 81 44         [ 4] 2697 	call print_int 
      008FD8 85               [ 2] 2698 	popw x  
      008FD8 88 91 D6         [ 2] 2699 	subw x,#CELL_SIZE
      008FDB 01 27            [ 2] 2700 	jra dotr_loop 
      008FDD 0A 11            [ 1] 2701 9$:	ld a,#CR 
      008FDF 01 26 06         [ 4] 2702 	call putc 
      00105C                       2703 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008FE2 72 5C            [ 2]    1     addw sp,#VSIZE 
      008FE4 00               [ 1] 2704 	clr a 
      008FE5 02               [ 4] 2705 	ret
                                   2706 
                                   2707 
                                   2708 ;--------------------------------
                                   2709 ;  add 2 integers
                                   2710 ;  input:
                                   2711 ;    N1     on cstack 
                                   2712 ;    N2     on cstack 
                                   2713 ;  output:
                                   2714 ;    X 		n2+n1 
                                   2715 ;--------------------------------
                                   2716 	;arugments on cstack 
      001060                       2717 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001060                       2718 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001060                       2719 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001060                       2720 add:
      008FE6 20 F1            [ 2] 2721 	ldw x ,(N2,sp)
      008FE8 5B 01 81         [ 2] 2722 	addw x,(N1,sp)
      008FEB 1F 03            [ 2] 2723 	ldw (N1,sp),x 
      008FEB CE               [ 4] 2724 	ret 
                                   2725 
                                   2726 ;--------------------------------
                                   2727 ;  substract 2 ntegers
                                   2728 ;  input:
                                   2729 ;    N1     on cstack 
                                   2730 ;    N2     on cstack 
                                   2731 ;  output:
                                   2732 ;    X 		n2+n1 
                                   2733 ;--------------------------------
      001068                       2734 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001068                       2735 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001068                       2736 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001068                       2737 substract:
      008FEC 00 12            [ 2] 2738 	ldw x,(N2,sp)
      008FEE CF 00 01         [ 2] 2739 	subw x,(N1,sp)
      008FF1 81               [ 4] 2740 	ret 
                                   2741 
                                   2742 ;-------------------------------------
                                   2743 ; multiply 2 integers
                                   2744 ; product overflow is ignored unless
                                   2745 ; MATH_OVF assembler flag is set to 1
                                   2746 ; input:
                                   2747 ;  	N1      on cstack
                                   2748 ;   N2 		on cstack 
                                   2749 ; output:
                                   2750 ;	X        N1*N2 
                                   2751 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2752 	;arguments 
      008FF2                       2753 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      00106E                       2754 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      00106E                       2755 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      00106E                       2756 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      00106E                       2757 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2758    ; local variables 
                           000001  2759 	SIGN=1
                           000002  2760 	PROD=2
                           000003  2761 	VSIZE=3
      00106E                       2762 multiply:
      00106E                       2763 	_vars VSIZE 
      008FF2 72 5A            [ 2]    1     sub sp,#VSIZE 
      008FF4 00 1B            [ 1] 2764 	clr (SIGN,sp)
      008FF6 72 5A            [ 2] 2765 	ldw x,(N1_HB,sp)
      008FF8 00               [ 1] 2766 	ld a,xh  
      008FF9 1B 72            [ 1] 2767 	bcp a,#0x80 
      008FFB CF 00            [ 1] 2768 	jreq 2$
      008FFD 1A 81            [ 1] 2769 	cpl (SIGN,sp)
      008FFF 50               [ 2] 2770 	negw x 
      008FFF 72 CE            [ 2] 2771 	ldw (N1_HB,sp),x 
      009001 00 1A            [ 2] 2772 2$: ldw x,(N2_HB,sp)
      009003 72               [ 1] 2773 	ld a,xh  
      009004 5C 00            [ 1] 2774 	bcp a,#0x80 
      009006 1B 72            [ 1] 2775 	jreq 3$
      009008 5C 00            [ 1] 2776 	cpl (SIGN,sp)
      00900A 1B               [ 2] 2777 	negw x 
      00900B 81 08            [ 2] 2778 	ldw (N2_HB,sp),x 
                                   2779 ; N1_LB * N2_LB 	
      00900C 7B 07            [ 1] 2780 3$:	ld a,(N1_LB,sp)
      00900C 72               [ 1] 2781 	ld xl,a 
      00900D CE 00            [ 1] 2782 	ld a,(N2_LB,sp) 
      00900F 1A               [ 4] 2783 	mul x,a 
                           000000  2784 .if MATH_OVF 	
                                   2785 	ld a,xh 
                                   2786 	bcp a,#0x80 
                                   2787 	jreq 4$ 
                                   2788 	ld a,#ERR_MATH_OVF 
                                   2789 	jp tb_error
                                   2790 .endif 	 
      009010 89 AE            [ 2] 2791 4$:	ldw (PROD,sp),x
                                   2792 ; N1_LB * N2_HB	 
      009012 00 02            [ 1] 2793 	ld a,(N1_LB,sp) 
      009014 72               [ 1] 2794 	ld xl,a 
      009015 DE 00            [ 1] 2795 	ld a,(N2_HB,sp)
      009017 1A               [ 4] 2796 	mul x,a
      009018 72               [ 1] 2797 	ld a,xl 
      009019 CF 00            [ 1] 2798 	add a,(PROD,sp)
                           000000  2799 .if MATH_OVF 	
                                   2800 	bcp a,#0x80 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



                                   2801 	jreq 5$ 
                                   2802 	ld a,#ERR_MATH_OVF 
                                   2803 	jp tb_error
                                   2804 .endif 	 
      00901B 1A AE            [ 1] 2805 5$:	ld (PROD,sp),a 
                                   2806 ; N1_HB * N2_LB 
      00901D 00 02            [ 1] 2807 	ld a,(N1_HB,sp)
      00901F 90               [ 1] 2808 	ld xl,a 
      009020 85 72            [ 1] 2809 	ld a,(N2_LB,sp)
      009022 DF               [ 4] 2810 	mul x,a 
      009023 00               [ 1] 2811 	ld a,xl 
      009024 1A 81            [ 1] 2812 	add a,(PROD,sp)
                           000000  2813 .if MATH_OVF 	
                                   2814 	bcp a,#0x80 
                                   2815 	jreq 6$ 
                                   2816 	ld a,#ERR_MATH_OVF 
                                   2817 	jp tb_error
                                   2818 .endif 	 
      009026 6B 02            [ 1] 2819 6$:	ld (PROD,sp),a 
                                   2820 ; N1_HB * N2_HB 	
                                   2821 ; it is pointless to multiply N1_HB*N2_HB 
                                   2822 ; as this product is over 65535 or 0 
                                   2823 ;
                                   2824 ; sign adjust product
      009026 72 5C            [ 1] 2825 	tnz (SIGN,sp)
      009028 00 1B            [ 1] 2826 	jreq 7$
      00902A 72 5C            [ 2] 2827 	ldw x, (PROD,sp)
      00902C 00               [ 2] 2828 	negw x
      00902D 1B 81            [ 2] 2829 	ldw (PROD,sp),x  
      00902F                       2830 7$: 
      00902F 72 CE            [ 2] 2831 	ldw x,(PROD,sp) 
      0010B3                       2832 	_drop VSIZE 
      009031 00 1A            [ 2]    1     addw sp,#VSIZE 
      009033 72               [ 4] 2833 	ret
                                   2834 
                                   2835 ;----------------------------------
                                   2836 ;  euclidian divide n2/n1 
                                   2837 ; input:
                                   2838 ;    N2 	on cstack
                                   2839 ;    N1 	on cstack
                                   2840 ; output:
                                   2841 ;    X      n2/n1 
                                   2842 ;    Y      remainder 
                                   2843 ;----------------------------------
      0010B6                       2844 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      0010B6                       2845 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      0010B6                       2846 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2847 	; local variables
                           000001  2848 	SQUOT=1 ; sign quotient
                           000002  2849 	SDIVD=2 ; sign dividend  
                           000002  2850 	VSIZE=2
      0010B6                       2851 divide:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0010B6                       2852 	_vars VSIZE 
      009034 5A 00            [ 2]    1     sub sp,#VSIZE 
      009036 1B 72            [ 1] 2853 	clr (SQUOT,sp)
      009038 5A 00            [ 1] 2854 	clr (SDIVD,sp)
                                   2855 ; check for 0 divisor
      00903A 1B 72            [ 2] 2856 	ldw x,(DIVISR,sp)
      00903C CF               [ 2] 2857 	tnzw x 
      00903D 00 1A            [ 1] 2858     jrne 0$
      00903F 81 04            [ 1] 2859 	ld a,#ERR_DIV0 
      009040 CC 06 F0         [ 2] 2860 	jp tb_error 
                                   2861 ; check divisor sign 	
      009040 72               [ 1] 2862 0$:	ld a,xh 
      009041 CE 00            [ 1] 2863 	bcp a,#0x80 
      009043 1A 58            [ 1] 2864 	jreq 1$
      009045 72 BB            [ 1] 2865 	cpl (SQUOT,sp)
      009047 00               [ 2] 2866 	negw x 
      009048 1A FE            [ 2] 2867 1$:	ldw (DIVISR,sp),x
                                   2868 ; check dividend sign 	 
      00904A 72 CF            [ 2] 2869     ldw x,(DIVIDND,sp)
      00904C 00               [ 1] 2870 	ld a,xh 
      00904D 1A 81            [ 1] 2871 	bcp a,#0x80 
      00904F 27 05            [ 1] 2872 	jreq 2$ 
      00904F 72 CE            [ 1] 2873 	cpl (SQUOT,sp)
      009051 00 1A            [ 1] 2874 	cpl (SDIVD,sp)
      009053 FE               [ 2] 2875 	negw x 
      009054 72 CF            [ 2] 2876 2$:	ldw y,(DIVISR,sp)
      009056 00               [ 2] 2877 	divw x,y
      009057 1A 81 00 09      [ 2] 2878 	ldw acc16,y 
                                   2879 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      009059 0D 02            [ 1] 2880 	tnz (SDIVD,sp)
      009059 CD 8F            [ 1] 2881 	jreq 7$
      00905B FF 90            [ 2] 2882 	tnzw y 
      00905D 93 CD            [ 1] 2883 	jreq 7$
      00905F 8F               [ 1] 2884 	incw x
      009060 FF FF            [ 2] 2885 	ldw y,(DIVISR,sp)
      009062 81 B2 00 09      [ 2] 2886 	subw y,acc16
      009063 0D 01            [ 1] 2887 7$: tnz (SQUOT,sp)
      009063 90 89            [ 1] 2888 	jreq 9$ 	 
      009065 90               [ 2] 2889 8$:	negw x 
      0010F7                       2890 9$: 
      0010F7                       2891 	_drop VSIZE 
      009066 CE 00            [ 2]    1     addw sp,#VSIZE 
      009068 1A               [ 4] 2892 	ret 
                                   2893 
                                   2894 
                                   2895 ;----------------------------------
                                   2896 ;  remainder resulting from euclidian 
                                   2897 ;  division of n2/n1 
                                   2898 ; input:
                                   2899 ;   N1 		cstack 
                                   2900 ;   N2      cstack
                                   2901 ; output:
                                   2902 ;   X       N2%N1 
                                   2903 ;----------------------------------
                           000003  2904 	N1=3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                           000005  2905 	N2=5
                           000004  2906 	VSIZE=4
      0010FA                       2907 modulo:
      009069 58 89            [ 2] 2908 	Ldw x,(N1,sp)
      00906B 72 F9            [ 2] 2909 	ldw y,(N2,sp)
      0010FE                       2910 	_vars VSIZE 
      00906D 01 90            [ 2]    1     sub sp,#VSIZE 
      00906F CF 00            [ 2] 2911 	ldw (1,sp),x 
      009071 1A 85            [ 2] 2912 	ldw (3,sp),y 
      009073 90 85 81         [ 4] 2913 	call divide 
      009076 0A               [ 1] 2914 	ldw x,y
      001108                       2915 	_drop VSIZE 
      009077 64 73            [ 2]    1     addw sp,#VSIZE 
      009079 74               [ 4] 2916 	ret 
                                   2917 
                                   2918 ;---------------------------------
                                   2919 ; input:
                                   2920 ;	X 		dictionary entry point 
                                   2921 ;  pad		.asciz name to search 
                                   2922 ; output:
                                   2923 ;  A 		TK_CMD|TK_FUNC|TK_NONE 
                                   2924 ;  X		execution address | 0 
                                   2925 ;---------------------------------
                           000001  2926 	NLEN=1 ; cmd length 
                           000002  2927 	YSAVE=2
                           000003  2928 	VSIZE=3 
      00110B                       2929 search_dict:
      00110B                       2930 	_vars VSIZE 
      00907A 61 63            [ 2]    1     sub sp,#VSIZE 
      00907C 6B 3A            [ 1] 2931 	ldw y,x 
      00110F                       2932 search_next:	
      00907E 20 00            [ 1] 2933 	ld a,(y)
      009080 A4 7F            [ 1] 2934 	and a,#0x7f 
      009080 52 02            [ 1] 2935 	ld (NLEN,sp),a  
      009082 AE 90 76         [ 2] 2936 	ldw x,#pad 
      009085 CD 82            [ 2] 2937 	ldw (YSAVE,sp),y
      009087 30 AE            [ 1] 2938 	incw y  
      00111C                       2939 cp_loop:
      009089 17               [ 1] 2940 	ld a,(x)
      00908A 7E 35            [ 1] 2941 	jreq str_match 
      00908C 0A 00            [ 1] 2942 	tnz (NLEN,sp)
      00908E 08 C3            [ 1] 2943 	jreq no_match  
      009090 00 1A            [ 1] 2944 	cp a,(y)
      009092 25 0D            [ 1] 2945 	jrne no_match 
      009094 1F 01            [ 1] 2946 	incw y 
      009096 FE               [ 1] 2947 	incw x
      009097 CD 89            [ 1] 2948 	dec (NLEN,sp)
      009099 C4 1E            [ 2] 2949 	jra cp_loop 
      00112E                       2950 no_match:
      00909B 01 1D            [ 2] 2951 	ldw y,(YSAVE,sp) 
      00909D 00 02 20 EE      [ 2] 2952 	subw y,#2 ; move Y to link field
      0090A1 A6 0D            [ 1] 2953 	push #TK_NONE 
      0090A3 CD 82            [ 2] 2954 	ldw y,(y) ; next word link 
      0090A5 1E               [ 1] 2955 	pop a ; TK_NONE 
      0090A6 5B 02            [ 1] 2956 	jreq search_exit  ; not found  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



                                   2957 ;try next 
      0090A8 4F 81            [ 2] 2958 	jra search_next
      00113D                       2959 str_match:
      0090AA 0A 63            [ 2] 2960 	ldw y,(YSAVE,sp)
      0090AC 74 61            [ 1] 2961 	ld a,(y)
      0090AE 63 6B            [ 1] 2962 	ld (NLEN,sp),a ; needed to test bit 7 
      0090B0 3A 20            [ 1] 2963 	and a,#0x7f 
                                   2964 ; move y to procedure address field 	
      0090B2 00               [ 1] 2965 	inc a 
      0090B3 C7 00 0A         [ 1] 2966 	ld acc8,a 
      0090B3 52 02 AE 90      [ 1] 2967 	clr acc16 
      0090B7 AA CD 82 30      [ 2] 2968 	addw y,acc16 
      0090BB 96 1C            [ 2] 2969 	ldw y,(y) ; routine entry point 
      0090BD 00 07            [ 1] 2970 	ld a,(NLEN,sp)
      0090BF 1F 01            [ 1] 2971 	bcp a,#0x80 
      0090C1 AE 17            [ 1] 2972 	jreq 1$
      0090C3 FE 35            [ 1] 2973 	ld a,#TK_FUNC 
      0090C5 10 00            [ 2] 2974 	jra search_exit
      0090C7 08 05            [ 1] 2975 1$: ld a,#TK_CMD 
      0090C8                       2976 search_exit: 
      0090C8 13               [ 1] 2977 	ldw x,y ; x=routine address 
      001160                       2978 	_drop VSIZE 	 
      0090C9 01 2B            [ 2]    1     addw sp,#VSIZE 
      0090CB 0B               [ 4] 2979 	ret 
                                   2980 
                                   2981 ;---------------------
                                   2982 ; check if next token
                                   2983 ;  is of expected type 
                                   2984 ; input:
                                   2985 ;   A 		 expected token attribute
                                   2986 ;  ouput:
                                   2987 ;   none     if fail call tb_error 
                                   2988 ;--------------------
      001163                       2989 expect:
      0090CC 89               [ 1] 2990 	push a 
      0090CD FE CD 89         [ 4] 2991 	call get_token 
      0090D0 C4 85            [ 1] 2992 	cp a,(1,sp)
      0090D2 1D 00            [ 1] 2993 	jreq 1$
      0090D4 02 20 F1         [ 2] 2994 	jp syntax_error
      0090D7 A6               [ 1] 2995 1$: pop a 
      0090D8 0D               [ 4] 2996 	ret 
                                   2997 
                                   2998 
                                   2999 ;-------------------------------
                                   3000 ; parse embedded BASIC routines 
                                   3001 ; arguments list.
                                   3002 ; arg_list::=  rel[','rel]*
                                   3003 ; all arguments are of integer type
                                   3004 ; input:
                                   3005 ;   none
                                   3006 ; output:
                                   3007 ;   A 			number of arguments pushed on dstack  
                                   3008 ;--------------------------------
                           000001  3009 	ARG_CNT=1 
      001170                       3010 arg_list:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0090D9 CD 82            [ 1] 3011 	push #0  
      0090DB 1E 5B 02         [ 4] 3012 1$: call relation
      0090DE 4F 81            [ 1] 3013 	cp a,#TK_NONE 
      0090E0 27 19            [ 1] 3014 	jreq 5$
      0090E0 1E 05            [ 1] 3015 	cp a,#TK_INTGR
      0090E2 72 FB            [ 1] 3016 	jrne 4$
      0090E4 03 1F 03         [ 4] 3017 3$: call dpush 
      0090E7 81 01            [ 1] 3018     inc (ARG_CNT,sp)
      0090E8 CD 0C DC         [ 4] 3019 	call get_token 
      0090E8 1E 05            [ 1] 3020 	cp a,#TK_NONE 
      0090EA 72 F0            [ 1] 3021 	jreq 5$ 
      0090EC 03 81            [ 1] 3022 	cp a,#TK_COMMA 
      0090EE 26 02            [ 1] 3023 	jrne 4$
      0090EE 52 03            [ 2] 3024 	jra 1$ 
      0090F0 0F 01 1E         [ 4] 3025 4$:	call unget_token 
      0090F3 06               [ 1] 3026 5$:	pop a 
      0090F4 9E               [ 4] 3027 	ret 
                                   3028 
                                   3029 
                                   3030 
                                   3031 ;--------------------------------
                                   3032 ;   BASIC commnands 
                                   3033 ;--------------------------------
                                   3034 
                                   3035 ;--------------------------------
                                   3036 ;  arithmetic and relational 
                                   3037 ;  routines
                                   3038 ;  operators precedence
                                   3039 ;  highest to lowest
                                   3040 ;  operators on same row have 
                                   3041 ;  same precedence and are executed
                                   3042 ;  from left to right.
                                   3043 ;	'*','/','%'
                                   3044 ;   '-','+'
                                   3045 ;   '=','>','<','>=','<=','<>','><'
                                   3046 ;   '<>' and '><' are equivalent for not equal.
                                   3047 ;--------------------------------
                                   3048 
                                   3049 ;---------------------
                                   3050 ; return array element
                                   3051 ; address from @(expr)
                                   3052 ; input:
                                   3053 ;   A 		TK_ARRAY
                                   3054 ; output:
                                   3055 ;   A 		TK_INTGR
                                   3056 ;	X 		element address 
                                   3057 ;----------------------
      001194                       3058 get_array_element:
      0090F5 A5 80 27         [ 4] 3059 	call ddrop 
      0090F8 05 03            [ 1] 3060 	ld a,#TK_LPAREN 
      0090FA 01 50 1F         [ 4] 3061 	call expect
      0090FD 06 1E 08         [ 4] 3062 	call relation 
      009100 9E A5            [ 1] 3063 	cp a,#TK_INTGR 
      009102 80 27            [ 1] 3064 	jreq 1$
      009104 05 03 01         [ 2] 3065 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009107 50               [ 2] 3066 1$: pushw x 
      009108 1F 08            [ 1] 3067 	ld a,#TK_RPAREN 
      00910A 7B 07 97         [ 4] 3068 	call expect
                                   3069 	; check for bounds 
      00910D 7B               [ 2] 3070 	popw x   
      00910E 09 42 1F         [ 2] 3071 	cpw x,array_size 
      009111 02 7B            [ 2] 3072 	jrule 3$
                                   3073 ; bounds {1..array_size}	
      009113 07 97            [ 1] 3074 2$: ld a,#ERR_BAD_VALUE 
      009115 7B 08 42         [ 2] 3075 	jp tb_error 
      009118 9F               [ 2] 3076 3$: tnzw  x
      009119 1B 02            [ 1] 3077 	jreq 2$ 
      00911B 6B               [ 2] 3078 	sllw x 
      00911C 02               [ 2] 3079 	pushw x 
      00911D 7B 06 97         [ 2] 3080 	ldw x,array_addr  
      009120 7B 09 42         [ 2] 3081 	subw x,(1,sp)
      0011C2                       3082 	_drop 2   
      009123 9F 1B            [ 2]    1     addw sp,#2 
      009125 02 6B            [ 1] 3083 	ld a,#TK_INTGR
      009127 02               [ 4] 3084 	ret 
                                   3085 
                                   3086 ;***********************************
                                   3087 ;   expression parse,execute 
                                   3088 ;***********************************
                                   3089 ;-----------------------------------
                                   3090 ; factor ::= ['+'|'-'|e] var | @ |
                                   3091 ;			 integer | function |
                                   3092 ;			 '('relation')' 
                                   3093 ; output:
                                   3094 ;   A    token attribute 
                                   3095 ;   X 	 integer
                                   3096 ; ---------------------------------
                           000001  3097 	NEG=1
                           000001  3098 	VSIZE=1
      0011C7                       3099 factor:
      0011C7                       3100 	_vars VSIZE 
      009128 0D 01            [ 2]    1     sub sp,#VSIZE 
      00912A 27 05 1E         [ 4] 3101 	call get_token
      00912D 02 50            [ 1] 3102 	cp a,#CMD_END 
      00912F 1F 02            [ 1] 3103 	jrmi 20$
      009131 6B 01            [ 1] 3104 1$:	ld (NEG,sp),a 
      009131 1E 02            [ 1] 3105 	and a,#TK_GRP_MASK
      009133 5B 03            [ 1] 3106 	cp a,#TK_GRP_ADD 
      009135 81 04            [ 1] 3107 	jreq 2$
      009136 7B 01            [ 1] 3108 	ld a,(NEG,sp)
      009136 52 02            [ 2] 3109 	jra 4$  
      0011DC                       3110 2$:	
      009138 0F 01 0F         [ 4] 3111 	call get_token 
      0011DF                       3112 4$:	
      00913B 02 1E            [ 1] 3113 	cp a,#TK_FUNC 
      00913D 05 5D            [ 1] 3114 	jrne 5$ 
      00913F 26               [ 4] 3115 	call (x) 
      009140 05 A6            [ 2] 3116 	jra 18$ 
      0011E6                       3117 5$:
      009142 04 CC            [ 1] 3118 	cp a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009144 87 70            [ 1] 3119 	jrne 6$
      009146 9E A5            [ 2] 3120 	jra 18$
      0011EC                       3121 6$:
      009148 80 27            [ 1] 3122 	cp a,#TK_ARRAY
      00914A 03 03            [ 1] 3123 	jrne 10$
      00914C 01 50 1F         [ 4] 3124 	call get_array_element
      00914F 05               [ 2] 3125 	ldw x,(x)
      009150 1E 07            [ 2] 3126 	jra 18$ 
      0011F6                       3127 10$:
      009152 9E A5            [ 1] 3128 	cp a,#TK_VAR 
      009154 80 27            [ 1] 3129 	jrne 12$
      009156 05               [ 2] 3130 	ldw x,(x)
      009157 03 01            [ 2] 3131 	jra 18$
      0011FD                       3132 12$:			
      009159 03 02            [ 1] 3133 	cp a,#TK_LPAREN
      00915B 50 16            [ 1] 3134 	jrne 16$
      00915D 05 65 90         [ 4] 3135 	call relation
      009160 CF 00            [ 1] 3136 	ld a,#TK_RPAREN 
      009162 0A 0D 02         [ 4] 3137 	call expect
      009165 27 0B            [ 2] 3138 	jra 18$	
      00120B                       3139 16$:
      009167 90 5D 27         [ 4] 3140 	call unget_token
      00916A 07               [ 1] 3141 	clr a 
      00916B 5C 16            [ 2] 3142 	jra 20$ 
      001211                       3143 18$: 
      00916D 05 72            [ 1] 3144 	ld a,#TK_MINUS 
      00916F B2 00            [ 1] 3145 	cp a,(NEG,sp)
      009171 0A 0D            [ 1] 3146 	jrne 19$
      009173 01               [ 2] 3147 	negw x
      001218                       3148 19$:
      009174 27 01            [ 1] 3149 	ld a,#TK_INTGR
      00121A                       3150 20$:
      00121A                       3151 	_drop VSIZE
      009176 50 01            [ 2]    1     addw sp,#VSIZE 
      009177 81               [ 4] 3152 	ret
                                   3153 
                                   3154 ;-----------------------------------
                                   3155 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3156 ; output:
                                   3157 ;   A    	token attribute 
                                   3158 ;	X		integer
                                   3159 ;-----------------------------------
                           000001  3160 	N1=1
                           000003  3161 	N2=3
                           000005  3162 	MULOP=5
                           000005  3163 	VSIZE=5
      00121D                       3164 term:
      00121D                       3165 	_vars VSIZE
      009177 5B 02            [ 2]    1     sub sp,#VSIZE 
      009179 81 11 C7         [ 4] 3166 	call factor
      00917A A1 02            [ 1] 3167 	cp a,#CMD_END
      00917A 1E 03            [ 1] 3168 	jrmi term_exit
      001226                       3169 term01:	 ; check for  operator 
      00917C 16 05            [ 2] 3170 	ldw (N2,sp),x  ; save first factor 
      00917E 52 04 1F         [ 4] 3171 	call get_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009181 01 17            [ 1] 3172 	cp a,#2
      009183 03 CD            [ 1] 3173 	jrmi 9$
      009185 91 36            [ 1] 3174 0$:	ld (MULOP,sp),a
      009187 93 5B            [ 1] 3175 	and a,#TK_GRP_MASK
      009189 04 81            [ 1] 3176 	cp a,#TK_GRP_MULT
      00918B 27 07            [ 1] 3177 	jreq 1$
      00918B 52 03            [ 1] 3178 	ld a,(MULOP,sp) 
      00918D 90 93 6B         [ 4] 3179 	call unget_token 
      00918F 20 25            [ 2] 3180 	jra 9$
      00123E                       3181 1$:	; got *|/|%
      00918F 90 F6 A4         [ 4] 3182 	call factor
      009192 7F 6B            [ 1] 3183 	cp a,#TK_INTGR
      009194 01 AE            [ 1] 3184 	jreq 2$ 
      009196 17 18 17         [ 2] 3185 	jp syntax_error
      009199 02 90            [ 2] 3186 2$:	ldw (N1,sp),x  
      00919B 5C 05            [ 1] 3187 	ld a,(MULOP,sp) 
      00919C A1 20            [ 1] 3188 	cp a,#TK_MULT 
      00919C F6 27            [ 1] 3189 	jrne 3$
      00919E 1E 0D 01         [ 4] 3190 	call multiply 
      0091A1 27 0B            [ 2] 3191 	jra term01
      0091A3 90 F1            [ 1] 3192 3$: cp a,#TK_DIV 
      0091A5 26 07            [ 1] 3193 	jrne 4$ 
      0091A7 90 5C 5C         [ 4] 3194 	call divide 
      0091AA 0A 01            [ 2] 3195 	jra term01 
      0091AC 20 EE FA         [ 4] 3196 4$: call modulo
      0091AE 20 C3            [ 2] 3197 	jra term01 
      0091AE 16 02            [ 2] 3198 9$: ldw x,(N2,sp)  
      0091B0 72 A2            [ 1] 3199 	ld a,#TK_INTGR 	
      001267                       3200 term_exit:
      001267                       3201 	_drop VSIZE 
      0091B2 00 02            [ 2]    1     addw sp,#VSIZE 
      0091B4 4B               [ 4] 3202 	ret 
                                   3203 
                                   3204 ;-------------------------------
                                   3205 ;  expr ::= term [['+'|'-'] term]*
                                   3206 ;  result range {-32768..32767}
                                   3207 ;  output:
                                   3208 ;   A    token attribute 
                                   3209 ;   X	 integer   
                                   3210 ;-------------------------------
                           000001  3211 	N1=1 
                           000003  3212 	N2=3
                           000005  3213 	OP=5 
                           000005  3214 	VSIZE=5 
      00126A                       3215 expression:
      00126A                       3216 	_vars VSIZE 
      0091B5 00 90            [ 2]    1     sub sp,#VSIZE 
      0091B7 FE 84 27         [ 4] 3217 	call term
      0091BA 24 20            [ 1] 3218 	cp a,#CMD_END 
      0091BC D2 38            [ 1] 3219 	jrmi expr_exit 
      0091BD 1F 03            [ 2] 3220 0$:	ldw (N2,sp),x 
      0091BD 16 02 90         [ 4] 3221 	call get_token
      0091C0 F6 6B            [ 1] 3222 	cp a,#2
      0091C2 01 A4            [ 1] 3223 	jrmi 9$ 
      0091C4 7F 4C            [ 1] 3224 1$:	ld (OP,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0091C6 C7 00            [ 1] 3225 	and a,#TK_GRP_MASK
      0091C8 0B 72            [ 1] 3226 	cp a,#TK_GRP_ADD 
      0091CA 5F 00            [ 1] 3227 	jreq 2$ 
      0091CC 0A 72            [ 1] 3228 	ld a,(OP,sp)
      0091CE B9 00 0A         [ 4] 3229 	call unget_token
      0091D1 90 FE            [ 2] 3230 	jra 9$
      00128B                       3231 2$: 
      0091D3 7B 01 A5         [ 4] 3232 	call term
      0091D6 80 27            [ 1] 3233 	cp a,#TK_INTGR 
      0091D8 04 A6            [ 1] 3234 	jreq 3$
      0091DA 06 20 02         [ 2] 3235 	jp syntax_error
      0091DD A6 05            [ 2] 3236 3$:	ldw (N1,sp),x 
      0091DF 7B 05            [ 1] 3237 	ld a,(OP,sp)
      0091DF 93 5B            [ 1] 3238 	cp a,#TK_PLUS 
      0091E1 03 81            [ 1] 3239 	jrne 4$
      0091E3 CD 10 60         [ 4] 3240 	call add 
      0091E3 88 CD            [ 2] 3241 	jra 0$ 
      0091E5 8D 5C 11         [ 4] 3242 4$:	call substract
      0091E8 01 27            [ 2] 3243 	jra 0$
      0091EA 03 CC            [ 2] 3244 9$: ldw x,(N2,sp)
      0091EC 87 6E            [ 1] 3245 	ld a,#TK_INTGR	
      0012AB                       3246 expr_exit:
      0012AB                       3247 	_drop VSIZE 
      0091EE 84 81            [ 2]    1     addw sp,#VSIZE 
      0091F0 81               [ 4] 3248 	ret 
                                   3249 
                                   3250 ;---------------------------------------------
                                   3251 ; rel ::= expr rel_op expr
                                   3252 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3253 ;  relation return 1 | 0  for true | false 
                                   3254 ;  output:
                                   3255 ;    A 		token attribute  
                                   3256 ;	 X		1|0
                                   3257 ;---------------------------------------------
                           000001  3258 	N1=1
                           000003  3259 	N2=3
                           000005  3260 	RELOP=5
                           000005  3261 	VSIZE=5 
      0012AE                       3262 relation: 
      0012AE                       3263 	_vars VSIZE
      0091F0 4B 00            [ 2]    1     sub sp,#VSIZE 
      0091F2 CD 93 2E         [ 4] 3264 	call expression
      0091F5 A1 00            [ 1] 3265 	cp a,#CMD_END  
      0091F7 27 19            [ 1] 3266 	jrmi rel_exit 
                                   3267 	; expect rel_op or leave 
      0091F9 A1 02            [ 2] 3268 	ldw (N2,sp),x 
      0091FB 26 12 CD         [ 4] 3269 	call get_token 
      0091FE 8F F2            [ 1] 3270 	cp a,#2
      009200 0C 01            [ 1] 3271 	jrmi 9$
      0012C0                       3272 1$:	
      009202 CD 8D            [ 1] 3273 	ld (RELOP,sp),a 
      009204 5C A1            [ 1] 3274 	and a,#TK_GRP_MASK
      009206 00 27            [ 1] 3275 	cp a,#TK_GRP_RELOP 
      009208 09 A1            [ 1] 3276 	jreq 2$
      00920A 0A 26            [ 1] 3277 	ld a,(RELOP,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00920C 02 20 E3         [ 4] 3278 	call unget_token  
      00920F CD 8F            [ 2] 3279 	jra 9$
      0012CF                       3280 2$:	; expect another expression or error 
      009211 EB 84 81         [ 4] 3281 	call expression
      009214 A1 02            [ 1] 3282 	cp a,#TK_INTGR 
      009214 CD 90            [ 1] 3283 	jreq 3$
      009216 26 A6 08         [ 2] 3284 	jp syntax_error 
      009219 CD 91            [ 2] 3285 3$:	ldw (N1,sp),x 
      00921B E3 CD 93         [ 4] 3286 	call substract
      00921E 2E A1            [ 1] 3287 	jrne 4$
      009220 02 27 03 CC      [ 1] 3288 	mov acc8,#2 ; n1==n2
      009224 87 6E            [ 2] 3289 	jra 6$ 
      0012E6                       3290 4$: 
      009226 89 A6            [ 1] 3291 	jrsgt 5$  
      009228 09 CD 91 E3      [ 1] 3292 	mov acc8,#4 ; n1<2 
      00922C 85 C3            [ 2] 3293 	jra 6$
      0012EE                       3294 5$:
      00922E 00 23 23 05      [ 1] 3295 	mov acc8,#1 ; n1>n2 
      0012F2                       3296 6$:
      009232 A6               [ 1] 3297 	clrw x 
      009233 0A CC 87         [ 1] 3298 	ld a, acc8  
      009236 70 5D            [ 1] 3299 	and a,(RELOP,sp)
      009238 27               [ 1] 3300 	tnz a 
      009239 F8 58            [ 1] 3301 	jreq 10$
      00923B 89               [ 1] 3302 	incw x 
      0012FC                       3303 7$:	 
      00923C CE 00            [ 2] 3304 	jra 10$  	
      00923E 21 72            [ 2] 3305 9$: ldw x,(N2,sp)
      001300                       3306 10$:
      009240 F0 01            [ 1] 3307 	ld a,#TK_INTGR
      001302                       3308 rel_exit: 	 
      001302                       3309 	_drop VSIZE
      009242 5B 02            [ 2]    1     addw sp,#VSIZE 
      009244 A6               [ 4] 3310 	ret 
                                   3311 
                                   3312 ;--------------------------------
                                   3313 ; BASIC: SHOW 
                                   3314 ;  show content of dstack,cstack
                                   3315 ;--------------------------------
      001305                       3316 show:
      009245 02 81 07         [ 1] 3317 	ld a,base 
      009247 88               [ 1] 3318 	push a 
      009247 52 01 CD         [ 4] 3319 	call dots
      00924A 8D 5C A1         [ 4] 3320 	call dotr 
      00924D 02               [ 1] 3321 	pop a 
      00924E 2B 4A 6B         [ 1] 3322 	ld base,a 
      009251 01               [ 1] 3323 	clr a 
      009252 A4               [ 4] 3324 	ret
                                   3325 
                                   3326 ;--------------------------------------------
                                   3327 ; BASIC: HEX 
                                   3328 ; select hexadecimal base for integer print
                                   3329 ;---------------------------------------------
      001315                       3330 hex_base:
      009253 30 A1 10 27      [ 1] 3331 	mov base,#16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009257 04               [ 4] 3332 	ret 
                                   3333 
                                   3334 ;--------------------------------------------
                                   3335 ; BASIC: DEC 
                                   3336 ; select decimal base for integer print
                                   3337 ;---------------------------------------------
      00131A                       3338 dec_base:
      009258 7B 01 20 03      [ 1] 3339 	mov base,#10
      00925C 81               [ 4] 3340 	ret 
                                   3341 
                                   3342 ;------------------------
                                   3343 ; BASIC: SIZE 
                                   3344 ; return free size in text area
                                   3345 ; output:
                                   3346 ;   A 		TK_INTGR
                                   3347 ;   X 	    size integer
                                   3348 ;--------------------------
      00131F                       3349 size:
      00925C CD 8D 5C         [ 2] 3350 	ldw x,#tib 
      00925F 72 B0 00 1D      [ 2] 3351 	subw x,txtend 
      00925F A1 06            [ 1] 3352 	ld a,#TK_INTGR
      009261 26               [ 4] 3353 	ret 
                                   3354 
                                   3355 
                                   3356 ;------------------------
                                   3357 ; BASIC: UBOUND  
                                   3358 ; return array variable size 
                                   3359 ; output:
                                   3360 ;   A 		TK_INTGR
                                   3361 ;   X 	    array size 
                                   3362 ;--------------------------
      001329                       3363 ubound:
      009262 03 FD 20         [ 2] 3364 	ldw x,#tib
      009265 2B B0 00 1D      [ 2] 3365 	subw x,txtend 
      009266 54               [ 2] 3366 	srlw x 
      009266 A1 02 26         [ 2] 3367 	ldw array_size,x
      009269 02 20            [ 1] 3368 	ld a,#TK_INTGR
      00926B 25               [ 4] 3369 	ret 
                                   3370 
                                   3371 ;-----------------------------
                                   3372 ; BASIC: LET var=expr 
                                   3373 ; variable assignement 
                                   3374 ; output:
                                   3375 ;   A 		TK_NONE 
                                   3376 ;-----------------------------
      00926C                       3377 let:
      00926C A1 04 26         [ 4] 3378 	call get_token 
      00926F 06 CD            [ 1] 3379 	cp a,#TK_VAR 
      009271 92 14            [ 1] 3380 	jreq let02
      009273 FE 20 1B         [ 2] 3381 	jp syntax_error
      009276                       3382 let02:
      009276 A1 03 26         [ 4] 3383 	call dpush 
      009279 03 FE 20         [ 4] 3384 	call get_token 
      00927C 14 32            [ 1] 3385 	cp a,#TK_EQUAL
      00927D 27 03            [ 1] 3386 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00927D A1 08 26         [ 2] 3387 	jp syntax_error
      00134E                       3388 1$:	
      009280 0A CD 93         [ 4] 3389 	call relation   
      009283 2E A6            [ 1] 3390 	cp a,#TK_INTGR 
      009285 09 CD            [ 1] 3391 	jreq 2$
      009287 91 E3 20         [ 2] 3392 	jp syntax_error
      001358                       3393 2$:	
      00928A 06 93            [ 1] 3394 	ldw y,x 
      00928B CD 0F 7F         [ 4] 3395 	call dpop  
      00928B CD               [ 2] 3396 	ldw (x),y   
      00928C 8F               [ 4] 3397 	ret 
                                   3398 
                                   3399 ;----------------------------
                                   3400 ; BASIC: LIST [[start][,end]]
                                   3401 ; list program lines 
                                   3402 ; form start to end 
                                   3403 ; if empty argument list then 
                                   3404 ; list all.
                                   3405 ;----------------------------
                           000001  3406 	FIRST=1
                           000003  3407 	LAST=3 
                           000005  3408 	LN_PTR=5
                           000006  3409 	VSIZE=6 
      00135F                       3410 list:
      00135F                       3411 	_vars VSIZE
      00928D EB 4F            [ 2]    1     sub sp,#VSIZE 
      00928F 20 09 1B         [ 2] 3412 	ldw x,txtbgn 
      009291 C3 00 1D         [ 2] 3413 	cpw x,txtend 
      009291 A6 11            [ 1] 3414 	jrmi 1$
      009293 11 01 26         [ 2] 3415 	jp list_exit ; nothing to list 
      009296 01 50            [ 2] 3416 1$:	ldw (LN_PTR,sp),x 
      009298 FE               [ 2] 3417 	ldw x,(x) 
      009298 A6 02            [ 2] 3418 	ldw (FIRST,sp),x ; list from first line 
      00929A AE 7F FF         [ 2] 3419 	ldw x,#0x7fff ; biggest line number 
      00929A 5B 01            [ 2] 3420 	ldw (LAST,sp),x 
      00929C 81 11 70         [ 4] 3421 	call arg_list
      00929D 4D               [ 1] 3422 	tnz a
      00929D 52 05            [ 1] 3423 	jreq list_start 
      00929F CD 92            [ 1] 3424 	cp a,#2 
      0092A1 47 A1            [ 1] 3425 	jreq 4$
      0092A3 02 2B            [ 1] 3426 	cp a,#1 
      0092A5 41 06            [ 1] 3427 	jreq first_line 
      0092A6 CC 06 EE         [ 2] 3428 	jp syntax_error 
      0092A6 1F 03 CD         [ 4] 3429 4$:	call dswap
      00138A                       3430 first_line:
      0092A9 8D 5C A1         [ 4] 3431 	call dpop 
      0092AC 02 2B            [ 2] 3432 	ldw (FIRST,sp),x 
      0092AE 34 6B            [ 1] 3433 	cp a,#1 
      0092B0 05 A4            [ 1] 3434 	jreq lines_skip 	
      001393                       3435 last_line:
      0092B2 30 A1 20         [ 4] 3436 	call dpop 
      0092B5 27 07            [ 2] 3437 	ldw (LAST,sp),x 
      001398                       3438 lines_skip:
      0092B7 7B 05 CD         [ 2] 3439 	ldw x,txtbgn
      0092BA 8F EB            [ 2] 3440 2$:	ldw (LN_PTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0092BC 20 25 1D         [ 2] 3441 	cpw x,txtend 
      0092BE 2A 40            [ 1] 3442 	jrpl list_exit 
      0092BE CD               [ 2] 3443 	ldw x,(x) ;lineno 
      0092BF 92 47            [ 2] 3444 	cpw x,(FIRST,sp)
      0092C1 A1 02            [ 1] 3445 	jrpl list_start 
      0092C3 27 03            [ 2] 3446 	ldw x,(LN_PTR,sp) 
      0092C5 CC 87 6E         [ 2] 3447 	addw x,#2 
      0092C8 1F               [ 1] 3448 	ld a,(x)
      0092C9 01               [ 1] 3449 	incw x 
      0092CA 7B 05 A1         [ 1] 3450 	ld acc8,a 
      0092CD 20 26 05 CD      [ 1] 3451 	clr acc16 
      0092D1 90 EE 20 D1      [ 2] 3452 	addw x,acc16
      0092D5 A1 21            [ 2] 3453 	jra 2$ 
                                   3454 ; print loop
      0013BB                       3455 list_start:
      0092D7 26 05            [ 2] 3456 	ldw x,(LN_PTR,sp)
      0013BD                       3457 3$:	
      0092D9 CD 91 36         [ 4] 3458 	call prt_basic_line
      0092DC 20 C8            [ 2] 3459 	ldw x,(LN_PTR,sp)
      0092DE CD 91 7A         [ 2] 3460 	addw x,#2 
      0092E1 20               [ 1] 3461 	ld a,(x)
      0092E2 C3               [ 1] 3462 	incw x 
      0092E3 1E 03 A6         [ 1] 3463 	ld acc8,a 
      0092E6 02 5F 00 09      [ 1] 3464 	clr acc16 
      0092E7 72 BB 00 09      [ 2] 3465 	addw x,acc16
      0092E7 5B 05 81         [ 2] 3466 	cpw x,txtend 
      0092EA 2A 0B            [ 1] 3467 	jrpl list_exit
      0092EA 52 05            [ 2] 3468 	ldw (LN_PTR,sp),x
      0092EC CD               [ 2] 3469 	ldw x,(x)
      0092ED 92 9D            [ 2] 3470 	cpw x,(LAST,sp)  
      0092EF A1 02            [ 1] 3471 	jrsgt list_exit 
      0092F1 2B 38            [ 2] 3472 	ldw x,(LN_PTR,sp)
      0092F3 1F 03            [ 2] 3473 	jra 3$
      0013E2                       3474 list_exit:
      0013E2                       3475 	_drop VSIZE 
      0092F5 CD 8D            [ 2]    1     addw sp,#VSIZE 
      0092F7 5C               [ 4] 3476 	ret
                                   3477 
                                   3478 ;--------------------------
                                   3479 ; input:
                                   3480 ;   X 		pointer at line
                                   3481 ; output:
                                   3482 ;   none 
                                   3483 ;--------------------------	
      0013E5                       3484 prt_basic_line:
      0092F8 A1               [ 2] 3485 	pushw x 
      0092F9 02               [ 2] 3486 	ldw x,(x)
      0092FA 2B 2B 6B         [ 2] 3487 	ldw acc16,x 
      0092FD 05 A4 30 A1      [ 1] 3488 	clr acc24 
      009301 10 27 07         [ 2] 3489 	ldw x,#5 
      009304 7B 05            [ 1] 3490 	ld a,#10 
      009306 CD 8F EB         [ 4] 3491 	call prti24 
      009309 20               [ 2] 3492 	popw x 
      00930A 1C 00 03         [ 2] 3493 	addw x,#3
      00930B CD 01 B0         [ 4] 3494 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00930B CD 92            [ 1] 3495 	ld a,#CR 
      00930D 9D A1 02         [ 4] 3496 	call putc 
      009310 27               [ 4] 3497 	ret 	
                                   3498 
                                   3499 ;---------------------------------
                                   3500 ; BASIC: PRINT|? arg_list 
                                   3501 ; print values from argument list
                                   3502 ;----------------------------------
                           000001  3503 	COMMA=1
                           000001  3504 	VSIZE=1
      001403                       3505 print:
      009311 03 CC            [ 1] 3506 push #0 ; local variable COMMA 
      001405                       3507 reset_comma:
      009313 87 6E            [ 1] 3508 	clr (COMMA,sp)
      001407                       3509 prt_loop:
      009315 1F 01 7B         [ 4] 3510 	call relation
      009318 05 A1            [ 1] 3511 	cp a,#TK_COLON 
      00931A 10 26            [ 1] 3512 	jreq print_exit   
      00931C 05 CD            [ 1] 3513 	cp a,#TK_INTGR 
      00931E 90 E0            [ 1] 3514 	jrne 0$ 
      009320 20 D1 CD         [ 4] 3515 	call print_int 
      009323 90 E8            [ 2] 3516 	jra reset_comma
      001417                       3517 0$: 	
      009325 20 CC 1E         [ 4] 3518 	call get_token
      009328 03 A6            [ 1] 3519 	cp a,#TK_NONE 
      00932A 02 40            [ 1] 3520 	jreq print_exit 
      00932B A1 07            [ 1] 3521 1$:	cp a,#TK_QSTR
      00932B 5B 05            [ 1] 3522 	jrne 2$   
      00932D 81 01 B0         [ 4] 3523 	call puts 
      00932E 20 DE            [ 2] 3524 	jra reset_comma
      00932E 52 05            [ 1] 3525 2$: cp a,#TK_CHAR 
      009330 CD 92            [ 1] 3526 	jrne 3$
      009332 EA               [ 1] 3527 	ld a,xl 
      009333 A1 02 2B         [ 4] 3528 	call putc 
      009336 4B 1F            [ 2] 3529 	jra reset_comma 
      001431                       3530 3$: 	
      009338 03 CD            [ 1] 3531 	cp a,#TK_FUNC 
      00933A 8D 5C            [ 1] 3532 	jrne 4$ 
      00933C A1               [ 4] 3533 	call (x)
      00933D 02 2B 3E         [ 4] 3534 	call print_int 
      009340 20 CA            [ 2] 3535 	jra reset_comma 
      00143B                       3536 4$: 
      009340 6B 05            [ 1] 3537 	cp a,#TK_COMMA 
      009342 A4 30            [ 1] 3538 	jrne 5$
      009344 A1 30            [ 1] 3539 	cpl (COMMA,sp) 
      009346 27 07 7B         [ 2] 3540 	jp prt_loop   
      001444                       3541 5$: 
      009349 05 CD            [ 1] 3542 	cp a,#TK_SHARP
      00934B 8F EB            [ 1] 3543 	jrne 7$
      00934D 20 2F DC         [ 4] 3544 	call get_token
      00934F A1 02            [ 1] 3545 	cp a,#TK_INTGR 
      00934F CD 92            [ 1] 3546 	jreq 6$
      009351 EA A1 02         [ 2] 3547 	jp syntax_error 
      001452                       3548 6$:
      009354 27               [ 1] 3549 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009355 03 CC            [ 1] 3550 	and a,#15 
      009357 87 6E 1F         [ 1] 3551 	ld tab_width,a 
      00935A 01 CD 90         [ 2] 3552 	jp reset_comma 
      00145B                       3553 7$:	
      00935D E8 26 06         [ 4] 3554 	call unget_token
      00145E                       3555 print_exit:
      009360 35 02            [ 1] 3556 	tnz (COMMA,sp)
      009362 00 0B            [ 1] 3557 	jrne 9$
      009364 20 0C            [ 1] 3558 	ld a,#CR 
      009366 CD 01 9E         [ 4] 3559     call putc 
      001467                       3560 9$:	_drop VSIZE 
      009366 2C 06            [ 2]    1     addw sp,#VSIZE 
      009368 35               [ 4] 3561 	ret 
                                   3562 
                                   3563 ;----------------------
                                   3564 ; 'save_context' and
                                   3565 ; 'rest_context' must be 
                                   3566 ; called at the same 
                                   3567 ; call stack depth 
                                   3568 ; i.e. SP must have the 
                                   3569 ; save value at  
                                   3570 ; entry point of both 
                                   3571 ; routine. 
                                   3572 ;---------------------
                           000006  3573 	CTXT_SIZE=6 ; size of saved data 
                                   3574 ;--------------------
                                   3575 ; save current BASIC
                                   3576 ; interpreter context 
                                   3577 ; on cstack 
                                   3578 ;--------------------
      00146A                       3579 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00146A                       3580 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      00146A                       3581 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      00146A                       3582 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      00146A                       3583 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      00146A                       3584 save_context:
      009369 04 00 0B         [ 2] 3585 	ldw x,basicptr 
      00936C 20 04            [ 2] 3586 	ldw (BPTR,sp),x
      00936E CE 00 05         [ 2] 3587 	ldw x,lineno 
      00936E 35 01            [ 2] 3588 	ldw (LNO,sp),x 
      009370 00 0B 01         [ 1] 3589 	ld a,in 
      009372 6B 07            [ 1] 3590 	ld (IN,sp),a
      009372 5F C6 00         [ 1] 3591 	ld a,count 
      009375 0B 14            [ 1] 3592 	ld (CNT,sp),a  
      009377 05               [ 4] 3593 	ret
                                   3594 
                                   3595 ;-----------------------
                                   3596 ; restore previously saved 
                                   3597 ; BASIC interpreter context 
                                   3598 ; from cstack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3599 ;-------------------------
      00147F                       3600 rest_context:
      009378 4D 27            [ 2] 3601 	ldw x,(BPTR,sp)
      00937A 05 5C 03         [ 2] 3602 	ldw basicptr,x 
      00937C 1E 05            [ 2] 3603 	ldw x,(LNO,sp)
      00937C 20 02 1E         [ 2] 3604 	ldw lineno,x 
      00937F 03 07            [ 1] 3605 	ld a,(IN,sp)
      009380 C7 00 01         [ 1] 3606 	ld in,a
      009380 A6 02            [ 1] 3607 	ld a,(CNT,sp)
      009382 C7 00 02         [ 1] 3608 	ld count,a  
      009382 5B               [ 4] 3609 	ret
                                   3610 
                                   3611 ;------------------------------------------
                                   3612 ; BASIC: INPUT [string],var[,[string],var]
                                   3613 ; input value in variables 
                                   3614 ; [string] optionally can be used as prompt 
                                   3615 ;-----------------------------------------
                           000001  3616 	CX_BPTR=1
                           000003  3617 	CX_LNO=3
                           000004  3618 	CX_IN=4
                           000005  3619 	CX_CNT=5
                           000006  3620 	SKIP=6
                           000007  3621 	VSIZE=7
      001494                       3622 input_var:
      009383 05 81 00 24 05   [ 2] 3623 	btjt flags,#FRUN,1$ 
      009385 A6 06            [ 1] 3624 	ld a,#ERR_RUN_ONLY 
      009385 C6 00 08         [ 2] 3625 	jp tb_error 
      00149E                       3626 1$:	_vars VSIZE 
      009388 88 CD            [ 2]    1     sub sp,#VSIZE 
      0014A0                       3627 input_loop:
      00938A 90 80            [ 1] 3628 	clr (SKIP,sp)
      00938C CD 90 B3         [ 4] 3629 	call get_token 
      00938F 84 C7            [ 1] 3630 	cp a,#TK_NONE 
      009391 00 08            [ 1] 3631 	jreq input_exit 
      009393 4F 81            [ 1] 3632 	cp a,#TK_QSTR 
      009395 26 08            [ 1] 3633 	jrne 1$ 
      009395 35 10 00         [ 4] 3634 	call puts 
      009398 08 81            [ 1] 3635 	cpl (SKIP,sp)
      00939A CD 0C DC         [ 4] 3636 	call get_token 
      00939A 35 0A            [ 1] 3637 1$: cp a,#TK_VAR  
      00939C 00 08            [ 1] 3638 	jreq 2$ 
      00939E 81 06 EE         [ 2] 3639 	jp syntax_error
      00939F CD 0F 72         [ 4] 3640 2$:	call dpush 
      00939F AE 16            [ 1] 3641 	tnz (SKIP,sp)
      0093A1 C8 72            [ 1] 3642 	jrne 21$ 
      0093A3 B0 00            [ 1] 3643 	ld a,#':
      0093A5 1E A6 02         [ 1] 3644 	ld pad+1,a 
      0093A8 81 5F 17 1A      [ 1] 3645 	clr pad+2
      0093A9 AE 17 18         [ 2] 3646 	ldw x,#pad 
      0093A9 AE 16 C8         [ 4] 3647 	call puts   
      0014D2                       3648 21$:
      0093AC 72 B0 00         [ 4] 3649 	call save_context 
      0093AF 1E 54 CF         [ 2] 3650 	ldw x,#tib 
      0093B2 00 23 A6         [ 2] 3651 	ldw basicptr,x  
      0093B5 02 81 00 02      [ 1] 3652 	clr count  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      0093B7 CD 0A 32         [ 4] 3653 	call readln 
      0093B7 CD 8D 5C A1      [ 1] 3654 	clr in 
      0093BB 03 27 03         [ 4] 3655 	call relation 
      0093BE CC 87            [ 1] 3656 	cp a,#TK_INTGR
      0093C0 6E 03            [ 1] 3657 	jreq 3$ 
      0093C1 CC 06 EE         [ 2] 3658 	jp syntax_error
      0093C1 CD 8F F2         [ 4] 3659 3$: call dpush 
      0093C4 CD 8D 5C         [ 4] 3660 	call store 
      0093C7 A1 32 27         [ 4] 3661 	call rest_context
      0093CA 03 CC 87         [ 4] 3662 	call get_token 
      0093CD 6E 0A            [ 1] 3663 	cp a,#TK_COMMA 
      0093CE 26 02            [ 1] 3664 	jrne 4$
      0093CE CD 93            [ 2] 3665 	jra input_loop 
      0093D0 2E A1 02         [ 4] 3666 4$:	call unget_token 
      001505                       3667 input_exit:
      001505                       3668 	_drop VSIZE 
      0093D3 27 03            [ 2]    1     addw sp,#VSIZE 
      0093D5 CC               [ 4] 3669 	ret 
                                   3670 
                                   3671 
                                   3672 ;---------------------
                                   3673 ; BASIC: REMARK | ' 
                                   3674 ; begin a comment 
                                   3675 ; comment are ignored 
                                   3676 ; use ' insted of REM 
                                   3677 ; This is never called
                                   3678 ; because get_token 
                                   3679 ; take care of skipping
                                   3680 ; comment. but required
                                   3681 ; for future use of 
                                   3682 ; keyword reverse search.  
                                   3683 ;---------------------- 
      001508                       3684 rem: 
      0093D6 87               [ 4] 3685 	ret 
                                   3686 
                                   3687 ;---------------------
                                   3688 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3689 ; read in loop 'addr'  
                                   3690 ; apply & 'mask' to value 
                                   3691 ; loop while result==0.  
                                   3692 ; if 'xor_mask' given 
                                   3693 ; apply ^ in second  
                                   3694 ; loop while result==0 
                                   3695 ;---------------------
                           000001  3696 	XMASK=1 
                           000002  3697 	MASK=2
                           000003  3698 	ADDR=3
                           000004  3699 	VSIZE=4
      001509                       3700 wait: 
      001509                       3701 	_vars VSIZE
      0093D7 6E 04            [ 2]    1     sub sp,#VSIZE 
      0093D8 0F 01            [ 1] 3702 	clr (XMASK,sp) 
      0093D8 90 93 CD         [ 4] 3703 	call arg_list 
      0093DB 8F FF            [ 1] 3704 	cp a,#2
      0093DD FF 81            [ 1] 3705 	jruge 0$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0093DF CC 06 EE         [ 2] 3706 	jp syntax_error 
      0093DF 52 06            [ 1] 3707 0$:	cp a,#3
      0093E1 CE 00            [ 1] 3708 	jrult 1$
      0093E3 1C C3 00         [ 4] 3709 	call dpop 
      0093E6 1E               [ 1] 3710 	ld a,xl
      0093E7 2B 03            [ 1] 3711 	ld (XMASK,sp),a 
      0093E9 CC 94 62         [ 4] 3712 1$: call dpop ; mask 
      0093EC 1F               [ 1] 3713 	ld a,xl 
      0093ED 05 FE            [ 1] 3714 	ld (MASK,sp),a 
      0093EF 1F 01 AE         [ 4] 3715 	call dpop ; address 
      0093F2 7F               [ 1] 3716 2$:	ld a,(x)
      0093F3 FF 1F            [ 1] 3717 	and a,(MASK,sp)
      0093F5 03 CD            [ 1] 3718 	xor a,(XMASK,sp)
      0093F7 91 F0            [ 1] 3719 	jreq 2$ 
      001531                       3720 	_drop VSIZE 
      0093F9 4D 27            [ 2]    1     addw sp,#VSIZE 
      0093FB 3F               [ 4] 3721 	ret 
                                   3722 
                                   3723 ;---------------------
                                   3724 ; BASIC: BSET addr,mask
                                   3725 ; set bits at 'addr' corresponding 
                                   3726 ; to those of 'mask' that are at 1.
                                   3727 ; arguments:
                                   3728 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3729 ;   mask        mask|addr
                                   3730 ; output:
                                   3731 ;	none 
                                   3732 ;--------------------------
      001534                       3733 bit_set:
      0093FC A1 02 27         [ 4] 3734 	call arg_list 
      0093FF 07 A1            [ 1] 3735 	cp a,#2	 
      009401 01 27            [ 1] 3736 	jreq 1$ 
      009403 06 CC 87         [ 2] 3737 	jp syntax_error
      00153E                       3738 1$: 
      009406 6E CD 90         [ 4] 3739 	call dpop ; mask 
      009409 0C               [ 1] 3740 	ld a,xl 
      00940A CD 0F 7F         [ 4] 3741 	call dpop ; addr  
      00940A CD               [ 1] 3742 	or a,(x)
      00940B 8F               [ 1] 3743 	ld (x),a
      00940C FF               [ 4] 3744 	ret 
                                   3745 
                                   3746 ;---------------------
                                   3747 ; BASIC: BRES addr,mask
                                   3748 ; reset bits at 'addr' corresponding 
                                   3749 ; to those of 'mask' that are at 1.
                                   3750 ; arguments:
                                   3751 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3752 ;   mask	    ~mask&*addr  
                                   3753 ; output:
                                   3754 ;	none 
                                   3755 ;--------------------------
      001548                       3756 bit_reset:
      00940D 1F 01 A1         [ 4] 3757 	call arg_list 
      009410 01 27            [ 1] 3758 	cp a,#2  
      009412 05 03            [ 1] 3759 	jreq 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      009413 CC 06 EE         [ 2] 3760 	jp syntax_error
      001552                       3761 1$: 
      009413 CD 8F FF         [ 4] 3762 	call dpop ; mask 
      009416 1F               [ 1] 3763 	ld a,xl 
      009417 03               [ 1] 3764 	cpl a 
      009418 CD 0F 7F         [ 4] 3765 	call dpop ; addr  
      009418 CE               [ 1] 3766 	and a,(x)
      009419 00               [ 1] 3767 	ld (x),a 
      00941A 1C               [ 4] 3768 	ret 
                                   3769 
                                   3770 ;---------------------
                                   3771 ; BASIC: BRES addr,mask
                                   3772 ; toggle bits at 'addr' corresponding 
                                   3773 ; to those of 'mask' that are at 1.
                                   3774 ; arguments:
                                   3775 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3776 ;   mask	    mask^*addr  
                                   3777 ; output:
                                   3778 ;	none 
                                   3779 ;--------------------------
      00155D                       3780 bit_toggle:
      00941B 1F 05 C3         [ 4] 3781 	call arg_list 
      00941E 00 1E            [ 1] 3782 	cp a,#2 
      009420 2A 40            [ 1] 3783 	jreq 1$ 
      009422 FE 13 01         [ 2] 3784 	jp syntax_error
      009425 2A 14 1E         [ 4] 3785 1$: call dpop ; mask 
      009428 05               [ 1] 3786 	ld a,xl 
      009429 1C 00 02         [ 4] 3787 	call dpop ; addr  
      00942C F6               [ 1] 3788 	xor a,(x)
      00942D 5C               [ 1] 3789 	ld (x),a 
      00942E C7               [ 4] 3790 	ret 
                                   3791 
                                   3792 
                                   3793 ;--------------------
                                   3794 ; BASIC: POKE addr,byte
                                   3795 ; put a byte at addr 
                                   3796 ;--------------------
      001571                       3797 poke:
      00942F 00 0B 72         [ 4] 3798 	call arg_list 
      009432 5F 00            [ 1] 3799 	cp a,#2
      009434 0A 72            [ 1] 3800 	jreq 1$
      009436 BB 00 0A         [ 2] 3801 	jp syntax_error
      00157B                       3802 1$:	
      009439 20 E0 7F         [ 4] 3803 	call dpop 
      00943B 9F               [ 1] 3804     ld a,xl 
      00943B 1E 05 7F         [ 4] 3805 	call dpop 
      00943D F7               [ 1] 3806 	ld (x),a 
      00943D CD               [ 4] 3807 	ret 
                                   3808 
                                   3809 ;-----------------------
                                   3810 ; BASIC: PEEK(addr)
                                   3811 ; get the byte at addr 
                                   3812 ; input:
                                   3813 ;	none 
                                   3814 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3815 ;	X 		value 
                                   3816 ;-----------------------
      001584                       3817 peek:
      00943E 94 65            [ 1] 3818 	ld a,#TK_LPAREN 
      009440 1E 05 1C         [ 4] 3819 	call expect 
      009443 00 02 F6         [ 4] 3820 	call arg_list
      009446 5C C7            [ 1] 3821 	cp a,#1 
      009448 00 0B            [ 1] 3822 	jreq 1$
      00944A 72 5F 00         [ 2] 3823 	jp syntax_error
      00944D 0A 72            [ 1] 3824 1$:	ld a,#TK_RPAREN 
      00944F BB 00 0A         [ 4] 3825 	call expect 
      009452 C3 00 1E         [ 4] 3826 	call dpop 
      009455 2A               [ 1] 3827 	ld a,(x)
      009456 0B               [ 1] 3828 	clrw x 
      009457 1F               [ 1] 3829 	ld xl,a 
      009458 05 FE            [ 1] 3830 	ld a,#TK_INTGR
      00945A 13               [ 4] 3831 	ret 
                                   3832 
      0015A1                       3833 if: 
      00945B 03 2C 04         [ 4] 3834 	call relation 
      00945E 1E 05            [ 1] 3835 	cp a,#TK_INTGR
      009460 20 DB            [ 1] 3836 	jreq 1$ 
      009462 CC 06 EE         [ 2] 3837 	jp syntax_error
      009462 5B               [ 1] 3838 1$:	clr a 
      009463 06               [ 2] 3839 	tnzw x 
      009464 81 05            [ 1] 3840 	jrne 9$  
                                   3841 ;skip to next line
      009465 55 00 02 00 01   [ 1] 3842 	mov in,count
      009465 89               [ 4] 3843 9$:	ret 
                                   3844 
                                   3845 ;------------------------
                                   3846 ; BASIC: FOR var=expr 
                                   3847 ; set variable to expression 
                                   3848 ; leave variable address 
                                   3849 ; on dstack and set
                                   3850 ; FFOR bit in 'flags'
                                   3851 ;-----------------
                           000001  3852 	RETL1=1
                           000003  3853 	INW=3
                           000005  3854 	BPTR=5
      0015B5                       3855 for: ; { -- var_addr }
      009466 FE CF            [ 1] 3856 	ld a,#TK_VAR 
      009468 00 0A 72         [ 4] 3857 	call expect
      00946B 5F 00 09         [ 4] 3858 	call dpush 
      00946E AE 00 05         [ 4] 3859 	call let02 
      009471 A6 0A CD 89      [ 1] 3860 	bset flags,#FFOR 
                                   3861 ; open space on cstack for BPTR and INW 
      009475 7C               [ 2] 3862 	popw x ; call return address 
      0015C5                       3863 	_vars 4
      009476 85 1C            [ 2]    1     sub sp,#4 
      009478 00               [ 2] 3864 	pushw x  ; RETL1 
      009479 03               [ 1] 3865 	clrw x 
      00947A CD 82            [ 2] 3866 	ldw (BPTR,sp),x 
      00947C 30 A6            [ 2] 3867 	ldw (INW,sp),x 
      00947E 0D CD 82         [ 4] 3868 	call get_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009481 1E 81            [ 1] 3869 	cp a,#TK_CMD 
      009483 27 03            [ 1] 3870 	jreq 1$
      009483 4B 00 EE         [ 2] 3871 	jp syntax_error
      009485                       3872 1$:  
      009485 0F 01 DF         [ 2] 3873 	cpw x,#to 
      009487 27 03            [ 1] 3874 	jreq to
      009487 CD 93 2E         [ 2] 3875 	jp syntax_error 
                                   3876 
                                   3877 ;-----------------------------------
                                   3878 ; BASIC: TO expr 
                                   3879 ; second part of FOR loop initilization
                                   3880 ; leave limit on dstack and set 
                                   3881 ; FTO bit in 'flags'
                                   3882 ;-----------------------------------
      0015DF                       3883 to: ; { var_addr -- var_addr limit step }
      00948A A1 01 27 50 A1   [ 2] 3884 	btjt flags,#FFOR,1$
      00948F 02 26 05         [ 2] 3885 	jp syntax_error
      009492 CD 89 C4         [ 4] 3886 1$: call relation  
      009495 20 EE            [ 1] 3887 	cp a,#TK_INTGR 
      009497 27 03            [ 1] 3888 	jreq 2$ 
      009497 CD 8D 5C         [ 2] 3889 	jp syntax_error
      0015F1                       3890 2$: 
      00949A A1 00 27         [ 4] 3891     call dpush ; limit
      00949D 40 A1 07         [ 2] 3892 	ldw x,in.w 
      0094A0 26 05 CD         [ 4] 3893 	call get_token
      0094A3 82 30            [ 1] 3894 	cp a,#TK_NONE  
      0094A5 20 DE            [ 1] 3895 	jreq 4$ 
      0094A7 A1 0C            [ 1] 3896 	cp a,#TK_CMD
      0094A9 26 06            [ 1] 3897 	jrne 3$
      0094AB 9F CD 82         [ 2] 3898 	cpw x,#step 
      0094AE 1E 20            [ 1] 3899 	jreq step
      001607                       3900 3$:	
      0094B0 D4 0F 6B         [ 4] 3901 	call unget_token   	 
      0094B1                       3902 4$:	
      0094B1 A1 06 26         [ 2] 3903 	ldw x,#1   ; default step  
      0094B4 06 FD            [ 2] 3904 	jra store_loop_addr 
                                   3905 
                                   3906 
                                   3907 ;----------------------------------
                                   3908 ; BASIC: STEP expr 
                                   3909 ; optional third par of FOR loop
                                   3910 ; initialization. 	
                                   3911 ;------------------------------------
      00160F                       3912 step: ; {var limit -- var limit step}
      0094B6 CD 89 C4 20 CA   [ 2] 3913 	btjt flags,#FFOR,1$
      0094BB CC 06 EE         [ 2] 3914 	jp syntax_error
      0094BB A1 0A 26         [ 4] 3915 1$: call relation
      0094BE 05 03            [ 1] 3916 	cp a,#TK_INTGR
      0094C0 01 CC            [ 1] 3917 	jreq store_loop_addr  
      0094C2 94 87 EE         [ 2] 3918 	jp syntax_error
                                   3919 ; leave loop back entry point on cstack 
                                   3920 ; cstack is 2 call deep from interp_loop
      0094C4                       3921 store_loop_addr:
      0094C4 A1 0B 26         [ 4] 3922 	call dpush 
      0094C7 13 CD 8D         [ 2] 3923 	ldw x,basicptr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0094CA 5C A1            [ 2] 3924 	ldw (BPTR,sp),x 
      0094CC 02 27 03         [ 2] 3925 	ldw x,in.w 
      0094CF CC 87            [ 2] 3926 	ldw (INW,sp),x   
      0094D1 6E 15 00 24      [ 1] 3927 	bres flags,#FFOR 
      0094D2 72 5C 00 1F      [ 1] 3928 	inc loop_depth  
      0094D2 9F               [ 4] 3929 	ret 
                                   3930 
                                   3931 ;--------------------------------
                                   3932 ; BASIC: NEXT var 
                                   3933 ; FOR loop control 
                                   3934 ; increment variable with step 
                                   3935 ; and compare with limit 
                                   3936 ; loop if threshold not crossed.
                                   3937 ; else clean both stacks. 
                                   3938 ; and decrement 'loop_depth' 
                                   3939 ;--------------------------------
      001637                       3940 next: ; {var limit step -- [var limit step ] }
      0094D3 A4 0F C7 00      [ 1] 3941 	tnz loop_depth 
      0094D7 26 CC            [ 1] 3942 	jrne 1$ 
      0094D9 94 85 EE         [ 2] 3943 	jp syntax_error 
      0094DB                       3944 1$: 
      0094DB CD 8F            [ 1] 3945 	ld a,#TK_VAR 
      0094DD EB 11 63         [ 4] 3946 	call expect
                                   3947 ; check for good variable after NEXT 	 
      0094DE 90 93            [ 1] 3948 	ldw y,x 
      0094DE 0D 01 26         [ 2] 3949 	ldw x,#4  
      0094E1 05 A6 0D CD      [ 4] 3950 	cpw y,([dstkptr],x) ; compare variables address 
      0094E5 82 1E            [ 1] 3951 	jreq 2$  
      0094E7 5B 01 81         [ 2] 3952 	jp syntax_error ; not the good one 
      0094EA                       3953 2$: ; increment variable 
      0094EA CE               [ 1] 3954 	ldw x,y
      0094EB 00               [ 2] 3955 	ldw x,(x)  ; get var value 
      0094EC 04 1F 03         [ 2] 3956 	ldw acc16,x 
      0094EF CE 00 06 1F      [ 5] 3957 	ldw x,[dstkptr] ; step
      0094F3 05 C6 00 02      [ 2] 3958 	addw x,acc16 ; var+step 
      0094F7 6B 07            [ 2] 3959 	ldw (y),x ; save var new value 
                                   3960 ; compare with limit 
      0094F9 C6 00            [ 1] 3961 	ldw y,x 
      0094FB 03 6B 08 81      [ 5] 3962 	ldw x,[dstkptr] ; step in x 
      0094FF 5D               [ 2] 3963 	tnzw x  
      0094FF 1E 03            [ 1] 3964 	jrpl 4$ ; positive step 
                                   3965 ;negative step 
      009501 CF 00 04         [ 2] 3966 	ldw x,#2
      009504 1E 05 CF 00      [ 4] 3967 	cpw y,([dstkptr],x)
      009508 06 7B            [ 1] 3968 	jrslt loop_done
      00950A 07 C7            [ 2] 3969 	jra loop_back 
      001676                       3970 4$: ; positive step
      00950C 00 02 7B         [ 2] 3971 	ldw x,#2 
      00950F 08 C7 00 03      [ 4] 3972 	cpw y,([dstkptr],x)
      009513 81 1B            [ 1] 3973 	jrsgt loop_done
      009514                       3974 loop_back:
      009514 72 00            [ 2] 3975 	ldw x,(BPTR,sp)
      009516 00 25 05         [ 2] 3976 	ldw basicptr,x 
      009519 A6 06 CC 87 70   [ 2] 3977 	btjf flags,#FRUN,1$ 
      00951E 52 07            [ 1] 3978 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009520 AB 02            [ 1] 3979 	add a,#2 
      009520 0F 06 CD         [ 1] 3980 	ld count,a
      009523 8D               [ 2] 3981 	ldw x,(x)
      009524 5C A1 00         [ 2] 3982 	ldw lineno,x
      009527 27 5C            [ 2] 3983 1$:	ldw x,(INW,sp)
      009529 A1 07 26         [ 2] 3984 	ldw in.w,x 
      00952C 08               [ 4] 3985 	ret 
      00169A                       3986 loop_done:
                                   3987 	; remove var limit step on dstack 
      00952D CD 82 30         [ 2] 3988 	ldw x,dstkptr 
      009530 03 06 CD         [ 2] 3989 	addw x,#3*CELL_SIZE
      009533 8D 5C A1         [ 2] 3990 	ldw dstkptr,x 
                                   3991 	; remove 2 return address on cstack 
      009536 03               [ 2] 3992 	popw x
      0016A4                       3993 	_drop 4
      009537 27 03            [ 2]    1     addw sp,#4 
      009539 CC               [ 2] 3994 	pushw x 
      00953A 87 6E CD 8F      [ 1] 3995 	dec loop_depth 
      00953E F2               [ 4] 3996 	ret 
                                   3997 
                                   3998 
                                   3999 ;------------------------
                                   4000 ; BASIC: GOTO lineno 
                                   4001 ; jump to lineno 
                                   4002 ; here cstack is 2 call deep from interp_loop 
                                   4003 ;------------------------
      0016AC                       4004 goto:
      00953F 0D 06 26 0F A6   [ 2] 4005 	btjt flags,#FRUN,0$ 
      009544 3A C7            [ 1] 4006 	ld a,#ERR_RUN_ONLY
      009546 17 19 72         [ 2] 4007 	jp tb_error 
      009549 5F               [ 4] 4008 	ret 
      00954A 17 1A            [ 2] 4009 0$:	jra go_common
                                   4010 
                                   4011 ;--------------------
                                   4012 ; BASIC: GOSUB lineno
                                   4013 ; basic subroutine call
                                   4014 ; actual lineno and basicptr 
                                   4015 ; are saved on cstack
                                   4016 ; here cstack is 2 call deep from interp_loop 
                                   4017 ;--------------------
                           000003  4018 	GOS_RET=3
      0016B9                       4019 gosub:
      00954C AE 17 18 CD 82   [ 2] 4020 	btjt flags,#FRUN,0$ 
      009551 30 06            [ 1] 4021 	ld a,#ERR_RUN_ONLY
      009552 CC 06 F0         [ 2] 4022 	jp tb_error 
      009552 CD               [ 4] 4023 	ret 
      009553 94               [ 2] 4024 0$:	popw x 
      009554 EA AE            [ 2] 4025 	sub sp,#2 
      009556 16               [ 2] 4026 	pushw x 
      009557 C8 CF 00         [ 2] 4027 	ldw x,basicptr
      00955A 04 72            [ 1] 4028 	ld a,(2,x)
      00955C 5F 00            [ 1] 4029 	add a,#3 
      00955E 03 CD 8A         [ 1] 4030 	ld acc8,a 
      009561 B2 72 5F 00      [ 1] 4031 	clr acc16 
      009565 02 CD 93 2E      [ 2] 4032 	addw x,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009569 A1 02            [ 2] 4033 	ldw (GOS_RET,sp),x 
      0016DC                       4034 go_common: 
      00956B 27 03 CC         [ 4] 4035 	call relation 
      00956E 87 6E            [ 1] 4036 	cp a,#TK_INTGR
      009570 CD 8F            [ 1] 4037 	jreq 1$ 
      009572 F2 CD 90         [ 2] 4038 	jp syntax_error
      0016E6                       4039 1$: 
      009575 59 CD 94         [ 4] 4040 	call search_lineno  
      009578 FF               [ 2] 4041 	tnzw x 
      009579 CD 8D            [ 1] 4042 	jrne 2$ 
      00957B 5C A1            [ 1] 4043 	ld a,#ERR_NO_LINE 
      00957D 0A 26 02         [ 2] 4044 	jp tb_error 
      0016F1                       4045 2$: 
      009580 20 9E CD         [ 2] 4046 	ldw basicptr,x 
      009583 8F EB            [ 1] 4047 	ld a,(2,x)
      009585 AB 03            [ 1] 4048 	add a,#3 
      009585 5B 07 81         [ 1] 4049 	ld count,a 
      009588 FE               [ 2] 4050 	ldw x,(x)
      009588 81 00 05         [ 2] 4051 	ldw lineno,x 
      009589 35 03 00 01      [ 1] 4052 	mov in,#3 
      009589 52               [ 4] 4053 	ret 
                                   4054 
                                   4055 ;------------------------
                                   4056 ; BASIC: RETURN 
                                   4057 ; exit from a subroutine 
                                   4058 ; cstack is 2 level deep from interp_loop 
                                   4059 ;------------------------
      001704                       4060 return:
      00958A 04 0F 01 CD 91   [ 2] 4061 	btjt flags,#FRUN,0$ 
      00958F F0 A1            [ 1] 4062 	ld a,#ERR_RUN_ONLY
      009591 02 24 03         [ 2] 4063 	jp tb_error 
      00170E                       4064 0$:	
      009594 CC 87            [ 2] 4065 	ldw x,(GOS_RET,sp) 
      009596 6E A1 03         [ 2] 4066 	ldw basicptr,x 
      009599 25 06            [ 1] 4067 	ld a,(2,x)
      00959B CD 8F            [ 1] 4068 	add a,#3 
      00959D FF 9F 6B         [ 1] 4069 	ld count,a 
      0095A0 01 CD 8F FF      [ 1] 4070 	mov in,#3
      0095A4 9F               [ 2] 4071 	ldw x,(x)
      0095A5 6B 02 CD         [ 2] 4072 	ldw lineno,x 
      0095A8 8F               [ 1] 4073 	clr a 
      0095A9 FF               [ 2] 4074 	popw x 
      001724                       4075 	_drop 2
      0095AA F6 14            [ 2]    1     addw sp,#2 
      0095AC 02               [ 2] 4076 	pushw x
      0095AD 18               [ 4] 4077 	ret  
                                   4078 
                                   4079 
                                   4080 ;----------------------------------
                                   4081 ; BASIC: RUN
                                   4082 ; run BASIC program in RAM
                                   4083 ;----------------------------------- 
      001728                       4084 run: 
      0095AE 01 27 F9 5B 04   [ 2] 4085 	btjf flags,#FRUN,0$  
      0095B3 81               [ 1] 4086 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0095B4 81               [ 4] 4087 	ret
      00172F                       4088 0$: 
      0095B4 CD 91 F0 A1 02   [ 2] 4089 	btjf flags,#FBREAK,1$
      001734                       4090 	_drop 2 
      0095B9 27 03            [ 2]    1     addw sp,#2 
      0095BB CC 87 6E         [ 4] 4091 	call rest_context
      0095BE                       4092 	_drop CTXT_SIZE 
      0095BE CD 8F            [ 2]    1     addw sp,#CTXT_SIZE 
      0095C0 FF 9F CD 8F      [ 1] 4093 	bres flags,#FBREAK 
      0095C4 FF FA F7 81      [ 1] 4094 	bset flags,#FRUN 
      0095C8 CC 07 B3         [ 2] 4095 	jp interp_loop 
      0095C8 CD 91 F0         [ 2] 4096 1$:	ldw x,txtbgn
      0095CB A1 02 27         [ 2] 4097 	cpw x,txtend 
      0095CE 03 CC            [ 1] 4098 	jrmi 2$ 
      0095D0 87               [ 1] 4099 	clr a 
      0095D1 6E               [ 4] 4100 	ret 
      0095D2 CD 13 29         [ 4] 4101 2$: call ubound 
      001753                       4102 	_drop 2 
      0095D2 CD 8F            [ 2]    1     addw sp,#2 
      0095D4 FF 9F 43         [ 2] 4103 	ldw x,txtbgn 
      0095D7 CD 8F FF         [ 2] 4104 	ldw basicptr,x 
      0095DA F4 F7            [ 1] 4105 	ld a,(2,x)
      0095DC 81 02            [ 1] 4106 	add a,#2 ; consider that in start at 3  
      0095DD C7 00 02         [ 1] 4107 	ld count,a
      0095DD CD               [ 2] 4108 	ldw x,(x)
      0095DE 91 F0 A1         [ 2] 4109 	ldw lineno,x
      0095E1 02 27 03 CC      [ 1] 4110 	mov in,#3	
      0095E5 87 6E CD 8F      [ 1] 4111 	bset flags,#FRUN 
      0095E9 FF 9F CD         [ 2] 4112 	jp interp_loop 
                                   4113 
                                   4114 
                                   4115 ;----------------------
                                   4116 ; BASIC: STOP 
                                   4117 ; stop running program
                                   4118 ;---------------------- 
      001771                       4119 stop: 
                                   4120 ; clean dstack and cstack 
      0095EC 8F FF F8         [ 2] 4121 	ldw x,#STACK_EMPTY 
      0095EF F7               [ 1] 4122 	ldw sp,x 
      0095F0 81 11 00 24      [ 1] 4123 	bres flags,#FRUN 
      0095F1 72 19 00 24      [ 1] 4124 	bres flags,#FBREAK
      0095F1 CD 91 F0         [ 2] 4125 	jp warm_start
                                   4126 
                                   4127 ;-----------------------
                                   4128 ; BASIC BEEP expr1,expr2
                                   4129 ; used MCU internal beeper 
                                   4130 ; to produce a sound
                                   4131 ; arguments:
                                   4132 ;    expr1   frequency, {1,2,4} mapping to 1K,2K,4K
                                   4133 ;    expr2   duration msec.
                                   4134 ;---------------------------
      001780                       4135 beep:
      0095F4 A1 02 27         [ 4] 4136 	call arg_list 
      0095F7 03 CC            [ 1] 4137 	cp a,#2 
      0095F9 87 6E            [ 1] 4138 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0095FB CC 06 EE         [ 2] 4139 	jp syntax_error 
      0095FB CD 8F FF         [ 2] 4140 2$: ldw x,dstkptr 
      0095FE 9F CD            [ 2] 4141 	ldw x,(2,x);frequency 
      009600 8F               [ 1] 4142 	ld a,xl
      009601 FF               [ 1] 4143 	dec a 
      009602 F7               [ 1] 4144 	swap a 
      009603 81               [ 1] 4145 	sll a 
      009604 48               [ 1] 4146 	sll a 
      009604 A6 08            [ 1] 4147 	add a,#0x3e 
      009606 CD 91 E3         [ 1] 4148 	ld BEEP_CSR,a 
      009609 CD 91 F0         [ 4] 4149 	call dpop 
      00960C A1 01 27         [ 4] 4150 	call pause02 
      00960F 03 CC 87         [ 4] 4151 	call ddrop 
      009612 6E A6            [ 1] 4152 	ld a,#0x1f
      009614 09 CD 91         [ 1] 4153 	ld BEEP_CSR,a 
      009617 E3               [ 4] 4154 	ret 
                                   4155 
                                   4156 ;-------------------------------
                                   4157 ; BASIC: PWRADC 0|1,divisor  
                                   4158 ; disable/enanble ADC 
                                   4159 ;-------------------------------
      0017A8                       4160 power_adc:
      009618 CD 8F FF         [ 4] 4161 	call arg_list 
      00961B F6 5F            [ 1] 4162 	cp a,#2	
      00961D 97 A6            [ 1] 4163 	jreq 1$
      00961F 02 81 EE         [ 2] 4164 	jp syntax_error 
      009621 AE 00 02         [ 2] 4165 1$: ldw x,#2
      009621 CD 93 2E A1      [ 5] 4166 	ldw x,([dstkptr],x) ; on|off
      009625 02               [ 2] 4167 	tnzw x 
      009626 27 03            [ 1] 4168 	jreq 2$ 
      009628 CC 87 6E 4F      [ 5] 4169 	ldw x,[dstkptr] ; channel
      00962C 5D               [ 1] 4170 	ld a,xl
      00962D 26 05            [ 1] 4171 	and a,#7
      00962F 55               [ 1] 4172 	swap a 
      009630 00 03 00         [ 1] 4173 	ld ADC_CR1,a
      009633 02 81 54 02      [ 1] 4174 	bset ADC_CR2,#ADC_CR2_ALIGN ; right 
      009635 72 10 54 01      [ 1] 4175 	bset ADC_CR1,#ADC_CR1_ADON 
      0017CF                       4176 	_usec_dly 7 
      009635 A6 03 CD         [ 2]    1     ldw x,#(16*7-2)/4
      009638 91               [ 2]    2     decw x
      009639 E3               [ 1]    3     nop 
      00963A CD 8F            [ 1]    4     jrne .-4
      00963C F2 CD            [ 2] 4177 	jra 3$
      00963E 93 C1 72 14      [ 1] 4178 2$: bres ADC_CR1,#ADC_CR1_ADON 
      009642 00 25 85         [ 2] 4179 3$:	ldw x,#2
      009645 52 04 89         [ 4] 4180 	call ddrop_n 
      009648 5F               [ 4] 4181 	ret
                                   4182 
                                   4183 ;-----------------------------
                                   4184 ; BASIC: RDADC(channel)
                                   4185 ; read adc channel 
                                   4186 ; output:
                                   4187 ;   A 		TK_INTGR 
                                   4188 ;   X 		value 
                                   4189 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0017E3                       4190 read_adc:
      009649 1F 05            [ 1] 4191 	ld a,#TK_LPAREN 
      00964B 1F 03 CD         [ 4] 4192 	call expect 
      00964E 8D 5C A1         [ 4] 4193 	call get_token 
      009651 05 27            [ 1] 4194 	cp a,#TK_INTGR 
      009653 03 CC            [ 1] 4195 	jreq 1$
      009655 87 6E EE         [ 2] 4196 	jp syntax_error
      009657 89               [ 2] 4197 1$: pushw x 
      009657 A3 96            [ 1] 4198 	ld a,#TK_RPAREN 
      009659 5F 27 03         [ 4] 4199 	call expect 
      00965C CC               [ 2] 4200 	popw x 
      00965D 87 6E 10         [ 2] 4201 	cpw x,#16 
      00965F 25 05            [ 1] 4202 	jrult 2$
      00965F 72 04            [ 1] 4203 	ld a,#ERR_BAD_VALUE
      009661 00 25 03         [ 2] 4204 	jp tb_error 
      009664 CC               [ 1] 4205 2$: ld a,xl
      009665 87 6E CD         [ 1] 4206 	ld ADC_CSR,a 
      009668 93 2E A1 02      [ 1] 4207 	bset ADC_CR1,#ADC_CR1_ADON
      00966C 27 03 CC 87 6E   [ 2] 4208 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009671 CE 54 04         [ 2] 4209 	ldw x,ADC_DRH 
      009671 CD 8F            [ 1] 4210 	ld a,#TK_INTGR
      009673 F2               [ 4] 4211 	ret 
                                   4212 
                                   4213 
                                   4214 ;-----------------------
                                   4215 ; BASIC: BREAK 
                                   4216 ; insert a breakpoint 
                                   4217 ; in pogram. 
                                   4218 ; the program is resumed
                                   4219 ; with RUN 
                                   4220 ;-------------------------
      001816                       4221 break:
      009674 CE 00 01 CD 8D   [ 2] 4222 	btjt flags,#FRUN,2$
      009679 5C               [ 1] 4223 	clr a
      00967A A1               [ 4] 4224 	ret 
      00181D                       4225 2$:	 
                                   4226 ; create space on cstack to save context 
      00967B 00 27 0C         [ 2] 4227 	ldw x,#break_point 
      00967E A1 05 26         [ 4] 4228 	call puts 
      001823                       4229 	_drop 2 ;drop return address 
      009681 05 A3            [ 2]    1     addw sp,#2 
      001825                       4230 	_vars CTXT_SIZE ; context size 
      009683 96 8F            [ 2]    1     sub sp,#CTXT_SIZE 
      009685 27 08 6A         [ 4] 4231 	call save_context 
      009687 AE 16 C8         [ 2] 4232 	ldw x,#tib 
      009687 CD 8F EB         [ 2] 4233 	ldw basicptr,x
      00968A 7F               [ 1] 4234 	clr (x)
      00968A AE 00 01 20      [ 1] 4235 	clr count  
      00968E 12               [ 1] 4236 	clrw x 
      00968F CF 00 05         [ 2] 4237 	ldw lineno,x 
      00968F 72 04 00         [ 2] 4238 	ldw in.w,x
      009692 25 03 CC 87      [ 1] 4239 	bres flags,#FRUN 
      009696 6E CD 93 2E      [ 1] 4240 	bset flags,#FBREAK
      00969A A1 02 27         [ 2] 4241 	jp interp_loop 
      00969D 03 CC 87 6E 61 6B 20  4242 break_point: .asciz "\nbreak point, RUN to resume.\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4243 
                                   4244 ;-----------------------
                                   4245 ; BASIC: NEW
                                   4246 ; from command line only 
                                   4247 ; free program memory
                                   4248 ; and clear variables 
                                   4249 ;------------------------
      0096A1                       4250 new: 
      0096A1 CD 8F F2 CE 00   [ 2] 4251 	btjf flags,#FRUN,0$ 
      0096A6 04               [ 1] 4252 	clr a 
      0096A7 1F               [ 4] 4253 	ret 
      00186C                       4254 0$:	
      0096A8 05 CE 00         [ 4] 4255 	call clear_basic 
      0096AB 01               [ 4] 4256 	ret 
                                   4257 	 
                                   4258 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4259 ;   file system routines
                                   4260 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4261 
                                   4262 ;--------------------
                                   4263 ; input:
                                   4264 ;   X     increment 
                                   4265 ; output:
                                   4266 ;   farptr  incremented 
                                   4267 ;---------------------
      001870                       4268 incr_farptr:
      0096AC 1F 03 72 15      [ 2] 4269 	addw x,farptr+1 
      0096B0 00 25            [ 1] 4270 	jrnc 1$
      0096B2 72 5C 00 20      [ 1] 4271 	inc farptr 
      0096B6 81 00 14         [ 2] 4272 1$:	ldw farptr+1,x  
      0096B7 81               [ 4] 4273 	ret 
                                   4274 
                                   4275 ;------------------------------
                                   4276 ; extended flash memory used as FLASH_DRIVE 
                                   4277 ; seek end of used flash drive   
                                   4278 ; starting at 0x10000 address.
                                   4279 ; 4 consecutives 0 bytes signal free space. 
                                   4280 ; input:
                                   4281 ;	none
                                   4282 ; output:
                                   4283 ;   ffree     free_addr| 0 if memory full.
                                   4284 ;------------------------------
      00187E                       4285 seek_fdrive:
      0096B7 72 5D            [ 1] 4286 	ld a,#1
      0096B9 00 20 26         [ 1] 4287 	ld farptr,a 
      0096BC 03               [ 1] 4288 	clrw x 
      0096BD CC 87 6E         [ 2] 4289 	ldw farptr+1,x 
      0096C0                       4290 1$:
      0096C0 A6               [ 1] 4291 	clrw x 
      0096C1 03 CD 91 E3      [ 5] 4292 	ldf a,([farptr],x) 
      0096C5 90 93            [ 1] 4293 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0096C7 AE               [ 1] 4294 	incw x 
      0096C8 00 04 72 D3      [ 5] 4295 	ldf a,([farptr],x)
      0096CC 00 1A            [ 1] 4296 	jrne 2$ 
      0096CE 27               [ 1] 4297 	incw x 
      0096CF 03 CC 87 6E      [ 5] 4298 	ldf a,([farptr],x)
      0096D3 26 07            [ 1] 4299 	jrne 2$ 
      0096D3 93               [ 1] 4300 	incw x 
      0096D4 FE CF 00 0A      [ 5] 4301 	ldf a,([farptr],x)
      0096D8 72 CE            [ 1] 4302 	jreq 4$ 
      0018A3                       4303 2$: 
      0096DA 00 1A 72         [ 2] 4304 	addw x,#1
      0096DD BB 00 0A         [ 4] 4305 	call incr_farptr
      0096E0 90 FF 90         [ 2] 4306 	ldw x,#0x27f 
      0096E3 93 72 CE         [ 2] 4307 	cpw x,farptr
      0096E6 00 1A            [ 1] 4308 	jrpl 1$
      0096E8 5D 2A 0B AE      [ 1] 4309 	clr ffree 
      0096EC 00 02 72 D3      [ 1] 4310 	clr ffree+1 
      0096F0 00 1A 2F 26      [ 1] 4311 	clr ffree+2 
      0096F4 20 09 00 08      [ 1] 4312 	clr acc24 
      0096F6 72 5F 00 09      [ 1] 4313 	clr acc16
      0096F6 AE 00 02 72      [ 1] 4314 	clr acc8 
      0096FA D3 00            [ 2] 4315 	jra 5$
      0018CB                       4316 4$: ; copy farptr to ffree	 
      0096FC 1A 2C 1B         [ 2] 4317 	ldw x,farptr+1 
      0096FF A3 00 00         [ 2] 4318 	cpw x,#fdrive 
      0096FF 1E 05            [ 1] 4319 	jreq 41$
                                   4320 	; there is a file, last 0 of that file must be skipped.
      009701 CF 00 04         [ 2] 4321 	ldw x,#1
      009704 72 01 00         [ 4] 4322 	call incr_farptr
      0018D9                       4323 41$: 
      009707 25 0B E6         [ 2] 4324 	ldw x,farptr 
      00970A 02 AB 02         [ 1] 4325 	ld a,farptr+2 
      00970D C7 00 03         [ 2] 4326 	ldw ffree,x 
      009710 FE CF 00         [ 1] 4327 	ld ffree+2,a  
      009713 06               [ 4] 4328 5$:	ret 
                                   4329 
                                   4330 ;-----------------------
                                   4331 ; compare file name 
                                   4332 ; with name pointed by Y  
                                   4333 ; input:
                                   4334 ;   farptr   file name 
                                   4335 ;   Y        target name 
                                   4336 ; output:
                                   4337 ;   farptr 	 at file_name
                                   4338 ;   X 		 farptr[x] point at size field  
                                   4339 ;   Carry    0|1 no match|match  
                                   4340 ;----------------------
      0018E6                       4341 cmp_name:
      009714 1E               [ 1] 4342 	clrw x
      009715 03 CF 00 01      [ 5] 4343 1$:	ldf a,([farptr],x)
      009719 81 F1            [ 1] 4344 	cp a,(y)
      00971A 26 08            [ 1] 4345 	jrne 4$
      00971A CE               [ 1] 4346 	tnz a 
      00971B 00 1A            [ 1] 4347 	jreq 9$ 
      00971D 1C               [ 1] 4348     incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      00971E 00 06            [ 1] 4349 	incw y 
      009720 CF 00            [ 2] 4350 	jra 1$
      0018F7                       4351 4$: ;no match 
      009722 1A               [ 1] 4352 	tnz a 
      009723 85 5B            [ 1] 4353 	jreq 5$
      009725 04               [ 1] 4354 	incw x 
      009726 89 72 5A 00      [ 5] 4355 	ldf a,([farptr],x)
      00972A 20 81            [ 2] 4356 	jra 4$  
      00972C 5C               [ 1] 4357 5$:	incw x ; farptr[x] point at 'size' field 
      00972C 72               [ 1] 4358 	rcf 
      00972D 00               [ 4] 4359 	ret
      001904                       4360 9$: ; match  
      00972E 00               [ 1] 4361 	incw x  ; farptr[x] at 'size' field 
      00972F 25               [ 1] 4362 	scf 
      009730 06               [ 4] 4363 	ret 
                                   4364 
                                   4365 ;-----------------------
                                   4366 ; search file in 
                                   4367 ; flash memory 
                                   4368 ; input:
                                   4369 ;   Y       file name  
                                   4370 ; output:
                                   4371 ;   farptr  addr at name|0
                                   4372 ;-----------------------
                           000001  4373 	FSIZE=1
                           000003  4374 	YSAVE=3
                           000004  4375 	VSIZE=4 
      001907                       4376 search_file: 
      001907                       4377 	_vars VSIZE
      009731 A6 06            [ 2]    1     sub sp,#VSIZE 
      009733 CC 87            [ 2] 4378 	ldw (YSAVE,sp),y  
      009735 70               [ 1] 4379 	clrw x 
      009736 81 20 23         [ 2] 4380 	ldw farptr+1,x 
      009739 35 01 00 13      [ 1] 4381 	mov farptr,#1
      001913                       4382 1$:	
                                   4383 ; check if farptr is after any file 
                                   4384 ; if  0 then so.
      009739 72 00 00 25      [ 5] 4385 	ldf a,[farptr]
      00973D 06 A6            [ 1] 4386 	jreq 6$
      00973F 06               [ 1] 4387 2$: clrw x 	
      009740 CC 87            [ 2] 4388 	ldw y,(YSAVE,sp) 
      009742 70 81 85         [ 4] 4389 	call cmp_name
      009745 52 02            [ 1] 4390 	jrc 9$
      009747 89 CE 00 04      [ 5] 4391 	ldf a,([farptr],x)
      00974B E6 02            [ 1] 4392 	ld (FSIZE,sp),a 
      00974D AB               [ 1] 4393 	incw x 
      00974E 03 C7 00 0B      [ 5] 4394 	ldf a,([farptr],x)
      009752 72 5F            [ 1] 4395 	ld (FSIZE+1,sp),a 
      009754 00               [ 1] 4396 	incw x 
      009755 0A 72 BB         [ 2] 4397 	addw x,(FSIZE,sp) ; count to skip 
      009758 00 0A 1F         [ 4] 4398 	call incr_farptr ; now at next file 'name_field'
      00975B 03 02 80         [ 2] 4399 	ldw x,#0x280
      00975C C3 00 13         [ 2] 4400 	cpw x,farptr 
      00975C CD 93            [ 1] 4401 	jrpl 1$
      00193D                       4402 6$: ; file not found 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00975E 2E A1 02 27      [ 1] 4403 	clr farptr
      009762 03 CC 87 6E      [ 1] 4404 	clr farptr+1 
      009766 72 5F 00 15      [ 1] 4405 	clr farptr+2 
      001949                       4406 	_drop VSIZE 
      009766 CD 83            [ 2]    1     addw sp,#VSIZE 
      009768 60               [ 1] 4407 	rcf
      009769 5D               [ 4] 4408 	ret
      00194D                       4409 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      00194D                       4410 	_drop VSIZE 
      00976A 26 05            [ 2]    1     addw sp,#VSIZE 
      00976C A6               [ 1] 4411 	scf 	
      00976D 05               [ 4] 4412 	ret
                                   4413 
                                   4414 ;--------------------------------
                                   4415 ; BASIC: SAVE "name" 
                                   4416 ; save text program in 
                                   4417 ; flash memory used as 
                                   4418 ;--------------------------------
      001951                       4419 save:
      00976E CC 87 70 24 05   [ 2] 4420 	btjf flags,#FRUN,0$ 
      009771 A6 07            [ 1] 4421 	ld a,#ERR_CMD_ONLY 
      009771 CF 00 04         [ 2] 4422 	jp tb_error
      00195B                       4423 0$:	 
      009774 E6 02 AB         [ 2] 4424 	ldw x,txtend 
      009777 03 C7 00 03      [ 2] 4425 	subw x,txtbgn
      00977B FE CF            [ 1] 4426 	jrne 10$
                                   4427 ; nothing to save 
      00977D 00               [ 1] 4428 	clr a 
      00977E 06               [ 4] 4429 	ret 
      001966                       4430 10$:	
      00977F 35 03 00         [ 1] 4431 	ld a,ffree 
      009782 02 81 17         [ 1] 4432 	or a,ffree+1
      009784 CA 00 18         [ 1] 4433 	or a,ffree+2 
      009784 72 00            [ 1] 4434 	jrne 1$
      009786 00 25            [ 1] 4435 	ld a,#ERR_MEM_FULL
      009788 05 A6 06         [ 2] 4436 	jp tb_error 
      00978B CC 87 70         [ 4] 4437 1$: call get_token	
      00978E A1 07            [ 1] 4438 	cp a,#TK_QSTR
      00978E 1E 03            [ 1] 4439 	jreq 2$
      009790 CF 00 04         [ 2] 4440 	jp syntax_error
      001980                       4441 2$: ; check for existing file of that name 
      009793 E6 02            [ 1] 4442 	ldw y,x ; file name pointer 
      009795 AB 03 C7         [ 4] 4443 	call search_file 
      009798 00 03            [ 1] 4444 	jrnc 3$ 
      00979A 35 03            [ 1] 4445 	ld a,#ERR_DUPLICATE 
      00979C 00 02 FE         [ 2] 4446 	jp tb_error 
      00198C                       4447 3$:	;** write file name to flash **
      00979F CF 00 06         [ 2] 4448 	ldw x,ffree 
      0097A2 4F 85 5B         [ 1] 4449 	ld a,ffree+2 
      0097A5 02 89 81         [ 2] 4450 	ldw farptr,x 
      0097A8 C7 00 15         [ 1] 4451 	ld farptr+2,a 
      0097A8 72 01 00         [ 2] 4452 	ldw x,#pad  
      0097AB 25 02 4F         [ 4] 4453 	call strlen 
      0097AE 81               [ 1] 4454 	incw  x
      0097AF 89               [ 2] 4455 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0097AF 72               [ 1] 4456 	clrw x   
      0097B0 09 00 25 12      [ 2] 4457 	ldw y,#pad 
      0097B4 5B 02 CD         [ 4] 4458 	call write_block  
      0019A8                       4459 	_drop 2 ; drop pushed X 
      0097B7 94 FF            [ 2]    1     addw sp,#2 
                                   4460 ;** write file length after name **
      0097B9 5B 06 72         [ 2] 4461 	ldw x,txtend 
      0097BC 19 00 25 72      [ 2] 4462 	subw x,txtbgn
      0097C0 10               [ 2] 4463 	pushw x ; file size 
      0097C1 00               [ 1] 4464 	clrw x 
      0097C2 25 CC            [ 1] 4465 	ld a,(1,sp)
      0097C4 88 33 CE         [ 4] 4466 	call write_byte 
      0097C7 00               [ 1] 4467 	incw x 
      0097C8 1C C3            [ 1] 4468 	ld a,(2,sp)
      0097CA 00 1E 2B         [ 4] 4469 	call write_byte
      0097CD 02               [ 1] 4470 	incw x  
      0097CE 4F 81 CD         [ 4] 4471 	call incr_farptr ; move farptr after SIZE field 
                                   4472 ;** write BASIC text **
                                   4473 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      0097D1 93 A9            [ 2] 4474 	ldw x,(1,sp)
      0097D3 5B               [ 2] 4475 	pushw x 
      0097D4 02               [ 1] 4476 	clrw x 
      0097D5 CE 00 1C CF      [ 2] 4477 	ldw y,txtbgn  ; BASIC text to save 
      0097D9 00 04 E6         [ 4] 4478 	call write_block 
      0019CD                       4479 	_drop 2 ;  drop BSIZE argument
      0097DC 02 AB            [ 2]    1     addw sp,#2 
                                   4480 ; save farptr in ffree
      0097DE 02 C7 00         [ 2] 4481 	ldw x,farptr 
      0097E1 03 FE CF         [ 1] 4482 	ld a,farptr+2 
      0097E4 00 06 35         [ 2] 4483 	ldw ffree,x 
      0097E7 03 00 02         [ 1] 4484 	ld ffree+2,a
                                   4485 ; write 4 zero bytes as a safe gard 
      0097EA 72               [ 1] 4486     clrw x 
      0097EB 10               [ 1] 4487 	clr a 
      0097EC 00 25 CC         [ 4] 4488 	call write_byte 
      0097EF 88               [ 1] 4489 	incw x 
      0097F0 33               [ 1] 4490 	clr a 
      0097F1 CD 00 DC         [ 4] 4491 	call write_byte
      0097F1 AE               [ 1] 4492 	incw x 
      0097F2 17               [ 1] 4493 	clr a 
      0097F3 FF 94 72         [ 4] 4494 	call write_byte
                                   4495 ; display saved size  
      0097F6 11               [ 2] 4496 	popw x ; first copy of BSIZE 
      0097F7 00 25            [ 1] 4497 	ld a,#TK_INTGR 
      0097F9 72               [ 4] 4498 	ret 
                                   4499 
                                   4500 
                                   4501 ;------------------------
                                   4502 ; BASIC: LOAD "file" 
                                   4503 ; load file to RAM 
                                   4504 ; for execution 
                                   4505 ;------------------------
      0019EE                       4506 load:
      0097FA 19 00 25 CC 87   [ 2] 4507 	btjf flags,#FRUN,0$ 
      0097FF CA 05            [ 1] 4508 	jreq 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009800 A6 07            [ 1] 4509 	ld a,#ERR_CMD_ONLY 
      009800 CD 91 F0         [ 2] 4510 	jp tb_error 
      0019FA                       4511 0$:	
      009803 A1 02 27         [ 4] 4512 	call get_token 
      009806 03 CC            [ 1] 4513 	cp a,#TK_QSTR
      009808 87 6E            [ 1] 4514 	jreq 1$
      00980A CE 00 1A         [ 2] 4515 	jp syntax_error 
      001A04                       4516 1$:	
      00980D EE 02            [ 1] 4517 	ldw y,x 
      00980F 9F 4A 4E         [ 4] 4518 	call search_file 
      009812 48 48            [ 1] 4519 	jrc 2$ 
      009814 AB 3E            [ 1] 4520 	ld a,#ERR_NOT_FILE
      009816 C7 50 F3         [ 2] 4521 	jp tb_error  
      001A10                       4522 2$:	
      009819 CD 8F FF         [ 4] 4523 	call incr_farptr  
      00981C CD 9C E6         [ 4] 4524 	call clear_basic  
      00981F CD               [ 1] 4525 	clrw x
      009820 90 26 A6 1F      [ 5] 4526 	ldf a,([farptr],x)
      009824 C7 50            [ 1] 4527 	ld yh,a 
      009826 F3               [ 1] 4528 	incw x  
      009827 81 AF 00 13      [ 5] 4529 	ldf a,([farptr],x)
      009828 5C               [ 1] 4530 	incw x 
      009828 CD 91            [ 1] 4531 	ld yl,a 
      00982A F0 A1 02 27      [ 2] 4532 	addw y,txtbgn
      00982E 03 CC 87 6E      [ 2] 4533 	ldw txtend,y
      009832 AE 00 02 72      [ 2] 4534 	ldw y,txtbgn
      001A31                       4535 3$:	; load BASIC text 	
      009836 DE 00 1A 5D      [ 5] 4536 	ldf a,([farptr],x)
      00983A 27 1C            [ 1] 4537 	ld (y),a 
      00983C 72               [ 1] 4538 	incw x 
      00983D CE 00            [ 1] 4539 	incw y 
      00983F 1A 9F A4 07      [ 2] 4540 	cpw y,txtend 
      009843 4E C7            [ 1] 4541 	jrmi 3$
                                   4542 ; return loaded size 	 
      009845 54 01 72         [ 2] 4543 	ldw x,txtend 
      009848 16 54 02 72      [ 2] 4544 	subw x,txtbgn
      00984C 10 54 01         [ 4] 4545 	call print_int 
      00984F AE               [ 4] 4546 	ret 
                                   4547 
                                   4548 ;-----------------------------------
                                   4549 ; BASIC: FORGET ["file_name"] 
                                   4550 ; erase file_name and all others 
                                   4551 ; after it. 
                                   4552 ; without argument erase all files 
                                   4553 ;-----------------------------------
      001A4B                       4554 forget:
      009850 00 1B 5A         [ 4] 4555 	call get_token 
      009853 9D 26            [ 1] 4556 	cp a,#TK_NONE 
      009855 FA 20            [ 1] 4557 	jreq 3$ 
      009857 04 72            [ 1] 4558 	cp a,#TK_QSTR
      009859 11 54            [ 1] 4559 	jreq 1$
      00985B 01 AE 00         [ 2] 4560 	jp syntax_error
      00985E 02 CD            [ 1] 4561 1$: ldw y,x
      009860 90 63 81         [ 4] 4562 	call search_file
      009863 25 05            [ 1] 4563 	jrc 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009863 A6 08            [ 1] 4564 	ld a,#ERR_NOT_FILE 
      009865 CD 91 E3         [ 2] 4565 	jp tb_error 
      001A65                       4566 2$: 
      009868 CD 8D 5C         [ 2] 4567 	ldw x,farptr
      00986B A1 02 27         [ 1] 4568 	ld a,farptr+2
      00986E 03 CC            [ 2] 4569 	jra 4$ 
      001A6D                       4570 3$: ; forget all files 
      009870 87 6E 89         [ 2] 4571 	ldw x,#fdrive
      009873 A6               [ 1] 4572 	clr a 
      009874 09               [ 1] 4573 	rrwa x 
      009875 CD 91 E3         [ 2] 4574 	ldw farptr,x 
      009878 85 A3 00         [ 1] 4575 	ld farptr+2,a 
      001A78                       4576 4$:
      00987B 10 25 05         [ 2] 4577 	ldw ffree,x 
      00987E A6 0A CC         [ 1] 4578 	ld ffree+2,a 
      009881 87               [ 1] 4579 5$:	clrw x 
      009882 70               [ 1] 4580 	clr a  
      009883 9F C7 54         [ 4] 4581 	call write_byte 
      009886 00 72 10         [ 2] 4582 	ldw x,#1 
      009889 54 01 72         [ 4] 4583 	call incr_farptr
      00988C 0F 54 00         [ 1] 4584 	ld a,farptr
      00988F FB CE 54         [ 1] 4585 	cp a,ffree 
      009892 04 A6            [ 1] 4586 	jrmi 5$ 
      009894 02 81 14         [ 2] 4587 	ldw x,farptr+1 
      009896 C3 00 17         [ 2] 4588 	cpw x,ffree+1
      009896 72 00            [ 1] 4589 	jrmi 5$
      009898 00               [ 4] 4590 	ret 
                                   4591 
                                   4592 ;----------------------
                                   4593 ; BASIC: DIR 
                                   4594 ; list saved files 
                                   4595 ;----------------------
                           000001  4596 	COUNT=1 ; files counter 
                           000002  4597 	VSIZE=2 
      001A9A                       4598 directory:
      001A9A                       4599 	_vars VSIZE 
      009899 25 02            [ 2]    1     sub sp,#VSIZE 
      00989B 4F               [ 1] 4600 	clrw x 
      00989C 81 01            [ 2] 4601 	ldw (COUNT,sp),x 
      00989D CF 00 14         [ 2] 4602 	ldw farptr+1,x 
      00989D AE 98 C7 CD      [ 1] 4603 	mov farptr,#1 
      001AA6                       4604 dir_loop:
      0098A1 82               [ 1] 4605 	clrw x 
      0098A2 30 5B 02 52      [ 5] 4606 	ldf a,([farptr],x)
      0098A6 06 CD            [ 1] 4607 	jreq 8$ 
      001AAD                       4608 1$: ;name loop 	
      0098A8 94 EA AE 16      [ 5] 4609 	ldf a,([farptr],x)
      0098AC C8 CF            [ 1] 4610 	jreq 2$ 
      0098AE 00 04 7F         [ 4] 4611 	call putc 
      0098B1 72               [ 1] 4612 	incw x 
      0098B2 5F 00            [ 2] 4613 	jra 1$
      0098B4 03               [ 1] 4614 2$: incw x ; skip ending 0. 
      0098B5 5F CF            [ 1] 4615 	ld a,#SPACE 
      0098B7 00 06 CF         [ 4] 4616 	call putc 
                                   4617 ; get file size 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      0098BA 00 01 72 11      [ 5] 4618 	ldf a,([farptr],x)
      0098BE 00 25            [ 1] 4619 	ld yh,a 
      0098C0 72               [ 1] 4620 	incw x 
      0098C1 18 00 25 CC      [ 5] 4621 	ldf a,([farptr],x)
      0098C5 88               [ 1] 4622 	incw x 
      0098C6 33 0A            [ 1] 4623 	ld yl,a 
      0098C8 62 72            [ 2] 4624 	pushw y 
      0098CA 65 61 6B         [ 2] 4625 	addw x,(1,sp)
      0098CD 20 70 6F         [ 4] 4626 	call incr_farptr 
      0098D0 69               [ 2] 4627 	popw x ; file size 
      0098D1 6E 74 2C         [ 4] 4628 	call print_int 
      0098D4 20 52            [ 1] 4629 	ld a,#CR 
      0098D6 55 4E 20         [ 4] 4630 	call putc
      0098D9 74 6F            [ 2] 4631 	ldw x,(COUNT,sp)
      0098DB 20               [ 1] 4632 	incw x
      0098DC 72 65            [ 2] 4633 	ldw (COUNT,sp),x  
      0098DE 73 75            [ 2] 4634 	jra dir_loop 
      001AE5                       4635 8$: ; print number of files 
      0098E0 6D 65            [ 2] 4636 	ldw x,(COUNT,sp)
      0098E2 2E 0A 00         [ 4] 4637 	call print_int 
      0098E5 AE 1B 1A         [ 2] 4638 	ldw x,#file_count 
      0098E5 72 01 00         [ 4] 4639 	call puts  
                                   4640 ; print drive free space 	
      0098E8 25 02            [ 1] 4641 	ld a,#0xff 
      0098EA 4F 81 18         [ 1] 4642 	sub a,ffree+2 
      0098EC C7 00 0A         [ 1] 4643 	ld acc8,a 
      0098EC CD 86            [ 1] 4644 	ld a,#0x7f 
      0098EE 4C 81 17         [ 1] 4645 	sbc a,ffree+1 
      0098F0 C7 00 09         [ 1] 4646 	ld acc16,a 
      0098F0 72 BB            [ 1] 4647 	ld a,#2 
      0098F2 00 15 24         [ 1] 4648 	sbc a,ffree 
      0098F5 04 72 5C         [ 1] 4649 	ld acc24,a 
      0098F8 00               [ 1] 4650 	clrw x  
      0098F9 14 CF            [ 1] 4651 	ld a,#6 
      0098FB 00               [ 1] 4652 	ld xl,a 
      0098FC 15 81            [ 1] 4653 	ld a,#10 
      0098FE CD 08 FC         [ 4] 4654 	call prti24 
      0098FE A6 01 C7         [ 2] 4655 	ldw x,#drive_free
      009901 00 14 5F         [ 4] 4656 	call puts 
      001B17                       4657 	_drop VSIZE 
      009904 CF 00            [ 2]    1     addw sp,#VSIZE 
      009906 15               [ 4] 4658 	ret
      009907 20 66 69 6C 65 73 0A  4659 file_count: .asciz " files\n"
             00
      009907 5F 92 AF 00 14 26 15  4660 drive_free: .asciz " bytes free\n" 
             5C 92 AF 00 14 26
                                   4661 
                                   4662 ;---------------------
                                   4663 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   4664 ; write 1 or more byte to FLASH or EEPROM
                                   4665 ; starting at address  
                                   4666 ; input:
                                   4667 ;   expr1  	is address 
                                   4668 ;   expr2   is byte to write
                                   4669 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4670 ;   none 
                                   4671 ;---------------------
                           000001  4672 	ADDR=1
                           000002  4673 	VSIZ=2 
      001B2F                       4674 write:
      001B2F                       4675 	_vars VSIZE 
      009914 0E 5C            [ 2]    1     sub sp,#VSIZE 
      009916 92 AF 00 14      [ 1] 4676 	clr farptr ; expect 16 bits address 
      00991A 26 07 5C         [ 4] 4677 	call expression
      00991D 92 AF            [ 1] 4678 	cp a,#TK_INTGR 
      00991F 00 14            [ 1] 4679 	jreq 0$
      009921 27 28 EE         [ 2] 4680 	jp syntax_error
      009923 1F 01            [ 2] 4681 0$: ldw (ADDR,sp),x 
      009923 1C 00 01         [ 4] 4682 	call get_token 
      009926 CD 98            [ 1] 4683 	cp a,#TK_COMMA 
      009928 F0 AE            [ 1] 4684 	jreq 1$ 
      00992A 02 7F            [ 2] 4685 	jra 9$ 
      00992C C3 00 14         [ 4] 4686 1$:	call expression
      00992F 2A D6            [ 1] 4687 	cp a,#TK_INTGR
      009931 72 5F            [ 1] 4688 	jreq 2$
      009933 00 17 72         [ 2] 4689 	jp syntax_error
      009936 5F               [ 1] 4690 2$:	ld a,xl 
      009937 00 18            [ 2] 4691 	ldw x,(ADDR,sp) 
      009939 72 5F 00         [ 2] 4692 	ldw farptr+1,x 
      00993C 19               [ 1] 4693 	clrw x 
      00993D 72 5F 00         [ 4] 4694 	call write_byte
      009940 09 72            [ 2] 4695 	ldw x,(ADDR,sp)
      009942 5F               [ 1] 4696 	incw x 
      009943 00 0A            [ 2] 4697 	jra 0$ 
      001B63                       4698 9$:
      001B63                       4699 	_drop VSIZE
      009945 72 5F            [ 2]    1     addw sp,#VSIZE 
      009947 00               [ 4] 4700 	ret 
                                   4701 
                                   4702 
                                   4703 ;---------------------
                                   4704 ;BASIC: CHAR(expr)
                                   4705 ; évaluate expression 
                                   4706 ; and take the 7 least 
                                   4707 ; bits as ASCII character
                                   4708 ;---------------------
      001B66                       4709 char:
      009948 0B 20            [ 1] 4710 	ld a,#TK_LPAREN 
      00994A 1A 11 63         [ 4] 4711 	call expect 
      00994B CD 12 AE         [ 4] 4712 	call relation 
      00994B CE 00            [ 1] 4713 	cp a,#TK_INTGR 
      00994D 15 A3            [ 1] 4714 	jreq 1$
      00994F 00 00 27         [ 2] 4715 	jp syntax_error
      009952 06               [ 2] 4716 1$:	pushw x 
      009953 AE 00            [ 1] 4717 	ld a,#TK_RPAREN 
      009955 01 CD 98         [ 4] 4718 	call expect
      009958 F0               [ 2] 4719 	popw x  
      009959 9F               [ 1] 4720 	ld a,xl 
      009959 CE 00            [ 1] 4721 	and a,#0x7f 
      00995B 14               [ 1] 4722 	ld xl,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      00995C C6 00            [ 1] 4723 	ld a,#TK_CHAR
      00995E 16               [ 4] 4724 	ret
                                   4725 
                                   4726 ;---------------------
                                   4727 ; BASIC: ASC(string|char)
                                   4728 ; extract first character 
                                   4729 ; of string argument 
                                   4730 ; return it as TK_INTGR 
                                   4731 ;---------------------
      001B83                       4732 ascii:
      00995F CF 00            [ 1] 4733 	ld a,#TK_LPAREN
      009961 17 C7 00         [ 4] 4734 	call expect 
      009964 19 81 DC         [ 4] 4735 	call get_token 
      009966 A1 07            [ 1] 4736 	cp a,#TK_QSTR 
      009966 5F 92            [ 1] 4737 	jreq 1$
      009968 AF 00            [ 1] 4738 	cp a,#TK_CHAR 
      00996A 14 90            [ 1] 4739 	jreq 2$ 
      00996C F1 26 08         [ 2] 4740 	jp syntax_error
      001B96                       4741 1$: 
      00996F 4D               [ 1] 4742 	ld a,(x)
      009970 27 12            [ 2] 4743 	jra 3$
      001B99                       4744 2$: 
      009972 5C               [ 1] 4745 	ld a,xl 
      009973 90               [ 1] 4746 3$:	ld xl,a 
      009974 5C               [ 1] 4747 	clr a  
      009975 20               [ 1] 4748 	ld xh,a 
      009976 F0               [ 2] 4749 	pushw x  
      009977 A6 09            [ 1] 4750 	ld a,#TK_RPAREN 
      009977 4D 27 07         [ 4] 4751 	call expect 
      00997A 5C               [ 2] 4752 	popw x 
      00997B 92 AF            [ 1] 4753 	ld a,#TK_INTGR 
      00997D 00               [ 4] 4754 	ret 
                                   4755 
                                   4756 ;---------------------
                                   4757 ;BASIC: KEY
                                   4758 ; wait for a character 
                                   4759 ; received from STDIN 
                                   4760 ; input:
                                   4761 ;	none 
                                   4762 ; output:
                                   4763 ;	X 		ASCII character 
                                   4764 ;---------------------
      001BA7                       4765 key:
      00997E 14 20 F6         [ 4] 4766 	call getc 
      009981 5C               [ 1] 4767 	clrw x 
      009982 98               [ 1] 4768 	ld xl,a 
      009983 81 02            [ 1] 4769 	ld a,#TK_INTGR
      009984 81               [ 4] 4770 	ret
                                   4771 
                                   4772 ;----------------------
                                   4773 ; BASIC: QKEY
                                   4774 ; Return true if there 
                                   4775 ; is a character in 
                                   4776 ; waiting in STDIN 
                                   4777 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4778 ;  none 
                                   4779 ; output:
                                   4780 ;   X 		0|1 
                                   4781 ;-----------------------
      001BAF                       4782 qkey: 
      009984 5C               [ 1] 4783 	clrw x 
      009985 99 81 52 40 01   [ 2] 4784 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      009987 5C               [ 1] 4785 	incw x 
      009987 52 04            [ 1] 4786 9$: ld a,#TK_INTGR
      009989 17               [ 4] 4787 	ret 
                                   4788 
                                   4789 ;---------------------
                                   4790 ; BASIC: GPIO(expr,reg)
                                   4791 ; return gpio address 
                                   4792 ; expr {0..8}
                                   4793 ; input:
                                   4794 ;   none 
                                   4795 ; output:
                                   4796 ;   X 		gpio register address
                                   4797 ;----------------------------
      001BB9                       4798 gpio:
      00998A 03 5F            [ 1] 4799 	ld a,#TK_LPAREN 
      00998C CF 00 15         [ 4] 4800 	call expect 
      00998F 35 01 00         [ 4] 4801 	call arg_list
      009992 14 02            [ 1] 4802 	cp a,#2
      009993 27 03            [ 1] 4803 	jreq 1$
      009993 92 BC 00         [ 2] 4804 	jp syntax_error  
      001BC8                       4805 1$:	
      009996 14 27            [ 1] 4806 	ld a,#TK_RPAREN 
      009998 24 5F 16         [ 4] 4807 	call expect 
      00999B 03 CD 99         [ 2] 4808 	ldw x,#2
      00999E 66 25 2C 92      [ 5] 4809 	ldw x,([dstkptr],x) ; port 
      0099A2 AF 00            [ 1] 4810 	jrmi bad_port
      0099A4 14 6B 01         [ 2] 4811 	cpw x,#9
      0099A7 5C 92            [ 1] 4812 	jrpl bad_port
      0099A9 AF 00            [ 1] 4813 	ld a,#5
      0099AB 14               [ 4] 4814 	mul x,a
      0099AC 6B 02 5C         [ 2] 4815 	addw x,#GPIO_BASE 
      0099AF 72               [ 2] 4816 	pushw x 
      0099B0 FB 01 CD         [ 4] 4817 	call dpop 
      0099B3 98 F0 AE         [ 2] 4818 	addw x,(1,sp)
      0099B6 02 80            [ 2] 4819 	ldw (1,sp),x  
      0099B8 C3 00 14         [ 4] 4820 	call ddrop  
      0099BB 2A               [ 2] 4821 	popw x 
      0099BC D6 02            [ 1] 4822 	ld a,#TK_INTGR
      0099BD 81               [ 4] 4823 	ret
      001BF1                       4824 bad_port:
      0099BD 72 5F            [ 1] 4825 	ld a,#ERR_BAD_VALUE
      0099BF 00 14 72         [ 2] 4826 	jp tb_error
                                   4827 
                                   4828 ;----------------------
                                   4829 ; BASIC: ODR 
                                   4830 ; return offset of gpio
                                   4831 ; ODR register: 0
                                   4832 ; ---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      001BF6                       4833 port_odr:
      0099C2 5F 00 15         [ 2] 4834 	ldw x,#GPIO_ODR
      0099C5 72 5F            [ 1] 4835 	ld a,#TK_INTGR
      0099C7 00               [ 4] 4836 	ret
                                   4837 
                                   4838 ;----------------------
                                   4839 ; BASIC: IDR 
                                   4840 ; return offset of gpio
                                   4841 ; IDR register: 1
                                   4842 ; ---------------------
      001BFC                       4843 port_idr:
      0099C8 16 5B 04         [ 2] 4844 	ldw x,#GPIO_IDR
      0099CB 98 81            [ 1] 4845 	ld a,#TK_INTGR
      0099CD 81               [ 4] 4846 	ret
                                   4847 
                                   4848 ;----------------------
                                   4849 ; BASIC: DDR 
                                   4850 ; return offset of gpio
                                   4851 ; DDR register: 2
                                   4852 ; ---------------------
      001C02                       4853 port_ddr:
      0099CD 5B 04 99         [ 2] 4854 	ldw x,#GPIO_DDR
      0099D0 81 02            [ 1] 4855 	ld a,#TK_INTGR
      0099D1 81               [ 4] 4856 	ret
                                   4857 
                                   4858 ;----------------------
                                   4859 ; BASIC: CRL  
                                   4860 ; return offset of gpio
                                   4861 ; CR1 register: 3
                                   4862 ; ---------------------
      001C08                       4863 port_cr1:
      0099D1 72 01 00         [ 2] 4864 	ldw x,#GPIO_CR1
      0099D4 25 05            [ 1] 4865 	ld a,#TK_INTGR
      0099D6 A6               [ 4] 4866 	ret
                                   4867 
                                   4868 ;----------------------
                                   4869 ; BASIC: CRH  
                                   4870 ; return offset of gpio
                                   4871 ; CR2 register: 4
                                   4872 ; ---------------------
      001C0E                       4873 port_cr2:
      0099D7 07 CC 87         [ 2] 4874 	ldw x,#GPIO_CR2
      0099DA 70 02            [ 1] 4875 	ld a,#TK_INTGR
      0099DB 81               [ 4] 4876 	ret
                                   4877 
                                   4878 ;-------------------------
                                   4879 ; BASIC: UFLASH 
                                   4880 ; return user flash address
                                   4881 ; input:
                                   4882 ;  none 
                                   4883 ; output:
                                   4884 ;	A		TK_INTGR
                                   4885 ;   X 		user address 
                                   4886 ;---------------------------
      001C14                       4887 uflash:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      0099DB CE 00 1E         [ 2] 4888 	ldw x,#user_space 
      0099DE 72 B0            [ 1] 4889 	ld a,#TK_INTGR 
      0099E0 00               [ 4] 4890 	ret 
                                   4891 
                                   4892 ;-------------------------
                                   4893 ; BASIC: EEPROM 
                                   4894 ; return eeprom address
                                   4895 ; input:
                                   4896 ;  none 
                                   4897 ; output:
                                   4898 ;	A		TK_INTGR
                                   4899 ;   X 		eeprom address 
                                   4900 ;---------------------------
      001C1A                       4901 eeprom:
      0099E1 1C 26 02         [ 2] 4902 	ldw x,#EEPROM_BASE 
      0099E4 4F 81            [ 1] 4903 	ld a,#TK_INTGR 
      0099E6 81               [ 4] 4904 	ret 
                                   4905 
                                   4906 ;---------------------
                                   4907 ; BASIC: USR(addr[,arg])
                                   4908 ; execute a function written 
                                   4909 ; in binary code.
                                   4910 ; binary fonction should 
                                   4911 ; return token attribute in A 
                                   4912 ; and value in X. 
                                   4913 ; input:
                                   4914 ;   addr	routine address 
                                   4915 ;   arg 	is an optional argument 
                                   4916 ; output:
                                   4917 ;   A 		token attribute 
                                   4918 ;   X       returned value 
                                   4919 ;---------------------
      001C20                       4920 usr:
      0099E6 C6 00            [ 2] 4921 	pushw y 	
      0099E8 17 CA            [ 1] 4922 	ld a,#TK_LPAREN 
      0099EA 00 18 CA         [ 4] 4923 	call expect 
      0099ED 00 19 26         [ 4] 4924 	call arg_list 
      0099F0 05 A6            [ 1] 4925 	cp a,#1 
      0099F2 01 CC            [ 1] 4926 	jrpl 2$ 
      0099F4 87 70 CD         [ 2] 4927 	jp syntax_error 
      0099F7 8D 5C            [ 1] 4928 2$: ld a,#TK_RPAREN
      0099F9 A1 07 27         [ 4] 4929 	call expect 
      0099FC 03 CC 87         [ 4] 4930 	call dpop 
      0099FF 6E 02            [ 1] 4931 	cp a,#2 
      009A00 2B 05            [ 1] 4932 	jrmi 4$
      009A00 90 93            [ 1] 4933 	ldw y,x ; y=arg 
      009A02 CD 99 87         [ 4] 4934 	call dpop ;x=addr 
      009A05 24               [ 1] 4935 4$:	exgw y,x ; y=addr,x=arg 
      009A06 05 A6            [ 4] 4936 	call (y)
      009A08 08 CC            [ 2] 4937 	popw y 
      009A0A 87               [ 4] 4938 	ret 
                                   4939 
                                   4940 ;------------------------------
                                   4941 ; BASIC: BYE 
                                   4942 ; halt mcu in its lowest power mode 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                                   4943 ; wait for reset or external interrupt
                                   4944 ; do a cold start on wakeup.
                                   4945 ;------------------------------
      001C48                       4946 bye:
      009A0B 70 0D 52 40 FB   [ 2] 4947 	btjf UART3_SR,#UART_SR_TC,.
      009A0C 8E               [10] 4948 	halt
      009A0C CE 00 17         [ 2] 4949 	jp cold_start  
                                   4950 
                                   4951 ;----------------------------------
                                   4952 ; BASIC: SLEEP 
                                   4953 ; halt mcu until reset or external
                                   4954 ; interrupt.
                                   4955 ; Resume progam after SLEEP command
                                   4956 ;----------------------------------
      001C51                       4957 sleep:
      009A0F C6 00 19 CF 00   [ 2] 4958 	btjf UART3_SR,#UART_SR_TC,.
      009A14 14 C7 00 16      [ 1] 4959 	bset flags,#FSLEEP
      009A18 AE               [10] 4960 	halt 
      009A19 17               [ 4] 4961 	ret 
                                   4962 
                                   4963 ;-------------------------------
                                   4964 ; BASIC: PAUSE expr 
                                   4965 ; suspend execution for n msec.
                                   4966 ; input:
                                   4967 ;	none
                                   4968 ; output:
                                   4969 ;	none 
                                   4970 ;------------------------------
      001C5C                       4971 pause:
      009A1A 18 CD 82         [ 4] 4972 	call expression
      009A1D F2 5C            [ 1] 4973 	cp a,#TK_INTGR
      009A1F 89 5F            [ 1] 4974 	jreq pause02 
      009A21 90 AE 17         [ 2] 4975 	jp syntax_error
      001C66                       4976 pause02: 
      009A24 18               [ 2] 4977 1$: tnzw x 
      009A25 CD 81            [ 1] 4978 	jreq 2$
      009A27 D1               [10] 4979 	wfi 
      009A28 5B               [ 2] 4980 	decw x 
      009A29 02 CE            [ 1] 4981 	jrne 1$
      009A2B 00               [ 1] 4982 2$:	clr a 
      009A2C 1E               [ 4] 4983 	ret 
                                   4984 
                                   4985 ;------------------------------
                                   4986 ; BASIC: TICKS
                                   4987 ; return msec ticks counter value 
                                   4988 ; input:
                                   4989 ; 	none 
                                   4990 ; output:
                                   4991 ;	X 		TK_INTGR
                                   4992 ;-------------------------------
      001C6F                       4993 get_ticks:
      009A2D 72 B0 00         [ 2] 4994 	ldw x,ticks 
      009A30 1C 89            [ 1] 4995 	ld a,#TK_INTGR
      009A32 5F               [ 4] 4996 	ret 
                                   4997 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   4998 
                                   4999 
                                   5000 ;------------------------------
                                   5001 ; BASIC: ABS(expr)
                                   5002 ; return absolute value of expr.
                                   5003 ; input:
                                   5004 ;   none
                                   5005 ; output:
                                   5006 ;   X     	positive integer
                                   5007 ;-------------------------------
      001C75                       5008 abs:
      009A33 7B 01            [ 1] 5009 	ld a,#TK_LPAREN
      009A35 CD 81 5C         [ 4] 5010 	call expect 
      009A38 5C 7B 02         [ 4] 5011 	call arg_list
      009A3B CD 81            [ 1] 5012 	cp a,#1 
      009A3D 5C 5C            [ 1] 5013 	jreq 0$ 
      009A3F CD 98 F0         [ 2] 5014 	jp syntax_error
      001C84                       5015 0$:  
      009A42 1E 01            [ 1] 5016 	ld a,#TK_RPAREN 
      009A44 89 5F 90         [ 4] 5017 	call expect 
      009A47 CE 00 1C         [ 4] 5018     call dpop   
      009A4A CD               [ 1] 5019 	ld a,xh 
      009A4B 81 D1            [ 1] 5020 	bcp a,#0x80 
      009A4D 5B 02            [ 1] 5021 	jreq 2$ 
      009A4F CE               [ 2] 5022 	negw x 
      009A50 00 14            [ 1] 5023 2$: ld a,#TK_INTGR 
      009A52 C6               [ 4] 5024 	ret 
                                   5025 
                                   5026 ;------------------------------
                                   5027 ; BASIC: RND(expr)
                                   5028 ; return random number 
                                   5029 ; between 1 and expr inclusive
                                   5030 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5031 ; input:
                                   5032 ; 	none 
                                   5033 ; output:
                                   5034 ;	X 		random positive integer 
                                   5035 ;------------------------------
      001C95                       5036 random:
      009A53 00 16            [ 1] 5037 	ld a,#TK_LPAREN 
      009A55 CF 00 17         [ 4] 5038 	call expect 
      009A58 C7 00 19         [ 4] 5039 	call arg_list 
      009A5B 5F 4F            [ 1] 5040 	cp a,#1
      009A5D CD 81            [ 1] 5041 	jreq 1$
      009A5F 5C 5C 4F         [ 2] 5042 	jp syntax_error
      009A62 CD 81            [ 1] 5043 1$: ld a,#TK_RPAREN
      009A64 5C 5C 4F         [ 4] 5044 	call expect 
      009A67 CD 81 5C         [ 4] 5045 	call dpop 
      009A6A 85               [ 2] 5046 	pushw x 
      009A6B A6               [ 1] 5047 	ld a,xh 
      009A6C 02 81            [ 1] 5048 	bcp a,#0x80 
      009A6E 27 05            [ 1] 5049 	jreq 2$
      009A6E 72 01            [ 1] 5050 	ld a,#ERR_BAD_VALUE
      009A70 00 25 07         [ 2] 5051 	jp tb_error
      001CB7                       5052 2$: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   5053 ; acc16=(x<<5)^x 
      009A73 27 05 A6         [ 2] 5054 	ldw x,seedx 
      009A76 07               [ 2] 5055 	sllw x 
      009A77 CC               [ 2] 5056 	sllw x 
      009A78 87               [ 2] 5057 	sllw x 
      009A79 70               [ 2] 5058 	sllw x 
      009A7A 58               [ 2] 5059 	sllw x 
      009A7A CD               [ 1] 5060 	ld a,xh 
      009A7B 8D 5C A1         [ 1] 5061 	xor a,seedx 
      009A7E 07 27 03         [ 1] 5062 	ld acc16,a 
      009A81 CC               [ 1] 5063 	ld a,xl 
      009A82 87 6E 0E         [ 1] 5064 	xor a,seedx+1 
      009A84 C7 00 0A         [ 1] 5065 	ld acc8,a 
                                   5066 ; seedx=seedy 
      009A84 90 93 CD         [ 2] 5067 	ldw x,seedy 
      009A87 99 87 25         [ 2] 5068 	ldw seedx,x  
                                   5069 ; seedy=seedy^(seedy>>1)
      009A8A 05 A6            [ 2] 5070 	srlw y 
      009A8C 09 CC            [ 1] 5071 	ld a,yh 
      009A8E 87 70 0F         [ 1] 5072 	xor a,seedy 
      009A90 C7 00 0F         [ 1] 5073 	ld seedy,a  
      009A90 CD 98            [ 1] 5074 	ld a,yl 
      009A92 F0 CD 86         [ 1] 5075 	xor a,seedy+1 
      009A95 4C 5F 92         [ 1] 5076 	ld seedy+1,a 
                                   5077 ; acc16>>3 
      009A98 AF 00 14         [ 2] 5078 	ldw x,acc16 
      009A9B 90               [ 2] 5079 	srlw x 
      009A9C 95               [ 2] 5080 	srlw x 
      009A9D 5C               [ 2] 5081 	srlw x 
                                   5082 ; x=acc16^x 
      009A9E 92               [ 1] 5083 	ld a,xh 
      009A9F AF 00 14         [ 1] 5084 	xor a,acc16 
      009AA2 5C               [ 1] 5085 	ld xh,a 
      009AA3 90               [ 1] 5086 	ld a,xl 
      009AA4 97 72 B9         [ 1] 5087 	xor a,acc8 
      009AA7 00               [ 1] 5088 	ld xl,a 
                                   5089 ; seedy=x^seedy 
      009AA8 1C 90 CF         [ 1] 5090 	xor a,seedy+1
      009AAB 00               [ 1] 5091 	ld xl,a 
      009AAC 1E               [ 1] 5092 	ld a,xh 
      009AAD 90 CE 00         [ 1] 5093 	xor a,seedy
      009AB0 1C               [ 1] 5094 	ld xh,a 
      009AB1 CF 00 0F         [ 2] 5095 	ldw seedy,x 
                                   5096 ; return seedy modulo expr + 1 
      009AB1 92 AF            [ 2] 5097 	popw y 
      009AB3 00               [ 2] 5098 	divw x,y 
      009AB4 14               [ 1] 5099 	ldw x,y 
      009AB5 90               [ 1] 5100 	incw x 
      009AB6 F7 5C            [ 1] 5101 	ld a,#TK_INTGR
      009AB8 90               [ 4] 5102 	ret 
                                   5103 
                                   5104 ;---------------------------------
                                   5105 ; BASIC: WORDS 
                                   5106 ; affiche la listes des mots du
                                   5107 ; dictionnaire.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5108 ;---------------------------------
                           000001  5109 	WLEN=1
                           000002  5110 	LLEN=2  
                           000002  5111 	VSIZE=2 
      001D09                       5112 words:
      001D09                       5113 	_vars VSIZE
      009AB9 5C 90            [ 2]    1     sub sp,#VSIZE 
      009ABB C3 00            [ 1] 5114 	clr (LLEN,sp)
      009ABD 1E 2B F1 CE      [ 2] 5115 	ldw y,#kword_dict+2
      009AC1 00               [ 1] 5116 0$:	ldw x,y
      009AC2 1E               [ 1] 5117 	ld a,(x)
      009AC3 72 B0            [ 1] 5118 	and a,#15 
      009AC5 00 1C            [ 1] 5119 	ld (WLEN,sp),a 
      009AC7 CD               [ 1] 5120 1$:	incw x 
      009AC8 89               [ 1] 5121 	ld a,(x)
      009AC9 C4 81 9E         [ 4] 5122 	call putc 
      009ACB 0C 02            [ 1] 5123 	inc (LLEN,sp)
      009ACB CD 8D            [ 1] 5124 	dec (WLEN,sp)
      009ACD 5C A1            [ 1] 5125 	jrne 1$
      009ACF 00 27            [ 1] 5126 	ld a,#70
      009AD1 1B A1            [ 1] 5127 	cp a,(LLEN,sp)
      009AD3 07 27            [ 1] 5128 	jrmi 2$   
      009AD5 03 CC            [ 1] 5129 	ld a,#SPACE 
      009AD7 87 6E 90         [ 4] 5130 	call putc 
      009ADA 93 CD            [ 1] 5131 	inc (LLEN,sp) 
      009ADC 99 87            [ 2] 5132 	jra 3$
      009ADE 25 05            [ 1] 5133 2$: ld a,#CR 
      009AE0 A6 09 CC         [ 4] 5134 	call putc 
      009AE3 87 70            [ 1] 5135 	clr (LLEN,sp)
      009AE5 72 A2 00 02      [ 2] 5136 3$:	subw y,#2 
      009AE5 CE 00            [ 2] 5137 	ldw y,(y)
      009AE7 14 C6            [ 1] 5138 	jrne 0$  
      001D40                       5139 	_drop VSIZE 
      009AE9 00 16            [ 2]    1     addw sp,#VSIZE 
      009AEB 20               [ 4] 5140 	ret 
                                   5141 
                                   5142 
                                   5143 ;*********************************
                                   5144 
                                   5145 ;------------------------------
                                   5146 ;      dictionary 
                                   5147 ; format:
                                   5148 ;   link:   2 bytes 
                                   5149 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5150 ;   cmd_name: 16 byte max 
                                   5151 ;   code_address: 2 bytes 
                                   5152 ;------------------------------
                           000080  5153 	FFUNC=128 ; function flag 
                                   5154 	.macro _dict_entry len,name,cmd 
                                   5155 	.word LINK 
                                   5156 	LINK=.
                                   5157 name:
                                   5158 	.byte len 	
                                   5159 	.ascii "name"
                                   5160 	.word cmd 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                                   5161 	.endm 
                                   5162 
                           000000  5163 	LINK=0
      001D43                       5164 kword_end:
      001D43                       5165 	_dict_entry,3,BYE,bye 
      009AEC 0B 00                    1 	.word LINK 
                           001D45     2 	LINK=.
      009AED                          3 BYE:
      009AED AE                       4 	.byte 3 	
      009AEE 00 00 4F                 5 	.ascii "BYE"
      009AF1 01 CF                    6 	.word bye 
      001D4B                       5166 	_dict_entry,5,WORDS,words 
      009AF3 00 14                    1 	.word LINK 
                           001D4D     2 	LINK=.
      001D4D                          3 WORDS:
      009AF5 C7                       4 	.byte 5 	
      009AF6 00 16 52 44 53           5 	.ascii "WORDS"
      009AF8 1D 09                    6 	.word words 
      001D55                       5167 	_dict_entry,5,SLEEP,sleep 
      009AF8 CF 00                    1 	.word LINK 
                           001D57     2 	LINK=.
      001D57                          3 SLEEP:
      009AFA 17                       4 	.byte 5 	
      009AFB C7 00 19 5F 4F           5 	.ascii "SLEEP"
      009B00 CD 81                    6 	.word sleep 
      001D5F                       5168 	_dict_entry,6,FORGET,forget 
      009B02 5C AE                    1 	.word LINK 
                           001D61     2 	LINK=.
      001D61                          3 FORGET:
      009B04 00                       4 	.byte 6 	
      009B05 01 CD 98 F0 C6 00        5 	.ascii "FORGET"
      009B0B 14 C1                    6 	.word forget 
      001D6A                       5169 	_dict_entry,3,DIR,directory 
      009B0D 00 17                    1 	.word LINK 
                           001D6C     2 	LINK=.
      001D6C                          3 DIR:
      009B0F 2B                       4 	.byte 3 	
      009B10 ED CE 00                 5 	.ascii "DIR"
      009B13 15 C3                    6 	.word directory 
      001D72                       5170 	_dict_entry,4,LOAD,load 
      009B15 00 18                    1 	.word LINK 
                           001D74     2 	LINK=.
      001D74                          3 LOAD:
      009B17 2B                       4 	.byte 4 	
      009B18 E5 81 41 44              5 	.ascii "LOAD"
      009B1A 19 EE                    6 	.word load 
      001D7B                       5171 	_dict_entry,4,SAVE,save
      009B1A 52 02                    1 	.word LINK 
                           001D7D     2 	LINK=.
      001D7D                          3 SAVE:
      009B1C 5F                       4 	.byte 4 	
      009B1D 1F 01 CF 00              5 	.ascii "SAVE"
      009B21 15 35                    6 	.word save 
      001D84                       5172 	_dict_entry,5,WRITE,write  
      009B23 01 00                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                           001D86     2 	LINK=.
      001D86                          3 WRITE:
      009B25 14                       4 	.byte 5 	
      009B26 57 52 49 54 45           5 	.ascii "WRITE"
      009B26 5F 92                    6 	.word write 
      001D8E                       5173 	_dict_entry,3,NEW,new
      009B28 AF 00                    1 	.word LINK 
                           001D90     2 	LINK=.
      001D90                          3 NEW:
      009B2A 14                       4 	.byte 3 	
      009B2B 27 38 57                 5 	.ascii "NEW"
      009B2D 18 65                    6 	.word new 
      001D96                       5174 	_dict_entry,5,BREAK,break 
      009B2D 92 AF                    1 	.word LINK 
                           001D98     2 	LINK=.
      001D98                          3 BREAK:
      009B2F 00                       4 	.byte 5 	
      009B30 14 27 06 CD 82           5 	.ascii "BREAK"
      009B35 1E 5C                    6 	.word break 
      001DA0                       5175 	_dict_entry,4,BEEP,beep 
      009B37 20 F4                    1 	.word LINK 
                           001DA2     2 	LINK=.
      001DA2                          3 BEEP:
      009B39 5C                       4 	.byte 4 	
      009B3A A6 20 CD 82              5 	.ascii "BEEP"
      009B3E 1E 92                    6 	.word beep 
      001DA9                       5176 	_dict_entry,4,STOP,stop 
      009B40 AF 00                    1 	.word LINK 
                           001DAB     2 	LINK=.
      001DAB                          3 STOP:
      009B42 14                       4 	.byte 4 	
      009B43 90 95 5C 92              5 	.ascii "STOP"
      009B47 AF 00                    6 	.word stop 
      001DB2                       5177     _dict_entry,4,SHOW,show 
      009B49 14 5C                    1 	.word LINK 
                           001DB4     2 	LINK=.
      001DB4                          3 SHOW:
      009B4B 90                       4 	.byte 4 	
      009B4C 97 90 89 72              5 	.ascii "SHOW"
      009B50 FB 01                    6 	.word show 
      001DBB                       5178 	_dict_entry 3,RUN,run
      009B52 CD 98                    1 	.word LINK 
                           001DBD     2 	LINK=.
      001DBD                          3 RUN:
      009B54 F0                       4 	.byte 3 	
      009B55 85 CD 89                 5 	.ascii "RUN"
      009B58 C4 A6                    6 	.word run 
      001DC3                       5179 	_dict_entry 4,LIST,list
      009B5A 0D CD                    1 	.word LINK 
                           001DC5     2 	LINK=.
      001DC5                          3 LIST:
      009B5C 82                       4 	.byte 4 	
      009B5D 1E 1E 01 5C              5 	.ascii "LIST"
      009B61 1F 01                    6 	.word list 
      001DCC                       5180 	_dict_entry,3+FFUNC,USR,usr
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009B63 20 C1                    1 	.word LINK 
                           001DCE     2 	LINK=.
      009B65                          3 USR:
      009B65 1E                       4 	.byte 3+FFUNC 	
      009B66 01 CD 89                 5 	.ascii "USR"
      009B69 C4 AE                    6 	.word usr 
      001DD4                       5181 	_dict_entry,6+FFUNC,EEPROM,eeprom 
      009B6B 9B 9A                    1 	.word LINK 
                           001DD6     2 	LINK=.
      001DD6                          3 EEPROM:
      009B6D CD                       4 	.byte 6+FFUNC 	
      009B6E 82 30 A6 FF C0 00        5 	.ascii "EEPROM"
      009B74 19 C7                    6 	.word eeprom 
      001DDF                       5182 	_dict_entry,6+FFUNC,UFLASH,uflash 
      009B76 00 0B                    1 	.word LINK 
                           001DE1     2 	LINK=.
      001DE1                          3 UFLASH:
      009B78 A6                       4 	.byte 6+FFUNC 	
      009B79 7F C2 00 18 C7 00        5 	.ascii "UFLASH"
      009B7F 0A A6                    6 	.word uflash 
      001DEA                       5183 	_dict_entry,3+FFUNC,ODR,port_odr
      009B81 02 C2                    1 	.word LINK 
                           001DEC     2 	LINK=.
      001DEC                          3 ODR:
      009B83 00                       4 	.byte 3+FFUNC 	
      009B84 17 C7 00                 5 	.ascii "ODR"
      009B87 09 5F                    6 	.word port_odr 
      001DF2                       5184 	_dict_entry,3+FFUNC,IDR,port_idr
      009B89 A6 06                    1 	.word LINK 
                           001DF4     2 	LINK=.
      001DF4                          3 IDR:
      009B8B 97                       4 	.byte 3+FFUNC 	
      009B8C A6 0A CD                 5 	.ascii "IDR"
      009B8F 89 7C                    6 	.word port_idr 
      001DFA                       5185 	_dict_entry,3+FFUNC,DDR,port_ddr 
      009B91 AE 9B                    1 	.word LINK 
                           001DFC     2 	LINK=.
      001DFC                          3 DDR:
      009B93 A2                       4 	.byte 3+FFUNC 	
      009B94 CD 82 30                 5 	.ascii "DDR"
      009B97 5B 02                    6 	.word port_ddr 
      001E02                       5186 	_dict_entry,3+FFUNC,CRL,port_cr1 
      009B99 81 20                    1 	.word LINK 
                           001E04     2 	LINK=.
      001E04                          3 CRL:
      009B9B 66                       4 	.byte 3+FFUNC 	
      009B9C 69 6C 65                 5 	.ascii "CRL"
      009B9F 73 0A                    6 	.word port_cr1 
      001E0A                       5187 	_dict_entry,3+FFUNC,CRH,port_cr2
      009BA1 00 20                    1 	.word LINK 
                           001E0C     2 	LINK=.
      001E0C                          3 CRH:
      009BA3 62                       4 	.byte 3+FFUNC 	
      009BA4 79 74 65                 5 	.ascii "CRH"
      009BA7 73 20                    6 	.word port_cr2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      001E12                       5188 	_dict_entry,4+FFUNC,GPIO,gpio 
      009BA9 66 72                    1 	.word LINK 
                           001E14     2 	LINK=.
      001E14                          3 GPIO:
      009BAB 65                       4 	.byte 4+FFUNC 	
      009BAC 65 0A 00 4F              5 	.ascii "GPIO"
      009BAF 1B B9                    6 	.word gpio 
      001E1B                       5189 	_dict_entry,6,PWRADC,power_adc 
      009BAF 52 02                    1 	.word LINK 
                           001E1D     2 	LINK=.
      001E1D                          3 PWRADC:
      009BB1 72                       4 	.byte 6 	
      009BB2 5F 00 14 CD 92 EA        5 	.ascii "PWRADC"
      009BB8 A1 02                    6 	.word power_adc 
      001E26                       5190 	_dict_entry,5+FFUNC,RDADC,read_adc
      009BBA 27 03                    1 	.word LINK 
                           001E28     2 	LINK=.
      001E28                          3 RDADC:
      009BBC CC                       4 	.byte 5+FFUNC 	
      009BBD 87 6E 1F 01 CD           5 	.ascii "RDADC"
      009BC2 8D 5C                    6 	.word read_adc 
      001E30                       5191 	_dict_entry,3+FFUNC,ASC,ascii  
      009BC4 A1 0A                    1 	.word LINK 
                           001E32     2 	LINK=.
      001E32                          3 ASC:
      009BC6 27                       4 	.byte 3+FFUNC 	
      009BC7 02 20 19                 5 	.ascii "ASC"
      009BCA CD 92                    6 	.word ascii 
      001E38                       5192 	_dict_entry,4+FFUNC,CHAR,char
      009BCC EA A1                    1 	.word LINK 
                           001E3A     2 	LINK=.
      001E3A                          3 CHAR:
      009BCE 02                       4 	.byte 4+FFUNC 	
      009BCF 27 03 CC 87              5 	.ascii "CHAR"
      009BD3 6E 9F                    6 	.word char 
      001E41                       5193 	_dict_entry,4+FFUNC,QKEY,qkey  
      009BD5 1E 01                    1 	.word LINK 
                           001E43     2 	LINK=.
      001E43                          3 QKEY:
      009BD7 CF                       4 	.byte 4+FFUNC 	
      009BD8 00 15 5F CD              5 	.ascii "QKEY"
      009BDC 81 5C                    6 	.word qkey 
      001E4A                       5194 	_dict_entry,3+FFUNC,KEY,key 
      009BDE 1E 01                    1 	.word LINK 
                           001E4C     2 	LINK=.
      001E4C                          3 KEY:
      009BE0 5C                       4 	.byte 3+FFUNC 	
      009BE1 20 DC 59                 5 	.ascii "KEY"
      009BE3 1B A7                    6 	.word key 
      001E52                       5195 	_dict_entry,4+FFUNC,SIZE,size
      009BE3 5B 02                    1 	.word LINK 
                           001E54     2 	LINK=.
      001E54                          3 SIZE:
      009BE5 81                       4 	.byte 4+FFUNC 	
      009BE6 53 49 5A 45              5 	.ascii "SIZE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009BE6 A6 08                    6 	.word size 
      001E5B                       5196 	_dict_entry,3,HEX,hex_base
      009BE8 CD 91                    1 	.word LINK 
                           001E5D     2 	LINK=.
      001E5D                          3 HEX:
      009BEA E3                       4 	.byte 3 	
      009BEB CD 93 2E                 5 	.ascii "HEX"
      009BEE A1 02                    6 	.word hex_base 
      001E63                       5197 	_dict_entry,3,DEC,dec_base
      009BF0 27 03                    1 	.word LINK 
                           001E65     2 	LINK=.
      001E65                          3 DEC:
      009BF2 CC                       4 	.byte 3 	
      009BF3 87 6E 89                 5 	.ascii "DEC"
      009BF6 A6 09                    6 	.word dec_base 
      001E6B                       5198 	_dict_entry,5+FFUNC,TICKS,get_ticks
      009BF8 CD 91                    1 	.word LINK 
                           001E6D     2 	LINK=.
      001E6D                          3 TICKS:
      009BFA E3                       4 	.byte 5+FFUNC 	
      009BFB 85 9F A4 7F 97           5 	.ascii "TICKS"
      009C00 A6 0C                    6 	.word get_ticks 
      001E75                       5199 	_dict_entry,3+FFUNC,ABS,abs
      009C02 81 6D                    1 	.word LINK 
                           001E77     2 	LINK=.
      009C03                          3 ABS:
      009C03 A6                       4 	.byte 3+FFUNC 	
      009C04 08 CD 91                 5 	.ascii "ABS"
      009C07 E3 CD                    6 	.word abs 
      001E7D                       5200 	_dict_entry,3+FFUNC,RND,random 
      009C09 8D 5C                    1 	.word LINK 
                           001E7F     2 	LINK=.
      001E7F                          3 RND:
      009C0B A1                       4 	.byte 3+FFUNC 	
      009C0C 07 27 07                 5 	.ascii "RND"
      009C0F A1 0C                    6 	.word random 
      001E85                       5201 	_dict_entry,5,PAUSE,pause 
      009C11 27 06                    1 	.word LINK 
                           001E87     2 	LINK=.
      001E87                          3 PAUSE:
      009C13 CC                       4 	.byte 5 	
      009C14 87 6E 55 53 45           5 	.ascii "PAUSE"
      009C16 1C 5C                    6 	.word pause 
      001E8F                       5202 	_dict_entry,4,BSET,bit_set 
      009C16 F6 20                    1 	.word LINK 
                           001E91     2 	LINK=.
      001E91                          3 BSET:
      009C18 01                       4 	.byte 4 	
      009C19 42 53 45 54              5 	.ascii "BSET"
      009C19 9F 97                    6 	.word bit_set 
      001E98                       5203 	_dict_entry,4,BRES,bit_reset
      009C1B 4F 95                    1 	.word LINK 
                           001E9A     2 	LINK=.
      001E9A                          3 BRES:
      009C1D 89                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009C1E A6 09 CD 91              5 	.ascii "BRES"
      009C22 E3 85                    6 	.word bit_reset 
      001EA1                       5204 	_dict_entry,5,BTOGL,bit_toggle
      009C24 A6 02                    1 	.word LINK 
                           001EA3     2 	LINK=.
      001EA3                          3 BTOGL:
      009C26 81                       4 	.byte 5 	
      009C27 42 54 4F 47 4C           5 	.ascii "BTOGL"
      009C27 CD 82                    6 	.word bit_toggle 
      001EAB                       5205 	_dict_entry 4,WAIT,wait 
      009C29 27 5F                    1 	.word LINK 
                           001EAD     2 	LINK=.
      001EAD                          3 WAIT:
      009C2B 97                       4 	.byte 4 	
      009C2C A6 02 81 54              5 	.ascii "WAIT"
      009C2F 15 09                    6 	.word wait 
      001EB4                       5206 	_dict_entry 6,REMARK,rem 
      009C2F 5F 72                    1 	.word LINK 
                           001EB6     2 	LINK=.
      001EB6                          3 REMARK:
      009C31 0B                       4 	.byte 6 	
      009C32 52 40 01 5C A6 02        5 	.ascii "REMARK"
      009C38 81 08                    6 	.word rem 
      009C39                       5207 	_dict_entry 5,PRINT,print 
      009C39 A6 08                    1 	.word LINK 
                           001EC1     2 	LINK=.
      001EC1                          3 PRINT:
      009C3B CD                       4 	.byte 5 	
      009C3C 91 E3 CD 91 F0           5 	.ascii "PRINT"
      009C41 A1 02                    6 	.word print 
      001EC9                       5208 	_dict_entry,2,IF,if 
      009C43 27 03                    1 	.word LINK 
                           001ECB     2 	LINK=.
      001ECB                          3 IF:
      009C45 CC                       4 	.byte 2 	
      009C46 87 6E                    5 	.ascii "IF"
      009C48 15 A1                    6 	.word if 
      001ED0                       5209 	_dict_entry,5,GOSUB,gosub 
      009C48 A6 09                    1 	.word LINK 
                           001ED2     2 	LINK=.
      001ED2                          3 GOSUB:
      009C4A CD                       4 	.byte 5 	
      009C4B 91 E3 AE 00 02           5 	.ascii "GOSUB"
      009C50 72 DE                    6 	.word gosub 
      001EDA                       5210 	_dict_entry,4,GOTO,goto 
      009C52 00 1A                    1 	.word LINK 
                           001EDC     2 	LINK=.
      001EDC                          3 GOTO:
      009C54 2B                       4 	.byte 4 	
      009C55 1B A3 00 09              5 	.ascii "GOTO"
      009C59 2A 16                    6 	.word goto 
      001EE3                       5211 	_dict_entry,3,FOR,for 
      009C5B A6 05                    1 	.word LINK 
                           001EE5     2 	LINK=.
      001EE5                          3 FOR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009C5D 42                       4 	.byte 3 	
      009C5E 1C 50 00                 5 	.ascii "FOR"
      009C61 89 CD                    6 	.word for 
      001EEB                       5212 	_dict_entry,2,TO,to
      009C63 8F FF                    1 	.word LINK 
                           001EED     2 	LINK=.
      001EED                          3 TO:
      009C65 72                       4 	.byte 2 	
      009C66 FB 01                    5 	.ascii "TO"
      009C68 1F 01                    6 	.word to 
      001EF2                       5213 	_dict_entry,4,STEP,step 
      009C6A CD 90                    1 	.word LINK 
                           001EF4     2 	LINK=.
      001EF4                          3 STEP:
      009C6C 26                       4 	.byte 4 	
      009C6D 85 A6 02 81              5 	.ascii "STEP"
      009C71 16 0F                    6 	.word step 
      001EFB                       5214 	_dict_entry,4,NEXT,next 
      009C71 A6 0A                    1 	.word LINK 
                           001EFD     2 	LINK=.
      001EFD                          3 NEXT:
      009C73 CC                       4 	.byte 4 	
      009C74 87 70 58 54              5 	.ascii "NEXT"
      009C76 16 37                    6 	.word next 
      001F04                       5215 	_dict_entry,6+FFUNC,UBOUND,ubound 
      009C76 AE 00                    1 	.word LINK 
                           001F06     2 	LINK=.
      001F06                          3 UBOUND:
      009C78 00                       4 	.byte 6+FFUNC 	
      009C79 A6 02 81 55 4E 44        5 	.ascii "UBOUND"
      009C7C 13 29                    6 	.word ubound 
      001F0F                       5216 	_dict_entry,6,RETURN,return 
      009C7C AE 00                    1 	.word LINK 
                           001F11     2 	LINK=.
      001F11                          3 RETURN:
      009C7E 01                       4 	.byte 6 	
      009C7F A6 02 81 55 52 4E        5 	.ascii "RETURN"
      009C82 17 04                    6 	.word return 
      001F1A                       5217 	_dict_entry,4+FFUNC,PEEK,peek 
      009C82 AE 00                    1 	.word LINK 
                           001F1C     2 	LINK=.
      001F1C                          3 PEEK:
      009C84 02                       4 	.byte 4+FFUNC 	
      009C85 A6 02 81 4B              5 	.ascii "PEEK"
      009C88 15 84                    6 	.word peek 
      001F23                       5218 	_dict_entry,4,POKE,poke 
      009C88 AE 00                    1 	.word LINK 
                           001F25     2 	LINK=.
      001F25                          3 POKE:
      009C8A 03                       4 	.byte 4 	
      009C8B A6 02 81 45              5 	.ascii "POKE"
      009C8E 15 71                    6 	.word poke 
      001F2C                       5219 	_dict_entry,5,INPUT,input_var  
      009C8E AE 00                    1 	.word LINK 
                           001F2E     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      001F2E                          3 INPUT:
      009C90 04                       4 	.byte 5 	
      009C91 A6 02 81 55 54           5 	.ascii "INPUT"
      009C94 14 94                    6 	.word input_var 
      001F36                       5220 kword_dict:
      001F36                       5221 	_dict_entry 3,LET,let 
      009C94 AE A0                    1 	.word LINK 
                           001F38     2 	LINK=.
      001F38                          3 LET:
      009C96 00                       4 	.byte 3 	
      009C97 A6 02 81                 5 	.ascii "LET"
      009C9A 13 37                    6 	.word let 
                                   5222 	
                                   5223 
      001F80                       5224 	.bndry 128 ; align on FLASH block.
                                   5225 ; free space for user application  
      001F80                       5226 user_space:
                                   5227 ; USR() function test
      009C9A AE               [ 2] 5228 	pushw x 
      009C9B 40 00 A6 02      [ 1] 5229 	bset PC_ODR,#5 
      009C9F 81               [ 2] 5230 	popw x 
      009CA0 CD 1C 66         [ 4] 5231 	call pause02 
      009CA0 90 89 A6 08      [ 1] 5232 	bres PC_ODR,#5 
      009CA4 CD               [ 4] 5233 	ret
                                   5234 
                                   5235 	.area FLASH_DRIVE (ABS)
      010000                       5236 	.org 0x10000
      010000                       5237 fdrive:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        001E77 R   |     ADC_CR1 =  005401 
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
    ARG_OFS =  000002     |   5 ASC        001E32 R   |     ATTRIB  =  000002 
    AWU_APR =  0050F1     |     AWU_CSR1=  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |   5 BEEP       001DA2 R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_ER=  000000     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  000005 
  5 BREAK      001D98 R   |   5 BRES       001E9A R   |   5 BSET       001E91 R
    BSIZE   =  000005     |     BSP     =  000008     |   5 BTOGL      001EA3 R
    BTW     =  000001     |     BUFIDX  =  000003     |   5 BYE        001D45 R
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
  5 CHAR       001E3A R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
    CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0     |     CLK_ICKR=  000002 
    CLK_ICKR=  000000     |     CLK_ICKR=  000001     |     CLK_ICKR=  000003 
    CLK_ICKR=  000004     |     CLK_ICKR=  000005     |     CLK_PCKE=  0050C7 
    CLK_PCKE=  000000     |     CLK_PCKE=  000001     |     CLK_PCKE=  000007 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

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
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        001E0C R
  5 CRL        001E04 R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
    DBG_Y   =  000001     |   5 DDR        001DFC R   |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   5 DEC        001E65 R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        001D6C R   |     DIVIDND =  000007     |     DIVISR  =  000005 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |     DSTACK_S=  000040 
  5 EEPROM     001DD6 R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
    EEPROM_S=  000800     |     ERR_BAD_=  00000A     |     ERR_CMD_=  000007 
    ERR_DIV0=  000004     |     ERR_DUPL=  000008     |     ERR_MATH=  000003 
    ERR_MEM_=  000001     |     ERR_NONE=  000000     |     ERR_NOT_=  000009 
    ERR_NO_A=  00000B     |     ERR_NO_L=  000005     |     ERR_RUN_=  000006 
    ERR_SYNT=  000002     |     ESC     =  00001B     |     EXTI_CR1=  0050A0 
    EXTI_CR2=  0050A1     |     FBREAK  =  000004     |     FF      =  00000C 
    FFOR    =  000002     |     FFUNC   =  000080     |     FHSE    =  7A1200 
    FHSI    =  F42400     |     FIRST   =  000001     |     FLASH_BA=  008000 
    FLASH_CR=  00505A     |     FLASH_CR=  000002     |     FLASH_CR=  000000 
    FLASH_CR=  000003     |     FLASH_CR=  000001     |     FLASH_CR=  00505B 
    FLASH_CR=  000005     |     FLASH_CR=  000004     |     FLASH_CR=  000007 
    FLASH_CR=  000000     |     FLASH_CR=  000006     |     FLASH_DU=  005064 
    FLASH_DU=  0000AE     |     FLASH_DU=  000056     |     FLASH_EN=  027FFF 
    FLASH_FP=  00505D     |     FLASH_FP=  000000     |     FLASH_FP=  000001 
    FLASH_FP=  000002     |     FLASH_FP=  000003     |     FLASH_FP=  000004 
    FLASH_FP=  000005     |     FLASH_IA=  00505F     |     FLASH_IA=  000003 
    FLASH_IA=  000002     |     FLASH_IA=  000006     |     FLASH_IA=  000001 
    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLSI    =  01F400 
  5 FOR        001EE5 R   |   5 FORGET     001D61 R   |     FRUN    =  000000 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FTRAP   =  000001 
  5 GOSUB      001ED2 R   |     GOS_RET =  000003     |   5 GOTO       001EDC R
  5 GPIO       001E14 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   5 HEX        001E5D R
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
    I2C_WRIT=  000000     |   5 IDR        001DF4 R   |   5 IF         001ECB R
    IN      =  000007     |     INCR    =  000001     |   5 INPUT      001F2E R
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
    INT_VECT=  008004     |     INT_VECT=  008050     |     INT_VECT=  00804C 
    INT_VECT=  00805C     |     INT_VECT=  008058     |     INW     =  000003 
    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        001E4C R
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  5 LET        001F38 R   |     LINENO  =  000005     |   5 LINK    =  001F38 R
  5 LIST       001DC5 R   |     LL      =  000002     |     LLEN    =  000002 
    LL_HB   =  000001     |     LNO     =  000005     |     LN_PTR  =  000005 
  5 LOAD       001D74 R   |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MINOR   =  000000     |     MULOP   =  000005 
    N1      =  000001     |     N1_HB   =  000006     |     N1_LB   =  000007 
    N2      =  000003     |     N2_HB   =  000008     |     N2_LB   =  000009 
    NAFR    =  004804     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        001D90 R   |   5 NEXT       001EFD R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NL      =  00000A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R
  5 ODR        001DEC R   |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |     PAD_SIZE=  000028     |   5 PAUSE      001E87 R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       001F1C R   |     PE_BASE =  005014 
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
  5 POKE       001F25 R   |     PREV    =  000001     |   5 PRINT      001EC1 R
    PROD    =  000002     |     PSIZE   =  000001     |   5 PWRADC     001E1D R
  5 QKEY       001E43 R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 RDADC      001E28 R   |   5 REG_A      0008EE R
  5 REG_CC     0008F2 R   |   5 REG_EPC    0008E1 R   |   5 REG_SP     0008F7 R
  5 REG_X      0008EA R   |   5 REG_Y      0008E6 R   |     RELOP   =  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

  5 REMARK     001EB6 R   |     RETL1   =  000001     |   5 RETURN     001F11 R
  5 RND        001E7F R   |     ROP     =  004800     |     RST_SR  =  0050B3 
  5 RUN        001DBD R   |     RXCHAR  =  000001     |     R_A     =  000007 
    R_CC    =  000008     |     R_X     =  000005     |     R_Y     =  000003 
  5 SAVE       001D7D R   |     SDIVD   =  000002     |     SFR_BASE=  005000 
    SFR_END =  0057FF     |     SHARP   =  000023     |   5 SHOW       001DB4 R
    SIGN    =  000001     |   5 SIZE       001E54 R   |     SKIP    =  000006 
  5 SLEEP      001D57 R   |     SPACE   =  000020     |     SPI_CR1 =  005200 
    SPI_CR2 =  005201     |     SPI_CRCP=  005205     |     SPI_DR  =  005204 
    SPI_ICR =  005202     |     SPI_RXCR=  005206     |     SPI_SR  =  005203 
    SPI_TXCR=  005207     |     SQUOT   =  000001     |     SRC     =  000003 
    STACK_EM=  0017FF     |     STACK_SI=  000080     |   5 STATES     0008A4 R
  5 STEP       001EF4 R   |   5 STOP       001DAB R   |     SWIM_CSR=  007F80 
    TAB     =  000009     |     TAB_WIDT=  000004     |     TCHAR   =  000001 
    TEMP    =  000003     |     TIB_SIZE=  000050     |     TICK    =  000027 
  5 TICKS      001E6D R   |     TIM1_ARR=  005262     |     TIM1_ARR=  005263 
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
    TIM1_SMC=  000000     |     TIM1_SMC=  000001     |     TIM1_SMC=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM_CR1_=  000002     |     TK_ARRAY=  000004     |     TK_CHAR =  00000C 
    TK_CMD  =  000005     |     TK_COLON=  000001     |     TK_COMMA=  00000A 
    TK_DIV  =  000021     |     TK_EQUAL=  000032     |     TK_FUNC =  000006 
    TK_GE   =  000033     |     TK_GRP_A=  000010     |     TK_GRP_M=  000030 
    TK_GRP_M=  000000     |     TK_GRP_M=  000020     |     TK_GRP_R=  000030 
    TK_GT   =  000031     |     TK_INTGR=  000002     |     TK_LE   =  000036 
    TK_LPARE=  000008     |     TK_LT   =  000034     |     TK_MINUS=  000011 
    TK_MOD  =  000022     |     TK_MULT =  000020     |     TK_NE   =  000035 
    TK_NONE =  000000     |     TK_PLUS =  000010     |     TK_QSTR =  000007 
    TK_RPARE=  000009     |     TK_SHARP=  00000B     |     TK_VAR  =  000003 
  5 TO         001EED R   |   5 Timer4Up   000019 R   |   5 TrapHand   00000A R
    U8      =  000003     |     UART1   =  000000     |     UART1_BA=  005230 
    UART1_BR=  005232     |     UART1_BR=  005233     |     UART1_CR=  005234 
    UART1_CR=  005235     |     UART1_CR=  005236     |     UART1_CR=  005237 
    UART1_CR=  005238     |     UART1_DR=  005231     |     UART1_GT=  005239 
    UART1_PO=  000000     |     UART1_PS=  00523A     |     UART1_RX=  000004 
    UART1_SR=  005230     |     UART1_TX=  000005     |     UART3   =  000001 
    UART3_BA=  005240     |     UART3_BR=  005242     |     UART3_BR=  005243 
    UART3_CR=  005244     |     UART3_CR=  005245     |     UART3_CR=  005246 
    UART3_CR=  005247     |     UART3_CR=  004249     |     UART3_DR=  005241 
    UART3_PO=  00000F     |     UART3_RX=  000006     |     UART3_SR=  005240 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Symbol Table

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
  5 UBOUND     001F06 R   |   5 UFLASH     001DE1 R   |   5 USER_ABO   00007E R
  5 USR        001DCE R   |     USR_BTN_=  000004     |     USR_BTN_=  000010 
    USR_BTN_=  005015     |   5 UserButt   000025 R   |     VSIZ    =  000002 
    VSIZE   =  000002     |     VT      =  00000B     |   5 WAIT       001EAD R
    WDGOPT  =  004805     |     WDGOPT_I=  000002     |     WDGOPT_L=  000003 
    WDGOPT_W=  000000     |     WDGOPT_W=  000001     |     WIDTH   =  000001 
    WLEN    =  000001     |   5 WORDS      001D4D R   |   5 WRITE      001D86 R
    WWDG_CR =  0050D1     |     WWDG_WR =  0050D2     |     XMASK   =  000001 
    XSAVE   =  000001     |     YSAVE   =  000003     |   5 abs        001C75 R
  1 acc16      000009 R   |   1 acc24      000008 R   |   1 acc8       00000A R
  5 accept_c   000A9C R   |   5 add        001060 R   |   5 ansi_seq   000A5A R
  5 arg_list   001170 R   |   1 array_ad   000020 R   |   1 array_si   000022 R
  5 ascii      001B83 R   |   5 at_tst     000D97 R   |   5 atoi24     000EAC R
  5 atoi_exi   000F1A R   |   5 bad_port   001BF1 R   |   1 base       000007 R
  1 basicptr   000003 R   |   5 beep       001780 R   |   5 bin_exit   000C8F R
  5 bit_rese   001548 R   |   5 bit_set    001534 R   |   5 bit_togg   00155D R
  5 bkslsh_t   000D42 R   |   5 bksp       0001BA R   |   5 break      001816 R
  5 break_po   001847 R   |   5 bye        001C48 R   |   5 char       001B66 R
  5 check_fu   0003F7 R   |   5 clear_ba   0005CC R   |   5 clear_va   0004DC R
  5 clock_in   000099 R   |   5 cmd_itf    000AC0 R   |   5 cmp_name   0018E6 R
  5 cold_sta   000541 R   |   5 colon_ts   000D6B R   |   5 comma_ts   000D76 R
  5 compile    000406 R   |   5 convert_   000BF5 R   |   1 count      000002 R
  5 cp_loop    00111C R   |   5 create_g   000338 R   |   5 cstk_pro   00102A R
  5 dash_tst   000D8C R   |   5 ddrop      000FA6 R   |   5 ddrop_n    000FE3 R
  5 ddup       000FAF R   |   5 dec_base   00131A R   |   5 del_back   000A8D R
  5 del_line   00030B R   |   5 del_ln     000A7E R   |   5 delete     0001CA R
  5 dir_loop   001AA6 R   |   5 director   001A9A R   |   5 divide     0010B6 R
  5 divu24_8   0009E7 R   |   5 dotr       001033 R   |   5 dotr_loo   001048 R
  5 dots       001000 R   |   5 dpick      000FC0 R   |   5 dpop       000F7F R
  5 dpush      000F72 R   |   5 drive_fr   001B22 R   |   3 dstack     001740 R
  3 dstack_u   001780 R   |   5 dstk_pro   000FF6 R   |   1 dstkptr    000019 R
  5 dswap      000F8C R   |   5 eeprom     001C1A R   |   5 eql_tst    000DF9 R
  5 err_bad_   0006AD R   |   5 err_cmd_   00066E R   |   5 err_div0   000630 R
  5 err_dupl   000689 R   |   5 err_math   000616 R   |   5 err_mem_   0005F9 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Symbol Table

  5 err_msg    0005E1 R   |   5 err_no_a   0006BA R   |   5 err_no_l   000640 R
  5 err_not_   00069B R   |   5 err_run_   000657 R   |   5 err_synt   000607 R
  5 expect     001163 R   |   5 expr_exi   0012AB R   |   5 expressi   00126A R
  5 factor     0011C7 R   |   1 farptr     000013 R   |   7 fdrive     010000 R
  5 fetch      000FCF R   |   5 fetchc     000BAD R   |   1 ffree      000016 R
  5 file_cou   001B1A R   |   5 final_te   000A54 R   |   5 first_li   00138A R
  1 flags      000024 R   |   5 for        0015B5 R   |   5 forget     001A4B R
  1 free_ram   00005A R   |   5 get_arra   001194 R   |   5 get_tick   001C6F R
  5 get_toke   000CDC R   |   5 getc       0001A7 R   |   5 go_commo   0016DC R
  5 gosub      0016B9 R   |   5 goto       0016AC R   |   5 gpio       001BB9 R
  5 gt_tst     000E04 R   |   5 hex_base   001315 R   |   5 hse_cloc   000187 R
  5 hsi_cloc   000191 R   |   5 if         0015A1 R   |   1 in         000001 R
  1 in.w       000000 R   |   1 in.w.sav   000011 R   |   5 incr_far   001870 R
  5 input_ex   001505 R   |   5 input_lo   0014A0 R   |   5 input_va   001494 R
  5 insert_l   000369 R   |   5 insert_l   0003F4 R   |   5 interp     00076A R
  5 interp_l   0007B3 R   |   5 invalid    000B05 R   |   5 invalid_   000B83 R
  5 is_alpha   0004EA R   |   5 is_digit   000E97 R   |   5 itoa       0009A0 R
  5 itoa_loo   0009B8 R   |   5 key        001BA7 R   |   5 kword_di   001F36 R
  5 kword_en   001D43 R   |   5 last_lin   001393 R   |   5 ledoff     0007F4 R
  5 ledon      0007EF R   |   5 ledtoggl   0007F9 R   |   5 left_arr   000A5A R
  5 left_par   000802 R   |   5 let        001337 R   |   5 let02      001341 R
  1 lineno     000005 R   |   5 lines_sk   001398 R   |   5 list       00135F R
  5 list_exi   0013E2 R   |   5 list_sta   0013BB R   |   5 load       0019EE R
  5 loop_bac   00167F R   |   1 loop_dep   00001F R   |   5 loop_don   00169A R
  5 lt_tst     000E3D R   |   5 mem_peek   000B22 R   |   5 modulo     0010FA R
  5 move       00029E R   |   5 move_dow   0002BC R   |   5 move_exi   0002DD R
  5 move_loo   0002C1 R   |   5 move_up    0002AE R   |   5 multiply   00106E R
  5 mulu24_8   000F1E R   |   5 nbr_tst    000D18 R   |   5 neg_acc2   000A0F R
  5 new        001865 R   |   5 next       001637 R   |   5 no_match   00112E R
  5 none       000CDC R   |   5 number     000BB3 GR  |   5 other      000E75 R
  3 pad        001718 R   |   5 parse_bi   000C6F R   |   5 parse_in   000C34 R
  5 parse_ke   000C97 R   |   5 parse_qu   000BBA R   |   5 pause      001C5C R
  5 pause02    001C66 R   |   5 peek       001584 R   |   5 peek_byt   000B4D R
  5 plus_tst   000DCD R   |   5 poke       001571 R   |   5 port_cr1   001C08 R
  5 port_cr2   001C0E R   |   5 port_ddr   001C02 R   |   5 port_idr   001BFC R
  5 port_odr   001BF6 R   |   5 power_ad   0017A8 R   |   5 prcnt_ts   000DEE R
  5 print      001403 R   |   5 print_ex   00145E R   |   5 print_fa   000B92 R
  5 print_in   000944 R   |   5 print_re   000851 R   |   5 print_st   000B15 R
  5 prt_basi   0013E5 R   |   5 prt_loop   001407 R   |   5 prt_peek   00024E R
  5 prt_reg1   000832 R   |   5 prt_reg8   00080D R   |   5 prt_regs   0001E4 R
  5 prti24     0008FC R   |   1 ptr16      000014 R   |   1 ptr8       000015 R
  5 putc       00019E R   |   5 puts       0001B0 R   |   5 qkey       001BAF R
  5 qmark_ts   000DA2 R   |   5 random     001C95 R   |   5 read_adc   0017E3 R
  5 readln     000A32 R   |   5 readln_l   000A38 R   |   5 readln_q   000AB1 R
  5 regs_sta   000227 R   |   5 rel_exit   001302 R   |   5 relation   0012AE R
  5 rem        001508 R   |   5 repl       000ACE R   |   5 repl_exi   000AF6 R
  5 reprint    000A5A R   |   5 reset_co   001405 R   |   5 rest_con   00147F R
  5 return     001704 R   |   5 right_ar   000A5A R   |   5 rparnt_t   000D60 R
  5 run        001728 R   |   5 save       001951 R   |   5 save_con   00146A R
  5 search_d   00110B R   |   5 search_e   00115F R   |   5 search_f   001907 R
  5 search_l   0002E0 R   |   5 search_l   0002EB R   |   5 search_n   00110F R
  1 seedx      00000D R   |   1 seedy      00000F R   |   5 seek_fdr   00187E R
  5 sharp_ts   000D81 R   |   5 show       001305 R   |   5 size       00131F R
  5 skip       000F58 R   |   5 slash_ts   000DE3 R   |   5 sleep      001C51 R
  5 software   0004FB R   |   5 spaces     0001D8 R   |   3 stack_fu   001780 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

  3 stack_un   001800 R   |   5 star_tst   000DD8 R   |   5 step       00160F R
  5 stop       001771 R   |   5 store      000FD9 R   |   5 store_lo   001621 R
  5 str_matc   00113D R   |   5 str_tst    000D07 R   |   5 strcmp     00027F R
  5 strcpy     000290 R   |   5 strlen     000272 R   |   5 substrac   001068 R
  5 syntax_e   0006EE R   |   1 tab_widt   000025 R   |   5 tb_error   0006F0 R
  5 term       00121D R   |   5 term01     001226 R   |   5 term_exi   001267 R
  5 test_p     000B0D R   |   3 tib        0016C8 R   |   5 tick_tst   000DB9 R
  1 ticks      00000B R   |   5 timer4_i   0000AF R   |   5 to         0015DF R
  5 to_upper   000EA0 GR  |   5 token_ch   000E84 R   |   5 token_ex   000E94 R
  1 txtbgn     00001B R   |   1 txtend     00001D R   |   5 uart3_in   000174 R
  5 uart3_se   000180 R   |   5 uart_ena   000199 R   |   5 ubound     001329 R
  5 uflash     001C14 R   |   5 unget_to   000F6B R   |   5 unlock_e   0000C0 R
  5 unlock_f   0000CE R   |   5 user_spa   001F80 R   |   5 usr        001C20 R
  1 vars       000026 R   |   5 wait       001509 R   |   5 warm_sta   00074A R
  5 words      001D09 R   |   5 write      001B2F R   |   5 write_bl   000151 R
  5 write_by   0000DC R   |   5 write_ee   000118 R   |   5 write_ex   00014C R
  5 write_fl   000102 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5A   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   1F8E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

