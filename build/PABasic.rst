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
                                        	.include "../inc/nucleo_8s208.inc"
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
                                 
                                 
                                 
                                        
                                        
                                        	.include "../inc/stm8s208.inc"
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
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        	.include "../inc/ascii.inc"
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
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                        
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        	.include "../inc/gen_macros.inc" 
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
                                                ; values chosen to be used as a mask with CC.
                                                ; bits 4:5 identify group 
                                                ; bits 0:2 are CC mask 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                        ;--------------------------------------
                                        ;   error codes 
                                        ;--------------------------------------
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                            
                                        ;--------------------------------------
                                        ;   assembler flags 
                                        ;-------------------------------------
                                 
                                        
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
                                        
                                            .macro _dbg_number 	_dbg_prt_regs 
                                        
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
                                     51 
      000002                         52 in.w:  .blkb 1 ; parser position in text line
      000003                         53 in:    .blkb 1 ; low byte of in.w
      000004                         54 count: .blkb 1 ; length of string in text line  
      000006                         55 basicptr:  .blkb 2  ; point to text buffer 
      000008                         56 lineno: .blkb 2  ; BASIC line number 
      000009                         57 base:  .blkb 1 ; nemeric base used to print integer 
      00000A                         58 acc24: .blkb 1 ; 24 accumulator
      00000B                         59 acc16: .blkb 1
      00000C                         60 acc8:  .blkb 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      00000E                         61 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000010                         62 seedx: .blkw 1  ; xorshift 16 seed x 
      000012                         63 seedy: .blkw 1  ; xorshift 16 seed y 
      000013                         64 untok: .blkb 1  ; last ungotten token attribute 
      000015                         65 tokval: .blkw 1 ; last parsed token value  
      000018                         66 farptr: .blkb 3 ; far pointer 
      00001B                         67 ffree: .blkb 3 ; flash free address 
      00001D                         68 dstkptr: .blkw 1  ; data stack pointer 
      00001F                         69 txtbgn: .ds 2 ; BASIC text beginning address 
      000021                         70 txtend: .ds 2 ; BASIC text end address 
      000022                         71 loop_depth: .ds 1 ; FOR loop depth 
      000024                         72 array_addr: .ds 2 ; address of @ array 
      000026                         73 array_size: .ds 2 ; array size 
      000027                         74 flags: .ds 1 ; boolean flags
      000028                         75 tab_width: .ds 1 ; print colon width (4)
      00005C                         76 vars: .ds 2*26 ; BASIC variables A-Z, keep it as but last .
                                     77 ; keep as last variable 
      0016C8                         78 free_ram: ; from here RAM free for BASIC text 
                                     79 
                                     80 ;-----------------------------------
                                     81     .area SSEG (ABS)
                                     82 ;-----------------------------------	
      0016C8                         83     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE-DSTACK_SIZE 
      001718                         84 tib: .ds TIB_SIZE             ; transaction input buffer
      001740                         85 pad: .ds PAD_SIZE             ; working buffer
      001780                         86 dstack: .ds DSTACK_SIZE 
      001780                         87 dstack_unf: ; dstack underflow 
      001800                         88 stack_full: .ds STACK_SIZE   ; control stack 
      001800                         89 stack_unf: ; stack underflow  
                                     90 
                                     91 
                                     92 ;--------------------------------------
                                     93     .area HOME 
                                     94 ;--------------------------------------
      008000 82 00 85 64             95     int cold_start
                           000001    96 .if DEBUG
      008004 82 00 80 8A             97 	int TrapHandler 		;TRAP  software interrupt
                           000000    98 .else
                                     99 	int NonHandledInterrupt ;TRAP  software interrupt
                                    100 .endif
      008008 82 00 80 89            101 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 89            102 	int NonHandledInterrupt ;int1 AWU   auto wake up from halt
      008010 82 00 80 89            103 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 89            104 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 89            105 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 89            106 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 89            107 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 A5            108 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 89            109 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 89            110 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 89            111 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 89            112 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 89            113 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 89            114 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 89            115 	int NonHandledInterrupt ;int14 TIM2 capture/compare
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008044 82 00 80 89            116 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 89            117 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 89            118 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 89            119 	int NonHandledInterrupt ;int18 UART1 RX full
      008054 82 00 80 89            120 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 89            121 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 89            122 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 89            123 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 99            124 	int Timer4UpdateHandler	;int23 TIM4 update/overflow
      008068 82 00 80 89            125 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 89            126 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 89            127 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 89            128 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 89            129 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 89            130 	int NonHandledInterrupt ;int29  not used
                                    131 
                                    132 ;---------------------------------------
                                    133     .area CODE
                                    134 ;---------------------------------------
                           000001   135 .if DEBUG
      008080 54 42 49 5F 53 54 4D   136 .asciz "TBI_STM8" ; I like to put module name here.
             38 00
                                    137 .endif 
                                    138 
      008089                        139 NonHandledInterrupt:
      008089 71                     140     .byte 0x71  ; reinitialize MCU
                                    141 
                                    142 
                                    143 ;------------------------------------
                                    144 ; software interrupt handler  
                                    145 ;------------------------------------
                           000001   146 .if DEBUG 
      00808A                        147 TrapHandler:
      00808A 72 12 00 26      [ 1]  148 	bset flags,#FTRAP 
      00808E CD 88 97         [ 4]  149 	call print_registers
      008091 CD 8A BD         [ 4]  150 	call cmd_itf
      008094 72 13 00 26      [ 1]  151 	bres flags,#FTRAP 	
      008098 80               [11]  152 	iret
                                    153 .endif 
                                    154 
      008099                        155 Timer4UpdateHandler:
      008099 72 5F 53 42      [ 1]  156 	clr TIM4_SR 
      00809D CE 00 0C         [ 2]  157 	ldw x,ticks
      0080A0 5C               [ 1]  158 	incw x
      0080A1 CF 00 0C         [ 2]  159 	ldw ticks,x 
      0080A4 80               [11]  160 	iret 
                                    161 
                                    162 
                                    163 ;------------------------------------
                                    164 ; Triggered by pressing USER UserButton 
                                    165 ; on NUCLEO card.
                                    166 ;------------------------------------
      0080A5                        167 UserButtonHandler:
                                    168 ; wait button release
      0080A5 5F               [ 1]  169 	clrw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      0080A6 5A               [ 2]  170 1$: decw x 
      0080A7 26 FD            [ 1]  171 	jrne 1$
      0080A9 72 09 50 15 F8   [ 2]  172 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
      0080AE 72 07 00 26 05   [ 2]  173     btjf flags,#FSLEEP,2$
      0080B3 72 17 00 26      [ 1]  174 	bres flags,#FSLEEP 
      0080B7 80               [11]  175 	iret
      0080B8 72 00 00 26 03   [ 2]  176 2$:	btjt flags,#FRUN,4$
      0080BD CC 80 FB         [ 2]  177 	jp 9$ 
      0080C0 72 11 00 26      [ 1]  178 4$:	bres flags,#FRUN 
      0080C4 AE 81 03         [ 2]  179 	ldw x,#USER_ABORT
      0080C7 CD 82 B0         [ 4]  180 	call puts 
      0080CA CE 00 04         [ 2]  181 	ldw x,basicptr
      0080CD FE               [ 2]  182 	ldw x,(x)
      0080CE CF 00 0A         [ 2]  183 	ldw acc16,x 
      0080D1 72 5F 00 09      [ 1]  184 	clr acc24 
      0080D5 5F               [ 1]  185 	clrw x 
      0080D6 A6 05            [ 1]  186 	ld a,#5
      0080D8 97               [ 1]  187 	ld xl,a 
      0080D9 A6 0A            [ 1]  188 	ld a,#10 
      0080DB CD 89 48         [ 4]  189 	call prti24
      0080DE CE 00 04         [ 2]  190 	ldw x,basicptr 
      0080E1 1C 00 03         [ 2]  191 	addw x,#3  
      0080E4 CD 82 B0         [ 4]  192 	call puts 
      0080E7 A6 0D            [ 1]  193 	ld a,#CR 
      0080E9 CD 82 9E         [ 4]  194 	call putc
      0080EC 5F               [ 1]  195 	clrw x  
      0080ED C6 00 02         [ 1]  196 	ld a,in 
      0080F0 AB 02            [ 1]  197 	add a,#2 ; adjustment for line number display 
      0080F2 97               [ 1]  198 	ld xl,a 
      0080F3 CD 82 EC         [ 4]  199 	call spaces 
      0080F6 A6 5E            [ 1]  200 	ld a,#'^
      0080F8 CD 82 9E         [ 4]  201 	call putc 
      0080FB                        202 9$:
      0080FB AE 17 FF         [ 2]  203     ldw x,#STACK_EMPTY 
      0080FE 94               [ 1]  204     ldw sp,x
      0080FF 9A               [ 1]  205 	rim 
      008100 CC 87 71         [ 2]  206 	jp warm_start
                                    207 
                                    208 
      008103 0A 50 72 6F 67 72 61   209 USER_ABORT: .asciz "\nProgram aborted by user.\n"
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
                                    217 ; output:
                                    218 ;   none 
                                    219 ;----------------------------------------
      00811E                        220 clock_init:	
      00811E C1 50 C3         [ 1]  221 	cp a,CLK_CMSR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      008121 27 0C            [ 1]  222 	jreq 2$ ; no switching required 
                                    223 ; select clock source 
      008123 72 12 50 C5      [ 1]  224 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008127 C7 50 C4         [ 1]  225 	ld CLK_SWR,a
      00812A C1 50 C3         [ 1]  226 1$:	cp a,CLK_CMSR
      00812D 26 FB            [ 1]  227 	jrne 1$
      00812F                        228 2$: 	
                                    229 ; HSI and cpu clock divisor 
      00812F 9F               [ 1]  230 	ld a,xl 
      008130 C7 50 C6         [ 1]  231 	ld CLK_CKDIVR,a  
      008133 81               [ 4]  232 	ret
                                    233 
                                    234 ;---------------------------------
                                    235 ; TIM4 is configured to generate an 
                                    236 ; interrupt every millisecond 
                                    237 ;----------------------------------
      008134                        238 timer4_init:
      008134 35 07 53 45      [ 1]  239 	mov TIM4_PSCR,#7 ; prescale 128  
      008138 35 7D 53 46      [ 1]  240 	mov TIM4_ARR,#125 ; set for 1msec.
      00813C 35 05 53 40      [ 1]  241 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008140 72 10 53 41      [ 1]  242 	bset TIM4_IER,#TIM4_IER_UIE 
      008144 81               [ 4]  243 	ret
                                    244 
                                    245 ;----------------------------------
                                    246 ; unlock EEPROM for writing/erasing
                                    247 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    248 ; input:
                                    249 ;  none
                                    250 ; output:
                                    251 ;  none 
                                    252 ;----------------------------------
      008145                        253 unlock_eeprom:
      008145 35 AE 50 64      [ 1]  254 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008149 35 56 50 64      [ 1]  255     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00814D 72 07 50 5F FB   [ 2]  256 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008152 81               [ 4]  257 	ret
                                    258 
                                    259 ;----------------------------------
                                    260 ; unlock FLASH for writing/erasing
                                    261 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    262 ; input:
                                    263 ;  none
                                    264 ; output:
                                    265 ;  none
                                    266 ;----------------------------------
      008153                        267 unlock_flash:
      008153 35 56 50 62      [ 1]  268 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008157 35 AE 50 62      [ 1]  269 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00815B 72 03 50 5F FB   [ 2]  270 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008160 81               [ 4]  271 	ret
                                    272 
                                    273 ;----------------------------
                                    274 ; erase block code must be 
                                    275 ;executed from RAM
                                    276 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    277 
                                    278 ; this code is copied to RAM 
      008161                        279 erase_start:
      008161 4F               [ 1]  280 	clr a 
      008162 72 1A 50 5B      [ 1]  281     bset FLASH_CR2,#FLASH_CR2_ERASE
      008166 72 1B 50 5C      [ 1]  282     bres FLASH_NCR2,#FLASH_CR2_ERASE
      00816A 92 BD 00 15      [ 4]  283 	ldf [farptr],a
      00816E 72 5C 00 17      [ 1]  284     inc farptr+2 
      008172 92 BD 00 15      [ 4]  285     ldf [farptr],a
      008176 72 5C 00 17      [ 1]  286     inc farptr+2 
      00817A 92 BD 00 15      [ 4]  287     ldf [farptr],a
      00817E 72 5C 00 17      [ 1]  288     inc farptr+2 
      008182 92 BD 00 15      [ 4]  289     ldf [farptr],a
      008186 72 05 50 5F FB   [ 2]  290 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00818B 81               [ 4]  291 	ret
      00818C                        292 erase_end:
                                    293 
                                    294 
      00818C                        295 move_code_in_ram:
      00818C AE 81 8C         [ 2]  296 	ldw x,#erase_end 
      00818F 1D 81 61         [ 2]  297 	subw x,#erase_start
      008192 CF 00 0A         [ 2]  298 	ldw acc16,x 
      008195 AE 17 18         [ 2]  299 	ldw x,#pad 
      008198 90 AE 81 61      [ 2]  300 	ldw y,#erase_start 
      00819C CD 83 B2         [ 4]  301 	call move 
      00819F 81               [ 4]  302 	ret 
                                    303 
                                    304 ;-----------------------------------
                                    305 ; erase flash or EEPROM block 
                                    306 ; a block is 128 bytes 
                                    307 ; input:
                                    308 ;   farptr  address block begin
                                    309 ; output:
                                    310 ;   none
                                    311 ;--------------------------------------
      0081A0                        312 erase_block:
      0081A0 CE 00 16         [ 2]  313 	ldw x,farptr+1 
      0081A3 89               [ 2]  314 	pushw x 
      0081A4 CD 81 8C         [ 4]  315 	call move_code_in_ram 
      0081A7 85               [ 2]  316 	popw x 
      0081A8 CF 00 16         [ 2]  317 	ldw farptr+1,x 
      0081AB 72 5D 00 15      [ 1]  318 	tnz farptr
      0081AF 26 15            [ 1]  319 	jrne erase_flash 
      0081B1 AE 80 00         [ 2]  320 	ldw x,#FLASH_BASE 
      0081B4 C3 00 16         [ 2]  321 	cpw x,farptr+1 
      0081B7 2A 0D            [ 1]  322 	jrpl erase_flash 
                                    323 ; erase eeprom block
      0081B9 CD 81 45         [ 4]  324 	call unlock_eeprom 
      0081BC 9B               [ 1]  325 	sim 
      0081BD CD 81 61         [ 4]  326 	call erase_start  
      0081C0 72 17 50 5F      [ 1]  327 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      0081C4 9A               [ 1]  328 	rim 
      0081C5 81               [ 4]  329 	ret 
                                    330 ; erase flash block:
      0081C6                        331 erase_flash:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0081C6 CD 81 53         [ 4]  332 	call unlock_flash 
      0081C9 72 1A 50 5B      [ 1]  333 	bset FLASH_CR2,#FLASH_CR2_ERASE
      0081CD 72 1B 50 5C      [ 1]  334 	bres FLASH_NCR2,#FLASH_CR2_ERASE
      0081D1 4F               [ 1]  335 	clr a 
      0081D2 9B               [ 1]  336 	sim 
      0081D3 CD 17 18         [ 4]  337 	call pad 
      0081D6 72 13 50 5F      [ 1]  338     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0081DA 9A               [ 1]  339 	rim 
      0081DB 81               [ 4]  340 	ret 
                                    341 
                                    342 
                                    343 
                                    344 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    345 ; write a byte to FLASH or EEPROM 
                                    346 ; input:
                                    347 ;    a  		byte to write
                                    348 ;    farptr  	address
                                    349 ;    x          farptr[x]
                                    350 ; output:
                                    351 ;    none
                                    352 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    353 	; variables locales
                           000001   354 	BTW = 1   ; byte to write offset on stack
                           000002   355 	OPT = 2   ; OPTION flag offset on stack
                           000002   356 	VSIZE = 2
      0081DC                        357 write_byte:
      0081DC 90 89            [ 2]  358 	pushw y
      00015E                        359 	_vars VSIZE
      0081DE 52 02            [ 2]    1     sub sp,#VSIZE 
      0081E0 6B 01            [ 1]  360 	ld (BTW,sp),a ; byte to write 
      0081E2 0F 02            [ 1]  361 	clr (OPT,sp)  ; OPTION flag
                                    362 ; put addr[15:0] in Y, for bounds check.
      0081E4 90 CE 00 16      [ 2]  363 	ldw y,farptr+1   ; Y=addr15:0
                                    364 ; check addr[23:16], if <> 0 then it is extened flash memory
      0081E8 72 5D 00 15      [ 1]  365 	tnz farptr 
      0081EC 26 14            [ 1]  366 	jrne write_flash
      0081EE 90 A3 9F 00      [ 2]  367     cpw y,#user_space
      0081F2 24 0E            [ 1]  368     jruge write_flash
      0081F4 90 A3 40 00      [ 2]  369 	cpw y,#EEPROM_BASE  
      0081F8 25 52            [ 1]  370     jrult write_exit
      0081FA 90 A3 48 00      [ 2]  371 	cpw y,#OPTION_BASE
      0081FE 25 18            [ 1]  372 	jrult write_eeprom
      008200 20 4A            [ 2]  373     jra write_exit
                                    374 ; write program memory
      008202                        375 write_flash:
      008202 CD 81 53         [ 4]  376 	call unlock_flash 
      008205 9B               [ 1]  377 1$:	sim 
      008206 7B 01            [ 1]  378 	ld a,(BTW,sp)
      008208 92 A7 00 15      [ 4]  379 	ldf ([farptr],x),a ; farptr[x]=A
      00820C 72 05 50 5F FB   [ 2]  380 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008211 9A               [ 1]  381     rim 
      008212 72 13 50 5F      [ 1]  382     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008216 20 34            [ 2]  383     jra write_exit
                                    384 ; write eeprom and option
      008218                        385 write_eeprom:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



      008218 CD 81 45         [ 4]  386 	call unlock_eeprom
                                    387 	; check for data eeprom or option eeprom
      00821B 90 A3 48 00      [ 2]  388 	cpw y,#OPTION_BASE
      00821F 2B 08            [ 1]  389 	jrmi 1$
      008221 90 A3 48 80      [ 2]  390 	cpw y,#OPTION_END+1
      008225 2A 02            [ 1]  391 	jrpl 1$
      008227 03 02            [ 1]  392 	cpl (OPT,sp)
      008229                        393 1$: 
      008229 0D 02            [ 1]  394     tnz (OPT,sp)
      00822B 27 08            [ 1]  395     jreq 2$
                                    396 	; pour modifier une option il faut modifier ces 2 bits
      00822D 72 1E 50 5B      [ 1]  397     bset FLASH_CR2,#FLASH_CR2_OPT
      008231 72 1F 50 5C      [ 1]  398     bres FLASH_NCR2,#FLASH_CR2_OPT 
      008235                        399 2$: 
      008235 7B 01            [ 1]  400     ld a,(BTW,sp)
      008237 92 A7 00 15      [ 4]  401     ldf ([farptr],x),a
      00823B 0D 02            [ 1]  402     tnz (OPT,sp)
      00823D 27 08            [ 1]  403     jreq 3$
      00823F 5C               [ 1]  404     incw x
      008240 7B 01            [ 1]  405     ld a,(BTW,sp)
      008242 43               [ 1]  406     cpl a
      008243 92 A7 00 15      [ 4]  407     ldf ([farptr],x),a
      008247 72 05 50 5F FB   [ 2]  408 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00824C                        409 write_exit:
      0001CC                        410 	_drop VSIZE 
      00824C 5B 02            [ 2]    1     addw sp,#VSIZE 
      00824E 90 85            [ 2]  411 	popw y
      008250 81               [ 4]  412     ret
                                    413 
                                    414 ;--------------------------------------------
                                    415 ; write a data block to eeprom or flash 
                                    416 ; input:
                                    417 ;   Y        source address   
                                    418 ;   X        array index  destination  farptr[x]
                                    419 ;   BSIZE    block size bytes 
                                    420 ;   farptr   write address , byte* 
                                    421 ; output:
                                    422 ;	X 		after last byte written 
                                    423 ;   Y 		after last byte read 
                                    424 ;  farptr   point after block
                                    425 ;---------------------------------------------
      008251                        426 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      0001D1                        427 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    428 	; local var 
                           000001   429 	XSAVE=1 
                           000002   430 	VSIZE=2 
      0001D1                        431 write_block:
      0001D1                        432 	_vars VSIZE
      008251 52 02            [ 2]    1     sub sp,#VSIZE 
      008253 1F 01            [ 2]  433 	ldw (XSAVE,sp),x 
      008255 1E 05            [ 2]  434 	ldw x,(BSIZE,sp) 
      008257 27 13            [ 1]  435 	jreq 9$
      008259 1E 01            [ 2]  436 1$:	ldw x,(XSAVE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00825B 90 F6            [ 1]  437 	ld a,(y)
      00825D CD 81 DC         [ 4]  438 	call write_byte 
      008260 5C               [ 1]  439 	incw x 
      008261 90 5C            [ 1]  440 	incw y 
      008263 1F 01            [ 2]  441 	ldw (XSAVE,sp),x
      008265 1E 05            [ 2]  442 	ldw x,(BSIZE,sp)
      008267 5A               [ 2]  443 	decw x
      008268 1F 05            [ 2]  444 	ldw (BSIZE,sp),x 
      00826A 26 ED            [ 1]  445 	jrne 1$
      00826C                        446 9$:
      00826C 1E 01            [ 2]  447 	ldw x,(XSAVE,sp)
      00826E CD 98 99         [ 4]  448 	call incr_farptr
      0001F1                        449 	_drop VSIZE
      008271 5B 02            [ 2]    1     addw sp,#VSIZE 
      008273 81               [ 4]  450 	ret 
                                    451 
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
      008274                        465 uart3_init:
                                    466 	; configure tx pin
      008274 72 1A 50 11      [ 1]  467 	bset PD_DDR,#BIT5 ; tx pin
      008278 72 1A 50 12      [ 1]  468 	bset PD_CR1,#BIT5 ; push-pull output
      00827C 72 1A 50 13      [ 1]  469 	bset PD_CR2,#BIT5 ; fast output
      008280                        470 uart3_set_baud: 
                                    471 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    472 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008280 A6 E1            [ 1]  473 	ld a,#CLK_SWR_HSI
      008282 C1 50 C3         [ 1]  474 	cp a,CLK_CMSR 
      008285 27 0A            [ 1]  475 	jreq hsi_clock 
      008287                        476 hse_clock: ; 8 Mhz 	
      008287 35 05 52 43      [ 1]  477 	mov UART3_BRR2,#0x05 ; must be loaded first
      00828B 35 04 52 42      [ 1]  478 	mov UART3_BRR1,#0x4
      00828F 20 08            [ 2]  479 	jra uart_enable
      008291                        480 hsi_clock: ; 16 Mhz 	
      008291 35 0B 52 43      [ 1]  481 	mov UART3_BRR2,#0x0b ; must be loaded first
      008295 35 08 52 42      [ 1]  482 	mov UART3_BRR1,#0x08
      008299                        483 uart_enable:	
      008299 35 0C 52 45      [ 1]  484 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
      00829D 81               [ 4]  485 	ret
                                    486 	
                                    487 ;---------------------------------
                                    488 ; send character to UART3 
                                    489 ; input:
                                    490 ;   A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    491 ; output:
                                    492 ;   none 
                                    493 ;--------------------------------	
      00829E                        494 putc:
      00829E 72 0F 52 40 FB   [ 2]  495 	btjf UART3_SR,#UART_SR_TXE,.
      0082A3 C7 52 41         [ 1]  496 	ld UART3_DR,a 
      0082A6 81               [ 4]  497 	ret 
                                    498 
                                    499 ;---------------------------------
                                    500 ; wait character from UART3 
                                    501 ; input:
                                    502 ;   none
                                    503 ; output:
                                    504 ;   A 			char  
                                    505 ;--------------------------------	
      0082A7                        506 getc:
      0082A7 72 0B 52 40 FB   [ 2]  507 	btjf UART3_SR,#UART_SR_RXNE,.
      0082AC C6 52 41         [ 1]  508 	ld a,UART3_DR 
      0082AF 81               [ 4]  509 	ret 
                                    510 
                                    511 ;-----------------------------
                                    512 ; send an ASCIZ string to UART3 
                                    513 ; input: 
                                    514 ;   x 		char * 
                                    515 ; output:
                                    516 ;   none 
                                    517 ;-------------------------------
      0082B0                        518 puts:
      0082B0 F6               [ 1]  519     ld a,(x)
      0082B1 27 06            [ 1]  520 	jreq 1$
      0082B3 CD 82 9E         [ 4]  521 	call putc 
      0082B6 5C               [ 1]  522 	incw x 
      0082B7 20 F7            [ 2]  523 	jra puts 
      0082B9 81               [ 4]  524 1$:	ret 
                                    525 
                                    526 ;-----------------------------
                                    527 ; send a counted string to UART3 
                                    528 ; first is length {0..255}
                                    529 ; input: 
                                    530 ;   X  		char *
                                    531 ; output:
                                    532 ;   none 
                                    533 ;-------------------------------
      0082BA                        534 prt_cstr:
      0082BA 90 5F            [ 1]  535 	clrw y 
      0082BC F6               [ 1]  536 	ld a,(x)
      0082BD 5C               [ 1]  537 	incw x 
      0082BE 90 97            [ 1]  538 	ld yl,a 
      0082C0 90 5D            [ 2]  539 1$:	tnzw y 
      0082C2 27 09            [ 1]  540 	jreq 9$ 
      0082C4 F6               [ 1]  541 	ld a,(x)
      0082C5 CD 82 9E         [ 4]  542 	call putc 
      0082C8 5C               [ 1]  543 	incw x 
      0082C9 90 5A            [ 2]  544 	decw y
      0082CB 20 F3            [ 2]  545 	jra 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



      0082CD 81               [ 4]  546 9$:	ret 
                                    547 
                                    548 
                                    549 ;---------------------------
                                    550 ; delete character at left 
                                    551 ; of cursor on terminal 
                                    552 ; input:
                                    553 ;   none 
                                    554 ; output:
                                    555 ;	none 
                                    556 ;---------------------------
      0082CE                        557 bksp:
      0082CE A6 08            [ 1]  558 	ld a,#BSP 
      0082D0 CD 82 9E         [ 4]  559 	call putc 
      0082D3 A6 20            [ 1]  560 	ld a,#SPACE 
      0082D5 CD 82 9E         [ 4]  561 	call putc 
      0082D8 A6 08            [ 1]  562 	ld a,#BSP 
      0082DA CD 82 9E         [ 4]  563 	call putc 
      0082DD 81               [ 4]  564 	ret 
                                    565 ;---------------------------
                                    566 ; delete n character left of cursor 
                                    567 ; at terminal.
                                    568 ; input: 
                                    569 ;   A   	number of characters to delete.
                                    570 ; output:
                                    571 ;    none 
                                    572 ;--------------------------	
      0082DE                        573 delete:
      0082DE 88               [ 1]  574 	push a 
      0082DF 0D 01            [ 1]  575 0$:	tnz (1,sp)
      0082E1 27 07            [ 1]  576 	jreq 1$
      0082E3 CD 82 CE         [ 4]  577 	call bksp 
      0082E6 0A 01            [ 1]  578 	dec (1,sp)
      0082E8 20 F5            [ 2]  579 	jra 0$
      0082EA 84               [ 1]  580 1$:	pop a 
      0082EB 81               [ 4]  581 	ret
                                    582 
                                    583 ;--------------------------
                                    584 ; print n spaces on terminal
                                    585 ; input:
                                    586 ;  X 		number of spaces 
                                    587 ; output:
                                    588 ;	none 
                                    589 ;---------------------------
      0082EC                        590 spaces:
      0082EC A6 20            [ 1]  591 	ld a,#SPACE 
      0082EE 5D               [ 2]  592 1$:	tnzw x
      0082EF 27 06            [ 1]  593 	jreq 9$
      0082F1 CD 82 9E         [ 4]  594 	call putc 
      0082F4 5A               [ 2]  595 	decw x
      0082F5 20 F7            [ 2]  596 	jra 1$
      0082F7                        597 9$: 
      0082F7 81               [ 4]  598 	ret 
                                    599 
                           000001   600 .if DEBUG 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    601 ;---------------------------------
                                    602 ;; print actual registers states 
                                    603 ;; as pushed on stack 
                                    604 ;; {Y,X,CC,A}
                                    605 ;---------------------------------
      0082F8                        606 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      000278                        607 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      000278                        608 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      000278                        609 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      000278                        610 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      000278                        611 prt_regs:
      0082F8 AE 83 3B         [ 2]  612 	ldw x,#regs_state 
      0082FB CD 82 B0         [ 4]  613 	call puts
                                    614 ; register PC
      0082FE 16 01            [ 2]  615 	ldw y,(1,sp)
      008300 AE 89 27         [ 2]  616 	ldw x,#REG_EPC 
      008303 CD 88 63         [ 4]  617 	call prt_reg16 
                                    618 ; register CC 
      008306 7B 08            [ 1]  619 	ld a,(R_CC,sp)
      008308 AE 89 3C         [ 2]  620 	ldw x,#REG_CC 
      00830B CD 88 3B         [ 4]  621 	call prt_reg8 
                                    622 ; register A 
      00830E 7B 07            [ 1]  623 	ld a,(R_A,sp)
      008310 AE 89 37         [ 2]  624 	ldw x,#REG_A 
      008313 CD 88 3B         [ 4]  625 	call prt_reg8 
                                    626 ; register X 
      008316 16 05            [ 2]  627 	ldw y,(R_X,sp)
      008318 AE 89 32         [ 2]  628 	ldw x,#REG_X 
      00831B CD 88 63         [ 4]  629 	call prt_reg16 
                                    630 ; register Y 
      00831E 16 03            [ 2]  631 	ldw y,(R_Y,sp)
      008320 AE 89 2D         [ 2]  632 	ldw x,#REG_Y 
      008323 CD 88 63         [ 4]  633 	call prt_reg16 
                                    634 ; register SP 
      008326 90 96            [ 1]  635 	ldw y,sp
      008328 72 A9 00 08      [ 2]  636 	addw y,#6+ARG_OFS  
      00832C AE 89 42         [ 2]  637 	ldw x,#REG_SP
      00832F CD 88 63         [ 4]  638 	call prt_reg16
      008332 A6 0D            [ 1]  639 	ld a,#CR 
      008334 CD 82 9E         [ 4]  640 	call putc
      008337 CD 82 9E         [ 4]  641 	call putc   
      00833A 81               [ 4]  642 	ret 
                                    643 
      00833B 0A 72 65 67 69 73 74   644 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    645 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



                                    646 
                                    647 ;--------------------
                                    648 ; print content at address in hex.
                                    649 ; input:
                                    650 ;   X 	address to peek 
                                    651 ; output:
                                    652 ;	none 
                                    653 ;--------------------	
      008362                        654 prt_peek:
      008362 89               [ 2]  655 	pushw x 
      008363 CF 00 0A         [ 2]  656 	ldw acc16,x 
      008366 72 5F 00 09      [ 1]  657 	clr acc24 
      00836A 5F               [ 1]  658 	clrw x 
      00836B A6 10            [ 1]  659 	ld a,#16 
      00836D CD 89 48         [ 4]  660 	call prti24 
      008370 A6 3A            [ 1]  661 	ld a,#': 
      008372 CD 82 9E         [ 4]  662 	call putc 
      008375 A6 20            [ 1]  663 	ld a,#SPACE 
      008377 CD 82 9E         [ 4]  664 	call putc 
      00837A 85               [ 2]  665 	popw x 
      00837B F6               [ 1]  666 	ld a,(x)
      00837C C7 00 0B         [ 1]  667 	ld acc8,a 
      00837F 5F               [ 1]  668 	clrw x 
      008380 A6 10            [ 1]  669 	ld a,#16 
      008382 CD 89 48         [ 4]  670 	call prti24
      008385 81               [ 4]  671 	ret 
                                    672 .endif 
                                    673 
                                    674 ;-------------------------------------
                                    675 ; retrun string length
                                    676 ; input:
                                    677 ;   X         .asciz  
                                    678 ; output:
                                    679 ;   X         length 
                                    680 ;-------------------------------------
      008386                        681 strlen:
      008386 90 93            [ 1]  682 	ldw y,x 
      008388 5F               [ 1]  683 	clrw x 
      008389 90 7D            [ 1]  684 1$:	tnz (y) 
      00838B 27 05            [ 1]  685 	jreq 9$ 
      00838D 5C               [ 1]  686 	incw x
      00838E 90 5C            [ 1]  687 	incw y 
      008390 20 F7            [ 2]  688 	jra 1$ 
      008392 81               [ 4]  689 9$: ret 
                                    690 
                                    691 ;------------------------------------
                                    692 ; compare 2 strings
                                    693 ; input:
                                    694 ;   X 		char* first string 
                                    695 ;   Y       char* second string 
                                    696 ; output:
                                    697 ;   A 		0|1 
                                    698 ;-------------------------------------
      008393                        699 strcmp:
      008393 F6               [ 1]  700 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008394 27 0B            [ 1]  701 	jreq 5$ 
      008396 90 F1            [ 1]  702 	cp a,(y) 
      008398 26 05            [ 1]  703 	jrne 4$ 
      00839A 5C               [ 1]  704 	incw x 
      00839B 90 5C            [ 1]  705 	incw y 
      00839D 20 F4            [ 2]  706 	jra strcmp 
      00839F                        707 4$: ; not same  
      00839F 4F               [ 1]  708 	clr a 
      0083A0 81               [ 4]  709 	ret 
      0083A1                        710 5$: ; same 
      0083A1 A6 01            [ 1]  711 	ld a,#1 
      0083A3 81               [ 4]  712 	ret 
                                    713 
                                    714 
                                    715 ;---------------------------------------
                                    716 ;  copy src to dest 
                                    717 ; input:
                                    718 ;   X 		dest 
                                    719 ;   Y 		src 
                                    720 ; output: 
                                    721 ;   X 		dest 
                                    722 ;----------------------------------
      0083A4                        723 strcpy:
      0083A4 89               [ 2]  724 	pushw x 
      0083A5 90 F6            [ 1]  725 1$: ld a,(y)
      0083A7 27 06            [ 1]  726 	jreq 9$ 
      0083A9 F7               [ 1]  727 	ld (x),a 
      0083AA 5C               [ 1]  728 	incw x 
      0083AB 90 5C            [ 1]  729 	incw y 
      0083AD 20 F6            [ 2]  730 	jra 1$ 
      0083AF 7F               [ 1]  731 9$:	clr (x)
      0083B0 85               [ 2]  732 	popw x 
      0083B1 81               [ 4]  733 	ret 
                                    734 
                                    735 ;---------------------------------------
                                    736 ; move memory block 
                                    737 ; input:
                                    738 ;   X 		destination 
                                    739 ;   Y 	    source 
                                    740 ;   acc16	size 
                                    741 ; output:
                                    742 ;   none 
                                    743 ;--------------------------------------
                           000001   744 	INCR=1 ; increament high byte 
                           000002   745 	LB=2 ; increament low byte 
                           000002   746 	VSIZE=2
      0083B2                        747 move:
      000332                        748 	_vars VSIZE 
      0083B2 52 02            [ 2]    1     sub sp,#VSIZE 
      0083B4 0F 01            [ 1]  749 	clr (INCR,sp)
      0083B6 0F 02            [ 1]  750 	clr (LB,sp)
      0083B8 90 89            [ 2]  751 	pushw y 
      0083BA 13 01            [ 2]  752 	cpw x,(1,sp) ; compare DEST to SRC 
      0083BC 90 85            [ 2]  753 	popw y 
      0083BE 27 32            [ 1]  754 	jreq move_exit ; x==y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083C0 2B 0E            [ 1]  755 	jrmi move_down
      0083C2                        756 move_up: ; start from top address with incr=-1
      0083C2 72 BB 00 0A      [ 2]  757 	addw x,acc16
      0083C6 72 B9 00 0A      [ 2]  758 	addw y,acc16
      0083CA 03 01            [ 1]  759 	cpl (INCR,sp)
      0083CC 03 02            [ 1]  760 	cpl (LB,sp)   ; increment = -1 
      0083CE 20 05            [ 2]  761 	jra move_loop  
      0083D0                        762 move_down: ; start from bottom address with incr=1 
      0083D0 5A               [ 2]  763     decw x 
      0083D1 90 5A            [ 2]  764 	decw y
      0083D3 0C 02            [ 1]  765 	inc (LB,sp) ; incr=1 
      0083D5                        766 move_loop:	
      0083D5 C6 00 0A         [ 1]  767     ld a, acc16 
      0083D8 CA 00 0B         [ 1]  768 	or a, acc8
      0083DB 27 15            [ 1]  769 	jreq move_exit 
      0083DD 72 FB 01         [ 2]  770 	addw x,(INCR,sp)
      0083E0 72 F9 01         [ 2]  771 	addw y,(INCR,sp) 
      0083E3 90 F6            [ 1]  772 	ld a,(y)
      0083E5 F7               [ 1]  773 	ld (x),a 
      0083E6 72 5A 00 0B      [ 1]  774 	dec acc8
      0083EA 2A E9            [ 1]  775 	jrpl move_loop
      0083EC 72 5A 00 0A      [ 1]  776 	dec acc16
      0083F0 20 E3            [ 2]  777 	jra move_loop
      0083F2                        778 move_exit:
      000372                        779 	_drop VSIZE
      0083F2 5B 02            [ 2]    1     addw sp,#VSIZE 
      0083F4 81               [ 4]  780 	ret 	
                                    781 
                                    782 ;-------------------------------------
                                    783 ; search text area for a line with 
                                    784 ; same number as lineno  
                                    785 ; input:
                                    786 ;	X 			lineno 
                                    787 ; output:
                                    788 ;   X 			addr of line | 0 
                                    789 ;   Y           lineno|insert address if not found  
                                    790 ;-------------------------------------
                           000001   791 	LL=1 ; line length 
                           000002   792 	LB=2 ; line length low byte 
                           000002   793 	VSIZE=2 
      0083F5                        794 search_lineno:
      000375                        795 	_vars VSIZE
      0083F5 52 02            [ 2]    1     sub sp,#VSIZE 
      0083F7 CF 00 0A         [ 2]  796 	ldw acc16,x 
      0083FA 0F 01            [ 1]  797 	clr (LL,sp)
      0083FC 90 CE 00 1D      [ 2]  798 	ldw y,txtbgn
      008400                        799 search_ln_loop:
      008400 90 C3 00 1F      [ 2]  800 	cpw y,txtend 
      008404 2A 17            [ 1]  801 	jrpl 8$
      008406 93               [ 1]  802 	ldw x,y 
      008407 FE               [ 2]  803 	ldw x,(x) ; x=line number 
      008408 C3 00 0A         [ 2]  804 	cpw x,acc16 
      00840B 27 13            [ 1]  805 	jreq 9$ 
      00840D 2A 0E            [ 1]  806 	jrpl 8$ ; from here all lines are > lineno 
      00840F 90 E6 02         [ 1]  807 	ld a,(2,y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      008412 6B 02            [ 1]  808 	ld (LB,sp),a 
      008414 72 A9 00 03      [ 2]  809 	addw y,#3 
      008418 72 F9 01         [ 2]  810 	addw y,(LL,sp)
      00841B 20 E3            [ 2]  811 	jra search_ln_loop 
      00841D 51               [ 1]  812 8$: exgw x,y 
      00841E 90 5F            [ 1]  813 	clrw y 	
      0003A0                        814 9$: _drop VSIZE
      008420 5B 02            [ 2]    1     addw sp,#VSIZE 
      008422 51               [ 1]  815 	exgw x,y   
      008423 81               [ 4]  816 	ret 
                                    817 
                                    818 ;-------------------------------------
                                    819 ; delete line at addr
                                    820 ; input:
                                    821 ;   X 		addr of line i.e DEST for move 
                                    822 ;-------------------------------------
                           000001   823 	LLEN=1
                           000003   824 	SRC=3
                           000004   825 	VSIZE=4
      008424                        826 del_line: 
      0003A4                        827 	_vars VSIZE 
      008424 52 04            [ 2]    1     sub sp,#VSIZE 
      008426 E6 02            [ 1]  828 	ld a,(2,x) ; line length
      008428 AB 03            [ 1]  829 	add a,#3
      00842A 6B 02            [ 1]  830 	ld (LLEN+1,sp),a 
      00842C 0F 01            [ 1]  831 	clr (LLEN,sp)
      00842E 90 93            [ 1]  832 	ldw y,x  
      008430 72 F9 01         [ 2]  833 	addw y,(LLEN,sp) ;SRC  
      008433 17 03            [ 2]  834 	ldw (SRC,sp),y  ;save source 
      008435 90 CE 00 1F      [ 2]  835 	ldw y,txtend 
      008439 72 F2 03         [ 2]  836 	subw y,(SRC,sp) ; y=count 
      00843C 90 CF 00 0A      [ 2]  837 	ldw acc16,y 
      008440 16 03            [ 2]  838 	ldw y,(SRC,sp)    ; source
      008442 CD 83 B2         [ 4]  839 	call move
      008445 90 CE 00 1F      [ 2]  840 	ldw y,txtend 
      008449 72 F2 01         [ 2]  841 	subw y,(LLEN,sp)
      00844C 90 CF 00 1F      [ 2]  842 	ldw txtend,y  
      0003D0                        843 	_drop VSIZE     
      008450 5B 04            [ 2]    1     addw sp,#VSIZE 
      008452 81               [ 4]  844 	ret 
                                    845 
                                    846 
                                    847 ;---------------------------------------------
                                    848 ; create a gap in text area 
                                    849 ; input:
                                    850 ;    X 			addr gap start 
                                    851 ;    Y 			gap length 
                                    852 ; output:
                                    853 ;    X 			addr gap start 
                                    854 ;--------------------------------------------
                           000001   855 	DEST=1
                           000003   856 	SRC=3
                           000005   857 	LEN=5
                           000006   858 	VSIZE=6 
      008453                        859 create_gap:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      0003D3                        860 	_vars VSIZE
      008453 52 06            [ 2]    1     sub sp,#VSIZE 
      008455 C3 00 1F         [ 2]  861 	cpw x,txtend 
      008458 2A 27            [ 1]  862 	jrpl 9$ ; no need for a gap since at end of text.
      00845A 1F 03            [ 2]  863 	ldw (SRC,sp),x 
      00845C 17 05            [ 2]  864 	ldw (LEN,sp),y 
      00845E 90 CF 00 0A      [ 2]  865 	ldw acc16,y 
      008462 90 93            [ 1]  866 	ldw y,x ; SRC
      008464 72 BB 00 0A      [ 2]  867 	addw x,acc16  
      008468 1F 01            [ 2]  868 	ldw (DEST,sp),x 
                                    869 ;compute size to move 	
      00846A CE 00 1F         [ 2]  870 	ldw x,txtend 
      00846D 72 F0 03         [ 2]  871 	subw x,(SRC,sp)
      008470 CF 00 0A         [ 2]  872 	ldw acc16,x
      008473 1E 01            [ 2]  873 	ldw x,(DEST,sp) 
      008475 CD 83 B2         [ 4]  874 	call move
      008478 CE 00 1F         [ 2]  875 	ldw x,txtend
      00847B 72 FB 05         [ 2]  876 	addw x,(LEN,sp)
      00847E CF 00 1F         [ 2]  877 	ldw txtend,x
      000401                        878 9$:	_drop VSIZE 
      008481 5B 06            [ 2]    1     addw sp,#VSIZE 
      008483 81               [ 4]  879 	ret 
                                    880 
                                    881 
                                    882 ;--------------------------------------------
                                    883 ; insert line in tib into text area 
                                    884 ; first search for already existing 
                                    885 ; replace existing 
                                    886 ; if strlen(tib)==0 delete existing 
                                    887 ; input:
                                    888 ;   X 				line number 
                                    889 ;   tib[in.w]  		text to insert  
                                    890 ; output:
                                    891 ;   none
                                    892 ;---------------------------------------------
                           000001   893 	DEST=1  ; text area insertion address 
                           000003   894 	SRC=3   ; str to insert address 
                           000005   895 	LINENO=5 ; line number 
                           000007   896 	LLEN=7 ; line length 
                           000008   897 	VSIZE=8  
      008484                        898 insert_line:
      000404                        899 	_vars VSIZE 
      008484 52 08            [ 2]    1     sub sp,#VSIZE 
      008486 CD 8F AD         [ 4]  900 	call dpop 
      008489 5D               [ 2]  901 	tnzw x 
      00848A 2A 03            [ 1]  902 	jrpl 0$ 
      00848C CC 87 11         [ 2]  903 	jp syntax_error ; negative line number 
      00848F                        904 0$:
      00848F 1F 05            [ 2]  905 	ldw (LINENO,sp),x 
      008491 AE 16 C8         [ 2]  906 	ldw x,#tib 
      008494 72 BB 00 01      [ 2]  907 	addw x,in.w 
      008498 1F 03            [ 2]  908 	ldw (SRC,sp),x 
      00849A CD 83 86         [ 4]  909 	call strlen
      00849D 5D               [ 2]  910 	tnzw x 
      00849E 27 01            [ 1]  911 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084A0 5C               [ 1]  912 	incw x 
      0084A1 1F 07            [ 2]  913 1$:	ldw (LLEN,sp),x
      0084A3 1E 05            [ 2]  914 	ldw x,(LINENO,sp)
      0084A5 CD 83 F5         [ 4]  915 	call search_lineno 
      0084A8 5D               [ 2]  916 	tnzw x 
      0084A9 26 04            [ 1]  917 	jrne 2$
                                    918 ; line doesn't exit 	
      0084AB 17 01            [ 2]  919 	ldw (DEST,sp),y 
      0084AD 20 05            [ 2]  920 	jra 3$
                                    921 ; line exit delete it.	
      0084AF 1F 01            [ 2]  922 2$: ldw (DEST,sp),x 
      0084B1 CD 84 24         [ 4]  923 	call del_line
                                    924 ; leave or insert new line if LLEN>0
      0084B4                        925 3$: 
                                    926 ; check for available space 
      0084B4 CD 93 EF         [ 4]  927 	call size 
      0084B7 1D 00 03         [ 2]  928 	subw x,#3 
      0084BA 72 F0 07         [ 2]  929     subw x,(LLEN,sp)
      0084BD 2A 05            [ 1]  930 	jrpl 31$
      0084BF A6 01            [ 1]  931 	ld a,#ERR_MEM_FULL
      0084C1 CC 87 13         [ 2]  932 	jp tb_error 
      0084C4                        933 31$:	
      0084C4 0D 08            [ 1]  934 	tnz (LLEN+1,sp)
      0084C6 27 34            [ 1]  935 	jreq insert_ln_exit ; empty line forget it.
      0084C8 1E 01            [ 2]  936 	ldw x,(DEST,sp)
      0084CA C3 00 1F         [ 2]  937 	cpw x,txtend 
      0084CD 2A 0B            [ 1]  938 	jrpl 4$ 
                                    939 ; must create a gap 
      0084CF 16 07            [ 2]  940 	ldw y,(LLEN,sp)
      0084D1 72 A9 00 03      [ 2]  941 	addw y,#3 ; space for lineno and linelen 
      0084D5 CD 84 53         [ 4]  942 	call create_gap 
      0084D8 20 11            [ 2]  943 	jra 5$ 
      0084DA                        944 4$: ; insert at end. 
      0084DA 90 CE 00 1F      [ 2]  945 	ldw y,txtend
      0084DE 17 01            [ 2]  946 	ldw (DEST,sp),y
      0084E0 72 F9 07         [ 2]  947 	addw y,(LLEN,sp)
      0084E3 72 A9 00 03      [ 2]  948 	addw y,#3 
      0084E7 90 CF 00 1F      [ 2]  949 	ldw txtend,y  
      0084EB                        950 5$:	
      0084EB 1E 01            [ 2]  951 	ldw x,(DEST,sp) ; dest address 
      0084ED 16 05            [ 2]  952 	ldw y,(LINENO,sp) ; line number 
      0084EF FF               [ 2]  953 	ldw (x),y 
      0084F0 1C 00 02         [ 2]  954 	addw x,#2
      0084F3 7B 08            [ 1]  955 	ld a,(LLEN+1,sp)
      0084F5 F7               [ 1]  956 	ld (x),a 
      0084F6 5C               [ 1]  957 	incw x 
      0084F7 16 03            [ 2]  958 	ldw y,(SRC,sp) ; src addr  
      0084F9 CD 83 A4         [ 4]  959 	call strcpy   
      0084FC                        960 insert_ln_exit:	
      00047C                        961 	_drop VSIZE
      0084FC 5B 08            [ 2]    1     addw sp,#VSIZE 
      0084FE 81               [ 4]  962 	ret
                                    963 	
                                    964 ;------------------------------------
                                    965 ;  set all variables to zero 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    966 ; input:
                                    967 ;   none 
                                    968 ; output:
                                    969 ;	none
                                    970 ;------------------------------------
      0084FF                        971 clear_vars:
      0084FF AE 00 28         [ 2]  972 	ldw x,#vars 
      008502 90 AE 00 34      [ 2]  973 	ldw y,#2*26 
      008506 7F               [ 1]  974 1$:	clr (x)
      008507 5C               [ 1]  975 	incw x 
      008508 90 5A            [ 2]  976 	decw y 
      00850A 26 FA            [ 1]  977 	jrne 1$
      00850C 81               [ 4]  978 	ret 
                                    979 
                                    980 ;-------------------------------------
                                    981 ; check if A is a letter
                                    982 ; input:
                                    983 ;   A 			character to test 
                                    984 ; output:
                                    985 ;   C flag      1 true, 0 false 
                                    986 ;-------------------------------------
      00850D                        987 is_alpha:
      00850D A1 41            [ 1]  988 	cp a,#'A 
      00850F 8C               [ 1]  989 	ccf
      008510 24 0B            [ 1]  990 	jrnc 9$ 
      008512 A1 5B            [ 1]  991 	cp a,#'Z+1 
      008514 25 07            [ 1]  992 	jrc 9$ 
      008516 A1 61            [ 1]  993 	cp a,#'a 
      008518 8C               [ 1]  994 	ccf 
      008519 24 02            [ 1]  995 	jrnc 9$
      00851B A1 7B            [ 1]  996 	cp a,#'z+1   
      00851D 81               [ 4]  997 9$: ret 	
                                    998 
                                    999 ;-------------------------------------
                                   1000 ;  program initialization entry point 
                                   1001 ;-------------------------------------
                           000001  1002 	MAJOR=1
                           000000  1003 	MINOR=0
      00851E 0A 0A 54 69 6E 79 20  1004 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      008564                       1005 cold_start:
                                   1006 ;set stack 
      008564 AE 17 FF         [ 2] 1007 	ldw x,#STACK_EMPTY
      008567 94               [ 1] 1008 	ldw sp,x   
                                   1009 ; clear all ram 
      008568 7F               [ 1] 1010 0$: clr (x)
      008569 5A               [ 2] 1011 	decw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      00856A 26 FC            [ 1] 1012 	jrne 0$
                                   1013 ; activate pull up on all inputs 
      00856C A6 FF            [ 1] 1014 	ld a,#255 
      00856E C7 50 03         [ 1] 1015 	ld PA_CR1,a 
      008571 C7 50 08         [ 1] 1016 	ld PB_CR1,a 
      008574 C7 50 0D         [ 1] 1017 	ld PC_CR1,a 
      008577 C7 50 12         [ 1] 1018 	ld PD_CR1,a 
      00857A C7 50 17         [ 1] 1019 	ld PE_CR1,a 
      00857D C7 50 1C         [ 1] 1020 	ld PF_CR1,a 
      008580 C7 50 21         [ 1] 1021 	ld PG_CR1,a 
      008583 C7 50 2B         [ 1] 1022 	ld PI_CR1,a 
                                   1023 ; select internal clock no divisor: 16 Mhz 	
      008586 A6 E1            [ 1] 1024 	ld a,#CLK_SWR_HSI 
      008588 5F               [ 1] 1025 	clrw x  
      008589 CD 81 1E         [ 4] 1026     call clock_init 
      00858C CD 81 34         [ 4] 1027 	call timer4_init
                                   1028 ; UART3 at 115200 BAUD
      00858F CD 82 74         [ 4] 1029 	call uart3_init
                                   1030 ; activate PE_4 (user button interrupt)
      008592 72 18 50 18      [ 1] 1031     bset PE_CR2,#USR_BTN_BIT 
                                   1032 ; display system information
      008596 AE 85 1E         [ 2] 1033 	ldw x,#software 
      008599 CD 82 B0         [ 4] 1034 	call puts 
      00859C A6 01            [ 1] 1035 	ld a,#MAJOR 
      00859E C7 00 0B         [ 1] 1036 	ld acc8,a 
      0085A1 5F               [ 1] 1037 	clrw x 
      0085A2 CF 00 09         [ 2] 1038 	ldw acc24,x 
      0085A5 A6 0A            [ 1] 1039 	ld a,#10 
      0085A7 CD 89 48         [ 4] 1040 	call prti24 
      0085AA A6 2E            [ 1] 1041 	ld a,#'.
      0085AC CD 82 9E         [ 4] 1042 	call putc 
      0085AF A6 00            [ 1] 1043 	ld a,#MINOR 
      0085B1 C7 00 0B         [ 1] 1044 	ld acc8,a 
      0085B4 5F               [ 1] 1045 	clrw x 
      0085B5 CF 00 09         [ 2] 1046 	ldw acc24,x 
      0085B8 A6 0A            [ 1] 1047 	ld a,#10 
      0085BA CD 89 48         [ 4] 1048 	call prti24 
      0085BD A6 0D            [ 1] 1049 	ld a,#CR 
      0085BF CD 82 9E         [ 4] 1050 	call putc 
      0085C2 CD 98 A7         [ 4] 1051 	call seek_fdrive  
                                   1052 ; configure LED2 pin 
      0085C5 72 1A 50 0D      [ 1] 1053     bset PC_CR1,#LED2_BIT
      0085C9 72 1A 50 0E      [ 1] 1054     bset PC_CR2,#LED2_BIT
      0085CD 72 1A 50 0C      [ 1] 1055     bset PC_DDR,#LED2_BIT
      0085D1 9A               [ 1] 1056 	rim 
      0085D2 AE 16 C8         [ 2] 1057 	ldw x,#tib
      0085D5 CF 00 22         [ 2] 1058 	ldw array_addr,x 
      0085D8 72 5C 00 11      [ 1] 1059 	inc seedy+1 
      0085DC 72 5C 00 0F      [ 1] 1060 	inc seedx+1 
      0085E0 CD 85 EF         [ 4] 1061 	call clear_basic
      0085E3 CD 93 FC         [ 4] 1062 	call ubound 
      0085E6 CD 8F AD         [ 4] 1063 	call dpop 
      0085E9 CF 00 24         [ 2] 1064 	ldw array_size,x 
      0085EC CC 87 71         [ 2] 1065     jp warm_start 
                                   1066 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      0085EF                       1067 clear_basic:
      0085EF 5F               [ 1] 1068 	clrw x 
      0085F0 CF 00 06         [ 2] 1069 	ldw lineno,x
      0085F3 72 5F 00 03      [ 1] 1070 	clr count 
      0085F7 AE 00 5C         [ 2] 1071 	ldw x,#free_ram 
      0085FA CF 00 1D         [ 2] 1072 	ldw txtbgn,x 
      0085FD CF 00 1F         [ 2] 1073 	ldw txtend,x 
      008600 CD 84 FF         [ 4] 1074 	call clear_vars 
      008603 81               [ 4] 1075 	ret 
                                   1076 
      008604                       1077 err_msg:
      008604 00 00 86 1C 86 2A 86  1078 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             39 86 53 86 63
      008610 86 7A 86 91 86 AC 86  1079 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             BE 86 D0
      00861A 86 DD                 1080 	.word err_no_access 
                                   1081 
      00861C 0A 4D 65 6D 6F 72 79  1082 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      00862A 0A 73 79 6E 74 61 78  1083 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      008639 0A 6D 61 74 68 20 6F  1084 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      008653 0A 64 69 76 69 73 69  1085 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      008663 0A 69 6E 76 61 6C 69  1086 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      00867A 0A 72 75 6E 20 74 69  1087 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      008691 0A 63 6F 6D 6D 61 6E  1088 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      0086AC 0A 64 75 70 6C 69 63  1089 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      0086BE 0A 46 69 6C 65 20 6E  1090 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      0086D0 0A 62 61 64 20 76 61  1091 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      0086DD 0A 46 69 6C 65 20 69  1092 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal  6D-Bits]



             6D 20 74 68 65 72 65
             2E 0A 00
                                   1093 
      000691                       1094 syntax_error:
      008708 20 74            [ 1] 1095 	ld a,#ERR_SYNTAX 
                                   1096 
      000693                       1097 tb_error:
      00870A 68 65 72         [ 2] 1098 	ldw x, #err_msg 
      00870D 65 2E 0A 00      [ 1] 1099 	clr acc16 
      008711 48               [ 1] 1100 	sll a
      008711 A6 02 00 09      [ 1] 1101 	rlc acc16  
      008713 C7 00 0A         [ 1] 1102 	ld acc8, a 
      008713 AE 86 04 72      [ 2] 1103 	addw x,acc16 
      008717 5F               [ 2] 1104 	ldw x,(x)
      008718 00 0A 48         [ 4] 1105 	call puts
      00871B 72 59 00         [ 2] 1106 	ldw x,lineno 
      00871E 0A               [ 2] 1107 	tnzw x 
      00871F C7 00            [ 1] 1108 	jreq 2$
      008721 0B 72 BB         [ 2] 1109 	ldw acc16,x 
      008724 00 0A FE CD      [ 1] 1110 	clr acc24 
      008728 82 B0 CE         [ 2] 1111 	ldw x,#5 
      00872B 00 06            [ 1] 1112 	ld a,#10 
      00872D 5D 27 0F         [ 4] 1113 	call prti24
      0006BF                       1114 2$:	 
      008730 CF 00 0A         [ 2] 1115 	ldw x,basicptr   
      008733 72 5F 00         [ 1] 1116 	ld a,lineno 
      008736 09 AE 00         [ 1] 1117 	or a,lineno+1
      008739 05 A6            [ 1] 1118 	jreq 3$
      00873B 0A CD 89         [ 2] 1119 	addw x,#3 
      00873E 48 02 30         [ 4] 1120 3$:	call puts 
      00873F A6 0D            [ 1] 1121 	ld a,#CR 
      00873F CE 00 04         [ 4] 1122 	call putc 
      008742 C6               [ 1] 1123 	clrw x 
      008743 00 06 CA         [ 1] 1124 	ld a,lineno 
      008746 00 07 27         [ 1] 1125 	or a,lineno+1
      008749 03 1C            [ 1] 1126 	jreq 4$
      00874B 00 03 CD         [ 2] 1127 	ldw x,#5 
      00874E 82 B0 A6 0D      [ 2] 1128 4$:	addw x,in.w 
      008752 CD 82 9E         [ 4] 1129 	call spaces
      008755 5F C6            [ 1] 1130 	ld a,#'^ 
      008757 00 06 CA         [ 4] 1131 	call putc 
      00875A 00 07 27         [ 2] 1132 1$: ldw x,#STACK_EMPTY 
      00875D 03               [ 1] 1133     ldw sp,x
      0006F1                       1134 warm_start:
      00875E AE 00 05 72      [ 1] 1135 	clr flags 
      008762 BB 00 01 CD      [ 1] 1136 	clr untok
      008766 82               [ 1] 1137 	clrw x 
      008767 EC A6 5E         [ 2] 1138 	ldw tokval,x 
      00876A CD 82 9E AE      [ 1] 1139 	clr loop_depth 
      00876E 17 FF 94         [ 2] 1140 	ldw x,#dstack_unf 
      008771 CF 00 1A         [ 2] 1141 	ldw dstkptr,x 
      008771 72 5F 00 26      [ 1] 1142 	mov tab_width,#TAB_WIDTH 
      008775 72 5F 00 12      [ 1] 1143 	mov base,#10 
      008779 5F               [ 1] 1144 	clrw x 
      00877A CF 00 13         [ 2] 1145 	ldw lineno,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      00877D 72 5F 00         [ 2] 1146 	ldw x,#tib 
      008780 21 AE 17         [ 2] 1147 	ldw basicptr,x 
                                   1148 
                                   1149 ;----------------------------
                                   1150 ; tokenizer test
                                   1151 ;----------------------------
                           000000  1152   TOK_TEST=0 
                           000000  1153 .if TOK_TEST 
                                   1154 test_tok:
                                   1155 	clr in.w 
                                   1156 	clr in 
                                   1157 	ld a,#CR 
                                   1158 	call putc 
                                   1159 	ld a,#'> 
                                   1160 	call putc 
                                   1161 	call readln
                                   1162 	ldw x,#tib 
                                   1163 1$:	call get_token	
                                   1164 	tnz a 
                                   1165 	jrne 2$
                                   1166 	jra test_tok 
                                   1167 2$:	push a 
                                   1168 	cp a,#TK_INTGR
                                   1169 	jrne 3$
                                   1170 	ld a,#10 
                                   1171 	clrw x
                                   1172 	call itoa
                                   1173 	ldw y,x 
                                   1174 	ldw x,#pad 
                                   1175 	call strcpy    
                                   1176 3$:	ld a,(1,sp) 
                                   1177 	cp a,#20
                                   1178 	jrmi 34$
                                   1179 	ld a,#'2 
                                   1180 	call putc 
                                   1181 	ld a,(1,sp)
                                   1182 	sub a,#20
                                   1183 	ld (1,sp),a
                                   1184 	jra 36$   
                                   1185 34$: 
                                   1186 	cp a,#10
                                   1187 	jrmi 36$ 
                                   1188 	ld a,#'1 
                                   1189 	call putc
                                   1190 	ld a,(1,sp)
                                   1191 	sub a,#10 
                                   1192 	ld (1,sp),a  
                                   1193 36$:
                                   1194 	pop a 
                                   1195 	add a,#'0 
                                   1196 	call putc 
                                   1197 	ld a,#SPACE 
                                   1198 	call putc 
                                   1199 	ldw x,#pad 
                                   1200 	call puts 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



                                   1201 	ld a,#CR 
                                   1202 	call putc 
                                   1203 	jra 1$
                                   1204 .endif
                                   1205 ;----------------------------
      000719                       1206 interp:
      008783 80 CF 00 1B      [ 1] 1207 	clr in.w
      008787 35 04 00 27 35   [ 2] 1208 	btjf flags,#FRUN,4$ 
                                   1209 ; running program
                                   1210 ; goto next basic line 
      00878C 0A 00 08         [ 2] 1211 	ldw x,basicptr
      00878F 5F CF            [ 1] 1212 	ld a,(2,x) ; line length 
      008791 00 06 AE         [ 1] 1213 	ld acc8,a 
      008794 16 C8 CF 00      [ 1] 1214 	clr acc16 
      008798 04 00 03         [ 2] 1215 	addw x,#3 
      008799 72 BB 00 09      [ 2] 1216 	addw x,acc16
      008799 72 5F 00         [ 2] 1217 	cpw x,txtend 
      00879C 01 72            [ 1] 1218 	jrpl warm_start
      00879E 01 00 26         [ 2] 1219 	ldw basicptr,x ; start of next line  
      0087A1 2C CE            [ 1] 1220 	ld a,(2,x)
      0087A3 00 04            [ 1] 1221 	add a,#2 ; because 'in' start at 3.
      0087A5 E6 02 C7         [ 1] 1222 	ld count,a 
      0087A8 00               [ 2] 1223 	ldw x,(x) ; line no 
      0087A9 0B 72 5F         [ 2] 1224 	ldw lineno,x 
      0087AC 00 0A 1C 00      [ 1] 1225 	mov in,#3 ; skip first 3 bytes of line 
      0087B0 03 72            [ 2] 1226 	jra interp_loop 
      00074E                       1227 4$: ; commande line mode 	
      0087B2 BB 00 0A C3      [ 1] 1228 	clr in 
      0087B6 00 1F            [ 1] 1229 	ld a,#CR 
      0087B8 2A B7 CF         [ 4] 1230 	call putc 
      0087BB 00 04            [ 1] 1231 	ld a,#'> 
      0087BD E6 02 AB         [ 4] 1232 	call putc 
      0087C0 02 C7 00         [ 4] 1233 	call readln
      00075F                       1234 interp_loop:
      0087C3 03 FE CF         [ 1] 1235 	ld a,in 
      0087C6 00 06 35         [ 1] 1236 	cp a,count 
      0087C9 03 00            [ 1] 1237 	jrpl interp
      0087CB 02 20 11         [ 4] 1238 	call get_token
      0087CE A1 07            [ 1] 1239 	cp a,#TK_COLON 
      0087CE 72 5F            [ 1] 1240 	jreq interp_loop 
      0087D0 00 02            [ 1] 1241 	cp a,#TK_NONE 
      0087D2 A6 0D            [ 1] 1242 	jreq interp 
      000772                       1243 1$:
      0087D4 CD 82            [ 1] 1244 	cp a,#TK_VAR
      0087D6 9E A6            [ 1] 1245 	jrne 2$
      0087D8 3E CD 82         [ 4] 1246 	call let02  
      0087DB 9E CD            [ 2] 1247 	jra interp_loop 
      00077B                       1248 2$:	
      0087DD 8A 2F            [ 1] 1249 	cp a,#TK_ARRAY 
      0087DF 26 08            [ 1] 1250 	jrne 3$
      0087DF C6 00 02         [ 4] 1251 	call get_array_element
      0087E2 C1 00 03         [ 4] 1252 	call let02 
      0087E5 2A B2            [ 2] 1253 	jra interp_loop 
      000787                       1254 3$:
      0087E7 CD 8C            [ 1] 1255 	cp a,#TK_CMD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      0087E9 D8 A1            [ 1] 1256 	jrne 4$
      0087EB 07 27 F1         [ 4] 1257 	call execute 
      0087EE A1 00            [ 2] 1258 	jra interp_loop 
      0087F0 27 A7            [ 1] 1259 4$:	cp a,#TK_INTGR
      0087F2 26 06            [ 1] 1260 	jrne 5$
      0087F2 A1 01 26         [ 4] 1261 	call insert_line 
      0087F5 05 CD 94         [ 2] 1262 	jp interp
      00079A                       1263 5$: 
      0087F8 17 20 E4         [ 2] 1264 	jp syntax_error 
                                   1265 
                                   1266 ;----------------------------------------
                                   1267 ;   DEBUG support functions
                                   1268 ;----------------------------------------
                           000001  1269 .if DEBUG 
                                   1270 ; turn LED on 
      0087FB                       1271 ledon:
      0087FB A1 02 26 08      [ 1] 1272     bset PC_ODR,#LED2_BIT
      0087FF CD               [ 4] 1273     ret 
                                   1274 
                                   1275 ; turn LED off 
      0007A2                       1276 ledoff:
      008800 92 45 CD 94      [ 1] 1277     bres PC_ODR,#LED2_BIT 
      008804 17               [ 4] 1278     ret 
                                   1279 
                                   1280 ; invert LED status 
      0007A7                       1281 ledtoggle:
      008805 20 D8            [ 1] 1282     ld a,#LED2_MASK
      008807 C8 50 0A         [ 1] 1283     xor a,PC_ODR
      008807 A1 06 26         [ 1] 1284     ld PC_ODR,a
      00880A 05               [ 4] 1285     ret 
                                   1286 
      0007B0                       1287 left_paren:
      00880B CD 91            [ 1] 1288 	ld a,#SPACE 
      00880D AE 20 CF         [ 4] 1289 	call putc
      008810 A1 0A            [ 1] 1290 	ld a,#'( 
      008812 26 06 CD         [ 4] 1291 	call putc 	
      008815 84               [ 4] 1292 	ret 
                                   1293 
                                   1294 ;------------------------------
                                   1295 ; print 8 bit register 
                                   1296 ; input:
                                   1297 ;   X  point to register name 
                                   1298 ;   A  register value to print 
                                   1299 ; output:
                                   1300 ;   none
                                   1301 ;------------------------------- 
      0007BB                       1302 prt_reg8:
      008816 84               [ 1] 1303 	push a 
      008817 CC 87 99         [ 4] 1304 	call puts 
      00881A 7B 01            [ 1] 1305 	ld a,(1,sp) 
      00881A CC 87 11         [ 1] 1306 	ld acc8,a 
      00881D 5F               [ 1] 1307 	clrw x 
      00881D 72 1A 50         [ 2] 1308 	ldw acc24,x 
      008820 0A 81            [ 1] 1309 	ld a,#16 
      008822 CD 08 C8         [ 4] 1310 	call prti24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008822 72 1B 50         [ 4] 1311 	call left_paren 
      008825 0A               [ 1] 1312 	pop a 
      008826 81 00 0A         [ 1] 1313 	ld acc8,a 
      008827 5F               [ 1] 1314 	clrw x 
      008827 A6 20 C8         [ 2] 1315 	ldw acc24,x 
      00882A 50 0A            [ 1] 1316 	ld a,#10 
      00882C C7 50 0A         [ 4] 1317 	call prti24 
      00882F 81 29            [ 1] 1318 	ld a,#') 
      008830 CD 02 1E         [ 4] 1319 	call putc
      008830 A6               [ 4] 1320 	ret
                                   1321 
                                   1322 ;--------------------------------
                                   1323 ; print 16 bits register 
                                   1324 ; input:
                                   1325 ;   X   point register name 
                                   1326 ;   Y   register value to print 
                                   1327 ; output:
                                   1328 ;  none
                                   1329 ;--------------------------------
      0007E3                       1330 prt_reg16: 
      008831 20 CD            [ 2] 1331 	pushw y 
      008833 82 9E A6         [ 4] 1332 	call puts 
      008836 28 CD            [ 2] 1333 	ldw x,(1,sp) 
      008838 82 9E 81         [ 2] 1334 	ldw acc16,x 
      00883B 72 5F 00 08      [ 1] 1335 	clr acc24 
      00883B 88               [ 1] 1336 	clrw x 
      00883C CD 82            [ 1] 1337 	ld a,#16 
      00883E B0 7B 01         [ 4] 1338 	call prti24 
      008841 C7 00 0B         [ 4] 1339 	call left_paren 
      008844 5F               [ 2] 1340 	popw x 
      008845 CF 00 09         [ 2] 1341 	ldw acc16,x 
      008848 A6 10 CD 89      [ 1] 1342 	clr acc24
      00884C 48 CD 88 30 84   [ 2] 1343 	btjf acc16,#7,1$
      008851 C7 00 0B 5F      [ 1] 1344 	cpl acc24 
      008855 CF               [ 1] 1345 1$:	clrw x 
      008856 00 09            [ 1] 1346 	ld a,#10 
      008858 A6 0A CD         [ 4] 1347 	call prti24 
      00885B 89 48            [ 1] 1348 	ld a,#') 
      00885D A6 29 CD         [ 4] 1349 	call putc
      008860 82               [ 4] 1350 	ret 
                                   1351 
                                   1352 ;------------------------------------
                                   1353 ; print registers contents saved on
                                   1354 ; stack by trap interrupt.
                                   1355 ;------------------------------------
      000817                       1356 print_registers:
      008861 9E 81 6A         [ 2] 1357 	ldw x,#STATES
      008863 CD 02 30         [ 4] 1358 	call puts
                                   1359 ; print EPC 
      008863 90 89 CD         [ 2] 1360 	ldw x, #REG_EPC
      008866 82 B0 1E         [ 4] 1361 	call puts 
      008869 01 CF            [ 1] 1362 	ld a, (11,sp)
      00886B 00 0A 72         [ 1] 1363 	ld acc8,a 
      00886E 5F 00            [ 1] 1364 	ld a, (10,sp) 
      008870 09 5F A6         [ 1] 1365 	ld acc16,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008873 10 CD            [ 1] 1366 	ld a,(9,sp) 
      008875 89 48 CD         [ 1] 1367 	ld acc24,a
      008878 88               [ 1] 1368 	clrw x  
      008879 30 85            [ 1] 1369 	ld a,#16
      00887B CF 00 0A         [ 4] 1370 	call prti24  
                                   1371 ; print X
      00887E 72 5F 00         [ 2] 1372 	ldw x,#REG_X
      008881 09 72            [ 2] 1373 	ldw y,(5,sp)
      008883 0F 00 0A         [ 4] 1374 	call prt_reg16  
                                   1375 ; print Y 
      008886 04 72 53         [ 2] 1376 	ldw x,#REG_Y
      008889 00 09            [ 2] 1377 	ldw y, (7,sp)
      00888B 5F A6 0A         [ 4] 1378 	call prt_reg16  
                                   1379 ; print A 
      00888E CD 89 48         [ 2] 1380 	ldw x,#REG_A
      008891 A6 29            [ 1] 1381 	ld a, (4,sp) 
      008893 CD 82 9E         [ 4] 1382 	call prt_reg8
                                   1383 ; print CC 
      008896 81 08 BC         [ 2] 1384 	ldw x,#REG_CC 
      008897 7B 03            [ 1] 1385 	ld a, (3,sp) 
      008897 AE 88 EA         [ 4] 1386 	call prt_reg8 
                                   1387 ; print SP 
      00889A CD 82 B0         [ 2] 1388 	ldw x,#REG_SP
      00889D AE 89            [ 1] 1389 	ldw y,sp 
      00889F 27 CD 82 B0      [ 2] 1390 	addw y,#12
      0088A3 7B 0B C7         [ 4] 1391 	call prt_reg16  
      0088A6 00 0B            [ 1] 1392 	ld a,#'\n' 
      0088A8 7B 0A C7         [ 4] 1393 	call putc
      0088AB 00               [ 4] 1394 	ret
                                   1395 
      0088AC 0A 7B 09 C7 00 09 5F  1396 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             A6 10 CD 89 48 AE 89
             32 16 05 CD 88 63 AE
             89 2D 16 07 CD 88 63
             AE 89 37 7B 04 CD 88
             3B AE 89 3C 7B 03 CD
             88 3B AE 89 42 90 96
             72 A9 00 0C CD 88 63
             A6 0A CD 82 9E
      0088E9 81 0A 52 65 67 69     1397 REG_EPC: .asciz "EPC: "
      0088EF 73 74 65 72 73        1398 REG_Y:   .asciz "\nY: " 
      0088F4 20 73 74 61 74        1399 REG_X:   .asciz "\nX: "
      0088F9 65 20 61 74 20        1400 REG_A:   .asciz "\nA: " 
      0088FE 61 62 6F 72 74 20     1401 REG_CC:  .asciz "\nCC: "
      008904 70 6F 69 6E 74 2E     1402 REG_SP:  .asciz "\nSP: "
                                   1403 .endif 
                                   1404 
                                   1405 ;------------------------------------
                                   1406 ; print integer in acc24 
                                   1407 ; input:
                                   1408 ;	acc24 		integer to print 
                                   1409 ;	A 			numerical base for conversion 
                                   1410 ;               if bit 7 is set add a space at print end.
                                   1411 ;   XL 			field width, 0 -> no fill.
                                   1412 ;  output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



                                   1413 ;    none 
                                   1414 ;------------------------------------
                           000001  1415 	WIDTH = 1
                           000002  1416 	BASE = 2
                           000003  1417 	ADD_SPACE=3 ; add a space after number 
                           000003  1418 	VSIZE = 3
      0008C8                       1419 prti24:
      0008C8                       1420 	_vars VSIZE 
      00890A 0A 2D            [ 2]    1     sub sp,#VSIZE 
      00890C 2D 2D            [ 1] 1421 	clr (ADD_SPACE,sp)
      00890E 2D 2D            [ 1] 1422 	bcp a,#0x80 
      008910 2D 2D            [ 1] 1423 	jreq 0$ 
      008912 2D 2D            [ 1] 1424 	cpl (ADD_SPACE,sp)
      008914 2D 2D            [ 1] 1425 0$:	and a,#31 
      008916 2D 2D            [ 1] 1426 	ld (BASE,sp),a
      008918 2D               [ 1] 1427 	ld a,xl
      008919 2D 2D            [ 1] 1428 	ld (WIDTH,sp),a 
      00891B 2D 2D            [ 1] 1429 	ld a, (BASE,sp)  
      00891D 2D 2D 2D         [ 4] 1430     call itoa  ; conversion entier en  .asciz
      008920 2D 2D            [ 1] 1431 1$: ld a,(WIDTH,sp)
      008922 2D 2D            [ 1] 1432 	jreq 4$
      008924 2D 0A 00         [ 1] 1433 	ld acc8,a 
      008927 45               [ 2] 1434 	pushw x 
      008928 50 43 3A         [ 4] 1435 	call strlen 
      00892B 20               [ 1] 1436 	ld a,xl 
      00892C 00               [ 2] 1437 	popw x 
      00892D 0A 59 3A         [ 3] 1438 	exg a,acc8 
      008930 20 00 0A         [ 1] 1439 	sub a,acc8 
      008933 58 3A            [ 1] 1440 	jrmi 4$
      008935 20 00            [ 1] 1441 	ld (WIDTH,sp),a 
      008937 0A 41            [ 1] 1442 	ld  a,#SPACE
      008939 3A 20            [ 1] 1443 3$: tnz (WIDTH,sp)
      00893B 00 0A            [ 1] 1444 	jreq 4$
      00893D 43               [ 2] 1445 	decw x 
      00893E 43               [ 1] 1446 	ld (x),a 
      00893F 3A 20            [ 1] 1447 	dec (WIDTH,sp) 
      008941 00 0A            [ 2] 1448 	jra 3$
      000901                       1449 4$: 
      008943 53 50 3A         [ 4] 1450 	call puts 
      008946 20 00            [ 1] 1451 	tnz (ADD_SPACE,sp)
      008948 27 05            [ 1] 1452 	jreq 5$
      008948 52 03            [ 1] 1453     ld a,#SPACE 
      00894A 0F 03 A5         [ 4] 1454 	call putc 
      00090D                       1455 5$: _drop VSIZE 
      00894D 80 27            [ 2]    1     addw sp,#VSIZE 
      00894F 02               [ 4] 1456     ret	
                                   1457 
                                   1458 ;-----------------------------
                                   1459 ; intialize parser ready for
                                   1460 ; for a new line analysis
                                   1461 ; input:
                                   1462 ;   none
                                   1463 ; output:
                                   1464 ;	none 
                                   1465 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      000910                       1466 parser_init::
      008950 03 03 A4 1F      [ 1] 1467 	clr in.w 
      008954 6B 02 9F 6B      [ 1] 1468 	clr in
      008958 01 7B 02 CD      [ 1] 1469 	clr pad  
      00895C 89               [ 4] 1470 	ret 
                                   1471 
                                   1472 ;------------------------------------
                                   1473 ; convert integer to string
                                   1474 ; input:
                                   1475 ;   A	  	base
                                   1476 ;	acc24	integer to convert
                                   1477 ; output:
                                   1478 ;   X  		pointer to string
                                   1479 ;------------------------------------
                           000001  1480 	SIGN=1  ; integer sign 
                           000002  1481 	BASE=2  ; numeric base 
                           000002  1482 	VSIZE=2  ;locals size
      00091D                       1483 itoa:
      00895D 9D 7B            [ 2] 1484 	sub sp,#VSIZE
      00895F 01 27            [ 1] 1485 	ld (BASE,sp), a  ; base
      008961 1F C7            [ 1] 1486 	clr (SIGN,sp)    ; sign
      008963 00 0B            [ 1] 1487 	cp a,#10
      008965 89 CD            [ 1] 1488 	jrne 1$
                                   1489 	; base 10 string display with negative sign if bit 23==1
      008967 83 86 9F 85 31   [ 2] 1490 	btjf acc24,#7,1$
      00896C 00 0B            [ 1] 1491 	cpl (SIGN,sp)
      00896E C0 00 0B         [ 4] 1492 	call neg_acc24
      000931                       1493 1$:
                                   1494 ; initialize string pointer 
      008971 2B 0E 6B         [ 2] 1495 	ldw x,#pad+PAD_SIZE-1
      008974 01               [ 1] 1496 	clr (x)
      000935                       1497 itoa_loop:
      008975 A6 20            [ 1] 1498     ld a,(BASE,sp)
      008977 0D 01 27         [ 4] 1499     call divu24_8 ; acc24/A 
      00897A 06 5A            [ 1] 1500     add a,#'0  ; remainder of division
      00897C F7 0A            [ 1] 1501     cp a,#'9+1
      00897E 01 20            [ 1] 1502     jrmi 2$
      008980 F6 07            [ 1] 1503     add a,#7 
      008981 5A               [ 2] 1504 2$: decw x
      008981 CD               [ 1] 1505     ld (x),a
                                   1506 	; if acc24==0 conversion done
      008982 82 B0 0D         [ 1] 1507 	ld a,acc24
      008985 03 27 05         [ 1] 1508 	or a,acc16
      008988 A6 20 CD         [ 1] 1509 	or a,acc8
      00898B 82 9E            [ 1] 1510     jrne itoa_loop
                                   1511 	;conversion done, next add '$' or '-' as required
      00898D 5B 03            [ 1] 1512 	ld a,(BASE,sp)
      00898F 81 10            [ 1] 1513 	cp a,#16
      008990 27 08            [ 1] 1514 	jreq 8$
      008990 72 5F            [ 1] 1515 	ld a,(SIGN,sp)
      008992 00 01            [ 1] 1516     jreq 10$
      008994 72 5F            [ 1] 1517     ld a,#'-
      008996 00 02            [ 2] 1518 	jra 9$ 
      008998 72 5F            [ 1] 1519 8$: ld a,#'$ 
      00899A 17               [ 2] 1520 9$: decw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00899B 18               [ 1] 1521     ld (x),a
      000961                       1522 10$:
      00899C 81 02            [ 2] 1523 	addw sp,#VSIZE
      00899D 81               [ 4] 1524 	ret
                                   1525 
                                   1526 ;-------------------------------------
                                   1527 ; divide uint24_t by uint8_t
                                   1528 ; used to convert uint24_t to string
                                   1529 ; input:
                                   1530 ;	acc24	dividend
                                   1531 ;   A 		divisor
                                   1532 ; output:
                                   1533 ;   acc24	quotient
                                   1534 ;   A		remainder
                                   1535 ;------------------------------------- 
                                   1536 ; offset  on sp of arguments and locals
                           000001  1537 	U8   = 1   ; divisor on stack
                           000001  1538 	VSIZE =1
      000964                       1539 divu24_8:
      00899D 52               [ 2] 1540 	pushw x ; save x
      00899E 02               [ 1] 1541 	push a 
                                   1542 	; ld dividend UU:MM bytes in X
      00899F 6B 02 0F         [ 1] 1543 	ld a, acc24
      0089A2 01               [ 1] 1544 	ld xh,a
      0089A3 A1 0A 26         [ 1] 1545 	ld a,acc24+1
      0089A6 0A               [ 1] 1546 	ld xl,a
      0089A7 72 0F            [ 1] 1547 	ld a,(U8,SP) ; divisor
      0089A9 00               [ 2] 1548 	div x,a ; UU:MM/U8
      0089AA 09               [ 1] 1549 	push a  ;save remainder
      0089AB 05               [ 1] 1550 	ld a,xh
      0089AC 03 01 CD         [ 1] 1551 	ld acc24,a
      0089AF 8A               [ 1] 1552 	ld a,xl
      0089B0 0C 00 09         [ 1] 1553 	ld acc24+1,a
      0089B1 84               [ 1] 1554 	pop a
      0089B1 AE               [ 1] 1555 	ld xh,a
      0089B2 17 3F 7F         [ 1] 1556 	ld a,acc24+2
      0089B5 97               [ 1] 1557 	ld xl,a
      0089B5 7B 02            [ 1] 1558 	ld a,(U8,sp) ; divisor
      0089B7 CD               [ 2] 1559 	div x,a  ; R:LL/U8
      0089B8 89 E4            [ 1] 1560 	ld (U8,sp),a ; save remainder
      0089BA AB               [ 1] 1561 	ld a,xl
      0089BB 30 A1 3A         [ 1] 1562 	ld acc24+2,a
      0089BE 2B               [ 1] 1563 	pop a
      0089BF 02               [ 2] 1564 	popw x
      0089C0 AB               [ 4] 1565 	ret
                                   1566 
                                   1567 ;------------------------------------
                                   1568 ;  two's complement acc24
                                   1569 ;  input:
                                   1570 ;		acc24 variable
                                   1571 ;  output:
                                   1572 ;		acc24 variable
                                   1573 ;-------------------------------------
      00098C                       1574 neg_acc24:
      0089C1 07 5A F7 C6      [ 1] 1575 	cpl acc24+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      0089C5 00 09 CA 00      [ 1] 1576 	cpl acc24+1
      0089C9 0A CA 00 0B      [ 1] 1577 	cpl acc24
      0089CD 26 E6            [ 1] 1578 	ld a,#1
      0089CF 7B 02 A1         [ 1] 1579 	add a,acc24+2
      0089D2 10 27 08         [ 1] 1580 	ld acc24+2,a
      0089D5 7B               [ 1] 1581 	clr a
      0089D6 01 27 08         [ 1] 1582 	adc a,acc24+1
      0089D9 A6 2D 20         [ 1] 1583 	ld acc24+1,a 
      0089DC 02               [ 1] 1584 	clr a 
      0089DD A6 24 5A         [ 1] 1585 	adc a,acc24 
      0089E0 F7 00 08         [ 1] 1586 	ld acc24,a 
      0089E1 81               [ 4] 1587 	ret
                                   1588 
                                   1589 
                                   1590 ;------------------------------------
                                   1591 ; read a line of text from terminal
                                   1592 ; input:
                                   1593 ;	none
                                   1594 ; local variable on stack:
                                   1595 ;	LL (1,sp)
                                   1596 ;   RXCHAR (2,sp)
                                   1597 ; output:
                                   1598 ;   text in tib  buffer
                                   1599 ;------------------------------------
                                   1600 	; local variables
                           000001  1601 	LL_HB=1
                           000001  1602 	RXCHAR = 1 ; last char received
                           000002  1603 	LL = 2  ; accepted line length
                           000002  1604 	VSIZE=2 
      0009AF                       1605 readln:
      0089E1 5B               [ 1] 1606 	clrw x 
      0089E2 02               [ 2] 1607 	pushw x 
      0089E3 81 AE 16 C8      [ 2] 1608  	ldw y,#tib ; input buffer
      0089E4                       1609 readln_loop:
      0089E4 89 88 C6         [ 4] 1610 	call getc
      0089E7 00 09            [ 1] 1611 	ld (RXCHAR,sp),a
      0089E9 95 C6            [ 1] 1612 	cp a,#CR
      0089EB 00 0A            [ 1] 1613 	jrne 1$
      0089ED 97 7B 01         [ 2] 1614 	jp readln_quit
      0089F0 62 88            [ 1] 1615 1$:	cp a,#NL
      0089F2 9E C7            [ 1] 1616 	jreq readln_quit
      0089F4 00 09            [ 1] 1617 	cp a,#BSP
      0089F6 9F C7            [ 1] 1618 	jreq del_back
      0089F8 00 0A            [ 1] 1619 	cp a,#CTRL_D
      0089FA 84 95            [ 1] 1620 	jreq del_ln
      0089FC C6 00            [ 1] 1621 	cp a,#CTRL_R 
      0089FE 0B 97            [ 1] 1622 	jreq reprint 
                                   1623 ;	cp a,#'[
                                   1624 ;	jreq ansi_seq
      0009D1                       1625 final_test:
      008A00 7B 01            [ 1] 1626 	cp a,#SPACE
      008A02 62 6B            [ 1] 1627 	jrpl accept_char
      008A04 01 9F            [ 2] 1628 	jra readln_loop
      0009D7                       1629 ansi_seq:
                                   1630 ;	call getc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1631 ;	cp a,#'C 
                                   1632 ;	jreq rigth_arrow
                                   1633 ;	cp a,#'D 
                                   1634 ;	jreq left_arrow 
                                   1635 ;	jra final_test
      0009D7                       1636 right_arrow:
                                   1637 ;	ld a,#BSP 
                                   1638 ;	call putc 
                                   1639 ;	jra realn_loop 
      0009D7                       1640 left_arrow:
                                   1641 
                                   1642 ;	jra readln_loop
      0009D7                       1643 reprint: 
      008A06 C7 00 0B 84      [ 1] 1644 	tnz count 
      008A0A 85 81            [ 1] 1645 	jreq readln_loop
      008A0C 0D 02            [ 1] 1646 	tnz (LL,sp)
      008A0C 72 53            [ 1] 1647 	jrne readln_loop
      008A0E 00 0B 72         [ 2] 1648 	ldw x,#tib 
      008A11 53 00 0A         [ 4] 1649 	call puts
      008A14 72 53 00 09      [ 2] 1650 	ldw y,#tib 
      008A18 A6 01 CB         [ 1] 1651 	ld a,count 
      008A1B 00 0B            [ 1] 1652 	ld (LL,sp),a
      008A1D C7 00 0B 4F      [ 1] 1653 	clr count 
      008A21 C9 00            [ 1] 1654 	clr (LL_HB,sp)
      008A23 0A C7 00         [ 2] 1655 	addw y,(LL_HB,sp)
      008A26 0A 4F            [ 2] 1656 	jra readln_loop 
      0009FB                       1657 del_ln:
      008A28 C9 00            [ 1] 1658 	ld a,(LL,sp)
      008A2A 09 C7 00         [ 4] 1659 	call delete
      008A2D 09 81 16 C8      [ 2] 1660 	ldw y,#tib
      008A2F 90 7F            [ 1] 1661 	clr (y)
      008A2F 5F 89            [ 1] 1662 	clr (LL,sp)
      008A31 90 AE            [ 2] 1663 	jra readln_loop
      000A0A                       1664 del_back:
      008A33 16 C8            [ 1] 1665     tnz (LL,sp)
      008A35 27 A7            [ 1] 1666     jreq readln_loop
      008A35 CD 82            [ 1] 1667     dec (LL,sp)
      008A37 A7 6B            [ 2] 1668     decw y
      008A39 01 A1            [ 1] 1669     clr  (y)
      008A3B 0D 26 03         [ 4] 1670     call bksp 
      008A3E CC 8A            [ 2] 1671     jra readln_loop	
      000A19                       1672 accept_char:
      008A40 AE A1            [ 1] 1673 	ld a,#TIB_SIZE-1
      008A42 0A 27            [ 1] 1674 	cp a, (LL,sp)
      008A44 69 A1            [ 1] 1675 	jreq readln_loop
      008A46 08 27            [ 1] 1676 	ld a,(RXCHAR,sp)
      008A48 41 A1            [ 1] 1677 	ld (y),a
      008A4A 04 27            [ 1] 1678 	inc (LL,sp)
      008A4C 2E A1            [ 1] 1679 	incw y
      008A4E 12 27            [ 1] 1680 	clr (y)
      008A50 06 02 1E         [ 4] 1681 	call putc 
      008A51 20 87            [ 2] 1682 	jra readln_loop
      000A2E                       1683 readln_quit:
      008A51 A1 20            [ 1] 1684 	clr (y)
      008A53 2A 44            [ 1] 1685 	ld a,(LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A55 20 DE 02         [ 1] 1686 	ld count,a 
      008A57                       1687 	_drop VSIZE 
      008A57 5B 02            [ 2]    1     addw sp,#VSIZE 
      008A57 A6 0D            [ 1] 1688 	ld a,#CR
      008A57 CD 02 1E         [ 4] 1689 	call putc
      008A57 72               [ 4] 1690 	ret
                                   1691 
                           000001  1692 .if DEBUG 	
                                   1693 ;----------------------------
                                   1694 ; command interface
                                   1695 ; only 2 commands:
                                   1696 ;  'q' to resume application
                                   1697 ;  'p [addr]' to print memory values 
                                   1698 ;  's addr' to print string 
                                   1699 ;----------------------------
                                   1700 ;local variable 
                           000001  1701 	PSIZE=1
                           000001  1702 	VSIZE=1 
      000A3D                       1703 cmd_itf:
      008A58 5D 00            [ 2] 1704 	sub sp,#VSIZE 
      008A5A 03 27 D8 0D      [ 1] 1705 	clr farptr 
      008A5E 02 26 D4 AE      [ 1] 1706 	clr farptr+1 
      008A62 16 C8 CD 82      [ 1] 1707 	clr farptr+2  
      000A4B                       1708 repl:
      008A66 B0 90            [ 1] 1709 	ld a,#CR 
      008A68 AE 16 C8         [ 4] 1710 	call putc 
      008A6B C6 00            [ 1] 1711 	ld a,#'? 
      008A6D 03 6B 02         [ 4] 1712 	call putc
      008A70 72 5F 00 03      [ 1] 1713 	clr in.w 
      008A74 0F 01 72 F9      [ 1] 1714 	clr in 
      008A78 01 20 BA         [ 4] 1715 	call readln
      008A7B CD 0C 58         [ 4] 1716 	call get_token
      008A7B 7B 02 CD 82      [ 2] 1717 	ldw y,#pad 
      008A7F DE 90            [ 1] 1718 	ld a,(y)
      008A81 AE 16            [ 1] 1719 	incw y
      008A83 C8 90            [ 1] 1720 	cp a,#'Q 
      008A85 7F 0F            [ 1] 1721 	jrne test_p
      000A6F                       1722 repl_exit:
      000A6F                       1723 	_drop #VSIZE 	
      008A87 02 20            [ 2]    1     addw sp,##VSIZE 
      008A89 AB               [ 4] 1724 	ret  
      008A8A                       1725 invalid:
      008A8A 0D 02 27         [ 2] 1726 	ldw x,#invalid_cmd 
      008A8D A7 0A 02         [ 4] 1727 	call puts 
      008A90 90 5A            [ 2] 1728 	jra repl 
      000A7A                       1729 test_p:	
      008A92 90 7F            [ 1] 1730     cp a,#'P 
      008A94 CD 82            [ 1] 1731 	jreq mem_peek
      008A96 CE 20            [ 1] 1732     cp a,#'S 
      008A98 9C F0            [ 1] 1733 	jrne invalid 
      008A99                       1734 print_string:	
      008A99 A6 4F 11         [ 4] 1735 	call get_token
      008A9C 02 27 96         [ 2] 1736 	ldw x,acc16 
      008A9F 7B 01 90         [ 4] 1737 	call puts
      008AA2 F7 0C 02         [ 2] 1738 	jp repl 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      000A8E                       1739 mem_peek:	 
      008AA5 90 5C 90         [ 4] 1740 	call get_token
      008AA8 7F CD 82         [ 1] 1741 	ld a, acc24 
      008AAB 9E 20 87         [ 1] 1742 	or a,acc16 
      008AAE CA 00 0A         [ 1] 1743 	or a,acc8 
      008AAE 90 7F            [ 1] 1744 	jrne 1$ 
      008AB0 7B 02            [ 2] 1745 	jra peek_byte  
      008AB2 C7 00 03         [ 2] 1746 1$:	ldw x,acc24 
      008AB5 5B 02 A6         [ 2] 1747 	ldw farptr,x 
      008AB8 0D CD 82         [ 1] 1748 	ld a,acc8 
      008ABB 9E 81 16         [ 1] 1749 	ld farptr+2,a 
      008ABD                       1750 peek_byte:
      008ABD 52 01 72         [ 4] 1751 	call print_farptr 
      008AC0 5F 00            [ 1] 1752 	ld a,#8 
      008AC2 15 72            [ 1] 1753 	ld (PSIZE,sp),a 
      008AC4 5F               [ 1] 1754 	clrw x 
      008AC5 00 16 72         [ 4] 1755 1$:	call fetchc  
      008AC8 5F               [ 2] 1756 	pushw x 
      008AC9 00 17 0A         [ 1] 1757 	ld acc8,a 
      008ACB 5F               [ 1] 1758 	clrw x 
      008ACB A6 0D CD         [ 2] 1759 	ldw acc24,x 
      008ACE 82 9E            [ 1] 1760 	ld a,#16+128
      008AD0 A6 3F CD         [ 4] 1761 	call prti24
      008AD3 82               [ 2] 1762 	popw x 
      008AD4 9E 72            [ 1] 1763 	dec (PSIZE,sp)
      008AD6 5F 00            [ 1] 1764 	jrne 1$ 
      008AD8 01 72            [ 1] 1765 	ld a,#8 
      008ADA 5F 00 02         [ 1] 1766 	add a,farptr+2 
      008ADD CD 8A 2F         [ 1] 1767 	ld farptr+2,a
      008AE0 CD               [ 1] 1768 	clr a 
      008AE1 8C D8 90         [ 1] 1769 	adc a,farptr+1 
      008AE4 AE 17 18         [ 1] 1770 	ld farptr+1,a 
      008AE7 90               [ 1] 1771 	clr a 
      008AE8 F6 90 5C         [ 1] 1772 	adc a,farptr 
      008AEB A1 51 26         [ 1] 1773 	ld farptr,a 
      008AEE 0B 0A 4B         [ 2] 1774 	jp repl  
                                   1775 
                                   1776 
      008AEF 6E 6F 74 20 61 20 63  1777 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1778 .endif 
                                   1779 
                                   1780 ;----------------------------
                                   1781 ; display farptr address
                                   1782 ;----------------------------
      000AEF                       1783 print_farptr:
      008AEF 5B 01 81         [ 1] 1784 	ld a ,farptr+2 
      008AF2 C7 00 0A         [ 1] 1785 	ld acc8,a 
      008AF2 AE 8B 60         [ 2] 1786 	ldw x,farptr 
      008AF5 CD 82 B0         [ 2] 1787 	ldw acc24,x 
      008AF8 20               [ 1] 1788 	clrw x 
      008AF9 D1 10            [ 1] 1789 	ld a,#16 
      008AFA CD 08 C8         [ 4] 1790 	call prti24
      008AFA A1 50            [ 1] 1791 	ld a,#SPACE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008AFC 27 10 A1         [ 4] 1792 	call putc 
      008AFF 53 26 F0         [ 4] 1793 	call putc 
      008B02 81               [ 4] 1794 	ret
                                   1795 
                                   1796 ;------------------------------------
                                   1797 ; get byte at address farptr[X]
                                   1798 ; input:
                                   1799 ;	 farptr   address to peek
                                   1800 ;    X		  farptr index 	
                                   1801 ; output:
                                   1802 ;	 A 		  byte from memory  
                                   1803 ;    x		  incremented by 1
                                   1804 ;------------------------------------
      000B0A                       1805 fetchc: ; @C
      008B02 CD 8C D8 CE      [ 5] 1806 	ldf a,([farptr],x)
      008B06 00               [ 1] 1807 	incw x
      008B07 0A               [ 4] 1808 	ret
                                   1809 
                                   1810 
                                   1811 ;------------------------------------
                                   1812 ; expect a number from command line 
                                   1813 ; next argument
                                   1814 ;  input:
                                   1815 ;	  none
                                   1816 ;  output:
                                   1817 ;    acc24   int24_t 
                                   1818 ;------------------------------------
      000B10                       1819 number::
      008B08 CD 82 B0         [ 4] 1820 	call get_token
      008B0B CC 8A CB         [ 4] 1821 	call atoi
      008B0E 81               [ 4] 1822 	ret
                                   1823 
                                   1824 ;------------------------------------
                                   1825 ; scan tib for charater 'c' starting from 'in'
                                   1826 ; input:
                                   1827 ;	y  point to tib 
                                   1828 ;	a character to skip
                                   1829 ; output:
                                   1830 ;	in point to chacter 'c'
                                   1831 ;------------------------------------
                           000001  1832 	C = 1 ; local var
      000B17                       1833 scan: 
      008B0E CD               [ 1] 1834 	push a
      008B0F 8C D8 C6         [ 4] 1835 1$:	ld a,([in.w],y)
      008B12 00 09            [ 1] 1836 	jreq 2$
      008B14 CA 00            [ 1] 1837 	cp a,(C,sp)
      008B16 0A CA            [ 1] 1838 	jreq 2$
      008B18 00 0B 26 02      [ 1] 1839 	inc in
      008B1C 20 0C            [ 2] 1840 	jra 1$
      008B1E CE               [ 1] 1841 2$: pop a
      008B1F 00               [ 4] 1842 	ret
                                   1843 
                                   1844 ;------------------------------------
                                   1845 ; parse quoted string 
                                   1846 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1847 ;   Y 	pointer to tib 
                                   1848 ;   X   pointer to pab 
                                   1849 ; output:
                                   1850 ;	pad   parsed string
                                   1851 ;   TOS  char* to pad  
                                   1852 ;------------------------------------
                           000001  1853 	PREV = 1
                           000002  1854 	CURR =2 
                           000002  1855 	VSIZE=2 
      000B29                       1856 parse_quote: ; { -- addr }
      000B29                       1857 	_vars VSIZE 
      008B20 09 CF            [ 2]    1     sub sp,#VSIZE 
      008B22 00               [ 1] 1858 	clr a
      008B23 15 C6            [ 1] 1859 1$:	ld (PREV,sp),a 
      008B25 00 0B C7 00      [ 1] 1860 2$:	inc in
      008B29 17 D6 00         [ 4] 1861 	ld a,([in.w],y)
      008B2A 27 24            [ 1] 1862 	jreq 6$
      008B2A CD 8B            [ 1] 1863 	ld (CURR,sp),a 
      008B2C 6F A6            [ 1] 1864 	ld a,#'\
      008B2E 08 6B            [ 1] 1865 	cp a, (PREV,sp)
      008B30 01 5F            [ 1] 1866 	jrne 3$
      008B32 CD 8B            [ 1] 1867 	clr (PREV,sp)
      008B34 8A 89            [ 1] 1868 	ld a,(CURR,sp)
      008B36 C7 00            [ 4] 1869 	callr convert_escape
      008B38 0B               [ 1] 1870 	ld (x),a 
      008B39 5F               [ 1] 1871 	incw x 
      008B3A CF 00            [ 2] 1872 	jra 2$
      000B49                       1873 3$:
      008B3C 09 A6            [ 1] 1874 	ld a,(CURR,sp)
      008B3E 90 CD            [ 1] 1875 	cp a,#'\'
      008B40 89 48            [ 1] 1876 	jreq 1$
      008B42 85 0A            [ 1] 1877 	cp a,#'"
      008B44 01 26            [ 1] 1878 	jreq 5$ 
      008B46 EB               [ 1] 1879 	ld (x),a 
      008B47 A6               [ 1] 1880 	incw x 
      008B48 08 CB            [ 2] 1881 	jra 2$
      008B4A 00 17 C7 00      [ 1] 1882 5$:	inc in 
      008B4E 17               [ 1] 1883 6$: clr (x)
      008B4F 4F C9 00         [ 2] 1884 	ldw x,#pad 
      008B52 16 C7 00         [ 4] 1885 	call dpush  
      000B62                       1886 	_drop VSIZE
      008B55 16 4F            [ 2]    1     addw sp,#VSIZE 
      008B57 C9 00            [ 1] 1887 	ld a,#TK_QSTR  
      008B59 15               [ 4] 1888 	ret 
                                   1889 
                                   1890 ;---------------------------------------
                                   1891 ; called by parse_quote
                                   1892 ; subtitute escaped character 
                                   1893 ; by their ASCII value .
                                   1894 ; input:
                                   1895 ;   A  character following '\'
                                   1896 ; output:
                                   1897 ;   A  substitued char or same if not valid.
                                   1898 ;---------------------------------------
      000B67                       1899 convert_escape:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008B5A C7 00            [ 1] 1900 	cp a,#'a'
      008B5C 15 CC            [ 1] 1901 	jrne 1$
      008B5E 8A CB            [ 1] 1902 	ld a,#7
      008B60 6E               [ 4] 1903 	ret 
      008B61 6F 74            [ 1] 1904 1$: cp a,#'b'
      008B63 20 61            [ 1] 1905 	jrne 2$
      008B65 20 63            [ 1] 1906 	ld a,#8
      008B67 6F               [ 4] 1907 	ret 
      008B68 6D 6D            [ 1] 1908 2$: cp a,#'e' 
      008B6A 61 6E            [ 1] 1909     jrne 3$
      008B6C 64 0A            [ 1] 1910 	ld a,#'\'
      008B6E 00               [ 4] 1911 	ret  
      008B6F A1 5C            [ 1] 1912 3$: cp a,#'\'
      008B6F C6 00            [ 1] 1913 	jrne 4$
      008B71 17 C7            [ 1] 1914 	ld a,#'\'
      008B73 00               [ 4] 1915 	ret 
      008B74 0B CE            [ 1] 1916 4$: cp a,#'f' 
      008B76 00 15            [ 1] 1917 	jrne 5$ 
      008B78 CF 00            [ 1] 1918 	ld a,#FF 
      008B7A 09               [ 4] 1919 	ret  
      008B7B 5F A6            [ 1] 1920 5$: cp a,#'n' 
      008B7D 10 CD            [ 1] 1921     jrne 6$ 
      008B7F 89 48            [ 1] 1922 	ld a,#0xa 
      008B81 A6               [ 4] 1923 	ret  
      008B82 20 CD            [ 1] 1924 6$: cp a,#'r' 
      008B84 82 9E            [ 1] 1925 	jrne 7$
      008B86 CD 82            [ 1] 1926 	ld a,#0xd 
      008B88 9E               [ 4] 1927 	ret  
      008B89 81 74            [ 1] 1928 7$: cp a,#'t' 
      008B8A 26 03            [ 1] 1929 	jrne 8$ 
      008B8A 92 AF            [ 1] 1930 	ld a,#9 
      008B8C 00               [ 4] 1931 	ret  
      008B8D 15 5C            [ 1] 1932 8$: cp a,#'v' 
      008B8F 81 02            [ 1] 1933 	jrne 9$  
      008B90 A6 0B            [ 1] 1934 	ld a,#0xb 
      008B90 CD               [ 4] 1935 9$:	ret 
                                   1936 
                                   1937 ;-------------------------
                                   1938 ; integer parser 
                                   1939 ; input:
                                   1940 ;   X 		point to pad 
                                   1941 ;   Y 		point to tib 
                                   1942 ;   A 	    first digit|'$' 
                                   1943 ; output:  
                                   1944 ;   pad     number string 
                                   1945 ;   X 		integer 
                                   1946 ;   A 		TK_INTGR
                                   1947 ;   TOS     integer 
                                   1948 ;-------------------------
                           000001  1949 	BASE=1
                           000002  1950 	TCHAR=2 
                           000002  1951 	VSIZE=2 
      000BA6                       1952 parse_integer: ; { -- n }
      008B91 8C D8            [ 1] 1953 	push #0 ; TCHAR 
      008B93 CD 8E            [ 1] 1954 	cp a,#'$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008B95 E1 81            [ 1] 1955 	jreq 1$ 
      008B97 4B 0A            [ 1] 1956 	push #10 ; BASE=10 
      008B97 88 91            [ 2] 1957 	jra 2$ 
      008B99 D6 01            [ 1] 1958 1$: push #16  ; BASE=16
      008B9B 27               [ 1] 1959 2$:	ld (x),a 
      008B9C 0A               [ 1] 1960 	incw x 
      008B9D 11 01 27 06      [ 1] 1961 	inc in 
      008BA1 72 5C 00         [ 4] 1962 	ld a,([in.w],y)
      008BA4 02 20 F1         [ 4] 1963 	call to_upper 
      008BA7 84 81            [ 1] 1964 	ld (TCHAR,sp),a 
      008BA9 CD 0E 28         [ 4] 1965 	call is_digit 
      008BA9 52 02            [ 1] 1966 	jrc 2$
      008BAB 4F 6B            [ 1] 1967 	ld a,#16 
      008BAD 01 72            [ 1] 1968 	cp a,(BASE,sp)
      008BAF 5C 00            [ 1] 1969 	jrne 3$ 
      008BB1 02 91            [ 1] 1970 	ld a,(TCHAR,sp)
      008BB3 D6 01            [ 1] 1971 	cp a,#'A 
      008BB5 27 24            [ 1] 1972 	jrmi 3$ 
      008BB7 6B 02            [ 1] 1973 	cp a,#'G 
      008BB9 A6 5C            [ 1] 1974 	jrmi 2$ 
      008BBB 11               [ 1] 1975 3$:	clr (x)
      008BBC 01 26 0A         [ 4] 1976 	call atoi
      008BBF 0F 01 7B         [ 2] 1977 	ldw x,acc16 
      008BC2 02 AD 22         [ 4] 1978 	call dpush  
      008BC5 F7 5C            [ 1] 1979 	ld a,#TK_INTGR
      000BE1                       1980 	_drop VSIZE  
      008BC7 20 E5            [ 2]    1     addw sp,#VSIZE 
      008BC9 81               [ 4] 1981 	ret 	
                                   1982 
                                   1983 ;-------------------------
                                   1984 ; binary integer parser 
                                   1985 ; input:
                                   1986 ;   X 		point to pad 
                                   1987 ;   Y 		point to tib 
                                   1988 ;   A 	    '%' 
                                   1989 ; output:  
                                   1990 ;   pad     number string 
                                   1991 ;   X 		integer 
                                   1992 ;   A 		TK_INTGR
                                   1993 ;   TOS     integer 
                                   1994 ;-------------------------
                           000001  1995 	BINARY=1
                           000002  1996 	VSIZE=2
      000BE4                       1997 parse_binary: ; { -- n }
      008BC9 7B 02            [ 1] 1998 	push #0
      008BCB A1 5C            [ 1] 1999 	push #0
      008BCD 27               [ 1] 2000 1$: ld (x),a 
      008BCE DD               [ 1] 2001 	incw x 
      008BCF A1 22 27 04      [ 1] 2002 	inc in 
      008BD3 F7 5C 20         [ 4] 2003 	ld a,([in.w],y)
      008BD6 D7 72            [ 1] 2004 	cp a,#'0 
      008BD8 5C 00            [ 1] 2005 	jreq 2$
      008BDA 02 7F            [ 1] 2006 	cp a,#'1 
      008BDC AE 17            [ 1] 2007 	jreq 2$ 
      008BDE 18 CD            [ 2] 2008 	jra bin_exit 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008BE0 8F A0            [ 1] 2009 2$: sub a,#'0	
      008BE2 5B               [ 1] 2010 	rrc a 
      008BE3 02 A6            [ 1] 2011 	rlc (BINARY+1,sp)
      008BE5 05 81            [ 1] 2012 	rlc (BINARY,sp)
      008BE7 20 E4            [ 2] 2013 	jra 1$  
      000C04                       2014 bin_exit:
      008BE7 A1               [ 1] 2015 	clr (x)
      008BE8 61 26            [ 2] 2016 	ldw x,(BINARY,sp)
      008BEA 03 A6 07         [ 4] 2017 	call dpush  
      008BED 81 A1            [ 1] 2018 	ld a,#TK_INTGR 	
      000C0C                       2019 	_drop VSIZE 
      008BEF 62 26            [ 2]    1     addw sp,#VSIZE 
      008BF1 03               [ 4] 2020 	ret
                                   2021 
                                   2022 ;---------------------------
                                   2023 ;  token begin with a letter,
                                   2024 ;  is keyword or variable. 	
                                   2025 ; input:
                                   2026 ;   X 		point to pad 
                                   2027 ;   Y 		point to text
                                   2028 ;   A 	    first letter  
                                   2029 ; output:
                                   2030 ;   X		exec_addr|var_addr 
                                   2031 ;   A 		TK_CMD 
                                   2032 ;   pad 	keyword|var_name  
                                   2033 ;   TOS     exec_addr|var_addr 
                                   2034 ;--------------------------  
      000C0F                       2035 parse_keyword: ; { -- exec_addr|var_addr}
      008BF2 A6 08 81         [ 4] 2036 	call to_upper 
      008BF5 A1               [ 1] 2037 	ld (x),a 
      008BF6 65               [ 1] 2038 	incw x 
      008BF7 26 03 A6 5C      [ 1] 2039 	inc in 
      008BFB 81 A1 5C         [ 4] 2040 	ld a,([in.w],y)
      008BFE 26 03 A6         [ 4] 2041 	call is_alpha 
      008C01 5C 81            [ 1] 2042 	jrc parse_keyword 
      008C03 A1               [ 1] 2043 1$: clr (x)
      008C04 66 26 03 A6      [ 1] 2044 	tnz pad+1 
      008C08 0C 81            [ 1] 2045 	jrne 2$
                                   2046 ; one letter variable name 
      008C0A A1 6E 26         [ 1] 2047 	ld a,pad 
      008C0D 03 A6            [ 1] 2048 	sub a,#'A 
      008C0F 0A               [ 1] 2049 	sll a 
      008C10 81               [ 1] 2050 	push a 
      008C11 A1 72            [ 1] 2051 	push #0
      008C13 26 03 A6         [ 2] 2052 	ldw x,#vars 
      008C16 0D 81 A1         [ 2] 2053 	addw x,(1,sp) ; X=var address 
      000C36                       2054 	_drop 2 
      008C19 74 26            [ 2]    1     addw sp,#2 
      008C1B 03 A6            [ 1] 2055 	ld a,#TK_VAR 
      008C1D 09 81            [ 2] 2056 	jra 4$ 
      000C3C                       2057 2$: ; check for keyword, otherwise syntax error.
      000C3C                       2058 	_ldx_dict kword_dict
      008C1F A1 76 26         [ 2]    1     ldw x,#kword_dict+2
      008C22 02 A6 0B         [ 4] 2059 	call search_dict
      008C25 81               [ 1] 2060 	tnz a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C26 26 03            [ 1] 2061 	jrne 3$ 
      008C26 4B 00 A1         [ 2] 2062 	jp syntax_error
      008C29 24 27 04         [ 2] 2063 3$: cpw x,#rem  
      008C2C 4B 0A            [ 1] 2064 	jrne 4$
      008C2E 20 02 4B 10 F7   [ 1] 2065 	mov in,count 
      008C33 5C               [ 1] 2066 	clr a 
      008C34 72               [ 4] 2067 	ret  	
      000C54                       2068 4$: 
      008C35 5C 00 02         [ 4] 2069 	call dpush 
      008C38 91               [ 4] 2070 	ret 
                                   2071 
                                   2072 
                                   2073 ;------------------------------------
                                   2074 ; Command line tokenizer
                                   2075 ; scan tib for next token
                                   2076 ; move token in 'pad'
                                   2077 ; input: 
      000C58                       2078 	none: 
                                   2079 ; use:
                                   2080 ;	Y   pointer to tib 
                                   2081 ;   X	pointer to pad 
                                   2082 ;   in.w   index in tib
                                   2083 ; output:
                                   2084 ;   A       token attribute 
                                   2085 ;   pad 	token as .asciz
                                   2086 ;   TOS   token value   
                                   2087 ;------------------------------------
                                   2088 	; use to check special character 
                                   2089 	.macro _case c t  
                                   2090 	ld a,#c 
                                   2091 	cp a,(TCHAR,sp) 
                                   2092 	jrne t
                                   2093 	.endm 
                                   2094 
                           000001  2095 	TCHAR=1
                           000002  2096 	ATTRIB=2 
                           000002  2097 	VSIZE=2
      000C58                       2098 get_token: ; { -- tokval }
      008C39 D6 01 CD 8E      [ 1] 2099 	tnz untok 
      008C3D BC 6B            [ 1] 2100 	jreq 1$
      008C3F 02 CD 8E         [ 1] 2101 	ld a,untok
      008C42 A8 25 ED A6      [ 1] 2102 	clr untok 
      008C46 10 11 01         [ 2] 2103 	ldw x,tokval
      008C49 26 0A 7B         [ 4] 2104 	call dpush  
      008C4C 02               [ 4] 2105 	ret 
      000C6C                       2106 1$:	
      008C4D A1 41 2B 04      [ 2] 2107 	ldw y,basicptr   	
      008C51 A1 47 2B         [ 1] 2108 	ld a,in 
      008C54 DD 7F CD         [ 1] 2109 	cp a,count 
      008C57 8E E1            [ 1] 2110 	jrmi 11$
      008C59 CE 00            [ 1] 2111 	ld a,#TK_NONE 
      008C5B 0A               [ 4] 2112 	ret 
      000C7B                       2113 11$:	
      000C7B                       2114 	_vars VSIZE
      008C5C CD 8F            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008C5E A0 A6 0A 5B      [ 1] 2115 	clr tokval 
      008C62 02 81 18         [ 2] 2116 	ldw x, #pad
      008C64 A6 20            [ 1] 2117 	ld a,#SPACE
      008C64 4B 00 4B         [ 4] 2118 	call skip
      008C67 00 F7 5C         [ 4] 2119 	ld a,([in.w],y)
      008C6A 72 5C            [ 1] 2120 	jrne str_tst
      008C6C 00 02 91 D6      [ 1] 2121 	clr pad 
      008C70 01 A1 30         [ 2] 2122 	jp token_exit
                                   2123 
      000C95                       2124 str_tst: ; check for quoted string  	
      008C73 27 06 A1         [ 4] 2125 	call to_upper 
      008C76 31 27            [ 1] 2126 	ld (TCHAR,sp),a 
      000C9A                       2127 	_case '"' nbr_tst
      008C78 02 20            [ 1]    1 	ld a,#'"' 
      008C7A 09 A0            [ 1]    2 	cp a,(TCHAR,sp) 
      008C7C 30 46            [ 1]    3 	jrne nbr_tst
      008C7E 09 02 09         [ 4] 2128 	call parse_quote
      008C81 01 20 E4         [ 2] 2129 	jp token_exit
      008C84                       2130 nbr_tst: ; check for number 
      008C84 7F 1E            [ 1] 2131 	ld a,#'$'
      008C86 01 CD            [ 1] 2132 	cp a,(TCHAR,sp) 
      008C88 8F A0            [ 1] 2133 	jreq 1$
      008C8A A6 0A            [ 1] 2134 	ld a,#'&
      008C8C 5B 02            [ 1] 2135 	cp a,(TCHAR,sp)
      008C8E 81 06            [ 1] 2136 	jrne 0$
      008C8F CD 0B E4         [ 4] 2137 	call parse_binary ; expect binary integer 
      008C8F CD 8E BC         [ 2] 2138 	jp token_exit 
      008C92 F7 5C            [ 1] 2139 0$:	ld a,(TCHAR,sp)
      008C94 72 5C 00         [ 4] 2140 	call is_digit
      008C97 02 91            [ 1] 2141 	jrnc 3$
      008C99 D6 01 CD         [ 4] 2142 1$:	call parse_integer 
      008C9C 85 0D 25         [ 2] 2143 	jp token_exit 
      000CC5                       2144 3$: 
      008C9F EF 7F            [ 1] 2145 	ld (TCHAR,sp),a 
      000CC7                       2146 	_case '(' bkslsh_tst 
      008CA1 72 5D            [ 1]    1 	ld a,#'(' 
      008CA3 17 19            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA5 26 15            [ 1]    3 	jrne bkslsh_tst
      008CA7 C6 17            [ 1] 2147 	ld a,#TK_LPAREN
      008CA9 18 A0 41         [ 2] 2148 	jp token_char   	
      000CD2                       2149 bkslsh_tst:
      000CD2                       2150 	_case '\',rparnt_tst
      008CAC 48 88            [ 1]    1 	ld a,#'\' 
      008CAE 4B 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008CB0 AE 00            [ 1]    3 	jrne rparnt_tst
      008CB2 28               [ 1] 2151 	ld (x),a 
      008CB3 72               [ 1] 2152 	incw x 
      008CB4 FB 01 5B 02      [ 1] 2153 	inc in 
      008CB8 A6 01 20         [ 4] 2154 	ld a,([in.w],y)
      008CBB 18               [ 1] 2155 	ld (x),a 
      008CBC 5C               [ 1] 2156 	incw x 
      008CBC AE 9E BF CD      [ 1] 2157 	inc in  
      008CC0 91               [ 1] 2158 	clrw x 
      008CC1 B2               [ 1] 2159 	ld xl,a 
      008CC2 4D 26 03         [ 4] 2160 	call dpush 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008CC5 CC 87            [ 1] 2161 	ld a,#TK_CHAR 
      008CC7 11 A3 96         [ 2] 2162 	jp token_exit 
      000CF1                       2163 rparnt_tst:		
      000CF1                       2164 	_case ')' colon_tst 
      008CCA 07 26            [ 1]    1 	ld a,#')' 
      008CCC 07 55            [ 1]    2 	cp a,(TCHAR,sp) 
      008CCE 00 03            [ 1]    3 	jrne colon_tst
      008CD0 00 02            [ 1] 2165 	ld a,#TK_RPAREN 
      008CD2 4F 81 12         [ 2] 2166 	jp token_char 
      008CD4                       2167 colon_tst:
      000CFC                       2168 	_case ':' comma_tst 
      008CD4 CD 8F            [ 1]    1 	ld a,#':' 
      008CD6 A0 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008CD8 26 09            [ 1]    3 	jrne comma_tst
      008CD8 72 5C 00 01      [ 1] 2169 	inc in 
      008CD8 72 5D            [ 1] 2170 	ld a,#TK_COLON 
      008CDA 00 12 27         [ 2] 2171 	jp token_exit 
      000D0B                       2172 comma_tst:
      000D0B                       2173 	_case COMMA sharp_tst 
      008CDD 0E C6            [ 1]    1 	ld a,#COMMA 
      008CDF 00 12            [ 1]    2 	cp a,(TCHAR,sp) 
      008CE1 72 5F            [ 1]    3 	jrne sharp_tst
      008CE3 00 12            [ 1] 2174 	ld a,#TK_COMMA
      008CE5 CE 00 13         [ 2] 2175 	jp token_char
      000D16                       2176 sharp_tst:
      000D16                       2177 	_case SHARP dash_tst 
      008CE8 CD 8F            [ 1]    1 	ld a,#SHARP 
      008CEA A0 81            [ 1]    2 	cp a,(TCHAR,sp) 
      008CEC 26 05            [ 1]    3 	jrne dash_tst
      008CEC 90 CE            [ 1] 2178 	ld a,#TK_SHARP
      008CEE 00 04 C6         [ 2] 2179 	jp token_char  	 	 
      000D21                       2180 dash_tst: 	
      000D21                       2181 	_case '-' at_tst 
      008CF1 00 02            [ 1]    1 	ld a,#'-' 
      008CF3 C1 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008CF5 03 2B            [ 1]    3 	jrne at_tst
      008CF7 03 A6            [ 1] 2182 	ld a,#TK_MINUS  
      008CF9 00 81 12         [ 2] 2183 	jp token_char 
      008CFB                       2184 at_tst:
      000D2C                       2185 	_case '@' qmark_tst 
      008CFB 52 02            [ 1]    1 	ld a,#'@' 
      008CFD 72 5F            [ 1]    2 	cp a,(TCHAR,sp) 
      008CFF 00 13            [ 1]    3 	jrne qmark_tst
      008D01 AE 17            [ 1] 2186 	ld a,#TK_ARRAY 
      008D03 18 A6 20         [ 2] 2187 	jp token_char
      000D37                       2188 qmark_tst:
      000D37                       2189 	_case '?' tick_tst 
      008D06 CD 8F            [ 1]    1 	ld a,#'?' 
      008D08 8D 91            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0A D6 01            [ 1]    3 	jrne tick_tst
      008D0C 26 07            [ 1] 2190 	ld a,#TK_CMD 
      008D0E 72 5F 17         [ 2] 2191 	ldw x,#print 
      008D11 18 CC 8E         [ 4] 2192 	call dpush 
      008D14 A5 5C 00 01      [ 1] 2193 	inc in 
      008D15 CC 0E 25         [ 2] 2194 	jp token_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      000D4C                       2195 tick_tst: ; ignore comment 
      000D4C                       2196 	_case TICK plus_tst 
      008D15 CD 8E            [ 1]    1 	ld a,#TICK 
      008D17 BC 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008D19 01 A6            [ 1]    3 	jrne plus_tst
      008D1B 22 11 01 26 06   [ 1] 2197 	mov in,count  
      008D20 CD               [ 1] 2198 	clr a 
      008D21 8B A9 CC         [ 2] 2199 	jp token_exit 
      000D5B                       2200 plus_tst:
      000D5B                       2201 	_case '+' star_tst 
      008D24 8E A5            [ 1]    1 	ld a,#'+' 
      008D26 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D26 A6 24            [ 1]    3 	jrne star_tst
      008D28 11 01            [ 1] 2202 	ld a,#TK_PLUS  
      008D2A 27 13 A6         [ 2] 2203 	jp token_char 
      000D66                       2204 star_tst:
      000D66                       2205 	_case '*' slash_tst 
      008D2D 26 11            [ 1]    1 	ld a,#'*' 
      008D2F 01 26            [ 1]    2 	cp a,(TCHAR,sp) 
      008D31 06 CD            [ 1]    3 	jrne slash_tst
      008D33 8C 64            [ 1] 2206 	ld a,#TK_MULT 
      008D35 CC 8E A5         [ 2] 2207 	jp token_char 
      000D71                       2208 slash_tst: 
      000D71                       2209 	_case '/' prcnt_tst 
      008D38 7B 01            [ 1]    1 	ld a,#'/' 
      008D3A CD 8E            [ 1]    2 	cp a,(TCHAR,sp) 
      008D3C A8 24            [ 1]    3 	jrne prcnt_tst
      008D3E 06 CD            [ 1] 2210 	ld a,#TK_DIV 
      008D40 8C 26 CC         [ 2] 2211 	jp token_char 
      000D7C                       2212 prcnt_tst:
      000D7C                       2213 	_case '%' eql_tst 
      008D43 8E A5            [ 1]    1 	ld a,#'%' 
      008D45 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D45 6B 01            [ 1]    3 	jrne eql_tst
      008D47 A6 28            [ 1] 2214 	ld a,#TK_MOD
      008D49 11 01 26         [ 2] 2215 	jp token_char  
                                   2216 ; 1 or 2 character tokens 	
      000D87                       2217 eql_tst:
      000D87                       2218 	_case '=' gt_tst 		
      008D4C 05 A6            [ 1]    1 	ld a,#'=' 
      008D4E 03 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008D50 8E 92            [ 1]    3 	jrne gt_tst
      008D52 A6 32            [ 1] 2219 	ld a,#TK_EQUAL
      008D52 A6 5C 11         [ 2] 2220 	jp token_char 
      000D92                       2221 gt_tst:
      000D92                       2222 	_case '>' lt_tst 
      008D55 01 26            [ 1]    1 	ld a,#'>' 
      008D57 19 F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008D59 5C 72            [ 1]    3 	jrne lt_tst
      008D5B 5C 00            [ 1] 2223 	ld a,#TK_GT 
      008D5D 02 91            [ 1] 2224 	ld (ATTRIB,sp),a 
      008D5F D6 01 F7 5C      [ 1] 2225 	inc in 
      008D63 72 5C 00         [ 4] 2226 	ld a,([in.w],y)
      008D66 02 5F            [ 1] 2227 	cp a,#'=
      008D68 97 CD            [ 1] 2228 	jrne 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D6A 8F A0            [ 1] 2229 	ld a,(TCHAR,sp)
      008D6C A6               [ 1] 2230 	ld (x),a
      008D6D 0B               [ 1] 2231 	incw x 
      008D6E CC 8E            [ 1] 2232 	ld a,#'=
      008D70 A5 01            [ 1] 2233 	ld (TCHAR,sp),a 
      008D71 A6 33            [ 1] 2234 	ld a,#TK_GE 
      008D71 A6 29            [ 2] 2235 	jra token_char  
      008D73 11 01            [ 1] 2236 1$: cp a,#'<
      008D75 26 05            [ 1] 2237 	jrne 2$
      008D77 A6 04            [ 1] 2238 	ld a,(TCHAR,sp)
      008D79 CC               [ 1] 2239 	ld (x),a
      008D7A 8E               [ 1] 2240 	incw x 
      008D7B 92 3C            [ 1] 2241 	ld a,#'<	
      008D7C 6B 01            [ 1] 2242 	ld (TCHAR,sp),a 
      008D7C A6 3A            [ 1] 2243 	ld a,#TK_NE 
      008D7E 11 01            [ 2] 2244 	jra token_char 
      008D80 26 09 72 5C      [ 1] 2245 2$: dec in
      008D84 00 02            [ 1] 2246 	ld a,(ATTRIB,sp)
      008D86 A6 07            [ 2] 2247 	jra token_char 
      000DCB                       2248 lt_tst:
      000DCB                       2249 	_case '<' other
      008D88 CC 8E            [ 1]    1 	ld a,#'<' 
      008D8A A5 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D8B 26 32            [ 1]    3 	jrne other
      008D8B A6 2C            [ 1] 2250 	ld a,#TK_LT 
      008D8D 11 01            [ 1] 2251 	ld (ATTRIB,sp),a 
      008D8F 26 05 A6 08      [ 1] 2252 	inc in 
      008D93 CC 8E 92         [ 4] 2253 	ld a,([in.w],y)
      008D96 A1 3D            [ 1] 2254 	cp a,#'=
      008D96 A6 23            [ 1] 2255 	jrne 1$
      008D98 11 01            [ 1] 2256 	ld a,(TCHAR,sp)
      008D9A 26               [ 1] 2257 	ld (x),a 
      008D9B 05 A6            [ 1] 2258 	ld a,#'=
      008D9D 09 CC            [ 1] 2259 	ld (TCHAR,sp),a 
      008D9F 8E 92            [ 1] 2260 	ld a,#TK_LE 
      008DA1 20 27            [ 2] 2261 	jra token_char 
      008DA1 A6 2D            [ 1] 2262 1$: cp a,#'>
      008DA3 11 01            [ 1] 2263 	jrne 2$
      008DA5 26 05            [ 1] 2264 	ld a,(TCHAR,sp)
      008DA7 A6               [ 1] 2265 	ld (x),a 
      008DA8 11               [ 1] 2266 	incw x 
      008DA9 CC 8E            [ 1] 2267 	ld a,#'>
      008DAB 92 01            [ 1] 2268 	ld (TCHAR,sp),a 
      008DAC A6 35            [ 1] 2269 	ld a,#TK_NE 
      008DAC A6 40            [ 2] 2270 	jra token_char 
      008DAE 11 01 26 05      [ 1] 2271 2$: dec in 
      008DB2 A6 02            [ 1] 2272 	ld a,(ATTRIB,sp)
      008DB4 CC 8E            [ 2] 2273 	jra token_char 	
      000E03                       2274 other: ; not a special character 	 
      008DB6 92 01            [ 1] 2275 	ld a,(TCHAR,sp)
      008DB7 CD 04 8D         [ 4] 2276 	call is_alpha 
      008DB7 A6 3F            [ 1] 2277 	jrc 30$ 
      008DB9 11 01 26         [ 2] 2278 	jp syntax_error 
      000E0D                       2279 30$: 
      008DBC 0F A6 06         [ 4] 2280 	call parse_keyword
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008DBF AE 94            [ 2] 2281 	jra token_exit 
      000E12                       2282 token_char:
      008DC1 EA CD            [ 1] 2283 	ld (ATTRIB,sp),a 
      008DC3 8F A0            [ 1] 2284 	ld a,(TCHAR,sp)
      008DC5 72               [ 1] 2285 	ld (x),a 
      008DC6 5C               [ 1] 2286 	incw x 
      008DC7 00               [ 1] 2287 	clr(x)
      008DC8 02 CC 8E A5      [ 1] 2288 	inc in 
      008DCC 7B 02            [ 1] 2289 	ld a,(ATTRIB,sp)
      008DCC A6 27 11         [ 2] 2290 	ldw x,#pad 
      008DCF 01 26 09         [ 4] 2291 	call dpush 
      000E25                       2292 token_exit:
      000E25                       2293 	_drop VSIZE 
      008DD2 55 00            [ 2]    1     addw sp,#VSIZE 
      008DD4 03               [ 4] 2294 	ret
                                   2295 
                                   2296 
                                   2297 
                                   2298 ;------------------------------------
                                   2299 ; check if character in {'0'..'9'}
                                   2300 ; input:
                                   2301 ;    A  character to test
                                   2302 ; output:
                                   2303 ;    Carry  0 not digit | 1 digit
                                   2304 ;------------------------------------
      000E28                       2305 is_digit:
      008DD5 00 02            [ 1] 2306 	cp a,#'0
      008DD7 4F CC            [ 1] 2307 	jrc 1$
      008DD9 8E A5            [ 1] 2308     cp a,#'9+1
      008DDB 8C               [ 1] 2309 	ccf 
      008DDB A6               [ 1] 2310 1$:	ccf 
      008DDC 2B               [ 4] 2311     ret
                                   2312 
                                   2313 ;----------------------------------
                                   2314 ; convert to lower case
                                   2315 ; input: 
                                   2316 ;   A 		character to convert
                                   2317 ; output:
                                   2318 ;   A		result 
                                   2319 ;----------------------------------
      000E31                       2320 to_lower::
      008DDD 11 01            [ 1] 2321 	cp a,#'A
      008DDF 26 05            [ 1] 2322 	jrult 9$
      008DE1 A6 10            [ 1] 2323 	cp a,#'Z 
      008DE3 CC 8E            [ 1] 2324 	jrugt 9$
      008DE5 92 20            [ 1] 2325 	add a,#32
      008DE6 81               [ 4] 2326 9$: ret
                                   2327 
                                   2328 ;------------------------------------
                                   2329 ; convert alpha to uppercase
                                   2330 ; input:
                                   2331 ;    a  character to convert
                                   2332 ; output:
                                   2333 ;    a  uppercase character
                                   2334 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      000E3C                       2335 to_upper::
      008DE6 A6 2A            [ 1] 2336 	cp a,#'a
      008DE8 11 01            [ 1] 2337 	jrpl 1$
      008DEA 26               [ 4] 2338 0$:	ret
      008DEB 05 A6            [ 1] 2339 1$: cp a,#'z	
      008DED 20 CC            [ 1] 2340 	jrugt 0$
      008DEF 8E 92            [ 1] 2341 	sub a,#32
      008DF1 81               [ 4] 2342 	ret
                                   2343 	
                                   2344 ;------------------------------------
                                   2345 ; uppercase pad content
                                   2346 ; input:
                                   2347 ;	pad      .asciz 
                                   2348 ; output:
                                   2349 ;   pad      uppercase string 
                                   2350 ;------------------------------------
      000E48                       2351 upper:
      008DF1 A6 2F 11 01      [ 2] 2352 	ldw y,#pad 
      000E4C                       2353 upper_loop:	
      008DF5 26 05            [ 1] 2354 	ld a,(y)
      008DF7 A6 21            [ 1] 2355 	jreq 4$
      008DF9 CC 8E            [ 1] 2356 	cp a,#'a 
      008DFB 92 0C            [ 1] 2357 	jrmi 4$
      008DFC A1 7B            [ 1] 2358 	cp a,#'z+1 
      008DFC A6 25            [ 1] 2359 	jrpl 4$ 
      008DFE 11 01            [ 1] 2360 	sub a,#0x20 
      008E00 26 05            [ 1] 2361 	ld (y),a 
      008E02 A6 22            [ 1] 2362 	incw y 
      008E04 CC 8E            [ 2] 2363 	jra upper_loop
      008E06 92               [ 4] 2364 4$: ret 
                                   2365 
                                   2366 ;------------------------------------
                                   2367 ; convert pad content in integer
                                   2368 ; input:
                                   2369 ;    pad		.asciz to convert
                                   2370 ; output:
                                   2371 ;    acc24      int24_t
                                   2372 ;------------------------------------
                                   2373 	; local variables
                           000001  2374 	SIGN=1 ; 1 byte, 
                           000002  2375 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2376 	TEMP=3 ; 1 byte, temporary storage
                           000003  2377 	VSIZE=3 ; 3 bytes reserved for local storage
      008E07                       2378 atoi:
      008E07 A6               [ 2] 2379 	pushw x ;save x
      008E08 3D 11            [ 2] 2380 	sub sp,#VSIZE
                                   2381 	; acc24=0 
      008E0A 01 26 05 A6      [ 1] 2382 	clr acc24    
      008E0E 32 CC 8E 92      [ 1] 2383 	clr acc16
      008E12 72 5F 00 0A      [ 1] 2384 	clr acc8 
      008E12 A6 3E 11         [ 1] 2385 	ld a, pad 
      008E15 01 26            [ 1] 2386 	jreq atoi_exit
      008E17 33 A6            [ 1] 2387 	clr (SIGN,sp)
      008E19 31 6B            [ 1] 2388 	ld a,#10
      008E1B 02 72            [ 1] 2389 	ld (BASE,sp),a ; default base decimal
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008E1D 5C 00 02         [ 2] 2390 	ldw x,#pad ; pointer to string to convert
      008E20 91               [ 1] 2391 	ld a,(x)
      008E21 D6 01            [ 1] 2392 	jreq 9$  ; completed if 0
      008E23 A1 3D            [ 1] 2393 	cp a,#'-
      008E25 26 0C            [ 1] 2394 	jrne 1$
      008E27 7B 01            [ 1] 2395 	cpl (SIGN,sp)
      008E29 F7 5C            [ 2] 2396 	jra 2$
      008E2B A6 3D            [ 1] 2397 1$: cp a,#'$
      008E2D 6B 01            [ 1] 2398 	jrne 3$
      008E2F A6 33            [ 1] 2399 	ld a,#16
      008E31 20 5F            [ 1] 2400 	ld (BASE,sp),a
      008E33 A1               [ 1] 2401 2$:	incw x
      008E34 3C               [ 1] 2402 	ld a,(x)
      000E93                       2403 3$:	
      008E35 26 0C            [ 1] 2404 	cp a,#'a
      008E37 7B 01            [ 1] 2405 	jrmi 4$
      008E39 F7 5C            [ 1] 2406 	sub a,#32
      008E3B A6 3C            [ 1] 2407 4$:	cp a,#'0
      008E3D 6B 01            [ 1] 2408 	jrmi 9$
      008E3F A6 35            [ 1] 2409 	sub a,#'0
      008E41 20 4F            [ 1] 2410 	cp a,#10
      008E43 72 5A            [ 1] 2411 	jrmi 5$
      008E45 00 02            [ 1] 2412 	sub a,#7
      008E47 7B 02            [ 1] 2413 	cp a,(BASE,sp)
      008E49 20 47            [ 1] 2414 	jrpl 9$
      008E4B 6B 03            [ 1] 2415 5$:	ld (TEMP,sp),a
      008E4B A6 3C            [ 1] 2416 	ld a,(BASE,sp)
      008E4D 11 01 26         [ 4] 2417 	call mulu24_8
      008E50 32 A6            [ 1] 2418 	ld a,(TEMP,sp)
      008E52 34 6B 02         [ 1] 2419 	add a,acc24+2
      008E55 72 5C 00         [ 1] 2420 	ld acc24+2,a
      008E58 02               [ 1] 2421 	clr a
      008E59 91 D6 01         [ 1] 2422 	adc a,acc24+1
      008E5C A1 3D 26         [ 1] 2423 	ld acc24+1,a
      008E5F 0B               [ 1] 2424 	clr a
      008E60 7B 01 F7         [ 1] 2425 	adc a,acc24
      008E63 A6 3D 6B         [ 1] 2426 	ld acc24,a
      008E66 01 A6            [ 2] 2427 	jra 2$
      008E68 36 20            [ 1] 2428 9$:	tnz (SIGN,sp)
      008E6A 27 A1            [ 1] 2429     jreq atoi_exit
      008E6C 3E 26 0C         [ 4] 2430     call neg_acc24
      000ECF                       2431 atoi_exit: 
      008E6F 7B 01            [ 2] 2432 	addw sp,#VSIZE
      008E71 F7               [ 2] 2433 	popw x ; restore x
      008E72 5C               [ 4] 2434 	ret
                                   2435 
                                   2436 ;--------------------------------------
                                   2437 ; unsigned multiply uint24_t by uint8_t
                                   2438 ; use to convert numerical string to uint24_t
                                   2439 ; input:
                                   2440 ;	acc24	uint24_t 
                                   2441 ;   A		uint8_t
                                   2442 ; output:
                                   2443 ;   acc24   A*acc24
                                   2444 ;-------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2445 ; local variables offset  on sp
                           000003  2446 	U8   = 3   ; A pushed on stack
                           000002  2447 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2448 	OVFH = 1  ; multiplication overflow high byte
                           000003  2449 	VSIZE = 3
      000ED3                       2450 mulu24_8:
      008E73 A6               [ 2] 2451 	pushw x    ; save X
                                   2452 	; local variables
      008E74 3E               [ 1] 2453 	push a     ; U8
      008E75 6B               [ 1] 2454 	clrw x     ; initialize overflow to 0
      008E76 01               [ 2] 2455 	pushw x    ; multiplication overflow
                                   2456 ; multiply low byte.
      008E77 A6 35 20         [ 1] 2457 	ld a,acc24+2
      008E7A 17               [ 1] 2458 	ld xl,a
      008E7B 72 5A            [ 1] 2459 	ld a,(U8,sp)
      008E7D 00               [ 4] 2460 	mul x,a
      008E7E 02               [ 1] 2461 	ld a,xl
      008E7F 7B 02 20         [ 1] 2462 	ld acc24+2,a
      008E82 0F               [ 1] 2463 	ld a, xh
      008E83 6B 02            [ 1] 2464 	ld (OVFL,sp),a
                                   2465 ; multipy middle byte
      008E83 7B 01 CD         [ 1] 2466 	ld a,acc24+1
      008E86 85               [ 1] 2467 	ld xl,a
      008E87 0D 25            [ 1] 2468 	ld a, (U8,sp)
      008E89 03               [ 4] 2469 	mul x,a
                                   2470 ; add overflow to this partial product
      008E8A CC 87 11         [ 2] 2471 	addw x,(OVFH,sp)
      008E8D 9F               [ 1] 2472 	ld a,xl
      008E8D CD 8C 8F         [ 1] 2473 	ld acc24+1,a
      008E90 20               [ 1] 2474 	clr a
      008E91 13 00            [ 1] 2475 	adc a,#0
      008E92 6B 01            [ 1] 2476 	ld (OVFH,sp),a
      008E92 6B               [ 1] 2477 	ld a,xh
      008E93 02 7B            [ 1] 2478 	ld (OVFL,sp),a
                                   2479 ; multiply most signficant byte	
      008E95 01 F7 5C         [ 1] 2480 	ld a, acc24
      008E98 7F               [ 1] 2481 	ld xl, a
      008E99 72 5C            [ 1] 2482 	ld a, (U8,sp)
      008E9B 00               [ 4] 2483 	mul x,a
      008E9C 02 7B 02         [ 2] 2484 	addw x, (OVFH,sp)
      008E9F AE               [ 1] 2485 	ld a, xl
      008EA0 17 18 CD         [ 1] 2486 	ld acc24,a
      008EA3 8F A0            [ 2] 2487     addw sp,#VSIZE
      008EA5 85               [ 2] 2488 	popw x
      008EA5 5B               [ 4] 2489 	ret
                                   2490 
                                   2491 ;------------------------------------
                                   2492 ; skip character c in text starting from 'in'
                                   2493 ; input:
                                   2494 ;	 y 		point to text buffer
                                   2495 ;    a 		character to skip
                                   2496 ; output:  
                                   2497 ;	'in' ajusted to new position
                                   2498 ;------------------------------------
                           000001  2499 	C = 1 ; local var
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      000F0D                       2500 skip:
      008EA6 02               [ 1] 2501 	push a
      008EA7 81 D6 00         [ 4] 2502 1$:	ld a,([in.w],y)
      008EA8 27 0A            [ 1] 2503 	jreq 2$
      008EA8 A1 30            [ 1] 2504 	cp a,(C,sp)
      008EAA 25 03            [ 1] 2505 	jrne 2$
      008EAC A1 3A 8C 8C      [ 1] 2506 	inc in
      008EB0 81 F1            [ 2] 2507 	jra 1$
      008EB1                       2508 2$: _drop 1 
      008EB1 A1 41            [ 2]    1     addw sp,#1 
      008EB3 25               [ 4] 2509 	ret
                                   2510 
                                   2511 ;******************************
                                   2512 
                                   2513 ;----------------------	
                                   2514 ; push X on data stack 
                                   2515 ; input:
                                   2516 ;	X 
                                   2517 ; output:
                                   2518 ;	none 
                                   2519 ;----------------------	
      000F20                       2520 dpush:
      000F20                       2521     _dp_down
      008EB4 06 A1 5A 22      [ 1]    1     dec dstkptr+1 
      008EB8 02 AB 20 81      [ 1]    2     dec dstkptr+1
      008EBC 72 CF 00 1A      [ 5] 2522     ldw [dstkptr],x  
      008EBC A1               [ 4] 2523 	ret 
                                   2524 
                                   2525 
                                   2526 ;----------------------	
                                   2527 ; pop data stack in X 
                                   2528 ; input:
                                   2529 ;	none
                                   2530 ; output:
                                   2531 ;	X   
                                   2532 ;----------------------	
      000F2D                       2533 dpop: 
      008EBD 61 2A 01 81      [ 5] 2534     ldw x, [dstkptr]
      000F31                       2535 	_dp_up
      008EC1 A1 7A 22 FB      [ 1]    1     inc dstkptr+1
      008EC5 A0 20 81 1B      [ 1]    2     inc dstkptr+1
      008EC8 81               [ 4] 2536 	ret 
                                   2537 
                                   2538 ;-----------------------------
                                   2539 ; swap top 2 elements of dstack
                                   2540 ;  {n1 n2 -- n2 n1 }
                                   2541 ;-----------------------------
      000F3A                       2542 dswap:
      008EC8 90 AE 17 18      [ 5] 2543 	ldw x,[dstkptr]
      008ECC 89               [ 2] 2544 	pushw x 
      008ECC 90 F6 27         [ 2] 2545 	ldw x,#2 
      008ECF 10 A1 61 2B      [ 5] 2546 	ldw x,([dstkptr],x) 
      008ED3 0C A1 7B 2A      [ 5] 2547 	ldw [dstkptr],x 
      008ED7 08 A0 20         [ 2] 2548 	ldw x,#2
      008EDA 90 F7            [ 2] 2549 	popw y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008EDC 90 5C 20 EC      [ 5] 2550 	ldw ([dstkptr],x),y 
      008EE0 81               [ 4] 2551 	ret
                                   2552 
                                   2553 ;-----------------------------
                                   2554 ; drop TOS 
                                   2555 ;-----------------------------
      008EE1                       2556 ddrop: ; { n -- }
      000F54                       2557 	_dp_up 
      008EE1 89 52 03 72      [ 1]    1     inc dstkptr+1
      008EE5 5F 00 09 72      [ 1]    2     inc dstkptr+1
      008EE9 5F               [ 4] 2558 	ret
                                   2559 	
                                   2560 ;-----------------------------
                                   2561 ; duplicate TOS 
                                   2562 ;  dstack: { ix...n -- ix...n n }
                                   2563 ;-----------------------------
      000F5D                       2564 ddup:
      008EEA 00 0A 72 5F      [ 5] 2565 	ldw x,[dstkptr]
      000F61                       2566 	_dp_down
      008EEE 00 0B C6 17      [ 1]    1     dec dstkptr+1 
      008EF2 18 27 5A 0F      [ 1]    2     dec dstkptr+1
      008EF6 01 A6 0A 6B      [ 5] 2567     ldw [dstkptr],x  
      008EFA 02               [ 4] 2568 	ret 
                                   2569 
                                   2570 
                                   2571 ;----------------------------------
                                   2572 ; pick value n from dstack 
                                   2573 ; put it on TOS
                                   2574 ; dstack: {ix,..,p -- ix,...,np }
                                   2575 ;-----------------------------------
      000F6E                       2576 dpick:
      008EFB AE 17 18 F6      [ 5] 2577 	ldw x,[dstkptr]
      008EFF 27               [ 2] 2578 	sllw x 
      008F00 47 A1 2D 26      [ 2] 2579 	addw x,dstkptr 
      008F04 04               [ 2] 2580 	ldw x,(x)
      008F05 03 01 20 08      [ 5] 2581 	ldw [dstkptr],x 
      008F09 A1               [ 4] 2582 	ret
                                   2583 
                                   2584 ;---------------------------
                                   2585 ;  fetch variable in X 
                                   2586 ;  dstack:{ addr -- value }
                                   2587 ;---------------------------
      000F7D                       2588 fetch:
      008F0A 24 26 06 A6      [ 5] 2589 	ldw x,[dstkptr]
      008F0E 10               [ 2] 2590 	ldw x,(x)
      008F0F 6B 02 5C F6      [ 5] 2591 	ldw [dstkptr],x
      008F13 81               [ 4] 2592 	ret 
                                   2593 
                                   2594 ;----------------------------
                                   2595 ; store variable 
                                   2596 ; dstack: {addr value -- }
                                   2597 ;----------------------------
      000F87                       2598 store:
      008F13 A1 61 2B         [ 4] 2599 	call dpop 
      008F16 02 A0            [ 1] 2600 	ldw y,x   ; y=value 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008F18 20 A1 30         [ 4] 2601 	call dpop 
      008F1B 2B               [ 2] 2602 	ldw (x),y 
      008F1C 2B               [ 4] 2603 	ret 
                                   2604 
                                   2605 ;----------------------------
                                   2606 ; print TOS 
                                   2607 ; dstack: {n -- }
                                   2608 ;----------------------------
      000F91                       2609 prt_tos:
      008F1D A0 30 A1         [ 4] 2610 	call dpop 
      008F20 0A 2B 06         [ 2] 2611 	ldw acc16,x
      008F23 A0 07 11 02      [ 1] 2612 	clr acc24 
      008F27 2A 1F 6B 03 7B   [ 2] 2613 	btjf acc16,#7,1$
      008F2C 02 CD 8F 53      [ 1] 2614 	cpl acc24 
      008F30 7B 03 CB         [ 1] 2615 1$:	ld a,tab_width 
      008F33 00               [ 1] 2616 	clrw x 
      008F34 0B               [ 1] 2617 	ld xl,a 
      008F35 C7 00 0B         [ 1] 2618 	ld a,base 
      008F38 4F C9 00         [ 4] 2619 	call prti24
      008F3B 0A               [ 4] 2620 	ret 
                                   2621 
                                   2622 ;------------------------------
                                   2623 ; put A in untok, pop TOS put it in tokval
                                   2624 ; dstack { n -- }
                                   2625 ; input:
                                   2626 ;   A     token_attribute 
                                   2627 ;   TOS   token value 
                                   2628 ; output:
                                   2629 ;   untok    A 
                                   2630 ;   tokval   n 
                                   2631 ;------------------------------
      000FB0                       2632 unget_token:
      008F3C C7 00 0A         [ 1] 2633 	ld untok,a 
      008F3F 4F C9 00 09      [ 5] 2634 	ldw x,[dstkptr]
      008F43 C7 00 09         [ 2] 2635 	ldw tokval,x 
      000FBA                       2636 	_dp_up 
      008F46 20 C9 0D 01      [ 1]    1     inc dstkptr+1
      008F4A 27 03 CD 8A      [ 1]    2     inc dstkptr+1
      008F4E 0C               [ 4] 2637 	ret 
                                   2638 
                                   2639 
                                   2640 
                           000001  2641 .if DEBUG 
      008F4F 0A 64 73 74 61 63 6B  2642 dstk_prompt: .asciz "\ndstack: " 
             3A 20 00
                                   2643 ;----------------------------
                                   2644 ; print dstack content 
                                   2645 ;---------------------------
                           000001  2646 	XSAVE=1
                           000002  2647 	VSIZE=2
      000FCD                       2648 dots:
      000FCD                       2649 	_vars VSIZE 
      008F4F 5B 03            [ 2]    1     sub sp,#VSIZE 
      008F51 85 81 C3         [ 2] 2650 	ldw x,#dstk_prompt 
      008F53 CD 02 30         [ 4] 2651 	call puts
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      008F53 89 88 5F         [ 2] 2652 	ldw x,#dstack_unf-CELL_SIZE 
      008F56 89 C6 00         [ 2] 2653 1$:	cpw x,dstkptr 
      008F59 0B 97            [ 1] 2654 	jrult 4$ 
      008F5B 7B 03            [ 2] 2655 	ldw (XSAVE,sp),x
      008F5D 42               [ 2] 2656 	ldw  x,(x)
      008F5E 9F C7 00         [ 2] 2657 	ldw acc16,x 
      008F61 0B 9E 6B 02      [ 1] 2658 	clr acc24 
      008F65 C6               [ 1] 2659 	clrw x 
      008F66 00 0A            [ 1] 2660 	ld a,#10+128
      008F68 97 7B 03         [ 4] 2661 	call prti24 
      008F6B 42 72            [ 2] 2662 	ldw x,(XSAVE,sp)
      008F6D FB 01 9F         [ 2] 2663 	subw x,#CELL_SIZE 
      008F70 C7 00            [ 2] 2664 	jra 1$ 
      008F72 0A 4F            [ 1] 2665 4$: ld a,#CR 
      008F74 A9 00 6B         [ 4] 2666 	call putc 
      000FF9                       2667 	_drop VSIZE
      008F77 01 9E            [ 2]    1     addw sp,#VSIZE 
      008F79 6B               [ 1] 2668 	clr a 
      008F7A 02               [ 4] 2669 	ret
                                   2670 .endif 
                                   2671 
      008F7B C6 00 09 97 7B 03 42  2672 cstk_prompt: .asciz "\nctack: "
             72 FB
                                   2673 ;--------------------------------
                                   2674 ; print cstack content
                                   2675 ;--------------------------------
      001006                       2676 dotr:
      008F84 01 9F C7         [ 2] 2677 	ldw x,#cstk_prompt
      008F87 00 09 5B         [ 4] 2678 	call puts 
      008F8A 03               [ 1] 2679 	ldw x,sp 
      008F8B 85               [ 1] 2680 	incw x 
      008F8C 81 0F 20         [ 4] 2681 	call dpush 
      008F8D AE 17 FE         [ 2] 2682 	ldw x,#RAM_SIZE-2
      001014                       2683 dotr_loop:
      008F8D 88 91 D6         [ 4] 2684 	call dpush  
      008F90 01               [ 2] 2685 	ldw x,(x)
      008F91 27 0A 11         [ 2] 2686 	ldw acc16,x 
      008F94 01 26 06 72      [ 1] 2687 	clr acc24 
      008F98 5C               [ 1] 2688 	clrw x 
      008F99 00 02            [ 1] 2689 	ld a,#16+128
      008F9B 20 F1 5B         [ 4] 2690 	call prti24 
      008F9E 01 81 2D         [ 4] 2691 	call dpop 
      008FA0 1D 00 02         [ 2] 2692 	subw x,#CELL_SIZE
      008FA0 72 5A 00 1C      [ 4] 2693 	cpw x,[dstkptr]
      008FA4 72 5A            [ 1] 2694 	jrpl dotr_loop 
      008FA6 00 1C 72         [ 2] 2695 	ldw x,#2 
      008FA9 CF 00 1B         [ 4] 2696 	call ddrop_n 
      008FAC 81 0D            [ 1] 2697 	ld a,#CR 
      008FAD CD 02 1E         [ 4] 2698 	call putc 
      008FAD 72               [ 1] 2699 	clr a
      008FAE CE               [ 4] 2700 	ret
                                   2701 
                                   2702 
                                   2703 ;--------------------------------
                                   2704 ; BASIC: SHOW 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2705 ;  show content of dstack,cstack
                                   2706 ;--------------------------------
      00103E                       2707 show:
      008FAF 00 1B 72         [ 4] 2708 	call dots
      008FB2 5C 00 1C         [ 4] 2709 	call dotr 
      008FB5 72               [ 1] 2710 	clr a 
      008FB6 5C               [ 4] 2711 	ret
                                   2712 
                                   2713 
                                   2714 ;--------------------------------
                                   2715 ;  add 2 top integer on dstack 
                                   2716 ;  dstack: {n2 n1-- n2+n1}
                                   2717 ;--------------------------------
      001046                       2718 add:
      008FB7 00 1C 81         [ 4] 2719 	call dpop
      008FBA CF 00 09         [ 2] 2720 	ldw acc16,x  
      008FBA 72 CE 00 1B      [ 5] 2721 	ldw x,[dstkptr]
      008FBE 89 AE 00 02      [ 2] 2722 	addw x,acc16
      008FC2 72 DE 00 1B      [ 5] 2723 	ldw [dstkptr],x  
      008FC6 72               [ 4] 2724 	ret 
                                   2725 
                                   2726 ;--------------------------------
                                   2727 ;  substract 2 top integer on dstack 
                                   2728 ;  dstack: {n2 n1 -- n2-n1}
                                   2729 ;--------------------------------
      001059                       2730 substract:
      008FC7 CF 00 1B         [ 4] 2731 	call dpop 
      008FCA AE 00 02         [ 2] 2732 	ldw acc16,x  
      008FCD 90 85 72 DF      [ 5] 2733 	ldw x,[dstkptr]
      008FD1 00 1B 81 09      [ 2] 2734 	subw x,acc16  
      008FD4 8A               [ 1] 2735 	push cc 
      008FD4 72 5C 00 1C      [ 5] 2736 	ldw [dstkptr],x 
      008FD8 72               [ 1] 2737 	pop cc 
      008FD9 5C               [ 4] 2738 	ret 
                                   2739 
                                   2740 ;-------------------------------------
                                   2741 ; multiply 2 top integers on dstack
                                   2742 ; dstack: {n2 n1 -- n2*n1}
                                   2743 ; product overflow is ignored unless
                                   2744 ; MATH_OVF assembler flag is set to 1
                                   2745 ;-------------------------------------
                                   2746    ; local variables 
                           000001  2747 	SIGN=1
                           000002  2748 	PROD=2
                           000004  2749 	N1_HB=4
                           000005  2750 	N1_LB=5
                           000006  2751 	N2_HB=6
                           000007  2752 	N2_LB=7 
                           000007  2753 	VSIZE=7
      00106E                       2754 multiply:
      00106E                       2755 	_vars VSIZE 
      008FDA 00 1C            [ 2]    1     sub sp,#VSIZE 
      008FDC 81 01            [ 1] 2756 	clr (SIGN,sp)
      008FDD CD 0F 2D         [ 4] 2757 	call dpop 
      008FDD 72 CE            [ 2] 2758 	ldw (N1_HB,sp),x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      008FDF 00               [ 1] 2759 	ld a,xh 
      008FE0 1B 72            [ 1] 2760 	bcp a,#0x80 
      008FE2 5A 00            [ 1] 2761 	jreq 2$
      008FE4 1C 72            [ 1] 2762 	cpl (SIGN,sp)
      008FE6 5A               [ 2] 2763 	negw x 
      008FE7 00 1C            [ 2] 2764 	ldw (N1_HB,sp),x 
      008FE9 72 CF 00 1B      [ 5] 2765 2$: ldw x,[dstkptr]
      008FED 81 06            [ 2] 2766 	ldw (N2_HB,sp),x 
      008FEE 9E               [ 1] 2767 	ld a,xh  
      008FEE 72 CE            [ 1] 2768 	bcp a,#0x80 
      008FF0 00 1B            [ 1] 2769 	jreq 3$
      008FF2 58 72            [ 1] 2770 	cpl (SIGN,sp)
      008FF4 BB               [ 2] 2771 	negw x 
      008FF5 00 1B            [ 2] 2772 	ldw (N2_HB,sp),x 
                                   2773 ; N1_LB * N2_LB 	
      008FF7 FE 72            [ 1] 2774 3$:	ld a,(N1_LB,sp)
      008FF9 CF               [ 1] 2775 	ld xl,a 
      008FFA 00 1B            [ 1] 2776 	ld a,(N2_LB,sp) 
      008FFC 81               [ 4] 2777 	mul x,a 
                           000000  2778 .if MATH_OVF 	
                                   2779 	ld a,xh 
                                   2780 	bcp a,#0x80 
                                   2781 	jreq 4$ 
                                   2782 	ld a,#ERR_MATH_OVF 
                                   2783 	jp tb_error
                                   2784 .endif 	 
      008FFD 1F 02            [ 2] 2785 4$:	ldw (PROD,sp),x
                                   2786 ; N1_LB * N2_HB	 
      008FFD 72 CE            [ 1] 2787 	ld a,(N1_LB,sp) 
      008FFF 00               [ 1] 2788 	ld xl,a 
      009000 1B FE            [ 1] 2789 	ld a,(N2_HB,sp)
      009002 72               [ 4] 2790 	mul x,a
      009003 CF               [ 1] 2791 	ld a,xl 
      009004 00 1B            [ 1] 2792 	add a,(PROD,sp)
                           000000  2793 .if MATH_OVF 	
                                   2794 	bcp a,#0x80 
                                   2795 	jreq 5$ 
                                   2796 	ld a,#ERR_MATH_OVF 
                                   2797 	jp tb_error
                                   2798 .endif 	 
      009006 81 02            [ 1] 2799 5$:	ld (PROD,sp),a 
                                   2800 ; N1_HB * N2_LB 
      009007 7B 04            [ 1] 2801 	ld a,(N1_HB,sp)
      009007 CD               [ 1] 2802 	ld xl,a 
      009008 8F AD            [ 1] 2803 	ld a,(N2_LB,sp)
      00900A 90               [ 4] 2804 	mul x,a 
      00900B 93               [ 1] 2805 	ld a,xl 
      00900C CD 8F            [ 1] 2806 	add a,(PROD,sp)
                           000000  2807 .if MATH_OVF 	
                                   2808 	bcp a,#0x80 
                                   2809 	jreq 6$ 
                                   2810 	ld a,#ERR_MATH_OVF 
                                   2811 	jp tb_error
                                   2812 .endif 	 
      00900E AD FF            [ 1] 2813 6$:	ld (PROD,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2814 ; N1_HB * N2_HB 	
                                   2815 ; it is pointless to multiply N1_HB*N2_HB 
                                   2816 ; as this product is over 65535 or 0 
                                   2817 ;
                                   2818 ; sign adjust product
      009010 81 01            [ 1] 2819 	tnz (SIGN,sp)
      009011 27 05            [ 1] 2820 	jreq 7$
      009011 CD 8F            [ 2] 2821 	ldw x, (PROD,sp)
      009013 AD               [ 2] 2822 	negw x
      009014 CF 00            [ 2] 2823 	ldw (PROD,sp),x  
      0010B8                       2824 7$: 
      009016 0A 72            [ 2] 2825 	ldw x,(PROD,sp) 
      009018 5F 00 09 72      [ 5] 2826 	ldw [dstkptr],x 	
      0010BE                       2827 	_drop VSIZE 
      00901C 0F 00            [ 2]    1     addw sp,#VSIZE 
      00901E 0A               [ 4] 2828 	ret
                                   2829 
                                   2830 ;----------------------------------
                                   2831 ;  euclidian divide n2/n1 
                                   2832 ; dstack: {n2 n1 -- n2/n1 }
                                   2833 ; leave remainder in acc16
                                   2834 ;----------------------------------
                                   2835 	; local variables
                           000001  2836 	SQUOT=1 ; sign quotient
                           000002  2837 	SDIVD=2 ; sign dividend  
                           000003  2838 	DIVISR=3 ; divisor 
                           000004  2839 	VSIZE=4
      0010C1                       2840 divide:
      0010C1                       2841 	_vars VSIZE 
      00901F 04 72            [ 2]    1     sub sp,#VSIZE 
      009021 53 00            [ 1] 2842 	clr (SQUOT,sp)
      009023 09 C6            [ 1] 2843 	clr (SDIVD,sp)
                                   2844 ; check for 0 divisor
      009025 00 27 5F         [ 4] 2845 	call dpop 
      009028 97               [ 2] 2846 	tnzw x 
      009029 C6 00            [ 1] 2847     jrne 0$
      00902B 08 CD            [ 1] 2848 	ld a,#ERR_DIV0 
      00902D 89 48 81         [ 2] 2849 	jp tb_error 
                                   2850 ; check divisor sign 	
      009030 9E               [ 1] 2851 0$:	ld a,xh 
      009030 C7 00            [ 1] 2852 	bcp a,#0x80 
      009032 12 72            [ 1] 2853 	jreq 1$
      009034 CE 00            [ 1] 2854 	cpl (SQUOT,sp)
      009036 1B               [ 2] 2855 	negw x 
      009037 CF 00            [ 2] 2856 1$:	ldw (DIVISR,sp),x
                                   2857 ; check dividend sign 	 
      009039 13 72 5C 00      [ 5] 2858     ldw x,[dstkptr]
      00903D 1C               [ 1] 2859 	ld a,xh 
      00903E 72 5C            [ 1] 2860 	bcp a,#0x80 
      009040 00 1C            [ 1] 2861 	jreq 2$ 
      009042 81 0A            [ 1] 2862 	cpl (SQUOT,sp)
      009044 64 73            [ 1] 2863 	cpl (SDIVD,sp)
      009046 74               [ 2] 2864 	negw x 
      009047 61 63            [ 2] 2865 2$:	ldw y,(DIVISR,sp)
      009049 6B               [ 2] 2866 	divw x,y
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      00904A 3A 20 00 09      [ 2] 2867 	ldw acc16,y 
                                   2868 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      00904D 0D 02            [ 1] 2869 	tnz (SDIVD,sp)
      00904D 52 02            [ 1] 2870 	jreq 7$
      00904F AE 90            [ 2] 2871 	tnzw y 
      009051 43 CD            [ 1] 2872 	jreq 7$
      009053 82               [ 1] 2873 	incw x
      009054 B0 AE            [ 2] 2874 	ldw y,(DIVISR,sp)
      009056 17 7E C3 00      [ 2] 2875 	subw y,acc16
      00905A 1B 25 17 1F      [ 2] 2876 	ldw acc16,y  
      00905E 01 FE            [ 1] 2877 7$: tnz (SQUOT,sp)
      009060 CF 00            [ 1] 2878 	jreq 9$ 	 
      009062 0A               [ 2] 2879 8$:	negw x 
      009063 72 5F 00 09      [ 5] 2880 9$: ldw [dstkptr],x
      00110D                       2881 	_drop VSIZE 
      009067 5F A6            [ 2]    1     addw sp,#VSIZE 
      009069 8A               [ 4] 2882 	ret 
                                   2883 
                                   2884 
                                   2885 ;----------------------------------
                                   2886 ;  remainder resulting from euclidian 
                                   2887 ;  division of n2/n1 
                                   2888 ; dstack: {n2 n1 -- n2%n1 }
                                   2889 ;----------------------------------
      001110                       2890 modulo:
      00906A CD 89 48         [ 4] 2891 	call divide 
      00906D 1E 01 1D         [ 2] 2892 	ldw x,acc16 
      009070 00 02 20 E4      [ 5] 2893 	ldw [dstkptr],x 
      009074 A6               [ 4] 2894 	ret 
                                   2895 
                                   2896 ;---------------------------------
                                   2897 ; drop n elements from data stack 
                                   2898 ; input: 
                                   2899 ;   X 		n 
                                   2900 ; output:
                                   2901 ;   none 
                                   2902 ;-------------------------------------
      00111B                       2903 ddrop_n:
      009075 0D CD            [ 2] 2904 	pushw y 
      009077 82 9E 5B 02      [ 2] 2905 	ldw y,dstkptr 
      00907B 4F               [ 2] 2906 	sllw x 
      00907C 81               [ 2] 2907 	pushw x 
      00907D 0A 63 74         [ 2] 2908 	addw y,(1,sp)
      009080 61 63 6B 3A      [ 2] 2909 	ldw dstkptr,y 
      009084 20               [ 2] 2910 	popw x 
      009085 00 85            [ 2] 2911 	popw y
      009086 81               [ 4] 2912 	ret 
                                   2913 
                                   2914 ;---------------------------------
                                   2915 ; execute procedure which address
                                   2916 ; is at TOS 
                                   2917 ; --------------------------------
      00112E                       2918 execute: ; { addr -- ? }
      009086 AE 90 7D         [ 4] 2919 	call dpop
      009089 CD               [ 2] 2920 	jp (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2921 
                                   2922 
                                   2923 ;---------------------------------
                                   2924 ; input:
                                   2925 ;	X 		dictionary entry point 
                                   2926 ;  pad		.asciz name to search 
                                   2927 ; output:
                                   2928 ;  A 		TK_CMD|TK_FUNC|TK_NONE 
                                   2929 ;  X		execution address | 0 
                                   2930 ;---------------------------------
                           000001  2931 	NLEN=1 ; cmd length 
                           000002  2932 	YSAVE=2
                           000003  2933 	VSIZE=3 
      001132                       2934 search_dict:
      001132                       2935 	_vars VSIZE 
      00908A 82 B0            [ 2]    1     sub sp,#VSIZE 
      00908C 96 5C            [ 1] 2936 	ldw y,x 
      001136                       2937 search_next:	
      00908E CD 8F            [ 1] 2938 	ld a,(y)
      009090 A0 AE            [ 1] 2939 	and a,#0x7f 
      009092 17 FE            [ 1] 2940 	ld (NLEN,sp),a  
      009094 AE 17 18         [ 2] 2941 	ldw x,#pad 
      009094 CD 8F            [ 2] 2942 	ldw (YSAVE,sp),y
      009096 A0 FE            [ 1] 2943 	incw y  
      001143                       2944 cp_loop:
      009098 CF               [ 1] 2945 	ld a,(x)
      009099 00 0A            [ 1] 2946 	jreq str_match 
      00909B 72 5F            [ 1] 2947 	tnz (NLEN,sp)
      00909D 00 09            [ 1] 2948 	jreq no_match  
      00909F 5F A6            [ 1] 2949 	cp a,(y)
      0090A1 90 CD            [ 1] 2950 	jrne no_match 
      0090A3 89 48            [ 1] 2951 	incw y 
      0090A5 CD               [ 1] 2952 	incw x
      0090A6 8F AD            [ 1] 2953 	dec (NLEN,sp)
      0090A8 1D 00            [ 2] 2954 	jra cp_loop 
      001155                       2955 no_match:
      0090AA 02 72            [ 2] 2956 	ldw y,(YSAVE,sp) 
      0090AC C3 00 1B 2A      [ 2] 2957 	subw y,#2 ; move Y to link field
      0090B0 E3 AE            [ 1] 2958 	push #TK_NONE 
      0090B2 00 02            [ 2] 2959 	ldw y,(y) ; next word link 
      0090B4 CD               [ 1] 2960 	pop a ; TK_NONE 
      0090B5 91 9B            [ 1] 2961 	jreq search_exit  ; not found  
                                   2962 ;try next 
      0090B7 A6 0D            [ 2] 2963 	jra search_next
      001164                       2964 str_match:
      0090B9 CD 82            [ 2] 2965 	ldw y,(YSAVE,sp)
      0090BB 9E 4F            [ 1] 2966 	ld a,(y)
      0090BD 81 01            [ 1] 2967 	ld (NLEN,sp),a ; needed to test bit 7 
      0090BE A4 7F            [ 1] 2968 	and a,#0x7f 
                                   2969 ; move y to procedure address field 	
      0090BE CD               [ 1] 2970 	inc a 
      0090BF 90 4D CD         [ 1] 2971 	ld acc8,a 
      0090C2 90 86 4F 81      [ 1] 2972 	clr acc16 
      0090C6 72 B9 00 09      [ 2] 2973 	addw y,acc16 
      0090C6 CD 8F            [ 2] 2974 	ldw y,(y) ; routine entry point 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      0090C8 AD CF            [ 1] 2975 	ld a,(NLEN,sp)
      0090CA 00 0A            [ 1] 2976 	bcp a,#0x80 
      0090CC 72 CE            [ 1] 2977 	jreq 1$
      0090CE 00 1B            [ 1] 2978 	ld a,#TK_FUNC 
      0090D0 72 BB            [ 2] 2979 	jra search_exit
      0090D2 00 0A            [ 1] 2980 1$: ld a,#TK_CMD 
      001186                       2981 search_exit: 
      0090D4 72               [ 1] 2982 	ldw x,y ; x=routine address 
      001187                       2983 	_drop VSIZE 	 
      0090D5 CF 00            [ 2]    1     addw sp,#VSIZE 
      0090D7 1B               [ 4] 2984 	ret 
                                   2985 
                                   2986 ;---------------------
                                   2987 ; check if next token
                                   2988 ;  is of expected type 
                                   2989 ; input:
                                   2990 ;   A 		 expected token attribute
                                   2991 ;  ouput:
                                   2992 ;   none     if fail call tb_error 
                                   2993 ;--------------------
      00118A                       2994 expect:
      0090D8 81               [ 1] 2995 	push a 
      0090D9 CD 0C 58         [ 4] 2996 	call get_token 
      0090D9 CD 8F            [ 1] 2997 	cp a,(1,sp)
      0090DB AD CF            [ 1] 2998 	jreq 1$
      0090DD 00 0A 72         [ 2] 2999 	jp syntax_error
      0090E0 CE               [ 1] 3000 1$: pop a 
      0090E1 00               [ 4] 3001 	ret 
                                   3002 
                                   3003 
                                   3004 ;-------------------------------
                                   3005 ; parse embedded BASIC routines 
                                   3006 ; arguments list.
                                   3007 ; arg_list::=  rel[','rel]*
                                   3008 ; all arguments are of integer type
                                   3009 ; input:
                                   3010 ;   none
                                   3011 ; output:
                                   3012 ;   A 			number of arguments pushed on dstack  
                                   3013 ;--------------------------------
                           000001  3014 	ARG_CNT=1 
      001197                       3015 arg_list:
      0090E2 1B 72            [ 1] 3016 	push #0  
      0090E4 B0 00 0A         [ 4] 3017 1$: call relation
      0090E7 8A 72            [ 1] 3018 	cp a,#TK_NONE 
      0090E9 CF 00            [ 1] 3019 	jreq 5$
      0090EB 1B 86            [ 1] 3020 	cp a,#TK_INTGR
      0090ED 81 12            [ 1] 3021 	jrne 4$
      0090EE                       3022 3$:
      0090EE 52 07            [ 1] 3023     inc (ARG_CNT,sp)
      0090F0 0F 01 CD         [ 4] 3024 	call get_token 
      0090F3 8F AD            [ 1] 3025 	cp a,#TK_NONE 
      0090F5 1F 04            [ 1] 3026 	jreq 5$ 
      0090F7 9E A5            [ 1] 3027 	cp a,#TK_COMMA 
      0090F9 80 27            [ 1] 3028 	jrne 4$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0090FB 05 03 01         [ 4] 3029 	call ddrop 
      0090FE 50 1F            [ 2] 3030 	jra 1$ 
      009100 04 72 CE         [ 4] 3031 4$:	call unget_token 
      009103 00               [ 1] 3032 5$:	pop a 
      009104 1B               [ 4] 3033 	ret 
                                   3034 
                                   3035 
                                   3036 
                                   3037 ;--------------------------------
                                   3038 ;   BASIC commnands 
                                   3039 ;--------------------------------
                                   3040 
                                   3041 ;--------------------------------
                                   3042 ;  arithmetic and relational 
                                   3043 ;  routines
                                   3044 ;  operators precedence
                                   3045 ;  highest to lowest
                                   3046 ;  operators on same row have 
                                   3047 ;  same precedence and are executed
                                   3048 ;  from left to right.
                                   3049 ;	'*','/','%'
                                   3050 ;   '-','+'
                                   3051 ;   '=','>','<','>=','<=','<>','><'
                                   3052 ;   '<>' and '><' are equivalent for not equal.
                                   3053 ;--------------------------------
                                   3054 
                                   3055 ;------------------------------
                                   3056 ; negate value on dstack
                                   3057 ; dstack: {n -- -n}
                                   3058 ;------------------------------
      0011BB                       3059 negate:	
      009105 1F 06 9E A5      [ 5] 3060 	ldw x,[dstkptr]
      009109 80               [ 2] 3061 	negw x 
      00910A 27 05 03 01      [ 5] 3062 	ldw [dstkptr],x 
      00910E 50               [ 4] 3063 	ret 
                                   3064 
                                   3065 ;---------------------
                                   3066 ; return array element
                                   3067 ; address from @(expr)
                                   3068 ; input:
                                   3069 ;   A 		TK_ARRAY
                                   3070 ; output:
                                   3071 ;	X 		TK_INTGR, element address 
                                   3072 ;----------------------
      0011C5                       3073 get_array_element:
      00910F 1F 06 7B         [ 4] 3074 	call ddrop ; {*pad -- }
      009112 05 97            [ 1] 3075 	ld a,#TK_LPAREN 
      009114 7B 07 42         [ 4] 3076 	call expect
      009117 1F 02 7B         [ 4] 3077 	call ddrop 
      00911A 05 97 7B         [ 4] 3078 	call relation 
      00911D 06 42            [ 1] 3079 	cp a,#TK_INTGR 
      00911F 9F 1B            [ 1] 3080 	jreq 1$
      009121 02 6B 02         [ 2] 3081 	jp syntax_error
      0011DA                       3082 1$: 
      009124 7B 04            [ 1] 3083 	ld a,#TK_RPAREN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      009126 97 7B 07         [ 4] 3084 	call expect
      009129 42 9F 1B         [ 4] 3085 	call ddrop  
                                   3086 	; check for bounds 
      00912C 02 6B 02         [ 4] 3087 	call dpop  
      00912F 0D 01 27         [ 2] 3088 	cpw x,array_size 
      009132 05 1E            [ 2] 3089 	jrule 3$
                                   3090 ; bounds {1..array_size}	
      009134 02 50            [ 1] 3091 2$: ld a,#ERR_BAD_VALUE 
      009136 1F 02 93         [ 2] 3092 	jp tb_error 
      009138 5D               [ 2] 3093 3$: tnzw  x
      009138 1E 02            [ 1] 3094 	jreq 2$ 
      00913A 72               [ 2] 3095 	sllw x 
      00913B CF               [ 2] 3096 	pushw x 
      00913C 00 1B 5B         [ 2] 3097 	ldw x,array_addr  
      00913F 07 81 01         [ 2] 3098 	subw x,(1,sp)
      009141 CD 0F 20         [ 4] 3099 	call dpush 
      0011FD                       3100 	_drop 2   
      009141 52 04            [ 2]    1     addw sp,#2 
      009143 0F 01            [ 1] 3101 	ld a,#TK_INTGR
      009145 0F               [ 4] 3102 	ret 
                                   3103 
                                   3104 ;***********************************
                                   3105 ;   expression parse,execute 
                                   3106 ;***********************************
                                   3107 ;-----------------------------------
                                   3108 ; factor ::= ['+'|'-'|e] var | @ |
                                   3109 ;			 integer | function |
                                   3110 ;			 '('relation')' 
                                   3111 ; output:
                                   3112 ;   A    token attribute 
                                   3113 ;   dstack 	 integer
                                   3114 ; ---------------------------------
                           000001  3115 	NEG=1
                           000001  3116 	VSIZE=1
      001202                       3117 factor:
      001202                       3118 	_vars VSIZE 
      009146 02 CD            [ 2]    1     sub sp,#VSIZE 
      009148 8F AD 5D         [ 4] 3119 	call get_token
      00914B 26 05            [ 1] 3120 	cp a,#TK_NONE 
      00914D A6 04            [ 1] 3121 	jrne 0$
      00914F CC 87 13         [ 2] 3122 	jp 20$
      009152 9E A5            [ 1] 3123 0$: cp a,#TK_COLON 
      009154 80 27            [ 1] 3124 	jrne 1$
      009156 03 03 01         [ 1] 3125 	ld untok,a
      009159 50               [ 1] 3126 	clr a 
      00915A 1F 03 72         [ 2] 3127 	jp 20$  
      00915D CE 00            [ 1] 3128 1$:	ld (NEG,sp),a 
      00915F 1B 9E            [ 1] 3129 	and a,#TK_GRP_MASK 
      009161 A5 80            [ 1] 3130 	cp a,#TK_GRP_ADD 
      009163 27 05            [ 1] 3131 	jreq 2$ 
      009165 03 01            [ 1] 3132 	ld a,(NEG,sp)
      009167 03 02            [ 1] 3133 	clr (NEG,sp)
      009169 50 16            [ 2] 3134 	jra 4$
      001227                       3135 2$:	_dp_up ; {char* pad -- } 
      00916B 03 65 90 CF      [ 1]    1     inc dstkptr+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00916F 00 0A 0D 02      [ 1]    2     inc dstkptr+1
      009173 27 0F 90         [ 4] 3136 	call get_token 
      009176 5D 27            [ 1] 3137 4$:	cp a,#TK_FUNC 
      009178 0B 5C            [ 1] 3138 	jrne 5$ 
      00917A 16 03 72         [ 4] 3139 	call execute 
      00917D B2 00 0A         [ 4] 3140 	call dpop
      009180 90 CF            [ 2] 3141 	jra 18$ 
      00123E                       3142 5$:
      009182 00 0A            [ 1] 3143 	cp a,#TK_INTGR
      009184 0D 01            [ 1] 3144 	jrne 6$
      009186 27 01 50         [ 4] 3145 	call dpop
      009189 72 CF            [ 2] 3146 	jra 18$
      001247                       3147 6$:
      00918B 00 1B            [ 1] 3148 	cp a,#TK_ARRAY
      00918D 5B 04            [ 1] 3149 	jrne 10$
      00918F 81 11 C5         [ 4] 3150 	call get_array_element
      009190 CD 0F 2D         [ 4] 3151 	call dpop 
      009190 CD               [ 2] 3152 	ldw x,(x)
      009191 91 41            [ 2] 3153 	jra 18$ 
      001254                       3154 10$:
      009193 CE 00            [ 1] 3155 	cp a,#TK_VAR 
      009195 0A 72            [ 1] 3156 	jrne 12$
      009197 CF 00 1B         [ 4] 3157 	call dpop 
      00919A 81               [ 2] 3158 	ldw x,(x)
      00919B 20 17            [ 2] 3159 	jra 18$
      00125E                       3160 12$:			
      00919B 90 89            [ 1] 3161 	cp a,#TK_LPAREN
      00919D 90 CE            [ 1] 3162 	jrne 16$
      00919F 00 1B 58         [ 4] 3163 	call relation
      0091A2 89 72            [ 1] 3164 	ld a,#TK_RPAREN 
      0091A4 F9 01 90         [ 4] 3165 	call expect
      0091A7 CF 00 1B         [ 4] 3166 	call dpop  
      0091AA 85 90            [ 2] 3167 	jra 18$	
      00126F                       3168 16$:
      0091AC 85 81 B0         [ 4] 3169 	call unget_token
      0091AE 4F               [ 1] 3170 	clr a 
      0091AE CD 8F            [ 2] 3171 	jra 20$ 
      001275                       3172 18$: 
      0091B0 AD FC            [ 1] 3173 	ld a,#TK_MINUS 
      0091B2 11 01            [ 1] 3174 	cp a,(NEG,sp)
      0091B2 52 03            [ 1] 3175 	jrne 19$
      0091B4 90               [ 2] 3176 	negw x
      00127C                       3177 19$:
      0091B5 93 0F 20         [ 4] 3178 	call dpush  
      0091B6 A6 0A            [ 1] 3179 	ld a,#TK_INTGR
      001281                       3180 20$:
      001281                       3181 	_drop VSIZE
      0091B6 90 F6            [ 2]    1     addw sp,#VSIZE 
      0091B8 A4               [ 4] 3182 	ret
                                   3183 
                                   3184 ;-----------------------------------
                                   3185 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3186 ; output:
                                   3187 ;   A    	token attribute 
                                   3188 ;	dstack	integer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3189 ;-----------------------------------
                           000001  3190 	MULOP=1
                           000001  3191 	VSIZE=1
      001284                       3192 term:
      001284                       3193 	_vars VSIZE
      0091B9 7F 6B            [ 2]    1     sub sp,#VSIZE 
      0091BB 01 AE 17         [ 4] 3194 	call factor
      0091BE 18 17            [ 1] 3195 	cp a,#TK_NONE 
      0091C0 02 90            [ 1] 3196 	jreq term_exit
      00128D                       3197 term01:	 ; check for  operator 
      0091C2 5C 0C 58         [ 4] 3198 	call get_token
      0091C3 A1 00            [ 1] 3199 	cp a,#TK_NONE
      0091C3 F6 27            [ 1] 3200 	jreq 9$
      0091C5 1E 0D            [ 1] 3201 0$:	ld (MULOP,sp),a
      0091C7 01 27            [ 1] 3202 	and a,#TK_GRP_MASK
      0091C9 0B 90            [ 1] 3203 	cp a,#TK_GRP_MULT
      0091CB F1 26            [ 1] 3204 	jreq 1$
      0091CD 07 90            [ 1] 3205 	ld a,(MULOP,sp) 
      0091CF 5C 5C 0A         [ 4] 3206 	call unget_token 
      0091D2 01 20            [ 2] 3207 	jra 9$
      0012A3                       3208 1$:	; got *|/|%
      0091D4 EE 0F 54         [ 4] 3209 	call ddrop ; {char* pad -- } 
      0091D5 CD 12 02         [ 4] 3210 	call factor
      0091D5 16 02            [ 1] 3211 	cp a,#TK_INTGR
      0091D7 72 A2            [ 1] 3212 	jreq 2$ 
      0091D9 00 02 4B         [ 2] 3213 	jp syntax_error
      0091DC 00 90            [ 1] 3214 2$:	ld a,(MULOP,sp) 
      0091DE FE 84            [ 1] 3215 	cp a,#TK_MULT 
      0091E0 27 24            [ 1] 3216 	jrne 3$
      0091E2 20 D2 6E         [ 4] 3217 	call multiply 
      0091E4 20 D2            [ 2] 3218 	jra term01
      0091E4 16 02            [ 1] 3219 3$: cp a,#TK_DIV 
      0091E6 90 F6            [ 1] 3220 	jrne 4$ 
      0091E8 6B 01 A4         [ 4] 3221 	call divide 
      0091EB 7F 4C            [ 2] 3222 	jra term01 
      0091ED C7 00 0B         [ 4] 3223 4$: call modulo
      0091F0 72 5F            [ 2] 3224 	jra term01 
      0091F2 00 0A            [ 1] 3225 9$: ld a,#TK_INTGR 	
      0012CB                       3226 term_exit:
      0012CB                       3227 	_drop VSIZE 
      0091F4 72 B9            [ 2]    1     addw sp,#VSIZE 
      0091F6 00               [ 4] 3228 	ret 
                                   3229 
                                   3230 ;-------------------------------
                                   3231 ;  expr ::= term [['+'|'-'] term]*
                                   3232 ;  result range {-32768..32767}
                                   3233 ;  output:
                                   3234 ;   A    token attribute 
                                   3235 ;   integer    pushed on dstack 
                                   3236 ;-------------------------------
                           000001  3237 	OP=1 
                           000001  3238 	VSIZE=1 
      0012CE                       3239 expression:
      0012CE                       3240 	_vars VSIZE 
      0091F7 0A 90            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      0091F9 FE 7B 01         [ 4] 3241 	call term
      0091FC A5 80            [ 1] 3242 	cp a,#TK_NONE 
      0091FE 27 04            [ 1] 3243 	jreq expr_exit 
      009200 A6 0C 20         [ 4] 3244 0$:	call get_token
      009203 02 A6            [ 1] 3245 	cp a,#TK_NONE 
      009205 06 2C            [ 1] 3246 	jreq 9$  
      009206 6B 01            [ 1] 3247 1$:	ld (OP,sp),a  
      009206 93 5B            [ 1] 3248 	and a,#TK_GRP_MASK
      009208 03 81            [ 1] 3249 	cp a,#TK_GRP_ADD 
      00920A 27 07            [ 1] 3250 	jreq 2$ 
      00920A 88 CD            [ 1] 3251 	ld a,(OP,sp)
      00920C 8C D8 11         [ 4] 3252 	call unget_token
      00920F 01 27            [ 2] 3253 	jra 9$
      009211 03 CC 87         [ 4] 3254 2$: call ddrop 
      009214 11 84 81         [ 4] 3255 	call term
      009217 A1 0A            [ 1] 3256 	cp a,#TK_INTGR 
      009217 4B 00            [ 1] 3257 	jreq 3$
      009219 CD 93 8F         [ 2] 3258 	jp syntax_error
      0012FA                       3259 3$:	
      00921C A1 00            [ 1] 3260 	ld a,(OP,sp)
      00921E 27 19            [ 1] 3261 	cp a,#TK_PLUS 
      009220 A1 0A            [ 1] 3262 	jrne 4$
      009222 26 12 46         [ 4] 3263 	call add 
      009224 20 D2            [ 2] 3264 	jra 0$ 
      009224 0C 01 CD         [ 4] 3265 4$:	call substract
      009227 8C D8            [ 2] 3266 	jra 0$
      009229 A1 00            [ 1] 3267 9$: ld a,#TK_INTGR	
      00130C                       3268 expr_exit:
      00130C                       3269 	_drop VSIZE 
      00922B 27 0C            [ 2]    1     addw sp,#VSIZE 
      00922D A1               [ 4] 3270 	ret 
                                   3271 
                                   3272 ;---------------------------------------------
                                   3273 ; rel ::= expr rel_op expr
                                   3274 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3275 ;  relation return 1 | 0  for true | false 
                                   3276 ;  output:
                                   3277 ;	 1|0 pushed on dtsack 
                                   3278 ;---------------------------------------------
                           000001  3279 	RELOP=1
                           000001  3280 	VSIZE=1 
      00130F                       3281 relation: 
      00130F                       3282 	_vars VSIZE
      00922E 08 26            [ 2]    1     sub sp,#VSIZE 
      009230 05 CD 8F         [ 4] 3283 	call expression
      009233 D4 20            [ 1] 3284 	cp a,#TK_NONE 
      009235 E3 CD            [ 1] 3285 	jreq rel_exit 
                                   3286 	; expect rel_op or leave 
      009237 90 30 84         [ 4] 3287 	call get_token 
      00923A 81 00            [ 1] 3288 	cp a,#TK_NONE 
      00923B 27 41            [ 1] 3289 	jreq 9$
      00131F                       3290 1$:	
      00923B 72 CE            [ 1] 3291 	ld (RELOP,sp),a 
      00923D 00 1B            [ 1] 3292 	and a,#TK_GRP_MASK
      00923F 50 72            [ 1] 3293 	cp a,#0x30 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009241 CF 00            [ 1] 3294 	jreq 2$
      009243 1B 81            [ 1] 3295 	ld a,(RELOP,sp)
      009245 CD 0F B0         [ 4] 3296 	call unget_token  
      009245 CD 8F            [ 2] 3297 	jra 9$
      00132E                       3298 2$:	; expect another expression or error 
      009247 D4 A6 03         [ 4] 3299 	call ddrop 
      00924A CD 92 0A         [ 4] 3300 	call expression
      00924D CD 8F            [ 1] 3301 	cp a,#TK_INTGR 
      00924F D4 CD            [ 1] 3302 	jreq 3$
      009251 93 8F A1         [ 2] 3303 	jp syntax_error 
      00133B                       3304 3$:	
      009254 0A 27 03         [ 4] 3305 	call substract
      009257 CC 87            [ 1] 3306 	jrne 4$
      009259 11 02 00 0A      [ 1] 3307 	mov acc8,#2 ; n1==n2
      00925A 20 0C            [ 2] 3308 	jra 6$ 
      001346                       3309 4$: 
      00925A A6 04            [ 1] 3310 	jrsgt 5$  
      00925C CD 92 0A CD      [ 1] 3311 	mov acc8,#4 ; n1<2 
      009260 8F D4            [ 2] 3312 	jra 6$
      00134E                       3313 5$:
      009262 CD 8F AD C3      [ 1] 3314 	mov acc8,#1 ; n1>n2 
      001352                       3315 6$:
      009266 00               [ 1] 3316 	clrw x 
      009267 24 23 05         [ 1] 3317 	ld a, acc8  
      00926A A6 0A            [ 1] 3318 	and a,(RELOP,sp)
      00926C CC               [ 1] 3319 	tnz a 
      00926D 87 13            [ 1] 3320 	jreq 7$
      00926F 5D               [ 1] 3321 	incw x 
      00135C                       3322 7$:	 
      009270 27 F8 58 89      [ 5] 3323 	ldw [dstkptr],x 	
      001360                       3324 9$:
      009274 CE 00            [ 1] 3325 	ld a,#TK_INTGR
      001362                       3326 rel_exit: 	 
      001362                       3327 	_drop VSIZE
      009276 22 72            [ 2]    1     addw sp,#VSIZE 
      009278 F0               [ 4] 3328 	ret 
                                   3329 
                                   3330 
                                   3331 ;--------------------------------------------
                                   3332 ; BASIC: HEX 
                                   3333 ; select hexadecimal base for integer print
                                   3334 ;---------------------------------------------
      001365                       3335 hex_base:
      009279 01 CD 8F A0      [ 1] 3336 	mov base,#16 
      00927D 5B               [ 4] 3337 	ret 
                                   3338 
                                   3339 ;--------------------------------------------
                                   3340 ; BASIC: DEC 
                                   3341 ; select decimal base for integer print
                                   3342 ;---------------------------------------------
      00136A                       3343 dec_base:
      00927E 02 A6 0A 81      [ 1] 3344 	mov base,#10
      009282 81               [ 4] 3345 	ret 
                                   3346 
                                   3347 ;------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3348 ; BASIC: SIZE 
                                   3349 ; return free size in text area
                                   3350 ; output:
                                   3351 ;   A 		TK_INTGR
                                   3352 ;   X 	    size integer
                                   3353 ;--------------------------
      00136F                       3354 size:
      009282 52 01 CD         [ 2] 3355 	ldw x,#tib 
      009285 8C D8 A1 00      [ 2] 3356 	subw x,txtend 
      009289 26 03 CC         [ 4] 3357 	call dpush 
      00928C 93 01            [ 1] 3358 	ld a,#TK_INTGR
      00928E A1               [ 4] 3359 	ret 
                                   3360 
                                   3361 
                                   3362 ;------------------------
                                   3363 ; BASIC: UBOUND  
                                   3364 ; return array variable size 
                                   3365 ; output:
                                   3366 ;   A 		TK_INTGR
                                   3367 ;   X 	    array size 
                                   3368 ;--------------------------
      00137C                       3369 ubound:
      00928F 07 26 07         [ 2] 3370 	ldw x,#tib
      009292 C7 00 12 4F      [ 2] 3371 	subw x,txtend 
      009296 CC               [ 2] 3372 	srlw x 
      009297 93 01 6B         [ 2] 3373 	ldw array_size,x
      00929A 01 A4 30         [ 4] 3374 	call dpush   
      00929D A1 10            [ 1] 3375 	ld a,#TK_INTGR
      00929F 27               [ 4] 3376 	ret 
                                   3377 
      00138D                       3378 let:
      0092A0 06 7B 01         [ 4] 3379 	call get_token 
      0092A3 0F 01            [ 1] 3380 	cp a,#TK_VAR 
      0092A5 20 0B            [ 1] 3381 	jreq let02
      0092A7 72 5C 00         [ 2] 3382 	jp syntax_error
      001397                       3383 let02:
      0092AA 1C 72 5C         [ 4] 3384 	call get_token 
      0092AD 00 1C            [ 1] 3385 	cp a,#TK_EQUAL
      0092AF CD 8C            [ 1] 3386 	jreq 1$
      0092B1 D8 A1 0C         [ 2] 3387 	jp syntax_error
      0092B4 26 08 CD         [ 4] 3388 1$:	call ddrop 
      0092B7 91 AE CD         [ 4] 3389 	call relation   
      0092BA 8F AD            [ 1] 3390 	cp a,#TK_INTGR 
      0092BC 20 37            [ 1] 3391 	jreq 2$
      0092BE CC 06 91         [ 2] 3392 	jp syntax_error
      0013AE                       3393 2$:	
      0092BE A1 0A 26         [ 4] 3394 	call store  
      0092C1 05 CD            [ 1] 3395 	ld a,#TK_NONE 
      0092C3 8F               [ 4] 3396 	ret 
                                   3397 
                                   3398 ;----------------------------
                                   3399 ; BASIC: LIST [[start][,end]]
                                   3400 ; list program lines 
                                   3401 ; form start to end 
                                   3402 ; if empty argument list then 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



                                   3403 ; list all.
                                   3404 ;----------------------------
                           000001  3405 	FIRST=1
                           000003  3406 	LAST=3 
                           000005  3407 	LN_PTR=5
                           000006  3408 	VSIZE=6 
      0013B4                       3409 list:
      0013B4                       3410 	_vars VSIZE
      0092C4 AD 20            [ 2]    1     sub sp,#VSIZE 
      0092C6 2E 00 1C         [ 2] 3411 	ldw x,txtbgn 
      0092C7 C3 00 1E         [ 2] 3412 	cpw x,txtend 
      0092C7 A1 02            [ 1] 3413 	jrmi 1$
      0092C9 26 09 CD         [ 2] 3414 	jp list_exit ; nothing to list 
      0092CC 92 45            [ 2] 3415 1$:	ldw (LN_PTR,sp),x 
      0092CE CD               [ 2] 3416 	ldw x,(x) 
      0092CF 8F AD            [ 2] 3417 	ldw (FIRST,sp),x ; list from first line 
      0092D1 FE 20 21         [ 2] 3418 	ldw x,#0x7fff ; biggest line number 
      0092D4 1F 03            [ 2] 3419 	ldw (LAST,sp),x 
      0092D4 A1 01 26         [ 4] 3420 	call arg_list
      0092D7 06               [ 1] 3421 	tnz a
      0092D8 CD 8F            [ 1] 3422 	jreq list_start 
      0092DA AD FE            [ 1] 3423 	cp a,#2 
      0092DC 20 17            [ 1] 3424 	jreq 4$
      0092DE A1 01            [ 1] 3425 	cp a,#1 
      0092DE A1 03            [ 1] 3426 	jreq first_line 
      0092E0 26 0D CD         [ 2] 3427 	jp syntax_error 
      0092E3 93 8F A6         [ 4] 3428 4$:	call dswap
      0013DF                       3429 first_line:
      0092E6 04 CD 92         [ 4] 3430 	call dpop 
      0092E9 0A CD            [ 2] 3431 	ldw (FIRST,sp),x 
      0092EB 8F AD            [ 1] 3432 	cp a,#1 
      0092ED 20 06            [ 1] 3433 	jreq lines_skip 	
      0092EF                       3434 last_line:
      0092EF CD 90 30         [ 4] 3435 	call dpop 
      0092F2 4F 20            [ 2] 3436 	ldw (LAST,sp),x 
      0013ED                       3437 lines_skip:
      0092F4 0C 00 1C         [ 2] 3438 	ldw x,txtbgn
      0092F5 1F 05            [ 2] 3439 2$:	ldw (LN_PTR,sp),x 
      0092F5 A6 11 11         [ 2] 3440 	cpw x,txtend 
      0092F8 01 26            [ 1] 3441 	jrpl list_exit 
      0092FA 01               [ 2] 3442 	ldw x,(x) ;lineno 
      0092FB 50 01            [ 2] 3443 	cpw x,(FIRST,sp)
      0092FC 2A 14            [ 1] 3444 	jrpl list_start 
      0092FC CD 8F            [ 2] 3445 	ldw x,(LN_PTR,sp) 
      0092FE A0 A6 0A         [ 2] 3446 	addw x,#2 
      009301 F6               [ 1] 3447 	ld a,(x)
      009301 5B               [ 1] 3448 	incw x 
      009302 01 81 0A         [ 1] 3449 	ld acc8,a 
      009304 72 5F 00 09      [ 1] 3450 	clr acc16 
      009304 52 01 CD 92      [ 2] 3451 	addw x,acc16
      009308 82 A1            [ 2] 3452 	jra 2$ 
                                   3453 ; print loop
      001410                       3454 list_start:
      00930A 00 27            [ 2] 3455 	ldw x,(LN_PTR,sp)
      001412                       3456 3$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      00930C 3E 14 4C         [ 4] 3457 	call prt_basic_line
      00930D 1E 05            [ 2] 3458 	ldw x,(LN_PTR,sp)
      00930D CD 8C D8         [ 2] 3459 	addw x,#2 
      009310 A1               [ 1] 3460 	ld a,(x)
      009311 00               [ 1] 3461 	incw x 
      009312 27 35 6B         [ 1] 3462 	ld acc8,a 
      009315 01 A4 30 A1      [ 1] 3463 	clr acc16 
      009319 20 27 07 7B      [ 2] 3464 	addw x,acc16
      00931D 01 CD 90         [ 2] 3465 	cpw x,txtend 
      009320 30 20            [ 1] 3466 	jrpl list_exit
      009322 26 05            [ 2] 3467 	ldw (LN_PTR,sp),x
      009323 FE               [ 2] 3468 	ldw x,(x)
      009323 CD 8F            [ 2] 3469 	cpw x,(LAST,sp)  
      009325 D4 CD            [ 1] 3470 	jrsgt list_exit 
      009327 92 82            [ 2] 3471 	ldw x,(LN_PTR,sp)
      009329 A1 0A            [ 2] 3472 	jra 3$
      001437                       3473 list_exit:
      001437                       3474 	_drop VSIZE 
      00932B 27 03            [ 2]    1     addw sp,#VSIZE 
      00932D CC               [ 1] 3475 	clr a 	
      00932E 87               [ 4] 3476 	ret
                                   3477 
      00932F 11 7B 01 A1 20 26 05  3478 empty: .asciz "Nothing to list\n"
             CD 90 EE 20 D2 A1 21
             26 05 CD
                                   3479 
                                   3480 ;--------------------------
                                   3481 ; input:
                                   3482 ;   X 		pointer at line
                                   3483 ; output:
                                   3484 ;   none 
                                   3485 ;--------------------------	
      00144C                       3486 prt_basic_line:
      009340 91               [ 2] 3487 	pushw x 
      009341 41               [ 2] 3488 	ldw x,(x)
      009342 20 C9 CD         [ 2] 3489 	ldw acc16,x 
      009345 91 90 20 C4      [ 1] 3490 	clr acc24 
      009349 A6 0A 05         [ 2] 3491 	ldw x,#5 
      00934B A6 0A            [ 1] 3492 	ld a,#10 
      00934B 5B 01 81         [ 4] 3493 	call prti24 
      00934E 85               [ 2] 3494 	popw x 
      00934E 52 01 CD         [ 2] 3495 	addw x,#3
      009351 93 04 A1         [ 4] 3496 	call puts 
      009354 00 27            [ 1] 3497 	ld a,#CR 
      009356 35 CD 8C         [ 4] 3498 	call putc 
      009359 D8               [ 4] 3499 	ret 	
                                   3500 
                                   3501 ;---------------------------------
                                   3502 ; BASIC: PRINT|? arg_list 
                                   3503 ; print values from argument list
                                   3504 ;----------------------------------
                           000001  3505 	COMMA=1
                           000001  3506 	VSIZE=1
      00146A                       3507 print:
      00935A A1 00            [ 1] 3508 	push #0 ; local variable COMMA 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      00146C                       3509 reset_comma:
      00935C 27 2C            [ 1] 3510 	clr (COMMA,sp)
      00146E                       3511 prt_loop:
      00935E 6B 01 A4         [ 4] 3512 	call relation
      009361 30 A1            [ 1] 3513 	cp a,#TK_INTGR 
      009363 10 27            [ 1] 3514 	jrne 0$ 
      009365 07 7B 01         [ 4] 3515 	call prt_tos 
      009368 CD 90            [ 2] 3516 	jra reset_comma
      00147A                       3517 0$: 	
      00936A 30 20 1D         [ 4] 3518 	call get_token
      00936D CD 8F            [ 1] 3519 	cp a,#TK_NONE 
      00936F D4 CD            [ 1] 3520 	jreq print_exit 
      009371 93 04            [ 1] 3521 	cp a,#TK_COLON 
      009373 A1 0A            [ 1] 3522 	jrne 1$
      009375 27 03 CC         [ 1] 3523 	ld untok,a 
      009378 87 11            [ 2] 3524 	jra print_exit  
      00937A A1 05            [ 1] 3525 1$:	cp a,#TK_QSTR
      00937A 7B 01            [ 1] 3526 	jrne 2$   
      00937C A1 10 26         [ 4] 3527 	call dpop  
      00937F 05 CD 90         [ 4] 3528 	call puts 
      009382 C6 20            [ 2] 3529 	jra reset_comma
      009384 D2 CD            [ 1] 3530 2$: cp a,#TK_CHAR 
      009386 90 D9            [ 1] 3531 	jrne 3$
      009388 20 CD A6         [ 4] 3532 	call dpop 
      00938B 0A               [ 1] 3533 	ld a,xl 
      00938C CD 02 1E         [ 4] 3534 	call putc 
      00938C 5B 01            [ 2] 3535 	jra reset_comma 
      0014A3                       3536 3$: 	
      00938E 81 0C            [ 1] 3537 	cp a,#TK_FUNC 
      00938F 26 08            [ 1] 3538 	jrne 4$ 
      00938F 52 01 CD         [ 4] 3539 	call execute
      009392 93 4E A1         [ 4] 3540 	call prt_tos 
      009395 00 27            [ 2] 3541 	jra reset_comma 
      0014AF                       3542 4$: 
      009397 4A CD            [ 1] 3543 	cp a,#TK_COMMA 
      009399 8C D8            [ 1] 3544 	jrne 5$
      00939B A1 00 27         [ 4] 3545 	call ddrop 
      00939E 41 01            [ 1] 3546 	cpl (COMMA,sp) 
      00939F CC 14 6E         [ 2] 3547 	jp prt_loop   
      0014BB                       3548 5$: 
      00939F 6B 01            [ 1] 3549 	cp a,#TK_SHARP
      0093A1 A4 30            [ 1] 3550 	jrne 7$
      0093A3 A1 30 27         [ 4] 3551 	call ddrop   
      0093A6 07 7B 01         [ 4] 3552 	call get_token
      0093A9 CD 90            [ 1] 3553 	cp a,#TK_INTGR 
      0093AB 30 20            [ 1] 3554 	jreq 6$
      0093AD 32 06 91         [ 2] 3555 	jp syntax_error 
      0093AE CD 0F 2D         [ 4] 3556 6$:	call dpop 
      0093AE CD               [ 1] 3557 	ld a,xl 
      0093AF 8F D4            [ 1] 3558 	and a,#15 
      0093B1 CD 93 4E         [ 1] 3559 	ld tab_width,a 
      0093B4 A1 0A            [ 2] 3560 	jra reset_comma 
      0014D7                       3561 7$:	
      0093B6 27 03 CC         [ 4] 3562 	call unget_token
      0014DA                       3563 print_exit:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0093B9 87 11            [ 1] 3564 	tnz (COMMA,sp)
      0093BB 26 05            [ 1] 3565 	jrne 9$
      0093BB CD 90            [ 1] 3566 	ld a,#CR 
      0093BD D9 26 06         [ 4] 3567     call putc 
      0014E3                       3568 9$:	_drop VSIZE 
      0093C0 35 02            [ 2]    1     addw sp,#VSIZE 
      0093C2 00               [ 1] 3569 	clr a
      0093C3 0B               [ 4] 3570 	ret 
                                   3571 
                                   3572 ;----------------------
                                   3573 ; 'save_context' and
                                   3574 ; 'rest_context' must be 
                                   3575 ; called at the same 
                                   3576 ; call stack depth 
                                   3577 ; i.e. SP must have the 
                                   3578 ; save value at  
                                   3579 ; entry point of both 
                                   3580 ; routine. 
                                   3581 ;---------------------
                                   3582 ;--------------------
                                   3583 ; save current BASIC
                                   3584 ; interpreter context 
                                   3585 ; on cstack 
                                   3586 ;--------------------
      0014E7                       3587 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      0014E7                       3588 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      0014E7                       3589 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      0014E7                       3590 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      0014E7                       3591 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      0014E7                       3592 save_context:
      0093C4 20 0C 03         [ 2] 3593 	ldw x,basicptr 
      0093C6 1F 03            [ 2] 3594 	ldw (BPTR,sp),x
      0093C6 2C 06 35         [ 2] 3595 	ldw x,lineno 
      0093C9 04 00            [ 2] 3596 	ldw (LNO,sp),x 
      0093CB 0B 20 04         [ 1] 3597 	ld a,in 
      0093CE 6B 07            [ 1] 3598 	ld (IN,sp),a
      0093CE 35 01 00         [ 1] 3599 	ld a,count 
      0093D1 0B 08            [ 1] 3600 	ld (CNT,sp),a  
      0093D2 81               [ 4] 3601 	ret
                                   3602 
                                   3603 ;-----------------------
                                   3604 ; restore previously saved 
                                   3605 ; BASIC interpreter context 
                                   3606 ; from cstack 
                                   3607 ;-------------------------
      0014FC                       3608 rest_context:
      0093D2 5F C6            [ 2] 3609 	ldw x,(BPTR,sp)
      0093D4 00 0B 14         [ 2] 3610 	ldw basicptr,x 
      0093D7 01 4D            [ 2] 3611 	ldw x,(LNO,sp)
      0093D9 27 01 5C         [ 2] 3612 	ldw lineno,x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0093DC 7B 07            [ 1] 3613 	ld a,(IN,sp)
      0093DC 72 CF 00         [ 1] 3614 	ld in,a
      0093DF 1B 08            [ 1] 3615 	ld a,(CNT,sp)
      0093E0 C7 00 02         [ 1] 3616 	ld count,a  
      0093E0 A6               [ 4] 3617 	ret
                                   3618 
                                   3619 ;------------------------------------------
                                   3620 ; BASIC: INPUT [string],var[,[string],var]
                                   3621 ; input value in variables 
                                   3622 ; [string] optionally can be used as prompt 
                                   3623 ;-----------------------------------------
                           000001  3624 	CX_BPTR=1
                           000003  3625 	CX_LNO=3
                           000004  3626 	CX_IN=4
                           000005  3627 	CX_CNT=5
                           000006  3628 	SKIP=6
                           000007  3629 	VSIZE=7
      001511                       3630 input_var:
      0093E1 0A 00 00 25 05   [ 2] 3631 	btjt flags,#FRUN,1$ 
      0093E2 A6 06            [ 1] 3632 	ld a,#ERR_RUN_ONLY 
      0093E2 5B 01 81         [ 2] 3633 	jp tb_error 
      0093E5                       3634 1$:	_vars VSIZE 
      0093E5 35 10            [ 2]    1     sub sp,#VSIZE 
      00151D                       3635 input_loop:
      0093E7 00 08            [ 1] 3636 	clr (SKIP,sp)
      0093E9 81 0C 58         [ 4] 3637 	call get_token 
      0093EA A1 00            [ 1] 3638 	cp a,#TK_NONE 
      0093EA 35 0A            [ 1] 3639 	jreq input_exit 
      0093EC 00 08            [ 1] 3640 	cp a,#TK_QSTR 
      0093EE 81 0B            [ 1] 3641 	jrne 1$ 
      0093EF CD 0F 2D         [ 4] 3642 	call dpop
      0093EF AE 16 C8         [ 4] 3643 	call puts 
      0093F2 72 B0            [ 1] 3644 	cpl (SKIP,sp)
      0093F4 00 1F CD         [ 4] 3645 	call get_token 
      0093F7 8F A0            [ 1] 3646 1$: cp a,#TK_VAR  
      0093F9 A6 0A            [ 1] 3647 	jreq 2$ 
      0093FB 81 06 91         [ 2] 3648 	jp syntax_error
      0093FC                       3649 2$:	
      0093FC AE 16            [ 1] 3650 	tnz (SKIP,sp)
      0093FE C8 72            [ 1] 3651 	jrne 21$ 
      009400 B0 00            [ 1] 3652 	ld a,#':
      009402 1F 54 CF         [ 1] 3653 	ld pad+1,a 
      009405 00 24 CD 8F      [ 1] 3654 	clr pad+2
      009409 A0 A6 0A         [ 2] 3655 	ldw x,#pad 
      00940C 81 02 30         [ 4] 3656 	call puts   
      00940D                       3657 21$:
      00940D CD 8C D8         [ 4] 3658 	call save_context 
      009410 A1 01 27         [ 2] 3659 	ldw x,#tib 
      009413 03 CC 87         [ 2] 3660 	ldw basicptr,x  
      009416 11 5F 00 02      [ 1] 3661 	clr count  
      009417 CD 09 AF         [ 4] 3662 	call readln 
      009417 CD 8C D8 A1      [ 1] 3663 	clr in 
      00941B 32 27 03         [ 4] 3664 	call relation 
      00941E CC 87            [ 1] 3665 	cp a,#TK_INTGR
      009420 11 CD            [ 1] 3666 	jreq 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009422 8F D4 CD         [ 2] 3667 	jp syntax_error
      00156D                       3668 3$: 
      009425 93 8F A1         [ 4] 3669 	call store 
      009428 0A 27 03         [ 4] 3670 	call rest_context
      00942B CC 87 11 11      [ 1] 3671 	clr untok 
      00942E CD 0C 58         [ 4] 3672 	call get_token 
      00942E CD 90            [ 1] 3673 	cp a,#TK_COMMA 
      009430 07 A6            [ 1] 3674 	jrne 4$
      009432 00 81            [ 2] 3675 	jra input_loop 
      009434 CD 0F B0         [ 4] 3676 4$:	call unget_token 
      001583                       3677 input_exit:
      001583                       3678 	_drop VSIZE 
      009434 52 06            [ 2]    1     addw sp,#VSIZE 
      009436 CE               [ 1] 3679 	clr a 
      009437 00               [ 4] 3680 	ret 
                                   3681 
                                   3682 
                                   3683 ;---------------------
                                   3684 ; BASIC: REMARK | ' 
                                   3685 ; begin a comment 
                                   3686 ; comment are ignored 
                                   3687 ; use ' insted of REM 
                                   3688 ; it is faster 
                                   3689 ;---------------------- 
      001587                       3690 rem: 
      009438 1D               [ 4] 3691 	ret 
                                   3692 
                                   3693 
                                   3694 ;---------------------
                                   3695 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3696 ; read in loop 'addr'  
                                   3697 ; apply & 'mask' to value 
                                   3698 ; loop while result==0.  
                                   3699 ; if 'xor_mask' given 
                                   3700 ; apply ^ in second  
                                   3701 ; loop while result==0 
                                   3702 ;---------------------
                           000001  3703 	XMASK=1 
                           000002  3704 	MASK=2
                           000003  3705 	ADDR=3
                           000004  3706 	VSIZE=4
      001588                       3707 wait: 
      001588                       3708 	_vars VSIZE
      009439 C3 00            [ 2]    1     sub sp,#VSIZE 
      00943B 1F 2B            [ 1] 3709 	clr (XMASK,sp) 
      00943D 03 CC 94         [ 4] 3710 	call arg_list 
      009440 B7 1F            [ 1] 3711 	cp a,#2
      009442 05 FE            [ 1] 3712 	jruge 0$
      009444 1F 01 AE         [ 2] 3713 	jp syntax_error 
      009447 7F FF            [ 1] 3714 0$:	cp a,#3
      009449 1F 03            [ 1] 3715 	jrult 1$
      00944B CD 92 17         [ 4] 3716 	call dpop 
      00944E 4D               [ 1] 3717 	ld a,xl
      00944F 27 3F            [ 1] 3718 	ld (XMASK,sp),a 
      009451 A1 02 27         [ 4] 3719 1$: call dpop ; mask 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009454 07               [ 1] 3720 	ld a,xl 
      009455 A1 01            [ 1] 3721 	ld (MASK,sp),a 
      009457 27 06 CC         [ 4] 3722 	call dpop ; address 
      00945A 87               [ 1] 3723 2$:	ld a,(x)
      00945B 11 CD            [ 1] 3724 	and a,(MASK,sp)
      00945D 8F BA            [ 1] 3725 	xor a,(XMASK,sp)
      00945F 27 F9            [ 1] 3726 	jreq 2$ 
      0015B0                       3727 	_drop VSIZE 
      00945F CD 8F            [ 2]    1     addw sp,#VSIZE 
      009461 AD               [ 1] 3728 	clr a 
      009462 1F               [ 4] 3729 	ret 
                                   3730 
                                   3731 ;---------------------
                                   3732 ; BASIC: BSET addr,mask
                                   3733 ; set bits at 'addr' corresponding 
                                   3734 ; to those of 'mask' that are at 1.
                                   3735 ; arguments:
                                   3736 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3737 ;   mask        mask|addr
                                   3738 ; output:
                                   3739 ;	none 
                                   3740 ;--------------------------
      0015B4                       3741 bit_set:
      009463 01 A1 01         [ 4] 3742 	call arg_list 
      009466 27 05            [ 1] 3743 	cp a,#2	 
      009468 27 03            [ 1] 3744 	jreq 1$ 
      009468 CD 8F AD         [ 2] 3745 	jp syntax_error
      00946B 1F 03 2D         [ 4] 3746 1$: call dpop ; mask 
      00946D 9F               [ 1] 3747 	ld a,xl 
      00946D CE 00 1D         [ 4] 3748 	call dpop ; addr  
      009470 1F               [ 1] 3749 	or a,(x)
      009471 05               [ 1] 3750 	ld (x),a 
      009472 C3               [ 1] 3751 	clr a
      009473 00               [ 4] 3752 	ret 
                                   3753 
                                   3754 ;---------------------
                                   3755 ; BASIC: BRES addr,mask
                                   3756 ; reset bits at 'addr' corresponding 
                                   3757 ; to those of 'mask' that are at 1.
                                   3758 ; arguments:
                                   3759 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3760 ;   mask	    ~mask&*addr  
                                   3761 ; output:
                                   3762 ;	none 
                                   3763 ;--------------------------
      0015C9                       3764 bit_reset:
      009474 1F 2A 40         [ 4] 3765 	call arg_list 
      009477 FE 13            [ 1] 3766 	cp a,#2  
      009479 01 2A            [ 1] 3767 	jreq 1$ 
      00947B 14 1E 05         [ 2] 3768 	jp syntax_error
      0015D3                       3769 1$: 
      00947E 1C 00 02         [ 4] 3770 	call dpop ; mask 
      009481 F6               [ 1] 3771 	ld a,xl 
      009482 5C               [ 1] 3772 	cpl a 
      009483 C7 00 0B         [ 4] 3773 	call dpop ; addr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      009486 72               [ 1] 3774 	and a,(x)
      009487 5F               [ 1] 3775 	ld (x),a 
      009488 00               [ 1] 3776 	clr a 
      009489 0A               [ 4] 3777 	ret 
                                   3778 
                                   3779 ;---------------------
                                   3780 ; BASIC: BRES addr,mask
                                   3781 ; toggle bits at 'addr' corresponding 
                                   3782 ; to those of 'mask' that are at 1.
                                   3783 ; arguments:
                                   3784 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3785 ;   mask	    mask^*addr  
                                   3786 ; output:
                                   3787 ;	none 
                                   3788 ;--------------------------
      0015DF                       3789 bit_toggle:
      00948A 72 BB 00         [ 4] 3790 	call arg_list 
      00948D 0A 20            [ 1] 3791 	cp a,#2 
      00948F E0 03            [ 1] 3792 	jreq 1$ 
      009490 CC 06 91         [ 2] 3793 	jp syntax_error
      009490 1E 05 2D         [ 4] 3794 1$: call dpop ; mask 
      009492 9F               [ 1] 3795 	ld a,xl 
      009492 CD 94 CC         [ 4] 3796 	call dpop ; addr  
      009495 1E               [ 1] 3797 	xor a,(x)
      009496 05               [ 1] 3798 	ld (x),a 
      009497 1C               [ 1] 3799 	clr a
      009498 00               [ 4] 3800 	ret 
                                   3801 
                                   3802 
                                   3803 ;--------------------
                                   3804 ; BASIC: POKE addr,byte
                                   3805 ; put a byte at addr 
                                   3806 ;--------------------
      0015F4                       3807 poke:
      009499 02 F6 5C         [ 4] 3808 	call arg_list 
      00949C C7 00            [ 1] 3809 	cp a,#2
      00949E 0B 72            [ 1] 3810 	jreq 1$
      0094A0 5F 00 0A         [ 2] 3811 	jp syntax_error
      0015FE                       3812 1$:	
      0094A3 72 BB 00         [ 4] 3813 	call dpop 
      0094A6 0A               [ 1] 3814     ld a,xl 
      0094A7 C3 00 1F         [ 4] 3815 	call dpop 
      0094AA 2A               [ 1] 3816 	ld (x),a 
      0094AB 0B               [ 1] 3817 	clr a 
      0094AC 1F               [ 4] 3818 	ret 
                                   3819 
                                   3820 ;-----------------------
                                   3821 ; BASIC: PEEK(addr)
                                   3822 ; get the byte at addr 
                                   3823 ; input:
                                   3824 ;	none 
                                   3825 ; output:
                                   3826 ;	X 		value 
                                   3827 ;-----------------------
      001608                       3828 peek:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0094AD 05 FE            [ 1] 3829 	ld a,#TK_LPAREN 
      0094AF 13 03 2C         [ 4] 3830 	call expect 
      0094B2 04 1E 05         [ 4] 3831 	call ddrop 
      0094B5 20 DB 97         [ 4] 3832 	call arg_list
      0094B7 A1 01            [ 1] 3833 	cp a,#1 
      0094B7 5B 06            [ 1] 3834 	jreq 1$
      0094B9 4F 81 4E         [ 2] 3835 	jp syntax_error
      0094BC 6F 74            [ 1] 3836 1$:	ld a,#TK_RPAREN 
      0094BE 68 69 6E         [ 4] 3837 	call expect 
      0094C1 67 20 74         [ 4] 3838 	call ddrop  
      0094C4 6F 20 6C         [ 4] 3839 	call dpop 
      0094C7 69               [ 1] 3840 	ld a,(x)
      0094C8 73               [ 1] 3841 	clrw x 
      0094C9 74               [ 1] 3842 	ld xl,a 
      0094CA 0A 00 20         [ 4] 3843 	call dpush 
      0094CC A6 0A            [ 1] 3844 	ld a,#TK_INTGR
      0094CC 89               [ 4] 3845 	ret 
                                   3846 
      00162E                       3847 if: 
      0094CD FE CF 00         [ 4] 3848 	call relation 
      0094D0 0A 72            [ 1] 3849 	cp a,#TK_INTGR
      0094D2 5F 00            [ 1] 3850 	jreq 1$ 
      0094D4 09 AE 00         [ 2] 3851 	jp syntax_error
      0094D7 05               [ 1] 3852 1$:	clr a 
      0094D8 A6 0A CD         [ 4] 3853 	call dpop 
      0094DB 89               [ 2] 3854 	tnzw x 
      0094DC 48 85            [ 1] 3855 	jrne 9$  
                                   3856 ;skip to next line
      0094DE 1C 00 03 CD 82   [ 1] 3857 	mov in,count
      0094E3 B0 A6 0D CD      [ 1] 3858 	clr untok 
      0094E7 82               [ 4] 3859 9$:	ret 
                                   3860 
                                   3861 ;------------------------
                                   3862 ; BASIC: FOR var=expr 
                                   3863 ; set variable to expression 
                                   3864 ; leave variable address 
                                   3865 ; on dstack and set
                                   3866 ; FFOR bit in 'flags'
                                   3867 ;-----------------
                           000001  3868 	RETL1=1
                           000003  3869 	INW=3
                           000005  3870 	BPTR=5
      001649                       3871 for: ; { -- var_addr }
      0094E8 9E 81            [ 1] 3872 	ld a,#TK_VAR 
      0094EA CD 11 8A         [ 4] 3873 	call expect
      0094EA 4B 00 5D         [ 4] 3874 	call ddup 
      0094EC CD 13 97         [ 4] 3875 	call let02 
      0094EC 0F 01 00 25      [ 1] 3876 	bset flags,#FFOR 
                                   3877 ; open space on cstack for BPTR and INW 
      0094EE 85               [ 2] 3878 	popw x ; call return address 
      001659                       3879 	_vars 4
      0094EE CD 93            [ 2]    1     sub sp,#4 
      0094F0 8F               [ 2] 3880 	pushw x  ; RETL1 
      0094F1 A1               [ 1] 3881 	clrw x 
      0094F2 0A 26            [ 2] 3882 	ldw (BPTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      0094F4 05 CD            [ 2] 3883 	ldw (INW,sp),x 
      0094F6 90 11 20         [ 4] 3884 	call get_token 
      0094F9 F2 06            [ 1] 3885 	cp a,#TK_CMD 
      0094FA 27 03            [ 1] 3886 	jreq 1$
      0094FA CD 8C D8         [ 2] 3887 	jp syntax_error
      00166B                       3888 1$:  
      0094FD A1 00 27         [ 4] 3889 	call dpop 
      009500 59 A1 07         [ 2] 3890 	cpw x,#to 
      009503 26 05            [ 1] 3891 	jreq to
      009505 C7 00 12         [ 2] 3892 	jp syntax_error 
                                   3893 
                                   3894 ;-----------------------------------
                                   3895 ; BASIC: TO expr 
                                   3896 ; second part of FOR loop initilization
                                   3897 ; leave limit on dstack and set 
                                   3898 ; FTO bit in 'flags'
                                   3899 ;-----------------------------------
      001676                       3900 to: ; { var_addr -- var_addr limit step }
      009508 20 50 A1 05 26   [ 2] 3901 	btjt flags,#FFOR,1$
      00950D 08 CD 8F         [ 2] 3902 	jp syntax_error
      009510 AD CD 82         [ 4] 3903 1$: call relation  
      009513 B0 20            [ 1] 3904 	cp a,#TK_INTGR 
      009515 D6 A1            [ 1] 3905 	jreq 2$ 
      009517 0B 26 09         [ 2] 3906 	jp syntax_error
      001688                       3907 2$: 
      00951A CD 8F AD         [ 4] 3908 	call get_token
      00951D 9F CD            [ 1] 3909 	cp a,#TK_NONE 
      00951F 82 9E            [ 1] 3910 	jreq 4$ 
      009521 20 C9            [ 1] 3911 	cp a,#TK_CMD
      009523 26 10            [ 1] 3912 	jrne 3$
      009523 A1 0C 26         [ 4] 3913 	call dpop 
      009526 08 CD 91         [ 2] 3914 	ldw tokval,x 
      009529 AE CD 90         [ 2] 3915 	cpw x,#step 
      00952C 11 20            [ 1] 3916 	jreq step
      00952E BD 00 11         [ 1] 3917 	ld untok,a 
      00952F 20 03            [ 2] 3918 	jra 4$ 
      00952F A1 08 26         [ 2] 3919 3$:	jp syntax_error  	 
      009532 08 CD 8F         [ 2] 3920 4$:	ldw x,#1   ; default step  
      009535 D4 03 01         [ 4] 3921 	call dpush ; save step on dstack 
      009538 CC 94            [ 2] 3922 	jra store_loop_addr 
                                   3923 
                                   3924 
                                   3925 ;----------------------------------
                                   3926 ; BASIC: STEP expr 
                                   3927 ; optional third par of FOR loop
                                   3928 ; initialization. 	
                                   3929 ;------------------------------------
      0016AE                       3930 step: ; {var limit -- var limit step}
      00953A EE 04 00 25 03   [ 2] 3931 	btjt flags,#FFOR,1$
      00953B CC 06 91         [ 2] 3932 	jp syntax_error
      00953B A1 09 26         [ 4] 3933 1$: call expression 
      00953E 18 CD            [ 1] 3934 	cp a,#TK_INTGR
      009540 8F D4            [ 1] 3935 	jreq store_loop_addr  
      009542 CD 8C D8         [ 2] 3936 	jp syntax_error
                                   3937 ; leave loop back entry point on cstack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3938 ; cstack is 2 call deep from interp_loop
      0016C0                       3939 store_loop_addr:
      009545 A1 0A 27         [ 2] 3940 	ldw x,basicptr  
      009548 03 CC            [ 2] 3941 	ldw (BPTR,sp),x 
      00954A 87 11 CD         [ 2] 3942 	ldw x,in.w 
      00954D 8F AD            [ 2] 3943 	ldw (INW,sp),x   
      00954F 9F A4 0F C7      [ 1] 3944 	bres flags,#FFOR 
      009553 00 27 20 95      [ 1] 3945 	inc loop_depth 
      009557 4F               [ 1] 3946 	clr a 
      009557 CD               [ 4] 3947 	ret 
                                   3948 
                                   3949 ;--------------------------------
                                   3950 ; BASIC: NEXT var 
                                   3951 ; FOR loop control 
                                   3952 ; increment variable with step 
                                   3953 ; and compare with limit 
                                   3954 ; loop if threshold not crossed.
                                   3955 ; else clean both stacks. 
                                   3956 ; and decrement 'loop_depth' 
                                   3957 ;--------------------------------
      0016D4                       3958 next: ; {var limit step -- [var limit step ] }
      009558 90 30 00 20      [ 1] 3959 	tnz loop_depth 
      00955A 26 03            [ 1] 3960 	jrne 1$ 
      00955A 0D 01 26         [ 2] 3961 	jp syntax_error 
      0016DD                       3962 1$: 
      00955D 05 A6            [ 1] 3963 	ld a,#TK_VAR 
      00955F 0D CD 82         [ 4] 3964 	call expect
                                   3965 ; check for good variable after NEXT 	 
      009562 9E 5B 01         [ 4] 3966 	call dpop 
      009565 4F 81            [ 1] 3967 	ldw y,x 
      009567 AE 00 04         [ 2] 3968 	ldw x,#4  
      009567 CE 00 04 1F      [ 4] 3969 	cpw y,([dstkptr],x) ; compare variables address 
      00956B 03 CE            [ 1] 3970 	jreq 2$  
      00956D 00 06 1F         [ 2] 3971 	jp syntax_error ; not the good one 
      0016F3                       3972 2$: ; increment variable 
      009570 05               [ 1] 3973 	ldw x,y
      009571 C6               [ 2] 3974 	ldw x,(x)  ; get var value 
      009572 00 02 6B         [ 2] 3975 	ldw acc16,x 
      009575 07 C6 00 03      [ 5] 3976 	ldw x,[dstkptr] ; step
      009579 6B 08 81 09      [ 2] 3977 	addw x,acc16 ; var+step 
      00957C 90 FF            [ 2] 3978 	ldw (y),x ; save var new value 
                                   3979 ; compare with limit 
      00957C 1E 03            [ 1] 3980 	ldw y,x 
      00957E CF 00 04 1E      [ 5] 3981 	ldw x,[dstkptr] ; step in x 
      009582 05               [ 2] 3982 	tnzw x  
      009583 CF 00            [ 1] 3983 	jrpl 4$ ; positive step 
                                   3984 ;negative step 
      009585 06 7B 07         [ 2] 3985 	ldw x,#2
      009588 C7 00 02 7B      [ 4] 3986 	cpw y,([dstkptr],x)
      00958C 08 C7            [ 1] 3987 	jrslt loop_done
      00958E 00 03            [ 2] 3988 	jra loop_back 
      001716                       3989 4$: ; positive step
      009590 81 00 02         [ 2] 3990 	ldw x,#2 
      009591 72 D3 00 1A      [ 4] 3991 	cpw y,([dstkptr],x)
      009591 72 00            [ 1] 3992 	jrsgt loop_done
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      00171F                       3993 loop_back:
      009593 00 26            [ 2] 3994 	ldw x,(BPTR,sp)
      009595 05 A6 06         [ 2] 3995 	ldw basicptr,x 
      009598 CC 87 13 52 07   [ 2] 3996 	btjf flags,#FRUN,1$ 
      00959D E6 02            [ 1] 3997 	ld a,(2,x)
      00959D 0F 06            [ 1] 3998 	add a,#2 
      00959F CD 8C D8         [ 1] 3999 	ld count,a
      0095A2 A1               [ 2] 4000 	ldw x,(x)
      0095A3 00 27 5D         [ 2] 4001 	ldw lineno,x
      0095A6 A1 05            [ 2] 4002 1$:	ldw x,(INW,sp)
      0095A8 26 0B CD         [ 2] 4003 	ldw in.w,x 
      0095AB 8F               [ 1] 4004 	clr a 
      0095AC AD               [ 4] 4005 	ret 
      00173B                       4006 loop_done:
                                   4007 	; remove var limit step on dstack 
      0095AD CD 82 B0         [ 2] 4008 	ldw x,dstkptr 
      0095B0 03 06 CD         [ 2] 4009 	addw x,#3*CELL_SIZE
      0095B3 8C D8 A1         [ 2] 4010 	ldw dstkptr,x 
                                   4011 	; remove 2 return address on cstack 
      0095B6 01               [ 2] 4012 	popw x
      001745                       4013 	_drop 4
      0095B7 27 03            [ 2]    1     addw sp,#4 
      0095B9 CC               [ 2] 4014 	pushw x 
      0095BA 87 11 00 20      [ 1] 4015 	dec loop_depth 
      0095BC 4F               [ 1] 4016 	clr a 
      0095BC 0D               [ 4] 4017 	ret 
                                   4018 
                                   4019 
                                   4020 ;------------------------
                                   4021 ; BASIC: GOTO lineno 
                                   4022 ; jump to lineno 
                                   4023 ; here cstack is 2 call deep from interp_loop 
                                   4024 ;------------------------
      00174E                       4025 goto:
      0095BD 06 26 0F A6 3A   [ 2] 4026 	btjt flags,#FRUN,0$ 
      0095C2 C7 17            [ 1] 4027 	ld a,#ERR_RUN_ONLY
      0095C4 19 72 5F         [ 2] 4028 	jp tb_error 
      0095C7 17               [ 4] 4029 	ret 
      0095C8 1A AE            [ 2] 4030 0$:	jra go_common
                                   4031 
                                   4032 ;--------------------
                                   4033 ; BASIC: GOSUB lineno
                                   4034 ; basic subroutine call
                                   4035 ; actual lineno and basicptr 
                                   4036 ; are saved on cstack
                                   4037 ; here cstack is 2 call deep from interp_loop 
                                   4038 ;--------------------
                           000003  4039 	GOS_RET=3
      00175B                       4040 gosub:
      0095CA 17 18 CD 82 B0   [ 2] 4041 	btjt flags,#FRUN,0$ 
      0095CF A6 06            [ 1] 4042 	ld a,#ERR_RUN_ONLY
      0095CF CD 95 67         [ 2] 4043 	jp tb_error 
      0095D2 AE               [ 4] 4044 	ret 
      0095D3 16               [ 2] 4045 0$:	popw x 
      0095D4 C8 CF            [ 2] 4046 	sub sp,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0095D6 00               [ 2] 4047 	pushw x 
      0095D7 04 72 5F         [ 2] 4048 	ldw x,basicptr
      0095DA 00 03            [ 1] 4049 	ld a,(2,x)
      0095DC CD 8A            [ 1] 4050 	add a,#3 
      0095DE 2F 72 5F         [ 1] 4051 	ld acc8,a 
      0095E1 00 02 CD 93      [ 1] 4052 	clr acc16 
      0095E5 8F A1 0A 27      [ 2] 4053 	addw x,acc16
      0095E9 03 CC            [ 2] 4054 	ldw (GOS_RET,sp),x 
      00177E                       4055 go_common: 
      0095EB 87 11 0F         [ 4] 4056 	call relation 
      0095ED A1 0A            [ 1] 4057 	cp a,#TK_INTGR
      0095ED CD 90            [ 1] 4058 	jreq 1$ 
      0095EF 07 CD 95         [ 2] 4059 	jp syntax_error
      0095F2 7C 72 5F         [ 4] 4060 1$: call dpop 
      0095F5 00 12 CD         [ 4] 4061 	call search_lineno  
      0095F8 8C               [ 2] 4062 	tnzw x 
      0095F9 D8 A1            [ 1] 4063 	jrne 2$ 
      0095FB 08 26            [ 1] 4064 	ld a,#ERR_NO_LINE 
      0095FD 02 20 9D         [ 2] 4065 	jp tb_error 
      001796                       4066 2$: 
      009600 CD 90 30         [ 2] 4067 	ldw basicptr,x 
      009603 E6 02            [ 1] 4068 	ld a,(2,x)
      009603 5B 07            [ 1] 4069 	add a,#3 
      009605 4F 81 02         [ 1] 4070 	ld count,a 
      009607 FE               [ 2] 4071 	ldw x,(x)
      009607 81 00 05         [ 2] 4072 	ldw lineno,x 
      009608 35 03 00 01      [ 1] 4073 	mov in,#3 
      009608 52               [ 4] 4074 	ret 
                                   4075 
                                   4076 ;------------------------
                                   4077 ; BASIC: RETURN 
                                   4078 ; exit from a subroutine 
                                   4079 ; cstack is 2 level deep from interp_loop 
                                   4080 ;------------------------
      0017A9                       4081 return:
      009609 04 0F 01 CD 92   [ 2] 4082 	btjt flags,#FRUN,0$ 
      00960E 17 A1            [ 1] 4083 	ld a,#ERR_RUN_ONLY
      009610 02 24 03         [ 2] 4084 	jp tb_error 
      0017B3                       4085 0$:	
      009613 CC 87            [ 2] 4086 	ldw x,(GOS_RET,sp) 
      009615 11 A1 03         [ 2] 4087 	ldw basicptr,x 
      009618 25 06            [ 1] 4088 	ld a,(2,x)
      00961A CD 8F            [ 1] 4089 	add a,#3 
      00961C AD 9F 6B         [ 1] 4090 	ld count,a 
      00961F 01 CD 8F AD      [ 1] 4091 	mov in,#3 
      009623 9F               [ 1] 4092 	clr a 
      009624 6B               [ 2] 4093 	popw x 
      0017C5                       4094 	_drop 2
      009625 02 CD            [ 2]    1     addw sp,#2 
      009627 8F               [ 2] 4095 	pushw x
      009628 AD               [ 4] 4096 	ret  
                                   4097 
                                   4098 
                                   4099 ;----------------------------------
                                   4100 ; BASIC: RUN
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4101 ; run BASIC program in RAM
                                   4102 ;----------------------------------- 
      0017C9                       4103 run: 
      009629 F6 14 02 18 01   [ 2] 4104 	btjf flags,#FRUN,0$  
      00962E 27               [ 1] 4105 	clr a 
      00962F F9               [ 4] 4106 	ret
      0017D0                       4107 0$: 
      009630 5B 04 4F         [ 2] 4108 	ldw x,txtbgn
      009633 81 00 1E         [ 2] 4109 	cpw x,txtend 
      009634 2B 02            [ 1] 4110 	jrmi 1$ 
      009634 CD               [ 1] 4111 	clr a 
      009635 92               [ 4] 4112 	ret 
      009636 17 A1 02         [ 4] 4113 1$: call ubound 
      0017DD                       4114 	_drop 2 
      009639 27 03            [ 2]    1     addw sp,#2 
      00963B CC 87 11         [ 2] 4115 	ldw x,txtbgn 
      00963E CD 8F AD         [ 2] 4116 	ldw basicptr,x 
      009641 9F CD            [ 1] 4117 	ld a,(2,x)
      009643 8F AD            [ 1] 4118 	add a,#2 ; consider that in start at 3  
      009645 FA F7 4F         [ 1] 4119 	ld count,a
      009648 81               [ 2] 4120 	ldw x,(x)
      009649 CF 00 05         [ 2] 4121 	ldw lineno,x
      009649 CD 92 17 A1      [ 1] 4122 	mov in,#3	
      00964D 02 27 03 CC      [ 1] 4123 	bset flags,#FRUN 
      009651 87 11 5F         [ 2] 4124 	jp interp_loop 
                                   4125 
                                   4126 
                                   4127 ;----------------------
                                   4128 ; BASIC: STOP 
                                   4129 ; stop running program
                                   4130 ;---------------------- 
      009653                       4131 stop: 
      009653 CD 8F AD 9F 43   [ 2] 4132 	btjt flags,#FRUN,0$  
      009658 CD               [ 1] 4133 	clr a 
      009659 8F               [ 4] 4134 	ret 
                                   4135 ; clean dstack and cstack 
      00965A AD F4 F7         [ 2] 4136 0$: ldw x,#STACK_EMPTY 
      00965D 4F               [ 1] 4137 	ldw sp,x 
      00965E 81 11 00 25      [ 1] 4138 	bres flags,#FRUN 
      00965F CC 06 F1         [ 2] 4139 	jp warm_start
                                   4140 
                                   4141 ;-----------------------
                                   4142 ; BASIC: NEW
                                   4143 ; from command line only 
                                   4144 ; free program memory
                                   4145 ; and clear variables 
                                   4146 ;------------------------
      00180D                       4147 new: 
      00965F CD 92 17 A1 02   [ 2] 4148 	btjf flags,#FRUN,0$ 
      009664 27               [ 1] 4149 	clr a 
      009665 03               [ 4] 4150 	ret 
      001814                       4151 0$:	
      009666 CC 87 11         [ 4] 4152 	call clear_basic 
      009669 CD               [ 1] 4153 	clr a 
      00966A 8F               [ 4] 4154 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4155 	 
                                   4156 ;--------------------
                                   4157 ; input:
                                   4158 ;   X     increment 
                                   4159 ; output:
                                   4160 ;   farptr  incremented 
                                   4161 ;---------------------
      001819                       4162 incr_farptr:
      00966B AD 9F CD 8F      [ 2] 4163 	addw x,farptr+1 
      00966F AD F8            [ 1] 4164 	jrnc 1$
      009671 F7 4F 81 14      [ 1] 4165 	inc farptr 
      009674 CF 00 15         [ 2] 4166 1$:	ldw farptr+1,x  
      009674 CD               [ 4] 4167 	ret 
                                   4168 
                                   4169 ;------------------------------
                                   4170 ; extended flash memory used as FLASH_DRIVE 
                                   4171 ; seek end of used flash drive   
                                   4172 ; starting at 0x10000 address.
                                   4173 ; 4 consecutives 0 bytes signal free space. 
                                   4174 ; input:
                                   4175 ;	none
                                   4176 ; output:
                                   4177 ;   ffree     free_addr| 0 if memory full.
                                   4178 ;------------------------------
      001827                       4179 seek_fdrive:
      009675 92 17            [ 1] 4180 	ld a,#1
      009677 A1 02 27         [ 1] 4181 	ld farptr,a 
      00967A 03               [ 1] 4182 	clrw x 
      00967B CC 87 11         [ 2] 4183 	ldw farptr+1,x 
      00967E                       4184 1$:
      00967E CD               [ 1] 4185 	clrw x 
      00967F 8F AD 9F CD      [ 5] 4186 	ldf a,([farptr],x) 
      009683 8F AD            [ 1] 4187 	jrne 2$
      009685 F7               [ 1] 4188 	incw x 
      009686 4F 81 00 14      [ 5] 4189 	ldf a,([farptr],x)
      009688 26 0E            [ 1] 4190 	jrne 2$ 
      009688 A6               [ 1] 4191 	incw x 
      009689 03 CD 92 0A      [ 5] 4192 	ldf a,([farptr],x)
      00968D CD 8F            [ 1] 4193 	jrne 2$ 
      00968F D4               [ 1] 4194 	incw x 
      009690 CD 92 17 A1      [ 5] 4195 	ldf a,([farptr],x)
      009694 01 27            [ 1] 4196 	jreq 4$ 
      00184C                       4197 2$: 
      009696 03 CC 87         [ 2] 4198 	addw x,#1
      009699 11 A6 04         [ 4] 4199 	call incr_farptr
      00969C CD 92 0A         [ 2] 4200 	ldw x,#0x27f 
      00969F CD 8F D4         [ 2] 4201 	cpw x,farptr
      0096A2 CD 8F            [ 1] 4202 	jrpl 1$
      0096A4 AD F6 5F 97      [ 1] 4203 	clr ffree 
      0096A8 CD 8F A0 A6      [ 1] 4204 	clr ffree+1 
      0096AC 0A 81 00 19      [ 1] 4205 	clr ffree+2 
      0096AE 72 5F 00 08      [ 1] 4206 	clr acc24 
      0096AE CD 93 8F A1      [ 1] 4207 	clr acc16
      0096B2 0A 27 03 CC      [ 1] 4208 	clr acc8 
      0096B6 87 11            [ 2] 4209 	jra 5$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      001874                       4210 4$: ; copy farptr to ffree	 
      0096B8 4F CD 8F         [ 2] 4211 	ldw x,farptr+1 
      0096BB AD 5D 26         [ 2] 4212 	cpw x,#fdrive 
      0096BE 09 55            [ 1] 4213 	jreq 41$
                                   4214 	; there is a file, last 0 of that file must be skipped.
      0096C0 00 03 00         [ 2] 4215 	ldw x,#1
      0096C3 02 72 5F         [ 4] 4216 	call incr_farptr
      001882                       4217 41$: 
      0096C6 00 12 81         [ 2] 4218 	ldw x,farptr 
      0096C9 C6 00 16         [ 1] 4219 	ld a,farptr+2 
      0096C9 A6 01 CD         [ 2] 4220 	ldw ffree,x 
      0096CC 92 0A CD         [ 1] 4221 	ld ffree+2,a  
      0096CF 8F DD CD         [ 2] 4222 	ldw acc24,x 
      0096D2 94 17 72         [ 1] 4223 	ld acc8,a 
      0096D5 14 00 26         [ 2] 4224 5$:	ldw x,ffree_msg 
      0096D8 85 52 04         [ 4] 4225 	call puts 
      0096DB 89               [ 1] 4226 	clrw x 
      0096DC 5F 1F            [ 1] 4227 	ld a,#16
      0096DE 05 1F 03         [ 4] 4228 	call prti24 
      0096E1 CD 8C            [ 1] 4229 	ld a,#CR 
      0096E3 D8 A1 06         [ 4] 4230 	call putc 
      0096E6 27               [ 4] 4231 	ret 
      0096E7 03 CC 87 11 65 20 66  4232 ffree_msg: .asciz "\nfree flash begin at: "
             6C 61 73 68 20 62 65
             67 69 6E 20 61 74 3A
             20 00
                                   4233 
                                   4234 ;-----------------------
                                   4235 ; compare file name 
                                   4236 ; with name pointed by Y  
                                   4237 ; input:
                                   4238 ;   farptr   file name 
                                   4239 ;   Y        target name 
                                   4240 ; output:
                                   4241 ;   farptr 	 at file_name
                                   4242 ;   X 		 farptr[x] point at size field  
                                   4243 ;   Carry    0|1 no match|match  
                                   4244 ;----------------------
      0096EB                       4245 cmp_name:
      0096EB CD               [ 1] 4246 	clrw x
      0096EC 8F AD A3 96      [ 5] 4247 1$:	ldf a,([farptr],x)
      0096F0 F6 27            [ 1] 4248 	cp a,(y)
      0096F2 03 CC            [ 1] 4249 	jrne 4$
      0096F4 87               [ 1] 4250 	tnz a 
      0096F5 11 12            [ 1] 4251 	jreq 9$ 
      0096F6 5C               [ 1] 4252     incw x 
      0096F6 72 04            [ 1] 4253 	incw y 
      0096F8 00 26            [ 2] 4254 	jra 1$
      0018CE                       4255 4$: ;no match 
      0096FA 03               [ 1] 4256 	tnz a 
      0096FB CC 87            [ 1] 4257 	jreq 5$
      0096FD 11               [ 1] 4258 	incw x 
      0096FE CD 93 8F A1      [ 5] 4259 	ldf a,([farptr],x)
      009702 0A 27            [ 2] 4260 	jra 4$  
      009704 03               [ 1] 4261 5$:	incw x ; farptr[x] point at 'size' field 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      009705 CC               [ 1] 4262 	rcf 
      009706 87               [ 4] 4263 	ret
      0018DB                       4264 9$: ; match  
      009707 11               [ 1] 4265 	incw x  ; farptr[x] at 'size' field 
      009708 99               [ 1] 4266 	scf 
      009708 CD               [ 4] 4267 	ret 
                                   4268 
                                   4269 ;-----------------------
                                   4270 ; search file in 
                                   4271 ; flash memory 
                                   4272 ; input:
                                   4273 ;   Y       file name  
                                   4274 ; output:
                                   4275 ;   farptr  addr at name|0
                                   4276 ;-----------------------
                           000001  4277 	FSIZE=1
                           000003  4278 	YSAVE=3
                           000004  4279 	VSIZE=4 
      0018DE                       4280 search_file: 
      0018DE                       4281 	_vars VSIZE
      009709 8C D8            [ 2]    1     sub sp,#VSIZE 
      00970B A1 00            [ 2] 4282 	ldw (YSAVE,sp),y  
      00970D 27               [ 1] 4283 	clrw x 
      00970E 17 A1 06         [ 2] 4284 	ldw farptr+1,x 
      009711 26 10 CD 8F      [ 1] 4285 	mov farptr,#1
      0018EA                       4286 1$:	
                                   4287 ; check if farptr is after any file 
                                   4288 ; if  0 then so.
      009715 AD CF 00 13      [ 5] 4289 	ldf a,[farptr]
      009719 A3 97            [ 1] 4290 	jreq 6$
      00971B 2E               [ 1] 4291 2$: clrw x 	
      00971C 27 10            [ 2] 4292 	ldw y,(YSAVE,sp) 
      00971E C7 00 12         [ 4] 4293 	call cmp_name
      009721 20 03            [ 1] 4294 	jrc 9$
      009723 CC 87 11 AE      [ 5] 4295 	ldf a,([farptr],x)
      009727 00 01            [ 1] 4296 	ld (FSIZE,sp),a 
      009729 CD               [ 1] 4297 	incw x 
      00972A 8F A0 20 12      [ 5] 4298 	ldf a,([farptr],x)
      00972E 6B 02            [ 1] 4299 	ld (FSIZE+1,sp),a 
      00972E 72               [ 1] 4300 	incw x 
      00972F 04 00 26         [ 2] 4301 	addw x,(FSIZE,sp) ; count to skip 
      009732 03 CC 87         [ 4] 4302 	call incr_farptr ; now at next file 'name_field'
      009735 11 CD 93         [ 2] 4303 	ldw x,#0x280
      009738 4E A1 0A         [ 2] 4304 	cpw x,farptr 
      00973B 27 03            [ 1] 4305 	jrpl 1$
      001914                       4306 6$: ; file not found 
      00973D CC 87 11 14      [ 1] 4307 	clr farptr
      009740 72 5F 00 15      [ 1] 4308 	clr farptr+1 
      009740 CE 00 04 1F      [ 1] 4309 	clr farptr+2 
      001920                       4310 	_drop VSIZE 
      009744 05 CE            [ 2]    1     addw sp,#VSIZE 
      009746 00               [ 1] 4311 	rcf
      009747 01               [ 4] 4312 	ret
      001924                       4313 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001924                       4314 	_drop VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009748 1F 03            [ 2]    1     addw sp,#VSIZE 
      00974A 72               [ 1] 4315 	scf 	
      00974B 15               [ 4] 4316 	ret
                                   4317 
                                   4318 ;--------------------------------
                                   4319 ; BASIC: SAVE "name" 
                                   4320 ; save text program in 
                                   4321 ; flash memory used as 
                                   4322 ;--------------------------------
      001928                       4323 save:
      00974C 00 26 72 5C 00   [ 2] 4324 	btjf flags,#FRUN,0$ 
      009751 21 4F            [ 1] 4325 	ld a,#ERR_CMD_ONLY 
      009753 81 06 93         [ 2] 4326 	jp tb_error
      009754                       4327 0$:	 
      009754 72 5D 00         [ 2] 4328 	ldw x,txtend 
      009757 21 26 03 CC      [ 2] 4329 	subw x,txtbgn
      00975B 87 11            [ 1] 4330 	jrne 10$
                                   4331 ; nothing to save 
      00975D 4F               [ 1] 4332 	clr a 
      00975D A6               [ 4] 4333 	ret 
      00193D                       4334 10$:	
      00975E 01 CD 92         [ 1] 4335 	ld a,ffree 
      009761 0A CD 8F         [ 1] 4336 	or a,ffree+1
      009764 AD 90 93         [ 1] 4337 	or a,ffree+2 
      009767 AE 00            [ 1] 4338 	jrne 1$
      009769 04 72            [ 1] 4339 	ld a,#ERR_MEM_FULL
      00976B D3 00 1B         [ 2] 4340 	jp tb_error 
      00976E 27 03 CC         [ 4] 4341 1$: call get_token	
      009771 87 11            [ 1] 4342 	cp a,#TK_QSTR
      009773 27 03            [ 1] 4343 	jreq 2$
      009773 93 FE CF         [ 2] 4344 	jp syntax_error
      001957                       4345 2$: ; check for existing file of that name 
      009776 00 0A 72 CE      [ 2] 4346 	ldw y,tokval ; file name pointer 
      00977A 00 1B 72         [ 4] 4347 	call search_file 
      00977D BB 00            [ 1] 4348 	jrnc 3$ 
      00977F 0A 90            [ 1] 4349 	ld a,#ERR_DUPLICATE 
      009781 FF 90 93         [ 2] 4350 	jp tb_error 
      001965                       4351 3$:	;** write file name to flash **
      009784 72 CE 00         [ 2] 4352 	ldw x,ffree 
      009787 1B 5D 2A         [ 1] 4353 	ld a,ffree+2 
      00978A 0B AE 00         [ 2] 4354 	ldw farptr,x 
      00978D 02 72 D3         [ 1] 4355 	ld farptr+2,a 
      009790 00 1B 2F         [ 2] 4356 	ldw x,tokval 
      009793 27 20 09         [ 4] 4357 	call strlen 
      009796 5C               [ 1] 4358 	incw  x
      009796 AE               [ 2] 4359 	pushw x 
      009797 00               [ 1] 4360 	clrw x   
      009798 02 72 D3 00      [ 2] 4361 	ldw y,tokval 
      00979C 1B 2C 1C         [ 4] 4362 	call write_block  
      00979F                       4363 	_drop 2 ; drop pushed X 
      00979F 1E 05            [ 2]    1     addw sp,#2 
                                   4364 ;** write file length after name **
      0097A1 CF 00 04         [ 2] 4365 	ldw x,txtend 
      0097A4 72 01 00 26      [ 2] 4366 	subw x,txtbgn
      0097A8 0B               [ 2] 4367 	pushw x ; file size 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0097A9 E6               [ 1] 4368 	clrw x 
      0097AA 02 AB            [ 1] 4369 	ld a,(1,sp)
      0097AC 02 C7 00         [ 4] 4370 	call write_byte 
      0097AF 03               [ 1] 4371 	incw x 
      0097B0 FE CF            [ 1] 4372 	ld a,(2,sp)
      0097B2 00 06 1E         [ 4] 4373 	call write_byte
      0097B5 03               [ 1] 4374 	incw x  
      0097B6 CF 00 01         [ 4] 4375 	call incr_farptr ; move farptr after SIZE field 
                                   4376 ;** write BASIC text **
                                   4377 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      0097B9 4F 81            [ 2] 4378 	ldw x,(1,sp)
      0097BB 89               [ 2] 4379 	pushw x 
      0097BB CE               [ 1] 4380 	clrw x 
      0097BC 00 1B 1C 00      [ 2] 4381 	ldw y,txtbgn  ; BASIC text to save 
      0097C0 06 CF 00         [ 4] 4382 	call write_block 
      0019A6                       4383 	_drop 2 ;  drop BSIZE argument
      0097C3 1B 85            [ 2]    1     addw sp,#2 
                                   4384 ; save farptr in ffree
      0097C5 5B 04 89         [ 2] 4385 	ldw x,farptr 
      0097C8 72 5A 00         [ 1] 4386 	ld a,farptr+2 
      0097CB 21 4F 81         [ 2] 4387 	ldw ffree,x 
      0097CE C7 00 19         [ 1] 4388 	ld ffree+2,a
                                   4389 ; write 4 zero bytes as a safe gard 
      0097CE 72               [ 1] 4390     clrw x 
      0097CF 00               [ 1] 4391 	clr a 
      0097D0 00 26 06         [ 4] 4392 	call write_byte 
      0097D3 A6               [ 1] 4393 	incw x 
      0097D4 06               [ 1] 4394 	clr a 
      0097D5 CC 87 13         [ 4] 4395 	call write_byte
      0097D8 81               [ 1] 4396 	incw x 
      0097D9 20               [ 1] 4397 	clr a 
      0097DA 23 01 5C         [ 4] 4398 	call write_byte
                                   4399 ; display saved size  
      0097DB 85               [ 2] 4400 	popw x ; first copy of BSIZE 
      0097DB 72 00            [ 1] 4401 	ld a,#TK_INTGR 
      0097DD 00               [ 4] 4402 	ret 
                                   4403 
                                   4404 
                                   4405 ;------------------------
                                   4406 ; BASIC: LOAD "file" 
                                   4407 ; load file to RAM 
                                   4408 ; for execution 
                                   4409 ;------------------------
      0019C7                       4410 load:
      0097DE 26 06 A6 06 CC   [ 2] 4411 	btjf flags,#FRUN,0$ 
      0097E3 87 13            [ 1] 4412 	jreq 0$ 
      0097E5 81 85            [ 1] 4413 	ld a,#ERR_CMD_ONLY 
      0097E7 52 02 89         [ 2] 4414 	jp tb_error 
      0019D3                       4415 0$:	
      0097EA CE 00 04         [ 4] 4416 	call get_token 
      0097ED E6 02            [ 1] 4417 	cp a,#TK_QSTR
      0097EF AB 03            [ 1] 4418 	jreq 1$
      0097F1 C7 00 0B         [ 2] 4419 	jp syntax_error 
      0019DD                       4420 1$:	
      0097F4 72 5F 00         [ 4] 4421 	call dpop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0097F7 0A 72            [ 1] 4422 	ldw y,x 
      0097F9 BB 00 0A         [ 4] 4423 	call search_file 
      0097FC 1F 03            [ 1] 4424 	jrc 2$ 
      0097FE A6 09            [ 1] 4425 	ld a,#ERR_NOT_FILE
      0097FE CD 93 8F         [ 2] 4426 	jp tb_error  
      0019EC                       4427 2$:	
      009801 A1 0A 27         [ 4] 4428 	call incr_farptr  
      009804 03 CC 87         [ 4] 4429 	call clear_basic  
      009807 11               [ 1] 4430 	clrw x
      009808 CD 8F AD CD      [ 5] 4431 	ldf a,([farptr],x)
      00980C 83 F5            [ 1] 4432 	ld yh,a 
      00980E 5D               [ 1] 4433 	incw x  
      00980F 26 05 A6 05      [ 5] 4434 	ldf a,([farptr],x)
      009813 CC               [ 1] 4435 	incw x 
      009814 87 13            [ 1] 4436 	ld yl,a 
      009816 72 B9 00 1C      [ 2] 4437 	addw y,txtbgn
      009816 CF 00 04 E6      [ 2] 4438 	ldw txtend,y
      00981A 02 AB 03 C7      [ 2] 4439 	ldw y,txtbgn
      001A0D                       4440 3$:	; load BASIC text 	
      00981E 00 03 FE CF      [ 5] 4441 	ldf a,([farptr],x)
      009822 00 06            [ 1] 4442 	ld (y),a 
      009824 35               [ 1] 4443 	incw x 
      009825 03 00            [ 1] 4444 	incw y 
      009827 02 81 00 1E      [ 2] 4445 	cpw y,txtend 
      009829 2B F1            [ 1] 4446 	jrmi 3$
                                   4447 ; return loaded size 	 
      009829 72 00 00         [ 2] 4448 	ldw x,txtend 
      00982C 26 05 A6 06      [ 2] 4449 	subw x,txtbgn
      009830 CC 87 13         [ 4] 4450 	call dpush 
      009833 CD 0F 91         [ 4] 4451 	call prt_tos 
      009833 1E               [ 1] 4452 	clr a  
      009834 03               [ 4] 4453 	ret 
                                   4454 
                                   4455 ;-----------------------------------
                                   4456 ; BASIC: FORGET ["file_name"] 
                                   4457 ; erase file_name and all others 
                                   4458 ; after it. 
                                   4459 ; without argument erase all files 
                                   4460 ;-----------------------------------
      001A2B                       4461 forget:
      009835 CF 00 04         [ 4] 4462 	call get_token 
      009838 E6 02            [ 1] 4463 	cp a,#TK_NONE 
      00983A AB 03            [ 1] 4464 	jreq 3$ 
      00983C C7 00            [ 1] 4465 	cp a,#TK_QSTR
      00983E 03 35            [ 1] 4466 	jreq 1$
      009840 03 00 02         [ 2] 4467 	jp syntax_error
      009843 4F 85 5B 02      [ 2] 4468 1$: ldw y,tokval 
      009847 89 81 DE         [ 4] 4469 	call search_file
      009849 25 05            [ 1] 4470 	jrc 2$
      009849 72 01            [ 1] 4471 	ld a,#ERR_NOT_FILE 
      00984B 00 26 02         [ 2] 4472 	jp tb_error 
      001A47                       4473 2$: 
      00984E 4F 81 14         [ 2] 4474 	ldw x,farptr
      009850 C6 00 16         [ 1] 4475 	ld a,farptr+2
      009850 CE 00            [ 2] 4476 	jra 4$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      001A4F                       4477 3$: ; forget all files 
      009852 1D C3 00         [ 2] 4478 	ldw x,#fdrive
      009855 1F               [ 1] 4479 	clr a 
      009856 2B               [ 1] 4480 	rrwa x 
      009857 02 4F 81         [ 2] 4481 	ldw farptr,x 
      00985A CD 93 FC         [ 1] 4482 	ld farptr+2,a 
      001A5A                       4483 4$:
      00985D 5B 02 CE         [ 2] 4484 	ldw ffree,x 
      009860 00 1D CF         [ 1] 4485 	ld ffree+2,a 
      009863 00               [ 1] 4486 5$:	clrw x 
      009864 04               [ 1] 4487 	clr a  
      009865 E6 02 AB         [ 4] 4488 	call write_byte 
      009868 02 C7 00         [ 2] 4489 	ldw x,#1 
      00986B 03 FE CF         [ 4] 4490 	call incr_farptr
      00986E 00 06 35         [ 1] 4491 	ld a,farptr
      009871 03 00 02         [ 1] 4492 	cp a,ffree 
      009874 72 10            [ 1] 4493 	jrmi 5$ 
      009876 00 26 CC         [ 2] 4494 	ldw x,farptr+1 
      009879 87 DF 18         [ 2] 4495 	cpw x,ffree+1
      00987B 2B E5            [ 1] 4496 	jrmi 5$
      00987B 72               [ 4] 4497 	ret 
                                   4498 
                                   4499 ;----------------------
                                   4500 ; BASIC: DIR 
                                   4501 ; list saved files 
                                   4502 ;----------------------
                           000001  4503 	COUNT=1 ; files counter 
                           000002  4504 	VSIZE=2 
      001A7C                       4505 directory:
      001A7C                       4506 	_vars VSIZE 
      00987C 00 00            [ 2]    1     sub sp,#VSIZE 
      00987E 26               [ 1] 4507 	clrw x 
      00987F 02 4F            [ 2] 4508 	ldw (COUNT,sp),x 
      009881 81 AE 17         [ 2] 4509 	ldw farptr+1,x 
      009884 FF 94 72 11      [ 1] 4510 	mov farptr,#1 
      001A88                       4511 dir_loop:
      009888 00               [ 1] 4512 	clrw x 
      009889 26 CC 87 71      [ 5] 4513 	ldf a,([farptr],x)
      00988D 27 3B            [ 1] 4514 	jreq 8$ 
      001A8F                       4515 1$: ;name loop 	
      00988D 72 01 00 26      [ 5] 4516 	ldf a,([farptr],x)
      009891 02 4F            [ 1] 4517 	jreq 2$ 
      009893 81 02 1E         [ 4] 4518 	call putc 
      009894 5C               [ 1] 4519 	incw x 
      009894 CD 85            [ 2] 4520 	jra 1$
      009896 EF               [ 1] 4521 2$: incw x ; skip ending 0. 
      009897 4F 81            [ 1] 4522 	ld a,#SPACE 
      009899 CD 02 1E         [ 4] 4523 	call putc 
                                   4524 ; get file size 	
      009899 72 BB 00 16      [ 5] 4525 	ldf a,([farptr],x)
      00989D 24 04            [ 1] 4526 	ld yh,a 
      00989F 72               [ 1] 4527 	incw x 
      0098A0 5C 00 15 CF      [ 5] 4528 	ldf a,([farptr],x)
      0098A4 00               [ 1] 4529 	incw x 
      0098A5 16 81            [ 1] 4530 	ld yl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      0098A7 90 89            [ 2] 4531 	pushw y 
      0098A7 A6 01 C7         [ 2] 4532 	addw x,(1,sp)
      0098AA 00 15 5F         [ 4] 4533 	call incr_farptr 
      0098AD CF               [ 2] 4534 	popw x ; file size 
      0098AE 00 16 20         [ 4] 4535 	call dpush 
      0098B0 CD 0F 91         [ 4] 4536 	call prt_tos 
      0098B0 5F 92            [ 1] 4537 	ld a,#CR 
      0098B2 AF 00 15         [ 4] 4538 	call putc
      0098B5 26 15            [ 2] 4539 	ldw x,(COUNT,sp)
      0098B7 5C               [ 1] 4540 	incw x
      0098B8 92 AF            [ 2] 4541 	ldw (COUNT,sp),x  
      0098BA 00 15            [ 2] 4542 	jra dir_loop 
      001ACA                       4543 8$:
      0098BC 26 0E            [ 2] 4544 	ldw x,(COUNT,sp)
      0098BE 5C 92 AF         [ 4] 4545 	call dpush 
      0098C1 00 15 26         [ 4] 4546 	call prt_tos
      0098C4 07 5C 92         [ 2] 4547 	ldw x,#file_count 
      0098C7 AF 00 15         [ 4] 4548 	call puts  
      001AD8                       4549 	_drop VSIZE 
      0098CA 27 28            [ 2]    1     addw sp,#VSIZE 
      0098CC 81               [ 4] 4550 	ret
      0098CC 1C 00 01 CD 98 99 AE  4551 file_count: .asciz " files\n"
             02
                                   4552 
                                   4553 ;---------------------
                                   4554 ; BASIC: WRITE expr1,expr2 
                                   4555 ; write byte to FLASH or EEPROM 
                                   4556 ; input:
                                   4557 ;   expr1  	is address 
                                   4558 ;   expr2   is byte to write
                                   4559 ; output:
                                   4560 ;   none 
                                   4561 ;---------------------
      001AE3                       4562 write:
      0098D4 7F C3 00 15      [ 1] 4563 	clr farptr ; expect 16 bits address 
      0098D8 2A D6 72         [ 4] 4564 	call arg_list  
      0098DB 5F 00            [ 1] 4565 	cp a,#2
      0098DD 18 72            [ 1] 4566 	jreq 1$
      0098DF 5F 00 19         [ 2] 4567 	jp syntax_error
      001AF1                       4568 1$:
      0098E2 72 5F 00         [ 4] 4569 	call dpop 
      0098E5 1A               [ 1] 4570 	ld a,xl 
      0098E6 72 5F 00         [ 4] 4571 	call dpop 
      0098E9 09 72 5F         [ 2] 4572 	ldw farptr+1,x 
      0098EC 00               [ 1] 4573 	clrw x 
      0098ED 0A 72 5F         [ 4] 4574 	call write_byte 
      0098F0 00               [ 4] 4575 	ret 
                                   4576 
                                   4577 
                                   4578 ;---------------------
                                   4579 ;BASIC: CHAR(expr)
                                   4580 ; évaluate expression 
                                   4581 ; and take the 7 least 
                                   4582 ; bits as ASCII character
                                   4583 ;---------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      001B00                       4584 char:
      0098F1 0B 20            [ 1] 4585 	ld a,#TK_LPAREN 
      0098F3 20 11 8A         [ 4] 4586 	call expect 
      0098F4 CD 13 0F         [ 4] 4587 	call relation 
      0098F4 CE 00            [ 1] 4588 	cp a,#TK_INTGR 
      0098F6 16 A3            [ 1] 4589 	jreq 1$
      0098F8 00 00 27         [ 2] 4590 	jp syntax_error
      001B0F                       4591 1$:	
      0098FB 06 AE            [ 1] 4592 	ld a,#TK_RPAREN 
      0098FD 00 01 CD         [ 4] 4593 	call expect
      009900 98 99 2D         [ 4] 4594 	call dpop 
      009902 9F               [ 1] 4595 	ld a,xl 
      009902 CE 00            [ 1] 4596 	and a,#0x7f 
      009904 15               [ 1] 4597 	ld xl,a
      009905 C6 00 17         [ 2] 4598 	ldw tokval,x  
      009908 CF 00            [ 1] 4599 	ld a,#TK_CHAR
      00990A 18               [ 4] 4600 	ret
                                   4601 
                                   4602 ;---------------------
                                   4603 ; BASIC: ASC(string|char)
                                   4604 ; extract first character 
                                   4605 ; of string argument 
                                   4606 ; return it as TK_INTGR 
                                   4607 ;---------------------
      001B21                       4608 ascii:
      00990B C7 00            [ 1] 4609 	ld a,#TK_LPAREN
      00990D 1A CF 00         [ 4] 4610 	call expect 
      009910 09 C7 00         [ 4] 4611 	call get_token 
      009913 0B CE            [ 1] 4612 	cp a,#TK_QSTR 
      009915 99 26            [ 1] 4613 	jreq 1$
      009917 CD 82            [ 1] 4614 	cp a,#TK_CHAR 
      009919 B0 5F            [ 1] 4615 	jreq 2$ 
      00991B A6 10 CD         [ 2] 4616 	jp syntax_error
      00991E 89 48 A6         [ 2] 4617 1$: ldw x,tokval 
      009921 0D               [ 1] 4618 	ld a,(x)
      009922 CD 82            [ 2] 4619 	jra 3$
      009924 9E 81 0A         [ 2] 4620 2$: ldw x,tokval
      009927 66               [ 1] 4621 	ld a,xl 
      009928 72               [ 1] 4622 3$:	clrw x 
      009929 65               [ 1] 4623 	ld xl,a 
      00992A 65 20 66         [ 4] 4624 	call dpush 
      00992D 6C 61            [ 1] 4625 	ld a,#TK_RPAREN 
      00992F 73 68 20         [ 4] 4626 	call expect 
      009932 62 65 67         [ 4] 4627 	call dpop  
      009935 69 6E 20         [ 2] 4628 	ldw tokval,x 
      009938 61 74            [ 1] 4629 	ld a,#TK_INTGR 
      00993A 3A               [ 4] 4630 	ret 
                                   4631 
                                   4632 ;---------------------
                                   4633 ;BASIC: KEY
                                   4634 ; wait for a character 
                                   4635 ; received from STDIN 
                                   4636 ; input:
                                   4637 ;	none 
                                   4638 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4639 ;	X 		ASCII character 
                                   4640 ;---------------------
      001B51                       4641 key:
      00993B 20 00 27         [ 4] 4642 	call getc 
      00993D 5F               [ 1] 4643 	clrw x 
      00993D 5F               [ 1] 4644 	ld xl,a 
      00993E 92 AF 00         [ 2] 4645 	ldw tokval,x 
      009941 15 90            [ 1] 4646 	ld a,#TK_INTGR
      009943 F1               [ 4] 4647 	ret
                                   4648 
                                   4649 ;----------------------
                                   4650 ; BASIC: QKEY
                                   4651 ; Return true if there 
                                   4652 ; is a character in 
                                   4653 ; waiting in STDIN 
                                   4654 ; input:
                                   4655 ;  none 
                                   4656 ; output:
                                   4657 ;   X 		0|1 
                                   4658 ;-----------------------
      001B5C                       4659 qkey: 
      009944 26               [ 1] 4660 	clrw x 
      009945 08 4D 27 12 5C   [ 2] 4661 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      00994A 90               [ 1] 4662 	incw x 
      00994B 5C 20            [ 1] 4663 9$: ld a,#TK_INTGR
      00994D F0               [ 4] 4664 	ret 
                                   4665 
                                   4666 ;---------------------
                                   4667 ; BASIC: GPIO(expr,reg)
                                   4668 ; return gpio address 
                                   4669 ; expr {0..8}
                                   4670 ; input:
                                   4671 ;   none 
                                   4672 ; output:
                                   4673 ;   X 		gpio register address
                                   4674 ;----------------------------
      00994E                       4675 gpio:
      00994E 4D 27            [ 1] 4676 	ld a,#TK_LPAREN 
      009950 07 5C 92         [ 4] 4677 	call expect 
      009953 AF 00 15         [ 4] 4678 	call arg_list
      009956 20 F6            [ 1] 4679 	cp a,#2
      009958 5C 98            [ 1] 4680 	jreq 1$
      00995A 81 06 91         [ 2] 4681 	jp syntax_error  
      00995B                       4682 1$:	
      00995B 5C 99            [ 1] 4683 	ld a,#TK_RPAREN 
      00995D 81 11 8A         [ 4] 4684 	call expect 
      00995E CD 0F 2D         [ 4] 4685 	call dpop
      00995E 52               [ 2] 4686 	pushw x 
      00995F 04 17 03         [ 4] 4687 	call dpop 
      009962 5F               [ 2] 4688 	tnzw x 
      009963 CF 00            [ 1] 4689 	jrmi bad_port
      009965 16 35 01         [ 2] 4690 	cpw x,#9
      009968 00 15            [ 1] 4691 	jrpl bad_port
      00996A A6 05            [ 1] 4692 	ld a,#5
      00996A 92               [ 4] 4693 	mul x,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      00996B BC 00 15         [ 2] 4694 	addw x,#GPIO_BASE 
      00996E 27 24 5F         [ 2] 4695 	addw x,(1,sp)
      001B92                       4696 	_drop 2 
      009971 16 03            [ 2]    1     addw sp,#2 
      009973 CD 99            [ 1] 4697 	ld a,#TK_INTGR
      009975 3D               [ 4] 4698 	ret
      001B97                       4699 bad_port:
      009976 25 2C            [ 1] 4700 	ld a,#ERR_BAD_VALUE
      009978 92 AF 00         [ 2] 4701 	jp tb_error
                                   4702 
                                   4703 ;----------------------
                                   4704 ; BASIC: ODR 
                                   4705 ; return offset of gpio
                                   4706 ; ODR register: 0
                                   4707 ; ---------------------
      001B9C                       4708 port_odr:
      00997B 15               [ 1] 4709 	clrw x 
      00997C 6B 01 5C         [ 2] 4710 	ldw tokval,x 
      00997F 92 AF            [ 1] 4711 	ld a,#TK_INTGR
      009981 00               [ 4] 4712 	ret
                                   4713 
                                   4714 ;----------------------
                                   4715 ; BASIC: IDR 
                                   4716 ; return offset of gpio
                                   4717 ; IDR register: 1
                                   4718 ; ---------------------
      001BA3                       4719 port_idr:
      009982 15 6B 02         [ 2] 4720 	ldw x,#1
      009985 5C 72 FB         [ 2] 4721 	ldw tokval,x 
      009988 01 CD            [ 1] 4722 	ld a,#TK_INTGR
      00998A 98               [ 4] 4723 	ret
                                   4724 
                                   4725 ;----------------------
                                   4726 ; BASIC: DDR 
                                   4727 ; return offset of gpio
                                   4728 ; DDR register: 2
                                   4729 ; ---------------------
      001BAC                       4730 port_ddr:
      00998B 99 AE 02         [ 2] 4731 	ldw x,#2
      00998E 80 C3 00         [ 2] 4732 	ldw tokval,x 
      009991 15 2A            [ 1] 4733 	ld a,#TK_INTGR
      009993 D6               [ 4] 4734 	ret
                                   4735 
                                   4736 ;----------------------
                                   4737 ; BASIC: CRL  
                                   4738 ; return offset of gpio
                                   4739 ; CR1 register: 3
                                   4740 ; ---------------------
      009994                       4741 port_cr1:
      009994 72 5F 00         [ 2] 4742 	ldw x,#3
      009997 15 72 5F         [ 2] 4743 	ldw tokval,x 
      00999A 00 16            [ 1] 4744 	ld a,#TK_INTGR
      00999C 72               [ 4] 4745 	ret
                                   4746 
                                   4747 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4748 ; BASIC: CRH  
                                   4749 ; return offset of gpio
                                   4750 ; CR2 register: 4
                                   4751 ; ---------------------
      001BBE                       4752 port_cr2:
      00999D 5F 00 17         [ 2] 4753 	ldw x,#4
      0099A0 5B 04 98         [ 2] 4754 	ldw tokval,x 
      0099A3 81 0A            [ 1] 4755 	ld a,#TK_INTGR
      0099A4 81               [ 4] 4756 	ret
                                   4757 
                                   4758 
                                   4759 ;---------------------
                                   4760 ;
                                   4761 ;---------------------
      001BC7                       4762 usr:
      0099A4 5B 04 99         [ 2] 4763 	ldw x,#USR 
      0099A7 81 02 3A         [ 4] 4764 	call prt_cstr 
      0099A8 81               [ 4] 4765 	ret 
                                   4766 
                                   4767 ;------------------------------
                                   4768 ; BASIC: BYE 
                                   4769 ; halt mcu in its lowest power mode 
                                   4770 ; wait for reset or external interrupt
                                   4771 ; do a cold start on wakeup.
                                   4772 ;------------------------------
      001BCE                       4773 bye:
      0099A8 72 01 00 26 05   [ 2] 4774 	btjf UART3_SR,#UART_SR_TC,.
      0099AD A6               [10] 4775 	halt
      0099AE 07 CC 87         [ 2] 4776 	jp cold_start  
                                   4777 
                                   4778 ;----------------------------------
                                   4779 ; BASIC: SLEEP 
                                   4780 ; halt mcu until reset or external
                                   4781 ; interrupt.
                                   4782 ; Resume progam after SLEEP command
                                   4783 ;----------------------------------
      001BD7                       4784 sleep:
      0099B1 13 0D 52 40 FB   [ 2] 4785 	btjf UART3_SR,#UART_SR_TC,.
      0099B2 72 16 00 25      [ 1] 4786 	bset flags,#FSLEEP
      0099B2 CE               [10] 4787 	halt 
      0099B3 00               [ 4] 4788 	ret 
                                   4789 
                                   4790 ;-------------------------------
                                   4791 ; BASIC: PAUSE expr 
                                   4792 ; suspend execution for n msec.
                                   4793 ; input:
                                   4794 ;	none
                                   4795 ; output:
                                   4796 ;	none 
                                   4797 ;------------------------------
      001BE2                       4798 pause:
      0099B4 1F 72 B0         [ 4] 4799 	call expression
      0099B7 00 1D            [ 1] 4800 	cp a,#TK_INTGR
      0099B9 26 02            [ 1] 4801 	jreq 0$
      0099BB 4F 81 91         [ 2] 4802 	jp syntax_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      0099BD CD 0F 2D         [ 4] 4803 0$: call dpop 	
      0099BD C6               [ 2] 4804 1$: tnzw x 
      0099BE 00 18            [ 1] 4805 	jreq 2$
      0099C0 CA               [10] 4806 	wfi 
      0099C1 00               [ 2] 4807 	decw x 
      0099C2 19 CA            [ 1] 4808 	jrne 1$
      0099C4 00               [ 1] 4809 2$:	clr a 
      0099C5 1A               [ 4] 4810 	ret 
                                   4811 
                                   4812 ;------------------------------
                                   4813 ; BASIC: TICKS
                                   4814 ; return msec ticks counter value 
                                   4815 ; input:
                                   4816 ; 	none 
                                   4817 ; output:
                                   4818 ;	X 		TK_INTGR
                                   4819 ;-------------------------------
      001BF8                       4820 get_ticks:
      0099C6 26 05 A6         [ 2] 4821 	ldw x,ticks 
      0099C9 01 CC            [ 1] 4822 	ld a,#TK_INTGR
      0099CB 87               [ 4] 4823 	ret 
                                   4824 
                                   4825 
                                   4826 
                                   4827 ;------------------------------
                                   4828 ; BASIC: ABS(expr)
                                   4829 ; return absolute value of expr.
                                   4830 ; input:
                                   4831 ;   none
                                   4832 ; output:
                                   4833 ;   X     	positive integer
                                   4834 ;-------------------------------
      001BFE                       4835 abs:
      0099CC 13 CD            [ 1] 4836 	ld a,#TK_LPAREN
      0099CE 8C D8 A1         [ 4] 4837 	call expect 
      0099D1 05 27 03         [ 4] 4838 	call arg_list
      0099D4 CC 87            [ 1] 4839 	cp a,#1 
      0099D6 11 03            [ 1] 4840 	jreq 0$ 
      0099D7 CC 06 91         [ 2] 4841 	jp syntax_error
      0099D7 90 CE            [ 1] 4842 0$: ld a,#TK_RPAREN 
      0099D9 00 13 CD         [ 4] 4843 	call expect 
      0099DC 99 5E 24         [ 4] 4844     call dpop 
      0099DF 05               [ 1] 4845 	ld a,xh 
      0099E0 A6 08            [ 1] 4846 	bcp a,#0x80 
      0099E2 CC 87            [ 1] 4847 	jreq 2$ 
      0099E4 13               [ 2] 4848 	negw x 
      0099E5 A6 0A            [ 1] 4849 2$: ld a,#TK_INTGR 
      0099E5 CE               [ 4] 4850 	ret 
                                   4851 
                                   4852 ;------------------------------
                                   4853 ; BASIC: RND(expr)
                                   4854 ; return random number 
                                   4855 ; between 1 and expr inclusive
                                   4856 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4857 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4858 ; 	none 
                                   4859 ; output:
                                   4860 ;	X 		random positive integer 
                                   4861 ;------------------------------
      001C1E                       4862 random:
      0099E6 00 18            [ 1] 4863 	ld a,#TK_LPAREN 
      0099E8 C6 00 1A         [ 4] 4864 	call expect 
      0099EB CF 00 15         [ 4] 4865 	call arg_list 
      0099EE C7 00            [ 1] 4866 	cp a,#1
      0099F0 17 CE            [ 1] 4867 	jreq 1$
      0099F2 00 13 CD         [ 2] 4868 	jp syntax_error
      0099F5 83 86            [ 1] 4869 1$: ld a,#TK_RPAREN
      0099F7 5C 89 5F         [ 4] 4870 	call expect 
      0099FA 90 CE 00         [ 4] 4871 	call dpop 
      0099FD 13               [ 2] 4872 	pushw x 
      0099FE CD               [ 1] 4873 	ld a,xh 
      0099FF 82 51            [ 1] 4874 	bcp a,#0x80 
      009A01 5B 02            [ 1] 4875 	jreq 2$
      009A03 CE 00            [ 1] 4876 	ld a,#ERR_BAD_VALUE
      009A05 1F 72 B0         [ 2] 4877 	jp tb_error
      001C40                       4878 2$: 
                                   4879 ; acc16=(x<<5)^x 
      009A08 00 1D 89         [ 2] 4880 	ldw x,seedx 
      009A0B 5F               [ 2] 4881 	sllw x 
      009A0C 7B               [ 2] 4882 	sllw x 
      009A0D 01               [ 2] 4883 	sllw x 
      009A0E CD               [ 2] 4884 	sllw x 
      009A0F 81               [ 2] 4885 	sllw x 
      009A10 DC               [ 1] 4886 	ld a,xh 
      009A11 5C 7B 02         [ 1] 4887 	xor a,seedx 
      009A14 CD 81 DC         [ 1] 4888 	ld acc16,a 
      009A17 5C               [ 1] 4889 	ld a,xl 
      009A18 CD 98 99         [ 1] 4890 	xor a,seedx+1 
      009A1B 1E 01 89         [ 1] 4891 	ld acc8,a 
                                   4892 ; seedx=seedy 
      009A1E 5F 90 CE         [ 2] 4893 	ldw x,seedy 
      009A21 00 1D CD         [ 2] 4894 	ldw seedx,x  
                                   4895 ; seedy=seedy^(seedy>>1)
      009A24 82 51            [ 2] 4896 	srlw y 
      009A26 5B 02            [ 1] 4897 	ld a,yh 
      009A28 CE 00 15         [ 1] 4898 	xor a,seedy 
      009A2B C6 00 17         [ 1] 4899 	ld seedy,a  
      009A2E CF 00            [ 1] 4900 	ld a,yl 
      009A30 18 C7 00         [ 1] 4901 	xor a,seedy+1 
      009A33 1A 5F 4F         [ 1] 4902 	ld seedy+1,a 
                                   4903 ; acc16>>3 
      009A36 CD 81 DC         [ 2] 4904 	ldw x,acc16 
      009A39 5C               [ 2] 4905 	srlw x 
      009A3A 4F               [ 2] 4906 	srlw x 
      009A3B CD               [ 2] 4907 	srlw x 
                                   4908 ; x=acc16^x 
      009A3C 81               [ 1] 4909 	ld a,xh 
      009A3D DC 5C 4F         [ 1] 4910 	xor a,acc16 
      009A40 CD               [ 1] 4911 	ld xh,a 
      009A41 81               [ 1] 4912 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009A42 DC 85 A6         [ 1] 4913 	xor a,acc8 
      009A45 0A               [ 1] 4914 	ld xl,a 
                                   4915 ; seedy=x^seedy 
      009A46 81 00 10         [ 1] 4916 	xor a,seedy+1
      009A47 97               [ 1] 4917 	ld xl,a 
      009A47 72               [ 1] 4918 	ld a,xh 
      009A48 01 00 26         [ 1] 4919 	xor a,seedy
      009A4B 07               [ 1] 4920 	ld xh,a 
      009A4C 27 05 A6         [ 2] 4921 	ldw seedy,x 
                                   4922 ; return seedy modulo expr + 1 
      009A4F 07 CC            [ 2] 4923 	popw y 
      009A51 87               [ 2] 4924 	divw x,y 
      009A52 13               [ 1] 4925 	ldw x,y 
      009A53 5C               [ 1] 4926 	incw x 
      009A53 CD 8C            [ 1] 4927 	ld a,#TK_INTGR
      009A55 D8               [ 4] 4928 	ret 
                                   4929 
                                   4930 ;*********************************
                                   4931 
                                   4932 ;------------------------------
                                   4933 ;      dictionary 
                                   4934 ; format:
                                   4935 ;   link   2 bytes 
                                   4936 ;   cmd_name 8 byte max 
                                   4937 ;   code_address 2 bytes 
                                   4938 ;------------------------------
                           000080  4939 	FFUNC=128 
                                   4940 	.macro _dict_entry len,name,cmd 
                                   4941 	.word LINK 
                                   4942 	LINK=.
                                   4943 name:
                                   4944 	.byte len 	
                                   4945 	.ascii "name"
                                   4946 	.word cmd 
                                   4947 	.endm 
                                   4948 
                           000000  4949 	LINK=0
      001C92                       4950 kword_end:
      001C92                       4951 	_dict_entry,3,BYE,bye 
      009A56 A1 05                    1 	.word LINK 
                           001C94     2 	LINK=.
      001C94                          3 BYE:
      009A58 27                       4 	.byte 3 	
      009A59 03 CC 87                 5 	.ascii "BYE"
      009A5C 11 CE                    6 	.word bye 
      009A5D                       4952 	_dict_entry,5,SLEEP,sleep 
      009A5D CD 8F                    1 	.word LINK 
                           001C9C     2 	LINK=.
      001C9C                          3 SLEEP:
      009A5F AD                       4 	.byte 5 	
      009A60 90 93 CD 99 5E           5 	.ascii "SLEEP"
      009A65 25 05                    6 	.word sleep 
      001CA4                       4953 	_dict_entry,6,FORGET,forget 
      009A67 A6 09                    1 	.word LINK 
                           001CA6     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      001CA6                          3 FORGET:
      009A69 CC                       4 	.byte 6 	
      009A6A 87 13 52 47 45 54        5 	.ascii "FORGET"
      009A6C 1A 2B                    6 	.word forget 
      001CAF                       4954 	_dict_entry,3,DIR,directory 
      009A6C CD 98                    1 	.word LINK 
                           001CB1     2 	LINK=.
      001CB1                          3 DIR:
      009A6E 99                       4 	.byte 3 	
      009A6F CD 85 EF                 5 	.ascii "DIR"
      009A72 5F 92                    6 	.word directory 
      001CB7                       4955 	_dict_entry,4,LOAD,load 
      009A74 AF 00                    1 	.word LINK 
                           001CB9     2 	LINK=.
      001CB9                          3 LOAD:
      009A76 15                       4 	.byte 4 	
      009A77 90 95 5C 92              5 	.ascii "LOAD"
      009A7B AF 00                    6 	.word load 
      001CC0                       4956 	_dict_entry,4,SAVE,save
      009A7D 15 5C                    1 	.word LINK 
                           001CC2     2 	LINK=.
      001CC2                          3 SAVE:
      009A7F 90                       4 	.byte 4 	
      009A80 97 72 B9 00              5 	.ascii "SAVE"
      009A84 1D 90                    6 	.word save 
      001CC9                       4957 	_dict_entry,5,WRITE,write  
      009A86 CF 00                    1 	.word LINK 
                           001CCB     2 	LINK=.
      001CCB                          3 WRITE:
      009A88 1F                       4 	.byte 5 	
      009A89 90 CE 00 1D 45           5 	.ascii "WRITE"
      009A8D 1A E3                    6 	.word write 
      001CD3                       4958 	_dict_entry,3,NEW,new
      009A8D 92 AF                    1 	.word LINK 
                           001CD5     2 	LINK=.
      001CD5                          3 NEW:
      009A8F 00                       4 	.byte 3 	
      009A90 15 90 F7                 5 	.ascii "NEW"
      009A93 5C 90                    6 	.word new 
      001CDB                       4959 	_dict_entry,4,STOP,stop 
      009A95 5C 90                    1 	.word LINK 
                           001CDD     2 	LINK=.
      001CDD                          3 STOP:
      009A97 C3                       4 	.byte 4 	
      009A98 00 1F 2B F1              5 	.ascii "STOP"
      009A9C CE 00                    6 	.word stop 
      001CE4                       4960     _dict_entry,4,SHOW,show 
      009A9E 1F 72                    1 	.word LINK 
                           001CE6     2 	LINK=.
      001CE6                          3 SHOW:
      009AA0 B0                       4 	.byte 4 	
      009AA1 00 1D CD 8F              5 	.ascii "SHOW"
      009AA5 A0 CD                    6 	.word show 
      001CED                       4961 	_dict_entry 3,RUN,run
      009AA7 90 11                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                           001CEF     2 	LINK=.
      001CEF                          3 RUN:
      009AA9 4F                       4 	.byte 3 	
      009AAA 81 55 4E                 5 	.ascii "RUN"
      009AAB 17 C9                    6 	.word run 
      001CF5                       4962 	_dict_entry 4,LIST,list
      009AAB CD 8C                    1 	.word LINK 
                           001CF7     2 	LINK=.
      001CF7                          3 LIST:
      009AAD D8                       4 	.byte 4 	
      009AAE A1 00 27 1D              5 	.ascii "LIST"
      009AB2 A1 05                    6 	.word list 
      001CFE                       4963 	_dict_entry,3,USR,usr
      009AB4 27 03                    1 	.word LINK 
                           001D00     2 	LINK=.
      001D00                          3 USR:
      009AB6 CC                       4 	.byte 3 	
      009AB7 87 11 90                 5 	.ascii "USR"
      009ABA CE 00                    6 	.word usr 
      001D06                       4964 	_dict_entry,3+FFUNC,ODR,port_odr
      009ABC 13 CD                    1 	.word LINK 
                           001D08     2 	LINK=.
      001D08                          3 ODR:
      009ABE 99                       4 	.byte 3+FFUNC 	
      009ABF 5E 25 05                 5 	.ascii "ODR"
      009AC2 A6 09                    6 	.word port_odr 
      001D0E                       4965 	_dict_entry,3+FFUNC,IDR,port_idr
      009AC4 CC 87                    1 	.word LINK 
                           001D10     2 	LINK=.
      001D10                          3 IDR:
      009AC6 13                       4 	.byte 3+FFUNC 	
      009AC7 49 44 52                 5 	.ascii "IDR"
      009AC7 CE 00                    6 	.word port_idr 
      001D16                       4966 	_dict_entry,3+FFUNC,DDR,port_ddr 
      009AC9 15 C6                    1 	.word LINK 
                           001D18     2 	LINK=.
      001D18                          3 DDR:
      009ACB 00                       4 	.byte 3+FFUNC 	
      009ACC 17 20 0B                 5 	.ascii "DDR"
      009ACF 1B AC                    6 	.word port_ddr 
      001D1E                       4967 	_dict_entry,3+FFUNC,CRL,port_cr1 
      009ACF AE 00                    1 	.word LINK 
                           001D20     2 	LINK=.
      001D20                          3 CRL:
      009AD1 00                       4 	.byte 3+FFUNC 	
      009AD2 4F 01 CF                 5 	.ascii "CRL"
      009AD5 00 15                    6 	.word port_cr1 
      001D26                       4968 	_dict_entry,3+FFUNC,CRH,port_cr2
      009AD7 C7 00                    1 	.word LINK 
                           001D28     2 	LINK=.
      001D28                          3 CRH:
      009AD9 17                       4 	.byte 3+FFUNC 	
      009ADA 43 52 48                 5 	.ascii "CRH"
      009ADA CF 00                    6 	.word port_cr2 
      001D2E                       4969 	_dict_entry,4+FFUNC,GPIO,gpio 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009ADC 18 C7                    1 	.word LINK 
                           001D30     2 	LINK=.
      001D30                          3 GPIO:
      009ADE 00                       4 	.byte 4+FFUNC 	
      009ADF 1A 5F 4F CD              5 	.ascii "GPIO"
      009AE3 81 DC                    6 	.word gpio 
      001D37                       4970 	_dict_entry,3+FFUNC,ASC,ascii  
      009AE5 AE 00                    1 	.word LINK 
                           001D39     2 	LINK=.
      001D39                          3 ASC:
      009AE7 01                       4 	.byte 3+FFUNC 	
      009AE8 CD 98 99                 5 	.ascii "ASC"
      009AEB C6 00                    6 	.word ascii 
      001D3F                       4971 	_dict_entry,4+FFUNC,CHAR,char
      009AED 15 C1                    1 	.word LINK 
                           001D41     2 	LINK=.
      001D41                          3 CHAR:
      009AEF 00                       4 	.byte 4+FFUNC 	
      009AF0 18 2B ED CE              5 	.ascii "CHAR"
      009AF4 00 16                    6 	.word char 
      001D48                       4972 	_dict_entry,4+FFUNC,QKEY,qkey  
      009AF6 C3 00                    1 	.word LINK 
                           001D4A     2 	LINK=.
      001D4A                          3 QKEY:
      009AF8 19                       4 	.byte 4+FFUNC 	
      009AF9 2B E5 81 59              5 	.ascii "QKEY"
      009AFC 1B 5C                    6 	.word qkey 
      001D51                       4973 	_dict_entry,3+FFUNC,KEY,key 
      009AFC 52 02                    1 	.word LINK 
                           001D53     2 	LINK=.
      001D53                          3 KEY:
      009AFE 5F                       4 	.byte 3+FFUNC 	
      009AFF 1F 01 CF                 5 	.ascii "KEY"
      009B02 00 16                    6 	.word key 
      001D59                       4974 	_dict_entry,4+FFUNC,SIZE,size
      009B04 35 01                    1 	.word LINK 
                           001D5B     2 	LINK=.
      001D5B                          3 SIZE:
      009B06 00                       4 	.byte 4+FFUNC 	
      009B07 15 49 5A 45              5 	.ascii "SIZE"
      009B08 13 6F                    6 	.word size 
      001D62                       4975 	_dict_entry,3,HEX,hex_base
      009B08 5F 92                    1 	.word LINK 
                           001D64     2 	LINK=.
      001D64                          3 HEX:
      009B0A AF                       4 	.byte 3 	
      009B0B 00 15 27                 5 	.ascii "HEX"
      009B0E 3B 65                    6 	.word hex_base 
      009B0F                       4976 	_dict_entry,3,DEC,dec_base
      009B0F 92 AF                    1 	.word LINK 
                           001D6C     2 	LINK=.
      001D6C                          3 DEC:
      009B11 00                       4 	.byte 3 	
      009B12 15 27 06                 5 	.ascii "DEC"
      009B15 CD 82                    6 	.word dec_base 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      001D72                       4977 	_dict_entry,5+FFUNC,TICKS,get_ticks
      009B17 9E 5C                    1 	.word LINK 
                           001D74     2 	LINK=.
      001D74                          3 TICKS:
      009B19 20                       4 	.byte 5+FFUNC 	
      009B1A F4 5C A6 20 CD           5 	.ascii "TICKS"
      009B1F 82 9E                    6 	.word get_ticks 
      001D7C                       4978 	_dict_entry,3+FFUNC,ABS,abs
      009B21 92 AF                    1 	.word LINK 
                           001D7E     2 	LINK=.
      001D7E                          3 ABS:
      009B23 00                       4 	.byte 3+FFUNC 	
      009B24 15 90 95                 5 	.ascii "ABS"
      009B27 5C 92                    6 	.word abs 
      001D84                       4979 	_dict_entry,3+FFUNC,RND,random 
      009B29 AF 00                    1 	.word LINK 
                           001D86     2 	LINK=.
      001D86                          3 RND:
      009B2B 15                       4 	.byte 3+FFUNC 	
      009B2C 5C 90 97                 5 	.ascii "RND"
      009B2F 90 89                    6 	.word random 
      001D8C                       4980 	_dict_entry,5,PAUSE,pause 
      009B31 72 FB                    1 	.word LINK 
                           001D8E     2 	LINK=.
      001D8E                          3 PAUSE:
      009B33 01                       4 	.byte 5 	
      009B34 CD 98 99 85 CD           5 	.ascii "PAUSE"
      009B39 8F A0                    6 	.word pause 
      001D96                       4981 	_dict_entry,4,BSET,bit_set 
      009B3B CD 90                    1 	.word LINK 
                           001D98     2 	LINK=.
      001D98                          3 BSET:
      009B3D 11                       4 	.byte 4 	
      009B3E A6 0D CD 82              5 	.ascii "BSET"
      009B42 9E 1E                    6 	.word bit_set 
      001D9F                       4982 	_dict_entry,4,BRES,bit_reset
      009B44 01 5C                    1 	.word LINK 
                           001DA1     2 	LINK=.
      001DA1                          3 BRES:
      009B46 1F                       4 	.byte 4 	
      009B47 01 20 BE 53              5 	.ascii "BRES"
      009B4A 15 C9                    6 	.word bit_reset 
      001DA8                       4983 	_dict_entry,5,BTOGL,bit_toggle
      009B4A 1E 01                    1 	.word LINK 
                           001DAA     2 	LINK=.
      001DAA                          3 BTOGL:
      009B4C CD                       4 	.byte 5 	
      009B4D 8F A0 CD 90 11           5 	.ascii "BTOGL"
      009B52 AE 9B                    6 	.word bit_toggle 
      001DB2                       4984 	_dict_entry 4,WAIT,wait 
      009B54 5B CD                    1 	.word LINK 
                           001DB4     2 	LINK=.
      001DB4                          3 WAIT:
      009B56 82                       4 	.byte 4 	
      009B57 B0 5B 02 81              5 	.ascii "WAIT"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009B5B 20 66                    6 	.word wait 
      001DBB                       4985 	_dict_entry 6,REMARK,rem 
      009B5D 69 6C                    1 	.word LINK 
                           001DBD     2 	LINK=.
      001DBD                          3 REMARK:
      009B5F 65                       4 	.byte 6 	
      009B60 73 0A 00 41 52 4B        5 	.ascii "REMARK"
      009B63 15 87                    6 	.word rem 
      001DC6                       4986 	_dict_entry 5,PRINT,print 
      009B63 72 5F                    1 	.word LINK 
                           001DC8     2 	LINK=.
      001DC8                          3 PRINT:
      009B65 00                       4 	.byte 5 	
      009B66 15 CD 92 17 A1           5 	.ascii "PRINT"
      009B6B 02 27                    6 	.word print 
      001DD0                       4987 	_dict_entry,2,IF,if 
      009B6D 03 CC                    1 	.word LINK 
                           001DD2     2 	LINK=.
      001DD2                          3 IF:
      009B6F 87                       4 	.byte 2 	
      009B70 11 46                    5 	.ascii "IF"
      009B71 16 2E                    6 	.word if 
      001DD7                       4988 	_dict_entry,5,GOSUB,gosub 
      009B71 CD 8F                    1 	.word LINK 
                           001DD9     2 	LINK=.
      001DD9                          3 GOSUB:
      009B73 AD                       4 	.byte 5 	
      009B74 9F CD 8F AD CF           5 	.ascii "GOSUB"
      009B79 00 16                    6 	.word gosub 
      001DE1                       4989 	_dict_entry,4,GOTO,goto 
      009B7B 5F CD                    1 	.word LINK 
                           001DE3     2 	LINK=.
      001DE3                          3 GOTO:
      009B7D 81                       4 	.byte 4 	
      009B7E DC 81 54 4F              5 	.ascii "GOTO"
      009B80 17 4E                    6 	.word goto 
      001DEA                       4990 	_dict_entry,3,FOR,for 
      009B80 A6 03                    1 	.word LINK 
                           001DEC     2 	LINK=.
      001DEC                          3 FOR:
      009B82 CD                       4 	.byte 3 	
      009B83 92 0A CD                 5 	.ascii "FOR"
      009B86 93 8F                    6 	.word for 
      001DF2                       4991 	_dict_entry,2,TO,to
      009B88 A1 0A                    1 	.word LINK 
                           001DF4     2 	LINK=.
      001DF4                          3 TO:
      009B8A 27                       4 	.byte 2 	
      009B8B 03 CC                    5 	.ascii "TO"
      009B8D 87 11                    6 	.word to 
      009B8F                       4992 	_dict_entry,4,STEP,step 
      009B8F A6 04                    1 	.word LINK 
                           001DFB     2 	LINK=.
      001DFB                          3 STEP:
      009B91 CD                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009B92 92 0A CD 8F              5 	.ascii "STEP"
      009B96 AD 9F                    6 	.word step 
      001E02                       4993 	_dict_entry,4,NEXT,next 
      009B98 A4 7F                    1 	.word LINK 
                           001E04     2 	LINK=.
      001E04                          3 NEXT:
      009B9A 97                       4 	.byte 4 	
      009B9B CF 00 13 A6              5 	.ascii "NEXT"
      009B9F 0B 81                    6 	.word next 
      009BA1                       4994 	_dict_entry,6+FFUNC,UBOUND,ubound 
      009BA1 A6 03                    1 	.word LINK 
                           001E0D     2 	LINK=.
      001E0D                          3 UBOUND:
      009BA3 CD                       4 	.byte 6+FFUNC 	
      009BA4 92 0A CD 8C D8 A1        5 	.ascii "UBOUND"
      009BAA 05 27                    6 	.word ubound 
      001E16                       4995 	_dict_entry,6,RETURN,return 
      009BAC 07 A1                    1 	.word LINK 
                           001E18     2 	LINK=.
      001E18                          3 RETURN:
      009BAE 0B                       4 	.byte 6 	
      009BAF 27 09 CC 87 11 CE        5 	.ascii "RETURN"
      009BB5 00 13                    6 	.word return 
      001E21                       4996 	_dict_entry,4+FFUNC,PEEK,peek 
      009BB7 F6 20                    1 	.word LINK 
                           001E23     2 	LINK=.
      001E23                          3 PEEK:
      009BB9 04                       4 	.byte 4+FFUNC 	
      009BBA CE 00 13 9F              5 	.ascii "PEEK"
      009BBE 5F 97                    6 	.word peek 
      001E2A                       4997 	_dict_entry,4,POKE,poke 
      009BC0 CD 8F                    1 	.word LINK 
                           001E2C     2 	LINK=.
      001E2C                          3 POKE:
      009BC2 A0                       4 	.byte 4 	
      009BC3 A6 04 CD 92              5 	.ascii "POKE"
      009BC7 0A CD                    6 	.word poke 
      001E33                       4998 	_dict_entry,5,INPUT,input_var  
      009BC9 8F AD                    1 	.word LINK 
                           001E35     2 	LINK=.
      001E35                          3 INPUT:
      009BCB CF                       4 	.byte 5 	
      009BCC 00 13 A6 0A 81           5 	.ascii "INPUT"
      009BD1 15 11                    6 	.word input_var 
      001E3D                       4999 kword_dict:
      001E3D                       5000 	_dict_entry 3,LET,let 
      009BD1 CD 82                    1 	.word LINK 
                           001E3F     2 	LINK=.
      001E3F                          3 LET:
      009BD3 A7                       4 	.byte 3 	
      009BD4 5F 97 CF                 5 	.ascii "LET"
      009BD7 00 13                    6 	.word let 
                                   5001 	
                                   5002 
      001E80                       5003 	.bndry 128 ; align on FLASH block.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



                                   5004 ; free space for user application  
      001E80                       5005 user_space:
                                   5006 
                                   5007 	.area FLASH_DRIVE (ABS)
      010000                       5008 	.org 0x10000
      010000                       5009 fdrive:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        001D7E R   |     ADC_CR1 =  005401 
    ADC_CR1_=  000000     |     ADC_CR1_=  000001     |     ADC_CR1_=  000004 
    ADC_CR1_=  000005     |     ADC_CR1_=  000006     |     ADC_CR2 =  005402 
    ADC_CR2_=  000003     |     ADC_CR2_=  000004     |     ADC_CR2_=  000005 
    ADC_CR2_=  000006     |     ADC_CR2_=  000001     |     ADC_CR3 =  005403 
    ADC_CR3_=  000007     |     ADC_CR3_=  000006     |     ADC_CSR =  005400 
    ADC_CSR_=  000006     |     ADC_CSR_=  000004     |     ADC_CSR_=  000000 
    ADC_CSR_=  000001     |     ADC_CSR_=  000002     |     ADC_CSR_=  000003 
    ADC_CSR_=  000007     |     ADC_CSR_=  000005     |     ADC_DRH =  005404 
    ADC_DRL =  005405     |     ADC_TDRH=  005406     |     ADC_TDRL=  005407 
    ADDR    =  000003     |     ADD_SPAC=  000003     |     AFR     =  004803 
    AFR0_ADC=  000000     |     AFR1_TIM=  000001     |     AFR2_CCO=  000002 
    AFR3_TIM=  000003     |     AFR4_TIM=  000004     |     AFR5_TIM=  000005 
    AFR6_I2C=  000006     |     AFR7_BEE=  000007     |     ARG_CNT =  000001 
    ARG_OFS =  000002     |   5 ASC        001D39 R   |     ATTRIB  =  000002 
    AWU_APR =  0050F1     |     AWU_CSR1=  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |     BEEP_BIT=  000004     |     BEEP_CSR=  0050F3 
    BEEP_MAS=  000010     |     BEEP_POR=  00000F     |     BELL    =  000007 
    BINARY  =  000001     |     BIT0    =  000000     |     BIT1    =  000001 
    BIT2    =  000002     |     BIT3    =  000003     |     BIT4    =  000004 
    BIT5    =  000005     |     BIT6    =  000006     |     BIT7    =  000007 
    BLOCK_SI=  000080     |     BOOT_ROM=  006000     |     BOOT_ROM=  007FFF 
    BPTR    =  000005     |   5 BRES       001DA1 R   |   5 BSET       001D98 R
    BSIZE   =  000005     |     BSP     =  000008     |   5 BTOGL      001DAA R
    BTW     =  000001     |   5 BYE        001C94 R   |     C       =  000001 
    CAN_DGR =  005426     |     CAN_FPSR=  005427     |     CAN_IER =  005425 
    CAN_MCR =  005420     |     CAN_MSR =  005421     |     CAN_P0  =  005428 
    CAN_P1  =  005429     |     CAN_P2  =  00542A     |     CAN_P3  =  00542B 
    CAN_P4  =  00542C     |     CAN_P5  =  00542D     |     CAN_P6  =  00542E 
    CAN_P7  =  00542F     |     CAN_P8  =  005430     |     CAN_P9  =  005431 
    CAN_PA  =  005432     |     CAN_PB  =  005433     |     CAN_PC  =  005434 
    CAN_PD  =  005435     |     CAN_PE  =  005436     |     CAN_PF  =  005437 
    CAN_RFR =  005424     |     CAN_TPR =  005423     |     CAN_TSR =  005422 
    CC_C    =  000000     |     CC_H    =  000004     |     CC_I0   =  000003 
    CC_I1   =  000005     |     CC_N    =  000002     |     CC_V    =  000007 
    CC_Z    =  000001     |     CELL_SIZ=  000002     |     CFG_GCR =  007F60 
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       001D41 R
    CLKOPT  =  004807     |     CLKOPT_C=  000002     |     CLKOPT_E=  000003 
    CLKOPT_P=  000000     |     CLKOPT_P=  000001     |     CLK_CCOR=  0050C9 
    CLK_CKDI=  0050C6     |     CLK_CKDI=  000000     |     CLK_CKDI=  000001 
    CLK_CKDI=  000002     |     CLK_CKDI=  000003     |     CLK_CKDI=  000004 
    CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1 
    CLK_ECKR=  000000     |     CLK_ECKR=  000001     |     CLK_HSIT=  0050CC 
    CLK_ICKR=  0050C0     |     CLK_ICKR=  000002     |     CLK_ICKR=  000000 
    CLK_ICKR=  000001     |     CLK_ICKR=  000003     |     CLK_ICKR=  000004 
    CLK_ICKR=  000005     |     CLK_PCKE=  0050C7     |     CLK_PCKE=  000000 
    CLK_PCKE=  000001     |     CLK_PCKE=  000007     |     CLK_PCKE=  000005 
    CLK_PCKE=  000006     |     CLK_PCKE=  000004     |     CLK_PCKE=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]

Symbol Table

    CLK_PCKE=  000003     |     CLK_PCKE=  0050CA     |     CLK_PCKE=  000003 
    CLK_PCKE=  000002     |     CLK_PCKE=  000007     |     CLK_SWCR=  0050C5 
    CLK_SWCR=  000000     |     CLK_SWCR=  000001     |     CLK_SWCR=  000002 
    CLK_SWCR=  000003     |     CLK_SWIM=  0050CD     |     CLK_SWR =  0050C4 
    CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2 
    CNT     =  000008     |     COMMA   =  000001     |     COUNT   =  000001 
    CPU_A   =  007F00     |     CPU_CCR =  007F0A     |     CPU_PCE =  007F01 
    CPU_PCH =  007F02     |     CPU_PCL =  007F03     |     CPU_SPH =  007F08 
    CPU_SPL =  007F09     |     CPU_XH  =  007F04     |     CPU_XL  =  007F05 
    CPU_YH  =  007F06     |     CPU_YL  =  007F07     |     CR      =  00000D 
  5 CRH        001D28 R   |   5 CRL        001D20 R   |     CTRL_A  =  000001 
    CTRL_B  =  000002     |     CTRL_C  =  000003     |     CTRL_D  =  000004 
    CTRL_E  =  000005     |     CTRL_F  =  000006     |     CTRL_G  =  000007 
    CTRL_H  =  000008     |     CTRL_I  =  000009     |     CTRL_J  =  00000A 
    CTRL_K  =  00000B     |     CTRL_L  =  00000C     |     CTRL_M  =  00000D 
    CTRL_N  =  00000E     |     CTRL_O  =  00000F     |     CTRL_P  =  000010 
    CTRL_Q  =  000011     |     CTRL_R  =  000012     |     CTRL_S  =  000013 
    CTRL_T  =  000014     |     CTRL_U  =  000015     |     CTRL_V  =  000016 
    CTRL_W  =  000017     |     CTRL_X  =  000018     |     CTRL_Y  =  000019 
    CTRL_Z  =  00001A     |     CURR    =  000002     |     CX_BPTR =  000001 
    CX_CNT  =  000005     |     CX_IN   =  000004     |     CX_LNO  =  000003 
    DBG_A   =  000005     |     DBG_CC  =  000006     |     DBG_X   =  000003 
    DBG_Y   =  000001     |   5 DDR        001D18 R   |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   5 DEC        001D6C R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        001CB1 R   |     DIVISR  =  000003     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |     DSTACK_S=  000040     |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |     ERR_BAD_=  00000A 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_L=  000005 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FF      =  00000C 
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
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLSI    =  01F400 
  5 FOR        001DEC R   |   5 FORGET     001CA6 R   |     FRUN    =  000000 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FTRAP   =  000001 
  5 GOSUB      001DD9 R   |     GOS_RET =  000003     |   5 GOTO       001DE3 R
  5 GPIO       001D30 R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   5 HEX        001D64 R
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
    I2C_WRIT=  000000     |   5 IDR        001D10 R   |   5 IF         001DD2 R
    IN      =  000007     |     INCR    =  000001     |   5 INPUT      001E35 R
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
    ITC_SPR4=  007F73     |     ITC_SPR5=  007F74     |     ITC_SPR6=  007F75 
    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        001D53 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]

Symbol Table

    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  5 LET        001E3F R   |     LINENO  =  000005     |   5 LINK    =  001E3F R
  5 LIST       001CF7 R   |     LL      =  000002     |     LLEN    =  000007 
    LL_HB   =  000001     |     LNO     =  000005     |     LN_PTR  =  000005 
  5 LOAD       001CB9 R   |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MINOR   =  000000     |     MULOP   =  000001 
    N1_HB   =  000004     |     N1_LB   =  000005     |     N2_HB   =  000006 
    N2_LB   =  000007     |     NAFR    =  004804     |     NCLKOPT =  004808 
    NEG     =  000001     |   5 NEW        001CD5 R   |   5 NEXT       001E04 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NL      =  00000A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000009 R   |   5 ODR        001D08 R   |     OP      =  000001 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |     PAD_SIZE=  000028 
  5 PAUSE      001D8E R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   5 PEEK       001E23 R
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
    PI_ODR  =  005028     |   5 POKE       001E2C R   |     PREV    =  000001 
  5 PRINT      001DC8 R   |     PROD    =  000002     |     PSIZE   =  000001 
  5 QKEY       001D4A R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 REG_A      0008B7 R   |   5 REG_CC     0008BC R
  5 REG_EPC    0008A7 R   |   5 REG_SP     0008C2 R   |   5 REG_X      0008B2 R
  5 REG_Y      0008AD R   |     RELOP   =  000001     |   5 REMARK     001DBD R
    RETL1   =  000001     |   5 RETURN     001E18 R   |   5 RND        001D86 R
    ROP     =  004800     |     RST_SR  =  0050B3     |   5 RUN        001CEF R
    RXCHAR  =  000001     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   5 SAVE       001CC2 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]

Symbol Table

    SDIVD   =  000002     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       001CE6 R   |     SIGN    =  000001 
  5 SIZE       001D5B R   |     SKIP    =  000006     |   5 SLEEP      001C9C R
    SPACE   =  000020     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  000080     |   5 STATES     00086A R   |   5 STEP       001DFB R
  5 STOP       001CDD R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      001D74 R
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
    TIM1_SMC=  000001     |     TIM1_SMC=  000002     |     TIM1_SMC=  000004 
    TIM1_SMC=  000005     |     TIM1_SMC=  000006     |     TIM1_SR1=  005255 
    TIM1_SR1=  000007     |     TIM1_SR1=  000001     |     TIM1_SR1=  000002 
    TIM1_SR1=  000003     |     TIM1_SR1=  000004     |     TIM1_SR1=  000005 
    TIM1_SR1=  000006     |     TIM1_SR1=  000000     |     TIM1_SR2=  005256 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]

Symbol Table

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
    TK_ARRAY=  000002     |     TK_CHAR =  00000B     |     TK_CMD  =  000006 
    TK_COLON=  000007     |     TK_COMMA=  000008     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_FUNC =  00000C     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_INTGR=  00000A     |     TK_LE   =  000036     |     TK_LPARE=  000003 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  000005     |     TK_RPARE=  000004 
    TK_SHARP=  000009     |     TK_VAR  =  000001     |   5 TO         001DF4 R
    TOK_TEST=  000000     |   5 Timer4Up   000019 R   |   5 TrapHand   00000A R
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
    UART3_TX=  000005     |     UART_BRR=  000002     |     UART_BRR=  000003 
    UART_CR1=  000004     |     UART_CR1=  000004     |     UART_CR1=  000002 
    UART_CR1=  000000     |     UART_CR1=  000001     |     UART_CR1=  000007 
    UART_CR1=  000006     |     UART_CR1=  000005     |     UART_CR1=  000003 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

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
  5 UBOUND     001E0D R   |   5 USER_ABO   000083 R   |   5 USR        001D00 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 UserButt   000025 R   |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       001DB4 R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |   5 WRITE      001CCB R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XMASK   =  000001     |     XSAVE   =  000001 
    YSAVE   =  000003     |   5 abs        001BFE R   |   1 acc16      000009 R
  1 acc24      000008 R   |   1 acc8       00000A R   |   5 accept_c   000A19 R
  5 add        001046 R   |   5 ansi_seq   0009D7 R   |   5 arg_list   001197 R
  1 array_ad   000021 R   |   1 array_si   000023 R   |   5 ascii      001B21 R
  5 at_tst     000D2C R   |   5 atoi       000E61 R   |   5 atoi_exi   000ECF R
  5 bad_port   001B97 R   |   1 base       000007 R   |   1 basicptr   000003 R
  5 bin_exit   000C04 R   |   5 bit_rese   0015C9 R   |   5 bit_set    0015B4 R
  5 bit_togg   0015DF R   |   5 bkslsh_t   000CD2 R   |   5 bksp       00024E R
  5 bye        001BCE R   |   5 char       001B00 R   |   5 clear_ba   00056F R
  5 clear_va   00047F R   |   5 clock_in   00009E R   |   5 cmd_itf    000A3D R
  5 cmp_name   0018BD R   |   5 cold_sta   0004E4 R   |   5 colon_ts   000CFC R
  5 comma_ts   000D0B R   |   5 convert_   000B67 R   |   1 count      000002 R
  5 cp_loop    001143 R   |   5 create_g   0003D3 R   |   5 cstk_pro   000FFD R
  5 dash_tst   000D21 R   |   5 ddrop      000F54 R   |   5 ddrop_n    00111B R
  5 ddup       000F5D R   |   5 dec_base   00136A R   |   5 del_back   000A0A R
  5 del_line   0003A4 R   |   5 del_ln     0009FB R   |   5 delete     00025E R
  5 dir_loop   001A88 R   |   5 director   001A7C R   |   5 divide     0010C1 R
  5 divu24_8   000964 R   |   5 dotr       001006 R   |   5 dotr_loo   001014 R
  5 dots       000FCD R   |   5 dpick      000F6E R   |   5 dpop       000F2D R
  5 dpush      000F20 R   |   3 dstack     001740 R   |   3 dstack_u   001780 R
  5 dstk_pro   000FC3 R   |   1 dstkptr    00001A R   |   5 dswap      000F3A R
  5 empty      00143B R   |   5 eql_tst    000D87 R   |   5 erase_bl   000120 R
  5 erase_en   00010C R   |   5 erase_fl   000146 R   |   5 erase_st   0000E1 R
  5 err_bad_   000650 R   |   5 err_cmd_   000611 R   |   5 err_div0   0005D3 R
  5 err_dupl   00062C R   |   5 err_math   0005B9 R   |   5 err_mem_   00059C R
  5 err_msg    000584 R   |   5 err_no_a   00065D R   |   5 err_no_l   0005E3 R
  5 err_not_   00063E R   |   5 err_run_   0005FA R   |   5 err_synt   0005AA R
  5 execute    00112E R   |   5 expect     00118A R   |   5 expr_exi   00130C R
  5 expressi   0012CE R   |   5 factor     001202 R   |   1 farptr     000014 R
  7 fdrive     010000 R   |   5 fetch      000F7D R   |   5 fetchc     000B0A R
  1 ffree      000017 R   |   5 ffree_ms   0018A6 R   |   5 file_cou   001ADB R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

  5 final_te   0009D1 R   |   5 first_li   0013DF R   |   1 flags      000025 R
  5 for        001649 R   |   5 forget     001A2B R   |   1 free_ram   00005B R
  5 get_arra   0011C5 R   |   5 get_tick   001BF8 R   |   5 get_toke   000C58 R
  5 getc       000227 R   |   5 go_commo   00177E R   |   5 gosub      00175B R
  5 goto       00174E R   |   5 gpio       001B66 R   |   5 gt_tst     000D92 R
  5 hex_base   001365 R   |   5 hse_cloc   000207 R   |   5 hsi_cloc   000211 R
  5 if         00162E R   |   1 in         000001 R   |   1 in.w       000000 R
  5 incr_far   001819 R   |   5 input_ex   001583 R   |   5 input_lo   00151D R
  5 input_va   001511 R   |   5 insert_l   000404 R   |   5 insert_l   00047C R
  5 interp     000719 R   |   5 interp_l   00075F R   |   5 invalid    000A72 R
  5 invalid_   000AE0 R   |   5 is_alpha   00048D R   |   5 is_digit   000E28 R
  5 itoa       00091D R   |   5 itoa_loo   000935 R   |   5 key        001B51 R
  5 kword_di   001E3D R   |   5 kword_en   001C92 R   |   5 last_lin   0013E8 R
  5 ledoff     0007A2 R   |   5 ledon      00079D R   |   5 ledtoggl   0007A7 R
  5 left_arr   0009D7 R   |   5 left_par   0007B0 R   |   5 let        00138D R
  5 let02      001397 R   |   1 lineno     000005 R   |   5 lines_sk   0013ED R
  5 list       0013B4 R   |   5 list_exi   001437 R   |   5 list_sta   001410 R
  5 load       0019C7 R   |   5 loop_bac   00171F R   |   1 loop_dep   000020 R
  5 loop_don   00173B R   |   5 lt_tst     000DCB R   |   5 mem_peek   000A8E R
  5 modulo     001110 R   |   5 move       000332 R   |   5 move_cod   00010C R
  5 move_dow   000350 R   |   5 move_exi   000372 R   |   5 move_loo   000355 R
  5 move_up    000342 R   |   5 multiply   00106E R   |   5 mulu24_8   000ED3 R
  5 nbr_tst    000CA6 R   |   5 neg_acc2   00098C R   |   5 negate     0011BB R
  5 new        00180D R   |   5 next       0016D4 R   |   5 no_match   001155 R
  5 none       000C58 R   |   5 number     000B10 GR  |   5 other      000E03 R
  3 pad        001718 R   |   5 parse_bi   000BE4 R   |   5 parse_in   000BA6 R
  5 parse_ke   000C0F R   |   5 parse_qu   000B29 R   |   5 parser_i   000910 GR
  5 pause      001BE2 R   |   5 peek       001608 R   |   5 peek_byt   000AAA R
  5 plus_tst   000D5B R   |   5 poke       0015F4 R   |   5 port_cr1   001BB5 R
  5 port_cr2   001BBE R   |   5 port_ddr   001BAC R   |   5 port_idr   001BA3 R
  5 port_odr   001B9C R   |   5 prcnt_ts   000D7C R   |   5 print      00146A R
  5 print_ex   0014DA R   |   5 print_fa   000AEF R   |   5 print_re   000817 R
  5 print_st   000A82 R   |   5 prt_basi   00144C R   |   5 prt_cstr   00023A R
  5 prt_loop   00146E R   |   5 prt_peek   0002E2 R   |   5 prt_reg1   0007E3 R
  5 prt_reg8   0007BB R   |   5 prt_regs   000278 R   |   5 prt_tos    000F91 R
  5 prti24     0008C8 R   |   5 putc       00021E R   |   5 puts       000230 R
  5 qkey       001B5C R   |   5 qmark_ts   000D37 R   |   5 random     001C1E R
  5 readln     0009AF R   |   5 readln_l   0009B5 R   |   5 readln_q   000A2E R
  5 regs_sta   0002BB R   |   5 rel_exit   001362 R   |   5 relation   00130F R
  5 rem        001587 R   |   5 repl       000A4B R   |   5 repl_exi   000A6F R
  5 reprint    0009D7 R   |   5 reset_co   00146C R   |   5 rest_con   0014FC R
  5 return     0017A9 R   |   5 right_ar   0009D7 R   |   5 rparnt_t   000CF1 R
  5 run        0017C9 R   |   5 save       001928 R   |   5 save_con   0014E7 R
  5 scan       000B17 R   |   5 search_d   001132 R   |   5 search_e   001186 R
  5 search_f   0018DE R   |   5 search_l   000375 R   |   5 search_l   000380 R
  5 search_n   001136 R   |   1 seedx      00000D R   |   1 seedy      00000F R
  5 seek_fdr   001827 R   |   5 sharp_ts   000D16 R   |   5 show       00103E R
  5 size       00136F R   |   5 skip       000F0D R   |   5 slash_ts   000D71 R
  5 sleep      001BD7 R   |   5 software   00049E R   |   5 spaces     00026C R
  3 stack_fu   001780 R   |   3 stack_un   001800 R   |   5 star_tst   000D66 R
  5 step       0016AE R   |   5 stop       0017FB R   |   5 store      000F87 R
  5 store_lo   0016C0 R   |   5 str_matc   001164 R   |   5 str_tst    000C95 R
  5 strcmp     000313 R   |   5 strcpy     000324 R   |   5 strlen     000306 R
  5 substrac   001059 R   |   5 syntax_e   000691 R   |   1 tab_widt   000026 R
  5 tb_error   000693 R   |   5 term       001284 R   |   5 term01     00128D R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

  5 term_exi   0012CB R   |   5 test_p     000A7A R   |   3 tib        0016C8 R
  5 tick_tst   000D4C R   |   1 ticks      00000B R   |   5 timer4_i   0000B4 R
  5 to         001676 R   |   5 to_lower   000E31 GR  |   5 to_upper   000E3C GR
  5 token_ch   000E12 R   |   5 token_ex   000E25 R   |   1 tokval     000012 R
  1 txtbgn     00001C R   |   1 txtend     00001E R   |   5 uart3_in   0001F4 R
  5 uart3_se   000200 R   |   5 uart_ena   000219 R   |   5 ubound     00137C R
  5 unget_to   000FB0 R   |   5 unlock_e   0000C5 R   |   5 unlock_f   0000D3 R
  1 untok      000011 R   |   5 upper      000E48 R   |   5 upper_lo   000E4C R
  5 user_spa   001E80 R   |   5 usr        001BC7 R   |   1 vars       000027 R
  5 wait       001588 R   |   5 warm_sta   0006F1 R   |   5 write      001AE3 R
  5 write_bl   0001D1 R   |   5 write_by   00015C R   |   5 write_ee   000198 R
  5 write_ex   0001CC R   |   5 write_fl   000182 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5B   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   1E80   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

