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
      000014                         64 in.w.saved: .blkw 1 ; last parsed token value  
      000017                         65 farptr: .blkb 3 ; far pointer 
      00001A                         66 ffree: .blkb 3 ; flash free address 
      00001C                         67 dstkptr: .blkw 1  ; data stack pointer 
      00001E                         68 txtbgn: .ds 2 ; BASIC text beginning address 
      000020                         69 txtend: .ds 2 ; BASIC text end address 
      000021                         70 loop_depth: .ds 1 ; FOR loop depth 
      000023                         71 array_addr: .ds 2 ; address of @ array 
      000025                         72 array_size: .ds 2 ; array size 
      000026                         73 flags: .ds 1 ; boolean flags
      000027                         74 tab_width: .ds 1 ; print colon width (4)
      00005B                         75 vars: .ds 2*26 ; BASIC variables A-Z, keep it as but last .
                                     76 ; keep as last variable 
      0016C8                         77 free_ram: ; from here RAM free for BASIC text 
                                     78 
                                     79 ;-----------------------------------
                                     80     .area SSEG (ABS)
                                     81 ;-----------------------------------	
      0016C8                         82     .org RAM_SIZE-STACK_SIZE-TIB_SIZE-PAD_SIZE-DSTACK_SIZE 
      001718                         83 tib: .ds TIB_SIZE             ; transaction input buffer
      001740                         84 pad: .ds PAD_SIZE             ; working buffer
      001780                         85 dstack: .ds DSTACK_SIZE 
      001780                         86 dstack_unf: ; dstack underflow 
      001800                         87 stack_full: .ds STACK_SIZE   ; control stack 
      001800                         88 stack_unf: ; stack underflow  
                                     89 
                                     90 
                                     91 ;--------------------------------------
                                     92     .area HOME 
                                     93 ;--------------------------------------
      008000 82 00 85 64             94     int cold_start
                           000001    95 .if DEBUG
      008004 82 00 80 8A             96 	int TrapHandler 		;TRAP  software interrupt
                           000000    97 .else
                                     98 	int NonHandledInterrupt ;TRAP  software interrupt
                                     99 .endif
      008008 82 00 80 89            100 	int NonHandledInterrupt ;int0 TLI   external top level interrupt
      00800C 82 00 80 89            101 	int NonHandledInterrupt ;int1 AWU   auto wake up from halt
      008010 82 00 80 89            102 	int NonHandledInterrupt ;int2 CLK   clock controller
      008014 82 00 80 89            103 	int NonHandledInterrupt ;int3 EXTI0 gpio A external interrupts
      008018 82 00 80 89            104 	int NonHandledInterrupt ;int4 EXTI1 gpio B external interrupts
      00801C 82 00 80 89            105 	int NonHandledInterrupt ;int5 EXTI2 gpio C external interrupts
      008020 82 00 80 89            106 	int NonHandledInterrupt ;int6 EXTI3 gpio D external interrupts
      008024 82 00 80 A5            107 	int UserButtonHandler   ;int7 EXTI4 gpio E external interrupts
      008028 82 00 80 89            108 	int NonHandledInterrupt ;int8 beCAN RX interrupt
      00802C 82 00 80 89            109 	int NonHandledInterrupt ;int9 beCAN TX/ER/SC interrupt
      008030 82 00 80 89            110 	int NonHandledInterrupt ;int10 SPI End of transfer
      008034 82 00 80 89            111 	int NonHandledInterrupt ;int11 TIM1 update/overflow/underflow/trigger/break
      008038 82 00 80 89            112 	int NonHandledInterrupt ;int12 TIM1 capture/compare
      00803C 82 00 80 89            113 	int NonHandledInterrupt ;int13 TIM2 update /overflow
      008040 82 00 80 89            114 	int NonHandledInterrupt ;int14 TIM2 capture/compare
      008044 82 00 80 89            115 	int NonHandledInterrupt ;int15 TIM3 Update/overflow
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 3.
Hexadecimal [24-Bits]



      008048 82 00 80 89            116 	int NonHandledInterrupt ;int16 TIM3 Capture/compare
      00804C 82 00 80 89            117 	int NonHandledInterrupt ;int17 UART1 TX completed
      008050 82 00 80 89            118 	int NonHandledInterrupt ;int18 UART1 RX full
      008054 82 00 80 89            119 	int NonHandledInterrupt ;int19 I2C 
      008058 82 00 80 89            120 	int NonHandledInterrupt ;int20 UART3 TX completed
      00805C 82 00 80 89            121 	int NonHandledInterrupt ;int21 UART3 RX full
      008060 82 00 80 89            122 	int NonHandledInterrupt ;int22 ADC2 end of conversion
      008064 82 00 80 99            123 	int Timer4UpdateHandler	;int23 TIM4 update/overflow
      008068 82 00 80 89            124 	int NonHandledInterrupt ;int24 flash writing EOP/WR_PG_DIS
      00806C 82 00 80 89            125 	int NonHandledInterrupt ;int25  not used
      008070 82 00 80 89            126 	int NonHandledInterrupt ;int26  not used
      008074 82 00 80 89            127 	int NonHandledInterrupt ;int27  not used
      008078 82 00 80 89            128 	int NonHandledInterrupt ;int28  not used
      00807C 82 00 80 89            129 	int NonHandledInterrupt ;int29  not used
                                    130 
                                    131 ;---------------------------------------
                                    132     .area CODE
                                    133 ;---------------------------------------
                           000001   134 .if DEBUG
      008080 54 42 49 5F 53 54 4D   135 .asciz "TBI_STM8" ; I like to put module name here.
             38 00
                                    136 .endif 
                                    137 
      008089                        138 NonHandledInterrupt:
      008089 71                     139     .byte 0x71  ; reinitialize MCU
                                    140 
                                    141 
                                    142 ;------------------------------------
                                    143 ; software interrupt handler  
                                    144 ;------------------------------------
                           000001   145 .if DEBUG 
      00808A                        146 TrapHandler:
      00808A 72 12 00 25      [ 1]  147 	bset flags,#FTRAP 
      00808E CD 88 9D         [ 4]  148 	call print_registers
      008091 CD 8B 1F         [ 4]  149 	call cmd_itf
      008094 72 13 00 25      [ 1]  150 	bres flags,#FTRAP 	
      008098 80               [11]  151 	iret
                                    152 .endif 
                                    153 
      008099                        154 Timer4UpdateHandler:
      008099 72 5F 53 42      [ 1]  155 	clr TIM4_SR 
      00809D CE 00 0C         [ 2]  156 	ldw x,ticks
      0080A0 5C               [ 1]  157 	incw x
      0080A1 CF 00 0C         [ 2]  158 	ldw ticks,x 
      0080A4 80               [11]  159 	iret 
                                    160 
                                    161 
                                    162 ;------------------------------------
                                    163 ; Triggered by pressing USER UserButton 
                                    164 ; on NUCLEO card.
                                    165 ;------------------------------------
      0080A5                        166 UserButtonHandler:
                                    167 ; wait button release
      0080A5 5F               [ 1]  168 	clrw x
      0080A6 5A               [ 2]  169 1$: decw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 4.
Hexadecimal [24-Bits]



      0080A7 26 FD            [ 1]  170 	jrne 1$
      0080A9 72 09 50 15 F8   [ 2]  171 	btjf USR_BTN_PORT,#USR_BTN_BIT, 1$
      0080AE 72 07 00 25 05   [ 2]  172     btjf flags,#FSLEEP,2$
      0080B3 72 17 00 25      [ 1]  173 	bres flags,#FSLEEP 
      0080B7 80               [11]  174 	iret
      0080B8 72 00 00 25 03   [ 2]  175 2$:	btjt flags,#FRUN,4$
      0080BD CC 80 FB         [ 2]  176 	jp 9$ 
      0080C0 72 11 00 25      [ 1]  177 4$:	bres flags,#FRUN 
      0080C4 AE 81 03         [ 2]  178 	ldw x,#USER_ABORT
      0080C7 CD 82 B0         [ 4]  179 	call puts 
      0080CA CE 00 04         [ 2]  180 	ldw x,basicptr
      0080CD FE               [ 2]  181 	ldw x,(x)
      0080CE CF 00 0A         [ 2]  182 	ldw acc16,x 
      0080D1 72 5F 00 09      [ 1]  183 	clr acc24 
      0080D5 5F               [ 1]  184 	clrw x 
      0080D6 A6 05            [ 1]  185 	ld a,#5
      0080D8 97               [ 1]  186 	ld xl,a 
      0080D9 A6 0A            [ 1]  187 	ld a,#10 
      0080DB CD 89 4E         [ 4]  188 	call prti24
      0080DE CE 00 04         [ 2]  189 	ldw x,basicptr 
      0080E1 1C 00 03         [ 2]  190 	addw x,#3  
      0080E4 CD 82 B0         [ 4]  191 	call puts 
      0080E7 A6 0D            [ 1]  192 	ld a,#CR 
      0080E9 CD 82 9E         [ 4]  193 	call putc
      0080EC 5F               [ 1]  194 	clrw x  
      0080ED C6 00 02         [ 1]  195 	ld a,in 
      0080F0 AB 02            [ 1]  196 	add a,#2 ; adjustment for line number display 
      0080F2 97               [ 1]  197 	ld xl,a 
      0080F3 CD 82 D8         [ 4]  198 	call spaces 
      0080F6 A6 5E            [ 1]  199 	ld a,#'^
      0080F8 CD 82 9E         [ 4]  200 	call putc 
      0080FB                        201 9$:
      0080FB AE 17 FF         [ 2]  202     ldw x,#STACK_EMPTY 
      0080FE 94               [ 1]  203     ldw sp,x
      0080FF 9A               [ 1]  204 	rim 
      008100 CC 87 81         [ 2]  205 	jp warm_start
                                    206 
                                    207 
      008103 0A 50 72 6F 67 72 61   208 USER_ABORT: .asciz "\nProgram aborted by user.\n"
             6D 20 61 62 6F 72 74
             65 64 20 62 79 20 75
             73 65 72 2E 0A 00
                                    209 
                                    210 
                                    211 ;----------------------------------------
                                    212 ; inialize MCU clock 
                                    213 ; input:
                                    214 ;   A 		source  HSI | 1 HSE 
                                    215 ;   XL      CLK_CKDIVR , clock divisor 
                                    216 ; output:
                                    217 ;   none 
                                    218 ;----------------------------------------
      00811E                        219 clock_init:	
      00811E C1 50 C3         [ 1]  220 	cp a,CLK_CMSR 
      008121 27 0C            [ 1]  221 	jreq 2$ ; no switching required 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 5.
Hexadecimal [24-Bits]



                                    222 ; select clock source 
      008123 72 12 50 C5      [ 1]  223 	bset CLK_SWCR,#CLK_SWCR_SWEN
      008127 C7 50 C4         [ 1]  224 	ld CLK_SWR,a
      00812A C1 50 C3         [ 1]  225 1$:	cp a,CLK_CMSR
      00812D 26 FB            [ 1]  226 	jrne 1$
      00812F                        227 2$: 	
                                    228 ; HSI and cpu clock divisor 
      00812F 9F               [ 1]  229 	ld a,xl 
      008130 C7 50 C6         [ 1]  230 	ld CLK_CKDIVR,a  
      008133 81               [ 4]  231 	ret
                                    232 
                                    233 ;---------------------------------
                                    234 ; TIM4 is configured to generate an 
                                    235 ; interrupt every millisecond 
                                    236 ;----------------------------------
      008134                        237 timer4_init:
      008134 35 07 53 45      [ 1]  238 	mov TIM4_PSCR,#7 ; prescale 128  
      008138 35 7D 53 46      [ 1]  239 	mov TIM4_ARR,#125 ; set for 1msec.
      00813C 35 05 53 40      [ 1]  240 	mov TIM4_CR1,#((1<<TIM4_CR1_CEN)|(1<<TIM4_CR1_URS))
      008140 72 10 53 41      [ 1]  241 	bset TIM4_IER,#TIM4_IER_UIE 
      008144 81               [ 4]  242 	ret
                                    243 
                                    244 ;----------------------------------
                                    245 ; unlock EEPROM for writing/erasing
                                    246 ; wait endlessly for FLASH_IAPSR_DUL bit.
                                    247 ; input:
                                    248 ;  none
                                    249 ; output:
                                    250 ;  none 
                                    251 ;----------------------------------
      008145                        252 unlock_eeprom:
      008145 35 AE 50 64      [ 1]  253 	mov FLASH_DUKR,#FLASH_DUKR_KEY1
      008149 35 56 50 64      [ 1]  254     mov FLASH_DUKR,#FLASH_DUKR_KEY2
      00814D 72 07 50 5F FB   [ 2]  255 	btjf FLASH_IAPSR,#FLASH_IAPSR_DUL,.
      008152 81               [ 4]  256 	ret
                                    257 
                                    258 ;----------------------------------
                                    259 ; unlock FLASH for writing/erasing
                                    260 ; wait endlessly for FLASH_IAPSR_PUL bit.
                                    261 ; input:
                                    262 ;  none
                                    263 ; output:
                                    264 ;  none
                                    265 ;----------------------------------
      008153                        266 unlock_flash:
      008153 35 56 50 62      [ 1]  267 	mov FLASH_PUKR,#FLASH_PUKR_KEY1
      008157 35 AE 50 62      [ 1]  268 	mov FLASH_PUKR,#FLASH_PUKR_KEY2
      00815B 72 03 50 5F FB   [ 2]  269 	btjf FLASH_IAPSR,#FLASH_IAPSR_PUL,.
      008160 81               [ 4]  270 	ret
                                    271 
                                    272 ;----------------------------
                                    273 ; erase block code must be 
                                    274 ;executed from RAM
                                    275 ;-----------------------------
                                    276 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 6.
Hexadecimal [24-Bits]



                                    277 ; this code is copied to RAM 
      008161                        278 erase_start:
      008161 4F               [ 1]  279 	clr a 
      008162 72 1A 50 5B      [ 1]  280     bset FLASH_CR2,#FLASH_CR2_ERASE
      008166 72 1B 50 5C      [ 1]  281     bres FLASH_NCR2,#FLASH_CR2_ERASE
      00816A 92 BD 00 14      [ 4]  282 	ldf [farptr],a
      00816E 72 5C 00 16      [ 1]  283     inc farptr+2 
      008172 92 BD 00 14      [ 4]  284     ldf [farptr],a
      008176 72 5C 00 16      [ 1]  285     inc farptr+2 
      00817A 92 BD 00 14      [ 4]  286     ldf [farptr],a
      00817E 72 5C 00 16      [ 1]  287     inc farptr+2 
      008182 92 BD 00 14      [ 4]  288     ldf [farptr],a
      008186 72 05 50 5F FB   [ 2]  289 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00818B 81               [ 4]  290 	ret
      00818C                        291 erase_end:
                                    292 
                                    293 
      00818C                        294 move_code_in_ram:
      00818C AE 81 8C         [ 2]  295 	ldw x,#erase_end 
      00818F 1D 81 61         [ 2]  296 	subw x,#erase_start
      008192 CF 00 0A         [ 2]  297 	ldw acc16,x 
      008195 AE 17 18         [ 2]  298 	ldw x,#pad 
      008198 90 AE 81 61      [ 2]  299 	ldw y,#erase_start 
      00819C CD 83 9E         [ 4]  300 	call move 
      00819F 81               [ 4]  301 	ret 
                                    302 
                                    303 ;-----------------------------------
                                    304 ; erase flash or EEPROM block 
                                    305 ; a block is 128 bytes 
                                    306 ; input:
                                    307 ;   farptr  address block begin
                                    308 ; output:
                                    309 ;   none
                                    310 ;--------------------------------------
      0081A0                        311 erase_block:
      0081A0 CE 00 15         [ 2]  312 	ldw x,farptr+1 
      0081A3 89               [ 2]  313 	pushw x 
      0081A4 CD 81 8C         [ 4]  314 	call move_code_in_ram 
      0081A7 85               [ 2]  315 	popw x 
      0081A8 CF 00 15         [ 2]  316 	ldw farptr+1,x 
      0081AB 72 5D 00 14      [ 1]  317 	tnz farptr
      0081AF 26 15            [ 1]  318 	jrne erase_flash 
      0081B1 AE 80 00         [ 2]  319 	ldw x,#FLASH_BASE 
      0081B4 C3 00 15         [ 2]  320 	cpw x,farptr+1 
      0081B7 2A 0D            [ 1]  321 	jrpl erase_flash 
                                    322 ; erase eeprom block
      0081B9 CD 81 45         [ 4]  323 	call unlock_eeprom 
      0081BC 9B               [ 1]  324 	sim 
      0081BD CD 81 61         [ 4]  325 	call erase_start  
      0081C0 72 17 50 5F      [ 1]  326 	bres FLASH_IAPSR,#FLASH_IAPSR_DUL
      0081C4 9A               [ 1]  327 	rim 
      0081C5 81               [ 4]  328 	ret 
                                    329 ; erase flash block:
      0081C6                        330 erase_flash:
      0081C6 CD 81 53         [ 4]  331 	call unlock_flash 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 7.
Hexadecimal [24-Bits]



      0081C9 72 1A 50 5B      [ 1]  332 	bset FLASH_CR2,#FLASH_CR2_ERASE
      0081CD 72 1B 50 5C      [ 1]  333 	bres FLASH_NCR2,#FLASH_CR2_ERASE
      0081D1 4F               [ 1]  334 	clr a 
      0081D2 9B               [ 1]  335 	sim 
      0081D3 CD 17 18         [ 4]  336 	call pad 
      0081D6 72 13 50 5F      [ 1]  337     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      0081DA 9A               [ 1]  338 	rim 
      0081DB 81               [ 4]  339 	ret 
                                    340 
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
      0081DC                        356 write_byte:
      0081DC 90 89            [ 2]  357 	pushw y
      00015E                        358 	_vars VSIZE
      0081DE 52 02            [ 2]    1     sub sp,#VSIZE 
      0081E0 6B 01            [ 1]  359 	ld (BTW,sp),a ; byte to write 
      0081E2 0F 02            [ 1]  360 	clr (OPT,sp)  ; OPTION flag
                                    361 ; put addr[15:0] in Y, for bounds check.
      0081E4 90 CE 00 15      [ 2]  362 	ldw y,farptr+1   ; Y=addr15:0
                                    363 ; check addr[23:16], if <> 0 then it is extened flash memory
      0081E8 72 5D 00 14      [ 1]  364 	tnz farptr 
      0081EC 26 14            [ 1]  365 	jrne write_flash
      0081EE 90 A3 9E 80      [ 2]  366     cpw y,#user_space
      0081F2 24 0E            [ 1]  367     jruge write_flash
      0081F4 90 A3 40 00      [ 2]  368 	cpw y,#EEPROM_BASE  
      0081F8 25 52            [ 1]  369     jrult write_exit
      0081FA 90 A3 48 00      [ 2]  370 	cpw y,#OPTION_BASE
      0081FE 25 18            [ 1]  371 	jrult write_eeprom
      008200 20 4A            [ 2]  372     jra write_exit
                                    373 ; write program memory
      008202                        374 write_flash:
      008202 CD 81 53         [ 4]  375 	call unlock_flash 
      008205 9B               [ 1]  376 1$:	sim 
      008206 7B 01            [ 1]  377 	ld a,(BTW,sp)
      008208 92 A7 00 14      [ 4]  378 	ldf ([farptr],x),a ; farptr[x]=A
      00820C 72 05 50 5F FB   [ 2]  379 	btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      008211 9A               [ 1]  380     rim 
      008212 72 13 50 5F      [ 1]  381     bres FLASH_IAPSR,#FLASH_IAPSR_PUL
      008216 20 34            [ 2]  382     jra write_exit
                                    383 ; write eeprom and option
      008218                        384 write_eeprom:
      008218 CD 81 45         [ 4]  385 	call unlock_eeprom
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 8.
Hexadecimal [24-Bits]



                                    386 	; check for data eeprom or option eeprom
      00821B 90 A3 48 00      [ 2]  387 	cpw y,#OPTION_BASE
      00821F 2B 08            [ 1]  388 	jrmi 1$
      008221 90 A3 48 80      [ 2]  389 	cpw y,#OPTION_END+1
      008225 2A 02            [ 1]  390 	jrpl 1$
      008227 03 02            [ 1]  391 	cpl (OPT,sp)
      008229                        392 1$: 
      008229 0D 02            [ 1]  393     tnz (OPT,sp)
      00822B 27 08            [ 1]  394     jreq 2$
                                    395 	; pour modifier une option il faut modifier ces 2 bits
      00822D 72 1E 50 5B      [ 1]  396     bset FLASH_CR2,#FLASH_CR2_OPT
      008231 72 1F 50 5C      [ 1]  397     bres FLASH_NCR2,#FLASH_CR2_OPT 
      008235                        398 2$: 
      008235 7B 01            [ 1]  399     ld a,(BTW,sp)
      008237 92 A7 00 14      [ 4]  400     ldf ([farptr],x),a
      00823B 0D 02            [ 1]  401     tnz (OPT,sp)
      00823D 27 08            [ 1]  402     jreq 3$
      00823F 5C               [ 1]  403     incw x
      008240 7B 01            [ 1]  404     ld a,(BTW,sp)
      008242 43               [ 1]  405     cpl a
      008243 92 A7 00 14      [ 4]  406     ldf ([farptr],x),a
      008247 72 05 50 5F FB   [ 2]  407 3$: btjf FLASH_IAPSR,#FLASH_IAPSR_EOP,.
      00824C                        408 write_exit:
      0001CC                        409 	_drop VSIZE 
      00824C 5B 02            [ 2]    1     addw sp,#VSIZE 
      00824E 90 85            [ 2]  410 	popw y
      008250 81               [ 4]  411     ret
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
      008251                        425 	_argofs 2 
                           000004     1     ARG_OFS=2+2 
      0001D1                        426 	_arg BSIZE 1  ; block size
                           000005     1     BSIZE=ARG_OFS+1 
                                    427 	; local var 
                           000001   428 	XSAVE=1 
                           000002   429 	VSIZE=2 
      0001D1                        430 write_block:
      0001D1                        431 	_vars VSIZE
      008251 52 02            [ 2]    1     sub sp,#VSIZE 
      008253 1F 01            [ 2]  432 	ldw (XSAVE,sp),x 
      008255 1E 05            [ 2]  433 	ldw x,(BSIZE,sp) 
      008257 27 13            [ 1]  434 	jreq 9$
      008259 1E 01            [ 2]  435 1$:	ldw x,(XSAVE,sp)
      00825B 90 F6            [ 1]  436 	ld a,(y)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 9.
Hexadecimal [24-Bits]



      00825D CD 81 DC         [ 4]  437 	call write_byte 
      008260 5C               [ 1]  438 	incw x 
      008261 90 5C            [ 1]  439 	incw y 
      008263 1F 01            [ 2]  440 	ldw (XSAVE,sp),x
      008265 1E 05            [ 2]  441 	ldw x,(BSIZE,sp)
      008267 5A               [ 2]  442 	decw x
      008268 1F 05            [ 2]  443 	ldw (BSIZE,sp),x 
      00826A 26 ED            [ 1]  444 	jrne 1$
      00826C                        445 9$:
      00826C 1E 01            [ 2]  446 	ldw x,(XSAVE,sp)
      00826E CD 97 F6         [ 4]  447 	call incr_farptr
      0001F1                        448 	_drop VSIZE
      008271 5B 02            [ 2]    1     addw sp,#VSIZE 
      008273 81               [ 4]  449 	ret 
                                    450 
                                    451 
                                    452 
                                    453 ;---------------------------------------------
                                    454 ;   UART3 subroutines
                                    455 ;---------------------------------------------
                                    456 
                                    457 ;---------------------------------------------
                                    458 ; initialize UART3, 115200 8N1
                                    459 ; input:
                                    460 ;	none
                                    461 ; output:
                                    462 ;   none
                                    463 ;---------------------------------------------
      008274                        464 uart3_init:
                                    465 	; configure tx pin
      008274 72 1A 50 11      [ 1]  466 	bset PD_DDR,#BIT5 ; tx pin
      008278 72 1A 50 12      [ 1]  467 	bset PD_CR1,#BIT5 ; push-pull output
      00827C 72 1A 50 13      [ 1]  468 	bset PD_CR2,#BIT5 ; fast output
      008280                        469 uart3_set_baud: 
                                    470 ; baud rate 115200 Fmaster=8Mhz  8000000/115200=69=0x45
                                    471 ; 1) check clock source, HSI at 16Mhz or HSE at 8Mhz  
      008280 A6 E1            [ 1]  472 	ld a,#CLK_SWR_HSI
      008282 C1 50 C3         [ 1]  473 	cp a,CLK_CMSR 
      008285 27 0A            [ 1]  474 	jreq hsi_clock 
      008287                        475 hse_clock: ; 8 Mhz 	
      008287 35 05 52 43      [ 1]  476 	mov UART3_BRR2,#0x05 ; must be loaded first
      00828B 35 04 52 42      [ 1]  477 	mov UART3_BRR1,#0x4
      00828F 20 08            [ 2]  478 	jra uart_enable
      008291                        479 hsi_clock: ; 16 Mhz 	
      008291 35 0B 52 43      [ 1]  480 	mov UART3_BRR2,#0x0b ; must be loaded first
      008295 35 08 52 42      [ 1]  481 	mov UART3_BRR1,#0x08
      008299                        482 uart_enable:	
      008299 35 0C 52 45      [ 1]  483 	mov UART3_CR2,#((1<<UART_CR2_TEN)|(1<<UART_CR2_REN));
      00829D 81               [ 4]  484 	ret
                                    485 	
                                    486 ;---------------------------------
                                    487 ; send character to UART3 
                                    488 ; input:
                                    489 ;   A 
                                    490 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 10.
Hexadecimal [24-Bits]



                                    491 ;   none 
                                    492 ;--------------------------------	
      00829E                        493 putc:
      00829E 72 0F 52 40 FB   [ 2]  494 	btjf UART3_SR,#UART_SR_TXE,.
      0082A3 C7 52 41         [ 1]  495 	ld UART3_DR,a 
      0082A6 81               [ 4]  496 	ret 
                                    497 
                                    498 ;---------------------------------
                                    499 ; wait character from UART3 
                                    500 ; input:
                                    501 ;   none
                                    502 ; output:
                                    503 ;   A 			char  
                                    504 ;--------------------------------	
      0082A7                        505 getc:
      0082A7 72 0B 52 40 FB   [ 2]  506 	btjf UART3_SR,#UART_SR_RXNE,.
      0082AC C6 52 41         [ 1]  507 	ld a,UART3_DR 
      0082AF 81               [ 4]  508 	ret 
                                    509 
                                    510 ;-----------------------------
                                    511 ; send an ASCIZ string to UART3 
                                    512 ; input: 
                                    513 ;   x 		char * 
                                    514 ; output:
                                    515 ;   none 
                                    516 ;-------------------------------
      0082B0                        517 puts:
      0082B0 F6               [ 1]  518     ld a,(x)
      0082B1 27 06            [ 1]  519 	jreq 1$
      0082B3 CD 82 9E         [ 4]  520 	call putc 
      0082B6 5C               [ 1]  521 	incw x 
      0082B7 20 F7            [ 2]  522 	jra puts 
      0082B9 81               [ 4]  523 1$:	ret 
                                    524 
                                    525 
                                    526 ;---------------------------
                                    527 ; delete character at left 
                                    528 ; of cursor on terminal 
                                    529 ; input:
                                    530 ;   none 
                                    531 ; output:
                                    532 ;	none 
                                    533 ;---------------------------
      0082BA                        534 bksp:
      0082BA A6 08            [ 1]  535 	ld a,#BSP 
      0082BC CD 82 9E         [ 4]  536 	call putc 
      0082BF A6 20            [ 1]  537 	ld a,#SPACE 
      0082C1 CD 82 9E         [ 4]  538 	call putc 
      0082C4 A6 08            [ 1]  539 	ld a,#BSP 
      0082C6 CD 82 9E         [ 4]  540 	call putc 
      0082C9 81               [ 4]  541 	ret 
                                    542 ;---------------------------
                                    543 ; delete n character left of cursor 
                                    544 ; at terminal.
                                    545 ; input: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 11.
Hexadecimal [24-Bits]



                                    546 ;   A   	number of characters to delete.
                                    547 ; output:
                                    548 ;    none 
                                    549 ;--------------------------	
      0082CA                        550 delete:
      0082CA 88               [ 1]  551 	push a 
      0082CB 0D 01            [ 1]  552 0$:	tnz (1,sp)
      0082CD 27 07            [ 1]  553 	jreq 1$
      0082CF CD 82 BA         [ 4]  554 	call bksp 
      0082D2 0A 01            [ 1]  555 	dec (1,sp)
      0082D4 20 F5            [ 2]  556 	jra 0$
      0082D6 84               [ 1]  557 1$:	pop a 
      0082D7 81               [ 4]  558 	ret
                                    559 
                                    560 ;--------------------------
                                    561 ; print n spaces on terminal
                                    562 ; input:
                                    563 ;  X 		number of spaces 
                                    564 ; output:
                                    565 ;	none 
                                    566 ;---------------------------
      0082D8                        567 spaces:
      0082D8 A6 20            [ 1]  568 	ld a,#SPACE 
      0082DA 5D               [ 2]  569 1$:	tnzw x
      0082DB 27 06            [ 1]  570 	jreq 9$
      0082DD CD 82 9E         [ 4]  571 	call putc 
      0082E0 5A               [ 2]  572 	decw x
      0082E1 20 F7            [ 2]  573 	jra 1$
      0082E3                        574 9$: 
      0082E3 81               [ 4]  575 	ret 
                                    576 
                           000001   577 .if DEBUG 
                                    578 ;---------------------------------
                                    579 ;; print actual registers states 
                                    580 ;; as pushed on stack 
                                    581 ;; {Y,X,CC,A}
                                    582 ;---------------------------------
      0082E4                        583 	_argofs 0  
                           000002     1     ARG_OFS=2+0 
      000264                        584 	_arg R_Y 1 
                           000003     1     R_Y=ARG_OFS+1 
      000264                        585 	_arg R_X 3
                           000005     1     R_X=ARG_OFS+3 
      000264                        586 	_arg R_A 5
                           000007     1     R_A=ARG_OFS+5 
      000264                        587 	_arg R_CC 6
                           000008     1     R_CC=ARG_OFS+6 
      000264                        588 prt_regs:
      0082E4 AE 83 27         [ 2]  589 	ldw x,#regs_state 
      0082E7 CD 82 B0         [ 4]  590 	call puts
                                    591 ; register PC
      0082EA 16 01            [ 2]  592 	ldw y,(1,sp)
      0082EC AE 89 2D         [ 2]  593 	ldw x,#REG_EPC 
      0082EF CD 88 69         [ 4]  594 	call prt_reg16 
                                    595 ; register CC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 12.
Hexadecimal [24-Bits]



      0082F2 7B 08            [ 1]  596 	ld a,(R_CC,sp)
      0082F4 AE 89 42         [ 2]  597 	ldw x,#REG_CC 
      0082F7 CD 88 41         [ 4]  598 	call prt_reg8 
                                    599 ; register A 
      0082FA 7B 07            [ 1]  600 	ld a,(R_A,sp)
      0082FC AE 89 3D         [ 2]  601 	ldw x,#REG_A 
      0082FF CD 88 41         [ 4]  602 	call prt_reg8 
                                    603 ; register X 
      008302 16 05            [ 2]  604 	ldw y,(R_X,sp)
      008304 AE 89 38         [ 2]  605 	ldw x,#REG_X 
      008307 CD 88 69         [ 4]  606 	call prt_reg16 
                                    607 ; register Y 
      00830A 16 03            [ 2]  608 	ldw y,(R_Y,sp)
      00830C AE 89 33         [ 2]  609 	ldw x,#REG_Y 
      00830F CD 88 69         [ 4]  610 	call prt_reg16 
                                    611 ; register SP 
      008312 90 96            [ 1]  612 	ldw y,sp
      008314 72 A9 00 08      [ 2]  613 	addw y,#6+ARG_OFS  
      008318 AE 89 48         [ 2]  614 	ldw x,#REG_SP
      00831B CD 88 69         [ 4]  615 	call prt_reg16
      00831E A6 0D            [ 1]  616 	ld a,#CR 
      008320 CD 82 9E         [ 4]  617 	call putc
      008323 CD 82 9E         [ 4]  618 	call putc   
      008326 81               [ 4]  619 	ret 
                                    620 
      008327 0A 72 65 67 69 73 74   621 regs_state: .asciz "\nregisters state\n--------------------\n"
             65 72 73 20 73 74 61
             74 65 0A 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 0A 00
                                    622 
                                    623 
                                    624 ;--------------------
                                    625 ; print content at address in hex.
                                    626 ; input:
                                    627 ;   X 	address to peek 
                                    628 ; output:
                                    629 ;	none 
                                    630 ;--------------------	
      00834E                        631 prt_peek:
      00834E 89               [ 2]  632 	pushw x 
      00834F CF 00 0A         [ 2]  633 	ldw acc16,x 
      008352 72 5F 00 09      [ 1]  634 	clr acc24 
      008356 5F               [ 1]  635 	clrw x 
      008357 A6 10            [ 1]  636 	ld a,#16 
      008359 CD 89 4E         [ 4]  637 	call prti24 
      00835C A6 3A            [ 1]  638 	ld a,#': 
      00835E CD 82 9E         [ 4]  639 	call putc 
      008361 A6 20            [ 1]  640 	ld a,#SPACE 
      008363 CD 82 9E         [ 4]  641 	call putc 
      008366 85               [ 2]  642 	popw x 
      008367 F6               [ 1]  643 	ld a,(x)
      008368 C7 00 0B         [ 1]  644 	ld acc8,a 
      00836B 5F               [ 1]  645 	clrw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 13.
Hexadecimal [24-Bits]



      00836C A6 10            [ 1]  646 	ld a,#16 
      00836E CD 89 4E         [ 4]  647 	call prti24
      008371 81               [ 4]  648 	ret 
                                    649 .endif 
                                    650 
                                    651 ;-------------------------------------
                                    652 ; retrun string length
                                    653 ; input:
                                    654 ;   X         .asciz  
                                    655 ; output:
                                    656 ;   X         length 
                                    657 ;-------------------------------------
      008372                        658 strlen:
      008372 90 93            [ 1]  659 	ldw y,x 
      008374 5F               [ 1]  660 	clrw x 
      008375 90 7D            [ 1]  661 1$:	tnz (y) 
      008377 27 05            [ 1]  662 	jreq 9$ 
      008379 5C               [ 1]  663 	incw x
      00837A 90 5C            [ 1]  664 	incw y 
      00837C 20 F7            [ 2]  665 	jra 1$ 
      00837E 81               [ 4]  666 9$: ret 
                                    667 
                                    668 ;------------------------------------
                                    669 ; compare 2 strings
                                    670 ; input:
                                    671 ;   X 		char* first string 
                                    672 ;   Y       char* second string 
                                    673 ; output:
                                    674 ;   A 		0|1 
                                    675 ;-------------------------------------
      00837F                        676 strcmp:
      00837F F6               [ 1]  677 	ld a,(x)
      008380 27 0B            [ 1]  678 	jreq 5$ 
      008382 90 F1            [ 1]  679 	cp a,(y) 
      008384 26 05            [ 1]  680 	jrne 4$ 
      008386 5C               [ 1]  681 	incw x 
      008387 90 5C            [ 1]  682 	incw y 
      008389 20 F4            [ 2]  683 	jra strcmp 
      00838B                        684 4$: ; not same  
      00838B 4F               [ 1]  685 	clr a 
      00838C 81               [ 4]  686 	ret 
      00838D                        687 5$: ; same 
      00838D A6 01            [ 1]  688 	ld a,#1 
      00838F 81               [ 4]  689 	ret 
                                    690 
                                    691 
                                    692 ;---------------------------------------
                                    693 ;  copy src to dest 
                                    694 ; input:
                                    695 ;   X 		dest 
                                    696 ;   Y 		src 
                                    697 ; output: 
                                    698 ;   X 		dest 
                                    699 ;----------------------------------
      008390                        700 strcpy:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 14.
Hexadecimal [24-Bits]



      008390 89               [ 2]  701 	pushw x 
      008391 90 F6            [ 1]  702 1$: ld a,(y)
      008393 27 06            [ 1]  703 	jreq 9$ 
      008395 F7               [ 1]  704 	ld (x),a 
      008396 5C               [ 1]  705 	incw x 
      008397 90 5C            [ 1]  706 	incw y 
      008399 20 F6            [ 2]  707 	jra 1$ 
      00839B 7F               [ 1]  708 9$:	clr (x)
      00839C 85               [ 2]  709 	popw x 
      00839D 81               [ 4]  710 	ret 
                                    711 
                                    712 ;---------------------------------------
                                    713 ; move memory block 
                                    714 ; input:
                                    715 ;   X 		destination 
                                    716 ;   Y 	    source 
                                    717 ;   acc16	size 
                                    718 ; output:
                                    719 ;   none 
                                    720 ;--------------------------------------
                           000001   721 	INCR=1 ; increament high byte 
                           000002   722 	LB=2 ; increament low byte 
                           000002   723 	VSIZE=2
      00839E                        724 move:
      00031E                        725 	_vars VSIZE 
      00839E 52 02            [ 2]    1     sub sp,#VSIZE 
      0083A0 0F 01            [ 1]  726 	clr (INCR,sp)
      0083A2 0F 02            [ 1]  727 	clr (LB,sp)
      0083A4 90 89            [ 2]  728 	pushw y 
      0083A6 13 01            [ 2]  729 	cpw x,(1,sp) ; compare DEST to SRC 
      0083A8 90 85            [ 2]  730 	popw y 
      0083AA 27 32            [ 1]  731 	jreq move_exit ; x==y 
      0083AC 2B 0E            [ 1]  732 	jrmi move_down
      0083AE                        733 move_up: ; start from top address with incr=-1
      0083AE 72 BB 00 0A      [ 2]  734 	addw x,acc16
      0083B2 72 B9 00 0A      [ 2]  735 	addw y,acc16
      0083B6 03 01            [ 1]  736 	cpl (INCR,sp)
      0083B8 03 02            [ 1]  737 	cpl (LB,sp)   ; increment = -1 
      0083BA 20 05            [ 2]  738 	jra move_loop  
      0083BC                        739 move_down: ; start from bottom address with incr=1 
      0083BC 5A               [ 2]  740     decw x 
      0083BD 90 5A            [ 2]  741 	decw y
      0083BF 0C 02            [ 1]  742 	inc (LB,sp) ; incr=1 
      0083C1                        743 move_loop:	
      0083C1 C6 00 0A         [ 1]  744     ld a, acc16 
      0083C4 CA 00 0B         [ 1]  745 	or a, acc8
      0083C7 27 15            [ 1]  746 	jreq move_exit 
      0083C9 72 FB 01         [ 2]  747 	addw x,(INCR,sp)
      0083CC 72 F9 01         [ 2]  748 	addw y,(INCR,sp) 
      0083CF 90 F6            [ 1]  749 	ld a,(y)
      0083D1 F7               [ 1]  750 	ld (x),a 
      0083D2 72 5A 00 0B      [ 1]  751 	dec acc8
      0083D6 2A E9            [ 1]  752 	jrpl move_loop
      0083D8 72 5A 00 0A      [ 1]  753 	dec acc16
      0083DC 20 E3            [ 2]  754 	jra move_loop
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 15.
Hexadecimal [24-Bits]



      0083DE                        755 move_exit:
      00035E                        756 	_drop VSIZE
      0083DE 5B 02            [ 2]    1     addw sp,#VSIZE 
      0083E0 81               [ 4]  757 	ret 	
                                    758 
                                    759 ;-------------------------------------
                                    760 ; search text area for a line with 
                                    761 ; same number as lineno  
                                    762 ; input:
                                    763 ;	X 			lineno 
                                    764 ; output:
                                    765 ;   X 			addr of line | 0 
                                    766 ;   Y           lineno|insert address if not found  
                                    767 ;-------------------------------------
                           000001   768 	LL=1 ; line length 
                           000002   769 	LB=2 ; line length low byte 
                           000002   770 	VSIZE=2 
      0083E1                        771 search_lineno:
      000361                        772 	_vars VSIZE
      0083E1 52 02            [ 2]    1     sub sp,#VSIZE 
      0083E3 CF 00 0A         [ 2]  773 	ldw acc16,x 
      0083E6 0F 01            [ 1]  774 	clr (LL,sp)
      0083E8 90 CE 00 1C      [ 2]  775 	ldw y,txtbgn
      0083EC                        776 search_ln_loop:
      0083EC 90 C3 00 1E      [ 2]  777 	cpw y,txtend 
      0083F0 2A 17            [ 1]  778 	jrpl 8$
      0083F2 93               [ 1]  779 	ldw x,y 
      0083F3 FE               [ 2]  780 	ldw x,(x) ; x=line number 
      0083F4 C3 00 0A         [ 2]  781 	cpw x,acc16 
      0083F7 27 13            [ 1]  782 	jreq 9$ 
      0083F9 2A 0E            [ 1]  783 	jrpl 8$ ; from here all lines are > lineno 
      0083FB 90 E6 02         [ 1]  784 	ld a,(2,y)
      0083FE 6B 02            [ 1]  785 	ld (LB,sp),a 
      008400 72 A9 00 03      [ 2]  786 	addw y,#3 
      008404 72 F9 01         [ 2]  787 	addw y,(LL,sp)
      008407 20 E3            [ 2]  788 	jra search_ln_loop 
      008409 51               [ 1]  789 8$: exgw x,y 
      00840A 90 5F            [ 1]  790 	clrw y 	
      00038C                        791 9$: _drop VSIZE
      00840C 5B 02            [ 2]    1     addw sp,#VSIZE 
      00840E 51               [ 1]  792 	exgw x,y   
      00840F 81               [ 4]  793 	ret 
                                    794 
                                    795 ;-------------------------------------
                                    796 ; delete line at addr
                                    797 ; input:
                                    798 ;   X 		addr of line i.e DEST for move 
                                    799 ;-------------------------------------
                           000001   800 	LLEN=1
                           000003   801 	SRC=3
                           000004   802 	VSIZE=4
      008410                        803 del_line: 
      000390                        804 	_vars VSIZE 
      008410 52 04            [ 2]    1     sub sp,#VSIZE 
      008412 E6 02            [ 1]  805 	ld a,(2,x) ; line length
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 16.
Hexadecimal [24-Bits]



      008414 AB 03            [ 1]  806 	add a,#3
      008416 6B 02            [ 1]  807 	ld (LLEN+1,sp),a 
      008418 0F 01            [ 1]  808 	clr (LLEN,sp)
      00841A 90 93            [ 1]  809 	ldw y,x  
      00841C 72 F9 01         [ 2]  810 	addw y,(LLEN,sp) ;SRC  
      00841F 17 03            [ 2]  811 	ldw (SRC,sp),y  ;save source 
      008421 90 CE 00 1E      [ 2]  812 	ldw y,txtend 
      008425 72 F2 03         [ 2]  813 	subw y,(SRC,sp) ; y=count 
      008428 90 CF 00 0A      [ 2]  814 	ldw acc16,y 
      00842C 16 03            [ 2]  815 	ldw y,(SRC,sp)    ; source
      00842E CD 83 9E         [ 4]  816 	call move
      008431 90 CE 00 1E      [ 2]  817 	ldw y,txtend 
      008435 72 F2 01         [ 2]  818 	subw y,(LLEN,sp)
      008438 90 CF 00 1E      [ 2]  819 	ldw txtend,y  
      0003BC                        820 	_drop VSIZE     
      00843C 5B 04            [ 2]    1     addw sp,#VSIZE 
      00843E 81               [ 4]  821 	ret 
                                    822 
                                    823 
                                    824 ;---------------------------------------------
                                    825 ; create a gap in text area 
                                    826 ; input:
                                    827 ;    X 			addr gap start 
                                    828 ;    Y 			gap length 
                                    829 ; output:
                                    830 ;    X 			addr gap start 
                                    831 ;--------------------------------------------
                           000001   832 	DEST=1
                           000003   833 	SRC=3
                           000005   834 	LEN=5
                           000006   835 	VSIZE=6 
      00843F                        836 create_gap:
      0003BF                        837 	_vars VSIZE
      00843F 52 06            [ 2]    1     sub sp,#VSIZE 
      008441 C3 00 1E         [ 2]  838 	cpw x,txtend 
      008444 2A 27            [ 1]  839 	jrpl 9$ ; no need for a gap since at end of text.
      008446 1F 03            [ 2]  840 	ldw (SRC,sp),x 
      008448 17 05            [ 2]  841 	ldw (LEN,sp),y 
      00844A 90 CF 00 0A      [ 2]  842 	ldw acc16,y 
      00844E 90 93            [ 1]  843 	ldw y,x ; SRC
      008450 72 BB 00 0A      [ 2]  844 	addw x,acc16  
      008454 1F 01            [ 2]  845 	ldw (DEST,sp),x 
                                    846 ;compute size to move 	
      008456 CE 00 1E         [ 2]  847 	ldw x,txtend 
      008459 72 F0 03         [ 2]  848 	subw x,(SRC,sp)
      00845C CF 00 0A         [ 2]  849 	ldw acc16,x
      00845F 1E 01            [ 2]  850 	ldw x,(DEST,sp) 
      008461 CD 83 9E         [ 4]  851 	call move
      008464 CE 00 1E         [ 2]  852 	ldw x,txtend
      008467 72 FB 05         [ 2]  853 	addw x,(LEN,sp)
      00846A CF 00 1E         [ 2]  854 	ldw txtend,x
      0003ED                        855 9$:	_drop VSIZE 
      00846D 5B 06            [ 2]    1     addw sp,#VSIZE 
      00846F 81               [ 4]  856 	ret 
                                    857 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 17.
Hexadecimal [24-Bits]



                                    858 
                                    859 ;--------------------------------------------
                                    860 ; insert line in tib into text area 
                                    861 ; first search for already existing 
                                    862 ; replace existing 
                                    863 ; if strlen(tib)==0 delete existing 
                                    864 ; input:
                                    865 ;   X 				line number 
                                    866 ;   tib[in.w]  		text to insert  
                                    867 ; output:
                                    868 ;   none
                                    869 ;---------------------------------------------
                           000001   870 	DEST=1  ; text area insertion address 
                           000003   871 	SRC=3   ; str to insert address 
                           000005   872 	LINENO=5 ; line number 
                           000007   873 	LLEN=7 ; line length 
                           000008   874 	VSIZE=8  
      008470                        875 insert_line:
      0003F0                        876 	_vars VSIZE 
      008470 52 08            [ 2]    1     sub sp,#VSIZE 
      008472 A3 00 00         [ 2]  877 	cpw x,#0  
      008475 22 03            [ 1]  878 	jrugt 0$ 
      008477 CC 87 21         [ 2]  879 	jp syntax_error ; negative line number 
      00847A                        880 0$: 
      00847A 1F 05            [ 2]  881 	ldw (LINENO,sp),x 
      00847C AE 16 C8         [ 2]  882 	ldw x,#tib 
      00847F 72 BB 00 01      [ 2]  883 	addw x,in.w 
      008483 1F 03            [ 2]  884 	ldw (SRC,sp),x 
      008485 CD 83 72         [ 4]  885 	call strlen
      008488 5D               [ 2]  886 	tnzw x 
      008489 27 01            [ 1]  887 	jreq 1$
      00848B 5C               [ 1]  888 	incw x 
      00848C 1F 07            [ 2]  889 1$:	ldw (LLEN,sp),x
      00848E 1E 05            [ 2]  890 	ldw x,(LINENO,sp)
      008490 CD 83 E1         [ 4]  891 	call search_lineno 
      008493 5D               [ 2]  892 	tnzw x 
      008494 26 04            [ 1]  893 	jrne 2$
                                    894 ; line doesn't exit 	
      008496 17 01            [ 2]  895 	ldw (DEST,sp),y 
      008498 20 05            [ 2]  896 	jra 3$
                                    897 ; line exit delete it.	
      00849A 1F 01            [ 2]  898 2$: ldw (DEST,sp),x 
      00849C CD 84 10         [ 4]  899 	call del_line
                                    900 ; leave or insert new line if LLEN>0
      00849F                        901 3$: 
                                    902 ; check for available space 
      00849F CD 93 8D         [ 4]  903 	call size 
      0084A2 1D 00 03         [ 2]  904 	subw x,#3 
      0084A5 72 F0 07         [ 2]  905     subw x,(LLEN,sp)
      0084A8 2A 05            [ 1]  906 	jrpl 31$
      0084AA A6 01            [ 1]  907 	ld a,#ERR_MEM_FULL
      0084AC CC 87 23         [ 2]  908 	jp tb_error 
      0084AF                        909 31$:	
      0084AF 0D 08            [ 1]  910 	tnz (LLEN+1,sp)
      0084B1 27 34            [ 1]  911 	jreq insert_ln_exit ; empty line forget it.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 18.
Hexadecimal [24-Bits]



      0084B3 1E 01            [ 2]  912 	ldw x,(DEST,sp)
      0084B5 C3 00 1E         [ 2]  913 	cpw x,txtend 
      0084B8 2A 0B            [ 1]  914 	jrpl 4$ 
                                    915 ; must create a gap 
      0084BA 16 07            [ 2]  916 	ldw y,(LLEN,sp)
      0084BC 72 A9 00 03      [ 2]  917 	addw y,#3 ; space for lineno and linelen 
      0084C0 CD 84 3F         [ 4]  918 	call create_gap 
      0084C3 20 11            [ 2]  919 	jra 5$ 
      0084C5                        920 4$: ; insert at end. 
      0084C5 90 CE 00 1E      [ 2]  921 	ldw y,txtend
      0084C9 17 01            [ 2]  922 	ldw (DEST,sp),y
      0084CB 72 F9 07         [ 2]  923 	addw y,(LLEN,sp)
      0084CE 72 A9 00 03      [ 2]  924 	addw y,#3 
      0084D2 90 CF 00 1E      [ 2]  925 	ldw txtend,y  
      0084D6                        926 5$:	
      0084D6 1E 01            [ 2]  927 	ldw x,(DEST,sp) ; dest address 
      0084D8 16 05            [ 2]  928 	ldw y,(LINENO,sp) ; line number 
      0084DA FF               [ 2]  929 	ldw (x),y 
      0084DB 1C 00 02         [ 2]  930 	addw x,#2
      0084DE 7B 08            [ 1]  931 	ld a,(LLEN+1,sp)
      0084E0 F7               [ 1]  932 	ld (x),a 
      0084E1 5C               [ 1]  933 	incw x 
      0084E2 16 03            [ 2]  934 	ldw y,(SRC,sp) ; src addr  
      0084E4 CD 83 90         [ 4]  935 	call strcpy   
      0084E7                        936 insert_ln_exit:	
      000467                        937 	_drop VSIZE
      0084E7 5B 08            [ 2]    1     addw sp,#VSIZE 
      0084E9 81               [ 4]  938 	ret
                                    939 	
                                    940 ;------------------------------------
                                    941 ;  set all variables to zero 
                                    942 ; input:
                                    943 ;   none 
                                    944 ; output:
                                    945 ;	none
                                    946 ;------------------------------------
      0084EA                        947 clear_vars:
      0084EA AE 00 27         [ 2]  948 	ldw x,#vars 
      0084ED 90 AE 00 34      [ 2]  949 	ldw y,#2*26 
      0084F1 7F               [ 1]  950 1$:	clr (x)
      0084F2 5C               [ 1]  951 	incw x 
      0084F3 90 5A            [ 2]  952 	decw y 
      0084F5 26 FA            [ 1]  953 	jrne 1$
      0084F7 81               [ 4]  954 	ret 
                                    955 
                                    956 ;-------------------------------------
                                    957 ; check if A is a letter
                                    958 ; input:
                                    959 ;   A 			character to test 
                                    960 ; output:
                                    961 ;   C flag      1 true, 0 false 
                                    962 ;-------------------------------------
      0084F8                        963 is_alpha:
      0084F8 A1 41            [ 1]  964 	cp a,#'A 
      0084FA 8C               [ 1]  965 	ccf
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 19.
Hexadecimal [24-Bits]



      0084FB 24 0B            [ 1]  966 	jrnc 9$ 
      0084FD A1 5B            [ 1]  967 	cp a,#'Z+1 
      0084FF 25 07            [ 1]  968 	jrc 9$ 
      008501 A1 61            [ 1]  969 	cp a,#'a 
      008503 8C               [ 1]  970 	ccf 
      008504 24 02            [ 1]  971 	jrnc 9$
      008506 A1 7B            [ 1]  972 	cp a,#'z+1   
      008508 81               [ 4]  973 9$: ret 	
                                    974 
                                    975 ;-------------------------------------
                                    976 ;  program initialization entry point 
                                    977 ;-------------------------------------
                           000001   978 	MAJOR=1
                           000000   979 	MINOR=0
      008509 0A 0A 54 69 6E 79 20   980 software: .asciz "\n\nTiny BASIC for STM8\nCopyright, Jacques Deschenes 2019,2020\nversion "
             42 41 53 49 43 20 66
             6F 72 20 53 54 4D 38
             0A 43 6F 70 79 72 69
             67 68 74 2C 20 4A 61
             63 71 75 65 73 20 44
             65 73 63 68 65 6E 65
             73 20 32 30 31 39 2C
             32 30 32 30 0A 76 65
             72 73 69 6F 6E 20 00
      00854F 75 73 65 72 20 73 70   981 usr_addr: .asciz "user space address: " 
             61 63 65 20 61 64 64
             72 65 73 73 3A 20 00
      008564                        982 cold_start:
                                    983 ;set stack 
      008564 AE 17 FF         [ 2]  984 	ldw x,#STACK_EMPTY
      008567 94               [ 1]  985 	ldw sp,x   
                                    986 ; clear all ram 
      008568 7F               [ 1]  987 0$: clr (x)
      008569 5A               [ 2]  988 	decw x 
      00856A 26 FC            [ 1]  989 	jrne 0$
                                    990 ; activate pull up on all inputs 
      00856C A6 FF            [ 1]  991 	ld a,#255 
      00856E C7 50 03         [ 1]  992 	ld PA_CR1,a 
      008571 C7 50 08         [ 1]  993 	ld PB_CR1,a 
      008574 C7 50 0D         [ 1]  994 	ld PC_CR1,a 
      008577 C7 50 12         [ 1]  995 	ld PD_CR1,a 
      00857A C7 50 17         [ 1]  996 	ld PE_CR1,a 
      00857D C7 50 1C         [ 1]  997 	ld PF_CR1,a 
      008580 C7 50 21         [ 1]  998 	ld PG_CR1,a 
      008583 C7 50 2B         [ 1]  999 	ld PI_CR1,a 
                                   1000 ; select internal clock no divisor: 16 Mhz 	
      008586 A6 E1            [ 1] 1001 	ld a,#CLK_SWR_HSI 
      008588 5F               [ 1] 1002 	clrw x  
      008589 CD 81 1E         [ 4] 1003     call clock_init 
      00858C CD 81 34         [ 4] 1004 	call timer4_init
                                   1005 ; UART3 at 115200 BAUD
      00858F CD 82 74         [ 4] 1006 	call uart3_init
                                   1007 ; activate PE_4 (user button interrupt)
      008592 72 18 50 18      [ 1] 1008     bset PE_CR2,#USR_BTN_BIT 
                                   1009 ; display system information
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 20.
Hexadecimal [24-Bits]



      008596 AE 85 09         [ 2] 1010 	ldw x,#software 
      008599 CD 82 B0         [ 4] 1011 	call puts 
      00859C A6 01            [ 1] 1012 	ld a,#MAJOR 
      00859E C7 00 0B         [ 1] 1013 	ld acc8,a 
      0085A1 5F               [ 1] 1014 	clrw x 
      0085A2 CF 00 09         [ 2] 1015 	ldw acc24,x 
      0085A5 A6 0A            [ 1] 1016 	ld a,#10 
      0085A7 CD 89 4E         [ 4] 1017 	call prti24 
      0085AA A6 2E            [ 1] 1018 	ld a,#'.
      0085AC CD 82 9E         [ 4] 1019 	call putc 
      0085AF A6 00            [ 1] 1020 	ld a,#MINOR 
      0085B1 C7 00 0B         [ 1] 1021 	ld acc8,a 
      0085B4 5F               [ 1] 1022 	clrw x 
      0085B5 CF 00 09         [ 2] 1023 	ldw acc24,x 
      0085B8 A6 0A            [ 1] 1024 	ld a,#10 
      0085BA CD 89 4E         [ 4] 1025 	call prti24 
      0085BD A6 0D            [ 1] 1026 	ld a,#CR 
      0085BF CD 82 9E         [ 4] 1027 	call putc 
      0085C2 CD 98 04         [ 4] 1028 	call seek_fdrive 
      0085C5 AE 85 4F         [ 2] 1029 	ldw x,#usr_addr
      0085C8 CD 82 B0         [ 4] 1030 	call puts  
      0085CB AE 9E 80         [ 2] 1031 	ldw x,#user_space
      0085CE 35 10 00 08      [ 1] 1032 	mov base,#16
      0085D2 CD 89 A3         [ 4] 1033 	call print_int 
                                   1034 ; configure LED2 pin 
      0085D5 72 1A 50 0D      [ 1] 1035     bset PC_CR1,#LED2_BIT
      0085D9 72 1A 50 0E      [ 1] 1036     bset PC_CR2,#LED2_BIT
      0085DD 72 1A 50 0C      [ 1] 1037     bset PC_DDR,#LED2_BIT
      0085E1 9A               [ 1] 1038 	rim 
      0085E2 AE 16 C8         [ 2] 1039 	ldw x,#tib
      0085E5 CF 00 21         [ 2] 1040 	ldw array_addr,x 
      0085E8 72 5C 00 11      [ 1] 1041 	inc seedy+1 
      0085EC 72 5C 00 0F      [ 1] 1042 	inc seedx+1 
      0085F0 CD 85 FF         [ 4] 1043 	call clear_basic
      0085F3 CD 93 97         [ 4] 1044 	call ubound 
      0085F6 CD 8F DB         [ 4] 1045 	call dpop 
      0085F9 CF 00 23         [ 2] 1046 	ldw array_size,x 
      0085FC CC 87 81         [ 2] 1047     jp warm_start 
                                   1048 
      0085FF                       1049 clear_basic:
      0085FF 5F               [ 1] 1050 	clrw x 
      008600 CF 00 06         [ 2] 1051 	ldw lineno,x
      008603 72 5F 00 03      [ 1] 1052 	clr count 
      008607 AE 00 5B         [ 2] 1053 	ldw x,#free_ram 
      00860A CF 00 1C         [ 2] 1054 	ldw txtbgn,x 
      00860D CF 00 1E         [ 2] 1055 	ldw txtend,x 
      008610 CD 84 EA         [ 4] 1056 	call clear_vars 
      008613 81               [ 4] 1057 	ret 
                                   1058 
      008614                       1059 err_msg:
      008614 00 00 86 2C 86 3A 86  1060 	.word 0,err_mem_full, err_syntax, err_math_ovf, err_div0,err_no_line    
             49 86 63 86 73
      008620 86 8A 86 A1 86 BC 86  1061 	.word err_run_only,err_cmd_only,err_duplicate,err_not_file,err_bad_value
             CE 86 E0
      00862A 86 ED                 1062 	.word err_no_access 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 21.
Hexadecimal [24-Bits]



                                   1063 
      00862C 0A 4D 65 6D 6F 72 79  1064 err_mem_full: .asciz "\nMemory full\n" 
             20 66 75 6C 6C 0A 00
      00863A 0A 73 79 6E 74 61 78  1065 err_syntax: .asciz "\nsyntax error\n" 
             20 65 72 72 6F 72 0A
             00
      008649 0A 6D 61 74 68 20 6F  1066 err_math_ovf: .asciz "\nmath operation overflow\n"
             70 65 72 61 74 69 6F
             6E 20 6F 76 65 72 66
             6C 6F 77 0A 00
      008663 0A 64 69 76 69 73 69  1067 err_div0: .asciz "\ndivision by 0\n" 
             6F 6E 20 62 79 20 30
             0A 00
      008673 0A 69 6E 76 61 6C 69  1068 err_no_line: .asciz "\ninvalid line number.\n"
             64 20 6C 69 6E 65 20
             6E 75 6D 62 65 72 2E
             0A 00
      00868A 0A 72 75 6E 20 74 69  1069 err_run_only: .asciz "\nrun time only usage.\n" 
             6D 65 20 6F 6E 6C 79
             20 75 73 61 67 65 2E
             0A 00
      0086A1 0A 63 6F 6D 6D 61 6E  1070 err_cmd_only: .asciz "\ncommand line only usage.\n"
             64 20 6C 69 6E 65 20
             6F 6E 6C 79 20 75 73
             61 67 65 2E 0A 00
      0086BC 0A 64 75 70 6C 69 63  1071 err_duplicate: .asciz "\nduplicate name.\n"
             61 74 65 20 6E 61 6D
             65 2E 0A 00
      0086CE 0A 46 69 6C 65 20 6E  1072 err_not_file: .asciz "\nFile not found.\n"
             6F 74 20 66 6F 75 6E
             64 2E 0A 00
      0086E0 0A 62 61 64 20 76 61  1073 err_bad_value: .asciz "\nbad value.\n"
             6C 75 65 2E 0A 00
      0086ED 0A 46 69 6C 65 20 69  1074 err_no_access: .asciz "\nFile in extended memory, can't be run from there.\n" 
             6E 20 65 78 74 65 6E
             64 65 64 20 6D 65 6D
             6F 72 79 2C 20 63 61
             6E 27 74 20 62 65 20
             72 75 6E 20 66 72 6F
             6D 20 74 68 65 72 65
             2E 0A 00
                                   1075 
      008721                       1076 syntax_error:
      008721 A6 02            [ 1] 1077 	ld a,#ERR_SYNTAX 
                                   1078 
      008723                       1079 tb_error:
      008723 AE 86 14         [ 2] 1080 	ldw x, #err_msg 
      008726 72 5F 00 0A      [ 1] 1081 	clr acc16 
      00872A 48               [ 1] 1082 	sll a
      00872B 72 59 00 0A      [ 1] 1083 	rlc acc16  
      00872F C7 00 0B         [ 1] 1084 	ld acc8, a 
      008732 72 BB 00 0A      [ 2] 1085 	addw x,acc16 
      008736 FE               [ 2] 1086 	ldw x,(x)
      008737 CD 82 B0         [ 4] 1087 	call puts
      00873A CE 00 06         [ 2] 1088 	ldw x,lineno 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 22.
Hexadecimal [24-Bits]



      00873D 5D               [ 2] 1089 	tnzw x 
      00873E 27 0F            [ 1] 1090 	jreq 2$
      008740 CF 00 0A         [ 2] 1091 	ldw acc16,x 
      008743 72 5F 00 09      [ 1] 1092 	clr acc24 
      008747 AE 00 05         [ 2] 1093 	ldw x,#5 
      00874A A6 0A            [ 1] 1094 	ld a,#10 
      00874C CD 89 4E         [ 4] 1095 	call prti24
      00874F                       1096 2$:	 
      00874F CE 00 04         [ 2] 1097 	ldw x,basicptr   
      008752 C6 00 06         [ 1] 1098 	ld a,lineno 
      008755 CA 00 07         [ 1] 1099 	or a,lineno+1
      008758 27 03            [ 1] 1100 	jreq 3$
      00875A 1C 00 03         [ 2] 1101 	addw x,#3 
      00875D CD 82 B0         [ 4] 1102 3$:	call puts 
      008760 A6 0D            [ 1] 1103 	ld a,#CR 
      008762 CD 82 9E         [ 4] 1104 	call putc 
      008765 5F               [ 1] 1105 	clrw x 
      008766 C6 00 06         [ 1] 1106 	ld a,lineno 
      008769 CA 00 07         [ 1] 1107 	or a,lineno+1
      00876C 27 03            [ 1] 1108 	jreq 4$
      00876E AE 00 05         [ 2] 1109 	ldw x,#5 
      008771 72 BB 00 01      [ 2] 1110 4$:	addw x,in.w 
      008775 CD 82 D8         [ 4] 1111 	call spaces
      008778 A6 5E            [ 1] 1112 	ld a,#'^ 
      00877A CD 82 9E         [ 4] 1113 	call putc 
      00877D AE 17 FF         [ 2] 1114 1$: ldw x,#STACK_EMPTY 
      008780 94               [ 1] 1115     ldw sp,x
      008781                       1116 warm_start:
      008781 72 5F 00 25      [ 1] 1117 	clr flags 
      008785 72 5F 00 20      [ 1] 1118 	clr loop_depth 
      008789 AE 17 80         [ 2] 1119 	ldw x,#dstack_unf 
      00878C CF 00 1A         [ 2] 1120 	ldw dstkptr,x 
      00878F 35 04 00 26      [ 1] 1121 	mov tab_width,#TAB_WIDTH 
      008793 35 0A 00 08      [ 1] 1122 	mov base,#10 
      008797 5F               [ 1] 1123 	clrw x 
      008798 CF 00 06         [ 2] 1124 	ldw lineno,x 
      00879B AE 16 C8         [ 2] 1125 	ldw x,#tib 
      00879E CF 00 04         [ 2] 1126 	ldw basicptr,x 
                                   1127 ;----------------------------
                                   1128 ; tokenizer test
                                   1129 ;----------------------------
                           000000  1130   TOK_TEST=0 
                           000000  1131 .if TOK_TEST 
                                   1132 test_tok:
                                   1133 	clr in.w 
                                   1134 	clr in 
                                   1135 	ld a,#CR 
                                   1136 	call putc 
                                   1137 	ld a,#'> 
                                   1138 	call putc 
                                   1139 	call readln
                                   1140 	ldw x,#tib 
                                   1141 1$:	call get_token	
                                   1142 	tnz a 
                                   1143 	jrne 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 23.
Hexadecimal [24-Bits]



                                   1144 	jra test_tok 
                                   1145 2$:	push a 
                                   1146 	cp a,#TK_INTGR
                                   1147 	jrne 3$
                                   1148 	ld a,#10 
                                   1149 	clrw x
                                   1150 	call itoa
                                   1151 	ldw y,x 
                                   1152 	ldw x,#pad 
                                   1153 	call strcpy    
                                   1154 3$:	ld a,(1,sp) 
                                   1155 	cp a,#20
                                   1156 	jrmi 34$
                                   1157 	ld a,#'2 
                                   1158 	call putc 
                                   1159 	ld a,(1,sp)
                                   1160 	sub a,#20
                                   1161 	ld (1,sp),a
                                   1162 	jra 36$   
                                   1163 34$: 
                                   1164 	cp a,#10
                                   1165 	jrmi 36$ 
                                   1166 	ld a,#'1 
                                   1167 	call putc
                                   1168 	ld a,(1,sp)
                                   1169 	sub a,#10 
                                   1170 	ld (1,sp),a  
                                   1171 36$:
                                   1172 	pop a 
                                   1173 	add a,#'0 
                                   1174 	call putc 
                                   1175 	ld a,#SPACE 
                                   1176 	call putc 
                                   1177 	ldw x,#pad 
                                   1178 	call puts 
                                   1179 	ld a,#CR 
                                   1180 	call putc 
                                   1181 	jra 1$
                                   1182 .endif
                                   1183 ;----------------------------
      0087A1                       1184 interp:
      0087A1 72 5F 00 01      [ 1] 1185 	clr in.w
      0087A5 72 01 00 25 2C   [ 2] 1186 	btjf flags,#FRUN,4$ 
                                   1187 ; running program
                                   1188 ; goto next basic line 
      0087AA CE 00 04         [ 2] 1189 	ldw x,basicptr
      0087AD E6 02            [ 1] 1190 	ld a,(2,x) ; line length 
      0087AF C7 00 0B         [ 1] 1191 	ld acc8,a 
      0087B2 72 5F 00 0A      [ 1] 1192 	clr acc16 
      0087B6 1C 00 03         [ 2] 1193 	addw x,#3 
      0087B9 72 BB 00 0A      [ 2] 1194 	addw x,acc16
      0087BD C3 00 1E         [ 2] 1195 	cpw x,txtend 
      0087C0 2A BF            [ 1] 1196 	jrpl warm_start
      0087C2 CF 00 04         [ 2] 1197 	ldw basicptr,x ; start of next line  
      0087C5 E6 02            [ 1] 1198 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 24.
Hexadecimal [24-Bits]



      0087C7 AB 02            [ 1] 1199 	add a,#2 ; because 'in' start at 3.
      0087C9 C7 00 03         [ 1] 1200 	ld count,a 
      0087CC FE               [ 2] 1201 	ldw x,(x) ; line no 
      0087CD CF 00 06         [ 2] 1202 	ldw lineno,x 
      0087D0 35 03 00 02      [ 1] 1203 	mov in,#3 ; skip first 3 bytes of line 
      0087D4 20 11            [ 2] 1204 	jra interp_loop 
      0087D6                       1205 4$: ; commande line mode 	
      0087D6 72 5F 00 02      [ 1] 1206 	clr in 
      0087DA A6 0D            [ 1] 1207 	ld a,#CR 
      0087DC CD 82 9E         [ 4] 1208 	call putc 
      0087DF A6 3E            [ 1] 1209 	ld a,#'> 
      0087E1 CD 82 9E         [ 4] 1210 	call putc 
      0087E4 CD 8A 91         [ 4] 1211 	call readln
      0087E7                       1212 interp_loop:
      0087E7 C6 00 02         [ 1] 1213 	ld a,in 
      0087EA C1 00 03         [ 1] 1214 	cp a,count 
      0087ED 2A B2            [ 1] 1215 	jrpl interp
      0087EF CD 8D 1B         [ 4] 1216 	call get_token
      0087F2 A1 01            [ 1] 1217 	cp a,#TK_COLON 
      0087F4 27 F1            [ 1] 1218 	jreq interp_loop 
      0087F6 A1 00            [ 1] 1219 	cp a,#TK_NONE 
      0087F8 27 A7            [ 1] 1220 	jreq interp 
      0087FA                       1221 1$:
      0087FA A1 02            [ 1] 1222 	cp a,#TK_VAR
      0087FC 26 05            [ 1] 1223 	jrne 2$
      0087FE CD 93 AF         [ 4] 1224 	call let02  
      008801 20 E4            [ 2] 1225 	jra interp_loop 
      008803                       1226 2$:	
      008803 A1 03            [ 1] 1227 	cp a,#TK_ARRAY 
      008805 26 08            [ 1] 1228 	jrne 3$
      008807 CD 92 14         [ 4] 1229 	call get_array_element
      00880A CD 93 AF         [ 4] 1230 	call let02 
      00880D 20 D8            [ 2] 1231 	jra interp_loop 
      00880F                       1232 3$:
      00880F A1 07            [ 1] 1233 	cp a,#TK_CMD
      008811 26 03            [ 1] 1234 	jrne 4$
      008813 FD               [ 4] 1235 	call (x) 
      008814 20 D1            [ 2] 1236 	jra interp_loop 
      008816                       1237 4$:	
      008816 A1 0A            [ 1] 1238 	cp a,#TK_INTGR
      008818 26 06            [ 1] 1239 	jrne 5$
      00881A CD 84 70         [ 4] 1240 	call insert_line 
      00881D CC 87 A1         [ 2] 1241 	jp interp
      008820                       1242 5$: 
      008820 CC 87 21         [ 2] 1243 	jp syntax_error 
                                   1244 
                                   1245 ;----------------------------------------
                                   1246 ;   DEBUG support functions
                                   1247 ;----------------------------------------
                           000001  1248 .if DEBUG 
                                   1249 ; turn LED on 
      008823                       1250 ledon:
      008823 72 1A 50 0A      [ 1] 1251     bset PC_ODR,#LED2_BIT
      008827 81               [ 4] 1252     ret 
                                   1253 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 25.
Hexadecimal [24-Bits]



                                   1254 ; turn LED off 
      008828                       1255 ledoff:
      008828 72 1B 50 0A      [ 1] 1256     bres PC_ODR,#LED2_BIT 
      00882C 81               [ 4] 1257     ret 
                                   1258 
                                   1259 ; invert LED status 
      00882D                       1260 ledtoggle:
      00882D A6 20            [ 1] 1261     ld a,#LED2_MASK
      00882F C8 50 0A         [ 1] 1262     xor a,PC_ODR
      008832 C7 50 0A         [ 1] 1263     ld PC_ODR,a
      008835 81               [ 4] 1264     ret 
                                   1265 
      008836                       1266 left_paren:
      008836 A6 20            [ 1] 1267 	ld a,#SPACE 
      008838 CD 82 9E         [ 4] 1268 	call putc
      00883B A6 28            [ 1] 1269 	ld a,#'( 
      00883D CD 82 9E         [ 4] 1270 	call putc 	
      008840 81               [ 4] 1271 	ret 
                                   1272 
                                   1273 ;------------------------------
                                   1274 ; print 8 bit register 
                                   1275 ; input:
                                   1276 ;   X  point to register name 
                                   1277 ;   A  register value to print 
                                   1278 ; output:
                                   1279 ;   none
                                   1280 ;------------------------------- 
      008841                       1281 prt_reg8:
      008841 88               [ 1] 1282 	push a 
      008842 CD 82 B0         [ 4] 1283 	call puts 
      008845 7B 01            [ 1] 1284 	ld a,(1,sp) 
      008847 C7 00 0B         [ 1] 1285 	ld acc8,a 
      00884A 5F               [ 1] 1286 	clrw x 
      00884B CF 00 09         [ 2] 1287 	ldw acc24,x 
      00884E A6 10            [ 1] 1288 	ld a,#16 
      008850 CD 89 4E         [ 4] 1289 	call prti24 
      008853 CD 88 36         [ 4] 1290 	call left_paren 
      008856 84               [ 1] 1291 	pop a 
      008857 C7 00 0B         [ 1] 1292 	ld acc8,a 
      00885A 5F               [ 1] 1293 	clrw x 
      00885B CF 00 09         [ 2] 1294 	ldw acc24,x 
      00885E A6 0A            [ 1] 1295 	ld a,#10 
      008860 CD 89 4E         [ 4] 1296 	call prti24 
      008863 A6 29            [ 1] 1297 	ld a,#') 
      008865 CD 82 9E         [ 4] 1298 	call putc
      008868 81               [ 4] 1299 	ret
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



      008869                       1309 prt_reg16: 
      008869 90 89            [ 2] 1310 	pushw y 
      00886B CD 82 B0         [ 4] 1311 	call puts 
      00886E 1E 01            [ 2] 1312 	ldw x,(1,sp) 
      008870 CF 00 0A         [ 2] 1313 	ldw acc16,x 
      008873 72 5F 00 09      [ 1] 1314 	clr acc24 
      008877 5F               [ 1] 1315 	clrw x 
      008878 A6 10            [ 1] 1316 	ld a,#16 
      00887A CD 89 4E         [ 4] 1317 	call prti24 
      00887D CD 88 36         [ 4] 1318 	call left_paren 
      008880 85               [ 2] 1319 	popw x 
      008881 CF 00 0A         [ 2] 1320 	ldw acc16,x 
      008884 72 5F 00 09      [ 1] 1321 	clr acc24
      008888 72 0F 00 0A 04   [ 2] 1322 	btjf acc16,#7,1$
      00888D 72 53 00 09      [ 1] 1323 	cpl acc24 
      008891 5F               [ 1] 1324 1$:	clrw x 
      008892 A6 0A            [ 1] 1325 	ld a,#10 
      008894 CD 89 4E         [ 4] 1326 	call prti24 
      008897 A6 29            [ 1] 1327 	ld a,#') 
      008899 CD 82 9E         [ 4] 1328 	call putc
      00889C 81               [ 4] 1329 	ret 
                                   1330 
                                   1331 ;------------------------------------
                                   1332 ; print registers contents saved on
                                   1333 ; stack by trap interrupt.
                                   1334 ;------------------------------------
      00889D                       1335 print_registers:
      00889D AE 88 F0         [ 2] 1336 	ldw x,#STATES
      0088A0 CD 82 B0         [ 4] 1337 	call puts
                                   1338 ; print EPC 
      0088A3 AE 89 2D         [ 2] 1339 	ldw x, #REG_EPC
      0088A6 CD 82 B0         [ 4] 1340 	call puts 
      0088A9 7B 0B            [ 1] 1341 	ld a, (11,sp)
      0088AB C7 00 0B         [ 1] 1342 	ld acc8,a 
      0088AE 7B 0A            [ 1] 1343 	ld a, (10,sp) 
      0088B0 C7 00 0A         [ 1] 1344 	ld acc16,a 
      0088B3 7B 09            [ 1] 1345 	ld a,(9,sp) 
      0088B5 C7 00 09         [ 1] 1346 	ld acc24,a
      0088B8 5F               [ 1] 1347 	clrw x  
      0088B9 A6 10            [ 1] 1348 	ld a,#16
      0088BB CD 89 4E         [ 4] 1349 	call prti24  
                                   1350 ; print X
      0088BE AE 89 38         [ 2] 1351 	ldw x,#REG_X
      0088C1 16 05            [ 2] 1352 	ldw y,(5,sp)
      0088C3 CD 88 69         [ 4] 1353 	call prt_reg16  
                                   1354 ; print Y 
      0088C6 AE 89 33         [ 2] 1355 	ldw x,#REG_Y
      0088C9 16 07            [ 2] 1356 	ldw y, (7,sp)
      0088CB CD 88 69         [ 4] 1357 	call prt_reg16  
                                   1358 ; print A 
      0088CE AE 89 3D         [ 2] 1359 	ldw x,#REG_A
      0088D1 7B 04            [ 1] 1360 	ld a, (4,sp) 
      0088D3 CD 88 41         [ 4] 1361 	call prt_reg8
                                   1362 ; print CC 
      0088D6 AE 89 42         [ 2] 1363 	ldw x,#REG_CC 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 27.
Hexadecimal [24-Bits]



      0088D9 7B 03            [ 1] 1364 	ld a, (3,sp) 
      0088DB CD 88 41         [ 4] 1365 	call prt_reg8 
                                   1366 ; print SP 
      0088DE AE 89 48         [ 2] 1367 	ldw x,#REG_SP
      0088E1 90 96            [ 1] 1368 	ldw y,sp 
      0088E3 72 A9 00 0C      [ 2] 1369 	addw y,#12
      0088E7 CD 88 69         [ 4] 1370 	call prt_reg16  
      0088EA A6 0A            [ 1] 1371 	ld a,#'\n' 
      0088EC CD 82 9E         [ 4] 1372 	call putc
      0088EF 81               [ 4] 1373 	ret
                                   1374 
      0088F0 0A 52 65 67 69 73 74  1375 STATES:  .asciz "\nRegisters state at abort point.\n--------------------------\n"
             65 72 73 20 73 74 61
             74 65 20 61 74 20 61
             62 6F 72 74 20 70 6F
             69 6E 74 2E 0A 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 0A 00
      00892D 45 50 43 3A 20 00     1376 REG_EPC: .asciz "EPC: "
      008933 0A 59 3A 20 00        1377 REG_Y:   .asciz "\nY: " 
      008938 0A 58 3A 20 00        1378 REG_X:   .asciz "\nX: "
      00893D 0A 41 3A 20 00        1379 REG_A:   .asciz "\nA: " 
      008942 0A 43 43 3A 20 00     1380 REG_CC:  .asciz "\nCC: "
      008948 0A 53 50 3A 20 00     1381 REG_SP:  .asciz "\nSP: "
                                   1382 .endif 
                                   1383 
                                   1384 ;------------------------------------
                                   1385 ; print integer in acc24 
                                   1386 ; input:
                                   1387 ;	acc24 		integer to print 
                                   1388 ;	A 			numerical base for conversion 
                                   1389 ;               if bit 7 is set add a space at print end.
                                   1390 ;   XL 			field width, 0 -> no fill.
                                   1391 ;  output:
                                   1392 ;    none 
                                   1393 ;------------------------------------
                           000001  1394 	WIDTH = 1
                           000002  1395 	BASE = 2
                           000003  1396 	ADD_SPACE=3 ; add a space after number 
                           000003  1397 	VSIZE = 3
      00894E                       1398 prti24:
      0008CE                       1399 	_vars VSIZE 
      00894E 52 03            [ 2]    1     sub sp,#VSIZE 
      008950 0F 03            [ 1] 1400 	clr (ADD_SPACE,sp)
      008952 A5 80            [ 1] 1401 	bcp a,#0x80 
      008954 27 02            [ 1] 1402 	jreq 0$ 
      008956 03 03            [ 1] 1403 	cpl (ADD_SPACE,sp)
      008958 A4 1F            [ 1] 1404 0$:	and a,#31 
      00895A 6B 02            [ 1] 1405 	ld (BASE,sp),a
      00895C 9F               [ 1] 1406 	ld a,xl
      00895D 6B 01            [ 1] 1407 	ld (WIDTH,sp),a 
      00895F 7B 02            [ 1] 1408 	ld a, (BASE,sp)  
      008961 CD 89 FF         [ 4] 1409     call itoa  ; conversion entier en  .asciz
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 28.
Hexadecimal [24-Bits]



      008964 7B 01            [ 1] 1410 1$: ld a,(WIDTH,sp)
      008966 27 1F            [ 1] 1411 	jreq 4$
      008968 C7 00 0B         [ 1] 1412 	ld acc8,a 
      00896B 89               [ 2] 1413 	pushw x 
      00896C CD 83 72         [ 4] 1414 	call strlen 
      00896F 9F               [ 1] 1415 	ld a,xl 
      008970 85               [ 2] 1416 	popw x 
      008971 31 00 0B         [ 3] 1417 	exg a,acc8 
      008974 C0 00 0B         [ 1] 1418 	sub a,acc8 
      008977 2B 0E            [ 1] 1419 	jrmi 4$
      008979 6B 01            [ 1] 1420 	ld (WIDTH,sp),a 
      00897B A6 20            [ 1] 1421 	ld  a,#SPACE
      00897D 0D 01            [ 1] 1422 3$: tnz (WIDTH,sp)
      00897F 27 06            [ 1] 1423 	jreq 4$
      008981 5A               [ 2] 1424 	decw x 
      008982 F7               [ 1] 1425 	ld (x),a 
      008983 0A 01            [ 1] 1426 	dec (WIDTH,sp) 
      008985 20 F6            [ 2] 1427 	jra 3$
      008987                       1428 4$: 
      008987 CD 82 B0         [ 4] 1429 	call puts 
      00898A 0D 03            [ 1] 1430 	tnz (ADD_SPACE,sp)
      00898C 27 05            [ 1] 1431 	jreq 5$
      00898E A6 20            [ 1] 1432     ld a,#SPACE 
      008990 CD 82 9E         [ 4] 1433 	call putc 
      000913                       1434 5$: _drop VSIZE 
      008993 5B 03            [ 2]    1     addw sp,#VSIZE 
      008995 81               [ 4] 1435     ret	
                                   1436 
                                   1437 ;-----------------------------
                                   1438 ; intialize parser ready for
                                   1439 ; for a new line analysis
                                   1440 ; input:
                                   1441 ;   none
                                   1442 ; output:
                                   1443 ;	none 
                                   1444 ;------------------------------
      008996                       1445 parser_init::
      008996 72 5F 00 01      [ 1] 1446 	clr in.w 
      00899A 72 5F 00 02      [ 1] 1447 	clr in
      00899E 72 5F 17 18      [ 1] 1448 	clr pad  
      0089A2 81               [ 4] 1449 	ret 
                                   1450 
                                   1451 ;-----------------------------------
                                   1452 ; print a 16 bit integer 
                                   1453 ; using variable 'base' as conversion
                                   1454 ; format.
                                   1455 ; input:
                                   1456 ;   X       integer to print 
                                   1457 ;   base    conversion base 
                                   1458 ; output:
                                   1459 ;   none 
                                   1460 ;-----------------------------------
                           000001  1461 	SIGN=1
                           000001  1462 	VSIZE=1
      0089A3                       1463 print_int: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 29.
Hexadecimal [24-Bits]



      000923                       1464 	_vars VSIZE 
      0089A3 52 01            [ 2]    1     sub sp,#VSIZE 
      0089A5 0F 01            [ 1] 1465 	clr (SIGN,sp)
      0089A7 90 AE 17 3F      [ 2] 1466 	ldw y,#pad+PAD_SIZE-1 
      0089AB 90 7F            [ 1] 1467 	clr (y)
      0089AD C6 00 08         [ 1] 1468 	ld a,base  
      0089B0 A1 0A            [ 1] 1469 	cp a,#10 
      0089B2 26 06            [ 1] 1470 	jrne 1$ 
      0089B4 5D               [ 2] 1471 	tnzw x 
      0089B5 2A 03            [ 1] 1472 	jrpl 1$ 
      0089B7 03 01            [ 1] 1473 	cpl (SIGN,sp)
      0089B9 50               [ 2] 1474 	negw x 	 
      0089BA                       1475 1$:	
      0089BA C6 00 08         [ 1] 1476 	ld a,base 
      0089BD 62               [ 2] 1477 	div x,a 
      0089BE AB 30            [ 1] 1478 	add a,#'0 
      0089C0 A1 3A            [ 1] 1479 	cp a,#'9+1 
      0089C2 2B 02            [ 1] 1480 	jrmi 2$ 
      0089C4 AB 07            [ 1] 1481 	add a,#7 
      0089C6 90 5A            [ 2] 1482 2$: decw y 
      0089C8 90 F7            [ 1] 1483 	ld (y),a 
      0089CA 5D               [ 2] 1484 	tnzw x 
      0089CB 26 ED            [ 1] 1485 	jrne 1$ 
      0089CD A6 10            [ 1] 1486 	ld a,#16 
      0089CF C1 00 08         [ 1] 1487 	cp a,base 
      0089D2 26 08            [ 1] 1488 	jrne 3$
      0089D4 A6 24            [ 1] 1489 	ld a,#'$
      0089D6 90 5A            [ 2] 1490 	decw y  
      0089D8 90 F7            [ 1] 1491 	ld (y),a
      0089DA 20 0A            [ 2] 1492 	jra 9$ 
      0089DC 0D 01            [ 1] 1493 3$: tnz (SIGN,sp)
      0089DE 27 06            [ 1] 1494 	jreq 9$ 
      0089E0 A6 2D            [ 1] 1495 	ld a,#'-
      0089E2 90 5A            [ 2] 1496 	decw y  
      0089E4 90 F7            [ 1] 1497 	ld (y),a
      0089E6                       1498 9$:	
      0089E6 93               [ 1] 1499 	ldw x,y 
      0089E7 1D 17 3F         [ 2] 1500 	subw x,#pad+PAD_SIZE-1 
      0089EA 50               [ 2] 1501 	negw x  
      0089EB                       1502 10$:
      0089EB 90 5A            [ 2] 1503 	decw y 
      0089ED A6 20            [ 1] 1504 	ld a,#SPACE 
      0089EF 90 F7            [ 1] 1505 	ld (y),a
      0089F1 5C               [ 1] 1506 	incw x 
      0089F2 9F               [ 1] 1507 	ld a,xl 
      0089F3 C1 00 26         [ 1] 1508 	cp a,tab_width
      0089F6 2B F3            [ 1] 1509 	jrmi 10$ 
      0089F8                       1510 12$:
      0089F8 93               [ 1] 1511     ldw x,y 
      0089F9 CD 82 B0         [ 4] 1512 	call puts  
      00097C                       1513 	_drop VSIZE 
      0089FC 5B 01            [ 2]    1     addw sp,#VSIZE 
      0089FE 81               [ 4] 1514 	ret 
                                   1515 
                                   1516 ;------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 30.
Hexadecimal [24-Bits]



                                   1517 ; convert integer to string
                                   1518 ; input:
                                   1519 ;   A	  	base
                                   1520 ;	acc24	integer to convert
                                   1521 ; output:
                                   1522 ;   X  		pointer to string
                                   1523 ;------------------------------------
                           000001  1524 	SIGN=1  ; integer sign 
                           000002  1525 	BASE=2  ; numeric base 
                           000002  1526 	VSIZE=2  ;locals size
      0089FF                       1527 itoa:
      0089FF 52 02            [ 2] 1528 	sub sp,#VSIZE
      008A01 6B 02            [ 1] 1529 	ld (BASE,sp), a  ; base
      008A03 0F 01            [ 1] 1530 	clr (SIGN,sp)    ; sign
      008A05 A1 0A            [ 1] 1531 	cp a,#10
      008A07 26 0A            [ 1] 1532 	jrne 1$
                                   1533 	; base 10 string display with negative sign if bit 23==1
      008A09 72 0F 00 09 05   [ 2] 1534 	btjf acc24,#7,1$
      008A0E 03 01            [ 1] 1535 	cpl (SIGN,sp)
      008A10 CD 8A 6E         [ 4] 1536 	call neg_acc24
      008A13                       1537 1$:
                                   1538 ; initialize string pointer 
      008A13 AE 17 3F         [ 2] 1539 	ldw x,#pad+PAD_SIZE-1
      008A16 7F               [ 1] 1540 	clr (x)
      008A17                       1541 itoa_loop:
      008A17 7B 02            [ 1] 1542     ld a,(BASE,sp)
      008A19 CD 8A 46         [ 4] 1543     call divu24_8 ; acc24/A 
      008A1C AB 30            [ 1] 1544     add a,#'0  ; remainder of division
      008A1E A1 3A            [ 1] 1545     cp a,#'9+1
      008A20 2B 02            [ 1] 1546     jrmi 2$
      008A22 AB 07            [ 1] 1547     add a,#7 
      008A24 5A               [ 2] 1548 2$: decw x
      008A25 F7               [ 1] 1549     ld (x),a
                                   1550 	; if acc24==0 conversion done
      008A26 C6 00 09         [ 1] 1551 	ld a,acc24
      008A29 CA 00 0A         [ 1] 1552 	or a,acc16
      008A2C CA 00 0B         [ 1] 1553 	or a,acc8
      008A2F 26 E6            [ 1] 1554     jrne itoa_loop
                                   1555 	;conversion done, next add '$' or '-' as required
      008A31 7B 02            [ 1] 1556 	ld a,(BASE,sp)
      008A33 A1 10            [ 1] 1557 	cp a,#16
      008A35 27 08            [ 1] 1558 	jreq 8$
      008A37 7B 01            [ 1] 1559 	ld a,(SIGN,sp)
      008A39 27 08            [ 1] 1560     jreq 10$
      008A3B A6 2D            [ 1] 1561     ld a,#'-
      008A3D 20 02            [ 2] 1562 	jra 9$ 
      008A3F A6 24            [ 1] 1563 8$: ld a,#'$ 
      008A41 5A               [ 2] 1564 9$: decw x
      008A42 F7               [ 1] 1565     ld (x),a
      008A43                       1566 10$:
      008A43 5B 02            [ 2] 1567 	addw sp,#VSIZE
      008A45 81               [ 4] 1568 	ret
                                   1569 
                                   1570 ;-------------------------------------
                                   1571 ; divide uint24_t by uint8_t
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 31.
Hexadecimal [24-Bits]



                                   1572 ; used to convert uint24_t to string
                                   1573 ; input:
                                   1574 ;	acc24	dividend
                                   1575 ;   A 		divisor
                                   1576 ; output:
                                   1577 ;   acc24	quotient
                                   1578 ;   A		remainder
                                   1579 ;------------------------------------- 
                                   1580 ; offset  on sp of arguments and locals
                           000001  1581 	U8   = 1   ; divisor on stack
                           000001  1582 	VSIZE =1
      008A46                       1583 divu24_8:
      008A46 89               [ 2] 1584 	pushw x ; save x
      008A47 88               [ 1] 1585 	push a 
                                   1586 	; ld dividend UU:MM bytes in X
      008A48 C6 00 09         [ 1] 1587 	ld a, acc24
      008A4B 95               [ 1] 1588 	ld xh,a
      008A4C C6 00 0A         [ 1] 1589 	ld a,acc24+1
      008A4F 97               [ 1] 1590 	ld xl,a
      008A50 7B 01            [ 1] 1591 	ld a,(U8,SP) ; divisor
      008A52 62               [ 2] 1592 	div x,a ; UU:MM/U8
      008A53 88               [ 1] 1593 	push a  ;save remainder
      008A54 9E               [ 1] 1594 	ld a,xh
      008A55 C7 00 09         [ 1] 1595 	ld acc24,a
      008A58 9F               [ 1] 1596 	ld a,xl
      008A59 C7 00 0A         [ 1] 1597 	ld acc24+1,a
      008A5C 84               [ 1] 1598 	pop a
      008A5D 95               [ 1] 1599 	ld xh,a
      008A5E C6 00 0B         [ 1] 1600 	ld a,acc24+2
      008A61 97               [ 1] 1601 	ld xl,a
      008A62 7B 01            [ 1] 1602 	ld a,(U8,sp) ; divisor
      008A64 62               [ 2] 1603 	div x,a  ; R:LL/U8
      008A65 6B 01            [ 1] 1604 	ld (U8,sp),a ; save remainder
      008A67 9F               [ 1] 1605 	ld a,xl
      008A68 C7 00 0B         [ 1] 1606 	ld acc24+2,a
      008A6B 84               [ 1] 1607 	pop a
      008A6C 85               [ 2] 1608 	popw x
      008A6D 81               [ 4] 1609 	ret
                                   1610 
                                   1611 ;------------------------------------
                                   1612 ;  two's complement acc24
                                   1613 ;  input:
                                   1614 ;		acc24 variable
                                   1615 ;  output:
                                   1616 ;		acc24 variable
                                   1617 ;-------------------------------------
      008A6E                       1618 neg_acc24:
      008A6E 72 53 00 0B      [ 1] 1619 	cpl acc24+2
      008A72 72 53 00 0A      [ 1] 1620 	cpl acc24+1
      008A76 72 53 00 09      [ 1] 1621 	cpl acc24
      008A7A A6 01            [ 1] 1622 	ld a,#1
      008A7C CB 00 0B         [ 1] 1623 	add a,acc24+2
      008A7F C7 00 0B         [ 1] 1624 	ld acc24+2,a
      008A82 4F               [ 1] 1625 	clr a
      008A83 C9 00 0A         [ 1] 1626 	adc a,acc24+1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 32.
Hexadecimal [24-Bits]



      008A86 C7 00 0A         [ 1] 1627 	ld acc24+1,a 
      008A89 4F               [ 1] 1628 	clr a 
      008A8A C9 00 09         [ 1] 1629 	adc a,acc24 
      008A8D C7 00 09         [ 1] 1630 	ld acc24,a 
      008A90 81               [ 4] 1631 	ret
                                   1632 
                                   1633 
                                   1634 ;------------------------------------
                                   1635 ; read a line of text from terminal
                                   1636 ; input:
                                   1637 ;	none
                                   1638 ; local variable on stack:
                                   1639 ;	LL (1,sp)
                                   1640 ;   RXCHAR (2,sp)
                                   1641 ; output:
                                   1642 ;   text in tib  buffer
                                   1643 ;------------------------------------
                                   1644 	; local variables
                           000001  1645 	LL_HB=1
                           000001  1646 	RXCHAR = 1 ; last char received
                           000002  1647 	LL = 2  ; accepted line length
                           000002  1648 	VSIZE=2 
      008A91                       1649 readln:
      008A91 5F               [ 1] 1650 	clrw x 
      008A92 89               [ 2] 1651 	pushw x 
      008A93 90 AE 16 C8      [ 2] 1652  	ldw y,#tib ; input buffer
      008A97                       1653 readln_loop:
      008A97 CD 82 A7         [ 4] 1654 	call getc
      008A9A 6B 01            [ 1] 1655 	ld (RXCHAR,sp),a
      008A9C A1 0D            [ 1] 1656 	cp a,#CR
      008A9E 26 03            [ 1] 1657 	jrne 1$
      008AA0 CC 8B 10         [ 2] 1658 	jp readln_quit
      008AA3 A1 0A            [ 1] 1659 1$:	cp a,#NL
      008AA5 27 69            [ 1] 1660 	jreq readln_quit
      008AA7 A1 08            [ 1] 1661 	cp a,#BSP
      008AA9 27 41            [ 1] 1662 	jreq del_back
      008AAB A1 04            [ 1] 1663 	cp a,#CTRL_D
      008AAD 27 2E            [ 1] 1664 	jreq del_ln
      008AAF A1 12            [ 1] 1665 	cp a,#CTRL_R 
      008AB1 27 06            [ 1] 1666 	jreq reprint 
                                   1667 ;	cp a,#'[
                                   1668 ;	jreq ansi_seq
      008AB3                       1669 final_test:
      008AB3 A1 20            [ 1] 1670 	cp a,#SPACE
      008AB5 2A 44            [ 1] 1671 	jrpl accept_char
      008AB7 20 DE            [ 2] 1672 	jra readln_loop
      008AB9                       1673 ansi_seq:
                                   1674 ;	call getc
                                   1675 ;	cp a,#'C 
                                   1676 ;	jreq rigth_arrow
                                   1677 ;	cp a,#'D 
                                   1678 ;	jreq left_arrow 
                                   1679 ;	jra final_test
      008AB9                       1680 right_arrow:
                                   1681 ;	ld a,#BSP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 33.
Hexadecimal [24-Bits]



                                   1682 ;	call putc 
                                   1683 ;	jra realn_loop 
      008AB9                       1684 left_arrow:
                                   1685 
                                   1686 ;	jra readln_loop
      008AB9                       1687 reprint: 
      008AB9 72 5D 00 03      [ 1] 1688 	tnz count 
      008ABD 27 D8            [ 1] 1689 	jreq readln_loop
      008ABF 0D 02            [ 1] 1690 	tnz (LL,sp)
      008AC1 26 D4            [ 1] 1691 	jrne readln_loop
      008AC3 AE 16 C8         [ 2] 1692 	ldw x,#tib 
      008AC6 CD 82 B0         [ 4] 1693 	call puts
      008AC9 90 AE 16 C8      [ 2] 1694 	ldw y,#tib 
      008ACD C6 00 03         [ 1] 1695 	ld a,count 
      008AD0 6B 02            [ 1] 1696 	ld (LL,sp),a
      008AD2 72 5F 00 03      [ 1] 1697 	clr count 
      008AD6 0F 01            [ 1] 1698 	clr (LL_HB,sp)
      008AD8 72 F9 01         [ 2] 1699 	addw y,(LL_HB,sp)
      008ADB 20 BA            [ 2] 1700 	jra readln_loop 
      008ADD                       1701 del_ln:
      008ADD 7B 02            [ 1] 1702 	ld a,(LL,sp)
      008ADF CD 82 CA         [ 4] 1703 	call delete
      008AE2 90 AE 16 C8      [ 2] 1704 	ldw y,#tib
      008AE6 90 7F            [ 1] 1705 	clr (y)
      008AE8 0F 02            [ 1] 1706 	clr (LL,sp)
      008AEA 20 AB            [ 2] 1707 	jra readln_loop
      008AEC                       1708 del_back:
      008AEC 0D 02            [ 1] 1709     tnz (LL,sp)
      008AEE 27 A7            [ 1] 1710     jreq readln_loop
      008AF0 0A 02            [ 1] 1711     dec (LL,sp)
      008AF2 90 5A            [ 2] 1712     decw y
      008AF4 90 7F            [ 1] 1713     clr  (y)
      008AF6 CD 82 BA         [ 4] 1714     call bksp 
      008AF9 20 9C            [ 2] 1715     jra readln_loop	
      008AFB                       1716 accept_char:
      008AFB A6 4F            [ 1] 1717 	ld a,#TIB_SIZE-1
      008AFD 11 02            [ 1] 1718 	cp a, (LL,sp)
      008AFF 27 96            [ 1] 1719 	jreq readln_loop
      008B01 7B 01            [ 1] 1720 	ld a,(RXCHAR,sp)
      008B03 90 F7            [ 1] 1721 	ld (y),a
      008B05 0C 02            [ 1] 1722 	inc (LL,sp)
      008B07 90 5C            [ 1] 1723 	incw y
      008B09 90 7F            [ 1] 1724 	clr (y)
      008B0B CD 82 9E         [ 4] 1725 	call putc 
      008B0E 20 87            [ 2] 1726 	jra readln_loop
      008B10                       1727 readln_quit:
      008B10 90 7F            [ 1] 1728 	clr (y)
      008B12 7B 02            [ 1] 1729 	ld a,(LL,sp)
      008B14 C7 00 03         [ 1] 1730 	ld count,a 
      000A97                       1731 	_drop VSIZE 
      008B17 5B 02            [ 2]    1     addw sp,#VSIZE 
      008B19 A6 0D            [ 1] 1732 	ld a,#CR
      008B1B CD 82 9E         [ 4] 1733 	call putc
      008B1E 81               [ 4] 1734 	ret
                                   1735 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 34.
Hexadecimal [24-Bits]



                           000001  1736 .if DEBUG 	
                                   1737 ;----------------------------
                                   1738 ; command interface
                                   1739 ; only 2 commands:
                                   1740 ;  'q' to resume application
                                   1741 ;  'p [addr]' to print memory values 
                                   1742 ;  's addr' to print string 
                                   1743 ;----------------------------
                                   1744 ;local variable 
                           000001  1745 	PSIZE=1
                           000001  1746 	VSIZE=1 
      008B1F                       1747 cmd_itf:
      008B1F 52 01            [ 2] 1748 	sub sp,#VSIZE 
      008B21 72 5F 00 14      [ 1] 1749 	clr farptr 
      008B25 72 5F 00 15      [ 1] 1750 	clr farptr+1 
      008B29 72 5F 00 16      [ 1] 1751 	clr farptr+2  
      008B2D                       1752 repl:
      008B2D A6 0D            [ 1] 1753 	ld a,#CR 
      008B2F CD 82 9E         [ 4] 1754 	call putc 
      008B32 A6 3F            [ 1] 1755 	ld a,#'? 
      008B34 CD 82 9E         [ 4] 1756 	call putc
      008B37 72 5F 00 01      [ 1] 1757 	clr in.w 
      008B3B 72 5F 00 02      [ 1] 1758 	clr in 
      008B3F CD 8A 91         [ 4] 1759 	call readln
      008B42 CD 8D 1B         [ 4] 1760 	call get_token
      008B45 90 AE 17 18      [ 2] 1761 	ldw y,#pad 
      008B49 90 F6            [ 1] 1762 	ld a,(y)
      008B4B 90 5C            [ 1] 1763 	incw y
      008B4D A1 51            [ 1] 1764 	cp a,#'Q 
      008B4F 26 0B            [ 1] 1765 	jrne test_p
      008B51                       1766 repl_exit:
      000AD1                       1767 	_drop #VSIZE 	
      008B51 5B 01            [ 2]    1     addw sp,##VSIZE 
      008B53 81               [ 4] 1768 	ret  
      008B54                       1769 invalid:
      008B54 AE 8B C2         [ 2] 1770 	ldw x,#invalid_cmd 
      008B57 CD 82 B0         [ 4] 1771 	call puts 
      008B5A 20 D1            [ 2] 1772 	jra repl 
      008B5C                       1773 test_p:	
      008B5C A1 50            [ 1] 1774     cp a,#'P 
      008B5E 27 10            [ 1] 1775 	jreq mem_peek
      008B60 A1 53            [ 1] 1776     cp a,#'S 
      008B62 26 F0            [ 1] 1777 	jrne invalid 
      008B64                       1778 print_string:	
      008B64 CD 8D 1B         [ 4] 1779 	call get_token
      008B67 CE 00 0A         [ 2] 1780 	ldw x,acc16 
      008B6A CD 82 B0         [ 4] 1781 	call puts
      008B6D CC 8B 2D         [ 2] 1782 	jp repl 	
      008B70                       1783 mem_peek:	 
      008B70 CD 8D 1B         [ 4] 1784 	call get_token
      008B73 C6 00 09         [ 1] 1785 	ld a, acc24 
      008B76 CA 00 0A         [ 1] 1786 	or a,acc16 
      008B79 CA 00 0B         [ 1] 1787 	or a,acc8 
      008B7C 26 02            [ 1] 1788 	jrne 1$ 
      008B7E 20 0C            [ 2] 1789 	jra peek_byte  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 35.
Hexadecimal [24-Bits]



      008B80 CE 00 09         [ 2] 1790 1$:	ldw x,acc24 
      008B83 CF 00 14         [ 2] 1791 	ldw farptr,x 
      008B86 C6 00 0B         [ 1] 1792 	ld a,acc8 
      008B89 C7 00 16         [ 1] 1793 	ld farptr+2,a 
      008B8C                       1794 peek_byte:
      008B8C CD 8B D1         [ 4] 1795 	call print_farptr 
      008B8F A6 08            [ 1] 1796 	ld a,#8 
      008B91 6B 01            [ 1] 1797 	ld (PSIZE,sp),a 
      008B93 5F               [ 1] 1798 	clrw x 
      008B94 CD 8B EC         [ 4] 1799 1$:	call fetchc  
      008B97 89               [ 2] 1800 	pushw x 
      008B98 C7 00 0B         [ 1] 1801 	ld acc8,a 
      008B9B 5F               [ 1] 1802 	clrw x 
      008B9C CF 00 09         [ 2] 1803 	ldw acc24,x 
      008B9F A6 90            [ 1] 1804 	ld a,#16+128
      008BA1 CD 89 4E         [ 4] 1805 	call prti24
      008BA4 85               [ 2] 1806 	popw x 
      008BA5 0A 01            [ 1] 1807 	dec (PSIZE,sp)
      008BA7 26 EB            [ 1] 1808 	jrne 1$ 
      008BA9 A6 08            [ 1] 1809 	ld a,#8 
      008BAB CB 00 16         [ 1] 1810 	add a,farptr+2 
      008BAE C7 00 16         [ 1] 1811 	ld farptr+2,a
      008BB1 4F               [ 1] 1812 	clr a 
      008BB2 C9 00 15         [ 1] 1813 	adc a,farptr+1 
      008BB5 C7 00 15         [ 1] 1814 	ld farptr+1,a 
      008BB8 4F               [ 1] 1815 	clr a 
      008BB9 C9 00 14         [ 1] 1816 	adc a,farptr 
      008BBC C7 00 14         [ 1] 1817 	ld farptr,a 
      008BBF CC 8B 2D         [ 2] 1818 	jp repl  
                                   1819 
                                   1820 
      008BC2 6E 6F 74 20 61 20 63  1821 invalid_cmd: .asciz "not a command\n" 
             6F 6D 6D 61 6E 64 0A
             00
                                   1822 
                                   1823 ;----------------------------
                                   1824 ; display farptr address
                                   1825 ;----------------------------
      008BD1                       1826 print_farptr:
      008BD1 C6 00 16         [ 1] 1827 	ld a ,farptr+2 
      008BD4 C7 00 0B         [ 1] 1828 	ld acc8,a 
      008BD7 CE 00 14         [ 2] 1829 	ldw x,farptr 
      008BDA CF 00 09         [ 2] 1830 	ldw acc24,x 
      008BDD 5F               [ 1] 1831 	clrw x 
      008BDE A6 10            [ 1] 1832 	ld a,#16 
      008BE0 CD 89 4E         [ 4] 1833 	call prti24
      008BE3 A6 20            [ 1] 1834 	ld a,#SPACE 
      008BE5 CD 82 9E         [ 4] 1835 	call putc 
      008BE8 CD 82 9E         [ 4] 1836 	call putc 
      008BEB 81               [ 4] 1837 	ret
                                   1838 
                                   1839 ;------------------------------------
                                   1840 ; get byte at address farptr[X]
                                   1841 ; input:
                                   1842 ;	 farptr   address to peek
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 36.
Hexadecimal [24-Bits]



                                   1843 ;    X		  farptr index 	
                                   1844 ; output:
                                   1845 ;	 A 		  byte from memory  
                                   1846 ;    x		  incremented by 1
                                   1847 ;------------------------------------
      008BEC                       1848 fetchc: ; @C
      008BEC 92 AF 00 14      [ 5] 1849 	ldf a,([farptr],x)
      008BF0 5C               [ 1] 1850 	incw x
      008BF1 81               [ 4] 1851 	ret
                                   1852 
                                   1853 
                                   1854 ;------------------------------------
                                   1855 ; expect a number from command line 
                                   1856 ; next argument
                                   1857 ;  input:
                                   1858 ;	  none
                                   1859 ;  output:
                                   1860 ;    acc24   int24_t 
                                   1861 ;------------------------------------
      008BF2                       1862 number::
      008BF2 CD 8D 1B         [ 4] 1863 	call get_token
      008BF5 CD 8F 0F         [ 4] 1864 	call atoi
      008BF8 81               [ 4] 1865 	ret
                                   1866 .endif
                                   1867 
                                   1868 ;------------------------------------
                                   1869 ; parse quoted string 
                                   1870 ; input:
                                   1871 ;   Y 	pointer to tib 
                                   1872 ;   X   pointer to pad
                                   1873 ; output:
                                   1874 ;	pad   parsed string
                                   1875 ;   TOS  char* to pad  
                                   1876 ;------------------------------------
                           000001  1877 	PREV = 1
                           000002  1878 	CURR =2 
                           000002  1879 	VSIZE=2 
      008BF9                       1880 parse_quote: ; { -- addr }
      000B79                       1881 	_vars VSIZE 
      008BF9 52 02            [ 2]    1     sub sp,#VSIZE 
      008BFB 4F               [ 1] 1882 	clr a
      008BFC 6B 01            [ 1] 1883 1$:	ld (PREV,sp),a 
      008BFE 72 5C 00 02      [ 1] 1884 2$:	inc in
      008C02 91 D6 01         [ 4] 1885 	ld a,([in.w],y)
      008C05 27 24            [ 1] 1886 	jreq 6$
      008C07 6B 02            [ 1] 1887 	ld (CURR,sp),a 
      008C09 A6 5C            [ 1] 1888 	ld a,#'\
      008C0B 11 01            [ 1] 1889 	cp a, (PREV,sp)
      008C0D 26 0A            [ 1] 1890 	jrne 3$
      008C0F 0F 01            [ 1] 1891 	clr (PREV,sp)
      008C11 7B 02            [ 1] 1892 	ld a,(CURR,sp)
      008C13 AD 1F            [ 4] 1893 	callr convert_escape
      008C15 F7               [ 1] 1894 	ld (x),a 
      008C16 5C               [ 1] 1895 	incw x 
      008C17 20 E5            [ 2] 1896 	jra 2$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 37.
Hexadecimal [24-Bits]



      008C19                       1897 3$:
      008C19 7B 02            [ 1] 1898 	ld a,(CURR,sp)
      008C1B A1 5C            [ 1] 1899 	cp a,#'\'
      008C1D 27 DD            [ 1] 1900 	jreq 1$
      008C1F A1 22            [ 1] 1901 	cp a,#'"
      008C21 27 04            [ 1] 1902 	jreq 5$ 
      008C23 F7               [ 1] 1903 	ld (x),a 
      008C24 5C               [ 1] 1904 	incw x 
      008C25 20 D7            [ 2] 1905 	jra 2$
      008C27 72 5C 00 02      [ 1] 1906 5$:	inc in 
      008C2B 7F               [ 1] 1907 6$: clr (x)
      008C2C AE 17 18         [ 2] 1908 	ldw x,#pad 
      000BAF                       1909 	_drop VSIZE
      008C2F 5B 02            [ 2]    1     addw sp,#VSIZE 
      008C31 A6 06            [ 1] 1910 	ld a,#TK_QSTR  
      008C33 81               [ 4] 1911 	ret 
                                   1912 
                                   1913 ;---------------------------------------
                                   1914 ; called by parse_quote
                                   1915 ; subtitute escaped character 
                                   1916 ; by their ASCII value .
                                   1917 ; input:
                                   1918 ;   A  character following '\'
                                   1919 ; output:
                                   1920 ;   A  substitued char or same if not valid.
                                   1921 ;---------------------------------------
      008C34                       1922 convert_escape:
      008C34 A1 61            [ 1] 1923 	cp a,#'a'
      008C36 26 03            [ 1] 1924 	jrne 1$
      008C38 A6 07            [ 1] 1925 	ld a,#7
      008C3A 81               [ 4] 1926 	ret 
      008C3B A1 62            [ 1] 1927 1$: cp a,#'b'
      008C3D 26 03            [ 1] 1928 	jrne 2$
      008C3F A6 08            [ 1] 1929 	ld a,#8
      008C41 81               [ 4] 1930 	ret 
      008C42 A1 65            [ 1] 1931 2$: cp a,#'e' 
      008C44 26 03            [ 1] 1932     jrne 3$
      008C46 A6 5C            [ 1] 1933 	ld a,#'\'
      008C48 81               [ 4] 1934 	ret  
      008C49 A1 5C            [ 1] 1935 3$: cp a,#'\'
      008C4B 26 03            [ 1] 1936 	jrne 4$
      008C4D A6 5C            [ 1] 1937 	ld a,#'\'
      008C4F 81               [ 4] 1938 	ret 
      008C50 A1 66            [ 1] 1939 4$: cp a,#'f' 
      008C52 26 03            [ 1] 1940 	jrne 5$ 
      008C54 A6 0C            [ 1] 1941 	ld a,#FF 
      008C56 81               [ 4] 1942 	ret  
      008C57 A1 6E            [ 1] 1943 5$: cp a,#'n' 
      008C59 26 03            [ 1] 1944     jrne 6$ 
      008C5B A6 0A            [ 1] 1945 	ld a,#0xa 
      008C5D 81               [ 4] 1946 	ret  
      008C5E A1 72            [ 1] 1947 6$: cp a,#'r' 
      008C60 26 03            [ 1] 1948 	jrne 7$
      008C62 A6 0D            [ 1] 1949 	ld a,#0xd 
      008C64 81               [ 4] 1950 	ret  
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 38.
Hexadecimal [24-Bits]



      008C65 A1 74            [ 1] 1951 7$: cp a,#'t' 
      008C67 26 03            [ 1] 1952 	jrne 8$ 
      008C69 A6 09            [ 1] 1953 	ld a,#9 
      008C6B 81               [ 4] 1954 	ret  
      008C6C A1 76            [ 1] 1955 8$: cp a,#'v' 
      008C6E 26 02            [ 1] 1956 	jrne 9$  
      008C70 A6 0B            [ 1] 1957 	ld a,#0xb 
      008C72 81               [ 4] 1958 9$:	ret 
                                   1959 
                                   1960 ;-------------------------
                                   1961 ; integer parser 
                                   1962 ; input:
                                   1963 ;   X 		point to pad 
                                   1964 ;   Y 		point to tib 
                                   1965 ;   A 	    first digit|'$' 
                                   1966 ; output:  
                                   1967 ;   pad     number string 
                                   1968 ;   X 		integer 
                                   1969 ;   A 		TK_INTGR
                                   1970 ;   TOS     integer 
                                   1971 ;-------------------------
                           000001  1972 	BASE=1
                           000002  1973 	TCHAR=2 
                           000002  1974 	VSIZE=2 
      008C73                       1975 parse_integer: ; { -- n }
      008C73 4B 00            [ 1] 1976 	push #0 ; TCHAR 
      008C75 A1 24            [ 1] 1977 	cp a,#'$
      008C77 27 04            [ 1] 1978 	jreq 1$ 
      008C79 4B 0A            [ 1] 1979 	push #10 ; BASE=10 
      008C7B 20 02            [ 2] 1980 	jra 2$ 
      008C7D 4B 10            [ 1] 1981 1$: push #16  ; BASE=16
      008C7F F7               [ 1] 1982 2$:	ld (x),a 
      008C80 5C               [ 1] 1983 	incw x 
      008C81 72 5C 00 02      [ 1] 1984 	inc in 
      008C85 91 D6 01         [ 4] 1985 	ld a,([in.w],y)
      008C88 CD 8E EA         [ 4] 1986 	call to_upper 
      008C8B 6B 02            [ 1] 1987 	ld (TCHAR,sp),a 
      008C8D CD 8E D6         [ 4] 1988 	call is_digit 
      008C90 25 ED            [ 1] 1989 	jrc 2$
      008C92 A6 10            [ 1] 1990 	ld a,#16 
      008C94 11 01            [ 1] 1991 	cp a,(BASE,sp)
      008C96 26 0A            [ 1] 1992 	jrne 3$ 
      008C98 7B 02            [ 1] 1993 	ld a,(TCHAR,sp)
      008C9A A1 41            [ 1] 1994 	cp a,#'A 
      008C9C 2B 04            [ 1] 1995 	jrmi 3$ 
      008C9E A1 47            [ 1] 1996 	cp a,#'G 
      008CA0 2B DD            [ 1] 1997 	jrmi 2$ 
      008CA2 7F               [ 1] 1998 3$:	clr (x)
      008CA3 CD 8F 0F         [ 4] 1999 	call atoi
      008CA6 CE 00 0A         [ 2] 2000 	ldw x,acc16 
      008CA9 A6 0A            [ 1] 2001 	ld a,#TK_INTGR
      000C2B                       2002 	_drop VSIZE  
      008CAB 5B 02            [ 2]    1     addw sp,#VSIZE 
      008CAD 81               [ 4] 2003 	ret 	
                                   2004 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 39.
Hexadecimal [24-Bits]



                                   2005 ;-------------------------
                                   2006 ; binary integer parser 
                                   2007 ; input:
                                   2008 ;   X 		point to pad 
                                   2009 ;   Y 		point to tib 
                                   2010 ;   A 	    '%' 
                                   2011 ; output:  
                                   2012 ;   pad     number string 
                                   2013 ;   X 		integer 
                                   2014 ;   A 		TK_INTGR
                                   2015 ;   TOS     integer 
                                   2016 ;-------------------------
                           000001  2017 	BINARY=1
                           000002  2018 	VSIZE=2
      008CAE                       2019 parse_binary: ; { -- n }
      008CAE 4B 00            [ 1] 2020 	push #0
      008CB0 4B 00            [ 1] 2021 	push #0
      008CB2 F7               [ 1] 2022 1$: ld (x),a 
      008CB3 5C               [ 1] 2023 	incw x 
      008CB4 72 5C 00 02      [ 1] 2024 	inc in 
      008CB8 91 D6 01         [ 4] 2025 	ld a,([in.w],y)
      008CBB A1 30            [ 1] 2026 	cp a,#'0 
      008CBD 27 06            [ 1] 2027 	jreq 2$
      008CBF A1 31            [ 1] 2028 	cp a,#'1 
      008CC1 27 02            [ 1] 2029 	jreq 2$ 
      008CC3 20 09            [ 2] 2030 	jra bin_exit 
      008CC5 A0 30            [ 1] 2031 2$: sub a,#'0	
      008CC7 46               [ 1] 2032 	rrc a 
      008CC8 09 02            [ 1] 2033 	rlc (BINARY+1,sp)
      008CCA 09 01            [ 1] 2034 	rlc (BINARY,sp)
      008CCC 20 E4            [ 2] 2035 	jra 1$  
      008CCE                       2036 bin_exit:
      008CCE 7F               [ 1] 2037 	clr (x)
      008CCF 1E 01            [ 2] 2038 	ldw x,(BINARY,sp)
      008CD1 A6 0A            [ 1] 2039 	ld a,#TK_INTGR 	
      000C53                       2040 	_drop VSIZE 
      008CD3 5B 02            [ 2]    1     addw sp,#VSIZE 
      008CD5 81               [ 4] 2041 	ret
                                   2042 
                                   2043 ;---------------------------
                                   2044 ;  token begin with a letter,
                                   2045 ;  is keyword or variable. 	
                                   2046 ; input:
                                   2047 ;   X 		point to pad 
                                   2048 ;   Y 		point to text
                                   2049 ;   A 	    first letter  
                                   2050 ; output:
                                   2051 ;   X		exec_addr|var_addr 
                                   2052 ;   A 		TK_CMD 
                                   2053 ;   pad 	keyword|var_name  
                                   2054 ;   TOS     exec_addr|var_addr 
                                   2055 ;--------------------------  
      008CD6                       2056 parse_keyword: ; { -- exec_addr|var_addr}
      008CD6 CD 8E EA         [ 4] 2057 	call to_upper 
      008CD9 F7               [ 1] 2058 	ld (x),a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 40.
Hexadecimal [24-Bits]



      008CDA 5C               [ 1] 2059 	incw x 
      008CDB 72 5C 00 02      [ 1] 2060 	inc in 
      008CDF 91 D6 01         [ 4] 2061 	ld a,([in.w],y)
      008CE2 CD 84 F8         [ 4] 2062 	call is_alpha 
      008CE5 25 EF            [ 1] 2063 	jrc parse_keyword 
      008CE7 7F               [ 1] 2064 1$: clr (x)
      008CE8 72 5D 17 19      [ 1] 2065 	tnz pad+1 
      008CEC 26 15            [ 1] 2066 	jrne 2$
                                   2067 ; one letter variable name 
      008CEE C6 17 18         [ 1] 2068 	ld a,pad 
      008CF1 A0 41            [ 1] 2069 	sub a,#'A 
      008CF3 48               [ 1] 2070 	sll a 
      008CF4 88               [ 1] 2071 	push a 
      008CF5 4B 00            [ 1] 2072 	push #0
      008CF7 AE 00 27         [ 2] 2073 	ldw x,#vars 
      008CFA 72 FB 01         [ 2] 2074 	addw x,(1,sp) ; X=var address 
      000C7D                       2075 	_drop 2 
      008CFD 5B 02            [ 2]    1     addw sp,#2 
      008CFF A6 02            [ 1] 2076 	ld a,#TK_VAR 
      008D01 20 17            [ 2] 2077 	jra 4$ 
      008D03                       2078 2$: ; check for keyword, otherwise syntax error.
      000C83                       2079 	_ldx_dict kword_dict
      008D03 AE 9E 2E         [ 2]    1     ldw x,#kword_dict+2
      008D06 CD 91 8B         [ 4] 2080 	call search_dict
      008D09 4D               [ 1] 2081 	tnz a
      008D0A 26 03            [ 1] 2082 	jrne 3$ 
      008D0C CC 87 21         [ 2] 2083 	jp syntax_error
      008D0F A3 95 87         [ 2] 2084 3$: cpw x,#rem  
      008D12 26 06            [ 1] 2085 	jrne 4$
      008D14 55 00 03 00 02   [ 1] 2086 	mov in,count 
      008D19 4F               [ 1] 2087 	clr a 
      008D1A 81               [ 4] 2088 4$:	ret  	
                                   2089 
                                   2090 
                                   2091 ;------------------------------------
                                   2092 ; Command line tokenizer
                                   2093 ; scan text for next token
                                   2094 ; move token in 'pad'
                                   2095 ; input: 
      008D1B                       2096 	none: 
                                   2097 ; use:
                                   2098 ;	Y   pointer to text
                                   2099 ;   X	pointer to pad 
                                   2100 ;   in.w   index in text buffer
                                   2101 ; output:
                                   2102 ;   A       token attribute 
                                   2103 ;   pad 	token as .asciz
                                   2104 ;   X 		token value   
                                   2105 ;------------------------------------
                                   2106 	; use to check special character 
                                   2107 	.macro _case c t  
                                   2108 	ld a,#c 
                                   2109 	cp a,(TCHAR,sp) 
                                   2110 	jrne t
                                   2111 	.endm 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 41.
Hexadecimal [24-Bits]



                                   2112 
                           000001  2113 	TCHAR=1
                           000002  2114 	ATTRIB=2 
                           000002  2115 	VSIZE=2
      008D1B                       2116 get_token: 
      008D1B CE 00 01         [ 2] 2117 	ldw x,in.w 
      008D1E CF 00 12         [ 2] 2118 	ldw in.w.saved,x 
      008D21 90 CE 00 04      [ 2] 2119 	ldw y,basicptr   	
      008D25 C6 00 02         [ 1] 2120 	ld a,in 
      008D28 C1 00 03         [ 1] 2121 	cp a,count 
      008D2B 2B 03            [ 1] 2122 	jrmi 1$
      008D2D A6 00            [ 1] 2123 	ld a,#TK_NONE 
      008D2F 81               [ 4] 2124 	ret 
      008D30                       2125 1$:	
      000CB0                       2126 	_vars VSIZE
      008D30 52 02            [ 2]    1     sub sp,#VSIZE 
      008D32 AE 17 18         [ 2] 2127 	ldw x, #pad
      008D35 A6 20            [ 1] 2128 	ld a,#SPACE
      008D37 CD 8F BB         [ 4] 2129 	call skip
      008D3A 91 D6 01         [ 4] 2130 	ld a,([in.w],y)
      008D3D 26 07            [ 1] 2131 	jrne str_tst
      008D3F 72 5F 17 18      [ 1] 2132 	clr pad 
      008D43 CC 8E D3         [ 2] 2133 	jp token_exit ; end of line 
                                   2134 
      008D46                       2135 str_tst: ; check for quoted string  	
      008D46 CD 8E EA         [ 4] 2136 	call to_upper 
      008D49 6B 01            [ 1] 2137 	ld (TCHAR,sp),a 
      000CCB                       2138 	_case '"' nbr_tst
      008D4B A6 22            [ 1]    1 	ld a,#'"' 
      008D4D 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D4F 26 06            [ 1]    3 	jrne nbr_tst
      008D51 CD 8B F9         [ 4] 2139 	call parse_quote
      008D54 CC 8E D3         [ 2] 2140 	jp token_exit
      008D57                       2141 nbr_tst: ; check for number 
      008D57 A6 24            [ 1] 2142 	ld a,#'$'
      008D59 11 01            [ 1] 2143 	cp a,(TCHAR,sp) 
      008D5B 27 13            [ 1] 2144 	jreq 1$
      008D5D A6 26            [ 1] 2145 	ld a,#'&
      008D5F 11 01            [ 1] 2146 	cp a,(TCHAR,sp)
      008D61 26 06            [ 1] 2147 	jrne 0$
      008D63 CD 8C AE         [ 4] 2148 	call parse_binary ; expect binary integer 
      008D66 CC 8E D3         [ 2] 2149 	jp token_exit 
      008D69 7B 01            [ 1] 2150 0$:	ld a,(TCHAR,sp)
      008D6B CD 8E D6         [ 4] 2151 	call is_digit
      008D6E 24 06            [ 1] 2152 	jrnc 3$
      008D70 CD 8C 73         [ 4] 2153 1$:	call parse_integer 
      008D73 CC 8E D3         [ 2] 2154 	jp token_exit 
      008D76                       2155 3$: 
      000CF6                       2156 	_case '(' bkslsh_tst 
      008D76 A6 28            [ 1]    1 	ld a,#'(' 
      008D78 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D7A 26 05            [ 1]    3 	jrne bkslsh_tst
      008D7C A6 04            [ 1] 2157 	ld a,#TK_LPAREN
      008D7E CC 8E C3         [ 2] 2158 	jp token_char   	
      008D81                       2159 bkslsh_tst:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 42.
Hexadecimal [24-Bits]



      000D01                       2160 	_case '\',rparnt_tst
      008D81 A6 5C            [ 1]    1 	ld a,#'\' 
      008D83 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008D85 26 18            [ 1]    3 	jrne rparnt_tst
      008D87 7B 01            [ 1] 2161 	ld a,(TCHAR,sp)
      008D89 F7               [ 1] 2162 	ld (x),a 
      008D8A 5C               [ 1] 2163 	incw x 
      008D8B 72 5C 00 02      [ 1] 2164 	inc in 
      008D8F 91 D6 01         [ 4] 2165 	ld a,([in.w],y)
      008D92 F7               [ 1] 2166 	ld (x),a 
      008D93 5C               [ 1] 2167 	incw x 
      008D94 72 5C 00 02      [ 1] 2168 	inc in  
      008D98 7F               [ 1] 2169 	clr (x) 
      008D99 97               [ 1] 2170 	ld xl,a 
      008D9A A6 0B            [ 1] 2171 	ld a,#TK_CHAR 
      008D9C CC 8E D3         [ 2] 2172 	jp token_exit 
      008D9F                       2173 rparnt_tst:		
      000D1F                       2174 	_case ')' colon_tst 
      008D9F A6 29            [ 1]    1 	ld a,#')' 
      008DA1 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DA3 26 05            [ 1]    3 	jrne colon_tst
      008DA5 A6 05            [ 1] 2175 	ld a,#TK_RPAREN 
      008DA7 CC 8E C3         [ 2] 2176 	jp token_char 
      008DAA                       2177 colon_tst:
      000D2A                       2178 	_case ':' comma_tst 
      008DAA A6 3A            [ 1]    1 	ld a,#':' 
      008DAC 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DAE 26 05            [ 1]    3 	jrne comma_tst
      008DB0 A6 01            [ 1] 2179 	ld a,#TK_COLON 
      008DB2 CC 8E C3         [ 2] 2180 	jp token_char 
      008DB5                       2181 comma_tst:
      000D35                       2182 	_case COMMA sharp_tst 
      008DB5 A6 2C            [ 1]    1 	ld a,#COMMA 
      008DB7 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DB9 26 05            [ 1]    3 	jrne sharp_tst
      008DBB A6 08            [ 1] 2183 	ld a,#TK_COMMA
      008DBD CC 8E C3         [ 2] 2184 	jp token_char
      008DC0                       2185 sharp_tst:
      000D40                       2186 	_case SHARP dash_tst 
      008DC0 A6 23            [ 1]    1 	ld a,#SHARP 
      008DC2 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DC4 26 05            [ 1]    3 	jrne dash_tst
      008DC6 A6 09            [ 1] 2187 	ld a,#TK_SHARP
      008DC8 CC 8E C3         [ 2] 2188 	jp token_char  	 	 
      008DCB                       2189 dash_tst: 	
      000D4B                       2190 	_case '-' at_tst 
      008DCB A6 2D            [ 1]    1 	ld a,#'-' 
      008DCD 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DCF 26 05            [ 1]    3 	jrne at_tst
      008DD1 A6 11            [ 1] 2191 	ld a,#TK_MINUS  
      008DD3 CC 8E C3         [ 2] 2192 	jp token_char 
      008DD6                       2193 at_tst:
      000D56                       2194 	_case '@' qmark_tst 
      008DD6 A6 40            [ 1]    1 	ld a,#'@' 
      008DD8 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 43.
Hexadecimal [24-Bits]



      008DDA 26 05            [ 1]    3 	jrne qmark_tst
      008DDC A6 03            [ 1] 2195 	ld a,#TK_ARRAY 
      008DDE CC 8E C3         [ 2] 2196 	jp token_char
      008DE1                       2197 qmark_tst:
      000D61                       2198 	_case '?' tick_tst 
      008DE1 A6 3F            [ 1]    1 	ld a,#'?' 
      008DE3 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DE5 26 11            [ 1]    3 	jrne tick_tst
      008DE7 7B 01            [ 1] 2199 	ld a,(TCHAR,sp)
      008DE9 F7               [ 1] 2200 	ld (x),a 
      008DEA 5C               [ 1] 2201 	incw x 
      008DEB 7F               [ 1] 2202 	clr (x)
      008DEC 72 5C 00 02      [ 1] 2203 	inc in 
      008DF0 A6 07            [ 1] 2204 	ld a,#TK_CMD 
      008DF2 AE 94 82         [ 2] 2205 	ldw x,#print 
      008DF5 CC 8E D3         [ 2] 2206 	jp token_exit
      008DF8                       2207 tick_tst: ; ignore comment 
      000D78                       2208 	_case TICK plus_tst 
      008DF8 A6 27            [ 1]    1 	ld a,#TICK 
      008DFA 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008DFC 26 0E            [ 1]    3 	jrne plus_tst
      008DFE 7B 01            [ 1] 2209 	ld a,(TCHAR,sp)
      008E00 F7               [ 1] 2210 	ld (x),a 
      008E01 5C               [ 1] 2211 	incw x 
      008E02 7F               [ 1] 2212 	clr (x)
      008E03 55 00 03 00 02   [ 1] 2213 	mov in,count  
      008E08 4F               [ 1] 2214 	clr a 
      008E09 CC 8E D3         [ 2] 2215 	jp token_exit 
      008E0C                       2216 plus_tst:
      000D8C                       2217 	_case '+' star_tst 
      008E0C A6 2B            [ 1]    1 	ld a,#'+' 
      008E0E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E10 26 05            [ 1]    3 	jrne star_tst
      008E12 A6 10            [ 1] 2218 	ld a,#TK_PLUS  
      008E14 CC 8E C3         [ 2] 2219 	jp token_char 
      008E17                       2220 star_tst:
      000D97                       2221 	_case '*' slash_tst 
      008E17 A6 2A            [ 1]    1 	ld a,#'*' 
      008E19 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E1B 26 05            [ 1]    3 	jrne slash_tst
      008E1D A6 20            [ 1] 2222 	ld a,#TK_MULT 
      008E1F CC 8E C3         [ 2] 2223 	jp token_char 
      008E22                       2224 slash_tst: 
      000DA2                       2225 	_case '/' prcnt_tst 
      008E22 A6 2F            [ 1]    1 	ld a,#'/' 
      008E24 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E26 26 05            [ 1]    3 	jrne prcnt_tst
      008E28 A6 21            [ 1] 2226 	ld a,#TK_DIV 
      008E2A CC 8E C3         [ 2] 2227 	jp token_char 
      008E2D                       2228 prcnt_tst:
      000DAD                       2229 	_case '%' eql_tst 
      008E2D A6 25            [ 1]    1 	ld a,#'%' 
      008E2F 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E31 26 05            [ 1]    3 	jrne eql_tst
      008E33 A6 22            [ 1] 2230 	ld a,#TK_MOD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 44.
Hexadecimal [24-Bits]



      008E35 CC 8E C3         [ 2] 2231 	jp token_char  
                                   2232 ; 1 or 2 character tokens 	
      008E38                       2233 eql_tst:
      000DB8                       2234 	_case '=' gt_tst 		
      008E38 A6 3D            [ 1]    1 	ld a,#'=' 
      008E3A 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E3C 26 05            [ 1]    3 	jrne gt_tst
      008E3E A6 32            [ 1] 2235 	ld a,#TK_EQUAL
      008E40 CC 8E C3         [ 2] 2236 	jp token_char 
      008E43                       2237 gt_tst:
      000DC3                       2238 	_case '>' lt_tst 
      008E43 A6 3E            [ 1]    1 	ld a,#'>' 
      008E45 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E47 26 33            [ 1]    3 	jrne lt_tst
      008E49 A6 31            [ 1] 2239 	ld a,#TK_GT 
      008E4B 6B 02            [ 1] 2240 	ld (ATTRIB,sp),a 
      008E4D 72 5C 00 02      [ 1] 2241 	inc in 
      008E51 91 D6 01         [ 4] 2242 	ld a,([in.w],y)
      008E54 A1 3D            [ 1] 2243 	cp a,#'=
      008E56 26 0C            [ 1] 2244 	jrne 1$
      008E58 7B 01            [ 1] 2245 	ld a,(TCHAR,sp)
      008E5A F7               [ 1] 2246 	ld (x),a
      008E5B 5C               [ 1] 2247 	incw x 
      008E5C A6 3D            [ 1] 2248 	ld a,#'=
      008E5E 6B 01            [ 1] 2249 	ld (TCHAR,sp),a 
      008E60 A6 33            [ 1] 2250 	ld a,#TK_GE 
      008E62 20 5F            [ 2] 2251 	jra token_char  
      008E64 A1 3C            [ 1] 2252 1$: cp a,#'<
      008E66 26 0C            [ 1] 2253 	jrne 2$
      008E68 7B 01            [ 1] 2254 	ld a,(TCHAR,sp)
      008E6A F7               [ 1] 2255 	ld (x),a
      008E6B 5C               [ 1] 2256 	incw x 
      008E6C A6 3C            [ 1] 2257 	ld a,#'<	
      008E6E 6B 01            [ 1] 2258 	ld (TCHAR,sp),a 
      008E70 A6 35            [ 1] 2259 	ld a,#TK_NE 
      008E72 20 4F            [ 2] 2260 	jra token_char 
      008E74 72 5A 00 02      [ 1] 2261 2$: dec in
      008E78 7B 02            [ 1] 2262 	ld a,(ATTRIB,sp)
      008E7A 20 47            [ 2] 2263 	jra token_char 
      008E7C                       2264 lt_tst:
      000DFC                       2265 	_case '<' other
      008E7C A6 3C            [ 1]    1 	ld a,#'<' 
      008E7E 11 01            [ 1]    2 	cp a,(TCHAR,sp) 
      008E80 26 32            [ 1]    3 	jrne other
      008E82 A6 34            [ 1] 2266 	ld a,#TK_LT 
      008E84 6B 02            [ 1] 2267 	ld (ATTRIB,sp),a 
      008E86 72 5C 00 02      [ 1] 2268 	inc in 
      008E8A 91 D6 01         [ 4] 2269 	ld a,([in.w],y)
      008E8D A1 3D            [ 1] 2270 	cp a,#'=
      008E8F 26 0B            [ 1] 2271 	jrne 1$
      008E91 7B 01            [ 1] 2272 	ld a,(TCHAR,sp)
      008E93 F7               [ 1] 2273 	ld (x),a 
      008E94 A6 3D            [ 1] 2274 	ld a,#'=
      008E96 6B 01            [ 1] 2275 	ld (TCHAR,sp),a 
      008E98 A6 36            [ 1] 2276 	ld a,#TK_LE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 45.
Hexadecimal [24-Bits]



      008E9A 20 27            [ 2] 2277 	jra token_char 
      008E9C A1 3E            [ 1] 2278 1$: cp a,#'>
      008E9E 26 0C            [ 1] 2279 	jrne 2$
      008EA0 7B 01            [ 1] 2280 	ld a,(TCHAR,sp)
      008EA2 F7               [ 1] 2281 	ld (x),a 
      008EA3 5C               [ 1] 2282 	incw x 
      008EA4 A6 3E            [ 1] 2283 	ld a,#'>
      008EA6 6B 01            [ 1] 2284 	ld (TCHAR,sp),a 
      008EA8 A6 35            [ 1] 2285 	ld a,#TK_NE 
      008EAA 20 17            [ 2] 2286 	jra token_char 
      008EAC 72 5A 00 02      [ 1] 2287 2$: dec in 
      008EB0 7B 02            [ 1] 2288 	ld a,(ATTRIB,sp)
      008EB2 20 0F            [ 2] 2289 	jra token_char 	
      008EB4                       2290 other: ; not a special character 	 
      008EB4 7B 01            [ 1] 2291 	ld a,(TCHAR,sp)
      008EB6 CD 84 F8         [ 4] 2292 	call is_alpha 
      008EB9 25 03            [ 1] 2293 	jrc 30$ 
      008EBB CC 87 21         [ 2] 2294 	jp syntax_error 
      008EBE                       2295 30$: 
      008EBE CD 8C D6         [ 4] 2296 	call parse_keyword
      008EC1 20 10            [ 2] 2297 	jra token_exit 
      008EC3                       2298 token_char:
      008EC3 6B 02            [ 1] 2299 	ld (ATTRIB,sp),a 
      008EC5 7B 01            [ 1] 2300 	ld a,(TCHAR,sp)
      008EC7 F7               [ 1] 2301 	ld (x),a 
      008EC8 5C               [ 1] 2302 	incw x 
      008EC9 7F               [ 1] 2303 	clr(x)
      008ECA 72 5C 00 02      [ 1] 2304 	inc in 
      008ECE 7B 02            [ 1] 2305 	ld a,(ATTRIB,sp)
      008ED0 AE 17 18         [ 2] 2306 	ldw x,#pad 
      008ED3                       2307 token_exit:
      000E53                       2308 	_drop VSIZE 
      008ED3 5B 02            [ 2]    1     addw sp,#VSIZE 
      008ED5 81               [ 4] 2309 	ret
                                   2310 
                                   2311 
                                   2312 
                                   2313 ;------------------------------------
                                   2314 ; check if character in {'0'..'9'}
                                   2315 ; input:
                                   2316 ;    A  character to test
                                   2317 ; output:
                                   2318 ;    Carry  0 not digit | 1 digit
                                   2319 ;------------------------------------
      008ED6                       2320 is_digit:
      008ED6 A1 30            [ 1] 2321 	cp a,#'0
      008ED8 25 03            [ 1] 2322 	jrc 1$
      008EDA A1 3A            [ 1] 2323     cp a,#'9+1
      008EDC 8C               [ 1] 2324 	ccf 
      008EDD 8C               [ 1] 2325 1$:	ccf 
      008EDE 81               [ 4] 2326     ret
                                   2327 
                                   2328 ;----------------------------------
                                   2329 ; convert to lower case
                                   2330 ; input: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 46.
Hexadecimal [24-Bits]



                                   2331 ;   A 		character to convert
                                   2332 ; output:
                                   2333 ;   A		result 
                                   2334 ;----------------------------------
      008EDF                       2335 to_lower::
      008EDF A1 41            [ 1] 2336 	cp a,#'A
      008EE1 25 06            [ 1] 2337 	jrult 9$
      008EE3 A1 5A            [ 1] 2338 	cp a,#'Z 
      008EE5 22 02            [ 1] 2339 	jrugt 9$
      008EE7 AB 20            [ 1] 2340 	add a,#32
      008EE9 81               [ 4] 2341 9$: ret
                                   2342 
                                   2343 ;------------------------------------
                                   2344 ; convert alpha to uppercase
                                   2345 ; input:
                                   2346 ;    a  character to convert
                                   2347 ; output:
                                   2348 ;    a  uppercase character
                                   2349 ;------------------------------------
      008EEA                       2350 to_upper::
      008EEA A1 61            [ 1] 2351 	cp a,#'a
      008EEC 2A 01            [ 1] 2352 	jrpl 1$
      008EEE 81               [ 4] 2353 0$:	ret
      008EEF A1 7A            [ 1] 2354 1$: cp a,#'z	
      008EF1 22 FB            [ 1] 2355 	jrugt 0$
      008EF3 A0 20            [ 1] 2356 	sub a,#32
      008EF5 81               [ 4] 2357 	ret
                                   2358 	
                                   2359 ;------------------------------------
                                   2360 ; uppercase pad content
                                   2361 ; input:
                                   2362 ;	pad      .asciz 
                                   2363 ; output:
                                   2364 ;   pad      uppercase string 
                                   2365 ;------------------------------------
      008EF6                       2366 upper:
      008EF6 90 AE 17 18      [ 2] 2367 	ldw y,#pad 
      008EFA                       2368 upper_loop:	
      008EFA 90 F6            [ 1] 2369 	ld a,(y)
      008EFC 27 10            [ 1] 2370 	jreq 4$
      008EFE A1 61            [ 1] 2371 	cp a,#'a 
      008F00 2B 0C            [ 1] 2372 	jrmi 4$
      008F02 A1 7B            [ 1] 2373 	cp a,#'z+1 
      008F04 2A 08            [ 1] 2374 	jrpl 4$ 
      008F06 A0 20            [ 1] 2375 	sub a,#0x20 
      008F08 90 F7            [ 1] 2376 	ld (y),a 
      008F0A 90 5C            [ 1] 2377 	incw y 
      008F0C 20 EC            [ 2] 2378 	jra upper_loop
      008F0E 81               [ 4] 2379 4$: ret 
                                   2380 
                                   2381 ;------------------------------------
                                   2382 ; convert pad content in integer
                                   2383 ; input:
                                   2384 ;    pad		.asciz to convert
                                   2385 ; output:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 47.
Hexadecimal [24-Bits]



                                   2386 ;    acc24      int24_t
                                   2387 ;------------------------------------
                                   2388 	; local variables
                           000001  2389 	SIGN=1 ; 1 byte, 
                           000002  2390 	BASE=2 ; 1 byte, numeric base used in conversion
                           000003  2391 	TEMP=3 ; 1 byte, temporary storage
                           000003  2392 	VSIZE=3 ; 3 bytes reserved for local storage
      008F0F                       2393 atoi:
      008F0F 89               [ 2] 2394 	pushw x ;save x
      008F10 52 03            [ 2] 2395 	sub sp,#VSIZE
                                   2396 	; acc24=0 
      008F12 72 5F 00 09      [ 1] 2397 	clr acc24    
      008F16 72 5F 00 0A      [ 1] 2398 	clr acc16
      008F1A 72 5F 00 0B      [ 1] 2399 	clr acc8 
      008F1E C6 17 18         [ 1] 2400 	ld a, pad 
      008F21 27 5A            [ 1] 2401 	jreq atoi_exit
      008F23 0F 01            [ 1] 2402 	clr (SIGN,sp)
      008F25 A6 0A            [ 1] 2403 	ld a,#10
      008F27 6B 02            [ 1] 2404 	ld (BASE,sp),a ; default base decimal
      008F29 AE 17 18         [ 2] 2405 	ldw x,#pad ; pointer to string to convert
      008F2C F6               [ 1] 2406 	ld a,(x)
      008F2D 27 47            [ 1] 2407 	jreq 9$  ; completed if 0
      008F2F A1 2D            [ 1] 2408 	cp a,#'-
      008F31 26 04            [ 1] 2409 	jrne 1$
      008F33 03 01            [ 1] 2410 	cpl (SIGN,sp)
      008F35 20 08            [ 2] 2411 	jra 2$
      008F37 A1 24            [ 1] 2412 1$: cp a,#'$
      008F39 26 06            [ 1] 2413 	jrne 3$
      008F3B A6 10            [ 1] 2414 	ld a,#16
      008F3D 6B 02            [ 1] 2415 	ld (BASE,sp),a
      008F3F 5C               [ 1] 2416 2$:	incw x
      008F40 F6               [ 1] 2417 	ld a,(x)
      008F41                       2418 3$:	
      008F41 A1 61            [ 1] 2419 	cp a,#'a
      008F43 2B 02            [ 1] 2420 	jrmi 4$
      008F45 A0 20            [ 1] 2421 	sub a,#32
      008F47 A1 30            [ 1] 2422 4$:	cp a,#'0
      008F49 2B 2B            [ 1] 2423 	jrmi 9$
      008F4B A0 30            [ 1] 2424 	sub a,#'0
      008F4D A1 0A            [ 1] 2425 	cp a,#10
      008F4F 2B 06            [ 1] 2426 	jrmi 5$
      008F51 A0 07            [ 1] 2427 	sub a,#7
      008F53 11 02            [ 1] 2428 	cp a,(BASE,sp)
      008F55 2A 1F            [ 1] 2429 	jrpl 9$
      008F57 6B 03            [ 1] 2430 5$:	ld (TEMP,sp),a
      008F59 7B 02            [ 1] 2431 	ld a,(BASE,sp)
      008F5B CD 8F 81         [ 4] 2432 	call mulu24_8
      008F5E 7B 03            [ 1] 2433 	ld a,(TEMP,sp)
      008F60 CB 00 0B         [ 1] 2434 	add a,acc24+2
      008F63 C7 00 0B         [ 1] 2435 	ld acc24+2,a
      008F66 4F               [ 1] 2436 	clr a
      008F67 C9 00 0A         [ 1] 2437 	adc a,acc24+1
      008F6A C7 00 0A         [ 1] 2438 	ld acc24+1,a
      008F6D 4F               [ 1] 2439 	clr a
      008F6E C9 00 09         [ 1] 2440 	adc a,acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 48.
Hexadecimal [24-Bits]



      008F71 C7 00 09         [ 1] 2441 	ld acc24,a
      008F74 20 C9            [ 2] 2442 	jra 2$
      008F76 0D 01            [ 1] 2443 9$:	tnz (SIGN,sp)
      008F78 27 03            [ 1] 2444     jreq atoi_exit
      008F7A CD 8A 6E         [ 4] 2445     call neg_acc24
      008F7D                       2446 atoi_exit: 
      008F7D 5B 03            [ 2] 2447 	addw sp,#VSIZE
      008F7F 85               [ 2] 2448 	popw x ; restore x
      008F80 81               [ 4] 2449 	ret
                                   2450 
                                   2451 ;--------------------------------------
                                   2452 ; unsigned multiply uint24_t by uint8_t
                                   2453 ; use to convert numerical string to uint24_t
                                   2454 ; input:
                                   2455 ;	acc24	uint24_t 
                                   2456 ;   A		uint8_t
                                   2457 ; output:
                                   2458 ;   acc24   A*acc24
                                   2459 ;-------------------------------------
                                   2460 ; local variables offset  on sp
                           000003  2461 	U8   = 3   ; A pushed on stack
                           000002  2462 	OVFL = 2  ; multiplicaton overflow low byte
                           000001  2463 	OVFH = 1  ; multiplication overflow high byte
                           000003  2464 	VSIZE = 3
      008F81                       2465 mulu24_8:
      008F81 89               [ 2] 2466 	pushw x    ; save X
                                   2467 	; local variables
      008F82 88               [ 1] 2468 	push a     ; U8
      008F83 5F               [ 1] 2469 	clrw x     ; initialize overflow to 0
      008F84 89               [ 2] 2470 	pushw x    ; multiplication overflow
                                   2471 ; multiply low byte.
      008F85 C6 00 0B         [ 1] 2472 	ld a,acc24+2
      008F88 97               [ 1] 2473 	ld xl,a
      008F89 7B 03            [ 1] 2474 	ld a,(U8,sp)
      008F8B 42               [ 4] 2475 	mul x,a
      008F8C 9F               [ 1] 2476 	ld a,xl
      008F8D C7 00 0B         [ 1] 2477 	ld acc24+2,a
      008F90 9E               [ 1] 2478 	ld a, xh
      008F91 6B 02            [ 1] 2479 	ld (OVFL,sp),a
                                   2480 ; multipy middle byte
      008F93 C6 00 0A         [ 1] 2481 	ld a,acc24+1
      008F96 97               [ 1] 2482 	ld xl,a
      008F97 7B 03            [ 1] 2483 	ld a, (U8,sp)
      008F99 42               [ 4] 2484 	mul x,a
                                   2485 ; add overflow to this partial product
      008F9A 72 FB 01         [ 2] 2486 	addw x,(OVFH,sp)
      008F9D 9F               [ 1] 2487 	ld a,xl
      008F9E C7 00 0A         [ 1] 2488 	ld acc24+1,a
      008FA1 4F               [ 1] 2489 	clr a
      008FA2 A9 00            [ 1] 2490 	adc a,#0
      008FA4 6B 01            [ 1] 2491 	ld (OVFH,sp),a
      008FA6 9E               [ 1] 2492 	ld a,xh
      008FA7 6B 02            [ 1] 2493 	ld (OVFL,sp),a
                                   2494 ; multiply most signficant byte	
      008FA9 C6 00 09         [ 1] 2495 	ld a, acc24
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 49.
Hexadecimal [24-Bits]



      008FAC 97               [ 1] 2496 	ld xl, a
      008FAD 7B 03            [ 1] 2497 	ld a, (U8,sp)
      008FAF 42               [ 4] 2498 	mul x,a
      008FB0 72 FB 01         [ 2] 2499 	addw x, (OVFH,sp)
      008FB3 9F               [ 1] 2500 	ld a, xl
      008FB4 C7 00 09         [ 1] 2501 	ld acc24,a
      008FB7 5B 03            [ 2] 2502     addw sp,#VSIZE
      008FB9 85               [ 2] 2503 	popw x
      008FBA 81               [ 4] 2504 	ret
                                   2505 
                                   2506 ;------------------------------------
                                   2507 ; skip character c in text starting from 'in'
                                   2508 ; input:
                                   2509 ;	 y 		point to text buffer
                                   2510 ;    a 		character to skip
                                   2511 ; output:  
                                   2512 ;	'in' ajusted to new position
                                   2513 ;------------------------------------
                           000001  2514 	C = 1 ; local var
      008FBB                       2515 skip:
      008FBB 88               [ 1] 2516 	push a
      008FBC 91 D6 01         [ 4] 2517 1$:	ld a,([in.w],y)
      008FBF 27 0A            [ 1] 2518 	jreq 2$
      008FC1 11 01            [ 1] 2519 	cp a,(C,sp)
      008FC3 26 06            [ 1] 2520 	jrne 2$
      008FC5 72 5C 00 02      [ 1] 2521 	inc in
      008FC9 20 F1            [ 2] 2522 	jra 1$
      000F4B                       2523 2$: _drop 1 
      008FCB 5B 01            [ 2]    1     addw sp,#1 
      008FCD 81               [ 4] 2524 	ret
                                   2525 
                                   2526 ;******************************
                                   2527 
                                   2528 ;----------------------	
                                   2529 ; push X on data stack 
                                   2530 ; input:
                                   2531 ;	X 
                                   2532 ; output:
                                   2533 ;	none 
                                   2534 ;----------------------	
      008FCE                       2535 dpush:
      000F4E                       2536     _dp_down
      008FCE 72 5A 00 1B      [ 1]    1     dec dstkptr+1 
      008FD2 72 5A 00 1B      [ 1]    2     dec dstkptr+1
      008FD6 72 CF 00 1A      [ 5] 2537     ldw [dstkptr],x  
      008FDA 81               [ 4] 2538 	ret 
                                   2539 
                                   2540 
                                   2541 ;----------------------	
                                   2542 ; pop data stack in X 
                                   2543 ; input:
                                   2544 ;	none
                                   2545 ; output:
                                   2546 ;	X   
                                   2547 ;----------------------	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 50.
Hexadecimal [24-Bits]



      008FDB                       2548 dpop: 
      008FDB 72 CE 00 1A      [ 5] 2549     ldw x, [dstkptr]
      000F5F                       2550 	_dp_up
      008FDF 72 5C 00 1B      [ 1]    1     inc dstkptr+1
      008FE3 72 5C 00 1B      [ 1]    2     inc dstkptr+1
      008FE7 81               [ 4] 2551 	ret 
                                   2552 
                                   2553 ;-----------------------------
                                   2554 ; swap top 2 elements of dstack
                                   2555 ;  {n1 n2 -- n2 n1 }
                                   2556 ;-----------------------------
      008FE8                       2557 dswap:
      008FE8 72 CE 00 1A      [ 5] 2558 	ldw x,[dstkptr]
      008FEC 89               [ 2] 2559 	pushw x 
      008FED AE 00 02         [ 2] 2560 	ldw x,#2 
      008FF0 72 DE 00 1A      [ 5] 2561 	ldw x,([dstkptr],x) 
      008FF4 72 CF 00 1A      [ 5] 2562 	ldw [dstkptr],x 
      008FF8 AE 00 02         [ 2] 2563 	ldw x,#2
      008FFB 90 85            [ 2] 2564 	popw y 
      008FFD 72 DF 00 1A      [ 5] 2565 	ldw ([dstkptr],x),y 
      009001 81               [ 4] 2566 	ret
                                   2567 
                                   2568 ;-----------------------------
                                   2569 ; drop TOS 
                                   2570 ;-----------------------------
      009002                       2571 ddrop: ; { n -- }
      000F82                       2572 	_dp_up 
      009002 72 5C 00 1B      [ 1]    1     inc dstkptr+1
      009006 72 5C 00 1B      [ 1]    2     inc dstkptr+1
      00900A 81               [ 4] 2573 	ret
                                   2574 	
                                   2575 ;-----------------------------
                                   2576 ; duplicate TOS 
                                   2577 ;  dstack: { ix...n -- ix...n n }
                                   2578 ;-----------------------------
      00900B                       2579 ddup:
      00900B 72 CE 00 1A      [ 5] 2580 	ldw x,[dstkptr]
      000F8F                       2581 	_dp_down
      00900F 72 5A 00 1B      [ 1]    1     dec dstkptr+1 
      009013 72 5A 00 1B      [ 1]    2     dec dstkptr+1
      009017 72 CF 00 1A      [ 5] 2582     ldw [dstkptr],x  
      00901B 81               [ 4] 2583 	ret 
                                   2584 
                                   2585 
                                   2586 ;----------------------------------
                                   2587 ; pick value n from dstack 
                                   2588 ; put it on TOS
                                   2589 ; dstack: {ix,..,p -- ix,...,np }
                                   2590 ;-----------------------------------
      00901C                       2591 dpick:
      00901C 72 CE 00 1A      [ 5] 2592 	ldw x,[dstkptr]
      009020 58               [ 2] 2593 	sllw x 
      009021 72 BB 00 1A      [ 2] 2594 	addw x,dstkptr 
      009025 FE               [ 2] 2595 	ldw x,(x)
      009026 72 CF 00 1A      [ 5] 2596 	ldw [dstkptr],x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 51.
Hexadecimal [24-Bits]



      00902A 81               [ 4] 2597 	ret
                                   2598 
                                   2599 ;---------------------------
                                   2600 ;  fetch variable in X 
                                   2601 ;  dstack:{ addr -- value }
                                   2602 ;---------------------------
      00902B                       2603 fetch:
      00902B 72 CE 00 1A      [ 5] 2604 	ldw x,[dstkptr]
      00902F FE               [ 2] 2605 	ldw x,(x)
      009030 72 CF 00 1A      [ 5] 2606 	ldw [dstkptr],x
      009034 81               [ 4] 2607 	ret 
                                   2608 
                                   2609 ;----------------------------
                                   2610 ; store variable 
                                   2611 ; dstack: {addr value -- }
                                   2612 ;----------------------------
      009035                       2613 store:
      009035 CD 8F DB         [ 4] 2614 	call dpop 
      009038 90 93            [ 1] 2615 	ldw y,x   ; y=value 
      00903A CD 8F DB         [ 4] 2616 	call dpop 
      00903D FF               [ 2] 2617 	ldw (x),y 
      00903E 81               [ 4] 2618 	ret 
                                   2619 
                                   2620 ;------------------------------
                                   2621 ; restore 'in.w' variable to 
                                   2622 ; its value before last call
                                   2623 ; to get_token.
                                   2624 ;------------------------------
      00903F                       2625 unget_token:
      00903F CE 00 12         [ 2] 2626 	ldw x,in.w.saved
      009042 CF 00 01         [ 2] 2627 	ldw in.w,x 
      009045 81               [ 4] 2628 	ret 
                                   2629 
                                   2630 
      009046 0A 64 73 74 61 63 6B  2631 dstk_prompt: .asciz "\ndstack: " 
             3A 20 00
                                   2632 ;----------------------------
                                   2633 ; print dstack content 
                                   2634 ;---------------------------
                           000001  2635 	XSAVE=1
                           000002  2636 	VSIZE=2
      009050                       2637 dots:
      000FD0                       2638 	_vars VSIZE 
      009050 52 02            [ 2]    1     sub sp,#VSIZE 
      009052 AE 90 46         [ 2] 2639 	ldw x,#dstk_prompt 
      009055 CD 82 B0         [ 4] 2640 	call puts
      009058 AE 17 7E         [ 2] 2641 	ldw x,#dstack_unf-CELL_SIZE 
      00905B C3 00 1A         [ 2] 2642 1$:	cpw x,dstkptr 
      00905E 25 17            [ 1] 2643 	jrult 4$ 
      009060 1F 01            [ 2] 2644 	ldw (XSAVE,sp),x
      009062 FE               [ 2] 2645 	ldw  x,(x)
      009063 CF 00 0A         [ 2] 2646 	ldw acc16,x 
      009066 72 5F 00 09      [ 1] 2647 	clr acc24 
      00906A 5F               [ 1] 2648 	clrw x 
      00906B A6 8A            [ 1] 2649 	ld a,#10+128
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 52.
Hexadecimal [24-Bits]



      00906D CD 89 4E         [ 4] 2650 	call prti24 
      009070 1E 01            [ 2] 2651 	ldw x,(XSAVE,sp)
      009072 1D 00 02         [ 2] 2652 	subw x,#CELL_SIZE 
      009075 20 E4            [ 2] 2653 	jra 1$ 
      009077 A6 0D            [ 1] 2654 4$: ld a,#CR 
      009079 CD 82 9E         [ 4] 2655 	call putc 
      000FFC                       2656 	_drop VSIZE
      00907C 5B 02            [ 2]    1     addw sp,#VSIZE 
      00907E 4F               [ 1] 2657 	clr a 
      00907F 81               [ 4] 2658 	ret
                                   2659 
      009080 0A 63 74 61 63 6B 3A  2660 cstk_prompt: .asciz "\nctack: "
             20 00
                                   2661 ;--------------------------------
                                   2662 ; print cstack content
                                   2663 ;--------------------------------
      009089                       2664 dotr:
      009089 AE 90 80         [ 2] 2665 	ldw x,#cstk_prompt
      00908C CD 82 B0         [ 4] 2666 	call puts 
      00908F 96               [ 1] 2667 	ldw x,sp 
      009090 5C               [ 1] 2668 	incw x 
      009091 CD 8F CE         [ 4] 2669 	call dpush 
      009094 AE 17 FE         [ 2] 2670 	ldw x,#RAM_SIZE-2
      009097                       2671 dotr_loop:
      009097 CD 8F CE         [ 4] 2672 	call dpush  
      00909A FE               [ 2] 2673 	ldw x,(x)
      00909B CF 00 0A         [ 2] 2674 	ldw acc16,x 
      00909E 72 5F 00 09      [ 1] 2675 	clr acc24 
      0090A2 5F               [ 1] 2676 	clrw x 
      0090A3 A6 90            [ 1] 2677 	ld a,#16+128
      0090A5 CD 89 4E         [ 4] 2678 	call prti24 
      0090A8 CD 8F DB         [ 4] 2679 	call dpop 
      0090AB 1D 00 02         [ 2] 2680 	subw x,#CELL_SIZE
      0090AE 72 C3 00 1A      [ 4] 2681 	cpw x,[dstkptr]
      0090B2 2A E3            [ 1] 2682 	jrpl dotr_loop 
      0090B4 AE 00 01         [ 2] 2683 	ldw x,#1
      0090B7 CD 91 74         [ 4] 2684 	call ddrop_n 
      0090BA A6 0D            [ 1] 2685 	ld a,#CR 
      0090BC CD 82 9E         [ 4] 2686 	call putc 
      0090BF 4F               [ 1] 2687 	clr a
      0090C0 81               [ 4] 2688 	ret
                                   2689 
                                   2690 
                                   2691 ;--------------------------------
                                   2692 ; BASIC: SHOW 
                                   2693 ;  show content of dstack,cstack
                                   2694 ;--------------------------------
      0090C1                       2695 show:
      0090C1 CD 90 50         [ 4] 2696 	call dots
      0090C4 CD 90 89         [ 4] 2697 	call dotr 
      0090C7 4F               [ 1] 2698 	clr a 
      0090C8 81               [ 4] 2699 	ret
                                   2700 
                                   2701 
                                   2702 ;--------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 53.
Hexadecimal [24-Bits]



                                   2703 ;  add 2 integers
                                   2704 ;  input:
                                   2705 ;    N1     on cstack 
                                   2706 ;    N2     on cstack 
                                   2707 ;  output:
                                   2708 ;    X 		n2+n1 
                                   2709 ;--------------------------------
                                   2710 	;arugments on cstack 
      0090C9                       2711 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001049                       2712 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001049                       2713 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001049                       2714 add:
      0090C9 1E 05            [ 2] 2715 	ldw x ,(N2,sp)
      0090CB 72 FB 03         [ 2] 2716 	addw x,(N1,sp)
      0090CE 1F 03            [ 2] 2717 	ldw (N1,sp),x 
      0090D0 81               [ 4] 2718 	ret 
                                   2719 
                                   2720 ;--------------------------------
                                   2721 ;  substract 2 ntegers
                                   2722 ;  input:
                                   2723 ;    N1     on cstack 
                                   2724 ;    N2     on cstack 
                                   2725 ;  output:
                                   2726 ;    X 		n2+n1 
                                   2727 ;--------------------------------
      0090D1                       2728 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001051                       2729 	_arg N1 1 
                           000003     1     N1=ARG_OFS+1 
      001051                       2730 	_arg N2 3 
                           000005     1     N2=ARG_OFS+3 
      001051                       2731 substract:
      0090D1 1E 05            [ 2] 2732 	ldw x,(N2,sp)
      0090D3 72 F0 03         [ 2] 2733 	subw x,(N1,sp)
      0090D6 81               [ 4] 2734 	ret 
                                   2735 
                                   2736 ;-------------------------------------
                                   2737 ; multiply 2 integers
                                   2738 ; product overflow is ignored unless
                                   2739 ; MATH_OVF assembler flag is set to 1
                                   2740 ; input:
                                   2741 ;  	N1      on cstack
                                   2742 ;   N2 		on cstack 
                                   2743 ; output:
                                   2744 ;	X        N1*N2 
                                   2745 ;-------------------------------------
                                   2746 	;arguments 
      0090D7                       2747 	_argofs 3
                           000005     1     ARG_OFS=2+3 
      001057                       2748 	_arg N1_HB 1
                           000006     1     N1_HB=ARG_OFS+1 
      001057                       2749 	_arg N1_LB 2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 54.
Hexadecimal [24-Bits]



                           000007     1     N1_LB=ARG_OFS+2 
      001057                       2750 	_arg N2_HB 3
                           000008     1     N2_HB=ARG_OFS+3 
      001057                       2751 	_arg N2_LB 4 
                           000009     1     N2_LB=ARG_OFS+4 
                                   2752    ; local variables 
                           000001  2753 	SIGN=1
                           000002  2754 	PROD=2
                           000003  2755 	VSIZE=3
      001057                       2756 multiply:
      001057                       2757 	_vars VSIZE 
      0090D7 52 03            [ 2]    1     sub sp,#VSIZE 
      0090D9 0F 01            [ 1] 2758 	clr (SIGN,sp)
      0090DB 1E 06            [ 2] 2759 	ldw x,(N1_HB,sp)
      0090DD 9E               [ 1] 2760 	ld a,xh  
      0090DE A5 80            [ 1] 2761 	bcp a,#0x80 
      0090E0 27 05            [ 1] 2762 	jreq 2$
      0090E2 03 01            [ 1] 2763 	cpl (SIGN,sp)
      0090E4 50               [ 2] 2764 	negw x 
      0090E5 1F 06            [ 2] 2765 	ldw (N1_HB,sp),x 
      0090E7 1E 08            [ 2] 2766 2$: ldw x,(N2_HB,sp)
      0090E9 9E               [ 1] 2767 	ld a,xh  
      0090EA A5 80            [ 1] 2768 	bcp a,#0x80 
      0090EC 27 05            [ 1] 2769 	jreq 3$
      0090EE 03 01            [ 1] 2770 	cpl (SIGN,sp)
      0090F0 50               [ 2] 2771 	negw x 
      0090F1 1F 08            [ 2] 2772 	ldw (N2_HB,sp),x 
                                   2773 ; N1_LB * N2_LB 	
      0090F3 7B 07            [ 1] 2774 3$:	ld a,(N1_LB,sp)
      0090F5 97               [ 1] 2775 	ld xl,a 
      0090F6 7B 09            [ 1] 2776 	ld a,(N2_LB,sp) 
      0090F8 42               [ 4] 2777 	mul x,a 
                           000000  2778 .if MATH_OVF 	
                                   2779 	ld a,xh 
                                   2780 	bcp a,#0x80 
                                   2781 	jreq 4$ 
                                   2782 	ld a,#ERR_MATH_OVF 
                                   2783 	jp tb_error
                                   2784 .endif 	 
      0090F9 1F 02            [ 2] 2785 4$:	ldw (PROD,sp),x
                                   2786 ; N1_LB * N2_HB	 
      0090FB 7B 07            [ 1] 2787 	ld a,(N1_LB,sp) 
      0090FD 97               [ 1] 2788 	ld xl,a 
      0090FE 7B 08            [ 1] 2789 	ld a,(N2_HB,sp)
      009100 42               [ 4] 2790 	mul x,a
      009101 9F               [ 1] 2791 	ld a,xl 
      009102 1B 02            [ 1] 2792 	add a,(PROD,sp)
                           000000  2793 .if MATH_OVF 	
                                   2794 	bcp a,#0x80 
                                   2795 	jreq 5$ 
                                   2796 	ld a,#ERR_MATH_OVF 
                                   2797 	jp tb_error
                                   2798 .endif 	 
      009104 6B 02            [ 1] 2799 5$:	ld (PROD,sp),a 
                                   2800 ; N1_HB * N2_LB 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 55.
Hexadecimal [24-Bits]



      009106 7B 06            [ 1] 2801 	ld a,(N1_HB,sp)
      009108 97               [ 1] 2802 	ld xl,a 
      009109 7B 09            [ 1] 2803 	ld a,(N2_LB,sp)
      00910B 42               [ 4] 2804 	mul x,a 
      00910C 9F               [ 1] 2805 	ld a,xl 
      00910D 1B 02            [ 1] 2806 	add a,(PROD,sp)
                           000000  2807 .if MATH_OVF 	
                                   2808 	bcp a,#0x80 
                                   2809 	jreq 6$ 
                                   2810 	ld a,#ERR_MATH_OVF 
                                   2811 	jp tb_error
                                   2812 .endif 	 
      00910F 6B 02            [ 1] 2813 6$:	ld (PROD,sp),a 
                                   2814 ; N1_HB * N2_HB 	
                                   2815 ; it is pointless to multiply N1_HB*N2_HB 
                                   2816 ; as this product is over 65535 or 0 
                                   2817 ;
                                   2818 ; sign adjust product
      009111 0D 01            [ 1] 2819 	tnz (SIGN,sp)
      009113 27 05            [ 1] 2820 	jreq 7$
      009115 1E 02            [ 2] 2821 	ldw x, (PROD,sp)
      009117 50               [ 2] 2822 	negw x
      009118 1F 02            [ 2] 2823 	ldw (PROD,sp),x  
      00911A                       2824 7$: 
      00911A 1E 02            [ 2] 2825 	ldw x,(PROD,sp) 
      00109C                       2826 	_drop VSIZE 
      00911C 5B 03            [ 2]    1     addw sp,#VSIZE 
      00911E 81               [ 4] 2827 	ret
                                   2828 
                                   2829 ;----------------------------------
                                   2830 ;  euclidian divide n2/n1 
                                   2831 ; input:
                                   2832 ;    N2 	on cstack
                                   2833 ;    N1 	on cstack
                                   2834 ; output:
                                   2835 ;    X      n2/n1 
                                   2836 ;    Y      remainder 
                                   2837 ;----------------------------------
      00911F                       2838 	_argofs 2
                           000004     1     ARG_OFS=2+2 
      00109F                       2839 	_arg DIVISR 1
                           000005     1     DIVISR=ARG_OFS+1 
      00109F                       2840 	_arg DIVIDND 3
                           000007     1     DIVIDND=ARG_OFS+3 
                                   2841 	; local variables
                           000001  2842 	SQUOT=1 ; sign quotient
                           000002  2843 	SDIVD=2 ; sign dividend  
                           000002  2844 	VSIZE=2
      00109F                       2845 divide:
      00109F                       2846 	_vars VSIZE 
      00911F 52 02            [ 2]    1     sub sp,#VSIZE 
      009121 0F 01            [ 1] 2847 	clr (SQUOT,sp)
      009123 0F 02            [ 1] 2848 	clr (SDIVD,sp)
                                   2849 ; check for 0 divisor
      009125 1E 05            [ 2] 2850 	ldw x,(DIVISR,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 56.
Hexadecimal [24-Bits]



      009127 5D               [ 2] 2851 	tnzw x 
      009128 26 05            [ 1] 2852     jrne 0$
      00912A A6 04            [ 1] 2853 	ld a,#ERR_DIV0 
      00912C CC 87 23         [ 2] 2854 	jp tb_error 
                                   2855 ; check divisor sign 	
      00912F 9E               [ 1] 2856 0$:	ld a,xh 
      009130 A5 80            [ 1] 2857 	bcp a,#0x80 
      009132 27 03            [ 1] 2858 	jreq 1$
      009134 03 01            [ 1] 2859 	cpl (SQUOT,sp)
      009136 50               [ 2] 2860 	negw x 
      009137 1F 05            [ 2] 2861 1$:	ldw (DIVISR,sp),x
                                   2862 ; check dividend sign 	 
      009139 1E 07            [ 2] 2863     ldw x,(DIVIDND,sp)
      00913B 9E               [ 1] 2864 	ld a,xh 
      00913C A5 80            [ 1] 2865 	bcp a,#0x80 
      00913E 27 05            [ 1] 2866 	jreq 2$ 
      009140 03 01            [ 1] 2867 	cpl (SQUOT,sp)
      009142 03 02            [ 1] 2868 	cpl (SDIVD,sp)
      009144 50               [ 2] 2869 	negw x 
      009145 16 05            [ 2] 2870 2$:	ldw y,(DIVISR,sp)
      009147 65               [ 2] 2871 	divw x,y
      009148 90 CF 00 0A      [ 2] 2872 	ldw acc16,y 
                                   2873 ; if sign dividend is negative and remainder!=0 inc divisor 	 
      00914C 0D 02            [ 1] 2874 	tnz (SDIVD,sp)
      00914E 27 0B            [ 1] 2875 	jreq 7$
      009150 90 5D            [ 2] 2876 	tnzw y 
      009152 27 07            [ 1] 2877 	jreq 7$
      009154 5C               [ 1] 2878 	incw x
      009155 16 05            [ 2] 2879 	ldw y,(DIVISR,sp)
      009157 72 B2 00 0A      [ 2] 2880 	subw y,acc16
      00915B 0D 01            [ 1] 2881 7$: tnz (SQUOT,sp)
      00915D 27 01            [ 1] 2882 	jreq 9$ 	 
      00915F 50               [ 2] 2883 8$:	negw x 
      009160                       2884 9$: 
      0010E0                       2885 	_drop VSIZE 
      009160 5B 02            [ 2]    1     addw sp,#VSIZE 
      009162 81               [ 4] 2886 	ret 
                                   2887 
                                   2888 
                                   2889 ;----------------------------------
                                   2890 ;  remainder resulting from euclidian 
                                   2891 ;  division of n2/n1 
                                   2892 ; input:
                                   2893 ;   N1 		cstack 
                                   2894 ;   N2      cstack
                                   2895 ; output:
                                   2896 ;   X       N2%N1 
                                   2897 ;----------------------------------
                                   2898 	
                           000003  2899 	N1=3
                           000005  2900 	N2=5
                           000004  2901 	VSIZE=4
      009163                       2902 modulo:
      009163 1E 03            [ 2] 2903 	Ldw x,(N1,sp)
      009165 16 05            [ 2] 2904 	ldw y,(N2,sp)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 57.
Hexadecimal [24-Bits]



      0010E7                       2905 	_vars VSIZE 
      009167 52 04            [ 2]    1     sub sp,#VSIZE 
      009169 1F 01            [ 2] 2906 	ldw (1,sp),x 
      00916B 17 03            [ 2] 2907 	ldw (3,sp),y 
      00916D CD 91 1F         [ 4] 2908 	call divide 
      009170 93               [ 1] 2909 	ldw x,y
      0010F1                       2910 	_drop VSIZE 
      009171 5B 04            [ 2]    1     addw sp,#VSIZE 
      009173 81               [ 4] 2911 	ret 
                                   2912 
                                   2913 ;---------------------------------
                                   2914 ; drop n elements from data stack 
                                   2915 ; input: 
                                   2916 ;   X 		n 
                                   2917 ; output:
                                   2918 ;   none 
                                   2919 ;-------------------------------------
      009174                       2920 ddrop_n:
      009174 90 89            [ 2] 2921 	pushw y 
      009176 90 CE 00 1A      [ 2] 2922 	ldw y,dstkptr 
      00917A 58               [ 2] 2923 	sllw x 
      00917B 89               [ 2] 2924 	pushw x 
      00917C 72 F9 01         [ 2] 2925 	addw y,(1,sp)
      00917F 90 CF 00 1A      [ 2] 2926 	ldw dstkptr,y 
      009183 85               [ 2] 2927 	popw x 
      009184 90 85            [ 2] 2928 	popw y
      009186 81               [ 4] 2929 	ret 
                                   2930 
                                   2931 ;---------------------------------
                                   2932 ; execute procedure which address
                                   2933 ; is at TOS 
                                   2934 ; --------------------------------
      009187                       2935 execute: ; { addr -- ? }
      009187 CD 8F DB         [ 4] 2936 	call dpop
      00918A FC               [ 2] 2937 	jp (x)
                                   2938 
                                   2939 
                                   2940 ;---------------------------------
                                   2941 ; input:
                                   2942 ;	X 		dictionary entry point 
                                   2943 ;  pad		.asciz name to search 
                                   2944 ; output:
                                   2945 ;  A 		TK_CMD|TK_FUNC|TK_NONE 
                                   2946 ;  X		execution address | 0 
                                   2947 ;---------------------------------
                           000001  2948 	NLEN=1 ; cmd length 
                           000002  2949 	YSAVE=2
                           000003  2950 	VSIZE=3 
      00918B                       2951 search_dict:
      00110B                       2952 	_vars VSIZE 
      00918B 52 03            [ 2]    1     sub sp,#VSIZE 
      00918D 90 93            [ 1] 2953 	ldw y,x 
      00918F                       2954 search_next:	
      00918F 90 F6            [ 1] 2955 	ld a,(y)
      009191 A4 7F            [ 1] 2956 	and a,#0x7f 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 58.
Hexadecimal [24-Bits]



      009193 6B 01            [ 1] 2957 	ld (NLEN,sp),a  
      009195 AE 17 18         [ 2] 2958 	ldw x,#pad 
      009198 17 02            [ 2] 2959 	ldw (YSAVE,sp),y
      00919A 90 5C            [ 1] 2960 	incw y  
      00919C                       2961 cp_loop:
      00919C F6               [ 1] 2962 	ld a,(x)
      00919D 27 1E            [ 1] 2963 	jreq str_match 
      00919F 0D 01            [ 1] 2964 	tnz (NLEN,sp)
      0091A1 27 0B            [ 1] 2965 	jreq no_match  
      0091A3 90 F1            [ 1] 2966 	cp a,(y)
      0091A5 26 07            [ 1] 2967 	jrne no_match 
      0091A7 90 5C            [ 1] 2968 	incw y 
      0091A9 5C               [ 1] 2969 	incw x
      0091AA 0A 01            [ 1] 2970 	dec (NLEN,sp)
      0091AC 20 EE            [ 2] 2971 	jra cp_loop 
      0091AE                       2972 no_match:
      0091AE 16 02            [ 2] 2973 	ldw y,(YSAVE,sp) 
      0091B0 72 A2 00 02      [ 2] 2974 	subw y,#2 ; move Y to link field
      0091B4 4B 00            [ 1] 2975 	push #TK_NONE 
      0091B6 90 FE            [ 2] 2976 	ldw y,(y) ; next word link 
      0091B8 84               [ 1] 2977 	pop a ; TK_NONE 
      0091B9 27 24            [ 1] 2978 	jreq search_exit  ; not found  
                                   2979 ;try next 
      0091BB 20 D2            [ 2] 2980 	jra search_next
      0091BD                       2981 str_match:
      0091BD 16 02            [ 2] 2982 	ldw y,(YSAVE,sp)
      0091BF 90 F6            [ 1] 2983 	ld a,(y)
      0091C1 6B 01            [ 1] 2984 	ld (NLEN,sp),a ; needed to test bit 7 
      0091C3 A4 7F            [ 1] 2985 	and a,#0x7f 
                                   2986 ; move y to procedure address field 	
      0091C5 4C               [ 1] 2987 	inc a 
      0091C6 C7 00 0B         [ 1] 2988 	ld acc8,a 
      0091C9 72 5F 00 0A      [ 1] 2989 	clr acc16 
      0091CD 72 B9 00 0A      [ 2] 2990 	addw y,acc16 
      0091D1 90 FE            [ 2] 2991 	ldw y,(y) ; routine entry point 
      0091D3 7B 01            [ 1] 2992 	ld a,(NLEN,sp)
      0091D5 A5 80            [ 1] 2993 	bcp a,#0x80 
      0091D7 27 04            [ 1] 2994 	jreq 1$
      0091D9 A6 0C            [ 1] 2995 	ld a,#TK_FUNC 
      0091DB 20 02            [ 2] 2996 	jra search_exit
      0091DD A6 07            [ 1] 2997 1$: ld a,#TK_CMD 
      0091DF                       2998 search_exit: 
      0091DF 93               [ 1] 2999 	ldw x,y ; x=routine address 
      001160                       3000 	_drop VSIZE 	 
      0091E0 5B 03            [ 2]    1     addw sp,#VSIZE 
      0091E2 81               [ 4] 3001 	ret 
                                   3002 
                                   3003 ;---------------------
                                   3004 ; check if next token
                                   3005 ;  is of expected type 
                                   3006 ; input:
                                   3007 ;   A 		 expected token attribute
                                   3008 ;  ouput:
                                   3009 ;   none     if fail call tb_error 
                                   3010 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 59.
Hexadecimal [24-Bits]



      0091E3                       3011 expect:
      0091E3 88               [ 1] 3012 	push a 
      0091E4 CD 8D 1B         [ 4] 3013 	call get_token 
      0091E7 11 01            [ 1] 3014 	cp a,(1,sp)
      0091E9 27 03            [ 1] 3015 	jreq 1$
      0091EB CC 87 21         [ 2] 3016 	jp syntax_error
      0091EE 84               [ 1] 3017 1$: pop a 
      0091EF 81               [ 4] 3018 	ret 
                                   3019 
                                   3020 
                                   3021 ;-------------------------------
                                   3022 ; parse embedded BASIC routines 
                                   3023 ; arguments list.
                                   3024 ; arg_list::=  rel[','rel]*
                                   3025 ; all arguments are of integer type
                                   3026 ; input:
                                   3027 ;   none
                                   3028 ; output:
                                   3029 ;   A 			number of arguments pushed on dstack  
                                   3030 ;--------------------------------
                           000001  3031 	ARG_CNT=1 
      0091F0                       3032 arg_list:
      0091F0 4B 00            [ 1] 3033 	push #0  
      0091F2 CD 93 2C         [ 4] 3034 1$: call relation
      0091F5 A1 00            [ 1] 3035 	cp a,#TK_NONE 
      0091F7 27 19            [ 1] 3036 	jreq 5$
      0091F9 A1 0A            [ 1] 3037 	cp a,#TK_INTGR
      0091FB 26 12            [ 1] 3038 	jrne 4$
      0091FD CD 8F CE         [ 4] 3039 3$: call dpush 
      009200 0C 01            [ 1] 3040     inc (ARG_CNT,sp)
      009202 CD 8D 1B         [ 4] 3041 	call get_token 
      009205 A1 00            [ 1] 3042 	cp a,#TK_NONE 
      009207 27 09            [ 1] 3043 	jreq 5$ 
      009209 A1 08            [ 1] 3044 	cp a,#TK_COMMA 
      00920B 26 02            [ 1] 3045 	jrne 4$
      00920D 20 E3            [ 2] 3046 	jra 1$ 
      00920F CD 90 3F         [ 4] 3047 4$:	call unget_token 
      009212 84               [ 1] 3048 5$:	pop a 
      009213 81               [ 4] 3049 	ret 
                                   3050 
                                   3051 
                                   3052 
                                   3053 ;--------------------------------
                                   3054 ;   BASIC commnands 
                                   3055 ;--------------------------------
                                   3056 
                                   3057 ;--------------------------------
                                   3058 ;  arithmetic and relational 
                                   3059 ;  routines
                                   3060 ;  operators precedence
                                   3061 ;  highest to lowest
                                   3062 ;  operators on same row have 
                                   3063 ;  same precedence and are executed
                                   3064 ;  from left to right.
                                   3065 ;	'*','/','%'
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 60.
Hexadecimal [24-Bits]



                                   3066 ;   '-','+'
                                   3067 ;   '=','>','<','>=','<=','<>','><'
                                   3068 ;   '<>' and '><' are equivalent for not equal.
                                   3069 ;--------------------------------
                                   3070 
                                   3071 ;---------------------
                                   3072 ; return array element
                                   3073 ; address from @(expr)
                                   3074 ; input:
                                   3075 ;   A 		TK_ARRAY
                                   3076 ; output:
                                   3077 ;   A 		TK_INTGR
                                   3078 ;	X 		element address 
                                   3079 ;----------------------
      009214                       3080 get_array_element:
      009214 CD 90 02         [ 4] 3081 	call ddrop 
      009217 A6 04            [ 1] 3082 	ld a,#TK_LPAREN 
      009219 CD 91 E3         [ 4] 3083 	call expect
      00921C CD 93 2C         [ 4] 3084 	call relation 
      00921F A1 0A            [ 1] 3085 	cp a,#TK_INTGR 
      009221 27 03            [ 1] 3086 	jreq 1$
      009223 CC 87 21         [ 2] 3087 	jp syntax_error
      009226 89               [ 2] 3088 1$: pushw x 
      009227 A6 05            [ 1] 3089 	ld a,#TK_RPAREN 
      009229 CD 91 E3         [ 4] 3090 	call expect
                                   3091 	; check for bounds 
      00922C 85               [ 2] 3092 	popw x   
      00922D C3 00 23         [ 2] 3093 	cpw x,array_size 
      009230 23 05            [ 2] 3094 	jrule 3$
                                   3095 ; bounds {1..array_size}	
      009232 A6 0A            [ 1] 3096 2$: ld a,#ERR_BAD_VALUE 
      009234 CC 87 23         [ 2] 3097 	jp tb_error 
      009237 5D               [ 2] 3098 3$: tnzw  x
      009238 27 F8            [ 1] 3099 	jreq 2$ 
      00923A 58               [ 2] 3100 	sllw x 
      00923B 89               [ 2] 3101 	pushw x 
      00923C CE 00 21         [ 2] 3102 	ldw x,array_addr  
      00923F 72 F0 01         [ 2] 3103 	subw x,(1,sp)
      0011C2                       3104 	_drop 2   
      009242 5B 02            [ 2]    1     addw sp,#2 
      009244 A6 0A            [ 1] 3105 	ld a,#TK_INTGR
      009246 81               [ 4] 3106 	ret 
                                   3107 
                                   3108 ;***********************************
                                   3109 ;   expression parse,execute 
                                   3110 ;***********************************
                                   3111 ;-----------------------------------
                                   3112 ; factor ::= ['+'|'-'|e] var | @ |
                                   3113 ;			 integer | function |
                                   3114 ;			 '('relation')' 
                                   3115 ; output:
                                   3116 ;   A    token attribute 
                                   3117 ;   X 	 integer
                                   3118 ; ---------------------------------
                           000001  3119 	NEG=1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 61.
Hexadecimal [24-Bits]



                           000001  3120 	VSIZE=1
      009247                       3121 factor:
      0011C7                       3122 	_vars VSIZE 
      009247 52 01            [ 2]    1     sub sp,#VSIZE 
      009249 CD 8D 1B         [ 4] 3123 	call get_token
      00924C A1 02            [ 1] 3124 	cp a,#2 
      00924E 2B 48            [ 1] 3125 	jrmi 20$
      009250 6B 01            [ 1] 3126 1$:	ld (NEG,sp),a 
      009252 A4 10            [ 1] 3127 	and a,#TK_GRP_ADD  
      009254 26 04            [ 1] 3128 	jrne 2$
      009256 7B 01            [ 1] 3129 	ld a,(NEG,sp)
      009258 20 03            [ 2] 3130 	jra 4$  
      00925A                       3131 2$:	
      00925A CD 8D 1B         [ 4] 3132 	call get_token 
      00925D                       3133 4$:	
      00925D A1 0C            [ 1] 3134 	cp a,#TK_FUNC 
      00925F 26 03            [ 1] 3135 	jrne 5$ 
      009261 FD               [ 4] 3136 	call (x) 
      009262 20 2B            [ 2] 3137 	jra 18$ 
      009264                       3138 5$:
      009264 A1 0A            [ 1] 3139 	cp a,#TK_INTGR
      009266 26 02            [ 1] 3140 	jrne 6$
      009268 20 25            [ 2] 3141 	jra 18$
      00926A                       3142 6$:
      00926A A1 03            [ 1] 3143 	cp a,#TK_ARRAY
      00926C 26 06            [ 1] 3144 	jrne 10$
      00926E CD 92 14         [ 4] 3145 	call get_array_element
      009271 FE               [ 2] 3146 	ldw x,(x)
      009272 20 1B            [ 2] 3147 	jra 18$ 
      009274                       3148 10$:
      009274 A1 02            [ 1] 3149 	cp a,#TK_VAR 
      009276 26 03            [ 1] 3150 	jrne 12$
      009278 FE               [ 2] 3151 	ldw x,(x)
      009279 20 14            [ 2] 3152 	jra 18$
      00927B                       3153 12$:			
      00927B A1 04            [ 1] 3154 	cp a,#TK_LPAREN
      00927D 26 0A            [ 1] 3155 	jrne 16$
      00927F CD 93 2C         [ 4] 3156 	call relation
      009282 A6 05            [ 1] 3157 	ld a,#TK_RPAREN 
      009284 CD 91 E3         [ 4] 3158 	call expect
      009287 20 06            [ 2] 3159 	jra 18$	
      009289                       3160 16$:
      009289 CD 90 3F         [ 4] 3161 	call unget_token
      00928C 4F               [ 1] 3162 	clr a 
      00928D 20 09            [ 2] 3163 	jra 20$ 
      00928F                       3164 18$: 
      00928F A6 11            [ 1] 3165 	ld a,#TK_MINUS 
      009291 11 01            [ 1] 3166 	cp a,(NEG,sp)
      009293 26 01            [ 1] 3167 	jrne 19$
      009295 50               [ 2] 3168 	negw x
      009296                       3169 19$:
      009296 A6 0A            [ 1] 3170 	ld a,#TK_INTGR
      009298                       3171 20$:
      001218                       3172 	_drop VSIZE
      009298 5B 01            [ 2]    1     addw sp,#VSIZE 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 62.
Hexadecimal [24-Bits]



      00929A 81               [ 4] 3173 	ret
                                   3174 
                                   3175 ;-----------------------------------
                                   3176 ; term ::= factor [['*'|'/'|'%'] factor]* 
                                   3177 ; output:
                                   3178 ;   A    	token attribute 
                                   3179 ;	X		integer
                                   3180 ;-----------------------------------
                           000001  3181 	N1=1
                           000003  3182 	N2=3
                           000005  3183 	MULOP=5
                           000005  3184 	VSIZE=5
      00929B                       3185 term:
      00121B                       3186 	_vars VSIZE
      00929B 52 05            [ 2]    1     sub sp,#VSIZE 
      00929D CD 92 47         [ 4] 3187 	call factor
      0092A0 A1 02            [ 1] 3188 	cp a,#2
      0092A2 2B 41            [ 1] 3189 	jrmi term_exit
      0092A4                       3190 term01:	 ; check for  operator 
      0092A4 1F 03            [ 2] 3191 	ldw (N2,sp),x  ; save first factor 
      0092A6 CD 8D 1B         [ 4] 3192 	call get_token
      0092A9 A1 02            [ 1] 3193 	cp a,#2
      0092AB 2B 34            [ 1] 3194 	jrmi 9$
      0092AD 6B 05            [ 1] 3195 0$:	ld (MULOP,sp),a
      0092AF A4 30            [ 1] 3196 	and a,#TK_GRP_MASK
      0092B1 A1 20            [ 1] 3197 	cp a,#TK_GRP_MULT
      0092B3 27 07            [ 1] 3198 	jreq 1$
      0092B5 7B 05            [ 1] 3199 	ld a,(MULOP,sp) 
      0092B7 CD 90 3F         [ 4] 3200 	call unget_token 
      0092BA 20 25            [ 2] 3201 	jra 9$
      0092BC                       3202 1$:	; got *|/|%
      0092BC CD 92 47         [ 4] 3203 	call factor
      0092BF A1 0A            [ 1] 3204 	cp a,#TK_INTGR
      0092C1 27 03            [ 1] 3205 	jreq 2$ 
      0092C3 CC 87 21         [ 2] 3206 	jp syntax_error
      0092C6 1F 01            [ 2] 3207 2$:	ldw (N1,sp),x  
      0092C8 7B 05            [ 1] 3208 	ld a,(MULOP,sp) 
      0092CA A1 20            [ 1] 3209 	cp a,#TK_MULT 
      0092CC 26 05            [ 1] 3210 	jrne 3$
      0092CE CD 90 D7         [ 4] 3211 	call multiply 
      0092D1 20 D1            [ 2] 3212 	jra term01
      0092D3 A1 21            [ 1] 3213 3$: cp a,#TK_DIV 
      0092D5 26 05            [ 1] 3214 	jrne 4$ 
      0092D7 CD 91 1F         [ 4] 3215 	call divide 
      0092DA 20 C8            [ 2] 3216 	jra term01 
      0092DC CD 91 63         [ 4] 3217 4$: call modulo
      0092DF 20 C3            [ 2] 3218 	jra term01 
      0092E1 1E 03            [ 2] 3219 9$: ldw x,(N2,sp)  
      0092E3 A6 0A            [ 1] 3220 	ld a,#TK_INTGR 	
      0092E5                       3221 term_exit:
      001265                       3222 	_drop VSIZE 
      0092E5 5B 05            [ 2]    1     addw sp,#VSIZE 
      0092E7 81               [ 4] 3223 	ret 
                                   3224 
                                   3225 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 63.
Hexadecimal [24-Bits]



                                   3226 ;  expr ::= term [['+'|'-'] term]*
                                   3227 ;  result range {-32768..32767}
                                   3228 ;  output:
                                   3229 ;   A    token attribute 
                                   3230 ;   X	 integer   
                                   3231 ;-------------------------------
                           000001  3232 	N1=1 
                           000003  3233 	N2=3
                           000005  3234 	OP=5 
                           000005  3235 	VSIZE=5 
      0092E8                       3236 expression:
      001268                       3237 	_vars VSIZE 
      0092E8 52 05            [ 2]    1     sub sp,#VSIZE 
      0092EA CD 92 9B         [ 4] 3238 	call term
      0092ED A1 02            [ 1] 3239 	cp a,#2 
      0092EF 2B 38            [ 1] 3240 	jrmi expr_exit 
      0092F1 1F 03            [ 2] 3241 0$:	ldw (N2,sp),x 
      0092F3 CD 8D 1B         [ 4] 3242 	call get_token
      0092F6 A1 02            [ 1] 3243 	cp a,#2
      0092F8 2B 2B            [ 1] 3244 	jrmi 9$ 
      0092FA 6B 05            [ 1] 3245 1$:	ld (OP,sp),a  
      0092FC A4 30            [ 1] 3246 	and a,#TK_GRP_MASK
      0092FE A1 10            [ 1] 3247 	cp a,#TK_GRP_ADD 
      009300 27 07            [ 1] 3248 	jreq 2$ 
      009302 7B 05            [ 1] 3249 	ld a,(OP,sp)
      009304 CD 90 3F         [ 4] 3250 	call unget_token
      009307 20 1C            [ 2] 3251 	jra 9$
      009309                       3252 2$: 
      009309 CD 92 9B         [ 4] 3253 	call term
      00930C A1 0A            [ 1] 3254 	cp a,#TK_INTGR 
      00930E 27 03            [ 1] 3255 	jreq 3$
      009310 CC 87 21         [ 2] 3256 	jp syntax_error
      009313 1F 01            [ 2] 3257 3$:	ldw (N1,sp),x 
      009315 7B 05            [ 1] 3258 	ld a,(OP,sp)
      009317 A1 10            [ 1] 3259 	cp a,#TK_PLUS 
      009319 26 05            [ 1] 3260 	jrne 4$
      00931B CD 90 C9         [ 4] 3261 	call add 
      00931E 20 D1            [ 2] 3262 	jra 0$ 
      009320 CD 90 D1         [ 4] 3263 4$:	call substract
      009323 20 CC            [ 2] 3264 	jra 0$
      009325 1E 03            [ 2] 3265 9$: ldw x,(N2,sp)
      009327 A6 0A            [ 1] 3266 	ld a,#TK_INTGR	
      009329                       3267 expr_exit:
      0012A9                       3268 	_drop VSIZE 
      009329 5B 05            [ 2]    1     addw sp,#VSIZE 
      00932B 81               [ 4] 3269 	ret 
                                   3270 
                                   3271 ;---------------------------------------------
                                   3272 ; rel ::= expr rel_op expr
                                   3273 ; rel_op ::=  '=','<','>','>=','<=','<>','><'
                                   3274 ;  relation return 1 | 0  for true | false 
                                   3275 ;  output:
                                   3276 ;    A 		token attribute  
                                   3277 ;	 X		1|0
                                   3278 ;---------------------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 64.
Hexadecimal [24-Bits]



                           000001  3279 	N1=1
                           000003  3280 	N2=3
                           000005  3281 	RELOP=5
                           000005  3282 	VSIZE=5 
      00932C                       3283 relation: 
      0012AC                       3284 	_vars VSIZE
      00932C 52 05            [ 2]    1     sub sp,#VSIZE 
      00932E CD 92 E8         [ 4] 3285 	call expression
      009331 A1 02            [ 1] 3286 	cp a,#2 
      009333 2B 4B            [ 1] 3287 	jrmi rel_exit 
                                   3288 	; expect rel_op or leave 
      009335 1F 03            [ 2] 3289 	ldw (N2,sp),x 
      009337 CD 8D 1B         [ 4] 3290 	call get_token 
      00933A A1 02            [ 1] 3291 	cp a,#2
      00933C 2B 3E            [ 1] 3292 	jrmi 9$
      00933E                       3293 1$:	
      00933E 6B 05            [ 1] 3294 	ld (RELOP,sp),a 
      009340 A4 30            [ 1] 3295 	and a,#TK_GRP_MASK
      009342 A1 30            [ 1] 3296 	cp a,#0x30 
      009344 27 07            [ 1] 3297 	jreq 2$
      009346 7B 05            [ 1] 3298 	ld a,(RELOP,sp)
      009348 CD 90 3F         [ 4] 3299 	call unget_token  
      00934B 20 2F            [ 2] 3300 	jra 9$
      00934D                       3301 2$:	; expect another expression or error 
      00934D CD 92 E8         [ 4] 3302 	call expression
      009350 A1 0A            [ 1] 3303 	cp a,#TK_INTGR 
      009352 27 03            [ 1] 3304 	jreq 3$
      009354 CC 87 21         [ 2] 3305 	jp syntax_error 
      009357 1F 01            [ 2] 3306 3$:	ldw (N1,sp),x 
      009359 CD 90 D1         [ 4] 3307 	call substract
      00935C 26 06            [ 1] 3308 	jrne 4$
      00935E 35 02 00 0B      [ 1] 3309 	mov acc8,#2 ; n1==n2
      009362 20 0C            [ 2] 3310 	jra 6$ 
      009364                       3311 4$: 
      009364 2C 06            [ 1] 3312 	jrsgt 5$  
      009366 35 04 00 0B      [ 1] 3313 	mov acc8,#4 ; n1<2 
      00936A 20 04            [ 2] 3314 	jra 6$
      00936C                       3315 5$:
      00936C 35 01 00 0B      [ 1] 3316 	mov acc8,#1 ; n1>n2 
      009370                       3317 6$:
      009370 5F               [ 1] 3318 	clrw x 
      009371 C6 00 0B         [ 1] 3319 	ld a, acc8  
      009374 14 05            [ 1] 3320 	and a,(RELOP,sp)
      009376 4D               [ 1] 3321 	tnz a 
      009377 27 05            [ 1] 3322 	jreq 10$
      009379 5C               [ 1] 3323 	incw x 
      00937A                       3324 7$:	 
      00937A 20 02            [ 2] 3325 	jra 10$  	
      00937C 1E 03            [ 2] 3326 9$: ldw x,(N2,sp)
      00937E                       3327 10$:
      00937E A6 0A            [ 1] 3328 	ld a,#TK_INTGR
      009380                       3329 rel_exit: 	 
      001300                       3330 	_drop VSIZE
      009380 5B 05            [ 2]    1     addw sp,#VSIZE 
      009382 81               [ 4] 3331 	ret 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 65.
Hexadecimal [24-Bits]



                                   3332 
                                   3333 
                                   3334 ;--------------------------------------------
                                   3335 ; BASIC: HEX 
                                   3336 ; select hexadecimal base for integer print
                                   3337 ;---------------------------------------------
      009383                       3338 hex_base:
      009383 35 10 00 08      [ 1] 3339 	mov base,#16 
      009387 81               [ 4] 3340 	ret 
                                   3341 
                                   3342 ;--------------------------------------------
                                   3343 ; BASIC: DEC 
                                   3344 ; select decimal base for integer print
                                   3345 ;---------------------------------------------
      009388                       3346 dec_base:
      009388 35 0A 00 08      [ 1] 3347 	mov base,#10
      00938C 81               [ 4] 3348 	ret 
                                   3349 
                                   3350 ;------------------------
                                   3351 ; BASIC: SIZE 
                                   3352 ; return free size in text area
                                   3353 ; output:
                                   3354 ;   A 		TK_INTGR
                                   3355 ;   X 	    size integer
                                   3356 ;--------------------------
      00938D                       3357 size:
      00938D AE 16 C8         [ 2] 3358 	ldw x,#tib 
      009390 72 B0 00 1E      [ 2] 3359 	subw x,txtend 
      009394 A6 0A            [ 1] 3360 	ld a,#TK_INTGR
      009396 81               [ 4] 3361 	ret 
                                   3362 
                                   3363 
                                   3364 ;------------------------
                                   3365 ; BASIC: UBOUND  
                                   3366 ; return array variable size 
                                   3367 ; output:
                                   3368 ;   A 		TK_INTGR
                                   3369 ;   X 	    array size 
                                   3370 ;--------------------------
      009397                       3371 ubound:
      009397 AE 16 C8         [ 2] 3372 	ldw x,#tib
      00939A 72 B0 00 1E      [ 2] 3373 	subw x,txtend 
      00939E 54               [ 2] 3374 	srlw x 
      00939F CF 00 23         [ 2] 3375 	ldw array_size,x
      0093A2 A6 0A            [ 1] 3376 	ld a,#TK_INTGR
      0093A4 81               [ 4] 3377 	ret 
                                   3378 
      0093A5                       3379 let:
      0093A5 CD 8D 1B         [ 4] 3380 	call get_token 
      0093A8 A1 02            [ 1] 3381 	cp a,#TK_VAR 
      0093AA 27 03            [ 1] 3382 	jreq let02
      0093AC CC 87 21         [ 2] 3383 	jp syntax_error
      0093AF                       3384 let02:
      0093AF CD 8F CE         [ 4] 3385 	call dpush 
      0093B2 CD 8D 1B         [ 4] 3386 	call get_token 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 66.
Hexadecimal [24-Bits]



      0093B5 A1 32            [ 1] 3387 	cp a,#TK_EQUAL
      0093B7 27 03            [ 1] 3388 	jreq 1$
      0093B9 CC 87 21         [ 2] 3389 	jp syntax_error
      0093BC                       3390 1$:	
      0093BC CD 93 2C         [ 4] 3391 	call relation   
      0093BF A1 0A            [ 1] 3392 	cp a,#TK_INTGR 
      0093C1 27 03            [ 1] 3393 	jreq 2$
      0093C3 CC 87 21         [ 2] 3394 	jp syntax_error
      0093C6                       3395 2$:	
      0093C6 90 93            [ 1] 3396 	ldw y,x 
      0093C8 CD 8F DB         [ 4] 3397 	call dpop  
      0093CB FF               [ 2] 3398 	ldw (x),y   
      0093CC 81               [ 4] 3399 	ret 
                                   3400 
                                   3401 ;----------------------------
                                   3402 ; BASIC: LIST [[start][,end]]
                                   3403 ; list program lines 
                                   3404 ; form start to end 
                                   3405 ; if empty argument list then 
                                   3406 ; list all.
                                   3407 ;----------------------------
                           000001  3408 	FIRST=1
                           000003  3409 	LAST=3 
                           000005  3410 	LN_PTR=5
                           000006  3411 	VSIZE=6 
      0093CD                       3412 list:
      00134D                       3413 	_vars VSIZE
      0093CD 52 06            [ 2]    1     sub sp,#VSIZE 
      0093CF CE 00 1C         [ 2] 3414 	ldw x,txtbgn 
      0093D2 C3 00 1E         [ 2] 3415 	cpw x,txtend 
      0093D5 2B 03            [ 1] 3416 	jrmi 1$
      0093D7 CC 94 50         [ 2] 3417 	jp list_exit ; nothing to list 
      0093DA 1F 05            [ 2] 3418 1$:	ldw (LN_PTR,sp),x 
      0093DC FE               [ 2] 3419 	ldw x,(x) 
      0093DD 1F 01            [ 2] 3420 	ldw (FIRST,sp),x ; list from first line 
      0093DF AE 7F FF         [ 2] 3421 	ldw x,#0x7fff ; biggest line number 
      0093E2 1F 03            [ 2] 3422 	ldw (LAST,sp),x 
      0093E4 CD 91 F0         [ 4] 3423 	call arg_list
      0093E7 4D               [ 1] 3424 	tnz a
      0093E8 27 3F            [ 1] 3425 	jreq list_start 
      0093EA A1 02            [ 1] 3426 	cp a,#2 
      0093EC 27 07            [ 1] 3427 	jreq 4$
      0093EE A1 01            [ 1] 3428 	cp a,#1 
      0093F0 27 06            [ 1] 3429 	jreq first_line 
      0093F2 CC 87 21         [ 2] 3430 	jp syntax_error 
      0093F5 CD 8F E8         [ 4] 3431 4$:	call dswap
      0093F8                       3432 first_line:
      0093F8 CD 8F DB         [ 4] 3433 	call dpop 
      0093FB 1F 01            [ 2] 3434 	ldw (FIRST,sp),x 
      0093FD A1 01            [ 1] 3435 	cp a,#1 
      0093FF 27 05            [ 1] 3436 	jreq lines_skip 	
      009401                       3437 last_line:
      009401 CD 8F DB         [ 4] 3438 	call dpop 
      009404 1F 03            [ 2] 3439 	ldw (LAST,sp),x 
      009406                       3440 lines_skip:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 67.
Hexadecimal [24-Bits]



      009406 CE 00 1C         [ 2] 3441 	ldw x,txtbgn
      009409 1F 05            [ 2] 3442 2$:	ldw (LN_PTR,sp),x 
      00940B C3 00 1E         [ 2] 3443 	cpw x,txtend 
      00940E 2A 40            [ 1] 3444 	jrpl list_exit 
      009410 FE               [ 2] 3445 	ldw x,(x) ;lineno 
      009411 13 01            [ 2] 3446 	cpw x,(FIRST,sp)
      009413 2A 14            [ 1] 3447 	jrpl list_start 
      009415 1E 05            [ 2] 3448 	ldw x,(LN_PTR,sp) 
      009417 1C 00 02         [ 2] 3449 	addw x,#2 
      00941A F6               [ 1] 3450 	ld a,(x)
      00941B 5C               [ 1] 3451 	incw x 
      00941C C7 00 0B         [ 1] 3452 	ld acc8,a 
      00941F 72 5F 00 0A      [ 1] 3453 	clr acc16 
      009423 72 BB 00 0A      [ 2] 3454 	addw x,acc16
      009427 20 E0            [ 2] 3455 	jra 2$ 
                                   3456 ; print loop
      009429                       3457 list_start:
      009429 1E 05            [ 2] 3458 	ldw x,(LN_PTR,sp)
      00942B                       3459 3$:	
      00942B CD 94 64         [ 4] 3460 	call prt_basic_line
      00942E 1E 05            [ 2] 3461 	ldw x,(LN_PTR,sp)
      009430 1C 00 02         [ 2] 3462 	addw x,#2 
      009433 F6               [ 1] 3463 	ld a,(x)
      009434 5C               [ 1] 3464 	incw x 
      009435 C7 00 0B         [ 1] 3465 	ld acc8,a 
      009438 72 5F 00 0A      [ 1] 3466 	clr acc16 
      00943C 72 BB 00 0A      [ 2] 3467 	addw x,acc16
      009440 C3 00 1E         [ 2] 3468 	cpw x,txtend 
      009443 2A 0B            [ 1] 3469 	jrpl list_exit
      009445 1F 05            [ 2] 3470 	ldw (LN_PTR,sp),x
      009447 FE               [ 2] 3471 	ldw x,(x)
      009448 13 03            [ 2] 3472 	cpw x,(LAST,sp)  
      00944A 2C 04            [ 1] 3473 	jrsgt list_exit 
      00944C 1E 05            [ 2] 3474 	ldw x,(LN_PTR,sp)
      00944E 20 DB            [ 2] 3475 	jra 3$
      009450                       3476 list_exit:
      0013D0                       3477 	_drop VSIZE 
      009450 5B 06            [ 2]    1     addw sp,#VSIZE 
      009452 81               [ 4] 3478 	ret
                                   3479 
      009453 4E 6F 74 68 69 6E 67  3480 empty: .asciz "Nothing to list\n"
             20 74 6F 20 6C 69 73
             74 0A 00
                                   3481 
                                   3482 ;--------------------------
                                   3483 ; input:
                                   3484 ;   X 		pointer at line
                                   3485 ; output:
                                   3486 ;   none 
                                   3487 ;--------------------------	
      009464                       3488 prt_basic_line:
      009464 89               [ 2] 3489 	pushw x 
      009465 FE               [ 2] 3490 	ldw x,(x)
      009466 CF 00 0A         [ 2] 3491 	ldw acc16,x 
      009469 72 5F 00 09      [ 1] 3492 	clr acc24 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 68.
Hexadecimal [24-Bits]



      00946D AE 00 05         [ 2] 3493 	ldw x,#5 
      009470 A6 0A            [ 1] 3494 	ld a,#10 
      009472 CD 89 4E         [ 4] 3495 	call prti24 
      009475 85               [ 2] 3496 	popw x 
      009476 1C 00 03         [ 2] 3497 	addw x,#3
      009479 CD 82 B0         [ 4] 3498 	call puts 
      00947C A6 0D            [ 1] 3499 	ld a,#CR 
      00947E CD 82 9E         [ 4] 3500 	call putc 
      009481 81               [ 4] 3501 	ret 	
                                   3502 
                                   3503 ;---------------------------------
                                   3504 ; BASIC: PRINT|? arg_list 
                                   3505 ; print values from argument list
                                   3506 ;----------------------------------
                           000001  3507 	COMMA=1
                           000001  3508 	VSIZE=1
      009482                       3509 print:
      009482 4B 00            [ 1] 3510 push #0 ; local variable COMMA 
      009484                       3511 reset_comma:
      009484 0F 01            [ 1] 3512 	clr (COMMA,sp)
      009486                       3513 prt_loop:
      009486 CD 93 2C         [ 4] 3514 	call relation
      009489 A1 01            [ 1] 3515 	cp a,#TK_COLON 
      00948B 27 50            [ 1] 3516 	jreq print_exit   
      00948D A1 0A            [ 1] 3517 	cp a,#TK_INTGR 
      00948F 26 05            [ 1] 3518 	jrne 0$ 
      009491 CD 89 A3         [ 4] 3519 	call print_int 
      009494 20 EE            [ 2] 3520 	jra reset_comma
      009496                       3521 0$: 	
      009496 CD 8D 1B         [ 4] 3522 	call get_token
      009499 A1 00            [ 1] 3523 	cp a,#TK_NONE 
      00949B 27 40            [ 1] 3524 	jreq print_exit 
      00949D A1 06            [ 1] 3525 1$:	cp a,#TK_QSTR
      00949F 26 05            [ 1] 3526 	jrne 2$   
      0094A1 CD 82 B0         [ 4] 3527 	call puts 
      0094A4 20 DE            [ 2] 3528 	jra reset_comma
      0094A6 A1 0B            [ 1] 3529 2$: cp a,#TK_CHAR 
      0094A8 26 06            [ 1] 3530 	jrne 3$
      0094AA 9F               [ 1] 3531 	ld a,xl 
      0094AB CD 82 9E         [ 4] 3532 	call putc 
      0094AE 20 D4            [ 2] 3533 	jra reset_comma 
      0094B0                       3534 3$: 	
      0094B0 A1 0C            [ 1] 3535 	cp a,#TK_FUNC 
      0094B2 26 06            [ 1] 3536 	jrne 4$ 
      0094B4 FD               [ 4] 3537 	call (x)
      0094B5 CD 89 A3         [ 4] 3538 	call print_int 
      0094B8 20 CA            [ 2] 3539 	jra reset_comma 
      0094BA                       3540 4$: 
      0094BA A1 08            [ 1] 3541 	cp a,#TK_COMMA 
      0094BC 26 05            [ 1] 3542 	jrne 5$
      0094BE 03 01            [ 1] 3543 	cpl (COMMA,sp) 
      0094C0 CC 94 86         [ 2] 3544 	jp prt_loop   
      0094C3                       3545 5$: 
      0094C3 A1 09            [ 1] 3546 	cp a,#TK_SHARP
      0094C5 26 13            [ 1] 3547 	jrne 7$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 69.
Hexadecimal [24-Bits]



      0094C7 CD 8D 1B         [ 4] 3548 	call get_token
      0094CA A1 0A            [ 1] 3549 	cp a,#TK_INTGR 
      0094CC 27 03            [ 1] 3550 	jreq 6$
      0094CE CC 87 21         [ 2] 3551 	jp syntax_error 
      0094D1                       3552 6$:
      0094D1 9F               [ 1] 3553 	ld a,xl 
      0094D2 A4 0F            [ 1] 3554 	and a,#15 
      0094D4 C7 00 26         [ 1] 3555 	ld tab_width,a 
      0094D7 CC 94 84         [ 2] 3556 	jp reset_comma 
      0094DA                       3557 7$:	
      0094DA CD 90 3F         [ 4] 3558 	call unget_token
      0094DD                       3559 print_exit:
      0094DD 0D 01            [ 1] 3560 	tnz (COMMA,sp)
      0094DF 26 05            [ 1] 3561 	jrne 9$
      0094E1 A6 0D            [ 1] 3562 	ld a,#CR 
      0094E3 CD 82 9E         [ 4] 3563     call putc 
      001466                       3564 9$:	_drop VSIZE 
      0094E6 5B 01            [ 2]    1     addw sp,#VSIZE 
      0094E8 81               [ 4] 3565 	ret 
                                   3566 
                                   3567 ;----------------------
                                   3568 ; 'save_context' and
                                   3569 ; 'rest_context' must be 
                                   3570 ; called at the same 
                                   3571 ; call stack depth 
                                   3572 ; i.e. SP must have the 
                                   3573 ; save value at  
                                   3574 ; entry point of both 
                                   3575 ; routine. 
                                   3576 ;---------------------
                                   3577 ;--------------------
                                   3578 ; save current BASIC
                                   3579 ; interpreter context 
                                   3580 ; on cstack 
                                   3581 ;--------------------
      0094E9                       3582 	_argofs 0 
                           000002     1     ARG_OFS=2+0 
      001469                       3583 	_arg BPTR 1
                           000003     1     BPTR=ARG_OFS+1 
      001469                       3584 	_arg LNO 3 
                           000005     1     LNO=ARG_OFS+3 
      001469                       3585 	_arg IN 5
                           000007     1     IN=ARG_OFS+5 
      001469                       3586 	_arg CNT 6
                           000008     1     CNT=ARG_OFS+6 
      001469                       3587 save_context:
      0094E9 CE 00 04         [ 2] 3588 	ldw x,basicptr 
      0094EC 1F 03            [ 2] 3589 	ldw (BPTR,sp),x
      0094EE CE 00 06         [ 2] 3590 	ldw x,lineno 
      0094F1 1F 05            [ 2] 3591 	ldw (LNO,sp),x 
      0094F3 C6 00 02         [ 1] 3592 	ld a,in 
      0094F6 6B 07            [ 1] 3593 	ld (IN,sp),a
      0094F8 C6 00 03         [ 1] 3594 	ld a,count 
      0094FB 6B 08            [ 1] 3595 	ld (CNT,sp),a  
      0094FD 81               [ 4] 3596 	ret
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 70.
Hexadecimal [24-Bits]



                                   3597 
                                   3598 ;-----------------------
                                   3599 ; restore previously saved 
                                   3600 ; BASIC interpreter context 
                                   3601 ; from cstack 
                                   3602 ;-------------------------
      0094FE                       3603 rest_context:
      0094FE 1E 03            [ 2] 3604 	ldw x,(BPTR,sp)
      009500 CF 00 04         [ 2] 3605 	ldw basicptr,x 
      009503 1E 05            [ 2] 3606 	ldw x,(LNO,sp)
      009505 CF 00 06         [ 2] 3607 	ldw lineno,x 
      009508 7B 07            [ 1] 3608 	ld a,(IN,sp)
      00950A C7 00 02         [ 1] 3609 	ld in,a
      00950D 7B 08            [ 1] 3610 	ld a,(CNT,sp)
      00950F C7 00 03         [ 1] 3611 	ld count,a  
      009512 81               [ 4] 3612 	ret
                                   3613 
                                   3614 ;------------------------------------------
                                   3615 ; BASIC: INPUT [string],var[,[string],var]
                                   3616 ; input value in variables 
                                   3617 ; [string] optionally can be used as prompt 
                                   3618 ;-----------------------------------------
                           000001  3619 	CX_BPTR=1
                           000003  3620 	CX_LNO=3
                           000004  3621 	CX_IN=4
                           000005  3622 	CX_CNT=5
                           000006  3623 	SKIP=6
                           000007  3624 	VSIZE=7
      009513                       3625 input_var:
      009513 72 00 00 25 05   [ 2] 3626 	btjt flags,#FRUN,1$ 
      009518 A6 06            [ 1] 3627 	ld a,#ERR_RUN_ONLY 
      00951A CC 87 23         [ 2] 3628 	jp tb_error 
      00149D                       3629 1$:	_vars VSIZE 
      00951D 52 07            [ 2]    1     sub sp,#VSIZE 
      00951F                       3630 input_loop:
      00951F 0F 06            [ 1] 3631 	clr (SKIP,sp)
      009521 CD 8D 1B         [ 4] 3632 	call get_token 
      009524 A1 00            [ 1] 3633 	cp a,#TK_NONE 
      009526 27 5C            [ 1] 3634 	jreq input_exit 
      009528 A1 06            [ 1] 3635 	cp a,#TK_QSTR 
      00952A 26 08            [ 1] 3636 	jrne 1$ 
      00952C CD 82 B0         [ 4] 3637 	call puts 
      00952F 03 06            [ 1] 3638 	cpl (SKIP,sp)
      009531 CD 8D 1B         [ 4] 3639 	call get_token 
      009534 A1 02            [ 1] 3640 1$: cp a,#TK_VAR  
      009536 27 03            [ 1] 3641 	jreq 2$ 
      009538 CC 87 21         [ 2] 3642 	jp syntax_error
      00953B CD 8F CE         [ 4] 3643 2$:	call dpush 
      00953E 0D 06            [ 1] 3644 	tnz (SKIP,sp)
      009540 26 0F            [ 1] 3645 	jrne 21$ 
      009542 A6 3A            [ 1] 3646 	ld a,#':
      009544 C7 17 19         [ 1] 3647 	ld pad+1,a 
      009547 72 5F 17 1A      [ 1] 3648 	clr pad+2
      00954B AE 17 18         [ 2] 3649 	ldw x,#pad 
      00954E CD 82 B0         [ 4] 3650 	call puts   
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 71.
Hexadecimal [24-Bits]



      009551                       3651 21$:
      009551 CD 94 E9         [ 4] 3652 	call save_context 
      009554 AE 16 C8         [ 2] 3653 	ldw x,#tib 
      009557 CF 00 04         [ 2] 3654 	ldw basicptr,x  
      00955A 72 5F 00 03      [ 1] 3655 	clr count  
      00955E CD 8A 91         [ 4] 3656 	call readln 
      009561 72 5F 00 02      [ 1] 3657 	clr in 
      009565 CD 93 2C         [ 4] 3658 	call relation 
      009568 A1 0A            [ 1] 3659 	cp a,#TK_INTGR
      00956A 27 03            [ 1] 3660 	jreq 3$ 
      00956C CC 87 21         [ 2] 3661 	jp syntax_error
      00956F CD 8F CE         [ 4] 3662 3$: call dpush 
      009572 CD 90 35         [ 4] 3663 	call store 
      009575 CD 94 FE         [ 4] 3664 	call rest_context
      009578 CD 8D 1B         [ 4] 3665 	call get_token 
      00957B A1 08            [ 1] 3666 	cp a,#TK_COMMA 
      00957D 26 02            [ 1] 3667 	jrne 4$
      00957F 20 9E            [ 2] 3668 	jra input_loop 
      009581 CD 90 3F         [ 4] 3669 4$:	call unget_token 
      009584                       3670 input_exit:
      001504                       3671 	_drop VSIZE 
      009584 5B 07            [ 2]    1     addw sp,#VSIZE 
      009586 81               [ 4] 3672 	ret 
                                   3673 
                                   3674 
                                   3675 ;---------------------
                                   3676 ; BASIC: REMARK | ' 
                                   3677 ; begin a comment 
                                   3678 ; comment are ignored 
                                   3679 ; use ' insted of REM 
                                   3680 ; This is never called
                                   3681 ; because get_token 
                                   3682 ; take care of skipping
                                   3683 ; comment. but required
                                   3684 ; for future use of 
                                   3685 ; keyword reverse search.  
                                   3686 ;---------------------- 
      009587                       3687 rem: 
      009587 81               [ 4] 3688 	ret 
                                   3689 
                                   3690 
                                   3691 ;---------------------
                                   3692 ; BASIC: WAIT addr,mask[,xor_mask] 
                                   3693 ; read in loop 'addr'  
                                   3694 ; apply & 'mask' to value 
                                   3695 ; loop while result==0.  
                                   3696 ; if 'xor_mask' given 
                                   3697 ; apply ^ in second  
                                   3698 ; loop while result==0 
                                   3699 ;---------------------
                           000001  3700 	XMASK=1 
                           000002  3701 	MASK=2
                           000003  3702 	ADDR=3
                           000004  3703 	VSIZE=4
      009588                       3704 wait: 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 72.
Hexadecimal [24-Bits]



      001508                       3705 	_vars VSIZE
      009588 52 04            [ 2]    1     sub sp,#VSIZE 
      00958A 0F 01            [ 1] 3706 	clr (XMASK,sp) 
      00958C CD 91 F0         [ 4] 3707 	call arg_list 
      00958F A1 02            [ 1] 3708 	cp a,#2
      009591 24 03            [ 1] 3709 	jruge 0$
      009593 CC 87 21         [ 2] 3710 	jp syntax_error 
      009596 A1 03            [ 1] 3711 0$:	cp a,#3
      009598 25 06            [ 1] 3712 	jrult 1$
      00959A CD 8F DB         [ 4] 3713 	call dpop 
      00959D 9F               [ 1] 3714 	ld a,xl
      00959E 6B 01            [ 1] 3715 	ld (XMASK,sp),a 
      0095A0 CD 8F DB         [ 4] 3716 1$: call dpop ; mask 
      0095A3 9F               [ 1] 3717 	ld a,xl 
      0095A4 6B 02            [ 1] 3718 	ld (MASK,sp),a 
      0095A6 CD 8F DB         [ 4] 3719 	call dpop ; address 
      0095A9 F6               [ 1] 3720 2$:	ld a,(x)
      0095AA 14 02            [ 1] 3721 	and a,(MASK,sp)
      0095AC 18 01            [ 1] 3722 	xor a,(XMASK,sp)
      0095AE 27 F9            [ 1] 3723 	jreq 2$ 
      001530                       3724 	_drop VSIZE 
      0095B0 5B 04            [ 2]    1     addw sp,#VSIZE 
      0095B2 81               [ 4] 3725 	ret 
                                   3726 
                                   3727 ;---------------------
                                   3728 ; BASIC: BSET addr,mask
                                   3729 ; set bits at 'addr' corresponding 
                                   3730 ; to those of 'mask' that are at 1.
                                   3731 ; arguments:
                                   3732 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3733 ;   mask        mask|addr
                                   3734 ; output:
                                   3735 ;	none 
                                   3736 ;--------------------------
      0095B3                       3737 bit_set:
      0095B3 CD 91 F0         [ 4] 3738 	call arg_list 
      0095B6 A1 02            [ 1] 3739 	cp a,#2	 
      0095B8 27 03            [ 1] 3740 	jreq 1$ 
      0095BA CC 87 21         [ 2] 3741 	jp syntax_error
      0095BD CD 8F DB         [ 4] 3742 1$: call dpop ; mask 
      0095C0 9F               [ 1] 3743 	ld a,xl 
      0095C1 CD 8F DB         [ 4] 3744 	call dpop ; addr  
      0095C4 FA               [ 1] 3745 	or a,(x)
      0095C5 F7               [ 1] 3746 	ld (x),a 
      0095C6 81               [ 4] 3747 	ret 
                                   3748 
                                   3749 ;---------------------
                                   3750 ; BASIC: BRES addr,mask
                                   3751 ; reset bits at 'addr' corresponding 
                                   3752 ; to those of 'mask' that are at 1.
                                   3753 ; arguments:
                                   3754 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3755 ;   mask	    ~mask&*addr  
                                   3756 ; output:
                                   3757 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 73.
Hexadecimal [24-Bits]



                                   3758 ;--------------------------
      0095C7                       3759 bit_reset:
      0095C7 CD 91 F0         [ 4] 3760 	call arg_list 
      0095CA A1 02            [ 1] 3761 	cp a,#2  
      0095CC 27 03            [ 1] 3762 	jreq 1$ 
      0095CE CC 87 21         [ 2] 3763 	jp syntax_error
      0095D1                       3764 1$: 
      0095D1 CD 8F DB         [ 4] 3765 	call dpop ; mask 
      0095D4 9F               [ 1] 3766 	ld a,xl 
      0095D5 43               [ 1] 3767 	cpl a 
      0095D6 CD 8F DB         [ 4] 3768 	call dpop ; addr  
      0095D9 F4               [ 1] 3769 	and a,(x)
      0095DA F7               [ 1] 3770 	ld (x),a 
      0095DB 81               [ 4] 3771 	ret 
                                   3772 
                                   3773 ;---------------------
                                   3774 ; BASIC: BRES addr,mask
                                   3775 ; toggle bits at 'addr' corresponding 
                                   3776 ; to those of 'mask' that are at 1.
                                   3777 ; arguments:
                                   3778 ; 	addr 		memory address RAM|PERIPHERAL 
                                   3779 ;   mask	    mask^*addr  
                                   3780 ; output:
                                   3781 ;	none 
                                   3782 ;--------------------------
      0095DC                       3783 bit_toggle:
      0095DC CD 91 F0         [ 4] 3784 	call arg_list 
      0095DF A1 02            [ 1] 3785 	cp a,#2 
      0095E1 27 03            [ 1] 3786 	jreq 1$ 
      0095E3 CC 87 21         [ 2] 3787 	jp syntax_error
      0095E6 CD 8F DB         [ 4] 3788 1$: call dpop ; mask 
      0095E9 9F               [ 1] 3789 	ld a,xl 
      0095EA CD 8F DB         [ 4] 3790 	call dpop ; addr  
      0095ED F8               [ 1] 3791 	xor a,(x)
      0095EE F7               [ 1] 3792 	ld (x),a 
      0095EF 81               [ 4] 3793 	ret 
                                   3794 
                                   3795 
                                   3796 ;--------------------
                                   3797 ; BASIC: POKE addr,byte
                                   3798 ; put a byte at addr 
                                   3799 ;--------------------
      0095F0                       3800 poke:
      0095F0 CD 91 F0         [ 4] 3801 	call arg_list 
      0095F3 A1 02            [ 1] 3802 	cp a,#2
      0095F5 27 03            [ 1] 3803 	jreq 1$
      0095F7 CC 87 21         [ 2] 3804 	jp syntax_error
      0095FA                       3805 1$:	
      0095FA CD 8F DB         [ 4] 3806 	call dpop 
      0095FD 9F               [ 1] 3807     ld a,xl 
      0095FE CD 8F DB         [ 4] 3808 	call dpop 
      009601 F7               [ 1] 3809 	ld (x),a 
      009602 81               [ 4] 3810 	ret 
                                   3811 
                                   3812 ;-----------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 74.
Hexadecimal [24-Bits]



                                   3813 ; BASIC: PEEK(addr)
                                   3814 ; get the byte at addr 
                                   3815 ; input:
                                   3816 ;	none 
                                   3817 ; output:
                                   3818 ;	X 		value 
                                   3819 ;-----------------------
      009603                       3820 peek:
      009603 A6 04            [ 1] 3821 	ld a,#TK_LPAREN 
      009605 CD 91 E3         [ 4] 3822 	call expect 
      009608 CD 91 F0         [ 4] 3823 	call arg_list
      00960B A1 01            [ 1] 3824 	cp a,#1 
      00960D 27 03            [ 1] 3825 	jreq 1$
      00960F CC 87 21         [ 2] 3826 	jp syntax_error
      009612 A6 05            [ 1] 3827 1$:	ld a,#TK_RPAREN 
      009614 CD 91 E3         [ 4] 3828 	call expect 
      009617 CD 8F DB         [ 4] 3829 	call dpop 
      00961A F6               [ 1] 3830 	ld a,(x)
      00961B 5F               [ 1] 3831 	clrw x 
      00961C 97               [ 1] 3832 	ld xl,a 
      00961D A6 0A            [ 1] 3833 	ld a,#TK_INTGR
      00961F 81               [ 4] 3834 	ret 
                                   3835 
      009620                       3836 if: 
      009620 CD 93 2C         [ 4] 3837 	call relation 
      009623 A1 0A            [ 1] 3838 	cp a,#TK_INTGR
      009625 27 03            [ 1] 3839 	jreq 1$ 
      009627 CC 87 21         [ 2] 3840 	jp syntax_error
      00962A 4F               [ 1] 3841 1$:	clr a 
      00962B 5D               [ 2] 3842 	tnzw x 
      00962C 26 05            [ 1] 3843 	jrne 9$  
                                   3844 ;skip to next line
      00962E 55 00 03 00 02   [ 1] 3845 	mov in,count
      009633 81               [ 4] 3846 9$:	ret 
                                   3847 
                                   3848 ;------------------------
                                   3849 ; BASIC: FOR var=expr 
                                   3850 ; set variable to expression 
                                   3851 ; leave variable address 
                                   3852 ; on dstack and set
                                   3853 ; FFOR bit in 'flags'
                                   3854 ;-----------------
                           000001  3855 	RETL1=1
                           000003  3856 	INW=3
                           000005  3857 	BPTR=5
      009634                       3858 for: ; { -- var_addr }
      009634 A6 02            [ 1] 3859 	ld a,#TK_VAR 
      009636 CD 91 E3         [ 4] 3860 	call expect
      009639 CD 8F CE         [ 4] 3861 	call dpush 
      00963C CD 93 AF         [ 4] 3862 	call let02 
      00963F 72 14 00 25      [ 1] 3863 	bset flags,#FFOR 
                                   3864 ; open space on cstack for BPTR and INW 
      009643 85               [ 2] 3865 	popw x ; call return address 
      0015C4                       3866 	_vars 4
      009644 52 04            [ 2]    1     sub sp,#4 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 75.
Hexadecimal [24-Bits]



      009646 89               [ 2] 3867 	pushw x  ; RETL1 
      009647 5F               [ 1] 3868 	clrw x 
      009648 1F 05            [ 2] 3869 	ldw (BPTR,sp),x 
      00964A 1F 03            [ 2] 3870 	ldw (INW,sp),x 
      00964C CD 8D 1B         [ 4] 3871 	call get_token 
      00964F A1 07            [ 1] 3872 	cp a,#TK_CMD 
      009651 27 03            [ 1] 3873 	jreq 1$
      009653 CC 87 21         [ 2] 3874 	jp syntax_error
      009656                       3875 1$:  
      009656 A3 96 5E         [ 2] 3876 	cpw x,#to 
      009659 27 03            [ 1] 3877 	jreq to
      00965B CC 87 21         [ 2] 3878 	jp syntax_error 
                                   3879 
                                   3880 ;-----------------------------------
                                   3881 ; BASIC: TO expr 
                                   3882 ; second part of FOR loop initilization
                                   3883 ; leave limit on dstack and set 
                                   3884 ; FTO bit in 'flags'
                                   3885 ;-----------------------------------
      00965E                       3886 to: ; { var_addr -- var_addr limit step }
      00965E 72 04 00 25 03   [ 2] 3887 	btjt flags,#FFOR,1$
      009663 CC 87 21         [ 2] 3888 	jp syntax_error
      009666 CD 93 2C         [ 4] 3889 1$: call relation  
      009669 A1 0A            [ 1] 3890 	cp a,#TK_INTGR 
      00966B 27 03            [ 1] 3891 	jreq 2$ 
      00966D CC 87 21         [ 2] 3892 	jp syntax_error
      009670 CD 8F CE         [ 4] 3893 2$: call dpush ; limit
      009673 CE 00 01         [ 2] 3894 	ldw x,in.w 
      009676 CD 8D 1B         [ 4] 3895 	call get_token
      009679 A1 00            [ 1] 3896 	cp a,#TK_NONE  
      00967B 27 0C            [ 1] 3897 	jreq 4$ 
      00967D A1 07            [ 1] 3898 	cp a,#TK_CMD
      00967F 26 05            [ 1] 3899 	jrne 3$
      009681 A3 96 8E         [ 2] 3900 	cpw x,#step 
      009684 27 08            [ 1] 3901 	jreq step
      009686                       3902 3$:	
      009686 CD 90 3F         [ 4] 3903 	call unget_token   	 
      009689                       3904 4$:	
      009689 AE 00 01         [ 2] 3905 	ldw x,#1   ; default step  
      00968C 20 12            [ 2] 3906 	jra store_loop_addr 
                                   3907 
                                   3908 
                                   3909 ;----------------------------------
                                   3910 ; BASIC: STEP expr 
                                   3911 ; optional third par of FOR loop
                                   3912 ; initialization. 	
                                   3913 ;------------------------------------
      00968E                       3914 step: ; {var limit -- var limit step}
      00968E 72 04 00 25 03   [ 2] 3915 	btjt flags,#FFOR,1$
      009693 CC 87 21         [ 2] 3916 	jp syntax_error
      009696 CD 93 2C         [ 4] 3917 1$: call relation
      009699 A1 0A            [ 1] 3918 	cp a,#TK_INTGR
      00969B 27 03            [ 1] 3919 	jreq store_loop_addr  
      00969D CC 87 21         [ 2] 3920 	jp syntax_error
                                   3921 ; leave loop back entry point on cstack 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 76.
Hexadecimal [24-Bits]



                                   3922 ; cstack is 2 call deep from interp_loop
      0096A0                       3923 store_loop_addr:
      0096A0 CD 8F CE         [ 4] 3924 	call dpush 
      0096A3 CE 00 04         [ 2] 3925 	ldw x,basicptr  
      0096A6 1F 05            [ 2] 3926 	ldw (BPTR,sp),x 
      0096A8 CE 00 01         [ 2] 3927 	ldw x,in.w 
      0096AB 1F 03            [ 2] 3928 	ldw (INW,sp),x   
      0096AD 72 15 00 25      [ 1] 3929 	bres flags,#FFOR 
      0096B1 72 5C 00 20      [ 1] 3930 	inc loop_depth 
      0096B5 81               [ 4] 3931 	ret 
                                   3932 
                                   3933 ;--------------------------------
                                   3934 ; BASIC: NEXT var 
                                   3935 ; FOR loop control 
                                   3936 ; increment variable with step 
                                   3937 ; and compare with limit 
                                   3938 ; loop if threshold not crossed.
                                   3939 ; else clean both stacks. 
                                   3940 ; and decrement 'loop_depth' 
                                   3941 ;--------------------------------
      0096B6                       3942 next: ; {var limit step -- [var limit step ] }
      0096B6 72 5D 00 20      [ 1] 3943 	tnz loop_depth 
      0096BA 26 03            [ 1] 3944 	jrne 1$ 
      0096BC CC 87 21         [ 2] 3945 	jp syntax_error 
      0096BF                       3946 1$: 
      0096BF A6 02            [ 1] 3947 	ld a,#TK_VAR 
      0096C1 CD 91 E3         [ 4] 3948 	call expect
                                   3949 ; check for good variable after NEXT 	 
      0096C4 90 93            [ 1] 3950 	ldw y,x 
      0096C6 AE 00 04         [ 2] 3951 	ldw x,#4  
      0096C9 72 D3 00 1A      [ 4] 3952 	cpw y,([dstkptr],x) ; compare variables address 
      0096CD 27 03            [ 1] 3953 	jreq 2$  
      0096CF CC 87 21         [ 2] 3954 	jp syntax_error ; not the good one 
      0096D2                       3955 2$: ; increment variable 
      0096D2 93               [ 1] 3956 	ldw x,y
      0096D3 FE               [ 2] 3957 	ldw x,(x)  ; get var value 
      0096D4 CF 00 0A         [ 2] 3958 	ldw acc16,x 
      0096D7 72 CE 00 1A      [ 5] 3959 	ldw x,[dstkptr] ; step
      0096DB 72 BB 00 0A      [ 2] 3960 	addw x,acc16 ; var+step 
      0096DF 90 FF            [ 2] 3961 	ldw (y),x ; save var new value 
                                   3962 ; compare with limit 
      0096E1 90 93            [ 1] 3963 	ldw y,x 
      0096E3 72 CE 00 1A      [ 5] 3964 	ldw x,[dstkptr] ; step in x 
      0096E7 5D               [ 2] 3965 	tnzw x  
      0096E8 2A 0B            [ 1] 3966 	jrpl 4$ ; positive step 
                                   3967 ;negative step 
      0096EA AE 00 02         [ 2] 3968 	ldw x,#2
      0096ED 72 D3 00 1A      [ 4] 3969 	cpw y,([dstkptr],x)
      0096F1 2F 26            [ 1] 3970 	jrslt loop_done
      0096F3 20 09            [ 2] 3971 	jra loop_back 
      0096F5                       3972 4$: ; positive step
      0096F5 AE 00 02         [ 2] 3973 	ldw x,#2 
      0096F8 72 D3 00 1A      [ 4] 3974 	cpw y,([dstkptr],x)
      0096FC 2C 1B            [ 1] 3975 	jrsgt loop_done
      0096FE                       3976 loop_back:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 77.
Hexadecimal [24-Bits]



      0096FE 1E 05            [ 2] 3977 	ldw x,(BPTR,sp)
      009700 CF 00 04         [ 2] 3978 	ldw basicptr,x 
      009703 72 01 00 25 0B   [ 2] 3979 	btjf flags,#FRUN,1$ 
      009708 E6 02            [ 1] 3980 	ld a,(2,x)
      00970A AB 02            [ 1] 3981 	add a,#2 
      00970C C7 00 03         [ 1] 3982 	ld count,a
      00970F FE               [ 2] 3983 	ldw x,(x)
      009710 CF 00 06         [ 2] 3984 	ldw lineno,x
      009713 1E 03            [ 2] 3985 1$:	ldw x,(INW,sp)
      009715 CF 00 01         [ 2] 3986 	ldw in.w,x 
      009718 81               [ 4] 3987 	ret 
      009719                       3988 loop_done:
                                   3989 	; remove var limit step on dstack 
      009719 CE 00 1A         [ 2] 3990 	ldw x,dstkptr 
      00971C 1C 00 06         [ 2] 3991 	addw x,#3*CELL_SIZE
      00971F CF 00 1A         [ 2] 3992 	ldw dstkptr,x 
                                   3993 	; remove 2 return address on cstack 
      009722 85               [ 2] 3994 	popw x
      0016A3                       3995 	_drop 4
      009723 5B 04            [ 2]    1     addw sp,#4 
      009725 89               [ 2] 3996 	pushw x 
      009726 72 5A 00 20      [ 1] 3997 	dec loop_depth 
      00972A 81               [ 4] 3998 	ret 
                                   3999 
                                   4000 
                                   4001 ;------------------------
                                   4002 ; BASIC: GOTO lineno 
                                   4003 ; jump to lineno 
                                   4004 ; here cstack is 2 call deep from interp_loop 
                                   4005 ;------------------------
      00972B                       4006 goto:
      00972B 72 00 00 25 06   [ 2] 4007 	btjt flags,#FRUN,0$ 
      009730 A6 06            [ 1] 4008 	ld a,#ERR_RUN_ONLY
      009732 CC 87 23         [ 2] 4009 	jp tb_error 
      009735 81               [ 4] 4010 	ret 
      009736 20 23            [ 2] 4011 0$:	jra go_common
                                   4012 
                                   4013 ;--------------------
                                   4014 ; BASIC: GOSUB lineno
                                   4015 ; basic subroutine call
                                   4016 ; actual lineno and basicptr 
                                   4017 ; are saved on cstack
                                   4018 ; here cstack is 2 call deep from interp_loop 
                                   4019 ;--------------------
                           000003  4020 	GOS_RET=3
      009738                       4021 gosub:
      009738 72 00 00 25 06   [ 2] 4022 	btjt flags,#FRUN,0$ 
      00973D A6 06            [ 1] 4023 	ld a,#ERR_RUN_ONLY
      00973F CC 87 23         [ 2] 4024 	jp tb_error 
      009742 81               [ 4] 4025 	ret 
      009743 85               [ 2] 4026 0$:	popw x 
      009744 52 02            [ 2] 4027 	sub sp,#2 
      009746 89               [ 2] 4028 	pushw x 
      009747 CE 00 04         [ 2] 4029 	ldw x,basicptr
      00974A E6 02            [ 1] 4030 	ld a,(2,x)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 78.
Hexadecimal [24-Bits]



      00974C AB 03            [ 1] 4031 	add a,#3 
      00974E C7 00 0B         [ 1] 4032 	ld acc8,a 
      009751 72 5F 00 0A      [ 1] 4033 	clr acc16 
      009755 72 BB 00 0A      [ 2] 4034 	addw x,acc16
      009759 1F 03            [ 2] 4035 	ldw (GOS_RET,sp),x 
      00975B                       4036 go_common: 
      00975B CD 93 2C         [ 4] 4037 	call relation 
      00975E A1 0A            [ 1] 4038 	cp a,#TK_INTGR
      009760 27 03            [ 1] 4039 	jreq 1$ 
      009762 CC 87 21         [ 2] 4040 	jp syntax_error
      009765                       4041 1$: 
      009765 CD 83 E1         [ 4] 4042 	call search_lineno  
      009768 5D               [ 2] 4043 	tnzw x 
      009769 26 05            [ 1] 4044 	jrne 2$ 
      00976B A6 05            [ 1] 4045 	ld a,#ERR_NO_LINE 
      00976D CC 87 23         [ 2] 4046 	jp tb_error 
      009770                       4047 2$: 
      009770 CF 00 04         [ 2] 4048 	ldw basicptr,x 
      009773 E6 02            [ 1] 4049 	ld a,(2,x)
      009775 AB 03            [ 1] 4050 	add a,#3 
      009777 C7 00 03         [ 1] 4051 	ld count,a 
      00977A FE               [ 2] 4052 	ldw x,(x)
      00977B CF 00 06         [ 2] 4053 	ldw lineno,x 
      00977E 35 03 00 02      [ 1] 4054 	mov in,#3 
      009782 81               [ 4] 4055 	ret 
                                   4056 
                                   4057 ;------------------------
                                   4058 ; BASIC: RETURN 
                                   4059 ; exit from a subroutine 
                                   4060 ; cstack is 2 level deep from interp_loop 
                                   4061 ;------------------------
      009783                       4062 return:
      009783 72 00 00 25 05   [ 2] 4063 	btjt flags,#FRUN,0$ 
      009788 A6 06            [ 1] 4064 	ld a,#ERR_RUN_ONLY
      00978A CC 87 23         [ 2] 4065 	jp tb_error 
      00978D                       4066 0$:	
      00978D 1E 03            [ 2] 4067 	ldw x,(GOS_RET,sp) 
      00978F CF 00 04         [ 2] 4068 	ldw basicptr,x 
      009792 E6 02            [ 1] 4069 	ld a,(2,x)
      009794 AB 03            [ 1] 4070 	add a,#3 
      009796 C7 00 03         [ 1] 4071 	ld count,a 
      009799 35 03 00 02      [ 1] 4072 	mov in,#3
      00979D FE               [ 2] 4073 	ldw x,(x)
      00979E CF 00 06         [ 2] 4074 	ldw lineno,x 
      0097A1 4F               [ 1] 4075 	clr a 
      0097A2 85               [ 2] 4076 	popw x 
      001723                       4077 	_drop 2
      0097A3 5B 02            [ 2]    1     addw sp,#2 
      0097A5 89               [ 2] 4078 	pushw x
      0097A6 81               [ 4] 4079 	ret  
                                   4080 
                                   4081 
                                   4082 ;----------------------------------
                                   4083 ; BASIC: RUN
                                   4084 ; run BASIC program in RAM
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 79.
Hexadecimal [24-Bits]



                                   4085 ;----------------------------------- 
      0097A7                       4086 run: 
      0097A7 72 01 00 25 02   [ 2] 4087 	btjf flags,#FRUN,0$  
      0097AC 4F               [ 1] 4088 	clr a 
      0097AD 81               [ 4] 4089 	ret
      0097AE                       4090 0$: 
      0097AE CE 00 1C         [ 2] 4091 	ldw x,txtbgn
      0097B1 C3 00 1E         [ 2] 4092 	cpw x,txtend 
      0097B4 2B 02            [ 1] 4093 	jrmi 1$ 
      0097B6 4F               [ 1] 4094 	clr a 
      0097B7 81               [ 4] 4095 	ret 
      0097B8 CD 93 97         [ 4] 4096 1$: call ubound 
      00173B                       4097 	_drop 2 
      0097BB 5B 02            [ 2]    1     addw sp,#2 
      0097BD CE 00 1C         [ 2] 4098 	ldw x,txtbgn 
      0097C0 CF 00 04         [ 2] 4099 	ldw basicptr,x 
      0097C3 E6 02            [ 1] 4100 	ld a,(2,x)
      0097C5 AB 02            [ 1] 4101 	add a,#2 ; consider that in start at 3  
      0097C7 C7 00 03         [ 1] 4102 	ld count,a
      0097CA FE               [ 2] 4103 	ldw x,(x)
      0097CB CF 00 06         [ 2] 4104 	ldw lineno,x
      0097CE 35 03 00 02      [ 1] 4105 	mov in,#3	
      0097D2 72 10 00 25      [ 1] 4106 	bset flags,#FRUN 
      0097D6 CC 87 E7         [ 2] 4107 	jp interp_loop 
                                   4108 
                                   4109 
                                   4110 ;----------------------
                                   4111 ; BASIC: STOP 
                                   4112 ; stop running program
                                   4113 ;---------------------- 
      0097D9                       4114 stop: 
      0097D9 72 00 00 25 02   [ 2] 4115 	btjt flags,#FRUN,0$  
      0097DE 4F               [ 1] 4116 	clr a 
      0097DF 81               [ 4] 4117 	ret 
                                   4118 ; clean dstack and cstack 
      0097E0 AE 17 FF         [ 2] 4119 0$: ldw x,#STACK_EMPTY 
      0097E3 94               [ 1] 4120 	ldw sp,x 
      0097E4 72 11 00 25      [ 1] 4121 	bres flags,#FRUN 
      0097E8 CC 87 81         [ 2] 4122 	jp warm_start
                                   4123 
                                   4124 ;-----------------------
                                   4125 ; BASIC: NEW
                                   4126 ; from command line only 
                                   4127 ; free program memory
                                   4128 ; and clear variables 
                                   4129 ;------------------------
      0097EB                       4130 new: 
      0097EB 72 01 00 25 02   [ 2] 4131 	btjf flags,#FRUN,0$ 
      0097F0 4F               [ 1] 4132 	clr a 
      0097F1 81               [ 4] 4133 	ret 
      0097F2                       4134 0$:	
      0097F2 CD 85 FF         [ 4] 4135 	call clear_basic 
      0097F5 81               [ 4] 4136 	ret 
                                   4137 	 
                                   4138 ;--------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 80.
Hexadecimal [24-Bits]



                                   4139 ; input:
                                   4140 ;   X     increment 
                                   4141 ; output:
                                   4142 ;   farptr  incremented 
                                   4143 ;---------------------
      0097F6                       4144 incr_farptr:
      0097F6 72 BB 00 15      [ 2] 4145 	addw x,farptr+1 
      0097FA 24 04            [ 1] 4146 	jrnc 1$
      0097FC 72 5C 00 14      [ 1] 4147 	inc farptr 
      009800 CF 00 15         [ 2] 4148 1$:	ldw farptr+1,x  
      009803 81               [ 4] 4149 	ret 
                                   4150 
                                   4151 ;------------------------------
                                   4152 ; extended flash memory used as FLASH_DRIVE 
                                   4153 ; seek end of used flash drive   
                                   4154 ; starting at 0x10000 address.
                                   4155 ; 4 consecutives 0 bytes signal free space. 
                                   4156 ; input:
                                   4157 ;	none
                                   4158 ; output:
                                   4159 ;   ffree     free_addr| 0 if memory full.
                                   4160 ;------------------------------
      009804                       4161 seek_fdrive:
      009804 A6 01            [ 1] 4162 	ld a,#1
      009806 C7 00 14         [ 1] 4163 	ld farptr,a 
      009809 5F               [ 1] 4164 	clrw x 
      00980A CF 00 15         [ 2] 4165 	ldw farptr+1,x 
      00980D                       4166 1$:
      00980D 5F               [ 1] 4167 	clrw x 
      00980E 92 AF 00 14      [ 5] 4168 	ldf a,([farptr],x) 
      009812 26 15            [ 1] 4169 	jrne 2$
      009814 5C               [ 1] 4170 	incw x 
      009815 92 AF 00 14      [ 5] 4171 	ldf a,([farptr],x)
      009819 26 0E            [ 1] 4172 	jrne 2$ 
      00981B 5C               [ 1] 4173 	incw x 
      00981C 92 AF 00 14      [ 5] 4174 	ldf a,([farptr],x)
      009820 26 07            [ 1] 4175 	jrne 2$ 
      009822 5C               [ 1] 4176 	incw x 
      009823 92 AF 00 14      [ 5] 4177 	ldf a,([farptr],x)
      009827 27 28            [ 1] 4178 	jreq 4$ 
      009829                       4179 2$: 
      009829 1C 00 01         [ 2] 4180 	addw x,#1
      00982C CD 97 F6         [ 4] 4181 	call incr_farptr
      00982F AE 02 7F         [ 2] 4182 	ldw x,#0x27f 
      009832 C3 00 14         [ 2] 4183 	cpw x,farptr
      009835 2A D6            [ 1] 4184 	jrpl 1$
      009837 72 5F 00 17      [ 1] 4185 	clr ffree 
      00983B 72 5F 00 18      [ 1] 4186 	clr ffree+1 
      00983F 72 5F 00 19      [ 1] 4187 	clr ffree+2 
      009843 72 5F 00 09      [ 1] 4188 	clr acc24 
      009847 72 5F 00 0A      [ 1] 4189 	clr acc16
      00984B 72 5F 00 0B      [ 1] 4190 	clr acc8 
      00984F 20 38            [ 2] 4191 	jra 5$
      009851                       4192 4$: ; copy farptr to ffree	 
      009851 CE 00 15         [ 2] 4193 	ldw x,farptr+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 81.
Hexadecimal [24-Bits]



      009854 A3 00 00         [ 2] 4194 	cpw x,#fdrive 
      009857 27 06            [ 1] 4195 	jreq 41$
                                   4196 	; there is a file, last 0 of that file must be skipped.
      009859 AE 00 01         [ 2] 4197 	ldw x,#1
      00985C CD 97 F6         [ 4] 4198 	call incr_farptr
      00985F                       4199 41$: 
      00985F CE 00 14         [ 2] 4200 	ldw x,farptr 
      009862 C6 00 16         [ 1] 4201 	ld a,farptr+2 
      009865 CF 00 17         [ 2] 4202 	ldw ffree,x 
      009868 C7 00 19         [ 1] 4203 	ld ffree+2,a  
      00986B CF 00 09         [ 2] 4204 	ldw acc24,x 
      00986E C7 00 0B         [ 1] 4205 	ld acc8,a 
      009871 A6 FF            [ 1] 4206 	ld a,#0xff 
      009873 C0 00 0B         [ 1] 4207 	sub a,acc8 
      009876 C7 00 0B         [ 1] 4208 	ld acc8,a 
      009879 A6 7F            [ 1] 4209 	ld a,#0x7f 
      00987B C2 00 0A         [ 1] 4210 	sbc a,acc16 
      00987E C7 00 0A         [ 1] 4211 	ld acc16,a 
      009881 A6 02            [ 1] 4212 	ld a,#0x2 
      009883 C2 00 09         [ 1] 4213 	sbc a,acc24 
      009886 C7 00 09         [ 1] 4214 	ld acc24,a 
      009889 AE 98 9B         [ 2] 4215 5$:	ldw x,#ffree_msg 
      00988C CD 82 B0         [ 4] 4216 	call puts 
      00988F 5F               [ 1] 4217 	clrw x 
      009890 A6 0A            [ 1] 4218 	ld a,#10
      009892 CD 89 4E         [ 4] 4219 	call prti24 
      009895 A6 0D            [ 1] 4220 	ld a,#CR 
      009897 CD 82 9E         [ 4] 4221 	call putc 
      00989A 81               [ 4] 4222 	ret 
      00989B 0A 66 6C 61 73 68 20  4223 ffree_msg: .asciz "\nflash drive bytes free: "
             64 72 69 76 65 20 62
             79 74 65 73 20 66 72
             65 65 3A 20 00
                                   4224 
                                   4225 ;-----------------------
                                   4226 ; compare file name 
                                   4227 ; with name pointed by Y  
                                   4228 ; input:
                                   4229 ;   farptr   file name 
                                   4230 ;   Y        target name 
                                   4231 ; output:
                                   4232 ;   farptr 	 at file_name
                                   4233 ;   X 		 farptr[x] point at size field  
                                   4234 ;   Carry    0|1 no match|match  
                                   4235 ;----------------------
      0098B5                       4236 cmp_name:
      0098B5 5F               [ 1] 4237 	clrw x
      0098B6 92 AF 00 14      [ 5] 4238 1$:	ldf a,([farptr],x)
      0098BA 90 F1            [ 1] 4239 	cp a,(y)
      0098BC 26 08            [ 1] 4240 	jrne 4$
      0098BE 4D               [ 1] 4241 	tnz a 
      0098BF 27 12            [ 1] 4242 	jreq 9$ 
      0098C1 5C               [ 1] 4243     incw x 
      0098C2 90 5C            [ 1] 4244 	incw y 
      0098C4 20 F0            [ 2] 4245 	jra 1$
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 82.
Hexadecimal [24-Bits]



      0098C6                       4246 4$: ;no match 
      0098C6 4D               [ 1] 4247 	tnz a 
      0098C7 27 07            [ 1] 4248 	jreq 5$
      0098C9 5C               [ 1] 4249 	incw x 
      0098CA 92 AF 00 14      [ 5] 4250 	ldf a,([farptr],x)
      0098CE 20 F6            [ 2] 4251 	jra 4$  
      0098D0 5C               [ 1] 4252 5$:	incw x ; farptr[x] point at 'size' field 
      0098D1 98               [ 1] 4253 	rcf 
      0098D2 81               [ 4] 4254 	ret
      0098D3                       4255 9$: ; match  
      0098D3 5C               [ 1] 4256 	incw x  ; farptr[x] at 'size' field 
      0098D4 99               [ 1] 4257 	scf 
      0098D5 81               [ 4] 4258 	ret 
                                   4259 
                                   4260 ;-----------------------
                                   4261 ; search file in 
                                   4262 ; flash memory 
                                   4263 ; input:
                                   4264 ;   Y       file name  
                                   4265 ; output:
                                   4266 ;   farptr  addr at name|0
                                   4267 ;-----------------------
                           000001  4268 	FSIZE=1
                           000003  4269 	YSAVE=3
                           000004  4270 	VSIZE=4 
      0098D6                       4271 search_file: 
      001856                       4272 	_vars VSIZE
      0098D6 52 04            [ 2]    1     sub sp,#VSIZE 
      0098D8 17 03            [ 2] 4273 	ldw (YSAVE,sp),y  
      0098DA 5F               [ 1] 4274 	clrw x 
      0098DB CF 00 15         [ 2] 4275 	ldw farptr+1,x 
      0098DE 35 01 00 14      [ 1] 4276 	mov farptr,#1
      0098E2                       4277 1$:	
                                   4278 ; check if farptr is after any file 
                                   4279 ; if  0 then so.
      0098E2 92 BC 00 14      [ 5] 4280 	ldf a,[farptr]
      0098E6 27 24            [ 1] 4281 	jreq 6$
      0098E8 5F               [ 1] 4282 2$: clrw x 	
      0098E9 16 03            [ 2] 4283 	ldw y,(YSAVE,sp) 
      0098EB CD 98 B5         [ 4] 4284 	call cmp_name
      0098EE 25 2C            [ 1] 4285 	jrc 9$
      0098F0 92 AF 00 14      [ 5] 4286 	ldf a,([farptr],x)
      0098F4 6B 01            [ 1] 4287 	ld (FSIZE,sp),a 
      0098F6 5C               [ 1] 4288 	incw x 
      0098F7 92 AF 00 14      [ 5] 4289 	ldf a,([farptr],x)
      0098FB 6B 02            [ 1] 4290 	ld (FSIZE+1,sp),a 
      0098FD 5C               [ 1] 4291 	incw x 
      0098FE 72 FB 01         [ 2] 4292 	addw x,(FSIZE,sp) ; count to skip 
      009901 CD 97 F6         [ 4] 4293 	call incr_farptr ; now at next file 'name_field'
      009904 AE 02 80         [ 2] 4294 	ldw x,#0x280
      009907 C3 00 14         [ 2] 4295 	cpw x,farptr 
      00990A 2A D6            [ 1] 4296 	jrpl 1$
      00990C                       4297 6$: ; file not found 
      00990C 72 5F 00 14      [ 1] 4298 	clr farptr
      009910 72 5F 00 15      [ 1] 4299 	clr farptr+1 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 83.
Hexadecimal [24-Bits]



      009914 72 5F 00 16      [ 1] 4300 	clr farptr+2 
      001898                       4301 	_drop VSIZE 
      009918 5B 04            [ 2]    1     addw sp,#VSIZE 
      00991A 98               [ 1] 4302 	rcf
      00991B 81               [ 4] 4303 	ret
      00991C                       4304 9$: ; file found  farptr[0] at 'name_field',farptr[x] at 'file_size' 
      00189C                       4305 	_drop VSIZE 
      00991C 5B 04            [ 2]    1     addw sp,#VSIZE 
      00991E 99               [ 1] 4306 	scf 	
      00991F 81               [ 4] 4307 	ret
                                   4308 
                                   4309 ;--------------------------------
                                   4310 ; BASIC: SAVE "name" 
                                   4311 ; save text program in 
                                   4312 ; flash memory used as 
                                   4313 ;--------------------------------
      009920                       4314 save:
      009920 72 01 00 25 05   [ 2] 4315 	btjf flags,#FRUN,0$ 
      009925 A6 07            [ 1] 4316 	ld a,#ERR_CMD_ONLY 
      009927 CC 87 23         [ 2] 4317 	jp tb_error
      00992A                       4318 0$:	 
      00992A CE 00 1E         [ 2] 4319 	ldw x,txtend 
      00992D 72 B0 00 1C      [ 2] 4320 	subw x,txtbgn
      009931 26 02            [ 1] 4321 	jrne 10$
                                   4322 ; nothing to save 
      009933 4F               [ 1] 4323 	clr a 
      009934 81               [ 4] 4324 	ret 
      009935                       4325 10$:	
      009935 C6 00 17         [ 1] 4326 	ld a,ffree 
      009938 CA 00 18         [ 1] 4327 	or a,ffree+1
      00993B CA 00 19         [ 1] 4328 	or a,ffree+2 
      00993E 26 05            [ 1] 4329 	jrne 1$
      009940 A6 01            [ 1] 4330 	ld a,#ERR_MEM_FULL
      009942 CC 87 23         [ 2] 4331 	jp tb_error 
      009945 CD 8D 1B         [ 4] 4332 1$: call get_token	
      009948 A1 06            [ 1] 4333 	cp a,#TK_QSTR
      00994A 27 03            [ 1] 4334 	jreq 2$
      00994C CC 87 21         [ 2] 4335 	jp syntax_error
      00994F                       4336 2$: ; check for existing file of that name 
      00994F 90 93            [ 1] 4337 	ldw y,x ; file name pointer 
      009951 CD 98 D6         [ 4] 4338 	call search_file 
      009954 24 05            [ 1] 4339 	jrnc 3$ 
      009956 A6 08            [ 1] 4340 	ld a,#ERR_DUPLICATE 
      009958 CC 87 23         [ 2] 4341 	jp tb_error 
      00995B                       4342 3$:	;** write file name to flash **
      00995B CE 00 17         [ 2] 4343 	ldw x,ffree 
      00995E C6 00 19         [ 1] 4344 	ld a,ffree+2 
      009961 CF 00 14         [ 2] 4345 	ldw farptr,x 
      009964 C7 00 16         [ 1] 4346 	ld farptr+2,a 
      009967 AE 17 18         [ 2] 4347 	ldw x,#pad  
      00996A CD 83 72         [ 4] 4348 	call strlen 
      00996D 5C               [ 1] 4349 	incw  x
      00996E 89               [ 2] 4350 	pushw x 
      00996F 5F               [ 1] 4351 	clrw x   
      009970 90 AE 17 18      [ 2] 4352 	ldw y,#pad 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 84.
Hexadecimal [24-Bits]



      009974 CD 82 51         [ 4] 4353 	call write_block  
      0018F7                       4354 	_drop 2 ; drop pushed X 
      009977 5B 02            [ 2]    1     addw sp,#2 
                                   4355 ;** write file length after name **
      009979 CE 00 1E         [ 2] 4356 	ldw x,txtend 
      00997C 72 B0 00 1C      [ 2] 4357 	subw x,txtbgn
      009980 89               [ 2] 4358 	pushw x ; file size 
      009981 5F               [ 1] 4359 	clrw x 
      009982 7B 01            [ 1] 4360 	ld a,(1,sp)
      009984 CD 81 DC         [ 4] 4361 	call write_byte 
      009987 5C               [ 1] 4362 	incw x 
      009988 7B 02            [ 1] 4363 	ld a,(2,sp)
      00998A CD 81 DC         [ 4] 4364 	call write_byte
      00998D 5C               [ 1] 4365 	incw x  
      00998E CD 97 F6         [ 4] 4366 	call incr_farptr ; move farptr after SIZE field 
                                   4367 ;** write BASIC text **
                                   4368 ; copy BSIZE, cstack:{... bsize -- ... bsize bsize }	
      009991 1E 01            [ 2] 4369 	ldw x,(1,sp)
      009993 89               [ 2] 4370 	pushw x 
      009994 5F               [ 1] 4371 	clrw x 
      009995 90 CE 00 1C      [ 2] 4372 	ldw y,txtbgn  ; BASIC text to save 
      009999 CD 82 51         [ 4] 4373 	call write_block 
      00191C                       4374 	_drop 2 ;  drop BSIZE argument
      00999C 5B 02            [ 2]    1     addw sp,#2 
                                   4375 ; save farptr in ffree
      00999E CE 00 14         [ 2] 4376 	ldw x,farptr 
      0099A1 C6 00 16         [ 1] 4377 	ld a,farptr+2 
      0099A4 CF 00 17         [ 2] 4378 	ldw ffree,x 
      0099A7 C7 00 19         [ 1] 4379 	ld ffree+2,a
                                   4380 ; write 4 zero bytes as a safe gard 
      0099AA 5F               [ 1] 4381     clrw x 
      0099AB 4F               [ 1] 4382 	clr a 
      0099AC CD 81 DC         [ 4] 4383 	call write_byte 
      0099AF 5C               [ 1] 4384 	incw x 
      0099B0 4F               [ 1] 4385 	clr a 
      0099B1 CD 81 DC         [ 4] 4386 	call write_byte
      0099B4 5C               [ 1] 4387 	incw x 
      0099B5 4F               [ 1] 4388 	clr a 
      0099B6 CD 81 DC         [ 4] 4389 	call write_byte
                                   4390 ; display saved size  
      0099B9 85               [ 2] 4391 	popw x ; first copy of BSIZE 
      0099BA A6 0A            [ 1] 4392 	ld a,#TK_INTGR 
      0099BC 81               [ 4] 4393 	ret 
                                   4394 
                                   4395 
                                   4396 ;------------------------
                                   4397 ; BASIC: LOAD "file" 
                                   4398 ; load file to RAM 
                                   4399 ; for execution 
                                   4400 ;------------------------
      0099BD                       4401 load:
      0099BD 72 01 00 25 07   [ 2] 4402 	btjf flags,#FRUN,0$ 
      0099C2 27 05            [ 1] 4403 	jreq 0$ 
      0099C4 A6 07            [ 1] 4404 	ld a,#ERR_CMD_ONLY 
      0099C6 CC 87 23         [ 2] 4405 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 85.
Hexadecimal [24-Bits]



      0099C9                       4406 0$:	
      0099C9 CD 8D 1B         [ 4] 4407 	call get_token 
      0099CC A1 06            [ 1] 4408 	cp a,#TK_QSTR
      0099CE 27 03            [ 1] 4409 	jreq 1$
      0099D0 CC 87 21         [ 2] 4410 	jp syntax_error 
      0099D3                       4411 1$:	
      0099D3 90 93            [ 1] 4412 	ldw y,x 
      0099D5 CD 98 D6         [ 4] 4413 	call search_file 
      0099D8 25 05            [ 1] 4414 	jrc 2$ 
      0099DA A6 09            [ 1] 4415 	ld a,#ERR_NOT_FILE
      0099DC CC 87 23         [ 2] 4416 	jp tb_error  
      0099DF                       4417 2$:	
      0099DF CD 97 F6         [ 4] 4418 	call incr_farptr  
      0099E2 CD 85 FF         [ 4] 4419 	call clear_basic  
      0099E5 5F               [ 1] 4420 	clrw x
      0099E6 92 AF 00 14      [ 5] 4421 	ldf a,([farptr],x)
      0099EA 90 95            [ 1] 4422 	ld yh,a 
      0099EC 5C               [ 1] 4423 	incw x  
      0099ED 92 AF 00 14      [ 5] 4424 	ldf a,([farptr],x)
      0099F1 5C               [ 1] 4425 	incw x 
      0099F2 90 97            [ 1] 4426 	ld yl,a 
      0099F4 72 B9 00 1C      [ 2] 4427 	addw y,txtbgn
      0099F8 90 CF 00 1E      [ 2] 4428 	ldw txtend,y
      0099FC 90 CE 00 1C      [ 2] 4429 	ldw y,txtbgn
      009A00                       4430 3$:	; load BASIC text 	
      009A00 92 AF 00 14      [ 5] 4431 	ldf a,([farptr],x)
      009A04 90 F7            [ 1] 4432 	ld (y),a 
      009A06 5C               [ 1] 4433 	incw x 
      009A07 90 5C            [ 1] 4434 	incw y 
      009A09 90 C3 00 1E      [ 2] 4435 	cpw y,txtend 
      009A0D 2B F1            [ 1] 4436 	jrmi 3$
                                   4437 ; return loaded size 	 
      009A0F CE 00 1E         [ 2] 4438 	ldw x,txtend 
      009A12 72 B0 00 1C      [ 2] 4439 	subw x,txtbgn
      009A16 CD 89 A3         [ 4] 4440 	call print_int 
      009A19 81               [ 4] 4441 	ret 
                                   4442 
                                   4443 ;-----------------------------------
                                   4444 ; BASIC: FORGET ["file_name"] 
                                   4445 ; erase file_name and all others 
                                   4446 ; after it. 
                                   4447 ; without argument erase all files 
                                   4448 ;-----------------------------------
      009A1A                       4449 forget:
      009A1A CD 8D 1B         [ 4] 4450 	call get_token 
      009A1D A1 00            [ 1] 4451 	cp a,#TK_NONE 
      009A1F 27 1B            [ 1] 4452 	jreq 3$ 
      009A21 A1 06            [ 1] 4453 	cp a,#TK_QSTR
      009A23 27 03            [ 1] 4454 	jreq 1$
      009A25 CC 87 21         [ 2] 4455 	jp syntax_error
      009A28 90 93            [ 1] 4456 1$: ldw y,x
      009A2A CD 98 D6         [ 4] 4457 	call search_file
      009A2D 25 05            [ 1] 4458 	jrc 2$
      009A2F A6 09            [ 1] 4459 	ld a,#ERR_NOT_FILE 
      009A31 CC 87 23         [ 2] 4460 	jp tb_error 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 86.
Hexadecimal [24-Bits]



      009A34                       4461 2$: 
      009A34 CE 00 14         [ 2] 4462 	ldw x,farptr
      009A37 C6 00 16         [ 1] 4463 	ld a,farptr+2
      009A3A 20 0B            [ 2] 4464 	jra 4$ 
      009A3C                       4465 3$: ; forget all files 
      009A3C AE 00 00         [ 2] 4466 	ldw x,#fdrive
      009A3F 4F               [ 1] 4467 	clr a 
      009A40 01               [ 1] 4468 	rrwa x 
      009A41 CF 00 14         [ 2] 4469 	ldw farptr,x 
      009A44 C7 00 16         [ 1] 4470 	ld farptr+2,a 
      009A47                       4471 4$:
      009A47 CF 00 17         [ 2] 4472 	ldw ffree,x 
      009A4A C7 00 19         [ 1] 4473 	ld ffree+2,a 
      009A4D 5F               [ 1] 4474 5$:	clrw x 
      009A4E 4F               [ 1] 4475 	clr a  
      009A4F CD 81 DC         [ 4] 4476 	call write_byte 
      009A52 AE 00 01         [ 2] 4477 	ldw x,#1 
      009A55 CD 97 F6         [ 4] 4478 	call incr_farptr
      009A58 C6 00 14         [ 1] 4479 	ld a,farptr
      009A5B C1 00 17         [ 1] 4480 	cp a,ffree 
      009A5E 2B ED            [ 1] 4481 	jrmi 5$ 
      009A60 CE 00 15         [ 2] 4482 	ldw x,farptr+1 
      009A63 C3 00 18         [ 2] 4483 	cpw x,ffree+1
      009A66 2B E5            [ 1] 4484 	jrmi 5$
      009A68 81               [ 4] 4485 	ret 
                                   4486 
                                   4487 ;----------------------
                                   4488 ; BASIC: DIR 
                                   4489 ; list saved files 
                                   4490 ;----------------------
                           000001  4491 	COUNT=1 ; files counter 
                           000002  4492 	VSIZE=2 
      009A69                       4493 directory:
      0019E9                       4494 	_vars VSIZE 
      009A69 52 02            [ 2]    1     sub sp,#VSIZE 
      009A6B 5F               [ 1] 4495 	clrw x 
      009A6C 1F 01            [ 2] 4496 	ldw (COUNT,sp),x 
      009A6E CF 00 15         [ 2] 4497 	ldw farptr+1,x 
      009A71 35 01 00 14      [ 1] 4498 	mov farptr,#1 
      009A75                       4499 dir_loop:
      009A75 5F               [ 1] 4500 	clrw x 
      009A76 92 AF 00 14      [ 5] 4501 	ldf a,([farptr],x)
      009A7A 27 38            [ 1] 4502 	jreq 8$ 
      009A7C                       4503 1$: ;name loop 	
      009A7C 92 AF 00 14      [ 5] 4504 	ldf a,([farptr],x)
      009A80 27 06            [ 1] 4505 	jreq 2$ 
      009A82 CD 82 9E         [ 4] 4506 	call putc 
      009A85 5C               [ 1] 4507 	incw x 
      009A86 20 F4            [ 2] 4508 	jra 1$
      009A88 5C               [ 1] 4509 2$: incw x ; skip ending 0. 
      009A89 A6 20            [ 1] 4510 	ld a,#SPACE 
      009A8B CD 82 9E         [ 4] 4511 	call putc 
                                   4512 ; get file size 	
      009A8E 92 AF 00 14      [ 5] 4513 	ldf a,([farptr],x)
      009A92 90 95            [ 1] 4514 	ld yh,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 87.
Hexadecimal [24-Bits]



      009A94 5C               [ 1] 4515 	incw x 
      009A95 92 AF 00 14      [ 5] 4516 	ldf a,([farptr],x)
      009A99 5C               [ 1] 4517 	incw x 
      009A9A 90 97            [ 1] 4518 	ld yl,a 
      009A9C 90 89            [ 2] 4519 	pushw y 
      009A9E 72 FB 01         [ 2] 4520 	addw x,(1,sp)
      009AA1 CD 97 F6         [ 4] 4521 	call incr_farptr 
      009AA4 85               [ 2] 4522 	popw x ; file size 
      009AA5 CD 89 A3         [ 4] 4523 	call print_int 
      009AA8 A6 0D            [ 1] 4524 	ld a,#CR 
      009AAA CD 82 9E         [ 4] 4525 	call putc
      009AAD 1E 01            [ 2] 4526 	ldw x,(COUNT,sp)
      009AAF 5C               [ 1] 4527 	incw x
      009AB0 1F 01            [ 2] 4528 	ldw (COUNT,sp),x  
      009AB2 20 C1            [ 2] 4529 	jra dir_loop 
      009AB4                       4530 8$:
      009AB4 1E 01            [ 2] 4531 	ldw x,(COUNT,sp)
      009AB6 CD 89 A3         [ 4] 4532 	call print_int 
      009AB9 AE 9A C2         [ 2] 4533 	ldw x,#file_count 
      009ABC CD 82 B0         [ 4] 4534 	call puts  
      001A3F                       4535 	_drop VSIZE 
      009ABF 5B 02            [ 2]    1     addw sp,#VSIZE 
      009AC1 81               [ 4] 4536 	ret
      009AC2 20 66 69 6C 65 73 0A  4537 file_count: .asciz " files\n"
             00
                                   4538 
                                   4539 ;---------------------
                                   4540 ; BASIC: WRITE expr1,expr2 
                                   4541 ; write byte to FLASH or EEPROM 
                                   4542 ; input:
                                   4543 ;   expr1  	is address 
                                   4544 ;   expr2   is byte to write
                                   4545 ; output:
                                   4546 ;   none 
                                   4547 ;---------------------
      009ACA                       4548 write:
      009ACA 72 5F 00 14      [ 1] 4549 	clr farptr ; expect 16 bits address 
      009ACE CD 91 F0         [ 4] 4550 	call arg_list  
      009AD1 A1 02            [ 1] 4551 	cp a,#2
      009AD3 27 03            [ 1] 4552 	jreq 1$
      009AD5 CC 87 21         [ 2] 4553 	jp syntax_error
      009AD8                       4554 1$:
      009AD8 CD 8F DB         [ 4] 4555 	call dpop 
      009ADB 9F               [ 1] 4556 	ld a,xl 
      009ADC CD 8F DB         [ 4] 4557 	call dpop 
      009ADF CF 00 15         [ 2] 4558 	ldw farptr+1,x 
      009AE2 5F               [ 1] 4559 	clrw x 
      009AE3 CD 81 DC         [ 4] 4560 	call write_byte 
      009AE6 81               [ 4] 4561 	ret 
                                   4562 
                                   4563 
                                   4564 ;---------------------
                                   4565 ;BASIC: CHAR(expr)
                                   4566 ; évaluate expression 
                                   4567 ; and take the 7 least 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 88.
Hexadecimal [24-Bits]



                                   4568 ; bits as ASCII character
                                   4569 ;---------------------
      009AE7                       4570 char:
      009AE7 A6 04            [ 1] 4571 	ld a,#TK_LPAREN 
      009AE9 CD 91 E3         [ 4] 4572 	call expect 
      009AEC CD 93 2C         [ 4] 4573 	call relation 
      009AEF A1 0A            [ 1] 4574 	cp a,#TK_INTGR 
      009AF1 27 03            [ 1] 4575 	jreq 1$
      009AF3 CC 87 21         [ 2] 4576 	jp syntax_error
      009AF6 89               [ 2] 4577 1$:	pushw x 
      009AF7 A6 05            [ 1] 4578 	ld a,#TK_RPAREN 
      009AF9 CD 91 E3         [ 4] 4579 	call expect
      009AFC 85               [ 2] 4580 	popw x  
      009AFD 9F               [ 1] 4581 	ld a,xl 
      009AFE A4 7F            [ 1] 4582 	and a,#0x7f 
      009B00 97               [ 1] 4583 	ld xl,a
      009B01 A6 0B            [ 1] 4584 	ld a,#TK_CHAR
      009B03 81               [ 4] 4585 	ret
                                   4586 
                                   4587 ;---------------------
                                   4588 ; BASIC: ASC(string|char)
                                   4589 ; extract first character 
                                   4590 ; of string argument 
                                   4591 ; return it as TK_INTGR 
                                   4592 ;---------------------
      009B04                       4593 ascii:
      009B04 A6 04            [ 1] 4594 	ld a,#TK_LPAREN
      009B06 CD 91 E3         [ 4] 4595 	call expect 
      009B09 CD 8D 1B         [ 4] 4596 	call get_token 
      009B0C A1 06            [ 1] 4597 	cp a,#TK_QSTR 
      009B0E 27 07            [ 1] 4598 	jreq 1$
      009B10 A1 0B            [ 1] 4599 	cp a,#TK_CHAR 
      009B12 27 06            [ 1] 4600 	jreq 2$ 
      009B14 CC 87 21         [ 2] 4601 	jp syntax_error
      009B17                       4602 1$: 
      009B17 F6               [ 1] 4603 	ld a,(x)
      009B18 20 01            [ 2] 4604 	jra 3$
      009B1A                       4605 2$: 
      009B1A 9F               [ 1] 4606 	ld a,xl 
      009B1B 97               [ 1] 4607 3$:	ld xl,a 
      009B1C 4F               [ 1] 4608 	clr a  
      009B1D 95               [ 1] 4609 	ld xh,a 
      009B1E 89               [ 2] 4610 	pushw x  
      009B1F A6 05            [ 1] 4611 	ld a,#TK_RPAREN 
      009B21 CD 91 E3         [ 4] 4612 	call expect 
      009B24 85               [ 2] 4613 	popw x 
      009B25 A6 0A            [ 1] 4614 	ld a,#TK_INTGR 
      009B27 81               [ 4] 4615 	ret 
                                   4616 
                                   4617 ;---------------------
                                   4618 ;BASIC: KEY
                                   4619 ; wait for a character 
                                   4620 ; received from STDIN 
                                   4621 ; input:
                                   4622 ;	none 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 89.
Hexadecimal [24-Bits]



                                   4623 ; output:
                                   4624 ;	X 		ASCII character 
                                   4625 ;---------------------
      009B28                       4626 key:
      009B28 CD 82 A7         [ 4] 4627 	call getc 
      009B2B 5F               [ 1] 4628 	clrw x 
      009B2C 97               [ 1] 4629 	ld xl,a 
      009B2D A6 0A            [ 1] 4630 	ld a,#TK_INTGR
      009B2F 81               [ 4] 4631 	ret
                                   4632 
                                   4633 ;----------------------
                                   4634 ; BASIC: QKEY
                                   4635 ; Return true if there 
                                   4636 ; is a character in 
                                   4637 ; waiting in STDIN 
                                   4638 ; input:
                                   4639 ;  none 
                                   4640 ; output:
                                   4641 ;   X 		0|1 
                                   4642 ;-----------------------
      009B30                       4643 qkey: 
      009B30 5F               [ 1] 4644 	clrw x 
      009B31 72 0B 52 40 01   [ 2] 4645 	btjf UART3_SR,#UART_SR_RXNE,9$ 
      009B36 5C               [ 1] 4646 	incw x 
      009B37 A6 0A            [ 1] 4647 9$: ld a,#TK_INTGR
      009B39 81               [ 4] 4648 	ret 
                                   4649 
                                   4650 ;---------------------
                                   4651 ; BASIC: GPIO(expr,reg)
                                   4652 ; return gpio address 
                                   4653 ; expr {0..8}
                                   4654 ; input:
                                   4655 ;   none 
                                   4656 ; output:
                                   4657 ;   X 		gpio register address
                                   4658 ;----------------------------
      009B3A                       4659 gpio:
      009B3A A6 04            [ 1] 4660 	ld a,#TK_LPAREN 
      009B3C CD 91 E3         [ 4] 4661 	call expect 
      009B3F CD 91 F0         [ 4] 4662 	call arg_list
      009B42 A1 02            [ 1] 4663 	cp a,#2
      009B44 27 03            [ 1] 4664 	jreq 1$
      009B46 CC 87 21         [ 2] 4665 	jp syntax_error  
      009B49                       4666 1$:	
      009B49 A6 05            [ 1] 4667 	ld a,#TK_RPAREN 
      009B4B CD 91 E3         [ 4] 4668 	call expect 
      009B4E AE 00 02         [ 2] 4669 	ldw x,#2
      009B51 72 DE 00 1A      [ 5] 4670 	ldw x,([dstkptr],x) ; port 
      009B55 2B 1E            [ 1] 4671 	jrmi bad_port
      009B57 A3 00 09         [ 2] 4672 	cpw x,#9
      009B5A 2A 19            [ 1] 4673 	jrpl bad_port
      009B5C A6 05            [ 1] 4674 	ld a,#5
      009B5E 42               [ 4] 4675 	mul x,a
      009B5F 1C 50 00         [ 2] 4676 	addw x,#GPIO_BASE 
      009B62 89               [ 2] 4677 	pushw x 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 90.
Hexadecimal [24-Bits]



      009B63 CD 8F DB         [ 4] 4678 	call dpop 
      009B66 72 FB 01         [ 2] 4679 	addw x,(1,sp)
      009B69 1F 01            [ 2] 4680 	ldw (1,sp),x  
      009B6B AE 00 02         [ 2] 4681 	ldw x,#2 
      009B6E CD 91 74         [ 4] 4682 	call ddrop_n 
      009B71 85               [ 2] 4683 	popw x 
      009B72 A6 0A            [ 1] 4684 	ld a,#TK_INTGR
      009B74 81               [ 4] 4685 	ret
      009B75                       4686 bad_port:
      009B75 A6 0A            [ 1] 4687 	ld a,#ERR_BAD_VALUE
      009B77 CC 87 23         [ 2] 4688 	jp tb_error
                                   4689 
                                   4690 ;----------------------
                                   4691 ; BASIC: ODR 
                                   4692 ; return offset of gpio
                                   4693 ; ODR register: 0
                                   4694 ; ---------------------
      009B7A                       4695 port_odr:
      009B7A AE 00 00         [ 2] 4696 	ldw x,#GPIO_ODR
      009B7D A6 0A            [ 1] 4697 	ld a,#TK_INTGR
      009B7F 81               [ 4] 4698 	ret
                                   4699 
                                   4700 ;----------------------
                                   4701 ; BASIC: IDR 
                                   4702 ; return offset of gpio
                                   4703 ; IDR register: 1
                                   4704 ; ---------------------
      009B80                       4705 port_idr:
      009B80 AE 00 01         [ 2] 4706 	ldw x,#GPIO_IDR
      009B83 A6 0A            [ 1] 4707 	ld a,#TK_INTGR
      009B85 81               [ 4] 4708 	ret
                                   4709 
                                   4710 ;----------------------
                                   4711 ; BASIC: DDR 
                                   4712 ; return offset of gpio
                                   4713 ; DDR register: 2
                                   4714 ; ---------------------
      009B86                       4715 port_ddr:
      009B86 AE 00 02         [ 2] 4716 	ldw x,#GPIO_DDR
      009B89 A6 0A            [ 1] 4717 	ld a,#TK_INTGR
      009B8B 81               [ 4] 4718 	ret
                                   4719 
                                   4720 ;----------------------
                                   4721 ; BASIC: CRL  
                                   4722 ; return offset of gpio
                                   4723 ; CR1 register: 3
                                   4724 ; ---------------------
      009B8C                       4725 port_cr1:
      009B8C AE 00 03         [ 2] 4726 	ldw x,#GPIO_CR1
      009B8F A6 0A            [ 1] 4727 	ld a,#TK_INTGR
      009B91 81               [ 4] 4728 	ret
                                   4729 
                                   4730 ;----------------------
                                   4731 ; BASIC: CRH  
                                   4732 ; return offset of gpio
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 91.
Hexadecimal [24-Bits]



                                   4733 ; CR2 register: 4
                                   4734 ; ---------------------
      009B92                       4735 port_cr2:
      009B92 AE 00 04         [ 2] 4736 	ldw x,#GPIO_CR2
      009B95 A6 0A            [ 1] 4737 	ld a,#TK_INTGR
      009B97 81               [ 4] 4738 	ret
                                   4739 
                                   4740 
                                   4741 ;---------------------
                                   4742 ; BASIC: USR(addr[,arg])
                                   4743 ; execute a function written 
                                   4744 ; in binary code.
                                   4745 ; binary fonction should 
                                   4746 ; return token attribute in A 
                                   4747 ; and value in X. 
                                   4748 ; input:
                                   4749 ;   addr	routine address 
                                   4750 ;   arg 	is an optional argument 
                                   4751 ; output:
                                   4752 ;   A 		token attribute 
                                   4753 ;   X       returned value 
                                   4754 ;---------------------
      009B98                       4755 usr:
      009B98 90 89            [ 2] 4756 	pushw y 	
      009B9A A6 04            [ 1] 4757 	ld a,#TK_LPAREN 
      009B9C CD 91 E3         [ 4] 4758 	call expect 
      009B9F CD 91 F0         [ 4] 4759 	call arg_list 
      009BA2 A1 01            [ 1] 4760 	cp a,#1 
      009BA4 2A 03            [ 1] 4761 	jrpl 2$ 
      009BA6 CC 87 21         [ 2] 4762 	jp syntax_error 
      009BA9 A6 05            [ 1] 4763 2$: ld a,#TK_RPAREN
      009BAB CD 91 E3         [ 4] 4764 	call expect 
      009BAE CD 8F DB         [ 4] 4765 	call dpop 
      009BB1 A1 02            [ 1] 4766 	cp a,#2 
      009BB3 2B 05            [ 1] 4767 	jrmi 4$
      009BB5 90 93            [ 1] 4768 	ldw y,x ; y=arg 
      009BB7 CD 8F DB         [ 4] 4769 	call dpop ;x=addr 
      009BBA 51               [ 1] 4770 4$:	exgw y,x ; y=addr,x=arg 
      009BBB 90 FD            [ 4] 4771 	call (y)
      009BBD 90 85            [ 2] 4772 	popw y 
      009BBF 81               [ 4] 4773 	ret 
                                   4774 
                                   4775 ;------------------------------
                                   4776 ; BASIC: BYE 
                                   4777 ; halt mcu in its lowest power mode 
                                   4778 ; wait for reset or external interrupt
                                   4779 ; do a cold start on wakeup.
                                   4780 ;------------------------------
      009BC0                       4781 bye:
      009BC0 72 0D 52 40 FB   [ 2] 4782 	btjf UART3_SR,#UART_SR_TC,.
      009BC5 8E               [10] 4783 	halt
      009BC6 CC 85 64         [ 2] 4784 	jp cold_start  
                                   4785 
                                   4786 ;----------------------------------
                                   4787 ; BASIC: SLEEP 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 92.
Hexadecimal [24-Bits]



                                   4788 ; halt mcu until reset or external
                                   4789 ; interrupt.
                                   4790 ; Resume progam after SLEEP command
                                   4791 ;----------------------------------
      009BC9                       4792 sleep:
      009BC9 72 0D 52 40 FB   [ 2] 4793 	btjf UART3_SR,#UART_SR_TC,.
      009BCE 72 16 00 25      [ 1] 4794 	bset flags,#FSLEEP
      009BD2 8E               [10] 4795 	halt 
      009BD3 81               [ 4] 4796 	ret 
                                   4797 
                                   4798 ;-------------------------------
                                   4799 ; BASIC: PAUSE expr 
                                   4800 ; suspend execution for n msec.
                                   4801 ; input:
                                   4802 ;	none
                                   4803 ; output:
                                   4804 ;	none 
                                   4805 ;------------------------------
      009BD4                       4806 pause:
      009BD4 CD 92 E8         [ 4] 4807 	call expression
      009BD7 A1 0A            [ 1] 4808 	cp a,#TK_INTGR
      009BD9 27 03            [ 1] 4809 	jreq pause02 
      009BDB CC 87 21         [ 2] 4810 	jp syntax_error
      009BDE                       4811 pause02: 
      009BDE 5D               [ 2] 4812 1$: tnzw x 
      009BDF 27 04            [ 1] 4813 	jreq 2$
      009BE1 8F               [10] 4814 	wfi 
      009BE2 5A               [ 2] 4815 	decw x 
      009BE3 26 F9            [ 1] 4816 	jrne 1$
      009BE5 4F               [ 1] 4817 2$:	clr a 
      009BE6 81               [ 4] 4818 	ret 
                                   4819 
                                   4820 ;------------------------------
                                   4821 ; BASIC: TICKS
                                   4822 ; return msec ticks counter value 
                                   4823 ; input:
                                   4824 ; 	none 
                                   4825 ; output:
                                   4826 ;	X 		TK_INTGR
                                   4827 ;-------------------------------
      009BE7                       4828 get_ticks:
      009BE7 CE 00 0C         [ 2] 4829 	ldw x,ticks 
      009BEA A6 0A            [ 1] 4830 	ld a,#TK_INTGR
      009BEC 81               [ 4] 4831 	ret 
                                   4832 
                                   4833 
                                   4834 
                                   4835 ;------------------------------
                                   4836 ; BASIC: ABS(expr)
                                   4837 ; return absolute value of expr.
                                   4838 ; input:
                                   4839 ;   none
                                   4840 ; output:
                                   4841 ;   X     	positive integer
                                   4842 ;-------------------------------
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 93.
Hexadecimal [24-Bits]



      009BED                       4843 abs:
      009BED A6 04            [ 1] 4844 	ld a,#TK_LPAREN
      009BEF CD 91 E3         [ 4] 4845 	call expect 
      009BF2 CD 91 F0         [ 4] 4846 	call arg_list
      009BF5 A1 01            [ 1] 4847 	cp a,#1 
      009BF7 27 03            [ 1] 4848 	jreq 0$ 
      009BF9 CC 87 21         [ 2] 4849 	jp syntax_error
      009BFC                       4850 0$:  
      009BFC A6 05            [ 1] 4851 	ld a,#TK_RPAREN 
      009BFE CD 91 E3         [ 4] 4852 	call expect 
      009C01 CD 8F DB         [ 4] 4853     call dpop   
      009C04 9E               [ 1] 4854 	ld a,xh 
      009C05 A5 80            [ 1] 4855 	bcp a,#0x80 
      009C07 27 01            [ 1] 4856 	jreq 2$ 
      009C09 50               [ 2] 4857 	negw x 
      009C0A A6 0A            [ 1] 4858 2$: ld a,#TK_INTGR 
      009C0C 81               [ 4] 4859 	ret 
                                   4860 
                                   4861 ;------------------------------
                                   4862 ; BASIC: RND(expr)
                                   4863 ; return random number 
                                   4864 ; between 1 and expr inclusive
                                   4865 ; xorshift16 ref: http://b2d-f9r.blogspot.com/2010/08/16-bit-xorshift-rng-now-with-more.html
                                   4866 ; input:
                                   4867 ; 	none 
                                   4868 ; output:
                                   4869 ;	X 		random positive integer 
                                   4870 ;------------------------------
      009C0D                       4871 random:
      009C0D A6 04            [ 1] 4872 	ld a,#TK_LPAREN 
      009C0F CD 91 E3         [ 4] 4873 	call expect 
      009C12 CD 91 F0         [ 4] 4874 	call arg_list 
      009C15 A1 01            [ 1] 4875 	cp a,#1
      009C17 27 03            [ 1] 4876 	jreq 1$
      009C19 CC 87 21         [ 2] 4877 	jp syntax_error
      009C1C A6 05            [ 1] 4878 1$: ld a,#TK_RPAREN
      009C1E CD 91 E3         [ 4] 4879 	call expect 
      009C21 CD 8F DB         [ 4] 4880 	call dpop 
      009C24 89               [ 2] 4881 	pushw x 
      009C25 9E               [ 1] 4882 	ld a,xh 
      009C26 A5 80            [ 1] 4883 	bcp a,#0x80 
      009C28 27 05            [ 1] 4884 	jreq 2$
      009C2A A6 0A            [ 1] 4885 	ld a,#ERR_BAD_VALUE
      009C2C CC 87 23         [ 2] 4886 	jp tb_error
      009C2F                       4887 2$: 
                                   4888 ; acc16=(x<<5)^x 
      009C2F CE 00 0E         [ 2] 4889 	ldw x,seedx 
      009C32 58               [ 2] 4890 	sllw x 
      009C33 58               [ 2] 4891 	sllw x 
      009C34 58               [ 2] 4892 	sllw x 
      009C35 58               [ 2] 4893 	sllw x 
      009C36 58               [ 2] 4894 	sllw x 
      009C37 9E               [ 1] 4895 	ld a,xh 
      009C38 C8 00 0E         [ 1] 4896 	xor a,seedx 
      009C3B C7 00 0A         [ 1] 4897 	ld acc16,a 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 94.
Hexadecimal [24-Bits]



      009C3E 9F               [ 1] 4898 	ld a,xl 
      009C3F C8 00 0F         [ 1] 4899 	xor a,seedx+1 
      009C42 C7 00 0B         [ 1] 4900 	ld acc8,a 
                                   4901 ; seedx=seedy 
      009C45 CE 00 10         [ 2] 4902 	ldw x,seedy 
      009C48 CF 00 0E         [ 2] 4903 	ldw seedx,x  
                                   4904 ; seedy=seedy^(seedy>>1)
      009C4B 90 54            [ 2] 4905 	srlw y 
      009C4D 90 9E            [ 1] 4906 	ld a,yh 
      009C4F C8 00 10         [ 1] 4907 	xor a,seedy 
      009C52 C7 00 10         [ 1] 4908 	ld seedy,a  
      009C55 90 9F            [ 1] 4909 	ld a,yl 
      009C57 C8 00 11         [ 1] 4910 	xor a,seedy+1 
      009C5A C7 00 11         [ 1] 4911 	ld seedy+1,a 
                                   4912 ; acc16>>3 
      009C5D CE 00 0A         [ 2] 4913 	ldw x,acc16 
      009C60 54               [ 2] 4914 	srlw x 
      009C61 54               [ 2] 4915 	srlw x 
      009C62 54               [ 2] 4916 	srlw x 
                                   4917 ; x=acc16^x 
      009C63 9E               [ 1] 4918 	ld a,xh 
      009C64 C8 00 0A         [ 1] 4919 	xor a,acc16 
      009C67 95               [ 1] 4920 	ld xh,a 
      009C68 9F               [ 1] 4921 	ld a,xl 
      009C69 C8 00 0B         [ 1] 4922 	xor a,acc8 
      009C6C 97               [ 1] 4923 	ld xl,a 
                                   4924 ; seedy=x^seedy 
      009C6D C8 00 11         [ 1] 4925 	xor a,seedy+1
      009C70 97               [ 1] 4926 	ld xl,a 
      009C71 9E               [ 1] 4927 	ld a,xh 
      009C72 C8 00 10         [ 1] 4928 	xor a,seedy
      009C75 95               [ 1] 4929 	ld xh,a 
      009C76 CF 00 10         [ 2] 4930 	ldw seedy,x 
                                   4931 ; return seedy modulo expr + 1 
      009C79 90 85            [ 2] 4932 	popw y 
      009C7B 65               [ 2] 4933 	divw x,y 
      009C7C 93               [ 1] 4934 	ldw x,y 
      009C7D 5C               [ 1] 4935 	incw x 
      009C7E A6 0A            [ 1] 4936 	ld a,#TK_INTGR
      009C80 81               [ 4] 4937 	ret 
                                   4938 
                                   4939 ;*********************************
                                   4940 
                                   4941 ;------------------------------
                                   4942 ;      dictionary 
                                   4943 ; format:
                                   4944 ;   link   2 bytes 
                                   4945 ;   cmd_name 8 byte max 
                                   4946 ;   code_address 2 bytes 
                                   4947 ;------------------------------
                           000080  4948 	FFUNC=128 
                                   4949 	.macro _dict_entry len,name,cmd 
                                   4950 	.word LINK 
                                   4951 	LINK=.
                                   4952 name:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 95.
Hexadecimal [24-Bits]



                                   4953 	.byte len 	
                                   4954 	.ascii "name"
                                   4955 	.word cmd 
                                   4956 	.endm 
                                   4957 
                           000000  4958 	LINK=0
      009C81                       4959 kword_end:
      001C01                       4960 	_dict_entry,3,BYE,bye 
      009C81 00 00                    1 	.word LINK 
                           001C03     2 	LINK=.
      009C83                          3 BYE:
      009C83 03                       4 	.byte 3 	
      009C84 42 59 45                 5 	.ascii "BYE"
      009C87 9B C0                    6 	.word bye 
      001C09                       4961 	_dict_entry,5,SLEEP,sleep 
      009C89 9C 83                    1 	.word LINK 
                           001C0B     2 	LINK=.
      009C8B                          3 SLEEP:
      009C8B 05                       4 	.byte 5 	
      009C8C 53 4C 45 45 50           5 	.ascii "SLEEP"
      009C91 9B C9                    6 	.word sleep 
      001C13                       4962 	_dict_entry,6,FORGET,forget 
      009C93 9C 8B                    1 	.word LINK 
                           001C15     2 	LINK=.
      009C95                          3 FORGET:
      009C95 06                       4 	.byte 6 	
      009C96 46 4F 52 47 45 54        5 	.ascii "FORGET"
      009C9C 9A 1A                    6 	.word forget 
      001C1E                       4963 	_dict_entry,3,DIR,directory 
      009C9E 9C 95                    1 	.word LINK 
                           001C20     2 	LINK=.
      009CA0                          3 DIR:
      009CA0 03                       4 	.byte 3 	
      009CA1 44 49 52                 5 	.ascii "DIR"
      009CA4 9A 69                    6 	.word directory 
      001C26                       4964 	_dict_entry,4,LOAD,load 
      009CA6 9C A0                    1 	.word LINK 
                           001C28     2 	LINK=.
      009CA8                          3 LOAD:
      009CA8 04                       4 	.byte 4 	
      009CA9 4C 4F 41 44              5 	.ascii "LOAD"
      009CAD 99 BD                    6 	.word load 
      001C2F                       4965 	_dict_entry,4,SAVE,save
      009CAF 9C A8                    1 	.word LINK 
                           001C31     2 	LINK=.
      009CB1                          3 SAVE:
      009CB1 04                       4 	.byte 4 	
      009CB2 53 41 56 45              5 	.ascii "SAVE"
      009CB6 99 20                    6 	.word save 
      001C38                       4966 	_dict_entry,5,WRITE,write  
      009CB8 9C B1                    1 	.word LINK 
                           001C3A     2 	LINK=.
      009CBA                          3 WRITE:
      009CBA 05                       4 	.byte 5 	
      009CBB 57 52 49 54 45           5 	.ascii "WRITE"
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 96.
Hexadecimal [24-Bits]



      009CC0 9A CA                    6 	.word write 
      001C42                       4967 	_dict_entry,3,NEW,new
      009CC2 9C BA                    1 	.word LINK 
                           001C44     2 	LINK=.
      009CC4                          3 NEW:
      009CC4 03                       4 	.byte 3 	
      009CC5 4E 45 57                 5 	.ascii "NEW"
      009CC8 97 EB                    6 	.word new 
      001C4A                       4968 	_dict_entry,4,STOP,stop 
      009CCA 9C C4                    1 	.word LINK 
                           001C4C     2 	LINK=.
      009CCC                          3 STOP:
      009CCC 04                       4 	.byte 4 	
      009CCD 53 54 4F 50              5 	.ascii "STOP"
      009CD1 97 D9                    6 	.word stop 
      001C53                       4969     _dict_entry,4,SHOW,show 
      009CD3 9C CC                    1 	.word LINK 
                           001C55     2 	LINK=.
      009CD5                          3 SHOW:
      009CD5 04                       4 	.byte 4 	
      009CD6 53 48 4F 57              5 	.ascii "SHOW"
      009CDA 90 C1                    6 	.word show 
      001C5C                       4970 	_dict_entry 3,RUN,run
      009CDC 9C D5                    1 	.word LINK 
                           001C5E     2 	LINK=.
      009CDE                          3 RUN:
      009CDE 03                       4 	.byte 3 	
      009CDF 52 55 4E                 5 	.ascii "RUN"
      009CE2 97 A7                    6 	.word run 
      001C64                       4971 	_dict_entry 4,LIST,list
      009CE4 9C DE                    1 	.word LINK 
                           001C66     2 	LINK=.
      009CE6                          3 LIST:
      009CE6 04                       4 	.byte 4 	
      009CE7 4C 49 53 54              5 	.ascii "LIST"
      009CEB 93 CD                    6 	.word list 
      001C6D                       4972 	_dict_entry,3+FFUNC,USR,usr
      009CED 9C E6                    1 	.word LINK 
                           001C6F     2 	LINK=.
      009CEF                          3 USR:
      009CEF 83                       4 	.byte 3+FFUNC 	
      009CF0 55 53 52                 5 	.ascii "USR"
      009CF3 9B 98                    6 	.word usr 
      001C75                       4973 	_dict_entry,3+FFUNC,ODR,port_odr
      009CF5 9C EF                    1 	.word LINK 
                           001C77     2 	LINK=.
      009CF7                          3 ODR:
      009CF7 83                       4 	.byte 3+FFUNC 	
      009CF8 4F 44 52                 5 	.ascii "ODR"
      009CFB 9B 7A                    6 	.word port_odr 
      001C7D                       4974 	_dict_entry,3+FFUNC,IDR,port_idr
      009CFD 9C F7                    1 	.word LINK 
                           001C7F     2 	LINK=.
      009CFF                          3 IDR:
      009CFF 83                       4 	.byte 3+FFUNC 	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 97.
Hexadecimal [24-Bits]



      009D00 49 44 52                 5 	.ascii "IDR"
      009D03 9B 80                    6 	.word port_idr 
      001C85                       4975 	_dict_entry,3+FFUNC,DDR,port_ddr 
      009D05 9C FF                    1 	.word LINK 
                           001C87     2 	LINK=.
      009D07                          3 DDR:
      009D07 83                       4 	.byte 3+FFUNC 	
      009D08 44 44 52                 5 	.ascii "DDR"
      009D0B 9B 86                    6 	.word port_ddr 
      001C8D                       4976 	_dict_entry,3+FFUNC,CRL,port_cr1 
      009D0D 9D 07                    1 	.word LINK 
                           001C8F     2 	LINK=.
      009D0F                          3 CRL:
      009D0F 83                       4 	.byte 3+FFUNC 	
      009D10 43 52 4C                 5 	.ascii "CRL"
      009D13 9B 8C                    6 	.word port_cr1 
      001C95                       4977 	_dict_entry,3+FFUNC,CRH,port_cr2
      009D15 9D 0F                    1 	.word LINK 
                           001C97     2 	LINK=.
      009D17                          3 CRH:
      009D17 83                       4 	.byte 3+FFUNC 	
      009D18 43 52 48                 5 	.ascii "CRH"
      009D1B 9B 92                    6 	.word port_cr2 
      001C9D                       4978 	_dict_entry,4+FFUNC,GPIO,gpio 
      009D1D 9D 17                    1 	.word LINK 
                           001C9F     2 	LINK=.
      009D1F                          3 GPIO:
      009D1F 84                       4 	.byte 4+FFUNC 	
      009D20 47 50 49 4F              5 	.ascii "GPIO"
      009D24 9B 3A                    6 	.word gpio 
      001CA6                       4979 	_dict_entry,3+FFUNC,ASC,ascii  
      009D26 9D 1F                    1 	.word LINK 
                           001CA8     2 	LINK=.
      009D28                          3 ASC:
      009D28 83                       4 	.byte 3+FFUNC 	
      009D29 41 53 43                 5 	.ascii "ASC"
      009D2C 9B 04                    6 	.word ascii 
      001CAE                       4980 	_dict_entry,4+FFUNC,CHAR,char
      009D2E 9D 28                    1 	.word LINK 
                           001CB0     2 	LINK=.
      009D30                          3 CHAR:
      009D30 84                       4 	.byte 4+FFUNC 	
      009D31 43 48 41 52              5 	.ascii "CHAR"
      009D35 9A E7                    6 	.word char 
      001CB7                       4981 	_dict_entry,4+FFUNC,QKEY,qkey  
      009D37 9D 30                    1 	.word LINK 
                           001CB9     2 	LINK=.
      009D39                          3 QKEY:
      009D39 84                       4 	.byte 4+FFUNC 	
      009D3A 51 4B 45 59              5 	.ascii "QKEY"
      009D3E 9B 30                    6 	.word qkey 
      001CC0                       4982 	_dict_entry,3+FFUNC,KEY,key 
      009D40 9D 39                    1 	.word LINK 
                           001CC2     2 	LINK=.
      009D42                          3 KEY:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 98.
Hexadecimal [24-Bits]



      009D42 83                       4 	.byte 3+FFUNC 	
      009D43 4B 45 59                 5 	.ascii "KEY"
      009D46 9B 28                    6 	.word key 
      001CC8                       4983 	_dict_entry,4+FFUNC,SIZE,size
      009D48 9D 42                    1 	.word LINK 
                           001CCA     2 	LINK=.
      009D4A                          3 SIZE:
      009D4A 84                       4 	.byte 4+FFUNC 	
      009D4B 53 49 5A 45              5 	.ascii "SIZE"
      009D4F 93 8D                    6 	.word size 
      001CD1                       4984 	_dict_entry,3,HEX,hex_base
      009D51 9D 4A                    1 	.word LINK 
                           001CD3     2 	LINK=.
      009D53                          3 HEX:
      009D53 03                       4 	.byte 3 	
      009D54 48 45 58                 5 	.ascii "HEX"
      009D57 93 83                    6 	.word hex_base 
      001CD9                       4985 	_dict_entry,3,DEC,dec_base
      009D59 9D 53                    1 	.word LINK 
                           001CDB     2 	LINK=.
      009D5B                          3 DEC:
      009D5B 03                       4 	.byte 3 	
      009D5C 44 45 43                 5 	.ascii "DEC"
      009D5F 93 88                    6 	.word dec_base 
      001CE1                       4986 	_dict_entry,5+FFUNC,TICKS,get_ticks
      009D61 9D 5B                    1 	.word LINK 
                           001CE3     2 	LINK=.
      009D63                          3 TICKS:
      009D63 85                       4 	.byte 5+FFUNC 	
      009D64 54 49 43 4B 53           5 	.ascii "TICKS"
      009D69 9B E7                    6 	.word get_ticks 
      001CEB                       4987 	_dict_entry,3+FFUNC,ABS,abs
      009D6B 9D 63                    1 	.word LINK 
                           001CED     2 	LINK=.
      009D6D                          3 ABS:
      009D6D 83                       4 	.byte 3+FFUNC 	
      009D6E 41 42 53                 5 	.ascii "ABS"
      009D71 9B ED                    6 	.word abs 
      001CF3                       4988 	_dict_entry,3+FFUNC,RND,random 
      009D73 9D 6D                    1 	.word LINK 
                           001CF5     2 	LINK=.
      009D75                          3 RND:
      009D75 83                       4 	.byte 3+FFUNC 	
      009D76 52 4E 44                 5 	.ascii "RND"
      009D79 9C 0D                    6 	.word random 
      001CFB                       4989 	_dict_entry,5,PAUSE,pause 
      009D7B 9D 75                    1 	.word LINK 
                           001CFD     2 	LINK=.
      009D7D                          3 PAUSE:
      009D7D 05                       4 	.byte 5 	
      009D7E 50 41 55 53 45           5 	.ascii "PAUSE"
      009D83 9B D4                    6 	.word pause 
      001D05                       4990 	_dict_entry,4,BSET,bit_set 
      009D85 9D 7D                    1 	.word LINK 
                           001D07     2 	LINK=.
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 99.
Hexadecimal [24-Bits]



      009D87                          3 BSET:
      009D87 04                       4 	.byte 4 	
      009D88 42 53 45 54              5 	.ascii "BSET"
      009D8C 95 B3                    6 	.word bit_set 
      001D0E                       4991 	_dict_entry,4,BRES,bit_reset
      009D8E 9D 87                    1 	.word LINK 
                           001D10     2 	LINK=.
      009D90                          3 BRES:
      009D90 04                       4 	.byte 4 	
      009D91 42 52 45 53              5 	.ascii "BRES"
      009D95 95 C7                    6 	.word bit_reset 
      001D17                       4992 	_dict_entry,5,BTOGL,bit_toggle
      009D97 9D 90                    1 	.word LINK 
                           001D19     2 	LINK=.
      009D99                          3 BTOGL:
      009D99 05                       4 	.byte 5 	
      009D9A 42 54 4F 47 4C           5 	.ascii "BTOGL"
      009D9F 95 DC                    6 	.word bit_toggle 
      001D21                       4993 	_dict_entry 4,WAIT,wait 
      009DA1 9D 99                    1 	.word LINK 
                           001D23     2 	LINK=.
      009DA3                          3 WAIT:
      009DA3 04                       4 	.byte 4 	
      009DA4 57 41 49 54              5 	.ascii "WAIT"
      009DA8 95 88                    6 	.word wait 
      001D2A                       4994 	_dict_entry 6,REMARK,rem 
      009DAA 9D A3                    1 	.word LINK 
                           001D2C     2 	LINK=.
      009DAC                          3 REMARK:
      009DAC 06                       4 	.byte 6 	
      009DAD 52 45 4D 41 52 4B        5 	.ascii "REMARK"
      009DB3 95 87                    6 	.word rem 
      001D35                       4995 	_dict_entry 5,PRINT,print 
      009DB5 9D AC                    1 	.word LINK 
                           001D37     2 	LINK=.
      009DB7                          3 PRINT:
      009DB7 05                       4 	.byte 5 	
      009DB8 50 52 49 4E 54           5 	.ascii "PRINT"
      009DBD 94 82                    6 	.word print 
      001D3F                       4996 	_dict_entry,2,IF,if 
      009DBF 9D B7                    1 	.word LINK 
                           001D41     2 	LINK=.
      009DC1                          3 IF:
      009DC1 02                       4 	.byte 2 	
      009DC2 49 46                    5 	.ascii "IF"
      009DC4 96 20                    6 	.word if 
      001D46                       4997 	_dict_entry,5,GOSUB,gosub 
      009DC6 9D C1                    1 	.word LINK 
                           001D48     2 	LINK=.
      009DC8                          3 GOSUB:
      009DC8 05                       4 	.byte 5 	
      009DC9 47 4F 53 55 42           5 	.ascii "GOSUB"
      009DCE 97 38                    6 	.word gosub 
      001D50                       4998 	_dict_entry,4,GOTO,goto 
      009DD0 9D C8                    1 	.word LINK 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 100.
Hexadecimal [24-Bits]



                           001D52     2 	LINK=.
      009DD2                          3 GOTO:
      009DD2 04                       4 	.byte 4 	
      009DD3 47 4F 54 4F              5 	.ascii "GOTO"
      009DD7 97 2B                    6 	.word goto 
      001D59                       4999 	_dict_entry,3,FOR,for 
      009DD9 9D D2                    1 	.word LINK 
                           001D5B     2 	LINK=.
      009DDB                          3 FOR:
      009DDB 03                       4 	.byte 3 	
      009DDC 46 4F 52                 5 	.ascii "FOR"
      009DDF 96 34                    6 	.word for 
      001D61                       5000 	_dict_entry,2,TO,to
      009DE1 9D DB                    1 	.word LINK 
                           001D63     2 	LINK=.
      009DE3                          3 TO:
      009DE3 02                       4 	.byte 2 	
      009DE4 54 4F                    5 	.ascii "TO"
      009DE6 96 5E                    6 	.word to 
      001D68                       5001 	_dict_entry,4,STEP,step 
      009DE8 9D E3                    1 	.word LINK 
                           001D6A     2 	LINK=.
      009DEA                          3 STEP:
      009DEA 04                       4 	.byte 4 	
      009DEB 53 54 45 50              5 	.ascii "STEP"
      009DEF 96 8E                    6 	.word step 
      001D71                       5002 	_dict_entry,4,NEXT,next 
      009DF1 9D EA                    1 	.word LINK 
                           001D73     2 	LINK=.
      009DF3                          3 NEXT:
      009DF3 04                       4 	.byte 4 	
      009DF4 4E 45 58 54              5 	.ascii "NEXT"
      009DF8 96 B6                    6 	.word next 
      001D7A                       5003 	_dict_entry,6+FFUNC,UBOUND,ubound 
      009DFA 9D F3                    1 	.word LINK 
                           001D7C     2 	LINK=.
      009DFC                          3 UBOUND:
      009DFC 86                       4 	.byte 6+FFUNC 	
      009DFD 55 42 4F 55 4E 44        5 	.ascii "UBOUND"
      009E03 93 97                    6 	.word ubound 
      001D85                       5004 	_dict_entry,6,RETURN,return 
      009E05 9D FC                    1 	.word LINK 
                           001D87     2 	LINK=.
      009E07                          3 RETURN:
      009E07 06                       4 	.byte 6 	
      009E08 52 45 54 55 52 4E        5 	.ascii "RETURN"
      009E0E 97 83                    6 	.word return 
      001D90                       5005 	_dict_entry,4+FFUNC,PEEK,peek 
      009E10 9E 07                    1 	.word LINK 
                           001D92     2 	LINK=.
      009E12                          3 PEEK:
      009E12 84                       4 	.byte 4+FFUNC 	
      009E13 50 45 45 4B              5 	.ascii "PEEK"
      009E17 96 03                    6 	.word peek 
      001D99                       5006 	_dict_entry,4,POKE,poke 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 101.
Hexadecimal [24-Bits]



      009E19 9E 12                    1 	.word LINK 
                           001D9B     2 	LINK=.
      009E1B                          3 POKE:
      009E1B 04                       4 	.byte 4 	
      009E1C 50 4F 4B 45              5 	.ascii "POKE"
      009E20 95 F0                    6 	.word poke 
      001DA2                       5007 	_dict_entry,5,INPUT,input_var  
      009E22 9E 1B                    1 	.word LINK 
                           001DA4     2 	LINK=.
      009E24                          3 INPUT:
      009E24 05                       4 	.byte 5 	
      009E25 49 4E 50 55 54           5 	.ascii "INPUT"
      009E2A 95 13                    6 	.word input_var 
      009E2C                       5008 kword_dict:
      001DAC                       5009 	_dict_entry 3,LET,let 
      009E2C 9E 24                    1 	.word LINK 
                           001DAE     2 	LINK=.
      009E2E                          3 LET:
      009E2E 03                       4 	.byte 3 	
      009E2F 4C 45 54                 5 	.ascii "LET"
      009E32 93 A5                    6 	.word let 
                                   5010 	
                                   5011 
      009E80                       5012 	.bndry 128 ; align on FLASH block.
                                   5013 ; free space for user application  
      009E80                       5014 user_space:
      009E80 89               [ 2] 5015 	pushw x 
      009E81 72 1A 50 0A      [ 1] 5016 	bset PC_ODR,#5 
      009E85 85               [ 2] 5017 	popw x 
      009E86 CD 9B DE         [ 4] 5018 	call pause02 
      009E89 72 1B 50 0A      [ 1] 5019 	bres PC_ODR,#5 
      009E8D 81               [ 4] 5020 	ret
                                   5021 
                                   5022 	.area FLASH_DRIVE (ABS)
      010000                       5023 	.org 0x10000
      010000                       5024 fdrive:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 102.
Hexadecimal [24-Bits]

Symbol Table

    .__.$$$.=  002710 L   |     .__.ABS.=  000000 G   |     .__.CPU.=  000000 L
    .__.H$L.=  000001 L   |   5 ABS        001CED R   |     ADC_CR1 =  005401 
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
    ARG_OFS =  000002     |   5 ASC        001CA8 R   |     ATTRIB  =  000002 
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
    BPTR    =  000005     |   5 BRES       001D10 R   |   5 BSET       001D07 R
    BSIZE   =  000005     |     BSP     =  000008     |   5 BTOGL      001D19 R
    BTW     =  000001     |   5 BYE        001C03 R   |     C       =  000001 
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
    CFG_GCR_=  000001     |     CFG_GCR_=  000000     |   5 CHAR       001CB0 R
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
  5 CRH        001C97 R   |   5 CRL        001C8F R   |     CTRL_A  =  000001 
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
    DBG_Y   =  000001     |   5 DDR        001C87 R   |     DEBUG   =  000001 
    DEBUG_BA=  007F00     |     DEBUG_EN=  007FFF     |   5 DEC        001CDB R
    DEST    =  000001     |     DEVID_BA=  0048CD     |     DEVID_EN=  0048D8 
    DEVID_LO=  0048D2     |     DEVID_LO=  0048D3     |     DEVID_LO=  0048D4 
    DEVID_LO=  0048D5     |     DEVID_LO=  0048D6     |     DEVID_LO=  0048D7 
    DEVID_LO=  0048D8     |     DEVID_WA=  0048D1     |     DEVID_XH=  0048CE 
    DEVID_XL=  0048CD     |     DEVID_YH=  0048D0     |     DEVID_YL=  0048CF 
  5 DIR        001C20 R   |     DIVIDND =  000007     |     DIVISR  =  000005 
    DM_BK1RE=  007F90     |     DM_BK1RH=  007F91     |     DM_BK1RL=  007F92 
    DM_BK2RE=  007F93     |     DM_BK2RH=  007F94     |     DM_BK2RL=  007F95 
    DM_CR1  =  007F96     |     DM_CR2  =  007F97     |     DM_CSR1 =  007F98 
    DM_CSR2 =  007F99     |     DM_ENFCT=  007F9A     |     DSTACK_S=  000040 
    EEPROM_B=  004000     |     EEPROM_E=  0047FF     |     EEPROM_S=  000800 
    ERR_BAD_=  00000A     |     ERR_CMD_=  000007     |     ERR_DIV0=  000004 
    ERR_DUPL=  000008     |     ERR_MATH=  000003     |     ERR_MEM_=  000001 
    ERR_NONE=  000000     |     ERR_NOT_=  000009     |     ERR_NO_A=  00000B 
    ERR_NO_L=  000005     |     ERR_RUN_=  000006     |     ERR_SYNT=  000002 
    ESC     =  00001B     |     EXTI_CR1=  0050A0     |     EXTI_CR2=  0050A1 
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
    FLASH_NF=  000005     |     FLASH_PU=  005062     |     FLASH_PU=  000056 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 104.
Hexadecimal [24-Bits]

Symbol Table

    FLASH_PU=  0000AE     |     FLASH_SI=  020000     |     FLASH_WS=  00480D 
    FLSI    =  01F400     |   5 FOR        001D5B R   |   5 FORGET     001C15 R
    FRUN    =  000000     |     FSIZE   =  000001     |     FSLEEP  =  000003 
    FTRAP   =  000001     |   5 GOSUB      001D48 R   |     GOS_RET =  000003 
  5 GOTO       001D52 R   |   5 GPIO       001C9F R   |     GPIO_BAS=  005000 
    GPIO_CR1=  000003     |     GPIO_CR2=  000004     |     GPIO_DDR=  000002 
    GPIO_IDR=  000001     |     GPIO_ODR=  000000     |     GPIO_SIZ=  000005 
  5 HEX        001CD3 R   |     HSECNT  =  004809     |     I2C_CCRH=  00521C 
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
    I2C_TRIS=  000011     |     I2C_WRIT=  000000     |   5 IDR        001C7F R
  5 IF         001D41 R   |     IN      =  000007     |     INCR    =  000001 
  5 INPUT      001DA4 R   |     INPUT_DI=  000000     |     INPUT_EI=  000001 
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
    IWDG_KR =  0050E0     |     IWDG_PR =  0050E1     |     IWDG_RLR=  0050E2 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 105.
Hexadecimal [24-Bits]

Symbol Table

  5 KEY        001CC2 R   |     LAST    =  000003     |     LB      =  000002 
    LED2_BIT=  000005     |     LED2_MAS=  000020     |     LED2_POR=  00500A 
    LEN     =  000005     |   5 LET        001DAE R   |     LINENO  =  000005 
  5 LINK    =  001DAE R   |   5 LIST       001C66 R   |     LL      =  000002 
    LLEN    =  000007     |     LL_HB   =  000001     |     LNO     =  000005 
    LN_PTR  =  000005     |   5 LOAD       001C28 R   |     MAJOR   =  000001 
    MASK    =  000002     |     MATH_OVF=  000000     |     MINOR   =  000000 
    MULOP   =  000005     |     N1      =  000001     |     N1_HB   =  000006 
    N1_LB   =  000007     |     N2      =  000003     |     N2_HB   =  000008 
    N2_LB   =  000009     |     NAFR    =  004804     |     NCLKOPT =  004808 
    NEG     =  000001     |   5 NEW        001C44 R   |   5 NEXT       001D73 R
    NFLASH_W=  00480E     |     NHSECNT =  00480A     |     NL      =  00000A 
    NLEN    =  000001     |     NOPT1   =  004802     |     NOPT2   =  004804 
    NOPT3   =  004806     |     NOPT4   =  004808     |     NOPT5   =  00480A 
    NOPT6   =  00480C     |     NOPT7   =  00480E     |     NOPTBL  =  00487F 
    NUBC    =  004802     |     NWDGOPT =  004806     |     NWDGOPT_=  FFFFFFFD 
    NWDGOPT_=  FFFFFFFC     |     NWDGOPT_=  FFFFFFFF     |     NWDGOPT_=  FFFFFFFE 
  5 NonHandl   000009 R   |   5 ODR        001C77 R   |     OP      =  000005 
    OPT     =  000002     |     OPT0    =  004800     |     OPT1    =  004801 
    OPT2    =  004803     |     OPT3    =  004805     |     OPT4    =  004807 
    OPT5    =  004809     |     OPT6    =  00480B     |     OPT7    =  00480D 
    OPTBL   =  00487E     |     OPTION_B=  004800     |     OPTION_E=  00487F 
    OPTION_S=  000080     |     OUTPUT_F=  000001     |     OUTPUT_O=  000000 
    OUTPUT_P=  000001     |     OUTPUT_S=  000000     |     OVFH    =  000001 
    OVFL    =  000002     |     PA      =  000000     |     PAD_SIZE=  000028 
  5 PAUSE      001CFD R   |     PA_BASE =  005000     |     PA_CR1  =  005003 
    PA_CR2  =  005004     |     PA_DDR  =  005002     |     PA_IDR  =  005001 
    PA_ODR  =  005000     |     PB      =  000005     |     PB_BASE =  005005 
    PB_CR1  =  005008     |     PB_CR2  =  005009     |     PB_DDR  =  005007 
    PB_IDR  =  005006     |     PB_ODR  =  005005     |     PC      =  00000A 
    PC_BASE =  00500A     |     PC_CR1  =  00500D     |     PC_CR2  =  00500E 
    PC_DDR  =  00500C     |     PC_IDR  =  00500B     |     PC_ODR  =  00500A 
    PD      =  00000F     |     PD_BASE =  00500F     |     PD_CR1  =  005012 
    PD_CR2  =  005013     |     PD_DDR  =  005011     |     PD_IDR  =  005010 
    PD_ODR  =  00500F     |     PE      =  000014     |   5 PEEK       001D92 R
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
    PI_ODR  =  005028     |   5 POKE       001D9B R   |     PREV    =  000001 
  5 PRINT      001D37 R   |     PROD    =  000002     |     PSIZE   =  000001 
  5 QKEY       001CB9 R   |     RAM_BASE=  000000     |     RAM_END =  0017FF 
    RAM_SIZE=  001800     |   5 REG_A      0008BD R   |   5 REG_CC     0008C2 R
  5 REG_EPC    0008AD R   |   5 REG_SP     0008C8 R   |   5 REG_X      0008B8 R
  5 REG_Y      0008B3 R   |     RELOP   =  000005     |   5 REMARK     001D2C R
    RETL1   =  000001     |   5 RETURN     001D87 R   |   5 RND        001CF5 R
    ROP     =  004800     |     RST_SR  =  0050B3     |   5 RUN        001C5E R
    RXCHAR  =  000001     |     R_A     =  000007     |     R_CC    =  000008 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 106.
Hexadecimal [24-Bits]

Symbol Table

    R_X     =  000005     |     R_Y     =  000003     |   5 SAVE       001C31 R
    SDIVD   =  000002     |     SFR_BASE=  005000     |     SFR_END =  0057FF 
    SHARP   =  000023     |   5 SHOW       001C55 R   |     SIGN    =  000001 
  5 SIZE       001CCA R   |     SKIP    =  000006     |   5 SLEEP      001C0B R
    SPACE   =  000020     |     SPI_CR1 =  005200     |     SPI_CR2 =  005201 
    SPI_CRCP=  005205     |     SPI_DR  =  005204     |     SPI_ICR =  005202 
    SPI_RXCR=  005206     |     SPI_SR  =  005203     |     SPI_TXCR=  005207 
    SQUOT   =  000001     |     SRC     =  000003     |     STACK_EM=  0017FF 
    STACK_SI=  000080     |   5 STATES     000870 R   |   5 STEP       001D6A R
  5 STOP       001C4C R   |     SWIM_CSR=  007F80     |     TAB     =  000009 
    TAB_WIDT=  000004     |     TCHAR   =  000001     |     TEMP    =  000003 
    TIB_SIZE=  000050     |     TICK    =  000027     |   5 TICKS      001CE3 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 107.
Hexadecimal [24-Bits]

Symbol Table

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
    TK_SHARP=  000009     |     TK_VAR  =  000002     |   5 TO         001D63 R
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 108.
Hexadecimal [24-Bits]

Symbol Table

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
  5 UBOUND     001D7C R   |   5 USER_ABO   000083 R   |   5 USR        001C6F R
    USR_BTN_=  000004     |     USR_BTN_=  000010     |     USR_BTN_=  005015 
  5 UserButt   000025 R   |     VSIZE   =  000002     |     VT      =  00000B 
  5 WAIT       001D23 R   |     WDGOPT  =  004805     |     WDGOPT_I=  000002 
    WDGOPT_L=  000003     |     WDGOPT_W=  000000     |     WDGOPT_W=  000001 
    WIDTH   =  000001     |   5 WRITE      001C3A R   |     WWDG_CR =  0050D1 
    WWDG_WR =  0050D2     |     XMASK   =  000001     |     XSAVE   =  000001 
    YSAVE   =  000003     |   5 abs        001B6D R   |   1 acc16      000009 R
  1 acc24      000008 R   |   1 acc8       00000A R   |   5 accept_c   000A7B R
  5 add        001049 R   |   5 ansi_seq   000A39 R   |   5 arg_list   001170 R
  1 array_ad   000020 R   |   1 array_si   000022 R   |   5 ascii      001A84 R
  5 at_tst     000D56 R   |   5 atoi       000E8F R   |   5 atoi_exi   000EFD R
  5 bad_port   001AF5 R   |   1 base       000007 R   |   1 basicptr   000003 R
  5 bin_exit   000C4E R   |   5 bit_rese   001547 R   |   5 bit_set    001533 R
  5 bit_togg   00155C R   |   5 bkslsh_t   000D01 R   |   5 bksp       00023A R
  5 bye        001B40 R   |   5 char       001A67 R   |   5 clear_ba   00057F R
  5 clear_va   00046A R   |   5 clock_in   00009E R   |   5 cmd_itf    000A9F R
  5 cmp_name   001835 R   |   5 cold_sta   0004E4 R   |   5 colon_ts   000D2A R
  5 comma_ts   000D35 R   |   5 convert_   000BB4 R   |   1 count      000002 R
  5 cp_loop    00111C R   |   5 create_g   0003BF R   |   5 cstk_pro   001000 R
  5 dash_tst   000D4B R   |   5 ddrop      000F82 R   |   5 ddrop_n    0010F4 R
  5 ddup       000F8B R   |   5 dec_base   001308 R   |   5 del_back   000A6C R
  5 del_line   000390 R   |   5 del_ln     000A5D R   |   5 delete     00024A R
  5 dir_loop   0019F5 R   |   5 director   0019E9 R   |   5 divide     00109F R
  5 divu24_8   0009C6 R   |   5 dotr       001009 R   |   5 dotr_loo   001017 R
  5 dots       000FD0 R   |   5 dpick      000F9C R   |   5 dpop       000F5B R
  5 dpush      000F4E R   |   3 dstack     001740 R   |   3 dstack_u   001780 R
  5 dstk_pro   000FC6 R   |   1 dstkptr    000019 R   |   5 dswap      000F68 R
  5 empty      0013D3 R   |   5 eql_tst    000DB8 R   |   5 erase_bl   000120 R
  5 erase_en   00010C R   |   5 erase_fl   000146 R   |   5 erase_st   0000E1 R
  5 err_bad_   000660 R   |   5 err_cmd_   000621 R   |   5 err_div0   0005E3 R
  5 err_dupl   00063C R   |   5 err_math   0005C9 R   |   5 err_mem_   0005AC R
  5 err_msg    000594 R   |   5 err_no_a   00066D R   |   5 err_no_l   0005F3 R
  5 err_not_   00064E R   |   5 err_run_   00060A R   |   5 err_synt   0005BA R
  5 execute    001107 R   |   5 expect     001163 R   |   5 expr_exi   0012A9 R
  5 expressi   001268 R   |   5 factor     0011C7 R   |   1 farptr     000013 R
  7 fdrive     010000 R   |   5 fetch      000FAB R   |   5 fetchc     000B6C R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 109.
Hexadecimal [24-Bits]

Symbol Table

  1 ffree      000016 R   |   5 ffree_ms   00181B R   |   5 file_cou   001A42 R
  5 final_te   000A33 R   |   5 first_li   001378 R   |   1 flags      000024 R
  5 for        0015B4 R   |   5 forget     00199A R   |   1 free_ram   00005A R
  5 get_arra   001194 R   |   5 get_tick   001B67 R   |   5 get_toke   000C9B R
  5 getc       000227 R   |   5 go_commo   0016DB R   |   5 gosub      0016B8 R
  5 goto       0016AB R   |   5 gpio       001ABA R   |   5 gt_tst     000DC3 R
  5 hex_base   001303 R   |   5 hse_cloc   000207 R   |   5 hsi_cloc   000211 R
  5 if         0015A0 R   |   1 in         000001 R   |   1 in.w       000000 R
  1 in.w.sav   000011 R   |   5 incr_far   001776 R   |   5 input_ex   001504 R
  5 input_lo   00149F R   |   5 input_va   001493 R   |   5 insert_l   0003F0 R
  5 insert_l   000467 R   |   5 interp     000721 R   |   5 interp_l   000767 R
  5 invalid    000AD4 R   |   5 invalid_   000B42 R   |   5 is_alpha   000478 R
  5 is_digit   000E56 R   |   5 itoa       00097F R   |   5 itoa_loo   000997 R
  5 key        001AA8 R   |   5 kword_di   001DAC R   |   5 kword_en   001C01 R
  5 last_lin   001381 R   |   5 ledoff     0007A8 R   |   5 ledon      0007A3 R
  5 ledtoggl   0007AD R   |   5 left_arr   000A39 R   |   5 left_par   0007B6 R
  5 let        001325 R   |   5 let02      00132F R   |   1 lineno     000005 R
  5 lines_sk   001386 R   |   5 list       00134D R   |   5 list_exi   0013D0 R
  5 list_sta   0013A9 R   |   5 load       00193D R   |   5 loop_bac   00167E R
  1 loop_dep   00001F R   |   5 loop_don   001699 R   |   5 lt_tst     000DFC R
  5 mem_peek   000AF0 R   |   5 modulo     0010E3 R   |   5 move       00031E R
  5 move_cod   00010C R   |   5 move_dow   00033C R   |   5 move_exi   00035E R
  5 move_loo   000341 R   |   5 move_up    00032E R   |   5 multiply   001057 R
  5 mulu24_8   000F01 R   |   5 nbr_tst    000CD7 R   |   5 neg_acc2   0009EE R
  5 new        00176B R   |   5 next       001636 R   |   5 no_match   00112E R
  5 none       000C9B R   |   5 number     000B72 GR  |   5 other      000E34 R
  3 pad        001718 R   |   5 parse_bi   000C2E R   |   5 parse_in   000BF3 R
  5 parse_ke   000C56 R   |   5 parse_qu   000B79 R   |   5 parser_i   000916 GR
  5 pause      001B54 R   |   5 pause02    001B5E R   |   5 peek       001583 R
  5 peek_byt   000B0C R   |   5 plus_tst   000D8C R   |   5 poke       001570 R
  5 port_cr1   001B0C R   |   5 port_cr2   001B12 R   |   5 port_ddr   001B06 R
  5 port_idr   001B00 R   |   5 port_odr   001AFA R   |   5 prcnt_ts   000DAD R
  5 print      001402 R   |   5 print_ex   00145D R   |   5 print_fa   000B51 R
  5 print_in   000923 R   |   5 print_re   00081D R   |   5 print_st   000AE4 R
  5 prt_basi   0013E4 R   |   5 prt_loop   001406 R   |   5 prt_peek   0002CE R
  5 prt_reg1   0007E9 R   |   5 prt_reg8   0007C1 R   |   5 prt_regs   000264 R
  5 prti24     0008CE R   |   5 putc       00021E R   |   5 puts       000230 R
  5 qkey       001AB0 R   |   5 qmark_ts   000D61 R   |   5 random     001B8D R
  5 readln     000A11 R   |   5 readln_l   000A17 R   |   5 readln_q   000A90 R
  5 regs_sta   0002A7 R   |   5 rel_exit   001300 R   |   5 relation   0012AC R
  5 rem        001507 R   |   5 repl       000AAD R   |   5 repl_exi   000AD1 R
  5 reprint    000A39 R   |   5 reset_co   001404 R   |   5 rest_con   00147E R
  5 return     001703 R   |   5 right_ar   000A39 R   |   5 rparnt_t   000D1F R
  5 run        001727 R   |   5 save       0018A0 R   |   5 save_con   001469 R
  5 search_d   00110B R   |   5 search_e   00115F R   |   5 search_f   001856 R
  5 search_l   000361 R   |   5 search_l   00036C R   |   5 search_n   00110F R
  1 seedx      00000D R   |   1 seedy      00000F R   |   5 seek_fdr   001784 R
  5 sharp_ts   000D40 R   |   5 show       001041 R   |   5 size       00130D R
  5 skip       000F3B R   |   5 slash_ts   000DA2 R   |   5 sleep      001B49 R
  5 software   000489 R   |   5 spaces     000258 R   |   3 stack_fu   001780 R
  3 stack_un   001800 R   |   5 star_tst   000D97 R   |   5 step       00160E R
  5 stop       001759 R   |   5 store      000FB5 R   |   5 store_lo   001620 R
  5 str_matc   00113D R   |   5 str_tst    000CC6 R   |   5 strcmp     0002FF R
  5 strcpy     000310 R   |   5 strlen     0002F2 R   |   5 substrac   001051 R
  5 syntax_e   0006A1 R   |   1 tab_widt   000025 R   |   5 tb_error   0006A3 R
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 110.
Hexadecimal [24-Bits]

Symbol Table

  5 term       00121B R   |   5 term01     001224 R   |   5 term_exi   001265 R
  5 test_p     000ADC R   |   3 tib        0016C8 R   |   5 tick_tst   000D78 R
  1 ticks      00000B R   |   5 timer4_i   0000B4 R   |   5 to         0015DE R
  5 to_lower   000E5F GR  |   5 to_upper   000E6A GR  |   5 token_ch   000E43 R
  5 token_ex   000E53 R   |   1 txtbgn     00001B R   |   1 txtend     00001D R
  5 uart3_in   0001F4 R   |   5 uart3_se   000200 R   |   5 uart_ena   000219 R
  5 ubound     001317 R   |   5 unget_to   000FBF R   |   5 unlock_e   0000C5 R
  5 unlock_f   0000D3 R   |   5 upper      000E76 R   |   5 upper_lo   000E7A R
  5 user_spa   001E00 R   |   5 usr        001B18 R   |   5 usr_addr   0004CF R
  1 vars       000026 R   |   5 wait       001508 R   |   5 warm_sta   000701 R
  5 write      001A4A R   |   5 write_bl   0001D1 R   |   5 write_by   00015C R
  5 write_ee   000198 R   |   5 write_ex   0001CC R   |   5 write_fl   000182 R

ASxxxx Assembler V02.00 + NoICE + SDCC mods  (STMicroelectronics STM8), page 111.
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

