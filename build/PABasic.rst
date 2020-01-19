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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      000003                         55 in:    .blkb 1 ; low byte of in.w
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
      008000 82 00 85 D7             98     int cold_start
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008020 82 00 80 89            110 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
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
      00808E CD 89 26         [ 4]  152 	call print_registers
      008091 CD 8B 95         [ 4]  153 	call cmd_itf
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



                                    164 
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
      0080D6 CD 8A 19         [ 4]  191 	call print_int  	
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
      0080FB CC 87 E6         [ 2]  208 	jp warm_start
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



      008156 72 03 50 5F FB   [ 2]  271 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    326 	call unlock_eeprom 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008186 7B 01            [ 1]  380 	ld a,(BTW,sp)
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



                           000002   432 	VSIZE=2 
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
      0081EE CD 9A ED         [ 4]  450 	call incr_farptr
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



      008219 35 0C 52 45      [ 1]  485 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      008241 CD 82 1E         [ 4]  540 	call putc 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0001E4                        590 prt_regs:
      008264 AE 82 A7         [ 2]  591 	ldw x,#regs_state 
      008267 CD 82 30         [ 4]  592 	call puts
                                    593 ; register PC
      00826A 16 01            [ 2]  594 	ldw y,(1,sp)
      00826C AE 89 B6         [ 2]  595 	ldw x,#REG_EPC 
      00826F CD 89 07         [ 4]  596 	call prt_reg16 
                                    597 ; register CC 
      008272 7B 08            [ 1]  598 	ld a,(R_CC,sp)
      008274 AE 89 C7         [ 2]  599 	ldw x,#REG_CC 
      008277 CD 88 E2         [ 4]  600 	call prt_reg8 
                                    601 ; register A 
      00827A 7B 07            [ 1]  602 	ld a,(R_A,sp)
      00827C AE 89 C3         [ 2]  603 	ldw x,#REG_A 
      00827F CD 88 E2         [ 4]  604 	call prt_reg8 
                                    605 ; register X 
      008282 16 05            [ 2]  606 	ldw y,(R_X,sp)
      008284 AE 89 BF         [ 2]  607 	ldw x,#REG_X 
      008287 CD 89 07         [ 4]  608 	call prt_reg16 
                                    609 ; register Y 
      00828A 16 03            [ 2]  610 	ldw y,(R_Y,sp)
      00828C AE 89 BB         [ 2]  611 	ldw x,#REG_Y 
      00828F CD 89 07         [ 4]  612 	call prt_reg16 
                                    613 ; register SP 
      008292 90 96            [ 1]  614 	ldw y,sp
      008294 72 A9 00 08      [ 2]  615 	addw y,#6+ARG_OFS  
      008298 AE 89 CC         [ 2]  616 	ldw x,#REG_SP
      00829B CD 89 07         [ 4]  617 	call prt_reg16
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
      0082D9 CD 89 D1         [ 4]  639 	call prti24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082DC A6 3A            [ 1]  640 	ld a,#': 
      0082DE CD 82 1E         [ 4]  641 	call putc 
      0082E1 A6 20            [ 1]  642 	ld a,#SPACE 
      0082E3 CD 82 1E         [ 4]  643 	call putc 
      0082E6 85               [ 2]  644 	popw x 
      0082E7 F6               [ 1]  645 	ld a,(x)
      0082E8 C7 00 0B         [ 1]  646 	ld acc8,a 
      0082EB 5F               [ 1]  647 	clrw x 
      0082EC A6 10            [ 1]  648 	ld a,#16 
      0082EE CD 89 D1         [ 4]  649 	call prti24
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    695 ;  copy src to dest 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008349 72 FB 01         [ 2]  749 	addw x,(INCR,sp)
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
                                    800 ; move new line to insert with end of text 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



                                    801 ; otherwise it would be overwritten.
                                    802 ; input:
                                    803 ;   X 		addr of line i.e DEST for move 
                                    804 ;-------------------------------------
                           000001   805 	LLEN=1
                           000003   806 	SRC=3
                           000004   807 	VSIZE=4
      00838B                        808 del_line: 
      00030B                        809 	_vars VSIZE 
      00838B 52 04            [ 2]    1     sub sp,#VSIZE 
      00838D E6 02            [ 1]  810 	ld a,(2,x) ; line length
      00838F 6B 02            [ 1]  811 	ld (LLEN+1,sp),a 
      008391 0F 01            [ 1]  812 	clr (LLEN,sp)
      008393 90 93            [ 1]  813 	ldw y,x  
      008395 72 F9 01         [ 2]  814 	addw y,(LLEN,sp) ;SRC  
      008398 17 03            [ 2]  815 	ldw (SRC,sp),y  ;save source 
      00839A 90 CE 00 1E      [ 2]  816 	ldw y,txtend 
      00839E 90 E6 02         [ 1]  817 	ld a,(2,y)
      0083A1 90 5F            [ 1]  818 	clrw y 
      0083A3 90 97            [ 1]  819 	ld yl,a  
      0083A5 72 B9 00 1E      [ 2]  820 	addw y,txtend
      0083A9 72 F2 03         [ 2]  821 	subw y,(SRC,sp) ; y=count 
      0083AC 90 CF 00 0A      [ 2]  822 	ldw acc16,y 
      0083B0 16 03            [ 2]  823 	ldw y,(SRC,sp)    ; source
      0083B2 CD 83 1E         [ 4]  824 	call move
      0083B5 90 CE 00 1E      [ 2]  825 	ldw y,txtend 
      0083B9 72 F2 01         [ 2]  826 	subw y,(LLEN,sp)
      0083BC 90 CF 00 1E      [ 2]  827 	ldw txtend,y  
      000340                        828 	_drop VSIZE     
      0083C0 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083C2 81               [ 4]  829 	ret 
                                    830 
                                    831 ;---------------------------------------------
                                    832 ; create a gap in text area 
                                    833 ; move new line to insert in gap with end of text
                                    834 ; otherwise it would be overwritten.
                                    835 ; input:
                                    836 ;    X 			addr gap start 
                                    837 ;    Y 			gap length 
                                    838 ; output:
                                    839 ;    X 			addr gap start 
                                    840 ;--------------------------------------------
                           000001   841 	DEST=1
                           000003   842 	SRC=3
                           000005   843 	LEN=5
                           000006   844 	VSIZE=6 
      0083C3                        845 create_gap:
      000343                        846 	_vars VSIZE
      0083C3 52 06            [ 2]    1     sub sp,#VSIZE 
      0083C5 1F 03            [ 2]  847 	ldw (SRC,sp),x 
      0083C7 17 05            [ 2]  848 	ldw (LEN,sp),y 
      0083C9 90 CF 00 0A      [ 2]  849 	ldw acc16,y 
      0083CD 90 93            [ 1]  850 	ldw y,x ; SRC
      0083CF 72 BB 00 0A      [ 2]  851 	addw x,acc16  
      0083D3 1F 01            [ 2]  852 	ldw (DEST,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    853 ;compute size to move 	
      0083D5 CE 00 1E         [ 2]  854 	ldw x,txtend 
      0083D8 E6 02            [ 1]  855 	ld a,(2,x) ; pending line length 
      0083DA C7 00 0B         [ 1]  856 	ld acc8,a 
      0083DD 72 5F 00 0A      [ 1]  857 	clr acc16 
      0083E1 72 BB 00 0A      [ 2]  858 	addw x,acc16 
      0083E5 72 F0 03         [ 2]  859 	subw x,(SRC,sp)
      0083E8 CF 00 0A         [ 2]  860 	ldw acc16,x ; size to move
      0083EB 1E 01            [ 2]  861 	ldw x,(DEST,sp) 
      0083ED CD 83 1E         [ 4]  862 	call move
      0083F0 CE 00 1E         [ 2]  863 	ldw x,txtend
      0083F3 72 FB 05         [ 2]  864 	addw x,(LEN,sp)
      0083F6 CF 00 1E         [ 2]  865 	ldw txtend,x
      000379                        866 9$:	_drop VSIZE 
      0083F9 5B 06            [ 2]    1     addw sp,#VSIZE 
      0083FB 81               [ 4]  867 	ret 
                                    868 
                                    869 
                                    870 ;--------------------------------------------
                                    871 ; insert line in tib into text area 
                                    872 ; first search for already existing 
                                    873 ; replace existing 
                                    874 ; if strlen(tib)==0 delete existing 
                                    875 ; input:
                                    876 ;   ptr16 				pointer to tokenized line  
                                    877 ; output:
                                    878 ;   none
                                    879 ;---------------------------------------------
                           000001   880 	DEST=1  ; text area insertion address 
                           000003   881 	SRC=3   ; str to insert address 
                           000005   882 	LINENO=5 ; line number 
                           000007   883 	LLEN=7 ; line length 
                           000008   884 	VSIZE=8  
      0083FC                        885 insert_line:
      00037C                        886 	_vars VSIZE 
      0083FC 52 08            [ 2]    1     sub sp,#VSIZE 
      0083FE CE 00 15         [ 2]  887 	ldw x,ptr16  
      008401 C3 00 1C         [ 2]  888 	cpw x,txtbgn 
      008404 26 0D            [ 1]  889 	jrne 0$
                                    890 ;first text line 
      008406 AE 00 02         [ 2]  891 	ldw x,#2 
      008409 72 D6 00 15      [ 4]  892 	ld a,([ptr16],x)
      00840D 5F               [ 1]  893 	clrw x 
      00840E 97               [ 1]  894 	ld xl,a
      00840F 1F 07            [ 2]  895 	ldw (LLEN,sp),x  
      008411 20 45            [ 2]  896 	jra 5$
      008413 72 CE 00 15      [ 5]  897 0$:	ldw x,[ptr16]
                                    898 ; new line number
      008417 1F 05            [ 2]  899 	ldw (LINENO,sp),x 
      008419 AE 00 02         [ 2]  900 	ldw x,#2 
      00841C 72 D6 00 15      [ 4]  901 	ld a,([ptr16],x)
      008420 97               [ 1]  902 	ld xl,a
                                    903 ; new line length
      008421 1F 07            [ 2]  904 	ldw (LLEN,sp),x
                                    905 ; check if that line number already exit 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008423 1E 05            [ 2]  906 	ldw x,(LINENO,sp)
      008425 CD 83 60         [ 4]  907 	call search_lineno 
      008428 5D               [ 2]  908 	tnzw x 
      008429 26 04            [ 1]  909 	jrne 2$
                                    910 ; line doesn't exit
                                    911 ; it will be inserted at this point.  	
      00842B 17 01            [ 2]  912 	ldw (DEST,sp),y 
      00842D 20 05            [ 2]  913 	jra 3$
                                    914 ; line exit delete it.
                                    915 ; it will be replaced by new one 	
      00842F 1F 01            [ 2]  916 2$: ldw (DEST,sp),x 
      008431 CD 83 8B         [ 4]  917 	call del_line
      008434                        918 3$: 
                                    919 ; insert new line or leave if LLEN==3
                                    920 ; LLEN==3 means empty line 
      008434 A6 03            [ 1]  921 	ld a,#3
      008436 11 08            [ 1]  922 	cp a,(LLEN+1,sp)
      008438 27 27            [ 1]  923 	jreq insert_ln_exit ; empty line exit.
                                    924 ; if insertion point at txtend 
                                    925 ; no move required 
      00843A 1E 01            [ 2]  926 	ldw x,(DEST,sp)
      00843C C3 00 1E         [ 2]  927 	cpw x,txtend 
      00843F 2A 17            [ 1]  928 	jrpl 5$ 
                                    929 ; must create a gap
                                    930 ; at insertion point  
      008441 1E 01            [ 2]  931 	ldw x,(DEST,sp)
      008443 16 07            [ 2]  932 	ldw y,(LLEN,sp)
      008445 CD 83 C3         [ 4]  933 	call create_gap 
                                    934 ; move new line in gap 
      008448 1E 07            [ 2]  935 	ldw x,(LLEN,sp)
      00844A CF 00 0A         [ 2]  936 	ldw acc16,x 
      00844D 90 CE 00 1E      [ 2]  937 	ldw y,txtend ;SRC 
      008451 1E 01            [ 2]  938 	ldw x,(DEST,sp) ; dest address 
      008453 CD 83 1E         [ 4]  939 	call move 
      008456 20 09            [ 2]  940 	jra insert_ln_exit  
      008458                        941 5$: ; no move required 
      008458 1E 07            [ 2]  942 	ldw x,(LLEN,sp) 
      00845A 72 BB 00 1E      [ 2]  943 	addw x,txtend 
      00845E CF 00 1E         [ 2]  944 	ldw txtend,x 
      008461                        945 insert_ln_exit:	
      0003E1                        946 	_drop VSIZE
      008461 5B 08            [ 2]    1     addw sp,#VSIZE 
      008463 81               [ 4]  947 	ret
                                    948 
                                    949 
                                    950 ;-----------------------------
                                    951 ; check if text buffer full
                                    952 ; input:
                                    953 ;   ptr16     addr start tokenize line 
                                    954 ;   X         buffer index 
                                    955 ; output:
                                    956 ;   none 
                                    957 ;-----------------------------------
      008464                        958 check_full:
      008464 72 BB 00 15      [ 2]  959 	addw x,ptr16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      008468 A3 16 C8         [ 2]  960 	cpw x,#tib 
      00846B 25 05            [ 1]  961 	jrult 1$
      00846D A6 01            [ 1]  962 	ld a,#ERR_MEM_FULL
      00846F CC 87 96         [ 2]  963 	jp tb_error 
      008472 81               [ 4]  964 1$: ret 
                                    965 
                                    966 
                                    967 ;-----------------------------------
                                    968 ; create token list form text line 
                                    969 ; save this list in text area
                                    970 ; input:
                                    971 ;   none
                                    972 ; output:
                                    973 ;   basicptr     token list buffer
                                    974 ;   lineno 		 BASIC line number 
                                    975 ;   in.w  		 cleared 
                                    976 ;-----------------------------------
                                    977 	.macro _incr_ptr16 n 
                                    978 	ldw x,#n 
                                    979 	addw x,ptr16 
                                    980 	ldw ptr16,x 
                                    981 	.endm 
                                    982 
                           000001   983 	XSAVE=1
                           000003   984 	BUFIDX=3
                           000004   985 	VSIZE=4
      008473                        986 compile:
      0003F3                        987 	_vars VSIZE 
      008473 52 04            [ 2]    1     sub sp,#VSIZE 
      008475 72 1A 00 25      [ 1]  988 	bset flags,#FCOMP 
      008479 CE 00 1E         [ 2]  989 	ldw x,txtend
      00847C CF 00 15         [ 2]  990 	ldw ptr16,x 
      00847F 5F               [ 1]  991 	clrw x 
      008480 AE 00 03         [ 2]  992 	ldw x,#3
      008483 1F 03            [ 2]  993 	ldw (BUFIDX,sp),X  
      008485 CD 84 64         [ 4]  994 	call check_full
      008488 5F               [ 1]  995 	clrw x 
      008489 72 CF 00 15      [ 5]  996 	ldw [ptr16],x 
      00848D CD 8D 84         [ 4]  997 	call get_token
      008490 1F 01            [ 2]  998 	ldw (XSAVE,sp),x 
      008492 A1 03            [ 1]  999 	cp a,#TK_INTGR 
      008494 26 11            [ 1] 1000 	jrne 3$
      008496 A3 00 00         [ 2] 1001 	cpw x,#0  
      008499 22 03            [ 1] 1002 	jrugt 1$
      00849B CC 87 94         [ 2] 1003 	jp syntax_error 
      00849E 72 CF 00 15      [ 5] 1004 1$:	ldw [ptr16],x; line number
      0084A2 CD 8D 84         [ 4] 1005 2$:	call get_token
      0084A5 1F 01            [ 2] 1006 	ldw (XSAVE,sp),x 
      0084A7 A1 00            [ 1] 1007 3$:	cp a,#TK_NONE 
      0084A9 26 03            [ 1] 1008 	jrne 30$
      0084AB CC 85 3E         [ 2] 1009 	jp 9$
      0084AE                       1010 30$: 	 
      0084AE 1E 03            [ 2] 1011 	ldw x,(BUFIDX,sp)
      0084B0 CD 84 64         [ 4] 1012 	call check_full 
      0084B3 16 03            [ 2] 1013 	ldw y,(BUFIDX,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      0084B5 91 D7 15         [ 4] 1014 	ld ([ptr16],y),a 
      0084B8 90 5C            [ 1] 1015 	incw y
      0084BA 17 03            [ 2] 1016 	ldw (BUFIDX,sp),y
      0084BC A1 01            [ 1] 1017 	cp a,#TK_COLON 
      0084BE 26 02            [ 1] 1018 	jrne 31$
      0084C0 20 E0            [ 2] 1019 	jra 2$ 
      0084C2                       1020 31$:
      0084C2 A1 02            [ 1] 1021 	cp a,#TK_CHAR
      0084C4 26 0C            [ 1] 1022 	jrne 32$ 
      0084C6 1E 01            [ 2] 1023 	ldw x,(XSAVE,sp)
      0084C8 9F               [ 1] 1024 	ld a,xl 
      0084C9 91 D7 15         [ 4] 1025 	ld ([ptr16],y),a
      0084CC 90 5C            [ 1] 1026 	incw y 
      0084CE 17 03            [ 2] 1027 	ldw (BUFIDX,sp),y 
      0084D0 20 D0            [ 2] 1028 	jra 2$ 
      0084D2                       1029 32$:
      0084D2 A1 08            [ 1] 1030 	cp a,#TK_QSTR 
      0084D4 26 25            [ 1] 1031 	jrne 4$
      0084D6 AE 17 18         [ 2] 1032 	ldw x,#pad 
      0084D9 CD 82 F2         [ 4] 1033 	call strlen
      0084DC 5C               [ 1] 1034 	incw x  
      0084DD CD 84 64         [ 4] 1035 	call check_full 
      0084E0 90 AE 17 18      [ 2] 1036 	ldw y,#pad 
      0084E4 CE 00 15         [ 2] 1037 	ldw x,ptr16
      0084E7 72 FB 03         [ 2] 1038 	addw x,(BUFIDX,sp)	
      0084EA CD 83 10         [ 4] 1039 	call strcpy 
      0084ED AE 17 18         [ 2] 1040 	ldw x,#pad 
      0084F0 CD 82 F2         [ 4] 1041 	call strlen 
      0084F3 5C               [ 1] 1042 	incw x
      0084F4 72 FB 03         [ 2] 1043 	addw x,(BUFIDX,sp) 
      0084F7 1F 03            [ 2] 1044 	ldw (BUFIDX,sp),x
      0084F9 20 A7            [ 2] 1045 	jra 2$  
      0084FB A1 03            [ 1] 1046 4$: cp a,#TK_INTGR
      0084FD 25 A3            [ 1] 1047 	jrult 2$
      0084FF A1 07            [ 1] 1048 	cp a,#TK_FUNC 
      008501 22 9F            [ 1] 1049 	Jrugt 2$
      008503 1E 01            [ 2] 1050 	ldw x,(XSAVE,sp) 
      008505 16 03            [ 2] 1051 	ldw y,(BUFIDX,sp)
      008507 91 DF 15         [ 5] 1052 	ldw ([ptr16],y),x
      00850A A3 97 86         [ 2] 1053 	cpw x,#rem 
      00850D 26 26            [ 1] 1054 	jrne 5$
      00850F 72 A9 00 02      [ 2] 1055 	addw y,#2 
      008513 90 89            [ 2] 1056 	pushw y 
      008515 CE 00 15         [ 2] 1057 	ldw x,ptr16 
      008518 72 FB 01         [ 2] 1058 	addw x,(1,sp)
      00049B                       1059 	_drop 2  
      00851B 5B 02            [ 2]    1     addw sp,#2 
      00851D 90 CE 00 01      [ 2] 1060 	ldw y,in.w 
      008521 72 A9 16 C8      [ 2] 1061 	addw y,#tib 
      008525 CD 83 10         [ 4] 1062 	call strcpy 	
      008528 CD 82 F2         [ 4] 1063 	call strlen 
      00852B 1C 00 03         [ 2] 1064 	addw x,#3 ; rem exec address+string 0. 
      00852E 72 FB 03         [ 2] 1065 	addw x,(BUFIDX,sp)
      008531 1F 03            [ 2] 1066 	ldw (BUFIDX,sp),x 
      008533 20 09            [ 2] 1067 	jra 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      008535 72 A9 00 02      [ 2] 1068 5$:	addw y,#2 
      008539 17 03            [ 2] 1069 	ldw (BUFIDX,sp),y 
      00853B CC 84 A2         [ 2] 1070 	jp 2$
      00853E                       1071 9$: 
      00853E AE 00 02         [ 2] 1072 	ldw x,#2
      008541 16 03            [ 2] 1073 	ldw y,(BUFIDX,sp)
      008543 90 9F            [ 1] 1074 	ld a,yl 
      008545 72 D7 00 15      [ 4] 1075 	ld ([ptr16],x),a  	
      008549 72 CE 00 15      [ 5] 1076 	ldw x,[ptr16]
      00854D 27 09            [ 1] 1077 	jreq 10$
      00854F CD 83 FC         [ 4] 1078 	call insert_line
      008552 72 5F 00 03      [ 1] 1079 	clr  count 
      008556 20 13            [ 2] 1080 	jra  11$ 
      008558                       1081 10$: 
      008558 CE 00 15         [ 2] 1082 	ldw x,ptr16 
      00855B CF 00 04         [ 2] 1083 	ldw basicptr,x 
      00855E E6 02            [ 1] 1084 	ld a,(2,x)
      008560 C7 00 03         [ 1] 1085 	ld count,a 
      008563 FE               [ 2] 1086 	ldw x,(x)
      008564 CF 00 06         [ 2] 1087 	ldw lineno,x 
      008567 35 03 00 02      [ 1] 1088 	mov in,#3 
      00856B                       1089 11$:
      0004EB                       1090 	_drop VSIZE 
      00856B 5B 04            [ 2]    1     addw sp,#VSIZE 
      00856D 72 1B 00 25      [ 1] 1091 	bres flags,#FCOMP 
      008571 81               [ 4] 1092 	ret 
                                   1093 
                                   1094 
                                   1095 ;------------------------------------
                                   1096 ;  set all variables to zero 
                                   1097 ; input:
                                   1098 ;   none 
                                   1099 ; output:
                                   1100 ;	none
                                   1101 ;------------------------------------
      008572                       1102 clear_vars:
      008572 AE 00 27         [ 2] 1103 	ldw x,#vars 
      008575 90 AE 00 34      [ 2] 1104 	ldw y,#2*26 
      008579 7F               [ 1] 1105 1$:	clr (x)
      00857A 5C               [ 1] 1106 	incw x 
      00857B 90 5A            [ 2] 1107 	decw y 
      00857D 26 FA            [ 1] 1108 	jrne 1$
      00857F 81               [ 4] 1109 	ret 
                                   1110 
                                   1111 ;-------------------------------------
                                   1112 ; check if A is a letter
                                   1113 ; input:
                                   1114 ;   A 			character to test 
                                   1115 ; output:
                                   1116 ;   C flag      1 true, 0 false 
                                   1117 ;-------------------------------------
      008580                       1118 is_alpha:
      008580 A1 41            [ 1] 1119 	cp a,#'A 
      008582 8C               [ 1] 1120 	ccf
      008583 24 0B            [ 1] 1121 	jrnc 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      008585 A1 5B            [ 1] 1122 	cp a,#'Z+1 
      008587 25 07            [ 1] 1123 	jrc 9$ 
      008589 A1 61            [ 1] 1124 	cp a,#'a 
      00858B 8C               [ 1] 1125 	ccf 
      00858C 24 02            [ 1] 1126 	jrnc 9$
      00858E A1 7B            [ 1] 1127 	cp a,#'z+1   
      008590 81               [ 4] 1128 9$: ret 	
                                   1129 
                                   1130 ;-------------------------------------
                                   1131 ;  program initialization entry point 
                                   1132 ;-------------------------------------
                           000001  1133 	MAJOR=1
                           000000  1134 	MINOR=0
      008591 0A 0A 54 69 6E 79 20  1135 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0085D7                       1136 cold_start:
                                   1137 ;set stack 
      0085D7 AE 17 FF         [ 2] 1138 	ldw x,#STACK_EMPTY
      0085DA 94               [ 1] 1139 	ldw sp,x   
                                   1140 ; clear all ram 
      0085DB 7F               [ 1] 1141 0$: clr (x)
      0085DC 5A               [ 2] 1142 	decw x 
      0085DD 26 FC            [ 1] 1143 	jrne 0$
                                   1144 ; activate pull up on all inputs 
      0085DF A6 FF            [ 1] 1145 	ld a,#255 
      0085E1 C7 50 03         [ 1] 1146 	ld PA_CR1,a 
      0085E4 C7 50 08         [ 1] 1147 	ld PB_CR1,a 
      0085E7 C7 50 0D         [ 1] 1148 	ld PC_CR1,a 
      0085EA C7 50 12         [ 1] 1149 	ld PD_CR1,a 
      0085ED C7 50 17         [ 1] 1150 	ld PE_CR1,a 
      0085F0 C7 50 1C         [ 1] 1151 	ld PF_CR1,a 
      0085F3 C7 50 21         [ 1] 1152 	ld PG_CR1,a 
      0085F6 C7 50 2B         [ 1] 1153 	ld PI_CR1,a 
                                   1154 ; select internal clock no divisor: 16 Mhz 	
      0085F9 A6 E1            [ 1] 1155 	ld a,#CLK_SWR_HSI 
      0085FB 5F               [ 1] 1156 	clrw x  
      0085FC CD 81 19         [ 4] 1157     call clock_init 
      0085FF CD 81 2F         [ 4] 1158 	call timer4_init
                                   1159 ; UART3 at 115200 BAUD
      008602 CD 81 F4         [ 4] 1160 	call uart3_init
                                   1161 ; activate PE_4 (user button interrupt)
      008605 72 18 50 18      [ 1] 1162     bset PE_CR2,#USR_BTN_BIT 
                                   1163 ; display system information
      008609 AE 85 91         [ 2] 1164 	ldw x,#software 
      00860C CD 82 30         [ 4] 1165 	call puts 
      00860F A6 01            [ 1] 1166 	ld a,#MAJOR 
      008611 C7 00 0B         [ 1] 1167 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008614 5F               [ 1] 1168 	clrw x 
      008615 CF 00 09         [ 2] 1169 	ldw acc24,x 
      008618 A6 0A            [ 1] 1170 	ld a,#10 
      00861A CD 89 D1         [ 4] 1171 	call prti24 
      00861D A6 2E            [ 1] 1172 	ld a,#'.
      00861F CD 82 1E         [ 4] 1173 	call putc 
      008622 A6 00            [ 1] 1174 	ld a,#MINOR 
      008624 C7 00 0B         [ 1] 1175 	ld acc8,a 
      008627 5F               [ 1] 1176 	clrw x 
      008628 CF 00 09         [ 2] 1177 	ldw acc24,x 
      00862B A6 0A            [ 1] 1178 	ld a,#10 
      00862D CD 89 D1         [ 4] 1179 	call prti24 
      008630 A6 0D            [ 1] 1180 	ld a,#CR 
      008632 CD 82 1E         [ 4] 1181 	call putc 
      008635 CD 9A FB         [ 4] 1182 	call seek_fdrive 
                                   1183 ; configure LED2 pin 
      008638 72 1A 50 0D      [ 1] 1184     bset PC_CR1,#LED2_BIT
      00863C 72 1A 50 0E      [ 1] 1185     bset PC_CR2,#LED2_BIT
      008640 72 1A 50 0C      [ 1] 1186     bset PC_DDR,#LED2_BIT
      008644 9A               [ 1] 1187 	rim 
      008645 AE 16 C8         [ 2] 1188 	ldw x,#tib
      008648 CF 00 21         [ 2] 1189 	ldw array_addr,x 
      00864B 72 5C 00 11      [ 1] 1190 	inc seedy+1 
      00864F 72 5C 00 0F      [ 1] 1191 	inc seedx+1 
      008653 CD 86 62         [ 4] 1192 	call clear_basic
      008656 CD 93 FE         [ 4] 1193 	call ubound 
      008659 CD 90 22         [ 4] 1194 	call dpop 
      00865C CF 00 23         [ 2] 1195 	ldw array_size,x 
      00865F CC 87 E6         [ 2] 1196     jp warm_start 
                                   1197 
                                   1198 ;---------------------------
                                   1199 ; reset BASIC text variables 
                                   1200 ; and clear variables 
                                   1201 ;---------------------------
      008662                       1202 clear_basic:
      008662 5F               [ 1] 1203 	clrw x 
      008663 CF 00 06         [ 2] 1204 	ldw lineno,x
      008666 72 5F 00 03      [ 1] 1205 	clr count 
      00866A AE 00 5B         [ 2] 1206 	ldw x,#free_ram 
      00866D CF 00 1C         [ 2] 1207 	ldw txtbgn,x 
      008670 CF 00 1E         [ 2] 1208 	ldw txtend,x 
      008673 CD 85 72         [ 4] 1209 	call clear_vars 
      008676 81               [ 4] 1210 	ret 
                                   1211 
                                   1212 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1213 ;;   Tiny BASIC error messages     ;;
                                   1214 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      008677                       1215 err_msg:
      008677 00 00 86 8F 86 9D 86  1216 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             AC 86 C6 86 D6
      008683 86 ED 87 04 87 1F 87  1217 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             31 87 43
      00868D 87 50                 1218 	.word err_no_access 
                                   1219 
      00868F 0A 4D 65 6D 6F 72 79  1220 err_mem_full: .asciz "\nMemory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal  20-Bits]



             20 66 75 6C 6C 0A 00
      008697 66 75 6C 6C 0A 00 0A  1221 err_syntax: .asciz "\nsyntax error\n" 
             73 79 6E 74 61 78 20
             65
      0086A6 72 72 6F 72 0A 00 0A  1222 err_math_ovf: .asciz "\nmath operation overflow\n"
             6D 61 74 68 20 6F 70
             65 72 61 74 69 6F 6E
             20 6F 76 65 72
      0086C0 66 6C 6F 77 0A 00 0A  1223 err_div0: .asciz "\ndivision by 0\n" 
             64 69 76 69 73 69 6F
             6E 20
      0086D0 62 79 20 30 0A 00 0A  1224 err_no_line: .asciz "\ninvalid line number.\n"
             69 6E 76 61 6C 69 64
             20 6C 69 6E 65 20 6E
             75 6D
      0086E7 62 65 72 2E 0A 00 0A  1225 err_run_only: .asciz "\nrun time only usage.\n" 
             72 75 6E 20 74 69 6D
             65 20 6F 6E 6C 79 20
             75 73
      0086FE 61 67 65 2E 0A 00 0A  1226 err_cmd_only: .asciz "\ncommand line only usage.\n"
             63 6F 6D 6D 61 6E 64
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73
      008719 61 67 65 2E 0A 00 0A  1227 err_duplicate: .asciz "\nduplicate name.\n"
             64 75 70 6C 69 63 61
             74 65 20 6E
      00872B 61 6D 65 2E 0A 00 0A  1228 err_not_file: .asciz "\nFile not found.\n"
             46 69 6C 65 20 6E 6F
             74 20 66 6F
      00873D 75 6E 64 2E 0A 00 0A  1229 err_bad_value: .asciz "\nbad value.\n"
             62 61 64 20 76 61
      00874A 6C 75 65 2E 0A 00 0A  1230 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             46 69 6C 65 20 69 6E
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68
                                   1231 
      00877E 65 72 65 2E 0A 00 6C  1232 rt_msg: .asciz "last token id: "
             61 73 74 20 74 6F 6B
             65 6E
                                   1233 
      000714                       1234 syntax_error:
      00878E 20 69            [ 1] 1235 	ld a,#ERR_SYNTAX 
                                   1236 
      000716                       1237 tb_error:
      008790 64 3A 20         [ 2] 1238 	ldw x, #err_msg 
      008793 00 5F 00 09      [ 1] 1239 	clr acc16 
      008794 48               [ 1] 1240 	sll a
      008794 A6 02 00 09      [ 1] 1241 	rlc acc16  
      008796 C7 00 0A         [ 1] 1242 	ld acc8, a 
      008796 AE 86 77 72      [ 2] 1243 	addw x,acc16 
      00879A 5F               [ 2] 1244 	ldw x,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      00879B 00 0A 48         [ 4] 1245 	call puts
      00879E 72 59 00 0A C7   [ 2] 1246 	btjf flags,#FCOMP, 1$
      0087A3 00 0B 72         [ 2] 1247 	ldw x,#tib
      0087A6 BB 00 0A         [ 4] 1248 	call puts 
      0087A9 FE CD            [ 1] 1249 	ld a,#CR 
      0087AB 82 30 72         [ 4] 1250 	call putc
      0087AE 0B 00 25         [ 2] 1251 	ldw x,#in.w.saved
      0087B1 18 AE 16         [ 4] 1252 	call spaces
      0087B4 C8 CD            [ 1] 1253 	ld a,#'^
      0087B6 82 30 A6         [ 4] 1254 	call putc 
      0087B9 0D CD            [ 2] 1255 	jra 6$
      0087BB 82 1E AE         [ 2] 1256 1$:	ldw x,basicptr
      0087BE 00 12 CD         [ 4] 1257 	call prt_basic_line
      0087C1 82 58 A6         [ 2] 1258 	ldw x,#rt_msg 
      0087C4 5E CD 82         [ 4] 1259 	call puts 
      0087C7 1E 20 18         [ 2] 1260 	ldw x,in.w.saved 
      0087CA CE 00 04 CD      [ 4] 1261 	ld a,([basicptr],x)
      0087CE 95               [ 1] 1262 	clrw x 
      0087CF 07               [ 1] 1263 	ld xl,a 
      0087D0 AE 87 84         [ 4] 1264 	call print_int 
      0087D3 CD 82 30         [ 2] 1265 6$: ldw x,#STACK_EMPTY 
      0087D6 CE               [ 1] 1266     ldw sp,x
      000766                       1267 warm_start:
      0087D7 00 12 72 D6      [ 1] 1268 	clr flags 
      0087DB 00 04 5F 97      [ 1] 1269 	clr loop_depth 
      0087DF CD 8A 19         [ 2] 1270 	ldw x,#dstack_unf 
      0087E2 AE 17 FF         [ 2] 1271 	ldw dstkptr,x 
      0087E5 94 04 00 25      [ 1] 1272 	mov tab_width,#TAB_WIDTH 
      0087E6 35 0A 00 07      [ 1] 1273 	mov base,#10 
      0087E6 72               [ 1] 1274 	clrw x 
      0087E7 5F 00 25         [ 2] 1275 	ldw lineno,x 
      0087EA 72 5F 00         [ 2] 1276 	ldw x,#tib 
      0087ED 20 AE 17         [ 2] 1277 	ldw basicptr,x 
                                   1278 ;----------------------------
                                   1279 ;   BASIC interpreter
                                   1280 ;----------------------------
      000786                       1281 interp:
      0087F0 80 CF 00 1A      [ 1] 1282 	clr in.w
      0087F4 35 04 00 26 35   [ 2] 1283 	btjf flags,#FRUN,4$ 
                                   1284 ; running program
                                   1285 ; goto next basic line 
      0087F9 0A 00 08         [ 2] 1286 	ldw x,basicptr
      0087FC 5F CF            [ 1] 1287 	ld a,(2,x) ; line length 
      0087FE 00 06 AE         [ 1] 1288 	ld acc8,a 
      008801 16 C8 CF 00      [ 1] 1289 	clr acc16 
      008805 04 BB 00 09      [ 2] 1290 	addw x,acc16
      008806 C3 00 1D         [ 2] 1291 	cpw x,txtend 
      008806 72 5F            [ 1] 1292 	jrpl warm_start
      008808 00 01 72         [ 2] 1293 	ldw basicptr,x ; start of next line  
      00880B 01 00            [ 1] 1294 	ld a,(2,x)
      00880D 25 27 CE         [ 1] 1295 	ld count,a 
      008810 00               [ 2] 1296 	ldw x,(x) ; line no 
      008811 04 E6 02         [ 2] 1297 	ldw lineno,x 
      008814 C7 00 0B 72      [ 1] 1298 	mov in,#3 ; skip first 3 bytes of line 
      008818 5F 00            [ 2] 1299 	jra interp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      0007B6                       1300 4$: ; commande line mode 	
      00881A 0A 72 BB 00      [ 1] 1301 	clr in
      00881E 0A C3            [ 1] 1302 	ld a,#CR 
      008820 00 1E 2A         [ 4] 1303 	call putc 
      008823 C2 CF            [ 1] 1304 	ld a,#'> 
      008825 00 04 E6         [ 4] 1305 	call putc 
      008828 02 C7 00         [ 4] 1306 	call readln
      00882B 03 FE CF         [ 4] 1307 	call compile
      0007CA                       1308 interp_loop:  
      00882E 00 06 35         [ 1] 1309 	ld a,in 
      008831 03 00 02         [ 1] 1310 	cp a,count  
      008834 20 14            [ 1] 1311 	jrpl interp
      008836 CD 07 FA         [ 4] 1312 	call next_token
      008836 72 5F            [ 1] 1313 	cp a,#TK_COLON 
      008838 00 02            [ 1] 1314 	jreq interp_loop 
      00883A A6 0D            [ 1] 1315 	cp a,#TK_NONE 
                                   1316 ;	jreq interp 
      0007DB                       1317 1$:
      00883C CD 82            [ 1] 1318 	cp a,#TK_VAR
      00883E 1E A6            [ 1] 1319 	jrne 2$
      008840 3E CD 82         [ 4] 1320 	call let02  
      008843 1E CD            [ 2] 1321 	jra interp_loop 
      0007E4                       1322 2$:	
      008845 8B 07            [ 1] 1323 	cp a,#TK_ARRAY 
      008847 CD 84            [ 1] 1324 	jrne 3$
      008849 73 11 E9         [ 4] 1325 	call get_array_element
      00884A CD 13 96         [ 4] 1326 	call let02 
      00884A C6 00            [ 2] 1327 	jra interp_loop 
      0007F0                       1328 3$:
      00884C 02 C1            [ 1] 1329 	cp a,#TK_CMD
      00884E 00 03            [ 1] 1330 	jrne 4$
      008850 2A               [ 4] 1331 	call (x) 
      008851 B4 CD            [ 2] 1332 	jra interp_loop 
      0007F7                       1333 4$:	
      008853 88 7A A1         [ 2] 1334 	jp syntax_error 
                                   1335 
                                   1336 ;--------------------------
                                   1337 ; extract next token from
                                   1338 ; token list 
                                   1339 ; basicptr -> base address 
                                   1340 ; in  -> offset in list array 
                                   1341 ; output:
                                   1342 ;   A 		token attribute
                                   1343 ;   X 		token value if there is one
                                   1344 ;----------------------------------------
      0007FA                       1345 next_token:
      008856 01 27            [ 1] 1346 	push #0
      008858 F1 A1 00         [ 1] 1347 	ld a,in 
      00885B C1 00 02         [ 1] 1348 	cp a,count 
      00885B A1               [ 1] 1349 	pop a 
      00885C 04 26            [ 1] 1350 	jrpl 9$ 
      00885E 05 CD 94         [ 2] 1351 	ldw x,in.w 
      008861 16 20 E6         [ 2] 1352 	ldw in.w.saved,x 
      008864 CE 00 03         [ 2] 1353 	ldw x,basicptr 
      008864 A1 05 26 08      [ 4] 1354 	ld a,([in.w],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008868 CD 92 69 CD      [ 1] 1355 	inc in 
      00886C 94 16            [ 1] 1356 	cp a,#CMD_END 
      00886E 20 DA            [ 1] 1357 	jrult 9$
      008870 A1 02            [ 1] 1358 	cp a,#TK_CHAR
      008870 A1 06            [ 1] 1359 	jrne 1$
      008872 26 03 FD 20      [ 4] 1360 	ld a,([in.w],x)
      008876 D3 5C 00 01      [ 1] 1361 	inc in
      008877 5F               [ 1] 1362 	clrw x 
      008877 CC               [ 1] 1363 	ld xl,a 
      008878 87 94            [ 1] 1364 	ld a,#TK_CHAR
      00887A 81               [ 4] 1365 	ret 
      00887A 4B 00            [ 1] 1366 1$:	cp a,#TK_QSTR 
      00887C C6 00            [ 1] 1367 	jrugt 9$
      00887E 02 C1            [ 1] 1368 	jrult 2$
      008880 00 03 84 2A      [ 2] 1369 	addw x,in.w 
      008884 3E CE            [ 2] 1370 	jra 9$
      008886 00 01 CF 00      [ 5] 1371 2$: ldw x,([in.w],x)
      00888A 12 CE 00 04      [ 1] 1372 	inc in 
      00888E 72 D6 00 01      [ 1] 1373 	inc in
      008892 72               [ 4] 1374 9$: ret	
                                   1375 
                                   1376 
                                   1377 ;----------------------------------------
                                   1378 ;   DEBUG support functions
                                   1379 ;----------------------------------------
                           000001  1380 .if DEBUG 
                                   1381 ; turn LED on 
      000844                       1382 ledon:
      008893 5C 00 02 A1      [ 1] 1383     bset PC_ODR,#LED2_BIT
      008897 02               [ 4] 1384     ret 
                                   1385 
                                   1386 ; turn LED off 
      000849                       1387 ledoff:
      008898 25 29 A1 02      [ 1] 1388     bres PC_ODR,#LED2_BIT 
      00889C 26               [ 4] 1389     ret 
                                   1390 
                                   1391 ; invert LED status 
      00084E                       1392 ledtoggle:
      00889D 0D 72            [ 1] 1393     ld a,#LED2_MASK
      00889F D6 00 01         [ 1] 1394     xor a,PC_ODR
      0088A2 72 5C 00         [ 1] 1395     ld PC_ODR,a
      0088A5 02               [ 4] 1396     ret 
                                   1397 
      000857                       1398 left_paren:
      0088A6 5F 97            [ 1] 1399 	ld a,#SPACE 
      0088A8 A6 02 81         [ 4] 1400 	call putc
      0088AB A1 08            [ 1] 1401 	ld a,#'( 
      0088AD 22 14 25         [ 4] 1402 	call putc 	
      0088B0 06               [ 4] 1403 	ret 
                                   1404 
                                   1405 ;------------------------------
                                   1406 ; print 8 bit register 
                                   1407 ; input:
                                   1408 ;   X  point to register name 
                                   1409 ;   A  register value to print 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1410 ; output:
                                   1411 ;   none
                                   1412 ;------------------------------- 
      000862                       1413 prt_reg8:
      0088B1 72               [ 1] 1414 	push a 
      0088B2 BB 00 01         [ 4] 1415 	call puts 
      0088B5 20 0C            [ 1] 1416 	ld a,(1,sp) 
      0088B7 72 DE 00         [ 1] 1417 	ld acc8,a 
      0088BA 01               [ 1] 1418 	clrw x 
      0088BB 72               [ 1] 1419 	ld xl,a 
      0088BC 5C 00 02 72      [ 1] 1420 	mov base,#16
      0088C0 5C 00 02         [ 4] 1421 	call print_int 
      0088C3 81 08 57         [ 4] 1422 	call left_paren 
      0088C4 84               [ 1] 1423 	pop a 
      0088C4 72               [ 1] 1424 	clrw x 
      0088C5 1A               [ 1] 1425 	ld xl,a 
      0088C6 50 0A 81 07      [ 1] 1426 	mov base,#10 
      0088C9 CD 09 99         [ 4] 1427 	call print_int  
      0088C9 72 1B            [ 1] 1428 	ld a,#') 
      0088CB 50 0A 81         [ 4] 1429 	call putc
      0088CE 81               [ 4] 1430 	ret
                                   1431 
                                   1432 ;--------------------------------
                                   1433 ; print 16 bits register 
                                   1434 ; input:
                                   1435 ;   X   point register name 
                                   1436 ;   Y   register value to print 
                                   1437 ; output:
                                   1438 ;  none
                                   1439 ;--------------------------------
      000887                       1440 prt_reg16: 
      0088CE A6 20            [ 2] 1441 	pushw y 
      0088D0 C8 50 0A         [ 4] 1442 	call puts 
      0088D3 C7 50            [ 2] 1443 	ldw x,(1,sp) 
      0088D5 0A 81 00 07      [ 1] 1444 	mov base,#16 
      0088D7 CD 09 99         [ 4] 1445 	call print_int  
      0088D7 A6 20 CD         [ 4] 1446 	call left_paren 
      0088DA 82               [ 2] 1447 	popw x 
      0088DB 1E A6 28 CD      [ 1] 1448 	mov base,#10 
      0088DF 82 1E 81         [ 4] 1449 	call print_int  
      0088E2 A6 29            [ 1] 1450 	ld a,#') 
      0088E2 88 CD 82         [ 4] 1451 	call putc
      0088E5 30               [ 4] 1452 	ret 
                                   1453 
                                   1454 ;------------------------------------
                                   1455 ; print registers contents saved on
                                   1456 ; stack by trap interrupt.
                                   1457 ;------------------------------------
      0008A6                       1458 print_registers:
      0088E6 7B 01 C7         [ 2] 1459 	ldw x,#STATES
      0088E9 00 0B 5F         [ 4] 1460 	call puts
                                   1461 ; print EPC 
      0088EC 97 35 10         [ 2] 1462 	ldw x, #REG_EPC
      0088EF 00 08 CD         [ 4] 1463 	call puts 
      0088F2 8A 19            [ 1] 1464 	ld a, (11,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0088F4 CD 88 D7         [ 1] 1465 	ld acc8,a 
      0088F7 84 5F            [ 1] 1466 	ld a, (10,sp) 
      0088F9 97 35 0A         [ 1] 1467 	ld acc16,a 
      0088FC 00 08            [ 1] 1468 	ld a,(9,sp) 
      0088FE CD 8A 19         [ 1] 1469 	ld acc24,a
      008901 A6               [ 1] 1470 	clrw x  
      008902 29 CD            [ 1] 1471 	ld a,#16
      008904 82 1E 81         [ 4] 1472 	call prti24  
                                   1473 ; print X
      008907 AE 09 3F         [ 2] 1474 	ldw x,#REG_X
      008907 90 89            [ 2] 1475 	ldw y,(5,sp)
      008909 CD 82 30         [ 4] 1476 	call prt_reg16  
                                   1477 ; print Y 
      00890C 1E 01 35         [ 2] 1478 	ldw x,#REG_Y
      00890F 10 00            [ 2] 1479 	ldw y, (7,sp)
      008911 08 CD 8A         [ 4] 1480 	call prt_reg16  
                                   1481 ; print A 
      008914 19 CD 88         [ 2] 1482 	ldw x,#REG_A
      008917 D7 85            [ 1] 1483 	ld a, (4,sp) 
      008919 35 0A 00         [ 4] 1484 	call prt_reg8
                                   1485 ; print CC 
      00891C 08 CD 8A         [ 2] 1486 	ldw x,#REG_CC 
      00891F 19 A6            [ 1] 1487 	ld a, (3,sp) 
      008921 29 CD 82         [ 4] 1488 	call prt_reg8 
                                   1489 ; print SP 
      008924 1E 81 4C         [ 2] 1490 	ldw x,#REG_SP
      008926 90 96            [ 1] 1491 	ldw y,sp 
      008926 AE 89 79 CD      [ 2] 1492 	addw y,#12
      00892A 82 30 AE         [ 4] 1493 	call prt_reg16  
      00892D 89 B6            [ 1] 1494 	ld a,#'\n' 
      00892F CD 82 30         [ 4] 1495 	call putc
      008932 7B               [ 4] 1496 	ret
                                   1497 
      008933 0B C7 00 0B 7B 0A C7  1498 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             00 0A 7B 09 C7 00 09
             5F A6 10 CD 89 D1 AE
             89 BF 16 05 CD 89 07
             AE 89 BB 16 07 CD 89
             07 AE 89 C3 7B 04 CD
             88 E2 AE 89 C7 7B 03
             CD 88 E2 AE 89 CC 90
             96 72 A9 00 0C
      008970 CD 89 07 A6 0A        1499 REG_EPC: .asciz "EPC:"
      008975 CD 82 1E 81           1500 REG_Y:   .asciz "\nY:" 
      008979 0A 52 65 67           1501 REG_X:   .asciz "\nX:"
      00897D 69 73 74 65           1502 REG_A:   .asciz "\nA:" 
      008981 72 73 20 73 74        1503 REG_CC:  .asciz "\nCC:"
      008986 61 74 65 20 61        1504 REG_SP:  .asciz "\nSP:"
                                   1505 .endif ; DEBUG 
                                   1506 
                                   1507 ;------------------------------------
                                   1508 ; print integer in acc24 
                                   1509 ; input:
                                   1510 ;	acc24 		integer to print 
                                   1511 ;	A 			numerical base for conversion 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1512 ;               if bit 7 is set add a space at print end.
                                   1513 ;   XL 			field width, 0 -> no fill.
                                   1514 ;  output:
                                   1515 ;    none 
                                   1516 ;------------------------------------
                           000001  1517 	WIDTH = 1
                           000002  1518 	BASE = 2
                           000003  1519 	ADD_SPACE=3 ; add a space after number 
                           000003  1520 	VSIZE = 3
      000951                       1521 prti24:
      000951                       1522 	_vars VSIZE 
      00898B 74 20            [ 2]    1     sub sp,#VSIZE 
      00898D 61 62            [ 1] 1523 	clr (ADD_SPACE,sp)
      00898F 6F 72            [ 1] 1524 	bcp a,#0x80 
      008991 74 20            [ 1] 1525 	jreq 0$ 
      008993 70 6F            [ 1] 1526 	cpl (ADD_SPACE,sp)
      008995 69 6E            [ 1] 1527 0$:	and a,#31 
      008997 74 2E            [ 1] 1528 	ld (BASE,sp),a
      008999 0A               [ 1] 1529 	ld a,xl
      00899A 2D 2D            [ 1] 1530 	ld (WIDTH,sp),a 
      00899C 2D 2D            [ 1] 1531 	ld a, (BASE,sp)  
      00899E 2D 2D 2D         [ 4] 1532     call itoa  ; conversion entier en  .asciz
      0089A1 2D 2D            [ 1] 1533 1$: ld a,(WIDTH,sp)
      0089A3 2D 2D            [ 1] 1534 	jreq 4$
      0089A5 2D 2D 2D         [ 1] 1535 	ld acc8,a 
      0089A8 2D               [ 2] 1536 	pushw x 
      0089A9 2D 2D 2D         [ 4] 1537 	call strlen 
      0089AC 2D               [ 1] 1538 	ld a,xl 
      0089AD 2D               [ 2] 1539 	popw x 
      0089AE 2D 2D 2D         [ 3] 1540 	exg a,acc8 
      0089B1 2D 2D 2D         [ 1] 1541 	sub a,acc8 
      0089B4 0A 00            [ 1] 1542 	jrmi 4$
      0089B6 45 50            [ 1] 1543 	ld (WIDTH,sp),a 
      0089B8 43 3A            [ 1] 1544 	ld  a,#SPACE
      0089BA 00 0A            [ 1] 1545 3$: tnz (WIDTH,sp)
      0089BC 59 3A            [ 1] 1546 	jreq 4$
      0089BE 00               [ 2] 1547 	decw x 
      0089BF 0A               [ 1] 1548 	ld (x),a 
      0089C0 58 3A            [ 1] 1549 	dec (WIDTH,sp) 
      0089C2 00 0A            [ 2] 1550 	jra 3$
      00098A                       1551 4$: 
      0089C4 41 3A 00         [ 4] 1552 	call puts 
      0089C7 0A 43            [ 1] 1553 	tnz (ADD_SPACE,sp)
      0089C9 43 3A            [ 1] 1554 	jreq 5$
      0089CB 00 0A            [ 1] 1555     ld a,#SPACE 
      0089CD 53 50 3A         [ 4] 1556 	call putc 
      000996                       1557 5$: _drop VSIZE 
      0089D0 00 03            [ 2]    1     addw sp,#VSIZE 
      0089D1 81               [ 4] 1558     ret	
                                   1559 
                                   1560 ;-----------------------------------
                                   1561 ; print a 16 bit integer 
                                   1562 ; using variable 'base' as conversion
                                   1563 ; format.
                                   1564 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1565 ;   X       integer to print 
                                   1566 ;   base    conversion base 
                                   1567 ; output:
                                   1568 ;   none 
                                   1569 ;-----------------------------------
                           000001  1570 	SIGN=1
                           000001  1571 	VSIZE=1
      000999                       1572 print_int: 
      000999                       1573 	_vars VSIZE 
      0089D1 52 03            [ 2]    1     sub sp,#VSIZE 
      0089D3 0F 03            [ 1] 1574 	clr (SIGN,sp)
      0089D5 A5 80 27 02      [ 2] 1575 	ldw y,#pad+PAD_SIZE-1 
      0089D9 03 03            [ 1] 1576 	clr (y)
      0089DB A4 1F 6B         [ 1] 1577 	ld a,base  
      0089DE 02 9F            [ 1] 1578 	cp a,#10 
      0089E0 6B 01            [ 1] 1579 	jrne 1$ 
      0089E2 7B               [ 2] 1580 	tnzw x 
      0089E3 02 CD            [ 1] 1581 	jrpl 1$ 
      0089E5 8A 75            [ 1] 1582 	cpl (SIGN,sp)
      0089E7 7B               [ 2] 1583 	negw x 	 
      0009B0                       1584 1$:	
      0089E8 01 27 1F         [ 1] 1585 	ld a,base 
      0089EB C7               [ 2] 1586 	div x,a 
      0089EC 00 0B            [ 1] 1587 	add a,#'0 
      0089EE 89 CD            [ 1] 1588 	cp a,#'9+1 
      0089F0 82 F2            [ 1] 1589 	jrmi 2$ 
      0089F2 9F 85            [ 1] 1590 	add a,#7 
      0089F4 31 00            [ 2] 1591 2$: decw y 
      0089F6 0B C0            [ 1] 1592 	ld (y),a 
      0089F8 00               [ 2] 1593 	tnzw x 
      0089F9 0B 2B            [ 1] 1594 	jrne 1$ 
      0089FB 0E 6B            [ 1] 1595 	ld a,#16 
      0089FD 01 A6 20         [ 1] 1596 	cp a,base 
      008A00 0D 01            [ 1] 1597 	jrne 3$
      008A02 27 06            [ 1] 1598 	ld a,#'$
      008A04 5A F7            [ 2] 1599 	decw y  
      008A06 0A 01            [ 1] 1600 	ld (y),a
      008A08 20 F6            [ 2] 1601 	jra 9$ 
      008A0A 0D 01            [ 1] 1602 3$: tnz (SIGN,sp)
      008A0A CD 82            [ 1] 1603 	jreq 9$ 
      008A0C 30 0D            [ 1] 1604 	ld a,#'-
      008A0E 03 27            [ 2] 1605 	decw y  
      008A10 05 A6            [ 1] 1606 	ld (y),a
      0009DC                       1607 9$:	
      008A12 20               [ 1] 1608 	ldw x,y 
      008A13 CD 82 1E         [ 2] 1609 	subw x,#pad+PAD_SIZE-1 
      008A16 5B               [ 2] 1610 	negw x  
      0009E1                       1611 10$:
      008A17 03 81            [ 2] 1612 	decw y 
      008A19 A6 20            [ 1] 1613 	ld a,#SPACE 
      008A19 52 01            [ 1] 1614 	ld (y),a
      008A1B 0F               [ 1] 1615 	incw x 
      008A1C 01               [ 1] 1616 	ld a,xl 
      008A1D 90 AE 17         [ 1] 1617 	cp a,tab_width
      008A20 3F 90            [ 1] 1618 	jrmi 10$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      0009EE                       1619 12$:
      008A22 7F               [ 1] 1620     ldw x,y 
      008A23 C6 00 08         [ 4] 1621 	call puts  
      0009F2                       1622 	_drop VSIZE 
      008A26 A1 0A            [ 2]    1     addw sp,#VSIZE 
      008A28 26               [ 4] 1623 	ret 
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
      0009F5                       1636 itoa:
      008A29 06 5D            [ 2] 1637 	sub sp,#VSIZE
      008A2B 2A 03            [ 1] 1638 	ld (BASE,sp), a  ; base
      008A2D 03 01            [ 1] 1639 	clr (SIGN,sp)    ; sign
      008A2F 50 0A            [ 1] 1640 	cp a,#10
      008A30 26 0A            [ 1] 1641 	jrne 1$
                                   1642 	; base 10 string display with negative sign if bit 23==1
      008A30 C6 00 08 62 AB   [ 2] 1643 	btjf acc24,#7,1$
      008A35 30 A1            [ 1] 1644 	cpl (SIGN,sp)
      008A37 3A 2B 02         [ 4] 1645 	call neg_acc24
      000A09                       1646 1$:
                                   1647 ; initialize string pointer 
      008A3A AB 07 90         [ 2] 1648 	ldw x,#pad+PAD_SIZE-1
      008A3D 5A               [ 1] 1649 	clr (x)
      000A0D                       1650 itoa_loop:
      008A3E 90 F7            [ 1] 1651     ld a,(BASE,sp)
      008A40 5D 26 ED         [ 4] 1652     call divu24_8 ; acc24/A 
      008A43 A6 10            [ 1] 1653     add a,#'0  ; remainder of division
      008A45 C1 00            [ 1] 1654     cp a,#'9+1
      008A47 08 26            [ 1] 1655     jrmi 2$
      008A49 08 A6            [ 1] 1656     add a,#7 
      008A4B 24               [ 2] 1657 2$: decw x
      008A4C 90               [ 1] 1658     ld (x),a
                                   1659 	; if acc24==0 conversion done
      008A4D 5A 90 F7         [ 1] 1660 	ld a,acc24
      008A50 20 0A 0D         [ 1] 1661 	or a,acc16
      008A53 01 27 06         [ 1] 1662 	or a,acc8
      008A56 A6 2D            [ 1] 1663     jrne itoa_loop
                                   1664 	;conversion done, next add '$' or '-' as required
      008A58 90 5A            [ 1] 1665 	ld a,(BASE,sp)
      008A5A 90 F7            [ 1] 1666 	cp a,#16
      008A5C 27 08            [ 1] 1667 	jreq 8$
      008A5C 93 1D            [ 1] 1668 	ld a,(SIGN,sp)
      008A5E 17 3F            [ 1] 1669     jreq 10$
      008A60 50 2D            [ 1] 1670     ld a,#'-
      008A61 20 02            [ 2] 1671 	jra 9$ 
      008A61 90 5A            [ 1] 1672 8$: ld a,#'$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A63 A6               [ 2] 1673 9$: decw x
      008A64 20               [ 1] 1674     ld (x),a
      000A39                       1675 10$:
      008A65 90 F7            [ 2] 1676 	addw sp,#VSIZE
      008A67 5C               [ 4] 1677 	ret
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
      000A3C                       1692 divu24_8:
      008A68 9F               [ 2] 1693 	pushw x ; save x
      008A69 C1               [ 1] 1694 	push a 
                                   1695 	; ld dividend UU:MM bytes in X
      008A6A 00 26 2B         [ 1] 1696 	ld a, acc24
      008A6D F3               [ 1] 1697 	ld xh,a
      008A6E C6 00 09         [ 1] 1698 	ld a,acc24+1
      008A6E 93               [ 1] 1699 	ld xl,a
      008A6F CD 82            [ 1] 1700 	ld a,(U8,SP) ; divisor
      008A71 30               [ 2] 1701 	div x,a ; UU:MM/U8
      008A72 5B               [ 1] 1702 	push a  ;save remainder
      008A73 01               [ 1] 1703 	ld a,xh
      008A74 81 00 08         [ 1] 1704 	ld acc24,a
      008A75 9F               [ 1] 1705 	ld a,xl
      008A75 52 02 6B         [ 1] 1706 	ld acc24+1,a
      008A78 02               [ 1] 1707 	pop a
      008A79 0F               [ 1] 1708 	ld xh,a
      008A7A 01 A1 0A         [ 1] 1709 	ld a,acc24+2
      008A7D 26               [ 1] 1710 	ld xl,a
      008A7E 0A 72            [ 1] 1711 	ld a,(U8,sp) ; divisor
      008A80 0F               [ 2] 1712 	div x,a  ; R:LL/U8
      008A81 00 09            [ 1] 1713 	ld (U8,sp),a ; save remainder
      008A83 05               [ 1] 1714 	ld a,xl
      008A84 03 01 CD         [ 1] 1715 	ld acc24+2,a
      008A87 8A               [ 1] 1716 	pop a
      008A88 E4               [ 2] 1717 	popw x
      008A89 81               [ 4] 1718 	ret
                                   1719 
                                   1720 ;------------------------------------
                                   1721 ;  two's complement acc24
                                   1722 ;  input:
                                   1723 ;		acc24 variable
                                   1724 ;  output:
                                   1725 ;		acc24 variable
                                   1726 ;-------------------------------------
      000A64                       1727 neg_acc24:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008A89 AE 17 3F 7F      [ 1] 1728 	cpl acc24+2
      008A8D 72 53 00 09      [ 1] 1729 	cpl acc24+1
      008A8D 7B 02 CD 8A      [ 1] 1730 	cpl acc24
      008A91 BC AB            [ 1] 1731 	ld a,#1
      008A93 30 A1 3A         [ 1] 1732 	add a,acc24+2
      008A96 2B 02 AB         [ 1] 1733 	ld acc24+2,a
      008A99 07               [ 1] 1734 	clr a
      008A9A 5A F7 C6         [ 1] 1735 	adc a,acc24+1
      008A9D 00 09 CA         [ 1] 1736 	ld acc24+1,a 
      008AA0 00               [ 1] 1737 	clr a 
      008AA1 0A CA 00         [ 1] 1738 	adc a,acc24 
      008AA4 0B 26 E6         [ 1] 1739 	ld acc24,a 
      008AA7 7B               [ 4] 1740 	ret
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
      000A87                       1758 readln:
      008AA8 02               [ 1] 1759 	clrw x 
      008AA9 A1               [ 2] 1760 	pushw x 
      008AAA 10 27 08 7B      [ 2] 1761  	ldw y,#tib ; input buffer
      000A8D                       1762 readln_loop:
      008AAE 01 27 08         [ 4] 1763 	call getc
      008AB1 A6 2D            [ 1] 1764 	ld (RXCHAR,sp),a
      008AB3 20 02            [ 1] 1765 	cp a,#CR
      008AB5 A6 24            [ 1] 1766 	jrne 1$
      008AB7 5A F7 06         [ 2] 1767 	jp readln_quit
      008AB9 A1 0A            [ 1] 1768 1$:	cp a,#NL
      008AB9 5B 02            [ 1] 1769 	jreq readln_quit
      008ABB 81 08            [ 1] 1770 	cp a,#BSP
      008ABC 27 41            [ 1] 1771 	jreq del_back
      008ABC 89 88            [ 1] 1772 	cp a,#CTRL_D
      008ABE C6 00            [ 1] 1773 	jreq del_ln
      008AC0 09 95            [ 1] 1774 	cp a,#CTRL_R 
      008AC2 C6 00            [ 1] 1775 	jreq reprint 
                                   1776 ;	cp a,#'[
                                   1777 ;	jreq ansi_seq
      000AA9                       1778 final_test:
      008AC4 0A 97            [ 1] 1779 	cp a,#SPACE
      008AC6 7B 01            [ 1] 1780 	jrpl accept_char
      008AC8 62 88            [ 2] 1781 	jra readln_loop
      000AAF                       1782 ansi_seq:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1783 ;	call getc
                                   1784 ;	cp a,#'C 
                                   1785 ;	jreq rigth_arrow
                                   1786 ;	cp a,#'D 
                                   1787 ;	jreq left_arrow 
                                   1788 ;	jra final_test
      000AAF                       1789 right_arrow:
                                   1790 ;	ld a,#BSP 
                                   1791 ;	call putc 
                                   1792 ;	jra realn_loop 
      000AAF                       1793 left_arrow:
                                   1794 
                                   1795 ;	jra readln_loop
      000AAF                       1796 reprint: 
      008ACA 9E C7 00 09      [ 1] 1797 	tnz count 
      008ACE 9F C7            [ 1] 1798 	jreq readln_loop
      008AD0 00 0A            [ 1] 1799 	tnz (LL,sp)
      008AD2 84 95            [ 1] 1800 	jrne readln_loop
      008AD4 C6 00 0B         [ 2] 1801 	ldw x,#tib 
      008AD7 97 7B 01         [ 4] 1802 	call puts
      008ADA 62 6B 01 9F      [ 2] 1803 	ldw y,#tib 
      008ADE C7 00 0B         [ 1] 1804 	ld a,count 
      008AE1 84 85            [ 1] 1805 	ld (LL,sp),a
      008AE3 81 5F 00 02      [ 1] 1806 	clr count 
      008AE4 0F 01            [ 1] 1807 	clr (LL_HB,sp)
      008AE4 72 53 00         [ 2] 1808 	addw y,(LL_HB,sp)
      008AE7 0B 72            [ 2] 1809 	jra readln_loop 
      000AD3                       1810 del_ln:
      008AE9 53 00            [ 1] 1811 	ld a,(LL,sp)
      008AEB 0A 72 53         [ 4] 1812 	call delete
      008AEE 00 09 A6 01      [ 2] 1813 	ldw y,#tib
      008AF2 CB 00            [ 1] 1814 	clr (y)
      008AF4 0B C7            [ 1] 1815 	clr (LL,sp)
      008AF6 00 0B            [ 2] 1816 	jra readln_loop
      000AE2                       1817 del_back:
      008AF8 4F C9            [ 1] 1818     tnz (LL,sp)
      008AFA 00 0A            [ 1] 1819     jreq readln_loop
      008AFC C7 00            [ 1] 1820     dec (LL,sp)
      008AFE 0A 4F            [ 2] 1821     decw y
      008B00 C9 00            [ 1] 1822     clr  (y)
      008B02 09 C7 00         [ 4] 1823     call bksp 
      008B05 09 81            [ 2] 1824     jra readln_loop	
      008B07                       1825 accept_char:
      008B07 5F 89            [ 1] 1826 	ld a,#TIB_SIZE-1
      008B09 90 AE            [ 1] 1827 	cp a, (LL,sp)
      008B0B 16 C8            [ 1] 1828 	jreq readln_loop
      008B0D 7B 01            [ 1] 1829 	ld a,(RXCHAR,sp)
      008B0D CD 82            [ 1] 1830 	ld (y),a
      008B0F 27 6B            [ 1] 1831 	inc (LL,sp)
      008B11 01 A1            [ 1] 1832 	incw y
      008B13 0D 26            [ 1] 1833 	clr (y)
      008B15 03 CC 8B         [ 4] 1834 	call putc 
      008B18 86 A1            [ 2] 1835 	jra readln_loop
      000B06                       1836 readln_quit:
      008B1A 0A 27            [ 1] 1837 	clr (y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008B1C 69 A1            [ 1] 1838 	ld a,(LL,sp)
      008B1E 08 27 41         [ 1] 1839 	ld count,a 
      000B0D                       1840 	_drop VSIZE 
      008B21 A1 04            [ 2]    1     addw sp,#VSIZE 
      008B23 27 2E            [ 1] 1841 	ld a,#CR
      008B25 A1 12 27         [ 4] 1842 	call putc
      008B28 06               [ 4] 1843 	ret
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
      008B29                       1856 cmd_itf:
      008B29 A1 20            [ 2] 1857 	sub sp,#VSIZE 
      008B2B 2A 44 20 DE      [ 1] 1858 	clr farptr 
      008B2F 72 5F 00 14      [ 1] 1859 	clr farptr+1 
      008B2F 72 5F 00 15      [ 1] 1860 	clr farptr+2  
      008B2F                       1861 repl:
      008B2F A6 0D            [ 1] 1862 	ld a,#CR 
      008B2F 72 5D 00         [ 4] 1863 	call putc 
      008B32 03 27            [ 1] 1864 	ld a,#'? 
      008B34 D8 0D 02         [ 4] 1865 	call putc
      008B37 26 D4 AE 16      [ 1] 1866 	clr in.w 
      008B3B C8 CD 82 30      [ 1] 1867 	clr in 
      008B3F 90 AE 16         [ 4] 1868 	call readln
      008B42 C8 C6 00 03      [ 2] 1869 	ldw y,#tib  
      008B46 6B 02            [ 1] 1870 	ld a,(y)
      008B48 72 5F            [ 1] 1871 	jreq repl  
      008B4A 00 03 0F 01      [ 1] 1872 	inc in 
      008B4E 72 F9 01         [ 4] 1873 	call to_upper 
      008B51 20 BA            [ 1] 1874 	cp a,#'Q 
      008B53 26 17            [ 1] 1875 	jrne test_p
      000B4B                       1876 repl_exit:
      008B53 7B 02 CD 82      [ 1] 1877 	clr tib 
      008B57 4A 90 AE 16      [ 1] 1878 	clr count 
      008B5B C8 90 7F 0F      [ 1] 1879 	clr in 
      000B57                       1880 	_drop #VSIZE 	
      008B5F 02 20            [ 2]    1     addw sp,##VSIZE 
      008B61 AB               [ 4] 1881 	ret  
      008B62                       1882 invalid:
      008B62 0D 02 27         [ 2] 1883 	ldw x,#invalid_cmd 
      008B65 A7 0A 02         [ 4] 1884 	call puts 
      008B68 90 5A            [ 2] 1885 	jra repl 
      000B62                       1886 test_p:	
      008B6A 90 7F            [ 1] 1887     cp a,#'P 
      008B6C CD 82            [ 1] 1888 	jreq mem_peek
      008B6E 3A 20            [ 1] 1889     cp a,#'S 
      008B70 9C F0            [ 1] 1890 	jrne invalid 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B71                       1891 print_string:	
      008B71 A6 4F 11         [ 4] 1892 	call get_token
      008B74 02 27            [ 1] 1893 	cp a,#TK_INTGR 
      008B76 96 7B            [ 1] 1894 	jrne invalid 
      008B78 01 90 F7         [ 4] 1895 	call puts
      008B7B 0C 02 90         [ 2] 1896 	jp repl 	
      000B77                       1897 mem_peek:
      008B7E 5C 90            [ 1] 1898 	ld a,#SPACE 
      008B80 7F CD 82         [ 4] 1899 	call skip  	 
      008B83 1E 20 87 00      [ 2] 1900 	addw y,in.w 
      008B86 AE 17 18         [ 2] 1901 	ldw x,#pad 
      008B86 90 7F 7B         [ 4] 1902 	call strcpy
      008B89 02 C7 00         [ 4] 1903 	call atoi24 	
      008B8C 03 5B 02         [ 1] 1904 	ld a, acc24 
      008B8F A6 0D CD         [ 1] 1905 	or a,acc16 
      008B92 82 1E 81         [ 1] 1906 	or a,acc8 
      008B95 26 02            [ 1] 1907 	jrne 1$ 
      008B95 52 01            [ 2] 1908 	jra peek_byte  
      008B97 72 5F 00         [ 2] 1909 1$:	ldw x,acc24 
      008B9A 14 72 5F         [ 2] 1910 	ldw farptr,x 
      008B9D 00 15 72         [ 1] 1911 	ld a,acc8 
      008BA0 5F 00 16         [ 1] 1912 	ld farptr+2,a 
      008BA3                       1913 peek_byte:
      008BA3 A6 0D CD         [ 4] 1914 	call print_farptr 
      008BA6 82 1E            [ 1] 1915 	ld a,#8 
      008BA8 A6 3F            [ 1] 1916 	ld (PSIZE,sp),a 
      008BAA CD               [ 1] 1917 	clrw x 
      008BAB 82 1E 72         [ 4] 1918 1$:	call fetchc  
      008BAE 5F               [ 2] 1919 	pushw x 
      008BAF 00 01 72         [ 1] 1920 	ld acc8,a 
      008BB2 5F               [ 1] 1921 	clrw x 
      008BB3 00 02 CD         [ 2] 1922 	ldw acc24,x 
      008BB6 8B 07            [ 1] 1923 	ld a,#16+128
      008BB8 90 AE 16         [ 4] 1924 	call prti24
      008BBB C8               [ 2] 1925 	popw x 
      008BBC 90 F6            [ 1] 1926 	dec (PSIZE,sp)
      008BBE 27 E3            [ 1] 1927 	jrne 1$ 
      008BC0 72 5C            [ 1] 1928 	ld a,#8 
      008BC2 00 02 CD         [ 1] 1929 	add a,farptr+2 
      008BC5 8F 43 A1         [ 1] 1930 	ld farptr+2,a
      008BC8 51               [ 1] 1931 	clr a 
      008BC9 26 17 14         [ 1] 1932 	adc a,farptr+1 
      008BCB C7 00 14         [ 1] 1933 	ld farptr+1,a 
      008BCB 72               [ 1] 1934 	clr a 
      008BCC 5F 16 C8         [ 1] 1935 	adc a,farptr 
      008BCF 72 5F 00         [ 1] 1936 	ld farptr,a 
      008BD2 03 72 5F         [ 2] 1937 	jp repl  
                                   1938 
      008BD5 00 02 5B 01 81 20 63  1939 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1940 
                                   1941 ;----------------------------
                                   1942 ; display farptr address
                                   1943 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008BDA                       1944 print_farptr:
      008BDA AE 8C 58         [ 1] 1945 	ld a ,farptr+2 
      008BDD CD 82 30         [ 1] 1946 	ld acc8,a 
      008BE0 20 C1 13         [ 2] 1947 	ldw x,farptr 
      008BE2 CF 00 08         [ 2] 1948 	ldw acc24,x 
      008BE2 A1               [ 1] 1949 	clrw x 
      008BE3 50 27            [ 1] 1950 	ld a,#16 
      008BE5 11 A1 53         [ 4] 1951 	call prti24
      008BE8 26 F0            [ 1] 1952 	ld a,#SPACE 
      008BEA CD 01 9E         [ 4] 1953 	call putc 
      008BEA CD 8D 84         [ 4] 1954 	call putc 
      008BED A1               [ 4] 1955 	ret
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
      000C02                       1966 fetchc: ; @C
      008BEE 03 26 E9 CD      [ 5] 1967 	ldf a,([farptr],x)
      008BF2 82               [ 1] 1968 	incw x
      008BF3 30               [ 4] 1969 	ret
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
      000C08                       1980 number::
      008BF4 CC 8B A3         [ 4] 1981 	call get_token
      008BF7 CD 0E CF         [ 4] 1982 	call atoi24
      008BF7 A6               [ 4] 1983 	ret
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
      000C0F                       1998 parse_quote: ; { -- addr }
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      000C0F                       1999 	_vars VSIZE 
      008BF8 20 CD            [ 2]    1     sub sp,#VSIZE 
      008BFA 8F               [ 1] 2000 	clr a
      008BFB FB 72            [ 1] 2001 1$:	ld (PREV,sp),a 
      008BFD B9 00 01 AE      [ 1] 2002 2$:	inc in
      008C01 17 18 CD         [ 4] 2003 	ld a,([in.w],y)
      008C04 83 10            [ 1] 2004 	jreq 6$
      008C06 CD 8F            [ 1] 2005 	ld (CURR,sp),a 
      008C08 4F C6            [ 1] 2006 	ld a,#'\
      008C0A 00 09            [ 1] 2007 	cp a, (PREV,sp)
      008C0C CA 00            [ 1] 2008 	jrne 3$
      008C0E 0A CA            [ 1] 2009 	clr (PREV,sp)
      008C10 00 0B            [ 1] 2010 	ld a,(CURR,sp)
      008C12 26 02            [ 4] 2011 	callr convert_escape
      008C14 20               [ 1] 2012 	ld (x),a 
      008C15 0C               [ 1] 2013 	incw x 
      008C16 CE 00            [ 2] 2014 	jra 2$
      000C2F                       2015 3$:
      008C18 09 CF            [ 1] 2016 	ld a,(CURR,sp)
      008C1A 00 14            [ 1] 2017 	cp a,#'\'
      008C1C C6 00            [ 1] 2018 	jreq 1$
      008C1E 0B C7            [ 1] 2019 	cp a,#'"
      008C20 00 16            [ 1] 2020 	jreq 5$ 
      008C22 F7               [ 1] 2021 	ld (x),a 
      008C22 CD               [ 1] 2022 	incw x 
      008C23 8C 67            [ 2] 2023 	jra 2$
      008C25 A6 08 6B 01      [ 1] 2024 5$:	inc in 
      008C29 5F               [ 1] 2025 6$: clr (x)
      008C2A CD 8C 82         [ 2] 2026 	ldw x,#pad 
      000C45                       2027 	_drop VSIZE
      008C2D 89 C7            [ 2]    1     addw sp,#VSIZE 
      008C2F 00 0B            [ 1] 2028 	ld a,#TK_QSTR  
      008C31 5F               [ 4] 2029 	ret 
                                   2030 
                                   2031 ;---------------------------------------
                                   2032 ; called by parse_quote
                                   2033 ; subtitute escaped character 
                                   2034 ; by their ASCII value .
                                   2035 ; input:
                                   2036 ;   A  character following '\'
                                   2037 ; output:
                                   2038 ;   A  substitued char or same if not valid.
                                   2039 ;---------------------------------------
      000C4A                       2040 convert_escape:
      008C32 CF               [ 2] 2041 	pushw x 
      008C33 00 09 A6         [ 2] 2042 	ldw x,#escaped 
      008C36 90               [ 1] 2043 1$:	cp a,(x)
      008C37 CD 89            [ 1] 2044 	jreq 2$
      008C39 D1               [ 1] 2045 	tnz (x)
      008C3A 85 0A            [ 1] 2046 	jreq 3$
      008C3C 01               [ 1] 2047 	incw x 
      008C3D 26 EB            [ 2] 2048 	jra 1$
      008C3F A6 08 CB         [ 2] 2049 2$: subw x,#escaped 
      008C42 00               [ 1] 2050 	ld a,xl 
      008C43 16 C7            [ 1] 2051 	add a,#7
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C45 00               [ 2] 2052 3$:	popw x 
      008C46 16               [ 4] 2053 	ret 
                                   2054 
      008C47 4F C9 00 15 C7 00 15  2055 escaped: .asciz "abtnvfr"
             4F
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
      000C67                       2071 parse_integer: ; { -- n }
      008C4F C9 00            [ 1] 2072 	push #0 ; TCHAR 
      008C51 14 C7            [ 1] 2073 	cp a,#'$
      008C53 00 14            [ 1] 2074 	jreq 1$ 
      008C55 CC 8B            [ 1] 2075 	push #10 ; BASE=10 
      008C57 A3 6E            [ 2] 2076 	jra 2$ 
      008C59 6F 74            [ 1] 2077 1$: push #16  ; BASE=16
      008C5B 20               [ 1] 2078 2$:	ld (x),a 
      008C5C 61               [ 1] 2079 	incw x 
      008C5D 20 63 6F 6D      [ 1] 2080 	inc in 
      008C61 6D 61 6E         [ 4] 2081 	ld a,([in.w],y)
      008C64 64 0A 00         [ 4] 2082 	call to_upper 
      008C67 6B 02            [ 1] 2083 	ld (TCHAR,sp),a 
      008C67 C6 00 16         [ 4] 2084 	call is_digit 
      008C6A C7 00            [ 1] 2085 	jrc 2$
      008C6C 0B CE            [ 1] 2086 	ld a,#16 
      008C6E 00 14            [ 1] 2087 	cp a,(BASE,sp)
      008C70 CF 00            [ 1] 2088 	jrne 3$ 
      008C72 09 5F            [ 1] 2089 	ld a,(TCHAR,sp)
      008C74 A6 10            [ 1] 2090 	cp a,#'A 
      008C76 CD 89            [ 1] 2091 	jrmi 3$ 
      008C78 D1 A6            [ 1] 2092 	cp a,#'G 
      008C7A 20 CD            [ 1] 2093 	jrmi 2$ 
      008C7C 82               [ 1] 2094 3$:	clr (x)
      008C7D 1E CD 82         [ 4] 2095 	call atoi24
      008C80 1E 81 09         [ 2] 2096 	ldw x,acc16 
      008C82 A6 03            [ 1] 2097 	ld a,#TK_INTGR
      000C9F                       2098 	_drop VSIZE  
      008C82 92 AF            [ 2]    1     addw sp,#VSIZE 
      008C84 00               [ 4] 2099 	ret 	
                                   2100 
                                   2101 ;-------------------------
                                   2102 ; binary integer parser 
                                   2103 ; input:
                                   2104 ;   X 		point to pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



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
      000CA2                       2115 parse_binary: ; { -- n }
      008C85 14 5C            [ 1] 2116 	push #0
      008C87 81 00            [ 1] 2117 	push #0
      008C88 F7               [ 1] 2118 1$: ld (x),a 
      008C88 CD               [ 1] 2119 	incw x 
      008C89 8D 84 CD 8F      [ 1] 2120 	inc in 
      008C8D 4F 81 00         [ 4] 2121 	ld a,([in.w],y)
      008C8F A1 30            [ 1] 2122 	cp a,#'0 
      008C8F 52 02            [ 1] 2123 	jreq 2$
      008C91 4F 6B            [ 1] 2124 	cp a,#'1 
      008C93 01 72            [ 1] 2125 	jreq 2$ 
      008C95 5C 00            [ 2] 2126 	jra bin_exit 
      008C97 02 91            [ 1] 2127 2$: sub a,#'0	
      008C99 D6               [ 1] 2128 	rrc a 
      008C9A 01 27            [ 1] 2129 	rlc (BINARY+1,sp)
      008C9C 24 6B            [ 1] 2130 	rlc (BINARY,sp)
      008C9E 02 A6            [ 2] 2131 	jra 1$  
      000CC2                       2132 bin_exit:
      008CA0 5C               [ 1] 2133 	clr (x)
      008CA1 11 01            [ 2] 2134 	ldw x,(BINARY,sp)
      008CA3 26 0A            [ 1] 2135 	ld a,#TK_INTGR 	
      000CC7                       2136 	_drop VSIZE 
      008CA5 0F 01            [ 2]    1     addw sp,#VSIZE 
      008CA7 7B               [ 4] 2137 	ret
                                   2138 
                                   2139 ;---------------------------
                                   2140 ;  token begin with a letter,
                                   2141 ;  is keyword or variable. 	
                                   2142 ; input:
                                   2143 ;   X 		point to pad 
                                   2144 ;   Y 		point to text
                                   2145 ;   A 	    first letter  
                                   2146 ; output:
                                   2147 ;   X		exec_addr|var_addr 
                                   2148 ;   A 		TK_CMD 
                                   2149 ;   pad 	keyword|var_name  
                                   2150 ;   TOS     exec_addr|var_addr 
                                   2151 ;--------------------------  
      000CCA                       2152 parse_keyword: ; { -- exec_addr|var_addr}
      008CA8 02 AD 1F         [ 4] 2153 	call to_upper 
      008CAB F7               [ 1] 2154 	ld (x),a 
      008CAC 5C               [ 1] 2155 	incw x 
      008CAD 20 E5 00 01      [ 1] 2156 	inc in 
      008CAF 91 D6 00         [ 4] 2157 	ld a,([in.w],y)
      008CAF 7B 02 A1         [ 4] 2158 	call is_alpha 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CB2 5C 27            [ 1] 2159 	jrc parse_keyword 
      008CB4 DD               [ 1] 2160 1$: clr (x)
      008CB5 A1 22 27 04      [ 1] 2161 	tnz pad+1 
      008CB9 F7 5C            [ 1] 2162 	jrne 2$
                                   2163 ; one letter variable name 
      008CBB 20 D7 72         [ 1] 2164 	ld a,pad 
      008CBE 5C 00            [ 1] 2165 	sub a,#'A 
      008CC0 02               [ 1] 2166 	sll a 
      008CC1 7F               [ 1] 2167 	push a 
      008CC2 AE 17            [ 1] 2168 	push #0
      008CC4 18 5B 02         [ 2] 2169 	ldw x,#vars 
      008CC7 A6 08 81         [ 2] 2170 	addw x,(1,sp) ; X=var address 
      008CCA                       2171 	_drop 2 
      008CCA 89 AE            [ 2]    1     addw sp,#2 
      008CCC 8C DF            [ 1] 2172 	ld a,#TK_VAR 
      008CCE F1 27            [ 2] 2173 	jra 4$ 
      000CF7                       2174 2$: ; check for keyword, otherwise syntax error.
      000CF7                       2175 	_ldx_dict kword_dict
      008CD0 06 7D 27         [ 2]    1     ldw x,#kword_dict+2
      008CD3 09 5C 20         [ 4] 2176 	call search_dict
      008CD6 F7               [ 1] 2177 	tnz a
      008CD7 1D 8C            [ 1] 2178 	jrne 4$ 
      008CD9 DF 9F AB         [ 2] 2179 	jp syntax_error
      008CDC 07               [ 4] 2180 4$:	ret  	
                                   2181 
                                   2182 
                                   2183 ;------------------------------------
                                   2184 ; Command line tokenizer
                                   2185 ; scan text for next token
                                   2186 ; move token in 'pad'
                                   2187 ; input: 
      000D04                       2188 	none: 
                                   2189 ; use:
                                   2190 ;	Y   pointer to text
                                   2191 ;   X	pointer to pad 
                                   2192 ;   in.w   index in text buffer
                                   2193 ; output:
                                   2194 ;   A       token attribute 
                                   2195 ;   pad 	token as .asciz
                                   2196 ;   X 		token value   
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
      000D04                       2208 get_token: 
      008CDD 85 81 61 62      [ 2] 2209 	ldw y,#tib    	
      008CE1 74 6E 76         [ 1] 2210 	ld a,in 
      008CE4 66 72 00         [ 1] 2211 	cp a,count 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008CE7 2B 03            [ 1] 2212 	jrmi 1$
      008CE7 4B 00            [ 1] 2213 	ld a,#TK_NONE 
      008CE9 A1               [ 4] 2214 	ret 
      000D13                       2215 1$:	
      000D13                       2216 	_vars VSIZE
      008CEA 24 27            [ 2]    1     sub sp,#VSIZE 
      008CEC 04 4B 0A         [ 2] 2217 	ldw x, #pad
      008CEF 20 02            [ 1] 2218 	ld a,#SPACE
      008CF1 4B 10 F7         [ 4] 2219 	call skip
      008CF4 5C 72 5C         [ 2] 2220 	ldw in.w.saved,x 
      008CF7 00 02 91         [ 4] 2221 	ld a,([in.w],y)
      008CFA D6 01            [ 1] 2222 	jrne str_tst
      008CFC CD 8F 43 6B      [ 1] 2223 	clr pad 
      008D00 02 CD 8F         [ 2] 2224 	jp token_exit ; end of line 
                                   2225 
      000D2C                       2226 str_tst: ; check for quoted string  	
      008D03 3A 25 ED         [ 4] 2227 	call to_upper 
      008D06 A6 10            [ 1] 2228 	ld (TCHAR,sp),a 
      000D31                       2229 	_case '"' nbr_tst
      008D08 11 01            [ 1]    1 	ld a,#'"' 
      008D0A 26 0A            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0C 7B 02            [ 1]    3 	jrne nbr_tst
      008D0E A1 41 2B         [ 4] 2230 	call parse_quote
      008D11 04 A1 47         [ 2] 2231 	jp token_exit
      000D3D                       2232 nbr_tst: ; check for number 
      008D14 2B DD            [ 1] 2233 	ld a,#'$'
      008D16 7F CD            [ 1] 2234 	cp a,(TCHAR,sp) 
      008D18 8F 4F            [ 1] 2235 	jreq 1$
      008D1A CE 00            [ 1] 2236 	ld a,#'&
      008D1C 0A A6            [ 1] 2237 	cp a,(TCHAR,sp)
      008D1E 03 5B            [ 1] 2238 	jrne 0$
      008D20 02 81 A2         [ 4] 2239 	call parse_binary ; expect binary integer 
      008D22 CC 0E B7         [ 2] 2240 	jp token_exit 
      008D22 4B 00            [ 1] 2241 0$:	ld a,(TCHAR,sp)
      008D24 4B 00 F7         [ 4] 2242 	call is_digit
      008D27 5C 72            [ 1] 2243 	jrnc 3$
      008D29 5C 00 02         [ 4] 2244 1$:	call parse_integer 
      008D2C 91 D6 01         [ 2] 2245 	jp token_exit 
      000D5C                       2246 3$: 
      000D5C                       2247 	_case '(' bkslsh_tst 
      008D2F A1 30            [ 1]    1 	ld a,#'(' 
      008D31 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008D33 A1 31            [ 1]    3 	jrne bkslsh_tst
      008D35 27 02            [ 1] 2248 	ld a,#TK_LPAREN
      008D37 20 09 A0         [ 2] 2249 	jp token_char   	
      000D67                       2250 bkslsh_tst:
      000D67                       2251 	_case '\',rparnt_tst
      008D3A 30 46            [ 1]    1 	ld a,#'\' 
      008D3C 09 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008D3E 09 01            [ 1]    3 	jrne rparnt_tst
      008D40 20 E4            [ 1] 2252 	ld a,(TCHAR,sp)
      008D42 F7               [ 1] 2253 	ld (x),a 
      008D42 7F               [ 1] 2254 	incw x 
      008D43 1E 01 A6 03      [ 1] 2255 	inc in 
      008D47 5B 02 81         [ 4] 2256 	ld a,([in.w],y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D4A F7               [ 1] 2257 	ld (x),a 
      008D4A CD               [ 1] 2258 	incw x 
      008D4B 8F 43 F7 5C      [ 1] 2259 	inc in  
      008D4F 72               [ 1] 2260 	clr (x) 
      008D50 5C               [ 1] 2261 	ld xl,a 
      008D51 00 02            [ 1] 2262 	ld a,#TK_CHAR 
      008D53 91 D6 01         [ 2] 2263 	jp token_exit 
      000D85                       2264 rparnt_tst:		
      000D85                       2265 	_case ')' colon_tst 
      008D56 CD 85            [ 1]    1 	ld a,#')' 
      008D58 80 25            [ 1]    2 	cp a,(TCHAR,sp) 
      008D5A EF 7F            [ 1]    3 	jrne colon_tst
      008D5C 72 5D            [ 1] 2266 	ld a,#TK_RPAREN 
      008D5E 17 19 26         [ 2] 2267 	jp token_char 
      000D90                       2268 colon_tst:
      000D90                       2269 	_case ':' comma_tst 
      008D61 15 C6            [ 1]    1 	ld a,#':' 
      008D63 17 18            [ 1]    2 	cp a,(TCHAR,sp) 
      008D65 A0 41            [ 1]    3 	jrne comma_tst
      008D67 48 88            [ 1] 2270 	ld a,#TK_COLON 
      008D69 4B 00 AE         [ 2] 2271 	jp token_char 
      000D9B                       2272 comma_tst:
      000D9B                       2273 	_case COMMA sharp_tst 
      008D6C 00 27            [ 1]    1 	ld a,#COMMA 
      008D6E 72 FB            [ 1]    2 	cp a,(TCHAR,sp) 
      008D70 01 5B            [ 1]    3 	jrne sharp_tst
      008D72 02 A6            [ 1] 2274 	ld a,#TK_COMMA
      008D74 04 20 0C         [ 2] 2275 	jp token_char
      008D77                       2276 sharp_tst:
      000DA6                       2277 	_case SHARP dash_tst 
      008D77 AE A1            [ 1]    1 	ld a,#SHARP 
      008D79 BA CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008D7B 91 E0            [ 1]    3 	jrne dash_tst
      008D7D 4D 26            [ 1] 2278 	ld a,#TK_SHARP
      008D7F 03 CC 87         [ 2] 2279 	jp token_char  	 	 
      000DB1                       2280 dash_tst: 	
      000DB1                       2281 	_case '-' at_tst 
      008D82 94 81            [ 1]    1 	ld a,#'-' 
      008D84 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D84 26 05            [ 1]    3 	jrne at_tst
      008D84 90 AE            [ 1] 2282 	ld a,#TK_MINUS  
      008D86 16 C8 C6         [ 2] 2283 	jp token_char 
      000DBC                       2284 at_tst:
      000DBC                       2285 	_case '@' qmark_tst 
      008D89 00 02            [ 1]    1 	ld a,#'@' 
      008D8B C1 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008D8D 03 2B            [ 1]    3 	jrne qmark_tst
      008D8F 03 A6            [ 1] 2286 	ld a,#TK_ARRAY 
      008D91 00 81 A7         [ 2] 2287 	jp token_char
      008D93                       2288 qmark_tst:
      000DC7                       2289 	_case '?' tick_tst 
      008D93 52 02            [ 1]    1 	ld a,#'?' 
      008D95 AE 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008D97 18 A6            [ 1]    3 	jrne tick_tst
      008D99 20 CD            [ 1] 2290 	ld a,(TCHAR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008D9B 8F               [ 1] 2291 	ld (x),a 
      008D9C FB               [ 1] 2292 	incw x 
      008D9D CF               [ 1] 2293 	clr (x)
      008D9E 00 12 91 D6      [ 1] 2294 	inc in 
      008DA2 01 26            [ 1] 2295 	ld a,#TK_CMD 
      008DA4 07 72 5F         [ 2] 2296 	ldw x,#print 
      008DA7 17 18 CC         [ 2] 2297 	jp token_exit
      000DDE                       2298 tick_tst: ; ignore comment 
      000DDE                       2299 	_case TICK plus_tst 
      008DAA 8F 37            [ 1]    1 	ld a,#TICK 
      008DAC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DAC CD 8F            [ 1]    3 	jrne plus_tst
      008DAE 43 6B 01 A6      [ 1] 2300 	inc in 
      008DB2 22 11            [ 1] 2301 	ld a,#TK_CMD 
      008DB4 01 26 06         [ 2] 2302 	ldw x,#rem 
      008DB7 CD 8C 8F         [ 2] 2303 	jp token_exit 
      000DF0                       2304 plus_tst:
      000DF0                       2305 	_case '+' star_tst 
      008DBA CC 8F            [ 1]    1 	ld a,#'+' 
      008DBC 37 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DBD 26 05            [ 1]    3 	jrne star_tst
      008DBD A6 24            [ 1] 2306 	ld a,#TK_PLUS  
      008DBF 11 01 27         [ 2] 2307 	jp token_char 
      000DFB                       2308 star_tst:
      000DFB                       2309 	_case '*' slash_tst 
      008DC2 13 A6            [ 1]    1 	ld a,#'*' 
      008DC4 26 11            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC6 01 26            [ 1]    3 	jrne slash_tst
      008DC8 06 CD            [ 1] 2310 	ld a,#TK_MULT 
      008DCA 8D 22 CC         [ 2] 2311 	jp token_char 
      000E06                       2312 slash_tst: 
      000E06                       2313 	_case '/' prcnt_tst 
      008DCD 8F 37            [ 1]    1 	ld a,#'/' 
      008DCF 7B 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DD1 CD 8F            [ 1]    3 	jrne prcnt_tst
      008DD3 3A 24            [ 1] 2314 	ld a,#TK_DIV 
      008DD5 06 CD 8C         [ 2] 2315 	jp token_char 
      000E11                       2316 prcnt_tst:
      000E11                       2317 	_case '%' eql_tst 
      008DD8 E7 CC            [ 1]    1 	ld a,#'%' 
      008DDA 8F 37            [ 1]    2 	cp a,(TCHAR,sp) 
      008DDC 26 05            [ 1]    3 	jrne eql_tst
      008DDC A6 28            [ 1] 2318 	ld a,#TK_MOD
      008DDE 11 01 26         [ 2] 2319 	jp token_char  
                                   2320 ; 1 or 2 character tokens 	
      000E1C                       2321 eql_tst:
      000E1C                       2322 	_case '=' gt_tst 		
      008DE1 05 A6            [ 1]    1 	ld a,#'=' 
      008DE3 09 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE5 8F 27            [ 1]    3 	jrne gt_tst
      008DE7 A6 32            [ 1] 2323 	ld a,#TK_EQUAL
      008DE7 A6 5C 11         [ 2] 2324 	jp token_char 
      000E27                       2325 gt_tst:
      000E27                       2326 	_case '>' lt_tst 
      008DEA 01 26            [ 1]    1 	ld a,#'>' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008DEC 18 7B            [ 1]    2 	cp a,(TCHAR,sp) 
      008DEE 01 F7            [ 1]    3 	jrne lt_tst
      008DF0 5C 72            [ 1] 2327 	ld a,#TK_GT 
      008DF2 5C 00            [ 1] 2328 	ld (ATTRIB,sp),a 
      008DF4 02 91 D6 01      [ 1] 2329 	inc in 
      008DF8 F7 5C 72         [ 4] 2330 	ld a,([in.w],y)
      008DFB 5C 00            [ 1] 2331 	cp a,#'=
      008DFD 02 7F            [ 1] 2332 	jrne 1$
      008DFF 97 A6            [ 1] 2333 	ld a,(TCHAR,sp)
      008E01 02               [ 1] 2334 	ld (x),a
      008E02 CC               [ 1] 2335 	incw x 
      008E03 8F 37            [ 1] 2336 	ld a,#'=
      008E05 6B 01            [ 1] 2337 	ld (TCHAR,sp),a 
      008E05 A6 29            [ 1] 2338 	ld a,#TK_GE 
      008E07 11 01            [ 2] 2339 	jra token_char  
      008E09 26 05            [ 1] 2340 1$: cp a,#'<
      008E0B A6 0A            [ 1] 2341 	jrne 2$
      008E0D CC 8F            [ 1] 2342 	ld a,(TCHAR,sp)
      008E0F 27               [ 1] 2343 	ld (x),a
      008E10 5C               [ 1] 2344 	incw x 
      008E10 A6 3A            [ 1] 2345 	ld a,#'<	
      008E12 11 01            [ 1] 2346 	ld (TCHAR,sp),a 
      008E14 26 05            [ 1] 2347 	ld a,#TK_NE 
      008E16 A6 01            [ 2] 2348 	jra token_char 
      008E18 CC 8F 27 01      [ 1] 2349 2$: dec in
      008E1B 7B 02            [ 1] 2350 	ld a,(ATTRIB,sp)
      008E1B A6 2C            [ 2] 2351 	jra token_char 
      000E60                       2352 lt_tst:
      000E60                       2353 	_case '<' other
      008E1D 11 01            [ 1]    1 	ld a,#'<' 
      008E1F 26 05            [ 1]    2 	cp a,(TCHAR,sp) 
      008E21 A6 0B            [ 1]    3 	jrne other
      008E23 CC 8F            [ 1] 2354 	ld a,#TK_LT 
      008E25 27 02            [ 1] 2355 	ld (ATTRIB,sp),a 
      008E26 72 5C 00 01      [ 1] 2356 	inc in 
      008E26 A6 23 11         [ 4] 2357 	ld a,([in.w],y)
      008E29 01 26            [ 1] 2358 	cp a,#'=
      008E2B 05 A6            [ 1] 2359 	jrne 1$
      008E2D 0C CC            [ 1] 2360 	ld a,(TCHAR,sp)
      008E2F 8F               [ 1] 2361 	ld (x),a 
      008E30 27 3D            [ 1] 2362 	ld a,#'=
      008E31 6B 01            [ 1] 2363 	ld (TCHAR,sp),a 
      008E31 A6 2D            [ 1] 2364 	ld a,#TK_LE 
      008E33 11 01            [ 2] 2365 	jra token_char 
      008E35 26 05            [ 1] 2366 1$: cp a,#'>
      008E37 A6 11            [ 1] 2367 	jrne 2$
      008E39 CC 8F            [ 1] 2368 	ld a,(TCHAR,sp)
      008E3B 27               [ 1] 2369 	ld (x),a 
      008E3C 5C               [ 1] 2370 	incw x 
      008E3C A6 40            [ 1] 2371 	ld a,#'>
      008E3E 11 01            [ 1] 2372 	ld (TCHAR,sp),a 
      008E40 26 05            [ 1] 2373 	ld a,#TK_NE 
      008E42 A6 05            [ 2] 2374 	jra token_char 
      008E44 CC 8F 27 01      [ 1] 2375 2$: dec in 
      008E47 7B 02            [ 1] 2376 	ld a,(ATTRIB,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E47 A6 3F            [ 2] 2377 	jra token_char 	
      000E98                       2378 other: ; not a special character 	 
      008E49 11 01            [ 1] 2379 	ld a,(TCHAR,sp)
      008E4B 26 11 7B         [ 4] 2380 	call is_alpha 
      008E4E 01 F7            [ 1] 2381 	jrc 30$ 
      008E50 5C 7F 72         [ 2] 2382 	jp syntax_error 
      000EA2                       2383 30$: 
      008E53 5C 00 02         [ 4] 2384 	call parse_keyword
      008E56 A6 06            [ 2] 2385 	jra token_exit 
      000EA7                       2386 token_char:
      008E58 AE 96            [ 1] 2387 	ld (ATTRIB,sp),a 
      008E5A 78 CC            [ 1] 2388 	ld a,(TCHAR,sp)
      008E5C 8F               [ 1] 2389 	ld (x),a 
      008E5D 37               [ 1] 2390 	incw x 
      008E5E 7F               [ 1] 2391 	clr(x)
      008E5E A6 27 11 01      [ 1] 2392 	inc in 
      008E62 26 0C            [ 1] 2393 	ld a,(ATTRIB,sp)
      008E64 72 5C 00         [ 2] 2394 	ldw x,#pad 
      000EB7                       2395 token_exit:
      000EB7                       2396 	_drop VSIZE 
      008E67 02 A6            [ 2]    1     addw sp,#VSIZE 
      008E69 06               [ 4] 2397 	ret
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
      000EBA                       2408 is_digit:
      008E6A AE 97            [ 1] 2409 	cp a,#'0
      008E6C 86 CC            [ 1] 2410 	jrc 1$
      008E6E 8F 37            [ 1] 2411     cp a,#'9+1
      008E70 8C               [ 1] 2412 	ccf 
      008E70 A6               [ 1] 2413 1$:	ccf 
      008E71 2B               [ 4] 2414     ret
                                   2415 
                                   2416 ;------------------------------------
                                   2417 ; convert alpha to uppercase
                                   2418 ; input:
                                   2419 ;    a  character to convert
                                   2420 ; output:
                                   2421 ;    a  uppercase character
                                   2422 ;------------------------------------
      000EC3                       2423 to_upper::
      008E72 11 01            [ 1] 2424 	cp a,#'a
      008E74 26 05            [ 1] 2425 	jrpl 1$
      008E76 A6               [ 4] 2426 0$:	ret
      008E77 10 CC            [ 1] 2427 1$: cp a,#'z	
      008E79 8F 27            [ 1] 2428 	jrugt 0$
      008E7B A0 20            [ 1] 2429 	sub a,#32
      008E7B A6               [ 4] 2430 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



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
      000ECF                       2444 atoi24:
      008E7C 2A               [ 2] 2445 	pushw x ;save x
      008E7D 11 01            [ 2] 2446 	sub sp,#VSIZE
                                   2447 	; acc24=0 
      008E7F 26 05 A6 20      [ 1] 2448 	clr acc24    
      008E83 CC 8F 27 09      [ 1] 2449 	clr acc16
      008E86 72 5F 00 0A      [ 1] 2450 	clr acc8 
      008E86 A6 2F 11         [ 1] 2451 	ld a, pad 
      008E89 01 26            [ 1] 2452 	jreq atoi_exit
      008E8B 05 A6            [ 1] 2453 	clr (SIGN,sp)
      008E8D 21 CC            [ 1] 2454 	ld a,#10
      008E8F 8F 27            [ 1] 2455 	ld (BASE,sp),a ; default base decimal
      008E91 AE 17 18         [ 2] 2456 	ldw x,#pad ; pointer to string to convert
      008E91 A6               [ 1] 2457 	ld a,(x)
      008E92 25 11            [ 1] 2458 	jreq 9$  ; completed if 0
      008E94 01 26            [ 1] 2459 	cp a,#'-
      008E96 05 A6            [ 1] 2460 	jrne 1$
      008E98 22 CC            [ 1] 2461 	cpl (SIGN,sp)
      008E9A 8F 27            [ 2] 2462 	jra 2$
      008E9C A1 24            [ 1] 2463 1$: cp a,#'$
      008E9C A6 3D            [ 1] 2464 	jrne 3$
      008E9E 11 01            [ 1] 2465 	ld a,#16
      008EA0 26 05            [ 1] 2466 	ld (BASE,sp),a
      008EA2 A6               [ 1] 2467 2$:	incw x
      008EA3 32               [ 1] 2468 	ld a,(x)
      000F01                       2469 3$:	
      008EA4 CC 8F            [ 1] 2470 	cp a,#'a
      008EA6 27 02            [ 1] 2471 	jrmi 4$
      008EA7 A0 20            [ 1] 2472 	sub a,#32
      008EA7 A6 3E            [ 1] 2473 4$:	cp a,#'0
      008EA9 11 01            [ 1] 2474 	jrmi 9$
      008EAB 26 33            [ 1] 2475 	sub a,#'0
      008EAD A6 31            [ 1] 2476 	cp a,#10
      008EAF 6B 02            [ 1] 2477 	jrmi 5$
      008EB1 72 5C            [ 1] 2478 	sub a,#7
      008EB3 00 02            [ 1] 2479 	cp a,(BASE,sp)
      008EB5 91 D6            [ 1] 2480 	jrpl 9$
      008EB7 01 A1            [ 1] 2481 5$:	ld (TEMP,sp),a
      008EB9 3D 26            [ 1] 2482 	ld a,(BASE,sp)
      008EBB 0C 7B 01         [ 4] 2483 	call mulu24_8
      008EBE F7 5C            [ 1] 2484 	ld a,(TEMP,sp)
      008EC0 A6 3D 6B         [ 1] 2485 	add a,acc24+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008EC3 01 A6 33         [ 1] 2486 	ld acc24+2,a
      008EC6 20               [ 1] 2487 	clr a
      008EC7 5F A1 3C         [ 1] 2488 	adc a,acc24+1
      008ECA 26 0C 7B         [ 1] 2489 	ld acc24+1,a
      008ECD 01               [ 1] 2490 	clr a
      008ECE F7 5C A6         [ 1] 2491 	adc a,acc24
      008ED1 3C 6B 01         [ 1] 2492 	ld acc24,a
      008ED4 A6 35            [ 2] 2493 	jra 2$
      008ED6 20 4F            [ 1] 2494 9$:	tnz (SIGN,sp)
      008ED8 72 5A            [ 1] 2495     jreq atoi_exit
      008EDA 00 02 7B         [ 4] 2496     call neg_acc24
      000F3D                       2497 atoi_exit: 
      008EDD 02 20            [ 2] 2498 	addw sp,#VSIZE
      008EDF 47               [ 2] 2499 	popw x ; restore x
      008EE0 81               [ 4] 2500 	ret
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
      000F41                       2516 mulu24_8:
      008EE0 A6               [ 2] 2517 	pushw x    ; save X
                                   2518 	; local variables
      008EE1 3C               [ 1] 2519 	push a     ; U8
      008EE2 11               [ 1] 2520 	clrw x     ; initialize overflow to 0
      008EE3 01               [ 2] 2521 	pushw x    ; multiplication overflow
                                   2522 ; multiply low byte.
      008EE4 26 32 A6         [ 1] 2523 	ld a,acc24+2
      008EE7 34               [ 1] 2524 	ld xl,a
      008EE8 6B 02            [ 1] 2525 	ld a,(U8,sp)
      008EEA 72               [ 4] 2526 	mul x,a
      008EEB 5C               [ 1] 2527 	ld a,xl
      008EEC 00 02 91         [ 1] 2528 	ld acc24+2,a
      008EEF D6               [ 1] 2529 	ld a, xh
      008EF0 01 A1            [ 1] 2530 	ld (OVFL,sp),a
                                   2531 ; multipy middle byte
      008EF2 3D 26 0B         [ 1] 2532 	ld a,acc24+1
      008EF5 7B               [ 1] 2533 	ld xl,a
      008EF6 01 F7            [ 1] 2534 	ld a, (U8,sp)
      008EF8 A6               [ 4] 2535 	mul x,a
                                   2536 ; add overflow to this partial product
      008EF9 3D 6B 01         [ 2] 2537 	addw x,(OVFH,sp)
      008EFC A6               [ 1] 2538 	ld a,xl
      008EFD 36 20 27         [ 1] 2539 	ld acc24+1,a
      008F00 A1               [ 1] 2540 	clr a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008F01 3E 26            [ 1] 2541 	adc a,#0
      008F03 0C 7B            [ 1] 2542 	ld (OVFH,sp),a
      008F05 01               [ 1] 2543 	ld a,xh
      008F06 F7 5C            [ 1] 2544 	ld (OVFL,sp),a
                                   2545 ; multiply most signficant byte	
      008F08 A6 3E 6B         [ 1] 2546 	ld a, acc24
      008F0B 01               [ 1] 2547 	ld xl, a
      008F0C A6 35            [ 1] 2548 	ld a, (U8,sp)
      008F0E 20               [ 4] 2549 	mul x,a
      008F0F 17 72 5A         [ 2] 2550 	addw x, (OVFH,sp)
      008F12 00               [ 1] 2551 	ld a, xl
      008F13 02 7B 02         [ 1] 2552 	ld acc24,a
      008F16 20 0F            [ 2] 2553     addw sp,#VSIZE
      008F18 85               [ 2] 2554 	popw x
      008F18 7B               [ 4] 2555 	ret
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
      000F7B                       2566 skip:
      008F19 01               [ 1] 2567 	push a
      008F1A CD 85 80         [ 4] 2568 1$:	ld a,([in.w],y)
      008F1D 25 03            [ 1] 2569 	jreq 2$
      008F1F CC 87            [ 1] 2570 	cp a,(C,sp)
      008F21 94 06            [ 1] 2571 	jrne 2$
      008F22 72 5C 00 01      [ 1] 2572 	inc in
      008F22 CD 8D            [ 2] 2573 	jra 1$
      000F8B                       2574 2$: _drop 1 
      008F24 4A 20            [ 2]    1     addw sp,#1 
      008F26 10               [ 4] 2575 	ret
                                   2576 	
                                   2577 ;------------------------------
                                   2578 ; restore 'in.w' variable to 
                                   2579 ; its value before last call
                                   2580 ; to get_token.
                                   2581 ;------------------------------
      008F27                       2582 unget_token:
      008F27 6B 02 7B         [ 2] 2583 	ldw x,in.w.saved
      008F2A 01 F7 5C         [ 2] 2584 	ldw in.w,x 
      008F2D 7F               [ 4] 2585 	ret 
                                   2586 
                                   2587 
                                   2588 ;******************************
                                   2589 ;  data stack manipulation
                                   2590 ;*****************************
                                   2591 ;----------------------	
                                   2592 ; push X on data stack 
                                   2593 ; input:
                                   2594 ;	X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



                                   2595 ; output:
                                   2596 ;	none 
                                   2597 ;----------------------	
      000F95                       2598 dpush:
      000F95                       2599     _dp_down
      008F2E 72 5C 00 02      [ 1]    1     dec dstkptr+1 
      008F32 7B 02 AE 17      [ 1]    2     dec dstkptr+1
      008F36 18 CF 00 19      [ 5] 2600     ldw [dstkptr],x  
      008F37 81               [ 4] 2601 	ret 
                                   2602 
                                   2603 
                                   2604 ;----------------------	
                                   2605 ; pop data stack in X 
                                   2606 ; input:
                                   2607 ;	none
                                   2608 ; output:
                                   2609 ;	X   
                                   2610 ;----------------------	
      000FA2                       2611 dpop: 
      008F37 5B 02 81 19      [ 5] 2612     ldw x, [dstkptr]
      008F3A                       2613 	_dp_up
      008F3A A1 30 25 03      [ 1]    1     inc dstkptr+1
      008F3E A1 3A 8C 8C      [ 1]    2     inc dstkptr+1
      008F42 81               [ 4] 2614 	ret 
                                   2615 
                                   2616 ;-----------------------------
                                   2617 ; swap top 2 elements of dstack
                                   2618 ;  {n1 n2 -- n2 n1 }
                                   2619 ;-----------------------------
      008F43                       2620 dswap:
      008F43 A1 61 2A 01      [ 5] 2621 	ldw x,[dstkptr]
      008F47 81               [ 2] 2622 	pushw x 
      008F48 A1 7A 22         [ 2] 2623 	ldw x,#2 
      008F4B FB A0 20 81      [ 5] 2624 	ldw x,([dstkptr],x) 
      008F4F 72 CF 00 19      [ 5] 2625 	ldw [dstkptr],x 
      008F4F 89 52 03         [ 2] 2626 	ldw x,#2
      008F52 72 5F            [ 2] 2627 	popw y 
      008F54 00 09 72 5F      [ 5] 2628 	ldw ([dstkptr],x),y 
      008F58 00               [ 4] 2629 	ret
                                   2630 
                                   2631 ;-----------------------------
                                   2632 ; drop TOS 
                                   2633 ;-----------------------------
      000FC9                       2634 ddrop: ; { n -- }
      000FC9                       2635 	_dp_up 
      008F59 0A 72 5F 00      [ 1]    1     inc dstkptr+1
      008F5D 0B C6 17 18      [ 1]    2     inc dstkptr+1
      008F61 27               [ 4] 2636 	ret
                                   2637 	
                                   2638 ;-----------------------------
                                   2639 ; duplicate TOS 
                                   2640 ;  dstack: { ix...n -- ix...n n }
                                   2641 ;-----------------------------
      000FD2                       2642 ddup:
      008F62 5A 0F 01 A6      [ 5] 2643 	ldw x,[dstkptr]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      000FD6                       2644 	_dp_down
      008F66 0A 6B 02 AE      [ 1]    1     dec dstkptr+1 
      008F6A 17 18 F6 27      [ 1]    2     dec dstkptr+1
      008F6E 47 A1 2D 26      [ 5] 2645     ldw [dstkptr],x  
      008F72 04               [ 4] 2646 	ret 
                                   2647 
                                   2648 
                                   2649 ;----------------------------------
                                   2650 ; pick value n from dstack 
                                   2651 ; put it on TOS
                                   2652 ; dstack: {ix,..,p -- ix,...,np }
                                   2653 ;-----------------------------------
      000FE3                       2654 dpick:
      008F73 03 01 20 08      [ 5] 2655 	ldw x,[dstkptr]
      008F77 A1               [ 2] 2656 	sllw x 
      008F78 24 26 06 A6      [ 2] 2657 	addw x,dstkptr 
      008F7C 10               [ 2] 2658 	ldw x,(x)
      008F7D 6B 02 5C F6      [ 5] 2659 	ldw [dstkptr],x 
      008F81 81               [ 4] 2660 	ret
                                   2661 
                                   2662 ;---------------------------
                                   2663 ;  fetch variable in X 
                                   2664 ;  dstack:{ addr -- value }
                                   2665 ;---------------------------
      000FF2                       2666 fetch:
      008F81 A1 61 2B 02      [ 5] 2667 	ldw x,[dstkptr]
      008F85 A0               [ 2] 2668 	ldw x,(x)
      008F86 20 A1 30 2B      [ 5] 2669 	ldw [dstkptr],x
      008F8A 2B               [ 4] 2670 	ret 
                                   2671 
                                   2672 ;----------------------------
                                   2673 ; store variable 
                                   2674 ; dstack: {addr value -- }
                                   2675 ;----------------------------
      000FFC                       2676 store:
      008F8B A0 30 A1         [ 4] 2677 	call dpop 
      008F8E 0A 2B            [ 1] 2678 	ldw y,x   ; y=value 
      008F90 06 A0 07         [ 4] 2679 	call dpop 
      008F93 11               [ 2] 2680 	ldw (x),y 
      008F94 02               [ 4] 2681 	ret 
                                   2682 
                                   2683 ;---------------------------------
                                   2684 ; drop n elements from data stack 
                                   2685 ; input: 
                                   2686 ;   X 		n 
                                   2687 ; output:
                                   2688 ;   none 
                                   2689 ;-------------------------------------
      001006                       2690 ddrop_n:
      008F95 2A 1F            [ 2] 2691 	pushw y 
      008F97 6B 03 7B 02      [ 2] 2692 	ldw y,dstkptr 
      008F9B CD               [ 2] 2693 	sllw x 
      008F9C 8F               [ 2] 2694 	pushw x 
      008F9D C1 7B 03         [ 2] 2695 	addw y,(1,sp)
      008FA0 CB 00 0B C7      [ 2] 2696 	ldw dstkptr,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      008FA4 00               [ 2] 2697 	popw x 
      008FA5 0B 4F            [ 2] 2698 	popw y
      008FA7 C9               [ 4] 2699 	ret 
                                   2700 
      008FA8 00 0A C7 00 0A 4F C9  2701 dstk_prompt: .asciz "\ndstack: " 
             00 09 C7
                                   2702 ;----------------------------
                                   2703 ; print dstack content 
                                   2704 ;---------------------------
                           000001  2705 	XSAVE=1
                           000002  2706 	VSIZE=2
      001023                       2707 dots:
      001023                       2708 	_vars VSIZE 
      008FB2 00 09            [ 2]    1     sub sp,#VSIZE 
      008FB4 20 C9 0D         [ 2] 2709 	ldw x,#dstk_prompt 
      008FB7 01 27 03         [ 4] 2710 	call puts
      008FBA CD 8A E4         [ 2] 2711 	ldw x,#dstack_unf-CELL_SIZE
      008FBD 35 0A 00 07      [ 1] 2712 	mov base,#10 
      008FBD 5B 03 85         [ 2] 2713 1$:	cpw x,dstkptr 
      008FC0 81 0D            [ 1] 2714 	jrult 4$ 
      008FC1 1F 01            [ 2] 2715 	ldw (XSAVE,sp),x
      008FC1 89               [ 2] 2716 	ldw  x,(x)
      008FC2 88 5F 89         [ 4] 2717 	call print_int 
      008FC5 C6 00            [ 2] 2718 	ldw x,(XSAVE,sp)
      008FC7 0B 97 7B         [ 2] 2719 	subw x,#CELL_SIZE 
      008FCA 03 42            [ 2] 2720 	jra 1$ 
      008FCC 9F C7            [ 1] 2721 4$: ld a,#CR 
      008FCE 00 0B 9E         [ 4] 2722 	call putc 
      001049                       2723 	_drop VSIZE
      008FD1 6B 02            [ 2]    1     addw sp,#VSIZE 
      008FD3 C6               [ 1] 2724 	clr a 
      008FD4 00               [ 4] 2725 	ret
                                   2726 
      008FD5 0A 97 7B 03 42 72 FB  2727 cstk_prompt: .asciz "\nctack: "
             01 9F
                                   2728 ;--------------------------------
                                   2729 ; print cstack content
                                   2730 ;--------------------------------
                           000001  2731 	XSAVE=1
                           000002  2732 	VSIZE=2 
      001056                       2733 dotr:
      001056                       2734 	_vars VSIZE 
      008FDE C7 00            [ 2]    1     sub sp,#VSIZE 
      008FE0 0A 4F A9         [ 2] 2735 	ldw x,#cstk_prompt
      008FE3 00 6B 01         [ 4] 2736 	call puts 
      008FE6 9E               [ 1] 2737 	ldw x,sp 
      008FE7 6B 02 C6         [ 2] 2738 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008FEA 00 09            [ 2] 2739 	ldw (XSAVE,sp),x  
      008FEC 97 7B 03         [ 2] 2740 	ldw x,#RAM_SIZE-2
      008FEF 42 72 FB 01      [ 1] 2741 	mov base,#16
      00106B                       2742 dotr_loop:
      008FF3 9F C7            [ 2] 2743 	cpw x,(XSAVE,sp)
      008FF5 00 09            [ 1] 2744 	jrmi 9$
      008FF7 5B               [ 2] 2745 	pushw x  
      008FF8 03               [ 2] 2746 	ldw x,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008FF9 85 81 99         [ 4] 2747 	call print_int 
      008FFB 85               [ 2] 2748 	popw x  
      008FFB 88 91 D6         [ 2] 2749 	subw x,#CELL_SIZE
      008FFE 01 27            [ 2] 2750 	jra dotr_loop 
      009000 0A 11            [ 1] 2751 9$:	ld a,#CR 
      009002 01 26 06         [ 4] 2752 	call putc 
      00107F                       2753 	_drop VSIZE 
      009005 72 5C            [ 2]    1     addw sp,#VSIZE 
      009007 00               [ 1] 2754 	clr a 
      009008 02               [ 4] 2755 	ret
                                   2756 
                                   2757 
                                   2758 ;--------------------------------
                                   2759 ;  add 2 integers
                                   2760 ;  input:
                                   2761 ;    N1     on cstack 
                                   2762 ;    N2     on cstack 
                                   2763 ;  output:
                                   2764 ;    X 		n2+n1 
                                   2765 ;--------------------------------
                                   2766 	;arugments on cstack 
      001083                       2767 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001083                       2768 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001083                       2769 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001083                       2770 add:
      009009 20 F1            [ 2] 2771 	ldw x ,(N2,sp)
      00900B 5B 01 81         [ 2] 2772 	addw x,(N1,sp)
      00900E 1F 03            [ 2] 2773 	ldw (N1,sp),x 
      00900E CE               [ 4] 2774 	ret 
                                   2775 
                                   2776 ;--------------------------------
                                   2777 ;  substract 2 ntegers
                                   2778 ;  input:
                                   2779 ;    N1     on cstack 
                                   2780 ;    N2     on cstack 
                                   2781 ;  output:
                                   2782 ;    X 		n2+n1 
                                   2783 ;--------------------------------
      00108B                       2784 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00108B                       2785 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      00108B                       2786 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      00108B                       2787 substract:
      00900F 00 12            [ 2] 2788 	ldw x,(N2,sp)
      009011 CF 00 01         [ 2] 2789 	subw x,(N1,sp)
      009014 81               [ 4] 2790 	ret 
                                   2791 
                                   2792 ;-------------------------------------
                                   2793 ; multiply 2 integers
                                   2794 ; product overflow is ignored unless
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2795 ; MATH_OVF assembler flag is set to 1
                                   2796 ; input:
                                   2797 ;  	N1      on cstack
                                   2798 ;   N2 		on cstack 
                                   2799 ; output:
                                   2800 ;	X        N1*N2 
                                   2801 ;-------------------------------------
                                   2802 	;arguments 
      009015                       2803 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      001091                       2804 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      001091                       2805 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      001091                       2806 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      001091                       2807 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2808    ; local variables 
                           000001  2809 	SIGN=1
                           000002  2810 	PROD=2
                           000003  2811 	VSIZE=3
      001091                       2812 multiply:
      001091                       2813 	_vars VSIZE 
      009015 72 5A            [ 2]    1     sub sp,#VSIZE 
      009017 00 1B            [ 1] 2814 	clr (SIGN,sp)
      009019 72 5A            [ 2] 2815 	ldw x,(N1_HB,sp)
      00901B 00               [ 1] 2816 	ld a,xh  
      00901C 1B 72            [ 1] 2817 	bcp a,#0x80 
      00901E CF 00            [ 1] 2818 	jreq 2$
      009020 1A 81            [ 1] 2819 	cpl (SIGN,sp)
      009022 50               [ 2] 2820 	negw x 
      009022 72 CE            [ 2] 2821 	ldw (N1_HB,sp),x 
      009024 00 1A            [ 2] 2822 2$: ldw x,(N2_HB,sp)
      009026 72               [ 1] 2823 	ld a,xh  
      009027 5C 00            [ 1] 2824 	bcp a,#0x80 
      009029 1B 72            [ 1] 2825 	jreq 3$
      00902B 5C 00            [ 1] 2826 	cpl (SIGN,sp)
      00902D 1B               [ 2] 2827 	negw x 
      00902E 81 08            [ 2] 2828 	ldw (N2_HB,sp),x 
                                   2829 ; N1_LB * N2_LB 	
      00902F 7B 07            [ 1] 2830 3$:	ld a,(N1_LB,sp)
      00902F 72               [ 1] 2831 	ld xl,a 
      009030 CE 00            [ 1] 2832 	ld a,(N2_LB,sp) 
      009032 1A               [ 4] 2833 	mul x,a 
                           000000  2834 .if MATH_OVF 	
                                   2835 	ld a,xh 
                                   2836 	bcp a,#0x80 
                                   2837 	jreq 4$ 
                                   2838 	ld a,#ERR_MATH_OVF 
                                   2839 	jp tb_error
                                   2840 .endif 	 
      009033 89 AE            [ 2] 2841 4$:	ldw (PROD,sp),x
                                   2842 ; N1_LB * N2_HB	 
      009035 00 02            [ 1] 2843 	ld a,(N1_LB,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009037 72               [ 1] 2844 	ld xl,a 
      009038 DE 00            [ 1] 2845 	ld a,(N2_HB,sp)
      00903A 1A               [ 4] 2846 	mul x,a
      00903B 72               [ 1] 2847 	ld a,xl 
      00903C CF 00            [ 1] 2848 	add a,(PROD,sp)
                           000000  2849 .if MATH_OVF 	
                                   2850 	bcp a,#0x80 
                                   2851 	jreq 5$ 
                                   2852 	ld a,#ERR_MATH_OVF 
                                   2853 	jp tb_error
                                   2854 .endif 	 
      00903E 1A AE            [ 1] 2855 5$:	ld (PROD,sp),a 
                                   2856 ; N1_HB * N2_LB 
      009040 00 02            [ 1] 2857 	ld a,(N1_HB,sp)
      009042 90               [ 1] 2858 	ld xl,a 
      009043 85 72            [ 1] 2859 	ld a,(N2_LB,sp)
      009045 DF               [ 4] 2860 	mul x,a 
      009046 00               [ 1] 2861 	ld a,xl 
      009047 1A 81            [ 1] 2862 	add a,(PROD,sp)
                           000000  2863 .if MATH_OVF 	
                                   2864 	bcp a,#0x80 
                                   2865 	jreq 6$ 
                                   2866 	ld a,#ERR_MATH_OVF 
                                   2867 	jp tb_error
                                   2868 .endif 	 
      009049 6B 02            [ 1] 2869 6$:	ld (PROD,sp),a 
                                   2870 ; N1_HB * N2_HB 	
                                   2871 ; it is pointless to multiply N1_HB*N2_HB 
                                   2872 ; as this product is over 65535 or 0 
                                   2873 ;
                                   2874 ; sign adjust product
      009049 72 5C            [ 1] 2875 	tnz (SIGN,sp)
      00904B 00 1B            [ 1] 2876 	jreq 7$
      00904D 72 5C            [ 2] 2877 	ldw x, (PROD,sp)
      00904F 00               [ 2] 2878 	negw x
      009050 1B 81            [ 2] 2879 	ldw (PROD,sp),x  
      009052                       2880 7$: 
      009052 72 CE            [ 2] 2881 	ldw x,(PROD,sp) 
      0010D6                       2882 	_drop VSIZE 
      009054 00 1A            [ 2]    1     addw sp,#VSIZE 
      009056 72               [ 4] 2883 	ret
                                   2884 
                                   2885 ;----------------------------------
                                   2886 ;  euclidian divide n2/n1 
                                   2887 ; input:
                                   2888 ;    N2 	on cstack
                                   2889 ;    N1 	on cstack
                                   2890 ; output:
                                   2891 ;    X      n2/n1 
                                   2892 ;    Y      remainder 
                                   2893 ;----------------------------------
      0010D9                       2894 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      0010D9                       2895 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0010D9                       2896 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2897 	; local variables
                           000001  2898 	SQUOT=1 ; sign quotient
                           000002  2899 	SDIVD=2 ; sign dividend  
                           000002  2900 	VSIZE=2
      0010D9                       2901 divide:
      0010D9                       2902 	_vars VSIZE 
      009057 5A 00            [ 2]    1     sub sp,#VSIZE 
      009059 1B 72            [ 1] 2903 	clr (SQUOT,sp)
      00905B 5A 00            [ 1] 2904 	clr (SDIVD,sp)
                                   2905 ; check for 0 divisor
      00905D 1B 72            [ 2] 2906 	ldw x,(DIVISR,sp)
      00905F CF               [ 2] 2907 	tnzw x 
      009060 00 1A            [ 1] 2908     jrne 0$
      009062 81 04            [ 1] 2909 	ld a,#ERR_DIV0 
      009063 CC 07 16         [ 2] 2910 	jp tb_error 
                                   2911 ; check divisor sign 	
      009063 72               [ 1] 2912 0$:	ld a,xh 
      009064 CE 00            [ 1] 2913 	bcp a,#0x80 
      009066 1A 58            [ 1] 2914 	jreq 1$
      009068 72 BB            [ 1] 2915 	cpl (SQUOT,sp)
      00906A 00               [ 2] 2916 	negw x 
      00906B 1A FE            [ 2] 2917 1$:	ldw (DIVISR,sp),x
                                   2918 ; check dividend sign 	 
      00906D 72 CF            [ 2] 2919     ldw x,(DIVIDND,sp)
      00906F 00               [ 1] 2920 	ld a,xh 
      009070 1A 81            [ 1] 2921 	bcp a,#0x80 
      009072 27 05            [ 1] 2922 	jreq 2$ 
      009072 72 CE            [ 1] 2923 	cpl (SQUOT,sp)
      009074 00 1A            [ 1] 2924 	cpl (SDIVD,sp)
      009076 FE               [ 2] 2925 	negw x 
      009077 72 CF            [ 2] 2926 2$:	ldw y,(DIVISR,sp)
      009079 00               [ 2] 2927 	divw x,y
      00907A 1A 81 00 09      [ 2] 2928 	ldw acc16,y 
                                   2929 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      00907C 0D 02            [ 1] 2930 	tnz (SDIVD,sp)
      00907C CD 90            [ 1] 2931 	jreq 7$
      00907E 22 90            [ 2] 2932 	tnzw y 
      009080 93 CD            [ 1] 2933 	jreq 7$
      009082 90               [ 1] 2934 	incw x
      009083 22 FF            [ 2] 2935 	ldw y,(DIVISR,sp)
      009085 81 B2 00 09      [ 2] 2936 	subw y,acc16
      009086 0D 01            [ 1] 2937 7$: tnz (SQUOT,sp)
      009086 90 89            [ 1] 2938 	jreq 9$ 	 
      009088 90               [ 2] 2939 8$:	negw x 
      00111A                       2940 9$: 
      00111A                       2941 	_drop VSIZE 
      009089 CE 00            [ 2]    1     addw sp,#VSIZE 
      00908B 1A               [ 4] 2942 	ret 
                                   2943 
                                   2944 
                                   2945 ;----------------------------------
                                   2946 ;  remainder resulting from euclidian 
                                   2947 ;  division of n2/n1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



                                   2948 ; input:
                                   2949 ;   N1 		cstack 
                                   2950 ;   N2      cstack
                                   2951 ; output:
                                   2952 ;   X       N2%N1 
                                   2953 ;----------------------------------
                           000003  2954 	N1=3
                           000005  2955 	N2=5
                           000004  2956 	VSIZE=4
      00111D                       2957 modulo:
      00908C 58 89            [ 2] 2958 	Ldw x,(N1,sp)
      00908E 72 F9            [ 2] 2959 	ldw y,(N2,sp)
      001121                       2960 	_vars VSIZE 
      009090 01 90            [ 2]    1     sub sp,#VSIZE 
      009092 CF 00            [ 2] 2961 	ldw (1,sp),x 
      009094 1A 85            [ 2] 2962 	ldw (3,sp),y 
      009096 90 85 81         [ 4] 2963 	call divide 
      009099 0A               [ 1] 2964 	ldw x,y
      00112B                       2965 	_drop VSIZE 
      00909A 64 73            [ 2]    1     addw sp,#VSIZE 
      00909C 74               [ 4] 2966 	ret 
                                   2967 
                                   2968 
                                   2969 ;----------------------------------
                                   2970 ; search in kword_dict command name
                                   2971 ;  from its execution address 
                                   2972 ; input:
                                   2973 ;   X       	execution address 
                                   2974 ; output:
                                   2975 ;   X 			cstr*  | 0 
                                   2976 ;--------------------------------
                           000001  2977 	XADR=1 
                           000003  2978 	LINK=3 
                           000004  2979 	VSIZE=4
      00112E                       2980 cmd_name:
      00112E                       2981 	_vars VSIZE 
      00909D 61 63            [ 2]    1     sub sp,#VSIZE 
      00909F 6B 3A 20 00      [ 1] 2982 	clr acc16 
      0090A3 1F 01            [ 2] 2983 	ldw (XADR,sp),x  
      0090A3 52 02 AE         [ 2] 2984 	ldw x,#kword_dict	
      0090A6 90 99            [ 2] 2985 1$:	ldw (LINK,sp),x
      0090A8 CD 82            [ 1] 2986 	ld a,(2,x)
      0090AA 30 AE            [ 1] 2987 	and a,#15 
      0090AC 17 7E 35         [ 1] 2988 	ld acc8,a 
      0090AF 0A 00 08         [ 2] 2989 	addw x,#3
      0090B2 C3 00 1A 25      [ 2] 2990 	addw x,acc16
      0090B6 0D               [ 2] 2991 	ldw x,(x) ; execution address 
      0090B7 1F 01            [ 2] 2992 	cpw x,(XADR,sp)
      0090B9 FE CD            [ 1] 2993 	jreq 2$
      0090BB 8A 19            [ 2] 2994 	ldw x,(LINK,sp)
      0090BD 1E               [ 2] 2995 	ldw x,(x) 
      0090BE 01 1D 00         [ 2] 2996 	subw x,#2  
      0090C1 02 20            [ 1] 2997 	jrne 1$
      0090C3 EE A6            [ 2] 2998 	jra 9$
      0090C5 0D CD            [ 2] 2999 2$: ldw x,(LINK,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0090C7 82 1E 5B         [ 2] 3000 	addw x,#2 	
      00115D                       3001 9$:	_drop VSIZE
      0090CA 02 4F            [ 2]    1     addw sp,#VSIZE 
      0090CC 81               [ 4] 3002 	ret
                                   3003 
                                   3004 
                                   3005 ;---------------------------------
                                   3006 ; input:
                                   3007 ;	X 		dictionary entry point 
                                   3008 ;  pad		.asciz name to search 
                                   3009 ; output:
                                   3010 ;  A 		TK_CMD|TK_FUNC|TK_NONE 
                                   3011 ;  X		execution address | 0 
                                   3012 ;---------------------------------
                           000001  3013 	NLEN=1 ; cmd length 
                           000002  3014 	YSAVE=2
                           000003  3015 	VSIZE=3 
      001160                       3016 search_dict:
      001160                       3017 	_vars VSIZE 
      0090CD 0A 63            [ 2]    1     sub sp,#VSIZE 
      0090CF 74 61            [ 1] 3018 	ldw y,x 
      001164                       3019 search_next:	
      0090D1 63 6B            [ 1] 3020 	ld a,(y)
      0090D3 3A 20            [ 1] 3021 	and a,#0xf 
      0090D5 00 01            [ 1] 3022 	ld (NLEN,sp),a  
      0090D6 AE 17 18         [ 2] 3023 	ldw x,#pad 
      0090D6 52 02            [ 2] 3024 	ldw (YSAVE,sp),y
      0090D8 AE 90            [ 1] 3025 	incw y  
      001171                       3026 cp_loop:
      0090DA CD               [ 1] 3027 	ld a,(x)
      0090DB CD 82            [ 1] 3028 	jreq str_match 
      0090DD 30 96            [ 1] 3029 	tnz (NLEN,sp)
      0090DF 1C 00            [ 1] 3030 	jreq no_match  
      0090E1 07 1F            [ 1] 3031 	cp a,(y)
      0090E3 01 AE            [ 1] 3032 	jrne no_match 
      0090E5 17 FE            [ 1] 3033 	incw y 
      0090E7 35               [ 1] 3034 	incw x
      0090E8 10 00            [ 1] 3035 	dec (NLEN,sp)
      0090EA 08 EE            [ 2] 3036 	jra cp_loop 
      0090EB                       3037 no_match:
      0090EB 13 01            [ 2] 3038 	ldw y,(YSAVE,sp) 
      0090ED 2B 0B 89 FE      [ 2] 3039 	subw y,#2 ; move Y to link field
      0090F1 CD 8A            [ 1] 3040 	push #TK_NONE 
      0090F3 19 85            [ 2] 3041 	ldw y,(y) ; next word link 
      0090F5 1D               [ 1] 3042 	pop a ; TK_NONE 
      0090F6 00 02            [ 1] 3043 	jreq search_exit  ; not found  
                                   3044 ;try next 
      0090F8 20 F1            [ 2] 3045 	jra search_next
      001192                       3046 str_match:
      0090FA A6 0D            [ 2] 3047 	ldw y,(YSAVE,sp)
      0090FC CD 82            [ 1] 3048 	ld a,(y)
      0090FE 1E 5B            [ 1] 3049 	ld (NLEN,sp),a ; needed to test bit 7 
      009100 02 4F            [ 1] 3050 	and a,#0x7f 
                                   3051 ; move y to procedure address field 	
      009102 81               [ 1] 3052 	inc a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009103 C7 00 0A         [ 1] 3053 	ld acc8,a 
      009103 1E 05 72 FB      [ 1] 3054 	clr acc16 
      009107 03 1F 03 81      [ 2] 3055 	addw y,acc16 
      00910B 90 FE            [ 2] 3056 	ldw y,(y) ; routine entry point 
      00910B 1E 05            [ 1] 3057 	ld a,(NLEN,sp)
      00910D 72 F0            [ 1] 3058 	bcp a,#0x80 
      00910F 03 81            [ 1] 3059 	jreq 1$
      009111 A6 07            [ 1] 3060 	ld a,#TK_FUNC 
      009111 52 03            [ 2] 3061 	jra search_exit
      009113 0F 01            [ 1] 3062 1$: ld a,#TK_CMD 
      0011B4                       3063 search_exit: 
      009115 1E               [ 1] 3064 	ldw x,y ; x=routine address 
      0011B5                       3065 	_drop VSIZE 	 
      009116 06 9E            [ 2]    1     addw sp,#VSIZE 
      009118 A5               [ 4] 3066 	ret 
                                   3067 
                                   3068 ;---------------------
                                   3069 ; check if next token
                                   3070 ;  is of expected type 
                                   3071 ; input:
                                   3072 ;   A 		 expected token attribute
                                   3073 ;  ouput:
                                   3074 ;   none     if fail call tb_error 
                                   3075 ;--------------------
      0011B8                       3076 expect:
      009119 80               [ 1] 3077 	push a 
      00911A 27 05 03         [ 4] 3078 	call next_token 
      00911D 01 50            [ 1] 3079 	cp a,(1,sp)
      00911F 1F 06            [ 1] 3080 	jreq 1$
      009121 1E 08 9E         [ 2] 3081 	jp syntax_error
      009124 A5               [ 1] 3082 1$: pop a 
      009125 80               [ 4] 3083 	ret 
                                   3084 
                                   3085 
                                   3086 ;-------------------------------
                                   3087 ; parse embedded BASIC routines 
                                   3088 ; arguments list.
                                   3089 ; arg_list::=  rel[','rel]*
                                   3090 ; all arguments are of integer type
                                   3091 ; input:
                                   3092 ;   none
                                   3093 ; output:
                                   3094 ;   A 			number of arguments pushed on dstack  
                                   3095 ;--------------------------------
                           000001  3096 	ARG_CNT=1 
      0011C5                       3097 arg_list:
      009126 27 05            [ 1] 3098 	push #0  
      009128 03 01 50         [ 4] 3099 1$: call relation
      00912B 1F 08            [ 1] 3100 	cp a,#TK_NONE 
      00912D 7B 07            [ 1] 3101 	jreq 5$
      00912F 97 7B            [ 1] 3102 	cp a,#TK_INTGR
      009131 09 42            [ 1] 3103 	jrne 4$
      009133 1F 02 7B         [ 4] 3104 3$: call dpush 
      009136 07 97            [ 1] 3105     inc (ARG_CNT,sp)
      009138 7B 08 42         [ 4] 3106 	call next_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00913B 9F 1B            [ 1] 3107 	cp a,#TK_NONE 
      00913D 02 6B            [ 1] 3108 	jreq 5$ 
      00913F 02 7B            [ 1] 3109 	cp a,#TK_COMMA 
      009141 06 97            [ 1] 3110 	jrne 4$
      009143 7B 09            [ 2] 3111 	jra 1$ 
      009145 42 9F 1B         [ 4] 3112 4$:	call unget_token 
      009148 02               [ 1] 3113 5$:	pop a 
      009149 6B               [ 4] 3114 	ret 
                                   3115 
                                   3116 
                                   3117 
                                   3118 ;--------------------------------
                                   3119 ;   BASIC commnands 
                                   3120 ;--------------------------------
                                   3121 
                                   3122 ;--------------------------------
                                   3123 ;  arithmetic and relational 
                                   3124 ;  routines
                                   3125 ;  operators precedence
                                   3126 ;  highest to lowest
                                   3127 ;  operators on same row have 
                                   3128 ;  same precedence and are executed
                                   3129 ;  from left to right.
                                   3130 ;	'*','/','%'
                                   3131 ;   '-','+'
                                   3132 ;   '=','>','<','>=','<=','<>','><'
                                   3133 ;   '<>' and '><' are equivalent for not equal.
                                   3134 ;--------------------------------
                                   3135 
                                   3136 ;---------------------
                                   3137 ; return array element
                                   3138 ; address from @(expr)
                                   3139 ; input:
                                   3140 ;   A 		TK_ARRAY
                                   3141 ; output:
                                   3142 ;   A 		TK_INTGR
                                   3143 ;	X 		element address 
                                   3144 ;----------------------
      0011E9                       3145 get_array_element:
      00914A 02 0D 01         [ 4] 3146 	call ddrop 
      00914D 27 05            [ 1] 3147 	ld a,#TK_LPAREN 
      00914F 1E 02 50         [ 4] 3148 	call expect
      009152 1F 02 03         [ 4] 3149 	call relation 
      009154 A1 03            [ 1] 3150 	cp a,#TK_INTGR 
      009154 1E 02            [ 1] 3151 	jreq 1$
      009156 5B 03 81         [ 2] 3152 	jp syntax_error
      009159 89               [ 2] 3153 1$: pushw x 
      009159 52 02            [ 1] 3154 	ld a,#TK_RPAREN 
      00915B 0F 01 0F         [ 4] 3155 	call expect
                                   3156 	; check for bounds 
      00915E 02               [ 2] 3157 	popw x   
      00915F 1E 05 5D         [ 2] 3158 	cpw x,array_size 
      009162 26 05            [ 2] 3159 	jrule 3$
                                   3160 ; bounds {1..array_size}	
      009164 A6 04            [ 1] 3161 2$: ld a,#ERR_BAD_VALUE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009166 CC 87 96         [ 2] 3162 	jp tb_error 
      009169 9E               [ 2] 3163 3$: tnzw  x
      00916A A5 80            [ 1] 3164 	jreq 2$ 
      00916C 27               [ 2] 3165 	sllw x 
      00916D 03               [ 2] 3166 	pushw x 
      00916E 03 01 50         [ 2] 3167 	ldw x,array_addr  
      009171 1F 05 1E         [ 2] 3168 	subw x,(1,sp)
      001217                       3169 	_drop 2   
      009174 07 9E            [ 2]    1     addw sp,#2 
      009176 A5 80            [ 1] 3170 	ld a,#TK_INTGR
      009178 27               [ 4] 3171 	ret 
                                   3172 
                                   3173 ;***********************************
                                   3174 ;   expression parse,execute 
                                   3175 ;***********************************
                                   3176 ;-----------------------------------
                                   3177 ; factor ::= ['+'|'-'|e] var | @ |
                                   3178 ;			 integer | function |
                                   3179 ;			 '('relation')' 
                                   3180 ; output:
                                   3181 ;   A    token attribute 
                                   3182 ;   X 	 integer
                                   3183 ; ---------------------------------
                           000001  3184 	NEG=1
                           000001  3185 	VSIZE=1
      00121C                       3186 factor:
      00121C                       3187 	_vars VSIZE 
      009179 05 03            [ 2]    1     sub sp,#VSIZE 
      00917B 01 03 02         [ 4] 3188 	call next_token
      00917E 50 16            [ 1] 3189 	cp a,#CMD_END 
      009180 05 65            [ 1] 3190 	jrmi 20$
      009182 90 CF            [ 1] 3191 1$:	ld (NEG,sp),a 
      009184 00 0A            [ 1] 3192 	and a,#TK_GRP_MASK
      009186 0D 02            [ 1] 3193 	cp a,#TK_GRP_ADD 
      009188 27 0B            [ 1] 3194 	jreq 2$
      00918A 90 5D            [ 1] 3195 	ld a,(NEG,sp)
      00918C 27 07            [ 2] 3196 	jra 4$  
      001231                       3197 2$:	
      00918E 5C 16 05         [ 4] 3198 	call next_token 
      001234                       3199 4$:	
      009191 72 B2            [ 1] 3200 	cp a,#TK_FUNC 
      009193 00 0A            [ 1] 3201 	jrne 5$ 
      009195 0D               [ 4] 3202 	call (x) 
      009196 01 27            [ 2] 3203 	jra 18$ 
      00123B                       3204 5$:
      009198 01 50            [ 1] 3205 	cp a,#TK_INTGR
      00919A 26 02            [ 1] 3206 	jrne 6$
      00919A 5B 02            [ 2] 3207 	jra 18$
      001241                       3208 6$:
      00919C 81 05            [ 1] 3209 	cp a,#TK_ARRAY
      00919D 26 06            [ 1] 3210 	jrne 10$
      00919D 1E 03 16         [ 4] 3211 	call get_array_element
      0091A0 05               [ 2] 3212 	ldw x,(x)
      0091A1 52 04            [ 2] 3213 	jra 18$ 
      00124B                       3214 10$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0091A3 1F 01            [ 1] 3215 	cp a,#TK_VAR 
      0091A5 17 03            [ 1] 3216 	jrne 12$
      0091A7 CD               [ 2] 3217 	ldw x,(x)
      0091A8 91 59            [ 2] 3218 	jra 18$
      001252                       3219 12$:			
      0091AA 93 5B            [ 1] 3220 	cp a,#TK_LPAREN
      0091AC 04 81            [ 1] 3221 	jrne 16$
      0091AE CD 13 03         [ 4] 3222 	call relation
      0091AE 52 04            [ 1] 3223 	ld a,#TK_RPAREN 
      0091B0 72 5F 00         [ 4] 3224 	call expect
      0091B3 0A 1F            [ 2] 3225 	jra 18$	
      001260                       3226 16$:
      0091B5 01 AE A1         [ 4] 3227 	call unget_token
      0091B8 B8               [ 1] 3228 	clr a 
      0091B9 1F 03            [ 2] 3229 	jra 20$ 
      001266                       3230 18$: 
      0091BB E6 02            [ 1] 3231 	ld a,#TK_MINUS 
      0091BD A4 0F            [ 1] 3232 	cp a,(NEG,sp)
      0091BF C7 00            [ 1] 3233 	jrne 19$
      0091C1 0B               [ 2] 3234 	negw x
      00126D                       3235 19$:
      0091C2 1C 00            [ 1] 3236 	ld a,#TK_INTGR
      00126F                       3237 20$:
      00126F                       3238 	_drop VSIZE
      0091C4 03 72            [ 2]    1     addw sp,#VSIZE 
      0091C6 BB               [ 4] 3239 	ret
                                   3240 
                                   3241 ;-----------------------------------
                                   3242 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3243 ; output:
                                   3244 ;   A    	token attribute 
                                   3245 ;	X		integer
                                   3246 ;-----------------------------------
                           000001  3247 	N1=1
                           000003  3248 	N2=3
                           000005  3249 	MULOP=5
                           000005  3250 	VSIZE=5
      001272                       3251 term:
      001272                       3252 	_vars VSIZE
      0091C7 00 0A            [ 2]    1     sub sp,#VSIZE 
      0091C9 FE 13 01         [ 4] 3253 	call factor
      0091CC 27 0A            [ 1] 3254 	cp a,#CMD_END
      0091CE 1E 03            [ 1] 3255 	jrmi term_exit
      00127B                       3256 term01:	 ; check for  operator 
      0091D0 FE 1D            [ 2] 3257 	ldw (N2,sp),x  ; save first factor 
      0091D2 00 02 26         [ 4] 3258 	call next_token
      0091D5 E3 20            [ 1] 3259 	cp a,#2
      0091D7 05 1E            [ 1] 3260 	jrmi 9$
      0091D9 03 1C            [ 1] 3261 0$:	ld (MULOP,sp),a
      0091DB 00 02            [ 1] 3262 	and a,#TK_GRP_MASK
      0091DD 5B 04            [ 1] 3263 	cp a,#TK_GRP_MULT
      0091DF 81 07            [ 1] 3264 	jreq 1$
      0091E0 7B 05            [ 1] 3265 	ld a,(MULOP,sp) 
      0091E0 52 03 90         [ 4] 3266 	call unget_token 
      0091E3 93 25            [ 2] 3267 	jra 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0091E4                       3268 1$:	; got *|/|%
      0091E4 90 F6 A4         [ 4] 3269 	call factor
      0091E7 0F 6B            [ 1] 3270 	cp a,#TK_INTGR
      0091E9 01 AE            [ 1] 3271 	jreq 2$ 
      0091EB 17 18 17         [ 2] 3272 	jp syntax_error
      0091EE 02 90            [ 2] 3273 2$:	ldw (N1,sp),x  
      0091F0 5C 05            [ 1] 3274 	ld a,(MULOP,sp) 
      0091F1 A1 20            [ 1] 3275 	cp a,#TK_MULT 
      0091F1 F6 27            [ 1] 3276 	jrne 3$
      0091F3 1E 0D 01         [ 4] 3277 	call multiply 
      0091F6 27 0B            [ 2] 3278 	jra term01
      0091F8 90 F1            [ 1] 3279 3$: cp a,#TK_DIV 
      0091FA 26 07            [ 1] 3280 	jrne 4$ 
      0091FC 90 5C 5C         [ 4] 3281 	call divide 
      0091FF 0A 01            [ 2] 3282 	jra term01 
      009201 20 EE 1D         [ 4] 3283 4$: call modulo
      009203 20 C3            [ 2] 3284 	jra term01 
      009203 16 02            [ 2] 3285 9$: ldw x,(N2,sp)  
      009205 72 A2            [ 1] 3286 	ld a,#TK_INTGR 	
      0012BC                       3287 term_exit:
      0012BC                       3288 	_drop VSIZE 
      009207 00 02            [ 2]    1     addw sp,#VSIZE 
      009209 4B               [ 4] 3289 	ret 
                                   3290 
                                   3291 ;-------------------------------
                                   3292 ;  expr ::= term [['+'|'-'] term]*
                                   3293 ;  result range {-32768..32767}
                                   3294 ;  output:
                                   3295 ;   A    token attribute 
                                   3296 ;   X	 integer   
                                   3297 ;-------------------------------
                           000001  3298 	N1=1 
                           000003  3299 	N2=3
                           000005  3300 	OP=5 
                           000005  3301 	VSIZE=5 
      0012BF                       3302 expression:
      0012BF                       3303 	_vars VSIZE 
      00920A 00 90            [ 2]    1     sub sp,#VSIZE 
      00920C FE 84 27         [ 4] 3304 	call term
      00920F 24 20            [ 1] 3305 	cp a,#CMD_END 
      009211 D2 38            [ 1] 3306 	jrmi expr_exit 
      009212 1F 03            [ 2] 3307 0$:	ldw (N2,sp),x 
      009212 16 02 90         [ 4] 3308 	call next_token
      009215 F6 6B            [ 1] 3309 	cp a,#2
      009217 01 A4            [ 1] 3310 	jrmi 9$ 
      009219 7F 4C            [ 1] 3311 1$:	ld (OP,sp),a  
      00921B C7 00            [ 1] 3312 	and a,#TK_GRP_MASK
      00921D 0B 72            [ 1] 3313 	cp a,#TK_GRP_ADD 
      00921F 5F 00            [ 1] 3314 	jreq 2$ 
      009221 0A 72            [ 1] 3315 	ld a,(OP,sp)
      009223 B9 00 0A         [ 4] 3316 	call unget_token
      009226 90 FE            [ 2] 3317 	jra 9$
      0012E0                       3318 2$: 
      009228 7B 01 A5         [ 4] 3319 	call term
      00922B 80 27            [ 1] 3320 	cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00922D 04 A6            [ 1] 3321 	jreq 3$
      00922F 07 20 02         [ 2] 3322 	jp syntax_error
      009232 A6 06            [ 2] 3323 3$:	ldw (N1,sp),x 
      009234 7B 05            [ 1] 3324 	ld a,(OP,sp)
      009234 93 5B            [ 1] 3325 	cp a,#TK_PLUS 
      009236 03 81            [ 1] 3326 	jrne 4$
      009238 CD 10 83         [ 4] 3327 	call add 
      009238 88 CD            [ 2] 3328 	jra 0$ 
      00923A 88 7A 11         [ 4] 3329 4$:	call substract
      00923D 01 27            [ 2] 3330 	jra 0$
      00923F 03 CC            [ 2] 3331 9$: ldw x,(N2,sp)
      009241 87 94            [ 1] 3332 	ld a,#TK_INTGR	
      001300                       3333 expr_exit:
      001300                       3334 	_drop VSIZE 
      009243 84 81            [ 2]    1     addw sp,#VSIZE 
      009245 81               [ 4] 3335 	ret 
                                   3336 
                                   3337 ;---------------------------------------------
                                   3338 ; rel ::= expr rel_op expr
                                   3339 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3340 ;  relation return 1 | 0  for true | false 
                                   3341 ;  output:
                                   3342 ;    A 		token attribute  
                                   3343 ;	 X		1|0
                                   3344 ;---------------------------------------------
                           000001  3345 	N1=1
                           000003  3346 	N2=3
                           000005  3347 	RELOP=5
                           000005  3348 	VSIZE=5 
      001303                       3349 relation: 
      001303                       3350 	_vars VSIZE
      009245 4B 00            [ 2]    1     sub sp,#VSIZE 
      009247 CD 93 83         [ 4] 3351 	call expression
      00924A A1 00            [ 1] 3352 	cp a,#CMD_END  
      00924C 27 19            [ 1] 3353 	jrmi rel_exit 
                                   3354 	; expect rel_op or leave 
      00924E A1 03            [ 2] 3355 	ldw (N2,sp),x 
      009250 26 12 CD         [ 4] 3356 	call next_token 
      009253 90 15            [ 1] 3357 	cp a,#2
      009255 0C 01            [ 1] 3358 	jrmi 9$
      001315                       3359 1$:	
      009257 CD 88            [ 1] 3360 	ld (RELOP,sp),a 
      009259 7A A1            [ 1] 3361 	and a,#TK_GRP_MASK
      00925B 00 27            [ 1] 3362 	cp a,#TK_GRP_RELOP 
      00925D 09 A1            [ 1] 3363 	jreq 2$
      00925F 0B 26            [ 1] 3364 	ld a,(RELOP,sp)
      009261 02 20 E3         [ 4] 3365 	call unget_token  
      009264 CD 90            [ 2] 3366 	jra 9$
      001324                       3367 2$:	; expect another expression or error 
      009266 0E 84 81         [ 4] 3368 	call expression
      009269 A1 03            [ 1] 3369 	cp a,#TK_INTGR 
      009269 CD 90            [ 1] 3370 	jreq 3$
      00926B 49 A6 09         [ 2] 3371 	jp syntax_error 
      00926E CD 92            [ 2] 3372 3$:	ldw (N1,sp),x 
      009270 38 CD 93         [ 4] 3373 	call substract
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009273 83 A1            [ 1] 3374 	jrne 4$
      009275 03 27 03 CC      [ 1] 3375 	mov acc8,#2 ; n1==n2
      009279 87 94            [ 2] 3376 	jra 6$ 
      00133B                       3377 4$: 
      00927B 89 A6            [ 1] 3378 	jrsgt 5$  
      00927D 0A CD 92 38      [ 1] 3379 	mov acc8,#4 ; n1<2 
      009281 85 C3            [ 2] 3380 	jra 6$
      001343                       3381 5$:
      009283 00 23 23 05      [ 1] 3382 	mov acc8,#1 ; n1>n2 
      001347                       3383 6$:
      009287 A6               [ 1] 3384 	clrw x 
      009288 0A CC 87         [ 1] 3385 	ld a, acc8  
      00928B 96 5D            [ 1] 3386 	and a,(RELOP,sp)
      00928D 27               [ 1] 3387 	tnz a 
      00928E F8 58            [ 1] 3388 	jreq 10$
      009290 89               [ 1] 3389 	incw x 
      001351                       3390 7$:	 
      009291 CE 00            [ 2] 3391 	jra 10$  	
      009293 21 72            [ 2] 3392 9$: ldw x,(N2,sp)
      001355                       3393 10$:
      009295 F0 01            [ 1] 3394 	ld a,#TK_INTGR
      001357                       3395 rel_exit: 	 
      001357                       3396 	_drop VSIZE
      009297 5B 02            [ 2]    1     addw sp,#VSIZE 
      009299 A6               [ 4] 3397 	ret 
                                   3398 
                                   3399 ;--------------------------------
                                   3400 ; BASIC: SHOW 
                                   3401 ;  show content of dstack,cstack
                                   3402 ;--------------------------------
      00135A                       3403 show:
      00929A 03 81 07         [ 1] 3404 	ld a,base 
      00929C 88               [ 1] 3405 	push a 
      00929C 52 01 CD         [ 4] 3406 	call dots
      00929F 88 7A A1         [ 4] 3407 	call dotr 
      0092A2 02               [ 1] 3408 	pop a 
      0092A3 2B 4A 6B         [ 1] 3409 	ld base,a 
      0092A6 01               [ 1] 3410 	clr a 
      0092A7 A4               [ 4] 3411 	ret
                                   3412 
                                   3413 ;--------------------------------------------
                                   3414 ; BASIC: HEX 
                                   3415 ; select hexadecimal base for integer print
                                   3416 ;---------------------------------------------
      00136A                       3417 hex_base:
      0092A8 30 A1 10 27      [ 1] 3418 	mov base,#16 
      0092AC 04               [ 4] 3419 	ret 
                                   3420 
                                   3421 ;--------------------------------------------
                                   3422 ; BASIC: DEC 
                                   3423 ; select decimal base for integer print
                                   3424 ;---------------------------------------------
      00136F                       3425 dec_base:
      0092AD 7B 01 20 03      [ 1] 3426 	mov base,#10
      0092B1 81               [ 4] 3427 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



                                   3428 
                                   3429 ;------------------------
                                   3430 ; BASIC: SIZE 
                                   3431 ; return free size in text area
                                   3432 ; output:
                                   3433 ;   A 		TK_INTGR
                                   3434 ;   X 	    size integer
                                   3435 ;--------------------------
      001374                       3436 size:
      0092B1 CD 88 7A         [ 2] 3437 	ldw x,#tib 
      0092B4 72 B0 00 1D      [ 2] 3438 	subw x,txtend 
      0092B4 A1 07            [ 1] 3439 	ld a,#TK_INTGR
      0092B6 26               [ 4] 3440 	ret 
                                   3441 
                                   3442 
                                   3443 ;------------------------
                                   3444 ; BASIC: UBOUND  
                                   3445 ; return array variable size 
                                   3446 ; output:
                                   3447 ;   A 		TK_INTGR
                                   3448 ;   X 	    array size 
                                   3449 ;--------------------------
      00137E                       3450 ubound:
      0092B7 03 FD 20         [ 2] 3451 	ldw x,#tib
      0092BA 2B B0 00 1D      [ 2] 3452 	subw x,txtend 
      0092BB 54               [ 2] 3453 	srlw x 
      0092BB A1 03 26         [ 2] 3454 	ldw array_size,x
      0092BE 02 20            [ 1] 3455 	ld a,#TK_INTGR
      0092C0 25               [ 4] 3456 	ret 
                                   3457 
                                   3458 ;-----------------------------
                                   3459 ; BASIC: LET var=expr 
                                   3460 ; variable assignement 
                                   3461 ; output:
                                   3462 ;   A 		TK_NONE 
                                   3463 ;-----------------------------
      0092C1                       3464 let:
      0092C1 A1 05 26         [ 4] 3465 	call next_token 
      0092C4 06 CD            [ 1] 3466 	cp a,#TK_VAR 
      0092C6 92 69            [ 1] 3467 	jreq let02
      0092C8 FE 20 1B         [ 2] 3468 	jp syntax_error
      0092CB                       3469 let02:
      0092CB A1 04 26         [ 4] 3470 	call dpush 
      0092CE 03 FE 20         [ 4] 3471 	call next_token 
      0092D1 14 32            [ 1] 3472 	cp a,#TK_EQUAL
      0092D2 27 03            [ 1] 3473 	jreq 1$
      0092D2 A1 09 26         [ 2] 3474 	jp syntax_error
      0013A3                       3475 1$:	
      0092D5 0A CD 93         [ 4] 3476 	call relation   
      0092D8 83 A6            [ 1] 3477 	cp a,#TK_INTGR 
      0092DA 0A CD            [ 1] 3478 	jreq 2$
      0092DC 92 38 20         [ 2] 3479 	jp syntax_error
      0013AD                       3480 2$:	
      0092DF 06 93            [ 1] 3481 	ldw y,x 
      0092E0 CD 0F A2         [ 4] 3482 	call dpop  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      0092E0 CD               [ 2] 3483 	ldw (x),y   
      0092E1 90               [ 4] 3484 	ret 
                                   3485 
                                   3486 ;----------------------------
                                   3487 ; BASIC: LIST [[start][,end]]
                                   3488 ; list program lines 
                                   3489 ; form start to end 
                                   3490 ; if empty argument list then 
                                   3491 ; list all.
                                   3492 ;----------------------------
                           000001  3493 	FIRST=1
                           000003  3494 	LAST=3 
                           000005  3495 	LN_PTR=5
                           000006  3496 	VSIZE=6 
      0013B4                       3497 list:
      0013B4                       3498 	_vars VSIZE
      0092E2 0E 4F            [ 2]    1     sub sp,#VSIZE 
      0092E4 20 09 1B         [ 2] 3499 	ldw x,txtbgn 
      0092E6 C3 00 1D         [ 2] 3500 	cpw x,txtend 
      0092E6 A6 11            [ 1] 3501 	jrmi 1$
      0092E8 11 01 26         [ 2] 3502 	jp list_exit ; nothing to list 
      0092EB 01 50            [ 2] 3503 1$:	ldw (LN_PTR,sp),x 
      0092ED FE               [ 2] 3504 	ldw x,(x) 
      0092ED A6 03            [ 2] 3505 	ldw (FIRST,sp),x ; list from first line 
      0092EF AE 7F FF         [ 2] 3506 	ldw x,#0x7fff ; biggest line number 
      0092EF 5B 01            [ 2] 3507 	ldw (LAST,sp),x 
      0092F1 81 11 C5         [ 4] 3508 	call arg_list
      0092F2 4D               [ 1] 3509 	tnz a
      0092F2 52 05            [ 1] 3510 	jreq list_start 
      0092F4 CD 92            [ 1] 3511 	cp a,#2 
      0092F6 9C A1            [ 1] 3512 	jreq 4$
      0092F8 02 2B            [ 1] 3513 	cp a,#1 
      0092FA 41 06            [ 1] 3514 	jreq first_line 
      0092FB CC 07 14         [ 2] 3515 	jp syntax_error 
      0092FB 1F 03 CD         [ 4] 3516 4$:	call dswap
      0013DF                       3517 first_line:
      0092FE 88 7A A1         [ 4] 3518 	call dpop 
      009301 02 2B            [ 2] 3519 	ldw (FIRST,sp),x 
      009303 34 6B            [ 1] 3520 	cp a,#1 
      009305 05 A4            [ 1] 3521 	jreq lines_skip 	
      0013E8                       3522 last_line:
      009307 30 A1 20         [ 4] 3523 	call dpop 
      00930A 27 07            [ 2] 3524 	ldw (LAST,sp),x 
      0013ED                       3525 lines_skip:
      00930C 7B 05 CD         [ 2] 3526 	ldw x,txtbgn
      00930F 90 0E            [ 2] 3527 2$:	ldw (LN_PTR,sp),x 
      009311 20 25 1D         [ 2] 3528 	cpw x,txtend 
      009313 2A 3D            [ 1] 3529 	jrpl list_exit 
      009313 CD               [ 2] 3530 	ldw x,(x) ;lineno 
      009314 92 9C            [ 2] 3531 	cpw x,(FIRST,sp)
      009316 A1 03            [ 1] 3532 	jrpl list_start 
      009318 27 03            [ 2] 3533 	ldw x,(LN_PTR,sp) 
      00931A CC 87 94         [ 2] 3534 	addw x,#2 
      00931D 1F               [ 1] 3535 	ld a,(x)
      00931E 01               [ 1] 3536 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00931F 7B 05 A1         [ 1] 3537 	ld acc8,a 
      009322 20 26 05 CD      [ 1] 3538 	clr acc16 
      009326 91 11 20 D1      [ 2] 3539 	addw x,acc16
      00932A A1 21            [ 2] 3540 	jra 2$ 
                                   3541 ; print loop
      001410                       3542 list_start:
      00932C 26 05            [ 2] 3543 	ldw x,(LN_PTR,sp)
      001412                       3544 3$:	
      00932E CD 91 59         [ 4] 3545 	call prt_basic_line
      009331 20 C8            [ 2] 3546 	ldw x,(LN_PTR,sp)
      009333 CD 91            [ 1] 3547 	ld a,(2,x)
      009335 9D 20 C3         [ 1] 3548 	ld acc8,a 
      009338 1E 03 A6 03      [ 1] 3549 	clr acc16 
      00933C 72 BB 00 09      [ 2] 3550 	addw x,acc16
      00933C 5B 05 81         [ 2] 3551 	cpw x,txtend 
      00933F 2A 0B            [ 1] 3552 	jrpl list_exit
      00933F 52 05            [ 2] 3553 	ldw (LN_PTR,sp),x
      009341 CD               [ 2] 3554 	ldw x,(x)
      009342 92 F2            [ 2] 3555 	cpw x,(LAST,sp)  
      009344 A1 02            [ 1] 3556 	jrsgt list_exit 
      009346 2B 38            [ 2] 3557 	ldw x,(LN_PTR,sp)
      009348 1F 03            [ 2] 3558 	jra 3$
      001434                       3559 list_exit:
      001434                       3560 	_drop VSIZE 
      00934A CD 88            [ 2]    1     addw sp,#VSIZE 
      00934C 7A               [ 4] 3561 	ret
                                   3562 
                                   3563 ;-------------------------
                                   3564 ; print counted string 
                                   3565 ; input:
                                   3566 ;   X 		address of string
                                   3567 ;--------------------------
      001437                       3568 prt_cmd_name:
      00934D A1               [ 1] 3569 	ld a,(x)
      00934E 02               [ 1] 3570 	incw x
      00934F 2B 2B            [ 1] 3571 	and a,#15  
      009351 6B               [ 1] 3572 	push a 
      009352 05 A4            [ 1] 3573 1$: tnz (1,sp) 
      009354 30 A1            [ 1] 3574 	jreq 9$
      009356 10               [ 1] 3575 	ld a,(x)
      009357 27 07 7B         [ 4] 3576 	call putc 
      00935A 05               [ 1] 3577 	incw x
      00935B CD 90            [ 1] 3578 	dec (1,sp)	 
      00935D 0E 20            [ 2] 3579 	jra 1$
      00935F 1C               [ 1] 3580 9$: pop a 
      009360 81               [ 4] 3581 	ret	
                                   3582 
                                   3583 ;--------------------------
                                   3584 ; print TK_QSTR
                                   3585 ; converting control character
                                   3586 ; to backslash sequence
                                   3587 ; input:
                                   3588 ;   X        char *
                                   3589 ;-----------------------------
      00144B                       3590 prt_quote:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      009360 CD 92            [ 1] 3591 	ld a,#'"
      009362 F2 A1 03         [ 4] 3592 	call putc 
      009365 27               [ 1] 3593 1$:	ld a,(x)
      009366 03 CC            [ 1] 3594 	jreq 9$
      009368 87               [ 1] 3595 	incw x 
      009369 94 1F            [ 1] 3596 	cp a,#SPACE 
      00936B 01 7B            [ 1] 3597 	jrult 3$
      00936D 05 A1 10         [ 4] 3598 	call putc
      009370 26 05            [ 1] 3599 	cp a,#'\ 
      009372 CD 91            [ 1] 3600 	jrne 1$ 
      00145F                       3601 2$:
      009374 03 20 D1         [ 4] 3602 	call putc 
      009377 CD 91            [ 2] 3603 	jra 1$
      009379 0B               [ 1] 3604 3$: push a 
      00937A 20 CC            [ 1] 3605 	ld a,#'\
      00937C 1E 03 A6         [ 4] 3606 	call putc 
      00937F 03               [ 1] 3607 	pop a 
      009380 A0 07            [ 1] 3608 	sub a,#7
      009380 5B 05 81         [ 1] 3609 	ld acc8,a 
      009383 72 5F 00 09      [ 1] 3610 	clr acc16
      009383 52 05 CD 93      [ 2] 3611 	ldw y,#escaped 
      009387 3F A1 02 2B      [ 2] 3612 	addw y,acc16 
      00938B 4B 1F            [ 1] 3613 	ld a,(y)
      00938D 03 CD            [ 2] 3614 	jra 2$
      00938F 88 7A            [ 1] 3615 9$: ld a,#'"
      009391 A1 02 2B         [ 4] 3616 	call putc 
      009394 3E               [ 1] 3617 	incw x 
      009395 81               [ 4] 3618 	ret
                                   3619 
                                   3620 
                                   3621 ;--------------------------
                                   3622 ; decompile line from token list 
                                   3623 ; input:
                                   3624 ;   X 		pointer at line
                                   3625 ; output:
                                   3626 ;   none 
                                   3627 ;--------------------------	
                           000001  3628 	BASE_SAV=1
                           000002  3629 	WIDTH_SAV=2
                           000003  3630 	XSAVE=3
                           000005  3631 	LLEN=5
                           000005  3632 	VSIZE=5 
      001487                       3633 prt_basic_line:
      001487                       3634 	_vars VSIZE 
      009395 6B 05            [ 2]    1     sub sp,#VSIZE 
      009397 A4 30 A1         [ 1] 3635 	ld a,base
      00939A 30 27            [ 1] 3636 	ld (BASE_SAV,sp),a  
      00939C 07 7B 05         [ 1] 3637 	ld a,tab_width 
      00939F CD 90            [ 1] 3638 	ld (WIDTH_SAV,sp),a 
      0093A1 0E 20 2F         [ 2] 3639 	ldw ptr16,x
      0093A4 FE               [ 2] 3640 	ldw x,(x)
      0093A4 CD 93 3F A1      [ 1] 3641 	mov base,#10
      0093A8 03 27 03 CC      [ 1] 3642 	mov tab_width,#5
      0093AC 87 94 1F         [ 4] 3643 	call print_int ; print line number 
      0093AF 01 CD            [ 1] 3644 	ld a,#SPACE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0093B1 91 0B 26         [ 4] 3645 	call putc 
      0093B4 06 35 02 00      [ 1] 3646 	clr tab_width
      0093B8 0B 20 0C         [ 2] 3647 	ldw x,#2
      0093BB 72 D6 00 14      [ 4] 3648 	ld a,([ptr16],x)
      0093BB 2C 06            [ 1] 3649 	ld (LLEN,sp),a 
      0093BD 35               [ 1] 3650 	incw x
      0093BE 04               [ 1] 3651 1$:	ld a,xl 
      0093BF 00 0B            [ 1] 3652 	cp a,(LLEN,sp)
      0093C1 20 04            [ 1] 3653 	jrmi 19$
      0093C3 CC 15 C4         [ 2] 3654 	jp 90$
      0014BD                       3655 19$:	 
      0093C3 35 01 00 0B      [ 4] 3656 	ld a,([ptr16],x)
      0093C7 5C               [ 1] 3657 	incw x 
      0093C7 5F C6            [ 2] 3658 	ldw (XSAVE,sp),x 
      0093C9 00 0B            [ 1] 3659 	cp a,#TK_CMD 
      0093CB 14 05            [ 1] 3660 	jreq 2$
      0093CD 4D 27            [ 1] 3661 	cp a,#TK_FUNC 
      0093CF 05 5C            [ 1] 3662 	jrne 4$
      0093D1                       3663 2$:	
      0093D1 20 02 1E 03      [ 5] 3664 	ldw x,([ptr16],x)
      0093D5 A3 17 06         [ 2] 3665 	cpw x,#rem 
      0093D5 A6 03            [ 1] 3666 	jrne 3$
      0093D7 A6 27            [ 1] 3667 	ld a,#''
      0093D7 5B 05 81         [ 4] 3668 	call putc 
      0093DA 1E 03            [ 2] 3669 	ldw x,(XSAVE,sp)
      0093DA C6 00 08         [ 2] 3670 	addw x,#2
      0093DD 88 CD 90 A3      [ 2] 3671 	addw x,ptr16  
      0093E1 CD 90 D6         [ 4] 3672 	call puts 
      0093E4 84 C7 00         [ 2] 3673 	jp 90$ 
      0093E7 08 4F 81         [ 4] 3674 3$:	call cmd_name
      0093EA CD 14 37         [ 4] 3675 	call prt_cmd_name
      0093EA 35 10            [ 1] 3676 	ld a,#SPACE 
      0093EC 00 08 81         [ 4] 3677 	call putc 
      0093EF 1E 03            [ 2] 3678 	ldw x,(XSAVE,sp)
      0093EF 35 0A 00         [ 2] 3679 	addw x,#2
      0093F2 08 81            [ 2] 3680 	jra 1$
      0093F4 A1 08            [ 1] 3681 4$: cp a,#TK_QSTR 
      0093F4 AE 16            [ 1] 3682 	jrne 5$
      0093F6 C8 72 B0 00      [ 2] 3683 	addw x,ptr16
      0093FA 1E A6 03         [ 4] 3684 	call prt_quote 
      0093FD 81 B0 00 14      [ 2] 3685 	subw x,ptr16  
      0093FE 20 A9            [ 2] 3686 	jra 1$
      0093FE AE 16            [ 1] 3687 5$:	cp a,#TK_VAR
      009400 C8 72            [ 1] 3688 	jrne 6$ 
      009402 B0 00 1E 54      [ 5] 3689 	ldw x,([ptr16],x)
      009406 CF 00 23         [ 2] 3690 	subw x,#vars 
      009409 A6               [ 1] 3691 	ld a,xl
      00940A 03               [ 1] 3692 	srl a 
      00940B 81 41            [ 1] 3693 	add a,#'A 
      00940C CD 01 9E         [ 4] 3694 	call putc 
      00940C CD 88            [ 1] 3695 	ld a,#SPACE 
      00940E 7A A1 04         [ 4] 3696 	call putc 
      009411 27 03            [ 2] 3697 	ldw x,(XSAVE,sp)
      009413 CC 87 94         [ 2] 3698 	addw x,#2 
      009416 20 8B            [ 2] 3699 	jra 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009416 CD 90            [ 1] 3700 6$: cp a,#TK_ARRAY 
      009418 15 CD            [ 1] 3701 	jrne 7$
      00941A 88 7A            [ 1] 3702 	ld a,#'@ 
      00941C A1 32 27         [ 4] 3703 	call putc 
      00941F 03 CC            [ 2] 3704 	ldw x,(XSAVE,sp)
      009421 87 94 B5         [ 2] 3705 	jp 1$ 
      009423 A1 03            [ 1] 3706 7$: cp a,#TK_INTGR 
      009423 CD 93            [ 1] 3707 	jrne 8$
      009425 83 A1 03 27      [ 5] 3708 	ldw x,([ptr16],x)
      009429 03 CC 87         [ 4] 3709 	call print_int
      00942C 94 20            [ 1] 3710 	ld a,#SPACE 
      00942D CD 01 9E         [ 4] 3711 	call putc 
      00942D 90 93            [ 2] 3712 	ldw x,(XSAVE,sp)
      00942F CD 90 22         [ 2] 3713 	addw x,#2 
      009432 FF 81 B5         [ 2] 3714 	jp 1$
      009434 A1 31            [ 1] 3715 8$: cp a,#TK_GT 
      009434 52 06            [ 1] 3716 	jrmi 9$
      009436 CE 00            [ 1] 3717 	cp a,#TK_NE 
      009438 1C C3            [ 1] 3718 	jrugt 9$
      00943A 00 1E            [ 1] 3719 	sub a,#TK_GT  
      00943C 2B               [ 1] 3720 	sll a 
      00943D 03 CC            [ 1] 3721 	clrw y 
      00943F 94 B4            [ 1] 3722 	ld yl,a 
      009441 1F 05 FE 1F      [ 2] 3723 	addw y,#relop_str 
      009445 01 AE            [ 2] 3724 	ldw y,(y)
      009447 7F               [ 1] 3725 	ldw x,y 
      009448 FF 1F 03         [ 4] 3726 	call puts 
      00944B CD 92            [ 2] 3727 	ldw x,(XSAVE,sp)
      00944D 45 4D 27         [ 2] 3728 	jp 1$
      009450 3F A1            [ 1] 3729 9$: cp a,#TK_PLUS 
      009452 02 27            [ 1] 3730 	jrne 10$
      009454 07 A1            [ 1] 3731 	ld a,#'+
      009456 01 27            [ 2] 3732 	jra 80$ 
      009458 06 CC            [ 1] 3733 10$: cp a,#TK_MINUS
      00945A 87 94            [ 1] 3734 	jrne 11$
      00945C CD 90            [ 1] 3735 	ld a,#'-
      00945E 2F 3E            [ 2] 3736 	jra 80$
      00945F A1 20            [ 1] 3737 11$: cp a,#TK_MULT 
      00945F CD 90            [ 1] 3738 	jrmi 12$
      009461 22 1F            [ 1] 3739 	cp a,#TK_MOD 
      009463 01 A1            [ 1] 3740 	jrugt 12$
      009465 01 27            [ 1] 3741 	sub a,#0x20
      009467 05               [ 1] 3742 	clrw x 
      009468 97               [ 1] 3743 	ld xl,a 
      009468 CD 90 22         [ 2] 3744 	addw x,#mul_char 
      00946B 1F               [ 1] 3745 	ld a,(x)
      00946C 03 2C            [ 2] 3746 	jra 80$ 
      00946D A1 09            [ 1] 3747 12$: cp a,#TK_LPAREN 
      00946D CE 00            [ 1] 3748 	jrmi 13$
      00946F 1C 1F            [ 1] 3749 	cp a,#TK_SHARP 
      009471 05 C3            [ 1] 3750 	jrugt 13$
      009473 00 1E            [ 1] 3751 	sub a,#TK_LPAREN
      009475 2A               [ 1] 3752 	clrw x 
      009476 3D               [ 1] 3753 	ld xl,a 
      009477 FE 13 01         [ 2] 3754 	addw x,#single_char 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00947A 2A               [ 1] 3755 	ld a,(x)
      00947B 14 1E            [ 2] 3756 	jra 80$
      00947D 05 1C            [ 1] 3757 13$: cp a,#TK_CHAR 
      00947F 00 02            [ 1] 3758 	jrne 14$
      009481 F6 5C            [ 1] 3759 	ld a,#'\
      009483 C7 00 0B         [ 4] 3760 	call putc 
      009486 72 5F            [ 2] 3761 	ldw x,(XSAVE,sp)
      009488 00 0A 72 BB      [ 4] 3762 	ld a,([ptr16],x)
      00948C 00               [ 1] 3763 	incw x 
      00948D 0A 20            [ 2] 3764 	ldw (XSAVE,sp),x 
      00948F E0 01 9E         [ 4] 3765 	call putc 
      009490 CC 14 B5         [ 2] 3766 	jp 1$ 
      009490 1E 05            [ 1] 3767 14$: ld a,#':
      009492 CD 01 9E         [ 4] 3768 80$: call putc 
      009492 CD 95            [ 2] 3769 	ldw x,(XSAVE,sp)
      009494 07 1E 05         [ 2] 3770 	jp 1$ 
      0015C4                       3771 90$: 
      009497 E6 02            [ 1] 3772 	ld a,#CR 
      009499 C7 00 0B         [ 4] 3773 	call putc
      00949C 72 5F            [ 1] 3774 	ld a,(WIDTH_SAV,sp) 
      00949E 00 0A 72         [ 1] 3775 	ld tab_width,a 
      0094A1 BB 00            [ 1] 3776 	ld a,(BASE_SAV,sp) 
      0094A3 0A C3 00         [ 1] 3777 	ld base,a
      0015D3                       3778 	_drop VSIZE 
      0094A6 1E 2A            [ 2]    1     addw sp,#VSIZE 
      0094A8 0B               [ 4] 3779 	ret 	
      0094A9 1F 05 FE 13           3780 single_char: .byte '(',')',',','#'
      0094AD 03 2C 04              3781 mul_char: .byte '*','/','%'
      0094B0 1E 05 20 DE 15 ED 15  3782 relop_str: .word gt,equal,ge,lt,le,ne 
             F0 15 F2 15 F5
      0094B4 3E 00                 3783 gt: .asciz ">"
      0094B4 5B 06                 3784 equal: .asciz "="
      0094B6 81 3D 00              3785 ge: .asciz ">="
      0094B7 3C 00                 3786 lt: .asciz "<"
      0094B7 F6 5C A4              3787 le: .asciz "<="
      0094BA 0F 88 0D              3788 ne:  .asciz "<>"
                                   3789 
                                   3790 
                                   3791 ;---------------------------------
                                   3792 ; BASIC: PRINT|? arg_list 
                                   3793 ; print values from argument list
                                   3794 ;----------------------------------
                           000001  3795 	COMMA=1
                           000001  3796 	VSIZE=1
      0015F8                       3797 print:
      0094BD 01 27            [ 1] 3798 push #0 ; local variable COMMA 
      0015FA                       3799 reset_comma:
      0094BF 09 F6            [ 1] 3800 	clr (COMMA,sp)
      0015FC                       3801 prt_loop:
      0094C1 CD 82 1E         [ 4] 3802 	call relation 
      0094C4 5C 0A            [ 1] 3803 	cp a,#TK_COLON 
      0094C6 01 20            [ 1] 3804 	jreq print_exit   
      0094C8 F3 84            [ 1] 3805 	cp a,#TK_INTGR 
      0094CA 81 05            [ 1] 3806 	jrne 0$ 
      0094CB CD 09 99         [ 4] 3807 	call print_int 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0094CB A6 22            [ 2] 3808 	jra reset_comma
      00160C                       3809 0$: 	
      0094CD CD 82 1E         [ 4] 3810 	call next_token
      0094D0 F6 27            [ 1] 3811 	cp a,#TK_NONE 
      0094D2 2D 5C            [ 1] 3812 	jreq print_exit 
      0094D4 A1 20            [ 1] 3813 1$:	cp a,#TK_QSTR
      0094D6 25 0C            [ 1] 3814 	jrne 2$   
      0094D8 CD 82 1E         [ 4] 3815 	call puts
      0094DB A1               [ 1] 3816 	incw x 
      0094DC 5C 26 F1 03      [ 2] 3817 	subw x,basicptr 
      0094DF 9F               [ 1] 3818 	ld a,xl 
      0094DF CD 82 1E         [ 1] 3819 	ld in,a  
      0094E2 20 EC            [ 2] 3820 	jra reset_comma
      0094E4 88 A6            [ 1] 3821 2$: cp a,#TK_CHAR 
      0094E6 5C CD            [ 1] 3822 	jrne 3$
      0094E8 82               [ 1] 3823 	ld a,xl 
      0094E9 1E 84 A0         [ 4] 3824 	call putc 
      0094EC 07 C7            [ 2] 3825 	jra reset_comma 
      00162F                       3826 3$: 	
      0094EE 00 0B            [ 1] 3827 	cp a,#TK_FUNC 
      0094F0 72 5F            [ 1] 3828 	jrne 4$ 
      0094F2 00               [ 4] 3829 	call (x)
      0094F3 0A 90 AE         [ 4] 3830 	call print_int 
      0094F6 8C DF            [ 2] 3831 	jra reset_comma 
      001639                       3832 4$: 
      0094F8 72 B9            [ 1] 3833 	cp a,#TK_COMMA 
      0094FA 00 0A            [ 1] 3834 	jrne 5$
      0094FC 90 F6            [ 1] 3835 	cpl (COMMA,sp) 
      0094FE 20 DF A6         [ 2] 3836 	jp prt_loop   
      001642                       3837 5$: 
      009501 22 CD            [ 1] 3838 	cp a,#TK_SHARP
      009503 82 1E            [ 1] 3839 	jrne 7$
      009505 5C 81 FA         [ 4] 3840 	call next_token
      009507 A1 03            [ 1] 3841 	cp a,#TK_INTGR 
      009507 52 05            [ 1] 3842 	jreq 6$
      009509 C6 00 08         [ 2] 3843 	jp syntax_error 
      001650                       3844 6$:
      00950C 6B               [ 1] 3845 	ld a,xl 
      00950D 01 C6            [ 1] 3846 	and a,#15 
      00950F 00 26 6B         [ 1] 3847 	ld tab_width,a 
      009512 02 CF 00         [ 2] 3848 	jp reset_comma 
      001659                       3849 7$:	
      009515 15 FE 35         [ 4] 3850 	call unget_token
      00165C                       3851 print_exit:
      009518 0A 00            [ 1] 3852 	tnz (COMMA,sp)
      00951A 08 35            [ 1] 3853 	jrne 9$
      00951C 05 00            [ 1] 3854 	ld a,#CR 
      00951E 26 CD 8A         [ 4] 3855     call putc 
      001665                       3856 9$:	_drop VSIZE 
      009521 19 A6            [ 2]    1     addw sp,#VSIZE 
      009523 20               [ 4] 3857 	ret 
                                   3858 
                                   3859 ;----------------------
                                   3860 ; 'save_context' and
                                   3861 ; 'rest_context' must be 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



                                   3862 ; called at the same 
                                   3863 ; call stack depth 
                                   3864 ; i.e. SP must have the 
                                   3865 ; save value at  
                                   3866 ; entry point of both 
                                   3867 ; routine. 
                                   3868 ;---------------------
                           000006  3869 	CTXT_SIZE=6 ; size of saved data 
                                   3870 ;--------------------
                                   3871 ; save current BASIC
                                   3872 ; interpreter context 
                                   3873 ; on cstack 
                                   3874 ;--------------------
      001668                       3875 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001668                       3876 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001668                       3877 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001668                       3878 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001668                       3879 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      001668                       3880 save_context:
      009524 CD 82 1E         [ 2] 3881 	ldw x,basicptr 
      009527 72 5F            [ 2] 3882 	ldw (BPTR,sp),x
      009529 00 26 AE         [ 2] 3883 	ldw x,lineno 
      00952C 00 02            [ 2] 3884 	ldw (LNO,sp),x 
      00952E 72 D6 00         [ 1] 3885 	ld a,in 
      009531 15 6B            [ 1] 3886 	ld (IN,sp),a
      009533 05 5C 9F         [ 1] 3887 	ld a,count 
      009536 11 05            [ 1] 3888 	ld (CNT,sp),a  
      009538 2B               [ 4] 3889 	ret
                                   3890 
                                   3891 ;-----------------------
                                   3892 ; restore previously saved 
                                   3893 ; BASIC interpreter context 
                                   3894 ; from cstack 
                                   3895 ;-------------------------
      00167D                       3896 rest_context:
      009539 03 CC            [ 2] 3897 	ldw x,(BPTR,sp)
      00953B 96 44 03         [ 2] 3898 	ldw basicptr,x 
      00953D 1E 05            [ 2] 3899 	ldw x,(LNO,sp)
      00953D 72 D6 00         [ 2] 3900 	ldw lineno,x 
      009540 15 5C            [ 1] 3901 	ld a,(IN,sp)
      009542 1F 03 A1         [ 1] 3902 	ld in,a
      009545 06 27            [ 1] 3903 	ld a,(CNT,sp)
      009547 04 A1 07         [ 1] 3904 	ld count,a  
      00954A 26               [ 4] 3905 	ret
                                   3906 
                                   3907 ;------------------------------------------
                                   3908 ; BASIC: INPUT [string],var[,[string],var]
                                   3909 ; input value in variables 
                                   3910 ; [string] optionally can be used as prompt 
                                   3911 ;-----------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                           000001  3912 	CX_BPTR=1
                           000003  3913 	CX_LNO=3
                           000004  3914 	CX_IN=4
                           000005  3915 	CX_CNT=5
                           000006  3916 	SKIP=6
                           000007  3917 	VSIZE=7
      001692                       3918 input_var:
      00954B 2F 00 00 24 05   [ 2] 3919 	btjt flags,#FRUN,1$ 
      00954C A6 06            [ 1] 3920 	ld a,#ERR_RUN_ONLY 
      00954C 72 DE 00         [ 2] 3921 	jp tb_error 
      00169C                       3922 1$:	_vars VSIZE 
      00954F 15 A3            [ 2]    1     sub sp,#VSIZE 
      00169E                       3923 input_loop:
      009551 97 86            [ 1] 3924 	clr (SKIP,sp)
      009553 26 14 A6         [ 4] 3925 	call next_token 
      009556 27 CD            [ 1] 3926 	cp a,#TK_NONE 
      009558 82 1E            [ 1] 3927 	jreq input_exit 
      00955A 1E 03            [ 1] 3928 	cp a,#TK_QSTR 
      00955C 1C 00            [ 1] 3929 	jrne 1$ 
      00955E 02 72 BB         [ 4] 3930 	call puts 
      009561 00 15            [ 1] 3931 	cpl (SKIP,sp)
      009563 CD 82 30         [ 4] 3932 	call next_token 
      009566 CC 96            [ 1] 3933 1$: cp a,#TK_VAR  
      009568 44 CD            [ 1] 3934 	jreq 2$ 
      00956A 91 AE CD         [ 2] 3935 	jp syntax_error
      00956D 94 B7 A6         [ 4] 3936 2$:	call dpush 
      009570 20 CD            [ 1] 3937 	tnz (SKIP,sp)
      009572 82 1E            [ 1] 3938 	jrne 21$ 
      009574 1E 03            [ 1] 3939 	ld a,#':
      009576 1C 00 02         [ 1] 3940 	ld pad+1,a 
      009579 20 BA A1 08      [ 1] 3941 	clr pad+2
      00957D 26 0D 72         [ 2] 3942 	ldw x,#pad 
      009580 BB 00 15         [ 4] 3943 	call puts   
      0016D0                       3944 21$:
      009583 CD 94 CB         [ 4] 3945 	call save_context 
      009586 72 B0 00         [ 2] 3946 	ldw x,#tib 
      009589 15 20 A9         [ 2] 3947 	ldw basicptr,x  
      00958C A1 04 26 1A      [ 1] 3948 	clr count  
      009590 72 DE 00         [ 4] 3949 	call readln 
      009593 15 1D 00 27      [ 1] 3950 	clr in 
      009597 9F 44 AB         [ 4] 3951 	call relation 
      00959A 41 CD            [ 1] 3952 	cp a,#TK_INTGR
      00959C 82 1E            [ 1] 3953 	jreq 3$ 
      00959E A6 20 CD         [ 2] 3954 	jp syntax_error
      0095A1 82 1E 1E         [ 4] 3955 3$: call dpush 
      0095A4 03 1C 00         [ 4] 3956 	call store 
      0095A7 02 20 8B         [ 4] 3957 	call rest_context
      0095AA A1 05 26         [ 4] 3958 	call next_token 
      0095AD 0A A6            [ 1] 3959 	cp a,#TK_COMMA 
      0095AF 40 CD            [ 1] 3960 	jrne 4$
      0095B1 82 1E            [ 2] 3961 	jra input_loop 
      0095B3 1E 03 CC         [ 4] 3962 4$:	call unget_token 
      001703                       3963 input_exit:
      001703                       3964 	_drop VSIZE 
      0095B6 95 35            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0095B8 A1               [ 4] 3965 	ret 
                                   3966 
                                   3967 
                                   3968 ;---------------------
                                   3969 ; BASIC: REMARK | ' 
                                   3970 ; skip comment to end of line 
                                   3971 ;---------------------- 
      001706                       3972 rem:
      0095B9 03 26 14 72 DE   [ 1] 3973  	mov count,in 
      0095BE 00               [ 4] 3974 	ret 
                                   3975 
                                   3976 ;---------------------
                                   3977 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3978 ; read in loop 'addr'  
                                   3979 ; apply & 'mask' to value 
                                   3980 ; loop while result==0.  
                                   3981 ; if 'xor_mask' given 
                                   3982 ; apply ^ in second  
                                   3983 ; loop while result==0 
                                   3984 ;---------------------
                           000001  3985 	XMASK=1 
                           000002  3986 	MASK=2
                           000003  3987 	ADDR=3
                           000004  3988 	VSIZE=4
      00170C                       3989 wait: 
      00170C                       3990 	_vars VSIZE
      0095BF 15 CD            [ 2]    1     sub sp,#VSIZE 
      0095C1 8A 19            [ 1] 3991 	clr (XMASK,sp) 
      0095C3 A6 20 CD         [ 4] 3992 	call arg_list 
      0095C6 82 1E            [ 1] 3993 	cp a,#2
      0095C8 1E 03            [ 1] 3994 	jruge 0$
      0095CA 1C 00 02         [ 2] 3995 	jp syntax_error 
      0095CD CC 95            [ 1] 3996 0$:	cp a,#3
      0095CF 35 A1            [ 1] 3997 	jrult 1$
      0095D1 31 2B 1A         [ 4] 3998 	call dpop 
      0095D4 A1               [ 1] 3999 	ld a,xl
      0095D5 35 22            [ 1] 4000 	ld (XMASK,sp),a 
      0095D7 16 A0 31         [ 4] 4001 1$: call dpop ; mask 
      0095DA 48               [ 1] 4002 	ld a,xl 
      0095DB 90 5F            [ 1] 4003 	ld (MASK,sp),a 
      0095DD 90 97 72         [ 4] 4004 	call dpop ; address 
      0095E0 A9               [ 1] 4005 2$:	ld a,(x)
      0095E1 96 5D            [ 1] 4006 	and a,(MASK,sp)
      0095E3 90 FE            [ 1] 4007 	xor a,(XMASK,sp)
      0095E5 93 CD            [ 1] 4008 	jreq 2$ 
      001734                       4009 	_drop VSIZE 
      0095E7 82 30            [ 2]    1     addw sp,#VSIZE 
      0095E9 1E               [ 4] 4010 	ret 
                                   4011 
                                   4012 ;---------------------
                                   4013 ; BASIC: BSET addr,mask
                                   4014 ; set bits at 'addr' corresponding 
                                   4015 ; to those of 'mask' that are at 1.
                                   4016 ; arguments:
                                   4017 ; 	addr 		memory address RAM|PERIPHERAL 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4018 ;   mask        mask|addr
                                   4019 ; output:
                                   4020 ;	none 
                                   4021 ;--------------------------
      001737                       4022 bit_set:
      0095EA 03 CC 95         [ 4] 4023 	call arg_list 
      0095ED 35 A1            [ 1] 4024 	cp a,#2	 
      0095EF 10 26            [ 1] 4025 	jreq 1$ 
      0095F1 04 A6 2B         [ 2] 4026 	jp syntax_error
      001741                       4027 1$: 
      0095F4 20 46 A1         [ 4] 4028 	call dpop ; mask 
      0095F7 11               [ 1] 4029 	ld a,xl 
      0095F8 26 04 A6         [ 4] 4030 	call dpop ; addr  
      0095FB 2D               [ 1] 4031 	or a,(x)
      0095FC 20               [ 1] 4032 	ld (x),a
      0095FD 3E               [ 4] 4033 	ret 
                                   4034 
                                   4035 ;---------------------
                                   4036 ; BASIC: BRES addr,mask
                                   4037 ; reset bits at 'addr' corresponding 
                                   4038 ; to those of 'mask' that are at 1.
                                   4039 ; arguments:
                                   4040 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4041 ;   mask	    ~mask&*addr  
                                   4042 ; output:
                                   4043 ;	none 
                                   4044 ;--------------------------
      00174B                       4045 bit_reset:
      0095FE A1 20 2B         [ 4] 4046 	call arg_list 
      009601 0E A1            [ 1] 4047 	cp a,#2  
      009603 22 22            [ 1] 4048 	jreq 1$ 
      009605 0A A0 20         [ 2] 4049 	jp syntax_error
      001755                       4050 1$: 
      009608 5F 97 1C         [ 4] 4051 	call dpop ; mask 
      00960B 96               [ 1] 4052 	ld a,xl 
      00960C 5A               [ 1] 4053 	cpl a 
      00960D F6 20 2C         [ 4] 4054 	call dpop ; addr  
      009610 A1               [ 1] 4055 	and a,(x)
      009611 09               [ 1] 4056 	ld (x),a 
      009612 2B               [ 4] 4057 	ret 
                                   4058 
                                   4059 ;---------------------
                                   4060 ; BASIC: BRES addr,mask
                                   4061 ; toggle bits at 'addr' corresponding 
                                   4062 ; to those of 'mask' that are at 1.
                                   4063 ; arguments:
                                   4064 ; 	addr 		memory address RAM|PERIPHERAL 
                                   4065 ;   mask	    mask^*addr  
                                   4066 ; output:
                                   4067 ;	none 
                                   4068 ;--------------------------
      001760                       4069 bit_toggle:
      009613 0E A1 0C         [ 4] 4070 	call arg_list 
      009616 22 0A            [ 1] 4071 	cp a,#2 
      009618 A0 09            [ 1] 4072 	jreq 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      00961A 5F 97 1C         [ 2] 4073 	jp syntax_error
      00961D 96 56 F6         [ 4] 4074 1$: call dpop ; mask 
      009620 20               [ 1] 4075 	ld a,xl 
      009621 1A A1 02         [ 4] 4076 	call dpop ; addr  
      009624 26               [ 1] 4077 	xor a,(x)
      009625 14               [ 1] 4078 	ld (x),a 
      009626 A6               [ 4] 4079 	ret 
                                   4080 
                                   4081 
                                   4082 ;--------------------
                                   4083 ; BASIC: POKE addr,byte
                                   4084 ; put a byte at addr 
                                   4085 ;--------------------
      001774                       4086 poke:
      009627 5C CD 82         [ 4] 4087 	call arg_list 
      00962A 1E 1E            [ 1] 4088 	cp a,#2
      00962C 03 72            [ 1] 4089 	jreq 1$
      00962E D6 00 15         [ 2] 4090 	jp syntax_error
      00177E                       4091 1$:	
      009631 5C 1F 03         [ 4] 4092 	call dpop 
      009634 CD               [ 1] 4093     ld a,xl 
      009635 82 1E CC         [ 4] 4094 	call dpop 
      009638 95               [ 1] 4095 	ld (x),a 
      009639 35               [ 4] 4096 	ret 
                                   4097 
                                   4098 ;-----------------------
                                   4099 ; BASIC: PEEK(addr)
                                   4100 ; get the byte at addr 
                                   4101 ; input:
                                   4102 ;	none 
                                   4103 ; output:
                                   4104 ;	X 		value 
                                   4105 ;-----------------------
      001787                       4106 peek:
      00963A A6 3A            [ 1] 4107 	ld a,#TK_LPAREN 
      00963C CD 82 1E         [ 4] 4108 	call expect 
      00963F 1E 03 CC         [ 4] 4109 	call arg_list
      009642 95 35            [ 1] 4110 	cp a,#1 
      009644 27 03            [ 1] 4111 	jreq 1$
      009644 A6 0D CD         [ 2] 4112 	jp syntax_error
      009647 82 1E            [ 1] 4113 1$:	ld a,#TK_RPAREN 
      009649 7B 02 C7         [ 4] 4114 	call expect 
      00964C 00 26 7B         [ 4] 4115 	call dpop 
      00964F 01               [ 1] 4116 	ld a,(x)
      009650 C7               [ 1] 4117 	clrw x 
      009651 00               [ 1] 4118 	ld xl,a 
      009652 08 5B            [ 1] 4119 	ld a,#TK_INTGR
      009654 05               [ 4] 4120 	ret 
                                   4121 
      0017A4                       4122 if: 
      009655 81 28 29         [ 4] 4123 	call relation 
      009658 2C 23            [ 1] 4124 	cp a,#TK_INTGR
      00965A 2A 2F            [ 1] 4125 	jreq 1$ 
      00965C 25 96 69         [ 2] 4126 	jp syntax_error
      00965F 96               [ 1] 4127 1$:	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      009660 6B               [ 2] 4128 	tnzw x 
      009661 96 6D            [ 1] 4129 	jrne 9$  
                                   4130 ;skip to next line
      009663 96 70 96 72 96   [ 1] 4131 	mov in,count
      009668 75               [ 4] 4132 9$:	ret 
                                   4133 
                                   4134 ;------------------------
                                   4135 ; BASIC: FOR var=expr 
                                   4136 ; set variable to expression 
                                   4137 ; leave variable address 
                                   4138 ; on dstack and set
                                   4139 ; FFOR bit in 'flags'
                                   4140 ;-----------------
                           000001  4141 	RETL1=1
                           000003  4142 	INW=3
                           000005  4143 	BPTR=5
      0017B8                       4144 for: ; { -- var_addr }
      009669 3E 00            [ 1] 4145 	ld a,#TK_VAR 
      00966B 3D 00 3E         [ 4] 4146 	call expect
      00966E 3D 00 3C         [ 4] 4147 	call dpush 
      009671 00 3C 3D         [ 4] 4148 	call let02 
      009674 00 3C 3E 00      [ 1] 4149 	bset flags,#FFOR 
                                   4150 ; open space on cstack for BPTR and INW 
      009678 85               [ 2] 4151 	popw x ; call return address 
      0017C8                       4152 	_vars 4
      009678 4B 00            [ 2]    1     sub sp,#4 
      00967A 89               [ 2] 4153 	pushw x  ; RETL1 
      00967A 0F               [ 1] 4154 	clrw x 
      00967B 01 05            [ 2] 4155 	ldw (BPTR,sp),x 
      00967C 1F 03            [ 2] 4156 	ldw (INW,sp),x 
      00967C CD 93 83         [ 4] 4157 	call next_token 
      00967F A1 01            [ 1] 4158 	cp a,#TK_CMD 
      009681 27 59            [ 1] 4159 	jreq 1$
      009683 A1 03 26         [ 2] 4160 	jp syntax_error
      0017DA                       4161 1$:  
      009686 05 CD 8A         [ 2] 4162 	cpw x,#to 
      009689 19 20            [ 1] 4163 	jreq to
      00968B EE 07 14         [ 2] 4164 	jp syntax_error 
                                   4165 
                                   4166 ;-----------------------------------
                                   4167 ; BASIC: TO expr 
                                   4168 ; second part of FOR loop initilization
                                   4169 ; leave limit on dstack and set 
                                   4170 ; FTO bit in 'flags'
                                   4171 ;-----------------------------------
      00968C                       4172 to: ; { var_addr -- var_addr limit step }
      00968C CD 88 7A A1 00   [ 2] 4173 	btjt flags,#FFOR,1$
      009691 27 49 A1         [ 2] 4174 	jp syntax_error
      009694 08 26 0E         [ 4] 4175 1$: call relation  
      009697 CD 82            [ 1] 4176 	cp a,#TK_INTGR 
      009699 30 5C            [ 1] 4177 	jreq 2$ 
      00969B 72 B0 00         [ 2] 4178 	jp syntax_error
      0017F4                       4179 2$: 
      00969E 04 9F C7         [ 4] 4180     call dpush ; limit
      0096A1 00 02 20         [ 2] 4181 	ldw x,in.w 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0096A4 D5 A1 02         [ 4] 4182 	call next_token
      0096A7 26 06            [ 1] 4183 	cp a,#TK_NONE  
      0096A9 9F CD            [ 1] 4184 	jreq 4$ 
      0096AB 82 1E            [ 1] 4185 	cp a,#TK_CMD
      0096AD 20 CB            [ 1] 4186 	jrne 3$
      0096AF A3 18 12         [ 2] 4187 	cpw x,#step 
      0096AF A1 07            [ 1] 4188 	jreq step
      00180A                       4189 3$:	
      0096B1 26 06 FD         [ 4] 4190 	call unget_token   	 
      00180D                       4191 4$:	
      0096B4 CD 8A 19         [ 2] 4192 	ldw x,#1   ; default step  
      0096B7 20 C1            [ 2] 4193 	jra store_loop_addr 
                                   4194 
                                   4195 
                                   4196 ;----------------------------------
                                   4197 ; BASIC: STEP expr 
                                   4198 ; optional third par of FOR loop
                                   4199 ; initialization. 	
                                   4200 ;------------------------------------
      0096B9                       4201 step: ; {var limit -- var limit step}
      0096B9 A1 0B 26 05 03   [ 2] 4202 	btjt flags,#FFOR,1$
      0096BE 01 CC 96         [ 2] 4203 	jp syntax_error
      0096C1 7C 13 03         [ 4] 4204 1$: call relation
      0096C2 A1 03            [ 1] 4205 	cp a,#TK_INTGR
      0096C2 A1 0C            [ 1] 4206 	jreq store_loop_addr  
      0096C4 26 13 CD         [ 2] 4207 	jp syntax_error
                                   4208 ; leave loop back entry point on cstack 
                                   4209 ; cstack is 2 call deep from interp_loop
      001824                       4210 store_loop_addr:
      0096C7 88 7A A1         [ 4] 4211 	call dpush 
      0096CA 03 27 03         [ 2] 4212 	ldw x,basicptr  
      0096CD CC 87            [ 2] 4213 	ldw (BPTR,sp),x 
      0096CF 94 00 00         [ 2] 4214 	ldw x,in.w 
      0096D0 1F 03            [ 2] 4215 	ldw (INW,sp),x   
      0096D0 9F A4 0F C7      [ 1] 4216 	bres flags,#FFOR 
      0096D4 00 26 CC 96      [ 1] 4217 	inc loop_depth  
      0096D8 7A               [ 4] 4218 	ret 
                                   4219 
                                   4220 ;--------------------------------
                                   4221 ; BASIC: NEXT var 
                                   4222 ; FOR loop control 
                                   4223 ; increment variable with step 
                                   4224 ; and compare with limit 
                                   4225 ; loop if threshold not crossed.
                                   4226 ; else clean both stacks. 
                                   4227 ; and decrement 'loop_depth' 
                                   4228 ;--------------------------------
      0096D9                       4229 next: ; {var limit step -- [var limit step ] }
      0096D9 CD 90 0E 1F      [ 1] 4230 	tnz loop_depth 
      0096DC 26 03            [ 1] 4231 	jrne 1$ 
      0096DC 0D 01 26         [ 2] 4232 	jp syntax_error 
      001843                       4233 1$: 
      0096DF 05 A6            [ 1] 4234 	ld a,#TK_VAR 
      0096E1 0D CD 82         [ 4] 4235 	call expect
                                   4236 ; check for good variable after NEXT 	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0096E4 1E 5B            [ 1] 4237 	ldw y,x 
      0096E6 01 81 04         [ 2] 4238 	ldw x,#4  
      0096E8 72 D3 00 19      [ 4] 4239 	cpw y,([dstkptr],x) ; compare variables address 
      0096E8 CE 00            [ 1] 4240 	jreq 2$  
      0096EA 04 1F 03         [ 2] 4241 	jp syntax_error ; not the good one 
      001856                       4242 2$: ; increment variable 
      0096ED CE               [ 1] 4243 	ldw x,y
      0096EE 00               [ 2] 4244 	ldw x,(x)  ; get var value 
      0096EF 06 1F 05         [ 2] 4245 	ldw acc16,x 
      0096F2 C6 00 02 6B      [ 5] 4246 	ldw x,[dstkptr] ; step
      0096F6 07 C6 00 03      [ 2] 4247 	addw x,acc16 ; var+step 
      0096FA 6B 08            [ 2] 4248 	ldw (y),x ; save var new value 
                                   4249 ; compare with limit 
      0096FC 81 93            [ 1] 4250 	ldw y,x 
      0096FD 72 CE 00 19      [ 5] 4251 	ldw x,[dstkptr] ; step in x 
      0096FD 1E               [ 2] 4252 	tnzw x  
      0096FE 03 CF            [ 1] 4253 	jrpl 4$ ; positive step 
                                   4254 ;negative step 
      009700 00 04 1E         [ 2] 4255 	ldw x,#2
      009703 05 CF 00 06      [ 4] 4256 	cpw y,([dstkptr],x)
      009707 7B 07            [ 1] 4257 	jrslt loop_done
      009709 C7 00            [ 2] 4258 	jra loop_back 
      001879                       4259 4$: ; positive step
      00970B 02 7B 08         [ 2] 4260 	ldw x,#2 
      00970E C7 00 03 81      [ 4] 4261 	cpw y,([dstkptr],x)
      009712 2C 19            [ 1] 4262 	jrsgt loop_done
      001882                       4263 loop_back:
      009712 72 00            [ 2] 4264 	ldw x,(BPTR,sp)
      009714 00 25 05         [ 2] 4265 	ldw basicptr,x 
      009717 A6 06 CC 87 96   [ 2] 4266 	btjf flags,#FRUN,1$ 
      00971C 52 07            [ 1] 4267 	ld a,(2,x)
      00971E C7 00 02         [ 1] 4268 	ld count,a
      00971E 0F               [ 2] 4269 	ldw x,(x)
      00971F 06 CD 88         [ 2] 4270 	ldw lineno,x
      009722 7A A1            [ 2] 4271 1$:	ldw x,(INW,sp)
      009724 00 27 5C         [ 2] 4272 	ldw in.w,x 
      009727 A1               [ 4] 4273 	ret 
      00189B                       4274 loop_done:
                                   4275 	; remove var limit step on dstack 
      009728 08 26 08         [ 2] 4276 	ldw x,dstkptr 
      00972B CD 82 30         [ 2] 4277 	addw x,#3*CELL_SIZE
      00972E 03 06 CD         [ 2] 4278 	ldw dstkptr,x 
                                   4279 	; remove 2 return address on cstack 
      009731 88               [ 2] 4280 	popw x
      0018A5                       4281 	_drop 4
      009732 7A A1            [ 2]    1     addw sp,#4 
      009734 04               [ 2] 4282 	pushw x 
      009735 27 03 CC 87      [ 1] 4283 	dec loop_depth 
      009739 94               [ 4] 4284 	ret 
                                   4285 
                                   4286 
                                   4287 ;------------------------
                                   4288 ; BASIC: GOTO lineno 
                                   4289 ; jump to lineno 
                                   4290 ; here cstack is 2 call deep from interp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4291 ;------------------------
      0018AD                       4292 goto:
      00973A CD 90 15 0D 06   [ 2] 4293 	btjt flags,#FRUN,0$ 
      00973F 26 0F            [ 1] 4294 	ld a,#ERR_RUN_ONLY
      009741 A6 3A C7         [ 2] 4295 	jp tb_error 
      009744 17               [ 4] 4296 	ret 
      009745 19 72            [ 2] 4297 0$:	jra go_common
                                   4298 
                                   4299 ;--------------------
                                   4300 ; BASIC: GOSUB lineno
                                   4301 ; basic subroutine call
                                   4302 ; actual lineno and basicptr 
                                   4303 ; are saved on cstack
                                   4304 ; here cstack is 2 call deep from interp_loop 
                                   4305 ;--------------------
                           000003  4306 	GOS_RET=3
      0018BA                       4307 gosub:
      009747 5F 17 1A AE 17   [ 2] 4308 	btjt flags,#FRUN,0$ 
      00974C 18 CD            [ 1] 4309 	ld a,#ERR_RUN_ONLY
      00974E 82 30 16         [ 2] 4310 	jp tb_error 
      009750 81               [ 4] 4311 	ret 
      009750 CD               [ 2] 4312 0$:	popw x 
      009751 96 E8            [ 2] 4313 	sub sp,#2 
      009753 AE               [ 2] 4314 	pushw x 
      009754 16 C8 CF         [ 2] 4315 	ldw x,basicptr
      009757 00 04            [ 1] 4316 	ld a,(2,x)
      009759 72 5F            [ 1] 4317 	add a,#3 
      00975B 00 03 CD         [ 1] 4318 	ld acc8,a 
      00975E 8B 07 72 5F      [ 1] 4319 	clr acc16 
      009762 00 02 CD 93      [ 2] 4320 	addw x,acc16
      009766 83 A1            [ 2] 4321 	ldw (GOS_RET,sp),x 
      0018DD                       4322 go_common: 
      009768 03 27 03         [ 4] 4323 	call relation 
      00976B CC 87            [ 1] 4324 	cp a,#TK_INTGR
      00976D 94 CD            [ 1] 4325 	jreq 1$ 
      00976F 90 15 CD         [ 2] 4326 	jp syntax_error
      0018E7                       4327 1$: 
      009772 90 7C CD         [ 4] 4328 	call search_lineno  
      009775 96               [ 2] 4329 	tnzw x 
      009776 FD CD            [ 1] 4330 	jrne 2$ 
      009778 88 7A            [ 1] 4331 	ld a,#ERR_NO_LINE 
      00977A A1 0B 26         [ 2] 4332 	jp tb_error 
      0018F2                       4333 2$: 
      00977D 02 20 9E         [ 2] 4334 	ldw basicptr,x 
      009780 CD 90            [ 1] 4335 	ld a,(2,x)
      009782 0E 00 02         [ 1] 4336 	ld count,a 
      009783 FE               [ 2] 4337 	ldw x,(x)
      009783 5B 07 81         [ 2] 4338 	ldw lineno,x 
      009786 35 03 00 01      [ 1] 4339 	mov in,#3 
      009786 55               [ 4] 4340 	ret 
                                   4341 
                                   4342 ;------------------------
                                   4343 ; BASIC: RETURN 
                                   4344 ; exit from a subroutine 
                                   4345 ; cstack is 2 level deep from interp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



                                   4346 ;------------------------
      001903                       4347 return:
      009787 00 02 00 03 81   [ 2] 4348 	btjt flags,#FRUN,0$ 
      00978C A6 06            [ 1] 4349 	ld a,#ERR_RUN_ONLY
      00978C 52 04 0F         [ 2] 4350 	jp tb_error 
      00190D                       4351 0$:	
      00978F 01 CD            [ 2] 4352 	ldw x,(GOS_RET,sp) 
      009791 92 45 A1         [ 2] 4353 	ldw basicptr,x 
      009794 02 24            [ 1] 4354 	ld a,(2,x)
      009796 03 CC            [ 1] 4355 	add a,#3 
      009798 87 94 A1         [ 1] 4356 	ld count,a 
      00979B 03 25 06 CD      [ 1] 4357 	mov in,#3
      00979F 90               [ 2] 4358 	ldw x,(x)
      0097A0 22 9F 6B         [ 2] 4359 	ldw lineno,x 
      0097A3 01               [ 1] 4360 	clr a 
      0097A4 CD               [ 2] 4361 	popw x 
      001923                       4362 	_drop 2
      0097A5 90 22            [ 2]    1     addw sp,#2 
      0097A7 9F               [ 2] 4363 	pushw x
      0097A8 6B               [ 4] 4364 	ret  
                                   4365 
                                   4366 
                                   4367 ;----------------------------------
                                   4368 ; BASIC: RUN
                                   4369 ; run BASIC program in RAM
                                   4370 ;----------------------------------- 
      001927                       4371 run: 
      0097A9 02 CD 90 22 F6   [ 2] 4372 	btjf flags,#FRUN,0$  
      0097AE 14               [ 1] 4373 	clr a 
      0097AF 02               [ 4] 4374 	ret
      00192E                       4375 0$: 
      0097B0 18 01 27 F9 5B   [ 2] 4376 	btjf flags,#FBREAK,1$
      001933                       4377 	_drop 2 
      0097B5 04 81            [ 2]    1     addw sp,#2 
      0097B7 CD 16 7D         [ 4] 4378 	call rest_context
      001938                       4379 	_drop CTXT_SIZE 
      0097B7 CD 92            [ 2]    1     addw sp,#CTXT_SIZE 
      0097B9 45 A1 02 27      [ 1] 4380 	bres flags,#FBREAK 
      0097BD 03 CC 87 94      [ 1] 4381 	bset flags,#FRUN 
      0097C1 CC 07 CA         [ 2] 4382 	jp interp_loop 
      0097C1 CD 90 22         [ 2] 4383 1$:	ldw x,txtbgn
      0097C4 9F CD 90         [ 2] 4384 	cpw x,txtend 
      0097C7 22 FA            [ 1] 4385 	jrmi 2$ 
      0097C9 F7               [ 1] 4386 	clr a 
      0097CA 81               [ 4] 4387 	ret 
      0097CB CD 13 7E         [ 4] 4388 2$: call ubound 
      001952                       4389 	_drop 2 
      0097CB CD 92            [ 2]    1     addw sp,#2 
      0097CD 45 A1 02         [ 2] 4390 	ldw x,txtbgn 
      0097D0 27 03 CC         [ 2] 4391 	ldw basicptr,x 
      0097D3 87 94            [ 1] 4392 	ld a,(2,x)
      0097D5 C7 00 02         [ 1] 4393 	ld count,a
      0097D5 CD               [ 2] 4394 	ldw x,(x)
      0097D6 90 22 9F         [ 2] 4395 	ldw lineno,x
      0097D9 43 CD 90 22      [ 1] 4396 	mov in,#3	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0097DD F4 F7 81 24      [ 1] 4397 	bset flags,#FRUN 
      0097E0 CC 07 CA         [ 2] 4398 	jp interp_loop 
                                   4399 
                                   4400 
                                   4401 ;----------------------
                                   4402 ; BASIC: STOP 
                                   4403 ; stop running program
                                   4404 ;---------------------- 
      00196E                       4405 stop: 
                                   4406 ; clean dstack and cstack 
      0097E0 CD 92 45         [ 2] 4407 	ldw x,#STACK_EMPTY 
      0097E3 A1               [ 1] 4408 	ldw sp,x 
      0097E4 02 27 03 CC      [ 1] 4409 	bres flags,#FRUN 
      0097E8 87 94 CD 90      [ 1] 4410 	bres flags,#FBREAK
      0097EC 22 9F CD         [ 2] 4411 	jp warm_start
                                   4412 
                                   4413 ;-----------------------
                                   4414 ; BASIC BEEP expr1,expr2
                                   4415 ; used MCU internal beeper 
                                   4416 ; to produce a sound
                                   4417 ; arguments:
                                   4418 ;    expr1   frequency, {1,2,4} mapping to 1K,2K,4K
                                   4419 ;    expr2   duration msec.
                                   4420 ;---------------------------
      00197D                       4421 beep:
      0097EF 90 22 F8         [ 4] 4422 	call arg_list 
      0097F2 F7 81            [ 1] 4423 	cp a,#2 
      0097F4 27 03            [ 1] 4424 	jreq 2$
      0097F4 CD 92 45         [ 2] 4425 	jp syntax_error 
      0097F7 A1 02 27         [ 2] 4426 2$: ldw x,dstkptr 
      0097FA 03 CC            [ 2] 4427 	ldw x,(2,x);frequency 
      0097FC 87               [ 1] 4428 	ld a,xl
      0097FD 94               [ 1] 4429 	dec a 
      0097FE 4E               [ 1] 4430 	swap a 
      0097FE CD               [ 1] 4431 	sll a 
      0097FF 90               [ 1] 4432 	sll a 
      009800 22 9F            [ 1] 4433 	add a,#0x3e 
      009802 CD 90 22         [ 1] 4434 	ld BEEP_CSR,a 
      009805 F7 81 A2         [ 4] 4435 	call dpop 
      009807 CD 1E 68         [ 4] 4436 	call pause02 
      009807 A6 09 CD         [ 4] 4437 	call ddrop 
      00980A 92 38            [ 1] 4438 	ld a,#0x1f
      00980C CD 92 45         [ 1] 4439 	ld BEEP_CSR,a 
      00980F A1               [ 4] 4440 	ret 
                                   4441 
                                   4442 ;-------------------------------
                                   4443 ; BASIC: PWRADC 0|1,divisor  
                                   4444 ; disable/enanble ADC 
                                   4445 ;-------------------------------
      0019A5                       4446 power_adc:
      009810 01 27 03         [ 4] 4447 	call arg_list 
      009813 CC 87            [ 1] 4448 	cp a,#2	
      009815 94 A6            [ 1] 4449 	jreq 1$
      009817 0A CD 92         [ 2] 4450 	jp syntax_error 
      00981A 38 CD 90         [ 2] 4451 1$: ldw x,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      00981D 22 F6 5F 97      [ 5] 4452 	ldw x,([dstkptr],x) ; on|off
      009821 A6               [ 2] 4453 	tnzw x 
      009822 03 81            [ 1] 4454 	jreq 2$ 
      009824 72 CE 00 19      [ 5] 4455 	ldw x,[dstkptr] ; channel
      009824 CD               [ 1] 4456 	ld a,xl
      009825 93 83            [ 1] 4457 	and a,#7
      009827 A1               [ 1] 4458 	swap a 
      009828 03 27 03         [ 1] 4459 	ld ADC_CR1,a
      00982B CC 87 94 4F      [ 1] 4460 	bset ADC_CR2,#ADC_CR2_ALIGN ; right 
      00982F 5D 26 05 55      [ 1] 4461 	bset ADC_CR1,#ADC_CR1_ADON 
      0019CC                       4462 	_usec_dly 7 
      009833 00 03 00         [ 2]    1     ldw x,#(16*7-2)/4
      009836 02               [ 2]    2     decw x
      009837 81               [ 1]    3     nop 
      009838 26 FA            [ 1]    4     jrne .-4
      009838 A6 04            [ 2] 4463 	jra 3$
      00983A CD 92 38 CD      [ 1] 4464 2$: bres ADC_CR1,#ADC_CR1_ADON 
      00983E 90 15 CD         [ 2] 4465 3$:	ldw x,#2
      009841 94 16 72         [ 4] 4466 	call ddrop_n 
      009844 14               [ 4] 4467 	ret
                                   4468 
                                   4469 ;-----------------------------
                                   4470 ; BASIC: RDADC(channel)
                                   4471 ; read adc channel 
                                   4472 ; output:
                                   4473 ;   A 		TK_INTGR 
                                   4474 ;   X 		value 
                                   4475 ;-----------------------------
      0019E0                       4476 read_adc:
      009845 00 25            [ 1] 4477 	ld a,#TK_LPAREN 
      009847 85 52 04         [ 4] 4478 	call expect 
      00984A 89 5F 1F         [ 4] 4479 	call next_token 
      00984D 05 1F            [ 1] 4480 	cp a,#TK_INTGR 
      00984F 03 CD            [ 1] 4481 	jreq 1$
      009851 88 7A A1         [ 2] 4482 	jp syntax_error
      009854 06               [ 2] 4483 1$: pushw x 
      009855 27 03            [ 1] 4484 	ld a,#TK_RPAREN 
      009857 CC 87 94         [ 4] 4485 	call expect 
      00985A 85               [ 2] 4486 	popw x 
      00985A A3 98 62         [ 2] 4487 	cpw x,#16 
      00985D 27 03            [ 1] 4488 	jrult 2$
      00985F CC 87            [ 1] 4489 	ld a,#ERR_BAD_VALUE
      009861 94 07 16         [ 2] 4490 	jp tb_error 
      009862 9F               [ 1] 4491 2$: ld a,xl
      009862 72 04 00         [ 1] 4492 	ld ADC_CSR,a 
      009865 25 03 CC 87      [ 1] 4493 	bset ADC_CR1,#ADC_CR1_ADON
      009869 94 CD 93 83 A1   [ 2] 4494 	btjf ADC_CSR,#ADC_CSR_EOC,.
      00986E 03 27 03         [ 2] 4495 	ldw x,ADC_DRH 
      009871 CC 87            [ 1] 4496 	ld a,#TK_INTGR
      009873 94               [ 4] 4497 	ret 
                                   4498 
                                   4499 
                                   4500 ;-----------------------
                                   4501 ; BASIC: BREAK 
                                   4502 ; insert a breakpoint 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4503 ; in pogram. 
                                   4504 ; the program is resumed
                                   4505 ; with RUN 
                                   4506 ;-------------------------
      009874                       4507 break:
      009874 CD 90 15 CE 00   [ 2] 4508 	btjt flags,#FRUN,2$
      009879 01               [ 1] 4509 	clr a
      00987A CD               [ 4] 4510 	ret 
      001A1A                       4511 2$:	 
                                   4512 ; create space on cstack to save context 
      00987B 88 7A A1         [ 2] 4513 	ldw x,#break_point 
      00987E 00 27 0C         [ 4] 4514 	call puts 
      001A20                       4515 	_drop 2 ;drop return address 
      009881 A1 06            [ 2]    1     addw sp,#2 
      001A22                       4516 	_vars CTXT_SIZE ; context size 
      009883 26 05            [ 2]    1     sub sp,#CTXT_SIZE 
      009885 A3 98 92         [ 4] 4517 	call save_context 
      009888 27 08 C8         [ 2] 4518 	ldw x,#tib 
      00988A CF 00 03         [ 2] 4519 	ldw basicptr,x
      00988A CD               [ 1] 4520 	clr (x)
      00988B 90 0E 00 02      [ 1] 4521 	clr count  
      00988D 5F               [ 1] 4522 	clrw x 
      00988D AE 00 01         [ 2] 4523 	ldw lineno,x 
      009890 20 12 00         [ 2] 4524 	ldw in.w,x
      009892 72 11 00 24      [ 1] 4525 	bres flags,#FRUN 
      009892 72 04 00 25      [ 1] 4526 	bset flags,#FBREAK
      009896 03 CC 87         [ 2] 4527 	jp interp_loop 
      009899 94 CD 93 83 A1 03 27  4528 break_point: .asciz "\nbreak point, RUN to resume.\n"
             03 CC 87 94 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4529 
                                   4530 ;-----------------------
                                   4531 ; BASIC: NEW
                                   4532 ; from command line only 
                                   4533 ; free program memory
                                   4534 ; and clear variables 
                                   4535 ;------------------------
      0098A4                       4536 new: 
      0098A4 CD 90 15 CE 00   [ 2] 4537 	btjf flags,#FRUN,0$ 
      0098A9 04               [ 1] 4538 	clr a 
      0098AA 1F               [ 4] 4539 	ret 
      001A69                       4540 0$:	
      0098AB 05 CE 00         [ 4] 4541 	call clear_basic 
      0098AE 01               [ 4] 4542 	ret 
                                   4543 	 
                                   4544 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4545 ;   file system routines
                                   4546 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4547 
                                   4548 ;--------------------
                                   4549 ; input:
                                   4550 ;   X     increment 
                                   4551 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4552 ;   farptr  incremented 
                                   4553 ;---------------------
      001A6D                       4554 incr_farptr:
      0098AF 1F 03 72 15      [ 2] 4555 	addw x,farptr+1 
      0098B3 00 25            [ 1] 4556 	jrnc 1$
      0098B5 72 5C 00 20      [ 1] 4557 	inc farptr 
      0098B9 81 00 14         [ 2] 4558 1$:	ldw farptr+1,x  
      0098BA 81               [ 4] 4559 	ret 
                                   4560 
                                   4561 ;------------------------------
                                   4562 ; extended flash memory used as FLASH_DRIVE 
                                   4563 ; seek end of used flash drive   
                                   4564 ; starting at 0x10000 address.
                                   4565 ; 4 consecutives 0 bytes signal free space. 
                                   4566 ; input:
                                   4567 ;	none
                                   4568 ; output:
                                   4569 ;   ffree     free_addr| 0 if memory full.
                                   4570 ;------------------------------
      001A7B                       4571 seek_fdrive:
                                   4572 ; start scan at 0x10000 address 
      0098BA 72 5D            [ 1] 4573 	ld a,#1
      0098BC 00 20 26         [ 1] 4574 	ld farptr,a 
      0098BF 03               [ 1] 4575 	clrw x 
      0098C0 CC 87 94         [ 2] 4576 	ldw farptr+1,x 
      0098C3                       4577 1$:
      0098C3 A6 04 CD         [ 2] 4578 	ldw x,#3  
      0098C6 92 38 90 93      [ 5] 4579 2$:	ldf a,([farptr],x) 
      0098CA AE 00            [ 1] 4580 	jrne 3$
      0098CC 04               [ 2] 4581 	decw x
      0098CD 72 D3            [ 1] 4582 	jrpl 2$
      0098CF 00 1A            [ 2] 4583 	jra 4$ 
      0098D1 27               [ 1] 4584 3$:	incw x 
      0098D2 03 CC 87         [ 4] 4585 	call incr_farptr
      0098D5 94 02 7F         [ 2] 4586 	ldw x,#0x27f 
      0098D6 C3 00 13         [ 2] 4587 	cpw x,farptr
      0098D6 93 FE            [ 1] 4588 	jrpl 1$
                                   4589 ; drive full 
      0098D8 CF 00 0A 72      [ 1] 4590 	clr ffree 
      0098DC CE 00 1A 72      [ 1] 4591 	clr ffree+1 
      0098E0 BB 00 0A 90      [ 1] 4592 	clr ffree+2 
      0098E4 FF               [ 4] 4593 	ret
      001AAB                       4594 4$: ; copy farptr to ffree	 
      0098E5 90 93 72         [ 2] 4595 	ldw x,farptr 
      0098E8 CE 00 1A         [ 1] 4596 	ld a,farptr+2 
      0098EB 5D 2A 0B         [ 2] 4597 	ldw ffree,x 
      0098EE AE 00 02         [ 1] 4598 	ld ffree+2,a  
      0098F1 72               [ 4] 4599 	ret 
                                   4600 
                                   4601 ;-----------------------
                                   4602 ; compare file name 
                                   4603 ; with name pointed by Y  
                                   4604 ; input:
                                   4605 ;   farptr   file name 
                                   4606 ;   Y        target name 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4607 ; output:
                                   4608 ;   farptr 	 at file_name
                                   4609 ;   X 		 farptr[x] point at size field  
                                   4610 ;   Carry    0|1 no match|match  
                                   4611 ;----------------------
      001AB8                       4612 cmp_name:
      0098F2 D3               [ 1] 4613 	clrw x
      0098F3 00 1A 2F 24      [ 5] 4614 1$:	ldf a,([farptr],x)
      0098F7 20 09            [ 1] 4615 	cp a,(y)
      0098F9 26 08            [ 1] 4616 	jrne 4$
      0098F9 AE               [ 1] 4617 	tnz a 
      0098FA 00 02            [ 1] 4618 	jreq 9$ 
      0098FC 72               [ 1] 4619     incw x 
      0098FD D3 00            [ 1] 4620 	incw y 
      0098FF 1A 2C            [ 2] 4621 	jra 1$
      001AC9                       4622 4$: ;no match 
      009901 19               [ 1] 4623 	tnz a 
      009902 27 07            [ 1] 4624 	jreq 5$
      009902 1E               [ 1] 4625 	incw x 
      009903 05 CF 00 04      [ 5] 4626 	ldf a,([farptr],x)
      009907 72 01            [ 2] 4627 	jra 4$  
      009909 00               [ 1] 4628 5$:	incw x ; farptr[x] point at 'size' field 
      00990A 25               [ 1] 4629 	rcf 
      00990B 09               [ 4] 4630 	ret
      001AD6                       4631 9$: ; match  
      00990C E6               [ 1] 4632 	incw x  ; farptr[x] at 'size' field 
      00990D 02               [ 1] 4633 	scf 
      00990E C7               [ 4] 4634 	ret 
                                   4635 
                                   4636 ;-----------------------
                                   4637 ; search file in 
                                   4638 ; flash memory 
                                   4639 ; input:
                                   4640 ;   Y       file name  
                                   4641 ; output:
                                   4642 ;   farptr  addr at name|0
                                   4643 ;-----------------------
                           000001  4644 	FSIZE=1
                           000003  4645 	YSAVE=3
                           000004  4646 	VSIZE=4 
      001AD9                       4647 search_file: 
      001AD9                       4648 	_vars VSIZE
      00990F 00 03            [ 2]    1     sub sp,#VSIZE 
      009911 FE CF            [ 2] 4649 	ldw (YSAVE,sp),y  
      009913 00               [ 1] 4650 	clrw x 
      009914 06 1E 03         [ 2] 4651 	ldw farptr+1,x 
      009917 CF 00 01 81      [ 1] 4652 	mov farptr,#1
      00991B                       4653 1$:	
                                   4654 ; check if farptr is after any file 
                                   4655 ; if  0 then so.
      00991B CE 00 1A 1C      [ 5] 4656 	ldf a,[farptr]
      00991F 00 06            [ 1] 4657 	jreq 6$
      009921 CF               [ 1] 4658 2$: clrw x 	
      009922 00 1A            [ 2] 4659 	ldw y,(YSAVE,sp) 
      009924 85 5B 04         [ 4] 4660 	call cmp_name
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009927 89 72            [ 1] 4661 	jrc 9$
      009929 5A 00 20 81      [ 5] 4662 	ldf a,([farptr],x)
      00992D 6B 01            [ 1] 4663 	ld (FSIZE,sp),a 
      00992D 72               [ 1] 4664 	incw x 
      00992E 00 00 25 06      [ 5] 4665 	ldf a,([farptr],x)
      009932 A6 06            [ 1] 4666 	ld (FSIZE+1,sp),a 
      009934 CC               [ 1] 4667 	incw x 
      009935 87 96 81         [ 2] 4668 	addw x,(FSIZE,sp) ; count to skip 
      009938 20               [ 1] 4669 	incw x ; skip over EOF marker 
      009939 23 1A 6D         [ 4] 4670 	call incr_farptr ; now at next file 'name_field'
      00993A AE 02 80         [ 2] 4671 	ldw x,#0x280
      00993A 72 00 00         [ 2] 4672 	cpw x,farptr 
      00993D 25 06            [ 1] 4673 	jrpl 1$
      001B10                       4674 6$: ; file not found 
      00993F A6 06 CC 87      [ 1] 4675 	clr farptr
      009943 96 81 85 52      [ 1] 4676 	clr farptr+1 
      009947 02 89 CE 00      [ 1] 4677 	clr farptr+2 
      001B1C                       4678 	_drop VSIZE 
      00994B 04 E6            [ 2]    1     addw sp,#VSIZE 
      00994D 02               [ 1] 4679 	rcf
      00994E AB               [ 4] 4680 	ret
      001B20                       4681 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001B20                       4682 	_drop VSIZE 
      00994F 03 C7            [ 2]    1     addw sp,#VSIZE 
      009951 00               [ 1] 4683 	scf 	
      009952 0B               [ 4] 4684 	ret
                                   4685 
                                   4686 ;--------------------------------
                                   4687 ; BASIC: SAVE "name" 
                                   4688 ; save text program in 
                                   4689 ; flash memory used as 
                                   4690 ;--------------------------------
                           000001  4691 	BSIZE=1
                           000003  4692 	NAMEPTR=3
                           000004  4693 	VSIZE=4
      001B24                       4694 save:
      009953 72 5F 00 0A 72   [ 2] 4695 	btjf flags,#FRUN,0$ 
      009958 BB 00            [ 1] 4696 	ld a,#ERR_CMD_ONLY 
      00995A 0A 1F 03         [ 2] 4697 	jp tb_error
      00995D                       4698 0$:	 
      00995D CD 93 83         [ 2] 4699 	ldw x,txtend 
      009960 A1 03 27 03      [ 2] 4700 	subw x,txtbgn
      009964 CC 87            [ 1] 4701 	jrne 1$
                                   4702 ; nothing to save 
      009966 94               [ 4] 4703 	ret 
      009967                       4704 1$:	
      001B38                       4705 	_vars VSIZE 
      009967 CD 83            [ 2]    1     sub sp,#VSIZE 
      009969 60 5D            [ 2] 4706 	ldw (BSIZE,sp),x 
      00996B 26 05 A6         [ 4] 4707 	call next_token	
      00996E 05 CC            [ 1] 4708 	cp a,#TK_QSTR
      009970 87 96            [ 1] 4709 	jreq 2$
      009972 CC 07 14         [ 2] 4710 	jp syntax_error
      001B46                       4711 2$: 
      009972 CF 00 04 E6      [ 2] 4712 	ldw y,basicptr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      009976 02 C7 00 03      [ 2] 4713 	addw y,in.w
      00997A FE CF            [ 2] 4714 	ldw (NAMEPTR,sp),y  
      00997C 00 06 35 03 00   [ 1] 4715 	mov in,count 
                                   4716 ; check if enough free space 
      009981 02               [ 1] 4717 	ldw x,y 
      009982 81 02 72         [ 4] 4718 	call strlen 
      009983 1C 00 03         [ 2] 4719 	addw x,#3 
      009983 72 00 00         [ 2] 4720 	addw x,(BSIZE,sp)
      009986 25 05 A6 06      [ 1] 4721 	tnz ffree 
      00998A CC 87            [ 1] 4722 	jrne 21$
      00998C 96 B0 00 17      [ 2] 4723 	subw x,ffree+1 
      00998D 23 05            [ 2] 4724 	jrule 21$
      00998D 1E 03            [ 1] 4725 	ld a,#ERR_MEM_FULL 
      00998F CF 00 04         [ 2] 4726 	jp tb_error
      001B70                       4727 21$: 
                                   4728 ; check for existing file of that name 
      009992 E6 02            [ 2] 4729 	ldw y,(NAMEPTR,sp)	
      009994 AB 03 C7         [ 4] 4730 	call search_file 
      009997 00 03            [ 1] 4731 	jrnc 3$ 
      009999 35 03            [ 1] 4732 	ld a,#ERR_DUPLICATE 
      00999B 00 02 FE         [ 2] 4733 	jp tb_error 
      001B7C                       4734 3$:	;** write file name to flash **
      00999E CF 00 06         [ 2] 4735 	ldw x,ffree 
      0099A1 4F 85 5B         [ 1] 4736 	ld a,ffree+2 
      0099A4 02 89 81         [ 2] 4737 	ldw farptr,x 
      0099A7 C7 00 15         [ 1] 4738 	ld farptr+2,a 
      0099A7 72 01            [ 2] 4739 	ldw x,(NAMEPTR,sp)  
      0099A9 00 25 02         [ 4] 4740 	call strlen 
      0099AC 4F               [ 1] 4741 	incw  x
      0099AD 81 01            [ 2] 4742 	ldw (BSIZE,sp),x  
      0099AE 5F               [ 1] 4743 	clrw x   
      0099AE 72 09            [ 2] 4744 	ldw y,(NAMEPTR,sp)
      0099B0 00 25 12         [ 4] 4745 	call write_block  
                                   4746 ;** write file length after name **
      0099B3 5B 02 CD         [ 2] 4747 	ldw x,txtend 
      0099B6 96 FD 5B 06      [ 2] 4748 	subw x,txtbgn
      0099BA 72 19            [ 2] 4749 	ldw (BSIZE,sp),x 
      0099BC 00               [ 1] 4750 	clrw x 
      0099BD 25 72            [ 1] 4751 	ld a,(1,sp)
      0099BF 10 00 25         [ 4] 4752 	call write_byte 
      0099C2 CC               [ 1] 4753 	incw x 
      0099C3 88 4A            [ 1] 4754 	ld a,(2,sp)
      0099C5 CE 00 1C         [ 4] 4755 	call write_byte
      0099C8 C3               [ 1] 4756 	incw x  
      0099C9 00 1E 2B         [ 4] 4757 	call incr_farptr ; move farptr after SIZE field 
                                   4758 ;** write BASIC text **
                                   4759 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      0099CC 02 4F            [ 2] 4760 	ldw x,(BSIZE,sp)
      0099CE 81               [ 2] 4761 	pushw x ; write_block argument 
      0099CF CD               [ 1] 4762 	clrw x 
      0099D0 93 FE 5B 02      [ 2] 4763 	ldw y,txtbgn  ; BASIC text to save 
      0099D4 CE 00 1C         [ 4] 4764 	call write_block 
      001BBA                       4765 	_drop 2 ;  drop write_block argument  
      0099D7 CF 00            [ 2]    1     addw sp,#2 
                                   4766 ; write en end of file marker 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0099D9 04 E6 02         [ 2] 4767 	ldw x,#1
      0099DC C7 00            [ 1] 4768 	ld a,#EOF  
      0099DE 03 FE CF         [ 4] 4769 	call write_byte 
      0099E1 00 06 35         [ 4] 4770 	call incr_farptr
                                   4771 ; save farptr in ffree
      0099E4 03 00 02         [ 2] 4772 	ldw x,farptr 
      0099E7 72 10 00         [ 1] 4773 	ld a,farptr+2 
      0099EA 25 CC 88         [ 2] 4774 	ldw ffree,x 
      0099ED 4A 00 18         [ 1] 4775 	ld ffree+2,a
                                   4776 ;write 4 zero bytes as an end of all files marker 
      0099EE 5F               [ 1] 4777     clrw x 
      0099EE AE 17            [ 1] 4778 	push #4 
      001BD6                       4779 4$:
      0099F0 FF               [ 1] 4780 	clr a 
      0099F1 94 72 11         [ 4] 4781 	call write_byte 
      0099F4 00               [ 1] 4782 	incw x 
      0099F5 25 72            [ 1] 4783 	dec (1,sp)
      0099F7 19 00            [ 1] 4784 	jrne 4$
      0099F9 25               [ 1] 4785 5$: pop a 
                                   4786 ; display saved size  
      0099FA CC 87            [ 2] 4787 	ldw x,(BSIZE,sp) 
      0099FC E6 09 99         [ 4] 4788 	call print_int 
      0099FD                       4789 	_drop VSIZE 
      0099FD CD 92            [ 2]    1     addw sp,#VSIZE 
      0099FF 45               [ 4] 4790 	ret 
                                   4791 
                                   4792 
                                   4793 ;------------------------
                                   4794 ; BASIC: LOAD "file" 
                                   4795 ; load file to RAM 
                                   4796 ; for execution 
                                   4797 ;------------------------
      001BE8                       4798 load:
      009A00 A1 02 27 03 CC   [ 2] 4799 	btjf flags,#FRUN,0$ 
      009A05 87 94            [ 1] 4800 	jreq 0$ 
      009A07 CE 00            [ 1] 4801 	ld a,#ERR_CMD_ONLY 
      009A09 1A EE 02         [ 2] 4802 	jp tb_error 
      001BF4                       4803 0$:	
      009A0C 9F 4A 4E         [ 4] 4804 	call next_token 
      009A0F 48 48            [ 1] 4805 	cp a,#TK_QSTR
      009A11 AB 3E            [ 1] 4806 	jreq 1$
      009A13 C7 50 F3         [ 2] 4807 	jp syntax_error 
      001BFE                       4808 1$:	
      009A16 CD 90 22 CD      [ 2] 4809 	ldw y,basicptr
      009A1A 9E E8 CD 90      [ 2] 4810 	addw y,in.w 
      009A1E 49 A6 1F C7 50   [ 1] 4811 	mov in,count 
      009A23 F3 81 D9         [ 4] 4812 	call search_file 
      009A25 25 05            [ 1] 4813 	jrc 2$ 
      009A25 CD 92            [ 1] 4814 	ld a,#ERR_NOT_FILE
      009A27 45 A1 02         [ 2] 4815 	jp tb_error  
      001C15                       4816 2$:	
      009A2A 27 03 CC         [ 4] 4817 	call incr_farptr  
      009A2D 87 94 AE         [ 4] 4818 	call clear_basic  
      009A30 00               [ 1] 4819 	clrw x
      009A31 02 72 DE 00      [ 5] 4820 	ldf a,([farptr],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009A35 1A 5D            [ 1] 4821 	ld yh,a 
      009A37 27               [ 1] 4822 	incw x  
      009A38 1C 72 CE 00      [ 5] 4823 	ldf a,([farptr],x)
      009A3C 1A               [ 1] 4824 	incw x 
      009A3D 9F A4            [ 1] 4825 	ld yl,a 
      009A3F 07 4E C7 54      [ 2] 4826 	addw y,txtbgn
      009A43 01 72 16 54      [ 2] 4827 	ldw txtend,y
      009A47 02 72 10 54      [ 2] 4828 	ldw y,txtbgn
      001C36                       4829 3$:	; load BASIC text 	
      009A4B 01 AE 00 1B      [ 5] 4830 	ldf a,([farptr],x)
      009A4F 5A 9D            [ 1] 4831 	ld (y),a 
      009A51 26               [ 1] 4832 	incw x 
      009A52 FA 20            [ 1] 4833 	incw y 
      009A54 04 72 11 54      [ 2] 4834 	cpw y,txtend 
      009A58 01 AE            [ 1] 4835 	jrmi 3$
                                   4836 ; print loaded size 	 
      009A5A 00 02 CD         [ 2] 4837 	ldw x,txtend 
      009A5D 90 86 81 1B      [ 2] 4838 	subw x,txtbgn
      009A60 CD 09 99         [ 4] 4839 	call print_int 
      009A60 A6               [ 4] 4840 	ret 
                                   4841 
                                   4842 ;-----------------------------------
                                   4843 ; BASIC: FORGET ["file_name"] 
                                   4844 ; erase file_name and all others 
                                   4845 ; after it. 
                                   4846 ; without argument erase all files 
                                   4847 ;-----------------------------------
      001C50                       4848 forget:
      009A61 09 CD 92         [ 4] 4849 	call next_token 
      009A64 38 CD            [ 1] 4850 	cp a,#TK_NONE 
      009A66 88 7A            [ 1] 4851 	jreq 3$ 
      009A68 A1 03            [ 1] 4852 	cp a,#TK_QSTR
      009A6A 27 03            [ 1] 4853 	jreq 1$
      009A6C CC 87 94         [ 2] 4854 	jp syntax_error
      009A6F 89 A6 0A CD      [ 2] 4855 1$: ldw y,basicptr
      009A73 92 38 85 A3      [ 2] 4856 	addw y,in.w
      009A77 00 10 25 05 A6   [ 1] 4857 	mov in,count 
      009A7C 0A CC 87         [ 4] 4858 	call search_file
      009A7F 96 9F            [ 1] 4859 	jrc 2$
      009A81 C7 54            [ 1] 4860 	ld a,#ERR_NOT_FILE 
      009A83 00 72 10         [ 2] 4861 	jp tb_error 
      001C75                       4862 2$: 
      009A86 54 01 72         [ 2] 4863 	ldw x,farptr
      009A89 0F 54 00         [ 1] 4864 	ld a,farptr+2
      009A8C FB CE            [ 2] 4865 	jra 4$ 
      001C7D                       4866 3$: ; forget all files 
      009A8E 54 04 A6         [ 2] 4867 	ldw x,#100
      009A91 03               [ 1] 4868 	clr a 
      009A92 81 00 13         [ 2] 4869 	ldw farptr,x 
      009A93 C7 00 15         [ 1] 4870 	ld farptr+2,a 
      001C87                       4871 4$:
      009A93 72 00 00         [ 2] 4872 	ldw ffree,x 
      009A96 25 02 4F         [ 1] 4873 	ld ffree+2,a 
      009A99 81 04            [ 1] 4874 	push #4
      009A9A 5F               [ 1] 4875 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      001C90                       4876 5$: 
      009A9A AE               [ 1] 4877 	clr a  
      009A9B 9A C4 CD         [ 4] 4878 	call write_byte 
      009A9E 82               [ 1] 4879 	incw x 
      009A9F 30 5B            [ 1] 4880 	dec (1,sp)
      009AA1 02 52            [ 1] 4881 	jrne 5$	
      009AA3 06               [ 1] 4882 6$: pop a 
      009AA4 CD               [ 4] 4883 	ret 
                                   4884 
                                   4885 ;----------------------
                                   4886 ; BASIC: DIR 
                                   4887 ; list saved files 
                                   4888 ;----------------------
                           000001  4889 	COUNT=1 ; files counter 
                           000002  4890 	VSIZE=2 
      001C9B                       4891 directory:
      001C9B                       4892 	_vars VSIZE 
      009AA5 96 E8            [ 2]    1     sub sp,#VSIZE 
      009AA7 AE               [ 1] 4893 	clrw x 
      009AA8 16 C8            [ 2] 4894 	ldw (COUNT,sp),x 
      009AAA CF 00 04         [ 2] 4895 	ldw farptr+1,x 
      009AAD 7F 72 5F 00      [ 1] 4896 	mov farptr,#1 
      001CA7                       4897 dir_loop:
      009AB1 03               [ 1] 4898 	clrw x 
      009AB2 5F CF 00 06      [ 5] 4899 	ldf a,([farptr],x)
      009AB6 CF 00            [ 1] 4900 	jreq 8$ 
      001CAE                       4901 1$: ;name loop 	
      009AB8 01 72 11 00      [ 5] 4902 	ldf a,([farptr],x)
      009ABC 25 72            [ 1] 4903 	jreq 2$ 
      009ABE 18 00 25         [ 4] 4904 	call putc 
      009AC1 CC               [ 1] 4905 	incw x 
      009AC2 88 4A            [ 2] 4906 	jra 1$
      009AC4 0A               [ 1] 4907 2$: incw x ; skip ending 0. 
      009AC5 62 72            [ 1] 4908 	ld a,#SPACE 
      009AC7 65 61 6B         [ 4] 4909 	call putc 
                                   4910 ; get file size 	
      009ACA 20 70 6F 69      [ 5] 4911 	ldf a,([farptr],x)
      009ACE 6E 74            [ 1] 4912 	ld yh,a 
      009AD0 2C               [ 1] 4913 	incw x 
      009AD1 20 52 55 4E      [ 5] 4914 	ldf a,([farptr],x)
      009AD5 20               [ 1] 4915 	incw x 
      009AD6 74 6F            [ 1] 4916 	ld yl,a 
      009AD8 20 72            [ 2] 4917 	pushw y 
      009ADA 65 73 75         [ 2] 4918 	addw x,(1,sp)
      009ADD 6D               [ 1] 4919 	incw x ; skip EOF marker 
                                   4920 ; skip to next file 
      009ADE 65 2E 0A         [ 4] 4921 	call incr_farptr 
                                   4922 ; print file size 
      009AE1 00               [ 2] 4923 	popw x ; file size 
      009AE2 CD 09 99         [ 4] 4924 	call print_int 
      009AE2 72 01            [ 1] 4925 	ld a,#CR 
      009AE4 00 25 02         [ 4] 4926 	call putc
      009AE7 4F 81            [ 2] 4927 	ldw x,(COUNT,sp)
      009AE9 5C               [ 1] 4928 	incw x
      009AE9 CD 86            [ 2] 4929 	ldw (COUNT,sp),x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009AEB 62 81            [ 2] 4930 	jra dir_loop 
      009AED                       4931 8$: ; print number of files 
      009AED 72 BB            [ 2] 4932 	ldw x,(COUNT,sp)
      009AEF 00 15 24         [ 4] 4933 	call print_int 
      009AF2 04 72 5C         [ 2] 4934 	ldw x,#file_count 
      009AF5 00 14 CF         [ 4] 4935 	call puts  
                                   4936 ; print drive free space 	
      009AF8 00 15            [ 1] 4937 	ld a,#0xff 
      009AFA 81 00 18         [ 1] 4938 	sub a,ffree+2 
      009AFB C7 00 0A         [ 1] 4939 	ld acc8,a 
      009AFB A6 01            [ 1] 4940 	ld a,#0x7f 
      009AFD C7 00 14         [ 1] 4941 	sbc a,ffree+1 
      009B00 5F CF 00         [ 1] 4942 	ld acc16,a 
      009B03 15 02            [ 1] 4943 	ld a,#2 
      009B04 C2 00 16         [ 1] 4944 	sbc a,ffree 
      009B04 AE 00 03         [ 1] 4945 	ld acc24,a 
      009B07 92               [ 1] 4946 	clrw x  
      009B08 AF 00            [ 1] 4947 	ld a,#6 
      009B0A 14               [ 1] 4948 	ld xl,a 
      009B0B 26 05            [ 1] 4949 	ld a,#10 
      009B0D 5A 2A F7         [ 4] 4950 	call prti24 
      009B10 20 19 5C         [ 2] 4951 	ldw x,#drive_free
      009B13 CD 9A ED         [ 4] 4952 	call puts 
      001D19                       4953 	_drop VSIZE 
      009B16 AE 02            [ 2]    1     addw sp,#VSIZE 
      009B18 7F               [ 4] 4954 	ret
      009B19 C3 00 14 2A E6 72 5F  4955 file_count: .asciz " files\n"
             00
      009B21 17 72 5F 00 18 72 5F  4956 drive_free: .asciz " bytes free\n" 
             00 19 81 65 0A 00
                                   4957 
                                   4958 ;---------------------
                                   4959 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   4960 ; write 1 or more byte to FLASH or EEPROM
                                   4961 ; starting at address  
                                   4962 ; input:
                                   4963 ;   expr1  	is address 
                                   4964 ;   expr2   is byte to write
                                   4965 ; output:
                                   4966 ;   none 
                                   4967 ;---------------------
                           000001  4968 	ADDR=1
                           000002  4969 	VSIZ=2 
      009B2B                       4970 write:
      001D31                       4971 	_vars VSIZE 
      009B2B CE 00            [ 2]    1     sub sp,#VSIZE 
      009B2D 14 C6 00 16      [ 1] 4972 	clr farptr ; expect 16 bits address 
      009B31 CF 00 17         [ 4] 4973 	call expression
      009B34 C7 00            [ 1] 4974 	cp a,#TK_INTGR 
      009B36 19 81            [ 1] 4975 	jreq 0$
      009B38 CC 07 14         [ 2] 4976 	jp syntax_error
      009B38 5F 92            [ 2] 4977 0$: ldw (ADDR,sp),x 
      009B3A AF 00 14         [ 4] 4978 	call next_token 
      009B3D 90 F1            [ 1] 4979 	cp a,#TK_COMMA 
      009B3F 26 08            [ 1] 4980 	jreq 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009B41 4D 27            [ 2] 4981 	jra 9$ 
      009B43 12 5C 90         [ 4] 4982 1$:	call expression
      009B46 5C 20            [ 1] 4983 	cp a,#TK_INTGR
      009B48 F0 03            [ 1] 4984 	jreq 2$
      009B49 CC 07 14         [ 2] 4985 	jp syntax_error
      009B49 4D               [ 1] 4986 2$:	ld a,xl 
      009B4A 27 07            [ 2] 4987 	ldw x,(ADDR,sp) 
      009B4C 5C 92 AF         [ 2] 4988 	ldw farptr+1,x 
      009B4F 00               [ 1] 4989 	clrw x 
      009B50 14 20 F6         [ 4] 4990 	call write_byte
      009B53 5C 98            [ 2] 4991 	ldw x,(ADDR,sp)
      009B55 81               [ 1] 4992 	incw x 
      009B56 20 DC            [ 2] 4993 	jra 0$ 
      001D65                       4994 9$:
      001D65                       4995 	_drop VSIZE
      009B56 5C 99            [ 2]    1     addw sp,#VSIZE 
      009B58 81               [ 4] 4996 	ret 
                                   4997 
                                   4998 
                                   4999 ;---------------------
                                   5000 ;BASIC: CHAR(expr)
                                   5001 ; évaluate expression 
                                   5002 ; and take the 7 least 
                                   5003 ; bits as ASCII character
                                   5004 ;---------------------
      009B59                       5005 char:
      009B59 52 04            [ 1] 5006 	ld a,#TK_LPAREN 
      009B5B 17 03 5F         [ 4] 5007 	call expect 
      009B5E CF 00 15         [ 4] 5008 	call relation 
      009B61 35 01            [ 1] 5009 	cp a,#TK_INTGR 
      009B63 00 14            [ 1] 5010 	jreq 1$
      009B65 CC 07 14         [ 2] 5011 	jp syntax_error
      009B65 92               [ 2] 5012 1$:	pushw x 
      009B66 BC 00            [ 1] 5013 	ld a,#TK_RPAREN 
      009B68 14 27 25         [ 4] 5014 	call expect
      009B6B 5F               [ 2] 5015 	popw x  
      009B6C 16               [ 1] 5016 	ld a,xl 
      009B6D 03 CD            [ 1] 5017 	and a,#0x7f 
      009B6F 9B               [ 1] 5018 	ld xl,a
      009B70 38 25            [ 1] 5019 	ld a,#TK_CHAR
      009B72 2D               [ 4] 5020 	ret
                                   5021 
                                   5022 ;---------------------
                                   5023 ; BASIC: ASC(string|char)
                                   5024 ; extract first character 
                                   5025 ; of string argument 
                                   5026 ; return it as TK_INTGR 
                                   5027 ;---------------------
      001D85                       5028 ascii:
      009B73 92 AF            [ 1] 5029 	ld a,#TK_LPAREN
      009B75 00 14 6B         [ 4] 5030 	call expect 
      009B78 01 5C 92         [ 4] 5031 	call next_token 
      009B7B AF 00            [ 1] 5032 	cp a,#TK_QSTR 
      009B7D 14 6B            [ 1] 5033 	jreq 1$
      009B7F 02 5C            [ 1] 5034 	cp a,#TK_CHAR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009B81 72 FB            [ 1] 5035 	jreq 2$ 
      009B83 01 5C CD         [ 2] 5036 	jp syntax_error
      001D98                       5037 1$: 
      009B86 9A               [ 1] 5038 	ld a,(x)
      009B87 ED AE            [ 2] 5039 	jra 3$
      001D9B                       5040 2$: 
      009B89 02               [ 1] 5041 	ld a,xl 
      009B8A 80               [ 1] 5042 3$:	ld xl,a 
      009B8B C3               [ 1] 5043 	clr a  
      009B8C 00               [ 1] 5044 	ld xh,a 
      009B8D 14               [ 2] 5045 	pushw x  
      009B8E 2A D5            [ 1] 5046 	ld a,#TK_RPAREN 
      009B90 CD 11 B8         [ 4] 5047 	call expect 
      009B90 72               [ 2] 5048 	popw x 
      009B91 5F 00            [ 1] 5049 	ld a,#TK_INTGR 
      009B93 14               [ 4] 5050 	ret 
                                   5051 
                                   5052 ;---------------------
                                   5053 ;BASIC: KEY
                                   5054 ; wait for a character 
                                   5055 ; received from STDIN 
                                   5056 ; input:
                                   5057 ;	none 
                                   5058 ; output:
                                   5059 ;	X 		ASCII character 
                                   5060 ;---------------------
      001DA9                       5061 key:
      009B94 72 5F 00         [ 4] 5062 	call getc 
      009B97 15               [ 1] 5063 	clrw x 
      009B98 72               [ 1] 5064 	ld xl,a 
      009B99 5F 00            [ 1] 5065 	ld a,#TK_INTGR
      009B9B 16               [ 4] 5066 	ret
                                   5067 
                                   5068 ;----------------------
                                   5069 ; BASIC: QKEY
                                   5070 ; Return true if there 
                                   5071 ; is a character in 
                                   5072 ; waiting in STDIN 
                                   5073 ; input:
                                   5074 ;  none 
                                   5075 ; output:
                                   5076 ;   X 		0|1 
                                   5077 ;-----------------------
      001DB1                       5078 qkey: 
      009B9C 5B               [ 1] 5079 	clrw x 
      009B9D 04 98 81 40 01   [ 2] 5080 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      009BA0 5C               [ 1] 5081 	incw x 
      009BA0 5B 04            [ 1] 5082 9$: ld a,#TK_INTGR
      009BA2 99               [ 4] 5083 	ret 
                                   5084 
                                   5085 ;---------------------
                                   5086 ; BASIC: GPIO(expr,reg)
                                   5087 ; return gpio address 
                                   5088 ; expr {0..8}
                                   5089 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



                                   5090 ;   none 
                                   5091 ; output:
                                   5092 ;   X 		gpio register address
                                   5093 ;----------------------------
      001DBB                       5094 gpio:
      009BA3 81 09            [ 1] 5095 	ld a,#TK_LPAREN 
      009BA4 CD 11 B8         [ 4] 5096 	call expect 
      009BA4 72 01 00         [ 4] 5097 	call arg_list
      009BA7 25 05            [ 1] 5098 	cp a,#2
      009BA9 A6 07            [ 1] 5099 	jreq 1$
      009BAB CC 87 96         [ 2] 5100 	jp syntax_error  
      009BAE                       5101 1$:	
      009BAE CE 00            [ 1] 5102 	ld a,#TK_RPAREN 
      009BB0 1E 72 B0         [ 4] 5103 	call expect 
      009BB3 00 1C 26         [ 2] 5104 	ldw x,#2
      009BB6 01 81 00 19      [ 5] 5105 	ldw x,([dstkptr],x) ; port 
      009BB8 2B 1B            [ 1] 5106 	jrmi bad_port
      009BB8 52 04 1F         [ 2] 5107 	cpw x,#9
      009BBB 01 CD            [ 1] 5108 	jrpl bad_port
      009BBD 88 7A            [ 1] 5109 	ld a,#5
      009BBF A1               [ 4] 5110 	mul x,a
      009BC0 08 27 03         [ 2] 5111 	addw x,#GPIO_BASE 
      009BC3 CC               [ 2] 5112 	pushw x 
      009BC4 87 94 A2         [ 4] 5113 	call dpop 
      009BC6 72 FB 01         [ 2] 5114 	addw x,(1,sp)
      009BC6 90 CE            [ 2] 5115 	ldw (1,sp),x  
      009BC8 00 04 72         [ 4] 5116 	call ddrop  
      009BCB B9               [ 2] 5117 	popw x 
      009BCC 00 01            [ 1] 5118 	ld a,#TK_INTGR
      009BCE 17               [ 4] 5119 	ret
      001DF3                       5120 bad_port:
      009BCF 03 55            [ 1] 5121 	ld a,#ERR_BAD_VALUE
      009BD1 00 03 00         [ 2] 5122 	jp tb_error
                                   5123 
                                   5124 ;----------------------
                                   5125 ; BASIC: ODR 
                                   5126 ; return offset of gpio
                                   5127 ; ODR register: 0
                                   5128 ; ---------------------
      001DF8                       5129 port_odr:
      009BD4 02 93 CD         [ 2] 5130 	ldw x,#GPIO_ODR
      009BD7 82 F2            [ 1] 5131 	ld a,#TK_INTGR
      009BD9 1C               [ 4] 5132 	ret
                                   5133 
                                   5134 ;----------------------
                                   5135 ; BASIC: IDR 
                                   5136 ; return offset of gpio
                                   5137 ; IDR register: 1
                                   5138 ; ---------------------
      001DFE                       5139 port_idr:
      009BDA 00 03 72         [ 2] 5140 	ldw x,#GPIO_IDR
      009BDD FB 01            [ 1] 5141 	ld a,#TK_INTGR
      009BDF 72               [ 4] 5142 	ret
                                   5143 
                                   5144 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                                   5145 ; BASIC: DDR 
                                   5146 ; return offset of gpio
                                   5147 ; DDR register: 2
                                   5148 ; ---------------------
      001E04                       5149 port_ddr:
      009BE0 5D 00 17         [ 2] 5150 	ldw x,#GPIO_DDR
      009BE3 26 0B            [ 1] 5151 	ld a,#TK_INTGR
      009BE5 72               [ 4] 5152 	ret
                                   5153 
                                   5154 ;----------------------
                                   5155 ; BASIC: CRL  
                                   5156 ; return offset of gpio
                                   5157 ; CR1 register: 3
                                   5158 ; ---------------------
      001E0A                       5159 port_cr1:
      009BE6 B0 00 18         [ 2] 5160 	ldw x,#GPIO_CR1
      009BE9 23 05            [ 1] 5161 	ld a,#TK_INTGR
      009BEB A6               [ 4] 5162 	ret
                                   5163 
                                   5164 ;----------------------
                                   5165 ; BASIC: CRH  
                                   5166 ; return offset of gpio
                                   5167 ; CR2 register: 4
                                   5168 ; ---------------------
      001E10                       5169 port_cr2:
      009BEC 01 CC 87         [ 2] 5170 	ldw x,#GPIO_CR2
      009BEF 96 03            [ 1] 5171 	ld a,#TK_INTGR
      009BF0 81               [ 4] 5172 	ret
                                   5173 
                                   5174 ;-------------------------
                                   5175 ; BASIC: UFLASH 
                                   5176 ; return user flash address
                                   5177 ; input:
                                   5178 ;  none 
                                   5179 ; output:
                                   5180 ;	A		TK_INTGR
                                   5181 ;   X 		user address 
                                   5182 ;---------------------------
      001E16                       5183 uflash:
      009BF0 16 03 CD         [ 2] 5184 	ldw x,#user_space 
      009BF3 9B 59            [ 1] 5185 	ld a,#TK_INTGR 
      009BF5 24               [ 4] 5186 	ret 
                                   5187 
                                   5188 ;-------------------------
                                   5189 ; BASIC: EEPROM 
                                   5190 ; return eeprom address
                                   5191 ; input:
                                   5192 ;  none 
                                   5193 ; output:
                                   5194 ;	A		TK_INTGR
                                   5195 ;   X 		eeprom address 
                                   5196 ;---------------------------
      001E1C                       5197 eeprom:
      009BF6 05 A6 08         [ 2] 5198 	ldw x,#EEPROM_BASE 
      009BF9 CC 87            [ 1] 5199 	ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009BFB 96               [ 4] 5200 	ret 
                                   5201 
                                   5202 ;---------------------
                                   5203 ; BASIC: USR(addr[,arg])
                                   5204 ; execute a function written 
                                   5205 ; in binary code.
                                   5206 ; binary fonction should 
                                   5207 ; return token attribute in A 
                                   5208 ; and value in X. 
                                   5209 ; input:
                                   5210 ;   addr	routine address 
                                   5211 ;   arg 	is an optional argument 
                                   5212 ; output:
                                   5213 ;   A 		token attribute 
                                   5214 ;   X       returned value 
                                   5215 ;---------------------
      009BFC                       5216 usr:
      009BFC CE 00            [ 2] 5217 	pushw y 	
      009BFE 17 C6            [ 1] 5218 	ld a,#TK_LPAREN 
      009C00 00 19 CF         [ 4] 5219 	call expect 
      009C03 00 14 C7         [ 4] 5220 	call arg_list 
      009C06 00 16            [ 1] 5221 	cp a,#1 
      009C08 1E 03            [ 1] 5222 	jrpl 2$ 
      009C0A CD 82 F2         [ 2] 5223 	jp syntax_error 
      009C0D 5C 1F            [ 1] 5224 2$: ld a,#TK_RPAREN
      009C0F 01 5F 16         [ 4] 5225 	call expect 
      009C12 03 CD 81         [ 4] 5226 	call dpop 
      009C15 D1 CE            [ 1] 5227 	cp a,#2 
      009C17 00 1E            [ 1] 5228 	jrmi 4$
      009C19 72 B0            [ 1] 5229 	ldw y,x ; y=arg 
      009C1B 00 1C 1F         [ 4] 5230 	call dpop ;x=addr 
      009C1E 01               [ 1] 5231 4$:	exgw y,x ; y=addr,x=arg 
      009C1F 5F 7B            [ 4] 5232 	call (y)
      009C21 01 CD            [ 2] 5233 	popw y 
      009C23 81               [ 4] 5234 	ret 
                                   5235 
                                   5236 ;------------------------------
                                   5237 ; BASIC: BYE 
                                   5238 ; halt mcu in its lowest power mode 
                                   5239 ; wait for reset or external interrupt
                                   5240 ; do a cold start on wakeup.
                                   5241 ;------------------------------
      001E4A                       5242 bye:
      009C24 5C 5C 7B 02 CD   [ 2] 5243 	btjf UART3_SR,#UART_SR_TC,.
      009C29 81               [10] 5244 	halt
      009C2A 5C 5C CD         [ 2] 5245 	jp cold_start  
                                   5246 
                                   5247 ;----------------------------------
                                   5248 ; BASIC: SLEEP 
                                   5249 ; halt mcu until reset or external
                                   5250 ; interrupt.
                                   5251 ; Resume progam after SLEEP command
                                   5252 ;----------------------------------
      001E53                       5253 sleep:
      009C2D 9A ED 1E 01 89   [ 2] 5254 	btjf UART3_SR,#UART_SR_TC,.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009C32 5F 90 CE 00      [ 1] 5255 	bset flags,#FSLEEP
      009C36 1C               [10] 5256 	halt 
      009C37 CD               [ 4] 5257 	ret 
                                   5258 
                                   5259 ;-------------------------------
                                   5260 ; BASIC: PAUSE expr 
                                   5261 ; suspend execution for n msec.
                                   5262 ; input:
                                   5263 ;	none
                                   5264 ; output:
                                   5265 ;	none 
                                   5266 ;------------------------------
      001E5E                       5267 pause:
      009C38 81 D1 5B         [ 4] 5268 	call expression
      009C3B 02 AE            [ 1] 5269 	cp a,#TK_INTGR
      009C3D 00 01            [ 1] 5270 	jreq pause02 
      009C3F A6 FF CD         [ 2] 5271 	jp syntax_error
      001E68                       5272 pause02: 
      009C42 81               [ 2] 5273 1$: tnzw x 
      009C43 5C CD            [ 1] 5274 	jreq 2$
      009C45 9A               [10] 5275 	wfi 
      009C46 ED               [ 2] 5276 	decw x 
      009C47 CE 00            [ 1] 5277 	jrne 1$
      009C49 14               [ 1] 5278 2$:	clr a 
      009C4A C6               [ 4] 5279 	ret 
                                   5280 
                                   5281 ;------------------------------
                                   5282 ; BASIC: TICKS
                                   5283 ; return msec ticks counter value 
                                   5284 ; input:
                                   5285 ; 	none 
                                   5286 ; output:
                                   5287 ;	X 		TK_INTGR
                                   5288 ;-------------------------------
      001E71                       5289 get_ticks:
      009C4B 00 16 CF         [ 2] 5290 	ldw x,ticks 
      009C4E 00 17            [ 1] 5291 	ld a,#TK_INTGR
      009C50 C7               [ 4] 5292 	ret 
                                   5293 
                                   5294 
                                   5295 
                                   5296 ;------------------------------
                                   5297 ; BASIC: ABS(expr)
                                   5298 ; return absolute value of expr.
                                   5299 ; input:
                                   5300 ;   none
                                   5301 ; output:
                                   5302 ;   X     	positive integer
                                   5303 ;-------------------------------
      001E77                       5304 abs:
      009C51 00 19            [ 1] 5305 	ld a,#TK_LPAREN
      009C53 5F 4B 04         [ 4] 5306 	call expect 
      009C56 CD 11 C5         [ 4] 5307 	call arg_list
      009C56 4F CD            [ 1] 5308 	cp a,#1 
      009C58 81 5C            [ 1] 5309 	jreq 0$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009C5A 5C 0A 01         [ 2] 5310 	jp syntax_error
      001E86                       5311 0$:  
      009C5D 26 F7            [ 1] 5312 	ld a,#TK_RPAREN 
      009C5F 84 1E 01         [ 4] 5313 	call expect 
      009C62 CD 8A 19         [ 4] 5314     call dpop   
      009C65 5B               [ 1] 5315 	ld a,xh 
      009C66 04 81            [ 1] 5316 	bcp a,#0x80 
      009C68 27 01            [ 1] 5317 	jreq 2$ 
      009C68 72               [ 2] 5318 	negw x 
      009C69 01 00            [ 1] 5319 2$: ld a,#TK_INTGR 
      009C6B 25               [ 4] 5320 	ret 
                                   5321 
                                   5322 ;------------------------------
                                   5323 ; BASIC: RND(expr)
                                   5324 ; return random number 
                                   5325 ; between 1 and expr inclusive
                                   5326 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   5327 ; input:
                                   5328 ; 	none 
                                   5329 ; output:
                                   5330 ;	X 		random positive integer 
                                   5331 ;------------------------------
      001E97                       5332 random:
      009C6C 07 27            [ 1] 5333 	ld a,#TK_LPAREN 
      009C6E 05 A6 07         [ 4] 5334 	call expect 
      009C71 CC 87 96         [ 4] 5335 	call arg_list 
      009C74 A1 01            [ 1] 5336 	cp a,#1
      009C74 CD 88            [ 1] 5337 	jreq 1$
      009C76 7A A1 08         [ 2] 5338 	jp syntax_error
      009C79 27 03            [ 1] 5339 1$: ld a,#TK_RPAREN
      009C7B CC 87 94         [ 4] 5340 	call expect 
      009C7E CD 0F A2         [ 4] 5341 	call dpop 
      009C7E 90               [ 2] 5342 	pushw x 
      009C7F CE               [ 1] 5343 	ld a,xh 
      009C80 00 04            [ 1] 5344 	bcp a,#0x80 
      009C82 72 B9            [ 1] 5345 	jreq 2$
      009C84 00 01            [ 1] 5346 	ld a,#ERR_BAD_VALUE
      009C86 55 00 03         [ 2] 5347 	jp tb_error
      001EB9                       5348 2$: 
                                   5349 ; acc16=(x<<5)^x 
      009C89 00 02 CD         [ 2] 5350 	ldw x,seedx 
      009C8C 9B               [ 2] 5351 	sllw x 
      009C8D 59               [ 2] 5352 	sllw x 
      009C8E 25               [ 2] 5353 	sllw x 
      009C8F 05               [ 2] 5354 	sllw x 
      009C90 A6               [ 2] 5355 	sllw x 
      009C91 09               [ 1] 5356 	ld a,xh 
      009C92 CC 87 96         [ 1] 5357 	xor a,seedx 
      009C95 C7 00 09         [ 1] 5358 	ld acc16,a 
      009C95 CD               [ 1] 5359 	ld a,xl 
      009C96 9A ED CD         [ 1] 5360 	xor a,seedx+1 
      009C99 86 62 5F         [ 1] 5361 	ld acc8,a 
                                   5362 ; seedx=seedy 
      009C9C 92 AF 00         [ 2] 5363 	ldw x,seedy 
      009C9F 14 90 95         [ 2] 5364 	ldw seedx,x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



                                   5365 ; seedy=seedy^(seedy>>1)
      009CA2 5C 92            [ 2] 5366 	srlw y 
      009CA4 AF 00            [ 1] 5367 	ld a,yh 
      009CA6 14 5C 90         [ 1] 5368 	xor a,seedy 
      009CA9 97 72 B9         [ 1] 5369 	ld seedy,a  
      009CAC 00 1C            [ 1] 5370 	ld a,yl 
      009CAE 90 CF 00         [ 1] 5371 	xor a,seedy+1 
      009CB1 1E 90 CE         [ 1] 5372 	ld seedy+1,a 
                                   5373 ; acc16>>3 
      009CB4 00 1C 09         [ 2] 5374 	ldw x,acc16 
      009CB6 54               [ 2] 5375 	srlw x 
      009CB6 92               [ 2] 5376 	srlw x 
      009CB7 AF               [ 2] 5377 	srlw x 
                                   5378 ; x=acc16^x 
      009CB8 00               [ 1] 5379 	ld a,xh 
      009CB9 14 90 F7         [ 1] 5380 	xor a,acc16 
      009CBC 5C               [ 1] 5381 	ld xh,a 
      009CBD 90               [ 1] 5382 	ld a,xl 
      009CBE 5C 90 C3         [ 1] 5383 	xor a,acc8 
      009CC1 00               [ 1] 5384 	ld xl,a 
                                   5385 ; seedy=x^seedy 
      009CC2 1E 2B F1         [ 1] 5386 	xor a,seedy+1
      009CC5 CE               [ 1] 5387 	ld xl,a 
      009CC6 00               [ 1] 5388 	ld a,xh 
      009CC7 1E 72 B0         [ 1] 5389 	xor a,seedy
      009CCA 00               [ 1] 5390 	ld xh,a 
      009CCB 1C CD 8A         [ 2] 5391 	ldw seedy,x 
                                   5392 ; return seedy modulo expr + 1 
      009CCE 19 81            [ 2] 5393 	popw y 
      009CD0 65               [ 2] 5394 	divw x,y 
      009CD0 CD               [ 1] 5395 	ldw x,y 
      009CD1 88               [ 1] 5396 	incw x 
      009CD2 7A A1            [ 1] 5397 	ld a,#TK_INTGR
      009CD4 00               [ 4] 5398 	ret 
                                   5399 
                                   5400 ;---------------------------------
                                   5401 ; BASIC: WORDS 
                                   5402 ; affiche la listes des mots du
                                   5403 ; dictionnaire.
                                   5404 ;---------------------------------
                           000001  5405 	WLEN=1
                           000002  5406 	LLEN=2  
                           000002  5407 	VSIZE=2 
      001F0B                       5408 words:
      001F0B                       5409 	_vars VSIZE
      009CD5 27 26            [ 2]    1     sub sp,#VSIZE 
      009CD7 A1 08            [ 1] 5410 	clr (LLEN,sp)
      009CD9 27 03 CC 87      [ 2] 5411 	ldw y,#kword_dict+2
      009CDD 94               [ 1] 5412 0$:	ldw x,y
      009CDE 90               [ 1] 5413 	ld a,(x)
      009CDF CE 00            [ 1] 5414 	and a,#15 
      009CE1 04 72            [ 1] 5415 	ld (WLEN,sp),a 
      009CE3 B9               [ 1] 5416 1$:	incw x 
      009CE4 00               [ 1] 5417 	ld a,(x)
      009CE5 01 55 00         [ 4] 5418 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009CE8 03 00            [ 1] 5419 	inc (LLEN,sp)
      009CEA 02 CD            [ 1] 5420 	dec (WLEN,sp)
      009CEC 9B 59            [ 1] 5421 	jrne 1$
      009CEE 25 05            [ 1] 5422 	ld a,#70
      009CF0 A6 09            [ 1] 5423 	cp a,(LLEN,sp)
      009CF2 CC 87            [ 1] 5424 	jrmi 2$   
      009CF4 96 20            [ 1] 5425 	ld a,#SPACE 
      009CF5 CD 01 9E         [ 4] 5426 	call putc 
      009CF5 CE 00            [ 1] 5427 	inc (LLEN,sp) 
      009CF7 14 C6            [ 2] 5428 	jra 3$
      009CF9 00 16            [ 1] 5429 2$: ld a,#CR 
      009CFB 20 0A 9E         [ 4] 5430 	call putc 
      009CFD 0F 02            [ 1] 5431 	clr (LLEN,sp)
      009CFD AE 00 64 4F      [ 2] 5432 3$:	subw y,#2 
      009D01 CF 00            [ 2] 5433 	ldw y,(y)
      009D03 14 C7            [ 1] 5434 	jrne 0$  
      001F42                       5435 	_drop VSIZE 
      009D05 00 16            [ 2]    1     addw sp,#VSIZE 
      009D07 81               [ 4] 5436 	ret 
                                   5437 
                                   5438 
                                   5439 ;*********************************
                                   5440 
                                   5441 ;------------------------------
                                   5442 ;      dictionary 
                                   5443 ; format:
                                   5444 ;   link:   2 bytes 
                                   5445 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5446 ;   cmd_name: 16 byte max 
                                   5447 ;   code_address: 2 bytes 
                                   5448 ;------------------------------
                           000080  5449 	FFUNC=128 ; function flag 
                                   5450 	.macro _dict_entry len,name,cmd 
                                   5451 	.word LINK 
                                   5452 	LINK=.
                                   5453 name:
                                   5454 	.byte len 	
                                   5455 	.ascii "name"
                                   5456 	.word cmd 
                                   5457 	.endm 
                                   5458 
                           000000  5459 	LINK=0
      001F45                       5460 kword_end:
      001F45                       5461 	_dict_entry,3,BYE,bye 
      009D07 CF 00                    1 	.word LINK 
                           001F47     2 	LINK=.
      001F47                          3 BYE:
      009D09 17                       4 	.byte 3 	
      009D0A C7 00 19                 5 	.ascii "BYE"
      009D0D 4B 04                    6 	.word bye 
      001F4D                       5462 	_dict_entry,5,WORDS,words 
      009D0F 5F 47                    1 	.word LINK 
                           001F4F     2 	LINK=.
      009D10                          3 WORDS:
      009D10 4F                       4 	.byte 5 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]



      009D11 CD 81 5C 5C 0A           5 	.ascii "WORDS"
      009D16 01 26                    6 	.word words 
      001F57                       5463 	_dict_entry,5,SLEEP,sleep 
      009D18 F7 84                    1 	.word LINK 
                           001F59     2 	LINK=.
      001F59                          3 SLEEP:
      009D1A 81                       4 	.byte 5 	
      009D1B 53 4C 45 45 50           5 	.ascii "SLEEP"
      009D1B 52 02                    6 	.word sleep 
      001F61                       5464 	_dict_entry,6,FORGET,forget 
      009D1D 5F 1F                    1 	.word LINK 
                           001F63     2 	LINK=.
      001F63                          3 FORGET:
      009D1F 01                       4 	.byte 6 	
      009D20 CF 00 15 35 01 00        5 	.ascii "FORGET"
      009D26 14 50                    6 	.word forget 
      009D27                       5465 	_dict_entry,3,DIR,directory 
      009D27 5F 92                    1 	.word LINK 
                           001F6E     2 	LINK=.
      001F6E                          3 DIR:
      009D29 AF                       4 	.byte 3 	
      009D2A 00 14 27                 5 	.ascii "DIR"
      009D2D 39 9B                    6 	.word directory 
      009D2E                       5466 	_dict_entry,4,LOAD,load 
      009D2E 92 AF                    1 	.word LINK 
                           001F76     2 	LINK=.
      001F76                          3 LOAD:
      009D30 00                       4 	.byte 4 	
      009D31 14 27 06 CD              5 	.ascii "LOAD"
      009D35 82 1E                    6 	.word load 
      001F7D                       5467 	_dict_entry,4,SAVE,save
      009D37 5C 20                    1 	.word LINK 
                           001F7F     2 	LINK=.
      001F7F                          3 SAVE:
      009D39 F4                       4 	.byte 4 	
      009D3A 5C A6 20 CD              5 	.ascii "SAVE"
      009D3E 82 1E                    6 	.word save 
      001F86                       5468 	_dict_entry,5,WRITE,write  
      009D40 92 AF                    1 	.word LINK 
                           001F88     2 	LINK=.
      001F88                          3 WRITE:
      009D42 00                       4 	.byte 5 	
      009D43 14 90 95 5C 92           5 	.ascii "WRITE"
      009D48 AF 00                    6 	.word write 
      001F90                       5469 	_dict_entry,3,NEW,new
      009D4A 14 5C                    1 	.word LINK 
                           001F92     2 	LINK=.
      001F92                          3 NEW:
      009D4C 90                       4 	.byte 3 	
      009D4D 97 90 89                 5 	.ascii "NEW"
      009D50 72 FB                    6 	.word new 
      001F98                       5470 	_dict_entry,5,BREAK,break 
      009D52 01 5C                    1 	.word LINK 
                           001F9A     2 	LINK=.
      001F9A                          3 BREAK:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]



      009D54 CD                       4 	.byte 5 	
      009D55 9A ED 85 CD 8A           5 	.ascii "BREAK"
      009D5A 19 A6                    6 	.word break 
      001FA2                       5471 	_dict_entry,4,BEEP,beep 
      009D5C 0D CD                    1 	.word LINK 
                           001FA4     2 	LINK=.
      001FA4                          3 BEEP:
      009D5E 82                       4 	.byte 4 	
      009D5F 1E 1E 01 5C              5 	.ascii "BEEP"
      009D63 1F 01                    6 	.word beep 
      001FAB                       5472 	_dict_entry,4,STOP,stop 
      009D65 20 C0                    1 	.word LINK 
                           001FAD     2 	LINK=.
      009D67                          3 STOP:
      009D67 1E                       4 	.byte 4 	
      009D68 01 CD 8A 19              5 	.ascii "STOP"
      009D6C AE 9D                    6 	.word stop 
      001FB4                       5473     _dict_entry,4,SHOW,show 
      009D6E 9C CD                    1 	.word LINK 
                           001FB6     2 	LINK=.
      001FB6                          3 SHOW:
      009D70 82                       4 	.byte 4 	
      009D71 30 A6 FF C0              5 	.ascii "SHOW"
      009D75 00 19                    6 	.word show 
      001FBD                       5474 	_dict_entry 3,RUN,run
      009D77 C7 00                    1 	.word LINK 
                           001FBF     2 	LINK=.
      001FBF                          3 RUN:
      009D79 0B                       4 	.byte 3 	
      009D7A A6 7F C2                 5 	.ascii "RUN"
      009D7D 00 18                    6 	.word run 
      001FC5                       5475 	_dict_entry 4,LIST,list
      009D7F C7 00                    1 	.word LINK 
                           001FC7     2 	LINK=.
      001FC7                          3 LIST:
      009D81 0A                       4 	.byte 4 	
      009D82 A6 02 C2 00              5 	.ascii "LIST"
      009D86 17 C7                    6 	.word list 
      001FCE                       5476 	_dict_entry,3+FFUNC,USR,usr
      009D88 00 09                    1 	.word LINK 
                           001FD0     2 	LINK=.
      001FD0                          3 USR:
      009D8A 5F                       4 	.byte 3+FFUNC 	
      009D8B A6 06 97                 5 	.ascii "USR"
      009D8E A6 0A                    6 	.word usr 
      001FD6                       5477 	_dict_entry,6+FFUNC,EEPROM,eeprom 
      009D90 CD 89                    1 	.word LINK 
                           001FD8     2 	LINK=.
      001FD8                          3 EEPROM:
      009D92 D1                       4 	.byte 6+FFUNC 	
      009D93 AE 9D A4 CD 82 30        5 	.ascii "EEPROM"
      009D99 5B 02                    6 	.word eeprom 
      001FE1                       5478 	_dict_entry,6+FFUNC,UFLASH,uflash 
      009D9B 81 20                    1 	.word LINK 
                           001FE3     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]



      001FE3                          3 UFLASH:
      009D9D 66                       4 	.byte 6+FFUNC 	
      009D9E 69 6C 65 73 0A 00        5 	.ascii "UFLASH"
      009DA4 20 62                    6 	.word uflash 
      001FEC                       5479 	_dict_entry,3+FFUNC,ODR,port_odr
      009DA6 79 74                    1 	.word LINK 
                           001FEE     2 	LINK=.
      001FEE                          3 ODR:
      009DA8 65                       4 	.byte 3+FFUNC 	
      009DA9 73 20 66                 5 	.ascii "ODR"
      009DAC 72 65                    6 	.word port_odr 
      001FF4                       5480 	_dict_entry,3+FFUNC,IDR,port_idr
      009DAE 65 0A                    1 	.word LINK 
                           001FF6     2 	LINK=.
      001FF6                          3 IDR:
      009DB0 00                       4 	.byte 3+FFUNC 	
      009DB1 49 44 52                 5 	.ascii "IDR"
      009DB1 52 02                    6 	.word port_idr 
      001FFC                       5481 	_dict_entry,3+FFUNC,DDR,port_ddr 
      009DB3 72 5F                    1 	.word LINK 
                           001FFE     2 	LINK=.
      001FFE                          3 DDR:
      009DB5 00                       4 	.byte 3+FFUNC 	
      009DB6 14 CD 93                 5 	.ascii "DDR"
      009DB9 3F A1                    6 	.word port_ddr 
      002004                       5482 	_dict_entry,3+FFUNC,CRL,port_cr1 
      009DBB 03 27                    1 	.word LINK 
                           002006     2 	LINK=.
      002006                          3 CRL:
      009DBD 03                       4 	.byte 3+FFUNC 	
      009DBE CC 87 94                 5 	.ascii "CRL"
      009DC1 1F 01                    6 	.word port_cr1 
      00200C                       5483 	_dict_entry,3+FFUNC,CRH,port_cr2
      009DC3 CD 88                    1 	.word LINK 
                           00200E     2 	LINK=.
      00200E                          3 CRH:
      009DC5 7A                       4 	.byte 3+FFUNC 	
      009DC6 A1 0B 27                 5 	.ascii "CRH"
      009DC9 02 20                    6 	.word port_cr2 
      002014                       5484 	_dict_entry,4+FFUNC,GPIO,gpio 
      009DCB 19 CD                    1 	.word LINK 
                           002016     2 	LINK=.
      002016                          3 GPIO:
      009DCD 93                       4 	.byte 4+FFUNC 	
      009DCE 3F A1 03 27              5 	.ascii "GPIO"
      009DD2 03 CC                    6 	.word gpio 
      00201D                       5485 	_dict_entry,6,PWRADC,power_adc 
      009DD4 87 94                    1 	.word LINK 
                           00201F     2 	LINK=.
      00201F                          3 PWRADC:
      009DD6 9F                       4 	.byte 6 	
      009DD7 1E 01 CF 00 15 5F        5 	.ascii "PWRADC"
      009DDD CD 81                    6 	.word power_adc 
      002028                       5486 	_dict_entry,5+FFUNC,RDADC,read_adc
      009DDF 5C 1E                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]



                           00202A     2 	LINK=.
      00202A                          3 RDADC:
      009DE1 01                       4 	.byte 5+FFUNC 	
      009DE2 5C 20 DC 44 43           5 	.ascii "RDADC"
      009DE5 19 E0                    6 	.word read_adc 
      002032                       5487 	_dict_entry,3+FFUNC,ASC,ascii  
      009DE5 5B 02                    1 	.word LINK 
                           002034     2 	LINK=.
      002034                          3 ASC:
      009DE7 81                       4 	.byte 3+FFUNC 	
      009DE8 41 53 43                 5 	.ascii "ASC"
      009DE8 A6 09                    6 	.word ascii 
      00203A                       5488 	_dict_entry,4+FFUNC,CHAR,char
      009DEA CD 92                    1 	.word LINK 
                           00203C     2 	LINK=.
      00203C                          3 CHAR:
      009DEC 38                       4 	.byte 4+FFUNC 	
      009DED CD 93 83 A1              5 	.ascii "CHAR"
      009DF1 03 27                    6 	.word char 
      002043                       5489 	_dict_entry,4+FFUNC,QKEY,qkey  
      009DF3 03 CC                    1 	.word LINK 
                           002045     2 	LINK=.
      002045                          3 QKEY:
      009DF5 87                       4 	.byte 4+FFUNC 	
      009DF6 94 89 A6 0A              5 	.ascii "QKEY"
      009DFA CD 92                    6 	.word qkey 
      00204C                       5490 	_dict_entry,3+FFUNC,KEY,key 
      009DFC 38 85                    1 	.word LINK 
                           00204E     2 	LINK=.
      00204E                          3 KEY:
      009DFE 9F                       4 	.byte 3+FFUNC 	
      009DFF A4 7F 97                 5 	.ascii "KEY"
      009E02 A6 02                    6 	.word key 
      002054                       5491 	_dict_entry,4+FFUNC,SIZE,size
      009E04 81 4E                    1 	.word LINK 
                           002056     2 	LINK=.
      009E05                          3 SIZE:
      009E05 A6                       4 	.byte 4+FFUNC 	
      009E06 09 CD 92 38              5 	.ascii "SIZE"
      009E0A CD 88                    6 	.word size 
      00205D                       5492 	_dict_entry,3,HEX,hex_base
      009E0C 7A A1                    1 	.word LINK 
                           00205F     2 	LINK=.
      00205F                          3 HEX:
      009E0E 08                       4 	.byte 3 	
      009E0F 27 07 A1                 5 	.ascii "HEX"
      009E12 02 27                    6 	.word hex_base 
      002065                       5493 	_dict_entry,3,DEC,dec_base
      009E14 06 CC                    1 	.word LINK 
                           002067     2 	LINK=.
      002067                          3 DEC:
      009E16 87                       4 	.byte 3 	
      009E17 94 45 43                 5 	.ascii "DEC"
      009E18 13 6F                    6 	.word dec_base 
      00206D                       5494 	_dict_entry,5+FFUNC,TICKS,get_ticks
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]



      009E18 F6 20                    1 	.word LINK 
                           00206F     2 	LINK=.
      00206F                          3 TICKS:
      009E1A 01                       4 	.byte 5+FFUNC 	
      009E1B 54 49 43 4B 53           5 	.ascii "TICKS"
      009E1B 9F 97                    6 	.word get_ticks 
      002077                       5495 	_dict_entry,3+FFUNC,ABS,abs
      009E1D 4F 95                    1 	.word LINK 
                           002079     2 	LINK=.
      002079                          3 ABS:
      009E1F 89                       4 	.byte 3+FFUNC 	
      009E20 A6 0A CD                 5 	.ascii "ABS"
      009E23 92 38                    6 	.word abs 
      00207F                       5496 	_dict_entry,3+FFUNC,RND,random 
      009E25 85 A6                    1 	.word LINK 
                           002081     2 	LINK=.
      002081                          3 RND:
      009E27 03                       4 	.byte 3+FFUNC 	
      009E28 81 4E 44                 5 	.ascii "RND"
      009E29 1E 97                    6 	.word random 
      002087                       5497 	_dict_entry,5,PAUSE,pause 
      009E29 CD 82                    1 	.word LINK 
                           002089     2 	LINK=.
      002089                          3 PAUSE:
      009E2B 27                       4 	.byte 5 	
      009E2C 5F 97 A6 03 81           5 	.ascii "PAUSE"
      009E31 1E 5E                    6 	.word pause 
      002091                       5498 	_dict_entry,4,BSET,bit_set 
      009E31 5F 72                    1 	.word LINK 
                           002093     2 	LINK=.
      002093                          3 BSET:
      009E33 0B                       4 	.byte 4 	
      009E34 52 40 01 5C              5 	.ascii "BSET"
      009E38 A6 03                    6 	.word bit_set 
      00209A                       5499 	_dict_entry,4,BRES,bit_reset
      009E3A 81 93                    1 	.word LINK 
                           00209C     2 	LINK=.
      009E3B                          3 BRES:
      009E3B A6                       4 	.byte 4 	
      009E3C 09 CD 92 38              5 	.ascii "BRES"
      009E40 CD 92                    6 	.word bit_reset 
      0020A3                       5500 	_dict_entry,5,BTOGL,bit_toggle
      009E42 45 A1                    1 	.word LINK 
                           0020A5     2 	LINK=.
      0020A5                          3 BTOGL:
      009E44 02                       4 	.byte 5 	
      009E45 27 03 CC 87 94           5 	.ascii "BTOGL"
      009E4A 17 60                    6 	.word bit_toggle 
      0020AD                       5501 	_dict_entry 4,WAIT,wait 
      009E4A A6 0A                    1 	.word LINK 
                           0020AF     2 	LINK=.
      0020AF                          3 WAIT:
      009E4C CD                       4 	.byte 4 	
      009E4D 92 38 AE 00              5 	.ascii "WAIT"
      009E51 02 72                    6 	.word wait 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]



      0020B6                       5502 	_dict_entry 6,REMARK,rem 
      009E53 DE 00                    1 	.word LINK 
                           0020B8     2 	LINK=.
      0020B8                          3 REMARK:
      009E55 1A                       4 	.byte 6 	
      009E56 2B 1B A3 00 09 2A        5 	.ascii "REMARK"
      009E5C 16 A6                    6 	.word rem 
      0020C1                       5503 	_dict_entry 5,PRINT,print 
      009E5E 05 42                    1 	.word LINK 
                           0020C3     2 	LINK=.
      0020C3                          3 PRINT:
      009E60 1C                       4 	.byte 5 	
      009E61 50 00 89 CD 90           5 	.ascii "PRINT"
      009E66 22 72                    6 	.word print 
      0020CB                       5504 	_dict_entry,2,IF,if 
      009E68 FB 01                    1 	.word LINK 
                           0020CD     2 	LINK=.
      0020CD                          3 IF:
      009E6A 1F                       4 	.byte 2 	
      009E6B 01 CD                    5 	.ascii "IF"
      009E6D 90 49                    6 	.word if 
      0020D2                       5505 	_dict_entry,5,GOSUB,gosub 
      009E6F 85 A6                    1 	.word LINK 
                           0020D4     2 	LINK=.
      0020D4                          3 GOSUB:
      009E71 03                       4 	.byte 5 	
      009E72 81 4F 53 55 42           5 	.ascii "GOSUB"
      009E73 18 BA                    6 	.word gosub 
      0020DC                       5506 	_dict_entry,4,GOTO,goto 
      009E73 A6 0A                    1 	.word LINK 
                           0020DE     2 	LINK=.
      0020DE                          3 GOTO:
      009E75 CC                       4 	.byte 4 	
      009E76 87 96 54 4F              5 	.ascii "GOTO"
      009E78 18 AD                    6 	.word goto 
      0020E5                       5507 	_dict_entry,3,FOR,for 
      009E78 AE 00                    1 	.word LINK 
                           0020E7     2 	LINK=.
      0020E7                          3 FOR:
      009E7A 00                       4 	.byte 3 	
      009E7B A6 03 81                 5 	.ascii "FOR"
      009E7E 17 B8                    6 	.word for 
      0020ED                       5508 	_dict_entry,2,TO,to
      009E7E AE 00                    1 	.word LINK 
                           0020EF     2 	LINK=.
      0020EF                          3 TO:
      009E80 01                       4 	.byte 2 	
      009E81 A6 03                    5 	.ascii "TO"
      009E83 81 E2                    6 	.word to 
      009E84                       5509 	_dict_entry,4,STEP,step 
      009E84 AE 00                    1 	.word LINK 
                           0020F6     2 	LINK=.
      0020F6                          3 STEP:
      009E86 02                       4 	.byte 4 	
      009E87 A6 03 81 50              5 	.ascii "STEP"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]



      009E8A 18 12                    6 	.word step 
      0020FD                       5510 	_dict_entry,4,NEXT,next 
      009E8A AE 00                    1 	.word LINK 
                           0020FF     2 	LINK=.
      0020FF                          3 NEXT:
      009E8C 03                       4 	.byte 4 	
      009E8D A6 03 81 54              5 	.ascii "NEXT"
      009E90 18 3A                    6 	.word next 
      002106                       5511 	_dict_entry,6+FFUNC,UBOUND,ubound 
      009E90 AE 00                    1 	.word LINK 
                           002108     2 	LINK=.
      002108                          3 UBOUND:
      009E92 04                       4 	.byte 6+FFUNC 	
      009E93 A6 03 81 55 4E 44        5 	.ascii "UBOUND"
      009E96 13 7E                    6 	.word ubound 
      002111                       5512 	_dict_entry,6,RETURN,return 
      009E96 AE A2                    1 	.word LINK 
                           002113     2 	LINK=.
      002113                          3 RETURN:
      009E98 00                       4 	.byte 6 	
      009E99 A6 03 81 55 52 4E        5 	.ascii "RETURN"
      009E9C 19 03                    6 	.word return 
      00211C                       5513 	_dict_entry,4+FFUNC,PEEK,peek 
      009E9C AE 40                    1 	.word LINK 
                           00211E     2 	LINK=.
      00211E                          3 PEEK:
      009E9E 00                       4 	.byte 4+FFUNC 	
      009E9F A6 03 81 4B              5 	.ascii "PEEK"
      009EA2 17 87                    6 	.word peek 
      002125                       5514 	_dict_entry,4,POKE,poke 
      009EA2 90 89                    1 	.word LINK 
                           002127     2 	LINK=.
      002127                          3 POKE:
      009EA4 A6                       4 	.byte 4 	
      009EA5 09 CD 92 38              5 	.ascii "POKE"
      009EA9 CD 92                    6 	.word poke 
      00212E                       5515 	_dict_entry,5,INPUT,input_var  
      009EAB 45 A1                    1 	.word LINK 
                           002130     2 	LINK=.
      002130                          3 INPUT:
      009EAD 01                       4 	.byte 5 	
      009EAE 2A 03 CC 87 94           5 	.ascii "INPUT"
      009EB3 A6 0A                    6 	.word input_var 
      002138                       5516 kword_dict:
      002138                       5517 	_dict_entry 3,LET,let 
      009EB5 CD 92                    1 	.word LINK 
                           00213A     2 	LINK=.
      00213A                          3 LET:
      009EB7 38                       4 	.byte 3 	
      009EB8 CD 90 22                 5 	.ascii "LET"
      009EBB A1 02                    6 	.word let 
                                   5518 	
                                   5519 
      002180                       5520 	.bndry 128 ; align on FLASH block.
                                   5521 ; free space for user application  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]



      002180                       5522 user_space:
                                   5523 ; USR() function test
      009EBD 2B               [ 2] 5524 	pushw x 
      009EBE 05 90 93 CD      [ 1] 5525 	bset PC_ODR,#5 
      009EC2 90               [ 2] 5526 	popw x 
      009EC3 22 51 90         [ 4] 5527 	call pause02 
      009EC6 FD 90 85 81      [ 1] 5528 	bres PC_ODR,#5 
      009ECA 81               [ 4] 5529 	ret
                                   5530 
                                   5531 	.area FLASH_DRIVE (ABS)
      010000                       5532 	.org 0x10000
      010000                       5533 fdrive:
                                   5534 ;.byte 0,0,0,0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        002079 R   |     ADC_CR1 =  005401 
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
    ARG_OFS =  000002     |   5 ASC        002034 R   |     ATTRIB  =  000002 
    AWU_APR =  0050F1     |     AWU_CSR1=  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BASE_SAV=  000001     |   5 BEEP       001FA4 R
    BEEP_BIT=  000004     |     BEEP_CSR=  0050F3     |     BEEP_MAS=  000010 
    BEEP_POR=  00000F     |     BELL    =  000007     |     BINARY  =  000001 
    BIT0    =  000000     |     BIT1    =  000001     |     BIT2    =  000002 
    BIT3    =  000003     |     BIT4    =  000004     |     BIT5    =  000005 
    BIT6    =  000006     |     BIT7    =  000007     |     BLOCK_ER=  000000 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  000005     |   5 BREAK      001F9A R   |   5 BRES       00209C R
  5 BSET       002093 R   |     BSIZE   =  000001     |     BSP     =  000008 
  5 BTOGL      0020A5 R   |     BTW     =  000001     |     BUFIDX  =  000003 
  5 BYE        001F47 R   |     C       =  000001     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000000     |   5 CHAR       00203C R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
    CLK_ECKR=  000001     |     CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0 
    CLK_ICKR=  000002     |     CLK_ICKR=  000000     |     CLK_ICKR=  000001 
    CLK_ICKR=  000003     |     CLK_ICKR=  000004     |     CLK_ICKR=  000005 
    CLK_PCKE=  0050C7     |     CLK_PCKE=  000000     |     CLK_PCKE=  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
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
  5 CRH        00200E R   |   5 CRL        002006 R   |     CTRL_A  =  000001 
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
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        001FFE R
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        002067 R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        001F6E R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
    DSTACK_S=  000040     |   5 EEPROM     001FD8 R   |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |     EOF     =  0000FF 
    ERR_BAD_=  00000A     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_L=  000005     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
    FBREAK  =  000004     |     FCOMP   =  000005     |     FF      =  00000C 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 115.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_IA=  000000     |     FLASH_NC=  00505C     |     FLASH_NF=  00505E 
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLSI    =  01F400 
  5 FOR        0020E7 R   |   5 FORGET     001F63 R   |     FRUN    =  000000 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FTRAP   =  000001 
  5 GOSUB      0020D4 R   |     GOS_RET =  000003     |   5 GOTO       0020DE R
  5 GPIO       002016 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   5 HEX        00205F R
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
    I2C_WRIT=  000000     |   5 IDR        001FF6 R   |   5 IF         0020CD R
    IN      =  000007     |     INCR    =  000001     |   5 INPUT      002130 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 116.
Hexadecimal [24-Bits]

Symbol Table

    ITC_SPR1=  007F70     |     ITC_SPR2=  007F71     |     ITC_SPR3=  007F72 
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        00204E R
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  5 LET        00213A R   |     LINENO  =  000005     |   5 LINK    =  00213A R
  5 LIST       001FC7 R   |     LL      =  000002     |     LLEN    =  000002 
    LL_HB   =  000001     |     LNO     =  000005     |     LN_PTR  =  000005 
  5 LOAD       001F76 R   |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MINOR   =  000000     |     MULOP   =  000005 
    N1      =  000001     |     N1_HB   =  000006     |     N1_LB   =  000007 
    N2      =  000003     |     N2_HB   =  000008     |     N2_LB   =  000009 
    NAFR    =  004804     |     NAMEPTR =  000003     |     NCLKOPT =  004808 
    NEG     =  000001     |   5 NEW        001F92 R   |   5 NEXT       0020FF R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NL      =  00000A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000009 R   |   5 ODR        001FEE R   |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |     PAD_SIZE=  000028 
  5 PAUSE      002089 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   5 PEEK       00211E R
    PE_BASE =  005014     |     PE_CR1  =  005017     |     PE_CR2  =  005018 
    PE_DDR  =  005016     |     PE_IDR  =  005015     |     PE_ODR  =  005014 
    PF      =  000019     |     PF_BASE =  005019     |     PF_CR1  =  00501C 
    PF_CR2  =  00501D     |     PF_DDR  =  00501B     |     PF_IDR  =  00501A 
    PF_ODR  =  005019     |     PG      =  00001E     |     PG_BASE =  00501E 
    PG_CR1  =  005021     |     PG_CR2  =  005022     |     PG_DDR  =  005020 
    PG_IDR  =  00501F     |     PG_ODR  =  00501E     |     PH      =  000023 
    PH_BASE =  005023     |     PH_CR1  =  005026     |     PH_CR2  =  005027 
    PH_DDR  =  005025     |     PH_IDR  =  005024     |     PH_ODR  =  005023 
    PI      =  000028     |     PI_BASE =  005028     |     PI_CR1  =  00502B 
    PI_CR2  =  00502C     |     PI_DDR  =  00502A     |     PI_IDR  =  005029 
    PI_ODR  =  005028     |   5 POKE       002127 R   |     PREV    =  000001 
  5 PRINT      0020C3 R   |     PROD    =  000002     |     PSIZE   =  000001 
  5 PWRADC     00201F R   |   5 QKEY       002045 R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 RDADC      00202A R
  5 REG_A      000943 R   |   5 REG_CC     000947 R   |   5 REG_EPC    000936 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 117.
Hexadecimal [24-Bits]

Symbol Table

  5 REG_SP     00094C R   |   5 REG_X      00093F R   |   5 REG_Y      00093B R
    RELOP   =  000005     |   5 REMARK     0020B8 R   |     RETL1   =  000001 
  5 RETURN     002113 R   |   5 RND        002081 R   |     ROP     =  004800 
    RST_SR  =  0050B3     |   5 RUN        001FBF R   |     RXCHAR  =  000001 
    R_A     =  000007     |     R_CC    =  000008     |     R_X     =  000005 
    R_Y     =  000003     |   5 SAVE       001F7F R   |     SDIVD   =  000002 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       001FB6 R   |     SIGN    =  000001     |   5 SIZE       002056 R
    SKIP    =  000006     |   5 SLEEP      001F59 R   |     SPACE   =  000020 
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SQUOT   =  000001 
    SRC     =  000003     |     STACK_EM=  0017FF     |     STACK_SI=  000080 
  5 STATES     0008F9 R   |   5 STEP       0020F6 R   |   5 STOP       001FAD R
    SWIM_CSR=  007F80     |     TAB     =  000009     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      00206F R   |     TIM1_ARR=  005262 
    TIM1_ARR=  005263     |     TIM1_BKR=  00526D     |     TIM1_CCE=  00525C 
    TIM1_CCE=  00525D     |     TIM1_CCM=  005258     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000003     |     TIM1_CCM=  005259     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000003     |     TIM1_CCM=  00525A     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000003     |     TIM1_CCM=  00525B     |     TIM1_CCM=  000000 
    TIM1_CCM=  000001     |     TIM1_CCM=  000004     |     TIM1_CCM=  000005 
    TIM1_CCM=  000006     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000003     |     TIM1_CCM=  000007     |     TIM1_CCM=  000002 
    TIM1_CCM=  000004     |     TIM1_CCM=  000005     |     TIM1_CCM=  000006 
    TIM1_CCM=  000003     |     TIM1_CCR=  005265     |     TIM1_CCR=  005266 
    TIM1_CCR=  005267     |     TIM1_CCR=  005268     |     TIM1_CCR=  005269 
    TIM1_CCR=  00526A     |     TIM1_CCR=  00526B     |     TIM1_CCR=  00526C 
    TIM1_CNT=  00525E     |     TIM1_CNT=  00525F     |     TIM1_CR1=  005250 
    TIM1_CR2=  005251     |     TIM1_CR2=  000000     |     TIM1_CR2=  000002 
    TIM1_CR2=  000004     |     TIM1_CR2=  000005     |     TIM1_CR2=  000006 
    TIM1_DTR=  00526E     |     TIM1_EGR=  005257     |     TIM1_EGR=  000007 
    TIM1_EGR=  000001     |     TIM1_EGR=  000002     |     TIM1_EGR=  000003 
    TIM1_EGR=  000004     |     TIM1_EGR=  000005     |     TIM1_EGR=  000006 
    TIM1_EGR=  000000     |     TIM1_ETR=  005253     |     TIM1_ETR=  000006 
    TIM1_ETR=  000000     |     TIM1_ETR=  000001     |     TIM1_ETR=  000002 
    TIM1_ETR=  000003     |     TIM1_ETR=  000007     |     TIM1_ETR=  000004 
    TIM1_ETR=  000005     |     TIM1_IER=  005254     |     TIM1_IER=  000007 
    TIM1_IER=  000001     |     TIM1_IER=  000002     |     TIM1_IER=  000003 
    TIM1_IER=  000004     |     TIM1_IER=  000005     |     TIM1_IER=  000006 
    TIM1_IER=  000000     |     TIM1_OIS=  00526F     |     TIM1_PSC=  005260 
    TIM1_PSC=  005261     |     TIM1_RCR=  005264     |     TIM1_SMC=  005252 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 118.
Hexadecimal [24-Bits]

Symbol Table

    TIM1_SMC=  000007     |     TIM1_SMC=  000000     |     TIM1_SMC=  000001 
    TIM1_SMC=  000002     |     TIM1_SMC=  000004     |     TIM1_SMC=  000005 
    TIM1_SMC=  000006     |     TIM1_SR1=  005255     |     TIM1_SR1=  000007 
    TIM1_SR1=  000001     |     TIM1_SR1=  000002     |     TIM1_SR1=  000003 
    TIM1_SR1=  000004     |     TIM1_SR1=  000005     |     TIM1_SR1=  000006 
    TIM1_SR1=  000000     |     TIM1_SR2=  005256     |     TIM1_SR2=  000001 
    TIM1_SR2=  000002     |     TIM1_SR2=  000003     |     TIM1_SR2=  000004 
    TIM2_ARR=  00530D     |     TIM2_ARR=  00530E     |     TIM2_CCE=  005308 
    TIM2_CCE=  005309     |     TIM2_CCM=  005305     |     TIM2_CCM=  005306 
    TIM2_CCM=  005307     |     TIM2_CCR=  00530F     |     TIM2_CCR=  005310 
    TIM2_CCR=  005311     |     TIM2_CCR=  005312     |     TIM2_CCR=  005313 
    TIM2_CCR=  005314     |     TIM2_CNT=  00530A     |     TIM2_CNT=  00530B 
    TIM2_CR1=  005300     |     TIM2_EGR=  005304     |     TIM2_IER=  005301 
    TIM2_PSC=  00530C     |     TIM2_SR1=  005302     |     TIM2_SR2=  005303 
    TIM3_ARR=  00532B     |     TIM3_ARR=  00532C     |     TIM3_CCE=  005327 
    TIM3_CCE=  000000     |     TIM3_CCE=  000001     |     TIM3_CCE=  000004 
    TIM3_CCE=  000005     |     TIM3_CCE=  000000     |     TIM3_CCE=  000001 
    TIM3_CCM=  005325     |     TIM3_CCM=  005326     |     TIM3_CCM=  000000 
    TIM3_CCM=  000004     |     TIM3_CCM=  000003     |     TIM3_CCR=  00532D 
    TIM3_CCR=  00532E     |     TIM3_CCR=  00532F     |     TIM3_CCR=  005330 
    TIM3_CNT=  005328     |     TIM3_CNT=  005329     |     TIM3_CR1=  005320 
    TIM3_CR1=  000007     |     TIM3_CR1=  000000     |     TIM3_CR1=  000003 
    TIM3_CR1=  000001     |     TIM3_CR1=  000002     |     TIM3_EGR=  005324 
    TIM3_IER=  005321     |     TIM3_PSC=  00532A     |     TIM3_SR1=  005322 
    TIM3_SR2=  005323     |     TIM4_ARR=  005346     |     TIM4_CNT=  005344 
    TIM4_CR1=  005340     |     TIM4_CR1=  000007     |     TIM4_CR1=  000000 
    TIM4_CR1=  000003     |     TIM4_CR1=  000001     |     TIM4_CR1=  000002 
    TIM4_EGR=  005343     |     TIM4_EGR=  000000     |     TIM4_IER=  005341 
    TIM4_IER=  000000     |     TIM4_PSC=  005345     |     TIM4_PSC=  000000 
    TIM4_PSC=  000007     |     TIM4_PSC=  000004     |     TIM4_PSC=  000001 
    TIM4_PSC=  000005     |     TIM4_PSC=  000002     |     TIM4_PSC=  000006 
    TIM4_PSC=  000003     |     TIM4_PSC=  000000     |     TIM4_PSC=  000001 
    TIM4_PSC=  000002     |     TIM4_SR =  005342     |     TIM4_SR_=  000000 
    TIM_CR1_=  000007     |     TIM_CR1_=  000000     |     TIM_CR1_=  000006 
    TIM_CR1_=  000005     |     TIM_CR1_=  000004     |     TIM_CR1_=  000003 
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_ARRAY=  000005 
    TK_CHAR =  000002     |     TK_CMD  =  000006     |     TK_COLON=  000001 
    TK_COMMA=  00000B     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_FUNC =  000007     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_INTGR=  000003 
    TK_LE   =  000036     |     TK_LPARE=  000009     |     TK_LT   =  000034 
    TK_MINUS=  000011     |     TK_MOD  =  000022     |     TK_MULT =  000020 
    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_PLUS =  000010 
    TK_QSTR =  000008     |     TK_RPARE=  00000A     |     TK_SHARP=  00000C 
    TK_VAR  =  000004     |   5 TO         0020EF R   |   5 Timer4Up   000019 R
  5 TrapHand   00000A R   |     U8      =  000003     |     UART1   =  000000 
    UART1_BA=  005230     |     UART1_BR=  005232     |     UART1_BR=  005233 
    UART1_CR=  005234     |     UART1_CR=  005235     |     UART1_CR=  005236 
    UART1_CR=  005237     |     UART1_CR=  005238     |     UART1_DR=  005231 
    UART1_GT=  005239     |     UART1_PO=  000000     |     UART1_PS=  00523A 
    UART1_RX=  000004     |     UART1_SR=  005230     |     UART1_TX=  000005 
    UART3   =  000001     |     UART3_BA=  005240     |     UART3_BR=  005242 
    UART3_BR=  005243     |     UART3_CR=  005244     |     UART3_CR=  005245 
    UART3_CR=  005246     |     UART3_CR=  005247     |     UART3_CR=  004249 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 119.
Hexadecimal [24-Bits]

Symbol Table

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
    UBC     =  004801     |   5 UBOUND     002108 R   |   5 UFLASH     001FE3 R
  5 USER_ABO   00007E R   |   5 USR        001FD0 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 UserButt   000025 R
    VSIZ    =  000002     |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       0020AF R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |     WIDTH_SA=  000002     |     WLEN    =  000001 
  5 WORDS      001F4F R   |   5 WRITE      001F88 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XADR    =  000001     |     XMASK   =  000001 
    XSAVE   =  000003     |     YSAVE   =  000003     |   5 abs        001E77 R
  1 acc16      000009 R   |   1 acc24      000008 R   |   1 acc8       00000A R
  5 accept_c   000AF1 R   |   5 add        001083 R   |   5 ansi_seq   000AAF R
  5 arg_list   0011C5 R   |   1 array_ad   000020 R   |   1 array_si   000022 R
  5 ascii      001D85 R   |   5 at_tst     000DBC R   |   5 atoi24     000ECF R
  5 atoi_exi   000F3D R   |   5 bad_port   001DF3 R   |   1 base       000007 R
  1 basicptr   000003 R   |   5 beep       00197D R   |   5 bin_exit   000CC2 R
  5 bit_rese   00174B R   |   5 bit_set    001737 R   |   5 bit_togg   001760 R
  5 bkslsh_t   000D67 R   |   5 bksp       0001BA R   |   5 break      001A13 R
  5 break_po   001A44 R   |   5 bye        001E4A R   |   5 char       001D68 R
  5 check_fu   0003E4 R   |   5 clear_ba   0005E2 R   |   5 clear_va   0004F2 R
  5 clock_in   000099 R   |   5 cmd_itf    000B15 R   |   5 cmd_name   00112E R
  5 cmp_name   001AB8 R   |   5 cold_sta   000557 R   |   5 colon_ts   000D90 R
  5 comma_ts   000D9B R   |   5 compile    0003F3 R   |   5 convert_   000C4A R
  1 count      000002 R   |   5 cp_loop    001171 R   |   5 create_g   000343 R
  5 cstk_pro   00104D R   |   5 dash_tst   000DB1 R   |   5 ddrop      000FC9 R
  5 ddrop_n    001006 R   |   5 ddup       000FD2 R   |   5 dec_base   00136F R
  5 del_back   000AE2 R   |   5 del_line   00030B R   |   5 del_ln     000AD3 R
  5 delete     0001CA R   |   5 dir_loop   001CA7 R   |   5 director   001C9B R
  5 divide     0010D9 R   |   5 divu24_8   000A3C R   |   5 dotr       001056 R
  5 dotr_loo   00106B R   |   5 dots       001023 R   |   5 dpick      000FE3 R
  5 dpop       000FA2 R   |   5 dpush      000F95 R   |   5 drive_fr   001D24 R
  3 dstack     001740 R   |   3 dstack_u   001780 R   |   5 dstk_pro   001019 R
  1 dstkptr    000019 R   |   5 dswap      000FAF R   |   5 eeprom     001E1C R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 120.
Hexadecimal [24-Bits]

Symbol Table

  5 eql_tst    000E1C R   |   5 equal      0015EB R   |   5 err_bad_   0006C3 R
  5 err_cmd_   000684 R   |   5 err_div0   000646 R   |   5 err_dupl   00069F R
  5 err_math   00062C R   |   5 err_mem_   00060F R   |   5 err_msg    0005F7 R
  5 err_no_a   0006D0 R   |   5 err_no_l   000656 R   |   5 err_not_   0006B1 R
  5 err_run_   00066D R   |   5 err_synt   00061D R   |   5 escaped    000C5F R
  5 expect     0011B8 R   |   5 expr_exi   001300 R   |   5 expressi   0012BF R
  5 factor     00121C R   |   1 farptr     000013 R   |   7 fdrive     010000 R
  5 fetch      000FF2 R   |   5 fetchc     000C02 R   |   1 ffree      000016 R
  5 file_cou   001D1C R   |   5 final_te   000AA9 R   |   5 first_li   0013DF R
  1 flags      000024 R   |   5 for        0017B8 R   |   5 forget     001C50 R
  1 free_ram   00005A R   |   5 ge         0015ED R   |   5 get_arra   0011E9 R
  5 get_tick   001E71 R   |   5 get_toke   000D04 R   |   5 getc       0001A7 R
  5 go_commo   0018DD R   |   5 gosub      0018BA R   |   5 goto       0018AD R
  5 gpio       001DBB R   |   5 gt         0015E9 R   |   5 gt_tst     000E27 R
  5 hex_base   00136A R   |   5 hse_cloc   000187 R   |   5 hsi_cloc   000191 R
  5 if         0017A4 R   |   1 in         000001 R   |   1 in.w       000000 R
  1 in.w.sav   000011 R   |   5 incr_far   001A6D R   |   5 input_ex   001703 R
  5 input_lo   00169E R   |   5 input_va   001692 R   |   5 insert_l   00037C R
  5 insert_l   0003E1 R   |   5 interp     000786 R   |   5 interp_l   0007CA R
  5 invalid    000B5A R   |   5 invalid_   000BD8 R   |   5 is_alpha   000500 R
  5 is_digit   000EBA R   |   5 itoa       0009F5 R   |   5 itoa_loo   000A0D R
  5 key        001DA9 R   |   5 kword_di   002138 R   |   5 kword_en   001F45 R
  5 last_lin   0013E8 R   |   5 le         0015F2 R   |   5 ledoff     000849 R
  5 ledon      000844 R   |   5 ledtoggl   00084E R   |   5 left_arr   000AAF R
  5 left_par   000857 R   |   5 let        00138C R   |   5 let02      001396 R
  1 lineno     000005 R   |   5 lines_sk   0013ED R   |   5 list       0013B4 R
  5 list_exi   001434 R   |   5 list_sta   001410 R   |   5 load       001BE8 R
  5 loop_bac   001882 R   |   1 loop_dep   00001F R   |   5 loop_don   00189B R
  5 lt         0015F0 R   |   5 lt_tst     000E60 R   |   5 mem_peek   000B77 R
  5 modulo     00111D R   |   5 move       00029E R   |   5 move_dow   0002BC R
  5 move_exi   0002DD R   |   5 move_loo   0002C1 R   |   5 move_up    0002AE R
  5 mul_char   0015DA R   |   5 multiply   001091 R   |   5 mulu24_8   000F41 R
  5 nbr_tst    000D3D R   |   5 ne         0015F5 R   |   5 neg_acc2   000A64 R
  5 new        001A62 R   |   5 next       00183A R   |   5 next_tok   0007FA R
  5 no_match   001183 R   |   5 none       000D04 R   |   5 number     000C08 GR
  5 other      000E98 R   |   3 pad        001718 R   |   5 parse_bi   000CA2 R
  5 parse_in   000C67 R   |   5 parse_ke   000CCA R   |   5 parse_qu   000C0F R
  5 pause      001E5E R   |   5 pause02    001E68 R   |   5 peek       001787 R
  5 peek_byt   000BA2 R   |   5 plus_tst   000DF0 R   |   5 poke       001774 R
  5 port_cr1   001E0A R   |   5 port_cr2   001E10 R   |   5 port_ddr   001E04 R
  5 port_idr   001DFE R   |   5 port_odr   001DF8 R   |   5 power_ad   0019A5 R
  5 prcnt_ts   000E11 R   |   5 print      0015F8 R   |   5 print_ex   00165C R
  5 print_fa   000BE7 R   |   5 print_in   000999 R   |   5 print_re   0008A6 R
  5 print_st   000B6A R   |   5 prt_basi   001487 R   |   5 prt_cmd_   001437 R
  5 prt_loop   0015FC R   |   5 prt_peek   00024E R   |   5 prt_quot   00144B R
  5 prt_reg1   000887 R   |   5 prt_reg8   000862 R   |   5 prt_regs   0001E4 R
  5 prti24     000951 R   |   1 ptr16      000014 R   |   1 ptr8       000015 R
  5 putc       00019E R   |   5 puts       0001B0 R   |   5 qkey       001DB1 R
  5 qmark_ts   000DC7 R   |   5 random     001E97 R   |   5 read_adc   0019E0 R
  5 readln     000A87 R   |   5 readln_l   000A8D R   |   5 readln_q   000B06 R
  5 regs_sta   000227 R   |   5 rel_exit   001357 R   |   5 relation   001303 R
  5 relop_st   0015DD R   |   5 rem        001706 R   |   5 repl       000B23 R
  5 repl_exi   000B4B R   |   5 reprint    000AAF R   |   5 reset_co   0015FA R
  5 rest_con   00167D R   |   5 return     001903 R   |   5 right_ar   000AAF R
  5 rparnt_t   000D85 R   |   5 rt_msg     000704 R   |   5 run        001927 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 121.
Hexadecimal [24-Bits]

Symbol Table

  5 save       001B24 R   |   5 save_con   001668 R   |   5 search_d   001160 R
  5 search_e   0011B4 R   |   5 search_f   001AD9 R   |   5 search_l   0002E0 R
  5 search_l   0002EB R   |   5 search_n   001164 R   |   1 seedx      00000D R
  1 seedy      00000F R   |   5 seek_fdr   001A7B R   |   5 sharp_ts   000DA6 R
  5 show       00135A R   |   5 single_c   0015D6 R   |   5 size       001374 R
  5 skip       000F7B R   |   5 slash_ts   000E06 R   |   5 sleep      001E53 R
  5 software   000511 R   |   5 spaces     0001D8 R   |   3 stack_fu   001780 R
  3 stack_un   001800 R   |   5 star_tst   000DFB R   |   5 step       001812 R
  5 stop       00196E R   |   5 store      000FFC R   |   5 store_lo   001824 R
  5 str_matc   001192 R   |   5 str_tst    000D2C R   |   5 strcmp     00027F R
  5 strcpy     000290 R   |   5 strlen     000272 R   |   5 substrac   00108B R
  5 syntax_e   000714 R   |   1 tab_widt   000025 R   |   5 tb_error   000716 R
  5 term       001272 R   |   5 term01     00127B R   |   5 term_exi   0012BC R
  5 test_p     000B62 R   |   3 tib        0016C8 R   |   5 tick_tst   000DDE R
  1 ticks      00000B R   |   5 timer4_i   0000AF R   |   5 to         0017E2 R
  5 to_upper   000EC3 GR  |   5 token_ch   000EA7 R   |   5 token_ex   000EB7 R
  1 txtbgn     00001B R   |   1 txtend     00001D R   |   5 uart3_in   000174 R
  5 uart3_se   000180 R   |   5 uart_ena   000199 R   |   5 ubound     00137E R
  5 uflash     001E16 R   |   5 unget_to   000F8E R   |   5 unlock_e   0000C0 R
  5 unlock_f   0000CE R   |   5 user_spa   002180 R   |   5 usr        001E22 R
  1 vars       000026 R   |   5 wait       00170C R   |   5 warm_sta   000766 R
  5 words      001F0B R   |   5 write      001D31 R   |   5 write_bl   000151 R
  5 write_by   0000DC R   |   5 write_ee   000118 R   |   5 write_ex   00014C R
  5 write_fl   000102 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 122.
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

