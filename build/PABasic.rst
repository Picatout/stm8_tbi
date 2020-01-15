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
      000006                         56 basicptr:  .blkb 2  ; point to text buffer 
      000008                         57 lineno: .blkb 2  ; BASIC line number 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



      000009                         58 base:  .blkb 1 ; nemeric base used to print integer 
      00000A                         59 acc24: .blkb 1 ; 24 accumulator
      00000B                         60 acc16: .blkb 1
      00000C                         61 acc8:  .blkb 1
      00000E                         62 ticks: .blkw 1 ; milliseconds ticks counter (see Timer4UpdateHandler)
      000010                         63 seedx: .blkw 1  ; xorshift 16 seed x 
      000012                         64 seedy: .blkw 1  ; xorshift 16 seed y 
      000014                         65 in.w.saved: .blkw 1 ; set by get_token before parsing next token, used by unget_token
      000017                         66 farptr: .blkb 3 ; far pointer used by file system
      00001A                         67 ffree: .blkb 3 ; flash free address ; file system free space pointer
      00001C                         68 dstkptr: .blkw 1  ; data stack pointer 
      00001E                         69 txtbgn: .ds 2 ; BASIC text beginning address 
      000020                         70 txtend: .ds 2 ; BASIC text end address 
      000021                         71 loop_depth: .ds 1 ; FOR loop depth, level of nested loop.  
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
      001780                         86 dstack: .ds DSTACK_SIZE 	  ; data stack used by FOR...NEXT 
      001780                         87 dstack_unf: ; dstack underflow ; data stack bottom 
      001800                         88 stack_full: .ds STACK_SIZE   ; control stack 
      001800                         89 stack_unf: ; stack underflow ; control_stack bottom 
                                     90 
                                     91 
                                     92 ;--------------------------------------
                                     93     .area HOME 
                                     94 ;--------------------------------------
      008000 82 00 84 CE             95     int cold_start
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008038 82 00 80 89            113 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 89            114 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 89            115 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 89            116 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
      008048 82 00 80 89            117 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 89            118 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 89            119 	int NonHandledInterrupt ;int18 UART1 RX full
      008054 82 00 80 89            120 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 89            121 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 89            122 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 89            123 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 99            124 	int Timer4UpdateHandler	;int23 TIM4 update/overflow used as msec ticks counter
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
      008080 53 54 4D 38 5F 54 42   136 .asciz "STM8_TBI" ; I like to put module name here.
             49 00
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
      00808E CD 87 DB         [ 4]  149 	call print_registers
      008091 CD 8A 4A         [ 4]  150 	call cmd_itf
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      0080A5                        167 UserButtonHandler:
                                    168 ; wait button release
      0080A5 5F               [ 1]  169 	clrw x
      0080A6 5A               [ 2]  170 1$: decw x 
      0080A7 26 FD            [ 1]  171 	jrne 1$
      0080A9 72 09 50 15 F8   [ 2]  172 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
                                    173 ; if MCU suspended by SLEEP resume program
      0080AE 72 07 00 25 05   [ 2]  174     btjf flags,#FSLEEP,2$
      0080B3 72 17 00 25      [ 1]  175 	bres flags,#FSLEEP 
      0080B7 80               [11]  176 	iret
      0080B8 72 00 00 25 03   [ 2]  177 2$:	btjt flags,#FRUN,4$
      0080BD CC 80 F6         [ 2]  178 	jp 9$ 
      0080C0                        179 4$:	; program interrupted by user 
      0080C0 72 11 00 25      [ 1]  180 	bres flags,#FRUN 
      0080C4 AE 80 FE         [ 2]  181 	ldw x,#USER_ABORT
      0080C7 CD 82 30         [ 4]  182 	call puts 
      0080CA CE 00 04         [ 2]  183 	ldw x,basicptr
      0080CD FE               [ 2]  184 	ldw x,(x)
                                    185 ; print line number 
      0080CE 35 0A 00 08      [ 1]  186 	mov base,#10 
      0080D2 35 06 00 26      [ 1]  187 	mov tab_width,#6
      0080D6 CD 88 CE         [ 4]  188 	call print_int  	
      0080D9 CE 00 04         [ 2]  189 	ldw x,basicptr 
      0080DC 1C 00 03         [ 2]  190 	addw x,#3  
      0080DF CD 82 30         [ 4]  191 	call puts 
      0080E2 A6 0D            [ 1]  192 	ld a,#CR 
      0080E4 CD 82 1E         [ 4]  193 	call putc
      0080E7 5F               [ 1]  194 	clrw x  
      0080E8 C6 00 02         [ 1]  195 	ld a,in 
      0080EB AB 03            [ 1]  196 	add a,#3 ; adjustment for line number display 
      0080ED 97               [ 1]  197 	ld xl,a 
      0080EE CD 82 58         [ 4]  198 	call spaces 
      0080F1 A6 5E            [ 1]  199 	ld a,#'^
      0080F3 CD 82 1E         [ 4]  200 	call putc 
      0080F6                        201 9$:
      0080F6 AE 17 FF         [ 2]  202     ldw x,#STACK_EMPTY 
      0080F9 94               [ 1]  203     ldw sp,x
      0080FA 9A               [ 1]  204 	rim 
      0080FB CC 86 D7         [ 2]  205 	jp warm_start
                                    206 
      0080FE 0A 50 72 6F 67 72 61   207 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    208 
                                    209 
                                    210 ;----------------------------------------
                                    211 ; inialize MCU clock 
                                    212 ; input:
                                    213 ;   A 		source  HSI | 1 HSE 
                                    214 ;   XL      CLK_CKDIVR , clock divisor 
                                    215 ; output:
                                    216 ;   none 
                                    217 ;----------------------------------------
      008119                        218 clock_init:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



      008119 C1 50 C3         [ 1]  219 	cp a,CLK_CMSR 
      00811C 27 0C            [ 1]  220 	jreq 2$ ; no switching required 
                                    221 ; select clock source 
      00811E 72 12 50 C5      [ 1]  222 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008122 C7 50 C4         [ 1]  223 	ld CLK_SWR,a
      008125 C1 50 C3         [ 1]  224 1$:	cp a,CLK_CMSR
      008128 26 FB            [ 1]  225 	jrne 1$
      00812A                        226 2$: 	
                                    227 ; HSI and cpu clock divisor 
      00812A 9F               [ 1]  228 	ld a,xl 
      00812B C7 50 C6         [ 1]  229 	ld CLK_CKDIVR,a  
      00812E 81               [ 4]  230 	ret
                                    231 
                                    232 ;---------------------------------
                                    233 ; TIM4 is configured to generate an 
                                    234 ; interrupt every millisecond 
                                    235 ;----------------------------------
      00812F                        236 timer4_init:
      00812F 35 07 53 45      [ 1]  237 	mov TIM4_PSCR,#7 ; prescale 128  
      008133 35 7D 53 46      [ 1]  238 	mov TIM4_ARR,#125 ; set for 1msec.
      008137 35 05 53 40      [ 1]  239 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      00813B 72 10 53 41      [ 1]  240 	bset TIM4_IER,#TIM4_IER_UIE 
      00813F 81               [ 4]  241 	ret
                                    242 
                                    243 ;----------------------------------
                                    244 ; unlock EEPROM for writing/erasing
                                    245 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    246 ; input:
                                    247 ;  none
                                    248 ; output:
                                    249 ;  none 
                                    250 ;----------------------------------
      008140                        251 unlock_eeprom:
      008140 35 AE 50 64      [ 1]  252 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008144 35 56 50 64      [ 1]  253     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      008148 72 07 50 5F FB   [ 2]  254 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      00814D 81               [ 4]  255 	ret
                                    256 
                                    257 ;----------------------------------
                                    258 ; unlock FLASH for writing/erasing
                                    259 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    260 ; input:
                                    261 ;  none
                                    262 ; output:
                                    263 ;  none
                                    264 ;----------------------------------
      00814E                        265 unlock_flash:
      00814E 35 56 50 62      [ 1]  266 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008152 35 AE 50 62      [ 1]  267 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      008156 72 03 50 5F FB   [ 2]  268 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      00815B 81               [ 4]  269 	ret
                                    270 
                           000000   271 	BLOCK_ERASE=0
                                    272 ;----------------------------
                                    273 ; erase block code must be 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    274 ;executed from RAM
                                    275 ;-----------------------------
                           000000   276 .if BLOCK_ERASE 
                                    277 ; this code is copied to RAM 
                                    278 erase_start:
                                    279 	clr a 
                                    280     bset FLASH_CR2,#FLASH_CR2_ERASE
                                    281     bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    282 	ldf [farptr],a
                                    283     inc farptr+2 
                                    284     ldf [farptr],a
                                    285     inc farptr+2 
                                    286     ldf [farptr],a
                                    287     inc farptr+2 
                                    288     ldf [farptr],a
                                    289 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
                                    290 	ret
                                    291 erase_end:
                                    292 
                                    293 ; copy erase_start in RAM 
                                    294 move_code_in_ram:
                                    295 	ldw x,#erase_end 
                                    296 	subw x,#erase_start
                                    297 	ldw acc16,x 
                                    298 	ldw x,#pad 
                                    299 	ldw y,#erase_start 
                                    300 	call move 
                                    301 	ret 
                                    302 
                                    303 ;-----------------------------------
                                    304 ; erase flash or EEPROM block 
                                    305 ; a block is 128 bytes 
                                    306 ; input:
                                    307 ;   farptr  address block begin
                                    308 ; output:
                                    309 ;   none
                                    310 ;--------------------------------------
                                    311 erase_block:
                                    312 	ldw x,farptr+1 
                                    313 	pushw x 
                                    314 	call move_code_in_ram 
                                    315 	popw x 
                                    316 	ldw farptr+1,x 
                                    317 	tnz farptr
                                    318 	jrne erase_flash 
                                    319 	ldw x,#FLASH_BASE 
                                    320 	cpw x,farptr+1 
                                    321 	jrpl erase_flash 
                                    322 ; erase eeprom block
                                    323 	call unlock_eeprom 
                                    324 	sim 
                                    325 	call pad   
                                    326 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
                                    327 	rim 
                                    328 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



                                    329 ; erase flash block:
                                    330 erase_flash:
                                    331 	call unlock_flash 
                                    332 	bset FLASH_CR2,#FLASH_CR2_ERASE
                                    333 	bres FLASH_NCR2,#FLASH_CR2_ERASE
                                    334 	clr a 
                                    335 	sim 
                                    336 	call pad 
                                    337     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
                                    338 	rim 
                                    339 	ret 
                                    340 .endif ; BLOCK_ERASE 
                                    341 
                                    342 
                                    343 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
                                    344 ; write a byte to FLASH or EEPROM 
                                    345 ; input:
                                    346 ;    a  		byte to write
                                    347 ;    farptr  	address
                                    348 ;    x          farptr[x]
                                    349 ; output:
                                    350 ;    none
                                    351 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    352 	; variables locales
                           000001   353 	BTW = 1   ; byte to write offset on stack
                           000002   354 	OPT = 2   ; OPTION flag offset on stack
                           000002   355 	VSIZE = 2
      00815C                        356 write_byte:
      00815C 90 89            [ 2]  357 	pushw y
      0000DE                        358 	_vars VSIZE
      00815E 52 02            [ 2]    1     sub sp,#VSIZE 
      008160 6B 01            [ 1]  359 	ld (BTW,sp),a ; byte to write 
      008162 0F 02            [ 1]  360 	clr (OPT,sp)  ; OPTION flag
                                    361 ; put addr[15:0] in Y, for bounds check.
      008164 90 CE 00 15      [ 2]  362 	ldw y,farptr+1   ; Y=addr15:0
                                    363 ; check addr[23:16], if <> 0 then it is extened flash memory
      008168 72 5D 00 14      [ 1]  364 	tnz farptr 
      00816C 26 14            [ 1]  365 	jrne write_flash
      00816E 90 A3 9F 00      [ 2]  366     cpw y,#user_space
      008172 24 0E            [ 1]  367     jruge write_flash
      008174 90 A3 40 00      [ 2]  368 	cpw y,#EEPROM_BASE  
      008178 25 52            [ 1]  369     jrult write_exit
      00817A 90 A3 48 00      [ 2]  370 	cpw y,#OPTION_BASE
      00817E 25 18            [ 1]  371 	jrult write_eeprom
      008180 20 4A            [ 2]  372     jra write_exit
                                    373 ; write program memory
      008182                        374 write_flash:
      008182 CD 81 4E         [ 4]  375 	call unlock_flash 
      008185 9B               [ 1]  376 1$:	sim 
      008186 7B 01            [ 1]  377 	ld a,(BTW,sp)
      008188 92 A7 00 14      [ 4]  378 	ldf ([farptr],x),a ; farptr[x]=A
      00818C 72 05 50 5F FB   [ 2]  379 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008191 9A               [ 1]  380     rim 
      008192 72 13 50 5F      [ 1]  381     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008196 20 34            [ 2]  382     jra write_exit
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    383 ; write eeprom and option
      008198                        384 write_eeprom:
      008198 CD 81 40         [ 4]  385 	call unlock_eeprom
                                    386 	; check for data eeprom or option eeprom
      00819B 90 A3 48 00      [ 2]  387 	cpw y,#OPTION_BASE
      00819F 2B 08            [ 1]  388 	jrmi 1$
      0081A1 90 A3 48 80      [ 2]  389 	cpw y,#OPTION_END+1
      0081A5 2A 02            [ 1]  390 	jrpl 1$
      0081A7 03 02            [ 1]  391 	cpl (OPT,sp)
      0081A9                        392 1$: 
      0081A9 0D 02            [ 1]  393     tnz (OPT,sp)
      0081AB 27 08            [ 1]  394     jreq 2$
                                    395 	; pour modifier une option il faut modifier ces 2 bits
      0081AD 72 1E 50 5B      [ 1]  396     bset FLASH_CR2,#FLASH_CR2_OPT
      0081B1 72 1F 50 5C      [ 1]  397     bres FLASH_NCR2,#FLASH_CR2_OPT 
      0081B5                        398 2$: 
      0081B5 7B 01            [ 1]  399     ld a,(BTW,sp)
      0081B7 92 A7 00 14      [ 4]  400     ldf ([farptr],x),a
      0081BB 0D 02            [ 1]  401     tnz (OPT,sp)
      0081BD 27 08            [ 1]  402     jreq 3$
      0081BF 5C               [ 1]  403     incw x
      0081C0 7B 01            [ 1]  404     ld a,(BTW,sp)
      0081C2 43               [ 1]  405     cpl a
      0081C3 92 A7 00 14      [ 4]  406     ldf ([farptr],x),a
      0081C7 72 05 50 5F FB   [ 2]  407 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      0081CC                        408 write_exit:
      00014C                        409 	_drop VSIZE 
      0081CC 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081CE 90 85            [ 2]  410 	popw y
      0081D0 81               [ 4]  411     ret
                                    412 
                                    413 ;--------------------------------------------
                                    414 ; write a data block to eeprom or flash 
                                    415 ; input:
                                    416 ;   Y        source address   
                                    417 ;   X        array index  destination  farptr[x]
                                    418 ;   BSIZE    block size bytes 
                                    419 ;   farptr   write address , byte* 
                                    420 ; output:
                                    421 ;	X 		after last byte written 
                                    422 ;   Y 		after last byte read 
                                    423 ;  farptr   point after block
                                    424 ;---------------------------------------------
      0081D1                        425 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      000151                        426 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    427 	; local var 
                           000001   428 	XSAVE=1 
                           000002   429 	VSIZE=2 
      000151                        430 write_block:
      000151                        431 	_vars VSIZE
      0081D1 52 02            [ 2]    1     sub sp,#VSIZE 
      0081D3 1F 01            [ 2]  432 	ldw (XSAVE,sp),x 
      0081D5 1E 05            [ 2]  433 	ldw x,(BSIZE,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      0081D7 27 13            [ 1]  434 	jreq 9$
      0081D9 1E 01            [ 2]  435 1$:	ldw x,(XSAVE,sp)
      0081DB 90 F6            [ 1]  436 	ld a,(y)
      0081DD CD 81 5C         [ 4]  437 	call write_byte 
      0081E0 5C               [ 1]  438 	incw x 
      0081E1 90 5C            [ 1]  439 	incw y 
      0081E3 1F 01            [ 2]  440 	ldw (XSAVE,sp),x
      0081E5 1E 05            [ 2]  441 	ldw x,(BSIZE,sp)
      0081E7 5A               [ 2]  442 	decw x
      0081E8 1F 05            [ 2]  443 	ldw (BSIZE,sp),x 
      0081EA 26 ED            [ 1]  444 	jrne 1$
      0081EC                        445 9$:
      0081EC 1E 01            [ 2]  446 	ldw x,(XSAVE,sp)
      0081EE CD 97 F8         [ 4]  447 	call incr_farptr
      000171                        448 	_drop VSIZE
      0081F1 5B 02            [ 2]    1     addw sp,#VSIZE 
      0081F3 81               [ 4]  449 	ret 
                                    450 
                                    451 
                                    452 ;---------------------------------------------
                                    453 ;   UART3 subroutines
                                    454 ;---------------------------------------------
                                    455 
                                    456 ;---------------------------------------------
                                    457 ; initialize UART3, 115200 8N1
                                    458 ; input:
                                    459 ;	none
                                    460 ; output:
                                    461 ;   none
                                    462 ;---------------------------------------------
      0081F4                        463 uart3_init:
                                    464 	; configure tx pin
      0081F4 72 1A 50 11      [ 1]  465 	bset PD_DDR,#BIT5 ; tx pin
      0081F8 72 1A 50 12      [ 1]  466 	bset PD_CR1,#BIT5 ; push-pull output
      0081FC 72 1A 50 13      [ 1]  467 	bset PD_CR2,#BIT5 ; fast output
      008200                        468 uart3_set_baud: 
                                    469 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    470 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008200 A6 E1            [ 1]  471 	ld a,#CLK_SWR_HSI
      008202 C1 50 C3         [ 1]  472 	cp a,CLK_CMSR 
      008205 27 0A            [ 1]  473 	jreq hsi_clock 
      008207                        474 hse_clock: ; 8 Mhz 	
      008207 35 05 52 43      [ 1]  475 	mov UART3_BRR2,#0x05 ; must be loaded first
      00820B 35 04 52 42      [ 1]  476 	mov UART3_BRR1,#0x4
      00820F 20 08            [ 2]  477 	jra uart_enable
      008211                        478 hsi_clock: ; 16 Mhz 	
      008211 35 0B 52 43      [ 1]  479 	mov UART3_BRR2,#0x0b ; must be loaded first
      008215 35 08 52 42      [ 1]  480 	mov UART3_BRR1,#0x08
      008219                        481 uart_enable:	
      008219 35 0C 52 45      [ 1]  482 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
      00821D 81               [ 4]  483 	ret
                                    484 	
                                    485 ;---------------------------------
                                    486 ; send character to UART3 
                                    487 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    488 ;   A 
                                    489 ; output:
                                    490 ;   none 
                                    491 ;--------------------------------	
      00821E                        492 putc:
      00821E 72 0F 52 40 FB   [ 2]  493 	btjf UART3_SR,#UART_SR_TXE,.
      008223 C7 52 41         [ 1]  494 	ld UART3_DR,a 
      008226 81               [ 4]  495 	ret 
                                    496 
                                    497 ;---------------------------------
                                    498 ; wait character from UART3 
                                    499 ; input:
                                    500 ;   none
                                    501 ; output:
                                    502 ;   A 			char  
                                    503 ;--------------------------------	
      008227                        504 getc:
      008227 72 0B 52 40 FB   [ 2]  505 	btjf UART3_SR,#UART_SR_RXNE,.
      00822C C6 52 41         [ 1]  506 	ld a,UART3_DR 
      00822F 81               [ 4]  507 	ret 
                                    508 
                                    509 ;-----------------------------
                                    510 ; send an ASCIZ string to UART3 
                                    511 ; input: 
                                    512 ;   x 		char * 
                                    513 ; output:
                                    514 ;   none 
                                    515 ;-------------------------------
      008230                        516 puts:
      008230 F6               [ 1]  517     ld a,(x)
      008231 27 06            [ 1]  518 	jreq 1$
      008233 CD 82 1E         [ 4]  519 	call putc 
      008236 5C               [ 1]  520 	incw x 
      008237 20 F7            [ 2]  521 	jra puts 
      008239 81               [ 4]  522 1$:	ret 
                                    523 
                                    524 
                                    525 ;---------------------------
                                    526 ; delete character at left 
                                    527 ; of cursor on terminal 
                                    528 ; input:
                                    529 ;   none 
                                    530 ; output:
                                    531 ;	none 
                                    532 ;---------------------------
      00823A                        533 bksp:
      00823A A6 08            [ 1]  534 	ld a,#BSP 
      00823C CD 82 1E         [ 4]  535 	call putc 
      00823F A6 20            [ 1]  536 	ld a,#SPACE 
      008241 CD 82 1E         [ 4]  537 	call putc 
      008244 A6 08            [ 1]  538 	ld a,#BSP 
      008246 CD 82 1E         [ 4]  539 	call putc 
      008249 81               [ 4]  540 	ret 
                                    541 ;---------------------------
                                    542 ; delete n character left of cursor 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    543 ; at terminal.
                                    544 ; input: 
                                    545 ;   A   	number of characters to delete.
                                    546 ; output:
                                    547 ;    none 
                                    548 ;--------------------------	
      00824A                        549 delete:
      00824A 88               [ 1]  550 	push a 
      00824B 0D 01            [ 1]  551 0$:	tnz (1,sp)
      00824D 27 07            [ 1]  552 	jreq 1$
      00824F CD 82 3A         [ 4]  553 	call bksp 
      008252 0A 01            [ 1]  554 	dec (1,sp)
      008254 20 F5            [ 2]  555 	jra 0$
      008256 84               [ 1]  556 1$:	pop a 
      008257 81               [ 4]  557 	ret
                                    558 
                                    559 ;--------------------------
                                    560 ; print n spaces on terminal
                                    561 ; input:
                                    562 ;  X 		number of spaces 
                                    563 ; output:
                                    564 ;	none 
                                    565 ;---------------------------
      008258                        566 spaces:
      008258 A6 20            [ 1]  567 	ld a,#SPACE 
      00825A 5D               [ 2]  568 1$:	tnzw x
      00825B 27 06            [ 1]  569 	jreq 9$
      00825D CD 82 1E         [ 4]  570 	call putc 
      008260 5A               [ 2]  571 	decw x
      008261 20 F7            [ 2]  572 	jra 1$
      008263                        573 9$: 
      008263 81               [ 4]  574 	ret 
                                    575 
                           000001   576 .if DEBUG 
                                    577 ;---------------------------------
                                    578 ;; print actual registers states 
                                    579 ;; as pushed on stack 
                                    580 ;; {Y,X,CC,A}
                                    581 ;---------------------------------
      008264                        582 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      0001E4                        583 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      0001E4                        584 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      0001E4                        585 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      0001E4                        586 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      0001E4                        587 prt_regs:
      008264 AE 82 A7         [ 2]  588 	ldw x,#regs_state 
      008267 CD 82 30         [ 4]  589 	call puts
                                    590 ; register PC
      00826A 16 01            [ 2]  591 	ldw y,(1,sp)
      00826C AE 88 6B         [ 2]  592 	ldw x,#REG_EPC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      00826F CD 87 BC         [ 4]  593 	call prt_reg16 
                                    594 ; register CC 
      008272 7B 08            [ 1]  595 	ld a,(R_CC,sp)
      008274 AE 88 7C         [ 2]  596 	ldw x,#REG_CC 
      008277 CD 87 97         [ 4]  597 	call prt_reg8 
                                    598 ; register A 
      00827A 7B 07            [ 1]  599 	ld a,(R_A,sp)
      00827C AE 88 78         [ 2]  600 	ldw x,#REG_A 
      00827F CD 87 97         [ 4]  601 	call prt_reg8 
                                    602 ; register X 
      008282 16 05            [ 2]  603 	ldw y,(R_X,sp)
      008284 AE 88 74         [ 2]  604 	ldw x,#REG_X 
      008287 CD 87 BC         [ 4]  605 	call prt_reg16 
                                    606 ; register Y 
      00828A 16 03            [ 2]  607 	ldw y,(R_Y,sp)
      00828C AE 88 70         [ 2]  608 	ldw x,#REG_Y 
      00828F CD 87 BC         [ 4]  609 	call prt_reg16 
                                    610 ; register SP 
      008292 90 96            [ 1]  611 	ldw y,sp
      008294 72 A9 00 08      [ 2]  612 	addw y,#6+ARG_OFS  
      008298 AE 88 81         [ 2]  613 	ldw x,#REG_SP
      00829B CD 87 BC         [ 4]  614 	call prt_reg16
      00829E A6 0D            [ 1]  615 	ld a,#CR 
      0082A0 CD 82 1E         [ 4]  616 	call putc
      0082A3 CD 82 1E         [ 4]  617 	call putc   
      0082A6 81               [ 4]  618 	ret 
                                    619 
      0082A7 0A 72 65 67 69 73 74   620 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    621 
                                    622 
                                    623 ;--------------------
                                    624 ; print content at address in hex.
                                    625 ; input:
                                    626 ;   X 	address to peek 
                                    627 ; output:
                                    628 ;	none 
                                    629 ;--------------------	
      0082CE                        630 prt_peek:
      0082CE 89               [ 2]  631 	pushw x 
      0082CF CF 00 0A         [ 2]  632 	ldw acc16,x 
      0082D2 72 5F 00 09      [ 1]  633 	clr acc24 
      0082D6 5F               [ 1]  634 	clrw x 
      0082D7 A6 10            [ 1]  635 	ld a,#16 
      0082D9 CD 88 86         [ 4]  636 	call prti24 
      0082DC A6 3A            [ 1]  637 	ld a,#': 
      0082DE CD 82 1E         [ 4]  638 	call putc 
      0082E1 A6 20            [ 1]  639 	ld a,#SPACE 
      0082E3 CD 82 1E         [ 4]  640 	call putc 
      0082E6 85               [ 2]  641 	popw x 
      0082E7 F6               [ 1]  642 	ld a,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082E8 C7 00 0B         [ 1]  643 	ld acc8,a 
      0082EB 5F               [ 1]  644 	clrw x 
      0082EC A6 10            [ 1]  645 	ld a,#16 
      0082EE CD 88 86         [ 4]  646 	call prti24
      0082F1 81               [ 4]  647 	ret 
                                    648 .endif ; DEBUG  
                                    649 
                                    650 ;-------------------------------------
                                    651 ; retrun string length
                                    652 ; input:
                                    653 ;   X         .asciz  
                                    654 ; output:
                                    655 ;   X         length 
                                    656 ;-------------------------------------
      0082F2                        657 strlen:
      0082F2 90 93            [ 1]  658 	ldw y,x 
      0082F4 5F               [ 1]  659 	clrw x 
      0082F5 90 7D            [ 1]  660 1$:	tnz (y) 
      0082F7 27 05            [ 1]  661 	jreq 9$ 
      0082F9 5C               [ 1]  662 	incw x
      0082FA 90 5C            [ 1]  663 	incw y 
      0082FC 20 F7            [ 2]  664 	jra 1$ 
      0082FE 81               [ 4]  665 9$: ret 
                                    666 
                                    667 ;------------------------------------
                                    668 ; compare 2 strings
                                    669 ; input:
                                    670 ;   X 		char* first string 
                                    671 ;   Y       char* second string 
                                    672 ; output:
                                    673 ;   A 		0|1 
                                    674 ;-------------------------------------
      0082FF                        675 strcmp:
      0082FF F6               [ 1]  676 	ld a,(x)
      008300 27 0B            [ 1]  677 	jreq 5$ 
      008302 90 F1            [ 1]  678 	cp a,(y) 
      008304 26 05            [ 1]  679 	jrne 4$ 
      008306 5C               [ 1]  680 	incw x 
      008307 90 5C            [ 1]  681 	incw y 
      008309 20 F4            [ 2]  682 	jra strcmp 
      00830B                        683 4$: ; not same  
      00830B 4F               [ 1]  684 	clr a 
      00830C 81               [ 4]  685 	ret 
      00830D                        686 5$: ; same 
      00830D A6 01            [ 1]  687 	ld a,#1 
      00830F 81               [ 4]  688 	ret 
                                    689 
                                    690 
                                    691 ;---------------------------------------
                                    692 ;  copy src to dest 
                                    693 ; input:
                                    694 ;   X 		dest 
                                    695 ;   Y 		src 
                                    696 ; output: 
                                    697 ;   X 		dest 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



                                    698 ;----------------------------------
      008310                        699 strcpy:
      008310 89               [ 2]  700 	pushw x 
      008311 90 F6            [ 1]  701 1$: ld a,(y)
      008313 27 06            [ 1]  702 	jreq 9$ 
      008315 F7               [ 1]  703 	ld (x),a 
      008316 5C               [ 1]  704 	incw x 
      008317 90 5C            [ 1]  705 	incw y 
      008319 20 F6            [ 2]  706 	jra 1$ 
      00831B 7F               [ 1]  707 9$:	clr (x)
      00831C 85               [ 2]  708 	popw x 
      00831D 81               [ 4]  709 	ret 
                                    710 
                                    711 ;---------------------------------------
                                    712 ; move memory block 
                                    713 ; input:
                                    714 ;   X 		destination 
                                    715 ;   Y 	    source 
                                    716 ;   acc16	size 
                                    717 ; output:
                                    718 ;   none 
                                    719 ;--------------------------------------
                           000001   720 	INCR=1 ; increament high byte 
                           000002   721 	LB=2 ; increament low byte 
                           000002   722 	VSIZE=2
      00831E                        723 move:
      00029E                        724 	_vars VSIZE 
      00831E 52 02            [ 2]    1     sub sp,#VSIZE 
      008320 0F 01            [ 1]  725 	clr (INCR,sp)
      008322 0F 02            [ 1]  726 	clr (LB,sp)
      008324 90 89            [ 2]  727 	pushw y 
      008326 13 01            [ 2]  728 	cpw x,(1,sp) ; compare DEST to SRC 
      008328 90 85            [ 2]  729 	popw y 
      00832A 27 31            [ 1]  730 	jreq move_exit ; x==y 
      00832C 2B 0E            [ 1]  731 	jrmi move_down
      00832E                        732 move_up: ; start from top address with incr=-1
      00832E 72 BB 00 0A      [ 2]  733 	addw x,acc16
      008332 72 B9 00 0A      [ 2]  734 	addw y,acc16
      008336 03 01            [ 1]  735 	cpl (INCR,sp)
      008338 03 02            [ 1]  736 	cpl (LB,sp)   ; increment = -1 
      00833A 20 05            [ 2]  737 	jra move_loop  
      00833C                        738 move_down: ; start from bottom address with incr=1 
      00833C 5A               [ 2]  739     decw x 
      00833D 90 5A            [ 2]  740 	decw y
      00833F 0C 02            [ 1]  741 	inc (LB,sp) ; incr=1 
      008341                        742 move_loop:	
      008341 C6 00 0A         [ 1]  743     ld a, acc16 
      008344 CA 00 0B         [ 1]  744 	or a, acc8
      008347 27 14            [ 1]  745 	jreq move_exit 
      008349 72 FB 01         [ 2]  746 	addw x,(INCR,sp)
      00834C 72 F9 01         [ 2]  747 	addw y,(INCR,sp) 
      00834F 90 F6            [ 1]  748 	ld a,(y)
      008351 F7               [ 1]  749 	ld (x),a 
      008352 89               [ 2]  750 	pushw x 
      008353 CE 00 0A         [ 2]  751 	ldw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      008356 5A               [ 2]  752 	decw x 
      008357 CF 00 0A         [ 2]  753 	ldw acc16,x 
      00835A 85               [ 2]  754 	popw x 
      00835B 20 E4            [ 2]  755 	jra move_loop
      00835D                        756 move_exit:
      0002DD                        757 	_drop VSIZE
      00835D 5B 02            [ 2]    1     addw sp,#VSIZE 
      00835F 81               [ 4]  758 	ret 	
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
      008360                        772 search_lineno:
      0002E0                        773 	_vars VSIZE
      008360 52 02            [ 2]    1     sub sp,#VSIZE 
      008362 CF 00 0A         [ 2]  774 	ldw acc16,x 
      008365 0F 01            [ 1]  775 	clr (LL,sp)
      008367 90 CE 00 1C      [ 2]  776 	ldw y,txtbgn
      00836B                        777 search_ln_loop:
      00836B 90 C3 00 1E      [ 2]  778 	cpw y,txtend 
      00836F 2A 17            [ 1]  779 	jrpl 8$
      008371 93               [ 1]  780 	ldw x,y 
      008372 FE               [ 2]  781 	ldw x,(x) ; x=line number 
      008373 C3 00 0A         [ 2]  782 	cpw x,acc16 
      008376 27 13            [ 1]  783 	jreq 9$ 
      008378 2A 0E            [ 1]  784 	jrpl 8$ ; from here all lines are > lineno 
      00837A 90 E6 02         [ 1]  785 	ld a,(2,y)
      00837D 6B 02            [ 1]  786 	ld (LB,sp),a 
      00837F 72 A9 00 03      [ 2]  787 	addw y,#3 
      008383 72 F9 01         [ 2]  788 	addw y,(LL,sp)
      008386 20 E3            [ 2]  789 	jra search_ln_loop 
      008388 51               [ 1]  790 8$: exgw x,y 
      008389 90 5F            [ 1]  791 	clrw y 	
      00030B                        792 9$: _drop VSIZE
      00838B 5B 02            [ 2]    1     addw sp,#VSIZE 
      00838D 51               [ 1]  793 	exgw x,y   
      00838E 81               [ 4]  794 	ret 
                                    795 
                                    796 ;-------------------------------------
                                    797 ; delete line at addr
                                    798 ; input:
                                    799 ;   X 		addr of line i.e DEST for move 
                                    800 ;-------------------------------------
                           000001   801 	LLEN=1
                           000003   802 	SRC=3
                           000004   803 	VSIZE=4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      00838F                        804 del_line: 
      00030F                        805 	_vars VSIZE 
      00838F 52 04            [ 2]    1     sub sp,#VSIZE 
      008391 E6 02            [ 1]  806 	ld a,(2,x) ; line length
      008393 AB 03            [ 1]  807 	add a,#3
      008395 6B 02            [ 1]  808 	ld (LLEN+1,sp),a 
      008397 0F 01            [ 1]  809 	clr (LLEN,sp)
      008399 90 93            [ 1]  810 	ldw y,x  
      00839B 72 F9 01         [ 2]  811 	addw y,(LLEN,sp) ;SRC  
      00839E 17 03            [ 2]  812 	ldw (SRC,sp),y  ;save source 
      0083A0 90 CE 00 1E      [ 2]  813 	ldw y,txtend 
      0083A4 72 F2 03         [ 2]  814 	subw y,(SRC,sp) ; y=count 
      0083A7 90 CF 00 0A      [ 2]  815 	ldw acc16,y 
      0083AB 16 03            [ 2]  816 	ldw y,(SRC,sp)    ; source
      0083AD CD 83 1E         [ 4]  817 	call move
      0083B0 90 CE 00 1E      [ 2]  818 	ldw y,txtend 
      0083B4 72 F2 01         [ 2]  819 	subw y,(LLEN,sp)
      0083B7 90 CF 00 1E      [ 2]  820 	ldw txtend,y  
      00033B                        821 	_drop VSIZE     
      0083BB 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083BD 81               [ 4]  822 	ret 
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
      0083BE                        837 create_gap:
      00033E                        838 	_vars VSIZE
      0083BE 52 06            [ 2]    1     sub sp,#VSIZE 
      0083C0 C3 00 1E         [ 2]  839 	cpw x,txtend 
      0083C3 2A 27            [ 1]  840 	jrpl 9$ ; no need for a gap since at end of text.
      0083C5 1F 03            [ 2]  841 	ldw (SRC,sp),x 
      0083C7 17 05            [ 2]  842 	ldw (LEN,sp),y 
      0083C9 90 CF 00 0A      [ 2]  843 	ldw acc16,y 
      0083CD 90 93            [ 1]  844 	ldw y,x ; SRC
      0083CF 72 BB 00 0A      [ 2]  845 	addw x,acc16  
      0083D3 1F 01            [ 2]  846 	ldw (DEST,sp),x 
                                    847 ;compute size to move 	
      0083D5 CE 00 1E         [ 2]  848 	ldw x,txtend 
      0083D8 72 F0 03         [ 2]  849 	subw x,(SRC,sp)
      0083DB CF 00 0A         [ 2]  850 	ldw acc16,x
      0083DE 1E 01            [ 2]  851 	ldw x,(DEST,sp) 
      0083E0 CD 83 1E         [ 4]  852 	call move
      0083E3 CE 00 1E         [ 2]  853 	ldw x,txtend
      0083E6 72 FB 05         [ 2]  854 	addw x,(LEN,sp)
      0083E9 CF 00 1E         [ 2]  855 	ldw txtend,x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



      00036C                        856 9$:	_drop VSIZE 
      0083EC 5B 06            [ 2]    1     addw sp,#VSIZE 
      0083EE 81               [ 4]  857 	ret 
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
      0083EF                        876 insert_line:
      00036F                        877 	_vars VSIZE 
      0083EF 52 08            [ 2]    1     sub sp,#VSIZE 
      0083F1 A3 00 00         [ 2]  878 	cpw x,#0  
      0083F4 22 03            [ 1]  879 	jrugt 0$ 
      0083F6 CC 86 7B         [ 2]  880 	jp syntax_error ; negative line number 
      0083F9                        881 0$: 
      0083F9 1F 05            [ 2]  882 	ldw (LINENO,sp),x 
      0083FB AE 16 C8         [ 2]  883 	ldw x,#tib 
      0083FE 72 BB 00 01      [ 2]  884 	addw x,in.w 
      008402 1F 03            [ 2]  885 	ldw (SRC,sp),x 
      008404 CD 82 F2         [ 4]  886 	call strlen
      008407 5D               [ 2]  887 	tnzw x 
      008408 27 01            [ 1]  888 	jreq 1$
      00840A 5C               [ 1]  889 	incw x 
      00840B 1F 07            [ 2]  890 1$:	ldw (LLEN,sp),x
      00840D 1E 05            [ 2]  891 	ldw x,(LINENO,sp)
      00840F CD 83 60         [ 4]  892 	call search_lineno 
      008412 5D               [ 2]  893 	tnzw x 
      008413 26 04            [ 1]  894 	jrne 2$
                                    895 ; line doesn't exit 	
      008415 17 01            [ 2]  896 	ldw (DEST,sp),y 
      008417 20 05            [ 2]  897 	jra 3$
                                    898 ; line exit delete it.	
      008419 1F 01            [ 2]  899 2$: ldw (DEST,sp),x 
      00841B CD 83 8F         [ 4]  900 	call del_line
                                    901 ; leave or insert new line if LLEN>0
      00841E                        902 3$: 
                                    903 ; check for available space 
      00841E CD 92 A7         [ 4]  904 	call size 
      008421 1D 00 03         [ 2]  905 	subw x,#3 
      008424 72 F0 07         [ 2]  906     subw x,(LLEN,sp)
      008427 2A 05            [ 1]  907 	jrpl 31$
      008429 A6 01            [ 1]  908 	ld a,#ERR_MEM_FULL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      00842B CC 86 7D         [ 2]  909 	jp tb_error 
      00842E                        910 31$:	
      00842E 0D 08            [ 1]  911 	tnz (LLEN+1,sp)
      008430 27 34            [ 1]  912 	jreq insert_ln_exit ; empty line forget it.
      008432 1E 01            [ 2]  913 	ldw x,(DEST,sp)
      008434 C3 00 1E         [ 2]  914 	cpw x,txtend 
      008437 2A 0B            [ 1]  915 	jrpl 4$ 
                                    916 ; must create a gap 
      008439 16 07            [ 2]  917 	ldw y,(LLEN,sp)
      00843B 72 A9 00 03      [ 2]  918 	addw y,#3 ; space for lineno and linelen 
      00843F CD 83 BE         [ 4]  919 	call create_gap 
      008442 20 11            [ 2]  920 	jra 5$ 
      008444                        921 4$: ; insert at end. 
      008444 90 CE 00 1E      [ 2]  922 	ldw y,txtend
      008448 17 01            [ 2]  923 	ldw (DEST,sp),y
      00844A 72 F9 07         [ 2]  924 	addw y,(LLEN,sp)
      00844D 72 A9 00 03      [ 2]  925 	addw y,#3 
      008451 90 CF 00 1E      [ 2]  926 	ldw txtend,y  
      008455                        927 5$:	
      008455 1E 01            [ 2]  928 	ldw x,(DEST,sp) ; dest address 
      008457 16 05            [ 2]  929 	ldw y,(LINENO,sp) ; line number 
      008459 FF               [ 2]  930 	ldw (x),y 
      00845A 1C 00 02         [ 2]  931 	addw x,#2
      00845D 7B 08            [ 1]  932 	ld a,(LLEN+1,sp)
      00845F F7               [ 1]  933 	ld (x),a 
      008460 5C               [ 1]  934 	incw x 
      008461 16 03            [ 2]  935 	ldw y,(SRC,sp) ; src addr  
      008463 CD 83 10         [ 4]  936 	call strcpy   
      008466                        937 insert_ln_exit:	
      0003E6                        938 	_drop VSIZE
      008466 5B 08            [ 2]    1     addw sp,#VSIZE 
      008468 81               [ 4]  939 	ret
                                    940 
                                    941 ;------------------------------------
                                    942 ;  set all variables to zero 
                                    943 ; input:
                                    944 ;   none 
                                    945 ; output:
                                    946 ;	none
                                    947 ;------------------------------------
      008469                        948 clear_vars:
      008469 AE 00 27         [ 2]  949 	ldw x,#vars 
      00846C 90 AE 00 34      [ 2]  950 	ldw y,#2*26 
      008470 7F               [ 1]  951 1$:	clr (x)
      008471 5C               [ 1]  952 	incw x 
      008472 90 5A            [ 2]  953 	decw y 
      008474 26 FA            [ 1]  954 	jrne 1$
      008476 81               [ 4]  955 	ret 
                                    956 
                                    957 ;-------------------------------------
                                    958 ; check if A is a letter
                                    959 ; input:
                                    960 ;   A 			character to test 
                                    961 ; output:
                                    962 ;   C flag      1 true, 0 false 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



                                    963 ;-------------------------------------
      008477                        964 is_alpha:
      008477 A1 41            [ 1]  965 	cp a,#'A 
      008479 8C               [ 1]  966 	ccf
      00847A 24 0B            [ 1]  967 	jrnc 9$ 
      00847C A1 5B            [ 1]  968 	cp a,#'Z+1 
      00847E 25 07            [ 1]  969 	jrc 9$ 
      008480 A1 61            [ 1]  970 	cp a,#'a 
      008482 8C               [ 1]  971 	ccf 
      008483 24 02            [ 1]  972 	jrnc 9$
      008485 A1 7B            [ 1]  973 	cp a,#'z+1   
      008487 81               [ 4]  974 9$: ret 	
                                    975 
                                    976 ;-------------------------------------
                                    977 ;  program initialization entry point 
                                    978 ;-------------------------------------
                           000001   979 	MAJOR=1
                           000000   980 	MINOR=0
      008488 0A 0A 54 69 6E 79 20   981 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0084CE                        982 cold_start:
                                    983 ;set stack 
      0084CE AE 17 FF         [ 2]  984 	ldw x,#STACK_EMPTY
      0084D1 94               [ 1]  985 	ldw sp,x   
                                    986 ; clear all ram 
      0084D2 7F               [ 1]  987 0$: clr (x)
      0084D3 5A               [ 2]  988 	decw x 
      0084D4 26 FC            [ 1]  989 	jrne 0$
                                    990 ; activate pull up on all inputs 
      0084D6 A6 FF            [ 1]  991 	ld a,#255 
      0084D8 C7 50 03         [ 1]  992 	ld PA_CR1,a 
      0084DB C7 50 08         [ 1]  993 	ld PB_CR1,a 
      0084DE C7 50 0D         [ 1]  994 	ld PC_CR1,a 
      0084E1 C7 50 12         [ 1]  995 	ld PD_CR1,a 
      0084E4 C7 50 17         [ 1]  996 	ld PE_CR1,a 
      0084E7 C7 50 1C         [ 1]  997 	ld PF_CR1,a 
      0084EA C7 50 21         [ 1]  998 	ld PG_CR1,a 
      0084ED C7 50 2B         [ 1]  999 	ld PI_CR1,a 
                                   1000 ; select internal clock no divisor: 16 Mhz 	
      0084F0 A6 E1            [ 1] 1001 	ld a,#CLK_SWR_HSI 
      0084F2 5F               [ 1] 1002 	clrw x  
      0084F3 CD 81 19         [ 4] 1003     call clock_init 
      0084F6 CD 81 2F         [ 4] 1004 	call timer4_init
                                   1005 ; UART3 at 115200 BAUD
      0084F9 CD 81 F4         [ 4] 1006 	call uart3_init
                                   1007 ; activate PE_4 (user button interrupt)
      0084FC 72 18 50 18      [ 1] 1008     bset PE_CR2,#USR_BTN_BIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



                                   1009 ; display system information
      008500 AE 84 88         [ 2] 1010 	ldw x,#software 
      008503 CD 82 30         [ 4] 1011 	call puts 
      008506 A6 01            [ 1] 1012 	ld a,#MAJOR 
      008508 C7 00 0B         [ 1] 1013 	ld acc8,a 
      00850B 5F               [ 1] 1014 	clrw x 
      00850C CF 00 09         [ 2] 1015 	ldw acc24,x 
      00850F A6 0A            [ 1] 1016 	ld a,#10 
      008511 CD 88 86         [ 4] 1017 	call prti24 
      008514 A6 2E            [ 1] 1018 	ld a,#'.
      008516 CD 82 1E         [ 4] 1019 	call putc 
      008519 A6 00            [ 1] 1020 	ld a,#MINOR 
      00851B C7 00 0B         [ 1] 1021 	ld acc8,a 
      00851E 5F               [ 1] 1022 	clrw x 
      00851F CF 00 09         [ 2] 1023 	ldw acc24,x 
      008522 A6 0A            [ 1] 1024 	ld a,#10 
      008524 CD 88 86         [ 4] 1025 	call prti24 
      008527 A6 0D            [ 1] 1026 	ld a,#CR 
      008529 CD 82 1E         [ 4] 1027 	call putc 
      00852C CD 98 06         [ 4] 1028 	call seek_fdrive 
                                   1029 ; configure LED2 pin 
      00852F 72 1A 50 0D      [ 1] 1030     bset PC_CR1,#LED2_BIT
      008533 72 1A 50 0E      [ 1] 1031     bset PC_CR2,#LED2_BIT
      008537 72 1A 50 0C      [ 1] 1032     bset PC_DDR,#LED2_BIT
      00853B 9A               [ 1] 1033 	rim 
      00853C AE 16 C8         [ 2] 1034 	ldw x,#tib
      00853F CF 00 21         [ 2] 1035 	ldw array_addr,x 
      008542 72 5C 00 11      [ 1] 1036 	inc seedy+1 
      008546 72 5C 00 0F      [ 1] 1037 	inc seedx+1 
      00854A CD 85 59         [ 4] 1038 	call clear_basic
      00854D CD 92 B1         [ 4] 1039 	call ubound 
      008550 CD 8F 09         [ 4] 1040 	call dpop 
      008553 CF 00 23         [ 2] 1041 	ldw array_size,x 
      008556 CC 86 D7         [ 2] 1042     jp warm_start 
                                   1043 
                                   1044 ;---------------------------
                                   1045 ; reset BASIC text variables 
                                   1046 ; and clear variables 
                                   1047 ;---------------------------
      008559                       1048 clear_basic:
      008559 5F               [ 1] 1049 	clrw x 
      00855A CF 00 06         [ 2] 1050 	ldw lineno,x
      00855D 72 5F 00 03      [ 1] 1051 	clr count 
      008561 AE 00 5B         [ 2] 1052 	ldw x,#free_ram 
      008564 CF 00 1C         [ 2] 1053 	ldw txtbgn,x 
      008567 CF 00 1E         [ 2] 1054 	ldw txtend,x 
      00856A CD 84 69         [ 4] 1055 	call clear_vars 
      00856D 81               [ 4] 1056 	ret 
                                   1057 
                                   1058 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1059 ;;   Tiny BASIC error messages     ;;
                                   1060 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00856E                       1061 err_msg:
      00856E 00 00 85 86 85 94 85  1062 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             A3 85 BD 85 CD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



      00857A 85 E4 85 FB 86 16 86  1063 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             28 86 3A
      008584 86 47                 1064 	.word err_no_access 
                                   1065 
      008586 0A 4D 65 6D 6F 72 79  1066 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      008594 0A 73 79 6E 74 61 78  1067 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      0085A3 0A 6D 61 74 68 20 6F  1068 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      0085BD 0A 64 69 76 69 73 69  1069 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      0085CD 0A 69 6E 76 61 6C 69  1070 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      0085E4 0A 72 75 6E 20 74 69  1071 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      0085FB 0A 63 6F 6D 6D 61 6E  1072 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      008616 0A 64 75 70 6C 69 63  1073 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      008628 0A 46 69 6C 65 20 6E  1074 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      00863A 0A 62 61 64 20 76 61  1075 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      008647 0A 46 69 6C 65 20 69  1076 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
                                   1077 
      00867B                       1078 syntax_error:
      00867B A6 02            [ 1] 1079 	ld a,#ERR_SYNTAX 
                                   1080 
      00867D                       1081 tb_error:
      00867D AE 85 6E         [ 2] 1082 	ldw x, #err_msg 
      008680 72 5F 00 0A      [ 1] 1083 	clr acc16 
      008684 48               [ 1] 1084 	sll a
      008685 72 59 00 0A      [ 1] 1085 	rlc acc16  
      008689 C7 00 0B         [ 1] 1086 	ld acc8, a 
      00868C 72 BB 00 0A      [ 2] 1087 	addw x,acc16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      008690 FE               [ 2] 1088 	ldw x,(x)
      008691 CD 82 30         [ 4] 1089 	call puts
      008694 CE 00 06         [ 2] 1090 	ldw x,lineno 
      008697 5D               [ 2] 1091 	tnzw x 
      008698 27 0B            [ 1] 1092 	jreq 2$
      00869A 35 06 00 26      [ 1] 1093 	mov tab_width,#6
      00869E 35 0A 00 08      [ 1] 1094 	mov base,#10 
      0086A2 CD 88 CE         [ 4] 1095 	call print_int 
      0086A5                       1096 2$:	 
      0086A5 CE 00 04         [ 2] 1097 	ldw x,basicptr   
      0086A8 C6 00 06         [ 1] 1098 	ld a,lineno 
      0086AB CA 00 07         [ 1] 1099 	or a,lineno+1
      0086AE 27 03            [ 1] 1100 	jreq 3$
      0086B0 1C 00 03         [ 2] 1101 	addw x,#3 
      0086B3 CD 82 30         [ 4] 1102 3$:	call puts 
      0086B6 A6 0D            [ 1] 1103 	ld a,#CR 
      0086B8 CD 82 1E         [ 4] 1104 	call putc 
      0086BB 5F               [ 1] 1105 	clrw x 
      0086BC C6 00 06         [ 1] 1106 	ld a,lineno 
      0086BF CA 00 07         [ 1] 1107 	or a,lineno+1
      0086C2 27 03            [ 1] 1108 	jreq 4$
      0086C4 AE 00 03         [ 2] 1109 	ldw x,#3 
      0086C7 72 BB 00 01      [ 2] 1110 4$:	addw x,in.w 
      0086CB CD 82 58         [ 4] 1111 	call spaces
      0086CE A6 5E            [ 1] 1112 	ld a,#'^ 
      0086D0 CD 82 1E         [ 4] 1113 	call putc 
      0086D3 AE 17 FF         [ 2] 1114 1$: ldw x,#STACK_EMPTY 
      0086D6 94               [ 1] 1115     ldw sp,x
      0086D7                       1116 warm_start:
      0086D7 72 5F 00 25      [ 1] 1117 	clr flags 
      0086DB 72 5F 00 20      [ 1] 1118 	clr loop_depth 
      0086DF AE 17 80         [ 2] 1119 	ldw x,#dstack_unf 
      0086E2 CF 00 1A         [ 2] 1120 	ldw dstkptr,x 
      0086E5 35 04 00 26      [ 1] 1121 	mov tab_width,#TAB_WIDTH 
      0086E9 35 0A 00 08      [ 1] 1122 	mov base,#10 
      0086ED 5F               [ 1] 1123 	clrw x 
      0086EE CF 00 06         [ 2] 1124 	ldw lineno,x 
      0086F1 AE 16 C8         [ 2] 1125 	ldw x,#tib 
      0086F4 CF 00 04         [ 2] 1126 	ldw basicptr,x 
                                   1127 ;----------------------------
                                   1128 ;   BASIC interpreter
                                   1129 ;----------------------------
      0086F7                       1130 interp:
      0086F7 72 5F 00 01      [ 1] 1131 	clr in.w
      0086FB 72 01 00 25 2C   [ 2] 1132 	btjf flags,#FRUN,4$ 
                                   1133 ; running program
                                   1134 ; goto next basic line 
      008700 CE 00 04         [ 2] 1135 	ldw x,basicptr
      008703 E6 02            [ 1] 1136 	ld a,(2,x) ; line length 
      008705 C7 00 0B         [ 1] 1137 	ld acc8,a 
      008708 72 5F 00 0A      [ 1] 1138 	clr acc16 
      00870C 1C 00 03         [ 2] 1139 	addw x,#3 
      00870F 72 BB 00 0A      [ 2] 1140 	addw x,acc16
      008713 C3 00 1E         [ 2] 1141 	cpw x,txtend 
      008716 2A BF            [ 1] 1142 	jrpl warm_start
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008718 CF 00 04         [ 2] 1143 	ldw basicptr,x ; start of next line  
      00871B E6 02            [ 1] 1144 	ld a,(2,x)
      00871D AB 02            [ 1] 1145 	add a,#2 ; because 'in' start at 3.
      00871F C7 00 03         [ 1] 1146 	ld count,a 
      008722 FE               [ 2] 1147 	ldw x,(x) ; line no 
      008723 CF 00 06         [ 2] 1148 	ldw lineno,x 
      008726 35 03 00 02      [ 1] 1149 	mov in,#3 ; skip first 3 bytes of line 
      00872A 20 11            [ 2] 1150 	jra interp_loop 
      00872C                       1151 4$: ; commande line mode 	
      00872C 72 5F 00 02      [ 1] 1152 	clr in 
      008730 A6 0D            [ 1] 1153 	ld a,#CR 
      008732 CD 82 1E         [ 4] 1154 	call putc 
      008735 A6 3E            [ 1] 1155 	ld a,#'> 
      008737 CD 82 1E         [ 4] 1156 	call putc 
      00873A CD 89 BC         [ 4] 1157 	call readln
      00873D                       1158 interp_loop:  
      00873D C6 00 02         [ 1] 1159 	ld a,in 
      008740 C1 00 03         [ 1] 1160 	cp a,count 
      008743 2A B2            [ 1] 1161 	jrpl interp
      008745 CD 8C 66         [ 4] 1162 	call get_token
      008748 A1 01            [ 1] 1163 	cp a,#TK_COLON 
      00874A 27 F1            [ 1] 1164 	jreq interp_loop 
      00874C A1 00            [ 1] 1165 	cp a,#TK_NONE 
      00874E 27 A7            [ 1] 1166 	jreq interp 
      008750                       1167 1$:
      008750 A1 02            [ 1] 1168 	cp a,#TK_VAR
      008752 26 05            [ 1] 1169 	jrne 2$
      008754 CD 92 C9         [ 4] 1170 	call let02  
      008757 20 E4            [ 2] 1171 	jra interp_loop 
      008759                       1172 2$:	
      008759 A1 03            [ 1] 1173 	cp a,#TK_ARRAY 
      00875B 26 08            [ 1] 1174 	jrne 3$
      00875D CD 91 1E         [ 4] 1175 	call get_array_element
      008760 CD 92 C9         [ 4] 1176 	call let02 
      008763 20 D8            [ 2] 1177 	jra interp_loop 
      008765                       1178 3$:
      008765 A1 07            [ 1] 1179 	cp a,#TK_CMD
      008767 26 03            [ 1] 1180 	jrne 4$
      008769 FD               [ 4] 1181 	call (x) 
      00876A 20 D1            [ 2] 1182 	jra interp_loop 
      00876C                       1183 4$:	
      00876C A1 0A            [ 1] 1184 	cp a,#TK_INTGR
      00876E 26 06            [ 1] 1185 	jrne 5$
      008770 CD 83 EF         [ 4] 1186 	call insert_line 
      008773 CC 86 F7         [ 2] 1187 	jp interp
      008776                       1188 5$: 
      008776 CC 86 7B         [ 2] 1189 	jp syntax_error 
                                   1190 
                                   1191 ;----------------------------------------
                                   1192 ;   DEBUG support functions
                                   1193 ;----------------------------------------
                           000001  1194 .if DEBUG 
                                   1195 ; turn LED on 
      008779                       1196 ledon:
      008779 72 1A 50 0A      [ 1] 1197     bset PC_ODR,#LED2_BIT
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00877D 81               [ 4] 1198     ret 
                                   1199 
                                   1200 ; turn LED off 
      00877E                       1201 ledoff:
      00877E 72 1B 50 0A      [ 1] 1202     bres PC_ODR,#LED2_BIT 
      008782 81               [ 4] 1203     ret 
                                   1204 
                                   1205 ; invert LED status 
      008783                       1206 ledtoggle:
      008783 A6 20            [ 1] 1207     ld a,#LED2_MASK
      008785 C8 50 0A         [ 1] 1208     xor a,PC_ODR
      008788 C7 50 0A         [ 1] 1209     ld PC_ODR,a
      00878B 81               [ 4] 1210     ret 
                                   1211 
      00878C                       1212 left_paren:
      00878C A6 20            [ 1] 1213 	ld a,#SPACE 
      00878E CD 82 1E         [ 4] 1214 	call putc
      008791 A6 28            [ 1] 1215 	ld a,#'( 
      008793 CD 82 1E         [ 4] 1216 	call putc 	
      008796 81               [ 4] 1217 	ret 
                                   1218 
                                   1219 ;------------------------------
                                   1220 ; print 8 bit register 
                                   1221 ; input:
                                   1222 ;   X  point to register name 
                                   1223 ;   A  register value to print 
                                   1224 ; output:
                                   1225 ;   none
                                   1226 ;------------------------------- 
      008797                       1227 prt_reg8:
      008797 88               [ 1] 1228 	push a 
      008798 CD 82 30         [ 4] 1229 	call puts 
      00879B 7B 01            [ 1] 1230 	ld a,(1,sp) 
      00879D C7 00 0B         [ 1] 1231 	ld acc8,a 
      0087A0 5F               [ 1] 1232 	clrw x 
      0087A1 97               [ 1] 1233 	ld xl,a 
      0087A2 35 10 00 08      [ 1] 1234 	mov base,#16
      0087A6 CD 88 CE         [ 4] 1235 	call print_int 
      0087A9 CD 87 8C         [ 4] 1236 	call left_paren 
      0087AC 84               [ 1] 1237 	pop a 
      0087AD 5F               [ 1] 1238 	clrw x 
      0087AE 97               [ 1] 1239 	ld xl,a 
      0087AF 35 0A 00 08      [ 1] 1240 	mov base,#10 
      0087B3 CD 88 CE         [ 4] 1241 	call print_int  
      0087B6 A6 29            [ 1] 1242 	ld a,#') 
      0087B8 CD 82 1E         [ 4] 1243 	call putc
      0087BB 81               [ 4] 1244 	ret
                                   1245 
                                   1246 ;--------------------------------
                                   1247 ; print 16 bits register 
                                   1248 ; input:
                                   1249 ;   X   point register name 
                                   1250 ;   Y   register value to print 
                                   1251 ; output:
                                   1252 ;  none
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1253 ;--------------------------------
      0087BC                       1254 prt_reg16: 
      0087BC 90 89            [ 2] 1255 	pushw y 
      0087BE CD 82 30         [ 4] 1256 	call puts 
      0087C1 1E 01            [ 2] 1257 	ldw x,(1,sp) 
      0087C3 35 10 00 08      [ 1] 1258 	mov base,#16 
      0087C7 CD 88 CE         [ 4] 1259 	call print_int  
      0087CA CD 87 8C         [ 4] 1260 	call left_paren 
      0087CD 85               [ 2] 1261 	popw x 
      0087CE 35 0A 00 08      [ 1] 1262 	mov base,#10 
      0087D2 CD 88 CE         [ 4] 1263 	call print_int  
      0087D5 A6 29            [ 1] 1264 	ld a,#') 
      0087D7 CD 82 1E         [ 4] 1265 	call putc
      0087DA 81               [ 4] 1266 	ret 
                                   1267 
                                   1268 ;------------------------------------
                                   1269 ; print registers contents saved on
                                   1270 ; stack by trap interrupt.
                                   1271 ;------------------------------------
      0087DB                       1272 print_registers:
      0087DB AE 88 2E         [ 2] 1273 	ldw x,#STATES
      0087DE CD 82 30         [ 4] 1274 	call puts
                                   1275 ; print EPC 
      0087E1 AE 88 6B         [ 2] 1276 	ldw x, #REG_EPC
      0087E4 CD 82 30         [ 4] 1277 	call puts 
      0087E7 7B 0B            [ 1] 1278 	ld a, (11,sp)
      0087E9 C7 00 0B         [ 1] 1279 	ld acc8,a 
      0087EC 7B 0A            [ 1] 1280 	ld a, (10,sp) 
      0087EE C7 00 0A         [ 1] 1281 	ld acc16,a 
      0087F1 7B 09            [ 1] 1282 	ld a,(9,sp) 
      0087F3 C7 00 09         [ 1] 1283 	ld acc24,a
      0087F6 5F               [ 1] 1284 	clrw x  
      0087F7 A6 10            [ 1] 1285 	ld a,#16
      0087F9 CD 88 86         [ 4] 1286 	call prti24  
                                   1287 ; print X
      0087FC AE 88 74         [ 2] 1288 	ldw x,#REG_X
      0087FF 16 05            [ 2] 1289 	ldw y,(5,sp)
      008801 CD 87 BC         [ 4] 1290 	call prt_reg16  
                                   1291 ; print Y 
      008804 AE 88 70         [ 2] 1292 	ldw x,#REG_Y
      008807 16 07            [ 2] 1293 	ldw y, (7,sp)
      008809 CD 87 BC         [ 4] 1294 	call prt_reg16  
                                   1295 ; print A 
      00880C AE 88 78         [ 2] 1296 	ldw x,#REG_A
      00880F 7B 04            [ 1] 1297 	ld a, (4,sp) 
      008811 CD 87 97         [ 4] 1298 	call prt_reg8
                                   1299 ; print CC 
      008814 AE 88 7C         [ 2] 1300 	ldw x,#REG_CC 
      008817 7B 03            [ 1] 1301 	ld a, (3,sp) 
      008819 CD 87 97         [ 4] 1302 	call prt_reg8 
                                   1303 ; print SP 
      00881C AE 88 81         [ 2] 1304 	ldw x,#REG_SP
      00881F 90 96            [ 1] 1305 	ldw y,sp 
      008821 72 A9 00 0C      [ 2] 1306 	addw y,#12
      008825 CD 87 BC         [ 4] 1307 	call prt_reg16  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal [24-Bits]



      008828 A6 0A            [ 1] 1308 	ld a,#'\n' 
      00882A CD 82 1E         [ 4] 1309 	call putc
      00882D 81               [ 4] 1310 	ret
                                   1311 
      00882E 0A 52 65 67 69 73 74  1312 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      00886B 45 50 43 3A 00        1313 REG_EPC: .asciz "EPC:"
      008870 0A 59 3A 00           1314 REG_Y:   .asciz "\nY:" 
      008874 0A 58 3A 00           1315 REG_X:   .asciz "\nX:"
      008878 0A 41 3A 00           1316 REG_A:   .asciz "\nA:" 
      00887C 0A 43 43 3A 00        1317 REG_CC:  .asciz "\nCC:"
      008881 0A 53 50 3A 00        1318 REG_SP:  .asciz "\nSP:"
                                   1319 .endif ; DEBUG 
                                   1320 
                                   1321 ;------------------------------------
                                   1322 ; print integer in acc24 
                                   1323 ; input:
                                   1324 ;	acc24 		integer to print 
                                   1325 ;	A 			numerical base for conversion 
                                   1326 ;               if bit 7 is set add a space at print end.
                                   1327 ;   XL 			field width, 0 -> no fill.
                                   1328 ;  output:
                                   1329 ;    none 
                                   1330 ;------------------------------------
                           000001  1331 	WIDTH = 1
                           000002  1332 	BASE = 2
                           000003  1333 	ADD_SPACE=3 ; add a space after number 
                           000003  1334 	VSIZE = 3
      008886                       1335 prti24:
      000806                       1336 	_vars VSIZE 
      008886 52 03            [ 2]    1     sub sp,#VSIZE 
      008888 0F 03            [ 1] 1337 	clr (ADD_SPACE,sp)
      00888A A5 80            [ 1] 1338 	bcp a,#0x80 
      00888C 27 02            [ 1] 1339 	jreq 0$ 
      00888E 03 03            [ 1] 1340 	cpl (ADD_SPACE,sp)
      008890 A4 1F            [ 1] 1341 0$:	and a,#31 
      008892 6B 02            [ 1] 1342 	ld (BASE,sp),a
      008894 9F               [ 1] 1343 	ld a,xl
      008895 6B 01            [ 1] 1344 	ld (WIDTH,sp),a 
      008897 7B 02            [ 1] 1345 	ld a, (BASE,sp)  
      008899 CD 89 2A         [ 4] 1346     call itoa  ; conversion entier en  .asciz
      00889C 7B 01            [ 1] 1347 1$: ld a,(WIDTH,sp)
      00889E 27 1F            [ 1] 1348 	jreq 4$
      0088A0 C7 00 0B         [ 1] 1349 	ld acc8,a 
      0088A3 89               [ 2] 1350 	pushw x 
      0088A4 CD 82 F2         [ 4] 1351 	call strlen 
      0088A7 9F               [ 1] 1352 	ld a,xl 
      0088A8 85               [ 2] 1353 	popw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0088A9 31 00 0B         [ 3] 1354 	exg a,acc8 
      0088AC C0 00 0B         [ 1] 1355 	sub a,acc8 
      0088AF 2B 0E            [ 1] 1356 	jrmi 4$
      0088B1 6B 01            [ 1] 1357 	ld (WIDTH,sp),a 
      0088B3 A6 20            [ 1] 1358 	ld  a,#SPACE
      0088B5 0D 01            [ 1] 1359 3$: tnz (WIDTH,sp)
      0088B7 27 06            [ 1] 1360 	jreq 4$
      0088B9 5A               [ 2] 1361 	decw x 
      0088BA F7               [ 1] 1362 	ld (x),a 
      0088BB 0A 01            [ 1] 1363 	dec (WIDTH,sp) 
      0088BD 20 F6            [ 2] 1364 	jra 3$
      0088BF                       1365 4$: 
      0088BF CD 82 30         [ 4] 1366 	call puts 
      0088C2 0D 03            [ 1] 1367 	tnz (ADD_SPACE,sp)
      0088C4 27 05            [ 1] 1368 	jreq 5$
      0088C6 A6 20            [ 1] 1369     ld a,#SPACE 
      0088C8 CD 82 1E         [ 4] 1370 	call putc 
      00084B                       1371 5$: _drop VSIZE 
      0088CB 5B 03            [ 2]    1     addw sp,#VSIZE 
      0088CD 81               [ 4] 1372     ret	
                                   1373 
                                   1374 ;-----------------------------------
                                   1375 ; print a 16 bit integer 
                                   1376 ; using variable 'base' as conversion
                                   1377 ; format.
                                   1378 ; input:
                                   1379 ;   X       integer to print 
                                   1380 ;   base    conversion base 
                                   1381 ; output:
                                   1382 ;   none 
                                   1383 ;-----------------------------------
                           000001  1384 	SIGN=1
                           000001  1385 	VSIZE=1
      0088CE                       1386 print_int: 
      00084E                       1387 	_vars VSIZE 
      0088CE 52 01            [ 2]    1     sub sp,#VSIZE 
      0088D0 0F 01            [ 1] 1388 	clr (SIGN,sp)
      0088D2 90 AE 17 3F      [ 2] 1389 	ldw y,#pad+PAD_SIZE-1 
      0088D6 90 7F            [ 1] 1390 	clr (y)
      0088D8 C6 00 08         [ 1] 1391 	ld a,base  
      0088DB A1 0A            [ 1] 1392 	cp a,#10 
      0088DD 26 06            [ 1] 1393 	jrne 1$ 
      0088DF 5D               [ 2] 1394 	tnzw x 
      0088E0 2A 03            [ 1] 1395 	jrpl 1$ 
      0088E2 03 01            [ 1] 1396 	cpl (SIGN,sp)
      0088E4 50               [ 2] 1397 	negw x 	 
      0088E5                       1398 1$:	
      0088E5 C6 00 08         [ 1] 1399 	ld a,base 
      0088E8 62               [ 2] 1400 	div x,a 
      0088E9 AB 30            [ 1] 1401 	add a,#'0 
      0088EB A1 3A            [ 1] 1402 	cp a,#'9+1 
      0088ED 2B 02            [ 1] 1403 	jrmi 2$ 
      0088EF AB 07            [ 1] 1404 	add a,#7 
      0088F1 90 5A            [ 2] 1405 2$: decw y 
      0088F3 90 F7            [ 1] 1406 	ld (y),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      0088F5 5D               [ 2] 1407 	tnzw x 
      0088F6 26 ED            [ 1] 1408 	jrne 1$ 
      0088F8 A6 10            [ 1] 1409 	ld a,#16 
      0088FA C1 00 08         [ 1] 1410 	cp a,base 
      0088FD 26 08            [ 1] 1411 	jrne 3$
      0088FF A6 24            [ 1] 1412 	ld a,#'$
      008901 90 5A            [ 2] 1413 	decw y  
      008903 90 F7            [ 1] 1414 	ld (y),a
      008905 20 0A            [ 2] 1415 	jra 9$ 
      008907 0D 01            [ 1] 1416 3$: tnz (SIGN,sp)
      008909 27 06            [ 1] 1417 	jreq 9$ 
      00890B A6 2D            [ 1] 1418 	ld a,#'-
      00890D 90 5A            [ 2] 1419 	decw y  
      00890F 90 F7            [ 1] 1420 	ld (y),a
      008911                       1421 9$:	
      008911 93               [ 1] 1422 	ldw x,y 
      008912 1D 17 3F         [ 2] 1423 	subw x,#pad+PAD_SIZE-1 
      008915 50               [ 2] 1424 	negw x  
      008916                       1425 10$:
      008916 90 5A            [ 2] 1426 	decw y 
      008918 A6 20            [ 1] 1427 	ld a,#SPACE 
      00891A 90 F7            [ 1] 1428 	ld (y),a
      00891C 5C               [ 1] 1429 	incw x 
      00891D 9F               [ 1] 1430 	ld a,xl 
      00891E C1 00 26         [ 1] 1431 	cp a,tab_width
      008921 2B F3            [ 1] 1432 	jrmi 10$ 
      008923                       1433 12$:
      008923 93               [ 1] 1434     ldw x,y 
      008924 CD 82 30         [ 4] 1435 	call puts  
      0008A7                       1436 	_drop VSIZE 
      008927 5B 01            [ 2]    1     addw sp,#VSIZE 
      008929 81               [ 4] 1437 	ret 
                                   1438 
                                   1439 ;------------------------------------
                                   1440 ; convert integer in acc24 to string
                                   1441 ; input:
                                   1442 ;   A	  	base
                                   1443 ;	acc24	integer to convert
                                   1444 ; output:
                                   1445 ;   X  		pointer to string
                                   1446 ;------------------------------------
                           000001  1447 	SIGN=1  ; integer sign 
                           000002  1448 	BASE=2  ; numeric base 
                           000002  1449 	VSIZE=2  ;locals size
      00892A                       1450 itoa:
      00892A 52 02            [ 2] 1451 	sub sp,#VSIZE
      00892C 6B 02            [ 1] 1452 	ld (BASE,sp), a  ; base
      00892E 0F 01            [ 1] 1453 	clr (SIGN,sp)    ; sign
      008930 A1 0A            [ 1] 1454 	cp a,#10
      008932 26 0A            [ 1] 1455 	jrne 1$
                                   1456 	; base 10 string display with negative sign if bit 23==1
      008934 72 0F 00 09 05   [ 2] 1457 	btjf acc24,#7,1$
      008939 03 01            [ 1] 1458 	cpl (SIGN,sp)
      00893B CD 89 99         [ 4] 1459 	call neg_acc24
      00893E                       1460 1$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



                                   1461 ; initialize string pointer 
      00893E AE 17 3F         [ 2] 1462 	ldw x,#pad+PAD_SIZE-1
      008941 7F               [ 1] 1463 	clr (x)
      008942                       1464 itoa_loop:
      008942 7B 02            [ 1] 1465     ld a,(BASE,sp)
      008944 CD 89 71         [ 4] 1466     call divu24_8 ; acc24/A 
      008947 AB 30            [ 1] 1467     add a,#'0  ; remainder of division
      008949 A1 3A            [ 1] 1468     cp a,#'9+1
      00894B 2B 02            [ 1] 1469     jrmi 2$
      00894D AB 07            [ 1] 1470     add a,#7 
      00894F 5A               [ 2] 1471 2$: decw x
      008950 F7               [ 1] 1472     ld (x),a
                                   1473 	; if acc24==0 conversion done
      008951 C6 00 09         [ 1] 1474 	ld a,acc24
      008954 CA 00 0A         [ 1] 1475 	or a,acc16
      008957 CA 00 0B         [ 1] 1476 	or a,acc8
      00895A 26 E6            [ 1] 1477     jrne itoa_loop
                                   1478 	;conversion done, next add '$' or '-' as required
      00895C 7B 02            [ 1] 1479 	ld a,(BASE,sp)
      00895E A1 10            [ 1] 1480 	cp a,#16
      008960 27 08            [ 1] 1481 	jreq 8$
      008962 7B 01            [ 1] 1482 	ld a,(SIGN,sp)
      008964 27 08            [ 1] 1483     jreq 10$
      008966 A6 2D            [ 1] 1484     ld a,#'-
      008968 20 02            [ 2] 1485 	jra 9$ 
      00896A A6 24            [ 1] 1486 8$: ld a,#'$ 
      00896C 5A               [ 2] 1487 9$: decw x
      00896D F7               [ 1] 1488     ld (x),a
      00896E                       1489 10$:
      00896E 5B 02            [ 2] 1490 	addw sp,#VSIZE
      008970 81               [ 4] 1491 	ret
                                   1492 
                                   1493 ;-------------------------------------
                                   1494 ; divide uint24_t by uint8_t
                                   1495 ; used to convert uint24_t to string
                                   1496 ; input:
                                   1497 ;	acc24	dividend
                                   1498 ;   A 		divisor
                                   1499 ; output:
                                   1500 ;   acc24	quotient
                                   1501 ;   A		remainder
                                   1502 ;------------------------------------- 
                                   1503 ; offset  on sp of arguments and locals
                           000001  1504 	U8   = 1   ; divisor on stack
                           000001  1505 	VSIZE =1
      008971                       1506 divu24_8:
      008971 89               [ 2] 1507 	pushw x ; save x
      008972 88               [ 1] 1508 	push a 
                                   1509 	; ld dividend UU:MM bytes in X
      008973 C6 00 09         [ 1] 1510 	ld a, acc24
      008976 95               [ 1] 1511 	ld xh,a
      008977 C6 00 0A         [ 1] 1512 	ld a,acc24+1
      00897A 97               [ 1] 1513 	ld xl,a
      00897B 7B 01            [ 1] 1514 	ld a,(U8,SP) ; divisor
      00897D 62               [ 2] 1515 	div x,a ; UU:MM/U8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      00897E 88               [ 1] 1516 	push a  ;save remainder
      00897F 9E               [ 1] 1517 	ld a,xh
      008980 C7 00 09         [ 1] 1518 	ld acc24,a
      008983 9F               [ 1] 1519 	ld a,xl
      008984 C7 00 0A         [ 1] 1520 	ld acc24+1,a
      008987 84               [ 1] 1521 	pop a
      008988 95               [ 1] 1522 	ld xh,a
      008989 C6 00 0B         [ 1] 1523 	ld a,acc24+2
      00898C 97               [ 1] 1524 	ld xl,a
      00898D 7B 01            [ 1] 1525 	ld a,(U8,sp) ; divisor
      00898F 62               [ 2] 1526 	div x,a  ; R:LL/U8
      008990 6B 01            [ 1] 1527 	ld (U8,sp),a ; save remainder
      008992 9F               [ 1] 1528 	ld a,xl
      008993 C7 00 0B         [ 1] 1529 	ld acc24+2,a
      008996 84               [ 1] 1530 	pop a
      008997 85               [ 2] 1531 	popw x
      008998 81               [ 4] 1532 	ret
                                   1533 
                                   1534 ;------------------------------------
                                   1535 ;  two's complement acc24
                                   1536 ;  input:
                                   1537 ;		acc24 variable
                                   1538 ;  output:
                                   1539 ;		acc24 variable
                                   1540 ;-------------------------------------
      008999                       1541 neg_acc24:
      008999 72 53 00 0B      [ 1] 1542 	cpl acc24+2
      00899D 72 53 00 0A      [ 1] 1543 	cpl acc24+1
      0089A1 72 53 00 09      [ 1] 1544 	cpl acc24
      0089A5 A6 01            [ 1] 1545 	ld a,#1
      0089A7 CB 00 0B         [ 1] 1546 	add a,acc24+2
      0089AA C7 00 0B         [ 1] 1547 	ld acc24+2,a
      0089AD 4F               [ 1] 1548 	clr a
      0089AE C9 00 0A         [ 1] 1549 	adc a,acc24+1
      0089B1 C7 00 0A         [ 1] 1550 	ld acc24+1,a 
      0089B4 4F               [ 1] 1551 	clr a 
      0089B5 C9 00 09         [ 1] 1552 	adc a,acc24 
      0089B8 C7 00 09         [ 1] 1553 	ld acc24,a 
      0089BB 81               [ 4] 1554 	ret
                                   1555 
                                   1556 
                                   1557 ;------------------------------------
                                   1558 ; read a line of text from terminal
                                   1559 ; input:
                                   1560 ;	none
                                   1561 ; local variable on stack:
                                   1562 ;	LL  line length
                                   1563 ;   RXCHAR last received chaaracte 
                                   1564 ; output:
                                   1565 ;   text in tib  buffer
                                   1566 ;------------------------------------
                                   1567 	; local variables
                           000001  1568 	LL_HB=1
                           000001  1569 	RXCHAR = 1 ; last char received
                           000002  1570 	LL = 2  ; accepted line length
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                           000002  1571 	VSIZE=2 
      0089BC                       1572 readln:
      0089BC 5F               [ 1] 1573 	clrw x 
      0089BD 89               [ 2] 1574 	pushw x 
      0089BE 90 AE 16 C8      [ 2] 1575  	ldw y,#tib ; input buffer
      0089C2                       1576 readln_loop:
      0089C2 CD 82 27         [ 4] 1577 	call getc
      0089C5 6B 01            [ 1] 1578 	ld (RXCHAR,sp),a
      0089C7 A1 0D            [ 1] 1579 	cp a,#CR
      0089C9 26 03            [ 1] 1580 	jrne 1$
      0089CB CC 8A 3B         [ 2] 1581 	jp readln_quit
      0089CE A1 0A            [ 1] 1582 1$:	cp a,#NL
      0089D0 27 69            [ 1] 1583 	jreq readln_quit
      0089D2 A1 08            [ 1] 1584 	cp a,#BSP
      0089D4 27 41            [ 1] 1585 	jreq del_back
      0089D6 A1 04            [ 1] 1586 	cp a,#CTRL_D
      0089D8 27 2E            [ 1] 1587 	jreq del_ln
      0089DA A1 12            [ 1] 1588 	cp a,#CTRL_R 
      0089DC 27 06            [ 1] 1589 	jreq reprint 
                                   1590 ;	cp a,#'[
                                   1591 ;	jreq ansi_seq
      0089DE                       1592 final_test:
      0089DE A1 20            [ 1] 1593 	cp a,#SPACE
      0089E0 2A 44            [ 1] 1594 	jrpl accept_char
      0089E2 20 DE            [ 2] 1595 	jra readln_loop
      0089E4                       1596 ansi_seq:
                                   1597 ;	call getc
                                   1598 ;	cp a,#'C 
                                   1599 ;	jreq rigth_arrow
                                   1600 ;	cp a,#'D 
                                   1601 ;	jreq left_arrow 
                                   1602 ;	jra final_test
      0089E4                       1603 right_arrow:
                                   1604 ;	ld a,#BSP 
                                   1605 ;	call putc 
                                   1606 ;	jra realn_loop 
      0089E4                       1607 left_arrow:
                                   1608 
                                   1609 ;	jra readln_loop
      0089E4                       1610 reprint: 
      0089E4 72 5D 00 03      [ 1] 1611 	tnz count 
      0089E8 27 D8            [ 1] 1612 	jreq readln_loop
      0089EA 0D 02            [ 1] 1613 	tnz (LL,sp)
      0089EC 26 D4            [ 1] 1614 	jrne readln_loop
      0089EE AE 16 C8         [ 2] 1615 	ldw x,#tib 
      0089F1 CD 82 30         [ 4] 1616 	call puts
      0089F4 90 AE 16 C8      [ 2] 1617 	ldw y,#tib 
      0089F8 C6 00 03         [ 1] 1618 	ld a,count 
      0089FB 6B 02            [ 1] 1619 	ld (LL,sp),a
      0089FD 72 5F 00 03      [ 1] 1620 	clr count 
      008A01 0F 01            [ 1] 1621 	clr (LL_HB,sp)
      008A03 72 F9 01         [ 2] 1622 	addw y,(LL_HB,sp)
      008A06 20 BA            [ 2] 1623 	jra readln_loop 
      008A08                       1624 del_ln:
      008A08 7B 02            [ 1] 1625 	ld a,(LL,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A0A CD 82 4A         [ 4] 1626 	call delete
      008A0D 90 AE 16 C8      [ 2] 1627 	ldw y,#tib
      008A11 90 7F            [ 1] 1628 	clr (y)
      008A13 0F 02            [ 1] 1629 	clr (LL,sp)
      008A15 20 AB            [ 2] 1630 	jra readln_loop
      008A17                       1631 del_back:
      008A17 0D 02            [ 1] 1632     tnz (LL,sp)
      008A19 27 A7            [ 1] 1633     jreq readln_loop
      008A1B 0A 02            [ 1] 1634     dec (LL,sp)
      008A1D 90 5A            [ 2] 1635     decw y
      008A1F 90 7F            [ 1] 1636     clr  (y)
      008A21 CD 82 3A         [ 4] 1637     call bksp 
      008A24 20 9C            [ 2] 1638     jra readln_loop	
      008A26                       1639 accept_char:
      008A26 A6 4F            [ 1] 1640 	ld a,#TIB_SIZE-1
      008A28 11 02            [ 1] 1641 	cp a, (LL,sp)
      008A2A 27 96            [ 1] 1642 	jreq readln_loop
      008A2C 7B 01            [ 1] 1643 	ld a,(RXCHAR,sp)
      008A2E 90 F7            [ 1] 1644 	ld (y),a
      008A30 0C 02            [ 1] 1645 	inc (LL,sp)
      008A32 90 5C            [ 1] 1646 	incw y
      008A34 90 7F            [ 1] 1647 	clr (y)
      008A36 CD 82 1E         [ 4] 1648 	call putc 
      008A39 20 87            [ 2] 1649 	jra readln_loop
      008A3B                       1650 readln_quit:
      008A3B 90 7F            [ 1] 1651 	clr (y)
      008A3D 7B 02            [ 1] 1652 	ld a,(LL,sp)
      008A3F C7 00 03         [ 1] 1653 	ld count,a 
      0009C2                       1654 	_drop VSIZE 
      008A42 5B 02            [ 2]    1     addw sp,#VSIZE 
      008A44 A6 0D            [ 1] 1655 	ld a,#CR
      008A46 CD 82 1E         [ 4] 1656 	call putc
      008A49 81               [ 4] 1657 	ret
                                   1658 
                           000001  1659 .if DEBUG 	
                                   1660 ;----------------------------
                                   1661 ; command interface
                                   1662 ; only 3 commands:
                                   1663 ;  'q' to resume application
                                   1664 ;  'p [addr]' to print memory values 
                                   1665 ;  's addr' to print string 
                                   1666 ;----------------------------
                                   1667 ;local variable 
                           000001  1668 	PSIZE=1
                           000001  1669 	VSIZE=1 
      008A4A                       1670 cmd_itf:
      008A4A 52 01            [ 2] 1671 	sub sp,#VSIZE 
      008A4C 72 5F 00 14      [ 1] 1672 	clr farptr 
      008A50 72 5F 00 15      [ 1] 1673 	clr farptr+1 
      008A54 72 5F 00 16      [ 1] 1674 	clr farptr+2  
      008A58                       1675 repl:
      008A58 A6 0D            [ 1] 1676 	ld a,#CR 
      008A5A CD 82 1E         [ 4] 1677 	call putc 
      008A5D A6 3F            [ 1] 1678 	ld a,#'? 
      008A5F CD 82 1E         [ 4] 1679 	call putc
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      008A62 72 5F 00 01      [ 1] 1680 	clr in.w 
      008A66 72 5F 00 02      [ 1] 1681 	clr in 
      008A6A CD 89 BC         [ 4] 1682 	call readln
      008A6D 90 AE 16 C8      [ 2] 1683 	ldw y,#tib  
      008A71 90 F6            [ 1] 1684 	ld a,(y)
      008A73 27 E3            [ 1] 1685 	jreq repl  
      008A75 72 5C 00 02      [ 1] 1686 	inc in 
      008A79 CD 8E 2A         [ 4] 1687 	call to_upper 
      008A7C A1 51            [ 1] 1688 	cp a,#'Q 
      008A7E 26 17            [ 1] 1689 	jrne test_p
      008A80                       1690 repl_exit:
      008A80 72 5F 16 C8      [ 1] 1691 	clr tib 
      008A84 72 5F 00 03      [ 1] 1692 	clr count 
      008A88 72 5F 00 02      [ 1] 1693 	clr in 
      000A0C                       1694 	_drop #VSIZE 	
      008A8C 5B 01            [ 2]    1     addw sp,##VSIZE 
      008A8E 81               [ 4] 1695 	ret  
      008A8F                       1696 invalid:
      008A8F AE 8B 0D         [ 2] 1697 	ldw x,#invalid_cmd 
      008A92 CD 82 30         [ 4] 1698 	call puts 
      008A95 20 C1            [ 2] 1699 	jra repl 
      008A97                       1700 test_p:	
      008A97 A1 50            [ 1] 1701     cp a,#'P 
      008A99 27 11            [ 1] 1702 	jreq mem_peek
      008A9B A1 53            [ 1] 1703     cp a,#'S 
      008A9D 26 F0            [ 1] 1704 	jrne invalid 
      008A9F                       1705 print_string:	
      008A9F CD 8C 66         [ 4] 1706 	call get_token
      008AA2 A1 0A            [ 1] 1707 	cp a,#TK_INTGR 
      008AA4 26 E9            [ 1] 1708 	jrne invalid 
      008AA6 CD 82 30         [ 4] 1709 	call puts
      008AA9 CC 8A 58         [ 2] 1710 	jp repl 	
      008AAC                       1711 mem_peek:
      008AAC A6 20            [ 1] 1712 	ld a,#SPACE 
      008AAE CD 8E E2         [ 4] 1713 	call skip  	 
      008AB1 72 B9 00 01      [ 2] 1714 	addw y,in.w 
      008AB5 AE 17 18         [ 2] 1715 	ldw x,#pad 
      008AB8 CD 83 10         [ 4] 1716 	call strcpy
      008ABB CD 8E 36         [ 4] 1717 	call atoi24 	
      008ABE C6 00 09         [ 1] 1718 	ld a, acc24 
      008AC1 CA 00 0A         [ 1] 1719 	or a,acc16 
      008AC4 CA 00 0B         [ 1] 1720 	or a,acc8 
      008AC7 26 02            [ 1] 1721 	jrne 1$ 
      008AC9 20 0C            [ 2] 1722 	jra peek_byte  
      008ACB CE 00 09         [ 2] 1723 1$:	ldw x,acc24 
      008ACE CF 00 14         [ 2] 1724 	ldw farptr,x 
      008AD1 C6 00 0B         [ 1] 1725 	ld a,acc8 
      008AD4 C7 00 16         [ 1] 1726 	ld farptr+2,a 
      008AD7                       1727 peek_byte:
      008AD7 CD 8B 1C         [ 4] 1728 	call print_farptr 
      008ADA A6 08            [ 1] 1729 	ld a,#8 
      008ADC 6B 01            [ 1] 1730 	ld (PSIZE,sp),a 
      008ADE 5F               [ 1] 1731 	clrw x 
      008ADF CD 8B 37         [ 4] 1732 1$:	call fetchc  
      008AE2 89               [ 2] 1733 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008AE3 C7 00 0B         [ 1] 1734 	ld acc8,a 
      008AE6 5F               [ 1] 1735 	clrw x 
      008AE7 CF 00 09         [ 2] 1736 	ldw acc24,x 
      008AEA A6 90            [ 1] 1737 	ld a,#16+128
      008AEC CD 88 86         [ 4] 1738 	call prti24
      008AEF 85               [ 2] 1739 	popw x 
      008AF0 0A 01            [ 1] 1740 	dec (PSIZE,sp)
      008AF2 26 EB            [ 1] 1741 	jrne 1$ 
      008AF4 A6 08            [ 1] 1742 	ld a,#8 
      008AF6 CB 00 16         [ 1] 1743 	add a,farptr+2 
      008AF9 C7 00 16         [ 1] 1744 	ld farptr+2,a
      008AFC 4F               [ 1] 1745 	clr a 
      008AFD C9 00 15         [ 1] 1746 	adc a,farptr+1 
      008B00 C7 00 15         [ 1] 1747 	ld farptr+1,a 
      008B03 4F               [ 1] 1748 	clr a 
      008B04 C9 00 14         [ 1] 1749 	adc a,farptr 
      008B07 C7 00 14         [ 1] 1750 	ld farptr,a 
      008B0A CC 8A 58         [ 2] 1751 	jp repl  
                                   1752 
      008B0D 6E 6F 74 20 61 20 63  1753 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1754 
                                   1755 ;----------------------------
                                   1756 ; display farptr address
                                   1757 ;----------------------------
      008B1C                       1758 print_farptr:
      008B1C C6 00 16         [ 1] 1759 	ld a ,farptr+2 
      008B1F C7 00 0B         [ 1] 1760 	ld acc8,a 
      008B22 CE 00 14         [ 2] 1761 	ldw x,farptr 
      008B25 CF 00 09         [ 2] 1762 	ldw acc24,x 
      008B28 5F               [ 1] 1763 	clrw x 
      008B29 A6 10            [ 1] 1764 	ld a,#16 
      008B2B CD 88 86         [ 4] 1765 	call prti24
      008B2E A6 20            [ 1] 1766 	ld a,#SPACE 
      008B30 CD 82 1E         [ 4] 1767 	call putc 
      008B33 CD 82 1E         [ 4] 1768 	call putc 
      008B36 81               [ 4] 1769 	ret
                                   1770 
                                   1771 ;------------------------------------
                                   1772 ; get byte at address farptr[X]
                                   1773 ; input:
                                   1774 ;	 farptr   address to peek
                                   1775 ;    X		  farptr index 	
                                   1776 ; output:
                                   1777 ;	 A 		  byte from memory  
                                   1778 ;    x		  incremented by 1
                                   1779 ;------------------------------------
      008B37                       1780 fetchc: ; @C
      008B37 92 AF 00 14      [ 5] 1781 	ldf a,([farptr],x)
      008B3B 5C               [ 1] 1782 	incw x
      008B3C 81               [ 4] 1783 	ret
                                   1784 
                                   1785 
                                   1786 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1787 ; expect a number from command line 
                                   1788 ; next argument
                                   1789 ;  input:
                                   1790 ;	  none
                                   1791 ;  output:
                                   1792 ;    acc24   int24_t 
                                   1793 ;------------------------------------
      008B3D                       1794 number::
      008B3D CD 8C 66         [ 4] 1795 	call get_token
      008B40 CD 8E 36         [ 4] 1796 	call atoi24
      008B43 81               [ 4] 1797 	ret
                                   1798 .endif ; DEBUG 
                                   1799 
                                   1800 ;------------------------------------
                                   1801 ; parse quoted string 
                                   1802 ; input:
                                   1803 ;   Y 	pointer to tib 
                                   1804 ;   X   pointer to pad
                                   1805 ; output:
                                   1806 ;	pad   parsed string
                                   1807 ;   TOS  char* to pad  
                                   1808 ;------------------------------------
                           000001  1809 	PREV = 1
                           000002  1810 	CURR =2 
                           000002  1811 	VSIZE=2 
      008B44                       1812 parse_quote: ; { -- addr }
      000AC4                       1813 	_vars VSIZE 
      008B44 52 02            [ 2]    1     sub sp,#VSIZE 
      008B46 4F               [ 1] 1814 	clr a
      008B47 6B 01            [ 1] 1815 1$:	ld (PREV,sp),a 
      008B49 72 5C 00 02      [ 1] 1816 2$:	inc in
      008B4D 91 D6 01         [ 4] 1817 	ld a,([in.w],y)
      008B50 27 24            [ 1] 1818 	jreq 6$
      008B52 6B 02            [ 1] 1819 	ld (CURR,sp),a 
      008B54 A6 5C            [ 1] 1820 	ld a,#'\
      008B56 11 01            [ 1] 1821 	cp a, (PREV,sp)
      008B58 26 0A            [ 1] 1822 	jrne 3$
      008B5A 0F 01            [ 1] 1823 	clr (PREV,sp)
      008B5C 7B 02            [ 1] 1824 	ld a,(CURR,sp)
      008B5E AD 1F            [ 4] 1825 	callr convert_escape
      008B60 F7               [ 1] 1826 	ld (x),a 
      008B61 5C               [ 1] 1827 	incw x 
      008B62 20 E5            [ 2] 1828 	jra 2$
      008B64                       1829 3$:
      008B64 7B 02            [ 1] 1830 	ld a,(CURR,sp)
      008B66 A1 5C            [ 1] 1831 	cp a,#'\'
      008B68 27 DD            [ 1] 1832 	jreq 1$
      008B6A A1 22            [ 1] 1833 	cp a,#'"
      008B6C 27 04            [ 1] 1834 	jreq 5$ 
      008B6E F7               [ 1] 1835 	ld (x),a 
      008B6F 5C               [ 1] 1836 	incw x 
      008B70 20 D7            [ 2] 1837 	jra 2$
      008B72 72 5C 00 02      [ 1] 1838 5$:	inc in 
      008B76 7F               [ 1] 1839 6$: clr (x)
      008B77 AE 17 18         [ 2] 1840 	ldw x,#pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



      000AFA                       1841 	_drop VSIZE
      008B7A 5B 02            [ 2]    1     addw sp,#VSIZE 
      008B7C A6 06            [ 1] 1842 	ld a,#TK_QSTR  
      008B7E 81               [ 4] 1843 	ret 
                                   1844 
                                   1845 ;---------------------------------------
                                   1846 ; called by parse_quote
                                   1847 ; subtitute escaped character 
                                   1848 ; by their ASCII value .
                                   1849 ; input:
                                   1850 ;   A  character following '\'
                                   1851 ; output:
                                   1852 ;   A  substitued char or same if not valid.
                                   1853 ;---------------------------------------
      008B7F                       1854 convert_escape:
      008B7F A1 61            [ 1] 1855 	cp a,#'a'
      008B81 26 03            [ 1] 1856 	jrne 1$
      008B83 A6 07            [ 1] 1857 	ld a,#7
      008B85 81               [ 4] 1858 	ret 
      008B86 A1 62            [ 1] 1859 1$: cp a,#'b'
      008B88 26 03            [ 1] 1860 	jrne 2$
      008B8A A6 08            [ 1] 1861 	ld a,#8
      008B8C 81               [ 4] 1862 	ret 
      008B8D A1 65            [ 1] 1863 2$: cp a,#'e' 
      008B8F 26 03            [ 1] 1864     jrne 3$
      008B91 A6 5C            [ 1] 1865 	ld a,#'\'
      008B93 81               [ 4] 1866 	ret  
      008B94 A1 5C            [ 1] 1867 3$: cp a,#'\'
      008B96 26 03            [ 1] 1868 	jrne 4$
      008B98 A6 5C            [ 1] 1869 	ld a,#'\'
      008B9A 81               [ 4] 1870 	ret 
      008B9B A1 66            [ 1] 1871 4$: cp a,#'f' 
      008B9D 26 03            [ 1] 1872 	jrne 5$ 
      008B9F A6 0C            [ 1] 1873 	ld a,#FF 
      008BA1 81               [ 4] 1874 	ret  
      008BA2 A1 6E            [ 1] 1875 5$: cp a,#'n' 
      008BA4 26 03            [ 1] 1876     jrne 6$ 
      008BA6 A6 0A            [ 1] 1877 	ld a,#0xa 
      008BA8 81               [ 4] 1878 	ret  
      008BA9 A1 72            [ 1] 1879 6$: cp a,#'r' 
      008BAB 26 03            [ 1] 1880 	jrne 7$
      008BAD A6 0D            [ 1] 1881 	ld a,#0xd 
      008BAF 81               [ 4] 1882 	ret  
      008BB0 A1 74            [ 1] 1883 7$: cp a,#'t' 
      008BB2 26 03            [ 1] 1884 	jrne 8$ 
      008BB4 A6 09            [ 1] 1885 	ld a,#9 
      008BB6 81               [ 4] 1886 	ret  
      008BB7 A1 76            [ 1] 1887 8$: cp a,#'v' 
      008BB9 26 02            [ 1] 1888 	jrne 9$  
      008BBB A6 0B            [ 1] 1889 	ld a,#0xb 
      008BBD 81               [ 4] 1890 9$:	ret 
                                   1891 
                                   1892 ;-------------------------
                                   1893 ; integer parser 
                                   1894 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1895 ;   X 		point to pad 
                                   1896 ;   Y 		point to tib 
                                   1897 ;   A 	    first digit|'$' 
                                   1898 ; output:  
                                   1899 ;   pad     number string 
                                   1900 ;   X 		integer 
                                   1901 ;   A 		TK_INTGR
                                   1902 ;   TOS     integer 
                                   1903 ;-------------------------
                           000001  1904 	BASE=1
                           000002  1905 	TCHAR=2 
                           000002  1906 	VSIZE=2 
      008BBE                       1907 parse_integer: ; { -- n }
      008BBE 4B 00            [ 1] 1908 	push #0 ; TCHAR 
      008BC0 A1 24            [ 1] 1909 	cp a,#'$
      008BC2 27 04            [ 1] 1910 	jreq 1$ 
      008BC4 4B 0A            [ 1] 1911 	push #10 ; BASE=10 
      008BC6 20 02            [ 2] 1912 	jra 2$ 
      008BC8 4B 10            [ 1] 1913 1$: push #16  ; BASE=16
      008BCA F7               [ 1] 1914 2$:	ld (x),a 
      008BCB 5C               [ 1] 1915 	incw x 
      008BCC 72 5C 00 02      [ 1] 1916 	inc in 
      008BD0 91 D6 01         [ 4] 1917 	ld a,([in.w],y)
      008BD3 CD 8E 2A         [ 4] 1918 	call to_upper 
      008BD6 6B 02            [ 1] 1919 	ld (TCHAR,sp),a 
      008BD8 CD 8E 21         [ 4] 1920 	call is_digit 
      008BDB 25 ED            [ 1] 1921 	jrc 2$
      008BDD A6 10            [ 1] 1922 	ld a,#16 
      008BDF 11 01            [ 1] 1923 	cp a,(BASE,sp)
      008BE1 26 0A            [ 1] 1924 	jrne 3$ 
      008BE3 7B 02            [ 1] 1925 	ld a,(TCHAR,sp)
      008BE5 A1 41            [ 1] 1926 	cp a,#'A 
      008BE7 2B 04            [ 1] 1927 	jrmi 3$ 
      008BE9 A1 47            [ 1] 1928 	cp a,#'G 
      008BEB 2B DD            [ 1] 1929 	jrmi 2$ 
      008BED 7F               [ 1] 1930 3$:	clr (x)
      008BEE CD 8E 36         [ 4] 1931 	call atoi24
      008BF1 CE 00 0A         [ 2] 1932 	ldw x,acc16 
      008BF4 A6 0A            [ 1] 1933 	ld a,#TK_INTGR
      000B76                       1934 	_drop VSIZE  
      008BF6 5B 02            [ 2]    1     addw sp,#VSIZE 
      008BF8 81               [ 4] 1935 	ret 	
                                   1936 
                                   1937 ;-------------------------
                                   1938 ; binary integer parser 
                                   1939 ; input:
                                   1940 ;   X 		point to pad 
                                   1941 ;   Y 		point to tib 
                                   1942 ;   A 	    '%' 
                                   1943 ; output:  
                                   1944 ;   pad     number string 
                                   1945 ;   X 		integer 
                                   1946 ;   A 		TK_INTGR
                                   1947 ;   TOS     integer 
                                   1948 ;-------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



                           000001  1949 	BINARY=1
                           000002  1950 	VSIZE=2
      008BF9                       1951 parse_binary: ; { -- n }
      008BF9 4B 00            [ 1] 1952 	push #0
      008BFB 4B 00            [ 1] 1953 	push #0
      008BFD F7               [ 1] 1954 1$: ld (x),a 
      008BFE 5C               [ 1] 1955 	incw x 
      008BFF 72 5C 00 02      [ 1] 1956 	inc in 
      008C03 91 D6 01         [ 4] 1957 	ld a,([in.w],y)
      008C06 A1 30            [ 1] 1958 	cp a,#'0 
      008C08 27 06            [ 1] 1959 	jreq 2$
      008C0A A1 31            [ 1] 1960 	cp a,#'1 
      008C0C 27 02            [ 1] 1961 	jreq 2$ 
      008C0E 20 09            [ 2] 1962 	jra bin_exit 
      008C10 A0 30            [ 1] 1963 2$: sub a,#'0	
      008C12 46               [ 1] 1964 	rrc a 
      008C13 09 02            [ 1] 1965 	rlc (BINARY+1,sp)
      008C15 09 01            [ 1] 1966 	rlc (BINARY,sp)
      008C17 20 E4            [ 2] 1967 	jra 1$  
      008C19                       1968 bin_exit:
      008C19 7F               [ 1] 1969 	clr (x)
      008C1A 1E 01            [ 2] 1970 	ldw x,(BINARY,sp)
      008C1C A6 0A            [ 1] 1971 	ld a,#TK_INTGR 	
      000B9E                       1972 	_drop VSIZE 
      008C1E 5B 02            [ 2]    1     addw sp,#VSIZE 
      008C20 81               [ 4] 1973 	ret
                                   1974 
                                   1975 ;---------------------------
                                   1976 ;  token begin with a letter,
                                   1977 ;  is keyword or variable. 	
                                   1978 ; input:
                                   1979 ;   X 		point to pad 
                                   1980 ;   Y 		point to text
                                   1981 ;   A 	    first letter  
                                   1982 ; output:
                                   1983 ;   X		exec_addr|var_addr 
                                   1984 ;   A 		TK_CMD 
                                   1985 ;   pad 	keyword|var_name  
                                   1986 ;   TOS     exec_addr|var_addr 
                                   1987 ;--------------------------  
      008C21                       1988 parse_keyword: ; { -- exec_addr|var_addr}
      008C21 CD 8E 2A         [ 4] 1989 	call to_upper 
      008C24 F7               [ 1] 1990 	ld (x),a 
      008C25 5C               [ 1] 1991 	incw x 
      008C26 72 5C 00 02      [ 1] 1992 	inc in 
      008C2A 91 D6 01         [ 4] 1993 	ld a,([in.w],y)
      008C2D CD 84 77         [ 4] 1994 	call is_alpha 
      008C30 25 EF            [ 1] 1995 	jrc parse_keyword 
      008C32 7F               [ 1] 1996 1$: clr (x)
      008C33 72 5D 17 19      [ 1] 1997 	tnz pad+1 
      008C37 26 15            [ 1] 1998 	jrne 2$
                                   1999 ; one letter variable name 
      008C39 C6 17 18         [ 1] 2000 	ld a,pad 
      008C3C A0 41            [ 1] 2001 	sub a,#'A 
      008C3E 48               [ 1] 2002 	sll a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008C3F 88               [ 1] 2003 	push a 
      008C40 4B 00            [ 1] 2004 	push #0
      008C42 AE 00 27         [ 2] 2005 	ldw x,#vars 
      008C45 72 FB 01         [ 2] 2006 	addw x,(1,sp) ; X=var address 
      000BC8                       2007 	_drop 2 
      008C48 5B 02            [ 2]    1     addw sp,#2 
      008C4A A6 02            [ 1] 2008 	ld a,#TK_VAR 
      008C4C 20 17            [ 2] 2009 	jra 4$ 
      008C4E                       2010 2$: ; check for keyword, otherwise syntax error.
      000BCE                       2011 	_ldx_dict kword_dict
      008C4E AE 9E C0         [ 2]    1     ldw x,#kword_dict+2
      008C51 CD 90 95         [ 4] 2012 	call search_dict
      008C54 4D               [ 1] 2013 	tnz a
      008C55 26 03            [ 1] 2014 	jrne 3$ 
      008C57 CC 86 7B         [ 2] 2015 	jp syntax_error
      008C5A A3 94 90         [ 2] 2016 3$: cpw x,#rem  
      008C5D 26 06            [ 1] 2017 	jrne 4$
      008C5F 55 00 03 00 02   [ 1] 2018 	mov in,count 
      008C64 4F               [ 1] 2019 	clr a 
      008C65 81               [ 4] 2020 4$:	ret  	
                                   2021 
                                   2022 
                                   2023 ;------------------------------------
                                   2024 ; Command line tokenizer
                                   2025 ; scan text for next token
                                   2026 ; move token in 'pad'
                                   2027 ; input: 
      008C66                       2028 	none: 
                                   2029 ; use:
                                   2030 ;	Y   pointer to text
                                   2031 ;   X	pointer to pad 
                                   2032 ;   in.w   index in text buffer
                                   2033 ; output:
                                   2034 ;   A       token attribute 
                                   2035 ;   pad 	token as .asciz
                                   2036 ;   X 		token value   
                                   2037 ;------------------------------------
                                   2038 	; use to check special character 
                                   2039 	.macro _case c t  
                                   2040 	ld a,#c 
                                   2041 	cp a,(TCHAR,sp) 
                                   2042 	jrne t
                                   2043 	.endm 
                                   2044 
                           000001  2045 	TCHAR=1
                           000002  2046 	ATTRIB=2 
                           000002  2047 	VSIZE=2
      008C66                       2048 get_token: 
      008C66 CE 00 01         [ 2] 2049 	ldw x,in.w 
      008C69 CF 00 12         [ 2] 2050 	ldw in.w.saved,x 
      008C6C 90 CE 00 04      [ 2] 2051 	ldw y,basicptr   	
      008C70 C6 00 02         [ 1] 2052 	ld a,in 
      008C73 C1 00 03         [ 1] 2053 	cp a,count 
      008C76 2B 03            [ 1] 2054 	jrmi 1$
      008C78 A6 00            [ 1] 2055 	ld a,#TK_NONE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008C7A 81               [ 4] 2056 	ret 
      008C7B                       2057 1$:	
      000BFB                       2058 	_vars VSIZE
      008C7B 52 02            [ 2]    1     sub sp,#VSIZE 
      008C7D AE 17 18         [ 2] 2059 	ldw x, #pad
      008C80 A6 20            [ 1] 2060 	ld a,#SPACE
      008C82 CD 8E E2         [ 4] 2061 	call skip
      008C85 91 D6 01         [ 4] 2062 	ld a,([in.w],y)
      008C88 26 07            [ 1] 2063 	jrne str_tst
      008C8A 72 5F 17 18      [ 1] 2064 	clr pad 
      008C8E CC 8E 1E         [ 2] 2065 	jp token_exit ; end of line 
                                   2066 
      008C91                       2067 str_tst: ; check for quoted string  	
      008C91 CD 8E 2A         [ 4] 2068 	call to_upper 
      008C94 6B 01            [ 1] 2069 	ld (TCHAR,sp),a 
      000C16                       2070 	_case '"' nbr_tst
      008C96 A6 22            [ 1]    1 	ld a,#'"' 
      008C98 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008C9A 26 06            [ 1]    3 	jrne nbr_tst
      008C9C CD 8B 44         [ 4] 2071 	call parse_quote
      008C9F CC 8E 1E         [ 2] 2072 	jp token_exit
      008CA2                       2073 nbr_tst: ; check for number 
      008CA2 A6 24            [ 1] 2074 	ld a,#'$'
      008CA4 11 01            [ 1] 2075 	cp a,(TCHAR,sp) 
      008CA6 27 13            [ 1] 2076 	jreq 1$
      008CA8 A6 26            [ 1] 2077 	ld a,#'&
      008CAA 11 01            [ 1] 2078 	cp a,(TCHAR,sp)
      008CAC 26 06            [ 1] 2079 	jrne 0$
      008CAE CD 8B F9         [ 4] 2080 	call parse_binary ; expect binary integer 
      008CB1 CC 8E 1E         [ 2] 2081 	jp token_exit 
      008CB4 7B 01            [ 1] 2082 0$:	ld a,(TCHAR,sp)
      008CB6 CD 8E 21         [ 4] 2083 	call is_digit
      008CB9 24 06            [ 1] 2084 	jrnc 3$
      008CBB CD 8B BE         [ 4] 2085 1$:	call parse_integer 
      008CBE CC 8E 1E         [ 2] 2086 	jp token_exit 
      008CC1                       2087 3$: 
      000C41                       2088 	_case '(' bkslsh_tst 
      008CC1 A6 28            [ 1]    1 	ld a,#'(' 
      008CC3 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CC5 26 05            [ 1]    3 	jrne bkslsh_tst
      008CC7 A6 04            [ 1] 2089 	ld a,#TK_LPAREN
      008CC9 CC 8E 0E         [ 2] 2090 	jp token_char   	
      008CCC                       2091 bkslsh_tst:
      000C4C                       2092 	_case '\',rparnt_tst
      008CCC A6 5C            [ 1]    1 	ld a,#'\' 
      008CCE 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CD0 26 18            [ 1]    3 	jrne rparnt_tst
      008CD2 7B 01            [ 1] 2093 	ld a,(TCHAR,sp)
      008CD4 F7               [ 1] 2094 	ld (x),a 
      008CD5 5C               [ 1] 2095 	incw x 
      008CD6 72 5C 00 02      [ 1] 2096 	inc in 
      008CDA 91 D6 01         [ 4] 2097 	ld a,([in.w],y)
      008CDD F7               [ 1] 2098 	ld (x),a 
      008CDE 5C               [ 1] 2099 	incw x 
      008CDF 72 5C 00 02      [ 1] 2100 	inc in  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      008CE3 7F               [ 1] 2101 	clr (x) 
      008CE4 97               [ 1] 2102 	ld xl,a 
      008CE5 A6 0B            [ 1] 2103 	ld a,#TK_CHAR 
      008CE7 CC 8E 1E         [ 2] 2104 	jp token_exit 
      008CEA                       2105 rparnt_tst:		
      000C6A                       2106 	_case ')' colon_tst 
      008CEA A6 29            [ 1]    1 	ld a,#')' 
      008CEC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CEE 26 05            [ 1]    3 	jrne colon_tst
      008CF0 A6 05            [ 1] 2107 	ld a,#TK_RPAREN 
      008CF2 CC 8E 0E         [ 2] 2108 	jp token_char 
      008CF5                       2109 colon_tst:
      000C75                       2110 	_case ':' comma_tst 
      008CF5 A6 3A            [ 1]    1 	ld a,#':' 
      008CF7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008CF9 26 05            [ 1]    3 	jrne comma_tst
      008CFB A6 01            [ 1] 2111 	ld a,#TK_COLON 
      008CFD CC 8E 0E         [ 2] 2112 	jp token_char 
      008D00                       2113 comma_tst:
      000C80                       2114 	_case COMMA sharp_tst 
      008D00 A6 2C            [ 1]    1 	ld a,#COMMA 
      008D02 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D04 26 05            [ 1]    3 	jrne sharp_tst
      008D06 A6 08            [ 1] 2115 	ld a,#TK_COMMA
      008D08 CC 8E 0E         [ 2] 2116 	jp token_char
      008D0B                       2117 sharp_tst:
      000C8B                       2118 	_case SHARP dash_tst 
      008D0B A6 23            [ 1]    1 	ld a,#SHARP 
      008D0D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D0F 26 05            [ 1]    3 	jrne dash_tst
      008D11 A6 09            [ 1] 2119 	ld a,#TK_SHARP
      008D13 CC 8E 0E         [ 2] 2120 	jp token_char  	 	 
      008D16                       2121 dash_tst: 	
      000C96                       2122 	_case '-' at_tst 
      008D16 A6 2D            [ 1]    1 	ld a,#'-' 
      008D18 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D1A 26 05            [ 1]    3 	jrne at_tst
      008D1C A6 11            [ 1] 2123 	ld a,#TK_MINUS  
      008D1E CC 8E 0E         [ 2] 2124 	jp token_char 
      008D21                       2125 at_tst:
      000CA1                       2126 	_case '@' qmark_tst 
      008D21 A6 40            [ 1]    1 	ld a,#'@' 
      008D23 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D25 26 05            [ 1]    3 	jrne qmark_tst
      008D27 A6 03            [ 1] 2127 	ld a,#TK_ARRAY 
      008D29 CC 8E 0E         [ 2] 2128 	jp token_char
      008D2C                       2129 qmark_tst:
      000CAC                       2130 	_case '?' tick_tst 
      008D2C A6 3F            [ 1]    1 	ld a,#'?' 
      008D2E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D30 26 11            [ 1]    3 	jrne tick_tst
      008D32 7B 01            [ 1] 2131 	ld a,(TCHAR,sp)
      008D34 F7               [ 1] 2132 	ld (x),a 
      008D35 5C               [ 1] 2133 	incw x 
      008D36 7F               [ 1] 2134 	clr (x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      008D37 72 5C 00 02      [ 1] 2135 	inc in 
      008D3B A6 07            [ 1] 2136 	ld a,#TK_CMD 
      008D3D AE 93 8B         [ 2] 2137 	ldw x,#print 
      008D40 CC 8E 1E         [ 2] 2138 	jp token_exit
      008D43                       2139 tick_tst: ; ignore comment 
      000CC3                       2140 	_case TICK plus_tst 
      008D43 A6 27            [ 1]    1 	ld a,#TICK 
      008D45 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D47 26 0E            [ 1]    3 	jrne plus_tst
      008D49 7B 01            [ 1] 2141 	ld a,(TCHAR,sp)
      008D4B F7               [ 1] 2142 	ld (x),a 
      008D4C 5C               [ 1] 2143 	incw x 
      008D4D 7F               [ 1] 2144 	clr (x)
      008D4E 55 00 03 00 02   [ 1] 2145 	mov in,count  
      008D53 4F               [ 1] 2146 	clr a 
      008D54 CC 8E 1E         [ 2] 2147 	jp token_exit 
      008D57                       2148 plus_tst:
      000CD7                       2149 	_case '+' star_tst 
      008D57 A6 2B            [ 1]    1 	ld a,#'+' 
      008D59 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D5B 26 05            [ 1]    3 	jrne star_tst
      008D5D A6 10            [ 1] 2150 	ld a,#TK_PLUS  
      008D5F CC 8E 0E         [ 2] 2151 	jp token_char 
      008D62                       2152 star_tst:
      000CE2                       2153 	_case '*' slash_tst 
      008D62 A6 2A            [ 1]    1 	ld a,#'*' 
      008D64 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D66 26 05            [ 1]    3 	jrne slash_tst
      008D68 A6 20            [ 1] 2154 	ld a,#TK_MULT 
      008D6A CC 8E 0E         [ 2] 2155 	jp token_char 
      008D6D                       2156 slash_tst: 
      000CED                       2157 	_case '/' prcnt_tst 
      008D6D A6 2F            [ 1]    1 	ld a,#'/' 
      008D6F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D71 26 05            [ 1]    3 	jrne prcnt_tst
      008D73 A6 21            [ 1] 2158 	ld a,#TK_DIV 
      008D75 CC 8E 0E         [ 2] 2159 	jp token_char 
      008D78                       2160 prcnt_tst:
      000CF8                       2161 	_case '%' eql_tst 
      008D78 A6 25            [ 1]    1 	ld a,#'%' 
      008D7A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D7C 26 05            [ 1]    3 	jrne eql_tst
      008D7E A6 22            [ 1] 2162 	ld a,#TK_MOD
      008D80 CC 8E 0E         [ 2] 2163 	jp token_char  
                                   2164 ; 1 or 2 character tokens 	
      008D83                       2165 eql_tst:
      000D03                       2166 	_case '=' gt_tst 		
      008D83 A6 3D            [ 1]    1 	ld a,#'=' 
      008D85 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D87 26 05            [ 1]    3 	jrne gt_tst
      008D89 A6 32            [ 1] 2167 	ld a,#TK_EQUAL
      008D8B CC 8E 0E         [ 2] 2168 	jp token_char 
      008D8E                       2169 gt_tst:
      000D0E                       2170 	_case '>' lt_tst 
      008D8E A6 3E            [ 1]    1 	ld a,#'>' 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008D90 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D92 26 33            [ 1]    3 	jrne lt_tst
      008D94 A6 31            [ 1] 2171 	ld a,#TK_GT 
      008D96 6B 02            [ 1] 2172 	ld (ATTRIB,sp),a 
      008D98 72 5C 00 02      [ 1] 2173 	inc in 
      008D9C 91 D6 01         [ 4] 2174 	ld a,([in.w],y)
      008D9F A1 3D            [ 1] 2175 	cp a,#'=
      008DA1 26 0C            [ 1] 2176 	jrne 1$
      008DA3 7B 01            [ 1] 2177 	ld a,(TCHAR,sp)
      008DA5 F7               [ 1] 2178 	ld (x),a
      008DA6 5C               [ 1] 2179 	incw x 
      008DA7 A6 3D            [ 1] 2180 	ld a,#'=
      008DA9 6B 01            [ 1] 2181 	ld (TCHAR,sp),a 
      008DAB A6 33            [ 1] 2182 	ld a,#TK_GE 
      008DAD 20 5F            [ 2] 2183 	jra token_char  
      008DAF A1 3C            [ 1] 2184 1$: cp a,#'<
      008DB1 26 0C            [ 1] 2185 	jrne 2$
      008DB3 7B 01            [ 1] 2186 	ld a,(TCHAR,sp)
      008DB5 F7               [ 1] 2187 	ld (x),a
      008DB6 5C               [ 1] 2188 	incw x 
      008DB7 A6 3C            [ 1] 2189 	ld a,#'<	
      008DB9 6B 01            [ 1] 2190 	ld (TCHAR,sp),a 
      008DBB A6 35            [ 1] 2191 	ld a,#TK_NE 
      008DBD 20 4F            [ 2] 2192 	jra token_char 
      008DBF 72 5A 00 02      [ 1] 2193 2$: dec in
      008DC3 7B 02            [ 1] 2194 	ld a,(ATTRIB,sp)
      008DC5 20 47            [ 2] 2195 	jra token_char 
      008DC7                       2196 lt_tst:
      000D47                       2197 	_case '<' other
      008DC7 A6 3C            [ 1]    1 	ld a,#'<' 
      008DC9 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DCB 26 32            [ 1]    3 	jrne other
      008DCD A6 34            [ 1] 2198 	ld a,#TK_LT 
      008DCF 6B 02            [ 1] 2199 	ld (ATTRIB,sp),a 
      008DD1 72 5C 00 02      [ 1] 2200 	inc in 
      008DD5 91 D6 01         [ 4] 2201 	ld a,([in.w],y)
      008DD8 A1 3D            [ 1] 2202 	cp a,#'=
      008DDA 26 0B            [ 1] 2203 	jrne 1$
      008DDC 7B 01            [ 1] 2204 	ld a,(TCHAR,sp)
      008DDE F7               [ 1] 2205 	ld (x),a 
      008DDF A6 3D            [ 1] 2206 	ld a,#'=
      008DE1 6B 01            [ 1] 2207 	ld (TCHAR,sp),a 
      008DE3 A6 36            [ 1] 2208 	ld a,#TK_LE 
      008DE5 20 27            [ 2] 2209 	jra token_char 
      008DE7 A1 3E            [ 1] 2210 1$: cp a,#'>
      008DE9 26 0C            [ 1] 2211 	jrne 2$
      008DEB 7B 01            [ 1] 2212 	ld a,(TCHAR,sp)
      008DED F7               [ 1] 2213 	ld (x),a 
      008DEE 5C               [ 1] 2214 	incw x 
      008DEF A6 3E            [ 1] 2215 	ld a,#'>
      008DF1 6B 01            [ 1] 2216 	ld (TCHAR,sp),a 
      008DF3 A6 35            [ 1] 2217 	ld a,#TK_NE 
      008DF5 20 17            [ 2] 2218 	jra token_char 
      008DF7 72 5A 00 02      [ 1] 2219 2$: dec in 
      008DFB 7B 02            [ 1] 2220 	ld a,(ATTRIB,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008DFD 20 0F            [ 2] 2221 	jra token_char 	
      008DFF                       2222 other: ; not a special character 	 
      008DFF 7B 01            [ 1] 2223 	ld a,(TCHAR,sp)
      008E01 CD 84 77         [ 4] 2224 	call is_alpha 
      008E04 25 03            [ 1] 2225 	jrc 30$ 
      008E06 CC 86 7B         [ 2] 2226 	jp syntax_error 
      008E09                       2227 30$: 
      008E09 CD 8C 21         [ 4] 2228 	call parse_keyword
      008E0C 20 10            [ 2] 2229 	jra token_exit 
      008E0E                       2230 token_char:
      008E0E 6B 02            [ 1] 2231 	ld (ATTRIB,sp),a 
      008E10 7B 01            [ 1] 2232 	ld a,(TCHAR,sp)
      008E12 F7               [ 1] 2233 	ld (x),a 
      008E13 5C               [ 1] 2234 	incw x 
      008E14 7F               [ 1] 2235 	clr(x)
      008E15 72 5C 00 02      [ 1] 2236 	inc in 
      008E19 7B 02            [ 1] 2237 	ld a,(ATTRIB,sp)
      008E1B AE 17 18         [ 2] 2238 	ldw x,#pad 
      008E1E                       2239 token_exit:
      000D9E                       2240 	_drop VSIZE 
      008E1E 5B 02            [ 2]    1     addw sp,#VSIZE 
      008E20 81               [ 4] 2241 	ret
                                   2242 
                                   2243 
                                   2244 
                                   2245 ;------------------------------------
                                   2246 ; check if character in {'0'..'9'}
                                   2247 ; input:
                                   2248 ;    A  character to test
                                   2249 ; output:
                                   2250 ;    Carry  0 not digit | 1 digit
                                   2251 ;------------------------------------
      008E21                       2252 is_digit:
      008E21 A1 30            [ 1] 2253 	cp a,#'0
      008E23 25 03            [ 1] 2254 	jrc 1$
      008E25 A1 3A            [ 1] 2255     cp a,#'9+1
      008E27 8C               [ 1] 2256 	ccf 
      008E28 8C               [ 1] 2257 1$:	ccf 
      008E29 81               [ 4] 2258     ret
                                   2259 
                                   2260 ;------------------------------------
                                   2261 ; convert alpha to uppercase
                                   2262 ; input:
                                   2263 ;    a  character to convert
                                   2264 ; output:
                                   2265 ;    a  uppercase character
                                   2266 ;------------------------------------
      008E2A                       2267 to_upper::
      008E2A A1 61            [ 1] 2268 	cp a,#'a
      008E2C 2A 01            [ 1] 2269 	jrpl 1$
      008E2E 81               [ 4] 2270 0$:	ret
      008E2F A1 7A            [ 1] 2271 1$: cp a,#'z	
      008E31 22 FB            [ 1] 2272 	jrugt 0$
      008E33 A0 20            [ 1] 2273 	sub a,#32
      008E35 81               [ 4] 2274 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2275 	
                                   2276 ;------------------------------------
                                   2277 ; convert pad content in integer
                                   2278 ; input:
                                   2279 ;    pad		.asciz to convert
                                   2280 ; output:
                                   2281 ;    acc24      int24_t
                                   2282 ;------------------------------------
                                   2283 	; local variables
                           000001  2284 	SIGN=1 ; 1 byte, 
                           000002  2285 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2286 	TEMP=3 ; 1 byte, temporary storage
                           000003  2287 	VSIZE=3 ; 3 bytes reserved for local storage
      008E36                       2288 atoi24:
      008E36 89               [ 2] 2289 	pushw x ;save x
      008E37 52 03            [ 2] 2290 	sub sp,#VSIZE
                                   2291 	; acc24=0 
      008E39 72 5F 00 09      [ 1] 2292 	clr acc24    
      008E3D 72 5F 00 0A      [ 1] 2293 	clr acc16
      008E41 72 5F 00 0B      [ 1] 2294 	clr acc8 
      008E45 C6 17 18         [ 1] 2295 	ld a, pad 
      008E48 27 5A            [ 1] 2296 	jreq atoi_exit
      008E4A 0F 01            [ 1] 2297 	clr (SIGN,sp)
      008E4C A6 0A            [ 1] 2298 	ld a,#10
      008E4E 6B 02            [ 1] 2299 	ld (BASE,sp),a ; default base decimal
      008E50 AE 17 18         [ 2] 2300 	ldw x,#pad ; pointer to string to convert
      008E53 F6               [ 1] 2301 	ld a,(x)
      008E54 27 47            [ 1] 2302 	jreq 9$  ; completed if 0
      008E56 A1 2D            [ 1] 2303 	cp a,#'-
      008E58 26 04            [ 1] 2304 	jrne 1$
      008E5A 03 01            [ 1] 2305 	cpl (SIGN,sp)
      008E5C 20 08            [ 2] 2306 	jra 2$
      008E5E A1 24            [ 1] 2307 1$: cp a,#'$
      008E60 26 06            [ 1] 2308 	jrne 3$
      008E62 A6 10            [ 1] 2309 	ld a,#16
      008E64 6B 02            [ 1] 2310 	ld (BASE,sp),a
      008E66 5C               [ 1] 2311 2$:	incw x
      008E67 F6               [ 1] 2312 	ld a,(x)
      008E68                       2313 3$:	
      008E68 A1 61            [ 1] 2314 	cp a,#'a
      008E6A 2B 02            [ 1] 2315 	jrmi 4$
      008E6C A0 20            [ 1] 2316 	sub a,#32
      008E6E A1 30            [ 1] 2317 4$:	cp a,#'0
      008E70 2B 2B            [ 1] 2318 	jrmi 9$
      008E72 A0 30            [ 1] 2319 	sub a,#'0
      008E74 A1 0A            [ 1] 2320 	cp a,#10
      008E76 2B 06            [ 1] 2321 	jrmi 5$
      008E78 A0 07            [ 1] 2322 	sub a,#7
      008E7A 11 02            [ 1] 2323 	cp a,(BASE,sp)
      008E7C 2A 1F            [ 1] 2324 	jrpl 9$
      008E7E 6B 03            [ 1] 2325 5$:	ld (TEMP,sp),a
      008E80 7B 02            [ 1] 2326 	ld a,(BASE,sp)
      008E82 CD 8E A8         [ 4] 2327 	call mulu24_8
      008E85 7B 03            [ 1] 2328 	ld a,(TEMP,sp)
      008E87 CB 00 0B         [ 1] 2329 	add a,acc24+2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008E8A C7 00 0B         [ 1] 2330 	ld acc24+2,a
      008E8D 4F               [ 1] 2331 	clr a
      008E8E C9 00 0A         [ 1] 2332 	adc a,acc24+1
      008E91 C7 00 0A         [ 1] 2333 	ld acc24+1,a
      008E94 4F               [ 1] 2334 	clr a
      008E95 C9 00 09         [ 1] 2335 	adc a,acc24
      008E98 C7 00 09         [ 1] 2336 	ld acc24,a
      008E9B 20 C9            [ 2] 2337 	jra 2$
      008E9D 0D 01            [ 1] 2338 9$:	tnz (SIGN,sp)
      008E9F 27 03            [ 1] 2339     jreq atoi_exit
      008EA1 CD 89 99         [ 4] 2340     call neg_acc24
      008EA4                       2341 atoi_exit: 
      008EA4 5B 03            [ 2] 2342 	addw sp,#VSIZE
      008EA6 85               [ 2] 2343 	popw x ; restore x
      008EA7 81               [ 4] 2344 	ret
                                   2345 
                                   2346 ;--------------------------------------
                                   2347 ; unsigned multiply uint24_t by uint8_t
                                   2348 ; use to convert numerical string to uint24_t
                                   2349 ; input:
                                   2350 ;	acc24	uint24_t 
                                   2351 ;   A		uint8_t
                                   2352 ; output:
                                   2353 ;   acc24   A*acc24
                                   2354 ;-------------------------------------
                                   2355 ; local variables offset  on sp
                           000003  2356 	U8   = 3   ; A pushed on stack
                           000002  2357 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2358 	OVFH = 1  ; multiplication overflow high byte
                           000003  2359 	VSIZE = 3
      008EA8                       2360 mulu24_8:
      008EA8 89               [ 2] 2361 	pushw x    ; save X
                                   2362 	; local variables
      008EA9 88               [ 1] 2363 	push a     ; U8
      008EAA 5F               [ 1] 2364 	clrw x     ; initialize overflow to 0
      008EAB 89               [ 2] 2365 	pushw x    ; multiplication overflow
                                   2366 ; multiply low byte.
      008EAC C6 00 0B         [ 1] 2367 	ld a,acc24+2
      008EAF 97               [ 1] 2368 	ld xl,a
      008EB0 7B 03            [ 1] 2369 	ld a,(U8,sp)
      008EB2 42               [ 4] 2370 	mul x,a
      008EB3 9F               [ 1] 2371 	ld a,xl
      008EB4 C7 00 0B         [ 1] 2372 	ld acc24+2,a
      008EB7 9E               [ 1] 2373 	ld a, xh
      008EB8 6B 02            [ 1] 2374 	ld (OVFL,sp),a
                                   2375 ; multipy middle byte
      008EBA C6 00 0A         [ 1] 2376 	ld a,acc24+1
      008EBD 97               [ 1] 2377 	ld xl,a
      008EBE 7B 03            [ 1] 2378 	ld a, (U8,sp)
      008EC0 42               [ 4] 2379 	mul x,a
                                   2380 ; add overflow to this partial product
      008EC1 72 FB 01         [ 2] 2381 	addw x,(OVFH,sp)
      008EC4 9F               [ 1] 2382 	ld a,xl
      008EC5 C7 00 0A         [ 1] 2383 	ld acc24+1,a
      008EC8 4F               [ 1] 2384 	clr a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008EC9 A9 00            [ 1] 2385 	adc a,#0
      008ECB 6B 01            [ 1] 2386 	ld (OVFH,sp),a
      008ECD 9E               [ 1] 2387 	ld a,xh
      008ECE 6B 02            [ 1] 2388 	ld (OVFL,sp),a
                                   2389 ; multiply most signficant byte	
      008ED0 C6 00 09         [ 1] 2390 	ld a, acc24
      008ED3 97               [ 1] 2391 	ld xl, a
      008ED4 7B 03            [ 1] 2392 	ld a, (U8,sp)
      008ED6 42               [ 4] 2393 	mul x,a
      008ED7 72 FB 01         [ 2] 2394 	addw x, (OVFH,sp)
      008EDA 9F               [ 1] 2395 	ld a, xl
      008EDB C7 00 09         [ 1] 2396 	ld acc24,a
      008EDE 5B 03            [ 2] 2397     addw sp,#VSIZE
      008EE0 85               [ 2] 2398 	popw x
      008EE1 81               [ 4] 2399 	ret
                                   2400 
                                   2401 ;------------------------------------
                                   2402 ; skip character c in text starting from 'in'
                                   2403 ; input:
                                   2404 ;	 y 		point to text buffer
                                   2405 ;    a 		character to skip
                                   2406 ; output:  
                                   2407 ;	'in' ajusted to new position
                                   2408 ;------------------------------------
                           000001  2409 	C = 1 ; local var
      008EE2                       2410 skip:
      008EE2 88               [ 1] 2411 	push a
      008EE3 91 D6 01         [ 4] 2412 1$:	ld a,([in.w],y)
      008EE6 27 0A            [ 1] 2413 	jreq 2$
      008EE8 11 01            [ 1] 2414 	cp a,(C,sp)
      008EEA 26 06            [ 1] 2415 	jrne 2$
      008EEC 72 5C 00 02      [ 1] 2416 	inc in
      008EF0 20 F1            [ 2] 2417 	jra 1$
      000E72                       2418 2$: _drop 1 
      008EF2 5B 01            [ 2]    1     addw sp,#1 
      008EF4 81               [ 4] 2419 	ret
                                   2420 	
                                   2421 ;------------------------------
                                   2422 ; restore 'in.w' variable to 
                                   2423 ; its value before last call
                                   2424 ; to get_token.
                                   2425 ;------------------------------
      008EF5                       2426 unget_token:
      008EF5 CE 00 12         [ 2] 2427 	ldw x,in.w.saved
      008EF8 CF 00 01         [ 2] 2428 	ldw in.w,x 
      008EFB 81               [ 4] 2429 	ret 
                                   2430 
                                   2431 
                                   2432 ;******************************
                                   2433 ;  data stack manipulation
                                   2434 ;*****************************
                                   2435 ;----------------------	
                                   2436 ; push X on data stack 
                                   2437 ; input:
                                   2438 ;	X 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



                                   2439 ; output:
                                   2440 ;	none 
                                   2441 ;----------------------	
      008EFC                       2442 dpush:
      000E7C                       2443     _dp_down
      008EFC 72 5A 00 1B      [ 1]    1     dec dstkptr+1 
      008F00 72 5A 00 1B      [ 1]    2     dec dstkptr+1
      008F04 72 CF 00 1A      [ 5] 2444     ldw [dstkptr],x  
      008F08 81               [ 4] 2445 	ret 
                                   2446 
                                   2447 
                                   2448 ;----------------------	
                                   2449 ; pop data stack in X 
                                   2450 ; input:
                                   2451 ;	none
                                   2452 ; output:
                                   2453 ;	X   
                                   2454 ;----------------------	
      008F09                       2455 dpop: 
      008F09 72 CE 00 1A      [ 5] 2456     ldw x, [dstkptr]
      000E8D                       2457 	_dp_up
      008F0D 72 5C 00 1B      [ 1]    1     inc dstkptr+1
      008F11 72 5C 00 1B      [ 1]    2     inc dstkptr+1
      008F15 81               [ 4] 2458 	ret 
                                   2459 
                                   2460 ;-----------------------------
                                   2461 ; swap top 2 elements of dstack
                                   2462 ;  {n1 n2 -- n2 n1 }
                                   2463 ;-----------------------------
      008F16                       2464 dswap:
      008F16 72 CE 00 1A      [ 5] 2465 	ldw x,[dstkptr]
      008F1A 89               [ 2] 2466 	pushw x 
      008F1B AE 00 02         [ 2] 2467 	ldw x,#2 
      008F1E 72 DE 00 1A      [ 5] 2468 	ldw x,([dstkptr],x) 
      008F22 72 CF 00 1A      [ 5] 2469 	ldw [dstkptr],x 
      008F26 AE 00 02         [ 2] 2470 	ldw x,#2
      008F29 90 85            [ 2] 2471 	popw y 
      008F2B 72 DF 00 1A      [ 5] 2472 	ldw ([dstkptr],x),y 
      008F2F 81               [ 4] 2473 	ret
                                   2474 
                                   2475 ;-----------------------------
                                   2476 ; drop TOS 
                                   2477 ;-----------------------------
      008F30                       2478 ddrop: ; { n -- }
      000EB0                       2479 	_dp_up 
      008F30 72 5C 00 1B      [ 1]    1     inc dstkptr+1
      008F34 72 5C 00 1B      [ 1]    2     inc dstkptr+1
      008F38 81               [ 4] 2480 	ret
                                   2481 	
                                   2482 ;-----------------------------
                                   2483 ; duplicate TOS 
                                   2484 ;  dstack: { ix...n -- ix...n n }
                                   2485 ;-----------------------------
      008F39                       2486 ddup:
      008F39 72 CE 00 1A      [ 5] 2487 	ldw x,[dstkptr]
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      000EBD                       2488 	_dp_down
      008F3D 72 5A 00 1B      [ 1]    1     dec dstkptr+1 
      008F41 72 5A 00 1B      [ 1]    2     dec dstkptr+1
      008F45 72 CF 00 1A      [ 5] 2489     ldw [dstkptr],x  
      008F49 81               [ 4] 2490 	ret 
                                   2491 
                                   2492 
                                   2493 ;----------------------------------
                                   2494 ; pick value n from dstack 
                                   2495 ; put it on TOS
                                   2496 ; dstack: {ix,..,p -- ix,...,np }
                                   2497 ;-----------------------------------
      008F4A                       2498 dpick:
      008F4A 72 CE 00 1A      [ 5] 2499 	ldw x,[dstkptr]
      008F4E 58               [ 2] 2500 	sllw x 
      008F4F 72 BB 00 1A      [ 2] 2501 	addw x,dstkptr 
      008F53 FE               [ 2] 2502 	ldw x,(x)
      008F54 72 CF 00 1A      [ 5] 2503 	ldw [dstkptr],x 
      008F58 81               [ 4] 2504 	ret
                                   2505 
                                   2506 ;---------------------------
                                   2507 ;  fetch variable in X 
                                   2508 ;  dstack:{ addr -- value }
                                   2509 ;---------------------------
      008F59                       2510 fetch:
      008F59 72 CE 00 1A      [ 5] 2511 	ldw x,[dstkptr]
      008F5D FE               [ 2] 2512 	ldw x,(x)
      008F5E 72 CF 00 1A      [ 5] 2513 	ldw [dstkptr],x
      008F62 81               [ 4] 2514 	ret 
                                   2515 
                                   2516 ;----------------------------
                                   2517 ; store variable 
                                   2518 ; dstack: {addr value -- }
                                   2519 ;----------------------------
      008F63                       2520 store:
      008F63 CD 8F 09         [ 4] 2521 	call dpop 
      008F66 90 93            [ 1] 2522 	ldw y,x   ; y=value 
      008F68 CD 8F 09         [ 4] 2523 	call dpop 
      008F6B FF               [ 2] 2524 	ldw (x),y 
      008F6C 81               [ 4] 2525 	ret 
                                   2526 
                                   2527 ;---------------------------------
                                   2528 ; drop n elements from data stack 
                                   2529 ; input: 
                                   2530 ;   X 		n 
                                   2531 ; output:
                                   2532 ;   none 
                                   2533 ;-------------------------------------
      008F6D                       2534 ddrop_n:
      008F6D 90 89            [ 2] 2535 	pushw y 
      008F6F 90 CE 00 1A      [ 2] 2536 	ldw y,dstkptr 
      008F73 58               [ 2] 2537 	sllw x 
      008F74 89               [ 2] 2538 	pushw x 
      008F75 72 F9 01         [ 2] 2539 	addw y,(1,sp)
      008F78 90 CF 00 1A      [ 2] 2540 	ldw dstkptr,y 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008F7C 85               [ 2] 2541 	popw x 
      008F7D 90 85            [ 2] 2542 	popw y
      008F7F 81               [ 4] 2543 	ret 
                                   2544 
      008F80 0A 64 73 74 61 63 6B  2545 dstk_prompt: .asciz "\ndstack: " 
             3A 20 00
                                   2546 ;----------------------------
                                   2547 ; print dstack content 
                                   2548 ;---------------------------
                           000001  2549 	XSAVE=1
                           000002  2550 	VSIZE=2
      008F8A                       2551 dots:
      000F0A                       2552 	_vars VSIZE 
      008F8A 52 02            [ 2]    1     sub sp,#VSIZE 
      008F8C AE 8F 80         [ 2] 2553 	ldw x,#dstk_prompt 
      008F8F CD 82 30         [ 4] 2554 	call puts
      008F92 AE 17 7E         [ 2] 2555 	ldw x,#dstack_unf-CELL_SIZE
      008F95 35 0A 00 08      [ 1] 2556 	mov base,#10 
      008F99 C3 00 1A         [ 2] 2557 1$:	cpw x,dstkptr 
      008F9C 25 0D            [ 1] 2558 	jrult 4$ 
      008F9E 1F 01            [ 2] 2559 	ldw (XSAVE,sp),x
      008FA0 FE               [ 2] 2560 	ldw  x,(x)
      008FA1 CD 88 CE         [ 4] 2561 	call print_int 
      008FA4 1E 01            [ 2] 2562 	ldw x,(XSAVE,sp)
      008FA6 1D 00 02         [ 2] 2563 	subw x,#CELL_SIZE 
      008FA9 20 EE            [ 2] 2564 	jra 1$ 
      008FAB A6 0D            [ 1] 2565 4$: ld a,#CR 
      008FAD CD 82 1E         [ 4] 2566 	call putc 
      000F30                       2567 	_drop VSIZE
      008FB0 5B 02            [ 2]    1     addw sp,#VSIZE 
      008FB2 4F               [ 1] 2568 	clr a 
      008FB3 81               [ 4] 2569 	ret
                                   2570 
      008FB4 0A 63 74 61 63 6B 3A  2571 cstk_prompt: .asciz "\nctack: "
             20 00
                                   2572 ;--------------------------------
                                   2573 ; print cstack content
                                   2574 ;--------------------------------
                           000001  2575 	XSAVE=1
                           000002  2576 	VSIZE=2 
      008FBD                       2577 dotr:
      000F3D                       2578 	_vars VSIZE 
      008FBD 52 02            [ 2]    1     sub sp,#VSIZE 
      008FBF AE 8F B4         [ 2] 2579 	ldw x,#cstk_prompt
      008FC2 CD 82 30         [ 4] 2580 	call puts 
      008FC5 96               [ 1] 2581 	ldw x,sp 
      008FC6 1C 00 07         [ 2] 2582 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008FC9 1F 01            [ 2] 2583 	ldw (XSAVE,sp),x  
      008FCB AE 17 FE         [ 2] 2584 	ldw x,#RAM_SIZE-2
      008FCE 35 10 00 08      [ 1] 2585 	mov base,#16
      008FD2                       2586 dotr_loop:
      008FD2 13 01            [ 2] 2587 	cpw x,(XSAVE,sp)
      008FD4 2B 0B            [ 1] 2588 	jrmi 9$
      008FD6 89               [ 2] 2589 	pushw x  
      008FD7 FE               [ 2] 2590 	ldw x,(x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008FD8 CD 88 CE         [ 4] 2591 	call print_int 
      008FDB 85               [ 2] 2592 	popw x  
      008FDC 1D 00 02         [ 2] 2593 	subw x,#CELL_SIZE
      008FDF 20 F1            [ 2] 2594 	jra dotr_loop 
      008FE1 A6 0D            [ 1] 2595 9$:	ld a,#CR 
      008FE3 CD 82 1E         [ 4] 2596 	call putc 
      000F66                       2597 	_drop VSIZE 
      008FE6 5B 02            [ 2]    1     addw sp,#VSIZE 
      008FE8 4F               [ 1] 2598 	clr a 
      008FE9 81               [ 4] 2599 	ret
                                   2600 
                                   2601 
                                   2602 ;--------------------------------
                                   2603 ;  add 2 integers
                                   2604 ;  input:
                                   2605 ;    N1     on cstack 
                                   2606 ;    N2     on cstack 
                                   2607 ;  output:
                                   2608 ;    X 		n2+n1 
                                   2609 ;--------------------------------
                                   2610 	;arugments on cstack 
      008FEA                       2611 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000F6A                       2612 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000F6A                       2613 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000F6A                       2614 add:
      008FEA 1E 05            [ 2] 2615 	ldw x ,(N2,sp)
      008FEC 72 FB 03         [ 2] 2616 	addw x,(N1,sp)
      008FEF 1F 03            [ 2] 2617 	ldw (N1,sp),x 
      008FF1 81               [ 4] 2618 	ret 
                                   2619 
                                   2620 ;--------------------------------
                                   2621 ;  substract 2 ntegers
                                   2622 ;  input:
                                   2623 ;    N1     on cstack 
                                   2624 ;    N2     on cstack 
                                   2625 ;  output:
                                   2626 ;    X 		n2+n1 
                                   2627 ;--------------------------------
      008FF2                       2628 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000F72                       2629 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000F72                       2630 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000F72                       2631 substract:
      008FF2 1E 05            [ 2] 2632 	ldw x,(N2,sp)
      008FF4 72 F0 03         [ 2] 2633 	subw x,(N1,sp)
      008FF7 81               [ 4] 2634 	ret 
                                   2635 
                                   2636 ;-------------------------------------
                                   2637 ; multiply 2 integers
                                   2638 ; product overflow is ignored unless
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2639 ; MATH_OVF assembler flag is set to 1
                                   2640 ; input:
                                   2641 ;  	N1      on cstack
                                   2642 ;   N2 		on cstack 
                                   2643 ; output:
                                   2644 ;	X        N1*N2 
                                   2645 ;-------------------------------------
                                   2646 	;arguments 
      008FF8                       2647 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      000F78                       2648 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      000F78                       2649 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      000F78                       2650 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      000F78                       2651 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2652    ; local variables 
                           000001  2653 	SIGN=1
                           000002  2654 	PROD=2
                           000003  2655 	VSIZE=3
      000F78                       2656 multiply:
      000F78                       2657 	_vars VSIZE 
      008FF8 52 03            [ 2]    1     sub sp,#VSIZE 
      008FFA 0F 01            [ 1] 2658 	clr (SIGN,sp)
      008FFC 1E 06            [ 2] 2659 	ldw x,(N1_HB,sp)
      008FFE 9E               [ 1] 2660 	ld a,xh  
      008FFF A5 80            [ 1] 2661 	bcp a,#0x80 
      009001 27 05            [ 1] 2662 	jreq 2$
      009003 03 01            [ 1] 2663 	cpl (SIGN,sp)
      009005 50               [ 2] 2664 	negw x 
      009006 1F 06            [ 2] 2665 	ldw (N1_HB,sp),x 
      009008 1E 08            [ 2] 2666 2$: ldw x,(N2_HB,sp)
      00900A 9E               [ 1] 2667 	ld a,xh  
      00900B A5 80            [ 1] 2668 	bcp a,#0x80 
      00900D 27 05            [ 1] 2669 	jreq 3$
      00900F 03 01            [ 1] 2670 	cpl (SIGN,sp)
      009011 50               [ 2] 2671 	negw x 
      009012 1F 08            [ 2] 2672 	ldw (N2_HB,sp),x 
                                   2673 ; N1_LB * N2_LB 	
      009014 7B 07            [ 1] 2674 3$:	ld a,(N1_LB,sp)
      009016 97               [ 1] 2675 	ld xl,a 
      009017 7B 09            [ 1] 2676 	ld a,(N2_LB,sp) 
      009019 42               [ 4] 2677 	mul x,a 
                           000000  2678 .if MATH_OVF 	
                                   2679 	ld a,xh 
                                   2680 	bcp a,#0x80 
                                   2681 	jreq 4$ 
                                   2682 	ld a,#ERR_MATH_OVF 
                                   2683 	jp tb_error
                                   2684 .endif 	 
      00901A 1F 02            [ 2] 2685 4$:	ldw (PROD,sp),x
                                   2686 ; N1_LB * N2_HB	 
      00901C 7B 07            [ 1] 2687 	ld a,(N1_LB,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



      00901E 97               [ 1] 2688 	ld xl,a 
      00901F 7B 08            [ 1] 2689 	ld a,(N2_HB,sp)
      009021 42               [ 4] 2690 	mul x,a
      009022 9F               [ 1] 2691 	ld a,xl 
      009023 1B 02            [ 1] 2692 	add a,(PROD,sp)
                           000000  2693 .if MATH_OVF 	
                                   2694 	bcp a,#0x80 
                                   2695 	jreq 5$ 
                                   2696 	ld a,#ERR_MATH_OVF 
                                   2697 	jp tb_error
                                   2698 .endif 	 
      009025 6B 02            [ 1] 2699 5$:	ld (PROD,sp),a 
                                   2700 ; N1_HB * N2_LB 
      009027 7B 06            [ 1] 2701 	ld a,(N1_HB,sp)
      009029 97               [ 1] 2702 	ld xl,a 
      00902A 7B 09            [ 1] 2703 	ld a,(N2_LB,sp)
      00902C 42               [ 4] 2704 	mul x,a 
      00902D 9F               [ 1] 2705 	ld a,xl 
      00902E 1B 02            [ 1] 2706 	add a,(PROD,sp)
                           000000  2707 .if MATH_OVF 	
                                   2708 	bcp a,#0x80 
                                   2709 	jreq 6$ 
                                   2710 	ld a,#ERR_MATH_OVF 
                                   2711 	jp tb_error
                                   2712 .endif 	 
      009030 6B 02            [ 1] 2713 6$:	ld (PROD,sp),a 
                                   2714 ; N1_HB * N2_HB 	
                                   2715 ; it is pointless to multiply N1_HB*N2_HB 
                                   2716 ; as this product is over 65535 or 0 
                                   2717 ;
                                   2718 ; sign adjust product
      009032 0D 01            [ 1] 2719 	tnz (SIGN,sp)
      009034 27 05            [ 1] 2720 	jreq 7$
      009036 1E 02            [ 2] 2721 	ldw x, (PROD,sp)
      009038 50               [ 2] 2722 	negw x
      009039 1F 02            [ 2] 2723 	ldw (PROD,sp),x  
      00903B                       2724 7$: 
      00903B 1E 02            [ 2] 2725 	ldw x,(PROD,sp) 
      000FBD                       2726 	_drop VSIZE 
      00903D 5B 03            [ 2]    1     addw sp,#VSIZE 
      00903F 81               [ 4] 2727 	ret
                                   2728 
                                   2729 ;----------------------------------
                                   2730 ;  euclidian divide n2/n1 
                                   2731 ; input:
                                   2732 ;    N2 	on cstack
                                   2733 ;    N1 	on cstack
                                   2734 ; output:
                                   2735 ;    X      n2/n1 
                                   2736 ;    Y      remainder 
                                   2737 ;----------------------------------
      009040                       2738 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      000FC0                       2739 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



      000FC0                       2740 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2741 	; local variables
                           000001  2742 	SQUOT=1 ; sign quotient
                           000002  2743 	SDIVD=2 ; sign dividend  
                           000002  2744 	VSIZE=2
      000FC0                       2745 divide:
      000FC0                       2746 	_vars VSIZE 
      009040 52 02            [ 2]    1     sub sp,#VSIZE 
      009042 0F 01            [ 1] 2747 	clr (SQUOT,sp)
      009044 0F 02            [ 1] 2748 	clr (SDIVD,sp)
                                   2749 ; check for 0 divisor
      009046 1E 05            [ 2] 2750 	ldw x,(DIVISR,sp)
      009048 5D               [ 2] 2751 	tnzw x 
      009049 26 05            [ 1] 2752     jrne 0$
      00904B A6 04            [ 1] 2753 	ld a,#ERR_DIV0 
      00904D CC 86 7D         [ 2] 2754 	jp tb_error 
                                   2755 ; check divisor sign 	
      009050 9E               [ 1] 2756 0$:	ld a,xh 
      009051 A5 80            [ 1] 2757 	bcp a,#0x80 
      009053 27 03            [ 1] 2758 	jreq 1$
      009055 03 01            [ 1] 2759 	cpl (SQUOT,sp)
      009057 50               [ 2] 2760 	negw x 
      009058 1F 05            [ 2] 2761 1$:	ldw (DIVISR,sp),x
                                   2762 ; check dividend sign 	 
      00905A 1E 07            [ 2] 2763     ldw x,(DIVIDND,sp)
      00905C 9E               [ 1] 2764 	ld a,xh 
      00905D A5 80            [ 1] 2765 	bcp a,#0x80 
      00905F 27 05            [ 1] 2766 	jreq 2$ 
      009061 03 01            [ 1] 2767 	cpl (SQUOT,sp)
      009063 03 02            [ 1] 2768 	cpl (SDIVD,sp)
      009065 50               [ 2] 2769 	negw x 
      009066 16 05            [ 2] 2770 2$:	ldw y,(DIVISR,sp)
      009068 65               [ 2] 2771 	divw x,y
      009069 90 CF 00 0A      [ 2] 2772 	ldw acc16,y 
                                   2773 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      00906D 0D 02            [ 1] 2774 	tnz (SDIVD,sp)
      00906F 27 0B            [ 1] 2775 	jreq 7$
      009071 90 5D            [ 2] 2776 	tnzw y 
      009073 27 07            [ 1] 2777 	jreq 7$
      009075 5C               [ 1] 2778 	incw x
      009076 16 05            [ 2] 2779 	ldw y,(DIVISR,sp)
      009078 72 B2 00 0A      [ 2] 2780 	subw y,acc16
      00907C 0D 01            [ 1] 2781 7$: tnz (SQUOT,sp)
      00907E 27 01            [ 1] 2782 	jreq 9$ 	 
      009080 50               [ 2] 2783 8$:	negw x 
      009081                       2784 9$: 
      001001                       2785 	_drop VSIZE 
      009081 5B 02            [ 2]    1     addw sp,#VSIZE 
      009083 81               [ 4] 2786 	ret 
                                   2787 
                                   2788 
                                   2789 ;----------------------------------
                                   2790 ;  remainder resulting from euclidian 
                                   2791 ;  division of n2/n1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2792 ; input:
                                   2793 ;   N1 		cstack 
                                   2794 ;   N2      cstack
                                   2795 ; output:
                                   2796 ;   X       N2%N1 
                                   2797 ;----------------------------------
                           000003  2798 	N1=3
                           000005  2799 	N2=5
                           000004  2800 	VSIZE=4
      009084                       2801 modulo:
      009084 1E 03            [ 2] 2802 	Ldw x,(N1,sp)
      009086 16 05            [ 2] 2803 	ldw y,(N2,sp)
      001008                       2804 	_vars VSIZE 
      009088 52 04            [ 2]    1     sub sp,#VSIZE 
      00908A 1F 01            [ 2] 2805 	ldw (1,sp),x 
      00908C 17 03            [ 2] 2806 	ldw (3,sp),y 
      00908E CD 90 40         [ 4] 2807 	call divide 
      009091 93               [ 1] 2808 	ldw x,y
      001012                       2809 	_drop VSIZE 
      009092 5B 04            [ 2]    1     addw sp,#VSIZE 
      009094 81               [ 4] 2810 	ret 
                                   2811 
                                   2812 ;---------------------------------
                                   2813 ; input:
                                   2814 ;	X 		dictionary entry point 
                                   2815 ;  pad		.asciz name to search 
                                   2816 ; output:
                                   2817 ;  A 		TK_CMD|TK_FUNC|TK_NONE 
                                   2818 ;  X		execution address | 0 
                                   2819 ;---------------------------------
                           000001  2820 	NLEN=1 ; cmd length 
                           000002  2821 	YSAVE=2
                           000003  2822 	VSIZE=3 
      009095                       2823 search_dict:
      001015                       2824 	_vars VSIZE 
      009095 52 03            [ 2]    1     sub sp,#VSIZE 
      009097 90 93            [ 1] 2825 	ldw y,x 
      009099                       2826 search_next:	
      009099 90 F6            [ 1] 2827 	ld a,(y)
      00909B A4 7F            [ 1] 2828 	and a,#0x7f 
      00909D 6B 01            [ 1] 2829 	ld (NLEN,sp),a  
      00909F AE 17 18         [ 2] 2830 	ldw x,#pad 
      0090A2 17 02            [ 2] 2831 	ldw (YSAVE,sp),y
      0090A4 90 5C            [ 1] 2832 	incw y  
      0090A6                       2833 cp_loop:
      0090A6 F6               [ 1] 2834 	ld a,(x)
      0090A7 27 1E            [ 1] 2835 	jreq str_match 
      0090A9 0D 01            [ 1] 2836 	tnz (NLEN,sp)
      0090AB 27 0B            [ 1] 2837 	jreq no_match  
      0090AD 90 F1            [ 1] 2838 	cp a,(y)
      0090AF 26 07            [ 1] 2839 	jrne no_match 
      0090B1 90 5C            [ 1] 2840 	incw y 
      0090B3 5C               [ 1] 2841 	incw x
      0090B4 0A 01            [ 1] 2842 	dec (NLEN,sp)
      0090B6 20 EE            [ 2] 2843 	jra cp_loop 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      0090B8                       2844 no_match:
      0090B8 16 02            [ 2] 2845 	ldw y,(YSAVE,sp) 
      0090BA 72 A2 00 02      [ 2] 2846 	subw y,#2 ; move Y to link field
      0090BE 4B 00            [ 1] 2847 	push #TK_NONE 
      0090C0 90 FE            [ 2] 2848 	ldw y,(y) ; next word link 
      0090C2 84               [ 1] 2849 	pop a ; TK_NONE 
      0090C3 27 24            [ 1] 2850 	jreq search_exit  ; not found  
                                   2851 ;try next 
      0090C5 20 D2            [ 2] 2852 	jra search_next
      0090C7                       2853 str_match:
      0090C7 16 02            [ 2] 2854 	ldw y,(YSAVE,sp)
      0090C9 90 F6            [ 1] 2855 	ld a,(y)
      0090CB 6B 01            [ 1] 2856 	ld (NLEN,sp),a ; needed to test bit 7 
      0090CD A4 7F            [ 1] 2857 	and a,#0x7f 
                                   2858 ; move y to procedure address field 	
      0090CF 4C               [ 1] 2859 	inc a 
      0090D0 C7 00 0B         [ 1] 2860 	ld acc8,a 
      0090D3 72 5F 00 0A      [ 1] 2861 	clr acc16 
      0090D7 72 B9 00 0A      [ 2] 2862 	addw y,acc16 
      0090DB 90 FE            [ 2] 2863 	ldw y,(y) ; routine entry point 
      0090DD 7B 01            [ 1] 2864 	ld a,(NLEN,sp)
      0090DF A5 80            [ 1] 2865 	bcp a,#0x80 
      0090E1 27 04            [ 1] 2866 	jreq 1$
      0090E3 A6 0C            [ 1] 2867 	ld a,#TK_FUNC 
      0090E5 20 02            [ 2] 2868 	jra search_exit
      0090E7 A6 07            [ 1] 2869 1$: ld a,#TK_CMD 
      0090E9                       2870 search_exit: 
      0090E9 93               [ 1] 2871 	ldw x,y ; x=routine address 
      00106A                       2872 	_drop VSIZE 	 
      0090EA 5B 03            [ 2]    1     addw sp,#VSIZE 
      0090EC 81               [ 4] 2873 	ret 
                                   2874 
                                   2875 ;---------------------
                                   2876 ; check if next token
                                   2877 ;  is of expected type 
                                   2878 ; input:
                                   2879 ;   A 		 expected token attribute
                                   2880 ;  ouput:
                                   2881 ;   none     if fail call tb_error 
                                   2882 ;--------------------
      0090ED                       2883 expect:
      0090ED 88               [ 1] 2884 	push a 
      0090EE CD 8C 66         [ 4] 2885 	call get_token 
      0090F1 11 01            [ 1] 2886 	cp a,(1,sp)
      0090F3 27 03            [ 1] 2887 	jreq 1$
      0090F5 CC 86 7B         [ 2] 2888 	jp syntax_error
      0090F8 84               [ 1] 2889 1$: pop a 
      0090F9 81               [ 4] 2890 	ret 
                                   2891 
                                   2892 
                                   2893 ;-------------------------------
                                   2894 ; parse embedded BASIC routines 
                                   2895 ; arguments list.
                                   2896 ; arg_list::=  rel[','rel]*
                                   2897 ; all arguments are of integer type
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                                   2898 ; input:
                                   2899 ;   none
                                   2900 ; output:
                                   2901 ;   A 			number of arguments pushed on dstack  
                                   2902 ;--------------------------------
                           000001  2903 	ARG_CNT=1 
      0090FA                       2904 arg_list:
      0090FA 4B 00            [ 1] 2905 	push #0  
      0090FC CD 92 36         [ 4] 2906 1$: call relation
      0090FF A1 00            [ 1] 2907 	cp a,#TK_NONE 
      009101 27 19            [ 1] 2908 	jreq 5$
      009103 A1 0A            [ 1] 2909 	cp a,#TK_INTGR
      009105 26 12            [ 1] 2910 	jrne 4$
      009107 CD 8E FC         [ 4] 2911 3$: call dpush 
      00910A 0C 01            [ 1] 2912     inc (ARG_CNT,sp)
      00910C CD 8C 66         [ 4] 2913 	call get_token 
      00910F A1 00            [ 1] 2914 	cp a,#TK_NONE 
      009111 27 09            [ 1] 2915 	jreq 5$ 
      009113 A1 08            [ 1] 2916 	cp a,#TK_COMMA 
      009115 26 02            [ 1] 2917 	jrne 4$
      009117 20 E3            [ 2] 2918 	jra 1$ 
      009119 CD 8E F5         [ 4] 2919 4$:	call unget_token 
      00911C 84               [ 1] 2920 5$:	pop a 
      00911D 81               [ 4] 2921 	ret 
                                   2922 
                                   2923 
                                   2924 
                                   2925 ;--------------------------------
                                   2926 ;   BASIC commnands 
                                   2927 ;--------------------------------
                                   2928 
                                   2929 ;--------------------------------
                                   2930 ;  arithmetic and relational 
                                   2931 ;  routines
                                   2932 ;  operators precedence
                                   2933 ;  highest to lowest
                                   2934 ;  operators on same row have 
                                   2935 ;  same precedence and are executed
                                   2936 ;  from left to right.
                                   2937 ;	'*','/','%'
                                   2938 ;   '-','+'
                                   2939 ;   '=','>','<','>=','<=','<>','><'
                                   2940 ;   '<>' and '><' are equivalent for not equal.
                                   2941 ;--------------------------------
                                   2942 
                                   2943 ;---------------------
                                   2944 ; return array element
                                   2945 ; address from @(expr)
                                   2946 ; input:
                                   2947 ;   A 		TK_ARRAY
                                   2948 ; output:
                                   2949 ;   A 		TK_INTGR
                                   2950 ;	X 		element address 
                                   2951 ;----------------------
      00911E                       2952 get_array_element:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      00911E CD 8F 30         [ 4] 2953 	call ddrop 
      009121 A6 04            [ 1] 2954 	ld a,#TK_LPAREN 
      009123 CD 90 ED         [ 4] 2955 	call expect
      009126 CD 92 36         [ 4] 2956 	call relation 
      009129 A1 0A            [ 1] 2957 	cp a,#TK_INTGR 
      00912B 27 03            [ 1] 2958 	jreq 1$
      00912D CC 86 7B         [ 2] 2959 	jp syntax_error
      009130 89               [ 2] 2960 1$: pushw x 
      009131 A6 05            [ 1] 2961 	ld a,#TK_RPAREN 
      009133 CD 90 ED         [ 4] 2962 	call expect
                                   2963 	; check for bounds 
      009136 85               [ 2] 2964 	popw x   
      009137 C3 00 23         [ 2] 2965 	cpw x,array_size 
      00913A 23 05            [ 2] 2966 	jrule 3$
                                   2967 ; bounds {1..array_size}	
      00913C A6 0A            [ 1] 2968 2$: ld a,#ERR_BAD_VALUE 
      00913E CC 86 7D         [ 2] 2969 	jp tb_error 
      009141 5D               [ 2] 2970 3$: tnzw  x
      009142 27 F8            [ 1] 2971 	jreq 2$ 
      009144 58               [ 2] 2972 	sllw x 
      009145 89               [ 2] 2973 	pushw x 
      009146 CE 00 21         [ 2] 2974 	ldw x,array_addr  
      009149 72 F0 01         [ 2] 2975 	subw x,(1,sp)
      0010CC                       2976 	_drop 2   
      00914C 5B 02            [ 2]    1     addw sp,#2 
      00914E A6 0A            [ 1] 2977 	ld a,#TK_INTGR
      009150 81               [ 4] 2978 	ret 
                                   2979 
                                   2980 ;***********************************
                                   2981 ;   expression parse,execute 
                                   2982 ;***********************************
                                   2983 ;-----------------------------------
                                   2984 ; factor ::= ['+'|'-'|e] var | @ |
                                   2985 ;			 integer | function |
                                   2986 ;			 '('relation')' 
                                   2987 ; output:
                                   2988 ;   A    token attribute 
                                   2989 ;   X 	 integer
                                   2990 ; ---------------------------------
                           000001  2991 	NEG=1
                           000001  2992 	VSIZE=1
      009151                       2993 factor:
      0010D1                       2994 	_vars VSIZE 
      009151 52 01            [ 2]    1     sub sp,#VSIZE 
      009153 CD 8C 66         [ 4] 2995 	call get_token
      009156 A1 02            [ 1] 2996 	cp a,#2 
      009158 2B 48            [ 1] 2997 	jrmi 20$
      00915A 6B 01            [ 1] 2998 1$:	ld (NEG,sp),a 
      00915C A4 10            [ 1] 2999 	and a,#TK_GRP_ADD  
      00915E 26 04            [ 1] 3000 	jrne 2$
      009160 7B 01            [ 1] 3001 	ld a,(NEG,sp)
      009162 20 03            [ 2] 3002 	jra 4$  
      009164                       3003 2$:	
      009164 CD 8C 66         [ 4] 3004 	call get_token 
      009167                       3005 4$:	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      009167 A1 0C            [ 1] 3006 	cp a,#TK_FUNC 
      009169 26 03            [ 1] 3007 	jrne 5$ 
      00916B FD               [ 4] 3008 	call (x) 
      00916C 20 2B            [ 2] 3009 	jra 18$ 
      00916E                       3010 5$:
      00916E A1 0A            [ 1] 3011 	cp a,#TK_INTGR
      009170 26 02            [ 1] 3012 	jrne 6$
      009172 20 25            [ 2] 3013 	jra 18$
      009174                       3014 6$:
      009174 A1 03            [ 1] 3015 	cp a,#TK_ARRAY
      009176 26 06            [ 1] 3016 	jrne 10$
      009178 CD 91 1E         [ 4] 3017 	call get_array_element
      00917B FE               [ 2] 3018 	ldw x,(x)
      00917C 20 1B            [ 2] 3019 	jra 18$ 
      00917E                       3020 10$:
      00917E A1 02            [ 1] 3021 	cp a,#TK_VAR 
      009180 26 03            [ 1] 3022 	jrne 12$
      009182 FE               [ 2] 3023 	ldw x,(x)
      009183 20 14            [ 2] 3024 	jra 18$
      009185                       3025 12$:			
      009185 A1 04            [ 1] 3026 	cp a,#TK_LPAREN
      009187 26 0A            [ 1] 3027 	jrne 16$
      009189 CD 92 36         [ 4] 3028 	call relation
      00918C A6 05            [ 1] 3029 	ld a,#TK_RPAREN 
      00918E CD 90 ED         [ 4] 3030 	call expect
      009191 20 06            [ 2] 3031 	jra 18$	
      009193                       3032 16$:
      009193 CD 8E F5         [ 4] 3033 	call unget_token
      009196 4F               [ 1] 3034 	clr a 
      009197 20 09            [ 2] 3035 	jra 20$ 
      009199                       3036 18$: 
      009199 A6 11            [ 1] 3037 	ld a,#TK_MINUS 
      00919B 11 01            [ 1] 3038 	cp a,(NEG,sp)
      00919D 26 01            [ 1] 3039 	jrne 19$
      00919F 50               [ 2] 3040 	negw x
      0091A0                       3041 19$:
      0091A0 A6 0A            [ 1] 3042 	ld a,#TK_INTGR
      0091A2                       3043 20$:
      001122                       3044 	_drop VSIZE
      0091A2 5B 01            [ 2]    1     addw sp,#VSIZE 
      0091A4 81               [ 4] 3045 	ret
                                   3046 
                                   3047 ;-----------------------------------
                                   3048 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3049 ; output:
                                   3050 ;   A    	token attribute 
                                   3051 ;	X		integer
                                   3052 ;-----------------------------------
                           000001  3053 	N1=1
                           000003  3054 	N2=3
                           000005  3055 	MULOP=5
                           000005  3056 	VSIZE=5
      0091A5                       3057 term:
      001125                       3058 	_vars VSIZE
      0091A5 52 05            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      0091A7 CD 91 51         [ 4] 3059 	call factor
      0091AA A1 02            [ 1] 3060 	cp a,#2
      0091AC 2B 41            [ 1] 3061 	jrmi term_exit
      0091AE                       3062 term01:	 ; check for  operator 
      0091AE 1F 03            [ 2] 3063 	ldw (N2,sp),x  ; save first factor 
      0091B0 CD 8C 66         [ 4] 3064 	call get_token
      0091B3 A1 02            [ 1] 3065 	cp a,#2
      0091B5 2B 34            [ 1] 3066 	jrmi 9$
      0091B7 6B 05            [ 1] 3067 0$:	ld (MULOP,sp),a
      0091B9 A4 30            [ 1] 3068 	and a,#TK_GRP_MASK
      0091BB A1 20            [ 1] 3069 	cp a,#TK_GRP_MULT
      0091BD 27 07            [ 1] 3070 	jreq 1$
      0091BF 7B 05            [ 1] 3071 	ld a,(MULOP,sp) 
      0091C1 CD 8E F5         [ 4] 3072 	call unget_token 
      0091C4 20 25            [ 2] 3073 	jra 9$
      0091C6                       3074 1$:	; got *|/|%
      0091C6 CD 91 51         [ 4] 3075 	call factor
      0091C9 A1 0A            [ 1] 3076 	cp a,#TK_INTGR
      0091CB 27 03            [ 1] 3077 	jreq 2$ 
      0091CD CC 86 7B         [ 2] 3078 	jp syntax_error
      0091D0 1F 01            [ 2] 3079 2$:	ldw (N1,sp),x  
      0091D2 7B 05            [ 1] 3080 	ld a,(MULOP,sp) 
      0091D4 A1 20            [ 1] 3081 	cp a,#TK_MULT 
      0091D6 26 05            [ 1] 3082 	jrne 3$
      0091D8 CD 8F F8         [ 4] 3083 	call multiply 
      0091DB 20 D1            [ 2] 3084 	jra term01
      0091DD A1 21            [ 1] 3085 3$: cp a,#TK_DIV 
      0091DF 26 05            [ 1] 3086 	jrne 4$ 
      0091E1 CD 90 40         [ 4] 3087 	call divide 
      0091E4 20 C8            [ 2] 3088 	jra term01 
      0091E6 CD 90 84         [ 4] 3089 4$: call modulo
      0091E9 20 C3            [ 2] 3090 	jra term01 
      0091EB 1E 03            [ 2] 3091 9$: ldw x,(N2,sp)  
      0091ED A6 0A            [ 1] 3092 	ld a,#TK_INTGR 	
      0091EF                       3093 term_exit:
      00116F                       3094 	_drop VSIZE 
      0091EF 5B 05            [ 2]    1     addw sp,#VSIZE 
      0091F1 81               [ 4] 3095 	ret 
                                   3096 
                                   3097 ;-------------------------------
                                   3098 ;  expr ::= term [['+'|'-'] term]*
                                   3099 ;  result range {-32768..32767}
                                   3100 ;  output:
                                   3101 ;   A    token attribute 
                                   3102 ;   X	 integer   
                                   3103 ;-------------------------------
                           000001  3104 	N1=1 
                           000003  3105 	N2=3
                           000005  3106 	OP=5 
                           000005  3107 	VSIZE=5 
      0091F2                       3108 expression:
      001172                       3109 	_vars VSIZE 
      0091F2 52 05            [ 2]    1     sub sp,#VSIZE 
      0091F4 CD 91 A5         [ 4] 3110 	call term
      0091F7 A1 02            [ 1] 3111 	cp a,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      0091F9 2B 38            [ 1] 3112 	jrmi expr_exit 
      0091FB 1F 03            [ 2] 3113 0$:	ldw (N2,sp),x 
      0091FD CD 8C 66         [ 4] 3114 	call get_token
      009200 A1 02            [ 1] 3115 	cp a,#2
      009202 2B 2B            [ 1] 3116 	jrmi 9$ 
      009204 6B 05            [ 1] 3117 1$:	ld (OP,sp),a  
      009206 A4 30            [ 1] 3118 	and a,#TK_GRP_MASK
      009208 A1 10            [ 1] 3119 	cp a,#TK_GRP_ADD 
      00920A 27 07            [ 1] 3120 	jreq 2$ 
      00920C 7B 05            [ 1] 3121 	ld a,(OP,sp)
      00920E CD 8E F5         [ 4] 3122 	call unget_token
      009211 20 1C            [ 2] 3123 	jra 9$
      009213                       3124 2$: 
      009213 CD 91 A5         [ 4] 3125 	call term
      009216 A1 0A            [ 1] 3126 	cp a,#TK_INTGR 
      009218 27 03            [ 1] 3127 	jreq 3$
      00921A CC 86 7B         [ 2] 3128 	jp syntax_error
      00921D 1F 01            [ 2] 3129 3$:	ldw (N1,sp),x 
      00921F 7B 05            [ 1] 3130 	ld a,(OP,sp)
      009221 A1 10            [ 1] 3131 	cp a,#TK_PLUS 
      009223 26 05            [ 1] 3132 	jrne 4$
      009225 CD 8F EA         [ 4] 3133 	call add 
      009228 20 D1            [ 2] 3134 	jra 0$ 
      00922A CD 8F F2         [ 4] 3135 4$:	call substract
      00922D 20 CC            [ 2] 3136 	jra 0$
      00922F 1E 03            [ 2] 3137 9$: ldw x,(N2,sp)
      009231 A6 0A            [ 1] 3138 	ld a,#TK_INTGR	
      009233                       3139 expr_exit:
      0011B3                       3140 	_drop VSIZE 
      009233 5B 05            [ 2]    1     addw sp,#VSIZE 
      009235 81               [ 4] 3141 	ret 
                                   3142 
                                   3143 ;---------------------------------------------
                                   3144 ; rel ::= expr rel_op expr
                                   3145 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3146 ;  relation return 1 | 0  for true | false 
                                   3147 ;  output:
                                   3148 ;    A 		token attribute  
                                   3149 ;	 X		1|0
                                   3150 ;---------------------------------------------
                           000001  3151 	N1=1
                           000003  3152 	N2=3
                           000005  3153 	RELOP=5
                           000005  3154 	VSIZE=5 
      009236                       3155 relation: 
      0011B6                       3156 	_vars VSIZE
      009236 52 05            [ 2]    1     sub sp,#VSIZE 
      009238 CD 91 F2         [ 4] 3157 	call expression
      00923B A1 02            [ 1] 3158 	cp a,#2 
      00923D 2B 4B            [ 1] 3159 	jrmi rel_exit 
                                   3160 	; expect rel_op or leave 
      00923F 1F 03            [ 2] 3161 	ldw (N2,sp),x 
      009241 CD 8C 66         [ 4] 3162 	call get_token 
      009244 A1 02            [ 1] 3163 	cp a,#2
      009246 2B 3E            [ 1] 3164 	jrmi 9$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      009248                       3165 1$:	
      009248 6B 05            [ 1] 3166 	ld (RELOP,sp),a 
      00924A A4 30            [ 1] 3167 	and a,#TK_GRP_MASK
      00924C A1 30            [ 1] 3168 	cp a,#0x30 
      00924E 27 07            [ 1] 3169 	jreq 2$
      009250 7B 05            [ 1] 3170 	ld a,(RELOP,sp)
      009252 CD 8E F5         [ 4] 3171 	call unget_token  
      009255 20 2F            [ 2] 3172 	jra 9$
      009257                       3173 2$:	; expect another expression or error 
      009257 CD 91 F2         [ 4] 3174 	call expression
      00925A A1 0A            [ 1] 3175 	cp a,#TK_INTGR 
      00925C 27 03            [ 1] 3176 	jreq 3$
      00925E CC 86 7B         [ 2] 3177 	jp syntax_error 
      009261 1F 01            [ 2] 3178 3$:	ldw (N1,sp),x 
      009263 CD 8F F2         [ 4] 3179 	call substract
      009266 26 06            [ 1] 3180 	jrne 4$
      009268 35 02 00 0B      [ 1] 3181 	mov acc8,#2 ; n1==n2
      00926C 20 0C            [ 2] 3182 	jra 6$ 
      00926E                       3183 4$: 
      00926E 2C 06            [ 1] 3184 	jrsgt 5$  
      009270 35 04 00 0B      [ 1] 3185 	mov acc8,#4 ; n1<2 
      009274 20 04            [ 2] 3186 	jra 6$
      009276                       3187 5$:
      009276 35 01 00 0B      [ 1] 3188 	mov acc8,#1 ; n1>n2 
      00927A                       3189 6$:
      00927A 5F               [ 1] 3190 	clrw x 
      00927B C6 00 0B         [ 1] 3191 	ld a, acc8  
      00927E 14 05            [ 1] 3192 	and a,(RELOP,sp)
      009280 4D               [ 1] 3193 	tnz a 
      009281 27 05            [ 1] 3194 	jreq 10$
      009283 5C               [ 1] 3195 	incw x 
      009284                       3196 7$:	 
      009284 20 02            [ 2] 3197 	jra 10$  	
      009286 1E 03            [ 2] 3198 9$: ldw x,(N2,sp)
      009288                       3199 10$:
      009288 A6 0A            [ 1] 3200 	ld a,#TK_INTGR
      00928A                       3201 rel_exit: 	 
      00120A                       3202 	_drop VSIZE
      00928A 5B 05            [ 2]    1     addw sp,#VSIZE 
      00928C 81               [ 4] 3203 	ret 
                                   3204 
                                   3205 ;--------------------------------
                                   3206 ; BASIC: SHOW 
                                   3207 ;  show content of dstack,cstack
                                   3208 ;--------------------------------
      00928D                       3209 show:
      00928D C6 00 08         [ 1] 3210 	ld a,base 
      009290 88               [ 1] 3211 	push a 
      009291 CD 8F 8A         [ 4] 3212 	call dots
      009294 CD 8F BD         [ 4] 3213 	call dotr 
      009297 84               [ 1] 3214 	pop a 
      009298 C7 00 08         [ 1] 3215 	ld base,a 
      00929B 4F               [ 1] 3216 	clr a 
      00929C 81               [ 4] 3217 	ret
                                   3218 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3219 ;--------------------------------------------
                                   3220 ; BASIC: HEX 
                                   3221 ; select hexadecimal base for integer print
                                   3222 ;---------------------------------------------
      00929D                       3223 hex_base:
      00929D 35 10 00 08      [ 1] 3224 	mov base,#16 
      0092A1 81               [ 4] 3225 	ret 
                                   3226 
                                   3227 ;--------------------------------------------
                                   3228 ; BASIC: DEC 
                                   3229 ; select decimal base for integer print
                                   3230 ;---------------------------------------------
      0092A2                       3231 dec_base:
      0092A2 35 0A 00 08      [ 1] 3232 	mov base,#10
      0092A6 81               [ 4] 3233 	ret 
                                   3234 
                                   3235 ;------------------------
                                   3236 ; BASIC: SIZE 
                                   3237 ; return free size in text area
                                   3238 ; output:
                                   3239 ;   A 		TK_INTGR
                                   3240 ;   X 	    size integer
                                   3241 ;--------------------------
      0092A7                       3242 size:
      0092A7 AE 16 C8         [ 2] 3243 	ldw x,#tib 
      0092AA 72 B0 00 1E      [ 2] 3244 	subw x,txtend 
      0092AE A6 0A            [ 1] 3245 	ld a,#TK_INTGR
      0092B0 81               [ 4] 3246 	ret 
                                   3247 
                                   3248 
                                   3249 ;------------------------
                                   3250 ; BASIC: UBOUND  
                                   3251 ; return array variable size 
                                   3252 ; output:
                                   3253 ;   A 		TK_INTGR
                                   3254 ;   X 	    array size 
                                   3255 ;--------------------------
      0092B1                       3256 ubound:
      0092B1 AE 16 C8         [ 2] 3257 	ldw x,#tib
      0092B4 72 B0 00 1E      [ 2] 3258 	subw x,txtend 
      0092B8 54               [ 2] 3259 	srlw x 
      0092B9 CF 00 23         [ 2] 3260 	ldw array_size,x
      0092BC A6 0A            [ 1] 3261 	ld a,#TK_INTGR
      0092BE 81               [ 4] 3262 	ret 
                                   3263 
                                   3264 ;-----------------------------
                                   3265 ; BASIC: LET var=expr 
                                   3266 ; variable assignement 
                                   3267 ; output:
                                   3268 ;   A 		TK_NONE 
                                   3269 ;-----------------------------
      0092BF                       3270 let:
      0092BF CD 8C 66         [ 4] 3271 	call get_token 
      0092C2 A1 02            [ 1] 3272 	cp a,#TK_VAR 
      0092C4 27 03            [ 1] 3273 	jreq let02
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      0092C6 CC 86 7B         [ 2] 3274 	jp syntax_error
      0092C9                       3275 let02:
      0092C9 CD 8E FC         [ 4] 3276 	call dpush 
      0092CC CD 8C 66         [ 4] 3277 	call get_token 
      0092CF A1 32            [ 1] 3278 	cp a,#TK_EQUAL
      0092D1 27 03            [ 1] 3279 	jreq 1$
      0092D3 CC 86 7B         [ 2] 3280 	jp syntax_error
      0092D6                       3281 1$:	
      0092D6 CD 92 36         [ 4] 3282 	call relation   
      0092D9 A1 0A            [ 1] 3283 	cp a,#TK_INTGR 
      0092DB 27 03            [ 1] 3284 	jreq 2$
      0092DD CC 86 7B         [ 2] 3285 	jp syntax_error
      0092E0                       3286 2$:	
      0092E0 90 93            [ 1] 3287 	ldw y,x 
      0092E2 CD 8F 09         [ 4] 3288 	call dpop  
      0092E5 FF               [ 2] 3289 	ldw (x),y   
      0092E6 81               [ 4] 3290 	ret 
                                   3291 
                                   3292 ;----------------------------
                                   3293 ; BASIC: LIST [[start][,end]]
                                   3294 ; list program lines 
                                   3295 ; form start to end 
                                   3296 ; if empty argument list then 
                                   3297 ; list all.
                                   3298 ;----------------------------
                           000001  3299 	FIRST=1
                           000003  3300 	LAST=3 
                           000005  3301 	LN_PTR=5
                           000006  3302 	VSIZE=6 
      0092E7                       3303 list:
      001267                       3304 	_vars VSIZE
      0092E7 52 06            [ 2]    1     sub sp,#VSIZE 
      0092E9 CE 00 1C         [ 2] 3305 	ldw x,txtbgn 
      0092EC C3 00 1E         [ 2] 3306 	cpw x,txtend 
      0092EF 2B 03            [ 1] 3307 	jrmi 1$
      0092F1 CC 93 6A         [ 2] 3308 	jp list_exit ; nothing to list 
      0092F4 1F 05            [ 2] 3309 1$:	ldw (LN_PTR,sp),x 
      0092F6 FE               [ 2] 3310 	ldw x,(x) 
      0092F7 1F 01            [ 2] 3311 	ldw (FIRST,sp),x ; list from first line 
      0092F9 AE 7F FF         [ 2] 3312 	ldw x,#0x7fff ; biggest line number 
      0092FC 1F 03            [ 2] 3313 	ldw (LAST,sp),x 
      0092FE CD 90 FA         [ 4] 3314 	call arg_list
      009301 4D               [ 1] 3315 	tnz a
      009302 27 3F            [ 1] 3316 	jreq list_start 
      009304 A1 02            [ 1] 3317 	cp a,#2 
      009306 27 07            [ 1] 3318 	jreq 4$
      009308 A1 01            [ 1] 3319 	cp a,#1 
      00930A 27 06            [ 1] 3320 	jreq first_line 
      00930C CC 86 7B         [ 2] 3321 	jp syntax_error 
      00930F CD 8F 16         [ 4] 3322 4$:	call dswap
      009312                       3323 first_line:
      009312 CD 8F 09         [ 4] 3324 	call dpop 
      009315 1F 01            [ 2] 3325 	ldw (FIRST,sp),x 
      009317 A1 01            [ 1] 3326 	cp a,#1 
      009319 27 05            [ 1] 3327 	jreq lines_skip 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      00931B                       3328 last_line:
      00931B CD 8F 09         [ 4] 3329 	call dpop 
      00931E 1F 03            [ 2] 3330 	ldw (LAST,sp),x 
      009320                       3331 lines_skip:
      009320 CE 00 1C         [ 2] 3332 	ldw x,txtbgn
      009323 1F 05            [ 2] 3333 2$:	ldw (LN_PTR,sp),x 
      009325 C3 00 1E         [ 2] 3334 	cpw x,txtend 
      009328 2A 40            [ 1] 3335 	jrpl list_exit 
      00932A FE               [ 2] 3336 	ldw x,(x) ;lineno 
      00932B 13 01            [ 2] 3337 	cpw x,(FIRST,sp)
      00932D 2A 14            [ 1] 3338 	jrpl list_start 
      00932F 1E 05            [ 2] 3339 	ldw x,(LN_PTR,sp) 
      009331 1C 00 02         [ 2] 3340 	addw x,#2 
      009334 F6               [ 1] 3341 	ld a,(x)
      009335 5C               [ 1] 3342 	incw x 
      009336 C7 00 0B         [ 1] 3343 	ld acc8,a 
      009339 72 5F 00 0A      [ 1] 3344 	clr acc16 
      00933D 72 BB 00 0A      [ 2] 3345 	addw x,acc16
      009341 20 E0            [ 2] 3346 	jra 2$ 
                                   3347 ; print loop
      009343                       3348 list_start:
      009343 1E 05            [ 2] 3349 	ldw x,(LN_PTR,sp)
      009345                       3350 3$:	
      009345 CD 93 6D         [ 4] 3351 	call prt_basic_line
      009348 1E 05            [ 2] 3352 	ldw x,(LN_PTR,sp)
      00934A 1C 00 02         [ 2] 3353 	addw x,#2 
      00934D F6               [ 1] 3354 	ld a,(x)
      00934E 5C               [ 1] 3355 	incw x 
      00934F C7 00 0B         [ 1] 3356 	ld acc8,a 
      009352 72 5F 00 0A      [ 1] 3357 	clr acc16 
      009356 72 BB 00 0A      [ 2] 3358 	addw x,acc16
      00935A C3 00 1E         [ 2] 3359 	cpw x,txtend 
      00935D 2A 0B            [ 1] 3360 	jrpl list_exit
      00935F 1F 05            [ 2] 3361 	ldw (LN_PTR,sp),x
      009361 FE               [ 2] 3362 	ldw x,(x)
      009362 13 03            [ 2] 3363 	cpw x,(LAST,sp)  
      009364 2C 04            [ 1] 3364 	jrsgt list_exit 
      009366 1E 05            [ 2] 3365 	ldw x,(LN_PTR,sp)
      009368 20 DB            [ 2] 3366 	jra 3$
      00936A                       3367 list_exit:
      0012EA                       3368 	_drop VSIZE 
      00936A 5B 06            [ 2]    1     addw sp,#VSIZE 
      00936C 81               [ 4] 3369 	ret
                                   3370 
                                   3371 ;--------------------------
                                   3372 ; input:
                                   3373 ;   X 		pointer at line
                                   3374 ; output:
                                   3375 ;   none 
                                   3376 ;--------------------------	
      00936D                       3377 prt_basic_line:
      00936D 89               [ 2] 3378 	pushw x 
      00936E FE               [ 2] 3379 	ldw x,(x)
      00936F CF 00 0A         [ 2] 3380 	ldw acc16,x 
      009372 72 5F 00 09      [ 1] 3381 	clr acc24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      009376 AE 00 05         [ 2] 3382 	ldw x,#5 
      009379 A6 0A            [ 1] 3383 	ld a,#10 
      00937B CD 88 86         [ 4] 3384 	call prti24 
      00937E 85               [ 2] 3385 	popw x 
      00937F 1C 00 03         [ 2] 3386 	addw x,#3
      009382 CD 82 30         [ 4] 3387 	call puts 
      009385 A6 0D            [ 1] 3388 	ld a,#CR 
      009387 CD 82 1E         [ 4] 3389 	call putc 
      00938A 81               [ 4] 3390 	ret 	
                                   3391 
                                   3392 ;---------------------------------
                                   3393 ; BASIC: PRINT|? arg_list 
                                   3394 ; print values from argument list
                                   3395 ;----------------------------------
                           000001  3396 	COMMA=1
                           000001  3397 	VSIZE=1
      00938B                       3398 print:
      00938B 4B 00            [ 1] 3399 push #0 ; local variable COMMA 
      00938D                       3400 reset_comma:
      00938D 0F 01            [ 1] 3401 	clr (COMMA,sp)
      00938F                       3402 prt_loop:
      00938F CD 92 36         [ 4] 3403 	call relation
      009392 A1 01            [ 1] 3404 	cp a,#TK_COLON 
      009394 27 50            [ 1] 3405 	jreq print_exit   
      009396 A1 0A            [ 1] 3406 	cp a,#TK_INTGR 
      009398 26 05            [ 1] 3407 	jrne 0$ 
      00939A CD 88 CE         [ 4] 3408 	call print_int 
      00939D 20 EE            [ 2] 3409 	jra reset_comma
      00939F                       3410 0$: 	
      00939F CD 8C 66         [ 4] 3411 	call get_token
      0093A2 A1 00            [ 1] 3412 	cp a,#TK_NONE 
      0093A4 27 40            [ 1] 3413 	jreq print_exit 
      0093A6 A1 06            [ 1] 3414 1$:	cp a,#TK_QSTR
      0093A8 26 05            [ 1] 3415 	jrne 2$   
      0093AA CD 82 30         [ 4] 3416 	call puts 
      0093AD 20 DE            [ 2] 3417 	jra reset_comma
      0093AF A1 0B            [ 1] 3418 2$: cp a,#TK_CHAR 
      0093B1 26 06            [ 1] 3419 	jrne 3$
      0093B3 9F               [ 1] 3420 	ld a,xl 
      0093B4 CD 82 1E         [ 4] 3421 	call putc 
      0093B7 20 D4            [ 2] 3422 	jra reset_comma 
      0093B9                       3423 3$: 	
      0093B9 A1 0C            [ 1] 3424 	cp a,#TK_FUNC 
      0093BB 26 06            [ 1] 3425 	jrne 4$ 
      0093BD FD               [ 4] 3426 	call (x)
      0093BE CD 88 CE         [ 4] 3427 	call print_int 
      0093C1 20 CA            [ 2] 3428 	jra reset_comma 
      0093C3                       3429 4$: 
      0093C3 A1 08            [ 1] 3430 	cp a,#TK_COMMA 
      0093C5 26 05            [ 1] 3431 	jrne 5$
      0093C7 03 01            [ 1] 3432 	cpl (COMMA,sp) 
      0093C9 CC 93 8F         [ 2] 3433 	jp prt_loop   
      0093CC                       3434 5$: 
      0093CC A1 09            [ 1] 3435 	cp a,#TK_SHARP
      0093CE 26 13            [ 1] 3436 	jrne 7$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      0093D0 CD 8C 66         [ 4] 3437 	call get_token
      0093D3 A1 0A            [ 1] 3438 	cp a,#TK_INTGR 
      0093D5 27 03            [ 1] 3439 	jreq 6$
      0093D7 CC 86 7B         [ 2] 3440 	jp syntax_error 
      0093DA                       3441 6$:
      0093DA 9F               [ 1] 3442 	ld a,xl 
      0093DB A4 0F            [ 1] 3443 	and a,#15 
      0093DD C7 00 26         [ 1] 3444 	ld tab_width,a 
      0093E0 CC 93 8D         [ 2] 3445 	jp reset_comma 
      0093E3                       3446 7$:	
      0093E3 CD 8E F5         [ 4] 3447 	call unget_token
      0093E6                       3448 print_exit:
      0093E6 0D 01            [ 1] 3449 	tnz (COMMA,sp)
      0093E8 26 05            [ 1] 3450 	jrne 9$
      0093EA A6 0D            [ 1] 3451 	ld a,#CR 
      0093EC CD 82 1E         [ 4] 3452     call putc 
      00136F                       3453 9$:	_drop VSIZE 
      0093EF 5B 01            [ 2]    1     addw sp,#VSIZE 
      0093F1 81               [ 4] 3454 	ret 
                                   3455 
                                   3456 ;----------------------
                                   3457 ; 'save_context' and
                                   3458 ; 'rest_context' must be 
                                   3459 ; called at the same 
                                   3460 ; call stack depth 
                                   3461 ; i.e. SP must have the 
                                   3462 ; save value at  
                                   3463 ; entry point of both 
                                   3464 ; routine. 
                                   3465 ;---------------------
                           000006  3466 	CTXT_SIZE=6 ; size of saved data 
                                   3467 ;--------------------
                                   3468 ; save current BASIC
                                   3469 ; interpreter context 
                                   3470 ; on cstack 
                                   3471 ;--------------------
      0093F2                       3472 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001372                       3473 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001372                       3474 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001372                       3475 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001372                       3476 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      001372                       3477 save_context:
      0093F2 CE 00 04         [ 2] 3478 	ldw x,basicptr 
      0093F5 1F 03            [ 2] 3479 	ldw (BPTR,sp),x
      0093F7 CE 00 06         [ 2] 3480 	ldw x,lineno 
      0093FA 1F 05            [ 2] 3481 	ldw (LNO,sp),x 
      0093FC C6 00 02         [ 1] 3482 	ld a,in 
      0093FF 6B 07            [ 1] 3483 	ld (IN,sp),a
      009401 C6 00 03         [ 1] 3484 	ld a,count 
      009404 6B 08            [ 1] 3485 	ld (CNT,sp),a  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      009406 81               [ 4] 3486 	ret
                                   3487 
                                   3488 ;-----------------------
                                   3489 ; restore previously saved 
                                   3490 ; BASIC interpreter context 
                                   3491 ; from cstack 
                                   3492 ;-------------------------
      009407                       3493 rest_context:
      009407 1E 03            [ 2] 3494 	ldw x,(BPTR,sp)
      009409 CF 00 04         [ 2] 3495 	ldw basicptr,x 
      00940C 1E 05            [ 2] 3496 	ldw x,(LNO,sp)
      00940E CF 00 06         [ 2] 3497 	ldw lineno,x 
      009411 7B 07            [ 1] 3498 	ld a,(IN,sp)
      009413 C7 00 02         [ 1] 3499 	ld in,a
      009416 7B 08            [ 1] 3500 	ld a,(CNT,sp)
      009418 C7 00 03         [ 1] 3501 	ld count,a  
      00941B 81               [ 4] 3502 	ret
                                   3503 
                                   3504 ;------------------------------------------
                                   3505 ; BASIC: INPUT [string],var[,[string],var]
                                   3506 ; input value in variables 
                                   3507 ; [string] optionally can be used as prompt 
                                   3508 ;-----------------------------------------
                           000001  3509 	CX_BPTR=1
                           000003  3510 	CX_LNO=3
                           000004  3511 	CX_IN=4
                           000005  3512 	CX_CNT=5
                           000006  3513 	SKIP=6
                           000007  3514 	VSIZE=7
      00941C                       3515 input_var:
      00941C 72 00 00 25 05   [ 2] 3516 	btjt flags,#FRUN,1$ 
      009421 A6 06            [ 1] 3517 	ld a,#ERR_RUN_ONLY 
      009423 CC 86 7D         [ 2] 3518 	jp tb_error 
      0013A6                       3519 1$:	_vars VSIZE 
      009426 52 07            [ 2]    1     sub sp,#VSIZE 
      009428                       3520 input_loop:
      009428 0F 06            [ 1] 3521 	clr (SKIP,sp)
      00942A CD 8C 66         [ 4] 3522 	call get_token 
      00942D A1 00            [ 1] 3523 	cp a,#TK_NONE 
      00942F 27 5C            [ 1] 3524 	jreq input_exit 
      009431 A1 06            [ 1] 3525 	cp a,#TK_QSTR 
      009433 26 08            [ 1] 3526 	jrne 1$ 
      009435 CD 82 30         [ 4] 3527 	call puts 
      009438 03 06            [ 1] 3528 	cpl (SKIP,sp)
      00943A CD 8C 66         [ 4] 3529 	call get_token 
      00943D A1 02            [ 1] 3530 1$: cp a,#TK_VAR  
      00943F 27 03            [ 1] 3531 	jreq 2$ 
      009441 CC 86 7B         [ 2] 3532 	jp syntax_error
      009444 CD 8E FC         [ 4] 3533 2$:	call dpush 
      009447 0D 06            [ 1] 3534 	tnz (SKIP,sp)
      009449 26 0F            [ 1] 3535 	jrne 21$ 
      00944B A6 3A            [ 1] 3536 	ld a,#':
      00944D C7 17 19         [ 1] 3537 	ld pad+1,a 
      009450 72 5F 17 1A      [ 1] 3538 	clr pad+2
      009454 AE 17 18         [ 2] 3539 	ldw x,#pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      009457 CD 82 30         [ 4] 3540 	call puts   
      00945A                       3541 21$:
      00945A CD 93 F2         [ 4] 3542 	call save_context 
      00945D AE 16 C8         [ 2] 3543 	ldw x,#tib 
      009460 CF 00 04         [ 2] 3544 	ldw basicptr,x  
      009463 72 5F 00 03      [ 1] 3545 	clr count  
      009467 CD 89 BC         [ 4] 3546 	call readln 
      00946A 72 5F 00 02      [ 1] 3547 	clr in 
      00946E CD 92 36         [ 4] 3548 	call relation 
      009471 A1 0A            [ 1] 3549 	cp a,#TK_INTGR
      009473 27 03            [ 1] 3550 	jreq 3$ 
      009475 CC 86 7B         [ 2] 3551 	jp syntax_error
      009478 CD 8E FC         [ 4] 3552 3$: call dpush 
      00947B CD 8F 63         [ 4] 3553 	call store 
      00947E CD 94 07         [ 4] 3554 	call rest_context
      009481 CD 8C 66         [ 4] 3555 	call get_token 
      009484 A1 08            [ 1] 3556 	cp a,#TK_COMMA 
      009486 26 02            [ 1] 3557 	jrne 4$
      009488 20 9E            [ 2] 3558 	jra input_loop 
      00948A CD 8E F5         [ 4] 3559 4$:	call unget_token 
      00948D                       3560 input_exit:
      00140D                       3561 	_drop VSIZE 
      00948D 5B 07            [ 2]    1     addw sp,#VSIZE 
      00948F 81               [ 4] 3562 	ret 
                                   3563 
                                   3564 
                                   3565 ;---------------------
                                   3566 ; BASIC: REMARK | ' 
                                   3567 ; begin a comment 
                                   3568 ; comment are ignored 
                                   3569 ; use ' insted of REM 
                                   3570 ; This is never called
                                   3571 ; because get_token 
                                   3572 ; take care of skipping
                                   3573 ; comment. but required
                                   3574 ; for future use of 
                                   3575 ; keyword reverse search.  
                                   3576 ;---------------------- 
      009490                       3577 rem: 
      009490 81               [ 4] 3578 	ret 
                                   3579 
                                   3580 ;---------------------
                                   3581 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3582 ; read in loop 'addr'  
                                   3583 ; apply & 'mask' to value 
                                   3584 ; loop while result==0.  
                                   3585 ; if 'xor_mask' given 
                                   3586 ; apply ^ in second  
                                   3587 ; loop while result==0 
                                   3588 ;---------------------
                           000001  3589 	XMASK=1 
                           000002  3590 	MASK=2
                           000003  3591 	ADDR=3
                           000004  3592 	VSIZE=4
      009491                       3593 wait: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      001411                       3594 	_vars VSIZE
      009491 52 04            [ 2]    1     sub sp,#VSIZE 
      009493 0F 01            [ 1] 3595 	clr (XMASK,sp) 
      009495 CD 90 FA         [ 4] 3596 	call arg_list 
      009498 A1 02            [ 1] 3597 	cp a,#2
      00949A 24 03            [ 1] 3598 	jruge 0$
      00949C CC 86 7B         [ 2] 3599 	jp syntax_error 
      00949F A1 03            [ 1] 3600 0$:	cp a,#3
      0094A1 25 06            [ 1] 3601 	jrult 1$
      0094A3 CD 8F 09         [ 4] 3602 	call dpop 
      0094A6 9F               [ 1] 3603 	ld a,xl
      0094A7 6B 01            [ 1] 3604 	ld (XMASK,sp),a 
      0094A9 CD 8F 09         [ 4] 3605 1$: call dpop ; mask 
      0094AC 9F               [ 1] 3606 	ld a,xl 
      0094AD 6B 02            [ 1] 3607 	ld (MASK,sp),a 
      0094AF CD 8F 09         [ 4] 3608 	call dpop ; address 
      0094B2 F6               [ 1] 3609 2$:	ld a,(x)
      0094B3 14 02            [ 1] 3610 	and a,(MASK,sp)
      0094B5 18 01            [ 1] 3611 	xor a,(XMASK,sp)
      0094B7 27 F9            [ 1] 3612 	jreq 2$ 
      001439                       3613 	_drop VSIZE 
      0094B9 5B 04            [ 2]    1     addw sp,#VSIZE 
      0094BB 81               [ 4] 3614 	ret 
                                   3615 
                                   3616 ;---------------------
                                   3617 ; BASIC: BSET addr,mask
                                   3618 ; set bits at 'addr' corresponding 
                                   3619 ; to those of 'mask' that are at 1.
                                   3620 ; arguments:
                                   3621 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3622 ;   mask        mask|addr
                                   3623 ; output:
                                   3624 ;	none 
                                   3625 ;--------------------------
      0094BC                       3626 bit_set:
      0094BC CD 90 FA         [ 4] 3627 	call arg_list 
      0094BF A1 02            [ 1] 3628 	cp a,#2	 
      0094C1 27 03            [ 1] 3629 	jreq 1$ 
      0094C3 CC 86 7B         [ 2] 3630 	jp syntax_error
      0094C6                       3631 1$: 
      0094C6 CD 8F 09         [ 4] 3632 	call dpop ; mask 
      0094C9 9F               [ 1] 3633 	ld a,xl 
      0094CA CD 8F 09         [ 4] 3634 	call dpop ; addr  
      0094CD FA               [ 1] 3635 	or a,(x)
      0094CE F7               [ 1] 3636 	ld (x),a
      0094CF 81               [ 4] 3637 	ret 
                                   3638 
                                   3639 ;---------------------
                                   3640 ; BASIC: BRES addr,mask
                                   3641 ; reset bits at 'addr' corresponding 
                                   3642 ; to those of 'mask' that are at 1.
                                   3643 ; arguments:
                                   3644 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3645 ;   mask	    ~mask&*addr  
                                   3646 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



                                   3647 ;	none 
                                   3648 ;--------------------------
      0094D0                       3649 bit_reset:
      0094D0 CD 90 FA         [ 4] 3650 	call arg_list 
      0094D3 A1 02            [ 1] 3651 	cp a,#2  
      0094D5 27 03            [ 1] 3652 	jreq 1$ 
      0094D7 CC 86 7B         [ 2] 3653 	jp syntax_error
      0094DA                       3654 1$: 
      0094DA CD 8F 09         [ 4] 3655 	call dpop ; mask 
      0094DD 9F               [ 1] 3656 	ld a,xl 
      0094DE 43               [ 1] 3657 	cpl a 
      0094DF CD 8F 09         [ 4] 3658 	call dpop ; addr  
      0094E2 F4               [ 1] 3659 	and a,(x)
      0094E3 F7               [ 1] 3660 	ld (x),a 
      0094E4 81               [ 4] 3661 	ret 
                                   3662 
                                   3663 ;---------------------
                                   3664 ; BASIC: BRES addr,mask
                                   3665 ; toggle bits at 'addr' corresponding 
                                   3666 ; to those of 'mask' that are at 1.
                                   3667 ; arguments:
                                   3668 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3669 ;   mask	    mask^*addr  
                                   3670 ; output:
                                   3671 ;	none 
                                   3672 ;--------------------------
      0094E5                       3673 bit_toggle:
      0094E5 CD 90 FA         [ 4] 3674 	call arg_list 
      0094E8 A1 02            [ 1] 3675 	cp a,#2 
      0094EA 27 03            [ 1] 3676 	jreq 1$ 
      0094EC CC 86 7B         [ 2] 3677 	jp syntax_error
      0094EF CD 8F 09         [ 4] 3678 1$: call dpop ; mask 
      0094F2 9F               [ 1] 3679 	ld a,xl 
      0094F3 CD 8F 09         [ 4] 3680 	call dpop ; addr  
      0094F6 F8               [ 1] 3681 	xor a,(x)
      0094F7 F7               [ 1] 3682 	ld (x),a 
      0094F8 81               [ 4] 3683 	ret 
                                   3684 
                                   3685 
                                   3686 ;--------------------
                                   3687 ; BASIC: POKE addr,byte
                                   3688 ; put a byte at addr 
                                   3689 ;--------------------
      0094F9                       3690 poke:
      0094F9 CD 90 FA         [ 4] 3691 	call arg_list 
      0094FC A1 02            [ 1] 3692 	cp a,#2
      0094FE 27 03            [ 1] 3693 	jreq 1$
      009500 CC 86 7B         [ 2] 3694 	jp syntax_error
      009503                       3695 1$:	
      009503 CD 8F 09         [ 4] 3696 	call dpop 
      009506 9F               [ 1] 3697     ld a,xl 
      009507 CD 8F 09         [ 4] 3698 	call dpop 
      00950A F7               [ 1] 3699 	ld (x),a 
      00950B 81               [ 4] 3700 	ret 
                                   3701 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3702 ;-----------------------
                                   3703 ; BASIC: PEEK(addr)
                                   3704 ; get the byte at addr 
                                   3705 ; input:
                                   3706 ;	none 
                                   3707 ; output:
                                   3708 ;	X 		value 
                                   3709 ;-----------------------
      00950C                       3710 peek:
      00950C A6 04            [ 1] 3711 	ld a,#TK_LPAREN 
      00950E CD 90 ED         [ 4] 3712 	call expect 
      009511 CD 90 FA         [ 4] 3713 	call arg_list
      009514 A1 01            [ 1] 3714 	cp a,#1 
      009516 27 03            [ 1] 3715 	jreq 1$
      009518 CC 86 7B         [ 2] 3716 	jp syntax_error
      00951B A6 05            [ 1] 3717 1$:	ld a,#TK_RPAREN 
      00951D CD 90 ED         [ 4] 3718 	call expect 
      009520 CD 8F 09         [ 4] 3719 	call dpop 
      009523 F6               [ 1] 3720 	ld a,(x)
      009524 5F               [ 1] 3721 	clrw x 
      009525 97               [ 1] 3722 	ld xl,a 
      009526 A6 0A            [ 1] 3723 	ld a,#TK_INTGR
      009528 81               [ 4] 3724 	ret 
                                   3725 
      009529                       3726 if: 
      009529 CD 92 36         [ 4] 3727 	call relation 
      00952C A1 0A            [ 1] 3728 	cp a,#TK_INTGR
      00952E 27 03            [ 1] 3729 	jreq 1$ 
      009530 CC 86 7B         [ 2] 3730 	jp syntax_error
      009533 4F               [ 1] 3731 1$:	clr a 
      009534 5D               [ 2] 3732 	tnzw x 
      009535 26 05            [ 1] 3733 	jrne 9$  
                                   3734 ;skip to next line
      009537 55 00 03 00 02   [ 1] 3735 	mov in,count
      00953C 81               [ 4] 3736 9$:	ret 
                                   3737 
                                   3738 ;------------------------
                                   3739 ; BASIC: FOR var=expr 
                                   3740 ; set variable to expression 
                                   3741 ; leave variable address 
                                   3742 ; on dstack and set
                                   3743 ; FFOR bit in 'flags'
                                   3744 ;-----------------
                           000001  3745 	RETL1=1
                           000003  3746 	INW=3
                           000005  3747 	BPTR=5
      00953D                       3748 for: ; { -- var_addr }
      00953D A6 02            [ 1] 3749 	ld a,#TK_VAR 
      00953F CD 90 ED         [ 4] 3750 	call expect
      009542 CD 8E FC         [ 4] 3751 	call dpush 
      009545 CD 92 C9         [ 4] 3752 	call let02 
      009548 72 14 00 25      [ 1] 3753 	bset flags,#FFOR 
                                   3754 ; open space on cstack for BPTR and INW 
      00954C 85               [ 2] 3755 	popw x ; call return address 
      0014CD                       3756 	_vars 4
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00954D 52 04            [ 2]    1     sub sp,#4 
      00954F 89               [ 2] 3757 	pushw x  ; RETL1 
      009550 5F               [ 1] 3758 	clrw x 
      009551 1F 05            [ 2] 3759 	ldw (BPTR,sp),x 
      009553 1F 03            [ 2] 3760 	ldw (INW,sp),x 
      009555 CD 8C 66         [ 4] 3761 	call get_token 
      009558 A1 07            [ 1] 3762 	cp a,#TK_CMD 
      00955A 27 03            [ 1] 3763 	jreq 1$
      00955C CC 86 7B         [ 2] 3764 	jp syntax_error
      00955F                       3765 1$:  
      00955F A3 95 67         [ 2] 3766 	cpw x,#to 
      009562 27 03            [ 1] 3767 	jreq to
      009564 CC 86 7B         [ 2] 3768 	jp syntax_error 
                                   3769 
                                   3770 ;-----------------------------------
                                   3771 ; BASIC: TO expr 
                                   3772 ; second part of FOR loop initilization
                                   3773 ; leave limit on dstack and set 
                                   3774 ; FTO bit in 'flags'
                                   3775 ;-----------------------------------
      009567                       3776 to: ; { var_addr -- var_addr limit step }
      009567 72 04 00 25 03   [ 2] 3777 	btjt flags,#FFOR,1$
      00956C CC 86 7B         [ 2] 3778 	jp syntax_error
      00956F CD 92 36         [ 4] 3779 1$: call relation  
      009572 A1 0A            [ 1] 3780 	cp a,#TK_INTGR 
      009574 27 03            [ 1] 3781 	jreq 2$ 
      009576 CC 86 7B         [ 2] 3782 	jp syntax_error
      009579                       3783 2$: 
      009579 CD 8E FC         [ 4] 3784     call dpush ; limit
      00957C CE 00 01         [ 2] 3785 	ldw x,in.w 
      00957F CD 8C 66         [ 4] 3786 	call get_token
      009582 A1 00            [ 1] 3787 	cp a,#TK_NONE  
      009584 27 0C            [ 1] 3788 	jreq 4$ 
      009586 A1 07            [ 1] 3789 	cp a,#TK_CMD
      009588 26 05            [ 1] 3790 	jrne 3$
      00958A A3 95 97         [ 2] 3791 	cpw x,#step 
      00958D 27 08            [ 1] 3792 	jreq step
      00958F                       3793 3$:	
      00958F CD 8E F5         [ 4] 3794 	call unget_token   	 
      009592                       3795 4$:	
      009592 AE 00 01         [ 2] 3796 	ldw x,#1   ; default step  
      009595 20 12            [ 2] 3797 	jra store_loop_addr 
                                   3798 
                                   3799 
                                   3800 ;----------------------------------
                                   3801 ; BASIC: STEP expr 
                                   3802 ; optional third par of FOR loop
                                   3803 ; initialization. 	
                                   3804 ;------------------------------------
      009597                       3805 step: ; {var limit -- var limit step}
      009597 72 04 00 25 03   [ 2] 3806 	btjt flags,#FFOR,1$
      00959C CC 86 7B         [ 2] 3807 	jp syntax_error
      00959F CD 92 36         [ 4] 3808 1$: call relation
      0095A2 A1 0A            [ 1] 3809 	cp a,#TK_INTGR
      0095A4 27 03            [ 1] 3810 	jreq store_loop_addr  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0095A6 CC 86 7B         [ 2] 3811 	jp syntax_error
                                   3812 ; leave loop back entry point on cstack 
                                   3813 ; cstack is 2 call deep from interp_loop
      0095A9                       3814 store_loop_addr:
      0095A9 CD 8E FC         [ 4] 3815 	call dpush 
      0095AC CE 00 04         [ 2] 3816 	ldw x,basicptr  
      0095AF 1F 05            [ 2] 3817 	ldw (BPTR,sp),x 
      0095B1 CE 00 01         [ 2] 3818 	ldw x,in.w 
      0095B4 1F 03            [ 2] 3819 	ldw (INW,sp),x   
      0095B6 72 15 00 25      [ 1] 3820 	bres flags,#FFOR 
      0095BA 72 5C 00 20      [ 1] 3821 	inc loop_depth  
      0095BE 81               [ 4] 3822 	ret 
                                   3823 
                                   3824 ;--------------------------------
                                   3825 ; BASIC: NEXT var 
                                   3826 ; FOR loop control 
                                   3827 ; increment variable with step 
                                   3828 ; and compare with limit 
                                   3829 ; loop if threshold not crossed.
                                   3830 ; else clean both stacks. 
                                   3831 ; and decrement 'loop_depth' 
                                   3832 ;--------------------------------
      0095BF                       3833 next: ; {var limit step -- [var limit step ] }
      0095BF 72 5D 00 20      [ 1] 3834 	tnz loop_depth 
      0095C3 26 03            [ 1] 3835 	jrne 1$ 
      0095C5 CC 86 7B         [ 2] 3836 	jp syntax_error 
      0095C8                       3837 1$: 
      0095C8 A6 02            [ 1] 3838 	ld a,#TK_VAR 
      0095CA CD 90 ED         [ 4] 3839 	call expect
                                   3840 ; check for good variable after NEXT 	 
      0095CD 90 93            [ 1] 3841 	ldw y,x 
      0095CF AE 00 04         [ 2] 3842 	ldw x,#4  
      0095D2 72 D3 00 1A      [ 4] 3843 	cpw y,([dstkptr],x) ; compare variables address 
      0095D6 27 03            [ 1] 3844 	jreq 2$  
      0095D8 CC 86 7B         [ 2] 3845 	jp syntax_error ; not the good one 
      0095DB                       3846 2$: ; increment variable 
      0095DB 93               [ 1] 3847 	ldw x,y
      0095DC FE               [ 2] 3848 	ldw x,(x)  ; get var value 
      0095DD CF 00 0A         [ 2] 3849 	ldw acc16,x 
      0095E0 72 CE 00 1A      [ 5] 3850 	ldw x,[dstkptr] ; step
      0095E4 72 BB 00 0A      [ 2] 3851 	addw x,acc16 ; var+step 
      0095E8 90 FF            [ 2] 3852 	ldw (y),x ; save var new value 
                                   3853 ; compare with limit 
      0095EA 90 93            [ 1] 3854 	ldw y,x 
      0095EC 72 CE 00 1A      [ 5] 3855 	ldw x,[dstkptr] ; step in x 
      0095F0 5D               [ 2] 3856 	tnzw x  
      0095F1 2A 0B            [ 1] 3857 	jrpl 4$ ; positive step 
                                   3858 ;negative step 
      0095F3 AE 00 02         [ 2] 3859 	ldw x,#2
      0095F6 72 D3 00 1A      [ 4] 3860 	cpw y,([dstkptr],x)
      0095FA 2F 26            [ 1] 3861 	jrslt loop_done
      0095FC 20 09            [ 2] 3862 	jra loop_back 
      0095FE                       3863 4$: ; positive step
      0095FE AE 00 02         [ 2] 3864 	ldw x,#2 
      009601 72 D3 00 1A      [ 4] 3865 	cpw y,([dstkptr],x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009605 2C 1B            [ 1] 3866 	jrsgt loop_done
      009607                       3867 loop_back:
      009607 1E 05            [ 2] 3868 	ldw x,(BPTR,sp)
      009609 CF 00 04         [ 2] 3869 	ldw basicptr,x 
      00960C 72 01 00 25 0B   [ 2] 3870 	btjf flags,#FRUN,1$ 
      009611 E6 02            [ 1] 3871 	ld a,(2,x)
      009613 AB 02            [ 1] 3872 	add a,#2 
      009615 C7 00 03         [ 1] 3873 	ld count,a
      009618 FE               [ 2] 3874 	ldw x,(x)
      009619 CF 00 06         [ 2] 3875 	ldw lineno,x
      00961C 1E 03            [ 2] 3876 1$:	ldw x,(INW,sp)
      00961E CF 00 01         [ 2] 3877 	ldw in.w,x 
      009621 81               [ 4] 3878 	ret 
      009622                       3879 loop_done:
                                   3880 	; remove var limit step on dstack 
      009622 CE 00 1A         [ 2] 3881 	ldw x,dstkptr 
      009625 1C 00 06         [ 2] 3882 	addw x,#3*CELL_SIZE
      009628 CF 00 1A         [ 2] 3883 	ldw dstkptr,x 
                                   3884 	; remove 2 return address on cstack 
      00962B 85               [ 2] 3885 	popw x
      0015AC                       3886 	_drop 4
      00962C 5B 04            [ 2]    1     addw sp,#4 
      00962E 89               [ 2] 3887 	pushw x 
      00962F 72 5A 00 20      [ 1] 3888 	dec loop_depth 
      009633 81               [ 4] 3889 	ret 
                                   3890 
                                   3891 
                                   3892 ;------------------------
                                   3893 ; BASIC: GOTO lineno 
                                   3894 ; jump to lineno 
                                   3895 ; here cstack is 2 call deep from interp_loop 
                                   3896 ;------------------------
      009634                       3897 goto:
      009634 72 00 00 25 06   [ 2] 3898 	btjt flags,#FRUN,0$ 
      009639 A6 06            [ 1] 3899 	ld a,#ERR_RUN_ONLY
      00963B CC 86 7D         [ 2] 3900 	jp tb_error 
      00963E 81               [ 4] 3901 	ret 
      00963F 20 23            [ 2] 3902 0$:	jra go_common
                                   3903 
                                   3904 ;--------------------
                                   3905 ; BASIC: GOSUB lineno
                                   3906 ; basic subroutine call
                                   3907 ; actual lineno and basicptr 
                                   3908 ; are saved on cstack
                                   3909 ; here cstack is 2 call deep from interp_loop 
                                   3910 ;--------------------
                           000003  3911 	GOS_RET=3
      009641                       3912 gosub:
      009641 72 00 00 25 06   [ 2] 3913 	btjt flags,#FRUN,0$ 
      009646 A6 06            [ 1] 3914 	ld a,#ERR_RUN_ONLY
      009648 CC 86 7D         [ 2] 3915 	jp tb_error 
      00964B 81               [ 4] 3916 	ret 
      00964C 85               [ 2] 3917 0$:	popw x 
      00964D 52 02            [ 2] 3918 	sub sp,#2 
      00964F 89               [ 2] 3919 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      009650 CE 00 04         [ 2] 3920 	ldw x,basicptr
      009653 E6 02            [ 1] 3921 	ld a,(2,x)
      009655 AB 03            [ 1] 3922 	add a,#3 
      009657 C7 00 0B         [ 1] 3923 	ld acc8,a 
      00965A 72 5F 00 0A      [ 1] 3924 	clr acc16 
      00965E 72 BB 00 0A      [ 2] 3925 	addw x,acc16
      009662 1F 03            [ 2] 3926 	ldw (GOS_RET,sp),x 
      009664                       3927 go_common: 
      009664 CD 92 36         [ 4] 3928 	call relation 
      009667 A1 0A            [ 1] 3929 	cp a,#TK_INTGR
      009669 27 03            [ 1] 3930 	jreq 1$ 
      00966B CC 86 7B         [ 2] 3931 	jp syntax_error
      00966E                       3932 1$: 
      00966E CD 83 60         [ 4] 3933 	call search_lineno  
      009671 5D               [ 2] 3934 	tnzw x 
      009672 26 05            [ 1] 3935 	jrne 2$ 
      009674 A6 05            [ 1] 3936 	ld a,#ERR_NO_LINE 
      009676 CC 86 7D         [ 2] 3937 	jp tb_error 
      009679                       3938 2$: 
      009679 CF 00 04         [ 2] 3939 	ldw basicptr,x 
      00967C E6 02            [ 1] 3940 	ld a,(2,x)
      00967E AB 03            [ 1] 3941 	add a,#3 
      009680 C7 00 03         [ 1] 3942 	ld count,a 
      009683 FE               [ 2] 3943 	ldw x,(x)
      009684 CF 00 06         [ 2] 3944 	ldw lineno,x 
      009687 35 03 00 02      [ 1] 3945 	mov in,#3 
      00968B 81               [ 4] 3946 	ret 
                                   3947 
                                   3948 ;------------------------
                                   3949 ; BASIC: RETURN 
                                   3950 ; exit from a subroutine 
                                   3951 ; cstack is 2 level deep from interp_loop 
                                   3952 ;------------------------
      00968C                       3953 return:
      00968C 72 00 00 25 05   [ 2] 3954 	btjt flags,#FRUN,0$ 
      009691 A6 06            [ 1] 3955 	ld a,#ERR_RUN_ONLY
      009693 CC 86 7D         [ 2] 3956 	jp tb_error 
      009696                       3957 0$:	
      009696 1E 03            [ 2] 3958 	ldw x,(GOS_RET,sp) 
      009698 CF 00 04         [ 2] 3959 	ldw basicptr,x 
      00969B E6 02            [ 1] 3960 	ld a,(2,x)
      00969D AB 03            [ 1] 3961 	add a,#3 
      00969F C7 00 03         [ 1] 3962 	ld count,a 
      0096A2 35 03 00 02      [ 1] 3963 	mov in,#3
      0096A6 FE               [ 2] 3964 	ldw x,(x)
      0096A7 CF 00 06         [ 2] 3965 	ldw lineno,x 
      0096AA 4F               [ 1] 3966 	clr a 
      0096AB 85               [ 2] 3967 	popw x 
      00162C                       3968 	_drop 2
      0096AC 5B 02            [ 2]    1     addw sp,#2 
      0096AE 89               [ 2] 3969 	pushw x
      0096AF 81               [ 4] 3970 	ret  
                                   3971 
                                   3972 
                                   3973 ;----------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



                                   3974 ; BASIC: RUN
                                   3975 ; run BASIC program in RAM
                                   3976 ;----------------------------------- 
      0096B0                       3977 run: 
      0096B0 72 01 00 25 02   [ 2] 3978 	btjf flags,#FRUN,0$  
      0096B5 4F               [ 1] 3979 	clr a 
      0096B6 81               [ 4] 3980 	ret
      0096B7                       3981 0$: 
      0096B7 72 09 00 25 12   [ 2] 3982 	btjf flags,#FBREAK,1$
      00163C                       3983 	_drop 2 
      0096BC 5B 02            [ 2]    1     addw sp,#2 
      0096BE CD 94 07         [ 4] 3984 	call rest_context
      001641                       3985 	_drop CTXT_SIZE 
      0096C1 5B 06            [ 2]    1     addw sp,#CTXT_SIZE 
      0096C3 72 19 00 25      [ 1] 3986 	bres flags,#FBREAK 
      0096C7 72 10 00 25      [ 1] 3987 	bset flags,#FRUN 
      0096CB CC 87 3D         [ 2] 3988 	jp interp_loop 
      0096CE CE 00 1C         [ 2] 3989 1$:	ldw x,txtbgn
      0096D1 C3 00 1E         [ 2] 3990 	cpw x,txtend 
      0096D4 2B 02            [ 1] 3991 	jrmi 2$ 
      0096D6 4F               [ 1] 3992 	clr a 
      0096D7 81               [ 4] 3993 	ret 
      0096D8 CD 92 B1         [ 4] 3994 2$: call ubound 
      00165B                       3995 	_drop 2 
      0096DB 5B 02            [ 2]    1     addw sp,#2 
      0096DD CE 00 1C         [ 2] 3996 	ldw x,txtbgn 
      0096E0 CF 00 04         [ 2] 3997 	ldw basicptr,x 
      0096E3 E6 02            [ 1] 3998 	ld a,(2,x)
      0096E5 AB 02            [ 1] 3999 	add a,#2 ; consider that in start at 3  
      0096E7 C7 00 03         [ 1] 4000 	ld count,a
      0096EA FE               [ 2] 4001 	ldw x,(x)
      0096EB CF 00 06         [ 2] 4002 	ldw lineno,x
      0096EE 35 03 00 02      [ 1] 4003 	mov in,#3	
      0096F2 72 10 00 25      [ 1] 4004 	bset flags,#FRUN 
      0096F6 CC 87 3D         [ 2] 4005 	jp interp_loop 
                                   4006 
                                   4007 
                                   4008 ;----------------------
                                   4009 ; BASIC: STOP 
                                   4010 ; stop running program
                                   4011 ;---------------------- 
      0096F9                       4012 stop: 
                                   4013 ; clean dstack and cstack 
      0096F9 AE 17 FF         [ 2] 4014 	ldw x,#STACK_EMPTY 
      0096FC 94               [ 1] 4015 	ldw sp,x 
      0096FD 72 11 00 25      [ 1] 4016 	bres flags,#FRUN 
      009701 72 19 00 25      [ 1] 4017 	bres flags,#FBREAK
      009705 CC 86 D7         [ 2] 4018 	jp warm_start
                                   4019 
                                   4020 ;-----------------------
                                   4021 ; BASIC BEEP expr1,expr2
                                   4022 ; used MCU internal beeper 
                                   4023 ; to produce a sound
                                   4024 ; arguments:
                                   4025 ;    expr1   frequency, {1,2,4} mapping to 1K,2K,4K
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



                                   4026 ;    expr2   duration msec.
                                   4027 ;---------------------------
      009708                       4028 beep:
      009708 CD 90 FA         [ 4] 4029 	call arg_list 
      00970B A1 02            [ 1] 4030 	cp a,#2 
      00970D 27 03            [ 1] 4031 	jreq 2$
      00970F CC 86 7B         [ 2] 4032 	jp syntax_error 
      009712 CE 00 1A         [ 2] 4033 2$: ldw x,dstkptr 
      009715 EE 02            [ 2] 4034 	ldw x,(2,x);frequency 
      009717 9F               [ 1] 4035 	ld a,xl
      009718 4A               [ 1] 4036 	dec a 
      009719 4E               [ 1] 4037 	swap a 
      00971A 48               [ 1] 4038 	sll a 
      00971B 48               [ 1] 4039 	sll a 
      00971C AB 3E            [ 1] 4040 	add a,#0x3e 
      00971E C7 50 F3         [ 1] 4041 	ld BEEP_CSR,a 
      009721 CD 8F 09         [ 4] 4042 	call dpop 
      009724 CD 9B EE         [ 4] 4043 	call pause02 
      009727 CD 8F 30         [ 4] 4044 	call ddrop 
      00972A A6 1F            [ 1] 4045 	ld a,#0x1f
      00972C C7 50 F3         [ 1] 4046 	ld BEEP_CSR,a 
      00972F 81               [ 4] 4047 	ret 
                                   4048 
                                   4049 ;-------------------------------
                                   4050 ; BASIC: PWRADC 0|1,divisor  
                                   4051 ; disable/enanble ADC 
                                   4052 ;-------------------------------
      009730                       4053 power_adc:
      009730 CD 90 FA         [ 4] 4054 	call arg_list 
      009733 A1 02            [ 1] 4055 	cp a,#2	
      009735 27 03            [ 1] 4056 	jreq 1$
      009737 CC 86 7B         [ 2] 4057 	jp syntax_error 
      00973A AE 00 02         [ 2] 4058 1$: ldw x,#2
      00973D 72 DE 00 1A      [ 5] 4059 	ldw x,([dstkptr],x) ; on|off
      009741 5D               [ 2] 4060 	tnzw x 
      009742 27 1C            [ 1] 4061 	jreq 2$ 
      009744 72 CE 00 1A      [ 5] 4062 	ldw x,[dstkptr] ; channel
      009748 9F               [ 1] 4063 	ld a,xl
      009749 A4 07            [ 1] 4064 	and a,#7
      00974B 4E               [ 1] 4065 	swap a 
      00974C C7 54 01         [ 1] 4066 	ld ADC_CR1,a
      00974F 72 16 54 02      [ 1] 4067 	bset ADC_CR2,#ADC_CR2_ALIGN ; right 
      009753 72 10 54 01      [ 1] 4068 	bset ADC_CR1,#ADC_CR1_ADON 
      0016D7                       4069 	_usec_dly 7 
      009757 AE 00 1B         [ 2]    1     ldw x,#(16*7-2)/4
      00975A 5A               [ 2]    2     decw x
      00975B 9D               [ 1]    3     nop 
      00975C 26 FA            [ 1]    4     jrne .-4
      00975E 20 04            [ 2] 4070 	jra 3$
      009760 72 11 54 01      [ 1] 4071 2$: bres ADC_CR1,#ADC_CR1_ADON 
      009764 AE 00 02         [ 2] 4072 3$:	ldw x,#2
      009767 CD 8F 6D         [ 4] 4073 	call ddrop_n 
      00976A 81               [ 4] 4074 	ret
                                   4075 
                                   4076 ;-----------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4077 ; BASIC: RDADC(channel)
                                   4078 ; read adc channel 
                                   4079 ; output:
                                   4080 ;   A 		TK_INTGR 
                                   4081 ;   X 		value 
                                   4082 ;-----------------------------
      00976B                       4083 read_adc:
      00976B A6 04            [ 1] 4084 	ld a,#TK_LPAREN 
      00976D CD 90 ED         [ 4] 4085 	call expect 
      009770 CD 8C 66         [ 4] 4086 	call get_token 
      009773 A1 0A            [ 1] 4087 	cp a,#TK_INTGR 
      009775 27 03            [ 1] 4088 	jreq 1$
      009777 CC 86 7B         [ 2] 4089 	jp syntax_error
      00977A 89               [ 2] 4090 1$: pushw x 
      00977B A6 05            [ 1] 4091 	ld a,#TK_RPAREN 
      00977D CD 90 ED         [ 4] 4092 	call expect 
      009780 85               [ 2] 4093 	popw x 
      009781 A3 00 10         [ 2] 4094 	cpw x,#16 
      009784 25 05            [ 1] 4095 	jrult 2$
      009786 A6 0A            [ 1] 4096 	ld a,#ERR_BAD_VALUE
      009788 CC 86 7D         [ 2] 4097 	jp tb_error 
      00978B 9F               [ 1] 4098 2$: ld a,xl
      00978C C7 54 00         [ 1] 4099 	ld ADC_CSR,a 
      00978F 72 10 54 01      [ 1] 4100 	bset ADC_CR1,#ADC_CR1_ADON
      009793 72 0F 54 00 FB   [ 2] 4101 	btjf ADC_CSR,#ADC_CSR_EOC,.
      009798 CE 54 04         [ 2] 4102 	ldw x,ADC_DRH 
      00979B A6 0A            [ 1] 4103 	ld a,#TK_INTGR
      00979D 81               [ 4] 4104 	ret 
                                   4105 
                                   4106 
                                   4107 ;-----------------------
                                   4108 ; BASIC: BREAK 
                                   4109 ; insert a breakpoint 
                                   4110 ; in pogram. 
                                   4111 ; the program is resumed
                                   4112 ; with RUN 
                                   4113 ;-------------------------
      00979E                       4114 break:
      00979E 72 00 00 25 02   [ 2] 4115 	btjt flags,#FRUN,2$
      0097A3 4F               [ 1] 4116 	clr a
      0097A4 81               [ 4] 4117 	ret 
      0097A5                       4118 2$:	 
                                   4119 ; create space on cstack to save context 
      0097A5 AE 97 CF         [ 2] 4120 	ldw x,#break_point 
      0097A8 CD 82 30         [ 4] 4121 	call puts 
      00172B                       4122 	_drop 2 ;drop return address 
      0097AB 5B 02            [ 2]    1     addw sp,#2 
      00172D                       4123 	_vars CTXT_SIZE ; context size 
      0097AD 52 06            [ 2]    1     sub sp,#CTXT_SIZE 
      0097AF CD 93 F2         [ 4] 4124 	call save_context 
      0097B2 AE 16 C8         [ 2] 4125 	ldw x,#tib 
      0097B5 CF 00 04         [ 2] 4126 	ldw basicptr,x
      0097B8 7F               [ 1] 4127 	clr (x)
      0097B9 72 5F 00 03      [ 1] 4128 	clr count  
      0097BD 5F               [ 1] 4129 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



      0097BE CF 00 06         [ 2] 4130 	ldw lineno,x 
      0097C1 CF 00 01         [ 2] 4131 	ldw in.w,x
      0097C4 72 11 00 25      [ 1] 4132 	bres flags,#FRUN 
      0097C8 72 18 00 25      [ 1] 4133 	bset flags,#FBREAK
      0097CC CC 87 3D         [ 2] 4134 	jp interp_loop 
      0097CF 0A 62 72 65 61 6B 20  4135 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4136 
                                   4137 ;-----------------------
                                   4138 ; BASIC: NEW
                                   4139 ; from command line only 
                                   4140 ; free program memory
                                   4141 ; and clear variables 
                                   4142 ;------------------------
      0097ED                       4143 new: 
      0097ED 72 01 00 25 02   [ 2] 4144 	btjf flags,#FRUN,0$ 
      0097F2 4F               [ 1] 4145 	clr a 
      0097F3 81               [ 4] 4146 	ret 
      0097F4                       4147 0$:	
      0097F4 CD 85 59         [ 4] 4148 	call clear_basic 
      0097F7 81               [ 4] 4149 	ret 
                                   4150 	 
                                   4151 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4152 ;   file system routines
                                   4153 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4154 
                                   4155 ;--------------------
                                   4156 ; input:
                                   4157 ;   X     increment 
                                   4158 ; output:
                                   4159 ;   farptr  incremented 
                                   4160 ;---------------------
      0097F8                       4161 incr_farptr:
      0097F8 72 BB 00 15      [ 2] 4162 	addw x,farptr+1 
      0097FC 24 04            [ 1] 4163 	jrnc 1$
      0097FE 72 5C 00 14      [ 1] 4164 	inc farptr 
      009802 CF 00 15         [ 2] 4165 1$:	ldw farptr+1,x  
      009805 81               [ 4] 4166 	ret 
                                   4167 
                                   4168 ;------------------------------
                                   4169 ; extended flash memory used as FLASH_DRIVE 
                                   4170 ; seek end of used flash drive   
                                   4171 ; starting at 0x10000 address.
                                   4172 ; 4 consecutives 0 bytes signal free space. 
                                   4173 ; input:
                                   4174 ;	none
                                   4175 ; output:
                                   4176 ;   ffree     free_addr| 0 if memory full.
                                   4177 ;------------------------------
      009806                       4178 seek_fdrive:
      009806 A6 01            [ 1] 4179 	ld a,#1
      009808 C7 00 14         [ 1] 4180 	ld farptr,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      00980B 5F               [ 1] 4181 	clrw x 
      00980C CF 00 15         [ 2] 4182 	ldw farptr+1,x 
      00980F                       4183 1$:
      00980F 5F               [ 1] 4184 	clrw x 
      009810 92 AF 00 14      [ 5] 4185 	ldf a,([farptr],x) 
      009814 26 15            [ 1] 4186 	jrne 2$
      009816 5C               [ 1] 4187 	incw x 
      009817 92 AF 00 14      [ 5] 4188 	ldf a,([farptr],x)
      00981B 26 0E            [ 1] 4189 	jrne 2$ 
      00981D 5C               [ 1] 4190 	incw x 
      00981E 92 AF 00 14      [ 5] 4191 	ldf a,([farptr],x)
      009822 26 07            [ 1] 4192 	jrne 2$ 
      009824 5C               [ 1] 4193 	incw x 
      009825 92 AF 00 14      [ 5] 4194 	ldf a,([farptr],x)
      009829 27 28            [ 1] 4195 	jreq 4$ 
      00982B                       4196 2$: 
      00982B 1C 00 01         [ 2] 4197 	addw x,#1
      00982E CD 97 F8         [ 4] 4198 	call incr_farptr
      009831 AE 02 7F         [ 2] 4199 	ldw x,#0x27f 
      009834 C3 00 14         [ 2] 4200 	cpw x,farptr
      009837 2A D6            [ 1] 4201 	jrpl 1$
      009839 72 5F 00 17      [ 1] 4202 	clr ffree 
      00983D 72 5F 00 18      [ 1] 4203 	clr ffree+1 
      009841 72 5F 00 19      [ 1] 4204 	clr ffree+2 
      009845 72 5F 00 09      [ 1] 4205 	clr acc24 
      009849 72 5F 00 0A      [ 1] 4206 	clr acc16
      00984D 72 5F 00 0B      [ 1] 4207 	clr acc8 
      009851 20 1A            [ 2] 4208 	jra 5$
      009853                       4209 4$: ; copy farptr to ffree	 
      009853 CE 00 15         [ 2] 4210 	ldw x,farptr+1 
      009856 A3 00 00         [ 2] 4211 	cpw x,#fdrive 
      009859 27 06            [ 1] 4212 	jreq 41$
                                   4213 	; there is a file, last 0 of that file must be skipped.
      00985B AE 00 01         [ 2] 4214 	ldw x,#1
      00985E CD 97 F8         [ 4] 4215 	call incr_farptr
      009861                       4216 41$: 
      009861 CE 00 14         [ 2] 4217 	ldw x,farptr 
      009864 C6 00 16         [ 1] 4218 	ld a,farptr+2 
      009867 CF 00 17         [ 2] 4219 	ldw ffree,x 
      00986A C7 00 19         [ 1] 4220 	ld ffree+2,a  
      00986D 81               [ 4] 4221 5$:	ret 
                                   4222 
                                   4223 ;-----------------------
                                   4224 ; compare file name 
                                   4225 ; with name pointed by Y  
                                   4226 ; input:
                                   4227 ;   farptr   file name 
                                   4228 ;   Y        target name 
                                   4229 ; output:
                                   4230 ;   farptr 	 at file_name
                                   4231 ;   X 		 farptr[x] point at size field  
                                   4232 ;   Carry    0|1 no match|match  
                                   4233 ;----------------------
      00986E                       4234 cmp_name:
      00986E 5F               [ 1] 4235 	clrw x
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      00986F 92 AF 00 14      [ 5] 4236 1$:	ldf a,([farptr],x)
      009873 90 F1            [ 1] 4237 	cp a,(y)
      009875 26 08            [ 1] 4238 	jrne 4$
      009877 4D               [ 1] 4239 	tnz a 
      009878 27 12            [ 1] 4240 	jreq 9$ 
      00987A 5C               [ 1] 4241     incw x 
      00987B 90 5C            [ 1] 4242 	incw y 
      00987D 20 F0            [ 2] 4243 	jra 1$
      00987F                       4244 4$: ;no match 
      00987F 4D               [ 1] 4245 	tnz a 
      009880 27 07            [ 1] 4246 	jreq 5$
      009882 5C               [ 1] 4247 	incw x 
      009883 92 AF 00 14      [ 5] 4248 	ldf a,([farptr],x)
      009887 20 F6            [ 2] 4249 	jra 4$  
      009889 5C               [ 1] 4250 5$:	incw x ; farptr[x] point at 'size' field 
      00988A 98               [ 1] 4251 	rcf 
      00988B 81               [ 4] 4252 	ret
      00988C                       4253 9$: ; match  
      00988C 5C               [ 1] 4254 	incw x  ; farptr[x] at 'size' field 
      00988D 99               [ 1] 4255 	scf 
      00988E 81               [ 4] 4256 	ret 
                                   4257 
                                   4258 ;-----------------------
                                   4259 ; search file in 
                                   4260 ; flash memory 
                                   4261 ; input:
                                   4262 ;   Y       file name  
                                   4263 ; output:
                                   4264 ;   farptr  addr at name|0
                                   4265 ;-----------------------
                           000001  4266 	FSIZE=1
                           000003  4267 	YSAVE=3
                           000004  4268 	VSIZE=4 
      00988F                       4269 search_file: 
      00180F                       4270 	_vars VSIZE
      00988F 52 04            [ 2]    1     sub sp,#VSIZE 
      009891 17 03            [ 2] 4271 	ldw (YSAVE,sp),y  
      009893 5F               [ 1] 4272 	clrw x 
      009894 CF 00 15         [ 2] 4273 	ldw farptr+1,x 
      009897 35 01 00 14      [ 1] 4274 	mov farptr,#1
      00989B                       4275 1$:	
                                   4276 ; check if farptr is after any file 
                                   4277 ; if  0 then so.
      00989B 92 BC 00 14      [ 5] 4278 	ldf a,[farptr]
      00989F 27 24            [ 1] 4279 	jreq 6$
      0098A1 5F               [ 1] 4280 2$: clrw x 	
      0098A2 16 03            [ 2] 4281 	ldw y,(YSAVE,sp) 
      0098A4 CD 98 6E         [ 4] 4282 	call cmp_name
      0098A7 25 2C            [ 1] 4283 	jrc 9$
      0098A9 92 AF 00 14      [ 5] 4284 	ldf a,([farptr],x)
      0098AD 6B 01            [ 1] 4285 	ld (FSIZE,sp),a 
      0098AF 5C               [ 1] 4286 	incw x 
      0098B0 92 AF 00 14      [ 5] 4287 	ldf a,([farptr],x)
      0098B4 6B 02            [ 1] 4288 	ld (FSIZE+1,sp),a 
      0098B6 5C               [ 1] 4289 	incw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      0098B7 72 FB 01         [ 2] 4290 	addw x,(FSIZE,sp) ; count to skip 
      0098BA CD 97 F8         [ 4] 4291 	call incr_farptr ; now at next file 'name_field'
      0098BD AE 02 80         [ 2] 4292 	ldw x,#0x280
      0098C0 C3 00 14         [ 2] 4293 	cpw x,farptr 
      0098C3 2A D6            [ 1] 4294 	jrpl 1$
      0098C5                       4295 6$: ; file not found 
      0098C5 72 5F 00 14      [ 1] 4296 	clr farptr
      0098C9 72 5F 00 15      [ 1] 4297 	clr farptr+1 
      0098CD 72 5F 00 16      [ 1] 4298 	clr farptr+2 
      001851                       4299 	_drop VSIZE 
      0098D1 5B 04            [ 2]    1     addw sp,#VSIZE 
      0098D3 98               [ 1] 4300 	rcf
      0098D4 81               [ 4] 4301 	ret
      0098D5                       4302 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      001855                       4303 	_drop VSIZE 
      0098D5 5B 04            [ 2]    1     addw sp,#VSIZE 
      0098D7 99               [ 1] 4304 	scf 	
      0098D8 81               [ 4] 4305 	ret
                                   4306 
                                   4307 ;--------------------------------
                                   4308 ; BASIC: SAVE "name" 
                                   4309 ; save text program in 
                                   4310 ; flash memory used as 
                                   4311 ;--------------------------------
      0098D9                       4312 save:
      0098D9 72 01 00 25 05   [ 2] 4313 	btjf flags,#FRUN,0$ 
      0098DE A6 07            [ 1] 4314 	ld a,#ERR_CMD_ONLY 
      0098E0 CC 86 7D         [ 2] 4315 	jp tb_error
      0098E3                       4316 0$:	 
      0098E3 CE 00 1E         [ 2] 4317 	ldw x,txtend 
      0098E6 72 B0 00 1C      [ 2] 4318 	subw x,txtbgn
      0098EA 26 02            [ 1] 4319 	jrne 10$
                                   4320 ; nothing to save 
      0098EC 4F               [ 1] 4321 	clr a 
      0098ED 81               [ 4] 4322 	ret 
      0098EE                       4323 10$:	
      0098EE C6 00 17         [ 1] 4324 	ld a,ffree 
      0098F1 CA 00 18         [ 1] 4325 	or a,ffree+1
      0098F4 CA 00 19         [ 1] 4326 	or a,ffree+2 
      0098F7 26 05            [ 1] 4327 	jrne 1$
      0098F9 A6 01            [ 1] 4328 	ld a,#ERR_MEM_FULL
      0098FB CC 86 7D         [ 2] 4329 	jp tb_error 
      0098FE CD 8C 66         [ 4] 4330 1$: call get_token	
      009901 A1 06            [ 1] 4331 	cp a,#TK_QSTR
      009903 27 03            [ 1] 4332 	jreq 2$
      009905 CC 86 7B         [ 2] 4333 	jp syntax_error
      009908                       4334 2$: ; check for existing file of that name 
      009908 90 93            [ 1] 4335 	ldw y,x ; file name pointer 
      00990A CD 98 8F         [ 4] 4336 	call search_file 
      00990D 24 05            [ 1] 4337 	jrnc 3$ 
      00990F A6 08            [ 1] 4338 	ld a,#ERR_DUPLICATE 
      009911 CC 86 7D         [ 2] 4339 	jp tb_error 
      009914                       4340 3$:	;** write file name to flash **
      009914 CE 00 17         [ 2] 4341 	ldw x,ffree 
      009917 C6 00 19         [ 1] 4342 	ld a,ffree+2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      00991A CF 00 14         [ 2] 4343 	ldw farptr,x 
      00991D C7 00 16         [ 1] 4344 	ld farptr+2,a 
      009920 AE 17 18         [ 2] 4345 	ldw x,#pad  
      009923 CD 82 F2         [ 4] 4346 	call strlen 
      009926 5C               [ 1] 4347 	incw  x
      009927 89               [ 2] 4348 	pushw x 
      009928 5F               [ 1] 4349 	clrw x   
      009929 90 AE 17 18      [ 2] 4350 	ldw y,#pad 
      00992D CD 81 D1         [ 4] 4351 	call write_block  
      0018B0                       4352 	_drop 2 ; drop pushed X 
      009930 5B 02            [ 2]    1     addw sp,#2 
                                   4353 ;** write file length after name **
      009932 CE 00 1E         [ 2] 4354 	ldw x,txtend 
      009935 72 B0 00 1C      [ 2] 4355 	subw x,txtbgn
      009939 89               [ 2] 4356 	pushw x ; file size 
      00993A 5F               [ 1] 4357 	clrw x 
      00993B 7B 01            [ 1] 4358 	ld a,(1,sp)
      00993D CD 81 5C         [ 4] 4359 	call write_byte 
      009940 5C               [ 1] 4360 	incw x 
      009941 7B 02            [ 1] 4361 	ld a,(2,sp)
      009943 CD 81 5C         [ 4] 4362 	call write_byte
      009946 5C               [ 1] 4363 	incw x  
      009947 CD 97 F8         [ 4] 4364 	call incr_farptr ; move farptr after SIZE field 
                                   4365 ;** write BASIC text **
                                   4366 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      00994A 1E 01            [ 2] 4367 	ldw x,(1,sp)
      00994C 89               [ 2] 4368 	pushw x 
      00994D 5F               [ 1] 4369 	clrw x 
      00994E 90 CE 00 1C      [ 2] 4370 	ldw y,txtbgn  ; BASIC text to save 
      009952 CD 81 D1         [ 4] 4371 	call write_block 
      0018D5                       4372 	_drop 2 ;  drop BSIZE argument
      009955 5B 02            [ 2]    1     addw sp,#2 
                                   4373 ; save farptr in ffree
      009957 CE 00 14         [ 2] 4374 	ldw x,farptr 
      00995A C6 00 16         [ 1] 4375 	ld a,farptr+2 
      00995D CF 00 17         [ 2] 4376 	ldw ffree,x 
      009960 C7 00 19         [ 1] 4377 	ld ffree+2,a
                                   4378 ; write 4 zero bytes as a safe gard 
      009963 5F               [ 1] 4379     clrw x 
      009964 4F               [ 1] 4380 	clr a 
      009965 CD 81 5C         [ 4] 4381 	call write_byte 
      009968 5C               [ 1] 4382 	incw x 
      009969 4F               [ 1] 4383 	clr a 
      00996A CD 81 5C         [ 4] 4384 	call write_byte
      00996D 5C               [ 1] 4385 	incw x 
      00996E 4F               [ 1] 4386 	clr a 
      00996F CD 81 5C         [ 4] 4387 	call write_byte
                                   4388 ; display saved size  
      009972 85               [ 2] 4389 	popw x ; first copy of BSIZE 
      009973 A6 0A            [ 1] 4390 	ld a,#TK_INTGR 
      009975 81               [ 4] 4391 	ret 
                                   4392 
                                   4393 
                                   4394 ;------------------------
                                   4395 ; BASIC: LOAD "file" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



                                   4396 ; load file to RAM 
                                   4397 ; for execution 
                                   4398 ;------------------------
      009976                       4399 load:
      009976 72 01 00 25 07   [ 2] 4400 	btjf flags,#FRUN,0$ 
      00997B 27 05            [ 1] 4401 	jreq 0$ 
      00997D A6 07            [ 1] 4402 	ld a,#ERR_CMD_ONLY 
      00997F CC 86 7D         [ 2] 4403 	jp tb_error 
      009982                       4404 0$:	
      009982 CD 8C 66         [ 4] 4405 	call get_token 
      009985 A1 06            [ 1] 4406 	cp a,#TK_QSTR
      009987 27 03            [ 1] 4407 	jreq 1$
      009989 CC 86 7B         [ 2] 4408 	jp syntax_error 
      00998C                       4409 1$:	
      00998C 90 93            [ 1] 4410 	ldw y,x 
      00998E CD 98 8F         [ 4] 4411 	call search_file 
      009991 25 05            [ 1] 4412 	jrc 2$ 
      009993 A6 09            [ 1] 4413 	ld a,#ERR_NOT_FILE
      009995 CC 86 7D         [ 2] 4414 	jp tb_error  
      009998                       4415 2$:	
      009998 CD 97 F8         [ 4] 4416 	call incr_farptr  
      00999B CD 85 59         [ 4] 4417 	call clear_basic  
      00999E 5F               [ 1] 4418 	clrw x
      00999F 92 AF 00 14      [ 5] 4419 	ldf a,([farptr],x)
      0099A3 90 95            [ 1] 4420 	ld yh,a 
      0099A5 5C               [ 1] 4421 	incw x  
      0099A6 92 AF 00 14      [ 5] 4422 	ldf a,([farptr],x)
      0099AA 5C               [ 1] 4423 	incw x 
      0099AB 90 97            [ 1] 4424 	ld yl,a 
      0099AD 72 B9 00 1C      [ 2] 4425 	addw y,txtbgn
      0099B1 90 CF 00 1E      [ 2] 4426 	ldw txtend,y
      0099B5 90 CE 00 1C      [ 2] 4427 	ldw y,txtbgn
      0099B9                       4428 3$:	; load BASIC text 	
      0099B9 92 AF 00 14      [ 5] 4429 	ldf a,([farptr],x)
      0099BD 90 F7            [ 1] 4430 	ld (y),a 
      0099BF 5C               [ 1] 4431 	incw x 
      0099C0 90 5C            [ 1] 4432 	incw y 
      0099C2 90 C3 00 1E      [ 2] 4433 	cpw y,txtend 
      0099C6 2B F1            [ 1] 4434 	jrmi 3$
                                   4435 ; return loaded size 	 
      0099C8 CE 00 1E         [ 2] 4436 	ldw x,txtend 
      0099CB 72 B0 00 1C      [ 2] 4437 	subw x,txtbgn
      0099CF CD 88 CE         [ 4] 4438 	call print_int 
      0099D2 81               [ 4] 4439 	ret 
                                   4440 
                                   4441 ;-----------------------------------
                                   4442 ; BASIC: FORGET ["file_name"] 
                                   4443 ; erase file_name and all others 
                                   4444 ; after it. 
                                   4445 ; without argument erase all files 
                                   4446 ;-----------------------------------
      0099D3                       4447 forget:
      0099D3 CD 8C 66         [ 4] 4448 	call get_token 
      0099D6 A1 00            [ 1] 4449 	cp a,#TK_NONE 
      0099D8 27 1B            [ 1] 4450 	jreq 3$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      0099DA A1 06            [ 1] 4451 	cp a,#TK_QSTR
      0099DC 27 03            [ 1] 4452 	jreq 1$
      0099DE CC 86 7B         [ 2] 4453 	jp syntax_error
      0099E1 90 93            [ 1] 4454 1$: ldw y,x
      0099E3 CD 98 8F         [ 4] 4455 	call search_file
      0099E6 25 05            [ 1] 4456 	jrc 2$
      0099E8 A6 09            [ 1] 4457 	ld a,#ERR_NOT_FILE 
      0099EA CC 86 7D         [ 2] 4458 	jp tb_error 
      0099ED                       4459 2$: 
      0099ED CE 00 14         [ 2] 4460 	ldw x,farptr
      0099F0 C6 00 16         [ 1] 4461 	ld a,farptr+2
      0099F3 20 0B            [ 2] 4462 	jra 4$ 
      0099F5                       4463 3$: ; forget all files 
      0099F5 AE 00 00         [ 2] 4464 	ldw x,#fdrive
      0099F8 4F               [ 1] 4465 	clr a 
      0099F9 01               [ 1] 4466 	rrwa x 
      0099FA CF 00 14         [ 2] 4467 	ldw farptr,x 
      0099FD C7 00 16         [ 1] 4468 	ld farptr+2,a 
      009A00                       4469 4$:
      009A00 CF 00 17         [ 2] 4470 	ldw ffree,x 
      009A03 C7 00 19         [ 1] 4471 	ld ffree+2,a 
      009A06 5F               [ 1] 4472 5$:	clrw x 
      009A07 4F               [ 1] 4473 	clr a  
      009A08 CD 81 5C         [ 4] 4474 	call write_byte 
      009A0B AE 00 01         [ 2] 4475 	ldw x,#1 
      009A0E CD 97 F8         [ 4] 4476 	call incr_farptr
      009A11 C6 00 14         [ 1] 4477 	ld a,farptr
      009A14 C1 00 17         [ 1] 4478 	cp a,ffree 
      009A17 2B ED            [ 1] 4479 	jrmi 5$ 
      009A19 CE 00 15         [ 2] 4480 	ldw x,farptr+1 
      009A1C C3 00 18         [ 2] 4481 	cpw x,ffree+1
      009A1F 2B E5            [ 1] 4482 	jrmi 5$
      009A21 81               [ 4] 4483 	ret 
                                   4484 
                                   4485 ;----------------------
                                   4486 ; BASIC: DIR 
                                   4487 ; list saved files 
                                   4488 ;----------------------
                           000001  4489 	COUNT=1 ; files counter 
                           000002  4490 	VSIZE=2 
      009A22                       4491 directory:
      0019A2                       4492 	_vars VSIZE 
      009A22 52 02            [ 2]    1     sub sp,#VSIZE 
      009A24 5F               [ 1] 4493 	clrw x 
      009A25 1F 01            [ 2] 4494 	ldw (COUNT,sp),x 
      009A27 CF 00 15         [ 2] 4495 	ldw farptr+1,x 
      009A2A 35 01 00 14      [ 1] 4496 	mov farptr,#1 
      009A2E                       4497 dir_loop:
      009A2E 5F               [ 1] 4498 	clrw x 
      009A2F 92 AF 00 14      [ 5] 4499 	ldf a,([farptr],x)
      009A33 27 38            [ 1] 4500 	jreq 8$ 
      009A35                       4501 1$: ;name loop 	
      009A35 92 AF 00 14      [ 5] 4502 	ldf a,([farptr],x)
      009A39 27 06            [ 1] 4503 	jreq 2$ 
      009A3B CD 82 1E         [ 4] 4504 	call putc 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009A3E 5C               [ 1] 4505 	incw x 
      009A3F 20 F4            [ 2] 4506 	jra 1$
      009A41 5C               [ 1] 4507 2$: incw x ; skip ending 0. 
      009A42 A6 20            [ 1] 4508 	ld a,#SPACE 
      009A44 CD 82 1E         [ 4] 4509 	call putc 
                                   4510 ; get file size 	
      009A47 92 AF 00 14      [ 5] 4511 	ldf a,([farptr],x)
      009A4B 90 95            [ 1] 4512 	ld yh,a 
      009A4D 5C               [ 1] 4513 	incw x 
      009A4E 92 AF 00 14      [ 5] 4514 	ldf a,([farptr],x)
      009A52 5C               [ 1] 4515 	incw x 
      009A53 90 97            [ 1] 4516 	ld yl,a 
      009A55 90 89            [ 2] 4517 	pushw y 
      009A57 72 FB 01         [ 2] 4518 	addw x,(1,sp)
      009A5A CD 97 F8         [ 4] 4519 	call incr_farptr 
      009A5D 85               [ 2] 4520 	popw x ; file size 
      009A5E CD 88 CE         [ 4] 4521 	call print_int 
      009A61 A6 0D            [ 1] 4522 	ld a,#CR 
      009A63 CD 82 1E         [ 4] 4523 	call putc
      009A66 1E 01            [ 2] 4524 	ldw x,(COUNT,sp)
      009A68 5C               [ 1] 4525 	incw x
      009A69 1F 01            [ 2] 4526 	ldw (COUNT,sp),x  
      009A6B 20 C1            [ 2] 4527 	jra dir_loop 
      009A6D                       4528 8$: ; print number of files 
      009A6D 1E 01            [ 2] 4529 	ldw x,(COUNT,sp)
      009A6F CD 88 CE         [ 4] 4530 	call print_int 
      009A72 AE 9A A2         [ 2] 4531 	ldw x,#file_count 
      009A75 CD 82 30         [ 4] 4532 	call puts  
                                   4533 ; print drive free space 	
      009A78 A6 FF            [ 1] 4534 	ld a,#0xff 
      009A7A C0 00 19         [ 1] 4535 	sub a,ffree+2 
      009A7D C7 00 0B         [ 1] 4536 	ld acc8,a 
      009A80 A6 7F            [ 1] 4537 	ld a,#0x7f 
      009A82 C2 00 18         [ 1] 4538 	sbc a,ffree+1 
      009A85 C7 00 0A         [ 1] 4539 	ld acc16,a 
      009A88 A6 02            [ 1] 4540 	ld a,#2 
      009A8A C2 00 17         [ 1] 4541 	sbc a,ffree 
      009A8D C7 00 09         [ 1] 4542 	ld acc24,a 
      009A90 5F               [ 1] 4543 	clrw x  
      009A91 A6 06            [ 1] 4544 	ld a,#6 
      009A93 97               [ 1] 4545 	ld xl,a 
      009A94 A6 0A            [ 1] 4546 	ld a,#10 
      009A96 CD 88 86         [ 4] 4547 	call prti24 
      009A99 AE 9A AA         [ 2] 4548 	ldw x,#drive_free
      009A9C CD 82 30         [ 4] 4549 	call puts 
      001A1F                       4550 	_drop VSIZE 
      009A9F 5B 02            [ 2]    1     addw sp,#VSIZE 
      009AA1 81               [ 4] 4551 	ret
      009AA2 20 66 69 6C 65 73 0A  4552 file_count: .asciz " files\n"
             00
      009AAA 20 62 79 74 65 73 20  4553 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   4554 
                                   4555 ;---------------------
                                   4556 ; BASIC: WRITE expr1,expr2[,expr]* 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4557 ; write 1 or more byte to FLASH or EEPROM
                                   4558 ; starting at address  
                                   4559 ; input:
                                   4560 ;   expr1  	is address 
                                   4561 ;   expr2   is byte to write
                                   4562 ; output:
                                   4563 ;   none 
                                   4564 ;---------------------
                           000001  4565 	ADDR=1
                           000002  4566 	VSIZ=2 
      009AB7                       4567 write:
      001A37                       4568 	_vars VSIZE 
      009AB7 52 02            [ 2]    1     sub sp,#VSIZE 
      009AB9 72 5F 00 14      [ 1] 4569 	clr farptr ; expect 16 bits address 
      009ABD CD 91 F2         [ 4] 4570 	call expression
      009AC0 A1 0A            [ 1] 4571 	cp a,#TK_INTGR 
      009AC2 27 03            [ 1] 4572 	jreq 0$
      009AC4 CC 86 7B         [ 2] 4573 	jp syntax_error
      009AC7 1F 01            [ 2] 4574 0$: ldw (ADDR,sp),x 
      009AC9 CD 8C 66         [ 4] 4575 	call get_token 
      009ACC A1 08            [ 1] 4576 	cp a,#TK_COMMA 
      009ACE 27 02            [ 1] 4577 	jreq 1$ 
      009AD0 20 19            [ 2] 4578 	jra 9$ 
      009AD2 CD 91 F2         [ 4] 4579 1$:	call expression
      009AD5 A1 0A            [ 1] 4580 	cp a,#TK_INTGR
      009AD7 27 03            [ 1] 4581 	jreq 2$
      009AD9 CC 86 7B         [ 2] 4582 	jp syntax_error
      009ADC 9F               [ 1] 4583 2$:	ld a,xl 
      009ADD 1E 01            [ 2] 4584 	ldw x,(ADDR,sp) 
      009ADF CF 00 15         [ 2] 4585 	ldw farptr+1,x 
      009AE2 5F               [ 1] 4586 	clrw x 
      009AE3 CD 81 5C         [ 4] 4587 	call write_byte
      009AE6 1E 01            [ 2] 4588 	ldw x,(ADDR,sp)
      009AE8 5C               [ 1] 4589 	incw x 
      009AE9 20 DC            [ 2] 4590 	jra 0$ 
      009AEB                       4591 9$:
      001A6B                       4592 	_drop VSIZE
      009AEB 5B 02            [ 2]    1     addw sp,#VSIZE 
      009AED 81               [ 4] 4593 	ret 
                                   4594 
                                   4595 
                                   4596 ;---------------------
                                   4597 ;BASIC: CHAR(expr)
                                   4598 ; évaluate expression 
                                   4599 ; and take the 7 least 
                                   4600 ; bits as ASCII character
                                   4601 ;---------------------
      009AEE                       4602 char:
      009AEE A6 04            [ 1] 4603 	ld a,#TK_LPAREN 
      009AF0 CD 90 ED         [ 4] 4604 	call expect 
      009AF3 CD 92 36         [ 4] 4605 	call relation 
      009AF6 A1 0A            [ 1] 4606 	cp a,#TK_INTGR 
      009AF8 27 03            [ 1] 4607 	jreq 1$
      009AFA CC 86 7B         [ 2] 4608 	jp syntax_error
      009AFD 89               [ 2] 4609 1$:	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      009AFE A6 05            [ 1] 4610 	ld a,#TK_RPAREN 
      009B00 CD 90 ED         [ 4] 4611 	call expect
      009B03 85               [ 2] 4612 	popw x  
      009B04 9F               [ 1] 4613 	ld a,xl 
      009B05 A4 7F            [ 1] 4614 	and a,#0x7f 
      009B07 97               [ 1] 4615 	ld xl,a
      009B08 A6 0B            [ 1] 4616 	ld a,#TK_CHAR
      009B0A 81               [ 4] 4617 	ret
                                   4618 
                                   4619 ;---------------------
                                   4620 ; BASIC: ASC(string|char)
                                   4621 ; extract first character 
                                   4622 ; of string argument 
                                   4623 ; return it as TK_INTGR 
                                   4624 ;---------------------
      009B0B                       4625 ascii:
      009B0B A6 04            [ 1] 4626 	ld a,#TK_LPAREN
      009B0D CD 90 ED         [ 4] 4627 	call expect 
      009B10 CD 8C 66         [ 4] 4628 	call get_token 
      009B13 A1 06            [ 1] 4629 	cp a,#TK_QSTR 
      009B15 27 07            [ 1] 4630 	jreq 1$
      009B17 A1 0B            [ 1] 4631 	cp a,#TK_CHAR 
      009B19 27 06            [ 1] 4632 	jreq 2$ 
      009B1B CC 86 7B         [ 2] 4633 	jp syntax_error
      009B1E                       4634 1$: 
      009B1E F6               [ 1] 4635 	ld a,(x)
      009B1F 20 01            [ 2] 4636 	jra 3$
      009B21                       4637 2$: 
      009B21 9F               [ 1] 4638 	ld a,xl 
      009B22 97               [ 1] 4639 3$:	ld xl,a 
      009B23 4F               [ 1] 4640 	clr a  
      009B24 95               [ 1] 4641 	ld xh,a 
      009B25 89               [ 2] 4642 	pushw x  
      009B26 A6 05            [ 1] 4643 	ld a,#TK_RPAREN 
      009B28 CD 90 ED         [ 4] 4644 	call expect 
      009B2B 85               [ 2] 4645 	popw x 
      009B2C A6 0A            [ 1] 4646 	ld a,#TK_INTGR 
      009B2E 81               [ 4] 4647 	ret 
                                   4648 
                                   4649 ;---------------------
                                   4650 ;BASIC: KEY
                                   4651 ; wait for a character 
                                   4652 ; received from STDIN 
                                   4653 ; input:
                                   4654 ;	none 
                                   4655 ; output:
                                   4656 ;	X 		ASCII character 
                                   4657 ;---------------------
      009B2F                       4658 key:
      009B2F CD 82 27         [ 4] 4659 	call getc 
      009B32 5F               [ 1] 4660 	clrw x 
      009B33 97               [ 1] 4661 	ld xl,a 
      009B34 A6 0A            [ 1] 4662 	ld a,#TK_INTGR
      009B36 81               [ 4] 4663 	ret
                                   4664 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4665 ;----------------------
                                   4666 ; BASIC: QKEY
                                   4667 ; Return true if there 
                                   4668 ; is a character in 
                                   4669 ; waiting in STDIN 
                                   4670 ; input:
                                   4671 ;  none 
                                   4672 ; output:
                                   4673 ;   X 		0|1 
                                   4674 ;-----------------------
      009B37                       4675 qkey: 
      009B37 5F               [ 1] 4676 	clrw x 
      009B38 72 0B 52 40 01   [ 2] 4677 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      009B3D 5C               [ 1] 4678 	incw x 
      009B3E A6 0A            [ 1] 4679 9$: ld a,#TK_INTGR
      009B40 81               [ 4] 4680 	ret 
                                   4681 
                                   4682 ;---------------------
                                   4683 ; BASIC: GPIO(expr,reg)
                                   4684 ; return gpio address 
                                   4685 ; expr {0..8}
                                   4686 ; input:
                                   4687 ;   none 
                                   4688 ; output:
                                   4689 ;   X 		gpio register address
                                   4690 ;----------------------------
      009B41                       4691 gpio:
      009B41 A6 04            [ 1] 4692 	ld a,#TK_LPAREN 
      009B43 CD 90 ED         [ 4] 4693 	call expect 
      009B46 CD 90 FA         [ 4] 4694 	call arg_list
      009B49 A1 02            [ 1] 4695 	cp a,#2
      009B4B 27 03            [ 1] 4696 	jreq 1$
      009B4D CC 86 7B         [ 2] 4697 	jp syntax_error  
      009B50                       4698 1$:	
      009B50 A6 05            [ 1] 4699 	ld a,#TK_RPAREN 
      009B52 CD 90 ED         [ 4] 4700 	call expect 
      009B55 AE 00 02         [ 2] 4701 	ldw x,#2
      009B58 72 DE 00 1A      [ 5] 4702 	ldw x,([dstkptr],x) ; port 
      009B5C 2B 1B            [ 1] 4703 	jrmi bad_port
      009B5E A3 00 09         [ 2] 4704 	cpw x,#9
      009B61 2A 16            [ 1] 4705 	jrpl bad_port
      009B63 A6 05            [ 1] 4706 	ld a,#5
      009B65 42               [ 4] 4707 	mul x,a
      009B66 1C 50 00         [ 2] 4708 	addw x,#GPIO_BASE 
      009B69 89               [ 2] 4709 	pushw x 
      009B6A CD 8F 09         [ 4] 4710 	call dpop 
      009B6D 72 FB 01         [ 2] 4711 	addw x,(1,sp)
      009B70 1F 01            [ 2] 4712 	ldw (1,sp),x  
      009B72 CD 8F 30         [ 4] 4713 	call ddrop  
      009B75 85               [ 2] 4714 	popw x 
      009B76 A6 0A            [ 1] 4715 	ld a,#TK_INTGR
      009B78 81               [ 4] 4716 	ret
      009B79                       4717 bad_port:
      009B79 A6 0A            [ 1] 4718 	ld a,#ERR_BAD_VALUE
      009B7B CC 86 7D         [ 2] 4719 	jp tb_error
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4720 
                                   4721 ;----------------------
                                   4722 ; BASIC: ODR 
                                   4723 ; return offset of gpio
                                   4724 ; ODR register: 0
                                   4725 ; ---------------------
      009B7E                       4726 port_odr:
      009B7E AE 00 00         [ 2] 4727 	ldw x,#GPIO_ODR
      009B81 A6 0A            [ 1] 4728 	ld a,#TK_INTGR
      009B83 81               [ 4] 4729 	ret
                                   4730 
                                   4731 ;----------------------
                                   4732 ; BASIC: IDR 
                                   4733 ; return offset of gpio
                                   4734 ; IDR register: 1
                                   4735 ; ---------------------
      009B84                       4736 port_idr:
      009B84 AE 00 01         [ 2] 4737 	ldw x,#GPIO_IDR
      009B87 A6 0A            [ 1] 4738 	ld a,#TK_INTGR
      009B89 81               [ 4] 4739 	ret
                                   4740 
                                   4741 ;----------------------
                                   4742 ; BASIC: DDR 
                                   4743 ; return offset of gpio
                                   4744 ; DDR register: 2
                                   4745 ; ---------------------
      009B8A                       4746 port_ddr:
      009B8A AE 00 02         [ 2] 4747 	ldw x,#GPIO_DDR
      009B8D A6 0A            [ 1] 4748 	ld a,#TK_INTGR
      009B8F 81               [ 4] 4749 	ret
                                   4750 
                                   4751 ;----------------------
                                   4752 ; BASIC: CRL  
                                   4753 ; return offset of gpio
                                   4754 ; CR1 register: 3
                                   4755 ; ---------------------
      009B90                       4756 port_cr1:
      009B90 AE 00 03         [ 2] 4757 	ldw x,#GPIO_CR1
      009B93 A6 0A            [ 1] 4758 	ld a,#TK_INTGR
      009B95 81               [ 4] 4759 	ret
                                   4760 
                                   4761 ;----------------------
                                   4762 ; BASIC: CRH  
                                   4763 ; return offset of gpio
                                   4764 ; CR2 register: 4
                                   4765 ; ---------------------
      009B96                       4766 port_cr2:
      009B96 AE 00 04         [ 2] 4767 	ldw x,#GPIO_CR2
      009B99 A6 0A            [ 1] 4768 	ld a,#TK_INTGR
      009B9B 81               [ 4] 4769 	ret
                                   4770 
                                   4771 ;-------------------------
                                   4772 ; BASIC: UFLASH 
                                   4773 ; return user flash address
                                   4774 ; input:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4775 ;  none 
                                   4776 ; output:
                                   4777 ;	A		TK_INTGR
                                   4778 ;   X 		user address 
                                   4779 ;---------------------------
      009B9C                       4780 uflash:
      009B9C AE 9F 00         [ 2] 4781 	ldw x,#user_space 
      009B9F A6 0A            [ 1] 4782 	ld a,#TK_INTGR 
      009BA1 81               [ 4] 4783 	ret 
                                   4784 
                                   4785 ;-------------------------
                                   4786 ; BASIC: EEPROM 
                                   4787 ; return eeprom address
                                   4788 ; input:
                                   4789 ;  none 
                                   4790 ; output:
                                   4791 ;	A		TK_INTGR
                                   4792 ;   X 		eeprom address 
                                   4793 ;---------------------------
      009BA2                       4794 eeprom:
      009BA2 AE 40 00         [ 2] 4795 	ldw x,#EEPROM_BASE 
      009BA5 A6 0A            [ 1] 4796 	ld a,#TK_INTGR 
      009BA7 81               [ 4] 4797 	ret 
                                   4798 
                                   4799 ;---------------------
                                   4800 ; BASIC: USR(addr[,arg])
                                   4801 ; execute a function written 
                                   4802 ; in binary code.
                                   4803 ; binary fonction should 
                                   4804 ; return token attribute in A 
                                   4805 ; and value in X. 
                                   4806 ; input:
                                   4807 ;   addr	routine address 
                                   4808 ;   arg 	is an optional argument 
                                   4809 ; output:
                                   4810 ;   A 		token attribute 
                                   4811 ;   X       returned value 
                                   4812 ;---------------------
      009BA8                       4813 usr:
      009BA8 90 89            [ 2] 4814 	pushw y 	
      009BAA A6 04            [ 1] 4815 	ld a,#TK_LPAREN 
      009BAC CD 90 ED         [ 4] 4816 	call expect 
      009BAF CD 90 FA         [ 4] 4817 	call arg_list 
      009BB2 A1 01            [ 1] 4818 	cp a,#1 
      009BB4 2A 03            [ 1] 4819 	jrpl 2$ 
      009BB6 CC 86 7B         [ 2] 4820 	jp syntax_error 
      009BB9 A6 05            [ 1] 4821 2$: ld a,#TK_RPAREN
      009BBB CD 90 ED         [ 4] 4822 	call expect 
      009BBE CD 8F 09         [ 4] 4823 	call dpop 
      009BC1 A1 02            [ 1] 4824 	cp a,#2 
      009BC3 2B 05            [ 1] 4825 	jrmi 4$
      009BC5 90 93            [ 1] 4826 	ldw y,x ; y=arg 
      009BC7 CD 8F 09         [ 4] 4827 	call dpop ;x=addr 
      009BCA 51               [ 1] 4828 4$:	exgw y,x ; y=addr,x=arg 
      009BCB 90 FD            [ 4] 4829 	call (y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009BCD 90 85            [ 2] 4830 	popw y 
      009BCF 81               [ 4] 4831 	ret 
                                   4832 
                                   4833 ;------------------------------
                                   4834 ; BASIC: BYE 
                                   4835 ; halt mcu in its lowest power mode 
                                   4836 ; wait for reset or external interrupt
                                   4837 ; do a cold start on wakeup.
                                   4838 ;------------------------------
      009BD0                       4839 bye:
      009BD0 72 0D 52 40 FB   [ 2] 4840 	btjf UART3_SR,#UART_SR_TC,.
      009BD5 8E               [10] 4841 	halt
      009BD6 CC 84 CE         [ 2] 4842 	jp cold_start  
                                   4843 
                                   4844 ;----------------------------------
                                   4845 ; BASIC: SLEEP 
                                   4846 ; halt mcu until reset or external
                                   4847 ; interrupt.
                                   4848 ; Resume progam after SLEEP command
                                   4849 ;----------------------------------
      009BD9                       4850 sleep:
      009BD9 72 0D 52 40 FB   [ 2] 4851 	btjf UART3_SR,#UART_SR_TC,.
      009BDE 72 16 00 25      [ 1] 4852 	bset flags,#FSLEEP
      009BE2 8E               [10] 4853 	halt 
      009BE3 81               [ 4] 4854 	ret 
                                   4855 
                                   4856 ;-------------------------------
                                   4857 ; BASIC: PAUSE expr 
                                   4858 ; suspend execution for n msec.
                                   4859 ; input:
                                   4860 ;	none
                                   4861 ; output:
                                   4862 ;	none 
                                   4863 ;------------------------------
      009BE4                       4864 pause:
      009BE4 CD 91 F2         [ 4] 4865 	call expression
      009BE7 A1 0A            [ 1] 4866 	cp a,#TK_INTGR
      009BE9 27 03            [ 1] 4867 	jreq pause02 
      009BEB CC 86 7B         [ 2] 4868 	jp syntax_error
      009BEE                       4869 pause02: 
      009BEE 5D               [ 2] 4870 1$: tnzw x 
      009BEF 27 04            [ 1] 4871 	jreq 2$
      009BF1 8F               [10] 4872 	wfi 
      009BF2 5A               [ 2] 4873 	decw x 
      009BF3 26 F9            [ 1] 4874 	jrne 1$
      009BF5 4F               [ 1] 4875 2$:	clr a 
      009BF6 81               [ 4] 4876 	ret 
                                   4877 
                                   4878 ;------------------------------
                                   4879 ; BASIC: TICKS
                                   4880 ; return msec ticks counter value 
                                   4881 ; input:
                                   4882 ; 	none 
                                   4883 ; output:
                                   4884 ;	X 		TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                   4885 ;-------------------------------
      009BF7                       4886 get_ticks:
      009BF7 CE 00 0C         [ 2] 4887 	ldw x,ticks 
      009BFA A6 0A            [ 1] 4888 	ld a,#TK_INTGR
      009BFC 81               [ 4] 4889 	ret 
                                   4890 
                                   4891 
                                   4892 
                                   4893 ;------------------------------
                                   4894 ; BASIC: ABS(expr)
                                   4895 ; return absolute value of expr.
                                   4896 ; input:
                                   4897 ;   none
                                   4898 ; output:
                                   4899 ;   X     	positive integer
                                   4900 ;-------------------------------
      009BFD                       4901 abs:
      009BFD A6 04            [ 1] 4902 	ld a,#TK_LPAREN
      009BFF CD 90 ED         [ 4] 4903 	call expect 
      009C02 CD 90 FA         [ 4] 4904 	call arg_list
      009C05 A1 01            [ 1] 4905 	cp a,#1 
      009C07 27 03            [ 1] 4906 	jreq 0$ 
      009C09 CC 86 7B         [ 2] 4907 	jp syntax_error
      009C0C                       4908 0$:  
      009C0C A6 05            [ 1] 4909 	ld a,#TK_RPAREN 
      009C0E CD 90 ED         [ 4] 4910 	call expect 
      009C11 CD 8F 09         [ 4] 4911     call dpop   
      009C14 9E               [ 1] 4912 	ld a,xh 
      009C15 A5 80            [ 1] 4913 	bcp a,#0x80 
      009C17 27 01            [ 1] 4914 	jreq 2$ 
      009C19 50               [ 2] 4915 	negw x 
      009C1A A6 0A            [ 1] 4916 2$: ld a,#TK_INTGR 
      009C1C 81               [ 4] 4917 	ret 
                                   4918 
                                   4919 ;------------------------------
                                   4920 ; BASIC: RND(expr)
                                   4921 ; return random number 
                                   4922 ; between 1 and expr inclusive
                                   4923 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4924 ; input:
                                   4925 ; 	none 
                                   4926 ; output:
                                   4927 ;	X 		random positive integer 
                                   4928 ;------------------------------
      009C1D                       4929 random:
      009C1D A6 04            [ 1] 4930 	ld a,#TK_LPAREN 
      009C1F CD 90 ED         [ 4] 4931 	call expect 
      009C22 CD 90 FA         [ 4] 4932 	call arg_list 
      009C25 A1 01            [ 1] 4933 	cp a,#1
      009C27 27 03            [ 1] 4934 	jreq 1$
      009C29 CC 86 7B         [ 2] 4935 	jp syntax_error
      009C2C A6 05            [ 1] 4936 1$: ld a,#TK_RPAREN
      009C2E CD 90 ED         [ 4] 4937 	call expect 
      009C31 CD 8F 09         [ 4] 4938 	call dpop 
      009C34 89               [ 2] 4939 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009C35 9E               [ 1] 4940 	ld a,xh 
      009C36 A5 80            [ 1] 4941 	bcp a,#0x80 
      009C38 27 05            [ 1] 4942 	jreq 2$
      009C3A A6 0A            [ 1] 4943 	ld a,#ERR_BAD_VALUE
      009C3C CC 86 7D         [ 2] 4944 	jp tb_error
      009C3F                       4945 2$: 
                                   4946 ; acc16=(x<<5)^x 
      009C3F CE 00 0E         [ 2] 4947 	ldw x,seedx 
      009C42 58               [ 2] 4948 	sllw x 
      009C43 58               [ 2] 4949 	sllw x 
      009C44 58               [ 2] 4950 	sllw x 
      009C45 58               [ 2] 4951 	sllw x 
      009C46 58               [ 2] 4952 	sllw x 
      009C47 9E               [ 1] 4953 	ld a,xh 
      009C48 C8 00 0E         [ 1] 4954 	xor a,seedx 
      009C4B C7 00 0A         [ 1] 4955 	ld acc16,a 
      009C4E 9F               [ 1] 4956 	ld a,xl 
      009C4F C8 00 0F         [ 1] 4957 	xor a,seedx+1 
      009C52 C7 00 0B         [ 1] 4958 	ld acc8,a 
                                   4959 ; seedx=seedy 
      009C55 CE 00 10         [ 2] 4960 	ldw x,seedy 
      009C58 CF 00 0E         [ 2] 4961 	ldw seedx,x  
                                   4962 ; seedy=seedy^(seedy>>1)
      009C5B 90 54            [ 2] 4963 	srlw y 
      009C5D 90 9E            [ 1] 4964 	ld a,yh 
      009C5F C8 00 10         [ 1] 4965 	xor a,seedy 
      009C62 C7 00 10         [ 1] 4966 	ld seedy,a  
      009C65 90 9F            [ 1] 4967 	ld a,yl 
      009C67 C8 00 11         [ 1] 4968 	xor a,seedy+1 
      009C6A C7 00 11         [ 1] 4969 	ld seedy+1,a 
                                   4970 ; acc16>>3 
      009C6D CE 00 0A         [ 2] 4971 	ldw x,acc16 
      009C70 54               [ 2] 4972 	srlw x 
      009C71 54               [ 2] 4973 	srlw x 
      009C72 54               [ 2] 4974 	srlw x 
                                   4975 ; x=acc16^x 
      009C73 9E               [ 1] 4976 	ld a,xh 
      009C74 C8 00 0A         [ 1] 4977 	xor a,acc16 
      009C77 95               [ 1] 4978 	ld xh,a 
      009C78 9F               [ 1] 4979 	ld a,xl 
      009C79 C8 00 0B         [ 1] 4980 	xor a,acc8 
      009C7C 97               [ 1] 4981 	ld xl,a 
                                   4982 ; seedy=x^seedy 
      009C7D C8 00 11         [ 1] 4983 	xor a,seedy+1
      009C80 97               [ 1] 4984 	ld xl,a 
      009C81 9E               [ 1] 4985 	ld a,xh 
      009C82 C8 00 10         [ 1] 4986 	xor a,seedy
      009C85 95               [ 1] 4987 	ld xh,a 
      009C86 CF 00 10         [ 2] 4988 	ldw seedy,x 
                                   4989 ; return seedy modulo expr + 1 
      009C89 90 85            [ 2] 4990 	popw y 
      009C8B 65               [ 2] 4991 	divw x,y 
      009C8C 93               [ 1] 4992 	ldw x,y 
      009C8D 5C               [ 1] 4993 	incw x 
      009C8E A6 0A            [ 1] 4994 	ld a,#TK_INTGR
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009C90 81               [ 4] 4995 	ret 
                                   4996 
                                   4997 ;---------------------------------
                                   4998 ; BASIC: WORDS 
                                   4999 ; affiche la listes des mots du
                                   5000 ; dictionnaire.
                                   5001 ;---------------------------------
                           000001  5002 	WLEN=1
                           000002  5003 	LLEN=2  
                           000002  5004 	VSIZE=2 
      009C91                       5005 words:
      001C11                       5006 	_vars VSIZE
      009C91 52 02            [ 2]    1     sub sp,#VSIZE 
      009C93 0F 02            [ 1] 5007 	clr (LLEN,sp)
      009C95 90 AE 9E C0      [ 2] 5008 	ldw y,#kword_dict+2
      009C99 93               [ 1] 5009 0$:	ldw x,y
      009C9A F6               [ 1] 5010 	ld a,(x)
      009C9B A4 0F            [ 1] 5011 	and a,#15 
      009C9D 6B 01            [ 1] 5012 	ld (WLEN,sp),a 
      009C9F 5C               [ 1] 5013 1$:	incw x 
      009CA0 F6               [ 1] 5014 	ld a,(x)
      009CA1 CD 82 1E         [ 4] 5015 	call putc 
      009CA4 0C 02            [ 1] 5016 	inc (LLEN,sp)
      009CA6 0A 01            [ 1] 5017 	dec (WLEN,sp)
      009CA8 26 F5            [ 1] 5018 	jrne 1$
      009CAA A6 46            [ 1] 5019 	ld a,#70
      009CAC 11 02            [ 1] 5020 	cp a,(LLEN,sp)
      009CAE 2B 09            [ 1] 5021 	jrmi 2$   
      009CB0 A6 20            [ 1] 5022 	ld a,#SPACE 
      009CB2 CD 82 1E         [ 4] 5023 	call putc 
      009CB5 0C 02            [ 1] 5024 	inc (LLEN,sp) 
      009CB7 20 07            [ 2] 5025 	jra 3$
      009CB9 A6 0D            [ 1] 5026 2$: ld a,#CR 
      009CBB CD 82 1E         [ 4] 5027 	call putc 
      009CBE 0F 02            [ 1] 5028 	clr (LLEN,sp)
      009CC0 72 A2 00 02      [ 2] 5029 3$:	subw y,#2 
      009CC4 90 FE            [ 2] 5030 	ldw y,(y)
      009CC6 26 D1            [ 1] 5031 	jrne 0$  
      001C48                       5032 	_drop VSIZE 
      009CC8 5B 02            [ 2]    1     addw sp,#VSIZE 
      009CCA 81               [ 4] 5033 	ret 
                                   5034 
                                   5035 
                                   5036 ;*********************************
                                   5037 
                                   5038 ;------------------------------
                                   5039 ;      dictionary 
                                   5040 ; format:
                                   5041 ;   link:   2 bytes 
                                   5042 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   5043 ;   cmd_name: 16 byte max 
                                   5044 ;   code_address: 2 bytes 
                                   5045 ;------------------------------
                           000080  5046 	FFUNC=128 ; function flag 
                                   5047 	.macro _dict_entry len,name,cmd 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                                   5048 	.word LINK 
                                   5049 	LINK=.
                                   5050 name:
                                   5051 	.byte len 	
                                   5052 	.ascii "name"
                                   5053 	.word cmd 
                                   5054 	.endm 
                                   5055 
                           000000  5056 	LINK=0
      009CCB                       5057 kword_end:
      001C4B                       5058 	_dict_entry,3,BYE,bye 
      009CCB 00 00                    1 	.word LINK 
                           001C4D     2 	LINK=.
      009CCD                          3 BYE:
      009CCD 03                       4 	.byte 3 	
      009CCE 42 59 45                 5 	.ascii "BYE"
      009CD1 9B D0                    6 	.word bye 
      001C53                       5059 	_dict_entry,5,WORDS,words 
      009CD3 9C CD                    1 	.word LINK 
                           001C55     2 	LINK=.
      009CD5                          3 WORDS:
      009CD5 05                       4 	.byte 5 	
      009CD6 57 4F 52 44 53           5 	.ascii "WORDS"
      009CDB 9C 91                    6 	.word words 
      001C5D                       5060 	_dict_entry,5,SLEEP,sleep 
      009CDD 9C D5                    1 	.word LINK 
                           001C5F     2 	LINK=.
      009CDF                          3 SLEEP:
      009CDF 05                       4 	.byte 5 	
      009CE0 53 4C 45 45 50           5 	.ascii "SLEEP"
      009CE5 9B D9                    6 	.word sleep 
      001C67                       5061 	_dict_entry,6,FORGET,forget 
      009CE7 9C DF                    1 	.word LINK 
                           001C69     2 	LINK=.
      009CE9                          3 FORGET:
      009CE9 06                       4 	.byte 6 	
      009CEA 46 4F 52 47 45 54        5 	.ascii "FORGET"
      009CF0 99 D3                    6 	.word forget 
      001C72                       5062 	_dict_entry,3,DIR,directory 
      009CF2 9C E9                    1 	.word LINK 
                           001C74     2 	LINK=.
      009CF4                          3 DIR:
      009CF4 03                       4 	.byte 3 	
      009CF5 44 49 52                 5 	.ascii "DIR"
      009CF8 9A 22                    6 	.word directory 
      001C7A                       5063 	_dict_entry,4,LOAD,load 
      009CFA 9C F4                    1 	.word LINK 
                           001C7C     2 	LINK=.
      009CFC                          3 LOAD:
      009CFC 04                       4 	.byte 4 	
      009CFD 4C 4F 41 44              5 	.ascii "LOAD"
      009D01 99 76                    6 	.word load 
      001C83                       5064 	_dict_entry,4,SAVE,save
      009D03 9C FC                    1 	.word LINK 
                           001C85     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009D05                          3 SAVE:
      009D05 04                       4 	.byte 4 	
      009D06 53 41 56 45              5 	.ascii "SAVE"
      009D0A 98 D9                    6 	.word save 
      001C8C                       5065 	_dict_entry,5,WRITE,write  
      009D0C 9D 05                    1 	.word LINK 
                           001C8E     2 	LINK=.
      009D0E                          3 WRITE:
      009D0E 05                       4 	.byte 5 	
      009D0F 57 52 49 54 45           5 	.ascii "WRITE"
      009D14 9A B7                    6 	.word write 
      001C96                       5066 	_dict_entry,3,NEW,new
      009D16 9D 0E                    1 	.word LINK 
                           001C98     2 	LINK=.
      009D18                          3 NEW:
      009D18 03                       4 	.byte 3 	
      009D19 4E 45 57                 5 	.ascii "NEW"
      009D1C 97 ED                    6 	.word new 
      001C9E                       5067 	_dict_entry,5,BREAK,break 
      009D1E 9D 18                    1 	.word LINK 
                           001CA0     2 	LINK=.
      009D20                          3 BREAK:
      009D20 05                       4 	.byte 5 	
      009D21 42 52 45 41 4B           5 	.ascii "BREAK"
      009D26 97 9E                    6 	.word break 
      001CA8                       5068 	_dict_entry,4,BEEP,beep 
      009D28 9D 20                    1 	.word LINK 
                           001CAA     2 	LINK=.
      009D2A                          3 BEEP:
      009D2A 04                       4 	.byte 4 	
      009D2B 42 45 45 50              5 	.ascii "BEEP"
      009D2F 97 08                    6 	.word beep 
      001CB1                       5069 	_dict_entry,4,STOP,stop 
      009D31 9D 2A                    1 	.word LINK 
                           001CB3     2 	LINK=.
      009D33                          3 STOP:
      009D33 04                       4 	.byte 4 	
      009D34 53 54 4F 50              5 	.ascii "STOP"
      009D38 96 F9                    6 	.word stop 
      001CBA                       5070     _dict_entry,4,SHOW,show 
      009D3A 9D 33                    1 	.word LINK 
                           001CBC     2 	LINK=.
      009D3C                          3 SHOW:
      009D3C 04                       4 	.byte 4 	
      009D3D 53 48 4F 57              5 	.ascii "SHOW"
      009D41 92 8D                    6 	.word show 
      001CC3                       5071 	_dict_entry 3,RUN,run
      009D43 9D 3C                    1 	.word LINK 
                           001CC5     2 	LINK=.
      009D45                          3 RUN:
      009D45 03                       4 	.byte 3 	
      009D46 52 55 4E                 5 	.ascii "RUN"
      009D49 96 B0                    6 	.word run 
      001CCB                       5072 	_dict_entry 4,LIST,list
      009D4B 9D 45                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



                           001CCD     2 	LINK=.
      009D4D                          3 LIST:
      009D4D 04                       4 	.byte 4 	
      009D4E 4C 49 53 54              5 	.ascii "LIST"
      009D52 92 E7                    6 	.word list 
      001CD4                       5073 	_dict_entry,3+FFUNC,USR,usr
      009D54 9D 4D                    1 	.word LINK 
                           001CD6     2 	LINK=.
      009D56                          3 USR:
      009D56 83                       4 	.byte 3+FFUNC 	
      009D57 55 53 52                 5 	.ascii "USR"
      009D5A 9B A8                    6 	.word usr 
      001CDC                       5074 	_dict_entry,6+FFUNC,EEPROM,eeprom 
      009D5C 9D 56                    1 	.word LINK 
                           001CDE     2 	LINK=.
      009D5E                          3 EEPROM:
      009D5E 86                       4 	.byte 6+FFUNC 	
      009D5F 45 45 50 52 4F 4D        5 	.ascii "EEPROM"
      009D65 9B A2                    6 	.word eeprom 
      001CE7                       5075 	_dict_entry,6+FFUNC,UFLASH,uflash 
      009D67 9D 5E                    1 	.word LINK 
                           001CE9     2 	LINK=.
      009D69                          3 UFLASH:
      009D69 86                       4 	.byte 6+FFUNC 	
      009D6A 55 46 4C 41 53 48        5 	.ascii "UFLASH"
      009D70 9B 9C                    6 	.word uflash 
      001CF2                       5076 	_dict_entry,3+FFUNC,ODR,port_odr
      009D72 9D 69                    1 	.word LINK 
                           001CF4     2 	LINK=.
      009D74                          3 ODR:
      009D74 83                       4 	.byte 3+FFUNC 	
      009D75 4F 44 52                 5 	.ascii "ODR"
      009D78 9B 7E                    6 	.word port_odr 
      001CFA                       5077 	_dict_entry,3+FFUNC,IDR,port_idr
      009D7A 9D 74                    1 	.word LINK 
                           001CFC     2 	LINK=.
      009D7C                          3 IDR:
      009D7C 83                       4 	.byte 3+FFUNC 	
      009D7D 49 44 52                 5 	.ascii "IDR"
      009D80 9B 84                    6 	.word port_idr 
      001D02                       5078 	_dict_entry,3+FFUNC,DDR,port_ddr 
      009D82 9D 7C                    1 	.word LINK 
                           001D04     2 	LINK=.
      009D84                          3 DDR:
      009D84 83                       4 	.byte 3+FFUNC 	
      009D85 44 44 52                 5 	.ascii "DDR"
      009D88 9B 8A                    6 	.word port_ddr 
      001D0A                       5079 	_dict_entry,3+FFUNC,CRL,port_cr1 
      009D8A 9D 84                    1 	.word LINK 
                           001D0C     2 	LINK=.
      009D8C                          3 CRL:
      009D8C 83                       4 	.byte 3+FFUNC 	
      009D8D 43 52 4C                 5 	.ascii "CRL"
      009D90 9B 90                    6 	.word port_cr1 
      001D12                       5080 	_dict_entry,3+FFUNC,CRH,port_cr2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009D92 9D 8C                    1 	.word LINK 
                           001D14     2 	LINK=.
      009D94                          3 CRH:
      009D94 83                       4 	.byte 3+FFUNC 	
      009D95 43 52 48                 5 	.ascii "CRH"
      009D98 9B 96                    6 	.word port_cr2 
      001D1A                       5081 	_dict_entry,4+FFUNC,GPIO,gpio 
      009D9A 9D 94                    1 	.word LINK 
                           001D1C     2 	LINK=.
      009D9C                          3 GPIO:
      009D9C 84                       4 	.byte 4+FFUNC 	
      009D9D 47 50 49 4F              5 	.ascii "GPIO"
      009DA1 9B 41                    6 	.word gpio 
      001D23                       5082 	_dict_entry,6,PWRADC,power_adc 
      009DA3 9D 9C                    1 	.word LINK 
                           001D25     2 	LINK=.
      009DA5                          3 PWRADC:
      009DA5 06                       4 	.byte 6 	
      009DA6 50 57 52 41 44 43        5 	.ascii "PWRADC"
      009DAC 97 30                    6 	.word power_adc 
      001D2E                       5083 	_dict_entry,5+FFUNC,RDADC,read_adc
      009DAE 9D A5                    1 	.word LINK 
                           001D30     2 	LINK=.
      009DB0                          3 RDADC:
      009DB0 85                       4 	.byte 5+FFUNC 	
      009DB1 52 44 41 44 43           5 	.ascii "RDADC"
      009DB6 97 6B                    6 	.word read_adc 
      001D38                       5084 	_dict_entry,3+FFUNC,ASC,ascii  
      009DB8 9D B0                    1 	.word LINK 
                           001D3A     2 	LINK=.
      009DBA                          3 ASC:
      009DBA 83                       4 	.byte 3+FFUNC 	
      009DBB 41 53 43                 5 	.ascii "ASC"
      009DBE 9B 0B                    6 	.word ascii 
      001D40                       5085 	_dict_entry,4+FFUNC,CHAR,char
      009DC0 9D BA                    1 	.word LINK 
                           001D42     2 	LINK=.
      009DC2                          3 CHAR:
      009DC2 84                       4 	.byte 4+FFUNC 	
      009DC3 43 48 41 52              5 	.ascii "CHAR"
      009DC7 9A EE                    6 	.word char 
      001D49                       5086 	_dict_entry,4+FFUNC,QKEY,qkey  
      009DC9 9D C2                    1 	.word LINK 
                           001D4B     2 	LINK=.
      009DCB                          3 QKEY:
      009DCB 84                       4 	.byte 4+FFUNC 	
      009DCC 51 4B 45 59              5 	.ascii "QKEY"
      009DD0 9B 37                    6 	.word qkey 
      001D52                       5087 	_dict_entry,3+FFUNC,KEY,key 
      009DD2 9D CB                    1 	.word LINK 
                           001D54     2 	LINK=.
      009DD4                          3 KEY:
      009DD4 83                       4 	.byte 3+FFUNC 	
      009DD5 4B 45 59                 5 	.ascii "KEY"
      009DD8 9B 2F                    6 	.word key 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      001D5A                       5088 	_dict_entry,4+FFUNC,SIZE,size
      009DDA 9D D4                    1 	.word LINK 
                           001D5C     2 	LINK=.
      009DDC                          3 SIZE:
      009DDC 84                       4 	.byte 4+FFUNC 	
      009DDD 53 49 5A 45              5 	.ascii "SIZE"
      009DE1 92 A7                    6 	.word size 
      001D63                       5089 	_dict_entry,3,HEX,hex_base
      009DE3 9D DC                    1 	.word LINK 
                           001D65     2 	LINK=.
      009DE5                          3 HEX:
      009DE5 03                       4 	.byte 3 	
      009DE6 48 45 58                 5 	.ascii "HEX"
      009DE9 92 9D                    6 	.word hex_base 
      001D6B                       5090 	_dict_entry,3,DEC,dec_base
      009DEB 9D E5                    1 	.word LINK 
                           001D6D     2 	LINK=.
      009DED                          3 DEC:
      009DED 03                       4 	.byte 3 	
      009DEE 44 45 43                 5 	.ascii "DEC"
      009DF1 92 A2                    6 	.word dec_base 
      001D73                       5091 	_dict_entry,5+FFUNC,TICKS,get_ticks
      009DF3 9D ED                    1 	.word LINK 
                           001D75     2 	LINK=.
      009DF5                          3 TICKS:
      009DF5 85                       4 	.byte 5+FFUNC 	
      009DF6 54 49 43 4B 53           5 	.ascii "TICKS"
      009DFB 9B F7                    6 	.word get_ticks 
      001D7D                       5092 	_dict_entry,3+FFUNC,ABS,abs
      009DFD 9D F5                    1 	.word LINK 
                           001D7F     2 	LINK=.
      009DFF                          3 ABS:
      009DFF 83                       4 	.byte 3+FFUNC 	
      009E00 41 42 53                 5 	.ascii "ABS"
      009E03 9B FD                    6 	.word abs 
      001D85                       5093 	_dict_entry,3+FFUNC,RND,random 
      009E05 9D FF                    1 	.word LINK 
                           001D87     2 	LINK=.
      009E07                          3 RND:
      009E07 83                       4 	.byte 3+FFUNC 	
      009E08 52 4E 44                 5 	.ascii "RND"
      009E0B 9C 1D                    6 	.word random 
      001D8D                       5094 	_dict_entry,5,PAUSE,pause 
      009E0D 9E 07                    1 	.word LINK 
                           001D8F     2 	LINK=.
      009E0F                          3 PAUSE:
      009E0F 05                       4 	.byte 5 	
      009E10 50 41 55 53 45           5 	.ascii "PAUSE"
      009E15 9B E4                    6 	.word pause 
      001D97                       5095 	_dict_entry,4,BSET,bit_set 
      009E17 9E 0F                    1 	.word LINK 
                           001D99     2 	LINK=.
      009E19                          3 BSET:
      009E19 04                       4 	.byte 4 	
      009E1A 42 53 45 54              5 	.ascii "BSET"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]



      009E1E 94 BC                    6 	.word bit_set 
      001DA0                       5096 	_dict_entry,4,BRES,bit_reset
      009E20 9E 19                    1 	.word LINK 
                           001DA2     2 	LINK=.
      009E22                          3 BRES:
      009E22 04                       4 	.byte 4 	
      009E23 42 52 45 53              5 	.ascii "BRES"
      009E27 94 D0                    6 	.word bit_reset 
      001DA9                       5097 	_dict_entry,5,BTOGL,bit_toggle
      009E29 9E 22                    1 	.word LINK 
                           001DAB     2 	LINK=.
      009E2B                          3 BTOGL:
      009E2B 05                       4 	.byte 5 	
      009E2C 42 54 4F 47 4C           5 	.ascii "BTOGL"
      009E31 94 E5                    6 	.word bit_toggle 
      001DB3                       5098 	_dict_entry 4,WAIT,wait 
      009E33 9E 2B                    1 	.word LINK 
                           001DB5     2 	LINK=.
      009E35                          3 WAIT:
      009E35 04                       4 	.byte 4 	
      009E36 57 41 49 54              5 	.ascii "WAIT"
      009E3A 94 91                    6 	.word wait 
      001DBC                       5099 	_dict_entry 6,REMARK,rem 
      009E3C 9E 35                    1 	.word LINK 
                           001DBE     2 	LINK=.
      009E3E                          3 REMARK:
      009E3E 06                       4 	.byte 6 	
      009E3F 52 45 4D 41 52 4B        5 	.ascii "REMARK"
      009E45 94 90                    6 	.word rem 
      001DC7                       5100 	_dict_entry 5,PRINT,print 
      009E47 9E 3E                    1 	.word LINK 
                           001DC9     2 	LINK=.
      009E49                          3 PRINT:
      009E49 05                       4 	.byte 5 	
      009E4A 50 52 49 4E 54           5 	.ascii "PRINT"
      009E4F 93 8B                    6 	.word print 
      001DD1                       5101 	_dict_entry,2,IF,if 
      009E51 9E 49                    1 	.word LINK 
                           001DD3     2 	LINK=.
      009E53                          3 IF:
      009E53 02                       4 	.byte 2 	
      009E54 49 46                    5 	.ascii "IF"
      009E56 95 29                    6 	.word if 
      001DD8                       5102 	_dict_entry,5,GOSUB,gosub 
      009E58 9E 53                    1 	.word LINK 
                           001DDA     2 	LINK=.
      009E5A                          3 GOSUB:
      009E5A 05                       4 	.byte 5 	
      009E5B 47 4F 53 55 42           5 	.ascii "GOSUB"
      009E60 96 41                    6 	.word gosub 
      001DE2                       5103 	_dict_entry,4,GOTO,goto 
      009E62 9E 5A                    1 	.word LINK 
                           001DE4     2 	LINK=.
      009E64                          3 GOTO:
      009E64 04                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]



      009E65 47 4F 54 4F              5 	.ascii "GOTO"
      009E69 96 34                    6 	.word goto 
      001DEB                       5104 	_dict_entry,3,FOR,for 
      009E6B 9E 64                    1 	.word LINK 
                           001DED     2 	LINK=.
      009E6D                          3 FOR:
      009E6D 03                       4 	.byte 3 	
      009E6E 46 4F 52                 5 	.ascii "FOR"
      009E71 95 3D                    6 	.word for 
      001DF3                       5105 	_dict_entry,2,TO,to
      009E73 9E 6D                    1 	.word LINK 
                           001DF5     2 	LINK=.
      009E75                          3 TO:
      009E75 02                       4 	.byte 2 	
      009E76 54 4F                    5 	.ascii "TO"
      009E78 95 67                    6 	.word to 
      001DFA                       5106 	_dict_entry,4,STEP,step 
      009E7A 9E 75                    1 	.word LINK 
                           001DFC     2 	LINK=.
      009E7C                          3 STEP:
      009E7C 04                       4 	.byte 4 	
      009E7D 53 54 45 50              5 	.ascii "STEP"
      009E81 95 97                    6 	.word step 
      001E03                       5107 	_dict_entry,4,NEXT,next 
      009E83 9E 7C                    1 	.word LINK 
                           001E05     2 	LINK=.
      009E85                          3 NEXT:
      009E85 04                       4 	.byte 4 	
      009E86 4E 45 58 54              5 	.ascii "NEXT"
      009E8A 95 BF                    6 	.word next 
      001E0C                       5108 	_dict_entry,6+FFUNC,UBOUND,ubound 
      009E8C 9E 85                    1 	.word LINK 
                           001E0E     2 	LINK=.
      009E8E                          3 UBOUND:
      009E8E 86                       4 	.byte 6+FFUNC 	
      009E8F 55 42 4F 55 4E 44        5 	.ascii "UBOUND"
      009E95 92 B1                    6 	.word ubound 
      001E17                       5109 	_dict_entry,6,RETURN,return 
      009E97 9E 8E                    1 	.word LINK 
                           001E19     2 	LINK=.
      009E99                          3 RETURN:
      009E99 06                       4 	.byte 6 	
      009E9A 52 45 54 55 52 4E        5 	.ascii "RETURN"
      009EA0 96 8C                    6 	.word return 
      001E22                       5110 	_dict_entry,4+FFUNC,PEEK,peek 
      009EA2 9E 99                    1 	.word LINK 
                           001E24     2 	LINK=.
      009EA4                          3 PEEK:
      009EA4 84                       4 	.byte 4+FFUNC 	
      009EA5 50 45 45 4B              5 	.ascii "PEEK"
      009EA9 95 0C                    6 	.word peek 
      001E2B                       5111 	_dict_entry,4,POKE,poke 
      009EAB 9E A4                    1 	.word LINK 
                           001E2D     2 	LINK=.
      009EAD                          3 POKE:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]



      009EAD 04                       4 	.byte 4 	
      009EAE 50 4F 4B 45              5 	.ascii "POKE"
      009EB2 94 F9                    6 	.word poke 
      001E34                       5112 	_dict_entry,5,INPUT,input_var  
      009EB4 9E AD                    1 	.word LINK 
                           001E36     2 	LINK=.
      009EB6                          3 INPUT:
      009EB6 05                       4 	.byte 5 	
      009EB7 49 4E 50 55 54           5 	.ascii "INPUT"
      009EBC 94 1C                    6 	.word input_var 
      009EBE                       5113 kword_dict:
      001E3E                       5114 	_dict_entry 3,LET,let 
      009EBE 9E B6                    1 	.word LINK 
                           001E40     2 	LINK=.
      009EC0                          3 LET:
      009EC0 03                       4 	.byte 3 	
      009EC1 4C 45 54                 5 	.ascii "LET"
      009EC4 92 BF                    6 	.word let 
                                   5115 	
                                   5116 
      009F00                       5117 	.bndry 128 ; align on FLASH block.
                                   5118 ; free space for user application  
      009F00                       5119 user_space:
                                   5120 ; USR() function test
      009F00 89               [ 2] 5121 	pushw x 
      009F01 72 1A 50 0A      [ 1] 5122 	bset PC_ODR,#5 
      009F05 85               [ 2] 5123 	popw x 
      009F06 CD 9B EE         [ 4] 5124 	call pause02 
      009F09 72 1B 50 0A      [ 1] 5125 	bres PC_ODR,#5 
      009F0D 81               [ 4] 5126 	ret
                                   5127 
                                   5128 	.area FLASH_DRIVE (ABS)
      010000                       5129 	.org 0x10000
      010000                       5130 fdrive:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        001D7F R   |     ADC_CR1 =  005401 
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
    ARG_OFS =  000002     |   5 ASC        001D3A R   |     ATTRIB  =  000002 
    AWU_APR =  0050F1     |     AWU_CSR1=  0050F0     |     AWU_TBR =  0050F2 
    B0_MASK =  000001     |     B115200 =  000006     |     B19200  =  000003 
    B1_MASK =  000002     |     B230400 =  000007     |     B2400   =  000000 
    B2_MASK =  000004     |     B38400  =  000004     |     B3_MASK =  000008 
    B460800 =  000008     |     B4800   =  000001     |     B4_MASK =  000010 
    B57600  =  000005     |     B5_MASK =  000020     |     B6_MASK =  000040 
    B7_MASK =  000080     |     B921600 =  000009     |     B9600   =  000002 
    BASE    =  000002     |   5 BEEP       001CAA R   |     BEEP_BIT=  000004 
    BEEP_CSR=  0050F3     |     BEEP_MAS=  000010     |     BEEP_POR=  00000F 
    BELL    =  000007     |     BINARY  =  000001     |     BIT0    =  000000 
    BIT1    =  000001     |     BIT2    =  000002     |     BIT3    =  000003 
    BIT4    =  000004     |     BIT5    =  000005     |     BIT6    =  000006 
    BIT7    =  000007     |     BLOCK_ER=  000000     |     BLOCK_SI=  000080 
    BOOT_ROM=  006000     |     BOOT_ROM=  007FFF     |     BPTR    =  000005 
  5 BREAK      001CA0 R   |   5 BRES       001DA2 R   |   5 BSET       001D99 R
    BSIZE   =  000005     |     BSP     =  000008     |   5 BTOGL      001DAB R
    BTW     =  000001     |   5 BYE        001C4D R   |     C       =  000001 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       001D42 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]

Symbol Table

    CLK_PCKE=  000006     |     CLK_PCKE=  000004     |     CLK_PCKE=  000002 
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
  5 CRH        001D14 R   |   5 CRL        001D0C R   |     CTRL_A  =  000001 
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
    DBG_X   =  000003     |     DBG_Y   =  000001     |   5 DDR        001D04 R
    DEBUG   =  000001     |     DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF 
  5 DEC        001D6D R   |     DEST    =  000001     |     DEVID_BA=  0048CD 
    DEVID_EN=  0048D8     |     DEVID_LO=  0048D2     |     DEVID_LO=  0048D3 
    DEVID_LO=  0048D4     |     DEVID_LO=  0048D5     |     DEVID_LO=  0048D6 
    DEVID_LO=  0048D7     |     DEVID_LO=  0048D8     |     DEVID_WA=  0048D1 
    DEVID_XH=  0048CE     |     DEVID_XL=  0048CD     |     DEVID_YH=  0048D0 
    DEVID_YL=  0048CF     |   5 DIR        001C74 R   |     DIVIDND =  000007 
    DIVISR  =  000005     |     DM_BK1RE=  007F90     |     DM_BK1RH=  007F91 
    DM_BK1RL=  007F92     |     DM_BK2RE=  007F93     |     DM_BK2RH=  007F94 
    DM_BK2RL=  007F95     |     DM_CR1  =  007F96     |     DM_CR2  =  007F97 
    DM_CSR1 =  007F98     |     DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A 
    DSTACK_S=  000040     |   5 EEPROM     001CDE R   |     EEPROM_B=  004000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_NF=  000002     |     FLASH_NF=  000003     |     FLASH_NF=  000004 
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLSI    =  01F400     |   5 FOR        001DED R   |   5 FORGET     001C69 R
    FRUN    =  000000     |     FSIZE   =  000001     |     FSLEEP  =  000003 
    FTRAP   =  000001     |   5 GOSUB      001DDA R   |     GOS_RET =  000003 
  5 GOTO       001DE4 R   |   5 GPIO       001D1C R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  5 HEX        001D65 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        001CFC R
  5 IF         001DD3 R   |     IN      =  000007     |     INCR    =  000001 
  5 INPUT      001E36 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

    ITC_SPR6=  007F75     |     ITC_SPR7=  007F76     |     ITC_SPR8=  007F77 
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
  5 KEY        001D54 R   |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000005     |   5 LET        001E40 R   |     LINENO  =  000005 
  5 LINK    =  001E40 R   |   5 LIST       001CCD R   |     LL      =  000002 
    LLEN    =  000002     |     LL_HB   =  000001     |     LNO     =  000005 
    LN_PTR  =  000005     |   5 LOAD       001C7C R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NCLKOPT =  004808 
    NEG     =  000001     |   5 NEW        001C98 R   |   5 NEXT       001E05 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NL      =  00000A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000009 R   |   5 ODR        001CF4 R   |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |     PAD_SIZE=  000028 
  5 PAUSE      001D8F R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   5 PEEK       001E24 R
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
    PI_ODR  =  005028     |   5 POKE       001E2D R   |     PREV    =  000001 
  5 PRINT      001DC9 R   |     PROD    =  000002     |     PSIZE   =  000001 
  5 PWRADC     001D25 R   |   5 QKEY       001D4B R   |     RAM_BASE=  000000 
    RAM_END =  0017FF     |     RAM_SIZE=  001800     |   5 RDADC      001D30 R
  5 REG_A      0007F8 R   |   5 REG_CC     0007FC R   |   5 REG_EPC    0007EB R
  5 REG_SP     000801 R   |   5 REG_X      0007F4 R   |   5 REG_Y      0007F0 R
    RELOP   =  000005     |   5 REMARK     001DBE R   |     RETL1   =  000001 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

  5 RETURN     001E19 R   |   5 RND        001D87 R   |     ROP     =  004800 
    RST_SR  =  0050B3     |   5 RUN        001CC5 R   |     RXCHAR  =  000001 
    R_A     =  000007     |     R_CC    =  000008     |     R_X     =  000005 
    R_Y     =  000003     |   5 SAVE       001C85 R   |     SDIVD   =  000002 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       001CBC R   |     SIGN    =  000001     |   5 SIZE       001D5C R
    SKIP    =  000006     |   5 SLEEP      001C5F R   |     SPACE   =  000020 
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SQUOT   =  000001 
    SRC     =  000003     |     STACK_EM=  0017FF     |     STACK_SI=  000080 
  5 STATES     0007AE R   |   5 STEP       001DFC R   |   5 STOP       001CB3 R
    SWIM_CSR=  007F80     |     TAB     =  000009     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      001D75 R   |     TIM1_ARR=  005262 
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
    TIM1_SMC=  000007     |     TIM1_SMC=  000000     |     TIM1_SMC=  000001 
    TIM1_SMC=  000002     |     TIM1_SMC=  000004     |     TIM1_SMC=  000005 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

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
    TIM_CR1_=  000001     |     TIM_CR1_=  000002     |     TK_ARRAY=  000003 
    TK_CHAR =  00000B     |     TK_CMD  =  000007     |     TK_COLON=  000001 
    TK_COMMA=  000008     |     TK_DIV  =  000021     |     TK_EQUAL=  000032 
    TK_FUNC =  00000C     |     TK_GE   =  000033     |     TK_GRP_A=  000010 
    TK_GRP_M=  000030     |     TK_GRP_M=  000000     |     TK_GRP_M=  000020 
    TK_GRP_R=  000030     |     TK_GT   =  000031     |     TK_INTGR=  00000A 
    TK_LE   =  000036     |     TK_LPARE=  000004     |     TK_LT   =  000034 
    TK_MINUS=  000011     |     TK_MOD  =  000022     |     TK_MULT =  000020 
    TK_NE   =  000035     |     TK_NONE =  000000     |     TK_PLUS =  000010 
    TK_QSTR =  000006     |     TK_RPARE=  000005     |     TK_SHARP=  000009 
    TK_VAR  =  000002     |   5 TO         001DF5 R   |   5 Timer4Up   000019 R
  5 TrapHand   00000A R   |     U8      =  000003     |     UART1   =  000000 
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Symbol Table

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
    UBC     =  004801     |   5 UBOUND     001E0E R   |   5 UFLASH     001CE9 R
  5 USER_ABO   00007E R   |   5 USR        001CD6 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 UserButt   000025 R
    VSIZ    =  000002     |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       001DB5 R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |     WLEN    =  000001     |   5 WORDS      001C55 R
  5 WRITE      001C8E R   |     WWDG_CR =  0050D1     |     WWDG_WR =  0050D2 
    XMASK   =  000001     |     XSAVE   =  000001     |     YSAVE   =  000003 
  5 abs        001B7D R   |   1 acc16      000009 R   |   1 acc24      000008 R
  1 acc8       00000A R   |   5 accept_c   0009A6 R   |   5 add        000F6A R
  5 ansi_seq   000964 R   |   5 arg_list   00107A R   |   1 array_ad   000020 R
  1 array_si   000022 R   |   5 ascii      001A8B R   |   5 at_tst     000CA1 R
  5 atoi24     000DB6 R   |   5 atoi_exi   000E24 R   |   5 bad_port   001AF9 R
  1 base       000007 R   |   1 basicptr   000003 R   |   5 beep       001688 R
  5 bin_exit   000B99 R   |   5 bit_rese   001450 R   |   5 bit_set    00143C R
  5 bit_togg   001465 R   |   5 bkslsh_t   000C4C R   |   5 bksp       0001BA R
  5 break      00171E R   |   5 break_po   00174F R   |   5 bye        001B50 R
  5 char       001A6E R   |   5 clear_ba   0004D9 R   |   5 clear_va   0003E9 R
  5 clock_in   000099 R   |   5 cmd_itf    0009CA R   |   5 cmp_name   0017EE R
  5 cold_sta   00044E R   |   5 colon_ts   000C75 R   |   5 comma_ts   000C80 R
  5 convert_   000AFF R   |   1 count      000002 R   |   5 cp_loop    001026 R
  5 create_g   00033E R   |   5 cstk_pro   000F34 R   |   5 dash_tst   000C96 R
  5 ddrop      000EB0 R   |   5 ddrop_n    000EED R   |   5 ddup       000EB9 R
  5 dec_base   001222 R   |   5 del_back   000997 R   |   5 del_line   00030F R
  5 del_ln     000988 R   |   5 delete     0001CA R   |   5 dir_loop   0019AE R
  5 director   0019A2 R   |   5 divide     000FC0 R   |   5 divu24_8   0008F1 R
  5 dotr       000F3D R   |   5 dotr_loo   000F52 R   |   5 dots       000F0A R
  5 dpick      000ECA R   |   5 dpop       000E89 R   |   5 dpush      000E7C R
  5 drive_fr   001A2A R   |   3 dstack     001740 R   |   3 dstack_u   001780 R
  5 dstk_pro   000F00 R   |   1 dstkptr    000019 R   |   5 dswap      000E96 R
  5 eeprom     001B22 R   |   5 eql_tst    000D03 R   |   5 err_bad_   0005BA R
  5 err_cmd_   00057B R   |   5 err_div0   00053D R   |   5 err_dupl   000596 R
  5 err_math   000523 R   |   5 err_mem_   000506 R   |   5 err_msg    0004EE R
  5 err_no_a   0005C7 R   |   5 err_no_l   00054D R   |   5 err_not_   0005A8 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 112.
Hexadecimal [24-Bits]

Symbol Table

  5 err_run_   000564 R   |   5 err_synt   000514 R   |   5 expect     00106D R
  5 expr_exi   0011B3 R   |   5 expressi   001172 R   |   5 factor     0010D1 R
  1 farptr     000013 R   |   7 fdrive     010000 R   |   5 fetch      000ED9 R
  5 fetchc     000AB7 R   |   1 ffree      000016 R   |   5 file_cou   001A22 R
  5 final_te   00095E R   |   5 first_li   001292 R   |   1 flags      000024 R
  5 for        0014BD R   |   5 forget     001953 R   |   1 free_ram   00005A R
  5 get_arra   00109E R   |   5 get_tick   001B77 R   |   5 get_toke   000BE6 R
  5 getc       0001A7 R   |   5 go_commo   0015E4 R   |   5 gosub      0015C1 R
  5 goto       0015B4 R   |   5 gpio       001AC1 R   |   5 gt_tst     000D0E R
  5 hex_base   00121D R   |   5 hse_cloc   000187 R   |   5 hsi_cloc   000191 R
  5 if         0014A9 R   |   1 in         000001 R   |   1 in.w       000000 R
  1 in.w.sav   000011 R   |   5 incr_far   001778 R   |   5 input_ex   00140D R
  5 input_lo   0013A8 R   |   5 input_va   00139C R   |   5 insert_l   00036F R
  5 insert_l   0003E6 R   |   5 interp     000677 R   |   5 interp_l   0006BD R
  5 invalid    000A0F R   |   5 invalid_   000A8D R   |   5 is_alpha   0003F7 R
  5 is_digit   000DA1 R   |   5 itoa       0008AA R   |   5 itoa_loo   0008C2 R
  5 key        001AAF R   |   5 kword_di   001E3E R   |   5 kword_en   001C4B R
  5 last_lin   00129B R   |   5 ledoff     0006FE R   |   5 ledon      0006F9 R
  5 ledtoggl   000703 R   |   5 left_arr   000964 R   |   5 left_par   00070C R
  5 let        00123F R   |   5 let02      001249 R   |   1 lineno     000005 R
  5 lines_sk   0012A0 R   |   5 list       001267 R   |   5 list_exi   0012EA R
  5 list_sta   0012C3 R   |   5 load       0018F6 R   |   5 loop_bac   001587 R
  1 loop_dep   00001F R   |   5 loop_don   0015A2 R   |   5 lt_tst     000D47 R
  5 mem_peek   000A2C R   |   5 modulo     001004 R   |   5 move       00029E R
  5 move_dow   0002BC R   |   5 move_exi   0002DD R   |   5 move_loo   0002C1 R
  5 move_up    0002AE R   |   5 multiply   000F78 R   |   5 mulu24_8   000E28 R
  5 nbr_tst    000C22 R   |   5 neg_acc2   000919 R   |   5 new        00176D R
  5 next       00153F R   |   5 no_match   001038 R   |   5 none       000BE6 R
  5 number     000ABD GR  |   5 other      000D7F R   |   3 pad        001718 R
  5 parse_bi   000B79 R   |   5 parse_in   000B3E R   |   5 parse_ke   000BA1 R
  5 parse_qu   000AC4 R   |   5 pause      001B64 R   |   5 pause02    001B6E R
  5 peek       00148C R   |   5 peek_byt   000A57 R   |   5 plus_tst   000CD7 R
  5 poke       001479 R   |   5 port_cr1   001B10 R   |   5 port_cr2   001B16 R
  5 port_ddr   001B0A R   |   5 port_idr   001B04 R   |   5 port_odr   001AFE R
  5 power_ad   0016B0 R   |   5 prcnt_ts   000CF8 R   |   5 print      00130B R
  5 print_ex   001366 R   |   5 print_fa   000A9C R   |   5 print_in   00084E R
  5 print_re   00075B R   |   5 print_st   000A1F R   |   5 prt_basi   0012ED R
  5 prt_loop   00130F R   |   5 prt_peek   00024E R   |   5 prt_reg1   00073C R
  5 prt_reg8   000717 R   |   5 prt_regs   0001E4 R   |   5 prti24     000806 R
  5 putc       00019E R   |   5 puts       0001B0 R   |   5 qkey       001AB7 R
  5 qmark_ts   000CAC R   |   5 random     001B9D R   |   5 read_adc   0016EB R
  5 readln     00093C R   |   5 readln_l   000942 R   |   5 readln_q   0009BB R
  5 regs_sta   000227 R   |   5 rel_exit   00120A R   |   5 relation   0011B6 R
  5 rem        001410 R   |   5 repl       0009D8 R   |   5 repl_exi   000A00 R
  5 reprint    000964 R   |   5 reset_co   00130D R   |   5 rest_con   001387 R
  5 return     00160C R   |   5 right_ar   000964 R   |   5 rparnt_t   000C6A R
  5 run        001630 R   |   5 save       001859 R   |   5 save_con   001372 R
  5 search_d   001015 R   |   5 search_e   001069 R   |   5 search_f   00180F R
  5 search_l   0002E0 R   |   5 search_l   0002EB R   |   5 search_n   001019 R
  1 seedx      00000D R   |   1 seedy      00000F R   |   5 seek_fdr   001786 R
  5 sharp_ts   000C8B R   |   5 show       00120D R   |   5 size       001227 R
  5 skip       000E62 R   |   5 slash_ts   000CED R   |   5 sleep      001B59 R
  5 software   000408 R   |   5 spaces     0001D8 R   |   3 stack_fu   001780 R
  3 stack_un   001800 R   |   5 star_tst   000CE2 R   |   5 step       001517 R
  5 stop       001679 R   |   5 store      000EE3 R   |   5 store_lo   001529 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 113.
Hexadecimal [24-Bits]

Symbol Table

  5 str_matc   001047 R   |   5 str_tst    000C11 R   |   5 strcmp     00027F R
  5 strcpy     000290 R   |   5 strlen     000272 R   |   5 substrac   000F72 R
  5 syntax_e   0005FB R   |   1 tab_widt   000025 R   |   5 tb_error   0005FD R
  5 term       001125 R   |   5 term01     00112E R   |   5 term_exi   00116F R
  5 test_p     000A17 R   |   3 tib        0016C8 R   |   5 tick_tst   000CC3 R
  1 ticks      00000B R   |   5 timer4_i   0000AF R   |   5 to         0014E7 R
  5 to_upper   000DAA GR  |   5 token_ch   000D8E R   |   5 token_ex   000D9E R
  1 txtbgn     00001B R   |   1 txtend     00001D R   |   5 uart3_in   000174 R
  5 uart3_se   000180 R   |   5 uart_ena   000199 R   |   5 ubound     001231 R
  5 uflash     001B1C R   |   5 unget_to   000E75 R   |   5 unlock_e   0000C0 R
  5 unlock_f   0000CE R   |   5 user_spa   001E80 R   |   5 usr        001B28 R
  1 vars       000026 R   |   5 wait       001411 R   |   5 warm_sta   000657 R
  5 words      001C11 R   |   5 write      001A37 R   |   5 write_bl   000151 R
  5 write_by   0000DC R   |   5 write_ee   000118 R   |   5 write_ex   00014C R
  5 write_fl   000102 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 114.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5A   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   1E8E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

