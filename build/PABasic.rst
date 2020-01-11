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
                           000004    51 	FBREAK=4 ; break point flag 
                                     52 
      000002                         53 in.w:  .blkb 1 ; parser position in text line
      000003                         54 in:    .blkb 1 ; low byte of in.w
      000004                         55 count: .blkb 1 ; length of string in text line  
      000006                         56 basicptr:  .blkb 2  ; point to text buffer 
      000008                         57 lineno: .blkb 2  ; BASIC line number 
      000009                         58 base:  .blkb 1 ; nemeric base used to print integer 
      00000A                         59 acc24: .blkb 1 ; 24 accumulator
      00000B                         60 acc16: .blkb 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      00000C                         61 acc8:  .blkb 1
      00000E                         62 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000010                         63 seedx: .blkw 1  ; xorshift 16 seed x 
      000012                         64 seedy: .blkw 1  ; xorshift 16 seed y 
      000014                         65 in.w.saved: .blkw 1 ; last parsed token value  
      000017                         66 farptr: .blkb 3 ; far pointer 
      00001A                         67 ffree: .blkb 3 ; flash free address 
      00001C                         68 dstkptr: .blkw 1  ; data stack pointer 
      00001E                         69 txtbgn: .ds 2 ; BASIC text beginning address 
      000020                         70 txtend: .ds 2 ; BASIC text end address 
      000021                         71 loop_depth: .ds 1 ; FOR loop depth 
      000023                         72 array_addr: .ds 2 ; address of @ array 
      000025                         73 array_size: .ds 2 ; array size 
      000026                         74 flags: .ds 1 ; boolean flags
      000027                         75 tab_width: .ds 1 ; print colon width (4)
      00005B                         76 vars: .ds 2*26 ; BASIC variables A-Z, keep it as but last .
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
      00808A 72 12 00 25      [ 1]  148 	bset flags,#FTRAP 
      00808E CD 88 85         [ 4]  149 	call print_registers
      008091 CD 8B 01         [ 4]  150 	call cmd_itf
      008094 72 13 00 25      [ 1]  151 	bres flags,#FTRAP 	
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
      0080AE 72 07 00 25 05   [ 2]  173     btjf flags,#FSLEEP,2$
      0080B3 72 17 00 25      [ 1]  174 	bres flags,#FSLEEP 
      0080B7 80               [11]  175 	iret
      0080B8 72 00 00 25 03   [ 2]  176 2$:	btjt flags,#FRUN,4$
      0080BD CC 80 FB         [ 2]  177 	jp 9$ 
      0080C0 72 11 00 25      [ 1]  178 4$:	bres flags,#FRUN 
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
      0080DB CD 89 30         [ 4]  189 	call prti24
      0080DE CE 00 04         [ 2]  190 	ldw x,basicptr 
      0080E1 1C 00 03         [ 2]  191 	addw x,#3  
      0080E4 CD 82 B0         [ 4]  192 	call puts 
      0080E7 A6 0D            [ 1]  193 	ld a,#CR 
      0080E9 CD 82 9E         [ 4]  194 	call putc
      0080EC 5F               [ 1]  195 	clrw x  
      0080ED C6 00 02         [ 1]  196 	ld a,in 
      0080F0 AB 02            [ 1]  197 	add a,#2 ; adjustment for line number display 
      0080F2 97               [ 1]  198 	ld xl,a 
      0080F3 CD 82 D8         [ 4]  199 	call spaces 
      0080F6 A6 5E            [ 1]  200 	ld a,#'^
      0080F8 CD 82 9E         [ 4]  201 	call putc 
      0080FB                        202 9$:
      0080FB AE 17 FF         [ 2]  203     ldw x,#STACK_EMPTY 
      0080FE 94               [ 1]  204     ldw sp,x
      0080FF 9A               [ 1]  205 	rim 
      008100 CC 87 81         [ 2]  206 	jp warm_start
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
      00816A 92 BD 00 14      [ 4]  283 	ldf [farptr],a
      00816E 72 5C 00 16      [ 1]  284     inc farptr+2 
      008172 92 BD 00 14      [ 4]  285     ldf [farptr],a
      008176 72 5C 00 16      [ 1]  286     inc farptr+2 
      00817A 92 BD 00 14      [ 4]  287     ldf [farptr],a
      00817E 72 5C 00 16      [ 1]  288     inc farptr+2 
      008182 92 BD 00 14      [ 4]  289     ldf [farptr],a
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
      00819C CD 83 9E         [ 4]  301 	call move 
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
      0081A0 CE 00 15         [ 2]  313 	ldw x,farptr+1 
      0081A3 89               [ 2]  314 	pushw x 
      0081A4 CD 81 8C         [ 4]  315 	call move_code_in_ram 
      0081A7 85               [ 2]  316 	popw x 
      0081A8 CF 00 15         [ 2]  317 	ldw farptr+1,x 
      0081AB 72 5D 00 14      [ 1]  318 	tnz farptr
      0081AF 26 15            [ 1]  319 	jrne erase_flash 
      0081B1 AE 80 00         [ 2]  320 	ldw x,#FLASH_BASE 
      0081B4 C3 00 15         [ 2]  321 	cpw x,farptr+1 
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
      0081E4 90 CE 00 15      [ 2]  363 	ldw y,farptr+1   ; Y=addr15:0
                                    364 ; check addr[23:16], if <> 0 then it is extened flash memory
      0081E8 72 5D 00 14      [ 1]  365 	tnz farptr 
      0081EC 26 14            [ 1]  366 	jrne write_flash
      0081EE 90 A3 9E 80      [ 2]  367     cpw y,#user_space
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
      008208 92 A7 00 14      [ 4]  379 	ldf ([farptr],x),a ; farptr[x]=A
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
      008237 92 A7 00 14      [ 4]  401     ldf ([farptr],x),a
      00823B 0D 02            [ 1]  402     tnz (OPT,sp)
      00823D 27 08            [ 1]  403     jreq 3$
      00823F 5C               [ 1]  404     incw x
      008240 7B 01            [ 1]  405     ld a,(BTW,sp)
      008242 43               [ 1]  406     cpl a
      008243 92 A7 00 14      [ 4]  407     ldf ([farptr],x),a
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
      00826E CD 98 32         [ 4]  448 	call incr_farptr
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
                                    526 
                                    527 ;---------------------------
                                    528 ; delete character at left 
                                    529 ; of cursor on terminal 
                                    530 ; input:
                                    531 ;   none 
                                    532 ; output:
                                    533 ;	none 
                                    534 ;---------------------------
      0082BA                        535 bksp:
      0082BA A6 08            [ 1]  536 	ld a,#BSP 
      0082BC CD 82 9E         [ 4]  537 	call putc 
      0082BF A6 20            [ 1]  538 	ld a,#SPACE 
      0082C1 CD 82 9E         [ 4]  539 	call putc 
      0082C4 A6 08            [ 1]  540 	ld a,#BSP 
      0082C6 CD 82 9E         [ 4]  541 	call putc 
      0082C9 81               [ 4]  542 	ret 
                                    543 ;---------------------------
                                    544 ; delete n character left of cursor 
                                    545 ; at terminal.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    546 ; input: 
                                    547 ;   A   	number of characters to delete.
                                    548 ; output:
                                    549 ;    none 
                                    550 ;--------------------------	
      0082CA                        551 delete:
      0082CA 88               [ 1]  552 	push a 
      0082CB 0D 01            [ 1]  553 0$:	tnz (1,sp)
      0082CD 27 07            [ 1]  554 	jreq 1$
      0082CF CD 82 BA         [ 4]  555 	call bksp 
      0082D2 0A 01            [ 1]  556 	dec (1,sp)
      0082D4 20 F5            [ 2]  557 	jra 0$
      0082D6 84               [ 1]  558 1$:	pop a 
      0082D7 81               [ 4]  559 	ret
                                    560 
                                    561 ;--------------------------
                                    562 ; print n spaces on terminal
                                    563 ; input:
                                    564 ;  X 		number of spaces 
                                    565 ; output:
                                    566 ;	none 
                                    567 ;---------------------------
      0082D8                        568 spaces:
      0082D8 A6 20            [ 1]  569 	ld a,#SPACE 
      0082DA 5D               [ 2]  570 1$:	tnzw x
      0082DB 27 06            [ 1]  571 	jreq 9$
      0082DD CD 82 9E         [ 4]  572 	call putc 
      0082E0 5A               [ 2]  573 	decw x
      0082E1 20 F7            [ 2]  574 	jra 1$
      0082E3                        575 9$: 
      0082E3 81               [ 4]  576 	ret 
                                    577 
                           000001   578 .if DEBUG 
                                    579 ;---------------------------------
                                    580 ;; print actual registers states 
                                    581 ;; as pushed on stack 
                                    582 ;; {Y,X,CC,A}
                                    583 ;---------------------------------
      0082E4                        584 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      000264                        585 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      000264                        586 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      000264                        587 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      000264                        588 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      000264                        589 prt_regs:
      0082E4 AE 83 27         [ 2]  590 	ldw x,#regs_state 
      0082E7 CD 82 B0         [ 4]  591 	call puts
                                    592 ; register PC
      0082EA 16 01            [ 2]  593 	ldw y,(1,sp)
      0082EC AE 89 15         [ 2]  594 	ldw x,#REG_EPC 
      0082EF CD 88 66         [ 4]  595 	call prt_reg16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



                                    596 ; register CC 
      0082F2 7B 08            [ 1]  597 	ld a,(R_CC,sp)
      0082F4 AE 89 26         [ 2]  598 	ldw x,#REG_CC 
      0082F7 CD 88 41         [ 4]  599 	call prt_reg8 
                                    600 ; register A 
      0082FA 7B 07            [ 1]  601 	ld a,(R_A,sp)
      0082FC AE 89 22         [ 2]  602 	ldw x,#REG_A 
      0082FF CD 88 41         [ 4]  603 	call prt_reg8 
                                    604 ; register X 
      008302 16 05            [ 2]  605 	ldw y,(R_X,sp)
      008304 AE 89 1E         [ 2]  606 	ldw x,#REG_X 
      008307 CD 88 66         [ 4]  607 	call prt_reg16 
                                    608 ; register Y 
      00830A 16 03            [ 2]  609 	ldw y,(R_Y,sp)
      00830C AE 89 1A         [ 2]  610 	ldw x,#REG_Y 
      00830F CD 88 66         [ 4]  611 	call prt_reg16 
                                    612 ; register SP 
      008312 90 96            [ 1]  613 	ldw y,sp
      008314 72 A9 00 08      [ 2]  614 	addw y,#6+ARG_OFS  
      008318 AE 89 2B         [ 2]  615 	ldw x,#REG_SP
      00831B CD 88 66         [ 4]  616 	call prt_reg16
      00831E A6 0D            [ 1]  617 	ld a,#CR 
      008320 CD 82 9E         [ 4]  618 	call putc
      008323 CD 82 9E         [ 4]  619 	call putc   
      008326 81               [ 4]  620 	ret 
                                    621 
      008327 0A 72 65 67 69 73 74   622 regs_state: .asciz "\nregisters state\n--------------------\n"
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
      00834E                        632 prt_peek:
      00834E 89               [ 2]  633 	pushw x 
      00834F CF 00 0A         [ 2]  634 	ldw acc16,x 
      008352 72 5F 00 09      [ 1]  635 	clr acc24 
      008356 5F               [ 1]  636 	clrw x 
      008357 A6 10            [ 1]  637 	ld a,#16 
      008359 CD 89 30         [ 4]  638 	call prti24 
      00835C A6 3A            [ 1]  639 	ld a,#': 
      00835E CD 82 9E         [ 4]  640 	call putc 
      008361 A6 20            [ 1]  641 	ld a,#SPACE 
      008363 CD 82 9E         [ 4]  642 	call putc 
      008366 85               [ 2]  643 	popw x 
      008367 F6               [ 1]  644 	ld a,(x)
      008368 C7 00 0B         [ 1]  645 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      00836B 5F               [ 1]  646 	clrw x 
      00836C A6 10            [ 1]  647 	ld a,#16 
      00836E CD 89 30         [ 4]  648 	call prti24
      008371 81               [ 4]  649 	ret 
                                    650 .endif 
                                    651 
                                    652 ;-------------------------------------
                                    653 ; retrun string length
                                    654 ; input:
                                    655 ;   X         .asciz  
                                    656 ; output:
                                    657 ;   X         length 
                                    658 ;-------------------------------------
      008372                        659 strlen:
      008372 90 93            [ 1]  660 	ldw y,x 
      008374 5F               [ 1]  661 	clrw x 
      008375 90 7D            [ 1]  662 1$:	tnz (y) 
      008377 27 05            [ 1]  663 	jreq 9$ 
      008379 5C               [ 1]  664 	incw x
      00837A 90 5C            [ 1]  665 	incw y 
      00837C 20 F7            [ 2]  666 	jra 1$ 
      00837E 81               [ 4]  667 9$: ret 
                                    668 
                                    669 ;------------------------------------
                                    670 ; compare 2 strings
                                    671 ; input:
                                    672 ;   X 		char* first string 
                                    673 ;   Y       char* second string 
                                    674 ; output:
                                    675 ;   A 		0|1 
                                    676 ;-------------------------------------
      00837F                        677 strcmp:
      00837F F6               [ 1]  678 	ld a,(x)
      008380 27 0B            [ 1]  679 	jreq 5$ 
      008382 90 F1            [ 1]  680 	cp a,(y) 
      008384 26 05            [ 1]  681 	jrne 4$ 
      008386 5C               [ 1]  682 	incw x 
      008387 90 5C            [ 1]  683 	incw y 
      008389 20 F4            [ 2]  684 	jra strcmp 
      00838B                        685 4$: ; not same  
      00838B 4F               [ 1]  686 	clr a 
      00838C 81               [ 4]  687 	ret 
      00838D                        688 5$: ; same 
      00838D A6 01            [ 1]  689 	ld a,#1 
      00838F 81               [ 4]  690 	ret 
                                    691 
                                    692 
                                    693 ;---------------------------------------
                                    694 ;  copy src to dest 
                                    695 ; input:
                                    696 ;   X 		dest 
                                    697 ;   Y 		src 
                                    698 ; output: 
                                    699 ;   X 		dest 
                                    700 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008390                        701 strcpy:
      008390 89               [ 2]  702 	pushw x 
      008391 90 F6            [ 1]  703 1$: ld a,(y)
      008393 27 06            [ 1]  704 	jreq 9$ 
      008395 F7               [ 1]  705 	ld (x),a 
      008396 5C               [ 1]  706 	incw x 
      008397 90 5C            [ 1]  707 	incw y 
      008399 20 F6            [ 2]  708 	jra 1$ 
      00839B 7F               [ 1]  709 9$:	clr (x)
      00839C 85               [ 2]  710 	popw x 
      00839D 81               [ 4]  711 	ret 
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
      00839E                        725 move:
      00031E                        726 	_vars VSIZE 
      00839E 52 02            [ 2]    1     sub sp,#VSIZE 
      0083A0 0F 01            [ 1]  727 	clr (INCR,sp)
      0083A2 0F 02            [ 1]  728 	clr (LB,sp)
      0083A4 90 89            [ 2]  729 	pushw y 
      0083A6 13 01            [ 2]  730 	cpw x,(1,sp) ; compare DEST to SRC 
      0083A8 90 85            [ 2]  731 	popw y 
      0083AA 27 32            [ 1]  732 	jreq move_exit ; x==y 
      0083AC 2B 0E            [ 1]  733 	jrmi move_down
      0083AE                        734 move_up: ; start from top address with incr=-1
      0083AE 72 BB 00 0A      [ 2]  735 	addw x,acc16
      0083B2 72 B9 00 0A      [ 2]  736 	addw y,acc16
      0083B6 03 01            [ 1]  737 	cpl (INCR,sp)
      0083B8 03 02            [ 1]  738 	cpl (LB,sp)   ; increment = -1 
      0083BA 20 05            [ 2]  739 	jra move_loop  
      0083BC                        740 move_down: ; start from bottom address with incr=1 
      0083BC 5A               [ 2]  741     decw x 
      0083BD 90 5A            [ 2]  742 	decw y
      0083BF 0C 02            [ 1]  743 	inc (LB,sp) ; incr=1 
      0083C1                        744 move_loop:	
      0083C1 C6 00 0A         [ 1]  745     ld a, acc16 
      0083C4 CA 00 0B         [ 1]  746 	or a, acc8
      0083C7 27 15            [ 1]  747 	jreq move_exit 
      0083C9 72 FB 01         [ 2]  748 	addw x,(INCR,sp)
      0083CC 72 F9 01         [ 2]  749 	addw y,(INCR,sp) 
      0083CF 90 F6            [ 1]  750 	ld a,(y)
      0083D1 F7               [ 1]  751 	ld (x),a 
      0083D2 72 5A 00 0B      [ 1]  752 	dec acc8
      0083D6 2A E9            [ 1]  753 	jrpl move_loop
      0083D8 72 5A 00 0A      [ 1]  754 	dec acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083DC 20 E3            [ 2]  755 	jra move_loop
      0083DE                        756 move_exit:
      00035E                        757 	_drop VSIZE
      0083DE 5B 02            [ 2]    1     addw sp,#VSIZE 
      0083E0 81               [ 4]  758 	ret 	
                                    759 
                                    760 ;-------------------------------------
                                    761 ; search text area for a line with 
                                    762 ; same number as lineno  
                                    763 ; input:
                                    764 ;	X 			lineno 
                                    765 ; output:
                                    766 ;   X 			addr of line | 0 
                                    767 ;   Y           lineno|insert address if not found  
                                    768 ;-------------------------------------
                           000001   769 	LL=1 ; line length 
                           000002   770 	LB=2 ; line length low byte 
                           000002   771 	VSIZE=2 
      0083E1                        772 search_lineno:
      000361                        773 	_vars VSIZE
      0083E1 52 02            [ 2]    1     sub sp,#VSIZE 
      0083E3 CF 00 0A         [ 2]  774 	ldw acc16,x 
      0083E6 0F 01            [ 1]  775 	clr (LL,sp)
      0083E8 90 CE 00 1C      [ 2]  776 	ldw y,txtbgn
      0083EC                        777 search_ln_loop:
      0083EC 90 C3 00 1E      [ 2]  778 	cpw y,txtend 
      0083F0 2A 17            [ 1]  779 	jrpl 8$
      0083F2 93               [ 1]  780 	ldw x,y 
      0083F3 FE               [ 2]  781 	ldw x,(x) ; x=line number 
      0083F4 C3 00 0A         [ 2]  782 	cpw x,acc16 
      0083F7 27 13            [ 1]  783 	jreq 9$ 
      0083F9 2A 0E            [ 1]  784 	jrpl 8$ ; from here all lines are > lineno 
      0083FB 90 E6 02         [ 1]  785 	ld a,(2,y)
      0083FE 6B 02            [ 1]  786 	ld (LB,sp),a 
      008400 72 A9 00 03      [ 2]  787 	addw y,#3 
      008404 72 F9 01         [ 2]  788 	addw y,(LL,sp)
      008407 20 E3            [ 2]  789 	jra search_ln_loop 
      008409 51               [ 1]  790 8$: exgw x,y 
      00840A 90 5F            [ 1]  791 	clrw y 	
      00038C                        792 9$: _drop VSIZE
      00840C 5B 02            [ 2]    1     addw sp,#VSIZE 
      00840E 51               [ 1]  793 	exgw x,y   
      00840F 81               [ 4]  794 	ret 
                                    795 
                                    796 ;-------------------------------------
                                    797 ; delete line at addr
                                    798 ; input:
                                    799 ;   X 		addr of line i.e DEST for move 
                                    800 ;-------------------------------------
                           000001   801 	LLEN=1
                           000003   802 	SRC=3
                           000004   803 	VSIZE=4
      008410                        804 del_line: 
      000390                        805 	_vars VSIZE 
      008410 52 04            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      008412 E6 02            [ 1]  806 	ld a,(2,x) ; line length
      008414 AB 03            [ 1]  807 	add a,#3
      008416 6B 02            [ 1]  808 	ld (LLEN+1,sp),a 
      008418 0F 01            [ 1]  809 	clr (LLEN,sp)
      00841A 90 93            [ 1]  810 	ldw y,x  
      00841C 72 F9 01         [ 2]  811 	addw y,(LLEN,sp) ;SRC  
      00841F 17 03            [ 2]  812 	ldw (SRC,sp),y  ;save source 
      008421 90 CE 00 1E      [ 2]  813 	ldw y,txtend 
      008425 72 F2 03         [ 2]  814 	subw y,(SRC,sp) ; y=count 
      008428 90 CF 00 0A      [ 2]  815 	ldw acc16,y 
      00842C 16 03            [ 2]  816 	ldw y,(SRC,sp)    ; source
      00842E CD 83 9E         [ 4]  817 	call move
      008431 90 CE 00 1E      [ 2]  818 	ldw y,txtend 
      008435 72 F2 01         [ 2]  819 	subw y,(LLEN,sp)
      008438 90 CF 00 1E      [ 2]  820 	ldw txtend,y  
      0003BC                        821 	_drop VSIZE     
      00843C 5B 04            [ 2]    1     addw sp,#VSIZE 
      00843E 81               [ 4]  822 	ret 
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
      00843F                        837 create_gap:
      0003BF                        838 	_vars VSIZE
      00843F 52 06            [ 2]    1     sub sp,#VSIZE 
      008441 C3 00 1E         [ 2]  839 	cpw x,txtend 
      008444 2A 27            [ 1]  840 	jrpl 9$ ; no need for a gap since at end of text.
      008446 1F 03            [ 2]  841 	ldw (SRC,sp),x 
      008448 17 05            [ 2]  842 	ldw (LEN,sp),y 
      00844A 90 CF 00 0A      [ 2]  843 	ldw acc16,y 
      00844E 90 93            [ 1]  844 	ldw y,x ; SRC
      008450 72 BB 00 0A      [ 2]  845 	addw x,acc16  
      008454 1F 01            [ 2]  846 	ldw (DEST,sp),x 
                                    847 ;compute size to move 	
      008456 CE 00 1E         [ 2]  848 	ldw x,txtend 
      008459 72 F0 03         [ 2]  849 	subw x,(SRC,sp)
      00845C CF 00 0A         [ 2]  850 	ldw acc16,x
      00845F 1E 01            [ 2]  851 	ldw x,(DEST,sp) 
      008461 CD 83 9E         [ 4]  852 	call move
      008464 CE 00 1E         [ 2]  853 	ldw x,txtend
      008467 72 FB 05         [ 2]  854 	addw x,(LEN,sp)
      00846A CF 00 1E         [ 2]  855 	ldw txtend,x
      0003ED                        856 9$:	_drop VSIZE 
      00846D 5B 06            [ 2]    1     addw sp,#VSIZE 
      00846F 81               [ 4]  857 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    858 
                                    859 
                                    860 ;--------------------------------------------
                                    861 ; insert line in tib into text area 
                                    862 ; first search for already existing 
                                    863 ; replace existing 
                                    864 ; if strlen(tib)==0 delete existing 
                                    865 ; input:
                                    866 ;   X 				line number 
                                    867 ;   tib[in.w]  		text to insert  
                                    868 ; output:
                                    869 ;   none
                                    870 ;---------------------------------------------
                           000001   871 	DEST=1  ; text area insertion address 
                           000003   872 	SRC=3   ; str to insert address 
                           000005   873 	LINENO=5 ; line number 
                           000007   874 	LLEN=7 ; line length 
                           000008   875 	VSIZE=8  
      008470                        876 insert_line:
      0003F0                        877 	_vars VSIZE 
      008470 52 08            [ 2]    1     sub sp,#VSIZE 
      008472 A3 00 00         [ 2]  878 	cpw x,#0  
      008475 22 03            [ 1]  879 	jrugt 0$ 
      008477 CC 87 21         [ 2]  880 	jp syntax_error ; negative line number 
      00847A                        881 0$: 
      00847A 1F 05            [ 2]  882 	ldw (LINENO,sp),x 
      00847C AE 16 C8         [ 2]  883 	ldw x,#tib 
      00847F 72 BB 00 01      [ 2]  884 	addw x,in.w 
      008483 1F 03            [ 2]  885 	ldw (SRC,sp),x 
      008485 CD 83 72         [ 4]  886 	call strlen
      008488 5D               [ 2]  887 	tnzw x 
      008489 27 01            [ 1]  888 	jreq 1$
      00848B 5C               [ 1]  889 	incw x 
      00848C 1F 07            [ 2]  890 1$:	ldw (LLEN,sp),x
      00848E 1E 05            [ 2]  891 	ldw x,(LINENO,sp)
      008490 CD 83 E1         [ 4]  892 	call search_lineno 
      008493 5D               [ 2]  893 	tnzw x 
      008494 26 04            [ 1]  894 	jrne 2$
                                    895 ; line doesn't exit 	
      008496 17 01            [ 2]  896 	ldw (DEST,sp),y 
      008498 20 05            [ 2]  897 	jra 3$
                                    898 ; line exit delete it.	
      00849A 1F 01            [ 2]  899 2$: ldw (DEST,sp),x 
      00849C CD 84 10         [ 4]  900 	call del_line
                                    901 ; leave or insert new line if LLEN>0
      00849F                        902 3$: 
                                    903 ; check for available space 
      00849F CD 93 66         [ 4]  904 	call size 
      0084A2 1D 00 03         [ 2]  905 	subw x,#3 
      0084A5 72 F0 07         [ 2]  906     subw x,(LLEN,sp)
      0084A8 2A 05            [ 1]  907 	jrpl 31$
      0084AA A6 01            [ 1]  908 	ld a,#ERR_MEM_FULL
      0084AC CC 87 23         [ 2]  909 	jp tb_error 
      0084AF                        910 31$:	
      0084AF 0D 08            [ 1]  911 	tnz (LLEN+1,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084B1 27 34            [ 1]  912 	jreq insert_ln_exit ; empty line forget it.
      0084B3 1E 01            [ 2]  913 	ldw x,(DEST,sp)
      0084B5 C3 00 1E         [ 2]  914 	cpw x,txtend 
      0084B8 2A 0B            [ 1]  915 	jrpl 4$ 
                                    916 ; must create a gap 
      0084BA 16 07            [ 2]  917 	ldw y,(LLEN,sp)
      0084BC 72 A9 00 03      [ 2]  918 	addw y,#3 ; space for lineno and linelen 
      0084C0 CD 84 3F         [ 4]  919 	call create_gap 
      0084C3 20 11            [ 2]  920 	jra 5$ 
      0084C5                        921 4$: ; insert at end. 
      0084C5 90 CE 00 1E      [ 2]  922 	ldw y,txtend
      0084C9 17 01            [ 2]  923 	ldw (DEST,sp),y
      0084CB 72 F9 07         [ 2]  924 	addw y,(LLEN,sp)
      0084CE 72 A9 00 03      [ 2]  925 	addw y,#3 
      0084D2 90 CF 00 1E      [ 2]  926 	ldw txtend,y  
      0084D6                        927 5$:	
      0084D6 1E 01            [ 2]  928 	ldw x,(DEST,sp) ; dest address 
      0084D8 16 05            [ 2]  929 	ldw y,(LINENO,sp) ; line number 
      0084DA FF               [ 2]  930 	ldw (x),y 
      0084DB 1C 00 02         [ 2]  931 	addw x,#2
      0084DE 7B 08            [ 1]  932 	ld a,(LLEN+1,sp)
      0084E0 F7               [ 1]  933 	ld (x),a 
      0084E1 5C               [ 1]  934 	incw x 
      0084E2 16 03            [ 2]  935 	ldw y,(SRC,sp) ; src addr  
      0084E4 CD 83 90         [ 4]  936 	call strcpy   
      0084E7                        937 insert_ln_exit:	
      000467                        938 	_drop VSIZE
      0084E7 5B 08            [ 2]    1     addw sp,#VSIZE 
      0084E9 81               [ 4]  939 	ret
                                    940 	
                                    941 ;------------------------------------
                                    942 ;  set all variables to zero 
                                    943 ; input:
                                    944 ;   none 
                                    945 ; output:
                                    946 ;	none
                                    947 ;------------------------------------
      0084EA                        948 clear_vars:
      0084EA AE 00 27         [ 2]  949 	ldw x,#vars 
      0084ED 90 AE 00 34      [ 2]  950 	ldw y,#2*26 
      0084F1 7F               [ 1]  951 1$:	clr (x)
      0084F2 5C               [ 1]  952 	incw x 
      0084F3 90 5A            [ 2]  953 	decw y 
      0084F5 26 FA            [ 1]  954 	jrne 1$
      0084F7 81               [ 4]  955 	ret 
                                    956 
                                    957 ;-------------------------------------
                                    958 ; check if A is a letter
                                    959 ; input:
                                    960 ;   A 			character to test 
                                    961 ; output:
                                    962 ;   C flag      1 true, 0 false 
                                    963 ;-------------------------------------
      0084F8                        964 is_alpha:
      0084F8 A1 41            [ 1]  965 	cp a,#'A 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084FA 8C               [ 1]  966 	ccf
      0084FB 24 0B            [ 1]  967 	jrnc 9$ 
      0084FD A1 5B            [ 1]  968 	cp a,#'Z+1 
      0084FF 25 07            [ 1]  969 	jrc 9$ 
      008501 A1 61            [ 1]  970 	cp a,#'a 
      008503 8C               [ 1]  971 	ccf 
      008504 24 02            [ 1]  972 	jrnc 9$
      008506 A1 7B            [ 1]  973 	cp a,#'z+1   
      008508 81               [ 4]  974 9$: ret 	
                                    975 
                                    976 ;-------------------------------------
                                    977 ;  program initialization entry point 
                                    978 ;-------------------------------------
                           000001   979 	MAJOR=1
                           000000   980 	MINOR=0
      008509 0A 0A 54 69 6E 79 20   981 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      00854F 75 73 65 72 20 73 70   982 usr_addr: .asciz "user space address: " 
             61 63 65 20 61 64 64
             72 65 73 73 3A 20 00
      008564                        983 cold_start:
                                    984 ;set stack 
      008564 AE 17 FF         [ 2]  985 	ldw x,#STACK_EMPTY
      008567 94               [ 1]  986 	ldw sp,x   
                                    987 ; clear all ram 
      008568 7F               [ 1]  988 0$: clr (x)
      008569 5A               [ 2]  989 	decw x 
      00856A 26 FC            [ 1]  990 	jrne 0$
                                    991 ; activate pull up on all inputs 
      00856C A6 FF            [ 1]  992 	ld a,#255 
      00856E C7 50 03         [ 1]  993 	ld PA_CR1,a 
      008571 C7 50 08         [ 1]  994 	ld PB_CR1,a 
      008574 C7 50 0D         [ 1]  995 	ld PC_CR1,a 
      008577 C7 50 12         [ 1]  996 	ld PD_CR1,a 
      00857A C7 50 17         [ 1]  997 	ld PE_CR1,a 
      00857D C7 50 1C         [ 1]  998 	ld PF_CR1,a 
      008580 C7 50 21         [ 1]  999 	ld PG_CR1,a 
      008583 C7 50 2B         [ 1] 1000 	ld PI_CR1,a 
                                   1001 ; select internal clock no divisor: 16 Mhz 	
      008586 A6 E1            [ 1] 1002 	ld a,#CLK_SWR_HSI 
      008588 5F               [ 1] 1003 	clrw x  
      008589 CD 81 1E         [ 4] 1004     call clock_init 
      00858C CD 81 34         [ 4] 1005 	call timer4_init
                                   1006 ; UART3 at 115200 BAUD
      00858F CD 82 74         [ 4] 1007 	call uart3_init
                                   1008 ; activate PE_4 (user button interrupt)
      008592 72 18 50 18      [ 1] 1009     bset PE_CR2,#USR_BTN_BIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1010 ; display system information
      008596 AE 85 09         [ 2] 1011 	ldw x,#software 
      008599 CD 82 B0         [ 4] 1012 	call puts 
      00859C A6 01            [ 1] 1013 	ld a,#MAJOR 
      00859E C7 00 0B         [ 1] 1014 	ld acc8,a 
      0085A1 5F               [ 1] 1015 	clrw x 
      0085A2 CF 00 09         [ 2] 1016 	ldw acc24,x 
      0085A5 A6 0A            [ 1] 1017 	ld a,#10 
      0085A7 CD 89 30         [ 4] 1018 	call prti24 
      0085AA A6 2E            [ 1] 1019 	ld a,#'.
      0085AC CD 82 9E         [ 4] 1020 	call putc 
      0085AF A6 00            [ 1] 1021 	ld a,#MINOR 
      0085B1 C7 00 0B         [ 1] 1022 	ld acc8,a 
      0085B4 5F               [ 1] 1023 	clrw x 
      0085B5 CF 00 09         [ 2] 1024 	ldw acc24,x 
      0085B8 A6 0A            [ 1] 1025 	ld a,#10 
      0085BA CD 89 30         [ 4] 1026 	call prti24 
      0085BD A6 0D            [ 1] 1027 	ld a,#CR 
      0085BF CD 82 9E         [ 4] 1028 	call putc 
      0085C2 CD 98 40         [ 4] 1029 	call seek_fdrive 
      0085C5 AE 85 4F         [ 2] 1030 	ldw x,#usr_addr
      0085C8 CD 82 B0         [ 4] 1031 	call puts  
      0085CB AE 9E 80         [ 2] 1032 	ldw x,#user_space
      0085CE 35 10 00 08      [ 1] 1033 	mov base,#16
      0085D2 CD 89 85         [ 4] 1034 	call print_int 
                                   1035 ; configure LED2 pin 
      0085D5 72 1A 50 0D      [ 1] 1036     bset PC_CR1,#LED2_BIT
      0085D9 72 1A 50 0E      [ 1] 1037     bset PC_CR2,#LED2_BIT
      0085DD 72 1A 50 0C      [ 1] 1038     bset PC_DDR,#LED2_BIT
      0085E1 9A               [ 1] 1039 	rim 
      0085E2 AE 16 C8         [ 2] 1040 	ldw x,#tib
      0085E5 CF 00 21         [ 2] 1041 	ldw array_addr,x 
      0085E8 72 5C 00 11      [ 1] 1042 	inc seedy+1 
      0085EC 72 5C 00 0F      [ 1] 1043 	inc seedx+1 
      0085F0 CD 85 FF         [ 4] 1044 	call clear_basic
      0085F3 CD 93 70         [ 4] 1045 	call ubound 
      0085F6 CD 8F BD         [ 4] 1046 	call dpop 
      0085F9 CF 00 23         [ 2] 1047 	ldw array_size,x 
      0085FC CC 87 81         [ 2] 1048     jp warm_start 
                                   1049 
      0085FF                       1050 clear_basic:
      0085FF 5F               [ 1] 1051 	clrw x 
      008600 CF 00 06         [ 2] 1052 	ldw lineno,x
      008603 72 5F 00 03      [ 1] 1053 	clr count 
      008607 AE 00 5B         [ 2] 1054 	ldw x,#free_ram 
      00860A CF 00 1C         [ 2] 1055 	ldw txtbgn,x 
      00860D CF 00 1E         [ 2] 1056 	ldw txtend,x 
      008610 CD 84 EA         [ 4] 1057 	call clear_vars 
      008613 81               [ 4] 1058 	ret 
                                   1059 
      008614                       1060 err_msg:
      008614 00 00 86 2C 86 3A 86  1061 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             49 86 63 86 73
      008620 86 8A 86 A1 86 BC 86  1062 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             CE 86 E0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00862A 86 ED                 1063 	.word err_no_access 
                                   1064 
      00862C 0A 4D 65 6D 6F 72 79  1065 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      00863A 0A 73 79 6E 74 61 78  1066 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      008649 0A 6D 61 74 68 20 6F  1067 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      008663 0A 64 69 76 69 73 69  1068 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      008673 0A 69 6E 76 61 6C 69  1069 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      00868A 0A 72 75 6E 20 74 69  1070 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      0086A1 0A 63 6F 6D 6D 61 6E  1071 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      0086BC 0A 64 75 70 6C 69 63  1072 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      0086CE 0A 46 69 6C 65 20 6E  1073 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      0086E0 0A 62 61 64 20 76 61  1074 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      0086ED 0A 46 69 6C 65 20 69  1075 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
                                   1076 
      008721                       1077 syntax_error:
      008721 A6 02            [ 1] 1078 	ld a,#ERR_SYNTAX 
                                   1079 
      008723                       1080 tb_error:
      008723 AE 86 14         [ 2] 1081 	ldw x, #err_msg 
      008726 72 5F 00 0A      [ 1] 1082 	clr acc16 
      00872A 48               [ 1] 1083 	sll a
      00872B 72 59 00 0A      [ 1] 1084 	rlc acc16  
      00872F C7 00 0B         [ 1] 1085 	ld acc8, a 
      008732 72 BB 00 0A      [ 2] 1086 	addw x,acc16 
      008736 FE               [ 2] 1087 	ldw x,(x)
      008737 CD 82 B0         [ 4] 1088 	call puts
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00873A CE 00 06         [ 2] 1089 	ldw x,lineno 
      00873D 5D               [ 2] 1090 	tnzw x 
      00873E 27 0F            [ 1] 1091 	jreq 2$
      008740 CF 00 0A         [ 2] 1092 	ldw acc16,x 
      008743 72 5F 00 09      [ 1] 1093 	clr acc24 
      008747 AE 00 05         [ 2] 1094 	ldw x,#5 
      00874A A6 0A            [ 1] 1095 	ld a,#10 
      00874C CD 89 30         [ 4] 1096 	call prti24
      00874F                       1097 2$:	 
      00874F CE 00 04         [ 2] 1098 	ldw x,basicptr   
      008752 C6 00 06         [ 1] 1099 	ld a,lineno 
      008755 CA 00 07         [ 1] 1100 	or a,lineno+1
      008758 27 03            [ 1] 1101 	jreq 3$
      00875A 1C 00 03         [ 2] 1102 	addw x,#3 
      00875D CD 82 B0         [ 4] 1103 3$:	call puts 
      008760 A6 0D            [ 1] 1104 	ld a,#CR 
      008762 CD 82 9E         [ 4] 1105 	call putc 
      008765 5F               [ 1] 1106 	clrw x 
      008766 C6 00 06         [ 1] 1107 	ld a,lineno 
      008769 CA 00 07         [ 1] 1108 	or a,lineno+1
      00876C 27 03            [ 1] 1109 	jreq 4$
      00876E AE 00 05         [ 2] 1110 	ldw x,#5 
      008771 72 BB 00 01      [ 2] 1111 4$:	addw x,in.w 
      008775 CD 82 D8         [ 4] 1112 	call spaces
      008778 A6 5E            [ 1] 1113 	ld a,#'^ 
      00877A CD 82 9E         [ 4] 1114 	call putc 
      00877D AE 17 FF         [ 2] 1115 1$: ldw x,#STACK_EMPTY 
      008780 94               [ 1] 1116     ldw sp,x
      008781                       1117 warm_start:
      008781 72 5F 00 25      [ 1] 1118 	clr flags 
      008785 72 5F 00 20      [ 1] 1119 	clr loop_depth 
      008789 AE 17 80         [ 2] 1120 	ldw x,#dstack_unf 
      00878C CF 00 1A         [ 2] 1121 	ldw dstkptr,x 
      00878F 35 04 00 26      [ 1] 1122 	mov tab_width,#TAB_WIDTH 
      008793 35 0A 00 08      [ 1] 1123 	mov base,#10 
      008797 5F               [ 1] 1124 	clrw x 
      008798 CF 00 06         [ 2] 1125 	ldw lineno,x 
      00879B AE 16 C8         [ 2] 1126 	ldw x,#tib 
      00879E CF 00 04         [ 2] 1127 	ldw basicptr,x 
                                   1128 ;----------------------------
                                   1129 ; tokenizer test
                                   1130 ;----------------------------
                           000000  1131   TOK_TEST=0 
                           000000  1132 .if TOK_TEST 
                                   1133 test_tok:
                                   1134 	clr in.w 
                                   1135 	clr in 
                                   1136 	ld a,#CR 
                                   1137 	call putc 
                                   1138 	ld a,#'> 
                                   1139 	call putc 
                                   1140 	call readln
                                   1141 	ldw x,#tib 
                                   1142 1$:	call get_token	
                                   1143 	tnz a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1144 	jrne 2$
                                   1145 	jra test_tok 
                                   1146 2$:	push a 
                                   1147 	cp a,#TK_INTGR
                                   1148 	jrne 3$
                                   1149 	ld a,#10 
                                   1150 	clrw x
                                   1151 	call itoa
                                   1152 	ldw y,x 
                                   1153 	ldw x,#pad 
                                   1154 	call strcpy    
                                   1155 3$:	ld a,(1,sp) 
                                   1156 	cp a,#20
                                   1157 	jrmi 34$
                                   1158 	ld a,#'2 
                                   1159 	call putc 
                                   1160 	ld a,(1,sp)
                                   1161 	sub a,#20
                                   1162 	ld (1,sp),a
                                   1163 	jra 36$   
                                   1164 34$: 
                                   1165 	cp a,#10
                                   1166 	jrmi 36$ 
                                   1167 	ld a,#'1 
                                   1168 	call putc
                                   1169 	ld a,(1,sp)
                                   1170 	sub a,#10 
                                   1171 	ld (1,sp),a  
                                   1172 36$:
                                   1173 	pop a 
                                   1174 	add a,#'0 
                                   1175 	call putc 
                                   1176 	ld a,#SPACE 
                                   1177 	call putc 
                                   1178 	ldw x,#pad 
                                   1179 	call puts 
                                   1180 	ld a,#CR 
                                   1181 	call putc 
                                   1182 	jra 1$
                                   1183 .endif
                                   1184 ;----------------------------
      0087A1                       1185 interp:
      0087A1 72 5F 00 01      [ 1] 1186 	clr in.w
      0087A5 72 01 00 25 2C   [ 2] 1187 	btjf flags,#FRUN,4$ 
                                   1188 ; running program
                                   1189 ; goto next basic line 
      0087AA CE 00 04         [ 2] 1190 	ldw x,basicptr
      0087AD E6 02            [ 1] 1191 	ld a,(2,x) ; line length 
      0087AF C7 00 0B         [ 1] 1192 	ld acc8,a 
      0087B2 72 5F 00 0A      [ 1] 1193 	clr acc16 
      0087B6 1C 00 03         [ 2] 1194 	addw x,#3 
      0087B9 72 BB 00 0A      [ 2] 1195 	addw x,acc16
      0087BD C3 00 1E         [ 2] 1196 	cpw x,txtend 
      0087C0 2A BF            [ 1] 1197 	jrpl warm_start
      0087C2 CF 00 04         [ 2] 1198 	ldw basicptr,x ; start of next line  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0087C5 E6 02            [ 1] 1199 	ld a,(2,x)
      0087C7 AB 02            [ 1] 1200 	add a,#2 ; because 'in' start at 3.
      0087C9 C7 00 03         [ 1] 1201 	ld count,a 
      0087CC FE               [ 2] 1202 	ldw x,(x) ; line no 
      0087CD CF 00 06         [ 2] 1203 	ldw lineno,x 
      0087D0 35 03 00 02      [ 1] 1204 	mov in,#3 ; skip first 3 bytes of line 
      0087D4 20 11            [ 2] 1205 	jra interp_loop 
      0087D6                       1206 4$: ; commande line mode 	
      0087D6 72 5F 00 02      [ 1] 1207 	clr in 
      0087DA A6 0D            [ 1] 1208 	ld a,#CR 
      0087DC CD 82 9E         [ 4] 1209 	call putc 
      0087DF A6 3E            [ 1] 1210 	ld a,#'> 
      0087E1 CD 82 9E         [ 4] 1211 	call putc 
      0087E4 CD 8A 73         [ 4] 1212 	call readln
      0087E7                       1213 interp_loop:
      0087E7 C6 00 02         [ 1] 1214 	ld a,in 
      0087EA C1 00 03         [ 1] 1215 	cp a,count 
      0087ED 2A B2            [ 1] 1216 	jrpl interp
      0087EF CD 8C FD         [ 4] 1217 	call get_token
      0087F2 A1 01            [ 1] 1218 	cp a,#TK_COLON 
      0087F4 27 F1            [ 1] 1219 	jreq interp_loop 
      0087F6 A1 00            [ 1] 1220 	cp a,#TK_NONE 
      0087F8 27 A7            [ 1] 1221 	jreq interp 
      0087FA                       1222 1$:
      0087FA A1 02            [ 1] 1223 	cp a,#TK_VAR
      0087FC 26 05            [ 1] 1224 	jrne 2$
      0087FE CD 93 88         [ 4] 1225 	call let02  
      008801 20 E4            [ 2] 1226 	jra interp_loop 
      008803                       1227 2$:	
      008803 A1 03            [ 1] 1228 	cp a,#TK_ARRAY 
      008805 26 08            [ 1] 1229 	jrne 3$
      008807 CD 91 ED         [ 4] 1230 	call get_array_element
      00880A CD 93 88         [ 4] 1231 	call let02 
      00880D 20 D8            [ 2] 1232 	jra interp_loop 
      00880F                       1233 3$:
      00880F A1 07            [ 1] 1234 	cp a,#TK_CMD
      008811 26 03            [ 1] 1235 	jrne 4$
      008813 FD               [ 4] 1236 	call (x) 
      008814 20 D1            [ 2] 1237 	jra interp_loop 
      008816                       1238 4$:	
      008816 A1 0A            [ 1] 1239 	cp a,#TK_INTGR
      008818 26 06            [ 1] 1240 	jrne 5$
      00881A CD 84 70         [ 4] 1241 	call insert_line 
      00881D CC 87 A1         [ 2] 1242 	jp interp
      008820                       1243 5$: 
      008820 CC 87 21         [ 2] 1244 	jp syntax_error 
                                   1245 
                                   1246 ;----------------------------------------
                                   1247 ;   DEBUG support functions
                                   1248 ;----------------------------------------
                           000001  1249 .if DEBUG 
                                   1250 ; turn LED on 
      008823                       1251 ledon:
      008823 72 1A 50 0A      [ 1] 1252     bset PC_ODR,#LED2_BIT
      008827 81               [ 4] 1253     ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1254 
                                   1255 ; turn LED off 
      008828                       1256 ledoff:
      008828 72 1B 50 0A      [ 1] 1257     bres PC_ODR,#LED2_BIT 
      00882C 81               [ 4] 1258     ret 
                                   1259 
                                   1260 ; invert LED status 
      00882D                       1261 ledtoggle:
      00882D A6 20            [ 1] 1262     ld a,#LED2_MASK
      00882F C8 50 0A         [ 1] 1263     xor a,PC_ODR
      008832 C7 50 0A         [ 1] 1264     ld PC_ODR,a
      008835 81               [ 4] 1265     ret 
                                   1266 
      008836                       1267 left_paren:
      008836 A6 20            [ 1] 1268 	ld a,#SPACE 
      008838 CD 82 9E         [ 4] 1269 	call putc
      00883B A6 28            [ 1] 1270 	ld a,#'( 
      00883D CD 82 9E         [ 4] 1271 	call putc 	
      008840 81               [ 4] 1272 	ret 
                                   1273 
                                   1274 ;------------------------------
                                   1275 ; print 8 bit register 
                                   1276 ; input:
                                   1277 ;   X  point to register name 
                                   1278 ;   A  register value to print 
                                   1279 ; output:
                                   1280 ;   none
                                   1281 ;------------------------------- 
      008841                       1282 prt_reg8:
      008841 88               [ 1] 1283 	push a 
      008842 CD 82 B0         [ 4] 1284 	call puts 
      008845 7B 01            [ 1] 1285 	ld a,(1,sp) 
      008847 C7 00 0B         [ 1] 1286 	ld acc8,a 
      00884A 5F               [ 1] 1287 	clrw x 
      00884B 97               [ 1] 1288 	ld xl,a 
      00884C 35 10 00 08      [ 1] 1289 	mov base,#16
      008850 CD 89 85         [ 4] 1290 	call print_int 
      008853 CD 88 36         [ 4] 1291 	call left_paren 
      008856 84               [ 1] 1292 	pop a 
      008857 5F               [ 1] 1293 	clrw x 
      008858 97               [ 1] 1294 	ld xl,a 
      008859 35 0A 00 08      [ 1] 1295 	mov base,#10 
      00885D CD 89 85         [ 4] 1296 	call print_int  
      008860 A6 29            [ 1] 1297 	ld a,#') 
      008862 CD 82 9E         [ 4] 1298 	call putc
      008865 81               [ 4] 1299 	ret
                                   1300 
                                   1301 ;--------------------------------
                                   1302 ; print 16 bits register 
                                   1303 ; input:
                                   1304 ;   X   point register name 
                                   1305 ;   Y   register value to print 
                                   1306 ; output:
                                   1307 ;  none
                                   1308 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008866                       1309 prt_reg16: 
      008866 90 89            [ 2] 1310 	pushw y 
      008868 CD 82 B0         [ 4] 1311 	call puts 
      00886B 1E 01            [ 2] 1312 	ldw x,(1,sp) 
      00886D 35 10 00 08      [ 1] 1313 	mov base,#16 
      008871 CD 89 85         [ 4] 1314 	call print_int  
      008874 CD 88 36         [ 4] 1315 	call left_paren 
      008877 85               [ 2] 1316 	popw x 
      008878 35 0A 00 08      [ 1] 1317 	mov base,#10 
      00887C CD 89 85         [ 4] 1318 	call print_int  
      00887F A6 29            [ 1] 1319 	ld a,#') 
      008881 CD 82 9E         [ 4] 1320 	call putc
      008884 81               [ 4] 1321 	ret 
                                   1322 
                                   1323 ;------------------------------------
                                   1324 ; print registers contents saved on
                                   1325 ; stack by trap interrupt.
                                   1326 ;------------------------------------
      008885                       1327 print_registers:
      008885 AE 88 D8         [ 2] 1328 	ldw x,#STATES
      008888 CD 82 B0         [ 4] 1329 	call puts
                                   1330 ; print EPC 
      00888B AE 89 15         [ 2] 1331 	ldw x, #REG_EPC
      00888E CD 82 B0         [ 4] 1332 	call puts 
      008891 7B 0B            [ 1] 1333 	ld a, (11,sp)
      008893 C7 00 0B         [ 1] 1334 	ld acc8,a 
      008896 7B 0A            [ 1] 1335 	ld a, (10,sp) 
      008898 C7 00 0A         [ 1] 1336 	ld acc16,a 
      00889B 7B 09            [ 1] 1337 	ld a,(9,sp) 
      00889D C7 00 09         [ 1] 1338 	ld acc24,a
      0088A0 5F               [ 1] 1339 	clrw x  
      0088A1 A6 10            [ 1] 1340 	ld a,#16
      0088A3 CD 89 30         [ 4] 1341 	call prti24  
                                   1342 ; print X
      0088A6 AE 89 1E         [ 2] 1343 	ldw x,#REG_X
      0088A9 16 05            [ 2] 1344 	ldw y,(5,sp)
      0088AB CD 88 66         [ 4] 1345 	call prt_reg16  
                                   1346 ; print Y 
      0088AE AE 89 1A         [ 2] 1347 	ldw x,#REG_Y
      0088B1 16 07            [ 2] 1348 	ldw y, (7,sp)
      0088B3 CD 88 66         [ 4] 1349 	call prt_reg16  
                                   1350 ; print A 
      0088B6 AE 89 22         [ 2] 1351 	ldw x,#REG_A
      0088B9 7B 04            [ 1] 1352 	ld a, (4,sp) 
      0088BB CD 88 41         [ 4] 1353 	call prt_reg8
                                   1354 ; print CC 
      0088BE AE 89 26         [ 2] 1355 	ldw x,#REG_CC 
      0088C1 7B 03            [ 1] 1356 	ld a, (3,sp) 
      0088C3 CD 88 41         [ 4] 1357 	call prt_reg8 
                                   1358 ; print SP 
      0088C6 AE 89 2B         [ 2] 1359 	ldw x,#REG_SP
      0088C9 90 96            [ 1] 1360 	ldw y,sp 
      0088CB 72 A9 00 0C      [ 2] 1361 	addw y,#12
      0088CF CD 88 66         [ 4] 1362 	call prt_reg16  
      0088D2 A6 0A            [ 1] 1363 	ld a,#'\n' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0088D4 CD 82 9E         [ 4] 1364 	call putc
      0088D7 81               [ 4] 1365 	ret
                                   1366 
      0088D8 0A 52 65 67 69 73 74  1367 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      008915 45 50 43 3A 00        1368 REG_EPC: .asciz "EPC:"
      00891A 0A 59 3A 00           1369 REG_Y:   .asciz "\nY:" 
      00891E 0A 58 3A 00           1370 REG_X:   .asciz "\nX:"
      008922 0A 41 3A 00           1371 REG_A:   .asciz "\nA:" 
      008926 0A 43 43 3A 00        1372 REG_CC:  .asciz "\nCC:"
      00892B 0A 53 50 3A 00        1373 REG_SP:  .asciz "\nSP:"
                                   1374 .endif 
                                   1375 
                                   1376 ;------------------------------------
                                   1377 ; print integer in acc24 
                                   1378 ; input:
                                   1379 ;	acc24 		integer to print 
                                   1380 ;	A 			numerical base for conversion 
                                   1381 ;               if bit 7 is set add a space at print end.
                                   1382 ;   XL 			field width, 0 -> no fill.
                                   1383 ;  output:
                                   1384 ;    none 
                                   1385 ;------------------------------------
                           000001  1386 	WIDTH = 1
                           000002  1387 	BASE = 2
                           000003  1388 	ADD_SPACE=3 ; add a space after number 
                           000003  1389 	VSIZE = 3
      008930                       1390 prti24:
      0008B0                       1391 	_vars VSIZE 
      008930 52 03            [ 2]    1     sub sp,#VSIZE 
      008932 0F 03            [ 1] 1392 	clr (ADD_SPACE,sp)
      008934 A5 80            [ 1] 1393 	bcp a,#0x80 
      008936 27 02            [ 1] 1394 	jreq 0$ 
      008938 03 03            [ 1] 1395 	cpl (ADD_SPACE,sp)
      00893A A4 1F            [ 1] 1396 0$:	and a,#31 
      00893C 6B 02            [ 1] 1397 	ld (BASE,sp),a
      00893E 9F               [ 1] 1398 	ld a,xl
      00893F 6B 01            [ 1] 1399 	ld (WIDTH,sp),a 
      008941 7B 02            [ 1] 1400 	ld a, (BASE,sp)  
      008943 CD 89 E1         [ 4] 1401     call itoa  ; conversion entier en  .asciz
      008946 7B 01            [ 1] 1402 1$: ld a,(WIDTH,sp)
      008948 27 1F            [ 1] 1403 	jreq 4$
      00894A C7 00 0B         [ 1] 1404 	ld acc8,a 
      00894D 89               [ 2] 1405 	pushw x 
      00894E CD 83 72         [ 4] 1406 	call strlen 
      008951 9F               [ 1] 1407 	ld a,xl 
      008952 85               [ 2] 1408 	popw x 
      008953 31 00 0B         [ 3] 1409 	exg a,acc8 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008956 C0 00 0B         [ 1] 1410 	sub a,acc8 
      008959 2B 0E            [ 1] 1411 	jrmi 4$
      00895B 6B 01            [ 1] 1412 	ld (WIDTH,sp),a 
      00895D A6 20            [ 1] 1413 	ld  a,#SPACE
      00895F 0D 01            [ 1] 1414 3$: tnz (WIDTH,sp)
      008961 27 06            [ 1] 1415 	jreq 4$
      008963 5A               [ 2] 1416 	decw x 
      008964 F7               [ 1] 1417 	ld (x),a 
      008965 0A 01            [ 1] 1418 	dec (WIDTH,sp) 
      008967 20 F6            [ 2] 1419 	jra 3$
      008969                       1420 4$: 
      008969 CD 82 B0         [ 4] 1421 	call puts 
      00896C 0D 03            [ 1] 1422 	tnz (ADD_SPACE,sp)
      00896E 27 05            [ 1] 1423 	jreq 5$
      008970 A6 20            [ 1] 1424     ld a,#SPACE 
      008972 CD 82 9E         [ 4] 1425 	call putc 
      0008F5                       1426 5$: _drop VSIZE 
      008975 5B 03            [ 2]    1     addw sp,#VSIZE 
      008977 81               [ 4] 1427     ret	
                                   1428 
                                   1429 ;-----------------------------
                                   1430 ; intialize parser ready for
                                   1431 ; for a new line analysis
                                   1432 ; input:
                                   1433 ;   none
                                   1434 ; output:
                                   1435 ;	none 
                                   1436 ;------------------------------
      008978                       1437 parser_init::
      008978 72 5F 00 01      [ 1] 1438 	clr in.w 
      00897C 72 5F 00 02      [ 1] 1439 	clr in
      008980 72 5F 17 18      [ 1] 1440 	clr pad  
      008984 81               [ 4] 1441 	ret 
                                   1442 
                                   1443 ;-----------------------------------
                                   1444 ; print a 16 bit integer 
                                   1445 ; using variable 'base' as conversion
                                   1446 ; format.
                                   1447 ; input:
                                   1448 ;   X       integer to print 
                                   1449 ;   base    conversion base 
                                   1450 ; output:
                                   1451 ;   none 
                                   1452 ;-----------------------------------
                           000001  1453 	SIGN=1
                           000001  1454 	VSIZE=1
      008985                       1455 print_int: 
      000905                       1456 	_vars VSIZE 
      008985 52 01            [ 2]    1     sub sp,#VSIZE 
      008987 0F 01            [ 1] 1457 	clr (SIGN,sp)
      008989 90 AE 17 3F      [ 2] 1458 	ldw y,#pad+PAD_SIZE-1 
      00898D 90 7F            [ 1] 1459 	clr (y)
      00898F C6 00 08         [ 1] 1460 	ld a,base  
      008992 A1 0A            [ 1] 1461 	cp a,#10 
      008994 26 06            [ 1] 1462 	jrne 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      008996 5D               [ 2] 1463 	tnzw x 
      008997 2A 03            [ 1] 1464 	jrpl 1$ 
      008999 03 01            [ 1] 1465 	cpl (SIGN,sp)
      00899B 50               [ 2] 1466 	negw x 	 
      00899C                       1467 1$:	
      00899C C6 00 08         [ 1] 1468 	ld a,base 
      00899F 62               [ 2] 1469 	div x,a 
      0089A0 AB 30            [ 1] 1470 	add a,#'0 
      0089A2 A1 3A            [ 1] 1471 	cp a,#'9+1 
      0089A4 2B 02            [ 1] 1472 	jrmi 2$ 
      0089A6 AB 07            [ 1] 1473 	add a,#7 
      0089A8 90 5A            [ 2] 1474 2$: decw y 
      0089AA 90 F7            [ 1] 1475 	ld (y),a 
      0089AC 5D               [ 2] 1476 	tnzw x 
      0089AD 26 ED            [ 1] 1477 	jrne 1$ 
      0089AF A6 10            [ 1] 1478 	ld a,#16 
      0089B1 C1 00 08         [ 1] 1479 	cp a,base 
      0089B4 26 08            [ 1] 1480 	jrne 3$
      0089B6 A6 24            [ 1] 1481 	ld a,#'$
      0089B8 90 5A            [ 2] 1482 	decw y  
      0089BA 90 F7            [ 1] 1483 	ld (y),a
      0089BC 20 0A            [ 2] 1484 	jra 9$ 
      0089BE 0D 01            [ 1] 1485 3$: tnz (SIGN,sp)
      0089C0 27 06            [ 1] 1486 	jreq 9$ 
      0089C2 A6 2D            [ 1] 1487 	ld a,#'-
      0089C4 90 5A            [ 2] 1488 	decw y  
      0089C6 90 F7            [ 1] 1489 	ld (y),a
      0089C8                       1490 9$:	
      0089C8 93               [ 1] 1491 	ldw x,y 
      0089C9 1D 17 3F         [ 2] 1492 	subw x,#pad+PAD_SIZE-1 
      0089CC 50               [ 2] 1493 	negw x  
      0089CD                       1494 10$:
      0089CD 90 5A            [ 2] 1495 	decw y 
      0089CF A6 20            [ 1] 1496 	ld a,#SPACE 
      0089D1 90 F7            [ 1] 1497 	ld (y),a
      0089D3 5C               [ 1] 1498 	incw x 
      0089D4 9F               [ 1] 1499 	ld a,xl 
      0089D5 C1 00 26         [ 1] 1500 	cp a,tab_width
      0089D8 2B F3            [ 1] 1501 	jrmi 10$ 
      0089DA                       1502 12$:
      0089DA 93               [ 1] 1503     ldw x,y 
      0089DB CD 82 B0         [ 4] 1504 	call puts  
      00095E                       1505 	_drop VSIZE 
      0089DE 5B 01            [ 2]    1     addw sp,#VSIZE 
      0089E0 81               [ 4] 1506 	ret 
                                   1507 
                                   1508 ;------------------------------------
                                   1509 ; convert integer to string
                                   1510 ; input:
                                   1511 ;   A	  	base
                                   1512 ;	acc24	integer to convert
                                   1513 ; output:
                                   1514 ;   X  		pointer to string
                                   1515 ;------------------------------------
                           000001  1516 	SIGN=1  ; integer sign 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                           000002  1517 	BASE=2  ; numeric base 
                           000002  1518 	VSIZE=2  ;locals size
      0089E1                       1519 itoa:
      0089E1 52 02            [ 2] 1520 	sub sp,#VSIZE
      0089E3 6B 02            [ 1] 1521 	ld (BASE,sp), a  ; base
      0089E5 0F 01            [ 1] 1522 	clr (SIGN,sp)    ; sign
      0089E7 A1 0A            [ 1] 1523 	cp a,#10
      0089E9 26 0A            [ 1] 1524 	jrne 1$
                                   1525 	; base 10 string display with negative sign if bit 23==1
      0089EB 72 0F 00 09 05   [ 2] 1526 	btjf acc24,#7,1$
      0089F0 03 01            [ 1] 1527 	cpl (SIGN,sp)
      0089F2 CD 8A 50         [ 4] 1528 	call neg_acc24
      0089F5                       1529 1$:
                                   1530 ; initialize string pointer 
      0089F5 AE 17 3F         [ 2] 1531 	ldw x,#pad+PAD_SIZE-1
      0089F8 7F               [ 1] 1532 	clr (x)
      0089F9                       1533 itoa_loop:
      0089F9 7B 02            [ 1] 1534     ld a,(BASE,sp)
      0089FB CD 8A 28         [ 4] 1535     call divu24_8 ; acc24/A 
      0089FE AB 30            [ 1] 1536     add a,#'0  ; remainder of division
      008A00 A1 3A            [ 1] 1537     cp a,#'9+1
      008A02 2B 02            [ 1] 1538     jrmi 2$
      008A04 AB 07            [ 1] 1539     add a,#7 
      008A06 5A               [ 2] 1540 2$: decw x
      008A07 F7               [ 1] 1541     ld (x),a
                                   1542 	; if acc24==0 conversion done
      008A08 C6 00 09         [ 1] 1543 	ld a,acc24
      008A0B CA 00 0A         [ 1] 1544 	or a,acc16
      008A0E CA 00 0B         [ 1] 1545 	or a,acc8
      008A11 26 E6            [ 1] 1546     jrne itoa_loop
                                   1547 	;conversion done, next add '$' or '-' as required
      008A13 7B 02            [ 1] 1548 	ld a,(BASE,sp)
      008A15 A1 10            [ 1] 1549 	cp a,#16
      008A17 27 08            [ 1] 1550 	jreq 8$
      008A19 7B 01            [ 1] 1551 	ld a,(SIGN,sp)
      008A1B 27 08            [ 1] 1552     jreq 10$
      008A1D A6 2D            [ 1] 1553     ld a,#'-
      008A1F 20 02            [ 2] 1554 	jra 9$ 
      008A21 A6 24            [ 1] 1555 8$: ld a,#'$ 
      008A23 5A               [ 2] 1556 9$: decw x
      008A24 F7               [ 1] 1557     ld (x),a
      008A25                       1558 10$:
      008A25 5B 02            [ 2] 1559 	addw sp,#VSIZE
      008A27 81               [ 4] 1560 	ret
                                   1561 
                                   1562 ;-------------------------------------
                                   1563 ; divide uint24_t by uint8_t
                                   1564 ; used to convert uint24_t to string
                                   1565 ; input:
                                   1566 ;	acc24	dividend
                                   1567 ;   A 		divisor
                                   1568 ; output:
                                   1569 ;   acc24	quotient
                                   1570 ;   A		remainder
                                   1571 ;------------------------------------- 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1572 ; offset  on sp of arguments and locals
                           000001  1573 	U8   = 1   ; divisor on stack
                           000001  1574 	VSIZE =1
      008A28                       1575 divu24_8:
      008A28 89               [ 2] 1576 	pushw x ; save x
      008A29 88               [ 1] 1577 	push a 
                                   1578 	; ld dividend UU:MM bytes in X
      008A2A C6 00 09         [ 1] 1579 	ld a, acc24
      008A2D 95               [ 1] 1580 	ld xh,a
      008A2E C6 00 0A         [ 1] 1581 	ld a,acc24+1
      008A31 97               [ 1] 1582 	ld xl,a
      008A32 7B 01            [ 1] 1583 	ld a,(U8,SP) ; divisor
      008A34 62               [ 2] 1584 	div x,a ; UU:MM/U8
      008A35 88               [ 1] 1585 	push a  ;save remainder
      008A36 9E               [ 1] 1586 	ld a,xh
      008A37 C7 00 09         [ 1] 1587 	ld acc24,a
      008A3A 9F               [ 1] 1588 	ld a,xl
      008A3B C7 00 0A         [ 1] 1589 	ld acc24+1,a
      008A3E 84               [ 1] 1590 	pop a
      008A3F 95               [ 1] 1591 	ld xh,a
      008A40 C6 00 0B         [ 1] 1592 	ld a,acc24+2
      008A43 97               [ 1] 1593 	ld xl,a
      008A44 7B 01            [ 1] 1594 	ld a,(U8,sp) ; divisor
      008A46 62               [ 2] 1595 	div x,a  ; R:LL/U8
      008A47 6B 01            [ 1] 1596 	ld (U8,sp),a ; save remainder
      008A49 9F               [ 1] 1597 	ld a,xl
      008A4A C7 00 0B         [ 1] 1598 	ld acc24+2,a
      008A4D 84               [ 1] 1599 	pop a
      008A4E 85               [ 2] 1600 	popw x
      008A4F 81               [ 4] 1601 	ret
                                   1602 
                                   1603 ;------------------------------------
                                   1604 ;  two's complement acc24
                                   1605 ;  input:
                                   1606 ;		acc24 variable
                                   1607 ;  output:
                                   1608 ;		acc24 variable
                                   1609 ;-------------------------------------
      008A50                       1610 neg_acc24:
      008A50 72 53 00 0B      [ 1] 1611 	cpl acc24+2
      008A54 72 53 00 0A      [ 1] 1612 	cpl acc24+1
      008A58 72 53 00 09      [ 1] 1613 	cpl acc24
      008A5C A6 01            [ 1] 1614 	ld a,#1
      008A5E CB 00 0B         [ 1] 1615 	add a,acc24+2
      008A61 C7 00 0B         [ 1] 1616 	ld acc24+2,a
      008A64 4F               [ 1] 1617 	clr a
      008A65 C9 00 0A         [ 1] 1618 	adc a,acc24+1
      008A68 C7 00 0A         [ 1] 1619 	ld acc24+1,a 
      008A6B 4F               [ 1] 1620 	clr a 
      008A6C C9 00 09         [ 1] 1621 	adc a,acc24 
      008A6F C7 00 09         [ 1] 1622 	ld acc24,a 
      008A72 81               [ 4] 1623 	ret
                                   1624 
                                   1625 
                                   1626 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



                                   1627 ; read a line of text from terminal
                                   1628 ; input:
                                   1629 ;	none
                                   1630 ; local variable on stack:
                                   1631 ;	LL (1,sp)
                                   1632 ;   RXCHAR (2,sp)
                                   1633 ; output:
                                   1634 ;   text in tib  buffer
                                   1635 ;------------------------------------
                                   1636 	; local variables
                           000001  1637 	LL_HB=1
                           000001  1638 	RXCHAR = 1 ; last char received
                           000002  1639 	LL = 2  ; accepted line length
                           000002  1640 	VSIZE=2 
      008A73                       1641 readln:
      008A73 5F               [ 1] 1642 	clrw x 
      008A74 89               [ 2] 1643 	pushw x 
      008A75 90 AE 16 C8      [ 2] 1644  	ldw y,#tib ; input buffer
      008A79                       1645 readln_loop:
      008A79 CD 82 A7         [ 4] 1646 	call getc
      008A7C 6B 01            [ 1] 1647 	ld (RXCHAR,sp),a
      008A7E A1 0D            [ 1] 1648 	cp a,#CR
      008A80 26 03            [ 1] 1649 	jrne 1$
      008A82 CC 8A F2         [ 2] 1650 	jp readln_quit
      008A85 A1 0A            [ 1] 1651 1$:	cp a,#NL
      008A87 27 69            [ 1] 1652 	jreq readln_quit
      008A89 A1 08            [ 1] 1653 	cp a,#BSP
      008A8B 27 41            [ 1] 1654 	jreq del_back
      008A8D A1 04            [ 1] 1655 	cp a,#CTRL_D
      008A8F 27 2E            [ 1] 1656 	jreq del_ln
      008A91 A1 12            [ 1] 1657 	cp a,#CTRL_R 
      008A93 27 06            [ 1] 1658 	jreq reprint 
                                   1659 ;	cp a,#'[
                                   1660 ;	jreq ansi_seq
      008A95                       1661 final_test:
      008A95 A1 20            [ 1] 1662 	cp a,#SPACE
      008A97 2A 44            [ 1] 1663 	jrpl accept_char
      008A99 20 DE            [ 2] 1664 	jra readln_loop
      008A9B                       1665 ansi_seq:
                                   1666 ;	call getc
                                   1667 ;	cp a,#'C 
                                   1668 ;	jreq rigth_arrow
                                   1669 ;	cp a,#'D 
                                   1670 ;	jreq left_arrow 
                                   1671 ;	jra final_test
      008A9B                       1672 right_arrow:
                                   1673 ;	ld a,#BSP 
                                   1674 ;	call putc 
                                   1675 ;	jra realn_loop 
      008A9B                       1676 left_arrow:
                                   1677 
                                   1678 ;	jra readln_loop
      008A9B                       1679 reprint: 
      008A9B 72 5D 00 03      [ 1] 1680 	tnz count 
      008A9F 27 D8            [ 1] 1681 	jreq readln_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008AA1 0D 02            [ 1] 1682 	tnz (LL,sp)
      008AA3 26 D4            [ 1] 1683 	jrne readln_loop
      008AA5 AE 16 C8         [ 2] 1684 	ldw x,#tib 
      008AA8 CD 82 B0         [ 4] 1685 	call puts
      008AAB 90 AE 16 C8      [ 2] 1686 	ldw y,#tib 
      008AAF C6 00 03         [ 1] 1687 	ld a,count 
      008AB2 6B 02            [ 1] 1688 	ld (LL,sp),a
      008AB4 72 5F 00 03      [ 1] 1689 	clr count 
      008AB8 0F 01            [ 1] 1690 	clr (LL_HB,sp)
      008ABA 72 F9 01         [ 2] 1691 	addw y,(LL_HB,sp)
      008ABD 20 BA            [ 2] 1692 	jra readln_loop 
      008ABF                       1693 del_ln:
      008ABF 7B 02            [ 1] 1694 	ld a,(LL,sp)
      008AC1 CD 82 CA         [ 4] 1695 	call delete
      008AC4 90 AE 16 C8      [ 2] 1696 	ldw y,#tib
      008AC8 90 7F            [ 1] 1697 	clr (y)
      008ACA 0F 02            [ 1] 1698 	clr (LL,sp)
      008ACC 20 AB            [ 2] 1699 	jra readln_loop
      008ACE                       1700 del_back:
      008ACE 0D 02            [ 1] 1701     tnz (LL,sp)
      008AD0 27 A7            [ 1] 1702     jreq readln_loop
      008AD2 0A 02            [ 1] 1703     dec (LL,sp)
      008AD4 90 5A            [ 2] 1704     decw y
      008AD6 90 7F            [ 1] 1705     clr  (y)
      008AD8 CD 82 BA         [ 4] 1706     call bksp 
      008ADB 20 9C            [ 2] 1707     jra readln_loop	
      008ADD                       1708 accept_char:
      008ADD A6 4F            [ 1] 1709 	ld a,#TIB_SIZE-1
      008ADF 11 02            [ 1] 1710 	cp a, (LL,sp)
      008AE1 27 96            [ 1] 1711 	jreq readln_loop
      008AE3 7B 01            [ 1] 1712 	ld a,(RXCHAR,sp)
      008AE5 90 F7            [ 1] 1713 	ld (y),a
      008AE7 0C 02            [ 1] 1714 	inc (LL,sp)
      008AE9 90 5C            [ 1] 1715 	incw y
      008AEB 90 7F            [ 1] 1716 	clr (y)
      008AED CD 82 9E         [ 4] 1717 	call putc 
      008AF0 20 87            [ 2] 1718 	jra readln_loop
      008AF2                       1719 readln_quit:
      008AF2 90 7F            [ 1] 1720 	clr (y)
      008AF4 7B 02            [ 1] 1721 	ld a,(LL,sp)
      008AF6 C7 00 03         [ 1] 1722 	ld count,a 
      000A79                       1723 	_drop VSIZE 
      008AF9 5B 02            [ 2]    1     addw sp,#VSIZE 
      008AFB A6 0D            [ 1] 1724 	ld a,#CR
      008AFD CD 82 9E         [ 4] 1725 	call putc
      008B00 81               [ 4] 1726 	ret
                                   1727 
                           000001  1728 .if DEBUG 	
                                   1729 ;----------------------------
                                   1730 ; command interface
                                   1731 ; only 2 commands:
                                   1732 ;  'q' to resume application
                                   1733 ;  'p [addr]' to print memory values 
                                   1734 ;  's addr' to print string 
                                   1735 ;----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                                   1736 ;local variable 
                           000001  1737 	PSIZE=1
                           000001  1738 	VSIZE=1 
      008B01                       1739 cmd_itf:
      008B01 52 01            [ 2] 1740 	sub sp,#VSIZE 
      008B03 72 5F 00 14      [ 1] 1741 	clr farptr 
      008B07 72 5F 00 15      [ 1] 1742 	clr farptr+1 
      008B0B 72 5F 00 16      [ 1] 1743 	clr farptr+2  
      008B0F                       1744 repl:
      008B0F A6 0D            [ 1] 1745 	ld a,#CR 
      008B11 CD 82 9E         [ 4] 1746 	call putc 
      008B14 A6 3F            [ 1] 1747 	ld a,#'? 
      008B16 CD 82 9E         [ 4] 1748 	call putc
      008B19 72 5F 00 01      [ 1] 1749 	clr in.w 
      008B1D 72 5F 00 02      [ 1] 1750 	clr in 
      008B21 CD 8A 73         [ 4] 1751 	call readln
      008B24 CD 8C FD         [ 4] 1752 	call get_token
      008B27 90 AE 17 18      [ 2] 1753 	ldw y,#pad 
      008B2B 90 F6            [ 1] 1754 	ld a,(y)
      008B2D 90 5C            [ 1] 1755 	incw y
      008B2F A1 51            [ 1] 1756 	cp a,#'Q 
      008B31 26 0B            [ 1] 1757 	jrne test_p
      008B33                       1758 repl_exit:
      000AB3                       1759 	_drop #VSIZE 	
      008B33 5B 01            [ 2]    1     addw sp,##VSIZE 
      008B35 81               [ 4] 1760 	ret  
      008B36                       1761 invalid:
      008B36 AE 8B A4         [ 2] 1762 	ldw x,#invalid_cmd 
      008B39 CD 82 B0         [ 4] 1763 	call puts 
      008B3C 20 D1            [ 2] 1764 	jra repl 
      008B3E                       1765 test_p:	
      008B3E A1 50            [ 1] 1766     cp a,#'P 
      008B40 27 10            [ 1] 1767 	jreq mem_peek
      008B42 A1 53            [ 1] 1768     cp a,#'S 
      008B44 26 F0            [ 1] 1769 	jrne invalid 
      008B46                       1770 print_string:	
      008B46 CD 8C FD         [ 4] 1771 	call get_token
      008B49 CE 00 0A         [ 2] 1772 	ldw x,acc16 
      008B4C CD 82 B0         [ 4] 1773 	call puts
      008B4F CC 8B 0F         [ 2] 1774 	jp repl 	
      008B52                       1775 mem_peek:	 
      008B52 CD 8C FD         [ 4] 1776 	call get_token
      008B55 C6 00 09         [ 1] 1777 	ld a, acc24 
      008B58 CA 00 0A         [ 1] 1778 	or a,acc16 
      008B5B CA 00 0B         [ 1] 1779 	or a,acc8 
      008B5E 26 02            [ 1] 1780 	jrne 1$ 
      008B60 20 0C            [ 2] 1781 	jra peek_byte  
      008B62 CE 00 09         [ 2] 1782 1$:	ldw x,acc24 
      008B65 CF 00 14         [ 2] 1783 	ldw farptr,x 
      008B68 C6 00 0B         [ 1] 1784 	ld a,acc8 
      008B6B C7 00 16         [ 1] 1785 	ld farptr+2,a 
      008B6E                       1786 peek_byte:
      008B6E CD 8B B3         [ 4] 1787 	call print_farptr 
      008B71 A6 08            [ 1] 1788 	ld a,#8 
      008B73 6B 01            [ 1] 1789 	ld (PSIZE,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008B75 5F               [ 1] 1790 	clrw x 
      008B76 CD 8B CE         [ 4] 1791 1$:	call fetchc  
      008B79 89               [ 2] 1792 	pushw x 
      008B7A C7 00 0B         [ 1] 1793 	ld acc8,a 
      008B7D 5F               [ 1] 1794 	clrw x 
      008B7E CF 00 09         [ 2] 1795 	ldw acc24,x 
      008B81 A6 90            [ 1] 1796 	ld a,#16+128
      008B83 CD 89 30         [ 4] 1797 	call prti24
      008B86 85               [ 2] 1798 	popw x 
      008B87 0A 01            [ 1] 1799 	dec (PSIZE,sp)
      008B89 26 EB            [ 1] 1800 	jrne 1$ 
      008B8B A6 08            [ 1] 1801 	ld a,#8 
      008B8D CB 00 16         [ 1] 1802 	add a,farptr+2 
      008B90 C7 00 16         [ 1] 1803 	ld farptr+2,a
      008B93 4F               [ 1] 1804 	clr a 
      008B94 C9 00 15         [ 1] 1805 	adc a,farptr+1 
      008B97 C7 00 15         [ 1] 1806 	ld farptr+1,a 
      008B9A 4F               [ 1] 1807 	clr a 
      008B9B C9 00 14         [ 1] 1808 	adc a,farptr 
      008B9E C7 00 14         [ 1] 1809 	ld farptr,a 
      008BA1 CC 8B 0F         [ 2] 1810 	jp repl  
                                   1811 
                                   1812 
      008BA4 6E 6F 74 20 61 20 63  1813 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1814 
                                   1815 ;----------------------------
                                   1816 ; display farptr address
                                   1817 ;----------------------------
      008BB3                       1818 print_farptr:
      008BB3 C6 00 16         [ 1] 1819 	ld a ,farptr+2 
      008BB6 C7 00 0B         [ 1] 1820 	ld acc8,a 
      008BB9 CE 00 14         [ 2] 1821 	ldw x,farptr 
      008BBC CF 00 09         [ 2] 1822 	ldw acc24,x 
      008BBF 5F               [ 1] 1823 	clrw x 
      008BC0 A6 10            [ 1] 1824 	ld a,#16 
      008BC2 CD 89 30         [ 4] 1825 	call prti24
      008BC5 A6 20            [ 1] 1826 	ld a,#SPACE 
      008BC7 CD 82 9E         [ 4] 1827 	call putc 
      008BCA CD 82 9E         [ 4] 1828 	call putc 
      008BCD 81               [ 4] 1829 	ret
                                   1830 
                                   1831 ;------------------------------------
                                   1832 ; get byte at address farptr[X]
                                   1833 ; input:
                                   1834 ;	 farptr   address to peek
                                   1835 ;    X		  farptr index 	
                                   1836 ; output:
                                   1837 ;	 A 		  byte from memory  
                                   1838 ;    x		  incremented by 1
                                   1839 ;------------------------------------
      008BCE                       1840 fetchc: ; @C
      008BCE 92 AF 00 14      [ 5] 1841 	ldf a,([farptr],x)
      008BD2 5C               [ 1] 1842 	incw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      008BD3 81               [ 4] 1843 	ret
                                   1844 
                                   1845 
                                   1846 ;------------------------------------
                                   1847 ; expect a number from command line 
                                   1848 ; next argument
                                   1849 ;  input:
                                   1850 ;	  none
                                   1851 ;  output:
                                   1852 ;    acc24   int24_t 
                                   1853 ;------------------------------------
      008BD4                       1854 number::
      008BD4 CD 8C FD         [ 4] 1855 	call get_token
      008BD7 CD 8E F1         [ 4] 1856 	call atoi
      008BDA 81               [ 4] 1857 	ret
                                   1858 .endif
                                   1859 
                                   1860 ;------------------------------------
                                   1861 ; parse quoted string 
                                   1862 ; input:
                                   1863 ;   Y 	pointer to tib 
                                   1864 ;   X   pointer to pad
                                   1865 ; output:
                                   1866 ;	pad   parsed string
                                   1867 ;   TOS  char* to pad  
                                   1868 ;------------------------------------
                           000001  1869 	PREV = 1
                           000002  1870 	CURR =2 
                           000002  1871 	VSIZE=2 
      008BDB                       1872 parse_quote: ; { -- addr }
      000B5B                       1873 	_vars VSIZE 
      008BDB 52 02            [ 2]    1     sub sp,#VSIZE 
      008BDD 4F               [ 1] 1874 	clr a
      008BDE 6B 01            [ 1] 1875 1$:	ld (PREV,sp),a 
      008BE0 72 5C 00 02      [ 1] 1876 2$:	inc in
      008BE4 91 D6 01         [ 4] 1877 	ld a,([in.w],y)
      008BE7 27 24            [ 1] 1878 	jreq 6$
      008BE9 6B 02            [ 1] 1879 	ld (CURR,sp),a 
      008BEB A6 5C            [ 1] 1880 	ld a,#'\
      008BED 11 01            [ 1] 1881 	cp a, (PREV,sp)
      008BEF 26 0A            [ 1] 1882 	jrne 3$
      008BF1 0F 01            [ 1] 1883 	clr (PREV,sp)
      008BF3 7B 02            [ 1] 1884 	ld a,(CURR,sp)
      008BF5 AD 1F            [ 4] 1885 	callr convert_escape
      008BF7 F7               [ 1] 1886 	ld (x),a 
      008BF8 5C               [ 1] 1887 	incw x 
      008BF9 20 E5            [ 2] 1888 	jra 2$
      008BFB                       1889 3$:
      008BFB 7B 02            [ 1] 1890 	ld a,(CURR,sp)
      008BFD A1 5C            [ 1] 1891 	cp a,#'\'
      008BFF 27 DD            [ 1] 1892 	jreq 1$
      008C01 A1 22            [ 1] 1893 	cp a,#'"
      008C03 27 04            [ 1] 1894 	jreq 5$ 
      008C05 F7               [ 1] 1895 	ld (x),a 
      008C06 5C               [ 1] 1896 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008C07 20 D7            [ 2] 1897 	jra 2$
      008C09 72 5C 00 02      [ 1] 1898 5$:	inc in 
      008C0D 7F               [ 1] 1899 6$: clr (x)
      008C0E AE 17 18         [ 2] 1900 	ldw x,#pad 
      000B91                       1901 	_drop VSIZE
      008C11 5B 02            [ 2]    1     addw sp,#VSIZE 
      008C13 A6 06            [ 1] 1902 	ld a,#TK_QSTR  
      008C15 81               [ 4] 1903 	ret 
                                   1904 
                                   1905 ;---------------------------------------
                                   1906 ; called by parse_quote
                                   1907 ; subtitute escaped character 
                                   1908 ; by their ASCII value .
                                   1909 ; input:
                                   1910 ;   A  character following '\'
                                   1911 ; output:
                                   1912 ;   A  substitued char or same if not valid.
                                   1913 ;---------------------------------------
      008C16                       1914 convert_escape:
      008C16 A1 61            [ 1] 1915 	cp a,#'a'
      008C18 26 03            [ 1] 1916 	jrne 1$
      008C1A A6 07            [ 1] 1917 	ld a,#7
      008C1C 81               [ 4] 1918 	ret 
      008C1D A1 62            [ 1] 1919 1$: cp a,#'b'
      008C1F 26 03            [ 1] 1920 	jrne 2$
      008C21 A6 08            [ 1] 1921 	ld a,#8
      008C23 81               [ 4] 1922 	ret 
      008C24 A1 65            [ 1] 1923 2$: cp a,#'e' 
      008C26 26 03            [ 1] 1924     jrne 3$
      008C28 A6 5C            [ 1] 1925 	ld a,#'\'
      008C2A 81               [ 4] 1926 	ret  
      008C2B A1 5C            [ 1] 1927 3$: cp a,#'\'
      008C2D 26 03            [ 1] 1928 	jrne 4$
      008C2F A6 5C            [ 1] 1929 	ld a,#'\'
      008C31 81               [ 4] 1930 	ret 
      008C32 A1 66            [ 1] 1931 4$: cp a,#'f' 
      008C34 26 03            [ 1] 1932 	jrne 5$ 
      008C36 A6 0C            [ 1] 1933 	ld a,#FF 
      008C38 81               [ 4] 1934 	ret  
      008C39 A1 6E            [ 1] 1935 5$: cp a,#'n' 
      008C3B 26 03            [ 1] 1936     jrne 6$ 
      008C3D A6 0A            [ 1] 1937 	ld a,#0xa 
      008C3F 81               [ 4] 1938 	ret  
      008C40 A1 72            [ 1] 1939 6$: cp a,#'r' 
      008C42 26 03            [ 1] 1940 	jrne 7$
      008C44 A6 0D            [ 1] 1941 	ld a,#0xd 
      008C46 81               [ 4] 1942 	ret  
      008C47 A1 74            [ 1] 1943 7$: cp a,#'t' 
      008C49 26 03            [ 1] 1944 	jrne 8$ 
      008C4B A6 09            [ 1] 1945 	ld a,#9 
      008C4D 81               [ 4] 1946 	ret  
      008C4E A1 76            [ 1] 1947 8$: cp a,#'v' 
      008C50 26 02            [ 1] 1948 	jrne 9$  
      008C52 A6 0B            [ 1] 1949 	ld a,#0xb 
      008C54 81               [ 4] 1950 9$:	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                                   1951 
                                   1952 ;-------------------------
                                   1953 ; integer parser 
                                   1954 ; input:
                                   1955 ;   X 		point to pad 
                                   1956 ;   Y 		point to tib 
                                   1957 ;   A 	    first digit|'$' 
                                   1958 ; output:  
                                   1959 ;   pad     number string 
                                   1960 ;   X 		integer 
                                   1961 ;   A 		TK_INTGR
                                   1962 ;   TOS     integer 
                                   1963 ;-------------------------
                           000001  1964 	BASE=1
                           000002  1965 	TCHAR=2 
                           000002  1966 	VSIZE=2 
      008C55                       1967 parse_integer: ; { -- n }
      008C55 4B 00            [ 1] 1968 	push #0 ; TCHAR 
      008C57 A1 24            [ 1] 1969 	cp a,#'$
      008C59 27 04            [ 1] 1970 	jreq 1$ 
      008C5B 4B 0A            [ 1] 1971 	push #10 ; BASE=10 
      008C5D 20 02            [ 2] 1972 	jra 2$ 
      008C5F 4B 10            [ 1] 1973 1$: push #16  ; BASE=16
      008C61 F7               [ 1] 1974 2$:	ld (x),a 
      008C62 5C               [ 1] 1975 	incw x 
      008C63 72 5C 00 02      [ 1] 1976 	inc in 
      008C67 91 D6 01         [ 4] 1977 	ld a,([in.w],y)
      008C6A CD 8E CC         [ 4] 1978 	call to_upper 
      008C6D 6B 02            [ 1] 1979 	ld (TCHAR,sp),a 
      008C6F CD 8E B8         [ 4] 1980 	call is_digit 
      008C72 25 ED            [ 1] 1981 	jrc 2$
      008C74 A6 10            [ 1] 1982 	ld a,#16 
      008C76 11 01            [ 1] 1983 	cp a,(BASE,sp)
      008C78 26 0A            [ 1] 1984 	jrne 3$ 
      008C7A 7B 02            [ 1] 1985 	ld a,(TCHAR,sp)
      008C7C A1 41            [ 1] 1986 	cp a,#'A 
      008C7E 2B 04            [ 1] 1987 	jrmi 3$ 
      008C80 A1 47            [ 1] 1988 	cp a,#'G 
      008C82 2B DD            [ 1] 1989 	jrmi 2$ 
      008C84 7F               [ 1] 1990 3$:	clr (x)
      008C85 CD 8E F1         [ 4] 1991 	call atoi
      008C88 CE 00 0A         [ 2] 1992 	ldw x,acc16 
      008C8B A6 0A            [ 1] 1993 	ld a,#TK_INTGR
      000C0D                       1994 	_drop VSIZE  
      008C8D 5B 02            [ 2]    1     addw sp,#VSIZE 
      008C8F 81               [ 4] 1995 	ret 	
                                   1996 
                                   1997 ;-------------------------
                                   1998 ; binary integer parser 
                                   1999 ; input:
                                   2000 ;   X 		point to pad 
                                   2001 ;   Y 		point to tib 
                                   2002 ;   A 	    '%' 
                                   2003 ; output:  
                                   2004 ;   pad     number string 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2005 ;   X 		integer 
                                   2006 ;   A 		TK_INTGR
                                   2007 ;   TOS     integer 
                                   2008 ;-------------------------
                           000001  2009 	BINARY=1
                           000002  2010 	VSIZE=2
      008C90                       2011 parse_binary: ; { -- n }
      008C90 4B 00            [ 1] 2012 	push #0
      008C92 4B 00            [ 1] 2013 	push #0
      008C94 F7               [ 1] 2014 1$: ld (x),a 
      008C95 5C               [ 1] 2015 	incw x 
      008C96 72 5C 00 02      [ 1] 2016 	inc in 
      008C9A 91 D6 01         [ 4] 2017 	ld a,([in.w],y)
      008C9D A1 30            [ 1] 2018 	cp a,#'0 
      008C9F 27 06            [ 1] 2019 	jreq 2$
      008CA1 A1 31            [ 1] 2020 	cp a,#'1 
      008CA3 27 02            [ 1] 2021 	jreq 2$ 
      008CA5 20 09            [ 2] 2022 	jra bin_exit 
      008CA7 A0 30            [ 1] 2023 2$: sub a,#'0	
      008CA9 46               [ 1] 2024 	rrc a 
      008CAA 09 02            [ 1] 2025 	rlc (BINARY+1,sp)
      008CAC 09 01            [ 1] 2026 	rlc (BINARY,sp)
      008CAE 20 E4            [ 2] 2027 	jra 1$  
      008CB0                       2028 bin_exit:
      008CB0 7F               [ 1] 2029 	clr (x)
      008CB1 1E 01            [ 2] 2030 	ldw x,(BINARY,sp)
      008CB3 A6 0A            [ 1] 2031 	ld a,#TK_INTGR 	
      000C35                       2032 	_drop VSIZE 
      008CB5 5B 02            [ 2]    1     addw sp,#VSIZE 
      008CB7 81               [ 4] 2033 	ret
                                   2034 
                                   2035 ;---------------------------
                                   2036 ;  token begin with a letter,
                                   2037 ;  is keyword or variable. 	
                                   2038 ; input:
                                   2039 ;   X 		point to pad 
                                   2040 ;   Y 		point to text
                                   2041 ;   A 	    first letter  
                                   2042 ; output:
                                   2043 ;   X		exec_addr|var_addr 
                                   2044 ;   A 		TK_CMD 
                                   2045 ;   pad 	keyword|var_name  
                                   2046 ;   TOS     exec_addr|var_addr 
                                   2047 ;--------------------------  
      008CB8                       2048 parse_keyword: ; { -- exec_addr|var_addr}
      008CB8 CD 8E CC         [ 4] 2049 	call to_upper 
      008CBB F7               [ 1] 2050 	ld (x),a 
      008CBC 5C               [ 1] 2051 	incw x 
      008CBD 72 5C 00 02      [ 1] 2052 	inc in 
      008CC1 91 D6 01         [ 4] 2053 	ld a,([in.w],y)
      008CC4 CD 84 F8         [ 4] 2054 	call is_alpha 
      008CC7 25 EF            [ 1] 2055 	jrc parse_keyword 
      008CC9 7F               [ 1] 2056 1$: clr (x)
      008CCA 72 5D 17 19      [ 1] 2057 	tnz pad+1 
      008CCE 26 15            [ 1] 2058 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



                                   2059 ; one letter variable name 
      008CD0 C6 17 18         [ 1] 2060 	ld a,pad 
      008CD3 A0 41            [ 1] 2061 	sub a,#'A 
      008CD5 48               [ 1] 2062 	sll a 
      008CD6 88               [ 1] 2063 	push a 
      008CD7 4B 00            [ 1] 2064 	push #0
      008CD9 AE 00 27         [ 2] 2065 	ldw x,#vars 
      008CDC 72 FB 01         [ 2] 2066 	addw x,(1,sp) ; X=var address 
      000C5F                       2067 	_drop 2 
      008CDF 5B 02            [ 2]    1     addw sp,#2 
      008CE1 A6 02            [ 1] 2068 	ld a,#TK_VAR 
      008CE3 20 17            [ 2] 2069 	jra 4$ 
      008CE5                       2070 2$: ; check for keyword, otherwise syntax error.
      000C65                       2071 	_ldx_dict kword_dict
      008CE5 AE 9E 74         [ 2]    1     ldw x,#kword_dict+2
      008CE8 CD 91 64         [ 4] 2072 	call search_dict
      008CEB 4D               [ 1] 2073 	tnz a
      008CEC 26 03            [ 1] 2074 	jrne 3$ 
      008CEE CC 87 21         [ 2] 2075 	jp syntax_error
      008CF1 A3 95 60         [ 2] 2076 3$: cpw x,#rem  
      008CF4 26 06            [ 1] 2077 	jrne 4$
      008CF6 55 00 03 00 02   [ 1] 2078 	mov in,count 
      008CFB 4F               [ 1] 2079 	clr a 
      008CFC 81               [ 4] 2080 4$:	ret  	
                                   2081 
                                   2082 
                                   2083 ;------------------------------------
                                   2084 ; Command line tokenizer
                                   2085 ; scan text for next token
                                   2086 ; move token in 'pad'
                                   2087 ; input: 
      008CFD                       2088 	none: 
                                   2089 ; use:
                                   2090 ;	Y   pointer to text
                                   2091 ;   X	pointer to pad 
                                   2092 ;   in.w   index in text buffer
                                   2093 ; output:
                                   2094 ;   A       token attribute 
                                   2095 ;   pad 	token as .asciz
                                   2096 ;   X 		token value   
                                   2097 ;------------------------------------
                                   2098 	; use to check special character 
                                   2099 	.macro _case c t  
                                   2100 	ld a,#c 
                                   2101 	cp a,(TCHAR,sp) 
                                   2102 	jrne t
                                   2103 	.endm 
                                   2104 
                           000001  2105 	TCHAR=1
                           000002  2106 	ATTRIB=2 
                           000002  2107 	VSIZE=2
      008CFD                       2108 get_token: 
      008CFD CE 00 01         [ 2] 2109 	ldw x,in.w 
      008D00 CF 00 12         [ 2] 2110 	ldw in.w.saved,x 
      008D03 90 CE 00 04      [ 2] 2111 	ldw y,basicptr   	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008D07 C6 00 02         [ 1] 2112 	ld a,in 
      008D0A C1 00 03         [ 1] 2113 	cp a,count 
      008D0D 2B 03            [ 1] 2114 	jrmi 1$
      008D0F A6 00            [ 1] 2115 	ld a,#TK_NONE 
      008D11 81               [ 4] 2116 	ret 
      008D12                       2117 1$:	
      000C92                       2118 	_vars VSIZE
      008D12 52 02            [ 2]    1     sub sp,#VSIZE 
      008D14 AE 17 18         [ 2] 2119 	ldw x, #pad
      008D17 A6 20            [ 1] 2120 	ld a,#SPACE
      008D19 CD 8F 9D         [ 4] 2121 	call skip
      008D1C 91 D6 01         [ 4] 2122 	ld a,([in.w],y)
      008D1F 26 07            [ 1] 2123 	jrne str_tst
      008D21 72 5F 17 18      [ 1] 2124 	clr pad 
      008D25 CC 8E B5         [ 2] 2125 	jp token_exit ; end of line 
                                   2126 
      008D28                       2127 str_tst: ; check for quoted string  	
      008D28 CD 8E CC         [ 4] 2128 	call to_upper 
      008D2B 6B 01            [ 1] 2129 	ld (TCHAR,sp),a 
      000CAD                       2130 	_case '"' nbr_tst
      008D2D A6 22            [ 1]    1 	ld a,#'"' 
      008D2F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D31 26 06            [ 1]    3 	jrne nbr_tst
      008D33 CD 8B DB         [ 4] 2131 	call parse_quote
      008D36 CC 8E B5         [ 2] 2132 	jp token_exit
      008D39                       2133 nbr_tst: ; check for number 
      008D39 A6 24            [ 1] 2134 	ld a,#'$'
      008D3B 11 01            [ 1] 2135 	cp a,(TCHAR,sp) 
      008D3D 27 13            [ 1] 2136 	jreq 1$
      008D3F A6 26            [ 1] 2137 	ld a,#'&
      008D41 11 01            [ 1] 2138 	cp a,(TCHAR,sp)
      008D43 26 06            [ 1] 2139 	jrne 0$
      008D45 CD 8C 90         [ 4] 2140 	call parse_binary ; expect binary integer 
      008D48 CC 8E B5         [ 2] 2141 	jp token_exit 
      008D4B 7B 01            [ 1] 2142 0$:	ld a,(TCHAR,sp)
      008D4D CD 8E B8         [ 4] 2143 	call is_digit
      008D50 24 06            [ 1] 2144 	jrnc 3$
      008D52 CD 8C 55         [ 4] 2145 1$:	call parse_integer 
      008D55 CC 8E B5         [ 2] 2146 	jp token_exit 
      008D58                       2147 3$: 
      000CD8                       2148 	_case '(' bkslsh_tst 
      008D58 A6 28            [ 1]    1 	ld a,#'(' 
      008D5A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D5C 26 05            [ 1]    3 	jrne bkslsh_tst
      008D5E A6 04            [ 1] 2149 	ld a,#TK_LPAREN
      008D60 CC 8E A5         [ 2] 2150 	jp token_char   	
      008D63                       2151 bkslsh_tst:
      000CE3                       2152 	_case '\',rparnt_tst
      008D63 A6 5C            [ 1]    1 	ld a,#'\' 
      008D65 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D67 26 18            [ 1]    3 	jrne rparnt_tst
      008D69 7B 01            [ 1] 2153 	ld a,(TCHAR,sp)
      008D6B F7               [ 1] 2154 	ld (x),a 
      008D6C 5C               [ 1] 2155 	incw x 
      008D6D 72 5C 00 02      [ 1] 2156 	inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008D71 91 D6 01         [ 4] 2157 	ld a,([in.w],y)
      008D74 F7               [ 1] 2158 	ld (x),a 
      008D75 5C               [ 1] 2159 	incw x 
      008D76 72 5C 00 02      [ 1] 2160 	inc in  
      008D7A 7F               [ 1] 2161 	clr (x) 
      008D7B 97               [ 1] 2162 	ld xl,a 
      008D7C A6 0B            [ 1] 2163 	ld a,#TK_CHAR 
      008D7E CC 8E B5         [ 2] 2164 	jp token_exit 
      008D81                       2165 rparnt_tst:		
      000D01                       2166 	_case ')' colon_tst 
      008D81 A6 29            [ 1]    1 	ld a,#')' 
      008D83 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D85 26 05            [ 1]    3 	jrne colon_tst
      008D87 A6 05            [ 1] 2167 	ld a,#TK_RPAREN 
      008D89 CC 8E A5         [ 2] 2168 	jp token_char 
      008D8C                       2169 colon_tst:
      000D0C                       2170 	_case ':' comma_tst 
      008D8C A6 3A            [ 1]    1 	ld a,#':' 
      008D8E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D90 26 05            [ 1]    3 	jrne comma_tst
      008D92 A6 01            [ 1] 2171 	ld a,#TK_COLON 
      008D94 CC 8E A5         [ 2] 2172 	jp token_char 
      008D97                       2173 comma_tst:
      000D17                       2174 	_case COMMA sharp_tst 
      008D97 A6 2C            [ 1]    1 	ld a,#COMMA 
      008D99 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D9B 26 05            [ 1]    3 	jrne sharp_tst
      008D9D A6 08            [ 1] 2175 	ld a,#TK_COMMA
      008D9F CC 8E A5         [ 2] 2176 	jp token_char
      008DA2                       2177 sharp_tst:
      000D22                       2178 	_case SHARP dash_tst 
      008DA2 A6 23            [ 1]    1 	ld a,#SHARP 
      008DA4 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA6 26 05            [ 1]    3 	jrne dash_tst
      008DA8 A6 09            [ 1] 2179 	ld a,#TK_SHARP
      008DAA CC 8E A5         [ 2] 2180 	jp token_char  	 	 
      008DAD                       2181 dash_tst: 	
      000D2D                       2182 	_case '-' at_tst 
      008DAD A6 2D            [ 1]    1 	ld a,#'-' 
      008DAF 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB1 26 05            [ 1]    3 	jrne at_tst
      008DB3 A6 11            [ 1] 2183 	ld a,#TK_MINUS  
      008DB5 CC 8E A5         [ 2] 2184 	jp token_char 
      008DB8                       2185 at_tst:
      000D38                       2186 	_case '@' qmark_tst 
      008DB8 A6 40            [ 1]    1 	ld a,#'@' 
      008DBA 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DBC 26 05            [ 1]    3 	jrne qmark_tst
      008DBE A6 03            [ 1] 2187 	ld a,#TK_ARRAY 
      008DC0 CC 8E A5         [ 2] 2188 	jp token_char
      008DC3                       2189 qmark_tst:
      000D43                       2190 	_case '?' tick_tst 
      008DC3 A6 3F            [ 1]    1 	ld a,#'?' 
      008DC5 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC7 26 11            [ 1]    3 	jrne tick_tst
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008DC9 7B 01            [ 1] 2191 	ld a,(TCHAR,sp)
      008DCB F7               [ 1] 2192 	ld (x),a 
      008DCC 5C               [ 1] 2193 	incw x 
      008DCD 7F               [ 1] 2194 	clr (x)
      008DCE 72 5C 00 02      [ 1] 2195 	inc in 
      008DD2 A6 07            [ 1] 2196 	ld a,#TK_CMD 
      008DD4 AE 94 5B         [ 2] 2197 	ldw x,#print 
      008DD7 CC 8E B5         [ 2] 2198 	jp token_exit
      008DDA                       2199 tick_tst: ; ignore comment 
      000D5A                       2200 	_case TICK plus_tst 
      008DDA A6 27            [ 1]    1 	ld a,#TICK 
      008DDC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DDE 26 0E            [ 1]    3 	jrne plus_tst
      008DE0 7B 01            [ 1] 2201 	ld a,(TCHAR,sp)
      008DE2 F7               [ 1] 2202 	ld (x),a 
      008DE3 5C               [ 1] 2203 	incw x 
      008DE4 7F               [ 1] 2204 	clr (x)
      008DE5 55 00 03 00 02   [ 1] 2205 	mov in,count  
      008DEA 4F               [ 1] 2206 	clr a 
      008DEB CC 8E B5         [ 2] 2207 	jp token_exit 
      008DEE                       2208 plus_tst:
      000D6E                       2209 	_case '+' star_tst 
      008DEE A6 2B            [ 1]    1 	ld a,#'+' 
      008DF0 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DF2 26 05            [ 1]    3 	jrne star_tst
      008DF4 A6 10            [ 1] 2210 	ld a,#TK_PLUS  
      008DF6 CC 8E A5         [ 2] 2211 	jp token_char 
      008DF9                       2212 star_tst:
      000D79                       2213 	_case '*' slash_tst 
      008DF9 A6 2A            [ 1]    1 	ld a,#'*' 
      008DFB 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DFD 26 05            [ 1]    3 	jrne slash_tst
      008DFF A6 20            [ 1] 2214 	ld a,#TK_MULT 
      008E01 CC 8E A5         [ 2] 2215 	jp token_char 
      008E04                       2216 slash_tst: 
      000D84                       2217 	_case '/' prcnt_tst 
      008E04 A6 2F            [ 1]    1 	ld a,#'/' 
      008E06 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E08 26 05            [ 1]    3 	jrne prcnt_tst
      008E0A A6 21            [ 1] 2218 	ld a,#TK_DIV 
      008E0C CC 8E A5         [ 2] 2219 	jp token_char 
      008E0F                       2220 prcnt_tst:
      000D8F                       2221 	_case '%' eql_tst 
      008E0F A6 25            [ 1]    1 	ld a,#'%' 
      008E11 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E13 26 05            [ 1]    3 	jrne eql_tst
      008E15 A6 22            [ 1] 2222 	ld a,#TK_MOD
      008E17 CC 8E A5         [ 2] 2223 	jp token_char  
                                   2224 ; 1 or 2 character tokens 	
      008E1A                       2225 eql_tst:
      000D9A                       2226 	_case '=' gt_tst 		
      008E1A A6 3D            [ 1]    1 	ld a,#'=' 
      008E1C 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E1E 26 05            [ 1]    3 	jrne gt_tst
      008E20 A6 32            [ 1] 2227 	ld a,#TK_EQUAL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008E22 CC 8E A5         [ 2] 2228 	jp token_char 
      008E25                       2229 gt_tst:
      000DA5                       2230 	_case '>' lt_tst 
      008E25 A6 3E            [ 1]    1 	ld a,#'>' 
      008E27 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E29 26 33            [ 1]    3 	jrne lt_tst
      008E2B A6 31            [ 1] 2231 	ld a,#TK_GT 
      008E2D 6B 02            [ 1] 2232 	ld (ATTRIB,sp),a 
      008E2F 72 5C 00 02      [ 1] 2233 	inc in 
      008E33 91 D6 01         [ 4] 2234 	ld a,([in.w],y)
      008E36 A1 3D            [ 1] 2235 	cp a,#'=
      008E38 26 0C            [ 1] 2236 	jrne 1$
      008E3A 7B 01            [ 1] 2237 	ld a,(TCHAR,sp)
      008E3C F7               [ 1] 2238 	ld (x),a
      008E3D 5C               [ 1] 2239 	incw x 
      008E3E A6 3D            [ 1] 2240 	ld a,#'=
      008E40 6B 01            [ 1] 2241 	ld (TCHAR,sp),a 
      008E42 A6 33            [ 1] 2242 	ld a,#TK_GE 
      008E44 20 5F            [ 2] 2243 	jra token_char  
      008E46 A1 3C            [ 1] 2244 1$: cp a,#'<
      008E48 26 0C            [ 1] 2245 	jrne 2$
      008E4A 7B 01            [ 1] 2246 	ld a,(TCHAR,sp)
      008E4C F7               [ 1] 2247 	ld (x),a
      008E4D 5C               [ 1] 2248 	incw x 
      008E4E A6 3C            [ 1] 2249 	ld a,#'<	
      008E50 6B 01            [ 1] 2250 	ld (TCHAR,sp),a 
      008E52 A6 35            [ 1] 2251 	ld a,#TK_NE 
      008E54 20 4F            [ 2] 2252 	jra token_char 
      008E56 72 5A 00 02      [ 1] 2253 2$: dec in
      008E5A 7B 02            [ 1] 2254 	ld a,(ATTRIB,sp)
      008E5C 20 47            [ 2] 2255 	jra token_char 
      008E5E                       2256 lt_tst:
      000DDE                       2257 	_case '<' other
      008E5E A6 3C            [ 1]    1 	ld a,#'<' 
      008E60 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E62 26 32            [ 1]    3 	jrne other
      008E64 A6 34            [ 1] 2258 	ld a,#TK_LT 
      008E66 6B 02            [ 1] 2259 	ld (ATTRIB,sp),a 
      008E68 72 5C 00 02      [ 1] 2260 	inc in 
      008E6C 91 D6 01         [ 4] 2261 	ld a,([in.w],y)
      008E6F A1 3D            [ 1] 2262 	cp a,#'=
      008E71 26 0B            [ 1] 2263 	jrne 1$
      008E73 7B 01            [ 1] 2264 	ld a,(TCHAR,sp)
      008E75 F7               [ 1] 2265 	ld (x),a 
      008E76 A6 3D            [ 1] 2266 	ld a,#'=
      008E78 6B 01            [ 1] 2267 	ld (TCHAR,sp),a 
      008E7A A6 36            [ 1] 2268 	ld a,#TK_LE 
      008E7C 20 27            [ 2] 2269 	jra token_char 
      008E7E A1 3E            [ 1] 2270 1$: cp a,#'>
      008E80 26 0C            [ 1] 2271 	jrne 2$
      008E82 7B 01            [ 1] 2272 	ld a,(TCHAR,sp)
      008E84 F7               [ 1] 2273 	ld (x),a 
      008E85 5C               [ 1] 2274 	incw x 
      008E86 A6 3E            [ 1] 2275 	ld a,#'>
      008E88 6B 01            [ 1] 2276 	ld (TCHAR,sp),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008E8A A6 35            [ 1] 2277 	ld a,#TK_NE 
      008E8C 20 17            [ 2] 2278 	jra token_char 
      008E8E 72 5A 00 02      [ 1] 2279 2$: dec in 
      008E92 7B 02            [ 1] 2280 	ld a,(ATTRIB,sp)
      008E94 20 0F            [ 2] 2281 	jra token_char 	
      008E96                       2282 other: ; not a special character 	 
      008E96 7B 01            [ 1] 2283 	ld a,(TCHAR,sp)
      008E98 CD 84 F8         [ 4] 2284 	call is_alpha 
      008E9B 25 03            [ 1] 2285 	jrc 30$ 
      008E9D CC 87 21         [ 2] 2286 	jp syntax_error 
      008EA0                       2287 30$: 
      008EA0 CD 8C B8         [ 4] 2288 	call parse_keyword
      008EA3 20 10            [ 2] 2289 	jra token_exit 
      008EA5                       2290 token_char:
      008EA5 6B 02            [ 1] 2291 	ld (ATTRIB,sp),a 
      008EA7 7B 01            [ 1] 2292 	ld a,(TCHAR,sp)
      008EA9 F7               [ 1] 2293 	ld (x),a 
      008EAA 5C               [ 1] 2294 	incw x 
      008EAB 7F               [ 1] 2295 	clr(x)
      008EAC 72 5C 00 02      [ 1] 2296 	inc in 
      008EB0 7B 02            [ 1] 2297 	ld a,(ATTRIB,sp)
      008EB2 AE 17 18         [ 2] 2298 	ldw x,#pad 
      008EB5                       2299 token_exit:
      000E35                       2300 	_drop VSIZE 
      008EB5 5B 02            [ 2]    1     addw sp,#VSIZE 
      008EB7 81               [ 4] 2301 	ret
                                   2302 
                                   2303 
                                   2304 
                                   2305 ;------------------------------------
                                   2306 ; check if character in {'0'..'9'}
                                   2307 ; input:
                                   2308 ;    A  character to test
                                   2309 ; output:
                                   2310 ;    Carry  0 not digit | 1 digit
                                   2311 ;------------------------------------
      008EB8                       2312 is_digit:
      008EB8 A1 30            [ 1] 2313 	cp a,#'0
      008EBA 25 03            [ 1] 2314 	jrc 1$
      008EBC A1 3A            [ 1] 2315     cp a,#'9+1
      008EBE 8C               [ 1] 2316 	ccf 
      008EBF 8C               [ 1] 2317 1$:	ccf 
      008EC0 81               [ 4] 2318     ret
                                   2319 
                                   2320 ;----------------------------------
                                   2321 ; convert to lower case
                                   2322 ; input: 
                                   2323 ;   A 		character to convert
                                   2324 ; output:
                                   2325 ;   A		result 
                                   2326 ;----------------------------------
      008EC1                       2327 to_lower::
      008EC1 A1 41            [ 1] 2328 	cp a,#'A
      008EC3 25 06            [ 1] 2329 	jrult 9$
      008EC5 A1 5A            [ 1] 2330 	cp a,#'Z 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008EC7 22 02            [ 1] 2331 	jrugt 9$
      008EC9 AB 20            [ 1] 2332 	add a,#32
      008ECB 81               [ 4] 2333 9$: ret
                                   2334 
                                   2335 ;------------------------------------
                                   2336 ; convert alpha to uppercase
                                   2337 ; input:
                                   2338 ;    a  character to convert
                                   2339 ; output:
                                   2340 ;    a  uppercase character
                                   2341 ;------------------------------------
      008ECC                       2342 to_upper::
      008ECC A1 61            [ 1] 2343 	cp a,#'a
      008ECE 2A 01            [ 1] 2344 	jrpl 1$
      008ED0 81               [ 4] 2345 0$:	ret
      008ED1 A1 7A            [ 1] 2346 1$: cp a,#'z	
      008ED3 22 FB            [ 1] 2347 	jrugt 0$
      008ED5 A0 20            [ 1] 2348 	sub a,#32
      008ED7 81               [ 4] 2349 	ret
                                   2350 	
                                   2351 ;------------------------------------
                                   2352 ; uppercase pad content
                                   2353 ; input:
                                   2354 ;	pad      .asciz 
                                   2355 ; output:
                                   2356 ;   pad      uppercase string 
                                   2357 ;------------------------------------
      008ED8                       2358 upper:
      008ED8 90 AE 17 18      [ 2] 2359 	ldw y,#pad 
      008EDC                       2360 upper_loop:	
      008EDC 90 F6            [ 1] 2361 	ld a,(y)
      008EDE 27 10            [ 1] 2362 	jreq 4$
      008EE0 A1 61            [ 1] 2363 	cp a,#'a 
      008EE2 2B 0C            [ 1] 2364 	jrmi 4$
      008EE4 A1 7B            [ 1] 2365 	cp a,#'z+1 
      008EE6 2A 08            [ 1] 2366 	jrpl 4$ 
      008EE8 A0 20            [ 1] 2367 	sub a,#0x20 
      008EEA 90 F7            [ 1] 2368 	ld (y),a 
      008EEC 90 5C            [ 1] 2369 	incw y 
      008EEE 20 EC            [ 2] 2370 	jra upper_loop
      008EF0 81               [ 4] 2371 4$: ret 
                                   2372 
                                   2373 ;------------------------------------
                                   2374 ; convert pad content in integer
                                   2375 ; input:
                                   2376 ;    pad		.asciz to convert
                                   2377 ; output:
                                   2378 ;    acc24      int24_t
                                   2379 ;------------------------------------
                                   2380 	; local variables
                           000001  2381 	SIGN=1 ; 1 byte, 
                           000002  2382 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2383 	TEMP=3 ; 1 byte, temporary storage
                           000003  2384 	VSIZE=3 ; 3 bytes reserved for local storage
      008EF1                       2385 atoi:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008EF1 89               [ 2] 2386 	pushw x ;save x
      008EF2 52 03            [ 2] 2387 	sub sp,#VSIZE
                                   2388 	; acc24=0 
      008EF4 72 5F 00 09      [ 1] 2389 	clr acc24    
      008EF8 72 5F 00 0A      [ 1] 2390 	clr acc16
      008EFC 72 5F 00 0B      [ 1] 2391 	clr acc8 
      008F00 C6 17 18         [ 1] 2392 	ld a, pad 
      008F03 27 5A            [ 1] 2393 	jreq atoi_exit
      008F05 0F 01            [ 1] 2394 	clr (SIGN,sp)
      008F07 A6 0A            [ 1] 2395 	ld a,#10
      008F09 6B 02            [ 1] 2396 	ld (BASE,sp),a ; default base decimal
      008F0B AE 17 18         [ 2] 2397 	ldw x,#pad ; pointer to string to convert
      008F0E F6               [ 1] 2398 	ld a,(x)
      008F0F 27 47            [ 1] 2399 	jreq 9$  ; completed if 0
      008F11 A1 2D            [ 1] 2400 	cp a,#'-
      008F13 26 04            [ 1] 2401 	jrne 1$
      008F15 03 01            [ 1] 2402 	cpl (SIGN,sp)
      008F17 20 08            [ 2] 2403 	jra 2$
      008F19 A1 24            [ 1] 2404 1$: cp a,#'$
      008F1B 26 06            [ 1] 2405 	jrne 3$
      008F1D A6 10            [ 1] 2406 	ld a,#16
      008F1F 6B 02            [ 1] 2407 	ld (BASE,sp),a
      008F21 5C               [ 1] 2408 2$:	incw x
      008F22 F6               [ 1] 2409 	ld a,(x)
      008F23                       2410 3$:	
      008F23 A1 61            [ 1] 2411 	cp a,#'a
      008F25 2B 02            [ 1] 2412 	jrmi 4$
      008F27 A0 20            [ 1] 2413 	sub a,#32
      008F29 A1 30            [ 1] 2414 4$:	cp a,#'0
      008F2B 2B 2B            [ 1] 2415 	jrmi 9$
      008F2D A0 30            [ 1] 2416 	sub a,#'0
      008F2F A1 0A            [ 1] 2417 	cp a,#10
      008F31 2B 06            [ 1] 2418 	jrmi 5$
      008F33 A0 07            [ 1] 2419 	sub a,#7
      008F35 11 02            [ 1] 2420 	cp a,(BASE,sp)
      008F37 2A 1F            [ 1] 2421 	jrpl 9$
      008F39 6B 03            [ 1] 2422 5$:	ld (TEMP,sp),a
      008F3B 7B 02            [ 1] 2423 	ld a,(BASE,sp)
      008F3D CD 8F 63         [ 4] 2424 	call mulu24_8
      008F40 7B 03            [ 1] 2425 	ld a,(TEMP,sp)
      008F42 CB 00 0B         [ 1] 2426 	add a,acc24+2
      008F45 C7 00 0B         [ 1] 2427 	ld acc24+2,a
      008F48 4F               [ 1] 2428 	clr a
      008F49 C9 00 0A         [ 1] 2429 	adc a,acc24+1
      008F4C C7 00 0A         [ 1] 2430 	ld acc24+1,a
      008F4F 4F               [ 1] 2431 	clr a
      008F50 C9 00 09         [ 1] 2432 	adc a,acc24
      008F53 C7 00 09         [ 1] 2433 	ld acc24,a
      008F56 20 C9            [ 2] 2434 	jra 2$
      008F58 0D 01            [ 1] 2435 9$:	tnz (SIGN,sp)
      008F5A 27 03            [ 1] 2436     jreq atoi_exit
      008F5C CD 8A 50         [ 4] 2437     call neg_acc24
      008F5F                       2438 atoi_exit: 
      008F5F 5B 03            [ 2] 2439 	addw sp,#VSIZE
      008F61 85               [ 2] 2440 	popw x ; restore x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008F62 81               [ 4] 2441 	ret
                                   2442 
                                   2443 ;--------------------------------------
                                   2444 ; unsigned multiply uint24_t by uint8_t
                                   2445 ; use to convert numerical string to uint24_t
                                   2446 ; input:
                                   2447 ;	acc24	uint24_t 
                                   2448 ;   A		uint8_t
                                   2449 ; output:
                                   2450 ;   acc24   A*acc24
                                   2451 ;-------------------------------------
                                   2452 ; local variables offset  on sp
                           000003  2453 	U8   = 3   ; A pushed on stack
                           000002  2454 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2455 	OVFH = 1  ; multiplication overflow high byte
                           000003  2456 	VSIZE = 3
      008F63                       2457 mulu24_8:
      008F63 89               [ 2] 2458 	pushw x    ; save X
                                   2459 	; local variables
      008F64 88               [ 1] 2460 	push a     ; U8
      008F65 5F               [ 1] 2461 	clrw x     ; initialize overflow to 0
      008F66 89               [ 2] 2462 	pushw x    ; multiplication overflow
                                   2463 ; multiply low byte.
      008F67 C6 00 0B         [ 1] 2464 	ld a,acc24+2
      008F6A 97               [ 1] 2465 	ld xl,a
      008F6B 7B 03            [ 1] 2466 	ld a,(U8,sp)
      008F6D 42               [ 4] 2467 	mul x,a
      008F6E 9F               [ 1] 2468 	ld a,xl
      008F6F C7 00 0B         [ 1] 2469 	ld acc24+2,a
      008F72 9E               [ 1] 2470 	ld a, xh
      008F73 6B 02            [ 1] 2471 	ld (OVFL,sp),a
                                   2472 ; multipy middle byte
      008F75 C6 00 0A         [ 1] 2473 	ld a,acc24+1
      008F78 97               [ 1] 2474 	ld xl,a
      008F79 7B 03            [ 1] 2475 	ld a, (U8,sp)
      008F7B 42               [ 4] 2476 	mul x,a
                                   2477 ; add overflow to this partial product
      008F7C 72 FB 01         [ 2] 2478 	addw x,(OVFH,sp)
      008F7F 9F               [ 1] 2479 	ld a,xl
      008F80 C7 00 0A         [ 1] 2480 	ld acc24+1,a
      008F83 4F               [ 1] 2481 	clr a
      008F84 A9 00            [ 1] 2482 	adc a,#0
      008F86 6B 01            [ 1] 2483 	ld (OVFH,sp),a
      008F88 9E               [ 1] 2484 	ld a,xh
      008F89 6B 02            [ 1] 2485 	ld (OVFL,sp),a
                                   2486 ; multiply most signficant byte	
      008F8B C6 00 09         [ 1] 2487 	ld a, acc24
      008F8E 97               [ 1] 2488 	ld xl, a
      008F8F 7B 03            [ 1] 2489 	ld a, (U8,sp)
      008F91 42               [ 4] 2490 	mul x,a
      008F92 72 FB 01         [ 2] 2491 	addw x, (OVFH,sp)
      008F95 9F               [ 1] 2492 	ld a, xl
      008F96 C7 00 09         [ 1] 2493 	ld acc24,a
      008F99 5B 03            [ 2] 2494     addw sp,#VSIZE
      008F9B 85               [ 2] 2495 	popw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008F9C 81               [ 4] 2496 	ret
                                   2497 
                                   2498 ;------------------------------------
                                   2499 ; skip character c in text starting from 'in'
                                   2500 ; input:
                                   2501 ;	 y 		point to text buffer
                                   2502 ;    a 		character to skip
                                   2503 ; output:  
                                   2504 ;	'in' ajusted to new position
                                   2505 ;------------------------------------
                           000001  2506 	C = 1 ; local var
      008F9D                       2507 skip:
      008F9D 88               [ 1] 2508 	push a
      008F9E 91 D6 01         [ 4] 2509 1$:	ld a,([in.w],y)
      008FA1 27 0A            [ 1] 2510 	jreq 2$
      008FA3 11 01            [ 1] 2511 	cp a,(C,sp)
      008FA5 26 06            [ 1] 2512 	jrne 2$
      008FA7 72 5C 00 02      [ 1] 2513 	inc in
      008FAB 20 F1            [ 2] 2514 	jra 1$
      000F2D                       2515 2$: _drop 1 
      008FAD 5B 01            [ 2]    1     addw sp,#1 
      008FAF 81               [ 4] 2516 	ret
                                   2517 
                                   2518 ;******************************
                                   2519 
                                   2520 ;----------------------	
                                   2521 ; push X on data stack 
                                   2522 ; input:
                                   2523 ;	X 
                                   2524 ; output:
                                   2525 ;	none 
                                   2526 ;----------------------	
      008FB0                       2527 dpush:
      000F30                       2528     _dp_down
      008FB0 72 5A 00 1B      [ 1]    1     dec dstkptr+1 
      008FB4 72 5A 00 1B      [ 1]    2     dec dstkptr+1
      008FB8 72 CF 00 1A      [ 5] 2529     ldw [dstkptr],x  
      008FBC 81               [ 4] 2530 	ret 
                                   2531 
                                   2532 
                                   2533 ;----------------------	
                                   2534 ; pop data stack in X 
                                   2535 ; input:
                                   2536 ;	none
                                   2537 ; output:
                                   2538 ;	X   
                                   2539 ;----------------------	
      008FBD                       2540 dpop: 
      008FBD 72 CE 00 1A      [ 5] 2541     ldw x, [dstkptr]
      000F41                       2542 	_dp_up
      008FC1 72 5C 00 1B      [ 1]    1     inc dstkptr+1
      008FC5 72 5C 00 1B      [ 1]    2     inc dstkptr+1
      008FC9 81               [ 4] 2543 	ret 
                                   2544 
                                   2545 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



                                   2546 ; swap top 2 elements of dstack
                                   2547 ;  {n1 n2 -- n2 n1 }
                                   2548 ;-----------------------------
      008FCA                       2549 dswap:
      008FCA 72 CE 00 1A      [ 5] 2550 	ldw x,[dstkptr]
      008FCE 89               [ 2] 2551 	pushw x 
      008FCF AE 00 02         [ 2] 2552 	ldw x,#2 
      008FD2 72 DE 00 1A      [ 5] 2553 	ldw x,([dstkptr],x) 
      008FD6 72 CF 00 1A      [ 5] 2554 	ldw [dstkptr],x 
      008FDA AE 00 02         [ 2] 2555 	ldw x,#2
      008FDD 90 85            [ 2] 2556 	popw y 
      008FDF 72 DF 00 1A      [ 5] 2557 	ldw ([dstkptr],x),y 
      008FE3 81               [ 4] 2558 	ret
                                   2559 
                                   2560 ;-----------------------------
                                   2561 ; drop TOS 
                                   2562 ;-----------------------------
      008FE4                       2563 ddrop: ; { n -- }
      000F64                       2564 	_dp_up 
      008FE4 72 5C 00 1B      [ 1]    1     inc dstkptr+1
      008FE8 72 5C 00 1B      [ 1]    2     inc dstkptr+1
      008FEC 81               [ 4] 2565 	ret
                                   2566 	
                                   2567 ;-----------------------------
                                   2568 ; duplicate TOS 
                                   2569 ;  dstack: { ix...n -- ix...n n }
                                   2570 ;-----------------------------
      008FED                       2571 ddup:
      008FED 72 CE 00 1A      [ 5] 2572 	ldw x,[dstkptr]
      000F71                       2573 	_dp_down
      008FF1 72 5A 00 1B      [ 1]    1     dec dstkptr+1 
      008FF5 72 5A 00 1B      [ 1]    2     dec dstkptr+1
      008FF9 72 CF 00 1A      [ 5] 2574     ldw [dstkptr],x  
      008FFD 81               [ 4] 2575 	ret 
                                   2576 
                                   2577 
                                   2578 ;----------------------------------
                                   2579 ; pick value n from dstack 
                                   2580 ; put it on TOS
                                   2581 ; dstack: {ix,..,p -- ix,...,np }
                                   2582 ;-----------------------------------
      008FFE                       2583 dpick:
      008FFE 72 CE 00 1A      [ 5] 2584 	ldw x,[dstkptr]
      009002 58               [ 2] 2585 	sllw x 
      009003 72 BB 00 1A      [ 2] 2586 	addw x,dstkptr 
      009007 FE               [ 2] 2587 	ldw x,(x)
      009008 72 CF 00 1A      [ 5] 2588 	ldw [dstkptr],x 
      00900C 81               [ 4] 2589 	ret
                                   2590 
                                   2591 ;---------------------------
                                   2592 ;  fetch variable in X 
                                   2593 ;  dstack:{ addr -- value }
                                   2594 ;---------------------------
      00900D                       2595 fetch:
      00900D 72 CE 00 1A      [ 5] 2596 	ldw x,[dstkptr]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      009011 FE               [ 2] 2597 	ldw x,(x)
      009012 72 CF 00 1A      [ 5] 2598 	ldw [dstkptr],x
      009016 81               [ 4] 2599 	ret 
                                   2600 
                                   2601 ;----------------------------
                                   2602 ; store variable 
                                   2603 ; dstack: {addr value -- }
                                   2604 ;----------------------------
      009017                       2605 store:
      009017 CD 8F BD         [ 4] 2606 	call dpop 
      00901A 90 93            [ 1] 2607 	ldw y,x   ; y=value 
      00901C CD 8F BD         [ 4] 2608 	call dpop 
      00901F FF               [ 2] 2609 	ldw (x),y 
      009020 81               [ 4] 2610 	ret 
                                   2611 
                                   2612 ;------------------------------
                                   2613 ; restore 'in.w' variable to 
                                   2614 ; its value before last call
                                   2615 ; to get_token.
                                   2616 ;------------------------------
      009021                       2617 unget_token:
      009021 CE 00 12         [ 2] 2618 	ldw x,in.w.saved
      009024 CF 00 01         [ 2] 2619 	ldw in.w,x 
      009027 81               [ 4] 2620 	ret 
                                   2621 
                                   2622 
      009028 0A 64 73 74 61 63 6B  2623 dstk_prompt: .asciz "\ndstack: " 
             3A 20 00
                                   2624 ;----------------------------
                                   2625 ; print dstack content 
                                   2626 ;---------------------------
                           000001  2627 	XSAVE=1
                           000002  2628 	VSIZE=2
      009032                       2629 dots:
      000FB2                       2630 	_vars VSIZE 
      009032 52 02            [ 2]    1     sub sp,#VSIZE 
      009034 AE 90 28         [ 2] 2631 	ldw x,#dstk_prompt 
      009037 CD 82 B0         [ 4] 2632 	call puts
      00903A AE 17 7E         [ 2] 2633 	ldw x,#dstack_unf-CELL_SIZE
      00903D 35 0A 00 08      [ 1] 2634 	mov base,#10 
      009041 C3 00 1A         [ 2] 2635 1$:	cpw x,dstkptr 
      009044 25 0D            [ 1] 2636 	jrult 4$ 
      009046 1F 01            [ 2] 2637 	ldw (XSAVE,sp),x
      009048 FE               [ 2] 2638 	ldw  x,(x)
      009049 CD 89 85         [ 4] 2639 	call print_int 
      00904C 1E 01            [ 2] 2640 	ldw x,(XSAVE,sp)
      00904E 1D 00 02         [ 2] 2641 	subw x,#CELL_SIZE 
      009051 20 EE            [ 2] 2642 	jra 1$ 
      009053 A6 0D            [ 1] 2643 4$: ld a,#CR 
      009055 CD 82 9E         [ 4] 2644 	call putc 
      000FD8                       2645 	_drop VSIZE
      009058 5B 02            [ 2]    1     addw sp,#VSIZE 
      00905A 4F               [ 1] 2646 	clr a 
      00905B 81               [ 4] 2647 	ret
                                   2648 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      00905C 0A 63 74 61 63 6B 3A  2649 cstk_prompt: .asciz "\nctack: "
             20 00
                                   2650 ;--------------------------------
                                   2651 ; print cstack content
                                   2652 ;--------------------------------
                           000001  2653 	XSAVE=1
                           000002  2654 	VSIZE=2 
      009065                       2655 dotr:
      000FE5                       2656 	_vars VSIZE 
      009065 52 02            [ 2]    1     sub sp,#VSIZE 
      009067 AE 90 5C         [ 2] 2657 	ldw x,#cstk_prompt
      00906A CD 82 B0         [ 4] 2658 	call puts 
      00906D 96               [ 1] 2659 	ldw x,sp 
      00906E 1C 00 07         [ 2] 2660 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      009071 1F 01            [ 2] 2661 	ldw (XSAVE,sp),x  
      009073 AE 17 FE         [ 2] 2662 	ldw x,#RAM_SIZE-2
      009076 35 10 00 08      [ 1] 2663 	mov base,#16
      00907A                       2664 dotr_loop:
      00907A 13 01            [ 2] 2665 	cpw x,(XSAVE,sp)
      00907C 2B 0B            [ 1] 2666 	jrmi 9$
      00907E 89               [ 2] 2667 	pushw x  
      00907F FE               [ 2] 2668 	ldw x,(x)
      009080 CD 89 85         [ 4] 2669 	call print_int 
      009083 85               [ 2] 2670 	popw x  
      009084 1D 00 02         [ 2] 2671 	subw x,#CELL_SIZE
      009087 20 F1            [ 2] 2672 	jra dotr_loop 
      009089 A6 0D            [ 1] 2673 9$:	ld a,#CR 
      00908B CD 82 9E         [ 4] 2674 	call putc 
      00100E                       2675 	_drop VSIZE 
      00908E 5B 02            [ 2]    1     addw sp,#VSIZE 
      009090 4F               [ 1] 2676 	clr a 
      009091 81               [ 4] 2677 	ret
                                   2678 
                                   2679 
                                   2680 ;--------------------------------
                                   2681 ; BASIC: SHOW 
                                   2682 ;  show content of dstack,cstack
                                   2683 ;--------------------------------
      009092                       2684 show:
      009092 C6 00 08         [ 1] 2685 	ld a,base 
      009095 88               [ 1] 2686 	push a 
      009096 CD 90 32         [ 4] 2687 	call dots
      009099 CD 90 65         [ 4] 2688 	call dotr 
      00909C 84               [ 1] 2689 	pop a 
      00909D C7 00 08         [ 1] 2690 	ld base,a 
      0090A0 4F               [ 1] 2691 	clr a 
      0090A1 81               [ 4] 2692 	ret
                                   2693 
                                   2694 
                                   2695 ;--------------------------------
                                   2696 ;  add 2 integers
                                   2697 ;  input:
                                   2698 ;    N1     on cstack 
                                   2699 ;    N2     on cstack 
                                   2700 ;  output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2701 ;    X 		n2+n1 
                                   2702 ;--------------------------------
                                   2703 	;arugments on cstack 
      0090A2                       2704 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001022                       2705 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001022                       2706 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001022                       2707 add:
      0090A2 1E 05            [ 2] 2708 	ldw x ,(N2,sp)
      0090A4 72 FB 03         [ 2] 2709 	addw x,(N1,sp)
      0090A7 1F 03            [ 2] 2710 	ldw (N1,sp),x 
      0090A9 81               [ 4] 2711 	ret 
                                   2712 
                                   2713 ;--------------------------------
                                   2714 ;  substract 2 ntegers
                                   2715 ;  input:
                                   2716 ;    N1     on cstack 
                                   2717 ;    N2     on cstack 
                                   2718 ;  output:
                                   2719 ;    X 		n2+n1 
                                   2720 ;--------------------------------
      0090AA                       2721 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      00102A                       2722 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      00102A                       2723 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      00102A                       2724 substract:
      0090AA 1E 05            [ 2] 2725 	ldw x,(N2,sp)
      0090AC 72 F0 03         [ 2] 2726 	subw x,(N1,sp)
      0090AF 81               [ 4] 2727 	ret 
                                   2728 
                                   2729 ;-------------------------------------
                                   2730 ; multiply 2 integers
                                   2731 ; product overflow is ignored unless
                                   2732 ; MATH_OVF assembler flag is set to 1
                                   2733 ; input:
                                   2734 ;  	N1      on cstack
                                   2735 ;   N2 		on cstack 
                                   2736 ; output:
                                   2737 ;	X        N1*N2 
                                   2738 ;-------------------------------------
                                   2739 	;arguments 
      0090B0                       2740 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      001030                       2741 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      001030                       2742 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      001030                       2743 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      001030                       2744 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                                   2745    ; local variables 
                           000001  2746 	SIGN=1
                           000002  2747 	PROD=2
                           000003  2748 	VSIZE=3
      001030                       2749 multiply:
      001030                       2750 	_vars VSIZE 
      0090B0 52 03            [ 2]    1     sub sp,#VSIZE 
      0090B2 0F 01            [ 1] 2751 	clr (SIGN,sp)
      0090B4 1E 06            [ 2] 2752 	ldw x,(N1_HB,sp)
      0090B6 9E               [ 1] 2753 	ld a,xh  
      0090B7 A5 80            [ 1] 2754 	bcp a,#0x80 
      0090B9 27 05            [ 1] 2755 	jreq 2$
      0090BB 03 01            [ 1] 2756 	cpl (SIGN,sp)
      0090BD 50               [ 2] 2757 	negw x 
      0090BE 1F 06            [ 2] 2758 	ldw (N1_HB,sp),x 
      0090C0 1E 08            [ 2] 2759 2$: ldw x,(N2_HB,sp)
      0090C2 9E               [ 1] 2760 	ld a,xh  
      0090C3 A5 80            [ 1] 2761 	bcp a,#0x80 
      0090C5 27 05            [ 1] 2762 	jreq 3$
      0090C7 03 01            [ 1] 2763 	cpl (SIGN,sp)
      0090C9 50               [ 2] 2764 	negw x 
      0090CA 1F 08            [ 2] 2765 	ldw (N2_HB,sp),x 
                                   2766 ; N1_LB * N2_LB 	
      0090CC 7B 07            [ 1] 2767 3$:	ld a,(N1_LB,sp)
      0090CE 97               [ 1] 2768 	ld xl,a 
      0090CF 7B 09            [ 1] 2769 	ld a,(N2_LB,sp) 
      0090D1 42               [ 4] 2770 	mul x,a 
                           000000  2771 .if MATH_OVF 	
                                   2772 	ld a,xh 
                                   2773 	bcp a,#0x80 
                                   2774 	jreq 4$ 
                                   2775 	ld a,#ERR_MATH_OVF 
                                   2776 	jp tb_error
                                   2777 .endif 	 
      0090D2 1F 02            [ 2] 2778 4$:	ldw (PROD,sp),x
                                   2779 ; N1_LB * N2_HB	 
      0090D4 7B 07            [ 1] 2780 	ld a,(N1_LB,sp) 
      0090D6 97               [ 1] 2781 	ld xl,a 
      0090D7 7B 08            [ 1] 2782 	ld a,(N2_HB,sp)
      0090D9 42               [ 4] 2783 	mul x,a
      0090DA 9F               [ 1] 2784 	ld a,xl 
      0090DB 1B 02            [ 1] 2785 	add a,(PROD,sp)
                           000000  2786 .if MATH_OVF 	
                                   2787 	bcp a,#0x80 
                                   2788 	jreq 5$ 
                                   2789 	ld a,#ERR_MATH_OVF 
                                   2790 	jp tb_error
                                   2791 .endif 	 
      0090DD 6B 02            [ 1] 2792 5$:	ld (PROD,sp),a 
                                   2793 ; N1_HB * N2_LB 
      0090DF 7B 06            [ 1] 2794 	ld a,(N1_HB,sp)
      0090E1 97               [ 1] 2795 	ld xl,a 
      0090E2 7B 09            [ 1] 2796 	ld a,(N2_LB,sp)
      0090E4 42               [ 4] 2797 	mul x,a 
      0090E5 9F               [ 1] 2798 	ld a,xl 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      0090E6 1B 02            [ 1] 2799 	add a,(PROD,sp)
                           000000  2800 .if MATH_OVF 	
                                   2801 	bcp a,#0x80 
                                   2802 	jreq 6$ 
                                   2803 	ld a,#ERR_MATH_OVF 
                                   2804 	jp tb_error
                                   2805 .endif 	 
      0090E8 6B 02            [ 1] 2806 6$:	ld (PROD,sp),a 
                                   2807 ; N1_HB * N2_HB 	
                                   2808 ; it is pointless to multiply N1_HB*N2_HB 
                                   2809 ; as this product is over 65535 or 0 
                                   2810 ;
                                   2811 ; sign adjust product
      0090EA 0D 01            [ 1] 2812 	tnz (SIGN,sp)
      0090EC 27 05            [ 1] 2813 	jreq 7$
      0090EE 1E 02            [ 2] 2814 	ldw x, (PROD,sp)
      0090F0 50               [ 2] 2815 	negw x
      0090F1 1F 02            [ 2] 2816 	ldw (PROD,sp),x  
      0090F3                       2817 7$: 
      0090F3 1E 02            [ 2] 2818 	ldw x,(PROD,sp) 
      001075                       2819 	_drop VSIZE 
      0090F5 5B 03            [ 2]    1     addw sp,#VSIZE 
      0090F7 81               [ 4] 2820 	ret
                                   2821 
                                   2822 ;----------------------------------
                                   2823 ;  euclidian divide n2/n1 
                                   2824 ; input:
                                   2825 ;    N2 	on cstack
                                   2826 ;    N1 	on cstack
                                   2827 ; output:
                                   2828 ;    X      n2/n1 
                                   2829 ;    Y      remainder 
                                   2830 ;----------------------------------
      0090F8                       2831 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      001078                       2832 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      001078                       2833 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2834 	; local variables
                           000001  2835 	SQUOT=1 ; sign quotient
                           000002  2836 	SDIVD=2 ; sign dividend  
                           000002  2837 	VSIZE=2
      001078                       2838 divide:
      001078                       2839 	_vars VSIZE 
      0090F8 52 02            [ 2]    1     sub sp,#VSIZE 
      0090FA 0F 01            [ 1] 2840 	clr (SQUOT,sp)
      0090FC 0F 02            [ 1] 2841 	clr (SDIVD,sp)
                                   2842 ; check for 0 divisor
      0090FE 1E 05            [ 2] 2843 	ldw x,(DIVISR,sp)
      009100 5D               [ 2] 2844 	tnzw x 
      009101 26 05            [ 1] 2845     jrne 0$
      009103 A6 04            [ 1] 2846 	ld a,#ERR_DIV0 
      009105 CC 87 23         [ 2] 2847 	jp tb_error 
                                   2848 ; check divisor sign 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009108 9E               [ 1] 2849 0$:	ld a,xh 
      009109 A5 80            [ 1] 2850 	bcp a,#0x80 
      00910B 27 03            [ 1] 2851 	jreq 1$
      00910D 03 01            [ 1] 2852 	cpl (SQUOT,sp)
      00910F 50               [ 2] 2853 	negw x 
      009110 1F 05            [ 2] 2854 1$:	ldw (DIVISR,sp),x
                                   2855 ; check dividend sign 	 
      009112 1E 07            [ 2] 2856     ldw x,(DIVIDND,sp)
      009114 9E               [ 1] 2857 	ld a,xh 
      009115 A5 80            [ 1] 2858 	bcp a,#0x80 
      009117 27 05            [ 1] 2859 	jreq 2$ 
      009119 03 01            [ 1] 2860 	cpl (SQUOT,sp)
      00911B 03 02            [ 1] 2861 	cpl (SDIVD,sp)
      00911D 50               [ 2] 2862 	negw x 
      00911E 16 05            [ 2] 2863 2$:	ldw y,(DIVISR,sp)
      009120 65               [ 2] 2864 	divw x,y
      009121 90 CF 00 0A      [ 2] 2865 	ldw acc16,y 
                                   2866 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      009125 0D 02            [ 1] 2867 	tnz (SDIVD,sp)
      009127 27 0B            [ 1] 2868 	jreq 7$
      009129 90 5D            [ 2] 2869 	tnzw y 
      00912B 27 07            [ 1] 2870 	jreq 7$
      00912D 5C               [ 1] 2871 	incw x
      00912E 16 05            [ 2] 2872 	ldw y,(DIVISR,sp)
      009130 72 B2 00 0A      [ 2] 2873 	subw y,acc16
      009134 0D 01            [ 1] 2874 7$: tnz (SQUOT,sp)
      009136 27 01            [ 1] 2875 	jreq 9$ 	 
      009138 50               [ 2] 2876 8$:	negw x 
      009139                       2877 9$: 
      0010B9                       2878 	_drop VSIZE 
      009139 5B 02            [ 2]    1     addw sp,#VSIZE 
      00913B 81               [ 4] 2879 	ret 
                                   2880 
                                   2881 
                                   2882 ;----------------------------------
                                   2883 ;  remainder resulting from euclidian 
                                   2884 ;  division of n2/n1 
                                   2885 ; input:
                                   2886 ;   N1 		cstack 
                                   2887 ;   N2      cstack
                                   2888 ; output:
                                   2889 ;   X       N2%N1 
                                   2890 ;----------------------------------
                                   2891 	
                           000003  2892 	N1=3
                           000005  2893 	N2=5
                           000004  2894 	VSIZE=4
      00913C                       2895 modulo:
      00913C 1E 03            [ 2] 2896 	Ldw x,(N1,sp)
      00913E 16 05            [ 2] 2897 	ldw y,(N2,sp)
      0010C0                       2898 	_vars VSIZE 
      009140 52 04            [ 2]    1     sub sp,#VSIZE 
      009142 1F 01            [ 2] 2899 	ldw (1,sp),x 
      009144 17 03            [ 2] 2900 	ldw (3,sp),y 
      009146 CD 90 F8         [ 4] 2901 	call divide 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      009149 93               [ 1] 2902 	ldw x,y
      0010CA                       2903 	_drop VSIZE 
      00914A 5B 04            [ 2]    1     addw sp,#VSIZE 
      00914C 81               [ 4] 2904 	ret 
                                   2905 
                                   2906 ;---------------------------------
                                   2907 ; drop n elements from data stack 
                                   2908 ; input: 
                                   2909 ;   X 		n 
                                   2910 ; output:
                                   2911 ;   none 
                                   2912 ;-------------------------------------
      00914D                       2913 ddrop_n:
      00914D 90 89            [ 2] 2914 	pushw y 
      00914F 90 CE 00 1A      [ 2] 2915 	ldw y,dstkptr 
      009153 58               [ 2] 2916 	sllw x 
      009154 89               [ 2] 2917 	pushw x 
      009155 72 F9 01         [ 2] 2918 	addw y,(1,sp)
      009158 90 CF 00 1A      [ 2] 2919 	ldw dstkptr,y 
      00915C 85               [ 2] 2920 	popw x 
      00915D 90 85            [ 2] 2921 	popw y
      00915F 81               [ 4] 2922 	ret 
                                   2923 
                                   2924 ;---------------------------------
                                   2925 ; execute procedure which address
                                   2926 ; is at TOS 
                                   2927 ; --------------------------------
      009160                       2928 execute: ; { addr -- ? }
      009160 CD 8F BD         [ 4] 2929 	call dpop
      009163 FC               [ 2] 2930 	jp (x)
                                   2931 
                                   2932 
                                   2933 ;---------------------------------
                                   2934 ; input:
                                   2935 ;	X 		dictionary entry point 
                                   2936 ;  pad		.asciz name to search 
                                   2937 ; output:
                                   2938 ;  A 		TK_CMD|TK_FUNC|TK_NONE 
                                   2939 ;  X		execution address | 0 
                                   2940 ;---------------------------------
                           000001  2941 	NLEN=1 ; cmd length 
                           000002  2942 	YSAVE=2
                           000003  2943 	VSIZE=3 
      009164                       2944 search_dict:
      0010E4                       2945 	_vars VSIZE 
      009164 52 03            [ 2]    1     sub sp,#VSIZE 
      009166 90 93            [ 1] 2946 	ldw y,x 
      009168                       2947 search_next:	
      009168 90 F6            [ 1] 2948 	ld a,(y)
      00916A A4 7F            [ 1] 2949 	and a,#0x7f 
      00916C 6B 01            [ 1] 2950 	ld (NLEN,sp),a  
      00916E AE 17 18         [ 2] 2951 	ldw x,#pad 
      009171 17 02            [ 2] 2952 	ldw (YSAVE,sp),y
      009173 90 5C            [ 1] 2953 	incw y  
      009175                       2954 cp_loop:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009175 F6               [ 1] 2955 	ld a,(x)
      009176 27 1E            [ 1] 2956 	jreq str_match 
      009178 0D 01            [ 1] 2957 	tnz (NLEN,sp)
      00917A 27 0B            [ 1] 2958 	jreq no_match  
      00917C 90 F1            [ 1] 2959 	cp a,(y)
      00917E 26 07            [ 1] 2960 	jrne no_match 
      009180 90 5C            [ 1] 2961 	incw y 
      009182 5C               [ 1] 2962 	incw x
      009183 0A 01            [ 1] 2963 	dec (NLEN,sp)
      009185 20 EE            [ 2] 2964 	jra cp_loop 
      009187                       2965 no_match:
      009187 16 02            [ 2] 2966 	ldw y,(YSAVE,sp) 
      009189 72 A2 00 02      [ 2] 2967 	subw y,#2 ; move Y to link field
      00918D 4B 00            [ 1] 2968 	push #TK_NONE 
      00918F 90 FE            [ 2] 2969 	ldw y,(y) ; next word link 
      009191 84               [ 1] 2970 	pop a ; TK_NONE 
      009192 27 24            [ 1] 2971 	jreq search_exit  ; not found  
                                   2972 ;try next 
      009194 20 D2            [ 2] 2973 	jra search_next
      009196                       2974 str_match:
      009196 16 02            [ 2] 2975 	ldw y,(YSAVE,sp)
      009198 90 F6            [ 1] 2976 	ld a,(y)
      00919A 6B 01            [ 1] 2977 	ld (NLEN,sp),a ; needed to test bit 7 
      00919C A4 7F            [ 1] 2978 	and a,#0x7f 
                                   2979 ; move y to procedure address field 	
      00919E 4C               [ 1] 2980 	inc a 
      00919F C7 00 0B         [ 1] 2981 	ld acc8,a 
      0091A2 72 5F 00 0A      [ 1] 2982 	clr acc16 
      0091A6 72 B9 00 0A      [ 2] 2983 	addw y,acc16 
      0091AA 90 FE            [ 2] 2984 	ldw y,(y) ; routine entry point 
      0091AC 7B 01            [ 1] 2985 	ld a,(NLEN,sp)
      0091AE A5 80            [ 1] 2986 	bcp a,#0x80 
      0091B0 27 04            [ 1] 2987 	jreq 1$
      0091B2 A6 0C            [ 1] 2988 	ld a,#TK_FUNC 
      0091B4 20 02            [ 2] 2989 	jra search_exit
      0091B6 A6 07            [ 1] 2990 1$: ld a,#TK_CMD 
      0091B8                       2991 search_exit: 
      0091B8 93               [ 1] 2992 	ldw x,y ; x=routine address 
      001139                       2993 	_drop VSIZE 	 
      0091B9 5B 03            [ 2]    1     addw sp,#VSIZE 
      0091BB 81               [ 4] 2994 	ret 
                                   2995 
                                   2996 ;---------------------
                                   2997 ; check if next token
                                   2998 ;  is of expected type 
                                   2999 ; input:
                                   3000 ;   A 		 expected token attribute
                                   3001 ;  ouput:
                                   3002 ;   none     if fail call tb_error 
                                   3003 ;--------------------
      0091BC                       3004 expect:
      0091BC 88               [ 1] 3005 	push a 
      0091BD CD 8C FD         [ 4] 3006 	call get_token 
      0091C0 11 01            [ 1] 3007 	cp a,(1,sp)
      0091C2 27 03            [ 1] 3008 	jreq 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0091C4 CC 87 21         [ 2] 3009 	jp syntax_error
      0091C7 84               [ 1] 3010 1$: pop a 
      0091C8 81               [ 4] 3011 	ret 
                                   3012 
                                   3013 
                                   3014 ;-------------------------------
                                   3015 ; parse embedded BASIC routines 
                                   3016 ; arguments list.
                                   3017 ; arg_list::=  rel[','rel]*
                                   3018 ; all arguments are of integer type
                                   3019 ; input:
                                   3020 ;   none
                                   3021 ; output:
                                   3022 ;   A 			number of arguments pushed on dstack  
                                   3023 ;--------------------------------
                           000001  3024 	ARG_CNT=1 
      0091C9                       3025 arg_list:
      0091C9 4B 00            [ 1] 3026 	push #0  
      0091CB CD 93 05         [ 4] 3027 1$: call relation
      0091CE A1 00            [ 1] 3028 	cp a,#TK_NONE 
      0091D0 27 19            [ 1] 3029 	jreq 5$
      0091D2 A1 0A            [ 1] 3030 	cp a,#TK_INTGR
      0091D4 26 12            [ 1] 3031 	jrne 4$
      0091D6 CD 8F B0         [ 4] 3032 3$: call dpush 
      0091D9 0C 01            [ 1] 3033     inc (ARG_CNT,sp)
      0091DB CD 8C FD         [ 4] 3034 	call get_token 
      0091DE A1 00            [ 1] 3035 	cp a,#TK_NONE 
      0091E0 27 09            [ 1] 3036 	jreq 5$ 
      0091E2 A1 08            [ 1] 3037 	cp a,#TK_COMMA 
      0091E4 26 02            [ 1] 3038 	jrne 4$
      0091E6 20 E3            [ 2] 3039 	jra 1$ 
      0091E8 CD 90 21         [ 4] 3040 4$:	call unget_token 
      0091EB 84               [ 1] 3041 5$:	pop a 
      0091EC 81               [ 4] 3042 	ret 
                                   3043 
                                   3044 
                                   3045 
                                   3046 ;--------------------------------
                                   3047 ;   BASIC commnands 
                                   3048 ;--------------------------------
                                   3049 
                                   3050 ;--------------------------------
                                   3051 ;  arithmetic and relational 
                                   3052 ;  routines
                                   3053 ;  operators precedence
                                   3054 ;  highest to lowest
                                   3055 ;  operators on same row have 
                                   3056 ;  same precedence and are executed
                                   3057 ;  from left to right.
                                   3058 ;	'*','/','%'
                                   3059 ;   '-','+'
                                   3060 ;   '=','>','<','>=','<=','<>','><'
                                   3061 ;   '<>' and '><' are equivalent for not equal.
                                   3062 ;--------------------------------
                                   3063 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3064 ;---------------------
                                   3065 ; return array element
                                   3066 ; address from @(expr)
                                   3067 ; input:
                                   3068 ;   A 		TK_ARRAY
                                   3069 ; output:
                                   3070 ;   A 		TK_INTGR
                                   3071 ;	X 		element address 
                                   3072 ;----------------------
      0091ED                       3073 get_array_element:
      0091ED CD 8F E4         [ 4] 3074 	call ddrop 
      0091F0 A6 04            [ 1] 3075 	ld a,#TK_LPAREN 
      0091F2 CD 91 BC         [ 4] 3076 	call expect
      0091F5 CD 93 05         [ 4] 3077 	call relation 
      0091F8 A1 0A            [ 1] 3078 	cp a,#TK_INTGR 
      0091FA 27 03            [ 1] 3079 	jreq 1$
      0091FC CC 87 21         [ 2] 3080 	jp syntax_error
      0091FF 89               [ 2] 3081 1$: pushw x 
      009200 A6 05            [ 1] 3082 	ld a,#TK_RPAREN 
      009202 CD 91 BC         [ 4] 3083 	call expect
                                   3084 	; check for bounds 
      009205 85               [ 2] 3085 	popw x   
      009206 C3 00 23         [ 2] 3086 	cpw x,array_size 
      009209 23 05            [ 2] 3087 	jrule 3$
                                   3088 ; bounds {1..array_size}	
      00920B A6 0A            [ 1] 3089 2$: ld a,#ERR_BAD_VALUE 
      00920D CC 87 23         [ 2] 3090 	jp tb_error 
      009210 5D               [ 2] 3091 3$: tnzw  x
      009211 27 F8            [ 1] 3092 	jreq 2$ 
      009213 58               [ 2] 3093 	sllw x 
      009214 89               [ 2] 3094 	pushw x 
      009215 CE 00 21         [ 2] 3095 	ldw x,array_addr  
      009218 72 F0 01         [ 2] 3096 	subw x,(1,sp)
      00119B                       3097 	_drop 2   
      00921B 5B 02            [ 2]    1     addw sp,#2 
      00921D A6 0A            [ 1] 3098 	ld a,#TK_INTGR
      00921F 81               [ 4] 3099 	ret 
                                   3100 
                                   3101 ;***********************************
                                   3102 ;   expression parse,execute 
                                   3103 ;***********************************
                                   3104 ;-----------------------------------
                                   3105 ; factor ::= ['+'|'-'|e] var | @ |
                                   3106 ;			 integer | function |
                                   3107 ;			 '('relation')' 
                                   3108 ; output:
                                   3109 ;   A    token attribute 
                                   3110 ;   X 	 integer
                                   3111 ; ---------------------------------
                           000001  3112 	NEG=1
                           000001  3113 	VSIZE=1
      009220                       3114 factor:
      0011A0                       3115 	_vars VSIZE 
      009220 52 01            [ 2]    1     sub sp,#VSIZE 
      009222 CD 8C FD         [ 4] 3116 	call get_token
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      009225 A1 02            [ 1] 3117 	cp a,#2 
      009227 2B 48            [ 1] 3118 	jrmi 20$
      009229 6B 01            [ 1] 3119 1$:	ld (NEG,sp),a 
      00922B A4 10            [ 1] 3120 	and a,#TK_GRP_ADD  
      00922D 26 04            [ 1] 3121 	jrne 2$
      00922F 7B 01            [ 1] 3122 	ld a,(NEG,sp)
      009231 20 03            [ 2] 3123 	jra 4$  
      009233                       3124 2$:	
      009233 CD 8C FD         [ 4] 3125 	call get_token 
      009236                       3126 4$:	
      009236 A1 0C            [ 1] 3127 	cp a,#TK_FUNC 
      009238 26 03            [ 1] 3128 	jrne 5$ 
      00923A FD               [ 4] 3129 	call (x) 
      00923B 20 2B            [ 2] 3130 	jra 18$ 
      00923D                       3131 5$:
      00923D A1 0A            [ 1] 3132 	cp a,#TK_INTGR
      00923F 26 02            [ 1] 3133 	jrne 6$
      009241 20 25            [ 2] 3134 	jra 18$
      009243                       3135 6$:
      009243 A1 03            [ 1] 3136 	cp a,#TK_ARRAY
      009245 26 06            [ 1] 3137 	jrne 10$
      009247 CD 91 ED         [ 4] 3138 	call get_array_element
      00924A FE               [ 2] 3139 	ldw x,(x)
      00924B 20 1B            [ 2] 3140 	jra 18$ 
      00924D                       3141 10$:
      00924D A1 02            [ 1] 3142 	cp a,#TK_VAR 
      00924F 26 03            [ 1] 3143 	jrne 12$
      009251 FE               [ 2] 3144 	ldw x,(x)
      009252 20 14            [ 2] 3145 	jra 18$
      009254                       3146 12$:			
      009254 A1 04            [ 1] 3147 	cp a,#TK_LPAREN
      009256 26 0A            [ 1] 3148 	jrne 16$
      009258 CD 93 05         [ 4] 3149 	call relation
      00925B A6 05            [ 1] 3150 	ld a,#TK_RPAREN 
      00925D CD 91 BC         [ 4] 3151 	call expect
      009260 20 06            [ 2] 3152 	jra 18$	
      009262                       3153 16$:
      009262 CD 90 21         [ 4] 3154 	call unget_token
      009265 4F               [ 1] 3155 	clr a 
      009266 20 09            [ 2] 3156 	jra 20$ 
      009268                       3157 18$: 
      009268 A6 11            [ 1] 3158 	ld a,#TK_MINUS 
      00926A 11 01            [ 1] 3159 	cp a,(NEG,sp)
      00926C 26 01            [ 1] 3160 	jrne 19$
      00926E 50               [ 2] 3161 	negw x
      00926F                       3162 19$:
      00926F A6 0A            [ 1] 3163 	ld a,#TK_INTGR
      009271                       3164 20$:
      0011F1                       3165 	_drop VSIZE
      009271 5B 01            [ 2]    1     addw sp,#VSIZE 
      009273 81               [ 4] 3166 	ret
                                   3167 
                                   3168 ;-----------------------------------
                                   3169 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3170 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



                                   3171 ;   A    	token attribute 
                                   3172 ;	X		integer
                                   3173 ;-----------------------------------
                           000001  3174 	N1=1
                           000003  3175 	N2=3
                           000005  3176 	MULOP=5
                           000005  3177 	VSIZE=5
      009274                       3178 term:
      0011F4                       3179 	_vars VSIZE
      009274 52 05            [ 2]    1     sub sp,#VSIZE 
      009276 CD 92 20         [ 4] 3180 	call factor
      009279 A1 02            [ 1] 3181 	cp a,#2
      00927B 2B 41            [ 1] 3182 	jrmi term_exit
      00927D                       3183 term01:	 ; check for  operator 
      00927D 1F 03            [ 2] 3184 	ldw (N2,sp),x  ; save first factor 
      00927F CD 8C FD         [ 4] 3185 	call get_token
      009282 A1 02            [ 1] 3186 	cp a,#2
      009284 2B 34            [ 1] 3187 	jrmi 9$
      009286 6B 05            [ 1] 3188 0$:	ld (MULOP,sp),a
      009288 A4 30            [ 1] 3189 	and a,#TK_GRP_MASK
      00928A A1 20            [ 1] 3190 	cp a,#TK_GRP_MULT
      00928C 27 07            [ 1] 3191 	jreq 1$
      00928E 7B 05            [ 1] 3192 	ld a,(MULOP,sp) 
      009290 CD 90 21         [ 4] 3193 	call unget_token 
      009293 20 25            [ 2] 3194 	jra 9$
      009295                       3195 1$:	; got *|/|%
      009295 CD 92 20         [ 4] 3196 	call factor
      009298 A1 0A            [ 1] 3197 	cp a,#TK_INTGR
      00929A 27 03            [ 1] 3198 	jreq 2$ 
      00929C CC 87 21         [ 2] 3199 	jp syntax_error
      00929F 1F 01            [ 2] 3200 2$:	ldw (N1,sp),x  
      0092A1 7B 05            [ 1] 3201 	ld a,(MULOP,sp) 
      0092A3 A1 20            [ 1] 3202 	cp a,#TK_MULT 
      0092A5 26 05            [ 1] 3203 	jrne 3$
      0092A7 CD 90 B0         [ 4] 3204 	call multiply 
      0092AA 20 D1            [ 2] 3205 	jra term01
      0092AC A1 21            [ 1] 3206 3$: cp a,#TK_DIV 
      0092AE 26 05            [ 1] 3207 	jrne 4$ 
      0092B0 CD 90 F8         [ 4] 3208 	call divide 
      0092B3 20 C8            [ 2] 3209 	jra term01 
      0092B5 CD 91 3C         [ 4] 3210 4$: call modulo
      0092B8 20 C3            [ 2] 3211 	jra term01 
      0092BA 1E 03            [ 2] 3212 9$: ldw x,(N2,sp)  
      0092BC A6 0A            [ 1] 3213 	ld a,#TK_INTGR 	
      0092BE                       3214 term_exit:
      00123E                       3215 	_drop VSIZE 
      0092BE 5B 05            [ 2]    1     addw sp,#VSIZE 
      0092C0 81               [ 4] 3216 	ret 
                                   3217 
                                   3218 ;-------------------------------
                                   3219 ;  expr ::= term [['+'|'-'] term]*
                                   3220 ;  result range {-32768..32767}
                                   3221 ;  output:
                                   3222 ;   A    token attribute 
                                   3223 ;   X	 integer   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3224 ;-------------------------------
                           000001  3225 	N1=1 
                           000003  3226 	N2=3
                           000005  3227 	OP=5 
                           000005  3228 	VSIZE=5 
      0092C1                       3229 expression:
      001241                       3230 	_vars VSIZE 
      0092C1 52 05            [ 2]    1     sub sp,#VSIZE 
      0092C3 CD 92 74         [ 4] 3231 	call term
      0092C6 A1 02            [ 1] 3232 	cp a,#2 
      0092C8 2B 38            [ 1] 3233 	jrmi expr_exit 
      0092CA 1F 03            [ 2] 3234 0$:	ldw (N2,sp),x 
      0092CC CD 8C FD         [ 4] 3235 	call get_token
      0092CF A1 02            [ 1] 3236 	cp a,#2
      0092D1 2B 2B            [ 1] 3237 	jrmi 9$ 
      0092D3 6B 05            [ 1] 3238 1$:	ld (OP,sp),a  
      0092D5 A4 30            [ 1] 3239 	and a,#TK_GRP_MASK
      0092D7 A1 10            [ 1] 3240 	cp a,#TK_GRP_ADD 
      0092D9 27 07            [ 1] 3241 	jreq 2$ 
      0092DB 7B 05            [ 1] 3242 	ld a,(OP,sp)
      0092DD CD 90 21         [ 4] 3243 	call unget_token
      0092E0 20 1C            [ 2] 3244 	jra 9$
      0092E2                       3245 2$: 
      0092E2 CD 92 74         [ 4] 3246 	call term
      0092E5 A1 0A            [ 1] 3247 	cp a,#TK_INTGR 
      0092E7 27 03            [ 1] 3248 	jreq 3$
      0092E9 CC 87 21         [ 2] 3249 	jp syntax_error
      0092EC 1F 01            [ 2] 3250 3$:	ldw (N1,sp),x 
      0092EE 7B 05            [ 1] 3251 	ld a,(OP,sp)
      0092F0 A1 10            [ 1] 3252 	cp a,#TK_PLUS 
      0092F2 26 05            [ 1] 3253 	jrne 4$
      0092F4 CD 90 A2         [ 4] 3254 	call add 
      0092F7 20 D1            [ 2] 3255 	jra 0$ 
      0092F9 CD 90 AA         [ 4] 3256 4$:	call substract
      0092FC 20 CC            [ 2] 3257 	jra 0$
      0092FE 1E 03            [ 2] 3258 9$: ldw x,(N2,sp)
      009300 A6 0A            [ 1] 3259 	ld a,#TK_INTGR	
      009302                       3260 expr_exit:
      001282                       3261 	_drop VSIZE 
      009302 5B 05            [ 2]    1     addw sp,#VSIZE 
      009304 81               [ 4] 3262 	ret 
                                   3263 
                                   3264 ;---------------------------------------------
                                   3265 ; rel ::= expr rel_op expr
                                   3266 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3267 ;  relation return 1 | 0  for true | false 
                                   3268 ;  output:
                                   3269 ;    A 		token attribute  
                                   3270 ;	 X		1|0
                                   3271 ;---------------------------------------------
                           000001  3272 	N1=1
                           000003  3273 	N2=3
                           000005  3274 	RELOP=5
                           000005  3275 	VSIZE=5 
      009305                       3276 relation: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      001285                       3277 	_vars VSIZE
      009305 52 05            [ 2]    1     sub sp,#VSIZE 
      009307 CD 92 C1         [ 4] 3278 	call expression
      00930A A1 02            [ 1] 3279 	cp a,#2 
      00930C 2B 4B            [ 1] 3280 	jrmi rel_exit 
                                   3281 	; expect rel_op or leave 
      00930E 1F 03            [ 2] 3282 	ldw (N2,sp),x 
      009310 CD 8C FD         [ 4] 3283 	call get_token 
      009313 A1 02            [ 1] 3284 	cp a,#2
      009315 2B 3E            [ 1] 3285 	jrmi 9$
      009317                       3286 1$:	
      009317 6B 05            [ 1] 3287 	ld (RELOP,sp),a 
      009319 A4 30            [ 1] 3288 	and a,#TK_GRP_MASK
      00931B A1 30            [ 1] 3289 	cp a,#0x30 
      00931D 27 07            [ 1] 3290 	jreq 2$
      00931F 7B 05            [ 1] 3291 	ld a,(RELOP,sp)
      009321 CD 90 21         [ 4] 3292 	call unget_token  
      009324 20 2F            [ 2] 3293 	jra 9$
      009326                       3294 2$:	; expect another expression or error 
      009326 CD 92 C1         [ 4] 3295 	call expression
      009329 A1 0A            [ 1] 3296 	cp a,#TK_INTGR 
      00932B 27 03            [ 1] 3297 	jreq 3$
      00932D CC 87 21         [ 2] 3298 	jp syntax_error 
      009330 1F 01            [ 2] 3299 3$:	ldw (N1,sp),x 
      009332 CD 90 AA         [ 4] 3300 	call substract
      009335 26 06            [ 1] 3301 	jrne 4$
      009337 35 02 00 0B      [ 1] 3302 	mov acc8,#2 ; n1==n2
      00933B 20 0C            [ 2] 3303 	jra 6$ 
      00933D                       3304 4$: 
      00933D 2C 06            [ 1] 3305 	jrsgt 5$  
      00933F 35 04 00 0B      [ 1] 3306 	mov acc8,#4 ; n1<2 
      009343 20 04            [ 2] 3307 	jra 6$
      009345                       3308 5$:
      009345 35 01 00 0B      [ 1] 3309 	mov acc8,#1 ; n1>n2 
      009349                       3310 6$:
      009349 5F               [ 1] 3311 	clrw x 
      00934A C6 00 0B         [ 1] 3312 	ld a, acc8  
      00934D 14 05            [ 1] 3313 	and a,(RELOP,sp)
      00934F 4D               [ 1] 3314 	tnz a 
      009350 27 05            [ 1] 3315 	jreq 10$
      009352 5C               [ 1] 3316 	incw x 
      009353                       3317 7$:	 
      009353 20 02            [ 2] 3318 	jra 10$  	
      009355 1E 03            [ 2] 3319 9$: ldw x,(N2,sp)
      009357                       3320 10$:
      009357 A6 0A            [ 1] 3321 	ld a,#TK_INTGR
      009359                       3322 rel_exit: 	 
      0012D9                       3323 	_drop VSIZE
      009359 5B 05            [ 2]    1     addw sp,#VSIZE 
      00935B 81               [ 4] 3324 	ret 
                                   3325 
                                   3326 
                                   3327 ;--------------------------------------------
                                   3328 ; BASIC: HEX 
                                   3329 ; select hexadecimal base for integer print
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3330 ;---------------------------------------------
      00935C                       3331 hex_base:
      00935C 35 10 00 08      [ 1] 3332 	mov base,#16 
      009360 81               [ 4] 3333 	ret 
                                   3334 
                                   3335 ;--------------------------------------------
                                   3336 ; BASIC: DEC 
                                   3337 ; select decimal base for integer print
                                   3338 ;---------------------------------------------
      009361                       3339 dec_base:
      009361 35 0A 00 08      [ 1] 3340 	mov base,#10
      009365 81               [ 4] 3341 	ret 
                                   3342 
                                   3343 ;------------------------
                                   3344 ; BASIC: SIZE 
                                   3345 ; return free size in text area
                                   3346 ; output:
                                   3347 ;   A 		TK_INTGR
                                   3348 ;   X 	    size integer
                                   3349 ;--------------------------
      009366                       3350 size:
      009366 AE 16 C8         [ 2] 3351 	ldw x,#tib 
      009369 72 B0 00 1E      [ 2] 3352 	subw x,txtend 
      00936D A6 0A            [ 1] 3353 	ld a,#TK_INTGR
      00936F 81               [ 4] 3354 	ret 
                                   3355 
                                   3356 
                                   3357 ;------------------------
                                   3358 ; BASIC: UBOUND  
                                   3359 ; return array variable size 
                                   3360 ; output:
                                   3361 ;   A 		TK_INTGR
                                   3362 ;   X 	    array size 
                                   3363 ;--------------------------
      009370                       3364 ubound:
      009370 AE 16 C8         [ 2] 3365 	ldw x,#tib
      009373 72 B0 00 1E      [ 2] 3366 	subw x,txtend 
      009377 54               [ 2] 3367 	srlw x 
      009378 CF 00 23         [ 2] 3368 	ldw array_size,x
      00937B A6 0A            [ 1] 3369 	ld a,#TK_INTGR
      00937D 81               [ 4] 3370 	ret 
                                   3371 
      00937E                       3372 let:
      00937E CD 8C FD         [ 4] 3373 	call get_token 
      009381 A1 02            [ 1] 3374 	cp a,#TK_VAR 
      009383 27 03            [ 1] 3375 	jreq let02
      009385 CC 87 21         [ 2] 3376 	jp syntax_error
      009388                       3377 let02:
      009388 CD 8F B0         [ 4] 3378 	call dpush 
      00938B CD 8C FD         [ 4] 3379 	call get_token 
      00938E A1 32            [ 1] 3380 	cp a,#TK_EQUAL
      009390 27 03            [ 1] 3381 	jreq 1$
      009392 CC 87 21         [ 2] 3382 	jp syntax_error
      009395                       3383 1$:	
      009395 CD 93 05         [ 4] 3384 	call relation   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009398 A1 0A            [ 1] 3385 	cp a,#TK_INTGR 
      00939A 27 03            [ 1] 3386 	jreq 2$
      00939C CC 87 21         [ 2] 3387 	jp syntax_error
      00939F                       3388 2$:	
      00939F 90 93            [ 1] 3389 	ldw y,x 
      0093A1 CD 8F BD         [ 4] 3390 	call dpop  
      0093A4 FF               [ 2] 3391 	ldw (x),y   
      0093A5 81               [ 4] 3392 	ret 
                                   3393 
                                   3394 ;----------------------------
                                   3395 ; BASIC: LIST [[start][,end]]
                                   3396 ; list program lines 
                                   3397 ; form start to end 
                                   3398 ; if empty argument list then 
                                   3399 ; list all.
                                   3400 ;----------------------------
                           000001  3401 	FIRST=1
                           000003  3402 	LAST=3 
                           000005  3403 	LN_PTR=5
                           000006  3404 	VSIZE=6 
      0093A6                       3405 list:
      001326                       3406 	_vars VSIZE
      0093A6 52 06            [ 2]    1     sub sp,#VSIZE 
      0093A8 CE 00 1C         [ 2] 3407 	ldw x,txtbgn 
      0093AB C3 00 1E         [ 2] 3408 	cpw x,txtend 
      0093AE 2B 03            [ 1] 3409 	jrmi 1$
      0093B0 CC 94 29         [ 2] 3410 	jp list_exit ; nothing to list 
      0093B3 1F 05            [ 2] 3411 1$:	ldw (LN_PTR,sp),x 
      0093B5 FE               [ 2] 3412 	ldw x,(x) 
      0093B6 1F 01            [ 2] 3413 	ldw (FIRST,sp),x ; list from first line 
      0093B8 AE 7F FF         [ 2] 3414 	ldw x,#0x7fff ; biggest line number 
      0093BB 1F 03            [ 2] 3415 	ldw (LAST,sp),x 
      0093BD CD 91 C9         [ 4] 3416 	call arg_list
      0093C0 4D               [ 1] 3417 	tnz a
      0093C1 27 3F            [ 1] 3418 	jreq list_start 
      0093C3 A1 02            [ 1] 3419 	cp a,#2 
      0093C5 27 07            [ 1] 3420 	jreq 4$
      0093C7 A1 01            [ 1] 3421 	cp a,#1 
      0093C9 27 06            [ 1] 3422 	jreq first_line 
      0093CB CC 87 21         [ 2] 3423 	jp syntax_error 
      0093CE CD 8F CA         [ 4] 3424 4$:	call dswap
      0093D1                       3425 first_line:
      0093D1 CD 8F BD         [ 4] 3426 	call dpop 
      0093D4 1F 01            [ 2] 3427 	ldw (FIRST,sp),x 
      0093D6 A1 01            [ 1] 3428 	cp a,#1 
      0093D8 27 05            [ 1] 3429 	jreq lines_skip 	
      0093DA                       3430 last_line:
      0093DA CD 8F BD         [ 4] 3431 	call dpop 
      0093DD 1F 03            [ 2] 3432 	ldw (LAST,sp),x 
      0093DF                       3433 lines_skip:
      0093DF CE 00 1C         [ 2] 3434 	ldw x,txtbgn
      0093E2 1F 05            [ 2] 3435 2$:	ldw (LN_PTR,sp),x 
      0093E4 C3 00 1E         [ 2] 3436 	cpw x,txtend 
      0093E7 2A 40            [ 1] 3437 	jrpl list_exit 
      0093E9 FE               [ 2] 3438 	ldw x,(x) ;lineno 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0093EA 13 01            [ 2] 3439 	cpw x,(FIRST,sp)
      0093EC 2A 14            [ 1] 3440 	jrpl list_start 
      0093EE 1E 05            [ 2] 3441 	ldw x,(LN_PTR,sp) 
      0093F0 1C 00 02         [ 2] 3442 	addw x,#2 
      0093F3 F6               [ 1] 3443 	ld a,(x)
      0093F4 5C               [ 1] 3444 	incw x 
      0093F5 C7 00 0B         [ 1] 3445 	ld acc8,a 
      0093F8 72 5F 00 0A      [ 1] 3446 	clr acc16 
      0093FC 72 BB 00 0A      [ 2] 3447 	addw x,acc16
      009400 20 E0            [ 2] 3448 	jra 2$ 
                                   3449 ; print loop
      009402                       3450 list_start:
      009402 1E 05            [ 2] 3451 	ldw x,(LN_PTR,sp)
      009404                       3452 3$:	
      009404 CD 94 3D         [ 4] 3453 	call prt_basic_line
      009407 1E 05            [ 2] 3454 	ldw x,(LN_PTR,sp)
      009409 1C 00 02         [ 2] 3455 	addw x,#2 
      00940C F6               [ 1] 3456 	ld a,(x)
      00940D 5C               [ 1] 3457 	incw x 
      00940E C7 00 0B         [ 1] 3458 	ld acc8,a 
      009411 72 5F 00 0A      [ 1] 3459 	clr acc16 
      009415 72 BB 00 0A      [ 2] 3460 	addw x,acc16
      009419 C3 00 1E         [ 2] 3461 	cpw x,txtend 
      00941C 2A 0B            [ 1] 3462 	jrpl list_exit
      00941E 1F 05            [ 2] 3463 	ldw (LN_PTR,sp),x
      009420 FE               [ 2] 3464 	ldw x,(x)
      009421 13 03            [ 2] 3465 	cpw x,(LAST,sp)  
      009423 2C 04            [ 1] 3466 	jrsgt list_exit 
      009425 1E 05            [ 2] 3467 	ldw x,(LN_PTR,sp)
      009427 20 DB            [ 2] 3468 	jra 3$
      009429                       3469 list_exit:
      0013A9                       3470 	_drop VSIZE 
      009429 5B 06            [ 2]    1     addw sp,#VSIZE 
      00942B 81               [ 4] 3471 	ret
                                   3472 
      00942C 4E 6F 74 68 69 6E 67  3473 empty: .asciz "Nothing to list\n"
             20 74 6F 20 6C 69 73
             74 0A 00
                                   3474 
                                   3475 ;--------------------------
                                   3476 ; input:
                                   3477 ;   X 		pointer at line
                                   3478 ; output:
                                   3479 ;   none 
                                   3480 ;--------------------------	
      00943D                       3481 prt_basic_line:
      00943D 89               [ 2] 3482 	pushw x 
      00943E FE               [ 2] 3483 	ldw x,(x)
      00943F CF 00 0A         [ 2] 3484 	ldw acc16,x 
      009442 72 5F 00 09      [ 1] 3485 	clr acc24 
      009446 AE 00 05         [ 2] 3486 	ldw x,#5 
      009449 A6 0A            [ 1] 3487 	ld a,#10 
      00944B CD 89 30         [ 4] 3488 	call prti24 
      00944E 85               [ 2] 3489 	popw x 
      00944F 1C 00 03         [ 2] 3490 	addw x,#3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009452 CD 82 B0         [ 4] 3491 	call puts 
      009455 A6 0D            [ 1] 3492 	ld a,#CR 
      009457 CD 82 9E         [ 4] 3493 	call putc 
      00945A 81               [ 4] 3494 	ret 	
                                   3495 
                                   3496 ;---------------------------------
                                   3497 ; BASIC: PRINT|? arg_list 
                                   3498 ; print values from argument list
                                   3499 ;----------------------------------
                           000001  3500 	COMMA=1
                           000001  3501 	VSIZE=1
      00945B                       3502 print:
      00945B 4B 00            [ 1] 3503 push #0 ; local variable COMMA 
      00945D                       3504 reset_comma:
      00945D 0F 01            [ 1] 3505 	clr (COMMA,sp)
      00945F                       3506 prt_loop:
      00945F CD 93 05         [ 4] 3507 	call relation
      009462 A1 01            [ 1] 3508 	cp a,#TK_COLON 
      009464 27 50            [ 1] 3509 	jreq print_exit   
      009466 A1 0A            [ 1] 3510 	cp a,#TK_INTGR 
      009468 26 05            [ 1] 3511 	jrne 0$ 
      00946A CD 89 85         [ 4] 3512 	call print_int 
      00946D 20 EE            [ 2] 3513 	jra reset_comma
      00946F                       3514 0$: 	
      00946F CD 8C FD         [ 4] 3515 	call get_token
      009472 A1 00            [ 1] 3516 	cp a,#TK_NONE 
      009474 27 40            [ 1] 3517 	jreq print_exit 
      009476 A1 06            [ 1] 3518 1$:	cp a,#TK_QSTR
      009478 26 05            [ 1] 3519 	jrne 2$   
      00947A CD 82 B0         [ 4] 3520 	call puts 
      00947D 20 DE            [ 2] 3521 	jra reset_comma
      00947F A1 0B            [ 1] 3522 2$: cp a,#TK_CHAR 
      009481 26 06            [ 1] 3523 	jrne 3$
      009483 9F               [ 1] 3524 	ld a,xl 
      009484 CD 82 9E         [ 4] 3525 	call putc 
      009487 20 D4            [ 2] 3526 	jra reset_comma 
      009489                       3527 3$: 	
      009489 A1 0C            [ 1] 3528 	cp a,#TK_FUNC 
      00948B 26 06            [ 1] 3529 	jrne 4$ 
      00948D FD               [ 4] 3530 	call (x)
      00948E CD 89 85         [ 4] 3531 	call print_int 
      009491 20 CA            [ 2] 3532 	jra reset_comma 
      009493                       3533 4$: 
      009493 A1 08            [ 1] 3534 	cp a,#TK_COMMA 
      009495 26 05            [ 1] 3535 	jrne 5$
      009497 03 01            [ 1] 3536 	cpl (COMMA,sp) 
      009499 CC 94 5F         [ 2] 3537 	jp prt_loop   
      00949C                       3538 5$: 
      00949C A1 09            [ 1] 3539 	cp a,#TK_SHARP
      00949E 26 13            [ 1] 3540 	jrne 7$
      0094A0 CD 8C FD         [ 4] 3541 	call get_token
      0094A3 A1 0A            [ 1] 3542 	cp a,#TK_INTGR 
      0094A5 27 03            [ 1] 3543 	jreq 6$
      0094A7 CC 87 21         [ 2] 3544 	jp syntax_error 
      0094AA                       3545 6$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0094AA 9F               [ 1] 3546 	ld a,xl 
      0094AB A4 0F            [ 1] 3547 	and a,#15 
      0094AD C7 00 26         [ 1] 3548 	ld tab_width,a 
      0094B0 CC 94 5D         [ 2] 3549 	jp reset_comma 
      0094B3                       3550 7$:	
      0094B3 CD 90 21         [ 4] 3551 	call unget_token
      0094B6                       3552 print_exit:
      0094B6 0D 01            [ 1] 3553 	tnz (COMMA,sp)
      0094B8 26 05            [ 1] 3554 	jrne 9$
      0094BA A6 0D            [ 1] 3555 	ld a,#CR 
      0094BC CD 82 9E         [ 4] 3556     call putc 
      00143F                       3557 9$:	_drop VSIZE 
      0094BF 5B 01            [ 2]    1     addw sp,#VSIZE 
      0094C1 81               [ 4] 3558 	ret 
                                   3559 
                                   3560 ;----------------------
                                   3561 ; 'save_context' and
                                   3562 ; 'rest_context' must be 
                                   3563 ; called at the same 
                                   3564 ; call stack depth 
                                   3565 ; i.e. SP must have the 
                                   3566 ; save value at  
                                   3567 ; entry point of both 
                                   3568 ; routine. 
                                   3569 ;---------------------
                           000006  3570 	CTXT_SIZE=6 ; size of saved data 
                                   3571 ;--------------------
                                   3572 ; save current BASIC
                                   3573 ; interpreter context 
                                   3574 ; on cstack 
                                   3575 ;--------------------
      0094C2                       3576 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001442                       3577 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001442                       3578 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001442                       3579 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001442                       3580 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      001442                       3581 save_context:
      0094C2 CE 00 04         [ 2] 3582 	ldw x,basicptr 
      0094C5 1F 03            [ 2] 3583 	ldw (BPTR,sp),x
      0094C7 CE 00 06         [ 2] 3584 	ldw x,lineno 
      0094CA 1F 05            [ 2] 3585 	ldw (LNO,sp),x 
      0094CC C6 00 02         [ 1] 3586 	ld a,in 
      0094CF 6B 07            [ 1] 3587 	ld (IN,sp),a
      0094D1 C6 00 03         [ 1] 3588 	ld a,count 
      0094D4 6B 08            [ 1] 3589 	ld (CNT,sp),a  
      0094D6 81               [ 4] 3590 	ret
                                   3591 
                                   3592 ;-----------------------
                                   3593 ; restore previously saved 
                                   3594 ; BASIC interpreter context 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3595 ; from cstack 
                                   3596 ;-------------------------
      0094D7                       3597 rest_context:
      0094D7 1E 03            [ 2] 3598 	ldw x,(BPTR,sp)
      0094D9 CF 00 04         [ 2] 3599 	ldw basicptr,x 
      0094DC 1E 05            [ 2] 3600 	ldw x,(LNO,sp)
      0094DE CF 00 06         [ 2] 3601 	ldw lineno,x 
      0094E1 7B 07            [ 1] 3602 	ld a,(IN,sp)
      0094E3 C7 00 02         [ 1] 3603 	ld in,a
      0094E6 7B 08            [ 1] 3604 	ld a,(CNT,sp)
      0094E8 C7 00 03         [ 1] 3605 	ld count,a  
      0094EB 81               [ 4] 3606 	ret
                                   3607 
                                   3608 ;------------------------------------------
                                   3609 ; BASIC: INPUT [string],var[,[string],var]
                                   3610 ; input value in variables 
                                   3611 ; [string] optionally can be used as prompt 
                                   3612 ;-----------------------------------------
                           000001  3613 	CX_BPTR=1
                           000003  3614 	CX_LNO=3
                           000004  3615 	CX_IN=4
                           000005  3616 	CX_CNT=5
                           000006  3617 	SKIP=6
                           000007  3618 	VSIZE=7
      0094EC                       3619 input_var:
      0094EC 72 00 00 25 05   [ 2] 3620 	btjt flags,#FRUN,1$ 
      0094F1 A6 06            [ 1] 3621 	ld a,#ERR_RUN_ONLY 
      0094F3 CC 87 23         [ 2] 3622 	jp tb_error 
      001476                       3623 1$:	_vars VSIZE 
      0094F6 52 07            [ 2]    1     sub sp,#VSIZE 
      0094F8                       3624 input_loop:
      0094F8 0F 06            [ 1] 3625 	clr (SKIP,sp)
      0094FA CD 8C FD         [ 4] 3626 	call get_token 
      0094FD A1 00            [ 1] 3627 	cp a,#TK_NONE 
      0094FF 27 5C            [ 1] 3628 	jreq input_exit 
      009501 A1 06            [ 1] 3629 	cp a,#TK_QSTR 
      009503 26 08            [ 1] 3630 	jrne 1$ 
      009505 CD 82 B0         [ 4] 3631 	call puts 
      009508 03 06            [ 1] 3632 	cpl (SKIP,sp)
      00950A CD 8C FD         [ 4] 3633 	call get_token 
      00950D A1 02            [ 1] 3634 1$: cp a,#TK_VAR  
      00950F 27 03            [ 1] 3635 	jreq 2$ 
      009511 CC 87 21         [ 2] 3636 	jp syntax_error
      009514 CD 8F B0         [ 4] 3637 2$:	call dpush 
      009517 0D 06            [ 1] 3638 	tnz (SKIP,sp)
      009519 26 0F            [ 1] 3639 	jrne 21$ 
      00951B A6 3A            [ 1] 3640 	ld a,#':
      00951D C7 17 19         [ 1] 3641 	ld pad+1,a 
      009520 72 5F 17 1A      [ 1] 3642 	clr pad+2
      009524 AE 17 18         [ 2] 3643 	ldw x,#pad 
      009527 CD 82 B0         [ 4] 3644 	call puts   
      00952A                       3645 21$:
      00952A CD 94 C2         [ 4] 3646 	call save_context 
      00952D AE 16 C8         [ 2] 3647 	ldw x,#tib 
      009530 CF 00 04         [ 2] 3648 	ldw basicptr,x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009533 72 5F 00 03      [ 1] 3649 	clr count  
      009537 CD 8A 73         [ 4] 3650 	call readln 
      00953A 72 5F 00 02      [ 1] 3651 	clr in 
      00953E CD 93 05         [ 4] 3652 	call relation 
      009541 A1 0A            [ 1] 3653 	cp a,#TK_INTGR
      009543 27 03            [ 1] 3654 	jreq 3$ 
      009545 CC 87 21         [ 2] 3655 	jp syntax_error
      009548 CD 8F B0         [ 4] 3656 3$: call dpush 
      00954B CD 90 17         [ 4] 3657 	call store 
      00954E CD 94 D7         [ 4] 3658 	call rest_context
      009551 CD 8C FD         [ 4] 3659 	call get_token 
      009554 A1 08            [ 1] 3660 	cp a,#TK_COMMA 
      009556 26 02            [ 1] 3661 	jrne 4$
      009558 20 9E            [ 2] 3662 	jra input_loop 
      00955A CD 90 21         [ 4] 3663 4$:	call unget_token 
      00955D                       3664 input_exit:
      0014DD                       3665 	_drop VSIZE 
      00955D 5B 07            [ 2]    1     addw sp,#VSIZE 
      00955F 81               [ 4] 3666 	ret 
                                   3667 
                                   3668 
                                   3669 ;---------------------
                                   3670 ; BASIC: REMARK | ' 
                                   3671 ; begin a comment 
                                   3672 ; comment are ignored 
                                   3673 ; use ' insted of REM 
                                   3674 ; This is never called
                                   3675 ; because get_token 
                                   3676 ; take care of skipping
                                   3677 ; comment. but required
                                   3678 ; for future use of 
                                   3679 ; keyword reverse search.  
                                   3680 ;---------------------- 
      009560                       3681 rem: 
      009560 81               [ 4] 3682 	ret 
                                   3683 
                                   3684 
                                   3685 ;---------------------
                                   3686 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3687 ; read in loop 'addr'  
                                   3688 ; apply & 'mask' to value 
                                   3689 ; loop while result==0.  
                                   3690 ; if 'xor_mask' given 
                                   3691 ; apply ^ in second  
                                   3692 ; loop while result==0 
                                   3693 ;---------------------
                           000001  3694 	XMASK=1 
                           000002  3695 	MASK=2
                           000003  3696 	ADDR=3
                           000004  3697 	VSIZE=4
      009561                       3698 wait: 
      0014E1                       3699 	_vars VSIZE
      009561 52 04            [ 2]    1     sub sp,#VSIZE 
      009563 0F 01            [ 1] 3700 	clr (XMASK,sp) 
      009565 CD 91 C9         [ 4] 3701 	call arg_list 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      009568 A1 02            [ 1] 3702 	cp a,#2
      00956A 24 03            [ 1] 3703 	jruge 0$
      00956C CC 87 21         [ 2] 3704 	jp syntax_error 
      00956F A1 03            [ 1] 3705 0$:	cp a,#3
      009571 25 06            [ 1] 3706 	jrult 1$
      009573 CD 8F BD         [ 4] 3707 	call dpop 
      009576 9F               [ 1] 3708 	ld a,xl
      009577 6B 01            [ 1] 3709 	ld (XMASK,sp),a 
      009579 CD 8F BD         [ 4] 3710 1$: call dpop ; mask 
      00957C 9F               [ 1] 3711 	ld a,xl 
      00957D 6B 02            [ 1] 3712 	ld (MASK,sp),a 
      00957F CD 8F BD         [ 4] 3713 	call dpop ; address 
      009582 F6               [ 1] 3714 2$:	ld a,(x)
      009583 14 02            [ 1] 3715 	and a,(MASK,sp)
      009585 18 01            [ 1] 3716 	xor a,(XMASK,sp)
      009587 27 F9            [ 1] 3717 	jreq 2$ 
      001509                       3718 	_drop VSIZE 
      009589 5B 04            [ 2]    1     addw sp,#VSIZE 
      00958B 81               [ 4] 3719 	ret 
                                   3720 
                                   3721 ;---------------------
                                   3722 ; BASIC: BSET addr,mask
                                   3723 ; set bits at 'addr' corresponding 
                                   3724 ; to those of 'mask' that are at 1.
                                   3725 ; arguments:
                                   3726 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3727 ;   mask        mask|addr
                                   3728 ; output:
                                   3729 ;	none 
                                   3730 ;--------------------------
      00958C                       3731 bit_set:
      00958C CD 91 C9         [ 4] 3732 	call arg_list 
      00958F A1 02            [ 1] 3733 	cp a,#2	 
      009591 27 03            [ 1] 3734 	jreq 1$ 
      009593 CC 87 21         [ 2] 3735 	jp syntax_error
      009596 CD 8F BD         [ 4] 3736 1$: call dpop ; mask 
      009599 9F               [ 1] 3737 	ld a,xl 
      00959A CD 8F BD         [ 4] 3738 	call dpop ; addr  
      00959D FA               [ 1] 3739 	or a,(x)
      00959E F7               [ 1] 3740 	ld (x),a 
      00959F 81               [ 4] 3741 	ret 
                                   3742 
                                   3743 ;---------------------
                                   3744 ; BASIC: BRES addr,mask
                                   3745 ; reset bits at 'addr' corresponding 
                                   3746 ; to those of 'mask' that are at 1.
                                   3747 ; arguments:
                                   3748 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3749 ;   mask	    ~mask&*addr  
                                   3750 ; output:
                                   3751 ;	none 
                                   3752 ;--------------------------
      0095A0                       3753 bit_reset:
      0095A0 CD 91 C9         [ 4] 3754 	call arg_list 
      0095A3 A1 02            [ 1] 3755 	cp a,#2  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      0095A5 27 03            [ 1] 3756 	jreq 1$ 
      0095A7 CC 87 21         [ 2] 3757 	jp syntax_error
      0095AA                       3758 1$: 
      0095AA CD 8F BD         [ 4] 3759 	call dpop ; mask 
      0095AD 9F               [ 1] 3760 	ld a,xl 
      0095AE 43               [ 1] 3761 	cpl a 
      0095AF CD 8F BD         [ 4] 3762 	call dpop ; addr  
      0095B2 F4               [ 1] 3763 	and a,(x)
      0095B3 F7               [ 1] 3764 	ld (x),a 
      0095B4 81               [ 4] 3765 	ret 
                                   3766 
                                   3767 ;---------------------
                                   3768 ; BASIC: BRES addr,mask
                                   3769 ; toggle bits at 'addr' corresponding 
                                   3770 ; to those of 'mask' that are at 1.
                                   3771 ; arguments:
                                   3772 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3773 ;   mask	    mask^*addr  
                                   3774 ; output:
                                   3775 ;	none 
                                   3776 ;--------------------------
      0095B5                       3777 bit_toggle:
      0095B5 CD 91 C9         [ 4] 3778 	call arg_list 
      0095B8 A1 02            [ 1] 3779 	cp a,#2 
      0095BA 27 03            [ 1] 3780 	jreq 1$ 
      0095BC CC 87 21         [ 2] 3781 	jp syntax_error
      0095BF CD 8F BD         [ 4] 3782 1$: call dpop ; mask 
      0095C2 9F               [ 1] 3783 	ld a,xl 
      0095C3 CD 8F BD         [ 4] 3784 	call dpop ; addr  
      0095C6 F8               [ 1] 3785 	xor a,(x)
      0095C7 F7               [ 1] 3786 	ld (x),a 
      0095C8 81               [ 4] 3787 	ret 
                                   3788 
                                   3789 
                                   3790 ;--------------------
                                   3791 ; BASIC: POKE addr,byte
                                   3792 ; put a byte at addr 
                                   3793 ;--------------------
      0095C9                       3794 poke:
      0095C9 CD 91 C9         [ 4] 3795 	call arg_list 
      0095CC A1 02            [ 1] 3796 	cp a,#2
      0095CE 27 03            [ 1] 3797 	jreq 1$
      0095D0 CC 87 21         [ 2] 3798 	jp syntax_error
      0095D3                       3799 1$:	
      0095D3 CD 8F BD         [ 4] 3800 	call dpop 
      0095D6 9F               [ 1] 3801     ld a,xl 
      0095D7 CD 8F BD         [ 4] 3802 	call dpop 
      0095DA F7               [ 1] 3803 	ld (x),a 
      0095DB 81               [ 4] 3804 	ret 
                                   3805 
                                   3806 ;-----------------------
                                   3807 ; BASIC: PEEK(addr)
                                   3808 ; get the byte at addr 
                                   3809 ; input:
                                   3810 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3811 ; output:
                                   3812 ;	X 		value 
                                   3813 ;-----------------------
      0095DC                       3814 peek:
      0095DC A6 04            [ 1] 3815 	ld a,#TK_LPAREN 
      0095DE CD 91 BC         [ 4] 3816 	call expect 
      0095E1 CD 91 C9         [ 4] 3817 	call arg_list
      0095E4 A1 01            [ 1] 3818 	cp a,#1 
      0095E6 27 03            [ 1] 3819 	jreq 1$
      0095E8 CC 87 21         [ 2] 3820 	jp syntax_error
      0095EB A6 05            [ 1] 3821 1$:	ld a,#TK_RPAREN 
      0095ED CD 91 BC         [ 4] 3822 	call expect 
      0095F0 CD 8F BD         [ 4] 3823 	call dpop 
      0095F3 F6               [ 1] 3824 	ld a,(x)
      0095F4 5F               [ 1] 3825 	clrw x 
      0095F5 97               [ 1] 3826 	ld xl,a 
      0095F6 A6 0A            [ 1] 3827 	ld a,#TK_INTGR
      0095F8 81               [ 4] 3828 	ret 
                                   3829 
      0095F9                       3830 if: 
      0095F9 CD 93 05         [ 4] 3831 	call relation 
      0095FC A1 0A            [ 1] 3832 	cp a,#TK_INTGR
      0095FE 27 03            [ 1] 3833 	jreq 1$ 
      009600 CC 87 21         [ 2] 3834 	jp syntax_error
      009603 4F               [ 1] 3835 1$:	clr a 
      009604 5D               [ 2] 3836 	tnzw x 
      009605 26 05            [ 1] 3837 	jrne 9$  
                                   3838 ;skip to next line
      009607 55 00 03 00 02   [ 1] 3839 	mov in,count
      00960C 81               [ 4] 3840 9$:	ret 
                                   3841 
                                   3842 ;------------------------
                                   3843 ; BASIC: FOR var=expr 
                                   3844 ; set variable to expression 
                                   3845 ; leave variable address 
                                   3846 ; on dstack and set
                                   3847 ; FFOR bit in 'flags'
                                   3848 ;-----------------
                           000001  3849 	RETL1=1
                           000003  3850 	INW=3
                           000005  3851 	BPTR=5
      00960D                       3852 for: ; { -- var_addr }
      00960D A6 02            [ 1] 3853 	ld a,#TK_VAR 
      00960F CD 91 BC         [ 4] 3854 	call expect
      009612 CD 8F B0         [ 4] 3855 	call dpush 
      009615 CD 93 88         [ 4] 3856 	call let02 
      009618 72 14 00 25      [ 1] 3857 	bset flags,#FFOR 
                                   3858 ; open space on cstack for BPTR and INW 
      00961C 85               [ 2] 3859 	popw x ; call return address 
      00159D                       3860 	_vars 4
      00961D 52 04            [ 2]    1     sub sp,#4 
      00961F 89               [ 2] 3861 	pushw x  ; RETL1 
      009620 5F               [ 1] 3862 	clrw x 
      009621 1F 05            [ 2] 3863 	ldw (BPTR,sp),x 
      009623 1F 03            [ 2] 3864 	ldw (INW,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009625 CD 8C FD         [ 4] 3865 	call get_token 
      009628 A1 07            [ 1] 3866 	cp a,#TK_CMD 
      00962A 27 03            [ 1] 3867 	jreq 1$
      00962C CC 87 21         [ 2] 3868 	jp syntax_error
      00962F                       3869 1$:  
      00962F A3 96 37         [ 2] 3870 	cpw x,#to 
      009632 27 03            [ 1] 3871 	jreq to
      009634 CC 87 21         [ 2] 3872 	jp syntax_error 
                                   3873 
                                   3874 ;-----------------------------------
                                   3875 ; BASIC: TO expr 
                                   3876 ; second part of FOR loop initilization
                                   3877 ; leave limit on dstack and set 
                                   3878 ; FTO bit in 'flags'
                                   3879 ;-----------------------------------
      009637                       3880 to: ; { var_addr -- var_addr limit step }
      009637 72 04 00 25 03   [ 2] 3881 	btjt flags,#FFOR,1$
      00963C CC 87 21         [ 2] 3882 	jp syntax_error
      00963F CD 93 05         [ 4] 3883 1$: call relation  
      009642 A1 0A            [ 1] 3884 	cp a,#TK_INTGR 
      009644 27 03            [ 1] 3885 	jreq 2$ 
      009646 CC 87 21         [ 2] 3886 	jp syntax_error
      009649 CD 8F B0         [ 4] 3887 2$: call dpush ; limit
      00964C CE 00 01         [ 2] 3888 	ldw x,in.w 
      00964F CD 8C FD         [ 4] 3889 	call get_token
      009652 A1 00            [ 1] 3890 	cp a,#TK_NONE  
      009654 27 0C            [ 1] 3891 	jreq 4$ 
      009656 A1 07            [ 1] 3892 	cp a,#TK_CMD
      009658 26 05            [ 1] 3893 	jrne 3$
      00965A A3 96 67         [ 2] 3894 	cpw x,#step 
      00965D 27 08            [ 1] 3895 	jreq step
      00965F                       3896 3$:	
      00965F CD 90 21         [ 4] 3897 	call unget_token   	 
      009662                       3898 4$:	
      009662 AE 00 01         [ 2] 3899 	ldw x,#1   ; default step  
      009665 20 12            [ 2] 3900 	jra store_loop_addr 
                                   3901 
                                   3902 
                                   3903 ;----------------------------------
                                   3904 ; BASIC: STEP expr 
                                   3905 ; optional third par of FOR loop
                                   3906 ; initialization. 	
                                   3907 ;------------------------------------
      009667                       3908 step: ; {var limit -- var limit step}
      009667 72 04 00 25 03   [ 2] 3909 	btjt flags,#FFOR,1$
      00966C CC 87 21         [ 2] 3910 	jp syntax_error
      00966F CD 93 05         [ 4] 3911 1$: call relation
      009672 A1 0A            [ 1] 3912 	cp a,#TK_INTGR
      009674 27 03            [ 1] 3913 	jreq store_loop_addr  
      009676 CC 87 21         [ 2] 3914 	jp syntax_error
                                   3915 ; leave loop back entry point on cstack 
                                   3916 ; cstack is 2 call deep from interp_loop
      009679                       3917 store_loop_addr:
      009679 CD 8F B0         [ 4] 3918 	call dpush 
      00967C CE 00 04         [ 2] 3919 	ldw x,basicptr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      00967F 1F 05            [ 2] 3920 	ldw (BPTR,sp),x 
      009681 CE 00 01         [ 2] 3921 	ldw x,in.w 
      009684 1F 03            [ 2] 3922 	ldw (INW,sp),x   
      009686 72 15 00 25      [ 1] 3923 	bres flags,#FFOR 
      00968A 72 5C 00 20      [ 1] 3924 	inc loop_depth 
      00968E 81               [ 4] 3925 	ret 
                                   3926 
                                   3927 ;--------------------------------
                                   3928 ; BASIC: NEXT var 
                                   3929 ; FOR loop control 
                                   3930 ; increment variable with step 
                                   3931 ; and compare with limit 
                                   3932 ; loop if threshold not crossed.
                                   3933 ; else clean both stacks. 
                                   3934 ; and decrement 'loop_depth' 
                                   3935 ;--------------------------------
      00968F                       3936 next: ; {var limit step -- [var limit step ] }
      00968F 72 5D 00 20      [ 1] 3937 	tnz loop_depth 
      009693 26 03            [ 1] 3938 	jrne 1$ 
      009695 CC 87 21         [ 2] 3939 	jp syntax_error 
      009698                       3940 1$: 
      009698 A6 02            [ 1] 3941 	ld a,#TK_VAR 
      00969A CD 91 BC         [ 4] 3942 	call expect
                                   3943 ; check for good variable after NEXT 	 
      00969D 90 93            [ 1] 3944 	ldw y,x 
      00969F AE 00 04         [ 2] 3945 	ldw x,#4  
      0096A2 72 D3 00 1A      [ 4] 3946 	cpw y,([dstkptr],x) ; compare variables address 
      0096A6 27 03            [ 1] 3947 	jreq 2$  
      0096A8 CC 87 21         [ 2] 3948 	jp syntax_error ; not the good one 
      0096AB                       3949 2$: ; increment variable 
      0096AB 93               [ 1] 3950 	ldw x,y
      0096AC FE               [ 2] 3951 	ldw x,(x)  ; get var value 
      0096AD CF 00 0A         [ 2] 3952 	ldw acc16,x 
      0096B0 72 CE 00 1A      [ 5] 3953 	ldw x,[dstkptr] ; step
      0096B4 72 BB 00 0A      [ 2] 3954 	addw x,acc16 ; var+step 
      0096B8 90 FF            [ 2] 3955 	ldw (y),x ; save var new value 
                                   3956 ; compare with limit 
      0096BA 90 93            [ 1] 3957 	ldw y,x 
      0096BC 72 CE 00 1A      [ 5] 3958 	ldw x,[dstkptr] ; step in x 
      0096C0 5D               [ 2] 3959 	tnzw x  
      0096C1 2A 0B            [ 1] 3960 	jrpl 4$ ; positive step 
                                   3961 ;negative step 
      0096C3 AE 00 02         [ 2] 3962 	ldw x,#2
      0096C6 72 D3 00 1A      [ 4] 3963 	cpw y,([dstkptr],x)
      0096CA 2F 26            [ 1] 3964 	jrslt loop_done
      0096CC 20 09            [ 2] 3965 	jra loop_back 
      0096CE                       3966 4$: ; positive step
      0096CE AE 00 02         [ 2] 3967 	ldw x,#2 
      0096D1 72 D3 00 1A      [ 4] 3968 	cpw y,([dstkptr],x)
      0096D5 2C 1B            [ 1] 3969 	jrsgt loop_done
      0096D7                       3970 loop_back:
      0096D7 1E 05            [ 2] 3971 	ldw x,(BPTR,sp)
      0096D9 CF 00 04         [ 2] 3972 	ldw basicptr,x 
      0096DC 72 01 00 25 0B   [ 2] 3973 	btjf flags,#FRUN,1$ 
      0096E1 E6 02            [ 1] 3974 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0096E3 AB 02            [ 1] 3975 	add a,#2 
      0096E5 C7 00 03         [ 1] 3976 	ld count,a
      0096E8 FE               [ 2] 3977 	ldw x,(x)
      0096E9 CF 00 06         [ 2] 3978 	ldw lineno,x
      0096EC 1E 03            [ 2] 3979 1$:	ldw x,(INW,sp)
      0096EE CF 00 01         [ 2] 3980 	ldw in.w,x 
      0096F1 81               [ 4] 3981 	ret 
      0096F2                       3982 loop_done:
                                   3983 	; remove var limit step on dstack 
      0096F2 CE 00 1A         [ 2] 3984 	ldw x,dstkptr 
      0096F5 1C 00 06         [ 2] 3985 	addw x,#3*CELL_SIZE
      0096F8 CF 00 1A         [ 2] 3986 	ldw dstkptr,x 
                                   3987 	; remove 2 return address on cstack 
      0096FB 85               [ 2] 3988 	popw x
      00167C                       3989 	_drop 4
      0096FC 5B 04            [ 2]    1     addw sp,#4 
      0096FE 89               [ 2] 3990 	pushw x 
      0096FF 72 5A 00 20      [ 1] 3991 	dec loop_depth 
      009703 81               [ 4] 3992 	ret 
                                   3993 
                                   3994 
                                   3995 ;------------------------
                                   3996 ; BASIC: GOTO lineno 
                                   3997 ; jump to lineno 
                                   3998 ; here cstack is 2 call deep from interp_loop 
                                   3999 ;------------------------
      009704                       4000 goto:
      009704 72 00 00 25 06   [ 2] 4001 	btjt flags,#FRUN,0$ 
      009709 A6 06            [ 1] 4002 	ld a,#ERR_RUN_ONLY
      00970B CC 87 23         [ 2] 4003 	jp tb_error 
      00970E 81               [ 4] 4004 	ret 
      00970F 20 23            [ 2] 4005 0$:	jra go_common
                                   4006 
                                   4007 ;--------------------
                                   4008 ; BASIC: GOSUB lineno
                                   4009 ; basic subroutine call
                                   4010 ; actual lineno and basicptr 
                                   4011 ; are saved on cstack
                                   4012 ; here cstack is 2 call deep from interp_loop 
                                   4013 ;--------------------
                           000003  4014 	GOS_RET=3
      009711                       4015 gosub:
      009711 72 00 00 25 06   [ 2] 4016 	btjt flags,#FRUN,0$ 
      009716 A6 06            [ 1] 4017 	ld a,#ERR_RUN_ONLY
      009718 CC 87 23         [ 2] 4018 	jp tb_error 
      00971B 81               [ 4] 4019 	ret 
      00971C 85               [ 2] 4020 0$:	popw x 
      00971D 52 02            [ 2] 4021 	sub sp,#2 
      00971F 89               [ 2] 4022 	pushw x 
      009720 CE 00 04         [ 2] 4023 	ldw x,basicptr
      009723 E6 02            [ 1] 4024 	ld a,(2,x)
      009725 AB 03            [ 1] 4025 	add a,#3 
      009727 C7 00 0B         [ 1] 4026 	ld acc8,a 
      00972A 72 5F 00 0A      [ 1] 4027 	clr acc16 
      00972E 72 BB 00 0A      [ 2] 4028 	addw x,acc16
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      009732 1F 03            [ 2] 4029 	ldw (GOS_RET,sp),x 
      009734                       4030 go_common: 
      009734 CD 93 05         [ 4] 4031 	call relation 
      009737 A1 0A            [ 1] 4032 	cp a,#TK_INTGR
      009739 27 03            [ 1] 4033 	jreq 1$ 
      00973B CC 87 21         [ 2] 4034 	jp syntax_error
      00973E                       4035 1$: 
      00973E CD 83 E1         [ 4] 4036 	call search_lineno  
      009741 5D               [ 2] 4037 	tnzw x 
      009742 26 05            [ 1] 4038 	jrne 2$ 
      009744 A6 05            [ 1] 4039 	ld a,#ERR_NO_LINE 
      009746 CC 87 23         [ 2] 4040 	jp tb_error 
      009749                       4041 2$: 
      009749 CF 00 04         [ 2] 4042 	ldw basicptr,x 
      00974C E6 02            [ 1] 4043 	ld a,(2,x)
      00974E AB 03            [ 1] 4044 	add a,#3 
      009750 C7 00 03         [ 1] 4045 	ld count,a 
      009753 FE               [ 2] 4046 	ldw x,(x)
      009754 CF 00 06         [ 2] 4047 	ldw lineno,x 
      009757 35 03 00 02      [ 1] 4048 	mov in,#3 
      00975B 81               [ 4] 4049 	ret 
                                   4050 
                                   4051 ;------------------------
                                   4052 ; BASIC: RETURN 
                                   4053 ; exit from a subroutine 
                                   4054 ; cstack is 2 level deep from interp_loop 
                                   4055 ;------------------------
      00975C                       4056 return:
      00975C 72 00 00 25 05   [ 2] 4057 	btjt flags,#FRUN,0$ 
      009761 A6 06            [ 1] 4058 	ld a,#ERR_RUN_ONLY
      009763 CC 87 23         [ 2] 4059 	jp tb_error 
      009766                       4060 0$:	
      009766 1E 03            [ 2] 4061 	ldw x,(GOS_RET,sp) 
      009768 CF 00 04         [ 2] 4062 	ldw basicptr,x 
      00976B E6 02            [ 1] 4063 	ld a,(2,x)
      00976D AB 03            [ 1] 4064 	add a,#3 
      00976F C7 00 03         [ 1] 4065 	ld count,a 
      009772 35 03 00 02      [ 1] 4066 	mov in,#3
      009776 FE               [ 2] 4067 	ldw x,(x)
      009777 CF 00 06         [ 2] 4068 	ldw lineno,x 
      00977A 4F               [ 1] 4069 	clr a 
      00977B 85               [ 2] 4070 	popw x 
      0016FC                       4071 	_drop 2
      00977C 5B 02            [ 2]    1     addw sp,#2 
      00977E 89               [ 2] 4072 	pushw x
      00977F 81               [ 4] 4073 	ret  
                                   4074 
                                   4075 
                                   4076 ;----------------------------------
                                   4077 ; BASIC: RUN
                                   4078 ; run BASIC program in RAM
                                   4079 ;----------------------------------- 
      009780                       4080 run: 
      009780 72 01 00 25 02   [ 2] 4081 	btjf flags,#FRUN,0$  
      009785 4F               [ 1] 4082 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



      009786 81               [ 4] 4083 	ret
      009787                       4084 0$: 
      009787 72 09 00 25 12   [ 2] 4085 	btjf flags,#FBREAK,1$
      00170C                       4086 	_drop 2 
      00978C 5B 02            [ 2]    1     addw sp,#2 
      00978E CD 94 D7         [ 4] 4087 	call rest_context
      001711                       4088 	_drop CTXT_SIZE 
      009791 5B 06            [ 2]    1     addw sp,#CTXT_SIZE 
      009793 72 19 00 25      [ 1] 4089 	bres flags,#FBREAK 
      009797 72 10 00 25      [ 1] 4090 	bset flags,#FRUN 
      00979B CC 87 E7         [ 2] 4091 	jp interp_loop 
      00979E CE 00 1C         [ 2] 4092 1$:	ldw x,txtbgn
      0097A1 C3 00 1E         [ 2] 4093 	cpw x,txtend 
      0097A4 2B 02            [ 1] 4094 	jrmi 2$ 
      0097A6 4F               [ 1] 4095 	clr a 
      0097A7 81               [ 4] 4096 	ret 
      0097A8 CD 93 70         [ 4] 4097 2$: call ubound 
      00172B                       4098 	_drop 2 
      0097AB 5B 02            [ 2]    1     addw sp,#2 
      0097AD CE 00 1C         [ 2] 4099 	ldw x,txtbgn 
      0097B0 CF 00 04         [ 2] 4100 	ldw basicptr,x 
      0097B3 E6 02            [ 1] 4101 	ld a,(2,x)
      0097B5 AB 02            [ 1] 4102 	add a,#2 ; consider that in start at 3  
      0097B7 C7 00 03         [ 1] 4103 	ld count,a
      0097BA FE               [ 2] 4104 	ldw x,(x)
      0097BB CF 00 06         [ 2] 4105 	ldw lineno,x
      0097BE 35 03 00 02      [ 1] 4106 	mov in,#3	
      0097C2 72 10 00 25      [ 1] 4107 	bset flags,#FRUN 
      0097C6 CC 87 E7         [ 2] 4108 	jp interp_loop 
                                   4109 
                                   4110 
                                   4111 ;----------------------
                                   4112 ; BASIC: STOP 
                                   4113 ; stop running program
                                   4114 ;---------------------- 
      0097C9                       4115 stop: 
                                   4116 ; clean dstack and cstack 
      0097C9 AE 17 FF         [ 2] 4117 	ldw x,#STACK_EMPTY 
      0097CC 94               [ 1] 4118 	ldw sp,x 
      0097CD 72 11 00 25      [ 1] 4119 	bres flags,#FRUN 
      0097D1 72 19 00 25      [ 1] 4120 	bres flags,#FBREAK
      0097D5 CC 87 81         [ 2] 4121 	jp warm_start
                                   4122 
                                   4123 ;-----------------------
                                   4124 ; BASIC: BREAK 
                                   4125 ; insert a breakpoint 
                                   4126 ; in pogram. 
                                   4127 ; the program is resumed
                                   4128 ; with RUN 
                                   4129 ;-------------------------
      0097D8                       4130 break:
      0097D8 72 00 00 25 02   [ 2] 4131 	btjt flags,#FRUN,2$
      0097DD 4F               [ 1] 4132 	clr a
      0097DE 81               [ 4] 4133 	ret 
      0097DF                       4134 2$:	 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4135 ; create space on cstack to save context 
      0097DF AE 98 09         [ 2] 4136 	ldw x,#break_point 
      0097E2 CD 82 B0         [ 4] 4137 	call puts 
      001765                       4138 	_drop 2 ;drop return address 
      0097E5 5B 02            [ 2]    1     addw sp,#2 
      001767                       4139 	_vars CTXT_SIZE ; context size 
      0097E7 52 06            [ 2]    1     sub sp,#CTXT_SIZE 
      0097E9 CD 94 C2         [ 4] 4140 	call save_context 
      0097EC AE 16 C8         [ 2] 4141 	ldw x,#tib 
      0097EF CF 00 04         [ 2] 4142 	ldw basicptr,x
      0097F2 7F               [ 1] 4143 	clr (x)
      0097F3 72 5F 00 03      [ 1] 4144 	clr count  
      0097F7 5F               [ 1] 4145 	clrw x 
      0097F8 CF 00 06         [ 2] 4146 	ldw lineno,x 
      0097FB CF 00 01         [ 2] 4147 	ldw in.w,x
      0097FE 72 11 00 25      [ 1] 4148 	bres flags,#FRUN 
      009802 72 18 00 25      [ 1] 4149 	bset flags,#FBREAK
      009806 CC 87 E7         [ 2] 4150 	jp interp_loop 
      009809 0A 62 72 65 61 6B 20  4151 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4152 
                                   4153 ;-----------------------
                                   4154 ; BASIC: NEW
                                   4155 ; from command line only 
                                   4156 ; free program memory
                                   4157 ; and clear variables 
                                   4158 ;------------------------
      009827                       4159 new: 
      009827 72 01 00 25 02   [ 2] 4160 	btjf flags,#FRUN,0$ 
      00982C 4F               [ 1] 4161 	clr a 
      00982D 81               [ 4] 4162 	ret 
      00982E                       4163 0$:	
      00982E CD 85 FF         [ 4] 4164 	call clear_basic 
      009831 81               [ 4] 4165 	ret 
                                   4166 	 
                                   4167 ;--------------------
                                   4168 ; input:
                                   4169 ;   X     increment 
                                   4170 ; output:
                                   4171 ;   farptr  incremented 
                                   4172 ;---------------------
      009832                       4173 incr_farptr:
      009832 72 BB 00 15      [ 2] 4174 	addw x,farptr+1 
      009836 24 04            [ 1] 4175 	jrnc 1$
      009838 72 5C 00 14      [ 1] 4176 	inc farptr 
      00983C CF 00 15         [ 2] 4177 1$:	ldw farptr+1,x  
      00983F 81               [ 4] 4178 	ret 
                                   4179 
                                   4180 ;------------------------------
                                   4181 ; extended flash memory used as FLASH_DRIVE 
                                   4182 ; seek end of used flash drive   
                                   4183 ; starting at 0x10000 address.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



                                   4184 ; 4 consecutives 0 bytes signal free space. 
                                   4185 ; input:
                                   4186 ;	none
                                   4187 ; output:
                                   4188 ;   ffree     free_addr| 0 if memory full.
                                   4189 ;------------------------------
      009840                       4190 seek_fdrive:
      009840 A6 01            [ 1] 4191 	ld a,#1
      009842 C7 00 14         [ 1] 4192 	ld farptr,a 
      009845 5F               [ 1] 4193 	clrw x 
      009846 CF 00 15         [ 2] 4194 	ldw farptr+1,x 
      009849                       4195 1$:
      009849 5F               [ 1] 4196 	clrw x 
      00984A 92 AF 00 14      [ 5] 4197 	ldf a,([farptr],x) 
      00984E 26 15            [ 1] 4198 	jrne 2$
      009850 5C               [ 1] 4199 	incw x 
      009851 92 AF 00 14      [ 5] 4200 	ldf a,([farptr],x)
      009855 26 0E            [ 1] 4201 	jrne 2$ 
      009857 5C               [ 1] 4202 	incw x 
      009858 92 AF 00 14      [ 5] 4203 	ldf a,([farptr],x)
      00985C 26 07            [ 1] 4204 	jrne 2$ 
      00985E 5C               [ 1] 4205 	incw x 
      00985F 92 AF 00 14      [ 5] 4206 	ldf a,([farptr],x)
      009863 27 28            [ 1] 4207 	jreq 4$ 
      009865                       4208 2$: 
      009865 1C 00 01         [ 2] 4209 	addw x,#1
      009868 CD 98 32         [ 4] 4210 	call incr_farptr
      00986B AE 02 7F         [ 2] 4211 	ldw x,#0x27f 
      00986E C3 00 14         [ 2] 4212 	cpw x,farptr
      009871 2A D6            [ 1] 4213 	jrpl 1$
      009873 72 5F 00 17      [ 1] 4214 	clr ffree 
      009877 72 5F 00 18      [ 1] 4215 	clr ffree+1 
      00987B 72 5F 00 19      [ 1] 4216 	clr ffree+2 
      00987F 72 5F 00 09      [ 1] 4217 	clr acc24 
      009883 72 5F 00 0A      [ 1] 4218 	clr acc16
      009887 72 5F 00 0B      [ 1] 4219 	clr acc8 
      00988B 20 38            [ 2] 4220 	jra 5$
      00988D                       4221 4$: ; copy farptr to ffree	 
      00988D CE 00 15         [ 2] 4222 	ldw x,farptr+1 
      009890 A3 00 00         [ 2] 4223 	cpw x,#fdrive 
      009893 27 06            [ 1] 4224 	jreq 41$
                                   4225 	; there is a file, last 0 of that file must be skipped.
      009895 AE 00 01         [ 2] 4226 	ldw x,#1
      009898 CD 98 32         [ 4] 4227 	call incr_farptr
      00989B                       4228 41$: 
      00989B CE 00 14         [ 2] 4229 	ldw x,farptr 
      00989E C6 00 16         [ 1] 4230 	ld a,farptr+2 
      0098A1 CF 00 17         [ 2] 4231 	ldw ffree,x 
      0098A4 C7 00 19         [ 1] 4232 	ld ffree+2,a  
      0098A7 CF 00 09         [ 2] 4233 	ldw acc24,x 
      0098AA C7 00 0B         [ 1] 4234 	ld acc8,a 
      0098AD A6 FF            [ 1] 4235 	ld a,#0xff 
      0098AF C0 00 0B         [ 1] 4236 	sub a,acc8 
      0098B2 C7 00 0B         [ 1] 4237 	ld acc8,a 
      0098B5 A6 7F            [ 1] 4238 	ld a,#0x7f 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0098B7 C2 00 0A         [ 1] 4239 	sbc a,acc16 
      0098BA C7 00 0A         [ 1] 4240 	ld acc16,a 
      0098BD A6 02            [ 1] 4241 	ld a,#0x2 
      0098BF C2 00 09         [ 1] 4242 	sbc a,acc24 
      0098C2 C7 00 09         [ 1] 4243 	ld acc24,a 
      0098C5 AE 98 D7         [ 2] 4244 5$:	ldw x,#ffree_msg 
      0098C8 CD 82 B0         [ 4] 4245 	call puts 
      0098CB 5F               [ 1] 4246 	clrw x 
      0098CC A6 0A            [ 1] 4247 	ld a,#10
      0098CE CD 89 30         [ 4] 4248 	call prti24 
      0098D1 A6 0D            [ 1] 4249 	ld a,#CR 
      0098D3 CD 82 9E         [ 4] 4250 	call putc 
      0098D6 81               [ 4] 4251 	ret 
      0098D7 0A 66 6C 61 73 68 20  4252 ffree_msg: .asciz "\nflash drive bytes free: "
             64 72 69 76 65 20 62
             79 74 65 73 20 66 72
             65 65 3A 20 00
                                   4253 
                                   4254 ;-----------------------
                                   4255 ; compare file name 
                                   4256 ; with name pointed by Y  
                                   4257 ; input:
                                   4258 ;   farptr   file name 
                                   4259 ;   Y        target name 
                                   4260 ; output:
                                   4261 ;   farptr 	 at file_name
                                   4262 ;   X 		 farptr[x] point at size field  
                                   4263 ;   Carry    0|1 no match|match  
                                   4264 ;----------------------
      0098F1                       4265 cmp_name:
      0098F1 5F               [ 1] 4266 	clrw x
      0098F2 92 AF 00 14      [ 5] 4267 1$:	ldf a,([farptr],x)
      0098F6 90 F1            [ 1] 4268 	cp a,(y)
      0098F8 26 08            [ 1] 4269 	jrne 4$
      0098FA 4D               [ 1] 4270 	tnz a 
      0098FB 27 12            [ 1] 4271 	jreq 9$ 
      0098FD 5C               [ 1] 4272     incw x 
      0098FE 90 5C            [ 1] 4273 	incw y 
      009900 20 F0            [ 2] 4274 	jra 1$
      009902                       4275 4$: ;no match 
      009902 4D               [ 1] 4276 	tnz a 
      009903 27 07            [ 1] 4277 	jreq 5$
      009905 5C               [ 1] 4278 	incw x 
      009906 92 AF 00 14      [ 5] 4279 	ldf a,([farptr],x)
      00990A 20 F6            [ 2] 4280 	jra 4$  
      00990C 5C               [ 1] 4281 5$:	incw x ; farptr[x] point at 'size' field 
      00990D 98               [ 1] 4282 	rcf 
      00990E 81               [ 4] 4283 	ret
      00990F                       4284 9$: ; match  
      00990F 5C               [ 1] 4285 	incw x  ; farptr[x] at 'size' field 
      009910 99               [ 1] 4286 	scf 
      009911 81               [ 4] 4287 	ret 
                                   4288 
                                   4289 ;-----------------------
                                   4290 ; search file in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



                                   4291 ; flash memory 
                                   4292 ; input:
                                   4293 ;   Y       file name  
                                   4294 ; output:
                                   4295 ;   farptr  addr at name|0
                                   4296 ;-----------------------
                           000001  4297 	FSIZE=1
                           000003  4298 	YSAVE=3
                           000004  4299 	VSIZE=4 
      009912                       4300 search_file: 
      001892                       4301 	_vars VSIZE
      009912 52 04            [ 2]    1     sub sp,#VSIZE 
      009914 17 03            [ 2] 4302 	ldw (YSAVE,sp),y  
      009916 5F               [ 1] 4303 	clrw x 
      009917 CF 00 15         [ 2] 4304 	ldw farptr+1,x 
      00991A 35 01 00 14      [ 1] 4305 	mov farptr,#1
      00991E                       4306 1$:	
                                   4307 ; check if farptr is after any file 
                                   4308 ; if  0 then so.
      00991E 92 BC 00 14      [ 5] 4309 	ldf a,[farptr]
      009922 27 24            [ 1] 4310 	jreq 6$
      009924 5F               [ 1] 4311 2$: clrw x 	
      009925 16 03            [ 2] 4312 	ldw y,(YSAVE,sp) 
      009927 CD 98 F1         [ 4] 4313 	call cmp_name
      00992A 25 2C            [ 1] 4314 	jrc 9$
      00992C 92 AF 00 14      [ 5] 4315 	ldf a,([farptr],x)
      009930 6B 01            [ 1] 4316 	ld (FSIZE,sp),a 
      009932 5C               [ 1] 4317 	incw x 
      009933 92 AF 00 14      [ 5] 4318 	ldf a,([farptr],x)
      009937 6B 02            [ 1] 4319 	ld (FSIZE+1,sp),a 
      009939 5C               [ 1] 4320 	incw x 
      00993A 72 FB 01         [ 2] 4321 	addw x,(FSIZE,sp) ; count to skip 
      00993D CD 98 32         [ 4] 4322 	call incr_farptr ; now at next file 'name_field'
      009940 AE 02 80         [ 2] 4323 	ldw x,#0x280
      009943 C3 00 14         [ 2] 4324 	cpw x,farptr 
      009946 2A D6            [ 1] 4325 	jrpl 1$
      009948                       4326 6$: ; file not found 
      009948 72 5F 00 14      [ 1] 4327 	clr farptr
      00994C 72 5F 00 15      [ 1] 4328 	clr farptr+1 
      009950 72 5F 00 16      [ 1] 4329 	clr farptr+2 
      0018D4                       4330 	_drop VSIZE 
      009954 5B 04            [ 2]    1     addw sp,#VSIZE 
      009956 98               [ 1] 4331 	rcf
      009957 81               [ 4] 4332 	ret
      009958                       4333 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      0018D8                       4334 	_drop VSIZE 
      009958 5B 04            [ 2]    1     addw sp,#VSIZE 
      00995A 99               [ 1] 4335 	scf 	
      00995B 81               [ 4] 4336 	ret
                                   4337 
                                   4338 ;--------------------------------
                                   4339 ; BASIC: SAVE "name" 
                                   4340 ; save text program in 
                                   4341 ; flash memory used as 
                                   4342 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      00995C                       4343 save:
      00995C 72 01 00 25 05   [ 2] 4344 	btjf flags,#FRUN,0$ 
      009961 A6 07            [ 1] 4345 	ld a,#ERR_CMD_ONLY 
      009963 CC 87 23         [ 2] 4346 	jp tb_error
      009966                       4347 0$:	 
      009966 CE 00 1E         [ 2] 4348 	ldw x,txtend 
      009969 72 B0 00 1C      [ 2] 4349 	subw x,txtbgn
      00996D 26 02            [ 1] 4350 	jrne 10$
                                   4351 ; nothing to save 
      00996F 4F               [ 1] 4352 	clr a 
      009970 81               [ 4] 4353 	ret 
      009971                       4354 10$:	
      009971 C6 00 17         [ 1] 4355 	ld a,ffree 
      009974 CA 00 18         [ 1] 4356 	or a,ffree+1
      009977 CA 00 19         [ 1] 4357 	or a,ffree+2 
      00997A 26 05            [ 1] 4358 	jrne 1$
      00997C A6 01            [ 1] 4359 	ld a,#ERR_MEM_FULL
      00997E CC 87 23         [ 2] 4360 	jp tb_error 
      009981 CD 8C FD         [ 4] 4361 1$: call get_token	
      009984 A1 06            [ 1] 4362 	cp a,#TK_QSTR
      009986 27 03            [ 1] 4363 	jreq 2$
      009988 CC 87 21         [ 2] 4364 	jp syntax_error
      00998B                       4365 2$: ; check for existing file of that name 
      00998B 90 93            [ 1] 4366 	ldw y,x ; file name pointer 
      00998D CD 99 12         [ 4] 4367 	call search_file 
      009990 24 05            [ 1] 4368 	jrnc 3$ 
      009992 A6 08            [ 1] 4369 	ld a,#ERR_DUPLICATE 
      009994 CC 87 23         [ 2] 4370 	jp tb_error 
      009997                       4371 3$:	;** write file name to flash **
      009997 CE 00 17         [ 2] 4372 	ldw x,ffree 
      00999A C6 00 19         [ 1] 4373 	ld a,ffree+2 
      00999D CF 00 14         [ 2] 4374 	ldw farptr,x 
      0099A0 C7 00 16         [ 1] 4375 	ld farptr+2,a 
      0099A3 AE 17 18         [ 2] 4376 	ldw x,#pad  
      0099A6 CD 83 72         [ 4] 4377 	call strlen 
      0099A9 5C               [ 1] 4378 	incw  x
      0099AA 89               [ 2] 4379 	pushw x 
      0099AB 5F               [ 1] 4380 	clrw x   
      0099AC 90 AE 17 18      [ 2] 4381 	ldw y,#pad 
      0099B0 CD 82 51         [ 4] 4382 	call write_block  
      001933                       4383 	_drop 2 ; drop pushed X 
      0099B3 5B 02            [ 2]    1     addw sp,#2 
                                   4384 ;** write file length after name **
      0099B5 CE 00 1E         [ 2] 4385 	ldw x,txtend 
      0099B8 72 B0 00 1C      [ 2] 4386 	subw x,txtbgn
      0099BC 89               [ 2] 4387 	pushw x ; file size 
      0099BD 5F               [ 1] 4388 	clrw x 
      0099BE 7B 01            [ 1] 4389 	ld a,(1,sp)
      0099C0 CD 81 DC         [ 4] 4390 	call write_byte 
      0099C3 5C               [ 1] 4391 	incw x 
      0099C4 7B 02            [ 1] 4392 	ld a,(2,sp)
      0099C6 CD 81 DC         [ 4] 4393 	call write_byte
      0099C9 5C               [ 1] 4394 	incw x  
      0099CA CD 98 32         [ 4] 4395 	call incr_farptr ; move farptr after SIZE field 
                                   4396 ;** write BASIC text **
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4397 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      0099CD 1E 01            [ 2] 4398 	ldw x,(1,sp)
      0099CF 89               [ 2] 4399 	pushw x 
      0099D0 5F               [ 1] 4400 	clrw x 
      0099D1 90 CE 00 1C      [ 2] 4401 	ldw y,txtbgn  ; BASIC text to save 
      0099D5 CD 82 51         [ 4] 4402 	call write_block 
      001958                       4403 	_drop 2 ;  drop BSIZE argument
      0099D8 5B 02            [ 2]    1     addw sp,#2 
                                   4404 ; save farptr in ffree
      0099DA CE 00 14         [ 2] 4405 	ldw x,farptr 
      0099DD C6 00 16         [ 1] 4406 	ld a,farptr+2 
      0099E0 CF 00 17         [ 2] 4407 	ldw ffree,x 
      0099E3 C7 00 19         [ 1] 4408 	ld ffree+2,a
                                   4409 ; write 4 zero bytes as a safe gard 
      0099E6 5F               [ 1] 4410     clrw x 
      0099E7 4F               [ 1] 4411 	clr a 
      0099E8 CD 81 DC         [ 4] 4412 	call write_byte 
      0099EB 5C               [ 1] 4413 	incw x 
      0099EC 4F               [ 1] 4414 	clr a 
      0099ED CD 81 DC         [ 4] 4415 	call write_byte
      0099F0 5C               [ 1] 4416 	incw x 
      0099F1 4F               [ 1] 4417 	clr a 
      0099F2 CD 81 DC         [ 4] 4418 	call write_byte
                                   4419 ; display saved size  
      0099F5 85               [ 2] 4420 	popw x ; first copy of BSIZE 
      0099F6 A6 0A            [ 1] 4421 	ld a,#TK_INTGR 
      0099F8 81               [ 4] 4422 	ret 
                                   4423 
                                   4424 
                                   4425 ;------------------------
                                   4426 ; BASIC: LOAD "file" 
                                   4427 ; load file to RAM 
                                   4428 ; for execution 
                                   4429 ;------------------------
      0099F9                       4430 load:
      0099F9 72 01 00 25 07   [ 2] 4431 	btjf flags,#FRUN,0$ 
      0099FE 27 05            [ 1] 4432 	jreq 0$ 
      009A00 A6 07            [ 1] 4433 	ld a,#ERR_CMD_ONLY 
      009A02 CC 87 23         [ 2] 4434 	jp tb_error 
      009A05                       4435 0$:	
      009A05 CD 8C FD         [ 4] 4436 	call get_token 
      009A08 A1 06            [ 1] 4437 	cp a,#TK_QSTR
      009A0A 27 03            [ 1] 4438 	jreq 1$
      009A0C CC 87 21         [ 2] 4439 	jp syntax_error 
      009A0F                       4440 1$:	
      009A0F 90 93            [ 1] 4441 	ldw y,x 
      009A11 CD 99 12         [ 4] 4442 	call search_file 
      009A14 25 05            [ 1] 4443 	jrc 2$ 
      009A16 A6 09            [ 1] 4444 	ld a,#ERR_NOT_FILE
      009A18 CC 87 23         [ 2] 4445 	jp tb_error  
      009A1B                       4446 2$:	
      009A1B CD 98 32         [ 4] 4447 	call incr_farptr  
      009A1E CD 85 FF         [ 4] 4448 	call clear_basic  
      009A21 5F               [ 1] 4449 	clrw x
      009A22 92 AF 00 14      [ 5] 4450 	ldf a,([farptr],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009A26 90 95            [ 1] 4451 	ld yh,a 
      009A28 5C               [ 1] 4452 	incw x  
      009A29 92 AF 00 14      [ 5] 4453 	ldf a,([farptr],x)
      009A2D 5C               [ 1] 4454 	incw x 
      009A2E 90 97            [ 1] 4455 	ld yl,a 
      009A30 72 B9 00 1C      [ 2] 4456 	addw y,txtbgn
      009A34 90 CF 00 1E      [ 2] 4457 	ldw txtend,y
      009A38 90 CE 00 1C      [ 2] 4458 	ldw y,txtbgn
      009A3C                       4459 3$:	; load BASIC text 	
      009A3C 92 AF 00 14      [ 5] 4460 	ldf a,([farptr],x)
      009A40 90 F7            [ 1] 4461 	ld (y),a 
      009A42 5C               [ 1] 4462 	incw x 
      009A43 90 5C            [ 1] 4463 	incw y 
      009A45 90 C3 00 1E      [ 2] 4464 	cpw y,txtend 
      009A49 2B F1            [ 1] 4465 	jrmi 3$
                                   4466 ; return loaded size 	 
      009A4B CE 00 1E         [ 2] 4467 	ldw x,txtend 
      009A4E 72 B0 00 1C      [ 2] 4468 	subw x,txtbgn
      009A52 CD 89 85         [ 4] 4469 	call print_int 
      009A55 81               [ 4] 4470 	ret 
                                   4471 
                                   4472 ;-----------------------------------
                                   4473 ; BASIC: FORGET ["file_name"] 
                                   4474 ; erase file_name and all others 
                                   4475 ; after it. 
                                   4476 ; without argument erase all files 
                                   4477 ;-----------------------------------
      009A56                       4478 forget:
      009A56 CD 8C FD         [ 4] 4479 	call get_token 
      009A59 A1 00            [ 1] 4480 	cp a,#TK_NONE 
      009A5B 27 1B            [ 1] 4481 	jreq 3$ 
      009A5D A1 06            [ 1] 4482 	cp a,#TK_QSTR
      009A5F 27 03            [ 1] 4483 	jreq 1$
      009A61 CC 87 21         [ 2] 4484 	jp syntax_error
      009A64 90 93            [ 1] 4485 1$: ldw y,x
      009A66 CD 99 12         [ 4] 4486 	call search_file
      009A69 25 05            [ 1] 4487 	jrc 2$
      009A6B A6 09            [ 1] 4488 	ld a,#ERR_NOT_FILE 
      009A6D CC 87 23         [ 2] 4489 	jp tb_error 
      009A70                       4490 2$: 
      009A70 CE 00 14         [ 2] 4491 	ldw x,farptr
      009A73 C6 00 16         [ 1] 4492 	ld a,farptr+2
      009A76 20 0B            [ 2] 4493 	jra 4$ 
      009A78                       4494 3$: ; forget all files 
      009A78 AE 00 00         [ 2] 4495 	ldw x,#fdrive
      009A7B 4F               [ 1] 4496 	clr a 
      009A7C 01               [ 1] 4497 	rrwa x 
      009A7D CF 00 14         [ 2] 4498 	ldw farptr,x 
      009A80 C7 00 16         [ 1] 4499 	ld farptr+2,a 
      009A83                       4500 4$:
      009A83 CF 00 17         [ 2] 4501 	ldw ffree,x 
      009A86 C7 00 19         [ 1] 4502 	ld ffree+2,a 
      009A89 5F               [ 1] 4503 5$:	clrw x 
      009A8A 4F               [ 1] 4504 	clr a  
      009A8B CD 81 DC         [ 4] 4505 	call write_byte 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009A8E AE 00 01         [ 2] 4506 	ldw x,#1 
      009A91 CD 98 32         [ 4] 4507 	call incr_farptr
      009A94 C6 00 14         [ 1] 4508 	ld a,farptr
      009A97 C1 00 17         [ 1] 4509 	cp a,ffree 
      009A9A 2B ED            [ 1] 4510 	jrmi 5$ 
      009A9C CE 00 15         [ 2] 4511 	ldw x,farptr+1 
      009A9F C3 00 18         [ 2] 4512 	cpw x,ffree+1
      009AA2 2B E5            [ 1] 4513 	jrmi 5$
      009AA4 81               [ 4] 4514 	ret 
                                   4515 
                                   4516 ;----------------------
                                   4517 ; BASIC: DIR 
                                   4518 ; list saved files 
                                   4519 ;----------------------
                           000001  4520 	COUNT=1 ; files counter 
                           000002  4521 	VSIZE=2 
      009AA5                       4522 directory:
      001A25                       4523 	_vars VSIZE 
      009AA5 52 02            [ 2]    1     sub sp,#VSIZE 
      009AA7 5F               [ 1] 4524 	clrw x 
      009AA8 1F 01            [ 2] 4525 	ldw (COUNT,sp),x 
      009AAA CF 00 15         [ 2] 4526 	ldw farptr+1,x 
      009AAD 35 01 00 14      [ 1] 4527 	mov farptr,#1 
      009AB1                       4528 dir_loop:
      009AB1 5F               [ 1] 4529 	clrw x 
      009AB2 92 AF 00 14      [ 5] 4530 	ldf a,([farptr],x)
      009AB6 27 38            [ 1] 4531 	jreq 8$ 
      009AB8                       4532 1$: ;name loop 	
      009AB8 92 AF 00 14      [ 5] 4533 	ldf a,([farptr],x)
      009ABC 27 06            [ 1] 4534 	jreq 2$ 
      009ABE CD 82 9E         [ 4] 4535 	call putc 
      009AC1 5C               [ 1] 4536 	incw x 
      009AC2 20 F4            [ 2] 4537 	jra 1$
      009AC4 5C               [ 1] 4538 2$: incw x ; skip ending 0. 
      009AC5 A6 20            [ 1] 4539 	ld a,#SPACE 
      009AC7 CD 82 9E         [ 4] 4540 	call putc 
                                   4541 ; get file size 	
      009ACA 92 AF 00 14      [ 5] 4542 	ldf a,([farptr],x)
      009ACE 90 95            [ 1] 4543 	ld yh,a 
      009AD0 5C               [ 1] 4544 	incw x 
      009AD1 92 AF 00 14      [ 5] 4545 	ldf a,([farptr],x)
      009AD5 5C               [ 1] 4546 	incw x 
      009AD6 90 97            [ 1] 4547 	ld yl,a 
      009AD8 90 89            [ 2] 4548 	pushw y 
      009ADA 72 FB 01         [ 2] 4549 	addw x,(1,sp)
      009ADD CD 98 32         [ 4] 4550 	call incr_farptr 
      009AE0 85               [ 2] 4551 	popw x ; file size 
      009AE1 CD 89 85         [ 4] 4552 	call print_int 
      009AE4 A6 0D            [ 1] 4553 	ld a,#CR 
      009AE6 CD 82 9E         [ 4] 4554 	call putc
      009AE9 1E 01            [ 2] 4555 	ldw x,(COUNT,sp)
      009AEB 5C               [ 1] 4556 	incw x
      009AEC 1F 01            [ 2] 4557 	ldw (COUNT,sp),x  
      009AEE 20 C1            [ 2] 4558 	jra dir_loop 
      009AF0                       4559 8$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



      009AF0 1E 01            [ 2] 4560 	ldw x,(COUNT,sp)
      009AF2 CD 89 85         [ 4] 4561 	call print_int 
      009AF5 AE 9A FE         [ 2] 4562 	ldw x,#file_count 
      009AF8 CD 82 B0         [ 4] 4563 	call puts  
      001A7B                       4564 	_drop VSIZE 
      009AFB 5B 02            [ 2]    1     addw sp,#VSIZE 
      009AFD 81               [ 4] 4565 	ret
      009AFE 20 66 69 6C 65 73 0A  4566 file_count: .asciz " files\n"
             00
                                   4567 
                                   4568 ;---------------------
                                   4569 ; BASIC: WRITE expr1,expr2 
                                   4570 ; write byte to FLASH or EEPROM 
                                   4571 ; input:
                                   4572 ;   expr1  	is address 
                                   4573 ;   expr2   is byte to write
                                   4574 ; output:
                                   4575 ;   none 
                                   4576 ;---------------------
      009B06                       4577 write:
      009B06 72 5F 00 14      [ 1] 4578 	clr farptr ; expect 16 bits address 
      009B0A CD 91 C9         [ 4] 4579 	call arg_list  
      009B0D A1 02            [ 1] 4580 	cp a,#2
      009B0F 27 03            [ 1] 4581 	jreq 1$
      009B11 CC 87 21         [ 2] 4582 	jp syntax_error
      009B14                       4583 1$:
      009B14 CD 8F BD         [ 4] 4584 	call dpop 
      009B17 9F               [ 1] 4585 	ld a,xl 
      009B18 CD 8F BD         [ 4] 4586 	call dpop 
      009B1B CF 00 15         [ 2] 4587 	ldw farptr+1,x 
      009B1E 5F               [ 1] 4588 	clrw x 
      009B1F CD 81 DC         [ 4] 4589 	call write_byte 
      009B22 81               [ 4] 4590 	ret 
                                   4591 
                                   4592 
                                   4593 ;---------------------
                                   4594 ;BASIC: CHAR(expr)
                                   4595 ; évaluate expression 
                                   4596 ; and take the 7 least 
                                   4597 ; bits as ASCII character
                                   4598 ;---------------------
      009B23                       4599 char:
      009B23 A6 04            [ 1] 4600 	ld a,#TK_LPAREN 
      009B25 CD 91 BC         [ 4] 4601 	call expect 
      009B28 CD 93 05         [ 4] 4602 	call relation 
      009B2B A1 0A            [ 1] 4603 	cp a,#TK_INTGR 
      009B2D 27 03            [ 1] 4604 	jreq 1$
      009B2F CC 87 21         [ 2] 4605 	jp syntax_error
      009B32 89               [ 2] 4606 1$:	pushw x 
      009B33 A6 05            [ 1] 4607 	ld a,#TK_RPAREN 
      009B35 CD 91 BC         [ 4] 4608 	call expect
      009B38 85               [ 2] 4609 	popw x  
      009B39 9F               [ 1] 4610 	ld a,xl 
      009B3A A4 7F            [ 1] 4611 	and a,#0x7f 
      009B3C 97               [ 1] 4612 	ld xl,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009B3D A6 0B            [ 1] 4613 	ld a,#TK_CHAR
      009B3F 81               [ 4] 4614 	ret
                                   4615 
                                   4616 ;---------------------
                                   4617 ; BASIC: ASC(string|char)
                                   4618 ; extract first character 
                                   4619 ; of string argument 
                                   4620 ; return it as TK_INTGR 
                                   4621 ;---------------------
      009B40                       4622 ascii:
      009B40 A6 04            [ 1] 4623 	ld a,#TK_LPAREN
      009B42 CD 91 BC         [ 4] 4624 	call expect 
      009B45 CD 8C FD         [ 4] 4625 	call get_token 
      009B48 A1 06            [ 1] 4626 	cp a,#TK_QSTR 
      009B4A 27 07            [ 1] 4627 	jreq 1$
      009B4C A1 0B            [ 1] 4628 	cp a,#TK_CHAR 
      009B4E 27 06            [ 1] 4629 	jreq 2$ 
      009B50 CC 87 21         [ 2] 4630 	jp syntax_error
      009B53                       4631 1$: 
      009B53 F6               [ 1] 4632 	ld a,(x)
      009B54 20 01            [ 2] 4633 	jra 3$
      009B56                       4634 2$: 
      009B56 9F               [ 1] 4635 	ld a,xl 
      009B57 97               [ 1] 4636 3$:	ld xl,a 
      009B58 4F               [ 1] 4637 	clr a  
      009B59 95               [ 1] 4638 	ld xh,a 
      009B5A 89               [ 2] 4639 	pushw x  
      009B5B A6 05            [ 1] 4640 	ld a,#TK_RPAREN 
      009B5D CD 91 BC         [ 4] 4641 	call expect 
      009B60 85               [ 2] 4642 	popw x 
      009B61 A6 0A            [ 1] 4643 	ld a,#TK_INTGR 
      009B63 81               [ 4] 4644 	ret 
                                   4645 
                                   4646 ;---------------------
                                   4647 ;BASIC: KEY
                                   4648 ; wait for a character 
                                   4649 ; received from STDIN 
                                   4650 ; input:
                                   4651 ;	none 
                                   4652 ; output:
                                   4653 ;	X 		ASCII character 
                                   4654 ;---------------------
      009B64                       4655 key:
      009B64 CD 82 A7         [ 4] 4656 	call getc 
      009B67 5F               [ 1] 4657 	clrw x 
      009B68 97               [ 1] 4658 	ld xl,a 
      009B69 A6 0A            [ 1] 4659 	ld a,#TK_INTGR
      009B6B 81               [ 4] 4660 	ret
                                   4661 
                                   4662 ;----------------------
                                   4663 ; BASIC: QKEY
                                   4664 ; Return true if there 
                                   4665 ; is a character in 
                                   4666 ; waiting in STDIN 
                                   4667 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4668 ;  none 
                                   4669 ; output:
                                   4670 ;   X 		0|1 
                                   4671 ;-----------------------
      009B6C                       4672 qkey: 
      009B6C 5F               [ 1] 4673 	clrw x 
      009B6D 72 0B 52 40 01   [ 2] 4674 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      009B72 5C               [ 1] 4675 	incw x 
      009B73 A6 0A            [ 1] 4676 9$: ld a,#TK_INTGR
      009B75 81               [ 4] 4677 	ret 
                                   4678 
                                   4679 ;---------------------
                                   4680 ; BASIC: GPIO(expr,reg)
                                   4681 ; return gpio address 
                                   4682 ; expr {0..8}
                                   4683 ; input:
                                   4684 ;   none 
                                   4685 ; output:
                                   4686 ;   X 		gpio register address
                                   4687 ;----------------------------
      009B76                       4688 gpio:
      009B76 A6 04            [ 1] 4689 	ld a,#TK_LPAREN 
      009B78 CD 91 BC         [ 4] 4690 	call expect 
      009B7B CD 91 C9         [ 4] 4691 	call arg_list
      009B7E A1 02            [ 1] 4692 	cp a,#2
      009B80 27 03            [ 1] 4693 	jreq 1$
      009B82 CC 87 21         [ 2] 4694 	jp syntax_error  
      009B85                       4695 1$:	
      009B85 A6 05            [ 1] 4696 	ld a,#TK_RPAREN 
      009B87 CD 91 BC         [ 4] 4697 	call expect 
      009B8A AE 00 02         [ 2] 4698 	ldw x,#2
      009B8D 72 DE 00 1A      [ 5] 4699 	ldw x,([dstkptr],x) ; port 
      009B91 2B 1E            [ 1] 4700 	jrmi bad_port
      009B93 A3 00 09         [ 2] 4701 	cpw x,#9
      009B96 2A 19            [ 1] 4702 	jrpl bad_port
      009B98 A6 05            [ 1] 4703 	ld a,#5
      009B9A 42               [ 4] 4704 	mul x,a
      009B9B 1C 50 00         [ 2] 4705 	addw x,#GPIO_BASE 
      009B9E 89               [ 2] 4706 	pushw x 
      009B9F CD 8F BD         [ 4] 4707 	call dpop 
      009BA2 72 FB 01         [ 2] 4708 	addw x,(1,sp)
      009BA5 1F 01            [ 2] 4709 	ldw (1,sp),x  
      009BA7 AE 00 02         [ 2] 4710 	ldw x,#2 
      009BAA CD 91 4D         [ 4] 4711 	call ddrop_n 
      009BAD 85               [ 2] 4712 	popw x 
      009BAE A6 0A            [ 1] 4713 	ld a,#TK_INTGR
      009BB0 81               [ 4] 4714 	ret
      009BB1                       4715 bad_port:
      009BB1 A6 0A            [ 1] 4716 	ld a,#ERR_BAD_VALUE
      009BB3 CC 87 23         [ 2] 4717 	jp tb_error
                                   4718 
                                   4719 ;----------------------
                                   4720 ; BASIC: ODR 
                                   4721 ; return offset of gpio
                                   4722 ; ODR register: 0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4723 ; ---------------------
      009BB6                       4724 port_odr:
      009BB6 AE 00 00         [ 2] 4725 	ldw x,#GPIO_ODR
      009BB9 A6 0A            [ 1] 4726 	ld a,#TK_INTGR
      009BBB 81               [ 4] 4727 	ret
                                   4728 
                                   4729 ;----------------------
                                   4730 ; BASIC: IDR 
                                   4731 ; return offset of gpio
                                   4732 ; IDR register: 1
                                   4733 ; ---------------------
      009BBC                       4734 port_idr:
      009BBC AE 00 01         [ 2] 4735 	ldw x,#GPIO_IDR
      009BBF A6 0A            [ 1] 4736 	ld a,#TK_INTGR
      009BC1 81               [ 4] 4737 	ret
                                   4738 
                                   4739 ;----------------------
                                   4740 ; BASIC: DDR 
                                   4741 ; return offset of gpio
                                   4742 ; DDR register: 2
                                   4743 ; ---------------------
      009BC2                       4744 port_ddr:
      009BC2 AE 00 02         [ 2] 4745 	ldw x,#GPIO_DDR
      009BC5 A6 0A            [ 1] 4746 	ld a,#TK_INTGR
      009BC7 81               [ 4] 4747 	ret
                                   4748 
                                   4749 ;----------------------
                                   4750 ; BASIC: CRL  
                                   4751 ; return offset of gpio
                                   4752 ; CR1 register: 3
                                   4753 ; ---------------------
      009BC8                       4754 port_cr1:
      009BC8 AE 00 03         [ 2] 4755 	ldw x,#GPIO_CR1
      009BCB A6 0A            [ 1] 4756 	ld a,#TK_INTGR
      009BCD 81               [ 4] 4757 	ret
                                   4758 
                                   4759 ;----------------------
                                   4760 ; BASIC: CRH  
                                   4761 ; return offset of gpio
                                   4762 ; CR2 register: 4
                                   4763 ; ---------------------
      009BCE                       4764 port_cr2:
      009BCE AE 00 04         [ 2] 4765 	ldw x,#GPIO_CR2
      009BD1 A6 0A            [ 1] 4766 	ld a,#TK_INTGR
      009BD3 81               [ 4] 4767 	ret
                                   4768 
                                   4769 
                                   4770 ;---------------------
                                   4771 ; BASIC: USR(addr[,arg])
                                   4772 ; execute a function written 
                                   4773 ; in binary code.
                                   4774 ; binary fonction should 
                                   4775 ; return token attribute in A 
                                   4776 ; and value in X. 
                                   4777 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4778 ;   addr	routine address 
                                   4779 ;   arg 	is an optional argument 
                                   4780 ; output:
                                   4781 ;   A 		token attribute 
                                   4782 ;   X       returned value 
                                   4783 ;---------------------
      009BD4                       4784 usr:
      009BD4 90 89            [ 2] 4785 	pushw y 	
      009BD6 A6 04            [ 1] 4786 	ld a,#TK_LPAREN 
      009BD8 CD 91 BC         [ 4] 4787 	call expect 
      009BDB CD 91 C9         [ 4] 4788 	call arg_list 
      009BDE A1 01            [ 1] 4789 	cp a,#1 
      009BE0 2A 03            [ 1] 4790 	jrpl 2$ 
      009BE2 CC 87 21         [ 2] 4791 	jp syntax_error 
      009BE5 A6 05            [ 1] 4792 2$: ld a,#TK_RPAREN
      009BE7 CD 91 BC         [ 4] 4793 	call expect 
      009BEA CD 8F BD         [ 4] 4794 	call dpop 
      009BED A1 02            [ 1] 4795 	cp a,#2 
      009BEF 2B 05            [ 1] 4796 	jrmi 4$
      009BF1 90 93            [ 1] 4797 	ldw y,x ; y=arg 
      009BF3 CD 8F BD         [ 4] 4798 	call dpop ;x=addr 
      009BF6 51               [ 1] 4799 4$:	exgw y,x ; y=addr,x=arg 
      009BF7 90 FD            [ 4] 4800 	call (y)
      009BF9 90 85            [ 2] 4801 	popw y 
      009BFB 81               [ 4] 4802 	ret 
                                   4803 
                                   4804 ;------------------------------
                                   4805 ; BASIC: BYE 
                                   4806 ; halt mcu in its lowest power mode 
                                   4807 ; wait for reset or external interrupt
                                   4808 ; do a cold start on wakeup.
                                   4809 ;------------------------------
      009BFC                       4810 bye:
      009BFC 72 0D 52 40 FB   [ 2] 4811 	btjf UART3_SR,#UART_SR_TC,.
      009C01 8E               [10] 4812 	halt
      009C02 CC 85 64         [ 2] 4813 	jp cold_start  
                                   4814 
                                   4815 ;----------------------------------
                                   4816 ; BASIC: SLEEP 
                                   4817 ; halt mcu until reset or external
                                   4818 ; interrupt.
                                   4819 ; Resume progam after SLEEP command
                                   4820 ;----------------------------------
      009C05                       4821 sleep:
      009C05 72 0D 52 40 FB   [ 2] 4822 	btjf UART3_SR,#UART_SR_TC,.
      009C0A 72 16 00 25      [ 1] 4823 	bset flags,#FSLEEP
      009C0E 8E               [10] 4824 	halt 
      009C0F 81               [ 4] 4825 	ret 
                                   4826 
                                   4827 ;-------------------------------
                                   4828 ; BASIC: PAUSE expr 
                                   4829 ; suspend execution for n msec.
                                   4830 ; input:
                                   4831 ;	none
                                   4832 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4833 ;	none 
                                   4834 ;------------------------------
      009C10                       4835 pause:
      009C10 CD 92 C1         [ 4] 4836 	call expression
      009C13 A1 0A            [ 1] 4837 	cp a,#TK_INTGR
      009C15 27 03            [ 1] 4838 	jreq pause02 
      009C17 CC 87 21         [ 2] 4839 	jp syntax_error
      009C1A                       4840 pause02: 
      009C1A 5D               [ 2] 4841 1$: tnzw x 
      009C1B 27 04            [ 1] 4842 	jreq 2$
      009C1D 8F               [10] 4843 	wfi 
      009C1E 5A               [ 2] 4844 	decw x 
      009C1F 26 F9            [ 1] 4845 	jrne 1$
      009C21 4F               [ 1] 4846 2$:	clr a 
      009C22 81               [ 4] 4847 	ret 
                                   4848 
                                   4849 ;------------------------------
                                   4850 ; BASIC: TICKS
                                   4851 ; return msec ticks counter value 
                                   4852 ; input:
                                   4853 ; 	none 
                                   4854 ; output:
                                   4855 ;	X 		TK_INTGR
                                   4856 ;-------------------------------
      009C23                       4857 get_ticks:
      009C23 CE 00 0C         [ 2] 4858 	ldw x,ticks 
      009C26 A6 0A            [ 1] 4859 	ld a,#TK_INTGR
      009C28 81               [ 4] 4860 	ret 
                                   4861 
                                   4862 
                                   4863 
                                   4864 ;------------------------------
                                   4865 ; BASIC: ABS(expr)
                                   4866 ; return absolute value of expr.
                                   4867 ; input:
                                   4868 ;   none
                                   4869 ; output:
                                   4870 ;   X     	positive integer
                                   4871 ;-------------------------------
      009C29                       4872 abs:
      009C29 A6 04            [ 1] 4873 	ld a,#TK_LPAREN
      009C2B CD 91 BC         [ 4] 4874 	call expect 
      009C2E CD 91 C9         [ 4] 4875 	call arg_list
      009C31 A1 01            [ 1] 4876 	cp a,#1 
      009C33 27 03            [ 1] 4877 	jreq 0$ 
      009C35 CC 87 21         [ 2] 4878 	jp syntax_error
      009C38                       4879 0$:  
      009C38 A6 05            [ 1] 4880 	ld a,#TK_RPAREN 
      009C3A CD 91 BC         [ 4] 4881 	call expect 
      009C3D CD 8F BD         [ 4] 4882     call dpop   
      009C40 9E               [ 1] 4883 	ld a,xh 
      009C41 A5 80            [ 1] 4884 	bcp a,#0x80 
      009C43 27 01            [ 1] 4885 	jreq 2$ 
      009C45 50               [ 2] 4886 	negw x 
      009C46 A6 0A            [ 1] 4887 2$: ld a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009C48 81               [ 4] 4888 	ret 
                                   4889 
                                   4890 ;------------------------------
                                   4891 ; BASIC: RND(expr)
                                   4892 ; return random number 
                                   4893 ; between 1 and expr inclusive
                                   4894 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4895 ; input:
                                   4896 ; 	none 
                                   4897 ; output:
                                   4898 ;	X 		random positive integer 
                                   4899 ;------------------------------
      009C49                       4900 random:
      009C49 A6 04            [ 1] 4901 	ld a,#TK_LPAREN 
      009C4B CD 91 BC         [ 4] 4902 	call expect 
      009C4E CD 91 C9         [ 4] 4903 	call arg_list 
      009C51 A1 01            [ 1] 4904 	cp a,#1
      009C53 27 03            [ 1] 4905 	jreq 1$
      009C55 CC 87 21         [ 2] 4906 	jp syntax_error
      009C58 A6 05            [ 1] 4907 1$: ld a,#TK_RPAREN
      009C5A CD 91 BC         [ 4] 4908 	call expect 
      009C5D CD 8F BD         [ 4] 4909 	call dpop 
      009C60 89               [ 2] 4910 	pushw x 
      009C61 9E               [ 1] 4911 	ld a,xh 
      009C62 A5 80            [ 1] 4912 	bcp a,#0x80 
      009C64 27 05            [ 1] 4913 	jreq 2$
      009C66 A6 0A            [ 1] 4914 	ld a,#ERR_BAD_VALUE
      009C68 CC 87 23         [ 2] 4915 	jp tb_error
      009C6B                       4916 2$: 
                                   4917 ; acc16=(x<<5)^x 
      009C6B CE 00 0E         [ 2] 4918 	ldw x,seedx 
      009C6E 58               [ 2] 4919 	sllw x 
      009C6F 58               [ 2] 4920 	sllw x 
      009C70 58               [ 2] 4921 	sllw x 
      009C71 58               [ 2] 4922 	sllw x 
      009C72 58               [ 2] 4923 	sllw x 
      009C73 9E               [ 1] 4924 	ld a,xh 
      009C74 C8 00 0E         [ 1] 4925 	xor a,seedx 
      009C77 C7 00 0A         [ 1] 4926 	ld acc16,a 
      009C7A 9F               [ 1] 4927 	ld a,xl 
      009C7B C8 00 0F         [ 1] 4928 	xor a,seedx+1 
      009C7E C7 00 0B         [ 1] 4929 	ld acc8,a 
                                   4930 ; seedx=seedy 
      009C81 CE 00 10         [ 2] 4931 	ldw x,seedy 
      009C84 CF 00 0E         [ 2] 4932 	ldw seedx,x  
                                   4933 ; seedy=seedy^(seedy>>1)
      009C87 90 54            [ 2] 4934 	srlw y 
      009C89 90 9E            [ 1] 4935 	ld a,yh 
      009C8B C8 00 10         [ 1] 4936 	xor a,seedy 
      009C8E C7 00 10         [ 1] 4937 	ld seedy,a  
      009C91 90 9F            [ 1] 4938 	ld a,yl 
      009C93 C8 00 11         [ 1] 4939 	xor a,seedy+1 
      009C96 C7 00 11         [ 1] 4940 	ld seedy+1,a 
                                   4941 ; acc16>>3 
      009C99 CE 00 0A         [ 2] 4942 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009C9C 54               [ 2] 4943 	srlw x 
      009C9D 54               [ 2] 4944 	srlw x 
      009C9E 54               [ 2] 4945 	srlw x 
                                   4946 ; x=acc16^x 
      009C9F 9E               [ 1] 4947 	ld a,xh 
      009CA0 C8 00 0A         [ 1] 4948 	xor a,acc16 
      009CA3 95               [ 1] 4949 	ld xh,a 
      009CA4 9F               [ 1] 4950 	ld a,xl 
      009CA5 C8 00 0B         [ 1] 4951 	xor a,acc8 
      009CA8 97               [ 1] 4952 	ld xl,a 
                                   4953 ; seedy=x^seedy 
      009CA9 C8 00 11         [ 1] 4954 	xor a,seedy+1
      009CAC 97               [ 1] 4955 	ld xl,a 
      009CAD 9E               [ 1] 4956 	ld a,xh 
      009CAE C8 00 10         [ 1] 4957 	xor a,seedy
      009CB1 95               [ 1] 4958 	ld xh,a 
      009CB2 CF 00 10         [ 2] 4959 	ldw seedy,x 
                                   4960 ; return seedy modulo expr + 1 
      009CB5 90 85            [ 2] 4961 	popw y 
      009CB7 65               [ 2] 4962 	divw x,y 
      009CB8 93               [ 1] 4963 	ldw x,y 
      009CB9 5C               [ 1] 4964 	incw x 
      009CBA A6 0A            [ 1] 4965 	ld a,#TK_INTGR
      009CBC 81               [ 4] 4966 	ret 
                                   4967 
                                   4968 ;*********************************
                                   4969 
                                   4970 ;------------------------------
                                   4971 ;      dictionary 
                                   4972 ; format:
                                   4973 ;   link   2 bytes 
                                   4974 ;   cmd_name 8 byte max 
                                   4975 ;   code_address 2 bytes 
                                   4976 ;------------------------------
                           000080  4977 	FFUNC=128 
                                   4978 	.macro _dict_entry len,name,cmd 
                                   4979 	.word LINK 
                                   4980 	LINK=.
                                   4981 name:
                                   4982 	.byte len 	
                                   4983 	.ascii "name"
                                   4984 	.word cmd 
                                   4985 	.endm 
                                   4986 
                           000000  4987 	LINK=0
      009CBD                       4988 kword_end:
      001C3D                       4989 	_dict_entry,3,BYE,bye 
      009CBD 00 00                    1 	.word LINK 
                           001C3F     2 	LINK=.
      009CBF                          3 BYE:
      009CBF 03                       4 	.byte 3 	
      009CC0 42 59 45                 5 	.ascii "BYE"
      009CC3 9B FC                    6 	.word bye 
      001C45                       4990 	_dict_entry,5,SLEEP,sleep 
      009CC5 9C BF                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



                           001C47     2 	LINK=.
      009CC7                          3 SLEEP:
      009CC7 05                       4 	.byte 5 	
      009CC8 53 4C 45 45 50           5 	.ascii "SLEEP"
      009CCD 9C 05                    6 	.word sleep 
      001C4F                       4991 	_dict_entry,6,FORGET,forget 
      009CCF 9C C7                    1 	.word LINK 
                           001C51     2 	LINK=.
      009CD1                          3 FORGET:
      009CD1 06                       4 	.byte 6 	
      009CD2 46 4F 52 47 45 54        5 	.ascii "FORGET"
      009CD8 9A 56                    6 	.word forget 
      001C5A                       4992 	_dict_entry,3,DIR,directory 
      009CDA 9C D1                    1 	.word LINK 
                           001C5C     2 	LINK=.
      009CDC                          3 DIR:
      009CDC 03                       4 	.byte 3 	
      009CDD 44 49 52                 5 	.ascii "DIR"
      009CE0 9A A5                    6 	.word directory 
      001C62                       4993 	_dict_entry,4,LOAD,load 
      009CE2 9C DC                    1 	.word LINK 
                           001C64     2 	LINK=.
      009CE4                          3 LOAD:
      009CE4 04                       4 	.byte 4 	
      009CE5 4C 4F 41 44              5 	.ascii "LOAD"
      009CE9 99 F9                    6 	.word load 
      001C6B                       4994 	_dict_entry,4,SAVE,save
      009CEB 9C E4                    1 	.word LINK 
                           001C6D     2 	LINK=.
      009CED                          3 SAVE:
      009CED 04                       4 	.byte 4 	
      009CEE 53 41 56 45              5 	.ascii "SAVE"
      009CF2 99 5C                    6 	.word save 
      001C74                       4995 	_dict_entry,5,WRITE,write  
      009CF4 9C ED                    1 	.word LINK 
                           001C76     2 	LINK=.
      009CF6                          3 WRITE:
      009CF6 05                       4 	.byte 5 	
      009CF7 57 52 49 54 45           5 	.ascii "WRITE"
      009CFC 9B 06                    6 	.word write 
      001C7E                       4996 	_dict_entry,3,NEW,new
      009CFE 9C F6                    1 	.word LINK 
                           001C80     2 	LINK=.
      009D00                          3 NEW:
      009D00 03                       4 	.byte 3 	
      009D01 4E 45 57                 5 	.ascii "NEW"
      009D04 98 27                    6 	.word new 
      001C86                       4997 	_dict_entry,5,BREAK,break 
      009D06 9D 00                    1 	.word LINK 
                           001C88     2 	LINK=.
      009D08                          3 BREAK:
      009D08 05                       4 	.byte 5 	
      009D09 42 52 45 41 4B           5 	.ascii "BREAK"
      009D0E 97 D8                    6 	.word break 
      001C90                       4998 	_dict_entry,4,STOP,stop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009D10 9D 08                    1 	.word LINK 
                           001C92     2 	LINK=.
      009D12                          3 STOP:
      009D12 04                       4 	.byte 4 	
      009D13 53 54 4F 50              5 	.ascii "STOP"
      009D17 97 C9                    6 	.word stop 
      001C99                       4999     _dict_entry,4,SHOW,show 
      009D19 9D 12                    1 	.word LINK 
                           001C9B     2 	LINK=.
      009D1B                          3 SHOW:
      009D1B 04                       4 	.byte 4 	
      009D1C 53 48 4F 57              5 	.ascii "SHOW"
      009D20 90 92                    6 	.word show 
      001CA2                       5000 	_dict_entry 3,RUN,run
      009D22 9D 1B                    1 	.word LINK 
                           001CA4     2 	LINK=.
      009D24                          3 RUN:
      009D24 03                       4 	.byte 3 	
      009D25 52 55 4E                 5 	.ascii "RUN"
      009D28 97 80                    6 	.word run 
      001CAA                       5001 	_dict_entry 4,LIST,list
      009D2A 9D 24                    1 	.word LINK 
                           001CAC     2 	LINK=.
      009D2C                          3 LIST:
      009D2C 04                       4 	.byte 4 	
      009D2D 4C 49 53 54              5 	.ascii "LIST"
      009D31 93 A6                    6 	.word list 
      001CB3                       5002 	_dict_entry,3+FFUNC,USR,usr
      009D33 9D 2C                    1 	.word LINK 
                           001CB5     2 	LINK=.
      009D35                          3 USR:
      009D35 83                       4 	.byte 3+FFUNC 	
      009D36 55 53 52                 5 	.ascii "USR"
      009D39 9B D4                    6 	.word usr 
      001CBB                       5003 	_dict_entry,3+FFUNC,ODR,port_odr
      009D3B 9D 35                    1 	.word LINK 
                           001CBD     2 	LINK=.
      009D3D                          3 ODR:
      009D3D 83                       4 	.byte 3+FFUNC 	
      009D3E 4F 44 52                 5 	.ascii "ODR"
      009D41 9B B6                    6 	.word port_odr 
      001CC3                       5004 	_dict_entry,3+FFUNC,IDR,port_idr
      009D43 9D 3D                    1 	.word LINK 
                           001CC5     2 	LINK=.
      009D45                          3 IDR:
      009D45 83                       4 	.byte 3+FFUNC 	
      009D46 49 44 52                 5 	.ascii "IDR"
      009D49 9B BC                    6 	.word port_idr 
      001CCB                       5005 	_dict_entry,3+FFUNC,DDR,port_ddr 
      009D4B 9D 45                    1 	.word LINK 
                           001CCD     2 	LINK=.
      009D4D                          3 DDR:
      009D4D 83                       4 	.byte 3+FFUNC 	
      009D4E 44 44 52                 5 	.ascii "DDR"
      009D51 9B C2                    6 	.word port_ddr 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      001CD3                       5006 	_dict_entry,3+FFUNC,CRL,port_cr1 
      009D53 9D 4D                    1 	.word LINK 
                           001CD5     2 	LINK=.
      009D55                          3 CRL:
      009D55 83                       4 	.byte 3+FFUNC 	
      009D56 43 52 4C                 5 	.ascii "CRL"
      009D59 9B C8                    6 	.word port_cr1 
      001CDB                       5007 	_dict_entry,3+FFUNC,CRH,port_cr2
      009D5B 9D 55                    1 	.word LINK 
                           001CDD     2 	LINK=.
      009D5D                          3 CRH:
      009D5D 83                       4 	.byte 3+FFUNC 	
      009D5E 43 52 48                 5 	.ascii "CRH"
      009D61 9B CE                    6 	.word port_cr2 
      001CE3                       5008 	_dict_entry,4+FFUNC,GPIO,gpio 
      009D63 9D 5D                    1 	.word LINK 
                           001CE5     2 	LINK=.
      009D65                          3 GPIO:
      009D65 84                       4 	.byte 4+FFUNC 	
      009D66 47 50 49 4F              5 	.ascii "GPIO"
      009D6A 9B 76                    6 	.word gpio 
      001CEC                       5009 	_dict_entry,3+FFUNC,ASC,ascii  
      009D6C 9D 65                    1 	.word LINK 
                           001CEE     2 	LINK=.
      009D6E                          3 ASC:
      009D6E 83                       4 	.byte 3+FFUNC 	
      009D6F 41 53 43                 5 	.ascii "ASC"
      009D72 9B 40                    6 	.word ascii 
      001CF4                       5010 	_dict_entry,4+FFUNC,CHAR,char
      009D74 9D 6E                    1 	.word LINK 
                           001CF6     2 	LINK=.
      009D76                          3 CHAR:
      009D76 84                       4 	.byte 4+FFUNC 	
      009D77 43 48 41 52              5 	.ascii "CHAR"
      009D7B 9B 23                    6 	.word char 
      001CFD                       5011 	_dict_entry,4+FFUNC,QKEY,qkey  
      009D7D 9D 76                    1 	.word LINK 
                           001CFF     2 	LINK=.
      009D7F                          3 QKEY:
      009D7F 84                       4 	.byte 4+FFUNC 	
      009D80 51 4B 45 59              5 	.ascii "QKEY"
      009D84 9B 6C                    6 	.word qkey 
      001D06                       5012 	_dict_entry,3+FFUNC,KEY,key 
      009D86 9D 7F                    1 	.word LINK 
                           001D08     2 	LINK=.
      009D88                          3 KEY:
      009D88 83                       4 	.byte 3+FFUNC 	
      009D89 4B 45 59                 5 	.ascii "KEY"
      009D8C 9B 64                    6 	.word key 
      001D0E                       5013 	_dict_entry,4+FFUNC,SIZE,size
      009D8E 9D 88                    1 	.word LINK 
                           001D10     2 	LINK=.
      009D90                          3 SIZE:
      009D90 84                       4 	.byte 4+FFUNC 	
      009D91 53 49 5A 45              5 	.ascii "SIZE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009D95 93 66                    6 	.word size 
      001D17                       5014 	_dict_entry,3,HEX,hex_base
      009D97 9D 90                    1 	.word LINK 
                           001D19     2 	LINK=.
      009D99                          3 HEX:
      009D99 03                       4 	.byte 3 	
      009D9A 48 45 58                 5 	.ascii "HEX"
      009D9D 93 5C                    6 	.word hex_base 
      001D1F                       5015 	_dict_entry,3,DEC,dec_base
      009D9F 9D 99                    1 	.word LINK 
                           001D21     2 	LINK=.
      009DA1                          3 DEC:
      009DA1 03                       4 	.byte 3 	
      009DA2 44 45 43                 5 	.ascii "DEC"
      009DA5 93 61                    6 	.word dec_base 
      001D27                       5016 	_dict_entry,5+FFUNC,TICKS,get_ticks
      009DA7 9D A1                    1 	.word LINK 
                           001D29     2 	LINK=.
      009DA9                          3 TICKS:
      009DA9 85                       4 	.byte 5+FFUNC 	
      009DAA 54 49 43 4B 53           5 	.ascii "TICKS"
      009DAF 9C 23                    6 	.word get_ticks 
      001D31                       5017 	_dict_entry,3+FFUNC,ABS,abs
      009DB1 9D A9                    1 	.word LINK 
                           001D33     2 	LINK=.
      009DB3                          3 ABS:
      009DB3 83                       4 	.byte 3+FFUNC 	
      009DB4 41 42 53                 5 	.ascii "ABS"
      009DB7 9C 29                    6 	.word abs 
      001D39                       5018 	_dict_entry,3+FFUNC,RND,random 
      009DB9 9D B3                    1 	.word LINK 
                           001D3B     2 	LINK=.
      009DBB                          3 RND:
      009DBB 83                       4 	.byte 3+FFUNC 	
      009DBC 52 4E 44                 5 	.ascii "RND"
      009DBF 9C 49                    6 	.word random 
      001D41                       5019 	_dict_entry,5,PAUSE,pause 
      009DC1 9D BB                    1 	.word LINK 
                           001D43     2 	LINK=.
      009DC3                          3 PAUSE:
      009DC3 05                       4 	.byte 5 	
      009DC4 50 41 55 53 45           5 	.ascii "PAUSE"
      009DC9 9C 10                    6 	.word pause 
      001D4B                       5020 	_dict_entry,4,BSET,bit_set 
      009DCB 9D C3                    1 	.word LINK 
                           001D4D     2 	LINK=.
      009DCD                          3 BSET:
      009DCD 04                       4 	.byte 4 	
      009DCE 42 53 45 54              5 	.ascii "BSET"
      009DD2 95 8C                    6 	.word bit_set 
      001D54                       5021 	_dict_entry,4,BRES,bit_reset
      009DD4 9D CD                    1 	.word LINK 
                           001D56     2 	LINK=.
      009DD6                          3 BRES:
      009DD6 04                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009DD7 42 52 45 53              5 	.ascii "BRES"
      009DDB 95 A0                    6 	.word bit_reset 
      001D5D                       5022 	_dict_entry,5,BTOGL,bit_toggle
      009DDD 9D D6                    1 	.word LINK 
                           001D5F     2 	LINK=.
      009DDF                          3 BTOGL:
      009DDF 05                       4 	.byte 5 	
      009DE0 42 54 4F 47 4C           5 	.ascii "BTOGL"
      009DE5 95 B5                    6 	.word bit_toggle 
      001D67                       5023 	_dict_entry 4,WAIT,wait 
      009DE7 9D DF                    1 	.word LINK 
                           001D69     2 	LINK=.
      009DE9                          3 WAIT:
      009DE9 04                       4 	.byte 4 	
      009DEA 57 41 49 54              5 	.ascii "WAIT"
      009DEE 95 61                    6 	.word wait 
      001D70                       5024 	_dict_entry 6,REMARK,rem 
      009DF0 9D E9                    1 	.word LINK 
                           001D72     2 	LINK=.
      009DF2                          3 REMARK:
      009DF2 06                       4 	.byte 6 	
      009DF3 52 45 4D 41 52 4B        5 	.ascii "REMARK"
      009DF9 95 60                    6 	.word rem 
      001D7B                       5025 	_dict_entry 5,PRINT,print 
      009DFB 9D F2                    1 	.word LINK 
                           001D7D     2 	LINK=.
      009DFD                          3 PRINT:
      009DFD 05                       4 	.byte 5 	
      009DFE 50 52 49 4E 54           5 	.ascii "PRINT"
      009E03 94 5B                    6 	.word print 
      001D85                       5026 	_dict_entry,2,IF,if 
      009E05 9D FD                    1 	.word LINK 
                           001D87     2 	LINK=.
      009E07                          3 IF:
      009E07 02                       4 	.byte 2 	
      009E08 49 46                    5 	.ascii "IF"
      009E0A 95 F9                    6 	.word if 
      001D8C                       5027 	_dict_entry,5,GOSUB,gosub 
      009E0C 9E 07                    1 	.word LINK 
                           001D8E     2 	LINK=.
      009E0E                          3 GOSUB:
      009E0E 05                       4 	.byte 5 	
      009E0F 47 4F 53 55 42           5 	.ascii "GOSUB"
      009E14 97 11                    6 	.word gosub 
      001D96                       5028 	_dict_entry,4,GOTO,goto 
      009E16 9E 0E                    1 	.word LINK 
                           001D98     2 	LINK=.
      009E18                          3 GOTO:
      009E18 04                       4 	.byte 4 	
      009E19 47 4F 54 4F              5 	.ascii "GOTO"
      009E1D 97 04                    6 	.word goto 
      001D9F                       5029 	_dict_entry,3,FOR,for 
      009E1F 9E 18                    1 	.word LINK 
                           001DA1     2 	LINK=.
      009E21                          3 FOR:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009E21 03                       4 	.byte 3 	
      009E22 46 4F 52                 5 	.ascii "FOR"
      009E25 96 0D                    6 	.word for 
      001DA7                       5030 	_dict_entry,2,TO,to
      009E27 9E 21                    1 	.word LINK 
                           001DA9     2 	LINK=.
      009E29                          3 TO:
      009E29 02                       4 	.byte 2 	
      009E2A 54 4F                    5 	.ascii "TO"
      009E2C 96 37                    6 	.word to 
      001DAE                       5031 	_dict_entry,4,STEP,step 
      009E2E 9E 29                    1 	.word LINK 
                           001DB0     2 	LINK=.
      009E30                          3 STEP:
      009E30 04                       4 	.byte 4 	
      009E31 53 54 45 50              5 	.ascii "STEP"
      009E35 96 67                    6 	.word step 
      001DB7                       5032 	_dict_entry,4,NEXT,next 
      009E37 9E 30                    1 	.word LINK 
                           001DB9     2 	LINK=.
      009E39                          3 NEXT:
      009E39 04                       4 	.byte 4 	
      009E3A 4E 45 58 54              5 	.ascii "NEXT"
      009E3E 96 8F                    6 	.word next 
      001DC0                       5033 	_dict_entry,6+FFUNC,UBOUND,ubound 
      009E40 9E 39                    1 	.word LINK 
                           001DC2     2 	LINK=.
      009E42                          3 UBOUND:
      009E42 86                       4 	.byte 6+FFUNC 	
      009E43 55 42 4F 55 4E 44        5 	.ascii "UBOUND"
      009E49 93 70                    6 	.word ubound 
      001DCB                       5034 	_dict_entry,6,RETURN,return 
      009E4B 9E 42                    1 	.word LINK 
                           001DCD     2 	LINK=.
      009E4D                          3 RETURN:
      009E4D 06                       4 	.byte 6 	
      009E4E 52 45 54 55 52 4E        5 	.ascii "RETURN"
      009E54 97 5C                    6 	.word return 
      001DD6                       5035 	_dict_entry,4+FFUNC,PEEK,peek 
      009E56 9E 4D                    1 	.word LINK 
                           001DD8     2 	LINK=.
      009E58                          3 PEEK:
      009E58 84                       4 	.byte 4+FFUNC 	
      009E59 50 45 45 4B              5 	.ascii "PEEK"
      009E5D 95 DC                    6 	.word peek 
      001DDF                       5036 	_dict_entry,4,POKE,poke 
      009E5F 9E 58                    1 	.word LINK 
                           001DE1     2 	LINK=.
      009E61                          3 POKE:
      009E61 04                       4 	.byte 4 	
      009E62 50 4F 4B 45              5 	.ascii "POKE"
      009E66 95 C9                    6 	.word poke 
      001DE8                       5037 	_dict_entry,5,INPUT,input_var  
      009E68 9E 61                    1 	.word LINK 
                           001DEA     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009E6A                          3 INPUT:
      009E6A 05                       4 	.byte 5 	
      009E6B 49 4E 50 55 54           5 	.ascii "INPUT"
      009E70 94 EC                    6 	.word input_var 
      009E72                       5038 kword_dict:
      001DF2                       5039 	_dict_entry 3,LET,let 
      009E72 9E 6A                    1 	.word LINK 
                           001DF4     2 	LINK=.
      009E74                          3 LET:
      009E74 03                       4 	.byte 3 	
      009E75 4C 45 54                 5 	.ascii "LET"
      009E78 93 7E                    6 	.word let 
                                   5040 	
                                   5041 
      009E80                       5042 	.bndry 128 ; align on FLASH block.
                                   5043 ; free space for user application  
      009E80                       5044 user_space:
      009E80 89               [ 2] 5045 	pushw x 
      009E81 72 1A 50 0A      [ 1] 5046 	bset PC_ODR,#5 
      009E85 85               [ 2] 5047 	popw x 
      009E86 CD 9C 1A         [ 4] 5048 	call pause02 
      009E89 72 1B 50 0A      [ 1] 5049 	bres PC_ODR,#5 
      009E8D 81               [ 4] 5050 	ret
                                   5051 
                                   5052 	.area FLASH_DRIVE (ABS)
      010000                       5053 	.org 0x10000
      010000                       5054 fdrive:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        001D33 R   |     ADC_CR1 =  005401 
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
    ARG_OFS =  000002     |   5 ASC        001CEE R   |     ATTRIB  =  000002 
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
    BPTR    =  000005     |   5 BREAK      001C88 R   |   5 BRES       001D56 R
  5 BSET       001D4D R   |     BSIZE   =  000005     |     BSP     =  000008 
  5 BTOGL      001D5F R   |     BTW     =  000001     |   5 BYE        001C3F R
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
  5 CHAR       001CF6 R   |     CLKOPT  =  004807     |     CLKOPT_C=  000002 
    CLKOPT_E=  000003     |     CLKOPT_P=  000000     |     CLKOPT_P=  000001 
    CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6     |     CLK_CKDI=  000000 
    CLK_CKDI=  000001     |     CLK_CKDI=  000002     |     CLK_CKDI=  000003 
    CLK_CKDI=  000004     |     CLK_CMSR=  0050C3     |     CLK_CSSR=  0050C8 
    CLK_ECKR=  0050C1     |     CLK_ECKR=  000000     |     CLK_ECKR=  000001 
    CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0     |     CLK_ICKR=  000002 
    CLK_ICKR=  000000     |     CLK_ICKR=  000001     |     CLK_ICKR=  000003 
    CLK_ICKR=  000004     |     CLK_ICKR=  000005     |     CLK_PCKE=  0050C7 
    CLK_PCKE=  000000     |     CLK_PCKE=  000001     |     CLK_PCKE=  000007 
    CLK_PCKE=  000005     |     CLK_PCKE=  000006     |     CLK_PCKE=  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]

Symbol Table

    CLK_PCKE=  000002     |     CLK_PCKE=  000003     |     CLK_PCKE=  0050CA 
    CLK_PCKE=  000003     |     CLK_PCKE=  000002     |     CLK_PCKE=  000007 
    CLK_SWCR=  0050C5     |     CLK_SWCR=  000000     |     CLK_SWCR=  000001 
    CLK_SWCR=  000002     |     CLK_SWCR=  000003     |     CLK_SWIM=  0050CD 
    CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4     |     CLK_SWR_=  0000E1 
    CLK_SWR_=  0000D2     |     CNT     =  000008     |     COMMA   =  000001 
    COUNT   =  000001     |     CPU_A   =  007F00     |     CPU_CCR =  007F0A 
    CPU_PCE =  007F01     |     CPU_PCH =  007F02     |     CPU_PCL =  007F03 
    CPU_SPH =  007F08     |     CPU_SPL =  007F09     |     CPU_XH  =  007F04 
    CPU_XL  =  007F05     |     CPU_YH  =  007F06     |     CPU_YL  =  007F07 
    CR      =  00000D     |   5 CRH        001CDD R   |   5 CRL        001CD5 R
    CTRL_A  =  000001     |     CTRL_B  =  000002     |     CTRL_C  =  000003 
    CTRL_D  =  000004     |     CTRL_E  =  000005     |     CTRL_F  =  000006 
    CTRL_G  =  000007     |     CTRL_H  =  000008     |     CTRL_I  =  000009 
    CTRL_J  =  00000A     |     CTRL_K  =  00000B     |     CTRL_L  =  00000C 
    CTRL_M  =  00000D     |     CTRL_N  =  00000E     |     CTRL_O  =  00000F 
    CTRL_P  =  000010     |     CTRL_Q  =  000011     |     CTRL_R  =  000012 
    CTRL_S  =  000013     |     CTRL_T  =  000014     |     CTRL_U  =  000015 
    CTRL_V  =  000016     |     CTRL_W  =  000017     |     CTRL_X  =  000018 
    CTRL_Y  =  000019     |     CTRL_Z  =  00001A     |     CTXT_SIZ=  000006 
    CURR    =  000002     |     CX_BPTR =  000001     |     CX_CNT  =  000005 
    CX_IN   =  000004     |     CX_LNO  =  000003     |     DBG_A   =  000005 
    DBG_CC  =  000006     |     DBG_X   =  000003     |     DBG_Y   =  000001 
  5 DDR        001CCD R   |     DEBUG   =  000001     |     DEBUG_BA=  007F00 
    DEBUG_EN=  007FFF     |   5 DEC        001D21 R   |     DEST    =  000001 
    DEVID_BA=  0048CD     |     DEVID_EN=  0048D8     |     DEVID_LO=  0048D2 
    DEVID_LO=  0048D3     |     DEVID_LO=  0048D4     |     DEVID_LO=  0048D5 
    DEVID_LO=  0048D6     |     DEVID_LO=  0048D7     |     DEVID_LO=  0048D8 
    DEVID_WA=  0048D1     |     DEVID_XH=  0048CE     |     DEVID_XL=  0048CD 
    DEVID_YH=  0048D0     |     DEVID_YL=  0048CF     |   5 DIR        001C5C R
    DIVIDND =  000007     |     DIVISR  =  000005     |     DM_BK1RE=  007F90 
    DM_BK1RH=  007F91     |     DM_BK1RL=  007F92     |     DM_BK2RE=  007F93 
    DM_BK2RH=  007F94     |     DM_BK2RL=  007F95     |     DM_CR1  =  007F96 
    DM_CR2  =  007F97     |     DM_CSR1 =  007F98     |     DM_CSR2 =  007F99 
    DM_ENFCT=  007F9A     |     DSTACK_S=  000040     |     EEPROM_B=  004000 
    EEPROM_E=  0047FF     |     EEPROM_S=  000800     |     ERR_BAD_=  00000A 
    ERR_CMD_=  000007     |     ERR_DIV0=  000004     |     ERR_DUPL=  000008 
    ERR_MATH=  000003     |     ERR_MEM_=  000001     |     ERR_NONE=  000000 
    ERR_NOT_=  000009     |     ERR_NO_A=  00000B     |     ERR_NO_L=  000005 
    ERR_RUN_=  000006     |     ERR_SYNT=  000002     |     ESC     =  00001B 
    EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1     |     FBREAK  =  000004 
    FF      =  00000C     |     FFOR    =  000002     |     FFUNC   =  000080 
    FHSE    =  7A1200     |     FHSI    =  F42400     |     FIRST   =  000001 
    FLASH_BA=  008000     |     FLASH_CR=  00505A     |     FLASH_CR=  000002 
    FLASH_CR=  000000     |     FLASH_CR=  000003     |     FLASH_CR=  000001 
    FLASH_CR=  00505B     |     FLASH_CR=  000005     |     FLASH_CR=  000004 
    FLASH_CR=  000007     |     FLASH_CR=  000000     |     FLASH_CR=  000006 
    FLASH_DU=  005064     |     FLASH_DU=  0000AE     |     FLASH_DU=  000056 
    FLASH_EN=  027FFF     |     FLASH_FP=  00505D     |     FLASH_FP=  000000 
    FLASH_FP=  000001     |     FLASH_FP=  000002     |     FLASH_FP=  000003 
    FLASH_FP=  000004     |     FLASH_FP=  000005     |     FLASH_IA=  00505F 
    FLASH_IA=  000003     |     FLASH_IA=  000002     |     FLASH_IA=  000006 
    FLASH_IA=  000001     |     FLASH_IA=  000000     |     FLASH_NC=  00505C 
    FLASH_NF=  00505E     |     FLASH_NF=  000000     |     FLASH_NF=  000001 
    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLSI    =  01F400     |   5 FOR        001DA1 R   |   5 FORGET     001C51 R
    FRUN    =  000000     |     FSIZE   =  000001     |     FSLEEP  =  000003 
    FTRAP   =  000001     |   5 GOSUB      001D8E R   |     GOS_RET =  000003 
  5 GOTO       001D98 R   |   5 GPIO       001CE5 R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  5 HEX        001D19 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        001CC5 R
  5 IF         001D87 R   |     IN      =  000007     |     INCR    =  000001 
  5 INPUT      001DEA R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
    INT_VECT=  008048     |     INT_VECT=  008044     |     INT_VECT=  008064 
    INT_VECT=  008008     |     INT_VECT=  008004     |     INT_VECT=  008050 
    INT_VECT=  00804C     |     INT_VECT=  00805C     |     INT_VECT=  008058 
    INW     =  000003     |     ITC_SPR1=  007F70     |     ITC_SPR2=  007F71 
    ITC_SPR3=  007F72     |     ITC_SPR4=  007F73     |     ITC_SPR5=  007F74 
    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]

Symbol Table

    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        001D08 R   |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000005     |   5 LET        001DF4 R   |     LINENO  =  000005 
  5 LINK    =  001DF4 R   |   5 LIST       001CAC R   |     LL      =  000002 
    LLEN    =  000007     |     LL_HB   =  000001     |     LNO     =  000005 
    LN_PTR  =  000005     |   5 LOAD       001C64 R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NCLKOPT =  004808 
    NEG     =  000001     |   5 NEW        001C80 R   |   5 NEXT       001DB9 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NL      =  00000A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000009 R   |   5 ODR        001CBD R   |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |     PAD_SIZE=  000028 
  5 PAUSE      001D43 R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   5 PEEK       001DD8 R
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
    PI_ODR  =  005028     |   5 POKE       001DE1 R   |     PREV    =  000001 
  5 PRINT      001D7D R   |     PROD    =  000002     |     PSIZE   =  000001 
  5 QKEY       001CFF R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 REG_A      0008A2 R   |   5 REG_CC     0008A6 R
  5 REG_EPC    000895 R   |   5 REG_SP     0008AB R   |   5 REG_X      00089E R
  5 REG_Y      00089A R   |     RELOP   =  000005     |   5 REMARK     001D72 R
    RETL1   =  000001     |   5 RETURN     001DCD R   |   5 RND        001D3B R
    ROP     =  004800     |     RST_SR  =  0050B3     |   5 RUN        001CA4 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]

Symbol Table

    RXCHAR  =  000001     |     R_A     =  000007     |     R_CC    =  000008 
    R_X     =  000005     |     R_Y     =  000003     |   5 SAVE       001C6D R
    SDIVD   =  000002     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       001C9B R   |     SIGN    =  000001 
  5 SIZE       001D10 R   |     SKIP    =  000006     |   5 SLEEP      001C47 R
    SPACE   =  000020     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  000080     |   5 STATES     000858 R   |   5 STEP       001DB0 R
  5 STOP       001C92 R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      001D29 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

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
    TK_ARRAY=  000003     |     TK_CHAR =  00000B     |     TK_CMD  =  000007 
    TK_COLON=  000001     |     TK_COMMA=  000008     |     TK_DIV  =  000021 
    TK_EQUAL=  000032     |     TK_FUNC =  00000C     |     TK_GE   =  000033 
    TK_GRP_A=  000010     |     TK_GRP_M=  000030     |     TK_GRP_M=  000000 
    TK_GRP_M=  000020     |     TK_GRP_R=  000030     |     TK_GT   =  000031 
    TK_INTGR=  00000A     |     TK_LE   =  000036     |     TK_LPARE=  000004 
    TK_LT   =  000034     |     TK_MINUS=  000011     |     TK_MOD  =  000022 
    TK_MULT =  000020     |     TK_NE   =  000035     |     TK_NONE =  000000 
    TK_PLUS =  000010     |     TK_QSTR =  000006     |     TK_RPARE=  000005 
    TK_SHARP=  000009     |     TK_VAR  =  000002     |   5 TO         001DA9 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

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
  5 UBOUND     001DC2 R   |   5 USER_ABO   000083 R   |   5 USR        001CB5 R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 UserButt   000025 R   |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       001D69 R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |   5 WRITE      001C76 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XMASK   =  000001     |     XSAVE   =  000001 
    YSAVE   =  000003     |   5 abs        001BA9 R   |   1 acc16      000009 R
  1 acc24      000008 R   |   1 acc8       00000A R   |   5 accept_c   000A5D R
  5 add        001022 R   |   5 ansi_seq   000A1B R   |   5 arg_list   001149 R
  1 array_ad   000020 R   |   1 array_si   000022 R   |   5 ascii      001AC0 R
  5 at_tst     000D38 R   |   5 atoi       000E71 R   |   5 atoi_exi   000EDF R
  5 bad_port   001B31 R   |   1 base       000007 R   |   1 basicptr   000003 R
  5 bin_exit   000C30 R   |   5 bit_rese   001520 R   |   5 bit_set    00150C R
  5 bit_togg   001535 R   |   5 bkslsh_t   000CE3 R   |   5 bksp       00023A R
  5 break      001758 R   |   5 break_po   001789 R   |   5 bye        001B7C R
  5 char       001AA3 R   |   5 clear_ba   00057F R   |   5 clear_va   00046A R
  5 clock_in   00009E R   |   5 cmd_itf    000A81 R   |   5 cmp_name   001871 R
  5 cold_sta   0004E4 R   |   5 colon_ts   000D0C R   |   5 comma_ts   000D17 R
  5 convert_   000B96 R   |   1 count      000002 R   |   5 cp_loop    0010F5 R
  5 create_g   0003BF R   |   5 cstk_pro   000FDC R   |   5 dash_tst   000D2D R
  5 ddrop      000F64 R   |   5 ddrop_n    0010CD R   |   5 ddup       000F6D R
  5 dec_base   0012E1 R   |   5 del_back   000A4E R   |   5 del_line   000390 R
  5 del_ln     000A3F R   |   5 delete     00024A R   |   5 dir_loop   001A31 R
  5 director   001A25 R   |   5 divide     001078 R   |   5 divu24_8   0009A8 R
  5 dotr       000FE5 R   |   5 dotr_loo   000FFA R   |   5 dots       000FB2 R
  5 dpick      000F7E R   |   5 dpop       000F3D R   |   5 dpush      000F30 R
  3 dstack     001740 R   |   3 dstack_u   001780 R   |   5 dstk_pro   000FA8 R
  1 dstkptr    000019 R   |   5 dswap      000F4A R   |   5 empty      0013AC R
  5 eql_tst    000D9A R   |   5 erase_bl   000120 R   |   5 erase_en   00010C R
  5 erase_fl   000146 R   |   5 erase_st   0000E1 R   |   5 err_bad_   000660 R
  5 err_cmd_   000621 R   |   5 err_div0   0005E3 R   |   5 err_dupl   00063C R
  5 err_math   0005C9 R   |   5 err_mem_   0005AC R   |   5 err_msg    000594 R
  5 err_no_a   00066D R   |   5 err_no_l   0005F3 R   |   5 err_not_   00064E R
  5 err_run_   00060A R   |   5 err_synt   0005BA R   |   5 execute    0010E0 R
  5 expect     00113C R   |   5 expr_exi   001282 R   |   5 expressi   001241 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

  5 factor     0011A0 R   |   1 farptr     000013 R   |   7 fdrive     010000 R
  5 fetch      000F8D R   |   5 fetchc     000B4E R   |   1 ffree      000016 R
  5 ffree_ms   001857 R   |   5 file_cou   001A7E R   |   5 final_te   000A15 R
  5 first_li   001351 R   |   1 flags      000024 R   |   5 for        00158D R
  5 forget     0019D6 R   |   1 free_ram   00005A R   |   5 get_arra   00116D R
  5 get_tick   001BA3 R   |   5 get_toke   000C7D R   |   5 getc       000227 R
  5 go_commo   0016B4 R   |   5 gosub      001691 R   |   5 goto       001684 R
  5 gpio       001AF6 R   |   5 gt_tst     000DA5 R   |   5 hex_base   0012DC R
  5 hse_cloc   000207 R   |   5 hsi_cloc   000211 R   |   5 if         001579 R
  1 in         000001 R   |   1 in.w       000000 R   |   1 in.w.sav   000011 R
  5 incr_far   0017B2 R   |   5 input_ex   0014DD R   |   5 input_lo   001478 R
  5 input_va   00146C R   |   5 insert_l   0003F0 R   |   5 insert_l   000467 R
  5 interp     000721 R   |   5 interp_l   000767 R   |   5 invalid    000AB6 R
  5 invalid_   000B24 R   |   5 is_alpha   000478 R   |   5 is_digit   000E38 R
  5 itoa       000961 R   |   5 itoa_loo   000979 R   |   5 key        001AE4 R
  5 kword_di   001DF2 R   |   5 kword_en   001C3D R   |   5 last_lin   00135A R
  5 ledoff     0007A8 R   |   5 ledon      0007A3 R   |   5 ledtoggl   0007AD R
  5 left_arr   000A1B R   |   5 left_par   0007B6 R   |   5 let        0012FE R
  5 let02      001308 R   |   1 lineno     000005 R   |   5 lines_sk   00135F R
  5 list       001326 R   |   5 list_exi   0013A9 R   |   5 list_sta   001382 R
  5 load       001979 R   |   5 loop_bac   001657 R   |   1 loop_dep   00001F R
  5 loop_don   001672 R   |   5 lt_tst     000DDE R   |   5 mem_peek   000AD2 R
  5 modulo     0010BC R   |   5 move       00031E R   |   5 move_cod   00010C R
  5 move_dow   00033C R   |   5 move_exi   00035E R   |   5 move_loo   000341 R
  5 move_up    00032E R   |   5 multiply   001030 R   |   5 mulu24_8   000EE3 R
  5 nbr_tst    000CB9 R   |   5 neg_acc2   0009D0 R   |   5 new        0017A7 R
  5 next       00160F R   |   5 no_match   001107 R   |   5 none       000C7D R
  5 number     000B54 GR  |   5 other      000E16 R   |   3 pad        001718 R
  5 parse_bi   000C10 R   |   5 parse_in   000BD5 R   |   5 parse_ke   000C38 R
  5 parse_qu   000B5B R   |   5 parser_i   0008F8 GR  |   5 pause      001B90 R
  5 pause02    001B9A R   |   5 peek       00155C R   |   5 peek_byt   000AEE R
  5 plus_tst   000D6E R   |   5 poke       001549 R   |   5 port_cr1   001B48 R
  5 port_cr2   001B4E R   |   5 port_ddr   001B42 R   |   5 port_idr   001B3C R
  5 port_odr   001B36 R   |   5 prcnt_ts   000D8F R   |   5 print      0013DB R
  5 print_ex   001436 R   |   5 print_fa   000B33 R   |   5 print_in   000905 R
  5 print_re   000805 R   |   5 print_st   000AC6 R   |   5 prt_basi   0013BD R
  5 prt_loop   0013DF R   |   5 prt_peek   0002CE R   |   5 prt_reg1   0007E6 R
  5 prt_reg8   0007C1 R   |   5 prt_regs   000264 R   |   5 prti24     0008B0 R
  5 putc       00021E R   |   5 puts       000230 R   |   5 qkey       001AEC R
  5 qmark_ts   000D43 R   |   5 random     001BC9 R   |   5 readln     0009F3 R
  5 readln_l   0009F9 R   |   5 readln_q   000A72 R   |   5 regs_sta   0002A7 R
  5 rel_exit   0012D9 R   |   5 relation   001285 R   |   5 rem        0014E0 R
  5 repl       000A8F R   |   5 repl_exi   000AB3 R   |   5 reprint    000A1B R
  5 reset_co   0013DD R   |   5 rest_con   001457 R   |   5 return     0016DC R
  5 right_ar   000A1B R   |   5 rparnt_t   000D01 R   |   5 run        001700 R
  5 save       0018DC R   |   5 save_con   001442 R   |   5 search_d   0010E4 R
  5 search_e   001138 R   |   5 search_f   001892 R   |   5 search_l   000361 R
  5 search_l   00036C R   |   5 search_n   0010E8 R   |   1 seedx      00000D R
  1 seedy      00000F R   |   5 seek_fdr   0017C0 R   |   5 sharp_ts   000D22 R
  5 show       001012 R   |   5 size       0012E6 R   |   5 skip       000F1D R
  5 slash_ts   000D84 R   |   5 sleep      001B85 R   |   5 software   000489 R
  5 spaces     000258 R   |   3 stack_fu   001780 R   |   3 stack_un   001800 R
  5 star_tst   000D79 R   |   5 step       0015E7 R   |   5 stop       001749 R
  5 store      000F97 R   |   5 store_lo   0015F9 R   |   5 str_matc   001116 R
  5 str_tst    000CA8 R   |   5 strcmp     0002FF R   |   5 strcpy     000310 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

  5 strlen     0002F2 R   |   5 substrac   00102A R   |   5 syntax_e   0006A1 R
  1 tab_widt   000025 R   |   5 tb_error   0006A3 R   |   5 term       0011F4 R
  5 term01     0011FD R   |   5 term_exi   00123E R   |   5 test_p     000ABE R
  3 tib        0016C8 R   |   5 tick_tst   000D5A R   |   1 ticks      00000B R
  5 timer4_i   0000B4 R   |   5 to         0015B7 R   |   5 to_lower   000E41 GR
  5 to_upper   000E4C GR  |   5 token_ch   000E25 R   |   5 token_ex   000E35 R
  1 txtbgn     00001B R   |   1 txtend     00001D R   |   5 uart3_in   0001F4 R
  5 uart3_se   000200 R   |   5 uart_ena   000219 R   |   5 ubound     0012F0 R
  5 unget_to   000FA1 R   |   5 unlock_e   0000C5 R   |   5 unlock_f   0000D3 R
  5 upper      000E58 R   |   5 upper_lo   000E5C R   |   5 user_spa   001E00 R
  5 usr        001B54 R   |   5 usr_addr   0004CF R   |   1 vars       000026 R
  5 wait       0014E1 R   |   5 warm_sta   000701 R   |   5 write      001A86 R
  5 write_bl   0001D1 R   |   5 write_by   00015C R   |   5 write_ee   000198 R
  5 write_ex   0001CC R   |   5 write_fl   000182 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5A   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   1E0E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

