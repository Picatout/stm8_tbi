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
      000009                         58 base:  .blkb 1 ; nemeric base used to print integer 
      00000A                         59 acc24: .blkb 1 ; 24 accumulator
      00000B                         60 acc16: .blkb 1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 2.
Hexadecimal [24-Bits]



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
      008000 82 00 84 CF             95     int cold_start
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
      00808E CD 87 DC         [ 4]  149 	call print_registers
      008091 CD 8A 4B         [ 4]  150 	call cmd_itf
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
      0080D6 CD 88 CF         [ 4]  188 	call print_int  	
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
      0080FB CC 86 D8         [ 2]  205 	jp warm_start
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
      008119 C1 50 C3         [ 1]  219 	cp a,CLK_CMSR 
      00811C 27 0C            [ 1]  220 	jreq 2$ ; no switching required 
                                    221 ; select clock source 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



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
                                    274 ;executed from RAM
                                    275 ;-----------------------------
                           000000   276 .if BLOCK_ERASE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



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
                                    329 ; erase flash block:
                                    330 erase_flash:
                                    331 	call unlock_flash 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



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
      00816E 90 A3 9E 00      [ 2]  366     cpw y,#user_space
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
                                    383 ; write eeprom and option
      008198                        384 write_eeprom:
      008198 CD 81 40         [ 4]  385 	call unlock_eeprom
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



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
      0081D7 27 13            [ 1]  434 	jreq 9$
      0081D9 1E 01            [ 2]  435 1$:	ldw x,(XSAVE,sp)
      0081DB 90 F6            [ 1]  436 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



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
      0081EE CD 97 63         [ 4]  447 	call incr_farptr
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
                                    488 ;   A 
                                    489 ; output:
                                    490 ;   none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



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
                                    543 ; at terminal.
                                    544 ; input: 
                                    545 ;   A   	number of characters to delete.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



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
      00826C AE 88 6C         [ 2]  592 	ldw x,#REG_EPC 
      00826F CD 87 BD         [ 4]  593 	call prt_reg16 
                                    594 ; register CC 
      008272 7B 08            [ 1]  595 	ld a,(R_CC,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      008274 AE 88 7D         [ 2]  596 	ldw x,#REG_CC 
      008277 CD 87 98         [ 4]  597 	call prt_reg8 
                                    598 ; register A 
      00827A 7B 07            [ 1]  599 	ld a,(R_A,sp)
      00827C AE 88 79         [ 2]  600 	ldw x,#REG_A 
      00827F CD 87 98         [ 4]  601 	call prt_reg8 
                                    602 ; register X 
      008282 16 05            [ 2]  603 	ldw y,(R_X,sp)
      008284 AE 88 75         [ 2]  604 	ldw x,#REG_X 
      008287 CD 87 BD         [ 4]  605 	call prt_reg16 
                                    606 ; register Y 
      00828A 16 03            [ 2]  607 	ldw y,(R_Y,sp)
      00828C AE 88 71         [ 2]  608 	ldw x,#REG_Y 
      00828F CD 87 BD         [ 4]  609 	call prt_reg16 
                                    610 ; register SP 
      008292 90 96            [ 1]  611 	ldw y,sp
      008294 72 A9 00 08      [ 2]  612 	addw y,#6+ARG_OFS  
      008298 AE 88 82         [ 2]  613 	ldw x,#REG_SP
      00829B CD 87 BD         [ 4]  614 	call prt_reg16
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
      0082D9 CD 88 87         [ 4]  636 	call prti24 
      0082DC A6 3A            [ 1]  637 	ld a,#': 
      0082DE CD 82 1E         [ 4]  638 	call putc 
      0082E1 A6 20            [ 1]  639 	ld a,#SPACE 
      0082E3 CD 82 1E         [ 4]  640 	call putc 
      0082E6 85               [ 2]  641 	popw x 
      0082E7 F6               [ 1]  642 	ld a,(x)
      0082E8 C7 00 0B         [ 1]  643 	ld acc8,a 
      0082EB 5F               [ 1]  644 	clrw x 
      0082EC A6 10            [ 1]  645 	ld a,#16 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      0082EE CD 88 87         [ 4]  646 	call prti24
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
                                    698 ;----------------------------------
      008310                        699 strcpy:
      008310 89               [ 2]  700 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



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
      00832A 27 32            [ 1]  730 	jreq move_exit ; x==y 
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
      008347 27 15            [ 1]  745 	jreq move_exit 
      008349 72 FB 01         [ 2]  746 	addw x,(INCR,sp)
      00834C 72 F9 01         [ 2]  747 	addw y,(INCR,sp) 
      00834F 90 F6            [ 1]  748 	ld a,(y)
      008351 F7               [ 1]  749 	ld (x),a 
      008352 72 5A 00 0B      [ 1]  750 	dec acc8
      008356 2A E9            [ 1]  751 	jrpl move_loop
      008358 72 5A 00 0A      [ 1]  752 	dec acc16
      00835C 20 E3            [ 2]  753 	jra move_loop
      00835E                        754 move_exit:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0002DE                        755 	_drop VSIZE
      00835E 5B 02            [ 2]    1     addw sp,#VSIZE 
      008360 81               [ 4]  756 	ret 	
                                    757 
                                    758 ;-------------------------------------
                                    759 ; search text area for a line with 
                                    760 ; same number as lineno  
                                    761 ; input:
                                    762 ;	X 			lineno 
                                    763 ; output:
                                    764 ;   X 			addr of line | 0 
                                    765 ;   Y           lineno|insert address if not found  
                                    766 ;-------------------------------------
                           000001   767 	LL=1 ; line length 
                           000002   768 	LB=2 ; line length low byte 
                           000002   769 	VSIZE=2 
      008361                        770 search_lineno:
      0002E1                        771 	_vars VSIZE
      008361 52 02            [ 2]    1     sub sp,#VSIZE 
      008363 CF 00 0A         [ 2]  772 	ldw acc16,x 
      008366 0F 01            [ 1]  773 	clr (LL,sp)
      008368 90 CE 00 1C      [ 2]  774 	ldw y,txtbgn
      00836C                        775 search_ln_loop:
      00836C 90 C3 00 1E      [ 2]  776 	cpw y,txtend 
      008370 2A 17            [ 1]  777 	jrpl 8$
      008372 93               [ 1]  778 	ldw x,y 
      008373 FE               [ 2]  779 	ldw x,(x) ; x=line number 
      008374 C3 00 0A         [ 2]  780 	cpw x,acc16 
      008377 27 13            [ 1]  781 	jreq 9$ 
      008379 2A 0E            [ 1]  782 	jrpl 8$ ; from here all lines are > lineno 
      00837B 90 E6 02         [ 1]  783 	ld a,(2,y)
      00837E 6B 02            [ 1]  784 	ld (LB,sp),a 
      008380 72 A9 00 03      [ 2]  785 	addw y,#3 
      008384 72 F9 01         [ 2]  786 	addw y,(LL,sp)
      008387 20 E3            [ 2]  787 	jra search_ln_loop 
      008389 51               [ 1]  788 8$: exgw x,y 
      00838A 90 5F            [ 1]  789 	clrw y 	
      00030C                        790 9$: _drop VSIZE
      00838C 5B 02            [ 2]    1     addw sp,#VSIZE 
      00838E 51               [ 1]  791 	exgw x,y   
      00838F 81               [ 4]  792 	ret 
                                    793 
                                    794 ;-------------------------------------
                                    795 ; delete line at addr
                                    796 ; input:
                                    797 ;   X 		addr of line i.e DEST for move 
                                    798 ;-------------------------------------
                           000001   799 	LLEN=1
                           000003   800 	SRC=3
                           000004   801 	VSIZE=4
      008390                        802 del_line: 
      000310                        803 	_vars VSIZE 
      008390 52 04            [ 2]    1     sub sp,#VSIZE 
      008392 E6 02            [ 1]  804 	ld a,(2,x) ; line length
      008394 AB 03            [ 1]  805 	add a,#3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      008396 6B 02            [ 1]  806 	ld (LLEN+1,sp),a 
      008398 0F 01            [ 1]  807 	clr (LLEN,sp)
      00839A 90 93            [ 1]  808 	ldw y,x  
      00839C 72 F9 01         [ 2]  809 	addw y,(LLEN,sp) ;SRC  
      00839F 17 03            [ 2]  810 	ldw (SRC,sp),y  ;save source 
      0083A1 90 CE 00 1E      [ 2]  811 	ldw y,txtend 
      0083A5 72 F2 03         [ 2]  812 	subw y,(SRC,sp) ; y=count 
      0083A8 90 CF 00 0A      [ 2]  813 	ldw acc16,y 
      0083AC 16 03            [ 2]  814 	ldw y,(SRC,sp)    ; source
      0083AE CD 83 1E         [ 4]  815 	call move
      0083B1 90 CE 00 1E      [ 2]  816 	ldw y,txtend 
      0083B5 72 F2 01         [ 2]  817 	subw y,(LLEN,sp)
      0083B8 90 CF 00 1E      [ 2]  818 	ldw txtend,y  
      00033C                        819 	_drop VSIZE     
      0083BC 5B 04            [ 2]    1     addw sp,#VSIZE 
      0083BE 81               [ 4]  820 	ret 
                                    821 
                                    822 
                                    823 ;---------------------------------------------
                                    824 ; create a gap in text area 
                                    825 ; input:
                                    826 ;    X 			addr gap start 
                                    827 ;    Y 			gap length 
                                    828 ; output:
                                    829 ;    X 			addr gap start 
                                    830 ;--------------------------------------------
                           000001   831 	DEST=1
                           000003   832 	SRC=3
                           000005   833 	LEN=5
                           000006   834 	VSIZE=6 
      0083BF                        835 create_gap:
      00033F                        836 	_vars VSIZE
      0083BF 52 06            [ 2]    1     sub sp,#VSIZE 
      0083C1 C3 00 1E         [ 2]  837 	cpw x,txtend 
      0083C4 2A 27            [ 1]  838 	jrpl 9$ ; no need for a gap since at end of text.
      0083C6 1F 03            [ 2]  839 	ldw (SRC,sp),x 
      0083C8 17 05            [ 2]  840 	ldw (LEN,sp),y 
      0083CA 90 CF 00 0A      [ 2]  841 	ldw acc16,y 
      0083CE 90 93            [ 1]  842 	ldw y,x ; SRC
      0083D0 72 BB 00 0A      [ 2]  843 	addw x,acc16  
      0083D4 1F 01            [ 2]  844 	ldw (DEST,sp),x 
                                    845 ;compute size to move 	
      0083D6 CE 00 1E         [ 2]  846 	ldw x,txtend 
      0083D9 72 F0 03         [ 2]  847 	subw x,(SRC,sp)
      0083DC CF 00 0A         [ 2]  848 	ldw acc16,x
      0083DF 1E 01            [ 2]  849 	ldw x,(DEST,sp) 
      0083E1 CD 83 1E         [ 4]  850 	call move
      0083E4 CE 00 1E         [ 2]  851 	ldw x,txtend
      0083E7 72 FB 05         [ 2]  852 	addw x,(LEN,sp)
      0083EA CF 00 1E         [ 2]  853 	ldw txtend,x
      00036D                        854 9$:	_drop VSIZE 
      0083ED 5B 06            [ 2]    1     addw sp,#VSIZE 
      0083EF 81               [ 4]  855 	ret 
                                    856 
                                    857 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    858 ;--------------------------------------------
                                    859 ; insert line in tib into text area 
                                    860 ; first search for already existing 
                                    861 ; replace existing 
                                    862 ; if strlen(tib)==0 delete existing 
                                    863 ; input:
                                    864 ;   X 				line number 
                                    865 ;   tib[in.w]  		text to insert  
                                    866 ; output:
                                    867 ;   none
                                    868 ;---------------------------------------------
                           000001   869 	DEST=1  ; text area insertion address 
                           000003   870 	SRC=3   ; str to insert address 
                           000005   871 	LINENO=5 ; line number 
                           000007   872 	LLEN=7 ; line length 
                           000008   873 	VSIZE=8  
      0083F0                        874 insert_line:
      000370                        875 	_vars VSIZE 
      0083F0 52 08            [ 2]    1     sub sp,#VSIZE 
      0083F2 A3 00 00         [ 2]  876 	cpw x,#0  
      0083F5 22 03            [ 1]  877 	jrugt 0$ 
      0083F7 CC 86 7C         [ 2]  878 	jp syntax_error ; negative line number 
      0083FA                        879 0$: 
      0083FA 1F 05            [ 2]  880 	ldw (LINENO,sp),x 
      0083FC AE 16 C8         [ 2]  881 	ldw x,#tib 
      0083FF 72 BB 00 01      [ 2]  882 	addw x,in.w 
      008403 1F 03            [ 2]  883 	ldw (SRC,sp),x 
      008405 CD 82 F2         [ 4]  884 	call strlen
      008408 5D               [ 2]  885 	tnzw x 
      008409 27 01            [ 1]  886 	jreq 1$
      00840B 5C               [ 1]  887 	incw x 
      00840C 1F 07            [ 2]  888 1$:	ldw (LLEN,sp),x
      00840E 1E 05            [ 2]  889 	ldw x,(LINENO,sp)
      008410 CD 83 61         [ 4]  890 	call search_lineno 
      008413 5D               [ 2]  891 	tnzw x 
      008414 26 04            [ 1]  892 	jrne 2$
                                    893 ; line doesn't exit 	
      008416 17 01            [ 2]  894 	ldw (DEST,sp),y 
      008418 20 05            [ 2]  895 	jra 3$
                                    896 ; line exit delete it.	
      00841A 1F 01            [ 2]  897 2$: ldw (DEST,sp),x 
      00841C CD 83 90         [ 4]  898 	call del_line
                                    899 ; leave or insert new line if LLEN>0
      00841F                        900 3$: 
                                    901 ; check for available space 
      00841F CD 92 A8         [ 4]  902 	call size 
      008422 1D 00 03         [ 2]  903 	subw x,#3 
      008425 72 F0 07         [ 2]  904     subw x,(LLEN,sp)
      008428 2A 05            [ 1]  905 	jrpl 31$
      00842A A6 01            [ 1]  906 	ld a,#ERR_MEM_FULL
      00842C CC 86 7E         [ 2]  907 	jp tb_error 
      00842F                        908 31$:	
      00842F 0D 08            [ 1]  909 	tnz (LLEN+1,sp)
      008431 27 34            [ 1]  910 	jreq insert_ln_exit ; empty line forget it.
      008433 1E 01            [ 2]  911 	ldw x,(DEST,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      008435 C3 00 1E         [ 2]  912 	cpw x,txtend 
      008438 2A 0B            [ 1]  913 	jrpl 4$ 
                                    914 ; must create a gap 
      00843A 16 07            [ 2]  915 	ldw y,(LLEN,sp)
      00843C 72 A9 00 03      [ 2]  916 	addw y,#3 ; space for lineno and linelen 
      008440 CD 83 BF         [ 4]  917 	call create_gap 
      008443 20 11            [ 2]  918 	jra 5$ 
      008445                        919 4$: ; insert at end. 
      008445 90 CE 00 1E      [ 2]  920 	ldw y,txtend
      008449 17 01            [ 2]  921 	ldw (DEST,sp),y
      00844B 72 F9 07         [ 2]  922 	addw y,(LLEN,sp)
      00844E 72 A9 00 03      [ 2]  923 	addw y,#3 
      008452 90 CF 00 1E      [ 2]  924 	ldw txtend,y  
      008456                        925 5$:	
      008456 1E 01            [ 2]  926 	ldw x,(DEST,sp) ; dest address 
      008458 16 05            [ 2]  927 	ldw y,(LINENO,sp) ; line number 
      00845A FF               [ 2]  928 	ldw (x),y 
      00845B 1C 00 02         [ 2]  929 	addw x,#2
      00845E 7B 08            [ 1]  930 	ld a,(LLEN+1,sp)
      008460 F7               [ 1]  931 	ld (x),a 
      008461 5C               [ 1]  932 	incw x 
      008462 16 03            [ 2]  933 	ldw y,(SRC,sp) ; src addr  
      008464 CD 83 10         [ 4]  934 	call strcpy   
      008467                        935 insert_ln_exit:	
      0003E7                        936 	_drop VSIZE
      008467 5B 08            [ 2]    1     addw sp,#VSIZE 
      008469 81               [ 4]  937 	ret
                                    938 	
                                    939 ;------------------------------------
                                    940 ;  set all variables to zero 
                                    941 ; input:
                                    942 ;   none 
                                    943 ; output:
                                    944 ;	none
                                    945 ;------------------------------------
      00846A                        946 clear_vars:
      00846A AE 00 27         [ 2]  947 	ldw x,#vars 
      00846D 90 AE 00 34      [ 2]  948 	ldw y,#2*26 
      008471 7F               [ 1]  949 1$:	clr (x)
      008472 5C               [ 1]  950 	incw x 
      008473 90 5A            [ 2]  951 	decw y 
      008475 26 FA            [ 1]  952 	jrne 1$
      008477 81               [ 4]  953 	ret 
                                    954 
                                    955 ;-------------------------------------
                                    956 ; check if A is a letter
                                    957 ; input:
                                    958 ;   A 			character to test 
                                    959 ; output:
                                    960 ;   C flag      1 true, 0 false 
                                    961 ;-------------------------------------
      008478                        962 is_alpha:
      008478 A1 41            [ 1]  963 	cp a,#'A 
      00847A 8C               [ 1]  964 	ccf
      00847B 24 0B            [ 1]  965 	jrnc 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      00847D A1 5B            [ 1]  966 	cp a,#'Z+1 
      00847F 25 07            [ 1]  967 	jrc 9$ 
      008481 A1 61            [ 1]  968 	cp a,#'a 
      008483 8C               [ 1]  969 	ccf 
      008484 24 02            [ 1]  970 	jrnc 9$
      008486 A1 7B            [ 1]  971 	cp a,#'z+1   
      008488 81               [ 4]  972 9$: ret 	
                                    973 
                                    974 ;-------------------------------------
                                    975 ;  program initialization entry point 
                                    976 ;-------------------------------------
                           000001   977 	MAJOR=1
                           000000   978 	MINOR=0
      008489 0A 0A 54 69 6E 79 20   979 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      0084CF                        980 cold_start:
                                    981 ;set stack 
      0084CF AE 17 FF         [ 2]  982 	ldw x,#STACK_EMPTY
      0084D2 94               [ 1]  983 	ldw sp,x   
                                    984 ; clear all ram 
      0084D3 7F               [ 1]  985 0$: clr (x)
      0084D4 5A               [ 2]  986 	decw x 
      0084D5 26 FC            [ 1]  987 	jrne 0$
                                    988 ; activate pull up on all inputs 
      0084D7 A6 FF            [ 1]  989 	ld a,#255 
      0084D9 C7 50 03         [ 1]  990 	ld PA_CR1,a 
      0084DC C7 50 08         [ 1]  991 	ld PB_CR1,a 
      0084DF C7 50 0D         [ 1]  992 	ld PC_CR1,a 
      0084E2 C7 50 12         [ 1]  993 	ld PD_CR1,a 
      0084E5 C7 50 17         [ 1]  994 	ld PE_CR1,a 
      0084E8 C7 50 1C         [ 1]  995 	ld PF_CR1,a 
      0084EB C7 50 21         [ 1]  996 	ld PG_CR1,a 
      0084EE C7 50 2B         [ 1]  997 	ld PI_CR1,a 
                                    998 ; select internal clock no divisor: 16 Mhz 	
      0084F1 A6 E1            [ 1]  999 	ld a,#CLK_SWR_HSI 
      0084F3 5F               [ 1] 1000 	clrw x  
      0084F4 CD 81 19         [ 4] 1001     call clock_init 
      0084F7 CD 81 2F         [ 4] 1002 	call timer4_init
                                   1003 ; UART3 at 115200 BAUD
      0084FA CD 81 F4         [ 4] 1004 	call uart3_init
                                   1005 ; activate PE_4 (user button interrupt)
      0084FD 72 18 50 18      [ 1] 1006     bset PE_CR2,#USR_BTN_BIT 
                                   1007 ; display system information
      008501 AE 84 89         [ 2] 1008 	ldw x,#software 
      008504 CD 82 30         [ 4] 1009 	call puts 
      008507 A6 01            [ 1] 1010 	ld a,#MAJOR 
      008509 C7 00 0B         [ 1] 1011 	ld acc8,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      00850C 5F               [ 1] 1012 	clrw x 
      00850D CF 00 09         [ 2] 1013 	ldw acc24,x 
      008510 A6 0A            [ 1] 1014 	ld a,#10 
      008512 CD 88 87         [ 4] 1015 	call prti24 
      008515 A6 2E            [ 1] 1016 	ld a,#'.
      008517 CD 82 1E         [ 4] 1017 	call putc 
      00851A A6 00            [ 1] 1018 	ld a,#MINOR 
      00851C C7 00 0B         [ 1] 1019 	ld acc8,a 
      00851F 5F               [ 1] 1020 	clrw x 
      008520 CF 00 09         [ 2] 1021 	ldw acc24,x 
      008523 A6 0A            [ 1] 1022 	ld a,#10 
      008525 CD 88 87         [ 4] 1023 	call prti24 
      008528 A6 0D            [ 1] 1024 	ld a,#CR 
      00852A CD 82 1E         [ 4] 1025 	call putc 
      00852D CD 97 71         [ 4] 1026 	call seek_fdrive 
                                   1027 ; configure LED2 pin 
      008530 72 1A 50 0D      [ 1] 1028     bset PC_CR1,#LED2_BIT
      008534 72 1A 50 0E      [ 1] 1029     bset PC_CR2,#LED2_BIT
      008538 72 1A 50 0C      [ 1] 1030     bset PC_DDR,#LED2_BIT
      00853C 9A               [ 1] 1031 	rim 
      00853D AE 16 C8         [ 2] 1032 	ldw x,#tib
      008540 CF 00 21         [ 2] 1033 	ldw array_addr,x 
      008543 72 5C 00 11      [ 1] 1034 	inc seedy+1 
      008547 72 5C 00 0F      [ 1] 1035 	inc seedx+1 
      00854B CD 85 5A         [ 4] 1036 	call clear_basic
      00854E CD 92 B2         [ 4] 1037 	call ubound 
      008551 CD 8F 0A         [ 4] 1038 	call dpop 
      008554 CF 00 23         [ 2] 1039 	ldw array_size,x 
      008557 CC 86 D8         [ 2] 1040     jp warm_start 
                                   1041 
                                   1042 ;---------------------------
                                   1043 ; reset BASIC text variables 
                                   1044 ; and clear variables 
                                   1045 ;---------------------------
      00855A                       1046 clear_basic:
      00855A 5F               [ 1] 1047 	clrw x 
      00855B CF 00 06         [ 2] 1048 	ldw lineno,x
      00855E 72 5F 00 03      [ 1] 1049 	clr count 
      008562 AE 00 5B         [ 2] 1050 	ldw x,#free_ram 
      008565 CF 00 1C         [ 2] 1051 	ldw txtbgn,x 
      008568 CF 00 1E         [ 2] 1052 	ldw txtend,x 
      00856B CD 84 6A         [ 4] 1053 	call clear_vars 
      00856E 81               [ 4] 1054 	ret 
                                   1055 
                                   1056 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                   1057 ;;   Tiny BASIC error messages     ;;
                                   1058 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      00856F                       1059 err_msg:
      00856F 00 00 85 87 85 95 85  1060 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             A4 85 BE 85 CE
      00857B 85 E5 85 FC 86 17 86  1061 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             29 86 3B
      008585 86 48                 1062 	.word err_no_access 
                                   1063 
      008587 0A 4D 65 6D 6F 72 79  1064 err_mem_full: .asciz "\nMemory full\n" 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal  20-Bits]



             20 66 75 6C 6C 0A 00
      00858F 66 75 6C 6C 0A 00 0A  1065 err_syntax: .asciz "\nsyntax error\n" 
             73 79 6E 74 61 78 20
             65
      00859E 72 72 6F 72 0A 00 0A  1066 err_math_ovf: .asciz "\nmath operation overflow\n"
             6D 61 74 68 20 6F 70
             65 72 61 74 69 6F 6E
             20 6F 76 65 72
      0085B8 66 6C 6F 77 0A 00 0A  1067 err_div0: .asciz "\ndivision by 0\n" 
             64 69 76 69 73 69 6F
             6E 20
      0085C8 62 79 20 30 0A 00 0A  1068 err_no_line: .asciz "\ninvalid line number.\n"
             69 6E 76 61 6C 69 64
             20 6C 69 6E 65 20 6E
             75 6D
      0085DF 62 65 72 2E 0A 00 0A  1069 err_run_only: .asciz "\nrun time only usage.\n" 
             72 75 6E 20 74 69 6D
             65 20 6F 6E 6C 79 20
             75 73
      0085F6 61 67 65 2E 0A 00 0A  1070 err_cmd_only: .asciz "\ncommand line only usage.\n"
             63 6F 6D 6D 61 6E 64
             20 6C 69 6E 65 20 6F
             6E 6C 79 20 75 73
      008611 61 67 65 2E 0A 00 0A  1071 err_duplicate: .asciz "\nduplicate name.\n"
             64 75 70 6C 69 63 61
             74 65 20 6E
      008623 61 6D 65 2E 0A 00 0A  1072 err_not_file: .asciz "\nFile not found.\n"
             46 69 6C 65 20 6E 6F
             74 20 66 6F
      008635 75 6E 64 2E 0A 00 0A  1073 err_bad_value: .asciz "\nbad value.\n"
             62 61 64 20 76 61
      008642 6C 75 65 2E 0A 00 0A  1074 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             46 69 6C 65 20 69 6E
             20 65 78 74 65 6E 64
             65 64 20 6D 65 6D 6F
             72 79 2C 20 63 61 6E
             27 74 20 62 65 20 72
             75 6E 20 66 72 6F 6D
             20 74 68
                                   1075 
      0005FC                       1076 syntax_error:
      008676 65 72            [ 1] 1077 	ld a,#ERR_SYNTAX 
                                   1078 
      0005FE                       1079 tb_error:
      008678 65 2E 0A         [ 2] 1080 	ldw x, #err_msg 
      00867B 00 5F 00 09      [ 1] 1081 	clr acc16 
      00867C 48               [ 1] 1082 	sll a
      00867C A6 02 00 09      [ 1] 1083 	rlc acc16  
      00867E C7 00 0A         [ 1] 1084 	ld acc8, a 
      00867E AE 85 6F 72      [ 2] 1085 	addw x,acc16 
      008682 5F               [ 2] 1086 	ldw x,(x)
      008683 00 0A 48         [ 4] 1087 	call puts
      008686 72 59 00         [ 2] 1088 	ldw x,lineno 
      008689 0A               [ 2] 1089 	tnzw x 
      00868A C7 00            [ 1] 1090 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00868C 0B 72 BB 00      [ 1] 1091 	mov tab_width,#6
      008690 0A FE CD 82      [ 1] 1092 	mov base,#10 
      008694 30 CE 00         [ 4] 1093 	call print_int 
      000626                       1094 2$:	 
      008697 06 5D 27         [ 2] 1095 	ldw x,basicptr   
      00869A 0B 35 06         [ 1] 1096 	ld a,lineno 
      00869D 00 26 35         [ 1] 1097 	or a,lineno+1
      0086A0 0A 00            [ 1] 1098 	jreq 3$
      0086A2 08 CD 88         [ 2] 1099 	addw x,#3 
      0086A5 CF 01 B0         [ 4] 1100 3$:	call puts 
      0086A6 A6 0D            [ 1] 1101 	ld a,#CR 
      0086A6 CE 00 04         [ 4] 1102 	call putc 
      0086A9 C6               [ 1] 1103 	clrw x 
      0086AA 00 06 CA         [ 1] 1104 	ld a,lineno 
      0086AD 00 07 27         [ 1] 1105 	or a,lineno+1
      0086B0 03 1C            [ 1] 1106 	jreq 4$
      0086B2 00 03 CD         [ 2] 1107 	ldw x,#3 
      0086B5 82 30 A6 0D      [ 2] 1108 4$:	addw x,in.w 
      0086B9 CD 82 1E         [ 4] 1109 	call spaces
      0086BC 5F C6            [ 1] 1110 	ld a,#'^ 
      0086BE 00 06 CA         [ 4] 1111 	call putc 
      0086C1 00 07 27         [ 2] 1112 1$: ldw x,#STACK_EMPTY 
      0086C4 03               [ 1] 1113     ldw sp,x
      000658                       1114 warm_start:
      0086C5 AE 00 03 72      [ 1] 1115 	clr flags 
      0086C9 BB 00 01 CD      [ 1] 1116 	clr loop_depth 
      0086CD 82 58 A6         [ 2] 1117 	ldw x,#dstack_unf 
      0086D0 5E CD 82         [ 2] 1118 	ldw dstkptr,x 
      0086D3 1E AE 17 FF      [ 1] 1119 	mov tab_width,#TAB_WIDTH 
      0086D7 94 0A 00 07      [ 1] 1120 	mov base,#10 
      0086D8 5F               [ 1] 1121 	clrw x 
      0086D8 72 5F 00         [ 2] 1122 	ldw lineno,x 
      0086DB 25 72 5F         [ 2] 1123 	ldw x,#tib 
      0086DE 00 20 AE         [ 2] 1124 	ldw basicptr,x 
                                   1125 ;----------------------------
                                   1126 ;   BASIC interpreter
                                   1127 ;----------------------------
      000678                       1128 interp:
      0086E1 17 80 CF 00      [ 1] 1129 	clr in.w
      0086E5 1A 35 04 00 26   [ 2] 1130 	btjf flags,#FRUN,4$ 
                                   1131 ; running program
                                   1132 ; goto next basic line 
      0086EA 35 0A 00         [ 2] 1133 	ldw x,basicptr
      0086ED 08 5F            [ 1] 1134 	ld a,(2,x) ; line length 
      0086EF CF 00 06         [ 1] 1135 	ld acc8,a 
      0086F2 AE 16 C8 CF      [ 1] 1136 	clr acc16 
      0086F6 00 04 03         [ 2] 1137 	addw x,#3 
      0086F8 72 BB 00 09      [ 2] 1138 	addw x,acc16
      0086F8 72 5F 00         [ 2] 1139 	cpw x,txtend 
      0086FB 01 72            [ 1] 1140 	jrpl warm_start
      0086FD 01 00 25         [ 2] 1141 	ldw basicptr,x ; start of next line  
      008700 2C CE            [ 1] 1142 	ld a,(2,x)
      008702 00 04            [ 1] 1143 	add a,#2 ; because 'in' start at 3.
      008704 E6 02 C7         [ 1] 1144 	ld count,a 
      008707 00               [ 2] 1145 	ldw x,(x) ; line no 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



      008708 0B 72 5F         [ 2] 1146 	ldw lineno,x 
      00870B 00 0A 1C 00      [ 1] 1147 	mov in,#3 ; skip first 3 bytes of line 
      00870F 03 72            [ 2] 1148 	jra interp_loop 
      0006AD                       1149 4$: ; commande line mode 	
      008711 BB 00 0A C3      [ 1] 1150 	clr in 
      008715 00 1E            [ 1] 1151 	ld a,#CR 
      008717 2A BF CF         [ 4] 1152 	call putc 
      00871A 00 04            [ 1] 1153 	ld a,#'> 
      00871C E6 02 AB         [ 4] 1154 	call putc 
      00871F 02 C7 00         [ 4] 1155 	call readln
      0006BE                       1156 interp_loop:  
      008722 03 FE CF         [ 1] 1157 	ld a,in 
      008725 00 06 35         [ 1] 1158 	cp a,count 
      008728 03 00            [ 1] 1159 	jrpl interp
      00872A 02 20 11         [ 4] 1160 	call get_token
      00872D A1 01            [ 1] 1161 	cp a,#TK_COLON 
      00872D 72 5F            [ 1] 1162 	jreq interp_loop 
      00872F 00 02            [ 1] 1163 	cp a,#TK_NONE 
      008731 A6 0D            [ 1] 1164 	jreq interp 
      0006D1                       1165 1$:
      008733 CD 82            [ 1] 1166 	cp a,#TK_VAR
      008735 1E A6            [ 1] 1167 	jrne 2$
      008737 3E CD 82         [ 4] 1168 	call let02  
      00873A 1E CD            [ 2] 1169 	jra interp_loop 
      0006DA                       1170 2$:	
      00873C 89 BD            [ 1] 1171 	cp a,#TK_ARRAY 
      00873E 26 08            [ 1] 1172 	jrne 3$
      00873E C6 00 02         [ 4] 1173 	call get_array_element
      008741 C1 00 03         [ 4] 1174 	call let02 
      008744 2A B2            [ 2] 1175 	jra interp_loop 
      0006E6                       1176 3$:
      008746 CD 8C            [ 1] 1177 	cp a,#TK_CMD
      008748 67 A1            [ 1] 1178 	jrne 4$
      00874A 01               [ 4] 1179 	call (x) 
      00874B 27 F1            [ 2] 1180 	jra interp_loop 
      0006ED                       1181 4$:	
      00874D A1 00            [ 1] 1182 	cp a,#TK_INTGR
      00874F 27 A7            [ 1] 1183 	jrne 5$
      008751 CD 03 70         [ 4] 1184 	call insert_line 
      008751 A1 02 26         [ 2] 1185 	jp interp
      0006F7                       1186 5$: 
      008754 05 CD 92         [ 2] 1187 	jp syntax_error 
                                   1188 
                                   1189 ;----------------------------------------
                                   1190 ;   DEBUG support functions
                                   1191 ;----------------------------------------
                           000001  1192 .if DEBUG 
                                   1193 ; turn LED on 
      0006FA                       1194 ledon:
      008757 CA 20 E4 0A      [ 1] 1195     bset PC_ODR,#LED2_BIT
      00875A 81               [ 4] 1196     ret 
                                   1197 
                                   1198 ; turn LED off 
      0006FF                       1199 ledoff:
      00875A A1 03 26 08      [ 1] 1200     bres PC_ODR,#LED2_BIT 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      00875E CD               [ 4] 1201     ret 
                                   1202 
                                   1203 ; invert LED status 
      000704                       1204 ledtoggle:
      00875F 91 1F            [ 1] 1205     ld a,#LED2_MASK
      008761 CD 92 CA         [ 1] 1206     xor a,PC_ODR
      008764 20 D8 0A         [ 1] 1207     ld PC_ODR,a
      008766 81               [ 4] 1208     ret 
                                   1209 
      00070D                       1210 left_paren:
      008766 A1 07            [ 1] 1211 	ld a,#SPACE 
      008768 26 03 FD         [ 4] 1212 	call putc
      00876B 20 D1            [ 1] 1213 	ld a,#'( 
      00876D CD 01 9E         [ 4] 1214 	call putc 	
      00876D A1               [ 4] 1215 	ret 
                                   1216 
                                   1217 ;------------------------------
                                   1218 ; print 8 bit register 
                                   1219 ; input:
                                   1220 ;   X  point to register name 
                                   1221 ;   A  register value to print 
                                   1222 ; output:
                                   1223 ;   none
                                   1224 ;------------------------------- 
      000718                       1225 prt_reg8:
      00876E 0A               [ 1] 1226 	push a 
      00876F 26 06 CD         [ 4] 1227 	call puts 
      008772 83 F0            [ 1] 1228 	ld a,(1,sp) 
      008774 CC 86 F8         [ 1] 1229 	ld acc8,a 
      008777 5F               [ 1] 1230 	clrw x 
      008777 CC               [ 1] 1231 	ld xl,a 
      008778 86 7C 00 07      [ 1] 1232 	mov base,#16
      00877A CD 08 4F         [ 4] 1233 	call print_int 
      00877A 72 1A 50         [ 4] 1234 	call left_paren 
      00877D 0A               [ 1] 1235 	pop a 
      00877E 81               [ 1] 1236 	clrw x 
      00877F 97               [ 1] 1237 	ld xl,a 
      00877F 72 1B 50 0A      [ 1] 1238 	mov base,#10 
      008783 81 08 4F         [ 4] 1239 	call print_int  
      008784 A6 29            [ 1] 1240 	ld a,#') 
      008784 A6 20 C8         [ 4] 1241 	call putc
      008787 50               [ 4] 1242 	ret
                                   1243 
                                   1244 ;--------------------------------
                                   1245 ; print 16 bits register 
                                   1246 ; input:
                                   1247 ;   X   point register name 
                                   1248 ;   Y   register value to print 
                                   1249 ; output:
                                   1250 ;  none
                                   1251 ;--------------------------------
      00073D                       1252 prt_reg16: 
      008788 0A C7            [ 2] 1253 	pushw y 
      00878A 50 0A 81         [ 4] 1254 	call puts 
      00878D 1E 01            [ 2] 1255 	ldw x,(1,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



      00878D A6 20 CD 82      [ 1] 1256 	mov base,#16 
      008791 1E A6 28         [ 4] 1257 	call print_int  
      008794 CD 82 1E         [ 4] 1258 	call left_paren 
      008797 81               [ 2] 1259 	popw x 
      008798 35 0A 00 07      [ 1] 1260 	mov base,#10 
      008798 88 CD 82         [ 4] 1261 	call print_int  
      00879B 30 7B            [ 1] 1262 	ld a,#') 
      00879D 01 C7 00         [ 4] 1263 	call putc
      0087A0 0B               [ 4] 1264 	ret 
                                   1265 
                                   1266 ;------------------------------------
                                   1267 ; print registers contents saved on
                                   1268 ; stack by trap interrupt.
                                   1269 ;------------------------------------
      00075C                       1270 print_registers:
      0087A1 5F 97 35         [ 2] 1271 	ldw x,#STATES
      0087A4 10 00 08         [ 4] 1272 	call puts
                                   1273 ; print EPC 
      0087A7 CD 88 CF         [ 2] 1274 	ldw x, #REG_EPC
      0087AA CD 87 8D         [ 4] 1275 	call puts 
      0087AD 84 5F            [ 1] 1276 	ld a, (11,sp)
      0087AF 97 35 0A         [ 1] 1277 	ld acc8,a 
      0087B2 00 08            [ 1] 1278 	ld a, (10,sp) 
      0087B4 CD 88 CF         [ 1] 1279 	ld acc16,a 
      0087B7 A6 29            [ 1] 1280 	ld a,(9,sp) 
      0087B9 CD 82 1E         [ 1] 1281 	ld acc24,a
      0087BC 81               [ 1] 1282 	clrw x  
      0087BD A6 10            [ 1] 1283 	ld a,#16
      0087BD 90 89 CD         [ 4] 1284 	call prti24  
                                   1285 ; print X
      0087C0 82 30 1E         [ 2] 1286 	ldw x,#REG_X
      0087C3 01 35            [ 2] 1287 	ldw y,(5,sp)
      0087C5 10 00 08         [ 4] 1288 	call prt_reg16  
                                   1289 ; print Y 
      0087C8 CD 88 CF         [ 2] 1290 	ldw x,#REG_Y
      0087CB CD 87            [ 2] 1291 	ldw y, (7,sp)
      0087CD 8D 85 35         [ 4] 1292 	call prt_reg16  
                                   1293 ; print A 
      0087D0 0A 00 08         [ 2] 1294 	ldw x,#REG_A
      0087D3 CD 88            [ 1] 1295 	ld a, (4,sp) 
      0087D5 CF A6 29         [ 4] 1296 	call prt_reg8
                                   1297 ; print CC 
      0087D8 CD 82 1E         [ 2] 1298 	ldw x,#REG_CC 
      0087DB 81 03            [ 1] 1299 	ld a, (3,sp) 
      0087DC CD 07 18         [ 4] 1300 	call prt_reg8 
                                   1301 ; print SP 
      0087DC AE 88 2F         [ 2] 1302 	ldw x,#REG_SP
      0087DF CD 82            [ 1] 1303 	ldw y,sp 
      0087E1 30 AE 88 6C      [ 2] 1304 	addw y,#12
      0087E5 CD 82 30         [ 4] 1305 	call prt_reg16  
      0087E8 7B 0B            [ 1] 1306 	ld a,#'\n' 
      0087EA C7 00 0B         [ 4] 1307 	call putc
      0087ED 7B               [ 4] 1308 	ret
                                   1309 
      0087EE 0A C7 00 0A 7B 09 C7  1310 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 26.
Hexadecimal  00-Bits]



             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      0087F6 09 5F A6 10 CD        1311 REG_EPC: .asciz "EPC:"
      0087FB 88 87 AE 88           1312 REG_Y:   .asciz "\nY:" 
      0087FF 75 16 05 CD           1313 REG_X:   .asciz "\nX:"
      008803 87 BD AE 88           1314 REG_A:   .asciz "\nA:" 
      008807 71 16 07 CD 87        1315 REG_CC:  .asciz "\nCC:"
      00880C BD AE 88 79 7B        1316 REG_SP:  .asciz "\nSP:"
                                   1317 .endif ; DEBUG 
                                   1318 
                                   1319 ;------------------------------------
                                   1320 ; print integer in acc24 
                                   1321 ; input:
                                   1322 ;	acc24 		integer to print 
                                   1323 ;	A 			numerical base for conversion 
                                   1324 ;               if bit 7 is set add a space at print end.
                                   1325 ;   XL 			field width, 0 -> no fill.
                                   1326 ;  output:
                                   1327 ;    none 
                                   1328 ;------------------------------------
                           000001  1329 	WIDTH = 1
                           000002  1330 	BASE = 2
                           000003  1331 	ADD_SPACE=3 ; add a space after number 
                           000003  1332 	VSIZE = 3
      000807                       1333 prti24:
      000807                       1334 	_vars VSIZE 
      008811 04 CD            [ 2]    1     sub sp,#VSIZE 
      008813 87 98            [ 1] 1335 	clr (ADD_SPACE,sp)
      008815 AE 88            [ 1] 1336 	bcp a,#0x80 
      008817 7D 7B            [ 1] 1337 	jreq 0$ 
      008819 03 CD            [ 1] 1338 	cpl (ADD_SPACE,sp)
      00881B 87 98            [ 1] 1339 0$:	and a,#31 
      00881D AE 88            [ 1] 1340 	ld (BASE,sp),a
      00881F 82               [ 1] 1341 	ld a,xl
      008820 90 96            [ 1] 1342 	ld (WIDTH,sp),a 
      008822 72 A9            [ 1] 1343 	ld a, (BASE,sp)  
      008824 00 0C CD         [ 4] 1344     call itoa  ; conversion entier en  .asciz
      008827 87 BD            [ 1] 1345 1$: ld a,(WIDTH,sp)
      008829 A6 0A            [ 1] 1346 	jreq 4$
      00882B CD 82 1E         [ 1] 1347 	ld acc8,a 
      00882E 81               [ 2] 1348 	pushw x 
      00882F 0A 52 65         [ 4] 1349 	call strlen 
      008832 67               [ 1] 1350 	ld a,xl 
      008833 69               [ 2] 1351 	popw x 
      008834 73 74 65         [ 3] 1352 	exg a,acc8 
      008837 72 73 20         [ 1] 1353 	sub a,acc8 
      00883A 73 74            [ 1] 1354 	jrmi 4$
      00883C 61 74            [ 1] 1355 	ld (WIDTH,sp),a 
      00883E 65 20            [ 1] 1356 	ld  a,#SPACE
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      008840 61 74            [ 1] 1357 3$: tnz (WIDTH,sp)
      008842 20 61            [ 1] 1358 	jreq 4$
      008844 62               [ 2] 1359 	decw x 
      008845 6F               [ 1] 1360 	ld (x),a 
      008846 72 74            [ 1] 1361 	dec (WIDTH,sp) 
      008848 20 70            [ 2] 1362 	jra 3$
      000840                       1363 4$: 
      00884A 6F 69 6E         [ 4] 1364 	call puts 
      00884D 74 2E            [ 1] 1365 	tnz (ADD_SPACE,sp)
      00884F 0A 2D            [ 1] 1366 	jreq 5$
      008851 2D 2D            [ 1] 1367     ld a,#SPACE 
      008853 2D 2D 2D         [ 4] 1368 	call putc 
      00084C                       1369 5$: _drop VSIZE 
      008856 2D 2D            [ 2]    1     addw sp,#VSIZE 
      008858 2D               [ 4] 1370     ret	
                                   1371 
                                   1372 ;-----------------------------------
                                   1373 ; print a 16 bit integer 
                                   1374 ; using variable 'base' as conversion
                                   1375 ; format.
                                   1376 ; input:
                                   1377 ;   X       integer to print 
                                   1378 ;   base    conversion base 
                                   1379 ; output:
                                   1380 ;   none 
                                   1381 ;-----------------------------------
                           000001  1382 	SIGN=1
                           000001  1383 	VSIZE=1
      00084F                       1384 print_int: 
      00084F                       1385 	_vars VSIZE 
      008859 2D 2D            [ 2]    1     sub sp,#VSIZE 
      00885B 2D 2D            [ 1] 1386 	clr (SIGN,sp)
      00885D 2D 2D 2D 2D      [ 2] 1387 	ldw y,#pad+PAD_SIZE-1 
      008861 2D 2D            [ 1] 1388 	clr (y)
      008863 2D 2D 2D         [ 1] 1389 	ld a,base  
      008866 2D 2D            [ 1] 1390 	cp a,#10 
      008868 2D 2D            [ 1] 1391 	jrne 1$ 
      00886A 0A               [ 2] 1392 	tnzw x 
      00886B 00 45            [ 1] 1393 	jrpl 1$ 
      00886D 50 43            [ 1] 1394 	cpl (SIGN,sp)
      00886F 3A               [ 2] 1395 	negw x 	 
      000866                       1396 1$:	
      008870 00 0A 59         [ 1] 1397 	ld a,base 
      008873 3A               [ 2] 1398 	div x,a 
      008874 00 0A            [ 1] 1399 	add a,#'0 
      008876 58 3A            [ 1] 1400 	cp a,#'9+1 
      008878 00 0A            [ 1] 1401 	jrmi 2$ 
      00887A 41 3A            [ 1] 1402 	add a,#7 
      00887C 00 0A            [ 2] 1403 2$: decw y 
      00887E 43 43            [ 1] 1404 	ld (y),a 
      008880 3A               [ 2] 1405 	tnzw x 
      008881 00 0A            [ 1] 1406 	jrne 1$ 
      008883 53 50            [ 1] 1407 	ld a,#16 
      008885 3A 00 07         [ 1] 1408 	cp a,base 
      008887 26 08            [ 1] 1409 	jrne 3$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008887 52 03            [ 1] 1410 	ld a,#'$
      008889 0F 03            [ 2] 1411 	decw y  
      00888B A5 80            [ 1] 1412 	ld (y),a
      00888D 27 02            [ 2] 1413 	jra 9$ 
      00888F 03 03            [ 1] 1414 3$: tnz (SIGN,sp)
      008891 A4 1F            [ 1] 1415 	jreq 9$ 
      008893 6B 02            [ 1] 1416 	ld a,#'-
      008895 9F 6B            [ 2] 1417 	decw y  
      008897 01 7B            [ 1] 1418 	ld (y),a
      000892                       1419 9$:	
      008899 02               [ 1] 1420 	ldw x,y 
      00889A CD 89 2B         [ 2] 1421 	subw x,#pad+PAD_SIZE-1 
      00889D 7B               [ 2] 1422 	negw x  
      000897                       1423 10$:
      00889E 01 27            [ 2] 1424 	decw y 
      0088A0 1F C7            [ 1] 1425 	ld a,#SPACE 
      0088A2 00 0B            [ 1] 1426 	ld (y),a
      0088A4 89               [ 1] 1427 	incw x 
      0088A5 CD               [ 1] 1428 	ld a,xl 
      0088A6 82 F2 9F         [ 1] 1429 	cp a,tab_width
      0088A9 85 31            [ 1] 1430 	jrmi 10$ 
      0008A4                       1431 12$:
      0088AB 00               [ 1] 1432     ldw x,y 
      0088AC 0B C0 00         [ 4] 1433 	call puts  
      0008A8                       1434 	_drop VSIZE 
      0088AF 0B 2B            [ 2]    1     addw sp,#VSIZE 
      0088B1 0E               [ 4] 1435 	ret 
                                   1436 
                                   1437 ;------------------------------------
                                   1438 ; convert integer in acc24 to string
                                   1439 ; input:
                                   1440 ;   A	  	base
                                   1441 ;	acc24	integer to convert
                                   1442 ; output:
                                   1443 ;   X  		pointer to string
                                   1444 ;------------------------------------
                           000001  1445 	SIGN=1  ; integer sign 
                           000002  1446 	BASE=2  ; numeric base 
                           000002  1447 	VSIZE=2  ;locals size
      0008AB                       1448 itoa:
      0088B2 6B 01            [ 2] 1449 	sub sp,#VSIZE
      0088B4 A6 20            [ 1] 1450 	ld (BASE,sp), a  ; base
      0088B6 0D 01            [ 1] 1451 	clr (SIGN,sp)    ; sign
      0088B8 27 06            [ 1] 1452 	cp a,#10
      0088BA 5A F7            [ 1] 1453 	jrne 1$
                                   1454 	; base 10 string display with negative sign if bit 23==1
      0088BC 0A 01 20 F6 05   [ 2] 1455 	btjf acc24,#7,1$
      0088C0 03 01            [ 1] 1456 	cpl (SIGN,sp)
      0088C0 CD 82 30         [ 4] 1457 	call neg_acc24
      0008BF                       1458 1$:
                                   1459 ; initialize string pointer 
      0088C3 0D 03 27         [ 2] 1460 	ldw x,#pad+PAD_SIZE-1
      0088C6 05               [ 1] 1461 	clr (x)
      0008C3                       1462 itoa_loop:
      0088C7 A6 20            [ 1] 1463     ld a,(BASE,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      0088C9 CD 82 1E         [ 4] 1464     call divu24_8 ; acc24/A 
      0088CC 5B 03            [ 1] 1465     add a,#'0  ; remainder of division
      0088CE 81 3A            [ 1] 1466     cp a,#'9+1
      0088CF 2B 02            [ 1] 1467     jrmi 2$
      0088CF 52 01            [ 1] 1468     add a,#7 
      0088D1 0F               [ 2] 1469 2$: decw x
      0088D2 01               [ 1] 1470     ld (x),a
                                   1471 	; if acc24==0 conversion done
      0088D3 90 AE 17         [ 1] 1472 	ld a,acc24
      0088D6 3F 90 7F         [ 1] 1473 	or a,acc16
      0088D9 C6 00 08         [ 1] 1474 	or a,acc8
      0088DC A1 0A            [ 1] 1475     jrne itoa_loop
                                   1476 	;conversion done, next add '$' or '-' as required
      0088DE 26 06            [ 1] 1477 	ld a,(BASE,sp)
      0088E0 5D 2A            [ 1] 1478 	cp a,#16
      0088E2 03 03            [ 1] 1479 	jreq 8$
      0088E4 01 50            [ 1] 1480 	ld a,(SIGN,sp)
      0088E6 27 08            [ 1] 1481     jreq 10$
      0088E6 C6 00            [ 1] 1482     ld a,#'-
      0088E8 08 62            [ 2] 1483 	jra 9$ 
      0088EA AB 30            [ 1] 1484 8$: ld a,#'$ 
      0088EC A1               [ 2] 1485 9$: decw x
      0088ED 3A               [ 1] 1486     ld (x),a
      0008EF                       1487 10$:
      0088EE 2B 02            [ 2] 1488 	addw sp,#VSIZE
      0088F0 AB               [ 4] 1489 	ret
                                   1490 
                                   1491 ;-------------------------------------
                                   1492 ; divide uint24_t by uint8_t
                                   1493 ; used to convert uint24_t to string
                                   1494 ; input:
                                   1495 ;	acc24	dividend
                                   1496 ;   A 		divisor
                                   1497 ; output:
                                   1498 ;   acc24	quotient
                                   1499 ;   A		remainder
                                   1500 ;------------------------------------- 
                                   1501 ; offset  on sp of arguments and locals
                           000001  1502 	U8   = 1   ; divisor on stack
                           000001  1503 	VSIZE =1
      0008F2                       1504 divu24_8:
      0088F1 07               [ 2] 1505 	pushw x ; save x
      0088F2 90               [ 1] 1506 	push a 
                                   1507 	; ld dividend UU:MM bytes in X
      0088F3 5A 90 F7         [ 1] 1508 	ld a, acc24
      0088F6 5D               [ 1] 1509 	ld xh,a
      0088F7 26 ED A6         [ 1] 1510 	ld a,acc24+1
      0088FA 10               [ 1] 1511 	ld xl,a
      0088FB C1 00            [ 1] 1512 	ld a,(U8,SP) ; divisor
      0088FD 08               [ 2] 1513 	div x,a ; UU:MM/U8
      0088FE 26               [ 1] 1514 	push a  ;save remainder
      0088FF 08               [ 1] 1515 	ld a,xh
      008900 A6 24 90         [ 1] 1516 	ld acc24,a
      008903 5A               [ 1] 1517 	ld a,xl
      008904 90 F7 20         [ 1] 1518 	ld acc24+1,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



      008907 0A               [ 1] 1519 	pop a
      008908 0D               [ 1] 1520 	ld xh,a
      008909 01 27 06         [ 1] 1521 	ld a,acc24+2
      00890C A6               [ 1] 1522 	ld xl,a
      00890D 2D 90            [ 1] 1523 	ld a,(U8,sp) ; divisor
      00890F 5A               [ 2] 1524 	div x,a  ; R:LL/U8
      008910 90 F7            [ 1] 1525 	ld (U8,sp),a ; save remainder
      008912 9F               [ 1] 1526 	ld a,xl
      008912 93 1D 17         [ 1] 1527 	ld acc24+2,a
      008915 3F               [ 1] 1528 	pop a
      008916 50               [ 2] 1529 	popw x
      008917 81               [ 4] 1530 	ret
                                   1531 
                                   1532 ;------------------------------------
                                   1533 ;  two's complement acc24
                                   1534 ;  input:
                                   1535 ;		acc24 variable
                                   1536 ;  output:
                                   1537 ;		acc24 variable
                                   1538 ;-------------------------------------
      00091A                       1539 neg_acc24:
      008917 90 5A A6 20      [ 1] 1540 	cpl acc24+2
      00891B 90 F7 5C 9F      [ 1] 1541 	cpl acc24+1
      00891F C1 00 26 2B      [ 1] 1542 	cpl acc24
      008923 F3 01            [ 1] 1543 	ld a,#1
      008924 CB 00 0A         [ 1] 1544 	add a,acc24+2
      008924 93 CD 82         [ 1] 1545 	ld acc24+2,a
      008927 30               [ 1] 1546 	clr a
      008928 5B 01 81         [ 1] 1547 	adc a,acc24+1
      00892B C7 00 09         [ 1] 1548 	ld acc24+1,a 
      00892B 52               [ 1] 1549 	clr a 
      00892C 02 6B 02         [ 1] 1550 	adc a,acc24 
      00892F 0F 01 A1         [ 1] 1551 	ld acc24,a 
      008932 0A               [ 4] 1552 	ret
                                   1553 
                                   1554 
                                   1555 ;------------------------------------
                                   1556 ; read a line of text from terminal
                                   1557 ; input:
                                   1558 ;	none
                                   1559 ; local variable on stack:
                                   1560 ;	LL  line length
                                   1561 ;   RXCHAR last received chaaracte 
                                   1562 ; output:
                                   1563 ;   text in tib  buffer
                                   1564 ;------------------------------------
                                   1565 	; local variables
                           000001  1566 	LL_HB=1
                           000001  1567 	RXCHAR = 1 ; last char received
                           000002  1568 	LL = 2  ; accepted line length
                           000002  1569 	VSIZE=2 
      00093D                       1570 readln:
      008933 26               [ 1] 1571 	clrw x 
      008934 0A               [ 2] 1572 	pushw x 
      008935 72 0F 00 09      [ 2] 1573  	ldw y,#tib ; input buffer
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



      000943                       1574 readln_loop:
      008939 05 03 01         [ 4] 1575 	call getc
      00893C CD 89            [ 1] 1576 	ld (RXCHAR,sp),a
      00893E 9A 0D            [ 1] 1577 	cp a,#CR
      00893F 26 03            [ 1] 1578 	jrne 1$
      00893F AE 17 3F         [ 2] 1579 	jp readln_quit
      008942 7F 0A            [ 1] 1580 1$:	cp a,#NL
      008943 27 69            [ 1] 1581 	jreq readln_quit
      008943 7B 02            [ 1] 1582 	cp a,#BSP
      008945 CD 89            [ 1] 1583 	jreq del_back
      008947 72 AB            [ 1] 1584 	cp a,#CTRL_D
      008949 30 A1            [ 1] 1585 	jreq del_ln
      00894B 3A 2B            [ 1] 1586 	cp a,#CTRL_R 
      00894D 02 AB            [ 1] 1587 	jreq reprint 
                                   1588 ;	cp a,#'[
                                   1589 ;	jreq ansi_seq
      00095F                       1590 final_test:
      00894F 07 5A            [ 1] 1591 	cp a,#SPACE
      008951 F7 C6            [ 1] 1592 	jrpl accept_char
      008953 00 09            [ 2] 1593 	jra readln_loop
      000965                       1594 ansi_seq:
                                   1595 ;	call getc
                                   1596 ;	cp a,#'C 
                                   1597 ;	jreq rigth_arrow
                                   1598 ;	cp a,#'D 
                                   1599 ;	jreq left_arrow 
                                   1600 ;	jra final_test
      000965                       1601 right_arrow:
                                   1602 ;	ld a,#BSP 
                                   1603 ;	call putc 
                                   1604 ;	jra realn_loop 
      000965                       1605 left_arrow:
                                   1606 
                                   1607 ;	jra readln_loop
      000965                       1608 reprint: 
      008955 CA 00 0A CA      [ 1] 1609 	tnz count 
      008959 00 0B            [ 1] 1610 	jreq readln_loop
      00895B 26 E6            [ 1] 1611 	tnz (LL,sp)
      00895D 7B 02            [ 1] 1612 	jrne readln_loop
      00895F A1 10 27         [ 2] 1613 	ldw x,#tib 
      008962 08 7B 01         [ 4] 1614 	call puts
      008965 27 08 A6 2D      [ 2] 1615 	ldw y,#tib 
      008969 20 02 A6         [ 1] 1616 	ld a,count 
      00896C 24 5A            [ 1] 1617 	ld (LL,sp),a
      00896E F7 5F 00 02      [ 1] 1618 	clr count 
      00896F 0F 01            [ 1] 1619 	clr (LL_HB,sp)
      00896F 5B 02 81         [ 2] 1620 	addw y,(LL_HB,sp)
      008972 20 BA            [ 2] 1621 	jra readln_loop 
      000989                       1622 del_ln:
      008972 89 88            [ 1] 1623 	ld a,(LL,sp)
      008974 C6 00 09         [ 4] 1624 	call delete
      008977 95 C6 00 0A      [ 2] 1625 	ldw y,#tib
      00897B 97 7B            [ 1] 1626 	clr (y)
      00897D 01 62            [ 1] 1627 	clr (LL,sp)
      00897F 88 9E            [ 2] 1628 	jra readln_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      000998                       1629 del_back:
      008981 C7 00            [ 1] 1630     tnz (LL,sp)
      008983 09 9F            [ 1] 1631     jreq readln_loop
      008985 C7 00            [ 1] 1632     dec (LL,sp)
      008987 0A 84            [ 2] 1633     decw y
      008989 95 C6            [ 1] 1634     clr  (y)
      00898B 00 0B 97         [ 4] 1635     call bksp 
      00898E 7B 01            [ 2] 1636     jra readln_loop	
      0009A7                       1637 accept_char:
      008990 62 6B            [ 1] 1638 	ld a,#TIB_SIZE-1
      008992 01 9F            [ 1] 1639 	cp a, (LL,sp)
      008994 C7 00            [ 1] 1640 	jreq readln_loop
      008996 0B 84            [ 1] 1641 	ld a,(RXCHAR,sp)
      008998 85 81            [ 1] 1642 	ld (y),a
      00899A 0C 02            [ 1] 1643 	inc (LL,sp)
      00899A 72 53            [ 1] 1644 	incw y
      00899C 00 0B            [ 1] 1645 	clr (y)
      00899E 72 53 00         [ 4] 1646 	call putc 
      0089A1 0A 72            [ 2] 1647 	jra readln_loop
      0009BC                       1648 readln_quit:
      0089A3 53 00            [ 1] 1649 	clr (y)
      0089A5 09 A6            [ 1] 1650 	ld a,(LL,sp)
      0089A7 01 CB 00         [ 1] 1651 	ld count,a 
      0009C3                       1652 	_drop VSIZE 
      0089AA 0B C7            [ 2]    1     addw sp,#VSIZE 
      0089AC 00 0B            [ 1] 1653 	ld a,#CR
      0089AE 4F C9 00         [ 4] 1654 	call putc
      0089B1 0A               [ 4] 1655 	ret
                                   1656 
                           000001  1657 .if DEBUG 	
                                   1658 ;----------------------------
                                   1659 ; command interface
                                   1660 ; only 3 commands:
                                   1661 ;  'q' to resume application
                                   1662 ;  'p [addr]' to print memory values 
                                   1663 ;  's addr' to print string 
                                   1664 ;----------------------------
                                   1665 ;local variable 
                           000001  1666 	PSIZE=1
                           000001  1667 	VSIZE=1 
      0009CB                       1668 cmd_itf:
      0089B2 C7 00            [ 2] 1669 	sub sp,#VSIZE 
      0089B4 0A 4F C9 00      [ 1] 1670 	clr farptr 
      0089B8 09 C7 00 09      [ 1] 1671 	clr farptr+1 
      0089BC 81 5F 00 15      [ 1] 1672 	clr farptr+2  
      0089BD                       1673 repl:
      0089BD 5F 89            [ 1] 1674 	ld a,#CR 
      0089BF 90 AE 16         [ 4] 1675 	call putc 
      0089C2 C8 3F            [ 1] 1676 	ld a,#'? 
      0089C3 CD 01 9E         [ 4] 1677 	call putc
      0089C3 CD 82 27 6B      [ 1] 1678 	clr in.w 
      0089C7 01 A1 0D 26      [ 1] 1679 	clr in 
      0089CB 03 CC 8A         [ 4] 1680 	call readln
      0089CE 3C A1 0A 27      [ 2] 1681 	ldw y,#tib  
      0089D2 69 A1            [ 1] 1682 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



      0089D4 08 27            [ 1] 1683 	jreq repl  
      0089D6 41 A1 04 27      [ 1] 1684 	inc in 
      0089DA 2E A1 12         [ 4] 1685 	call to_upper 
      0089DD 27 06            [ 1] 1686 	cp a,#'Q 
      0089DF 26 17            [ 1] 1687 	jrne test_p
      000A01                       1688 repl_exit:
      0089DF A1 20 2A 44      [ 1] 1689 	clr tib 
      0089E3 20 DE 00 02      [ 1] 1690 	clr count 
      0089E5 72 5F 00 01      [ 1] 1691 	clr in 
      0089E5                       1692 	_drop #VSIZE 	
      0089E5 5B 01            [ 2]    1     addw sp,##VSIZE 
      0089E5 81               [ 4] 1693 	ret  
      000A10                       1694 invalid:
      0089E5 72 5D 00         [ 2] 1695 	ldw x,#invalid_cmd 
      0089E8 03 27 D8         [ 4] 1696 	call puts 
      0089EB 0D 02            [ 2] 1697 	jra repl 
      000A18                       1698 test_p:	
      0089ED 26 D4            [ 1] 1699     cp a,#'P 
      0089EF AE 16            [ 1] 1700 	jreq mem_peek
      0089F1 C8 CD            [ 1] 1701     cp a,#'S 
      0089F3 82 30            [ 1] 1702 	jrne invalid 
      000A20                       1703 print_string:	
      0089F5 90 AE 16         [ 4] 1704 	call get_token
      0089F8 C8 C6            [ 1] 1705 	cp a,#TK_INTGR 
      0089FA 00 03            [ 1] 1706 	jrne invalid 
      0089FC 6B 02 72         [ 4] 1707 	call puts
      0089FF 5F 00 03         [ 2] 1708 	jp repl 	
      000A2D                       1709 mem_peek:
      008A02 0F 01            [ 1] 1710 	ld a,#SPACE 
      008A04 72 F9 01         [ 4] 1711 	call skip  	 
      008A07 20 BA 00 00      [ 2] 1712 	addw y,in.w 
      008A09 AE 17 18         [ 2] 1713 	ldw x,#pad 
      008A09 7B 02 CD         [ 4] 1714 	call strcpy
      008A0C 82 4A 90         [ 4] 1715 	call atoi24 	
      008A0F AE 16 C8         [ 1] 1716 	ld a, acc24 
      008A12 90 7F 0F         [ 1] 1717 	or a,acc16 
      008A15 02 20 AB         [ 1] 1718 	or a,acc8 
      008A18 26 02            [ 1] 1719 	jrne 1$ 
      008A18 0D 02            [ 2] 1720 	jra peek_byte  
      008A1A 27 A7 0A         [ 2] 1721 1$:	ldw x,acc24 
      008A1D 02 90 5A         [ 2] 1722 	ldw farptr,x 
      008A20 90 7F CD         [ 1] 1723 	ld a,acc8 
      008A23 82 3A 20         [ 1] 1724 	ld farptr+2,a 
      000A58                       1725 peek_byte:
      008A26 9C 0A 9D         [ 4] 1726 	call print_farptr 
      008A27 A6 08            [ 1] 1727 	ld a,#8 
      008A27 A6 4F            [ 1] 1728 	ld (PSIZE,sp),a 
      008A29 11               [ 1] 1729 	clrw x 
      008A2A 02 27 96         [ 4] 1730 1$:	call fetchc  
      008A2D 7B               [ 2] 1731 	pushw x 
      008A2E 01 90 F7         [ 1] 1732 	ld acc8,a 
      008A31 0C               [ 1] 1733 	clrw x 
      008A32 02 90 5C         [ 2] 1734 	ldw acc24,x 
      008A35 90 7F            [ 1] 1735 	ld a,#16+128
      008A37 CD 82 1E         [ 4] 1736 	call prti24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



      008A3A 20               [ 2] 1737 	popw x 
      008A3B 87 01            [ 1] 1738 	dec (PSIZE,sp)
      008A3C 26 EB            [ 1] 1739 	jrne 1$ 
      008A3C 90 7F            [ 1] 1740 	ld a,#8 
      008A3E 7B 02 C7         [ 1] 1741 	add a,farptr+2 
      008A41 00 03 5B         [ 1] 1742 	ld farptr+2,a
      008A44 02               [ 1] 1743 	clr a 
      008A45 A6 0D CD         [ 1] 1744 	adc a,farptr+1 
      008A48 82 1E 81         [ 1] 1745 	ld farptr+1,a 
      008A4B 4F               [ 1] 1746 	clr a 
      008A4B 52 01 72         [ 1] 1747 	adc a,farptr 
      008A4E 5F 00 14         [ 1] 1748 	ld farptr,a 
      008A51 72 5F 00         [ 2] 1749 	jp repl  
                                   1750 
      008A54 15 72 5F 00 16 20 63  1751 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1752 
                                   1753 ;----------------------------
                                   1754 ; display farptr address
                                   1755 ;----------------------------
      008A59                       1756 print_farptr:
      008A59 A6 0D CD         [ 1] 1757 	ld a ,farptr+2 
      008A5C 82 1E A6         [ 1] 1758 	ld acc8,a 
      008A5F 3F CD 82         [ 2] 1759 	ldw x,farptr 
      008A62 1E 72 5F         [ 2] 1760 	ldw acc24,x 
      008A65 00               [ 1] 1761 	clrw x 
      008A66 01 72            [ 1] 1762 	ld a,#16 
      008A68 5F 00 02         [ 4] 1763 	call prti24
      008A6B CD 89            [ 1] 1764 	ld a,#SPACE 
      008A6D BD 90 AE         [ 4] 1765 	call putc 
      008A70 16 C8 90         [ 4] 1766 	call putc 
      008A73 F6               [ 4] 1767 	ret
                                   1768 
                                   1769 ;------------------------------------
                                   1770 ; get byte at address farptr[X]
                                   1771 ; input:
                                   1772 ;	 farptr   address to peek
                                   1773 ;    X		  farptr index 	
                                   1774 ; output:
                                   1775 ;	 A 		  byte from memory  
                                   1776 ;    x		  incremented by 1
                                   1777 ;------------------------------------
      000AB8                       1778 fetchc: ; @C
      008A74 27 E3 72 5C      [ 5] 1779 	ldf a,([farptr],x)
      008A78 00               [ 1] 1780 	incw x
      008A79 02               [ 4] 1781 	ret
                                   1782 
                                   1783 
                                   1784 ;------------------------------------
                                   1785 ; expect a number from command line 
                                   1786 ; next argument
                                   1787 ;  input:
                                   1788 ;	  none
                                   1789 ;  output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



                                   1790 ;    acc24   int24_t 
                                   1791 ;------------------------------------
      000ABE                       1792 number::
      008A7A CD 8E 2B         [ 4] 1793 	call get_token
      008A7D A1 51 26         [ 4] 1794 	call atoi24
      008A80 17               [ 4] 1795 	ret
                                   1796 .endif ; DEBUG 
                                   1797 
                                   1798 ;------------------------------------
                                   1799 ; parse quoted string 
                                   1800 ; input:
                                   1801 ;   Y 	pointer to tib 
                                   1802 ;   X   pointer to pad
                                   1803 ; output:
                                   1804 ;	pad   parsed string
                                   1805 ;   TOS  char* to pad  
                                   1806 ;------------------------------------
                           000001  1807 	PREV = 1
                           000002  1808 	CURR =2 
                           000002  1809 	VSIZE=2 
      008A81                       1810 parse_quote: ; { -- addr }
      000AC5                       1811 	_vars VSIZE 
      008A81 72 5F            [ 2]    1     sub sp,#VSIZE 
      008A83 16               [ 1] 1812 	clr a
      008A84 C8 72            [ 1] 1813 1$:	ld (PREV,sp),a 
      008A86 5F 00 03 72      [ 1] 1814 2$:	inc in
      008A8A 5F 00 02         [ 4] 1815 	ld a,([in.w],y)
      008A8D 5B 01            [ 1] 1816 	jreq 6$
      008A8F 81 02            [ 1] 1817 	ld (CURR,sp),a 
      008A90 A6 5C            [ 1] 1818 	ld a,#'\
      008A90 AE 8B            [ 1] 1819 	cp a, (PREV,sp)
      008A92 0E CD            [ 1] 1820 	jrne 3$
      008A94 82 30            [ 1] 1821 	clr (PREV,sp)
      008A96 20 C1            [ 1] 1822 	ld a,(CURR,sp)
      008A98 AD 1F            [ 4] 1823 	callr convert_escape
      008A98 A1               [ 1] 1824 	ld (x),a 
      008A99 50               [ 1] 1825 	incw x 
      008A9A 27 11            [ 2] 1826 	jra 2$
      000AE5                       1827 3$:
      008A9C A1 53            [ 1] 1828 	ld a,(CURR,sp)
      008A9E 26 F0            [ 1] 1829 	cp a,#'\'
      008AA0 27 DD            [ 1] 1830 	jreq 1$
      008AA0 CD 8C            [ 1] 1831 	cp a,#'"
      008AA2 67 A1            [ 1] 1832 	jreq 5$ 
      008AA4 0A               [ 1] 1833 	ld (x),a 
      008AA5 26               [ 1] 1834 	incw x 
      008AA6 E9 CD            [ 2] 1835 	jra 2$
      008AA8 82 30 CC 8A      [ 1] 1836 5$:	inc in 
      008AAC 59               [ 1] 1837 6$: clr (x)
      008AAD AE 17 18         [ 2] 1838 	ldw x,#pad 
      000AFB                       1839 	_drop VSIZE
      008AAD A6 20            [ 2]    1     addw sp,#VSIZE 
      008AAF CD 8E            [ 1] 1840 	ld a,#TK_QSTR  
      008AB1 E3               [ 4] 1841 	ret 
                                   1842 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1843 ;---------------------------------------
                                   1844 ; called by parse_quote
                                   1845 ; subtitute escaped character 
                                   1846 ; by their ASCII value .
                                   1847 ; input:
                                   1848 ;   A  character following '\'
                                   1849 ; output:
                                   1850 ;   A  substitued char or same if not valid.
                                   1851 ;---------------------------------------
      000B00                       1852 convert_escape:
      008AB2 72 B9            [ 1] 1853 	cp a,#'a'
      008AB4 00 01            [ 1] 1854 	jrne 1$
      008AB6 AE 17            [ 1] 1855 	ld a,#7
      008AB8 18               [ 4] 1856 	ret 
      008AB9 CD 83            [ 1] 1857 1$: cp a,#'b'
      008ABB 10 CD            [ 1] 1858 	jrne 2$
      008ABD 8E 37            [ 1] 1859 	ld a,#8
      008ABF C6               [ 4] 1860 	ret 
      008AC0 00 09            [ 1] 1861 2$: cp a,#'e' 
      008AC2 CA 00            [ 1] 1862     jrne 3$
      008AC4 0A CA            [ 1] 1863 	ld a,#'\'
      008AC6 00               [ 4] 1864 	ret  
      008AC7 0B 26            [ 1] 1865 3$: cp a,#'\'
      008AC9 02 20            [ 1] 1866 	jrne 4$
      008ACB 0C CE            [ 1] 1867 	ld a,#'\'
      008ACD 00               [ 4] 1868 	ret 
      008ACE 09 CF            [ 1] 1869 4$: cp a,#'f' 
      008AD0 00 14            [ 1] 1870 	jrne 5$ 
      008AD2 C6 00            [ 1] 1871 	ld a,#FF 
      008AD4 0B               [ 4] 1872 	ret  
      008AD5 C7 00            [ 1] 1873 5$: cp a,#'n' 
      008AD7 16 03            [ 1] 1874     jrne 6$ 
      008AD8 A6 0A            [ 1] 1875 	ld a,#0xa 
      008AD8 CD               [ 4] 1876 	ret  
      008AD9 8B 1D            [ 1] 1877 6$: cp a,#'r' 
      008ADB A6 08            [ 1] 1878 	jrne 7$
      008ADD 6B 01            [ 1] 1879 	ld a,#0xd 
      008ADF 5F               [ 4] 1880 	ret  
      008AE0 CD 8B            [ 1] 1881 7$: cp a,#'t' 
      008AE2 38 89            [ 1] 1882 	jrne 8$ 
      008AE4 C7 00            [ 1] 1883 	ld a,#9 
      008AE6 0B               [ 4] 1884 	ret  
      008AE7 5F CF            [ 1] 1885 8$: cp a,#'v' 
      008AE9 00 09            [ 1] 1886 	jrne 9$  
      008AEB A6 90            [ 1] 1887 	ld a,#0xb 
      008AED CD               [ 4] 1888 9$:	ret 
                                   1889 
                                   1890 ;-------------------------
                                   1891 ; integer parser 
                                   1892 ; input:
                                   1893 ;   X 		point to pad 
                                   1894 ;   Y 		point to tib 
                                   1895 ;   A 	    first digit|'$' 
                                   1896 ; output:  
                                   1897 ;   pad     number string 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



                                   1898 ;   X 		integer 
                                   1899 ;   A 		TK_INTGR
                                   1900 ;   TOS     integer 
                                   1901 ;-------------------------
                           000001  1902 	BASE=1
                           000002  1903 	TCHAR=2 
                           000002  1904 	VSIZE=2 
      000B3F                       1905 parse_integer: ; { -- n }
      008AEE 88 87            [ 1] 1906 	push #0 ; TCHAR 
      008AF0 85 0A            [ 1] 1907 	cp a,#'$
      008AF2 01 26            [ 1] 1908 	jreq 1$ 
      008AF4 EB A6            [ 1] 1909 	push #10 ; BASE=10 
      008AF6 08 CB            [ 2] 1910 	jra 2$ 
      008AF8 00 16            [ 1] 1911 1$: push #16  ; BASE=16
      008AFA C7               [ 1] 1912 2$:	ld (x),a 
      008AFB 00               [ 1] 1913 	incw x 
      008AFC 16 4F C9 00      [ 1] 1914 	inc in 
      008B00 15 C7 00         [ 4] 1915 	ld a,([in.w],y)
      008B03 15 4F C9         [ 4] 1916 	call to_upper 
      008B06 00 14            [ 1] 1917 	ld (TCHAR,sp),a 
      008B08 C7 00 14         [ 4] 1918 	call is_digit 
      008B0B CC 8A            [ 1] 1919 	jrc 2$
      008B0D 59 6E            [ 1] 1920 	ld a,#16 
      008B0F 6F 74            [ 1] 1921 	cp a,(BASE,sp)
      008B11 20 61            [ 1] 1922 	jrne 3$ 
      008B13 20 63            [ 1] 1923 	ld a,(TCHAR,sp)
      008B15 6F 6D            [ 1] 1924 	cp a,#'A 
      008B17 6D 61            [ 1] 1925 	jrmi 3$ 
      008B19 6E 64            [ 1] 1926 	cp a,#'G 
      008B1B 0A 00            [ 1] 1927 	jrmi 2$ 
      008B1D 7F               [ 1] 1928 3$:	clr (x)
      008B1D C6 00 16         [ 4] 1929 	call atoi24
      008B20 C7 00 0B         [ 2] 1930 	ldw x,acc16 
      008B23 CE 00            [ 1] 1931 	ld a,#TK_INTGR
      000B77                       1932 	_drop VSIZE  
      008B25 14 CF            [ 2]    1     addw sp,#VSIZE 
      008B27 00               [ 4] 1933 	ret 	
                                   1934 
                                   1935 ;-------------------------
                                   1936 ; binary integer parser 
                                   1937 ; input:
                                   1938 ;   X 		point to pad 
                                   1939 ;   Y 		point to tib 
                                   1940 ;   A 	    '%' 
                                   1941 ; output:  
                                   1942 ;   pad     number string 
                                   1943 ;   X 		integer 
                                   1944 ;   A 		TK_INTGR
                                   1945 ;   TOS     integer 
                                   1946 ;-------------------------
                           000001  1947 	BINARY=1
                           000002  1948 	VSIZE=2
      000B7A                       1949 parse_binary: ; { -- n }
      008B28 09 5F            [ 1] 1950 	push #0
      008B2A A6 10            [ 1] 1951 	push #0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008B2C CD               [ 1] 1952 1$: ld (x),a 
      008B2D 88               [ 1] 1953 	incw x 
      008B2E 87 A6 20 CD      [ 1] 1954 	inc in 
      008B32 82 1E CD         [ 4] 1955 	ld a,([in.w],y)
      008B35 82 1E            [ 1] 1956 	cp a,#'0 
      008B37 81 06            [ 1] 1957 	jreq 2$
      008B38 A1 31            [ 1] 1958 	cp a,#'1 
      008B38 92 AF            [ 1] 1959 	jreq 2$ 
      008B3A 00 14            [ 2] 1960 	jra bin_exit 
      008B3C 5C 81            [ 1] 1961 2$: sub a,#'0	
      008B3E 46               [ 1] 1962 	rrc a 
      008B3E CD 8C            [ 1] 1963 	rlc (BINARY+1,sp)
      008B40 67 CD            [ 1] 1964 	rlc (BINARY,sp)
      008B42 8E 37            [ 2] 1965 	jra 1$  
      000B9A                       1966 bin_exit:
      008B44 81               [ 1] 1967 	clr (x)
      008B45 1E 01            [ 2] 1968 	ldw x,(BINARY,sp)
      008B45 52 02            [ 1] 1969 	ld a,#TK_INTGR 	
      000B9F                       1970 	_drop VSIZE 
      008B47 4F 6B            [ 2]    1     addw sp,#VSIZE 
      008B49 01               [ 4] 1971 	ret
                                   1972 
                                   1973 ;---------------------------
                                   1974 ;  token begin with a letter,
                                   1975 ;  is keyword or variable. 	
                                   1976 ; input:
                                   1977 ;   X 		point to pad 
                                   1978 ;   Y 		point to text
                                   1979 ;   A 	    first letter  
                                   1980 ; output:
                                   1981 ;   X		exec_addr|var_addr 
                                   1982 ;   A 		TK_CMD 
                                   1983 ;   pad 	keyword|var_name  
                                   1984 ;   TOS     exec_addr|var_addr 
                                   1985 ;--------------------------  
      000BA2                       1986 parse_keyword: ; { -- exec_addr|var_addr}
      008B4A 72 5C 00         [ 4] 1987 	call to_upper 
      008B4D 02               [ 1] 1988 	ld (x),a 
      008B4E 91               [ 1] 1989 	incw x 
      008B4F D6 01 27 24      [ 1] 1990 	inc in 
      008B53 6B 02 A6         [ 4] 1991 	ld a,([in.w],y)
      008B56 5C 11 01         [ 4] 1992 	call is_alpha 
      008B59 26 0A            [ 1] 1993 	jrc parse_keyword 
      008B5B 0F               [ 1] 1994 1$: clr (x)
      008B5C 01 7B 02 AD      [ 1] 1995 	tnz pad+1 
      008B60 1F F7            [ 1] 1996 	jrne 2$
                                   1997 ; one letter variable name 
      008B62 5C 20 E5         [ 1] 1998 	ld a,pad 
      008B65 A0 41            [ 1] 1999 	sub a,#'A 
      008B65 7B               [ 1] 2000 	sll a 
      008B66 02               [ 1] 2001 	push a 
      008B67 A1 5C            [ 1] 2002 	push #0
      008B69 27 DD A1         [ 2] 2003 	ldw x,#vars 
      008B6C 22 27 04         [ 2] 2004 	addw x,(1,sp) ; X=var address 
      000BC9                       2005 	_drop 2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



      008B6F F7 5C            [ 2]    1     addw sp,#2 
      008B71 20 D7            [ 1] 2006 	ld a,#TK_VAR 
      008B73 72 5C            [ 2] 2007 	jra 4$ 
      000BCF                       2008 2$: ; check for keyword, otherwise syntax error.
      000BCF                       2009 	_ldx_dict kword_dict
      008B75 00 02 7F         [ 2]    1     ldw x,#kword_dict+2
      008B78 AE 17 18         [ 4] 2010 	call search_dict
      008B7B 5B               [ 1] 2011 	tnz a
      008B7C 02 A6            [ 1] 2012 	jrne 3$ 
      008B7E 06 81 FC         [ 2] 2013 	jp syntax_error
      008B80 A3 14 11         [ 2] 2014 3$: cpw x,#rem  
      008B80 A1 61            [ 1] 2015 	jrne 4$
      008B82 26 03 A6 07 81   [ 1] 2016 	mov in,count 
      008B87 A1               [ 1] 2017 	clr a 
      008B88 62               [ 4] 2018 4$:	ret  	
                                   2019 
                                   2020 
                                   2021 ;------------------------------------
                                   2022 ; Command line tokenizer
                                   2023 ; scan text for next token
                                   2024 ; move token in 'pad'
                                   2025 ; input: 
      000BE7                       2026 	none: 
                                   2027 ; use:
                                   2028 ;	Y   pointer to text
                                   2029 ;   X	pointer to pad 
                                   2030 ;   in.w   index in text buffer
                                   2031 ; output:
                                   2032 ;   A       token attribute 
                                   2033 ;   pad 	token as .asciz
                                   2034 ;   X 		token value   
                                   2035 ;------------------------------------
                                   2036 	; use to check special character 
                                   2037 	.macro _case c t  
                                   2038 	ld a,#c 
                                   2039 	cp a,(TCHAR,sp) 
                                   2040 	jrne t
                                   2041 	.endm 
                                   2042 
                           000001  2043 	TCHAR=1
                           000002  2044 	ATTRIB=2 
                           000002  2045 	VSIZE=2
      000BE7                       2046 get_token: 
      008B89 26 03 A6         [ 2] 2047 	ldw x,in.w 
      008B8C 08 81 A1         [ 2] 2048 	ldw in.w.saved,x 
      008B8F 65 26 03 A6      [ 2] 2049 	ldw y,basicptr   	
      008B93 5C 81 A1         [ 1] 2050 	ld a,in 
      008B96 5C 26 03         [ 1] 2051 	cp a,count 
      008B99 A6 5C            [ 1] 2052 	jrmi 1$
      008B9B 81 A1            [ 1] 2053 	ld a,#TK_NONE 
      008B9D 66               [ 4] 2054 	ret 
      000BFC                       2055 1$:	
      000BFC                       2056 	_vars VSIZE
      008B9E 26 03            [ 2]    1     sub sp,#VSIZE 
      008BA0 A6 0C 81         [ 2] 2057 	ldw x, #pad
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008BA3 A1 6E            [ 1] 2058 	ld a,#SPACE
      008BA5 26 03 A6         [ 4] 2059 	call skip
      008BA8 0A 81 A1         [ 4] 2060 	ld a,([in.w],y)
      008BAB 72 26            [ 1] 2061 	jrne str_tst
      008BAD 03 A6 0D 81      [ 1] 2062 	clr pad 
      008BB1 A1 74 26         [ 2] 2063 	jp token_exit ; end of line 
                                   2064 
      000C12                       2065 str_tst: ; check for quoted string  	
      008BB4 03 A6 09         [ 4] 2066 	call to_upper 
      008BB7 81 A1            [ 1] 2067 	ld (TCHAR,sp),a 
      000C17                       2068 	_case '"' nbr_tst
      008BB9 76 26            [ 1]    1 	ld a,#'"' 
      008BBB 02 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008BBD 0B 81            [ 1]    3 	jrne nbr_tst
      008BBF CD 0A C5         [ 4] 2069 	call parse_quote
      008BBF 4B 00 A1         [ 2] 2070 	jp token_exit
      000C23                       2071 nbr_tst: ; check for number 
      008BC2 24 27            [ 1] 2072 	ld a,#'$'
      008BC4 04 4B            [ 1] 2073 	cp a,(TCHAR,sp) 
      008BC6 0A 20            [ 1] 2074 	jreq 1$
      008BC8 02 4B            [ 1] 2075 	ld a,#'&
      008BCA 10 F7            [ 1] 2076 	cp a,(TCHAR,sp)
      008BCC 5C 72            [ 1] 2077 	jrne 0$
      008BCE 5C 00 02         [ 4] 2078 	call parse_binary ; expect binary integer 
      008BD1 91 D6 01         [ 2] 2079 	jp token_exit 
      008BD4 CD 8E            [ 1] 2080 0$:	ld a,(TCHAR,sp)
      008BD6 2B 6B 02         [ 4] 2081 	call is_digit
      008BD9 CD 8E            [ 1] 2082 	jrnc 3$
      008BDB 22 25 ED         [ 4] 2083 1$:	call parse_integer 
      008BDE A6 10 11         [ 2] 2084 	jp token_exit 
      000C42                       2085 3$: 
      000C42                       2086 	_case '(' bkslsh_tst 
      008BE1 01 26            [ 1]    1 	ld a,#'(' 
      008BE3 0A 7B            [ 1]    2 	cp a,(TCHAR,sp) 
      008BE5 02 A1            [ 1]    3 	jrne bkslsh_tst
      008BE7 41 2B            [ 1] 2087 	ld a,#TK_LPAREN
      008BE9 04 A1 47         [ 2] 2088 	jp token_char   	
      000C4D                       2089 bkslsh_tst:
      000C4D                       2090 	_case '\',rparnt_tst
      008BEC 2B DD            [ 1]    1 	ld a,#'\' 
      008BEE 7F CD            [ 1]    2 	cp a,(TCHAR,sp) 
      008BF0 8E 37            [ 1]    3 	jrne rparnt_tst
      008BF2 CE 00            [ 1] 2091 	ld a,(TCHAR,sp)
      008BF4 0A               [ 1] 2092 	ld (x),a 
      008BF5 A6               [ 1] 2093 	incw x 
      008BF6 0A 5B 02 81      [ 1] 2094 	inc in 
      008BFA 91 D6 00         [ 4] 2095 	ld a,([in.w],y)
      008BFA 4B               [ 1] 2096 	ld (x),a 
      008BFB 00               [ 1] 2097 	incw x 
      008BFC 4B 00 F7 5C      [ 1] 2098 	inc in  
      008C00 72               [ 1] 2099 	clr (x) 
      008C01 5C               [ 1] 2100 	ld xl,a 
      008C02 00 02            [ 1] 2101 	ld a,#TK_CHAR 
      008C04 91 D6 01         [ 2] 2102 	jp token_exit 
      000C6B                       2103 rparnt_tst:		
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



      000C6B                       2104 	_case ')' colon_tst 
      008C07 A1 30            [ 1]    1 	ld a,#')' 
      008C09 27 06            [ 1]    2 	cp a,(TCHAR,sp) 
      008C0B A1 31            [ 1]    3 	jrne colon_tst
      008C0D 27 02            [ 1] 2105 	ld a,#TK_RPAREN 
      008C0F 20 09 A0         [ 2] 2106 	jp token_char 
      000C76                       2107 colon_tst:
      000C76                       2108 	_case ':' comma_tst 
      008C12 30 46            [ 1]    1 	ld a,#':' 
      008C14 09 02            [ 1]    2 	cp a,(TCHAR,sp) 
      008C16 09 01            [ 1]    3 	jrne comma_tst
      008C18 20 E4            [ 1] 2109 	ld a,#TK_COLON 
      008C1A CC 0D 8F         [ 2] 2110 	jp token_char 
      000C81                       2111 comma_tst:
      000C81                       2112 	_case COMMA sharp_tst 
      008C1A 7F 1E            [ 1]    1 	ld a,#COMMA 
      008C1C 01 A6            [ 1]    2 	cp a,(TCHAR,sp) 
      008C1E 0A 5B            [ 1]    3 	jrne sharp_tst
      008C20 02 81            [ 1] 2113 	ld a,#TK_COMMA
      008C22 CC 0D 8F         [ 2] 2114 	jp token_char
      000C8C                       2115 sharp_tst:
      000C8C                       2116 	_case SHARP dash_tst 
      008C22 CD 8E            [ 1]    1 	ld a,#SHARP 
      008C24 2B F7            [ 1]    2 	cp a,(TCHAR,sp) 
      008C26 5C 72            [ 1]    3 	jrne dash_tst
      008C28 5C 00            [ 1] 2117 	ld a,#TK_SHARP
      008C2A 02 91 D6         [ 2] 2118 	jp token_char  	 	 
      000C97                       2119 dash_tst: 	
      000C97                       2120 	_case '-' at_tst 
      008C2D 01 CD            [ 1]    1 	ld a,#'-' 
      008C2F 84 78            [ 1]    2 	cp a,(TCHAR,sp) 
      008C31 25 EF            [ 1]    3 	jrne at_tst
      008C33 7F 72            [ 1] 2121 	ld a,#TK_MINUS  
      008C35 5D 17 19         [ 2] 2122 	jp token_char 
      000CA2                       2123 at_tst:
      000CA2                       2124 	_case '@' qmark_tst 
      008C38 26 15            [ 1]    1 	ld a,#'@' 
      008C3A C6 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008C3C 18 A0            [ 1]    3 	jrne qmark_tst
      008C3E 41 48            [ 1] 2125 	ld a,#TK_ARRAY 
      008C40 88 4B 00         [ 2] 2126 	jp token_char
      000CAD                       2127 qmark_tst:
      000CAD                       2128 	_case '?' tick_tst 
      008C43 AE 00            [ 1]    1 	ld a,#'?' 
      008C45 27 72            [ 1]    2 	cp a,(TCHAR,sp) 
      008C47 FB 01            [ 1]    3 	jrne tick_tst
      008C49 5B 02            [ 1] 2129 	ld a,(TCHAR,sp)
      008C4B A6               [ 1] 2130 	ld (x),a 
      008C4C 02               [ 1] 2131 	incw x 
      008C4D 20               [ 1] 2132 	clr (x)
      008C4E 17 5C 00 01      [ 1] 2133 	inc in 
      008C4F A6 07            [ 1] 2134 	ld a,#TK_CMD 
      008C4F AE 9D CC         [ 2] 2135 	ldw x,#print 
      008C52 CD 90 96         [ 2] 2136 	jp token_exit
      000CC4                       2137 tick_tst: ; ignore comment 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      000CC4                       2138 	_case TICK plus_tst 
      008C55 4D 26            [ 1]    1 	ld a,#TICK 
      008C57 03 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008C59 86 7C            [ 1]    3 	jrne plus_tst
      008C5B A3 94            [ 1] 2139 	ld a,(TCHAR,sp)
      008C5D 91               [ 1] 2140 	ld (x),a 
      008C5E 26               [ 1] 2141 	incw x 
      008C5F 06               [ 1] 2142 	clr (x)
      008C60 55 00 03 00 02   [ 1] 2143 	mov in,count  
      008C65 4F               [ 1] 2144 	clr a 
      008C66 81 0D 9F         [ 2] 2145 	jp token_exit 
      008C67                       2146 plus_tst:
      008C67                       2147 	_case '+' star_tst 
      008C67 CE 00            [ 1]    1 	ld a,#'+' 
      008C69 01 CF            [ 1]    2 	cp a,(TCHAR,sp) 
      008C6B 00 12            [ 1]    3 	jrne star_tst
      008C6D 90 CE            [ 1] 2148 	ld a,#TK_PLUS  
      008C6F 00 04 C6         [ 2] 2149 	jp token_char 
      000CE3                       2150 star_tst:
      000CE3                       2151 	_case '*' slash_tst 
      008C72 00 02            [ 1]    1 	ld a,#'*' 
      008C74 C1 00            [ 1]    2 	cp a,(TCHAR,sp) 
      008C76 03 2B            [ 1]    3 	jrne slash_tst
      008C78 03 A6            [ 1] 2152 	ld a,#TK_MULT 
      008C7A 00 81 8F         [ 2] 2153 	jp token_char 
      008C7C                       2154 slash_tst: 
      000CEE                       2155 	_case '/' prcnt_tst 
      008C7C 52 02            [ 1]    1 	ld a,#'/' 
      008C7E AE 17            [ 1]    2 	cp a,(TCHAR,sp) 
      008C80 18 A6            [ 1]    3 	jrne prcnt_tst
      008C82 20 CD            [ 1] 2156 	ld a,#TK_DIV 
      008C84 8E E3 91         [ 2] 2157 	jp token_char 
      000CF9                       2158 prcnt_tst:
      000CF9                       2159 	_case '%' eql_tst 
      008C87 D6 01            [ 1]    1 	ld a,#'%' 
      008C89 26 07            [ 1]    2 	cp a,(TCHAR,sp) 
      008C8B 72 5F            [ 1]    3 	jrne eql_tst
      008C8D 17 18            [ 1] 2160 	ld a,#TK_MOD
      008C8F CC 8E 1F         [ 2] 2161 	jp token_char  
                                   2162 ; 1 or 2 character tokens 	
      008C92                       2163 eql_tst:
      000D04                       2164 	_case '=' gt_tst 		
      008C92 CD 8E            [ 1]    1 	ld a,#'=' 
      008C94 2B 6B            [ 1]    2 	cp a,(TCHAR,sp) 
      008C96 01 A6            [ 1]    3 	jrne gt_tst
      008C98 22 11            [ 1] 2165 	ld a,#TK_EQUAL
      008C9A 01 26 06         [ 2] 2166 	jp token_char 
      000D0F                       2167 gt_tst:
      000D0F                       2168 	_case '>' lt_tst 
      008C9D CD 8B            [ 1]    1 	ld a,#'>' 
      008C9F 45 CC            [ 1]    2 	cp a,(TCHAR,sp) 
      008CA1 8E 1F            [ 1]    3 	jrne lt_tst
      008CA3 A6 31            [ 1] 2169 	ld a,#TK_GT 
      008CA3 A6 24            [ 1] 2170 	ld (ATTRIB,sp),a 
      008CA5 11 01 27 13      [ 1] 2171 	inc in 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008CA9 A6 26 11         [ 4] 2172 	ld a,([in.w],y)
      008CAC 01 26            [ 1] 2173 	cp a,#'=
      008CAE 06 CD            [ 1] 2174 	jrne 1$
      008CB0 8B FA            [ 1] 2175 	ld a,(TCHAR,sp)
      008CB2 CC               [ 1] 2176 	ld (x),a
      008CB3 8E               [ 1] 2177 	incw x 
      008CB4 1F 7B            [ 1] 2178 	ld a,#'=
      008CB6 01 CD            [ 1] 2179 	ld (TCHAR,sp),a 
      008CB8 8E 22            [ 1] 2180 	ld a,#TK_GE 
      008CBA 24 06            [ 2] 2181 	jra token_char  
      008CBC CD 8B            [ 1] 2182 1$: cp a,#'<
      008CBE BF CC            [ 1] 2183 	jrne 2$
      008CC0 8E 1F            [ 1] 2184 	ld a,(TCHAR,sp)
      008CC2 F7               [ 1] 2185 	ld (x),a
      008CC2 A6               [ 1] 2186 	incw x 
      008CC3 28 11            [ 1] 2187 	ld a,#'<	
      008CC5 01 26            [ 1] 2188 	ld (TCHAR,sp),a 
      008CC7 05 A6            [ 1] 2189 	ld a,#TK_NE 
      008CC9 04 CC            [ 2] 2190 	jra token_char 
      008CCB 8E 0F 00 01      [ 1] 2191 2$: dec in
      008CCD 7B 02            [ 1] 2192 	ld a,(ATTRIB,sp)
      008CCD A6 5C            [ 2] 2193 	jra token_char 
      000D48                       2194 lt_tst:
      000D48                       2195 	_case '<' other
      008CCF 11 01            [ 1]    1 	ld a,#'<' 
      008CD1 26 18            [ 1]    2 	cp a,(TCHAR,sp) 
      008CD3 7B 01            [ 1]    3 	jrne other
      008CD5 F7 5C            [ 1] 2196 	ld a,#TK_LT 
      008CD7 72 5C            [ 1] 2197 	ld (ATTRIB,sp),a 
      008CD9 00 02 91 D6      [ 1] 2198 	inc in 
      008CDD 01 F7 5C         [ 4] 2199 	ld a,([in.w],y)
      008CE0 72 5C            [ 1] 2200 	cp a,#'=
      008CE2 00 02            [ 1] 2201 	jrne 1$
      008CE4 7F 97            [ 1] 2202 	ld a,(TCHAR,sp)
      008CE6 A6               [ 1] 2203 	ld (x),a 
      008CE7 0B CC            [ 1] 2204 	ld a,#'=
      008CE9 8E 1F            [ 1] 2205 	ld (TCHAR,sp),a 
      008CEB A6 36            [ 1] 2206 	ld a,#TK_LE 
      008CEB A6 29            [ 2] 2207 	jra token_char 
      008CED 11 01            [ 1] 2208 1$: cp a,#'>
      008CEF 26 05            [ 1] 2209 	jrne 2$
      008CF1 A6 05            [ 1] 2210 	ld a,(TCHAR,sp)
      008CF3 CC               [ 1] 2211 	ld (x),a 
      008CF4 8E               [ 1] 2212 	incw x 
      008CF5 0F 3E            [ 1] 2213 	ld a,#'>
      008CF6 6B 01            [ 1] 2214 	ld (TCHAR,sp),a 
      008CF6 A6 3A            [ 1] 2215 	ld a,#TK_NE 
      008CF8 11 01            [ 2] 2216 	jra token_char 
      008CFA 26 05 A6 01      [ 1] 2217 2$: dec in 
      008CFE CC 8E            [ 1] 2218 	ld a,(ATTRIB,sp)
      008D00 0F 0F            [ 2] 2219 	jra token_char 	
      008D01                       2220 other: ; not a special character 	 
      008D01 A6 2C            [ 1] 2221 	ld a,(TCHAR,sp)
      008D03 11 01 26         [ 4] 2222 	call is_alpha 
      008D06 05 A6            [ 1] 2223 	jrc 30$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008D08 08 CC 8E         [ 2] 2224 	jp syntax_error 
      000D8A                       2225 30$: 
      008D0B 0F 0B A2         [ 4] 2226 	call parse_keyword
      008D0C 20 10            [ 2] 2227 	jra token_exit 
      000D8F                       2228 token_char:
      008D0C A6 23            [ 1] 2229 	ld (ATTRIB,sp),a 
      008D0E 11 01            [ 1] 2230 	ld a,(TCHAR,sp)
      008D10 26               [ 1] 2231 	ld (x),a 
      008D11 05               [ 1] 2232 	incw x 
      008D12 A6               [ 1] 2233 	clr(x)
      008D13 09 CC 8E 0F      [ 1] 2234 	inc in 
      008D17 7B 02            [ 1] 2235 	ld a,(ATTRIB,sp)
      008D17 A6 2D 11         [ 2] 2236 	ldw x,#pad 
      000D9F                       2237 token_exit:
      000D9F                       2238 	_drop VSIZE 
      008D1A 01 26            [ 2]    1     addw sp,#VSIZE 
      008D1C 05               [ 4] 2239 	ret
                                   2240 
                                   2241 
                                   2242 
                                   2243 ;------------------------------------
                                   2244 ; check if character in {'0'..'9'}
                                   2245 ; input:
                                   2246 ;    A  character to test
                                   2247 ; output:
                                   2248 ;    Carry  0 not digit | 1 digit
                                   2249 ;------------------------------------
      000DA2                       2250 is_digit:
      008D1D A6 11            [ 1] 2251 	cp a,#'0
      008D1F CC 8E            [ 1] 2252 	jrc 1$
      008D21 0F 3A            [ 1] 2253     cp a,#'9+1
      008D22 8C               [ 1] 2254 	ccf 
      008D22 A6               [ 1] 2255 1$:	ccf 
      008D23 40               [ 4] 2256     ret
                                   2257 
                                   2258 ;------------------------------------
                                   2259 ; convert alpha to uppercase
                                   2260 ; input:
                                   2261 ;    a  character to convert
                                   2262 ; output:
                                   2263 ;    a  uppercase character
                                   2264 ;------------------------------------
      000DAB                       2265 to_upper::
      008D24 11 01            [ 1] 2266 	cp a,#'a
      008D26 26 05            [ 1] 2267 	jrpl 1$
      008D28 A6               [ 4] 2268 0$:	ret
      008D29 03 CC            [ 1] 2269 1$: cp a,#'z	
      008D2B 8E 0F            [ 1] 2270 	jrugt 0$
      008D2D A0 20            [ 1] 2271 	sub a,#32
      008D2D A6               [ 4] 2272 	ret
                                   2273 	
                                   2274 ;------------------------------------
                                   2275 ; convert pad content in integer
                                   2276 ; input:
                                   2277 ;    pad		.asciz to convert
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



                                   2278 ; output:
                                   2279 ;    acc24      int24_t
                                   2280 ;------------------------------------
                                   2281 	; local variables
                           000001  2282 	SIGN=1 ; 1 byte, 
                           000002  2283 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2284 	TEMP=3 ; 1 byte, temporary storage
                           000003  2285 	VSIZE=3 ; 3 bytes reserved for local storage
      000DB7                       2286 atoi24:
      008D2E 3F               [ 2] 2287 	pushw x ;save x
      008D2F 11 01            [ 2] 2288 	sub sp,#VSIZE
                                   2289 	; acc24=0 
      008D31 26 11 7B 01      [ 1] 2290 	clr acc24    
      008D35 F7 5C 7F 72      [ 1] 2291 	clr acc16
      008D39 5C 00 02 A6      [ 1] 2292 	clr acc8 
      008D3D 07 AE 93         [ 1] 2293 	ld a, pad 
      008D40 8C CC            [ 1] 2294 	jreq atoi_exit
      008D42 8E 1F            [ 1] 2295 	clr (SIGN,sp)
      008D44 A6 0A            [ 1] 2296 	ld a,#10
      008D44 A6 27            [ 1] 2297 	ld (BASE,sp),a ; default base decimal
      008D46 11 01 26         [ 2] 2298 	ldw x,#pad ; pointer to string to convert
      008D49 0E               [ 1] 2299 	ld a,(x)
      008D4A 7B 01            [ 1] 2300 	jreq 9$  ; completed if 0
      008D4C F7 5C            [ 1] 2301 	cp a,#'-
      008D4E 7F 55            [ 1] 2302 	jrne 1$
      008D50 00 03            [ 1] 2303 	cpl (SIGN,sp)
      008D52 00 02            [ 2] 2304 	jra 2$
      008D54 4F CC            [ 1] 2305 1$: cp a,#'$
      008D56 8E 1F            [ 1] 2306 	jrne 3$
      008D58 A6 10            [ 1] 2307 	ld a,#16
      008D58 A6 2B            [ 1] 2308 	ld (BASE,sp),a
      008D5A 11               [ 1] 2309 2$:	incw x
      008D5B 01               [ 1] 2310 	ld a,(x)
      000DE9                       2311 3$:	
      008D5C 26 05            [ 1] 2312 	cp a,#'a
      008D5E A6 10            [ 1] 2313 	jrmi 4$
      008D60 CC 8E            [ 1] 2314 	sub a,#32
      008D62 0F 30            [ 1] 2315 4$:	cp a,#'0
      008D63 2B 2B            [ 1] 2316 	jrmi 9$
      008D63 A6 2A            [ 1] 2317 	sub a,#'0
      008D65 11 01            [ 1] 2318 	cp a,#10
      008D67 26 05            [ 1] 2319 	jrmi 5$
      008D69 A6 20            [ 1] 2320 	sub a,#7
      008D6B CC 8E            [ 1] 2321 	cp a,(BASE,sp)
      008D6D 0F 1F            [ 1] 2322 	jrpl 9$
      008D6E 6B 03            [ 1] 2323 5$:	ld (TEMP,sp),a
      008D6E A6 2F            [ 1] 2324 	ld a,(BASE,sp)
      008D70 11 01 26         [ 4] 2325 	call mulu24_8
      008D73 05 A6            [ 1] 2326 	ld a,(TEMP,sp)
      008D75 21 CC 8E         [ 1] 2327 	add a,acc24+2
      008D78 0F 00 0A         [ 1] 2328 	ld acc24+2,a
      008D79 4F               [ 1] 2329 	clr a
      008D79 A6 25 11         [ 1] 2330 	adc a,acc24+1
      008D7C 01 26 05         [ 1] 2331 	ld acc24+1,a
      008D7F A6               [ 1] 2332 	clr a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



      008D80 22 CC 8E         [ 1] 2333 	adc a,acc24
      008D83 0F 00 08         [ 1] 2334 	ld acc24,a
      008D84 20 C9            [ 2] 2335 	jra 2$
      008D84 A6 3D            [ 1] 2336 9$:	tnz (SIGN,sp)
      008D86 11 01            [ 1] 2337     jreq atoi_exit
      008D88 26 05 A6         [ 4] 2338     call neg_acc24
      000E25                       2339 atoi_exit: 
      008D8B 32 CC            [ 2] 2340 	addw sp,#VSIZE
      008D8D 8E               [ 2] 2341 	popw x ; restore x
      008D8E 0F               [ 4] 2342 	ret
                                   2343 
                                   2344 ;--------------------------------------
                                   2345 ; unsigned multiply uint24_t by uint8_t
                                   2346 ; use to convert numerical string to uint24_t
                                   2347 ; input:
                                   2348 ;	acc24	uint24_t 
                                   2349 ;   A		uint8_t
                                   2350 ; output:
                                   2351 ;   acc24   A*acc24
                                   2352 ;-------------------------------------
                                   2353 ; local variables offset  on sp
                           000003  2354 	U8   = 3   ; A pushed on stack
                           000002  2355 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2356 	OVFH = 1  ; multiplication overflow high byte
                           000003  2357 	VSIZE = 3
      008D8F                       2358 mulu24_8:
      008D8F A6               [ 2] 2359 	pushw x    ; save X
                                   2360 	; local variables
      008D90 3E               [ 1] 2361 	push a     ; U8
      008D91 11               [ 1] 2362 	clrw x     ; initialize overflow to 0
      008D92 01               [ 2] 2363 	pushw x    ; multiplication overflow
                                   2364 ; multiply low byte.
      008D93 26 33 A6         [ 1] 2365 	ld a,acc24+2
      008D96 31               [ 1] 2366 	ld xl,a
      008D97 6B 02            [ 1] 2367 	ld a,(U8,sp)
      008D99 72               [ 4] 2368 	mul x,a
      008D9A 5C               [ 1] 2369 	ld a,xl
      008D9B 00 02 91         [ 1] 2370 	ld acc24+2,a
      008D9E D6               [ 1] 2371 	ld a, xh
      008D9F 01 A1            [ 1] 2372 	ld (OVFL,sp),a
                                   2373 ; multipy middle byte
      008DA1 3D 26 0C         [ 1] 2374 	ld a,acc24+1
      008DA4 7B               [ 1] 2375 	ld xl,a
      008DA5 01 F7            [ 1] 2376 	ld a, (U8,sp)
      008DA7 5C               [ 4] 2377 	mul x,a
                                   2378 ; add overflow to this partial product
      008DA8 A6 3D 6B         [ 2] 2379 	addw x,(OVFH,sp)
      008DAB 01               [ 1] 2380 	ld a,xl
      008DAC A6 33 20         [ 1] 2381 	ld acc24+1,a
      008DAF 5F               [ 1] 2382 	clr a
      008DB0 A1 3C            [ 1] 2383 	adc a,#0
      008DB2 26 0C            [ 1] 2384 	ld (OVFH,sp),a
      008DB4 7B               [ 1] 2385 	ld a,xh
      008DB5 01 F7            [ 1] 2386 	ld (OVFL,sp),a
                                   2387 ; multiply most signficant byte	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



      008DB7 5C A6 3C         [ 1] 2388 	ld a, acc24
      008DBA 6B               [ 1] 2389 	ld xl, a
      008DBB 01 A6            [ 1] 2390 	ld a, (U8,sp)
      008DBD 35               [ 4] 2391 	mul x,a
      008DBE 20 4F 72         [ 2] 2392 	addw x, (OVFH,sp)
      008DC1 5A               [ 1] 2393 	ld a, xl
      008DC2 00 02 7B         [ 1] 2394 	ld acc24,a
      008DC5 02 20            [ 2] 2395     addw sp,#VSIZE
      008DC7 47               [ 2] 2396 	popw x
      008DC8 81               [ 4] 2397 	ret
                                   2398 
                                   2399 ;------------------------------------
                                   2400 ; skip character c in text starting from 'in'
                                   2401 ; input:
                                   2402 ;	 y 		point to text buffer
                                   2403 ;    a 		character to skip
                                   2404 ; output:  
                                   2405 ;	'in' ajusted to new position
                                   2406 ;------------------------------------
                           000001  2407 	C = 1 ; local var
      000E63                       2408 skip:
      008DC8 A6               [ 1] 2409 	push a
      008DC9 3C 11 01         [ 4] 2410 1$:	ld a,([in.w],y)
      008DCC 26 32            [ 1] 2411 	jreq 2$
      008DCE A6 34            [ 1] 2412 	cp a,(C,sp)
      008DD0 6B 02            [ 1] 2413 	jrne 2$
      008DD2 72 5C 00 02      [ 1] 2414 	inc in
      008DD6 91 D6            [ 2] 2415 	jra 1$
      000E73                       2416 2$: _drop 1 
      008DD8 01 A1            [ 2]    1     addw sp,#1 
      008DDA 3D               [ 4] 2417 	ret
                                   2418 	
                                   2419 ;------------------------------
                                   2420 ; restore 'in.w' variable to 
                                   2421 ; its value before last call
                                   2422 ; to get_token.
                                   2423 ;------------------------------
      000E76                       2424 unget_token:
      008DDB 26 0B 7B         [ 2] 2425 	ldw x,in.w.saved
      008DDE 01 F7 A6         [ 2] 2426 	ldw in.w,x 
      008DE1 3D               [ 4] 2427 	ret 
                                   2428 
                                   2429 
                                   2430 ;******************************
                                   2431 ;  data stack manipulation
                                   2432 ;*****************************
                                   2433 ;----------------------	
                                   2434 ; push X on data stack 
                                   2435 ; input:
                                   2436 ;	X 
                                   2437 ; output:
                                   2438 ;	none 
                                   2439 ;----------------------	
      000E7D                       2440 dpush:
      000E7D                       2441     _dp_down
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008DE2 6B 01 A6 36      [ 1]    1     dec dstkptr+1 
      008DE6 20 27 A1 3E      [ 1]    2     dec dstkptr+1
      008DEA 26 0C 7B 01      [ 5] 2442     ldw [dstkptr],x  
      008DEE F7               [ 4] 2443 	ret 
                                   2444 
                                   2445 
                                   2446 ;----------------------	
                                   2447 ; pop data stack in X 
                                   2448 ; input:
                                   2449 ;	none
                                   2450 ; output:
                                   2451 ;	X   
                                   2452 ;----------------------	
      000E8A                       2453 dpop: 
      008DEF 5C A6 3E 6B      [ 5] 2454     ldw x, [dstkptr]
      000E8E                       2455 	_dp_up
      008DF3 01 A6 35 20      [ 1]    1     inc dstkptr+1
      008DF7 17 72 5A 00      [ 1]    2     inc dstkptr+1
      008DFB 02               [ 4] 2456 	ret 
                                   2457 
                                   2458 ;-----------------------------
                                   2459 ; swap top 2 elements of dstack
                                   2460 ;  {n1 n2 -- n2 n1 }
                                   2461 ;-----------------------------
      000E97                       2462 dswap:
      008DFC 7B 02 20 0F      [ 5] 2463 	ldw x,[dstkptr]
      008E00 89               [ 2] 2464 	pushw x 
      008E00 7B 01 CD         [ 2] 2465 	ldw x,#2 
      008E03 84 78 25 03      [ 5] 2466 	ldw x,([dstkptr],x) 
      008E07 CC 86 7C 19      [ 5] 2467 	ldw [dstkptr],x 
      008E0A AE 00 02         [ 2] 2468 	ldw x,#2
      008E0A CD 8C            [ 2] 2469 	popw y 
      008E0C 22 20 10 19      [ 5] 2470 	ldw ([dstkptr],x),y 
      008E0F 81               [ 4] 2471 	ret
                                   2472 
                                   2473 ;-----------------------------
                                   2474 ; drop TOS 
                                   2475 ;-----------------------------
      000EB1                       2476 ddrop: ; { n -- }
      000EB1                       2477 	_dp_up 
      008E0F 6B 02 7B 01      [ 1]    1     inc dstkptr+1
      008E13 F7 5C 7F 72      [ 1]    2     inc dstkptr+1
      008E17 5C               [ 4] 2478 	ret
                                   2479 	
                                   2480 ;-----------------------------
                                   2481 ; duplicate TOS 
                                   2482 ;  dstack: { ix...n -- ix...n n }
                                   2483 ;-----------------------------
      000EBA                       2484 ddup:
      008E18 00 02 7B 02      [ 5] 2485 	ldw x,[dstkptr]
      000EBE                       2486 	_dp_down
      008E1C AE 17 18 1A      [ 1]    1     dec dstkptr+1 
      008E1F 72 5A 00 1A      [ 1]    2     dec dstkptr+1
      008E1F 5B 02 81 19      [ 5] 2487     ldw [dstkptr],x  
      008E22 81               [ 4] 2488 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



                                   2489 
                                   2490 
                                   2491 ;----------------------------------
                                   2492 ; pick value n from dstack 
                                   2493 ; put it on TOS
                                   2494 ; dstack: {ix,..,p -- ix,...,np }
                                   2495 ;-----------------------------------
      000ECB                       2496 dpick:
      008E22 A1 30 25 03      [ 5] 2497 	ldw x,[dstkptr]
      008E26 A1               [ 2] 2498 	sllw x 
      008E27 3A 8C 8C 81      [ 2] 2499 	addw x,dstkptr 
      008E2B FE               [ 2] 2500 	ldw x,(x)
      008E2B A1 61 2A 01      [ 5] 2501 	ldw [dstkptr],x 
      008E2F 81               [ 4] 2502 	ret
                                   2503 
                                   2504 ;---------------------------
                                   2505 ;  fetch variable in X 
                                   2506 ;  dstack:{ addr -- value }
                                   2507 ;---------------------------
      000EDA                       2508 fetch:
      008E30 A1 7A 22 FB      [ 5] 2509 	ldw x,[dstkptr]
      008E34 A0               [ 2] 2510 	ldw x,(x)
      008E35 20 81 00 19      [ 5] 2511 	ldw [dstkptr],x
      008E37 81               [ 4] 2512 	ret 
                                   2513 
                                   2514 ;----------------------------
                                   2515 ; store variable 
                                   2516 ; dstack: {addr value -- }
                                   2517 ;----------------------------
      000EE4                       2518 store:
      008E37 89 52 03         [ 4] 2519 	call dpop 
      008E3A 72 5F            [ 1] 2520 	ldw y,x   ; y=value 
      008E3C 00 09 72         [ 4] 2521 	call dpop 
      008E3F 5F               [ 2] 2522 	ldw (x),y 
      008E40 00               [ 4] 2523 	ret 
                                   2524 
                                   2525 ;---------------------------------
                                   2526 ; drop n elements from data stack 
                                   2527 ; input: 
                                   2528 ;   X 		n 
                                   2529 ; output:
                                   2530 ;   none 
                                   2531 ;-------------------------------------
      000EEE                       2532 ddrop_n:
      008E41 0A 72            [ 2] 2533 	pushw y 
      008E43 5F 00 0B C6      [ 2] 2534 	ldw y,dstkptr 
      008E47 17               [ 2] 2535 	sllw x 
      008E48 18               [ 2] 2536 	pushw x 
      008E49 27 5A 0F         [ 2] 2537 	addw y,(1,sp)
      008E4C 01 A6 0A 6B      [ 2] 2538 	ldw dstkptr,y 
      008E50 02               [ 2] 2539 	popw x 
      008E51 AE 17            [ 2] 2540 	popw y
      008E53 18               [ 4] 2541 	ret 
                                   2542 
      008E54 F6 27 47 A1 2D 26 04  2543 dstk_prompt: .asciz "\ndstack: " 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal  03-Bits]



             3A 20 00
                                   2544 ;----------------------------
                                   2545 ; print dstack content 
                                   2546 ;---------------------------
                           000001  2547 	XSAVE=1
                           000002  2548 	VSIZE=2
      000F0B                       2549 dots:
      000F0B                       2550 	_vars VSIZE 
      008E5C 01 20            [ 2]    1     sub sp,#VSIZE 
      008E5E 08 A1 24         [ 2] 2551 	ldw x,#dstk_prompt 
      008E61 26 06 A6         [ 4] 2552 	call puts
      008E64 10 6B 02         [ 2] 2553 	ldw x,#dstack_unf-CELL_SIZE
      008E67 5C F6 00 07      [ 1] 2554 	mov base,#10 
      008E69 C3 00 19         [ 2] 2555 1$:	cpw x,dstkptr 
      008E69 A1 61            [ 1] 2556 	jrult 4$ 
      008E6B 2B 02            [ 2] 2557 	ldw (XSAVE,sp),x
      008E6D A0               [ 2] 2558 	ldw  x,(x)
      008E6E 20 A1 30         [ 4] 2559 	call print_int 
      008E71 2B 2B            [ 2] 2560 	ldw x,(XSAVE,sp)
      008E73 A0 30 A1         [ 2] 2561 	subw x,#CELL_SIZE 
      008E76 0A 2B            [ 2] 2562 	jra 1$ 
      008E78 06 A0            [ 1] 2563 4$: ld a,#CR 
      008E7A 07 11 02         [ 4] 2564 	call putc 
      000F31                       2565 	_drop VSIZE
      008E7D 2A 1F            [ 2]    1     addw sp,#VSIZE 
      008E7F 6B               [ 1] 2566 	clr a 
      008E80 03               [ 4] 2567 	ret
                                   2568 
      008E81 7B 02 CD 8E A9 7B 03  2569 cstk_prompt: .asciz "\nctack: "
             CB 00
                                   2570 ;--------------------------------
                                   2571 ; print cstack content
                                   2572 ;--------------------------------
                           000001  2573 	XSAVE=1
                           000002  2574 	VSIZE=2 
      000F3E                       2575 dotr:
      000F3E                       2576 	_vars VSIZE 
      008E8A 0B C7            [ 2]    1     sub sp,#VSIZE 
      008E8C 00 0B 4F         [ 2] 2577 	ldw x,#cstk_prompt
      008E8F C9 00 0A         [ 4] 2578 	call puts 
      008E92 C7               [ 1] 2579 	ldw x,sp 
      008E93 00 0A 4F         [ 2] 2580 	addw x,#7 ; ignore XSAVE and 2 levels of return address.
      008E96 C9 00            [ 2] 2581 	ldw (XSAVE,sp),x  
      008E98 09 C7 00         [ 2] 2582 	ldw x,#RAM_SIZE-2
      008E9B 09 20 C9 0D      [ 1] 2583 	mov base,#16
      000F53                       2584 dotr_loop:
      008E9F 01 27            [ 2] 2585 	cpw x,(XSAVE,sp)
      008EA1 03 CD            [ 1] 2586 	jrmi 9$
      008EA3 89               [ 2] 2587 	pushw x  
      008EA4 9A               [ 2] 2588 	ldw x,(x)
      008EA5 CD 08 4F         [ 4] 2589 	call print_int 
      008EA5 5B               [ 2] 2590 	popw x  
      008EA6 03 85 81         [ 2] 2591 	subw x,#CELL_SIZE
      008EA9 20 F1            [ 2] 2592 	jra dotr_loop 
      008EA9 89 88            [ 1] 2593 9$:	ld a,#CR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      008EAB 5F 89 C6         [ 4] 2594 	call putc 
      000F67                       2595 	_drop VSIZE 
      008EAE 00 0B            [ 2]    1     addw sp,#VSIZE 
      008EB0 97               [ 1] 2596 	clr a 
      008EB1 7B               [ 4] 2597 	ret
                                   2598 
                                   2599 
                                   2600 ;--------------------------------
                                   2601 ;  add 2 integers
                                   2602 ;  input:
                                   2603 ;    N1     on cstack 
                                   2604 ;    N2     on cstack 
                                   2605 ;  output:
                                   2606 ;    X 		n2+n1 
                                   2607 ;--------------------------------
                                   2608 	;arugments on cstack 
      000F6B                       2609 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000F6B                       2610 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000F6B                       2611 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000F6B                       2612 add:
      008EB2 03 42            [ 2] 2613 	ldw x ,(N2,sp)
      008EB4 9F C7 00         [ 2] 2614 	addw x,(N1,sp)
      008EB7 0B 9E            [ 2] 2615 	ldw (N1,sp),x 
      008EB9 6B               [ 4] 2616 	ret 
                                   2617 
                                   2618 ;--------------------------------
                                   2619 ;  substract 2 ntegers
                                   2620 ;  input:
                                   2621 ;    N1     on cstack 
                                   2622 ;    N2     on cstack 
                                   2623 ;  output:
                                   2624 ;    X 		n2+n1 
                                   2625 ;--------------------------------
      000F73                       2626 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      000F73                       2627 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      000F73                       2628 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      000F73                       2629 substract:
      008EBA 02 C6            [ 2] 2630 	ldw x,(N2,sp)
      008EBC 00 0A 97         [ 2] 2631 	subw x,(N1,sp)
      008EBF 7B               [ 4] 2632 	ret 
                                   2633 
                                   2634 ;-------------------------------------
                                   2635 ; multiply 2 integers
                                   2636 ; product overflow is ignored unless
                                   2637 ; MATH_OVF assembler flag is set to 1
                                   2638 ; input:
                                   2639 ;  	N1      on cstack
                                   2640 ;   N2 		on cstack 
                                   2641 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



                                   2642 ;	X        N1*N2 
                                   2643 ;-------------------------------------
                                   2644 	;arguments 
      000F79                       2645 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      000F79                       2646 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      000F79                       2647 	_arg N1_LB 2
                           000007     1     N1_LB=ARG_OFS+2 
      000F79                       2648 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      000F79                       2649 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2650    ; local variables 
                           000001  2651 	SIGN=1
                           000002  2652 	PROD=2
                           000003  2653 	VSIZE=3
      000F79                       2654 multiply:
      000F79                       2655 	_vars VSIZE 
      008EC0 03 42            [ 2]    1     sub sp,#VSIZE 
      008EC2 72 FB            [ 1] 2656 	clr (SIGN,sp)
      008EC4 01 9F            [ 2] 2657 	ldw x,(N1_HB,sp)
      008EC6 C7               [ 1] 2658 	ld a,xh  
      008EC7 00 0A            [ 1] 2659 	bcp a,#0x80 
      008EC9 4F A9            [ 1] 2660 	jreq 2$
      008ECB 00 6B            [ 1] 2661 	cpl (SIGN,sp)
      008ECD 01               [ 2] 2662 	negw x 
      008ECE 9E 6B            [ 2] 2663 	ldw (N1_HB,sp),x 
      008ED0 02 C6            [ 2] 2664 2$: ldw x,(N2_HB,sp)
      008ED2 00               [ 1] 2665 	ld a,xh  
      008ED3 09 97            [ 1] 2666 	bcp a,#0x80 
      008ED5 7B 03            [ 1] 2667 	jreq 3$
      008ED7 42 72            [ 1] 2668 	cpl (SIGN,sp)
      008ED9 FB               [ 2] 2669 	negw x 
      008EDA 01 9F            [ 2] 2670 	ldw (N2_HB,sp),x 
                                   2671 ; N1_LB * N2_LB 	
      008EDC C7 00            [ 1] 2672 3$:	ld a,(N1_LB,sp)
      008EDE 09               [ 1] 2673 	ld xl,a 
      008EDF 5B 03            [ 1] 2674 	ld a,(N2_LB,sp) 
      008EE1 85               [ 4] 2675 	mul x,a 
                           000000  2676 .if MATH_OVF 	
                                   2677 	ld a,xh 
                                   2678 	bcp a,#0x80 
                                   2679 	jreq 4$ 
                                   2680 	ld a,#ERR_MATH_OVF 
                                   2681 	jp tb_error
                                   2682 .endif 	 
      008EE2 81 02            [ 2] 2683 4$:	ldw (PROD,sp),x
                                   2684 ; N1_LB * N2_HB	 
      008EE3 7B 07            [ 1] 2685 	ld a,(N1_LB,sp) 
      008EE3 88               [ 1] 2686 	ld xl,a 
      008EE4 91 D6            [ 1] 2687 	ld a,(N2_HB,sp)
      008EE6 01               [ 4] 2688 	mul x,a
      008EE7 27               [ 1] 2689 	ld a,xl 
      008EE8 0A 11            [ 1] 2690 	add a,(PROD,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                           000000  2691 .if MATH_OVF 	
                                   2692 	bcp a,#0x80 
                                   2693 	jreq 5$ 
                                   2694 	ld a,#ERR_MATH_OVF 
                                   2695 	jp tb_error
                                   2696 .endif 	 
      008EEA 01 26            [ 1] 2697 5$:	ld (PROD,sp),a 
                                   2698 ; N1_HB * N2_LB 
      008EEC 06 72            [ 1] 2699 	ld a,(N1_HB,sp)
      008EEE 5C               [ 1] 2700 	ld xl,a 
      008EEF 00 02            [ 1] 2701 	ld a,(N2_LB,sp)
      008EF1 20               [ 4] 2702 	mul x,a 
      008EF2 F1               [ 1] 2703 	ld a,xl 
      008EF3 5B 01            [ 1] 2704 	add a,(PROD,sp)
                           000000  2705 .if MATH_OVF 	
                                   2706 	bcp a,#0x80 
                                   2707 	jreq 6$ 
                                   2708 	ld a,#ERR_MATH_OVF 
                                   2709 	jp tb_error
                                   2710 .endif 	 
      008EF5 81 02            [ 1] 2711 6$:	ld (PROD,sp),a 
                                   2712 ; N1_HB * N2_HB 	
                                   2713 ; it is pointless to multiply N1_HB*N2_HB 
                                   2714 ; as this product is over 65535 or 0 
                                   2715 ;
                                   2716 ; sign adjust product
      008EF6 0D 01            [ 1] 2717 	tnz (SIGN,sp)
      008EF6 CE 00            [ 1] 2718 	jreq 7$
      008EF8 12 CF            [ 2] 2719 	ldw x, (PROD,sp)
      008EFA 00               [ 2] 2720 	negw x
      008EFB 01 81            [ 2] 2721 	ldw (PROD,sp),x  
      008EFD                       2722 7$: 
      008EFD 72 5A            [ 2] 2723 	ldw x,(PROD,sp) 
      000FBE                       2724 	_drop VSIZE 
      008EFF 00 1B            [ 2]    1     addw sp,#VSIZE 
      008F01 72               [ 4] 2725 	ret
                                   2726 
                                   2727 ;----------------------------------
                                   2728 ;  euclidian divide n2/n1 
                                   2729 ; input:
                                   2730 ;    N2 	on cstack
                                   2731 ;    N1 	on cstack
                                   2732 ; output:
                                   2733 ;    X      n2/n1 
                                   2734 ;    Y      remainder 
                                   2735 ;----------------------------------
      000FC1                       2736 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      000FC1                       2737 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      000FC1                       2738 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2739 	; local variables
                           000001  2740 	SQUOT=1 ; sign quotient
                           000002  2741 	SDIVD=2 ; sign dividend  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                           000002  2742 	VSIZE=2
      000FC1                       2743 divide:
      000FC1                       2744 	_vars VSIZE 
      008F02 5A 00            [ 2]    1     sub sp,#VSIZE 
      008F04 1B 72            [ 1] 2745 	clr (SQUOT,sp)
      008F06 CF 00            [ 1] 2746 	clr (SDIVD,sp)
                                   2747 ; check for 0 divisor
      008F08 1A 81            [ 2] 2748 	ldw x,(DIVISR,sp)
      008F0A 5D               [ 2] 2749 	tnzw x 
      008F0A 72 CE            [ 1] 2750     jrne 0$
      008F0C 00 1A            [ 1] 2751 	ld a,#ERR_DIV0 
      008F0E 72 5C 00         [ 2] 2752 	jp tb_error 
                                   2753 ; check divisor sign 	
      008F11 1B               [ 1] 2754 0$:	ld a,xh 
      008F12 72 5C            [ 1] 2755 	bcp a,#0x80 
      008F14 00 1B            [ 1] 2756 	jreq 1$
      008F16 81 01            [ 1] 2757 	cpl (SQUOT,sp)
      008F17 50               [ 2] 2758 	negw x 
      008F17 72 CE            [ 2] 2759 1$:	ldw (DIVISR,sp),x
                                   2760 ; check dividend sign 	 
      008F19 00 1A            [ 2] 2761     ldw x,(DIVIDND,sp)
      008F1B 89               [ 1] 2762 	ld a,xh 
      008F1C AE 00            [ 1] 2763 	bcp a,#0x80 
      008F1E 02 72            [ 1] 2764 	jreq 2$ 
      008F20 DE 00            [ 1] 2765 	cpl (SQUOT,sp)
      008F22 1A 72            [ 1] 2766 	cpl (SDIVD,sp)
      008F24 CF               [ 2] 2767 	negw x 
      008F25 00 1A            [ 2] 2768 2$:	ldw y,(DIVISR,sp)
      008F27 AE               [ 2] 2769 	divw x,y
      008F28 00 02 90 85      [ 2] 2770 	ldw acc16,y 
                                   2771 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      008F2C 72 DF            [ 1] 2772 	tnz (SDIVD,sp)
      008F2E 00 1A            [ 1] 2773 	jreq 7$
      008F30 81 5D            [ 2] 2774 	tnzw y 
      008F31 27 07            [ 1] 2775 	jreq 7$
      008F31 72               [ 1] 2776 	incw x
      008F32 5C 00            [ 2] 2777 	ldw y,(DIVISR,sp)
      008F34 1B 72 5C 00      [ 2] 2778 	subw y,acc16
      008F38 1B 81            [ 1] 2779 7$: tnz (SQUOT,sp)
      008F3A 27 01            [ 1] 2780 	jreq 9$ 	 
      008F3A 72               [ 2] 2781 8$:	negw x 
      001002                       2782 9$: 
      001002                       2783 	_drop VSIZE 
      008F3B CE 00            [ 2]    1     addw sp,#VSIZE 
      008F3D 1A               [ 4] 2784 	ret 
                                   2785 
                                   2786 
                                   2787 ;----------------------------------
                                   2788 ;  remainder resulting from euclidian 
                                   2789 ;  division of n2/n1 
                                   2790 ; input:
                                   2791 ;   N1 		cstack 
                                   2792 ;   N2      cstack
                                   2793 ; output:
                                   2794 ;   X       N2%N1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



                                   2795 ;----------------------------------
                           000003  2796 	N1=3
                           000005  2797 	N2=5
                           000004  2798 	VSIZE=4
      001005                       2799 modulo:
      008F3E 72 5A            [ 2] 2800 	Ldw x,(N1,sp)
      008F40 00 1B            [ 2] 2801 	ldw y,(N2,sp)
      001009                       2802 	_vars VSIZE 
      008F42 72 5A            [ 2]    1     sub sp,#VSIZE 
      008F44 00 1B            [ 2] 2803 	ldw (1,sp),x 
      008F46 72 CF            [ 2] 2804 	ldw (3,sp),y 
      008F48 00 1A 81         [ 4] 2805 	call divide 
      008F4B 93               [ 1] 2806 	ldw x,y
      001013                       2807 	_drop VSIZE 
      008F4B 72 CE            [ 2]    1     addw sp,#VSIZE 
      008F4D 00               [ 4] 2808 	ret 
                                   2809 
                                   2810 ;---------------------------------
                                   2811 ; input:
                                   2812 ;	X 		dictionary entry point 
                                   2813 ;  pad		.asciz name to search 
                                   2814 ; output:
                                   2815 ;  A 		TK_CMD|TK_FUNC|TK_NONE 
                                   2816 ;  X		execution address | 0 
                                   2817 ;---------------------------------
                           000001  2818 	NLEN=1 ; cmd length 
                           000002  2819 	YSAVE=2
                           000003  2820 	VSIZE=3 
      001016                       2821 search_dict:
      001016                       2822 	_vars VSIZE 
      008F4E 1A 58            [ 2]    1     sub sp,#VSIZE 
      008F50 72 BB            [ 1] 2823 	ldw y,x 
      00101A                       2824 search_next:	
      008F52 00 1A            [ 1] 2825 	ld a,(y)
      008F54 FE 72            [ 1] 2826 	and a,#0x7f 
      008F56 CF 00            [ 1] 2827 	ld (NLEN,sp),a  
      008F58 1A 81 18         [ 2] 2828 	ldw x,#pad 
      008F5A 17 02            [ 2] 2829 	ldw (YSAVE,sp),y
      008F5A 72 CE            [ 1] 2830 	incw y  
      001027                       2831 cp_loop:
      008F5C 00               [ 1] 2832 	ld a,(x)
      008F5D 1A FE            [ 1] 2833 	jreq str_match 
      008F5F 72 CF            [ 1] 2834 	tnz (NLEN,sp)
      008F61 00 1A            [ 1] 2835 	jreq no_match  
      008F63 81 F1            [ 1] 2836 	cp a,(y)
      008F64 26 07            [ 1] 2837 	jrne no_match 
      008F64 CD 8F            [ 1] 2838 	incw y 
      008F66 0A               [ 1] 2839 	incw x
      008F67 90 93            [ 1] 2840 	dec (NLEN,sp)
      008F69 CD 8F            [ 2] 2841 	jra cp_loop 
      001039                       2842 no_match:
      008F6B 0A FF            [ 2] 2843 	ldw y,(YSAVE,sp) 
      008F6D 81 A2 00 02      [ 2] 2844 	subw y,#2 ; move Y to link field
      008F6E 4B 00            [ 1] 2845 	push #TK_NONE 
      008F6E 90 89            [ 2] 2846 	ldw y,(y) ; next word link 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      008F70 90               [ 1] 2847 	pop a ; TK_NONE 
      008F71 CE 00            [ 1] 2848 	jreq search_exit  ; not found  
                                   2849 ;try next 
      008F73 1A 58            [ 2] 2850 	jra search_next
      001048                       2851 str_match:
      008F75 89 72            [ 2] 2852 	ldw y,(YSAVE,sp)
      008F77 F9 01            [ 1] 2853 	ld a,(y)
      008F79 90 CF            [ 1] 2854 	ld (NLEN,sp),a ; needed to test bit 7 
      008F7B 00 1A            [ 1] 2855 	and a,#0x7f 
                                   2856 ; move y to procedure address field 	
      008F7D 85               [ 1] 2857 	inc a 
      008F7E 90 85 81         [ 1] 2858 	ld acc8,a 
      008F81 0A 64 73 74      [ 1] 2859 	clr acc16 
      008F85 61 63 6B 3A      [ 2] 2860 	addw y,acc16 
      008F89 20 00            [ 2] 2861 	ldw y,(y) ; routine entry point 
      008F8B 7B 01            [ 1] 2862 	ld a,(NLEN,sp)
      008F8B 52 02            [ 1] 2863 	bcp a,#0x80 
      008F8D AE 8F            [ 1] 2864 	jreq 1$
      008F8F 81 CD            [ 1] 2865 	ld a,#TK_FUNC 
      008F91 82 30            [ 2] 2866 	jra search_exit
      008F93 AE 17            [ 1] 2867 1$: ld a,#TK_CMD 
      00106A                       2868 search_exit: 
      008F95 7E               [ 1] 2869 	ldw x,y ; x=routine address 
      00106B                       2870 	_drop VSIZE 	 
      008F96 35 0A            [ 2]    1     addw sp,#VSIZE 
      008F98 00               [ 4] 2871 	ret 
                                   2872 
                                   2873 ;---------------------
                                   2874 ; check if next token
                                   2875 ;  is of expected type 
                                   2876 ; input:
                                   2877 ;   A 		 expected token attribute
                                   2878 ;  ouput:
                                   2879 ;   none     if fail call tb_error 
                                   2880 ;--------------------
      00106E                       2881 expect:
      008F99 08               [ 1] 2882 	push a 
      008F9A C3 00 1A         [ 4] 2883 	call get_token 
      008F9D 25 0D            [ 1] 2884 	cp a,(1,sp)
      008F9F 1F 01            [ 1] 2885 	jreq 1$
      008FA1 FE CD 88         [ 2] 2886 	jp syntax_error
      008FA4 CF               [ 1] 2887 1$: pop a 
      008FA5 1E               [ 4] 2888 	ret 
                                   2889 
                                   2890 
                                   2891 ;-------------------------------
                                   2892 ; parse embedded BASIC routines 
                                   2893 ; arguments list.
                                   2894 ; arg_list::=  rel[','rel]*
                                   2895 ; all arguments are of integer type
                                   2896 ; input:
                                   2897 ;   none
                                   2898 ; output:
                                   2899 ;   A 			number of arguments pushed on dstack  
                                   2900 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



                           000001  2901 	ARG_CNT=1 
      00107B                       2902 arg_list:
      008FA6 01 1D            [ 1] 2903 	push #0  
      008FA8 00 02 20         [ 4] 2904 1$: call relation
      008FAB EE A6            [ 1] 2905 	cp a,#TK_NONE 
      008FAD 0D CD            [ 1] 2906 	jreq 5$
      008FAF 82 1E            [ 1] 2907 	cp a,#TK_INTGR
      008FB1 5B 02            [ 1] 2908 	jrne 4$
      008FB3 4F 81 0A         [ 4] 2909 3$: call dpush 
      008FB6 63 74            [ 1] 2910     inc (ARG_CNT,sp)
      008FB8 61 63 6B         [ 4] 2911 	call get_token 
      008FBB 3A 20            [ 1] 2912 	cp a,#TK_NONE 
      008FBD 00 09            [ 1] 2913 	jreq 5$ 
      008FBE A1 08            [ 1] 2914 	cp a,#TK_COMMA 
      008FBE 52 02            [ 1] 2915 	jrne 4$
      008FC0 AE 8F            [ 2] 2916 	jra 1$ 
      008FC2 B5 CD 82         [ 4] 2917 4$:	call unget_token 
      008FC5 30               [ 1] 2918 5$:	pop a 
      008FC6 96               [ 4] 2919 	ret 
                                   2920 
                                   2921 
                                   2922 
                                   2923 ;--------------------------------
                                   2924 ;   BASIC commnands 
                                   2925 ;--------------------------------
                                   2926 
                                   2927 ;--------------------------------
                                   2928 ;  arithmetic and relational 
                                   2929 ;  routines
                                   2930 ;  operators precedence
                                   2931 ;  highest to lowest
                                   2932 ;  operators on same row have 
                                   2933 ;  same precedence and are executed
                                   2934 ;  from left to right.
                                   2935 ;	'*','/','%'
                                   2936 ;   '-','+'
                                   2937 ;   '=','>','<','>=','<=','<>','><'
                                   2938 ;   '<>' and '><' are equivalent for not equal.
                                   2939 ;--------------------------------
                                   2940 
                                   2941 ;---------------------
                                   2942 ; return array element
                                   2943 ; address from @(expr)
                                   2944 ; input:
                                   2945 ;   A 		TK_ARRAY
                                   2946 ; output:
                                   2947 ;   A 		TK_INTGR
                                   2948 ;	X 		element address 
                                   2949 ;----------------------
      00109F                       2950 get_array_element:
      008FC7 1C 00 07         [ 4] 2951 	call ddrop 
      008FCA 1F 01            [ 1] 2952 	ld a,#TK_LPAREN 
      008FCC AE 17 FE         [ 4] 2953 	call expect
      008FCF 35 10 00         [ 4] 2954 	call relation 
      008FD2 08 0A            [ 1] 2955 	cp a,#TK_INTGR 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      008FD3 27 03            [ 1] 2956 	jreq 1$
      008FD3 13 01 2B         [ 2] 2957 	jp syntax_error
      008FD6 0B               [ 2] 2958 1$: pushw x 
      008FD7 89 FE            [ 1] 2959 	ld a,#TK_RPAREN 
      008FD9 CD 88 CF         [ 4] 2960 	call expect
                                   2961 	; check for bounds 
      008FDC 85               [ 2] 2962 	popw x   
      008FDD 1D 00 02         [ 2] 2963 	cpw x,array_size 
      008FE0 20 F1            [ 2] 2964 	jrule 3$
                                   2965 ; bounds {1..array_size}	
      008FE2 A6 0D            [ 1] 2966 2$: ld a,#ERR_BAD_VALUE 
      008FE4 CD 82 1E         [ 2] 2967 	jp tb_error 
      008FE7 5B               [ 2] 2968 3$: tnzw  x
      008FE8 02 4F            [ 1] 2969 	jreq 2$ 
      008FEA 81               [ 2] 2970 	sllw x 
      008FEB 89               [ 2] 2971 	pushw x 
      008FEB 1E 05 72         [ 2] 2972 	ldw x,array_addr  
      008FEE FB 03 1F         [ 2] 2973 	subw x,(1,sp)
      0010CD                       2974 	_drop 2   
      008FF1 03 81            [ 2]    1     addw sp,#2 
      008FF3 A6 0A            [ 1] 2975 	ld a,#TK_INTGR
      008FF3 1E               [ 4] 2976 	ret 
                                   2977 
                                   2978 ;***********************************
                                   2979 ;   expression parse,execute 
                                   2980 ;***********************************
                                   2981 ;-----------------------------------
                                   2982 ; factor ::= ['+'|'-'|e] var | @ |
                                   2983 ;			 integer | function |
                                   2984 ;			 '('relation')' 
                                   2985 ; output:
                                   2986 ;   A    token attribute 
                                   2987 ;   X 	 integer
                                   2988 ; ---------------------------------
                           000001  2989 	NEG=1
                           000001  2990 	VSIZE=1
      0010D2                       2991 factor:
      0010D2                       2992 	_vars VSIZE 
      008FF4 05 72            [ 2]    1     sub sp,#VSIZE 
      008FF6 F0 03 81         [ 4] 2993 	call get_token
      008FF9 A1 02            [ 1] 2994 	cp a,#2 
      008FF9 52 03            [ 1] 2995 	jrmi 20$
      008FFB 0F 01            [ 1] 2996 1$:	ld (NEG,sp),a 
      008FFD 1E 06            [ 1] 2997 	and a,#TK_GRP_ADD  
      008FFF 9E A5            [ 1] 2998 	jrne 2$
      009001 80 27            [ 1] 2999 	ld a,(NEG,sp)
      009003 05 03            [ 2] 3000 	jra 4$  
      0010E5                       3001 2$:	
      009005 01 50 1F         [ 4] 3002 	call get_token 
      0010E8                       3003 4$:	
      009008 06 1E            [ 1] 3004 	cp a,#TK_FUNC 
      00900A 08 9E            [ 1] 3005 	jrne 5$ 
      00900C A5               [ 4] 3006 	call (x) 
      00900D 80 27            [ 2] 3007 	jra 18$ 
      0010EF                       3008 5$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      00900F 05 03            [ 1] 3009 	cp a,#TK_INTGR
      009011 01 50            [ 1] 3010 	jrne 6$
      009013 1F 08            [ 2] 3011 	jra 18$
      0010F5                       3012 6$:
      009015 7B 07            [ 1] 3013 	cp a,#TK_ARRAY
      009017 97 7B            [ 1] 3014 	jrne 10$
      009019 09 42 1F         [ 4] 3015 	call get_array_element
      00901C 02               [ 2] 3016 	ldw x,(x)
      00901D 7B 07            [ 2] 3017 	jra 18$ 
      0010FF                       3018 10$:
      00901F 97 7B            [ 1] 3019 	cp a,#TK_VAR 
      009021 08 42            [ 1] 3020 	jrne 12$
      009023 9F               [ 2] 3021 	ldw x,(x)
      009024 1B 02            [ 2] 3022 	jra 18$
      001106                       3023 12$:			
      009026 6B 02            [ 1] 3024 	cp a,#TK_LPAREN
      009028 7B 06            [ 1] 3025 	jrne 16$
      00902A 97 7B 09         [ 4] 3026 	call relation
      00902D 42 9F            [ 1] 3027 	ld a,#TK_RPAREN 
      00902F 1B 02 6B         [ 4] 3028 	call expect
      009032 02 0D            [ 2] 3029 	jra 18$	
      001114                       3030 16$:
      009034 01 27 05         [ 4] 3031 	call unget_token
      009037 1E               [ 1] 3032 	clr a 
      009038 02 50            [ 2] 3033 	jra 20$ 
      00111A                       3034 18$: 
      00903A 1F 02            [ 1] 3035 	ld a,#TK_MINUS 
      00903C 11 01            [ 1] 3036 	cp a,(NEG,sp)
      00903C 1E 02            [ 1] 3037 	jrne 19$
      00903E 5B               [ 2] 3038 	negw x
      001121                       3039 19$:
      00903F 03 81            [ 1] 3040 	ld a,#TK_INTGR
      009041                       3041 20$:
      001123                       3042 	_drop VSIZE
      009041 52 02            [ 2]    1     addw sp,#VSIZE 
      009043 0F               [ 4] 3043 	ret
                                   3044 
                                   3045 ;-----------------------------------
                                   3046 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3047 ; output:
                                   3048 ;   A    	token attribute 
                                   3049 ;	X		integer
                                   3050 ;-----------------------------------
                           000001  3051 	N1=1
                           000003  3052 	N2=3
                           000005  3053 	MULOP=5
                           000005  3054 	VSIZE=5
      001126                       3055 term:
      001126                       3056 	_vars VSIZE
      009044 01 0F            [ 2]    1     sub sp,#VSIZE 
      009046 02 1E 05         [ 4] 3057 	call factor
      009049 5D 26            [ 1] 3058 	cp a,#2
      00904B 05 A6            [ 1] 3059 	jrmi term_exit
      00112F                       3060 term01:	 ; check for  operator 
      00904D 04 CC            [ 2] 3061 	ldw (N2,sp),x  ; save first factor 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



      00904F 86 7E 9E         [ 4] 3062 	call get_token
      009052 A5 80            [ 1] 3063 	cp a,#2
      009054 27 03            [ 1] 3064 	jrmi 9$
      009056 03 01            [ 1] 3065 0$:	ld (MULOP,sp),a
      009058 50 1F            [ 1] 3066 	and a,#TK_GRP_MASK
      00905A 05 1E            [ 1] 3067 	cp a,#TK_GRP_MULT
      00905C 07 9E            [ 1] 3068 	jreq 1$
      00905E A5 80            [ 1] 3069 	ld a,(MULOP,sp) 
      009060 27 05 03         [ 4] 3070 	call unget_token 
      009063 01 03            [ 2] 3071 	jra 9$
      001147                       3072 1$:	; got *|/|%
      009065 02 50 16         [ 4] 3073 	call factor
      009068 05 65            [ 1] 3074 	cp a,#TK_INTGR
      00906A 90 CF            [ 1] 3075 	jreq 2$ 
      00906C 00 0A 0D         [ 2] 3076 	jp syntax_error
      00906F 02 27            [ 2] 3077 2$:	ldw (N1,sp),x  
      009071 0B 90            [ 1] 3078 	ld a,(MULOP,sp) 
      009073 5D 27            [ 1] 3079 	cp a,#TK_MULT 
      009075 07 5C            [ 1] 3080 	jrne 3$
      009077 16 05 72         [ 4] 3081 	call multiply 
      00907A B2 00            [ 2] 3082 	jra term01
      00907C 0A 0D            [ 1] 3083 3$: cp a,#TK_DIV 
      00907E 01 27            [ 1] 3084 	jrne 4$ 
      009080 01 50 C1         [ 4] 3085 	call divide 
      009082 20 C8            [ 2] 3086 	jra term01 
      009082 5B 02 81         [ 4] 3087 4$: call modulo
      009085 20 C3            [ 2] 3088 	jra term01 
      009085 1E 03            [ 2] 3089 9$: ldw x,(N2,sp)  
      009087 16 05            [ 1] 3090 	ld a,#TK_INTGR 	
      001170                       3091 term_exit:
      001170                       3092 	_drop VSIZE 
      009089 52 04            [ 2]    1     addw sp,#VSIZE 
      00908B 1F               [ 4] 3093 	ret 
                                   3094 
                                   3095 ;-------------------------------
                                   3096 ;  expr ::= term [['+'|'-'] term]*
                                   3097 ;  result range {-32768..32767}
                                   3098 ;  output:
                                   3099 ;   A    token attribute 
                                   3100 ;   X	 integer   
                                   3101 ;-------------------------------
                           000001  3102 	N1=1 
                           000003  3103 	N2=3
                           000005  3104 	OP=5 
                           000005  3105 	VSIZE=5 
      001173                       3106 expression:
      001173                       3107 	_vars VSIZE 
      00908C 01 17            [ 2]    1     sub sp,#VSIZE 
      00908E 03 CD 90         [ 4] 3108 	call term
      009091 41 93            [ 1] 3109 	cp a,#2 
      009093 5B 04            [ 1] 3110 	jrmi expr_exit 
      009095 81 03            [ 2] 3111 0$:	ldw (N2,sp),x 
      009096 CD 0B E7         [ 4] 3112 	call get_token
      009096 52 03            [ 1] 3113 	cp a,#2
      009098 90 93            [ 1] 3114 	jrmi 9$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



      00909A 6B 05            [ 1] 3115 1$:	ld (OP,sp),a  
      00909A 90 F6            [ 1] 3116 	and a,#TK_GRP_MASK
      00909C A4 7F            [ 1] 3117 	cp a,#TK_GRP_ADD 
      00909E 6B 01            [ 1] 3118 	jreq 2$ 
      0090A0 AE 17            [ 1] 3119 	ld a,(OP,sp)
      0090A2 18 17 02         [ 4] 3120 	call unget_token
      0090A5 90 5C            [ 2] 3121 	jra 9$
      0090A7                       3122 2$: 
      0090A7 F6 27 1E         [ 4] 3123 	call term
      0090AA 0D 01            [ 1] 3124 	cp a,#TK_INTGR 
      0090AC 27 0B            [ 1] 3125 	jreq 3$
      0090AE 90 F1 26         [ 2] 3126 	jp syntax_error
      0090B1 07 90            [ 2] 3127 3$:	ldw (N1,sp),x 
      0090B3 5C 5C            [ 1] 3128 	ld a,(OP,sp)
      0090B5 0A 01            [ 1] 3129 	cp a,#TK_PLUS 
      0090B7 20 EE            [ 1] 3130 	jrne 4$
      0090B9 CD 0F 6B         [ 4] 3131 	call add 
      0090B9 16 02            [ 2] 3132 	jra 0$ 
      0090BB 72 A2 00         [ 4] 3133 4$:	call substract
      0090BE 02 4B            [ 2] 3134 	jra 0$
      0090C0 00 90            [ 2] 3135 9$: ldw x,(N2,sp)
      0090C2 FE 84            [ 1] 3136 	ld a,#TK_INTGR	
      0011B4                       3137 expr_exit:
      0011B4                       3138 	_drop VSIZE 
      0090C4 27 24            [ 2]    1     addw sp,#VSIZE 
      0090C6 20               [ 4] 3139 	ret 
                                   3140 
                                   3141 ;---------------------------------------------
                                   3142 ; rel ::= expr rel_op expr
                                   3143 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3144 ;  relation return 1 | 0  for true | false 
                                   3145 ;  output:
                                   3146 ;    A 		token attribute  
                                   3147 ;	 X		1|0
                                   3148 ;---------------------------------------------
                           000001  3149 	N1=1
                           000003  3150 	N2=3
                           000005  3151 	RELOP=5
                           000005  3152 	VSIZE=5 
      0011B7                       3153 relation: 
      0011B7                       3154 	_vars VSIZE
      0090C7 D2 05            [ 2]    1     sub sp,#VSIZE 
      0090C8 CD 11 73         [ 4] 3155 	call expression
      0090C8 16 02            [ 1] 3156 	cp a,#2 
      0090CA 90 F6            [ 1] 3157 	jrmi rel_exit 
                                   3158 	; expect rel_op or leave 
      0090CC 6B 01            [ 2] 3159 	ldw (N2,sp),x 
      0090CE A4 7F 4C         [ 4] 3160 	call get_token 
      0090D1 C7 00            [ 1] 3161 	cp a,#2
      0090D3 0B 72            [ 1] 3162 	jrmi 9$
      0011C9                       3163 1$:	
      0090D5 5F 00            [ 1] 3164 	ld (RELOP,sp),a 
      0090D7 0A 72            [ 1] 3165 	and a,#TK_GRP_MASK
      0090D9 B9 00            [ 1] 3166 	cp a,#0x30 
      0090DB 0A 90            [ 1] 3167 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      0090DD FE 7B            [ 1] 3168 	ld a,(RELOP,sp)
      0090DF 01 A5 80         [ 4] 3169 	call unget_token  
      0090E2 27 04            [ 2] 3170 	jra 9$
      0011D8                       3171 2$:	; expect another expression or error 
      0090E4 A6 0C 20         [ 4] 3172 	call expression
      0090E7 02 A6            [ 1] 3173 	cp a,#TK_INTGR 
      0090E9 07 03            [ 1] 3174 	jreq 3$
      0090EA CC 05 FC         [ 2] 3175 	jp syntax_error 
      0090EA 93 5B            [ 2] 3176 3$:	ldw (N1,sp),x 
      0090EC 03 81 73         [ 4] 3177 	call substract
      0090EE 26 06            [ 1] 3178 	jrne 4$
      0090EE 88 CD 8C 67      [ 1] 3179 	mov acc8,#2 ; n1==n2
      0090F2 11 01            [ 2] 3180 	jra 6$ 
      0011EF                       3181 4$: 
      0090F4 27 03            [ 1] 3182 	jrsgt 5$  
      0090F6 CC 86 7C 84      [ 1] 3183 	mov acc8,#4 ; n1<2 
      0090FA 81 04            [ 2] 3184 	jra 6$
      0090FB                       3185 5$:
      0090FB 4B 00 CD 92      [ 1] 3186 	mov acc8,#1 ; n1>n2 
      0011FB                       3187 6$:
      0090FF 37               [ 1] 3188 	clrw x 
      009100 A1 00 27         [ 1] 3189 	ld a, acc8  
      009103 19 A1            [ 1] 3190 	and a,(RELOP,sp)
      009105 0A               [ 1] 3191 	tnz a 
      009106 26 12            [ 1] 3192 	jreq 10$
      009108 CD               [ 1] 3193 	incw x 
      001205                       3194 7$:	 
      009109 8E FD            [ 2] 3195 	jra 10$  	
      00910B 0C 01            [ 2] 3196 9$: ldw x,(N2,sp)
      001209                       3197 10$:
      00910D CD 8C            [ 1] 3198 	ld a,#TK_INTGR
      00120B                       3199 rel_exit: 	 
      00120B                       3200 	_drop VSIZE
      00910F 67 A1            [ 2]    1     addw sp,#VSIZE 
      009111 00               [ 4] 3201 	ret 
                                   3202 
                                   3203 ;--------------------------------
                                   3204 ; BASIC: SHOW 
                                   3205 ;  show content of dstack,cstack
                                   3206 ;--------------------------------
      00120E                       3207 show:
      009112 27 09 A1         [ 1] 3208 	ld a,base 
      009115 08               [ 1] 3209 	push a 
      009116 26 02 20         [ 4] 3210 	call dots
      009119 E3 CD 8E         [ 4] 3211 	call dotr 
      00911C F6               [ 1] 3212 	pop a 
      00911D 84 81 07         [ 1] 3213 	ld base,a 
      00911F 4F               [ 1] 3214 	clr a 
      00911F CD               [ 4] 3215 	ret
                                   3216 
                                   3217 ;--------------------------------------------
                                   3218 ; BASIC: HEX 
                                   3219 ; select hexadecimal base for integer print
                                   3220 ;---------------------------------------------
      00121E                       3221 hex_base:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



      009120 8F 31 A6 04      [ 1] 3222 	mov base,#16 
      009124 CD               [ 4] 3223 	ret 
                                   3224 
                                   3225 ;--------------------------------------------
                                   3226 ; BASIC: DEC 
                                   3227 ; select decimal base for integer print
                                   3228 ;---------------------------------------------
      001223                       3229 dec_base:
      009125 90 EE CD 92      [ 1] 3230 	mov base,#10
      009129 37               [ 4] 3231 	ret 
                                   3232 
                                   3233 ;------------------------
                                   3234 ; BASIC: SIZE 
                                   3235 ; return free size in text area
                                   3236 ; output:
                                   3237 ;   A 		TK_INTGR
                                   3238 ;   X 	    size integer
                                   3239 ;--------------------------
      001228                       3240 size:
      00912A A1 0A 27         [ 2] 3241 	ldw x,#tib 
      00912D 03 CC 86 7C      [ 2] 3242 	subw x,txtend 
      009131 89 A6            [ 1] 3243 	ld a,#TK_INTGR
      009133 05               [ 4] 3244 	ret 
                                   3245 
                                   3246 
                                   3247 ;------------------------
                                   3248 ; BASIC: UBOUND  
                                   3249 ; return array variable size 
                                   3250 ; output:
                                   3251 ;   A 		TK_INTGR
                                   3252 ;   X 	    array size 
                                   3253 ;--------------------------
      001232                       3254 ubound:
      009134 CD 90 EE         [ 2] 3255 	ldw x,#tib
      009137 85 C3 00 23      [ 2] 3256 	subw x,txtend 
      00913B 23               [ 2] 3257 	srlw x 
      00913C 05 A6 0A         [ 2] 3258 	ldw array_size,x
      00913F CC 86            [ 1] 3259 	ld a,#TK_INTGR
      009141 7E               [ 4] 3260 	ret 
                                   3261 
                                   3262 ;-----------------------------
                                   3263 ; BASIC: LET var=expr 
                                   3264 ; variable assignement 
                                   3265 ; output:
                                   3266 ;   A 		TK_NONE 
                                   3267 ;-----------------------------
      001240                       3268 let:
      009142 5D 27 F8         [ 4] 3269 	call get_token 
      009145 58 89            [ 1] 3270 	cp a,#TK_VAR 
      009147 CE 00            [ 1] 3271 	jreq let02
      009149 21 72 F0         [ 2] 3272 	jp syntax_error
      00124A                       3273 let02:
      00914C 01 5B 02         [ 4] 3274 	call dpush 
      00914F A6 0A 81         [ 4] 3275 	call get_token 
      009152 A1 32            [ 1] 3276 	cp a,#TK_EQUAL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



      009152 52 01            [ 1] 3277 	jreq 1$
      009154 CD 8C 67         [ 2] 3278 	jp syntax_error
      001257                       3279 1$:	
      009157 A1 02 2B         [ 4] 3280 	call relation   
      00915A 48 6B            [ 1] 3281 	cp a,#TK_INTGR 
      00915C 01 A4            [ 1] 3282 	jreq 2$
      00915E 10 26 04         [ 2] 3283 	jp syntax_error
      001261                       3284 2$:	
      009161 7B 01            [ 1] 3285 	ldw y,x 
      009163 20 03 8A         [ 4] 3286 	call dpop  
      009165 FF               [ 2] 3287 	ldw (x),y   
      009165 CD               [ 4] 3288 	ret 
                                   3289 
                                   3290 ;----------------------------
                                   3291 ; BASIC: LIST [[start][,end]]
                                   3292 ; list program lines 
                                   3293 ; form start to end 
                                   3294 ; if empty argument list then 
                                   3295 ; list all.
                                   3296 ;----------------------------
                           000001  3297 	FIRST=1
                           000003  3298 	LAST=3 
                           000005  3299 	LN_PTR=5
                           000006  3300 	VSIZE=6 
      001268                       3301 list:
      001268                       3302 	_vars VSIZE
      009166 8C 67            [ 2]    1     sub sp,#VSIZE 
      009168 CE 00 1B         [ 2] 3303 	ldw x,txtbgn 
      009168 A1 0C 26         [ 2] 3304 	cpw x,txtend 
      00916B 03 FD            [ 1] 3305 	jrmi 1$
      00916D 20 2B EB         [ 2] 3306 	jp list_exit ; nothing to list 
      00916F 1F 05            [ 2] 3307 1$:	ldw (LN_PTR,sp),x 
      00916F A1               [ 2] 3308 	ldw x,(x) 
      009170 0A 26            [ 2] 3309 	ldw (FIRST,sp),x ; list from first line 
      009172 02 20 25         [ 2] 3310 	ldw x,#0x7fff ; biggest line number 
      009175 1F 03            [ 2] 3311 	ldw (LAST,sp),x 
      009175 A1 03 26         [ 4] 3312 	call arg_list
      009178 06               [ 1] 3313 	tnz a
      009179 CD 91            [ 1] 3314 	jreq list_start 
      00917B 1F FE            [ 1] 3315 	cp a,#2 
      00917D 20 1B            [ 1] 3316 	jreq 4$
      00917F A1 01            [ 1] 3317 	cp a,#1 
      00917F A1 02            [ 1] 3318 	jreq first_line 
      009181 26 03 FE         [ 2] 3319 	jp syntax_error 
      009184 20 14 97         [ 4] 3320 4$:	call dswap
      009186                       3321 first_line:
      009186 A1 04 26         [ 4] 3322 	call dpop 
      009189 0A CD            [ 2] 3323 	ldw (FIRST,sp),x 
      00918B 92 37            [ 1] 3324 	cp a,#1 
      00918D A6 05            [ 1] 3325 	jreq lines_skip 	
      00129C                       3326 last_line:
      00918F CD 90 EE         [ 4] 3327 	call dpop 
      009192 20 06            [ 2] 3328 	ldw (LAST,sp),x 
      009194                       3329 lines_skip:
      009194 CD 8E F6         [ 2] 3330 	ldw x,txtbgn
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



      009197 4F 20            [ 2] 3331 2$:	ldw (LN_PTR,sp),x 
      009199 09 00 1D         [ 2] 3332 	cpw x,txtend 
      00919A 2A 40            [ 1] 3333 	jrpl list_exit 
      00919A A6               [ 2] 3334 	ldw x,(x) ;lineno 
      00919B 11 11            [ 2] 3335 	cpw x,(FIRST,sp)
      00919D 01 26            [ 1] 3336 	jrpl list_start 
      00919F 01 50            [ 2] 3337 	ldw x,(LN_PTR,sp) 
      0091A1 1C 00 02         [ 2] 3338 	addw x,#2 
      0091A1 A6               [ 1] 3339 	ld a,(x)
      0091A2 0A               [ 1] 3340 	incw x 
      0091A3 C7 00 0A         [ 1] 3341 	ld acc8,a 
      0091A3 5B 01 81 09      [ 1] 3342 	clr acc16 
      0091A6 72 BB 00 09      [ 2] 3343 	addw x,acc16
      0091A6 52 05            [ 2] 3344 	jra 2$ 
                                   3345 ; print loop
      0012C4                       3346 list_start:
      0091A8 CD 91            [ 2] 3347 	ldw x,(LN_PTR,sp)
      0012C6                       3348 3$:	
      0091AA 52 A1 02         [ 4] 3349 	call prt_basic_line
      0091AD 2B 41            [ 2] 3350 	ldw x,(LN_PTR,sp)
      0091AF 1C 00 02         [ 2] 3351 	addw x,#2 
      0091AF 1F               [ 1] 3352 	ld a,(x)
      0091B0 03               [ 1] 3353 	incw x 
      0091B1 CD 8C 67         [ 1] 3354 	ld acc8,a 
      0091B4 A1 02 2B 34      [ 1] 3355 	clr acc16 
      0091B8 6B 05 A4 30      [ 2] 3356 	addw x,acc16
      0091BC A1 20 27         [ 2] 3357 	cpw x,txtend 
      0091BF 07 7B            [ 1] 3358 	jrpl list_exit
      0091C1 05 CD            [ 2] 3359 	ldw (LN_PTR,sp),x
      0091C3 8E               [ 2] 3360 	ldw x,(x)
      0091C4 F6 20            [ 2] 3361 	cpw x,(LAST,sp)  
      0091C6 25 04            [ 1] 3362 	jrsgt list_exit 
      0091C7 1E 05            [ 2] 3363 	ldw x,(LN_PTR,sp)
      0091C7 CD 91            [ 2] 3364 	jra 3$
      0012EB                       3365 list_exit:
      0012EB                       3366 	_drop VSIZE 
      0091C9 52 A1            [ 2]    1     addw sp,#VSIZE 
      0091CB 0A               [ 4] 3367 	ret
                                   3368 
                                   3369 ;--------------------------
                                   3370 ; input:
                                   3371 ;   X 		pointer at line
                                   3372 ; output:
                                   3373 ;   none 
                                   3374 ;--------------------------	
      0012EE                       3375 prt_basic_line:
      0091CC 27               [ 2] 3376 	pushw x 
      0091CD 03               [ 2] 3377 	ldw x,(x)
      0091CE CC 86 7C         [ 2] 3378 	ldw acc16,x 
      0091D1 1F 01 7B 05      [ 1] 3379 	clr acc24 
      0091D5 A1 20 26         [ 2] 3380 	ldw x,#5 
      0091D8 05 CD            [ 1] 3381 	ld a,#10 
      0091DA 8F F9 20         [ 4] 3382 	call prti24 
      0091DD D1               [ 2] 3383 	popw x 
      0091DE A1 21 26         [ 2] 3384 	addw x,#3
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0091E1 05 CD 90         [ 4] 3385 	call puts 
      0091E4 41 20            [ 1] 3386 	ld a,#CR 
      0091E6 C8 CD 90         [ 4] 3387 	call putc 
      0091E9 85               [ 4] 3388 	ret 	
                                   3389 
                                   3390 ;---------------------------------
                                   3391 ; BASIC: PRINT|? arg_list 
                                   3392 ; print values from argument list
                                   3393 ;----------------------------------
                           000001  3394 	COMMA=1
                           000001  3395 	VSIZE=1
      00130C                       3396 print:
      0091EA 20 C3            [ 1] 3397 push #0 ; local variable COMMA 
      00130E                       3398 reset_comma:
      0091EC 1E 03            [ 1] 3399 	clr (COMMA,sp)
      001310                       3400 prt_loop:
      0091EE A6 0A B7         [ 4] 3401 	call relation
      0091F0 A1 01            [ 1] 3402 	cp a,#TK_COLON 
      0091F0 5B 05            [ 1] 3403 	jreq print_exit   
      0091F2 81 0A            [ 1] 3404 	cp a,#TK_INTGR 
      0091F3 26 05            [ 1] 3405 	jrne 0$ 
      0091F3 52 05 CD         [ 4] 3406 	call print_int 
      0091F6 91 A6            [ 2] 3407 	jra reset_comma
      001320                       3408 0$: 	
      0091F8 A1 02 2B         [ 4] 3409 	call get_token
      0091FB 38 1F            [ 1] 3410 	cp a,#TK_NONE 
      0091FD 03 CD            [ 1] 3411 	jreq print_exit 
      0091FF 8C 67            [ 1] 3412 1$:	cp a,#TK_QSTR
      009201 A1 02            [ 1] 3413 	jrne 2$   
      009203 2B 2B 6B         [ 4] 3414 	call puts 
      009206 05 A4            [ 2] 3415 	jra reset_comma
      009208 30 A1            [ 1] 3416 2$: cp a,#TK_CHAR 
      00920A 10 27            [ 1] 3417 	jrne 3$
      00920C 07               [ 1] 3418 	ld a,xl 
      00920D 7B 05 CD         [ 4] 3419 	call putc 
      009210 8E F6            [ 2] 3420 	jra reset_comma 
      00133A                       3421 3$: 	
      009212 20 1C            [ 1] 3422 	cp a,#TK_FUNC 
      009214 26 06            [ 1] 3423 	jrne 4$ 
      009214 CD               [ 4] 3424 	call (x)
      009215 91 A6 A1         [ 4] 3425 	call print_int 
      009218 0A 27            [ 2] 3426 	jra reset_comma 
      001344                       3427 4$: 
      00921A 03 CC            [ 1] 3428 	cp a,#TK_COMMA 
      00921C 86 7C            [ 1] 3429 	jrne 5$
      00921E 1F 01            [ 1] 3430 	cpl (COMMA,sp) 
      009220 7B 05 A1         [ 2] 3431 	jp prt_loop   
      00134D                       3432 5$: 
      009223 10 26            [ 1] 3433 	cp a,#TK_SHARP
      009225 05 CD            [ 1] 3434 	jrne 7$
      009227 8F EB 20         [ 4] 3435 	call get_token
      00922A D1 CD            [ 1] 3436 	cp a,#TK_INTGR 
      00922C 8F F3            [ 1] 3437 	jreq 6$
      00922E 20 CC 1E         [ 2] 3438 	jp syntax_error 
      00135B                       3439 6$:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009231 03               [ 1] 3440 	ld a,xl 
      009232 A6 0A            [ 1] 3441 	and a,#15 
      009234 C7 00 25         [ 1] 3442 	ld tab_width,a 
      009234 5B 05 81         [ 2] 3443 	jp reset_comma 
      009237                       3444 7$:	
      009237 52 05 CD         [ 4] 3445 	call unget_token
      001367                       3446 print_exit:
      00923A 91 F3            [ 1] 3447 	tnz (COMMA,sp)
      00923C A1 02            [ 1] 3448 	jrne 9$
      00923E 2B 4B            [ 1] 3449 	ld a,#CR 
      009240 1F 03 CD         [ 4] 3450     call putc 
      001370                       3451 9$:	_drop VSIZE 
      009243 8C 67            [ 2]    1     addw sp,#VSIZE 
      009245 A1               [ 4] 3452 	ret 
                                   3453 
                                   3454 ;----------------------
                                   3455 ; 'save_context' and
                                   3456 ; 'rest_context' must be 
                                   3457 ; called at the same 
                                   3458 ; call stack depth 
                                   3459 ; i.e. SP must have the 
                                   3460 ; save value at  
                                   3461 ; entry point of both 
                                   3462 ; routine. 
                                   3463 ;---------------------
                           000006  3464 	CTXT_SIZE=6 ; size of saved data 
                                   3465 ;--------------------
                                   3466 ; save current BASIC
                                   3467 ; interpreter context 
                                   3468 ; on cstack 
                                   3469 ;--------------------
      001373                       3470 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001373                       3471 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001373                       3472 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001373                       3473 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001373                       3474 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      001373                       3475 save_context:
      009246 02 2B 3E         [ 2] 3476 	ldw x,basicptr 
      009249 1F 03            [ 2] 3477 	ldw (BPTR,sp),x
      009249 6B 05 A4         [ 2] 3478 	ldw x,lineno 
      00924C 30 A1            [ 2] 3479 	ldw (LNO,sp),x 
      00924E 30 27 07         [ 1] 3480 	ld a,in 
      009251 7B 05            [ 1] 3481 	ld (IN,sp),a
      009253 CD 8E F6         [ 1] 3482 	ld a,count 
      009256 20 2F            [ 1] 3483 	ld (CNT,sp),a  
      009258 81               [ 4] 3484 	ret
                                   3485 
                                   3486 ;-----------------------
                                   3487 ; restore previously saved 
                                   3488 ; BASIC interpreter context 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



                                   3489 ; from cstack 
                                   3490 ;-------------------------
      001388                       3491 rest_context:
      009258 CD 91            [ 2] 3492 	ldw x,(BPTR,sp)
      00925A F3 A1 0A         [ 2] 3493 	ldw basicptr,x 
      00925D 27 03            [ 2] 3494 	ldw x,(LNO,sp)
      00925F CC 86 7C         [ 2] 3495 	ldw lineno,x 
      009262 1F 01            [ 1] 3496 	ld a,(IN,sp)
      009264 CD 8F F3         [ 1] 3497 	ld in,a
      009267 26 06            [ 1] 3498 	ld a,(CNT,sp)
      009269 35 02 00         [ 1] 3499 	ld count,a  
      00926C 0B               [ 4] 3500 	ret
                                   3501 
                                   3502 ;------------------------------------------
                                   3503 ; BASIC: INPUT [string],var[,[string],var]
                                   3504 ; input value in variables 
                                   3505 ; [string] optionally can be used as prompt 
                                   3506 ;-----------------------------------------
                           000001  3507 	CX_BPTR=1
                           000003  3508 	CX_LNO=3
                           000004  3509 	CX_IN=4
                           000005  3510 	CX_CNT=5
                           000006  3511 	SKIP=6
                           000007  3512 	VSIZE=7
      00139D                       3513 input_var:
      00926D 20 0C 00 24 05   [ 2] 3514 	btjt flags,#FRUN,1$ 
      00926F A6 06            [ 1] 3515 	ld a,#ERR_RUN_ONLY 
      00926F 2C 06 35         [ 2] 3516 	jp tb_error 
      0013A7                       3517 1$:	_vars VSIZE 
      009272 04 00            [ 2]    1     sub sp,#VSIZE 
      0013A9                       3518 input_loop:
      009274 0B 20            [ 1] 3519 	clr (SKIP,sp)
      009276 04 0B E7         [ 4] 3520 	call get_token 
      009277 A1 00            [ 1] 3521 	cp a,#TK_NONE 
      009277 35 01            [ 1] 3522 	jreq input_exit 
      009279 00 0B            [ 1] 3523 	cp a,#TK_QSTR 
      00927B 26 08            [ 1] 3524 	jrne 1$ 
      00927B 5F C6 00         [ 4] 3525 	call puts 
      00927E 0B 14            [ 1] 3526 	cpl (SKIP,sp)
      009280 05 4D 27         [ 4] 3527 	call get_token 
      009283 05 5C            [ 1] 3528 1$: cp a,#TK_VAR  
      009285 27 03            [ 1] 3529 	jreq 2$ 
      009285 20 02 1E         [ 2] 3530 	jp syntax_error
      009288 03 0E 7D         [ 4] 3531 2$:	call dpush 
      009289 0D 06            [ 1] 3532 	tnz (SKIP,sp)
      009289 A6 0A            [ 1] 3533 	jrne 21$ 
      00928B A6 3A            [ 1] 3534 	ld a,#':
      00928B 5B 05 81         [ 1] 3535 	ld pad+1,a 
      00928E 72 5F 17 1A      [ 1] 3536 	clr pad+2
      00928E C6 00 08         [ 2] 3537 	ldw x,#pad 
      009291 88 CD 8F         [ 4] 3538 	call puts   
      0013DB                       3539 21$:
      009294 8B CD 8F         [ 4] 3540 	call save_context 
      009297 BE 84 C7         [ 2] 3541 	ldw x,#tib 
      00929A 00 08 4F         [ 2] 3542 	ldw basicptr,x  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      00929D 81 5F 00 02      [ 1] 3543 	clr count  
      00929E CD 09 3D         [ 4] 3544 	call readln 
      00929E 35 10 00 08      [ 1] 3545 	clr in 
      0092A2 81 11 B7         [ 4] 3546 	call relation 
      0092A3 A1 0A            [ 1] 3547 	cp a,#TK_INTGR
      0092A3 35 0A            [ 1] 3548 	jreq 3$ 
      0092A5 00 08 81         [ 2] 3549 	jp syntax_error
      0092A8 CD 0E 7D         [ 4] 3550 3$: call dpush 
      0092A8 AE 16 C8         [ 4] 3551 	call store 
      0092AB 72 B0 00         [ 4] 3552 	call rest_context
      0092AE 1E A6 0A         [ 4] 3553 	call get_token 
      0092B1 81 08            [ 1] 3554 	cp a,#TK_COMMA 
      0092B2 26 02            [ 1] 3555 	jrne 4$
      0092B2 AE 16            [ 2] 3556 	jra input_loop 
      0092B4 C8 72 B0         [ 4] 3557 4$:	call unget_token 
      00140E                       3558 input_exit:
      00140E                       3559 	_drop VSIZE 
      0092B7 00 1E            [ 2]    1     addw sp,#VSIZE 
      0092B9 54               [ 4] 3560 	ret 
                                   3561 
                                   3562 
                                   3563 ;---------------------
                                   3564 ; BASIC: REMARK | ' 
                                   3565 ; begin a comment 
                                   3566 ; comment are ignored 
                                   3567 ; use ' insted of REM 
                                   3568 ; This is never called
                                   3569 ; because get_token 
                                   3570 ; take care of skipping
                                   3571 ; comment. but required
                                   3572 ; for future use of 
                                   3573 ; keyword reverse search.  
                                   3574 ;---------------------- 
      001411                       3575 rem: 
      0092BA CF               [ 4] 3576 	ret 
                                   3577 
                                   3578 ;---------------------
                                   3579 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3580 ; read in loop 'addr'  
                                   3581 ; apply & 'mask' to value 
                                   3582 ; loop while result==0.  
                                   3583 ; if 'xor_mask' given 
                                   3584 ; apply ^ in second  
                                   3585 ; loop while result==0 
                                   3586 ;---------------------
                           000001  3587 	XMASK=1 
                           000002  3588 	MASK=2
                           000003  3589 	ADDR=3
                           000004  3590 	VSIZE=4
      001412                       3591 wait: 
      001412                       3592 	_vars VSIZE
      0092BB 00 23            [ 2]    1     sub sp,#VSIZE 
      0092BD A6 0A            [ 1] 3593 	clr (XMASK,sp) 
      0092BF 81 10 7B         [ 4] 3594 	call arg_list 
      0092C0 A1 02            [ 1] 3595 	cp a,#2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



      0092C0 CD 8C            [ 1] 3596 	jruge 0$
      0092C2 67 A1 02         [ 2] 3597 	jp syntax_error 
      0092C5 27 03            [ 1] 3598 0$:	cp a,#3
      0092C7 CC 86            [ 1] 3599 	jrult 1$
      0092C9 7C 0E 8A         [ 4] 3600 	call dpop 
      0092CA 9F               [ 1] 3601 	ld a,xl
      0092CA CD 8E            [ 1] 3602 	ld (XMASK,sp),a 
      0092CC FD CD 8C         [ 4] 3603 1$: call dpop ; mask 
      0092CF 67               [ 1] 3604 	ld a,xl 
      0092D0 A1 32            [ 1] 3605 	ld (MASK,sp),a 
      0092D2 27 03 CC         [ 4] 3606 	call dpop ; address 
      0092D5 86               [ 1] 3607 2$:	ld a,(x)
      0092D6 7C 02            [ 1] 3608 	and a,(MASK,sp)
      0092D7 18 01            [ 1] 3609 	xor a,(XMASK,sp)
      0092D7 CD 92            [ 1] 3610 	jreq 2$ 
      00143A                       3611 	_drop VSIZE 
      0092D9 37 A1            [ 2]    1     addw sp,#VSIZE 
      0092DB 0A               [ 4] 3612 	ret 
                                   3613 
                                   3614 ;---------------------
                                   3615 ; BASIC: BSET addr,mask
                                   3616 ; set bits at 'addr' corresponding 
                                   3617 ; to those of 'mask' that are at 1.
                                   3618 ; arguments:
                                   3619 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3620 ;   mask        mask|addr
                                   3621 ; output:
                                   3622 ;	none 
                                   3623 ;--------------------------
      00143D                       3624 bit_set:
      0092DC 27 03 CC         [ 4] 3625 	call arg_list 
      0092DF 86 7C            [ 1] 3626 	cp a,#2	 
      0092E1 27 03            [ 1] 3627 	jreq 1$ 
      0092E1 90 93 CD         [ 2] 3628 	jp syntax_error
      0092E4 8F 0A FF         [ 4] 3629 1$: call dpop ; mask 
      0092E7 81               [ 1] 3630 	ld a,xl 
      0092E8 CD 0E 8A         [ 4] 3631 	call dpop ; addr  
      0092E8 52               [ 1] 3632 	or a,(x)
      0092E9 06               [ 1] 3633 	ld (x),a 
      0092EA CE               [ 4] 3634 	ret 
                                   3635 
                                   3636 ;---------------------
                                   3637 ; BASIC: BRES addr,mask
                                   3638 ; reset bits at 'addr' corresponding 
                                   3639 ; to those of 'mask' that are at 1.
                                   3640 ; arguments:
                                   3641 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3642 ;   mask	    ~mask&*addr  
                                   3643 ; output:
                                   3644 ;	none 
                                   3645 ;--------------------------
      001451                       3646 bit_reset:
      0092EB 00 1C C3         [ 4] 3647 	call arg_list 
      0092EE 00 1E            [ 1] 3648 	cp a,#2  
      0092F0 2B 03            [ 1] 3649 	jreq 1$ 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      0092F2 CC 93 6B         [ 2] 3650 	jp syntax_error
      00145B                       3651 1$: 
      0092F5 1F 05 FE         [ 4] 3652 	call dpop ; mask 
      0092F8 1F               [ 1] 3653 	ld a,xl 
      0092F9 01               [ 1] 3654 	cpl a 
      0092FA AE 7F FF         [ 4] 3655 	call dpop ; addr  
      0092FD 1F               [ 1] 3656 	and a,(x)
      0092FE 03               [ 1] 3657 	ld (x),a 
      0092FF CD               [ 4] 3658 	ret 
                                   3659 
                                   3660 ;---------------------
                                   3661 ; BASIC: BRES addr,mask
                                   3662 ; toggle bits at 'addr' corresponding 
                                   3663 ; to those of 'mask' that are at 1.
                                   3664 ; arguments:
                                   3665 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3666 ;   mask	    mask^*addr  
                                   3667 ; output:
                                   3668 ;	none 
                                   3669 ;--------------------------
      001466                       3670 bit_toggle:
      009300 90 FB 4D         [ 4] 3671 	call arg_list 
      009303 27 3F            [ 1] 3672 	cp a,#2 
      009305 A1 02            [ 1] 3673 	jreq 1$ 
      009307 27 07 A1         [ 2] 3674 	jp syntax_error
      00930A 01 27 06         [ 4] 3675 1$: call dpop ; mask 
      00930D CC               [ 1] 3676 	ld a,xl 
      00930E 86 7C CD         [ 4] 3677 	call dpop ; addr  
      009311 8F               [ 1] 3678 	xor a,(x)
      009312 17               [ 1] 3679 	ld (x),a 
      009313 81               [ 4] 3680 	ret 
                                   3681 
                                   3682 
                                   3683 ;--------------------
                                   3684 ; BASIC: POKE addr,byte
                                   3685 ; put a byte at addr 
                                   3686 ;--------------------
      00147A                       3687 poke:
      009313 CD 8F 0A         [ 4] 3688 	call arg_list 
      009316 1F 01            [ 1] 3689 	cp a,#2
      009318 A1 01            [ 1] 3690 	jreq 1$
      00931A 27 05 FC         [ 2] 3691 	jp syntax_error
      00931C                       3692 1$:	
      00931C CD 8F 0A         [ 4] 3693 	call dpop 
      00931F 1F               [ 1] 3694     ld a,xl 
      009320 03 0E 8A         [ 4] 3695 	call dpop 
      009321 F7               [ 1] 3696 	ld (x),a 
      009321 CE               [ 4] 3697 	ret 
                                   3698 
                                   3699 ;-----------------------
                                   3700 ; BASIC: PEEK(addr)
                                   3701 ; get the byte at addr 
                                   3702 ; input:
                                   3703 ;	none 
                                   3704 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



                                   3705 ;	X 		value 
                                   3706 ;-----------------------
      00148D                       3707 peek:
      009322 00 1C            [ 1] 3708 	ld a,#TK_LPAREN 
      009324 1F 05 C3         [ 4] 3709 	call expect 
      009327 00 1E 2A         [ 4] 3710 	call arg_list
      00932A 40 FE            [ 1] 3711 	cp a,#1 
      00932C 13 01            [ 1] 3712 	jreq 1$
      00932E 2A 14 1E         [ 2] 3713 	jp syntax_error
      009331 05 1C            [ 1] 3714 1$:	ld a,#TK_RPAREN 
      009333 00 02 F6         [ 4] 3715 	call expect 
      009336 5C C7 00         [ 4] 3716 	call dpop 
      009339 0B               [ 1] 3717 	ld a,(x)
      00933A 72               [ 1] 3718 	clrw x 
      00933B 5F               [ 1] 3719 	ld xl,a 
      00933C 00 0A            [ 1] 3720 	ld a,#TK_INTGR
      00933E 72               [ 4] 3721 	ret 
                                   3722 
      0014AA                       3723 if: 
      00933F BB 00 0A         [ 4] 3724 	call relation 
      009342 20 E0            [ 1] 3725 	cp a,#TK_INTGR
      009344 27 03            [ 1] 3726 	jreq 1$ 
      009344 1E 05 FC         [ 2] 3727 	jp syntax_error
      009346 4F               [ 1] 3728 1$:	clr a 
      009346 CD               [ 2] 3729 	tnzw x 
      009347 93 6E            [ 1] 3730 	jrne 9$  
                                   3731 ;skip to next line
      009349 1E 05 1C 00 02   [ 1] 3732 	mov in,count
      00934E F6               [ 4] 3733 9$:	ret 
                                   3734 
                                   3735 ;------------------------
                                   3736 ; BASIC: FOR var=expr 
                                   3737 ; set variable to expression 
                                   3738 ; leave variable address 
                                   3739 ; on dstack and set
                                   3740 ; FFOR bit in 'flags'
                                   3741 ;-----------------
                           000001  3742 	RETL1=1
                           000003  3743 	INW=3
                           000005  3744 	BPTR=5
      0014BE                       3745 for: ; { -- var_addr }
      00934F 5C C7            [ 1] 3746 	ld a,#TK_VAR 
      009351 00 0B 72         [ 4] 3747 	call expect
      009354 5F 00 0A         [ 4] 3748 	call dpush 
      009357 72 BB 00         [ 4] 3749 	call let02 
      00935A 0A C3 00 1E      [ 1] 3750 	bset flags,#FFOR 
                                   3751 ; open space on cstack for BPTR and INW 
      00935E 2A               [ 2] 3752 	popw x ; call return address 
      0014CE                       3753 	_vars 4
      00935F 0B 1F            [ 2]    1     sub sp,#4 
      009361 05               [ 2] 3754 	pushw x  ; RETL1 
      009362 FE               [ 1] 3755 	clrw x 
      009363 13 03            [ 2] 3756 	ldw (BPTR,sp),x 
      009365 2C 04            [ 2] 3757 	ldw (INW,sp),x 
      009367 1E 05 20         [ 4] 3758 	call get_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



      00936A DB 07            [ 1] 3759 	cp a,#TK_CMD 
      00936B 27 03            [ 1] 3760 	jreq 1$
      00936B 5B 06 81         [ 2] 3761 	jp syntax_error
      00936E                       3762 1$:  
      00936E 89 FE CF         [ 2] 3763 	cpw x,#to 
      009371 00 0A            [ 1] 3764 	jreq to
      009373 72 5F 00         [ 2] 3765 	jp syntax_error 
                                   3766 
                                   3767 ;-----------------------------------
                                   3768 ; BASIC: TO expr 
                                   3769 ; second part of FOR loop initilization
                                   3770 ; leave limit on dstack and set 
                                   3771 ; FTO bit in 'flags'
                                   3772 ;-----------------------------------
      0014E8                       3773 to: ; { var_addr -- var_addr limit step }
      009376 09 AE 00 05 A6   [ 2] 3774 	btjt flags,#FFOR,1$
      00937B 0A CD 88         [ 2] 3775 	jp syntax_error
      00937E 87 85 1C         [ 4] 3776 1$: call relation  
      009381 00 03            [ 1] 3777 	cp a,#TK_INTGR 
      009383 CD 82            [ 1] 3778 	jreq 2$ 
      009385 30 A6 0D         [ 2] 3779 	jp syntax_error
      009388 CD 82 1E         [ 4] 3780 2$: call dpush ; limit
      00938B 81 00 00         [ 2] 3781 	ldw x,in.w 
      00938C CD 0B E7         [ 4] 3782 	call get_token
      00938C 4B 00            [ 1] 3783 	cp a,#TK_NONE  
      00938E 27 0C            [ 1] 3784 	jreq 4$ 
      00938E 0F 01            [ 1] 3785 	cp a,#TK_CMD
      009390 26 05            [ 1] 3786 	jrne 3$
      009390 CD 92 37         [ 2] 3787 	cpw x,#step 
      009393 A1 01            [ 1] 3788 	jreq step
      001510                       3789 3$:	
      009395 27 50 A1         [ 4] 3790 	call unget_token   	 
      001513                       3791 4$:	
      009398 0A 26 05         [ 2] 3792 	ldw x,#1   ; default step  
      00939B CD 88            [ 2] 3793 	jra store_loop_addr 
                                   3794 
                                   3795 
                                   3796 ;----------------------------------
                                   3797 ; BASIC: STEP expr 
                                   3798 ; optional third par of FOR loop
                                   3799 ; initialization. 	
                                   3800 ;------------------------------------
      001518                       3801 step: ; {var limit -- var limit step}
      00939D CF 20 EE 24 03   [ 2] 3802 	btjt flags,#FFOR,1$
      0093A0 CC 05 FC         [ 2] 3803 	jp syntax_error
      0093A0 CD 8C 67         [ 4] 3804 1$: call relation
      0093A3 A1 00            [ 1] 3805 	cp a,#TK_INTGR
      0093A5 27 40            [ 1] 3806 	jreq store_loop_addr  
      0093A7 A1 06 26         [ 2] 3807 	jp syntax_error
                                   3808 ; leave loop back entry point on cstack 
                                   3809 ; cstack is 2 call deep from interp_loop
      00152A                       3810 store_loop_addr:
      0093AA 05 CD 82         [ 4] 3811 	call dpush 
      0093AD 30 20 DE         [ 2] 3812 	ldw x,basicptr  
      0093B0 A1 0B            [ 2] 3813 	ldw (BPTR,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



      0093B2 26 06 9F         [ 2] 3814 	ldw x,in.w 
      0093B5 CD 82            [ 2] 3815 	ldw (INW,sp),x   
      0093B7 1E 20 D4 24      [ 1] 3816 	bres flags,#FFOR 
      0093BA 72 5C 00 1F      [ 1] 3817 	inc loop_depth 
      0093BA A1               [ 4] 3818 	ret 
                                   3819 
                                   3820 ;--------------------------------
                                   3821 ; BASIC: NEXT var 
                                   3822 ; FOR loop control 
                                   3823 ; increment variable with step 
                                   3824 ; and compare with limit 
                                   3825 ; loop if threshold not crossed.
                                   3826 ; else clean both stacks. 
                                   3827 ; and decrement 'loop_depth' 
                                   3828 ;--------------------------------
      001540                       3829 next: ; {var limit step -- [var limit step ] }
      0093BB 0C 26 06 FD      [ 1] 3830 	tnz loop_depth 
      0093BF CD 88            [ 1] 3831 	jrne 1$ 
      0093C1 CF 20 CA         [ 2] 3832 	jp syntax_error 
      0093C4                       3833 1$: 
      0093C4 A1 08            [ 1] 3834 	ld a,#TK_VAR 
      0093C6 26 05 03         [ 4] 3835 	call expect
                                   3836 ; check for good variable after NEXT 	 
      0093C9 01 CC            [ 1] 3837 	ldw y,x 
      0093CB 93 90 04         [ 2] 3838 	ldw x,#4  
      0093CD 72 D3 00 19      [ 4] 3839 	cpw y,([dstkptr],x) ; compare variables address 
      0093CD A1 09            [ 1] 3840 	jreq 2$  
      0093CF 26 13 CD         [ 2] 3841 	jp syntax_error ; not the good one 
      00155C                       3842 2$: ; increment variable 
      0093D2 8C               [ 1] 3843 	ldw x,y
      0093D3 67               [ 2] 3844 	ldw x,(x)  ; get var value 
      0093D4 A1 0A 27         [ 2] 3845 	ldw acc16,x 
      0093D7 03 CC 86 7C      [ 5] 3846 	ldw x,[dstkptr] ; step
      0093DB 72 BB 00 09      [ 2] 3847 	addw x,acc16 ; var+step 
      0093DB 9F A4            [ 2] 3848 	ldw (y),x ; save var new value 
                                   3849 ; compare with limit 
      0093DD 0F C7            [ 1] 3850 	ldw y,x 
      0093DF 00 26 CC 93      [ 5] 3851 	ldw x,[dstkptr] ; step in x 
      0093E3 8E               [ 2] 3852 	tnzw x  
      0093E4 2A 0B            [ 1] 3853 	jrpl 4$ ; positive step 
                                   3854 ;negative step 
      0093E4 CD 8E F6         [ 2] 3855 	ldw x,#2
      0093E7 72 D3 00 19      [ 4] 3856 	cpw y,([dstkptr],x)
      0093E7 0D 01            [ 1] 3857 	jrslt loop_done
      0093E9 26 05            [ 2] 3858 	jra loop_back 
      00157F                       3859 4$: ; positive step
      0093EB A6 0D CD         [ 2] 3860 	ldw x,#2 
      0093EE 82 1E 5B 01      [ 4] 3861 	cpw y,([dstkptr],x)
      0093F2 81 1B            [ 1] 3862 	jrsgt loop_done
      0093F3                       3863 loop_back:
      0093F3 CE 00            [ 2] 3864 	ldw x,(BPTR,sp)
      0093F5 04 1F 03         [ 2] 3865 	ldw basicptr,x 
      0093F8 CE 00 06 1F 05   [ 2] 3866 	btjf flags,#FRUN,1$ 
      0093FD C6 00            [ 1] 3867 	ld a,(2,x)
      0093FF 02 6B            [ 1] 3868 	add a,#2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009401 07 C6 00         [ 1] 3869 	ld count,a
      009404 03               [ 2] 3870 	ldw x,(x)
      009405 6B 08 81         [ 2] 3871 	ldw lineno,x
      009408 1E 03            [ 2] 3872 1$:	ldw x,(INW,sp)
      009408 1E 03 CF         [ 2] 3873 	ldw in.w,x 
      00940B 00               [ 4] 3874 	ret 
      0015A3                       3875 loop_done:
                                   3876 	; remove var limit step on dstack 
      00940C 04 1E 05         [ 2] 3877 	ldw x,dstkptr 
      00940F CF 00 06         [ 2] 3878 	addw x,#3*CELL_SIZE
      009412 7B 07 C7         [ 2] 3879 	ldw dstkptr,x 
                                   3880 	; remove 2 return address on cstack 
      009415 00               [ 2] 3881 	popw x
      0015AD                       3882 	_drop 4
      009416 02 7B            [ 2]    1     addw sp,#4 
      009418 08               [ 2] 3883 	pushw x 
      009419 C7 00 03 81      [ 1] 3884 	dec loop_depth 
      00941D 81               [ 4] 3885 	ret 
                                   3886 
                                   3887 
                                   3888 ;------------------------
                                   3889 ; BASIC: GOTO lineno 
                                   3890 ; jump to lineno 
                                   3891 ; here cstack is 2 call deep from interp_loop 
                                   3892 ;------------------------
      0015B5                       3893 goto:
      00941D 72 00 00 25 05   [ 2] 3894 	btjt flags,#FRUN,0$ 
      009422 A6 06            [ 1] 3895 	ld a,#ERR_RUN_ONLY
      009424 CC 86 7E         [ 2] 3896 	jp tb_error 
      009427 52               [ 4] 3897 	ret 
      009428 07 23            [ 2] 3898 0$:	jra go_common
                                   3899 
                                   3900 ;--------------------
                                   3901 ; BASIC: GOSUB lineno
                                   3902 ; basic subroutine call
                                   3903 ; actual lineno and basicptr 
                                   3904 ; are saved on cstack
                                   3905 ; here cstack is 2 call deep from interp_loop 
                                   3906 ;--------------------
                           000003  3907 	GOS_RET=3
      009429                       3908 gosub:
      009429 0F 06 CD 8C 67   [ 2] 3909 	btjt flags,#FRUN,0$ 
      00942E A1 00            [ 1] 3910 	ld a,#ERR_RUN_ONLY
      009430 27 5C A1         [ 2] 3911 	jp tb_error 
      009433 06               [ 4] 3912 	ret 
      009434 26               [ 2] 3913 0$:	popw x 
      009435 08 CD            [ 2] 3914 	sub sp,#2 
      009437 82               [ 2] 3915 	pushw x 
      009438 30 03 06         [ 2] 3916 	ldw x,basicptr
      00943B CD 8C            [ 1] 3917 	ld a,(2,x)
      00943D 67 A1            [ 1] 3918 	add a,#3 
      00943F 02 27 03         [ 1] 3919 	ld acc8,a 
      009442 CC 86 7C CD      [ 1] 3920 	clr acc16 
      009446 8E FD 0D 06      [ 2] 3921 	addw x,acc16
      00944A 26 0F            [ 2] 3922 	ldw (GOS_RET,sp),x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



      0015E5                       3923 go_common: 
      00944C A6 3A C7         [ 4] 3924 	call relation 
      00944F 17 19            [ 1] 3925 	cp a,#TK_INTGR
      009451 72 5F            [ 1] 3926 	jreq 1$ 
      009453 17 1A AE         [ 2] 3927 	jp syntax_error
      0015EF                       3928 1$: 
      009456 17 18 CD         [ 4] 3929 	call search_lineno  
      009459 82               [ 2] 3930 	tnzw x 
      00945A 30 05            [ 1] 3931 	jrne 2$ 
      00945B A6 05            [ 1] 3932 	ld a,#ERR_NO_LINE 
      00945B CD 93 F3         [ 2] 3933 	jp tb_error 
      0015FA                       3934 2$: 
      00945E AE 16 C8         [ 2] 3935 	ldw basicptr,x 
      009461 CF 00            [ 1] 3936 	ld a,(2,x)
      009463 04 72            [ 1] 3937 	add a,#3 
      009465 5F 00 03         [ 1] 3938 	ld count,a 
      009468 CD               [ 2] 3939 	ldw x,(x)
      009469 89 BD 72         [ 2] 3940 	ldw lineno,x 
      00946C 5F 00 02 CD      [ 1] 3941 	mov in,#3 
      009470 92               [ 4] 3942 	ret 
                                   3943 
                                   3944 ;------------------------
                                   3945 ; BASIC: RETURN 
                                   3946 ; exit from a subroutine 
                                   3947 ; cstack is 2 level deep from interp_loop 
                                   3948 ;------------------------
      00160D                       3949 return:
      009471 37 A1 0A 27 03   [ 2] 3950 	btjt flags,#FRUN,0$ 
      009476 CC 86            [ 1] 3951 	ld a,#ERR_RUN_ONLY
      009478 7C CD 8E         [ 2] 3952 	jp tb_error 
      001617                       3953 0$:	
      00947B FD CD            [ 2] 3954 	ldw x,(GOS_RET,sp) 
      00947D 8F 64 CD         [ 2] 3955 	ldw basicptr,x 
      009480 94 08            [ 1] 3956 	ld a,(2,x)
      009482 CD 8C            [ 1] 3957 	add a,#3 
      009484 67 A1 08         [ 1] 3958 	ld count,a 
      009487 26 02 20 9E      [ 1] 3959 	mov in,#3
      00948B CD               [ 2] 3960 	ldw x,(x)
      00948C 8E F6 05         [ 2] 3961 	ldw lineno,x 
      00948E 4F               [ 1] 3962 	clr a 
      00948E 5B               [ 2] 3963 	popw x 
      00162D                       3964 	_drop 2
      00948F 07 81            [ 2]    1     addw sp,#2 
      009491 89               [ 2] 3965 	pushw x
      009491 81               [ 4] 3966 	ret  
                                   3967 
                                   3968 
                                   3969 ;----------------------------------
                                   3970 ; BASIC: RUN
                                   3971 ; run BASIC program in RAM
                                   3972 ;----------------------------------- 
      009492                       3973 run: 
      009492 52 04 0F 01 CD   [ 2] 3974 	btjf flags,#FRUN,0$  
      009497 90               [ 1] 3975 	clr a 
      009498 FB               [ 4] 3976 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      001638                       3977 0$: 
      009499 A1 02 24 03 CC   [ 2] 3978 	btjf flags,#FBREAK,1$
      00163D                       3979 	_drop 2 
      00949E 86 7C            [ 2]    1     addw sp,#2 
      0094A0 A1 03 25         [ 4] 3980 	call rest_context
      001642                       3981 	_drop CTXT_SIZE 
      0094A3 06 CD            [ 2]    1     addw sp,#CTXT_SIZE 
      0094A5 8F 0A 9F 6B      [ 1] 3982 	bres flags,#FBREAK 
      0094A9 01 CD 8F 0A      [ 1] 3983 	bset flags,#FRUN 
      0094AD 9F 6B 02         [ 2] 3984 	jp interp_loop 
      0094B0 CD 8F 0A         [ 2] 3985 1$:	ldw x,txtbgn
      0094B3 F6 14 02         [ 2] 3986 	cpw x,txtend 
      0094B6 18 01            [ 1] 3987 	jrmi 2$ 
      0094B8 27               [ 1] 3988 	clr a 
      0094B9 F9               [ 4] 3989 	ret 
      0094BA 5B 04 81         [ 4] 3990 2$: call ubound 
      0094BD                       3991 	_drop 2 
      0094BD CD 90            [ 2]    1     addw sp,#2 
      0094BF FB A1 02         [ 2] 3992 	ldw x,txtbgn 
      0094C2 27 03 CC         [ 2] 3993 	ldw basicptr,x 
      0094C5 86 7C            [ 1] 3994 	ld a,(2,x)
      0094C7 CD 8F            [ 1] 3995 	add a,#2 ; consider that in start at 3  
      0094C9 0A 9F CD         [ 1] 3996 	ld count,a
      0094CC 8F               [ 2] 3997 	ldw x,(x)
      0094CD 0A FA F7         [ 2] 3998 	ldw lineno,x
      0094D0 81 03 00 01      [ 1] 3999 	mov in,#3	
      0094D1 72 10 00 24      [ 1] 4000 	bset flags,#FRUN 
      0094D1 CD 90 FB         [ 2] 4001 	jp interp_loop 
                                   4002 
                                   4003 
                                   4004 ;----------------------
                                   4005 ; BASIC: STOP 
                                   4006 ; stop running program
                                   4007 ;---------------------- 
      00167A                       4008 stop: 
                                   4009 ; clean dstack and cstack 
      0094D4 A1 02 27         [ 2] 4010 	ldw x,#STACK_EMPTY 
      0094D7 03               [ 1] 4011 	ldw sp,x 
      0094D8 CC 86 7C 24      [ 1] 4012 	bres flags,#FRUN 
      0094DB 72 19 00 24      [ 1] 4013 	bres flags,#FBREAK
      0094DB CD 8F 0A         [ 2] 4014 	jp warm_start
                                   4015 
                                   4016 ;-----------------------
                                   4017 ; BASIC: BREAK 
                                   4018 ; insert a breakpoint 
                                   4019 ; in pogram. 
                                   4020 ; the program is resumed
                                   4021 ; with RUN 
                                   4022 ;-------------------------
      001689                       4023 break:
      0094DE 9F 43 CD 8F 0A   [ 2] 4024 	btjt flags,#FRUN,2$
      0094E3 F4               [ 1] 4025 	clr a
      0094E4 F7               [ 4] 4026 	ret 
      001690                       4027 2$:	 
                                   4028 ; create space on cstack to save context 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      0094E5 81 16 BA         [ 2] 4029 	ldw x,#break_point 
      0094E6 CD 01 B0         [ 4] 4030 	call puts 
      001696                       4031 	_drop 2 ;drop return address 
      0094E6 CD 90            [ 2]    1     addw sp,#2 
      001698                       4032 	_vars CTXT_SIZE ; context size 
      0094E8 FB A1            [ 2]    1     sub sp,#CTXT_SIZE 
      0094EA 02 27 03         [ 4] 4033 	call save_context 
      0094ED CC 86 7C         [ 2] 4034 	ldw x,#tib 
      0094F0 CD 8F 0A         [ 2] 4035 	ldw basicptr,x
      0094F3 9F               [ 1] 4036 	clr (x)
      0094F4 CD 8F 0A F8      [ 1] 4037 	clr count  
      0094F8 F7               [ 1] 4038 	clrw x 
      0094F9 81 00 05         [ 2] 4039 	ldw lineno,x 
      0094FA CF 00 00         [ 2] 4040 	ldw in.w,x
      0094FA CD 90 FB A1      [ 1] 4041 	bres flags,#FRUN 
      0094FE 02 27 03 CC      [ 1] 4042 	bset flags,#FBREAK
      009502 86 7C BE         [ 2] 4043 	jp interp_loop 
      009504 0A 62 72 65 61 6B 20  4044 break_point: .asciz "\nbreak point, RUN to resume.\n"
             70 6F 69 6E 74 2C 20
             52 55 4E 20 74 6F 20
             72 65 73 75 6D 65 2E
             0A 00
                                   4045 
                                   4046 ;-----------------------
                                   4047 ; BASIC: NEW
                                   4048 ; from command line only 
                                   4049 ; free program memory
                                   4050 ; and clear variables 
                                   4051 ;------------------------
      0016D8                       4052 new: 
      009504 CD 8F 0A 9F CD   [ 2] 4053 	btjf flags,#FRUN,0$ 
      009509 8F               [ 1] 4054 	clr a 
      00950A 0A               [ 4] 4055 	ret 
      0016DF                       4056 0$:	
      00950B F7 81 DA         [ 4] 4057 	call clear_basic 
      00950D 81               [ 4] 4058 	ret 
                                   4059 	 
                                   4060 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4061 ;   file system routines
                                   4062 ;;;;;;;;;;;;;;;;;;;;;;;;;
                                   4063 
                                   4064 ;--------------------
                                   4065 ; input:
                                   4066 ;   X     increment 
                                   4067 ; output:
                                   4068 ;   farptr  incremented 
                                   4069 ;---------------------
      0016E3                       4070 incr_farptr:
      00950D A6 04 CD 90      [ 2] 4071 	addw x,farptr+1 
      009511 EE CD            [ 1] 4072 	jrnc 1$
      009513 90 FB A1 01      [ 1] 4073 	inc farptr 
      009517 27 03 CC         [ 2] 4074 1$:	ldw farptr+1,x  
      00951A 86               [ 4] 4075 	ret 
                                   4076 
                                   4077 ;------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4078 ; extended flash memory used as FLASH_DRIVE 
                                   4079 ; seek end of used flash drive   
                                   4080 ; starting at 0x10000 address.
                                   4081 ; 4 consecutives 0 bytes signal free space. 
                                   4082 ; input:
                                   4083 ;	none
                                   4084 ; output:
                                   4085 ;   ffree     free_addr| 0 if memory full.
                                   4086 ;------------------------------
      0016F1                       4087 seek_fdrive:
      00951B 7C A6            [ 1] 4088 	ld a,#1
      00951D 05 CD 90         [ 1] 4089 	ld farptr,a 
      009520 EE               [ 1] 4090 	clrw x 
      009521 CD 8F 0A         [ 2] 4091 	ldw farptr+1,x 
      0016FA                       4092 1$:
      009524 F6               [ 1] 4093 	clrw x 
      009525 5F 97 A6 0A      [ 5] 4094 	ldf a,([farptr],x) 
      009529 81 15            [ 1] 4095 	jrne 2$
      00952A 5C               [ 1] 4096 	incw x 
      00952A CD 92 37 A1      [ 5] 4097 	ldf a,([farptr],x)
      00952E 0A 27            [ 1] 4098 	jrne 2$ 
      009530 03               [ 1] 4099 	incw x 
      009531 CC 86 7C 4F      [ 5] 4100 	ldf a,([farptr],x)
      009535 5D 26            [ 1] 4101 	jrne 2$ 
      009537 05               [ 1] 4102 	incw x 
      009538 55 00 03 00      [ 5] 4103 	ldf a,([farptr],x)
      00953C 02 81            [ 1] 4104 	jreq 4$ 
      00953E                       4105 2$: 
      00953E A6 02 CD         [ 2] 4106 	addw x,#1
      009541 90 EE CD         [ 4] 4107 	call incr_farptr
      009544 8E FD CD         [ 2] 4108 	ldw x,#0x27f 
      009547 92 CA 72         [ 2] 4109 	cpw x,farptr
      00954A 14 00            [ 1] 4110 	jrpl 1$
      00954C 25 85 52 04      [ 1] 4111 	clr ffree 
      009550 89 5F 1F 05      [ 1] 4112 	clr ffree+1 
      009554 1F 03 CD 8C      [ 1] 4113 	clr ffree+2 
      009558 67 A1 07 27      [ 1] 4114 	clr acc24 
      00955C 03 CC 86 7C      [ 1] 4115 	clr acc16
      009560 72 5F 00 0A      [ 1] 4116 	clr acc8 
      009560 A3 95            [ 2] 4117 	jra 5$
      00173E                       4118 4$: ; copy farptr to ffree	 
      009562 68 27 03         [ 2] 4119 	ldw x,farptr+1 
      009565 CC 86 7C         [ 2] 4120 	cpw x,#fdrive 
      009568 27 06            [ 1] 4121 	jreq 41$
                                   4122 	; there is a file, last 0 of that file must be skipped.
      009568 72 04 00         [ 2] 4123 	ldw x,#1
      00956B 25 03 CC         [ 4] 4124 	call incr_farptr
      00174C                       4125 41$: 
      00956E 86 7C CD         [ 2] 4126 	ldw x,farptr 
      009571 92 37 A1         [ 1] 4127 	ld a,farptr+2 
      009574 0A 27 03         [ 2] 4128 	ldw ffree,x 
      009577 CC 86 7C         [ 1] 4129 	ld ffree+2,a  
      00957A CD               [ 4] 4130 5$:	ret 
                                   4131 
                                   4132 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4133 ; compare file name 
                                   4134 ; with name pointed by Y  
                                   4135 ; input:
                                   4136 ;   farptr   file name 
                                   4137 ;   Y        target name 
                                   4138 ; output:
                                   4139 ;   farptr 	 at file_name
                                   4140 ;   X 		 farptr[x] point at size field  
                                   4141 ;   Carry    0|1 no match|match  
                                   4142 ;----------------------
      001759                       4143 cmp_name:
      00957B 8E               [ 1] 4144 	clrw x
      00957C FD CE 00 01      [ 5] 4145 1$:	ldf a,([farptr],x)
      009580 CD 8C            [ 1] 4146 	cp a,(y)
      009582 67 A1            [ 1] 4147 	jrne 4$
      009584 00               [ 1] 4148 	tnz a 
      009585 27 0C            [ 1] 4149 	jreq 9$ 
      009587 A1               [ 1] 4150     incw x 
      009588 07 26            [ 1] 4151 	incw y 
      00958A 05 A3            [ 2] 4152 	jra 1$
      00176A                       4153 4$: ;no match 
      00958C 95               [ 1] 4154 	tnz a 
      00958D 98 27            [ 1] 4155 	jreq 5$
      00958F 08               [ 1] 4156 	incw x 
      009590 92 AF 00 13      [ 5] 4157 	ldf a,([farptr],x)
      009590 CD 8E            [ 2] 4158 	jra 4$  
      009592 F6               [ 1] 4159 5$:	incw x ; farptr[x] point at 'size' field 
      009593 98               [ 1] 4160 	rcf 
      009593 AE               [ 4] 4161 	ret
      001777                       4162 9$: ; match  
      009594 00               [ 1] 4163 	incw x  ; farptr[x] at 'size' field 
      009595 01               [ 1] 4164 	scf 
      009596 20               [ 4] 4165 	ret 
                                   4166 
                                   4167 ;-----------------------
                                   4168 ; search file in 
                                   4169 ; flash memory 
                                   4170 ; input:
                                   4171 ;   Y       file name  
                                   4172 ; output:
                                   4173 ;   farptr  addr at name|0
                                   4174 ;-----------------------
                           000001  4175 	FSIZE=1
                           000003  4176 	YSAVE=3
                           000004  4177 	VSIZE=4 
      00177A                       4178 search_file: 
      00177A                       4179 	_vars VSIZE
      009597 12 04            [ 2]    1     sub sp,#VSIZE 
      009598 17 03            [ 2] 4180 	ldw (YSAVE,sp),y  
      009598 72               [ 1] 4181 	clrw x 
      009599 04 00 25         [ 2] 4182 	ldw farptr+1,x 
      00959C 03 CC 86 7C      [ 1] 4183 	mov farptr,#1
      001786                       4184 1$:	
                                   4185 ; check if farptr is after any file 
                                   4186 ; if  0 then so.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      0095A0 CD 92 37 A1      [ 5] 4187 	ldf a,[farptr]
      0095A4 0A 27            [ 1] 4188 	jreq 6$
      0095A6 03               [ 1] 4189 2$: clrw x 	
      0095A7 CC 86            [ 2] 4190 	ldw y,(YSAVE,sp) 
      0095A9 7C 17 59         [ 4] 4191 	call cmp_name
      0095AA 25 2C            [ 1] 4192 	jrc 9$
      0095AA CD 8E FD CE      [ 5] 4193 	ldf a,([farptr],x)
      0095AE 00 04            [ 1] 4194 	ld (FSIZE,sp),a 
      0095B0 1F               [ 1] 4195 	incw x 
      0095B1 05 CE 00 01      [ 5] 4196 	ldf a,([farptr],x)
      0095B5 1F 03            [ 1] 4197 	ld (FSIZE+1,sp),a 
      0095B7 72               [ 1] 4198 	incw x 
      0095B8 15 00 25         [ 2] 4199 	addw x,(FSIZE,sp) ; count to skip 
      0095BB 72 5C 00         [ 4] 4200 	call incr_farptr ; now at next file 'name_field'
      0095BE 20 81 80         [ 2] 4201 	ldw x,#0x280
      0095C0 C3 00 13         [ 2] 4202 	cpw x,farptr 
      0095C0 72 5D            [ 1] 4203 	jrpl 1$
      0017B0                       4204 6$: ; file not found 
      0095C2 00 20 26 03      [ 1] 4205 	clr farptr
      0095C6 CC 86 7C 14      [ 1] 4206 	clr farptr+1 
      0095C9 72 5F 00 15      [ 1] 4207 	clr farptr+2 
      0017BC                       4208 	_drop VSIZE 
      0095C9 A6 02            [ 2]    1     addw sp,#VSIZE 
      0095CB CD               [ 1] 4209 	rcf
      0095CC 90               [ 4] 4210 	ret
      0017C0                       4211 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      0017C0                       4212 	_drop VSIZE 
      0095CD EE 90            [ 2]    1     addw sp,#VSIZE 
      0095CF 93               [ 1] 4213 	scf 	
      0095D0 AE               [ 4] 4214 	ret
                                   4215 
                                   4216 ;--------------------------------
                                   4217 ; BASIC: SAVE "name" 
                                   4218 ; save text program in 
                                   4219 ; flash memory used as 
                                   4220 ;--------------------------------
      0017C4                       4221 save:
      0095D1 00 04 72 D3 00   [ 2] 4222 	btjf flags,#FRUN,0$ 
      0095D6 1A 27            [ 1] 4223 	ld a,#ERR_CMD_ONLY 
      0095D8 03 CC 86         [ 2] 4224 	jp tb_error
      0017CE                       4225 0$:	 
      0095DB 7C 00 1D         [ 2] 4226 	ldw x,txtend 
      0095DC 72 B0 00 1B      [ 2] 4227 	subw x,txtbgn
      0095DC 93 FE            [ 1] 4228 	jrne 10$
                                   4229 ; nothing to save 
      0095DE CF               [ 1] 4230 	clr a 
      0095DF 00               [ 4] 4231 	ret 
      0017D9                       4232 10$:	
      0095E0 0A 72 CE         [ 1] 4233 	ld a,ffree 
      0095E3 00 1A 72         [ 1] 4234 	or a,ffree+1
      0095E6 BB 00 0A         [ 1] 4235 	or a,ffree+2 
      0095E9 90 FF            [ 1] 4236 	jrne 1$
      0095EB 90 93            [ 1] 4237 	ld a,#ERR_MEM_FULL
      0095ED 72 CE 00         [ 2] 4238 	jp tb_error 
      0095F0 1A 5D 2A         [ 4] 4239 1$: call get_token	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0095F3 0B AE            [ 1] 4240 	cp a,#TK_QSTR
      0095F5 00 02            [ 1] 4241 	jreq 2$
      0095F7 72 D3 00         [ 2] 4242 	jp syntax_error
      0017F3                       4243 2$: ; check for existing file of that name 
      0095FA 1A 2F            [ 1] 4244 	ldw y,x ; file name pointer 
      0095FC 26 20 09         [ 4] 4245 	call search_file 
      0095FF 24 05            [ 1] 4246 	jrnc 3$ 
      0095FF AE 00            [ 1] 4247 	ld a,#ERR_DUPLICATE 
      009601 02 72 D3         [ 2] 4248 	jp tb_error 
      0017FF                       4249 3$:	;** write file name to flash **
      009604 00 1A 2C         [ 2] 4250 	ldw x,ffree 
      009607 1B 00 18         [ 1] 4251 	ld a,ffree+2 
      009608 CF 00 13         [ 2] 4252 	ldw farptr,x 
      009608 1E 05 CF         [ 1] 4253 	ld farptr+2,a 
      00960B 00 04 72         [ 2] 4254 	ldw x,#pad  
      00960E 01 00 25         [ 4] 4255 	call strlen 
      009611 0B               [ 1] 4256 	incw  x
      009612 E6               [ 2] 4257 	pushw x 
      009613 02               [ 1] 4258 	clrw x   
      009614 AB 02 C7 00      [ 2] 4259 	ldw y,#pad 
      009618 03 FE CF         [ 4] 4260 	call write_block  
      00181B                       4261 	_drop 2 ; drop pushed X 
      00961B 00 06            [ 2]    1     addw sp,#2 
                                   4262 ;** write file length after name **
      00961D 1E 03 CF         [ 2] 4263 	ldw x,txtend 
      009620 00 01 81 1B      [ 2] 4264 	subw x,txtbgn
      009623 89               [ 2] 4265 	pushw x ; file size 
      009623 CE               [ 1] 4266 	clrw x 
      009624 00 1A            [ 1] 4267 	ld a,(1,sp)
      009626 1C 00 06         [ 4] 4268 	call write_byte 
      009629 CF               [ 1] 4269 	incw x 
      00962A 00 1A            [ 1] 4270 	ld a,(2,sp)
      00962C 85 5B 04         [ 4] 4271 	call write_byte
      00962F 89               [ 1] 4272 	incw x  
      009630 72 5A 00         [ 4] 4273 	call incr_farptr ; move farptr after SIZE field 
                                   4274 ;** write BASIC text **
                                   4275 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009633 20 81            [ 2] 4276 	ldw x,(1,sp)
      009635 89               [ 2] 4277 	pushw x 
      009635 72               [ 1] 4278 	clrw x 
      009636 00 00 25 06      [ 2] 4279 	ldw y,txtbgn  ; BASIC text to save 
      00963A A6 06 CC         [ 4] 4280 	call write_block 
      001840                       4281 	_drop 2 ;  drop BSIZE argument
      00963D 86 7E            [ 2]    1     addw sp,#2 
                                   4282 ; save farptr in ffree
      00963F 81 20 23         [ 2] 4283 	ldw x,farptr 
      009642 C6 00 15         [ 1] 4284 	ld a,farptr+2 
      009642 72 00 00         [ 2] 4285 	ldw ffree,x 
      009645 25 06 A6         [ 1] 4286 	ld ffree+2,a
                                   4287 ; write 4 zero bytes as a safe gard 
      009648 06               [ 1] 4288     clrw x 
      009649 CC               [ 1] 4289 	clr a 
      00964A 86 7E 81         [ 4] 4290 	call write_byte 
      00964D 85               [ 1] 4291 	incw x 
      00964E 52               [ 1] 4292 	clr a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      00964F 02 89 CE         [ 4] 4293 	call write_byte
      009652 00               [ 1] 4294 	incw x 
      009653 04               [ 1] 4295 	clr a 
      009654 E6 02 AB         [ 4] 4296 	call write_byte
                                   4297 ; display saved size  
      009657 03               [ 2] 4298 	popw x ; first copy of BSIZE 
      009658 C7 00            [ 1] 4299 	ld a,#TK_INTGR 
      00965A 0B               [ 4] 4300 	ret 
                                   4301 
                                   4302 
                                   4303 ;------------------------
                                   4304 ; BASIC: LOAD "file" 
                                   4305 ; load file to RAM 
                                   4306 ; for execution 
                                   4307 ;------------------------
      001861                       4308 load:
      00965B 72 5F 00 0A 72   [ 2] 4309 	btjf flags,#FRUN,0$ 
      009660 BB 00            [ 1] 4310 	jreq 0$ 
      009662 0A 1F            [ 1] 4311 	ld a,#ERR_CMD_ONLY 
      009664 03 05 FE         [ 2] 4312 	jp tb_error 
      009665                       4313 0$:	
      009665 CD 92 37         [ 4] 4314 	call get_token 
      009668 A1 0A            [ 1] 4315 	cp a,#TK_QSTR
      00966A 27 03            [ 1] 4316 	jreq 1$
      00966C CC 86 7C         [ 2] 4317 	jp syntax_error 
      00966F                       4318 1$:	
      00966F CD 83            [ 1] 4319 	ldw y,x 
      009671 61 5D 26         [ 4] 4320 	call search_file 
      009674 05 A6            [ 1] 4321 	jrc 2$ 
      009676 05 CC            [ 1] 4322 	ld a,#ERR_NOT_FILE
      009678 86 7E FE         [ 2] 4323 	jp tb_error  
      00967A                       4324 2$:	
      00967A CF 00 04         [ 4] 4325 	call incr_farptr  
      00967D E6 02 AB         [ 4] 4326 	call clear_basic  
      009680 03               [ 1] 4327 	clrw x
      009681 C7 00 03 FE      [ 5] 4328 	ldf a,([farptr],x)
      009685 CF 00            [ 1] 4329 	ld yh,a 
      009687 06               [ 1] 4330 	incw x  
      009688 35 03 00 02      [ 5] 4331 	ldf a,([farptr],x)
      00968C 81               [ 1] 4332 	incw x 
      00968D 90 97            [ 1] 4333 	ld yl,a 
      00968D 72 00 00 25      [ 2] 4334 	addw y,txtbgn
      009691 05 A6 06 CC      [ 2] 4335 	ldw txtend,y
      009695 86 7E 00 1B      [ 2] 4336 	ldw y,txtbgn
      009697                       4337 3$:	; load BASIC text 	
      009697 1E 03 CF 00      [ 5] 4338 	ldf a,([farptr],x)
      00969B 04 E6            [ 1] 4339 	ld (y),a 
      00969D 02               [ 1] 4340 	incw x 
      00969E AB 03            [ 1] 4341 	incw y 
      0096A0 C7 00 03 35      [ 2] 4342 	cpw y,txtend 
      0096A4 03 00            [ 1] 4343 	jrmi 3$
                                   4344 ; return loaded size 	 
      0096A6 02 FE CF         [ 2] 4345 	ldw x,txtend 
      0096A9 00 06 4F 85      [ 2] 4346 	subw x,txtbgn
      0096AD 5B 02 89         [ 4] 4347 	call print_int 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      0096B0 81               [ 4] 4348 	ret 
                                   4349 
                                   4350 ;-----------------------------------
                                   4351 ; BASIC: FORGET ["file_name"] 
                                   4352 ; erase file_name and all others 
                                   4353 ; after it. 
                                   4354 ; without argument erase all files 
                                   4355 ;-----------------------------------
      0096B1                       4356 forget:
      0096B1 72 01 00         [ 4] 4357 	call get_token 
      0096B4 25 02            [ 1] 4358 	cp a,#TK_NONE 
      0096B6 4F 81            [ 1] 4359 	jreq 3$ 
      0096B8 A1 06            [ 1] 4360 	cp a,#TK_QSTR
      0096B8 72 09            [ 1] 4361 	jreq 1$
      0096BA 00 25 12         [ 2] 4362 	jp syntax_error
      0096BD 5B 02            [ 1] 4363 1$: ldw y,x
      0096BF CD 94 08         [ 4] 4364 	call search_file
      0096C2 5B 06            [ 1] 4365 	jrc 2$
      0096C4 72 19            [ 1] 4366 	ld a,#ERR_NOT_FILE 
      0096C6 00 25 72         [ 2] 4367 	jp tb_error 
      0018D8                       4368 2$: 
      0096C9 10 00 25         [ 2] 4369 	ldw x,farptr
      0096CC CC 87 3E         [ 1] 4370 	ld a,farptr+2
      0096CF CE 00            [ 2] 4371 	jra 4$ 
      0018E0                       4372 3$: ; forget all files 
      0096D1 1C C3 00         [ 2] 4373 	ldw x,#fdrive
      0096D4 1E               [ 1] 4374 	clr a 
      0096D5 2B               [ 1] 4375 	rrwa x 
      0096D6 02 4F 81         [ 2] 4376 	ldw farptr,x 
      0096D9 CD 92 B2         [ 1] 4377 	ld farptr+2,a 
      0018EB                       4378 4$:
      0096DC 5B 02 CE         [ 2] 4379 	ldw ffree,x 
      0096DF 00 1C CF         [ 1] 4380 	ld ffree+2,a 
      0096E2 00               [ 1] 4381 5$:	clrw x 
      0096E3 04               [ 1] 4382 	clr a  
      0096E4 E6 02 AB         [ 4] 4383 	call write_byte 
      0096E7 02 C7 00         [ 2] 4384 	ldw x,#1 
      0096EA 03 FE CF         [ 4] 4385 	call incr_farptr
      0096ED 00 06 35         [ 1] 4386 	ld a,farptr
      0096F0 03 00 02         [ 1] 4387 	cp a,ffree 
      0096F3 72 10            [ 1] 4388 	jrmi 5$ 
      0096F5 00 25 CC         [ 2] 4389 	ldw x,farptr+1 
      0096F8 87 3E 17         [ 2] 4390 	cpw x,ffree+1
      0096FA 2B E5            [ 1] 4391 	jrmi 5$
      0096FA AE               [ 4] 4392 	ret 
                                   4393 
                                   4394 ;----------------------
                                   4395 ; BASIC: DIR 
                                   4396 ; list saved files 
                                   4397 ;----------------------
                           000001  4398 	COUNT=1 ; files counter 
                           000002  4399 	VSIZE=2 
      00190D                       4400 directory:
      00190D                       4401 	_vars VSIZE 
      0096FB 17 FF            [ 2]    1     sub sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0096FD 94               [ 1] 4402 	clrw x 
      0096FE 72 11            [ 2] 4403 	ldw (COUNT,sp),x 
      009700 00 25 72         [ 2] 4404 	ldw farptr+1,x 
      009703 19 00 25 CC      [ 1] 4405 	mov farptr,#1 
      001919                       4406 dir_loop:
      009707 86               [ 1] 4407 	clrw x 
      009708 D8 AF 00 13      [ 5] 4408 	ldf a,([farptr],x)
      009709 27 38            [ 1] 4409 	jreq 8$ 
      001920                       4410 1$: ;name loop 	
      009709 72 00 00 25      [ 5] 4411 	ldf a,([farptr],x)
      00970D 02 4F            [ 1] 4412 	jreq 2$ 
      00970F 81 01 9E         [ 4] 4413 	call putc 
      009710 5C               [ 1] 4414 	incw x 
      009710 AE 97            [ 2] 4415 	jra 1$
      009712 3A               [ 1] 4416 2$: incw x ; skip ending 0. 
      009713 CD 82            [ 1] 4417 	ld a,#SPACE 
      009715 30 5B 02         [ 4] 4418 	call putc 
                                   4419 ; get file size 	
      009718 52 06 CD 93      [ 5] 4420 	ldf a,([farptr],x)
      00971C F3 AE            [ 1] 4421 	ld yh,a 
      00971E 16               [ 1] 4422 	incw x 
      00971F C8 CF 00 04      [ 5] 4423 	ldf a,([farptr],x)
      009723 7F               [ 1] 4424 	incw x 
      009724 72 5F            [ 1] 4425 	ld yl,a 
      009726 00 03            [ 2] 4426 	pushw y 
      009728 5F CF 00         [ 2] 4427 	addw x,(1,sp)
      00972B 06 CF 00         [ 4] 4428 	call incr_farptr 
      00972E 01               [ 2] 4429 	popw x ; file size 
      00972F 72 11 00         [ 4] 4430 	call print_int 
      009732 25 72            [ 1] 4431 	ld a,#CR 
      009734 18 00 25         [ 4] 4432 	call putc
      009737 CC 87            [ 2] 4433 	ldw x,(COUNT,sp)
      009739 3E               [ 1] 4434 	incw x
      00973A 0A 62            [ 2] 4435 	ldw (COUNT,sp),x  
      00973C 72 65            [ 2] 4436 	jra dir_loop 
      001958                       4437 8$: ; print number of files 
      00973E 61 6B            [ 2] 4438 	ldw x,(COUNT,sp)
      009740 20 70 6F         [ 4] 4439 	call print_int 
      009743 69 6E 74         [ 2] 4440 	ldw x,#file_count 
      009746 2C 20 52         [ 4] 4441 	call puts  
                                   4442 ; print drive free space 	
      009749 55 4E            [ 1] 4443 	ld a,#0xff 
      00974B 20 74 6F         [ 1] 4444 	sub a,ffree+2 
      00974E 20 72 65         [ 1] 4445 	ld acc8,a 
      009751 73 75            [ 1] 4446 	ld a,#0x7f 
      009753 6D 65 2E         [ 1] 4447 	sbc a,ffree+1 
      009756 0A 00 09         [ 1] 4448 	ld acc16,a 
      009758 A6 02            [ 1] 4449 	ld a,#2 
      009758 72 01 00         [ 1] 4450 	sbc a,ffree 
      00975B 25 02 4F         [ 1] 4451 	ld acc24,a 
      00975E 81               [ 1] 4452 	clrw x  
      00975F A6 06            [ 1] 4453 	ld a,#6 
      00975F CD               [ 1] 4454 	ld xl,a 
      009760 85 5A            [ 1] 4455 	ld a,#10 
      009762 81 08 07         [ 4] 4456 	call prti24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009763 AE 19 95         [ 2] 4457 	ldw x,#drive_free
      009763 72 BB 00         [ 4] 4458 	call puts 
      00198A                       4459 	_drop VSIZE 
      009766 15 24            [ 2]    1     addw sp,#VSIZE 
      009768 04               [ 4] 4460 	ret
      009769 72 5C 00 14 CF 00 15  4461 file_count: .asciz " files\n"
             81
      009771 20 62 79 74 65 73 20  4462 drive_free: .asciz " bytes free\n" 
             66 72 65 65 0A 00
                                   4463 
                                   4464 ;---------------------
                                   4465 ; BASIC: WRITE expr1,expr2[,expr]* 
                                   4466 ; write 1 or more byte to FLASH or EEPROM
                                   4467 ; starting at address  
                                   4468 ; input:
                                   4469 ;   expr1  	is address 
                                   4470 ;   expr2   is byte to write
                                   4471 ; output:
                                   4472 ;   none 
                                   4473 ;---------------------
                           000001  4474 	ADDR=1
                           000002  4475 	VSIZ=2 
      0019A2                       4476 write:
      0019A2                       4477 	_vars VSIZE 
      009771 A6 01            [ 2]    1     sub sp,#VSIZE 
      009773 C7 00 14 5F      [ 1] 4478 	clr farptr ; expect 16 bits address 
      009777 CF 00 15         [ 4] 4479 	call expression
      00977A A1 0A            [ 1] 4480 	cp a,#TK_INTGR 
      00977A 5F 92            [ 1] 4481 	jreq 0$
      00977C AF 00 14         [ 2] 4482 	jp syntax_error
      00977F 26 15            [ 2] 4483 0$: ldw (ADDR,sp),x 
      009781 5C 92 AF         [ 4] 4484 	call get_token 
      009784 00 14            [ 1] 4485 	cp a,#TK_COMMA 
      009786 26 0E            [ 1] 4486 	jreq 1$ 
      009788 5C 92            [ 2] 4487 	jra 9$ 
      00978A AF 00 14         [ 4] 4488 1$:	call expression
      00978D 26 07            [ 1] 4489 	cp a,#TK_INTGR
      00978F 5C 92            [ 1] 4490 	jreq 2$
      009791 AF 00 14         [ 2] 4491 	jp syntax_error
      009794 27               [ 1] 4492 2$:	ld a,xl 
      009795 28 01            [ 2] 4493 	ldw x,(ADDR,sp) 
      009796 CF 00 14         [ 2] 4494 	ldw farptr+1,x 
      009796 1C               [ 1] 4495 	clrw x 
      009797 00 01 CD         [ 4] 4496 	call write_byte
      00979A 97 63            [ 2] 4497 	ldw x,(ADDR,sp)
      00979C AE               [ 1] 4498 	incw x 
      00979D 02 7F            [ 2] 4499 	jra 0$ 
      0019D6                       4500 9$:
      0019D6                       4501 	_drop VSIZE
      00979F C3 00            [ 2]    1     addw sp,#VSIZE 
      0097A1 14               [ 4] 4502 	ret 
                                   4503 
                                   4504 
                                   4505 ;---------------------
                                   4506 ;BASIC: CHAR(expr)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



                                   4507 ; évaluate expression 
                                   4508 ; and take the 7 least 
                                   4509 ; bits as ASCII character
                                   4510 ;---------------------
      0019D9                       4511 char:
      0097A2 2A D6            [ 1] 4512 	ld a,#TK_LPAREN 
      0097A4 72 5F 00         [ 4] 4513 	call expect 
      0097A7 17 72 5F         [ 4] 4514 	call relation 
      0097AA 00 18            [ 1] 4515 	cp a,#TK_INTGR 
      0097AC 72 5F            [ 1] 4516 	jreq 1$
      0097AE 00 19 72         [ 2] 4517 	jp syntax_error
      0097B1 5F               [ 2] 4518 1$:	pushw x 
      0097B2 00 09            [ 1] 4519 	ld a,#TK_RPAREN 
      0097B4 72 5F 00         [ 4] 4520 	call expect
      0097B7 0A               [ 2] 4521 	popw x  
      0097B8 72               [ 1] 4522 	ld a,xl 
      0097B9 5F 00            [ 1] 4523 	and a,#0x7f 
      0097BB 0B               [ 1] 4524 	ld xl,a
      0097BC 20 1A            [ 1] 4525 	ld a,#TK_CHAR
      0097BE 81               [ 4] 4526 	ret
                                   4527 
                                   4528 ;---------------------
                                   4529 ; BASIC: ASC(string|char)
                                   4530 ; extract first character 
                                   4531 ; of string argument 
                                   4532 ; return it as TK_INTGR 
                                   4533 ;---------------------
      0019F6                       4534 ascii:
      0097BE CE 00            [ 1] 4535 	ld a,#TK_LPAREN
      0097C0 15 A3 00         [ 4] 4536 	call expect 
      0097C3 00 27 06         [ 4] 4537 	call get_token 
      0097C6 AE 00            [ 1] 4538 	cp a,#TK_QSTR 
      0097C8 01 CD            [ 1] 4539 	jreq 1$
      0097CA 97 63            [ 1] 4540 	cp a,#TK_CHAR 
      0097CC 27 06            [ 1] 4541 	jreq 2$ 
      0097CC CE 00 14         [ 2] 4542 	jp syntax_error
      001A09                       4543 1$: 
      0097CF C6               [ 1] 4544 	ld a,(x)
      0097D0 00 16            [ 2] 4545 	jra 3$
      001A0C                       4546 2$: 
      0097D2 CF               [ 1] 4547 	ld a,xl 
      0097D3 00               [ 1] 4548 3$:	ld xl,a 
      0097D4 17               [ 1] 4549 	clr a  
      0097D5 C7               [ 1] 4550 	ld xh,a 
      0097D6 00               [ 2] 4551 	pushw x  
      0097D7 19 81            [ 1] 4552 	ld a,#TK_RPAREN 
      0097D9 CD 10 6E         [ 4] 4553 	call expect 
      0097D9 5F               [ 2] 4554 	popw x 
      0097DA 92 AF            [ 1] 4555 	ld a,#TK_INTGR 
      0097DC 00               [ 4] 4556 	ret 
                                   4557 
                                   4558 ;---------------------
                                   4559 ;BASIC: KEY
                                   4560 ; wait for a character 
                                   4561 ; received from STDIN 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4562 ; input:
                                   4563 ;	none 
                                   4564 ; output:
                                   4565 ;	X 		ASCII character 
                                   4566 ;---------------------
      001A1A                       4567 key:
      0097DD 14 90 F1         [ 4] 4568 	call getc 
      0097E0 26               [ 1] 4569 	clrw x 
      0097E1 08               [ 1] 4570 	ld xl,a 
      0097E2 4D 27            [ 1] 4571 	ld a,#TK_INTGR
      0097E4 12               [ 4] 4572 	ret
                                   4573 
                                   4574 ;----------------------
                                   4575 ; BASIC: QKEY
                                   4576 ; Return true if there 
                                   4577 ; is a character in 
                                   4578 ; waiting in STDIN 
                                   4579 ; input:
                                   4580 ;  none 
                                   4581 ; output:
                                   4582 ;   X 		0|1 
                                   4583 ;-----------------------
      001A22                       4584 qkey: 
      0097E5 5C               [ 1] 4585 	clrw x 
      0097E6 90 5C 20 F0 01   [ 2] 4586 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      0097EA 5C               [ 1] 4587 	incw x 
      0097EA 4D 27            [ 1] 4588 9$: ld a,#TK_INTGR
      0097EC 07               [ 4] 4589 	ret 
                                   4590 
                                   4591 ;---------------------
                                   4592 ; BASIC: GPIO(expr,reg)
                                   4593 ; return gpio address 
                                   4594 ; expr {0..8}
                                   4595 ; input:
                                   4596 ;   none 
                                   4597 ; output:
                                   4598 ;   X 		gpio register address
                                   4599 ;----------------------------
      001A2C                       4600 gpio:
      0097ED 5C 92            [ 1] 4601 	ld a,#TK_LPAREN 
      0097EF AF 00 14         [ 4] 4602 	call expect 
      0097F2 20 F6 5C         [ 4] 4603 	call arg_list
      0097F5 98 81            [ 1] 4604 	cp a,#2
      0097F7 27 03            [ 1] 4605 	jreq 1$
      0097F7 5C 99 81         [ 2] 4606 	jp syntax_error  
      0097FA                       4607 1$:	
      0097FA 52 04            [ 1] 4608 	ld a,#TK_RPAREN 
      0097FC 17 03 5F         [ 4] 4609 	call expect 
      0097FF CF 00 15         [ 2] 4610 	ldw x,#2
      009802 35 01 00 14      [ 5] 4611 	ldw x,([dstkptr],x) ; port 
      009806 2B 1E            [ 1] 4612 	jrmi bad_port
      009806 92 BC 00         [ 2] 4613 	cpw x,#9
      009809 14 27            [ 1] 4614 	jrpl bad_port
      00980B 24 5F            [ 1] 4615 	ld a,#5
      00980D 16               [ 4] 4616 	mul x,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



      00980E 03 CD 97         [ 2] 4617 	addw x,#GPIO_BASE 
      009811 D9               [ 2] 4618 	pushw x 
      009812 25 2C 92         [ 4] 4619 	call dpop 
      009815 AF 00 14         [ 2] 4620 	addw x,(1,sp)
      009818 6B 01            [ 2] 4621 	ldw (1,sp),x  
      00981A 5C 92 AF         [ 2] 4622 	ldw x,#2 
      00981D 00 14 6B         [ 4] 4623 	call ddrop_n 
      009820 02               [ 2] 4624 	popw x 
      009821 5C 72            [ 1] 4625 	ld a,#TK_INTGR
      009823 FB               [ 4] 4626 	ret
      001A67                       4627 bad_port:
      009824 01 CD            [ 1] 4628 	ld a,#ERR_BAD_VALUE
      009826 97 63 AE         [ 2] 4629 	jp tb_error
                                   4630 
                                   4631 ;----------------------
                                   4632 ; BASIC: ODR 
                                   4633 ; return offset of gpio
                                   4634 ; ODR register: 0
                                   4635 ; ---------------------
      001A6C                       4636 port_odr:
      009829 02 80 C3         [ 2] 4637 	ldw x,#GPIO_ODR
      00982C 00 14            [ 1] 4638 	ld a,#TK_INTGR
      00982E 2A               [ 4] 4639 	ret
                                   4640 
                                   4641 ;----------------------
                                   4642 ; BASIC: IDR 
                                   4643 ; return offset of gpio
                                   4644 ; IDR register: 1
                                   4645 ; ---------------------
      001A72                       4646 port_idr:
      00982F D6 00 01         [ 2] 4647 	ldw x,#GPIO_IDR
      009830 A6 0A            [ 1] 4648 	ld a,#TK_INTGR
      009830 72               [ 4] 4649 	ret
                                   4650 
                                   4651 ;----------------------
                                   4652 ; BASIC: DDR 
                                   4653 ; return offset of gpio
                                   4654 ; DDR register: 2
                                   4655 ; ---------------------
      001A78                       4656 port_ddr:
      009831 5F 00 14         [ 2] 4657 	ldw x,#GPIO_DDR
      009834 72 5F            [ 1] 4658 	ld a,#TK_INTGR
      009836 00               [ 4] 4659 	ret
                                   4660 
                                   4661 ;----------------------
                                   4662 ; BASIC: CRL  
                                   4663 ; return offset of gpio
                                   4664 ; CR1 register: 3
                                   4665 ; ---------------------
      001A7E                       4666 port_cr1:
      009837 15 72 5F         [ 2] 4667 	ldw x,#GPIO_CR1
      00983A 00 16            [ 1] 4668 	ld a,#TK_INTGR
      00983C 5B               [ 4] 4669 	ret
                                   4670 
                                   4671 ;----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



                                   4672 ; BASIC: CRH  
                                   4673 ; return offset of gpio
                                   4674 ; CR2 register: 4
                                   4675 ; ---------------------
      001A84                       4676 port_cr2:
      00983D 04 98 81         [ 2] 4677 	ldw x,#GPIO_CR2
      009840 A6 0A            [ 1] 4678 	ld a,#TK_INTGR
      009840 5B               [ 4] 4679 	ret
                                   4680 
                                   4681 ;-------------------------
                                   4682 ; BASIC: UFLASH 
                                   4683 ; return user flash address
                                   4684 ; input:
                                   4685 ;  none 
                                   4686 ; output:
                                   4687 ;	A		TK_INTGR
                                   4688 ;   X 		user address 
                                   4689 ;---------------------------
      001A8A                       4690 uflash:
      009841 04 99 81         [ 2] 4691 	ldw x,#user_space 
      009844 A6 0A            [ 1] 4692 	ld a,#TK_INTGR 
      009844 72               [ 4] 4693 	ret 
                                   4694 
                                   4695 ;-------------------------
                                   4696 ; BASIC: EEPROM 
                                   4697 ; return eeprom address
                                   4698 ; input:
                                   4699 ;  none 
                                   4700 ; output:
                                   4701 ;	A		TK_INTGR
                                   4702 ;   X 		eeprom address 
                                   4703 ;---------------------------
      001A90                       4704 eeprom:
      009845 01 00 25         [ 2] 4705 	ldw x,#EEPROM_BASE 
      009848 05 A6            [ 1] 4706 	ld a,#TK_INTGR 
      00984A 07               [ 4] 4707 	ret 
                                   4708 
                                   4709 ;---------------------
                                   4710 ; BASIC: USR(addr[,arg])
                                   4711 ; execute a function written 
                                   4712 ; in binary code.
                                   4713 ; binary fonction should 
                                   4714 ; return token attribute in A 
                                   4715 ; and value in X. 
                                   4716 ; input:
                                   4717 ;   addr	routine address 
                                   4718 ;   arg 	is an optional argument 
                                   4719 ; output:
                                   4720 ;   A 		token attribute 
                                   4721 ;   X       returned value 
                                   4722 ;---------------------
      001A96                       4723 usr:
      00984B CC 86            [ 2] 4724 	pushw y 	
      00984D 7E 04            [ 1] 4725 	ld a,#TK_LPAREN 
      00984E CD 10 6E         [ 4] 4726 	call expect 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



      00984E CE 00 1E         [ 4] 4727 	call arg_list 
      009851 72 B0            [ 1] 4728 	cp a,#1 
      009853 00 1C            [ 1] 4729 	jrpl 2$ 
      009855 26 02 4F         [ 2] 4730 	jp syntax_error 
      009858 81 05            [ 1] 4731 2$: ld a,#TK_RPAREN
      009859 CD 10 6E         [ 4] 4732 	call expect 
      009859 C6 00 17         [ 4] 4733 	call dpop 
      00985C CA 00            [ 1] 4734 	cp a,#2 
      00985E 18 CA            [ 1] 4735 	jrmi 4$
      009860 00 19            [ 1] 4736 	ldw y,x ; y=arg 
      009862 26 05 A6         [ 4] 4737 	call dpop ;x=addr 
      009865 01               [ 1] 4738 4$:	exgw y,x ; y=addr,x=arg 
      009866 CC 86            [ 4] 4739 	call (y)
      009868 7E CD            [ 2] 4740 	popw y 
      00986A 8C               [ 4] 4741 	ret 
                                   4742 
                                   4743 ;------------------------------
                                   4744 ; BASIC: BYE 
                                   4745 ; halt mcu in its lowest power mode 
                                   4746 ; wait for reset or external interrupt
                                   4747 ; do a cold start on wakeup.
                                   4748 ;------------------------------
      001ABE                       4749 bye:
      00986B 67 A1 06 27 03   [ 2] 4750 	btjf UART3_SR,#UART_SR_TC,.
      009870 CC               [10] 4751 	halt
      009871 86 7C 4F         [ 2] 4752 	jp cold_start  
                                   4753 
                                   4754 ;----------------------------------
                                   4755 ; BASIC: SLEEP 
                                   4756 ; halt mcu until reset or external
                                   4757 ; interrupt.
                                   4758 ; Resume progam after SLEEP command
                                   4759 ;----------------------------------
      009873                       4760 sleep:
      009873 90 93 CD 97 FA   [ 2] 4761 	btjf UART3_SR,#UART_SR_TC,.
      009878 24 05 A6 08      [ 1] 4762 	bset flags,#FSLEEP
      00987C CC               [10] 4763 	halt 
      00987D 86               [ 4] 4764 	ret 
                                   4765 
                                   4766 ;-------------------------------
                                   4767 ; BASIC: PAUSE expr 
                                   4768 ; suspend execution for n msec.
                                   4769 ; input:
                                   4770 ;	none
                                   4771 ; output:
                                   4772 ;	none 
                                   4773 ;------------------------------
      001AD2                       4774 pause:
      00987E 7E 11 73         [ 4] 4775 	call expression
      00987F A1 0A            [ 1] 4776 	cp a,#TK_INTGR
      00987F CE 00            [ 1] 4777 	jreq pause02 
      009881 17 C6 00         [ 2] 4778 	jp syntax_error
      001ADC                       4779 pause02: 
      009884 19               [ 2] 4780 1$: tnzw x 
      009885 CF 00            [ 1] 4781 	jreq 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



      009887 14               [10] 4782 	wfi 
      009888 C7               [ 2] 4783 	decw x 
      009889 00 16            [ 1] 4784 	jrne 1$
      00988B AE               [ 1] 4785 2$:	clr a 
      00988C 17               [ 4] 4786 	ret 
                                   4787 
                                   4788 ;------------------------------
                                   4789 ; BASIC: TICKS
                                   4790 ; return msec ticks counter value 
                                   4791 ; input:
                                   4792 ; 	none 
                                   4793 ; output:
                                   4794 ;	X 		TK_INTGR
                                   4795 ;-------------------------------
      001AE5                       4796 get_ticks:
      00988D 18 CD 82         [ 2] 4797 	ldw x,ticks 
      009890 F2 5C            [ 1] 4798 	ld a,#TK_INTGR
      009892 89               [ 4] 4799 	ret 
                                   4800 
                                   4801 
                                   4802 
                                   4803 ;------------------------------
                                   4804 ; BASIC: ABS(expr)
                                   4805 ; return absolute value of expr.
                                   4806 ; input:
                                   4807 ;   none
                                   4808 ; output:
                                   4809 ;   X     	positive integer
                                   4810 ;-------------------------------
      001AEB                       4811 abs:
      009893 5F 90            [ 1] 4812 	ld a,#TK_LPAREN
      009895 AE 17 18         [ 4] 4813 	call expect 
      009898 CD 81 D1         [ 4] 4814 	call arg_list
      00989B 5B 02            [ 1] 4815 	cp a,#1 
      00989D CE 00            [ 1] 4816 	jreq 0$ 
      00989F 1E 72 B0         [ 2] 4817 	jp syntax_error
      001AFA                       4818 0$:  
      0098A2 00 1C            [ 1] 4819 	ld a,#TK_RPAREN 
      0098A4 89 5F 7B         [ 4] 4820 	call expect 
      0098A7 01 CD 81         [ 4] 4821     call dpop   
      0098AA 5C               [ 1] 4822 	ld a,xh 
      0098AB 5C 7B            [ 1] 4823 	bcp a,#0x80 
      0098AD 02 CD            [ 1] 4824 	jreq 2$ 
      0098AF 81               [ 2] 4825 	negw x 
      0098B0 5C 5C            [ 1] 4826 2$: ld a,#TK_INTGR 
      0098B2 CD               [ 4] 4827 	ret 
                                   4828 
                                   4829 ;------------------------------
                                   4830 ; BASIC: RND(expr)
                                   4831 ; return random number 
                                   4832 ; between 1 and expr inclusive
                                   4833 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4834 ; input:
                                   4835 ; 	none 
                                   4836 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



                                   4837 ;	X 		random positive integer 
                                   4838 ;------------------------------
      001B0B                       4839 random:
      0098B3 97 63            [ 1] 4840 	ld a,#TK_LPAREN 
      0098B5 1E 01 89         [ 4] 4841 	call expect 
      0098B8 5F 90 CE         [ 4] 4842 	call arg_list 
      0098BB 00 1C            [ 1] 4843 	cp a,#1
      0098BD CD 81            [ 1] 4844 	jreq 1$
      0098BF D1 5B 02         [ 2] 4845 	jp syntax_error
      0098C2 CE 00            [ 1] 4846 1$: ld a,#TK_RPAREN
      0098C4 14 C6 00         [ 4] 4847 	call expect 
      0098C7 16 CF 00         [ 4] 4848 	call dpop 
      0098CA 17               [ 2] 4849 	pushw x 
      0098CB C7               [ 1] 4850 	ld a,xh 
      0098CC 00 19            [ 1] 4851 	bcp a,#0x80 
      0098CE 5F 4F            [ 1] 4852 	jreq 2$
      0098D0 CD 81            [ 1] 4853 	ld a,#ERR_BAD_VALUE
      0098D2 5C 5C 4F         [ 2] 4854 	jp tb_error
      001B2D                       4855 2$: 
                                   4856 ; acc16=(x<<5)^x 
      0098D5 CD 81 5C         [ 2] 4857 	ldw x,seedx 
      0098D8 5C               [ 2] 4858 	sllw x 
      0098D9 4F               [ 2] 4859 	sllw x 
      0098DA CD               [ 2] 4860 	sllw x 
      0098DB 81               [ 2] 4861 	sllw x 
      0098DC 5C               [ 2] 4862 	sllw x 
      0098DD 85               [ 1] 4863 	ld a,xh 
      0098DE A6 0A 81         [ 1] 4864 	xor a,seedx 
      0098E1 C7 00 09         [ 1] 4865 	ld acc16,a 
      0098E1 72               [ 1] 4866 	ld a,xl 
      0098E2 01 00 25         [ 1] 4867 	xor a,seedx+1 
      0098E5 07 27 05         [ 1] 4868 	ld acc8,a 
                                   4869 ; seedx=seedy 
      0098E8 A6 07 CC         [ 2] 4870 	ldw x,seedy 
      0098EB 86 7E 0D         [ 2] 4871 	ldw seedx,x  
                                   4872 ; seedy=seedy^(seedy>>1)
      0098ED 90 54            [ 2] 4873 	srlw y 
      0098ED CD 8C            [ 1] 4874 	ld a,yh 
      0098EF 67 A1 06         [ 1] 4875 	xor a,seedy 
      0098F2 27 03 CC         [ 1] 4876 	ld seedy,a  
      0098F5 86 7C            [ 1] 4877 	ld a,yl 
      0098F7 C8 00 10         [ 1] 4878 	xor a,seedy+1 
      0098F7 90 93 CD         [ 1] 4879 	ld seedy+1,a 
                                   4880 ; acc16>>3 
      0098FA 97 FA 25         [ 2] 4881 	ldw x,acc16 
      0098FD 05               [ 2] 4882 	srlw x 
      0098FE A6               [ 2] 4883 	srlw x 
      0098FF 09               [ 2] 4884 	srlw x 
                                   4885 ; x=acc16^x 
      009900 CC               [ 1] 4886 	ld a,xh 
      009901 86 7E 09         [ 1] 4887 	xor a,acc16 
      009903 95               [ 1] 4888 	ld xh,a 
      009903 CD               [ 1] 4889 	ld a,xl 
      009904 97 63 CD         [ 1] 4890 	xor a,acc8 
      009907 85               [ 1] 4891 	ld xl,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



                                   4892 ; seedy=x^seedy 
      009908 5A 5F 92         [ 1] 4893 	xor a,seedy+1
      00990B AF               [ 1] 4894 	ld xl,a 
      00990C 00               [ 1] 4895 	ld a,xh 
      00990D 14 90 95         [ 1] 4896 	xor a,seedy
      009910 5C               [ 1] 4897 	ld xh,a 
      009911 92 AF 00         [ 2] 4898 	ldw seedy,x 
                                   4899 ; return seedy modulo expr + 1 
      009914 14 5C            [ 2] 4900 	popw y 
      009916 90               [ 2] 4901 	divw x,y 
      009917 97               [ 1] 4902 	ldw x,y 
      009918 72               [ 1] 4903 	incw x 
      009919 B9 00            [ 1] 4904 	ld a,#TK_INTGR
      00991B 1C               [ 4] 4905 	ret 
                                   4906 
                                   4907 ;*********************************
                                   4908 
                                   4909 ;------------------------------
                                   4910 ;      dictionary 
                                   4911 ; format:
                                   4912 ;   link:   2 bytes 
                                   4913 ;   name_length+flags:  1 byte, bits 0:4 lenght,5:8 flags  
                                   4914 ;   cmd_name: 16 byte max 
                                   4915 ;   code_address: 2 bytes 
                                   4916 ;------------------------------
                           000080  4917 	FFUNC=128 ; function flag 
                                   4918 	.macro _dict_entry len,name,cmd 
                                   4919 	.word LINK 
                                   4920 	LINK=.
                                   4921 name:
                                   4922 	.byte len 	
                                   4923 	.ascii "name"
                                   4924 	.word cmd 
                                   4925 	.endm 
                                   4926 
                           000000  4927 	LINK=0
      001B7F                       4928 kword_end:
      001B7F                       4929 	_dict_entry,3,BYE,bye 
      00991C 90 CF                    1 	.word LINK 
                           001B81     2 	LINK=.
      001B81                          3 BYE:
      00991E 00                       4 	.byte 3 	
      00991F 1E 90 CE                 5 	.ascii "BYE"
      009922 00 1C                    6 	.word bye 
      009924                       4930 	_dict_entry,5,SLEEP,sleep 
      009924 92 AF                    1 	.word LINK 
                           001B89     2 	LINK=.
      001B89                          3 SLEEP:
      009926 00                       4 	.byte 5 	
      009927 14 90 F7 5C 90           5 	.ascii "SLEEP"
      00992C 5C 90                    6 	.word sleep 
      001B91                       4931 	_dict_entry,6,FORGET,forget 
      00992E C3 00                    1 	.word LINK 
                           001B93     2 	LINK=.
      001B93                          3 FORGET:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



      009930 1E                       4 	.byte 6 	
      009931 2B F1 CE 00 1E 72        5 	.ascii "FORGET"
      009937 B0 00                    6 	.word forget 
      001B9C                       4932 	_dict_entry,3,DIR,directory 
      009939 1C CD                    1 	.word LINK 
                           001B9E     2 	LINK=.
      001B9E                          3 DIR:
      00993B 88                       4 	.byte 3 	
      00993C CF 81 52                 5 	.ascii "DIR"
      00993E 19 0D                    6 	.word directory 
      001BA4                       4933 	_dict_entry,4,LOAD,load 
      00993E CD 8C                    1 	.word LINK 
                           001BA6     2 	LINK=.
      001BA6                          3 LOAD:
      009940 67                       4 	.byte 4 	
      009941 A1 00 27 1B              5 	.ascii "LOAD"
      009945 A1 06                    6 	.word load 
      001BAD                       4934 	_dict_entry,4,SAVE,save
      009947 27 03                    1 	.word LINK 
                           001BAF     2 	LINK=.
      001BAF                          3 SAVE:
      009949 CC                       4 	.byte 4 	
      00994A 86 7C 90 93              5 	.ascii "SAVE"
      00994E CD 97                    6 	.word save 
      001BB6                       4935 	_dict_entry,5,WRITE,write  
      009950 FA 25                    1 	.word LINK 
                           001BB8     2 	LINK=.
      001BB8                          3 WRITE:
      009952 05                       4 	.byte 5 	
      009953 A6 09 CC 86 7E           5 	.ascii "WRITE"
      009958 19 A2                    6 	.word write 
      001BC0                       4936 	_dict_entry,3,NEW,new
      009958 CE 00                    1 	.word LINK 
                           001BC2     2 	LINK=.
      001BC2                          3 NEW:
      00995A 14                       4 	.byte 3 	
      00995B C6 00 16                 5 	.ascii "NEW"
      00995E 20 0B                    6 	.word new 
      009960                       4937 	_dict_entry,5,BREAK,break 
      009960 AE 00                    1 	.word LINK 
                           001BCA     2 	LINK=.
      001BCA                          3 BREAK:
      009962 00                       4 	.byte 5 	
      009963 4F 01 CF 00 14           5 	.ascii "BREAK"
      009968 C7 00                    6 	.word break 
      001BD2                       4938 	_dict_entry,4,STOP,stop 
      00996A 16 CA                    1 	.word LINK 
                           001BD4     2 	LINK=.
      00996B                          3 STOP:
      00996B CF                       4 	.byte 4 	
      00996C 00 17 C7 00              5 	.ascii "STOP"
      009970 19 5F                    6 	.word stop 
      001BDB                       4939     _dict_entry,4,SHOW,show 
      009972 4F CD                    1 	.word LINK 
                           001BDD     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      001BDD                          3 SHOW:
      009974 81                       4 	.byte 4 	
      009975 5C AE 00 01              5 	.ascii "SHOW"
      009979 CD 97                    6 	.word show 
      001BE4                       4940 	_dict_entry 3,RUN,run
      00997B 63 C6                    1 	.word LINK 
                           001BE6     2 	LINK=.
      001BE6                          3 RUN:
      00997D 00                       4 	.byte 3 	
      00997E 14 C1 00                 5 	.ascii "RUN"
      009981 17 2B                    6 	.word run 
      001BEC                       4941 	_dict_entry 4,LIST,list
      009983 ED CE                    1 	.word LINK 
                           001BEE     2 	LINK=.
      001BEE                          3 LIST:
      009985 00                       4 	.byte 4 	
      009986 15 C3 00 18              5 	.ascii "LIST"
      00998A 2B E5                    6 	.word list 
      001BF5                       4942 	_dict_entry,3+FFUNC,USR,usr
      00998C 81 EE                    1 	.word LINK 
                           001BF7     2 	LINK=.
      00998D                          3 USR:
      00998D 52                       4 	.byte 3+FFUNC 	
      00998E 02 5F 1F                 5 	.ascii "USR"
      009991 01 CF                    6 	.word usr 
      001BFD                       4943 	_dict_entry,6+FFUNC,EEPROM,eeprom 
      009993 00 15                    1 	.word LINK 
                           001BFF     2 	LINK=.
      001BFF                          3 EEPROM:
      009995 35                       4 	.byte 6+FFUNC 	
      009996 01 00 14 52 4F 4D        5 	.ascii "EEPROM"
      009999 1A 90                    6 	.word eeprom 
      001C08                       4944 	_dict_entry,6+FFUNC,UFLASH,uflash 
      009999 5F 92                    1 	.word LINK 
                           001C0A     2 	LINK=.
      001C0A                          3 UFLASH:
      00999B AF                       4 	.byte 6+FFUNC 	
      00999C 00 14 27 38 53 48        5 	.ascii "UFLASH"
      0099A0 1A 8A                    6 	.word uflash 
      001C13                       4945 	_dict_entry,3+FFUNC,ODR,port_odr
      0099A0 92 AF                    1 	.word LINK 
                           001C15     2 	LINK=.
      001C15                          3 ODR:
      0099A2 00                       4 	.byte 3+FFUNC 	
      0099A3 14 27 06                 5 	.ascii "ODR"
      0099A6 CD 82                    6 	.word port_odr 
      001C1B                       4946 	_dict_entry,3+FFUNC,IDR,port_idr
      0099A8 1E 5C                    1 	.word LINK 
                           001C1D     2 	LINK=.
      001C1D                          3 IDR:
      0099AA 20                       4 	.byte 3+FFUNC 	
      0099AB F4 5C A6                 5 	.ascii "IDR"
      0099AE 20 CD                    6 	.word port_idr 
      001C23                       4947 	_dict_entry,3+FFUNC,DDR,port_ddr 
      0099B0 82 1E                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



                           001C25     2 	LINK=.
      001C25                          3 DDR:
      0099B2 92                       4 	.byte 3+FFUNC 	
      0099B3 AF 00 14                 5 	.ascii "DDR"
      0099B6 90 95                    6 	.word port_ddr 
      001C2B                       4948 	_dict_entry,3+FFUNC,CRL,port_cr1 
      0099B8 5C 92                    1 	.word LINK 
                           001C2D     2 	LINK=.
      001C2D                          3 CRL:
      0099BA AF                       4 	.byte 3+FFUNC 	
      0099BB 00 14 5C                 5 	.ascii "CRL"
      0099BE 90 97                    6 	.word port_cr1 
      001C33                       4949 	_dict_entry,3+FFUNC,CRH,port_cr2
      0099C0 90 89                    1 	.word LINK 
                           001C35     2 	LINK=.
      001C35                          3 CRH:
      0099C2 72                       4 	.byte 3+FFUNC 	
      0099C3 FB 01 CD                 5 	.ascii "CRH"
      0099C6 97 63                    6 	.word port_cr2 
      001C3B                       4950 	_dict_entry,4+FFUNC,GPIO,gpio 
      0099C8 85 CD                    1 	.word LINK 
                           001C3D     2 	LINK=.
      001C3D                          3 GPIO:
      0099CA 88                       4 	.byte 4+FFUNC 	
      0099CB CF A6 0D CD              5 	.ascii "GPIO"
      0099CF 82 1E                    6 	.word gpio 
      001C44                       4951 	_dict_entry,3+FFUNC,ASC,ascii  
      0099D1 1E 01                    1 	.word LINK 
                           001C46     2 	LINK=.
      001C46                          3 ASC:
      0099D3 5C                       4 	.byte 3+FFUNC 	
      0099D4 1F 01 20                 5 	.ascii "ASC"
      0099D7 C1 F6                    6 	.word ascii 
      0099D8                       4952 	_dict_entry,4+FFUNC,CHAR,char
      0099D8 1E 01                    1 	.word LINK 
                           001C4E     2 	LINK=.
      001C4E                          3 CHAR:
      0099DA CD                       4 	.byte 4+FFUNC 	
      0099DB 88 CF AE 9A              5 	.ascii "CHAR"
      0099DF 0D CD                    6 	.word char 
      001C55                       4953 	_dict_entry,4+FFUNC,QKEY,qkey  
      0099E1 82 30                    1 	.word LINK 
                           001C57     2 	LINK=.
      001C57                          3 QKEY:
      0099E3 A6                       4 	.byte 4+FFUNC 	
      0099E4 FF C0 00 19              5 	.ascii "QKEY"
      0099E8 C7 00                    6 	.word qkey 
      001C5E                       4954 	_dict_entry,3+FFUNC,KEY,key 
      0099EA 0B A6                    1 	.word LINK 
                           001C60     2 	LINK=.
      001C60                          3 KEY:
      0099EC 7F                       4 	.byte 3+FFUNC 	
      0099ED C2 00 18                 5 	.ascii "KEY"
      0099F0 C7 00                    6 	.word key 
      001C66                       4955 	_dict_entry,4+FFUNC,SIZE,size
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      0099F2 0A A6                    1 	.word LINK 
                           001C68     2 	LINK=.
      001C68                          3 SIZE:
      0099F4 02                       4 	.byte 4+FFUNC 	
      0099F5 C2 00 17 C7              5 	.ascii "SIZE"
      0099F9 00 09                    6 	.word size 
      001C6F                       4956 	_dict_entry,3,HEX,hex_base
      0099FB 5F A6                    1 	.word LINK 
                           001C71     2 	LINK=.
      001C71                          3 HEX:
      0099FD 06                       4 	.byte 3 	
      0099FE 97 A6 0A                 5 	.ascii "HEX"
      009A01 CD 88                    6 	.word hex_base 
      001C77                       4957 	_dict_entry,3,DEC,dec_base
      009A03 87 AE                    1 	.word LINK 
                           001C79     2 	LINK=.
      001C79                          3 DEC:
      009A05 9A                       4 	.byte 3 	
      009A06 15 CD 82                 5 	.ascii "DEC"
      009A09 30 5B                    6 	.word dec_base 
      001C7F                       4958 	_dict_entry,5+FFUNC,TICKS,get_ticks
      009A0B 02 81                    1 	.word LINK 
                           001C81     2 	LINK=.
      001C81                          3 TICKS:
      009A0D 20                       4 	.byte 5+FFUNC 	
      009A0E 66 69 6C 65 73           5 	.ascii "TICKS"
      009A13 0A 00                    6 	.word get_ticks 
      001C89                       4959 	_dict_entry,3+FFUNC,ABS,abs
      009A15 20 62                    1 	.word LINK 
                           001C8B     2 	LINK=.
      001C8B                          3 ABS:
      009A17 79                       4 	.byte 3+FFUNC 	
      009A18 74 65 73                 5 	.ascii "ABS"
      009A1B 20 66                    6 	.word abs 
      001C91                       4960 	_dict_entry,3+FFUNC,RND,random 
      009A1D 72 65                    1 	.word LINK 
                           001C93     2 	LINK=.
      001C93                          3 RND:
      009A1F 65                       4 	.byte 3+FFUNC 	
      009A20 0A 00 44                 5 	.ascii "RND"
      009A22 1B 0B                    6 	.word random 
      001C99                       4961 	_dict_entry,5,PAUSE,pause 
      009A22 52 02                    1 	.word LINK 
                           001C9B     2 	LINK=.
      001C9B                          3 PAUSE:
      009A24 72                       4 	.byte 5 	
      009A25 5F 00 14 CD 91           5 	.ascii "PAUSE"
      009A2A F3 A1                    6 	.word pause 
      001CA3                       4962 	_dict_entry,4,BSET,bit_set 
      009A2C 0A 27                    1 	.word LINK 
                           001CA5     2 	LINK=.
      001CA5                          3 BSET:
      009A2E 03                       4 	.byte 4 	
      009A2F CC 86 7C 1F              5 	.ascii "BSET"
      009A33 01 CD                    6 	.word bit_set 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      001CAC                       4963 	_dict_entry,4,BRES,bit_reset
      009A35 8C 67                    1 	.word LINK 
                           001CAE     2 	LINK=.
      001CAE                          3 BRES:
      009A37 A1                       4 	.byte 4 	
      009A38 08 27 02 20              5 	.ascii "BRES"
      009A3C 19 CD                    6 	.word bit_reset 
      001CB5                       4964 	_dict_entry,5,BTOGL,bit_toggle
      009A3E 91 F3                    1 	.word LINK 
                           001CB7     2 	LINK=.
      001CB7                          3 BTOGL:
      009A40 A1                       4 	.byte 5 	
      009A41 0A 27 03 CC 86           5 	.ascii "BTOGL"
      009A46 7C 9F                    6 	.word bit_toggle 
      001CBF                       4965 	_dict_entry 4,WAIT,wait 
      009A48 1E 01                    1 	.word LINK 
                           001CC1     2 	LINK=.
      001CC1                          3 WAIT:
      009A4A CF                       4 	.byte 4 	
      009A4B 00 15 5F CD              5 	.ascii "WAIT"
      009A4F 81 5C                    6 	.word wait 
      001CC8                       4966 	_dict_entry 6,REMARK,rem 
      009A51 1E 01                    1 	.word LINK 
                           001CCA     2 	LINK=.
      001CCA                          3 REMARK:
      009A53 5C                       4 	.byte 6 	
      009A54 20 DC 4D 41 52 4B        5 	.ascii "REMARK"
      009A56 14 11                    6 	.word rem 
      001CD3                       4967 	_dict_entry 5,PRINT,print 
      009A56 5B 02                    1 	.word LINK 
                           001CD5     2 	LINK=.
      001CD5                          3 PRINT:
      009A58 81                       4 	.byte 5 	
      009A59 50 52 49 4E 54           5 	.ascii "PRINT"
      009A59 A6 04                    6 	.word print 
      001CDD                       4968 	_dict_entry,2,IF,if 
      009A5B CD 90                    1 	.word LINK 
                           001CDF     2 	LINK=.
      001CDF                          3 IF:
      009A5D EE                       4 	.byte 2 	
      009A5E CD 92                    5 	.ascii "IF"
      009A60 37 A1                    6 	.word if 
      001CE4                       4969 	_dict_entry,5,GOSUB,gosub 
      009A62 0A 27                    1 	.word LINK 
                           001CE6     2 	LINK=.
      001CE6                          3 GOSUB:
      009A64 03                       4 	.byte 5 	
      009A65 CC 86 7C 89 A6           5 	.ascii "GOSUB"
      009A6A 05 CD                    6 	.word gosub 
      001CEE                       4970 	_dict_entry,4,GOTO,goto 
      009A6C 90 EE                    1 	.word LINK 
                           001CF0     2 	LINK=.
      001CF0                          3 GOTO:
      009A6E 85                       4 	.byte 4 	
      009A6F 9F A4 7F 97              5 	.ascii "GOTO"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



      009A73 A6 0B                    6 	.word goto 
      001CF7                       4971 	_dict_entry,3,FOR,for 
      009A75 81 F0                    1 	.word LINK 
                           001CF9     2 	LINK=.
      009A76                          3 FOR:
      009A76 A6                       4 	.byte 3 	
      009A77 04 CD 90                 5 	.ascii "FOR"
      009A7A EE CD                    6 	.word for 
      001CFF                       4972 	_dict_entry,2,TO,to
      009A7C 8C 67                    1 	.word LINK 
                           001D01     2 	LINK=.
      001D01                          3 TO:
      009A7E A1                       4 	.byte 2 	
      009A7F 06 27                    5 	.ascii "TO"
      009A81 07 A1                    6 	.word to 
      001D06                       4973 	_dict_entry,4,STEP,step 
      009A83 0B 27                    1 	.word LINK 
                           001D08     2 	LINK=.
      001D08                          3 STEP:
      009A85 06                       4 	.byte 4 	
      009A86 CC 86 7C 50              5 	.ascii "STEP"
      009A89 15 18                    6 	.word step 
      001D0F                       4974 	_dict_entry,4,NEXT,next 
      009A89 F6 20                    1 	.word LINK 
                           001D11     2 	LINK=.
      001D11                          3 NEXT:
      009A8B 01                       4 	.byte 4 	
      009A8C 4E 45 58 54              5 	.ascii "NEXT"
      009A8C 9F 97                    6 	.word next 
      001D18                       4975 	_dict_entry,6+FFUNC,UBOUND,ubound 
      009A8E 4F 95                    1 	.word LINK 
                           001D1A     2 	LINK=.
      001D1A                          3 UBOUND:
      009A90 89                       4 	.byte 6+FFUNC 	
      009A91 A6 05 CD 90 EE 85        5 	.ascii "UBOUND"
      009A97 A6 0A                    6 	.word ubound 
      001D23                       4976 	_dict_entry,6,RETURN,return 
      009A99 81 1A                    1 	.word LINK 
                           001D25     2 	LINK=.
      009A9A                          3 RETURN:
      009A9A CD                       4 	.byte 6 	
      009A9B 82 27 5F 97 A6 0A        5 	.ascii "RETURN"
      009AA1 81 0D                    6 	.word return 
      009AA2                       4977 	_dict_entry,4+FFUNC,PEEK,peek 
      009AA2 5F 72                    1 	.word LINK 
                           001D30     2 	LINK=.
      001D30                          3 PEEK:
      009AA4 0B                       4 	.byte 4+FFUNC 	
      009AA5 52 40 01 5C              5 	.ascii "PEEK"
      009AA9 A6 0A                    6 	.word peek 
      001D37                       4978 	_dict_entry,4,POKE,poke 
      009AAB 81 30                    1 	.word LINK 
                           001D39     2 	LINK=.
      009AAC                          3 POKE:
      009AAC A6                       4 	.byte 4 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009AAD 04 CD 90 EE              5 	.ascii "POKE"
      009AB1 CD 90                    6 	.word poke 
      001D40                       4979 	_dict_entry,5,INPUT,input_var  
      009AB3 FB A1                    1 	.word LINK 
                           001D42     2 	LINK=.
      001D42                          3 INPUT:
      009AB5 02                       4 	.byte 5 	
      009AB6 27 03 CC 86 7C           5 	.ascii "INPUT"
      009ABB 13 9D                    6 	.word input_var 
      001D4A                       4980 kword_dict:
      001D4A                       4981 	_dict_entry 3,LET,let 
      009ABB A6 05                    1 	.word LINK 
                           001D4C     2 	LINK=.
      001D4C                          3 LET:
      009ABD CD                       4 	.byte 3 	
      009ABE 90 EE AE                 5 	.ascii "LET"
      009AC1 00 02                    6 	.word let 
                                   4982 	
                                   4983 
      001D80                       4984 	.bndry 128 ; align on FLASH block.
                                   4985 ; free space for user application  
      001D80                       4986 user_space:
                                   4987 ; USR() function test
      009AC3 72               [ 2] 4988 	pushw x 
      009AC4 DE 00 1A 2B      [ 1] 4989 	bset PC_ODR,#5 
      009AC8 1E               [ 2] 4990 	popw x 
      009AC9 A3 00 09         [ 4] 4991 	call pause02 
      009ACC 2A 19 A6 05      [ 1] 4992 	bres PC_ODR,#5 
      009AD0 42               [ 4] 4993 	ret
                                   4994 
                                   4995 	.area FLASH_DRIVE (ABS)
      010000                       4996 	.org 0x10000
      010000                       4997 fdrive:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        001C8B R   |     ADC_CR1 =  005401 
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
    ARG_OFS =  000002     |   5 ASC        001C46 R   |     ATTRIB  =  000002 
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
    BLOCK_ER=  000000     |     BLOCK_SI=  000080     |     BOOT_ROM=  006000 
    BOOT_ROM=  007FFF     |     BPTR    =  000005     |   5 BREAK      001BCA R
  5 BRES       001CAE R   |   5 BSET       001CA5 R   |     BSIZE   =  000005 
    BSP     =  000008     |   5 BTOGL      001CB7 R   |     BTW     =  000001 
  5 BYE        001B81 R   |     C       =  000001     |     CAN_DGR =  005426 
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
    CFG_GCR_=  000000     |   5 CHAR       001C4E R   |     CLKOPT  =  004807 
    CLKOPT_C=  000002     |     CLKOPT_E=  000003     |     CLKOPT_P=  000000 
    CLKOPT_P=  000001     |     CLK_CCOR=  0050C9     |     CLK_CKDI=  0050C6 
    CLK_CKDI=  000000     |     CLK_CKDI=  000001     |     CLK_CKDI=  000002 
    CLK_CKDI=  000003     |     CLK_CKDI=  000004     |     CLK_CMSR=  0050C3 
    CLK_CSSR=  0050C8     |     CLK_ECKR=  0050C1     |     CLK_ECKR=  000000 
    CLK_ECKR=  000001     |     CLK_HSIT=  0050CC     |     CLK_ICKR=  0050C0 
    CLK_ICKR=  000002     |     CLK_ICKR=  000000     |     CLK_ICKR=  000001 
    CLK_ICKR=  000003     |     CLK_ICKR=  000004     |     CLK_ICKR=  000005 
    CLK_PCKE=  0050C7     |     CLK_PCKE=  000000     |     CLK_PCKE=  000001 
    CLK_PCKE=  000007     |     CLK_PCKE=  000005     |     CLK_PCKE=  000006 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 103.
Hexadecimal [24-Bits]

Symbol Table

    CLK_PCKE=  000004     |     CLK_PCKE=  000002     |     CLK_PCKE=  000003 
    CLK_PCKE=  0050CA     |     CLK_PCKE=  000003     |     CLK_PCKE=  000002 
    CLK_PCKE=  000007     |     CLK_SWCR=  0050C5     |     CLK_SWCR=  000000 
    CLK_SWCR=  000001     |     CLK_SWCR=  000002     |     CLK_SWCR=  000003 
    CLK_SWIM=  0050CD     |     CLK_SWR =  0050C4     |     CLK_SWR_=  0000B4 
    CLK_SWR_=  0000E1     |     CLK_SWR_=  0000D2     |     CNT     =  000008 
    COMMA   =  000001     |     COUNT   =  000001     |     CPU_A   =  007F00 
    CPU_CCR =  007F0A     |     CPU_PCE =  007F01     |     CPU_PCH =  007F02 
    CPU_PCL =  007F03     |     CPU_SPH =  007F08     |     CPU_SPL =  007F09 
    CPU_XH  =  007F04     |     CPU_XL  =  007F05     |     CPU_YH  =  007F06 
    CPU_YL  =  007F07     |     CR      =  00000D     |   5 CRH        001C35 R
  5 CRL        001C2D R   |     CTRL_A  =  000001     |     CTRL_B  =  000002 
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
    DBG_Y   =  000001     |   5 DDR        001C25 R   |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   5 DEC        001C79 R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        001B9E R   |     DIVIDND =  000007     |     DIVISR  =  000005 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |     DSTACK_S=  000040 
  5 EEPROM     001BFF R   |     EEPROM_B=  004000     |     EEPROM_E=  0047FF 
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
    FLASH_NF=  000000     |     FLASH_NF=  000001     |     FLASH_NF=  000002 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_NF=  000003     |     FLASH_NF=  000004     |     FLASH_NF=  000005 
    FLASH_PU=  005062     |     FLASH_PU=  000056     |     FLASH_PU=  0000AE 
    FLASH_SI=  020000     |     FLASH_WS=  00480D     |     FLSI    =  01F400 
  5 FOR        001CF9 R   |   5 FORGET     001B93 R   |     FRUN    =  000000 
    FSIZE   =  000001     |     FSLEEP  =  000003     |     FTRAP   =  000001 
  5 GOSUB      001CE6 R   |     GOS_RET =  000003     |   5 GOTO       001CF0 R
  5 GPIO       001C3D R   |     GPIO_BAS=  005000     |     GPIO_CR1=  000003 
    GPIO_CR2=  000004     |     GPIO_DDR=  000002     |     GPIO_IDR=  000001 
    GPIO_ODR=  000000     |     GPIO_SIZ=  000005     |   5 HEX        001C71 R
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
    I2C_WRIT=  000000     |   5 IDR        001C1D R   |   5 IF         001CDF R
    IN      =  000007     |     INCR    =  000001     |   5 INPUT      001D42 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]

Symbol Table

    ITC_SPR7=  007F76     |     ITC_SPR8=  007F77     |     IWDG_KR =  0050E0 
    IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2     |   5 KEY        001C60 R
    LAST    =  000003     |     LB      =  000002     |     LED2_BIT=  000005 
    LED2_MAS=  000020     |     LED2_POR=  00500A     |     LEN     =  000005 
  5 LET        001D4C R   |     LINENO  =  000005     |   5 LINK    =  001D4C R
  5 LIST       001BEE R   |     LL      =  000002     |     LLEN    =  000007 
    LL_HB   =  000001     |     LNO     =  000005     |     LN_PTR  =  000005 
  5 LOAD       001BA6 R   |     MAJOR   =  000001     |     MASK    =  000002 
    MATH_OVF=  000000     |     MINOR   =  000000     |     MULOP   =  000005 
    N1      =  000001     |     N1_HB   =  000006     |     N1_LB   =  000007 
    N2      =  000003     |     N2_HB   =  000008     |     N2_LB   =  000009 
    NAFR    =  004804     |     NCLKOPT =  004808     |     NEG     =  000001 
  5 NEW        001BC2 R   |   5 NEXT       001D11 R   |     NFLASH_W=  00480E 
    NHSECNT =  00480A     |     NL      =  00000A     |     NLEN    =  000001 
    NOPT1   =  004802     |     NOPT2   =  004804     |     NOPT3   =  004806 
    NOPT4   =  004808     |     NOPT5   =  00480A     |     NOPT6   =  00480C 
    NOPT7   =  00480E     |     NOPTBL  =  00487F     |     NUBC    =  004802 
    NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD     |     NWDGOPT_=  FFFFFFFC 
    NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE     |   5 NonHandl   000009 R
  5 ODR        001C15 R   |     OP      =  000005     |     OPT     =  000002 
    OPT0    =  004800     |     OPT1    =  004801     |     OPT2    =  004803 
    OPT3    =  004805     |     OPT4    =  004807     |     OPT5    =  004809 
    OPT6    =  00480B     |     OPT7    =  00480D     |     OPTBL   =  00487E 
    OPTION_B=  004800     |     OPTION_E=  00487F     |     OPTION_S=  000080 
    OUTPUT_F=  000001     |     OUTPUT_O=  000000     |     OUTPUT_P=  000001 
    OUTPUT_S=  000000     |     OVFH    =  000001     |     OVFL    =  000002 
    PA      =  000000     |     PAD_SIZE=  000028     |   5 PAUSE      001C9B R
    PA_BASE =  005000     |     PA_CR1  =  005003     |     PA_CR2  =  005004 
    PA_DDR  =  005002     |     PA_IDR  =  005001     |     PA_ODR  =  005000 
    PB      =  000005     |     PB_BASE =  005005     |     PB_CR1  =  005008 
    PB_CR2  =  005009     |     PB_DDR  =  005007     |     PB_IDR  =  005006 
    PB_ODR  =  005005     |     PC      =  00000A     |     PC_BASE =  00500A 
    PC_CR1  =  00500D     |     PC_CR2  =  00500E     |     PC_DDR  =  00500C 
    PC_IDR  =  00500B     |     PC_ODR  =  00500A     |     PD      =  00000F 
    PD_BASE =  00500F     |     PD_CR1  =  005012     |     PD_CR2  =  005013 
    PD_DDR  =  005011     |     PD_IDR  =  005010     |     PD_ODR  =  00500F 
    PE      =  000014     |   5 PEEK       001D30 R   |     PE_BASE =  005014 
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
  5 POKE       001D39 R   |     PREV    =  000001     |   5 PRINT      001CD5 R
    PROD    =  000002     |     PSIZE   =  000001     |   5 QKEY       001C57 R
    RAM_BASE=  000000     |     RAM_END =  0017FF     |     RAM_SIZE=  001800 
  5 REG_A      0007F9 R   |   5 REG_CC     0007FD R   |   5 REG_EPC    0007EC R
  5 REG_SP     000802 R   |   5 REG_X      0007F5 R   |   5 REG_Y      0007F1 R
    RELOP   =  000005     |   5 REMARK     001CCA R   |     RETL1   =  000001 
  5 RETURN     001D25 R   |   5 RND        001C93 R   |     ROP     =  004800 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]

Symbol Table

    RST_SR  =  0050B3     |   5 RUN        001BE6 R   |     RXCHAR  =  000001 
    R_A     =  000007     |     R_CC    =  000008     |     R_X     =  000005 
    R_Y     =  000003     |   5 SAVE       001BAF R   |     SDIVD   =  000002 
    SFR_BASE=  005000     |     SFR_END =  0057FF     |     SHARP   =  000023 
  5 SHOW       001BDD R   |     SIGN    =  000001     |   5 SIZE       001C68 R
    SKIP    =  000006     |   5 SLEEP      001B89 R   |     SPACE   =  000020 
    SPI_CR1 =  005200     |     SPI_CR2 =  005201     |     SPI_CRCP=  005205 
    SPI_DR  =  005204     |     SPI_ICR =  005202     |     SPI_RXCR=  005206 
    SPI_SR  =  005203     |     SPI_TXCR=  005207     |     SQUOT   =  000001 
    SRC     =  000003     |     STACK_EM=  0017FF     |     STACK_SI=  000080 
  5 STATES     0007AF R   |   5 STEP       001D08 R   |   5 STOP       001BD4 R
    SWIM_CSR=  007F80     |     TAB     =  000009     |     TAB_WIDT=  000004 
    TCHAR   =  000001     |     TEMP    =  000003     |     TIB_SIZE=  000050 
    TICK    =  000027     |   5 TICKS      001C81 R   |     TIM1_ARR=  005262 
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
    TIM1_SMC=  000006     |     TIM1_SR1=  005255     |     TIM1_SR1=  000007 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]

Symbol Table

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
    TK_VAR  =  000002     |   5 TO         001D01 R   |   5 Timer4Up   000019 R
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
    UART_BRR=  000003     |     UART_CR1=  000004     |     UART_CR1=  000004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

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
    UBC     =  004801     |   5 UBOUND     001D1A R   |   5 UFLASH     001C0A R
  5 USER_ABO   00007E R   |   5 USR        001BF7 R   |     USR_BTN_=  000004 
    USR_BTN_=  000010     |     USR_BTN_=  005015     |   5 UserButt   000025 R
    VSIZ    =  000002     |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       001CC1 R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |   5 WRITE      001BB8 R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XMASK   =  000001     |     XSAVE   =  000001 
    YSAVE   =  000003     |   5 abs        001AEB R   |   1 acc16      000009 R
  1 acc24      000008 R   |   1 acc8       00000A R   |   5 accept_c   0009A7 R
  5 add        000F6B R   |   5 ansi_seq   000965 R   |   5 arg_list   00107B R
  1 array_ad   000020 R   |   1 array_si   000022 R   |   5 ascii      0019F6 R
  5 at_tst     000CA2 R   |   5 atoi24     000DB7 R   |   5 atoi_exi   000E25 R
  5 bad_port   001A67 R   |   1 base       000007 R   |   1 basicptr   000003 R
  5 bin_exit   000B9A R   |   5 bit_rese   001451 R   |   5 bit_set    00143D R
  5 bit_togg   001466 R   |   5 bkslsh_t   000C4D R   |   5 bksp       0001BA R
  5 break      001689 R   |   5 break_po   0016BA R   |   5 bye        001ABE R
  5 char       0019D9 R   |   5 clear_ba   0004DA R   |   5 clear_va   0003EA R
  5 clock_in   000099 R   |   5 cmd_itf    0009CB R   |   5 cmp_name   001759 R
  5 cold_sta   00044F R   |   5 colon_ts   000C76 R   |   5 comma_ts   000C81 R
  5 convert_   000B00 R   |   1 count      000002 R   |   5 cp_loop    001027 R
  5 create_g   00033F R   |   5 cstk_pro   000F35 R   |   5 dash_tst   000C97 R
  5 ddrop      000EB1 R   |   5 ddrop_n    000EEE R   |   5 ddup       000EBA R
  5 dec_base   001223 R   |   5 del_back   000998 R   |   5 del_line   000310 R
  5 del_ln     000989 R   |   5 delete     0001CA R   |   5 dir_loop   001919 R
  5 director   00190D R   |   5 divide     000FC1 R   |   5 divu24_8   0008F2 R
  5 dotr       000F3E R   |   5 dotr_loo   000F53 R   |   5 dots       000F0B R
  5 dpick      000ECB R   |   5 dpop       000E8A R   |   5 dpush      000E7D R
  5 drive_fr   001995 R   |   3 dstack     001740 R   |   3 dstack_u   001780 R
  5 dstk_pro   000F01 R   |   1 dstkptr    000019 R   |   5 dswap      000E97 R
  5 eeprom     001A90 R   |   5 eql_tst    000D04 R   |   5 err_bad_   0005BB R
  5 err_cmd_   00057C R   |   5 err_div0   00053E R   |   5 err_dupl   000597 R
  5 err_math   000524 R   |   5 err_mem_   000507 R   |   5 err_msg    0004EF R
  5 err_no_a   0005C8 R   |   5 err_no_l   00054E R   |   5 err_not_   0005A9 R
  5 err_run_   000565 R   |   5 err_synt   000515 R   |   5 expect     00106E R
  5 expr_exi   0011B4 R   |   5 expressi   001173 R   |   5 factor     0010D2 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

  1 farptr     000013 R   |   7 fdrive     010000 R   |   5 fetch      000EDA R
  5 fetchc     000AB8 R   |   1 ffree      000016 R   |   5 file_cou   00198D R
  5 final_te   00095F R   |   5 first_li   001293 R   |   1 flags      000024 R
  5 for        0014BE R   |   5 forget     0018BE R   |   1 free_ram   00005A R
  5 get_arra   00109F R   |   5 get_tick   001AE5 R   |   5 get_toke   000BE7 R
  5 getc       0001A7 R   |   5 go_commo   0015E5 R   |   5 gosub      0015C2 R
  5 goto       0015B5 R   |   5 gpio       001A2C R   |   5 gt_tst     000D0F R
  5 hex_base   00121E R   |   5 hse_cloc   000187 R   |   5 hsi_cloc   000191 R
  5 if         0014AA R   |   1 in         000001 R   |   1 in.w       000000 R
  1 in.w.sav   000011 R   |   5 incr_far   0016E3 R   |   5 input_ex   00140E R
  5 input_lo   0013A9 R   |   5 input_va   00139D R   |   5 insert_l   000370 R
  5 insert_l   0003E7 R   |   5 interp     000678 R   |   5 interp_l   0006BE R
  5 invalid    000A10 R   |   5 invalid_   000A8E R   |   5 is_alpha   0003F8 R
  5 is_digit   000DA2 R   |   5 itoa       0008AB R   |   5 itoa_loo   0008C3 R
  5 key        001A1A R   |   5 kword_di   001D4A R   |   5 kword_en   001B7F R
  5 last_lin   00129C R   |   5 ledoff     0006FF R   |   5 ledon      0006FA R
  5 ledtoggl   000704 R   |   5 left_arr   000965 R   |   5 left_par   00070D R
  5 let        001240 R   |   5 let02      00124A R   |   1 lineno     000005 R
  5 lines_sk   0012A1 R   |   5 list       001268 R   |   5 list_exi   0012EB R
  5 list_sta   0012C4 R   |   5 load       001861 R   |   5 loop_bac   001588 R
  1 loop_dep   00001F R   |   5 loop_don   0015A3 R   |   5 lt_tst     000D48 R
  5 mem_peek   000A2D R   |   5 modulo     001005 R   |   5 move       00029E R
  5 move_dow   0002BC R   |   5 move_exi   0002DE R   |   5 move_loo   0002C1 R
  5 move_up    0002AE R   |   5 multiply   000F79 R   |   5 mulu24_8   000E29 R
  5 nbr_tst    000C23 R   |   5 neg_acc2   00091A R   |   5 new        0016D8 R
  5 next       001540 R   |   5 no_match   001039 R   |   5 none       000BE7 R
  5 number     000ABE GR  |   5 other      000D80 R   |   3 pad        001718 R
  5 parse_bi   000B7A R   |   5 parse_in   000B3F R   |   5 parse_ke   000BA2 R
  5 parse_qu   000AC5 R   |   5 pause      001AD2 R   |   5 pause02    001ADC R
  5 peek       00148D R   |   5 peek_byt   000A58 R   |   5 plus_tst   000CD8 R
  5 poke       00147A R   |   5 port_cr1   001A7E R   |   5 port_cr2   001A84 R
  5 port_ddr   001A78 R   |   5 port_idr   001A72 R   |   5 port_odr   001A6C R
  5 prcnt_ts   000CF9 R   |   5 print      00130C R   |   5 print_ex   001367 R
  5 print_fa   000A9D R   |   5 print_in   00084F R   |   5 print_re   00075C R
  5 print_st   000A20 R   |   5 prt_basi   0012EE R   |   5 prt_loop   001310 R
  5 prt_peek   00024E R   |   5 prt_reg1   00073D R   |   5 prt_reg8   000718 R
  5 prt_regs   0001E4 R   |   5 prti24     000807 R   |   5 putc       00019E R
  5 puts       0001B0 R   |   5 qkey       001A22 R   |   5 qmark_ts   000CAD R
  5 random     001B0B R   |   5 readln     00093D R   |   5 readln_l   000943 R
  5 readln_q   0009BC R   |   5 regs_sta   000227 R   |   5 rel_exit   00120B R
  5 relation   0011B7 R   |   5 rem        001411 R   |   5 repl       0009D9 R
  5 repl_exi   000A01 R   |   5 reprint    000965 R   |   5 reset_co   00130E R
  5 rest_con   001388 R   |   5 return     00160D R   |   5 right_ar   000965 R
  5 rparnt_t   000C6B R   |   5 run        001631 R   |   5 save       0017C4 R
  5 save_con   001373 R   |   5 search_d   001016 R   |   5 search_e   00106A R
  5 search_f   00177A R   |   5 search_l   0002E1 R   |   5 search_l   0002EC R
  5 search_n   00101A R   |   1 seedx      00000D R   |   1 seedy      00000F R
  5 seek_fdr   0016F1 R   |   5 sharp_ts   000C8C R   |   5 show       00120E R
  5 size       001228 R   |   5 skip       000E63 R   |   5 slash_ts   000CEE R
  5 sleep      001AC7 R   |   5 software   000409 R   |   5 spaces     0001D8 R
  3 stack_fu   001780 R   |   3 stack_un   001800 R   |   5 star_tst   000CE3 R
  5 step       001518 R   |   5 stop       00167A R   |   5 store      000EE4 R
  5 store_lo   00152A R   |   5 str_matc   001048 R   |   5 str_tst    000C12 R
  5 strcmp     00027F R   |   5 strcpy     000290 R   |   5 strlen     000272 R
  5 substrac   000F73 R   |   5 syntax_e   0005FC R   |   1 tab_widt   000025 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

  5 tb_error   0005FE R   |   5 term       001126 R   |   5 term01     00112F R
  5 term_exi   001170 R   |   5 test_p     000A18 R   |   3 tib        0016C8 R
  5 tick_tst   000CC4 R   |   1 ticks      00000B R   |   5 timer4_i   0000AF R
  5 to         0014E8 R   |   5 to_upper   000DAB GR  |   5 token_ch   000D8F R
  5 token_ex   000D9F R   |   1 txtbgn     00001B R   |   1 txtend     00001D R
  5 uart3_in   000174 R   |   5 uart3_se   000180 R   |   5 uart_ena   000199 R
  5 ubound     001232 R   |   5 uflash     001A8A R   |   5 unget_to   000E76 R
  5 unlock_e   0000C0 R   |   5 unlock_f   0000CE R   |   5 user_spa   001D80 R
  5 usr        001A96 R   |   1 vars       000026 R   |   5 wait       001412 R
  5 warm_sta   000658 R   |   5 write      0019A2 R   |   5 write_bl   000151 R
  5 write_by   0000DC R   |   5 write_ee   000118 R   |   5 write_ex   00014C R
  5 write_fl   000102 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
Hexadecimal [24-Bits]

Area Table

   0 _CODE      size      0   flags    0
   1 DATA       size     5A   flags    0
   2 SSEG       size      0   flags    8
   3 SSEG0      size    138   flags    8
   4 HOME       size     80   flags    0
   5 CODE       size   1D8E   flags    0
   6 FLASH_DR   size      0   flags    8
   7 FLASH_DR   size      0   flags    8

